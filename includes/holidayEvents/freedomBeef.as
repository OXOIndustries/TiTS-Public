
public function tryEncounterFreedomBeef():Boolean
{
	var cDate:Date = new Date();

	if (!InCollection(getPlanetName().toLowerCase(), "new texas", "tarkus", "phaedra", "mhen'ga"))
	{
		return false;
	}

	if (!InRoomWithFlag(GLOBAL.HAZARD) || InRoomWithFlag(GLOBAL.INDOOR) || InRoomWithFlag(GLOBAL.WATERFALL) || rooms[currentLocation].description == "")
	{
		return false;
	}

	if (flags["ENCOUNTERED_FREEDOM_BEEF"] == undefined || flags["ENCOUNTERED_FREEDOM_BEEF"] != cDate.fullYear)
	{
		if (debug)
		{
			doFreedomBeefEncounter();
			return true;
		}
		
		if (isNearlyJulyFourth())
		{
			if (rand(20) == 0)
			{
				doFreedomBeefEncounter();
				return true;
			}
		}
	}

	if (silly && rand(200) == 0)
	{
		doFreedomBeefEncounter();
		return true;
	}

	return false;
}

public function showFreedomBeef(beefType:uint, asNude:Boolean, withLauncher:Boolean):void
{
	author("Savin");
	showName((silly ? "FREEDOM\nBEEF" : "BISON\nGIRL"));
	
	var bustName:String = "RILEY";
	if (asNude) bustName += "_NUDE";
	else if (!withLauncher) bustName += "_BRA";
	bustName += "_" + String(beefType);
	
	showBust(bustName);
}

public static const FREEDOM_BEEF_STATUESQUE:uint = 0;
public static const FREEDOM_BEEF_TONED:uint = 1;
public static const FREEDOM_BEEF_AMAZONIAN:uint = 2;
public static const FREEDOM_BEEF_RIPPED:uint = 3;

public function doFreedomBeefEncounter():void
{
	showBust("");
	
	output("\n\nA deafening <i><b>crack!</b></i> booms overhead, a concussive blast of thunder that makes you duck and grab your [pc.weapon]. Your brain immediately leaps to a gunshot going off, but you’re able to relax a bit when you see a corona of crimson sparks erupting in the");
	if (hours >= 20 || hours <= 4) output(" night’s");
	else if (hours >= 12) output(" afternoon");
	else output(" morning");
	output(" sky raining down in a colorful cascade.");
	
	output("\n\nFireworks!");
	
	output("\n\nYou laugh at yourself, letting a moment of relief roll over you - for once, you’re not under attack. Instead, it looks like someone’s celebrating... and nearby, too. Another pop-crack echoes through the heavens, then another, showering the wild sky in red and blue showers of flame. The show’s actually kind of pretty, now that you’re not liable to have a heart attack. Wonder what’s going on?");
	
	output("\n\nA few more paces along your current path, and you think you’re in for an answer: you hear a screech and a flash of flame from over a nearby rise, followed by an uproarious feminine laugh. A streak of flame launches into the air from just a few yards off, exploding into a flower of rosy flames in the sky. The laughing turns into a cheer - more of a warcry, really - as the glistening sparks slowly fall to the planet’s surface.");
	
	output("\n\nYou" + (pc.legCount > 1 ? "r [pc.feet] carry you" : " move yourself") + " over the rise to see who’s making all the ruckus. When you get to the top, you find yourself looking into a tiny clearing playing host to a fold-out metal grill sitting over a shallow fire pit, piping with black smoke and meat smells that make your [pc.belly] rumble.");
	
	output("\n\nA moment later, though, and your attention is drawn to what’s beside the fire. A... a giant blue buffalo?");
	
	output("\n\nYou blink, expecting the beefy slab of cobalt bison-meat sitting on its haunches beside the fire pit to evaporate into some sort of heat-fever illusion, but it remains solidly planted right where it is. The bison’s back is strapped with a bulky, chromed machine hugging its haunches: a fireworks launcher, belching out a streaking, screaming rocket every few seconds. The brilliant flashes overhead actually manage to distract you from the truly unique aspect of the creature for a few moments...");
	
	output("\n\n<b>There’s a woman on top of it.</b>");
	
	output("\n\nOr rather, half a woman, hips growing out of where the buffalo’s neck ought to be. Sun-kissed tan skin glistens in the");
	if (hours > 6 || hours <= 6) output(" sun");
	else output(" moon");
	output("light, almost entirely bare save for a string bikini desperately arresting a pair of beach ball-sized jugs. The two massive mounds are held back only by a pair of star-spangled cloth triangles and a glowing hardlight pin, threatening to spill out with their owner’s every breath. Golden hair spills down around her shoulders, held back by a bright blue holo-feather headband tucked between a pair of short bull’s horns and perky blue cow-ears.");
	
	output("\n\nShe’s turned away from you right now, flipping burgers on her grill and cheering on her automated fireworks display. But even from behind, you can tell she’s...");

	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Statuesque", freedomBeefGoSelection, FREEDOM_BEEF_STATUESQUE, "Statuesque", "The woman’s well-built but smooth and feminine, with just a hint of musculature beneath supple curves and soft flesh.");
	addButton(1, "Toned", freedomBeefGoSelection, FREEDOM_BEEF_TONED, "Toned", "This chick’s clearly spent some time at the gym, or doing hard labor with that oversized body of hers. She’s athletically built, strong enough to give a Thraggen blade lord a run for her money.");
	addButton(2, "Amazonian", freedomBeefGoSelection, FREEDOM_BEEF_AMAZONIAN, "Amazonian", "The woman’s built like a bodybuilder, with sculpted muscles rippling beneath well-toned, hardened flesh. You can’t tell if she’s spent a lifetime of hard labor, or if she’s been swinging a grav-hammer on some distant battlefield.");
	addButton(3, "Ripped", freedomBeefGoSelection, FREEDOM_BEEF_RIPPED, "Fuckin’ Ripped", "She’s ripped as shit! The bison-babe’s sculpted like Ms. Galaxy on contest day and then some, with rippling muscles barely contained beneath tree-trunk limbs and a sculpted chest and six-pack. She looks like she could rip you in half bare-handed.");
}

public function freedomBeefGoSelection(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, true);

	var cDate:Date = new Date();
	flags["ENCOUNTERED_FREEDOM_BEEF"] = cDate.fullYear;

	output("The bison girl’s");
	switch (beefType)
	{
		case FREEDOM_BEEF_STATUESQUE: output(" statuesque"); break;
		case FREEDOM_BEEF_TONED: output(" wonderfully toned"); break;
		case FREEDOM_BEEF_AMAZONIAN: output(" a total amazon"); break;
		case FREEDOM_BEEF_RIPPED: output(" absolutely ripped"); break;
		default: output(" ERROR"); break;
	}
	output(", that’s for sure. You find yourself staring for a long moment, eying the buxom bison from behind until something causes her to stir, glancing over her shoulder in your direction. A big smile spreads out on the tauric woman’s lips, and when she turns, you can see the hand not busy on the cook-top is holding a half-drained beer bottle - the latest of several scattered around the camp.");
	
	output("\n\nShe gives you a jubilant wave, which has the captivating side-effect of making her barely-restrained cleavage quake under her bikini top.");
	
	output("\n\n<i>“Hey there, stranger,”</i> she grins, shifting on her haunches to face you. <i>“Enjoyin’ the show?”</i>");
	
	output("\n\n");
	if (pc.isBro() || pc.LQ() >= 75) output("You tell her that you sure are, never taking your eyes off that jiggling ordinance she’s packing.");
	else output("You’re not sure if she’s talking about the fireworks or the pair of heaving, jiggling boobs she’s somehow stuffed into her bikini top... but the answer’s a big yes either way.");
	
	output("\n\n<i>“Well, come on down and grab a burg, then,”</i> she offers with a tipsy little laugh. <i>“It’s Liberation Day, babe, and you’re not celebrating nearly hard enough!”</i>");
	
	output("\n\n");
	if (pc.IQ() >= 75 || pc.isMisc())
	{
		output("Isn’t it a little morbid for the buffalo girl to be making burgers?");
	
		output("\n\nShe snickers and reaches over to the grill, having to bend <i>way</i> down to get a grip on her tongs and flip a patty. <i>“They’re not buffa-burgs, silly! When <b>we</b> get munched on, it’s a whole different experience! Hehe. These are just good old-fashioned pasture cow, promise.”</i>");
	
		output("\n\nIs that right... ");
	}
	output("Well, she’s making a tempting offer, and the smell of these celebratory munchies has your stomach growling like a mother bear. Loud enough that you’re pretty sure the cook can hear you even over the buzz and pop of her mechanized backpack.");

	//[Join Her] [No Thanks]
	clearMenu();
	addButton(0, "Join Her", freedomBeefJoinHer, beefType, "Join Her", "What’s the harm? Take a seat, eat a burg and grab a beer with the busty bison.");
	addButton(1, "No Thanks", freedomBeefNoThanks, beefType, "No Thanks", "Excuse yourself. You’ve got other things to do.");
}

