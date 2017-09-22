//Tarkus Expedition
//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? Spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage)? Motherhusk (Accelerates pregnancy)

//Raskvel, Lapinara, Gooooooo, Sexbawts, Sydianbros

//Three rare plants. Scans identified three in close proximity not far from the oil-sea.

//Female Sydian Matron tending to spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage) and her two trappy raskvel boitoys.

public function showSlutGoo():void
{
	showBust("SLUTGOO");
	showName("DOUBLE\nGRAY GOO");
}
public function azraTarkusQuestSetup():void
{
	//Level up! :3
	if(azra.level < 3)
	{
		azra.level = 3;
		azra.physiqueRaw = 12;
		azra.reflexesRaw = 6;
		azra.aimRaw = 9;
		azra.intelligenceRaw = 12;
		azra.willpowerRaw = 13;//13.5
		azra.libidoRaw = 45;
		azra.HPMod = 35;
	}
	azra.HP(azra.HPMax());
	azra.lustRaw = 25;
	azra.energy(100);
}
public function beginTarkusQuest():void
{
	clearOutput();
	showAzra();
	azraTarkusQuestSetup();
	
	//Bro
	if(pc.isBro()) output("You simply nod.");
	//Bimbo
	else if(pc.isBimbo()) output("You bounce on the balls of your feet. <i>“Heck yeah! Let’s go do some, like, science!”</i>");
	//Misch
	else if(pc.isMischievous()) output("You flex proudly. <i>“I couldn’t be any more ready if I tried.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“Yep. Lead the way.”</i> You gesture to the door.");
	//Hard
	else output("You casually roll your shoulders. <i>“Yeah. Let’s get this show on the road.”</i>");
	//Merge
	output("\n\nAzra steps through the doorway. <i>“Excellent! This way... for science!”</i>");
	output("\n\nYou follow her out into Novahome, at which point Azra’s strides falter. She steps extremely carefully around the raskvel, seemingly worried that she’s going to put one of her feet down directly onto one of the swarming aliens. <i>“Excuse me!”</i> seems all she can say until her tail bowls over a wrench-toting mechanic, at which point her refrain shifts to <i>“Sorry! Sorry...”</i>");
	output("\n\nYou push your way to the front and spread your arms before your giant-sized scientist can wreak any more havoc, blazing a path through the crowd. More than one grumpy rask starts to give you lip before they see the enormous woman following behind. They make way a second later, objections forgotten in their hurry not to be trampled by the god-like creature striding amongst them.");
	moveTo("210");
	processTime(4);
	clearMenu();
	addButton(0,"Next",tarkusQuestLaunch);
}
public function tarkusQuestLaunch():void
{
	clearOutput();
	showAzra();
	moveTo("216");
	output("For once, stepping into Tarkus’s acrid atmosphere is a relief. Free from the press of bodies, Azra can stretch her wings, and you can stop acting like her personal rask-plow. She runs her hands through her lustrous hair in frustration, then bundles it all up under her hood.");
	output("\n\n<i>“Thank you for that,”</i> Azra says, tipping her wings in a small bow. <i>“Smaller beings can be... difficult for someone of my stature to deal with, especially in such numbers.”</i>");
	output("\n\nYou assure her that it was no problems. You were just doing your part to escort her on her mission.");
	output("\n\n<i>“Nevertheless, I already feel indebted to you, and we have just begun.”</i> Azra produces her Codex and scans the horizon. <i>“Perhaps if we move swiftly, we can avoid running into something like that mess with the naleen.”</i>");
	if(flags["AZRA_NALEEN_BLOWN"] != undefined) output(" Did she just lick her lips?");
	output(" She brushes past you without another word, one feathery wing stroking your back affectionately on the way.");
	output("\n\nSomebody is in a hurry to find some perverted plants...");
	processTime(7);
	clearMenu();
	addButton(0,"Next",toTheSlutGoo);
}

//GushGoo & SlutShrooms
public function toTheSlutGoo():void
{
	clearOutput();
	showName("MUSHROOM\nHUNTING");
	showBust("AZRA","SLUTGOO");
	moveTo("244");
	output("You check your chrono app as you and Azra round the corner on the location of the slutshroom patch. It’s only been twenty minutes. The big girl can really move when she wants to, and ");
	if(CodexManager.hasUnlockedEntry("Sydians")) output("there wasn’t a single sydian along the way to try and make a meal out of her armor.");
	else output("there wasn’t a single aggressive rask to bother you along the way.");

	output("\n\nA rare patch of relatively unblemished soil shelters the slutshrooms beneath the half-shattered bulkhead of a cruiser. Condensation dribbles into it from the bottom edge of a still-functional climate control unit, carrying on in the face of catastrophic damage to air-condition this small patch of rust-dusted hell. In short, this is the perfect place for growing fungi of all kinds. There are even faded indentations indicative of an attempt to farm here, but what happened...?");
	output("\n\n<i>“Look out!”</i> Azra screams, tackling you to the side.");
	output("\n\nA waterfall of silvery sludge splatters the recently vacated space, cascading back into itself a second later. The chromed waves climb higher and higher, shaping themselves into a familiar, humanoid shape. First come hips, wide as a luxury spacecraft. Swooping curves follow, bowing into the start of an hourglass middle. Without the need for organs or digestive systems, nature has afforded this gooey synthetic the ability to shape itself in extreme parody of terran attractiveness, a process that continues higher up.");
	output("\n\nTwo breasts puff out, boiling up from within. First as grape-sized protrusions, but such diminutive volume is not their fate. They wobble and shake as more shimmering mass pumps in, inflating them into respectable-sized melons. Small dimples conjure forth from the fluid flesh in place of proper nipples, relying on pure shape to delineate their form in the absence of coloration. However, as the burgeoning mammaries blossom into a jiggling boobs, the tiny tips erupt into a pair of thick, silvery teats. You watch spellbound as this gooey cutie’s figure seemingly violates physics, her liquid mounds swelling and jiggling, unsupported and yet somehow able to perch on her chest like gravity is a mere suggestion.");
	output("\n\nFinally, while you and Azra scrape your jaws off the floor, the goo resolves into a pair of identically attractive heads, complete with luscious lips and approximations of meticulously styled hair.");
	output("\n\n<i>“Hiya!”</i> two voices purr.");
	//No Codex:
	if(CodexManager.hasUnlockedEntry("Gray Goos"))
	{
		output("\n\nYour Codex beeps an urgent warning: <i>“Gray goo detected. These active micro-machine clusters are known to attack without provocation. U.G.C. Scout Authority suggests extreme caution, as well as hydration, around the native goo.”</i>");
		CodexManager.unlockEntry("Gray Goos");
	}
	//Merge
	output("\n\nAzra takes a half-step back, waving cautiously. <i>“Greetings?”</i>");
	output("\n\nThe double-headed goo-slut surges forward. <i>“The mush-mush isn’t nearly as yummy as a little cummy.”</i> A silver feeler slips out of her base and scoops up one of the slutshrooms while she talks. Her whole form wobbles and shakes with pleasure a second later, culminating in a sudden squirt of liquid metal between her thighs. <i>“Ahhh~!”</i> One head batts dripping eyelashes at you. <i>“Eat some mush.”</i> The other licks her lips. <i>“Cum with us.”</i> The first smiles as she hefts her tits, leaning close. <i>“You’ll love it.”</i>");
	output("\n\nAzra looks your way for a suggestion.");
	output("\n\nThe way you see it, you can try to take her head-on in a fight, maybe even tease her until she loses all cohesion. Alternatively, you could volunteer yourself as a distraction and hope the two-headed strumpet lets you go after Azra has harvested her fill.");

	processTime(20);
	
	clearMenu();

	addButton(0,"Fight",fightTheSlutGoo);
	addButton(1,"Negotiate",negotiateWithSlutGoo);
	addButton(2,"Volunteer",volunteerToGrayGooFeed);
}

//Volunteer for Filling
public function volunteerToGrayGooFeed():void
{
	clearOutput();
	showName("FEEDING\nTHE GOO");
	showBust("SLUTGOO");
	output("You step between Azra and the two-headed gray goo. <i>“There’s enough of me for both of you.”</i>");
	//Neuter.
	if(!pc.hasCock())
	{
		output("\n\nBoth heads turn to face the other, sharing an inscrutable look before swiveling back in your direction. <i>“Nahhhhh,”</i> the left head answers. The right explains, <i>“Nothing yummy. Nothing cummy.”</i> The conjoined goo pushes you out of the way to get a better look at Azra. <i>“Mmmm.... cummy.”</i> The leftward head nods in agreement. <i>“So much.”</i> Both agree, <i>“We’ll fuck her. Share mush.”</i>");
		output("\n\nAzra steps back and raises her fists in a panic. You’ll have to fight this time...");
		clearMenu();
		addButton(0,"Next",slutGooFight);
	}
	//Male
	else if(pc.hasCock())
	{
		output("\n\nFour eyes zero in on your crotch without a hint of shame, and two simple, pleased smiles appear the two-headed goo’s faces");
		if(!pc.isCrotchExposed()) output(", seemingly unfazed by your crotch-covering attire");
		output(". <i>“Sure!”</i> The words come out in perfect unison, uttered by cushy-looking mouths that purse with enticing promise, begging to be filled. The left licks hers with a silvery tongue, just as wet and slippery as the rest of her. You can only imagine what pleasures she could offer with a mouth like that, and with a whole second mouth to tend to the rest of you...");
		output("\n\nThe double decker goo is on you before your imagination can get too far, bearing you to the ground with a wet slap. Her gelatinous curves become liquid, smothering you in warm, alien caresses");
		if(!pc.isCrotchExposed()) output(" as chromed tendrils dexterously flow inside your [pc.crotchCovers] to release your [pc.cocks] from within. They’re like slender tongues covered in oceans of goo. It’s amazing they can hold onto anything, let alone work your garments aside and simultaneously stroke you");
		else output(". Chrome tendrils flow over your exposed loins, each narrower and slipperier than a terran tongue could ever hope to be");
		output(". They’re ravenous in their attentions, slathering syrupy warmth across every ");
		if(!pc.isCrotchExposed()) output("now-");
		output("exposed inch, flicking across the veins and curling around the shaft. One presses briefly on ");
		if(pc.cockTotal() == 1) output("your");
		else output("a");
		output(" urethra before deciding to wind itself around the [pc.cockHead] in a corkscrew of toe-curling pleasure.");

		output("\n\nOverwhelmed by the conjoined creature’s efforts, you try to push her back, but your hands merely embed themselves in her shoulders. You can’t pull them back; they’re stuck! The giant double-girl senses your intent and pulls herself back so that she no longer completely envelops you, merely pinning you to the ground between her mountainous breasts, immobilizing you in the slippery-squishy swells. You can breathe, maybe twitch your hips in response to the fondling of your crotch, but not much else.");
		output("\n\n<i>“Feels good, doesn’t it?”</i> the left head asks, stroking your cheek affectionately with the matching hand.");
		output("\n\n<i>“[pc.HeShe] loves it,”</i> the right answers, bending down for a kiss.");
		output("\n\nThere’s no restraint to the kiss. It’s all force and tongue, eager thrusting and passionate licking, slithering desire express through viscous, wobbling goo. When you decide to reciprocate, her tongue splits in half and swirls around your own, enveloping your muscle in a pocket of metallic lust, squeezing it to the same rhythm as the tentacles below. Luscious, dripping lips slobber against your cheek and coo in your [pc.ear]. A silver tongue fondles the lobe while the one in your mouth ebbs and flows into your maw, giving you small chances to breathe in between tongue-engulfing, mouth-flooding licks.");
		output("\n\nYou can scarcely tell where one head begins and the other ends, and to be utterly honest, you don’t care.");
		output("\n\n<i>“You can cum for us,”</i> whispers a chipper voice in your ear, circling her tongue in slow circles around the edge.");
		output("\n\nThe kiss breaks. <i>“You’ll cum so hard.”</i> The rightmost shares a smoldering look with its sister, eyelashes fluttering. Both heads smear together in a kiss, pouty lips pursed and tongues slithering together and apart in ways no solid being ever could. Left winks your way, and the full weight of the mammoth synthetic crashes down upon your waist. Your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" swallowed whole, from [pc.cockHead] to [pc.knotOrSheath], and she is <i>tight</i>. There isn’t a place that isn’t squeezed and cradled, not one inch that doesn’t feel her gluttonous embrace clutching at you.");
		pc.cockChange();

		output("\n\nThat gooey succubus reaches up inside you and squeezes a moan out of you, loud enough for Azra to hear it clearly. Loud enough that there can be no doubt as to your enjoyment. The tremors racing through your [pc.cocks] are echoed in the trembles of your voice. She gasps, you’re sure you hear it, but then the vice");
		if(pc.cockTotal() > 1) output("s");
		output(" on your [pc.cocks] clamp");
		if(pc.cockTotal() == 1) output("s");
		output(" down. You moan louder, muscles seizing and dick");
		if(pc.cockTotal() > 1) output("s");
		output(" throbbing");
		if(pc.balls > 1) output(", [pc.balls] quivering with the need to spend their load");
		output(". ");
		if(pc.exhibitionism() < 50) output("The shame swirls so thickly in your mind that it momentarily blocks the pleasure, long enough for you to realize that you’ve voluntarily let a rapacious goo-creature pin you down and have her way with you.");
		else output("Maybe you should feel shame at debasing yourself in front of your ship’s scientist, but you don’t. You feel excitement at your own self-induced debasement, a thrilling flush of desire and warmth that tangles together in your simmering loins.");
		output("\n\n<i>“Give it to me, handsome,”</i> righty coos, peppering you with kisses.");

		output("\n\n<i>“All that yummy cummy,”</i> the left head whimpers, caressing your cheek. <i>“Let it out...”</i>");

		output("\n\nFull-body shudders wrack your ");
		if(pc.thickness < 30) output("slender ");
		else if(pc.thickness < 60) output("");
		else if(pc.tallness >= 6*12 && pc.thickness > 70) output("enormous ");
		else output("chubby ");

		output(" frame. Your movements reflect in the cascading waves they generate, rippling across the silver slut’s hypersexualized frame until they crash into one another in viscous bursts of pleasure. You [pc.cocks] answer with ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output("own thickened liquid");
		if(pc.cockTotal() > 1) output("s");
		output(", ");
		if(pc.cumQ() < 8) output("leaking out");
		else if(pc.cumQ() < 100) output("jetting out");
		else if(pc.cumQ() < 1000) output("spraying out");
		else if(pc.cumQ() < 5000) output("gushing out");
		else output("erupting out");
		output(" the promised meal.");
		if(pc.cumQ() < 8) output(" It vanishes into her with little fanfare and a few wondrous, blissful quivers. Nothing more.");
		else if(pc.cumQ() < 100) output(" It vanishes into her, pulse by pulse, wicked up into her jiggling form with coos of delight. Not a single hint of your moisture remains on your flesh, so effectively does the greedy goo-ess suckle you.");
		else if(pc.cumQ() < 1000) output(" It vanishes into her with audible squelches, fattening the greedy goo-ess with [pc.cumNoun] by the cupfull. She drinks deeply of it, so deeply that not a single drop of [pc.cumGem] fluid can flow back across your [pc.cockSkin].");
		else output(" It floods into her by the liter. The raw volume is so great as to bloat her already immense frame, her tits spilling farther and farther to your sides, her ass swelling up like cum-infused mountains. Her metallic luster fades a bit, infused with the [pc.cumColor] color of your [pc.cumNoun], and then she can drink no more. Spare spooge rolls down your thighs and puddles below. There’s so much, but you offer her more. You can scarcely stop the offering of your endless bounty any more than she can help but try (and fail) to keep up.");

		output("\n\n<i>“Ooooh,”</i> twinned voices cry in delight, arching their conjoined back until the weighty orbs of the goo-slut’s tits are yanked off your [pc.cocks], exposing ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" to the air. <i>“I </i>liked<i> that!”</i> The mercurial beauty bats four pairs of dripping eyelashes at you. <i>“");

		//Fork no new PG based on cumQ.
		//Not Enough
		if(pc.cumQ() < 100) 
		{
			var totalCum:Number = pc.cumQ();
			output("\n\nBut not enough.”</i> The right head nods agreeably. <i>“Need at least... three times that much.”</i> The left shakes, setting off a boob-quake. <i>“Four. Four cummies.”</i>");
			output("\n\nUh oh.");
			output("\n\nThey round on you in unison, the perfect silver body bending low, obscuring your view of anything but gargantuan tits and squishy, reflective body.");
			processTime(13);
			pc.orgasm();
			//[Next]
			clearMenu();
			addButton(0,"Next",weakAssSlutGooFeeding,totalCum);
		}
		else
		{
			output("\n\nDid they get a little bigger?");
			output("\n\nThe right head titters, <i>“Such a lovely snacky-snack, cum-and-pack!”</i> The left wobbles, hair lengthening thanks to the freshly deposited mass. <i>“Take some mush, then come back when you’re all yum-and-squirty.”</i> Both nod in unison, in perfect agreement that a squirtier you is a net positive for the universe as a whole.");
			clearMenu();
			//output("\n\n[Next] - continue to next encounter");
			addButton(0,"Next",motherhuskEncounter);
		}
	}
}

public function weakAssSlutGooFeeding(totalCum:Number):void
{
	clearOutput();
	showSlutGoo();
	output("There’s not a lot you can do from your position, pinned on the ground. Not even when your overstimulated member");
	if(pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" eagerly massaged. You can barely wriggle and twist, but that only encourages her to play with you all the harder, flowing up your body until your crotch is firmly embedded in her glittering delta. It doesn’t feel any different to be in her pussy instead of embedded in her boob. You don’t suppose it would. To a creature made of microscopic robots and oil, every surface is a cunt just waiting to happen.");
	output("\n\n<i>“You have more, yes?”</i>");
	output("\n\nYou nod, unsure. You don’t want to find out what will happen if you try to deny this strange creature her tribute.");
	output("\n\n<i>“Good,”</i> left announces, ");
	if(pc.hasHair()) output("running fingers of goo through your hair, subdividing herself until it feels like she’s stroking the spaces between the individual strands.");
	else output("running her fingers across your scalp, subdividing each until it feels like she’s got a thousands fingertips giving you a massage.");
	output(" <i>“Can give me all the cum.”</i>");
	output("\n\nRight looks over, suddenly jealous. <i>“He barely has any! I need my nummy cummies!”</i>");
	output("\n\n<i>“No! It’s mine!”</i>");
	output("\n\n<i>“Mine!”</i> The fair features twist into a snarl, and with them, her puss");
	if(pc.totalVaginas() > 1) output("ies");
	else output("y");
	output(" clamp down.");

	output("\n\nOnce loving caresses become vice-like pressure, assaulting your hyper-sensitive phall");
	if(pc.cockTotal() > 1) output("i");
	else output("us");
	output(" with virginal tightness mated with whorish desire. The disagreement doesn’t stop her from fucking you. No matter how her heads bicker, the wobbling woman’s too-thick thighs continue to bounce atop you in almost-perfect rhythm. The left will spout some pithy remark, and her cunt will viciously tug. The right will retort, and a callous ripple will slide along your length, milking you callously.");

	output("\n\nSilver droplets splatter off your [pc.belly], slick and oily, sliding down your side to journey back into the goo-girls’ legs. She’s less solid than before, and hotter too, like the act of churning your loins for seed is slowly causing her to overhead. More viscous dollops drip off when she jerks too hard or fucks too fast, but she doesn’t seem to care. They wiggle through the dirt and back into her without a care in the world. The mercury madam may as well be a machine for how relentlessly she pumps your [pc.cocks]. Up, down, squeeze, up, down, twist... She doesn’t stop, not even when your whole body is shuddering and your [pc.balls] ");
	if(pc.balls == 1) output("is");
	else output("are");
	output(" cramping with the effort of giving her exactly what she wants...");

	output("\n\n<i>“Here it comes,”</i> one head giggles.");

	output("\n\n<i>“Good,”</i> the other pants, letting a two-foot tongue slip out of puffed-up lips to slither across your cheek. <i>“Give it to uth.”</i> Her body sags down, breasts shrinking, ass and hips swelling, rounding out over your hips, spreading into a crotch-encapsulating bubble. One thing that doesn’t lose a single millimeter of definition is her puss");
	if(pc.totalCocks() > 1) output("ies");
	else output("y");
	output(". The warm tunnel");
	if(pc.cockTotal() > 1) output("s");
	output(" hold");
	if(pc.cockTotal() == 1) output("s");
	output(" you just as tightly as before, lavishing attention on your twitching");
	if(pc.cumQ() > 100) output(", pre-drooling");
	output(", pre-orgasmic dick");
	if(pc.cockTotal() > 1) output("s");
	output(".");
	output("\n\nYou didn’t know it was possible to cum a second time so soon, but you do.");
	output("\n\n<i>“Yes!”</i> both silver sluts cheer orgasmicly on contact with the second dose of your [pc.cum].");
	if(pc.cumQ() > 4) output(" You fire off as much as you can, rope after rope, but this load is no bigger than the first.");
	else output(" You fire off a few drops, but you’re running on ‘E’ at this point, your spunk-reserves spent in a foolish attempt to satisfy the gluttonous goo.");
	output(" To the two-headed trollop, any seed is better than none. Eyes closed in bliss, her hyperextended tongue falls apart, the lower half cascading across your face with all the consistency of spooge while the upper half slips into her sister’s mouth.");
	output("\n\nBoth sets of lips inflate as your [pc.cumNoun] wicks into the conjoined body, lending both sides the mass and energy they sought, and they put it to work sluittifying themselves further. Mouths that could have been considered pornstar-grade puff up into freakishly fuckable parodies. Cupid’s bow lips round into squishy fuck-pillows just in time to receive a suspiciously phallic tongue. Frotting against herself inside her own frenching mouths, the two-headed goo collapses to the side, dragging her still squeezing hole");
	if(pc.cockTotal() > 1) output("s");
	output(" from your shaft");
	if(pc.cockTotal() > 1) output("s");
	output(" with one final cascade of sloppy silver.");
	output("\n\nPanting for breath, you realize just how exhausted the rapid-fire orgasms have left you. Sitting up is hard. Getting on your [pc.feet] is harder.");

	//LOTS
	if(pc.cumQ() + totalCum >= 3000)
	{
		output("\n\nI’m stuffed!”</i> The gelatinous girl rolls off of you, so fattened with jism that she barely maintains cohesion. Her right head titters, <i>“Cum-stuffed-spunk-puff!”</i> The left wobbles, hair growing into a waist-long ponytail with the aid of your newly deposited mass. <i>“Take some mush if you want, then come fuck some more.”</i> Both nod in unison, in perfect agreement that you should return to plow them at your earliest convenience.");
	}
	//ENOUGH
	else
	{
		output("\n\nSo much better than mush.”</i> The gelatinous girls roll off of you.");
		output("\n\nDid they get a little bigger?");
		output("\n\nThe right head titters, <i>“Such a lovely snacky-snack, cum-and-pack!”</i> The left wobbles, hair lengthening thanks to the freshly deposited mass. <i>“Take some mush, then come back when you’re all yum-and-squirty.”</i> Both nod in unison, in perfect agreement that a squirtier you is a net positive for the universe as a whole.");
	}
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gooFeedingFinal);
}

public function gooFeedingFinal():void
{
	clearOutput();
	showBust("AZRA","SLUTGOO");
	showName("DONE\nFEEDING");
	output("A crimson-blushing Azra appears from behind a nearby pile of debris, fidgeting with the fasteners at her waist. You note her pack is a little fuller than before.");
	output("\n\n<i>“I acquired the... slut... shrooms while you were... indisposed,”</i> Azra says. <i>“I’d never take such a risky maneuver myself, but I must admit, it paid off in spades. It takes a brave [pc.manWoman] to master the frontier with nothing but [pc.hisHer] genitals and determination to see the mission through to the end.”</i>");
	output("\n\nYou nod");
	if(pc.isBimbo()) output(" enthusiastically but decide not to mention that you really, really wanted to fuck the giant goo-woman.");
	else if(pc.isNice()) output(" pleasantly. <i>“I try.”</i>");
	else if(pc.isMischievous()) output(" and smirk. <i>“I aim to please.”</i>");
	else output(" curtly. <i>“Somebody’s got to deal with this shit.”</i>");

	output("\n\nAzra looks to the silver mutant, then back to you. <i>“We had best be on our way before she grows hungry once more. There are still two more life forms to retrieve, and I’d rather be gone before she can follow us in search of her next snack.”</i>");

	output("\n\nYou set off for the next patch - motherhusks if you remember correctly.");
	processTime(10);
	clearMenu();
	//output("\n\n[Next] - continue to next encounter");
	addButton(0,"Next",motherhuskEncounter);
}

//Fight
public function fightTheSlutGoo():void
{
	clearOutput();
	showSlutGoo();
	output("You draw your [pc.weapon] in answer.");
	output("\n\nAzra pales as the double-decker trollop begins to shake in irritation. The suula whispers, <i>“Are you sure about this?”</i>");
	output("\n\nThe silver mountain roars, <i>“No cummy? YOU DUMMY!”</i>");
	output("\n\n<i>“Nope.”</i>");
	output("\n\nThe two-headed goo surges higher, adding another five feet to her height. <i>“WE COULD’VE HAD SO MUCH FUN!”</i>");
	output("\n\nAzra puts up her dukes, a gesture that would normally seem quite threatening on the nine-foot suula... but against a creature so much larger, it looks almost comical.");
	output("\n\nIt’s a fight!");
	processTime(3);
	//[Next] ->2 combat!
	clearMenu();
	addButton(0,"Next",slutGooFight);
}

public function slutGooFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc,azra);
	CombatManager.setHostileActors(new GrayGooDoubleL, new GrayGooDoubleR);
	CombatManager.victoryScene(winVsSlutGoo);
	CombatManager.lossScene(loseToSlutGoo);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryCondition(CombatManager.ANY_TARGET_DEFEATED);
	CombatManager.displayLocation("DOUBLE GOO");
	CombatManager.beginCombat();
}

