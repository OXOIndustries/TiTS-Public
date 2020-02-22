//[alternate form]
public function gigaCeliseTransform():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	//(first time)
	if(flags["CELISE_GIGAED"] == undefined)
	{
		output("You decide to tell Celise about an idea you’ve been mulling over. The viridian slime-girl raises an eyebrow as you ask her just how much she can alter that gooey body of hers.");
		output("\n\n<i>“Why do you ask?”</i> she questions, giving you a curious look and a sly grin. You explain to her that you want to make that lower blob she has into a mass of tentacles, as many as she can get. As you describe what you want, Celise’s eyes seem to glaze over.");
		output("\n\n<i>“As many as... I’d need, like, A LOT more food when I’m eating. Are you sure you can handle that?”</i> she says with a tone somewhere between giddy and dazed. You imagine she’s thinking of just what she could do with a body like that. Smiling assertively, you assure her you wouldn’t ask for her to do it unless you knew that you could handle it. What could go wrong?");
		output("\n\nCelise returns your smile with an added giggle, but then her expression becomes serious. Her body begins to quiver slightly and her eyes close just before thin tendrils branch out from the blob that serves as her lower body, gaining thickness as they grow further from the base. More tentacles keep appearing until the ball of goo is nearly non-existent.");
		output("\n\nTo your surprise, you see the emerald goo girl’s breasts shrink to make a few more tentacles, leaving her with a much smaller B-cup chest. The many tendrils that have formed hold Celise’s upper body roughly eight feet in the air and bring her total height to nearly twelve feet. The grass green tentacles drip goo from their tips every so often, the little flecks slowly sliding back into the main mass after hitting the floor.");
		output("\n\nThe now rather monstrous goo girl shivers with a moan of delight. Celise cups her smaller breasts in each hand and pinches the dark nipples until a ripple passes through her gelatinous form. She opens her eyes and gives you a look of unmitigated hunger. <i>“Is this alright?”</i> she asks, her lust made obvious in the sound of her voice.");
		flags["CELISE_GIGAED"] = 1;
	}
	else
	{
		//Repeat transformation
		output("You ask Celise how she feels about becoming a tentacle monster again. She lights up at your request, immediately beginning the transformation. The amorous goo gains height as the blob of her lower body spreads out into a plethora of twisting tendrils, Massive FF-cups shrinking nearly ten sizes to perky B’s.");
		output("\n\n<i>“So good,”</i> she sighs with a shudder as she completes the changes. The emerald goo-girl stands at twelve feet tall, looking down at you with a dazed smile, the tips of her smaller tendrils brushing eagerly against your body.");
	}
	flags["GIGACELISE"] = 1;
	showCelise();
	processTime(9);
	gigaCeliseMenu();
}

//(appearance screen)
public function gigaCeliseRepeatApproach():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	output("The ‘improved’ version of Celise sits in the heated corner she was in before, albeit while filling up a lot more of the space than she did with her previous self. Her upper body’s appearance is similar to how it was before. Her gooey mane now hangs just above her shoulders instead of continuing down her back. Her darker green eyes are half closed, making her look tired and worn out. Her other facial features, a small upturned nose and cute kissable viridian lips, remain virtually unchanged. Her mouth lies half-open as well, tongue sometimes lolling out for a moment as her body shudders.");
	output("\n\nTo your surprise, the goo-girl’s B-cup breasts are in full view, dark emerald nipples readily apparent and half-erect. Her hands are occupied with slowly stroking one of her many tentacles. Her expression changes dramatically when she notices you: her eyes become more alert and her mouth closes. Celise lowers her upper body to meet you face to face, hands kneading her small tits, now with fully erect nipples. The tips of her tentacles move to brush against various parts of your body.");
	output("\n\n<i>“Are... are you here for feeding time?”</i> she asks, her eyes practically glowing with lust. If you left now you could probably get away, but the warm tentacles around you are beginning to feel very inviting.");
	//[sex*][smallform]
	//*If cum production is not high, strength temporarily reduced by a small amount.
	//alternate form sex menu
	gigaCeliseMenu();
}

public function gigaCeliseMenu():void
{
	this.clearMenu();
	if(pc.hasCock() || pc.hasVagina()) {
		if(pc.lust() < 33) {
			output("\n\n<b>You aren’t aroused enough to consider any sort of sexual situation with Celise.</b>");
			this.addDisabledButton(0,"Feed");
		}
		else 
		{
			if(pc.hasCock() || pc.hasVagina()) this.addButton(0,"Feed",gigaCeliseFeedRouter);
			else addDisabledButton(0,"Feed","Feed","You need some genitals to feed Celise.");
		}
	}
	else output("\n\n<b>You do not have any suitable genitalia to feed Celise with.</b>");
	addButton(1,"Shrink",shrinkBackToNormalCelise);
	if(flags["CELISE_NO_BED_SENPAI"] == true) addButton(3,"Allow Bed",celiseBedToggle,true,"Allow Goo Bed","Allow Celise to approach you before bed if she is in the mood.");
	addButton(4,"Send Away",sendCeliseAway,undefined,"Send Away","Send Celise off the ship to wait for you. She’ll be at the hangar in Tavros if you ever want her back.");
	this.addButton(14,"Back",crew);
}
public function shrinkBackToNormalCelise():void
{
	clearOutput();
	flags["GIGACELISE"] = undefined;
	showCelise();
	author("Gardeford");
	output("You tell Celise you want her to return to her normal form. The beryl beauty looks saddened for a moment, but nods.");
	output("\n\n<i>“Are you sure? Can we do this again sometime?”</i> she asks hopefully, begining to shrink even as she asks. As she shrinks to a low enough height you ");
	if(pc.tallness >= 60) output("pat her on the head");
	else output("pat the growing blob at her base");
	output(", assuring her that you might be up for trying it again sometime, and even if you don’t you’ll be sure to feed her plenty in this form. The viridian venus grins at the prospect, giggling at your touch. Her FF-cups return with jiggly vigor, emerald nipples sinking back into the gooey expanses along with the last of the many tendrils.");

	output("\n\n<i>“All done!”</i> she exclaims as her body finishes reverting.");
	clearMenu();
	addButton(0,"Next",celiseFollowerInteractions);
}
public function gigaCeliseFeedRouter():void
{
	showCelise();
	//male parts tentacle fun
	if(pc.hasCock()) addButton(0,"Cock Feed",malePartsTentacruelFun,undefined,"Cock Feed","Feed your tentacle-heavy Celise with a penis.");
	else addDisabledButton(0,"Cock Feed","Cock Feed","You need a penis for this scene.");
	//female parts tentacle fun
	if(pc.hasVagina()) addButton(1,"Cunt Feed",celiseFemalePartsTentacleFun,undefined,"Cunt Feed","Feed your tentacle-heavy Celise with a tentacle’s best friend - [pc.oneVagina].");
	else addDisabledButton(1,"Cunt Feed","Cunt Feed","You need a vagina for this scene.");
	//Goo pc’s fun
	//(requires pc to have goo body) && genitals
	if(pc.isGoo() && pc.hasGenitals()) addButton(2,"Goo Fun",gooPCsAreFun,undefined,"Goo Fun","Have some gooey fun with Celise. Since you’re both goo-creatures, it should be a slippery-wet mess!");
	else if(pc.hasGenitals()) addDisabledButton(2,"Goo Fun","Goo Fun","You have to be some kind of goo creature, like Celise, for this scene.");
	else addDisabledButton(2,"Goo Fun","Goo Fun","You have to have genitals for this scene.");
	if(hasACumBubble()) addButton(5,"Cum Bubble",giveCeliseATreatSetup,undefined,"Cum Bubble","Celise loves cum right from the tap, but she’d probably enjoy a stored sample too.");
	else addDisabledButton(5,"Locked","Locked","You do not have the item required for this scene. Purchasing a Bubble Buddy may be a good place to start...");
	addButton(14,"Back",gigaCeliseRepeatApproach);
}

