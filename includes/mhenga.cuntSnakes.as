import classes.Creature;

// Flags:
// MET_CUNT_SNAKE                : TODO - FIXME
// CUNT_SNAKES_HELPED_TO_INFEST  : TODO - FIXME
// CUNT_SNAKE_EGGS_FAXED_HOME    : TODO - FIXME
// CUNT_TAIL_PREGNANT_TIMER      : TODO - FIXME
// TIMES_FED_CUNT_SNAKE          : TODO - FIXME
// DAYS_SINCE_FED_CUNT_TAIL      : TODO - FIXME

//*Jungle Snakes
//The ones on the first jungle planet, [NOTHING HERE, FOLKS].
//*Encounter a Cunt Snake
public function encounterCuntSnakeOnJungleLand():void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("FIGHT:\nCUNT SNAKE");
	//[First Time]
	if(flags["MET_CUNT_SNAKE"] == undefined)
	{
		flags["MET_CUNT_SNAKE"] = 1;
		output("\n\nMotion in a patch of nearby brushes draws your attention just in time to witness the appearance of a rather strange-looking snake!  Its head lacks eyes, though a pair of rounded bumps do mark where eyes would be; they're obviously some similar kind of sensory organ. The body behind it does not taper as a terran snake's body would, but instead maintains a uniform thickness all the way to the end of its body. The creature's dark-green scales camouflage it well, but not well enough, and clear slime dribbles behind it in a trail, like a slug’s.");
		output("\n\nYour codex makes a warning tone to get your attention and declares, <i>“A cunt snake has been detected. This species is noted for having potent paralyzing or aphrodisiac venom and parasitic tendencies. Avoid if possible, and seek treatment at the nearest medical establishment should one infest you.”</i>");
		output("\n\nAs it moves, you note that it does have a feminine looking orifice on the end of its body. You're stuck fighting some");
		if(!silly) output(" kind of vagina snake");
		else output(" thing out of Nimin Fetish Fantasy");
		output(".");
	}
	//[Repeat]
	else output("\n\nA cunt snake slithers out in front of you, mouth open and fangs dripping with venom. It rises up slightly and prepares to fight!");
	
	// If we put the unlock method call below the regular output, I can make the unlockEntry() method output something when it actually does the Unlock,
	// if we wanna do that.
	CodexManager.unlockEntry("Cunt Snakes");
	
	clearMenu();
	addButton(0,"Next",startCombat,"cunt snake");
}

//*Combat Description
//The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around {two/three/four} feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A moist, drooling pussy is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.
//*Combat Techniques
//	Miss Text: The cunt snake sways aside at the last second!
//	Block Text: Your attack deflects off the cunt snake's {color} scales!
//	AI: Use paralyzing venom every four rounds (after previous bite has worn off!), uses trip often if target is not paralyzed. Also bites aphrodisiac venom.
	//THIS MONSTER IS IMMUNE TO LUST ATTACKS!

public function cuntSnakeAI():void {
	//Dicks get extra venoms
	if(pc.hasCock() && rand(3) == 0) {
		if(rand(4) == 0) paralyzingVenom();
		else aphrodisiacBite();
		return;		
	}
	if(pc.statusEffectv1("Round") % 5 == 0) {
		paralyzingVenom();
	}
	else if(rand(4) == 0) {
		aphrodisiacBite();
	}
	else if(rand(3) == 0) {
		NPCTripAttackGo(foes[0],pc);
	}
	else if(rand(2) == 0) {
		slapAttackFromCuntSnake(foes[0],pc);
	}
	else {
		attack(foes[0], pc);
	}
}


//*Paralyzing Venom
//Used every fifth turn
public function paralyzingVenom():void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("FIGHT:\nCUNT SNAKE");
	output("The snake coils up, then flashes out at you with mouth open and fangs exposed.");
	//{standard miss/block text}
	if (combatMiss(foes[combatStage-1],pc)) {
		output(" It misses!");
	}
	//Blind miss
	else if(foes[combatStage-1].hasStatusEffect("Blind") && rand(2) == 0) output(" It misses due to its blindness!");
	//{hit}
	else {
		if (pc.shieldsRaw > 0) output(" It passes right through your shields, and i");
		else output(" I");
		output("ts attack lands, and you feel the needles sliding through your [pc.skin]. There is a moment of burning pain as the venom enters your bloodstream followed by the gentle deadness of numbed sensation.");
		//{no save}
		if(pc.physique() + rand(20) + 1 < 15) {
			if(pc.hasStatusEffect("Paralyzed")) {
				output(" <b>You're even more paralyzed than before!</b>");
			}
			else
			{
				output(" <b>After a second, you realize you've been paralyzed by the creature's bite!</b>");
				pc.createStatusEffect("Paralyzed",2,0,0,0,false,"Paralyze","You are paralyzed and cannot move until the venom wears off!",true,0);
			}
		}
		//{resist/make save}
		else {
			output(" You yank it off before it can deposit its entire payload, rubbing the sore, rapidly healing spot on your arm in irritation.");
		}
	}
	processCombat();
}

