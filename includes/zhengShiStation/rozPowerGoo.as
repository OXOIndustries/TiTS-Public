import classes.Characters.Roz;
//Notes / Outline
//By Savin
//FEN NOTE: Wsan's scene has her being mildly telepathic. Soz the final fen ruling is that with her gem, she has weak telepathy with anyone she's in physical contact with.

//Rozenn is a glaotian mercenary - not a pirate, but rather hired on by the Space Stringers to provide additional security. <i>“Hired”</i> might be a strong word, since her main form of payment is sucking all the poor slave boys dry when they’re off duty in the mines. She uses a ramshackle, homemade suit of <i>“power armor”</i> - really a power lifter that’s been plated up for combat spec - and carries a coilgun with a backpack-mounted power generator.
//
//She has the appearance of a human female, about 5’10 and exceedingly curvey. Under her power armor, she wears what would be a skin-tight latex bodysuit for a solid species; she just literally pours herself into it to give her a more <i>“definite”</i> and consistent shape. The suit is usually zipped all the way up, but her tits really pop in it, stretching the material to contain them. Helps her wear her armor more effectively. Most of her body is an ashen faded blue, but her long, wild <i>“hair”</i> and cock-sucking lips are all coal black instead. Her eyes are slate-grey.
//
//Her boss fight is in two-stages: at first, she’s riding in her power armor and fights you; it’s very hard to deal physical damage to her. If you maximize her lust OR do enough damage to disable her power armor, Roz will eject from her armor and try and slobber all over your dick - this is gonna be a lust fight for sure. Like Celise, she’s immune to physical attacks, but hyper-vulnerable to lust.
//
//If the PC wins, they can hijack Roz’s power armor for their own, which disables her encounters. If not, she’ll come looking for revenge. If the PC is defeated, Roz will throw them out of the mines after a hard fuckin’.

//Encountering Roz
//Roz is added to the random encounter pool once the PC has encountered Maike, regardless of outcome.

public function showRoz(nude:Boolean = false):void
{
	showName("\nROZ");
	showBust("ROZ" + (nude ? "_NUDE":""));
}
public function showRozArmor(nude:Boolean = false):void
{
	showName("\nROZ");
	showBust("ROZ_ARMOR");
}

public function encounterRoz():Boolean 
{
	clearOutput();
	showRoz();
	showBust("ROZ_ARMOR");
	author("Savin");
	//First Encounter:
	if(flags["MET_ROZ"] == undefined)
	{
		output("As you make your way through the cavernous maze of the mines, you start hearing voices echoing from just ahead. You advance cautiously, poking your head around a corner to see a group of slaves - men, all of them, of various races in tattered work uniforms and big metal collars - huddled up together at the end of the passage.");
		output("\n\nAt first, you think they might be escaped slaves, maybe hiding from their masters... but as you draw closer, you realize that all of the men have their pants down around their ankles, hips jerking and bucking inwards to the center of their little group. Somebody’s in the middle of them, on her knees and gleefully sucking their dicks. You can just catch glimpses of ashen-blue skin and coal-black hair between the men’s legs.");
		output("\n\nBefore you can decide what to do about your discovery, a couple of the men grunt and thrust forward, cumming. The gangbang’s subject lets rip a throaty moan and sways drunkenly from side to side, enjoying all the cum splattering over her face and chest. And then one of the spent men staggers back, opening up a clear line of sight between you and the woman.");
		output("\n\nShe’s a galotian, no doubt about it - you’d recognize that slimy, glistening skin anywhere after Celise. This one, though, has poured herself into a dark bodysuit that’s proportioned out like a hyper-curvy MILF, her huge tits covered in jizz. She locks eyes with you and, with some effort, wipes the cum-drunk smile off her face and jumps to her feet.");
		output("\n\n<i>“Scram, boys!”</i> she shouts, shoving them away from her. <i>“You ain’t supposed to be here!”</i>");

		if(pc.isMischievous())
		{
			output("\n\n<i>“Uh, sorry, took a wrong turn!”</i> you answer, taking a few steps backwards.");
		}
		else output("\n\nUh-oh.");

		output("\n\nThe spunk-slathered goo-girl rises to her full height, licking up a fat wad of semen from the top of a boob. As she does so, the men she was previously fellating run for it into the mines, and a huge, black shadow stalks past them out of the tunnel. You draw your [pc.weapon] as the hulking figure of a power loader stomps into view, its skeletal frame plated over with ceramic and steel to turn it into a suit of ramshackle armor - and at its hip, you can see the two long prongs of a mass accelerator, hooked up to a generator riding on the suit’s back.");
		output("\n\nGrinning with excitement, the goo-girl jumps backwards at the suit. Its chest hisses open, just long enough for her to splatter into the pilot’s cradle before sealing back up and bringing its cannon to bear.");
		output("\n\n<i>“I’m Rozenn, the best mech jockey on this rock! I recognize every schlong, pussy, and butt that ought to be down in these mines");
		if(flags["MAIKE_SLAVES_RELEASED"] != undefined) output(", so that makes you the one that beat Maike, right?");
		else output(", and that don’t include you!");
		output(" Well, let’s see how you do against THIS!”</i>");
		output("\n\nThe thrum of the rail cannon charging echoes down the cavern. Looks like you’ve stumbled into another fight!");
	}
	//Repeat Encounter:
	else
	{
		output("As you meander through the labyrinthine mines, you begin to hear a thunders stomping of mechanical feet lumbering towards you. Your attention is drawn down a side passage, just in time to see the same lumbering black powered suit that the galotian Roz wears, stomping towards you with its rail cannon held at the hip.");
		output("\n\n<i>“You again!”</i> her mechanized voice booms. <i>“I thought I told you to stay, like, way the heck out of here! You must be dumber than a coreless galotian if you’re gonna keep coming back! Guess I’ll just have to treat ya like one and screw you silly after I whoop ya!”</i>");
		output("\n\nRoz laughs uproariously and hefts the rail cannon up. The thrumming sound of it charging up echoes down the cavern!");
	}
	IncrementFlag("MET_ROZ");
	clearMenu();
	addButton(0,"Next",startRozFight);
	return true;
}

public function startRozFight():void
{
	var rozFight:Roz = new Roz();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(rozFight);
	CombatManager.victoryScene(startPhase2);
	CombatManager.lossScene(loseToRozzyPoo);
	CombatManager.displayLocation("ARMOR GOO");
	CombatManager.beginCombat();
}

//PC Defeats the Armored Goo - PHASE TWO GO!
public function startPhase2():void
{
	var lustWin:Boolean = enemy.lust() >= enemy.lustMax();
	
	var tEnemy:Roz = new Roz();
	tEnemy.short = "Roz";
	tEnemy.a = "";
	tEnemy.capitalA = "";
	tEnemy.long = "Now that she’s ejected from her mech, Roz seems much less interested in bashing your skull and more in breaking your pelvis. She’s a tall, ultra-curvaceous blue goo-girl who’s literally poured herself into a tight latex bodysuit, straining around the weight of her bust and the broad mass of her hips. A burnished metal harness around her shoulders seems to keep her outfit in place, and is probably what’s keeping her in such a distinctly human shape.\n\nWhile she’s clearly shifted her focus to wiggling her hips and slavering after your crotch, Roz has managed to keep the presence of mind to draw a laser pistol out of her thigh holster.";
	tEnemy.customDodge = "The gooey girl shifts aside!";
	tEnemy.meleeWeapon = new GooeyPsuedopod();
	tEnemy.rangedWeapon = new NovaPistol();
	tEnemy.armor = new LatexBodysuit();
	tEnemy.physiqueRaw = 25;
	tEnemy.reflexesRaw = 35;
	tEnemy.aimRaw = 40;
	tEnemy.intelligenceRaw = 45;
	tEnemy.willpowerRaw = 45;
	tEnemy.libidoRaw = 100;
	tEnemy.HPMod = 220;
	tEnemy.shieldsRaw = 0;
	tEnemy.HPRaw = tEnemy.HPMax();
	tEnemy.energyRaw = 100;
	tEnemy.lustRaw = enemy.lustRaw;
	tEnemy.createPerk("Inhuman Desire",100,0,0,0);
	
	tEnemy.baseHPResistances.kinetic.damageValue = 50.0;
	tEnemy.baseHPResistances.electric.damageValue = 50.0;
	tEnemy.baseHPResistances.burning.damageValue = 50.0;
	tEnemy.baseHPResistances.freezing.damageValue = -100.0;
	tEnemy.baseHPResistances.corrosive.damageValue = 100.0;
	tEnemy.baseHPResistances.poison.damageValue = 50.0;
	tEnemy.baseHPResistances.psionic.damageValue = 0.0;
	tEnemy.baseHPResistances.drug.damageValue = 0.0;
	tEnemy.baseHPResistances.pheromone.damageValue = -25.0;
	tEnemy.baseHPResistances.tease.damageValue = -25.0;
	tEnemy.short = "Roz";

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(pcBeatsRozForGoodies);
	CombatManager.lossScene(loseToRozzyPoo);
	CombatManager.displayLocation("ROZ");
	showBust("ROZ");

	output("With a shudder, the armored suit slumps down to one knee and pops its top. Roz comes tumbling out, landing on hands and knees with a ");
	if(!lustWin) output("disoriented groan. <i>“My suit!”</i> she hisses accusingly, picking herself up and staring you down. <i>“Oh that... boy does that turn me on something fierce! You’re gonna pay for that... in cum!");
	else output("lusty moan, already groping at herself. <i>“Oh! Okay, to heck with the suit: I need you in me, on me, over me... right now, you hear!?");
	output("”</i>");

	output("\n\nRoz runs her hands up and down her sheer latex catsuit, letting her gooey body ever-so-slightly deform under her touch. When she gets to where a simulated nipple peeks out, her whole body jiggles with a shock of self-stimulated pleasure. <i>“That’s the stuff. C’mon and take me already... or better yet, hold still while I take <b>you</b>!”</i>");
	output("\n\nShe’s not gonna take no for an answer.");

	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}


//PC Wins Again!
public function pcBeatsRozForGoodies():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	output("<i>“Aw gosh,”</i> Roz drawls, slumping to her knees in front of you. <i>“Okay, okay, you can be on top! Just get down here and gimme that sweet cum of yours, will ya? I’m goin’ crazy thinkin’ about our fight... and now your body, too!”</i>");
	output("\n\nShe’s blatantly ");
	if(!pc.isCrotchExposed()) output("undressing");
	else output("lusting after");
	output(" you with her eyes, panting with every simulated breath... and each breath seems to add a little more mass to her immense chest, threatening to rip her suit open and squirt her all over you if she isn’t sated!");
	processTime(2);
	rozCombatVictoryMenu();
}
public function rozCombatVictoryMenu():void
{
	clearMenu();
	addButton(0,"Goofuck",rozGetsGoofukked,undefined,"Goofuck","Fuck the noisy googirl until she’s satisfied, or at the very least quiet.");
	addButton(1,"Wear Her",wearRozLikeAnEdgarSuit,undefined,"Wear Her","Wear Roz over your entire body, letting her get at every erogenous zone you have all at once.");
	if(pc.hasCock())
	{
		if(pc.balls > 0) addButton(2,"Internal Fuck",wsanWinsAgainstRoz,undefined,"Internal Fuck","Get the Galotian to suck you off from the inside.");
		else addDisabledButton(2,"Internal Fuck","Internal Fuck","You need balls for this to work properly.");
	}
	else addDisabledButton(2,"Internal Fuck","Internal Fuck","You need a penis for this to work properly.");

	if(pc.biggestCockLength() >= 40) addButton(3,"Hyper Fuck",hyperBodyCondomRozAnne,undefined,"Hyper Fuck","With a dick this big, only a goo could take you.");
	else addDisabledButton(3,"Hyper Fuck","Hyper Fuck","You need an enormous penis for this.");

	//Disabled for nau.
	if(pc.IQ() >= 50 || pc.isGoo()) addButton(5,"Steal Core",coreJack,undefined,"Steal Core","Roz might be obsessing over your body now, but she seems to have her shit together more than your average galotian. She’s gotta have a core under that suit... give it a tug.");
	else addDisabledButton(5,"Locked","Locked","You aren’t smart enough for this.");
	if(!pc.isTaur()) addButton(6,"Hijack Armor",hijackRozArmor,undefined,"Hijack Armor","Steal Roz’s ramshackle power armor for yourself. She will probably never recover from this sleight -- at least not for the rest of the planet rush.");
	else addDisabledButton(6,"Hijack Armor","Hijack Armor","You need to be a biped or otherwise have an amorphous lower body to operate this!");

	addButton(14,"Leave",leaveRozAfterWinning);
}

public function leaveRozAfterWinning():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	output("<i>“W-wha!?”</i> Roz howls as you turn to go. <i>“C-c’mon, now, that ain’t funny! You can’t just leave a galotian hungry like that; I burned off all that biomass fightin’ ya... and then you had the indecency to go and get me all kinds of turned on! Come onnnn, don’t make me beg.”</i>");
	output("\n\nYou wave and turn, heading off the way you were going before encountering her.");
	output("\n\n<i>“I can’t masturbate myself more biomass!”</i> Roz whines as you leave.\n\n");
	CombatManager.genericVictory();
}

//[Hijack Armor]
//Only available for bipedal PCs. Fuck you taurs/nagas you literally cannot possibly fit into this thing.
//TT: Steal Roz's ramshackle power armor for yourself. She will probably never recover from this sleight -- at least not for the rest of the planet rush.
public function hijackRozArmor():void
{
	clearOutput();
	showRoz(true);
	output("While Roz is busy begging for a fuck, your eyes turn to a more material prize: the suit of powered armor she was wearing. The front hatch is sitting open, almost like a siren’s call to your inner lust for a giant suit of armor. Sure, it might be a bit ramshackle, patched together from parts around an old powered lifter suit, but... hell, Roz proved it’s pretty damn effective. You’re half sure the only thing that actually made her get out of it was her own rampant lusts more than anything you actually did to it.");
	output("\n\n<i>“Hey, the tits and booty are over here!”</i> Roz drawls, wiggling her expansive assets at you. <i>“C’mon already, stop ogling the hardware and plow me!”</i>");
	output("\n\nYeah, fucking a jiggling goo-girl would be nice and all, but... <i>power armor</i>, man. You stow your [pc.weapon] and push past the grasping goo’s hands, sauntering up to the suit’s hatch. You run a hand appreciatively over the ultra-hardened outer shell, smooth as a cowgirl’s rump and harder than " + (pc.hasCock() ? "you are right now":"anything this side of truly military grade tech") + ". It’s not pretty, but it’s real functional.");
	output("\n\nRoz wiggles up behind you, a bit of worry on her slimy face. <i>“Hey, wait, don’t you go gettin’ any ideas now. I weren’t gonna steal your [pc.weapon] or the clothes off yer back, you keep your paws off my armor!”</i>");
	output("\n\nWell, she shouldn’t have attacked you if she didn’t want to risk her precious armor.");
	output("\n\n<i>“Aw come on. Please don’t. I worked so hard makin’ that - with my own two hands! Bought every part myself, I did. Took me years!”</i>");
	output("\n\nRoz gives you a pouty, almost pleading look, puffing up her black lips and making her eyes look all teary. <i>“Come on, don’t be a jerk about it...”</i>");
	output("\n\nShe seems sincere...");
	processTime(2);
	clearMenu();
	addButton(0,"Take It",takeRozArmor,undefined,"Take It","Fuck her and her pleas; take the armor, even if it means never seeing this goo-girl again.");
	addButton(1,"Leave It",leaveRozsArmor,undefined,"Leave It","Oh okay... Roz can keep her power armor.");
}

//[Leave It]
//Oh okay... Roz can keep her power armor.
public function leaveRozsArmor():void
{
	clearOutput();
	showRoz(true);
	output("<i>“Okay, okay,”</i> you say, taking a step back. <i>“Keep it.”</i>");
	output("\n\nRoz beams. <i>“Thanks, sugar. Now about that victory lap you’re gonna take with me...”</i>");
	//display Roz’s victory menu as normal.
	rozCombatVictoryMenu();
}

//[Take It]
//Fuck her and her pleas; take the armor, even if it means never seeing this goo-girl again.
public function takeRozArmor():void
{
	clearOutput();
	showRoz(true);
	output("You shove Roz off you and, while she’s busy peeling herself off the stone, you clamber up into the armor’s hatch and lock yourself in. There’s a pneumatic hiss as the armor seals up around you, and the padding inside tightens around your arms and [pc.legOrLegs]. A holographic HUD lights up, displaying ammunition and shielding status, atmospheric data, and a thousand other datapoints that swirl around your eyes.");
	output("\n\n<i>“Heeeyyy!”</i> Roz shouts, splatting a fist on the chest plate. <i>“Gimme that back ya jerk! Get out and... I dunno just get out!”</i>");
	output("\n\nThere’s a lot of incoherent angry shrieking after that, but it’s easy to ignore while you do a systems check and get accustomed to the controls. After a couple minutes, you’re pretty sure you’re ready to go - and to get this angry goo out of your way.");
	output("\n\n<i>“You ain’t gettin’ past me!”</i> Roz shrieks, moments before getting stepped on by her own power armor as you blithely trudge through her. An exceptionally irate smear on the ground shouts after you, <i>“Ow! Hey! You can’t just ignore me!!! I’ll find you someday, I swear it!”</i>");
	output("\n\nAnd she can pry this armor off you in twenty years or so when she’s saved up enough to buy a new suit. In the meantime, you have probes to collect.");
	enemy.inventory.push(new RozPowerArmor());
	processTime(1);
	flags["ROZ_ARMOR_STOLEN"] = 1;
	output("\n\n");
	CombatManager.genericVictory();
}