public function freedomBeefNoThanks(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, true);

	output("You thank the jubilant bison-taur for the offer, but you really have other things to do. As delicious as those burgers look.");
	
	output("\n\n<i>“Aww... Suit yourself, I guess,”</i> the strange woman sighs. She takes a deep swig of her beer and reaches back, triggering the backpack to shoot off another big ol’ rocket into the heavens. <i>“Guess I’m still drinkin’ alone.”</i>");
	
	output("\n\nYou wave goodbye and turn back to the path you were on before.");

	processTime(2+rand(2));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function freedomBeefJoinHer(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, true);

	output("<i>“Sure, why not,”</i> you say, making your way down to her little campsite. She gives you a cheer and knocks back the last of her beer while you’re walking over.");
	
	output("\n\nThere’s a pile of equipment tucked against one of her beefy flanks - field armor, a backpack loaded with the same sort of kit as yours is, and most importantly, a JoyCo cooler popped open to reveal several more six-packs in the wings. The bison-girl retrieves a pair of ice cold drinks and hooks the caps into the glowing hardlight pin holding her bikini together, popping them off with a motion that has all the expected effects on her mammoth bosom; the two hefty mounds quake gaily after each <i>pop!</i>");
	
	output("\n\nShe hands one of the beers over and settles back on her haunches, taking a long swig while you get settled in beside her. The mechanized backpack strapped to her flanks whirrs and folds up onto itself, assuring you that you needn’t worry about getting a bottle rocket in the face while you’re eating.");
	
	output("\n\n<i>“So, what’s your name, stranger?”</i> the bison-girl asks, sucking in a sharp breath after a long draught. She’s really pounding those back!");
	
	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer as you take a drink of your own. Tastes exactly like it looks: cheap and bitter. Given the size of your hostess, you imagine it might take a few packs of this stuff to get her tipsy... then again, if the graveyard of empty bottles piling up is any indication, she certainly came prepared!");

	output("\n\nThe bison gets a big ol’ grin when you give your name. <i>“That right? Well, it’s a pleasure, [pc.name]. I’m Riley!”</i> She jabs a thumb at her mostly-bare chest, drawing your eye to the");
	if (beefType == FREEDOM_BEEF_STATUESQUE) output(" sleek curves");
	else if (beefType == FREEDOM_BEEF_RIPPED) output(" rippling meat");
	else output(" ample muscles");
	output(" of her strong arms as much as her blatant cleavage.");

	output("\n\n<i>“More importantly, I am well on my way to getting absolutely trashed!”</i> she adds, taking another long drink. Her blonde tail swishes through the dirt, following a body-shaking breath of relief when she’s finished, tossing the empty can aside. <i>“Whoo!”</i>");

	var onNT:Boolean = getPlanetName().toLowerCase() == "new texas";

	output("\n\nShe certainly seems to be. What’s she doing all the way out here, though? Kinda odd place to go partying all by yourself.");
	if (onNT) output(" Surely she could have found some cows and bulls to celebrate with.");
	else output(" She didn’t just wander all the way out here in the middle of nowhere to celebrate, did she?");

	output("\n\nRiley shrugs the question off. <i>“Eh? Oh, I guess, but bein’ a rusher’s a lonesome life anyway!");
	if (!onNT) output(" Gotta be used to days on end out here scouting for resources, fendin’ off locals, doin’ the whole wilderness survivor gal thing. Partying in weird places just comes natural I guess!");
	else output(" Rare enough I get to come back to the core, but a girl’s gotta relax once in awhile, right? Still, I guess I’m just more comfortable out here in the fields than in the milk barn or something... at least, when I ain’t hooking myself up to something fun anyway!");
	output("”</i>");

	output("\n\nSo she’s a fellow rusher? Neat. Don’t actually");
	if (silly) output(" ‘meat’");
	else output(" meet");
	output(" many other actual adventure-seekers like yourself out in the wilds, come to think of it. You suppose there’s few enough of you over so much terrain that it’s not likely you’d ever run into each other face to face, but still, it’s cool to meet the competition.");

	output("\n\n<i>“Never thought about it like that,”</i> Riley chuckles. <i>“Guess we are pretty scatter-shot around the place. Should hold, like, planetary meetings or something sometime! Like a support group, but with beer!”</i>");

	output("\n\nAs if to make her point, she pops another cap and starts pounding one back.");

	output("\n\nIf you’ve learned anything since leaving home, it’s that every planet’s got a bar somewhere that serves that purpose pretty well. Riley giggles and takes another drink, almost finishing off her bottle, before reaching down and grabbing her tongs off the grill again. Rather than flipping the burgers this time, she scoops them off the flames and onto a rack on the grillside one after the other until she’s got a pyramid of smoking meat piled up and ready to go. She retrieves a wrapped pack of buns from her cooler along with several packets of condiments that look like they were stolen by the fist-full out of a McBurger World hopper. Good enough, you guess. With a little fiddling, Riley’s made quite the impromptu spread around her firepit.");
	
	output("\n\n<i>“Well don’t just stare, dig in bud!”</i> she says, rubbing her hands together excitedly. <i>“It’s not a Liberation Day without stuff blowin’ up and a whole mess of red meat in your belly!”</i>");
	
	output("\n\nNot waiting for you, she slaps a pair of patties into a bun loaded down with ketchup and munches down! Not one to be left behind, you fix yourself something and settle in across from the tipsy ‘taur to enjoy a holiday meal in the wilderness.");
	
	output("\n\nSpace is weird.");

	clearMenu();
	addButton(0, "Next", freedomBeefJoinHerII, beefType);
}