//*Aphrodisiac Venom
public function aphrodisiacBite():void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("FIGHT:\nCUNT SNAKE");
	output("The snake coils up, then flashes out at you with mouth open and fangs exposed. ");
	//{standard miss/block text}
	if (combatMiss(foes[combatStage-1],pc)) {
		output(" It misses!");
	}
	//Blind miss
	else if(foes[combatStage-1].hasStatusEffect("Blind") && rand(2) == 0) output("It misses due to its blindness!");
	//{hit}
	else {
		output("Two spears of hot lust slip through your defenses and straight into your vulnerable veins. In a second, genitalia-engorging chemicals are pumped throughout your body. More and more of them spread through you as the snake injects artificial ardor straight into you.");
		pc.lust(10+rand(5));
		if(pc.lust() >= pc.lustMax()) {
			output("\n\nYou moan and lie back, ");
			if(pc.armor.shortName != "") output("digging into your [pc.armor]");
			else if(pc.lowerUndergarment.shortName != "") output("digging into your [pc.lowerUndergarment]");
			else if(pc.hasVagina()) output("digging into [pc.oneVagina]");
			else if(pc.hasCock()) output("grabbing your [pc.cock]");
			else output("grabbing your [pc.nipples] in an attempt");
			output(" to satisfy the urges welling up within you.");
		}
		//{not defeated}
		else output("\n\nYou wriggle away as hard as you can, and the snake releases its grip on you. The holes its fangs left close up almost as soon as they emptied, leaving you sore and aroused.");
	}
	processCombat();
}

//*Trip
public function NPCTripAttackGo(attacker:Creature,target:Creature):void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("FIGHT:\nCUNT SNAKE");
	output("Your foe contorts its body inward and abruptly snaps its tail around like a whip, directed at your [pc.feet]! ");
	//{standard miss/block text}
	if (combatMiss(foes[combatStage-1],pc)) {
		output("It misses!");
	}
	//Blind miss
	else if(foes[combatStage-1].hasStatusEffect("Blind") && rand(2) == 0) output("It misses due to its blindness!");
	//{hit} 
	else {
		output("Your [pc.legOrLegs]");
		if(pc.legCount == 1) output(" is");
		else output(" are");
		output(" swept out from beneath you and you land hard");
		//Damage bonuses:
		var damage:int = 5;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		//Apply damage reductions
		if(target.shieldsRaw > 0) {
			sDamage = shieldDamage(target,damage,GLOBAL.KINETIC);
			//Set damage to leftoverDamage from shieldDamage
			damage = sDamage[1];
			if(target.shieldsRaw > 0) output(", shield cushioning your impact. (<b>" + sDamage[0] + "</b>)");
			else output(", shattering your energy shield. (<b>" + sDamage[0] + "</b>)");
		}
		if(damage >= 1) {
			damage = HPDamage(target,damage,GLOBAL.KINETIC);
			if(sDamage[0] > 0) output(" Your backside fares little better. (<b>" + damage + "</b>)");
			else output(". (<b>" + damage + "</b>)");	
		}
		//If cock!
		if(pc.hasCock()) {
			output("\n\nThe end of the snake loops around your waist and rubs against ");
			if(!pc.isCrotchGarbed()) output("your [pc.leg]");
			else if(pc.armor.shortName != "") output("the front of your [pc.armor]");
			else output("the front of your [pc.lowerUndergarment]");
			output(", trying to get at [pc.oneCock]. Moist secretions stain your crotch as you find yourself becoming unintentionally aroused by the contact.");
			pc.lust(3+rand(3));
		}
		//{not defeated}
		output(" You roll aside and climb upright, feeling a little more sore");
		if(pc.hasCock()) output(" and horny");
		output(" than before.");
	}
	processCombat();
}

//*Slap
public function slapAttackFromCuntSnake(attacker:Creature,target:Creature):void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("FIGHT:\nCUNT SNAKE");
	output("Coiling its body like a spring, the cunt snake launches its body towards you!");
	//{standard miss/block text}
	//{standard miss/block text}
	if (combatMiss(foes[combatStage-1],pc)) {
		output(" It misses!");
	}
	//Blind miss
	else if(foes[combatStage-1].hasStatusEffect("Blind") && rand(2) == 0) output(" It misses due to its blindness!");
	//{hit} 
	else
	{
		output(" It twists to slap at your [pc.face]");
		//Damage bonuses:
		var damage:int = 5;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		//Apply damage reductions
		if(target.shieldsRaw > 0) {
			sDamage = shieldDamage(target,damage,GLOBAL.KINETIC);
			//Set damage to leftoverDamage from shieldDamage
			damage = sDamage[1];
			if(target.shieldsRaw > 0) output(", bouncing off your shield with loud 'snap'! (<b>" + sDamage[0] + "</b>)");
			else output(", breaching your shield. (<b>" + sDamage[0] + "</b>)");
			
		}
		if(damage >= 1 ) {
			damage = HPDamage(target,damage,GLOBAL.KINETIC);
			if(sDamage[0] > 0) output(" You're sent reeling from the impact while it flops onto the ground. (<b>" + damage + "</b>)");
			else output(", sending you reeling from the impact while it flaps onto the ground. (<b>" + damage + "</b>)");	
			if (!pc.hasStatusEffect("Stunned") && pc.physique() + rand(20) + 1 < 15)
			{
				output("<b> The hit was hard enough to stun you!</b>");
				pc.createStatusEffect("Stunned",1,0,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0);
			}
		}
	}
	processCombat();
}



//*Lose to Jungle Cunt Snake
//	Dicked folks get sucked.
//	One in three chance of being "tailed" for dicked folks.
//	One in five chance of being tailed for ladies.

public function loseToCuntSnake():void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	if(pc.hasCock()) getSuckedOffByACuntSnakeAfterLosing();
	else loseToCuntSnakeAndDontGetSucked();
}

public function cuntSnakeLossEpilogueTailChances():void {
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	if(!pc.hasCuntTail())
	{
		if(pc.hasCock())
		{
			if(rand(3) == 0)
			{
				clearMenu();
				addButton(0,"Next",getACuntTail);
				return;
			}
		}
		else if(rand(5) == 0)
		{
			clearMenu();
			addButton(0,"Next",getACuntTail);
			return;
		}
	}
	output("\n\n");
	genericLoss();
}