//[Core Jack]
//Only if PC has a goo core, or has an INT of 30+. Grants +1 Hardness.
//TT: Roz might be obsessing over your body now, but she seems to have her shit together more than your average galotian. She’s gotta have a core under that suit... give it a tug.
public function coreJack():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	output("You saunter up to the goo-girl and reach down. She gasps with surprise and delight, thrusting her chest out for you to play with, but your hands only play across her huge breasts long enough to dig your fingers into the stretchy material of her suit.");
	output("\n\nThe look on her face changes completely when you rip the front of her bodysuit open, letting her perfectly-sculpted tits spring free. Sure enough, you can see a pretty green gemstone floating inside her, expertly cut into the perfect facsimile of a cartoon heart. It’s almost too pretty for a pirate like her. You rub your hands and thrust into the cleavage between her tits, reaching deep into the galotian’s chest.");
	output("\n\n<i>“Ohh, that’s the stuff!”</i> Roz giggles, shaking her shoulders. <i>“Shouldn’t that be, like, your weiner or something tho? I appreciate a handy as much as the next amorphous mercenary but... hey!”</i>");
	output("\n\nYour fingers close around her heart-shaped gem, causing Roz’s eyes to shoot wide open. She grabs at your shoulders, trying to push you off, but in her state she’s easily overpowered.");
	output("\n\n<i>“Hey, that ain’t some stupid bobble! That, like, keeps <b>me</b> from bein’ all stupid!”</i> she protests, using what strength she has left to make it hard to move your hand inside her. <i>“Hands off!”</i>");
	output("\n\nNo, this is definitely gonna be a <i>very</i> hands-on experience. You go for a white-knuckle grip, pulling towards yourself against the raging tide of blue goo inside Rozenn’s chest. Though she’s struggling, it only takes a moment before she’s also moaning, rippling with pleasure - after all every part of her body, inside and out, is really just one big clit, and your arm might as well just be a big fat cock fucking her tits. The facsimile nipples on her rack grow stiffer, earning a tweak and pull from your free hand.");
	output("\n\nEventually you’re able to move her core almost to the surface of her chest, pushing it into one of her huge goo-boobs.Your wrist ends up inside one of her nipples, which only amplifies her pleasured moaning - and her struggling. Her tit expands the more you jack her core, swelling up with goo in a futile attempt to sandbag your extraction of her heart-shaped brain-stone. Best give her another distraction, say by stuffing your other hand into her opposite tit. Just like the first, her breast is easy to penetrate, spreading open and engulfing your arm to the elbow as easy as a pussy.");
	output("\n\n<i>“Oh come on!”</i> Roz whines, pawing at your arms. <i>“Just fuck me or something! You got no idea how expensive these things are...”</i>");
	output("\n\nYou’re sure she can suck enough dick to get a new one eventually. But for now...");
	output("\n\nYou pull hard, and with a wet <i>pop</i>, the heart gem comes out along with a spurt of blue goo. Roz wails with dismay, crossing her eyes a moment as the artificial intelligence the stone had been granting her drains away out her titties with her leaking juices.");
	output("\n\n<i>“Nooo,”</i> the merc pouts, putting her hands on her hips. You roll the sticky gem in your hand, letting her follow it with her eyes until you slip it into your pack. Roz stares dumbly at you for a moment before pawing at your [pc.leg]. <i>“Gimme that back... please? I’ll, like, do whatever you want ‘n stuff! Pretty please?”</i>");
	output("\n\nWhat do you say?");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Keep It",keepRozsGooCore,undefined,"Keep It","Keep Roz’s Picardine core. By the way she’s acting, Roz will probably leave to go find a new one if you steal it. You probably won’t see her again!");
	addButton(1,"Work 4 It",workForItRoz,undefined,"Work 4 It","Make Roz earn her core back - with oral, of course.");
}

//[Keep It]
//Keep Roz’s Picardine core. By the way she’s acting, Roz will probably leave to go find a new one if you steal it.
//This disabled all future encounters with the armor goo.
public function keepRozsGooCore():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	output("You pat the side of your pack and tell Roz to have fun with her half a brain. She whines and sloshes around her empty armor as you saunter off with your new treasure.");
	output("\n\n<i>“You suck!”</i> you hear called down the passage behind you.");
	pc.addHard(3);
	processTime(1);
	flags["ROZ_CORED_4_GUD"] = 1;
	enemy.inventory.push(new GooCore());
	CombatManager.genericVictory();
}

//[Work For It]
//Make Roz earn her core back - with oral, of course.
public function workForItRoz():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	}
	output("<i>“I’ll give this back to you,”</i> you promise the leaking blue goo... <i>“but you’ve got to earn it.”</i>");
	output("\n\n<i>“Umm,”</i> Roz blubbers, staring up at you. <i>“Should I like, suck your dick or something?”</i>");
	output("\n\n");
	if(!pc.hasCock()) output("<i>“Something like that.”</i>");
	else output("<i>“Yep.”</i>");
	output(" You grin and chuck your gear to the side, letting Roz take a good look at what you’ve got " + (pc.legCount > 1 ? "between your [pc.legs].":"over your [pc.leg]."));
	if(!pc.hasGenitals()) 
	{
		output("\n\nShe stares a moment, mystified. <i>“Uhhh, like, what do I do with that? Ohh, should I just kiss you where it’s <b>supposed</b> to be?”</i>");
		output("\n\nYou tell her to just do whatever comes naturally to her.");
	}
	else if(pc.hasVagina() && !pc.hasCock()) output("\n\nShe stares at your crotch for a long moment. <i>“Aww, just a puss? Guess I’ll just hafta make do!”</i>");
	else output("\n\nThe goo beams as you let your [pc.cock] bob in front of her nose. <i>“Aww yeah, finally time for some dick!”</i> she cheers, licking her lips.");
	output(" Driven by the promise of her gemstone’s return, Roz lunges at your crotch with gusto, licking all over your [pc.crotch]. Her tongue leaves a trail of sticky slime all along your thighs and lower belly, rubbing her whole face across your loins in a way that leaves every inch of [pc.skin] tingling with pleasure.");

	//PC has a dick vers.
	if(pc.hasCock())
	{
		output("\n\nAfter a moment of foreplay, Roz " + (pc.cockTotal() > 1 ? "selects one of your dicks and wraps her lips around its crown":"wraps her lips around the crown of your [pc.cock]") + ". You’re able to see through her translucent blue exterior as your dick begins to disappear between her plush black lips; your dick goes straight back, past where the back of a human’s throat would be an out the other side of Roz’s head, dripping slime onto her back. She eagerly slurps her head up and down your length, rippling her gooey insides along your shaft while her lips focus on your [pc.knot].");
		output("\n\n<i>“Ohh, I love cock so much,”</i> Roz says. Her lips are too busy sucking dick to speak, but her voice comes through clearly all the same. <i>“You’re gonna gimme a big, juicy reward, right? Not </i>just<i> my special core, right?”</i>");
		output("\n\nOh yeah, definitely.");

		output("\n\nThe blue goo cheers around her mouthful of dick and starts moving quicker, trying to bring you to a rapid orgasm. You try and slow her down, pushing back on her brow, but her head just deforms around your hand. Her whole body shifts up, wrapping her giant azure tits around your [pc.cock] with a wet slap. Being engulfed in Roz’s tits feels like getting a two-fisted handjob made entirely of lube, wringing your dick and stroking from [pc.knot] to [pc.cockHead]. You moan, clutching at the goo-girl’s flowing <i>“hair”</i> and rocking your [pc.hips] against her face.");
		output("\n\nFeeling all that squirming wet goo around your [pc.cock] quickly overwhelms your restraint - before long you’ve thrown care to the wind and start pounding Rozenn’s face, making her whole body quake with the impacts of dick-on-mouth. You’re treated to the sight of her huge boobs jiggling around your shaft and her eyes crossing with lust before you hilt yourself down her squeezing throat and empty your [pc.balls] inside her. Your [pc.cum] spreads in a [pc.cumColor] cloud in her chest, and you can see the goo-girl’s body ripple with satisfaction.");
		output("\n\n<i>“Mmm, so good...”</i> she moans, slurping on your dick. <i>“Way better than slave cum!”</i>");
		output("\n\nYeah, you bet it is. With a grunt, you extricate your [pc.cock] from Roz’s throat, leaving her face smeared with the lingering leak of seed. With a roguish grin, you flick the core stone onto Roz’s head, letting it sink into the cum-smeared outer layer of her body.");
		output("\n\n<i>“Thanksh,”</i> she giggles drunkenly, squirming around the stone. <i>“I’mma get you next time, tho!”</i>");
		output("\n\nSure she will.");
		enemy.loadInMouth(pc);
	}
	//PC Doesn’t Got a Dick vers.
	else
	{
		output("\n\nBefore long, Roz isn’t content to just rub her gooey body on your loins anymore; she makes a hungry noise and then she’s <i>inside</i> you, pushing tendrils of thick blue slime into your [pc.vagOrAss " + x + "]. Your hole tingles from entrance to depths, every inch of tender flesh assailed by writhing galotian goo. The shock of her sudden assault makes you double over, flailing for purchase as more and more of Roz squirms inside you. You eventually manage to grab hold of the cave wall, grimacing as the hot rock seethes between your fingers and goo lashing the inside of your [pc.vagOrAss " + x + "].");
		output("\n\n<i>“Ain’tcha ever had a goo in ya before?”</i> Roz teases from... somewhere. Her mouth - most of her head, really - has squeezed itself inside you, but her voice seems to come from her body rather than her lips now. <i>“Oh, I just wanna crawl up in here till ya look all pregnant and stuff... stuffed! Gonna wear you like a new suit of armor!”</i>");
		output("\n\nYou try to shout <i>“Wait!”</i> but your voice just comes out as a ragged gasp, drawn out as more and more of Roz forces its way inside you. Your [pc.belly] distends, stretching around the swelling mass of goo inside you. Commensurately, the azure pile of giddy goo-girl in front of you withers, funneling herself into your [pc.vagOrAss " + x + "] with all the exuberance of a hungry kid reaching in the cookie jar. Hell, she even <i>feels</i> like a giant fist exploring your " + (x >= 0 ? "womb":"bowels") + "... and it’s <i>good</i>.");
		
		//Virgin checks!
		if(x >= 0) pc.cuntChange(x, 1000);
		else pc.buttChange(1000);
		
		output("\n\nAn orgasm hits you like a brick, knocking you off your [pc.footOrFeet] with a howl of pleasure. You go sprawling back on the rocky floor of the cavern, " + (pc.legCount > 1 ? "[pc.legs] spreading":"[pc.leg] stretching") + " - which only makes it easier for the fuck-hungry blue goo to squirm the rest of the way up your [pc.vagOrAss " + x + "]. You put your hands around your goo-bloated belly, feeling the [pc.skin] rise and fall with Roz’s squirming. The last of her body disappears into you with a slurping sound, and your strained hole is finally able to close.");
		output("\n\nIt takes a moment to catch your breath and adjust to the massive weight pinning you to the ground. Roz squirms, sloshing herself around inside you with a giggle that reverberates through your belly. <i>“Oh, this is cozy!”</i> she titters. <i>“I could totally move right in!”</i>");
		output("\n\nFrom where you’re laying, it sure seems like she has already. With a groan, you sit yourself up and put your hands around your stretched-out gut, feeling your [pc.skin] push in and bounce back with any amount of pressure.");

		output("\n\n<i>“That tickles!”</i> Roz calls out, pushing back on your hand... and on someplace real sensitive near your entrance. Your muscles react on instinct, squeezing down hard, but you can’t stop the shocks of pleasure she’s causing with every motion. The thick tendrils of azure slime inside you home after every pleasure-center in your [pc.vagOrAss " + x + "], teasing you relentlessly. A few moments of that, and you’re the one moaning like a whore, unable to wrest control of your body back from the goo inside you. You’re powerless to expel her, doubly so as she starts to really focus on your pleasure. You’d expect nothing less than sexual supremacy from a galotian, and Roz isn’t one to disappoint: she rubs and presses and thrusts herself through your hole until your screams are echoing through the tunnels in a roaring chorus.");
		output("\n\nYour orgasm finally comes, forced out by the assault within you. Ros thrashes herself around like a whirlwind of sexy slime, hitting every tender spot in rapid succession. Since you lack a cock to spray your orgasm, Roz uses herself in its place, squirting out of your [pc.vagOrAss " + x + "] in thick wads until she’s mostly reformed in a puddle of quivering azure splooge " + (pc.legCount > 1 ? "between your trembling [pc.legs].":"beneath your trembling [pc.leg]."));
		output("\n\nBy the time your climax passes, Roz has reformed into a vaguely-humanoid shape and poured herself back into her bodysuit.");
		output("\n\n<i>“That was fun!”</i> she titters. <i>“Now gimme my core back!”</i>");
		output("\n\nWithout waiting for you to comply, Roz squirms over to where the stone had fallen by the wayside during your tryst and smears herself over it, absorbing it through a tear in her bodysuit. <i>“Whoo! Oh, that’s better. Feels like a cloud’s lifted off the ol’ thinker. Well, see ya around, stranger... we’ll call it a draw this time!”</i>");
		output("\n\nShe gives you a wink and jumps back into her power armor, stomping away while you try and pull yourself back together.");
		pc.orgasm();
	}
	processTime(20);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Wear Her]
