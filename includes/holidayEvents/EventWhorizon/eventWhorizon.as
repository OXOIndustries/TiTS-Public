/*
EVENT_WHORIZON_STATE:
	undefined		Not started
	-1				Abandoned/ignored
	1				Started
	2				Finished


EVENT_WHORIZON_TENTACLE_GARDEN
	undefined		Not encountered
	1				Player Victory over Garden
	2				Player Victory over Gardener
	-1				Player Defeat

EVENT_WHORIZON_TORMENT_CAGES
	undefined		Not encountered
	-1				Left the rusher
	1				Saved the guy and won the fight

	
*/
	
public function isDoingEventWhorizon():Boolean
{
	// Fix my bumblefuckery
	if (flags["EVENT_WHORIZON_STATE"] != 2 && flags["EVENT_WHORIZON_STATE"] != undefined && InCollection(shipLocation, "TAVROS HANGAR", "SHIP HANGAR", "201", "600", "2I7", "LZ L50", "500", "POESPACE", "UVS F15", "CANADA1", "K16_DOCK", "BREEDWELL_HANGAR"))
	{
		flags["EVENT_WHORIZON_STATE"] = 2;
	}
	
	if (flags["EVENT_WHORIZON_STATE"] == -1) return false;
	if (flags["EVENT_WHORIZON_STATE"] == undefined) return false;
	if (flags["EVENT_WHORIZON_STATE"] == 2) return false;
	return true;
}

public function sendEventWhorizonMessage(destination:String = null):void
{
	clearOutput();
	author("Savin");

	output("Of all the different alerts programmed into your ship’s nav computer, <i>“spacial anomaly detected”</i> is one of the ones you never, ever want to see. Black holes and gravitational distortions are pretty much a death sentence in the depths of space.");
	
	output("\n\nAnd sometimes, you discover as you rush onto the bridge in a panic, it’s a giant pink tear in reality.");
	
	output("\n\nYou stare out the forward viewport, watching a luminescent pink field of gas and energy warble a few kilometers ahead of where the computer automatically dropped you out of LightDrive. You’re getting all sorts of radiation readings from the anomaly, and the automated scans are coming up with big, red <i>“inconclusive”</i> readings.");
	
	output("\n\n<i>“What the hell is that?”</i> you wonder aloud, swinging into the captain’s seat. The pink field isn’t moving or growing, thankfully, but it is certainly discharging. It’s a very long but narrow oval, probably less than half a kilometer wide, and according to what readings you <b>are</b> getting, the anomaly is basically two dimensional.");
	
	output("\n\nThe anomaly doesn’t seem to be overtly dangerous to you, though. The radiation it’s putting off is easily blocked by your ship’s navigational shields, and it <b>seems</b> stable, insofar as your sensors can detect.");
	
	output("\n\nIt may be possible to get closer and investigate...");

	processTime(2);
	
	if (destination == null)
	{
		destination = "Tavros";
	}

	clearMenu();
	addButton(0, "Do It", goToEventWhorizon, destination, "Do It", "Science is calling!");
	addButton(1, "Leave", abandonEventWhorizon, destination, "Leave", "You ain’t falling for this nonsense.");
}

public function abandonEventWhorizon(destination:String):void
{
	clearOutput();
	author("Savin");

	output("You plot a course around the anomaly, leaving a buoy in your wake for Steele Tech to come investigate later. Your pop’s science department can deal with this: you’ve got better things to do.");

	flags["EVENT_WHORIZON_STATE"] = -1;
	processTime(1);

	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function goToEventWhorizon(destination:String):void
{
	clearOutput();
	author("Savin");

	output("You strap in and ease the ship forward, guiding your vessel close to the edge of the warbling pink gash in space-time. Your thrusters bring you up close, as near to the tear as you dare. At this range, you can start to make out... something... inside it. Maybe space debris, caught inside the event horizon?");
	
	output("\n\n<i>“Let’s see.”</i> You bring the ship’s analytics tools to bear, sending a full-spectrum sensor ping into the anomaly’s depths.");
	
	output("\n\nThe moment the ping connects, all hell breaks loose.");
	
	output("\n\nThe outer edges of the pink slit quiver visibly, sloshing around like you’ve just dropped a big, fat rock in their pool. As if that wasn’t bad enough, the middle part of the tear changes colors to a deep, almost golden yellow surrounded by fleeting, luminescent pools of blue. You don’t have time to blink in surprise before the ship shudders violently, and alarms start blaring. You can’t hear yourself scream over the deafening roar of <i>“GRAVITATIONAL ALERT”</i> blasting out of the ship’s speakers. All the readouts flash red around you, showing pictures of your ship’s superstructure being dragged forward - right into the maw of the anomaly!");
	
	output("\n\nFull reverse! You pull back hard on ever thruster and engine you can engage, but nothing seems capable of shaking gravity’s grip. Helplessly, you find yourself and your ship being dragged straight into the rift in space!");
	
	output("\n\nYou cry out, throwing up your hands in a last-ditch instinctive effort to protect yourself as you’re drawn into the abyss.");

	flags["STORED SHIP DESTINATION"] = destination;
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "AAAHHHH!", actuallyStartEventWhorizon, undefined, "AAAHHHH!", "AAAHHHH!");
}

public function ewEventOver():void
{
	// Oops...
	if (flags["STORED_SHIP_DESTINATION"] != undefined)
	{
		flags["STORED SHIP DESTINATION"] = flags["STORED_SHIP_DESTINATION"];
		flags["STORED_SHIP_DESTINATION"] = undefined;
	}
	
	if (flags["STORED SHIP DESTINATION"] == "TAVROS HANGAR" || flags["STORED SHIP DESTINATION"] == undefined)
	{
		flags["STORED SHIP DESTINATION"] = "Tavros";
	}
	
	flags["EVENT_WHORIZON_STATE"] = 2;
	
	flyToWrapper(flags["STORED SHIP DESTINATION"]);
	mainGameMenu();
}

public function actuallyStartEventWhorizon():void
{
	clearOutput();
	author("Savin");

	output("You have no idea what just happened, but when you manage to pry your arms away from your eyes, the viewscreen shows a very different vista than what you’d been staring down a moment ago.");
	
	output("\n\nYou’re on a planet, apparently motionless. There’s a cream-white sky overhead that seems motionless and solid, like the inside of an eggshell. Ahead of your ship is a dark pink, rocky world with sparse patches of thin red grass and pillars of tan-colored stone reaching up to the heavens. Dark vines hang from the craggy pillars, undulating with a serpent-like suggestion.");
	
	output("\n\nThe ship’s computer doesn’t respond when you try to bring up your location. The galaxy-position satellite feed just gives you a big <i>“DISCONNECTED.”</i> You’ve <i>never</i> seen that before. Same with your Codex’s extranet connection, despite the quantum communications system installed. Where the fuck are you?");

	if (annoIsCrew())
	{
		output("\n\nIt’s only a couple of seconds before Anno staggers onto the bridge, looking about as spooked as you feel. <i>“Hey boss, what’s going on? I heard you yelling and then the whole ship went woozy and... and... where are we?”</i>");

		output("\n\n<i>“No idea.”</i>");

		output("\n\n<i>“Okay... Uhh, that’s not what I wanted to hear. I guess I’ll start running tests. See if I can get the sensors to cooperate. Why don’t you go do your adventurer thing, huh? We’re not going anywhere right now.”</i>");
	}

	var numCrew:Number = crew(true);

	if (numCrew >= 2)
	{
		output("\n\nYou tell your crew you’re going out to investigate the strange new surroundings you’ve found yourselves in.");
	}
	else if (numCrew == 1)
	{
		var names:Array = getCrewOnShipNames();
		
		if (names.length != 1)
		{
			output("\n\nERROR: Invalid number of available crewmembers.");
		}

		output("\n\nYou tell "+ names[0] +" that you’re going outside to investigate this brave new world you’ve landed in.");
	}
	else
	{
		output("\n\nMight as well go outside and figure out where the hell you are - your ship’s sensors can’t make heads or tails of it, and without some way to get your bearings, your ship’s going nowhere.");
	}

	output("\n\nYou gather your gear and head down to the airlock.");

	processTime(15+rand(5));

	shipLocation = "EW-M23";
	flags["EVENT_WHORIZON_STATE"] = 1;

	clearMenu();
	addButton(0, "Next", exitShipOnEW);
}

public function exitShipOnEW():void
{
	currentLocation = "EW-M23";
	generateMapForLocation(currentLocation);
	mainGameMenu();
}