//male parts tentacle fun
public function malePartsTentacruelFun():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	output("You ask Celise if she would be up for a snack, and end up flinching as she nearly knocks you to the ground with a tackle-hug. <i>“I’d love one! I never seem to be full with this body, and it’s all so delicious,”</i> she says excitedly, nestling in close to your face. Her tentacles wander softly over your body");
	if(!pc.isNude()) 
	{
		output(" and slip under your clothing as they go, removing the hindering garments and brushing ");
		if(!pc.hasFur()) output("against");
		else output("through");
		output(" your [pc.skinFurScales]");
	}
	output(", pleasantly cool to the touch.");
	output("\n\nThe emerald goo-girl slides sensually down your body, kissing your [pc.chest] and stomach along the way. Her lips leave a sensation of wetness on your body that fades by the time the next kiss dots your frame. Celise smiles up at you as she reaches your groin, and the soft light around you causes her transparent form to sparkle radiantly. Her expression turns to awe ");
	if(!pc.isTaur()) output("as she");
	else output("before she continues under you, and");
	output(" takes your maleness between her hands.");

	var x:int = pc.biggestCockIndex();

	//(cockbiggest=dogcock) 
	if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n<i>“This cock is just... it’s so... woof!”</i> she says before giggling and giving the length of your [pc.cockBiggest] a downward lick that ends with a sloppy smooch on the knot. Celise’s lips kiss a circle around the throbbing sphere as your cock swells to its full hardness. Her fingers brush at the tip to send electric tingles through your body. After a few seconds, she slips the [pc.cockBiggest] into her mouth, the soft goo of her mouth ");
		if(pc.biggestCockLength() >= 10) output("and throat ");
		output("massaging it as she brings her lips to the knot. The viridian girl’s hands coddle your knot, wrapping its entirety in warm wetness.");
		output("\n\nCelise’s tongue swirls around the tip of your [pc.cockBiggest], and the rapid motions bring you to the edge in moments. Spurts of [pc.cumColor] spooge discolor the emerald goo-girl as you empty your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("liquid lust");
		output(" into her throat. She moans, her eyes rolling back into her head, her hands still coaxing jizz out of your swelled knot. Celise slowly pulls back, sucking up every spurt that leaves your urethra. <i>“A wonderful start, but we’re not even close to done yet,”</i> she says with an alluring gaze.");
	}
	//(cockbiggest=Horsecock)
	else if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) 
	{
		output("\n\n<i>“Ooooo, I’ve always wanted a pony,”</i> she says with a dreamy giggle, rubbing her gooey nose into your [pc.cockBiggest] before giving it a lick that climbs from base to crown. Her fingers grip around your girth to slide alternately up and down as she kisses the center of your [pc.cockBiggest]’s flaring tip. After a moment, her lips envelop ");
		if(pc.biggestCockLength() >= 10) output("the first few inches of ");
		output("your equine member");
		if(pc.cocks[x].thickness() >= 3) output(", stretching to accommodate your girth");
		output(". Her long tongue caresses its surface, slowly bathing your [pc.cockBiggest] in gooey warmth.");
		output("\n\nYour thoughts jumble into a flash of white as the pleasurable feelings overwhelm your senses. Streams of [pc.cumColor] discolor the emerald goo-girl as torrents of your jizz disappear into her throat. She hums contentedly, and her eyes roll back, still reflexively sucking the last of the cum from your urethra. Celise slowly raises her head, her lips tickling your flare as they pass it. <i>“A beautiful start, but we’re not even close to done,”</i> she says with an alluring gaze.");
	}
	//(cockbiggest=other)
	else
	{
		output("\n\n<i>“I’m not going to lie, [pc.name]... this cock is your best feature.”</i> she says, eyeing [pc.cockBiggest] with ravenous lust. Her gooey fingers prod and rub the entirety of your length, hands combining into a single ring that bathes your [pc.cockBiggest] in wondrous pressure. After a moment her lips join her hands, and her warm tongue laps at the [pc.cockHeadBiggest] as it slides in and out of her mouth. The twin forces move in tandem, lips pulling back while hands sink to the shaft.");
		output("\n\nIn a flash, the double-threat of pleasuring efforts has you struggling to resist her onslaught. Despite your best efforts to make the feeling last, you can’t contain the need bubbling up within you. Your [pc.cockBiggest] explodes with pent up lust, showering Celise’s throat with [pc.cumColor] jizz. The emerald goo-girl draws her head and hands away, sucking the last of your cum as she goes. <i>”So delicious, but we aren’t even close to being done,”</i> she says with an alluring gaze.");
	}
	//(merge)
	output("\n\nA number of viridian tentacles position themselves under your arms, caressing your body as they hoist you into the air. Celise draws you closer to her upper body and wraps your lower body in tentacles as well. <i>“I’ll </i>try<i> to leave some for your adventures,”</i> she says, pressing herself against your [pc.chest], <i>“but no guarantees”</i>. The jade-colored goo girl dips down");
	if(pc.isTaur()) output(", and out of your vision");
	output(".");
	output("\n\n<i>“Hmm, what to do this time.... I think some tentacle loving is due!”</i> she exclaims happily, and you feel the tendrils holding your lower body shift. ");
	if(pc.legCount > 1) output("They pull your [pc.legs] apart slightly, holding them there");
	else output("They entwine with your lower body, holding it still");
	output(" as Celise ");
	if(pc.balls > 0) output("fondles your [pc.balls]");
	else if(pc.hasVagina()) output("teases [pc.eachVagina]");
	else output("tickles the base of your pelvis");
	output(". Smooth, wet tentacles wrap themselves around [pc.eachCock] as Celise reappears at eye level. A particularly large tentacle inches furtively around her shoulder. <i>“Lets take this one for a test drive!”</i> she says, sounding giddy with anticipation.");

	output("\n\nAt first you wonder where the plus-sized tendril is going, but then a hole appears in its tip. The virescent Galotian guides the dripping wet entrance onto your [pc.cockBiggest] like an onahole");
	if(pc.totalCocks() > 1) output(", giving [pc.eachCock] a few slippery tugs as she fits it");
	output(". As soon as the simulated hole covers the entirety of the [pc.cockBiggest], it begins to suck like a vacuum. Pressure ripples along your shaft, causing you to gasp at the sudden warmth.");
	output("\n\nYour arms twitch uselessly in their viscous restraints. A few stray tentacles brush at your upper body, ");
	if(pc.biggestTitSize() < 1) output("rubbing your stomach and teasing your [pc.nipples]");
	else output("coiling slowly around your [pc.breasts] and flicking the [pc.nipples]");
	output(". The majority, however, are busy milking your lower half for all it has. Celise grasps your head in both hands and presses her face to yours to kiss you with all she has. Her long tongue snakes into your mouth, wrapping around your own and slowly drawing back out.");
	output("\n\nResistance is futile against this onslaught of pleasure, and your restrained form is in no position to resist in the first place. Your [pc.cockBiggest] erupts with euphoric vigor, filling the tube of the giant tentacle that suckles it. Celise gives a happy sigh and fixes on you with a lustful gaze. <i>“I need more! Faster!”</i> she yells ecstatically as the funnel continues to suck.");
	output("\n\nYou gasp when a thin tendril slips across your body and into your asshole. It’s thin enough to be painless");
	if(pc.analVirgin) output(", albeit feeling very awkward,");
	output(" as it slides through your insides. Another set of tentacles ");
	if(pc.balls > 0) output("brushes and gently prods your [pc.balls]");
	else if(pc.hasVagina())
	{
		output("teases [pc.eachVagina]");
		if(pc.hasClit()) output(", coiling and rubbing [pc.eachClit]");
		else output(", ensuring constant stimulation");
	}
	else output("massages the base of your pelvis");
	output(". All the while, the emerald beauty plays with your upper half. She appears to be experiencing some of the fun her tentacles are having: her breathing is labored and her tongue lolls out of her mouth. She grasps one of your hands and places it against her chest. Your fingers nearly sink into the soft goo-flesh, and you can feel the hardness of one of her nipples against your palm.");
	pc.buttChange(9,true,true,false);

	output("\n\nSuddenly your mind flashes white as the thin tentacle rubs your prostate. [pc.EachCock] springs to full hardness and then some as the tendril in your asshole milks your prostate. The tentacles doing the same to [pc.eachCock] redouble their efforts, and you mindlessly buck your hips as they go. You moan in ecstasy as you are pushed over the edge for the third time, [pc.eachCock] expending what jizz is left in your reserves. The pump-like tube draws itself off of the [pc.cockBiggest], closing to prevent any of its bounty from escaping. Celise eyes the glaucous bulb with unbridled need, and she cups the tip of the tentacle in both hands to trap some of the [pc.cumColor] liquid in a gooey chalice. A look of utter happiness paints her features as she drinks the cum with her human-like mouth.");
	//Came 3 times at this point
	output("\n\nAfter she finishes, she sets you down beside your gear and leans down to kiss you again. <i>“Come back soon, [pc.name]. I’ll always be hungry for something that tasty,”</i> she says with a dreamy look. You stumble back to whatever you were doing, ");
	if(pc.libido() >= 75) output("recovering quickly from your endeavors");
	else output("feeling a bit sluggish after your ordeal");
	output(".");
	var cumImproveChange:Boolean = false;
	//If the PC doesn't have at least 10L of cum stored, chance of improvement
	if(pc.currentCum() < 10000) cumImproveChange = true;
	//Go ahead and spend loads
	pc.orgasm();
	pc.orgasm();
	processTime(160+rand(20));
	pc.orgasm();

	//Now if the PC ran dry and eligible, enhance!
	if(pc.currentCum() <= 1 && cumImproveChange)
	{
		output("\n\n<b>She’s left you utterly drained, but an answering throb deep in your spent loins promises your body will give a better showing next time. If only it didn’t leave you so tired...</b>");
		if(pc.balls > 0 && pc.ballSize() < 5) pc.ballSizeRaw++;
		if(pc.ballEfficiency < 400) pc.ballEfficiency++;
		if(pc.cumMultiplier() < 150) pc.cumMultiplierRaw++;
		if(pc.refractoryRate < 15) pc.refractoryRate += .5;
		pc.energy(-100);
	}

	//(pass 90 minutes)(if libido<50 small strength reduction for 2 hours)
	//nah

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//female parts tentacle fun
public function celiseFemalePartsTentacleFun():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	output("You ask Celise if she would be up for a snack, and end up flinching as she nearly knocks you to the ground with a tackle-hug. <i>“I’d love one! I never seem to be full with this body, and it’s all so delicious,”</i> she says excitedly, nestling in close to your face. Her tentacles wander softly over your body");
	if(!pc.isNude()) 
	{
		output(" and slip under your clothing as they go, removing the hindering garments and brushing ");
		if(!pc.hasFur()) output("against");
		else output("through");
		output(" your [pc.skinFurScales]");
	}
	output(", pleasantly cool to the touch.");
	output("\n\nYou sit as the jade-tentacled beauty kisses down your upper body, licking and cuddling your [pc.fullChest] on the way down. She nuzzles your stomach and delivers several small pecks before squeezing your sides. The warm goo of her body leaves patches of moisture that cool as the contact ends. [pc.EachVagina] wets in anticipation once her head dips lower.");
	output("\n\n");
	//(if [pc.legs]=snake)
	if(pc.isNaga())
	{
		output("The emerald goo-girl slides her hands and tentacles sensually across your snake-like tail. Celise draws her upper body back until she’s looking down at you, hands rubbing and twiddling with the tip of your tail before they begin to slowly inch their way up it. Her viscid body is warm, and the heat inside your body intensifies when she reaches your sex.");
		if(pc.hasClit()) output(" You moan softly as she kisses [pc.oneClit].");
		output(" Her tongue strays to lick at your entrance for a moment before returning its focus to your sensitive bundle of nerves, licking and gently biting it until you can’t contain yourself. Your body tenses, and you cum into Celise’s mouth, your juices dribbling down her chin and neck. She happily laps up all the fluids before she continues.");
	}
	//(if [pc.legs]=taur)
	else if(pc.isTaur())
	{
		output("The emerald goo-girl circles behind you, brushing your lower body with hands and tendrils. A gooey hand slaps your rump, an action which elicits a gasp and short moan from you as you crane your neck to look. Celise parts your cheeks and buries her face in your [pc.vaginaNoun]. You forget about looking at her and clench your teeth whilst she assaults");
		if(pc.hasClit()) output(" [pc.oneClit]");
		else output(" your folds");
		output(". Her nose rubs against your hole, causing small spasms of pleasure to rock your body. You ");
		if(pc.hasHair()) output("run a hand through your [pc.hair]");
		else output("run your hand over your scalp");
		output(", containing your lust for as long as you can. A well-timed");
		if(pc.hasClit()) output(" suckle on your [pc.clit]");
		else output(" vaginal lick");
		if(pc.hasClit()) output(" ruins those efforts, and your grip melts along with the rest of you in a body-rocking orgasm. Celise laps at your juices as they cascade into her waiting mouth and drip off her chin to land on a waiting tendril.");
	}
	else
	{
		output("The emerald goo-girl licks her lips, gripping your [pc.butt] in her hands while her tentacles separate your [pc.legs].");
		if(pc.hasClit()) output(" You moan softly as she lowers her head to kiss your [pc.clit].");
		output(" Her tongue snakes out to lick around your entrance, its tip running a circuit about the ");
		if(pc.looseness() < 2) output("tight");
		else if(pc.looseness() < 3) output("ready");
		else if(pc.looseness() < 4) output("slightly parted");
		else if(pc.looseness() < 5) output("welcoming");
		else output("gaped");
		output(" hole.");
		if(pc.hasClit())
		{
			output(" After a moment her attention returns to your ");
			if(pc.totalClits() > 1) output("first ");
			output("[pc.clit], licking and gently biting it until you can’t hold on any longer.");
		}
		else output(" After a moment, her oral attention becomes too much and you can’t hold on any longer.");
		output(" Your body tenses, and you cum into Celise’s mouth, your juices dribbling down her chin and neck. She happily laps up all the fluids before she continues.");
	}
	if(pc.hasCock())
	{
		output(" [pc.EachCock] cums uselessly onto your belly, and Celise wipes it up with a few of her many tentacles.");
	}
	//ONE CUM! AH AH AH
	//(Merge)
	output("\n\nYou relax for a moment as the numerous limbs envelop your body. Pliant viridian tendrils lift you into the air,");
	if(pc.isTaur()) output(" your tauric weight doing little to affect her as she begins,");
	output(" suspending you a few feet from the ground. Velvety wet kisses batter your [pc.chest], cocooning ");
	if(pc.biggestTitSize() < 1) output("it");
	else output("them");
	output(" in warm moistness. Celise lowers herself to your pelvis and makes sure to lick along the length of your body as she goes. This time, instead of her tongue, an array of tentacles teases the entrance to your [pc.vagina], the smaller ones holding it open slightly as a larger one slides along it");
	if(pc.hasClit()) output(", tickling your [pc.clit]");
	output(".");

	output("\n\nThe tickling tendril loops around and slips inside you to slowly push its way into your [pc.vaginaNoun]. Your insides clench around the invading appendage, trying to force it out and pull it in at the same time. The goo-girl happily goes with the flow, pushing softly whenever you suck her in. Algid tentacles do nothing to abate the fiery lust building in your nethers, so Celise simply picks up the pace. Shivers run down your body as you lose hold of your resistance. You numbly register your partner kissing you as your insides spasm with pleasure");
	if(pc.hasCock())
	{
		output(" and [pc.eachCock] sprays its load onto a waiting surface");
	}
	output(".");
	pc.cuntChange(0,20,true,true,false);
	output("\n\nYou’re given no downtime before the fucking begins anew. The gelatinous tendril inside you reforms itself into a notched variation that expands your [pc.vaginaNoun] as it works. Numerous smaller tentacles appear to assist it,");
	if(pc.hasClit()) output(" playing with your [pc.clit] and");
	output(" hotdogging themselves between the two fleshy halves of your [pc.butt].");
	if(pc.totalBreasts() == 2 && pc.biggestTitSize() > 1) output(" Two of them trail upwards to encircle your [pc.breasts] and give alternating rough squeezes and soft rubbings.");
	else if(pc.totalBreasts() == 4 && pc.biggestTitSize() > 1) output("Four of them travel upward, weaving through and squeezing your [pc.fullChest].");
	else output("A number of them travel up your body and fondle your [pc.fullChest].");
	if(pc.totalVaginas() > 1)
	{
		output(" The sinuous limbs penetrate ");
		if(pc.totalVaginas() == 2) output("your unused [pc.vagina 1].");
		else 
		{
			output("the holes to each side of your first [pc.vaginaNoun].");
			pc.cuntChange(2,20,true,true,false);
		}
		pc.cuntChange(1,20,true,true,false);

	}
	output("\n\nYour [pc.butt] is not forgotten in the avalanche of penetration. One of the thicker tentacles hotdogged in your [pc.butt] loops around and readies itself at the entrance. Your [pc.asshole] parts for the slippery member, and its natural lube enables it to easily slide in and out of your insides. The wonderful friction combines with the rest of the salacious storm in a rising tide of delectation.");
	pc.buttChange(40,true,true,false);
	output("\n\n<i>“You taste so good!”</i> Celise yells as she kneads her own breasts, pinching the emerald nubs of her nipples as her reason abandons her for paroxysmal bliss. You open your mouth to attempt to reply, but it is swiftly plugged with a tendril that swirls around your tongue. The taste is odd, but by no means bad, and you suck it mindlessly as your thoughts lose coherency. Your hands repeatedly clasp and unclasp with nothing to do in the heat of the situation.");
	output("\n\nA wave of incalescence spreads through your body from top to bottom. The seething lust inside you boils over and blinds your vision with white-hot pleasure. Your every nerve spasms in an earthshaking orgasm, sexual juices and saliva dribbling from their designated orifices only to be eaten up by the ravenous goo girl. The feeling bounces around inside you like a circuit of concupiscence, causing your whole body to arc and tighten. You continue to suck on the tentacle as you ride the surge of bliss to its end.");
	if(pc.hasCock()) output(" You’re sure [pc.eachCock] came all over the place, but you were too insensate to see or feel it.");
	//ORGASM #3.
	output("\n\nCelise looks wholly content at last. She appears to be having a little trouble maintaining her consistency, with small portions of her tentacles dripping off. She slowly draws the tentacle from your mouth, but immediately replaces it with her tongue to give you a lingering kiss. After what seems like an eternity she pulls away and sets you gently on the ground so she can wait for you to regain your wits.");
	output("\n\n“<i>Thanks for the meal. Come back any time,”</i> she says, sounding almost drunk as she helps you to your feet. You stumble back to whatever you were doing before, ");
	if(pc.libido() >= 75) output("recovering quickly from your endeavors");
	else output("feeling a bit sluggish after your ordeal");
	output(".");

	//(pass 90 minutes)(if libido<50 small strength reduction for 2 hours)
	//Go ahead and cum loads
	pc.orgasm();
	pc.orgasm();
	processTime(160+rand(20));
	pc.orgasm();

	//Now if the PC is kinda dry
	if(pc.driestVaginalWetness() < 3)
	{
		output("\n\n<b>She’s left you utterly drained and a little sore, but you seem a little more... moist down there than before.</b>");
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			if(pc.vaginas[x].wetnessRaw < 3) pc.vaginas[x].wetnessRaw += 1;
		}
		pc.energy(-50);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//kiro tentacle fun(voyeurism)
