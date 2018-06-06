import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.Items.Guns.CustomLP17;
import classes.Items.Melee.Cutlass;

public function metKiro():Boolean
{
	return (flags["KIRO_BAR_MET"] != undefined || flags["RESCUE KIRO FROM BLUEBALLS"] == 1);
}
public function showKiro(nude:Boolean = false):void
{
	showKiroBust(nude);
	showName("\nKIRO");
}
public function kiroBustDisplay(nude:Boolean = false):String
{
	var sBust:String = chars["KIRO"].bustDisplay + (nude ? "_NUDE" : "");
	// Hide ball sizes if clothed
	if(!nude) sBust = sBust.replace(/_SM|_LG|_XL/g, "");
	
	return sBust;
}
public function showKiroBust(nude:Boolean = false):void
{
	// Show bust
	showBust(kiroBustDisplay(nude));
}

public function answerKiroDistressCall(destination:String):void
{
	clearOutput();
	output("You divert your course towards the attached coordinates. It isn’t far, and the journey takes little more than a few moments at top speed. When your ship begins decelerating from relativistic speeds, your viewscreen lights up with a picture of the vessel in question. It’s an oddly leaf-shaped craft with a notch out of one side for a docking bay. In the back, a group of engines bundle together to form the stem. Your equipment is easily able to determine that the ship’s systems are all online, yet it remains stubbornly static and unmoving.");

	output("\n\nThe message said that systems were failing, but the power output is perfectly in the green. Did they already get help? Is this a trap? What do you do?");
	//[Board it] [Wait] [Leave]
	clearMenu();
	addButton(0, "Board", boardKirosShipRescue, destination);
	if (flags["RESCUE KIRO WAITED TO BOARD"] == undefined) addButton(1, "Wait", waitKirosShipRescue, destination);
	addButton(2, "Leave", leaveKirosShipRescue, destination);
}

public function leaveKirosShipRescue(destination:String):void
{
	clearOutput();
	output("Are you sure you want to leave? You’re liable to never encounter this ship again if you do.");
	
	clearMenu();
	addButton(0, "Confirm", confirmLeaveKirosShip, destination);
	
	if (flags["RESCUE KIRO WAITED TO BOARD"] == undefined)
	{
		addButton(1, "Back", answerKiroDistressCall, destination);
	}
	else
	{
		addButton(1, "Back", waitKirosShipRescue, destination);
	}

}

public function confirmLeaveKirosShip(destination:String):void
{
	clearOutput();
	output("You resume your previous course, leaving this oddity behind to the void of space. Somebody else can deal with it.");

	flags["RESCUE KIRO FROM BLUEBALLS"] = -1;
	
	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function waitKirosShipRescue(destination:String):void
{
	if (flags["RESCUE KIRO WAITED TO BOARD"] == undefined) processTime(60);

	clearOutput();
	output("You wait an hour to see if anything happens, but nothing does. Just two ships running at full power, sitting in space. Partway through you get a snack, watching the other ship float listlessly through the void of space as you eat. Whatever trouble this ship is having, it isn’t obvious. Do you board it or leave?");

	flags["RESCUE KIRO WAITED TO BOARD"] = 1;

	clearMenu();
	addButton(0, "Board", boardKirosShipRescue, destination);
	addButton(2, "Leave", leaveKirosShipRescue, destination);
}

public function boardKirosShipRescue(destination:String):void
{
	clearOutput();

	output("The ship proves remarkably easy to dock with. In fact, as soon as your navigational computer begins to plot a course, it automatically extends a docking umbilical in your direction. You guide your craft through the necessary navigational hoops in order to properly connect with it and grab your gear. This could be dangerous.");

	// [Normal ship menu with exit ship as if had landed at a planet]
	shipLocation = "KIROS SHIP AIRLOCK";
	flags["STORED SHIP DESTINATION"] = destination;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kirosShipLocationSetter():Boolean
{
	if(flags["RESCUE KIRO FROM BLUEBALLS"] != undefined)
	{
		rooms[currentLocation].planet = rooms[shipLocation].planet;
		rooms[currentLocation].system = rooms[shipLocation].system;
	}
	showLocationName();
	return false;
}

public function kirosShipInterior():void
{
	addButton(0, "Wails", kirosShipWails);
}
public function kirosShipInterior1():Boolean
{
	output("The inside of the other ship is so richly appointed that it looks to belong to some noble or C.E.O. The halls are paneled with exotic woods, covered in vertical amber and brown striae. The panels are lavishly polished to an almost mirror shine, and the floor is padded with earth-toned carpets so plush that you sink an inch into them as you walk. Small flowering plants are positioned at different points along the short hallway. There are a number of open doorways leading to different sections of the ship");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == undefined) output(", but the distressed wails are coming from further down the hall to the north");
	output(".");
	
	return kirosShipLocationSetter();
}
public function kirosShipInterior2():Boolean
{
	output("The lavishly decorated hallway continues on its north-south journey through the center of this ship, lined by chambers on nearly all sides. The eastern door hangs askew. An elaborately carved plate declares it to be the Captain’s quarters.");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == undefined) output(" Sounds of distress come almost nonstop from the west. Whoever is in trouble on this ship, they must be in there. Oddly, that room has no designation.");
	else output(" To the west, there is an unnamed room.");
	
	return kirosShipLocationSetter();
}

public function kirosShipAirlockUpdate():void
{
	if(shipLocation != "KIROS SHIP AIRLOCK")
	{
		rooms["KIROS SHIP AIRLOCK"].removeFlag(GLOBAL.SHIPHANGAR);
		rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.LIFTDOWN);
	}
	else
	{
		rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.SHIPHANGAR);
		rooms["KIROS SHIP AIRLOCK"].removeFlag(GLOBAL.LIFTDOWN);
	}
}
public function kirosShipAirlock():Boolean
{
	output("This is the oddly-shaped ship airlock");
	if (currentLocation != shipLocation)
	{
		addButton(7, "Exit", move, shipLocation);
	}
	else
	{
		output(", currently connecting it to your ship and allowing you to move between the two freely");
	}
	output(". You’re hard pressed to even call such a small space a room, but the massive doors at either end of it - strong enough to survive the rigors of space - reinforce how important even tiny areas such as this can be.");
	
	return kirosShipLocationSetter();
}

public function kirosShipQuarters():Boolean
{
	author("Savin");

	output("\n\nOn a rack over the headboard is a nice assortment of armaments");
	if (flags["RESCUE KIRO TOOK PISTOL"] == undefined || flags["RESCUE KIRO TOOK CUTLASS"] == undefined)
	{
		output(" including");
		if (flags["RESCUE KIRO TOOK CUTLASS"] == undefined) output(" a hefty-looking sword, looking an awful lot like an old-school cutlass");
		if (flags["RESCUE KIRO TOOK CUTLASS"] == undefined && flags["RESCUE KIRO TOOK PISTOL"] == undefined) output(" and");
		if (flags["RESCUE KIRO TOOK PISTOL"] == undefined) output(" a shiny laser pistol with a mounted scope. Clearly a custom job");
	}
	output(". The owner’s put a lot of work - and credits - into this arsenal.");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == undefined) output(" They’re ripe for the taking, but then again, that’d earn you a good slapping if you meet the captain.");
	output(" On the desk opposite the bed is a single little bonsai tree, surrounded by stacks of gardening books. It looks about on the verge of death, utterly wilted like it hasn’t been watered in ages. Poor thing.");
	
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == undefined)
	{
		if (flags["RESCUE KIRO TOOK PISTOL"] == undefined) addButton(0, "Take Pistol", kirosShipPistol);
		if (flags["RESCUE KIRO TOOK CUTLASS"] == undefined) addButton(1, "Take Cutlass", kirosShipCutlass);
	}
	
	return kirosShipLocationSetter();
}