//Negotiate
public function negotiateWithSlutGoo():void
{
	clearOutput();
	showSlutGoo();
	showName("\nNEGOTIATING");
	//Bimbo
	if(pc.isBimbo())
	{
		output("<i>“Like, she’s all cummed out!”</i> You step up to the goliath goo and pantomime giving a very messy-looking blowjob. <i>“Her big ol’ sharkballs are totes drained, and its soooo sad. First she had to pay these greedy raskvel, and then like, I needed a snack, and then there was this other gray goo who sucked her for an hour.”</i> You gesture over your shoulder. <i>“I think her dick would break if we tried to get any more.”</i> You try to keep from tearing up at the thought.");
		output("\n\nThe goo woman(women?) actually do, favoring Azra with a tender expression. <i>“You poor thing!”</i> <i>“Need food. Make more cummies.”</i> The left head and the right look at each other in unison. <i>“I know! Take ‘shrooms! Eat five and come back after nap.”</i> The right adds. <i>“Then have plenty of girl cummies too!”</i>");
		output("\n\nAzra blushes hotter than a dying star. <i>“No... uh... yeah... okay.”</i> She nods gratefully at you and the giant-sized goo woman. <i>“I... will. Sorry.”</i>");
		output("\n\n<i>“Don’t worry,”</i> the right head graciously answers. <i>“We still have plenty of mush-mush for lots more cum-cums.”</i> The left adds looks to the right. <i>“More mush?”</i> Her sister answers, <i>“Fuck yes!”</i> Both hands pluck stalks from the ground as the voracious creature resumes feeding itself, squirting silver from small orgasms with every bite.");
		output("\n\nAzra turns away in a hurry to gather her own, leaving you with nothing to do but watch the two-headed goo-girl eat and cum and eat in cum. She’s so curvaceous, and she cums so noisily. You can feel yourself getting hot under the collar. Familiar urges well up inside you, and you realize that if you don’t do something about it, you’ll wind up horny and distracted for the rest of the day. Maybe the nice goo could help you out?");

		processTime(5);
		pc.lust(5);
		//[Wait] [Get Help]
		clearMenu();
		addButton(0,"Wait",waitForBimboNegotiationsAndGetHornedUp)
		if(pc.hasGenitals()) addButton(1,"Get Help",getHelpWithGooSlutBimboStuff);
		else addDisabledButton(1,"Get Help","Get Help","You need genitals for her to help you out...");
	}
	//Else - nonbimbo negotiate.
	else
	{
		output("<i>“Could we pay for a few mushrooms some other way?”</i> you ask.");
		output("\n\nThe leftmost head purses its lips. <i>“Not... cummy?”</i>");
		output("\n\nThe right looks even more confused. <i>“Like... milky moos?”</i>");
		output("\n\nAzra shakes her head violently. <i>“No.”</i>");
		output("\n\nYou elaborate, <i>“Credits?”</i>");
		output("\n\n<i>“No.”</i> Both silver mouths speak in perfect unison. <i>“Give us wing-girl cummies.”</i>");
		output("\n\nAzra steps a pace back, then raises her shaking fists.");
		output("\n\nYou’ll have to fight.");
		//[Next]-2Combat!
		clearMenu();
		addButton(0,"Next",slutGooFight);
	}
}

//Wait
public function waitForBimboNegotiationsAndGetHornedUp():void
{
	clearOutput();
	showBust("SLUTGOO","AZRA");
	showName("\nWAITING");
	output("You decide to wait and simply enjoy the show you’ve been given. By the time Azra finishes harvesting her bounty of sluttifying mushrooms, you’re breathing heavy and chewing on your [pc.lipChaste]. She has to give your shoulder a rough shove just to rouse you. <i>“Come on, we should go.”</i>");
	output("\n\nYou nod and turn to leave, but at the last minute you remember your manners and spin about. <i>“Thanks so much! I hope you get lots of cummies!”</i> You vigorously wave");
	if(pc.biggestTitSize() >= 4) output(", [pc.chest] bouncing");
	output(".");

	output("\n\n<i>“You too!”</i> paired voices answer.");
	output("\n\nWell, they were nice.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",motherhuskEncounter);
}

//Get Help - Reqs crotch stuff.
public function getHelpWithGooSlutBimboStuff():void
{
	clearOutput();
	showSlutGoo();
	output("<i>“Fuuuuck, you’re hot!”</i> you cry, stepping closer to the goo. Azra looks up from her picking, wide-eyed, but you give her a reassuring wave. You’re just going to get a little oral. Nothing serious. <i>“Like, you’re so pretty and shiny and glossy, and your lips are so pretty. Maybe... I could feed you a little while she recovers?”</i>");
	if(!pc.isCrotchExposed()) output(" You drop your [pc.crotchCovers].");
	else if(pc.legCount > 1) output(" You spread your [pc.legs].");
	else output(" You shift your hips forward to put your [pc.crotch] on display.");

	output("\n\nThe goo creature drops her fistfuls of slutshrooms in shock. All four of her eyes zero in on your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.vaginas]");
	output(". <i>“Of course! We’ll make you cum so hard.”</i> The right head echos, <i>“So hard.”</i> The giant goo reaches forward, grabbing you in one hand and petting your head with the other, her touch as gentle as it is syrupy. <i>“I want to suck it so bad.”</i> The right head tilts. <i>“You should have told us sooner!”</i>");
	output("\n\n<i>“I like, forgot!”</i> you exclaim");
	if(pc.hasHair() && pc.hairLength > 4) output(", twirling your [pc.hair] thoughtlessly");
	output(".");

	output("\n\n<i>“It’s okay.”</i> The arm lifts you to the corrosponding face, which plants enormous, oily kisses on ");
	if(pc.cockTotal() > 0) output("[pc.eachCock]");
	else output("[pc.eachVagina]");
	if((pc.hasCock() && pc.cockTotal() > 1) || (!pc.hasCock() && pc.totalVaginas() > 1)) output(", loving each in turn");
	output(". <i>“You’re nice and sexy too.”</i>");

	output("\n\nYou can’t suppress your blush. Between the feel of their gooey lips and their gushing praise, it feels like all your blood is rushing to your face... and genitals. <i>“Aww, thanks! You’re super bangable too.");
	if(pc.hasCock()) output(" Look at how hard you got my cock!");
	else output(" Look at how juicy I got, watching you!");
	output("”</i>");

	output("\n\n<i>“Mmmhmm.”</i> Both heads crowd");
	if(pc.legCount > 1) 
	{
		output(" in between your [pc.legs]");
		if(pc.isTaur()) output(", letting your forelegs dangle behind her head");
	}
	else output(" together at your crotch, cheek pressed to cheek so hard that they blend together into a double-face");
	output(". Two tongues ");
	if(!pc.hasCock()) 
	{
		output("slip up and down your labia, flitting briefly across your [pc.clits]. You whimper at their oily touch, then moan when they press down harder, slipping through your gates to taste the deepest recesses of your feminine canal");
		if(pc.totalVaginas() > 1) output("s");
		output(". Those silvered muscles writhe against one another as much as against your walls, growing thicker with every passing moment. She’s fucking you with nothing more than her mouth. The pleasure is immense, filling you, spilling down your thighs in rivulets of liquid metal and [pc.girlCum]. Her lips rub on your [pc.clits], and you have a miniature orgasm on the spot.");
	}
	else 
	{
		output("slither around your [pc.cockBiggest] like stripes around a barbershop pole. You whimper at their oily touch, then outright moan when they begin to slide up and down, deforming gracefully around your veins as they tickle your blood-engorged tissues, pressing down nerves individually to overwhelm your system with perfect ecstasy.");
		if(pc.balls > 0) output(" Her lips press down on your [pc.balls] and swirl over the skin of your [pc.sack], her whole mouth rotating to cover every inch, almost like she can taste the [pc.cum] swirling within through your [pc.skin].");
		else if(pc.hasAKnot()) output(" Her lips wrap tight around your [pc.knotBiggest], cinching so tightly that your eyes cross. The sensitive flesh feels exactly like it’s lodged in some tight bitch’s cunt, and four eyes look up at you from around it, encouraging you to impregnate their tongues with your [pc.cumVisc] load.");
		else output(" Her lips engulf your entire length, sealing down around the [pc.sheathBiggest] with lewd intention. Inside, those tongues continue to caress as if nothing has changed, effortlessly folding back on themselves to continue their service.");
	}
	output("\n\nYou throw back your head and babble, <i>“Fffffuuck, you’re so good at this!”</i> Your [pc.hips] twitch. <i>“I like, loooove your tongues!”</i> Your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.vaginas]");
	output(" agree, declaring their affection in an explosion of white-hot pleasure");
	if(pc.hasCock()) output(" and [pc.cumColor] goo");
	output(". Your [pc.legs] twitch");
	if(pc.legCount == 1) output("es");
	output(" in the giant’s grip ineffectually as you cum yourself silly, your bimbofied body experiencing so much pleasure that you rag-doll thoughtlessly in the cozy embrace of inhuman bliss. Who cares that you’re drooling all over yourself. You’re <i>cumming</i>, and it’s like, the best thing ever!");
	output("\n\nWhen you come back from the pink-tinged fog of orgasm-land, you’re on the ground, the giantess gently lapping at your loins to gather up any stray bits of fluid. You have a few minor aftershocks, groaning and wiggling as she cleans you up. To think that that sort of attention would’ve been an entire orgasm <i>before</i>. Now? Now they barely count as orgasms. They’re more like appetizers or dessert, there to frame the meal that leaves you giggling and euphoric.");
	output("\n\n<i>“You done?”</i> Azra calls from a safe distance away.");
	output("\n\nYou stretch languidly, arching your back. <i>“Yeeeaaaah. Thanks miss goopy goo!”</i>");
	output("\n\n<i>“No problem,”</i> lefty says, licking her lips as she rises.");
	output("\n\nThe right one winks, <i>“Come back after you eat some mush.”</i>");

	output("\n\n<i>“Sure thing,”</i> you promise as you look over to Azra. Wow, she is blushing super hard.");
	if(pc.isTreated()) output(" You can smell how horny she is. Why doesn’t she just open up her crotch plate and get some relief? It’s the smart thing to do.");
	output("\n\nAzra shoulders her pack and grabs you by the hand. <i>“Come on, there’s two more plants to find.”</i>");
	output("\n\nYou stumble woozily behind");
	if(!pc.isCrotchExposed()) output(", pulling up your [pc.crotchCovers]");
	output(". <i>“Motherfucks,”</i> you supply. <i>“Gotta get motherfucks.”</i>");
	output("\n\nAzra facepalms. <i>“Mother</i>husks<i>.”</i>");
	output("\n\n<i>“Right.”</i>");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",motherhuskEncounter);
}

//Lose
//Azra gets raped. You get ignored.
public function loseToSlutGoo():void
{
	clearOutput();
	showBust(azraBustString(),"SLUTGOO");
	showName("\nLOSS");
	output("You go down hard");
	if(pc.lust() >= pc.lustMax() && pc.isBimbo()) output(". It’s easy to masturbate on your back, anyhow");
	output(".");

	output("\n\nWith you out of the way, the double-headed goo is free to focus her attention entirely upon the ");
	if(azra.HP() <= 0 || azra.lust() >= azra.lustMax()) output("defenseless");
	else output("lone");
	output(" suula");
	if(!azra.hasStatusEffect("cock out"))
	{
		output(", ");
		if(azra.HP() > 0 && azra.lust() < azra.lustMax()) output("knocking her on her back and ");
		output("tearing open her crotch plate as easily as a can of tuna. A big, hard dick pops out, impressively long for how little bulge it presented");
	}
	else output(", eyeing her big, hard dick with obvious hunger");
	output(". <i>“Yum!”</i>");

	output("\n\n<i>“N-no!”</i> Azra haphazardly protests, twisting from side to side. Her enormous prong slaps against each of her thighs in turn. The tentacles that ring the tip wildly, and she actually gets harder. Is she trying to show it off?");

	output("\n\nHands bigger than Azra’s head pin her wrists into the loamy ground as the silvery slut leans down, hair cascading like a metal waterfall. <i>“So much nummy cum,”</i> she coos through both pairs of expanding, puffed-up lips. The left side bites her bottom lip, eyes fixed on Azra’s jutting cock. The right licks her lips as her breasts slip closer to the shark-girl’s turgid mast. <i>“This could’ve been so much nicer.”</i>");
	output("\n\nAzra is rock-hard by now, dick pointing straight up and visibly throbbing. <i>“I d-didn’t consent!”</i> She closes her eyes and looks away, yet the acres of gelatinous tit descend all the same, brushing a very sensitive-looking cocktip.");
	output("\n\nAzra and the goos moan together.");
	output("\n\n<i>“Whaaa?”</i> the left head cries in confusion, squeezing her tits together between her forearms in confusion. <i>“So hooooot.”</i>");
	output("\n\nFrom where you’ve fallen, you can see Azra’s tendrils going wild against the goo-monster’s less-than-solid breast-flesh. That’s right... suula’s genital tendrils can release an aphrodisiac sting! From the way they’re writhing, they must be stinging like mad!");
	output("\n\nThe right-side of the goo monster doesn’t seem to mind. Her eyes drift closed, then fade away entirely, leaving her little more than puckered mouth and obscene, four-foot tongue. That selfsame tongue dives into her breasts in search of Azra’s dick, lavishing it with licks and caresses. You can hardly see where the tongue ends and the breasts begin. It actually vanishes into one tit only to emerge on the other side, wrapping up Azra in so much slick warmth that the winged woman must be going mad.");
	output("\n\nWhen Azra looks your way, you can see that all the fight has gone out of her. Her eyes keep trying to roll back, and her sharp-toothed maw keeps opening and closing in lurid moans. Sometimes, she even whimpers, <i>“Yes!”</i> or <i>“More! Please more!”</i> When she sees you looking, she screams and arches her back, hips pumping, fucking her dick deep into the glimmering white-gold melons.");
	output("\n\nCreamy eruptions sputter from the silvered cleavage, splattering the twinned chins in sequence before the right head can dive down on it, embedding her whole face into her tits just to directly lap at Azra’s viscous seed. The left side seems put out until the load on her face sinks beneath the liquid surface of her skin, after which her features sink into an expression of sublime euphoria.");
	output("\n\nSordid-sounding sucks tease your ears and inflame your passions as you’re forced to watch your chief biologist blowing her load. She just keeps cumming! Her balls clench, and her hands ball into cute little fists with every blissful pulse. She must have been pretty backed up, because the longer the right head works to swallow her load, the bigger the goo-girl’s tits, lips, and ass get. And with those puffy cock-suckers expertly working Azra’s tip, how could Azra possibly give her less than every drop of delicious suula spooge?");
	output("\n\n<i>“Mmmmmmmyeeeaaaaaa,”</i> the left-head coos, taking her hand off Azra’s wrist to pet the suula’s sweat-matted hair. <i>“Sthoooo good.”</i> The new size of her lips seems to confuse her at first, but simple thrill replaces it not long after. <i>“More, yeth?”</i> she asks as the right side finally releases the scientist’s well-drained dick.");
	output("\n\n<i>“No-”</i> Azra tries to answer before left kisses her, stuffing her tongue so far into her mouth that you swear you can see it bulging the golden suula’s throat. She struggles to little avail, slapping at the goo-woman’s tit until her arm pushes inside, but she can’t seem to draw it back. Her struggles only make the person-sized orb wobble.");
	output("\n\nMeanwhile, the right head forms a pair of eyelashes and blinks open newly-made eyelids, a confused look on her face as she absorbs the residual shark-girl spunk. <i>“Ooh, we should grow more boobs.”</i> She lets go of Azra’s other arm and begins playing with her expanded assets with almost child-like glee.");
	output("\n\nAzra’s stares at you, wide-eyed as the left head slowly extracts inch after inch of silver tongue from her sharky maw, face flushing redder and redder. When it finally escapes, it does a circuit across Azra’s muzzle, paying special attention to her gasping lips. Below, Azra’s hips violently thrust, hard enough to bounce the titanic gray goo a few inches off the ground. <i>“What did you do to me?”</i>");
	output("\n\nLeft giggles. <i>“Gave you back your cummy-venom, sthilly!”</i> Right pinches her nipple, squirting silver onto Azra’s chest. <i>“So you can cum again!”</i> They share a look and lift their single pair of hips, positioning a slime-drooling slit just above Azra’s quivering cock. <i>“You know you want to fuck us.”</i> The left adds, <i>“And cum sthoooo hard!”</i>");
	output("\n\nAzra’s face screws up, alternating between irritation, rage, lust, and desperation. She looks your way imploringly, but there’s nothing you can do besides let her know that it’s okay. You give her a slight nod, and she finally gives the goos exactly what they were asking for.");
	output("\n\nNearly two feet of painfully erect suula-cock spears its way into the sloppy goo-cunt in a half second. Azra’s hips slam into the two-headed woman’s crotch hard enough to make her entire body ripple from the force of the impact. The ensuing loss of cohesion is exactly what the suula scientist needs to free her hand from a silver tit, and she makes good use of her newfound freedom by grabbing the goo by her thickened thighs to fuck her all the harder.");
	output("\n\nAzra’s wings flare wide in ecstasy, stained brownish-red with Tarkus’ soil. She draws back to expose her glossy fuck-stick. The tentacles are almost limp now, flat against the golden-orange surface of her dick and waving back and forth to further stimulate her. She rams it back inside without a second thought. Her face is locked in a rictus grin of pleasure, her eyes wide and fanatical. You can only imagine at the amount of venom coursing through her body. The double-goo atop her must have pumped at least a double-dose back into her belly, to say nothing of any incidental stings she gave herself before.");
	output("\n\nIt’s all the two-headed creature can do to stay together while Azra pounds her. Her sloppy skin bubbles and drips. More than once, one of her arms falls off and splatters to the ground, only to grow anew a second later and resume caressing a goo-leaking tit. The heads themselves have given up any pretense of restraint and started making out, their silvery tongues entwined until you cannot see where one ends and the other begins.");
	output("\n\nWhimpering, Azra drives herself in with incessant strokes, her weighty balls slapping hard against the goo monster’s jiggling ass, slickened with sweat and silver alike. They’re quivering with unspent lust. You can only imagine the biological arms race taking place in there as they race to produce another potent load so soon on the heels of the first. Still, Azra fucks on. She works the gooey slit with machine-like determination, pounding it faster and harder with every stroke, her cock pulling back wet strands of chrome to cover her thighs.");
	output("\n\nAgain, Azra looks your way, but she’s like an entirely different person, buried dick-deep in a monster twice her size with her teeth bared in a frenzy. If she wasn’t pinned beneath the mammoth, you’d think she meant to rape <i>you</i>. Then her manic expression slackens. Her eyes roll back, and her thrusts come to one climactic stop, impacting the goo with enough force to embed Azra’s hips halfway into the shimmering being’s body.");
	output("\n\nA small, rounded dome appears in the beast’s middle, swelling larger by the second. Azra whimpers, and tongue lolling collapses, dick slipping half-way out. A tide of spooge washes back with her, coating her still-flexing dick in white. With every straining bulge of her urethra, another stream of viscous goo backwashes out to paint her crotch. The monster above doesn’t seem to care. She’s wicking up enough to grow the second pair of tits she asked for, looking on in pleased ecstasy as a pair of E-cups swell into her palms.");
	output("\n\nBy the time Azra finally stops jizzing, the two-headed woman is cradling a second set of G-cup melons and sprawling back against the wall, rubbing her tummy and sighing in delight.");

	output("\n\n");
	if(pc.lust() >= 75) 
	{
		output("You do the best to clean up the evidence of your own masturbatory orgasm, but you’re pretty sure Azra will know all the same. After all, she saw you getting off to her defilement. ");
		pc.orgasm();
	}
	output("You stagger over to Azra with an apologetic look on your face and help her to her feet");
	if(pc.tallness < 7 * 12) output(", which is easier said than done considering she’s nine feet tall and you’re barely over " + num2Text(Math.floor(pc.tallness/12)) + ". The poor girl is absolutely shell-shocked, but she manages a few half-hearted tugs at her dripping dong all the same. <i>“Wha... so much... cum?”</i> You drag her away before the silver behemoth decides to come back for thirds. What a mess.");
	//Pc seen wango!
	kGAMECLASS.flags["AZRA_SEX_KNOWN"] = 1;
	processTime(20);
	clearMenu();
	addButton(0,"Next",loseToGrayGo2);
}

public function loseToGrayGo2():void
{
	clearOutput();
	showAzra();
	showName("\nDEFEATED...");
	output("Together, you stagger through the wasted ruins. Azra plays with her dick for most of the trip, but by the time the Novahome comes into view, she’s recovered enough of her sense to tuck the turgid tool back into her armor.");
	output("\n\n<i>“I think... I need a nap,”</i> the suula declares.");
	output("\n\nYou nod. <i>“Me too.”</i>");
	output("\n\nLooking at you hesitantly, Azra posits, <i>“We got beat up by some gray goos and ran back here. Nothing else happened.”</i>");
	output("\n\nYou start to shake your head.");
	output("\n\n<i>“NOTHING ELSE HAPPENED.”</i>");
	output("\n\nPutting up your hands, you defer. <i>“Okay okay...”</i>");
	output("\n\nAzra nods curtly and vanishes into her quarters. Her shower comes on shortly after.");
	//Put Azra on CD for a bit.
	pc.createStatusEffect("Azra CD");
	pc.setStatusMinutes("Azra CD",45);
	//put PC on ship.
	currentLocation = shipLocation;
	output("\n\n");
	CombatManager.genericLoss();
	flags["AZRA_EXP_FAILED"] = getPlanetName().toLowerCase();
}

//Win
public function winVsSlutGoo():void
{
	clearOutput();
	showSlutGoo();
	output("With one side ailing, it takes all of the remaining head’s effort just to keep upright. <i>“Fiiiiiine,”</i> it mutters tiredly, dragging its incapacitated sister to slump against the wall. <i>“Take the mush. Meany. Coulda fucked.”</i>");
	output("\n\nYou keep an eye on the double-goo");
	if(azra.HP() <= 0 || azra.lust() >= azra.lustMax())
	{
		output(" as you walk over to check on Azra. ");
		if(azra.lust() < azra.lustMax()) output("She’s breathing hard but okay.");
		else output("The instant you come close, her frenzied masturbation culminates in an explosion of white, her hard, throbbing suula-cock erupting like a long-shaken soda bottle. She whimpers with every spurt, her expression one of guilt and barely-controlled pleasure. That doesn’t stop her from painting the front of her armor - and her chin - white, or tenderly squeezing her balls to milk out the last few drops.");
	}
	else output(" as you glance at Azra.");
	//Azra still good. No new PG.
	if(azra.HP() > 0 && azra.lust() < azra.lustMax())
	{
		output(" <i>“You okay?”</i>");
		if(azra.hasStatusEffect("cock out")) output("\n\nAzra hastily crams her jutting dick back into her armor, blushing hard.");
		else output("Azra nods curtly.");
		output(" <i>“I’m... fine. While a fight is a sub-optimal outcome, we’ve positioned ourselves to achieve our first goal. Give me a minute to procure the samples, and we can move on.”</i>");
		output("\n\nYou nod your assent and spend a few minutes watching her place slutshrooms and soil into preservative containers.");
	}
	//Azra fappytiems
	else if(azra.lust() >= azra.lustMax())
	{
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Do you like, need a hand?”</i> You run a finger down her chest, gathering up a dollop of cum. Sucking slowly, you ease it into your mouth, gazing deep into Azra’s eyes the whole time. <i>“Mmm...”</i>");
		else output("Do you, uh... need a hand up?”</i> You try not to look at her still-spasming dick.");

		output("\n\nAzra sobers up in a second, tucking her cock away a single well-practiced movement. The groinplate clicks into place a second later, sealing in the spunk-oozing shaft. <i>“No... This is... merely an inconvenience.”</i> She pulls a towel from her pack and wipes up most of the mess, though enough remains in the cracks and crevices that you can smell the sex on her from a few feet away. <i>“Allow me a few moments to make myself decent, and I’ll gather the samples.”</i>");
		output("\n\nYou nod your assent and turn away. By the time you look back, Azra is busy gathering samples of all shapes and sizes, placing them with care into preservative containers. Were it not for the lingering scent of cum hovering about her, there’d be no evidence of the lust-crazed beast who was writhing in the dirt just moments before.");
	}
	//Merge
	output("\n\n<i>“The motherhusks are not far. Surely there we won’t encounter trouble two times in one trip,”</i> Azra says, looking at her handheld for directions.");
	output("\n\nSpoken like a girl who hasn’t had to wander these wastes on her own...");
	output("\n\n");
	processTime(12);
	CombatManager.genericVictory();

	//[Next] -> To motherhusk intro :3
	eventQueue.push(motherhuskEncounter);
}


