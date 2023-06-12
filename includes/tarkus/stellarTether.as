import classes.Characters.CaptainKhorgan;
import classes.Characters.CaptainKhorganMech;
import classes.Characters.GunTurrets;
import classes.Characters.Kaska;
import classes.Characters.PlayerCharacter;
import classes.Characters.RocketTurrets;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;
import classes.Util.InCollection;
import flash.sampler.NewObjectSample;
//If Dungeon not completed, add:
public function chasmfallBonusFunction():Boolean
{
	if(flags["STELLAR_TETHER_CLOSED"] == undefined)
	{
		if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] <= 0)
		{
			//Dungeon Done, Bosses Molestered, Bomb Disarmed
			//Play when PC goes back topside, play when stepping out of the elevator.
			//This assumes the PC won't be able to re-visit the dungeon. Which, logically, you wouldn't be since the place would be back to operating as usual.
			victoryCelebrationPCIsAwesomeGuyFuntimes();
			return true;
		}
		else if(flags["TAM_DISABLE_METHOD"] != undefined && flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0)
		{
			//Sod the Quest: Fucking off w/o Disarming the Bomb
			//PC must have defeated TamTam
			fuckOffWithoutDisarmingTheBomb();
			return true;
		}
		else
		{
			output("\n\n...At least, it should be.");
			output("\n\nAhead, you see half a dozen armored personnel carriers, all marked with the black-and-blue symbol of the U.G.C. Peacekeepers, parked a short way back from the edge of the sheer cliff. Several troops are milling about, all armed to the teeth with laser rifles and kitted up with heavy riot armor.");
			output("\n\nLooks like something’s up.");
			addButton(0,"Approach",approachUGCTroopers,undefined,"Approach","Find out what’s up.");
		}
	}
	else if(flags["STELLAR_TETHER_CLOSED"] == 1)
	{
		output("\n\nLooks like the place is sealed up pretty tightly now. There’s no getting back inside.");
	}
	return false;
}

public function completedStellarTetherGood():Boolean
{
	return flags["STELLAR_TETHER_CLOSED"] != undefined && flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] <= 0;
}

//[Approach]
public function approachUGCTroopers():void
{
	clearOutput();
	showName("U.G.C.\nTROOPERS");
	showBust("HORACE_DECKER");
	author("Savin");
	if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] == undefined)
	{
		flags["MET_UGC_TROOPER_AT_CHASMFALL"] = 1;
		output("You make your way forward towards the camp of Confederate troops parked ahead. Predictably, one of the Peacekeepers steps forward to challenge you. A grizzled older man chomping on a cigar, the Peacekeeper pulls down the rim of his sunglasses as you wander up, looking you up and down.");
		//CUT CONTENT. SAVIN NEVER WROTE DIS SHIT.
		//if PC talked to Anno:
		//<i>“Commander Dorna sent me,”</i> you say simply. <i>“The name’s Steele.”</i>
		//[The Mission]
		//else
		output("\n\n<i>“Who the hell do you think you are, " + pc.mf("boy","girl") + "?”</i> the officer growls, couching his rifle under an arm. <i>“Ain’t no sane fellow walks up to a bunch of troops on high alert.”</i>");
		output("\n\nYou shrug. <i>“I’m just looking around. What’s going on here?”</i>");
		output("\n\nThe veteran cocks an eyebrow at you, and mutters. <i>“Damn rushers,”</i> as he taps out his cigar onto the parched dirt.");
		output("\n\n<i>“Look, kid, see that station up ahead?”</i> he says, pointing to Tether station. <i>“There’s a shitload of pirates in there threatening to crack the planet back in half, finish what the goblins and kobo- er, gabilani and raskvel started ages ago. Why don’t you head back to Nova and get the hell out of here before you get sucked into space with the rest of us, huh?”</i>");
		output("\n\nThat’s a pretty cheery attitude.");
		processTime(2);
	}
	else
	{
		//Return, Dungeon not Done
		output("You return to the Peacekeeper blockade, and are greeted by the veteran U.G.C. trooper you met before. <i>“So, kid, what’ll it be?”</i>");
	}
	clearMenu();
	addButton(0,"CanIHelp?",canIHelpWithShittyJamesBondIntroductions,undefined,"Can I Help?","Maybe you can help out. This sounds serious.");
	addButton(14,"Leave",mainGameMenu);
}

//[Can I Help?]
public function canIHelpWithShittyJamesBondIntroductions():void
{
	clearOutput();
	showName("U.G.C.\nTROOPERS");
	showBust("HORACE_DECKER");
	author("Savin");
	output("<i>“Anything I can do to help?”</i> you venture. <i>“The name’s Steele. [pc.name] Steele.”</i>");
	output("\n\n<i>“Steele?”</i> the vet asks, clearly surprised. <i>“Oh, don’t tell me you’re one of Vic’s little snots, are you?”</i>");
	output("\n\n<i>“Hey, I--”</i>");
	output("\n\n<i>“I’m joshing you, kid. Used to work security for your old man, back during the Strike of ‘10.”</i> He sighs, wiping the sweat from his brow. <i>“Look, kid, you wanna help? If you’re half the " + pc.mf("man","woman") + " Vic was -- hell, a quarter, even -- we could use you. It won’t be a walk in the park, though, kid, so you better be ready for this. No room for screw-ups today.”</i>");
	//[The Mission] [Leave]
	clearMenu();
	addButton(0,"Handle It",askAUGCTroopAboutStellarTetherMission,undefined,"Handle It","Handle this yourself. A few pirates are no match for you!");
	addButton(14,"Leave",mainGameMenu);
}

//[The Mission]
public function askAUGCTroopAboutStellarTetherMission():void {
	clearOutput();
	showName("HORACE\nDECKER");
	showBust("HORACE_DECKER");
	author("Savin");
	output("<i>“Good to have you onboard, kid,”</i> the old man says, walking you into the heart of the encampment. <i>“The name’s Horace, by the way. Sergeant Horace Decker.”</i>");
	output("\n\nSgt. Decker gives you a firm handshake, his grip just about crushing your hand. Strong in his old age! Several of the troops standing around give you respectful nods as you step into one of the APCs. At a touch from the sergeant, a holo-map of the facility and the Chasm appear between you.");
	output("\n\n<i>“Here’s the situation: a group of pirates, a splinter group from the Black Void near as we can tell, have taken up residence inside the Tether station here. I don’t know what their game is -- they haven’t made any demands, except that we keep clear. What they DO have is a bomb, and a big one: Command’s got radiological alarms going off like you wouldn’t believe. Worse, they’ve locked down the cargo lift that goes down to the station at the planetary core, and are threatening to blow the place if we try and go down. I’ve got twenty good SWAT troopers out here sitting on their asses, and there’s not a lot we can do about it. We’ve got orders to sit tight, straight from the top.”</i>");
	output("\n\n<i>“A lone operator, though... well, I don’t think me or my troops here would say anything if Steele Jr. here wandered up to the lift control station, here on the rift edge,”</i> he says, pointing toward the building ahead. <i>“There’s a pirate in there keeping watch. Bunch of gun turrets and drones set up inside, like she repurposed the station’s auto-defenses against us. Fight or sneak your way to the control center, override the lift controls, and you’ve got a straight shot into the core. Pirates’ll never know what hit ‘em.”</i>");
	output("\n\nYou take a moment to familiarize yourself with the blueprints and other details for the twin stations before nodding to the sergeant and stepping out. You know what you have to do.");
	processTime(4);
	//Move PC forward. Set up rooms so next room is a one-way back.
	clearMenu();
	addButton(0,"Next",move,"351");
}

public function tamWolfBustDisplay(mode:int = 1):String
{
	var bustName:String = "TAMWOLF";
	
	if(mode == 0) bustName += "_DAMAGED";
	if(mode == 2) bustName += "_II";
	
	return bustName;
}
// Tamwolf Check function
public function hasTamWolfOnSelf():Boolean
{
	if (pc.hasTamWolf() || pc.hasItemByClass(TamWolf) || pc.hasItemByClass(TamWolfDamaged) || pc.hasItemByClass(TamWolfII)) return true;
	return false;
}

//The Lift Station: Forward
public function liftStationBonus():Boolean
{
	//Text on Entering, First Time:
	if(flags["FOUGHT_TAM"] == undefined)
	{
		showName("\nTURRETS");
		showBust("TAMTAM")
		author("Savin");
		output("\n\nYou make your way to the lift station, sitting precariously on the side of the rift. A pair of glass double doors slide open automatically as you approach, admitting you entrance... right into the barrels of a dozen auto-turrets. Welp.");
		output("\n\nFrom behind the welcome desk, a pink-haired kaithrit cat-girl pops up, a great big goofy grin on her face. <i>“Surprise!”</i> she announces as the turrets level on your chest. <i>“I told your stupid sergeant not to mess with me, didn’t I? Well, he should have listened... I’m more dangerous than I look, you know! Go get " + pc.mf("him","her") + ", boys!”</i>");
		output("\n\nShit! You dive aside as the turrets light up, blasting the space you occupied a second ago with a thousand rounds of ammo. The cat-girl herself joins in the fun, whipping out a laser pistol and firing a few shots after you as you tumble into cover behind a flimsy looking couch, which is quickly torn to shreds over you as you duck down beneath a hail of fire. A moment later, the gunfire dies down, and the kaithrit makes an audible huff. You poke your head up, [pc.rangedWeapon] ready.");
		output("\n\n<i>“Aww, you didn’t die!”</i> she pouts over the sound of her laser recharging. <i>“Come on out and play already!”</i>");
		output("\n\nDoesn’t look like you’re getting out of this one too easy.");
		processTime(1);
		//Start fight!
		
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new GunTurrets());
		CombatManager.victoryScene(tamtamGetsPunkedByPCs);
		CombatManager.lossScene(tamtamBadEndPetPooch);
		CombatManager.displayLocation("TURRETS");
			
		clearMenu();
		addButton(0,"Next", CombatManager.beginCombat);
		flags["FOUGHT_TAM"] = 1;
		return true;
	}
	else 
	{
		author("Savin");
		output("\n\nYou’re surrounded by debris from your fight with the cat-girl’s drones: the floor is littered with drone parts and scattered bits of armor plating and wire. The walls are covered with bullet holes and carbon burns from laser fire: it looks like a war zone in here.\n\n<b>If you cross past the barricade to the west again, you might not be able to come back.</b>");
	}
	//If you don't know about the bomb, oh shit.
	if(flags["TARKUS_BOMB_TIMER"] == undefined && flags["TAM_DISABLE_METHOD"] != undefined)
	{
		if(bombAlertBonusFunction()) return true;
	}
	return false;
}

//Tam-Tam: Player Victory!
public function tamtamGetsPunkedByPCs():void
{
	author("Savin");
	showBust("TAMTAM", tamWolfBustDisplay(0));
	output("<i>“Get " + pc.mf("him","her") + " Tam-wolf! I believe in you!”</i> the cat-girl, Tam, cheers as her cyberhound advances on you, growling. When it lunges, though, one of its legs snaps audibly, and the drone tumbles to the ground in a lump.");
	output("\n\n<i>“NOOOO! TAM-WOLF!”</i> Tam shrieks, rushing forward and grabbing the malfunctioning drone, cradling his head. <i>“You... you monster! What did you do to my poor Tam-wolf?”</i>");
	output("\n\nBefore you can say a word, the remaining turrets -- what few are left -- open up, forcing you to dive into cover as the cat-girl retreats into the back room, dragging her attack drone and cursing up a storm at you. A few well-placed swings take out the last of the turrets, leaving you standing in the room amid a decimated army of drones and gun-turrets and a sea of shell casings. Your ears are ringing, but at least you’re alive....");
	output("\n\nNow to deal with the cat-girl....\n\n");
	CombatManager.genericVictory();
}

//Lift Station: Engineering Deck
public function liftStationEngineeringDeckBonusFunc():Boolean
{
	author("Savin");
	
	//Upon entering, first time:
	if(flags["TAM_DISABLE_METHOD"] == undefined)
	{
		clearOutput();
		showBust("TAMTAM");
		showName("\nTAM");
		output("You quietly push open the door to Engineering, leading with your [pc.rangedWeapon], wary of ambush. A short, curved flight of stairs take you down just below the surface, into a room full of gently-rumbling machines, powering the Lift Station... but not the lift, you see. You take a moment to scan the room before your eyes alight on the lift control panel, currently blinking red... and right below it sits Tam.");
		output("\n\nThe cat-girl is currently hunched over a workbench, desperately working on the damaged wolf-drone, also named Tam. Apparently. She doesn’t seem to notice you, or care if she does. For the first time, you’re able to get a good look at the crazy kitty: she’s slim but buxom, as is common for her race, with a pair of EE-cups hanging heavily inside her greasy T-shirt, swaying free with her every motion. She’s got a nice, rounded ass, currently sticking straight up in the air as she works, guarded by nothing put a pair of low-riding jean shorts that are doing a poor job of keeping her modest, and a pair of swishing pink tails. It wouldn’t take much to just yank those shorts down and have your way with her... and without any drones left, you doubt she could stop you.");
		clearMenu();
		addButton(0,"Knock Out",knockOutTamtam,undefined,"Knock Out","Club her upside the head before she knows what’s going on. It may not be the most honorable choice, but it is the safest.");
		if(pc.lust() >= 33) addButton(1,"Fuck Her",fuckTamTamIntoUnconscitude,undefined,"Fuck Her","With her ass sticking up in the air like that, she’s practically begging for it. She seems like the type that might prefer that to a conk on the head.");
		else addDisabledButton(1,"Fuck Her","Fuck Her","You aren’t aroused enough to be interested in this.");
		return true;
	}
	
	if(flags["TAM_DISABLE_METHOD"] == undefined) output("RED, preventing you from descending.");
	else output("GREEN, enabling you to take the elevator down to the rift station at the planet’s core.");

	output("\n\nTam-Tam is ");
	if(flags["TAM_DISABLE_METHOD"] == undefined) output("hunched over her robotic hound, desperately trying to undo the damage you’ve done");
	else if(flags["TAM_DISABLE_METHOD"] == 1) output("knocked out and chained up, her wrists affixed to one of the engines by a set of chains");
	else 
	{
		if(flags["TAKEN_TAMWOLF"] == undefined) output("snoozing peacefully, taking herself a little cat-nap atop her damaged attack drone, enjoying the afterglow of your... intimate intervention");
		else output("snoozing peacefully, taking herself a little cat-nap on the floor, enjoying the afterglow of your... intimate intervention");
	}
	output(".");
	
	return false;
}

//Knock Out
public function knockOutTamtam():void
{
	clearOutput();
	author("Savin");
	showBust("TAMTAM");
	showName("\nTAM");
	//+Hard
	pc.addHard(2);
	output("A quick check around the room reveals a great big stonking wrench sitting within an arm’s reach. You pick it up, and approach the cat-girl. As she’s working, she doesn’t bother to look up as you near her. <i>“Kaska, is that you? Oh thank god, there was this crazy " + pc.mf("guy","bitch") + " and " + pc.mf("he","she") + " was shooting the place up and then Tam-wolf got hit and...”</i>");
	output("\n\n<i>BONK!</i>");
	output("\n\nThe cat-girl slumps limply to the floor, a nice shiner left on her scalp. Ouch! You grab some nearby chains and fasten a restraint for her, just in case she wakes up. The wolf drone growls weakly at you as you work, but with his compartments open and a leg busted, he’s in no position to oppose you as you tie his mistress up and flip the controls for the lift. Time to head down!");
	flags["TAM_DISABLE_METHOD"] = 1;
	//[Next]
	clearMenu();
	addButton(0,"Next",takeTamWulf);
}

//Fuck Her
public function fuckTamTamIntoUnconscitude():void
{
	clearOutput();
	author("Savin");
	showBust("TAMTAM_NUDE");
	showName("\nTAM");
	flags["TAM_DISABLE_METHOD"] = 2;
	output("A lusty grin spreads across your face as you approach the seemingly unaware cat-girl, your eyes transfixed by her booty. She wiggles it as she works, tails swaying and lifting as you approach, almost invitingly.");
	output("\n\n<i>“Kaska, is that you?”</i> she whimpers over her shoulder, still not looking up. <i>“Oh thank god, there was this crazy " + pc.mf("guy","bitch") + " and " + pc.mf("he","she") + " was shooting the place up and then Tam-wolf got hit and... and...”</i>");
	output("\n\nHer voice trails off as you plant your hands on her ass, kneading her big, soft cheeks in your grip. The cat-girl shudders, tails lifting straight up in perfect submission as you toy with her behind, slowly working your way towards pulling her shorts down. When your fingers lace in through her belt, Tam giggles girlishly, one of her pink tails wrapping around your neck.");
	output("\n\n<i>“Hmm... I was wondering when the captain might let you come check up on me. But, um... shouldn’t you go check on that " + pc.mf("guy","girl") + " up front, though? " + pc.mf("He","She") + " might not be dead...”</i>");
	output("\n\nYou give her a smack on the ass, and the cat-girl gives a pleasured little yelp. <i>“Eeep! Oh, fine, Kaska! Just let me keep working... I could use something to take my mind off poor Tam-wolf here.”</i>");
	output("\n\nTam wiggles her booty as you slip her pants off, revealing the soft, sheer curves of her ass and the glistening, slick slit between her cheeks, already starting to bead with moisture as you slip a finger down between her legs. Tam purrs happily, barely holding onto her tools as you slip down onto your [pc.knees], burying your face in the cat-girl’s pussy. She squeals delightedly, tails wrapping around your neck to lock you in position as she pushes back against you, her sex slipping down the length of your nose until the bud of her clit brushes your lips. You latch on, suckling the cat’s pleasure buzzer up and teasing it ever so gently between your teeth, sending visible shockwaves of pleasure up the cat’s spine. Moving up the lips of her pussy, you let your tongue dart out, spreading her folds to taste her sweet kaithrit juices -- and sweet they are. Tam’s practically a faucet after you teased her clit, and you soon have a faceful of excitement rubbing up against you, begging for more. Your tongue probes in, licking up the sensitive inner walls of her vulva, teasing and caressing the folds of her womanhood until she’s panting and gasping, moaning with every movement you make.");
	output("\n\n<i>“God, you’re... oh, yeah... you’re such a tease...”</i> the cat whines, reaching a hand back from her work to spread her cheeks a little more around your probing face. You answer that by reaching forward and tugging at her loose-fitting T-shirt; a few nudges give her the idea, and she quickly pulls off her top, leaving her all but naked and at your mercy. More importantly, it leaves her tits bare, big and perky, hanging low as she bends over her damaged drone. You reach up and grab one of the big, soft mounds, squeezing it just hard enough to make its owner gasp, tails tightening around your throat until you’re afraid she might choke you.");
	output("\n\nMoaning softly, the cat-girl finally gives up any pretense of working on Tam-wolf. She plants her hand over yours, humping back against your tongue and groping at her tits, squeezing and twisting her nipple until it’s a rigid point at the top of her teat, flushed with red.");
	output("\n\nAfter a few more minutes of this, you can’t take it anymore: the lust building your loins is almost painful");
	if(pc.lust() >= 75 && pc.hasCock()) output(", and your cock is threatening to burst from your [pc.armor] if you don’t get some relief");
	output(". Tam doesn’t seem much better off: she’s biting her lip, trying not to moan too loudly as you eat her out; her tails are twitching spasmically, brushing at your cheeks and trying desperately to pull you deeper into her sodden box. Finally, the cat-girl shifts forward, hiking a leg up onto the workbench and bracing her hands against the wall, leaving her pussy wide open to you.");
	output("\n\n<i>“Stop teasing me already, Kaska... just put it in already... please...”</i> she whines, reaching back to finger herself, squeezing her eyes shut in anticipation.");
	output("\n\nShe hasn’t figured out you’re the wrong person yet, but this Kaska apparently has a dick. And if the give in this girl’s cunt is any indication, probably a big one.");
	if(pc.hasCock()) output(" Think you’re up to filling Kaska’s shoes? Then again, there’s a wrench nearby with a great big, thick handle... that might do the trick, if you don’t mind being horny a while longer.");
	else output(" You, however, don’t. Luckily, there’s a wrench nearby with a great big, thick handle... that might do the trick, if you don’t mind being horny a while longer.");
	pc.changeLust(10);
	processTime(7);
	clearMenu();
	addButton(0,"Use Wrench",wrenchTamtamsCooch,undefined,"Use Wrench","Stuff that wrench where it doesn’t belong. She’s wet enough that it won’t matter.");
	if(pc.hasCock()) addButton(1,"Use Dick",stickItInZeCatgirlCoochWhileSheThinksYerKaska,undefined,"Use Dick","Well, she’s asking for it.");
	else addDisabledButton(1,"Use Dick","Use Dick","You need a penis for this option.");
}

//Use the Wrench
public function wrenchTamtamsCooch():void
{
	clearOutput();
	author("Savin");
	showBust("TAMTAM_NUDE");
	showName("\nTAM");
	output("Giving Tam’s pussy one last, long slurp, you grab the wrench from nearby and press the blunted end of the handle into the gaping lips of her hole. The cat-girl shudders in excitement, her juices now running freely down her thighs as she gently presses back against the handle, eager for more. You try to stifle a chuckle as you guide the handle in: Tam gasps, back arching as the shaft penetrates her, sliding easily in through her well-lubed lips.");
	output("\n\n<i>“Oh, god... so big...”</i> she moans, bracing against the desk as you put more and more wrench into her. <i>“Mmmm, when did you get that THICK, chief? Never mind, just keep doing it. Oh, that’s it... just like that...”</i>");
	output("\n\nShe purrs contentedly as you slowly fuck the wrench into her, screwing it into her socket until it’s practically buried to the hilt (or rather, head!) inside her. Tam’s belly is bulging with the sheer size of it, but that doesn’t deter her for a second. Man, kaithrit are built to take ‘em!");
	output("\n\n<i>“Mmm, somebody’s been getting into that Throbb we pulled, huh? I looooove it,”</i> she moans, back arching as you start to slide the shaft out of her. <i>“You’re being so gentle today... oh, when’re you gonna get to the rough stuff, huh? I wanna test this new dick of yours out for real!”</i>");
	output("\n\nOh, lord. You try and suppress a giggle as you man-handle her pussy open, starting to move the wrench faster. Another deep thrust turns Tam’s voice into a howling moan of pleasure, and once the levy breaks, there’s no stopping it. The lusty cat-girl’s moans and whimpers echo through the room as you pound the handle into her now-gaping pussy, watching as she thrusts back against it, spattering your wrist and her thighs with girl-cum as she rockets toward orgasm. The rougher you fuck her, the louder her cries get until they all just melt into one long, shrieking scream of pleasure as her cunt clamps around the handle, milking it for all it’s worth as she cums.");
	output("\n\nHer orgasm drags out for what seems like an eternity of whimpers, sighs, and gasps as she rides the wrench until your arm is sore. When she finally comes down off her orgasmic high, Tam leans back and stretches her arms, yawning contentedly.");
	output("\n\n<i>“Mmm, that was great, chief... you really know how to make a girl feel loved!”</i>");
	output("\n\nThe cat reaches back, gives you a peck on the cheek, and flops down on her work bench, asleep before she hit the surface. Talk about a cat-nap. You shrug and leave the wrench haft-deep in her pussy, still dripping her juices onto the concrete beneath her feet. Before you leave, you reach up and flip the elevator switch, turning it from Danger Red to Good-to-Go Green. Planetary core, here you come.");
	pc.changeLust(5);
	processTime(9);
	clearMenu();
	addButton(0,"Next",takeTamWulf);
}

//Dick Fuck
public function stickItInZeCatgirlCoochWhileSheThinksYerKaska():void
{
	clearOutput();
	author("Savin");
	showBust("TAMTAM_NUDE");
	showName("\nTAM");
	var x:int = pc.cockThatFits(500);
	if(x < 0) x = pc.smallestCockIndex();
	output("She asked for it! You fumble with your [pc.gear], pulling it off piece by piece until you’re able to flop your [pc.cock " + x + "] down onto the arch of Tam’s back. She gasps happily as your prick drops down, and her tails quickly catch and wrap it, both wriggling, fuzzy lengths curling around your [pc.cock " + x + "] until it’s just a great big fuzzy package. She’s got remarkable control over those tails of hers, and with a wiggle of her booty she puts them to use massaging your prick, squeezing just enough to make you moan.");
	output("\n\n<i>“Still your favorite, right chief?”</i> Tam giggles, rubbing her butt against the sheathed underside of your prick. <i>“Double kaithrit tail-job... maybe I’ll let you stick it in for a scratch between the ears?”</i>");
	output("\n\nHer cat ears perk up expectantly, tails squeezing hard around your shaft as encouragement until you finally reach up and give the puss what she wants. Tam purrs throatily as your fingers work through her bright pink hair, getting at that wonderfully sensitive spot right between her perky cat-ears. Her hips press back against your crotch, grinding up against you as her twin tails slowly release your rod, letting you enjoy the warm, wet feeling of her sex rubbing against your [pc.cock " + x + "], so close to penetration that any errant movement would send you deep into the cat-girl’s eager box.");
	output("\n\n<i>“You’re clear for landing, Kaska,”</i> Tam purrs, wiggling her flared hips up your shaft, until the crown of your cock is kissing the lips of her pussy. Tam bites her lip, back arching as she purrs and moans, readying herself for you. You’re more than happy to make up the difference: grabbing Tam’s hips, you thrust in, one long, smooth motion until you’re ");
	// How the fuck did this used to work then??!?! Foes[0] was never set to anything specific prior to this point afaik!
	if (pc.cockVolume(x) <= 24) output("buried to the hilt");
	
	else output("able to see her gut distending from the sheer amount of cock being shoved into her");
	output(". The chorus of moans Tam’s been serenading you with breaks at that moment, her cute little groans turning into a long cry of pleasure as you finally fuck her.");
	pc.cockChange();

	//If PC has a dick bigger than Kaska's: 
	if(pc.cockVolume(x) >= chars["KASKA"].cockVolume(0) * 1.5)
	{
		output("\n\n<i>“Oh, god... so big...”</i> she moans, bracing against the desk as you put more and more cock into her. <i>“Mmmm, when did you get that THICK, chief? Never mind, just keep doing it. Oh, that’s it... just like that...”</i>");
		output("\n\nShe purrs contentedly as you slowly fuck yourself into her, stretching her pussy out until she’s begging for respite. Tam’s belly is bulging with the sheer size of it, but that doesn’t deter her for a second. Man, kaithrit are built to take ‘em!");
		output("\n\n<i>“Mmm, somebody’s been getting into that Throbb we pulled, huh? I looooove it,”</i> she moans, back arching as you start to slide the shaft out of her. <i>“You’re being so gentle today... oh, when’re you gonna get to the rough stuff, huh? I wanna test this new dick of yours out for real!”</i>");
	}
	//elseif PC's dick is ~the same size as Kaska's:
	else if(pc.cockVolume(x) >= chars["KASKA"].cockVolume(0) * .75)
	{
		output("\n\n<i>“Ahhh, yeah, just like that,”</i> she moans, back arching as you slide into her cunt. Her wet, writhing walls meld perfectly to your shape and size, apparently quite accustomed to somebody of your girth. This Kaska must be pretty hung, to keep her favorite pussy stretched out enough to take you easily. You give Tam an appreciative slap on the ass, grinning as her flesh jiggles in response, reddening at your touch.");
		output("\n\n<i>“You’ve been downstairs too long... I was already missing your dick,”</i> Tam purrs, starting to move back against you. <i>“You’re being so gentle today... oh, when’re you gonna get to the rough stuff, huh?”</i>");
	}
	//elseif PC has a tiny pecker
	else
	{
		output("\n\n<i>“Come on, give it to me!”</i> Tam purrs as you hilt yourself in her, <i>“Thrust it deep in me, Kaska!”</i>");
		output("\n\nWhat, do you not stack up? You look down to the gaping maw of Tam’s slit, your own [pc.cock " + x + "] barely parting her clearly well-used lips. God damn, how big is this Kaska?");
		output("\n\nBefore you can bullshit something up, Tam sighs, saying, <i>“I thought that box we found was labeled ‘Throbb.’ Don’t tell me it was defective! Oh well, I still love you, even if you’re, uh, not as impressive... It’s how you use it after all, right? Come on, give it to me rough, Kaska!”</i>");
	}
	//[combine]
	output("\n\nYou start to thrust, pumping your hips into Tam’s backside until her assflesh is quaking with the force of impacts, her lusty moans filling your ears with every movement as you spread her pussy wide on your [pc.cock " + x + "]. She’s leaking like a faucet around you, cunny-juices running faster every time your [pc.hips] slam into hers, spattering the both of you with her excitement. Tam’s twin pink tails slip around your waist, trying to pull you in every time you pull out, coaxing you back with purrs and moans and the jiggle of her luscious ass and bouncing tits. Oh, those look tempting.... Between thrusts, you shift your grip on your feline foe, reaching up and squeezing her sinfully soft tits; they’re like water in your hands, flowing right around your fingers as her body is pushed up with the force of another pumping of your crotch.");
	output("\n\n<i>“Oh, yes!”</i> she yelps as your [pc.hips] slap into her ass again, <i>“Harder! Harder! Fuck me harder!”</i>");
	output("\n\nWell, she did say she liked it rough!");

	output("\n\nAny pretense of working crumbles as the cat-girl braces against the wall, legs spread wide and back arched sharply, inviting you to pound the hell out of her sodden box. You oblige, a hand grabbing her by the scruff of the neck and forcing her down, bending her over the wreckage of her wrecked attack drone as you start to hammer her cunt. Your [pc.cock " + x + "] is a blur as your hips move faster, fucking her into the bench until she’s screaming in pleasure, clawing for purchase as you mercilessly fuck her into submission.");
	output("\n\nYou barely notice Tam’s orgasm, marked only by a peak in her cries and a sudden gush of girl-cum that slithers down her thighs around the thrusting meat of your [pc.cock " + x + "] as you continue to pound away at her, unrelenting as her warm, wet muscles squeeze around your rod, trying to milk the cum from you. You try and hold back, concentrating on the rippling display of ass-flesh in front of you, on squeezing Tam’s tits until she squeals, but eventually you too feel the apex of pleasure oncoming.");
	output("\n\nThere’s no stopping it now. With a primal roar, you slam yourself deep into Tam’s sodden quim and unleash your load, firing a thick rope of [pc.cumColor] spunk to paint her walls, mixing with her own flowing juices as she cums again, spurred on by your potent release. You grab the cat’s neck, holding her down as your hips continue to jerkily thrust into her, tempo broken by the waves of pleasure crashing through you.");
	output("\n\n<i>“Fuck yeah,”</i> Tam purrs, nuzzling back against your firm hand. <i>“Treat me like a whore, Kaska... just like that...”</i>");
	output("\n\nIf she insists.... Your orgasm finally winding down, you pull out of Tam’s now-gaped pussy, smearing the last traces of your load off on one of her big butt-cheeks, leaving a nice, creamy smear as you start to gather your [pc.gear]. By the time you’re ready to go, it looks like Tam’s drifted off into a peaceful cat-nap, clearly quite satisfied with her treatment. Before you leave, you reach up and flip the elevator switch, turning it from Danger Red to Good-to-Go Green. Planetary core, here you come.");
	
	processTime(19);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",takeTamWulf);
}