//*Get Sucked Off By Snake Loss
public function getSuckedOffByACuntSnakeAfterLosing():void {
	//{HP}
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	if(pc.HP() <= 1) {
		output("You simply can't manage to resist any more and slump down, exhausted. The snake slithers up over its freshly defeated prize. The bumps on its head where eyes would be turn this way and that, while it flicks out its tongue and opens its mouth to take in your scent. It wavers for a moment before turning to regard your groin, somehow detecting the masculine protrusion");
		if(pc.cockTotal() > 1) output("s that lie");
		else output("that lies");
		output(" there.");
		if(pc.isCrotchGarbed())
		{
			if(pc.armor.shortName != "") output(" It noses under your [pc.armor] to locate [pc.oneCock], ");
			else if(pc.lowerUndergarment.shortName != "") output(" It noses aside your [pc.lowerUndergarment] to locate [pc.oneCock], ");
			else output(" It closes in on [pc.oneCock], ");
			output("snuffling noisily at it, the hot exhalations of breath across your maleness inciting you to rise towards erectness unwillingly. You cringe, trying to hold it back, but blood rushes to the offending organ all the same.");
			if(pc.armor.shortName != "") output(" The beast arches its back to shift your [pc.armor] off, leaving you completely exposed.");
			output(" It bites your vulnerable [pc.leg], pumping hot, liquid lust into you to ensure your compliance before resuming its snuffling around.");
		}
	}
	//{Lust}
	else {
		output("You simply can't resist the lust thrumming through your veins at this point. The snake can have what it wants! You shift your ");
		if(pc.armor.shortName != "") {
			output("[pc.armor]");
			if(pc.lowerUndergarment.shortName != "") output(" and [pc.lowerUndergarment]");
		}
		else if(pc.lowerUndergarment.shortName != "") output("[pc.lowerUndergarment]");
		else output("what little gear you carry");
		output(" aside to make room for the aggressive reptilian, exposing [pc.oneCock]. Its fanged mouth nears, turning its sightless eyes inquisitively toward your throbbing boner, and the wide nostrils flare as it drinks deeply of your scent, familiarizing itself with your compliant loins.");
	}
	//{Both}
	output("\n\nSquirming, you try to scoot your hips away from that end of the snake. Those mouthy daggers don't need to get TOO close to your cock; you're far more interested in the juicy wetness at the snake's other end. Thankfully, the snake seems to share your sentiment. It slithers its fore half off the side of your [pc.hip] and onto the ground, its smooth belly scales dragging slowly across your middle and [pc.oneCock] until you feel seeping moisture drizzling down your length.");
	var x:int = pc.cockThatFits(80);
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nThe warm, hungry cunt is just an inch or two away from being properly positioned. If only it were an inch lower, it would be firmly embedded on the tip of your " + pc.cockDescript(x) + ". The snake shifts to adjust itself, placing its " + foes[0].tailVaginaDescript() + "'s entrance against your " + pc.cockHead(x) + ". Thick secretions drip over your lusty pole in sufficient quantity to varnish your shaft in the quim cream, leaving it glistening, oiled, and ready for love. Your muscles clench and pulse in eager anticipation, causing your meat to flex and rise rhythmically against its inhuman partner. The extra friction causes a bead of pre-cum to spill out onto the waiting folds.");
	output("\n\nResponding the unspoken signal you've given, the sinuous, pussy-tipped tail arches, dragging its front half partway up your body before abruptly straightening. Gloriously soft folds, each a sopping wet petal of pure pleasure, part around your " + pc.cockDescript(x) + " one after another, devouring ");
	if(pc.cockVolume(x) > 80) output("a sizable amount of your");
	else output("your entire");
	output(" length. The size and shape is clearly visible through back half of the alien reptile's body, outlined in glittering scales that deform to accommodate as much of you as possible.");
	pc.cockChange();
	output("\n\nYou struggle to stifle a moan of pleasure, but it comes out all the same. Your body is boiling over with lust; the only cure is to stay plunged into the quenching moisture of the snake's " + foes[0].tailVaginaDescript() + ". Your hands clench so hard that you fear you'll draw your own blood, your [pc.hips] lifting up off the ground of their own volition in response to your violently clenching muscles. The tight tube stays firmly locked on your erection throughout, only shifting an inch or two as you begin to buck the empty air.");
	output("\n\nThe movements are enough to make you whimper anew, gnawing on your lower lip as you try to hold onto your sanity. ");//(NO NEW PG)
	//NOT HOARSE
	if(!pc.isTaur()) {
		output("You find the strength to wrap your hands around the smooth, dry scales and squeeze, tightening the snake’s hold on your " + pc.cockDescript(x) + " while simultaneously allowing you to guide its passage along your swollen phallus. The creature seems content to allow you to assist in the copulation, and you begin to pump it up and down, luxuriating in the inhumanly soft insides as they nuzzle against you. It's a heaven of familiar yet alien sensations. You pump it faster and faster, grunting and groaning like an animal.");
	}
	//HOARS
	else {
		output("You desperately wish you could reach around to shove the smooth, scaled tube of pleasure down your [pc.cock " + x + "], but all you can do is buck your [pc.hips] to try and drive your length deeper into the sucking, alien hole. The creature seems to catch on to your desires, and it begins to lurch violently back and forth, pumping up and down for all you are worth. It's clearly cognizant of your desire and works with tireless twitches to tease you until you're grunting and groaning like an animal.");
	}
	//MERGE
	output("\n\nTwo pin-pricks of pain hit your [pc.leg], and you realize the creature is biting you again. The added aphrodisiac is more than you can bear, sending you to such heights of sexual need that your internal muscles begin to spasm and flutter, gathering up a hot, thick load to feed this slurping twat. You cry out as the pressure mounts, and then, relief. You cum hard, straight into the alien's sucking slit, its surface clenching in concentric rings to draw your release towards the snake's middle. It swallows your load with aplomb");
	if(pc.cumQ() >= 1000) output(", at first. Each pulse of [pc.cum] is so large that it distends the alien's surface with spherical bulges");
	if(pc.cumQ() >= 2000) output(". Your lusty deposit leaks out around the edges of the " + foes[0].tailVaginaDescript() + ", dripping from its noticeable clit in sticky ropes");
	if(pc.cumQ() >= 10000) output(". Before long the excess is spraying out in a tidal wave of genetic material, though the tubular fuckhole seems content to drink as much as it can");
	output(".");
	if(pc.cockTotal() > 1)
	{
		if(pc.cockTotal() > 2) output(" Each of y");
		else if(pc.cockTotal() == 2) output("Y");
		output("our other dick");
		if(pc.cockTotal() > 1) output("s");
		output(" sprays a matching deposit wildly, not feeling nearly as good as the lucky, reptile-wrapped prick.");
	}
	output(" You cum yourself dry, wincing at the last empty contractions.");
	
	output("\n\nSpent, you relax back as a much thicker snake slides from your member, insolently slithering off of you while it struggles to handle the deposit. Sleep creeps in from the edges of your vision, and after what you've been through, you're in no position to resist a little rest.");
	processTime(10+rand(5));
	pc.orgasm();
	processTime(45+rand(35));
	cuntSnakeLossEpilogueTailChances();
}