//Wear Roz over your entire body, letting her get at every erogenous zone you have all at once.
//All PCs
public function wearRozLikeAnEdgarSuit():void
{
	clearOutput();
	showRoz(true);
	author("Savin");
	output("You kneel down over the defeated goo-girl and lift her chin up, grinning as a couple of your fingers sink into her azure “skin.” She glances up at you with lust-addled eyes, swimming with desire; her tits heave under her bodysuit, swelling and shrinking to simulating husky breath.");
	if(!pc.isNude()) output("\n\nOf course if you’re going to wear her, you’ll need to strip down. You toss your equipment aside.");
	output("\n\n<i>“I’m gonna give you what you want,”</i> you assure her, slipping your hand down to the zipper of her bodysuit. You pull it down, letting her mammoth tits spill out, then her broad hips, almost pulling the suit off of her.");
	output("\n\nAnd then you step into it, ");
	if(pc.isTaur()) output("backing your hind legs into the suit’s leg holes");
	else if(pc.isTaur()) output("shoving your tail into one of the suit’s legs");
	else output("shoving your [pc.legs] into the suit");
	output(" right through Roz’s goo. She squeals in delight, rippling around your [pc.skinFurScales] as you squish yourself inside both goo and bodysuit. You’re suited up to the neck before you know it, letting Roz and her bodysuit resize themselves to you. Azure slime lashes around every inch of your body, enveloping you and pulling up the zipper in the span of a heartbeat.");
	output("\n\n<i>“I got this bodysuit from Tamani Corp,”</i> Roz says from all around you, sloshing around under the latex. <i>“Increases tactile sensation by... well, by a bunch. If every part of my body’s normally a pussy, wearin’ this makes me one big, throbbin’ clitoris. Hope you’re ready for the ride of your life, stranger.”</i>");

	output("\n\nRoz doesn’t bother waiting for a response; her body starts squirming all around you, probing against your [pc.vagOrAss]");
	if(pc.hasVagina()) output(" and asshole");
	if(pc.hasCock()) output(", and wrapping herself around your [pc.cocks]");
	output(". She wasn’t kidding! Just Roz’s first teasing touches feel as intense as an orgasm, making your heart hammer in your chest. Your [pc.skin] tingles with pleasure, starting in your loins and spreading out to the tips of your fingers");
	if(pc.hasToes()) output(" and toes");
	output("... and Roz shows no intention of stopping to let you catch your breath! Goo builds up around your [pc.butt], plumping out the suit’s rump before all that built-up azure mass thrusts forward, plunging into your [pc.vagOrAss] with a pillar of slimey goo-cock.");
	if(pc.totalVaginas() >= 3) output(" The rest of your pussies are quickly filled by goo as well, swelling and retracting in a staccato rhythm of relentless fucking.");
	output(" Your stomach bulges with the sudden mass of goo flooding into you, left behind by the tendrils pounding your hole");
	if(pc.hasVagina()) output("s");
	output(".");

	if (pc.hasVagina()) pc.cuntChange(0, 400);
	else pc.buttChange(400);

	//PC has a cock:
	if(pc.hasCock()) 
	{
		output("\n\nWhile your [pc.vagOrAss] is being violated, Roz wraps a great deal of herself around your [pc.cocks], forming a massive bulge in the suit’s crotch that ripples with Roz’s chaotic movements. She doesn’t squeeze your dick or even stroke it, so much as she runs her body all along your length from [pc.knot] to [pc.cockHead], bathing it in warm lube that rubs every inch at once.");
		if(pc.totalCocks() > 1) 
		{
			output(" Your other cock" + (pc.totalCocks() > 2 ? "s recieve":" receives") + " the same treatment, engulfed in slippery galotian goo and masturbated with gleeful abandon.");
		}
	}
	//PC has a donut ass or highly loose asshole:
	if(pc.analPuffiness() >= 1 || pc.ass.looseness() >= 4)
	{
		output("\n\nRoz’s tendrils squirming inside your [pc.asshole] grow more dense with every moment, stretching your plush asshole as wide as it can go - and considering its your pucker she’s playing with, that’s a <i>hell</i> of a stretch. It feels like an entire arm’s width of goo is pounding into you, seeking out your anal-G-spot with relentless fervor.");
	}
	//PC has a tighter/non-donut butthole:
	else output("\n\nRoz’s slender tendrils squirm deeper into your [pc.asshole], exploring your clenching hole with relentless force. More and more goo shoots inside you, following the slender tentacle’s path and pooling in your bowels like a thick knot. She’s stretching you, slowly widening the width of her goo-dick, but slow enough as not to break you.");
	pc.buttChange(400);
	output("\n\nEven when she’s working inside you, whatever techno-magic woven into Roz’s bodysuit stimulates you inside and out. Her every motion feels like you’re being assailed by fifty massive dicks, assaulting your every orifice");
	if(pc.hasCock()) output(" while a legion of sluts worship your dick" + (pc.cockTotal() > 1 ? "s":"") + ". Your breath quickly becomes haggard and strained, struggling to keep up with the pleasure pounding through your body. Keeping your mind focused on anything else is becoming harder... almost impossible. The rising threat of orgasm commands all of your attention, demanding that you focus on your [pc.vagOrAss]" + (pc.hasCock() ? " and [pc.cocks]":"") + ". You have little choice but to obey, running you hands up and down your body between Roz’s sensuous assaults. Every tweak of your [pc.nipples] and grope of your [pc.butt] is an orgasm in its own right, turning your [pc.legOrLegs] to jelly");
	output(".");
	output("\n\nYour body gives in, but you don’t fall; Roz stiffens all around you, acting like an extra layer of muscle to keep you on your [pc.footOrFeet]. Even if you wanted to move, you’re the one being worn now! Roz tightens her grip around your [pc.legOrLegs] and arms, holding you still as a statue while she fucks you. There’s no way you can even try to struggle with the suit’s sensory receptors so thoroughly overloaded" + (flags["TERENSHA_SUIT_TALKED"] != undefined ? " - how the hell does Terensha even function with one of these on!?":"") + "!");
	output("\n\nRoz’s thrusting builds up to a feverish pace, hammering your hole");
	if(pc.hasVagina()) output("s");
	if(pc.hasCock()) output(" and jacking you off");
	output(" harder than you can possibly withstand. You’re not sure if you’ve actually <i>cum</i> from this, even; it’s just a constant barrage of orgasmic <i>pleasure</i>, like one hour-long session of edging that won’t quite give you that sweet release at the end. You’re almost to the point of begging when Roz finally ups her game, shoving almost the entirety of her gooey body into you at once. Your [pc.belly] swells");
	if(pc.balls > 0) output(", and your [pc.balls] follow" + (pc.balls == 1 ? "s":"") + " suit as she flows into your cock");
	if(!pc.hasGenitals()) output(", letting Roz stuff has much of herself in you as she wants while she feasts");
	else output(", feeding the hungry galotian all the sweet, sweet protein she could ever want");
	output(".");

	output("\n\nWhen she’s finally done with you, Roz pulls out all at once, triggering another powerful orgasm that leaves your [pc.knees] buckling. This time, Roz relaxes her gooey body, allow you to slowly crumple to the floor on a bed of softly-rippling slime.");

	output("\n\n<i>“Oh, you’re tasty!”</i> she giggles. <i>“Wouldn’t mind wearin’ <b>you</b> next time... really get the whole made-of-meat experience. Thanks for the snack, anyway. Guess I’ll let ya go this time. But don’t count on missus nice Rozenn next time!”</i>");

	output("\n\nThe goo-girl slithers off you, leaving you covered head to toe in a shiny sheen of slime. She carefully pulls the bodysuit off of you, careful to only tease your [pc.nipples] and [pc.butt] enough for you to cum just the once into the latex before she pulls you free and pours herself back inside. She gives you a parting wave before jumping back into her armor and stomping off down on the nearby passages, leaving you to peel yourself up off the hot stone floor and find your discarded gear.");

	processTime(30);
	pc.orgasm();
	pc.shower();

	output("\n\n");
	CombatManager.genericVictory();
}

//Hyper BodyCondom Massage
public function hyperBodyCondomRozAnne():void
{
	clearOutput();
	showRoz(true);
	author("Fenoxo");
	var x:int = pc.biggestCockIndex();
	if(!pc.isCrotchExposed())
	{
		output("You reach down and fiddle with your crotch. A moment later, your [pc.cocks] spring" + (pc.cockTotal() == 1 ? "s out,":" out, the largest") + " slapping heavily onto the floor. ");
		if(pc.isErect()) output("It is insurmountably hard. The pillar of pure phallic perfection throbs angrily, demanding the wide-eyed goo-girl finish what she started.");
		else output(" It isn’t even hard yet, and yet the pillar of phallic perfection has the wide-eyed goo-girl licking her lips, ready to finish what she started. The sight is enough to make you stiffen and swell, revealing just how much dick you’ve been packing.");
		output("\n\n<i>“H-how’d ya hide that thing?”</i>");
	}
	//Uncovered
	if(pc.isCrotchExposed()) 
	{
		output("\n\nYou reach down at pat at your " + (pc.isErect() ? "enormous, turgid dick, letting its weight flop the [pc.cockHead " + x + "] against the floor now that the fight is over.":"rapidly-hardening member, letting it flow down to the floor to start its erection-fueled crawl toward the reason for your ardor-inflamed state.") + " The goo-girl stares wide-eyed at the pillar of phallic perfection. It throbs demandingly. Licking her lips in eagerness, she looks ready to finish what she started.");
		output("\n\n<i>“H-how’d ya grow that thing?”</i>");
	}
	//Merge
	output("\n\nYou shrug and smile at how completely you’ve bested the amorous goo. The onslaught of colossal cock has shocked Roz to her very core. She wiggles in building excitement, massive chest jiggling wildly within the straining confines of her suit. As nice as it looks, there’s no way she can handle your personal mountain of meat while stuffed into such a confining garment.");
	output("\n\nYou gesture to the suit. <i>“Take it off.”</i>");
	output("\n\nRoz, eyes glued to your [pc.cockHead " + x + "], whips her head up. <i>“Huh?”</i>");
	output("\n\n<i>“Lose the suit.”</i> You tap on your dick. <i>“You’re going to need to stretch.”</i>");
	output("\n\nThe Roz’s chest reflexively swells larger at the prospect. <i>“I...”</i> She drops to her jiggling knees and shudders. <i>“I... yeah. Okay.”</i> She looks up at you, wide-eyed and panting. <i>“It’ll fill up every inch of me.”</i> Pulsations in her swollen bosom make her tits bounce and jiggle. <i>“I’m going to be able to touch and taste and feel... oh stars! I’ll get to play with every inch of that beast!”</i>");
	output("\n\nBlood thrums through your length at the thought, stretching you a full two inches closer to Roz. <i>“You do, but you better make it cum.”</i>");
	output("\n\nRoz smiles winningly, undulating back and forth. Shoulders flow out of her elongating neck, followed by arms. The suit’s feet and thighs deflate as fingers and the top of a petite bust emerge, swelling heavier and fatter by the second. The goo-girl grins winningly at your dick and wiggles like a trained belly-dancer. At first, her emerging breasts barely ripple, but soon they’re bouncing back and forth, audibly slapping together as they blossom into gravity defying dick-pleasers. There’s a trim waist hidden somewhere beneath them, merging into growing pile of wobbling biomass.");
	output("\n\nHer empty bodysuit sits abandoned on the floor below.");
	output("\n\n<i>“Don’t you worry about getting to cum,”</i> Roz coos, sliding closer. <i>“Worry about me breaking your beast for other women.”</i> She leads down and cups her fingers around your [pc.cockHead " + x + "], flowing over it adoringly. Sauna-like heat radiates out from her touch. You can only imagine just how long she’s soaked up mine’s ambient warmth, but the result is a sultry fire beyond the reckoning of most solid beings. Dribbles of pre wick into her with startling immediacy, your entire length flexing from the thin coating of her palms.");
	output("\n\n<i>“More,”</i> you growl, panting a little bit. <i>“Don’t tease me!”</i>");
	output("\n\nThe naked goo-girl slides further forward, forearms diffusing into a shining coat of blue that clings to every bit of your [pc.cockHead " + x + "] and a bit behind. <i>“I ain’t teasing ya hun, just...”</i> She whimpers a little in the back of her throat. <i>“Tryin’ to figure out how to proper please this beast. It ain’t everyday I get to milk the king of cum mountain.”</i>");

	output("\n\nDespite her doubts, she’s already doing a fantastic job. Her skin slides over your own like an upended bottle of lube, almost frictionless. However, this goo has a will and a mind of its own. It squeezes and contracts even as it swirls around, sometimes suckling at tender spots and other times pressing down on them like a soaked fingertip. You groan in bliss as more of her flows into your shaft.");
	output("\n\nRoz’s face loses a little definition when your [pc.cock " + x + "] bucks in her slimy grip. It reforms into a look of defiant concentration while her breasts shrink, wrapping your shaft in more of that heated, dick-pleasing goo. <i>“Ah!”</i> she gasps in response to a directly injected dribble of pre. <i>“So much!”</i> The lusty liquid woman thrusts her pornstar-grade tits onto your [pc.cockHead " + x + "], letting them flow into the gleaming goo-sheathe. Ripples of texture and pleasure fan deeper, worshipping your rigid veins in sequence, memorizing the layout of your increasingly hyper-engorged dick.");
	pc.cockChange();
	output("\n\nA cock like yours would break any normal woman in half, maybe even ruin a leithan for life. The best you can manage is sinking partway inside a woman, and that’s no way to live. Roz is already encasing more phallic flesh than " + (celiseIsFollower() ? "anyone this side of Celise":"anyone else ever could") + ". That’s why goo-girls like galotians are <i>perfect</i> for you. You struggle not to cum yet. For all your lust, you won’t give Roz the satisfaction of making you blow your load just yet!");
	output("\n\n<i>“Ah s-s-stars!”</i> the cock-devouring goo gasps. <i>“C-c-can’t keep talking. Gotta go all in.”</i> She looks at you for permission, looking almost waifish by this point. <i>“Gotta squeeze and rub...”</i> Currents of pleasure roll up and down the whole of your length <i>“...and suck and touch... and... and.... Please?”</i>");
	output("\n\n<i>“Yes!”</i> Your answering scream thunders out of you in a burst of wanton pleasure. You arch your back, cock lifting halfway off the floor before slapping down again, bucking from Roz’s increasingly overwhelming sensations.");
	output("\n\nThe syrupy sweetheart rides your impassioned motions like a pro, squeezing more of her body and her weight onto with every passing second. Tendrils of sublime warmth tickle around your [pc.knotOrSheath " + x + "]. The sense of encapsulation is suffocatingly erotic, so tight that it makes your " + (!pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? "[pc.cockHead " + x + "] swell obscenely":"animalistic tip swell and flare just as hard as if you were cumming") + ". You thrust again, fucking an imaginary, invisible pussy, lifting Roz clean off the ground. She flows deeper, sloshing back and forth on your cock with your motions.");
	output("\n\nA thick bubble of her more congealed slime remains at the tip. Inside, a twinkling, heart-shaped gem lounges, poised directly above your urethra, ready to bathe in cum. You wonder if it’s her core right up until ");
	if(pc.balls > 0) output("the slimy caresses find your [pc.balls] and " + (pc.balls > 1 ? "bathe them":"bathes it") + " in the sinfully slick slime.");
	else output("the slimy caresses slither back to " + (pc.hasVagina() ? "tease your [pc.clits]":"tease your taint") + " with sinfully slick slime.");
	output("\n\nRoz was right, you realize. This <i>is</i> going to break you for everything else. She’s tighter than any pussy, yet warmer and wetter than anything outside of the lewdest of simulations. Looking down, you watch the eddies of pleasure flowing over your [pc.cock " + x + "]’s features, swirling over your veins like thousands of tongues. She rhythmically tightens and relaxes when you pump your hips, her fluid weight shifting from front to back, drawing still more pre into the bubble at the front.");
	output("\n\nIt looks like your dick is made of solid blue goo, the head oversized and absolutely ripe for squeezing. Drooling a little, you continue to hump, cock bouncing and slapping, sliding on smooth-worn stones, further heightening the enveloping ecstasy. You’re tight all over: hard and clenching and trying so hard not to cum... but it feels so good. You screw your eyes closed to try and hold off, but that only heightens how strongly you can feel Roz’s attentions. A whine slips out of your throat as your [pc.hips] lunge forward. They tighten, squeezing harder.");
	output("\n\nA wave of superheated caresses slides down every part of your cock in sequence, tickling your [pc.knotOrSheath " + x + "]. You were already going to orgasm, but now... now you see stars. Your eyes roll back as you unload" + (pc.balls > 0 ? ", [pc.balls] clenching":"") + ", belly clenching, [pc.cock " + x + "] bobbing, and urethra ballooning.");
	var cum:Number = pc.cumQ();
	if(cum < 10000)
	{
		output(" [pc.Cum] spurts into the swirling cyan pocket at the tip of your dick, shrouding her gemstone core as you pump spurt after spurt into the goo.");
		output("\n\nAs you savor the climax, you realize that this is likely what she wanted all along, but it doesn’t matter. You won. She had to work for your cum! Never mind that you’re sinking to " + (pc.hasKnees() ? "your knees":"the ground") + ", spurting and moaning, incoherent with pleasure. Never mind the way ");
		if(cum < 25) output("she devours your meager offering with ease");
		else if(cum < 500) output("she devours your seed with happy-sounding gurgles");
		else output("she captures your seed with happy-sounding gurgles, creating an expanding pocket of [pc.cumColor]-tinged goo to hang from your kingly crown");
		output(". If only every foe you bested could satisfy you in such a manner!");
	}
	//Hyper - no new PG
	else
	{
		output("\n\n[pc.Cum] rockets out of you like water from a fire hydrant, and Roz is completely unprepared. The blast of luminous seed strikes her core straight-on and blasts it clear out of her membrane in a tidal wave of virile goo. Fortunately, galotians don’t need a core. The blue slut instinctively tightens, squeezing you harder, nearly blocking the flow of cum. Your body strains in response, every bit of effort going into hosing out a fresh torrent of spunk onto the wall, fueled by constricting ecstasy.");
		output("\n\nAs your [pc.cock " + x + "] floods the mines, the defeated galotian little more than a rhythmically squeezing cocksleeve, you take a moment to savor your victory. Not only did you make Roz work for the cum she craved so much, you gave her more than she could handle. Even now, when her tendrils reach for your urethra, they’re thrown off by your high-pressure ejaculations. Sinking into a puddle of your own orgasmic delight, you spurt... and spurt... and spurt.");
		output("\n\nRoz keeps squeezing the entire time, gurgling something agreeable-sounding, supporting your blissful climax for as long as possible. All great things come to an end, of course, and this one finishes with the feeling of your last, dribbling [pc.cumNoun] being wrung from your hypersensitive [pc.cockNounSimple " + x + "] by the slippery slime. You shudder and gasp in delight, at long last empty and satisfied.");
		output("\n\nNow... what were you doing again?");
	}
	//Merge
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hugeCockRozFunEpi,cum);
}

public function hugeCockRozFunEpi(cum:Number):void
{
	clearOutput();
	showRoz(true);
	author("Fenoxo");
	//Hypercum variant
	if(cum >= 10000)
	{
		output("Roz sloughs off and congeals into her more humanoid form once more. Her suit is nowhere to be seen. Neither is her core. She looks around woozily, turning back to you in confusion. <i>“Did you like... cum out my core or sumthin’?”</i>");
		output("\n\nYou nod. <i>“I think I did.”</i>");
		output("\n\n<i>“Oooooh, that makes a lot more sense.”</i> She pats your dick affectionately. <i>“You totes blew my mind with that cannon!”</i> She giggles at her inane entendre and sucks cum up through her base and into her tits, ballooning them [pc.cumColor] until they’re the size of fluid-filled beach balls. <i>“But I guess I got gigatits now! Yay.”</i> She looks around once more. <i>“Any idea where my core is?”</i>");
		output("\n\nYou’re admit that you aren’t sure, but you’re sure she’ll find it before long.");
		output("\n\nRoz brightens. <i>“Yeah, I guess I will! I’ll just have ta play in all this cum until it turns up, and I loooove cum sooo much.”</i> She waves to you. <i>“Seeya later, I guess! Bring me more cummies soon, okay?”</i>");
		output("\n\nYour [pc.cockBiggest] twinges at the suggestion.");
	}
	//Regular cum variant
	else
	{
		output("Roz sloughs off and congeals into her humanoid form once more. <i>“Whoah...”</i> She wobbles a little drunkenly and flows toward her suit. <i>“I’m gonna need a little bit of a break after all that.”</i> The latex skin slowly fills with the galotian’s oozing, liquid weight. <i>“I guess I’ll have to get you next time... you know that, right?”</i>");
		output("\n\nYou pat your dick, smiling when her eyes lock on it once more. <i>“I hope.”</i>");
		output("\n\nThe flabbergasted goo-girl flaps her jaw wordlessly. She flips you the bird after a few moments of thought - long enough to leave you feeling like you won the exchange.");
		//bimbos:
		if(pc.isBimbo()) output("\n\n<i>“Later, cuteness!”</i>");
	}
	processTime(5);
	output("\n\n");
	CombatManager.genericVictory();
}