public function freedomBeefJoinHerII(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, true);

	output("While you’re eating, you decide to pose a question: <i>“So what’s up with Liberation Day?”</i> You remember hearing about it, but you can’t remember ever actually seeing anybody celebrating it. Some kinda regional holiday, maybe?");
	
	output("\n\nRiley blinks at you over the half-eaten crest of her burger, then lets out an uproarious laugh. <i>“Oh, man, even out here in the middle of nowhere, ya gotta go and make me feel like I’m a space hick!? C’mon, you really don’t know?”</i>");
	
	output("\n\nYou shrug");
	if (pc.isNice()) output(" apologetically");
	output(". Guess you could look it up real quick?");

	output("\n\n<i>“Naah, don’t worry,”</i> Riley laughs, finish her drink and reaching for another. <i>“I’m just always surprised folk don’t know.");
	if (!pc.isHuman()) output(" Then again, you’re not human. Can’t expect everybody to keep up with everybody else’s holidays, right?");
	output(" Lib Day’s the anniversary of the first Terran colonies declaring their independence from the homeworld! Sure it was thousands of years ago, but it was our first real step towards the free-wheeling frontier society we’ve got today. My home colony, Vesperia, was one of the first to give Earth the big middle finger over Q-Comms. Hehe. Musta been a sight, seeing a buncha giant centaurs on screen daring Earth to come do something about it. Course they didn’t, cuz back then all anybody had was generation ships. Woulda taken centuries to fight out a war with anybody, so all us colonials got a free pass! Caught on real quick, and soon enough the whole fringe was making decisions for itself. To heck with Earth, we know how to run our own damn planets!”</i>");

	output("\n\nWell, that’d explain why you’ve barely ever heard of the holiday before. Most of those colonies fell right back in line when the Warp Gates came around. But something tells you Vesperia didn’t...");
	
	output("\n\n<i>“Damn right it didn’t! <b>FREEDOM FOR THE FUTURE!</b>”</i> Riley cheers, hammering back her entire beer and reaching back to grab at her ordinance-laden backpack. A tug on a rip-cord sets the paired launchers on her flanks to aim straight upwards, but instead of firing, the machine whirrs loudly and Riley gives off a grunt like she’s just got kicked in the haunches.");
	
	output("\n\n<i>“Aww, come on,”</i> she huffs, planting her hands on her hips and scowling over her shoulder. <i>“What’s wrong <b>now</b>!?”</i>");
	
	output("\n\nYou pop the last of your burger into your mouth and lean around to glance at her device. A servo on the side is spinning uselessly, but it otherwise looks inert. At least it’s not exploding.");
	
	output("\n\nRiley huffs and crosses her arms. <i>“Shoulda never bought from a gabilani! Urgh, ow! Hey, uh, [pc.name]? Mind doin’ a girl a favor and helping me with a strap? Darn thing’s trying to mince my backside.”</i>");
	
	output("\n\nGuess it’s the least you can do for the free lunch. You hop up and walk over to Riley’s fluffy blue flank, brushing aside a little of her bison-taur half’s cobalt fur where the rocket device is strapped in. She twists around awkwardly on her human-half’s overly broad hips, trying to get a good look at what you’re doing.");
	
	output("\n\n<i>“Hey, that tickles,”</i> she laughs when you fiddle with one of the straps. All the ones around her flanks seem to be fine, at your casual inspection. The only one that’s too tight doesn’t seem to have a buckle you can find, though it is being yanked on by the whirring gear on her backpack. You ask if she can just turn the launcher off and pull it free, to which she shakes her head. <i>“Nuh-uh, looks totally jammed up. Gotta cut the cord before I can fix this. Darn Tarkus tech, always breakin’ on me! Could you, uh...”</i>");
	
	output("\n\nRiley grunts and staggers to her hooves, swaying slightly with the sudden change of position, before pointing straight along her back. Her long blonde tail swishes at you, drawing your attention to her meaty haunches. The tight cord is running all the way back around her rump, looks like. The bison babe gives you a pleading look, and eventually you make your way around to her far end.");
	
	output("\n\nHer tail flicks up as you approach, and you’re suddenly hit with a sweet, rich smell wafting off the buffalo-girl’s hindquarters, sending a slow burn spreading from your cheeks on down. One glance tells you all you need to know: she’s as naked back here as everywhere else on her lower body, save for where three leather straps converged in a bundle that’s digging deep into the thick black lips of her bovine twat.");
	
	output("\n\nThe way they’re crossed, it almost looks like she’s wearing a leather thong, riding tight into her juicy slit - and doing nothing to cover her up in the slightest. Riley plants her hands on her hips and calls back, <i>“Could you just, uh, y’know... pull that out, eh? Can’t reach it myself and it’s really starting to hurt!”</i>");
	
	output("\n\nAs if to punctuate her request, the bison-girl’s black twat winks hungrily at you, smearing the leather straps with thick, viscous trails of musky feminine juice.");

	processTime(15+rand(10));
	pc.lust(5);
	pc.instaBuzzed();

	//[Chaste Help] [Flirty Help] [Nope Out]

	clearMenu();
	addButton(0, "Chaste Help", freedomBeefChasteHelp, beefType, "Chaste Help", "Try and extricate this knot of leather from the bison’s pussy without letting things get too hot and heavy...");
	addButton(1, "Flirty Help", freedomBeefFlirtyHelp, beefType, "Flirty Help", "You’ll get that knot out of her, alright, but " + (pc.hasKnot() ? "you’ve got a different one to feed her after!" : "you think you can find something better to slide into that drooling bison-twat!"));
	addButton(2, "Nope Out", freedomBeefNopeOut, beefType, "Nope Out", "This is a little more than you bargained for! Just cut the strap and get out.");
}

public function freedomBeefNopeOut(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("You quickly back away from the sweltering fuck-box Riley’s sporting back there. Grabbing the survival knife from your pack, you grab one of the straps on her back and give it a quick cut, letting the whole contraption slump into a heavy, metallic <i>thump</i> onto the ground beside her. That’ll have to do, right?");
	
	output("\n\n<i>“Uh, right!”</i> Riley laughs, lumbering around to pick up the defective contraption. <i>“Sorry you got an eyeful there! Like I said, didn’t really expect company - my blanket musta gotten away from me.”</i>");
	
	output("\n\nSure. Well, you’ve had your beer and burger, so it’s probably about time you moseyed on back to what you were doing. Your tauric host just shrugs and starts picking up her damaged gear, grumbling to herself about shoddy alien craftworks. <i>“Eh, suit yourself. I’m gonna be cookin’ and shootin’ freedom crackers off all day, myself!”</i>");
	
	output("\n\nYou");
	if (pc.isAss()) output(" answer her shrug with one of your own");
	else output(" tell her to have fun");
	output(" and turn to depart.");

	processTime(5+rand(2));

	clearMenu();
	addButton(0, "Next", freedomBeefLeave);
}

public function freedomBeefFlirtyHelp(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("One whiff of the potent musk emanating from Riley’s breed-hole just about has you reeling on your [pc.feet], swimming in the scents of a ‘taur-girl in need of breeding.");
	if (!pc.hasCock()) output(" Not that you can do much about that - God help you if you had a dick right now, or you’d about be ready to pop! Instead, you lean back for a breath of fresh air, hold it, and go to work.");
	else output(" The cloud of fuck-me pheromones hits you like a Thraggen freighter, making your [pc.cock] jump to attention and smear a healthy dose of pre " + (!pc.isCrotchExposed() ? "inside your clothing": "immediately against Riley’s thigh, since there’s nothing to hold it back") +". You moan under your breath, roiling in the chemical desire inflicted upon you... and enjoying every second of being immersed in her lustful scent.");
	
	output("\n\nThe puffy black lips of her sex quiver as you reach forward, peeling them apart with your thumbs to reveal the knot of leather lodged between them. Riley stifles a whimper by biting on a knuckle, trying to mask her own moans - but the way her pussy winks and drools its musky, thick excitement across your digits, there’s no denying that having you probing around inside is doing to her what her scent has to you. Gently, you trace your fingers through the charcoal tunnel, caressing the sodden walls until you’re slathered with thick ropes of bison-juice. The leather knot is easy to get ahold of, slippery though it is, but you’re not in any hurry to take it out... not when you can grind it through her slick quim, rubbing the slick, soft material through her inner walls before letting the tension drag it right back inside.");
	
	output("\n\n<i>“W-what’re you...”</i> Riley groans, cut off with a gasp as you release the leather strap again and let it slide back into her puss. <i>“Uuuunf! [pc.name], you’re-”</i>");
	
	output("\n\n<i>“I’m what?”</i> you ask innocently, reaching your entire hand in and pulling on the strap.");
	
	output("\n\nRiley cries out, throwing her head back with a shriek of pleasure. <i>“G-good! So good!”</i>");
	
	output("\n\nYou’re stretching her out wider than a bull’s cock, now, letting your knuckles and the straps ride along her sodden channel walls. Her pussy clenches hard, squeezing around your wrist until you pull all the way out. But your thumb comes to rest right on the big, gumdrop-sized pink-mottled bulb sitting eagerly at the front of her hole, giving it a little rub while you dismantle the knot. Riley shudders from hoof to tail - the same tail that lifts up when you pull back, spreading that wonderful breeder’s scent across your cheeks.");
	
	output("\n\nThe device flops onto the ground when you’ve finished with the knot, tumbling into a pile of discarded steel and straps that Riley absently kicks away with one hoof. She’s too busy looking over her shoulder at you, cheeks flushed dark red and chest straining beneath her way-too-tight bikini top. You’re amazed the holopin holding the cups together hasn’t torn the garment apart, the way her tits are heaving.");
	
	output("\n\n<i>“I, uh... you...”</i> she pants, <i>“You gonna take responsibility back there, cow[pc.boyGirl]? Oh, fuck!”</i>");
	
	output("\n\nYour squeezing her over-sized cow’s clit tells her everything she needs to know. She wanted a party, after all...");

	pc.lust(33);
	processTime(5+rand(2));

	freedomBeefSexMenu(beefType);
}