public function kirosShipPistol():void
{
	var pistol:CustomLP17 = new CustomLP17();
	lootScreen = kirosShipPistolCheck;
	flags["RESCUE KIRO TOOK PISTOL"] = 1;
	itemCollect([pistol], true);
}
public function kirosShipPistolCheck():void
{
	if(pc.rangedWeapon is CustomLP17 || pc.hasItemByClass(CustomLP17))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You put the custom pistol back where you found it.");
	
	flags["RESCUE KIRO TOOK PISTOL"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kirosShipCutlass():void
{
	var cutlass:Cutlass = new Cutlass();
	lootScreen = kirosShipCutlassCheck;
	flags["RESCUE KIRO TOOK CUTLASS"] = 1;
	itemCollect([cutlass], true);
}
public function kirosShipCutlassCheck():void
{
	if(pc.meleeWeapon is Cutlass || pc.hasItemByClass(Cutlass))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You put the cutlass back where you found it.");
	
	flags["RESCUE KIRO TOOK CUTLASS"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kirosShipWails(doOutput:Boolean = true):Boolean
{
	kirosShipLocationSetter();
	
	if(flags["RESCUE KIRO FROM BLUEBALLS"] != undefined)
	{
		output("The room looks to have once been a rec room in its early days, but the pool tables, holoprojectors and couches have all been shoved up into the corners in a pile. A massive mechanical device dominates the emptied space, hanging from the ceiling. Dozens of cables and pipes shroud its central workings from view. Perched atop it, a vidscreen and a pair of holoprojectors flicker on and off, sometimes displaying little more than fuzzes of static. Other times they display intensely erotic ultraporn, the kind of stuff you need sixteen licenses to produce.");
		
		return false;
	}
	
	showKiroBust(true);

	if (doOutput)
	{
		clearOutput();
		
		output("Creeping forward, [pc.rangedWeapon] drawn, you close in on the pained sounds, only the closer you get the more they sound like pleased moans instead. The voice creating the racket is unmistakably female, and up close at the doorway, you’re sure that it sounds both pleasured AND pained. What is going on in there? You peek around the doorway and gasp at what lies beyond...");

		output("\n\nThe room looks to have once been a rec room in its early days, but the pool tables, holoprojectors and couches have all been shoved up into the corners in a pile. A massive mechanical device dominates the emptied space, hanging from the ceiling. Dozens of cables and pipes shroud its central workings from view. Perched atop it, a vidscreen and a pair of holoprojectors flicker on and off, sometimes displaying little more than fuzzes of static. Other times they display intensely erotic ultraporn, the kind of stuff you need sixteen licenses to produce. The bottom portions of the device are obscured by something else entirely, the real thing that made you gasp: giant, furry balls.");

		output("\n\nPerched atop them is a naked feminine form, legs splayed so that they’re sunk partway into the surprisingly squishy sack. Her whole body is stacked on top of her tremendous nuts, and she’s gasping and thrashing and crying all at once. It’s no wonder she put out a distress call; she’s completely immobilized by those massive cum-tanks, weighing her down like an old-time anchor. You can actually hear the stuff slosh around inside them whenever her struggles become particularly violent. Her immense, fluffy, racoon-like tail is bouncing up and down behind her as she struggles. Two-tone brown fur sheaths her entire body from head to toe, and a darker, rich-chocolate mass of hair tangles around her sweating brow and neck. She’s clearly some kind of racoon- or tanuki-girl.");

		output("\n\nThe gasp you made upon entry was enough to draw the animal-girl’s attention, and she twists to look at you, desperation in her eyes. Her breasts jiggle in her new pose, naked to your roving eyes and capped with nipples a chocolate so dark that they’re almost black. Voice breaking, she begs, <i>“Help me cum, please! My milker’s broken and I’m so pent up! I can’t cum without it or a nice, tight cunt! Ohgod, please, I need a cunt!”</i> Her wails become almost feverish, and she thrashes, enabling you to see something massively swollen between her legs slipping partway out of the defunct machine. It’s the color of dark-cherry and covered in angry veins with a positively equine sheath at its base. This tanuki is packing some serious horse-meat!");

		output("\n\n<i>“D-don’t just stand there, fuck me or something! This is- unnnnghmmm... It’s- ooohhh gods... life or death!”</i> she cries as she bends over her mechanized lover and reaches back, spreading her well-rounded cheeks to expose her dark-lipped pussy and darker anal star. <i>“P-please, if I cum the swelling will go down!”</i> Her eyes desperately implore you to help her get off.");


		if(!CodexManager.entryUnlocked("Kui-Tan"))
		{
			CodexManager.unlockEntry("Kui-Tan");
			output("\n\nYour Codex beeps, alerting you that this woman is an example of the kui-tan species and unlocking a new entry.");
		}

		output("\n\nHow do you try to set her off?");
	}

	//[Anally] [Vaginally] [Get Filled][Nope I'm Out]
	clearMenu();
	if (pc.hasCock())
	{
		addButton(0, "Anal", kirosShipChubnookiUpDaButt, undefined, "Anally", "Fuck the beached Tanuki’s ass.");
		addButton(1, "Vaginal", kirosShipChubnookiUpDaCooter, undefined, "Vaginally", "Fuck the beached Tanuki’s cunt.");
	}
	else
	{
		addDisabledButton(0, "Anal", "Anally", "Beached atop her balls, her ass would make for a fantastic target... if you had a cock.");
		addDisabledButton(1, "Vaginal", "Vaginally", "Beached atop her balls, her cunt would make for a fantastic target... if you had a cock.");
	}
	
	if (pc.hasVagina())
	{
		addButton(2, "Vag Filled", kirosShipChubnookiFucksYouGud, false, "Get Filled Vaginally", "Ride the Tanuki’s monster cock with your cunt.");
	}
	else
	{
		addDisabledButton(2, "Vag Filled", "Get Filled Vaginally", "If you had a cunt, you could ride the Tanuki’s monster cock.");
	}
	
	addButton(3, "Ass Filled", kirosShipChubnookiFucksYouGud, true, "Get Filled Anally", "Ride the Tanuki’s monster cock with your ass.");

	if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		if (flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == undefined)
		{
			addButton(4, "Fix Machine", kirosShipfixDaMachine, undefined, "Fix the Machine", "Bring your considerable technical knowhow to bare on the troubled machine.")
		}
		else
		{
			addDisabledButton(4, "Fix Machine", "Fix the Machine", "You’ve already tried - and failed - to successfully fix the troubled machine that would grant the Kui-tan the relief she so desperately needs.")
		}
	}
	else
	{
		addDisabledButton(4, "Fix Machine", "An individual with substantial engineering know-how might be in a position to attempt fixing the machine for the beached Kui-Tan.")
	}
	addButton(14,"Nope!",kirosShipNopeFuckThisShit,undefined,"Nope, I’m Out","You don’t get paid enough to deal with this kind of shit.");
	return true;
}

public function kirosShipChubnookiUpDaButt():void
{
	clearOutput();
	author("Savin");
	showKiroBust(true);

	flags["KIRO_FUCKED_DURING_RESCUE"] = 1;
	
	var selCock:int = pc.biggestCockIndex();

	output("Holy shit, what the fuck? You’ve seen some shit, but this is taking your sexual escapades to a whole new level of what-the-fuckery. The massively endowed tanuki-like girl pleads with her eyes, voice too broken to form coherent words as her gigantic balls shift and swell beneath her, so full of cum she could probably fill a fucking pool. Her mahogany eyes, stained with tears of uncontrolled agony and ecstasy, lock with yours for the slightest moment, and you know what you have to do. ");

	output("\n\n");
	if (pc.isCrotchGarbed()) output("You unzip your fly");
	else output("You toss your kit aside");
	output(" and step up behind the alien’s gigantic nads. Perched atop those massive things, though, there’s no real way to get at her sex even if she’s spreading ‘em wide. Welp. You sigh and, grabbing the fuck-me-boots of darker fur on her legs for support, clamber up onto her gigantic sack. <i>“A-ah gods, it’s heeaaavvvyyyyyy,”</i> she cries as you climb on, and you watch a sudden huge gush of pearly cum blast out of the tanuki’s equine dong, sloshing into the defunct cock-milker in a milky flood, your body weight literally squeezing the spunk out of her. Though you can tell that won’t be nearly enough; her balls still seem to be growing underneath you, the momentum of their huge size meaning her production of cum far outweighs whatever you’ll be able to squeeze out of her that way. Not that this was Plan A, anyway.");

	output("\n\nThe tanuki looks plaintively over her shoulder, her dark fingers digging into her taut ass to spread her cheeks wide, overtly begging you to fuck her, hips shaking wildly, grinding her bare cunt against your crotch for the barest hint of pleasure. You grab your [pc.cock " + selCock + "], stroking yourself as you discard the last of your gear. You let your member flop down into the spread valley of the tanuki’s cheeks and pull her hands away, letting it squeeze around your prick as you decide what, exactly, to do.");

	output("\n\nAnd damn, does she squeeze. Mind-numbed with pleasure, all the tanuki can do is squeeze and writhe, unintentionally hot-dogging you as she shifts atop her quaking sack. You dig your fingers in as she bucks, holding on like a cowboy on a bull. Suddenly, a loud ‘BZAAAP’ sound echoes all throughout the room, and then you’re surrounded by a perfect circle of holo-porn projected from her machine, a dozen Ultraporn vids all playing at once. The tanuki gives a yelp of surprise, but the appearance of a giant pair of holo-tits right in her face seems to shut her right up. Behind her, you see a trio of massively hung alien studs all ganging up on the hugely busty bimbo, mammoth horsecocks at full mast. Your mind quickly imagines them all fucking the slut at once, mouth, ass, and cunt, but boy are you wrong. It ain’t called Ultraporn for nothing. Before you can blink, three rods that each make the tanuki’s ground-slapping prick look small are all crammed into the whore’s ass all at once; she screams and cries in pleasure, drowning out the tanuki’s own moans as the big breeders rape that pornstar’s hole like implacable machines, and the camera pans around to show you just what kind of massive gape that’s giving her.");

	output("\n\nThe screams of the holo-slut and the mind-numbingly huge rectal insertion this tanuki’s clearly into distract you so thoroughly that you almost miss the moment of penetration. While you were busy watching the ultraporn, the tanuki writhing beneath you was clearly busy, humping her hips around your cock, jacking you off with her tightly squeezed cheeks... and slowly but surely shifting the [pc.cockHead " + selCock + "] of your [pc.cock " + selCock + "] down toward her nearest hole. By the time you realize what’s going on, your crown’s pressed hard into her squeezing backdoor, the tanuki panting and groaning as she tries to relax her sphincter despite the clearly maddening pleasure her huge nuts are subjecting her to.");

	output("\n\nWell, she clearly knows what she wants. <i>“F-fuck me, already!”</i> she yelps, grinding back against your cock, <i>“Don’t just sit there... it’s too muuuuuch.”</i>");

	output("\n\n");
	if (pc.isNice()) output("<i>“Sorry. Alright, here we go,”</i>");
	else if (pc.isMischievous()) output("<i>“If you want it so bad, I guess I can fuck all that cum out of you, ya horny slut,”</i>");
	else output("<i>“Alright, alright, quit your whining,”</i>");
	output(" you say, sinking your fingers into her big hips and pulling yours back, bracing for the coming fucking.");

	output("\n\n<i>“J-just be gentle, okay? I only really use my cock...”</i>");

	output("\n\nYou figured, given the porn she’s been watching. Still, you’ve got a cock, and she’s got an ass with what’s gotta be a massive prostate, ripe for the milking. And if there’s one way to get that cum out of her, that’s the key. Squeezing her ass, you tell her to brace herself. She nods, biting her lips as your cock presses in against her dark star.");

	// small cock
	if (pc.cockVolume(selCock) <= kiro.biggestCockVolume() - 100)
	{
		output("\n\nIt doesn’t take as much effort as you’d thought to get your [pc.cock " + selCock + "] in. She gives a little whine, pushes back for a moment, and you’re in. Looks like she’s played with this hole more than she lets on... ");
		pc.cockChange(false, true);
		kiro.buttChange(pc.cockVolume(selCock), false, false, false);
	}
	// big cock
	else if (pc.cockVolume(selCock) <= kiro.biggestCockVolume()+100)
	{
		output("\n\nYou push against her asshole, grunting with effort as her tight little hole resists you, shoving back against your stiff cock until finally with a cry of pain she yields, and your [pc.cockHead " + selCock + "] plunges in. ");
		pc.cockChange(false, true);
		kiro.buttChange(pc.cockVolume(selCock), false, false, false);
	}
	// huge cock
	// "dwarfing her own" == > 21" x 3.5"
	else
	{
		output("\n\n<i>“O-oh god...”</i> she whimpers, visibly shaking as you bring your huge cock to bare, easily dwarfing her own gut-wrenching member. Suddenly, just as you’re lining up for the final push, you feel a cool wetness around your prick. Looking up, you see a big yellow bottle of Peggy’s industrial lube in her hand, pouring it liberally back around her ass, giving her fur a nice sheen as she coats your cock. Muuuuch better. You rub it in, slathering your [pc.cock " + selCock +"] with all the lubrication it needs. You give her ass a slap for good measure before bearing down on her. She cries and shrieks as you push in, her legs flailing around your waist as you grunt and push, forcing the first inch into her now-gaping ass as she struggles to take your massive girth. ");
		pc.cockChange(false, true);
		kiro.buttChange(pc.cockVolume(selCock), false, false, false);
		output("\n\n");
	}

	output("The tanuki shrieks and moans, arms reaching out to brace against the sides of the machine as your [pc.cock " + selCock +"] sinks into her. The muscles of her ass are inexperienced but pleasure-wracked, squeezing wildly as her balls quake and shudder beneath you. You nearly fall off, cock falling out until just the head is in again. Looking down, you can see the absolute flood of spooge gushing out of her now, a veritable sea of spunk flooding from her engorged horsecock, and that’s just from the initial penetration. Oh, she’s in for a wild ride.");

	output("\n\n<i>“A-ah... gods, that’s amaaaaazing,”</i> she groans, her big tits bouncing as her chest heaves, breath ragged. <i>“I only ever use toys... a real cock’s soooo much better,”</i> she breathes, eyes practically rolled back in her head as you can feel her balls deflating, shrinking beneath you.");

	output("\n\n<i>“A virgin? No way!”</i> you laugh, slapping her ass, <i>“Bullshit.”</i>");

	output("\n\n<i>“I only use my cock!”</i> she groans, cupping one of her tits, squeezing the teat. <i>“Sometimes my ass, but my pussy... never.”</i>");

	output("\n\n<i>“Well, could have fooled me,”</i> you say, caressing her hips as her muscles squeeze rhythmically on your [pc.cock " + selCock + "], practically milking you in return. Damn, that’s good... If she ever gets her balls down to size, you wouldn’t mind sheathing your cock in this tight, soft ass again. She seems to agree, her hips gyrating back against you, cheeks reddening as you start to sink your cock back in, tiny thrusts carrying you forward into her warm embrace.");

	output("\n\nAnd then you hit it.");

	output("\n\nYou barely notice the first thick veins, so full of cum that they’re like little ridges in her ass. But a moment later, there’s a tremendous blockage in your way, a huge fleshy bulb in her backside that’s practically gushing with cum. Oh, damn, that’s BIG. As soon as your [pc.cockHead " + selCock + "] touches it, the tanuki screams aloud, back arching as the flood of cum pouring out of her intensifies, actually launching the sucker right off her cock. Fuck! You grab on for dear life as she just about rolls back off the machine, only catching herself at the last moment before you fall off. Your arms latch around her waist, pressing your [pc.chest] into her back, cheek smothered in her hair. ");

	output("\n\n<i>“A-aaaahhhh, nooo. That’s my... aahhhhh, be gentlllleeee,”</i> the tanuki whines, but her hips say different, thrusting right back against your half-buried cock like she wants it all.");

	output("\n\nYou answer her moans with a rough kiss, cupping her cheek and turning her head to meet you. She gasps in surprise, but it’s her tongue that’s slipping into your lips a moment later, tying with your own as your hips sink back in, your cockhead rubbing tantalizingly across her engorged prostate. She moans and bucks in your hands, fingers locking with yours as spunk sloshes out of her, smearing the deck until she’s straddling her shrinking balls in a veritable lake of cum. You move faster, pounding her until the sound of your hips slapping her furry ass echoes over the vocal moans of the ultraporn starlets on screen as they seem to mimic your motions, ass-fucking each other in a multi-species orgy sprawled across every view. The tanuki groans, guiding your hands to her big tits and dark nipples, letting you squeeze and tease her even more as your pistoning prick milks the cum out of her. It rams her cum-swollen prostate as her unending spunk-jet grows in power, gushing onto the far wall like a hose let loose.");

	output("\n\n<i>“Fuckfuckfuck,”</i> she moans, her voice crescendoing into a scream as your [pc.feet] touch down on the deck, her balls now small enough to let you stand. She falls forward onto all fours, taking you with her. You collapse onto her back, and that just pushes her back down until her face is smeared into the sea of sperm under her, matting her fur white. <i>“Gods yeeeessssss!”</i>");

	output("\n\nWell, she seems to like that! With her ass still hiked in the air by her over-sized sack, you grab her hips again and start to go full force, finally battering her prostrate out of the way so you can sink the full length of your [pc.cock " + selCock + "] into the tanuki’s tight little ass. She groans in response, reaching back to spread herself out for you, letting you sink your hips right into her cheeks");
	if (pc.cockVolume(selCock) >= 10 * 2) output(", her stomach bulging with the size of your huge prick distending her innards");
	output(". <i>“Gonna... gonna cum so haaaarrrdddd,”</i> she pants, tongue flopping into her own spunk as she struggles to speak.");

	output("\n\nYou mean she wasn’t cumming yet? Oh, shit.");

	output("\n\nBut her balls are so deflated now that she’s starting to go prone on the deck, and that just won’t do. You hook your arms under her and give the over-hung raccoon a flip, planting her on her ass with her gigantic horsecock flopping down between her tits, nestling right in where it clearly belongs. Her balls splash down with the grace of a crashing shuttle, kicking up a wave of alabaster that splatters against the walls. She instinctively grabs her double-D’s, squeezing them down around her prick as a sudden rush of cum smears her face white with spooge, utterly coating her in her own orgasm. She screams aloud, voice echoing in chorus with the climaxing porn stars above you. She cums hard, ass clenching down like a vice around your pistoning member, trapping you with your leaking [pc.cockHead " + selCock + "] jammed against her pulsing prostate, making her orgasm even harder, cum blasting with such force you’re afraid her head will just pop off under the pressure. Instead, she jacks her tits harder, jerking herself off with them as her anal rings wring your [pc.cock " + selCock + "], milking it almost as hard as you’re doing her.");

	output("\n\n<i>“Fuck me fuck me FUCK ME!”</i> she cries, rewarded with a mouthful of jizz that shuts her right up. You continue to hump against her as she cums, and against all odds the stream of spunk begins to die down, her horsecock spasming and spurting until there’s nothing left of it but a little trickle. <i>“Oh thank the goooods,”</i> she groans, trying to get up onto her elbows.");

	output("\n\nBut, you’ve yet to have your just rewards. You lean in, pressing your lips to the spunk-covered tanuki’s as your hips start to move again, fucking her ass again. She groans, but couldn’t stop you if she wanted to... and she clearly doesn’t. Her arms lock on yours, legs hooking around your waist to guide you deeper, and soon you’re fucking like mad, pounding her battered ass until you’re just on the brink of orgasm, cock rock-hard and ready to fire.");

	output("\n\nInstead, you pull out, leaving her gaping and agape as you jump to your [pc.feet], grabbing your cock and aiming it right at her cum-soaked face. She gets the idea, and struggles to her knees, already cupping her tits as you slide yourself between them, displacing her elephantine she-dick as you go. Once, twice, thrice you thrust through her cum-lubed cleavage before you cum, and her mouth locks around your [pc.cockHead " + selCock + "] at just the right time, sucking you off as you shoot your load, adding to the belly-straining mass she’s already eaten.");

	output("\n\nFinally, she flops down, utterly exhausted. You stroke off the last drops of cum onto her sodden chest: your own personal contribution to the ocean of orgasmic lust that’s flooded out her cabin. <i>“Now </i>that<i>’s a rescue,”</i> she moans, idly stroking her spent horsecock, licking your cum off her lips.");

	kiro.loadInAss(pc);
	kiro.loadInAss(pc);
	kiro.loadInMouth(pc);
	for (var i:int = 0; i < 20; i++)
	{
		kiro.orgasm();
	}
	pc.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();

	processTime(60+rand(15));

	clearMenu();
	addButton(0, "Next", kirosShipPostFirstFuck);
}

public function kirosShipChubnookiUpDaCooter():void
{
	clearOutput();
	author("Fenoxo"); // Guessing, doc doesn't say anything, formatting/markup makes me think its fenwrites
	showKiroBust(true);
	
	flags["KIRO_FUCKED_DURING_RESCUE"] = 1;

	var selCock:int = pc.biggestCockIndex();
	var selCock2:int = pc.biggestCockIndex2();

	output("Smiling at the curvy, animalistic woman riding high on those titanic balls, you can see a perfect, glittering target up there, between her swollen sack and the curve of her cushy-looking derriere. A pair of glossy, half-hidden netherlips peek out at you, puffy with lust and parted ever-so-slightly. [pc.EachCock] practically explode");
	if (pc.cockTotal() == 1) output("s");
	output(" into full mast");
	if (pc.isCrotchGarbed()) output(", tugging tightly at your [pc.lowerGarment], almost painfully");
	output(", twitching as you take in the sight and smell of a hyper-sexed herm just waiting for a good, hard dicking.");

	output("\n\nGrabbing a handful of the silky fur that girds her enormous nutsack, you start to pull yourself up. The experience is a bit surreal, like an odd combination of trying to climb into a work-beast’s saddle and bouncing on a giant water-bed. Her cum-filled pouch is remarkably soft and squishy, so much so that whenever you shift your weight, it displaces the flesh elsewhere, forcing you to cling tight lest you fall off. Luckily, there’s not too far to climb, though each movement causes the tanuki-like herm to gush white cream into the malfunctioning tube.");

	output("\n\nLooking at you over her shoulder with a panting, dazed expression painted across her two-toned face, she begs, <i>“Unnngh, are you gonna let me fuck you? I need something tight to cum in!”</i>");

	output("\n\nYou’re finally close enough to grab hold of her, and you start by placing your hands on her hips, drawing yourself up until you can pull yourself up to her shoulders. During the slow crawl, you can’t help but brush her big, bouncing breasts, and a gentle, ‘accidental’ pinch of a nipple finds its way in as well. This only makes your sex-mad partner all the more enthusiastic in her twisting, shaking gyrations. Lining up with her shaking hips takes a few moments, but once you slip [pc.oneCock] past her well-rounded cheeks, she stills.");

	output("\n\nThe woman asks, <i>“What, you’re gonna fuck my ass? I guess that could work... my prostate’s super sensitive, and...”</i>");

	output("\n\nYou smirk and answer, <i>“Not quite. Just hold still.”</i>");

	output("\n\n<i>“...in my pussy?”</i>");

	output("\n\nYou rock your [pc.hips] forward, grinding your [pc.cockHead " + selCock + "] against her sopping-wet lips. Breathing heavy in her ear, you whisper, <i>“Yep!”</i>");

	output("\n\nDamn, she’s tight! Her cunt, for all its wetness, is vice-like in its tightness, squeezing you so tightly as you push in that you wonder if you’ll make it at all. The well-endowed raccoon-woman’s body arches, her every muscle locking as you slowly work your way inside. For a moment, you feel like you catch on something, but a quick pull and forward stroke has you progressing once more through the squeezing, dripping tightness of her nethers. Her mouth is moving, opening and closing as she tries to deal with the sensations you’re forcing her to experience. Whoever this girl is, you don’t think she’s had a proper fuck in a long time.");

	pc.cockChange(true, false);
	kiro.cuntChange(0,pc.cockVolume(selCock), false, true, false);
	
	output("\n\nSuddenly, she finds her voice and mewls, <i>“Y-you took my... you took my virginity!”</i> Her pussy spasms wildly around your [pc.cock " + selCock + "] in untamed contractions, pouring lubricants out all over");
	if (pc.balls > 0) output(" your [pc.sack]");
	else output(" her legs and balls as well as your own");
	output(". The torturously tight tunnel relaxes after that declaration, and you plow all the way in to your [pc.sheath " + selCock + "] at once, relishing her too-warm body heat while basking in the clutches of her narrow feminine channel.");

	output("\n\nWait, did she just say she was a virgin? You look at her face, seeing the moisture catching at the corner of her eye as she shudders in forced pleasure. Her cock throbs and pulsates, the exposed portion of her sheath stretching to accommodate her sudden growth. There’s a splattering sound that clearly reaches your [pc.ears], even muffled as it is by the machinery around her. The balls below pulsate, nearly knocking you off your [pc.feet] with the force of the spurting cumshot.");

	//Niceguy!
	if (pc.isNice())
	{
		output("\n\nYou feel a little regretful that you so callously took her virginity and begin to kiss at her neck and gently squeeze her breasts. This may have started as a quick fuck to blow off some pressure, but you’d like to make this experience as positively memorable as possible. You apologize, saying, <i>“Sorry, I didn’t know, but I promise, I’ll make this the longest, gentlest, nicest cum you’ve ever felt. Just try to relax and enjoy it, okay?”</i>");

		output("\n\nBiting her lip, the lust-crazed woman nods, and the moisture you saw before dries. Her lips slowly quirk into a smile, saying, <i>“Okay. I suppose my virginity will be hero’s reward enough for you then, my savior.”</i> She pulls her hands away from the machine she’s started packing full and moves them up to her heaving breasts, pressing her palms protectively over your own. <i>“I never thought being saved and taken would feel this good....”</i>");
	}
	//Mischievious
	else if (pc.isMischievous())
	{
		output("\n\nYou feel a little bad about stealing her virginity, but then you remember that you’re saving her life. You unashamedly grab hold of both her tits, giving them a hefty, affectionate squeeze. <i>“Don’t fret, baby. Just think, how many girls get to say they lost their virginity and got rescued by a " + pc.mf("gallant","lovely") + " space captain, saved from the clutches of the deep darkness and loved in the most tender, perfect way possible at the same time?”</i>");

		output("\n\nShe may have a velvet-soft coating of fur covering her face, but you swear, she must be blushing. The big-balled damsel smiles back at you. <i>“You’re right, and mmmm, just start moving your hips soon, okay? Just taking you made me have a nice little cum. There’s so much waiting to come out....”</i> She reaches away from the jizz-oozing machinery and places her hands over yours, squeezing you against her breasts from the outside.");
	}
	//Jackass
	else
	{
		output("\n\nTo be honest, you don’t really feel she has any right to complain about this. You’re saving her after all. You give her tits a greedy squeeze, groping the plush, fuzzy orbs eagerly as you adjust to her recently-claimed snatch. You say, <i>“Look, I’m saving your life, here. Just lie back and enjoy it.”</i> You play your fingers over her nipples to tug and pull on them in between your words. <i>“I saw you cum the moment I put it inside.”</i>");
		output("\n\nThe raccoon-colored woman pants, trying to hide her enjoyment for a moment before just caving right on in. Her tongue lolls out, and she tentatively answers, <i>“O-okay... just... quit talking and fuck me then! I need it!”</i> She grabs hold of your busy hands for support, watching and waiting for you to start properly fucking her once-virgin pussy.");
	}

	//Merge
	output("\n\nYou pull back slowly, watching the strange woman’s knees quake as you stroke her sensitive inner walls with your departing [pc.cockHead " + selCock + "]. It slides nearly the whole way out, exposing your lube-dripping pole to the air for what feels like forever. You hold it there, enjoying watching your hyper-endowed lover squirm, and then you thrust with a firm, assertive stroke, burying yourself wholly inside her. This time, the going is far, far easier. She loosened up a little while you talked, the shape of her tight cunt molding around the girth of your [pc.cock " + selCock + "], yielding to its iron-hard shape with every passing moment. Now, as you pull back for a second stroke, she’s simply sinfully tight, sensuously caressing every inch of turgid cockmeat that finds its way inside her.");

	//Optional DP fork goooo!
	if (pc.cockTotal() > 1)
	{
		output("\n\nInspired by the quantity of love-juices dripping from her nethers, you grab hold of");
		if (pc.cockTotal() == 2) output(" your other cock");
		else output(" another one of your cocks");
		output(" and dangle it beneath her while you withdraw, painting it with her slick estrus. A few quick strokes spread the lubricant across your hot, hungry [pc.cock " + selCock2 + "]. Now ready, you heft it up, aligning it just before your next thrust. After all, the poor, distressed captain has another orifice she seemed quite okay with you using. Why not make this extra special for the both of you?");

		output("\n\nYou do not stop to think further on the situation, instead, you simply slam your [pc.hips] home, burying your slick shaft straight into the tanuki-girl’s willing anus. Surprisingly, it parts around your intruding member with far greater ease than her lower lips did, gleefully accepting your second cock like the asshole of a well-trained butt-slut.");
		
		kiro.buttChange(pc.cockVolume(selCock2), false, true, false);

		output("\n\nYou hit something partway in, arresting your motion. At the same time, the tanuki-woman’s cock throbs, and her balls quake beneath you. She cries out, <i>“Yeeessssss!”</i> in a long, drawn out hiss, and you hear the heavy liquid sloshing of a viscous fluid being forcefully pumped into the machinery she’s docked with. Droplets of white roll out around the edges of the sleeve she’s stuck inside, but the bulk seems to be disappearing deep into the tubes that hang from the device, forced to flow by sheer pressure rather than artificial suction.");
	}

	//Merge
	output("\n\nThe tanuki-woman’s tail, which until now had kept out of the way, swats affectionately against your [pc.leg] as you drill her. Trapped as she is, between");
	if (pc.cockTotal() == 1) output(" a cock");
	else output(" two cocks");
	output(" and a hard place, she can do naught but mewl in pleasure, twist her body in contortions of pleasure, and call out her bliss. <i>“Oh by the stars, right there! Right");
	if (pc.cockTotal() == 1) output(" inside me");
	else output(" on my prostate");
	output("!”</i> She closes her eyes and moans, <i>“Yesssss! Fuck! Harder!”</i> Below you, her balls shrink, their mass even now pumping out of her cock in huge spurts, each so voluminous that it rocks the machine on its moorings, flooding the transparent tubes with white and causing inactive motors to faintly grind.");

	output("\n\nNeeding little encouragement by this point, you hammer away at your over productive partner’s hips, punching");
	if (pc.cockTotal() == 1) output(" into her with such force");
	else output(" your [pc.cock " + selCock2 + "] into her bloated prostate so hard");
	output(" that you can feel the liquid weight shift through her body on its way into the machine. Every piston-hard pump on her backside causes her trembling");
	if (pc.cockTotal() == 1) output(" balls");
	else output(" anal pleasure-button");
	output(" to shrink a hair smaller");
	if (pc.cockTotal() > 1) output(", and soon your member is sliding up and across its surface, trying to slip a little deeper into her softly squeezing butthole.");
	else output(", and soon you’re frantically humping away, pounding her pussy with raw, animalistic breeding desire.");

	output("\n\nGroaning and whimpering in equal measures, the striped beauty sinks lower, her legs splaying across her shrinking spheres in such a way that her heels will soon connect with the slippery deck-plates. It is with some difficulty that you maintain your position behind her; you have to clutch tight to her hips, but you remain upright, solidly fucking her until she gives up every drop.");
	if (pc.cockTotal() > 1) output(" When you actually manage to slip the whole way past her prostate, flattening it down with the rest of her anal walls, you gasp in surprise.");
	output(" The sensation");
	if (pc.cockTotal() > 1) output(" of double-hilting yourself is");
	else output("s are");
	output(" so powerful that you nearly cum yourself on the spot.");

	output("\n\nYou gasp, holding tight to get used to the feeling of having");
	if (pc.cockTotal() == 1) output(" your shaft");
	else output(" both shafts");
	output(" completely ensnared in the tanuki’s warm, slick");
	if (pc.cockTotal() == 1) output(" hole");
	else output(" holes");
	output(". Her body cradles");
	if (pc.cockTotal() > 1) output(" both");
	output(" your pulsating boner");
	if (pc.cockTotal() > 1) output("s");
	output(", not too shy about squeezing and clenching around");
	if (pc.cockTotal() == 1) output(" it");
	else output(" them");
	output(" as the nearly perpetually orgasming woman ejaculates herself dry.");

	if (pc.tallness > kiro.tallness + 6) output(" First your [pc.feet] then hers touch down");
	else if (pc.tallness < kiro.tallness - 6) output(" First her feet, then yours touch down");
	else output(" Both her feet and your own touch down at roughly the same time");
	output(", suddenly on solid ground once more. Having a sure, stable footing makes it all the easier for you to resume your pace, and you slap yourself in and out of her hot little hole");
	if (pc.cockTotal() > 1) output("s");
	output(" with rampant, lusty strokes.");

	output("\n\n[pc.EachCock] is pulsating, trembling and twitching with need.");
	if (pc.cockTotal() == 3) output(" Even the extra one is bobbing and bouncing, dripping all over itself and unable to contain its sympathetic lust.");
	else if (pc.cockTotal() > 3) output(" Even the extra ones are bobbing and bouncing, dripping all over themselves and unable to contain their sympathetic lusts.");
	output(" It doesn’t help that the orgasm-addled woman in front of you is reaching back to squeeze your [pc.butt], watching you over her shoulder in between eyeroll-inducing spasms of pleasure, her tongue sliding back and forth across her lips with sensual hunger.");

	output("\n\nThe lusty maid bubbles, <i>“Mmm, you’re doing so good, hero. Ooohh... OH! Right there! Keep it up! Fuck me harder, baby!”</i> Her hands squeeze you once more, and then, she pushes hard, forcing you as deeply into her as possible. She grinds and wiggles back against you, the warmth of her alien body squishing down against your groin as she twists so that her insides are rolling your");
	if (pc.cockTotal() > 1) output(" doubled dicks");
	else output(" dick");
	output(" around inside of her. The");
	if (pc.cockTotal() > 1) output(" two tumescent shafts");
	else output(" tumescent shaft");
	output(" can barely contain");
	if (pc.cockTotal() == 1) output(" its");
	else output(" their");
	output(" joy at the pleasure");
	if (pc.cockTotal() == 1) output(" it’s");
	else output(" they’re");
	output(" experiencing, and you feel a subtle heat building in your crotch, the only warning you’re given about the orgasm you’re about to have.");

	output("\n\nGroaning in sync, neither one of you notices the dripping spunk pools below, and when you become so enamored by your sexual friction that you both slip, the fall is as unavoidable as it is unexpected. The big-balled alien’s cock slides out of its encapsulating sleeve as you hit the ground, slowing her fall just enough that you slip halfway out before she drops the rest of the way, hilting herself with the ass-jarring impact of her body bouncing into yours. Her balls have dropped down to the size of beach balls, but she’s still cumming, still spurting. Now her member is left free and unrestrained to tower above you both, spraying its waves of alabaster up into a cloud of jism. The droplets sparkle in the artificial light, seeming to hang there an eternity. Then, they drop down over the both of you in a rain, spattering off the tanuki’s tits, soaking her squishy thighs and soft fur, even dripping off her hair in long curtains.");

	output("\n\nGrabbing her tits and moaning, the hermaphrodite plants her feet on either side of you and starts lifting herself up and down, dragging herself along your dick");
	if (pc.cockTotal() > 1) output("s"); 
	output(", her cunt");
	if (pc.cockTotal() > 1) output(" and ass");
	output(" squeezing down so tight that your almost-orgasm rears its head, thrumming through your cock");
	if (pc.cockTotal() > 1) output("s");
	output(" in scintillating vibrations of ecstasy. Eruptions of [pc.cum] pour out of [pc.eachCock], spraying and spurting into the raccoon-girl’s ready passage");
	if (pc.cockTotal() > 1) output("s");
	output(", bathing");
	if (pc.cockTotal() == 1) output(" it");
	else output(" them");
	output(" with your liquid warmth while she wastes hers in a floor-flooding downpour.");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 1000) output(" You pump her so full that her belly rounds atop you, and in an orgasmic daze, you let your fingers play across the swelling spunk-bump.");
	if (cumQ >= 3000) output(" It gets bigger and bigger, to the point where she could easily pass for a pregnant woman");
	if (cumQ >= 5000) output(", but your enhanced virility won’t stop there. You pump that striped pirate so full that her doctor would want to induce birthing were she human, and then you cum some more.");
	else output(".");
	if (cumQ >= 7000)
	{
		output(" This time, the pressure is so great that it comes out her entrance");
		if (pc.cockTotal() > 1) output("s");
		output(" in a rush, mixing your [pc.cumColor] fun with the rising tide of tanuki spunk that’s pooling around you.");
	}

	output("\n\nLocked together, you lie in bliss until every drop has been wrung from your [pc.cocks] and the heavy, room-filling spheres that the herm once had have shrunken down to the size of apples. Of course, by that point you’re both soaked with the musky stuff, but the dopey, satiated smiles painted on both your faces make it easy to ignore.");

	output("\n\n<i>“Damn, now that’s a rescue,”</i> the tanuki-woman says with an exhausted smile.");

	pc.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();
	
	for (var i:int = 0; i < 20; i++)
	{
		kiro.orgasm();
	}

	processTime(60+rand(15));
	
	IncrementFlag("KIRO_VAG_FUCKED");

	clearMenu();
	addButton(0, "Next", kirosShipPostFirstFuck);
}

public function kirosShipChubnookiFucksYouGud(anal:Boolean = false):void
{
	clearOutput();
	author("Fenoxo");
	showKiroBust(true);
	
	flags["KIRO_FUCKED_DURING_RESCUE"] = 1;
	
	var selVag:int = 0;
	if (!anal) selVag = (pc as PlayerCharacter).biggestVaginaIndex();

	output("Shuddering at the sight of all that pent-up seed, you can’t help but think that the best way to empty it out would be inside you. The image of it painted over your");
	if (!anal) output(" inner walls and absolutely bathing your womb");
	else output(" asshole and filling your insides");
	output(" in its creamy delights has you feeling hot and flushed in all the right places.");
	if (pc.hasCock())
	{
		output(" [pc.EachCock] stiffens even though");
		if (pc.cockTotal() > 1) output(" they");
		else output(" it");
		output(" won’t be getting to have any fun, but you stroke");
		if (pc.cockTotal() > 1) output(" them");
		else output(" it");
		output(" all the same as you take in the scene.");
	}
	output(" You cast a lusty look towards the tanuki and tell her, <i>“Pull out of that fake pussy. I’ve got something for you right here.”</i> You drop your gear and bend over to show her just what you’re talking about, grabbing");
	if (!anal) output(" [pc.onePussy]");
	else output(" your [pc.asshole]");
	output(" with both hands and spreading it wide, showing off the");
	if (!anal) output(" juicy, slick");
	else output(" deep");
	output(" interior to the nearly-insensate tanuki-woman.");

	output("\n\n<i>“R-really?”</i> the half-crazed hermaphrodite pants, <i>“I c-can put inside you? I can use you like a little cum-bloated cocksleeve until my balls are empty and you’re waddling around full of jizz?”</i> She bites her lip, grabs her nipple and gasps, violently lurching her hips forward, slamming them into the entrance of the fake pussy with aroused desperation. She jackhammers it a few times before exhaustion overwhelms her, forcing her to give up with a mewl of disappointment. <i>“Please, do it!”</i> She roughly yanks back, revealing a glistening fuckpole at least a foot and a half long, pulsating so violently that it visibly throbs in place. Its big, flat flare is stretched wide like it’s about to cum, and a steady stream of pre-cum is just rolling out of the distended cum-slit.");

	output("\n\nLocking your eyes on that pillar of ");
	if (!anal) output("bitch");
	else output("butt");
	output("-breaking fuckmeat like it’s the most important thing in the room (and to you, it is), you grab hold of the girl’s feet and lurch, dragging yourself up across the soft, squishy ballsack with more than a little effort. Cum sputters out of her tip along with lascivious groans whenever the whole of your bodyweight falls against the trembling sperm-spheres, some even falling on your");
	if (pc.hasHair()) output(" [pc.hair]");
	else output(" head");
	output(" as you manage to pull yourself up between her legs. This close, you can’t help but breathe in her unmistakably animalistic musk. The heady pheromones tickle your nose as you take them in and pump right down to");
	if (!anal) output(" [pc.eachVagina]");
	else output(" your [pc.asshole]");
	output(" until you feel unmistakably wet with need, your face pressed against the skin of her lube-slick cock so hard that it compresses your nose. You give it a long shuddering lick, before you remember your promise. You’re going to let this beast-girl cum inside you.");

	output("\n\nThe horse-dicked hermaphrodite is too turned on to take action other than stroking herself during that time period, and she’s even groping at her own tit. The soft pads that line her fingertips squeeze down on a chocolate nipple as it’s twisted, tugged, and pulled with reckless abandon. The room is rich with the aroma of her need,");
	if (!anal) output(" and your own feminine fuck-scent mixes with it into a soupy");
	else output(" your senses swimming in a scent of the");
	output(" sexual haze. Both panting now, you lock eyes with each other and smile.");

	output("\n\nThe tanuki mentions via stuttering groan, <i>“The l-lube is elasticizing. So, don’t worry about the size. It’ll fit.”</i> Her balls quake under you, nearly tossing you from your perch. Clearly she’s imagining what’s about to happen.");

	output("\n\nYou smile to yourself. Her imagination has no idea how good you’re going to make that bloated horse-dick of hers feel. Placing your hands on her shoulders, you pull yourself up onto just your [pc.feet], balancing yourself as you straddle her splayed legs and align yourself with the pre-spouting pecker. You lower slowly, as her head is at least three or four inches across thanks to its flare, feeling the hot kiss of her efflux as you come within a hairsbreadth of touching her spasming flesh. The slick pre soaks your");
	if (!anal) output(" [pc.vaginas]");
	else output(" [pc.asshole]");
	output(" with a clear coat of sopping-wet lust before");
	if (!anal) output(" your own dripping passion causes it to drizzle");
	else output(" drizzling");
	output(" out onto the tanuki-woman’s increasingly slippery nutsack. You decide that you can hold out no longer.");

	output("\n\nRelaxing your [pc.legOrLegs], you let her flare smash into your");
	if (!anal) output(" juiced-up gates, spreading them");
	else output(" slicked sphincter, spreading it");
	output(" slowly as the rock-hard pillar of cock presses against");
	if (!anal) output(" them");
	else output(" it");
	output(", flat with just enough of a curve to make you spread out wider and wider. Whatever chemical lubricant she was using");
	if (!anal && pc.biggestVaginalCapacity() >= kiro.biggestCockVolume()) output(" doesn’t matter with as much sexual experience as you’ve had. This is just a walk in the park for a flexible cunt like yours.");
	else if (anal && pc.analCapacity() >= kiro.biggestCockVolume()) output(" doesn’t matter with as much sexual experience as you’ve had. This is just a walk in the park for a pliant pucker like yours.");
	else output(" seems to be working, as the wider you go, the better it feels, and there’s not the slightest hint of pain.");
	output(" Once you’re wide enough that you can feel your");
	if (!anal) output(" labia slipping around either side");
	else output(" anus enveloping the circumference");
	output(" of the blunt tip, you throw back your head in a moan of passion. Her pre-cum is bubbling straight into your passage now.");
	if (!anal)
	{
		if (pc.vaginaTotal() > 1) output(" You reach down with one hand to play with");
		if (pc.vaginaTotal() == 2) output(" your other");
		else if (pc.vaginaTotal() > 2) output(" another");
		if (pc.vaginaTotal() > 1) output(" of your [pc.vaginas], fingerfucking yourself in a way that lets you press against the cock inside you, rubbing it to ease the penetration.");
		
		pc.cuntChange(selVag, kiro.cockVolume(0), true, true, false);
	}
	else
	{
		pc.buttChange(kiro.cockVolume(0), true, true, false);
	}

	output("\n\n<i>“Ohhhh yesss,”</i> the raccoon-girl gasps, <i>“You’re going to make me cum so hard. I can feel it.”</i> She kisses you without warning, her pouty lower lip slipping over your own in advance of her probing tongue. It finds your own and begins to tangle with it, distracting you from your pace until your muscles relax and your body slides three inches down that turgid fuckpole all at once. You moan and aggressively kiss her back, not even trying to control your descent anymore. It feels too good, and you’re too horny to try to master yourself any longer. You’re going to let yourself be fucked as fast as your");
	if (!anal) output(" soaking-wet snatch");
	else output(" greedy anus");
	output(" and gravity will allow, stretching out to handle the huge insertion as you go, her pulsating head bathing your");
	if (!anal) output(" reproductive organs");
	else output(" backdoor");
	output(" in a slippery-warm soup of tanuki love.");
	
	output("\n\nGoddamn, she’s huge. Your");
	if (!anal) output(" [pc.vagina "+ selVag +"]");
	else output(" [pc.asshole]");
	output(" is filled so beautifully that you have to wonder if this is what you were meant to be: an organic, dick-draining cock-wrapper. A sudden change in thickness arrests your slow slide down for a moment until it pops past your");
	if (!anal) output(" clinging lips");
	else output(" rectal ring");
	output(" and follows the flare through your canal, stroking over-sensitive nerve bundles along");
	if (!anal) output(" every fold of your cunt");
	else output(" the walls of your anus");
	output(". You whimper and arch your back, feeling it stretch the whole of your body.");
	if (pc.bellyRating() > 25) output(" If your belly weren’t so big, you’re sure you’d see her cock outlined in stark relief on your [pc.skin].");
	else output(" Her cock is outlined in stark relief on the [pc.skin] of your [pc.belly].");
	output(" That cock is just wrecking your");
	if (!anal) output(" pussy");
	else output(" asshole");
	output(". It’s so fucking huge and hot and wet that you’re not sure you’ll ever be able to settle for anything less again.");

	if (!anal) output("\n\nGushes of girlish-cream splatter out from your nether-lips, and y");
	else output("\n\nY");
	output("ou resume your steady slide downward. You’re sure you can feel your internal organs shifting to make room, bent out of the way in proper deference to this powerful, masculine organ. You whimper, biting your [pc.lip] and letting your arms go limp. Your brain feels like it’s shutting down, and you lack the will to make your muscles do anything at this point. You’re just limply sliding down, accepting more and more of the tanuki-woman’s tremendous, towering erection into your");
	if (!anal) output(" taut folds");
	else output(" rear end");
	output(". She’s so big and firm that even with you laying back, limp, it holds you in place, supporting you in a way that your muscles and skeleton have failed to do.");

	output("\n\nThere’s a palpable sense of fullness, a stretching in your middle, and you’re not even all the way down yet. From how high up you are, you guess you’ve only handled about three quarters of that beast-cock, but it feels so big inside you that you could swear you should have had it all by now. How much more prick can one " + pc.mfn("man","woman","person") + "’s crotch hold? Her arms wrap around your chest in a remarkably comforting motion, the soft, padded tips of her fingers pressing down on your [pc.nipples] with gentle squeezes. Her hips lurch upward, and you cry out from rapturous pleasure. Your body is so full, so stuffed with cock, that it should hurt. Your");
	if (!anal) output(" [pc.vagina "+ selVag +"] should be crying out in protest, but all it’s doing is dripping nonstop.");
	else output(" [pc.asshole] should be crying out in protest, but instead, it’s vigorously pulsing with need!");

	output("\n\nTouching down, your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" brushes");
	else output(" make contact");
	output(" with the tanuki-herm’s gloriously soft thighs, her silky fur sliding sensuously across your [pc.skinFurScales] as you settle down atop that pillar of perfect fuckmeat, letting the folds of her sheath bunch up");
	if (!anal) output(" on your outer lips. The two sets of soaked, sensitive crotch-flesh");
	else output(" around your butthole. The soaked and sensitive organs");
	output(" slip and slide all over one another like two sloppy-wet pussies tribbing against each other.");
	if (pc.hasCock())
	{
		output(" Your [pc.cocks] spew");
		if (pc.cockTotal() == 1) output("s");
		output(" out a little pre-cum, and the lusty herm grabs hold");
		if (pc.cockTotal() > 1) output(" of one");
		output(" to squeeze the drippy tip affectionately.");
	}

	output(" You’re panting and cooing with delight while your body lamely twists upon the impaling phallus. Your whole world, much like yourself, is wrapped completely around that cock.");

	output("\n\n<i>“Mmmm, my savior,”</i> the ludicrously endowed woman purrs into your ear a moment before she shifts her weight, setting you both bouncing upon her over-inflated sack. She gently drags you up her cock, every rigid vein and pulsing bulge felt in stark relief on the inside of your");
	if (!anal) output(" [pc.vagina "+ selVag +"]");
	else output(" [pc.asshole]");
	output(". Then, in a moment of exquisite friction and fullness, you both bounce down, bodies locking together once more just in time for a healthy blast of sperm to launch into your");
	if (!anal)
	{
		if (pc.biggestVaginalCapacity() > kiro.biggestCockVolume()) output(" channel");
		else output(" womb with cervix-shattering force");
	}
	else
	{
		if (pc.analCapacity() > kiro.biggestCockVolume()) output(" heiny-hole");
		else output(" insides with earth-shattering force");
	}
	output(". Your [pc.belly] bulges bigger from the weight of the deposit. It actually jiggles and sloshes ponderously on the next bounce, forcing bigger, fatter cum-shots directly inside you, and each time, your swollen sperm-paunch gets bigger and bigger.");

	output("\n\nThis erotic, sensuously exotic fuck is setting your nerves off like overloaded circuit-breakers. They’re flipping from pleasure to mind-crushing orgasm in rapid succession, causing you to arch yourself back against your soft-furred lover’s cushy boobs and " + pc.catDog("scream", "howl", false) + " in delight, your body quaking. She holds you tight through it all, squeezing cumshots that would be considered large to a normal person into you again and again... and again. You whimper when you become so full that her ejaculations are causing spermy backblasts to bathe her ball sack with a spreading puddle of white.");

	//Dickgasms
	if (pc.hasCock())
	{
		output("\n\n[pc.OneCock],");
		if (pc.cockTotal() > 1) output(" the one");
		output(" lucky enough to be held by your lover’s pre-slickened palm, explodes, spouting [pc.cum] so forcefully that it splatters against a wall. The successive shotgun-like blasts of seed fall a bit lower but still succeed in making a mess. Seeing this, she strokes you in between fountainous jets of her own, letting some of your [pc.cumColor] love cover her hand. You’re milking her inside of you as she milks you, and it feels so damned good. ");
	}

	//Tailgasm (no new PG)
	if (pc.hasTailCock())
	{
		if (!pc.hasCock()) output("\n\n");
		output("Your tail thrashes against her, spurting [pc.cum] all over her belly, legs, and tits, even whipping out to hit her in the face with a blast of [pc.cumColor] slickness. It’s just firing out of your [pc.tailCock], completely uncontrolled. You’re helpless to stop it, yet you don’t really want to. It feels too damned good.");
	}

	output("\n\nBounce-fucking your way through your orgasm, you feel parts of your mind shutting down one after another, but you don’t mind. It makes it that much easier to focus on how good");
	if (!anal) output(" [pc.eachVagina] feels. The way your folds");
	else output(" your [pc.asshole] feels. The way your anal muscles");
	output(" stretch and give, the way her hot, passionate gushes roll around inside you before blasting back out into the growing pool on the floor - these things keep every neuron busy and pleasurably pulsating. You don’t even see anything anymore, though whether your eyes have closed or your mind has simply momentarily forgotten how to process visual cues, you don’t know.");

	output("\n\nPaw-like hands squeeze and grope your");
	if (pc.hasBreasts()) output(" tits");
	else output(" [pc.chest]");
	output(" enthusiastically to add another sensation to the symphony of ecstasy. They roll your [pc.nipples] and sometimes tug, rocking every single erogenous zone they can get at. Loving little nips bite at your neck, not hard enough to break your [pc.skinFurScales], but enough to be felt digging in, possessively clamping down near your neck.");

	output("\n\nLocked together like that, you serve as the tanuki-woman’s willing cum-sleeve, milking pressurized waves of spunk from her until you feel warmth wrapping your [pc.feet], [pc.legOrLegs] and eventually [pc.hips]. You’re slowly sinking down into a puddle of spent cum, the very same alabaster cream that was pumped into your");
	if (!anal) output(" [pc.vagina]");
	else output(" [pc.asshole]");
	output(" only to be sprayed back out later. It’s getting so high, and you can actually feel your [pc.feet] touching the ground!");

	output("\n\nThe raccoon-like space-woman grabs you tighter, more fiercely as her super-long orgasm continues. She’s obviously touched down as well, because she’s slapping her hips against yours, fucking your cum-buried");
	if (!anal) output(" pussy");
	else output(" asshole");
	output(" with steady, machine-like motions. She’s working your poor");
	if (!anal) output(", sodden box");
	else output(" orifice");
	output(" with consummate skill, and as she piledrives it harder and faster, the ridiculously potent orgasm you’ve been riding for the past few minutes - or has it been hours - intensifies again. Her huge balls are sloshing through the lake, swaying back and forth as they empty the last of their ultra-virile load straight into your receptive");
	if (!anal) output(" snatch");
	else output(" rectum");
	output(". The jizz crests past your [pc.belly], almost to your");
	var bRow:int = 0;
	if (pc.bRows() > 1)
	{
		output(" lowest row of");
		bRow = pc.bRows() - 1;
	}
	output(" [pc.breasts " + bRow + "].");

	output("\n\nEventually, the cum stops, but your lover’s aggressive fucking doesn’t slow for a few minutes. She’s growling and grunting with each bone-jarring hilting, smashing her cum-soaked sheath against you again and again with furious strikes. She’s almost feral in the way that she spends her lust on your form. Thankfully, she does eventually wear out, giving you a small cum as she rams herself home one last time. Her tongue lolls out, and she groans in satisfaction, <i>“Ohhhhh, thank you, babe. You’re wonderful.”</i>");

	output("\n\nGently, she dips lower into the spunky lake of her own making, letting her softening shaft ooze out of your spunk-soaked channel. Tremors of bliss explode out with the passage of each vein, and when the swollen head emerges, a torrent of");
	if (!anal) output(" lady-spunk and");
	output(" stored-up tanuki goo pours out into the waiting jizz bath.");

	output("\n\n<i>“Damn, now that’s a rescue,”</i> the tanuki-woman says with an exhausted smile.");

	if (silly) output("\n\nA nun opens the door, diving through the tidal wive of sperm as it rolls out, sealing the portal behind herself. She pants breathily, <i>“Sorry... I got here... as soon... as I could.”</i> Her onyx ringlets shine in the artificial light as she throws herself face down into the swimming pool’s worth of spunk. You shake your head and look again, but there’s nothing there when you take a second look. Maybe you just need a nap.");

	// Lotta fuckyfucky
	for (var i:int = 0; i < 20; i++)
	{
		if (!anal)
		{
			pc.loadInCunt(kiro, selVag);
			if (pc.cumflationEnabled()) pc.maxOutCumflation(String("vagina " + selVag), kiro);
		}
		else
		{
			pc.loadInAss(kiro);
			if (pc.cumflationEnabled()) pc.maxOutCumflation("ass", kiro);
		}
		kiro.orgasm();
	}
	
	pc.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();

	processTime(60+rand(15));
	
	IncrementFlag("KIRO_FUCKED_PC");
	
	clearMenu();
	addButton(0, "Next", kirosShipPostFirstFuck);
}

public function kirosShipfixDaMachine():void
{
	clearOutput();
	author("Savin"); // Maybe?
	showKiroBust(true);

	//Tech Specialist only, needs Difficult INT Check
	output("<i>“Hang on, ma’am, help’s on the way,”</i> you say, grabbing your tools as you approach the gigantic cock-milker.");

	output("\n\n<i>“W-what!? Just fuck me already! I tried it!”</i> she cries, but you put up a hand and spin a spanner around your trigger finger. You’re gonna make this machine your bitch. You drop to a crouch, popping a panel off the side, looking down into the maze of wires and chips. And... it’s covered in spooge. Of course it is, what else. You sigh, pull on a glove, and reach in. A few moments, and a few new wires later, you slap the panel back on and hit the power button. Nothing happens.");

	//If FAIL!
	if (pc.IQ() < 75)
	{
		flags["RESCUE KIRO TECHSPEC MACHINE FIX"] = -1;
		output("\n\n<i>“Told you!”</i> the tanuki screams, wobbling on her gigantic ballsack. <i>“NOW HELP ME FOR FUCK’S SAKE!”</i>");

		clearMenu();
		addButton(0, "Next", kirosShipWails, false);
	}
	//Success
	else
	{
		flags["RESCUE KIRO TECHSPEC MACHINE FIX"] = 1;
		output("\n\nYou rear back and THWACK the side of the cock-milker with the side of your spanner. The Tanuki starts to yell at you, but suddenly an animalistic roar erupts from the machine, and the raccoon girl spontaneously orgasms, throwing her head back with a cry of perverse pleasure as the machine resumes, sucking hard on her cock like a legion of whores. You rub your own crotch as the tanuki’s balls seem to deflate, lowering her back to the floor. Before you know it, she’s humping the shit out of that cock milker, pounding it like a mecha-pussy until the cum’s gushing from her cock in an unstoppable flood, a force of sexual nature.");
		output("\n\nDamn, she was pent up.");

		clearMenu();
		addButton(0, "Next", kirosShipPostFirstFuck);
		
		for (var i:int = 0; i < 20; i++)
		{
			kiro.orgasm();
		}
	}
}

public function kirosShipNopeFuckThisShit():void
{
	clearOutput();
	showKiroBust(true);
	author("Fenoxo");

	output("\n\nYou throw your hands up and say, <i>“Nope, I’m out. Don’t get paid enough for this shit.”</i> You turn away and run back to your ship, not daring to look back at the monstrously perverted mess behind you. When the familiar flooring of your ship is underfoot once more, you sigh with relief and slam the hatch closed. You can’t fly away quick enough.");
	
	//Resume previous travels.
	moveTo("SHIP INTERIOR");
	flags["RESCUE KIRO FROM BLUEBALLS"] = -1;

	clearMenu();
	addButton(0, "Next", flyToWrapper, flags["STORED SHIP DESTINATION"]);
}

public function kirosShipPostFirstFuck():void
{
	clearOutput();
	showKiroBust(true);
	author("Fenoxo");

	//Combine after sex scenes or Tech Spec. repair job. 
	output("A little while later, the big-tailed, big-balled, big-cocked... big-everything girl is leaning against the wall, completely ignoring the salty musk that’s coating her nearly from head to toe. She gives you a measuring glance. Her reddish-brown eyes are wide and searching, taking in every detail of her rescuer before returning to your [pc.face]. Suckling some of her excess from a fingertip, she smacks her lips and nods her head in your direction thankfully. <i>“I couldn’t have done it without you, kid. Thanks.”</i> She cleans another finger, licking down to her palm while she gathers her thoughts. <i>“The name’s Kiro Tamahime; you might have heard of me.”</i>");

	output("\n\nYou cock your head to the side.");

	output("\n\n<i>“You haven’t? Shit, I thought I was at least making the news,”</i> she says, stomping a padded foot in irritation. <i>“What’s your name, angel?”</i>");

	output("\n\nYou introduce yourself to the tanuki pirate, but you can’t help glancing down at her naked, sperm-coated breasts, dripping cock, and still-large balls.");

	output("\n\nKiro smiles warmly at you, and her stallion-sized dick twitches slightly. <i>“Mm, that’s a nice name.");
	if (flags["KIRO_FUCKED_DURING_RESCUE"] != undefined) output(" I’d love to fuck a few more times, but");
	else output(" I’d love to properly thank you for the assist, but");
	output(" I’ve got a run to finish up before the buyer changes his mind,”</i> she explains with a wink. <i>“I’ll catch you later, " + pc.mf("handsome", "gorgeous") + ".”</i>");

	output("\n\nWhoah, whoah. If she’s a famous space pirate, she can surely afford some kind of reward for your efforts, right? You put your hands on your hips and ask.");

	if (flags["RESCUE KIRO TOOK PISTOL"] == 1 || flags["RESCUE KIRO TOOK CUTLASS"] == 1)
	{
		output("\n\n<i>“You already took your reward from my cabin");
		if (flags["RESCUE KIRO TOOK PISTOL"] == 1 && flags["RESCUE KIRO TOOK CUTLASS"] == 1) output("--both of them even, you greedy klepto!");
		else output(".");
		output("  If you hadn’t saved my ass, we’d be tangling over that sweet");
		if (flags["RESCUE KIRO TOOK PISTOL"] == 1) output(" little gun");
		else output(" gear");
		output(" right now,”</i> Kiro boldly answers.");
	}
	else
	{
		output("\n\n<i>“Sounds about as fair as anything else out here in the void. Computer, wire two thousand credits here over to the " + pc.mf("man","woman") + "’s account,”</i> Kiro boldly answers. The computer beeps and buzzes, chiming in a moment later to say, <i>“" + (isAprilFools() ? "Dogecoin" : "Credit") + " transfer completed.”</i>");

		pc.credits += 2000; 
	}

	output("\n\nThe tanuki-woman turns away, big tail waving, and waves, giving a sly smile over her shoulder as she bids you farewell. <i>“If we cross paths again, I’d love to spend some time with you. Don’t be a stranger.”</i> A doorway hisses closed behind her, and one after another, the other doors in the ship slam shut, all except the ones leading back toward your ship. Well, you earned some points with a pirate and turned a tidy little profit. Not a bad payout for a good samaritan.");

	flags["RESCUE KIRO FROM BLUEBALLS"] = 1;
	generateMapForLocation("KIROS SHIP AIRLOCK");
	currentLocation = "SHIP INTERIOR";

	clearMenu();
	addButton(0, "Next", flyToWrapper, flags["STORED SHIP DESTINATION"]);
}
