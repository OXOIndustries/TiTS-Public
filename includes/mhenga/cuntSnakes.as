import classes.Characters.CuntSnake;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;

// Flags:
// MET_CUNT_SNAKE                : TODO - FIXME
// CUNT_SNAKES_HELPED_TO_INFEST  : TODO - FIXME
// CUNT_SNAKE_EGGS_FAXED_HOME    : TODO - FIXME
// CUNT_TAIL_PREGNANT_TIMER      : TODO - FIXME
// TIMES_FED_CUNT_SNAKE          : TODO - FIXME
// DAYS_SINCE_FED_CUNT_TAIL      : TODO - FIXME

//*Jungle Snakes
//The ones on the first jungle planet, [NOTHING HERE, FOLKS].
public function showCuntSnake():void {
	showBust("CUNTSNAKE");
	showName("\nCUNT SNAKE");
}

//*Encounter a Cunt Snake
public function encounterCuntSnakeOnJungleLand():void {
	showBust("CUNTSNAKE");
	showName("FIGHT:\nCUNT SNAKE");
	//[First Time]
	if(flags["MET_CUNT_SNAKE"] == undefined)
	{
		flags["MET_CUNT_SNAKE"] = 1;
		output("\n\nMotion in a patch of nearby bushes draws your attention just in time to witness the appearance of a rather strange-looking snake! Its head lacks eyes, though a pair of rounded bumps do mark where eyes would be; they’re obviously some similar kind of sensory organ. The body behind it does not taper as a terran snake’s body would, but instead maintains a uniform thickness all the way to the end of its body. The creature’s dark-green scales camouflage it well, but not well enough, and clear slime dribbles behind it in a trail, like a slug’s.");
		output("\n\nYour codex makes a warning tone to get your attention and declares, <i>“A cunt snake has been detected. This species is noted for having potent paralyzing or aphrodisiac venom and parasitic tendencies. Avoid if possible, and seek treatment at the nearest medical establishment should one infest you.”</i>");
		output("\n\nAs it moves, you note that it does have a feminine looking orifice on the end of its body. You’re stuck fighting some");
		if(!silly) output(" kind of vagina snake");
		else output(" thing out of Nimin Fetish Fantasy");
		output("!");
	}
	//[Repeat]
	else
	{
		IncrementFlag("MET_CUNT_SNAKE");
		output("\n\nA cunt snake slithers out in front of you, mouth open and fangs dripping with venom. It rises up slightly and prepares to fight!");
	}
	
	// If we put the unlock method call below the regular output, I can make the unlockEntry() method output something when it actually does the Unlock,
	// if we wanna do that.
	CodexManager.unlockEntry("Cunt Snakes");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CuntSnake());
	CombatManager.victoryScene(defeatACuntSnake);
	CombatManager.lossScene(loseToCuntSnake);
	CombatManager.displayLocation("CUNT SNAKE");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//*Combat Description
//The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around {two/three/four} feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A moist, drooling pussy is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.
//*Combat Techniques
//	Miss Text: The cunt snake sways aside at the last second!
//	Block Text: Your attack deflects off the cunt snake's {color} scales!
//	AI: Use paralyzing venom every four rounds (after previous bite has worn off!), uses trip often if target is not paralyzed. Also bites aphrodisiac venom.
	//THIS MONSTER IS IMMUNE TO LUST ATTACKS!

//*Lose to Jungle Cunt Snake
//	Dicked folks get sucked.
//	One in three chance of being "tailed" for dicked folks.
//	One in five chance of being tailed for ladies.

public function loseToCuntSnake():void {
	showCuntSnake();
	if(pc.hasCock()) getSuckedOffByACuntSnakeAfterLosing();
	else loseToCuntSnakeAndDontGetSucked();
}

public function cuntSnakeLossEpilogueTailChances():void {
	showCuntSnake();
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
	CombatManager.genericLoss();
}

//*Get Sucked Off By Snake Loss
public function getSuckedOffByACuntSnakeAfterLosing():void {
	//HP
	showCuntSnake();
	if(pc.HP() <= 1) {
		output("You simply can’t manage to resist any more and slump down, exhausted. The snake slithers up over its freshly defeated prize. The bumps on its head where eyes would be turn this way and that, while it flicks out its tongue and opens its mouth to take in your scent. It wavers for a moment before turning to regard your groin, somehow detecting the masculine protrusion");
		if(pc.cockTotal() > 1) output("s that lie");
		else output("that lies");
		output(" there.");
		if(!pc.isCrotchExposed())
		{
			if(pc.armor.shortName != "" && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" It noses under your [pc.armor] to locate [pc.oneCock], ");
			else if(pc.lowerUndergarment.shortName != "" && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" It noses aside your [pc.lowerUndergarment] to locate [pc.oneCock], ");
			else output(" It closes in on [pc.oneCock], ");
			output("snuffling noisily at it, the hot exhalations of breath across your maleness inciting you to rise towards erectness unwillingly. You cringe, trying to hold it back, but blood rushes to the offending organ all the same.");
			if(pc.armor.shortName != "" && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" The beast arches its back to shift your [pc.armor] off, leaving you completely exposed.");
			output(" It bites your vulnerable [pc.leg], pumping hot, liquid lust into you to ensure your compliance before resuming its snuffling around.");
		}
	}
	//Lust
	else {
		output("You simply can’t resist the lust thrumming through your veins at this point. The snake can have what it wants! You shift your ");
		if(pc.armor.shortName != "" && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) {
			output("[pc.armor]");
			if(pc.lowerUndergarment.shortName != "" && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" and [pc.lowerUndergarment]");
		}
		else if(pc.lowerUndergarment.shortName != "" && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output("[pc.lowerUndergarment]");
		else output("what little gear you carry");
		output(" aside to make room for the aggressive reptilian, exposing [pc.oneCock]. Its fanged mouth nears, turning its sightless eyes inquisitively toward your throbbing boner, and the wide nostrils flare as it drinks deeply of your scent, familiarizing itself with your compliant loins.");
	}
	//Both
	output("\n\nSquirming, you try to scoot your hips away from that end of the snake. Those mouthy daggers don’t need to get TOO close to your cock; you’re far more interested in the juicy wetness at the snake’s other end. Thankfully, the snake seems to share your sentiment. It slithers its fore half off the side of your [pc.hip] and onto the ground, its smooth belly scales dragging slowly across your middle and [pc.oneCock] until you feel seeping moisture drizzling down your length.");
	var x:int = pc.cockThatFits(80);
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nThe warm, hungry cunt is just an inch or two away from being properly positioned. If only it were an inch lower, it would be firmly embedded on the tip of your " + pc.cockDescript(x) + ". The snake shifts to adjust itself, placing its " + enemy.tailVaginaDescript() + "’s entrance against your " + pc.cockHead(x) + ". Thick secretions drip over your lusty pole in sufficient quantity to varnish your shaft in the quim cream, leaving it glistening, oiled, and ready for love. Your muscles clench and pulse in eager anticipation, causing your meat to flex and rise rhythmically against its inhuman partner. The extra friction causes a bead of pre-cum to spill out onto the waiting folds.");
	output("\n\nResponding to the unspoken signal you’ve given, the sinuous, pussy-tipped tail arches, dragging its front half partway up your body before abruptly straightening. Gloriously soft folds, each a sopping wet petal of pure pleasure, part around your " + pc.cockDescript(x) + " one after another, devouring ");
	if(pc.cockVolume(x) > 80) output("a sizable amount of your");
	else output("your entire");
	output(" length. The size and shape is clearly visible through the back half of the alien reptile’s body, outlined in glittering scales that deform to accommodate as much of you as possible.");
	pc.cockChange();
	output("\n\nYou struggle to stifle a moan of pleasure, but it comes out all the same. Your body is boiling over with lust; the only cure is to stay plunged into the quenching moisture of the snake’s " + enemy.tailVaginaDescript() + ". Your hands clench so hard that you fear you’ll draw your own blood, your [pc.hips] lifting up off the ground of their own volition in response to your violently clenching muscles. The tight tube stays firmly locked on your erection throughout, only shifting an inch or two as you begin to buck the empty air.");
	output("\n\nThe movements are enough to make you whimper anew, gnawing on your lower lip as you try to hold onto your sanity. ");//(NO NEW PG)
	//NOT HOARSE
	if(!pc.isTaur()) {
		output("You find the strength to wrap your hands around the smooth, dry scales and squeeze, tightening the snake’s hold on your " + pc.cockDescript(x) + " while simultaneously allowing you to guide its passage along your swollen phallus. The creature seems content to allow you to assist in the copulation, and you begin to pump it up and down, luxuriating in the inhumanly soft insides as they nuzzle against you. It’s a heaven of familiar yet alien sensations. You pump it faster and faster, grunting and groaning like an animal.");
	}
	//HOARS
	else {
		output("You desperately wish you could reach around to shove the smooth, scaled tube of pleasure down your [pc.cock " + x + "], but all you can do is buck your [pc.hips] to try and drive your length deeper into the sucking, alien hole. The creature seems to catch on to your desires, and it begins to lurch violently back and forth, pumping up and down for all you are worth. It’s clearly cognizant of your desire and works with tireless twitches to tease you until you’re grunting and groaning like an animal.");
	}
	//MERGE
	output("\n\nTwo pin-pricks of pain hit your [pc.leg], and you realize the creature is biting you again. The added aphrodisiac is more than you can bear, sending you to such heights of sexual need that your internal muscles begin to spasm and flutter, gathering up a hot, thick load to feed this slurping twat. You cry out as the pressure mounts, and then, relief. You cum hard, straight into the alien’s sucking slit, its surface clenching in concentric rings to draw your release towards the snake’s middle. It swallows your load with aplomb");
	
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 1000) output(", at first. Each pulse of [pc.cum] is so large that it distends the alien’s surface with spherical bulges");
	if(cumQ >= 2000) output(". Your lusty deposit leaks out around the edges of the " + enemy.tailVaginaDescript() + ", dripping from its noticeable clit in sticky ropes");
	if(cumQ >= 10000) output(". Before long the excess is spraying out in a tidal wave of genetic material, though the tubular fuckhole seems content to drink as much as it can");
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
	
	output("\n\nSpent, you relax back as a much thicker snake slides from your member, insolently slithering off of you while it struggles to handle the deposit. Sleep creeps in from the edges of your vision, and after what you’ve been through, you’re in no position to resist a little rest.");
	processTime(10+rand(5));
	enemy.loadInMouth(pc);
	pc.orgasm();
	processTime(45+rand(35));
	cuntSnakeLossEpilogueTailChances();
}