public function freedomBeefChasteHelp(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("One whiff of the potent musk emanating from Riley’s breed-hole just about has you reeling on your [pc.feet], swimming in the scents of a ‘taur-girl in need of breeding.");
	if (!pc.hasCock()) output(" Not that you can do much about that - God help you if you had a dick right now, or you’d about be ready to pop! Instead, you lean back for a breath of fresh air, hold it, and go to work.");
	else output(" The cloud of fuck-me pheromones hits you like a Thraggen freighter, making your [pc.cock] jump to attention and smear a healthy dose of pre " + (!pc.isCrotchExposed() ? "inside your clothing" : "immediately against Riley’s thigh, since there’s nothing to hold it back") + ". You grunt with alarm, suddenly feeling like you’re surrounded by a thick, humid fog that makes it hard to think about anything but the boiling need mounting in your [pc.cock]. Ugh... your head’s positively <b>swimming!</b>");

	//cock PCs must make a tough Will check.
	var failedCheck:Boolean;
	if (pc.hasCock())
	{
		var willChance:Number = (pc.willpower() / pc.willpowerMax()) * 100;
		failedCheck = (pc.inRut() ? true : (pc.willpower() >= rand(willChance)));

		if (!failedCheck) output("\n\nYou shake off the mounting chemical lust and stagger back, gasping for breath. Oh damn, is Riley in some kind of heat? It takes a moment to clear your head, but you manage to take and hold a deep breath of fresh air before diving back in to do your work.");
		else output("\n\nYour heart hammers in your chest, and your [pc.cock] throbs with agonizing need. The bestial part of your mind takes charge, erasing your chaste intentions with a simple, overwhelming command: <b>fuck</b>.");
	}

	if ((pc.hasCock() && !failedCheck) || !pc.hasCock())
	{
		output("\n\nWith as clear a head as you can manage in the face of Riley’s potent arousal, you trace a pair of fingers across one of the slimy leather straps and wrap them around the knot digging into her twat. This necessitates your digits plunging a little way past the very edges of her black pussy-lips, feeling the humid warmth radiating from her bovine sex. You’re practically fisting her by the time you’ve got your hands around the straps.");
		
		output("\n\nSeparated from you by a few feet of heavy-breathing buffalo body, Riley makes a little squeal and stamps her hooves, clutching her hands to her chest. She’s trying not to show how good what you’re doing feels, but the contractions of her lips around your fingers and the flowing wetness can’t hide her arousal. You try and ignore it as best you can, pulling the knot out of where it’s lodged itself and quickly unravelling it.");
		
		output("\n\nWhen you’ve finished, the straps almost snap right out of your hands, whisking away to her flanks and promptly following by a loud <i>crash!</i> as her rocket backpack flops onto the ground. Riley breathes a deep sigh of relief, planting her haunches on the ground again to arrest the oversexed display you’ve been subjected to.");
		
		output("\n\n<i>“Oh thanks, [pc.name]. You’re a... a real life saver!”</i> she smiles, breathing an audible sigh of relief. <i>“Sorry about that. Don’t know what got into my little launcher here, but I guess I oughta be more careful about where I put my straps from now on! Would have been waddling back to my ship like a leithan on feast day.”</i>");
		
		output("\n\nYou almost ask how she even got those on in the first place, but ultimately think better of it lest she try and demonstrate. Instead, you ask if her celebrations are coming to a premature end?");
		
		output("\n\n<i>“No way!”</i> Riley grins, grabbing the discarded launcher and planting it in the ground. <i>“Not gonna let a little technical faux-pas mess up my Liberation Day! This thing’s got a mortar mode I’m pretty sure... let’s see...”</i>");
		
		output("\n\nShe plants the launcher in the dirt and starts fiddling with its controls. You take a healthy step back, and with good reason: a few moments later and a streak of flames erupt from the barrels, making Riley gasp and rear up out of the way. A cascade of flames erupts in the heavens a moment later, instantly restoring the bison-babe’s cheer.");
		
		output("\n\nAfter a few moments, Riley cracks another beer and sits back, happily watching her fireworks shoot off. She offers you another beer as thanks, and given the haze still lingering in your mind from the buffalo’s needy quim, you’re quick to accept. It isn’t long before lingering sex-haze is replaced by a nice, tingly buzz, and find yourself relaxing against the bison’s cobalt flank, watching the display in the sky.");

		pc.lust(33);
		processTime(50+rand(20));
		clearMenu();
		addButton(0, "Next", freedomBeefChasteHelpII, beefType);
	}
	else
	{
		output("\n\nThe puffy black lips of her sex quiver as you reach forward, peeling them apart with your thumbs to reveal the knot of leather lodged between them. Riley stifles a whimper by biting on a knuckle, trying to mask her own moans - but the way her pussy winks and drools its musky, thick excitement across your digits, there’s no denying that having you probing around inside is doing to her what her scent has to you. Gently, you trace your fingers through the charcoal tunnel, caressing the sodden walls until you’re slathered with thick ropes of bison-juice. The leather knot is easy to get ahold of, slippery though it is, but you’re not in any hurry to take it out... not when you can grind it through her slick quim, rubbing the slick, soft material through her inner walls before letting the tension drag it right back outside.");
		
		output("\n\n<i>“W-what’re you...”</i> Riley groans, cut off with a gasp as you release the leather strap again and let it slide back into her puss. <i>“Uuuunf! [pc.name], you’re-”</i>");
		
		output("\n\n<i>“I’m what?”</i> you ask innocently, reaching your entire hand in and pulling on the strap.");
		
		output("\n\nRiley cries out, throwing her head back with a shriek of pleasure. <i>“G-good! So good!”</i>");
		
		output("\n\nYou’re stretching her out wider than a bull’s cock, now, letting your knuckles and the straps ride along her sodden channel walls. Her pussy clenches hard, squeezing around your wrist until you pull all the way out. But your thumb comes to rest right on the big, gumdrop-sized pink-mottled bulb sitting eagerly at the front of her hole, giving it a little rub while you dismantle the knot. Riley shudders from hoof to tail - the same tail that lifts up when you pull back, spreading that wonderful breeder’s scent across your cheeks.");
		
		output("\n\nThe device flops onto the ground when you’ve finished with the knot, tumbling into a pile of discarded steel and straps that Riley absently kicks away with one hoof. She’s too busy looking over her shoulder at you, cheeks flushed dark red and chest straining beneath her way-too-tight bikini top. You’re amazed the holopin holding the cups together hasn’t torn the garment apart, the way her tits are heaving.");
		
		output("\n\n<i>“I, uh... you...”</i> she pants, <i>“You gonna take responsibility back there, cow[pc.boyGirl]? Oh, fuck!”</i>");
		
		output("\n\nYour squeezing her over-sized cow’s clit tells her everything she needs to know. She wanted a party, after all...");

		pc.lust(33);
		processTime(5+rand(2));

		freedomBeefSexMenu(beefType);
	}
}

public function freedomBeefChasteHelpII(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("After a while, you find the nice buzz slowly progressing into outright drunkeness. You’re lucky to have Riley to lean on, otherwise you’re not entirely sure you could keep your footing. The bison girl seems more than happy to let you rest against her, and at some point, her");
	if (beefType != FREEDOM_BEEF_STATUESQUE) output(" muscular");
	output(" arm has wandered down to wrap around your shoulders. She’s giggling almost incessantly now, provoked to cheering or fits of laughter by just about anything - whether it’s her seemingly inexhaustible supply of fireworks going off, or any incidental comment you make. And you’re talking more and more, too, as you succumb to the power of cheap booze and fun company.");
	
	output("\n\nAll good things must end, though, and eventually the booze and burger supplies run out... followed by the fireworks a short while later. The device makes a defeated little poot-sound and powers down when it’s fired its last, leaving you in a sudden and uncharacteristic silence.");
	
	output("\n\nSo how does a big ol’ buffalo party when she’s out of all the good stuff?");
	
	output("\n\nRiley giggles drunkenly and presses her shoulders together, making her already hefty bust look that much more succulently large between them. <i>“Hehe, I dunno... I didn’t plan that far ahead. ‘Course I didn’t plan to have company either. Cute company, too...”</i>");
	
	output("\n\nHer words are slurring a bit, but she’s locked eyes with you and wiggles her blonde tail. <i>“Maybe you, uh, saw something you liked back there, eh?”</i>");

	processTime(5+rand(5));

	// [You Did] [No Thanks]
	clearMenu();
	addButton(0, "You Did", freedomBeefLikedIt, beefType, "You Did", "Now that you’ve had a few more beers in you... yeah, you’re starting to think you missed your chance.");
	addButton(1, "No Thanks", freedomBeefNoneForMe, beefType, "No Thanks", "You still want to keep things chaste. She’ll have to party alone; time to get going now that the fun’s over.");
}