//Wsan win scenes:
//[Internal Fuck]
//Only available to PCs with dick+balls
//tooltip: Get the Galotian to suck you off from the inside.
public function wsanWinsAgainstRoz():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("<i>“Yeah, you can get some cum, goo-girl,”</i> you say, leaning down to leer at her, <i>“right from the source. Get outta the suit.”</i>");
	output("\n\n<i>“Aw, fine,”</i> Roz says, pouting as she looks down at her body and runs her hands over her massive breasts. She shivers a little as they pass over her simulated nips, standing out like diamond studs in the latex. <i>“But I </i>like<i> my suit...”</i>");
	output("\n\n<i>“You can get back in it when you’re done,”</i> you promise");
	if(!pc.isCrotchExposed()) output(", taking off your [pc.lowerGarments]");
	output(". <i>“Along with a fat load of spunk to take with you from </i>this<i>,”</i> you say, [pc.biggestCock]");
	if(!pc.isTaur()) output(" in hand as it begins to harden");
	else output(" hardening beneath your stomach");
	output(". <i>“You want that, right?”</i>");

	output("\n\n<i>“Oh heck yeah! Gimme!”</i> Roz says, rearing up from her catsuit and sloshing forward to grab at your prick. She misses, evidently having taken more of a beating than she remembers, and falls to the ground with a comical wet slapping noise. <i>“Ow! Crap!”</i>");
	output("\n\n<i>“Well, you’re out of the suit already,”</i> you say, proffering your dick when she raises her head. <i>“Come on.”</i>");

	output("\n\n<i>“Fine,”</i> she grouses, raising herself up and wrapping her hand around your [pc.biggestCockHead]. <i>“");
	if(flags["ROZ_INTERNAL_FUCKED"] == undefined && flags["ROZ_INTERNAL_FUCKED_SUBMITTED"] == undefined) output(" Been ages since I did this...");
	else output(" I do love doing this with you so much, after all!");
	output("”</i>");

	output("\n\nWith her gooey thumb planted right on your cockslit, you suddenly feel a shift of weight at the tip of your dick. It fades and renews as she slips inside you in long, rolling waves of dull blue semi-liquid. Your cock swells outward with the ‘load’, almost like it’s swallowing her down into your [pc.balls]. You feel slightly light-headed as she enters your nuts, the pleasure buoying you above the clouds while she feeds more and more of herself into you.");
	output("\n\n<i>“Hooh, shit,”</i> you mutter to yourself, leaning against Roz’s abandoned power armor.");
	output("\n\n<i>“It’s good, right?”</i> you hear in your mind, and even through telepathy you can tell there’s a ring of smugness to her words. <i>“Aww yeah, this </i>is<i> good!”</i>");

	output("\n\nYour balls have swollen to");
	var ballDiameter:Number = pc.ballDiameter();
	if(ballDiameter < 5) output(" more than ten");
	else if(ballDiameter < 6) output(" close to eight");
	else if(ballDiameter < 8) output(" almost seven");
	else if(ballDiameter < 10) output(" about five");
	else if(ballDiameter < 15) output(" three or four");
	else output(" more than two");
	output(" times their original size with the galotian girl inside you, and the feeling when she stimulates you from the inside to make you cum is unlike anything you’ve ever experienced.");
	if(flags["TIMES_CELISE_IN_BALLS"] != undefined) output(" Not even Celise, your ship’s patron goo-girl, did this so roughly or suddenly.");
	output(" You feel the familiar tightening of orgasm as you grunt and thrust your [pc.hips] once or twice, but nothing happens save for several loud, gulping swallows resounding through the landscape of your mind.");

	output("\n\n<i>“Fuck, Roz,”</i> you moan.");
	output("\n\n<i>“Oh yeah, babe,”</i> she replies, sounding every bit as eager and hyperactive as she was when you first met her." + (pc.cumQ() < 10000 ? " <i>“Give me eeeeverything you got! Gotta make up for that lost biomass":"<i>“Holy stars, there’s so much! You cum like a geyser") + "!”</i>");
	output("\n\nGroaning and resting against the inoperative power armor, you let her suck down and swallow your jizz before it ever gets its chance to come out of your cock. The orgasms are intense, rolling through your body one after the other as Roz excitedly sloshes around in your giant balls, sucking you for all you’re worth. You’d swear they’re gaining <i>more</i> weight as she goes, the sound of her gleeful sucking and swallowing echoing in your head.");
	output("\n\nIt doesn’t take long for you to figure out they actually <i>are</i> - the more biomass she accumulates inside you, the more you’re being weighed down! Soon you won’t even be able to move, so heavy is the liquid load holding you in place!");
	output("\n\n<i>“Roz,”</i> you grunt in a strained voice, sweat breaking out on your forehead. <i>“Come out before someone shows up and we’re </i>both<i> fucked.”</i>");
	output("\n\n<i>“Aww! But I don’t wanna come out yet! You’re just too... way too good!”</i> she whines. <i>“All I ever get to taste are slaves, and this is like - like - a five course meal in comparison! Or stars, whatever! It’s </i>delicious<i>!”</i>");

	if(flags["ROZ_INTERNAL_FUCKED"] == undefined) output("\n\nFuck it, if she’s not gonna come out on her own you’ll have to force the issue");
	else output("\n\nNot this shit again! At least now you know how to deal with it");
	output(". Though given how hard she’s making you cum right now, that might prove to be quite difficult.");
	if(!pc.isTaur()) 
	{
		output(" Wrapping a hand around your");
		if(pc.cockTotal() > 1) output(" biggest");
		output(" dick, you begin to gently rub yourself from the base. God damn, that feels <i>gooood</i>. The heightened sensitivity from having Roz inside you is impossible to ignore, but you’ll have to overcome it if you want her out.");
	}
	//[JackHerOut] [Give up]
	processTime(24);
	pc.lust(100);
	clearMenu();
	addButton(0,"Jack Her Out",jackDatRozBitchOut,undefined,"Jack Her Out","Get her out of there.");
	//addDisabledButton(0,"Jack Her Out","Jack Her Out","You can’t reach!");
	addButton(1,"Give Up",giveUpToRozBallFilling,undefined,"Give Up","Sit back and just let Roz run rampant, draining you completely dry.");

}
//[JackHerOut]
//tooltip: Get her out of there.
public function jackDatRozBitchOut():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("Yeah, fuck this - you have places to be that aren’t... weighed down to the point of immobility by a barely-sentient amorphous goo. You begin vigorously " + (!pc.isTaur() ? "jacking yourself off":"smacking your erect cock against your underbelly") + ", ignoring the mind-wilting amount of pleasure emanating from your rod. Spurred on by both the urgency of getting her out and the mental assurance this is going to be the hardest you’ve cum in your life, it doesn’t take long.");
	output("\n\n<i>“Hey! Aww, he-”</i> Roz moans before being cut off as you" + (!pc.isTaur() ? " double over, [pc.legOrLegs] turning inwards while you sink to the ground, gasping":" grit your teeth and thrust your hips forward, rubbing yourself off while you try to stay standing") + ".");
	output("\n\nIt pays off. With a dull, muted groan that grows in volume you begin to cum, <i>hard</i>. Your [pc.biggestCock] starts to swell from the base, doubling in girth as the flow of seed and goo travels upwards before it finally begins to spout from the tip. The thigh-quaking, teeth-gritting pleasure is seemingly unending, blobs of goo spattering to the floor before being drenched in impossibly thick seed. Panting, you manage to expel the last of your enormous load and collapse, chest heaving.");

	output("\n\nThanks to the efforts of Roz riling you up and putting your spunk production in overdrive, the mine has suffered a little.");
	var cum:Number = pc.cumQ();
	if(cum < 10000) output(" Your jizz is everywhere, coating her power armor and the floor in front of you");
	else if(cum < 20000) output(" You’ve cum all over the walls and floor in your struggle for dominance, practically repainting the entire subsection and her power armor");
	else output(" You’ve cum enough that people are gonna be trudging through an ankle-deep river of gooey spunk for days to come. The walls are completely covered in it, and even the ceiling didn’t escape your stupendous orgasm. Roz’s power armor is covered in your essence, too");
	output(". You can see bits of goo amidst all of it, slipping into the pasted latex suit and filling it out.");

	output("\n\nYou feel completely, <i>utterly</i> drained after your colossal orgasm. A singular drop of [pc.cum] beads at your cocktip while you’re trying to catch your breath before being snatched away by a tentacle of goo.");

	output("\n\n<i>“Wash it good for you too, baby?”</i> Roz purrs, looking up at you as she reforms and winking. There’s a definite [pc.cumColor] shade to her gooey skin and she seems, if possible, even more voluptuous and suit-busting than before. <i>“Mmm. Gonna have to readjust dis so I don’t blow the dang suit out,”</i> she mutters, and as you watch her thighs, ass and hips suffuse themselves with more mass. By the time she’s done, she’s evened out her physique so she’s not so ridiculously top-heavy but every bit as curvaceous and attractive. The suit is strained so hard to contain her it’s seethrough in several areas.");

	output("\n\n<i>“There!”</i> Roz announces, looking at you with a triumphant smile. <i>“Now I’m gonna hop back in my power armor and pretend like we’re not best friends the next time we meet, ‘kay?”</i> She turns and inspects her power armor. <i>“Oh, this is gonna need a power wash,”</i> she mumbles before throwing herself into the cockpit with a wet slap, the heavy metal slamming shut with a dull impact behind her. You can hear her on the speaker as she begins walking away. <i>“But uh, seriously, come back soon and feed me again. You’re like, so much better than the slaves!”</i>");

	output("\n\nWell, that could have been worse. You feel sated in a way you’ve rarely, if ever, experienced before in your life. You might save up a massive load just to visit her next time.");
	IncrementFlag("ROZ_INTERNAL_FUCKED");
	processTime(30);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Give up]
//tooltip: Sit back and just let Roz run rampant, draining you completely dry.
public function giveUpToRozBallFilling():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	if(!pc.isTaur()) output("Your hand sags, relaxes, and then stops completely before falling limp at your side");
	else output("Your body goes limp, your mind bending it to your will before you can get another shot at getting yourself off");
	output(". Fuck it... she feels so good inside you that you can’t even bring yourself to resist. You’d much rather just submit and let her have her way.");
	output("\n\n<i>“Fine then,”</i> you groan, letting your head bow. <i>“Do what you want, Roz.”</i>");
	output("\n\n<i>“Yay!”</i> she cheers in your head, excitement palpable. <i>“You’re my new best friend! I’m gonna suck up all this cum for </i>hours<i>, and then when I’m done you’ll be thanking me it felt so good!”</i>");
	output("\n\nGod fucking damn, she’s not even wrong. You throw your head back and moan as the newest orgasm rolls through your body, Roz giggling all the while.");
	output("\n\n<i>“It always tastes the best when they enjoy it, and you,”</i> Roz teases, <i>“I can tell how much you love this, babe. Don’t worry, there’s </i>so<i> much more where that came from...”</i>");
	output("\n\nYou relax into the rhythm, letting Roz take the reins and dictate when and how hard you cum. She’s an overly generous mistress, preferring to make you blow thick, heavy loads that have you groaning in insensate pleasure over depriving either of you. It’s a nice symbiotic relationship, one that makes you kind of wish this was a more permanent arrangement. Maybe if you keep coming down here...");
	output("\n\nYour train of thought is interrupted by yet another hard, ab-clenching orgasm that has you almost passed out on your [pc.feet]. Then the next one hits, and the next, and the next - and suddenly your eyelids are fluttering closed, your head drooping and your chin hitting your chest. The last thing you hear before your vision goes black is Roz having the time of her life inside you, massaging your balls and delighting in their production. Your dreams are a hazy pink and filled with an unearthly giggling and sucking noise.");
	IncrementFlag("ROZ_INTERNAL_FUCKED_SUBMITTED");
	processTime(24);
	for(var x:int = 0; x < 10; x++) {pc.orgasm();}
	clearMenu();
	addButton(0,"Next",giveUpToRozBallFilling2);
}

public function giveUpToRozBallFilling2():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	//First 3 times:
	if(flags["ROZ_INTERNAL_FUCKED_SUBMITTED"] <= 3) 
	{
		output("Roz wriggles free and reforms herself after several hours of sucking you dry, her gooey skin having turned [pc.cumColor] during her efforts. She turns, looks back at you, and whistles under her breath.");
		output("\n\n<i>“Errr... Dang, I feel a little bad,”</i> Roz mutters. <i>“Guess I’ll throw you outside a little more gently than usual.”</i>");
		output("\n\nSuited up in her power armor, Roz effortlessly tosses you over her shoulder. You’re delivered by hand and claw to a somewhat confused Urbolg, who directs the galotian to your ship.");
		output("\n\n<i>“Nice digs!”</i> she chirps, looking around inside. <i>“Lemme just putcha down here...”</i>");
		output("\n\nServos whirring, she deposits your half-conscious form into the cargo hold. She stays crouched in front of you, the speaker crackling as she starts to speak.");
		output("\n\n<i>“Y’know, a girl could get used to that kind of treatment. If you keep showing up like that, welllll...”</i> Roz says, the power armor doing its best approximation of a noncommittal shrug. <i>“I might just keep ya. Geddit?”</i>");
		output("\n\nShe stands, turning away and stomping back out of the hold. <i>“See ya later!”</i>");
		output("\n\nYou raise your woozy head off the ground about half an hour later, groaning. Your entire body has a dull ache running through it, though you at least have the memory of being drained to keep you company as solace.");
		pc.boostCum(4);
		currentLocation = "SHIP INTERIOR";
		generateMap();
		processTime(60);
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		output("Roz sighs in happiness as she emerges, her gooey skin all shiny and new thanks to your rejuvenating cum. She turns her head to check up on you as she struggles back into her suit, the added biomass suffusing her lower body to balance it out with her gigantic rack. She has proportions only a galotian could, that’s for sure.");
		output("\n\n<i>“Well,”</i> she says, her back to the open power armor. <i>“The way you’ve been coming down here to see me, I think we’re gonna be </i>great<i> friends! Don’t worry, I’ll keep ya safe.”</i>");
		output("\n\nRoz steps backwards and settles in, the suit thudding closed. The only thing you’re really conscious of is that the direction she’s walking is definitely not the way back to your ship.");
		processTime(60);
		clearMenu();
		addButton(0,"Next",giveUpToRozBallFilling3);
	}
}

public function giveUpToRozBallFilling3():void
{
	clearOutput();
	showRoz(true);
	showName("UH\nOH!");
	author("Wsan");
	output("You wake up in restraints, and the first thing you see is Roz’s bright and cheerful face springing into view.");
	output("\n\n<i>“Hey babe!”</i> she says, smiling. <i>“Glad you’re up! Guess the sedatives were a little strong - you’ve been out for days!”</i>");
	output("\n\nDays? What the hell is going on?! You attempt to wrest free of your bindings but find that you’re almost completely tied down, arresting any impulse of escape. Even your head can barely manage movement, and you use it to cast your eyes downwards. What you see makes your head spin. Your");
	if(pc.isTaur())
	{
		if(pc.biggestCockLength() < 36) output(" cock now protrudes from between your front legs, spunk leaking from the tip.");
		else output(" already-massive cock is even bigger than it used to be, protruding from between your front legs and leaking jizz.");
	}
	else output(" balls are swollen bigger than Roz’s tits, visibly pumping and quaking underneath your half-hard cock.");
	output("\n\n<i>“You like it?”</i> she teases, running her hand over your prick. It stiffens at her touch, setting her giggling gently. <i>“You’re such a </i>stud<i>. Here, how about I jack you off a bit to calm you down?”</i>");
	output("\n\nFuck-! The moment she wraps her hand around your length, you jerk forward - or would, if not for the restraints. It feels so good! You try to scream in pleasure but all that comes from your mouth is a dull, muffled moan. That’s when you figure out you’re gagged too.");
	output("\n\n<i>“Sensitive, right?”</i> she whispers, brushing up against you. <i>“Honestly, you’re gonna be a liiittle bit of a quickshot from now on. Like, you’re gonna cum whenever I want you to, and you’re gonna cum really hard. Don’t worry,”</i> she adds, winking while she jacks you harder. <i>“It’ll all be done with mods, so you won’t even need to think. One sec, I’m really thirsty at the moment-”</i>");
	output("\n\nShe ducks down right as you cum <i>explosively</i>, your hips straining so hard you feel your joints grind against each other.");
	output("\n\n<i>“Ugh! Nnnrrrgh! Hrrrgh! Uhhhhh!”</i> you scream into the cloth in your mouth, eyes wide and pupils dilated in ecstasy. You buck and buck and buck as you cum as hard as you can, your heart threatening to leap out of your chest.");
	output("\n\n<i>“Mmmf, stars, gimme all that </i>delicious<i> thick spunk of yours, " + pc.mf("big boy","cow slut") + "!”</i> Roz moans, each suck of her lips and ensuing swallow setting off fireworks in your head. <i>“Soooo goooood...”</i>");

	output("\n\nUpon Roz popping her lips off your cock with a wet smack, giggle, and a little kiss on your slit, you’re bowed and broken. It’s been several minutes since you started orgasming. There’s no way you can put up a resistance to that - even once was enough to drive you to the edge of sanity. You’re completely at her whim now, and from what your frazzled mind can recollect about what she’s told you, she’s hardly even started.");
	output("\n\n<i>“Aw dag, dash amazing,”</i> Roz slurs, standing back up a little dizzily and swishing her tongue around her mouth. <i>“Nice and fresh, too...”</i>");
	output("\n\nShe gives a long, satisfied sigh and rubs her tummy, appreciably bigger than it was before she started. <i>“Figured I’d let ya see what kind of effect ya have on me before I offload all this biomass to my titties,”</i> she says, winking at you. Sure enough, as she speaks, her gooey skin ripples and shifts. The newly acquired biomass slides up to her oversized breasts, taxing her suit to the absolute limit before the rest of it goes to her hips and butt. <i>“Yikes. Almost busted outta the suit again!”</i>");
	output("\n\nShe bounces around the room for a little while in front of your defeated form, flitting from place to place while she hums happily. Only a few minutes have passed before her hand’s under your chin and lifting you up slightly to look at her.");
	output("\n\n<i>“Okay, stud! I’m gonna put you under for a while,”</i> she tells you. <i>“You’re gonna be really different when you wake up, so don’t be too surprised, ya hear?”</i> she says, lightly knocking her knuckles against your forehead. <i>“Don’t want you all unsettled n stuff when you’re awake again. Okay, that’s all. Night night, stud!”</i>");
	processTime(60*48);
	pc.orgasm();
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",giveUpToRozBallFilling4);
}
public function giveUpToRozBallFilling4():void
{
	clearOutput();
	showRoz(true);
	showName("\nMASTER");
	author("Wsan");
	output("When you reawaken, the world is very different. A simpler place. Rigid. There are rules to follow. You have a master now. You don’t know her name. Doesn’t matter. You’re there to keep her safe and keep her needs met. Your previous life is a fast-fading dream, burned to ashes by the collar and the drugs.");
	output("\n\nYou’re completely unrecognizable after what Roz has done to you.");
	if(!pc.isTaur()) output(" Forced to become a hulking centaur, then");
	else output(" Your bestial form is now truly massive,");
	output(" doped up with all kinds of virility-inducing and size-enhancing drugs supplied by bemused merchants until your attributes have to be supported with special armor. You’re practically a monster, and treated as such by everyone other than Roz.");
	output("\n\nShe keeps your monstrous horsecock stoppered and bound against your stomach, ensuring nothing escapes until she wants a taste. It’s long enough to protrude a few inches between your front legs and thick enough that even the most fortunately endowed leithan woman would turn you down. The size of your balls changes from day to day, though they’re never anything less than massive and positively churning with thick, hot cum. Your prostate is continually stimulated by a sub-dermal implant, ensuring you never run dry for your mistress.");
	output("\n\nMost of your days, you’re kept leashed in a containment room, having grown far too large to be housed in regular quarters. You’re practically a cow, just waiting for Roz to milk you. Thankfully, she does so enthusiastically - and often.");
	processTime(60*49);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",giveUpToRozBallFilling5);
}

