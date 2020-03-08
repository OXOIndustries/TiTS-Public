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

public function showPregRask():void
{
	showBust("PREGRASK");
	showName("PREGNANT\nRASKVEL");
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

public function azraExpeditionAvailable():Boolean
{
	//"new texas", "tarkus", "phaedra", 
	if(getPlanetName().toLowerCase() == "mhen'ga")
	{
		if(flags["AZRA_MHENGAED"] == undefined || flags["AZRA_MHENGAED"] == 0) return true;
	}
	if(getPlanetName().toLowerCase() == "tarkus")
	{
		if(flags["TARKUS_DESTROYED"] == 1) return false;
		if((flags["AZRA_MHENGAED"] == 1 || azraProfessional()) && flags["AZRA_TARKUSED"] == undefined) return true;
	}
	return false;
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
	if(!CodexManager.hasUnlockedEntry("Gray Goos"))
	{
		output("\n\nYour Codex beeps an urgent warning: <i>“Gray goo detected. These active micro-machine clusters are known to attack without provocation. U.G.C. Scout Authority suggests extreme caution, as well as hydration, around the native goo.”</i>");
		CodexManager.unlockEntry("Gray Goos");
	}
	//Merge
	output("\n\nAzra takes a half-step back, waving cautiously. <i>“Greetings?”</i>");
	output("\n\nThe double-headed goo-slut surges forward. <i>“The mush-mush isn’t nearly as yummy as a little cummy.”</i> A silver feeler slips out of her base and scoops up one of the slutshrooms while she talks. Her whole form wobbles and shakes with pleasure a second later, culminating in a sudden squirt of liquid metal between her thighs. <i>“Ahhh~!”</i> One head batts dripping eyelashes at you. <i>“Eat some mush.”</i> The other licks her lips. <i>“Cum with us.”</i> The first smiles as she hefts her tits, leaning close. <i>“You’ll love it.”</i>");
	output("\n\nAzra looks your way for a suggestion.");
	output("\n\nThe way you see it, you can try to take her head-on in a fight, maybe even tease her until she loses all cohesion. Alternatively, you could volunteer yourself as a distraction and hope the two-headed strumpet lets you go after Azra has harvested her fill.");
	
	if(hasGooArmorOnSelf())
	{
		output("\n\n<i>“Ooh-ooh! I want yummy cummy! Me too! Me too!”</i>");
		if(pc.armor is GooArmor) output(" Your goo armor squirms around your body");
		else output(" A familiar item in your inventory exclaims");
		output(". Great, she even has [goo.name] craving for cum as well...");
		flags["DOUBLE_GOO_SLUT_MET_GOO_ARMOR"] = 1;
	}

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
		if(hasGooArmorOnSelf()) output("\n\n<i>“That’s right, super yummies!”</i> [goo.name] adds.");
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

		output(" frame. Your movements reflect in the cascading waves they generate, rippling across the silver slut’s hypersexualized frame until they crash into one another in viscous bursts of pleasure. Your [pc.cocks] answer" + (pc.cockTotal() == 1 ? "s with its" : " with their") + " own thickened liquid");
		if(pc.cockTotal() > 1) output("s");
		output(", ");
		
		var totalCum:Number = pc.cumQ();
		
		if(totalCum < 8) output("leaking out");
		else if(totalCum < 100) output("jetting out");
		else if(totalCum < 1000) output("spraying out");
		else if(totalCum < 5000) output("gushing out");
		else output("erupting out");
		output(" the promised meal.");
		if(totalCum < 8) output(" It vanishes into her with little fanfare and a few wondrous, blissful quivers. Nothing more.");
		else if(totalCum < 100) output(" It vanishes into her, pulse by pulse, wicked up into her jiggling form with coos of delight. Not a single hint of your moisture remains on your flesh, so effectively does the greedy goo-ess suckle you.");
		else if(totalCum < 1000) output(" It vanishes into her with audible squelches, fattening the greedy goo-ess with [pc.cumNoun] by the cupfull. She drinks deeply of it, so deeply that not a single drop of [pc.cumGem] fluid can flow back across your [pc.cockSkin].");
		else output(" It floods into her by the liter. The raw volume is so great as to bloat her already immense frame, her tits spilling farther and farther to your sides, her ass swelling up like cum-infused mountains. Her metallic luster fades a bit, infused with the [pc.cumColor] color of your [pc.cumNoun], and then she can drink no more. Spare spooge rolls down your thighs and puddles below. There’s so much, but you offer her more. You can scarcely stop the offering of your endless bounty any more than she can help but try (and fail) to keep up.");

		output("\n\n<i>“Ooooh,”</i> twinned voices cry in delight, arching their conjoined back until the weighty orbs of the goo-slut’s tits are yanked off your [pc.cocks], exposing ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" to the air. <i>“I </i>liked<i> that!”</i> The mercurial beauty bats four pairs of dripping eyelashes at you.");
		
		flags["DOUBLE_GOO_SLUT_RESULT"] = 4;
		
		//Fork no new PG based on cumQ.
		//Not Enough
		if(totalCum < 100) 
		{
			output("\n\n<i>“But not enough.”</i> The right head nods agreeably. <i>“Need at least... three times that much.”</i> The left shakes, setting off a boob-quake. <i>“Four. Four cummies.”</i>");
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
			output("\n\nThe right head titters, <i>“Such a lovely snacky-snack, cum-and-pack!”</i> The left wobbles, hair lengthening thanks to the freshly deposited mass. <i>“Take some mush, then come back when you’re all yum-and-squirty.”</i> Both nod in unison, in perfect agreement that a squirtier like you is a net positive for the universe as a whole.");
			if(hasGooArmorOnSelf()) output("\n\n<i>“Thanks a lot, babes! You two look so sexy now!”</i> [goo.name] waves as you and Azra continue.");
			clearMenu();
			//[Next] - continue to next encounter
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
	output(" <i>“[pc.HeShe] can give me all the cum.”</i>");
	output("\n\nRight looks over, suddenly jealous. <i>“[pc.HeShe] barely has any! I need my nummy cummies!”</i>");
	output("\n\n<i>“No! It’s mine!”</i>");
	output("\n\n<i>“Mine!”</i> The fair features twist into a snarl, and with them, her puss");
	if(pc.totalVaginas() > 1) output("ies");
	else output("y");
	output(" clamp down.");

	output("\n\nOnce loving caresses become vice-like pressure, assaulting your hyper-sensitive phall");
	if(pc.cockTotal() > 1) output("i");
	else output("us");
	output(" with virginal tightness mated with whorish desire. The disagreement doesn’t stop her from fucking you. No matter how her heads bicker, the wobbling woman’s too-thick thighs continue to bounce atop you in almost-perfect rhythm. The left will spout some pithy remark, and her cunt will viciously tug. The right will retort, and a callous ripple will slide along your length, milking you callously.");

	output("\n\nSilver droplets splatter off your [pc.belly], slick and oily, sliding down your side to journey back into the goo-girls’ legs. She’s less solid than before, and hotter too, like the act of churning your loins for seed is slowly causing her to overheat. More viscous dollops drip off when she jerks too hard or fucks too fast, but she doesn’t seem to care. They wiggle through the dirt and back into her without a care in the world. The mercury madam may as well be a machine for how relentlessly she pumps your [pc.cocks]. Up, down, squeeze, up, down, twist... She doesn’t stop, not even when your whole body is shuddering and your [pc.balls] ");
	if(pc.balls <= 1) output("is");
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
		output("\n\n<i>“I’m stuffed!”</i> The gelatinous girl rolls off of you, so fattened with jism that she barely maintains cohesion. Her right head titters, <i>“Cum-stuffed-spunk-puff!”</i> The left wobbles, hair growing into a waist-long ponytail with the aid of your newly deposited mass. <i>“Take some mush if you want, then come fuck some more.”</i> Both nod in unison, in perfect agreement that you should return to plow them at your earliest convenience.");
	}
	//ENOUGH
	else
	{
		output("\n\n<i>“So much better than mush.”</i> The gelatinous girls roll off of you.");
		output("\n\nDid they get a little bigger?");
		output("\n\nThe right head titters, <i>“Such a lovely snacky-snack, cum-and-pack!”</i> The left wobbles, hair lengthening thanks to the freshly deposited mass. <i>“Take some mush, then come back when you’re all yum-and-squirty.”</i> Both nod in unison, in perfect agreement that a squirtier like you is a net positive for the universe as a whole.");
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
	if(hasGooArmorOnSelf()) output("\n\n<i>“Awww... Do we hafta fight?”</i> [goo.name] whines.");
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
	if(pc.isBimbo() && flags["AZRA_SEX_KNOWN"] != undefined)
	{
		output("<i>“Like, she’s all cummed out!”</i> You step up to the goliath goo and pantomime giving a very messy-looking blowjob. <i>“Her big ol’ sharkballs are totes drained, and its soooo sad. First she had to pay these greedy raskvel, and then like, I needed a snack, and then there was this other gray goo who sucked her for an hour.”</i> You gesture over your shoulder. <i>“I think her dick would break if we tried to get any more.”</i> You try to keep from tearing up at the thought.");
		output("\n\nThe goo woman (women?) actually do, favoring Azra with a tender expression. <i>“You poor thing!”</i> <i>“Need food. Make more cummies.”</i> The left head and the right look at each other in unison. <i>“I know! Take ‘shrooms! Eat five and come back after nap.”</i> The right adds. <i>“Then have plenty of girl cummies too!”</i>");
		output("\n\nAzra blushes hotter than a dying star. <i>“No... uh... yeah... okay.”</i> She nods gratefully at you and the giant-sized goo woman. <i>“I... will. Sorry.”</i>");
		output("\n\n<i>“Don’t worry,”</i> the right head graciously answers. <i>“We still have plenty of mush-mush for lots more cum-cums.”</i> The left adds looks to the right. <i>“More mush?”</i> Her sister answers, <i>“Fuck yes!”</i> Both hands pluck stalks from the ground as the voracious creature resumes feeding itself, squirting silver from small orgasms with every bite.");
		output("\n\nAzra turns away in a hurry to gather her own, leaving you with nothing to do but watch the two-headed goo-girl eat and cum and eat in cum. She’s so curvaceous, and she cums so noisily. You can feel yourself getting hot under the collar. Familiar urges well up inside you, and you realize that if you don’t do something about it, you’ll wind up horny and distracted for the rest of the day. Maybe the nice goo could help you out?");

		processTime(5);
		pc.changeLust(5);
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
	
	flags["DOUBLE_GOO_SLUT_RESULT"] = 2;
	
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
	
	flags["DOUBLE_GOO_SLUT_RESULT"] = 3;
	
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

	output("\n\n<i>“N-no!”</i> Azra haphazardly protests, twisting from side to side. Her enormous prong slaps against each of her thighs in turn. The tentacles that ring the tip wildly flail and she actually gets harder. Is she trying to show it off?");

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
	output("\n\nAzra stares at you, wide-eyed as the left head slowly extracts inch after inch of silver tongue from her sharky maw, face flushing redder and redder. When it finally escapes, it does a circuit across Azra’s muzzle, paying special attention to her gasping lips. Below, Azra’s hips violently thrust, hard enough to bounce the titanic gray goo a few inches off the ground. <i>“What did you do to me?”</i>");
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
	flags["AZRA_SEX_KNOWN"] = 1;
	flags["DOUBLE_GOO_SLUT_RESULT"] = -1;
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
	
	flags["DOUBLE_GOO_SLUT_RESULT"] = 1;
	
	output("\n\n");
	processTime(12);
	CombatManager.genericVictory();

	//[Next] -> To motherhusk intro :3
	eventQueue.push(motherhuskEncounter);
}


public function motherhuskEncounter():void
{
	actualMotherHuskIntro();
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
	//set location a new location

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
		output("\n\nAzra nods. <i>“But it may be a trap. The high walls make this place ideal for ambush. We must proceed carefully.”</i>");
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
	output("The slope into the valley slowly descends to the armored structure. It’s an easy walk. The gritty soil is packed into a solid, rust-red road by frequent travel. Sharp ruts from an iron-wheeled vehicle line the sides, but whatever left them has long-since rolled on. Azra scans the sides of the valley for ambush, wings twitching nervously. You keep your eyes on the shadows, yet you see nothing save for dim crags and cracked pipes.");
	output("\n\nThe wind whistles by.");
	output("\n\nYou’re standing in front of the door before you know it. The intercom panel is buzzing faintly, the call button glowing with dim green luminescence. No sign of hostiles has presented itself.");
	output("\n\nAzra checks the scans on her Codex, overlaid across a topography scan. <i>“They’re inside. I’m not sure why. Perhaps the motherhusks are being farmed.”</i> She looks over her shoulder, then back to you. <i>“Shall we try the buzzer?”</i>");
	processTime(2);
	clearMenu();
	//[Buzz In] [Knock]
	addButton(0,"Buzz In",buzzIntoRaskland);
	addButton(1,"Knock",knockOnRaskBunker);
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
	output("\n\nYou clear your throat and press down the “talk” button. <i>“");
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
	addButton(0,"Break In",breakIntoRaskbutts);
	addButton(1,"Move On",moveOnAndSkipMotherbutts);
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
	flags["AZRA_TARKUS_SKIP"] = 1;
	//[Next] -> On to the spunkshroom intro :3
	clearMenu();
	addButton(0,"Next",spunkShroomTrapQueen);
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
	addButton(0,"Hack In",hackThatRaskDoor,undefined,"Hack In","Do you have what it takes to route the power to its destination?");
	addButton(1,"BruteForce",bruteForceTheDoor,undefined,"Brute Force","Between the two of you, you just might have the physique to pry it open. Failure may be tiring...");
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
		clearMenu();
		addButton(0,"Hack In",hackThatRaskDoor,undefined,"Hack In","Do you have what it takes to route the power to its destination?");
		addButton(1,"BruteForce",bruteForceTheDoor,undefined,"Brute Force","Between the two of you, you just might have the physique to pry it open. Failure may be tiring...");
		addButton(2,"Move On",moveOnAndSkipMotherbutts);
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
	output(". The interior is cramped but well lit. The rust you’ve seen everywhere else on this planet is nowhere to be seen. Any exposed metal is devoid of blemishes and well-maintained for something cobbled together from a half-dozen different wrecks. It’s impossible to pick out where the pieces join together; they’ve blended together into a piecemeal hodgepodge.");
	output("\n\nYou look back over your shoulder as Azra climbs in with you. She struggles to get her wings through, but once inside, she’s able to move in relative comfort... so long as she crawls on her hands and knees.");

	//Broke in
	if(flags["RASKDOOR_BROKE"] == 1)
	{
		output("\n\nA staticky voice reverberates out of the ceiling, <i>“Heyyyy! Since you cunts broke my door, I think I’m gonna have to break you. No hard feelings!”</i> Three recessed turrets swivel out of the wall in front of you, each armed with a different type of gun. At a glance, you guess there’s a machine-gun, a flamethrower, and some kind of ray-gun.");
		output("\n\n<i>“I can’t fight in here!”</i> Azra barks in a panic. At least she’s out of the way, behind you. Then again, you won’t be able to flee with her blocking the tunnel... <b>You have to fight!</b>");
		//to turretfight
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new RaskTurretA, new RaskTurretB, new RaskTurretC);
		CombatManager.victoryScene(defeatDemTurrets);
		CombatManager.lossScene(turretDeath);
		CombatManager.displayLocation("TURRETS");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
	}
	//Didn’t break in
	else
	{
		output("\n\nA familiar voice broadcasts from the ceiling, <i>“Heyyyy! You guys are pretty smart for off-worlders, rewiring the door like that.”</i> It pitches into a husky whisper. <i>“How about a test? You disable these turrets, and I’ll let you take whatever you want from me.”</i> Three turrets swivel out of the wall along with a digital display covered in power relays. <i>“Even my dignity. Mmmm... don’t die, ‘kay?”</i>");
		output("\n\nThey’re inactive right now, but you’re relatively sure that if you don’t play along, they’ll gun you down. You’ll need to purge the power from every single relay if you don’t want them to attack.");
		//TO HAXING MINIGAME!
		clearMenu();
		addButton(0,"Next",lightsOutTurretPrep);
	}
}

public function turretDeath():void
{
	clearOutput();
	showBust("TURRET_MG","TURRET_LASER","TURRET_FLAMER");
	showName("GAME\nOVER");
	output("Your wounds overtake you, and as you slump to the bloodied floor, all you can hear are Azra’s panicked screams.");
	kGAMECLASS.badEnd("YOU DIED.");
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
	addButton(0,"Next",azraQuestRaskOverrideGame);
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
			i | s | w,	i | s | w,	l | s | w,	i | e | w,	i        ,
			i | n | w,	l | e | s,	i | n | w,	i | s | w,	i        ,
			i | n | w,	i | s | e,	i | e | w,	i | e | s,	i        ,
		]);
	}
}

public function azraQuestHackerDoor():void
{
	clearOutput();
	showAzra();
	showName("\nSUCCESS!");
	output("With a whirring hum, the door slowly rolls open, revealing the corridor beyond.");
	output("\n\n<i>“Yes!”</i> Azra cheers, sweeping you into a surprise hug from behind. Her feathers curl around you as she squeezes tight, tickling your [pc.skin]. This close, you can smell");
	if(pc.isTreated()) output(" the residue of her recently spilled seed as well as");
	output(" her natural scent, peachy and sweet. After a moment, she lets go, blushing hotly. <i>“I didn’t realize you were so talented.”</i>");

	//Misch/Bimbo
	if(pc.isMischievous() || pc.isBimbo()) output("\n\n<i>“You should see me in the bedroom.”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“...in bed,”</i> you finish the sentence for her.");
	//Either
	if(pc.isBro() || pc.isBimbo() || pc.isMischievous()) output("\n\nAzra blushes, tail swishing behind her. <i>“Save that kind of talk for later.... Would you mind leading the way? I doubt I’d fit properly.”</i>");
	else 
	{
		output("\n\n<i>“What can I say? I’m good at my job.”</i>");
		output("\n\nAzra’s eyes twinkle. <i>“Of course you are. Would you mind leading the way? I’m too big to fit in there very well...”</i>");
	}
	flags["RASKDOOR_HACKED"] = 1;
	//Merge all
	//[Next] -> To entry text
	clearMenu();
	addButton(0,"Next",brokeIntoRaskDoor);
}

public function lightsOutTurretPrep():void
{
	configureLightsOut(azraQuestTurretShutdown,backwardsHackTurretsIdiot, [0,1,2,3,4,5,6,7,8,10,11,12]);
}

//Turn the turrets on
public function backwardsHackTurretsIdiot():void
{
	clearOutput();
	showBust("TURRET_MG","TURRET_FLAMER");
	showName("\nWHOOPS!");
	output("The turrets hum with power as they switch from passive to active mode. The closest, a machine-gun, clacks noisily as shells slam into place. You can’t run, not with Azra blocking the tunnel behind. <b>You’ll have to fight!</b>");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new RaskTurretA, new RaskTurretB, new RaskTurretC);
	CombatManager.victoryScene(defeatDemTurrets);
	CombatManager.lossScene(turretDeath);
	CombatManager.displayLocation("TURRETS");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}
//Disable ‘dem turreeeeeets
public function defeatDemTurrets():void
{
	flags["RASKTURRETS_BROKE"] = 1;
	CombatManager.genericVictory();
	eventQueue.push(azraQuestTurretShutdown);
}

public function azraQuestTurretShutdown():void
{
	clearOutput();
	showAzra();
	output("The turrets suddenly sag down to point at the floor, indicator lights blinking out one by one as their capacitors drain. <i>“Yes!”</i> You pump your arm happily.");
	output("\n\nAzra calls from behind. <i>“Did you do it? Are we safe?”</i>");
	output("\n\n<i>“Yeah, I got it!”</i>");
	output("\n\n<i>“Fantastic!”</i> the suula scientist cheers. <i>“I hope we’re close. I’m not certain how much more time on my knees I can take.”</i>");

	//Bimbo
	if(pc.isBimbo()) output("\n\nYou blithely retort, <i>“Practice makes perfect, hun!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou chortle in amusement. Honestly it’s a good look for her. Shame the ceilings on your ship aren’t shorter.");
	//Nice
	else if(pc.isNice()) output("\n\nYou look back in concern. <i>“Hang in there. We’ve got to be close. This building isn’t </i>that<i> big.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\nYou chuckle. <i>“We’ve got to be close. The building isn’t that big. Besides, it’s good practice!”</i>");
	//Hard
	else output("\n\nYou facepalm. <i>“You’re the one that wanted to come inside here. Suck it up, cupcake. We’re close.”</i>");

	//Merge
	processTime(2);
	clearMenu();
	addButton(0,"Next",fuckUpTurrets);
}

public function fuckUpTurrets():void
{
	clearOutput();
	showPregRask();
	output("Just past the turrets is another door. This one has no security panel, just a simple toggle switch to pop it open. You wait for Azra to catch up, then press it.");
	output("\n\nA high-pressure, pneumatic hiss sounds as the door slides up into the ceiling. The next room is dark, so dark that it takes your eyes a second to adjust.");

	//Haxxored both!
	if(flags["RASKDOOR_BROKE"] == undefined && flags["RASKTURRETS_BROKE"] == undefined)
	{
		output("\n\n<i>“Ohhh no! The sexy aliens disabled all my traps with their superior intelligence, and I’m too pregnant to escaaaaape! Please don’t ");
		if(pc.hasCock()) output("pull out your dick and shove it in me... everywhere");
		else output("make me eat your muff until I give birth. Please");
		output(". It’s just the hormones making me all wet, juicy, and fuckable. I’d be so distraught if you turned me into your personal fuckmeat!”</i>");
	}
	//Haxxed one but failed one
	else if(flags["RASKDOOR_BROKE"] == undefined || flags["RASKTURRETS_BROKE"] == undefined)
	{
		output("\n\n<i>“Ohhh no! They’ve breached my control room. Fuck, you guys are sexy too? As if being smart and strong wasn’t enough. How am I supposed to keep my thighs closed when you’re this close, and I’m this pregnant? I should’ve built better defenses. Now I’m stuck, soaking wet, and totally at your mercy!”</i>");
	}
	//Force in
	else
	{
		output("\n\n<i>“Ohhh no! You smashed right through my defenses like they were nothing at all! How’s a girl supposed to keep herself from being raped, again and again, when big, strong aliens just batter down every attempt to keep my hot little cunny all to myself? Are you going to rape me? Please don’t rape me... I’d </i>hate<i> if you tied me up and kept me as your knocked-up broodmare for months!”</i>");
	}
	//Merge
	output("\n\nWithout the interference from the intercom system, the voice sounds even more wanton, layered thick in lurid intent. You can make out the shape of the speaker against the far wall. She’s a short thing, no more than four feet tall, but obscenely swollen around the middle, pinned to the floor by her immensely gravid belly and ridiculously wide hips. When you spy her ears, draped across her swollen tits, hanging over her belly like clothing, that you identify her as a raskvel. A raskvel that’s more pregnant than any raskvel you’ve seen in Novahome.");
	output("\n\nAzra enters the room with her Codex’s light turned on. She seems elated to discover that the ceiling is higher here, allowing her to stand up straight. Her back cracks five or six times on the way up, accompanied by sounds of mild discomfort. Panning the light around, she illuminates your former tormentor.");
	output("\n\n<i>“Sprat, that’s bright!”</i> the hyper-pregnant raskvel shrieks, shielding her eyes. <i>“I’ll ");
	if(pc.hasCock()) output("suck your dicks");
	else if(pc.hasVagina()) output("eat your pussies");
	else output("suck your dick");
	output(" if you turn that light off.”</i> Whatever hormones are coursing through her, they’ve been good to her. Her feathery hair is glossy blue and longer than you’ve seen on any raskvel in the wild, matched by lips lacquered in a matching shade. Her tits are huge, for a raskvel. On a human, they’d be a hair over average, but on her small frame, they seem positively mountainous. Fortunately for her, she’s got a big, ripe belly to support them.");
	output("\n\nAzra pans the light around, gasping when she sees a cluster of gray, tubular structures sprouting through a hole in the floor. They’ve grown in a thick ring, several feet across. The ones in the center are the tallest and the widest. Motes of some kind of pollen or spores float around them. Closer to the floor, obvious teeth-marks show where pieces have been bit off and consumed wholesale.");
	output("\n\n<i>“Oh... you really don’t want to fuck?”</i> the raskvel sounds almost put out. <i>“You really just wanted my motherhusk stash?”</i> She lifts an ear to expose a boob, then slowly circles the areole with a finger. Somehow, she makes it look sulky. <i>“But I got all worked up watching you get here.”</i> She gestures to a flickering monitor, then at the crinkled, firm tips of her tits. Beneath her, the deck is glossy with feminine lube. <i>“And it’s so hard to reach my cuuuuunt.”</i>");
	output("\n\nAzra looks at the raskvel, then jerks her head away, trying not to give in to the display of wanton sexuality. <i>“Like [pc.name] said, we wanted to trade for the motherhusks.");
	if(flags["RASKDOOR_BROKE"] != undefined) output(" I’ll reimburse you for the door.");
	output(" If you’d like, I can offer you some credits for the samples I’ll be taking, but I will be taking them. This is a rare species with properties that can advance the galaxy as a whole.”</i>");
	output("\n\n<i>“Fuck your credits,”</i> the short-stacked raskvel says. <i>“Get over here and fuck me if you want to give me something.”</i>");
	output("\n\nAzra shakes her head once more. <i>“Sorry, but I’d prefer to keep my amorous intentions for those I’ve developed a relationship with, not new acquaintances, no matter how... attractive.”</i> She kneels next to the husks and retrieves some gloves from her pack. <i>“[pc.name] might be willing to help you out. [pc.HeShe] seems like [pc.heShe]’d be a capable lover.”</i> Azra’s tail swishes playfully behind her. <i>“Harvesting these properly will take some time. Feel free to indulge yourself if the urge strikes.”</i>");

	//High intelligence
	if(pc.IQ() >= 70) output("\n\nYou note that Azra has placed her Codex on the ground in such a way that the raskvel is well-illuminated. Perhaps she intends to sneak a peek of at any potential action... or record it for later viewing.");
	//Merge
	output("\n\n<i>“Whaddya say? [pc.name], right? I promise we could have so much fun.");
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(700) >= 0) output(" My pussy’ll be the perfect sleeve for that dick.");
		else output(" I don’t care if you’re too big to fit inside a little thing like me. I wanna taste it!");
	}
	else if(pc.hasVagina()) output(" I could probably cum just from you straddling my face.");
	else output(" We could make out while you rub my belly, and I bet I’d still cum.");
	output("”</i> Her hips quiver, grinding her swollen mound against the diamond patterned deck plates. <i>“I’ll be the perfect, pregnant fucktoy!”</i>");

	//Bimbo -disable non-sex options if PC has genitals.
	if(pc.isBimbo()) output("\n\nYou look her up and down. It’d be better if she had a dick, but you can hardly turn down the chance to tangle tongues with such a petite cutie.");
	//Bro
	else if(pc.isBro()) output("\n\nJob complete and a free lay as a prize? Fuck yeah. You resolve to plow the kobold cutie so well that Azra lines up for the next round.");
	//Else high libido or lust
	else if(pc.libido() >= 70 || pc.lust() >= 60) output("\n\nThat’s a hard offer to turn down. Your loins burn at the offer, and Azra is going to be busy for a few minutes... just enough time to get your rocks off. A quick bang will be... preparation for the trials to come.");
	//Else low lust
	else if(pc.lust() < 33) output("\n\nThe offer is tempting enough to stir your otherwise slumbering passion. Taking her up on it wouldn’t be a bad way to pass the time.");
	//Else normal lust
	else output("\n\nThere’s not much else to do, and Azra doesn’t seem to mind. Now would be as good a time as any to blow off some excess steam.");
	processTime(10);
	pc.changeLust(5);
	//[Fuck Her] [Hyper Fun] [Face Ride][Wait it Out]
	clearMenu();
	if(pc.biggestCockVolume() > 700) addButton(1,"Hyper Fun",hyperRaskFun);
	else addDisabledButton(1,"Hyper Fun","Hyper Fun","You need a huge penis for this.");

	if(pc.hasCock() && pc.cockThatFits(700) >= 0) addButton(0,"Fuck Her",fuckDatRaskipoo,undefined,"Fuck Her","Her womb may be full, but her pussy isn’t.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You’re too big to fit inside.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You have no penis to fuck her with.");

	if(pc.hasVagina()) addButton(2,"Face Ride",faceRideTheRaskPreg);
	else addDisabledButton(2,"Face Ride","Face Ride","You need a vagina to rub on her face for this.");

	addButton(3,"Wait It Out",waitOutPregRask);
}