public function freedomBeefNoneForMe(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("As politely as you can, you tell Riley that you’d rather part as friends - but good luck to her and her one-bison party. She sighs, but gives you a smile and says <i>“Well, I know how to take a hint. Was good hangin’ with you while I had the chance, [pc.name]. Real good! Hope I see you again later on in the Rush. Maybe even ‘fore next Liberation Day!”</i>");
	
	output("\n\nHa, maybe you will at that. You could certainly stand some more of her cooking some time.");
	
	output("\n\nYou give her a wave and turn back to your path.");

	processTime(5+rand(2));

	clearMenu();
	addButton(0, "Next", freedomBeefLeave);
}

public function freedomBeefLikedIt(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, false, false);

	output("Now that you think about it, you kinda regret not taking advantage right there and then. Either way, now that she’s outright offering... well, you don’t think you can say no to a chance to feel out what the towering ‘taur has to offer.");
	
	output("\n\nYou tell her that yeah, you did, and you’re more than happy to help her keep her party going.");
	
	output("\n\n<i>“That’s what I like to hear!”</i> she grins, rising to all fours and");
	if (pc.isTaur())
	{
		output(" wiggling her enormous rear for you. <i>“");
		if (pc.hasCock()) output("Get on back there and mount up, stud! Ugh, I’ve been ready for this since that stupid machine... well, you saw how wet and randy it got me!");
		else output("Wanna go back to back and rub ‘em, or... do you have something else in mind, cutie? Either way,");
		output(" I’m all yours, [pc.name].”</i>");
	}
	else
	{
		output(" pacing around to face you. <i>“Just, um, I’ve only ever been with ‘taurs like me before, so... wanna teach a big ol’ girl a new trick or two?”</i>");
	}
	
	output("\n\nRiley gives you a wink and cups her hands under her titanic rack, already starting to work the holopin clasp holding it back.");
	
	freedomBeefSexMenu(beefType);
}

public function freedomBeefSexMenu(beefType:uint):void
{
	clearMenu();
	if (pc.isTaur() && (pc.hasCock() || pc.hasHardLightEquipped()))
	{
		addButton(0, "Mounting", freedomBeefTauricMounting, beefType, "Tauric Mounting", "Get up on Riley’s back and breed the randy bison’s pussy.");
	}
	else if (!pc.isTaur())
	{
		addDisabledButton(0, "Mounting", "Taur Mounting", "Only taurs get to mount up taur style!");
	}
	else
	{
		addDisabledButton(0, "Mounting", "Taur Mounting", "You need a donger or some hardlight panties to mount her taur-style!");
	}

	if (pc.hasCock())
	{
		addButton(1, "Snu Snu", freedomBeefSnuSnu, beefType, "Hip-Crushing Snu Snu", "Have Riley use that big bison ass of hers to pound you into the ground.");
	}
	else
	{
		addDisabledButton(1, "Snu Snu", "Hip-Crushing Snu Snu", "You need a cock for the amazonian beef-chick to pound you into the ground!");
	}

	addButton(2, "Eaten Out", freedomBeefLesboLicks, beefType, "Eaten Out", "Play with Riley’s tits while she eats you out.");
}