//*No Dicks To Suck
//Pass out or schlick/finger into unconsciousness.
//Reqs !taur OR dicknips or cuntnips, or cunttail, or dicktail
public function loseToCuntSnakeAndDontGetSucked():void {
	//{HP}
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	if(pc.HP() <= 0) 
	{
		output("After being knocked around so much, you can barely stay upright, and you slump to the ground, eyes closing as soon as your body comes to rest. You shudder as you lose consciousness, helpless to stop the snake from doing what it will to you....");
		processTime(15+rand(5));
		pc.orgasm();
		processTime(65+rand(5));
	}
	//{Lust - does not combine with HP}
	else {
		var choices:Array = new Array();
		if(!pc.isTaur()) {
			if(pc.hasVagina()) choices[choices.length] = 0;
			else choices[choices.length] = 5;
		}
		if(pc.hasCuntTail()) choices[choices.length] = 1;
		if(pc.hasCockTail()) choices[choices.length] = 2;
		if(pc.hasFuckableNipples()) choices[choices.length] = 3;
		if(pc.hasDickNipples()) choices[choices.length] = 4;
		
		var select:int = choices[rand(choices.length)];
		
		output("Your body is so hot... so very hot. You're burning up! You tear out of your gear as fast as possible, shedding the assembled equipment into a loose pile on the ground.  Your [pc.skin] is flush with lust, and your ");
		if(select == 0) output("juices are dripping");
		else if(select == 1 || select == 2) output("tail is practically thrumming with need");
		else if(select == 3 || select == 4) output("[pc.nipples] are aching");
		else output("ass is tingling");
		output(" in anticipation. That fucking snake, getting you all hot and bothered! You drop on the ground and ");
		
		//cunt tail
		if(select == 1) {
			output("twist your flexible tail up into your hands. An uncontrollable shiver runs up your spine from your handling of the incredibly sensitive, parasitic organ, and the lips slowly leak a trickle of [pc.girlCum] in encouragement. There's something oddly fitting about lying here with a cunt-snake, masturbating the lovely tail one gave you while under the effects of another's venom. You worry that you might be getting a little too used to this until your fingers slide inside, the pleasure erasing the worry from your thoughts.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn't even move or help, it just sits there, watching you debase yourself.");
		}
		//Cock tail
		else if(select == 2) {
			output("twist your flexible tail up into your hands. An uncontrollable shiver runs up your spine as you peel back the outer covering to expose your [pc.tailCock], admiring the way it stiffens up when it's exposed to the humid air. With a few gentle touches, you cause the semi-tumescent organ to rise to a full and pulsating hardness, so sensitive that wrapping your hand around it causes it to begin to leak pre already.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, even arching up in the direction of tail briefly, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. Your hands squeeze down on the sensitive, tumescent flesh as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn't even move or help, it just sits there, watching you debase yourself.");
		}
		//Nipplecocks
		else if(select == 4) {
			output("start to rub around the edges of your [pc.nipples] with a few fingers, groaning out loud when the turgid lengths of your [pc.nippleCocks] slide out of their concealing areolae like cannons from the side of an ancient ship. Your whole body aches to be touched and stroked, but you're focused entirely on these little, sensitive bits.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, even arching up in the direction of your chest briefly, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. Your hands squeeze down on the sensitive, tumescent flesh as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn't even move or help, it just sits there, watching you debase yourself.");
		}
		//Nipplecunts
		else if(select == 3) {
			output("start to slip your digits into your [pc.nipples], listening to the wet squelches they make as your fingers pass through the sensitive, camouflaged slits and wriggle against the sensitive folds. Your whole body aches to be touched, stroked, and penetrated, particularly your supremely sensitive nip-slits. Unfortunately, they'll have to settle for manual stimulation.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn't even move or help, it just sits there, watching you debase yourself.");
		}
		//Traditional holes
		else {
			output("start to rub around the entrance of your ");
			if(select == 0) output("[pc.vagina] ");
			else output("[pc.asshole] ");
			output("with a few fingers, ");
			if(pc.hasFuckableNipples()) output("fingering a");
			else output("tweaking a");
			output(" [pc.nipple] with the other, anything to sate the burning need within you. Your whole body aches to be touched, stroked, and penetrated.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn't even move or help, it just sits there, watching you debase yourself.");
			//{big clit}
			if(select == 0 && pc.clitLength >= 3.5) {
				output("\n\nYou grab hold of ");
				if(pc.totalClits() > 1) output("a");
				else output("your");
				output(" swollen love-button and begin to pump it, leaving your poor vulvae and inner passage alone long enough to indulge in some phallic-style pleasure. The slippery lube from your cunt is all you need to please the nerve-packed, feminine length, allowing you to stroke it so fast that your eyes cross. Your other hand drifts away from the [pc.nipple] to plunder your vacant vagina, fingering your squeezing, wet hole to the same tempo. It feels so good that your [pc.hips] start to shudder and shake on every downstroke, fucking an imaginary lover and dripping girl-cum everywhere.");
			}
			//{nope but a vagina}
			else if(select == 0) output("\n\nYou press your palm down hard on your mons, dragging it across the sloppy mess that is your [pc.vagina] with enough firmness to squeeze [pc.oneClit] pleasurably into the rest of your womanhood. You stab your fingers into that lusty hole again and again, stirring your engorged honeypot to ever-higher levels of excitement. Your [pc.hips] begin to hump back against your palm while you manhandle your [pc.nipple], trembling as they shudder and shake your [pc.butt] off the ground. You work yourself faster and faster, into a masturbatory frenzy, getting sweat and girl-spunk everywhere.");
			//{buttholes}
			else output("\n\nYou press deeper into your sensitive butthole. Your sphincter clamps down around your fingers at first, but after a few fevered pushes inside, the ring begins to relax and allow you to truly masturbate your [pc.asshole]. Working a third finger into the loosening passage, you increase the tempo until your [pc.butt] is bouncing in the palm of your hand (and on the ground), going faster and faster with every passing moment.");
		}
		//CUM
		//cunt tail
		if(select == 1) {
			output("\n\nPressing the palm of your hand firmly down upon your exoticly-placed mons, you drag and back and forth with enough firmness to squeeze the inhuman clitty pleasurably against your folds. You stab your fingers deep inside with rhythmic, audible squelches, shooting bliss straight up your spine. After mere moments of this, your [pc.hips] are lurching forward and backward in wasted humping motions, your body's instincts clearly unable to adapt to a new source of pleasure beyond your groin. You work yourself faster in faster, lost in a masturbatory frenzy, dripping sweat and girl-spunk everywhere.");
			output("\n\nJuices spray over your [pc.chest], [pc.belly], and the ground around you as your climax makes you squirt everywhere, glossing your surroundings in a sheen of spent lust. The inner lining of your squirming slit contracts down around your fingers and squeezes, wringing them for every drop of imaginary cum that it can.");
		}
		//Cock tail
		else if(select == 2) {
			output("\n\nArching your back, you guide the tip of your tail-borne member up in front of your mouth, considering it ever-so-briefly before gobbling it right on inside. The musky member slides across your wiggling tongue as it twists, writhing through one intense contraction after another, drooling thick dollops of pre down the back of your throat as you work it. You lick and lap with wanton enthusiasm until you can bear it no longer, and then, you begin to thrust your [pc.tail] with hard, fast strokes, fucking your own [pc.face]. There's no way you could stop now!");
			output("\n\nThrusting, pumping, and slurping, you do your best to sate the insatiable desire until you climb to the very brink of a planet-shattering orgasm. Accompanying the coming pleasure is a proportional loss of coordination, and your spasming [pc.tailCock] slips out of your [pc.lips] with a burst of [pc.cum], splattering across your forehead in a long, wet smear. You grab hold of the writhing appendage just in time to aim it over your shoulder, jacking it with frenetic strokes to squeeze out every single drop.");
		}
		//EVERYTHING ELSE
		else {
			output("\n\nArching your back as scintillating pleasure shoots up your spine, your eyes cross and your mind goes white. You giggle in between lurid moans and cum hard using only your hands. ");
			//Regular pussy or butt
			if(select == 0) {
				if(pc.isSquirter()) output("Juices spray over your [pc.legOrLegs] and the ground around you as your climax makes you squirt everywhere, glossing your surroundings in a sheen of spent lust.");
				else if(pc.wetness() >= 3) output("Juices dribble over your [pc.legOrLegs] and [pc.butt] when you climax, running out in a narrow river that your fingers are helpless to slow.");
				else output("Juices soak your fingers when you climax, the inevitable hot, wet conclusion to your passionate finger-tryst.");
			}
			else if(select == 5) output(" Your ring spasms around your probing fingertips, wringing them for all their worth as your eyes roll back from the force of your anal climax.");
			//Nipplecocks
			if(select == 4) {
				output("[pc.Milk] erupts in ");
				if(pc.totalNipples() == 2) output("twin");
				else output("many");
				output(" streams from your [pc.nipples], causing them to thicken and pulse in your hands as you jack ");
				if(pc.biggestTitSize() < 1) output("chest");
				else output("boobs");
				output(" off, splattering thick arcs of [pc.milkColor] down upon yourself.");
			}
			//Nipplecunts
			else if(select == 3) {
				output("Juices spray out around the breast-buried fingers you've thrust inside your [pc.nippleCunts], squirting out a mixture of [pc.girlCum] and [pc.milk] across your knuckles");
				if(pc.biggestTitSize() >= 3) output(" and down the supple curves of your bosom");
				output(". The sticky wetness gets all over your [pc.belly] to glaze you with your own spent lust.");
			}
		}
		//Omniend
		output(" The chemically induced heat sputters and dies within you, leaving you with a self-satisfied smile and moist fingers. The snake is still there, seemingly resting, and you find yourself drifting into a sated slumber as well.");
		processTime(15+rand(5));
		pc.orgasm();
	}
	cuntSnakeLossEpilogueTailChances();
}