//[Take Tam-Wolf]
//Once Tam-Tam is knocked out or incapacitated via smexing.
public function takeTamWulf():void
{
	clearOutput();
	author("Savin");
	showBust(tamWolfBustDisplay(0));
	showName("\nTAM-WOLF");
	output("With the psychotic cat-girl incapacitated, you take a gander at the damaged drone dog on the work table. Looking just like a sleek black doberman, the drone is certainly quite powerful -- and those teeth can take a bite right out of you. With a little re-working, you could probably turn him into your new best friend.");
	if(silly) output(" Then again, stealing is wrong... even from pirates.");
	//If PC is a Tech w/ drone:
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" <b>Taking Tam-wolf would let you replace your shock-slinging default drone with a bitey attack drone by equipping it as an accessory</b>.");
	else output(" If only you had the expertise and experience to work with drones, you could probably get Tam-wolf up to peak form -- as is, he’s still pretty damaged, and might be unreliable.");
	output("\n\nTake him?");
	processTime(1);
	//[Yes] [No]
	clearMenu();
	addButton(1,"No",dontTakeTamWulf);
	addButton(0,"Yes",yesTechSpecialistsTakeTamWulf);
}

//No
public function dontTakeTamWulf():void
{
	clearOutput();
	author("Savin");
	showBust(tamWolfBustDisplay(0));
	showName("\nTAM-WOLF");
	output("Nah. You’d hate to deprive the crazy cat-girl of her pet pooch, anyway. She’d be heartbroken!");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes
//If PC is a Tech Specialist w/ Drone
public function yesTechSpecialistsTakeTamWulf():void
{
	clearOutput();
	author("Savin");
	showName("\nTAM-WOLF");
	var foundLootItems:Array = new Array();
	//Drone techs!
	if(pc.hasPerk("Attack Drone"))
	{
		showBust(tamWolfBustDisplay());
		
		output("You pull a cord from your codex to the datajack in the back of Tam-wolf canid head and upload a basic clear and reformat program. Then it’s a simple matter of uploading your normal drone’s command and control programs to Tam-wolf and fixing that borked leg of his: just a few minutes’ work, really, now that you can concentrate. Pretty soon, he’s good as new! You pick up the hefty cyber-doberman and set it on the ground before flicking the on button hidden under his hind leg. With a synthesized bark, the attack drone comes to life.");
		output("\n\nThe wolf-drone shudders, then its tail starts wagging rhythmically as it turns to face you. Its booming, synthesized voice announces, <i>“Grrrreetings " + pc.mf("Master","Mistress") + ". This unit is programmed to be your faithful protector. What is your command?”</i>");

		//If PC is Nice:
		if(pc.isNice()) output("\n\n<i>“Uh... sit?”</i>\n\nTam-wolf sits obediently, tail still wagging.");
		//If PC is Mischievous:
		else if(pc.isMischievous()) output("\n\n<i>“Uh... who’s a good robo-attack-drone?”</i>\n\nTam-wolf ponders the question a moment. <i>“I am?”</i>\n\n<i>“Good boy! Yes you are!”</i>\n\nTam-wolf barks appreciatively.");
		//if PC is Hard:
		else output("\n\n<i>“Uh... play dead!”</i>\n\nTam-wolf obediently rolls onto his back and is completely still.");
		output("\n\n<i>“Alright, come on, boy!”</i> You say, stepping back from the work bench -- quickly followed by your loyal new friend.");
		foundLootItems[foundLootItems.length] = new TamWolf();
	}
	//Yes
	//PC is not a Drone Tech
	else
	{
		showBust(tamWolfBustDisplay(0));
		
		output("Well, you’re not a drone expert, but... how hard could it be? You pull a cord from your codex to an exposed datajack on the back of Tam-wolf’s canid cranium, and quickly find your screen flooded with seemingly random messages and diagnostics.");
		//PC must make a Moderate INTELLIGENCE check. This is a great time to demonstrate that skill formula we spent forever developing out!:
		if(pc.intelligence() + rand(20) + 1 < 10)
		{
			output("\n\nShit. You can’t make heads or tails of this! With a frustrated grunt, you yank the cord out of the useless canine drone and step back from the bench.");
			processTime(4);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//PC Succeeds: 
		else
		{
			foundLootItems[foundLootItems.length] = new TamWolfDamaged();
			output("\n\nEventually, with quite a bit of effort, you’re able to clear out the various diagnostics and find your way to what looks like a Factory Reset button, which should clear out all of the cat-girl’s modifications... and make the drone not attack you, hopefully. You key it, and pull your codex out once it’s completed. With that done, you search around for an “on” button. You find... something switch-like between the robo-mutt’s legs, flip it, and plant the drone on the ground.");
			output("\n\nIt shudders to life, nearly falling over on its damaged leg. With some effort, the drone turns around to face you, its synthetic voice booming, <i>“Grrrrreetings, [pc.Master]. This-this-this unit is programmed to be-be-be your faithful prooooooooooooootector. What is your c-c-command?”</i>");
			output("\n\nUh oh, looks like that damage was worse than you thought. You try and think up a command to give it, just to test:");
			//If PC is Nice:
			if(pc.isNice())
			{
				output("\n\n<i>“Uh... sit?”</i>");
				output("\n\nTam-wolf rolls over onto his side and barks.");
				if(silly) output(" <i>“Arth! Arth Arth!”</i>");
				output(" Close enough.");
			}
			//If PC is Mischievous:
			else if(pc.isMischievous()) output("\n\n<i>“Uh... who’s a good robo-attack-drone?”</i>\n\nTam-wolf ponders the question a moment. <i>“I am?”</i>\n\n<i>“Good boy! Yes you are!”</i>\n\nTam-wolf barks appreciatively.");
			//if PC is Hard:
			else output("\n\n<i>“Uh... play dead!”</i>\n\nThat doesn’t take much effort. Tam-wolf’s bum leg slides out from under him, and he promptly collapses in a heap.");
			output("\n\n<i>“Alright, come on, boy!”</i> You say, stepping back from the work bench -- eventually followed by your loyal, if barely-functional, new friend.");
		}
	}
	flags["TAKEN_TAMWOLF"] = 1;
	processTime(3);
	output("\n\n");
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

//Tam-wolf as an Accessory Item
//Tooltip: Tam-wolf is a badly damaged Fenris-class attack drone you looted from a crazed cat-girl, coincidentally also named Tam. Loyal to a fault, the patched-up cyber-pup follows you around wherever you go -- just equip him in your Accessory slot, and he’ll leap into battle with you. Or fall flat on his face and explode trying to, anyway.

//Tam-wolf as a Drone Replacement
//Tooltip: Tam-wolf is a state of the art Fenris attack drone you looted from a crazed cat-girl, coincidentally also named Tam. Loyal, intelligent, and alert, you new robotic friend is the closest thing you can get to a real attack dog these days. He’s replaced your original attack drone, giving you a powerful, bitey friend in battle.

//Tam-Tam Bad End: The Crew's Pet Pooch
public function tamtamBadEndPetPooch():void
{
	author("Savin");
	showBust("TAMTAM",tamWolfBustDisplay());
	showName("\nTAM-WOLF");
	//If During phase 1:
	if(!enemy.hasStatusEffect("Phase 2"))
	{
		output("Under a withering hail of bullets, you find yourself thrown back as one makes hard contact, blasting through your shoulder. With a wail of agony, you stumble to the ground... and quickly see every gun in the room leveled at you. Well, that’s it then. You throw your [pc.rangedWeapon] aside and raise your hands... wincing in pain from your wound. The cat-girl grins over the desk at you, and whistles loudly. Suddenly, a huge doberman-like robot lunges out of the dark at you, pinning you to the ground.");
	}
	//If Phase 2 -- Tam Harder:
	else output("Under a withering hail of bullets and a ceaseless assault from the cyber-dog, you find yourself slipping, only narrowing dodging streams of lead. Suddenly, you feel a set of dangerously pointed teeth on your neck as a powerful robotic body barrels you onto the ground.");
	output("\n\nTam the cat-girl is over you in an instant, kicking your [pc.rangedWeapon] away and leveling her own laser pistol at you. <i>“On your knees!”</i> she demands, before noticing that you’re flat on your back");
	if(!pc.hasKnees()) output(", much less that you don’t even have knees");
	output(". <i>“Yeah! Suck it, bitch. High-five, Tam-wolf!”</i>");
	output("\n\n<i>“High-five, mistress Tam,”</i> Tam-wolf agrees, reaching a steel paw up and swatting her outstretched hand.");
	output("\n\n<i>“That’ll teach you for messing with Captain Khorgan’s pirate crew, and especially Tam-Tam!”</i> Tam cheers, pumping a victorious fist in the air. <i>“So... uh... what do I do now?”</i>");
	output("\n\n<i>“Captain Khorgan ordered all trespassers be attacked on sight,”</i> Tam-wolf offers, growling at you.");
	output("\n\nTam-cat ponders that a moment. <i>“But she never said what to do if they, you know... survived.”</i>");

	output("\n\nYou stare up at the crazy pair, looking for any opportunity to get up... get away. To make your escape. But every time you move a muscle, Tam-wolf follows you, teeth bared. Finally, after a long moment of silence, his mistress asks, <i>“What do you think we should do with " + pc.mf("him","her") + ", Tam-wolf?”</i>");
	output("\n\n<i>“I am a canine attack drone, Mistress Tam. I am not programmed for independent thought.”</i>");
	output("\n\n<i>“Ooooh,”</i> Tam-cat murmurs, leering dangerously at you. <i>“That sounds like a perfect plan, my faithful friend... what do you say, " + pc.mf("mister","miss") + ", do you want to live?”</i>");
	output("\n\nYou nod instinctively. Any thought of rebellion, of stoicism, washed away by the dangerous teeth at your throat.");
	output("\n\n<i>“Good puppy,”</i> Tam coos, reaching down and looking you in the eye. <i>“You are going to be a good puppy, right?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Puppies bark, silly!”</i> Tam says, a hint of danger in her voice. <i>“Don’t they?”</i>");
	output("\n\nYou bark");
	if(pc.catDog("nyan", "bork", false) == "bork") output(", giving into your baser, canid instincts");
	else if(pc.catDog("nyan", "bork", true) == "nyan") output(", going against every instinct in your feline head");
	output(".");

	output("\n\n<i>“Good puppy!”</i> Tam praises, one of her hands reaching out to you. You recoil, an instinctive fear taking over you... until her fingers slip up ");
	if(pc.hasHair()) output("through ");
	else output("across ");
	output("your [pc.hair], stroking it affectionately. You try to relax as she pets, though it’s difficult with a laser pistol and a set of brutal fangs so close by, their menacing presence a clear reminder of your new place: as a crazed pirate’s pet pooch.");

	output("\n\n<i>“Now sit,”</i> Tam commands. You struggle up onto your [pc.knees], arms raised like a dog’s before you, begging.");
	output("\n\nShe grins, ecstatic. <i>“Good! What do you think, Tam-wolf? Is " + pc.mf("he","she") + " a good puppy?”</i>");
	output("\n\n<i>“I am not programmed for jealousy, Mistress Tam,”</i> Tam-wolf growls in his digital voice, his nose prodding against your side. <i>“Therefore I conclude it is indeed a good puppy.”</i>");
	output("\n\nTam grins, and from her backpack, draws a leash and collar -- clearly meant for Tam-wolf, now yours. She slips it around your neck and, satisfied you’re under her dominion, holsters her pistol. Wrapping the leash firmly around her hand, she gives you a simple, <i>“Come on!”</i> and starts walking toward the door, clearly content to let her turrets do the defending for the moment. You gulp but, with Tam-wolf at your heels growling, submit to your new mistress’s will. What awaits you among the pirates...?");
	processTime(35+rand(4));
	//[Next]
	clearMenu();
	addButton(0,"Next",badEndToTamWulfAndTamAndMaybeAlsoTamPartII);

}

public function badEndToTamWulfAndTamAndMaybeAlsoTamPartII():void
{
	moveTo("GAME OVER");
	showLocationName();
	
	days += 94;
	processTime(rand(2400));
	var i:int = 0;
	
	clearOutput();
	author("Savin");
	showBust("TAMTAM",tamWolfBustDisplay());
	showName("\nTAM-WOLF");
	
	output("<b>Months pass</b>");
	
	pc.removeAll();
	pc.armor = new LeatherStrapHarness();
	pc.armor.longName = "leather suit";
	pc.armor.description = "a leather suit";
	pc.armor.itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_FULL];

	pc.buttChange(500, false);
	
	output("\n\nYou can barely feel your extremities. The leather outfit is restraining, tight against your nude body, holding you onto ");
	if(!pc.hasKnees())
	{
		output("your newly grown ");
		pc.legCount = 2;
		pc.legType = GLOBAL.TYPE_HUMAN;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.genitalSpot = 0;
	}
	output("knees and elbows. Mistress likes you nice and low, just like a real dog. You’re slowly becoming more comfortable in your new gait, able to hobble around after her despite the lack of access to your bound forelimbs. Today you find yourself scurrying along the corridor at Mistress’s heels, quickly followed by Tam-wolf. A few of the pirate crew actually greet you as you wander past them, reaching down to play with your big puppy ears or grab your [pc.butt] through the tight leather of your bindings. Your drilled-in instincts kick in at their touches, causing your to wiggle your [pc.hips] ");
	if(pc.tailCount > 0) output("and [pc.tails].");
	else output(", which makes the fluffy tail plugged into your ass shake for them - and gives you an undeniable thrill of pleasure as the buttplug shifts inside you, unable to escape through the small hole in your suit no matter how much you used to try. Now, you can’t imagine living without your constant, fluffy companion.");

	output("\n\nToday is special -- you have a present coming for you, Mistress said. Goody! You try to focus on that, rather than how hungry you are... the smell of your warm meal getting cold in the bowl in Mistress’s hands as she takes the big red plastic “COLLECTION” back to her quarters for breakfast. The scent of your creamy meal is heavenly, nearly driving you wild with anticipation as you follow Mistress into her quarters, and hear the comforting pneumatic hiss of her door sealing shut. You pad up to Mistress, putting one of your stumpy “limbs” up on her leg in a motion of begging, making a little whimper sound -- you’re so hungry, and breakfast smells so good!");
	output("\n\n<i>“Aww, who’s a hungry puppy?”</i> Mistress teases, reaching down to ruffle your ears. You yip, wagging your tail");
	if(pc.tailCount == 0) output("-plug");
	output(" excitedly as your Mistress leans down to you, her massive, oh-so-soft mounds tantalizingly close to your [pc.face]. She giggles as you drool a little bit -- whether from the pair of boobs in your face or the smell of your still-warm meal about to be given to you, you couldn’t say.");

	output("\n\n<i>“So hungry! Well, your friends certainly chipped in a lot for you today, didn’t they! It’s practically full to the rim!”</i> Mistress says, finally setting the bowl on the deck for you. You bark happily, lunging towards your thick, creamy white meal. You’re so lucky the crew likes you so much -- they work so hard to make your breakfast each day, and Mistress is nice enough to collect it all for you. You all but put your face right into the plastic dish, your tongue lapping out into the bowl full of salty and delicious white cream. You dig in, tongue scooping up wad after wad of the crew’s thick offering.");
	
	pc.maxOutEnergy();

	output("\n\nAs you finally get to sate your hunger, you see from the corner of your eye Mistress taking a familiar remote from her pocket and flicking a nob on it. You wince as the ");
	if(pc.tailCount > 0) output("vibrator-plug");
	else output("the tail-plug");
	output(" lodged up your ass shudders to life, sending a vibrating hum through your body, accompanied by a twitch of pleasure that nearly makes you spit out your mouthful of pirate spunk. You whimper, looking up at Mistress as she flops onto her bed, grinning lustily at you as she fiddles with the remote. The vibe speeds up, thrumming hard enough for you to feel it in your teeth; your whimper turns into a quiet moan as your ass is overwhelmed by shuddering shockwaves of pleasure. It’s hard to eat with your tail-hole buzzing like that, but you’re so famished... you grit your teeth and try to bear it, lapping up your salty treat between groans and yelps of pleasure.");
	output("\n\nSnickering, Mistress coos, <i>“Aww, is puppy enjoying its meal?”</i>");

	output("\n\nYou bark, though it comes out as more of a moan as she flicks up the setting. Faster and faster the vibe drills into your poor, stretched hole until you can barely force yourself to eat, rather than just rolling over and submitting to the pleasure. But Mistress wouldn’t like that. Doggies don’t fap, do they?");

	output("\n\nYou struggle through your salty meal, licking up every last drop until your stomach feels full to bursting and there’s a thick glaze of cream on your chin. You give another low groan and roll onto your side, wiggling your hips for Mistress, hoping she’ll turn the vibe off... or higher up so that you can cum.");
	//if PC has a dick
	if(pc.hasCock())
	{
		output(" Thanks the to the pressure on your prostate, your own [pc.cocks] twitch");
		if(pc.cockTotal() == 1) output("es");
		if(pc.legCount > 1) output(" between");
		else output(" against");
		output(" your [pc.legOrLegs], thankfully unrestrained as ");
		if(pc.cockTotal() == 1) output("it pokes");
		else output("they poke");
		output(" through the crotchless leather suit Mistress has bound you up in.");
	}
	output(" She watches you curl up, content to endure your sexual torment.");

	output("\n\nMistress tsks her tongue and says, <i>“Falling asleep already, pup? But today’s present day!”</i>");

	output("\n\nPresent? You almost forgot! You wag your ");
	if(pc.tailCount == 0) output("vibrating ");
	output("tail and wiggle your way over the mistress, planting your head in her lap and looking up at her with your big, puppy-dog eyes. She grins and rubs your nose, telling you to close your eyes as she reaches back into her pack. You obey, of course, closing your eyes and just enjoying the gentle sensation of vibration rolling up your body. Eventually, you feel one of Mistress’s soft fingers on your lip, and you instinctively open your mouth. When you do so, you’re quickly rewarded with the almost-forgotten taste of peanut butter -- a great big spoonful of it plopping onto your waiting tongue.");
	output("\n\nOh, god! You nearly swoon at the taste, murmuring happily as you swallow it down. It’s been so long since you had such a delicious treat. Oh, thank you, Mistress! Thank...");
	output("\n\nYou suddenly wince as... something happens. You can’t tell what, but something’s... <i>changing</i> inside you. Your chest tightens, straining against your leathers... oh, it hurts!");
	output("\n\n<i>“Let me help!”</i> Mistress grins, grabbing the suit around your chest and releasing it, letting... a ");
	if(pc.biggestTitSize() >= 1) output("<i>much</i> larger ");
	if(pc.breastRows[pc.biggestTitRow()].breasts == 2) output("pair");
	else output("set");
	output(" of huge, swinging mammaries drop out onto the deck! You gasp, suddenly realizing the old trick Mistress has used on you, even as your huge tits expand, growing monstrously huge until you’re practically lying atop them, your stunted, bound arms unable to touch the ground. As your chest grows, the rest of you does as well, your hips and ass straining against the tight leather of your puppy-suit, threatening to break from your constraints.");
	
	for(i = 0; i < pc.breastRows.length; i++)
	{
		if(pc.breastRows[0].breastRatingRaw < ((120/60) * pc.tallness)) pc.breastRows[0].breastRatingRaw = (((120/60) * pc.tallness) + 20);
	}
	if(pc.hipRatingRaw < 20) pc.hipRatingRaw = 20;
	if(pc.buttRatingRaw < 20) pc.buttRatingRaw = 20;
	
	output("\n\nBetween the strange, stretching feeling in your suddenly much more curvy body and the vibrator still humming away in your ass, you only just stop short of cumming as waves of mutating bliss flow through your changing body. Mistress gently strokes your [pc.hair], cooing what a good puppy you are as you slump out of her lap, usable to sit upright thanks to your heavier bosom.");
	if (!pc.hasVagina())
	{
		output(" But that’s not the last change Mistress’s drugs have in store for you, as you can feel a slight, stretching pain in your loins, as something... something tears in your crotch. You cry out, but not in pain, but pleasure. You can’t reach back to see what’s happening, but Mistress seems to understand your need, as she reaches down and pulls away the leathers covering your groin and ass. You wince as cool air brushes across something new and alien");
		if(pc.legCount > 1) output(" between");
		else output(" against");
		output(" your [pc.legOrLegs] -- and that wince turns into a howl of ecstasy as one of her dainty fingers slips inside what you suddenly realize is a new hole. A cunt. But just as soon as she does so, she withdraws, clearly satisfied with your new slit.");
	}
	else output(" With your new additions straining against your suit, Mistress slips a hand back around your prone body, yanking down the leather around your [pc.ass] to let your womanhood kiss the stale air of the cabin for the first time in what seems like forever.");

	output("\n\nAs you lie on the deck, Mistress rises to her feet and steps over you, going to the thus-far silent Tam-wolf. You crane your neck around your now-immobile body, trying to see what’s going on but not quite able: but you <i>can</i> hear....");

	output("\n\n<i>“I got a present for you too, Tam-wolf!”</i> Mistress says, taking a knee beside her faithful drone.");
	output("\n\n<i>“Really, Mistress?”</i> Tam-wolf yips, excited. <i>“You should not have. You are so kind and also beautiful, Mistress Tam!”</i>");
	output("\n\nMistress giggles. <i>“Aww, you’re so sweet! Who taught you manners like those? I bet it was me!”</i>");
	output("\n\n<i>“By tampering with my internal programming, my warranty has been voided, Mistress.”</i>");
	output("\n\n<i>“Yes it is! Who’s a good warranty-less-attack-drone? You are! And guess what good attack drones without warranties get?”</i>");
	output("\n\nTam-wolf pauses a moment. <i>“My first oil change in two years?”</i>");
	output("\n\n<i>“No, silly! I ordered you something special! Something to help you play with your new sister!”</i> You hear a box tearing open behind you, and the sound of plastic grinding on metal. <i>“Oooh, Naughty Wyvern really outdid themselves. Such a lucky boy, Tam-wolf. Look at that huge, thick, synth-cum loaded cock of yours! Oooh, I bet your sister’s going to LOVE it.”</i>");
	output("\n\nThere’s a moment of silence before Tam-wolf speaks: <i>“What do I do now, Mistress?”</i>");
	output("\n\nMistress sighs. <i>“Uh... download some videos. Figure it out, stud.”</i>");
	output("\n\n<i>“Affirmative. Downloading supplementary instructions... Creating new program: ‘Bitch Breaker dot e-x-e’.”</i>");

	output("\n\nYou whimper in terror as you hear Tam-wolfs metallic claws clanking across the deck, pacing up to you. You try and scamper away, but your suddenly-massive tits simply defy your strength, especially confined in what remains of your puppy-suit. Incapable of escape, all you can do is try not to panic as Tam-wolf sticks his stainless steels snout into the back of your pants, his exhaust vent blowing hot air into your cooch. You whimper at the sensation, trembling as his hot nose presses into your slit, almost threatening penetration... but that’s completely unable to prepare you for the sudden rush of steel that follows. Tam-wolf lunges up onto you, his full weight crashing onto your back as the drone <i>mounts</i> you, his forelegs scrambling up your torso, gripping into the sheer leather gripping your wide, altered hips. With it, you can feel a huge, pointed, plastic tip bump against the lips of your ");
	if(!pc.hasVagina()) output("new, virginal ");
	output("womanhood. Oh, God, it’s massive! You squeak in terror, struggling under the immense weight of your own boobs and the drone-dog atop you... to no avail. You’re helpless, trapped by your restraints and overburdened breasts as Tam-wolf mounts up, his powerful hips thrusting into your up-turned ass.");

	output("\n\nYour voice breaks into a high, wordless scream as a massive, hot rod of latex slams into your drooling sex");
	if(!pc.hasVagina()) output(", piercing your new womanhood’s hymen");
	output(" in a single, long thrust to the hilt. You feel Tam-wolf’s hot breath on your ear as he rams his bolted-on puppy pecker deep into your slit, breeding you like the whimpering, submissive bitch you are. Your screams echo deafeningly against the steel bulkheads as Tam-wolf’s hips pound into your modified backside, steel legs thundering against your huge, pillowy asscheeks with flesh-quaking force.");
	output("\n\n<i>“Breeding mode activated,”</i> Tam-wolf growls into your ear, each syllable punctuated by a thrust deep into you. <i>“Engaging Knot dot e-x-e.”</i>");
	output("\n\nSomething presses into your cunt, even larger than the thick rod already spearing you. Your eyes go wide, your body clenching, trying to save itself from the knot prodding against your sex; yet you’re defenseless against it as Tam-wolf slams into your with machine strength and precision. With a particularly potent thrust, you feel the knot of his phallus tear into you, spreading the lips of your pussy wide open. Your cries of pleasure and pain reach a crescendo, and then fall silent, voice cracking into nothing as your mouth just hangs agape in horror at the massive knot burying itself inside you.");
	output("\n\n<i>“Bitch breaker protocols successful,”</i> Tam-wolf growls, scrambling forward overtop you, pushing his knot deeper.");
	output("\n\n<i>“Go, go, Tam-wolf!”</i> Mistress cheers, reaching up to pat her robotic pooch on the head.");
	output("\n\n<i>“Mistress, I am cumming,”</i> Tam-wolf announces, his latex member shifting inside you, the knot thickening as a load of synthetic spooge rushes toward you defiled sex. As a flood of hot, sticky, canid seed floods your womb, you’re suddenly very, very aware of your new lot in life: even worse than being a dog, you’re now reduced to nothing more than the robotic Tam-wolf’s breeding bitch, a living onahole for Mistress’s alpha hound.");
	
	if(!pc.hasVagina()) pc.createVagina();
	var selCunt:int = pc.vaginas[rand(pc.vaginas.length)];
	
	var ppTamWolf:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppTamWolf.hasCock()) ppTamWolf.createCock();
	ppTamWolf.shiftCock(0, GLOBAL.TYPE_CANINE);
	ppTamWolf.cocks[0].cLengthRaw = 15;
	ppTamWolf.cocks[0].cThicknessRatioRaw = 3;
	ppTamWolf.cocks[0].flaccidMultiplier = 0.20;
	ppTamWolf.cocks[0].knotMultiplier = 2.5;
	ppTamWolf.cumType = GLOBAL.FLUID_TYPE_CUM;
	
	pc.cuntChange(selCunt, (pc.vaginalCapacity(selCunt) + (ppTamWolf.cockVolume(0) * ppTamWolf.cocks[0].knotMultiplier)), false);
	for(i = 0; i < 32; i++)
	{
		pc.loadInCunt(ppTamWolf, selCunt);
		pc.orgasm();
	}
	
	badEnd("GAME OVER!");
}

public function kaskaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "KASKA";
	if(nude) sBust += "_NUDE";
	return sBust;
}
//Shit Gets Real, Here
//First time PC tries to leave the engineering room
//Fen note: Actually play overtop of the normal room descriptions in the next room. Horray, cheezing! ...also the other room
public function bombAlertBonusFunction():Boolean
{
	if(flags["TARKUS_BOMB_TIMER"] == undefined)
	{
		clearOutput();
		author("Savin");
		showBust(kaskaBustDisplay());
		showName("MYSTERY\nWOMAN");
		output("As you leave the KO’d cat-girl behind, you hear a faint beeping back in the control room. Looking over your shoulder, you see a tiny red “INCOMING” displaying on Tam-wolf’s readout. A moment later, a holo-projector displays the face of a dark-skinned woman with a punked-out do, scowling at her transmitter.");
		output("\n\n<i>“Tam, where the fuck are you, you lazy slut? Pick up!”</i>");
		output("\n\nWhen no answer is forthcoming, the figure sighs and scowls. <i>“I hope you’re recording this. Four hours until detonation. You better have your shit packed and ready to go before then.”</i>");
		output("\n\nThe figure winks out as the transmission cuts. Four hours? Oh, shit....");
		processTime(1);
		//Fen note: START ZE TIMAH 180 minutes. AKA: Don't fuck around too long.
		flags["TARKUS_BOMB_TIMER"] = 240;
		clearMenu();
		//Reset position as you haven't really moved.
		moveTo("352");
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	if(currentLocation == "353") addButton(0,"LiftDown",liftDownEvent,undefined,"Down","Hop on the elevator and ride it down to the core.");
	return false;
}

//[Lift Down] (First time: prepare for ass-assination)
public function liftDownEvent():void
{
	pc.energy(75);
	clearOutput();
	author("Savin");
	if(flags["ROCKET_PODS_ENCOUNTERED"] == undefined)
	{
		output("You step into the personnel lift and press the big red DOWN button. With a loud mechanical rumble and the sound of gears grinding, the lift shudders to life and starts sliding down the track toward the planetary core. Quickly, the light of the ");
		if(hours < 20 && hours >= 5) output("sun and ");
		output("stars is blocked out by the rise of huge earthen cliff sides as you descend into the chasm. You step up to the glass fore of the car, squinting to see the tether station far below. You can’t at first, but as time passes (and the elevator picks up speed), it comes into view. It’s a large installation, circular, surrounded by a wide walkway with a lengthy bridge leading from the bottom of the lift tracks to the door of the station proper.");

		output("\n\nWhat a long way down. You take a moment to catch your breath after the deadly shootout with that crazed cat-girl and her robotic friend; ");
		if(pc.rangedWeapon.shortName != "" && (pc as PlayerCharacter).rangedWeapon.baseDamage.hasFlag(DamageFlag.BULLET)) output("you drop the magazine from your [pc.rangedWeapon], slamming a new one home and racking the slide. Satisfied you’re ready for a proper fight, y");
		else if(pc.rangedWeapon.shortName != "") output("you check the ammunition readings on your weapon, satisfied you’re up for another encounter. Y");
		else output("you rub a bit of the drones’ machine oil off of your well-used [pc.meleeWeapon]. Satisfied you’re ready for a proper fight, y");
		output("ou step back from the window and steel yourself for what’s to come.");

		//output("\n\nAnd it comes much earlier than you expected.");
		//output("\n\nAt first, you think you hear a loud gust of wind. As it grows louder, though, you finally step back up to the window to see what’s wrong -- only to be thrown back a moment later as the front of the lift explodes in a shower of glass shards. You yell out, covering your eyes as a huge figure barrels into the lift with you, a fearsome warcry tearing from his lips. You leap to your feat, drawing down as the figure, a dark-skinned man, rises to his full height -- well over six feet -- and brandishes a pair of long, curved swords.");
		//output("\n\nThe man scowls fiercely at you, eyes narrowed beneath a pair of thick, boney ridges. Indeed, beneath his light black armor, he seems to be covered with bone protrusions, intermixed with a network of scars from a thousand injuries. A kost’oran, than: fierce warriors, these. Over his shoulders, you see a jetpack still buzzing with life, ready to send him and his deadly blades hurtling into you.");
		//output("\n\n<i>“You’re not making it to the core,”</i> he says coldly, taking a stride forward and raising his blades in a battle post. <i>“This ends here.”</i>");
		output("\n\nYou press your back to the edge of the cart, and ride it the rest of the way down, ready for anything now... but surprisingly, there’s no further threat until you hear the elevator clicking into place at the base of the walkway.\n\nBy now, you’re practically floating inside the elevator. It seems that the center of a planet is a bad place to go for walks. Luckily, a compartment on the side of the elevator opens, revealing a variety of electromagnetically charged boots, sleeves, and plates - gear for a variety of races to stick to the metal of the walkway.");
		output("\n\nYou grab the most comfortable pair and settle into place, ready to go.");
	}
	else
	{
		output("You step into the personnel lift and press the big red DOWN button. With a loud mechanical rumble and the sound of gears grinding, the lift shudders to life and starts sliding down the track toward the planetary core. This trip is much like the last. You try and spend the time the admiring what passes for a view, mentally preparing yourself for whatever challenges remain at the bottom.");
		output("\n\nGravity slowly fades, and you’re sure to put on some of the electromagnetic equipment before it vanishes completely.")
	}
	if(!rooms["364"].hasFlag(GLOBAL.NPC)) rooms["364"].addFlag(GLOBAL.NPC);

	processTime(23);
	//Move the PC
	moveTo("354");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
public function configRocketFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new RocketTurrets());
	CombatManager.victoryScene(pcBeatsRocketPods);
	CombatManager.lossScene(pcLosesToRocketPods);
	CombatManager.displayLocation("TURRETS");
}