//*No Dicks To Suck
//Pass out or schlick/finger into unconsciousness.
//Reqs !taur OR dicknips or cuntnips, or cunttail, or dicktail
public function loseToCuntSnakeAndDontGetSucked():void {
	//HP
	showCuntSnake();
	if(pc.HP() <= 0) 
	{
		output("After being knocked around so much, you can barely stay upright, and you slump to the ground, eyes closing as soon as your body comes to rest. You shudder as you lose consciousness, helpless to stop the snake from doing what it will to you....");
		processTime(15+rand(5));
		pc.orgasm();
		processTime(65+rand(5));
	}
	//Lust - does not combine with HP
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
		
		var select:int = (choices.length > 0 ? choices[rand(choices.length)] : -1);
		
		output("Your body is so hot... so very hot. You’re burning up! You tear out of your gear as fast as possible, shedding the assembled equipment into a loose pile on the ground. Your [pc.skin] is flush with lust, and your ");
		if(select == 0) output("juices are dripping");
		else if(select == 1 || select == 2) output("tail is practically thrumming with need");
		else if(select == 3 || select == 4) output("[pc.nipples] are aching");
		else output("ass is tingling");
		output(" in anticipation. That fucking snake, getting you all hot and bothered! You drop on the ground and ");
		
		//cunt tail
		if(select == 1) {
			output("twist your flexible tail up into your hands. An uncontrollable shiver runs up your spine from your handling of the incredibly sensitive, parasitic organ, and the lips slowly leak a trickle of [pc.girlCum] in encouragement. There’s something oddly fitting about lying here with a cunt-snake, masturbating the lovely tail one gave you while under the effects of another’s venom. You worry that you might be getting a little too used to this until your fingers slide inside, the pleasure erasing the worry from your thoughts.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn’t even move or help, it just sits there, watching you debase yourself.");
		}
		//Cock tail
		else if(select == 2) {
			output("twist your flexible tail up into your hands. An uncontrollable shiver runs up your spine as you peel back the outer covering to expose your [pc.tailCock], admiring the way it stiffens up when it’s exposed to the humid air. With a few gentle touches, you cause the semi-tumescent organ to rise to a full and pulsating hardness, so sensitive that wrapping your hand around it causes it to begin to leak pre already.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, even arching up in the direction of tail briefly, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. Your hands squeeze down on the sensitive, tumescent flesh as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn’t even move or help, it just sits there, watching you debase yourself.");
		}
		//Nipplecocks
		else if(select == 4) {
			output("start to rub around the edges of your [pc.nipples] with a few fingers, groaning out loud when the turgid lengths of your [pc.nippleCocks] slide out of their concealing areolae like cannons from the side of an ancient ship. Your whole body aches to be touched and stroked, but you’re focused entirely on these little, sensitive bits.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, even arching up in the direction of your chest briefly, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. Your hands squeeze down on the sensitive, tumescent flesh as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn’t even move or help, it just sits there, watching you debase yourself.");
		}
		//Nipplecunts
		else if(select == 3) {
			output("start to slip your digits into your [pc.nipples], listening to the wet squelches they make as your fingers pass through the sensitive, camouflaged slits and wriggle against the sensitive folds. Your whole body aches to be touched, stroked, and penetrated, particularly your supremely sensitive nip-slits. Unfortunately, they’ll have to settle for manual stimulation.");
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn’t even move or help, it just sits there, watching you debase yourself.");
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
			output("\n\nThe serpent slithers lamely around your [pc.legOrLegs] as you submit to your needs, snuffling noisily around you. It’s clearly searching for something, but it turns away after a moment, curling up a few feet away with its vaginal entrance hidden from view. You groan as your digits stroke a particularly sensitive fold, squelching noisily as you begin to vigorously fuck yourself a few feet from the creature responsible for your state. It doesn’t even move or help, it just sits there, watching you debase yourself.");
			//big clit
			if(select == 0 && pc.totalClits() > 0 && pc.clitLength >= 3.5) {
				output("\n\nYou grab hold of ");
				if(pc.totalClits() > 1) output("a");
				else output("your");
				output(" swollen love-button and begin to pump it, leaving your poor vulvae and inner passage alone long enough to indulge in some phallic-style pleasure. The slippery lube from your cunt is all you need to please the nerve-packed, feminine length, allowing you to stroke it so fast that your eyes cross. Your other hand drifts away from the [pc.nipple] to plunder your vacant vagina, fingering your squeezing, wet hole to the same tempo. It feels so good that your [pc.hips] start to shudder and shake on every downstroke, fucking an imaginary lover and dripping girl-cum everywhere.");
			}
			//nope but a vagina
			else if(select == 0)
			{
				output("\n\nYou press your palm down hard on your mons, dragging it across the sloppy mess that is your [pc.vagina]");
				if(pc.hasClit()) output(" with enough firmness to squeeze [pc.oneClit] pleasurably into the rest of your womanhood");
				output(". You stab your fingers into that lusty hole again and again, stirring your engorged honeypot to ever-higher levels of excitement. Your [pc.hips] begin to hump back against your palm while you manhandle your [pc.nipple], trembling as they shudder and shake your [pc.butt] off the ground. You work yourself faster and faster, into a masturbatory frenzy, getting sweat and girl-spunk everywhere.");
			}
			//buttholes
			else output("\n\nYou press deeper into your sensitive butthole. Your sphincter clamps down around your fingers at first, but after a few fevered pushes inside, the ring begins to relax and allow you to truly masturbate your [pc.asshole]. Working a third finger into the loosening passage, you increase the tempo until your [pc.butt] is bouncing in the palm of your hand (and on the ground), going faster and faster with every passing moment.");
		}
		//CUM
		//cunt tail
		if(select == 1) {
			output("\n\nPressing the palm of your hand firmly down upon your exoticly-placed mons, you drag it back and forth");
			if(pc.hasClit()) output(" with enough firmness to squeeze the inhuman clitty");
			output(" pleasurably against your folds. You stab your fingers deep inside with rhythmic, audible squelches, shooting bliss straight up your spine. After mere moments of this, your [pc.hips] are lurching forward and backward in wasted humping motions, your body’s instincts clearly unable to adapt to a new source of pleasure beyond your groin. You work yourself faster in faster, lost in a masturbatory frenzy, dripping sweat and girl-spunk everywhere.");
			output("\n\nJuices spray over your [pc.chest], [pc.belly], and the ground around you as your climax makes you squirt everywhere, glossing your surroundings in a sheen of spent lust. The inner lining of your squirming slit contracts down around your fingers and squeezes, wringing them for every drop of imaginary cum that it can.");
		}
		//Cock tail
		else if(select == 2) {
			output("\n\nArching your back, you guide the tip of your tail-borne member up in front of your mouth, considering it ever-so-briefly before gobbling it right on inside. The musky member slides across your wiggling tongue as it twists, writhing through one intense contraction after another, drooling thick dollops of pre down the back of your throat as you work it. You lick and lap with wanton enthusiasm until you can bear it no longer, and then, you begin to thrust your [pc.tail] with hard, fast strokes, fucking your own [pc.face]. There’s no way you could stop now!");
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
				output("Juices spray out around the breast-buried fingers you’ve thrust inside your [pc.nippleCunts], squirting out a mixture of [pc.girlCum] and [pc.milk] across your knuckles");
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

// Tail Transformation
// adoptType equal to false will force the cunt snake type tail, otherwise type will remain the same and the tailcunt flag will be applied.
public function cuntSnakeTailTF(adoptFlag:Boolean = false, adoptType:Boolean = false, parasite:Boolean = true):void
{
	var i:int = 0;
	var tailFlagList:Array = [];
	var tailTextureList:Array = [GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_SCALED, GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_FEATHERED, GLOBAL.FLAG_GOOEY, GLOBAL.FLAG_STICKY];
	
	if(adoptFlag && pc.tailCount > 0)
	{
		// Non-long, cock, and alternate parasite tails get the cunt snake type anyway
		if(!adoptType || !pc.hasTailFlag(GLOBAL.FLAG_LONG) || pc.hasTailFlag(GLOBAL.FLAG_TAILCOCK) || pc.hasParasiteTail()) pc.tailType = GLOBAL.TYPE_CUNTSNAKE;
		
		for(i = 0; i < pc.tailFlags.length; i++)
		{
			// Carry over texture flags
			if(InCollection(pc.tailFlags[i], tailTextureList)) tailFlagList.push(pc.tailFlags[i]);
		}
	}
	else
	{
		pc.tailType = GLOBAL.TYPE_CUNTSNAKE;
	}
	
	pc.tailCount = 1;
	pc.clearTailFlags();
	if(adoptFlag && tailFlagList.length > 0)
	{
		for(i = 0; i < tailFlagList.length; i++)
		{
			if(!pc.hasTailFlag(tailFlagList[i])) pc.addTailFlag(tailFlagList[i]);
		}
	}
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	if(pc.tailType == GLOBAL.TYPE_CUNTSNAKE) pc.addTailFlag(GLOBAL.FLAG_THICK);
	else pc.addTailFlag(GLOBAL.FLAG_TAILCUNT);
	if(parasite) pc.tailGenital = GLOBAL.TAIL_GENITAL_NONE;
	else pc.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
	pc.tailGenitalArg = enemy.tailGenitalArg;
	pc.tailGenitalColor = enemy.tailGenitalColor;
}

//*Get a Cunt Tail
public function getACuntTail():void {
	clearOutput();
	showCuntSnake();
	//Wake up after falling asleep after loss scene.
	output("A stabbing lance of pain shoots through your spine, just above your [pc.butt]. It’s just intense enough stir you from slumber, but not much worse than a nasty scratch, now that you’re awake - almost as if you rolled onto a rock while sleeping.");
	output("\n\nYou reach back to feel the wound and touch... scales. Smooth, glossy, reptilian scales. The pain gets worse at contact, but the added sensation aids you in realizing that it’s actually two wounds on your backside about an inch apart. It hurts more and more with each passing second, and the severity of the situation dawns on you: the snake is fang-deep in your back. You swat at it with your arm, squirming and writhing from the discomfort, barely missing again and again. When you finally make contact, it doesn’t budge, but it does hurt.");
	output("\n\nThe snake’s tail thrashes back and forth against you, leaking its copious fluids as it does, crashing into your wrist a few times. You can feel the sensation of scales slapping on your [pc.skin]. The feelings don’t originate in your arm, however - a realization that makes panic well up in you. You feel around more gently this time, locating the tubular body before reaching up towards where it connects with your back. Where the creature’s head should be, there’s a single raised lump of flesh, narrow at the top where it joins to your spine and wider near the base, where it separates from your body just above your [pc.butt].");
	if(pc.tailCount > 0) 
	{
		output(" Where did your [pc.tails] go? The snake is connected to you right where your old tail");
		if(pc.tailCount > 1) output("s");
		output(" used to be.... Did it swallow ");
		if(pc.tailCount > 1) output("them");
		else output("it");
		output(" whole?");
	}	
	output("\n\nAt the same time, the pain is slowly fading - the agony has been replaced by the tingly throb of knitting flesh and connecting nerve tissue. You wince and poke at it, feeling the pressure from both sides as the irritation diminishes. It seems to have joined with your body, and there’s not even a seam you can grab hold of to pry it apart! You grab the thing a bit further down and tug, but it hurts even more, like tugging directly on your spine. The vertebrae inside the thing seem connected directly to your own at this point.");
	if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("\n\nThe scales already match your own, so in a way, it’s as if this thing was perfectly made to join with you.");
	else output("\n\nThe scales flake off at your touch, exposing flesh that matches your [pc.skinFurScales] exactly.");
	output(" The thing’s moisture - no, your moisture now - drips from the end as you handle it. You cannot resist lifting the " + enemy.tailVaginaDescript() + " in front of you to examine. Touching the parasite visibly excites the entrance, and slipping a finger in it feels even better. You flex muscles you didn’t even know you had and impale your digit, sucking and wringing it dry with your fresh tail-cunt before you summon the strength of will to pull it away.");
	output("\n\n<b>It will take some time to adjust to having a pussy-tipped tail.</b>\n\n");
	
	cuntSnakeTailTF();
	
	CombatManager.genericLoss();
}

//*Defeat Jungle Cunt Snake
public function defeatACuntSnake():void {
	//HP
	showCuntSnake();
	clearMenu();
	
	var hasLure:Boolean = ((pc.accessory is JungleLure) && pc.tailTypeUnlocked(GLOBAL.TYPE_CUNTSNAKE));
	
	output("The snake flops down, limp and dazed. It doesn’t appear to be a threat any longer");
	if(hasLure) output(", but it’s not trying to escape into the jungle. It just sits there, holding itself up as best it can. The beaten creature seems to want something from you, though it’s in no position to force the matter.");
	else output(". It starts trying to slither towards the brush.");
	
	addButton(0, "Kill It", killACuntSnake);
	
	if(pc.lust() >= 33 && pc.hasCock()) {
		output(" The sight of that juicy snatch");
		if(hasLure) output(" flicking back and forth");
		else output(" crawling away");
		output(" has you contemplating a course of action that would be unthinkable were you less aroused.");
		if(pc.cockThatFits(80) >= 0) output(" You could grab it and fuck it, though.");
		else output(" You’re too big to fuck this thing, unfortunately.");
		
		addButton(1, "Fuck It", fuckACuntSnake);
	}
	
	if(hasLure)
	{
		addButton(2, "Approach", approachCuntSnake, "intro", "Approach It", "Investigate the cunt snake’s strange behavior.");
	}
	
	output("\n\nWhat do you do?");
	
	addButton(14, "Leave", leaveIt);
}

//*Let It Go
public function leaveIt():void {
	clearOutput();
	showCuntSnake();
	output("The perverse reptile slithers into the brush, hopefully never to be seen again.\n\n");
	CombatManager.genericVictory();
}

//*Kill It
public function killACuntSnake():void {
	clearOutput();
	output("You finish the creature off quickly and kick the body away.\n\n");
	CombatManager.genericVictory();
}

//*Use it as masturbation aid
//No hoarses.
public function fuckACuntSnake():void {
	clearOutput();
	showCuntSnake();
	//It probably bites you part way into it and then Fen gets raged at for reversals.
	output("You grab hold of the serpent before it can get away, keeping one hand just behind its head and the other securely clamped near the juicy entrance you plan to use. It’s quite hard to");
	if(!pc.isCrotchExposed()) output(" whip out [pc.oneCock] and");
	output(" keep hold of the squirming alien, but somehow, you manage to keep everything wrangled and the fangs well away from your flesh. The presence of your burgeoning, rapidly-filling tumescence seems to calm the snake, so much so that it relaxes in your grip. It’s the perfect picture of docility.");
	var x:int = pc.cockThatFits(80);
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nYou heft so that the fanged maw is aimed away from you, the pussy presented nicely towards your " + pc.cockHead(x) + ". The fleshy folds squeeze together, forcing out a drizzle of fresh lubricants to bathe your erection. You shudder slightly from the warm, slick moisture that has prepared your " + pc.cockDescript(x) + " and begin to rub the snake’s " + enemy.tailVaginaDescript() + " across yourself, testing the waters to ensure a good, snug fit.");
	output("\n\nPushing the serpent’s " + enemy.tailVaginaDescript() + " against you, you revel in the silken tightness of its alien love tunnel, lewdly thrusting your hips to fully sample its lascivious delights. As soon its lips seal against your [pc.sheath " + x + "], dribbling their slobbery secretions over your ");
	if(pc.balls > 0) output("[pc.balls] and ");
	output("groin, the smooth interior begins to pulsate, trembling and squeezing in contractions that titillate every inch of your " + pc.cockDescript(x) + " with the constant pleasure of near-frictionless, shifting flesh. You recline against a nearby tree for support. Your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" wobbling dangerously, robbed of strength by the pleasure assailing your motor functions, so having the rough bark there to help hold you up is a godsend.");
	pc.cockChange();
	output("\n\nYou shudder as the ripples of concurrent motion slide along your length over and over again, dragging you towards an inexorable orgasm at breakneck pace. Your grip on the snake slackens, and it uses the leverage to slide out of your grip, aided by the smooth texture of its scales. It takes little more than a split second for the beast to snap the rest of its body up and around your [pc.sheath " + x + "], constricting tightly. The squeezing pressure of its serpentine length isn’t quite strong enough to be painful, but it’s powerful enough to trap an excess of blood in your erection, making you swell bigger and harder, pulsating with powerful amounts of lust inside your fleshy, organic cocoon.");
	
	output("\n\nThe snake begins to move its " + enemy.tailVaginaDescript() + " back and forth, in addition to the concentric rings of sucking pleasure that are tugging so pleasantly on your vulnerable dickskin. The addition of a quick, constant back-and-forth motion on top of everything else is too much for you.");
	if(pc.cockTotal() > 1) {
		output(" Your other boner");
		if(pc.cockTotal() == 2) output(" pulsates");
		else output("s pulsate");
		output(" dangerously along with ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" brother, beading droplets of pre-seed in preparation for your coming climax.");
	}
	output(" Surges of white-hot ecstasy rocket through your length, bearing with them copious rivulets of eager lust, and you groan as you mount the edge of release.");
	
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
	
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 500) output(" The serpentine snake-pussy is soon bloating in your hands, and the cock-ring like front half of the creature unwinds, languidly sliding off of you as your load fills it beyond capacity. Bubbles of [pc.cum] dribble out of its gaped entrance as it falls to the ground and slowly begins to move away, a trail of [pc.cumColor] behind it.");
	if(cumQ >= 1500) output(" You make sure to hose the snake down with the rest of your prodigious, gushing load, splattering huge ropes across its body until it’s practically swimming through your seed.");
	else if(cumQ < 500) output(" The snake gulps down the last few pulses of [pc.cumColor] treat, squeezing and milking your rod as long as it can. Only after you cease to leak any ejaculate at all does it finally give up and uncoil, slipping off and squirming into the bushes before you can catch your breath.");
	
	output("\n\n[pc.OneCock] is soaked in pussy juice but not a drop of cum, and you tuck your female-scented package ");
	if(pc.armor.shortName != "") output("back into your [pc.armor] with a rueful smile.");
	else if(pc.lowerUndergarment.shortName != "") output("back into your [pc.lowerUndergarment] with a rueful smile.");
	else output("away with a rueful smile.");
	output("\n\n");
	
	processTime(15+rand(15));
	enemy.loadInCuntTail(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//So this is an idea that cropped up in a forum thread. The basic premise is that buying and equipping the Jungle Lure from V-KO would unlock a new victory scene for cunt snakes that would allow Steele to host them of his/her own free will. The flavor behind the idea is that the concentrated pheromones of the Jungle Lure would make the cunt snake consider Steele a suitable target for infestation 100% of the time. The only prereqs would be having the Jungle Lure equipped and having enough lust to be able to fuck the cunt snake. And being a viable target for cunt snake infestation, I suppose.
public function approachCuntSnake(response:String = "intro"):void
{
	clearOutput();
	showCuntSnake();
	author("MistyBirb");
	clearMenu();
	
	switch(response)
	{
		// Scene Intro
		case "intro":
			output("You " + (pc.hasLegs() ? "take a cautious step forward" : "creep forward carefully") + ", keeping your [pc.meleeWeapon] at the ready. As if on cue, your codex comes to life, warning you about the sexual parasite nearby. You roll your eyes and mutter a sarcastic <i>“thanks,”</i> but the announcement makes you think. The cunt snake is a parasite, and a parasite’s goal is to attach itself to a host...");
			output("\n\nYou relax your stance as you realize what’s going through the creature’s primitive little brain. It must think rather highly of you to be so persistent, even after you clearly demonstrated your ability to overpower it. A few lecherous fantasies wander into your mind, but you shake them away. It would be crazy. Cunt snakes are an invasive species. Pests.");
			output("\n\nBut still, there’s an inkling of desire that you just can’t shrug off. Do you give in to your lewd curiosity?");
			
			processTime(3);
			
			// [Yes] - Go to Scene or Tauric Scene.
			// [No] - Go to Refusal.
			if(!pc.hasGenitals()) addDisabledButton(0, "Yes", "Yes", "It looks like you need to lure the snake with something more... perhaps you need to have your own genitals?");
			else addButton(0, "Yes", approachCuntSnake, "accept");
			addButton(1, "No", approachCuntSnake, "refuse");
			break;
		// Refusal
		case "refuse":
			output("You clear your throat and collect yourself, " + (pc.hasLegs() ? "stepping" : "moving") + " back. There’s no way you’re going to willingly submit to a parasite, not in a million years. You walk away, and the weathered cunt snake drops its head before disappearing into the brush.");
			output("\n\n");
			
			processTime(1);
			
			// [Next] -- End encounter.
			if(inCombat()) CombatManager.genericVictory();
			else addButton(0, "Next", mainGameMenu);
			break;
		// Accept Tail Parasite
		case "accept":
			var oldTailCount:Number = pc.tailCount;
			if(pc.tailType == 0) oldTailCount = 0;
			
			// wearingAnything
			if(!pc.isNude()) output("You smile and begin to remove your clothing, baring your naked form. ");
			output("A rush of adrenaline hits you as you consider what you’re about to do. It’s poorly thought-out, potentially dangerous, and delightfully perverse.");
			
			// Scene
			if(!pc.isTaur())
			{
				output(" You " + (pc.isBiped() ? "crouch down" : "lower yourself") + " and reach out to the cunt snake, which perks up as it senses your change in attitude. The scaled creature brushes against your fingertips, and you give its jaw a few gentle scratches.");
				output("\n\n<i>“Huh, you’re not so bad, are you?”</i> you murmur. The snake presses its face against your [pc.skinFurScales] and coils itself around your arm. It keeps rubbing against you as it travels upwards, sliding over your shoulder and down your back.");
				if(pc.hairLength >= (pc.tallness / 2.5)) output(" You let out a breath of laughter as it gets a little tangled in your [pc.hair], but you free it with a quick shake of your head.");
				output(" " + (pc.hasWings() ? "It slips between your [pc.wings] and works its way" : "It works its way") + " towards your [pc.ass], and the friction of its cool, smooth scales against your " + (pc.hasScales() ? "own" : "[pc.skinFurScales]") + " feels rather sensual.");
				if(pc.isHerm()) output(" In fact, your [pc.multiCocks] stiffen" + (pc.cockTotal() == 1 ? "s" : "") + " in response to the delicate, ticklish sensation, and [pc.eachVagina] dampens with arousal.");
				else if(pc.hasCock()) output(" In fact, [pc.eachCock] stiffen" + (pc.cockTotal() == 1 ? "s" : "") + " in response to the delicate, ticklish sensation. ");
				else if(pc.hasVagina()) output(" In fact, you give a slight shiver as [pc.eachVagina] dampens in response to the delicate, ticklish sensation.");
				output("\n\nYou sigh contentedly as the cunt snake nuzzles against your backside, grinding its face against a particular spot right at the base of your " + (pc.hasTail() ? "[pc.tails]" : "spine") + ".");
				
				if(oldTailCount > 0)
				{
					output("\n\nIt really likes your ass, apparently. You caress the scaly length coiled around your arm and glance over your shoulder. The snake keeps bumping against your [pc.tails], hitting " + (oldTailCount == 1 ? "its" : "their") + " base" + (oldTailCount == 1 ? "" : "s") + " over and over as if it were trying to push " + (oldTailCount == 1 ? "it" : "them") + " out of the way. You give a confused frown when it releases your arm and slithers back onto the ground. ");
					output("\n\nDissatisfied, you wave your [pc.tails] back and forth in an attempt to reacquire the snake’s attention, and it seems to succeed. It follows " + (oldTailCount == 1 ? "the tip" : "their tips") + " with its head for a short while, until its jaw snaps open an imposingly wide amount. You’re surprised by the sheer size of the cunt snake’s abyssal maw, so much so that you don’t even move when it lunges forward and buries its fangs in your backside, swallowing your tail" + (oldTailCount == 1 ? "" : "s") + " whole.");
					output("\n\n<i>“Ow! Fuck!!”</i> you yell, falling forward. Your eyes clamp shut as a horrible pain overwhelms you, a white-hot sensation that consumes your [pc.tails] and shoots up your spine. You throw your arms behind you in an attempt to grab the cunt snake, but it thrashes against your grip. Even when you get a solid hold on it, the snake’s scales seem to slide off its body, taking your hands with them. You start to panic as the sensation in your tail" + (oldTailCount == 1 ? "" : "s") + " goes numb, but it’s quickly replaced by a new, much less unpleasant sensation. The snake finally stops its flailing, although it’s still attached to you. Putting the pieces together, you try to move your tail" + (oldTailCount == 1 ? "" : "s") + ", and feel the snake respond to your influence.");
					output("\n\nNeeding to see it with your own eyes, you pick yourself up and twist to look over your shoulder. Yeah, your [pc.tails] " + (oldTailCount == 1 ? "is" : "are") + " gone. In " + (oldTailCount == 1 ? "its" : "their") + " place is the cunt-snake, but it looks nothing like it did before. It has shed its natural scales and changed its appearance to almost perfectly match the tail" + (oldTailCount == 1 ? "" : "s") + " it swallowed!");
					if(oldTailCount != 1) output(" You’ve only got one tail now, but it comes with a little something “extra.”");
					
					cuntSnakeTailTF(true);
					
					output(" You bring it around your waist and observe the [pc.tailVagina] situated at its tip. With a gentle caress you confirm that you and the cunt snake are very much joined together.");
					if(pc.hasVagina()) output(" It feels just as good as playing with your " + (pc.totalVaginas() == 1 ? "pussy" : "pussies") + ", and your fingers wind up just as wet.");
					else output(" Your touch sends shivers of pleasure running up the length of your new tail, and your face flushes. It’s as much your vagina as it is the snake’s.");
					output(" Coming to terms with the changes to your anatomy, your mind immediately gravitates towards how you might use such a conveniently-placed set of genitalia...");
				}
				else
				{
					output("\n\nIt really likes your ass, apparently. You caress the scaly length coiled around your arm and glance over your shoulder just in time to see the cunt snake pop open its jaw and send its fangs into your [pc.skinFurScales].");
					output("\n\n<i>“Ow! Fuck!!”</i> you yell, falling forward. Your eyes clamp shut as a horrible pain overwhelms you, a white-hot sensation that shoots through your spine. The snake constricts your arm and jerks it back at an uncomfortable angle, pinning it there while your free hand grasps wildly at grass and weeds.");
					output("\n\nFor whatever reason, you feel the urge to stick your [pc.ass] high into the air, as if it would lessen the pain. You lie there, face in the dirt, rear end to the sky, and grunting like a roughly-used whore. " + (pc.isNaga() ? "Your serpentine half whips across the jungle floor as you writhe in agony, but" : "But") + " the pain doesn’t last forever. Your restrained arm is released, and you let it flop onto the ground as you take a few deep breaths. You blink away the last bits of discomfort and pick yourself up, aware of a strange yet pleasant tingling coming from your backside. No, not from it, beyond it. But still a part of it. Still a part of you. Confused, you brush yourself off and twist around.");
					output("\n\nYou have a tail!");
					if(pc.isNaga()) output(" A tail coming from your [pc.ass], at least.");
					
					cuntSnakeTailTF();
					
					output(" The cunt snake has fused with your body, shedding its natural scales and transforming its appearance to perfectly match your [pc.skinFurScales]. As you adjust to the change, you unconsciously flip your new addition over, revealing the soaking [pc.tailVagina] at its tip. With a gentle caress you confirm that you and the cunt snake are very much joined together.");
					if(pc.hasVagina()) output(" It feels just as good as playing with your " + (pc.totalVaginas() == 1 ? "pussy" : "pussies") + ", and your fingers wind up just as wet.");
					else output(" Your touch sends shivers of pleasure running up the length of your new tail, and your face flushes. It’s as much your vagina as it is the snake’s.");
					output(" Coming to terms with the changes to your anatomy, your mind immediately gravitates towards how you might use such a conveniently-placed set of genitalia...");
				}
				
				if(pc.hasCock())
				{
					output("\n\nYou stare at your new [pc.tailVagina], then look down at your fully erect dick" + (pc.cockTotal() == 1 ? "" : "s") + ". It’s certainly not rocket science. You " + (oldTailCount > 0 ? "shift the tip of your new and improved tail downwards" : "clumsily shift your tail downwards, still getting a feel for moving the strange new addition,") + " and press it against the [pc.cockHead] of your [pc.biggestCock]. With an awkward combination of pelvic thrusts and tail curling, you penetrate yourself, sinking to " + (pc.isBiped() ? "your knees as your legs grow weak" : "the ground as your strength fails you") + ".");
					output("\n\nOh yeah, that’s good. That’s really good. Your tail seems to take it upon itself to keep going, hinting that a trace of the cunt snake is still there, but you don’t mind. Not one bit. You moan as your tail convulses around your [pc.biggestCock], and you wrap your hands around it to keep it in place. With a building excitement, you buck your hips, using your tail like an onahole and fucking yourself into a stupor.");
					output("\n\nThere’s definitely a bit of the cunt snake’s aphrodisiac-laced venom in your system, because you don’t last long. Your excited tail-fuck only lasts for a dozen or so thrusts before you’re leaning back and screaming, [pc.cum] flooding your [pc.tailVagina]. You can feel both sides of experience, and the pleasure is mind-numbing.");
					if(pc.hasVagina()) output(" Your other " + (pc.totalVaginas() == 1 ? "vagina soaks" : "vaginas soak") + " your [pc.thighs] with [pc.girlCum], wishing " + (pc.totalVaginas() == 1 ? "it" : "they") + " could receive such splendid attention.");
					output(" You’re pulled in " + (pc.totalGenitals() <= 1 ? "two" : num2Text(pc.totalGenitals() + 1)) + " different directions as you orgasm, and your brain just can’t keep up. You collapse onto your back as the world starts to spin.");
					output("\n\nA few minutes pass before your senses return. You whistle as you sit up, your tail still giving the occasional twitch around your limp [pc.biggestCock]. It slides off as you stand up, and you’re pleased to learn you can control it with almost no effort now that it’s been fed. It seems like it’s in your best interest to keep your new friend full and happy, not that it’s going to be too hard to convince you to do so. Desires satisfied, you rise to your feet and collect your things.");
				}
				else if(pc.hasVagina())
				{
					output("\n\nYou stare at your new [pc.tailVagina] and find your hand drifting downwards. The entire experience has left you feeling a little needy, and your tail isn’t the only thing that’s dripping wet. You bite your lip and tuck your hand between between your [pc.thighs], tracing your fingers around the entrance of [pc.oneVagina].");
					output("\n\nYour tail hovers in front of you, juicing itself in tandem with [pc.eachVagina]. A moan of pleasure slips out of your mouth, and before you know it the tip of your tail is mere inches from your [pc.lips]. Your eyes flutter as you inhale its scent, new and exciting, yet oddly familiar. You can’t resist, and, with agonizing slowness, your [pc.tongue] drags itself across your [pc.tailVagina]. You shudder as your thumb flicks [pc.eachClit] and your tongue slides deeper into your tail, and you marvel at how good it tastes.");
					output("\n\nYour body seizes up as you near orgasm, but you manage to restrain yourself. Not so soon. You need something more satisfying. More... involved. You extract your occupied hand and set both thumbs on either side of your tail, spreading it as wide as you can. Your [pc.tongue] plumbs its depths a few more times, delighting in the ability to taste yourself so easily. But you eventually withdraw and glance down at [pc.eachVagina]. There’s no need to pick favorites.");
					output("\n\nYou curl your tail back and press it against your mons, forcing contact between " + (pc.totalVaginas() == 1 ? "" : "all of") + " your feminine slits. In a matter of seconds your [pc.thighs] are damp with a mixture of [pc.girlcum] and your tail’s own juices. You slide your [pc.tailVagina] down, running it over [pc.eachClit]. The stimulation is almost enough to make you fall over, and you lower yourself to your knees to better maintain balance. With a deep breath you arch your back and hold yourself in anticipation, then thrust your hips against your tail and let it squirm wildly. You yelp and moan as your puffy, swollen folds grind against their sisters, and your clit" + (pc.totalClits() == 1 ? " is" : "s are") + " caught it a whirlwind of convulsing flesh.");
					output("\n\nYou lean back even farther, forcing your lower half forward with your movements until gravity has its way with you. You cry out as you collapse onto your side and your tail kicks into overdrive, quickly joined by both of your hands. You’re fingering, rubbing, and stretching yourself in lustful frenzy. Your voice breaks and your whole body tightens amid an earthshaking orgasm, forcing you to curl into a ball. You tuck your head " + (pc.bRating(0) >= 6 ? ", burying your face in your [pc.breasts 0]" : "") + " before letting out a " + (pc.isSquirter() ? "veritable flood of [pc.girlcum] in all directions" : "squeal and drizzling [pc.girlcum] all over yourself") + ".");
					if(pc.girlCumQ() >= 1000)
					{
						output(" Your hands, " + (pc.hasLegs() ? " legs," : "") + " tail, and practically everything else nearby are left soaked and dripping.");
						pc.applyPussyDrenched();
					}
					output("\n\nThe relief of orgasm lulls you to sleep, but you wake up with a start only a few minutes later. You look down at the mess you made and give a nervous laugh. That was a ride. You stand up and get a feel for moving around again, then work to gather your " + (pc.isNude() ? "possessions" : "clothing") + ". There’s still a lingering hunger coming from your tail, the need for a meal of a more masculine nature, but the sensation is little more than an itch for now. You’ll probably want to take your new friend out to dinner fairly soon, though, lest its appetite become a serious distraction... ");
				}
				if(pc.hasArmor()) output("\n\nYou’re forced make a few adjustments to your [pc.armor] before redressing, but the process is simple enough. You give your tail a few experimental flicks back and forth to make sure it’s comfortable, then secure the rest of your equipment.");
				output("\n\nWith everything in order, you continue on your way, but your imagination runs wild with new ideas and possibilities, each one dirtier than the next.");
			}
			// Tauric Scene
			else
			{
				output("\n\nYou step towards the cunt snake and move to lower yourself to the ground, but are caught off guard when the snake darts beneath you. You freeze, not wanting to crush the poor thing with your significantly greater body mass.");
				output("\n\nYou grunt in frustration and twist your upper half around, trying to catch of glimpse of the elusive snake beneath you. But a warm, wet sensation between your hind legs gives you a good indication of <i>exactly</i> where it’s gone.");
				if(pc.hasCock())
				{
					output("\n\n<i>“Hey!”</i> you cry out, before realizing the last thing the cunt snake would do is listen to you, even when its own safety is at stake. At a loss for how to proceed, you shrug and let the snake do what it wants. You didn’t really have much of a plan anyways. The warmth between your legs spreads across your underbelly, and your face grows hot as your dick" + (pc.cockTotal() == 1 ? " responds" : "s respond") + " to the snake’s inquisitive movements.");
					output("\n\nIt coils itself around your [pc.biggestCock] and starts to squeeze, causing you to involuntarily buck your hips a few times. You’re rock-hard now, and you really strain your back to try and see what exactly is happening to your dick. You get the smallest glimpse of the cunt snake wrapped around your manhood, until it squeezes you even harder. Your upper half jolts upright as you cry out, and the combination of weight and pressure on your cock gets to be more than a little uncomfortable.");
					output("\n\nYou shake your [pc.ass] and widen your stance in an attempt to knock the cunt snake loose, but its grip just tightens in response. You hiss, and you can’t stop yourself from sinking to the ground. Lying on your side, you curl around and finally get a proper look at the cunt snake, its hungry vagina positioned right against the [pc.cockHeadBiggest] of your [pc.biggestCock].");
					output("\n\nThe snake swallows the tip of your dick, then the shaft, then slides all the way to its [pc.biggestSheath] " + (pc.balls > 0 ? "and presses against your [pc.balls]" : "") + ". Once it’s enveloped your cock, it releases its constricting grasp, and you let out a sigh of relief, only to have that sigh turn into a lewd moan as the snake begins to squeeze again, this time in a much more pleasurable way. It writhes around your dick, twitching and spasming as it milks you like a living sex toy. You’re not in much of a position to reciprocate, but it’s pleasurable enough that your upper body flops against the ground in a blissful spasm. You give in to the sensation and let the snake have its way with you, your voice growing louder and more desperate with its every motion.");
					output("\n\nYour breathing gets ragged as your climax nears, and the cunt snake seems to sense the change in composure. It pulses wildly, desperate for your cum. You clench your jaw and ball your fists as your [pc.biggestCock] gives the snake exactly what it wants.");
					if(pc.cockTotal() > 1)
					{
						output(" " + (pc.cockTotal() == 2 ? "Your other dick is no exception, and it colors" : "Your other dicks are no exception, and they color") + " the earth [pc.cumColor] ");
						if(pc.cumQ() >= 1000)
						{
							output(", drenching your lower half with a copious amount of [pc.cum] at the same time");
							pc.applyCumSoaked();
						}
						output(".");
					}
					output(" You groan and shiver, and the orgasm is so good you actually feel a bit light-headed. So much so that you don’t notice the cunt snake slide off your dick and move towards your ass...");
					output("\n\n<i>“Ow! Fuck!!”</i> you yell, pulled from your orgasmic bliss by a white-hot pain in your rear. You kick your hind legs in a panic, scrambling upright. The searing pain only lasts a few moments, though, and by the time you’ve pulled yourself up and twisted your upper half around, it’s gone.");
					if(oldTailCount > 0)
					{
						output("\n\nAlso gone " + (oldTailCount == 1 ? "is" : "are") + " your [pc.tails], having been swallowed whole by the cunt snake. The snake has shed its natural scales and transformed its outer appearance to perfectly match the tail" + (oldTailCount == 1 ? "" : "s") + " it’s replaced, but it sports a little something “extra.”")
						
						cuntSnakeTailTF(true);
						
						output(" You can control it just as easily as your old tail" + (oldTailCount == 1 ? "" : "s") + ", and you curl it around to observe the [pc.tailVagina] at its tip. While you can’t reach it on account of your tauric body, you imagine there are more than a few ways you could put such a conveniently-placed set of genitalia to use.");
					}
					else
					{
						cuntSnakeTailTF();
						
						output("\n\nIn its place is something entirely different: a tail! You have a tail, the cunt snake having fused with your body and transformed its outer appearance to perfectly match your [pc.skinFurScales]. It’s much more than <i>just</i> a tail, though, and you awkwardly curl it around to observe the [pc.tailVagina] at its tip. While you can’t reach it on account of your tauric body, you imagine there are more than a few ways you could put such a conveniently-placed set of genitalia to use.");
					}
					output("\n\nThere’s a strong sense of contentment radiating from it, one that makes you think a bit of the cunt snake you just satisfied is still present. You assume that it will play nicely as long as you feed it, though, and the prospect of pleasuring your new addition is hardly something you dread.");
					output("\n\nIt may not have gone how you expected, but you’re the proud owner of a cunt tail all the same. With a smile, you " + (!pc.isNude() ? "get dressed" : "collect your possessions") + " and set out.");
				}
				else if(pc.hasVagina())
				{
					output("\n\n<i>“Hey!”</i> you cry out, before realizing the last thing the cunt snake would do is listen to you, even when its own safety is at stake. It pokes and prods at your underbelly, exploring your lower half with primitive inquisitiveness. You sigh and throw up your arms, forced to hold your ground lest you accidentally step on the curious creature. But the snake seems to quickly realize what it’s looking for isn’t there. Giving up, it coils itself around your hind leg and works its way towards your flank. You twist back to see its head peeking over your asscheek, almost seeming mischievous and playful.");
					if(oldTailCount > 0)
					{
						output("\n\nYou swat at it a few times with your [pc.tails], brushing " + (oldTailCount == 1 ? "it" : "them") + " against the cunt snake’s scales. It snaps to attention at the contact, following the tip" + (oldTailCount == 1 ? "" : "s") + " of your tails with its head. But your game doesn’t last long, as the cunt snake almost immediately releases its grip on your leg and drops to the ground. You frown in confusion and try to spot it, until you hear a menacing hiss. You tense, but before you can do anything else the snake lunges upwards from between your legs and swallows your tail" + (oldTailCount == 1 ? "" : "s") + " whole!");
						output("\n\n<i>“Ah! Ow!!”</i> you yelp, kicking your back legs a few times purely on instinct, but the snake holds fast. You spin in circles and vainly attempt to reach your rear end to pull the snake free. A bit of panic sets in as the sensation in your [pc.tails] dims, and you struggle even harder, but there’s nothing you can do. You gasp as the stabbing pain reaches a peak and your entire body to seizes up. Eyes clamped shut, you try to focus on anything other than the agony coming from your ass, but fortunately it fades as quickly as it had come.");
						
						cuntSnakeTailTF(true);
						
						output("\n\nYou collect yourself with a few deep breaths and try to move your tail" + (oldTailCount == 1 ? "" : "s") + ". There’s a response, but something is... different. " + (oldTailCount == 1 ? "There’s a strange feeling at the tip" : "For starters, there’s only one tail sprouting from your [pc.ass] now, and you’re hit with the realization that the cunt snake has swallowed your old tails and taken their place. It’s shed it scales and transformed its outer appearance to match the tails it swallowed, though, and aside from the diminished quantity you can’t tell a difference. But there’s at least one difference") + ", and you curl it around to see a swollen, painfully aroused [pc.tailVagina].");
						if(oldTailCount == 1) output(" The cunt snake has fused with you! It’s shed it scales and transformed its outer appearance to almost perfectly match the tail it swallowed, though your old tail certainly didn’t have a vagina at the end...");
					}
					else
					{
						output("\n\nBut the facade of innocence is abruptly shattered as the snake’s jaw snaps open wider than you ever imagined possible. You’re awed by the creature’s abyssal maw, so much so that you don’t even move as it drives its fangs into your ass.");
						output("\n\n<i>“Ah! Ow!!”</i> you yelp, kicking your back legs purely on instinct, but the snake holds fast. You spin in circles and panickedly attempt to reach your rear end, hoping pull the snake free, but it’s a futile struggle. You gasp as the stabbing pain reaches a peak and your entire body to seizes up. Eyes clamped shut, you try to focus on anything other than the agony coming from your ass, but fortunately it fades as quickly as it had come.");
						
						cuntSnakeTailTF();
						
						output("\n\nIn its place is something entirely different: a tail! You have a tail, the cunt snake having fused with your body and transformed its outer appearance to perfectly match your [pc.skinFurScales]. It’s much more than <i>just</i> a tail, though, and you awkwardly curl it around to observe the [pc.tailVagina] at its tip. While you can’t reach it on account of your tauric body, you imagine there are more than a few ways you could put such a conveniently-placed set of genitalia to use...");
					}
					output("\n\nYou bite your lip and twist around as much as you can, carefully positioning your new [pc.tailVagina] right between your flanks. There’s a desperate need leaking from " + (pc.totalVaginas() == 1 ? "both" : "all") + " of your slits, and your hind legs are quickly dripping with a mixture of [pc.girlCum] and your tail’s own juices. With a shuddering breath you slowly drag your tail back and forth across [pc.eachVagina], and the feeling is divine. Being able to pleasure yourself so freely is a new experience, one that you have every intention of drawing out to its fullest extent. You widen your stance a little and take a few deep breaths, then let your tail writhe and squirm against your sex.");
					output("\n\nYou rock back and forth, doing your best to grind against your tail as much as its grinding against you, and before long you’re letting out long, lewd moans.");
					if(pc.hasBreasts())
					{
						output("\n\nYou bring your hands to your [pc.fullChest] and give them a good squeeze, circling each nipple with your fingertips.");
						if(pc.isLactating())
						{
							output(" Drops of [pc.milk] fall to the earth below as your [pc.nipples] [pc.nipplesHarden] and your teasing becomes more forceful. The feeling of the warm liquid running " + ((pc.hasFur() || pc.hasFeathers()) ? "through" : "along") + " your [pc.skinFurScales] makes you squeeze your breasts even harder, until the small drops are replaced by thick streams.");
							output("\n\nYou let out motherly coos of satisfaction as you milk yourself, and you fall into an alternating rhythm of squeezing your breasts and rubbing your flanks against your tail.");
						}
						else
						{
							output(" You sigh as they [pc.nipplesHarden], and you up the intensity of your teasing. You rub, pinch, and pull, practically assaulting your [pc.nipples], and your breath starts to get away from you as pleasure radiates from both ends of your body.");
						}
					}
					output("\n\nYour head drops");
					if(pc.hairLength >= 6) output(" and your [pc.hair] falls over your face");
					output(", the increasingly pronounced need for release stripping your composure away. Shuddering moans give way to full-on cries of pleasure as your climax nears. Your tail kicks into overdrive, writhing wildly against [pc.eachVagina], and your mind goes blank. You stumble forward a few steps and then collapse onto your side, chest heaving as you try to collect yourself. [pc.GirlCum] " + (pc.isSquirter() ? "gushes" : "leaks") + " from your rear end, and your tail gives a few final twitches before going limp and flopping against the ground.");
					output("\n\nYou shut your eyes and lie still on the jungle floor as you slowly descend from your orgasmic peak. Eventually you manage to pull yourself upright, brushing bits of dirt and grass off your [pc.skinFurScales]. There’s a curious sense of satisfaction coming from your tail, quite similar to the satisfaction and relief you feel yourself, but it’s a bit overshadowed by a kind of... hunger. Your tail is craving a meal of a more masculine nature, but for now it seems willing to simply tag along for the ride. You should probably take your new friend out to dinner soon, though, lest its appetite become a serious distraction.");
					output("\n\nIt may not have gone how you expected, but you’re the proud owner of a cunt tail all the same. With a smile, you " + (!pc.isNude() ? "get dressed" : "collect your possessions") + " and set out.");
				}
			}
			output("\n\n");
			
			processTime(20);
			if(pc.hasGenitals()) pc.orgasm();
			
			if(inCombat()) CombatManager.genericVictory();
			else addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			if(inCombat()) CombatManager.genericVictory();
			else addButton(0, "Next", mainGameMenu);
			break;
	}
}

//*Scenes and Effects for PCs with Cunt Tails
//The cunt tail requires semen weekly. After a week, if the PC defeats a foe with a cunt tail scene or faps, it automatically trigger an appropriate cunt tail scene. Congratulations!
//The tail also has a chance of producing offspring the next day after being fed.
	
//*Cunt tail birthing
public function giveBirthThroughCuntTail():void {
	clearOutput();
	showCuntSnake();
	
	if(!pc.hasCuntSnake())
	{
		output("There is a phantom tingling feeling centered just above your [pc.butt]... but it then subsides. You check your codex for anything off and nothing out of the ordinary returns. Hmm, odd.");
		processTime(2);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	
	output("There is a shifting within you that startles you to awareness, centered just above your [pc.butt]. You wince when a spherical bulge lurches perhaps an inch down [pc.oneTail]. It’s trapped inside but slowly moving downwards in fits and starts. The everpresent wetness of your [pc.tailCunt] increases, leaking out in a tide that would shame you even if you were locked in the throes of masturbation. Unwanted pleasure rears up in the back of your mind as the exotic sensation of pushing something out through your dripping pussy asserts itself.");
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
	
	//If in ship
	if(InShipInterior()) {
		output("\n\nDo you leave it outside the ship to fend for itself (and likely acquire a host) or send it off to the on-station daycare that Dad left you?");
		//[Leave it] [Send it off]
		clearMenu();
		addButton(0,"Outside",hideYoEggYo);
		addButton(1,"Daycare",takeYoEggYo);
	}
	//Else
	else {
		output("\n\nDo you conceal it so that it can hatch and potentially force itself on a host of its own, or do you take it back and send to the station your father got you, where it will be cared for but probably remain unattached?");
		//[Hide it] [Take it]
		clearMenu();
		addButton(0,"Hide It",hideYoEggYo);
		addButton(1,"Take It",takeYoEggYo);
	}
	processTime(10+rand(5));
	pc.orgasm();
}

//*Hide It
public function hideYoEggYo():void {
	clearOutput();
	showCuntSnake();
	output("You find a good spot to hide the egg and leave it there, smiling when you realize that someone else is going to wind up with a juicy, delightful pussy attached to them, compelling them to feed it cum until they wind up feeling what you did... and then the whole cycle can start anew.");
	IncrementFlag("CUNT_SNAKES_HELPED_TO_INFEST");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//*Take It
public function takeYoEggYo():void {
	clearOutput();
	showCuntSnake();
	output("You take the egg and secure it on your person. You’ll send it off first thing, so that it will properly cared for and want for nothing - hopefully, to include a host.");
	IncrementFlag("CUNT_SNAKE_EGGS_FAXED_HOME");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Hatchery and children
public function hasCuntsnakesInHatchery():Boolean
{
	return (flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined);
}
public function cuntsnakeHatchery(numSnake:int = 0):void
{
	clearOutput();
	showBust("");
	showName("CUNT SNAKE\nHABITAT");
	author("Jacques00");
	
	var numCuntSnakes:int = (flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined ? flags["CUNT_SNAKE_EGGS_FAXED_HOME"] : 0);
	var numEggsHatched:int = numSnake;
	var numEggsTotal:int = (numCuntSnakes - numEggsHatched);
	if(numEggsTotal < 0) numEggsTotal = 0;
	
	output("You approach the chamber housing your cunt snake");
	if(numEggsTotal > 0 && numEggsHatched > 0) output((numEggsHatched == 1 ? "" : "s") + " and cunt snake egg" + (numEggsTotal == 1 ? "" : "s"));
	else if(numEggsTotal > 0) output(" egg" + (numEggsTotal == 1 ? "" : "s"));
	else output((numEggsHatched == 1 ? "" : "s"));
	output(". Behind the glass, you see that the flora is thick, lush and healthy. The digital gauge reads that the temperature, humidity and precipitation levels are in the ideal range for raising such " + (numCuntSnakes == 1 ? "a creature" : "creatures") + ".");
	if(numEggsHatched > 0) output("\n\nEbbing from at least one of the more phallic-looking plants is a stream of thick, white, protien-rich fluid - prepared especially for your cunt snake offspring whenever " + (numEggsHatched == 1 ? "it is" : "they are") + " hungry. " + (numEggsHatched == 1 ? ("The cunt snake is") : ("You have " + num2Text(numEggsHatched) + " of them, each one")) + " slithering around the environment and drooling very lewd fluids from its vagina-like orifice.");
	if(numEggsTotal > 0) output("\n\nThe egg hatchery currently has " + (numEggsTotal == 1 ? "a single egg" : (num2Text(numEggsTotal) + " eggs"))+ ", incubating in stasis and ready to hatch at any moment.");
	else output("\n\nThe egg hatchery is currently empty, void of any cunt snake eggs.");
	
	clearMenu();
	if(numEggsTotal > 0) addButton(0, "Hatch", hatchCuntsnakeEggs, numEggsTotal, "Cunt Snake Hatchery", ("Prepare to hatch your cunt snake egg" + (numEggsTotal == 1 ? "" : "s") + "."));
	else addDisabledButton(0, "Hatch", "Cunt Snake Hatchery", "You do not have any eggs to hatch!");
	addButton(14, "Leave", mainGameMenu);
}
public function hatchCuntsnakeEggs(numChild:int = 0):void
{
	clearOutput();
	showBust("");
	showName("CUNT SNAKE\nHATCHERY");
	author("Jacques00");
	
	output("You step up to the controls of the cunt snake hatchery and" + (pc.isBimbo() ? ", like, press some buttons and stuff" : " press a few buttons") + ".");
	
	if(numChild <= 0)
	{
		output("\n\nThe interface makes some negative beeps and the screen momentarily blinks yellow and red before returning to its neutral state. It looks like there was an error with your request...");
	}
	else
	{
		output("\n\nThe interface makes some positive beeps and the screen momentarily blinks blue and green. Releasing some compressed air from its vents, the hatchery activates and gets to work hatching");
		if(numChild == 1)
		{
			output(" your egg.");
			output("\n\nYou intently watch as the");
		}
		else
		{
			output(" all " + num2Text(numChild) + " of your eggs.");
			output("\n\nYou intently watch as one of your");
		}
		output(" egg’s surface cracks. The little hatchling cutely hammers her head against the shell’s interior, energetically pushing herself to get out. The machine arms above assists in the hatching by gripping onto the sides and pulling the semi-soft shell apart. With a subtle pop, the tiny cunt snake breaks free of her confines and wriggles out across the soil-covered floor. With contact to the air, her body rapidly increases in size as it adapts to her surroundings. After the initial growth spurt, the infant cunt snake lets out a tired yawn with her gummy, fang-less mouth and proceeds to slither underneath a bush " + ((hours > 6 && hours <= 18) ? "for some cool shade from the sun" : "to instinctually hide from any potential night-time predators") + ". She eventually finds a very phallic-looking plant to suck on.");
		if(numChild == 1) output("\n\nThe hatching process completes itself, the machine cleaning up any stray eggshells, and the newborn snake has comfortably integrated herself to her new environment.");
		else output("\n\nThe hatching process continues until all your cunt snake eggs have fully hatched, the machine cleaning up any stray eggshells, and the newborn snakes have comfortably integrated themselves to their new environment.");
		output("\n\nFor a bunch of gential-biting parasites, the cunt snake is " + (pc.isBimbo() ? "such a cutie" : "pretty cute") + " when it is young and helpless.");
		
		// Commence hatching...
		processTime(3 * numChild);
		StatTracking.track("pregnancy/cuntsnake hatched", numChild);
		StatTracking.track("pregnancy/total day care", numChild);
		addChildCuntsnake(numChild);
	}
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function addChildCuntsnake(numChild:int = 1):void
{
	ChildManager.addChild(
		Child.NewChild(
			GLOBAL.TYPE_CUNTSNAKE,
			2.5,
			numChild,
			0, 1, 0, 0
		)
	);
}

// Feeding
public function feedCuntSnake(cumFrom:Creature = null):void
{
	IncrementFlag("TIMES_FED_CUNT_SNAKE");
	flags["DAYS_SINCE_FED_CUNT_TAIL"] = 0;
	
	if(cumFrom == null) return;
	
	var preg:Boolean = true;
	// Non-parasitic snek cannot preg if host cannot
	if(!pc.hasParasiteTail() && pc.fertility() <= 0) preg = false;
	// Only virile sources work
	if(cumFrom is Flahne) preg = false;
	if(cumFrom.virility() <= 0) preg = false;
	
	if(preg && rand(5) == 0) fertilizeCuntSnake();
}
public function fertilizeCuntSnake():int
{
	if(flags["CUNT_TAIL_PREGNANT_TIMER"] == undefined) flags["CUNT_TAIL_PREGNANT_TIMER"] = ((20 + rand(9)) * 60);
	
	return 1;
}

