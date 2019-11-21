//The Great Slave Rebellion && Agrosh & Ardia
//By Savin Savsav.

public function ardiaBustDisplay(nude:Boolean = false):String
{
	return "ARDIA" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "_HORSE":"") + (nude ? "_NUDE":"");
}
public function showArdia(nude:Boolean = false):void
{
	showName("\nARDIA");
	showBust(ardiaBustDisplay(nude));
}
public function showAgrosh(nude:Boolean = false):void
{
	showName("\nAGROSH");
	showBust("AGROSH" + (nude ? "_NUDE":""));
}
public function showAgroshAndArdia(nude:Boolean = false):void
{
	showName("AGROSH\n& ARDIA");
	showBust("AGROSH" + (nude ? "_NUDE":""),ardiaBustDisplay(nude));
}
public function showArdiaAndAgrosh(nude:Boolean = false):void
{
	showName("ARDIA\n& AGROSH");
	showBust(ardiaBustDisplay(nude),"AGROSH" + (nude ? "_NUDE":""));
}
public function addictedToArdia():Boolean
{
	return (pc.hasStatusEffect("Dzaan Addicted"));
}

public function drinkArdiasCum():void
{
	IncrementFlag("ARDIA_CUMSHOTS_SWALLOWED");
	if (immuneToArdia()) return;
	if (!addictedToArdia())
	{
		pc.createStatusEffect("Dzaan Addicted");
		ardiaDomLevel(1); // Becoming addicted to her increases domme meter
	}
	while (pc.hasStatusEffect("Dzaan Withdrawal")) { pc.removeStatusEffect("Dzaan Withdrawal"); }
	//1 week. Creates "Dzaan Withdrawal" after. Reduces all lust damage taken by 2.
	if(!pc.hasStatusEffect("Beta's Satisfaction")) pc.createStatusEffect("Beta's Satisfaction",2,0,0,0,false,"Icon_Charmed","You’ve recently sated your desire for your alpha’s cum, and can think only of her. You take less damage from lust-damaging attacks.", false, 0, 0xFF69B4);
	else if (rand(4) == 0) ardiaDomLevel(1); // Taking one of her loads inside you while already high off a previous dose might increase domme meter
	pc.setStatusMinutes("Beta's Satisfaction",7*24*60);
}