public function freedomBeefTauricMounting(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, true, false);

	output("Your gaze is focused on the broad, furry flanks of Riley’s bison-morphed backside. Her tauric hips are even wider than a cow’s, and built like a brick house of tense muscle and gaping womanhood. Your previous attentions have left her wet and ready, black lips slowly winking at you, bridged by thick ropes of translucent juices. You take one deep breath of her aromatic breeder’s scent, and know that there’s no way you could resist sinking your dick into that needy hole.");
	
	output("\n\nAlready rock-hard and ready, you canter around Riley’s rear-end and shuck out of your [pc.gear]. She watches you all the while, her breath quickening as you expose your form... and her eyes quickly lock onto the dangling, tumescent heft of your [pc.cockOrStrapon]. <i>“Ooh, c’mon stallion, let’s get that beauty inside me!”</i> she purrs, lifting her golden tail in invitation.");
	
	output("\n\nLike you need any more encouragement. Stamping a [pc.foot] on the dirt, you let loose a jubilant roar and charge from behind, lunging up onto the fluffy bison butt on offer and thrusting your hips and legs in bestial unison. Your forelegs grapple her waist, pulling your body along her back until the");
	if (pc.hasCock()) output(" [pc.cockHead]");
	else output(" head")
	output(" of your prick butts against the slutty, sodden mound of her quim. The dark hole seems to suck you in, kissing at your crown until your [pc.hips] push it past Riley’s lips and into the sultry heat of her fuck-hole’s embrace.");
	pc.cockChange();
	
	output("\n\nYour lover moans, knees buckling under the sudden surge of weight and pleasure on her body. You steady her as best you can for that first blissful moment - which comes down to pressing your chest into her back and reaching around to grab those huge tits of hers, sinking your fingers into the bison’s jiggling titflesh. One good yank tears her star-spangled bikini open, sending the holopin flying and letting the mammoth mounds spill free into your hands. Her nipples are as big and as stiff as you’d expect, saucer-like peaks that press into your palms. One good pinch and tug makes the buffalo babe squeal... and makes her gaping bovine pussy clench wonderfully hard around your [pc.cockOrStrapon].");
	
	output("\n\nThough your first thrust slammed you straight to the hilt, her greedy pussy makes dragging it back out an agonizingly-pleasurable struggle for every inch. <i>“Ah! Aw yeah!”</i> Riley moans, bucking her muscular ass back against your crotch before you can even get halfway out. Her");
	if (beefType == FREEDOM_BEEF_STATUESQUE) output(" strong");
	else if (beefType == FREEDOM_BEEF_TONED) output(" muscular");
	else if (beefType == FREEDOM_BEEF_AMAZONIAN) output(" ripped");
	else output(" titanic");
	output(" arms lock around yours, guiding you to just the right places on her heaving rack. <i>“Just like that, stud!");
	if (getPlanetName().toLowerCase() == "new texas") output(" Milk those tits like a cow-girl’s!");
	else output(" Give my titties some love!”</i>");

	output("\n\nShe makes a deep, throaty nickering sound, nuzzling her head back against your [pc.chest]. Despite her best efforts, you manage to withdraw your [pc.cock] a little more before you start sawing the tumescent rod back into her dripping, wet sheath. Riley’s pussy drools around your manhood, squirting and leaking with your mighty thrusts. It isn’t long before your thighs and her backside are a musky swamp of feminine excitement.");
	
	output("\n\nBetween deep thrusts into her hungry cunt, you let one of your hands wander up from Riley’s jiggling rack and cup her cheek, turning it towards you. She gasps, drawn from her blissful reverie and into a deep kiss. Your lips lock to hers, holding her tight until her mouth opens, admitting your tongue to tease at her own. The powerfully-built bison is practically putty in your hands now, utterly submitting to your bestial mounting: she whimpers and moans as your [pc.cockOrStrapon] takes her again and again, and her breasts and mouth soon reveal themselves to be epicenters of pleasure, leaving her trembling in your arms the more you play with her.");
	
	output("\n\n<i>“O-oh! You sure you’re not from Vesperia?”</i> Riley murmurs when you finally break the kiss. <i>“Cuz you’re putting every bull back home to shame!”</i>");
	
	output("\n\nShe giggles happily, rolling her head back against your chest. Her tongue’s practically lolling out of her mouth without you there to tend to it, and her eyes quickly become unfocused, staring off while their owner succumbs to bliss. The squeeze on your cock eases off, replaced by rhythmic contractions and whole mess of extra juices easing your way. No question: she’s on the edge already! You grin and grope her tits just that much harder, pile-driving your [pc.cock] into her quivering quim as hard as you can to push Riley over the edge.");
	
	output("\n\nHer voice crescendos, rising from gasping moans into a cry that echoes across the land. Riley’s climax only makes you work harder to give the jubilant bison-babe the most mind-blowing orgasm she’s ever experienced. Her sex feels like you’re thrusting into a hot-water sleeve, compressing around your pillar like the perfect, lube-slathered onahole in the fluffiest fuck-saddle a ‘taur like you could ask for. And it doesn’t hurt she’s got an amazing rack for you to play with while you enjoy her body!");

	output("\n\nWhile Riley’s leaking and gushing around you, your rut-addled mind slowly starts to recognize the familiar");
	if (pc.hasCock()) output(" churning in your [pc.balls] - that rising tension preceding the oncoming storm. The sensation of impending eruption");
	else output(" burning need in your loins - that rising tension preceding the oncoming storm. The sensation of impending orgasm");
	output(" only drives you to fuck Riley harder, deeper - to cram every inch of throbbing cock-flesh into the breed-hungry bovine before you lose control completely. Your newfound lover’s channel welcomes you the way only a ‘taur can, letting you sheath your [pc.cockOrStrapon] all the way");
	if (pc.hasCock() && pc.longestCockLength() >= 18) output(" until your [pc.cockHead] is battering the entrance of her womb, kissing the depths of her sex before you fill it with your seed");
	output(". Her huge body is the perfect receptacle for your manhood, and soon your chest is heaving with the effort of holding back your orgasm, building it up to a frothy, potent excess");
	if (pc.hasCock()) output(": you’re not done until you’ve packed Riley’s womb with every last drop");
	output(".");

	output("\n\nWith a final, feral grunt of bestial dominance, you grab Riley’s tits in both hands, pulling the buffalo-slut back into a rough kiss. Your [pc.cockOrStrapon] throbs one last time inside her, letting the bovine beauty’s sudden squeeze milk you over the edge");
	if (pc.hasCock()) output(" until a surge of [pc.cumNoun] strains your body to the limit and rushes out like a geyser into Riley’s waiting womb");
	output(". She moans and bucks her hips back against you, suddenly buckling under your assault - looks like her first climax left her weak in the knees; the second one you drive her into leaves her moaning like the bitch in heat she is,");
	if (pc.hasCock()) output(" taking your [pc.cum] until it spurts out in a musky waterfall of your mixed juices, pooling between her thighs.");
	else output(" musky femcum sputtering out from her well-fucked cunt in a waterfall of juices, pooling between her thighs.");

	if (pc.hasCock()) output("\n\nIt takes an age to empty your [pc.balls], it feels like, squirting into Riley’s sodden quim again and again until you ache with emptiness. But she eagerly takes it all, moaning and shuddering in your incessant groping grasp right until the very last drop.");
	else output("\n\nIt takes an age for the final termors of your orgasm to taper off, bucking into Riley’s sodden quim again and again until you ache with emptiness. But she eagerly takes it all, moaning and shuddering in your incessant groping grasp through it all.");
	output(" When you’ve cum your all, a wave of fatigue hits you like a brick wall, leaving you wobbling drunkenly on Riley’s back and suddenly aware of how much the world is spinning around you.");

	output("\n\nOof. You shift your grip down, locking your arms around the bison’s belly and resting your [pc.chest] against her back. A few moments more and her knees finally give out, slowly drooping her down to rest on her belly, and bringing you with her.");

	output("\n\n<i>“Oh, <b>[pc.name]</b>!”</i> Riley manages to say after a long, long moment spent silently gasping for breath. <i>“You’re a real rutting beast, haha!”</i>");

	output("\n\n");
	if (pc.isAss() || pc.isBro()) output("<i>“Damn right I am,”</i> you growl, nipping at her ear.");
	else if (pc.isNice()) output("You laugh and mutter an apology, still twitching inside her.");
	else output("You give her a tweak on the nipple and tell her she just brought out the animal in you.");

	output("\n\nRiley makes a deep, happy sound and nuzzles back. <i>“I love that in a "+ pc.mf("man", "woman") +"... though I don’t know if I’m gonna be able to walk back to my ship after that!”</i>");

	output("\n\nWell, you’re sure you’ll find some way to pass the time until she can get back on her hooves...");

	processTime(25+rand(10));
	pc.orgasm();

	IncrementFlag(flags["FUCKED_FREEDOM_BEEF"]);
	IncrementFlag(flags["FUCKED_FREEDOM_BEEF_TAURIC"]);

	clearMenu();
	addButton(0, "Next", freedomBeefSexOutro, [beefType, (pc.hasCock())]);
}