public function coreWalkWayBonus():Boolean
{
	if(flags["ROCKET_PODS_ENCOUNTERED"] == undefined)
	{
		clearOutput();
		author("Savin");
		showBust("TURRET");
		showName("ROCKET\nPODS");
		flags["ROCKET_PODS_ENCOUNTERED"] = 1;
		output("Stepping out of what remains of the lift");
		// after your fight with the sword-slinging kost'oran pirate
		output(", you come to face a long, narrow walkway perched precariously between the rocky outcropping at the base of the lift and the titanic tether station hanging between the two halves of the planet. Ahead, between you and the station, you catch a glimpse of several turrets set up along the walkway and the roof of the station, all aimed at you.");
		output("\n\nOh, shit.");
		output("\n\nYou scramble behind");
		if(silly) output(" a convenient nearby chest high wall");
		else output(" some crates stacked nearby");
		output(" before they can target you. Unlike the crazy cat-girl’s turrets topside, these are sleek and heavy looking, probably part of the installation’s normal security. And if those barrels are anything to go by, they’re probably loaded with micro-rockets rather than bullets - powerful enough to chew through a dropship or a freighter. You’ll need to take these bastards down fast if you want any hope of fighting forward.");
		//[Fight] [Lift] [Sneak By] [{if Tech Spec.: Hack Turrets}]
		clearMenu();
		configRocketFight();
		addButton(0, "Fight", CombatManager.beginCombat);
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
		{
			output("\n\nThis situation reminds you of the time you snuck by the guards on Antaris VII. Zero-G environs do open up some unconventional paths....");
			addButton(1,"Sneak",sneakByZeTurrets);
		}
		else addDisabledButton(1,"Sneak","Sneak","Smugglers can probably find a way to avoid this fight entirely....");
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) addButton(2,"HackTurrets",hackTheRocketPodsOnTarkus);
		else addDisabledButton(2,"HackTurrets","Hack Turrets","A tech specialist could probably hack these things.");
		return true;
	}
	if(flags["ROCKET_PODS_HACKED"] == 1 || flags["ROCKET_PODS_SNEAKED"] == 1)
	{
		author("Savin");
		output(". The rocket pods are sitting at the end of the walkway, scanning for hostile targets. As you approach, they chirp a digital greeting at you, utterly harmless.");
	}
	else
	{
		author("Savin");
		output(", especially now that it’s been blasted with holes from the now defunct rocket turrets, which are sitting in a shorted-out heap at the edge of the way, rendered harmless. From here, you have an uninterrupted line of sight all the way back to the top of the lift track, as well as a commanding view of the lift station, big and bulky and ancient, sitting before you.");
	}
	addButton(0,"Ride Lift",goUpTarkusLift);
	return false;
}

public function goUpTarkusLift():void
{
	clearOutput();
	pc.energy(75);
	output("Stepping into the lift, you press the activation key. The elevator hums softly and accelerates upward, replacing gravity with acceleration until you’re far enough from the core for the former to return. Stowing your equipment, you try to relax for the thirty minute ride.");
	processTime(25);
	//Move the PC
	moveTo("353");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hack Turrets
//Fuck you and your Codex, Fen
//PC needs to pass a moderate INT check for this shit
public function hackTheRocketPodsOnTarkus():void
{
	clearOutput();
	author("Savin");
	showBust("TURRET");
	showName("ROCKET\nPODS");
	output("<i>“Fight smart, not hard,”</i> Dad always said. You reach into your pack and pull out your Codex, bringing up the network selection, and quickly slicing into the station’s wireless.");
	//On Fail
	if(pc.intelligence() + rand(20) + 1 < 25)
	{
		output("\n\nYou spend a few minutes tapping around in the security system, but someone’s clearly been ramping up the anti-intruder countermeasures. You grit your teeth with effort, trying to pierce the security, but finding no backdoors or weak points to exploit. With a grunt of frustration, you toss your Codex back in your pack. Looks like it’s the hard way.");
		processTime(2);
		clearMenu();
		configRocketFight();
		addButton(0, "Next", CombatManager.beginCombat);
	}
	//On Pass
	else
	{
		output("\n\nClearly Tam was already in here fiddling around, and the security she put back up isn’t really the best, easily falling prey to your trained skill. A few minutes later, you hear a tell-tale “BEEP” from the turrets ahead as they reset to their default parameters. Another few strokes, and you slice yourself into their Friend/Foe ID system, and tag yourself as friendly. Pirates, not so much.");
		output("\n\nStepping out from behind cover, you nervously approach the turrets. Their many rocket launchers swivel around to regard you, laser targeters taking a bead... before the nearest one makes a happy-sounding chirp, and the battery disengages. Whew.");
		processTime(2);
		flags["ROCKET_PODS_HACKED"] = 1;
		clearMenu();
		CombatManager.abortCombat();
		//addButton(0,"Next",mainGameMenu);
	}
}

//Sneak By
//This reminds you of the time you snuck by the guards on Antaris VII.
public function sneakByZeTurrets():void
{
	clearOutput();
	author("Savin");
	showBust("TURRET");
	showName("ROCKET\nPODS");
	//PC needs to make a difficult PHYSIQUE check. Taurs/Nagas/whatevers probably can't do this, since they weigh a ton and their arms would snap off
	//Maybe tooltip: "The only other way past the turrets is to go under the walkway. Could be dangerous...
	output("<i>“Discretion is the better part of valor,”</i> Dad always said. You roll your shoulders, wipe the sweat from your palms, and pull yourself over the guard rail. You tumble weightlessly, grabbing the bottom of the bridge, leaving yourself hanging over the void.");
	output("\n\nOHGODTHAT’SALONGWAYDOWN! Up?! Whatever....");
	output("\n\nYou try not to stare, even as your [pc.feet] dangle");
	if(pc.legCount == 1) output("s");
	output(" down ponderously below you, swaying over the blackness of space. You gulp, and swing them up, grinning widely when they snap into place thanks to the electromagnetic gear girding them. The experience is dizzying, but at least the turrets aren’t targeting you. Whoever programmed them didn’t take into account the new paths that zero G would offer.");

	output("\n\nAfter a few moments’ of stepping carefully, constantly worried the turrets will turn on you, you step over to a nearby console conveniently labeled “defense turrets” and flip the switch. No more of that.");
	flags["ROCKET_PODS_SNEAKED"] = 1;
	processTime(5);
	clearMenu();
	CombatManager.abortCombat();
}

//PC Victory vs Rocket Pods
public function pcBeatsRocketPods():void
{
	output("With a mighty KABOOM, the last rocket turret explodes in a hail of shrapnel and sparks. You heave a sigh of relief as silence again reigns in the rift. You can only spare a few moments to catch your breath, though, before you have to push on: there’s a bomb that needs defusing!\n\n");
	CombatManager.genericVictory();
}

//PC Loss vs Rocket Pods
public function pcLosesToRocketPods():void
{
	output("Rockets pummel into the ground around you, closer and closer, blasting you off your [pc.feet], bouncing you around like a toy. You scream in pain as shrapnel tears through you, explosive force hurling you off the walkway and into the void around Tarkus’ core. Your corpse will have to rest amongst the floating strata.");
	badEnd();
}

//END BOSS: Captain Khorgan Brytheck
//Dungeon end boss, in two parts: a damage-dealing heavy-hitter mech-suit fight, followed by a tease-heavy duel between her and the PC, swashbuckler style. Mech is armed with great big rocket pods and a gattling laser; PC has to square-hop to avoid missiles when they come in, or take MASSIVE damage

/*Room Description: Platinum Vein Approach
{This is the big fucking C on your map; the other three rooms are arrayed in front of it (7,8,9 positions to its 5. From there, the Captain herself occupies another room to the North, making a cross of five rooms breaking off from the station}
A makeshift array of hover-platforms have been bolted down to the ledge of the control station, leading into a great big crack in the rock ahead of you. Clearly a recent addition, the platforms creak and groan uneasily as the station itself shifts and settles on its precarious supports. Without any guard rails or walls ahead, one thing becomes clear: it’s a long way down.

{If PC hasn't cleared the Captain yet: You can hear a menacing ZAPZAPZAP ahead as well. Your attention is drawn to a lumbering mechanical monster, vaguely humanoid in shape, plodding around at the rock’s edge. A mining laser is affixed to one wrist, currently employed in cutting great big chunks out of the crust as its other hand rips out strips of something very shiny. Is that... platinum? Better be careful if you approach it: this thing looks tough.}


Room Description: Mining Platform Central
One of the large hover-platforms bolted to the edge of the station, bridging the gap between the station and the crust for ease of mining. The middle of the three, this platform took a hell of a beating from the captain’s opening salvo. Between the cracks and holes left in the plates, you can see the distant stars through the Tarkus rift.

Room Description: Mining Platform Left
One of the large hover-platforms bolted to the edge of the station, bridging the gap between the station and the crust for ease of mining. The surface is pock-marked with carbon burns and craters from your battle with the captain.

Room Description: Mining Platform Right
One of the large hover-platforms bolted to the edge of the station, bridging the gap between the station and the crust for ease of mining. The platform is barely hanging on after the fight, nearly blasted off by a rocket blast. Watch your step!

Room Description: Platinum Deposit
The ledge where the pirate captain was working is little more than a large platform extending from the main control station, allowing access to the dead core of the planet. Crates of drilling equipment, as well as a destroyed powered exoskeleton, are scattered around, evidence of the pirates’ plot. {A glittering pile of platinum has been stacked here, freshly mined from the depths of Tarkus. // There’s an empty crate here, where the pirates were storing their mined platinum. You’re sure nobody will begrudge you your reward...}
*/

public function spessPirateCaptainFightFightGoTimeBonus():Boolean
{
	if(flags["STARTED_KHORGAN_FIGHT"] == undefined)
	{
		pirateCaptainBossFightIntro();
		flags["STARTED_KHORGAN_FIGHT"] = 1;
		return true;
	}
	return false;
}

public function PlatinumSuperBonusFunction():Boolean
{
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	//Room blurb for defeated Cap'n
	//Captain was Fucked: 
	if(flags["DICKFUCKED_CAPN_KHORGAN"] != undefined || flags["LESBOED_KHORGAN"] != undefined) output("\n\nCaptain Khorgan is lying against the broken remains of her mech suit in a well-fucked mess, clutching the tatters of her clothes back around her shoulders.");
	//Captain wasn't fucked:
	else output("\n\nCaptain Khorgan is sitting against the railing of the platform, tied up and looking none too pleased that you didn’t take her up on her offer of sex.");

	if(flags["PLATINUM_TAKEN"] == undefined) 
	{
		output("\n\nA glittering pile of platinum has been stacked here, freshly mined from the depths of Tarkus.");
		addButton(1,"Take Plat",takeZePlatinumAwwwwyiss);
	}
	else output("\n\nThere’s an empty crate here, where the pirates were storing their mined platinum. You’re sure nobody will begrudge you your reward...");
	addButton(0,"Captain",approachCaptainPostDefeat,undefined,"Captain","Approach the captain once more. She did seem keen on sleeping with you, after all.");
	return false;
}

//Captain Boss Fight: Introduction
public function pirateCaptainBossFightIntro():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("You step up onto the hover platform attached to the station, hand on your [pc.rangedWeapon]. Just a few paces ahead of you, a steel behemoth is at work, a gorilla-like mechanical suit busily drilling into the crust with a mining laser on its wrist. As you approach, you see the suit’s other arm punch into the lasered-out rock, and rip out a fistful of a shiny silvery metal -- the glimmer of platinum is unmistakable. The suit turns, dumping the platinum shard into a half-full crate nearby... and sees you walking toward it.");
	output("\n\nWith a footstep that sends the whole platform shuddering, the mech suit lumbers around to face you. The suit’s torso is a dome of plated glass, inside which you can see a powerfully built green-skinned woman, surrounded by hovering holo-displays and sporting an almost ridiculously outdated tricorn hat. She scowls at you, and you hear the mining laser powering back up as she takes a step forward; the reverberations are nearly strong enough to knock you on your back.");
	output("\n\n<i>“AND WHO DO YOU THINK YOU ARE!?”</i> the suit roars, the pilot’s voice coming out as a deafening synthetic scream. <i>“YOU’RE NOT A COP. SO WHAT: BOUNTY HUNTER? INTERPOL? OR DO YOU JUST HAVE A DEATHWISH, MAGGOT?”</i>");
	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you say, leveling your [pc.rangedWeapon] at the suit’s armored cockpit.");

	output("\n\nShe laughs. Hearty, genuine laughter that the suit belches out as a splitting, grating creak. <i>“I’M CAPTAIN KHORGAN BRYTHECK OF THE </i>TARASQUE<i>, AND I’M IN CHARGE HERE. YOU’VE GOT A LOT OF BALLS" + pc.mf(""," FOR A GIRL") + ". I’M ALMOST IMPRESSED. KEEP IT UP, AND I MIGHT GRANT YOU A QUICK DEATH... OR MAYBE I’LL KEEP YOU AROUND WHEN MY SUIT’S CHEWED YOU UP. WHAT DO YOU SAY TO BEING MY PERSONAL BITCH UNTIL I KICK YOU OUT AN AIRLOCK SOMETIME? SOUND FUN? THEN COME ON!”</i>");
	output("\n\nThe mining laser revs up, glowing red hot. Here we go!");
	processTime(1);
	clearMenu();
	flags["KHORGAN_LEFT_COVER"] = 100;
	flags["KHORGAN_CENTER_COVER"] = 100;
	flags["KHORGAN_RIGHT_COVER"] = 100;
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CaptainKhorganMech());
	CombatManager.victoryScene(victoriousVsCaptainOrcButt);
	CombatManager.lossScene(loseToCaptainKhorganBadEnd);
	CombatManager.displayLocation("CAP. KHORGAN");
	
	addButton(0,"Next", CombatManager.beginCombat);
}

public function updateKhorganMechCover():void
{
	var coverRemaining:Number = 0;
	if(currentLocation == "KHORGAN_LEFT_COVER") coverRemaining = flags["KHORGAN_LEFT_COVER"];
	else if(currentLocation == "KHORGAN_RIGHT_COVER") coverRemaining = flags["KHORGAN_RIGHT_COVER"];
	else if(currentLocation == "KHORGAN_CENTER_COVER") coverRemaining = flags["KHORGAN_CENTER_COVER"];
	coverRemaining = Math.round(coverRemaining * 10)/10;
	output("\n");
	if(coverRemaining >= 100) output(" Your cover is still in pristine condition!");
	else if(coverRemaining >= 75) output(" The cover is largely intact.");
	else if(coverRemaining >= 50) output(" The cover is in pretty rough shape.");
	else if(coverRemaining >= 25) output(" Cover is getting pretty sparse.");
	else if(coverRemaining > 0) output(" There’s barely anything to hide behind at this point!");
	else output(" <b>There isn’t a scrap of cover to be found! You need to move!</b>");
	output(" (" + coverRemaining + " %)")
}

//Mining Laser Charge Shot
//One MEGA attack, low accuracy


//Crate Throw
// Medium damage, chance to cause knockdown or stun or something


public function khorganMechBonusMenu():void
{
	if(currentLocation == "KHORGAN_RIGHT_COVER")
	{
		addButton(10,"Move Left",moveLeft,undefined,"Move Left","Move to the next platform and its cover.");
		addDisabledButton(12,"Move Right","Move Right","There’s no more floating platforms to your right. You’ll have to move left!");
	}
	else if(currentLocation == "KHORGAN_CENTER_COVER")
	{
		addButton(10,"Move Left",moveLeft,undefined,"Move Left","Move to the next platform and its cover.");
		addButton(12,"Move Right",moveRight,undefined,"Move Right","Move to the next platform and its cover.");
	}
	else if(currentLocation == "KHORGAN_LEFT_COVER")
	{
		addButton(12,"Move Right",moveRight,undefined,"Move Right","Move to the next platform and its cover.");
		addDisabledButton(10,"Move Left","Move Left","There’s no more floating platforms to your left. You’ll have to move right!");
	}
}
public function moveRight():void
{
	clearOutput();
	output("You sprint along to the next platform and whatever cover it has to offer!\n");
	if(currentLocation == "KHORGAN_LEFT_COVER") currentLocation = "KHORGAN_CENTER_COVER";
	else if(currentLocation == "KHORGAN_CENTER_COVER") currentLocation = "KHORGAN_RIGHT_COVER";
	CombatManager.processCombat();
}
public function moveLeft():void
{
	clearOutput();
	output("You sprint along to the next platform and whatever cover it has to offer!\n");
	if(currentLocation == "KHORGAN_RIGHT_COVER") currentLocation = "KHORGAN_CENTER_COVER";
	else if(currentLocation == "KHORGAN_CENTER_COVER") currentLocation = "KHORGAN_LEFT_COVER";
	CombatManager.processCombat();
}

//Missile Incoming!

//Captain Phase 1: PC Victorious
public function victoriousVsCaptainOrcButt():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("The reinforced mining suit shudders, smoke billowing off of it as the captain struggles to keep it standing. With one final roar of outrage, she levels the mining laser at you, intending to go down with a fight... but it doesn’t fire. Indeed, it <i>catches</i> fire as she spins it up, quickly bursting into flames from excess heat. You bat a billow of smoke away from your face as the suit collapses to one knee, its guns melting to slag.");
	output("\n\nBut she’s not done yet! The intact hand of the suit reaches out, grabbing you before you have time to react. You gasp, fighting for breath as the suit’s powerful grip threatens to crush you... before hurling you into the platform behind it. You go tumbling, back slamming into a sheer rock face -- though it’s strangely smooth, cold to the touch. Rubbing your head, you look up to see a thick vein of platinum running up through the crust.");
	output("\n\nWith a pneumatic hiss, the mech suit’s cockpit flings open, and the captain rolls out. You momentarily think she means to surrender, until you see the hilt of a sword in her hand. With a flick of her wrist, the hilt erupts in a blade of sheer force, glowing a brilliant blue in the dim light of the sundered core.");
	output("\n\n<i>“You stupid " + pc.mf("bastard","bitch") + ",”</i> the captain sneers, standing to her full height -- an impressive seven feet, at the least. Her corset strains to keep her heaving chest in check as she takes a step forward, raising her force cutlass in a classic duelist’s pose. <i>“All you and the damn Peacekeepers had to do was stay back a few hours... nobody had to get hurt. But you... now you’ve ruined everything. Probably killed half my crew, haven’t you? And now my suit! My beautiful suit!”</i>");
	output("\n\nYou have just enough time to ready your [pc.meleeWeapon] when she lunges at you, only barely parrying the thrust.");
	output("\n\nShe circles, breathing hard. <i>“You’re strong, I’ll give you that. That suit should have been able to mow through a whole squad of soldiers, but you...”</i>");
	output("\n\nKhorgan sighs, a slight grin crossing her lips. She charges, swinging low. You parry, leaping back as you see the feint for what it is, only just dodging a left hook that would have had you on your ass. She follows up with a few swings which you alternatively dodge or parry before countering with your own attack, pushing her back -- and giving you some room to breathe.");
	output("\n\n<i>“Good!”</i> the captain grins, the fury in her voice fading to what you might venture to call mirth. <i>“You’re good, Steele. Maybe even good enough...”</i>");
	output("\n\nYou just catch the dangerous glint in her eye before she rushes you. Your weapons clash, but she’s <i>strong</i>, strong enough to lock blades with you and start twisting your weapon aside. You strain against her, trying to keep yourself centered, but to no avail -- she pushes you aside just enough to smash her head into yours, sending you staggering back. Rather than follow-up, though, she roars in triumph, head and arms thrown back in a primal display. Her tricorn flutters aside, revealing a shock of brilliant orange hair against her green skin, a flowing braid dancing behind her as she starts to circle again, force cutlass readied.");
	output("\n\n<i>“Why did you come here, Steele?”</i> she sneers, <i>“Are you some kind of hero -- thought you could save the planet from the big, bad pirates?”</i>");
	output("\n\nYou move next, charging in with a pair of wild swings, enough to batter down her guard before you fully commit, leaping into an overhand blow. She dodges at the last moment, pulling back hard -- your weapon sheers through air and fabric, tearing into the front of her corset. When she recovers, she’s grinning maniacally, her big breasts barely restrained by the remaining strings of her outfit, threatening to burst free at any moment as tatters of fabric fall away.");
	output("\n\nKhorgan regards you with fiery red eyes, and to your surprise, laughs. <i>“You really ARE good, aren’t you. Ha! I’ll enjoy breaking you... and breeding you, if you’re lucky.... Why don’t you put the weapon down, Steele. You’re wasting your time, you know that? The bomb was never meant to go off. It was just insurance, to keep the Peacekeepers away. We’d have disarmed it before we left. It would have worked, too, if a mad" + pc.mf("","wo") + "man like you hadn’t come along and stuck your FUCKING NOSE IN.”</i>");

	output("\n\n");
	//If PC beat Kaska:
	if(pc.hasKeyItem("Kaska's Detonator"))
	{
		output("<i>“You have the other detonator, don’t you? Well, you can’t disarm the bomb without both, Steele! Neither of us can.”</i> ");
	}
	output("From her pocket, she pulls a small remote, and glances at it. <i>“Not much time left, Steele. Maybe you ought to start running... you might make it back to your ship, if you’re lucky. Or maybe you’d rather get a ride out with me, hmm? Submit to me, and I guarantee you’ll live. You might even like being my personal bitch....”</i>");
	pc.shields(pc.shieldsMax());
	clearMenu();
	addButton(0,"Fight", configKhorganFight, undefined, "Fight!","The captain’s clearly not going down without a fight. Time to finish this.");
	//Go to Captain Fight: Part 2
	addButton(1,"Demand",demandSurrenderFromPirate,undefined,"Demand Surrender","She’s desperate, you can hear it in her voice! Tell her to put HER weapon down, if she wants to get out of this.");
	//Tooltip: She’s right. You don’t have a chance...
	addButton(2,"Give Up",surrenderToCapnKhorgath,undefined,"Surrender","Surrender to the Captain. Why bother fighting?");
}

public function configKhorganFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CaptainKhorgan());
	CombatManager.victoryScene(youBeatUpAnOrcWaytoGo);
	CombatManager.lossScene(loseToCaptainKhorganBadEnd);
	CombatManager.displayLocation("CAP KHORGAN");
	CombatManager.beginCombat();
}

//Demand Surrender
public function demandSurrenderFromPirate():void
{
	//Tooltip: She’s desperate, you can hear it in her voice! Tell her to put HER weapon down, if she wants to get out of this.}
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("<i>“You’ve got no chance, captain. How about YOU put your weapon down,”</i> you say, holding your ground.");
	output("\n\n<i>“Ballsy,”</i> she laughs, still clutching her force cutlass tight. <i>“I like that in a " + pc.mf("","wo") + "man. Tell you what: force me to. Fight me, Steele, and if you win, the detonator is yours... and me with it. If you lose, though, I’ll still take you as my personal fuck-slave.”</i>");
	output("\n\n<i>“Or would you rather we sit here flapping our gums till the timer runs out? That’ll be a hell of a way to go, out with a blast, huh!?”</i>");
	output("\n\nIf you want to get out of this, it doesn’t look like you’re going to have much of a choice after all.");
	processTime(1);
	//[Fight!]
	clearMenu();
	addButton(0,"Fight",configKhorganFight,undefined,"Fight!","The captain’s clearly not going down without a fight. Time to finish this.");
}