public function giveUpToRozBallFilling5():void
{
	clearOutput();
	showRoz(true);
	showName("\nMASTER");
	author("Wsan");
	output("<i>“Hey stud!”</i> Master calls, waving. You turn your head automatically and regard her impassively, nodding in stoic silence.");
	output("\n\n<i>“Oh jeez, you’re backed up to hell and back!”</i> Master cries out, leaning to the side to look at your massive, swollen balls. They’re currently large enough that you would have to drag them behind you were you to ordered to move. <i>“How about I drain you all night long, [pc.girlBoy]?”</i>");
	output("\n\nAgain, you nod silently.");
	output("\n\n<i>“That’s what I thought!”</i> Master says cheerily, clapping a wet hand against your stomach. As tall as you are now, it’s almost the only part of your body she can reach without resizing herself. <i>“Alright babe, hold still.”</i>");
	output("\n\nFollowing her orders to the T, you’re so still you might as well be inanimate - if not for the way your cock is pulsing, throbbing as she deactivates the stopper. You grunt quietly as cum begins to surge forth, splattering onto the ground.");
	output("\n\n<i>“Oh, hell yeah,”</i> Master breathes, watching the unending deluge of creamy spunk slop to the floor. <i>“Ooohhhh stars above it’s so </i>thick<i>...”</i>");
	output("\n\nWithout another word she puts her face in front of your cockhole, opening her mouth and getting a gout of hot seed right down her throat. Pushing forward against the torrent, her skin turns a cloudy white as your cum discolors her from the inside out. Managing to get her lips securely planted around your slit like she’s about to start making out with it, she grabs your behemoth cock and holds herself in place. You fill her like a condom, the nonstop gush of seed flowing into her like a river as your enormous cumtanks slowly begin to shrink.");
	output("\n\nYou know from experience that Master fully means ‘all night’ when she says it. Even now she’s starting to slip inside you, seeking out your hyper-virile cum from the source. Having no need for words, you try to relax, aiding in your master’s passage. Having to stay awake and alert during the day, this is the only chance you ever get for rest. With Master safely contained inside, you let your guard wane and slowly drift to sleep while standing, feeding her a gargantuan amount of spunk even as your eyes close.");
	output("\n\nThough perhaps a tenuous bond, it’s the only one you have. You have nothing but unending faith for your master, and would die for her without a second thought - without her you’d be useless anyway, consigned here in the base until you were immobile and unable to be transported. It’s a symbiotic relationship, each of you depending on the other for survival and nourishment.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",giveUpToRozBallFilling6);
}

public function giveUpToRozBallFilling6():void
{
	clearOutput();
	author("Wsan");
	pc.short = "Treasure Hunter";
	showName("YEARS\nLATER");
	output("There have been whispers lately, rumors about a hostile presence in the Zheng Shi mine. The pirate base it used to host has long since broken up, having moved on to greener pastures in search of valuable ore and goods to sell. But still something lingers, they say. Some astral ghost of vengeance.");
	output("\n\nIt’s because of those rumors that you’re here today, landing in an empty docking bay. Well, almost empty - there’s a little dogman in an apron working on something mechanical. Sauntering up to him, you exchange idle chatter and learn the direction of the mine. He cautions you against it, hanging onto your arm, but you pay him no heed and shake him off. It’s why you came here, after all.");
	output("\n\nThe power armor you end up fighting isn’t really much of a threat at all, as it turns out. You’d half-expected this to be the case, that rumor would have made a mountain out of a molehill. Still, at least you’ll be able to sell the armor - these are worth quite a bit to a pirate lord, what with the protection. You have it inoperable in a few minutes of fighting, the pilot struggling to stay upright. The suit topples to the side, servos hissing and failing. It slams to the ground with a heavy thud that resounds down the corridor and you lower your gun. That’s when you hear a female voice.");
	output("\n\n<i>“Aw, heck! Fido! Get ‘em!”</i>");
	output("\n\nSomething stirs at the end of the corridor.");
	output("\n\nWith the mine long since darkened by lack of power to keep the lights going, you can’t even see what it is. Your night-vision visor doesn’t penetrate the inky blackness that far back, but you can see something moving... and moving fast. The mine begins to shake around you, dust rising from the ground and rocks falling from the ceiling as it looms closer. You raise your gun, but it’s already on top of you.");
	output("\n\nThe last thing you see is a roaring runaway train, plated head to toe in ramshackle armor. You’re picked up and slammed against the wall of the mine, the life crushed from you in an instant.");
	output("\n\nBack in the docking bay, Urbolg sighs and repaints the sign.");
	output("\n\n<i>“Fekkin’ morons. Every time.”</i>");
	output("\n\nLeaning back, he regards his work. The sign states, in plain black lettering, ‘Do not enter. 105 casualties’.");
	badEnd();
}

//[Goofuck]
//tooltip: Fuck the noisy googirl until she’s satisfied, or at the very least quiet.
public function rozGetsGoofukked():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("<i>“Fine, fine,”</i> you sigh,");
	if(!pc.isCrotchExposed()) output(" pulling down your [pc.crotchCovers] and");
	output(" stepping closer as Roz watches intently, licking her pouty lips. <i>“Here.”</i>");

	if(pc.hasCock())
	{
		output("\n\n<i>“Hell yeah, finally!”</i> Roz says, excitement gleaming in her eyes. <i>“Fresh meat to suck");
		if(pc.balls > 1)
		{
			output(", and even some");
			if(pc.ballDiameter() < 4) output(" balls");
			else output(" big ol’ cumtanks to go with");
		}
		else if(pc.balls == 1)
		{
			output(", and even a");
			if(pc.ballDiameter() < 4) output(" ball");
			else output(" big ol’ cumtank to go with");
		}
		output(". Today ain’t so bad after all!”</i>");

		output("\n\nLeaning forward, she kisses your [pc.cockHeadBiggest] before sucking it into her warm, wet mouth. The gesture is far more erotic than intimate, Roz’s cum-desire showing itself in her actions. She wants what you’ve got to give, and she wants it <i>bad</i>.");
		output("\n\n<i>“Don’t hold back,”</i> Roz says, looking up at you with hooded, sultry eyes. <i>“You can go ahead and pound my face if it’ll make you cum harder!”</i>");
		output("\n\nYou don’t need to be told twice. Sinking a hand into the top of her head, you start pulling her towards you, her lips slapping against your groin.");
		output("\n\n<i>“Oooh, good [pc.girlBoy]!”</i> Roz squeals delightedly, her lips curling upward in a smile even as you violate them. <i>“I can’t </i>wait<i> for all that spunk!”</i>");
		output("\n\nThe wet slaps of lusty, desperate sex resound in the empty corridor, Roz encouraging you all the while with lewd, whispered invitations to use her body however you like. One of them, in particular, takes your fancy.");
		processTime(10);
		pc.lust(100);
		clearMenu();
		addButton(0,"Lips",inflateRozesLips,undefined,"Lips","Inflate Roz’s lips with your helpfully provided biomass.");
		addButton(1,"Boobs",inflateRozesBoobalages,undefined,"Boobs","Thrust into Roz’s chest and blow her tits up like balloons.");
		addButton(2,"Butt",inflateRozesBootayhole,undefined,"Butt","Give Roz that retro-celeb look by blowing your load in her ass.");
	}
	else
	{
		output("\n\n<i>“Aww, you");
		if(flags["ROZ_GOOFUKKED_WNO_DIK"] != undefined) output(" still");
		IncrementFlag("ROZ_GOOFUKKED_WNO_DIK");
		output(" don’t have something for me to suck,”</i> Roz laments, face drooping. <i>“Laaaaam-”</i>");
		output("\n\n<i>“Sshhh,”</i> you tell her, pulling her mouth towards your [pc.vagOrAss]. <i>“Less talk, more fuck.”</i>");
		output("\n\n<i>“Mmm...”</i> Roz sighs, lapping at your ");
		if(pc.hasVagina()) output("slit");
		else output("ring");
		output(" hesitantly. <i>“I guess you do taste pretty good.”</i>");
		output("\n\nShe doesn’t need her mouth to talk. Fucking telepaths. You inwardly heave a sigh - at least she’s pretty good at what she does. That tongue of hers is really, re-");
		output("\n\n<i>“Hey,”</i> you moan, squeezing Roz’s gooey hair.");
		output("\n\n<i>“Hehe! Bet you didn’t expect that, huh?”</i> Roz grins, reshaping her body. Her head has swapped places with an arm - more like a tentacle, by now - and her body is adjusting. The tongue scoping out your hole is actually a full-fledged limb, albeit thin for now. <i>“If ya ain’t got real cum, that means the fun’s up to me, right?”</i>");
		output("\n\nWell, it’s not a bad proposition - the way she’s working that long, slick tentacle inside you sure doesn’t feel too bad." + (pc.hasVagina() ? " She’s gently pressing it against your womb already, teasing you for all you’re worth":"She’s pushing it further and further inside you, testing your limits") + ". The moments roll by slowly as she pumps it in and out of you, intently watching you bite your bottom lip and moan.");
		if(pc.hasVagina()) pc.cuntChange(0,400);
		else pc.buttChange(400);
		output("\n\n<i>“Ooh, you gonna cum soon?”</i> Roz whispers conspiratorially, edging closer to your face. <i>“C’mon, do it.");
		if(pc.hasVagina()) output(" All this sexy juice I’m drinking from you needs a chaser.");
		else output(" I wanna see what it looks like.");

		output("\n\nShe starts thrusting faster and your [pc.hips] begin to buck uncontrollably,");
		if(pc.hasToes()) output(" standing up on your tiptoes");
		else output(" stretching your legs");
		output(" as you get closer and closer to impending orgasm until finally, you can’t take it. With a little gasping scream, you cum all over Roz’s tentacle. It throbs inside you in time with your shuddering contractions, eagerly wicking away any trace of fluid you have to offer it.");
		output("\n\n<i>“Oh, that’s pretty good,”</i> Roz moans, tweaking her own nipple with her other hand. <i>“Come on baby, let me milk all that out...”</i>");

		if(pc.canMilkSquirt()) 
		{
			output("\n\nWhether by coincidence or command, right then is when your [pc.breasts] let out a little squirt of milk as you shudder atop Roz’s tentacle-cock. Somehow, she can tell immediately - a galotian’s finely tuned senses seeking out a source of biomass, perhaps.");
			output("\n\n<i>“Ooooh, hello,”</i> Roz drawls with a grin, <i>“I hope mom’s got enough to share!”</i>");
			if(!pc.isChestExposed()) output("\n\nShe infiltrates your [pc.upperGarments] immediately, tendrils of goo winding throughout your clothes and tossing them to the ground. ");
			else output("\n\n");
			output("Your [pc.chest] exposed, Roz plants a hand on a nipple and smiles as her fingers sink into each other, forming little more than a gooey paw pad. You feel suction a moment later, moaning as she continues to gently fuck you from below and suck you from above.");
			output("\n\n<i>“Thaaat’s more like it,”</i> she whispers seductively, pressing up against you. <i>“Just relax and let me drain you dry.”</i>");
			output("\n\nYou have to admit, Roz might not have the greatest manners, but she really knows how to treat " + pc.mf("you","a lady") + " when it comes to orgasmic sex. She spends the next ten minutes gently sucking your breasts, goo softly squeezing your [pc.nipples] to draw your [pc.milk] out, all the while maintaining a steady pace with her tentacle stuffed up your " + (pc.hasVagina() ? "pussy":"asshole") + ". You cum twice more, and by the time she’s finished with you, letting go with a satisfied sigh, you feel like you’re lying on a bed of flowers.");
		}
		else
		{
			output("\n\nRoz doesn’t stop there, guiding you upwards again on the way towards another orgasm, forcing you to groan and shudder for what must be half a minute before you gasp and let it all go, relaxing and being supported by her conjured cock. You surreptitiously slip a few inches deeper as you do, being gently laid on the ground as you moan.");
		}
		output("\n\n<i>“Well,”</i> Roz says, running her tongue across her jet-black lips. <i>“That was pretty nice, actually! Even without a cock, I wouldn’t mind seeing more of ya. ‘Course, that don’t mean we’re friends! I’ll toss ya out the mine next time, you’ll see. Well... maybe <b>after</b> I suck you dry,”</i> she adds.");
		output("\n\nHopping into her power armor, she gives you a wave and leaves");
		if(!pc.isCrotchExposed()) output(" before you can even get your [pc.upperGarments] back on");
		output(". You stand, a little gingerly, and consider your options.");
		if(pc.canMilkSquirt()) pc.milked();
		processTime(30);
		//Lotsa milking~!
		if(pc.canMilkSquirt()) pc.milked();
		pc.orgasm();
		output("\n\n");
		CombatManager.genericVictory();
	}
}

//[Lips]
//tooltip: Inflate Roz’s lips with your helpfully provided biomass.
public function inflateRozesLips():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("<i>“Let’s blow those luscious lips of yours up a bit, Roz,”</i> you grunt, laying your other hand on the side of her head.");
	output("\n\n<i>“Aw yeah, you wanna see my lips get all big and fat, only good for wrapping around a big juicy slab of meat like yours?”</i> Roz teases, wiggling her considerable hips in anticipation. <i>“Feel ‘em wrapping around you an- oooh!”</i>");
	output("\n\nYou groan in pleasure as you thrust into her messy mouth, her slick orifice barely holding its shape under your frenzied assault. As wantonly submissive as Roz is, not a single bit of seed escapes the embrace of her lips. She makes <i>sure</i> of that, keeping you well and truly inside her to best facilitate swallowing your [pc.cum].");
	output("\n\nYou can hear her swallowing, gulping down your jizz with the eagerness only a species reliant on it for survival can possess. [pc.cumColor] clouds spread through her body, suffusing her skin’s shade of faded blue with color of your own. Even her lusty black lips take on a different sheen, growing larger with each passing second as she shoots you a sly smile.");
	if(pc.cumQ() >= 10000) output(" After some time, though, her smile fades to be replaced by a slutty, cum-drunk expression reminiscent of a vapid New Texan bimbo. She clearly wasn’t expecting the sheer volume you’re putting out.");
	output("\n\nWhen you’re done, Roz gives you a long, hard suck to complete the blowie and lets you go with an audible pop, smacking her lips.");
	output("\n\n<i>“Hehe - I look like a big ol’ bimbo, dun’ I?”</i> Roz giggles, standing up and running her fingers across her inflated mouth. <i>“Thanksh for all dat cuuum- oops!”</i>");
	output("\n\nYou watch in amusement as a surprised Roz tips forward, splatting her face against her own power armor.");
	output("\n\n<i>“Oww...”</i> she moans, rubbing her lips while she feels out for the controls. <i>“Okay, back to the drawing board on that one.”</i>");
	output("\n\nReallocating a bit of the mass elsewhere so she looks like less of a bimbo whore, she gets herself into the power armor and closes it up. The machine comes alive, whirring as it turns and begins to stomp away.");
	output("\n\n<i>“I’ll mess you up next time!”</i> Roz calls over the speaker.");
	output("\n\nUh huh.");
	enemy.loadInMouth(pc);
	processTime(20);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Boobs]