public function unlockTheSlavePen():void
{
	clearOutput();
	showName("FLY\nFREE!");
	author("Savin");
	author("Savin");
	output("You slide Maike’s security card through the heavy-duty scanner, and with surprisingly little aplomb, the light switches from red to green accompanied by a mechanical grinding from the lock. You slide the gate open and step through the threshold, into the shadowy earthen cavern the pirates keep their hordes of off-duty slaves in. It looks like a shanty-town inside, or a refugee camp: makeshift tents and blankets strung out between stone columns and stalactites, staking out places for the poor people here to huddle up in the hot darkness of the mines.");
	output("\n\nThe moment the door opens, several dozen eyes are on you, staring at you in a mix of fear and curiosity. You’re certainly not the usual face coming to take them for the day’s forced labor.");

	if(pc.isAss()) output("\n\n<i>“Alright, listen up!”</i> you shout. <i>“I’m leaving this door open. What you do now is on you.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“What’re you all staring at?”</i> you shout at the huddled masses. <i>“Door’s open! Get going!”</i>");
	else output("<i>“You poor people... come on, the door’s open. You’re free, get out of here!”</i>");

	//If collars are turned on:
	if(flags["MAIKE_SLAVES_RELEASED"] != 1)
	{
		output("\n\nThe slaves just stare sadly at you. One of them, a particularly curvaceous dzaan, fidgets with the shock collar around her neck... the one each and every slave in the pen is wearing. Nobody makes a move; not a soul takes advantage of the opportunity you’ve presented.");
		output("\n\nMaybe they can’t?");
		output("\n\nYou sigh and turn away. Nothing you can do for them right now.");
	}
	//If collars are turned off:
	else
	{
		output("\n\nThere’s a long moment of hesitation. Humans, ausar, kaithrit, and a dozen other races peer at you from the shadows, confused. Finally, one of the catgirl slaves, a tall amazon with purple hair and a body covered in dust and grime, steps forward and yells at the other slaves, <i>“What’s it matter if it’s a trap? This is our chance, damn it! And I for one am taking it. So come on, and we’ll seize our freedom!”</i>");
		output("\n\nA cheer rings out through the cavern, and a wave of unwashed bodies comes pouring out of the darkness. You press yourself against a bulkhead, making as much room for the torrent of humanity (and its alien equivalents) streaming out into the halls. A moment later and you hear screaming and shouting from elsewhere in the base; the sound of alarms blares. But the slaves are freed, and there’s no stopping this many angry, vengeful folk all at once!");
		if(pc.isAss()) output("\n\nThat should make for a good distraction... ");
		else output("\n\n");
		output("Something tells you you’ll be dealing with less enemies around here from now on.");
		processTime(4);
		//set slave rebellion to high gear!
		flags["MAIKE_SLAVES_RELEASED"] = 2;
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Great Slave Pretend-ening!
//If the PC has a slave uniform, play when entering the T intersection at the end of the hall with the slave pens. Slaves can’t have been freed, and PC can’t have gone to the Foundry level already.
public function slavePretenderooo():Boolean
{
	if(flags["ZHENG_SPACEWALKED"] == undefined && flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined && (pc.hasItemByClass(Slavesuit) || pc.armor is Slavesuit) && flags["MAIKE_SLAVES_RELEASED"] != 1 && flags["MAIKE_SLAVES_RELEASED"] != 2 && flags["ZHENG_SLAVE_SNEAK_DISABLED"] == undefined)
	{
		author("Savin");
		output("\n\nAs you make your way through the hall, your attention is caught by a sudden cry of pain from nearby. Thinking fast, you ");
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("activate your cloaking device and peer around the corner");
		else output("press yourself up against the nearest wall and stick the end of your Codex around the corner, viewing the events from as much stealth as you can on short notice");
		output(".");

		output("\n\nThere’s a group of slaves in the hallway, being escorted out of the pens in a line of frightened forms. They’re all wearing the same tight, form-hugging orange and blue bodysuits that you’ve encountered before, “easy access” zippers included. Unlike the mine slaves, though, these ones are pristine - well-kept, clean, unblemished by hard work in the dusty mines. Pleasure slaves.");
		output("\n\nA pirate in a suit of masked combat armor is directing the herd in your direction, shoving and cajoling the unwilling men and women towards their fate. A couple of robotic wolves hound their feet, keeping the back of the column moving forward in their master’s wake. Looks like they’re being led to somewhere else in the facility... this might be your chance to skip ahead a bit, if you’re willing to degrade yourself at least. <b>You doubt you’ll get this chance again.</b>");
		clearMenu();
		//[Sneak In] [No Way]
		addButton(0,"Sneak In",sneakIntoTheSlaveChainGang,undefined,"Sneak In","You have a slave uniform and everything. Sneak into the group of slaves and see where you end up.");
		addButton(1,"No Way",notGonnaBeASlaveChainGangGuy,undefined,"No Way","You’re not going to voluntarily join a sex-slave chain gang.");
		return true;
	}
	else return false;
}

//[No Way]
//You’re not going to voluntarily join a sex-slave chain gang.
public function notGonnaBeASlaveChainGangGuy():void
{
	clearOutput();
	author("Savin");
	flags["ZHENG_SLAVE_SNEAK_DISABLED"] = 1;
	showName("\nNOPE" + (silly ? ".JPG":"") + "!");
	output("You keep to the shadows, out of sight and out of mind until the slaver and his captives are long gone. When they’ve disappeared down one of the side corridors, you breathe a sigh of relief and get back to work.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sneak In]
public function sneakIntoTheSlaveChainGang():void
{
	clearOutput();
	showName("PRETEND\nSLAVE");
	author("Savin");
	output("Okay, this is your shot to get deeper into the facility. You " + (!(pc.armor is Slavesuit) ? "stuff yourself hastily into your slave outfit and ":"") + "wait in the shadows as long as you can, letting the armored pirate and the first few slaves pass by your hiding place. Before the mechanical rear guard can turn the corner, in that brief moment when there’s no eyes on the middle of the convoy, you slip out of the shadows and into the midst of the group. The slaves are all downcast and afraid to look at anything too closely; you don’t get so much as a look as you slip into their ranks.");
	output("\n\nAs long as nobody looks too closely at you" + (!(pc.accessory is MaikesCollar) ? " and your lack of collar":"") + ", everything should be fine...");
	output("\n\nYou’d guess there’s about a dozen slaves with you, all attractive and in their prime. Real prizes to scum like this");
	if(pc.isBimbo()) output(", though obviously you take the cake");
	output(". You squeeze your way into the middle of the slave group, trying to look like just another piece of fuck-meat going to meet [pc.hisHer] lurid fate.");
	output("\n\nIt must work, because before long you’re being herded onto a small shuttle parked in the hangar, not that far from your own vessel. It’s a tight squeeze, packed together like sardines while the pirate and a pilot climb aboard, watching you all beneath their opaque masks... though you can easily imagine the lust on their faces, looking over your nubile bodies. The shuttle door seals shut, and the engines rumble, sending a shudder through the deck under your [pc.feet].");
	output("\n\n<i>“Hold onto something,”</i> one of the slaves whispers to you as the shuttle takes off. You’re too packed in to even <i>hope</i> to reach one of the hand holds on the sides of the cabin, no matter how hard you reach.");
	//set location to generic empty square and refresh map!
	currentLocation = "ZSM SPACE";
	generateMap();
	processTime(20);
	clearMenu();
	addButton(0,"Next",beingADisguisedSlavePt2);
}

public function beingADisguisedSlavePt2():void
{
	clearOutput();
	showArdia();
	showName("PRETEND\nSLAVERY");
	author("Savin");
	output("The deck lurches hard, making you buck forward. A hand catches you before you can go flying, pulling you back against a soft, uniformed body behind you. The back of your head recoils against the other slave - and into pair of large, soft breasts. You squirm around in the press of bodies while the sudden G-forces subside.");
	output("\n\nShe’s a dzaan, dusky-skinned and elfin-eared, standing almost eight feet tall with a crown of little keratin nubs over her eyes and one placed prominently on her chin. Sky-blue hair falls loose around her shoulders, the same color as her lush lips and the big, innocent eyes staring ");
	if(pc.tallness > 6*12+4) output("up ");
	else if(pc.tallness < 5*12+6) output("down ");
	output("at you.");

	output("\n\n<i>“Guess I better start getting used to random gropes,”</i> she half-laughs, helping you regain your footing. <i>“I’m, um, I’m Ardia.”</i>");
	output("\n\n<i>“[pc.name],”</i> you answer");
	if(pc.isNice()) output(" apologetically");
	output(", taking a deep breath as the gravity settles down. Better leave out the <i>“Steele”</i> part this time.");
	output("\n\nYou’re not the only one to get jostled, it looks like, and the pirate guard strapped in next to the cabin is busy laughing at a particularly buxom slave-girl jiggling obscenely with every shudder of the engines.");

	//Unlock Dzaan codex + notification if needed
	if(!CodexManager.entryUnlocked("Dzaan"))
	{
		output("\n\n<b>(New Codex entry unlocked: Dzaan.)</b>");
		CodexManager.unlockEntry("Dzaan");
	}
	processTime(6);
	clearMenu();
	addButton(0,"Next",beingADisguisedSlavePt3);
}
public function beingADisguisedSlavePt3():void
{
	clearOutput();
	showAgroshAndArdia();
	author("Savin");
	showName("PRETEND\nSLAVERY");
	output("It’s a short ride to the lower levels, not more than fifteen minutes through open space. The press of bodies means you spend most of the trip with Ardia’s breasts squished against you; their owner spends it blushing and trying to avoid eye contact while something starts poking you progressively more urgently in the thigh from her direction. Soon, the shuttle is passing through a huge vacuum-shielded bay door, several times bigger than the entrance you flew your ship through, obviously made to berth some sort of full-on capital ship.");
	output("\n\nWhich is exactly what it’s doing. Your entrance to the spacedock grants you a long-panning view of a heavy corvette in the last stages of construction, covered in scaffolding and workers welding on exterior armor or lavishing the hull with dark orange paint.");
	output("\n\n<i>“Woah,”</i> Ardia breathes, staring out the window. <i>“They’re making a whole ship in here!”</i>");
	output("\n\nYour eyes are soon drawn downwards, to a sprawling fabrication facility underneath the pirate vessel. They’ve got everything they need to process the materials for their vessels, with dozens of technicians and engineers maneuvering between the vast rows of semi-automated machines printing out plates of metal armor and interior hardware. Several other slaves make less-subtle gasps of awe, earning a harsh <i>“Quiet down!”</i> from the guard.");
	output("\n\nThe shuttle lands a short ways in, settling down on the main deck with another shuddering <i>thunk</i> that makes you glad for Ardia’s meaty shock absorbers. The door opens with a hiss, and the pirate starts shouting for everyone to get the fuck off. You end up bodily pushed out of the shuttle and onto the deck, sticking to the middle of the pack again.");
	output("\n\n<i>“Lucky you,”</i> your guard says, having to half-shout over the foundry’s ambient roar. <i>“You scum get a walk through the boss’s shiny new toy on your way up to meet him and all the fancy dicks you’re gonna be sucking. Should be honored!”</i>");
	output("\n\nWhat’s that? The guy in charge of this place is <b>somewhere through the drydocked ship?</b> Good to know for after you make your escape.");
	output("\n\nYour thoughts are interrupted by a rough hand grabbing your shoulder, pulling you out from the pack.");
	output("\n\n<i>“This one!”</i> a large, heavyset pirate in a welder’s smock shouts. He’s a thraggen, a towering slab of scarred green skin wrapped over hard muscle. <i>“You owe me two replacements, ya scallywag.”</i>");
	output("\n\nYour guard grunts and stops the convoy. <i>“Who the fuck says ‘scallywag’? ‘Sides, these ones are meant for the boss. Sorry Agrosh!”</i>");
	output("\n\n<i>“You owe me two!”</i> the bigger man growls, shaking you like a toy");
	if(pc.tallness > 90) output(" despite your much greater size");
	output(". <i>“Or do you want your little accident gettin’ reported up top?”</i>");
	output("\n\nThe guard sighs and pulls a datapad out of his belt, fiddling with it for a moment. <i>“Oops, guess I brought two more slaves than the requisition order. Take your pick, old man.”</i>");
	output("\n\n<i>“That’s more like it,”</i> the thraggen says, nodding. You get shoved backwards, pressed up against a wall by one of his big, leathery hands. <i>“This one, and... you!”</i>");
	output("\n\nArdia gives a shrill little cry as she’s pulled out of the pack. The guard just shrugs in response to the kidnapping. <i>“You know I don’t just keep the best ones in the middle, right? Eh whatever, your pick’s your pick. Just don’t go saying I don’t do no favors for the engineers.”</i>");
	output("\n\n<i>“It’s not a favor if it’s under duress,”</i> the engineer replies sagely. <i>“Now get gone, before I find a reason to take a third!”</i>");
	output("\n\nThe guard waves him off and shoves the lead slave forward, leaving you and Ardia in the burly greenskin’s hands. As the slave column presses on towards the corvette’s gangplank, the burly tech turns to you with a tusky, hungry grin. <i>“You two will call me Master from now on. You’re the bottom bitches of this asteroid, playthings. My engineers need stress relief. And I... I’ve been working in this sweltering fuckin’ heat for twelve hours straight. Guess what your first job is?”</i>");
	output("\n\nArdia whimpers as the thraggen man pushes her towards a nearby door, dragging you along with him...");
	processTime(15);
	clearMenu();
	addButton(0,"Next",beingADisguisedSlavePt4);
}

public function beingADisguisedSlavePt4():void
{
	clearOutput();
	showAgroshAndArdia();
	author("Savin");
	currentLocation = "ZSF I22";
	generateMap();
	output("A few moments later and you’re being shoved into a small lounge off the main floor of the foundry. It’s maybe twenty feet to a side, dominated by a fully-stocked wet bar and a large, heavily cushioned sofa. Agrosh locks the door with a swipe of his keycard and turns back to you, wiping some of the prodigious sweat from his rough green brow. The burly man saunters over to the couch and sits down with a heavy sigh, taking the weight of a long shift off his feet. You can already see the weighty bulge under his overalls forming a mighty tent as Agrosh starts to unbuckle his belt.");
	output("\n\n<i>“Still standing around?”</i> he growls, pulling his overalls down. <i>“Do ya need punishment already?”</i>");
	output("\n\nArdia looks hesitantly at you, waiting for you to take the first step towards the inevitable fate of pleasure slaves...");
	output("\n\n...or do you?");
	processTime(4);
	flags["ZHENG_SHI_SLAVE_SNUCK"] = 1;
	clearMenu();
	//[Service] [Fight!]
	addButton(0,"Service",serviceAgroshYaSloot,undefined,"Service","Join Ardia in giving the big man the sexual service he requires of his slaves. This should make him nice and pacified for a bit; give you a chance to slip out without too much of a ruckus.");
	addButton(1,"Fight!",fightForgeChiefAgrosh,undefined,"Fight!","While you have a chance, try and escape this predicament. Agrosh is still well aware and able to defend himself, since he hasn’t been sexed up, but that’s no threat to you, right?");
}

//[Fight]
//While you have a chance, try and escape this predicament. Agrosh is still well aware and able to defend himself, since he hasn’t been sexed up, but that’s no threat to you, right?

//[Service]
//Join Ardia in giving the big man the sexual service he requires of his slaves. This should make him nice and pacified for a bit; give you a chance to slip out without too much of a ruckus.

//Service Agrosh
//PC and Ardia double team the space orc until he passes out lol
public function serviceAgroshYaSloot():void
{
	clearOutput();
	showAgrosh(true);
	author("Savin");
	output("You slink towards the towering thraggen, slipping down " + (pc.hasKnees() ? "on your [pc.knees]":"to the ground") + " and placing your hands on his muscular thighs. Agrosh grunts approvingly and unbuckles his work uniform, letting the fire-retardant smock slide down so that the only thing separating you from his hardening cock is the thin layer of his jeans. You lean in and pinch the zipper between your teeth, slowly dragging it down to unleash the rich aroma of a well-worked man ready for his just rewards, that heady mix of sweat and musk that makes your head spin even before the long green rod tears itself free.");
	output("\n\nArdia’s beside you a moment later, and its her fingers that first wrap around the throbbing veridian monster pressing against your cheek. Her cyan lips wrap gingerly around the dark crown of the thraggen’s dick, but her new owner has no patience for her tenderness: he grabs Ardia’s hair and mashes her face down his length. The poor slave-girl’s throat bulges, eyes wide and tearing up as she chokes on Agrosh’s cock.");
	output("\n\nHer punishment only last for a few seconds before the chief pushes her back to the crown. <i>“Get busy on the shaft,”</i> he growls at you, using his other hand to direct your mouth to his veiny girth. Your [pc.lips] lock around him, letting your tongue play up and down Agrosh’s knob. It’s almost human-like, save for its coloration - so dark green that it’s almost black in places, and its tip has the same mushroom shape as a human’s, though it’s buried in Ardia’s mouth now. The slave-girl locks eyes with you a moment and tries to smile reassuringly, though it ends up looking more like a grimace around her mouthful of thraggen meat.");
	output("\n\nHard to blame her. The smell alone is almost overpowering, to say nothing of the bitter, salty taste you’re experiencing. Agrosh seems to revel in Ardia’s dismay, pumping her head up and down the few inches at his tip with little concern for her ability to breathe. You suppose you got the better end of this, only responsible for his lower half, but your cheeks are soon flicked with Ardia’s spittle and errant drops of pre that don’t quite stay on her blue lips.");
	output("\n\nA couple more minutes of this, though, and you can feel Agrosh’s heart racing. His cock stiffens, throbbing hungrily as he forces more and more into Ardia’s mouth with every thrust. Finally, you’re fully pushed off his cock as the brawny forge chief pushes Ardia’s plush lips all the way down and grunts as his seed spills down her throat.");
	output("\n\n<i>“Fuck!”</i> Agrosh huffs, shoving Ardia down on the floor. Cum drools down her chin amidst little coughs and splutters. His dick’s as shiny as chrome, though, polished raw by the dickgirl’s dutiful lips. A few droplets of seed leak down from his dark crown, splattering on the ground as he turns his attention to you. <i>“Decent warm-up. Now you...”</i>");
	output("\n\nAgrosh saunters over and picks you up by the arm, shoving you over to the nearby couch. You go tumbling face-first and ass-up, a situation the thraggen quickly takes advantage of. He yanks down your slave uniform’s zippers, exposing your [pc.butt] and what lies between its cheeks. A sharp spank makes you gasp, but its the two spit-soaked fingers ramming themselves up your [pc.vagOrAss] that makes you <i>scream</i>. Your assailant swirls his fingers around, smearing your clenching inner walls with just enough spit to make sure he’ll get the tip in without any trouble.");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("\n\nYou have just enough time to complete the thought before it happens. The spit-shined crown of Agrosh’s dick presses into the " + (x < 0 ? "ring of your asshole":"lips of your pussy") + ", pushing forward relentlessly against your body’s instinctive clenching. Slowly, inexorably, he enters you, grinding his veiny dick against every inch of your [pc.vagOrAss " + x + "] on the way in, right until his churning balls are slapping against your [pc.butt].");

	if(x >= 0) pc.cuntChange(x,new Agrosh().cockVolume(0));
	else pc.buttChange(new Agrosh().cockVolume(0))

	output("\n\n<i>“You, fat girl with the balls,”</i> Agrosh snaps over his shoulder. <i>“Come here.”</i>");
	output("\n\nArdia pads over, jiggling obscenely without the support of her slave uniform. The thraggen grabs one of her tits, pulling her down beside you. <i>“Y-yes?”</i>");
	output("\n\n<i>“Yes what?”</i> Agrosh growls, twisting her dusky nipple. <i>“Think hard, slut.”</i>");
	output("\n\n<i>“Yes <b>master</b>,”</i> Ardia whimpers. Good enough for Agrosh, it seems: he releases her tit and shoves her down on the couch beside you. The poor girl’s dick and balls wobble heavily in your face as she just about sinks into the cushions.");
	output("\n\nAgrosh’s hand finds the back of your head and shoves your [pc.face] down into Ardia’s crotch. <i>“She’s earned herself an orgasm. Work hard, and maybe I’ll fuck you raw enough to cum too.”</i>");
	processTime(30);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",serviceAgroshYaSloot2);
}

public function serviceAgroshYaSloot2():void
{
	clearOutput();
	showAgroshAndArdia(true);
	author("Savin");
	output("Your [pc.lips] are wrapped around Ardia’s dick before you have time to really think. Stars, you might be getting a little carried away with this charade! And yet, the taste of Ardia’s precum is intoxicatingly sweet, helping you forget the pain of the thraggen’s raw fucking while you pleasure your fellow fuck-slave. She gasps, holding onto your shoulders as you go down on her, taking her entire keratin-nubbed length down your throat. The little smooth bulbs click on your teeth and her crown bats your tonsils, but you find yourself more focused on the sheen of pre her slit leaves smeared across your [pc.tongue]. Somehow it’s... it’s almost <i>comforting</i> despite the situation.");
	output("\n\n<i>“Uh oh,”</i> Ardia murmurs, gazing down at you. <i>“Don’t drink it, [pc.name]... it’s-”</i>");
	output("\n\n<i>“Quiet!”</i> Agrosh grunts, shoving your face down to Ardia’s base - and shoves himself in to the hilt at the same time, stretching you wonderfully. Fuck it, couldn’t have been that important. You return your attention to milking out more of the dzaan’s sweet seed, content to let Agrosh ravish you to his dark heart’s content. He’s a merciless, completely self-absorbed " + (!pc.hasVagina() ? "butt-":"") + "lover, but as Ardia squirms and gasps, making you really work for that much-needed orgasm, you find it easy to ignore... and all too easy to fixate on your lover’s clenching sack and throbbing cock.");
	output("\n\nWhen Ardia finally cums, emptying those churning apples of hers straight down your throat, it’s an almost euphoric moment. You barely notice when Agrosh fills you from the other end, wiping his cock off on your asscheeks; he’s a secondary concern compared to draining the beautiful bronze alpha’s needy balls. When he saunters around you and hefts up one of Ardia’s legs over his shoulder, thrusting into her pussy, well, that just helps you milk out her second load.");
	output("\n\nA load that comes sooner than you’d expected, but not as quickly as you’d hoped. Between the thraggen’s weighty thrusts, Ardia clutches your shoulders and pulls you in deep, whimpering an apology even as her nubbed cock is leaking its first jets of semen down your throat. You swallow it gladly, worshipfully, eager to please your alpha.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",turnTheSlaveryTables);
}

public function turnTheSlaveryTables():void
{
	clearOutput();
	showAgroshAndArdia(true);
	author("Savin");
	//[Turn the Table]
	output("Wait, what?");

	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());

	output("\n\nYou blink, trying to shake off the lust-addled daze that’s come over you. What is going on? This was supposed to just be a distraction, and yet you’re greedily drinking Ardia’s cum while the big thraggen rapes her. He pulls out at the last minute, spraying your cheeks with his own cum, and pulls you off Ardia and into his lap. You squeal as Agrosh’s still-hard dick thrusts up into your [pc.vagOrAss]; you’re still tender from the last hard fucking, and just having him push in is enough to make you cum. " + (pc.hasCock() ? "Your [pc.cum] squirts across his belly and down onto Ardia’s thighs and balls. ":"") + "At least you can feel him tiring now - all that thraggen stamina can only take him so far, it seems! You just gotta hold out a little longer.");

	output("\n\nMaybe Ardia can help wear him down even faster. You take her hand, urging her up out of the couch, to get involved somehow. She glances around awkwardly, looking for somewhere to ply herself before, with a resigned sigh, slipping down off the couch and between the forge master’s legs.");

	output("\n\n<i>“Gah! Dirty girl!”</i> Agrosh grunts, throbbing inside you. <i>“Ah, fuck, talented tongue though... careful none of the ladies find out, ahah!”</i>");

	output("\n\nSexually exhausted as you are, you wrap your arms around Agrosh’s shoulders and start to buck your [pc.hips], riding the big green bastard like your life depends on it - and at least as far as your freedom goes, it might as well! You work your muscles and bounce as hard as you can, taking that thick pillar of green meat " + (x < 0 ? "colon":"womb") + " deep with every go. The depth and stretch is unreal, threatening to tear you apart... but when he cums, grunting and gritting his teeth, you can feel him soften. You can see him tiring.");
	output("\n\nAnd then Ardia tips the scales.");
	output("\n\nThe dzaan stands, slipping her hands around your [pc.chest], holding you steady in the thraggen’s lap as he erupts inside you. You feel something hard and wet brush against your [pc.butt], slipping down... and then it disappears. A moment passes, and then in one glorious motion, your alpha bucks her hips forward and makes <i>Agrosh</i> scream. He bellows to the heavens, a thunderous cry of shock and pain as the dzaan’s dick rams up his virginal tailpipe.");
	output("\n\nYou pin him down under your hips, taking advantage of his fatigue to push his arms against his side while you keep bucking your hips. Agrosh doesn’t have the chance to try and go soft inside you; you keep his over-sensitive member trapped between your walls and milk it with everything you’ve got.");
	output("\n\n<i>“How do <b>you</b> like it, <b>dirty boy</b>?”</i> Ardia laughs, slapping the thraggen’s thigh. You just feel his dick clench inside you, and then as Ardia pounds him, another jetstream of his spooge spills into you. He tries to talk, to struggle, but the throes of anal orgasm are too overwhelming; the pleasure of your [pc.vagOrAss " + x + "] is too much to resist. It’s easy to reach down to Agrosh’s belt and find a zip-tie; a little less easy to git it around his wrists, but a good few thrusts from Ardia loosen him up enough to get the job done.");
	output("\n\nYou pull yourself off him just before the thraggen can cum again, leaving his soaked tool bobbing in the air as Ardia fucks him to a ruined orgasm. You watch with no small amount of sadistic glee as his spunk arcs through the air, splattering on his chest - and is quickly accompanied by some of the dzaan’s as well: she pulls out at the last minute and lets those aching apples between her legs unload all over him.");
	output("\n\nWhether it’s the potency of Ardia’s sperm or sheer sexual exhuastion, Agrosh gives a final few spurts and collapses on the couch, seemingly spent.");
	output("\n\n<i>“Whew!”</i> your dzaan companion cheers, wiping some of the chief’s sexual effluvia from her thighs. <i>“I hope you’ve got a plan for getting us out of here, cuz if not... I don’t wanna be here when he wakes up... or if any of his friends show up!”</i>");
	output("\n\nArdia’s got a point: if somebody finds the foundry master tied up, it’s not going to go well for either of you. You consider it a moment before telling Ardia, <i>“Stay here with him. If anybody comes in, make it look like you just fucked him into a stupor again.”</i> With a body like hers, it’s an easy lie to believe.");
	output("\n\n<i>“Okay, I can do that!”</i> she says, flashing you a sly little grin. <i>“He looks dumb enough to get himself hooked on a dzaan, so... yeah, okay, I’ll stay here and keep an eye on him. Just... if you find a way to get these collars off, come back for me, okay?”</i>");

	if(pc.isNice()) output("\n\nOf course.");
	else output("\n\nYou’ll think about it...");

	output("\n\n<i>“And listen, uh... you’re probably gonna want to come back to me anyway. I was trying to say while he was using us, we dzaan have addictive cum. Normally I’d be taking a supressant, but I haven’t had access to my pills in a while, so...”</i>");
	output("\n\nUh oh.");
	output("\n\n<i>“Yeah,”</i> Ardia says, flushing darkly. <i>“Sorry. Um, if it makes it better, you’re welcome to come sate any cravings you have. At least until there’s a way out.”</i>");
	output("\n\nAnd how are you supposed to sate these cravings?");
	output("\n\nArdia just chuckles nervously and pats her thigh, next to her cum-sheened cock and apple-sized nuts. Oh, of course.");
	output("\n\nFor now, though, what do you want to do?");
	IncrementFlag("SEXED_ARDIA");

	processTime(20);
	pc.loadInMouth(ardia);
	ardia.orgasm();
	flags["ARDIA_WHACKED_OFF_AGROSH"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Next]
//Fight: Forge Chief Agrosh
//From [Fight!] option in the Slave Pretend-ening
public function fightForgeChiefAgrosh():void
{
	clearOutput();
	showAgrosh();
	author("Savin");
	output("While Agrosh is distracted for a moment, you pull your [pc.weapon] from hiding and shove Ardia down into the cover of the wetbar.");
	output("\n\n<i>“Oh-ho!”</i> the thraggen bellows, lunging to his feet. <i>“What have we here? A rebellious slave, thinks [pc.heShe] can fight a thraggen! Just because I’m a tech on this station doesn’t mean I’m not a warrior first. Let me show you!”</i>");
	output("\n\nWith a roar, the huge man comes charging towards you like a raging bull!");
	//start fite
	processTime(2);
	clearMenu();
	addButton(0,"Next",startAgroshFight);
}

//When entering the slave lounge for the first time, hasn’t done the Pretend-ening
public function slaveLoungeAgroshProc():Boolean
{
	if(flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined && flags["AGROSH_WHUPPED"] == undefined)
	{
		clearOutput();
		showAgroshAndArdia();
		author("Savin");
		output("As you step through the door marked “Officer’s Lounge,” you’re greeted by a sudden blast of cool air - a welcome reprieve from the oppressive heat of the foundry. However, on its heels comes an overpowering, musky odor and the sound of flesh slamming flesh. Your eyes are quickly drawn past a wet bar to a large cushioned sofa, where a huge, burly thraggen man is sitting with legs and arms spread while a bronze-skinned, blue-haired girl goes down on his girthy rod.");
		output("\n\n<i>“Hey! Close the - who the fuck are you!?”</i> the thraggen growls, shoving the dzaan off his cock. She crumples to the floor with a shrill cry of fear, scrambling behind the bar while her master rises, cracking his knuckles. <i>“Don’t matter. I don’t know your face, which means you don’t belong in Agrosh’s foundry. Kiss your freedom goodbye!”</i>");
		output("\n\nWith a feral roar, the huge thraggen comes charging right at you!");
		//start fite
		clearMenu();
		addButton(0,"Next",startAgroshFight);
		return true;
	}
	return false;
}

public function startAgroshFight():void
{
	var tEnemy:Agrosh = new Agrosh();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatAgrosh);
	CombatManager.lossScene(loseToAgrosh);
	CombatManager.displayLocation("AGROSH");
	CombatManager.beginCombat();
}

//PC Defeats Agrosh
public function defeatAgrosh():void
{
	showArdiaAndAgrosh();
	author("Savin");
	output("The huge green bruiser stumbles back, grunting and sputtering. No matter what you do to him, though, the tent in his overalls just gets bigger and bigger, threatening to burst free if you keep this up. There’s no need to, though - Agrosh slumps down onto a knee, breathing hard between his tusks, looking up at you with a mix of defiance and desire.");
	output("\n\n<i>“Fuck, it’s getting hot in here,”</i> he breathes, wiping the sheen of musky sweat from his face on the back of a sleeve. Somehow, you aren’t convinced he’s talking about the temperature.");
	output("\n\nIt doesn’t look like the foundry’s deck chief has any fight left in him. While you have the chance, you grab some wire off his utility belt and drag him over to the wet bar, tying his hands together behind one of the bar stools. Strong as he is, these things are all bolted down to the floor - no getting out for him.");
	output("\n\nThe dusky dzaan girl peeks her head up from behind cover, glancing down at your defeated foe. <i>“Woah, you actually did it!”</i> she says, relief clear in her voice. She adjusts the tight slave collar around her neck, chewing on a lip. <i>“But there’s still so many of these bastards... if they find him like this, his friends will go apeshit.”</i>");
	output("\n\n" + (flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined ? "Ardia shakes the thought out of her head. <i>“I’m just glad to be free for a minute, though! Thank you so much, [pc.name]... I’m glad he picked you out of the bunch!":"The woman shakes her head, trying to put the thought aside. <i>“I’m just glad to be free while it lasts, though! I’m Ardia, by the way... he was about to be my first, um... job here on the station. I’m real glad you came along when you did.") + " Is there anything I can do to help you?”</i>");
	output("\n\nArdia’s got a point: if somebody finds the foundry master tied up, it’s not going to go well for either of you. You consider it a moment before telling Ardia, <i>“Stay here with him. If anybody comes in, make it look like you just fucked him into a stupor.”</i> With a body like hers, it’s an easy lie to believe.");
	output("\n\n<i>“Okay, I can do that!”</i> she says, flashing you a sly little grin. <i>“He looks dumb enough to get himself hooked on a dzaan, so... yeah, okay, I’ll stay here and keep an eye on him. Just... if you find a way to get these collars off, come back for me, okay?”</i>");
	if(pc.isNice()) output("\n\nOf course.");
	else output("\n\nYou’ll think about it...");

	//For now, though, what do you want to do?

	processTime(15);
	output("\n\n");
	flags["AGROSH_WHUPPED"] = 1;
	CombatManager.genericVictory();
	//[Next]
	//to room descript. Add [Ardia] and [Agrosh] buttons.
}

//PC Loses to Agrosh
public function loseToAgrosh():void
{
	showAgroshAndArdia(true);
	author("Savin");
	output("A punch lands squarely on your chin. And then another. And then <i>another</i>. You stagger backwards under the repeated impacts, dropping your [pc.weapon] as you do so.");
	output("\n\n<i>“Good!”</i> Agrosh growls, grabbing your neck and shoving you up against the door. <i>“But that’s enough foreplay. Better hope your ass is ready for the main course.”</i>");
	output("\n\nThe thraggen man leans in, taking a deep, long sniff along your neck. One of his tusks scrapes your [pc.skin], making you squirm with the sudden pain. That just makes him hornier, and soon you’ve got a rock-hard thaggen dick pressing against your thigh to accompany the forgemaster’s hot breath across your skin. <i>“You belong to me now,”</i> he growls, ripping your gear away. <i>“You and that dzaan slut... yeah, me and the boys are gonna have fun with you. But first, since you had to go and struggle, I’m claiming first use of both of ya.”</i>");
	output("\n\nA big, rough hand wraps around your neck and throws you across the room. Your back crashes into the couch, leaving you reeling while Agrosh pulls his overalls off, exposing a body covered in thick, curling black hair and scarred green skin. His cock and balls look human, if writ large on his nearly eight-foot frame, and colored a green so dark it’s nearly black. He grips his dick in one hand, stroking it slowly as he walks over to the bar. Agrosh grabs a bottle from the back, takes a swig, and then reaches down behind the bar.");
	output("\n\nHe comes back with the dzaan girl from before, holding her by the collar. She squeals, kicking and flailing as Agrosh drags her over to the couch and throws her down beside you.");
	output("\n\n<i>“That’s better,”</i> he growls. The thraggen closes the distance, shoving his way onto the couch between you and your dusky fellow-slave. A hand grabs your head and the girl’s, pushing you both down towards Agrosh’s crotch. <i>“Now get to work. I’ve got a serious fucking battle-boner that needs tending.”</i>");
	output("\n\nThe dzaan locks you with her sky-blue eyes, and though you’re separated by a pillar of dark green dickmeat, you hold each other’s gaze for a long moment. There’s a dare in your companion’s eyes, perhaps a plea to go first; sweat beads around the keratin crown above her eyes. Agrosh’s grip tightens painfully, reminding you that your new master has no time or patience for your games now. With a groan, you let your [pc.tongue] reach out and lap along his great length.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",badEndToAgrosh2);
}

public function badEndToAgrosh2():void
{
	clearOutput();
	showAgroshAndArdia(true);
	author("Savin");
	if(flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined) output("Ardia");
	else output("The dzaan");
	output(" follows your example a moment later, leaning up to get her lips around the forgemaster’s dark crown. He pushes her head straight down, displacing you and thrusting his dick down her throat. The girl’s eyes go wide, tearing up as she gags on it, before the hand holding her down finally relents. When she comes up for air, she leaves a sheen of spittle behind on Agrosh’s cock, which you’re soon tasting at the thraggen’s insistence.");
	output("\n\nYou lick, the girl sucks, and together you’re able to get the forgemaster’s cock nice and wet. The thick veins along its length throb, rising up like ridges beneath your [pc.tongue]. Agrosh grunts approvingly, rolling one of your partner’s floppy elfin ears between finger and thumb. <i>“That’s right, slaves... learn howta work that dick. You’re gonna be seeing an awful lot of it from now on...”</i>");
	output("\n\nRather than making you finish him off, though, the brawny technician shoves you off his lap and stands, pushing the dzaan girl face-down on the cushions and ripping open the butt-zipper of her slave uniform. He reveals a pair of full bronze cheeks, and a moment later, a plump sack of balls and a keratin-nubbed dick falls out between " + (flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined ? "Ardia":"the dzaan") + "’s legs.");
	output("\n\n<i>“Get her ready,”</i> Agrosh growls, shoving you towards her butt. Your face ends up shoved into the crevasse between the girl’s cheeks, nose smeared with her unwilling arousal; it takes some effort to pull yourself out of her thick behind, and shoot a glance up to its owner.");
	output("\n\n" + (flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined ? "Ardia":"The dzaan") + "’s face is flushed darkly. <i>“I-it’s okay,”</i> she murmurs. <i>“Just do what he says...”</i>");
	output("\n\nYou don’t have much choice in the matter, but her hesitant consent is enough encouragement to get you started before the thraggen forces you. You reach your [pc.tongue], out to the dusky gulf of her clean-shaven cunt; you push her dark balls out of the way, letting your tongue slip into the slit that would normally be hidden beneath them. She’s wet around the lips, making it easy to spread them apart around your probing muscle. A shuddering whimper of pleasure escapes her lips, accompanied by a twitch of her dick and a clench of her inner walls around you.");
	output("\n\n<i>“Hurry up,”</i> the forge master barks. <i>“I ain’t waiting all day to plow my new property. Or are you wanting to go first?”</i>");
	output("\n\nYou bury your face in deeper, licking faster, obeying almost before you can think. " + (flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined ? "Ardia":"The dzaan") + " moans, digging her fingers into the cushion. She tries to stay quiet, to not give away the effect you’re having on her, but her body betrays her at every turn. A few moments more and she’s leaking from cunt and cock alike, pushing her ass back against your face and grinding her pussy on your [pc.lipsChaste].");
	output("\n\nAgrosh laughs. <i>“She’s enjoying it! Har, what a whore... Get the fuck out the way.”</i>");
	output("\n\nA pair of rough hands grab your shoulders, throwing you roughly to the ground. You’re left to watch as the towering thraggen saunters up behind " + (flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined ? "Ardia":"the girl") + " and unceremoniously slams his spit-shined cock into her twat. She squeals, biting her lip and digging her nails into the sofa as the tech’s dick sinks inside her. Before long his balls are slapping pendulously against hers, milking out thick streams of pre that smear across the dzaan’s thighs. He spanks her ass and gropes her tits, exploring every inch of vulnerable dark flesh.");
	output("\n\n<i>“Picked a good one,”</i> Agrosh grumbles to himself. His hips keep thrusting, pounding away at his slave’s backside. <i>“Never find a thraggen woman this fat and soft. Yeah! Or one that sits there and takes a dickin’ like a proper slut. Ain’t got a lick of fight in you, do ya?”</i>");
	output("\n\nThere’s no words in answer, only a whorish moan. You slowly pick yourself up off the ground, wondering for a moment if you can escape while the thraggen’s busy fucking, but that hope is quickly dashed when the door slides open. A group of grease-covered men in heavy work clothes pile inside, laughing amongst themselves.");
	output("\n\nThey treat you like part of the furniture.");
	output("\n\nThe gang passes by the couch with a few hellos to the chief, a slap on the back, and then on to the bar. One of them, a burly blond ausar, grabs you nonchalantly from the floor and drags you up to a barstool. He sits, you kneel, and pretty soon his beefy red rocket is in your mouth.");
	output("\n\n<i>“Finally got our due, eh boss?”</i> one of the pirates jeers, slapping the back of your head. <i>“All these slaves and they couldn’t spare a couple for us worker bees ‘till now?”</i>");
	output("\n\n<i>“Had to fight for ‘em, too,”</i> Agrosh chuckles. <i>“Literally! Har har!”</i>");
	output("\n\nSomebody notices you discarded [pc.weapon] on the ground and picks up it, examining your surrendered hardware. You can just see him out of the corner of your eye, around the bulb of the ausar’s knot dominating your view while you worship his balls. The worker takes it with him out of the room when he’s finished his drink.");
	output("\n\nThe only drink you get is the ausar’s salty spunk, squirting down your throat a few minutes later. He grunts, pats your head, and shoves you off his dick - and right into the arms of another pirate. You have a moment of freedom to see that Agrosh has finish with his new dzaan cum-dump, leaving a waterfall of white leaking from her abused cunt and down her uniform leggings. The chief saunters over, dick still hanging out, and wipes the last drippings of his orgasm off on your [pc.face].");
	output("\n\n<i>“I get first go at [pc.hisHer] [pc.vagOrAss],”</i> the thraggen growls, pulling you back to the sofa before another pirate can get at you. <i>“Right of conquest.”</i>");
	output("\n\n<i>“Damn thraggens,”</i> the deprived pirate sighs.");
	output("\n\nYou end up face-down in the couch, next to your fellow slave. She gives you a weary look with those baby blues of hers, and you feel her hand clutch yours a moment before a pillar of throbbing green dickmeat slams into your [pc.vagOrAss]. You suck in a sharp breath, catching in your throat before it can turn into a cry of pain and pleasure from the sudden violation. Agrosh breaks the dam your silence with a hard slap across your [pc.butt]; you scream, arching your back and clawing at the couch as the huge thraggen relentlessly pounds you.");
	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	pc.loadInMouth(enemy);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEndToAgrosh3);
}

public function badEndToAgrosh3():void
{
	clearOutput();
	showAgroshAndArdia(true);
	author("Savin");
	output("You lose track of how many times Agrosh cums in you. Mouth, ass" + (pc.hasVagina() ? ", and pussy":"") + " - it’s all the same to him. The man’s insatiable, and never tires of making you and you fellow slave scream for him. Cum leaks freely from you, smearing your [pc.legOrLegs] and the pooling on the couch beneath you.");
	output("\n\nWhen he’s finally done, withdrawing himself from your battered [pc.vagOrAss] amidst a deluge of white, Agrosh is merely replaced with another pirate who’s more than willing to take sloppy seconds on you. Somebody’s already claimed the girl next to you, and more pirates are piling in as word of the new fuck-slaves spreads through the foundry.");
	output("\n\nThere’s no rest for you. Even when you pass out from exhaustion, you eventually wake up to the familiar feeling of dicks pumping into you. Sometimes over the next few days, you’re lucky enough to be given a proper meal, though it’s never without a <i>“price”</i> in dicks sucked or pussies eaten. Beyond that, time loses all meaning; there’s no clock or holoscreen in the bar, and you’re deprived of your Codex and other utilities. What does a cumdump need with a computer?");
	output("\n\nEventually, you hear something about a big Steele Tech transport being raided. Another slave joins your pen shortly thereafter, bringing news of a new CEO and the passage of months since you were last seen. You don’t have time to lament your loss before Agrosh saunters in and rams himself up your tailpipe to celebrate the end of his workday.");
	output("\n\nHe’s the first of many this shift...");
	processTime(60*8);
	badEnd();
}

//Interactions in the Bar
public function foundryLoungeBonus():Boolean
{
	if(flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined || flags["AGROSH_WHUPPED"] != undefined) output(", and the big, burly thraggen technician you’ve tied up to one of the bar stools");
	output(".");
	if((flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined || flags["AGROSH_WHUPPED"] != undefined) && ardiaInZhengShi()) 
	{
		output("\n\nArdia is sitting on the stool over him, enjoying some of pirates’ most expensive whiskey. Her lengthy ears perk up at your approach, followed by a shy little smile on her cyan lips.");
		addButton(0,"Ardia",ardiaApproach,undefined,"Ardia","Go talk to the freed dzaan.");
	}
	return slaveLoungeAgroshProc();
}

//[Ardia]
//Go talk to the freed dzaan.
public function ardiaApproach(back:Boolean = false):void
{
	clearOutput();
	showArdia();
	author("Savin");
	if(back) output("Is there anything else you’d like to do with Ardia instead?");
	else output("<i>“Hey, [pc.name]!”</i> Ardia says as you [pc.walk] over to the bar. She shifts in her seat, resting a leg on the insensate forge-master’s head. <i>“All’s quiet here. How are you doing; any closer to taking these slavers out?”</i>");
	processTime(1);
	ardiaMenu();
}

public function ardiaMenu():void
{
	clearMenu();
	addButton(0,"Talk",talkToArdia,undefined,"Talk","Swap some words with the liberated pleasure slave.");
	addButton(1,"Relax...",relaxWithArdia,undefined,"Relax...","The lounge is here for relaxation, right? Take a break for your adventures with Ardia.");
	addButton(2,"Appearance",ardiaAppearanceScreen);
	addButton(5,"Give Mod",giveArdiaAMod,undefined,"Give Mod","Introduce Ardia to the wonders of mods.");
	addButton(14,"Leave",mainGameMenu);
}

//Talk
//Swap some words with the liberated pleasure slave.
public function talkToArdia(back:Boolean = false):void
{
	clearOutput();
	showArdia();
	author("Savin");
	if(back) output("Ardia smiles at you as you consider your options.");
	else
	{
		output("You take a seat at the bar next to Ardia and ask if she wouldn’t mind talking for a bit.");
		output("\n\nShe smiles, leaning on the faux-wood. <i>“Well, doesn’t look like we have a bunch of randy pirates breathing down our throats, so... sure! What’s on your mind, [pc.name]?”</i>");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Her Story",ardiasStory,undefined,"Her Story","How’d Ardia end up here?");
	addButton(1,"Other Slaves",otherSlavesInTheBase,undefined,"Other Slaves","What can she tell you about the other slaves here in the base?");
	addButton(2,"Pirate Info",pirateInfoDumpFromArdia,undefined,"Pirate Info","Ask about the pirate gangs working on Zheng Shi.");
	addButton(3,"Escape!",ardiaGetToTheChoppaIMeanShip,undefined,"You've freed both groups of slaves, so it's time to get Ardia the hell out of here.");
	addButton(14,"Back",ardiaApproach,true);
}

//Her Story
//How’d Ardia end up here?
public function ardiasStory():void
{
	clearOutput();
	showArdia();
	author("Savin");
	output("<i>“How did you end up here?”</i> you ask her. <i>“Did the pirates kidnap you?”</i>");
	output("\n\nArdia nods slowly. <i>“Yeah, right off my homeworld. The part of Hauâ Mai I grew up on is basically one island-wide resort, a real magnet for wealthy tourists looking for a beaches and jungle getaway. I thought I’d be safe from this kinda thing, until I made the mistake of joining a mission trip to one of the, uh, less civilized part of the planet. I’d heard slavers target the dzaan tribes that still choose to live out in the jungles like they’re still on the homeworld, but we had a bodyguard at our camp and took as many safety precautions as we could. Wasn’t enough, I guess! Middle of the night, a ship comes in and orbits the village we were staying with. Lots of screaming, blinding lights, pirates flying down on jetpacks and grabbing people. Most of the missionaries got out okay, but I guess I was just the slowest tillabeast in the herd. Some big bastard in orange armor came out of the sky, grabbed me by hips, and jump-jetted me away to his ship.”</i>");
	output("\n\n<i>“I wish I could say I’d gone back to try and save some little kid, or put out a fire or something... but honestly, I just tripped and fell on my dumb face. Shoulda listened to my mom and stayed in shape, but instead I spent my formative years focusing on the softer kinda figure-building,”</i> Ardia half-laughs, patting a hand on her soft belly, just beneath the full mounds of her F-cup tits. <i>“Besides, dzaan legs just weren’t made for running.”</i>");
	output("\n\nShe wiggles her toes on top of Agrosh’s head, drawing your attention to the balls-down build of her feet. It’s like she’s perpetually wearing stilettos, but with nothing to support her heels. Yeah, it’s hard to imagine any dzaan marathon runners built like that.");
	output("\n\nArdia laughs, <i>“Yeah, there’s a reason we came up as a pleasure-oriented culture instead of like, warriors or science-based or whatever... and I guess every pirate gang in the galaxy figures we must be real <b>good</b> at the whole pleasure thing. Buncha racists!”</i>");
	if(flags["SEXED_ARDIA"] != undefined) output("\n\nTo be fair, she is <i>really</i> good at fuckin’. The comment just earns a little grin from her cyan lips. <i>“I didn’t say they were wrong...”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToArdia,true);
}

//Other Slaves
//What can she tell you about the other slaves here in the base?
public function otherSlavesInTheBase():void
{
	clearOutput();
	showArdia();
	author("Savin");
	output("<i>“What do you know about the other slaves here on the base?”</i>");
	output("\n\nArdia’s first response is a helpless shrug. <i>“Not much. They kept me up near a ship bay, in a rocky chamber with a few dozen other slaves, until they moved me and a bunch of other, ech, ‘pleasure slaves’ down towards the core. We were supposed to be going down through that huge ship outside to the leaders of this place, until Agrosh here picked " + (flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined ? "me":"the two of us") + " out of the line... so I guess there’s another bunch of slaves being held in the command levels.”</i>");
	output("\n\n<i>“We’re treated like dirt here, like we’re not even people. The labor slaves have it worse, of course, but being a pleasure slave has to be its own kind of hell... I’m so thankful you saved me before Agrosh could really do anything to me! Just thinking about what would have been my life here makes me shudder!”</i>");

	if(flags["MAIKE_SLAVES_RELEASED"] == 1 || flags["MAIKE_SLAVES_RELEASED"] == 2)
	{
		output("\n\n<i>“Don’t worry, I freed the mine slaves,”</i> you tell her.");
		if(flags["MAIKE_SLAVES_RELEASED"] == 2) output(" <i>“The pleasure slaves up top are all free too.”</i>");
		if(flags["MAIKE_SLAVES_RELEASED"] != 2) output("\n\nArdia beams. <i>“That’s great! The more slaves you free, the better! Make these evil bastards really feel it, [pc.name].”</i>");
		else output("\n\nThe dzaan sighs with relief and leans back against the bar. <i>“I think that’s both major blocks of slaves freed, then! Those pirate bastards are gonna be feeling that hit for a long time! So, what’s our next move?”</i>");
	}

	flags["ARDIA_TALKED_SLAVES"] = 1;

	processTime(7);
	clearMenu();
	addButton(0,"Next",talkToArdia,true);
}

//Pirate Info
//Ask about the pirate gangs working on Zheng Shi.
public function pirateInfoDumpFromArdia():void
{
	flags["ARDIA_GOT_INFODUMP"] = 1;
	clearOutput();
	showArdia();
	author("Savin");
	output("<i>“You’ve been here longer than me. Learned anything interesting about the pirates?”</i>");
	output("\n\nArdia thinks for a moment. <i>“Well, there’s lots of gangs here. This place is like some sort of pirate haven, a neutral ground for a bunch of different groups. I got captured by the Star Vipers, a bunch of real nasty pieces of work that love their drugs and poisons. I must have gotten stuck with twenty needles before you found me! They’re the ones that take the most pleasure slaves, from what I heard. Then there’s the Cyber Punks, real original guys that love their cybernetic augments and limbs. Rat’s Raiders are probably the least evil, they’re just thieves... though they try and make themselves look altruistic, I don’t buy it. The Corona Lords are psychos that love radiation and plasma... I can’t believe they don’t all kill themselves with the getups they run around in.”</i>");
	output("\n\n<i>“The leaders of the bunch are the Jumpers. They’re laquine bushwackers that love themselves some latex and bondage gear... and jump jets. I think some of them were working with the Vipers that kidnapped me, since I got picked up by a guy with a jetpack.”</i>");
	output("\n\nArdia scowls, rubbing at her hip-hugging uniform. <i>“I can’t believe so many different groups are working together as well as they are. Enough to start building that new starship outside... who would have thought pirates could build their own ships! That’s a whole new danger I’d never have thought about before... I figured pirate ships were all stolen.”</i>");
	if(pc.isMischievous()) output("\n\n<i>“Well, they had to start somewhere I guess.");
	else output("\n\n<i>“Not anymore.");
	output(" Anyway, learn anything about their leadership?”</i>");
	output("\n\n<i>“No,”</i> Ardia admits. <i>“Everybody’s ‘boss this’ and ‘chief that.’ Heck, I don’t know if half the pirates even know who they work for. I know the Jumpers are the top gang, so whoever is in charge of them is probably the king of douche mountain here. And he’s on the other side of the new ship there... somewhere.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToArdia,true);
}

//Relax...
//The lounge is here for relaxation, right? Take a break for your adventures with Ardia.
public function relaxWithArdia():void
{
	clearOutput();
	showArdia();
	author("Savin");
	output("You lean against the faux-wooden bar, eying up the pretty young dzaan in her skin-tight latex. With a little grin, you tell her that after all you’ve been through here, it’s about time you took a break for some relaxation. That’s what this lounge is for, isn’t it?");
	output("\n\n<i>“You certainly deserve it,”</i> Ardia smirks. She leans over the bar in such a way that has her big breasts spill out across it, picking out a pair of mugs and sets them between you. <i>“So, what’s your poison, [pc.name]? Just about anything you can dream up is on tap...”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Ausar Chaser",chooseAnArdiaDrink,"Ausar Chaser","Ausar Chaser","A favorite of Ausars, galaxy-wide!");
	addButton(1,"Mini Rahn",chooseAnArdiaDrink,"Mini Rahn","Mini Rahn","A jello shot! No gel or goo creatures were harmed making this delicious, sweet drink.");
	addButton(2,"Honey Mead",chooseAnArdiaDrink,"Honey Mead","Honey Mead","Honey-based mead.");
	addButton(3,"Her",chooseAnArdiaDrink,"Her","Her","You’ve got your eyes on the prettiest drink in this place...");
	addButton(14,"Back",ardiaApproach,true);
}

//[Her]
//also add Ausar Chaser, Mini Rahn, and Honey Mead drinks.
public function chooseAnArdiaDrink(drink:String = ""):void
{
	clearOutput();
	showArdia();
	author("Savin");
	if(drink != "Her")
	{
		output("<i>“Coming right up!”</i> Ardia sings, bouncing over to the liquor rack and selecting the ingredients. <i>“I grew up on a spacer resort, y’know. My mom was a bartender, so this is like second nature to me. Gimme just a sec.”</i>");
		output("\n\nThe dusky dzaan spends a few moments mixing your drink before pouring it into both your mugs and returning to her stool. Agrosh grunts as one of her legs props up on top of his head, and Ardia raises her mug to you. <i>“Cheers, [pc.name].”</i>");
		output("\n\n<i>“Cheers.”</i>");
		output("\n\nYour mugs click together, and soon you’re both draining them dry. When she’s finished her drink, Ardia sighs with contentment and sets the empty mug aside, watching you as you quaff down the last of your drink. Her sky-blue eyes dance over you for a moment, but as soon as your mug hits the bar, her cheeks flush a bit and she looks away, suddenly very interested in some trophy hung on the wall.");
		if(drink == "Ausar Chaser")
		{
			pc.imbibeAlcohol(15);
			if(pc.isAusar()) pc.energy(5);
		}
		else if(drink == "Mini Rahn")
		{
			pc.imbibeAlcohol(13);	
		}
		else if(drink == "Honey Mead")
		{
			if(pc.hasStatusEffect("Mead"))
			{
				if(pc.statusEffectv2("Mead") < 7) {
					pc.addStatusValue("Mead",2,1);
					pc.physiqueMod++;
					pc.aimMod-= .5;
					pc.reflexesMod-= .5;
					pc.intelligenceMod-= .5;
					pc.willpowerMod-= .5;
					pc.lust(5);
				}
				else output("\n\nYou’ve gotten as much from the mead as you’re going to get.");
			}
			else 
			{
				pc.createStatusEffect("Mead",0,1,0,0,false,"Icon_DizzyDrunk","Alcohol isn’t good for you, but you do feel a little stronger and more confident.",false,180);
				pc.physiqueMod++;
				pc.reflexesMod-= .5;
				pc.aimMod-= .5;
				pc.intelligenceMod-= .5;
				pc.willpowerMod-= .5;
				pc.lust(5);
			}
			pc.imbibeAlcohol(10);
		}
		processTime(10);
		clearMenu();
		addButton(0,"Next",relaxWithArdia);
	}
	//Her
	//You’ve got your eyes on the prettiest drink in this place...
	else
	{
		showArdia(true);
		output("<i>“Anything?”</i> you ask her, a lustful smile playing across your [pc.lipsChaste].");
		output("\n\n<i>“For you?”</i> Ardia answers, leaning in. Her breasts heave forward, swaying pendulously under her uniform’s tight embrace. <i>“Anything at all...”</i>");
		output("\n\nSounds like Ardia’s on tap today. You close the distance between you, cupping the dzaan girl’s bronzed-brown cheek and brushing a lock of cyan hair from her visage with your thumb. She smiles softly, nuzzling against your hand until you lean in and kiss those baby blue lips of hers. Your tongue plays across them, and Ardia’s hand meets yours, slowly guiding it down from her cheek to something even softer, a double-handful of tender flesh encased in tight latex that lets you feel the peak of her nipple stiffening up. You give her boob a gentle squeeze, then a rougher one, enough to make Ardia moan into your mouth and admit your [pc.tongue].");
		output("\n\nWhile you kiss and grope her, your hands find their ways to the zippers over her breasts, pulling them down to let her mountainous F-cups spill free and into your grasp. There’s a little gasp, and then Ardia’s hands are on you as well, tearing away your gear as you peel the lush dzaan out of her latex uniform. When her top is off, peeled down around her waist, Ardia slips back off the stool - and out of your grasp. She pivots on the ball of an arched foot, presenting her lush posterior to you, all bound up in that sinfully tight orange-and-blue that stretches and strains around her plush behind.");
		output("\n\nArdia wiggles her hips and squeezes a handful of butt, spreading herself out so much that you can see the outline of her labia and asshole through the latex. That’s all the teasing you can stand - you lunge forward, hooking your fingers through the hips of the buxom dzaan’s uniform and yanking it down around her ankles. You’re instantly rewarded with a face-full of brown bottom pushing back against you, followed by a fleshy slap of the alpha-girl’s balls on your chin. Her keratin-nubbed member dangles between her thick thighs, already crowned with a murky white bead.");
		output("\n\nWith another shake of her hips, Ardia kicks off her uniform and grips the edge of the bar with her ass thrust back to you. <i>“Eat up,”</i> she purrs.");
		processTime(10);
		pc.lust(15);
		clearMenu();
		addButton(0,"Eat Her Out",eatOutArdia,undefined,"Eat Her Out","Munch on Ardia’s proverbial rug.");
	}
}

//[Eat Her Out]
//Munch on Ardia’s proverbial rug.
public function eatOutArdia():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You plant your hands on the dzaan’s presented cheeks, spreading them apart. Your fingers sink deep into her lush bronzed flesh, squeezing until the lush dark lips of her pussy wink for you, glistening with her growing arousal. A lick across her plump mons is enough to earn a throaty moan from Ardia and a clench of her lower lips, squeezing out a thick trickle of her juices that you’re quick to lap up, letting it guide you from her mound to her entrance, and into the pink folds between them.");
	output("\n\n<i>“Oh!”</i> Ardia gasps, knuckles going white as your tongue explores her pussy. <i>“Oh, that’s good...”</i>");
	output("\n\nHer hips push back against your [pc.face], urging more and more of your [pc.tongue] into her while your face is buried beneath her dusky cheeks. Her plush ass bears down on you, letting you feel all the jiggly weight of it overwhelming you. It’s a struggle to stay on your [pc.footOrFeet], like the dzaan’s trying to push you down on the deck with just her ass. Instead, you push back, shoving Ardia against her erstwhile seat and letting your hands wander from rump to balls, cupping the pair of plump orbs hanging from just above her quim.");
	output("\n\nArdia’s balls are bigger than any normal human’s could ever be, a pair of apple-sized spheres full of churning aphrodisiac seed hanging low beneath her stiff dick. Yet despite their size, they feel so <i>soft</i>, like all that cum inside is free-floating inside her, letting you sink your fingers in and knead her sack between them. The alpha’s voice sings with pleasure, a chorus of moans as her pussy clenches around your [pc.tongue]. You can’t see her cock from where you are, lodged between Ardia’s asscheeks as you are, but you can sure <i>feel</i> it starting to jump and throb as your hands work her nads over.");
	output("\n\n<i>“I can’t tell which I like more,”</i> Ardia moans, reaching down and wrapping her hands around her shaft. <i>“Getting eaten out, or feeling you loving on my alpha side... mm, help me make a decision, [pc.name]?”</i>");
	output("\n\nWell, you can sure tell which of her genitals <i>you</i>’re most interested in...");
	processTime(10);
	pc.lust(15);
	pc.girlCumInMouth(ardia);
	clearMenu();
	//[Her Pussy] [Her Balls]
	addButton(0,"Her Pussy",worshipArdiasSilkyCunny,undefined,"Her Pussy","Keep worshipping Ardia’s pussy until the curvy alpha cums all over herself.");
	addButton(1,"Her Balls",worshipArdiasBalls,undefined,"Her Balls","Worship those fat balls hanging low under Ardia’s cock.");
	if(flags["SEXED_ARDIA"] == undefined || (flags["SEXED_ARDIA"] != undefined && flags["SEXED_ARDIA"] < 3)) addDisabledButton(2,"Her Butt","Her Butt","You’re not quite ready to leap tongue-deep into her ass. Maybe once you’ve played with Ardia more.");
	else
	{
		//[Her Butt]
		if((pc.hasCock() && pc.cockThatFits(ardia.analCapacity()) >= 0) || pc.hasHardLightEquipped()) 
		{
			addButton(2,"Her Butt",cockSelect,[worshipArdiasButtYouSluuuut,ardia.analCapacity(),true,0],"Her Butt","Ardia’s body is so lush and soft, it’s hard to decide what you like best... but you gotta say, it’s her jiggling butt that gets you hardest.");
		}
		else if(pc.hasCock()) addDisabledButton(2,"Her Butt","Her Butt","You need a penis or hardlight strapon <b>that fits</b>!");
		else addDisabledButton(2,"Her Butt","Her Butt","You need a penis or hardlight strapon to go down this road...");
	}
}

//[Her Pussy]
//Keep worshipping Ardia’s pussy until the curvy alpha cums all over herself.
public function worshipArdiasSilkyCunny():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You shift your hands off her [ardia.balls], letting them rest under their own hefty weight; your attentions find their way to her pussy, rubbing at the bud of Ardia's clit and pushing a pair of fingers inside to accompany your wiggling tongue. You're able to start really spreading her open now, using your fingers to stretch her lips and let loose another trickle of pent-up lubrication. Ardia's thighs are getting messy now, slicked with precum from both her sexes.");
	output("\n\nIt isn't long before those alien legs of hers start trembling, followed by a crack in her voice. Her pussy's muscles squeeze your fingers and tongue with desperate need as if she could wring an orgasm out of you through force alone. Her poor balls tremble with swelling seed, now languishing without your caressing touch. Ardia strokes herself off as fast as she can now, her huge chest heaving with her quickening breath.");
	output("\n\nAll you need to do is keep licking, lavishing every inch of juicy dzaan cunny with oral love, enjoying your liberated lover's exotic taste until she's ready to burst... which isn't very long at all. Ardia tenses, squeezing down hard on your [pc.tongue] as her juices flow freely around you. A second later and there's a lurid, wet sound from around the bergs of Ardia's ass, and you're assailed by the potent smell of wasted cum spilling down onto the floor between her feet. Ardia shudders and moans weakly as your tongue and fingers (and her own jacking hand) milk the cum from her virile sack.");
	output("\n\n<i>“Whew, I needed that!”</i> Ardia moans, arching her back at an inhuman angle. Her plush rump jiggles as you slowly extract yourself from her ass, cheeks and chin smeared with her juices. The curvy dzaan pivots on a heel and sits herself back down with legs spread to show her cum-soaked thighs and glistening " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine ":"") + "cockhead. Her [ardia.balls] look just as full as ever, though, and with a husky whisper, Ardia says, <i>“But I don't think that's all you wanted, was it?”</i>");
	output("\n\nNot even close...");

	pc.girlCumInMouth(ardia);
	processTime(15);
	pc.lust(15);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(ardia.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",cockSelect,[fuckArdiasCunt,ardia.vaginalCapacity(0),false,0],"Fuck Her","Slam your dick into Ardia’s cunt and pound the wanna-be alpha until she’s a screaming, cum-soaked mess.");
		else addButton(0,"Fuck Her",fuckArdiasCunt,pc.smallestCockIndex(),"Fuck Her","Slam your dick into Ardia’s cunt and pound the wanna-be alpha until she’s a screaming, cum-soaked mess.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis for this!");
	addButton(1,"Suck Her",suckArdiaDownSloot,undefined,"Suck Her","Go down on Ardia’s cum-drooling tool and get a fad load of her jizz.");
}

//[Her Balls]
//Worship those fat balls hanging low under Ardia’s cock.
public function worshipArdiasBalls():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You can just catch glimpses of her dick, sandwiched between Ardia's asscheeks as you are, but stars above that " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "arm-thick slab of black horsemeat" : "nine-inch keratin-nubbed cock") + " looks tasty. You force yourself out of the intoxicating folds of Ardia's pussy and transition your [pc.lips] to suckling on the weighty mountains of the dzaan's balls.");
	output("\n\n<i>\"Ah, there's the beta instinct!\"</i> Ardia giggles, stroking her cock slowly while you kiss and suck on her sack. <i>\"Or am I just intoxicatingly alpha? That's what my sire used to say to all her harem girls... cuz she owns a bar, see? It was -- ah! -- f-funny!\"</i>");
	output("\n\nYou'd laugh if you weren't so busy worshipping the [ardia.balls] hanging beneath Ardia's dick. Instead, you wrap your [pc.tongue] under her sack, trying to lift them up but failing due to the sheer weight of her masculinity; all you manage to do is divide her two orbs, letting them sway on either side of your tongue while you massage the taut skin between them. Ardia moans and grinds her hips back against your face, urging you to work faster lest you suffocate in her massive ass. ");
	output("\n\nBetween her moaning your name and shaking that ass, you get the lustful dzaan to bend over more, exposing more ballsflesh and dick for you to work with. Your hand wraps around the base of her shaft, letting your fingers run across the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "rigid, bestial veins":"smooth bulbs of keratin") + " all along her throbbing length as you start to stroke her off. Slowly, your mouth works its way from balls to cock, kissing the prominent " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "medial ring":"vein") + " on her underside and letting your [pc.tongue] run down to her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "slick flare":"dark crown") + ". Her pussy lips drag along the tip of your nose, smearing your [pc.skinFurScales] with her fragrant juices. The sexual smell overwhelms your senses for a moment, leaving you a beast of mindless lust until Ardia's own moans remind you of your task -- you're working for her pleasure before your own here.");
	output("\n\nAnd you're clearly having an effect. Ardia's breath comes in shuddering gasps, making her butt jiggle and you can hear her tits slapping her dusky flesh from above. She's so deliciously thick that every gasp and moan sends ripples through her gropable body, coming faster and faster as you worship the liberated libertine's dick from stem to crown until finally you feel it tensing. Her pussylips squeeze around your nose and her balls clench hard, presaging the oncoming eruption. A final gasp heralds it, a heartbeat before you hear the wet squirt of cum splattering on the deck, and then smell the rich masculine scent of wasted seed. Thick streaks of it paint Ardia's thighs, joining with the rich nectar of her womanhood as the orgasm rocks straight through her soft body.");
	output("\n\n<i>\"Whew, I needed that!\"</i> Ardia moans, arching her back at an inhuman angle. Her plush rump jiggles as you slowly extract yourself from between her legs, cheeks and chin smeared with her juices. The curvy dzaan pivots on a heel and sits herself back down, legs spread to show her cum-soaked thighs and glistening " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "blunt ":"") + "cockhead. Her balls look just as full as ever, though, and with a husky whisper, Ardia says, <i>\"But I don't think that's all you wanted, was it?\"</i>");
	processTime(30);
	pc.lust(15);
	clearMenu();
	addButton(0,"Suck Her",suckArdiaDownSloot,undefined,"Suck Her","Go down on Ardia’s cum-drooling tool and get a fad load of her jizz.");
	addButton(1,"Ride Her",rideArdiasDickYo,undefined,"Ride Her","Climb into Ardia’s lap and ride that intoxicating cock of hers.");
}

//[Suck Her]
//Go down on Ardia’s cum-drooling tool and get a fad load of her jizz.
public function suckArdiaDownSloot():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You lower yourself down " + (pc.hasKnees() ? "on your [pc.knees]":"to the ground") + " and plant your hands on Ardia’s thick thighs, spreading them apart to give yourself a perfect view of her fat balls and slowly-softening cock both framed by cum-soaked bronzed flesh.");
	if (addictedToArdia()) output("\n\n<i>\"Good beta,\"</i> Ardia laughs, winking down at you. <i>\"Come get your reward.\"</i>");
	else if (immuneToArdia()) output("\n\n<i>\"Ohh,\"</i> Ardia laughs, <i>\"That's good. Gods, why couldn't you just want to be my beta, huh? I could use, like, twenty of you...\"</i>");
	else output("\n\n<i>\"You'd make a real good beta, you know? But... don't swallow too much, or you might just get addicted to me...\"</i>");

	output("\n\nYou can already taste her seed, sweet with just a hint of bitterness, and as your [pc.tongue] wraps around it a faint warmth starts to spread through your cheeks... and straight down to your loins. Mmm, and that's just the leftovers of her last orgasm! Already, your mind races with the hunger for more -- the desire to milk those meaty balls of hers dry and take all that precious cum for yourself.");

	if(!addictedToArdia() && !immuneToArdia()) output("\n\nYou shake yourself off - what are you thinking? That’s just her drugged-up sperm talking, not you... right?");
	else output("\n\nYou don’t even care that you’re a dirty cum-fiend in that moment: all your brain can process is your carnal desires!");

	output("\n\nYour [pc.lips] flicks across Ardia’s " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "blunt, animalistic tip":"dark crown") + ", teasing her cumslit with your tongue as you start to take her length. " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "Her horse-cock’s nice and long, nicely matched to all the other big swinging dicks this station has to offer, but":"Her cock’s not particularly long, at least compared to the other swinging dicks on offer around here, but") + " damn it’s sweet... and attached to a real sweetheart who looks down at you with a warm smile, " + (!pc.hasHair() ? "stroking your cheek":"running a hand through your [pc.hairNoun]") + " as you make your way down. " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "Every inch that passes your lips feels like a victory, a step closer to becoming the girth-strained, cum-drunk cock-sock that you very much want to be.":"Every one of her keratin nubs that passes your lips feels like a victory, a step closer to your just dessert."));
	if(addictedToArdia()) output("\n\n<i>“Oh, look at you,”</i> Ardia murmurs, leaning back in her seat. <i>“God, you look beautiful down between my legs. I don’t even mind taking responsibility for you... my first beta. You’re so goooood, unf.”</i>");
	else output("\n\n<i>“That’s a good look for you,”</i> Ardia laughs, leaning back in her seat. <i>“Nestled down between my legs like a good beta. Don’t try <b>too</b> hard not to get hooked on my cum. I could really get used to this kinda treatment.”</i>");

	output("\n\nYour lover moans softly, and her thick thighs wrap around your shoulders and her legs cross behind your back, utterly enveloping your head in her lush flesh and smooth latex. Nowhere you’d rather be... especially with her twitching, leaking cock snugly in your mouth, getting ready to spill her sweet narcotics down your throat.");

	if(!addictedToArdia() && !immuneToArdia()) output("\n\nWait, getting ready to... shouldn’t you, " + (pc.isBimbo() ? "like" : "well") + ", pull her out first?");
	processTime(15);
	pc.lust(15);
	clearMenu();
	//[Swallow] [Jerk Her]
	if(addictedToArdia())
	{
		addButton(0,"Swallow",swallowArdiasYummyCumCummies,undefined,"Swallow","Addicts always swallow.");
		addDisabledButton(1,"Jerk Her","Jerk Her","Addicts always swallow.");
	}
	else
	{
		addButton(0,"Swallow",swallowArdiasYummyCumCummies,undefined,"Swallow","Tag a gut-full of Ardia’s drugged-up spunk.");
		addButton(1,"Jerk Her",jerkArdiaYaSlut,undefined,"Jerk Her","Use your hands, and let Ardia cum on your chest.");
	}
}