public function motherhuskEncounter():void
{
	clearOutput();
	showName("\nPLACEHOLDER");
	output("(Fenoxo's note: This is just the first part of this adventure. More will come in time!)");
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

//Motherhusk Puzzlefuck
//Huge hacking puzzle to get at motherhusks that a raskvel broodmother has kept to herself. So pregnant she can’t stop you.
//>Security grid hack -> lights out.
//>Security door override -> turnydoodlepuzzle. Should be obnoxious but un-losable

//Intro
public function actualMotherHuskIntro():void
{
	clearOutput();
	showAzra();
	showName("HUNTING\nMOTHERHUSKS");
	//9999 set location a new location

	output("As you journey closer to the motherhusk deposit, you note that the terrain is changing. The mountains of garbage are higher, and their sides are smoother, almost as if all the usable handholds have been cut away. Azra’s coordinates lead you into a valley between two of the higher mounds, sloping down to a makeshift structure composed of hastily-welded starship hulls. A squat, raskvel-sized security door is placed in the very center, flanked by what looks like a simple intercom.");

	//Nonbimbo
	if(!pc.isBimbo())
	{
		output("\n\n<i>“This could be a trap. Perfect ambush point,”</i> you observe.");
		output("\n\nAzra nods. <i>“It could be, but the contents of that structure are vital to my research. We knew these expeditions would be risky when we set out.”</i>");
		output("\n\n<i>“Indeed.”</i> You hold your [pc.weapon] a little closer.");
	}
	//Bimbo
	else
	{
		output("\n\n<i>“Ooooh, this is the prettiest house I’ve seen on Tarkus!”</i> you observe.");
		output("\n\nAzra nods. <i>“But it may be a trap. The walls high walls make this place ideal for ambush. We must proceed carefully.”</i>");
		output("\n\n<i>“Sure thing, Doctor Sharky!”</i>");
	}
	//Merge
	//[Next]
	processTime(5);
	clearMenu();
	addButton(0,"Next",raskvelBunkerApproach);
}

public function raskvelBunkerApproach():void
{
	clearOutput();
	showAzra();
	showName("APPROACHING\nBUNKER");
	output("The slope into the valley slowly descends to the armored structure. It’s an easy walk. The gritty soil is packed into a solid, rust-road road by frequent travel. Sharp ruts from an iron-wheeled vehicle line the sides, but whatever left them has long-since rolled on. Azra scans the sides of the valley for ambush, wings twitching nervously. You keep your eyes on the shadows, yet you see nothing save for dim crags and cracked pipes.");
	output("\n\nThe wind whistles by.");
	output("\n\nYou’re standing in front of the door before you know it. The intercom panel is buzzing faintly, the call button glowing with dim green luminescence. No sign of hostiles has presented itself.");
	output("\n\nAzra checks the scans on her Codex, overlaid across a topography scan. <i>“They’re inside. I’m not sure why. Perhaps the motherhusks are being farmed.”</i> She looks over her shoulder, then back to you. <i>“Shall we try the buzzer?”</i>");
	processTime(2);
	clearMenu();
	//[Buzz In] [Knock]
	//9999
}

//Knock:
public function knockOnRaskBunker():void
{
	clearOutput();
	showAzra();
	showName("KNOCK\nKNOCK");
	output("You knock. The door makes a hollow-sounding ‘clang.’");
	output("\n\nNothing happens.");
	output("\n\nAzra shrugs. <i>“Let’s just use the intercom.”</i>");
	addDisabledButton(1,"Knock","Knock","You already tried that.");
}

//Buzzer
public function buzzIntoRaskland():void
{
	clearOutput();
	showAzra();
	showName("BUZZ\nIN");
	output("You press the intercom button. The answering buzz, though muted by the walls, carries through the structure with such volume that you can feel it vibrating against your fingertips. You jerk back in shock.");
	output("\n\n<i>“Whaddya want?”</i> a staticky voice barks through the embedded speaker. <i>“I’m full up till tomorrow.”</i>");
	output("\n\nAzra’s bafflement is obvious, and you aren’t much better off. <i>“Say something,”</i> she whispers.");
	output("\n\nYou clear your throat and press down the \"talk\”</i> button. <i>“");
	if(pc.isBimbo()) output("Ummm... like, we just wanted to see if we could have some motherhusks.”</i> After a second, you remember to add, <i>“We have credits and stuff.”</i>");
	else output("Uh... we wanted to buy some motherhuskers. Our sensors indicate you have a sizeable supply.”</i> Azra flashes you a thumbs up.");
	output("\n\nFive or six seconds pass in complete silence. You’re about to try again when the intercom clicks on. <i>“Nope. No motherhusks here. Whatever those are. You should look somewhere else. I bet they’re somewhere else besides here.”</i>");
	output("\n\nAzra glances at her Codex. <i>“They’re definitely here, [pc.name].”</i>");
	output("\n\n<i>“Surely there’s some kind of trade we can make.”</i> You try your best to be diplomatic.");
	output("\n\nWhen the intercom clicks back on, the voice on the other side is breathing heavily. <i>“Uhhh, n-n-nope! I’ve got all the cum I need for today. You might as well leave. ‘Sides, you big, sexy off-worlders would just steal them anyway.”</i> Whoever it is, she moans after that. <i>“Ooh, and uh... there’s no way you could get through my defenses. Even though I’m so pregnant I can’t move, you’d never be able to get inside and have your way with me. So you should find some other girl to trick into f-f-fuuuuuucking!”</i> The last word comes out as a screech of pleasure, then abruptly cuts off.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",buzzIntoRaskland2);
}

public function buzzIntoRaskland2():void
{
	clearOutput();
	showAzra();
	showName("MAKE\nA CHOICE");
	output("Azra rolls her eyes. <i>“It’s so tiresome that everyone we meet is so obsessed with sex. She sounded like she was masturbating in there for heaven’s sake!”</i>");
	output("\n\nHer assessment seems on the money. <i>“So what do you want to do? It’s your mission.”</i>");
	output("\n\nAzra turns her eyes back to the door. <i>“I say we go for it. Between the two of us, we can find a solution to deal with her so-called defenses. Important scientific work should not be stopped because of the deviances of a single native. Besides, it seems clear to me that she wants us to get inside. Such marvelous sexual deviancy...”</i> She taps her chin. <i>“But if you truly have qualms about invading her home, we could move on. We will surely miss out on numerous scientific advancements, but there are thousands more waiting to be cataloged.”</i>");
	output("\n\nDo you break in or move on?");
	processTime(3);
	//[Break In] [Move On]
	clearMenu();
	//9999
}

//Move On
public function moveOnAndSkipMotherbutts():void
{
	clearOutput();
	showAzra();
	showName("\nMOVING ON");
	output("<i>“");
	if(pc.isBimbo() || pc.isBro()) output("Pshhh. Fuck this mess. I’m not going to break down a door just for some pregnant alien pussy. Besides, I’m sure there’s like, tons more pregnancy plants on other planets.");
	else output("Let’s move on. The sooner we get the last thing on your list, the sooner we can move on to the next planet.");
	output("”</i>");
	output("\n\nAzra looks longingly at the door, then sighs. <i>“Very well.”</i> She taps at her codex thoughtfully. <i>“I’ve identified a path that should get us to the spunkshrooms with minimal exposure to hostile natives.”</i> Her tail curls protectively around your [pc.hips]. <i>“No reason to risk my protector’s safety any more than necessary.”</i>");
	output("\n\n");
	if(pc.isNice()) output("Smiling back at her,");
	else if(pc.isMischievous()) output("Wearing a cocksure grin,");
	else output("Nodding severely,");
	output(" you leave the bunker behind you, the pregnant-slut inside to remain forever a mystery.");
	//[Next] -> On to the spunkshroom intro :3
	clearMenu();
	//addButton(0,"Next",9999spunkshroomIntro);
}

//Break in
public function breakIntoRaskbutts():void
{
	clearOutput();
	showAzra();
	showName("BREAKING\nBADLY");
	output("<i>“Let’s break in.”</i>");
	output("\n\nAzra’s smile bares a disturbing amount of sharp, triangular teeth. <i>“I was hoping you’d say that.”</i> She tucks her codex away and cracks her knuckles. <i>“The way I see it, we have a couple options. Brute force, for starters. While I’m no gym bunny, my size alone affords me considerable leverage. I’m sure that we could pry it open if we both put our backs into it. Alternatively, you could try to hack it. The comms panel looks to be screwed in place. It’d be easy to get at the wiring behind, if you’ve got the knowledge.”</i> She smiles sadly. <i>“I certainly don’t.”</i>");
	output("\n\nYou scratch your chin, mulling it over. ");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("You’ve more than got the experience to hack it.");
	else output("You’re no expert when it comes to hacking, but you know enough to take a crack at hotwiring an ancient door. How hard can it be?");

	processTime(2);
	clearMenu();
	//9999
}

//Brute force
//DC 30 strength check. Repeatable. Every attempt uses up five energy.
public function bruteForceTheDoor():void
{
	clearOutput();
	showAzra();
	showName("PUSHING\nIT");
	//First time
	if(!pc.hasStatusEffect("RASKDOOR_ATTEMPT"))
	{
		output("You put your fist on the door. <i>“Let’s get this fucker open.”</i>");
		output("\n\n<i>“I was hoping you would say that.”</i> Azra stretches, hands high over her head. Her wings flutter excitedly as she works through more movements, preparing her muscles for the strain to come. <i>“Ready?”</i>");
		output("\n\nYou roll your shoulders, then brace against the door frame. A pitted crease midway down the seam provides a decent enough handhold for you. Azra taps a few buttons on her wrist, and the fingertips on her armor begin to glow. She slaps them into place a little farther up. <i>“Magnetic adhesion,”</i> she explains. <i>“These were meant to hold onto the side of a ship in vacuum, but they’ll be just as useful here.”</i>");
		output("\n\nYou nod. <i>“You ready?”</i>");
		output("\n\n<i>“Yeah.”</i>");
		output("\n\nYou count down. <i>“Three... two... one... heave!”</i>");
	}
	//Second time
	else if(pc.statusEffectv1("RASKDOOR_ATTEMPT") == 1)
	{
		output("<i>“One more try.”</i> You slap the door. <i>“We can do this.”</i>");
		output("\n\nAzra nods soberly. <i>“Sure thing.”</i>");
		output("\n\n<i>“Here we go,”</i> you say. <i>“Three... two... one... heave!”</i>");
	}
	//Third+ time
	else
	{
		output("<i>“Ugh... we can’t give up now.”</i> You nod at Azra. <i>“Another go.”</i>");
		output("\n\n<i>“Okay...”</i> She doesn’t look very convinced, but she steps into position all the same. <i>“Count it down.”</i>");
		output("\n\n<i>“Three... two... one... GOOOO!”</i>");
	}
	//Success
	if(pc.physique()/2 + rand(20) + 1 >= 30)
	{
		output("\n\nYou and the suula grunt and strain against the mechanisms behind the wall, tugging with all your might. At first, your efforts seem in vain, but with a screech of grinding metal, an inch-wide gap opens at the top. Ripping a nearby pipe out of the ground, you slam it into the space to brace it open. Azra grabs the end and violently twists it like a crowbar, prying the reinforced portal wider and wider. The motors inside the walls spark and hiss as they are overloaded, then give out entirely. A child could finish opening it at this point. Azra slams it open instead.");
		output("\n\n<i>“After you.”</i>");
		flags["RASKDOOR_BROKE"] = 1;
		processTime(2);
		clearMenu();
		addButton(0,"Next",brokeIntoRaskDoor);
		return;
	}
	//Fail
	else
	{
		if(!pc.hasStatusEffect("RASKDOOR_ATTEMPT"))
		{
			output("\n\nYou and the suula grunt and strain against the mechanisms holding the door closed, but no matter how you tug and pull, it will not move. The most disheartening part is that it doesn’t even budge. Not one millimeter. For all your pain and effort, you’re right back where you started - only with a bit less energy. Ugh. (-5 energy!)");
		}
		else output("\n\nJust like last time, your efforts accomplish little more than tiring you out. The door may as well be made from concrete. As you’re panting for breath, you find yourself wondering if it was just painted on in order to waste your time. (-5 energy!)");
		pc.energy(-5);
		output("\n\nDo you want to try again, try to hack it, or leave?");
		
		if(!pc.hasStatusEffect("RASKDOOR_ATTEMPT")) 
		{
			pc.createStatusEffect("RASKDOOR_ATTEMPT");
			pc.setStatusMinutes("RASKDOOR_ATTEMPT",200);
		}
		pc.addStatusValue("RASKDOOR_ATTEMPT",1,1);
		//9999 choice menu
	}
}

//[Next] - use the following text for all intros
public function brokeIntoRaskDoor():void
{
	clearOutput();
	showAzra();
	showName("\nBUNKER");

	output("You ");
	if(pc.tallness >= 7*12) output("bump your head on your way in");
	else if(pc.tallness >= 5*12) output("squeeze into the door without much issue");
	else output("casually stroll inside. Sometimes it’s nice to be short");
	output(". The interior is cramped but well lit. The rust you’ve seen everyone else on this planet is nowhere to be seen. Any exposed metal is devoid of blemishes and well-maintained for something cobbled together from a half-dozen different wrecks. It’s impossible to pick out where the pieces join together; they’ve blended together into a piecemeal hodgepodge.");
	output("\n\nYou look back over your shoulder as Azra climbs in with you. She struggles to get her wings through, but once inside, she’s able to move in relative comfort... so long as she crawls on her hands and knees.");

	//Broke in
	if(flags["RASKDOOR_BROKE"] == 1)
	{
		output("\n\nA staticky voice reverberates out of the ceiling, <i>“Heyyyy! Since you cunts broke my door, I think I’m gonna have to break you. No hard feelings!”</i> Three recessed turrets swivel out of the wall in front of you, each armed with a different type of gun. At a glance, you guess there’s a machine-gun, a flamethrower, and some kind of ray-gun.");
		output("\n\n<i>“I can’t fight in here!”</i> Azra barks in a panic. At least she’s out of the way, behind you. Then again, you won’t be able to flee with her blocking the tunnel... <b>You have to fight!</b>");
	}
	//Didn’t break in
	else
	{
		output("\n\nA familiar voice broadcasts from the ceiling, <i>“Heyyyy! You guys are pretty smart for off-worlders, rewiring the door like that.”</i> It pitches into a husky whisper. <i>“How about a test? You disable these turrets, and I’ll let you take whatever you want from me.”</i> Three turrets swivel out of the wall along with a digital display covered in power relays. <i>“Even my dignity. Mmmm... don’t die, ‘kay?”</i>");
		output("\n\nThey’re inactive right now, but you’re relatively sure that if you don’t play along, they’ll gun you down. You’ll need to purge the power from every single relay if you don’t want them to attack.");
		//TO HAXING MINIGAME!
	}
	//9999 routing go!
}

//Hack it
public function hackThatRaskDoor():void
{
	clearOutput();
	showAzra();
	showName("\nHACKING");
	if(silly) showName("YOU ARE...\nHACKERMAN!");

	output("<i>“");
	if(pc.isBimbo()) output("Oooh! You just watch. I’m gonna fuck the hell out of this door!");
	else output("I think I can hack this.");
	output("”</i> you declare.");

	output("\n\nThe panel is ridiculously easy to get off");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" with your toolkit");
	else output(", even with an improvised tool harvested from the surrounding junk");
	output(". Inside is a mess of wiring that looks more like spaghetti than an intelligently laid out circuit. If you want to get the door open, you’ll have to wire an electrical current into the servos that power the door - without electrocuting yourself in the progress...");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" Lucky for you, this isn’t your first rodeo. It should be a piece of cake!");
	
	processTime(1);
	clearMenu();
	//Geddystyle Hacking minigame!
	//9999
}

private function azraQuestRaskOverrideGame():void
{
	userInterface.showMinigame();
	var gm:RotateMinigameModule = userInterface.getMinigameModule();
	
	var g:uint = RGMK.NODE_GOAL;
	var i:uint = RGMK.NODE_INTERACT;
	var l:uint = RGMK.NODE_LOCKED;
	
	var n:uint = RGMK.CON_NORTH;
	var e:uint = RGMK.CON_EAST;
	var s:uint = RGMK.CON_SOUTH;
	var w:uint = RGMK.CON_WEST;
	
	//Baby difficulty
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		gm.setPuzzleState(azraQuestHackerDoor, 3, 3,
		[
			g | s    ,	i | w | n,	i | n | w,
			i | e | w,	i | w | e,	g | n    ,
			i | s | w,	i | s | e,	i | s | n
		]);
	}
	/*Commented out for Gedan to look at it.
	else if(pc.isBimbo() || pc.IQ() <= 30)
	{
		gm.setPuzzleState(azraQuestHackerDoor, 6, 6,
		[
			l        ,	i | n | e,	i | e | w,	i | s | w,	i | n | w,	l        ,
			i | n | w,	i | w | n,	i | n | s,	i | n | w,	i | e | s,	i | e | w,
			i | s | n,	i | e | w,	i | n | s,	i | n | s,	l | n | s,	i | w | s,
			i | e | n,	l | n | w,	i | w | s,	i | e | w,	i | n | e,	i | w | n,
			i | w | e,	l        ,	i | e | w,	i | s | w,	i | s | e,	i | w | s,
			g | n | e,	i | n | s,	i | n | s,	i | e | s,	i | w | n,	g | s    ,
		]);
	}*/
	else
	{
		gm.setPuzzleState(azraQuestHackerDoor, 5, 5,
		[
			i | s | w,	i | n | e,	i | n | e,	i | s | e,	i | n | w,
			g | n | s,	i | w | e,	i | n | e,	i | s | w,	g | w    ,
			i | s | w,	i | s | w,	l | s | w,	i | e | w,	l        ,
			i | n | w,	l | e | s,	i | n | w,	i | s | w,	l        ,
			i | n | w,	i | s | e,	i | e | w,	i | e | s,	l        ,
		]);
	}
}