//Surrender Yourself
//Tooltip: She’s right. You don’t have a chance...
public function surrenderToCapnKhorgath():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("With a heavy sigh, you drop your weapon and gear. At least this way you’ll make it out of here alive, even if Tarkus might be doomed because of it.");
	output("\n\n<i>“Really?”</i> the captain sneers, scowling. <i>“I didn’t think you were that spineless, Steele. Fine, then. Get down on the ground, and don’t make any sudden movements.”</i>");
	//Go to Captain Khorgan's Broodmare badend
	clearMenu();
	addButton(0,"Next",loseToCaptainKhorganBadEnd);
}

/*
Captain Boss Fight: Part 2
//This part is a straight-up combat encounter. She focuses primarily on lust attacks in this form: she wants the PC as her brood slave, not dead. Captain has great physical defenses, but is vulnerable to LUST attacks. (ie, Reverse of last time)
*/

//Captain Fight Phase 2: PC Victorious
public function youBeatUpAnOrcWaytoGo():void
{
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	currentLocation = "360";
	//if by Lust
	if(enemy.lust() >= enemy.lustMax())
	{
		output("<i>“Oh, fuck,”</i> Captain Khorgan growls, the force cutlass falling out of her hand to clatter against the steel platform below. Her hands reach up, clutching at her breasts, tearing what remains of her corset and clothes off to get at the stiff teats beneath. <i>“I can’t.... Fuck it, Steele, you can have the damn detonator. Take it! Just fuck me, take me, throw me on the deck and pound me. I’m all yours, you fucking animal.”</i>");
	}
	//if by Damage
	else
	{
		output("<i>“Oh, fuck,”</i> Captain Khorgan growls, the force cutlass falling out of her hand to clatter against the steel platform below. She wipes a trickle of blood from the corner of her mouth, shooting you a twisted grin even as she winces in pain. <i>“Damn, you’re good. I yield, Steele... have your damn detonator. Have me, too. You’ve earned it,”</i> she adds, her hand slipping down to the ruins of her corset and pulling it aside to reveal the sheer swells of her heaving green bosom. Her look is inviting, almost desperate, practically begging you to fuck her.");
	}
	//Combine:
	output("\n\nYou grab the detonator from her outstretched hand, eyes wandering across the bare expanse of her bust, unable to deny the ");
	if(pc.hasCock()) output("stiffening of your [pc.cocks]");
	else if(pc.hasVagina()) output("the growing wetness in your [pc.vagina]");
	else output("the heat in your own loins");
	output(" as you’re confronted with the lusty captain, a willing thraggen pirate.");
	processTime(1);
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasVagina()) addButton(1,"Girly Fun",thraggenAreABunchOfGreenLesboSlutsGardefordToldMeSo,undefined,"Girly Fun","Make sure every pussy on the deck gets licked, regardless of owner.");
		else addDisabledButton(1,"Girly Fun","Girly Fun","This scene requires a vagina.");
		if(pc.hasCock()) 
		{
			if(pc.cockThatFits(chars["CAPTAINKHORGAN"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",dickFuckDatThraggenCoochie,undefined,"Dick Fuck","Give her what she’s asking for.");
			else addDisabledButton(0,"Dick Fuck","Dick Fuck","Her body couldn’t handle what you’re packing.");
		}
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","Unsurprisingly, this scene requires a phallus.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You aren’t turned on enough for sex at the moment.");
		addDisabledButton(1,"Girly Fun","Girly Fun","You aren’t turned on enough for sex at the moment.");
	}
	addButton(14,"Leave",leaveDatThragginBootayBehind);
}

//Leave
public function leaveDatThragginBootayBehind():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("<i>“I don’t think so,”</i> you say, giving the captain the slightest push -- which in her state, is enough to topple her over. She gives a startled gasp as she collapses into a lusty heap on the ground, legs splayed and boobs jiggling. You take a moment to tie her hands together before, detonator in hand, you turn your back on the cursing, hot mass of greenskin behind you.\n\n");
	if(!pc.hasKeyItem("Khorgan's Detonator")) pc.createKeyItem("Khorgan's Detonator",0,0,0,0);
	CombatManager.genericVictory();
}