public function celiseKiroFunSekritShit():void
{
	clearOutput();
	showKiro();
	author("Gardeford");
	//(Only accessible if Kiro is medium balls or more and high trust. Giga celise in ship. find her in bar.(will do alternate intro if follower is implemented))
	
	moveTo(shipLocation);

	//first time
	if(flags["KIRO_CELISE_3SOME"] == undefined)
	{
		if(!kiroIsCrew())
		{
			output("You ");
			if(pc.isNice()) output("smile happily");
			else output("grin devilishly");
			output(", telling Kiro that you’ve found the perfect person to vent her desires into, and that person is waiting for her on your ship.");
			output("\n\n<i>“Who is it? ‘Perfect’ sounds a little too good to be true,”</i> Kiro says with an incredulous tone. <i>“The last time someone offered me something perfect, I nearly wound up in a cell!”</i>");
			//[tell] [dont tell]
			clearMenu();
			addButton(1,"Don’t Tell",dontTellKiroShit,undefined,"Don’t Tell","Don’t give away the surprise.");
			addButton(0,"Tell",tellKiroShit,undefined,"Tell","Tell Kiro!");
		}
		else
		{
			output("You suggest that you have the perfect person onboard for Kiro to play with - exactly the right kind of girl for loving absurd cumshots.");
			output("\n\n<i>“It’s Celise isn’t it?”</i> Kiro guesses with a naughty grin. <i>“Galotians love me.”</i>");
			clearMenu();
			addButton(0,"Next",crewKiroCeliseThreesomeFirstTimeIntro);
		}
	}
	//repeat
	else
	{
		output("\n\nYou tell Kiro that if she wouldn’t mind a little exercise Celise wouldn’t mind draining her again. The kui-tan perks up immediately, wildly enthused at the prospect of getting to make use of your living cum-dump once more. " + (!kiroIsCrew() ? "She follows you to your ship with her fluffy tail swishing the floor behind you and her cock swelling. You lead her through the halls until you find the corner Celise has situated herself in.":"She watches over your shoulder as you summon Celise, waiting with heavy breaths and a stiffened cock.") + " The galotian perks up when she sees you, and perks up even further when she sees the well endowed kui-tan.");
		properKiroSceneTimeLetsGo();
	}
}