public function azraQuestHackerDoor():void
{
	clearOutput();

	output("You did it!");
}/*




output("\n\n//Somehow fail? Not sure I’ll even have this be an option");
output("\n\nWith a whirring hum, the door slowly rolls open, revealing the corridor beyond.");
output("\n\n<i>“Yes!”</i> Azra cheers, sweeping you into a surprise hug from behind. Her feathers curl around you as she squeezes tight, tickling your [pc.skin]. This close, you can smell{ the residue of her recently spilled seed as well as }her natural scent, peachy and sweet. After a moment, she lets go, blushing hotly. <i>“I didn’t realize you were so talented.”</i>");
output("\n\n//Misch/Bimbo");
output("\n\n<i>“You should see me in the bedroom.”</i>");
output("\n\n//Bro");
output("\n\n<i>“...in bed,”</i> you finish the sentence for her.");
output("\n\n//Either");
output("\n\nAzra blushes, tail swishing behind her. <i>“Save that kind of talk for later.... Would you mind leading the way? I doubt I’d fit properly.”</i>");
output("\n\n//else");
output("\n\n<i>“What can I say? I’m good at my job.”</i>");
output("\n\nAzra’s eyes twinkles. <i>“Of course you are. Would you mind leading the way? I’m too big to fit in there very well...”</i>");
output("\n\n//Merge all");
output("\n\n[Next] -> To entry text");

output("\n\n//HAXXING MINIGAME!");
output("\n\n//Lights out, just like on Tarkus’s bomb mission. Start with most lights lit up except for three in the corner so idiots can accidentally turn the turrets on themselves with ease :3");

output("\n\n//Turn the turrets on");
output("\n\nThe turrets hum with power as they switch from passive to active mod. The closest, a machine-gun, clacks noisily as shells slam into place. You can’t run, not with Azra blocking the tunnel behind. <b>You’ll have to fight!</b>");

output("\n\n//Disable ‘dem turreeeeeets");
output("\n\nThe turrets suddenly sag down to point at the floor, indicator lights blinking out one by one as their capacitors drain. <i>“Yes!”</i> You pump your arm happily.");
output("\n\nAzra calls from behind. <i>“Did you do it? Are we safe?”</i>");
output("\n\n<i>“Yeah, I got it!”</i>");
output("\n\n<i>“Fantastic!”</i> the suula scientist cheers. <i>“I hope we’re close. I’m not certain how much more time on my knees I can take.”</i>");
output("\n\n//Bimbo");
output("\n\nYou blithely retort, <i>“Practice makes perfect, hun!”</i>");
output("\n\n//Bro");
output("\n\nYou chortle in amusement. Honestly it’s a good look for her. Shame the ceilings on your ship aren’t shorter.");
output("\n\n//Nice");
output("\n\nYou look back in concern. <i>“Hang in there. We’ve got to be close. This building isn’t </i>that<i> big.”</i>");
output("\n\n//Misch");
output("\n\nYou chuckle. <i>“We’ve got to be close. The building isn’t that big. Besides, it’s good practice!”</i>");
output("\n\n//Hard");
output("\n\nYou facepalm. <i>“You’re the one that wanted to come inside here. Suck it up, cupcake. We’re close.”</i>");
output("\n\n//Merge");
output("\n\n[Next]");
output("\n\nJust past the turrets is another door. This one has no security panel, just a simple toggle switch to pop it open. You wait for Azra to catch up, then press it.");
output("\n\nA high-pressure, pneumatic hiss sounds as the door slides up into the ceiling. The next room is dark, so dark that it takes your eyes a second to adjust.");
output("\n\n//Haxxored both!");
output("\n\n<i>“Ohhh no! The sexy aliens disabled all my traps with their superior intelligence, and I’m too pregnant to escaaaaape! Please don’t {pull out your dick and shove it in me... everywhere/make me eat your muff until I give birth. Please}. It’s just the hormones making me all wet, juicy, and fuckable. I’d be so distraught if you turned me into your personal fuckmeat!”</i>");
output("\n\n//Haxxed one but failed one");
output("\n\n<i>“Ohhh no! They’ve breached my control room. Fuck, you guys are sexy too? As if being smart and strong wasn’t enough. How am I supposed to keep my thighs closed when you’re this close, and I’m this pregnant? I should’ve built better defenses. Now I’m stuck, soaking wet, and totally at your mercy!”</i>");
output("\n\n//Force in");
output("\n\n<i>“Ohhh no! You smashed right through my defenses like they were nothing at all! How’s a girl supposed to keep herself from being raped, again and again, when big, strong aliens just smash down every attempt to keep my hot little cunny all to myself? Are you going to rape me? Please don’t rape me... I’d </i>hate<i> if you tied me up and kept me as your knocked-up broodmare for months!”</i>");
output("\n\n//Merge");
output("\n\nWithout the interference from the intercom system, the voice sounds even more wanton, layered thick in lurid intent. You can make out the shape of the speaker against the far wall. She’s a short thing, no more than four feet tall, but obscenely swollen around the middle, pinned to the floor by her immensely gravid belly and ridiculously wide hips. When you spy her ears, draped across her swollen tits, hanging over her belly like clothing, that you identify her as a raskvel. A raskvel that’s more pregnant than any raskvel you’ve seen in Novahome.");
output("\n\nAzra enters the room with her Codex’s light turned on. She seems elated to discover that the ceiling is higher here, allowing her to stand up straight. Her back cracks five or six times on the way up, accompanied by sounds of mild discomfort. Panning the light around, she illuminates your former tormentor.");
output("\n\n<i>“Sprat, that’s bright!”</i> the hyper-pregnant raskvel shrieks, shielding her eyes. <i>“I’ll {suck your dicks/eat your pussies/suck your dick} if you turn that light off.”</i> Whatever hormones are coursing through her, they’ve been good to her. Her feathery hair is glossy blue and longer than you’ve seen on any in the wild, matched by lips lacquered in a matching shade. Her tits are huge, for a raskvel. On a human, they’d be a hair over average, but on her small frame, they seem positively mountainous. Fortunately for her, she’s got a big, ripe belly to support them.");
output("\n\nAzra pans the light around, gasping when she sees a cluster of gray, tubular structures sprouting through a hole in the floor. They’ve grown in a thick ring, several feet across. The ones in the center are the tallest and the widest. Motes of some kind of pollen or spores float around them. Closer to the floor, obvious teeth-marks show where pieces have been bit off and consumed wholesale.");
output("\n\n<i>“Oh... you really don’t want to fuck?”</i> the raskvel sounds almost put out. <i>“You really just wanted my motherhusk stash?”</i> She lifts an ear to expose a boob, then slowly circles the areola with a finger. Somehow, she makes it look sulky. <i>“But I got all worked up watching you get here.”</i> She gestures to a flickering monitor, then at the crinkled, firm tips of her tits. Beneath her, the deck is glossy with feminine lube. <i>“And it’s so hard to reach my cuuuuunt.”</i>");
output("\n\nAzra looks at the raskvel, then jerks her head away, trying not to look at the display of wanton sexuality. <i>“Like [pc.name] said, we wanted to trade for the motherhusks.{ I’ll reimburse you for the door.} If you’d like, I can offer you some credits for the samples I’ll be taking, but I will be taking them. This is a rare species with properties that can advance the galaxy as a whole.”</i>");
output("\n\n<i>“Fuck your credits,”</i> the short-stacked raskvel says. <i>“Get over here and fuck me if you want to give me something.”</i>");
output("\n\nAzra shakes her head once more. <i>“Sorry, but I’d prefer to keep my amorous intentions for those I’ve developed a relationship with, not new acquaintances, no matter how fuckable.”</i> She kneels next to the husks and retrieves some gloves from her pack. <i>“[pc.name] might be willing to help you out. [pc.HeShe] seems like [pc.heShe]’d be a capable lover.”</i> Azra’s tail swishes playfully behind her. <i>“Harvesting these properly will take some time. Feel free to indulge yourself if the urge strikes.”</i>");
output("\n\n//High intelligence");
output("\n\nYou note that Azra has placed her Codex on the ground in such a way that the raskvel is well-illuminated. Perhaps she intends to sneak a peek of at any potential action... or record it for later viewing.");
output("\n\n//Merge");
output("\n\n<i>“Whaddya say? [pc.name], right? I promise we could have so much fun.{ My pussy’ll be the perfect sleeve for that dick./ I don’t care if you’re too big to fit inside a little thing like me. I wanna taste it!/ I could probably cum just from you straddling my face./ We could make out while you rub my belly, and I bet I’d still cum.}”</i> Her hips quiver, grinding her swollen mound against the diamond patterned deck plates. <i>“I’ll be the perfect, pregnant fucktoy!”</i>");
output("\n\n//Bimbo -disable non-sex options if PC has genitals.");
output("\n\nYou look her up and down. It’d be better if she had a dick, but you can hardly turn down the chance to tangle tongues with such a petite cutie.");
output("\n\n//Bro");
output("\n\nJob  complete and a free lay as a prize? Fuck yeah. You resolve to plow the kobold cutie so well that Azra lines up for the next round.");
output("\n\n//Else high libido or lust");
output("\n\nThat’s a hard offer to turn down. Your loins burn at the offer, and Azra is going to be busy for a few minutes... just enough time to get your rocks off. A quick bang will be... preparation for the trials to come.");
output("\n\n//Else low lust");
output("\n\nThe offer is tempting enough to stir your otherwise slumbering passion. Taking her up on it wouldn’t be a bad way to pass the time.");
output("\n\n//Else normal lust");
output("\n\nThere’s not much else to do, and Azra doesn’t seem to mind. Now would be as good a time as any to blow off some excess steam.");
output("\n\n//[Fuck Her] [Hyper Fun]  [Face Ride][Wait it Out]");

output("\n\nWait It Out");
output("\n\n<i>“No thanks,”</i> you tell the pregnant raskvel. <i>“But don’t let me stop you from enjoying yourself.”</i>");
output("\n\nThe feather-haired lizard-girl rolls her eyes. <i>“Suit yourself, sweet stuff.”</i> She brushes her ears out of the way and wraps her fingers around her pregnancy-swollen teats, rolling the tender nubs in her fingers. Meanwhile, her tail curls around to stroke the taut skin of her belly. It slips and slides all over the fecund dome, and it must feel good for how she moans. Yet the rask doesn’t push herself. Laconic movements and gentle strokes are the order of the day. She’s not working toward an orgasm; she’s playing her body like an instrument, riding the edge of ecstasy without plunging over into an exhausting orgasm.");
output("\n\nYou pull up the extranet on your Codex and try ignore the rask’s pleasure-soaked vocalizations. Azra seems to be doing the same as she intently picks over the plant growth.");
output("\n\nAlmost twenty minutes pass like this, though four or five in, the raskvel’s tail took a journey beneath her thighs, and her moans jumped up an octave. You couldn’t keep your eyes from watching, not when there’s a plump, purple mound having its doubled clits stroked by a mischievous tail. It’s almost hypnotic. You wonder how much time this raskvel spends pregnant. From the way she greeted you on the intercom, she probably has a line of suitors that check back from day to day, hoping for a chance to sire her latest litter.");
output("\n\n<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
output("\n\nThe only thing coming after you is the pregnant raskvel. She does so quite loudly.");

output("\n\n[Hyper Fun]");
output("\n\n//Crown fellating followed by hugjob, shaftlicking, and a stcky shower.");
output("\n\n//Make sure to set x to biggest and add to parser calls. Kthnx, futureFen.");
output("\n\n//Crotchcovered:");
output("\n\nThe second you begin to unwrap your concealed cock, the raskvel’s eyes go wide. She leans closer, nostrils flaring and sniffing, her nipples visibly perking. Her lips purse as she struggles for words. Then your [pc.cock] flops out in all its immensity, {half-turgid and growing under her spellbound gaze/massively turgid, the veins pumping beneath her spellbound gaze}. She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
output("\n\n//Uncovered");
output("\n\nThe second you bring your proudly-displayed member toward the pregnant raskvel, her eyes go wide. She leans closer, as much as her bloated frame will allow, nipples visibly perking. Her lips purse as she struggles to find the words. Proud of the effect you’re having on her, you switch your hips forward, bouncing {the half-turgid dick before her as it slowly inflates, locking her spellbound gaze to the inhumanly thick veins/the massively engorged dick before her as the inhumanly thick veins throb and ache for penetration.} She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
output("\n\n//merge");
output("\n\n<i>“W-wow. It’s so big.”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin{, leaking a fat drop of pre-cum onto her wrist/, drooling a stream of pre-cum all over her wrist}. Her expression sours. <i>“I wish I wasn’t pregnant.”</i> Tiny hands grab you just behind the [pc.cockHead] and gently tug you closer.");
output("\n\nYou let them.");
output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone{, and from how she whimpers after every breath, she likes it. When she pauses and sniffs deeply, her tiny frame shudders in response to the hyper-concentrated dose of pheromones{. You silently praise whoever invented the Treatment}}.");
output("\n\nFrom behind you, you hear a clattering sound as Azra drops a tool.");
output("\n\nSoft lips are on you before you can check to see if she’s okay. They press against the meatiest part of your [pc.cockHead], already slick with spit and eager to touch every part of your sensitive maleness. Tingling bolts of pleasure shoot through your sensitive mast as the miniature succubus’s fingers work over the skin, teasing and testing it{, dancing across the pronounced medial ring/, admiring the smooth taper of the shaft/, lovingly circling around every little nodule/, slipping through the wiggling tendrils, one at a time/, palming at the uninflated weight of your [pc.knot]/, tenderly exploring a genital slit that seems too small for the totem pole sliding out of it/, tenderly exploring the musky folds of your sheath}.{ Your body responds by oozing a steady flow of pre into her maw, feeding her biological proof that she’s a world-class cock-sucker. She savors it with gusto./ Your body responds by dribbling pre into her maw, providing biological evidence that she’s a world-class cock-sucker.}");
output("\n\nThe raskvel’s hungry eyes pop open abruptly, and she breaks her dick-licking kiss to look up at you. Her hands, fortunately, do not stop their worship. <i>“Can I collect your cum.”</i> Her eyes are eager and earnest. <i>“I... there’s a bucket.”</i>{ She licks stray pre from her lips, though the effect is more to smear it across the bottom one like lip gloss./ She licks her lips} <i>“And I want to have your babies. After these.”</i> She lifts your dick with both hands, grunting with the effort, then feathers kisses along the underside of your shaft{, sucking on the soft, feline \"barbs\”</i> one at a time}. <i>“You’re the best daddy I’m ever going to meet.”</i>");
output("\n\nYou doubt you could stop her from gathering some if you wanted to.{Bro/HighLib: Besides, a hidden part of you thrills at knowing this waddling baby-factory is going to play host to your children. Maybe she even has a system to preserve your cum, so she can pump out litters of little Steeles for years to come.} <i>“{Go ahead,”</i> you grunt./Like, O-M-G that would amazalicious!”</i> you cheerily exclaim, happy to feed her all the dick she could ever want./Just stop teasing me, and you can do whatever you want with the cum,”</i> you implore, hips shuddering. Her fingers are too damned good at their job.}");
output("\n\nThe raskvel giggles. <i>“{You boys are so easy./A few strokes to the dick, and you get so generous.} Don’t worry. If there’s one thing I know, it’s how to make a cock feel good. Well, that and how to remodulate an ionic conductor for usage in a particle cannon, but getting knocked up is wayyy more fun!”</i> She’s back on your [pc.cock] as soon as you finish, pulling it - and you - closer so that she can recline. So positioned, the pregnant raskvel is able to grind you against her belly and thread you through her tits, smearing your {oozing/streaming/all but gushing} pre across her soft-scaled skin.");
output("\n\nShe grabs a bucket from under the console while you adjust to the sudden onslaught of friction. <i>“Goddamn, that is some premium dick,”</i> the raskvel coos. She grabs one enormous ear and lays it across the top left side of your member. The inside is velvety soft warm. The other falls onto the other side a second later. <i>“I swear I can feel your dick all the way in my ovaries.”</i> Her legs tremble. <i>“Like they know I’m rubbing your big, fat, alien cumstick right next to them.”</i>");
output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her legs twitch with pleasure, trying to thrust her nearly-immobilized form against something, anything to get a little friction on her twat.");
output("\n\nYou know how she feels. Your [pc.cock] is violently throbbing from the treatment. Your heart hammers in your chest with alarming rapidly. All you want is her to stroke a little faster, squeeze a little tighter, and you could cum. Orgasm is so close you can feel it, and the raskvel surely can too with how your large [pc.cockHead] swells.{ Your [pc.cockTail] slithers down behind and slams into her well-used cunt, but it still isn’t enough. You need more.}");
output("\n\nTwo alien feet press down on your [pc.knot] from either side, toes squeezing. They’re slippering from all the girlcum on the floor, making her grip tenuous. Better still, her quaking thighs make them shudder like they’re strapped to a high-powered vibrator. You groan and thrust forward, slamming your dicktip against her cerulean lips, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
output("\n\nThe dam breaks, and you erupt into the raskvel’s maw.");
output("\n\n//Cum variants! - no new PG");
output("\n\n//Nojizz! - ANGER leads to the dark side.");
output("\n\nWhen your oversized organ does nothing but spasm climacticly, the purple-scaled mynx’s expression sours, her passion calming in the face of an orgasm with nothing more than a small, tongue-moistening dribble of [pc.cumNoun].");
output("\n\n<i>“That’s it?”</i> the raskvel says, gesturing wildly. <i>“All that effort and you barely get me half a dozen orgasms, and enough jizz to impregnate an ant? How dafuck am I supposed to get knocked up when {your balls are/your ball is/your body} is more dried out than sydian’s sense of humor? It’s like you bolted a fucking a giant, discount dildo on your crotch.”</i> She windmills her tiny fists in irritation, screaming, <i>“GET YOUR SHIT AND GET OUT! Fucking... fake-ass dick-having off-world losers!”</i>");
output("\n\nMaybe if you had some time to rest, you would’ve had a better load for her. Too late now.");
output("\n\n[Next]");
output("\n\n<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
output("\n\nThe only thing coming after you is the pregnant raskvel’s taunts. <i>“You see this bucket? This is where I’d keep your spunk... if you had any!”</i>");
output("\n\n//<50jizz - spit into bucket, a little disappointed but not mad. Recommends you eat some spunkshrooms.");
output("\n\nA few powerful, mouth-filling spurts spray out of your oversized organ, packing themselves deep into the raskvel’s cheeks. She shudders, cunt-leaking in sympathetic orgasm, but somehow, she doesn’t swallow. Instead, her feet pump you harder, milking the last few dregs into her maw.");
output("\n\nWhen she’s sure she’s harvested every drop, her hands and feet release your {slowly deflating meat/still-hard cock}. She leans to the side, grabs the bucket, and spits out your wad without a hint of shame. Only then, does she have a moment to reflect on what happened. <i>“Not too bad, star-stuff.”</i> She licks the residue from her lips and noisily swallows. <i>“Bet it must be some virile stuff, to come all the way out of that big, swinging dick of yours.”</i> Kissing the top of your cock like a favorite pet, she smiles. <i>“You did real good.”</i>");
output("\n\n[Next]");
output("\n\n<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
output("\n\nThe only thing coming after you is the sound of the pregnant raskvel’s voice through the intercom. <i>“Thanks again for visiting. Come back real soon, okay? I’ll make sure to tape the birth for you~!”</i>");
output("\n\n//< 200 jizz - get mouthful, then aim rest into bucket. Polite thank you.");
output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. Still latched onto your [pc.cockNoun], the gravid girl takes it like a champ, swallowing noisily even as her pussy fountains clear girl-cum onto the floor. With shuddering hands, she grabs the bucket, swapping it into place just before your next squirt can take her in the face. You’re forced to watch your orgasm shoot into the rustic vessel, spurt after spurt puddling in the bottom while slippery soles work your [pc.knot] to squeeze out even more.");
output("\n\n<i>“Ah-ahhh yes!”</i> the gravid girl cries, shuddering again and again. You swear you can feel her strained stomach ballooning in response to the loads pumping through your urethra, so close by. <i>“Just like that!”</i> She twists her feet in half-circles, stunning you with hellish pleasure to help you leak out a few last drops. Only then does she let you go and put the bucket back on the floor.");
output("\n\nA face blushed nearly pink greets you, illuminated with a cum-splattered smile and bright, pleased eyes. <i>“That was really nice. Really nice.{ Almost enough to make up for breaking my {door/turrets}./ Almost as good as popping out your eggs is going to be.}”</i> She pats your dick affectionately. <i>“I think there’s enough for three or four pregnancies there, if I’m smart about it, but I bet you’d rather I just poured it all with a funnel first chance I get, wouldn’t ya, {stud/slut}?”</i>");
output("\n\n{You nod vigorously, wishing you could watch her do it./You giggle and shrug. Like, cum is great no matter how it slides into you!/You shrug nonchalantly, a little tired.}");
output("\n\n<i>“Well I’m a raskvel, and that means I’m smarter than the stingy angel-shark over, and everybody else on this dustball of a planet.”</i> The raskvel thumps her fist proudly against her chest. Her exposed tits jiggle, glossy with sweat. <i>“I’ll ration it out. Maybe even mix it in with some raskvel nut if I think it needs a little help. I’m going to get so pregnant from you so many times, just you watch.”</i>");
output("\n\n//[Next] with the same text as previous");
output("\n\n//< 1000 jizz - get mouthful+facial, then collect rest in bucket while blind.");
output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. The gravid-girl’s mouth can’t even contain it all. She’s forced off your dick by the heated flow and takes the rest square in the face. Ribbons of [pc.cumNoun] cascade down her cheeks. [pc.CumGem] droplets dribble from her chin, but the raskvel still manages to remember her bucket and lift it into place, even while she’s trying to swallow her leftover mouthful. You can’t see her face with the spooge-vessel thrust in front of it, but you can hear her moans imploring you to give her more.");
output("\n\nStrangely, she seems to be getting off on it. Every time your [pc.cockNoun] shoots a flood of [pc.cumNoun] through its urethra, you can feel her strained belly pressing back harder against you, as if the mere presence of sperm nearby is enough to make her reproductive system accelerate. Squirts of girlcum hit your [pc.feet] as she quivers, making her tiny soles pump your [pc.knot] harder, squeezing even more of your potent fluids into the bucket.");
output("\n\n<i>“Holey fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“You’re gonna get me pregnant for weeks, {stud/slut}!”</i> The bucket sloshes higher as you spend the last of your liquid passion. She sets it down, giving you a good look at her [pc.cumColor]-painted maw. Streams of [pc.cumVisc] [pc.cumNoun] hang from her chin, and she’s constantly blinking her gunked-up eyes to try and see. <i>“I think my ovaries might have mutated again. Something definitely happened down there. I bet when I get pregnant with your kids, I’ll have even more. My current record is fifteen.”</i> An absurdly proud smile appears beneath the layer of sexual filth.");
output("\n\n[Next] -> same text as previous");
output("\n\n//< 3000 jizz - get mouthful+facial+plastered hair, then collect rest in bucket");
output("\n\nAn immense, mouth-flooding squirt sprays out of your oversized organ - and directly past her lips. She’s forced off your dick by the eruption of [pc.cum] with her cheeks bulging wider than a squirrel’s and a shocked look in her eyes. It doesn’t last long, not when the rest of your spermy shot goes across her nose, cheek, and forehead, all the way up into her {once-}blue hair. Her arms flail around for the bucket, but by the time she gets it in front of your [pc.cockHead], she’s entirely drenched.");
output("\n\nYou’ve only just begun to climax, spilling more virile liquid into the bucket than this raskvel likely sees in a month. She’s loving it too. You can tell by the way she squirms below you, her feet quivering on your [pc.knot] whenever another pulse of [pc.cumNoun] passes through your urethra. Cunt-juice splatters the floor. The messy-little kobold is apparently quite the squirter. Stranger still, it seems like her belly gets bigger the more you go off, like having that much jizz that close to her womb is enough to make her reproductive system go into overdrive.");
output("\n\nHigher and higher, the cummy tide rises in the bucket, sloshing. As it reaches near the lip, your shots cause some to splatter out on the raskvel mother’s tits, a sight erotic enough to help you squirt an extra time or two - just enough to fill it to the top.");
output("\n\n<i>“Homyfuckinggoddamn that is a lot of cum!”</i> The pregnant lizard-girl tries to set down the bucket, but a few cupfulls slosh out in the process. She giggles and shovels some into her mouth, completing the image of a completely debauched cum-slut. <i>“And it tastes so strong! You’re going to give me babies for months, you know that right?”</i> She smears more cum on her stomach, making the scales there shine. <i>“You’re my primo baby-daddy. Gonna put more raskvel on this planet than a whole generation of rask boys.”</i> She kisses your dick, then hugs it passionately.");
output("\n\n<i>“You and your cock are welcome here anytime. Just walk in and shove anybody else out of the way, because you are my number one lay from now on, got it?”</i> the smutty broodmother jabs a finger in your direction. <i>“I’m {almost glad you smashed up my {door/turrets}/so glad you decided to force your way in here to meet me.}”</i>");
output("\n\n//Next -> same as other cummy epilgoues.");
output("\n\n//< 10000 jizz - choke on jizz, + full body drench, and bucket overflows.");
output("\n\nAn immense, overwhelmingly virile stream issues forth. The tide of jism instantly balloons the raskvel’s cheeks to comical proportions, then blows her off the end of your dick entirely. Unbound, semen sprays across her features. First, it drenches her shockingly parted lips, then splatters across her cheek so hard that it coats everything from the bridge of her nose the curve of her jawline. [pc.CumGem] dribbles from her chin as her jaw works to swallow the first [pc.cumFlavor] mouthful, but you’re far from done. Your [pc.cock] bucks like a raging bronco, and the hose of seed takes her across the forehead for a moment before soaking her hair.");
output("\n\nIn desperation, the semen-coated lizard scrabbles for her bucket. She gets it up in time to catch your second shot - most of it anyhow. It fills with alarming rapidity, something that clearly delights the raskvel from how she moans and squirts intermittently. While you fill the bucket, the constant caresses coaxing ever more from your body, you realize that her belly is getting larger. You aren’t sure why or how, maybe her hyper-developed reproductive system can tell that gallons of virile seed are flowing by, just inches away, packed into your highly-pressurized urethra. Maybe she’s so eager to funnel all that [pc.cumVisc] [pc.cumNoun] into her snatch that she’s accelerating her pregnancy through willpower alone.");
output("\n\nMaybe the motherhusks have turned her into a baby-making machine.");
output("\n\nYou don’t really care either way, not when she’s still wringing your [pc.cock] with those lovely ears of hers, jacking your [pc.knot] with her feet, and begging you to keep cumming. When your [pc.cum] sloshes over the edge of the bucket, you groan in delight. It slips out of her fingers not long after, all but forgotten on the floor. She’ll be glad when she realizes it didn’t tip over, though more than half of her precious baby batter spilled to the floor.");
output("\n\nNo matter. You dump load after load onto her tits, first left, then right. Once they’re sufficiently soaked (with a small lake in her cleavage), you turn your attention south to her belly. The fecund dome is soon takes on the appearance of a well-glazed pastry, with trickles of [pc.cumColor] icing dripping down the sides.");
output("\n\nStill, she begs, <i>“My pussy!”</i>");
output("\n\nYou violently yank your cock out of her hands and shove it low, right up against the lips of her double-clitted pussy. The nubs press down on your [pc.cockHead] from either side as the lips yield to the torrents of spooge you push out, cream-filling her passage in one blissful squirt. Her plugged-up cervix won’t let her take any more, so you pull back and jack the last few squirts from your dick onto her puffy mound, letting the excess drip off her thighs.");
output("\n\n<i>“S-so much fucking cum!”</i> the raskvel screams, violently orgasming one last time as she smears the dregs of your climax across her taut tummy. <i>“It’s everywhere.”</i> She looks dazedly at the bucket. It’s almost as filthy with your jism as she is. <i>“I think I love you.”</i> The declaration is whispered tiredly, but there is no hint of deception in her voice. To her, you’re clearly the perfect mate.");
output("\n\nHer lingering declaration hangs heavy in your mind. <i>“{Awww, you’re a super good fuck yourself. I’d fill your pussy any time!/You’re not so bad yourself,”</i> you grunt. <i>“Not bad./You’re amazing, though I don’t think I’m ready to drop the ‘L’ word myself./You’re not bad yourself, little lady. I’d knock you up any day of the way./You love my dick,”</i> you explain, shaking it at her. <i>“But thanks anyways. I know it can have that effect.}”</i>");
output("\n\n<i>“Do you have any idea how many babies you’re going to give me?”</i> She scoops cum out from between her tits, then dumps it in the bucket. <i>“You’re going to father to a whole generation of virile, big-dicked raskvel boys.”</i> After a moment of thought, she adds. <i>“You should come back. Next time, I can be the cum-bucket.”</i>");
output("\n\nSomehow you doubt she’s capable of making that many children, but it brings a smile to your face all the same.");
output("\n\n//[Next] -> to usual outro, but with new dialogue:");
output("\n\n<i>“Thank you so much for all the cum! I’m going to record the births, every one of them, then post them on the extranet. People in the core actually pay to watch! Look me up sometime.”</i>");
output("\n\nYou’re pretty sure Azra facepalms, even though she’s crawling behind you on her hands and knees.");
output("\n\n<i>“And come back soon. Fresh cum is so much better!”</i>");
output("\n\nFuck Her");
output("\n\n//"Her womb may be full, but her pussy isn’t.”</i>");
output("\n\n{You hurriedly free your [pc.cocks] from {its/their} irksome confinement. The long-concealed flesh springs free and rapidly engorges before the raskvel’s eyes./You casually grasp your [pc.cocks] and shake {it/them} at the horny raskvel.} She smiles wide with licentious intent, licking her blue-painted lips and tossing her hair.");
output("\n\n<i>“You gonna stick it in?”</i> The purple-scaled lizard rolls to the side, lifting one leg high into the air to reveal an obscenely swollen cunt, flanked by bright pink, marble-sized clitties. The folds themselves are thick and juicy, dribbling eager cuntjuice across the floor. No matter how many birth’s they’ve passed, they’re plush enough to squeeze down on a pinky, let alone your [pc.cock]. <i>“Or are you just teasing a poor, immobile rask girl?”</i> She grabs her ankle and pulls her leg higher until her lips part, releasing a small gush of lube. <i>“Maybe aliens are just shy...”</i>");
output("\n\n//Very tall.");
output("\n\nHardly. She’s just so small. Getting a huge creature like yourself to line up with that slobbering slot takes significant effort and a small amount of engineering. Between shoving a few cushions under her ass and awkwardly squatting down, you make it work.{ Life... uh... finds a way.}");
output("\n\n//Else");
output("\n\nHardly. You squat down to line yourself up, nearly slipping in the leaking girlslime in the process.");
output("\n\n//Merge");
output("\n\n<i>“...Maybe you’re just afraid of a little raskvel pussy. Like you know you’ll be lining up at my door day after day once you taste it,”</i> the sultry tart suggests.");
output("\n\nGrabbing her belly to brace yourself, you thrust inside. {Her pussy parts easily around your [pc.cock], and her diatribe cuts off with a high-pitched squeak of pleasure./Her pussy reluctantly parts for your [pc.cock], clutching it tightly as her diatribe cuts off with a high-pitched squeak of pleasure./Her pussy strains to accept your girthy tool, its thick lips stretched wide enough to pass an egg. A high-pitched wail of pleasure interrupts the little slut’s diatribe at the penetration. Evidently she’s a fan of pushing herself to the absolute limit.} That saucy slot feels lovely wrapped around you. Her folds are absolutely soaked, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
output("\n\n//2");
output("\n\nMeanwhile, your second dick rubs against her slippery crease of her thigh, pressing its [pc.cockHead2] up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows it to glide effortlessly against her, right up until she wraps her fingers around it to give it a tug. <i>“I see you brought extra for the rest of me. How thoughtful...”</i> Her fingers twist and swirl while her cunt clenches.");
output("\n\n//More");
output("\n\nMeanwhile, your extra dicks rub against the slippery creases of her thighs, pressing their turgid tips up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows them to glide effortlessly against her, right up until she grabs {both of them/two of them} to give them a tug. <i>“I see you packed enough to share. How thoughtful...”</i> She pumps both hard. <i>“I could use a facial.”</i>");
output("\n\n//Merge");
output("\n\nWhatever your floor-bound partner may think, you hold all the cards. You’re the one doing the fucking, looming over her. You’re the one who moves her thigh to make the muscles inside her twat clamp down tighter on your rod. She can whimper, her hands caressing your body in ways that make you groan, but there’s nothing she can do to change your tempo, nothing she can do to give her pause when you pound her drooling cunt hard enough to make her chirp out an orgasm.");
output("\n\nYou’re just getting warmed up. You hammer her well-used cunt with powerful strokes. When you pull back, ropes of girl-jizz spatter the floor, hanging off your [pc.cock] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. You can’t tell if she’s cumming over and over, or if she just can’t handle how good it feels to have her pregnant pussy taken by a talented lover. You like it either way.");
output("\n\nBehind you, Azra grunts in what you take for irritation, but when you glance back, you see she’s popped the release on her crotch to let an absolutely enormous suula-cock dangle out. She’s hard and leaky, but she’s still doing her best to harvest the motherhusks. In her hurry, a piece cracks apart into dust, motes of falling down over her exposed groin. She doesn’t seem to notice, and returns to gathering the rest.");
output("\n\nA powerful, seismic clench yanks your attention back to the lizard-girl in front of you. She’s smiling saucily, her tail lashing back and forth. It {cradles your balls, then wraps around them with surprising tenderness. The warm cocoon of scaly flesh makes it seem almost too easy to spill your load./teasingly wanders over your slit, then slips inside. The slippery scales inside you make it almost too easy to spill your load./slips back to tease your [pc.asshole]. At first, it’s playfully circling, but after a particularly forceful thrust on your part, she slides it in. The pressure on your prostate makes it seem almost too easy to spill your load} One errant thought and you’ll be giving her an enormous, cunt-bathing creampie.");
output("\n\n<i>“You know, if you give me enough c-cuuUUUM~! ...I can save some to get pregnant with after this batch.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me ever bigger. Think about it. Your own little egg-slut, saving your cum so she can get knocked up again and again.”</i>");
output("\n\n{Fuuuck that’s exactly what you want to do. You want to strap her to the wall in your ship and dump endless loads into her, using her as equal parts sex-toy and virility measuring stick. Maybe you might even get her some mods or an exoskeleton to let her get around the ship. In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses.../You feel like you ought to be a little worried or disgusted about such brazen usage of your sexual fluids, but your body isn’t. Your traitorous rod{s} love{s} the idea of siring a whole clan of horny fuck-lizards. She’s tickled your most basic, unthinking instincts in ways that make your [pc.cockNoun] throb and your {[pc.balls]/crotch} clench.}");
output("\n\nYou bury yourself deep and unload. There’s no other option. The climax is entirely beyond your control, more a sudden venting of pressure than anything you have to work for. The pregnant raskvel’s oozy, clutching slit squeezes it out of you in {weak trickles/fat globs/thick streams/enormous gushes/titanic waves}, her well-used form wringing your [pc.cockNoun] for all its worth. Her cunt a warm, wet heaven, clutching you tightly, drowning you in ecstasy in pussyjuice alike{ while your pressurized seed vents back out all over the floor}. You shudder and groan with each successive spurt until your dick finally goes dry. Even then, the scaled vixen’s tunnel massages you pleasantly, begging you to stay inside and enjoy the post-coital massage.");
output("\n\n<i>“All done?”</i> Azra asks from over your shoulder.");
output("\n\nWhen did she get back there? Her dick is packed away and the samples safely holstered in her bag.");
output("\n\n<i>“Yeaaahh,”</i> you offer, trying to suppress a groan as you pull yourself free from your egg-obsessed lover. Your [pc.cockNoun] gleams with a fresh coat of pussy-juice while dribbles of [pc.cumColor] spooge leak from the tip. Azra’s eyes favor it with a longing look.");
output("\n\n<i>“Then we should get going. Only one sample left!”</i> Azra brushes back her hair and turns away, giving you a moment to make yourself decent before setting off.");
output("\n\nThe purple-scaled cum-dump on the floor grins giddily, stirring your offering around inside herself with a finger. She doesn’t seem like she’ll be talking just yet.");
output("\n\n[Next]");
output("\n\nAs you travel back through the tunnel, the comms click on once more. <i>“{Heyyy, you were pretty good at that... for an alien. You didn’t have much cum, but if you wanna play when I’m all pregger-horny, just stop by and gimme a ring, ‘kay?/Heyyy, thanks again for the donation. I scooped some out to save for later, so I’ll definitely get to have some of your kids.{ Lots of your kids, I guess. There’s like a whole bucket of it. You’re a super good breeder, you know that?} Anycooch, I guess you can come back and knock me up whenever you want. You’re real good at it.{ Almost makes it worth getting all my stuff smashed up...}}”</i>");
output("\n\nAzra mutters something from behind you, but when you look back, she’s facepalming.");
output("\n\n<i>“Don’t wait too long. It’s always better fresh!”</i>");

output("\n\nFace Ride");
output("\n\n//Straddle her face as she eats you out, then slip in her cuntjuice for musky fun :3");
output("\n\nYou advance on the immobile raskvel{, silently peeling the covers from your [pc.vaginas]/, silently wiggling your hips to display your [pc.vaginas]}. <i>“{You’re just the right height./I bet all the girls love seeing you stuck on your knees.}{ Now how about you lick all the cum out of me. {Nice&misch/hard:The glaze just makes it better, right?/Sluts like you </i>crave<i> it.}/ Now why don’t you put that tongue to work before my feathery friend finds an excuse to keep us apart?/ Now put that tongue to work, and we’ll see if you’re really keyed up enough to get off from the taste of another{ pregnant}{ person/ woman}’s pussy.”</i>");
output("\n\n<i>“Mmmm... been a while since I sucked pussy,”</i> the pregnant raskvel admits. Her eyes are wide and lustily locked on your slit{s}. It’d take a raskvel boy, dribbling cum and begging to fuck, to distract her for how she stares. She wants the pussy, and she wants it bad. Rocking forward, the lizard-girl strains to plant a kiss on your mound, but her pregnant bulk drags her right back, forcing her to settle down on her fattened haunches with an annoyed wobble. <i>“...Please? I can’t reach.”</i> She looks up imploringly, tugging her nipples as much for show as for her own pleasure.");
output("\n\nYou {step to the side and carefully climb up onto her console’s ledge. It’s the only way you’ll get your cunt at the right level with how short you both are./take a step closer.} The violet lizard-girl smiles eagerly. Then, too fast to be seen, she worms her tongue into your [pc.vagina]. One moment, you’re inching your hips closer. The next, a thick spear of oral flesh is wriggling inside your most sensitive place. It’s a disproportionately large thing too - nearly six inches long and fat enough around to shame a few of the galaxy’s bigger races.");
output("\n\nA sigh of delight slips from your mouth as your hips instinctively push back, pressing your lips to hers, [pc.oneClit] booping her on the nose. Your pregnant pussy-licker takes your vocalizations as encouragement and places her hands {on your [pc.butt]/on either [pc.thigh]}, squeezing as her luscious, blue-painted lips slip back and forth on your arousal-slickened flesh.{ Her mouth works to swallow the cum inside. For how fast she guzzles it down, scooping more into her maw with practiced curls of her tongue, she loves it.}{ You’re so wet that excess moisture stains your muff-mounted raskvel’s cheeks{ and drips from her chin in small waterfalls}.}");
output("\n\n<i>“Deeper,”</i> you urge, rocking back and forth on your face. Your pussy spasms around the tiny beast-girl’s rather... gifted tongue in pulsing waves that echo your own mounting ecstasy. When that wiggling organ draws back, you whimper in desperation and disappointment only to have your cry transform into a full-throated screech of pleasure once she coils it around [pc.oneClit]{, tugging it like a full-blown cock}. The best part of it all is just how slick and <i>hot</i> it all feels, like the nerves into your [pc.vagina] are firing so strongly that everything below your waist may as well be tongue-bathed pussyflesh.");
output("\n\nShe knows what she’s doing, that’s for sure.");
output("\n\n<i>“Mmmm,”</i> the short, stacked MILF moans into your cunt. Her fingers squeeze harder, claw-like nails {scrabbling across your chitin./digging into your [pc.skinFurScalesNoun].} Coils of pleasure twist through your nethers as the tongue abandons your clit and burrows deeper once more, feeling around the inside of your passage, stretching it open{ and letting it snap back into place/ and watching the [pc.girlCum] {drool/leak} out}.{ A tongue alone isn’t enough to satisfy you, however, and she knows it. Raising an arm, the purple-scaled nympho balls her small hand into a fist and thrusts it inside, twisting her neck so that her tongue can taste your oozing [pc.girlCum] while she pleases your capacious cunny.}");
output("\n\nBursts of stars explode behind your eyelids as the pleasure crashes into you. Whimpering and oozing, you shake and shudder, paroxysms of ecstasy wracking your frame, grinding your overheated slit into the cunt-smeared hussy’s blissfully unconcerned face. You dimly register the feel of her voice crying out into you, her sounds of pleasure little more than a booster rocket carrying you into orgasm-land by vibration alone.");
output("\n\n//Squirter + hugecumQ");
output("\n\nAnd there’s so much [pc.girlCumNoun]. It sprays into the raskvel’s mouth and washes down her cheeks. When she draws back to breathe, it splatters across her nose and forehead. Eventually she gives up and tips her head back, stabbing her tongue into you again and again, making your pressurized pussy spurt its fragrant liquid <i>everywhere</i>: on her tits, on her swollen belly. It even creates puddles on the floor that slowly wind their way toward a well-placed drainage grate.");
output("\n\n//Squirter");
output("\n\nYou pay the soft-scaled slut back in big, wet squirts of [pc.girlCum] that run down her chin and pool in her tits. Her skill as a slit-licker demands it. Your [pc.vaginas] will accept nothing less, not when climax has you in its grip and wrings you for every drop of feminine goo you can give.");
output("\n\n//Not squirter, very wet");
output("\n\nYou pay the soft-scaled slut back in a steady river of [pc.girlCum]. She all but purrs at the taste of it, throat bobbing in an effort to devour it all. When she sees you watching, she slurps louder, tugging on your netherlips, intent on wringing every drop of feminine lust from you before you continue on your journeys, and it’s working.");
output("\n\n//Regular wet");
output("\n\nYou pay the soft-scaled slut back in lurid moans and dribbles of [pc.girlCum]. She ravenously devours them, her tongue twirling inside you to gather it up and channel the flow directly into her maw. You hear her gulp once, then return to her work with the passion of an individual who truly loves the act of giving pleasure.");
output("\n\n//Merge");
output("\n\nAs you come down, shuddering through aftershocks, you run your fingers through her feathers. They’re down-soft, and the sensation combined with the taste of your post-coital cunt sends her over the edge. She whimpers, lower lip shaking against [pc.oneClit]’s hood, and her pregnant quim goes off, splattering pregnant raskvel-honey across the deck{ to mix with your own}. She rolls part way back, enough to give your [pc.vaginas] some relief, and you gingerly separate, panting and tired in the aftermath.");
output("\n\n<i>“Wow,”</i> you mumble, too cummed-out for words.{ There’s so much pink, cotton-candy fuzz twirling around in your head that you doubt you could complete a sentence, much less manage a witty entendre.}");
output("\n\nThe raskvel broodmother, pats her tummy. Did it get bigger? It definitely looks bigger... <i>“Mmm... that was fun. Not as fun as birth, mind you, but fun.”</i> She burps, and the scent of pussy in the air grows a little stronger.");
output("\n\n[Next]");
output("\n\nA metallic click and heavy footfalls turn you away from your recent conquest. Azra has already packed away the samples, and she’s gesturing toward the tunnel back to the wastes. <i>“Only one more sample to go, [pc.name].”</i> She’s blushing heavily, eyes darting back and forth from your brazenly exposed [pc.vaginaNoun] to the raskvel’s own dewy entrance. <i>“We can’t just... fuck all day.”</i> She turns away in a hurry. Is she... walking stiffly?");
output("\n\n//Bimbo");
output("\n\nSomebody’s got a boner~!");
output("\n\n//Else");
output("\n\nYou get the impression she did more than just sample the mushrooms, but don’t see much point in bringing it up, not when you’re this well-fucked.");
output("\n\n<i>“Heyyy,”</i> the pregnant raskvel’s voice bursts out of the comms above. <i>“Your pussy tastes way better than raskvel or sydian-cunt. Just let me know that you’re Miss Superpuss if you come back, and I’ll let you right back in.{.. once I fix the {doors//and//guns}. Don’t break ‘em again, please-kay-thanks!}”</i>");
output("\n\n<i>“That so?”</i> Azra muses from behind you, under her breath.");
output("\n\nSpunkshroom Trapqueen");

output("\n\n//Female Sydian Matron tending to spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage) and her two trappy raskvel boitoys.	");
output("\n\nOut in the bright tarkus sunlight once more, Azra takes a minute to direct you toward the next bio-cache. <i>“Once we climb out of this depression, take a left and press forward for 437 meters. The orbital scan places our targets amongst several spires of oxidized ferrite.”</i> She sighs. <i>“With how today is going, I expect we’ll find a sydian present.”</i>");
output("\n\nYou nod, and together you and the suula scientist set off toward the next prize. It takes you all of ten minutes to reach it.");
output("\n\n[Next]");
output("\n\nYou identify your destination by dozens of pillars stretching high into the air, their rust-red surfaces crumbling a bit with every breeze. The tops are flat and wide, and the closer they get to the ground, the narrower they become. A few have even toppled over. When you look closer, you determine their bases have been literally chewed away. Hundreds of bite marks provide all the evidence you need to know something has been eating at them.");
output("\n\nAs predicted, someone{, or something,} lives here{ - a sydian, no doubt}. You press forward carefully, hand on your [pc.weapon].");
output("\n\n[Next]");
output("\n\nAzra guides you deeper into the strange formations. Supposedly the spunkshrooms are <i>“Just ahead,”</i> like they have been for the past few minutes. Brushing the crumbling flakes from your {fuzzy }fingers, you mantle over a fallen pillar and bump into a very surprised raskvel girl.");
output("\n\n<i>“Eep!”</i> she squeaks, dropping an armload of orange mushrooms. When the small lizard spins and bounds around a crumbling mound, ‘her’ true sex is revealed - by the enormous, swollen sack bouncing beneath her wildly flapping loincloth - if only briefly.");
output("\n\nAzra crouches over the forgotten harvest. <i>“These... these are spunkshrooms.”</i> She dons gloves once more and quickly shovels them into one of her sample containers, sealing it closed with an audible hiss. <i>“The spores should be sufficient to grow my own crop. Ah... ahhh-!”</i> She sneezes powerfully, then wipes her snout with her still gloved hand.");
output("\n\nYou look at her wide-eyed. <i>“Uhhh... aren’t the spores to stimulate... you know{, like cummies/-}?”</i>");
output("\n\nAzra throws the gloves aside and grabs a tissue from a compartment in her armor.  <i>“I’m aware.”</i> She repeatedly wipes her nose to no visible effect. <i>“I doubt such brief exposure is cause for worry. Our little skittish little friend seemed no worse for the wear.”</i>");
output("\n\nYou think back to the sight of the girlish raskvel’s canteloup-sized sack, undeniably swollen with a tremendous load of jizz.{ You should’ve sucked him off before he got away.}");
output("\n\n<i>“Let’s get out of here,”</i> Azra grunts as she rises, shouldering her pack once more. <i>“We got what we came fo-”</i>");
output("\n\n<i>“THIEVES!”</i> The shrill screech chills you to your bones. <i>“Lay yourselves before the mercy of the Queen if you wish to be spared.”</i>");
output("\n\nFuck.");
output("\n\n[Next]");
output("\n\nA tall, statuesque {alien/sydian} rounds the corner, escorted by four feminine-looking raskvel males, the one you spooked included. {Your Codex identifies the leader as a sydian, a race known for feasting upon metal. }Stubby-looking weapons fit cutely into the scaly guards’ hands, though from the way they point them at you and Azra, their intentions are anything but cute. {Plasma or laser weapons, if you had to take a guess./Probably some kind laser or taser or plazer gun. Energy weapons are a lot harder to remember than types of dicks and where to rub them.} The leader herself is covered in thick, insectile armor bulky enough to grant her an even more imposing air.");
output("\n\nYour hand drops to your [pc.weapon]. Azra looks at you, then shakes her head slowly. You get the hint and pull your fingers back{, begrudgingly. It’d be easier to fight your way through this mess than grovel}.");
output("\n\n<i>“Thieves. You have assaulted Azaphel and stolen his rightly traded goods. What have you to say for yourself?”</i> the sydian’s fronds quiver in righteous indignation.");
output("\n\nYou could beg for forgiveness, berate the foolish raskvel and this so-called queen, or let Azra explain herself. The shark-girl looks like she has something to say.");
output("\n\n[Beg] [Berate] [Let Azra]");

output("\n\n//Let Azra");
output("\n\nYou nod to Azra. <i>“{You go, girl./Go ahead.}”</i>");
output("\n\n<i>“Right.”</i> Azra clears her throat and straightens up. <i>“With all due respect, your majesty, we did not come here to steal anything. In fact, my initial scans of the area suggested that inhabitants would be at a minimum.”</i> She brushes back her hair and sighs. <i>“Azaphel ran from us the moment we encountered him, before he could say a single thing. I  presumed, perhaps wrongly, that his abandonment of the mushrooms-”</i>");
output("\n\n<i>“Spunkshrooms,”</i> the sydian queen interjects. <i>“They’re spunkshrooms. I named them.”</i>");
output("\n\n<i>“...Yes,”</i> Azra admits, wringing her hands nervously. <i>“I assume he had no use for his... spunkshrooms when he left them behind. I gathered them, rather than let them go to waste, and prepared to leave your lands in peace.”</i> She kneels demurely, though she still towers above the pistol-packing raskvel. <i>“Nevertheless, my rash actions have brought harm to your subject. Is there some way I can make this right to you, Azaphel?”</i> She looks to the girly rask-boy. <i>“Something I can give you in exchange the mushrooms?”</i>");
output("\n\nAzaphel glances up to the sydian for permission. She nods graciously. Emboldened, the lizard-boy suggests, <i>“You could suck my co-”</i>");
output("\n\nThe Queen slaps the back of his head, silencing him. <i>“What Azaphel means is that a weapon would be sufficient. My army is ever in need of fresh weapons.”</i>");
output("\n\nAzra holds up her empty hands and looks to you. <i>“[pc.name], could you part with a weapon?”</i>");
output("\n\nOnce more, it falls to you to defuse the situation.{ What will you give Azra?/It’s a real shame you don’t have a weapon to give. Going unarmed into the Tarkus wastes? Not your best idea. <i>“I don’t have one either.”</i>");
output("\n\nThe regal Sydian’s feathery antennae droop in disappointment. <i>“Then I suppose you’ll need to suck Azaphel’s cock.”</i>");
output("\n\nAzaphel looks to his queen adoringly. <i>“Thank you Mistress. I’m sooo backed up. I haven’t cum in two whole hours!”</i>");
output("\n\n<i>“I know, sweetness. Don’t be too long.”</i>");
output("\n\nAzra blanches. Looks like you’re going to need to suck some dick.");
output("\n\n//Sex options here. Might just be blowies}");

output("\n\n//Give weapon");
output("\n\nYou hand over {weapon} to Azaphel, who is still rubbing the sore spot on the back of his cute little head.");
output("\n\n<i>“Thanks, I guess,”</i> Azaphel huffs, giving you a tiny bow. He looks back over his shoulder to the Queen, his eyes wide and soulful. <i>“Are you sure she can’t suck, just a little? I’m reeeeaaaaally backed up.”</i>");
output("\n\nThe Queen smirks. <i>“I will care for my subjects as I always have. Strangers, you may depart in peace. Our business is at an end. Trouble my subjects no longer.”</i>");
output("\n\nThat’s as clear a dismissal as you’re likely to get.");
output("\n\n<i>“Come on,”</i> Azra bids. <i>“Let’s get back to the ship!”</i>");



output("\n\n//Berate");
output("\n\n<i>“What have I to say for myself? I say you have about as much authority as you have sense.”</i> {You smirk and /You }point accusingly at the little tattletale. <i>“Aza{fall or whatever his name was/phel} threw those mushrooms away. If I had robbed him, as he claims, wouldn’t I have a weapon out? Wouldn’t I have simply followed him unseen and ambushed him a little further away? The idea that I could fail so spectacularly at thievery is insulting. I assure you that if I intended to follow the outlaw’s path, I would do so in a more successful fashion.”</i> You round on the self-styled Queen. <i>“If he is your subject, then perhaps the fault lies with you. Surely a true leader would inspire more than screaming cowardice in her followers.”</i>");
output("\n\nAzra gasps.");
output("\n\nThe self-proclaimed Queen raises an eyebrow as your insults rain down, but takes no other action. At long last, she asks, <i>“Are you finished?”</i>");
output("\n\nYou nod, and Azra buries her face in her palms. <i>“That’s it. We’re dead.”</i>");
output("\n\n<i>“Well said.”</i>");
output("\n\nThe trappy raskvels’ guns dip toward the ground as they turn to regard their leader in disbelief. She cuffs one, and the boy-toy bodyguards return to attention once more.");
output("\n\n<i>“Now,”</i> the Queen begins, <i>“you make some fair points, even if the manner of your statements is as crude as you are strange.”</i> She rubs a raskvel’s feathered head in a way that makes his gun waver and his eyes roll back a bit. <i>“I deem you innocent of thievery. Azaphel will be punished for his... lack of fortitude.”</i> She gestures dismissively in your direction. <i>“You may go.”</i>");
output("\n\nAzra lets out a breath you never knew she was holding. <i>“Come on... before they change their minds.”</i>");
output("\n\nYeah, that’s probably a good idea.");

output("\n\n//Beg");
output("\n\nYou drop to your knees. <i>“My apologies, Dear Queen! We are but strangers to your lands, journeyed from a far-away world in search of adventure and friendship.”</i> You gesture grandly to your winged companion. <i>“My friend is a scientist who studies all manner of plants. We merely sought these mushrooms that they might be preserved for all the galaxy to enjoy. Theft was never our intent or our goal. If we have taken the belongings of another, then you have our deepest, most sincerest apologies.");
output("\n\n<i>“Is this true?”</i> The Queen looks to Azra.");
output("\n\nShe nods vigorously.");
output("\n\n<i>“Very well. Your slippery words and false facade bear witness to Azaphel’s claims.”</i> She pets Azaphel lovingly. <i>“My loyal subject has no right to be treated so, not by any creature of any planet. Your punishment is simple.”</i> Pausing for dramatic effect, the sydian grins wickedly. Her tiny army quivers in anticipation. <i>“Service. You shall both serve Azaphel in whatever manner he deems fit.”</i> The scaly bastard’s loincloth begins to tent. <i>“Afterward, you are to relieve the other guard’s genitalia as well. They do get so pent up...”</i>");
output("\n\nYou begin to protest.");
output("\n\n<i>“SILENCE!”</i> the Queen shrieks, pointing a scepter in your direction. <i>“You will accept your  punishment with grace, or you will die like treasonous dogs.”</i>");
output("\n\nAzra’s shoulders slump. <i>“Come on, [pc.name]. Let’s just get it over with.”</i> She smiles wryly. <i>“We might as well try to enjoy it.”</i>");
output("\n\n[Accept] [Reject]");

output("\n\n//Accept -> Azra & you both thoroughly service Azaphel. After, milk the guards? Maybe they all sit their balls on the PC’s face for ball-polishing while Azra leans in to suck all three into her enormous maw?");

output("\n\n//Reject");
output("\n\n<i>“No.”</i> You stand up proudly. <i>“I don’t think so.”</i>");
output("\n\nThe Queen shrugs. <i>“A shame. You had such potential.”</i>");
output("\n\nHer bodyguards open up with their pistols before you’re halfway to adopting a combat stance, lighting up the space between you in a rainbow cacophony of alternating ultraviolet hues. There’s no time to wonder where they got such powerful weapons, not when the world as you know it fades away into nothing. You’ll never know if Azra survived. You certainly didn’t.");
output("\n\nGAME OVER.");
*/