public function EWTentacleGardenFight():void
{
	clearOutput();
	author("Savin");
	showName("TENTACLE\nGARDEN");
	showBust("ADULTCOCKVINE");

	output("As you’re walking through the twisting forest of sandstone columns, you can’t help but notice the meaty green vines hanging from the rock formations are getting thicker and thicker - both in size and in density. Some pillars are almost entirely covered by them, surrounded at their base by steaming pools of the purple juices that seem to constantly leak from the plants’ bulbous forends.");
	
	output("\n\nEverywhere there’s purple goop, plump pink flowers grow to feed from it. There’s a veritable garden of this alien flora around you now, and you’re beginning to smell something in the air. A heady, musky sort of smell that reminds your brain of sex and sweat and... and is it just you, or are those flowers turning to face you?");
	
	output("\n\nThey are! You blink as the fleshy pink bulbs twist on their spindly stalks, opening up to reveal deep slits in between their thick, wet petals. It’s impossible to ignore just how positively <i>vaginal</i> they look, glistening in the milky light and straining on their stems towards you.");
	
	output("\n\nWait, if the flowers are moving...");
	
	output("\n\nYou look up, at the mats of vines coating the stone. They’re writhing and wriggling, peeling off the rock and lunging for you!");

	var h:TentacleGardenMonster = new TentacleGardenMonster();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(h);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(ewTentacleGardenVictory);
	CombatManager.lossScene(ewTentacleGardenLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "You're surrounded on all sides by wriggling green vines, mercilessly whipping and grabbing at you. A wall of pink pussy-flowers box you in, sucking at your [pc.legs] if you stray out of the center of the garden. The tentacles grab at your [pc.arms], trying to restrain you -- and the cockhead-shaped tips at their ends make it abundantly clear what will happen if they succeed!";
		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

private function ewTentacleGardenVictory():void
{
	clearOutput();
	showBust("ADULTCOCKVINE");
	showName("VICTORY:\nTENTACLE GARDEN");
	author("Savin");

	output("You let out a ragged breath, watching the fuck-plants retreat - what ones haven’t been obliterated already, anyway. What the hell were those? They didn’t seem individually sentient, but they moved like programmed droids might: with tactics and persistence. Something’s wrong with this place... wherever this is. You need to find out what’s going on here, before more of these plants descend on you.");

	flags["EVENT_WHORIZON_TENTACLE_GARDEN"] = 1;

	ewTentacleGardenMerge(true);
}

private function ewTentacleGardenLoss():void
{
	clearOutput();
	showBust("ADULTCOCKVINE");
	showName("DEFEAT:\nTENTACLE GARDEN");
	author("Savin");

	flags["EVENT_WHORIZON_TENTACLE_GARDEN"] = -1;

	output("You slump to the ground, feeling your [pc.weapon] being yanked out of your hand by one of the insidious fuck-vines. Others tear at your [pc.gear], smearing purple-hued smegma on your [pc.skinFurScales] while they work. You’ve barely hit the ground by the time and cock-shaped tentacle is thrusting its way past your [pc.lips]. You squirm and struggle, but the plants wrap around your limbs, holding you down while others spread your [pc.legs] and smear your [pc.vagOrAss] with fragrant plant-lube.");
	
	output("\n\nThere’s no foreplay, no pretense, just overwhelming pressure on your hole");
	if (pc.hasVagina()) output("s");
	output(". Tentacles assail your body, thrusting into every open orifice; others wedge between your elbows");
	if (pc.hasKnees()) output(" and knees");
	output(", jacking themselves off on you. The tentacle in your mouth pushes inwards, pressing your [pc.tongue] down and out of the way while it pillages your throat. Its siblings seem eager to meet in the middle, thrusting deep inside you, coiling and squirming in your belly until your [pc.skin] is bulging obscenely in response to their movements.");

	if (pc.hasCock())
	{
		output("\n\nOf course, the vines aren’t the only fuck-plants in the garden. Your [pc.cockBiggest] is jutting straight up in the air already, forced to full arousal by the pressure hammering your prostate. There are pussy-flowers growing all around you, drooling clear, fragrant fluids as they wind their way towards your crotch.");
		if (pc.cocks.length == 1) output(" The largest and most succulent of the twat-plants rises up to the crown of your [pc.cock], wrapping its plump, wet petals around your [pc.cockHead] and sliding down your length. Your moan around the tentacle in your mouth, arching your back off the ground as the flower consumes your cock right down to the [pc.knot].");
		else output(" The flowers grasp around your cocks, slurping down your shafts with wild, hungry abandon. You gasp and squirm as even more pleasure is added to your helpless situation. You prostate is being hammered from inside, and the flowers greedily suck up all the [pc.cum] that leaks out into them.");
	}
	
	output("\n\nThe garden spreads you eagle on the ground and fucks you senseless. It’s rough, bestial, uncaring - and it feels <i>great</i>. It shouldn’t; you don’t <i>want</i> it to, but your body isn’t listening to you anymore. You scream as you cum, thrashing against your viney restraints. Purple goop squirts inside you in response, like your orgasm has triggered something in the plants. Even the ones not lodged deep in your helpless body swell with turgid need before squirting violet plant-spooge all over your [pc.belly] and [pc.face].");
	
	output("\n\nYou gasp, writhing in your bonds as the garden slathers you in seed inside and out");
	if (pc.hasCock()) output(" and drains you of yours, as well");
	output(". The tentacles inside you slip out, and new ones take their place, thrusting into your ass");
	if (pc.hasVagina()) output(", pussy,");
	output(" and mouth before you’ve had a chance to catch your breath. Your orgasm is incidental, a random accident on the wayside of the garden’s conquest of your body, and yet it happens again and again. By the time the vines are done with you, you’re covered inside and out with honey-scented spunk.");
	
	output("\n\nWhen the plants finally do withdraw, you’re left splayed out in the muck, covered in goo and breathing hard. The vines retreat back into the stone, and silence falls over the grove.");
	
	output("\n\nSlowly, unsteadily, you force yourself back up to your [pc.feet]. You’re leaking out of every hole, and so woozy that you almost fall, but you have to press on.");

	ewTentacleGardenMerge(false);
}

private function ewTentacleGardenMerge(isVictory:Boolean):void
{
	output("\n\nAs you’re preparing to move on, a voice breaks the silence that’s descended over the battlefield; it’s sultry and feminine, carrying over the wind with cool, sensual confidence. You spin around, searching for the source.");

	output("\n\n<i>“Oh, poor baby!”</i> the voice coos. You hear the click-clack of high heels on stone, finally drawing your eyes upwards, to the top of one of the stone pillars. <i>“Did those naughty little plants hurt you? Aww, why don’t you just lie down and let momma kiss it better!”</i>");

	output("\n\nStanding atop the promontory is a figure like something out of");
	if (silly) output(" Corruption of Champions");
	else output(" an erotic fantasy holo");
	output(". It’s female, voluptuous beyond what’s human: a perfect hourglass figure, thick thighs and long legs. Full breasts rest heavily on her chest, each capped with a broad black areola and a nipple adorned with a golden ring the diameter of your thumb with chains linking them together and then trailing down her flat belly before looping around her broad waist and down between the cleft of her sex, running through a thick clit piercing and between her legs. Lush black hair falls is dark waves down her back and shoulders, streaked with floral-green highlights. Her hair’s swaying locks are almost hypnotic enough to distract you from the obsidian horns growing from her brow, sweeping back across her scalp.");

	output("\n\nThe woman’s clawed hands rest on her brood-bearing hips, and she chews on viridian lip. While you’re still staring at the statuesque creature, she grasps one of the slick green vines dangling from the stone and slides down it, landing a few feet from you with enough jiggle to make a galotian blush.");

	output("\n\n<i>“My darlings can be so... curious about newcomers. They’ll learn their place soon enough,”</i> the strange woman purrs, caressing a bushel of tentacle-vines as she strides towards you, hips a-swaying. <i>“As for you, why don’t you leave those silly weapons over there and come to momma. I’ve got a lovely tentacle cage just dying to be filled with you. And you with it.”</i>\n\n");

	if (pc.HP() < 1) pc.HP(1);
	if (pc.shields() < pc.shieldsMax()) pc.shields(pc.shieldsMax());

	if (isVictory)
	{
		processTime(5+rand(3));
		CombatManager.genericVictory();
	}
	else
	{
		processTime(15+rand(5));
		pc.orgasm();
		CombatManager.genericLoss();
	}

	clearMenu();
	addButton(0, "Okay", ewTentacleCageBadEnd, undefined, "Okay", "Now that she's <i>asking</i>, some tentacle fun might be... well, fun!");
	addButton(1, "Nope", ewTentacleGardenMergeNo, undefined, "Noped", "Uh... no?");
}

private function ewTentacleGardenMergeNo():void
{
	clearOutput();
	author("Savin");
	showName("TENTACLE\nGARDENER");
	showBust("TENTACLEGARDENER");

	output("You keep your hand firmly on your [pc.weapon], putting it between you and the strange woman. You don’t raise it just yet, but you’re not letting her just put you in some kind of fuck-cage.");

	output("\n\n<i>“No? Darling, I wasn’t asking,”</i> the woman says, trading sensuality for sternness. <i>“You’re a stranger in our dimension! Don’t be a rude guest; I’ve gone through so much trouble to grow my wonderful restraints for you aliens. Be a dear and follow me so we can harvest all that yummy, yummy");
	if (silly) output(" cummy");
	else output(" cum");
	output(" from you!”</i>");

	output("\n\nI doesn’t look like she’s gonna take no for an answer.");

	var h:TentacleGardener = new TentacleGardener();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(h);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(ewTentacleGardenerVictory);
	CombatManager.lossScene(ewTentacleCageBadEnd);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "She's a tall, statuesque woman... if the statuary you're looking at has grossly exaggerated sexual attributes: an impossibly thin waistline but mareish hips, huge breasts decorated with golden chains, and demonic claws and horns. Black-and-green hair swirls around her as she moves, dancing around the garden with a feline grace that seems outright impossible considering the sheer weight of ass, hips, and titties she's carrying -- yet she makes her assets look feather-light. And predatory smile is drawn across her jade lips, and coal-black eyes betray a deep, fathomless hunger as she circles you.";
		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

private function ewTentacleGardenerVictory():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nTENTACLE GARDENER");
	showBust("TENTACLEGARDENER");

	flags["EVENT_WHORIZON_TENTACLE_GARDEN"] = 2;

	output("The demon gardener staggers back, breathing hard. Her massive chest jiggles with every ragged breath, and her dark flesh is slick with sweat. <i>“Oh my, you’re");
	if (enemy.HP() <= 0) output(" strong");
	else output(" so alluring");
	output("!”</i> she gasps, grasping at the stone to steady herself. Her plants have retreated now, slithering back into the shadows as their mother gives in to her defeat.");
	
	output("\n\n<i>“The queen will want to see you,”</i> she sneers, finally steadying herself. <i>“Go northwards, stranger. This strange land of ours will oppose you at every turn. These are the queen’s orders, and her perverse will is law in this realm.”</i>");
	
	output("\n\nBefore you can ask who this queen is, the gardener explodes into a cloud of black smoke and dissipates into the cream-colored sky.");
	
	output("\n\nDamn it!");

	CombatManager.genericVictory();
}

private function ewTentacleCageBadEnd():void
{
	clearOutput();
	author("Savin");

	output("Before you even realize what’s happening, the alien has put her hand on your wrist, gently taking your [pc.weapon] from your hand. It’s an almost loving gesture, tender like a mother’s caress. What resistance you have left to offer is feeble at best, and her many cock-tendrils quickly restrain your limbs.");
	
	output("\n\n<i>“There we are,”</i> the woman coos, stroking your cheek. <i>“Everything’s so much easier when you cooperate for mommy. Come along, darling, let’s get you settled in.”</i>");
	
	output("\n\nThe tentacles around your arms pull you");
	if (pc.hasFeet()) output(" to your feet");
	else output(" upright");
	output(", passing you off to others, and then to others, moving you like cilia along the stone path in their mother’s wake. Your eyes are fixated on her mare-like ass, swaying and jiggling with every step, leaking plant-cum and her own growing excitement.");

	output("\n\nBy the time you arrive at these vaunted cages of hers, the succubus is absolutely dripping.");
	
	output("\n\nThe <i>“cages”</i> are just more vines, but they’ve been cultivated into hanging from the sandstone walls of a semi-circular cove in the stone forest. These vines are mostly hard and first, strong enough to support your weight as you’re hoisted into them by the gardener’s planty minions. The vines of the <i>“door”</i> grow in an instant, sealing you in between pulsating bars of green vines.");
	
	output("\n\n<i>“There! Isn’t that so much better?”</i> the gardener coos from outside, letting the vines that imprisoned you wrap around her supple thighs. She barely even reacts when several of them squirm into her pussy and ass, propping her up on their turgid shafts as she reclines into a sitting posture above them.");

	output("\n\n<i>“Don’t worry, sweetheart,”</i> she continues, licking her lips at the sight of your imprisonment. <i>“My babies will take such good care of you from now on. And you’ll feed us with those sweet, sweet juices of yours, too.”</i>");
	
	output("\n\nThe question that might have risen to your lips never comes - something else plugs your mouth before you get the chance to speak. The tentacles growing from the ground squirm up the walls, threading between the bars of your vine cage. If a plant could look hungry, these would: their cock-like crowns are swollen with pregnant need, drooling purple goo as the encircle your [pc.legs] and tear your remaining gear away. Your bare [pc.vagOrAss]");
	if (pc.hasCock())
	{
		if (pc.cocks.length == 1) output(" and cock are");
		else if (pc.cocks.length > 1) output(" and cocks are");
	}
	else output(" is");

	output(" left completely exposed, and it’s only a moment long before you feel yourself being violated by the squirming vines. Another forces its way past your [pc.lips], and you’re assailed by the alien taste of candy-sweet extra-dimensional precum.");
	
	output("\n\nYou’re plugged in every hole not twenty seconds after being imprisoned, forced to endure the sensation of the gardener’s <i>“children”</i> squirming inside you. The slick, slimy tendrils pump in and out of you, pounding your [pc.vagOrAss]");
	if (pc.hasVagina()) output(" and [pc.asshole]");
	output(" while your throat is plumbed by the longest, most sinuous tentacle. They don’t take long to cum - only a few seconds, really - but each time one of the vines pumps you full of its steamy lavender spunk, it withdraws and lets another vine, fresh and turgid with need, take its place inside you.");
	
	if (pc.cocks.length == 1)
	{
		output(" While you’re being fucked by the vines, one of the long-stemmed flowers slithers through the bars and folds its petals around your [pc.cock], sucking sharply on your schlong.");
	}
	else if (pc.cocks.length > 1)
	{
		output(" While you’re being fucked by the vines, several long-stemmed flowers slither into the cage, affixing themselves to your [pc.cocks] and starting to suck.");
	}
	
	output("\n\n<i>“Oh, they adore you!”</i> the gardener smiles, stroking the shafts thrusting under you. <i>“You’ll make such a lovely");
	if (pc.hasVagina()) output(" incubator");
	if (pc.isHerm()) output(" and");
	if (pc.hasCock()) output(" pollinator");
	output(". A happy plant is a productive plant, you know.”</i>");
	
	output("\n\nYou hear her words, but your mind is too overgrown by fuck and breed to comprehend them. The only thing that matters to you anymore in the thunderous orgasms the plants are wracking out of your body. Every nerve you have is firing off, overwhelming your mind with searing pleasure. Juices pour down your thighs, lapped up by the hungry plants flourishing below you.");
	
	output("\n\n<i>“Well, I’ll leave you to it,”</i> the gardener smirks, standing. A dozen vines slip out of her holes, squirting onto her thighs and ass before worming their way over to join the fun between your [pc.legs]. <i>“I’ll be back in a few months to check on you. Make lots of cute little spores for me!”</i>");
	
	output("\n\nM-months!?");
	
	output("\n\nThat word alone is enough to shock you out of your gangbang-induced reverie. You have to get out of here! To find the probes, get your fortune - save your crew from this fuck-dimension! You struggle, one last desperate fight for freedom, straining against the living restraints wrapped around your limbs and coiling inside you. It lasts only for a few moments before the other tentacles join their brethren, stretching you wide as they force themselves inside you.");
	
	output("\n\nThe last cogent thoughts you have are washed away by a dozen tentacles fucking you to orgasm after orgasm, unending.");

	//[Game Over]
	badEnd();
}

public function EWTormentCagesFight():void
{
	clearOutput();
	author("Savin");
	showName("TORMENT\nCAGES");
	showBust("TORMENTCAGES");

	output("As you approach the end of the side path, you see several more creatures ahead, standing underneath cages grown from living fuck-vines. Much like the gardener you fought before, they are human in shape but as if seen through the lens of a primitive human’s demon fantasy: they have long limbs that end in bone heels, curling horns over heads of thick, flowing hair, and their skintones range in colors from obsidian to blood red and deep purple.");

	output("\n\nThey’re congregated around one cage in particular, and within it, you can make out a vague humanoid form - it’s hard to see details between the dozen or more tentacles brutally fucking the poor soul, but you can be pretty sure you see a pair of big ol’ ears and a bushy tail hanging out from the cage’s bottom. An ausar, maybe?");
	
	output("\n\nYou approach quietly, using the rocky outcroppings for cover until you’re right behind the cavorting... well, you might as well call them what they look like: the <i>demons</i>.");
	
	output("\n\n<i>“Exquisite, isn’t it?”</i> one of the demons moans, pumping her fingers into her pussy. <i>“Oh, we simply must find more of these aliens to sample. I can’t get enough!”</i>");
	
	output("\n\nAnother of them, one with so many gold rings and chains hanging off her body that you’re surprised she can stand, moans in agreement. A third demon is on her knees between the second one’s legs, eating muff with wild abandon while her partner’s long, sinuous tail thrusts into her pussy in return.");
	
	output("\n\nAlien, huh? That sounds like it’s another Rusher. You must not be the first poor sod to fall into this hellscape!");

	processTime(7+rand(5));

	//[Help] [Leave]

	clearMenu();
	addButton(0, "Help", EWTormentCagesHelp, undefined, "Help Him", "You can't just leave a fellow Rusher to this sexual torment. Get in there and help!");
	addButton(1, "Leave", EWTormentCagesLeave, undefined, "Leave Him", "Back off and leave the poor Rusher to his fate.");
}

private function EWTormentCagesLeave():void
{
	clearOutput();
	author("Savin");
	showName("TORMENT\nCAGES");
	showBust("TORMENTCAGES");

	if (flags["EVENT_WHORIZON_TORMENT_CAGES"] == undefined)
	{
		pc.addHard(5);
		flags["EVENT_WHORIZON_TORMENT_CAGES"] = -1;
	}

	output("You have other priorities than this poor sap. You back off for now.");

	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

private function EWTormentCagesHelp():void
{
	clearOutput();
	author("Savin");
	showName("TORMENT\nCAGES");
	showBust("TORMENTCAGES");

	pc.addNice(5); // No check to existing changes- leaving then helping will cancel out etc

	output("You jump forward, [pc.weapon] in hand, and demand the demons release their captive. All three of the lust-wrought figures start, wiping the sexual juices off their hands and lips as they turn to look at you.");
	
	output("\n\n<i>“Oh my!”</i> one of them purrs, licking her ruby-red lips at the sight of you. <i>“Aren’t you just delectably heroic!”</i>");
	
	output("\n\n<i>“[pc.HeShe] is!”</i> another giggles, making her exaggerated tits quake. She curls a lock of ashen hair around a crimson finger, eating you alive with her black eyes. When you level your weapon at her, she pouts. <i>“Ohh, darling, don’t be like that. We’re just want to have a little fun with you.”</i>");
	
	output("\n\nThe third demon-slut smiles seductively, taking a high-heeled step towards you. Her gait is like a model on the runway, swaying her broad hips and swishing her tail along the stone. <i>“The psychic energy you aliens release when you pleasure you to the breaking point is so... so intoxicating. My sisters and I can’t get enough of it.”</i>");
	
	output("\n\nThe first, red-lipped demon moans softly as the captive Rusher behind her screams, and purple plant-cum pours from between the fuck-cage’s living bars. The other two shiver and gasps as well, but the first can’t help herself but the grap her plush titties, squeezing them until a glistening white milk beads from her coal-black teats. <i>“Oh! My dear little alien, just lay that silly thing down and come");
	if (pc.hasCock()) output(" thrust that [pc.cock] of yours into me!");
	else output(" get down between our legs!");
	output(" My sisters and I will show you such pleasures...”</i>");
	
	output("\n\n<i>“Such as you’ve never felt!”</i> another moans.");
	
	output("\n\nThe third trills, <i>“Yes! Come to us!”</i>");
	
	output("\n\nThey start to advance on you, making it clear there’s no saying <i>“No”</i> to their request.");

	processTime(5+rand(3));
	flags["EVENT_WHORIZON_TORMENT_CAGES"] = 1;

	clearMenu();
	addButton(0, "Fight!", EWDemonicCaptorsFight);
}

private function EWDemonicCaptorsFight():void
{
	clearOutput();
	author("Savin");
	showName("DEMONIC\nCAPTORS");
	showBust("DEMONICCAPTORS");

	output("You ready your weapon, itching for a fight. Before the three alien succubi can pounce on you, though, thunder peals through the sky, a deafening burst of concussive force that makes all of you stagger back from each other.");
	
	output("\n\n<i>“Leave [pc.himHer]!”</i> a voice booms from on high. The sky darkens in an instant, enveloping the cum-colored clouds in a shroud of darkness. <i>“I lay claim to this one. Begone!”</i>");
	
	output("\n\nThe three demons shriek and recoil from you, exploding into dark mist and retreating into the stone in the blink of an eye.");
	
	output("\n\nYou shout to the sky, demanding to know what’s going on, but no answer is forthcoming. The sky clears a few seconds later, leaving you alone with the ausar in the cage. When you recover, you’re able to make your way up to the fuck-cages and start yanking the vines down and away, pulling the ausar free from the tentacle bondage.");
	
	output("\n\nIt’s a dickgirl, that much is obvious at first glance, with a smallish red rocket and balls hanging out from the tattered ruins of a pair of jeans. There’s nothing left of her shirt, leaving a pair of fairly hefty tits jutting out from a cum-soaked black vest hanging off her slender shoulders. You can see a patch on the jacket’s shoulder - the logo’s the same as the Confederate Scout Authority, where <i>“Galactic Confederacy”</i> should be written, you instead see <i>“Federation of Allied Planets”</i> in big, bold letters. Must be a cheap knockoff... right?");
	
	output("\n\nPurple plant-spooge is smeared all over her dark olive skin and drools from the corners of her mouth as she sputters and coughs.");
	
	output("\n\n<i>“Oh, thank the Three,”</i> she groans, coughing up a wad of plant-spunk onto the rocky ground. <i>“I don’t... I don’t think I’d have lasted much longer.”</i>");
	
	output("\n\nIf she realizes how naked she is, she doesn’t bother to try and cover up. The dickgirl extends a furless hand to you - a half-ausar, then - and you pull her up to her feet. Five inches of crimson cockmeat wobbles between her slender thighs, limp as a wilted stalk after being milked so many times by her imprisonment.");
	
	output("\n\n<i>“What the hell is this place?”</i> you ask her, trying not to stare. Hopefully she’s learned more about wherever you are in her time here.");
	
	output("\n\nUnfortunately, not much. <i>“No idea. My ship picked up something weird on sensors, but when I got close... I got sucked in. Speaking of which, I gotta get back to my ship. Hope my crew’s okay. Left ‘em there... One knows, feels like days ago.”</i>");
	
	output("\n\nShe starts to make for the path back before you catch her arm. <i>“Come on, you gotta know something! Our ships can’t get out of here anyway!”</i>");
	
	output("\n\nShe stops, tail curling around her leg. <i>“I know a lot more about myself than I did a few days ago, tell you that much. But about this place? All I know is that everything here - the plants, the stones, the <b>sky</b> - it’s all here to fuck you. Like this place is one big pervert’s paradise. And those skanks that were all over me, they kept acting like they were feeding off me. Not like, vampires or some shit, but more like a... like a succubus. And they kept babbling on about some Queen of theirs, too. I think they were gonna feed me to her, when they were done with me. They made it sound like a lot of other rushers have been dragged off thataway.”</i>");
	
	output("\n\nShe points north, the same direction the gardener indicated. <i>“All I know is there’s been a lot of screaming that way. At least when the tentacles weren’t trying to fuck my ears.”</i>");
	
	output("\n\nThe Rusher shudders, wrapping her arms under her cum-smeared bust. <i>“Well, good luck, hero. I’ve gotta get back to my crew. Maybe I’ll see you out on the Expansion sometime!”</i>");
	
	output("\n\nYou nod, trying to decide what the hell you’re going to do about this Queen... and what’s an Expansion?");

	processTime(8+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function EWFuckPrison():void
{
	clearOutput();
	author("Savin");
	showName("THE FUCK\nPRISON");

	flags["EVENT_WHORIZON_FUCK_PRISON"] = 1;

	output("The winding forest of sunscorched stone opens up just ahead of you. The ground gives way to either side of you as you advance, dug out into a deep moat that’s filled with some sort of murky, musky liquid. Cum of all sorts, by the smell... an ungodly deluge of it, pouring down from the northward path.");
	
	output("\n\nYou start seeing the source a few minutes later.");
	
	output("\n\nThe fuck-vines you saw in the garden are here as well, drooping down from their stony roots and wrapping around the wrist of at least two dozen humanoid figures. You see ausar, kaithrit, humans, thraggen, and a half dozen other Rusher races tied to the stone, being fucked mercilessly by the plants. Dicks constantly erupt from the bonded Rushers, spraying waves of cum down into the rivers; their pussies leak cum and femcum in equal measures, mixing with the male juices before being swept away by the tide.");
	
	output("\n\nNone of the captives even acknowledge your presence. They’re too far gone, lost in pleasure. Every orifice is filled with tentacles; every dick suckled on by pussy-flowers. Moans and cries of pleasure echo from the stone, surrounding you on all sides as you advance into the grove.");
	
	output("\n\nYou’ve made it about halfway through the fuck-prison before you realize that somebody’s watching you.");
	
	output("\n\nNot one of the prisoners, of course. You couldn’t be that lucky. No, it’s another of the creatures like the gardener: human of shape, but exaggerated like a sex icon: huge breasts and hips, high heels and marble-smooth obsidian skin. She swaggers out of the shadows, waving her hips with every step and twirling a lock of snow-white hair. Bands of iron around her wrists and ankles jingle, and your eyes are between her legs to a long, heavy ausar cock hanging down from her crotch. The knot’s fully inflated, and its base is pierced by several iron rings, from each of which hangs a small key.What does she need those for? The restraints are made of vines!");
	
	output("\n\n<i>“Hello,”</i> she purrs, chewing on a metal ring piercing her rosy lip. <i>“Welcome to the feeding grounds. Hm, you should have an escort, shouldn’t you?”</i>");
	
	output("\n\nYou cock an eyebrow at her. The succubus gives you a quizzical look, pursing her plump lips. <i>“Oh well, no matter! The Queen has been expecting you. You’re the first one who’s made it past the gate, so to speak. How exciting!”</i>");
	
	output("\n\nWait, they wanted you to make it through?");
	
	output("\n\n<i>“Oh, of course!”</i> the jailer chirps happily, starting to walk backwards, the same way you were going. <i>“The Queen has been craving a challenge for years now! Please, just follow the path north, up to the palace. She’s awaiting you within.”</i>");
	
	output("\n\nBefore you can ask more, the demon-woman smirks and steps backwards, melding into the shadows. She dissipates within them, completely gone by the time you reach her and run a hand through the air where she’d stood.");
	
	output("\n\nDamn it.");

	processTime(10+rand(3));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function EWBondagePalace():void
{
	clearOutput();
	author("Savin");
	showName("THE BONDAGE\nPALACE");
	showBust("DEMONSYRI");

	output("You throw open the doors of this temple-palace, striding between the spread legs of a carnal effigy and into the domain of the alien queen.");
	
	output("\n\nLike the outside of the temple, the interior of the palatial structure seems to be upheld in the arms of oversexed idols, with great big stone breasts and dicks and other, more esoteric sexual arrangements looming overhead. The ground floor, however, is dominated by a long, wine-red carpet that your [pc.feet] sink into the moment you step inside. It naturally draws your eyes inwards, to the center of the wide-open throne chamber.");
	
	output("\n\nThere’s a dais at the carpet’s end, on which sits a throne. On the throne sits a woman, one who’s distinctly <i>not</i> one of the demon-like creatures you’ve encountered in this plane. She’s an ausar, that much is evident at a glance: bare, light olive skin hides beneath a thin layer of raven-black fur on her arms and legs, and a thick tail spills out over the arms of the throne. She’s naked, and that nakedness exposes iron muscles rippling under her flesh as she sits up, setting aside a goblet that’s stained with white around its whim.");
	
	output("\n\nFiery orange eyes stare up at you. A pair of long, curved horns sprout from the sides of the ausar’s head, like those of a steer, and are bedecked with metal chains and rings. Her coal-black lips curl into a feral snarl, revealing protruding canine fangs. When she finally thrusts up onto her feet, a dozen thick tendrils are dragged out of her body, squirming and flailing before they retreat into the holes cut in the seat of the throne.");
	
	output("\n\n<i>“Finally!”</i> the towering ausar roars, cracking her knuckles. She’s big - well over eight feet - and even more muscular than you’d thought on first seeing her. She’s also leaking sexual fluids down her thighs, a purple goo that catches the waning light spilling in from outside.");
	
	output("\n\n<i>“I’ve been waiting years for some "+ pc.mf("stud", "skank") +" to put my gardener in her place. Years! Trapped in this place with nothing but lust and rage and nobody worth my time to slake them on.”</i>");
	
	if (flags["FUCKED_SYRI_COUNT"] != undefined)
	{
		output("\n\nWait, that voice! So familiar... her body, too, save what’s <i>absent</i> between her legs. That... it can’t be! <i>“Syri!?”</i>");
	
		output("\n\nThe demon-dog pauses mid-step, curling her black lips into a snarl. <i>“That name... haven’t heard it in a while. Don’t know you. New smell. <b>Good</b> smell.”</i>");
		
		output("\n\nShe makes an exaggerated snort, huffing the air around you. You take a step back, trying to figure how the ausar dickgirl you know and love ended up here, like... like this. So you ask, <i>“You’re the queen all those things outside were talking about? How?”</i>");
		
		output("\n\n<i>“Yeah, that’s right. Yokels call me that. Think it’s proper, since my libido gave ‘em purpose. You done talkin’ yet? I’m so damn horny for you I can’t stand it!”</i>");
	}
	else
	{
		output("\n\nYou stand firm. <i>“So you’re this ‘queen’ everyone’s been talking about?”</i>");
	
		output("\n\nThe beast of a woman stands up straight, rolling her shoulders. <i>“Yeah, the yokels call me that. Think it’s proper, since my libido gave ‘em purpose. Used to be called Syri. Years back, I guess. Baddest Hellhound you ever saw.");
	}
	
	output("\n\n<i>“Come on and take the first shot, [pc.race]. Make it count, ‘fore I get over there and vent all over you.”</i>");
	
	output("\n\nDoesn’t look like she’s going to leave you much choice...");

	processTime(5+rand(2));

	var h:DemonSyri = new DemonSyri();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(h);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(ewDemonSyriVictory);
	CombatManager.lossScene(ewDemonSyriLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "She's a towering mound of muscular ausar meat: more than eight feet tall, olive-skin glistening with sweat and fuck-juices, black fur on her arms and legs bristling. Her thick tail slaps heavily on the stone floor with every step, swaying with overt enjoyment of your battle. Her eyes are a fiery, almost glowing orange, burning with rage and lust. The horns that grow from her head stick out to the sides like a prize bull's, adorned with chains and rings. Syri's fangs are long and sharp, catching the waning light from outside as she circles you, and her claws ball into brawler's fists in preparation for her attacks.";
		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

private function ewDemonSyriVictory():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("The demon queen falls unceremoniously to a knee, panting like a sled dog. Hot breath steams from around her long fangs, and her fiery eyes regard you with desire even more obvious than before.");

	output("\n\n<i>“You beat me! Ha!”</i> she grunts, shaking out her mane of dark hair. <i>“Didn’t see that coming. Been here for years and years, and the first person to finally fight their way here puts me on my ass? I must be getting soft!”</i>");
	
	output("\n\nShe laughs, like she hasn’t just gotten");
	if (enemy.lust() >= enemy.lustMax()) output(" so turned on she can’t keep her legs from shaking");
	else output(" beat down by you");
	output(". <i>“So now what? Time to make me your bitch... or are you hoping I know some way out of this place?”</i>");

	output("\n\nGood question...");

	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriPostCombatMenu():void
{
	// [Talk] [Fuck] [Look Around]
	clearMenu();
	if (flags["EVENT_WHORIZON_DEMONSYRI_TALK"] == undefined) addButton(0, "Talk", ewDemonSyriTalk, undefined, "Talk", "Who the hell is she, and what’s she doing here?");
	else if (flags["EVENT_WHORIZON_DEMONSYRI_TALK"] == 1) addButton(0, "Arrival", ewDemonSyriTalkArrival, undefined, "Arrival", "Ask Syri how she got to this strange dimension.");
	else addDisabledButton(0, "Arrival");

	if (flags["EVENT_WHORIZON_FUCKED_DEMONSYRI"] == undefined) addButton(1, "Fuck", ewDemonSyriFuck, undefined, "Fuck", "Claim your reward from the oversexed demon queen’s body.");
	else addDisabledButton(1, "Fuck");
	
	if (flags["EVENT_WHORIZON_DEMONSYRI_LOOKAROUND"] == undefined) addButton(2, "Look Around", ewDemonSyriLookAround, undefined, "Look Around", "See if there's any way you might be able to get out of here...");
	else addDisabledButton(2, "Look Around");
	
	if (flags["EVENT_WHORIZON_DEMONSYRI_LOOKAROUND"] != undefined) addButton(14, "Leave", ewDemonSyriLeave, undefined, "Leave", "Use the data from the computer crate to get the hell out of this pocket plane.");
}

private function ewDemonSyriLeave():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("Alright, time to get out of here. You lock up the Akkadi case and heft it up, getting ready to drag it back to your ship.");
	
	output("\n\n<i>“Hey, wait!”</i> the demonic alpha bitch snaps, struggling up to her feet with the help of one of the statues. <i>“You really think you can get out of here with that thing?”</i>");
	
	output("\n\n");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("Absolutely. Using this’ll be a no-brainer.");
	else output("Well, it’s your best shot! You can’t use your LightDrive and escape without navigational data.");
	
	output("\n\nThe hellhound growls, but her ears flatten against her horned head and her tail curls around her leg. You can’t tell if she’s nervous or afraid, but there’s definitely something going on in the hell-bitch’s mind. When she finally speaks, it’s in a hushed whisper spoken with flushed cheeks.");
	
	output("\n\n<i>“I can’t ask you to forgive me for what I tried to pull on you, but please... my brother works for the Federation. Doctor Annoch Dorna. Tell him what happened to me.”</i>");
	
	output("\n\n");
	if (flags["MET_ANNO"] != undefined) output("Annoch... Anno!? This chick really must be from another reality. You’re not sure you can track down someone from the wrong dimension. And if you take this computer, Syri’s going to be trapped here for all time.");
	else output("You could always give it a shot... then again, maybe the hellhound would have a better chance doing it herself?");

	output("\n\n");
	CombatManager.genericVictory();
	userInterface.leftBarDefaults();

	//[Okay] [Come With]
	clearMenu();
	addButton(0, "Okay", ewDemonSyriOkay, undefined, "Okay", "Sure thing, demon lady.");
	addButton(1, "Come With", ewDemonSyriComeWith, undefined, "Come With", "Take the big demon-dog with you back to reality. She'll have to find her own way home, though... wherever that is.");
}

private function ewDemonSyriComeWith():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("<i>“I’ve got a better idea,”</i> you say, stepping back towards Syri and shoving the computer core into her arms. She grunts with the sudden weight, hefting it up onto her shoulder and giving you a questioning look. You grin and jerk a thumb towards the door. <i>“C’mon, we’re leaving.”</i>");
	
	output("\n\nIt takes a moment to register in the hellhound’s lust-clouded mind, but after a moment of confusion, she returns your grin. <i>“You better not be yankin’ my horns now. You’re really gonna help me get home?”</i>");
	
	output("\n\nSure, why not. You got a feeling her home isn’t quite the same place as yours, but you can get her out of here. So you lead Queen Syri out of the grand temple of hedonism, down the sweeping palatial steps and back into the twisting labyrinth of stone columns. This time it’s relatively easy to make your way back to the ship, retracing your steps right to the airlock. Along the way, Syri’s relatively quiet, but a glance over your shoulder shows that her tail’s wagging, faster and harder as you cycle through the airlock and back into your ship.");

	if (annoIsCrew())
	{
		output("\n\nBoy do you have a surprise for Anno. You shout her name and guide Syri to the common area of the ship. The hellhound shrugs the computer core onto the deck and growls <i>“Who’re you yelling for?”</i>");

		output("\n\nThe question answers itself as soon as the snowy pup saunters out of her quarters. Her");
		if (!annoWearingCatsuit()) output(" shirt’s buttoned down low enough to show off a fair hint of cleavage, and her hair’s spilling down her shoulders in luxurious curls.");
		else output(" catsuit’s zipped down past her tits, leaving the two succulent mounds barely constrained within it. White curls fall in luxurious waves around her shoulders, and her creamy skin seems to sparkle in the light");
		output(". The reaction from the hellhound is immediate and visceral: her nipples harden into wine-red mountains, and a heady aroma of desire starts suffusing the air all around you.");

		output("\n\n<i>“Well hello, gorgeous,”</i> Syri growls, pushing her mess of black hair out of the way and showing off a fearsome smile full of fangs.");
		
		output("\n\nAnno stops short in the corridor, blinking. <i>“Uh, greetings... large... naked ausar.”</i>");
		
		output("\n\nBefore they can get any further, you decide to introduce your new friend. <i>“This is the queen of this place. Syri Dorna.”</i>");
		
		output("\n\n<i>“Syri...”</i> Anno echoes, staring. Her tail swishes behind her, and you watch the confusion on her face spread, then morph into something else: delight. <i>“Syri! Aha, that confirms my hypothesis: we <b>are</b> linked to an alternate dimension. And my alternate-dimension self must have trapped you here. Spatial transporter accident, right?”</i>");
		
		output("\n\n<i>“You mean teleporter? Yeah,”</i> the hellhound says, her lust untampered. <i>“I dunno who you are or what those big words were, but I know I like this ship already.”</i>");
		
		output("\n\nAnno just brushes that off with a snicker. <i>“Gross. Well, I know a lot of scientists who are gonna <b>love</b> taking your readings. But we’ve gotta get out of here first, yeah?”</i>");
		
		output("\n\nSyri grunts and hefts up the core again. <i>“Sooner we’re out, the sooner I can get back to starin’ at your tits.”</i>");
		
		output("\n\n<i>“Still a little gross. Why don’t you two see about getting us out of this weird dimension, eh?”</i>");
	}

	output("\n\nYou lead Syri and her armful of datacore to the bridge and rip off a hull panel, exposing the guts of navigational computer. Taking the core from her, you begin the arduous process of installing in your ship. Lucky you, wherever this thing comes from uses the same I/O ports as your ship.");

	currentLocation = "SHIP INTERIOR";
	generateMapForLocation(currentLocation);

	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", ewDemonSyriComeWithII);
}

private function ewDemonSyriComeWithII():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("You wipe the sweat from your brow as you crawl out of the wirey guts of the nav-comp. When you reboot the system, it flashes an Akkadi logo and then begins uploading what promises to be an ungodly load of data. When it’s finished, your computer is, indeed, able to finally make heads and tails of where the hell you are - or at least, where you’ve been. It’s able to calculate a return trip through the featureless cum-colored sky, to the tear in reality hidden somewhere out there, invisible to the naked eye.");
	
	output("\n\nTime to leave.");
	
	output("\n\nYou strap in and take the helm, urging the ship’s engines to life. Syri stuffs herself into the co-pilot’s chair, buckling to safety belt between her tits and around her toned belly. Her tail flops into her lap, giving the lusty pup the closest thing to modesty she’s had in years. She gives you a nod and braces herself.");
	
	// [pc.ship]
	output("\n\nYour ship lifts off and cruises into the sky, back towards your own reality. There’s no visual sign of the tear in space from this side of the portal, so you feel the transition before you see it. Your [pc.skin] tingles, and you feel your flesh heating up - as if you’re hornier than you’ve ever been, making you pant and gasp as a pressure builds in your chest.");
	
	output("\n\nThen the colors out of the forward viewscreen change, erupting into blackness dotted with stars. You’re out! The pressure recedes with a gasp of fresh, untainted air. Home again! You let go of the controls and lean back in the captain’s chair.");
	
	output("\n\nOnce you’ve caught your breath, you turn the sensors around and scan the space behind you. While you’d gotten strange readings from the anomaly before going through, now... now you don’t read anything at all. Even bringing the ship about for a visual scan reveals nothing at all. Whatever that portal was, and wherever it led to, is gone.");
	
	output("\n\n<i>“Holy shit,”</i> Syri laughs, staring out the forward viewscreen into the speckled darkness of space. <i>“I never thought I’d be so glad to see a whole lot of nothing again. I mean, I’m gonna kind of miss that place and all the awesome sex all day every day, but... I wanna see my big bro and parents more. At least for a day before I get my ass back to New Texas or something.”</i>");
	
	output("\n\nShe leans back in the chair and grins to herself, lost in thought. <i>“Yeah, just drop me off at the next spaceport you hit, and I’ll make my way home from there.”</i>");

	if (annoIsCrew())
	{
		output("\n\n<i>“Oh no you don’t,”</i> Anno says, sauntering into the cockpit with a Codex couched under her arm. <i>“First off, you don’t <b>have</b> a brother in this reality, you have a sister - that’s me, by the way, hello - and secondly-”</i>");

		output("\n\nSyri guffaws, slapping her knee with delight. <i>“No shit!? Man I thought my brother was fuckable, but you... hot damn I wish I had a dick right now.”</i>");

		output("\n\nAnno’s cheeks flush red. <i>“Okaaaay, now you’re gross </i>and<i> creepy. Anyway, every mega-corp in the galaxy is gonna pay a fortune to study someone from an alternate reality. We only get like, three or four of you a year, tops.”</i>");

		output("\n\n<i>“Sounds lame,”</i> Syri answers, unbuckling herself from the copilot’s seat. <i>“So... you and the Syri from this dimension not fuckin’ yet or what?”</i>");

		output("\n\n<i>“N-no!”</i> Anno sputters. <i>“What are... you know on second thought, boss, let’s dump this big girl off wherever she wants. I don’t need this getting into the circle of academia.”</i>");

		output("\n\nWell, guess it’s back to plan A then.");
	}

	output("\n\n<i>“Sure you don’t want to stick around?”</i> you ask, eyeing the hellhound’s powerful physique. <i>“Could use a woman like you around.”</i>");

	output("\n\n<i>“Appreciate the offer,”</i> Syri answers with a toothy grin. <i>“But I’ve got a lot of catching up to do, looks like. Maybe I’ll see you around sometime. Maybe I’ll just get lost in some orgy pit somewhere. I dunno. But I definitely don’t want to be shackled down anywhere after all these years. And that includes getting tied down to any</i>body<i> either.”</i>");

	output("\n\nGuess you can’t blame her for that. Alright, time to get on the move then. You dial back into your original destination and spool up the LightDrive...");

	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", ewEventOver);

}

private function ewDemonSyriOkay():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");

	output("You tell her that you will, and turn to leave.");

	output("\n\nNo more demons attempt to waylay you on your trek back to your ship. You drag the computer core onto the bridge and seal the airlock behind you, making sure you don’t take any uninvited guests with you.");

	if (annoIsCrew())
	{
		output("\n\nAfter a few minutes, Anno meets you on the bridge, a concerned look on her face.");

		output("\n\n<i>“Hey boss, how was it out there? I saw some creepy figures poking around in the rocks - they had wings and hooves and... and is that an Akkadi datacore?”</i>");

		output("\n\nSure is. You tell her you’ve got a real story for her on the way home, but for now, you need to get this computer hooked up to your ship’s nav systems. Anno gives a firm nod and rolls up her sleeves, diving in to help like the good girl she is. Between the two of you, it only takes a few minutes to get it locked in.");
	}
	else
	{
		output("\n\nLucky you, wherever this box comes from uses the same standard in/out cables as your ship. It only takes a few minutes to yank out the appropriate plates under your nav computer and install the box in place of your old astrogation system.");
	}

	output("\n\nYou wipe the sweat from your brow as you crawl out of the wirey guts of the nav-comp. When you reboot the system, it flashes an Akkadi logo and then begins uploading what promises to be an ungodly load of data. When it’s finished, your computer is, indeed, able to finally make heads and tails of where the hell you are - or at least, where you’ve been. It’s able to calculate a return trip through the featureless cum-colored sky, to the tear in reality hidden somewhere out there, invisible to the naked eye.");
	
	output("\n\nTime to leave.");
	
	output("\n\nYou strap in and take the helm, urging the ship’s engines to life. Your ship lifts off and cruises into the sky, back towards your own reality. There’s no visual sign of the tear in space from this side of the portal, so you feel the transition before you see it. Your [pc.skin] tingles, and you feel your flesh heating up - as if you’re hornier than you’ve ever been, making you pant and gasp as a pressure builds in your chest.");
	
	output("\n\nThen the colors out of the forward viewscreen change, erupting into blackness dotted with stars. You’re out! The pressure recedes with a gasp of fresh, untainted air. Home again! You let go of the controls and lean back in the captain’s chair.");
	
	output("\n\nOnce you’ve caught your breath, you turn the sensors around and scan the space behind you. While you’d gotten strange readings from the anomaly before going through, now... now you don’t read anything at all. Even bringing the ship about for a visual scan reveals nothing at all. Whatever that portal was, and wherever it led to, is gone.");

	processTime(20+rand(5));

	currentLocation = "SHIP INTERIOR";
	generateMapForLocation(currentLocation);

	clearMenu();
	if (annoIsCrew())
	{	
		addButton(0, "Next", ewDemonSyriOkayII);
	}
	else
	{
		addButton(0, "Next", ewEventOver);
	}
}

private function ewDemonSyriOkayII():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");

	output("Considering Syri’s last request, such as it is, you tell Anno to take a seat. This is going to take some explaining...");
	
	output("\n\n<b>Some time later...</b>");
	
	output("\n\n<i>“Wow,”</i> Anno says, blinking hard and leaning back in the co-pilot’s seat across from you. <i>“So a Syri from an alternate timeline. Gosh, I wish I’d had the chance to meet her. So many things I’d have asked her! Like, if dude-me in her universe is hot. I wonder if I’d fuck me? And where did Annoch go so wrong on her - his! - project that it tore open reality and made a pocket dimension? I bet I could do some interesting stuff with that tech; I’ve been idly working on something similar for a while, but never got anywhere.”</i>");
	
	output("\n\nWait, she’s been working on dimensional travel?");
	
	output("\n\nAnno laughs. <i>“Nah, not <b>really</b>. Just thinkin’ about it. You know, on and off sometimes. Girl’s gotta have her hobbies, you know how it is.”</i>");
	
	output("\n\nUh-huh. <i>“Just try not to open up any portals onboard, okay?”</i>");
	
	output("\n\n<i>“Will do, boss!”</i> Anno snickers, rolling her eyes. <i>“I’ll make sure and pop ‘em open outside! Who knows, maybe Queen Syri will want to say hi.”</i>");

	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", ewEventOver);
}

private function ewDemonSyriFuck():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("You step towards the defeated demoness, shrugging off your gear as you go. Your weapon is the last thing you set aside, placing it on the ground within easy reach. Syri’s on her knees still, fiery eyes regarding you hungrily as you finally stride into arm’s reach, looming over her.");
	
	output("\n\n<i>“Fuck, I was startin’ to think you were gonna blueball me!”</i> the fiendish ausar grins, showing you her fangs. <i>“C’mon, show me what you got, champ. Just so you know, though: I bite!”</i>");
	
	output("\n\nYou can’t tell if that’s a threat or an enticement.");

	clearMenu();

	if (pc.hasCockOrStrapOrClit()) addButton(0, "Pound Puss", ewDemonSyriPoundPuss, undefined, "Pound Her Puss", "Throw the demon queen on her back and fuck her.");
	else addDisabledButton(0, "Pound Puss", "Pound Her Puss", "You’d need a dick, or a strap on, to pound the demonic Syri properly.");

	addButton(1, "Ride Face", ewDemonSyriRideFace, undefined, "Ride Her Face", "Put the bitch on her back and mount her tongue.");
}

private function ewDemonSyriRideFace():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("You grab the demon dog’s shoulders and throw her on her back, spreading her out on the cold sandstone. Despite her submissive position, Syri’s tail wags eagerly at your approach, and her orange eyes flare hungrily as they wander across your naked form. <i>“Ohh, hey there, "+ pc.mf("handsome", "beautiful") +",”</i> she purrs, licking her lips. When she does, the fading light catches on her elongated canines, making her maw look much more bestial than before.");

	output("\n\n");
	if (silly) output("Too bad you don’t have any peanut butter...");
	else output("You can’t wait to see what it can do.");

	output("\n\n<i>“Down, girl,”</i> you command, planting a [pc.foot] on her chest, right between her sweat-slicked tits. Syri growls, but lays herself flat, cupping her hands over her tits. You kneel down over her, flicking your thumbs across her cherry nipples. Just that barest touch is enough to make her gasp, body tensing. If her teats weren’t rock hard before, they sure are now, jutting up between her fingers and beading with... with milk? There’s definitely something white and creamy budding up from her dark mounds, and when she sees you looking, Syri’s cheeks flush red.");
	
	output("\n\n<i>“What?”</i> she snaps, wiping away some of the liquid mess. <i>“Never seen a Treated girl leak before? C’mon, let’s go already!”</i>");
	
	output("\n\nYou’ve got some new ideas about that. Grinning, you swing yourself around so your [pc.butt] is planted over Syri’s face, your [pc.vagOrAss] pressed into her lips. Your hands, meanwhile, settle on her milky tits, teasing the hellhound’s dusky red nipples until more milk starts running down the sides of her olive mounds. She moans and squirms under you, trying to push you off - aww, she’s embarrassed! You dig in your heels, so to speak, and ride the bucking bull-dog until she arches her back and a veritable geyser of milk squirts up from her teats, raining down on your [pc.chest] and her own toned belly.");
	
	output("\n\n<i>“Fuck!”</i> comes a muffled voice from under your ass. <i>“S-stop!”</i>");

	output("\n\nYou tease the hellbitch’s nipples and tell her that when you get off, you’ll think about letting her off the hook. Then again, after a boobgasm like that, maybe your words are more of a threat than a promise!");
	
	output("\n\nEither way, after a grumpy sigh from below you start to feel a long, wet tongue probing your [pc.vagOrAss]. That’s more like it! You push yourself back and down on her wriggling muscle, shivering with pleasure as she enters you. Your hands, meanwhile, tug and twist at her teats, tempting out more of her sweet Treated cream. Now that you’re really working on her, Syri’s milk is starting to flow like a regular cow’s! Too bad she’s on her back - you could get a bucket’s worth out of her at this rate.");
	
	output("\n\nSyri’s tits keep leaking, and her tongue keeps fucking deeper, exploring new and more sensitive depths of your [pc.vagOrAss]. Before long, you’re having to choke back moans and gasps, feeling her tongue flicking along your inner flesh. You murmur that she’s doing good - good girl, just like that! Your [pc.hips] grind over her face, rubbing her nose through the crack of your ass while her tongue’s forced ever deeper inside you. You’re not sure if Syri’s actually skilled at oral or just damn desperate to get you off, but her tongue’s moving like a bucking bronco, thrashing and thrusting against your most sensitive places.");
	
	output("\n\nYou dig your fingers into the hellhound’s tits and hold on as tight as you can as orgasm erupts through you. Your [pc.legs] and [pc.hips] feel like they’re blazing, aflame with sexual heat as your loins are assaulted by Syri’s tongue. The satanic slut goes stock rigid under you as your hands molest her udders, and milk squirts all over you in creamy geysers. You can some of the lactic discharge on your [pc.tongue], the rest on your");
	if (pc.biggestTitSize() > 1) output(" tits.");
	else output(" chest.");

	output("\n\nBy the time Syri’s milky eruption has finally calmed down, your own orgasm has passed as well, leaving you panting for breath and feeling numb all over. The hellhound’s not faring much better, simmering in a pool of her own milk and fuckjuices leaking from her twat. Her thighs are a swamp of girlcum");
	if (pc.hasVagina()) output(" - hers and yours -");
	output(" and her body is slicked with sweat. She isn’t complaining anymore now,, too exhausted and pleasure-numbed to whinge as you pry yourself off of her and stagger back to your [pc.feet].");

	output("\n\nAfter a long moment, the demon queen murmurs, <i>“So what now? You gonna keep doin’ that till the rest of the fuck-hungry sluts here think you’re my "+ pc.mf("king", "queen") +"?”</i>");

	output("\n\nIt’s a tempting offer...");

	processTime(15+rand(10));
	pc.orgasm();

	flags["EVENT_WHORIZON_FUCKED_DEMONSYRI"] = 1;

	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriPoundPuss():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("You close the distance between you");
	if (!pc.hasCock()) output(", activating your [pc.cockOrStrapon] with a flourish. The shaft springs to life, flooding your mind with sensation. You grab your hardlight shaft");
	else output(", and you grab your shaft");
	output(", slapping the crown onto the demon-pup’s plush black lips.");

	if (pc.isMisc())
	{
		output("\n\n<i>“Here, got a bone for you, puppy,”</i> you tease, rubbing your glans on her lips. Syri’s brow furrows in annoyance at the animal comparison, but her infernal cocklust quickly gets the better of her.");
	}
	else
	{
		output("\n\n<i>“What, no bone jokes?”</i> she laughs, flicking her tongue out across your pride. <i>“I like you already. Now hold on!”</i>");
	}

	output("\n\nYou take the bull by the horns, so to speak, as the demonic woman sinks her fingers into your [pc.butt] and slurps on your [pc.cockOrStrapon]. Her lips are dark and strong, squeezes your [pc.knot] while her canid tongue swirls and ripples around the tip of your dick. She’s clearly had some practice, fellating all those cocktacles: it’s only a few seconds before you feel throbbing pleasure coursing up every nerve in your [pc.cockOrStrapon]. You can’t help yourself: you have to have more! Tightening your grip, you thrust your [pc.hips] against her mouth, driving your dick as deep into her throat as you can.");
	
	output("\n\nSyri lets you hold her right where she is, using the muscles of her tongue and throat to milk you while you handle all the heavy lifting. She’s tight as a virgin’s ass when she wants to be, but every time you think you’re getting used to the pressure, the demoness changes her grip, loosening so her tongue can work you harder, or pressing it down in her mouth and sucking hard. A few minutes of that treatment and you have to pull back, already on the edge. When your [pc.cockOrStrapon] pops free of Syri’s mouth, you leave");
	if (!pc.hasCock()) output(" trains of glistening spittle between your glowing energy-schlong and her cock-craving lips");
	else output(" thick smears of pre on her dusky lips");
	output(".");
	
	output("\n\nThe hellhound licks herself clean, making a little moaning noise as she’s deprived of her toy. <i>“Been too long since I had a [pc.cockOrStrapon] to play with! You’re not thinking about takin’ it away now, are you?”</i>");

	output("\n\nYou wouldn’t dream of it.");

	output("\n\nIndeed you’re not sure you could resist her sultry slit’s siren’s song if you tried, especially once her lust-slicked thighs spread and her slender digits spear her sex, spreading it invitingly for you. You push the demon-slut roughly down on her back, wedging yourself between her toned legs and thrusting your [pc.cockOrStrapon] down into the gulf of her sodden muff. Syri howls, a base, bestial sound of roaring pleasure that echoes through the stone chamber. Her head rolls back and her claws dig into your [pc.skinFurScales], pulling you deeper into her feral embrace.");

	output("\n\nThe queen’s cunt clenches powerfully around your cock, making you fight for every inch. You push your dick inside her with all your remaining might, forcing her sodden slit’s walls to part before your victorious member. You revel in the sensation of her flesh grinding across your glans, and clearly the feeling is mutual: Syri’s chest is hammering with her pants, her cherry teats thrusting up into the air so temptingly that you can’t help but reach your [pc.face] down into her cleavage and start to suck.");
	
	output("\n\nSomething rich and creamy squirts across your [pc.tongue].");
	
	output("\n\nSyri gasps, squeezing your [pc.butt] hard. Even while she’s getting fucked, whatever you just did is enough to give the hellhound a thrill. You suck again, and are rewarded in the same way: a moan from your fallen foe, and a rush of sweet cream across your tongue. In a matter of seconds, the mighty warrior facade Syri had been sporting melts away into that of a fuck-hungry slut, begging for cock and thrusting her tits up into your face.");

	output("\n\n<i>“Good girl,”</i> you praise, lapping up the free-flowing milk from her laden tits. Syri whines and moans under you, all restraint wiped away by your cock and your tongue working in tandem on her oversexed body.");
	
	output("\n\nNow that she’s nice and pliant, you decide it’s time to properly put this bitch in her place. You pull yourself off her tits and grab her hips, flipping Syri onto her hands and knees. She grunts and protests, but a few gropes of her breasts and add, and feeling your [pc.cockOrStrapon] twist inside her. The way she cries out, you’re pretty sure she cums - but her pleasure isn’t what you’re interested in. The extra wetness leaking out of her quim is just extra lube, letting you pound her puss hard. The hellhound’s tail swishes heavily, batting against your [pc.face] - when her ass isn’t being slammed forward by your [pc.hips] crashing against it, sending ripples through her supple olive flesh.");
	
	output("\n\n<i>“Fuck yes!”</i> the demoness screams. Her claws rake trenches into the stone, her voice barely able to contain her pleasure. She’s putty in your hands, a willing slave to your cock. Syris thrusts back against you, driving your dick deeper and deeper into her hidden depths, taking every inch of");
	if (pc.hasCock()) output(" man meat");
	else output(" hardlight shaft");
	output(" with desperate glee. <i>“Fuck me fuck me <b>fuck me!</b>”</i>");

	output("\n\nYou do, as hard as you can. Your [pc.hips] drive the eager slut into the ground, hammering against her lush asscheeks. Syri screams, and the demon-dog’s pussy squeezes around your length, leaking girl-cum down her thighs between thrusts.");
	
	output("\n\nHer flurry of rapid-fire orgasmic contractions finally push you over the edge. You slam yourself to the hilt inside the hellhound’s leaking fuckbox and let your [pc.cockOrStrapon]");
	if (pc.hasCock()) output(" blow its load deep in the demon queen’s royal cunny, filling her with your [pc.cum].");
	else output(" overload with pleasure, sending shockwaves of ecstasy through your nerves.");
	
	output("\n\nYour hands lock onto her butt, gripping her tight while your cock");
	if (pc.hasCock()) output(" empties your [pc.balls] into her womb");
	else output(" winds down from its orgasmic simulacrum");
	output(". Your [pc.chest] heaves with labored breath");
	if (pc.hasKnot()) output(", and your [pc.knot] throbs, lodged between Syri’s pussylips by your rogue fucking. With a sigh, you rest yourself on the hellhound’s back, content to wait until your bitch-breaker deflates.");
	else output(" as you slide yourself out of her, unleashing a deluge of juices down her thighs. Cum pools between her legs, and milk is dribbling from her teats onto the floor. What a mess!");

	output("\n\nAfter a long moment, the demon queen murmurs, <i>“So what now? You gonna keep doin’ that till the rest of the fuck-hungry sluts here think you’re my "+ pc.mf("king", "queen") +"?”</i>");

	output("\n\nIt’s a tempting offer...");

	pc.orgasm();

	flags["EVENT_WHORIZON_FUCKED_DEMONSYRI"] = 1;

	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriLookAround():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	flags["EVENT_WHORIZON_DEMONSYRI_LOOKAROUND"] = 1;

	output("You turn your attention away from the demonic ausar for a few moments, searching around her temple’s throne room for some clue as to how you might get out.");
	
	output("\n\nIt doesn’t take long to find, now that the fighting’s over. Behind the throne you discover a solid blue metal box, branded with the Akkadi Research and Development logo - the same one you see plastered on the Warp Gates every time you fly between worlds. You kick it open, revealing some kind of computer interface and readout under the cover.");
	
	output("\n\n<i>“It’s all gibberish to me,”</i> Syri grunts, waving a hand dismissively at the computer box. <i>“It came with me, only part of my kit to survive the jump. Tried to figure it out for a while. Then I got tentacles installed here and stopped giving a shit about... pretty much anything. You know anything about computers?”</i>");
	
	if (pc.IQ() >= 75 || pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nFuck yes you do.");
	}
	else if (pc.isBimbo() || pc.isBro())
	{
		output("\n\nYou know how to look up porn!");
	}
	else
	{
		output("\n\nNot much more than the average joe. You can give it a shot, though.");
	}
	output(" You crouch down beside the computer and boot it up, watching an Akkadi logo flash across the holoscreen before giving way to a massive data readout. There’s what looks like coordinates, mathematics, some kind of galaxy map... but you don’t recognize half the planet names, even in places you know you’ve been.");
	
	output("\n\nNot much help for you, but you’re fairly sure that your ship’s computer could interface with this machine. maybe it could help your navigation systems figure out where you are - it’s been here for years, after all - and how to get out.");
	
	output("\n\nYou won’t know until you get out there and plug this device into the ship. For now, though... what do you do?");

	processTime(10+rand(3));

	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriTalkArrival():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("<i>“How did you wind up here?”</i> you ask her. <i>“Hell, I don’t even know how </i>I<i> ended up here.”</i>");
	
	output("\n\nThe beaten demon shrugs. <i>“Don’t really know. High Command volunteered me for some kind of top-secret bullshit experiment. Trying to use a miniature Warp Gate to teleport behind enemy lines. Well, terrorist lines. Me and my commander, Valden, went through first. Then there was blinding light, and pain, and I woke up here. It was a lot more barren back then, and the demons were just... floating clouds of black mist. Everything was featureless and silent. I thought I was going crazy.”</i>");
	
	output("\n\nSo... she teleported here?");
	if (flags["FUCKED_SYRI_COUNT"] != undefined)
	{
		output(" Yeah, this <b>can’t</b> be your Syri now. Her teleportation was years ago!");
		if (pc.IQ() >= 75) output(" Could this woman be from a parallel dimension? That’s the only thing that makes sense.");
	}
	output(" You’d say it’s hard to believe, but... well, look at this place. Everything here is straight out of a fantasy story.");
	
	output("\n\n<i>“Tell me about it,”</i> the demon-hound laughs, leaning back against one of the lurid statues. <i>“Fuck, I’ve forgotten how good it is just to </i>talk<i> to someone... even if I’m still hornier than a bitch in heat. Maybe I </i>am<i> in heat. Hard to tell anymore.”</i>");
	
	output("\n\nShe laughs again, this time from the belly. <i>“Well, you beat me down. Wanna help a girl out with that, or are you too eager to try and escape to take advantage?”</i>");

	flags["EVENT_WHORIZON_DEMONSYRI_TALK"] = 2;

	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriTalk():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("<i>“Who are you, exactly?”</i> you ask.");
	if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" This isn’t the Syri you know, from back in your... universe? For one, she’s missing the big dick. For another, you’re pretty sure she’s safe at home right now, and this woman’s been here quite a while, by the sound of things.");
	
	output("\n\n<i>“Name’s Syri,”</i> the woman says, sitting her bare ass down on the stone floor. <i>“Sergeant Major Syri Dorna, 7th Royal Ausaril Marines. The yokels like to call me Queen Syri. Use whichever.”</i>");
	
	output("\n\nOkay, then. <i>“So, Syri, how long have you been here?”</i>");
	
	output("\n\nShe shrugs. <i>“Dunno. Been years, two or three maybe. Lost track of time when the gardener cut a hole for tentacles in my throne.”</i>");
	
	output("\n\n<i>“Why’d they give you a throne?”</i> you wonder. <i>“You don’t seem like one of them.”</i>");
	
	output("\n\n<i>“No,”</i> she laughs, orange eyes flaring. <i>“They’re part of me.”</i>");
	
	output("\n\nYou give the hellhound a questioning look, urging her to explain herself.");
	
	output("\n\n<i>“When I got here, I’d just taken this drug called the Treatment. A big ‘fuck you’ to my family, made me this big, sexy slab of amazon meat you see here. Somehow, my being here changed the creatures from this plane, twisted them with my libido. I wanted to fuck, so they started to want it... now it’s all they think about. It’s consumed them. All they can think about is sex, like they <b>feed</b> off it somehow. That’s why they made me the queen - because I made them what they are. They wouldn’t know what to do without me.”</i>");

	flags["EVENT_WHORIZON_DEMONSYRI_TALK"] = 1;

	//replace talk with [Arrival?]
	ewDemonSyriPostCombatMenu();
}