public function dontTellKiroShit():void
{
	clearOutput();
	showKiro();
	author("Gardeford");
	output("You laugh. <i>“That would ruin the surprise, silly. Come see for yourself.”</i>");
	// Untrusting Kiro wouldn't do this. Do a variant where she refuses.
	if(kiroTrust() < 80)
	{
		output("\n\nThe kui-tan looks at you with a serious gaze. <i>“Listen, I’m serious! For all I know, there could be a trap behind that airlock and I’m not sure I can trust you enough to settle for any surprises. Sorry, angel, but I’ll have to pass on your offer.”</i> And with that, she turns around and hurries away.");
		output("\n\nYou guess she’s really on her guard. Perhaps you should strengthen her trust in you before attempting to try this again.");
		processTime(5);
		flags["KIRO_CELISE_3SOME_REJECT"] = 1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	if(flags["KIRO_CELISE_3SOME_REJECT"] != undefined) flags["KIRO_CELISE_3SOME_REJECT"] = undefined;
	
	celiseXKiroFirstTimeIntroEpilogue();
}
public function tellKiroShit():void
{
	clearOutput();
	showKiro();
	author("Gardeford");
	output("You tell her it’s one of your crewmates, who has recently discovered that cum is a wonderful thing.");
	celiseXKiroFirstTimeIntroEpilogue();
}

public function celiseXKiroFirstTimeIntroEpilogue():void
{
	output(" She still gives you a wary look, but then rolls her eyes and shrugs. <i>“What have I got to lose? If you were going to fuck me over, you’d have done it by now.”</i>");
	output("\n\nYou lead her through the ship until you reach the engine room that Celise stays in. The emerald goo-girl brightens at seeing you, and raises a brow when she sees your companion.");
	
	properKiroSceneTimeLetsGo();
}
public function crewKiroCeliseThreesomeFirstTimeIntro():void
{
	clearOutput();
	output("Summoning Celise doesn't take very long - good given Kiro's aggressively horny state.");
	properKiroSceneTimeLetsGo();
}
//merge
public function properKiroSceneTimeLetsGo():void
{
	moveTo("SHIP INTERIOR");
	
	showName("KIRO\nAND CELISE");
	showBust(kiroBustDisplay(true),"CELISE");
	author("Gardeford");
	output("\n\n<i>“Uhh,”</i> says Kiro when she sees the giant forest of tentacles beneath Celise’s upper body, <i>“");
	if(flags["KIRO_CELISE_3SOME"] == undefined) output("Are you sure she can handle me? There’s a lot of captain for her to handle, goo body or no.");
	else output("Whoah...”</i> She braces her hand against a wall when her cock suddenly and violently becomes wholly erect, pulsing hotly. <i>“Fuck, that made me lightheaded. Give me a second, guys.");
	output("”</i>");

	output("\n\nShe begins to back away, but from the time she came through the door it was too late. The monstrous goo-girl’s attention is fixed on the bulge in Kiro’s pants. Viridian tentacles entwine her limbs, and ");
	if(flags["KIRO_CELISE_3SOME"] == undefined) output("despite her best efforts to escape");
	else output("despite a bit of mock protest");
	output(" she’s helpless in their hold. Celise’s eyes practically glow as she slowly peels away the kui-tan pirate’s pants. Despite herself, Kiro’s magnificent equine member ");
	if(flags["KIRO_CELISE_3SOME"] == undefined) output("is already at full mast");
	else output("is throbbing powerfully and dripping gouts of pre large enough to fill a shotglass");
	output(". The goo-girl raises her upper half to meet her ‘victim’ face-to-face.");

	output("\n\n<i>“Hold on to your cum or she’ll suck it out before you have a chance to stop her,”</i> you warn with a mischievous smile.");

	output("\n\nSwirling tendrils brush against Kiro’s fuzzy ballsack until they converge into a single, coated sheath of goo. The kui-tan pirate coos softly before the emerald sheath begins to ripple visibly; Kiro’s voice catches in her throat as Celise softly vibrates around her sensitive testes. Her monstrous member instantly springs to full hardness, blasting herself in the face with creamy spooge. You feel ");
	if(pc.hasCock()) output("[pc.eachCock] harden");
	if(pc.hasVagina() && pc.hasCock()) output(" and ");
	if(pc.hasVagina()) output("[pc.eachVagina] begin to wetten");
	output(" as you watch Celise rush in and give Kiro a sloppy kiss that lets her lick up the jizz covering the furry girl’s face. Kiro’s cock is absorbed into the virescent goo-girl’s body, where the flow stops as it’s tightly compressed.");

	output("\n\nCelise’s insides form a series of rings that slide along the length of the rigid horsecock, not letting it soften for a moment as they undulate. Kiro’s eyes have become unfocused, and she blindly returns the kisses being given all over her face. For her part, the pirate panty-thief’s balls are working overtime, with assistance from the vibrating sheath. Some of the stray fluid from the first eruption must have made its way between the kui-tan’s lips, since her balls are absolutely pulsing beneath the goo and straining to release their stores into the jade fucktube.");
	output("\n\nThe lime-colored goo-girl appears to notice this as well, because a smile forms on her face akin to that of a lottery winner. She pulls the insensate tanuki away from her fervent kissing in order to brush Kiro’s fuzzy cheeks with viscous thumbs. Her hands guide the senseless girl to one of her comparatively small C-cup breasts. Kiro begins to mindlessly suckle at the pine-green nipple, and Celise moans softly. The cock-milking tunnel extends a thinner tube, which connects with her nipples. Small streams of jizz travel up these ducts, and out through the holes at the end. Kiro’s suckling brings the liquid directly into her mouth, and Celise continues to happily breastfeed the pirate her own sexual juices.");
	output("\n\nThe suckling quickly creates a vicious cycle. The more she drinks, the fuller her rapidly growing balls get. Neither one of the girls seems to care much about this fact: you certainly don’t, either. Kiro gradually begins to regain her senses, and she detaches from the cum leaking nipples. Celise seems slightly disappointed, but doesn’t stop her as she pulls the goo-girl into an embrace so tight that her DD-cups squash the other girl’s C-cups nearly flat. Kiro grasps at the thick thighs that imprison her cock and pulls the thick meat out of its undulating trap until just the flare is almost popping out. By the look in Kiro’s eyes you think she wouldn’t be able to remove the flare without losing her senses a second time. Instead she gets a firm hold on the pair of hips and drives her equine member home, all the way to the hilt.");
	output("\n\nThe sheath surrounding Kiro’s ballsack begins to lose coherency as Celise is fucked silly by the ravenous tanuki. Some of the tentacles try to assist with the fucking, but after having been filled with a steady flow of cum before, the goo-girl is having trouble controlling her longer appendages. It’s all she can do to hang on to Kiro for dear life as she receives the pounding of a lifetime.");
	output("\n\nThe two of them shout in simultaneous orgasm. You can see Kiro’s horsecock bulge with its load before it floods the emerald girl’s body. Kiro continues to fuck and rut into Celise until her balls are back to their regular size, by which time the normally bright and verdantly colored goo girl looks more like a giant splash of green-tinged spooge. Kiro lies out cold in the literal puddle of fuck, smiling wistfully as small tentacles pet various parts of her furry body. You wait there patiently, helping Kiro towel off and get re-dressed once she wakes.");
	if(!kiroIsCrew()) output("\n\nThe two of you travel to the station together before parting ways. You leave Celise to digest her gigantic meal for the time being while you ponder what to do next.");
	else output("\n\nThe two of you leave Celise to digest her meal.");
	//kiro orgasm ballshrank shit
	kiro.orgasm();
	//(pass 3 hours)(lust raise +40)
	processTime(160+rand(20));
	pc.changeLust(40);
	//Lets keep count, whynot?
	IncrementFlag("KIRO_CELISE_3SOME");
	if(!kiroIsCrew()) currentLocation = shipLocation;
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//tentacle massage fun
//Accessed from masturbate menu on ship. Req's genitals.
public function tentacleMassageFunShit():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	output("Adventuring is hard work.");
	output("\n\nYou plop down onto your pleasantly soft bed and breathe a large sigh. Your muscles ache so much you want nothing but a nap, but on top of that you’re so horny that you can’t imagine getting any rest at all. You ");
	if(!pc.isNude()) output("manage to strip out of your garments and ");
	output("glare at your ");
	if(pc.hasCock()) output("hardening [pc.cocksNounSimple]");
	else if(pc.hasClit()) output("throbbing [pc.clits]");
	else output("naked and aroused sex");
	output(". You briefly think of searching the extranet for porn, but don’t feel like putting forth any sort of strenuous effort. What you need is something relaxing to take care of both of your problems at once. Through the tired haze you remember your currently tentacle-laden goo-girl crew member.");
	output("\n\nYou hit the button for Celise’s room on the ship’s intercom to ask if she could come up for something special. Shortly afterwards your door opens and a slew of tentacles slides through the open portal. Celise ducks under the door and gives you a radiant smile, obviously happy you called her up. She gives an excited gasp as she notices your obvious lack of clothing, her eyes trailing down your body.");
	output("\n\n<i>“What... What did you have in mind?”</i> she asks. Her smile is replaced by a slack-jawed stare as you ");
	if(pc.legCount > 1) output("open your [pc.legs],");
	else output("adjust your [pc.leg]");
	output(" and her gaze fixes on your ");
	if(pc.hasCock()) output("rock hard [pc.cocksNounSimple]");
	else if(pc.hasClit()) output("throbbing [pc.clits]");
	else output("naked and aroused sex");
	output(". You kindly ask if she wouldn’t mind giving you a massage. Her attention snaps back to your face and she replies that she would very much like it. You hold up a finger before she begins, telling her to be careful not to hurt your overworked muscles.");
	output("\n\n<i>“Don’t worry. I can be careful,”</i> she says with a lusty smile before gently lifting you and placing you on your stomach. You see hands forming at the ends of her tentacles within your vision and close your eyes as lukewarm goo begins to caress your body.");

	//Taur legs:
	if(pc.isTaur())
	{
		output("\n\nThe forest of Celise’s hands begins massaging your alien lower body. They begin with your rump, kneading the stress out like tiny rolling pins. You feel short pangs of pressure followed by sweet, sweet bliss as the pliant digits slowly brush up against every part of your lower body’s [pc.skinFurScales] and press all the right places to make you melt into the bedsheets. After a few moments, you feel some of the hands sneak underneath you, ");
		if(pc.hasCock() && pc.hasVagina())
		{
			output("squeezing your delicious [pc.ass]");
			if(pc.hasClit()) output(" as they gently rub [pc.eachClit]");
			output(" and suck at [pc.eachCock]");
		}
		else if(pc.hasCock()) output("forming a heavenly suction hold on your [pc.eachCock]");
		else
		{
			output(" rubbing around the entrance to [pc.eachVagina]");
			if(pc.hasClit()) output(", and playing with [pc.eachClit]");
		}
		output(". You sigh contentedly while the legion of fingers prods your every part.");
		if(pc.hasTail()) output(" Celise brushes one gooey hand along the length of [pc.oneTail], giggling at your soft noises of pleasure her act elicits.");

		output("\n\n<i>”</i>Don’t even think of holding it in! Just give me all that tasty stress,”</i> the impatient galotian whispers as she continues her ministrations. Even if you wanted to, you don’t think your body would let you hold back for more than a few seconds. As the time goes by, you feel the inexorable tide of lust building within you. Celise finally pushes you over the edge by poking a pliant thumb into your [pc.ass] and ");

		if(pc.hasVagina()) output("playing across your prostate with the semisolid digit");
		else output("carefully exploring every inch of your insides");
		output(". You cum with everything you have, ");
		if(pc.hasCock() && pc.hasVagina()) output("blasting fluid from both of your sexes");
		else if(pc.hasCock())
		{
			if(pc.cumQ() < 6) 
			{
				output("squirting a few paltry drops into the goo-girl’s sucking tentacle");
				if(pc.cockTotal() > 1) output("s");
			}
			else 
			{
				output("blasting your load into the goo-girl’s sucking tentacle");
				if(pc.cockTotal() > 1) output("s");
				if(pc.cumQ() >= 2000) 
				{
					output(", and turning ");
					if(pc.cockTotal() == 1) output("it");
					else output("them");
					output(" [pc.cumColor] with the sheer volume of your seed");
				}
			}
		}
		else 
		{
			if(pc.isSquirter()) output("blasting [pc.girlCum] all over the tentacles that are rubbing you down");
			else output("soaking the tentacles with every ounce of [pc.girlCum] your body can offer");
		}
		output(", feeding your tentacle-laden goo slut with all you have.");
	}
	//human legs:
	else
	{
		//human feet or lizard feet:
		if(pc.legType == GLOBAL.TYPE_HUMAN || pc.legType == GLOBAL.TYPE_LIZAN)
		{
			output("\n\nThe plethora of emerald hands caresses your aching feet, massaging your ankles and the spaces between your toes. They gently roll each foot to relax the heel. ");
		}
		//Hooves:
		else if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output("\n\nThe plethora of emerald hands caresses the heel of your hooves, soothing away the tension as they creep ever higher. ");
		else output("\n\n");
		output("Your tension melts as gooey fingers gently massage every muscle in your worn out [pc.legs]. Soon they reach your waist, and Celise ");
		if(pc.hasCock() && pc.hasVagina()) {
			output("squeezes your [pc.ass]");
			if(pc.hasClit()) output(" as she travels down to play with [pc.eachClit]");
			output(", letting one hand continue down to ");
			if(pc.balls > 0) output("fondle your [pc.balls]");
			else output("brush across your groin");
			output(" and gently stroke your [pc.cocks]");
		}
		else if(pc.hasCock()) output("maneuvers some of them underneath you, slowly stroking [pc.eachCock] from every angle.");
		else
		{
			output("slides one down through your ass-cheeks to rub your [pc.vaginas]");
			if(pc.hasClit())
			{
				output(" and ");
				if(pc.totalClits() == 1) output("play with");
				else output("multiply to play with");
				output(" your [pc.clits]");
			}
		}
		output(". You moan with pleasure as the pliant digits work on your sex");
		if((pc.hasCock() && pc.hasVagina()) || pc.totalCocks() > 1 || pc.totalVaginas() > 1) output("es");
		output(".");
		if(pc.hasTail()) output(" The viridian goo-girl also rubs along [pc.eachTail], poking at certain points that make you tense slightly before melting into a puddle of relaxation.");
		output("\n\n<i>“Don’t hold back. Just let out all the stress for me. All that tasty stress,”</i> Celise whispers as she continues working. In your state you hardly feel up to holding it in as ");
		if(pc.hasVagina() && !pc.hasCock()) 
		{
			output("her fingers");
			if(pc.hasClit()) output(" rub your [pc.clits] and");
			output(" tease the entrance");
			if(pc.totalVaginas() > 1) output("s");
			output(" to [pc.eachVagina]");
		}
		else if(pc.hasCock() && !pc.hasVagina()) output("one of her hands sinks down around [pc.oneCock] like an onahole");
		else 
		{
			output("she teases both of your sexes at once, rubbing [pc.eachCock] and [pc.eachVagina] in turn");
			if(pc.balls > 1) output(" while giving your [pc.balls] light presses to encourage them to unleash their load");
		}
		output(". After seconds that feel like minutes you feel the waves of pleasure welling up within your body. The final thing that pushes you over the edge is Celise poking one of her gooey thumbs into your [pc.ass] to ");
		if(!pc.hasVagina()) output("rub the semisolid digit against your prostate");
		else output("rub around and explore your insides with fervor");
		output(". You cum with all your might, ");
		if(pc.hasCock() && pc.hasVagina()) output("blasting fluid from both of your sexes");
		else if(pc.hasCock())
		{
			if(pc.cumQ() < 6) 
			{
				output("squirting a few paltry drops into the goo-girl’s sucking tentacle");
				if(pc.cockTotal() > 1) output("s");
			}
			else 
			{
				output("blasting your load into the goo-girl’s sucking tentacle");
				if(pc.cockTotal() > 1) output("s");
				if(pc.cumQ() >= 2000) 
				{
					output(", and turning ");
					if(pc.cockTotal() == 1) output("it");
					else output("them");
					output(" [pc.cumColor] with the sheer volume of your seed");
				}
			}
		}
		else 
		{
			if(pc.isSquirter()) output("blasting [pc.girlCum] all over the tentacles that are rubbing you down");
			else output("soaking the tentacles with every ounce of [pc.girlCum] your body can offer");
		}
		output(", feeding your tentacle-laden goo slut with all you have.");
	}
	output("\n\nNow that she has thoroughly massaged your lower half, Celise moves carefully to your upper body. Precise fingers ");
	if(pc.tone >= 50) output("run across your muscled physique, working out knots in a comfortable manner");
	else output("run across your smooth body, pressing various relaxing points that help you loosen up from your day");
	output(". You plunge into a chasm of unequaled repose until you feel totally relaxed under the emerald girl’s expert chirapsia. She continues upwards, spreading her reach to cover both of your arms. She massages your shoulders, rubbing deeply to release the tension. The action is repeated with your elbows, forearms, and wrists, ending when she locks fingers with you for a moment and leans down to kiss the nape of your neck. She presses her upper body lightly against yours and begins to vibrate lightly to give your whole back a comfortable massage.");
	output("\n\nThis continues until you feel yourself drifting slowly out of consciousness. When you wake, Celise is using herself as your pillow");
	if(pc.hasHair()) output(" while gently brushing your hair");
	output(" and looking at you lovingly... or perhaps hungrily. You stretch, noticing that you feel much better than before, and thank Celise for the wonderful massage. <i>“Any feeding time is fun with you, [pc.name],”</i> she says with a beaming smile. You stand, recovering your gear, and return to your adventures.");
	//(pass 3 hours)(pc.orgasm)(restore health equal to rest option.)
	restHeal();
	processTime(160+rand(20));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Goo pc’s fun
//(requires pc to have goo body) && genitals
public function gooPCsAreFun():void
{
	clearOutput();
	showCelise();
	author("Gardeford");
	output("You ask Celise if she’s up for some melty goo fun. She claps excitedly and nods, her tentacles stretching eagerly toward you. You walk forward, feeling her warm body caressing your [pc.legs] before they melt together. The forest of tentacles parts as you walk through it, slowly mixing yourself with the emerald galotian. She sighs above you as your body slides through her. You duck inside, melting and swimming through the mass of tendrils to approach the center.");
	output("\n\nThe feeling is amazing, like being touched over every inch of your body by her lukewarm goo. ");
	if(pc.skinTone != "green") output("Your colors mix with hers, creating vibrant patterns in the dark green liquid.");
	else output("Your own green colors compound with hers, creating an even more vibrant shade.");
	output(" You can still hear her voice vibrating in her tendrils as you swim through them, and the shuddering travels through your body as well. The pleasure you’re creating for her is reflected twofold back into you.");

	output("\n\nAfter slipping through her you manage to pull back from the pleasure, reforming yourself inside the tangle of viridian tendrils. You relax in the softness of her body, idly stroking the many extremities of her lower half as you listen to the music of her pleasure noises. They twitch as you touch them, but don’t shy away from your lavish attentions. You could get used to this.");
	output("\n\nYou hear a liquid sounding splurch before Celise’s upper body forms above you in the mass of tentacles. She smiles lustfully at you and leans in for a kiss, falling along the wall until her short upper frame lies atop you. You can feel her almost fully solid evergreen nipples rubbing against your gooey flesh, and you reach through your sides to pinch and pull them deeper. Their owner moans in response and gives you a sloppy kiss, slipping her tongue inside you to play. You trade yours for hers, exploring her body with a tendril of your own.");
	output("\n\nShe pulls closer to you, and you unsheathe your hands to drape them around her back and lock her in place atop you. Your kissing intensifies so greatly that the two of you begin to sink together, feeling each others pleasure mixing in the process. The feeling of it overwhelms every sense your goo-formed body can emulate, and it responds in the only way it knows how. By coming hard.");
	output("\n\nYou had nearly forgotten about your genitals, so when they decide to fill Celise’s upper half with a flood of ");
	if(pc.cumType != pc.girlCumType)
	{
		if(pc.hasCock()) output("[pc.cum]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.girlCum]");
	}
	else
	{
		if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
	}
	output(" you are only able to spasm in her arms as she absorbs it with gusto, her body becoming slightly clouded in the process before she can filter the excess into a further part of her. Your kisses are softer now, leaving the both of you solid, and with an amount of tongue befitting a human couple. Her tongue flexes incredibly wide, letting you hold it between nearly the entirety of your lips as it slides back into her own.");
	output("\n\nAfter this short respite your explorations become braver once again, you reach inside the emerald goo-girl’s body and scoop up some of your cum before it can leave to be dissolved. You help the ");
	if(pc.hasCock()) output("[pc.cumColor]");
	if(pc.hasCock() && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("[pc.girlCumColor]");
	output(" swim its way up her body. Her body offers little resistance, letting your hand wade through it like a swimmer in the pool. Her breathing becomes heavier as you approach her head, devolving into rapturous moans as you reach it. Your cum floats inside her semi-solid skull, literally a mind full of fuck.");
	output("\n\nShe collapses, unable to hold herself together under the pleasure, and washes over you in a bath of viridian fluid. She reforms beneath you seconds later, humming contentedly and rubbing her hands over your [pc.chest]. Her tendrils wriggle closer to you, firmly massaging your sticky goo-flesh. Sometimes they go a little too hard and slip inside, coming out on the other end only to rub that area instead.");
	output("\n\nHer hands make their way to your sex, swimming through its gooey form with delicate movements. ");
	if(pc.hasCock()) 
	{
		output("You feel her fingers and tendrils inside and around [pc.eachCock]. You thrust your hips up instinctively as they encase ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
	}
	else
	{
		output("You feel her hands and tendrils slip through the inner passage");
		if(pc.totalVaginas() > 1) output("s");
		output(" of your [pc.vaginas], grinding your hips instictively to entrap them");
	}
	output(". In a matter of minutes she has you at the edge of orgasm, though this time one that your are perfectly aware of and can feel building within every cell of your gooey form.");
	output("\n\nThe feelings rise and boil until they refuse to be kept down any longer. ");
	if(pc.hasCock() && pc.cumType != pc.girlCumType)
	{
		output("[pc.Cum]");
		if(pc.hasVagina()) output(" and [pc.girlCum]");
	}
	else output("[pc.GirlCum]");
	output(" shower");
	if(!(pc.hasCock() && pc.hasVagina())) output("s");
	output(" the inner sanctum that houses you as ");
	if(!(pc.hasCock() && pc.hasVagina())) output("it squirts relentlessly from your sex");
	else output("they squirt relentlessly from your sexes");
	output(". Celise licks her lips and moans as your sexual fluids are absorbed by her oversized body. Her hands leave to give your juices ample room to flow, absorbing them across as much of her form as possible to prevent buildup.");
	output("\n\nTaking advantage of her split attention, you melt down over and into her, mixing inside her body. When you finish the two of you are left with both heads, four arms, your genitals, and her chest. While she still works out what’s going on you take the pair of beautiful B-cups and twist their dark jade nipples, delighting when you feel the sensations along side her. The emerald goo-girl’s head shoots back as she gasps, trying to find words or moans but unable to voice any of them. You continue to abuse the squishy boobs with both hands with utter abandon as she tries to regain her senses.");
	output("\n\nIn her blind lust her hands search the combined body, ending up at the genitals. She begins to play with them automatically, still thinking they are only connected to you and thinking she’s taking her revenge. You feel the sudden influx of euphoria as it explodes through your body and into her head. You laugh as her tongue lolls out of her mouth, but her hands continue milking, sending rockets of orgasmic glory to obliterate any chance of her thinking.");
	output("\n\nIn no time at all her berserking thrusts begin to reach your mind as well, and you feel the third round of bliss welling up throughout your [pc.skinTone] goo. You let go of her breasts and turn her head toward you, kissing her lust addled lips and closing your eyes. The feedback of your feelings from the kiss and hers run like a revolving door with no exit through your mind, growing to infinite pleasure and probably continuing past the point that it renders you incapable of thinking.");
	output("\n\nYour body pulses with more energy than you could have thought possible, overfilling even the massive appetite of the tentacled goo girl. Your ");
	if(pc.cumType != pc.girlCumType)
	{
		if(pc.hasCock()) output("[pc.cum]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.girlCum]");
	}
	else
	{
		if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
	}
	if(!(pc.hasCock() && pc.hasVagina())) output(" dribbles");
	else output(" dribble");
	output(" from the tips of her tentacles as they try to absorb it in time. Neither of you can even muster the energy to shout out as you kiss each other and cum in a seemingly endless cycle. The tentacles assist in the only way they know how, encircling the pert B-cups and flicking at their nearly solid nipples. The entirety of her form shudders with the earth-shaking bliss of this cum.");
	output("\n\nWhen you come to, you’re lying in a Celise colored puddle on the floor of your ship. It seems you recovered more quickly than her, and you stand, being careful not to slip as you gather your goo-covered [pc.gear]. You leave the dissolved galotian to recover, returning to your previous endeavors.");
	//(pass 3 hours)
	processTime(160+rand(20));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