//Expeditions:
//Button disabled if no expedition on current world or already done - unless first time intro needs doing! If talked about expeditions, skip first-time intro.

//Mhenga idea: botanical fuck-flower being displaced by invasive cunt-snakes. Grows in a thicket near a large zil settlement to the south. Fight naleen brothers armed with bottled zilmusk, then fight 9x cuntsnake infested zil (ZILSUNE) while she harvests a flower.

//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? Spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage)? Motherhusk (Accelerates pregnancy)

//“Munitions” plant on Myrellion. Bloated pepper-like growths that are under high pressure. If squeezed or thrown, they puff in a neurotoxic seed cloud that leaves the victim hypersensitive to even slight touches.


public function azraExpeditionAvailable():Boolean
{
	//"new texas", "tarkus", "phaedra", 
	if(getPlanetName().toLowerCase() == "mhen'ga")
	{
		if(flags["AZRA_MHENGAED"] == undefined || flags["AZRA_MHENGAED"] == 0) return true;
	}
	if(getPlanetName().toLowerCase() == "tarkus")
	{
		if(flags["AZRA_MHENGAED"] == 1) return true;
	}
	return false;
}

//Rush Expedition Introduction
public function azraExpeditionStartup():void
{
	clearOutput();
	showAzra();
	
	var planet:String = getPlanetName().toLowerCase();
	
	//Too Advanced (Gotta go in order for Fen’s sanity) (Or planet doesn’t have one available)
	if(!azraExpeditionAvailable())
	{
		output("You let Azra know that you’re ready to help her with her next expedition.");
		output("\n\n<i>“I’m not,”</i> Azra replies. <i>“My research into the local biomes leads me to believe that we would be better served spending our time on another world until we are more prepared for the dangers ahead.”</i>");
		processTime(1);
		azraMenu();
	}
	//Failure Introduction
	else if(flags["AZRA_EXP_FAILED"] == planet)
	{
		output("You let Azra know you’re ready to help her with an expedition.");
		output("\n\n<i>“Really?”</i> Azra looks at you uncertainly. <i>“I’d rather not risk it if things are just going to go sideways again. Are you sure?”</i>");
		
		//[Yep] [Nope]
		clearMenu();
		addButton(0,"Yep",adventureStartRouter,true,"Yep","Go on an <i>ADVENNNNTUUUUUURRRRRRRE!</i>");
		addButton(1,"Nope",nopeOutOfAdventures,undefined,"Nope","Maybe you should prepare first.");
	}
	//If not on Mhen'ga, go straight to the hot shit.
	else if(planet != "mhen'ga") 
	{
		adventureStartRouter();
	}
	else
	{
		output("<i>“Need help gathering samples?”</i> you say.");
		output("\n\n<i>“Seriously?”</i> Azra places her palm on her armored hip. <i>“You’re not pulling my wings?”</i>");
		//Misch
		if(pc.isMischievous()) output("\n\nYou grab hold of one and give it a little tug. <i>“Well now I am, but not about this.”</i>");
		//Bimbo
		else if(pc.isBimbo()) output("\n\n<i>“Nopitty nope nope!”</i>");
		//Else
		else output("\n\n<i>“Of course not.”</i>");
		//Merge
		output("\n\nAzra’s ink-black lips curl in a slight smile. <i>“Then I should prepare a plan before we begin. Allow me a few seconds to search my database. I’ve flagged thousands of potential reports of unique species on Rush worlds for further investigation.”</i> She picks up her codex and rapidly taps on the screen. <i>“");

		output("Ah yes... this one could be fun for both of us. Ready to get the ball rolling?");
		output("”</i>");

		processTime(3);
		clearMenu();
		addButton(0,"Ready",adventureStartRouter,undefined,"Ready","Go on an expedition with Azra.");
		addButton(14,"Back",nopeOutOfAdventures);
	}
}
public function adventureStartRouter(warned:Boolean = false):void
{
	var planet:String = getPlanetName().toLowerCase();
	switch(planet)
	{
		case "mhen'ga": actuallyGoOnMhengaExpedition(warned); break;
		case "tarkus": actuallyGoOnTarkusExpedition(warned); break;
		default:
			clearOutput();
			showAzra();
			output("<b>ERRORRRRRRRRRRRR NO EXPEDITION FOUND!</b>");
			azraMenu();
			break;
	}
}


public function actuallyGoOnTarkusExpedition(warned:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(!warned) output("You let Azra know you’re ready to help her with an expedition on Tarkus.");
	else output("You tell her in no uncertain terms that are you really ready. No room for failure on this trip!");

	output("\n\n<i>“Fantastic!”</i> Azra exclaims, grabbing her codex and her usual pack full of scientific miscellany. <i>“Luckily, we don’t have to save anything from extinction. The species that survived this planet’s cataclysmic history are more than robust enough to survive colonization by rogue core elements.”</i> Azra gives you a serious look. <i>“But that does not mean that there aren’t discoveries to be made. I’ve found three.”</i>");

	output("\n\n<i>“Three?”</i> You raise an eyebrow. Finding one flower was hard enough");
	if(flags["FUCK_LILLIES_USED"] != undefined) output(", even if the payoff turned out to be really, really great plant sex");
	output(".");

	output("\n\n<i>“Correct. I’ve identified three species of plants with highly mutagenic properties that grow in the areas surrounding Novahome.”</i> Azra pulls up a holographic display of smallish, pink-colored mushroom. <i>“The locals call these ‘Slutshrooms.’ Libertine name aside, these mushrooms cause a variety of poorly-understood mutations in those who consume them, resulting in increased libido and vaginal secretions. Further study could reveal a number of genetic optimizations for modern marital aids.”</i>");
	output("\n\nYou nod. Xenogen and TamaniCorp would both be interested.");

	output("\n\nAzra switches the hologram to display a set of craggy, hollow tubes. <i>“These are known to the locals as Motherhusks, and they’re the real potential prize of this expedition. Preliminary reports indicate that prolonged contact increases fertility while simultaneously speeding the development of any offspring in the womb. Both attributes are highly sought after in present day gene mods and would be worth a fortune if safely isolated.”</i>");

	output("\n\nYou lean close for a better look. They don’t look very palatable, but you suppose they’d come in handy ");
	if(pc.isPregnant()) output("to relieve you of your gravid state");
	else 
	{
		output("if you ever wound up pregnant");
		if(!pc.hasVagina()) output(", somehow");
	}
	output(".");

	output("\n\n<i>“My last target is...”</i> Azra clears her throat. <i>“Spunkshrooms.”</i> The display changes to show a squat mushroom with a droopy top that slouches all the way down to touch the ground. <i>“These things reportedly release spores that can increase sperm production, though data is more sparse than on the other two.”</i> She closes the hologram and pockets her tablet. <i>“Orbital biosign scans have pinpointed a region to the southwest where a population of each can be found in close proximity. Two or three hundred meters apart at most.”</i>");

	output("\n\nYou ask her if it happens to be next to a tribe of angry aliens.");

	output("\n\n<i>“Nope,”</i> Azra counters. <i>“That region contains low amounts of sapients and fauna in general relative to the rest of the planet. Hazards should be relatively minimal, barring any exceptionally combative individuals.”</i> She smiles winningly. <i>“But what are the odds of encountering something like that twice in a row?”</i>");

	output("\n\n<i>“Low, I hope.”</i>");

	output("\n\nNodding to herself as much as to you, the shark-like scientist follows up by grabbing a meticulously prepared pack, hefting the heavy weight onto a shoulder with uncommon ease. <i>“That’s what I thought. I’m all packed. You ready to go?”</i>");

	//[Yes][No]
	processTime(14);
	clearMenu();
	addButton(0,"Yes",beginTarkusQuest);
	addButton(1,"No",nopeOutOfAdventures);
}