public function freedomBeefSnuSnu(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, true, false);
	author("SKoW");

	var cockIdx:int = pc.biggestCockIndex();

	output("She’s a big girl... but that massive taur-pussy is brazenly on display and just waiting for you. Your previous attentions have gotten her so sloppy and soaking you can hear her juices pitter-patter to the ground. Her muscular, beefy ass sways from side to side, assaulting your nose with a musk that has your [pc.cocks]");
	if (pc.isCrotchGarbed())
	{
		output(" pressing against your " + pc.lowerGarmentDescript() + ".");
	}
	else
	{
		output(" throbbing to attention.");
	}

	output("\n\nShe grunts and flexes her muscles so hard it forces a squirt of female excitement into your face... you don’t think you’re able to hold yourself back any more. You throw off your [pc.gear] into a hurried pile, stretching like a swimmer about to take the big dive while Riley watches, panting and mauling her massive pillowy tits. <i>“Nf, now how do we do this honey?”</i>");

	output("\n\nIt’s a struggle to get your lust-addled brain in gear,");
	if (flags["FUCKED_FREEDOM_BEEF"] == undefined) output(" and you blurt out the first thing that comes to mind");
	else output(" enjoyed it enough last time");
	output("... she could always get low to the ground and find out if a cow can ride cow-girl.");

	output("\n\n<i>“You want me to sit on you? Hah! But I’ll crush you!”</i>");

	output("\n\nCrush you? You’re so achingly hard you feel unbreakable. You look that muscular slice of flushed, fuck-hungry taur dead in the eyes and get down to the ground. Her will holds out for all of a few seconds before she drops her back legs; your life flashes before your eyes. A moment later, the breath is crushed from your lungs as your newfound lover pounds your hips into the ground. You gasp in a lungful of air so that you have something to moan in delight with as she grinds her massive ass down against you.");
	pc.cockChange();

	output("\n\nRiley gasps and clenches down on you, hard enough to milk your [pc.cock "+cockIdx+"]... if her box were any less utterly dripping, it might even have hurt. <i>“Oh! Oh~ this really is nothing like a mounting~”</i>");

	output("\n\nYou try to jerk your hips and eke some more pleasure out of her cavernous taur-pussy, but you’re unable to move. She appears to feel your attempt though, judging by the fresh squirt of excitement that puddles on your abdomen. She seems to catch on that you’re trapped there, blushing as she raises her hips up again. Compared to the sultry heat of her snatch, the open air is like an icy breeze, but you don’t have to worry about it for long. You’re once more pounded into the ground by her ass, and your entire body strains against the force of it.");

	output("\n\nYou’re two thrusts in, and it’s almost a certainty you’re walking away from this bruised. A lesser person possibly wouldn’t even walk away. But you’re an adventurer; you’re made of sterner stuff than this. The insistent grip she has on your cock as it");
	if (pc.biggestCockLength() > 18) output(" grinds hard on her cervix");
	else output(" teases every fold it can reach");
	output(" is all the incentive you need to hang in there for the long-fuck. You spank at her ass hard enough to sting your own palm, sure that she’d still barely only feel it. Regardless, she seems to enjoy the effort, wiggling her bountiful rear against you- which was probably a bad move on your part, considering the groaning complaints of your lower-body.");

	output("\n\nShe goes up again, letting loose a deluge of musky, lust-inflaming pussy-juices that shower your cock in affection. <i>“And again!”</i> she calls out, dropping onto you. This time you’re a little more ready, and it’s not instantly suffocating, but still your muscles complain at the strain. Oh stars... is this only the third thrust?!");

	output("\n\nYou bring down both your hands in a powerful spank, wincing and pushing up, as though you could help her rise. And you do, slightly; she follows your wordless instruction and lifts her ass before it can trap you again. If you can keep up that pace, you can even thrust your hips back into her. She lets out a cry of ecstasy, and you slicken your hands in the sloppy secretions of her hungry muff, wrapping one into a fist.");

	output("\n\nYou bolster yourself for her next bone-dusting slamming of your burning-hot member, and when she drops down onto you like a pile of bricks, she lets out a whorish moo-oan. <i>“My-my ass!”</i> a fresh heat makes itself known, as the knuckles of your fist batter their way romantically through her winking asshole and make a new home in her gut. Your free hand pushes up on her again, and she whimpers this time, lifting off of the cock-fist double-penetration.");

	output("\n\nYou’re not sure how long you’re going to last at this rate thanks to the heady cocktail of fem-lube mixed with your pre. Thinking about it, it’s entirely possible she just came, if the mess pooling around you is any indication. Trapped in your own fuck-drugged mind, you’re unprepared for the next time she comes down, and you see stars as your maleness is wrapped in the perfect heat. Your gasp for life sounds more like a whorish moan though, drowning in the sensation. With a fist deep in her ass, you can feel it brush up against your own cock.");

	output("\n\nThere’s a familiar churning in your [pc.balls] of seed that’s desperately looking for a way out, but you hold back on that urge, once more pushing against rump. She actually sounds tired, and you can see the muscles of her flanks working hard to get her to go up again - but you’re so close, you need her to keep going.");

	output("\n\nYou take in a massive lungful of air, and line up your hand, ready for the drop. There’s an audible, churning squish of a thoroughly pounded cunt. You let out a scream of pleasure and pain as (not for the first time) your vision is a splotch of colors and stars. Her legs gave out as she descended, and now you’re looking at a race against time to find some completion. There’s one last surprise in store for this bison though...");

	output("\n\nNow that you’re also elbow-deep in her ass, you can get your fingers to wrap around your throbbing [pc.cock "+ cockIdx +"]. She whimpers and strains as you find your grip, before vigorously jerking yourself off inside of her. She bucks and goes wild, pushing more and more breath out of you; if you don’t finish soon, this could turn out to be a death sentence.");
	if (pc.hasKnot(cockIdx)) output(" If you knot inside of her, you might well face your end anyway.");

	output("\n\nFinally, as you start to see the light at the end of the tunnel, you cum explosively, painting the walls of her womb with [pc.cumColor] [pc.cumNoun]. Riley’s pussy spasms against you, immediately forcing a load of it back out, mixed with her own sticky-sweet secretions; not that you’re able to tell compared to the mess you’ve already been reduced to.");

	output("\n\nYou limply push at her, struggling to draw in a breath through the massive bison-booty crushing your pelvis. <i>“You want to go for... for another round? You beast! I’m all wiped ou- Oh! Oh no!”</i>");

	output("\n\nShe clambers off of you, face flushed and wiping drool from her lips, allowing you to draw in breaths of musty air like a " + (CodexManager.entryUnlocked("Raskvel") ? "Raskvel" : "tiny being") + " drowning in an ocean of cum. <i>“Are... you okay?”</i>");

	output("\n\nYou nod weakly with your [pc.cocks] finally going limp, wondering how much it’s going to cost to fix your shattered pelvis.");

	processTime(30+rand(5));
	pc.orgasm();

	pc.HP(-(pc.HPMax() * 0.8));
	if (pc.HP() < 1) pc.HP(1);
	soreDebuff(3);
	sweatyDebuff(1);

	IncrementFlag("FUCKED_FREEDOM_BEEF");
	IncrementFlag("FUCKED_FREEDOM_BEEF_SNUSNU");

	clearMenu();
	addButton(0, "Next", freedomBeefSexOutro, [beefType, true]);
}