//[Swallow]
//Tag a gut-full of Ardia’s drugged-up spunk.
//Addicts always swallow.
public function swallowArdiasYummyCumCummies():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You just close your eyes and let your mouth follow your overpowering instincts: to suck cock. You work your tongue along her underside, teasing the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "tender folds of her sheath":"tender hard nubs") + " and letting your lips apply just the right amount of suction to drive your alpha wild. Her hips start moving before long, shoving herself deeper down your throat while her full balls rub against your chin. You can almost hear her seed sloshing around in there, ready to shoot deep in your belly if only you can coax it out.");
	output("\n\nShe’s as eager to have done with it as you are, pumping against your [pc.lips] with growing ardor. You could just sit back and take it at this rate, but you’re much too invested now to even think about it... or much at all, really. It’s hard to think about anything but Ardia’s cum, and how hungry for it you are now.");
	if (addictedToArdia() || immuneToArdia()) output("\n\n<i>\"Gonna... gonna give you what you want,\"</i> Ardia gasps, gritting her teeth. <i>\"Gonna cum!\"</i>\n\nYou're as eager for it as she is.");
	else output("\n\n<i>“L-last chance...”</i> Ardia gasps, gritting her teeth. <i>“Gonna cum...”</i>\n\nThe thought of pulling back never even occurs to you, especially as the first thick globs of dzaan spunk loll down your throat.");
	output(" Ardia gasps softly, clenching her legs around your shoulder as she cums. Her seed sends a wave of heat and excitement through you, a rush of energy that makes you cum just from tasting her" + (pc.hasCock() ? ", squirting your [pc.cum] all over your [pc.legs]":"") + ".");
	output("\n\nOh, stars.... That’s the stuff. Lethargy settles over you, a sleepy weight that makes you want to just curl up in your lover’s arms and suckle from her nubbed shaft all night long. Ardia has other plans, though, and gently pushes you off her cock; streamers of spittle and her spunk bridge your [pc.lips] to her crown, keeping you connected for just a moment longer before Ardia wipes her thumb across your lips, cleaning you off as her leglock eases off your shoulders.");
	if(addictedToArdia()) 
	{
		output("\n\n<i>“There you go... you needed that, huh?”</i> Ardia murmurs, lifting you up. She gives you a tender kiss, licking the last of her cum from you. <i>“Feeling better?”</i>");
		output("\n\nYou can only sigh contentedly, relishing the taste of your alpha’s addictive seed coursing through you once again.");
	}
	else if (immuneToArdia())
	{
		output("\n\n<i>\"You know, it's not bad... knowing that you can suck as much dick as you want without having to worry.\"</i> Ardia sighs, leaning back on her desk as you polish her off. She strokes your [pc.hair] and smiles, content to let you sate all of your whorish cocklust...");
	}
	else
	{
		output("\n\n<i>“Oh, I wish you hadn’t done that. I told you we dzaan are addictive, didn’t I?”</i> Ardia huffs. Nevertheless, she lifts you up and holds you close, letting you lean on her as her drugged-up spunk sinks in. <i>“Tsk. What am I gonna do with you if you get hooked on me?”</i>");
		output("\n\nYou don’t know... but you’d love to find out.");
	}
	processTime(15);
	pc.loadInMouth(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Jerk Her]