public function nopeOutOfTarkusVenture():void
{
	clearOutput();
	showAzra();
	output("<i>“Not yet.”</i> You look back over your shoulder. <i>“It sounds like I might need to prepare a little more before I’ll be good to go.”</i>");
	output("\n\nAzra sighs, <i>“Just like the impetuous youth to change their minds at the last minute.”</i> The corner of her mouth quirks with the slightest hint of a smile as she sets her pack back down. <i>“I’m not going out there on my own, so suppose I have time for a little beauty rest.”</i>");

	//Misch
	if(pc.isMischievous())
	{
		//Also bimb
		output("\n\n<i>“As if you needed it.");
		if(pc.isBimbo()) output(" You’re so fuckin’ hot I could cook bacon on ya.");
		output("”</i>");
		output("\n\nAzra turns away before her blush blossoms into full bloom, wingtips quivering.");
	}
	//Nice
	else if(pc.isNice())
	{
		output("\n\n<i>“Then I’d best be quiet on my return.”</i>");
		output("\n\n<i>“Not too quiet, I hope,”</i> Azra replies as she turns back toward her terminal. <i>“I’d hate to miss the opportunity this planet presents.”</i>");
	}
	//Ass
	else
	{
		output("\n\n<i>“You’d better be ready to go when I am.”</i>");
		output("\n\nAzra quirks an eyebrow. <i>“I’ve been ready, Captain.”</i> She turns away, wingtips fluttering in mild irritation.");
	}
	processTime(2);
	azraMenu();
}
	
//Nope:
public function nopeOutOfAdventures():void
{
	clearOutput();
	showAzra();
	output("You change your mind.");
	output("\n\n<i>“Okay. Let me know when you’re ready,”</i> Azra says. <i>“Really ready.”</i>");
	processTime(1);
	azraMenu();
}


//Mhen'ga Expedition
public function actuallyGoOnMhengaExpedition(warned:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(!warned) output("You let Azra know you’re ready to help her with an expedition on Mhen’ga.");
	else output("You tell her in no uncertain terms that are you really ready. No room for failure on this trip!");
	output("\n\n<i>“Superb,”</i> the shark-like alien exclaims, grabbing her codex and a pack stuffed with all manner of scientific implements. <i>“I think you’re going to like this one.”</i> She grins at you. <i>“It was too dangerous to pursue by myself, but the prize... ohhh the prize.”</i> She steeples her fingers together. <i>“You see, Mhen’ga is famous for its fuck-hungry locals and sexually voracious flora. Venus Pitchers in particular. It isn’t the pitchers that interest me, however. It’s a smaller, more benign plant that grows almost exclusively in areas densely populated by zil.”</i>");
	output("\n\nYou adjust your own gear and ask her what makes it so interesting.");
	output("\n\n<i>“Well, rushers who’ve come across them have taken to calling them Fuck Lilies.”</i> Azra folds her arms across her chest. <i>“Preliminary reports indicate that they survive almost entirely upon the sugary secretions of the zil, not the overcrowded soils below. And they do it without any identifiable hint of coercion. No restraining tentacles, no venomous injections. The zil just fuck them instead of masturbating, because it feels so good.”</i> Her tail wiggles excitedly. <i>“Think of the potential uses! The credits we could make! They could be sold as masturbation aids-slash-houseplants, or used to refine new lubricants, sensation-enhancers, or even texture-creating cellulose structures.”</i>");
	output("\n\nYou nod");
	if(pc.libido() >= 50) output(" and try really hard to not imagine how it must feel");
	if(pc.libido() >= 75) output(". You fail hard, but Azra doesn’t seem to notice");
	output(".");
	output("\n\n<i>“The only problem an invasive species is displacing them. Cunt-snakes are slithering into that ecological niche, attaching themselves to naleen, zil, and damn near everything else on the planet. And when you’ve got a fuck-hungry pussy attached to your spine, demanding you sate it morning, noon, and night, you’re not going to go visit your friendly flower patch.”</i> Azra gestures imploringly to you. <i>“We aren’t just picking up pet fuck-plants to exploit. We are potentially saving a species from extinction!”</i>");
	processTime(15);
	//[Sure] [Eh...]
	clearMenu();
	addButton(0,"Sure",sureLetsDoThisMhengaThing);
	addButton(1,"Eh...",ehLetsNotDoThisMhengaThing);
}

//Eh...
public function ehLetsNotDoThisMhengaThing():void
{
	clearOutput();
	showAzra();
	output("<i>“Sounds like you’re justifying a lot.”</i>");
	output("\n\nAzra shrugs. <i>“Hey, you’re the one plundering undeveloped planets for their resources. Yes, I’m going to derive no small amount of pleasure from keeping my samples suitably nourished, but there are meritorious arguments for this course of action. Now come on. I can’t do this alone.”</i> She makes for the door, explaining as she goes. <i>“I pinpointed a large patch of them on last week’s satellite surveillance data, though evidence of an in-progress die-off is visible.”</i>");
	output("\n\nAt least this ought to be interesting.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",movingOnOutToMhengaExp);
}

//[Sure]
public function sureLetsDoThisMhengaThing():void
{
	clearOutput();
	showAzra();
	output("<i>“Sure thing,”</i> you agree.");
	output("\n\nAzra smiles warmly, <i>“Then let’s be on our way. Science waits for no man or woman.”</i> She makes for the door, explaining as she goes. <i>“Satellite data from a week ago has pinpointed a large patch not too far from Esbeth, though signs of a die off were already present. We must hurry if we are to save this flower.”</i>");
	output("\n\nThis should be interesting...");
	processTime(2);
	clearMenu();
	addButton(0,"Next",movingOnOutToMhengaExp);
}

public function movingOnOutToMhengaExp():void
{
	clearOutput();
	showNaleenBros();
	showName("FIGHT:\nNALEEN BROS");
	moveTo("OVERGROWN ROCK 3");
	
	flags["AZRA_MHENGAED"] = 0;
	
	output("Azra directs you to the jungle but wisely stays in the rear, leaving you to push your way through the thick, alien foliage. At every strange sound or cracking twig, she tenses up. Her wings catch on vines numerous times, leading the fiery-haired siren to noisily grumble and groan as she picks leaves from her mane.");
	output("\n\n<i>“What an inhospitable planet. I can’t believe anyone actually lives here, interesting flora or not!”</i>");
	output("\n\nYou shrug and do your best to keep your eyes open and alert. No journey through Mhen’ga is likely to end without at least one hostile encounter, and this one is no exception.");
	output("\n\nTwo figures slither out of bioluminescent bushes with nary a sound, one to each side of your small party.");
	if(!CodexManager.hasUnlockedEntry("Naleen"))
	{
		output("\n\nYour Codex pings, <i>“Warning, Naleen detected. These snake-like felines should be avoided if possible. Beware their venom.”</i>");
		CodexManager.unlockEntry("Naleen");
	}
	else output("\n\nThey’re naleen!");
	output("\n\n<i>“Oh brother... look what we have here,”</i> the leftmost one says, cat-like ears flicking playfully.");
	output("\n\nThe other’s ears go flat as he bares his fangs. <i>“A metal fish and foolish sky-creature, lost in the woods.”</i>");
	output("\n\n<i>“We should teach them a lesson.”</i>");
	output("\n\n<i>“We should.”</i>");
	output("\n\n<i>“We shall.”</i>");
	output("\n\n<b>It’s a fight!</b>");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc,azra);
	CombatManager.setHostileActors(new NaleenBrotherA, new NaleenBrotherB);
	CombatManager.victoryScene(winVsNaleenBros);
	CombatManager.lossScene(loseToNaleenBros);
	CombatManager.displayLocation("NALEEN BROS");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

/*Naleen Brothers Fight:
//Naleen A: Zilmusk bombs.
//Beaten by Physical or psychic only.
A naleen circles on the right. His build is typical of the kitty-snakes of Mhen'ga: snake from the waist down and furry, humanoid feline from the waist up. Sharp-clawed fingers wiggle eagerly at the sight of you, darting to a bandoleer of amber-colored bottles that ring his torso as if he cannot wait to unleash whatever is contained within. His ears are alert and playful. His dicks are too, jutting free from a reptilian slit to stab accusingly in your direction.

//Naleen B:
//Beaten by lust. Resistant to physical and psychic.
One of the naleen brothers holds the left flank of the jungle against you and Azra. He appears genuinely irritated by your presence, his ears flat back against his jet-black hair. His claws and fangs are clearly visible, brandished in an attempt to cow you into submission by threat alone. Behind him, his tail swishes angrily. A satchel bounces on his far hip, and judging by the way he holds it, he wants to keep it far from your reach.
*/

public function showNaleenBros():void
{
	showBust("NALEEN_BROS");
	showName("NALEEN\nBROS");
}

//Lose The Fight
public function loseToNaleenBros():void
{
	clearOutput();
	showNaleenBros();
	output("The naleen close in. One for you, one for Azra");
	if(azra.lust() >= 100) output(", who is frantically jacking off an enormous boner.");
	else output(", who is still too dazed to protest the removal of her crotch plate or the sudden erectness of her enormous boner.");

	output("\n\nAn uncorked bottle hits the ground next to you. Then another. Then another. Yellowish mist issues forth from each, swaddling you in a lingering, sweet scent. The scent of concentrated zil pheromones is inescapable");
	if(pc.lust() >= pc.lustMax()) output(", not that it matters, aroused as you already are. You flare your nostrils and drink it in, openly touching yourself and looking up in undisguised lust.");
	else 
	{
		if(pc.hasAirtightSuit()) output(", especially once your [pc.armor] is pulled back to exposed your head.");
		else output(".");
		output(" You hold your breath for a few seconds before simply giving in, breathing deep of the corrupted atmosphere. Stars, does it make your <i>horny</i>. Your blood burns. Your loins enflame. A blizzard could roll in, and you wouldn’t feel the snow for how wantonly aroused you have become.");
	}
	output(" He... can fuck you if he wants. Your mouth, your ass");
	if(!pc.hasVagina()) output(", whatever");
	else output(", your [pc.vaginas]");
	output(". He can have you anywhere, so long as you do something to sate this molten desire.");
	output("\n\n<i>You need it.</i>");
	output("\n\nHalfway hidden behind a tree, you hear that Azra is in a similar state. She pants and moans, lilting voice raises in mixed sounds of protest and pleasure... then apology. She’s apologizing for invading the naleens’ planet even as she strips out of her armor, leaning how whimpering lips against one of his doubled dicks, the glossy curve of her inky maw begging for mercy with tender touches to his purple cock.");
	output("\n\nThe savage naleen groans in pleasure, whispering something as he nods his head.");
	output("\n\nAzra goes right to work with a bright red organ - her tongue, you belatedly realize. It slithers out and wraps around one cock, then the other, revealing another inch of gleaming shaft-slurping muscle with every passing second. It forms a twisted helix around both members, weaving them closer and closer together until thin bands of tongue are grinding against both, slipping and sliding in alternating directions. It is the naleen’s turn to groan in mindless bliss, this time.");
	output("\n\nAzra, through it all, masturbates herself, at first stroking her dick, then diving deeper, hands disappearing below her pendulous balls. Her arms flex with the effort of savaging her pussy. You can only assume she’s at least three digits deep inside herself. Ribbons of pre cascade from the rounded crown of her dick. The tendrils around it, upon contact with the sloppy lubricant, go wild, slapping into the shaft. They must be stinging it; it grows harder and firmer before your eyes, and Azra’s wantonly curling tongue accelerates at the same pace.");
	processTime(25);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHarder);
}
public function loseToNaleenBrosHarder():void
{
	clearOutput();
	showNaleenBros();
	output("A bottle is uncorked under you nose, and you nearly cum from the smell alone. That rapturous, sweetened gas has you shivering with excitement, and what’s happening to Azra isn’t helping any. You’re too addled to care that you didn’t have a choice in the matter, that she didn’t either. All you can see is the sinful exchange of bodily fluids, the way her tongue makes one dick after another bob into her mouth so that she can harvest the creamy drippings from the tips.");
	output("\n\nUntil your sight is blocked by cock. Not just one, but two. Your naleen has grown impatient, his dicks woefully unsucked.");
	if(pc.isBimbo()) output(" Your mouth waters so heavily that drool slips from the corner of your [pc.lips]. They look so fucking good. Why aren’t they inside you already?");
	else if(pc.isBro()) output(" You grunt in instinctive appreciation, mouth watering. Dick wouldn’t usually get you going this easily, but these ones look pretty cute, all things told.");
	else output(" You feel like you shouldn’t be quite so excited at the prospect of getting them in your lips, but then the overwhelming arousal wads that idea up and tosses it in the wastebin.");
	output(" You look up in time for the kitty-snake to put his hand on your head and guide you forward. First one pointed tip meets your [pc.lips], then the other. Each time, you offer nothing but encouragement, opening wide to take them deep, humming in near contentment at the opportunity to wiggle your tongue against the musky jungle rod.");
	output("\n\nThere’s no balls to fondle, but there is something else, something your nose dips into every time you take him to the base: his slit. The naleen’s slit is even muskier than his lengths, laden with different, more bestial pheromones. You flick your [pc.tongue] in the next time you slide down a shaft, and the naleen smashes your head hard against his scaled waistline, giving you a deeper sample. He all but loses control at the slightest probing into his twin-cocks’ home. When you thrust your tongue... or a finger... in, he cries out and falls to the floor, dragging you with him.");
	output("\n\nYou wouldn’t have it any other way now that you’re focused utterly on sucking snake-dick. From atop him, you can bob your head however you want, kiss his concealing slit with your lips, even finger him if you want. And you do. You stuff two digits into his hole, one above and one below, then work your tongue back and forth between them, circling around his quaking cock-flesh. The naleen’s smooth-scaled hips lurch upward, but you ride him with like your [pc.lips] are sewed to his needy loins, either incapable or unwilling to be bucked off.");
	processTime(20);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHardest);
}

public function loseToNaleenBrosHardest():void
{
	clearOutput();
	showNaleenBros();
	output("Azra goes off well before you or either naleen. You can hear it, barely, over the sounds of your frenzied face-fucking. The loud wet slap of volleys of seed impacting tree bark is unmistakable. So is the keening wail of a woman who is cumming so hard she’s liable to get addicted to it.");
	output("\n\nYou look, out of the corner of your eyes.");
	output("\n\nThe siren’s thighs are slick with her girlcum. Her eyes have rolled back, overwhelmed by the feelings her quivering body is experience. Her cock is still shooting too. Creamy spunk messily slops everywhere, falling in small Azra-made lakes on the forest floor. She seems like she could orgasm forever, the way she is carrying on. Somehow, the twirling length of her tongue keeps moving, though it is no longer sliding about in a sensuous cock-massage. It is tweaking and jerking, violently jacking off a naleen who looks like he’s incapable of understanding how he’s feeling so much pleasure.");
	output("\n\nThe cat-snake’s eyes roll back a moment before one of his purplish shafts sprays onto Azra’s shoulder, painting her golden skin and glimmering locks in liquid ivory. Her throat bobs, swallowing the rest while her own turgid shaft leaks its last few droplets.");
	processTime(4);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHardestWithAVengeance);
}

public function loseToNaleenBrosHardestWithAVengeance():void
{
	clearOutput();
	showNaleenBros();
	//Hascock
	if(pc.hasCock())
	{
		output("Fuuuuuck, your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" jumping wildly, flexing and relaxing, trying to squeeze the [pc.cumNoun] out of your [pc.balls] in a final moment of hands-free orgasm. You’re so hard that it feels more like you’ve got ");
		if(pc.totalCocks() == 1) output("an iron bar");
		else output("iron bars");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" down below");
		output(". You hollow your cheeks and suck, flexing your [pc.cocks] at the same time. It’s incredible, being so hard and so full of dick, feeling the pre dribble out of you and into your mouth, like you’re just a tube connecting one dick to another, taking in and putting out [pc.cumVisc] juices.");
		if(pc.hasVagina()) output("\n\n");
	}
	//Vagina
	if(pc.hasVagina())
	{
		if(pc.wettestVaginalWetness() >= 4) output("[pc.GirlCum] is getting everywhere. You feel like a faucet, like someone turned you on and just left you running forever without putting a dick in the right hole to plug you up... plug you up so fucking good. You’re more pussy-juice than [pc.boyGirl] now, more aching quim and everlasting desire than person. You rock your [pc.hips], leaking and fountaining, on the edge of orgasm. The humid air blowing across your lips is enough to make you release tiny squirts. The contractions of your hungry muscles rubbing your lips together to the timing of your sucks... It’s too much.");
		else output("Feminine moisture is getting everywhere. You feel broken, like you don’t remember how to be anything other than being turned on. Like you’d let him fuck you in the pussy right now. Like you’re so wet anyone could fuck. Bareback, condom, whatever, just so long as somebody fucks you. The air itself feels like it fucks you. The smallest humid breeze is a tongue on your [pc.clit]. The spasmodic clenching of your thighs squeezing your netherlips together is like world-class oral. You can hardly stand how good it feels.");
	}
	//Merge any genitals.
	if(pc.hasGenitals()) 
	{
		output("\n\n");
		output("The naleen grabs your arm. You aren’t sure where he got the strength, and he bites you, hard. Needle-like fangs sink into your flesh, pumping his venom into you. Your muscles slacken. Your pulse races. Your [pc.lips] feel like pussy lips all their own, pointlessly guarding the wide-open muscles of your throat. Swallowing him up, you feel your [pc.crotch] quiver in aphrodisiac-induced ecstasy, and then you cum.");
		output("\n\nYou cum at the taste of cock on your tongue. You cum at the feeling of naleen venom coursing into you. You cum at the way ");
		if(pc.isBimbo()) output("his dick slides inside you without a hint of gag reflex");
		else output("his venom obliterates your gag reflexes");
		output(". It’s such a powerful orgasm that for a moment you forget how to suck, but soon enough you recover. You put every ounce of orgasmic energy into pleasing your naleen lover, doing everything you can to share the blissful experience with him.\n\n");
	}
	//No genitals start here.
	output("Feverishly jacking off the naleen with one hand, you continue to fingerfuck him with the other. Your [pc.lips] slide back and forth, your [pc.tongue] plunging deep");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" before looping around him, sliding over every inch of hypersensitive slit");
		output(". It this is how the naleen intended to teach you a lesson, they’ve either failed or taught you that sucking cock is really, really fun.");
	if(pc.isBimbo()) output(" Joke’s on them, you’ve always known that. Dick is the best!");

	output("\n\nHe locks up, back arching, lifting you into the air. His creamy kitty-seed pours into your vacuously sucking throat to be happily devoured, the spare dick spraying the rest across your face.");
	if(pc.isBimbo()) output(" You make sure to get some in your hair too. That’ll be like, way hotter.");
	output(" You don’t stop sucking, not until he stops feeding you cum and pulls himself out from beneath you.");
	if(pc.isSquirter() || (pc.hasCock() && pc.cumQ() >= 1000)) output(" Wow, the ground is really soggy.");
	applyCumSoaked(pc);
	output("\n\nYou close your eyes from exhaustion, just for a minute.");
	processTime(20);
	pc.loadInMouth(enemy);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosEpilogue);
}

public function loseToNaleenBrosEpilogue():void
{
	clearOutput();
	showAzra();
	output("Azra shakes you awake some time later. <i>“Come on, we have to go.”</i>");
	output("\n\nYou stumble up, still covered in naleen-spunk, noting that she’s just as messy.");
	output("\n\n<i>“No way we can pull this now. Let’s head back to the ship and regroup. We can try again later.”</i>");
	if(pc.isBimbo()) output("\n\nAwww, but you just gotta suck a dick! <i>“Fiiine.”</i>");
	else output("\n\n<i>“Yeah,”</i> you agree.");

	//bimbo
	if(pc.isBimbo()) output("\n\nShe doesn’t stop you from licking the excess off her, though her blush is a sight to see.");
	moveTo("SHIP INTERIOR");
	flags["AZRA_EXP_FAILED"] = getPlanetName().toLowerCase();
	flags["AZRA_NALEEN_BLOWN"] = 1;
	azra.azraCombatCleanup();
	CombatManager.genericLoss();
}

//Win vs NaleenBros
public function winVsNaleenBros():void
{
	clearOutput();
	showNaleenBros();
	showName("VICTORY:\nNALEEN BROS");
	output("The last naleen goes down in the dirt at last.");
	if(azra.HP() <= 1) output(" Azra struggles up to her feet, rubbing the back of her neck in pain. <i>“Good job.”</i> She puts a green-colored ointment on a bruise. <i>“I knew this had to be a team effort.”</i>");
	else if(azra.lust() >= azra.lustMax()) output(" With the fighting over, Azra slowly comes to her senses. You aren’t sure how she packs her pant-ripping python back into her armor without some kind of pocket dimension to store it in, but she does. <i>“Sorry about that, Captain,”</i> Azra says, blushing. <i>“I don’t know what would have happened if you weren’t here to protect me.”</i>");
	else
	{
		output(" Azra ");
		if(azra.hasStatusEffect("cock out")) output("tucks away her dick and ");
		output("nods respectfully. <i>“Good thing I had an ace in my back pocket, eh Captain?”</i>");
	}
	output("\n\nYou nod. <i>“");
	if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("I’m going to need a minute.");
	else if(pc.lust() >= 50) output("I’m going to have to let off some stress before we move on...");
	else if(pc.HP()/pc.HPMax() < 0.5) output("Those two packed a punch. Got anything in that pack of yours to get me back on my feet?");
	else output("So what’s next?");
	output("”</i>");

	//Uninjured/Lowlust:
	if(pc.lust() < 50 && pc.HP()/pc.HPMax() >= 0.5) output("\n\nAzra positively beams. <i>“So you’re courageous on top of being good in a fight? I like that.”</i> She she steps over one of the defeated naleen and into the jungle, glancing back over her shoulder to watch you. <i>“We find the Fuck-Lilies. Come on, we’re close.”</i>\n\n");
	//Else
	else
	{
		output("\n\nThe sharky scientist reaches into her bag. <i>“I have just the thing.”</i> She pulls out ");
		if(pc.HP()/pc.HPMax() < 0.5) 
		{
			output("an ointment");
			if(pc.lust() >= 50) output(" and ");
		}
		if(pc.lust() >= 50) output("a stoppered vial");
		output(". <i>“");
		if(pc.HP()/pc.HPMax() < 0.5) 
		{
			output("This ought to patch up your wounds. A rare extract I isolated from a carnivorous plant. Don’t worry, I isolated it from the poisonous contaminants.");
			if(pc.lust() >= 50) output(" Now the vial...");
		}
		else output("This vial...");
		if(pc.lust() >= 50) output(" it has a sample of a rather... pungent pollen. I wouldn’t recommend sniffing it in ordinary circumstances, but it ought to clear your head.");
		output("”</i>");
		output("\n\nYou hesitantly accept the gift");
		if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("s");
		output(". <i>“You sure this is safe?”</i>");
		output("\n\n<i>“Positive,”</i> Azra retorts. <i>“Tested ");
		if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("them");
		else output("it");
		output(" myself.”</i>");
		output("\n\nOn that ringing endorsement, you make use of her ");
		if(pc.HP() / pc.HPMax() < 0.5)
		{
			output("ointment");
			if(pc.lust() >= 50) output(" and ");
		}
		if(pc.lust() >= 50) output("smelling... pollen");
		output(".");
		if(pc.lust() >= 50) output(" That smell... that smell will haunt your dreams. It punches you square in the nose and knocks you off your feet. You nearly sick up a time or two, but at least you aren’t so turned on any more.");
		else output(" While the ointment does seem to mend your wounds, the greasy texture is something you could do without. The scent of half-rotten grass clippings is far from appealing.");
		output("\n\n<i>“Come on,”</i> Azra bids, stepping over one of the defeated naleen. <i>“We’re getting close.”</i> She lifts a frond and looks back over her shoulder. <i>“I doubt I’ll make it without my protector.”</i>\n\n");
		pc.HP(pc.HPMax());
		pc.lust(-55);
		processTime(5);
	}
	processTime(4);
	azra.azraCombatCleanup();
	CombatManager.genericVictory();
	eventQueue.push(neinNeinNeinTailsFight);
}

//9-Tails Protection Fight
public function neinNeinNeinTailsFight():void
{
	clearOutput();
	showBust("AZRA", "ZIL9TAIL");
	showName("9-TAILED ZIL\nENCOUNTER");
	output("Clinging vines and tangles of narrow tree trunks give way at last to a wide clearing filled with strange-looking flowers - and crude huts on the other side. This must be the flower patch you were looking for, but it’s in rough shape. The Fuck Lilies are almost universally brown and wilted. Their stalks are spindly. The soil below is brackish. There’s only one place where they have a healthy pink glow: on the edge of the village.");
	output("\n\nAzra creeps up next to you. <i>“Oh no...”</i> she whispers, aghast. <i>“I was right. They’re dying faster than I thought too.”</i> Her eyes flick toward the village. <i>“Cunt snakes alone couldn’t have done this. Why aren’t the zil feeding them?”</i>");
	output("\n\nThe answer reveals itself a minute later in the form of a swaggering zil male. A bundle of nine voracious cunt-snakes have affixed themselves to his ass. Even now, one of the pussy-packing tentacle tails is curled to reach between his legs where it vigorously milks him of his sugary sap. With that many parasitic seed-drinkers affixed to him, he must be servicing the entire tribe, a role he relishes, judging by the contented look on his face. No wonder the flowers are starving!");
	output("\n\n<i>“I was right! Sort of...”</i> Azra looks like she isn’t sure to be proud of her deductions or saddened by the loss of a native species. <i>“We have to save them, [pc.name]!”</i>");
	output("\n\nYou point out that she can’t save anything with that Zil there.");
	output("\n\n<i>“Then you distract him while I transplant a few samples. Use that charm of yours. Maybe you can keep him from summoning the entire tribe.”</i> Azra implores, <i>“This is for science, Steele!”</i>");
	output("\n\nThat sounds like a terrible plan, but there aren’t many other options. How do you want to play this? You could try to distract him with conversation, attack him, ");
	if(pc.hasCock()) output("offer to feed him your delightful off-world seed, ");
	output("or try to lead him into the jungle on a wild zil chase.");

	processTime(10);
	//[Talk] [Attack] [Feed] [Jungle]
	clearMenu();
	addButton(0,"Talk",nineTailZilIntro,"talk");
	addButton(1,"Attack",nineTailZilIntro,"attack");
	if(pc.hasCock()) addButton(2,"Feed",nineTailZilIntro,"feed");
	else addDisabledButton(2,"Feed","Feed","You need a penis for this.");
	addButton(3,"Jungle",nineTailZilIntro,"jungle");
}