//Wait It Out
public function waitOutPregRask():void
{
	clearOutput();
	showPregRask();
	showName("\n...SUCCESS?");
	output("<i>“No thanks,”</i> you tell the pregnant raskvel. <i>“But don’t let me stop you from enjoying yourself.”</i>");
	output("\n\nThe feather-haired lizard-girl rolls her eyes. <i>“Suit yourself, sweet stuff.”</i> She brushes her ears out of the way and wraps her fingers around her pregnancy-swollen teats, rolling the tender nubs in her fingers. Meanwhile, her tail curls around to stroke the taut skin of her belly. It slips and slides all over the fecund dome, and it must feel good for how she moans. Yet the rask doesn’t push herself. Laconic movements and gentle strokes are the order of the day. She’s not working toward an orgasm; she’s playing her body like an instrument, riding the edge of ecstasy without plunging over into an exhausting orgasm.");
	output("\n\nYou pull up the extranet on your Codex and try ignore the rask’s pleasure-soaked vocalizations. Azra seems to be doing the same as she intently picks over the plant growth.");
	output("\n\nAlmost twenty minutes pass like this, though four or five in, the raskvel’s tail took a journey beneath her thighs, and her moans jumped up an octave. You couldn’t keep your eyes from watching, not with a plump, purple mound having its doubled clits stroked by a mischievous tail. It’s almost hypnotic. You wonder how much time this raskvel spends pregnant. From the way she greeted you on the intercom, she probably has a line of suitors that check back from day to day, hoping for a chance to sire her latest litter.");
	output("\n\n<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
	output("\n\nThe only thing coming after you is the pregnant raskvel. She does so quite loudly.");
	processTime(22);
	flags["PREG_RASK_GUARD_RESULT"] = -1;
	clearMenu();
	addButton(0,"Next",spunkShroomTrapQueen);
}

//[Hyper Fun]
//Crown fellating followed by hugjob, shaftlicking, and a stcky shower.
//Make sure to set x to biggest and add to parser calls. Kthnx, futureFen.
public function hyperRaskFun():void
{
	clearOutput();
	showPregRask();
	var x:int = pc.biggestCockIndex();

	//Crotchcovered:
	if(!pc.isCrotchExposed())
	{
		output("The second you begin to unwrap your concealed cock, the raskvel’s eyes go wide. She leans closer, nostrils flaring and sniffing, her nipples visibly perking. Her lips purse as she struggles for words. Then your [pc.cock " + x + "] flops out in all its immensity, ");
		if(!pc.isErect()) output("half-turgid and growing under her spellbound gaze");
		else output("massively turgid, the veins pumping beneath her spellbound gaze");
		output(". She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
	}
	//Uncovered
	else
	{
		output("The second you bring your proudly-displayed member toward the pregnant raskvel, her eyes go wide. She leans closer, as much as her bloated frame will allow, nipples visibly perking. Her lips purse as she struggles to find the words. Proud of the effect you’re having on her, you switch your hips forward, bouncing ");
		if(!pc.isErect()) output("the half-turgid dick before her as it slowly inflates, locking her spellbound gaze to the inhumanly thick veins");
		else output("the massively engorged dick before her as the inhumanly thick veins throb and ache for penetration.");
		output(" She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
	}
	//merge
	output("\n\n<i>“W-wow. It’s so big.”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
	if(pc.cumQ() >= 40 && pc.cumQ() < 500) output(", leaking a fat drop of pre-cum onto her wrist");
	else if(pc.cumQ() >= 500) output(", drooling a stream of pre-cum all over her wrist");
	output(". Her expression sours. <i>“I wish I wasn’t pregnant.”</i> Tiny hands grab you just behind the [pc.cockHead " + x + "] and gently tug you closer.");
	output("\n\nYou let them.");

	output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
	if(pc.isTreated() || pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.hasPheromones()) 
	{
		output(", and from how she whimpers after every breath, she likes it. When she pauses and sniffs deeply, her tiny frame shudders in response to the hyper-concentrated dose of pheromones");
		if(pc.isTreated()) output(". You silently praise whoever invented the Treatment");
	}
	output(".");

	output("\n\nFrom behind you, you hear a clattering sound as Azra drops a tool.");

	output("\n\nSoft lips are on you before you can check to see if she’s okay. They press against the meatiest part of your [pc.cockHead " + x + "], already slick with spit and eager to touch every part of your sensitive maleness. Tingling bolts of pleasure shoot through your sensitive mast as the miniature succubus’s fingers work over the skin, teasing and testing it");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output(", dancing across the pronounced medial ring");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output(", admiring the smooth taper of the shaft");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE || pc.hasCockFlag(GLOBAL.FLAG_NUBBY,x)) output(", lovingly circling around every little nodule");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_SUULA) output(", slipping through the wiggling tendrils, one at a time");
	else if(pc.hasKnot(x)) output(", palming at the uninflated weight of your [pc.knot " + x + "]");
	else if(pc.hasStatusEffect("Genital Slit")) output(", tenderly exploring a genital slit that seems too small for the totem pole sliding out of it");
	else if(pc.hasSheath(x)) output(", tenderly exploring the musky folds of your sheath");
	output(".");
	if(pc.cumQ() >= 500) output(" Your body responds by oozing a steady flow of pre into her maw, feeding her biological proof that she’s a world-class cock-sucker. She savors it with gusto.");
	else if(pc.cumQ() >= 50) output(" Your body responds by dribbling pre into her maw, providing biological evidence that she’s a world-class cock-sucker.");

	output("\n\nThe raskvel’s hungry eyes pop open abruptly, and she breaks her dick-licking kiss to look up at you. Her hands, fortunately, do not stop their worship. <i>“Can I collect your cum?”</i> Her eyes are eager and earnest. <i>“I... there’s a bucket.”</i>");
	if(pc.cumQ() >= 50) output(" She licks stray pre from her lips, though the effect is more to smear it across the bottom one like lip gloss.");
	else output(" She licks her lips");
	output(" <i>“And I want to have your babies. After these.”</i> She lifts your dick with both hands, grunting with the effort, then feathers kisses along the underside of your shaft");
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output(", sucking on the soft, feline “barbs” one at a time");
	output(". <i>“You’re the best daddy I’m ever going to meet.”</i>");

	output("\n\nYou doubt you could stop her from gathering some if you wanted to.");
	if(pc.isBro() || pc.libido() >= 75) output(" Besides, a hidden part of you thrills at knowing this waddling baby-factory is going to play host to your children. Maybe she even has a system to preserve your cum, so she can pump out litters of little Steeles for years to come.");
	output(" <i>“");
	if(pc.isBro()) output("Go ahead,”</i> you grunt.");
	else if(pc.isBimbo()) output("Like, O-M-G that would amazalicious!”</i> you cheerily exclaim, happy to feed her all the dick she could ever want.");
	else output("Just stop teasing me, and you can do whatever you want with the cum,”</i> you implore, hips shuddering. Her fingers are too damned good at their job.");

	output("\n\nThe raskvel giggles. <i>“" + pc.mf("You boys are so easy.","A few strokes to the dick, and you get so generous.") + " Don’t worry. If there’s one thing I know, it’s how to make a cock feel good. Well, that and how to remodulate an ionic conductor for usage in a particle cannon, but getting knocked up is wayyy more fun!”</i> She’s back on your [pc.cock] as soon as you finish, pulling it - and you - closer so that she can recline. So positioned, the pregnant raskvel is able to grind you against her belly and thread you through her tits, smearing your ");
	if(pc.cumQ() < 500) output("oozing");
	else if(pc.cumQ() < 1000) output("streaming");
	else output("all but gushing");
	output(" pre across her soft-scaled skin.");

	output("\n\nShe grabs a bucket from under the console while you adjust to the sudden onslaught of friction. <i>“Goddamn, that is some premium dick,”</i> the raskvel coos. She grabs one enormous ear and lays it across the top left side of your member. The inside is velvety soft warm. The other falls onto the other side a second later. <i>“I swear I can feel your dick all the way in my ovaries.”</i> Her legs tremble. <i>“Like they know I’m rubbing your big, fat, alien cumstick right next to them.”</i>");
	output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead " + x + "], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her legs twitch with pleasure, trying to thrust her nearly-immobilized form against something, anything to get a little friction on her twat.");
	output("\n\nYou know how she feels. Your [pc.cock " + x + "] is violently throbbing from the treatment. Your heart hammers in your chest with alarming rapidly. All you want is her to stroke a little faster, squeeze a little tighter, and you could cum. Orgasm is so close you can feel it, and the raskvel surely can too with how your large [pc.cockHead " + x + "] swells.");
	if(pc.hasCockTail()) output(" Your [pc.cockTail] slithers down behind and slams into her well-used cunt, but it still isn’t enough. You need more.");
	output("\n\nTwo alien feet press down on your [pc.knot " + x + "] from either side, toes squeezing. They’re slipping from all the girlcum on the floor, making her grip tenuous. Better still, her quaking thighs make them shudder like they’re strapped to a high-powered vibrator. You groan and thrust forward, slamming your dicktip against her cerulean lips, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
	output("\n\nThe dam breaks, and you erupt into the raskvel’s maw.");

	var cummed:Number = pc.cumQ();
	//Cum variants! - no new PG
	//Nojizz! - ANGER leads to the dark side.
	if(cummed < 5) 
	{
		output("\n\nWhen your oversized organ does nothing but spasm climacticly, the purple-scaled mynx’s expression sours, her passion calming in the face of an orgasm with nothing more than a small, tongue-moistening dribble of [pc.cumNoun].");
		output("\n\n<i>“That’s it?”</i> the raskvel says, gesturing wildly. <i>“All that effort and you barely get me half a dozen orgasms, and enough jizz to impregnate an ant? How dafuck am I supposed to get knocked up when ");
		if(pc.balls > 1) output("your balls are");
		else if(pc.balls == 1) output("your ball is");
		else output("your body");
		output(" is more dried out than sydian’s sense of humor? It’s like you bolted a fucking a giant, discount dildo on your crotch.”</i> She windmills her tiny fists in irritation, screaming, <i>“GET YOUR SHIT AND GET OUT! Fucking... fake-ass dick-having off-world losers!”</i>");
		output("\n\nMaybe if you had some time to rest, you would’ve had a better load for her. Too late now.");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
	//<50jizz - spit into bucket, a little disappointed but not mad. Recommends you eat some spunkshrooms.
	else if(cummed < 50)
	{
		output("\n\nA few powerful, mouth-filling spurts spray out of your oversized organ, packing themselves deep into the raskvel’s cheeks. She shudders, cunt-leaking in sympathetic orgasm, but somehow, she doesn’t swallow. Instead, her feet pump you harder, milking the last few dregs into her maw.");
		output("\n\nWhen she’s sure she’s harvested every drop, her hands and feet release your ");
		if(!pc.hasStatusEffect("Priapism") || pc.libido() >= 80) output("slowly deflating meat");
		else output("still-hard cock");
		output(". She leans to the side, grabs the bucket, and spits out your wad without a hint of shame. Only then, does she have a moment to reflect on what happened. <i>“Not too bad, star-stuff.”</i> She licks the residue from her lips and noisily swallows. <i>“Bet it must be some virile stuff, to come all the way out of that big, swinging dick of yours.”</i> Kissing the top of your cock like a favorite pet, she smiles. <i>“You did real good.”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
	//< 200 jizz - get mouthful, then aim rest into bucket. Polite thank you.
	else if(cummed < 200)
	{
		output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. Still latched onto your [pc.cockNoun " + x + "], the gravid girl takes it like a champ, swallowing noisily even as her pussy fountains clear girl-cum onto the floor. With shuddering hands, she grabs the bucket, swapping it into place just before your next squirt can take her in the face. You’re forced to watch your orgasm shoot into the rustic vessel, spurt after spurt puddling in the bottom while slippery soles work your [pc.knot " + x + "] to squeeze out even more.");
		output("\n\n<i>“Ah-ahhh yes!”</i> the gravid girl cries, shuddering again and again. You swear you can feel her strained stomach ballooning in response to the loads pumping through your urethra, so close by. <i>“Just like that!”</i> She twists her feet in half-circles, stunning you with hellish pleasure to help you leak out a few last drops. Only then does she let you go and put the bucket back on the floor.");
		output("\n\nA face blushed nearly pink greets you, illuminated with a cum-splattered smile and bright, pleased eyes. <i>“That was really nice. Really nice.");
		if(flags["RASKDOOR_BROKE"] != undefined || flags["RASKTURRETS_BROKE"] != undefined) 
		{
			output(" Almost enough to make up for breaking my ");
			if(flags["RASKDOOR_BROKE"] != undefined) output("door");
			if(flags["RASKDOOR_BROKE"] != undefined && flags["RASKTURRETS_BROKE"] != undefined) output(" and ");
			if(flags["RASKTURRETS_BROKE"] != undefined) output("turrets");
			output(".");
		}
		else output(" Almost as good as popping out your eggs is going to be.");
		output("”</i> She pats your dick affectionately. <i>“I think there’s enough for three or four pregnancies there, if I’m smart about it, but I bet you’d rather I just poured it all with a funnel first chance I get, wouldn’t ya, " + pc.mf("stud","slut", true) + "?”</i>");

		if(pc.isBro()) output("\n\nYou nod vigorously, wishing you could watch her do it.");
		else if(pc.isBimbo()) output("\n\nYou giggle and shrug. Like, cum is great no matter how it slides into you!");
		else output("\n\nYou shrug nonchalantly, a little tired.");

		output("\n\n<i>“Well I’m a raskvel, and that means I’m smarter than the stingy yellow shark over there, and everybody else on this dustball of a planet.”</i> The raskvel thumps her fist proudly against her chest. Her exposed tits jiggle, glossy with sweat. <i>“I’ll ration it out. Maybe even mix it in with some raskvel nut if I think it needs a little help. I’m going to get so pregnant from you so many times, just you watch.”</i>");
		//[Next] with the same text as previous
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
	//< 1000 jizz - get mouthful+facial, then collect rest in bucket while blind.
	else if(cummed < 1000)
	{
		output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. The gravid-girl’s mouth can’t even contain it all. She’s forced off your dick by the heated flow and takes the rest square in the face. Ribbons of [pc.cumNoun] cascade down her cheeks. [pc.CumGem] droplets dribble from her chin, but the raskvel still manages to remember her bucket and lift it into place, even while she’s trying to swallow her leftover mouthful. You can’t see her face with the spooge-vessel thrust in front of it, but you can hear her moans imploring you to give her more.");
		output("\n\nStrangely, she seems to be getting off on it. Every time your [pc.cockNoun " + x + "] shoots a flood of [pc.cumNoun] through its urethra, you can feel her strained belly pressing back harder against you, as if the mere presence of sperm nearby is enough to make her reproductive system accelerate. Squirts of girlcum hit your [pc.feet] as she quivers, making her tiny soles pump your [pc.knot " + x + "] harder, squeezing even more of your potent fluids into the bucket.");
		output("\n\n<i>“Holey fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“You’re gonna get me pregnant for weeks, " + pc.mf("stud","slut", true) + "!”</i> The bucket sloshes higher as you spend the last of your liquid passion. She sets it down, giving you a good look at her [pc.cumColor]-painted maw. Streams of [pc.cumVisc] [pc.cumNoun] hang from her chin, and she’s constantly blinking her gunked-up eyes to try and see. <i>“I think my ovaries might have mutated again. Something definitely happened down there. I bet when I get pregnant with your kids, I’ll have even more. My current record is fifteen.”</i> An absurdly proud smile appears beneath the layer of sexual filth.");
		//[Next] -> same text as previous
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
	//< 3000 jizz - get mouthful+facial+plastered hair, then collect rest in bucket
	else if(cummed < 3000)
	{
		output("\n\nAn immense, mouth-flooding squirt sprays out of your oversized organ - and directly past her lips. She’s forced off your dick by the eruption of [pc.cum] with her cheeks bulging wider than a squirrel’s and a shocked look in her eyes. It doesn’t last long, not when the rest of your spermy shot goes across her nose, cheek, and forehead, all the way up into her ");
		if(pc.cumColor() != "blue") output("once-");
		output("blue hair. Her arms flail around for the bucket, but by the time she gets it in front of your [pc.cockHead " + x + "], she’s entirely drenched.");

		output("\n\nYou’ve only just begun to climax, spilling more virile liquid into the bucket than this raskvel likely sees in a month. She’s loving it too. You can tell by the way she squirms below you, her feet quivering on your [pc.knot " + x + "] whenever another pulse of [pc.cumNoun] passes through your urethra. Cunt-juice splatters the floor. The messy-little kobold is apparently quite the squirter. Stranger still, it seems like her belly gets bigger the more you go off, like having that much jizz that close to her womb is enough to make her reproductive system go into overdrive.");
		output("\n\nHigher and higher, the cummy tide rises in the bucket, sloshing. As it reaches near the lip, your shots cause some to splatter out on the raskvel mother’s tits, a sight erotic enough to help you squirt an extra time or two - just enough to fill it to the top.");
		output("\n\n<i>“Homyfuckinggoddamn that is a lot of cum!”</i> The pregnant lizard-girl tries to set down the bucket, but a few cupfulls slosh out in the process. She giggles and shovels some into her mouth, completing the image of a completely debauched cum-slut. <i>“And it tastes so strong! You’re going to give me babies for months, you know that right?”</i> She smears more cum on her stomach, making the scales there shine. <i>“You’re my primo baby-daddy. Gonna put more raskvel on this planet than a whole generation of rask boys.”</i> She kisses your dick, then hugs it passionately.");
		output("\n\n<i>“You and your cock are welcome here anytime. Just walk in and shove anybody else out of the way, because you are my number one lay from now on, got it?”</i> the smutty broodmother jabs a finger in your direction. <i>“I’m ");
		if(flags["RASKDOOR_BROKE"] != undefined || flags["RASKTURRETS_BROKE"] != undefined) 
		{
			output("almost glad you smashed up my ");
			if(flags["RASKDOOR_BROKE"] != undefined) output("door");
			if(flags["RASKDOOR_BROKE"] != undefined && flags["RASKTURRETS_BROKE"] != undefined) output(" and ");
			if(flags["RASKTURRETS_BROKE"] != undefined) output("turrets");
			output(".");
		}
		else output("so glad you decided to force your way in here to meet me.");
		output("”</i>");
		//Next -> same as other cummy epilgoues.
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
	//< 10000 jizz - choke on jizz, + full body drench, and bucket overflows.
	else
	{
		output("\n\nAn immense, overwhelmingly virile stream issues forth. The tide of jism instantly balloons the raskvel’s cheeks to comical proportions, then blows her off the end of your dick entirely. Unbound, semen sprays across her features. First, it drenches her shockingly parted lips, then splatters across her cheek so hard that it coats everything from the bridge of her nose the curve of her jawline. [pc.CumGem] dribbles from her chin as her jaw works to swallow the first [pc.cumFlavor] mouthful, but you’re far from done. Your [pc.cock " + x + "] bucks like a raging bronco, and the hose of seed takes her across the forehead for a moment before soaking her hair.");
		output("\n\nIn desperation, the semen-coated lizard scrabbles for her bucket. She gets it up in time to catch your second shot - most of it anyhow. It fills with alarming rapidity, something that clearly delights the raskvel from how she moans and squirts intermittently. While you fill the bucket, the constant caresses coaxing ever more from your body, you realize that her belly is getting larger. You aren’t sure why or how, maybe her hyper-developed reproductive system can tell that gallons of virile seed are flowing by, just inches away, packed into your highly-pressurized urethra. Maybe she’s so eager to funnel all that [pc.cumVisc] [pc.cumNoun] into her snatch that she’s accelerating her pregnancy through willpower alone.");
		output("\n\nMaybe the motherhusks have turned her into a baby-making machine.");
		output("\n\nYou don’t really care either way, not when she’s still wringing your [pc.cock] with those lovely ears of hers, jacking your [pc.knot " + x + "] with her feet, and begging you to keep cumming. When your [pc.cum] sloshes over the edge of the bucket, you groan in delight. It slips out of her fingers not long after, all but forgotten on the floor. She’ll be glad when she realizes it didn’t tip over, though more than half of her precious baby batter spilled to the floor.");
		output("\n\nNo matter. You dump load after load onto her tits, first left, then right. Once they’re sufficiently soaked (with a small lake in her cleavage), you turn your attention south to her belly. The fecund dome is soon takes on the appearance of a well-glazed pastry, with trickles of [pc.cumColor] icing dripping down the sides.");
		output("\n\nStill, she begs, <i>“My pussy!”</i>");
		output("\n\nYou violently yank your cock out of her hands and shove it low, right up against the lips of her double-clitted pussy. The nubs press down on your [pc.cockHead " + x + "] from either side as the lips yield to the torrents of spooge you push out, cream-filling her passage in one blissful squirt. Her plugged-up cervix won’t let her take any more, so you pull back and jack the last few squirts from your dick onto her puffy mound, letting the excess drip off her thighs.");
		output("\n\n<i>“S-so much fucking cum!”</i> the raskvel screams, violently orgasming one last time as she smears the dregs of your climax across her taut tummy. <i>“It’s everywhere.”</i> She looks dazedly at the bucket. It’s almost as filthy with your jism as she is. <i>“I think I love you.”</i> The declaration is whispered tiredly, but there is no hint of deception in her voice. To her, you’re clearly the perfect mate.");
		output("\n\nHer lingering declaration hangs heavy in your mind. <i>“");
		if(pc.isBimbo()) output("Awww, you’re a super good fuck yourself. I’d fill your pussy any time!");
		else if(pc.isBro()) output("You’re not so bad yourself,”</i> you grunt. <i>“Not bad.");
		else if(pc.isNice()) output("You’re amazing, though I don’t think I’m ready to drop the ‘L’ word myself.");
		else if(pc.isMischievous()) output("You’re not bad yourself, little lady. I’d knock you up any day of the way.");
		else output("You love my dick,”</i> you explain, shaking it at her. <i>“But thanks anyways. I know it can have that effect.");
		output("”</i>");
		output("\n\n<i>“Do you have any idea how many babies you’re going to give me?”</i> She scoops cum out from between her tits, then dumps it in the bucket. <i>“You’re going to father to a whole generation of virile, big-dicked raskvel boys.”</i> After a moment of thought, she adds. <i>“You should come back. Next time, I can be the cum-bucket.”</i>");
		output("\n\nSomehow you doubt she’s capable of making that many children, but it brings a smile to your face all the same.");

		//[Next] -> to usual outro, but with new dialogue:
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame,cummed);
	}
}

public function hyperFunPostGame(cummed:Number = 0):void
{
	clearOutput();
	showAzra();
	showName("\nSUCCESS!");
	if(cummed < 5)
	{
		output("<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
		output("\n\nThe only thing coming after you is the pregnant raskvel’s taunts. <i>“You see this bucket? This is where I’d keep your spunk... if you had any!”</i>");
	}
	else
	{
		output("<i>“All done.”</i> Azra’s voice pulls you from your thoughts. The big suula gal shoulders her pack, samples secured, and tries to hide her blushing face behind her sunset-hued locks. It almost works. <i>“Let’s get out of here before something comes in after us.”</i>");
		if(cummed < 3000) output("\n\nThe only thing coming after you is the sound of the pregnant raskvel’s voice through the intercom. <i>“Thanks again for visiting. Come back real soon, okay? I’ll make sure to tape the birth for you~!”</i>");
		else
		{
			output("\n\n<i>“Thank you so much for all the cum! I’m going to record the births, every one of them, then post them on the extranet. People in the core actually pay to watch! Look me up sometime.”</i>");
			output("\n\nYou’re pretty sure Azra facepalms, even though she’s crawling behind you on her hands and knees.");
			output("\n\n<i>“And come back soon. Fresh cum is so much better!”</i>");
		}
	}
	processTime(10);
	flags["PREG_RASK_GUARD_RESULT"] = 1;
	clearMenu();
	addButton(0,"Next",spunkShroomTrapQueen);
}

//Fuck Her
//"Her womb may be full, but her pussy isn’t."
public function fuckDatRaskipoo():void
{
	clearOutput();
	showPregRask();
	var x:int = pc.cockThatFits(700);
	if(!pc.isCrotchExposed()) 
	{
		output("You hurriedly free your [pc.cocks] from ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" irksome confinement. The long-concealed flesh springs free and rapidly engorges before the raskvel’s eyes.");
	}
	else
	{
		output("You casually grasp your [pc.cocks] and shake ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" at the horny raskvel.");
	}
	output(" She smiles wide with licentious intent, licking her blue-painted lips and tossing her downy hair.");

	output("\n\n<i>“You gonna stick it in?”</i> The purple-scaled lizard rolls to the side, lifting one leg high into the air to reveal an obscenely swollen cunt, flanked by bright pink, marble-sized clitties. The folds themselves are thick and juicy, dribbling eager pussyjuice across the floor. No matter how many birth’s they’ve passed, they’re plush enough to squeeze down on a pinky, let alone your [pc.cock " + x + "]. <i>“Or are you just teasing a poor, immobile rask girl?”</i> She grabs her ankle and pulls her leg higher until her lips part, releasing a small gush of lube. <i>“Maybe aliens are just shy...”</i>");
	//Very tall.
	if(pc.tallness >= 6*12+6) 
	{
		output("\n\nHardly. She’s just so small. Getting a huge creature like yourself to line up with that slobbering slot takes significant effort and a small amount of engineering. Between shoving a few cushions under her ass and awkwardly squatting down, you make it work.");
		if(silly) output(" Life... uh... finds a way.");
	}
	//Else
	else
	{
		output("\n\nHardly. You squat down to line yourself up, nearly slipping in the leaking girlslime in the process.");
	}
	//Merge
	output("\n\n<i>“...Maybe you’re just afraid of a little raskvel pussy. Like you know you’ll be lining up at my door day after day once you taste it,”</i> the sultry tart suggests.");
	output("\n\nGrabbing her belly to brace yourself, you thrust inside. ");
	if(pc.cockVolume(x) < 300) output("Her pussy parts easily around your [pc.cock " + x + "], and her diatribe cuts off with a high-pitched squeak of pleasure.");
	else if(pc.cockVolume(x) < 500) output("Her pussy reluctantly parts for your [pc.cock " + x + "], clutching it tightly as her diatribe cuts off with a high-pitched squeak of pleasure.");
	else output("Her pussy strains to accept your girthy tool, its thick lips stretched wide enough to pass an egg. A high-pitched wail of pleasure interrupts the little slut’s diatribe at the penetration. Evidently she’s a fan of pushing herself to the absolute limit.");
	output(" That saucy slot feels lovely wrapped around you. Her folds are absolutely soaked, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
	pc.cockChange();
	var y:int = pc.cockThatFits2(700);
	//2
	if(y >= 0 && pc.cockTotal() == 2)
	{
		output("\n\nMeanwhile, your second dick rubs against her slippery crease of her thigh, pressing its [pc.cockHead " + x + "] up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows it to glide effortlessly against her, right up until she wraps her fingers around it to give it a tug. <i>“I see you brought extra for the rest of me. How thoughtful...”</i> Her fingers twist and swirl while her cunt clenches.");
	}
	//More
	else if(y >= 0)
	{
		output("\n\nMeanwhile, your extra dicks rub against the slippery creases of her thighs, pressing their turgid tips up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows them to glide effortlessly against her, right up until she grabs ");
		if(pc.cockTotal() == 3) output("both of them");
		else output("two of them");
		output(" to give them a tug. <i>“I see you packed enough to share. How thoughtful...”</i> She pumps both hard. <i>“I could use a facial.”</i>");
	}
	//Merge
	output("\n\nWhatever your floor-bound partner may think, you hold all the cards. You’re the one doing the fucking, looming over her. You’re the one who moves her thigh to make the muscles inside her twat clamp down tighter on your rod. She can whimper, her hands caressing your body in ways that make you groan, but there’s nothing she can do to change your tempo, nothing she can do to give her pause when you pound her drooling cunt hard enough to make her chirp out an orgasm.");
	output("\n\nYou’re just getting warmed up. You hammer her well-used cunt with powerful strokes. When you pull back, ropes of girl-jizz spatter the floor, hanging off your [pc.cock " + x + "] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. You can’t tell if she’s cumming over and over, or if she just can’t handle how good it feels to have her pregnant pussy taken by a talented lover. You like it either way.");
	output("\n\nBehind you, Azra grunts in what you take for irritation, but when you glance back, you see she’s popped the release on her crotch to let an absolutely enormous suula-cock dangle out. She’s hard and leaky, but she’s still doing her best to harvest the motherhusks. In her hurry, a piece cracks apart into dust, motes of it falling down over her exposed groin. She doesn’t seem to notice, and returns to gathering the rest.");
	output("\n\nA powerful, seismic clench yanks your attention back to the lizard-girl in front of you. She’s smiling saucily, her tail lashing back and forth. It ");
	if(pc.balls > 1) output("cradles your balls, then wraps around them with surprising tenderness. The warm cocoon of scaly flesh makes it seem almost too easy to spill your load.");
	else if(pc.hasVagina()) output("teasingly wanders over your slit, then slips inside. The slippery scales inside you make it almost too easy to spill your load.");
	else output("slips back to tease your [pc.asshole]. At first, it’s playfully circling, but after a particularly forceful thrust on your part, she slides it in. The pressure on your prostate makes it seem almost too easy to spill your load.");
	output(" One errant thought and you’ll be giving her an enormous, cunt-bathing creampie.");

	output("\n\n<i>“You know, if you give me enough c-cuuUUUM~! ...I can save some to get pregnant with after this batch.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me ever bigger. Think about it. Your own little egg-slut, saving your cum so she can get knocked up again and again.”</i>");

	output("\n\n");
	if(pc.isBro() || pc.libido() >= 75) output("Fuuuck that’s exactly what you want to do. You want to strap her to the wall in your ship and dump endless loads into her, using her as equal parts sex-toy and virility measuring stick. Maybe you might even get her some mods or an exoskeleton to let her get around the ship. In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses...");
	else 
	{
		output("You feel like you ought to be a little worried or disgusted about such brazen usage of your sexual fluids, but your body isn’t. Your traitorous rod");
		if(pc.cockTotal() > 1) output("s love");
		else output(" loves");
		output(" the idea of siring a whole clan of horny fuck-lizards. She’s tickled your most basic, unthinking instincts in ways that make your [pc.cockNoun " + x + "] throb and your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("crotch");
		output(" clench.");
	}

	output("\n\nYou bury yourself deep and unload. There’s no other option. The climax is entirely beyond your control, more a sudden venting of pressure than anything you have to work for. The pregnant raskvel’s oozy, clutching slit squeezes it out of you in ");
	var cummies:Number = pc.cumQ();
	if(cummies < 5) output("weak trickles");
	else if(cummies < 25) output("fat globs");
	else if(cummies < 175) output("thick streams");
	else if(cummies < 1000) output("enormous gushes");
	else output("titanic waves");
	output(", her well-used form wringing your [pc.cockNoun " + x + "] for all its worth. Her cunt a warm, wet heaven, clutching you tightly, drowning you in ecstasy in pussyjuice alike");
	if(cummies >= 2000) output(" while your pressurized seed vents back out all over the floor");
	output(". You shudder and groan with each successive spurt until your dick finally goes dry. Even then, the scaled vixen’s tunnel massages you pleasantly, begging you to stay inside and enjoy the post-coital massage.");

	output("\n\n<i>“All done?”</i> Azra asks from over your shoulder.");
	output("\n\nWhen did she get back there? Her dick is packed away and the samples safely holstered in her bag.");
	output("\n\n<i>“Yeaaahh,”</i> you offer, trying to suppress a groan as you pull yourself free from your egg-obsessed lover. Your [pc.cockNoun " + x + "] gleams with a fresh coat of pussy-juice while dribbles of [pc.cumColor] spooge leak from the tip. Azra’s eyes favor it with a longing look.");
	output("\n\n<i>“Then we should get going. Only one sample left!”</i> Azra brushes back her hair and turns away, giving you a moment to make yourself decent before setting off.");
	output("\n\nThe purple-scaled cum-dump on the floor grins giddily, stirring your offering around inside herself with a finger. She doesn’t seem like she’ll be talking just yet.");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cameInRaskSlut,cummies);
}

public function cameInRaskSlut(cummies:Number):void
{
	clearOutput();
	showAzra();
	showName("\nSUCCESS!");
	output("As you travel back through the tunnel, the comms click on once more. <i>“");
	if(cummies < 100) output("Heyyy, you were pretty good at that... for an alien. You didn’t have much cum, but if you wanna play when I’m all pregger-horny, just stop by and gimme a ring, ‘kay?");
	else
	{
		output("Heyyy, thanks again for the donation. I scooped some out to save for later, so I’ll definitely get to have some of your kids.");
		if(cummies > 1000) output(" Lots of your kids, I guess. There’s like a whole bucket of it. You’re a super good breeder, you know that?");
		output(" Anycooch, I guess you can come back and knock me up whenever you want. You’re real good at it.");
		if(flags["RASKDOOR_BROKE"] != undefined	|| flags["RASKTURRETS_BROKE"] != undefined) output(" Almost makes it worth getting all my stuff smashed up...");
	}
	output("”</i>");
	output("\n\nAzra mutters something from behind you, but when you look back, she’s facepalming.");
	output("\n\n<i>“Don’t wait too long. It’s always better fresh!”</i>");
	processTime(20);
	flags["PREG_RASK_GUARD_RESULT"] = 2;
	clearMenu();
	addButton(0,"Next",spunkShroomTrapQueen);
}

//Face Ride
//Straddle her face as she eats you out, then slip in her cuntjuice for musky fun :3
public function faceRideTheRaskPreg():void
{
	clearOutput();
	showPregRask();
	output("You advance on the immobile raskvel");
	if(!pc.isCrotchExposed()) output(", silently peeling the covers from your [pc.vaginas]");
	else output(", silently wiggling your hips to display your [pc.vaginas]");
	output(". <i>“");
	if(pc.tallness >= 5*12) output("You’re just the right height.");
	else output("I bet all the girls love seeing you stuck on your knees.");
	if(pc.hasStatusEffect("Vaginally-Filled"))
	{
		output(" Now how about you lick all the cum out of me. ");
		if(pc.isNice() || pc.isMischievous()) output("The glaze just makes it better, right?");
		else output("Sluts like you </i>crave<i> it.");
	}
	else if(pc.isNice() || pc.isMischievous()) output(" Now why don’t you put that tongue to work before my feathery friend finds an excuse to keep us apart?");
	else
	{
		output(" Now put that tongue to work, and we’ll see if you’re really keyed up enough to get off from the taste of another");
		if(pc.isPregnant()) output(" pregnant");
		output(pc.mf(" person"," woman", true) + "’s pussy.");
	}
	output("”</i>");
	output("\n\n<i>“Mmmm... been a while since I sucked pussy,”</i> the pregnant raskvel admits. Her eyes are wide and lustily locked on your slit");
	if(pc.totalVaginas() > 1) output("s");
	output(". It’d take a raskvel boy, dribbling cum and begging to fuck, to distract her for how she stares. She wants the pussy, and she wants it bad. Rocking forward, the lizard-girl strains to plant a kiss on your mound, but her pregnant bulk drags her right back, forcing her to settle down on her fattened haunches with an annoyed wobble. <i>“...Please? I can’t reach.”</i> She looks up imploringly, tugging her nipples as much for show as for her own pleasure.");

	output("\n\nYou ");
	if(pc.tallness < 5*12) output("step to the side and carefully climb up onto her console’s ledge. It’s the only way you’ll get your cunt at the right level with how short you both are.");
	else output("take a step closer.");
	output(" The violet lizard-girl smiles eagerly. Then, too fast to be seen, she worms her tongue into your [pc.vagina]. One moment, you’re inching your hips closer. The next, a thick spear of oral flesh is wriggling inside your most sensitive place. It’s a disproportionately large thing too - nearly six inches long and fat enough around to shame a few of the galaxy’s bigger races.");

	output("\n\nA sigh of delight slips from your mouth as your hips instinctively push back, pressing your lips to hers, [pc.oneClit] booping her on the nose. Your pregnant pussy-licker takes your vocalizations as encouragement and places her hands ");
	if(!pc.isTaur()) output("on your [pc.butt]");
	else output("on either [pc.thigh]");
	output(", squeezing as her luscious, blue-painted lips slip back and forth on your arousal-slickened flesh.");
	if(pc.hasStatusEffect("Vaginally-Filled")) output(" Her mouth works to swallow the cum inside. For how fast she guzzles it down, scooping more into her maw with practiced curls of her tongue, she loves it.");
	if(pc.wettestVaginalWetness() >= 3)
	{
		output(" You’re so wet that excess moisture stains your muff-mounted raskvel’s cheeks");
		if(pc.wettestVaginalWetness() >= 5) output(" and drips from her chin in small waterfalls");
		output(".");
	}

	output("\n\n<i>“Deeper,”</i> you urge, rocking back and forth on your face. Your pussy spasms around the tiny beast-girl’s rather... gifted tongue in pulsing waves that echo your own mounting ecstasy. When that wiggling organ draws back, you whimper in desperation and disappointment only to have your cry transform into a full-throated screech of pleasure once she coils it around [pc.oneClit]");
	if(pc.clitLength >= 4) output(", tugging it like a full-blown cock");
	output(". The best part of it all is just how slick and <i>hot</i> it all feels, like the nerves into your [pc.vagina] are firing so strongly that everything below your waist may as well be tongue-bathed pussyflesh.");

	output("\n\nShe knows what she’s doing, that’s for sure.");

	output("\n\n<i>“Mmmm,”</i> the short, stacked MILF moans into your cunt. Her fingers squeeze harder, claw-like nails ");
	if(pc.hasChitin()) output("scrabbling across your chitin.");
	else output("digging into your [pc.skinFurScalesNoun].");
	output(" Coils of pleasure twist through your nethers as the tongue abandons your clit and burrows deeper once more, feeling around the inside of your passage, stretching it open");
	if(pc.looseness() < 3) output(" and letting it snap back into place");
	else 
	{
		output(" and watching the [pc.girlCum] leak out");
	}
	output(".");
	if(pc.looseness() >= 4) output(" A tongue alone isn’t enough to satisfy you, however, and she knows it. Raising an arm, the purple-scaled nympho balls her small hand into a fist and thrusts it inside, twisting her neck so that her tongue can taste your oozing [pc.girlCum] while she pleases your capacious cunny.");

	output("\n\nBursts of stars explode behind your eyelids as the pleasure crashes into you. Whimpering and oozing, you shake and shudder, paroxysms of ecstasy wracking your frame, grinding your overheated slit into the cunt-smeared hussy’s blissfully unconcerned face. You dimly register the feel of her voice crying out into you, her sounds of pleasure little more than a booster rocket carrying you into orgasm-land by vibration alone.");

	//Squirter + hugecumQ
	if(pc.isSquirter() && pc.girlCumQ() >= 2000)
	{
		output("\n\nAnd there’s so much [pc.girlCumNoun]. It sprays into the raskvel’s mouth and washes down her cheeks. When she draws back to breathe, it splatters across her nose and forehead. Eventually she gives up and tips her head back, stabbing her tongue into you again and again, making your pressurized pussy spurt its fragrant liquid <i>everywhere</i>: on her tits, on her swollen belly. It even creates puddles on the floor that slowly wind their way toward a well-placed drainage grate.");
	}
	//Squirter
	else if(pc.isSquirter()) output("\n\nYou pay the soft-scaled slut back in big, wet squirts of [pc.girlCum] that run down her chin and pool in her tits. Her skill as a slit-licker demands it. Your [pc.vaginas] will accept nothing less, not when climax has you in its grip and wrings you for every drop of feminine goo you can give.");
	//Not squirter, very wet
	else if(pc.wettestVaginalWetness() >= 3) output("\n\nYou pay the soft-scaled slut back in a steady river of [pc.girlCum]. She all but purrs at the taste of it, throat bobbing in an effort to devour it all. When she sees you watching, she slurps louder, tugging on your netherlips, intent on wringing every drop of feminine lust from you before you continue on your journeys, and it’s working.");
	//Regular wet
	else output("\n\nYou pay the soft-scaled slut back in lurid moans and dribbles of [pc.girlCum]. She ravenously devours them, her tongue twirling inside you to gather it up and channel the flow directly into her maw. You hear her gulp once, then return to her work with the passion of an individual who truly loves the act of giving pleasure.");
	//Merge
	output("\n\nAs you come down, shuddering through aftershocks, you run your fingers through her feathers. They’re down-soft, and the sensation combined with the taste of your post-coital cunt sends her over the edge. She whimpers, lower lip shaking against [pc.oneClit]’s hood, and her pregnant quim goes off, splattering pregnant raskvel-honey across the deck");
	if(pc.isSquirter()) output(" to mix with your own");
	output(". She rolls part way back, enough to give your [pc.vaginas] some relief, and you gingerly separate, panting and tired in the aftermath.");
	output("\n\n<i>“Wow,”</i> you mumble, too cummed-out for words.");
	if(pc.isBimbo()) output(" There’s so much pink, cotton-candy fuzz twirling around in your head that you doubt you could complete a sentence, much less manage a witty entendre.");
	output("\n\nThe raskvel broodmother, pats her tummy. Did it get bigger? It definitely looks bigger... <i>“Mmm... that was fun. Not as fun as birth, mind you, but fun.”</i> She burps, and the scent of pussy in the air grows a little stronger.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postPregRaskLicky);
}

public function postPregRaskLicky():void
{
	clearOutput();
	showAzra();
	showName("\nSUCCESS!");
	output("A metallic click and heavy footfalls turn you away from your recent conquest. Azra has already packed away the samples, and she’s gesturing toward the tunnel back to the wastes. <i>“Only one more sample to go, [pc.name].”</i> She’s blushing heavily, eyes darting back and forth from your brazenly exposed [pc.vaginaNoun] to the raskvel’s own dewy entrance. <i>“We can’t just... fuck all day.”</i> She turns away in a hurry. Is she... walking stiffly?");
	//Bimbo
	if(pc.isBimbo()) output("\n\nSomebody’s got a boner~!");
	else output("\n\nYou get the impression she did more than just sample the mushrooms, but don’t see much point in bringing it up, not when you’re this well-fucked.");
	output("\n\n<i>“Heyyy,”</i> the pregnant raskvel’s voice bursts out of the comms above. <i>“Your pussy tastes way better than raskvel or sydian-cunt. Just let me know that you’re [pc.Miss] Superpuss if you come back, and I’ll let you right back in.");
	if(flags["RASKDOOR_BROKE"] != undefined || flags["RASKTURRETS_BROKE"] != undefined)
	{
		output(".. once I fix the ");
		if(flags["RASKDOOR_BROKE"] != undefined) output("doors");
		if(flags["RASKDOOR_BROKE"] != undefined && flags["RASKTURRETS_BROKE"] != undefined) output(" and ");
		if(flags["RASKTURRETS_BROKE"] != undefined) output("guns");

		output(". Don’t break ‘em again, please-kay-thanks!");
	}
	output("”</i>");
	output("\n\n<i>“That so?”</i> Azra muses from behind you, under her breath.");
	processTime(5);
	flags["PREG_RASK_GUARD_RESULT"] = 3;
	clearMenu();
	addButton(0,"Next",spunkShroomTrapQueen);
}

public function spunkShroomTrapQueen():void
{
	/*OLD placeholder for repeat quest!
	flags["RASKDOOR_BROKE"] = undefined;
	flags["RASKTURRETS_BROKE"] = undefined;
	clearOutput();
	output("You did it! ...well, two of the three parts, anyway. The rest isn’t coded, so the quest is reset if you want to repeat the first two parts in the first time!");
	moveTo(shipLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	*/
	actualSydianTrapQueenIntro();
}

//Spunkshroom Trapqueen
//Female Sydian Matron tending to spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage) and her two trappy raskvel boitoys.	
public function actualSydianTrapQueenIntro():void
{
	clearOutput();
	showAzra();
	showName("HUNTING\nSHROOMS");
	output("Out in the bright tarkus sunlight once more, Azra takes a minute to direct you toward the next bio-cache. <i>“Once we climb out of this depression, take a left and press forward for 437 meters. The orbital scan places our targets amongst several spires of oxidized ferrite.”</i> She sighs. <i>“With how today is going, I expect we’ll find a sydian present.”</i>");
	output("\n\nYou nod, and together you and the suula scientist set off toward the next prize. It takes you all of ten minutes to reach it.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",findPillarGrotto);
}

public function findPillarGrotto():void
{
	clearOutput();
	showAzra();
	showName("\nSOMETHING...");
	output("You identify your destination by dozens of pillars stretching high into the air, their rust-red surfaces crumbling a bit with every breeze. The tops are flat and wide, and the closer they get to the ground, the narrower they become. A few have even toppled over. When you look closer, you determine their bases have been literally chewed away. Hundreds of bite marks provide all the evidence you need to know something has been eating at them.");
	output("\n\nAs predicted, someone");
	if(!CodexManager.hasUnlockedEntry("Sydians")) output(", or something,");
	output(" lives here");
	if(CodexManager.hasUnlockedEntry("Sydians")) output(" - a sydian, no doubt");
	output(". You press forward carefully, hand on your [pc.weapon].");
	processTime(2);
	clearMenu();
	addButton(0,"Next",meetTrapQueensSubject);
}

public function meetTrapQueensSubject():void
{
	clearOutput();
	showAzra();
	showName("\nSHROOMS");
	output("Azra guides you deeper into the strange formations. Supposedly the spunkshrooms are <i>“Just ahead,”</i> like they have been for the past few minutes. Brushing the crumbling flakes from your ");
	if(pc.hasPartFur("arms")) output("fuzzy ");
	output("fingers, you mantle over a fallen pillar and bump into a very surprised raskvel girl.");

	output("\n\n<i>“Eep!”</i> she squeaks, dropping an armload of orange mushrooms. When the small lizard spins and bounds around a crumbling mound, ‘her’ true sex is revealed - by the enormous, swollen sack bouncing beneath her wildly flapping loincloth - if only briefly.");
	output("\n\nAzra crouches over the forgotten harvest. <i>“These... these are spunkshrooms.”</i> She dons gloves once more and quickly shovels them into one of her sample containers, sealing it closed with an audible hiss. <i>“The spores should be sufficient to grow my own crop. Ah... ahhh-!”</i> She sneezes powerfully, then wipes her snout with her still gloved hand.");
	output("\n\nYou look at her wide-eyed. <i>“Uhhh... aren’t the spores to stimulate... you know");
	if(pc.isBimbo()) output(", like cummies");
	else output("-");
	output("?”</i>");

	output("\n\nAzra throws the gloves aside and grabs a tissue from a compartment in her armor. <i>“I’m aware.”</i> She repeatedly wipes her nose to no visible effect. <i>“I doubt such brief exposure is cause for worry. Our skittish little friend seemed no worse for the wear.”</i>");
	output("\n\nYou think back to the sight of the girlish raskvel’s canteloup-sized sack, undeniably swollen with a tremendous load of jizz.");
	if(pc.isBimbo()) output(" You should’ve sucked him off before he got away.");

	output("\n\n<i>“Let’s get out of here,”</i> Azra grunts as she rises, shouldering her pack once more. <i>“We got what we came fo-”</i>");
	output("\n\n<i>“THIEVES!”</i> The shrill screech chills you to your bones. <i>“Lay yourselves before the mercy of the Queen if you wish to be spared.”</i>");
	output("\n\nFuck.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",trapQueenMeeting);
}

public function trapQueenMeeting():void
{
	clearOutput();
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");
	output("A tall, statuesque ");
	if(!CodexManager.hasUnlockedEntry("Sydians")) output("alien");
	else output("sydian");
	output(" rounds the corner, escorted by four feminine-looking raskvel males, the one you spooked included. ");
	if(!CodexManager.hasUnlockedEntry("Sydians")) 
	{
		output("Your Codex identifies the leader as a sydian, a race known for feasting upon metal. ");
		CodexManager.unlockEntry("Sydians");
	}
	output(" Stubby-looking weapons fit cutely into the scaly guards’ hands, though from the way they point them at you and Azra, their intentions are anything but cute. ");
	if(!pc.isBimbo()) output("Plasma or laser weapons, if you had to take a guess.");
	else output("Probably some kind laser or taser or plazer gun. Energy weapons are a lot harder to remember than types of dicks and where to rub them.");
	output(" The leader herself is covered in thick, insectile armor bulky enough to grant her an even more imposing air.");

	output("\n\nYour hand drops to your [pc.weapon]. Azra looks at you, then shakes her head slowly. You get the hint and pull your fingers back");
	if(pc.isAss()) output(", begrudgingly. It’d be easier to fight your way through this mess than grovel");
	output(".");
	output("\n\n<i>“Thieves. You have assaulted Azaphel and stolen his rightly traded goods. What have you to say for yourself?”</i> the sydian’s fronds quiver in righteous indignation.");
	output("\n\nYou could beg for forgiveness, berate the foolish raskvel and this so-called queen, or let Azra explain herself. The shark-girl looks like she has something to say.");

	processTime(3);
	clearMenu();
	//[Beg] [Berate] [Let Azra]
	addButton(2,"Let Azra",letAzraTrapQueenTalk,undefined,"Let Azra","Maybe Azra should handle this one. She’s the scientist.");
	addButton(0,"Beg",begForMercy,undefined,"Beg","Since she styles herself a Queen, perhaps begging would be your best option?");
	addButton(1,"Berate",berateTheQueen,undefined,"Berate","Fuck this. If she’s a Queen, then she’s a terrible one. Point out all the problems with this situation in no uncertain terms and hope she has enough sense not to fuck with you.");
}

public function hasAWeapon():Boolean
{
	for(var i:int = 0; i < pc.inventory.length; i++)
	{
		if(pc.inventory[i].type == GLOBAL.MELEE_WEAPON || pc.inventory[i].type == GLOBAL.RANGED_WEAPON) return true;
	}
	return false;
}

//Let Azra
public function letAzraTrapQueenTalk():void
{
	clearOutput();
	showBust("SYDIAN_QUEEN",azraBustString());
	showName("AZRA’S\nSPEECH");
	output("You nod to Azra. <i>“");
	if(pc.isBimbo() || pc.isMischievous()) output("You go, girl.");
	else output("Go ahead.");
	output("”</i>");

	output("\n\n<i>“Right.”</i> Azra clears her throat and straightens up. <i>“With all due respect, your majesty, we did not come here to steal anything. In fact, my initial scans of the area suggested that inhabitants would be at a minimum.”</i> She brushes back her hair and sighs. <i>“Azaphel ran from us the moment we encountered him, before he could say a single thing. I presumed, perhaps wrongly, that his abandonment of the mushrooms-”</i>");
	output("\n\n<i>“Spunkshrooms,”</i> the sydian queen interjects. <i>“They’re spunkshrooms. I named them.”</i>");
	output("\n\n<i>“...Yes,”</i> Azra admits, wringing her hands nervously. <i>“I assume he had no use for his... spunkshrooms when he left them behind. I gathered them, rather than let them go to waste, and prepared to leave your lands in peace.”</i> She kneels demurely, though she still towers above the pistol-packing raskvel. <i>“Nevertheless, my rash actions have brought harm to your subject. Is there some way I can make this right to you, Azaphel?”</i> She looks to the girly rask-boy. <i>“Something I can give you in exchange the mushrooms?”</i>");
	output("\n\nAzaphel glances up to the sydian for permission. She nods graciously. Emboldened, the lizard-boy suggests, <i>“You could suck my co-”</i>");
	output("\n\nThe Queen slaps the back of his head, silencing him. <i>“What Azaphel means is that a weapon would be sufficient. My army is ever in need of fresh weapons.”</i>");
	output("\n\nAzra holds up her empty hands and looks to you. <i>“[pc.name], could you part with a weapon?”</i>");
	output("\n\nOnce more, it falls to you to defuse the situation.");
	if(pc.hasEquippedWeapon() || hasAWeapon())
	{
		output(" What will you give Azra?");
		processTime(5);
		clearMenu();
		var button:Number = 0;
		if(pc.hasMeleeWeapon()) {
			if(!pc.canDropItem(pc.meleeWeapon)) addDisabledButton(button,"Melee Wpn","Melee Weapon","You cannot drop your " + pc.meleeWeapon.description + "!");
			else addButton(button,"Melee Wpn",giveQueenAWeapon,-1,"Melee Weapon.","Give her your melee weapon: " + pc.meleeWeapon.description + ".");
		}
		else if(!pc.hasMeleeWeapon()) addDisabledButton(button,"Melee Wpn","Melee Weapon","She has no interest in a rock.");
		else addDisabledButton(button,"Melee Wpn","Melee Weapon","You do not have a melee weapon on hand.");
		button++;
		if(pc.hasRangedWeapon()) {
			if(!pc.canDropItem(pc.rangedWeapon)) addDisabledButton(button,"Ranged Wpn","Ranged Weapon","You cannot drop your " + pc.rangedWeapon.description + "!");
			else addButton(button,"Ranged Wpn",giveQueenAWeapon,-2,"Ranged Weapon.","Give her your ranged weapon: " + pc.rangedWeapon.description + ".");
		}
		else if(!pc.hasRangedWeapon()) addDisabledButton(button,"RangedWpn","Ranged Weapon","She has no interest in a rock.");
		else addDisabledButton(button,"RangedWpn","Ranged Weapon","You do not have a ranged weapon on hand.");
		button++;
		for(var i:int = 0; i < pc.inventory.length; i++)
		{
			if(pc.inventory[i].type == GLOBAL.MELEE_WEAPON || pc.inventory[i].type == GLOBAL.RANGED_WEAPON) 
			{
				addItemButton(button, pc.inventory[i], giveQueenAWeapon,i);
				button++;
			}
		}
		addButton(14,"Fight",rejectTheQueen);
	}
	else 
	{
		output(" It’s a real shame you don’t have a weapon to give. Going unarmed into the Tarkus wastes? Not your best idea. <i>“I don’t have one either.”</i>");
		output("\n\nThe regal Sydian’s feathery antennae droop in disappointment. <i>“Then I suppose you’ll need to suck Azaphel’s cock.”</i>");
		output("\n\nAzaphel looks to his queen adoringly. <i>“Thank you Mistress. I’m sooo backed up. I haven’t cum in two whole hours!”</i>");
		output("\n\n<i>“I know, sweetness. Don’t be too long.”</i>");
		output("\n\nAzra blanches. Looks like you’re going to need to suck some dick.");
		//Sex options here. Might just be blowies
		clearMenu();
		addButton(0,"Get Sucking",acceptPunishmentSucky);
	}
}

//Give weapon
public function giveQueenAWeapon(slot:Number = -1):void
{
	clearOutput();
	showName("GIVING\nA WEAPON");
	showBust("SYDIAN_QUEEN","RASK_TRAP");
	var desc:String = "ERROR";
	if(slot <= -2) 
	{
		desc = pc.rangedWeapon.description;
		pc.rangedWeapon.onRemove(pc);
		pc.rangedWeapon = new Rock();
	}
	else if(slot == -1) 
	{
		desc = pc.meleeWeapon.description;
		pc.meleeWeapon.onRemove(pc);
		pc.meleeWeapon = new Rock();
	}
	else if(slot < pc.inventory.length)
	{
		desc = pc.inventory[slot].description;
		pc.inventory.splice(slot, 1);
	}
	output("You hand over " + desc + " to Azaphel, who is still rubbing the sore spot on the back of his cute little head.");
	output("\n\n<i>“Thanks, I guess,”</i> Azaphel huffs, giving you a tiny bow. He looks back over his shoulder to the Queen, his eyes wide and soulful. <i>“Are you sure she can’t suck, just a little? I’m reeeeaaaaally backed up.”</i>");
	/*output("\n\nThe Queen smirks. <i>“I will care for my subjects as I always have. Strangers, you may depart in peace. Our business is at an end. Trouble my subjects no longer.”</i>");
	output("\n\nThat’s as clear a dismissal as you’re likely to get.");
	output("\n\n<i>“Come on,”</i> Azra bids. <i>“Let’s get back to the ship!”</i>");*/

	output("\n\nThe Queen smirks. <i>“I will take care for my subjects as I always have. Unless you would like to join us? You look like very fitting... treats.”</i>");

	output("\n\n<i>“I uh,”</i> stumbles Azra, pointing at her collection of fungus. <i>“I’d sooner examine these, thank you, your Majesty. But I can wait here and do that if you want to go along with them, [pc.name]...”</i>");

	processTime(6);
	flags["SYDIAN_QUEEN_RESULT"] = 1;
	clearMenu();
	//[Yes] [No]
	addButton(0,"Very Yes",raskyRooOrgipoo);
	addButton(1,"Service",multiBalljobRaskTraps);
	addButton(2,"No",noVoluntaryRaskOrgy);
}

public function noVoluntaryRaskOrgy():void
{
	clearOutput();
	showName("GIVING\nA WEAPON");
	showBust("SYDIAN_QUEEN","RASK_TRAP");
	author("Nonesuch");
	output("With equal politeness, you turn her down.");
	output("\n\n<i>“As you wish,”</i> she replies with majestic indifference. <i>“Come, servants! The pleasure barrow awaits.”</i> She strides off, shortstack entourage in tow.");
	output("\n\n<i>“Pretty amazing, how you handled that,”</i> grins Azra, picking her samples up. <i>“I swallow my tongue in situations like that. I’m so relieved I’m doing this with you, [pc.name]. Shall we get back to the ship?”</i>");
	output("\n\nTogether, you strike out from the rust spires.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Berate
public function berateTheQueen():void
{
	clearOutput();
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");
	pc.addHard(2);
	output("<i>“What have I to say for myself? I say you have about as much authority as you have sense.”</i> ");
	if(pc.isAss() || pc.isMischievous()) output("You smirk and ");
	else output("You ");
	output("point accusingly at the little tattletale. <i>“Aza");
	if(pc.isBimbo()) output("fall or whatever his name was");
	else output("phel");
	output(" threw those mushrooms away. If I had robbed him, as he claims, wouldn’t I have a weapon out? Wouldn’t I have simply followed him unseen and ambushed him a little further away? The idea that I could fail so spectacularly at thievery is insulting. I assure you that if I intended to follow the outlaw’s path, I would do so in a more successful fashion.”</i> You round on the self-styled Queen. <i>“If he is your subject, then perhaps the fault lies with you. Surely a true leader would inspire more than screaming cowardice in her followers.”</i>");
	output("\n\nAzra gasps.");
	output("\n\nThe self-proclaimed Queen raises an eyebrow as your insults rain down, but takes no other action. At long last, she asks, <i>“Are you finished?”</i>");
	output("\n\nYou nod, and Azra buries her face in her palms. <i>“That’s it. We’re dead.”</i>");
	output("\n\n<i>“Well said.”</i>");
	output("\n\nThe trappy raskvels’ guns dip toward the ground as they turn to regard their leader in disbelief. She cuffs one, and the boy-toy bodyguards return to attention once more.");
	output("\n\n<i>“Now,”</i> the Queen begins, <i>“you make some fair points, even if the manner of your statements is as crude as you are strange.”</i> She rubs a raskvel’s feathered head in a way that makes his gun waver and his eyes roll back a bit. <i>“I deem you innocent of thievery. Azaphel will be punished for his... lack of fortitude.”</i> She gestures dismissively in your direction. <i>“You may go.”</i>");
	output("\n\nAzra lets out a breath you never knew she was holding. <i>“Come on... before they change their minds.”</i>");
	output("\n\nYeah, that’s probably a good idea.");
	processTime(7);
	flags["SYDIAN_QUEEN_RESULT"] = 2;
	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Beg
public function begForMercy():void
{
	clearOutput();
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");
	output("You drop to your knees. <i>“My apologies, Dear Queen! We are but strangers to your lands, journeyed from a far-away world in search of adventure and friendship.”</i> You gesture grandly to your winged companion. <i>“My friend is a scientist who studies all manner of plants. We merely sought these mushrooms that they might be preserved for all the galaxy to enjoy. Theft was never our intent or our goal. If we have taken the belongings of another, then you have our deepest, most sincerest apologies.”</i>");
	output("\n\n<i>“Is this true?”</i> The Queen looks to Azra.");
	output("\n\nShe nods vigorously.");
	output("\n\n<i>“Very well. Your slippery words and false facade bear witness to Azaphel’s claims.”</i> She pets Azaphel lovingly. <i>“My loyal subject has no right to be treated so, not by any creature of any planet. Your punishment is simple.”</i> Pausing for dramatic effect, the sydian grins wickedly. Her tiny army quivers in anticipation. <i>“Service. You shall both serve Azaphel in whatever manner he deems fit.”</i> The scaly bastard’s loincloth begins to tent. <i>“Afterward, you are to relieve the other guard’s genitalia as well. They do get so pent up...”</i>");
	output("\n\nYou begin to protest.");
	output("\n\n<i>“SILENCE!”</i> the Queen shrieks, pointing a scepter in your direction. <i>“You will accept your punishment with grace, or you will die like treasonous dogs.”</i>");
	output("\n\nAzra’s shoulders slump. <i>“Come on, [pc.name]. Let’s just get it over with.”</i> She smiles wryly. <i>“We might as well try to enjoy it.”</i>");

	processTime(5);
	flags["SYDIAN_QUEEN_RESULT"] = 3;
	//[Accept] [Reject]
	clearMenu();
	addButton(0,"Accept",acceptPunishmentSucky);
	addButton(1,"Reject",rejectTheQueen);
}

//Accept -> Azra & you both thoroughly service Azaphel. After, milk the guards? Maybe they all sit their balls on the PC’s face for ball-polishing while Azra leans in to suck all three into her enormous maw?
public function acceptPunishmentSucky():void
{
	clearOutput();
	showBust("RASK_TRAP_NUDE");
	showName("\nAZAPHEL");

	//Solo Blowjob
	author("Nonesuch");
	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby())
	{
		output("The conversation has frankly been a bit of a blur for you ever since you caught sight of the raskvel boi’s heavily swollen sack, crying out for some caring someone to relieve it of all its delicious pressure. The fact that it’s in aid of allowing everyone present to leave happy is just the cherry on top.");
		output("\n\n<i>“Come on then, sugar,”</i> you smile brightly, licking your [pc.lips] and [pc.moving] forward. <i>“Let me show you how my people say hello!”</i>");	
	}
	else
	{
		output("Could the suula even reach down that far? It’s obvious from her frozen smile and helpless glance over to you that the prim researcher isn’t going to do it, whatever the case. And you <i>are</i> on this mission to take care of unfortunate little eventualities.");
		output("\n\n<i>“Fine,”</i> you sigh, [pc.moving] forward. <i>“Let’s get this over with.”</i>");
	}
	output("\n\nAzaphel is almost trembling with excitement, eyes fixed on you, his cute little mouth slightly ajar as you ");
	if(pc.isBiped()) output("kneel");
	else output("get down");
	output(" in front of his tenting loin cloth. ");
	if(pc.tallness <= 5*12+5) output("Fortunately you’re of a similar stature - you’re definitely better suited to doing this than Azra.");
	else if(pc.tallness <= 7*12) output("It’s difficult cramping yourself up to get at the diminutive alien’s cock - but he’s excited enough to get up onto his splayed toes, anything to get closer to the heavenly relief of your mouth.");
	else output("It’s practically impossible for a being of your size to get at the diminutive alien’s cock, humiliating. You have to lie down on one side, and even then he has to get up onto his splayed toes to be level with your mouth.");

	output("\n\nHe rips off his cloth with a fluttering, impatient groan, revealing a gleaming, six inch purple erection straining out of its sheath. It’s a hefty dick on a boy bitch his size, but it’s like a splinter compared to the balls it’s flanked by; bulging testicles that practically drag on the ground, rising and falling impatiently in their over-stretched sack. You feel a little flair of sympathy for the raskvel and his fellows - those, paired with their natural libido, must make day-to-day life pretty unbearable.");

	output("\n\nYou give him an encouraging grin and wrap your hand around the base of his shaft, giving the smooth, hard flesh a couple of brisk tugs before spreading your lips over the musky, pointed tip, suckling on it. The shudder and woozy, rapturous moan this alone draws out of him is pretty special. His hands find your shoulders, and his grip tightens as you advance your [pc.lips] further down his shaft, filling your mouth with the ");
	if(!pc.isBimbo() && pc.libido() < 75) output("shamefully");
	else output("transcendentally");
	output(" arousing taste and texture of cock.");

	output("\n\n<i>“Thank you so much, my Queen!”</i> he cries out as you begin to find rhythm, bobbing your head up and down his shaft. You let out a muffled huff. Who here is sucking his dick, again?");
	output("\n\n<i>“You are welcome, my trusted servant,”</i> comes the cool reply. You hear muttering and the frustrated shuffle of feet, followed by a hefty slap and gasp of pain. <i>“Silence! If you wanted relief then you should have proven yourself worthy, as Azaphel did.”</i>");

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby())
	{
		output("\n\nWell, if she’s too aloof to get on her knees and hollow her cheeks around some delicious cock that’s definitely her loss. You’re getting a wonderful, soft buzz that intensifies the feeling of Azaphel’s meat sliding between your lips, heat glowing between your [pc.thighs] that strengthens with every drop of pre you coax out of him with long, hungry drags of your mouth and tongue.");
		output("\n\nYou let the raskvel boi know how much you enjoy servicing him with smacks of your lips and pleased, muffled hums, and you moan as you cause him to abandon all restraint, grab your head with feverish hands and fuck your mouth with athletic, juddering thrusts of his muscle-packed hips. The pointed end rams down your throat with each hard push, but you’re well-trained enough to take this without fuss, even enjoy the little bursts of stars behind your eyelids and the way your whole world becomes nothing but the wonderful hardness and taste of cock each time your windpipe is closed.");
	}
	else
	{
		output("\n\nOh, brother. You set your teeth against Brave Sir Azaphel’s dick - a little warning not to milk it too much - and then withdraw to energetically thrust your mouth up and down his cock, hollowing your cheeks around it stringently, eager to get him off as quickly as possible.");
		output("\n\nThe raskvel boi is evidently not one to look a gift suck in the mouth, and is quiet aside from his deepening, ragged breath as you blow him hard and fast, filling the hollow with slurps and smacks of your [pc.lips]. Eventually though the pent-up trap can’t contain his excitement, and he grabs your head with feverish hands and gives back with athletic, juddering thrusts of his muscle-packed hips. You gag slightly as the pointed, pre-beading end sticks into your throat, but fortunately the thing is shaped so it’s much easier to take than it ordinarily would. You control yourself and let him face-fuck you, concentrating on keeping your mouth pliant and open for him, trying to ignore his giant balls slapping against your chin.");
	}
	// {merge}
	output("\n\nWith a fluttering moan Azaphel mires himself into your mouth as deep as he can, his hands tighten on your [pc.hair], his giant testicles rise and tense, a fluttering moan is forced past his open lips, and a sudden cascade of cum warms your throat and gut. He’s forced back a bit by the sheer force of it, so that the next salty load swells your cheeks and squirts out around the seal of his girth and your lips... and then suddenly he’s pulled out entirely, his drooling, railing-like prick still sternly erect but no longer flexing. You blink. Was that it? With bollocks the size of his, you were expecting receipt of a meal and a half.");
	output("\n\n<i>“Can...”</i> he gasps in his fluttering, androgynous voice. <i>“Can I not...?”</i>");
	output("\n\n<i>“No,”</i> the tall sydian replies coolly. <i>“You know the code: One orgasm per deed. Be gracious to your Majesty, and then get back in line.”</i>");
	output("\n\n<i>“Thank you, my Queen...”</i> he jogs his cute butt back into formation around her, rearranging his loincloth as he goes.");

	flags["AZRA_RASK_PC_SUCKED"] = 1;
	processTime(15);
	pc.loadInMouth(new RaskvelMale());

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby())
	{
		output("\n\nYou pout, feeling a deep sense of frustration. What a meanie-head that giant cockroach is being! You’d barely gotten started helping these frisky, deserving boys out with their delicious problems. Looking over at the pretty boy raskvel, their shifting feet and longing stares, you can tell they entirely share your sentiments.");
		output("\n\n<i>“The tribute has been fairly met,”</i> the sydian matriarch goes on, turning her attention to you. She waves her sceptre airily. <i>“You may take your spunkshrooms and leave.”</i> She pauses as she notices you’re still kneeling, taps the sceptre in her hand thoughtfully. <i>“...You really enjoyed doing that, didn’t you? It is almost treat time. You can come along and be the treat, if you like. Save one some trouble.”</i>");
		output("\n\n<i>“I uh,”</i> stumbles Azra, pointing at her collection of fungus. <i>“I’d sooner examine these, thank you, your Majesty. But I can wait here and do that if you want to go along with them, [pc.name]...”</i>");

		pc.changeLust(55);
		//[Hell Yeah] [Nah]
		clearMenu();
		addButton(0,"Hell Yeah",raskyRooOrgipoo);
		addButton(1,"Yeah",multiBalljobRaskTraps);
		addButton(2,"Nah",nahImNotASloot);
		return;
	}
	else
	{
		output("\n\nWhat an interestingly cruel way of maintaining control over your minions. It looks like you’ve got out of this situation relatively painlessly, though. You pat yourself down, wipe your mouth and return to Azra’s side, wishing you’d brought some breath mints along. The suula mouths an embarrassed ‘thanks’ at you.");
		output("\n\n<i>“The tribute has been fairly met,”</i> the cockroach matriarch goes on, turning her attention to you. She waves airily. <i>“You may take your spunkshrooms and leave.”</i>");
		output("\n\nYou’re more than happy to.");
		clearMenu();
		addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
	}
}

//Nah
public function nahImNotASloot():void
{
	clearOutput();
	showAzra();
	author("Nonesuch");
	output("Rationality surfaces in your mind like a dreary, gray iceberg, and you consider it’s not fair to leave your charge on her own out in this toxic badland whilst you go get fucked by a whole bunch of murderous aliens. With a deep sigh, you turn the sydian down.");
	output("\n\n<i>“As you wish,”</i> she replies with majestic indifference. <i>“Come, servants! The pleasure barrow awaits.”</i> She strides off, shortstack entourage in tow.");
	output("\n\n<i>“Thank you for doing that,”</i> says Azra, picking her samples up. <i>“I’m really glad I’ve got someone with your, uh, priorities on planets like this, y’know? I just lock up when people start making demands like that.”</i>");
	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Multi Balljob
public function multiBalljobRaskTraps():void
{
	clearOutput();
	showBust("RASK_TRAP_NUDE",azraBustString(true),"RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	if(silly) showName("MULTI-\nBALL!");
	else showName("RASKVEL\nSERVICE");
	author("Nonesuch");

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby())
	{
		output("Ever since you caught sight of the raskvel’s big, achingly packed balls your attention has been drifting back to them, and how much you’d like to relieve the cute little snack-boy of all that gloopy, delicious pressure.");
		if(flags["SYDIAN_QUEEN_RESULT"] == 3) output(" So what if you’ve kinda messed things up. Maybe you wanted to mess up. Messes are fun.");
	}
	else
	{
		if(flags["SYDIAN_QUEEN_RESULT"] == 3) output("How did you mess up negotiating with these savages so badly you’re being forced to do this? ");
		output("You’d love to know off whom the raskvel got those extremely powerful guns they’re packing. Whoever they are have got a lot to answer for.");
	}

	// {merge}
	output("\n\n<i>“I will have the supplicants service me on my own to begin with,”</i> says Azaphel, beaming as he steps forward into his red letter day. <i>“Just to make sure it’s worth the rest of you fellers’ time, you know.”</i>");
	output("\n\n<i>“You’re a real piece of ‘lani, Zaph,”</i> growls another, looking you up and down enviously.");

	output("\n\n<i>“Language!”</i> Queen Sydian snaps, bonking him on the head with her sceptre. Azaphel isn’t paying attention; he’s ripping off his loincloth, revealing his proud, purple, gleaming erection, smoothly pointed at the top like a swollen, rigid tongue. It’s a decent-sized member for a creature of his size, but it looks dinky accompanied by the testicles that it is attached to: balls the size of grapefruits rising and straining in their sack, that practically drag on the ground. No wonder these little guys are incapable of thinking about anything except sex.");
	output("\n\n<i>“Uh, ok...”</i> says Azra, wringing her hands as she gazes down at him. <i>“Those look pretty pent up. What if [pc.name] here looks after them whilst I give you a suck?”</i> She grins, displaying her lethal teeth. Perhaps she’s hoping that the sight of them will make the raskvel boi change his mind.");
	output("\n\n<i>“Yeah,”</i> breathes Azaphel, mouth open and eyes slightly misty. He grips his brilliantly-colored cock and brandishes it upward. <i>“That. Now. Please.”</i>");
	output("\n\n<i>“Right,”</i> sighs the suula. <i>“Well... [pc.name], if you get on the floor, I’ll...”</i>");

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby())
	{
		output("\n\nYou’d much rather be the one on the hard, syrupy business end, but, well, even you have to admit Azra’s the one with the much larger mouth. And you’d hate to take the joy of cramming three delicious dicks into her mouth at once away from her. You happily clear a small space on the rust-coated ground and lie yourself down.");
	}
	else
	{
		output("\n\nSilently uttering dire threats towards the denizens of Tarkus and the trash planet as a whole, you clear a small space on the rust-coated ground and lie yourself down.");
	}
	output("\n\nAlmost immediately the giddy raskvel is clambering his warm, dense weight onto your neck.");
	if(pc.biggestTitSize() >= 3) 
	{
		output(" His warm fingers slip backwards to your [pc.boobs], and he giggles as he gives one a squeeze.");
		output("\n\n<i>“Those are nice,”</i> he says approvingly. <i>“Our women-folk never grow them as big as that...”</i>");
	}
	output(" He drags his heavy bollocks forward so their smooth warmth is rested upon your [pc.lips], wedged up against your nose, and your senses are enveloped in heady musk, sending an involuntary wriggle of lust through your groin. It’s difficult not to feel a slutty, submissive frisson about this - the more embarrassed you feel about the fact your lips are mashed into this lizard savage’s balls, the harder it becomes to deny. ");
	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby()) output("You coo as that wonderful sensation easily overwhelms your faculties, leaving you nothing but a soft, sensitive slut who wants nothing but to serve. Happily you close your eyes and lavish the leathery, musky flesh with your [pc.tongue], shivering at the taste.");
	else output("Probably the best strategy is not to think about it. You close your eyes and begin to lick the leathery, musky flesh.");

	output("\n\n<i>“Oh yeah...”</i> groans Azaphel, shifting his weight and sliding his hand into your [pc.hair]. His balls clench and relax underneath your questing lips and [pc.tongue]. <i>“Kiss ‘em a bit. Yes!”</i> He practically sings when you open your mouth wide, form suction around one and french it lasciviously.<i>“Alright. Now you, big lady.”</i>");

	output("\n\nThe suula has to get way, way down in order to get anywhere near the raskvel’s dick. You get a worm’s eye view of her kneeling, and then almost kowtowing so that she can, at last, open her wide mouth around his purple, pointed bell-end. You don’t know if Azaphel deliberately positioned himself so he was facing his potentate and peers, but the fact Azra’s massive butt is now pointed up and flared submissively in their direction draws a chorus of approving murmurs and sighs from them. It also has the effect of pooling her similarly plus-sized boobs around your brow and ears, so your head is completely swaddled in sensitive, scaled erogeny.");

	output("\n\nIn the tiny, cramped space between boobs and balls that you can still see through, you watch Azra rather awkwardly begin to bob her head up and down the raskvel’s straining shaft, doing her best with the uncomfortable position and size difference. ");
	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby()) output("You contribute");
	else output("You try and speed things along with");
	output(" patient, attentive sucks and sweeps of your [pc.tongue] over his grapefruit-sized jewels, drawing the salt away into your mouth - as attentive and uncomplaining as the most groveling of ball-polishers - but really it’s up to Azra to get this up and running, and watching her half-heartedly suckle on the purple fuck-stick above like a popsicle the flavor of which she doesn’t particularly like gets frustrating. Azaphel’s sighs of enjoyment remain blissful rather than orgasmic.");
	output("\n\n<i>“Are they doing the best they can, Azaphel?”</i> you hear the female sydian demand. <i>“It is not deemed sufficient unless they are.”</i>");
	output("\n\n<i>“Um, yeah...”</i> the raskvel breathes in response. <i>“It’s quite nice. Oh!”</i> He gasps, and his balls tighten underneath your mouth, as Azra suddenly opens her mouth wide and allows her great long tongue to flop out. It writhes like a snake of its own volition, blanketing itself tightly around the base of Azaphel’s dick with an obscene, saliva-drenched smack.");
	if(pc.hasCock())
	{
		output(" Onedamn... [pc.eachCock] hardens just looking at that. How much you’d give for that to be you.");
	}

	output("\n\n<i>“Yes!”</i> wails the effeminate lizard boy, feet pawing in the dust next to your [pc.ears], hands reactively grabbing the suula’s pointed ears like handles as she begins to writhe her prehensile monster of a tongue back and forth around his cock, sucking on the tip as she does. She huffs her annoyance at that, but doesn’t stop for a moment, the wet sounds of it clear to everyone present. <i>“Oh Queen, this is so, so good!”</i>");
	output("\n\n<i>“Excellent!”</i> says the sydian primly. <i>“Alright, since you have waited patiently like good boys, the rest of you can dig in now. The two strangers are big enough to satisfy you all.");
	if(pc.tallness < 6*12) output(" The winged fish thing is, anyway.");
	output("”</i>");

	processTime(15);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",multiBalljobRaskTraps2);
}

public function multiBalljobRaskTraps2():void
{
	clearOutput();
	showBust("RASK_TRAP_NUDE",azraBustString(true),"RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	if(silly) showName("MULTI-\nBALL!");
	else showName("RASKVEL\nSERVICE");
	author("Nonesuch");
	output("The vibrations of six feet excitedly thundering across carry into your head. With a slithering eely sound, Azra unravels herself from Azaphel’s dick in order to look up; she manages a half-hearted <i>“Wait...”</i> before two new sets of massively swollen raskvel balls are thumped down on your face, hands squeezing them into Azaphel’s so they can get near the anticipated bounty of your mouth. You are utterly buried in smooth, musky, reptilian flesh. Your hands flap on their scaly backs and tails in startlement.");
	output("\n\n<i>“Are you alright down there, [pc.name]?”</i> comes Azra’s voice. Her hand finds your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("scalp");
	output(" and strokes you soothingly. <i>“Look it’s alright - I’m pretty sure I can, um, fit them all in at the same time, so all you’ve gotta do is - hey, what are doing back th- ? Unnffk!”</i> An impact vibrates through her, her hand tightens upon your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("scalp");
	output(" and you yowl in pain. One of the raskvel takes this as an invitation and pushes his ball-sack forward, filling your open mouth with its denseness.");

	output("\n\n<i>“Uff... this isn’t part of the deal!”</i> the suula shouts over her shoulder. By the way her shoulders and boobs are jerking, it appears something small but incredibly energetic is clapping into her from behind.");

	output("\n\n<i>“I can’t help it...”</i> come the groans of the fourth raskvel boi. <i>“Those curves... that size! I must breed it. Must must must!...”</i>");

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby()) output("\n\nOnce your surprise has died down a bit, you wonder if it might not be better to extract yourself and propose to do this on your own; this clearly isn’t your suula friend’s scene, and your body aches to take all four of the energetic girly boys at once. Make each of them groan and spurt their endorphin-inducing loads into your tight, thirsty holes, then get them to do it again. Wow, you’re drooling all over their balls at the thought! You subsume yourself back into the blissful, subby haze, resolving to use all this excess saliva to give them the polishing they deserve.");
	else output("\n\nYou find yourself desperately hoping Azra will just roll with it; the thought of trying to satisfy these pent up, over-excited femboys on your own now is a daunting one.");
	output(" You signal your intention to give this the old college try anyway by sucking vehemently on the rude boi who just stuffed your maw full of his testicles, opening your mouth as wide as you can so you can envelope it in shifting, wet mouth flesh, making him gasp sweetly with pleasure. A surge of thankfulness enters you as, after a moment, you see the suula’s chin descend and her huge predator’s jaw crane open, a dripping, fang-lined pit that’s easily big enough to swallow three raskvel dicks at once. If the trio feel the slightest pang of apprehension about this they certainly don’t show it; there’s an intake of excited breath, and three sensitive, shining purple fence-posts are brandished upwards.");

	output("\n\nAzra envelopes them all in one tsunami-like sweep of her lips, pressing them together in her mouth with a stifled, hissing sucking motion. Grateful moans and sighs of pleasure from the raskvel rain down, as plentiful as her own saliva, as she thrusts her head up and down, tongue winding in and around cock like a snake weaving through the bushes; pink hands grasp her face, willing her on. You think the dude railing her from behind is a blessing in disguise; there’s a heavy blush on her cheeks, heat building, which makes the demure researcher go about blowing these three with considerably more gusto than she ordinarily would.");

	output("\n\nYou do your whorish best to uphold your side of things, sending your own [pc.tongue] trailing and lapping over the musky, rubbery balls laden upon your face, pulling each into your mouth for an attentive suck, your [pc.lips] and tongue occasionally dabbing against Azra’s on her passage downwards.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" As lithe as her own, you can twine and slither your [pc.tongue] around hers, tightening and loosening around the raskvels’ hard shafts and throbbing balls like ribbons around maypoles. It’s obvious from their effeminate moans, the way they arch their backs and reactively thrust themselves into your movements that the raskvel have never experienced anything like what you’re doing to them, and probably never will again.");

	output("\n\nYou can gauge how well you are doing by the way they clench up and how their hands reach down to clutch and stroke your [pc.chest] and [pc.hair], getting ever more excited as Azra picks up the pace, slurping and drawing on the cocks stretching her maw wide assiduously.");
	output("\n\n<i>“Oh fellas...”</i> groans the fourth raskvel from somewhere. <i>“This alien’s happy hole... it squirms! It’s amaaazing...”</i>");
	output("\n\n<i>“Nngh,”</i> manages one of the others in response. The way their penises are all squeezed together inside Azra’s mouth whilst her cheeks and tongue tighten themselves around them is obviously an intense sensation for them; when they grab the suula’s head and begin to thrust reactively into her wet suck, nuts battering down onto your face, they’re pretty much frotting each other.");
	output("\n\nWhen one set of testicles tighten up so hard underneath your lips you’re worried they’re going to form semen-based black holes, the over-eager little femboy creates a snowballing effect for the others, so that when his eyes roll back and he flumes a fountain of liquid alabaster into the suula’s vast maw, his shivering thrusts creates a snowballing effect for the others packed against him. They hold Azra down to their groins and cum hard into her, their muscular hips thrusting upwards into that slick, warm glory, and her eyes roll. Even with a mouth as accommodating as her they quickly swell her cheeks out and make her cough it back up, pearly spooge splattering and drooling down onto you. The raskvels’ balls gradually withdraw into themselves, at least some of the tightly packed pressure within them relieved.");
	pc.applyCumSoaked();
	pc.loadInMouth(new RaskvelMale());
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",multiBalljobRaskTraps3);
}

public function multiBalljobRaskTraps3():void
{
	clearOutput();
	showBust("RASK_TRAP_NUDE",azraBustString(true),"RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	if(silly) showName("MULTI-\nBALL!");
	else showName("RASKVEL\nSERVICE");
	author("Nonesuch");
	output("<i>“That’s enough,”</i> orders a stern, female voice, and suddenly the testicular landslide is being ferried away, cum-leaking reptilian cocks withdrawn from Azra’s face. She gasps for air and collapses down onto you, gonads replaced by the squashy warmth of her boobs. Her long tongue hangs out of her cum-smeared mouth and her wings are flexing reactively to something; the rhythmic slap of hips against butt still reverberates from behind her.");
	output("\n\n<i>“You too, Sessalai!”</i> raps the voice.");
	output("\n\n<i>“But I’ve only cum twice! I must breed her! So big... so soft... ow! Alright, ok,”</i> groans the fourth raskvel, and at last Azra’s flesh stops shuddering. The warmth of her exhausted wheeze washes over your face.");
	output("\n\n<i>“You only get to cum once!”</i> snaps Queen Sydian, gesticulating with her sceptre angrily. The other raskvel bois have retaken their positions around her. They’re look back at you longingly, but their purple cocks have obediently disappeared back into their sheaths, their loincloths once again in place. <i>“You shall be punished for overstepping yourself. Azaphel, fetch my crop! You, strangers,”</i> she waves dismissively, <i>“your supplication was amateur but honestly given. You may take your ill-gotten gains and leave. Don’t return... unless you wish to savor the ball-sweat of my lowliest servants again.”</i>");

	output("\n\n");
	if(flags["AZRA_EXP_FAILED"] == "tarkus") output("<i>“This is another thing we never talk of. Okay?”</i>");
	else output("<i>“We never talk of this. Agreed?”</i>");
	output(" Azra says in a completely even voice, once she’s wobbled back to her feet and done some due diligence with a handful of tissues, first around her face and then between her wide hips. The way she looks at you when she says it, suggests that disagreeing will result in her doing something very different with that mouth of hers than what she just did with the raskvel.");

	if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.isSubby()) output("\n\nYou blink, trying to banish thoughts of sleepwalking after the sydian’s entourage so you can romp with them some more. Is she saying she didn’t enjoy what just happened? Yes... wait... that’s right. Most other people don’t get as much joy out of being a gleeful spunk-receptacle as you do. You’d sigh and pout at your suula friend, but sensitive to her needs you smile and bob your head instead. You hurry away together with your sample of spunkshrooms.");
	else output("\n\nYou hastily nod, and you stride away together with your sample of spunkshrooms in silence.");
	flags["AZRA_RASK_ORGIED"] = 1;
	processTime(20);
	pc.changeLust(100);

	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Orgy Tiems
public function raskyRooOrgipoo():void
{
	clearOutput();
	author("Nonesuch");
	showName("\nLEWD!");
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	if(pc.isBimbo() && flags["AZRA_RASK_PC_SUCKED"] != undefined) output("One blowie is absolutely not enough. You nod and grin your eager assent - triggering sharp intakes of breath and excited whispering amongst the raskvel bois - and follow the sydian’s swinging, feathery tail as she turns and sashays away into her territory.");
	else output("You are pleased she made the overture - this was turning out to be a very dry encounter. Can you claim to have had successful negotiations if you didn’t all fuck at the end? You nod and grin your eager assent - trigger sharp intakes of breath and excited whispering amongst the raskvel bois - and follow the sydian’s swinging tail as she turns and sashays away into her territory.");
	output("\n\n<i>“Are you wondering how I became a Queen, stranger?”</i> the tan creature asks. Even heavily clad in her armor it’s obvious she has a nice figure, slim and muscular but with hourglass swells that make the mouth water. She’s taken you to a steep hollow created by the bulwark of a half-buried spaceship, the heavily plated metal craning over a depression furnished with a large number of pillows and a spiky, welded together chair that obviously fancies itself as a throne. The sydian shoos her small charges down into it as she continues to speak.");
	output("\n\n<i>“I knew I was destined for greatness, but my people do not recognize such things in females. So I had to find another way of building a realm. These raskvel are all outcasts too - effeminate males are the lowest ranking of their kind. But they obey me with total loyalty and fearlessness, thanks to my discovery of the spunkshroom, which makes them far more potent and lively than any male that used to be cruel to them.”</i>");
	output("\n\nShe sinks back into her throne, and with a wriggle of her muscles and a grateful sigh she begins to peel her armor back, revealing the soft, smooth orange skin beneath. Tiny flakes of rust hang in the still air down here. You emit little puffs of bronze dust as her fine, firm breasts and protuberant nipples slide into view.");
	output("\n\n<i>“Soon I shall have an army of them at my command,”</i> husks the sydian, feathers waving and prideful desire inflaming her face, compound eyes unfocused as she mauls her own boob, fingers sinking deep into the softness there as she pulls at the nipple. She recrosses her legs, and you catch a glimpse of her pussy, as soft, pale and plump as her armor is hard, tanned and severe. <i>“But - for now - I have them, and you. And it’s treat time. So what shall we do with you?”</i>");
	processTime(4);
	pc.changeLust(5);
	//[Lay Her] [Spit Roast]
	if(pc.hasCock() && pc.cockThatFits(550) >= 0) addButton(0,"Lay Her",penisRouter,[fuckTheSydianQueen,550,false,0],"Lay Her","Dick the sydian. You may require some femboy fucking to get to her.");
	else if(pc.hasCock()) addDisabledButton(0,"Lay Her","Lay Her","Your dick is way to big to for her to willingly accept.");
	else addDisabledButton(0,"Lay Her","Lay Her","You can’t put your dick inside her if you don’t have one.");
	addButton(1,"Spit Roasted",spitRoastRaskvelTimes,undefined,"Spit Roasted","Get fucked by the raskvel.");
}

//Spit Roast
//Tooltip: Get fucked by the raskvel.
public function spitRoastRaskvelTimes():void
{
	clearOutput();
	showName("\nORGY");
	author("Nonesuch");
	showBust("RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	output("You signal your intentions by sidling into the nearest pink-skinned big-balled reptile [pc.butt] first, stroking his sensitive ears. He coos with delight and looks ");
	if(pc.tallness >= 60) output("up ");
	output("at you with barely contained lust, hands instinctively wrapping around your [pc.thigh].");

	output("\n\n<i>“Yes... excellent. You’ll put on a show for me. Azaphel - here,”</i> the Queen orders, pointing at her feet. <i>“The rest of you - tuck in. No bounds - you’ve been good today.”</i>");
	output("\n\nHot, smooth paws grasp you and pull you down into a sitting position, three pert, pent-up raskvel eager to experience as much of your alluring alien flesh as lizardly possible. You laugh and then gasp as one slides his hand over your [pc.chest], touching a [pc.nipple], hesitant at first but then with enthusiasm when you push yourself into him, coaxing him to stroke and maul your ");
	if(pc.biggestTitSize() >= 1) output("lovely soft boobs");
	else output("muscular pecs");
	output(". Another sinks his fingers into your [pc.vagOrAss], ");
	if(pc.hasVagina())
	{
		output("testing your depths and swirling you until you’re ");
		if(!pc.isSquirter()) output("beading");
		else output("gushing");
		output(" heady [pc.girlCum] down his digits. He licks them clean with obvious delight and then ");
		if(pc.totalVaginas() == 1) output("moves on to your [pc.anus], working it loose with insistent loops and then sinking them in to your sensitive back tunnel, another hole he very evidently intends to plunder.");
		else output("sticks them into your [pc.vagina 1], eager to feel the texture of every one of your breeding holes.");
	}
	else output("quite loose, and he’s stroking your sensitive back tunnel deep. You tense up with delight at the thought of having one of these scaly love bunnies rammed up there. AT LEAST one.");
	output("\n\nAll three have their gleaming purple cocks craning out of their pouches, their stuffed, oversized balls rising and falling in barely contained anticipation, and they rub their hot, smooth hardness against you from all sides with energetic bops, happy enough to feel your [pc.skinFurScales] against their erections. Their musk and eagerness is heady in the still air of the hollow, elevating your own arousal, and you lie back into them, grasping two pricks and giving them both teasing yanks, " + pc.mf("giggling","laughing") + " at the twin, girly groans this induces.");
	output("\n\n<i>“Ohh, are all aliens like you?”</i> one croons, long ears shuddering with delight. <i>“We need to build a rocket...”</i>");

	output("\n\n<i>“Can we keep this one, my Queen?”</i> pipes up another, fervently pumping his length between the cheeks of your [pc.ass], oiling it with a near constant flow of pre. <i>“We’ll take good care of [pc.him], I swear!”</i>");

	output("\n\n<i>“No,”</i> the sydian replies sternly. <i>“You have no idea what [pc.he] even eats. Aside from dick, evidently.”</i> Azaphel has his hands wrapped around her armored thighs, head deep between them. His tail flails and there’s a muffled whimper when she smacks her sceptre about his pert backside. <i>“My clitoris is not a piece of gristle, you clod! No teeth, just tongue. Thaaat’s more like it. The rest of you, stop lolling around. I demand action!”</i>");

	output("\n\nA slutty, voyeuristic thrill thrums through you at the thought of putting on a show for the proud, pompous, self-styled queen. You allow her bitch-boi harem to roll you over onto your hands and [pc.knees], opening your [pc.thighs] so that the one behind you ");
	if(!pc.hasCock()) output("can continue to finger you, finding your [pc.clit] and rubbing it so fast it’s like a vibrator’s being applied to it.");
	else output("can grip your [pc.cock] and jerk it until it’s straining hard against your [pc.belly].");
	output(" You gaze up at the raskvel in front of you saucily and swirl your [pc.tongue] around the pointed head of his cock, retreating inside your mouth to savour his salty taste before reapplying it around the crown with relish. Meanwhile your hand cups his massive ball-sack and gives it a squeeze, delighting at the way it throbs beneath your touch - packed, liquid density. The trappy raskvel is far too worked up to take that kind of teasing for more than a few seconds; he grips your head and thrusts his stout erection past your [pc.lips], its shape and smoothness enabling him to holster himself in your wet, sucking maw with ease.");
	output("\n\nYou tense up and reactively grab his slim, girly hips when one of his peers grabs your [pc.hips] and slots his own pointed reptilian cum-faucet into your [pc.vagOrAss], the pointed head encountering zero difficulty opening your ");
	if(pc.hasVagina()) output("slickened entrance");
	else output("loosened asshole");
	output(" and packing thick, hot meat into your fuck tunnel. If you didn’t know these little snack-boys were wound up tighter than a spring and live at about ten times the pace you do, you definitely receive plenty of evidence for it now. They judder into you from both ends like jackhammers, thighs tensing in order to drive their cocks into your sensitive holes twice per second, a constant stream of pre drooling from the tips lubricating your mouth and [pc.vagOrAss], breathy gasps and groans of gratification the accompaniment to the dirty ‘slap-slap-slap’ of their gigantic balls against your chin and [pc.thighs].");

	if(pc.hasVagina()) pc.cuntChange(0,chars["RASKVEL_MALE"].cockVolume(0));
	pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0));

	output("\n\nAll thought is driven from your mind except the ecstatic feeling of hard, hot dick pushing deep into the most sensitive parts of your ");
	if(pc.hasVagina()) output("snatch");
	else output("colon");
	output(" and it’s all you can do to keep hold of the raskvel face-fucking you and suck him down. So you aren’t thinking about what the third femboy is doing until ");
	var capacity:Number = pc.analCapacity();
	if(pc.hasVagina()) capacity = pc.vaginalCapacity(0);
	var route:String = "";
	//Large capacity on orifice in use:
	//Double stuff chosen hole.
	if(capacity >= 600) 
	{
		route = "doublestuff";
		output("he practically fights the one tailgating you, shoving and growling like a rabid chipmunk until the first is forced to stop, withdraw and slap him back. You detach from the cock in front of you to tut at them in disappointment.");
		output("\n\n<i>“C’mon you two,”</i> you say huskily, flaring your [pc.ass] and waggling it at them. Your whorish, well-broken-in ");
		if(pc.hasVagina()) output("cunt");
		else output("ass-pussy");
		output(" beckons, a more generous hole than they have ever known, or ever will. <i>“Why are you fighting? There’s plenty of room for everyone.”</i>");
		output("\n\n<i>“Yeah...”</i> breathes one, his teeth loosening from the other’s shoulder, hypnotised. He grips your hips and easily inserts himself deep inside your [pc.vagOrAss] again; you shiver as you feel the other clamber on top of him, and then shrill with joy, eyes rolling, as with assertive thrusts, he fucks his way inside as well, stretching and packing your tunnel out with hot dick. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		if(pc.hasVagina()) pc.cuntChange(0,chars["RASKVEL_MALE"].cockVolume(0)*2);
		else pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0)*2);
	}
	//Pussy DP + BJ
	//2 or more pussies: 
	else if(pc.totalVaginas() > 1) 
	{
		route = "pussies DP";
		output("you feel someone determinedly scrabble his way in underneath you, gripping your sides and [pc.chest] as he hooks his short legs around your [pc.thighs], hot, desperately eager erection bumping clumsily against [pc.eachVagina]. You emit a muffled laugh around your cock muffler and slap at its owner to stop and withdraw. Your downstairs is absolutely equipped for parties, why not get one started!");
		output("\n\n<i>“Aliens are amaaaazing,”</i> groans the one underneath, watching in awe as you carefully swivel your [pc.vagina] down onto his bright purple filly-pleaser, before flaring your [pc.ass] to enable the other access to your [pc.vagina 1]. A moan of purest, sluttiest delight is forced out of your mouth as he grips you and drives himself back in, putting delightful pressure through your walls against the dick you just sat yourself down on, and [pc.eachVagina] ");
		if(!pc.isSquirter()) output("drool");
		else output("gush");
		output(" [pc.femcum] in response to the two of them thrashing into you almost at right angles to each other. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		pc.cuntChange(1,chars["RASKVEL_MALE"].cockVolume(0));
	}
	//1 pussy, not massive capacity:
	//Vag + Ass + BJ
	else if(pc.hasVagina())
	{
		route = "normal DP";
		output("you feel someone determinedly scrabble his way in underneath you, gripping your sides and [pc.chest] as he hooks his short legs around your [pc.thighs], hot, desperately eager erection bumping clumsily against your [pc.clit]. You emit a muffled laugh around your cock muffler and slap at its owner to stop and withdraw. There’s a simple solution here - you have the same number of holes as fuckbois present, after all.");
		output("\n\n<i>“Aliens are amaaaazing,”</i> groans the one underneath, watching in awe as you carefully swivel your [pc.vagina] down onto his bright purple prick, before flaring your [pc.ass] to enable the other access to your [pc.anus]. A moan of purest, sluttiest delight is forced out of your mouth as he grips you and works his way in, his pointed tool perfect for opening your ass-pussy up and incrementally filling it with hard, fervid flesh, putting delightful pressure through your walls against the dick you just sat yourself down on. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0));
	}
	//Anal + blowie + HJ
	else 
	{
		route = "anal+HJ";
		output("he practically starts fighting the one you’re blowing, shoving and growling like a rabid chipmunk, desperately trying to present his own bright purple erection to your [pc.lips] instead. You laugh, and touch them both soothingly.");
		output("\n\n<i>“C’mon you two,”</i> you say huskily. <i>“There’s no need for that. I’m sure I can look after both of you...”</i>");
		output("\n\nA few moments later the two have their eyes unfocused and their pretty mouths hanging upon, their thighs practically jerking automatically, as you hollow your cheeks around the cock of one whilst vigorously tug at the other. As soon as you adjudge one is nearing the edge by the tones of his groans, you withdraw and sink your mouth down the sizzling, tasty knob of the other. All the while, gratifying pleasure courses up your body from the femboy behind you driving his dick into your [pc.ass] unabated.");
	}
	//merge
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",raskOrgyPart2,route);
}

public function raskOrgyPart2(route:String):void
{
	clearOutput();
	showName("\nORGY");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	output("The sensation of getting thoroughly gangbanged like this is overwhelming, and you are quickly forced to an orgasm which grips your entire body, ");
	if(pc.hasVagina()) output("[pc.eachVagina] seizing up repeatedly and coating the raskvel’s groin in [pc.girlCum]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasCock()) output("[pc.eachCock] tensing up and blowing lines of [pc.cum] all over the cushions you’re knelt on");
	output(", and you writhe in delight around the cocks you’re pinioned upon.");

	output("\n\nThe Sydian Queen’s mouth is open, delight tautening her features as she watches. No sharp words emanate from that armored throat now - just high, rasping breaths. She’s got her powerful thighs wrapped around Azaphel’s head, trapping his face deep between them, and her sceptre’s end is engaged in clumsily pawing at her breast.");

	output("\n\nYour attention is brought abruptly back to your own knitting when, with a whispery groan, ");
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff") output("one of ");
	output("the raskvel behind you squeezes your [pc.thighs] hard, hilts himself in your [pc.vagOrAss] and implants a ");
	if(pc.hasVagina()) output("womb");
	else output("gut");
	output("-swelling load of hot cum into you. Void below, was that a single ejaculation?! The way your belly has been swollen out by that heavy liquid weight, it’s as if he’s made you three months pregnant in the space of three seconds. The reptilian femboy has barely slowed down; he’s still hammering himself athletically into your cum-stuffed ");
	if(pc.hasVagina()) output("snatch");
	else output("asshole");
	output(", spattering it everywhere, digging into your tenderized walls in a way that makes you utter gasps around the erect cock you’re tending to with your mouth.");
	//Supah loose or DP
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff")
	{
		output(" It’s made all the more intense that the raskvel ");
		if(route == "doublestuff") 
		{
			output("also embedded in your ");
			if(pc.hasVagina()) output("twat");
			else output("ass");
		}
		else
		{
			output("embedded in your ");
			if(pc.totalVaginas() > 1) output("other twat");
			else output("ass");
			output(" hasn’t slowed down at all. Evidently the more judicious of the two, he’s still thrusting his piping hot meat into you with excited claps of his muscle-curved thighs.");
		}
	}
	output("\n\n<i>“Must! Breed! Must! Breed! Got to... get it... all out!”</i> he groans, lost in an exhilarated frenzy. Any attempt to express your own feelings about this are lost when the raskvel in front tightens up fiercely and then flumes a similarly huge gush of salty, musky seed into your mouth, bloating out your cheeks and making you cough a fair bit up your nose. ");
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff") 
	{
		output("This one is considerate enough for you to wait for you to recover yourself, but his ardour is every bit as unassuaged as the one fucking your cum-gorged ");
		if(!pc.hasVagina() || route == "normal DP") output("back passage");
		else output("pussy");
		output("; once you’ve taken a deep breath he firmly grips your head and spears his dripping, still-very-much-erect penis back into your mouth, groaning with deepest satisfaction when your [pc.lips] touch his scaly sheath.");
	}
	else output(" He pulls back with a gratified sigh, although his balls are still the size of grapefruits and he hasn’t lost his erection even slightly; the other is patient enough to wait for you to swallow and take a deep breath before firmly gripping your head and spearing his own dick into your mouth, pantingly eager to reach his own release.");

	output("\n\n<i>“Yeeesss, that’s it my lovely boys, my ever-so-loyal sluts,”</i> crows the sydian, head-feathers twitching as she thrusts her lower body into Azaphel’s face. <i>“Get it all out of you! Enjoy the alien to your honest hearts’ content! You deserve it for being so good, don’t you? Yes you do.”</i> She opens her thighs for a moment; you can hear the raskvel femboy’s gasp for air from where you are. Then her legs are around him again, thrusting him back into her sopping pussy. <i>“You may continue. I have barely started.”</i>");

	output("\n\nYou are barely sensate as one of the raskvel rocks you backwards onto his lap, groaning with joy as he sits you down on his sex, penetrating your [pc.anus] right down to the base; another clasps himself around your front, his hot lips finding a [pc.nipple] and ");
	if(!pc.hasFuckableNipples()) output("nibbling");
	else output("tonguing");
	output(" it hungrily ");
	if(pc.isLactating()) output("until [pc.milk] begins to dribble into his mouth ");
	output("as he ");
	if(pc.hasVagina()) output("sinks his cock back into your thoroughly gaped cunt");
	else output("frots himself against your [pc.cock] energetically");
	output(", all the while the one behind pounds your [pc.ass] with urgent jerks of his rabbit-like hips, whipping intense sensation right into your core.");

	output("\n\nThe other simply sits, stroking himself as he watches, waiting to take his turn as soon as one of his fellows cums again. And again. And again. They have royal permission to use you to drain every last drop they have in their terribly denied ball-sacks, and that’s exactly what they do. The relentless stimulation, the taste of sweat and sex and the beat of insatiable lizard dick against your ");
	if(pc.hasCock()) output("prostate ");
	if(pc.isHerm()) output("and ");
	if(pc.hasVagina()) output("pussy walls ");
	output("causes you to break down into a quivering, spaced-out sub-state, happy to take the relentless fucking in every aching, leaking hole in every position the raskvel can think of, cooing as cum is spurted over your face, your [pc.chest] and across your [pc.skinFurScales], mind blown away by orgasm after orgasm.");
	var x:int = 0;
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",raskOrgyPart3,route);
}

public function raskOrgyPart3(route:String):void
{
	clearOutput();
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	showName("AFTER\nORGY");
	author("Nonesuch");
	output("You’re not sure how much time passes, down there in the still, glittering air, before ");
	if(pc.hasFuckableNipples()) 
	{
		output("you’re lying on your front, holding your [pc.chest] so a pink raskvel can hammer his length into your ");
		if(!pc.hasLipples()) output("[pc.nippleCunts]");
		else output("[pc.nipples]");
		output(", dilating the sensitive insides with delightful pressure. You moan as your chest seizes up in boob-gasm, ");
		if(pc.isLactating()) output("[pc.milk]");
		else output("[pc.girlCum]");
		output(" spurting out around the reptilian cock, ");
		output("and sigh as the flexing causes him to catapult into a gasping orgasm as well, packing your fuckable tit out with yet more hot, oozing cum.");
	}
	else if(pc.biggestTitSize() >= 4) output("you’re lying on your front, holding your [pc.chest] together so that a pink raskvel can hammer his length between your sweat-slicked cleavage, pleasure twinging through you as his adept little fingers fondle your [pc.nipples]. You sigh, eyes closed and utterly blissed out, as he moans and shoots another hot, sticky load of cum onto your face.");
	
	else output("you’re lying on your side, holding your arm against your chest so that a pink raskvel can hammer his length between them, rubbing himself against your flat [pc.skinFurScales] to another tingling high. You sigh, eyes closed and utterly blissed out, as he moans and shoots another hot, sticky load of cum onto your face.");

	output("\n\nAt last, the rabbit-reptile flops down onto the cushions, flaccid and bollocks almost normal-sized, eyes unfocused and mouth turned up into a dopey grin, joining his similarly appeased, dozing fellows. You are left lying on your side, exhausted and covered from head to tail in cum, every hole stretched open and thoroughly used");
	if(pc.hasCock()) output(", [pc.eachCock] tingling and throbbingly empty itself.");

	output("\n\n<i>“Mmm,”</i> whispers the Sydian Queen, drinking you in, tongue trailing down a long, thin finger. Azaphel dozes at her feet. Your head thunks into the sweet softness of a wool-stuffed pillow. You’re not able to support it any longer. Your [pc.eyes] close, the insect woman’s words droning through your exhausted mind. <i>“What a pleasing treat time that was. Perhaps we should keep you? ");
	if(!pc.hasVagina()) output("My future court shall always call for entertainment.");
	else output("I will have need of a healthy, eager breeder like you, if I am to swell the ranks of my raskvel army.");
	output(" Ahh.... but no. It would shame me to cage a spirit who gave of themselves so readily and freely. A pity...”</i>");

	processTime(3*60);

	//Having each rask jizz 5 rasks worth of jizz at once in an attempt to actually fill up the PC's cunt.
	for(x = 0; x < 5; x++) { pc.loadInMouth(chars["RASKVEL_MALE"]); }
	if(route == "anal+HJ")
	{
		for(x = 0; x < 5; x++) { pc.loadInAss(chars["RASKVEL_MALE"]); }
	}
	else if(route == "normal DP")
	{
		for(x = 0; x < 5; x++)
		{ 
			pc.loadInAss(chars["RASKVEL_MALE"]);
			pc.loadInCunt(chars["RASKVEL_MALE"],0);
		}
	}
	else if(route == "pussies DP")
	{
		for(x = 0; x < 5; x++)
		{ 
			pc.loadInCunt(chars["RASKVEL_MALE"],0);
			pc.loadInCunt(chars["RASKVEL_MALE"],1);
		}
	}
	else if(route == "doublestuff")
	{
		if(pc.hasVagina())
		{
			for(x = 0; x < 5; x++)
			{ 
				pc.loadInCunt(chars["RASKVEL_MALE"],0);
				pc.loadInCunt(chars["RASKVEL_MALE"],0);
			}
		}
		else
		{
			for(x = 0; x < 5; x++)
			{ 
				pc.loadInAss(chars["RASKVEL_MALE"]);
				pc.loadInAss(chars["RASKVEL_MALE"]);
			}
		}
	}
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",raskOrgyPart4);
}

public function raskOrgyPart4():void
{
	clearOutput();
	showAzra();
	showName("WAKE\nOF SHAME");
	author("Nonesuch");
	output("You wake up with a start. You’re outside on the surface of Tarkus again, in the shadow of a rust spire. Your [pc.gear] has been piled roughly on top of you, and you seem to be have been given a rough towelling - although you still absolutely reek of cum. You stagger yourself upright and drag your stuff on. Oh <i>man</i> are you sore!");
	output("\n\nYou find Azra over the next rise, sitting cross-legged next to a partially dissected slutshrooms with her holo-pad. She smiles and waves with obvious relief when she catches sight of you.");
	output("\n\n<i>“Did you have a good time?”</i> she calls. She watches as you ");
	if(pc.legCount > 1) output("bow-leggedly");
	else output("very tenderly");
	output(" make your way over to her. <i>“I, uh... guess you did!”</i> She snaps her pad shut and gathers up her samples briskly. <i>“Can we go back to the ship now?”</i>");
	output("\n\nThat sounds like a great idea.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Lay Her
//Needs a not absurdly sized dick
//Tooltip: Dick the sydian. You may require some femboy fucking to get to her.
//550 max volume
//11" is max for hilting :3

public function fuckTheSydianQueen(x:int):void
{
	clearOutput();
	showName("LAY\nHER");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");

	output("The tall, armored demagogue can hardly have shaken that tail in front of you, flashed that orange bejazzle, and expected you to settle for anything less than first prize here. You return her gaze with all the unabashed smolder you can muster, ");
	if(!pc.isCrotchExposed())
	{
		output("shaking off your [pc.crotchCovers] and allowing your semi-erect [pc.cockNounSimple " + x + "] to flop out");
	}
	else if(pc.hasSheath()) output("letting your [pc.cockNounSimple " + x + "] slide out of your [pc.sheath " + x + "] gratifyingly");
	else output("let your equipment fall to one side, deliberately swinging your semi-erect [pc.cockNounSimple " + x + "] as you do so.");

	output("\n\n<i>“Brave intent,”</i> hisses Sydian Queen, black eyes hopscotching up and down your naked body. <i>“You fancy yourself prime enough to make a treat of <i>me</i>, do you?");
	if(flags["AZRA_RASK_PC_SUCKED"] != undefined) output(" Or perhaps you’ve convinced yourself you are due that for getting on your knees for one of my servants.");
	output("”</i> Her tone is one of arch amusement, but there’s plenty of fire in that tan, oval face, and her long feathers ripple and quiver. Her thin tongue extends out of her mouth, dabs along a finger. <i>“");
	if(!pc.hasVagina() && pc.mf("","f") == "f") output("I favor watching youthful girly boys tussle with one another for my pleasure, personally. And why should I favor you above my own, loyal catamites?”</i> She waves airily at the pink raskvel, who are watching this exchange with baited breath. <i>“I think you are going to have to prove your virility, if you fancy your chances with me.”</i>");
	else output("How fetchingly bold. But I have a cupboard full of willing toys, as you can clearly see.”</i> She waves airily at the pink raskvel, who are watching this exchange with baited breath. <i>“I think you are going to have to prove you can go the distance, if you fancy your chances with me.”</i>");

	output("\n\nThe trash tramp’s interminable teasing - married to the shift of her loosened plates over the softness of her inner body - has provoked you");
	if(pc.balls > 0) output(", heavy heat swelling your [pc.balls]");
	output(". Hell yeah, you’ll prove yourself. You’ll prove yourself all night.");

	output("\n\nAzaphel the raskvel can presumably see some of what you’re thinking on your face, given the apprehension written upon his own pretty features, but he doesn’t do anything but shiver and gasp slightly as you grab ahold of him, stroke his fat, scaly tail and long, sensitive ears as you pressure him down onto his hands and knees.");
	//If PC blew him:
	if(flags["AZRA_RASK_PC_SUCKED"] != undefined)
	{
		output("\n\n<i>“What goes around comes around, you lil bastard,”</i> you whisper in one of those long, rabbit-like flaps as you lift his tail to reveal his curvy backside, rounded and padded in a manner that cries out for a good, hard buttfucking.");
	}
	else output("\n\nYou lift his tail to reveal his curvy backside, rounded and padded in a manner that cries out for a good, hard buttfucking.");
	output(" You slap your [pc.cock " + x + "] into the warm crevice, rubbing some delightful friction into it as you lean over and nibble on an ear, delighting at the high moan and raise of the tail this draws out of the small, effeminate reptile.");
	output("\n\n<i>“Sessalai! Here!”</i> raps the sydian, pointing at her chitinous feet. She’s watching you molest her servant with a bitten lip, anticipation writ large on her face - and the erect nipple she’s got squeezed between her knuckles, pulling and twisting the sensitive nub as she drinks you in. Your [pc.eyes] are on those, the delightful action of her fingers, as you draw your diamond-cutter of an erection back over the pink pad of Azaphel’s anus until the [pc.cockHead " + x + "] is positioned against it, and then press it home, groaning at the delicious, warm tightness that envelopes you as you open him up.");
	pc.cockChange();
	output("\n\nThe raskvel moans and then wails, claws sinking into the dusty cushions you’re on, as you inexorably sink more and more of your [pc.cockNounSimple " + x + "] into his tail-hole, wriggling around you, but it’s obvious he’s no novice to this; his warm flesh keeps loosening around your girth to accommodate you ");
	if(pc.cocks[x].cLength() <= 11)
	{
		output("until your ");
		if(pc.balls > 1) output("[pc.balls]");
		else output("[pc.thighs]");
		output(" are lightly touching his supple bum cheeks.");
	}
	else output("despite your prestigious size.");

	output("\n\n<i>“Yeeeesss,”</i> hisses Queen Sydian, black eyes alive with delight as she watches you saw back and forth into the prostate raskvel, gradually but relentlessly building up a rhythm which makes a glow of intense pleasure work its way right up your [pc.cock " + x + "] and up into your groin. She’s got Sessalai’s head pressed between her open thighs, long ears and tail twitching as he obediently eats her. <i>“This is what I lack! " + pc.mf("An alpha male","A " + (pc.isHerm() ? "hermaphrodite" : "shemale") + " taskmaster", true) + " to keep my servants in check and give them regular milkings!”</i>");
	output("\n\n<i>“No, my queen! I can be that for you, see!”</i> The third raskvel has got the fourth pinned beneath him; he’s giddily flapping his curvy thighs into his fellow’s behind, whose eyes are crossed. A gurgling, helpless moan and a gushing sound draws your attention back to your own bottom. A thick cum is oozing from Azaphel’s bright purple cock, forced out from his sheath by the unstoppable bludgeoning of your own fuck-pole on what is evidently an outsized and very sensitive prostate.");
	output("\n\n<i>“That’s sweet of you, Meffilin,”</i> coos the sydian to the upstart raskvel, crossing her long legs around her designated muff-servicer, muscles shifting and tightening in her thighs. <i>“But you’ve never made one of my other guards cum like a girl in seconds, have you?”</i>");

	output("\n\nYou smirk and pound ");
	if(pc.cocks[x].cLength() > 11) output("into ");
	else output("your [pc.hips] into ");
	output("Azaphel’s upraised backside even harder, drawing a wail out of him and a giant gush of cum all over the cushions beneath, his swollen balls deflating with every returning thrust of your [pc.cock " + x + "] into his tight, clenching asshole, keeping your eyes fixed on his self-styled queen the entire time. The hot lust coursing up your shaft ");
	if(pc.balls > 0) output("and tightening up your [pc.balls] ");
	output("is giddying, the desire to unload yourself and bloat this femboy with your seed growing - but she demanded someone who could go the distance, and that’s exactly what you’re proving.");

	output("\n\nWith a shivering cry, the fourth raskvel orgasms, unable to keep fucking his peer without losing himself to intense excitement, shooting back out in a rocket trail of backed-up cum. You, however, don’t stop buggering poor Azaphel, reaching deep into his delicious tightness, until he’s lying quivering in a lake of his own cum, his balls shrunk down to grape size. And when you slowly withdraw out of his thoroughly gaped hole, relishing the warm texture sliding up it, your [pc.cock " + x + "] is still rock-hard, dripping pre. The sydian has been arching her back, mouth open and feathers fluttering as she watches this act of anal destruction, and when she sees this she roughly pushes Sessalai to one side and opens her arms to you, her orange pussy unfurled and tongue-polished, gleaming and ready.");

	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",fuckTheSydianQueen2,x);
}

public function fuckTheSydianQueen2(x:int):void
{
	clearOutput();
	showName("SYDIAN\n“QUEEN”");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE");
	output("Pulse thudding in your temple, you [pc.move] across and mount her on her reconstructed throne, the smooth, unyielding back-plates against your arms contrasting to the suppleness of her breasts pooling into your [pc.chest]. It takes barely a second to line your [pc.cockHead " + x + "] up with her puffy, split tangerine of a cunt. Sliding into her is like slipping into a silky, sultry dream.");
	output("\n\n<i>“Yeeeessss,”</i> she hisses in delight, tightening her thin, armored fingers around your shoulders as you dip your [pc.cock " + x + "] into her spongy, sopping tunnel. You find her limit and slowly withdraw, and she tightens her athletic thighs around your waist, reaching down to snatch at your [pc.ass], impatient for the returning thrust. <i>“You! Servants! Rut each other for my pleasure! You have permission to cum as much as you waaaafnnnn.”</i> She trails off in an euphoric croon as you give it her, groaning yourself as you immerse your dick from ");
	if(pc.cocks[x].cLength() <= 11) output("[pc.cockHead " + x + "] to [pc.sheath " + x + "]");
	else output("[pc.cockHead " + x + "] to halfway down the massive shaft");
	output(" in simmering, orange delight. She gestures over your shoulder distractedly. <i>“I demand a soundtrack of boy fuckings! Uff! ThequeenhasspokenYES!”</i>");

	output("\n\nYour [pc.lips] descend to her nipples, so protuberant and swollen from the merciless mauling they were receiving from their owner, and you are rewarded with another gleeful hiss when you roll one hungrily between your teeth, flicking at it with your [pc.tongue]. She claps her thighs against you roughly, rocking the throne beneath you, urging you on, until you’ve got them hiked up at the knees and are thrusting your fuck-pole into her wet depths with everything you’ve got, sweat glossing your [pc.skinFurScales] and her own, soft inner flesh, sheer pleasure tightening up your muscles.");
	output("\n\n<i>“Breed me,”</i> she snarls in your [pc.ear], arm hooked around your neck. <i>“Give me children born of alien stamina and honor, so I may have a dynasty that SHAKES this dying world!”</i>");
	output("\n\nCertainly, you’re shaking something for her. You reach into her deep and orgasm in an unstoppable torrent, your [pc.cock " + x + "] twitching and then disgorging [pc.cum] in ecstatic blasts. ");
	if(pc.hasKnot(x)) output("A breeding is what she wants, and a breeding is what she’s going to get. She whines and then huffs as you push your [pc.knot " + x + "] in, swelling up and stretching her plump entrance closed with your hard, bulging meat. ");
	output("The tall, proud sydian makes guttural noises of purest gratification as you cum into her, her lush walls rippling around your flexing shaft, the lithe muscles in her bare legs and tummy molding into your [pc.skinFurScales].");

	output("\n\n<i>“Mmm... but you’re not done yet, are you?”</i> the harsh-voiced, mesmerizingly-bodied autarch whispers, when finally your thrusts begin to slow down. <i>“No... my youthful, star-born mate, [pc.heShe] still craves to serve [pc.hisHer] queen, does [pc.heShe] not?”</i> She shifts around your cock, still mired deep within her cum-packed fuck-sleeve. You exhale raggedly. Yeah. You could probably go again. You’re the all-conquering champion, after all.");
	output("\n\n<i>“Yeeeeesssss. You relax. Let the queen do as she may with her prize,”</i> coos the sydian, shifting around you");
	if(pc.hasKnot(x)) output(", patiently waiting for your [pc.knot " + x + "] to deflate first");
	output(", until your [pc.butt] is on the fur-lined seat of the throne and her dense, tan-skinned weight is on top of you. She strokes your chin, cackles a bit when her movements dislodge a gooey load of [pc.cumColor] spooge out of her swollen, orange snatch and down your [pc.thighs], and then slowly but surely swivels herself around. You groan at the delectable sensation of her tunnel twisting around your shaft, still hard, still up her...");

	output("\n\n<i>“You like that, don’t you [pc.boyGirl]?”</i> she says archly, gazing at you over her shoulder, her big, round butt now in your lap. You sneeze, reactively twitching as her tail brushes over your face, and you feel a giddy rush as the feather dust disappears into your nostrils, heat rising to your [pc.skin]. <i>“Isn’t your queen benevolent to allow you to marvel at every inch of her illustrious form as you breed her? Do you not see how strong and beautiful your daughters shall be? Is she not the primest sydian you have ever laid your eyes on?”</i> She wriggles her ass at you, feathers flicking, squirming around your [pc.cock " + x + "]. Renewed lust surges through your veins. You grab her by the waist, holding her still so that you can thrust upwards into her cum-caked pussy, registering a ‘splorch’ and a delighted, husky squeal.");
	output("\n\nIt takes your fuck-addled senses a bit to catch up, but you realize that letting you see her bum was not exactly the reason why the sydian wanted to face this way. Her raskvel consort are doing exactly as they were ordered, unleashing their bottled up libidos on one another in a desperation-tinged orgy. The one who had a go at challenging you is now on his hands and knees wedged between two others, joy on their hot-cheeked, youthful faces as they relieve their straining ballsacks into his mouth and curvy butt in heavy spurts again and again. Then the fourth rolls into Sessalai from behind, struggling with him whilst urgently frotting his shiny purple lizard dick against his, half-fighting, half-fucking. They’re constantly changing position, rabbity impulses and rapacious libidos spilling out over the cushioned hollow, girly gasps, squelches and the leathery slap of scales on scales echoing against the surrounding rock and metal.");
	output("\n\nThe sydian watches this feverish display of femboy decadence with triumphant lust, flexing her powerful hindquarters to ride you with increasingly violent jolts, her tail rearing back and forth, constantly swishing you in the face. You take one hand off her waist to slap her brawny ass, trying to get her to stop, but if anything this spurs her on; your [pc.cock " + x + "] is jerked backwards and forwards in her oozing tunnel, kneaded by her churning movements as she growls and hisses with wordless delight, orgasming to the debauchery she’s centred herself in.");
	output("\n\nYou do your best to keep the wolf from the door, and you do spend long minutes determinedly thrusting into her writhing, sopping hotness, giving as good as you get; but with her pheromones high in your veins and sex assaulting your every sense, you can’t last forever. You grip her thigh with one hand, enclose a squishy boob with the other - push yourself ");
	if(pc.cocks[x].cLength() <= 11) output("up to the [pc.sheath " + x + "]");
	else output("almost up to the [pc.sheath " + x + "]");
	output(" - and flume another heavy load of [pc.cum] into her breeding bay, wonderful, juicy pulses that have your [pc.thighs] pumping up into hers on auto-pilot. You don’t stop until your ");
	if(pc.balls > 1) output("[pc.balls]");
	else output("[pc.cock " + x + "]");
	output(" are achingly, gratifyingly empty, and you can do nothing but flop back against the throne’s back, utterly spent.");

	output("\n\n<i>“Done already?”</i> The sydian’s words come to you through a mist of exhausted bliss. You exhale slowly as she rises up, allowing your dick to flop out her extremely well-seeded hole. The giddy, ecstatic strains of raskvel at play continue unabated. <i>“Oh well - perhaps you’re not king material after all. But you have given me what I desired, and put on a good show, valiant, virile stranger - and I can finish up with my servants. Be at ease, and rest.”</i>");

	output("\n\nYou’re more than happy to obey that, slumped in the cozy, albeit sticky, furs of the throne. Your last sight of the tall, regal insect woman is her stalking down towards the four raskvel, feathers swishing, leaving a trail of [pc.cum] behind her...");

	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckTheSydianQueen3);
}
public function fuckTheSydianQueen3():void
{
	clearOutput();
	showAzra();
	author("Nonesuch");
	output("You wake up with a start. You’re outside on the surface of Tarkus again, in the shadow of a rust spire. Your [pc.gear] has been piled roughly on top of you, and you seem to be have been given a rough towelling - although you still absolutely reek of sex. You stagger yourself upright and drag your stuff on. You groan as an almighty throb emanating from your groin gives you another reminder of your utter wantonness.");
	output("\n\nYou find Azra over the next rise, sitting cross-legged next to a partially dissected slutshrooms with her holo-pad. She smiles and waves with obvious relief when she catches sight of you.");
	output("\n\n<i>“Did you have a good time?”</i> she calls. She watches as you ");
	if(pc.legCount > 1) output("bow-leggedly");
	else output("very tenderly");
	output(" make your way over to her. <i>“I, uh... guess you did!”</i> She snaps her pad shut and gathers up her samples briskly. <i>“Can we go back to the ship now?”</i>");
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",backSafeAndSoundAfterTarkusBooty);
}

//Reject
public function rejectTheQueen():void
{
	clearOutput();
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");
	author("Nonesuch");
	output("<i>“No.”</i> You stand up proudly. <i>“I don’t think so.”</i>");
	output("\n\nThe Queen shrugs. <i>“A shame. You had such potential.”</i>");
	output("\n\nHer bodyguards open up with their pistols before you’re halfway to adopting a combat stance, lighting up the space between you in a rainbow cacophony of alternating ultraviolet hues. There’s no time to wonder where they got such powerful weapons, not when the world as you know it fades away into nothing. You’ll never know if Azra survived. You certainly didn’t.");
	badEnd("GAME OVER.");
}

public function backSafeAndSoundAfterTarkusBooty():void
{
	clearOutput();
	showAzra();
	flags["AZRA_TARKUSED"] = 1;
	moveTo(shipLocation);
	output("You’re in the shadow of Novahome once more, and after slowly guiding Azra through the throngs of curious raskvel, back in your ship.");
	output("\n\nOnce the door closes, the towering suula slumps a bit, wingtips drooping. <i>“For a quick mission... that was exhausting.”</i> She brushes back her hair. <i>“");
	if(flags["AZRA_RASK_ORGIED"] == 1) output("Especially all the sex. ");
	output("There were a couple times there where I thought we were doomed for sure. I didn’t even know gray goo could get that big... or have two heads!”</i>");

	output("\n\n<i>“I didn’t know that either.”</i>");

	output("\n\n<i>“Right?”</i> Azra shakes her head. <i>“And that Raskvel. If that’s a side effect of excess motherhusk exposure, I’ll need to be careful with how we contain them. The last thing I want to do is turn this whole ship into a pile of immobile baby factories.”</i>");
	output("\n\nYou nod");
	if(pc.isTreated()) output(", though the idea has more than a little appeal to you");
	output(".");

	//Azra serviced raskvel
	if(flags["AZRA_RASK_ORGIED"] == 1) output("\n\nBurping, the suula grimaces. <i>“Excuse me.”</i> She licks her lips, savoring the rasky residue still lingering on them. Too late, her thoughtful expression switches to distaste. <i>“At least we got a meal out of it.”</i>");
	//Else PC serviced raskvel.
	else if(flags["AZRA_RASK_PC_SUCKED"] == 1)
	{
		output("\n\nAzra wipes something off your cheek. There’s only one thing it could be. Before you can thank her, you burp. It tastes like rask-cum. The flavor still lingers on your lips and in your breath. Your kisses must taste like cock-sucking.");
		if(pc.isBimbo()) output(" Awesome.");
		output(" <i>“Thanks,”</i> you ");
		if(pc.isBimbo()) output("cheerfully chirp");
		else if(pc.isNice()) output("sheepishly mumble");
		else if(pc.isMischievous()) output("say, giving her a thumbs up");
		else output("begrudgingly whisper");
		output(".");
		output("\n\n<i>“I should be thanking you,”</i> Azra says. <i>“You endure so much, and yet I have so little to offer you.”</i>");
	}
	//Else
	else
	{
		output("\n\nThe suula grimaces. <i>“At least we got away from that faux monarch and her tiny army without incident. Could you imagine, coming this far only to be shot down by a bunch of sex-addicted raskvel?”</i> She shakes her head, sending her sun-kissed tresses bouncing. <i>“I thought we were goners for sure. That or doomed to a life of sexual servitude. I’ve read the articles. I know how lax law enforcement can be on the frontier. It could be decades before the UGC bothers to properly deal with that bunch.”</i>");
	}
	//Merge
	output("\n\n<i>“But we did it.”</i>");
	output("\n\nAzra brushes back her hair, wings spreading proudly behind her. <i>“We did.”</i> She bounces the sample-stuffed pack hanging from her back.");
	//No new PG. Business relations.
	if(azraProfessional())
	{
		output("\n\n<i>“I better get cleaned up and get these puppies placed in their new homes. Give me 24 hours, and I should have the fruits of labors growing nicely.”</i> Azra flutters down the hall toward her quarters. She lingers at the door, craning her head back to flash you a sharp-toothed smile. <i>“Thanks again, [pc.name]. The galaxy owes you a debt of gratitude.”</i> She disappears around the corner, then pops her head back in. <i>“I do too.”</i>");
		output("\n\nThis time, she actually leaves.");
		processTime(25);
		clearMenu();
		pc.createStatusEffect("Azra CD");
		pc.setStatusMinutes("Azra CD",24*60);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Sloot relations
	else
	{
		output("\n\n<i>“These little guys should be okay for another hour or two. Why don’t we get cleaned up.”</i> She jerks her head back to her quarters. <i>“Nothing about this planet is clean... and I could use a little help getting between my wings.”</i>");
		output("\n\nYou smile and step closer. <i>“That all you need help cleaning?”</i>");
		//No genitals - lock into nonsloot stuff.
		if(!pc.hasGenitals())
		{
			output("\n\nAzra shakes her head. <i>“Actually... never mind. I’m sorry. You’re a really great " + pc.mf("guy","girl") + ". I don’t want to give you the wrong idea. I like you... I really do, but the whole lack of genitalia thing is kind of a deal breaker for me. I don’t want to lead you on.”</i> Azra pouts. <i>“Tell ya what, give me a day to get our samples growing, and I’ll let you have an early harvest.”</i> She pats your shoulder.");
			output("\n\nWell, that’s disappointing. You’re still reeling in shock when she slips through the door.");
			flags["AZRA_CHOSE_PROFESSIONAL"] = 1;
			pc.createStatusEffect("Azra CD");
			pc.setStatusMinutes("Azra CD",24*60);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		//Genitals
		else
		{
			output("\n\nAzra’s knees knock together with an audible ‘clang’. Her cheeks light up brighter than a starship fighting a gas giant’s gravity well. <i>“I guess we did get pretty dirty.”</i> She bites her lip, the triangular teeth creating dozens of depressions in the luscious onyx flesh. <i>“But if you’re going to clean more than my back, I’m not letting you go until you’re spotless.... Okay, Captain?”</i>");
			//Bimbo
			if(pc.isBimbo()) output("\n\nAs a fluent speaker of double-entendre, you’re elated to hear the scientific shark-girl is finally going to give it to you. <i>“It’s gonna be a super long shower then,”</i> you explain. <i>“I’m a super dirty " + pc.mf("boy","girl") + ".”</i>");
			//Bro
			else if(pc.isBro()) output("\n\n<i>“Sure.”</i> You brazenly grab at your crotch and adjust yourself. <i>“Buncha dirt got in there, though.”</i>");
			//Nice
			else if(pc.isNice()) output("\n\n<i>“Sounds more than fair.”</i>");
			//Mischievous
			else if(pc.isMischievous()) output("\n\n<i>“I think I can let a little insubordination slide this one time,”</i> you say with a sly smirk. <i>“But further infractions might warrant a spanking.”</i>");
			//Hard
			else output("\n\n<i>“If you were any less hot I might take issue with that,”</i> you admit.");
			//Merge
			output("\n\nAzra flushes hotter, then races toward the bathroom faster than a railgun bolt. You take off after her, imagining her naked all the while.");
			processTime(25);
			pc.changeLust(5);
			clearMenu();
			addButton(0,"Next",azraFirstTimeBangIntro);
		}
	}
}
//[Next]
public function azraFirstTimeBangIntro():void
{
	clearOutput();
	showAzra();
	output("Azra’s pack is placed neatly on the bed. A trail of discarded armor litters the floor, spread from bed to the bathroom door. The groin guard is visibly moist on the inside - moist enough to puddle in the cylindrical depression worn into the cushioning foam.");
	if(flags["AZRA_SEX_KNOWN"] == undefined) output(" Azra must have a pretty big cock, you wager. It’s not too late to bail, but you doubt you’ll get another chance like this if you do.");
	else output(" Not even high-tech armor can contain the shark-girl’s long-denied lusts.... This would be your last chance to bail out, but you imagine it would sour any romantic possibilities.");
	processTime(3);
	//[Follow] [Bail]
	clearMenu();
	addButton(0,"Follow",followAzraForFirstTimeBango);
	addButton(1,"Bail",azraRainCheckCollecto);
}

//Bail
public function azraRainCheckCollecto():void
{
	clearOutput();
	showAzra();
	output("<i>“Azra,”</i> you call. <i>“I’m gonna have to take a rain check.”</i>");
	output("\n\n<i>“Oh,”</i> comes the scientist’s voice from inside the shower. So much hurt is packed into that one syllable. <i>“...Okay. I’ll catch you later... I guess.”</i> The water is turned up to full-blast, drowning out any further communication, though you swear you hear a hint of sniffling.");
	output("\n\nYou turn away, excited to see what will come of this latest expedition.");
	flags["AZRA_CHOSE_PROFESSIONAL"] = 1;
	processTime(3);
	pc.createStatusEffect("Azra CD");
	pc.setStatusMinutes("Azra CD",10*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Follow
public function followAzraForFirstTimeBango():void
{
	clearOutput();
	showAzra(true);
	output("You step into the steam-filled bathroom");
	if(flags["AZRA_SEXED"] == undefined) 
	{
		output(", shedding gear as you go. All the moisture in the air makes the caked on grime");
		if(pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")) output(", cum,");
		output(" and rust from the Tarkus wilds cling to your [pc.skin] in an oily slurry. ");
	}
	else output(". ");
	output("A shower");
	if(flags["AZRA_SEXED"] != undefined) output("-fuck");
	output(" is just what you need.");
	output("\n\nSilhouetted through the shower’s privacy field is Azra, completely nude and aroused, if the pixelated distention emerging from her crotch is any indication. Azra is <i>hung</i>. It’s big enough for her to give ");
	if(kiroSexed()) output("Kiro a run for her money.");
	else if(flags["EMMY_FUCKED"] != undefined) output("Emmy a complex over her smaller size.");
	else output("the biggest women in the galaxy a night to remember.");
	output(" The things that could do to a more modestly proportioned individual");
	if(pc.tallness < 55) output("... like yourself");
	output("....");
	output("\n\nThe privacy field tingles against your [pc.skin] as you step through, filling your ears with static and your mind with anticipation for the sights beyond. Fully inside, you open your eyes");
	if(pc.tallness < 6*12) output(" to find Azra towering over you.");
	else if(pc.tallness < 8*12) output(" to find Azra looming over you.");
	else output(" to find Azra a scant few inches away.");
	output(" She’s naked. Completely naked, from head to toe. You can see everything without distraction. Silence reigns as you each take a moment to appreciate the other’s body.");

	//Shorties
	if(pc.tallness < 6*12)
	{
		output("\n\nAzra’s cock is enormous. You know because you’re approximately level with the tip. It bows slightly under its own weight, showing you the shiny reddened crown and the ring of tentacles that stroke and slither over the water-moistened flesh. A hairless ballsack hangs behind, taut from its two softball sized passengers. Hidden just behind is her pussy. You can’t see it, but you can sure as hell smell it. She is ripe with need. It’s a purely feminine aroma, laced with a hint of peachy sweetness.");
		if(pc.isTreated()) output(" Her pheromones are intense, almost as powerful as a Treated girl’s. You can tell with a single whiff that she needs fucked badly, if not by you than by the next cock she bumps into.");
		output("\n\nYou are so distracted by the sexual cornucopia in front of you that you don’t even have time to look at the pillowy mountains above, capped by the golden points of her nipples, not until their incessant jiggling draws your eyes upward. The journey across her belly is delightful, revealing a middle gently padded by years of well-lived yet unmarred by blemish. Then there’s Azra’s underboob; a titanic shelf with waterfalls of pure water spilling through the cleavage. It’s gorgeous.");
	}
	//Nonshorts
	else if(pc.tallness < 8*12)
	{
		output("\n\nAzra’s cock is big enough that it nearly stabs you in the chest. The bulbous, shiny crown is ringed by a tiny tentacles that stroke and slither across the water-moistened flesh.");
		if(pc.biggestTitSize() >= 1) output(" One curls out to caress your [pc.biggestBreastDescript], leaving you inexplicably flushed in its wake.");
		output(" Just beneath is a smooth, hairless ballsack, stretched taut by the two softball-sized testes inside. She’s got a pussy somewhere back there too. You can smell a hint of it lingering under the scent of soap and suula. It’s a musky, sweetened with a vaguely peachy aroma that has you licking your lips.");
		if(pc.isTreated()) output(" By pheromones alone, you know she’s a very fertile girl, and absolutely dripping with consent. She wants you. She wants you bad.");
		output("\n\nYou are so distracted by the sexual cornucopia in front of you that you don’t even have time to look at the pillowy mountains above, capped by the golden points of her nipples, not until their incessant jiggling draws your eyes upward. The journey across her belly is delightful, revealing a middle gently padded by years of well-lived yet unmarred by blemish. Then there’s Azra’s underboob; a titanic shelf with waterfalls of pure water spilling through the cleavage. It’s gorgeous.");
	}
	//Tallish
	else
	{
		output("\n\nAzra’s pillowy tits wobble with her every breath. Unsupported, they’re too big and too pillowy not to jiggle from her errant motions. Her puffy areola are perfectly smooth save for the jutting tips of her motherly nipples, each as thick around as a finger. The golden discs draw your eyes any time you try to look at the rest of her. It doesn’t help that they’re thrust so close to your face, all but begging to be sucked. She’s horny too. Even if her immense dick wasn’t jutting out, down below, you’d know. You can smell her pussy, intermingled in the steamy shower air, like a ripe, sweet peach.");
	}
	//Merge
	output("\n\nPowerful arms sweep you up into their embrace. Onyx lips press to yours in a fiery kiss made all the warmer by the shower’s heat. As your eyes drift closed, you can see Azra’s do the same. Just like you, she’s revelling in the touches, delighting in the tender embrace. You grab hold of her back and pull her tighter, chest to chest");
	if(pc.biggestTitSize() >= 8) output(", one set of well-endowed tits to another");
	output(". Long moments pass as your tongues twist. Hers is long and nimble");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", just like yours");
	output(", the better to coil against your probing muscle and snare it in its spit-slick grip.");
	output("\n\nWhen your lips part, you’re both gasping for breath, your bodies hot, your crotches aching with need. Azra opens her violet eyes, and gives you a soulful stare. Something wiggly and tingly brushes by your [pc.belly], again and again. Each time, you feel a little hotter");
	if(pc.hasVagina()) output(", a little wetter");
	if(pc.hasCock()) output(", a little harder");
	output(". Azra’s big, drippy suula cock is rubbing against you, the tendrils leaving a little extra venom behind each time. Her eyebrows crease in worry, but her blushing face radiates pure excitement. She looks at your crotch, then at you. A single question is all she asks: <i>“How do you want to do this?”</i>");

	//[FuckHerCunt] [Tribbing]
	processTime(10);
	pc.changeLust(15);
	clearMenu();
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(azra.vaginalCapacity(0)) >= 0) addButton(0,"FuckHerCunt",penisRouter,[fuckAzrasCuntPussy1stTimeEverytime,azra.vaginalCapacity(0),false],"Fuck Her Cunt","Give Azra’s pussy the fucking it so clearly needs.");
		else addDisabledButton(0,"FuckHerCunt","FuckHerCunt","You do not have an appropriately sized penis for this.");
		if(pc.biggestCockVolume() > azra.vaginalCapacity(0)) addButton(2,"Thighs&Frot",thighsAndFrottageGogogo,undefined,"Thighs & Frottage","Use her thighs to please your giant-sized dick, all while grinding it against her smaller member.");
		else addDisabledButton(2,"Thighs&Frot","Thighs&Frot","You need an absolutely enormous penis in order to do this.");
	}
	else 
	{
		addDisabledButton(0,"FuckHerCunt","Fuck Her Cunt","You need an appropriately sized penis for this.");
		addDisabledButton(2,"Thighs&Frot","Thighs&Frot","You need a huge penis for this.");
	}
	if(pc.hasVagina()) addButton(1,"Tribbing",azraTribbyTribbyBangBang,undefined,"Tribbing","Rub pussies together in the way that only two females can.");
	else addDisabledButton(1,"Tribbing","Tribbing","You need a vagina to rub against hers for this.");
}

//Thighs&Frot
public function thighsAndFrottageGogogo():void
{
	clearOutput();
	showAzra(true);
	var x:int = pc.biggestCockIndex();
	var len:Number = pc.cocks[x].cLength();
	var cumQ:Number = pc.cumQ();
	//Bimbo
	if(pc.isBimbo())
	{
		output("<i>“Ummm, I think I’d probably split you in half if I shoved this dick inside you.”</i> You playfully shake your pole at her, splashing shower water every which way and thumping it noisily into the wall.");
		if(annoIsCrew()) output("\n\nFrom elsewhere in the ship, you hear Anno’s voice holler, <i>“Keep it down!”</i>\n\n");
		output(" Infinite fuckable possibilities spool through your oversexed mind until at least you settle on one: <i>“So I’m gonna shove this jizztank through your thighs and rub it on your cute lil sharky-dong till you cum... all... over me.”</i> Further thought is impossible with jizz on the brain, but you muddle through. <i>“And then I can cum on you.”</i>");
	}
	//Bro
	else if(pc.isBro()) 
	{
		output("You look at the tree trunk between your legs, then back at Azra, then back at your dick. <i>“Won’t fit inside.”</i> After a moment’s consideration, you posit a solution. <i>“Your thighs.”</i>");
		output("\n\n<i>“What?”</i> Azra asks.");
		output("\n\nYou point at her smooth, soft-looking legs. <i>“I’ll fuck them.”</i> You step closer, putting your hand on her knee. <i>“It’ll feed good, ‘cause I’m so big it’ll be rubbing on your cute little girl-cock.”</i>");
	}
	//Else
	else output("After a moment’s consideration, you offer. <i>“I doubt I’d fit inside, but I could definitely fuck your thighs.”</i> You eyeball her dripping dick and smile. <i>“Even grind it up against your dick until we cum all over each other.”</i>");
	//Merge
	if(flags["AZRA_THIGHTFROTTED"] == undefined && flags["AZRA_DOCKED"] == undefined)
	{
		output("\n\nAzra rocks back as if slapped, her hand over her mouth. <i>“Oh... oh my.”</i> The wide orbs of her violet eyes track your weighty member as you adjust to better fit inside the shower with her. <i>“That’s... obscene.”</i> She bites her lip, leaning closer to examine your cock. <i>“This isn’t the kind of thing I expected to encounter in the shower. Maybe out on the surface, forced by some uncouth... lewd alien.”</i> She pauses, chest heaving. A warm palm falls upon the top of your dick. <i>“Yet you deserve better than judgement, saddled with your monstrous member and its... potent desires.”</i>");
		output("\n\nThe more she talks, the more of your gargantuan phallus her hand explores. A fingertip traces the arches and forks of one straining vein, curiously dancing back and forth as the suula’s excitement overwhelms her innocence. <i>“");
		if(pc.isBimbo()) output("Like, that means yes, right?");
		else output("So you’ll do it?");
		output("”</i>");
	}
	else
	{
		output("\n\nAzra slyly covers her mouth and steps back, feigning offense. <i>“Why I never!”</i> The wide orbs of her violet eyes track your weighty member as you adjust to better fit both it and Azra inside the shower. <i>“That’s... obscene.”</i> Giggling, she bites her lip, leaning closer to examine it in detail. <i>“To request such a lewd act from me of all people...”</i> She pauses, chest heaving. A warm palm falls upon the top of your dick. <i>“You’re going to ruin me for " + pc.mf("other boys","men the galaxy over") + ". You and that monstrously potent fuckstick of yours.”</i>");
		output("\n\nThe more she talks, the more of your gargantuan phallus her hand explores. A fingertip traces the arches and forks of one straining vein, playfully dancing back and forth as the suula’s excitement overwhelms her feigned innocence. <i>“");
		if(pc.isBimbo()) output("Like, that means yes, right?");
		else output("So you’ll do it?");
		output("”</i>");
	}

	output("\n\nAzra nods, her other palm coming to rest alongside the first. One thumb strokes back and forth while its partner gently squeezes in disbelief. The suula seems to expect it to flicker and fade away, a hardlight projection too large to be anything but a detailed render of a teenager’s wet dream. A slight smile crooks the corner of her mouth. <i>“You are a wonder, [pc.name] Steele. Only you could accomplish so much, yet have the body of an adult holo star.”</i> She gives you one long stroke, base to tip");
	if(cumQ >= 1000) output(", milking a long flow of pre-cum out to lubricate your dick.");
	else output(", holding you under her leaky shaft to paint you in her freely leaking pre-cum.");
	output(" <i>“Oh... look at how it shines!”</i> A note of girlish excitement creeps into her voice, odd given her motherly form. <i>“How should I do this?”</i>");
	output("\n\n<i>“Lie down,”</i> you instruct, pointing to the floor. <i>“Legs up. I’ll do the rest.”</i>");
	output("\n\nAzra smears the pre around, mixing it with the water until your whole [pc.cockNoun " + x + "] is gleaming. <i>“Okay.”</i> She lets go regretfully and eases herself down onto her back, tail sticking straight down and legs in the air, tightly closed. They do nothing to hide the weighty mass of her balls, bulging out above her tail, though they do give you a lovely view of the space you’ll soon be fucking.");
	output("\n\nA shiver of excitement runs down your [pc.cock " + x + "] as you step into position. Hands on the siren’s lovely ankles, you let the weight of your obviously enhanced genitalia fall against her legs. A forceful tug pulls the nervous hermaphrodite’s legs apart and flop the heavy length into the middle. You can feel her cock, just under yours. Maybe two feet of turgid suula shaft that throbs back at your touch, leaking all over your skin.");
	output("\n\nAzra gasps, <i>“It’s hot!”</i> and blushes shyly, looking to the side.");
	output("\n\n<i>“So are you,”</i> you counter, pushing her ankles back together so that her soft thighs close around your cock in a warm vice. This time, it’s your turn to gasp at the sensation. Somehow, it’s better than contact with her comparatively diminutive dick. You need the extra stimulation, you realize. Frottage would never be enough, not as Azra is now. Thighs, arms, maybe even her whole body - you need more than a standard endowment to see to your release.");
	output("\n\nFor her, it must be amazing. You can see her panting and biting at one of her knuckles to stifle a moan. She’s pinned beneath your mast, every inch of her hermhood sandwiched between her supple tummy and your pornographicly large prick. Her tendrils writhe, and the shaft itself throbs achingly, making your far bigger dick wobble to the beat of her heart. It’s cute.");
	output("\n\n<i>“Uhhh... [pc.name]?”</i> Azra whines, suddenly flushed two shades darker. Her nipples seem harder, all of a sudden");
	if(len >= 40) output(", now that your dick is between them, forcing them to point to the side");
	output(".");
	output("\n\nYou grunt, rocking back to drag your cock through the siren’s perfect, golden thighs. The importance of that friction seems paramount, in this moment. You want it... and you don’t want it to stop.");
	output("\n\nAzra whimpers and twists, muscles flexing against your tumescent pole, her two-foot cock grinding hard into your underside, sliding back and forth along your sensitive urethra. With every stroke, that area seems a little more sensitive, your shaft itself a little harder. The water is warmer, and the siren’s thighs are curtains of delight, providing you with inhuman levels of pleasure");
	if(pc.isTreated()) output(", just the sort of thing you’ve craved since taken the Treatment.");
	else if(pc.isBimbo()) output(", just the sort of thing you crave, your rewired brain thrilling at the enhanced pleasure centers finally getting use.");
	else output(".");

	output("\n\n<i>“[pc.name]! I’m sorry!”</i> Azra cries. She screams out a moan and grabs her tits, squeezing them tightly her cock’s drooling increases into pulses of eager leakage. <i>“I didn’t mean... ugh! My venom...”</i> Her tendrils swirl against your hypersensitive skin like tiny fingertips, leaving burning arcs of bliss in their wake.");
	output("\n\nAphrodisiacs! You should probably have a feeling about the chemicals her body is feeding is you: outrage, disgust, or simple violated trust. Instead, you’re busy feeling the pleasure of making love to a suula matron, watching her soaked wings weakly tremble in the water. You thrust through her thighs until your [pc.cockHead " + x + "] ");
	if(len >= 66) output("is jutting over her shoulder");
	else if(len >= 53) output("is kissing her lips");
	else if(len >= 40) output("is buried in her tits");
	else output("is aimed squarely at her underboob");
	output(", aching and trembling. White spills out from underneath it as Azra cums, spreading into a sticky web as it oozes down her thighs.");

	output("\n\nYour [pc.cum] ");
	if(len >= 66) output("fires into the wall, saving Azra from a direct facial by virtue of your raw length.");
	else if(len >= 53) output("fires directly into her wide-open mouth. Azra responds by trying to drink the offered goo, wrapping her arms around the [pc.cockHead " + x + "] and pinning it into her boobs.");
	else output("fires into her silky cleavage. Azra responds by cupping her arms around her boobs to press them tighter, squeezing out dollops of [pc.cumColor] release.");
	output(" The suula is almost too affectionate. Even when her ankles slip from your weakening hands, she holds her legs together.");

	output("\n\nAny restraint the suula once had is completely obliterated as she unashamedly works her body against your tremendous endowment, her tongue lolling. She grabs your dick and milks it for every drop you’ll give");
	if(cumQ >= 30000) output(", even when the tub itself seems like it will overflow.");
	else if(cumQ >= 500 && len >= 66 || len < 53) output(", even when her whole body seems decorated in [pc.cumGem]s.");
	else output(".");
	output(" Azra is moaning, and whimpering, and cumming like crazy.");
	output("\n\nHer tail thrashes, sweeping your [pc.legs] out from under you, and you crash to the ground, oozing [pc.cumNoun].");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",thighFrot2,[x,cumQ]);
}

public function thighFrot2(args:Array):void
{
	clearOutput();
	showAzra(true);
	x = args[0];
	var cumQ:Number = args[1];
	output("<i>“Are you alright?”</i> Azra crawls up onto you, brushing a ");
	if(cumQ >= 500 && pc.cocks[x].cLength() >= 66) output("despoiled");
	else output("dripping wet");
	output(" lock of hair aside so that she can check your eyes. <i>“I’m sorry! I couldn’t control it!”</i>");
	output("\n\nAside from a sore ass and a cock that won’t seem to go soft for the moment, you’re doing okay. You give the concerned hermaphrodite a thumbs up.");
	output("\n\nAzra babbles, helping you to your feet, the water washing her cum from the bottom of your [pc.cock " + x + "]. <i>“I should be better at controlling it, but sometimes I get too excited and they sting everything. Even me.”</i> The nine-foot tall siren looks exceedingly silly, acting as ashamed as a first year school child. <i>“That’s why I’m still kind of hard, and why my knees won’t stop wobbling...”</i>");
	output("\n\nYou wave off her worries. <i>“I was the one thrusting my cock against yours. You’d think the size would afford me some resistance...”</i>");
	output("\n\nWings lifting, Azra giggles. <i>“The size of your endowments likely made it more effective. I can only imagine the hormone cascade it set off in you.”</i> She presses close, snuggling into you. <i>“Let’s clean up this mess... and you can see about talking me into trying this again later.”</i>");
	processTime(55);
	IncrementFlag("AZRA_SEXED");
	IncrementFlag("AZRA_THIGHTFROTTED");
	if(flags["AZRA_SEXED"] == 1)
	{
		pc.createStatusEffect("Azra CD");
		pc.setStatusMinutes("Azra CD",10*60);
	}
	else 
	{
		pc.createStatusEffect("Azra Sex CD");
		pc.setStatusMinutes("Azra Sex CD",24*60);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//FuckHerCunt
public function fuckAzrasCuntPussy1stTimeEverytime(xx:int):void
{
	clearOutput();
	showAzra(true);
	if(pc.isBimbo()) output("<i>“I’m gonna fuck you, silly.”</i> You giggle and nimbly slip a hand beneath her balls to get at the sopping-wet cunt behind. <i>“I can’t wait to get in there!”</i>");
	else if(pc.isBro()) output("You answer her by grabbing your [pc.cock] in one hand, and hooking a finger in her pussy with the other.");
	else if(pc.isNice()) output("<i>“I want to fuck you.”</i> You slide a hand under her balls to feel the sopping-wet folds of her pussy. <i>“Right here.”</i>");
	else if(pc.isMischievous()) output("<i>“Trouble is, I don’t have just one way I want to do this.”</i> You slide a hand under her sack to get at the steamy delta behind. <i>“But I think we can start here.”</i>");
	else output("<i>“I’m going to fuck you so hard you’ll be walking bow-legged on our next adventure.”</i> You reach under her balls and grab her lust-thickened pussy-lips, dipping a finger inside the sweltering honeypot.");
	output("\n\nAzra gasps on contact, eyelashes fluttering. <i>“Oh... that sounds nice.”</i> She shifts her hips unconsciously, grinding the sensitive cunt into your palm. Her hands fall on your shoulders. <i>“You’ll need a condom, though.”</i>");

	output("\n\nYou raise an eyebrow. <i>“Seriously?”</i>");

	output("\n\n<i>“Seriously.”</i> Azra’s tail lashes back and forth excitedly behind her, thumping powerfully into the narrow walls. <i>“You’re not my stud yet, Captain.”</i> ");
	if(flags["AZRA_SEXED"] != undefined) output("She winks playfully at you, then s");
	else output("S");
	output("he kisses you hard. <i>“But if you fuck half as well as you kiss, you might convince me yet.”</i> Another soul-searing kiss is thrust upon you. All the while, Azra’s hips wiggle in small circles against your questing digits, drenching your fingertips in a much slicker liquid than shower water. A condom is pressed into your other hand as the kiss breaks. <i>“Suit up.”</i>");
	processTime(2);
	pc.changeLust(10);
	//[Suit Up]
	clearMenu();
	addButton(0,"Next",fuckAzrasCuntPussy1stTimeEverytime2,xx);
}

public function fuckAzrasCuntPussy1stTimeEverytime2(xx:int):void
{
	clearOutput();
	showAzra(true);
	//Multicocks
	if(pc.cockTotal() > 1)
	{
		output("You line the condom up with [pc.oneCock], but Azra grabs your package and yanks a more suitably-sized dick up to bat. <i>“This one.”</i> She squeezes it gently. <i>“I want this one.”</i>");
	}
	//Single
	else
	{
		output("You line the condom up with your [pc.cock " + xx + "] under Azra’s watchful gaze. She grabs it by the base and squeezes it tenderly. <i>“And to think Terrans get excited about unwrapping their gifts.”</i> She snorts.");
	}
	//Merge
	output("\n\nOn contact with your [pc.cockHead " + xx + "], the plastic sheath buckles and unfurls automatically, spooling out to perfectly encapsulate the tip. It waits there. You’re just about to roll it the rest of the way down when Azra stops you.");
	output("\n\n<i>“Let me,”</i> she says, shifting so that her drooling pussy is an inch away from impaling itself. <i>“Watch.”</i> Gingerly, she lowers herself over your latex-ensconced rod, stopping to moan as the feeling of that first inch slipping inside overwhelms her. <i>“Wow... it’s... ");
	if(pc.cocks[xx].cLength() >= azra.cocks[0].cLength()) output("so big,”</i> she whimpers. <i>“F-f-fuuuuck, this monster is going to ruin me.");
	else output("nice.”</i> She whimpers. <i>“Nothing feels quite like a real cock.");
	output("”</i> The suula arches her back, breasts bouncing");
	if(pc.tallness < 7*12) output(", rubbing a nipple into your face");
	output(". Meanwhile, her exposed cock leaks a stream of pre across your uncovered [pc.sheath " + xx + "]. Something inside her goes wild. Dozens of wiggly appendages are caressing your tip, sliding down your shaft. Then you feel the condom rolling down the rest of the way, pushed by those same tendrils, sealing Azra’s pre-jizz inside like some kind of perverse marinade.");
	output("\n\nSuula pussies must come with little tentacles, just like their dicks, and Azra’s must be exceedingly talented to so expertly wrap you the rest of the way. The condom zips tight a second later, the base adhering to lock it in place. There’s no chance of leakage - not Azra’s sealed-in pre, nor your own ejaculate. Unless you ");
	if(pc.cumQ() < 5000) output("somehow ");
	output("inflate the prophylactic with enough [pc.cumNoun] to burst it, you won’t be impregnating anyone.");

	output("\n\nThe clingy warmth of Azra’s pussy erases any concerns about where your seed is going to travel. It’s pleasure and contentment in equal parts, gliding along on a curtain of liquid excitement. When she bottoms out, the tendrils twirl and constrict, clutching at your [pc.knot " + xx + "]. The edges touch the skin of your [pc.belly]. In their wake, there’s a subtle buzz irritation followed by a sudden spike in your lust, making you swell bigger and harder inside her.");
	pc.cockChange();
	processTime(15);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",fuckAzrasCuntPussy1stTimeEverytime3,xx);
}

public function fuckAzrasCuntPussy1stTimeEverytime3(xx:int):void
{
	clearOutput();
	showAzra(true);
	if(pc.isBimbo()) output("<i>“Silly, suula!”</i> you chirp. <i>“I have the dick! That means I do the fuckin’!”</i> You push her into the wall.");
	else if(pc.isBro()) 
	{
		output("Reaching ");
		if(pc.tallness < 7*12) output("up");
		else output("out");
		output(", you put your hand on the side of her ");
		if(pc.tallness >= 7*12) output("neck");
		else if(pc.tallness >= 5*12) output("boob");
		else output("hip");
		output(" and press her to the wall");
		if(pc.tallness >= 7*12) output(", your thumb stretching around her throat possessively");
		output(". <i>“My turn.”</i>");
	}
	else if(pc.isNice()) output("<i>“Now let me,”</i> you say, gently pressing her back against the wall.");
	else if(pc.isMischievous()) output("<i>“You feel divine,”</i> you admit. <i>“Now give me a chance to worship you like a goddess.”</i> You push her back to the wall.");
	else output("<i>“Let me,”</i> you say, pushing her back to the wall.");
	output(" Feeling her cunt slip halfway off your dick, you respond by thrusting forward powerfully, taking her back to the hilt. Violent spasms wrack the tentacles inside. They flail across your turgid flesh in uncontrolled ardor.");

	output("\n\n<i>“Oh-Okay!”</i> Azra half-gasps, half-moans. Her tail slams into the wall, knocking a wave of water droplets free from where hung. She grabs hold of your [pc.butt], fingertips kneading it imploringly, helping you to grind it against her lust-swollen pubic mound. More pre bursts out of the tip of her cock, showering across your [pc.chest]. Maybe your body is putting too much pressure on her balls, squeezing the juices right out of her. Then again, maybe the motherly suula is just that into it. If she had a problem with her nuts being sandwiched between your bellies, she wouldn’t be urging you onward.");

	//Real short - Describe climbing up onto a bench to help, getting a mouth full of tit.
	if(pc.tallness < 5*12+6)
	{
		output("\n\nYou feel kind of bad for her. She has to squat down so far just for you to reach her cunt. After a few more thrusts, you decide to take it easy on her. There’s a bench against the other wall; if you stand on it, the heights should just about match up.");
		output("\n\nSliding out, you marvel at the sight of Azra’s weeping pussy. The fast-flowing moisture may be mixed in with water from the shower, but the way it hangs from her flushed lips indicates the mixture to be more than mere H20. You dip two digits into the sodden slit and give Azra a gentle tug, indicating the bench. She waddles behind you obediently with her knees shaking, whimpering whenever your motions cause your digits to press particularly forcefully against her sex-tenderized nerves.");
		output("\n\nYou hop up and turn to face the sharky angel. She smiles gratefully at you, stretching her legs once before presenting her cunt to you once more. <i>“Go ahead, little cutie.”</i> She opens her netherlips with her fingers, her ballsack draped over her wrist to allow you to see the squirming flesh below. <i>“It’s all yours.”</i>");
		output("\n\nWhen you enter her this time, Azra grabs the back of your head and presses it into a breast. It’s almost incomprehensibly soft. You feel like you’ve slipped and fallen into the world’s most comfortable pillow, only this pillow wobbles around your head with every thrust of your hips. A nipple slides over your cheek, and you gratefully turn to accept it into your mouth, favoring it with swirling strokes of your tongue and gentle suckles.");
	}
	//Normal - Describe getting a mouthful of tit
	else if(pc.tallness < 7*12+6)
	{
		output("\n\nYou nearly stumble backward when one of her tits slaps into your face, smothering you in gold-hued softness. It’s big enough to block out the light - big enough to press down on your cheeks from either side. Once your brain catches up to Azra’s body, you fuck her extra hard, enjoying the feeling of her plush bosom wobbling around your face. When a nipple slips across your cheek, you turn grab it, favoring it with swirling strokes of your [pc.tongue] and gentle suckles.");
	}
	//Tall - Describe frenching.
	else
	{
		output("\n\nYou blink in surprise when Azra’s tongue slips across your [pc.lipsChaste]. The slithering muscles slide back and forth teasingly, warm and wet and promising a deeper, more debauched embrace. You give it what it wants by pursing your lips and leaning forward, feeling the curious muscle curl around inside your maw. More slithering shark packs in behind your teeth as you finally make contact with Azra’s onyx-rimmed mouth and return the favor, plunging inside her in two locales instead of one.");
	}
	//Merge
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",fuckAzrasCuntPussy1stTimeEverytime4,xx);
}

public function fuckAzrasCuntPussy1stTimeEverytime4(xx:int):void
{
	clearOutput();
	showAzra(true);
	output("It isn’t the warmth or the steam that surprises you most about fucking in the shower; it’s how loud it is. Individual sounds rebound inside the enclosed space, and your soaked bodies slap together in obscene punctuations of carnal lust. Azra squeaks too");
	if(pc.tallness >= 7*12+6) output(", once the kiss finally ends");
	output(". Her voice has a strange sort of musicality to it, almost a chirp. You drive into her harder, just to hear her make that sound again, and it works. Azra loses all control over her vocal cords, yielding them to your thrusting, cunt-pounding control.");
	output("\n\nYou bang the soaking shark harder and faster. Her wings quiver against the waterproofed walls. Her dick flops, spurting enough pre to shine your [pc.belly]. She looks at you with intense, wide eyes, almost as if she can’t believe what she’s doing - or what she’s feeling. The muscles in her thighs dance as she tries and fails to control herself, but you’re there to give her the fucking she needs, even when her cunt goes wild and clamps down, hard.");
	output("\n\nAzra screams, <i>“Just like that! Ohhh! Yessss!”</i> and her dick flexes. The thick tube of suula meat plumps, the urethra bulging with an enormous load of soon to be wasted seed. She grabs onto you for dear life, and her wings wrap around your back, trapping you inside her as she climaxes");
	if(pc.biggestTitSize() >= 4) output(". Her spooge-spurting dick burrows into your cleavage. There it spills what feels like gallons of creamy goo, pushing out flows heavy enough to make watered-down jizz bubble up out of her bosom like lava from a chin-painting volcano.");
	else output(". Her spooge-spurting dick slides up and down your pre-painted chest, spilling what feels like gallons of creamy goo. Some deflects off your chin, but most bubbles up to cascade across your pecs like a pearlescent wave.");
	output(" <i>“Too much!”</i> she cries, moments before her cunt seizes you once more.");
	processTime(3);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",fuckAzrasCuntPussy1stTimeEverytime5,xx);
}

public function fuckAzrasCuntPussy1stTimeEverytime5(xx:int):void
{
	clearOutput();
	showAzra(true);
	output("Where fucking Azra’s torrid cunt is concerned, there is no such thing as <i>“too much,”</i> not when it feels this good. Not when her alien cock is erupting like a geyser, the aphrodisiac-laden tentacles chemically forcing you to become every bit as excited as she is. Her expression is one of depraved bliss. Her tongue drools out. Her eyelashes flutter. Best of all is the way she can’t seem to hold still, like the pleasure coursing through tugs her thoughts back and forth along the path of your pistoning rod.");
	output("\n\nYou can feel yourself sweating from the effort of slamming yourself into her, but the act itself is as natural as breathing. You’re vaguely aware of how the muscles in your thighs burn when pounding Azra’s ass into the wall, cognizant of the slow buildup of lactic acid eating into your endurance.");
	output("\n\nIt’s worth it to see the suula’s passions overwhelm her and to feel her alien cunt go wild.");
	output("\n\nLooking at Azra now, with her hair slicked back by the water and her typically measured expression replaced by one of pure ecstasy, she’s more beautiful than you’ve ever seen her. She whimpers imploringly, begging you to join her, and you realize just how close you are to your own peak by the way your [pc.cock " + xx + "] spasms inside her. Convulsions course from your [pc.balls] to your [pc.cockHead " + xx + "], uncontrolled and increasingly potent. You slip past the point of no return and let it happen, fucking Azra’s sloppy cunt all the way into your own climax.");
	output("\n\nEverything whites in and out of existence except Azra and her golden slit. Euphoria puddles inside you to be vented out in bolts of pure cock-constricting bliss. You press into Azra as your strength flees you, escaping in virile spurts, leaving nothing but exhaustion and contentment in its wake. She nuzzles back against you, her dick still leaking, still drooling hot semen across your body. You sink down together, letting the water slowly wash away the fluid proof of your spent passions, luxuriating in the mere presence of the other.");
	output("\n\nAzra ");
	if(pc.tallness < 7*12+6) output("bends low to kiss");
	else output("kisses");
	output(" you. <i>“Easy Cap’n. Suula venom is strong stuff.”</i> Her angular snout nuzzles into the nape of your neck. <i>“I didn’t want to, but sometimes it just happens in the moment. Even hits me too.”</i> She peppers you with kisses.");
	output("\n\nYou pat her acceptingly. <i>“No harm done.”</i>");
	processTime(10);
	var cumQ:Number = pc.cumQ();
	pc.orgasm();
	pc.energy(-50);
	clearMenu();
	addButton(0,"Next",fuckAzrasCuntPussy1stTimeEverytime6,[xx, cumQ]);
}

public function fuckAzrasCuntPussy1stTimeEverytime6(arg:Array):void
{
	var xx:int = arg[0];
	var cumQ:Number = arg[1];
	
	clearOutput();
	showAzra(true);
	//Knot
	if(pc.hasKnot(xx) && pc.knotThickness(xx) >= 6)
	{
		output("Extricating your shrink-wrapped cunt-stuffer is no easy affair");
		output(", not with such a titanic knot. Azra looks like she’s about to be split in half from how you gape her leaky pussy. No matter how you wiggle, or how she giggles at your efforts, there’s no freeing your [pc.cock " + xx + "]. After a few minutes, she asks you to stop before you get her all worked up again. Instead of struggling to separate, she plies you with seemingly endless hypothetical questions, ranging from inane celebrity queries to philosophical quandaries that leave your head spinning.");
		output("\n\nAfter a steam-filled Q-and-A that goes on for the better part of an hour, you realize you’ve finally calmed down enough for your knot to deflate.\n\n");
	}
	//Smaller Knot
	else if(pc.hasKnot(xx))
	{
		output("Tugging your shrink-wrapped cunt-stuffer free is no easy affair, not with an inflated bulb of flesh at the base doing its best to keep you sealed inside. You wiggle back and forth, pulling hard enough to drag Azra an inch across the slick shower floor. She giggles at times, gasps at others, and sometimes even moans from the stimulation of her hypersensitive puss.");
		output("\n\n<i>“Here, let me help,”</i> Azra suggests after a few micro-orgasms. She braces her legs and places her palms to either side of her puffy mound, doing her best to spread it open. <i>“Now pull!”</i>");
		output("\n\nYou push back against her, wincing from the pressure on your delicate organ. Simultaneously you watch Azra’s golden cunt part around your [pc.cockColor " + xx + "] bulb. It strains wider, and winder, and in an explosion of gushing siren-goo, finally releases your knot.\n\n");
	}
	//Merge
	output("Sliding out reveals a very, very well-lubed condom");
	if(cumQ >= 15) output(" - and the balloon attached to the end of it");
	output(".");
	if(cumQ >= 7000) 
	{
		output(" There’s so much goo packed inside that you wonder how it all fit inside Azra. It seems like an endless hose, stuffed to the brim with [pc.cum]. At a certain point, the remaining jism is forced out by Azra’s muscles to join the balloon outside her.");
		if(cumQ >= 20000) output(" You both ogle the titanic load of sperm. It’s immense, big enough that the condom covers Azra’s knees and your [pc.legs].\n\n<i>“That’s why I don’t skimp on quality condoms, [pc.name].”</i> The suula smiles, rubbing your [pc.cock " + xx + "]. <i>“No accidents, even if I’m dating a kui-tan.”</i>");
		else output("\n\n<i>“Wow,”</i> Azra confides. <i>“Good thing we used the condom.”</i>");
	}
	else if(cumQ >= 200)
	{
		output(" The ");
		if(cumQ >= 5000) output("beachball");
		else if(cumQ >= 4000) output("watermelon");
		else if(cumQ >= 3000) output("basketball");
		else if(cumQ >= 2300) output("melon");
		else if(cumQ >= 1700) output("soccerball");
		else if(cumQ >= 1000) output("grapefruit");
		else if(cumQ >= 600) output("softball");
		else output("baseball");
		output("-sized blob slaps onto the floor between you.\n\nAzra gently reaches down to heft it, rolling it back and forth between her hands - all while it remains attached to your [pc.cock " + xx + "]. <i>“Mmm, I see you’re a virile specimen.”</i> Her eyes twinkle mischievously. <i>“I’ll remember that.”</i>");
	}
	else output("The reservoir tip contains a decent-sized blob.\n\nAzra reaches down to pinch it, making the [pc.cumGem] fluid wash down along your cock before the plastic’s pressure makes it rebound back to the tip. <i>“Hmmm... if I ever let you take me bareback, I’m going to have to recommend you some good mods.”</i> Her eyes twinkle mischievously. <i>“I’ll have you cumming like a kui-tan in no time.”</i>");
	//Merge
	output("\n\nThe satisfied suula taps the condom near the base, and it abruptly releases, slipping off you with ease. Azra catches it and knots the end to trap your juices inside. <i>“I think the plants we rescued from Mhen’ga need this more than either of us, don’t you agree?”</i>");
	output("\n\nYou do, and after ");
	if(cumQ < 7000) output("stowing it on a bench");
	else output("rolling it into the corner");
	output(", you finally get to take a proper shower with your crew’s botanist.");

	processTime(20);
	pc.shower();
	//Disable Azra 10 hours. When Azra is back, cue relationship talk.
	IncrementFlag("AZRA_SEXED");
	if(flags["AZRA_SEXED"] == 1)
	{
		pc.createStatusEffect("Azra CD");
		pc.setStatusMinutes("Azra CD",10*60);
	}
	else 
	{
		pc.createStatusEffect("Azra Sex CD");
		pc.setStatusMinutes("Azra Sex CD",24*60);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Tribbing]
public function azraTribbyTribbyBangBang():void
{
	clearOutput();
	showAzra(true);
	//Bimbo
	if(pc.isBimbo())
	{
		output("<i>“So this is gonna sound kinda weird, ‘cause I’m not like, just dropping to my knees and sucking you off... but I think I want your pussy.”</i> You rub your own dewy delta");
		if(pc.totalVaginas() > 1) output("s");
		output(" to calm you down while you try to explain. <i>“I was thinking like, maybe we could rub pussies together. Just two soaking-wet sluts humping until our legs give out.”</i>");
	}
	//Bro
	else if(pc.isBro()) output("<i>“Tribbing.”</i> You grab her cunt in one hand and your own in the other, rubbing clits on both ends with well-practiced circles. <i>“You’ll love it.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“I want your pussy on my pussy,”</i> you pant, rubbing yourself one handed while the other explores the dewy treasure behind the angelic shark-girl’s balls.");
	//Misch
	else if(pc.isMischievous()) output("<i>“I think this big, goofy dick needs to get out of the way,”</i> you say, reaching under Azra’s balls to fondle her sodden slit. <i>“Because I want this on my cunt.”</i> Your thumb brushes her rapidly engorging clit.");
	//Hard
	else output("You answer her question by reaching under her balls to grope at the dewy treasure below. <i>“I want this...”</i> You squeeze two fingers inside. <i>“...under this.”</i> You openly frig your [pc.vaginas].");
	//Merge
	output("\n\nAzra’s eyes twinkle happily. <i>“Of course.”</i> She wistfully pushes away your hand and settles down to the ground. <i>“I hope you don’t mind being on top...”</i> The nine-foot tall shark rolls onto her side and lifts a thick-thighed leg high to properly expose her golden slit. <i>“I’d hate to fall on you.”</i>");
	//Bigger than Azra.
	if(pc.tallness > azra.tallness) output("\n\nYou laugh uproariously as you settle into position above the excited suula. <i>“I’m bigger. You just like it on the bottom.”</i>");
	//Samesize
	else if(pc.tallness > azra.tallness - 2) output("\n\nYou quirk an eyebrow. <i>“I’m the same size as you.”</i> You don’t let that stop you from settling in above the excited suula. <i>“I think you just like being on the bottom.”</i>");
	//Smaller
	else output("\n\nYou climb onto the excited suula like an explorer summiting a mountain. From the slow-spreading blush and the newly revealed plumpness of her pussy, it seems she likes being on the bottom more than she lets on. You tell her as much.");
	//Merge
	output("\n\n<i>“Maybe I just like you,”</i> Azra retorts, openly eyefucking you.");
	if(pc.biggestTitSize() >= 5) output(" Her eyes linger on your [pc.fullChest], darting between your nipples. There may be some truth to her statement.");
	else if(pc.hasCock())
	{
		output(" Her eyes linger on your [pc.cocks], traversing the length");
		if(pc.cockTotal() > 1) output("s");
		output(" of turgid flesh with rapt attention. There may be some truth to her statement.");
	}
	else output(" Her eyes travel across your chest and down to your [pc.vaginas], where they pay rapt attention to your glistening folds. There may be some truth to her statement.");

	output("\n\nYou ");
	if(pc.legCount > 1) output("spread your [pc.legs]");
	else output("shift your [pc.legs]");
	output(" to make cunt-to-cunt contact possible. Azra is breathing heavily, and now that the moment of contact is almost upon you, looks up to meet your gaze. She’s chewing nervously on her lip, eyebrows creased in worry. Smiling reassuringly back, you pat her squishy belly affectionately. <i>“Relax,”</i> you coo. <i>“This is going to be great.”</i>");
	output("\n\nAzra nods tentatively. <i>“O-okay.”</i> She grabs her ankle and lifts it higher, <i>“I’m ready.”</i> After a second of consideration, she adds. <i>“Take me.”</i>");
	output("\n\nYou’ve waited long enough for this. Sinking down, you ease your [pc.vaginas] into contact with Azra’s demurely dripping pussy. First contact is an electric sizzling through your nerves, and as you squish down harder, pressing folds into folds, that simmering pleasure transitions into boiling-hot lust. You can feel her clit tremble against your [pc.vagina] while your [pc.clits] ");
	if(pc.totalClits() > 1) output("take turns slipping");
	else output("slips");
	output(" over her silken mound. She’s <i>wet</i>, not just from water. Azra is so turned on that her pussy literally drools. You can feel it, oozing between you in a lubricating curtain.");

	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",azraTribbyTribbyBangBang2);
}

public function azraTribbyTribbyBangBang2():void
{
	clearOutput();
	showAzra(true);
	output("Azra squirms beneath your [pc.vaginas], overwhelmed by the feelings coursing through her feminine flesh. Her dick, flopped to the side, stiffens as her own movements stimulate her further. You’re able to watch it grow as you continue to grind your pussies together, stiffening and throbbing. It leaks pre everywhere it goes, and after watching it for a minute, never letting up, you realize you can use her cock as a barometer for how good you’re making her feel.");
	output("\n\nWhen Azra’s swelling clit slips into [pc.oneVagina], her fat cock all but gushes pre onto her belly. When your motions carry you off-base, it flops onto her tummy. When you return, its own mounting engorgement lifts it clean off her belly, defying its own tumescent weight to stand at attention for your efforts. In no time at all, you have her crying out as her dick spews load after load worth of pre-cum onto her tits. Azra is a messy, messy girl. Her cunt oozes, filling the air with a smell halfway between feminine musk and the sweetest peaches this side of the galactic core, and her dick never wants to stop drooling.");
	output("\n\nSex-juices are <i>everywhere</i>. It’s a challenge to keep from slipping onto the soaked shark-girl. No wonder she was worried about falling down. You grab one cushy hip for stability, relying on her pliant flesh to stabilize your position in spite of the water, pussy-juice, and phallic excitement covering it. It’s better than nothing.");
	output("\n\nAzra whines in the back of her throat as you grind away, and something changes, down below. Miniature tentacles emerge from her cunt to prod at your own. Their slick, tubular shapes add a new level of texture to the sordid lesbian intercourse that drives you to press ever harder against Azra. One hooks around [pc.oneClit], and you nearly cum. When it lets go, the feeling doesn’t go away. That clit feels flushed and hot, like it’s glowing with the potential to set off a mind-shattering orgasm. For that matter, your [pc.vaginas] ");
	if(pc.totalVaginas() == 1) output("is");
	else output("are");
	output(" hotter too.");
	if(pc.isSquirter() && pc.girlCumQ() >= 6000) output(" You’re gushing more [pc.girlCum] than Azra.");
	output(" Slowing your twitching hips doesn’t help. Once her tendrils touch a place, they leave behind a red-hot furnace of lust.");
	output("\n\n<i>“Sorry!”</i> Azra whines, pumping her lap lust-mad cunt against you. <i>“I couldn’t hold it in!”</i> She whimpers, and an eruption of pure alabaster sprays onto her tits. <i>“They were stinging me soooo muuuuuch!”</i> The siren’s cock goes off like a geyser, spraying lances of jizz every which way. <i>“Ohhhh-god-I-can’t-stop-cumming!”</i> Jizz splatters Azra’s hair. It rains over her shoulders and drenches her prodigious bosom faster than the water can wash it away. Rivers of pearl slough off her side to flow toward the drain, but the flow thickens with every passing second.");
	output("\n\nMaybe you should mind that her gushing cunny is dosing you with enough aphrodisiacs to make an elephant spontaneously orgasm, but it’s hard to be mad when she’s got it so much worse than you. Watching her dick unload rapid-fire squirts is enough to make you whimper in anticipation. You’re so close yourself.");
	output("\n\nAzra loses her mind to pleasure. She screams herself hoarse while her hands roughly maul her tits. One finds her nipple and mercilessly tugs it. On the other side, her fingers clench into a boob-filled claw, spasmodically twitching.");
	output("\n\nYou grab her dick in one hand, miraculously keeping your balance. You intended to jerk it off, but the feeling of it rhythmically pulsing, expanding, and unloading stops you in your tracks. It’s like holding onto a perverted firehose. You do your best to aim it at Azra’s chest, sliming her hands as they work over her big, motherly shark-tits. Then you find yourself stroking it, pumping it along to the rhythm of your hips. You hear your voice cooing encouragingly, telling Azra to squirt out every drop, your thumb sliding back and forth across her spunk-inflated urethra.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",azraTribbyTribbyBangBang3);
}

public function azraTribbyTribbyBangBang3():void
{
	clearOutput();
	showAzra(true);
	output("It isn’t the motion of Azra’s hips that brings you off, nor is it the syrupy lubrication she all but bathes your crotch in. It’s when three of the mischievous little tentacles grab [pc.oneClit] at once and thrash all over it. You go from sharing blissful friction with Azra to arching your back and howling like a banshee, your fingers spasming around Azra’s dick in a way that makes the cum-cascade sputter in a staccato rhythm. You hardly care, not when you go wild, throwing your head back and crushing your [pc.clits] into Azra’s lower lips.");
	output("\n\nYou lose track of everything but the pleasure coursing through you. Your [pc.vaginas] ");
	if(pc.totalVaginas() == 1) output("is");
	else output("are");
	output(" a nexus of erotic bliss, firing mind-blanking bolts of ecstasy up your spine one after another.");
	if(pc.hasCock()) output(" You’re dimly aware of hot blobs of [pc.cum] landing everywhere.");
	else if(pc.hasCockTail()) output(" You’re dimly aware of your tail stuffing itself into your mouth, but you don’t care. You just suck and cum, suck and cum.");
	else if(pc.hasCuntTail())
	{
		output(" You’re dimly aware of your tail forcing itself onto Azra’s tip, drinking her endless spooge and giving you one more orgasm on top of all the others, but you hardly mind.");
		feedCuntSnake(azra);
	}
	else output(" You’re dimly aware of pulling her dick down so that she can bathe you in her spunky essence, your mouth hanging open to catch a few fat blobs on your tongue, but those feelings are secondary - an automatic response to cumming so hard you might as well be leaking your brain out your pussy.");
	output("\n\nEverything is friction and pleasure and liquid enjoyment coursing across erotically-charged flesh. You writhe");
	if(pc.isSquirter()) output(", gushing fiercely");
	else output(", cumming fiercely");
	output(", and give yourself over to the pleasure. It carries you along on pussy-shaped ebbs and swells that go on without number or end.");
	processTime(20);
	pc.orgasm();
	pc.applyCumSoaked();
	pc.applyPussyDrenched();
	//[Next]
	clearMenu();
	addButton(0,"Next",azraTribbyTribbyBangBang4);
}

public function azraTribbyTribbyBangBang4():void
{
	clearOutput();
	showAzra(true);
	output("You cum too in a pool of ");
	if(pc.hasCock() || pc.isSquirter()) output("mixed");
	else output("Azra’s");
	output(" cum, your [pc.legs] tangled in with your suula lover. She’s groggy and trying to push herself up, but her noodly arms keep giving out. On seeing you rising, she smiles tiredly. <i>“Sorry about the venom.”</i> She wipes some jizz off her face. <i>“We’re supposed to be able to control it, but during sex...”</i> Azra trails off, then shrugs. <i>“I guess I’m just excitable.”</i>");
	output("\n\nYou laugh. She gave you one hell of a memorable orgasm. Or was that orgasms? It was either a super-long orgasm or twenty chained together back-to-back-to-back. <i>“It’s fine, Azra. Come on, let’s get clean.");
	if(pc.isBimbo()) output(" I wanna see that sharkbutt shine!");
	output("”</i>");
	processTime(5);
	pc.shower();
	IncrementFlag("AZRA_SEXED");
	if(flags["AZRA_SEXED"] == 1)
	{
		pc.createStatusEffect("Azra CD");
		pc.setStatusMinutes("Azra CD",10*60);
	}
	else 
	{
		pc.createStatusEffect("Azra Sex CD");
		pc.setStatusMinutes("Azra Sex CD",24*60);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Post Coital Relationship Talk
//Approach
public function azraPostCoitalTalk():void
{
	clearOutput();
	showAzra();
	output("<i>“Azra?”</i> you call to the golden suula, unable to resist smiling after talking to the girl you fucked silly not so long ago.");
	output("\n\nAzra jumps at your voice, then steadies herself with a deep breath. Calmness restored, she smiles back. It isn’t as gleeful as your own. She seems worried. <i>“Captain, the samples are stored and growing wonderfully. Thanks to you, I obtained a large enough set to offer you an early harvest, should you wish to test their purported effects firsthand.”</i>");
	output("\n\nYou fold your arms and give her a knowing look. <i>“What about yesterday?”</i>");
	output("\n\nThe suula’s wings droop, and she flinches. <i>“Yesterday was... a bit, perhaps. Fun, yes - wonderful even. It was an encounter I’ll treasure till the end of my days, Captain. But as we discussed, we are too busy for idle salaciousness. If we indulge our baser urges...”</i> Azra colors a deep orange, then clears her throat, starting over. <i>“I certainly would not get anything done. How am I supposed to pursue my work if I’m pursuing you?”</i> She sags down, ashamed by her own admission. Hair the color of a fading sunset hides her features.");
	output("\n\nYou brush her hair back and lay your hand on her cheek. What do you tell her?");
	processTime(2);
	//[Limited Fucks] [Professional]
	clearMenu();
	addButton(0,"Limited Fucks",chooseLimitedFucking,undefined,"Limited Fucks","Maybe working out a system of distributing sexual encounters will be enough to make her more comfortable with a sexual relationship.");
	addButton(1,"Professional",azraProfessionalForRealreal,undefined,"Professional","Keep things professional. That shower fuck was a mistake.");
}

//Professional
public function azraProfessionalForRealreal():void
{
	clearOutput();
	showAzra();
	output("You explain to Azra that you understand her concerns, share them even. It’s okay if she wants to keep things professional. You’ll do the same, though you’re hardly responsible for any deviancy forced upon you in the wilds.");
	output("\n\nAzra’s pulls back, eyes moist. <i>“Yes. This will be best.”</i> She places her and upon your shoulder and squeezes it reassuringly. <i>“There are untold worlds to catalogue, and we shall scour them together. Now, is there some other aid I might provide you? Would you like to see your samples?”</i>");
	flags["AZRA_CHOSE_PROFESSIONAL"] = 1;
	flags["AZRA_BOYFRIEND"] = -1;
	azraMenu();
}

//Limited Fucks
public function chooseLimitedFucking():void
{
	clearOutput();
	showAzra();
	output("<i>“The hug policy worked out. Why not do something similar?”</i>");
	output("\n\nAzra lights up. <i>“That might work.”</i> Her tail swishes rapidly behind her as she works to justify spending more time between your legs. <i>“However, I’m not sure I could endure waiting until the culminations of our excursions.”</i> She bites her lower lip. <i>“Lovemaking like that leaves one craving for more.”</i>");
	output("\n\n<i>“Once a day, then,”</i> you suggest. <i>“Less if we’re busy.”</i>");
	output("\n\n<i>“That might be enough... we’d lose no more than an hour or two on any given day, maybe three or four on weekends...”</i> She ticks off her fingers. <i>“I would have to cut down on other leisure activities, but I could make that work.”</i> She pulls close to you, breathing heavy. <i>“You’re sure about this, right? You’re not just teasing an old, frumpy botanist are you?”</i>");
	output("\n\nYou answer Azra with a kiss. She melts into you. This time, her tongue is gentle, slowly exploring your lips, caressing yours when the romantic entanglement heats up into a full-on french kiss. You taste salt on the edge of her lips, then realize she’s crying. Tears of joy stain the motherly suula’s cheeks, but she doesn’t seem to care. She’s too happy being in your arms and knowing she can be free to finally sate her long-denied arousal.");
	output("\n\nWhen you finally part, Azra is wiping the tears from her eyes. <i>“I-I needed that, [pc.name].”</i> She stifles a giggle and straightens, eyes twinkling happily. <i>“I guess that makes you my [pc.boyGirl]friend?”</i>");
	processTime(4);
	clearMenu();
	//[Yep] [Nope]
	addButton(0,"Yep",yepImYerBoyfriend,undefined,"Yep","That sounds great!");
	addButton(1,"Nope",nopeNotYerBoyfriend,undefined,"Nope","No, you don’t want to give her the wrong impression about your relationship...");
}

//Nope
public function nopeNotYerBoyfriend():void
{
	clearOutput();
	showAzra();
	output("<i>“Fuck-buddies,”</i> you explain. <i>“");
	if(pc.isBimbo()) output("I bang around. A lot. I’m kind of a total whore.");
	else if(pc.isBro()) output("I fuck everybody.");
	else output("I don’t want to give you false notions of exclusivity.");
	output("”</i>");

	output("\n\nAt that, Azra bursts into laughter. <i>“Okay, okay. No pressure. I totally get it. Most suula are polyamorous anyway. I won’t use the label if it bothers you, but I’m not going to stop thinking of you as romance material until you decide to stop making my heart flutter.”</i>");
	flags["AZRA_BOYFRIEND"] = -1;
	suulaBFChoiceOutro();
}

//Yep
public function yepImYerBoyfriend():void
{
	clearOutput();
	showAzra();
	output("<i>“I guess it does.”</i>");
	output("\n\n<i>“Good,”</i> Azra says with a dopey-looking grin. <i>“Because I’m going to be stuck thinking of you like that after this.”</i> She darts forward to give you another kiss, though this one is little more than a quick peck. <i>“Oh, and don’t worry too much about me getting jealous.”</i> Azra’s wings lift proudly. <i>“I’m a suula. I don’t mind if you’re into polyamory or polygamy or polymorphic calculus. So long as you keep making my heart flutter, I’ll be proud to call you my [pc.boyGirl]friend.”</i>");
	flags["AZRA_BOYFRIEND"] = 1;
	suulaBFChoiceOutro();
}

//Merge
public function suulaBFChoiceOutro():void
{
	output("\n\nIt’s hard to find fault with that school of thought.");
	output("\n\n<i>“So, is there something I can help you with?”</i> Azra asks, circling you like a shark on the hunt. <i>“Or something I can </i>help<i> you with?”</i>");
	if(pc.tallness < 5*12) output(" You suddenly feel very small, and very vulnerable.");
	processTime(2);
	azraMenu();
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
A naleen circles on the right. His build is typical of the kitty-snakes of Mhen’ga: snake from the waist down and furry, humanoid feline from the waist up. Sharp-clawed fingers wiggle eagerly at the sight of you, darting to a bandoleer of amber-colored bottles that ring his torso as if he cannot wait to unleash whatever is contained within. His ears are alert and playful. His dicks are too, jutting free from a reptilian slit to stab accusingly in your direction.

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
	pc.changeLust(200);
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
	pc.changeLust(20);
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
	pc.changeLust(20);
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
	pc.applyCumSoaked();
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
		pc.changeHP(pc.HPMax());
		pc.changeLust(-55);
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
			flags["AVOID_9TAIL"] = 2;
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
			flags["AVOID_9TAIL"] = 1;
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
	
	pc.removeAll();
	pc.maxOutLust();
	
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
		
		cuntSnakeTailTF(true, true, true);
		
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
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_BEE);
	pp.cumType = GLOBAL.FLUID_TYPE_HONEY;
	pp.createPerk("Fixed CumQ", 5000, 0, 0, 0);
	
	pc.loadInMouth(pp);
	pc.loadInCuntTail(pp);
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
	
	pc.tailCount = 9;
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((4 * 7 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	//[Bad End]
	badEnd("GAME OVER.");
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
	pc.changeLust(3);
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
	if(pc.hasFur() || pc.hasFeathers()) output(", even if you’ve got enough fur to be counted as a part of the animal kingdom");
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