//tooltip: Thrust into Roz’s chest and blow her tits up like balloons.
public function inflateRozesBoobalages():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("In one swift movement you pull out of Roz’s lips with a wet pop, haul the surprised galotian upwards a little, and sink yourself to the hilt deep inside her chest, between her massive breasts. Groaning, you let yourself go and cum into her gooey form.");
	output("\n\n<i>“Oh, heck yeah,”</i> Roz moans deeply, looking up at you with half-closed eyes. <i>“I can feel all that hot, thick spunk spraying out inside me...”</i>");
	output("\n\nShe presses at her own quaking tits from the sides, enclosing your [pc.biggestCock] inside her rack as it begins to grow, using your seed as fuel. The more you cum, the jigglier and gigglier Roz gets.");
	if(pc.cumQ() < 5000) 
	{
		output("\n\n<i>“Aww yeah, lookit these fat tiddies,”</i> she says, bobbing up and down on your cock. <i>“Bet they feel reeeaaal good on your big, juicy ween, huh? Mmmm!”</i>");
		output("\n\nAll too soon, the ride is over as quickly as it began and Roz pulls back, a trail of spunk dripping down her chest until it’s wicked away by her skin. She gives you a grin and thrusts her chest out, her massive boobs sitting on it like beach balls. The rest of her body is appreciably thinner.");
	}
	else if(pc.cumQ() < 10000) 
	{
		output("\n\n<i>“Oooooh dag,”</i> Roz groans, squeezing her tits together as tight as she can. <i>“Ooh, I can </i>feel<i> how much that is!”</i>");
		output("\n\nWithout any apparent conscious effort from the lusty galotian gal, her breasts ripple and shake until they’re overflowing from her hands. She pants and moans as if she’s in heat, rubbing you up and down to coax out as much as she can. When you’re finally finished, she pulls away with a long, drawn-out sigh of happiness.");
		output("\n\n<i>“I ain’t had </i>that<i> much cum in aaages,”</i> Roz giggles, happily preening herself and running her hands over her big, jiggly tits. <i>“Dish is like, sho much fun!”</i>");
		output("\n\nYou watch her bounce her breasts up and down with all the joy of someone that’s gotten a new toy. She was already overly endowed, but now it looks like half her body mass is in her chest. Not that you’re complaining.");
	}
	else if(pc.cumQ() < 20000)
	{
		output("\n\n<i>“Oh, oh stars,”</i> Roz pants, holding her tits as your massive jets of spunk shoot inside her and clouding her skin. <i>“Hoooh stars that feels good- nnnnngh!”</i>");
		output("\n\nHer eyes cross and uncross while a dopey, vacant smile breaks out on her face as you cum more and more. All the while, her massive rack continues its unabated growth, spilling over her hands like a tidal wave of goo. They inflate with so much biomass you can feel them pressing against your [pc.legOrLegs], threatening to encapsulate your lower body if you don’t stop. Fortunately, you’re just about done by then. With a grunt, you pull out of the needy goo-girl and inspect your handiwork.");
		output("\n\n<i>“Uhhh, like, </i>wow<i>,”</i> Roz says, breaking out in a happy giggle. <i>“Dash like, really </i>really<i> good!");
		if(pc.isMischievous()) output("\n\n<i>“There’s more where that came from,”</i> you say, giving her a cocky smile. <i>“Just gotta wait ‘til next time, Roz.”</i>");
		else if(pc.isNice()) output("\n\n<i>“Glad you enjoyed, Roz,”</i> you say, wondering how she’s going to get out of her little ‘predicament’. <i>“Maybe we can do this next time if you love it so much.”</i>");
		else output("\n\n<i>“You can drink the rest next time, goo-girl,”</i> you tell her.");
		output("\n\n<i>“Uh uh!”</i> she insists, drunkenly shaking her head. <i>“I ain’t gon’ lose neksht time!”</i>");
		output("\n\nRight.");
	}
	else
	{
		output("\n\n<i>“U-uh,”</i> Roz suddenly says, eyes going wide. <i>“Hhhholy sh-”</i>");
		output("\n\nYou’re treated to the sight of her mouth hanging open slack-jawed as her eyes roll up into her head. Your [pc.cum] jets into her with massive blasts, her breasts rippling around you with every explosion of seed into her gooey form. Her oversized tits swell past her hands in seconds, and she lets them fall to her sides with a vacant expression. Then, as your orgasm continues, she lifts them again and tries to wrap them around your [pc.legs] to keep you in place. Some kind of instinctual behavior upon being provided with so much sustenance, maybe.");
		output("\n\nRoz stares up at you while her immense breasts swell and swell with added biomass, a dopey smile of contentment breaking out on her face. She looks like she’s queen of the world right now, nothing less than utterly thrilled for getting a shot at sucking up all your hot spunk. It’s a minute before she can even speak again.");

		output("\n\n<i>“Oh... man,”</i> she moans haltingly, half-closing her eyes and just savoring the last few blasts of thick seed into her body. <i>“Thatsh... you’re heckin’ amazing, darlin’. Jussh barely holdin’ mahself together.”</i>");
		output("\n\n<i>“Yeah, couldn’t have done it without you, Roz,”</i> you say, sighing with pleasure as you withdraw your [pc.cockBiggest] from her chest. It is <i>very</i> reluctant to let you go, gripping you all the way out. There’s an audible slurp of goo when you get free.");
		output("\n\n<i>“D’awww... are you gonna come back shoon?”</i> Roz drawls, watching you begin to leave. <i>“Hey... wade a second, I can’ move!”</i>");
		output("\n\nHer ginormous titties are bigger than the rest of her body at this point, her brain function too impeded by the rich, generous infusion of your jizz to have had the presence of mind to halt their uninhibited growth. You walk away from the encounter as forlorn wails reach your ears. She’ll probably be there for a couple of hours, weighed down by her breasts, but you’re sure the slaves will help her. Probably.");
		processTime(30);
		pc.orgasm();
		output("\n\n");
		//disable roz for a day?
		pc.createStatusEffect("DisabledRoz");
		pc.setStatusMinutes("DisabledRoz",60*24);
		CombatManager.genericVictory();
		return;
	}
	//merge all but 20k+
	output("\n\nIt takes Roz quite some effort to get to her dainty feet, her top-heaviness betraying her several times as she lurches from side to side with the added weight and cum drunkenness. Eventually, she has to give up and reallocate the mass more evenly. You observe her struggle and pout with some amusement, leaning back and waiting. In the end, she does manage to get up and lean against her power armor, panting a little. She hops back in and gives you a little wave before the suit slams shut with a dull thud.");
	output("\n\n<i>“The next time we see each other, we ain’t friends!”</i> Roz says through the speaker, then turns and begins to walk away with heavy impacts.");
	output("\n\nWell, suits you fine.\n\n");
	processTime(30);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[Butt]
//tooltip: Give Roz that retro-celeb look by blowing your load in her ass.
public function inflateRozesBootayhole():void
{
	clearOutput();
	showRoz(true);
	author("Wsan");
	output("<i>“Get up here,”</i> you grunt, pulling out and hauling a surprised Roz to her feet before sinking your entire [pc.cockBiggest] between her legs and cumming up into her.");
	pc.cockChange();
	output("\n\n<i>“Awww, gaaawd,”</i> she moans, looking at your face with adoration. You can feel her gooey legs squeezing your iron-hard length, rubbing her thick thighs against you. <i>“Thanks for the food, babe...”</i>");
	output("\n\nHer faded blue skin begins to take on a shade of [pc.cumColor], " + (pc.cumQ() < 5000 ? "ropes":"gouts") + " of your jizz being wicked away and sucked into her form while she runs her tongue across her coal-black lips.");
	output("\n\n<i>“Oooh, that’s good,”</i> Roz moans, shivering against you. You can feel her quaking in pleasure while she milks you, getting every drop of cum from your cock inside her. <i>“How ‘bout I put on a little </i>show<i> for ya, huh?”</i>");
	output("\n\nLooking down you notice the grinning galotian’s expansive rump and hips begin to widen, almost imperceptibly at first, but faster the more biomass she takes in. In only a few seconds she looks like she was built to breed with only the most well-endowed of brutes, jiggling her hips and drunkenly winking at you.");
	output("\n\n<i>“Like whatcha see, sugar?”</i> Roz drawls, pawing at your chest. <i>“Hehe! Break out the wine...”</i>");
	output("\n\nWhen you’re done you grunt as you pull yourself free, her thickened thighs hugging you close on your way out. Roz steps back and blows you a kiss before turning around, sashaying her hips with the wet sound of her skin slapping itself as her cheeks wobble. You watch with some amusement as she opens her power armor and, straining to fit, fails to get in. Her ass is just too fat. She gives the mechsuit a weak punch before giving up, reallocating her body mass in a more reasonable fashion - for her, anyway - and sitting inside.");
	output("\n\nShe turns and gives you a small wave, calling out to you over the speaker. <i>“Remember, we ain’t friends just ‘cuz of this! Throwin’ you outta the mine next time!”</i>");
	output("\n\nRight.\n\n");
	processTime(30);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//PC Loses!
public function loseToRozzyPoo():void
{
	//Roz in armor:
	if(enemy)
	{
		showRozArmor();
		output("Before you can realize just how much of a mistake you’ve made, Roz slams you against the far wall, pinning you against the hot stone with one hulking armored hand. <i>“Messed with the wrong base, didn’t ya?”</i> The goo laughs, her voice a mechanical growl through her powered suit’s helmet. <i>“Now you’re gonna pay, same way as any slave that steps outta line. I’m going to drain you dry!”</i>");
		output("\n\nThe suit hisses as its chest cavity opens, letting Roz slither out. The armor steps back on its own, leaving you sandwiched between the latex-clad goo and the unyielding stone.");
	}
	//Roz out of armor:
	else
	{
		showRoz(true);
		output("While you’re distracted by her huge, heaving tits and jiggling jelly-ass, Roz surges towards you with remarkable speed. Her gooey body distends and stretches, splattering over you in a wave of quivering azure slime. You stumble back, slamming against the stone wall and dropping your [pc.weapon].");
		output("\n\nYour foe kicks it away with a laugh. <i>“Oh, stop resisting! I can tell you want to give me what I want... and I’m darn desperate for it.”</i>");
	}
	//Combine
	output("\n\nRoz grins ferociously and rips into your equipment, tearing it aside so she can grab at your crotch.");

	//PC is Genderless
	if(!pc.hasGenitals()) 
	{
		output("\n\n<i>“Aww, what the heck,”</i> Roz huffs, patting your bare loins. <i>“What’s the meanin’ of this? How’s a girl supposed to suck you dry when you ain’t got nothin’ here?" + (silly ? " DISAPPOINTED!":"") + "”</i>");
		output("\n\nShe throws you to the ground and jumps back into her powered armor. <i>“Bah, what a waste of time. I’ve got to go find some slaves to gangbang me now. Don’t come back around here ‘less you got a dong, ya hear me!?”</i>");
		output("\n\nWith that, Roz battens down the armor’s hatch and stomps off.\n\n");
		CombatManager.genericLoss();
		return;
	}
	//route as appropriate.
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) wsanLossScene();
	else rozsCumReceptacleEnd();
}