//Use your hands, and let Ardia cum on your chest.
public function jerkArdiaYaSlut():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("Okay, pull it together, Steele... and more importantly, pull it out! There’s a part of your brain that screams for you to swallow every drop of Ardia’s sweet, narcotic seed, but you force that thought down and pull your head back, letting Ardia’s dick drag down your chin. Your hands wrap around it instead, using the sheen of spit you’ve left on it as lube to glide up and down your lover’s " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "impressive ":"") + "length.");
	if(pc.biggestTitSize() >= 4) 
	{
		output("\n\nConsidering you’re denying the dzaan the pleasure of your throat, you figure the least you can do is put your [pc.boobs] to work for her. You rise up on your [pc.knees] and let her cock flop down into the valley of your cleavage. Pressing your shoulders in, you cup your own tits and lift them up, squeezing the full mounds around Ardia’s throbbing dick.");
		output("\n\nYou start moving your body up and down, dragging her dick through your soft rack until the dusky dzaan is squealing with pleasure.");
	}
	output(" A few minutes of that treatment and you can feel the cum swelling inside her, rushing to the surface amidst a chorus of lewd moans and gasps. You reach down and cup her [ardia.balls], giving the massive orbs a squeeze - exactly what she needs to push her over the edge.");
	if(!ardia.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\nReflexively, you recoil as the first thick wads of steamy seed squirt across your chin and [pc.chest]. Most of her load, though, ends up streaked across your neck in musky, pearly ropes.");
	else output("\n\nReflexively, you recoil as the first enormous eruption of dzaan-and-animal hybridized seed splatters across your chin and [pc.chest], heavy enough to knock you back from the weighty impact. She’s just getting started. The musky length you all-but-bolted to her loins won’t be satisfied with a single paltry rope. It pumps huge gushes of musky, mind-altering spunk, plastering to your [pc.skinFurScalesNoun" + (pc.hasHair() ? " and slicking back your hair":"") + ". She bathes you in semen with a rapturous expression, careful to lay most of it down in a neck-ringing moat.");

	output("\n\n<i>“Pearl necklace!”</i> Ardia declares, giggling. <i>“Ah, you look so pretty with it on. Gonna wear that all day for me?”</i>");

	if(pc.isBimbo()) output("\n\nMaybe you will! Make all the other girls jealous of your alp- your dick-totin’ girlfriend here.");
	else if(pc.exhibitionism() >= 66) output("\n\nFuck yeah you will. You’re gonna leave that on so every slut you see knows that Ardia’s made you hers... wait... more that you and Ardia had a fling. Yeah, that. You’re not hers... yet.");
	else output("\n\nMaybe that’s not the best idea, but at least while the two of you are together... maybe you can leave it on for a few minutes.");
	output("\n\nArdia grins and pulls you up onto her lap, hooking two hands into your [pc.butt] as she does. <i>“Great... because it’s <b>such</b> a good look for you.”</i>");
	output("\n\nYour lover plants a kiss right on your lips before you can conjure up an answer, leaving you to melt in the dzaan’s arms as the last of her orgasm drools down your [pc.skinFurScales].");
	processTime(15);
	//pc.orgasm();
	pc.applyCumSoaked();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Ride Her]