//All choices intro:
public function nineTailZilIntro(choice:String = "talk"):void
{
	clearOutput();
	show9Tail();
	output("You nod to Azra and circle closer to the village, distancing yourself to give her some cover before you emerge. Dessicated flowers crackle under your [pc.feet] as you close in, and the infested zil sultrily spins about. He’s handsome, for a zil, his armor plates fully retracted to expose as much of his svelte form as possible.");
	output("\n\n<i>“Need some rel-hey hey hey! Whoa!”</i> He steps back, tail slipping off his dick to join its sisters in waving behind in him alarm. <i>“You trespass upon our grounds! This is a violation of the Behrt accord!”</i> He starts to raise his hand to his mouth.");

	//Attack
	if(choice == "attack")
	{
		output("\n\n<i>“Oh, you’re too much of a wimp to take on one single off-worlder? Did gluing all of those pussies on your ass turn you into one too?”</i>");
		output("\n\nHe slowly lowers his hand. His face settles into a scowl. <i>“When I’m done with you, you’ll wish I had summoned my village.”</i> A stun-gun slips into his hand from somewhere. <i>“And when your spirit is broken, you can house more of my pets. Yes...”</i>");
		output("\n\nWhile the angrily buzzing alien closes in on you, Azra circles to the other side of the clearing to approach a particularly vibrant flower specimen. You’d better win, for both sakes.");
		//Fite me bro
		processTime(3);
		zil9tailFightGo();
	}
	//Jungle
	else if(choice == "jungle")
	{
		output("\n\n<i>“Fuck your accords. Now that I’ve found your village, I’m going to bring an army back with me to torch it!”</i> You turn tail and sprint for the jungle edge.");
		output("\n\n<i>“No!”</i> screams the zil, moments before he takes the bait. His chitinous feet thump heavily through the flower patch as he chases you into the woods.");
		//Low reflexes
		if(pc.reflexes() + rand(20) + 1 < 10+8)
		{
			output("\n\nHe’s fast. Faster than you could’ve imagined with all the extra weight on his ass. He doesn’t quite fly, but his fluttering wings give him the extra edge to run you down before you get very far. You make one last attempt to zig and zag between two moss-covered trees, but he’s more maneuverable by far and shoulder checks you before you can round the second one.");
			output("\n\nYou tumble through enough dead leaves and dirt to make you look like a long-dead tree when you stagger up to your [pc.feet]. The snake-infested zil is brandishing a stun gun and blocking your escape, but at least you’re far enough from the village that he can’t call for help.");
			output("\n\nYou’ll have to fight him to buy Azra time.");
			processTime(3);
			zil9tailFightGo();
		}
		//High reflex
		else
		{
			output("\n\nHe’s fast. In the open, he closes most of the distance, aided by the fluttering of his wings. You make it into the forest before his chitinous claws can latch onto you. With the trees in abundance, you use their bulk to deny him his advantage in raw speed by rapidly changing direction, forcing him spring between them to keep up. Still, he remains hot on your heels, the incessant buzzing of his wings a constant reminder that the angry alien could catch you at any moment.");
			output("\n\nFrom that terror comes adrenalin, and with adrenalin comes speed. You double your evasive tactics, springing from tree to tree. When that doesn’t work, you slide under low vines and duck into denser foliage where his wings will count for nothing. There, you finally have the advantage. His footfalls sound farther and farther away as you plunge deeper and deeper into the dense jungle.");
			output("\n\nA few minutes later, you’re relatively sure you’ve lost him. You double back around, using your Codex to keep from getting lost. You jump at every buzzing insect that flies by, but the infested zil is well and truly behind you.");
			output("\n\nYou emerge from the woods to find Azra in the middle of packing away a brightly colored flower.");
			output("\n\n<i>“[pc.name]! I was so worried he was going to catch you,”</i> Azra says, scaled tail wagging behind her. <i>“Let’s get out of here before he comes back.”</i>");
			output("\n\nYou give her an affirmative nod and leave for Mhen’ga. On your way back, you wonder if the zil will figure out that it was all a ruse. Probably not. He didn’t seem like the type to miss one flower.");
			processTime(30);
			clearMenu();
			addButton(0,"Next",azraMhengaMissionEpilgue);
		}
	}
	//Talk
	else if(choice == "talk")
	{
		output("\n\n<i>“Wait!”</i> You hold your arms out apologetically.");
		//No new PG. Intelligence fork.
		if(pc.intelligence() + rand(20) + 1 < 10+3)
		{
			output(" <i>“Uh....”</i> You rack your brain for something to say. <i>“Well... uh... Huh. I really should have thought about this in advance.");
			if(pc.isBimbo()) output(" You’re sexy, though!");
			output("”</i>");
			output("\n\nInstead of calling for help, the zil slaps his palm into his face, chitin clacking noisily. Behind him, the tails hungrily slide against one another, and when his fingers fall away, he’s smiling devilishly. <i>“You’re too stupid to be a threat to us.”</i> He steps closer. <i>“And if I take you down myself, I can keep you as my toy. You could be a good host, tend to my brothers while I rest, so many of my children nesting on you. Yes...”</i> He pulls out a stun gun. Where did he get that?");
			output("\n\nAzra made good use of your distraction to approach the flower patch from the other side, and she gestures for you to keep stalling as she nods next to a particularly vibrant specimen.");
			output("\n\nYou’ll have to fight!");
			processTime(3);
			zil9tailFightGo();
		}
		//Success!
		else
		{
			output(" <i>“I had to get a closer look at you. I’ve never seen anyone quite like you before.”</i> You gesture at him, waving your hand at his tails. <i>“What you have done with those snakes... it’s incredible. How did you get so many? I thought they limited themselves to one to a host?”</i>");
			output("\n\nThe zil leans back, eyes wide. <i>“You... approve?”</i> His antennae twitch, and his expression twists into a sly smile. <i>“I suppose even a skyling can see the beauty in this.”</i> One slavering cunt-snake slurps its way back down his dick while he talks, lending his voice a small hitch of pleasure. <i>“I can feel more pleasure than any creature in the jungles. Only the predator pitchers are my equals, barely. And I can give my tribe relief. My entire tribe, with just me.”</i>");
			output("\n\nNow that he’s talking to you, the words spill out of the infested zil. He goes on to describe just how he’s gotten so many snakes attached to himself. Apparently the secret is to hand-raise the offspring, then entice themselves to attach alongside their mother. It can be a trying process, but one that results in the <i>most amazing</i> orgasms ever.");
			output("\n\nYou feign interest. It isn’t hard; his bragging is packed full of information on the parasites that wouldn’t show up in any extranet article.");
			output("\n\nMeanwhile, Azra has finished extracting the plant. She slips the containment vessel into her pack, flashes you a thumbs up, then fades into the foliage. For a big girl, she’s surprisingly good at hiding.");
			output("\n\n<i>“Perhaps you should come to the village, starling. We could have-”</i>");
			output("\n\n<i>“No thanks,”</i> you interject, giving him a friendly wave. <i>“I just remembered I left my ship idling. Have fun!”</i>");
			output("\n\n<i>“You can’t... just... wait!”</i> He calls after you, though he makes no move to pursue you.");
			processTime(20);
			clearMenu();
			addButton(0,"Next",azraMhengaMissionEpilgue);
		}
	}
	//Feed - reqs penor
	else if(choice == "feed")
	{
		output("\n\n<i>“But I have so much to feed you.”</i>");
		if(!pc.isCrotchExposed()) output(" You thrust your hips at him.");
		else output(" You pull your [pc.crotchCovers] open.");
		output(" <i>“The way I see it, you could use all the dick you can get.”</i>");
		
		//1 penor fail:
		if(pc.cockTotal() == 1)
		{
			output("\n\n<i>“You think to tempt me with a single offering when I have the bounty of my village at my beck and call?”</i> He steps closer, tails waving menacingly. <i>“You think that your sexual submission would lead to me standing idly by? You think that I can’t come up with a better plan for you?”</i> All nine tails spread out in a fan, like a peacock’s. <i>“You could be a good host. Our village is growing. Once the snakes have you, you will see your place.”</i> He pulls out a stun gun. Where did he get that?");
			output("\n\nAzra made good use of your distraction to approach the flower patch from the other side, and she gestures for you to keep stalling as she kneels next to a particularly vibrant specimen.");
			output("\n\nYou’ll have to fight!");
			processTime(3);
			zil9tailFightGo();
		}
		//2+ dix
		else
		{
			flags["FED_9TAIL"] = 1;
			output("\n\n<i>“Oh.”</i> He tilts his head, eyes flicking back and forth between your [pc.cocks]. <i>“That is impressive.”</i> The parasitic tails strain toward you. <i>“Very impressive.”</i> His hips lurch, more beholden to the impulses of his sinuous passengers this his own nervous system. You spot a trickle of pre-cum oozing down the length of his dick. <i>“Yes, yes... okay. I can overlook your transgressions... for a price.”</i> The chitin-armored boy-toy licks his lips as if he’s the one thirsting for jizz, not his tails. <i>“Kneel.”</i>");
			output("\n\nAzra makes good use of your distraction to circle around to approach the flower patch from the other side, and though she quirks an eyebrow at your tactic, she gestures for you to keep him busy as she kneels next to a particularly vibrant specimen.");
			output("\n\nYou drop to your knees as you are bid. There’s no hint of deception in the zil’s expression, only lust. Stroking your [pc.cocks] slowly, you tease the poor guy, caressing one hard dick-tip, then another");
			if(pc.cockTotal() > 2) output(", and so on");
			output(", feeding him one enticing visual after another.");
			output("\n\nInsatiable, alien desires grab the infested zil by the balls and drag him right up to you, leaking and swaying, nine tails thrashing against one another for the first shot at your [pc.cock]. He runs his hands from his chest down to his crotch, stopping to give his bunched foreskin a playful tug. Trickles of honey leak out of it.");
			output("\n\n");
			if(pc.isBimbo()) output("You lick your [pc.lips]. His sweet-smelling dick is right in front of your nose. How could you <i>not</i> suck it? He gasps in that delightful way that boys do when you seal your mouth around his manhood, but he doesn’t protest. They never do, especially not when you’re slipping your tongue out to lovingly cradle their balls. Mmm... balls.");
			else output("His sweet-smelling dick is right in front of your face, practically swimming in weaponized pheromones. If you thought you were hard before, you were wrong. Your [pc.cocks] are iron bars, heaving powerfully with each breath of the zil’s powerful aroma. Whatever your thoughts on dicks, you find yourself quite liking this one. You rub your cheek against it, sniffing deep into his crotch. The super-concentrated pheromones leave you dizzy and whimpering.");
			output("\n\nIt comes as a small surprise when a tight tunnel of warm, wet tailcunt envelops your [pc.cock]. Not enough to stop you");
			if(pc.isBimbo()) output(" from bobbing back and forth on his yummy honey-cock, of course. You just moan into the dick, letting your ecstatic vibrations help him along on his journey to a thick, creamy orgasm.");
			else output(" from nuzzling into his crotch, though you do let out a brazen moan.");
			output(" You tip your head back as a second coils around your [pc.cock " + 1 + "].");
			if(pc.cockTotal() > 2) output(" A third slithers over your [pc.cock " + 2 + "].");
			if(pc.cockTotal() > 4) output(" You lose count not soon after, aware that succulent folds are sliding over your [pc.cocks] but unable to identify any particular sensation as the arrival out of the all-consuming pleasure.");
			output(" They pound back and forth on your manhoods with zero coordination. Each of the snakes has its own rhythm, listening to nothing but its individual desire to swallow your jizz. Inside, their flesh undulates in incredible waves, rolling from the bases of your tail-bound phalli to their throbbing tips, milking you as only a creature that evolved to harvest seed possibly could.");
			output("\n\nYou try to hold out as long as possible, but there’s no chance. Not with your nose full of the zil’s scintillatingly erotic scent and dicks pumping your [pc.cocks] with near-mechanical efficiency. Dribbles of girlish goo");
			if(pc.balls > 0) output(" roll down your [pc.sack]");
			else output(" trickle down your thighs");
			output(" from the frenzied snake-sucking. Your [pc.cocks] do what they were meant to do: throb and ache. Cumming is inevitable. They flex, drooling pre, and the urge to dump a huge load of [pc.cumNoun] into the slithering succubi manifests in one penultimate spasm.");
			//Less than ‘uge
			if(pc.cumQ() < 2000) 
			{
				output("\n\nMuscular contractions carry your [pc.cumNoun] along length of the snakes. You can make out the bulges where the tubular parasites have isolated a wad of your load to transport deeper into themselves, devouring your genetic material like a tasty snack. The portions embedded on you force themselves down harder, splaying their entrances against your crotch so that every single inch of spurting dick can be efficiently milked. Not a single drop of your release is wasted, not even as the snakes withdraw.");
				output("\n\nYour spent members glisten with a coating of the snakes’ juices in the open air.");
			}
			//Big jizzm
			else
			{
				output("\n\nThe snakes are woefully unprepared for your first eruption of [pc.cum]. Their bodies distend cartoonishly, deformed into spunk-balloons midway down their lengths. That doesn’t stop them from siphoning off what they can. Smaller bulges of your [pc.cumVisc] relief travel along their bodies, but not fast enough. No matter how they clench around your bases, they can’t hold back the [pc.cumColor] tide, not after you fire off spurts two and three, each voluminous enough to turn a traditional condom into a stretched-out balloon. Your hyper-virile [pc.cumNoun] backwashes down your [pc.legs]. It’s a relief, finally spurting out what feels like gallons, reveling in the gurgling sounds of your incredible discharges. Never mind that you’re soaking yourself in spilled seed. <i>It feels good.</i>");
				output("\n\nWhen the snakes withdraw, splashes of excess [pc.cumNoun] drop out of the gaped pussy-snakes. They spasm weakly, then drool some more, unable to capture a single sperm, let along your voluminous deposits.");
			}
			//Merge cummyshotsies.
			//Bimbobeej
			if(pc.isBimbo())
			{
				output("\n\nThrough it all, you never stop sucking. Why would you, when the taste of dick on your tongue makes your own climaxes that much more <i>erotic</i>. You don’t even need the snakes. You could get off on polishing his taste and smell alone. His scent fills your head. The throbbing of his member upon your tongue is mirrored in your own tumescent flesh. When he spurts into the back of your throat, the flavor sets of a second orgasm, smaller than the first but still powerful enough to make your exposed [pc.cocks] erupt with a small, wasted ejaculated. You catch some in your hand to mix with the zil’s honey-spunk. Yum!");
			}
			//Ech
			else 
			{
				output("\n\nYou’re too spent to care when the infested zil has an orgasm of his own, painting your cheek in amber honey. You blink your eyes closed before his neck rope splashes across your nose and forehead. He finishes himself off by dumping a thick wad of the stuff ");
				if(pc.hasHair()) output("into your [pc.hair]");
				else output("on your head");
				output(", a satisfied smile on his face. He pumps his foreskin along his length as his orgasm winds down. Some of the seed collects inside, only to be devoured moments later when a snake throws itself onto his leaking dong.");
			}
			//Merge
			processTime(35);
			pc.orgasm();
			if(pc.isBimbo()) 
			{
				pc.orgasm();
				pc.loadInMouth(zil9tails);
			}
			clearMenu();
			addButton(0,"Next",nineTailBJEpilogue);
		}
	}
}