//Dick Fuck
//It from Defeat menu: 
public function dickFuckDatThraggenCoochie():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN_NUDE");
	showName("CAPTAIN\nKHORGAN");
	var x:int = pc.cockThatFits(chars["CAPTAINKHORGAN"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	flags["DICKFUCKED_CAPN_KHORGAN"] = 1;
	//Combat defeat
	if(inCombat()) output("You can hardly turn down an offer like that.");
	//Repeat repeat
	else output("Time to take advantage of the suddenly submissive captain. ");
	//if no detonator:
	if(!pc.hasKeyItem("Khorgan's Detonator"))
	{
		output("You pocket the detonator before");
		pc.createKeyItem("Khorgan's Detonator",0,0,0,0);
	}
	else output("You start by");
	output(" stepping up and grabbing the captain by the waist, pulling her into a deep kiss. Her breath catches at the sudden move, but she quickly relents, her powerful hands quickly searching down your own body, grabbing your [pc.butt] and squeezing hard.");
	output("\n\nWhen you break the kiss, she’s smiling wide: <i>“I don’t even mind losing. Not to someone as strong as you. Among the thraggen, there’s no shame in yielding to a foe who proves [pc.his] superiority... and you have.”</i>");
	output("\n\nWith a few slight movements of her hands, she starts to pull the [pc.gear] from your body, baring the [pc.skinFurScales] beneath. You return the favor, tearing apart what’s left of her corset so that her breasts fall fully free, pressed against your own [pc.chest] as your hands run all over each others, tearing at clothes and groping at bare stretches of flesh, slowly working towards each others’ most sensitive parts. Eventually, you hook your fingers through her belt and give it a downward tug. She gives a little moan as you wiggle her breeches off, leaving the damp, torn garments for her to kick off. True to form, that captain’s gone without panties, leaving the dark gash of her sex on blatant display, already glistening with slick excitement.");
	output("\n\n<i>“Oh yeah,”</i> she groans as your wandering hand caresses her mons, a pair of fingers easily probing their way into her. <i>“Right there, Steele. Just like that.”</i>");
	output("\n\nYou thrust your hand deeper, burying your digits to the knuckles, and are rewarded with a gasp of pleasure and a feral growl as Khorgan wraps her powerful arms around you, squeezing you almost painfully tight. You’re about to complain when one of her legs hooks around your [pc.leg]; you give a little yelp as the two of you tumble to the ground, slamming into the steel deck with head-rattling force. When your vision clears, though, you see that all’s well with the world: the captain’s straddling you, thighs clamped around your [pc.hips] with her own slick sex poised overtop [pc.oneCock], almost on the brink of penetration.");
	output("\n\n<i>“I want you,”</i> she breathes huskily, leaning down just enough to press her face to yours, her tongue tracing along the line of your jaw, licking along your sweat-slick [pc.skin] as she starts to grind against you, her pussy reaching down to kiss the length of your stiffening shaft, rubbing along it. You gasp, reeling from the electric shock of pleasure spreading from your loins as your [pc.cock " + x + "] reacts to her wet, hot touch, jumping to attention by the time she’s finished one full bounce along its now-turgid length. She doesn’t stop, her hips continuing to pump up along your cockflesh, rubbing it down through the slit of her sex until your [pc.cock " + x + "] is well and truly drenched, smeared with feminine slime so that it glistens in the dim light of the core.");
	output("\n\nGrinning, Khorgan rises on her knees, one hand firmly planted on your [pc.chest] to support herself, the other reaching up to grope one of her massive green melons. She gives you a look as if to say, <i>‘are you ready?’</i> as her hips shift, finally aligning the channel of her sex with the [pc.cockHead " + x + "] of your [pc.cock " + x + "]. You give her a slight nod, and quickly find your head rolling back, a primal roar of sexual satisfaction rolling off your lips as Khorgan slides onto you, submerging your [pc.cock " + x + "] into the tight, sweltering, sodden slit between her legs.");
	pc.cockChange();
	output("\n\n<i>“YES!”</i> Khorgan roars, back arched and tits bouncing as she slams herself down on your rod. The breath explodes from your chest as the captain’s hips ram into yours and the amazonian woman starts to ride you, bucking and bouncing overtop you. Her movements are forceful and violent, every buck of her hips an attack against you with almost bone-shattering force. You groan and struggle under her, but the captain’s sexual assault is overwhelming, threatening to batter the cum right out of you -- and probably put you in the hospital, if the green-skinned slut’s got anything to say about it.");
	output("\n\n<i>“Do you like it, Steele?”</i> the captain teases at the apex of another pelvis-crushing bounce, <i>“Cum for me. Breed me.... Give me one of your powerful offspring.... Imagine what we could do together....”</i>");
	output("\n\nOh no she doesn’t! Marshalling what’s left of your strength, you issue a primal roar of outrage as you flip the both of you over, slamming the captain’s back into the deck and leaving you on your [pc.knees] between her splayed legs. Khorgan looks up at you in shock, just as you hike her legs up over your shoulders and slam your [pc.hips] in, hilting your [pc.cock " + x + "] in her. Rather than resisting as you might have expected, the captain gives you an approving nod and hooks her hands under her powerful legs, holding them nice and wide, giving you unobstructed access to her cunt.");
	output("\n\nNow it’s your turn. You lean in through the splayed gulf of her groin, deep enough to grab one of the dark teats atop Khorgan’s breasts between your teeth, rolling the pert bud between your incisors until the captain groans with pleasure, vaginal muscles tensing around your thrusting prick. At this angle, though, no matter how tight she clenches, you’ve got the perfect vantage to pound her pussy. Your hips piston forward, slamming home against her up-raised cheeks with enough force to make her whole body tremble, her hefty tits bouncing hypnotically with every thrust.");
	output("\n\nYou grab those heavy, perfect orbs, sinking your fingers into the pliant flesh until Khorgan’s howling with pleasure, all but begging for release. You refuse to let up on your furious sexual assault, putting the amazonian in her place with your hammering [pc.hips] and thrusting cock filling her cunny. Finally, the captain throws her head back and gives a feral, lusty roar -- a sound that echoes out through the gulf of the planet’s riven core as she cums. Her muscular legs wrap around your neck, pulling you tightly into the heaving mounds of her tits as she climaxes, letting you feel the heat radiating off her lust-addled body, the beat of her heart through the tensed muscles of her sex as she slathers you in fem-spunk, drenching your groin even as her pussy milks you, muscles instinctively trying to drain the seed from you.");
	output("\n\nThat, at least, you’ll let her have. You move faster, your [pc.hips] slamming into her with greater and greater force as your speed reaches dizzying heights. The captain’s orgasm drags out as you hammer her, pulling you closer and closer to your own with her low, guttural cries and wild-wringing muscles. Between your frantic thrusts, you feel your orgasm coming, a thick rope of [pc.cum] surging through your [pc.cock " + x + "] and into the slick, squirming tunnel of the captain’s sex.");
	output("\n\n<i>“Fuck yes!”</i> Khorgan screams, feeling your seed ");
	if(silly) output("sploosh");
	else output("rush");
	output(" into her. Before she can continue, you silence her with a rough kiss, forcing your tongue through her lips and across the pointed tips of her fang-like teeth. The thraggen captain grunts her approval, hands grabbing your [pc.butt] and forcing you deeper inside as you blow your load into her cumming cunny. With her pulling you in, you finally hilt yourself inside her");
	if(pc.hasKnot(x)) output(", your [pc.knot " + x + "] forcing the lips of her pussy wide open, lodging itself in the mouth of her cunt");
	output(". Panting, you finally disentangle yourself from the cum-filled thraggen, leaning back on your [pc.knees] and heaving a sigh of exhaustion. The captain grins up at you, fingers rubbing gingerly at the rim of her sex, making no move to resist you as you grab her wrists and tie them to the wreckage of her mech suit. You gather your gear and get ready to leave.");
	if(flags["TARKUS_BOMB_TIMER"] != 0) output(" There’s a bomb that needs your attention.");
	processTime(20+rand(10));
	pc.orgasm();
	if(inCombat()) 
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else 
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Lesbos- gardeford can into helping
//Gardeford wrote dis! :D
public function thraggenAreABunchOfGreenLesboSlutsGardefordToldMeSo():void
{
	clearOutput();
	showBust("CAPTAIN_KHORGAN_NUDE");
	showName("CAPTAIN\nKHORGAN");
	author("Gardeford");
	//if First time:
	if(flags["LESBOED_KHORGAN"] == undefined)
	{
		flags["LESBOED_KHORGAN"] = 1;
		output("Who are you to refuse such a tempting offer?");
		//if no detonator:
		if(!pc.hasKeyItem("Khorgan's Detonator"))
		{
			output(" You pocket the detonator before");
			pc.createKeyItem("Khorgan's Detonator",0,0,0,0);
		}
		else output(" You start by"); 
		output(" giving her a push in the center of her oh so inviting chest. Given her weakened state, your push is enough to send her falling back with a grunt of surprise.");
	}
	//If Repeat:
	else
	{
		output("You grab the well-fucked captain by the tatters of her corset, locking eyes with her before giving her a firm push down. She grunts with surprise as you cast her down, though her eyes tell you instantly she’s ready for more.");
	}
	output("\n\nShe lands on her butt but falls further as you follow her down, pressing her onto the floor of the station by the stomach. Her breasts jiggle as they are shaken in the half prison of cloth that used to be her corset. You lie next to her, holding her arm down with the weight of your upper body as you lean in and give her a kiss that presses the back of her head to the floor.");
	output("\n\nShe grins happily as you pull away. <i>“I feel no shame yielding to someone as strong as you, " + pc.mf("Mr.","Ms.") + " Steele. Among thraggen, there is nothing wrong with losing to a superior foe... and superior you are.”</i>");
	output("\n\nAs she speaks, her hands strip you of your [pc.gear]. Her free hand grips the [pc.skinFurScales] of your shoulder, while the arm that’s under you gropes at one cheek of your [pc.butt]. You join her after you’re free of obstructions, ripping away the tattered remains of her shirt and corset. Her breasts fall fully free when you’re done, still glistening with the sweat of your fight.");
	output("\n\nYou grasp one of her tits in your palm, giving it a squeeze before narrowing your hold to pinch her darker viridian nipple. Her trapped arm twitches, instinctually wanting to join your hand in playing with her breasts. Luckily for her, you have no intention of leaving your current plaything’s twin unattended. You lean in close, starting at the base of her arm and kissing along the side of her sizeable melon. Your kisses culminate as you reach her rock hard nipple, softly biting it as you gaze lustily into the thraggen pirate’s eyes.");
	output("\n\nAs your mouth works its magic on her breast, you let your hand trail down her stomach, brushing the cleanly defined muscles of her abs. When you reach her waist, you find it’s still covered by her britches, but decide to leave them there for now. You slip your hand under the belt of her pants, pleased to find that the green-skinned captain has gone commando. You dip your fingers into the folds of her vagina, circling her hole once before plunging two fingers into its depths.");
	output("\n\n<i>“Yes, Steele! More!”</i> she moans, her hand replacing the missing one in fondling her abandoned tit. The heat of her cunt is immense inside the hotbox of her pants, and you feel the warmth of it spreading up your arm as you dig your fingers deeper inside at her insistence. The nipple in your mouth has become nearly as hard as the platinum the captain was so invested in mining, and you bite a little harder with each pass until you have Khorgan roaring with pleasure at each touch of your teeth.");
	output("\n\nThe lust-drunk pirate bucks her hips against your hand, her legs rapidly alternating between being locked together and splaying out in rapture. The inner walls of her sex clamp around your hand like a cinch, but you pull in and out just as rapidly, adding a third finger to your spelunking escapade. In the excitement, you fail to notice that her other arm has edged its way out of the body trap you’d placed it under.");
	output("\n\nYou tense in astonishment as a feral growl escapes the captain’s throat, and she grasps both of your shoulders, rolling both of you over until she lies on top of you. <i>“I can’t just lie there and not give anything back, can I Steele?”</i>");
	//if pc shortstack:
	if(pc.tallness <= 59) output("\n\nShe sits atop your fingers, hands gripping at [pc.fullChest]. You gasp with pleasure as she squeezes your [pc.breasts] and tweaks your [pc.nipples]. Her hips gyrate on your fingers, still buried in her pants. The britches, having already been tatters at the start of your lovemaking, are soaked so deeply that droplets of Khorgan’s feminine juices drip down periodically onto your own sex. You shiver as her fluids mix with the ones already trickling down your [pc.legOrLegs] from [pc.eachVagina].");
	//if pc notsoshort:
	else output("\n\nThe thraggen captain straddles your hand which still lies buried in her pants. She grins at you, baring her fang-like teeth before gently biting one of your [pc.breasts]. Her soft gnawing grows in intensity until you flinch with discomfort, at which point she eases up, sucking on your [pc.nipple] to soothe your hurt. Her tongue is just as developed as the rest of her muscles, and plays across your flesh like an exotic dancer. You shiver as the euphoric mixture of pleasure and pain sends rivulets of your sexual fluids dripping down your [pc.legOrLegs].");
	output("\n\nDespite how good she’s making you feel, you aren’t about to give up control of the situation. While the captain is busy playing with your [pc.chest], you pull your fingers out of her burning cunt and move them around to her chiseled ass. You slip your second hand under her pants as well, caressing her cheeks to further lull her into a false sense of security. The next time she clenches her legs together to keep herself up, you swiftly withdraw your hands and pull her torn britches down to her knees, flipping her onto her back with the momentum.");
	output("\n\nThe jade-skinned pirate’s face is a mask of shock, and seeing it brings a renewed feeling of triumph and vigor to your body. You grip Khorgan’s bewildered form around the waist, pulling her wonderfully tight butt and cunt up to your face, and hugging her back to your [pc.chest]. Despite the fact that it has been freed from enclosure, her cunt is still thoroughly soaked with sweltering hot juices. The sight and smell of it causes [pc.eachVagina] to become noticeably wetter.");
	output("\n\nUnable to wait any longer, you bury your face in her waiting folds. Your [pc.tongue] dives into her hole, licking around her insides as your nose rubs fervently against her budding clit. The thraggen captain grunts and moans at the sudden penetration, momentarily unsure of what to do with herself. Eventually her hands find their way to her breasts, playing and tugging at them with a mindless resolve. Holding her in place with one arm, you join one of her hands in massaging, intertwining your fingers with hers and coaxing her to squeeze her helpless tit with a little extra force.");
	output("\n\nKhorgan’s well muscled legs shudder and tense in the air above the two of you, trapped together by the tattered remains of her britches. Her eyes have lost some of their fiery intensity, and seem to be set in focus as she resists your assault to the best of her ability. Her jaw is clenched with teeth bared, ");
	if(silly) output("considerably white for a pirate. You guess no one has an excuse to not keep up with dental hygiene considering new advances in the technology.");
	else output("but you imagine you’ll have her howling in short order.");

	output("\n\nA final twitch of her clit is the only warning you get before the pirate captain’s body fulminates in a planet-cracking orgasm. You hear a wet rip as her pants tear into two halves, freeing her legs to splay out in the air, letting your face nuzzle even deeper into her now fully exposed spasming cunt. A burst of femcum splatters over your face, dribbling down her stomach and back as you pull away. Her body leaves her no energy for shouting, so all the noise she can make is a soft moan as she rides out the euphoria. You gulp in a couple breaths of fresh air before returning your attentions to Khorgan.");
	output("\n\nYour victory prize remains where you left her, still trying to recover as aftershocks of the orgasm you put her through occasionally send shudders through her body. There’s still something missing from this equation though. You haven’t actually gotten off yet, but you think you have the answer to that problem. You straddle the insensate amazon’s face, planting [pc.oneVagina] directly over her mouth.");
	if(pc.isNice()) output("\n\n<i>“Come on, you gotta help me after that,”</i> you say with a smile, running your hand through her sweat slicked hair.");
	else if(pc.isMischievous()) output("<i>“You can’t be done so soon,”</i> you chide teasingly.");
	else output("<i>”Lick,”</i> you command with a grin.");

	output("\n\nSome primal part of the poor girl must hear you, as she weakly grasps your hips and pulls you down onto her mouth. Her tongue laps at your juices and licks your folds, sending small shockwaves of bliss through your body");
	if(pc.hasClit())
	{
		output(" when she teases ");
		if(pc.totalClits() == 1) output("a");
		else output("your");
		output(" [pc.clit]");
	}
	output(". You massage her tensed body while she tends to your cunt, rubbing the stress out of her athletic abs and sturdy hips. While the idea of fingering her again is tempting, you decide to let her off the hook, especially since she’s doing such a good job.");
	output("\n\nHer powerful tongue has since slipped into your [pc.vagina " + x + "], pressing all the right places with all the right pressure. In a matter of seconds, one of her tongue’s strokes passes a spot that fills your head with rhapsodic bliss. Your body follows closely behind, tensing and showering Khorgan’s face with your [pc.girlCum]. You remain seated for a few more seconds to catch your breath, giggling as the pirate captain continues to weakly lick your mons periodically. Eventually, you raise yourself from her, gathering your gear before turning back to her. She offers no resistance as you tie her hands together and hitch them to her mech suit, giving you a warm grin as your juices drip from her nose.");
	if(flags["TARKUS_BOMB_TIMER"] != 0) output("\n\nGetting back to the matter at hand, there’s a bomb that requires your attention.");
	processTime(20+rand(10));
	pc.orgasm();
	pc.girlCumInMouth(chars["CAPTAINKHORGAN"]);
	if(inCombat()) 
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else 
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Captain Khorgan's Broodmare Badend
//If PC loses in the Mecha Fight
public function loseToCaptainKhorganBadEnd():void
{
	var cockGrow:Boolean = false;
	
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN_NUDE");
	showName("CAPTAIN\nKHORGAN");
	//if PC loses in the Swordfight, via lust:
	if(enemy is CaptainKhorgan && pc.lust() >= pc.lustMax())
	{
		output("\n\nYour [pc.knees] buckle");
		if(pc.legCount == 1) output("s");
		output(" as the captain’s sexual advances continue, her breasts all but falling out of her corset, her wide hips swaying hypnotically with every motion. Your loins burn with desire, making your grip on your weapon shakey, your palms sweating. Taking a step forward, the thraggen woman easily bats your weapon aside, and it clatters to the ground, slipping from your loose grasp. With an easy push, she send you onto your back and plants one of her boot on your chest, utterly asserting her dominance.");
	}
	//if PC loses in the Swordfight, via damage:
	else if(enemy is CaptainKhorgan)
	{
		output("\n\nYou’re losing ground. Even ignoring the sensual assault assailing your senses, the captain’s still an amazing swordsman, and you’re banged up after that fight against her mech. It’s hard to keep standing, much less fighting. You can barely feel your hand by the time she easily bats your weapon from your hand... right before giving you a nasty right hook that plants you on the ground. With a smirk, the captain plants one of her boot on your chest, utterly asserting her dominance.");
	}
	else output("Laser bolts and rockets explode around you, hammering into your defenses, tearing through the steel platform around you. Suddenly, another bolt tears into your [pc.rangedWeapon], shredding your weapon and throwing you to the ground. You cough and struggle, trying to get on your [pc.feet], only to suddenly feel a crushing weight bearing down on your chest as the captain’s mech suit lumbers up, pinning you down. The captain exits the suit, stepping out the cockpit amidst pneumatic hisses, and replaces her suit’s great, heavy foot with her own.");
	//Combine, next para.
	output("\n\nGrinning fiercely, the captain says, <i>“You’re brave, Steele. Brave and strong. Not enough to defeat ME, of course, but still, those are admirable qualities among the thraggen. It would be such a waste to kill you... maybe I could make some use out of you, then. What do you say, Steele? Do you want to live?”</i>");
	output("\n\nYou nod. All thoughts of heroism, all ideals and hopes, your tough facade, it all breaks down when you feel her blade against your throat, her boot crushing down on your chest. You don’t want to die.");
	output("\n\n<i>“Good choice,”</i> the captain says, looming over you. She flicks off her sword and sheathes it, kicking your own weapons away from you. <i>“I think you’ll make a good breeder, Steele. We’ll have such strong children... and if you’re a very, very good bed slave, you might see the sun again.”</i>");
	//if PC doesn't have a cock.
	if(!pc.hasCock())
	{
		output("\n\n<i>“Though we’ll have to make some changes, of course,”</i> the captain leers, reaching into her pocket and drawing out a pill bottle. <i>“I was thinking about using these myself, but... well, you’re not quite up to my standard as you are, Steele. I’m sure you won’t mind changing a bit for me, will you?”</i>");
		output("\n\nYou think a moment. Her other hand is still resting on her blade. <i>“N-no...”</i>");
		output("\n\n<i>“No </i>what<i>?”</i> the captain snaps, her foot grinding on your [pc.chest].");
		output("\n\nYou groan. <i>“No, captain.”</i>");
		output("\n\n<i>“Good,”</i> she grins, taking two pills out of the bottle. As she does so, you’re able to catch a glimpse at the label on the side: THROBB. You gulp as the captain leans down, doing nothing but opening your mouth obediently as she puts the pair of pills atop your tongue. You swallow -- no sense in defying her now. She’d know. You gulp the pills down and wait, a slight moan escaping your lips as you soon begin to feel the tell-tale tingling of nanomachines rewriting your body, changing your very genetic structure. Your fingers claw at the steel platform, trying to steady yourself as a wave of pleasure crashes through your loins and a twisting sensation churns ");
		if(!pc.hasVagina()) output("under your bare crotch");
		else 
		{
			output("just above the slit");
			if(pc.totalVaginas() > 1) output("s");
			output(" of your sex");
		}
		output(".");
		output("\n\nYou can’t help but scream in pleasure as your groin erupts, the skin of your crotch reforming and bulging, growing out from your loins into a thick, long, humanoid prick. Your body convulses, shuddering in pleasure as as your new, throbbing cock forms. ");
		
		pc.createCock();
		processTime(5 + rand(6));
		cockGrow = true;
	}
	else output("\n\n");
	output("The captain coos");
	if(!pc.isNude() && !pc.isCrotchExposed()) output(" as she tears into your equipment, ripping it off");
	output(" before planting her foot straight on the base of your cock. You groan under the sudden pressure on your member, shifting under the semi-pleasurable weight of her foot on your rod, rubbing you ever-so-slightly as she decides what to do with you.");
	
	pc.removeAll();
	
	output("\n\n<i>“Not bad,”</i> Khorgan says with a slight smile, sizing up your prick. She leans back against the deactivated mech, grabbing it for support and kicking off her boot, revealing one of her bare, green feet. She returns them to your crotch, planting her heel under your cock’s base and gripping the shaft between her toes, tugging your sensitive flesh upwards. You grimace, shuddering as a strange pleasure washes over you. Khorgan grins, cupping one of her own large, dark tits, squeezing it between her powerful fingers as her foot moves up and down your shaft, jacking you off - just to see you squirm, you think. You try and put on a brave face, resisting her advances, but soon find yourself grunting and moaning, your [pc.hips] moving on their own, bucking into the underside of your captain’s foot.");
	output("\n\nShe grins at your unwilling submission, grinding down hard on your rod until a thick bead of [pc.cum] drools from its tip, smearing across your belly. You fidget, trying to hold back and failing horribly, unable to contain your sounds of pleasure at the surprise footjob. She’s relentless, her toes jacking you off with sure, ceaseless motions, only growing stronger as your will weakens. Her toes wrap around you, the firm green skin startlingly smooth on your cock, yet strong enough to nearly make you cum in moments.");
	output("\n\nYour resistance to her advances crumble to nothing before you can fully understand what’s even happening to you; with a grunt, you find yourself cumming");
	if(cockGrow) output(", the sensation utterly alien and strange as your new-grown cock cums for the very first time");
	output(". Your hips buck instinctively as a high moan is torn from your lips by the orgasmic pleasure coursing through your body, and [pc.cumColor] spunk surges up your shaft, working up by the incessant movements of her foot. Your back arches, body nearly going numb as you blow your load, cum blasting from your crown onto your belly, [pc.chest], and the sole of Khorgan’s foot.");

	output("\n\nThe captain sucks in a hiss of breath as your hot seed splatters across the bottom of her foot, her lips twisting into a feral grin as you cream yourself. <i>“Tsk, already? I suppose it can’t be helped. And the smell... delicious. Strong.”</i>");

	output("\n\nThe captain’s foot lifts from your spent prick and moves upward, hovering over your [pc.face]. With a grin, the captain commands you, <i>“Clean me off. Let’s get you used to your new place in life, Steele. Soon enough, that tongue of yours is going to lick me clean every night...”</i>");

	output("\n\nYou shudder at the thought, recoiling as the muscular, amazonian woman hovers her spunk-soaked foot over you, teasing, <i>“If you’re lucky, it will only be your seed you need to eat. Better me than my precious Tam, isn’t it? She’d have you sucking every cock on the crew, if I know the crazy cat.”</i> You hesitantly let your tongue poke out from your mouth, tracing along the bridge of her foot and lapping up your own cum. You shudder at the [pc.cumFlavor] taste of your own seed, but at the captain’s insistence, you proceed, lapping up the cream you smeared on her supple skin.");
	output("\n\nKhorgan coos appreciatively, her wandering hand shifting down from her breasts to her crotch, slipping into her pants, where a damp patch of excitement is steadily growing. <i>“Good " + pc.mf("boy","girl") + ". That’s it, learn your place. You’re nothing more than my slave, now. A breeder. A personal fucktoy. But the way you creamed yourself, the way you’re licking up your own seed... I think you were made for it. All that strength, for nothing. No, for me... my use. My enjoyment.”</i>");
	output("\n\nYou recoil as the captain plants her foot back on the deck, now spotless, and hauls you up by the nape of your neck");
	if(pc.tallness < enemy.tallness) output(", leaving your [pc.feet] dangling beneath you");
	output(". You stare into her fiery red eyes, and realize that this is your place now, your life. Nothing but the captain’s personal stud.");
	
	processTime(10 + rand(11));
	
	pc.loadInMouth(pc);
	for(var i:int = 0; i < 8; i++)
	{
		pc.orgasm();
	}
	
	badEnd();
}

//Post Combat Captain
//Since she doesn't actually disappear when you win.
public function approachCaptainPostDefeat():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	//Captain was Fucked: 
	if(flags["DICKFUCKED_CAPN_KHORGAN"] != undefined || flags["LESBOED_KHORGAN"] != undefined) output("Captain Khorgan looks a little dazed after your last encounter, but there’s no disguising her eagerness for more.");
	//Captain wasn't fucked:
	else 
	{
		output("You step up to the defeated captain, cutting her bonds free. The captain rubs her wrists, staring you down.");
		output("\n\n<i>“What do you say, captain?”</i> you grin, looming over the greenskin. <i>“Time to make good on that offer....”</i>");
	}
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasVagina()) addButton(1,"Girly Fun",thraggenAreABunchOfGreenLesboSlutsGardefordToldMeSo,undefined,"Girly Fun","Make sure every pussy on the deck gets licked, regardless of owner.");
		else addDisabledButton(1,"Girly Fun","Girly Fun","This scene requires a vagina.");
		if(pc.hasCock()) 
		{
			if(pc.cockThatFits(chars["CAPTAINKHORGAN"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",dickFuckDatThraggenCoochie,undefined,"Dick Fuck","Give her what she’s asking for.");
			else addDisabledButton(0,"Dick Fuck","Dick Fuck","Her body couldn’t handle what you’re packing.");
		}
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","Unsurprisingly, this scene requires a phallus.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You aren’t turned on enough for sex at the moment.");
		addDisabledButton(1,"Girly Fun","Girly Fun","You aren’t turned on enough for sex at the moment.");
	}
	addButton(14,"Leave",leaveDaCapnRepeat);
}

public function leaveDaCapnRepeat():void
{
	clearOutput();
	author("Savin");
	showBust("CAPTAIN_KHORGAN");
	showName("CAPTAIN\nKHORGAN");
	output("You leave the good captain as you found her.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Spoils of War: Taking the Platinum
public function takeZePlatinumAwwwwyiss():void
{
	clearOutput();
	author("Savin");
	output("You step up to the crate Captain Khorgan was filling and pick up a chunk of the silvery metal. It’s heavy, but malleable, and incredibly lustrous. Platinum, certainly, but something seems... off about it. You pull your codex out of your pack and boot up your mineral scanning app. The scanner goes to work, quickly identifying the metal: Platinum 190, a super-rare isotope. Rare, and very expensive. You think this would net a tidy profit somewhere....");
	flags["PLATINUM_TAKEN"] = 1;
	output("\n\n(<b>Gained Key Item: Platinum 190</b> - This should be worth a good chunk of change to someone.)");
	pc.createKeyItem("Platinum 190",0,0,0,0);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Kaska (The First Mate & Bomb Guard)

Dark skinned
Right half of head shaved
Firm, high tits
Bigass balls relative to the size of her length.
Shower, not a grower. Only gets an extra 2-3" when hard. Big floppy dick when soft (7"), though.
Laser LMG with underslung automatic slug-gun.
Uses last-based attacks until the PC takes her below 80% health, then goes ALL GUNSHOTS. Now she shoots until she gets horny, then gets all sexual.
Bomb Room Description*/

public function bombRoomBonusFunc():Boolean
{
	author("Fenoxo");
	showBust(kaskaBustDisplay());
	showName("\nKASKA");
	output("Keeping your bearings down here, surrounded on all sides by endless rock, is a challenge. Doing it while your belly does backflips from the lack of gravity is a trial. Luckily you’re anchored to the metal platform by electromagnetic forces, at least as long as the batteries in the kit you picked up from the elevator last.");
	if(flags["TARKUS_BOMB_TIMER"] != 0)
	{
		output(" More pressing is the bomb a few feet away. It’s not nearly as big as you would have expected a doomsday device to be, about as big as a bucket and equally visually appealing. Then again, all it has to do is destabilize this station’s links to let the half planets’ gravitational forces tear each other apart.");
	}
	else output("The bomb you disarmed is still sitting here, inert. With it’s detonators powered down, it’s about as harmful as a toothless tallisarian sand mite.");
	if(!pc.hasKeyItem("Kaska's Detonator"))
	{
		meetUpWithKaskaZeBossSloot();
		return true;
	}
	//Unfucked Appearance
	if(flags["KASKA_FUCKED"] == undefined)
	{
		output("\n\nKaska is sitting in a puddle of her own juices, still stroking her cock and looking at you with needy eyes.");
		addButton(0,"Kaska",approachUnfuckedKaska);
	}
	//Fucked Appearance
	else output("\n\nKaska is floating in place, anchored to the deck by her boots but completely unconscious. Ropes of her jizz float in a cloud around her, to say nothing of the thick smears of it that drench her skin, face, and hair.");

	//Da Bomb!
	//Disarmed
	if(flags["TARKUS_BOMB_TIMER"] == 0) output("\n\nThe bomb is sitting here, inert and useless. It shouldn’t give anyone trouble in its current state.");
	//Active
	else
	{
		output("\n\nThe bomb is sitting here, blinking ominously.");
		addButton(1,"Bomb",activeBombApproach);
	}
	return false;
}

//Kaska meeting
//Starts playing upon entering her room post bomb descriptions
public function meetUpWithKaskaZeBossSloot():void
{
	author("Fenoxo");
	showBust(kaskaBustDisplay());
	showName("\nKASKA");
	output("\n\nThe sharp report of a slug-thrower being fired stops you cold in your tracks. A flurry of sparks erupts from the deckplates a scant few inches ahead of you. Whoever took that shot could’ve hit you if they wanted to");
	if(pc.shields() > 0) output(". Not that it would matter with your shields operational. It’ll take more than a primitive powder-blaster to drop you");
	output(". You finger your [pc.rangedWeapon] while looking around for the source of fire, only to have the shooter reveal herself. Holy hell, does she reveal herself!");
	output("\n\nThe alien woman that strides out from behind one of larger crates is packing heat, and not just from the oversized machine gun she’s toting. A strapping, seven inch member dangles from her groin, laying flaccid atop a pair of lemon-sized balls that you couldn’t miss under the smooth, shining skin of her sack. The pirate is ostensibly clothed, wearing stockings, armored leg plates, and a corset that only serve to make the lack of garments for her crotch that much more noticeable.");
	output("\n\nYour Codex beeps something about her being a “dzaan,” but you’re hard-pressed to pay attention.");
	if(!CodexManager.entryUnlocked("Dzaan"))
	{
		output("\n\n<b>(‘Dzaan’ Codex entry unlocked!)</b>");
		CodexManager.unlockEntry("Dzaan");
	}
	output("\n\nThe hermaphrodite’s (you have to assume - it’s hard to see past that swollen pouch) height and distinctive posture keep your gaze from lingering too long on the rest of her impressive assets. The double-barreled gun she’s hefting one-handed is bigger than her leg, and by the looks of it, it’s a combination slug-gun and laser weapon. The bottom barrel has a small drum magazine, and power indicators along the top indicate that it’s fully charged.");
	//Cap'n Buttsloot downed:
	if(flags["STARTED_KHORGAN_FIGHT"] != undefined) output("\n\n<i>“I can’t believe you took out the Captain,”</i> the newcomer says wonderingly. <i>“Not that it matters. I’m twice the woman she was, and I’ve got the balls to back it up!”</i>\n\nYou... wait... what?\n\nSeeing, your look of incredulity, the well-endowed pirate snorts, <i>“Oh, sod off. You’re dealing with Kaska Beamfury, first mate of the Tarasque, and it’s time a piece of jetsam like you learned [pc.his] place.”</i> She levels her impressive weapon in your direction.");
	//Cap'n Buttsloot not downed:
	else output("\n\n<i>“Who the fuck are you... and how did you get by the captain?”</i> the newcomer asks wonderingly. She goes on, not expecting an answer from you. <i>“It doesn’t really matter. You’re looking at Kaska Beamfury, first mate of the Tarasque - the last sight you’ll ever see if you’re lucky.”</i> She levels her gun. <i>“Now, why don’t you be a dear and give me a decent fight.”</i>");
	output("\n\n<b>There’s no getting out of it. You’ll have to fight!</b>");
	//Start combat
	processTime(3);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Kaska());
	CombatManager.victoryScene(defeatKaska);
	CombatManager.lossScene(defeatedByKaska);
	CombatManager.displayLocation("KASKA");
	
	addButton(0,"Next", CombatManager.beginCombat);
}

//Do Nothing
public function doNothingWhileTittyGrappled():void
{
	output("\nKaska grins as she feels you go limp against her");
	if(pc.hasCock()) output(" but hard somewhere else");
	output(". <i>“Oh, you are adorable! First you act like you stand a chance, and then a little bit of boob turns you to jello.”</i> She relaxes her grip enough to pet ");
	if(!pc.hasHair()) output("the back of your head");
	else output("your [pc.hair]");
	output(". <i>“Go on then, kiss them. You’ll be getting much more familiar with them if I decide to keep you.”</i>");

	output("\n\nYour lips are already pressing against her ebony melons. You go ahead and purse them while you wait. ");
	if(pc.lust() < pc.lustMax()) output("It’s... more pleasant than you thought it would be.");
	else output("It’s too much for your already overloaded mind. What starts as a kiss rapidly degrades into a slobbering, smooching motorboat. These tits are fantastic, and you can’t get enough of them! Why were you even fighting this siren?");
	pc.changeLust(20+rand(10));
	output("\n");
}

//Failed Strugle
public function failToStruggleKaskaBoobs():void
{
	output("You try to struggle, but all you manage to do is squirm against the pillowy, chocolatey prison, rubbing against the pirate’s slick skin in way that’s undeniably pleasant. No matter how hard you try to deny it, your lips and nose are stuffed directly into cleavage. ");
	applyDamage(new TypeCollection( { tease: 10 + rand(5) } ), enemy, pc, "minimal");
	if(pc.lust() <= 50) output("It feels... good to rub against it.");
	else if(pc.lust() <= 80) output("Damn, these tits are great! If you don’t get out soon, things are going to get out of hand!");
	else output("It feels too good to hold out any longer. You start licking and kissing with reckless abandon, letting your struggles to escape cease. Why fight the inevitable?");
}

//Pinch Nipple
//Automatically escapes tittygrapple at the expense of a little bit of lust damage to both of you.
public function pinchKaskaNipple():void
{
	setEnemy(CombatManager.getHostileActors()[0]);
	clearOutput();
	output("One of her leather-covered nipples brushes your cheek, giving you all the information you need to target it. You twist your torso slightly and free enough room for your arm to snake up into her cleavage. Then, your fingers find your target. It’s hard and pebbly. You pinch. Gasping, Kaska drops you, staggering back and panting, her nipples even more visible through the thin xeno-leather corset. Her nipple felt nice between your fingers. Maybe you ought to let her grab you again?");
	output("\n\nKaska merely pants and flushes. Did she enjoy the pinch that much?");
	pc.removeStatusEffect("Grappled");
	applyDamage(new TypeCollection( { tease: 4 + rand(3) } ), enemy, pc, "suppress");
	applyDamage(new TypeCollection( { tease: 7 + rand(3) } ), pc, enemy, "minimal");
	setEnemy(null);
	CombatManager.processCombat();
}

//Defeated by Kaska: Not Turned On
public function defeatedByKaska():void
{
	author("Fenoxo");
	showBust(kaskaBustDisplay());
	showName("\nKASKA");
	if(enemy.lust() < 50)
	{
		output("You collapse, or you would if you weren’t in a weightless environ. Your body hangs bonelessly, tethered in place by the magnetic equipment you picked up from the elevator. Burn marks and wounds riddle your ailing form, and as your eyes drift closed, you hear one final, echoing sound. BLAM!");
		badEnd();
	}
	//Defeated by Kaska: Turned On
	else
	{
		//Get taildrilled, cunt-drilled, tit-drilled, or buttdrilled. Preferences are in that order. After, Kaska throws you over her shoulder and takes you onboard her ship to fit you with a slave-collar. It probably comes off after she breaks your desire to be anything other than her cocksleeve.
		//Lust
		if(pc.lust() >= pc.lustMax())
		{
			//Boobgrappled
			if(pc.hasStatusEffect("Grappled"))
			{
				output("When Kaska lets you slide out of her cleavage and onto the ground, you’re wearing a dopey, excited smile. The kind of smile that says, “I’m doing something stupid, but at least I’m getting laid.”");
			}
			//Normal
			else output("You lean back against a crate as you look up at the lustful pirate. She’s proven a far better tease. Now you’re hoping you’ll find out she’s just as good of a fuck.");
		}
		//HP
		else
		{
			output("You sink to the ground, panting and too injured to move, and Kaska... that horny pirate, Kaska.... She’s just smirking at you and pulling a vial out of her belt.");
			output("\n\n<i>“Don’t you die on me, damnit! You did this to me, so you’re gonna deal with it. Believe me, the captain isn’t the only one doing some drilling today!”</i> Kaska snarls, spitting the cork out into the void. It spins aimlessly through zero G, drifting amongst the floating platforms and rocks that are so common here. <i>“Now drink up. This’ll pep you right up.”</i>");
			output("\n\nGiven the choice between drinking a strange concoction or bleeding to death, you choose not to bleed to death. The silvery draught goes down smooth, leaving an overwhelming orange flavor in your mouth along with a tingling, caustic aftertaste. You cough, <i>“Just what was that?”</i>");
			output("\n\nKaska smiles down at you and tosses the vial into the void. Her other hand lazily strokes her cock, bunching the skin up just below the crown then turning it shiny and taut when she pulls back down to her balls. <i>“Just some military grade microsurgeons mixed with " + getPlanetName() + " love-toxin.”</i> She strokes her appetizing-looking length again, slower. <i>“I like my partners to enjoy what I’m doing to them.”</i>");
			output("\n\nYour scowl of defiance turns into dazed bewilderment as your wounds painlessly close. They should hurt, or at least itch or something. Running your fingers over your [pc.skinFurScales], you feel nothing but good. Licking your lips, you let your palms flatten out and continue to rub yourself");
			if(pc.armor.shortName != "") output(" under your [pc.armor]");
			output(", marvelling at the electric charge of skin on skin, the way your heartbeats speed up with every caress. Just because you feel... fucking awesome... doesn’t mean you’re going to let her fuck you. No drugs can make you lust after her gorgeous tits... or that hard, leaking prick. Your tongue licks your lips again; it’s almost as good as giving a French kiss.");
			//Display all of the below if they fit
			//Cocks
			if(pc.hasCock())
			{
				output("\n\nYour own length");
				if(pc.cockTotal() > 1) output("s aren’t");
				else output(" isn’t");
				output(" far behind.");
				if(!pc.isCrotchExposed()) 
				{
					output(" You can feel your [pc.lowerGarment] slipping and sliding wetly against ");
					if(pc.cockTotal() == 1) output("it");
					else output("them");
					output(", practically soaked with leaking pre-cum.");
				}
				else
				{
					output(" You can feel yourself slipping and sliding against the [pc.skinFurScales] of your [pc.belly], leaking pre-cum like a sieve.");
				}
				output(" It’s so sticky and wet.... You can’t help but be aware of how sensitive your hardness");
				if(pc.cockTotal() > 1) output("es have");
				else output(" has");
				output(" become. Shifting position just a little bit is enough to make your dick");
				if(pc.cockTotal() > 1) output("s");
				output(" jump.");
			}
			//Pussies
			if(pc.hasVagina())
			{
				output("\n\nAnd your [pc.vaginas].... You’re wet. As wet as you’ve ever been and then a little bit more. ");
				if(!pc.isCrotchExposed()) output("There must be a puddle in your [pc.underGarment] by now. ");
				output("You can practically feel your vulva pumping up, bloating with surges of erogenous energy");
				if(pc.hasClit()) output(" that leave your [pc.clits] hard and ready");
				output(". Your [pc.hips] wiggle a little on their own, and it’s enough for you to feel your netherlips slipping and sliding against one another. [pc.EachVagina] is practically fucking itself with your every move.");
			}
			//Nipples - non fuckable
			if(!pc.hasFuckableNipples())
			{
				if(pc.hasDickNipples()) output("\n\nYour nipples make themselves known by suddenly popping out, jutting out from your chest like twin antennas, each begging to be tugged and twisted.");
				else output("\n\nYour attention is rudely yanked down to your chest by your nipples. It’s almost as if they’ve gained sentience and are screaming at your brain, petitioning it for attention, begging to be touched, stroked and fondled.");
				if(pc.isLactating()) 
				{
					output(" [pc.Milk] beads from the tips in narrow streams. The ");
					if(pc.totalNipples() == 2) output("twin");
					else output("army of");
					output(" lactic springs feel oddly like drool - like your tits are so eager for a good groping that they’re actually drooling all over themselves in anticipation.");
				}
				output(" The tips of your nipples ");
				if(!pc.isChestGarbed()) output("tense and tighten, fully engorging, so sensitive that you can feel the air blowing across them, torturously teasing them.");
				else output("catching on your [pc.upperGarment] with every breath, shooting spasms of pleasure up your nerves, making you breathe faster. You’re caught up in an erotic feedback loop and loving it.");
			}
			//Nipples - fuckable
			else
			{
				//Lipples
				if(pc.hasLipples())
				{
					output("\n\nYour [pc.nipples] make themselves known by suddenly puckering, rubbing their increasingly slick lips against one another until they shine. They’re hungry to be filled, to suck and squeeze around something, frictioning their pillowy entrances until the pleasure is sizzling through your nerves nonstop.");
					if(pc.isChestGarbed()) output(" Feeling them slip and slide against your [pc.upperGarment] is almost enough to make you compress the offending garb against yourself in an effort to increase the sensation.");
					else output(" They make noisy kissy sounds in the open air, seemingly possessing their own drives, their own need to consume something. A phallus would do nicely, but you wouldn’t mind letting them kiss some nipples either.");
				}
				//Normal fucknips
				else
				{
					output("\n\nYour nipples, rather than popping out, make themselves known by becoming suddenly, indescribably moist. No, you decide, moist isn’t how they feel at all. They’re wet - soaked even. Your tits feel wet enough to belong on a galotian, slippery and oozing, aching to be penetrated. Every shake and shiver causes the shifting channels in your [pc.breasts] to caress the opposite side of their inner walls, which in turn causes them to get even wetter. Your teats are soon sopping wet, drooling their liquid hunger in torrid cascades.");
				}
				
			}
			//None of the above
			if(!pc.hasCock() && !pc.hasVagina() && !pc.hasDickNipples() && !pc.hasFuckableNipples())
			{
				output("\n\nThere’s no way she can fuck you anyway. You don’t have some dick she can take advantage of or a dripping wet pussy just waiting to get fucked. You’ve only got a mouth... and a... a butthole. She wouldn’t fuck that, would she? You suckle your bottom lip, stifling a moan as best you can, and imagine her ramming that thick, caramel cock straight into you. She could bend you over a crate to do it. Then your [pc.nipples] could drag against the rough surface for extra texture while she pounds your ass. Your sphincter twitches eagerly.");
			}
		}
		//Merge
		output("\n\nLaughing softly, the chocolate-skinned pirate steps over you, stradding your chest. It takes all of a heartbeat for her to sit down on your [pc.breasts]. Her cock, hard and dripping, flops against your cheek, smearing its heady lube across you.");
		output("\n\n<i>“Get me good and wet while I think of what to do with you,”</i> Kaska orders, feeding her length into your surprisingly pliant, unresisting lips. The pre oozing from its slit makes letting it in easy, and once the tip is in, you can’t seem to come up with a reason not to humor the rest of her length. <i>“");
		if(pc.totalVaginas() > 1 || (pc.hasVagina() && pc.hasTailCunt()) || pc.hasFuckableNipples()) output("So many options and only one cock. I wonder which hole I should take first?");
		else output("You are a prize for sure, but I wonder, will you last?");
		output("”</i> The pirate pets your ");
		if(!pc.hasHair()) output("head");
		else output("[pc.hair]");
		output(" while considering, listening to the quiet slurping you make while you polish her rod");
		if(pc.lust() < pc.lustMax()) output(" in a drug-fueled haze");
		else output(", too turned on to care");
		output(".");
		processTime(5);
		pc.changeLust(pc.lustMax());
		//NEXT!
		clearMenu();
		addButton(0,"Next",kaskaBadEndPartDues);
	}
}

public function kaskaBadEndPartDues():void
{
	clearOutput();
	author("Fenoxo");
	showBust(kaskaBustDisplay());
	showName("\nKASKA");
	var choices:Array = new Array();
	if(pc.hasCuntTail()) choices[choices.length] = 0;
	if(pc.hasVagina()) choices[choices.length] = 1;
	if(pc.biggestTitSize() >= 7) choices[choices.length] = 2;
	if(!pc.hasCuntTail() && !pc.hasVagina() && pc.biggestTitSize() < 7) choices[choices.length] = 3;

	var select:int = choices[rand(choices.length)];
	//Taildrilled
	if(select == 0)
	{
		output("Watching your hungry [pc.tails] thrashing behind you, Kaska’s grin broadens into a knowing smile. <i>“Picked up a cunt snake");
		if(pc.tailCount > 1) output(" or two");
		output(", have you? The poor thing looks practically malnourished,”</i> she observes. Grabbing hold of ");
		if(pc.tailCount == 1) output("it");
		else output("one");
		output(", she idly fingers the oozing, slippery tailsex, remarking on the way it suckles her finger, pulling it partway inside, <i>“Oh yes, you and I are going to get along.”</i>");

		output("\n\nBetween the dick in your mouth and the feelings coursing down the length of the lucky tail, you’re in no position to argue. You mutely suck on her length instead, slurping noisily on her rod until she pulls it out. The dusky cock gleams with a thick layer of your saliva. Here and there, bubbles adorn its surface, evidence of some of your more vigorous attempts at oral service. Kaska lifts it away, but only to offer it to another a different, more sensitive part of you - a wetter, more pliant part of you. Clenching your knuckles, you brace yourself for the coming penetration. Feelings of overwhelming eagerness are being fed up your spine, making it difficult not to smile. It’s contagious.");
		output("\n\nThe dickgirl pirate doesn’t push herself inside right away. She takes it slow, rubbing her glans against your [pc.tailgina]’s over-lubricated folds, finding the little clit and letting her cumslit prod at the thing before sliding back across the other way. Your entrance feebly gropes at her tantalizing, leaking dick, sucking down every drop of pre yet powerless to pull the tool’s proper length inside. You squirm beneath Kaska, too turned on and excited to sit still, until she tires of her game and allows your [pc.tailgina] to envelop her head.");
		output("\n\nGasping at the same time as Kaska, you revel in the sensations pouring up your tail and into your brain. No matter how many times you feed the");
		if(pc.hasParasiteTail()) output(" parasitic creature");
		else output(" alien tail");
		output(" that has become part of you, you’ll never get used to the surges of raw pleasure that it feeds you in return. Every tail-feeding experience seems calibrated to fill your pleasure-centers with bubbling bliss, and once you get used to it, it merely shifts the pattern and vector of its transmissions to tickle your mind anew.");
		output("\n\nThe amount of tactile sensation hitting your cerebellum is enough to make picking apart any detail impossible, so you lie there, hearing the sounds of the slow, sucking penetration more than feeling it. There’s too much ecstasy to pick out the individual threads of feeling, the pressure of a vein against your inner walls, the curvature of her glans probing into you. They’re definitely there, but you lack the ability to process them.");
		output("\n\nSighing, Kaska admits, <i>“Now this is a pussy.”</i> She lets it engulf her down to the root. <i>“If I had known that these little - mmm... that these little");
		if(pc.hasParasiteTail()) output(" parasites");
		else output(" tail-pussies");
		output(" felt like this! I would have gotten one long ago. Oh, fuck yes!”</i> Her hips quiver uselessly, anxious to thrust and fuck, an action rendered unnecessary by talented muscles working over her cock. She mauls her own breasts in response, taking out her energies on an untended-to erogenous zone, her fingers disappearing under the taut xeno leather of her top.");
		output("\n\nYou gradually become aware of a bone-dry thirst, totally incongruous with how full of spit and pre your mouth is after the short blowjob. The [pc.tailgina]’s desires must be transmitting so powerfully as to override your own sensations. Aching, empty, desire fills you to paradoxical capacity, and your hands reach forward to caress Kaska’s weighty, twitching balls. You’ve got to have her cum! Kneading her swollen cum-tanks, you feel them twitch in your palms, wet with the musky juices of a barely-concealed pussy. They bounce and contract at your touches, ready to blow any second now. All it will take is a little something to push them past the point of no return.");
		output("\n\nThe lusty privateer arches her back, grinding her slit against your [pc.chest]. The bump of her clit catches on a [pc.nipple], enough to make her scream in sudden climax. Her hips shudder with barely-contained energy, and then lurch forward, dropping her balls square on top of your mouth and her slit directly onto your chin. The first rope of heady cream blasts into your tunnel at the same time, triggering a climax of your own. Your mouth opens to vocalize your pleasure but immediately fills with weighty, twat-slicked sack, transforming your moans into muffled vibrations that caress Kaska’s cum-pumping ballsack, shaking every hidden drop of sperm loose for the dickgirl’s orgasm.");
		output("\n\nYou lose consciousness to the feel of the busty pirate’s sweat-slicked body grinding against you.");
	}
	//Cunt-drilled
	else if(select == 1)
	{
		var x:int = rand(pc.totalVaginas());
		output("It does not take the well-endowed pirate long to settle on a course of action. Her fingers, slightly calloused from hard work and practice with her firearms, slide down your body to the passion-inflamed slit");
		if(pc.totalVaginas() > 1) output("s");
		if(pc.legCount > 1) output(" at the joining of your [pc.legs]");
		output(", pressing softly against your labia until you begin to moan into the dickgirl’s turgid shaft.");
		output("\n\nKaska sighs and comments, <i>“This is a nice, sensitive pussy you’ve got here. A breeder’s pussy.”</i> She makes slow, lazy circles around the flushed entrance. <i>“I don’t think the Cap’n will object to me finally claiming a harem for myself so long as I’m not cluttering up the ship with a bunch of pregnant sluts.”</i> Pumping her finger in hard enough to make you squeak, she adds, <i>“Of course, I’ll have to break you in first.”</i>");
		output("\n\nBreak you in?");
		output("\n\nKaska adds a second finger, wiping the incredulous look off your face with a flash of pleasure. Her digits feel so firm and hot against you, and they pump so wonderfully. It’s difficult to maintain a cogent line of thought in the face of it. She rambles on, laughing softly to herself all the while, <i>“Yeah, I’m gonna break you in. Once this little honeypot gets a taste of being well and truly fucked, it’ll never want to go back to its old life.”</i> She squeezes a third finger in while her cock drools tasty dollops into your throat. <i>“There’s a reason my race tends to have dozens of willing girls for every alpha herm.”</i>");
		output("\n\nThe tip of her thumb graces");
		if(pc.hasClit()) output(" [pc.oneClit] with a gentle brush");
		else output(" your sensitive labia with a gentle rub");
		output(", sending your [pc.hips] to shaking and grinding back against the invasive lengths of her fingers.");
		output("\n\n<i>“I’m told it’s something about chemically addictive pregnancy or causing slight glandular imbalances, but I never really paid much attention in school,”</i> Kaska admits. She slides backwards, pulling her iron-hard length out of your mouth. Spit bubbles on your lips as you regard her dully, too busy getting fingered to answer. <i>“All that matters is that I’m going to fuck you here until we leave, then fuck you a little more once we’re flying out of here. By the time we land, you’ll be begging me not to pull out.”</i>");
		output("\n\nShifting her position, the horny woman places her soaked tool against the [pc.vagina " + x + "] she had been so busily fingering. <i>“Just try not to scream too loudly. The Captain’s trying to work over there.”</i>");
		output("\n\nThe sensation of her thick, eleven-inch length spreading your folds triggers a minor orgasm. You grunt low in the back of your throat and ball your hands into fists, trying to hold on, to keep from letting your muscles from going slack and passive. Some part of you still longs for control of the situation - of your body - but such protestations are in vain. Kaska has you pinned to the ground with your mouth full of the taste of her dick and ");
		if(pc.vaginaTotal() == 1) output("your");
		else output("a");
		output(" pussy crammed full of the genuine article. Juices puddle under your [pc.butt], and [pc.hips] press upwards");
		if(pc.hasClit()) output(", grinding your [pc.clits]");
		output(" into the pirate’s toned crotch.");
		pc.cuntChange(x,chars["KASKA"].cockVolume(0),true,true,false);
		output("\n\nA strong hand settles around your neck, putting a stop to your squirming and subtly declaring Kaska’s control of the situation, driving home just how in control of your body she is as this point. She squeezes just enough to keep a fragment of your attention there, and pushes her hips back. The motion is sinuous and graceful. You can actually see her back gently roll with the graceful rhythm as she slides back in, fucking you with practiced, natural ease, her every motion driving home that she was born and bred to do this.");
		output("\n\nThe way that the caramel-skinned beauty takes you is casual and unhurried, like she’s merely using [pc.oneVagina] as little more than a masturbation sleeve for a lazy, drawn-out release. Her thrusts come perhaps a second apart. She’s reveling in the journey through your juicy gates, bathing in the feeling of your folds against her rigid veins");
		if(pc.hasClit())
		{
			output(", wallowing in the way that your [pc.clits] rub");
			if(pc.totalClits() == 1) output("s");
			output(" against her");
		}
		output(" when she’s all the way in. Not all of the lubricants leaking down your [pc.thighs] are your own, though. Some of Kaska’s own are dripping down the backside of her potent nutsack, and her pre-cum is churning your lubricant into a spunky slurry.");
		output("\n\nPanting gently, Kaska slightly increases the pace, watching you intently and smiling when you moan whorishly.");
		output("\n\nIn between grunts, she observes, <i>“I think my harem member is starting to like her new position, isn’t she”</i>");
		if(pc.femininity < 40) output(" Kaska doesn’t seem to care about your masculinity. To her, you’re little more than a pet pussy waiting to be tamed.");
		output("\n\nYou shake your head back and forth while biting back another moan, trying your very best to maintain some small ounce of dignity.");
		output("\n\n<i>“Oh, how can you say that while your hot, wet cunt is squeezing my dick like a long lost lover?”</i> Kaska asks while tightening her grip on your throat to hold you still once more. <i>“How can you sit there and deny your inner slut? Look at you, flat on your back on the deck, moaning and dripping for the big, strong dickgirl pirate.”</i>");
		output("\n\nKaska pinches a [pc.nipple] with her free hand, and you can’t help but cum, twitching feebly against her. Your pussy ripples hungrily around her shaft, trying to milk it for all it’s worth, but only earns a few drops of pre-cum for its efforts.");
		output("\n\nThe confident hermaphrodite laughs and dips a finger into the juices puddling beneath you and licks it, humming happily at the taste. Her cheeks darken in a slight flush, and her member surges inside you, not far from orgasm. <i>“Here, taste yourself,”</i> Kaska offers, gathering another coating of wetness on her fingertips before pressing them through your [pc.lips]. The taste is... [pc.girlCumFlavor], not unpleasant and entirely sexual. Her hips never slow, not even while you’re suckling your juices from her fingers. <i>“That’s a slut’s taste,”</i> she explains.");
		output("\n\nHer easy dominance combines with your own shameful position to finally overwhelm your resistance. Your mouth tastes like slutty, horny pussy and a thick, musky cock. Your cunt is creaming itself over Kaska’s masterful length, and you can’t deny it. You’re loving every second of it. When the well-cleaned fingers are withdrawn from your mouth, you moan and cum once more. Your hands automatically reach for your [pc.chest], seeking your [pc.nipples], but Kaska simply bats them away, fucking your spasming slit all the while. The orgasms are getting closer and closer together, but your alpha’s face shows nothing but approval.");
		output("\n\nShe speeds her pace into a proper, hard fucking, sending you into a world of constant, crotch-drenching climaxes. Some unknowable amount of time later, Kaska finally joins you in release, squirting hot jets directly into your needy quim. Your [pc.vagina " + x + "] noisily squelches from the fluid load and still-thrusting futanari, and ");
		if(pc.wetness(x) < 2) output("strings");
		else if(pc.wetness(x) < 4) output("runnels");
		else output("torrents");
		output(" of [pc.girlCum] deepen the puddle below. Kaska cums for what feels like ages, more than long enough for you to ride out two orgasms and be feeling aftershocks from the second by the time she stops out.");
		output("\n\nYour crotch is gooey");
		if(pc.hasStatusEffect("Goo Crotch")) output("... uh, more so than usual");
		output("... sticky with spent lust and totally, completely satiated.");
		if(pc.hasCock()) 
		{
			output(" You were so into it that you didn’t even notice your [pc.cocks] firing off onto your ");
			if(pc.biggestCockLength() < 12) output("[pc.belly]");
			else if(pc.biggestCockLength() < 18) output("[pc.chest]");
			else output("[pc.face]");
			output(".");
		}
		output(" All that cum, and the thick dick that put it there, have made you feel flush and woozy, perhaps a little cum-drunk. You giggle and sigh, limp beneath Kaska. Yeah... you can probably deal with being in her harem.");
	}
	//Titdrilled
	else if(select == 2)
	{
		output("The pirate smirks. <i>“Melons like these have better uses than being cushions for my ass.”</i> She arches her back, sliding her toned butt down to press against your [pc.belly] while simultaneously dragging her well-sucked dick free of your maw. It slips across your cheek and over your collarbone before finally coming to rest atop your cleavage. Kaska admires the view, admitting, <i>“I used to be jealous of girls with boobs like these until I realized that they belonged on obedient chattel, not women of consequence like myself.”</i>");
		output("\n\nYou open your mouth to reply, but Kaska simply grabs your [pc.nipples] and pinches hard enough to make you wince. Despite the hurt it causes, an undercurrent of erotic thrill comes along with it.");
		output("\n\n<i>“The only thing I want that mouth for is sucking cock. If you had any thoughts worth talking about, you would’ve had the sense not to try fighting me,”</i> she growls, tugging your nipples apart to let her dick fall into the valley between them. Then, she lets go, and your quaking boobs slam together around the intruding member, wreathing it in a pillowy cocoon of warm titflesh. <i>“Mmm, see? That’s perfect. Look at it. Have you ever seen a more perfect sight?”</i>");
		output("\n\nLicking the taste of her cock off your lips, you do as she bids either out of subservience or your own curiosity, you can’t say. The sight that greets you is about what you expected, but the experiences of expecting something and seeing it for yourself are wildly different. There’s a big, fat cockhead jutting out of the top of your mountainous melons, glistening faintly with your saliva, slipping slightly with every breath either of you takes. You swallow noisily. It is kind of hot.");
		output("\n\n<i>“See?”</i> Kaska offers, <i>“Big boobs like those are meant to wrap around a dick. Why would you have them if not to please fat cocks like mine?”</i> The pirate presses her hands down on either side to increase the friction. <i>“Mmm, yeah, now that’s the stuff. Why don’t you go ahead and tend to yourself while you watch, okay slut?”</i>");
		output("\n\nYou don’t need to be told to get yourself off twice in the state you’re in, nor can you ignore the sight of her thick, vein-corded shaft starting to slowly rock back and forth through your cleavage, making your boobs jiggle and quake. Your hands reach down, ");
		if(pc.hasCock()) output("grab [pc.oneCock], and start to feverishly stroke.");
		else if(pc.hasVagina()) output("press against [pc.oneVagina], and start to vigorously finger the opening.");
		else output("find your [pc.asshole], and start to rub around the sensitive ring");
		output(". Kaska smirks adjusts her grip so that her thumbs can circle up to your [pc.nipples]");
		if(pc.hasFuckableNipples()) output(" and sink inside");
		output(".");
		//Fuckable nips
		if(pc.hasFuckableNipples()) 
		{
			output("\n\nBeing penetrated while being titfucked nearly throws you over the edge on the spot. Her thumbs are like anchors inside your [pc.breasts], causing every jiggle and shake to vibrate your flesh against the stable digits. ");
			if(!pc.hasLipples()) output("[pc.GirlCum]");
			else output("Saliva");
			output(" soon slicks Kaska’s fingers and trickles into your cleavage, lubricating her increasingly fevered thrusts. The horny dickgirl doesn’t seem to mind this development. In fact, she starts to aggressively circle her thumbs around your [pc.nipples], stimulating them to leak even more.");
		}
		//Nonfuck nips
		else
		{
			output("\n\nThe slow circling of her thumbs starts out as a simple, pleasant feeling layered on top of your own masturbation, but the longer she does it, the more raw and intense the sensations become. When she finally decides to pinch them again, you nearly scream in ecstasy before mastering yourself enough to turn it into a muffled moan. The horny dickgirl doesn’t seem to mind in the slightest. In fact, she starts to pinch them with each titty-bouncing thrust, watching you try not to act like a wanton slut while being thoroughly taken.");
		}
		//Nipvariant Merge
		output("\n\nBetween how turned on you were before this all started, your busy hands, and the fact that a live-action porno is taking place a scant six inches from your face, you find yourself coming close to climax all too soon. Kaska smiles knowingly and pumps your tits faster. You watch her dick vanish into your pre-soaked mounds and remerge, nearly hitting you on the chin now. The pirate must be getting close herself, because a fresh drop of pre is beading on her tip each time she lurches into you now. It’s so close. You could kiss it, if you wanted.");
		output("\n\nThe decision is taken out of your hands when Kaska abruptly grabs you by the back of the head and pulls you up, pressing your lips into her dick. There’s no time to think about it, and in your current state, you probably won’t turn it down anyway. The herm’s girlcock lodges itself into your mouth, pulsing on your tongue, and unloads a thick, mouth-filling glob of cum. You gurgle around it as your fingers bring you off at the same time and swallow. She tastes salty, savory, and unmistakably sexual. You find yourself wanting more to go along with your climax. Kaska provides in spades.");
		output("\n\nThe hermaphrodite’s balls quake against the other side of your well-fucked tits while they unload. You marvel at the way her dick thickens with each heavy jet of cream that it delivers. Her ejaculations are on par with some of the terran ultraporn stars you’ve seen. Perhaps she could surpass them for sheer quantity. It’s hard to judge when your mouth is flooded with so much cum that it’s squirting out around the edge of your [pc.lips]. It’s even harder when you’re cumming at the same time.");
		output("\n\nYou do your best to drink it all down. By the time she’s finished, you feel full, and your [pc.skin] practically glows with satisfaction.");
		if(pc.hasPerk("Ditz Speech")) output(" Of course, sucking cocks feels awesome. Why wouldn’t it?");
		else output(" You never would’ve expected to derive such satisfaction for oral service, but you do all the same.");
		output(" You idly wonder when she’s going to do it again, not that you want more of her cum or anything.");
	}
	//Buttdrilled catchall
	else
	{
		output("It doesn’t take Kaska long to make up her mind. Reaching back, she grabs hold of your [pc.butt] and squeezes your cheeks, kneading them affectionately. <i>“Since you don’t have something better for me to fuck, I’ll have to see to training your ass. You can be my ");
		if(pc.tallness <= 60) output("little ");
		else if(pc.tallness >= 84) output("oversized ");
		output("anal toy.”</i> She pulls out of your mouth and stands up, pointing at one of the nearby crates. <i>“Bend over.”</i>");
		output("\n\nYou’re so turned on that you’ll take it however you can get it at this point and ");
		if(pc.tallness <= 60) output("struggle to get in place on the crate. It’s just so hard with how little you are! Fortunately, Kaska sees your plight and lifts you up by your hips, propping you up on the crate for a nice buttfuck.");
		else output("bend over the crate without a second thought. Kaska gives your [pc.butt] an approving swat.");
		output("\n\n<i>“That’s a good girl”</i> Kaska says");
		if(pc.femininity < 40) output(", ignoring your obvious masculinity");
		output(", <i>“Anal isn’t my favorite, but I suppose I could get used to seeing you like this. Once you get used to taking me, you’re never going to want to do anything else. You’ll be my little harem buttslut.”</i>");
		output("\n\nWait, harem... what?");
		output("\n\nOne of Kaska’s hands presses against the small of your back. Her dick’s hot, pre-oozing tip fingers your sphincter a minute later. Rather than pushing in, she holds it there, pressing against you just hard enough to hold it in place. She does let her hips gently rock from side to side, dragging her hard tip over every sensitive part of your pucker. Her other hand comes to rest on your shoulder, and she slowly begins to thrust forward.");
		output("\n\n<i>“Just relax,”</i> Kaska coos while unsubtly pushing herself through your ");
		if(pc.analVirgin) output("virgin");
		else if(pc.ass.looseness() < 2) output("virginal");
		else if(pc.ass.looseness() < 3) output("tight");
		else output("well-trained");
		output(" asshole. You do your best, but she feels so damn thick. At least she’s slick with pre-cum and your own spit. The randy dickgirl moves her other hand up to join her first at your shoulders, levering another inch of her length up your rear entrance and saying, <i>“Yeah, I think this’ll work fine.”</i> She crams another two inches inside. You gasp. <i>“Once I wring a few anal orgasms from you and get you used to having an ass full of spunk, you’ll never want to do anything else. I hear it’s something about our cum being chemically addictive in large enough doses, I guess. I didn’t bother to pay attention in school though, so we’ll just have to find out, huh?”</i>");
		pc.buttChange(chars["KASKA"].cockVolume(0),true,true,false);
		output("\n\nHer balls clap against your [pc.butt]. As absolutely stuffed as you feel, you didn’t expect her to bottom out already. The dickgirl pirate’s length was just so slippery that it was able to ease right in. Your backside is tingling erotically");
		if(pc.hasCock()) output(", and [pc.eachCock] drips with pre-cum, squeezed out of your compressed prostate");
		else output(", and you can’t help but wonder how good it will feel once she’s cumming inside you");
		output(". Involuntary spasms clench your [pc.asshole] around the anal intruder, squeezing Kaska’s dick in what feels like a familiar, affectionate way.");
		output("\n\n<i>“Ooh, buttslut likes, does she?”</i> Kaska asks while reaching down to cup one cheek. <i>“I’m told a lot of races don’t really care for it, my own among them, but us alphas just can’t help but want to plug it.”</i> She slowly pulls out, dripping pre-cum over the emptiness inside you before thrusting back into her self-lubricated, anal toy. You shiver in unexpected delight.");
		output("\n\nKaska suggests, <i>“There must be a helluvalot of nerves back there, or something. In my experience, people that don’t like anal just didn’t have a partner that knew what they were doing.”</i> She bounces off your cheeks, lazily fucking your ass with slow, even strokes. <i>“I’ve never had anyone complain after I’ve pounded their ass.”</i> She playfully paddles your bum. <i>“Aside from complaining about walking funny, that is.”</i>");
		output("\n\nYou nod; you’ll definitely be walking funny when she finishes with you, but it does feel really, really good. Your [pc.legOrLegs] tremble");
		if(pc.legCount == 1) output("s");
		output(" when she bottoms out again.");
		if(pc.hasCock()) output(" Milked-out [pc.cumNoun] trickles down the side of the crate in small streams. You haven’t even came yet, but she’s squeezing the stuff out of you nonetheless.");
		output(" Wow.");

		output("\n\nPicking up the pace now, Kaska suggests, <i>“So, what do you say, buttslut, are you gonna want me to do this again later?”</i>");
		output("\n\nPerhaps it’s pride or the desire to maintain some shred of dignity, but you decline to answer with your voice. It’d sound too turned on and needy. You lie, shaking your head no.");
		output("\n\n<i>“Really?”</i> Kaska asks, slapping her balls against you as she picks up the pace. Your body shivers under the aggressive dickgirl, slowly learning every intimate detail of her member. You could probably pick it out of a crowd by the patterns and texture of the veins that cover it. <i>“You’re gonna sit there and lie, pretending you don’t like THIS!?”</i> She bottoms out and holds it there, flexing her muscles to make her dick bounce slightly inside you.");
		output("\n\nYou can’t hold back the throaty moan of pleasure that wells up in your chest. It’s too much.");
		output("\n\n<i>“That’s what I thought, slut,”</i> the pirate boasts, <i>“I’ve never met a bitch who didn’t love the feel of this beast inside them. You do love it, don’t you?”</i> She presses her hips against you hard enough to flatten your cheeks a little, squeezing an extra half-inch inside you. <i>“You love it when I buttfuck you.”</i>");
		output("\n\n<i>“Yes...”</i> the hissed admission hangs in the air. You didn’t mean to say it, but you did. There’s no taking it back or denying now. You’ve lost this fight too. There’s no more reason to hide, so you let your mouth open and your voice pour out another ‘yes’. This one is louder and syrupy with desire, the kind of sound a girl on the cusp of an orgasm might make. Admitting it makes your [pc.asshole] tingle pleasantly, or perhaps that’s the length inside you. Unconcerned, you try the word out again, this time moaning it wantonly.");

		output("\n\nKaska picks up fucking you, going faster now. She purrs, <i>“Good slut,”</i> while her hips piston away, feeding her eleven inches into your nicely-gaped ass with ease. You’re coming to hate the empty feeling moments when she’s almost pulled out, but they make the seconds of total penetration that much sweeter. Her sweaty balls noisily slap at your [pc.skinFurScales], churning with their burgeoning load. Her cock is getting thicker as well, filling past capacity with blood in the seconds before it finally cums.");
		output("\n\nScrabbling at the edge of the crate, you brace yourself as Kaska joins you in moaning, digging your fingertips into the metal and plastic as the dickgirl really starts to ream you. The spit and precum have combined into a slurry of fuck-fueling lubrication that noisily squelches with each pistoning thrust. Over the sensual din, you hear her cry out, <i>“Take it, slut!”</i> a moment before her cock surges. The feeling of her cum flooding your ass is like a subtle, spreading warmth that makes her thrusts feel even better.");
		output("\n\nYour [pc.legOrLegs] flop");
		if(pc.legCount == 1) output("s");
		output(" bonelessly as you’re drilled and filled, your ass inseminated with alien spunk and loving it. Your [pc.asshole] flutters, leaking cum, and you finally lose it, screaming and babbling encouragement, degrading yourself and begging her to fill you up with more. Kaska does not disappoint. Her orgasm even manages to outlast your own. By the time you sag, limp, she’s still pumping her hips and creaming your backdoor.");
		output("\n\nLying there, helpless and spent, you’re surprised by how satisfying it feels to take her jizz, how right it feels nestled inside you. Anal isn’t supposed to be quite this good, is it? Isn’t this how vaginas are supposed to feel, not assholes? Kaska squirts a last dollop of her cock’s heavy cream into your stuffed belly, scattering any concerns. You won’t mind doing this again.");
	}
	//Merge with generic kaska pulling out of a well-fucked hole and giving the PC a sedative.
	output("\n\nYou’re barely aware of Kaska pulling ");
	if(select != 2) output("out of your well-filled hole at first");
	else output("away at first");
	output(", but the conspicuous lack of cock does eventually rouse you from your lazy, post-coital state. You blink open your eyes to look up at her in time to see her leaning over you with a dermamist applicator. She presses it to your neck, and you hear the quiet hiss of it delivering something through the membrane of your skin. Blackness takes you....");
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",kaskaBadEndPartIII);
}
//Next page -> "Some time later..." Describe PC's living conditions and state, focusing on lusting after the next time Mistress will use him/her. End with Kaska coming home with a bimbo cow-girl and the two of you sucking her off together.
public function kaskaBadEndPartIII():void
{
	moveTo("GAME OVER");
	showLocationName();
	
	clearOutput();
	author("Fenoxo");
	showBust(kaskaBustDisplay());
	showName("\nKASKA");
	output("<b>Some time later....</b>");
	output("\nYou wouldn’t have expected to wake up embedded on Kaska’s dick somewhere on the edge of civilized space, but you did. You wouldn’t have expected to moan so shamelessly at the realization either, but you did. You certainly wouldn’t have expected to sit quietly in the corner, rubbing your [pc.belly], while Kaska got permission to take you as her part of the score. And feeling excited at the Captain’s confirmation? That was out of the question, but you did. Secretly, you thrilled at it.");
	output("\n\nYou were made to service Kaska three more times before making port. It was surprisingly easy; you just settled in front of her chair, opened up, and started sucking. The pirate crew might have been dining on food, but you never really got hungry, or wondered why. Once, when you started talking, Kaska pulled you onto her soft cock to give you something to do. It still tasted vaguely of her cum. It took over fifteen minutes of sucking to extract every ounce of flavor, but then she was leaking again.");
	output("\n\nYou got to see Kaska’s apartment later. It was really messy, and when you told her, she told you that you’d have to clean it before you could have her cock again. At first, that didn’t seem that bad. You were used to doing lots of things, but as you sat there, cuddled on her couch watching the latest holoprograms, you started to want it.");
	output("\n\nBefore you knew it, you were cleaning. Kaska even found you a feather duster, but a few minutes after you started dusting, she was on you, giving you just what you needed. You still finished dusting after, too. It was better when she let you have her cock at all hours of the day. You got really good at sucking dick and mopping up cum stains.");
	output("\n\nIt was really hard the first time Kaska went out on jobs. You were home alone, and after a few hours, the need for her became almost overwhelming. It was agony and ecstasy. You’d sit there for hours masturbating to the nastiest dickgirl porn you could find on the extranet, barely doing anything else, just imagining the taste and texture of Kaska on your tongue or in your ass - anywhere, really.");
	output("\n\nWhen Kaska got home days later, you were an absolute mess. She had to scrub you down in the shower because you hadn’t showered the entire time. Of course, her dick was in your mouth the whole time.");
	output("\n\nAfter that, she’d remember to leave some of her spunk for you in the refrigerator, and you would keep the place spotless in her absence, greeting her on your [pc.knees] and ready for a dose of the fresh stuff. Your sense of initiative dwindled to nothing, but love and submissiveness grew to replace it. You had forgotten your father’s fortune by the end of the first week in Kaska’s apartment; living with her was the real treasure.");
	
	days += 7 + rand(2);
	processTime((rand(24) * 60) + rand(60));
	
	pc.removeAll();
	pc.shower();
	
	for(var i:int = 0; i < 28; i++)
	{
		pc.loadInMouth(chars["KASKA"]);
		if(rand(2) == 0) pc.loadInMouth(chars["KASKA"]);
		if(rand(4) == 0) pc.loadInMouth(chars["KASKA"]);
		if(rand(6) == 0) pc.loadInAss(chars["KASKA"]);
		if(rand(4) == 0) pc.orgasm();
	}
	
	badEnd();
}

//Defeat Kaska
public function defeatKaska():void
{
	clearOutput();
	author("Fenoxo");
	showBust(kaskaBustDisplay(true));
	showName("\nKASKA");
	//Lust
	if(enemy.lust() >= enemy.lustMax())
	{
		output("<i>“By the stars...”</i> Kaska groans before dropping to her knees and tugging on her dick. She’s wantonly fucking herself at this point, only paying attention to you to fuel her masturbatory fantasy. Her vagina is curiously ignored but dripping.");
		output("\n\nHer gun has floated off somewhere, but a blinking detonator is hanging from her hip. Kaska doesn’t stop you from swiping it. It might come in handy for defusing the bomb.");
		if(pc.lust() >= 33) output(" Of course, you’re pretty horny, and she didn’t seem to be in any rush. You could pretty easily get her to service you, if you wanted.");
	}
	//HP
	else
	{
		output("Kaska doubles over, dropping to her knees and cradling a myriad of injuries. She looks hatefully in your direction, scowling as she produces a vial with a glittering, silver liquid. <i>“I really should’ve kept some of this unaltered...”</i> She pops the cork. <i>“Bottoms up!”</i>");
		output("\n\nYou lunge forward to stop her from drinking the mystery fluid, but it’s too late. She’s already swallowed it, and the vial and cork are floating harmlessly away. Kaska groans, <i>“Last time I premix repair microsurgeons with love-toxin.”</i> A bleeding wound on her cheek closes, good as new. <i>“This stuff was meant to save some nubile cutey!”</i> Another wound closes. Kaska licks her lips, humming softly, <i>“It isn’t so bad.”</i> She bats one of her hands away from her tits and smiles, her dick surging to full erectness while you watch. <i>“You ARE kind of a cutey.”</i>");
		output("\n\nThe pirate can barely manage to keep her hands off herself, and after a few more seconds admiring you, she begins brazenly stroking herself to the sight of you, alleviating any concerns that that vial might lead to more fighting. Kaska crawls over to you, repeatedly licking her lips and groping herself all over while she masturbates, ignorant of the fact that the detonator on her hip is on full display.");
		output("\n\nYou take the device in case you need it to disarm the bomb and consider your options.");
		if(flags["TARKUS_BOMB_TIMER"] >= 60) output(" She didn’t seem to be worried about the bomb going off any time soon. Maybe she would like a chance to slake your lusts.");
	}
	if (!pc.hasKeyItem("Kaska's Detonator")) pc.createKeyItem("Kaska's Detonator",0,0,0,0);
	processTime(1);
	//Options
	if(pc.lust() >= 33)
	{
		if(pc.hasCock() && pc.cockThatFits(chars["KASKA"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",victoryKaskaDicksex,undefined,"Dick Fuck","She seems awful proud of her male endowment. Maybe she could stand to learn a little about taking one from someone else.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You need to have a penis that would fit in Kaska’s vagina for this.");
		if(pc.hasVagina()) addButton(1,"Cunnilingus",makeKaskaSuchYerCoochLikeABaws,undefined,"Cunnilingus","She’d be a pretty great pussy licker while she takes care of herself....");
		else addDisabledButton(1,"Cunnilingus","Cunnilingus","This scene requires you to have a vagina.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You are not aroused enough for this act.");
		addDisabledButton(1,"Cunnilingus","Cunnilingus","You are not aroused enough for this act.");
	}
	addButton(14,"Leave",leaveKaskaPostCombat);
}

//Leave
public function leaveKaskaPostCombat():void
{
	clearOutput();
	author("Fenoxo");
	showBust(kaskaBustDisplay(true));
	showName("\nKASKA");
	output("An overheated dickgirl isn’t any problem of yours. You leave her panting on the deckplates, still stroking herself.\n\n");
	CombatManager.genericVictory();
}

//Unfucked Appearance
//Kaska is sitting in a puddle of her own juices, still stroking her cock and looking at you with needy eyes.
//Fucked Appearance
//	Kaska is floating in place, anchored to the deck by her boots but completely unconscious. Ropes of her jizz float in a cloud around her, to say nothing of the thick smears of it that drench her skin, face, and hair.

//Repeat Conscious Approach
public function approachUnfuckedKaska():void
{
	clearOutput();
	author("Fenoxo");
	showBust(kaskaBustDisplay(true));
	showName("\nKASKA");
	output("Kaska, still tugging her length, smiles at your approach. <i>“I should hate you right now, but everything is awesome, and you’re awesome, and I’m so fucking hard, and you can fuck me however you want, just fuck me!”</i> Well... you suppose you could do just that.");
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock() && pc.cockThatFits(chars["KASKA"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",victoryKaskaDicksex,undefined,"Dick Fuck","She seems awful proud of her male endowment. Maybe she could stand to learn a little about taking one from someone else.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You need to have a penis that would fit in Kaska’s vagina for this.");
		if(pc.hasVagina()) addButton(1,"Cunnlingus",makeKaskaSuchYerCoochLikeABaws,undefined,"Cunnilingus","She’d be a pretty great pussy licker while she takes care of herself....");
		else addDisabledButton(1,"Cunnilingus","Cunnilingus","This scene requires you to have a vagina.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You are not aroused enough for this.");
		addDisabledButton(1,"Cunnilingus","Cunnilingus","You are not aroused enough for this.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//Victory Dicksex
public function victoryKaskaDicksex(jail:Boolean = false):void
{
	clearOutput();
	author("Fenoxo");
	if(!jail)
	{
		showBust(kaskaBustDisplay(true));
		showName("\nKASKA");
	}
	else showKaskaPrison(true);

	var x:int = pc.cockThatFits(chars["KASKA"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	if(!pc.isCrotchExposed())
	{
		output("Opening up your [pc.lowerGarments], you select ");
		if(pc.cockTotal() > 1) output("the biggest of ");
		output("your [pc.cocks] and draw it out,");
	}
	else
	{
		output("Grabbing hold of");
		if(pc.cockTotal() > 1) output(" the biggest of");
		output(" your [pc.cocks], you calmly stroke it,");
	}
	output(" waggling it in front of the tugging pirate. Her eyes widen lustily. <i>“See something you like?”</i> you ask while inching closer, eventually letting it slap against her cheek. <i>“Why don’t you get me warmed up?”</i>");
	output("\n\nYou don’t have to ask twice. The pirate twists her neck to put her lips against the underside of your rod");
	if(pc.hasKnot(x)) output(" with her nose against your knot");
	output(" and presses her tongue out to taste you. She runs it up to your [pc.cockHeadBiggest] before parting her lips and letting it inside. She’s warm, wet and eager. In large part, her fervor for cocksucking could be attributed to her own overwhelming lust, turning an onerous favor into fuel for her own masturbation. As long as your dick is getting sucked, you’re fine with it.");
	output("\n\nKaska noisily gasps for air in between her slurps. ");

	if(!jail) output("She doesn’t look up or acknowledge you, and you get the impression that she must not do this very often. Grabbing hold of her hair, you yank her back up to your [pc.cockHeadBiggest] and tip her head back, forcing her to look you eye to eye. A spark of defiance glows in her eyes but gutters and dies a second later. She may not like to take orders, yet she knows when she’s beaten. There isn’t even token resistance when you push her back and forth, coating ");
	else output("She looks you in the eye while she does it, and you get the impression that she’s become quite a talented cock-sucker from her time in prison, either from servicing other prisoners or her own relentlessly enhanced meat. Grabbing hold of her hair, you guide her all the way back to your [pc.cockHeadBiggest] and look deep in her alien eyes. There’s no defiance, only lust and arousal. Whatever she might of thought before, Kaska wants this now. She wants you to fuck her face until you finally spill your load. There isn’t a single mote of resistance when you push her back and forth roughly, coating ");
	if(pc.biggestCockLength() >= 12) output("most of ");
	output("your rod with an even coat of pirate spit.");

	if(!jail) output("\n\nAfter a few minutes of this, Kaska’s technique improves, and you start to get dangerously hard. It’d be easy to forget her earlier reluctance with the way her tongue wraps around the midpoint of your shaft, sliding up and down in sync with her lips. You’re forced to push her off, lest you blow your load early, leaving Kaska breathing heavily while pre-cum runs unhindered from her cock, rolling across her knuckles on the way.");
	else output("\n\nAfter a few minutes of this, Kaska’s eager mouth and wiggling tongue have you dangerously hard. It’d be easy to forget her earlier reluctance with the way she suckles around the midpoint of your shaft, making your [pc.cockHeadBiggest] bulge into her throat. You’re forced to push her off, lest you blow your load early, leaving Kaska breathing heavily and fervently milking enormous blobs of pre-cum from her cock, slowly painting the floor in her mess.");
	output("\n\n<i>“Please, let me fuck you,”</i> she begs. Sweat beads on her brow. <i>“I need it. My balls are so full!”</i>");

	output("\n\nYou smile and hook your hands under her armpits, lifting her up to her feet. <i>“");
	if(pc.isNice()) output("Don’t worry, I’ll make sure you get off too.");
	else if(pc.isMischievous()) output("Well, we are going to fuck. You got that part right.");
	else output("Nope. I’m gonna fuck you, sugar tits.");
	output("”</i>");
	if(!jail) output("\n\n<i>“No... I’m... an alpha...”</i> Kaska weakly protests as you bend her over a crate. ");
	else output("\n\n<i>“Oh... Okay... Just be... be gentle...”</i> Kaska weakly replies as you bend her over the examination table. ");
	output("Her dick, still leaking, is pointed straight down, pinned between her balls and the cool metal, and you get a good, long look at her pussy, for once not obscured by her troublesome maleness. It’s clear she’s a stranger to the feminine pleasures her body could enjoy, but that doesn’t stop her from being dripping wet, her lips slightly parted invitingly. The pirate’s pussy is just asking for a hard fucking.");
	output("\n\nYou don’t keep it waiting. Pushing your [pc.cockHead " + x + "] against her sodden entrance, you marvel at the silky texture of her spreading labia, slowing your push to give you time to drag yourself all over the exterior of her sex. The alien hermaphrodite may have styled herself as something of a masculine breeder, but when it comes down to it, her cunt is desperate to be fucked and used.");
	if(!jail) output("\n\nKaska gasps, <i>“W-why does it feel this good?”</i> Her legs wobble dangerously. <i>“No... I’m... I’m not supposed to like this...”</i> She whimpers and goes slack, legs spreading, finally giving in to the sensation of you plumbing the first few inches of her passage. <i>“Yesssss....”</i>");
	else output("\n\nKaska gasps, <i>“W-why does it feel this good?”</i> Her legs wobble dangerously. <i>“These fucking drugs... Turning me into a fucking onahole!”</i> She whimpers and goes slack, legs spreading, finally giving in to the sensation of you plumbing the first few inches of her passage. <i>“Yesssss....”</i>");
	if(!jail) output("\n\nYou almost don’t hear the quiet admission of pleasure, but it’s there all the same. You’d never guess her so vaginally inexperienced after slipping inside of her oozing slut-tunnel. ");
	else output("\n\nYou can’t miss the hissed admission of pleasure, but even if you did, the following gasps of delight make her opinion on a hard dicking quite well known to you. Her sodden slut-tunnel grips you like a pro. ");
	output("The muscles inside squeeze and stroke at you with greater levels of excitement after each new inch you feed it. Your [pc.cock " + x + "] trembles under the caresses. They are at the same time both foreign and familiar; Kaska’s race’s anatomy is just different enough that the muscles squeezing at you from inside her pussy do so in unexpected ways, feeling distinctly alien yet all too pleasurable. When your ");
	if(pc.balls > 0) output("[pc.balls] slap against her own");
	else output("[pc.base " + x + "] presses against her");
	output(", you’re almost saddened. You would’ve been content to slide into her forever.");
	//Dickginity loss
	pc.cockChange();

	output("\n\n<i>“M-more...”</i> Kaska stutters in between pants. <i>“Don’t stop!”</i> She’s looking over her shoulder at you imploringly, red eyes flicking back and forth as she searches for the words to spur you onwards. They gleam with fiery intensity when she finds them. <i>“Fuck me! Fuck me... make me your ");
	if(jail) output("prison ");
	output("slut!”</i> The last half is uttered with more than a little trepidation.");
	output("\n\nAs you pull back to line up your second stroke, you ponder her words, wondering if those are the kinds of things she likes girls to say to her. Kaska bubbles, <i>“Fuck me!”</i> again when you thrust home. There’s no need to take it slow with how wet she is. Juices dribble out of her thighs with every piston-like pump into her hips, and her voice is all too happy to release high-pitched squeals of intermingled ecstasy and excitement. You let her have it and commence drilling her gushing honeypot in earnest, watching her plush ass and luscious tits jiggle and quake from the force of the pounding.");
	output("\n\nKaska cums almost immediately. You’d almost miss it if you were listening to her increasingly out of control wails. They’re a nonstop mix of babbled pleasure and ecstatic moans. Her pussy communicates her pleasure instead, clamping down about your length in one, long convulsive squeeze. The moment it relaxes, a squirt of girlcum hits your [pc.leg], and her folds go wild, independently quivering as they lose all control, nervelessly spasming against your [pc.cock " + x + "]. The uncoordinated strokes do exactly what dzaan genetics designed them to do: overwhelm with a hundred threads of pleasure, all contesting for your attention.");
	output("\n\nYou thrust in, bottoming out. Your mind may not know what to do with the avalanche of sensory data, but your body responds on autopilot.");
	if(pc.balls > 0) output(" Your [pc.balls] clench.");
	output(" [pc.EachCock] grows as hard as an iron bar, visibly swelling with every beat of your hammering heart. The warm contractions of your release build in your mid-section, and in one glorious moment, you explode, spurting ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 8) output("a few meager drops from your [pc.cocks]");
	else if(cumQ < 25) output("your release from your [pc.cocks]");
	else if(cumQ < 100) output("long ropes of pleasure from your [pc.cocks]");
	else if(cumQ < 1000) output("huge blobs of goo from your [pc.cocks]");
	else
	{
		output("tremendous blasts of release from your [pc.cocks]");
	}
	output(" into Kaska’s spunk-holster");
	if(cumQ >= 250 && cumQ < 3000) output(", packing it full");
	else if(cumQ >= 3000) 
	{
		if(!pc.hasKnot(x)) output(", flooding it with so much [pc.cum] that the excess pours down the backside of her balls in a waterfall");
		else output(", flooding it with so much [pc.cum] that you can feel the pressure pushing back against the knot you’ve locked inside her");
	}
	output(".");
	if(pc.hasKnot(x)) output(" You hold her in place, sealing every drop inside thanks to the way your inhuman tool swells at its base, wondering if this little tryst will have your pirate bitch bred.");
	output("\n\nEventually calming down, you pull out ");
	if(pc.hasKnot(x)) output("with an audible pop ");
	output("to examine your work. The once-mighty pirate is a blubbering wreck, still quivering in the aftershocks of her pleasure. She glistens with sweat and pants for breath, reduced to a quivering puddle of sex.");
	if(!jail) output(" Slowly drifting up, her limp body floats in the zero-G atmosphere. The spunk she had been shooting, unnoticed until now, bubbles and swirls around her, though a residue of white lines the box she had been pressed against.");
	else output(" And what a deep puddle it is! The stuff they’ve given her to enlarge her penis has increased her virility commensurately, ensuring that someone is going to have to come clean this place with a mop.");
	if(!jail)
	{
		if(silly) output("\n\n It seems you both managed to cream two boxes today.");
		
		if(flags["TARKUS_BOMB_TIMER"] == 0) output("\n\nWith the bomb disarmed, you’re free to take your time with the pirates. What next?");
		else output("\n\nNow that you can think a little more clearly, it’s time to deal with that bomb.");
		//Pass 17 minutes.
		processTime(17);
		//Orgasm
		pc.orgasm();
		//Tag Kaska as fucked.
		flags["KASKA_FUCKED"] = 1;
		if(inCombat())
		{
			output("\n\n");
			CombatManager.genericVictory();
		}
		else
		{
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
	}
	else
	{
		IncrementFlag("KASKA_PRISONED");
		output("\n\nAs you gather your stuff and prepare to leave, Kaska dazedly stuffs her still-leaking crown in her mouth and starts jacking herself toward a second orgasm. That answers where she got so good at cock-sucking.");
		processTime(19);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Victory Cuntsex
//Make her eat you out. Probably a shortie. Suck mah dick.
public function makeKaskaSuchYerCoochLikeABaws(jail:Boolean = false):void
{
	clearOutput();
	author("Fenoxo");
	if(!jail)
	{
		showBust(kaskaBustDisplay(true));
		showName("\nKASKA");
	}
	else showKaskaPrison(true);

	if(!pc.isCrotchExposed()) output("You lazily open your [pc.lowerGarments],");
	else output("You lazily step forward,");
	output(" intending to get some quick, oral relief from this pirate ");
	if(jail) output("before returning to more pressing matters");
	else if(flags["TARKUS_BOMB_TIMER"] != 0) output("before dealing with the potentially planet-cracking bomb");
	else output("now that the bomb has been taken care of");
	output(". Her eyes are a little glassy and unfocused, like someone half lost in a daydream. You grab her by the chin and tip her head back to look you in the eye. Her jaw works, opening and closing, trying to find the words that she undoubtedly believes she must say. You put a finger to her lips to shush her and speak yourself.");
	//Nice
	if(pc.isNice())
	{
		output("\n\n<i>“We’ve both gotten worked up here, and I think it would be best if we both sated our baser needs before moving on.”</i> You smile warmly, saying, <i>“");
		if(jail) output("Since you’re in jail, I think it’s only fair that I get to dictate how this will work. Don’t you agree?”</i>");
		else output("Since I won fair and square, I think it’s only fair that I get to dictate how all this will work. Don’t you agree?”</i>");
		output("\n\nKaska tilts her head slightly, then nods, either too lust-drunk to object or secretly submissive enough to want this. She even kisses at your finger as you pull it away.");
		output("\n\n<i>“Great,”</i> you add, <i>“then you can lick me while you tug on that dick of yours, okay?”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		if(!jail)
		{
			output("\n\n<i>“Since you did me the favor of getting me nice and wet, you should really do something about that, shouldn’t you?”</i> You edge closer and wink. <i>“Look at it, all flush with excitement and dripping wet. I bet you wanna stick your dick in it, don’t you?”</i>");
		}
		else output("\n\n<i>“Since you’ve done me the favor of getting on your knees, I think I have an idea of how you can pay me back for all the trouble you caused back on Tarkus.”</i> You edge closer and wink, showing off your [pc.vagina]. <i>“Look at it, all flush with excitement and dripping wet. I bet you wanna stick your dick in it, don’t you?”</i>");
		output("\n\nKaska whimpers needily and nods. Slipping out from between her lips, her tongue idly caresses the side of your finger as you retract it.");
		output("\n\n<i>“Quite a tongue you’ve got there,”</i> you observe. <i>“How about you put it to use right... here!”</i> You wiggle a finger in between ");
		if(pc.vaginaTotal() > 1) output("a pair of");
		else output("your");
		output(" lower lips. <i>“");
		if(!jail) output("If you wanted to fuck me, you should’ve fought harder.");
		else output("I don’t think you’ll be fucking anyone for some time with a dick like that.");
		output("”</i> You edge your [pc.hips] close enough to Kaska’s face that she can’t help but smell your scent. <i>“");
		if(!jail) output("I might even help you tug on that thing while you do it.");
		else output("I suppose I can tug that monstrous toy a little while you lick. I guess that’s what it’s for now: rewarding you for being a good slut.");
		output("”</i>");
	}
	//Naughty
	else
	{
		output("\n\n<i>“A hot little mouth like that deserves to be busy on a box.”</i> You shift your grip to more firmly hold her chin, pinching her cheeks and turning her head this way and that, admiring the way the light glints off her puckered lips. <i>“I got just the place for you to put that.”</i>");
		output("\n\nKaska shudders when you release her chin and nervously licks her lips, nodding with surprising meekness. Her eyes rove down your [pc.belly] to your crotch.");
		output("\n\n<i>“You’re gonna please ");
		if(pc.vaginaTotal() == 1) output("that pussy");
		else output("those pussies");
		output(",”</i> you command, <i>“and if you do a good enough job, I might let you tug on your dick while you do it.”</i>");
	}
	//Merge
	output("\n\nAmazed at how a once proud, combative pirate can be turned into an eager cunt-licker, you grab her by the back of the head and pull her face into your crotch, mashing it into [pc.oneVagina]. At first, Kaska seems confused at her new place, but within a few seconds, she opens her mouth and ");
	if(jail) output("eagerly takes her first few licks. It’s obviously from the powerful plunges of her tongue that she’s had practice at licking pussy. She puts every technique she’s learned to work, backed up with drug-infused passion. Her organ slides deep while her lips seal around your lower pair, already glossy with [pc.girlCumNoun].");
	else 
	{
		output("tentatively takes her first few licks. It’s obviously from the nervous, inexpert flicks of her tongue that she’s no frequent pussy-licker. She soon makes up for her lack of experience with sheer passion, letting her ardor guide her into rapid, hungry licks that penetrate deeply while her lips seal around your lower pair.");
		output("\n\nThe busily licking hermaphrodite is soon ");
		if(pc.wetness(x) < 2) output("marked by streaks of [pc.girlCum] on her on cheeks");
		else if(pc.wetness(x) < 4) output("dripping your [pc.girlCum] off her chin onto her cleavage and cock");
		else output("soaked with your [pc.girlCum] from chin to crotch");
		output(".");
	}
	if(pc.totalVaginas() > 1) 
	{
		output(" Becoming aware of ");
		if(pc.totalVaginas() == 2) output("another nearby pussy");
		else output("other nearby pussies");
		output(", she shifts over to take the next in her mouth. You’re stunned by the sensation of her tongue pressing on unprepared nerves and nearly cum on the spot, offering up even more of your [pc.girlCumFlavor] [pc.girlCumNoun] for the pirate to taste.");
		if(pc.totalVaginas() > 2) output(" She moves to your third twat after licking the second clean, then back to the first. You could get used to this kind of attention.");
	}
	output("\n\nFaint, wet sounds of flesh slapping flesh come from below you. Glancing around Kaska’s noisily slurping head, you spot the source of the sound. She’s got ");
	if(jail) output("both hands wrapped tightly around her three-foot cock and pumping it with wild abandon. It’s so thick that her fingers can barely touch each other. Pre-cum soaks the entire thing in a curtain of shimmering ecstasy. Below the crown, her strokes have caused it to bubble in a frothy foam. She strokes so fast that she can’t be far from finishing, especially not with the fattened blobs of pre that roll out of her tip with every tug. It would be so easy to push the hyper-endowed hermaphrodite over the edge.");
	else output("her fist wrapped tightly around her cock and is pumping it with wild abandon. There’s so much pre-cum leaking from her tip that her entire hand glistens with it, and the sticky liquid has frothed into a bubbling ring just below her glans. She’s stroking so fast that she can’t be far from finishing. It would only take a little extra to push her over the edge.");
	//Gooey undercarriage
	if(pc.isGoo())
	{
		output("\n\nYou extend your semi-liquid lower body out until it makes contact with the dickgirl’s overfull cum factories and swiftly engulf them. Kaska whimpers, but to her credit, she doesn’t lose it yet. You smile through your own moans of pleasure and push your gooey pseudopod further, swallowing up the bottom half of her dick. She loses it then, completely abandoning her own attempts to please her cock. The pirate’s hand falls by her side, and her hips thrust futilely against you while you bind her in shifting liquid. Her balls squeeze, and you rub them encouragingly, coaxing the biggest possible orgasm out of her. You let the tip poke out the top, so that when she blows, she’ll blow all over herself.");
	}
	//Foot
	else if(pc.legType == GLOBAL.TYPE_HUMAN)
	{
		output("\n\nYou extend a [pc.foot] out until you make contact with the dickgirl’s swollen nuts. Stopping there, you let your toes rub across the slick surface of her hairless sack, caressing her with your foot while she goes to town on your [pc.vaginas]. You can feel them twitch and pulse, so close to delivering their gooey payload and yet so far. In the interest of helping your loyal " + (pc.hasClit() ? "clit" : "slit") + "-licker along, you fondle your way up to her shaft and press your toes around it, pushing her hand away so that you can jerk her off with your foot. She moans into [pc.oneVagina], and her dick thickens, preparing to shoot.");
	}
	//Errything else
	else
	{
		output("\n\nYou nudge your [pc.foot] against the dickgirl’s swollen balls and discover her hairless sack to be remarkably slick with her lewd secretions. She gasps into [pc.oneVagina] and redoubles her efforts there while her thick cock strains in her fingers, on the edge of exploding. You decide to aid her by rolling your [pc.foot] back and forth, sometimes lifting it to rub against the underside of her dick or bringing it down to gently roll across her orbs. It’s too much for the busy " + (pc.hasClit() ? "clit" : "slit") + "-licker. She’s going to go off any second now. You can tell by the way her dick is thickening and twitching.");
	}
	//Back to business as usual
	output("\n\nKaska’s tongue goes wild against " + (pc.hasClit() ? "[pc.oneClit]" : "[pc.oneVagina]") + " at the same time that her orgasm hits her. The wild thrashing of that slick muscle on your most sensitive place nearly doubles you over, and you instinctively grab her by the back of her head, mashing her face harder into your juicing cunn");
	if(pc.totalVaginas() == 1) output("y");
	else output("ies");
	output(". Wet trails of cum fall on your ");
	if(jail) output("[pc.butt]");
	else output("[pc.legOrLegs]");
	output(" as the hermaphroditic rogue squirts her own lusts into the air. Some finds its way into the quaking slit-sucker’s hair thanks to ");
	if(jail) output("the sheer, majestic size of her fuck-stick");
	else output("the zero-G");
	output(", but you’re far too busy filling her mouth with [pc.girlCum] to worry about the few stray drops.");
	if(!jail) 
	{
		output("\n\nIf gravity were normal, you both would’ve collapsed into a pile of sweaty, orgasmically spent bodies long ago, but you’re able to float in place, cumming yourselves dry, for some time. When you do manage to stumble away from the jizz-stained pirate, she’s gasping and weakly stroking herself, her lips stained with your [pc.girlCum] and as much of her own juice as she can gather.");
		output("\n\nKaska won’t be bothering anyone for a while.");
		if(flags["TARKUS_BOMB_TIMER"] != 0) output(" You had better deal with the bomb.");
		processTime(18);
		pc.orgasm();
		//Tag Kaska as fucked.
		flags["KASKA_FUCKED"] = 1;
		if(inCombat())
		{
			output("\n\n");
			CombatManager.genericVictory();
		}
		else
		{
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
	}
	else 
	{
		IncrementFlag("KASKA_PRISONED");
		output("\n\nGravity suddenly seems to double, but you hold onto Kaska’s head for support, smashing your climax-sensitized lips into her face for as long as you can. She ragdolls before you can derive much more pleasure, however, leaving you standing on wobbling [pc.legs] and wondering how to spend the rest of your day.");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Approaching Active Bomb
public function activeBombApproach():void {
	clearOutput();
	author("Fenoxo");
	showName("\nBOMB");
	output("You kneel in front of the bomb and pull out the ");
	if(pc.hasKeyItem("Khorgan's Detonator")) output("two detonators");
	else output("detonator");
	var thours:int = Math.floor(flags["TARKUS_BOMB_TIMER"]/60);
	var tminutes:int = flags["TARKUS_BOMB_TIMER"] - (thours * 60);
	output(". An ominous timer on the face of it is counting down. There are currently " + thours + " hours and " + tminutes + " minutes left to disarm it or get off this rock. A bomb like this doesn’t have the yield to directly destroy the planet, but placed here, it’ll easily wreck this facility and the tethers that hold the half planets together.");
	if(pc.characterClass != GLOBAL.CLASS_ENGINEER) output(" Without whatever super-science is at work here, Tarkus will tear itself apart.");
	else output(" Without the gravitic stabilization this station provides, Tarkus will tear itself apart!");
	output("\n\nDo you attempt to disarm it?");
	if(pc.isAss()) output(" It might be a better idea to just book it off planet and write the place off as a loss. Surely you can find some of your Dad’s probes somewhere else.");
	clearMenu();
	addButton(0,"Disarm",attemptToDisarmTheBomb);
	addButton(14,"Back",mainGameMenu);
}

//Disarming It
public function attemptToDisarmTheBomb():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nBOMB");
	//One detonator
	if(!pc.hasKeyItem("Khorgan's Detonator")) 
	{
		output("You fiddle with Kaska’s detonator. While it’s rigged to blow at the touch of a single button, a flashing error message informs you that both detonators must be present to disarm the bomb. Where’s the second detonator?");
		//[Back]
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Both detonators
	else
	{
		output("You pull out the pair of detonators and go over their controls. There’s far more buttons than a simple remote would warrant. When you push the disarm key, the bomb itself beeps, and a modulated voice chirps, <i>“Invalid user detected. Please complete manual override to disarm.”</i> Lights illuminate on the touchpad, representing various relays in the bomb’s circuitry. You’ll have to manage to flick them off without overloading the bomb itself.");
		clearMenu();
		addButton(0,"Next",lightsOutBombPrep);
	}
}
public function lightsOutBombPrep():void
{
	configureLightsOut(disarmedTarkusBomb,failedToDisarmTarkusBomb, [1, 5, 6, 9, 10, 11, 12, 13]);
}

//OH SHIT SON U DON BLU IT UP
public function failedToDisarmTarkusBomb():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nBOMB");
	output("The moment all the relays light up, the bomb releases a high-pitched whine. Uh oh. The explosion happens faster than you can perceive it, ending your life and your quest in a coruscating Nova. The Tarkus asteroid belt becomes your grave.");
	
	badEnd();
}
//Succeed at Light's Out
public function disarmedTarkusBomb():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nBOMB");
	output("The last of the illuminated relays fade, and the panel’s display reconfigures to display one, simple word: disarmed. Wiping a bead of sweat from your brow, you look around the carnage of your passing. The floating platforms are in rough shape, but the facility itself is intact. You’ve saved Tarkus. You wonder if anyone will believe you when you tell this story later. You sigh. Probably not. At least the U.G.C. guys up top will know.");
	output("\n\nIf you wanted to grab anything before you left, now is the time for it. <b>You might not be able to return later.</b>");
	flags["TARKUS_BOMB_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bombExplodes():void
{
	clearOutput();
	author("Fenoxo");
	//[FAILURE] Bomb goes off while in the Core
	if(InCollection(currentLocation, "350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "KHORGAN_CENTER_COVER", "KHORGAN_LEFT_COVER", "KHORGAN_RIGHT_COVER"))
	{
		output("There is a flash of light too fast to react to, and then nothing. Your life ended on the leading edge of a facility-shredding blast wave. The only consolation for your departing spirit is that you didn’t have to watch the planet above tear itself to pieces, killing nearly every living creature on its surface in the process.");
		badEnd();
		return;
	}
	//PC Bailed on Dungeon, Didn't Defeat Kaska OR Khorgan
	if(!pc.hasKeyItem("Kaska's Detonator") && !pc.hasKeyItem("Khorgan's Detonator"))
	{
		//Three hours later, after the bomb should have gone off
		output("Your codex buzzes, a priority message alert chiming through. You answer, and see a 2-D image coming through on the Codex’s primitive screen: of all the people you didn’t expect to see, it’s the nutty cat-girl you beat down ");
		if(flags["TAM_DISABLE_METHOD"] == 2) output("and fucked ");
		output("in the control station.");
		output("\n\n<i>“Hey!”</i> she cheers, beaming at you. Behind her, ");
		if(flags["TAKEN_TAMWOLF"] != undefined) output("a new canine attack drone");
		else output("Tam-wolf");
		output(" looks over her shoulder, its ruby-red eyes blazing. <i>“The captain wanted me to call you and say ‘thanks for not killing me!’ Thank God you didn’t actually fight the rest of us, or the whole planet might have asploded!”</i> she says, waving her arms around for dramatic effect.");
		output("\n\n<i>“It was just a bluff, anyway,”</i> she adds with a sly grin. <i>“We weren’t gonna blow the whole planet up! That’d be evil as shit. But still, thanks for not putting a bullet in my brainpan.");
		if(flags["TAKEN_TAMWOLF"] != undefined) output(" But also fuck you for stealing my Tam-wolf! You’re lucky I had a spare, or I’d be SUPER pissed off at you!");
		output(" We should shoot each other a bunch more some time! Ooh, Cap’n wants me. See ya!”</i>");
		output("\n\nThe message cuts off.");
		output("\n\nWhat the actual fuck.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//[FAILURE] Bomb goes off while off planet.
	else if(rooms[this.currentLocation].planet != "PLANET: TARKUS")
	{
		output("You receive a notification on your codex that Tarkus was destroyed by the bomb you failed to disarm. The news feeds make a big deal of playing up the survival of a group of raskvel onboard Novahome, and some mention is made of a gabilani space station being intact as well. Maybe you should check up on Novahome and see how the raskvel are doing?");
		flags["TARKUS_DESTROYED"] = 1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//[FAILURE] Bomb goes off while on Tarkus.
	else if(rooms[this.currentLocation].hasFlag(GLOBAL.OUTDOOR))
	{
		output("You feel a sudden shift in the ground a moment before you hear a faint, distantly echoing boom. The sound is almost tinny, carried on reverberations through the metallic countryside. The bomb went off before you could make it back to your ship! You push yourself into a sprint, but the whole planet rumbles, splitting open into a giant crevasse in front of you. A gust of wind slams into you, displaced from the core when the two half planets crashed into one another.");
		output("\n\nThe groans of straining metal being rent asunder give voice to the collapsing planet’s pain. You’re thrown into the air along with a mountain of debris. The vantage offered by such heights allows you to watch Tarkus’ crust split apart. Other pieces join you in the air, dislodged by the incredible tectonic forces at work. There is nowhere to run, nowhere to hide. You have a front row seat to the destruction of a planet, and it does not disappoint. The orange ball has already fractured into hundreds of island-sized asteroids. Luckily, you’re crushed by a mountain of metal long before the atmosphere scatters to the void.");
		badEnd();
	}
	//[FAILURE] Escape Deck 13!
	else if(currentLocation.indexOf("DECK 13") != -1)
	{
		if(flags["ANNO_MISSION_OFFER"] == 2) showBust(annoBustDisplay());
		output("A sudden shock courses through the entire room followed by a loud roar. Quickly realizing that the situation does not bode well for you if you stay here, you decide to head straight to the main deck.");
		output("\n\nCareful not to");
		if(pc.canFly()) output(" lunge into any obstacles, you fly");
		else if(pc.hasLegs()) output(" trip over yourself, you make a dash");
		else output(" stumble over yourself, you hastily move your body");
		output(" towards the elevator and punch the call button. Excess debris starts to fall as the haunting sounds of creaking and crunching metal echo around you. Like a sign from the heavens, the bell dings and the doors open.");
		if(flags["ANNO_MISSION_OFFER"] == 2) output("\n\n<i>“Boss!”<i> Your ausar companion yells as she does a tactical somersault into the elevator shaft. You quickly follow behind her");
		else output("\n\nYou quickly jump into the elevator shaft");
		output(" and hit the button on the control panel. The doors jam, refusing to close, but the elevator hums and the lift makes its ascent.");
		output("\n\nAs it moves up, you peer out the opening");
		if(flags["DECK13_SHIELDS_ON"] != 1) output(" only to find the shaft below being crushed and mangled, lit only by small sparks... and then huge flames. You have to get out of here quick!");
		else output(" seeing visible tremors and more debris - though luckily, the shaft remains intact. Turning on the shields must have done the trick or you could have been a trapped sardine!");
		output("\n\nThe bell dings again and");
		if(flags["ANNO_MISSION_OFFER"] == 2) output(" Anno pulls you to help you get out of the");
		else output(" you finally crawl out of the");
		if(flags["DECK13_SHIELDS_ON"] != 1) output(" death trap and get on your [pc.feet], the doors now closing - then completely sealing - behind you");
		else output(" shakey elevator cab and get on your [pc.feet]");
		output(", only to be greeted with more chaos on the main floor...");
		processTime(2);
		clearMenu();
		addButton(0,"Next",planetAsplodeWhileInGhostDeck);
	}
	//[FAILURE] Bomb goes off while in Nova
	else
	{
		showBust(annoBustDisplay(),"SHEKKA");
		output("Novahome groans like a wounded animal and shifts at least a foot to the left, dumping you to the deck. Alarms sound while you’re climbing back to your [pc.feet]. When did the raskvel get those working? Screams of alarm fill the corridors, and you’re nearly swept along on a tide of scaley panic. The ship lurches a few more times. You’re lucky enough to grab hold of a hand hold this time, and you make your way to the ship’s exit ramp.");
		output("\n\nThe ramp itself is gone. There’s an open air gap in its place and no sign of those who might have been walking on it. The Nova bucks like a nautical vessel of old trapped in the gale-force winds of a hurricane. Your belly turns, and you watch the ground fall away a second before tarkus’ surface shatters like a piece of glass. Chunks of ore go hurtling by. Raskvel, gabilani, and rushers alike are sucked out of the hull, screaming in terror. You barely manage to keep your grip as you watch the bomb tear apart the planet you could’ve saved.");
		output("\n\nDry winds scream like banshees, propelled by geological forces beyond comprehension. ");
		if(flags["MET_ANNO"] != undefined) output("Anno");
		else output("A white-haired ausar");
		output(" seems to be one of the only ones not panicking. As a matter of fact, you see her pulling herself on handholds towards the sucking hole in the side of the hull. Opposite, ");
		if(flags["MET_SHEKKA"] != undefined) output("Shekka");
		else output("a pink-haired raskvel in a gleaming white jumpsuit");
		output(" is wearing a pair of glowing boots, stomping along the deck towards a lever. ");
		if(flags["MET_ANNO"] != undefined) output("Anno");
		else output("The ausar");
		output(" is almost at a matching one on the other side. They reach them at the same time, and recessed doors slide out of the walls, trailing a curtain of rust particles, and slam shut.");
		output("\n\nWhile the horrible sounds from outside may have died out, the ship is still spinning and shaking like wild gark. A tinny, raskvel voice comes over the speaker, <i>“Tarkus is breaking up! Get the shields-”</i> It cuts off with a burst of static. The lights dim, and the din of crying aliens reaches a whole new crescendo. Staggering, you make your way towards the hangar. Maybe you can save yourself.");
		processTime(2);
		//[Next]
		clearMenu();
		addButton(0,"Next",planetAsplodeWhileInNova);
	}
	flags["TARKUS_BOMB_TIMER"] = -1;
}

public function planetAsplodeWhileInGhostDeck():void
{
	moveTo("210");
	bombExplodes();
}

public function planetAsplodeWhileInNova():void
{
	moveTo("201");
	clearOutput();
	author("Fenoxo");
	output("The hangar’s blast doors are sealed. You didn’t even know the hangar HAD blast doors, but they’ve closed all the same. Your ship and a half dozen others are piled together on the far side of the chamber, damaged but unbroken. You’re lucky no one brought any larger ships here before the planets came apart. Your ride could’ve gotten smashed.");
	output("\n\nStill bumping and bouncing, you wonder if you’re going to die like this - trapped in a metal coffin with a bunch of space-");
	if(!silly) output("rats");
	else output("kobolds");
	output(", doomed by your own incompetence. The overhead lights flicked and die, plunging you into darkness. The Nova rings like a gong when something slams into it, forcing you to clap your hands to your [pc.ears]. You’re going to die. It’s finished, then. There’s no way out.");
	output("\n\nThe lights come on, bringing with it the tiny voice of whatever raskvel sits at the helm. <i>“Shields are up! Shields are up! Get me engines! Fucking gabilani must have wrecked their own planet. Someone should’ve told them it would take more than that to wipe us out!”</i> A cheer goes through the huddled masses around you. Maybe you’ll live after all?");
	processTime(3);
	//[Next]
	clearMenu();
	addButton(0,"Next",planetAsplodeWhileInNovaPartIII);
}

public function planetAsplodeWhileInNovaPartIII():void
{
	clearOutput();
	author("Fenoxo");
	output("Somehow, you didn’t die, and neither did the raskvel - at least not the ones onboard Novahome. With no other option save extinction, the scrappy little aliens managed to get the engines and life support on this old boat running. ");
	if(flags["MET_DEL"] == undefined) output("A dark-skinned girl");
	else output("Del");
	output(" spearheaded options to keep the refugees fed");
	// 9999 all up in dis shit
	if (timesDelilahSexed() > 3) output(" and suitably serviced");
	output(" while the hangar was cleared. You helped out where you could, anything to see the hangar and your ship operational again. An escape vector is always nice.");
	output("\n\nA day later, life calmed down enough for things to get back to something approaching normal on Novahome. While deciding what to do next, you catch wind that [rival.name] is in ");
	if(flags["MET_SHEKKA"] != undefined) output("Shekka’s shop");
	else output("a nearby shop");
	output(". A pity they didn’t get sucked out the airlock.");
	flags["TARKUS_DESTROYED"] = 1;
	processTime(1475);
	//[Next] - main menu
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bombStatusUpdate():void
{
	if(flags["TARKUS_BOMB_TIMER"] == 120) AddLogEvent("<b>There’s only two hours left to disarm the bomb!</b>", "caution");
	if(flags["TARKUS_BOMB_TIMER"] == 90) AddLogEvent("<b>There’s only an hour and a half left to disarm the bomb!</b>", "caution");
	if(flags["TARKUS_BOMB_TIMER"] == 60) AddLogEvent("<b>There’s only one hour left to disarm the bomb!</b>", "caution");
	if(flags["TARKUS_BOMB_TIMER"] == 45) AddLogEvent("<b>There’s only 45 minutes left to disarm the bomb!</b>", "caution");
	if(flags["TARKUS_BOMB_TIMER"] == 30) AddLogEvent("<b>There’s only 30 minutes left to disarm the bomb!</b>", "caution");
	if(flags["TARKUS_BOMB_TIMER"] == 15) AddLogEvent("<b>There’s only 15 minutes left to disarm the bomb!</b>", "caution");
}

//Dungeon Done, Bosses Molestered, Bomb Disarmed
//Play when PC goes back topside, play when stepping out of the elevator.
//This assumes the PC won't be able to re-visit the dungeon. Which, logically, you wouldn't be since the place would be back to operating as usual. 
public function victoryCelebrationPCIsAwesomeGuyFuntimes():void
{
	clearOutput();
	author("Savin");
	showName("HORACE\nDECKER");
	showBust("HORACE_DECKER");
	output("You’re greeted by a sudden chorus of cheers. You recoil, until you see that you’re surrounded by Sgt. Decker’s S.W.A.T. team, all clustering around you. The sergeant himself steps forward, chomping on his cigar over a great big grin. <i>“We just got the word from Command: they saw everything. Great work, kid!”</i>");
	output("\n\nSeveral officers shake your hand or clap you on the back as you try and make your way out of the lift. As they do, several of them peel off from the main group, heading into the personnel lift to go and make the official arrests on the pirates you defeated. Speaking of which: just ahead, you can see the crazed cat-girl, Tam, being led out of the ground-side station in cuffs, struggling against a pair of burly officers and crying out for her wolf drone.");
	if(flags["TAKEN_TAMWOLF"] != undefined) output("\n\nShe screams bloody murder at you, calling out for Tam-wolf to come to her, to no avail.");

	output("\n\nAs you make your way out of the gathering of officers, Sgt. Decker falls in beside you, billowing smoke like a chimney. <i>“You did good, kid. Your old man would have been proud. Listen, you go back to the </i>Nova<i>, rest up. We’ll handle things from here, make sure the place is secured. With luck, whatever passes for a government here will be looking to the U.G.C. for help, now. Might even be willing to join the ConFed now. That’ll make the brass hard as diamonds. Wish I had a way to reward you, kid. Though I bet you found something worthwhile down there, huh?”</i>");
	//If PC has Platinum:
	if(pc.hasKeyItem("Platinum 190")) output("\n\nYou give the sergeant a knowing wink as you depart.");
	else output("\n\nYou shrug, feeling as though you forgot something...");
	processTime(4);
	clearMenu();
	flags["STELLAR_TETHER_CLOSED"] = 1;
	addButton(0,"Next",move,279);
}

//Sod the Quest: Fucking off w/o Disarming the Bomb
//PC must have defeated TamTam
public function fuckOffWithoutDisarmingTheBomb():void
{
	clearOutput();
	author("Savin");
	showName("U.G.C.\nOFFICERS");
	showBust("HORACE_DECKER");
	output("You rush past the S.W.A.T. officers, hurtling down the road. <i>“You’ve got less than ");
	if(flags["TARKUS_BOMB_TIMER"] > 180) output("four hours");
	else if(flags["TARKUS_BOMB_TIMER"] > 120) output("three hours");
	else if(flags["TARKUS_BOMB_TIMER"] > 60) output("two hours");
	else output("one hour");
	output(" before that bomb goes off!”</i> you shout over your shoulder.");
	output("\n\n<i>“What?”</i> Decker shouts after you, staring a moment before a look of horror spreads across his face. He grabs his radio. <i>“Command, this is Peacekeeper One. Bomb detonation imminent. Request immediate evac!”</i>");

	output("\n\nGood luck with that.");
	flags["STELLAR_TETHER_CLOSED"] = 1;
	clearMenu();
	addButton(0,"Next",move,279);
}

//Rival In Shekka's!
public function roomOutsideShekkasBonus():Boolean
{
	if (breedwellPremiumBootyCallCheck("tarkus") && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing();
		return true;
	}
	if(flags["TARKUS_DESTROYED"] == undefined) output("The section of deck upon which you now stand is undoubtedly the busiest place in all of Novahome, either because of its central location or the access tunnel that opens up to the south, leading out onto Tarkus’ surface. Before you can get to the windswept junkyards, you’ll have to walk across a wobbling gangplank made of hundreds of welded-together metal plates. The aliens pay it no mind. You could also go to the east or west if you wanted to explore Novahome and the people within.");
	else output("The section of deck upon which you now stand was undoubtedly the busiest place in all of Novahome back before the planet blew. Now, huge blast doors close off the way to the south, and while foot traffic is still high, the press of raskvel bodies is significantly abated. The massive, central corridor leads east and west from here.");
	output(" A sign made of mismatched machine parts displays “Shekka’s Widget Warehouse” just above a cobbled-together, warehouse like building to the north.");
	if(flags["TARKUS_BOMB_TIMER"] <= 0 && flags["TARKUS_BOMB_TIMER"] != undefined && flags["PLANET_3_UNLOCKED"] == undefined)
	{
		author("Fenoxo");
		showDane();
		output("\n\n<b>Dane is standing outside of Shekka’s Widget Warehouse, his four arms crossed over his chest. His white-furred ears flick up in recognition. <i>“");
		if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output("The boss was mighty pleased with how I handled you last mission. I wouldn’t mind a repeat sometime when I’m off the clock.”</i> The ausar merc chuckles. <i>“Boss also said to let you in if you showed up. Guess [rival.he] figured you were too poor to stop him now.");
		else output("You’ve got a lot of balls showing up here,”</i> he growls before smiling. <i>“Boss said not to stop you, and after last time, I’m not sure I’d want to try. Just don’t start any trouble, all right?");
		output("”</i> He gives you an unsubtle wink.</b>");
	}
	else biancaBoothBonus(0, "tarkus");
	return false;
}

//Walking In, Middeal
//Overwrites all other bonus bits.
public function shekkaMidDeal():void
{
	author("Fenoxo");
	showName(chars["RIVAL"].short.toUpperCase() + "\n& SHEKKA");
	showBust(rivalBustDisplay(),"SHEKKA");
	output("\n\n<i>“-gonna need at least 15,000 creds for it,”</i> ");
	if(flags["MET_SHEKKA"] == undefined) output("the raskvel running the shop");
	else output("Shekka");
	output(" says, thumping a familiar-looking probe. <i>“This thing is high tech, core world technology. The gene-lock on it alone could probably buy me a small ship at full price. You’re lucky I’m even considering such a weak offer.”</i>");
	output("\n\n[rival.name] shrugs, <i>“Well, I suppose my father can afford to foot this one for me. What’s one more expense in pursuit of my fortune, after all?”</i>");
	output("\n\nBoth parties start at the sight of you. ");
	if(flags["MET_SHEKKA"] != undefined) output("Shekka recovers first, smiling. <i>“You’re a welcome sight, [pc.name]. I’ll be with you after I finish this deal.”</i>");
	else output("The raskvel grins. <i>“Welcome to my shop, stranger. The name’s Shekka, and I’ll be with you as soon as I finish up this deal.”</i>");

	output("\n\nLaughing, [rival.name] adds, <i>“Yes, [pc.name], wait a minute. I’m almost finished buying the keys to your legacy.”</i>");
	output("\n\nPausing, Shekka looks between the two of you. <i>“You two know each other?”</i>");
	output("\n\nYou and [rival.name] nod to Shekka at the same time.");
	output("\n\n<i>“And you both want this probe - the one I just got in stock");
	if(flags["TARKUS_DESTROYED"] != undefined) output(" before the planet blew");
	output("?”</i> the little alien asks with a puzzled look on her face.");
	output("\n\nYou both nod again, though your rival looks a little unsettled by the tone in Shekka’s voice.");
	output("\n\n<i>“Well, this baby’s hotter than fusion core rod,”</i> the short-statured alien chirps. She runs a hand along the gleaming metal. <i>“The deal’s off, tough stuff. We’re going to do this raskvel style. Each of you make me an offer. The first one to make me an offer I won’t say no to - or to go so high that the other gives up - wins.”</i> Shekka seems a little wistful. <i>“We used to do this at swap meets all the time, before Novahome.”</i>");
	output("\n\nSighing, [rival.name] opens up before you have a chance to check your credit balance. <i>“15,000, as we discussed.”</i>");
	output("\n\nShekka turns back to you, <i>“");
	if(flags["TIMES_SEXED_SHEKKA"] != undefined) output("You can do better than that, right, tiger?");
	else output("Got anything better?");
	output("”</i>");
	processTime(2);
	//16,000, 20,0000, 25,000, platinum, "Nope"
	clearMenu();
	if(pc.credits >= 16000) addButton(0,"16,000",bid16k,undefined,"16,000","Bid 16,000 credits for the pod.");
	else addDisabledButton(0,"16,000","16,000","You don’t have that many credits.");
	if(pc.credits >= 20000) addButton(1,"20,000",bidVariable,20000,"20,000","Bid 20,000 credits for the pod.");
	else addDisabledButton(1,"20,000","20,000","You don’t have that many credits.");
	if(pc.credits >= 25000) addButton(2,"25,000",bidVariable,25000,"25,000","Bid 25,000 credits for the pod.");
	else addDisabledButton(2,"25,000","25,000","You don’t have that many credits.");
	if(pc.hasKeyItem("Platinum 190")) addButton(3,"Platinum",payWithYourPlatinumPremiumCard,undefined,"Platinum 190","This stuff should more than cover the cost of the probe.");
	else addDisabledButton(3,"Locked","Locked","Perhaps you missed something valuable at the Stellar Tether that could have covered this unexpected expense.");
	addButton(4,"Don’t Buy",tooPoorToBuyTheProbe,undefined,"Don’t Buy","Whether you can afford it or not, you can’t justify that kind of expenditure. Dad probably sent these things out by the hundred anyway.");
}

//Too Poor To Buy Probe
public function tooPoorToBuyTheProbe():void
{
	clearOutput();
	author("Fenoxo");
	showName(chars["RIVAL"].short.toUpperCase() + "\n& SHEKKA");
	showBust(rivalBustDisplay(),"SHEKKA");
	output("You shake your head. The money isn’t there.");
	if(flags["TIMES_SEXED_SHEKKA"] == undefined) output("\n\nShekka shrugs and turns to [rival.name].");
	else output("\n\nShekka looks a little disappointed to turn to [rival.name]. It’s clear she would’ve loved to sell it to you.");
	output(" She places a pad on the hunk of metal and gestures to a row of boxes. <i>“Make your mark here, and we’ll get this finalized. The cart is included in the fee, so you can leave with it today if it suits your fancy.”</i> She looks your well-dressed cousin up and down. <i>“Fancy indeed.”</i>");
	output("\n\nLeaning over the probe, [rival.name] makes [rival.his] mark, then puts [rival.his] hands on the hull of the thing to push away. A prim-sounding female voice chimes, <i>“DNA signature recognized.”</i>");
	output("\n\n<i>“No! No! Not while [pc.he]’s around!”</i> Your cousin panics, slapping ineffectually at the gleaming metal. A seam appears next to [rival.name]’s hand and retracts, revealing a blinking, electronic screen with a set of flashing coordinates. <i>“Damn,”</i> [rival.he] mutters. To [rival.his] credit, your cousin recovers quickly. [rival.He] flashes you a smarmy grin. <i>“I still beat you to two of them. I’ll be sure to send you a message when I get the keys to Uncle Vic’s fortune.”</i> Snapping [rival.his] fingers, [rival.name] calls, <i>“Dane, lug this hunk of metal back to the ship. We’re out of here.”</i>");
	output("\n\nYou make sure to copy the coordinates down into your codex. It looks like <b>Myrellion</b> is the next stop on your journey.");
	flags["PLANET_3_UNLOCKED"] = 1;
	pc.createStatusEffect("Shekka_Follower_Email_CD");
	pc.setStatusMinutes("Shekka_Follower_Email_CD",24*60);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//16,000 Bid
public function bid16k():void
{
	clearOutput();
	author("Fenoxo");
	showName(chars["RIVAL"].short.toUpperCase() + "\n& SHEKKA");
	showBust(rivalBustDisplay(),"SHEKKA");
	output("<i>“16,000,”</i> you announce.");
	//Fucked Shekka
	if(flags["TIMES_SEXED_SHEKKA"] != undefined)
	{
		output("\n\nShekka smiles radiantly and turns towards you. <i>“I can’t turn down an offer like that.”</i> She graces you with a sly wink, sure to hide it from your cousin. <i>“16,000 is more than I’ve made in a long time.”</i>");
		output("\n\n[rival.name] sniffs angrily and turns on [rival.his] heel. <i>“You clearly have some relationship with this... this... creature. 16,000 was barely within her asking price before.”</i> [rival.He] snaps his fingers. <i>“Dane, we’re leaving. Have [pc.name]’s ship tracked. We’ll get the next one.”</i>");
		processTime(1);
		pc.credits -= 16000;
		clearMenu();
		addButton(0,"Next",youWonSomePodShit);
	}
	//Not Fucked Shekka
	else
	{
		output("\n\nShekka smiles. <i>“Not bad. What about you, [rival.name]? Got a counter offer?”</i>");
			output("\n\nYour cousin casually examines [rival.his] nails. <i>“Of course. 18,000. A sum of no concern.”</i>");
		output("\n\nThe long-eared shopkeeper’s eyes practically bug out of their sockets at that. <i>“Well, that’s bigger than a sexbot’s tit. You better have something pretty great for a counter-offer, [pc.name]. I’m sorely tempted as is.”</i>");
		//[20,000][25,000][Platinum]
		clearMenu();
		if(pc.credits >= 20000) addButton(1,"20,000",bidVariable,20000,"20,000","Bid 20,000 credits for the pod.");
		else addDisabledButton(1,"20,000","20,000","You don’t have that many credits.");
		if(pc.credits >= 25000) addButton(2,"25,000",bidVariable,25000,"25,000","Bid 20,000 credits for the pod.");
		else addDisabledButton(2,"25,000","25,000","You don’t have that many credits.");
		if(pc.hasKeyItem("Platinum 190")) addButton(3,"Platinum",payWithYourPlatinumPremiumCard,undefined,"Platinum 190","This stuff should more than cover the cost of the probe.");
		else addDisabledButton(3,"Locked","Locked","Perhaps you missed something valuable at the Stellar Tether that could have covered this unexpected expense.");
		addButton(4,"Don’t Buy",tooPoorToBuyTheProbe,undefined,"Don’t Buy","Whether you can afford it or not, you can’t justify that kind of expenditure. Dad probably sent these things out by the hundred anyway.");
	}
}

//20,000+ Bid
public function bidVariable(arg:Number = 20000):void
{
	clearOutput();
	author("Fenoxo");
	showName(chars["RIVAL"].short.toUpperCase() + "\n& SHEKKA");
	showBust(rivalBustDisplay(),"SHEKKA");
	output("<i>“" + arg + "”</i> you announce.");
	output("\n\nShekka peeps, mouse-like, and claps her hands across her mouth. The pressure of her excitement instead chooses to vent by making her tail wag, and it clangs noisily against the metal of the probe. <i>“Really!?”</i> she gasps. <i>“You win. I can fix so many things on Novahome with all that cash!”</i>");
	//Sexed:
	if(flags["TIMES_SEXED_SHEKKA"] != undefined)
	{
		output(" The exuberant raskvel hugs");
		if(pc.tallness >= 84) output(" your [pc.legOrLegs]");
		else output(" you");
		output(". <i>“You’re the best!”</i>");
	}
	output("\n\nSniffing disdainfully, your cousin gives you a sly look. <i>“You’re less of a penniless " + pc.mf("bum","tramp") + " than I thought. Very well, I’ll see you at your next destination. It shouldn’t be hard for a "+ rival.mf("man", "woman") +" of my resources to keep track of a gnat like you, after all.”</i> [rival.He] pauses at the doorway. <i>“Next time, the prize will be mine. Come on, Dane.”</i>");
	output("\n\n[rival.name] and [rival.his] bulky mercenary leave you with Shekka and your prize.");
	pc.credits -= arg;
	processTime(1);
	clearMenu();
	addButton(0,"Next",youWonSomePodShit);
}

//Platinum
public function payWithYourPlatinumPremiumCard():void
{
	clearOutput();
	author("Fenoxo");
	showName(chars["RIVAL"].short.toUpperCase() + "\n& SHEKKA");
	showBust(rivalBustDisplay(),"SHEKKA");
	output("<i>“How about this?”</i> you ask while pulling out the chunk of platinum 190 you recovered. <i>“Does that cover it?”</i>");
	output("\n\nShekka is a blur of activity, picking up the rock, peering at it, and grabbing various sensors from her workbench to point at it. It’s difficult to keep up with her, but after a minute of such activity, she slows and stares at the shining lump in her palm. <i>“This is platinum 190. This stuff is rarer than a busty raskvel.”</i> Her tail quivers behind her. <i>“I could probably buy two of these things with this. Sold!”</i>");
	output("\n\nSniffing disdainfully, your cousin gives you a sly look. <i>“You’re less of a penniless " + pc.mf("bum","tramp") + " than I thought. Very well, I’ll see you at your next destination. It shouldn’t be hard for a " + chars["RIVAL"].mf("man","woman") + " of my resources to keep track of a gnat like you, after all.”</i> [rival.He] pauses at the doorway. <i>“Next time, the prize will be mine. Come on, Dane.”</i>");
	output("\n\n[rival.name] and [rival.his] bulky mercenary leave you with Shekka and your prize.");
	pc.removeKeyItem("Platinum 190");
	processTime(1);
	clearMenu();
	addButton(0,"Next",youWonSomePodShit);
}

//Bid Winning Epilogue
public function youWonSomePodShit():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nSHEKKA");
	showBust("SHEKKA");
	output("You finalize the payment and run your hands across the pod until it chimes. The tone is brief and almost musical. You’d expect to hear similar from a lift on a luxury planet. <i>“DNA signature detected, welcome [pc.name] Steele,”</i> a synthesized, female voice announces. A seam appears on the face of the gleaming metal, recessing itself down before sliding out of the way and into the body of the probe. Behind it, there’s a simple screen with a set of coordinates.");
	output("\n\nShekka whistles, <i>“Guess it’s a good thing you bought that, huh? She seems to recognize you.”</i>");
	output("\n\nYou nod while turning to your codex. The coordinates correspond to another planet linked up by the rush - the only habitable world in the system. You had better head to Myrellion if you want to claim your father’s legacy, but first, there is the matter of this spent pod. You don’t need to lug it everywhere. You could give it to Shekka, sell it to her, or sell it back to your dad’s company.");
	processTime(2);
	flags["PLANET_3_UNLOCKED"] = 1;
	//[SellShekka] [GiveShekka] [SellSteele]	
	clearMenu();
	addButton(0,"SellSteele",sellThePodToSteeleTech,undefined,"Sell to Steele Tech","Dad probably set up the company to pay out for the pods if you sent them back.");
	addButton(1,"ShekkaSell",sellDatPodToShekka,undefined,"Sell to Shekka","The raskvel would probably buy it back for a portion of its value.")
	addButton(2,"ShekkaGive",giveTheProbeToShekkaForNuttin,undefined,"Give to Shekka","You don’t need the pod itself. Why not just give it to the little raskvel? They could probably use the extra resources around this junk heap.");
}

//Sell to Shekka
public function sellDatPodToShekka():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nSHEKKA");
	showBust("SHEKKA");
	output("<i>“");
	if(pc.isNice()) output("Hey, I got what I need from this thing. Want to buy it back and flip it for more profit?");
	else if(pc.isMischievous()) output("Hey, can I get a refund?");
	else output("I’m done with this hunk of junk. How much for it?");
	output("”</i>");
	output("\n\nShekka blinks, momentarily confused. <i>“This day just keeps getting weirder and weirder. All right, I can give you ");
	if(flags["TIMES_SEXED_SHEKKA"] == undefined) output("10,000");
	else output("14,000");
	output(" for it. I’ve got to make a profit on it, you know?”</i>");
	if(silly) output(" She tilts her head. <i>“Like they’re always saying on that Prawnstars holo the terrans have been running. I gotta admit, I don’t see the appeal of watching a bunch of lobster-dudes bilking some poor xeno out of a valuable find.”</i>");
	output("\n\nDo you sell it back to Shekka or something else?");
	//[SellShekka] [GiveShekka] [SellSteele]	
	clearMenu();
	addButton(0,"Sell It",processSellToShekkaTransaction,undefined,"SellSteele","Dad probably set up the company to pay out for the pods if you sent them back.");
	addButton(1,"Options",youWonSomePodShit,undefined,"Options","Back up and consider your options.");
}

//Sold:
public function processSellToShekkaTransaction():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nSHEKKA");
	showBust("SHEKKA");
	output("A little richer, you make ready to go on your way.");
	if(flags["TIMES_SEXED_SHEKKA"] == undefined) pc.credits += 10000;
	else pc.credits += 14000;
	flags["TARKUS_PROBE_CASH_GOT"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give to Shekka +Niceguy
public function giveTheProbeToShekkaForNuttin():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nSHEKKA");
	showBust("SHEKKA");
	output("<i>“");
	if(pc.isNice()) output("Hey, I got what I needed from this thing. Why don’t you take it and sell it to someone? I’m sure you guys could use the cash more than me.");
	else if(pc.isMischievous()) output("I must be nuts, but I don’t have a use for this thing. How about you take it back to sell to someone else, and you can just owe me a favor, all right?");
	else output("Hey, Shekka. I’m not carrying this piece of crap around with me. You can keep it.");
	output("”</i>");
	output("\n\nShekka deadpans, <i>“You’re pulling my tail, right?”</i>");
	output("\n\n<i>“Nah, I don’t need it.”</i>");
	if(flags["TIMES_SEXED_SHEKKA"] != undefined) output("\n\nThe raskvel’s ears jingle jubilantly as she throws herself against you, hugging you tightly. <i>“You’re the best, [pc.name]. I hope you’re as good to the folks on the next planet as you’ve been here.”</i>");
	else output("Quietly, the raskvel answers, <i>“I don’t know what to say, [pc.name]. This means a lot to me. The credits will go a long way towards helping my people, I promise you that.”</i>");
	output("\n\nYou make ready to go on your way, ");
	if(pc.isNice()) output("ruffling her feathery hair. <i>“Happy to help.”</i>");
	else if(pc.isMischievous()) output("joking, <i>“Try not to lose it!”</i>");
	else output("doing your best to focus on the greater objective. <i>“See ya around, kid.”</i>");
	processTime(1);
	flags["GAVE_SHEKKA_PROBE"] = 1;
	pc.addNice(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sell to Steeletech
public function sellThePodToSteeleTech():void
{
	clearOutput();
	output("A quickly-written missive later, you’re offered 20,000 by your father’s company. Do you take it or do something else with it?");
	clearMenu();
	addButton(0,"Sell It",actuallySellToSteeleTech);
	addButton(1,"Options",youWonSomePodShit,undefined,"Options","Back up and consider your options.");
}

public function actuallySellToSteeleTech():void
{
	clearOutput();
	output("The 20,000 credits come immediately, sent as an advance for services rendered. A company delegate will be by the shop to take the probe in a few hours.");
	processTime(1);
	pc.credits += 20000;
	flags["TARKUS_PROBE_CASH_GOT"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