public function freedomBeefLesboLicks(beefType:uint):void
{
	clearOutput();
	showFreedomBeef(beefType, true, false);

	output("You sashay up to Riley, brushing your hand through the mane of silky-soft cobalt fur around her waist. Your eyes, though, are fixed on the bison-babe’s overflowing rack. That massive mammaries are practically bursting out of her starry bikini top, somehow held in check by a single shimmering hardlight pin. Her cleavage jiggles and swells with every deep, lustful breath, inviting you to trace your fingers up and under the thin cloth of her top and over the broad, dark teats underneath. You know exactly what you want, now...");
	
	output("\n\nA little shiver wracks Riley’s upper body as your hands go to work. She bites her lip, moaning under her breath when your fingers pinch and squeeze at her stiffening peaks, only growing louder and more insistent as you draw towards the pin holding her clothing together. One good tug of your thumbs pops the pin right off, sending it flying... and letting her chest spill free into your hands.");
	
	output("\n\n<i>“Guess you did find something you like!”</i> Riley giggles drunkenly, letting your thumbs flick across her nipples. Her teats are saucer-sized at the very least: huge, broad brown peaks ringed with pebbles and culminating in inverted points that ever so slowly peer to let you lean in a flick your [pc.tongue] across them.");
	if (getPlanetName().toLowerCase() == "new texas") output(" <i>“Sorry, hun, I’m not </i>that<i> much of a cow! Not gonna get much outta there... ‘cept a big, horny girl ready to run you down and mount!”</i>");
	else output(" <i>“Oooh, that feels nice. Give ‘em a little suck for momma, huh? Like I need to get any hornier...”</i>");

	output("\n\nYou grin up at your lover and give one of her teats a long, deep suck. Riley’s");
	if (beefType == FREEDOM_BEEF_STATUESQUE || beefType == FREEDOM_BEEF_TONED) output(" strong");
	else output(" massive");
	output(" arms wrap around your shoulders, pulling you tight into her fluffy undercarriage and meaty chest, practically smothering you in quaking boobflesh. Digging your fingers into her silky mane, you nibble, kiss, and suckle your way from one tit to the other, enjoying Riley’s little gasps and moans of pleasure. She’s not idle for you, though; Riley’s hands move around your gear, slowly pulling it off piece by piece. Your [pc.weapon] and Codex tumble to the ground around you");
	if (!(pc.armor is EmptySlot)) output(", followed by your [pc.armor]");
	output(".");
	if (pc.hasCock()) output(" Your [pc.cocks] spring" + (pc.cocks.length == 1 ? "s" : "") +" to attention, thumping weightily - needily - against the bison-babe’s thigh.");

	output("\n\n<i>“That’s more like it!”</i> she smiles, reaching down to give your bare [pc.butt] a two-fisted squeeze. Suddenly her grip shifts, locking around your waist. You have just enough time to pop off her nipple and yelp in surprise before being hefted up into the air. The world spins around you, going topsy-turvy until blood is rushing to your head");
	if (pc.hairLength > 6) output(" and your hair is tumbling towards the new direction of gravity");
	output(". <b>You’re upside-down,</b> held pinned against the buffalo’s mighty chest with your" + (pc.hasLegs() ? " [pc.legs] splayed" : " [pc.lowerBody] positioned") + " in the air, flailing helplessly. Giggling, Riley tells you <i>“Don’t stop now, [pc.name]; I’m just trying to give as good as I get!”</i>");

	output("\n\nYou wobble from side to side, dazed by the sudden change of place, but with a little twist and turning you’re able to get ahold of one of Riley’s cannonball’s again.");
	if (pc.hasCock() && pc.biggestCockLength() > 18) output(" While you’re maneuvering it, Riley gives your [pc.cock] a gentle swat, flopping it down along your [pc.belly] and into the deep, hugging reservoir of her cleavage. She shakes her shoulders, rolling your throbbing meat between her jiggling tits until a squirt of hot pre dribbles down her belly, and you’re left moaning for her around a mouthful of teat.");
	output(" While you’re busy, you feel a wash of hot breath across your loins, followed by a shiver as a warm, wet tongue brushes across your thighs and groin, working inexorably towards your [pc.vagOrAss]. Your muscles clench reflexively when she draws near, but she just hums to herself and presses gently but firmly on. She puts in just enough pressure to make your [pc.vagOrAss] open for her; you shudder from head to");
	if (pc.tailType == 0) output(" toe");
	else output(" the tip of your tail");
	output(" as her long, strong muscle works its way into your hole.");

	output("\n\nThis isn’t exactly what you had in mind, but a little wooziness afterwards is a small price to pay for the slithering sensation of oral ecstasy creeping through your lower half. Riley’s got you held firmly in place either way, leaving you without much option other than to resume your work. Your [pc.lips] lock around one of the beefy babe’s teats and get back to suckling. Considering where her sex is, separated from you by several feet of meaty ‘taur booty, there’s not much more you can do to work for her pleasure than worship those udders like the fertility icons they are.");

	if (pc.hasCock())
	{
		output("\n\nBetween long licks, Riley rolls her shoulders side to side, making her cleavage wobble heavily around your [pc.cock]. Trapped between her jiggling tits and your");
		if (pc.biggestTitSize() > 2) output(" own [pc.chest]");
		else output(" body");
		output(", your prick gets rubbed down from crest to [pc.knot] in an endless ecstasy of soft sensation. The randy bison’s scent had you rock-hard before, but this... just a few fleeting minutes of Riley’s boobtastic attentions have you leaking like");
		if (!pc.hasPerk("'Nuki Nuts")) output(" a needy kui-tan");
		else output(" the kui-tan cum-machine you are");
		output("... which only adds lube to the equation, letting Riley jack you that much faster!");
	}

	output("\n\nDigging deep into your [pc.vagOrAss], the tip of the bison’s tongue presses hard against");
	if (pc.hasCock() && !pc.hasVagina()) output(" your prostate");
	else if (pc.hasVagina()) output(" your g-spot");
	else output(" your most tender place");
	output(", eliciting a sharp gasp around your mouthful of boobflesh. Your whole body goes rigid for a moment as pleasure flashes through you like a thousand tiny thunderbolts and leaves your heart hammering, blood running hot to the beat of Riley’s tongue teasing your most sensitive places. Your own hands lock around her prominent, darkened peaks, holding on for dear life in the face of fire spreading in your loins.");

	output("\n\nRiley’s full lips are pressed firmly to your hole now, driving her tongue in as deep as she can. A part of your mind, the small bit not subsumed by sensation, quips that it feels like you’re getting french-kissed almost, the way she lovingly works her mouth around your");
	if (pc.hasVagina()) output(" lower pair of lips - close enough, right?");
	else output(" [pc.asshole]. She doesn’t hesitate to dig into you with the same relish as a pussy, swirling her tongue around inside until your body seizes and trembles in equal measure from the alien, invading touch.");
	output(" Through her lips, though, you’re at least able to feel that you’re having an effect as well: her breath is coming hotter and heavier now; her breasts heave against your [pc.chest]");
	if (pc.hasCock()) output(" and squeeze your cock so wonderfully tight");
	output(", and her fingers dig into your waist and ass, holding you just that much tighter as you both feel the inevitable approaching.");

	output("\n\nWhen that so longed-for climax hits you, it hit <i>hard</i>, erupting into your senses like one of Riley’s fireworks.");
	if (pc.hasCock()) output(" Your [pc.cock] stiffens and erupts in one fluid surge of seed, spraying a musky coat of [pc.cumColor] straight between Riley’s tits and all over your [pc.face]! You splutter and laugh as the warm streaks of goo splatter all over the place. Meanwhile, y");
	else output(" Y");
	output("our [pc.vagOrAss] clenches hard around the buffalo-taur’s tongue - hard enough to trap her for a moment, trying to wring her tongue free... which only adds to your pleasure, feeling it squirming around inside like a miniature tentacle, licking and pressing everywhere at once.");

	output("\n\nWhen she finally frees herself from your gasp, Riley comes up for air with a gasp and a laugh. Her arms loosen around you, shifting at first to cradle you, then let you clamber down... though your [pc.legs] almost immediately give out from under you. You slump onto your [pc.butt], reclining against one of Riley’s thick legs. Your lover takes a deep breath and sits down with you, letting you lean your head back against the soft mane of her scruff and feel the weight of her pendulous breasts on your scalp.");

	output("\n\n<i>“Whew,”</i> she sighs, <i>“That was...");
	if (pc.isBiped()) output(" well, let’s just say you made the case for hookin’ up with folk other than ‘taurs, if you can handle a pair of tits like that! Hehe!");
	else output(" wow! You really know how to handle a pair of tits, don’tcha, [pc.name]?");
	output("”</i>");

	output("\n\nHigh praise, coming from a lady stacked like that...");

	processTime(20+rand(5));
	pc.orgasm();

	IncrementFlag("FUCKED_FREEDOM_BEEF");
	IncrementFlag("FUCKED_FREEDOM_BEEF_LESBOLICKS");

	clearMenu();
	addButton(0, "Next", freedomBeefSexOutro, [beefType, false]);
}

public function freedomBeefSexOutro(params:Array):void
{
	var beefType:uint = params[0];
	var cameInHer:Boolean = params[1];

	clearOutput();
	showFreedomBeef(beefType, false, true);

	//Pass time to just after midnight the next day. Display Riley's armored bust.
	var passTime:uint = ((23 - hours) * 60) + (59 - minutes); // this gets us to exactly 23:59
	passTime += 15 + rand(15);
	processTime(passTime);
	restHeal();

	output("You spend a few long, quiet minutes in the pleasant afterglow, letting your heartbeat slow from the race of passion and desire. The air is heavy with the smells of beer and sex, and the world is softly swimming back and forth before your eyes. Rather than dizzy, though, you just feel tired - completely drained after your");
	if (pc.balls > 0) output(" ball-emptying");
	output(" session with the bovine beauty beside you.");

	output("\n\nYou can’t remember falling asleep after that, but it’s a sweet transition to dark numbness, then to a feeling of utter contentment and pleasant warmth when your dreamless reverie fades back into wakefulness. Riley’s standing a short ways away beside the smouldering embers of the fire, pulling on her armor over that impossibly-strained bikini of hers. The breastplate is crested with an eagle motif, with wings spreading out to cover her from the shoulders down. Her disabled fireworks launchers are still on the ground");
	if (getPlanetName().toLowerCase() != "new texas") output(", but you see she’s strapped on some new ordinance: a holster riding low on one of her beefy flanks, filled with some kind of over-sized rifle.");
	else output(" where you left them, leaving even the armored buffalo looking naked without them.");

	output("\n\nShe’s just buckling the cooler onto her side when she sees your [pc.eyes] blinking open. <i>“Wakey wakey, [pc.name],”</i> she smiles, trotting over to offer you a hand up. You groggily let yourself be pulled to your [pc.feet], almost tipping over into Riley’s cleavage until she steadies you - ugh, your head! Your vision is still swimming a little, but a few moments are enough to regain your balance and look your newfound lover in the eye again.");

	output("\n\n<i>“Well, you certainly made it a Lib Day to remember!”</i> she grins,");
	if (pc.tallness > 96) output(" leaning in");
	else output(" reaching down");
	output(" to give you a quick kiss. <i>“I’ve gotta get back on the star-trail, but I hope we bump into each other again sometime. I could go for a repeat performance of last night any time...”</i>");

	output("\n\nGlad you left a lasting impression, you return Riley’s affectionate gesture and make for the pile of your own discarded kit. You too came out here for something more than just partying with a busty bison, after all. She gives you a parting wink - and a flash of that delightfully aromatic cunt of hers");
	if (cameInHer) output(", still packed with your seed");
	output(" - as she turns to go. <i>“Till next time, [pc.name]!”</i>");

	clearMenu();
	addButton(0, "Next", freedomBeefLeave);
}

public function freedomBeefLeave():void
{
	//Apply Home Cooking buff.
	eatHomeCooking(100);
	mainGameMenu();
}