//Wsan Loss Scene:
//PCs with dicks variant. Random chance? Follows on from the ‘//Combine’ blurb.
public function wsanLossScene():void
{
	author("Wsan");
	
	output("\n\n<i>“Oooh, </i>just<i> what I was looking for,”</i> Roz drawls, wrapping her gooey hand around your [pc.biggestCock].");
	if(pc.balls > 0)
	{
		if(pc.ballDiameter() >= 4) output(" <i>“Dang, lookit the size of these! You’d better be a big enough shot to satisfy me in one go, champ, ‘cuz I could milk these babies all day");
		else output(" <i>“You’d best have enough jizz in these balls of yours to satisfy me, punk!");
		output("”</i>");
	}
	else output(" <i>“I ain’t seein’ your balls, but I bet you can still pump out some hot cum for me, right?”</i>");
	var x:int = pc.biggestCockIndex();
	var cLength:Number = pc.biggestCockLength();
	output("\n\nWithout letting you get a word in, Roz grins as the permeability of her slick hand suddenly changes, your cock actually beginning to sink through her palm! It feels pretty great, though you" + (cLength >= 25 ? "r dick is too big to get the full benefit of her caress":" find yourself wishing you could fuck her instead") + ".");
	output("\n\n<i>“Hehe, I could get you off just like this,”</i> Roz teases, slowly pulling her arm back before pressing forward again. It’s like a galotian’s misinterpreted version of a handjob. <i>“But honestly, I’ve always preferred just blowing or riding. Feels like somethin’s missin’ otherwise, yaknow?”</i>");
	output("\n\n<i>“Plus,”</i> she murmurs, sliding herself down your " + (!pc.isTaur() ? "body":"underside") + " to the base of your dick, <i>“sometimes I like to savor it before I make ‘em pop.”</i>");
	output("\n\nThe next thing you feel is a warm, wet tongue licking the underside of your cock. You can’t help but groan at the slick feel of it, not to mention she’s still got her hand wrapped around your length jerking you slowly. Whenever a bead of precum appears at your [pc.cockHeadBiggest] her hand slowly massages you all the way up and rubs across your slit, wicking it away.");
	output("\n\n<i>“Awww, yeah,”</i> Roz coos, shivering in delight at the first taste of it. <i>“You’re like, so much higher quality than everyone else out here... gotta hold myself back!”</i>");
	output("\n\nShe’s no regular galotian, that’s for sure - she’s far smarter than the others you’ve encountered. That doesn’t mean her core instinct isn’t the same, though; you’re all too aware she’s going to milk you for everything you’ve got, just like the ones in the wild. You grunt as her licking continues up your shaft then back down,her tongue " + (pc.balls > 0 ? "slickening your [pc.balls]":"encircling your base") + ". She moans excitedly when she earns another dollop of pre, swishing it away with her hand again.");
	output("\n\nYou can tell this tenuous situation isn’t going to last, though. With every bit of juice she squeezes from you she gets just a little wilder, a little rougher, both her eyes and her smile widening. If she ever starts actually sucking you off, you have a feeling she’s going to be down there for a long time. Sure enough, she begins her ascent to the crown of your cock and gives you a grin before diving onto your cock and " + (cLength < 7 ? " swallowing it whole":" taking several inches between her lips") + ".");
	output("\n\nThe suction is incredible, her entire mouth and throat wrapping around you as she expertly massages your cock from all directions. Unbound by the limitations of other races, an intelligent galotian like Roz can manipulate her body however she wants with staggering effect. You groan loudly as you feel the insides of her throat squeeze you and gently rub you up and down, almost as if she were jacking you off with her mouth.");
	output("\n\n<i>“Impressive, right?”</i> you hear in your head, glancing down to see Roz looking up at you wearing what would like be a devious grin were her cock-sucking lips not distorted into an ‘O’ around your dick. <i>“Stars, this is gooood. My mouth is every bit as sensitive as my pussy, y’know. So when you let out this big, fat load I’m gonna milk outta ya, you get to make me cum too!”</i>");
	if(cLength <= 7) output("\n\nShe begins bobbing up and down on your cock, sloppy wet noises emanating from her throat as she spears herself on your length over and over, doing her best to drive you towards orgasm. You’re barely holding on, grunting and moaning while you weather the erotic assault, your cock throbbing in need" + (pc.hasKnot(x) ? " as your knot begins to hint at inflating":""));
	else if(cLength <= 15) output("\n\nRoz presses herself against your groin with every bob of her head, planting a sloppy kiss around the base of your impressive length before sucking you as hard as she can on the way back up. She even rubs your dick with her fingers on the outstroke, eliciting groans of pleasure from your lips as you draw ever closer to cumming");
	else if(cLength <= 24) output("\n\nRoz seems to be taking your length as a challenge, hollowing her cheeks as she forces herself all the way down to the base as you groan deeply. If you chance a look down you can see the faint outline of your impressive length penetrating her body, being massaged and sucked from all directions at once. The sensation is heavenly and you can already feel yourself getting closer and closer to cumming");
	else if(cLength <= 36) output("\n\nRoz frantically sucks and swallows your massive length down, getting closer and closer to the base of it until she finally plants a triumphant, sloppy kiss on your groin. You can see your absurdly large cock inside her, a dark shape her insides are twisting around and massaging. She even suckles on the sensitive tip, giggling in your mind. You’re already groaning and trying to buck your [pc.hips], right on the verge of orgasm");
	else output("\n\nRoz sucks you down with frenetic slurps and swallows, massaging your gigantic cock the entire way down. She halts " + (cLength <= 42 ? "just a few inches from your groin":"with what must be three feet of cock inside her") + " and giggles at the absurdity.\n\n<i>“Jeez, if I kept going down on you, you’d come out the other end of me... and you’ve already got me impaled, you big needy brute. Now hurry up and cum,”</i> Roz intones in your head.\n\nYou feel her tighten around your entire length, squeezing and rubbing you with her entire body as you grunt and strain in her grip. She’s even suckling at your cockhead attentively, feeding on the bountiful flow of slick precum");
	output(".");
	output("\n\n<i>“Fuck, I’m cumming,”</i> you pant, " + (pc.isTaur() ? "hindlegs flexing instinctively as you seek to buck your hips forward like nothing more than a rutting animal":"your entire sweat-coated body tensing up under Roz’s touch") + ". <i>“Nnnnn- nngh!”</i>");

	var draggedOut:Boolean = true;
	if(pc.cumQ() < 1000) 
	{
		output("\n\nYour cock shakes and flexes as you grunt and heave, blossoms of [pc.cumColor] appearing inside Roz’s body as discolored blotches. They only last a few seconds before they’re wicked away inside her, the hungry galotian absorbing your essence in search of sating her carnal hunger.");
		output("\n\n<i>“Mmmmn, that was some good spunk, [pc.boyGirl],”</i> she moans in your head, looking up at you with lidded eyes. <i>“But I’m not letting you go until you give me at least another five helpings of that.”</i>");
		output("\n\nYou groan as she begins the cycle anew, keeping you locked in place with pleasure as she slurps on your oversensitive cock. Your next orgasm comes quickly, massaged out of you by the galotian’s incredibly mouth to be greedily gulped down. She doesn’t stop there, though, getting more and more drunk on your cum until she’s excitedly sloshing about on top of you while sucking you off. It takes close to half an hour for her to milk out what she wanted from you, at last settling back and wiping her lips with the back of her hand.");
		output("\n\n<i>“Aaaaah, thash more like it,”</i> Roz giggles lazily, looking down at your face as she sways atop you. <i>“S’whut you get fer losin’. Now git outta my mine, chump.”</i>");
		output("\n\nWalking somewhat gingerly, you’re forcibly escorted out of the mine by Roz in her armored suit.");
		output("\n\n<i>“Feel free to come feed me again, ya loser!”</i> she calls out as she heads back inside. <i>“Just don’t pretend to fight next time, y’hear?”</i>");
	}
	else if(pc.cumQ() < 3000)
	{
		output("\n\nYou strain as Roz keeps your bucking hips securely planted on the floor, letting you blow your load inside her with a pleased coo in your head. You groan and writhe while she milks it out of you, her throat undulating up your cock over and over to expedite the arrival of your thick loads into her. It feels like you’re held down there for minutes being forced to cum for her, the galotian girl’s skin being discolored by your [pc.cum] as gouts of it bloom inside her. You’re panting and moaning by the time your orgasm ends, feeling like you must have given her everything you’ve got and then some. Roz, though, apparently doesn’t feel the same.");
		output("\n\n<i>“That was reeeal tasty,”</i> she moans in your head, still gently sucking you while she rubs. <i>“But it ain’t enough, [pc.boyGirl]. You’re not gettin’ outta here until you deliver at </i>least<i> twice that, punk.”</i>");
		output("\n\nShe’s not kidding, either. You gasp as she begins to wriggle herself around your cock, tantalizingly massaging your oversensitive length until you’re forced to cum again. She keeps you there, tormenting you with ever-increasing pleasure, until you hold up your end of the supposed bargain and feed her with more than a gallon of spunk to make up for what she lost in the fight.");
		pc.orgasm();
		//insert last 3 paras of <1k variant
		output("\n\n<i>“Aaaaah, thash more like it,”</i> Roz giggles lazily, looking down at your face as she sways atop you. <i>“S’whut you get fer losin’. Now git outta my mine, chump.”</i>");
		output("\n\nWalking somewhat gingerly, you’re forcibly escorted out of the mine by Roz in her armored suit.");
		output("\n\n<i>“Feel free to come feed me again, ya loser!”</i> she calls out as she heads back inside. <i>“Just don’t pretend to fight next time, y’hear?”</i>");
	}
	else if(pc.cumQ() < 8000)
	{
		output("\n\nYou can hear Roz cry out in surprised joy as your virile cock lets out a jet of [pc.cum] into her gooey body, then follows it up with what feels like a neverending stream of jizz while she desperately works herself up and down your length to accelerate the process. You’re dumping loads into her at what must be a record rate, the galotian girl’s ‘neck’ swelling over and over with every greedy gulp of seed. By the time you finish, she’s acquired a slowly-receding, discolored baby bump around her waist full of [pc.cumColor] jizz.");
		output("\n\n<i>“Hooo, </i>hell<i> yeaaaah,”</i> Roz moans, slowly pulling off your cock with a last affectionate, hard suck and hollow of her cheeks. You grunt in pleasure as she slips free of your oversensitive cock, letting you free of your torment. <i>“Thash the gosh darn good stuff... y’might be a loser, chump, but you gotta winning cum-hose and thash what counts to me. Now git outta my mine.”</i>");
		output("\n\nWalking somewhat gingerly, you’re forcibly escorted out of the mine by Roz in her armored suit.");
		output("\n\n<i>“Feel free to come feed me again, ya loser!”</i> she calls out as she heads back inside. <i>“Just don’t pretend to fight next time, y’hear?”</i>");
	}
	else if(pc.cumQ() < 15000)
	{
		output("\n\nRoz lets out a psychic scream of bliss as you explode inside her, your virility inspiring an orgasm from her immediately. She tightens her grasp on you the moment she feels your thick, heavy loads jetting inside her as if to ensure you stay in place to let her drink her fill. You’re certainly not going anywhere, too busy groaning and grunting as the desperate galotian girl works her ‘throat’ to suck down every fat load of spunk you give her. Lacking a proper digestive system, Roz’s skin rapidly discolors with great gouts of [pc.cumColor] seed until she’s almost completely colored like she’s a condom holding your spunk.");
		output("\n\n<i>“Oh, oh hell,”</i> she moans in your head. <i>“Keep cumming, you beastly stud!”</i>");
		output("\n\nYou don’t have that much left to give her, but she definitely makes the most of the opportunity. You’ve never been sucked off so forcefully, her body instinctively squeezing you dry now that she knows just how productive you are. When you’ve finally cum everything inside you and then some, she lifts herself off with a loud, wet pop and sits atop you with a dazed smile and her hands on your [pc.chest].");
		output("\n\n<i>“Woooow,”</i> she croons, wiggling her ‘eyebrows’ at you. <i>“You mighta lost the fight, but you sure won that little battle, huh? Think I came twice inna minute! I wanna keep ya for milking, but right now I’m preeeetty full... how about you go on and just git outta the mine. I don’ wanna fight no more right now. ‘Kay?”</i>");
		output("\n\nRoz escorts you to the exit, more politely than is really necessary given she’s a pirate and you’re an intruder. She waves as she turns to leave, heading back inside.");
		output("\n\n<i>“Come back soon, cutie,”</i> she calls over the speaker. <i>“Nex’ time don’t even bother fightin’ and just lemme suck ya!”</i>");
	}
	else if(pc.cumQ() < 25000)
	{
		output("\n\nPerhaps surprisingly, Roz says absolutely nothing when you cum explosively into her body, just starts clinging to you and swallowing down the gigantic loads you’re dumping into her. Massive bulges distort the shape of her neck, protruding momentarily before she loudly swallows them down. Each jet of thick spunk into her body is so violent she actually jiggles with the force, her tits bobbing up and down as her skin rapidly turns [pc.cumColor] to match your emissions.");
		output("\n\nYou think you can hear her breathing hard, panting like a dog in your head, but you can’t tell if it’s you or her. You grunt and groan, twisting this way and that as you’re milked for your massive, belly-busting load. Roz’s tummy is already sagging, her biofuel digestion process just not efficient enough to keep up with your output. She’s putting on pounds in liquid weight by the second, swelling out of her catsuit as you inflate her to the point of obscenity.");
		output("\n\nWhen you’ve finally dispensed what feels like a freighter’s worth of spunk into the needy galotian, you collapse backwards, gasping in exertion. Your entire body aches with the effort of being held tense for so long. Your cock finally pops free of Roz’s slack lips and slaps across your tummy. You glance upwards and see her just staring at you vacantly, her grey eyes perhaps a little faded.");
		output("\n\n<i>“Uhh... can I go?”</i> you venture.");
		output("\n\n<i>“Huh... oh,”</i> Roz says absently, looking down at you with a dopey smile. <i>“Uh huh. Dun fo’get t’come back soon and gimme more.”</i>");
		output("\n\nYou leave her there, still cum-swollen and breathing hard as you leave. You hazard a guess that she might still be cumming over and over at the sensation of being filled with so much cum, but you can’t be sure. Either way, you don’t want to be around when she regains a semblance of consciousness and decides she wants more - or worse, that she wants to keep you.");
		draggedOut = false;
	}
	else
	{
		output("\n\nRoz’s complete inaction when you begin cumming is perhaps more telling than she knows. You groan loudly as your first gigantic gout of seed explodes into her, instantly discoloring the shade of her skin and turning her [pc.cumColor]. The force with which you follow it up in successive spurts is so violent that her entire body jiggles, her massive breasts swaying in time with your ejaculations. Her stomach rapidly expands with the liquid weight of your thick seed, swirling inside her like so much cream as load after load travels between her slack lips and down her relaxed throat.");
		output("\n\nIt seems like she’s completely checked out, her only biological impulse to just hold herself in place and let you use her like a cumdump like she’s little more than a container for your spunk. Even her gigantic tits begin putting on mass, her body seeking to more evenly distribute your insane biological output. Roz might be intelligent - especially for a galotian - but apparently the form has limits when confronted with such overwhelming virility.");
		output("\n\nBy the time your eruptions have ceased, she looks utterly obscene. Her tits are swollen to the point she won’t be able to move for hours, her stomach and thighs not much different. She has, to her credit, kept every single drop of you inside her, where it murkily swirls under her spunk-dyed skin. She’s been completely silent throughout the whole process, and as you get up you hazard a look into her face.");
		output("\n\nLooking at her, you think you recognize from her expression what’s going on: she’s locked in the throes of orgasm, cumming her mind out over and over as the sensation of being flooded with cum wraps itself around her brain every time she regains ‘consciousness’. Her legs are shaking with pleasure, her hands firmly planted on her obscenely cum-swollen stomach, and her eyelids are fluttering rapidly. Yup... she’s going to be out of it for a long, long time.");
		output("\n\nYou decide to make yourself scarce in the wake of your loss, lest she wake up and demand you stay around to feed her. The last thing you need is for her to strap you to a bed and milk you for the rest of time. Gathering your things, you head for the mine’s exit for another shot at it.");
		draggedOut = false;
	}
	processTime(40);
	enemy.loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	if(draggedOut) currentLocation = "SHIP INTERIOR";
	CombatManager.genericLoss();
}