private function ewDemonSyriLoss():void
{
	clearOutput();
	author("Savin");
	showName("DEFEAT:\nDEMON SYRI");
	showBust("DEMONSYRI");

	output("Queen Syri’s black-furred hand is around your neck, pushing you down on the cold stone and pinning you underneath her. Her face is a bare inch from yours, and hot breath plumes across your cheeks. You stare not into her glowing orange eyes, but into the maw of sword-like fangs hovering over your [pc.skin], ready to tear you apart.");

	output("\n\nSyri draws in a long, sharp breath. <i>“Yeah,”</i> she growls, reveling in your scent. <i>“Yeah, that’s good. Haven’t felt this alive in years!”</i>");

	output("\n\nShe throws her head back and howls, a thunderous roar of infernal satisfaction that echoes through the chamber. When Syri’s attention returns to you, a feral grin is on her dark lips, and her fiery eyes look at you with one feeling, and one only: hunger. her claws move roughly across your body, ripping and tearing at your [pc.gear] until there’s almost nothing left. Her palms are surprisingly soft on your bare [pc.skinFurScales], silky black fur brushing across your [pc.nipples] and");
	if (pc.biggestTitSize() > 1) output(" groping your tits");
	else output(" rubbing along your [pc.chest]");
	output("... and then your [pc.hips], gripping you tightly.");

	if (pc.hasCock())
	{
		output("\n\n<i>“Haven’t seen a real dick in ages,”</i> the demonic hound sighs, flicking her tongue across the tip of your [pc.cock]. <i>“That taste is sublime, though. The tentacles and the demons... they can’t compare.”</i>");
		
		output("\n\nA shiver runs through the titan’s tail, thrashing against your [pc.leg].");
		
		output("\n\nUnable to contain herself any longer, Syri plunges down on your [pc.cock], swallowing every inch between her pillowy lips. Her hands pin you down against the stone, leaving you helpless while the fellatrix’s tongue swirls around your [pc.knot] and your [pc.balls] clench");
		if (pc.balls == 1 || pc.balls == 0) output("es")
		output(" in response, leaking pre down her throat. She sucks hard, moving her head up and back down your length without letting up. When she reaches your [pc.cockHead] a second time, she finally has to take a breath, exhaling hot breath across your spit-slicked glans. Her lips close back around the side of your shaft, and Syri runs her head down the throbbing vein on your dick’s underside, right until she’s kissing your [pc.knot].");
		if (pc.balls > 0) output(" Her hand slips down to your [pc.balls], cupping and squeezing your sack until you can’t help but gasp, squirting a few thick globs of pre across her cheek.");
		
		output("\n\nShe doesn’t stop, sucking you off with the fearsome desire of a woman unsatisfied for years. Eventually, her hands release you, busying themselves in your crotch, but the pleasure of the blowjob overwhelms whatever survival instincts you have left. Rather than seize the opportunity to throw her off and escape, you find your hands unconsciously drifting to Syri’s horns, holding onto her bucking head for dear life.");
		
		output("\n\nWhen you finally cum, Syri’s got her lips planted at the base of your cock, watching hungrily as the [pc.cockHead] looming over her erupts in a geyser of [pc.cum]. Your seed rains down over her raven hair, staining it with streaks of [pc.cumColor]. The mess doesn’t faze her in the slightest; if anything, the sudden smell of cum in the air just makes the demon-dog’s tail beat harder.");
		
		output("\n\n<i>“Hope you’re not done,”</i> she growls, licking up a trickle of [pc.cum] from your [pc.cockHead]. <i>“Cuz I’m just getting started.”</i>");
		
		output("\n\nSyri lunges forward, planting her hands on your [pc.chest] and straddling your [pc.hips]. Your cum-soaked cock presses into the gulf between her legs, rubbing against the dark, meaty lips of her twat and the throbbing button at their peak. Sweltering heat pours out from her slit, sultry and wet. Syri’s got no interest in foreplay - or in giving you the few seconds you need to go soft after your orgasm. She rises on her knees, pressing the [pc.cockHead] of your dick into her sex, and slams herself down on your length with hip-cracking force.");
		
		output("\n\nThe wind’s knocked out of your chest by the impact, making you gasp in pain and shock. That seems to just make Syri want you more; she grabs your [pc.chest] fiercely and pulls herself down, pressing her tits into your chest and thrusts her tongue down between your [pc.lips]. While she’s busy raping your mouth, her hips piston up and crash down on your crotch again, threatening to shatter your bones as she rides you with amazonian abandon.");
		
		output("\n\nWhen she breaks the kiss, it’s only to throw her head back and howl again, letting her tits bounce as she moves faster, harder. It takes a moment for you to realize that you’re moaning, barely a whisper beneath the hellhound’s roars. Your hands scrabble at the smooth stone under you, and your [pc.legs] squirm and kick, but you’re utterly pinned under the bestial ausar.");
		
		output("\n\nYou have no choice but to cum and cum again for her.");
	}
	else
	{
		output("\n\n<i>“All I see is pussy and plant-dick,”</i> Syri sighs, looking at your crotch. <i>“I was hoping the first person to reach me would have a dick, but this will have to do. Better than the dream-things I’ve made here, that’s for sure.”</i>");
		
		output("\n\nShe laughs to herself and flicks her tongue out, brushing along the flesh beside your [pc.vagOrAss]. <i>“Fuck, it’s been so long since I tasted real [pc.skinFurScales]. C’mere slut!”</i>");
		
		output("\n\nSyri’s hands hook under your hips, pulling you towards her until your crotch is right under her lips, and thrusts her tongue into your [pc.vagOrAss]. You gasp, squirming under her, but her meaty claws hold you right where she wants you. The hellhound’s tongue is a flurry of motion inside you, probing deep and lavishing every inch of tender flesh it passes with feverish licks. All you can do is wrap your hands around her steer-like horns and hold on for dear life!");
		
		output("\n\nWhen she’s finished with you, you can barely feel your body past the waist. You’ve cum so many times in rapid succession that you can barely remember your own name, much less what you’re doing here, or how you found yourself beneath her demonic auspices. Every iota of your consciousness is consumed in the pleasure of her flesh, of her gropes and licks and kisses.");
		
		output("\n\n<i>“That’s the taste I’ve been missing all these years,”</i> the demon-dog sighs, standing. Her thighs are a sopping mess of arousal, juices glistening in the errant light. <i>“Now it’s your turn.”</i>");
		
		output("\n\nYour addled mind doesn’t have enough time to suss out her intentions before Syri’s knees are pressed to either side of your head and your [pc.face] gets mashed into her muff. Like an obediant puppy, your [pc.tongue] thrusts out into the demon queen’s slit, probing its sultry depths. Unnatural heat radiates from her sex, threatening to burn your [pc.lips]. Yet your muscles move despite the heat, despite the threat of her claws on your cheeks, the weight of her ass on your chin. She stays still for a moment, a mercy after the way your poor body’s been treated already in this hell-dimension, but it’s a short-lived kindness. When your [pc.tongue] is fully buried in her pussy, Syri moves her hands up to the base of one of the statues, steadying herself as her broad hips rise up, and come crashing back down, using your tongue like her own personal fuckstick.");
		
		output("\n\nThe hellhound rides you like there’s no tomorrow, bouncing and grinding on your face. Her howls of pleasure echo through the chamber, thunderous and wild, and her tail beats against your crotch. She doesn’t hold back from cumming: her first orgasm is just a roadbump in her exuberant thrashing. The fifth slows her down a tad. The twentieth makes her break a sweat. And all the while, you’re pinned helplessly underneath her, forced to work for the demon’s pleasure.");
	}

	output("\n\nSeveral hours later, the demon queen is finally done with you. At least for now. You’re covered in a mix of sexual fluids, and you’re exhausted to the point of being unable to move. You’re limp in Syri’s arms as she picks you up, taking you back to her throne and setting you in her lap.");

	output("\n\nYou have just enough time to catch your breath before it starts all over again.");
	
	output("\n\nDays pass of endless sexual slavery between the wolf-demon’s legs. You’re never given the chance to recover your strength; the vitality is sapped out of you with endless orgasms.");

	var numCrew:Number = crew(true);

	if (numCrew == 1)
	{
		var names:Array = getCrewOnShipNames();

		if (names.length != 1)
		{
			output("\n\nERROR: Invalid number of available crewmembers.");
		}

		output(" You barely even notice when a group of demons come into the throne, bearing a cum-soaked "+ names[0] +" between them.");
	}
	else if (numCrew > 1)
	{
		output(" You can only offer the weakest protests when you see your crew dragged in by the queen’s demonic servants, covered in cum and insensate.");
	}
	output(" You spend your days servicing Syri’s sex; your nights held firmly against her warm, strong body as she sleeps - when she isn’t molesting you in the night, awoken by her insatiable libido.");
	
	output("\n\nIt’s several weeks before your hopes of escape are forever shattered, when Queen Syri starts to call you <i>“mate.”</i> She keeps you on her lap or between her firm thighs even when she’s holding <i>“court,”</i> directing the nefarious demons under her command to tear portals in even more worlds, capture more adventurers. The idea of resisting, of trying to save those people, never even crosses your mind. You’re too concerned with how best to please your queen as she guides your [pc.lips] back to her sex.");

	badEnd();
}