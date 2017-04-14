//[DickTailFuck] //requires cocktail (probably a cockvine until Couch’s mystery TF is a thing)

public function dickTailFuck():void
{
	clearOutput();
	showName("TAIL\nFUCKING");
	author("HugsAlright");
	
	var insideShip:Boolean = InShipInterior(pc);
	
	//Couch mystery TF. Whatever that is:
	if(9999 == 0) output("Your tail is acting oddly, seemingly under the control of your baser urges. ");
	output("You smile wide as a rather devious idea crosses your mind. Before you can give it a second thought, you ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("remove your [pc.crotchCovers] and ");
	output("plop yourself down ");
	if(insideShip) output("on your bed");
	else output("on the ground");
	output(", ");
	if(pc.legCount > 1) output("[pc.legs] spread, ");
	output("ready for a nice, big cock. You reach to your side and grab hold of [pc.oneTail], giving it a few strokes as you bring it around in front of you, grinning at the wriggling appendage.");
	output("\n\nYour tail seems excited by your tender stroking, a buzz of pleasure rippling up from its base all the way through your spine, leaving you to exhale a lusty breath. You bring your empty hand to your [pc.tail], massaging it with both hands as you lean forward, guiding the writhing limb towards ");
	if(pc.hasVagina()) output("your waiting snatch");
	else output("your waiting pucker");
	output(". The riotous member doesn’t seem to care much for foreplay, immediately leaping out of your hands and pressing its head against your exposed hole.");

	//hasVagina:
	if(pc.hasVagina()) 
	{
		// Maybe wanna fill unoccupied vaginas first?
		var vIdx:int = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = rand(pc.vaginas.length);
		
		output("\n\nYou let out a gasp of pleasure as your [pc.tailCock] tries to force itself inside of you, its head rubbing against the lips of your [pc.vagina " + vIdx + "]. Your tail finally manages to push its way into your orifice, spreading you wide, causing you to cry out in delight as the sinuous organ buries itself deeper inside you, falling back onto the ");
		if(insideShip) output("mattress");
		else output("ground");
		output(", clawing at ");
		if(insideShip) output("your sheets");
		else output("the floor");
		output(".");

		pc.cuntChange(vIdx,pc.tailCockVolume())

		output("\n\nIt isn’t long before your [pc.tail] starts thrusting in and out of your [pc.vagina " + vIdx + "], slowly building up speed, setting you moaning as your love canal hugs at the appendage’s girth. Surprisingly, your tail seems to be fucking you with enough force to ");
		if(insideShip) output("set your mattress rocking slightly");
		else output("make your body rock back and forth slightly");
		output(", each inward thrust forcing your [pc.vagina " + vIdx + "] wide open, making you whimper like a well-fucked whore.");

		output("\n\nYour fervent appendage continues to ravish your sex, vigorously pounding at it until you’re left screaming with joy, head thrown back in delight. Everything culminates with a burning feeling building in your loins, [pc.eachVagina] beginning to spasm, making you loose a long groan from your lips as your climax ensues. Your cunt clamps down around the tailcock fucking it, the movements of your inner muscles milking the insatiable organ as your arms and legs lock. Orgasm rocks your body, your [pc.tailCock] quick to join in, pushing itself as deep inside of you as it can get before it starts to empty its load of ");
		if(pc.hasParasiteTail()) output("parasitic seed");
		else output("[pc.cumNoun]");
		output(" into your womb");
		if(pc.hasCock()) output(", your [pc.cocks] following suit and spraying your midsection down with [pc.cumNoun]");
		output(". Your climax continues for quite some time as you’re pumped full of warm cum, shuddering with pleasure as you wind down.");

		output("\n\nYou’re left with your [pc.chest] heaving and a cunt filled to the brim with cum. Propping yourself up on your elbows, you witness your [pc.tailCock] making it’s way out of your sodden hole, covered in [pc.girlCumNoun]. You reach forward and give your prehensile friend an appreciative little stroke, smiling as you do so. Nothing left to do now besides clean up and get ready to move again.");
		//This variation should have a chance to trigger a cockvine pregnancy.
		pc.loadInCunt(chars["COCKVINE"], vIdx);
	}
	//noVagina:
	else
	{
		output("\n\nYou let out a gasp of pleasure as your [pc.tailCock] tries to force itself inside of you, pressure building against your [pc.asshole]. Your tail finally manages to push its way into your orifice, spreading you wide, causing you to cry out in delight as the sinuous organ buries itself deeper inside you, falling back onto the ");
		if(insideShip) output("mattress");
		else output("ground");
		output(", clawing at ");
		if(insideShip) output("your sheets");
		else output("the floor");
		output(".");
		pc.buttChange(pc.tailCockVolume())

		output("\n\nIt isn’t long before your [pc.tail] starts thrusting in and out of your supple hole, slowly building up speed, setting you moaning as your inner walls hug at the appendage’s girth. Surprisingly, your tail seems to be fucking you with enough force to ");
		if(insideShip) output("set your mattress rocking slightly");
		else output("make your body rock back and forth slightly");
		output(", each inward thrust forcing your [pc.asshole] wide open, making you whimper like a well-fucked whore.");

		output("\n\nYour fervent appendage continues to ravish your asshole, vigorously pounding at it until you’re left screaming with joy, head thrown back in delight. Everything culminates with a burning feeling building in your loins, your rectal walls beginning to spasm, making you loose a long groan from your lips as your climax ensues. Your pucker clamps down around the tailcock fucking it, the movements of your inner muscles milking the insatiable organ as your arms and legs lock. Orgasm rocks your body, your [pc.tailCock] quick to join in, pushing itself as deep inside of you as it can get before it starts to empty its load of ");
		if(pc.hasParasiteTail()) output("parasitic seed");
		else output("[pc.cumNoun]");
		output(" into the depths of your asshole");
		if(pc.hasCock()) output(", your [pc.cocks] following suit and spraying your midsection down with [pc.cum]");
		output(". Your climax continues for quite some time as you’re pumped full of warm cum, shuddering with pleasure as you wind down.");

		output("\n\nYou’re left with your [pc.chest] heaving and a butt filled to the brim with cum. Propping yourself up on your elbows, you witness your [pc.tailCock] making it’s way out of your sodden hole. You reach forward and give your prehensile friend an appreciative little stroke, smiling as you do so. Nothing left to do now besides clean up and get ready to move again.");
		pc.loadInAss(chars["COCKVINE"]);
	}
	processTime(23);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Self Suck
//[DickTailSuck] //requires cocktail + cock or vagina.
public function tailSucking():void
{
	clearOutput();
	showName("TAIL\nSUCKING");
	author("HugsAlright");
	
	var insideShip:Boolean = InShipInterior(pc);
	
	//Couch mystery TF. Whatever that is:
	if(9999 == 0) output("Your tail is acting oddly, seemingly under the control of your baser urges. ");
	output("You smile wide as a rather devious idea crosses your mind. Before you can give it a second thought, you ");
	if(!pc.isAssExposed() && !pc.isCrotchExposed()) 
	{
		output("begin to remove your ");
		if(!pc.isCrotchExposed()) output("[pc.crotchCovers]");
		else output("[pc.assCovers]");
		output(" and ");
	}
	output("plop yourself down ");
	if(insideShip) output("on the edge of your bed");
	else output("on a more comfortable looking rock");
	//notNude:
	if(!pc.isNude()) output(", last of your clothing coming off");
	output(". Reaching around your back, you grab hold of your gently swaying [pc.tail], giving it a few strokes as you bring it around in front of you, grinning at the wriggling appendage.");

	output("\n\nYour tail seems excited by your tender stroking, a buzz of pleasure rippling up from its base all the way through your spine, leaving you to exhale a lusty breath. You bring your empty hand to your [pc.tail], massaging it with both hands as you open your mouth, letting your [pc.tongue] loll out, guiding your [pc.tailCock] to your waiting maw. The appendage springs forward in your hands, implanting itself in the warm, wet hole of your mouth. You’re startled when your impatient tail-dick jumps into your mouth on its own, but quickly relax as it makes itself comfortable between your lips.");
	output("\n\nIt isn’t long before your [pc.tailCock] starts moving in your mouth: short, little thrusts that make you whimper, pleasure radiating through your tail");
	if(pc.hasCock()) output(", your [pc.cocks] slowly stiffening");
	if(pc.hasVagina())
	{
		output(", ");
		if(pc.isHerm()) output("and ");
		output("your [pc.vaginas] growing ever wetter");
	}
	output(", eager to join in on the fun. Your eyes flutter shut as you find your mind flooded with lust, [pc.tongue] slathering your [pc.tail]’s head with saliva as it thrusts in and out of your mouth, pounding your willing orifice.");

	output("\n\nOne of your [pc.hands] drifts down to your ");
	if(pc.hasCock())
	{
		output("rigid member");
		if(pc.cockTotal() > 1) output("s");
	}
	else
	{
		output("waiting quim");
		if(pc.totalVaginas() > 1) output("s");
	}
	output(" as your tail ravishes your mouth, bulging your cheeks with each thrust.");

	//hasCock:
	if(pc.hasCock())
	{
		output("\n\nYou start to pump your shaft as your hand closes around it, gently moaning and groaning onto the wriggling tail stuck between your [pc.lips] as a feeling of pleasure builds in your [pc.cock]. Every moan and movement of your tongue seems to excite your [pc.tailCock], causing it to thrust faster and faster, trying to force its way further down your throat.");
		output("\n\nYour hand speeds up in a desperate attempt to keep tempo with your eagerly pistoning tailcock, stroking your tool as beads of warm pre roll down onto your fingers");
		if(pc.hasKnot(0)) output(", teasing your [pc.knot] with each downstroke");
		output(". As you release another muffled, quivering groan, you feel your impending orgasm start to build, a familiar, uncomfortable sensation growing in your loins... and your tail. Both your hand and tail pick up their pace, rushing towards a joint climax.");
		output("\n\nYou let loose a feral cry of pleasure, your body tensing in orgasm, [pc.cocks] spasming as you spray your load all over ");
		if(insideShip) output("your ship");
		else output("the ground");
		output(" until your [pc.cum] starts to run down your hand, still stroking your cock as your climax reaches its crest. At the same time, your [pc.tailCock] starts to empty itself into your waiting maw, pleasure rocketing through your body, cum running down your throat as it continues to thrust in and out of your mouth, its seed spilling out onto your cheeks and trickling down your chin.");
	}
	//hasVagina:
	else
	{
		output("\n\nAn eager finger delves into your [pc.vagina], slowly working its way in and out of your snatch before a second finger joins it, gently moaning and groaning around the wriggling tail stuck in between your [pc.lips] as you schlick yourself silly. Every moan and movement of your tongue seems to excite your [pc.tailCock], causing it to thrust faster and faster, trying to force its way further down your throat.");
		output("\n\nYour once gentle fingering speeds up, in a desperate attempt to keep tempo with you eagerly pistoning [pc.tailCock], coating your fingers in fem-lube as you lavish your tail with oral affections. As you release another muffled, quivering groan, you feel your impending orgasm start to build, a familiar, uncomfortable sensation growing in your loins... and your tail. Both your hand and tail pick up their pace, rushing towards a joint climax.");
		output("\n\nYou let loose a feral cry of pleasure, your body tensing in orgasm, [pc.vagina] clamping down on your fingers as it spasms, spraying the inside of your thighs with [pc.girlCum], moaning all the while. At the same time, your [pc.tailCock] starts to empty itself into your waiting maw, pleasure rocketing through your body, cum running down your throat as it continues to thrust in and out of your mouth, its seed spilling out onto your cheeks and trickling down your chin.");
	}
	//Cock takes priority over vagina.
	output("\n\nAs you wind down, your tailcock retracts itself from your mouth, leaving your jaw relatively sore. You cough up a bit of your [pc.tail]’s cum as it finishes its exodus. Smiling at your happily relieved tail, you lick your spunk-covered lips, stroking the appendage appreciatively as it returns to its position behind you. Nothing left to do now besides clean up and get ready to move again.");
	pc.loadInMouth(chars["COCKVINE"]);
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