//*Get a Cunt Tail
public function getACuntTail():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	//Wake up after falling asleep after loss scene.
	output("A stabbing lance of pain shoots through your spine, just above your [pc.butt]. It's just intense enough stir you from slumber, but not much worse than a nasty scratch, now that you're awake - almost as if you rolled onto a rock while sleeping.");
	output("\n\nYou reach back to feel the wound and touch... scales. Smooth, glossy, reptilian scales. The pain gets worse at contact, but the added sensation aids you in realizing that it's actually two wounds on your backside about an inch apart. It hurts more and more with each passing second, and the severity of the situation dawns on you: the snake is fang-deep in your back. You swat at it with your arm, squirming and writhing from the discomfort, barely missing again and again. When you finally make contact, it doesn't budge, but it does hurt.");
	output("\n\nThe snake's tail thrashes back and forth against you, leaking its copious fluids as it does, crashing into your wrist a few times. You can feel the sensation of scales slapping on your [pc.skin]. The feelings don't originate in your arm, however - a realization that makes panic well up in you. You feel around more gently this time, locating the tubular body before reaching up towards where it connects with your back. Where the creature's head should be, there's a single raised lump of flesh, narrow at the top where it joins to your spine and wider near the base, where it separates from your body just above your [pc.butt].");
	if(pc.tailCount > 0) 
	{
		output(" Where did your [pc.tails] go? The snake is connected to you right where your old tail");
		if(pc.tailCount > 1) output("s");
		output(" used to be... did it swallow ");
		if(pc.tailCount > 1) output("them");
		else output("it");
		output(" whole?");
	}	
	output("\n\nAt the same time, the pain is slowly fading - the agony has been replaced by the tingly throb of knitting flesh and connecting nerve tissue. You wince and poke at it, feeling the pressure from both sides as the irritation diminishes. It seems to have joined with your body, and there's not even a seam you can grab hold of to pry it apart! You grab the thing a bit further down and tug, but it hurts even more, like tugging directly on your spine. The vertebrae inside the thing seem connected directly to your own at this point.");
	if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("\n\nThe scales already match your own, so in a way, it's as if this thing was perfectly made to join with you.");
	else output("\n\nThe scales flake off at your touch, exposing flesh that matches your [pc.skinFurScales] exactly.");
	output(" The thing’s moisture - no, your moisture now - drips from the end as you handle it. You cannot resist lifting the " + foes[0].tailVaginaDescript() + " in front of you to examine. Touching the parasite visibly excites the entrance, and slipping a finger in it feels even better. You flex muscles you didn't even know you had and impale your digit, sucking and wringing it dry with your fresh tail-cunt before you summon the strength of will to pull it away.");
	output("\n\n<b>It will take some time to adjust to having a pussy-tipped tail.</b>\n\n");
	pc.clearTailFlags();
	pc.tailType = GLOBAL.TYPE_CUNTSNAKE;
	pc.tailCount = 1;
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	pc.addTailFlag(GLOBAL.FLAG_THICK);
	pc.tailGenitalArg = foes[0].tailGenitalArg;
	genericLoss();
}