// Climb into Ardia's lap and ride that intoxicating cock of hers.
public function rideArdiasDickYo():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You’ve had your eyes on that exotic dick of hers since the moment you laid eyes on it, and now... now your body is screaming for it. You feel that lurid desire spreading through your loins, centering around your [pc.vagOrAss] and the needy depths beyond. You push Ardia back in her seat");
	if(pc.legCount > 1) output(" and hook a [pc.leg] around her");
	output(", straddling the plump dickgirl as you peel off your equipment.");

	output("\n\nShe’s already hardening again, just drinking in your naked body. Her hands run up your flanks, gripping your [pc.hips] as you settle into her lap. The throbbing cock you’re so keen on presses into your [pc.belly], smearing the cum still clinging to it across your [pc.skinFurScales]. Ardia’s breath quickens as your body rubs against her over-tender shaft, making her huge tits quake hypnotically until you can’t keep yourself from grabbing those saucer-sized chocolate teats and giving them a good squeezing. She moans, back arching into your hands as her little nipples tent against your palms, and her broad areola get nice and rigid, perfect for pinching and tweaking.");
	output("\n\n<i>“Hey there, good lookin’,”</i> Ardia murmurs, shifting her hands around to grab your [pc.butt].");

	output("\n\n<i>“Hey yourself,”</i> you answer, slowly working a hand down from one of Ardia’s boobs to her [ardia.cock]. You don’t grab it this time, though the temptation’s there - instead, you just give it a push back, down your thigh and into line with your [pc.vagOrAss]. A wiggle of your hips and her chocolate-hued crown is pressing itself " + (pc.hasVagina() ? "between your pussylips":"into the ring of your ass") + ", and you slowly start sinking down.");
	//stretchcheck
	if(pc.hasVagina()) pc.cuntChange(0,ardia.cockVolume(0));
	else pc.buttChange(ardia.cockVolume(0));

	output("\n\nOh yeah, that’s what you needed. You bite your lip and roll your eyes back, revelling in the sensation of the " + (!ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "first bulb of keratin slipping inside you":"flared crown stretching your insides out with every inch") + ". It protrudes just enough to grind against your inner walls with each breath you take, making your whole body tremble with pleasure.");

	output("\n\nYou can feel Ardia’s dick throb inside you, pulsing to her heartbeat as you start to move your hips. Feeling her girthy cock dragging back out of you is just as good as the first insertion, spurring you to start bouncing in your lover’s lap. Ardia’s hands wrap around your [pc.butt], hefting you up so you can slide back down her " + (!ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "nubby":"titanic") + " girth. Feeling her [ardia.cockHead] batter against your ");
	if(pc.hasVagina()) output("cervix");
	else if(pc.hasCock()) output("prostate");
	else output("bowels");
	output(" over and over again is enough to drive you mad with pleasure. You can’t even remember when you started screaming, letting your voice echo throughout the room as you take your ");
	if(!addictedToArdia()) output("lover");
	else output("alpha");
	output("’s dick.");

	//PC has a cock:
	if(pc.hasCock()) 
	{
		output("\n\nIt’s not long at all before your [pc.cock] is rock hard, rubbing between Ardia’s plump tits with every bounce of your hips. The chocolate beauty under you smirks down at your thrusting member before squeezing her shoulders together, and enveloping your dick in a sea of gelatin-soft boobage.");
		output("\n\n<i>“Ohh, I like the feeling of that!”</i> Ardia moans, rolling her head back with a lewd little grin. <i>“Feeling your dick fucking my tits while you work so hard for my cum...”</i>");
		output("\n\nShe’s not the only one. Her chest is absolutely divine, begging for your cum with every little jiggle and quake. You can’t bring yourself to deny her what her body so clearly needs, and so you move just a little faster, plunging your [pc.cock] into her bronzed-brown cleavage and letting your [pc.balls] discharge a fat load of [pc.cum] straight between her breasts. Ardia gasps as the first wads squirt out of her rack, splattering onto her neck and the top of her chest before the rest forms a creamy pool in her cleavage, letting your dick slip and slide that much faster.");
	}
	output("\n\n<i>“Okay... I think we need a change of pace!”</i> Ardia groans, pushing you up. You’re off her dick for only a few agonizing seconds" + (addictedToArdia() ? ", though it feels like an eternity of deprivation from your alpha’s dick":"") + " before she shoves you face-first against the chair she’d been sitting on, letting you get a full-bodied whiff of the pussy juices soaking its leather while her [ardia.cock] slaps down into the crack of your ass.");
	output("\n\n<i>“Tell me you want it,”</i> the alpha-slut growls, jacking her hips against your [pc.butt]. <i>“Tell me how much you want my cum.”</i>");
	processTime(30);
	clearMenu();
	addButton(0,"Cum In Me",cumInMeArdia,undefined,"Cum In Me","Beg your alpha for her cum deep inside.");
	addButton(1,"Get Smeared",takeArdiasLoadOnyerButt,undefined,"Get Smeared","Let Ardia bust her nut on your backside and cover you with cum. Non-addictive.");
}