//Female Scene: Roz’s Cum Receptacle”</i>);
//Also applies to traps/shemales. If PC qualifies for the dick’d loss scene as well, make it a tossup which they get.
public function rozsCumReceptacleEnd():void
{
	showRoz(true);
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	}
	output("\n\n<i>“Alright, I can work with this,”</i> Roz drawls,");
	if(pc.isHerm()) output(" rubbing a pair of fingers through your twat before gripping your cock between her gooey digits. <i>“Couple hundred years ago, when I was just a little young thing, I used to love making my own member and plowing pretty girls with with... preferably with a couple dozen men servicing me while I worked. Isn’t it just the best, bein’ a little bit of both? How’s about I show you how I used to live when I was a wild thing, living like a cum-dumpster on two legs?”</i>");
	else if(pc.hasVagina()) output(" rubbing at your [pc.cunt " + x + "]. <i>“Nice lil’ puss you’ve got here. I’ve always been a little envious of havin’ a real one... a nice lil’ baby maker between my legs, begging for any man to come and plow it. Maybe a dozen of ‘em in rapid succession, all trying to be the lucky man to breed me. Instead I gotta wait for hundreds of men to pump their seed in me, bloat me up enough that I can split myself in two. Not that I don’t enjoy the process... in fact, maybe you could help me out with that!”</i>");
	else if(pc.hasCock() && pc.biggestCockLength() < 6) 
	{
		output(" wrapping her fingers around your [pc.cock]. <i>“Ohh, what a cute lil’ pecker you’ve got here! Personally I’m more of a fan of getting plowed by men with big members and bigger libidos, but you know, I’ve got a soft spot for cuties with precious little peens.”</i>");
		output("\n\nHer goo ripples around your cock, enveloping you in a jiggling wet handjob. <i>“But you know what I like better? Watchin’ little things like this flop around and leak their goo while their owner is getting hammered from behind by big strong men-folk. How’d you like to help me live out a little fantasy of mine? I’m not asking, of course, but it’s nice if you acknowledge what a little slut your body wants to be... you’ll cum a whole lot more for me if you’re into it.”</i>");
	}
	output("\n\nGrinning mischievously while she pleasures you, Roz leans in and whispers, <i>“There’s a ship scheduled to come back in just a couple minutes, and if I know my pirates, it’s full of sweaty, pent-up horny hermaphrodites desperate for any excuse to unload. Don’t worry, I’ll be riding shotgun for the gangbang - can’t let you have <b>all</b> the fun, after all.”</i>");
	output("\n\nBefore you can ask what she means, the goo-girl presses her lips to you, hushing you with a kiss. As she does, Roz starts to slip out of her bodysuit. She zips it down to her crotch, letting her massive tits spill out against your [pc.chest], then stripping it off her shoulders and kicking it off her legs; the last leg still wrapped up in the tight latex gives the suit a flick, flinging it over into the open cockpit of her power armor. Once she’s nice and nude, the azure goo presses herself against you, deforming her body somewhat to perfectly mirror the front of yours.");
	output("\n\n<i>“There we go,”</i> she purrs, <i>“Oh, it’s so hard to not just jump on you and bang ya silly... but I’m a patient girl. I know how to wait, to savor the hunt. Or I just like to edge myself... sometimes it gets hard to tell. Hey, hold onto this for me, huh?”</i>");
	output("\n\nRoz reaches a hand into her chest and plucks out a heart-shaped gemstone, floating just below her breasts. She shoves it into your pack and closes it up, tucking her core away. When she speaks next, her voice has changed, becoming a little more girly and a lot more... energetic. <i>“Awesome! Don’t let me forget my core, huh? I need that back to keep my smarts. For now, could ya like, finish stripping for me, babe?”</i>");
	output("\n\nRoz doesn’t wait for you to start: she grabs your gear and starts pulling");
	if(!pc.isExposed()) output(", tearing you out of your clothes");
	output(" and throwing it all aside. She only pauses to suck on your [pc.nipples] when they’re bared, groping her way down to your [pc.hips]. She grips them and pulls, flipping you around so that you’re face-first against the stone with your [pc.butt] sticking out against her. <i>“There we go! Nice brace yourself, cuz I’m going in!”</i>");
	output("\n\nShe grabs your ass cheeks and spreads them apart, baring your [pc.vagOrAss " + x + "] to her tongue. A few quick licks around your entrance are all you get before Roz starts pushing in. Her long, gooey tongue probes the inside of your [pc.vagOrAss " + x + "], lapping at the inner walls in long, circular motions until she’s buried what feels like two feet inside you... and there’s only more coming! An involuntary moan of pleasure passes your [pc.lips] as Roz forces herself inside you by the gallon-full, stretching your [pc.belly] out around the sheer mass of azure skank passing through your ");
	if(x >= 0) output("pussy");
	else output("asshole");
	output(".");
	output("\n\nYou cast a glance over your shoulder in time to see Roz’s body shrinking, sucking up the excess goo from her tits and ass and pouring it into you. No amount of clenching muscle or pleading words dissuades Rozenn from her task; if anything, your instinctive resistance only drives her forward faster and hard, fucking herself into your [pc.vagOrAss " + x + "] until there’s nothing left of her outside. Your gut bloats around her, swelling until you look 12 months pregnant or worse. It’s hard to keep standing under the weight, especially when Roz sloshes around, but a voice inside you gets you moving: <i>“C’mon now, back to the docks like a good whore. You got some tricks to turn, or I’m gonna get mighty unpleasant in here!”</i>");
	output("\n\nNot like you have much fight left in you anyway, at this point. Following the rumbling in your " + (x >= 0 ? "womb":"belly") + ", you stagger back through the mines and towards the dock. All the while, there’s a tingling pleasure spreading from belly to " + (x < 0 ? "butthole":"you pussylips") + " wherever Roz’s goo touched you, like she’s left a thousand little fingers all through your insides to tease you into submission at the slightest misstep. So you do what you’re told, dragging your swollen goo-belly down to the docks.");
	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",girlyRozLoss2,x);
}
public function girlyRozLoss2(x:int):void
{
	clearOutput();
	showRoz(true);
	var pirateCummer:Creature = new Creature();
	pirateCummer.createPerk("Fixed CumQ",2000,0,0,0);
	pirateCummer.createCock();
	pirateCummer.cocks[0].cLengthRaw = 10;
	currentLocation = shipLocation;
	generateMap();
	author("Savin");

	output("And just like your passenger predicted, there’s a new ship docked just a little ways from your own - a small patrol boat maybe ten times the size of Dad’s old Z14, loaded down with guns and grapplers and painted up in brilliant golden colors and a paint job at the front made to look like a great big viper’s fangs. Roz walks you over towards it just as the gangplank is coming down, allowing the first of the crewmen to come jumping down.");
	output("\n\nShe’s a tall, buxom specimen; a woman with a full figure and a pair of feathery golden wings lunging out from behind her back, through a pair of slits in her silver-and-black armored corset. Plated breeches and gauntlets leave only a bit of thigh and most of her upper chest bare from the tops of her breasts up to a shark-like face with a grin of razor fangs. A suula!");
	output("\n\n<i>“Oh, what’ve we got here?”</i> she laughs. Several more figures in similar armor slide down behind her. You recognize several more suula, gryvain, and ");
	if(flags["MAIKE_SLAVES_RELEASED"] != undefined) output("members of the overseer’s race, ");
	output("cylirians, among them; no humans or other more core-ward races. <i>“And [pc.heShe]’s so pregnant... or at least, so stuffed full of goo! Is that you in there, Rozenn?”</i>");
	if(!CodexManager.entryUnlocked("Suulas"))
	{
		output("\n\n<b>(New Codex entry unlocked: Suulas.)</b>");
		CodexManager.unlockEntry("Suulas");
	}
	if(!CodexManager.entryUnlocked("Cylirians"))
	{
		output("\n\n<b>(New Codex entry unlocked: Cylirians.)</b>");
		CodexManager.unlockEntry("Cylirians");
	}
	if(!CodexManager.entryUnlocked("Gryvain"))
	{
		output("\n\n<b>(New Codex entry unlocked: Gryvain.)</b>");
		CodexManager.unlockEntry("Gryvain");
	}
	output("\n\nThe pirate woman laughs and plants her hands on her hips, stalking forward. <i>“Well, either way, you’re clearly not running away with a belly that full. Guess we’ve got our own personal welcome party here to greet us, ladies! Are we going to waste the opportunity?”</i>");
	output("\n\n<i>“No, captain!”</i> comes a unified shout from the company of buxom figures behind her.");
	output("\n\nRoz jiggles excitedly inside you, almost enough to double you over. <i>“Oh boy! This is my favorite ship in the whole pirate fleet... they stay out for long patrols, all cooped up in that ship of theirs with no privacy and strict orders not to get down and dirty on duty... and every one of ‘em is a beautiful lady with a beautiful penis, so backed up with cum that they’re desperate for any port in a storm o’ hormones. This is gonna be so much fun!”</i>");
	output("\n\nYou’re already butt-naked and filled with Roz’s slime, clinging just inside your opening. All the pirate captain has to do is saunter over, hips and shark-tail swaying, and put a firm hand on your shoulder. Your [pc.legOrLegs] finally give" + (pc.legCount == 1 ? "s":"") + " out as if on command, forcing you to sink down on your [pc.knees] as the captain unbuckles her belt. Her trousers fall down to the deck with an echoing <i>thunk</i>, taking her holstered handgun with it and letting a big, fat yellow cock flop down in front of your [pc.face]. Her dick’s surrounded at its base and crown with tiny, wriggling feelers, and her balls are swollen to the size of apples with a week or more of pent-up desire.");
	output("\n\n<i>“Go on, get sucking,”</i> the captain urges. <i>“You don’t want me going in dry, do you?”</i>");
	if(pc.isBimbo()) output("\n\nNo objections there. You grin up and her and open wide, wrapping your [pc.lips] around the plump mushroom of her dick’s head.");
	else output("\n\nNot much risk of that with Roz on board, but there’s little chance of you getting out of this with your dignity intact anyway. You slowly open your mouth, allowing the sharky pirate to step forward and rest her orange cockhead on your [pc.lips].");
	output(" While you’re adjusting to the musky taste of needy shark-futa, the rest of her crew starts circling... barely able to restrain themselves from giving in to their long-ignored lusts. They do start stripping, though, pulling themselves out of their armored uniforms to reveal sweat-slicked mounds of boobflesh and turgid dicks of all shapes but just one size: large. You doubt there’s one cock in the party that’s less than a foot long, and just watching your naked, preg-slut form giving their captain head is enough to get them beading with pre.");
	output("\n\n<i>“Quit staring at the dick-buffett,”</i> the captain laughs. <i>“You’ll get your turn with all of ‘em, don’t you worry your pretty little head. Though you could start <b>moving</b> your head any time. Don’t make me do it - I’m stronger than I look, and I look like a beefy hunk of badass.”</i>");
	output("\n\nSome of the other pirate-futas snicker or throw cat-calls at the captain, but the big suula woman just stands stoically in front of you, awaiting your fellation services. You finally start sucking, moving your mouth up past the ring of stingers surrounding her crown and taking her long shaft down your throat... and the moment it does, you feel a sudden surge of activity within the writhing ring, thrashing against every inch of your throat.");
	output("\n\n<i>“Oops, don’t mind them,”</i> the captain grins. <i>“They’re just pumping you with aphrodisiacs. You can say ‘thank you captain’ by going deep enough to lick my sack.”</i>");
	output("\n\nThe way she tightens her grip on your shoulders doesn’t leave any room for back-talk... not that you can talk with eight inches of dickmeat in your mouth. So you make the long trek down the rest of the way, trying to ignore the way her cockhead’s tentacles are rubbing something warm and tingly all over your throat. When you open your mouth at her base, the tentacles there do the same all around your [pc.lips], smearing aphrodisiac around while your tongue is snaking out to " + (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "try and ":"") + "caress the captain’s cum-stuffed nuts.");
	output("\n\n<i>“Just give it a minute and your throat’s gonna be feelin’ like a pussy,”</i> the captain assures you. <i>“That’ll help you keep the girls nice and hard between turns, won’t it? Only the best for my crew!”</i>");

	output("\n\nThe rest of the pirates cheer again, and a third time when the captain crooks a welcoming finger to them. The circling sharks dive on you in a fuck-frenzy, shoving and snarling at each other as they jockey for position. Finally one of them, a small-chested and big-dicked gryvain woman, manages to bully her way in on her knees behind you and rams her dick straight into your [pc.vagOrAss " + x + "]. You cry out, but muffled as you are by the captain’s log, you doubt anyone can hear your whorism low of pleasure. Another couple of pirates grab your hands, guiding them to reptilian or insectile cocks");
	if(pc.hasCuntTail()) output(" while another finds its way into your [pc.tailCunt]");
	output(". The captain eventually cedes way for another of her crew to take her place, pounding another dick into your throat. And true to her promise, it feels <i>good</i> to suck it. Not a mental pleasure from being a good [pc.boyGirl] for these strangers, not some emotional elation, but a raw, physical <i>pleasure</i> like someone’s given you another [pc.vagOrAss " + x + "] on your face. You tremble as the two dicks saw in and out of you without any rhyme or reason - just raw, animalistic need. They waste no time in dragging things out, trying to extend themselves: that’s what rounds two and three and so on are for, you’d guess. Instead, the girl pounding your [pc.vagOrAss " + x + "] hilts herself and lets loose a flood of pearly seed, shooting it straight into Roz’s waiting body.");
	output("\n\n<i>“Whoo! That’s the stuff!”</i> the goo-girl cheers, wiggling in your belly. You can practically hear her slurping the gryvain’s jizz down. <i>“Too bad I’m not in your stomach too cuz-”</i>");
	output("\n\nThe other pirate fucking your throat tenses, hammers herself against your clit-tender lips, and blows her load against the back of your throat. You almost cum just from the sensation of feeling her warm, salty seed drooling down your gullet. Every drop feels like another dick sliding through your mouth-pussy... and you want <i>more</i>.");
	output("\n\nYou lunge for the next dick as soon as it’s presented, shivering with delight as a throbbing reptile member caresses your clit-tender lips. Another dick shoves itself into your [pc.vagOrAss " + x + "], sliding in on a bed of cummy lube. You can practically feel Roz opening wide to receive it, reaching through your inner channel to kiss the tip of the futa babe’s prick. This one’s a suula cock, if the extra wriggling and the spreading tingle in your loins are any indication, and by the time this one pumps its steamy load into your goo-filled ");
	if(x >= 0) output("womb");
	else output("bowels");
	output(", your whole body feels aflame with desire.");
	output("\n\n<i>“I live for this!”</i> Roz giggles inside you, slurping up the suula’s cumshot. <i>“Gimme that sweet biomass, baby. Gimme more!”</i>");
	output("\n\nLike you’re in control of that anymore!");
	output("\n\nOne of the girls getting a handy from you grunts, bringing your attention back to your shameful work by busting her nut across your [pc.face] and [pc.chest]. The other dickgirl, though, shoves her way into fucking your mouth, just long enough to make you cum from having her rock-hard cock pounding your lips before she joins you, spilling her seed into your goo-bloated belly while your");
	if(pc.hasCock()) output(" cock leaks [pc.cum] across your thighs and your");
	output(" [pc.vagOrAss " + x + "] squeezes hard around whatever dick’s spearing it now. A pair of hands grab your hips and shove it in deeper, lifting you partway off the floor on her dick.");
	output("\n\nRather than release you when she cums, the girl taking your " + (x < 0 ? "ass":"pussy") + " hands you off to a pair of big, strong hands that grip you firmly, pulling you up until your [pc.vagOrAss " + x + "] is pressed to a cockhead with wriggling tentacles slapping you with venom.");
	output("\n\n<i>“Time to finish off my captain’s log,”</i> the suula pirate growls in your ear, running her shark-like teeth across your vulnerable [pc.skin].");
	output("\n\nShe pushes you down hard, impaling you on her cock. Crewmens’ cum squirts from your abused hole, raping another screaming orgasm through your body. Her arms settle under your [pc.legs], spreading them wide and presenting you to the remaining members of her crew still sporting hardons.");
	output("\n\n<i>“Alright, ladies, who’s with me?”</i>");
	output("\n\nOne of the cylirians steps forward rubbing her dick. You vaguely remember sucking on it, but honestly, you’ve kind of lost track by now. The moth-like beauty just gives you a wink and puts her hands on the captain’s, holding you steady while her cock lines up with your [pc.vagOrAss " + x + "]. She shoves herself in beside the captain, making you scream with the stretching as the two dickgirls start fucking you - and the captain’s tendrils start squirting more aphrodisiacs, coating your entrance... and the other pirate’s prick.");
	output("\n\nYour hands don’t get a pass just because you’re being double-penetrated... nor does your mouth. A gryvain takes wing, positioning her dick on level with your lips while your fingers find a pair of her ground-walking comrades’ cocks.");
	output("\n\n<i>“There ya go! Get the whole crew in on it!”</i> the captain laughs.");
	output("\n\nRoz cheers inside you, sloshing excitedly. <i>“God I love this captain! If I had a mind to be a pirate, I’d join her crew just for the spooge. Ohh, what am I saying... silly Roz, all obsessive without my core... and now I’m getting cum-drunk!”</i>");
	output("\n\n<i>“Me too,”</i> you groan, swallowing the gryvain’s load. The draconic dickgirl wipes herself clean on your cheek. A little seed manages leak out from your [pc.lips] before another futa pirate can take her place.");
	output("\n\n<i>“Mmm, keep this up,”</i> the captain laughs, <i>“and I might just have to keep you around. Crew could use a little on-board stress relief.”</i>");
	output("\n\n<i>“Hands off, [pc.heShe]’s mine!”</i> Roz shouts, though you’re the only one who can hear her.");
	output("\n\nThe captain’s too busy hilting herself in you anyway, letting her lower set of stingers assault your [pc.vagOrAss " + x + "] while those at her crown slather your " + (x >= 0 ? "womb":"bowels") + " with more and more aphrodisiac. You’re having a hard time thinking now, much less moving; her chemical arousal has spread through all your muscles, even your brain, leaving you limp in the pirate’s arms. The only thing keeping you upright is a dick and the arms around your [pc.legOrLegs]. All you can do is run your [pc.tongue] around pirate dick after pirate dick, letting the whole crew run a train on you until every last drop of cum’s been milked out...");
	output("\n\nAnd these pirate babes were oh so pent up before...");
	processTime(60);

	pc.loadInMouth(pirateCummer);
	pc.loadInMouth(pirateCummer);
	pc.loadInMouth(pirateCummer);
	pc.loadInMouth(pirateCummer);
	if(pc.hasVagina())
	{
		for(var y:int = 0; y < pc.totalVaginas(); y++)
		{
			pc.loadInCunt(pirateCummer,y);
			pc.loadInCunt(pirateCummer,y);
			pc.loadInCunt(pirateCummer,y);
			pc.loadInCunt(pirateCummer,y);
			pc.cuntChange(y,pirateCummer.cockVolume(0));
		}
	}
	pc.loadInAss(pirateCummer);
	pc.loadInAss(pirateCummer);
	pc.loadInAss(pirateCummer);
	pc.loadInAss(pirateCummer);
	pc.buttChange(pirateCummer.cockVolume(0));
	pc.orgasm();
	pc.orgasm();
	feedCuntSnake(pirateCummer);
	clearMenu();
	addButton(0,"Next",girlyRozLoss3,x);
}

public function girlyRozLoss3(x:int):void
{
	clearOutput();
	showRoz();
	author("Savin");
	output("The very last pirate to give you her sweet seed is the captain, what feels like hours later. Her crews an exhausted mess, crotches smeared with each others’ cum, all laughing and smiling. When the last of her crewmen deposits her final load into your belly, feeding Roz another creamy meal, she staggers back and leaves you to the captain’s pleasure.");
	output("\n\n<i>“Stamina, girls. Stamina!”</i> the captain laughs, her cock throbbing to the beat of it. <i>“Let me show you how it’s done.”</i>");
	output("\n\nYou’re whirled around and slammed face-first against the hull of the pirates’ ship. The captain’s schlong slams in after you, going to the hilt and ejecting spooge around her girthy rod. You’re so full of her aphrodisiacs that you can’t help but cum from the sudden thrust. Roz moans inside you, insensate from overfeeding, and you’re not far behind you: your body’s a limp cocksleeve for the captain’s use, eagerly taking her meat over and over again until even the mighty suula warrior is panting, grunting with effort. But still she doesn’t cum.");
	output("\n\n<i>“Gonna make Roz work for it,”</i> she growls. <i>“Come on you blue cum-rag, help your new ‘armor’ get me off.”</i>");
	output("\n\nRoz titters inside you, sloshing around towards your entrance. She feels like she’s grown twice as big as before, but she’s every bit as hungry as before you started. You wish you were the captain for a moment as Roz stretches you out, making enough room for her gooey self to envelop the suula’s member, stingers and all. The captain sucks in a sharp breath as Roz goes to work, slurping and rippling.");
	output("\n\nThe effect is as potent on you as it is the pirate. Your hole’s so over-sensitive from the captain’s stingers that an orgasm is your only response to Roz’s squirming, instant and overpowering. You scream and cum and cum again as the goo-girl keeps thrashing inside you, working hard to satisfy that craving. You know, somewhere deep in your lust-drunk mind, that your pleasure is only secondary here... but that doesn’t make it any less overwhelming. If you weren’t being held up by the captain, there’s no way you’d still be standing now.");
	output("\n\n<i>“Damn! I need to get some of you galotians when I buy my palace some day... a girl could get used to this kind of treatment. I’m gonna... I’m gonna pump you so full... been savin’ up for a week thinking about you...”</i>");
	output("\n\n<i>“Flatterer!”</i> Roz giggles. <i>“Now get on with it and cum for me!”</i>");
	output("\n\nThe captain obliges a moment later, shoving herself in as deep as she can and letting her massive cock surrender to Roz’s insistent wriggling. You don’t feel the cum shooting in you - Roz swallows every drop of the captain’s seed straight from the tap - but you can feel her <i>throbbing</i>, dick clenching hard as it releases all the spunk stored up in those big apples between her legs.");
	output("\n\nWhen the last, weakening spasm has worked its way through the captain’s shaft, she lets you fall unceremoniously to the floor and off her dick. There’s no leakage, though you are covered with the rest of the crew’s cum a second time when you slide down onto the soiled deck.");
	output("\n\n<i>“Whoo!”</i> the captain howls, thrashing her tail against the hull of her ship. <i>“Now that’s a welcome home I’ll remember for a good long time. C’mon, girls, let’s head up to the bar before you start thinking about round... hell, I think you’ve all lost count by now. First round’s on me!”</i>");
	output("\n\nThe crew cheers and follows their captain out, leaving you to catch your breath in a puddle of semen... and soon, a puddle of goo as well as Roz forces herself out of your battered " + (x < 0 ? "rectum":"twat") + ", slowly reforming herself on the deck between your [pc.legs].");
	output("\n\n<i>“That was fun!”</i> she cheers, patting the tops of her tits. They’re <i>way</i> bigger than before, almost the size of her entire body... and that’s just the most remarkable of her asset growths. She jiggles herself under you appreciative gaze before turning her attention to your pack. She quickly retrieves " + (pc.credits > 5 ? "some of your credits along with ":"") + "her core and daintily places it between her tits, sucking it back in.");
	output("\n\nRoz grins, intelligence flaring in her eyes. <i>“There we go, sugar. Guess we’ll call it even, you and me... but I ain’t goin’ easy on you next time I catch you in the mines. Stay out!”</i>");
	output("\n\nAll you can do is groan as the goo-girl sashays off.\n\n");
	//Credits:
	if(pc.credits >= 2)
	{
		var stolenCreds:Number = pc.credits;
		if(stolenCreds > 1000) stolenCreds /= 2;
		if(stolenCreds > 5000) stolenCreds /= 2;
		if(stolenCreds > 10000) stolenCreds /= 2;
		if(stolenCreds > 20000) stolenCreds /= 2;
		if(stolenCreds > 40000) stolenCreds /= 2;
		if(stolenCreds > 80000) stolenCreds /= 2;
		if(stolenCreds > 200000) stolenCreds /= 2;
		stolenCreds = Math.ceil(stolenCreds);
		if(stolenCreds > pc.credits) stolenCreds = pc.credits;
		pc.credits -= stolenCreds;
	}
	for(var y:int = 0; y < 12; y++) { pc.orgasm(); }
	CombatManager.genericLoss();
}