//*Defeat Jungle Cunt Snake
public function defeatACuntSnake():void {
	//{HP}
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	output("The snake flops down, limp and dazed. It doesn't appear to be a threat any longer. It starts trying to slither towards the brush. What do you do?");
	if(pc.lust() >= 33 && pc.hasCock()) {
		output(" The sight of that juicy snatch crawling away has you contemplating a course of action that would be unthinkable were you less aroused. ");
		if(pc.cockThatFits(80) >= 0) output("You could grab it and fuck it, though.");
		else output("You're too big to fuck this thing, unfortunately.");
		clearMenu();
		addButton(0,"Fuck It",fuckACuntSnake);
		addButton(1,"Kill It",killACuntSnake);
		addButton(14,"Leave",leaveIt);
	}
	else {
		clearMenu();
		addButton(1,"Kill It",killACuntSnake);
		addButton(14,"Leave",leaveIt);
	}
}

//*Let It Go
public function leaveIt():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	output("The perverse reptile slithers into the brush, hopefully never to be seen again.\n\n");
	genericVictory();
}

//*Kill It
public function killACuntSnake():void {
	clearOutput();
	output("You finish off creature off quickly and kick the body away.\n\n");
	genericVictory();
}

//*Use it as masturbation aid
//No hoarses.
public function fuckACuntSnake():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	//It probably bites you part way into it and then Fen gets raged at for reversals.
	output("You grab hold of the serpent before it can get away, keeping one hand just behind its head and the other securely clamped near the juicy entrance you plan to use. It's quite hard to whip out [pc.oneCock] and keep hold of the squirming alien, but somehow, you manage to keep everything wrangled and the fangs well away from your flesh. The presence of your burgeoning, rapidly-filling tumescence seems to calm the snake, so much so that it relaxes in your grip. It's the perfect picture of docility.");
	var x:int = pc.cockThatFits(80);
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nYou heft so that the fanged maw is aimed away from you, the pussy presented nicely towards your " + pc.cockHead(x) + ". The fleshy folds squeeze together, forcing out a drizzle of fresh lubricants to bathe your erection. You shudder slightly from the warm, slick moisture that has prepared your " + pc.cockDescript(x) + " and begin to rub the snake's " + foes[0].tailVaginaDescript() + " across yourself, testing the waters to ensure a good, snug fit.");
	output("\n\nPushing the serpent's " + foes[0].tailVaginaDescript() + " against you, you revel in the silken tightness of its alien love tunnel, lewdly thrusting your hips to fully sample its lascivious delights. As soon its lips seal against your [pc.sheath " + x + "], dribbling their slobbery secretions over your ");
	if(pc.balls > 0) output("[pc.balls] and ");
	output("groin, the smooth interior begins to pulsate, trembling and squeezing in contractions that titillate every inch of your " + pc.cockDescript(x) + " with the constant pleasure of near-frictionless, shifting flesh. You recline against a nearby tree for support. Your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" wobbling dangerously, robbed of strength by the pleasure assailing your motor functions, so having the rough bark there to help hold you up is a godsend.");
	pc.cockChange();
	output("\n\nYou shudder as the ripples of concurrent motion slide along your length over and over again, dragging you towards an inexorable orgasm at breakneck pace. Your grip on the snake slackens, and it uses the leverage to slide out of your grip, aided by the smooth texture of its scales. It takes little more than split second for the beast to snap the rest of its body up and around your [pc.sheath " + x + "], constricting tightly. The squeezing pressure of its serpentine length isn't quite strong enough to be painful, but it powerful enough to trap an excess of blood in your erection, making you swell bigger and harder, pulsating with powerful amounts of lust inside your fleshy, organic cocoon.");
	
	output("\n\nThe snake begins to move its " + foes[0].tailVaginaDescript() + " back and forth, in addition to the concentric rings of sucking pleasure that are tugging so pleasantly on your vulnerable dickskin. The addition of a quick, constant back-and-forth motion on top of everything else is too much for you.");
	if(pc.cockTotal() > 1) {
		output("  Your other boner");
		if(pc.cockTotal() == 2) output(" pulsates");
		else output("s pulsate");
		output(" dangerously along with ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" brother, beading droplets of pre-seed in preparation for your coming climax.");
	}
	output(" Surges of white-hot ecstasy rocket through your length, bearing with them copious rivulets of eager lust, and you groan as mount the edge of release.");
	
	output("\n\nThe all consuming heat of release explodes out of you in a river of [pc.cum]. You arch your back and ejaculate again and again, giving the snake exactly what it wants the way you want it.");
	if(pc.cockTotal() > 1) output(" The rest of your [pc.cocks] fire uncaught streams out into the air, painting long lines on the ground while you feed the snake as much as it can milk from you.");
	if(pc.hasDickNipples()) output(" Sprays of [pc.milk] spout from your [pc.nippleCocks] all over everything within a five foot radius in front of you.");
	else if(pc.canMilkSquirt()) output(" Sprays of [pc.milk] launch out from your [pc.nipples] as you unintentionally begin to lactate, lost to your pleasure.");
	if(pc.hasVagina())
	{
		if(pc.isSquirter()) output(" Squirts");
		else if(pc.wetness() >= 2) output(" Dribbles");
		else output(" Trickles");
		output(" of girl-cum escape your ignored netherlips, splattering all over your gear.");
	}
	if(pc.cumQ() >= 500) output(" The serpentine snake-pussy is soon bloating in your hands, and the cock-ring like front half of the creature unwinds, languidly sliding off of you as your load fills it beyond capacity. Bubbles of [pc.cum] dribble out of its gaped entrance as it falls to the ground and slowly begins to move away, a trail of [pc.cumColor] behind it.");
	if(pc.cumQ() >= 1500) output(" You make sure to hose the snake down with the rest of your prodigious, gushing load, splattering huge ropes across its body until it's practically swimming through your seed.");
	else if(pc.cumQ() < 500) output(" The snake gulps down the last few pulses of [pc.cumColor] treat, squeezing and milking your rod as long as it can. Only after you cease to leak any ejaculate at all does it finally give up and uncoil, slipping off and squirming into the bushes before you can catch your breath.");
	
	output("\n\n[pc.OneCock] is soaked in pussy juice but not a drop of cum, and you tuck your female-scented package ");
	if(pc.armor.shortName != "") output("back into your [pc.armor] with a rueful smile.");
	else if(pc.lowerUndergarment.shortName != "") output("back into your [pc.lowerUndergarment] with a rueful smile.");
	else output("away with a rueful smile.\n\n");
	
	processTime(15+rand(15));
	pc.orgasm();
	genericVictory();
}

//*Scenes and Effects for PCs with Cunt Tails
//The cunt tail requires semen weekly. After a week, if the PC defeats a foe with a cunt tail scene or faps, it automatically trigger an appropriate cunt tail scene. Congratulations!
//The tail also has a chance of producing offspring the next day after being fed.
	
//*Cunt tail birthing
public function giveBirthThroughCuntTail():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	output("There is a shifting within you that startles you to awareness, centered just above your [pc.butt]. You wince when a spherical bulge lurches perhaps an inch down your [pc.tail]. It’s trapped inside but slowly moving downwards in fits and start. The everpresent wetness of your [pc.tailCunt] increases, leaking out in a tide that would shame you even if you were locked in the throes of masturbation. Unwanted pleasure rears up in the back of your mind as the exotic sensation of pushing something out through your dripping pussy asserts itself.");
	output("\n\nYou flop down onto your side and curl your spasming tail around, watching the distention make progress along its length. Looking at the shape of the spheroid, you surmise that your tailcunt has created an egg and is giving birth to it now. Pulsing, muscular contractions work to push your ovum closer to the exit, eliciting a moan of pleasure from you in spite of your mild distress at the situation.");
	output("\n\nThe egg begins to move faster, squishing and sliding through as it reaches the well-lubed part of your sloppy channel, and the ensuing feeling causes your back to arch and your tongue to loll from your mouth. Gurgled vocalizations of pleasure escape your mouth. Your hands, desperate to help somehow, grab hold of your [pc.chest] and grope at your [pc.nipples]");
	if(pc.hasNippleCocks()) output(", lewdly pulling on your suddenly-exposed nippledicks");
	else if(pc.isLactating()) output(", tugging out streams of [pc.milk]");
	else if(pc.hasFuckableNipples()) output(", fingering your juicy nippletwats");
	output(". You jerk your [pc.hips] spasmodically and whimper as girlish lube erupts from your [pc.tailCunt] to collect in a glistening puddle. The egg slides again, and you gasp, grunting in excitement, no longer concerned about the situation. You’re too turned on to worry about it by this point; the pleasure is all-consuming.");
	
	output("\n\nGushes of ladycum erupt from you to each abrupt movement within, and you shake every time the egg slips a little further; the pace of the movements is accelerating to the point where the pauses are next to nonexistent. It’s nearly to the end now, where your [pc.tail] is most sensitive. The wonderful little orb stretches and caresses your folds with accidental expertise, forcefully bringing you closer and closer to a birth-induced climax.");
	output("\n\nYou shudder as an explosive push ripples through your [pc.tailCunt] and the smooth, white surface of an egg splits your labia wide, glistening with your juices as your muscles strain to eject it, your clit incredibly hard and proud just above. Climax fills your tail, and juicy secretions flood behind the egg, pressurizing the interior to a degree that the whole thing appears to bloat. You whimper and grab hold of it with both hands, gently kneading and caressing the end to help squeeze out the egg. The white obstruction stretches your hole wider and wider.");
	output("\n\nThen, with a wet pop, it rolls out of your suddenly deflating tail, covered with a torrent of thick, musky liquid, making it glisten in the light. The ensuing orgasm causes you flop around nervelessly in the gigantic puddle you’ve made. [pc.GirlCum] is splattered everywhere while your eyes close and you give yourself over to this unearthly pleasure, silently thanking the cunt snake that gave you this tail for allowing you to feel such perfect ecstasy. You thrust your [pc.hips] lewdly throughout as your body gives into old instincts");
	if(pc.cockTotal() > 1) output(", spewing a load of [pc.cum] from [pc.eachCock] in your passion.");
	else if(pc.hasVagina()) {
		output(", juicing your [pc.legOrLegs] with the outflow from ");
		if(pc.vaginaTotal() == 1) output("your");
		else output("each of your");
		output(" other [pc.vaginas].");
	}
	
	output("\n\nWaves of juice roll out of your [pc.tailCunt] throughout the experience, even after your orgasm winds down and you nervelessly sink down next to your egg, curling your arms around it in motherly affection. That felt so good... surely you have to share this pleasure, don’t you?");
	
	//{If in ship}
	if(currentLocation == "SHIP INTERIOR") {
		output("\n\nDo you leave it outside the ship to fend for itself (and likely acquire a host) or send it off to the on-station daycare that Dad left you?");
	}
	//{Else}
	else {
		output("\n\nDo you conceal it so that it can hatch and potentially force itself on a host of its own, or do you take it back and send to the station your father got you, where it will be cared for but probably remain unattached?");
	}
	processTime(10+rand(5));
	pc.orgasm();
	//[Hide it] [Take it]
	clearMenu();
	addButton(0,"Hide It",hideYoEggYo);
	addButton(1,"Take It",takeYoEggYo);
}