//[Cum In You]
//Beg your alpha for her cum deep inside.
//Addicts always get creampie’d
public function cumInMeArdia():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("<i>“Please cum inside me! Pleeeease,”</i> you moan, thrusting your butt back against your chubby domme. Stars above, you");
	if (addictedToArdia()) output(" need it so bad.");
	else
	{
		output(" actually <i>crave</i> this girl’s cum... you must have got a little too much pre inside you, and now... now you’re desperate for more.");
		if (!immuneToArdia()) output(" Damn the consequences, you want her to breed your [pc.vagOrAss]!");
	}
	output("\n\nYou can almost feel Ardia’s confident smirk... or maybe that’s just the sudden throb of her cock between your cheeks, leaking her pre across your [pc.skinFurScales]. <i>“If that’s what you really want...”</i>");
	output("\n\n<i>“Yes!”</i> you plead. <i>“I neeeeed it!”</i>");
	output("\n\nArdia delivers a sharp slap across your butt, ending your begging with a cry of lustful need. <i>“Don’t debase yourself,”</i> she titters. <i>“It’s unbecoming of a captain... though it’s <b>fucking hot</b> from my " + (addictedToArdia() ? "beta" : "lover") + ". I guess I ought to give you what you want, huh? That’s what an alpha’s for.”</i>");
	output("\n\nShe punctuates the statement with a thrust that sends her [ardia.cock] balls-deep into your [pc.vagOrAss]. You throw your head back and let your whorish moans pour out for your hung alpha-stud, rocking your body against the chair while she plows your " + (!pc.hasVagina() ? "boy-":"") + "pussy." + (pc.hasCock() ? " Your [pc.cock] squirts even more of its goo, wasting more of your sad beta seed across the deck as your big, beautiful alpha owns your body from behind. Just thinking about how she’s milking it out makes your cock that much harder. You just moan weakly as you cum again, splattering your thighs and Ardia’s chair with your [pc.cum].":""));
	output("\n\nArdia pistons her hips, slapping your ass whenever you dare to loosen your grip. <i>“Oh yeah,”</i> she moans, pushing hard against your submissive rear. <i>“Take it... take it take it take it!”</i>");

	//PC has no cock:
	if(!pc.hasCock())
	{
		output("\n\nYour alpha’s command is all you need to cum, presaging her own orgasm with a body-shaking one of your own. Your screams reach a higher, fevered pitch, and your body clenches reflexively around Ardia’s [ardia.cock] until you feel the first hot loads of your alpha’s seed spilling into you.");
	}
	else output("\n\nYour [pc.cock] keeps leaking as your [pc.vagOrAss] milks your alpha, joining her in climax. Your load’s almost spent before the first sweet squirts of Ardia’s narcotic nut burst into your craving hole.");

	output("\n\nYour lover lets out a cry of exultation, slamming herself deep into you and releasing the last of her cum. Her fingers dig into your [pc.butt], kneading your flesh until she’s spent her weighty balls’ load into you and starts to withdraw. When she pops free, you’re left as a sloppy waterfall of dzaanic seed leaking down your thighs.");

	output("\n\n<i>“Ohhhh, that’s a pretty sight,”</i> Ardia says, leaning down and running her tongue across your cum-packed " + (pc.hasVagina() ? "pussy":"ass") + ". <i>“Enjoying your high?”</i>");

	output("\n\nYou mumble something that sounds like a <i>“yes ma’am,”</i> as you slide bonelessly off her chair and wrap yourself around her arched legs, enjoying the lethargic warmth spreading through you. Ardia smiles down and slowly strokes her dick, letting the last leaking drops of her orgasm rain down on your [pc.face]. You gladly lap up every drop until you’re ready to stand again...");

	processTime(15);
	if(pc.hasVagina()) pc.loadInCunt(ardia,0);
	else pc.loadInAss(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//[Get Smeared]
//Let Ardia bust her nut on your backside and cover you with cum. Non-addictive.
public function takeArdiasLoadOnyerButt():void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("<i>“Paint me with it!”</i> you moan, wiggling your [pc.butt] back against the alpha dzaan, body and soul begging her to mark you as hers. She’s all too happy to oblige, starting to thrust her hips against your rump. Her cock glides between your ass-cheeks, threatening to enter you again with every push, but your lover restrains herself to just fucking your [pc.butt] until her [ardia.cock] is ready to burst.");
	output("\n\nAnd with no [pc.vagOrAss] to pleasure, she lets herself do just that. Ardia moans, squeezing your cheeks together before her dick makes a mighty throb, and a jet of something sweet-smelling and steaming hot splatters across your back");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_FURRED)) output(" and into the fur of your [pc.tail]");
	output(". <i>“Oh, that’s a pretty sight!”</i> Ardia coos, still squirting those big balls’ load all over your ass. <i>“Mmm, yeah, take it all...”</i>");
	output("\n\nSpunk slowly sloughs off your back and ass as Ardia’s orgasm winds down, and the alpha finishes you off by wiping her dick clean on your thigh before stepping back and admiring her work.");
	output("\n\n<i>“Oh yeah, that’s a good look for ya,”</i> Ardia laughs, patting your flank. <i>“Whew... might wanna catch a shower, [pc.name], unless you want the bad guys to smell a fuck bus comin’ at ‘em.”</i>");
	output("\n\nYeah... you’ll get right on that.");

	processTime(15);
	pc.applyCumSoaked();
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	clearMenu();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//[Fuck Her]
//Slam your dick into Ardia’s cunt and pound the wanna-be alpha until she’s a screaming, cum-soaked mess.
public function fuckArdiasCunt(x:int):void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("You grin and your lush lover, planting your hands on her knees and spreading ‘em wide. Her cock and balls dangle heavily, still leaking the aftershots of her first orgasm. Her nuts are still " + (9999 ? "apple-sized" : "swollen with seed") + ", so heavy with her alpha’s potent cum that as you slide your [pc.cock " + x + "] under them, each orb rolls onto either side of your shaft and tries to weigh you down before your [pc.cockHead " + x + "] can find purchase in Ardia’s slit.");
	output("\n\n<i>“Sorry, but at this angle, I think you’re gonna end up fucking my balls as much as anything,”</i> Ardia says, grinning. Somehow, you don’t think she’s very sorry, especially as you start pushing forward. You can feel the taut flesh of her sack rubbing against you, just a little more weight and pressure on your length as it is subsumed with the drenched folds of Ardia’s dusky cunt. The plump dzaan moans, thrusting her chest out and rolling her head back in her chair as inch after inch of cockmeat spears her.");
	pc.cockChange();
	output("\n\nShe tries to say something, some new teasing witticism, but all that manages to come out of Ardia’s mouth is a long, husky, <i>“Fuuuuuuck,”</i> as your [pc.cock " + x + "] bottoms out. One of her hands plants itself on her belly, like she’s trying to feel out where your dick’s gone. The other hand busily gropes one of her bronzed-brown teats, squeezing the saucer-sized mound hard - you let your own hands go to the other, giving your lover that little extra stimulation she needs while you saw your hips back and forth.");
	output("\n\nThe poor girl under you is going crazy with pleasure in a matter of moments. Her thick thighs clench around your [pc.hips], legs locking and pulling you deeper in with every thrust; her nipples tighten into diamond-hard peaks, begging for you to lean down and start wrapping your [pc.lipsChaste] around them one after the other. And of course, her [ardia.cock] throbs with helpless need, leaking her narcotic pre onto the dzaan girl’s plush belly while her balls jiggle and quake to the beat of your thrusts.");

	//Ardia Horsecock:
	if(ardia.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nAll that jiggling softness gives you an idea, though. You wrap your hands around Ardia’s turgid equine shaft and guide it up between her mountainous mammaries. Its own weight keeps it where you leave it, leaking globs of pearly white while you pinch your lover’s dusky nipples and bring them together, enveloping it almost completely. Only the flared crown manages to peek out, and with a little prompting, it’s soon swallowed up between Ardia’s blue-hued lips. She stares up at you, cheeks working as she sucks, while you gleefully work her tits up and down her trunk.");
	}
	//else:
	else
	{
		output("\n\nHer poor dick’s not getting any love, though, and that’s such a shame! " + (addictedToArdia() ? "Just seeing all that wasted seed is enough to almost drive you mad with lust. You can’t help but at least give her nubby dick some attention too.":"Though you know full well she’ll be plastering herself with cum in no time, you decide you can spare a little affection for her bobbing member too") + ". You dip your fingers into the soaked honeypot under her nuts and then wrap a hand around her cock, starting to stroke her off to the same rhythm that you plunge your cock into her.");
	}
	output("\n\nThat’s what she really needed. Ardia’s sexy little moans start coming in shorter, more desperate choruses, and her hands dart down to cup and massage her balls. Won’t be long now... and you get to enjoy every second of that sweet, feral build up to the inevitable end. Finally there’s a mighty throb, a clench in every muscle from her pussy’s deepest depths to the crown of her cock, and then the air fills with a spray of pearly white. The musky sweet cream arcs across Ardia’s tits and drools down her belly, when it doesn’t cling to her dark flesh like a string of pearls around her neck.");
	output("\n\n<i>“Oh, fuck!”</i> Ardia gasps, spitting out an errant wad of her jizz before she can accidentally swallow. <i>“My dick’s... so hard... so much cum... gimme yours, too... please...”</i>");

	if(addictedToArdia())
	{
		output("\n\nThe moment Ardia commands it, your [pc.cock " + x + "] tenses up and then your own [pc.cum] comes surging up to your alpha’s womb.");
	}
	else output("\n\nYou’re already on the edge, and hearing her pleading voice is all it takes to set you off.");
	output(" With a feral cry, you slam yourself ");
	if(pc.cockVolume(x) <= ardia.vaginalCapacity(0)) 
	{
		if(pc.balls > 0) output("balls-deep");
		else output("to the hilt");
	}
	else output("as deep as you can go");
	output(" into Ardia’s squeezing pussy before you pump your load into her, joining her in a [pc.balls]-draining climax.");

	output("\n\nBetween the first and second shots, Ardia leans up and grabs you, arms around your shoulders and pulling you into a hard, passionate kiss. Even as you’re both cumming, you inside her and she all over herself, your beautiful dzaan lover is thinking only of you. Her lips play across yours, holding you fast until you’ve spilled every drop of your orgasm into her pussy" + (pc.hasKnot(x) ? " and your knot is stretching her dusky lips wide open around its girth, keeping every drop safely within":"") + ".");

	output("\n\n<i>“Oh, God,”</i> Ardia gasps when the moment passes, falling back against her seat. A last little dribble of her cum leaks out as she softens, and her breasts sag under their own weight as she relaxes." + (addictedToArdia() ? " <i>“Whew, mom would be so mad I let a beta cum inside me... but fuck, she hasn’t met you.”</i>":" <i>“You really know how to make a girl feel like a subby little beta... but who cares? I’ll take a fucking like that over having a harem any day...”</i>"));
	output("\n\nYou smirk down and give your lover another kiss, holding her close to you until you, too, go soft inside her.");

	processTime(20);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Her Butt]