public function zil9tailFightGo():void
{
	flags["FOUGHT_9TAIL"] = 1;
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Zil9Tail);
	CombatManager.victoryScene(spankDatZilBut);
	CombatManager.lossScene(loseToCunnerSnakers);
	CombatManager.displayLocation("9-TAILED ZIL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function show9Tail():void
{
	showBust("ZIL9TAIL");
	showName("9-TAILED\nZIL");
}

public function nineTailBJEpilogue():void
{
	clearOutput();
	showBust("AZRA", "ZIL9TAIL");
	showName("\nSUCCESS!");
	output("<i>“Not bad,”</i> the infested zil pants as he attempts to master himself. <i>“Perhaps you could be of use. My pets could use a plentiful food source for their children... and you fit the bill perf-”</i>");
	output("\n\nA branch breaks across the back of his head. He drops to the ground like a bag of wet noodles, assuming nine of the noodles were still wriggling afterward.");
	output("\n\n<i>“Come on! We’ve gotta go!”</i> Azra pulls you to your feet, then steps back after a quick glance to your soiled loins. She radiates discomfort for a long moment, then turns away, loping back toward Esbeth on long, loping strides.");
	output("\n\nYou take off after her, leaving the unconscious zil alone with his cummy tail snakes. One is pumping his dick, even now.");
	//Escape! epilogue
	processTime(4);
	clearMenu();
	addButton(0,"Next",azraMhengaMissionEpilgue);
}

//Lose to Snaek Bad End
public function loseToCunnerSnakers():void
{
	clearOutput();
	show9Tail();
	output("You collapse");
	if(pc.lust() >= pc.lustMax()) output(" in a heap of writhing, unsatisfied need");
	else output(" under the weight of your injuries");
	output(".");
	output("\n\nThe gloating zil looms over you. <i>“See what your arrogance has brought?”</i> He lifts his foot, then a flash of pain into nothingness.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",nineTailZilBadEnd);
}

public function nineTailZilBadEnd():void
{
	clearOutput();
	show9Tail();
	output("Overwhelming sweetness greets your return to wakefulness - that and the remnants of a nasty headache. More pressingly, you are aroused. Achingly, monstrously aroused, though you lack any understanding as to <i>why</i>. Gasping on your way to full wakefulness, you suck in a lungful so impregnated with rampant honey musk that it makes you cough.");
	if(pc.cockTotal() > 0)
	{
		output(" Your [pc.cocks] trembles");
		if(pc.cockTotal() == 1) output("s");
		output(" in response.");
	}
	else if(pc.hasVagina())
	{
		output(" A ");
		if(pc.wettestVaginalWetness() < 3) output("trickle");
		else if(pc.wettestVaginalWetness() < 4) output("stream");
		else output("gush");
		output(" of girlish excitement leaks out from the scent alone.");
	}
	output(" You moan and reach for your loins");
	if(!pc.hasGenitals()) output(", finding them to be quite bare");
	else output(", discovering your body to be completely bare");
	output(".");
	output("\n\nThe room itself is dark, but you are far from alone. The soft slap of fists pumping foreskin-clad flesh can be heard from all sides, accompanied by muted moans and half-whimpered groans of delight. When you shift position, your hands fall in pools of half-cooled honeyspunk, fragrant and viscous. You swoon, eyes slowly adjusting in time to see a yellow-skinned prick thrusting your way, drooling amber from the copious dickskin.");
	//Bimbo:
	if(pc.isBimbo()) 
	{
		output("\n\nYay! Dick! You should probably be worried about Azra, but you’re just <i>too horny</i> to care, and that cock looks too fucking yummy not to suck. You roll your tongue out like a red carpet and squeak with delight when the anonymous male obliges your dickthirst by pushing his glossy yellow tool inside. He tastes <i>divine</i>: sweet and musky in all the right ways. He’s hard and excited. When you seal your lips around him, his heart beats faster than an out-of-control train, throbbing its passionate tempo through the bulging of his veins upon your tongue. You find out why when you bob your head back and forth on him: he cums.");
		output("\n\nSyrupy wasp-goo pours into your throat, so you take him deep, grabbing him with your slimy hands so that you can thrust his dick directly into your throat. While your esophagus hugs his spurting member like a long lost lover, your eyes roll back in what is sure to be the first of many orgasms. Nothing gets you off quite so easily as being well and truly used, smothered in musky zil-crotch, your cheeks baptized in his pheromones. And there’s so many others. You can hear them, beating off to the sight of you so eagerly debasing yourself.");
		output("\n\nBetter still, you never stop feeling immensely horny, never stop experiencing that desperate urge to consume even more cock. The overwhelmingly potent zilmusk in this room gets stronger with every passing second, and your honey-drizzled maw sags open, begging for the next dick.");
	}
	//Nonbimbo
	else
	{
		output("\n\nYou want to be offended, to turn away or find some way to show your disgust, but you’re too turned on for any such restraint. The soup of pheromones bathing has you so aroused that the oozing prick looks positively appetizing. Sucking it off actually seems... fun... to your ardor-addled mind. You want to lick it, to see if it tastes as good as it looks. You want to suck it, to see if that will cool the raging inferno inside you. Part of you wants to press your nose to his crotch and see if inhaling even more of his cloying pheromones will help you cum.");
		output("\n\nIt comes as no small surprise when the mystery dick slides right through your [pc.lips], nor when you find yourself humming in pleasure at the taste of it - all sweet with a slight undercurrent of tangy salt. What does come as a surprise is the way it throbs within its sperm-soaked sleeve of clinging foreskin, the way its owner groans when you tip forward to fall face-first into his crotch. You can’t help it. You need <i>more</i>. You need to slurp and suck, and suddenly, he’s cumming. Rope after rope of sugary ambrosia is spraying into the back of your throat, forcing you to gulp it down or drown in alien spunk.");
		//Any genitals
		if(pc.hasGenitals())
		{
			output("\n\nFamiliar wetness splashes on your [pc.legs] in the aftermath of the first of what is sure to be many orgasms.");
			if(pc.isSquirter() && pc.hasVagina()) output(" You came so hard you squirted, and still you keep sucking.");
			output(" Any relief it provides is short lived. In your next breath, you slide right back into the grip of desperate lust. Your eyes cross from the overwhelming potency of zilmusk, and your cum-filled mouth sags open, allowing the satisfied male to exit.");
		}
	}
	//Merge bimbo/non forks
	output("\n\nTwo more cocks appear in the periphery of your vision as your eyes adjust to the darkness. You grab them in each hand, double-fisting palmfuls of lusty xeno-dick. They’re already slick with leaking pre or the leftovers of previous orgasms. You’re in no condition to judge, not even when you slip your thumbs inside to smear their juicy leftovers over the trembling crowns. Soft gasps reach your ears just as you’re able to make out their faces. Both are shaking from pleasure, a sight that has you moaning right back at them.");
	output("\n\nFortunately another penis presents itself to you before you’re forced to choose between the two sides. You plunge onto it, any subtlety forgotten in your eagerness to please. You don’t even look up to see what its owner looks like. You just start sucking cock, gripping it with your [pc.lips], sliding your tongue out to caress the cute little balls just below until they pull tight inside their spit-slicked sack.");
	output("\n\n<i>“I knew you belonged on your knees when we met,”</i> a familiar voice says.");
	output("\n\nYou look up, still sucking, to discover that you’re blowing the nine-tailed zil. You don’t stop. Especially not when his pre-cum is so sweet. Behind him, the parasitic pussies thrust outward, each securely ensconcing a zil’s rigid member its silky folds. Still, you keep sucking; your hands keep stroking. <i>These ones are yours.</i> He can’t have them.");
	//Cunt tail
	if(pc.hasCuntTail()) 
	{
		output("\n\n<i>“And you’ve already done me the favor of acquiring a snake of your own. How lovely.”</i>");
		output("\n\nOne of the eager zil takes hold of your tail-mounted vagina and thrusts inside. You nearly bite down on the cock in your mouth in shock but catch yourself at the last moment. <i>Stars, it feels good.</i> Your tongue and hands go wild in response, but it’s your tailpussy that truly occupies your mind. As horny as you are, every thrust inside is an orgasm. Every inch of the zil’s prick feels like it presses in on your mind, leaving an imprint of its veiny features for you to remember for the rest of your days.");
	}
	//No cunt tail
	else
	{
		output("\n\n<i>“And you’re going to look so nice with your new tails.”</i>");
		output("\n\nNew tails? Something sharp bites into you at the end of your spin, and for a moment you nearly bite down on the cock in your mouth. Arousal wins out over pain, however, twisting the unpleasant sensation into something else... something that makes you ever more eager to take in a load, wherever you can. Any place will do, but... behind seems like the way you want it. In your butt or... a tail rears up next to you... your tail. <b>You’ve got a tailcunt now!</b>");
		output("\n\nIt’s ripped out of your vision by an eager zil, something that only bothers you up until the point that his cock slips inside with a lurid squelching sound. <i>Stars, it feels good.</i> Your tongue and hands go wild in response, but it’s your tailpussy that truly occupies your mind. It’s like every thrust inside is an orgasm. Every inch of the zil’s prick feels like it presses in on your mind, leaving an imprint of its veiny features for you to remember for the rest of your days.");
	}
	//Merge
	output("\n\nThe zil on your left cums, and you cum right along with him. His sweet spooge splatters across your naked body. You smear it across your [pc.skinFurScales] in ecstasy. Looking at yourself in the dim light, you look like a glittering golden god" + pc.mf("","dess") + ", an image that solidifies itself when more cum spills onto you from the right. Excess honeyspunk slides between your knuckles, the better to rub onto your other side.");
	output("\n\n<i>“Good pet,”</i> the nameless, nine-tailed zil coos as he too goes off, pulling himself out of your mouth so that he can be the one to paint your face, anointing you with waves of amber ambrosia. He does you the favor of smearing his musky tool over your features, spreading his seed into every crease and pore.");
	if(pc.hasHair()) output(" Your [pc.hair] slicks back under its weight.");
	output(" A mask of golden cum slowly hardens on your face as he withdraws, and it makes the pounding you’re taking from behind so much hotter.");
	output("\n\nYou pant like a dog in heat.");
	if(!pc.inHeat()) output(" For that matter you <b>are in heat</b>");
	else output(" For that matter, you sink deeper into your heat. You aren’t sure if you’ll ever find your way out, no matter how much dick you take.");
	output(" You want to get fucked, and suck, more than anything. Dicks in your mouth, cum in your hair. You want to get up in the morning smelling like half the tribe’s crotches and screw until you smell like the other half’s.");
	output("\n\nCum shoots into your tail, and your eyes cross. You collapse, any control over your motions abandoned in the wake of your parasite’s pleasure. It’s getting pregnant with it; you’re sure of it. Especially now that another zil is taking a turn. They seem endless, parading their hard penises in an endless circle around you. Some of them fuck your friend’s cunt-snakes, but most seem more interested in using you. Waves of syrupy jism cascade over your body. Fuck-hungry boys line up for turns at your creampied tailcunt, yet the insatiable parasite never seems to tire of wringing out more.");
	output("\n\nYou can barely breathe without whimpering and cumming, let alone think. You act on instinct, and your tail’s instincts seem so much strong on your own... Time passes in a sea of climaxes and waves of honey, your body used a receptacle for an entire populace’s lust...");
	processTime(230);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",zil9TailFullGameOver);
}
public function zil9TailFullGameOver():void
{
	clearOutput();
	show9Tail();
	output("When you regain consciousness, you’re somewhere else. Your belly is bloated from all the honey you swallowed, and your tail is swollen and leaking, so fattened that you can only imagine how many eggs are stuffed inside it. With that thought comes a sense of pride, and idle lust.");
	output("\n\nIt’s fortunate that a zil enters your hut, his crotch plates retracting to fill the confined space with your new favorite scent. You’ll find your way out of here after one more fuck... just one more.");
	processTime(200);
	clearMenu();
	addButton(0,"Next",zil9TailFullGameOver2);
}
public function zil9TailFullGameOver2():void
{
	clearOutput();
	show9Tail();
	output("Months crawl by, and more cunt-snakes are affixed to you, usually after you’ve been fucked into unconsciousness. That’s fine though, the new parasites can help you satisfy your growing desires. Sometimes they even let you fuck that suula girl you got caught with so that you can sample a different flavor of jizz. She’s been pretty consistently pregnant ever since they figured out that the kids come out more zil than suula.");
	output("\n\nLife as a fuck-toy is sort of degrading, but you’re taking care of. You don’t need to worry about responsibility or planning. You can content yourself with effortless climaxes and an ever-increasing addiction to honey-cum.");
	//[Bad End]
	kGAMECLASS.badEnd("GAME OVER.");
}

//Zilscunnies Defeated!
public function spankDatZilBut():void
{
	clearOutput();
	showAzra();
	output("As the infested zil ");
	if(enemy.lust() >= enemy.lustMax()) output("sinks to the ground, overwhelmed by the passionate impulses you’ve stirred within him");
	else output("drops to the ground, too well and truly beaten to remain upright");
	output(", Azra trots up, satchel of samples in hand. <i>“Let’s get out of here before any more show up.”</i>");
	output("\n\nShe’s right");
	if(pc.lust() >= 60) output(", much as it pains you to admit it. You’ll have to put your needs on hold until after you get back to safety");
	output(". The entire village could descend upon you in an angry swarm at any time, and that fight was far from silent.");
	output("\n\n<i>“All right, let’s go.”</i>");
	processTime(10);
	azra.azraCombatCleanup();
	output("\n\n");
	CombatManager.genericVictory();
	eventQueue.push(azraMhengaMissionEpilgue);
}

public function azraMhengaMissionEpilgue():void
{
	clearOutput();
	showAzra();
	output("Together, you and Azra beat a hasty retreat through the jungle. Most of the natives seem hesitant to tangle with a pair, and the few that do rise to the challenge are left in the dust. As for the tribe, ");
	if(flags["FOUGHT_9TAIL"] == undefined) output("you see neither chitin nor hair of the aggressive zil. Either they didn’t care to pursue you or haven’t noticed.");
	else output("you doubt anyone will know to look for you for a few hours yet.");

	output("\n\nWhen the clearing surrounding Esbeth comes into view, you both gasp sighs of relief, silently thankful to be under the watchful gaze of ");
	if(flags["MET_PENNY"] != undefined) output("Penny’s auto turrets");
	else output("Esbeth’s automated turrets. Whoever put those up is a saint");
	output(".");
	output("\n\n<i>“That... let’s not do... that again,”</i> Azra pants with exhaustion.");
	output("\n\nYou nod. <i>“The expedition or fighting next to a whole city of potentially angry aliens?”</i>");
	output("\n\nAzra straightens at your question. <i>“The hostile village thing. I’d never leave an entire species all alone, defenseless against extinction. Come on, let’s get back to the ship. I want to give these things a more thorough examination.”</i>");
	moveTo("EAST ESBETH");
	clearMenu();
	addButton(0,"Next",azraMhengaMissionEpilgue2);
}

public function azraMhengaMissionEpilgue2():void
{
	clearOutput();
	showAzra();
	moveTo("SHIP INTERIOR");
	output("Azra unpacks efficiently. Her bag of supplies is dropped into an empty corner. The sample pouch is placed into a vacant spot on her desk perfectly shaped to accept it. You get the impression that she’s spent more than a little time organizing her room to make the most of every meter. She sighs contently once her things are stored and turns to face you, smiling beatifically. <i>“");
	if(flags["FED_9TAIL"] == undefined) output("You were magnificent. I never could’ve done this without you.");
	else output("It means a lot to me that you were willing to do... that for my research. I couldn’t have.”</i> Her eyes flit to your well-used crotch as her cheeks color. <i>“I’d be too embarrassed.");
	output("”</i>");
	output("\n\nSavoring the compliment, you reply, <i>“");
	if(pc.isBimbo()) output("Ooooh, you’re just too cute! Like, isn’t exploring sexy jungles what I’m supposed to be doing anyway? Did you see the dicks on those naleen? Wow. If we get to meet guys like that on every trip, I am sold, sister!");
	else if(pc.isBro()) output("No problem. I get to try those flowers out, right?");
	else if(pc.isNice()) output("It was my pleasure. Somebody has to watch out for the little guys.”</i> You look back at the nine-foot tall giant of a scientist. <i>“And the not-so-little girls.");
	else if(pc.isMischievous()) output("I’m only a part-time rusher. The rest of the time I’m a certified badass, adventure hero, and " + pc.mf("handsome","talented") + " escort to beautiful science-maidens. It’s basically my job to help you out.");
	else output("You’d be surprised what you can do, but don’t sweat it. Having fuckable flowers onboard is sure to be a treat.");
	output("”</i>");
	output("\n\nAzra sweeps you up into a hug. <i>“Of course!”</i> Her golden cheeks flush brilliant orange as she embraces you. <i>“Thank you. Thank you so much.”</i> She pauses, searching your face with her wide, expressive eyes, then makes up her mind about something. That something turns out to be kissing you. The affectionate suula leans in, her plump black lips pressing against yours, gently at first, then with increasing forcefulness. She’s warm and faintly sweet-tasting. Do you resist her advances or welcome them? You aren’t sure how she’ll handle being pushed away.");
	processTime(8);
	pc.lust(3);
	clearMenu();
	//[Resist] [Welcome]
	addButton(0,"Resist",resistAzrasAdvancesYouMonster);
	addButton(1,"Welcome",welcomeToAzraSmoochesBuddy);
}

//Resist:
public function resistAzrasAdvancesYouMonster():void
{
	clearOutput();
	showAzra();
	output("You break away before things can get any more heated. <i>“Whoah, whoah! I didn’t intend... I didn’t want this.”</i>");
	output("\n\nAzra’s arms go limp, dropping you");
	if(pc.tallness < 78) output(" to the floor");
	output(". <i>“Of course. How foolish of me.”</i> She looks away. <i>“It was nothing anyway. I was just a little too excited over our success. Give me some time to make sure the samples are in good shape for transport, and you’re welcome to inspect them yourself.”</i>");
	output("\n\nYou get the sense she’s done talking to you for the time being. <b>Your relationship with Azra is strictly professional.</b>");
	processTime(3);
	flags["AZRA_MHENGAED"] = -1;
	if(flags["AZRA_EXP_FAILED"] == "mhen'ga") flags["AZRA_EXP_FAILED"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	pc.createStatusEffect("Azra Plant CD");
	pc.setStatusMinutes("Azra Plant CD",60);
}

//Welcome
public function welcomeToAzraSmoochesBuddy():void
{
	clearOutput();
	showAzra();
	output("You push back into her, extending your [pc.tongue] to better taste her. Azra’s lips are so incredibly soft, like luscious pillows, and they taste so very pleasant that you find yourself thrusting deep into her mouth. She responds in kind, and soon the two of you are passionately french-kissing, entwining your tongues as you noisily make out. The more mature woman knows what she’s doing. Her muscular organ seems to know how to respond to your own to make the kiss better... hotter. You rake your hands through her vibrant hair, and she hugs you tighter.");
	output("\n\nAzra breaks to gasp for breath first, and when she does, her eyes suddenly bolt wide open. She abruptly lets you go and staggers back, absolutely crimson in shame. <i>“I’m sorry, I didn’t mean to...”</i>");
	output("\n\nYou shut her up with another kiss, pushing her up against the wall in your eagerness. Azra moans into your mouth as you pin her wrists at her side so that you can do more of what you know you both want, and the kiss continues once more. For a respectable woman, Azra is perfectly wanton. The suula’s wings wrap around your back to hold you in place. They’re soft, warm, and powerful enough to keep you from escaping without a struggle. Not that you would. The only struggling you’re doing is to try and make her moan again, but her armor keeps you from teasing any other part of her body.");
	output("\n\n<i>“C-c-captain!”</i> Azra whimpers, twisting her head to the side while you continue to pepper her with more kisses. <i>“We.. I.. please. A moment.”</i>");
	output("\n\nYou kiss her once more, with enthusiasm");
	if(pc.hasCock() && pc.isCrotchExposed()) 
	{
		output(", grinding your exposed member");
		if(pc.cockTotal() > 1) output("s");
		output(" against her armor");
	}
	else if(pc.hasVagina()) output(", grinding your well-moistened loins against her armor");
	output(", then step back, face flushed red enough to match her own.");
	output("\n\n<i>“Wow.”</i> Azra smoothes her tousled hair. <i>“I liked that. I liked that a lot, but... ummm...”</i> She giggles. <i>“Wow. You must have a lot of practice at that.”</i> The suula coughs and tries to master her surging hormones long enough to properly express her feelings. <i>“But we can’t just start fucking like animals in here");
	if(pc.hasFur()) output(", even if you’ve got enough fur to be counted as a part of the animal kingdom");
	output(". For one, I’m not that kind of girl. Secondly, these samples need proper care and nutrition to keep them from dying. I won’t risk extinction for a fling, no matter how pleasant.”</i>");
	output("\n\nThat sounds perfectly reasonable no matter how your base impulses disagree.");
	output("\n\n<i>“Finally, neither of us will accomplish anything if our faces are glued together for the entire rush, so I propose a more measured solution,”</i> Azra calms, back on familiar ground. Sadly, the cute blush she was wearing for so long has faded like a passing sunset. <i>“We continue to work together for the duration of the rush. Celebratory kisses are fine, but idle salaciousness is straight out.”</i>");
	output("\n\nYou can’t hide your frown at that. You’d like to do more than kiss her someday.");
	output("\n\nAzra gives you a peck on the nose. <i>“And as we accomplish more, maybe we can... afford to spend more time celebrating. In other ways.”</i> She clears her throat. <i>“But for now, just kissing, I think.”</i>");
	output("\n\nYou ");
	if(pc.tallness < 84) output("jump up to ");
	output("grab her by the neck and forcefully kiss her once more, though only for a few seconds this time.");
	output("\n\nBlinking in confusion, Azra’s flush returns. <i>“What was that for?”</i>");
	output("\n\n<i>“Just celebrating an agreement with a very talented suula.”</i>");
	output("\n\nThe grinning scientist’s tail slams into a wall hard enough to bang it like a drum, but she barely reacts to that. She’s too busy grinning like a teenager driving her first hover-car. <i>“Mmmhmm... I should really get these plants taken care of. Once I have them settled in, feel free to inspect them.”</i>");
	output("\n\nYou wave and step out, wondering what other excuses you can find to kiss the motherly suula.");
	processTime(23);
	clearMenu();
	flags["AZRA_MHENGAED"] = 1;
	if(flags["AZRA_EXP_FAILED"] == "mhen'ga") flags["AZRA_EXP_FAILED"] = undefined;
	addButton(0,"Next",mainGameMenu);
	pc.createStatusEffect("Azra Plant CD");
	pc.setStatusMinutes("Azra Plant CD",60);
}

//Azra’s Samples~!
//Plant Samples:
public function azraPlantSamples(back:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(back) output("You change your mind. Is there a different plant you’d like to interact with?");
	else
	{
		output("You let Azra know that you’d like to take a look at some of her samples.");
		//Kissy Azra:
		if(flags["AZRA_MHENGAED"] == 1) 
		{
			output("\n\nGoing beet red, the shark-girl nods. <i>“I’m going to uh... go for a quick walk then. Be gentle, okay?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“Okay... I’ll be back in thirty minutes!”</i> The suula scientist sets her watch on the way out.");
			output("\n\nThe door hisses closed behind her. At last, you’re alone. What do you want to inspect?");
		}
		//Fucky Azra
		else
		{
			if(flags["AZRA_MHENGAED"] == 1) 
			{
				output("\n\nFanning herself, the shark-girl nods. <i>“I just gave them a feeding myself. I don’t think suula seed is perfect for their biology, but it does in a pinch.”</i> She glances at her codex. <i>“Thirty minutes ought to be more than enough for my dashing Captain. I barely made it ten.”</i>");
				output("\n\nAzra kisses you on the forehead on her way out the door, tail swishing happily behind her. <i>“Just don’t spend too much time thinking about me while you’re playing with our floral friends.”</i>");
				output("\n\nThe door hisses shut behind her.");
			}
			else
			{
				output("\n\nSmirking knowingly, the shark-girl says, <i>“");
				//Already on sex cooldown:
				if(9999 == 0)
				{
					if(rand(2) == 0) output("You know, if you spend all your time fucking around on the ship, you’ll never become the famous rusher I know you’re destined to be.");
					else output("The fuck lillies are good, but they'll never be as good as me.”</i> She checks her watch, then sighs. <i>But I guess they'll have to do for now...");
				}
				else if(pc.hasCock(GLOBAL.TYPE_EQUINE) && rand(7) == 0) output("You know, I can smell that horse-dick of yours from over here. If you're going to whip it out in here, turn on the fan afterward. The last thing I need to do is feel like I'm penned up in your breeding barn.");
				else if(pc.hasCock(GLOBAL.TYPE_CANINE) && rand(6) == 0) output("You know, that doggie-dick of yours leaks pheromones like a busted faucet. You better turn up the life support filtration after this, or I'm going to be hornier in here than a bitch in heat.");
				else if(rand(5) == 0) output("Would you?”</i> Azra leans close. <i>“When you're through in here, I have a special sample for you in my bedroom, if you have the time.");
				else if(rand(4) == 0) output("Remember, the mutagenic samples aren't refined, tested products. There's no telling what havoc abusing them could wreak on your system.”</i> She looks at you mischievously. <i>“But a brave [pc.boyGirl] like you is going to play with fire, aren't you?");
				else if(rand(3) == 0) output("Just don't use the leftmost Fuck Lilly. She just had a very thorough session, and I don't want any of our prize plants to die from overfeeding.");
				else if(rand(2) == 0) output("I'm glad I'm not the only one who enjoys these little beauties. Be good to them, and they'll be good to you.");
				else output("Aww, you're such a sweet " + azraBoyfriend() + ", checking up on me and my work. Maybe one of these times you'll catch me feeding the Fuck Lilies.");
				output("”</i> She glances at her Codex. <i>“Thirty minutes ought to be more than long enough for whatever you have planned. I barely last ten in those botanical succubi, but I know my " + azraBoyfriend() + " is made of tougher stuff.”</i>");
				output("\n\nAzra kisses you on the forehead on her way out the door, tail swishing happily behind her.");
			}
		}
		processTime(2);
	}
	clearMenu();
	addButton(0,"Fuck Lillies",approachFuckLillies);
	addButton(14,"Leave",mainGameMenu);
}

//Fuck Lilies
public function approachFuckLillies():void
{
	clearOutput();
	showAzra();
	output("Since being placed in specially mixed soil, the Fuck Lilies have sprouted like weeds. You select one in particular to approach. The stalk itself is waist-high and extraordinarily sturdy looking, more like a small tree trunk than a flower’s stalk. Atop it sits a huge, violet bloom. The obscene flower looks positively female in every sense, right down to a clit-shaped bump and moist, gently parted lips. Inside that central passage, you can see a bevy of wiggling staman surrounding a larger, flared stalk. The scent that wafts out of that opening is sweet and floral, but undoubtedly sexual. It looks like a carefully designed organic sex toy more than a naturally occurring flower, nevertheless, nature on Mhen’ga has provided it to you.");
	if(pc.lust() < 33)
	{
		output("\n\n<b>You weren’t very aroused when you arrived, but the sight and smell has you ready to go.");
		pc.lust(33);
	}
	processTime(1);
	clearMenu();
	if(pc.cockThatFits(700) >= 0 && pc.hasCock()) addButton(0,"FuckWithDick",fuckTheFuckLily,undefined,"Fuck With Dick","Fuck them with your penis.");
	else if(pc.hasCock()) addDisabledButton(0,"FuckWithDick","FuckWithDick","Your member is too monstrous for the smaller flower.");
	else addDisabledButton(0,"FuckWithDick","FuckWithDick","Your need a penis for this.");
	if(pc.hasVagina()) addButton(1,"FuckWithCunt",rideDatFuckLily,undefined,"FuckWithCunt","Ride those wiggly stamen with your pussy.");
	else addDisabledButton(1,"FuckWithCunt","Fuck With Cunt","You need a vagina for this.");
	addButton(14,"Back",azraPlantSamples,true);
}

//Fuck It!
public function fuckTheFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	if(!pc.isCrotchExposed()) output("Undoing your [pc.crotchCover]");
	else output("Hefting [pc.oneCock]");
	output(", you approach the pulsating plant with one thought in mind: fucking it. At the sight of [pc.eachCock], the petals flutter happily, their surface glimmering with moisture in an instant, slick and wet for your pleasure. You lean down to inhale the sweet yet sensual nature of the flower’s aroma, letting it tickle your nostrils as you idly fondle [pc.oneCock]. Your maleness quickly assumes ");
	if(pc.isBimbo()) output("your favorite state");
	else if(pc.libido() < 50) output("an aroused state");
	else output("its favorite state");
	output(" - hard and sensitive, ready to plunge into the nearest set of wet lips with the reckless abandon. At the same time, you can see the wriggling tendrils inside the flower’s vase waving about hungrily.");
	output("\n\nYou ");
	if(pc.isNice()) output("smile");
	else if(pc.isMischievous()) output("chuckle");
	else output("laugh");
	output(" in amusement; who are you to deny it the creamy treat it so richly deserves? Letting go of your [pc.cock " + x + "], you reach around the soft petals to the harder, central bud and slide yourself through the honeyed embraced into the pulsating, tentacled flower-core. Juicy warmth snuggles about your dick, the velvet-soft chamber immediately tightening up while the petals fold in, crossing over one another until they form a tube long enough to swallow you whole. Gentle suction begins to rhythmically tug at your [pc.cockHead " + x + "], swelling you larger and more sensitive inside. Immediately, the tiny tendrils you saw swarming around earlier reach up to massage your cock, slithering across your skin like tiny, sinuous snakes.");
	pc.cockChange();
	output("\n\nIt’s enough to make your [pc.legs] quake, and you slowly slide to the ground. The flower, now a tightly-sealed bulb, sucks hard enough to stay latched onto you as you recline. It bends the stem double, but the resilient plant seems to handle the strain with ease. Rivulets of clear slime escape from the tight seal to run down your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("[pc.legs]");
	output(" and form a sticky puddle. Now moaning, you grab the stem and start to pump the sheath up and down, using the plant like the cock-toy it was bred to be. Lewd, wet squishes ring out through the air,");
	if(pc.exhibitionism() < 33) output(" and you timidly look around, hoping the sounds don’t carry through the door.");
	else if(pc.exhibitionism() < 66) output(" and you worriedly glance around, hoping yet terrified that Azra will walk in on you at your most depraved.");
	else output(" and you glance around, hoping Azra will walk in on the sexy show you’re making.");
	output("\n\nNow panting with unbearable lust and undeniable levels of pleasure, you give up all sense of propriety and resort to fucking wildly, [pc.hips] jumping inches off into the air. The flower’s interior is a slick, silky heaven for your [pc.cock " + x + "], a sucking, squeezing hole of seemingly infinite pleasure. Inside its gluttonous gullet, the numerous tentacles twist around, the longest ones circling the base of your shaft");
	if(pc.hasSheath(x)) output(" inside your violated sheath");
	output(". With so much blood trapped in your [pc.cock " + x + "], it’s bigger and harder than ever, twitching valiantly against its restraints with every beat of your heart.");
	output("\n\nOne of the tentacles circles your [pc.cockHead " + x + "] for a moment, and without much warning or pause, it lances forward to bury itself into your vulnerable cum-slit. Your preconceptions are turned on their head when there’s a complete lack of pain from the abrupt penetration. If anything, it actually feels kind of good... like there’s a warm, slippery finger caressing your penis from the inside out. It slithers in and out of you, pumping you inside, burrowing pleasure into your center even while stroking you from without. Your body, burning from the exertion of fucking the flower’s pod and the constantly-rising tidal wave of lust, begins to twitch spasmodically,");
	output("\n\nThe internal suction spikes as your dick bloats larger, and with a roar of bestial pleasure, you arch your back, hands pushing your [pc.cock " + x + "] as deep into the plant’s gullet as possible. ");
	if(pc.balls > 0) 
	{
		if(pc.balls > 1) output("Your [pc.balls] gurgle, a surprisingly happy sound, and cling tight to your loins. ");
		else output("Your [pc.balls] gurgles, a surprisingly happy sound, and clings tight to your loins. ");
	}
	output("Inside you, you can feel the liquid heat of your spurting release exploding out, melting everything before it with liquid, orgasmic bliss. A low moan bursts from your lips when the sounding tentacle pulls out of your sloppy cock-slot, and the rushing tide of bubbling cum follows it, bursting into the sweet, suckling nectar-pot.");
	if(pc.cumQ() >= 500) output(" You pour forth your prodigious essence without pause or fail, and the plant immediately begins to drink it down, the stem bulging with rounded balls of sperm that it carries into its root system.");
	if(pc.cumQ() >= 2000) output(" Soon, the meager stem cannot swallow it all. Spunk froths and squirts out around the base of your tool for a moment, and then a veritable tide of the stuff gushes out to soak you and Azra’s floor. Whoops.");
	output("\n\nSatisfied or exhausted, you slump down and release your grip on the creampied fuck-flower. It slowly, laboriously removes itself from around your orgasm-bloated shaft, cleaning the sperm from it as it goes. There’s a visible swallowing motion, and a globular bulb moves down the stalk into the ground. Once upright, the petals bloom back into the flower, the only hint of your tryst a milky-white sheen upon the purple petals.");
	output("\n\nYou have just enough time to clean up before Azra returns. Whew.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}

public function fuckFlowerEpilogue():void
{
	clearOutput();
	showAzra();
	output("Azra ");
	if(flags["AZRA_MHENGAED"] == -1) output("hesitantly re-enters");
	else output("barges into the room in a rush, hoping to catch you mid-coitus");
	output(". <i>“I see you’ve finished your ‘inspection’.");
	if(flags["AZRA_MHENGAED"] == 1) output(" Maybe you’d like to inspect something else?");
	else output(" Is there anything else I can help you with, Captain [pc.name]?");
	output("”</i>");
	processTime(1);
	IncrementFlag("FUCK_LILLIES_USED");
	azraMenu();
}

//Ride It (skimmed)(coded)
public function rideDatFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	output("You ");
	if(!pc.isCrotchExposed()) output("shuck your [pc.crotchCovers] and ");
	output("slowly ease yourself towards the violet-hued creature. As soon as you get within a few feet, the flower’s bulb angles toward you, the petals wiggling slightly along with the stamen inside. A few of them even stretch out towards you like longing fingertips, shaking slightly from the effort before sliding back inside. The dull ache in your [pc.vaginas] grows a few degrees hotter at the display, your body growing flush with excitement for the coming copulation. Throwing caution to the wind, you move forward with a confident sway of your [pc.hips]. It’s time to get pollinated.");
	output("\n\nGrabbing hold of the plant, you tug it up against your mons and sigh. The silky-smooth petals flatten against your thighs, the tips curling over to touch the sides of your [pc.butt], slicking it with lubricating moisture. You let go, and the flower holds fast to your [pc.hips], firmly embracing you as its stamen begin to roam across your vulva. Slowly, an intrepid tentacle ventures between your labia, into the slick passageway you’re so ready to fill with wiggly delight. A dribble of fresh fluid rushes out at those first, hesitant touches, and encouraged by its success, the stamen’s brothers join in on the slippery party, plunging into your box and immediately swirling over your inner walls.");
	output("\n\nDriven mercilessly by the sudden onslaught of sensation, you flop back onto the ground, but the flower comes with you, latched onto your [pc.hips] with no sign of releasing. The swirling tentacles twist around inside you in a tornado of ecstasy, and the pleasure, that awful, unstoppable pleasure, it twists your muscles into knots, instinctively convulsing to raise your lower lips higher, as if that would somehow propagate even deeper penetration. One of the tentacles retracts, drawing a burst of slick cunt-lube with it. Then, it twists around [pc.oneClit], tightening up on the over-sensitive bud until it feels like it could pop.");
	if(pc.clitLength > 3) output(" Your heavy buzzer is so big that the flexible plant-cock has plenty of room to curl around it, and if you could see it, your clit would look look almost like a candy-cane (if one set of stripes was jerking off the cane beneath).");
	if(pc.hasCock()) output(" [pc.EachCock] soon has its own partner twisting around it, a pussy-slicked vine to jerk and twine about its girth.");
	output("\n\nWith nothing to occupy your roving hands, you let the slide up your [pc.skinFurScales] to your ");
	if(pc.bRows() > 1) output("lowest row of tits, cupping them before going to your top row of breasts");
	else output("[pc.chest]");
	output(", caressing the swell as you search for the lust-tightened skin of your [pc.nipples]. They seem almost as sensitive as little clits, and as soon as you find them, you immediately set to circling them slowly, occasionally tugging and twisting when you a particularly powerful sensation works through your pleasure-wracked body.");
	if(pc.isLactating())
	{
		output(" One after the other, they begin to ");
		if(!pc.canMilkSquirt()) output("leak");
		else output("spray torrents of");
		output(" [pc.milkNoun].");
	} 
	output(" You moan in unabashed delight, your mouth hanging open in a mindless, blissful ‘o’ in between vocalizations. If your Azra could see you know, writhing on the deck, face open in simple, animal pleasure, and perhaps worst of all, fucking a plant, you’d die of ");
	if(pc.exhibitionism() < 50) output("embarrassment");
	else output("lust");
	output(".");
	output("\n\nWith that thought somehow staying firmly in your battered consciousness, you reach a climax of mind-breaking proportion, eyes rolling wildly as every muscle locks in one united twitch of rapture.");
	if(pc.hasCock()) output(" [pc.EachCock] explodes in release, pumping heavy flows of seed into the petals, even as y");
	else output(" Y");
	output("our quivering pussy, already sopping wet, releases the last of your juices in a soaked ");
	if(pc.wettestVaginalWetness() < 2) output("drizzle");
	else if(pc.wettestVaginalWetness() < 4) output("stream");
	else if(pc.wettestVaginalWetness() < 5) output("spray");
	else output("torrent");
	output(". The tentacles inside you curl in on themselves and slowly pull back from the well-creamed quim, scraping out as much fluid as possible from your oversensitive honey-pot. The binding on your [pc.clit] releases, which of course sets off a whole new wave of rippling pleasure-contractions in your cunt.");
	output("\n\nYou swoon from it all, your body slowly relaxing, sinking back to the ground. The fuck-flower visibly swallows your juices, a bulge visible on the stem. It detaches with a hungry pop, strands of its slime webbing the space between person and plant for a second before it withdraws completely. Slowing gradually, the corrupt greenery resumes its formerly placid, open state, aimed at the lights. You can see the tentacle-like stamen still wiggling inside, but they seem a little more lethargic now. Your [pc.vagina] twitches in rememberence of their caresses, and you wonder when you’ll take advantage of this wondrous plant next.");
	//[Next] - to fuck-flower epilogue
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}