//*Hide It
public function hideYoEggYo():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	output("You find a good spot to hide the egg and leave it there, smiling when you realize that someone else is going to wind up with a juicy, delightful pussy attached to them, compelling them to feed it cum until they wind up feeling what you did... and then the whole cycle can start anew.");
	if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] == undefined) flags["CUNT_SNAKES_HELPED_TO_INFEST"] = 1;
	else flags["CUNT_SNAKES_HELPED_TO_INFEST"]++;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//*Take It
public function takeYoEggYo():void {
	clearOutput();
	userInterface.showBust("CUNTSNAKE");
	userInterface.showName("\nCUNT SNAKE");
	output("You take the egg and secure it on your person. You’ll send it off first thing, so that it will properly cared for and want for nothing - hopefully, to include a host.");
	if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] == undefined) flags["CUNT_SNAKE_EGGS_FAXED_HOME"] = 1;
	else flags["CUNT_SNAKE_EGGS_FAXED_HOME"]++;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function feedCuntSnake():void {
	if(flags["TIMES_FED_CUNT_SNAKE"] == undefined) flags["TIMES_FED_CUNT_SNAKE"] = 1;
	else flags["TIMES_FED_CUNT_SNAKE"]++;
	
	flags["DAYS_SINCE_FED_CUNT_TAIL"] = 0;
	if(flags["CUNT_TAIL_PREGNANT_TIMER"] == undefined) flags["CUNT_TAIL_PREGNANT_TIMER"] = 0;
	if(flags["CUNT_TAIL_PREGNANT_TIMER"] == 0 && rand(5) == 0) flags["CUNT_TAIL_PREGNANT_TIMER"] = 20+rand(9);
}