//Add to choices alongside [Her Balls] and [Her Pussy]. Requires a cock or hardlight, and for the PC to have fucked Ardia at least 3 times.
//Ardia’s body is so lush and soft, it’s hard to decide what you like best... but you gotta say, it’s her jiggling butt that gets you hardest.
public function worshipArdiasButtYouSluuuut(x:int):void
{
	clearOutput();
	showArdia(true);
	author("Savin");
	output("<i>“I’m right where I belong,”</i> you tell her, shaking your head hard enough in her ass-cleavage to make her callipygian booty quake like mad. <i>“This is my favorite part for sure!”</i>");
	output("\n\nArdia giggles, shifting her grip back to grab her butt-cheeks and spread ‘em wide. <i>“Oh? Do you just like the thickness, or is it the softness that makes you so hard? Or maybe you’re just an addict to fat asses desperate for a fuckin’!”</i>");
	output("\n\nThat’s the nail, hit right on the head. You run your [pc.tongue] up, from her pussy to the ");
	if(!ardia.hasPlumpAsshole()) output("dark star");
	else output("charcoal-black plump donut rising just slightly from her bronze flesh");
	output(", and push gently against it. Ardia’s hands let go, causing her cheeks to come crashing back around you and burying your [pc.face] in an ass that’s jiggling gelatin all around you. Oh yeah, that’s the stuff! You nuzzle in, soaking up all that weight and creamy softness all around you while your tongue licks and probes against Ardia’s ");
	if(!ardia.hasCock(GLOBAL.TYPE_EQUINE)) output("asshole");
	else output("equine fuckhole");
	output(", readying it from what you have in store for her.");
	if(ardia.hasPlumpAsshole()) output(" The donut is so soft and spongy that you even bring your teeth into the action, gently nibbling around her raised anal mons.");

	output("\n\n<i>“I’m not normally this kinda girl,”</i> your lover complains, but her hips push back against you all the same. <i>“Before the pirates, I’d have never even thought about letting someone stick a dick in my ass...”</i>");

	output("\n\n<i>“And now?”</i> you manage to say around a mouthful of that delectable darkness.");

	output("\n\nShe laughs, a throaty sound that turns into a lurid moan halfway through. <i>“Now... now I’m not even thinking twice. Hell, keep that [pc.tongue] working and I’m gonna end up <b>begging</b> you to fuck me.”</i>");
	output("\n\nYou snicker, pushing your tongue a little deeper into that chocolatey ass. <i>“Fuck you where?”</i>");
	output("\n\n<i>“Mmm... how about...”</i> Ardia teases, shoving her butt back against you hard enough that you almost go toppling back. <i>“Right in my ");
	if(!ardia.hasPlumpAsshole()) output("asshole");
	else output("big, fat " + (silly ? "butt-pussy":"butthole"));
	output("!”</i>");

	output("\n\nYour tongue sinks so deep into her anal fuckhole that you can feel a plump little bulb inside her, just behind where her weighty ballsack and [ardia.cock] connect to her. One little push against it is all you need to make Ardia squeal, and her cock bounces with the shake of her hips. A pearly rope of cum leaks down from her crown, smearing across her thighs." + (silly ? " Critical hit!":"") + " You keep up the pressure, swirling your tongue around but always returning to that clit-sensitive bud hidden away in her ass. Every time you touch it, Ardia whimpers with pleasure, knuckles going white as she tries to keep herself together.");

	//Ardia has a horsecock:
	if(ardia.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\n<i>“I used to get off so hard to holos of big-titty sluts with huge dicks getting fucked,”</i> Ardia admits. <i>“I mean big, useless cocks so huge that nobody but a leithan would touch them. I loved watching them leak and squirt as a big, strong alpha dzaan pounded them from behind. I loved watching them ride their alpha, leaking cum all over her tits and face while she got stuffed pregnant... I never thought I’d </i>be<i> the dirty slut getting fucked! And now I’m gonna... now I’m gonna just blow my load from getting eaten out!”</i>");
	}
	//else:
	else output("\n\n<i>“Keep it up,”</i> Ardia pleads with you, biting her lip to try and at least quiet down her own lusty moans. You think it’s her begging for more, until she suddenly blurts out, <i>“Keep it up and I’m gonna... gonna...”</i>");

	output("\n\nYou don’t pay her any mind, just enjoying your alone time with her ");
	if(!ardia.hasPlumpAsshole()) output("asshole");
	else output("chocolate donut");
	output(" until it clenches hard around you, followed by a sudden rush of musky odor from the other side of your big-bodied lover. You can <i>hear</i> more than see the splatter of cum on the deck, wasted seed coming out in thick ropes of drugged-up spooge.");
	output("\n\n<i>“Fuuuuuuck!”</i> Ardia groans, <i>“Oh God, not even getting fucked! Feels so weird, so good...”</i>");
	output("\n\nYeah it does. But this is just the beginning.");

	output("\n\nEven as Ardia’s still creaming herself, you stand up, push her down, and grab her asscheeks in both hands. You spread her wide, watching as her ");
	if(!ardia.hasPlumpAsshole()) output("dark star quivers from the orgasm you just gave it");
	else output("plush butthole winks back at you, clenching and unclenching as her orgasm runs from tender tush to throbbing erection");
	output(". It’s so cute you can’t help but want to fuck it... not like you weren’t going to. You press the ");
	if(x >= 0) output("[pc.cockHead " + x + "] of your [pc.cock " + x + "]");
	else output("rounded tip of your hardlight strapon");
	output(" against the dzaan’s spasming anal entrance.");

	output("\n\nAll you get is a wordless groan of orgasmic ecstasy as you slowly thrust your [pc.hips] forward, sinking your " + (x >= 0 ? "dick" : "dildo") + " into her cock-craving asshole. Inch by inch, you feed her your [pc.cockOrStrapon " + x + "], watching with perverse delight as her asshole winks and squeezes... and oh, does it feel <i>good</i>. When you bottom out, Ardia’s back arches like the anal whore you’ve made her, and you can feel her cock wagging back and forth between her legs, slapping wetly against your [pc.leg] as your lover keeps cumming her brains out. And her continued orgasm does wonderful things for you, too, making her clench and squeeze wildly all along your length.");
	
	if(x >= 0) pc.cockChange();
	
	output("\n\nWhile it lasts, you figure it’s time to really <i>fuck</i> this wanna-be-alpha’s slutty ass. You give her a good spank across her jiggling asscheeks, making her squeeze down harder than ever before as you pull your hips back. She just about squeezes you out, but you’re able to rally at the last moment and slam your [pc.cockOrStrapon " + x + "] right back in. Ardia shrieks, and another massive wave of spooge shoots straight down from her [ardia.cock] and into the growing puddle on the deck. You’re pretty sure she cries out something like <i>“Oh my God!”</i> but it just sounds like a cum-drunk moan, especially as she starts thrusting her hips back against you.");
	output("\n\nGood girl! You reach down and grab the dzaan’s arms, hefting her up off the chair and making her stand while she receives your " + (x >= 0 ? "dick" : "hardlight strapon") + ". Her hands cup her boobs, but that’s all the action Ardia can manage outside of her sexual muscles. Her [ardia.cock] juts straight in front of her, sending thick ropes of cum all over her seat and the room behind it.");
	output("\n\n<i>“Yes!”</i> she screams, the first cogent word you’ve heard in a while. <i>“Oh [pc.name] it feels so good! Fuck me harder, please... please!”</i>");
	output("\n\nIf she insists.");
	
	output("\n\nYou redouble your efforts, pumping your [pc.hips] against that plush behind of hers as hard as you can. Thankfully there’s plenty of cushion for the pushin’, and soon the room’s alive with the heavy sounds of your [pc.skinFurScales] slapping against the dzaan’s plump rump, almost loud enough to drown out the wet sound of your [pc.cockOrStrapon " + x + "] pounding away at her juicy ");
	if(!ardia.hasPlumpAsshole()) output("fuckhole");
	else output("black donut");
	output(". When the urge to cum strikes you, you don’t even try to deny it - why would you, when you’re lover is busily dumping the contents of her balls all over the deck? You just keep moving your hips, plowing your [pc.cockOrStrapon " + x + "] deep inside the dzaan’s lush asshole until ");
	if(x < 0) output("the haptic feedback becomes too overwhelming to do anything but cum. You double over Ardia’s back and shove your strapon in to the hilt while her spasming butt works you through your climax.");
	else output("you feel the cum rushing up to fill Ardia’s bowels. You shove yourself deep and let it come flooding out, pumping the first fat wads of [pc.cum] into your insensate lover.");
	output(" Your reward is a soft groan and another eruption of spooge from Ardia’s poor, untouched dick, leaking the last of what her balls can give her all over the floor.");
	output("\n\n<i>“D-don’t let go,”</i> Ardia begs you, slowly rolling her head back to kiss you. <i>“I don’t think I can stand on my own. My legs...”</i>");
	output("\n\nShe’s got nothing to worry about. You’re not letting this beautiful babe go any time soon...");
	processTime(25);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("ARDIA_BUTTLOVED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//[Give Anusoft]
//TT: Why not?
//Probably should move this and give horsecock into their own “Give Item” menu tbqh. PC must have fucked Ardia’s ass at least once.
public function giveArdiaAnusoft():void
{
	clearOutput();
	showArdia();
	author("Savin");
	output("<i>“Hey, Ardia,”</i> you say, reaching into your pack. <i>“Got a present for you.”</i>");
	output("\n\nThe dzaan blinks, hopping out of her seat and taking the bottle from you. <i>“Oh, how swe-- what in the world is 'anusoft' supposed to be?”</i>");
	output("\n\nShe turns the bottle around in her hands, reading over the labels. <i>“O-oh... oh my gods and stars, [pc.name], how perverse! I know I said some things when you were, um, well...”</i>");
	output("\n\n<i>“Fucking your ass?”</i> you finish for her.");
	output("\n\nArdia's cheeks flush darkly. <i>“Yeah, I didn't think you'd be so serious about making me your dedicated little buttslut.”</i>");
	output("\n\nYou quirk an eyebrow. Is she trying to tell you she didn't like it? Because you sure remember her squirting about a gallon of cum all over the deck before you were even done tongue-fucking her backdoor. Ardia's blush only spreads, but you can see her package twitching through her [ardia.armor]. The material was way too tight around the balls before, and now it looks like she's getting ready to rip her way right through it. ");
	output("\n\nBetter help the poor girl out. You step closer, wrapping an arm around Ardia's waist and using the other hand to pull down her jumpsuit's zipper. Her [ardia.cock] springs out, slapping heavily against your thigh as you peel the lush babe out of her clothing. She puts up no resistance, even as you're bending her over and pressing two fingers against her tight backdoor.");
	output("\n\nShe gasps a breathy <i>“Oh!”</i> as you push them inside, but her dick gives you the more noticable response: it juts straight out under her, already beading with that familiar musky scent of her addictive seed. You wipe a healthy portion of anusoft onto your fingers the first time they slide out, using it like lube to push down to the third knuckle inside the dzaan's plush behind. She moans, arching her back at that inhuman angle that makes her tits bounce so hypnotically, and her hips are soon pushing back against your fingers while you spread the remainder of the dose around her spread rim.");
	output("\n\nYou've barely finished by the time the changes start. Ardia's breath catches as her asshole starts to grow, darkening and puffing up while your fingers are still deep inside her. It only takes a few seconds for her anal rim to become a fat, black donut like a horse's ass, sucking your fingers back in every time you try and pull back. ");
	output("\n\n<i>“Oh that feels <b>so</b> weird!”</i> Ardia giggles, wiggling her hips. <i>“God, it's like my asshole's just one giant clit... and it feels all soft!”</i>");
	output("\n\n<i>“It is,”</i> you assure her, nibbling at the plump ring, <i>“VERY soft.”</i>");
	output("\n\n<i>“That right?”</i> she asks, breathless. <i>“So what's your favorite part of me now...?”</i>");

	processTime(10);
	ardia.ass.addFlag(GLOBAL.FLAG_PUMPED);
	pc.destroyItemByClass(Anusoft);
	pc.lust(10);
	clearMenu();
	addButton(0,"Her Butt",cockSelect,[worshipArdiasButtYouSluuuut,ardia.analCapacity(),true,0],"Her Butt","Ardia’s body is so lush and soft, it’s hard to decide what you like best... but you gotta say, it’s her jiggling butt that gets you hardest.");
}

//[Give Horsecock]
//Requires SynthSheath AND having used one before. Must have fucked Ardia at least 3 times.
public function giveArdiaAHossCock():void
{
	clearOutput();
	showArdia(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) 
	{
		output("<i>“Check this thing out!”</i> You raise the floppy equine appendage in front of the dzaan’s curious eyes. <i>“It’s a horse-cock!”</i>");
		output("\n\nArdia gives it an increasingly appreciative look, roving from the big soft balls all the way to the delightfully thick tip. <i>“So I see, but what are you going to </i>do<i> with it, [pc.name]? Fuck me?”</i>");
		output("\n\n<i>“No, no, just like... stick your dick in it here,”</i> you point at the small slit within the flat-based back, <i>“and you’ll have a big stupid horse-dick! It’ll be real fun to play with!”</i>");
	}
	//Not a bimbo
	else
	{
		output("<i>“How about we give you an upgrade and turn you into a </i>real<i> alpha. Not a pretty " + (ardiaInZhengShi() ? "slave" : "bridge bunny") + " but a big-dicked, slut-dominating stud?”</i> You pull out the floppy equine appendage and waggle it in front of the dzaan’s curious eyes.");
		output("\n\nArdia gives it an increasingly appreciative look, roving from the big soft balls all the way to the delightfully thick tip. <i>“And that toy is going to just give me one somehow?”</i> She quirks an eyebrow in disbelief.");
		output("\n\n<i>“Of course! This isn’t your everyday dildo! It’s a SynthSheath! You just slip your dick into the slit, and let it do the rest. Presto! You’re a hung alpha with a god-like dick!”</i> You wave it back and forth in front of her face. <i>“Imagine how much fun it would be!”</i>");
	}
	//Merge
	output("\n\nArdia pauses. She looks down to her loins, then back to the toy. Her brow crinkles with thought, then smoothes as her gaze returns to you once more. <i>“You think I’d like it?”</i> She hugs her arms around under her breasts uncertainty, unintentionally displaying a jaw-dropping amount of cleavage. <i>“I’ve never had a horse-cock before..." + (ardia.hasPlumpAsshole() || 9999 ? "" : " or any mods, actually.") + "”</i>");
	if (ardiaDomLevel() < 7)
	{
		//Nice
		if(pc.isNice()) output("\n\nYou tell her that she doesn’t have to. You just thought it would be something nice for her to have. Maybe she could even show up some of the pirates around here!");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou tell her that if she wants to get cock-shamed by every pirate in the station, she’s welcome to. You just thought she might want to elevate herself to their level.");
		//Hard
		else output("\n\nYou nonchalantly remind her if she wants to be an alpha, she’s going to at least have to bring herself up to the level of the average pirate.");
		//Merge
		addButton(1,"No",neverMindOnArdiasHossCock,undefined,"No","Don’t Give Her a Horse-Cock.");
	}
	else
	{	
		//Beta
		output("\n\nYou would never pressure your alpha to change herself -- she's basically physical perfection incarnate anyway -- but you do take the opportunity to gently suggest that, with a galaxy full of hung aliens like leithan and thraggen to compete with, surely having a massive slut-destroyer of her own would make getting a harem easier. You love every inch of her body as it is, but a bunch of potential betas might not look twice at an 'average' member like hers, depriving her of a chance to show them what she's made of.");
		addDisabledButton(1, "No");
	}
	output("\n\n<i>“Okay.”</i> The resolute dzaan holds out her hand. <i>“Give me that dick.”</i>");
	output("\n\nAre you sure you want to give Ardia a horse-cock?");
	processTime(4);
	clearMenu();
	addButton(0,"Yes",giveArdiaAHossCockPartDues,undefined,"Yes","Give Ardia a Horse-Cock.");
}

//[No] - Don’t Give Her a Horse-Cock
public function neverMindOnArdiasHossCock():void
{
	clearOutput();
	showArdia();
	author("Fenoxo");
	output("<i>“Actually...”</i> You pull the horse-dick away at the last second. <i>“Now that I think about it, it might be better to wait until we get out of here before we start playing with mods.”</i>");
	output("\n\nArdia seems on the verge of anger");
	if (ardiaInZhengShi()) output(" until you’ve given voice to the entire explanation. <i>“You tease. All right then, if we get out of here, I’m going to be expecting to play with some of these toys!”</i>");
	else output(", scowling at you with those plump blue lips. <i>\"You tease. Did you just flop that in my face to size shame me?\"</i>She huffs, crossing her arms under her prodigious tits. <i>\"Fine, keep your toys. " + (ardiaDomLevel() < 4 ? "I like my body just fine." : "But I'm gonna tear your ass up with my 'average' dick tonight, you know!") + "\"</i>");
	output("\n\nIs there something else you’d like to do with Ardia?");
	processTime(2);

	ardiaMenu();
}

//[Yes] - Give Ardia a Horse-Cock
public function giveArdiaAHossCockPartDues():void
{
	clearOutput();
	author("Fenoxo");
	output("The faux prick slaps into Ardia’s palm with resounding finality.");
	output("\n\n<i>“So... like this?”</i> The dzaan holds the base up next to her stiffening, keratin-spotted tool, on the verge of jabbing her crown into the slit. Spots of color blossom on her cheeks while she anxiously awaits your approval.");
	output("\n\nYou nod. <i>“Just slide in. It’ll do the rest.”</i>");
	output("\n\nArdia tilts her head and sucks in a huge lungful of air. <i>“Here goes nothing!”</i> The trembling dzaan shudders as her tip forces the toy’s rear entrance apart, sliding two or three inches inside in an instance. <i>“It feels kind of warm already,”</i> she reports, shifting her legs to a wider stance to thrust a little further inside, <i>“and wet. It’s supposed to be wet, right?”</i> She grins at you. <i>“Are you sure this isn’t just a damned good pocket pussy?”</i>");
	output("\n\nIt isn’t, but the twinkle in your eye will have to suffice for an answer.");
	output("\n\nGroaning in delight, Ardia takes the bestial impliment in both hands and pounds it downward, slapping it against her chocolatey skin hard enough to audibly clap. <i>“Whoah.”</i> She wobbles slightly, staring down at the length of black bouncing in her hands. <i>“That </i>does<i> look good... but I think I wanna fuck it some more.”</i> Still two-handed, Ardia makes to yank it off. For one moment, her flesh strains. Then her hands lose their grip and slide down the horse-dick instead, giving it a vice-tight squeeze from balls to crown.");
	output("\n\n<i>“Holy fucking star-titties!”</i> the former slave gasps, instantly reversing the stroke to take another pump. <i>“I can feel it!”</i> Sure enough, you can see the 18-inch length beginning to stiffen from her ministrations. Instead of bouncing around, it lifts up to jut accusingly in your direction. The molded veins twitch, then bulge, pumping real blood through the once-fake member. Ardia continues stroking automatically, eyes halfway rolled back as she rings out bubbles of pre-cum big enough for shot-glasses.");
	output("\n\nYou can smell it in the air, the powerful, primal, almost intoxicating vapor of her pre-seed is somehow so much more potent when expressed from a big, black horse-cock. Ribbons of it spill down the dzaan’s new length. Her masturbation takes on a liquid sound as her fingers foam up her free-leaking fuck-juice. Then, just as you’re picking out a hint of very-virile musk beneath all the sloppy pre-scent, Ardia cums.");
	output("\n\nMaybe the climaxing cutie is just naturally polite. Maybe her blissful spasms took a lucky turn. Whichever it is, Ardia’s first shot of equine-tainted jism flies wide of your [pc.legOrLegs] to splatter heavily on the floor. The impact creates an enormous puddle, and the dzaan seems to fixate onto it as a target. With shuddering stumbles and impulsive jerks of her hips, she staggers up to the edge of it wrings her dick with both hands, milking cumshot after cumshot into the deepening pool. Her moans grow louder and more desperate with every squirt, the shots thickening with increasing virility.");
	output("\n\n<i>“Yesss!”</i> Ardia screams it, uncaring of who might hear. <i>“I love this cock!”</i> A cacophonous splatter nearly drowns out her declaration. <i>“With this, I could have the biggest...”</i> Her balls quake and unload an even larger torrent. <i>“... the biggest, sluttiest, most cum-drunk harem ever!”</i> And like magic, Ardia’s flaring phallus releases every remaining drop in her balls. The spermy tide is impressive to say the least, so much so that by the time it fades to a slow trickle, you’ve nothing to say.");
	output("\n\nPanting wildly, Ardia rounds on you, flinging a syrupy strand of white dzaan cum across your [pc.belly]. <i>“Thank you, [pc.name]!”</i> She lunges forward to hug you, swaddling you into the expansive valley between her tits without a single care for how her leaky cock presses against you, or how the contact makes it stiffen in anticipation. <i>“I didn’t know... didn’t know it could be this good! Or- hey I guess I could go again.”</i> She lets you go with a delighted smile. <i>“I could go again and again, I bet.”</i>");
	output("\n\nThe dzaan hefts one ball. It’s a bit larger than before, maybe an inch wider, and wrapped in a leathery, heavy-duty sheath. <i>“Yeah, the moment I even think about sex, I can feel these babies heat up. No wonder I came so much!”</i> Her eyes brighten. <i>“" + (addictedToArdia() ? "You’re going to be a very well-fed beta!":"I’m going to have better-fed betas than a kui-tan!") + " So what’ll it be, [pc.name]? Want to give me a test-drive? Maybe wrap your lips around this beast?”</i>");
	
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter ones biology. You grimace ruefully at the device before regarding Ardia’s enhanced genitalia.");
		CodexManager.unlockEntry("SynthSheath");
	}
	
	processTime(25);
	ardia.cocks[0].cType = GLOBAL.TYPE_EQUINE;
	ardia.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
	ardia.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
	ardia.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
	ardia.cocks[0].cLengthRaw = 18;
	pc.destroyItemByClass(HorseCock);
	showArdia(true);
	ardiaDomLevel(1);
	//Option to Normal Menu, +an option to suck her immediately, just this once :3
	if (ardiaInZhengShi())
	{
		ardiaMenu();
		addButton(3,"Suck Her",suckArdiaDownSloot,undefined,"Suck Her","Go down on Ardia’s cum-drooling tool and get a fad load of her jizz.");
	}
	else
	{
		ardiaCrewMenu();
		addButton(9,"Suck Her",suckArdiaDownSloot,undefined,"Suck Her","Go down on Ardia’s cum-drooling tool and get a fad load of her jizz.");
	}
}

//Ardia Appearance Screen
//Unlocked after fucking her once.
public function ardiaAppearanceScreen():void
{
	clearOutput();
	showArdia();
	author("Savin");
	output("Ardia is a dzaan alpha, and what she lacks in the traditional amazonian physique that term evokes, she makes up for in sheer plump curvaceousness. She’s a big girl, about seven feet tall, and stands on the balls of her feet as if wearing high heels at all times. A ");
	if(9999 == 0) output("Steele Tech");
	else output("Zheng Shi slave");
	output(" jumpsuit hugs her body tightly, clinging so tightly to her thick thighs and ample hips that you can see every outline of her [ardia.cock] and massive, apple-sized balls. Blue hair spills down her shoulders, parting around a crown of keratin growths around her brow; another single stud of keratin adorns her chin. Her bright blue eyes shine a passionate spark, the same color as her kissable lips.");
	output("\n\nStill, your eyes are drawn down to her lush curves: the massive set of breasts, each capped with a saucer-sized brown teat; the broad strokes of her breeding hips, and the pillowy thickness of her thighs and callipygian buttocks. Between those dense chocolate cheeks rests a ");
	if(!ardia.hasPlumpAsshole()) output("tight little asshole");
	else output("plush black donut");
	output(", right where it belongs.");
	clearMenu();
	if (ardiaInZhengShi()) addButton(0,"Next",ardiaApproach,true);
	else
	{
		ardiaCrewMenu();
		addDisabledButton(4, "Appearance");
	}
}

public function giveArdiaAMod():void
{
	clearOutput();
	showArdia();
	output("What mod do you want to give Ardia?");
	clearMenu();

	if(ardiaDomLevel() >= 7) addDisabledButton(0, "Anusoft", "Anusoft", "You're Ardia's dedicated bottom bitch now; you won't be fucking her ass anymore, or at least, not without her being in charge. She's perfect the way she is anyway...");
	else if(flags["ARDIA_BUTTLOVED"] == undefined) addDisabledButton(0,"Anusoft","Anusoft",(ardiaInZhengShi() ? "You’ll need to have claimed her ass at least once before playing god with it, you madman!" : "You haven't experienced how sweet this dickgirl's ass can be yet. Maybe try the default version before you talk to her about upgrading..."));
	else if(ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) addDisabledButton(0, "Anusoft", "Anusoft", "Ardia's already got a big, fat equine ring for you to fuck. It's not getting any plumper...");
	else if(!pc.hasItemByClass(Anusoft)) addDisabledButton(0,"Anusoft","Anusoft","You don’t have any of these to give her!");
	else if(ardia.ass.hasFlag(GLOBAL.FLAG_PUMPED)) addButton(0, "Anusoft", increaseTheArdiaDonut, undefined, "Anusoft", "Give Ardia a little something to make her plump, fuckable donut even sweeter...");
	else
	{
		//[Her Butt]
		if((pc.hasCock() && pc.cockThatFits(ardia.analCapacity()) >= 0) || pc.hasHardLightEquipped()) 
		{
			addButton(0,"Anusoft",giveArdiaAnusoft,undefined,"Anusoft",(ardiaInZhengShi() ? "Why Not?" : "Give Ardia something to make her ass even more fuckable."));
		}
		else if(pc.hasCock()) addDisabledButton(0,"Anusoft","Anusoft","You need a penis or hardlight strapon <b>that fits</b>. Gotta sample your work somehow!");
		else addDisabledButton(0,"Anusoft","Anusoft","You need a penis or hardlight strapon to do this. Gotta sample your work somehow!");
	}

	if(ardia.hasCock(GLOBAL.TYPE_EQUINE)) addDisabledButton(1,"HorseCock","HorseCock","She already has a horse-cock!");
	else if(flags["SEXED_ARDIA"] == undefined) addDisabledButton(1,"HorseCock","HorseCock","You should probably have fucked the girl at least once before you try to slap an enormous beast-cock onto her.");
	else if(flags["SEXED_ARDIA"] < 3) addDisabledButton(1,"HorseCock","HorseCock","You’ve barely even slept with her once! Third time’s the charm..."); 
	else if(!CodexManager.entryUnlocked("SynthSheath")) addDisabledButton(1,"HorseCock","HorseCock","You haven’t discovered the mod you’d need to use for this.");
	else if(!pc.hasItemByClass(HorseCock)) addDisabledButton(1,"HorseCock","HorseCock","You need to have found some kind of horse-dick-gifting toy in order to slap it onto her.");
	else addButton(1,"HorseCock",giveArdiaAHossCock,undefined,"HorseCock","You can never have too much of a good thing.");

	if (ardiaInZhengShi()) { /* no balls for ZS dzaan */ }
	else if (!pc.hasItemByClass(NukiNutbutter)) addDisabledButton(2, "Nutbutter", (ardia.hasPerk("'Nuki Nuts") ? "More" : "Nuki") + " Nutbutter", "You don't have any of this to use on her!");
	else if (!ardia.hasPerk("'Nuki Nuts")) addButton(2, "Nutbutter", makeMyDzaanBallsGrow, undefined, "Nuki Nutbutter", "Give Ardia a little something to make sure she can cum all day and all night for you. Those fat nuts of hers could be so much bigger... and feed so many betas!");
	else if (ardiaHugeBalls()) addDisabledButton(2, "Nutbutter");
	else addButton(2, "Nutbutter", neverEnoughArdiaNutbutter, undefined, "More Nutbutter!", "Ardia's balls aren't big enough right now. While she already has the fabled Nuki Nuts, you can apply more of this creamy butter to her balls in order to swell them up with a surge of productivity.");

	if (ardiaInZhengShi()) addButton(14,"Back",ardiaApproach,true);
	else addButton(14, "Back", function():void
	{
		clearMenu();
		ardiaCrewTalkMenu();
	});
}
