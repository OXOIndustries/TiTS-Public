//Krissy Vellyne (Gonna find->replace)
//By Fenoxo

//============================================
//	flags["KRISSY_INTRO_RESULT"]
//	undefined = not procced
//		-1 = rejected outright
//		 0 = gave ride but no bang
//		 1 = get fucked with throbb
//		 2 = boobsucking gush stuff
//		 3 = tied up stuff by third
//	flags["KRISSY_YEAR"]
//		This tracks the year you encountered Krissy. Could be used for enabling this 1x per year or adding on later.
//	flags["MET_KRISSY"]
//		Obvious "have you met her" flag
//	
//============================================

//Reindeer Party Girl looking to hitchhike to Canadia Station
//Went to a big christmas party and spent all her money.
//Needs to get home to Canadia station
//promises a present if you help her out.
//Does Gush and lets you nurse while giving out an HJ/fingerbang
//Does Throbb and bangs you to orgasm, nuts in your mouth
//Sits in hyper’s lap and takes soak, then grinds to orgasm with wholebody stroke
//Awards coords and a santa hat.
//Santa hat is +5 sexy and +level*5 HP
//Wears a red strapless dress, furlined. Short.
//Basically girl at right mixed with Blossom
//Cherry-scented bodyspray
//Dark Chocolate nips
//Hoof feet
//Thick black fingernails
//Bit of a Brooklyn accent
//Grad Student working on dissertation
//Has a roommate

public function showKrissy(nude:Boolean = false):void
{
	if(flags["MET_KRISSY"] == undefined) showName("REINDEER\nGIRL");
	else showName("\nKRISSY");
	showBust("KRISSY" + (nude ? "_NUDE":""));
}


//Encountering Krissy
public function encounterKrissy():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	flags["KRISSY_YEAR"] = getRealtimeYear();
	output("Just as you’re about to board your ship, a hand falls softly on your shoulder, accompanied by the squeak of a girlish voice. <i>“‘Scuse me, [pc.misterMiss].”</i> The ‘clip-clop’ of nervous hooves on the deck rings in your ears as you turn to regard the speaker. <i>“You mind giving me a lift to Canadia Station?”</i> A feminine, bipedal deer-girl interlaces her fingers together pleadingly. <i>“It’s Christmas, ya know? Season of giving an’ all.”</i> She bats her overlong lashes at you imploringly, literally doe-eyed. <i>“Please? I didn’t realize how low on creds I was getting.”</i>");
	output("\n\nYou spare the would-be hitchhiker a more thorough examination.");
	output("\n\nDressed in a shimmery red dress with a short hemline and thick fur lining, the deer woman looks to have come fresh from a holiday get-together. A small bouquet of flowers pretties up her freshly styled, shoulder-length hair. Her lips are painted a glossy chocolate, and her makeup does a fantastic job of complementing the cuteness of her coal black, button nose. Your gaze inevitably dips lower to take in the firm, half-exposed swells of her shapely bosom, large enough to jiggle like twin bowls full of jelly when she moves; without a bra or straps on her dress, she spends a <b>lot</b> of time jiggling. Finally, black leather anklets with brassy sleigh bells lend the woman a final note of holiday cheer with every step she takes.");
	output("\n\nHow did she sneak up on you again?");
	output("\n\n<i>“Sooo, um... can I hitch a ride? I have the coordinates if you’ve never been there or nuttin’. It’s not far.”</i> Those big eyes roam back and forth across your body. <i>“An’ maybe we can spread some holiday cheer of our own on the trip. Whaddya say?”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Sure",sureLetsTakeARideDeerbutt);
	addButton(1,"No Way",noWayDeerbutt);
}

//No Way
public function noWayDeerbutt():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	output("You shake your head. <i>“");
	if(pc.isBimbo()) output("Awww, sorry babe, but I’ve got like, tons of stuff to do. Don’t worry though! Pretty thing like you? You’ll have all the rides you can ask for!");
	else if(pc.isBro()) output("Nope. Busy.");
	else if(pc.isNice()) output("Sorry, but I can’t afford to dawdle. There are time sensitive matters that require my attention.");
	else if(pc.isMischievous()) output("No can do, sweet thing. Time’s a real bastard of a taskmaster, keeping me from taking care of a pretty girl like you. Maybe I’ll get a chance to help you out if you’re still here later on, but I bet you won’t have problems finding a kind soul around this time of year.");
	else output("Nope. Shoulda planned ahead, kiddo.");
	output("”</i>");

	output("\n\nLike a marionette with its strings cut, the busty babe sags in disappointment. <i>“Oh. Okay.”</i> She forces a nervous smile. <i>“Hope you have Happy Holidays anyway, and a good new year.”</i> She waves. <i>“Seeya, I guess.”</i> Then she turns away, daintily clip-clopping toward the next nearest vessel. The white tuft of her tail twitches through a hole in the back of her dress, lifting nervously.");
	output("\n\n<b>You doubt you’ll see her again. Humbug.</b>");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["KRISSY_INTRO_RESULT"] = -1;
}

//Sure
public function sureLetsTakeARideDeerbutt():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	output("<i>“Sure.”</i> You wave her onto the ship. <i>“" + (canadiaUnlocked() ? ("I’ve " + (flags["CANADA_UNLOCKED"] >= 2 ? "been there before" : "already got the coordinates") + ". It won’t be a problem.") : "I’ll need those coordinates if we want to get there in one piece.") + " This way.”</i> You ascend the boarding ramp yourself and lead her toward the cockpit to start the launch sequence.");
	output("\n\n<i>“I’m Krissy,”</i> the deer-woman announces. <i>“Figured you should know my name.”</i> She smiles winningly as she jingles on behind you.");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Such a pretty name! I’m like, [pc.name]. We’re gonna be bestest buds!");
	else if(pc.isBro() || pc.isAss()) output("[pc.name] Steele.");
	else output("I’m [pc.name]. Nice to meet you, Krissy.");
	output("”</i>");
	output("\n\nRunning her fingertips across a bulkhead in wonder, your new cervine friend breathlessly asks, <i>“You own this thing? All by yourself?”</i>");
	output("\n\n<i>“Yep.”</i> You grin over your shoulder. <i>“You like her?”</i>");
	output("\n\nThe deer-woman giggles gleefully. <i>“She’s beautiful.”</i> Her eyes flicking from the ship back to you. <i>“Both my saviors are.”</i>");
	processTime(5);
	flags["MET_KRISSY"] = 1;
	clearMenu();
	addButton(0,"Next",sureLetsTakeARideDeerbutt2);
}
public function sureLetsTakeARideDeerbutt2():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	output("Krissy hangs onto the back of your chair the entire way through liftoff, continuing to compliment your ship and flirt with you in equal measure. When you break atmosphere and lay in the course" + (!canadiaUnlocked() ? " she suggested":"") + ", the merry deer-girl pivots around to sit sideways in your lap, her arms draping across your shoulders. The weight of her breasts, plush and heavy, presses against " + (pc.biggestTitSize() >= 1 ? "your own":"your chest") + ", ensuring you can feel the slow-firming points of her nipples through the satin fabric of her dress.");
	output("\n\n<i>“Thanks for this, [pc.name]. Really.”</i> Krissy leans close enough for her nose to lightly graze your own, looking at you with wide, happy eyes. <i>“You saved </i>my<i> Christmas.”</i> She produces a Santa hat, the perfect match to her dress, and slips it onto your head. <i>“And I was thinking it’d only be fair if I gave you a Christmas present back, ‘specially since I got some fun party favors from my friends.”</i> She wiggles her ass against your crotch, not-so-innocently ");
	if(pc.hasCock() && pc.biggestCockLength() >= 24) 
	{
		if(pc.isErect()) output("measuring the fully erect mass" + (pc.cockTotal() > 1 ? "es":"") + " of your bulge" + (pc.cockTotal() > 1 ? "s":""));
		else output("measuring the growing mass" + (pc.cockTotal() > 1 ? "es":"") + " of your bulge" + (pc.cockTotal() > 1 ? "s":""));
	}
	else if(pc.balls > 0 && pc.ballDiameter() >= 4) output("apparently enjoying the feel of your capacious balls" + (pc.balls == 1 ? "ack" : "") + " pushing back against her");
	else output("warming your loins");
	output(". <i>“Besides, the best way to spread Christmas cheer is by vigorously fucking sexy deer. And I don’t see any other deer ‘round here. Do you?”</i>");
	output("\n\nYou don’t. You’re left with a choice: play some of her reindeer games or kick her out of your lap to make the trip in peace. Which will it be?");
	processTime(15);
	pc.changeLust(10);
	clearMenu();
	if(pc.cockThatFits(250) >= 0 || pc.hasHardLightEquipped()) addButton(0,"Wrap&Fuck",cockSelect,[krissyWrapUpByThird,250,true,0],"Wrap & Fuck","Wrap her up like a present and give her a gift of your own.");
	else addDisabledButton(0,"Wrap&Fuck","Wrap&Fuck","Requires a cock that fits <b>or</b> a hardlight strapon.");
	if(pc.hasVagina()) addButton(1,"Search4Cock",getBanguByKrissy,undefined,"Search For Cock","Surely she’s packing a surprise under her skirt for you to unwrap - right?");
	else addDisabledButton(1,"Search4Cock","Search For Cock","You need a vagina for this.");
	addButton(2,"Tits.",gushyGushSantaShit,undefined,"Tits.","Krissy has a beautiful rack. Get in on that.");
	addButton(4,"No Thanks",noThanksKrissyButt);
}

//NoThanks
public function noThanksKrissyButt():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	if(pc.isAss()) output("Not so g");
	else output("G");
	output("ently removing the holiday-obsessed mynx from your lap, you let her know that you don’t need any reward for your help. Doing the right thing is enough.");
	output("\n\nKrissy bites her knuckle as you explain, then nods slowly. <i>“Okay. I’ll just... wait over here then. I won’t be no bother for nobody.”</i> She steps back. <i>“And you can keep the hat. It looks way better on ya.”</i>");
	output("\n\nNo point in fighting about it.");
	output("\n\nThe rest of the trip goes peacefully, and Krissy leaves soon after.\n\n");
	processTime(8*60);
	shipLocation = "CANADA1";
	currentLocation = "CANADA1";
	flags["KRISSY_INTRO_RESULT"] = 0;
	quickLoot(new SantaHat());
}


//Does Throbb and bangs you to orgasm, nuts in your mouth
public function getBanguByKrissy():void
{
	clearOutput();
	showKrissy(true);
	showBust("KRISSY_NUDE_THROBB");
	author("Fenoxo");
	output("You glance past the deer-woman’s offered cleavage to the smooth satin finish of her high-hemmed skirt. It’s completely flat - nary a bulge to be found! <i>“I was really hoping you’d have a present for me, but I don’t see any surprises under this tree.”</i> You politely pat at her crotch and display your poutiest pout. <i>“I want a... big present to stuff my stocking.”</i>");
	output("\n\nWith a spritely bounce onto her hooves, Krissy steps back to give you a serious look. Her eyes glint with dangerous intent. Did you offend her? You make ready to apologize - to explain that you assumed one of her party favors was Throbb - when she produces the very same chemical cocktail. It’s a huge injector vial, easily two or three times as thick around as what you’d expect and filled with faintly glowing blue fluid. <i>“You’re a smart one, [pc.misterMiss] [pc.name], guessing what kinds of surprises I was packing.”</i>");
	output("\n\nKrissy bends forward, cleavage on the cusp of spilling out of her top like a dam-breaking flood, and lands a quick peck on your forehead. <i>“Truth be told, I’ve been thinking to myself: [pc.heShe]’d be an awesome first ride for a new dick.”</i> She grabs the puffy ball at the top of your new hat and twirls it around two fingers. <i>“And you’re telling me you want it too? For real?”</i>");
	output("\n\nYou nod" + (pc.isBimbo() ? " like a bobblehead during a high-G maneuver":"") + "." + (pc.isBimbo() ? " <i>“For realsies!”</i>":""));
	output("\n\nThe deer-girl straightens and spreads her arms in sudden mirth. <i>“It’s a Christmas miracle!”</i>");
	output("\n\nYou " + pc.mf("chuckle","giggle") + " along with her, leaning forwards in your chair for a better view of the transformation to come. Throbb is no joke. One dose is enough to give just about any girl a prick. A load like that? It’ll give Krissy a monster cock. It’ll have to. You start to warn her-");
	output("\n\n<i>“Ooooh, how sweet! You’re worried about lil’ ol’ me!”</i> Krissy puts her free hand on an aggressively cocked hip, twirling the vial in the other. <i>“I know what I bought, sugar.”</i> She steps closer, hiking up the edge of her skirt, the tuft of her tail popping through its custom-made hole as the garment is bunched above curvaceous hips. A creamy chocolate mound appears, halfway swollen and kissed with a chill morning’s worth of dew. <i>“Ooooh, and here I thought you wanted me to grow a big ol’ <b>cock</b> to fuck you with... but you love my puss!”</i>");
	output("\n\nYour flabbergasted retort dies on your lips when Krissy plunges the injector directly into her mound, wincing in pain. The blue goo bubbles and roils, shunting into the deer-girl’s body in the space of two heartbeats. She yanks the empty vessel out, looking down at it in disbelief. <i>“I... barely felt it.”</i> She tosses it into the waste. <i>“Isn’t Throbb supposed to be fast acting?”</i> One spread leg at a time, Krissy slides back into your lap, taking a position that forces the lips of her pussy to part ever so slightly. <i>“They better not have given me a fucking...”</i>");
	output("\n\nThe deer-girl trails off mid-diatribe, glassy eyed. Her pupils dilate one at a time. Opening her mouth, she licks her lips only to close them once more. She shivers, very slowly bringing herself to focus on your face. <i>“Uhh...”</i> Her ears twitch, slowly folding down, limp as a pair of wet noodles, as she stares at you. She forgets to blink. <i>“D-definitely the real... real...”</i> The festive party-goer’s words fail her. She bites her lip and moans in sudden, exquisite passion, feeble inhibitions blown away in the face of the artificial eroticism pumping through her veins, building up her libido and a bulge of new flesh alike.");
	output("\n\nYou barely notice the pussy juice dribbling all over your [pc.thighs].");
	output("\n\n<i>“F-f-fuck!”</i> the drugged-up deer-woman barks as her hips violently thrust, dragging her legs back and forth across your lap on a curtain of her own pussyjuice. Her hand dips down to press the growing bulge of flesh above her vulva, but it’s too slow. That reddened knot ripples with each abrupt pump of her waist, ballooning and twitching, elongating. Bright new flesh sprouts out of her like a time-lapse holo of a tree sapling played in fast-forward. Veins appear and flare, pulsating, feeding more blood into Krissy’s phallic growth, delivering the nutrients it needs to ripen into a true reproductive organ.");
	output("\n\nAt last, her hand finds the twitching pillar, all of ten inches long and quivering with potential. That single touch is too much for the cervine slut. She whimpers, voice filled with delirious ache, and droops into the nape of your neck, breathing heavily, mouthing half-formed words of pleasure while her palm sets to stroking. A slight crease appears behind the tip, then everything above it inflates. The bulbous crown of a human-like penis appears just in time to present a narrow slit with a single droplet of pre-cum.");
	output("\n\nYou lick your lips, knowing that this firming rod is going to slide inside you before long, wondering how big it will get. You stroke the deer-girl’s hair comfortingly, your other hand firm on her ass.");
	output("\n\nKrissy snaps back to sudden awareness, hand pumping madly. Globules of pre-cum fling from the developing tool as it adds an inch to its length. She kisses you suddenly, breaking away just as fast. <i>“This is a dick.”</i> She jacks herself with firm, fast strokes. Her cock is soaked, and her cunt drips like a sieve. <i>“This is <b>my</b> dick.”</i> She kisses you again, too impassioned for technique. It’s artless and thrusting. Her tongue burrows deep, leaving you nearly as breathless as she when you’re given the opportunity to inhale once more. <i>“Gonna fuck you with my dick.”</i> Sixteen inches of pulsating, expanding reindeer meat slaps against your [pc.belly]. <i>“Gonna fuck you raw.”</i> She growls, pushing you back in the seat.");
	processTime(20);
	CodexManager.unlockEntry("Throbb");
	clearMenu();
	addButton(0,"Next",getDickedByKrissy2);
}

public function getDickedByKrissy2():void
{
	clearOutput();
	showKrissy(true);
	author("Fenoxo");
	showBust("KRISSY_NUDE_THROBB");
	//Clothed
	if(!pc.isCrotchExposed()) output("Squirming out of your [pc.crotchCovers] with a doped-up reindeer-girl practically dry-humping you is no easy feat. You push and shove, muscles flexing against sweat and fur. Krissy is voracious. She stays close, like she can’t bear to be more than an inch away from you at a time. The whole time, her cock is still growing, transforming from a porno-worthy prong to a into a true cunt-stuffer. Thick pre-cum soaks your clothing, nearly off-white with the cum she can’t help but dribble into it, and it’s that added slickless that lets you bare your [pc.vaginas] at last" + (pc.balls > 0 ? " - after lifting your [pc.balls]":"") + ".");
	//Unclothed
	else 
	{
		output("Handling a doped-up reindeer-girl is no easy feat. No matter how you squirm or shove, you slip against sweat and fur. She stays close, like she can’t bear to be more than an inch away from you at a time. The whole time, her cock is still growing, transforming from a porno-worthy prong to a into a true cunt-stuffer. Thick pre-cum soaks bared loins, tinted off white by sheer amount of sperm she’s producing. You silently commend yourself for the decision to keep yourself bare and unrestricted.");
		if(pc.balls > 0) output(" A simple tug on your [pc.sack] and y");
		else output(" Y");
		output("our [pc.vaginas] " + (pc.totalVaginas() == 1 ? "is":"are") + " ready to be taken.");
	}
	//Merge
	output("\n\nDoe she may be, but Krissy has the look of a predator in this moment. Her brow is firmly set, determined. Her nostrils flare that adorable button nose with desire. She has you pinned to your captain’s chair, the symbol of your authority turned to a prison. The weight of her newborn cock presses down as if to say, <i>“Don’t bother trying to get up. I’ll just fuck you right onto your back again,”</i> and you believe it. When the dick-toting deer finds the control to recline it back the rest of the way, you give your [pc.hips] an impish wiggle and arch your back to better display your [pc.chest] - anything to encourage her to take you.");
	output("\n\nKrissy licks her lips and smiles, shuddering as she lines the swollen tip of her prick up to your sopping nethers");
	if(pc.totalClits() / pc.totalVaginas() > 1) output(", sliding it past your " + (pc.totalClits() >= 6 ? "forest of ":"") + "[pc.clits], grinding sensitized flesh against sensitized flesh");
	output(". She’s as hard as a boulder. Your feminine folds have no choice but to give way for her insistent push. That dick, huge and awkward as a thraggen’s club, has you completely at its mercy. " + (pc.vaginalCapacity(0) >= 500 ? "Lucky for you, you’re ready to handle such beasts. You spread yourself wide and sigh in delight, drinking in that throbbing behemoth like you were made to take it. You need do nothing but lie there and experience Krissy in all her girthy majesty.":"You’re in no position to protest as it spreads you, inexorably burrowing deeper, forcing your channel to widen into an inverted mold of its shape. You feel like a toy, like a sheath for Krissy’s girthy majesty, unable to do anything but experience the pleasure of taking her to the hilt."));
	pc.cuntChange(0,500);
	output("\n\nA churning, bubbling sound from somewhere below warns you that something is pushing through a wet channel - not your [pc.vaginaNoun], either. It’s further back. You can’t look, not with Krissy smashing her lips against yours, kissing you, assailing you with the kind of slobbering desire you’d expect from a male in rut. Wondering at the source is the most you can manage.");
	output("\n\nThe feeling of two heavy balls clapping into the underside of your [pc.vaginas] explains it all. Krissy’s not just a dick-girl: she’s a full hermaphrodite, balls and all - and those spunk-fattened sacks are heavy. You can feel them churn against your heated nethers, roiling with the boiling need of an overfull load. They slip and slide as their owner squirms and shifts, teasing the recesses between your [pc.thighs] with the promise of the load to come.");
	output("\n\nYou whimper in painful emptiness when Krissy draws back. Without the deer-girl’s turgid mast spreading your hips from the inside, you feel hollow. The pleasures of your walls coming into contact with one another seem gray and dull in comparison to the delight of tightening down on a rigid, virile shaft. Without the heat of big, sticky deerballs against your taint, you’re almost... lonely.");
	output("\n\nKrissy sees that your anguish is short-lived. She fills you again... and again... and again. Her cock splits your pussy with feral intensity, dribbling rivers of pre-cum in its path so that the next thrust can be even wetter - even easier. Those nuts - those glorious nuts - slap deliciously against your ");
	if(pc.totalClits()/pc.totalVaginas() > 1) output("other clit" + (pc.vaginas[0].clits > 2 ? "s":""));
	else output("taint");
	output(". When they hit you, pre actually <i>spurts</i> against your cervix. You can feel spatters of it glossing your secret gates. Before long, every thrust is accompanied by a backwash of gooey pre.");
	output("\n\nThe she-buck’s cock is simply too virile for one pussy to contain");
	if(pc.totalVaginas() > 1) output(" - she shifts to the next" + (pc.totalVaginas() > 2 ? " and the next":"") + ", sampling your holes in turn");
	output(". The endless sexual effluvia soaks into the cushions of your chair to become a fragrant reminder of the hitch-hiker who paid you back in <b>full</b>.");
	if(pc.totalVaginas() > 1)
	{
		for(var x:int = 1; x < pc.totalVaginas(); x++) { pc.cuntChange(x,500); }
	}
	output("\n\nYour climax is as sudden as it is useless. It just happens, and there’s nothing you can do about it. You writhe");
	if(pc.isSquirter()) output(", fountaining splashes of [pc.girlCumNoun] over Krissy’s thighs");
	else if(pc.wettestVaginalWetness() >= 2) output(", dribbling [pc.girlCumNoun] everywhere");
	else output(", so wet that dribbles slide down your [pc.thighs]");
	output(". Muscle control is a thing of the past. You’re a twitching, fluttering thing, too easily pleasured to properly fuck back. It’s up to Krissy to keep using you, a thought that your spasming cunt fixes firmly in your mind. She can fuck you as much as she wants as long as she keeps you feeling like this. It doesn’t matter where or how: over a crate in the cargohold, on the boarding ramp, in the bathroom - wherever.");
	output("\n\nYour pussy is hers.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",moreGetFuckedByKrissy);
}
public function moreGetFuckedByKrissy():void
{
	clearOutput();
	showKrissy(true);
	author("Fenoxo");
	showBust("KRISSY_NUDE_THROBB");
	pc.orgasm();
	pc.orgasm();
	output("Three explosive climaxes later, Krissy finally joins you in orgasm. She doesn’t scream or moan as one might expect. No, she just keeps kissing, sucking on your [pc.lip] while her hips saw in and out with mechanical precision, but she cums all the same. You feel her balls, swollen and so much heavier than they were at first, clench and contract. A split-second later the enormous, urethra-straining bulge stretches you wider and delivers its creamy payload to your deepest recesses.");
	output("\n\nYour belly flutters from pleasure and warmth. You feel gooey and ecstatic, wetter by the moment. Cum backwashes out over your sloppy, engorged cuntlips while your middle plumps, inflating with the rest of the deer’s gushing, liquid weight. The moment seems like it could stretch into infinity, nothing but one long pulse of pleasure and fullness and starbursting blossoms of bubbling sex-heat.");
	if(pc.isPregnant(0)) output(" If you weren’t already pregnant, you probably would be by now.");
	output(" You’re gooey and dopey, the big fat grin on your lips ruining Krissy’s kiss.");
	if(pc.hasCuntTail()) 
	{
		output(" The tip" + (pc.tailCount > 1 ? "s":"") + " of your [pc.cuntTails] " + (pc.tailCount == 1 ? "is":"are") + " bent double to collect the drippings, radiating " + (pc.tailCount == 1 ? "its":"their") + " own alien satisfaction below the tide of creampied delight.");
		feedCuntSnake(pc);
	}
	output("\n\nThis time the slow removal of doe-dick doesn’t leave you aching. You don’t have room to ache. Fresh gouts of semen fill every vacated inch as it withdraws. There’s an enormous cock-worth of cum crammed inside of you, keeping your insides content with their obscene fullness. Krissy’s hand clamps down over the gaped hole once she pops out, clutching a pair of musky panties, and you whimper thankfully when she pushes them inside - a cloth plug for your quim-turned-cum-bucket.");
	output("\n\n<i>“Fuck, I’m still horny.”</i>");
	output("\n\nWhen did Krissy stand up? You blink blearily and look up at the deer-girl. She’s pumping a veiny 22-incher with lovely alabaster coating as she looks at you.");
	output("\n\n<i>“Can I fuck your mouth?”</i> The question is a little nervous, like she’s not sure if she’s asking too much of you. You note that her cock throbs mightily at the question. A string of white pumps out of the swollen crown to splatter on the deck. <i>“You have such a sexy face...”</i>");
	output("\n\nFeeling too well and truly fucked to talk back, you answer by opening wide and rolling out your tongue" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " all the way down to your [pc.chest]":"") + ".");
	processTime(90);
	pc.orgasm();
	var krissyPreggoStuff:PregnancyPlaceholder = new PregnancyPlaceholder();
	krissyPreggoStuff.createPerk("Fixed CumQ", 25000, 0, 0, 0);
	pc.loadInCunt(krissyPreggoStuff,0);
	clearMenu();
	addButton(0,"Next",moreGetFuckedByKrissy2);
}
public function moreGetFuckedByKrissy2():void
{
	clearOutput();
	showKrissy(true);
	author("Fenoxo");
	showBust("KRISSY_NUDE_THROBB");
	output("Krissy claims your mouth in much the same manner as your [pc.vaginas]: passionately and insistently. " + (!pc.canDeepthroat() ? "Your gag reflex is little more than a plaything for her to overcome with repeated pressure, bowing and then breaking completely. Her balls clapping against your chin is an eye-watering victory. The tasty scent of her intensely virile musk floods your nose while you struggle to keep her down with repeated, cock-pleasing gulps.":"How fortunate that you have no problem taking every inch she has to offer! On a curtain of slick saliva and fountaining cock-drool, Krissy’s dick slides down your throat like it’s just another pussy for her to claim. When her delightfully musky crotch presses against your nose, your eyes roll back in delight. When her balls pulse on your chin, you cry tears of slutty joy, proud to service such a perfect example of sensuous vascularity."));
	output("\n\nLoud gurgles inside you announce when she cums for the second time, bloating you with more of her fecund heat and moisture. Your tongue bows beneath the size of her ballooning urethra with each pulse, slurping messily back into place once it passes. And through it all, Krissy’s hands are on your head, holding for " + (silly ? "deer":"dear") + " life as she pumps in and out, six inches at a time, never drawing back far enough to give you a real taste.");
	output("\n\nYou’re uncomfortably full and even more bloated by the time she deigns to pull out. Half-hearted lances of creamy deer-goo spatter your forehead and face" + (pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? ", clinging to your muzzle in thick webs":"") + ", each as big as a normal man’s entire cumshot. She smears it around, messy and leaking, painting you with the last dribbles of her load. Only after all that does she return her tip, still hard and juicy, to your mouth, so you can suck the last, cooling droplets straight from the source.");
	output("\n\n<i>“Fuck you look good like that,”</i> Krissy coos. She climbs back on top of you, slapping her cock " + (pc.biggestTitSize() >= 3 ? "into":"onto") + " your [pc.chest]. <i>“Maybe I should’ve wrapped this present.”</i> She thumbs one of your nipples before leaning down to give you a kiss through your mouthful of cum. <i>“But I always did like to ice a set of sugar cookies.”</i> Giggling to herself, Krissy squeezes a few flecks of cum onto your tits to complete the image.");
	var krissyPreggoStuff:PregnancyPlaceholder = new PregnancyPlaceholder();
	krissyPreggoStuff.createPerk("Fixed CumQ", 25000, 0, 0, 0);
	processTime(25);
	pc.applyCumSoaked();
	pc.loadInMouth(krissyPreggoStuff);
	addButton(0,"Next",moreGetFuckedByKrissy3);
}
public function moreGetFuckedByKrissy3():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	showBust("KRISSY_NUDE_THROBB");
	output("By the time you into get shower together, clean up (most of) the mess, and finish wringing another two loads out of Krissy’s new cock, you’ve arrived at Vesperia, your navigational computer already beginning the automated landing sequence. You slide into the sticky seat to manually complete the task while Krissy jerks off behind you, slowly filling a condom.");
	output("\n\n<i>“Ah! I’m uh... oh god my roommate is going to be sooo surprised.”</i> She whimpers when you stand up, shooting a thick wad into the thickening balloon at the sight of you. <i>“Mmm, might have to fuck her before I try to get back to work on my dissertation.”</i> She licks her lips. <i>“Might have to buy some toys... and more condoms too.”</i> The deer-girl kisses you once more, slipping a note with her contact information into your hand. <i>“Maybe we’ll get a chance to bump into each other again sometime, though I’ll probably have to get rid of this thing before long. So I can focus.”</i>");
	output("\n\nThe condom is looking <i>very</i> heavy.");
	output("\n\n<i>“But that just means I can grow another one for you if you want, right? Let you take my virginity all over again?”</i> Krissy’s knees wobble when she tries to stride to the boarding ramp. <i>“You’d like that I bet, knowing that you got your cunt all over my pole before any other slut. Knowing I’ll be thinking about fucking you every time I jack off.”</i> She shudders a second before the straining condom gives out. It tumbles end over end, rolling down the ramp and leaking a trail of white goo behind it. The she-buck flushes hotly, opening up a new one immediately. <i>“Sorry about that.”</i>");
	output("\n\nYou tell her not to worry about it, an act that gets you a warm hug from the red-wrapped reindeer. She kisses you on the nose again for good measure, then slowly - very slowly - lets you go. The balloon hanging off her dick is already the size of a golf ball.");
	output("\n\nYou’re left alone with the lingering scent and taste of cum - and a cool new hat.");
	processTime(65);
	pc.shower();
	output("\n\n");
	shipLocation = "CANADA1";
	currentLocation = "CANADA1";
	flags["KRISSY_INTRO_RESULT"] = 1;
	quickLoot(new SantaHat());
}	

//Does Gush and lets you nurse while giving out an HJ/fingerbang
public function gushyGushSantaShit():void
{
	clearOutput();
	showKrissy(true);
	author("Fenoxo");
	showBust("KRISSY_NUDE_GUSH");
	output("You hook a finger into the top of her dress and give it a meaningful tug - not hard enough to unwrap her handfuls of holiday joy but certainly enough to communicate exactly which of her presents you’d like to spend the evening unwrapping.");
	output("\n\n<i>“Mmmm, you like those, huh?”</i> Krissy grabs the back of your head and pulls it deep into her the swells of her cushiony mounds, forcing you try to breathe through the lightly perfumed valley of her cleavage. Every inhalation is tinged with faint hints of cherry and her own natural scent: clean yet so clearly inhuman. She doesn’t need to hold you there, not when this is exactly what you wanted. You set to kissing and licking around in a gentle exploration of Krissy’s shapely anatomy. You’re in no hurry. Everything you need is right in front of you.");
	output("\n\n<i>“Mmm, yeah. Look at you go, " + pc.mf("big boy","gorgeous") + ".”</i> There is a gasp, then a throaty giggle. <i>“Wow. You’re really going to like this then.”</i> Krissy leans back to leave you flush-faced and panting, her breasts just out of reach. In one hand, she has a Gush spraypen already uncapped and ready to go. <i>“Let me get the girls ready for you, hrmm?”</i> She mists the tops of her tits once, then a second time, then douses a long, slow spray into the space your face just vacated.");
	output("\n\nYou’re no expert, but you’re pretty sure Gush usually comes in single spray formulations. Where did she get this stuff?");
	output("\n\nKrissy tosses the spent spraypen over her shoulder and turns back to you with a smile, all evidence of gush rapidly absorbing into her skin. She slips her tongue halfway over her lower lip, then giggles, <i>“Alllll freshened up for you.”</i> The deer-girl suddenly wobbles, catching herself on your [pc.hip] before clutching herself closer. <i>“Oh wow.”</i> She stares down at her tits, then up at you, then back at her tits. <i>“I uh... wow. Boobs. I umm... did they always look this good?”</i> Raking a hand " + (!pc.hasHair() ? "across the back of your head":"through your [pc.hair]") + ", she admits, <i>“No wonder you want these so bad.”</i>");
	output("\n\nThe furry lining at the top of the cervine’s dress inches downward, exposing the dark chocolate skin of her upper areolae. There it pauses for a moment before sliding a little further down, hooked on the edges of two increasingly prominent nipples. They jut forward obscenely, producing twin distentions through the festive white fuzz. Krissy drunkenly watches, one hand slowly rising upward. <i>“It’s... warm.”</i> She touches the side of one breast, creating one jiggle too many for her stressed dress to handle. The fabric snaps off her nipples and cascades down to her hips, completely exposing a pair of pair of slowly growing tits.");
	output("\n\nKrissy’s nipples visibly pulsate, thickening by the second. A bead of milk appears on the left one. <i>“Tight. So... amazing.”</i> Grabbing her other tit, she gives it a gentle squeeze, causing a half-dozen creamy white droplets to spill out in response. <i>“Like, wow.”</i> She looks back up at you as if seeing you for the first time and asks, <i>“Why aren’t you sucking these tits?”</i>");
	output("\n\n");
	if(pc.isBro() && pc.isTreated()) output("It’s a good question. You <i>should</i> be sucking those tits. Healthy boobs ought to be in your mouth right now. This girl really ought to try the Treatment herself. She’d make a helluva cow-girl.");
	else if(pc.isBimbo()) output("That’s a super good question! Why are you just sitting there when you could be <i>sucking</i> or <i>fucking</i> or <i>licking</i> or <i>kissing</i>? You’re so scatterbrained sometimes!");
	else output("You briefly consider trying to answer - or asking questions about her choice of drugs - or attempting anything a logical person would do instead of sucking on some tits, but the sensual appeal of latching onto the eager deer-slut’s boob for a mid-flight snack overwhelms all other options.");
	output(" You smile at Krissy and pull her closer, opening your mouth to make way for a swelling nipple that is now properly described as a <i>teat</i>.");
	output("\n\nCreamy warmth assails your [pc.tongue]. No wonder they call it ‘Gush’. Krissy’s smooth nipple spills a river of delicious milk into your mouth before you can even begin to suck. Contact with your lips was enough to set her body off. And when you actually apply some suction, the deer-woman’s nipple <i>swells</i>, noticeably plumping before unleashing a cheek-filling deluge of ambrosial lactation. You can barely swallow fast enough. It’s easiest to focus entirely on keeping up with the milkflow, your eyes drifting closed to focus.");
	output("\n\nThe Gush-dosed reindeer moans in delight, head lolling back as she struggles to cope with the chemically enhanced sensations pouring out of her breasts. Meanwhile, milk freely leaks from her other nipple, streaming down Krissy’s exposed middle to pool in the bunched fabric at her waist. She seems unaware of it at first, entirely focused on experiencing the sensuous joy of lactating so powerfully, but her free hand creeps back up to the untended breast, black-nailed fingertips blindly groping for the pleasure-buzzer at the center of it all.");
	output("\n\n<i>“H-holy shit these tits,”</i> Krissy finally manages midway through a fervent, milk-spraying tug. Rolling her head back up, she stares down in absolute awe. Her breasts are still growing. You can feel the increasing heft of her tit as it pushes back against you, expanding in spite of the endless swallows of milk you harvest, growing not just in size but in milkiness. Krissy squeezes her other tit, and it sloshes. Milk sprays everywhere. Some of it spatters your [pc.chest] and [pc.belly]. The next spray soaks your crotch. The deer-girl, bless her, actually seems to notice this. <i>“Oh... I got you so wet... but don’t stop sucking. Please don’t stop sucking.”</i>");
	output("\n\nYou don’t protest when you’re shifted to the other nipple, nor when a hand");
	//Dix
	if(pc.hasCock()) 
	{
		output(" casually ");
		if(!pc.isCrotchExposed()) output("frees your [pc.cocks] from the bondage of being clothed and decides to linger");
		else output("takes hold of [pc.oneCock], lingering");
		output(" on the taut flesh, smearing the milk over " + (pc.totalCocks() == 1 ? "it":"one") + " until you feel as glossy and slick as the nipple upon which you now suckle.");
	}
	//Puss
	else
	{
		if(pc.isCrotchExposed()) output(" reaches down to your [pc.vaginas], dripping more milk over " + (!pc.hasVaginas() ? "it":"them") + " in the process.");
		else output(" exposes your [pc.vaginas] to open air, dripping milk all over " + (!pc.hasVaginas() ? "it":"them") + " in the process.");
		output(" The fingers decide to linger and stroke, smearing the cream over and into your folds until you’re as slick as you can possibly imagine. Their intrusion a second later is automatic... almost compulsory.");
	}
	//merge
	output("\n\nKrissy strokes back and forth to the rhythm of your suckles, but her attention is clearly much higher. She stares vacantly at her swelling, roiling bust like a star-lost trader venturing into a brothel for the first time in months. The increasingly buxom slut slowly slurs, <i>“They’re sooo big... beautiful.”</i> " + (pc.hasCock() ? "Stroking and pumping":"Fingering and grinding") + ", the deer-girl remains enchanted by her own cleavage. <i>“Jiggling... and warm... and milky.”</i> A groan that sounds halfway to a moo slips her lips. <i>“Keep sucking, [pc.name]. It feels... so fucking good. Better than any present.”</i> She gasps, flooding your mouth. <i>“Better than sex!”</i>");
	output("\n\nYou squirm. You’re beginning to feel full, but the fingers in your crotch coax you to keep sucking. Nostrils flaring, you drink deep and receive firmer strokes for your trouble. It feels incredible to have your milk-soaked loins so brazenly toyed with. Every now and then, fresh splashes cascade onto your sensitized flesh. Sometimes Krissy apologizes for it. Other times she’s too lost in her own hypnotic tits to care, fixated on the sight of your suckling lips, the dribbles of white that slide out of your overfull mouth the collect on your chin.");
	output("\n\n<i>“Best Christmas ever!”</i> Krissy abruptly screams, moment before she begins to shudder in orgasm, drooling slick wetness into the puddle of milk that’s already formed in your lap. She whimpers, tits bouncing and jostling, squirting everywhere. The nipple slides out of your mouth, but her hand remains firm on your " + (pc.hasCock() ? "[pc.cock]":"[pc.vagina]") + ". She works your crotch madly, lowing in orgasm, her drug-enhanced tits swell forward one last time, swallowing you into her cleavage.");
	output("\n\nWithin that pillowy soft valley, drowning in the scent of milk and cherries, you climax.");
	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		output(" [pc.Cum] ");
		if(cumQ < 10) output("dribbles all over Krissy’s fingers");
		else if(cumQ < 50) output("shoots up to splatter back down on Krissy’s fingers");
		else if(cumQ < 5000) output("erupts in thick, wet blasts, slapping into the underside of Krissy’s tits to hang in gooey webs.");
		else output("sprays out in torrential deluges, each thicker than last, drenching Krissy’s tits in the virile tidal waves that your body calls release.");
	}
	else 
	{
		if(!pc.isSquirter()) output(" [pc.GirlCum] dribbles all over Krissy’s squirming fingers.");
		else output(" [pc.GirlCum] sprays out around Krissy’s fingers and ruins the parts of her dress not already drenched in cervine cream.");
	}
	output(" You can’t see it happening. You can only feel - can only revel in feeling the deer-woman’s heartbeat through her enormous rack while she rewards you a toe-curling climax for your trouble. With your other senses robbed by Krissy’s glorious tits, every sensuous touch and clench and dribble feels one thousand times more acute.");
	output("\n\nYou black out for a moment.");
	processTime(40);
	CodexManager.unlockEntry("Gush");
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createPerk("Fixed MilkQ", 20000, 0, 0, 0);
	pc.milkInMouth(pp);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",takeKrissysMouthfulOfMilkYerDone);
}

public function takeKrissysMouthfulOfMilkYerDone():void
{
	clearOutput();
	showKrissy(true);
	author("Fenoxo");
	showBust("KRISSY_NUDE_GUSH");
	output("You come to with your chair on full recline. Krissy’s nipple is back in your mouth, drooling slowly. You realize you’ve been swallowing automatically, your belly full to bursting. Each of her breasts is easily bigger than her head. They’re weighty, obscene things that would look more at home in porno than in real life. Nevertheless, the Christmasy tart has fallen asleep in your lap. Her head nestles into your shoulder as she softly snores.");
	output("\n\nYou close your eyes, take another swallow, and join her.");
	processTime(60);
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createPerk("Fixed MilkQ", 5000, 0, 0, 0);
	pc.milkInMouth(pp);
	clearMenu();
	addButton(0,"Next",takeKrissysMouthfulOfMilkYerDone2);
}

public function takeKrissysMouthfulOfMilkYerDone2():void
{
	clearOutput();
	showKrissy();
	author("Fenoxo");
	showBust("KRISSY_NUDE_GUSH");
	output("When you wake, Krissy is nowhere to be seen, but the landing assist is already pinging and engaged, guiding you into Canadia Station. You flick it over to manual and handle the landing yourself, then set off to find the big boobed deer.");
	output("\n\nThe Santa hat she put on your head so long ago bobs merrily behind you.");
	output("\n\nKrissy isn’t in the mess, or the hold, or getting into mischief in the engine room. Nor is she in your bed, or messing with an airlock. No, it turns out she made use of your shower... and comes out of it absolutely stacked, the shimmery fabric of her dress strained to near breaking. Twin bumps damn near the size of ping pong balls mark the exact positions of her nipples as she jumps in surprise.");
	output("\n\n<i>“Oh, [pc.name]!”</i> The Gushed-up girl wraps her arms underneath her milk-swollen bust for support, but two big wet patches appear all the same. <i>“Thanks for the lift... and the fun.”</i> She prances forward to plant a big wet kiss on your lips, her tail swishing happily. <i>“I’m so glad I was with you when I did that stuff. It would’ve been awful to try and keep up with all that milk by myself... but I should still like, probably get going. My roommate’s got to be crazy worried about me by now, and I have so much shopping to do if I’m going to be presentable for my dissertation next week.”</i>");
	output("\n\nYou’re given a big, squeezing goodbye hug and a slip with her contact information on it. <i>“Maybe we can meet up again sometime.”</i>");
	output("\n\nWith that, Krissy waltzes out of your ship... and leaves you with two sopping wet patches on your ");
	if(!pc.isChestExposed()) output("[pc.chestCover]");
	else output("chest");
	output(".");
	processTime(4*60);
	shipLocation = "CANADA1";
	currentLocation = "CANADA1";
	flags["KRISSY_INTRO_RESULT"] = 2;
	output("\n\n");
	quickLoot(new SantaHat());
}

//Wrap her up like a present and give her a gift of your own
//Requires a cock that fits OR a hardlight strapon
public function krissyWrapUpByThird(x:int):void
{
	clearOutput();
	showKrissy(true);
	author("Thirdgames");
	output("You look the deer-woman over with an appraising eye, appreciating the curve of her figure and the flattering, if rather skimpy, dress. Licking your lips at the possibilities you say, <i>“Party favors, huh? Anything in there for wrapping up delectable little presents such as yourself?”</i>");
	output("\n\nA quick smile flashes over Krissy’s face as she bounces back onto her hooves, a movement that causes her breasts to jiggle so much they threaten to spill out at any moment. Sadly, they remain covered... at least for the time being. It takes the deer-girl only a moment to produce a spool of festive red silk ribbon, which she casually tosses in your direction. You barely catch it out of the air and she giggles, <i>“So how do you want me, " + pc.mf("handsome","gorgeous") + "?”</i>");
	output("\n\n<i>“First,”</i> you respond, unspooling the ribbon, which feels both luxuriously smooth and incredibly tough in your hands, <i>“hands out.”</i> Krissy happily holds out both hands, her arms pressing her massive breasts together in a way that creates a beautiful valley of fur-lined cleavage. Feeling ");
	if(pc.hasCock()) output("your prick" + (pc.hasCocks() ? "s":"") + " beginning to stiffen");
	else output("the growing warmth in your loins");
	output(" you take the ribbon, wrap it several times around the deer-girl’s wrists, and complete it with a nice little bow.");
	output("\n\nKrissy half-heartedly struggles against the bindings, and to your surprise the ribbon lights up, like a series of Christmas lights were embedded into the fabric. The spool of extra fabric grows warm in your hand, and any part of your skin in contact with it seems to tingle. To you, it’s a minor curiosity, to your doe lover, however, it seems to be much more. Krissy’s eyes immediately widen, and a low, throaty moan escapes her lips before she silences herself with an equally seductive lip bite. When the deer-girl ceases her struggling, both the tingling sensation and the colored lights begin to fade. Interesting.");
	output("\n\n<i>“Wow,”</i> your buxom little captive says breathlessly. She looks at you doe-eyed, though you definitely catch a mischievous glint. <i>“Didn’t know they did </i>that<i>. Not that I’m complaining, mind you. Maybe you should finish what you started?”</i>");
	output("\n\nWell, you certainly don’t need any more convincing. Stepping closer to the deer-woman, you take hold of her festive dress and gently pull it down, slowly revealing a pair of dark brown teats. Her nipples jut out like small chocolate candies, just begging to be kissed, and who are you to deny fate? You lean in and take one into your mouth, ravishing the little morsel like you caught it beneath the mistletoe, and just to be fair you do the same to the other. Can’t have one going around feeling like it’s superior. Both nipples are a certified work of art.");
	output("\n\nYou tug the dress a bit further and let it hit the ground, exposing the fact that she’s not wearing anything to protect her dark brown muff, which is already moist and glistening with <i>“holiday spirit.”</i> This time, however, you decide to pay it no mind. You’ll get there in due time. For now, you circle around Krissy and tenderly coax her onto your chair. She sits, a bit perplexed, but grinning nevertheless." + (silly ? " <i>“Look at me,”</i> she giggles, <i>“I am the captain now.”</i>":""));
	output("\n\nThinking quick on the best way to restrain your cervine slut, you slip the ribbon between her legs and get to work... In short order you have her completely trussed up in the festive holiday ribbon. Her legs are bent and tied in such a way that they’re forced to spread, leaving her lascivious chocolate slit open and vulnerable. She looks rather like a Christmas turkey. One just waiting to be stuffed.");
	output("\n\nDiscarding the remainder of the ribbon, you ");
	if(x >= 0) { if(!pc.isCrotchExposed()) output("disrobe and "); }
	else output((!pc.isCrotchExposedByArmor() ? "disrobe down to your underwear and ":"") + "promptly activate the <i>hardlight</i> option and ");
	output("stand between her legs, stroking your [pc.cockOrStrapon " + x + "]. <i>“");
	if(pc.isBimbo()) output("Like, before I unwrap you, I totally wanna give you a gift first. It’s totally my dick in your box!");
	else output("Before I unwrap my present I should give you one of your own. I didn’t have time to wrap it, but oh look, here’s a box I can use,");
	output("”</i> you " + (pc.isBimbo() ? "giggle":"laugh") + ", pressing the head of your cock against Krissy’s cocoa folds. Her slit is hot and moist with anticipation, which easily lubes up the tip of your [pc.cockOrStrapon " + x + "].");
	output("\n\n<i>“Oh yeah?”</i> she says, wiggling her body enticingly. The movement triggers the ribbon, which lights up with colorful merriment, no doubt sending pleasurable shocks throughout the doe’s body. Krissy moans in response, her eyes rolling back in her head while she sinks further into the seat, and coincidentally right down onto the tip of your dick. Her hot folds envelop you, only serving to make her moan louder.");
	output("\n\nThere’s no beating around the bush now, so instead you go all in... literally. Taking hold of both her trussed up legs, you slide your [pc.cockOrStrapon " + x + "] as deep as it’ll go, her sizzling sweet snatch pulsing and throbbing in all sorts of delightful ways.");
	if(x >= 0) pc.cockChange();
	output("\n\n<i>“Fuck me that’s good,”</i> she says breathlessly, trying to keep as still as possible, lest she activate the ribbon again.");
	output("\n\nGrinding your hips into hers you respond, <i>“That’s the plan, babe.”</i>");
	output("\n\nHer warm, slick tunnel grips your " + (x < 0 ? "faux-":"") + "cock tightly, like a child unwilling to relinquish their favorite toy, as you slowly pull out, your thick rod glistening with pussy juices. Without missing a beat, you thrust back in, enjoying the sight of Krissy struggle to keep still and failing miserably. The ribbon lights back up, sending waves of pleasure through her... and you apparently. As her needy cunt contracts around you, you receive a sudden shock of bliss, no doubt a watered down version of what she’s experiencing.");
	output("\n\nWith that in mind, you redouble your efforts to make her squirm as much as possible. Changing your stance, you angle your dick to thrust upwards, slamming into the deer-woman’s g-spot with reckless abandon. She twists in place and lets out a little cry. The ribbons activate again, blasting Krissy’s body with near-orgasm inducing pleasure, which ebbs right into your [pc.cockOrStrapon " + x + "] in such a way your entire body shudders.");
	output("\n\nYou pick up the pace of your thrusts, hammering the doe-slut’s drenched pussy, never allowing her a moment of respite, though she doesn’t seem to care. The more she struggles, the more intense the pulsing from the ribbon becomes. The sounds coming from her throat are barely intelligible beyond the occasional <i>“More!”</i> <i>“God!”</i> and <i>“Fuck!”</i>");
	output("\n\nKrissy’s entire body shudders suddenly, and her vaginal walls tighten, nearly locking you in place as an orgasm rocks her body. Unfortunately, this causes some kind of feedback effect with the ribbon, which seems to constrict before your eyes. The cheery lights grow brighter, and a soft Christmas jingle reverberates around the cabin. The more she shudders, the more pleasure the ribbons give, which seems to send her over the edge into a second orgasm, and then a third.");
	output("\n\nYou steel yourself against the constant onslaught of electric, pulsing pleasure and continue your trip to pound town, with your " + (pc.balls > 1 ? "balls slapping against the deer-girl’s ass":"hips grinding into the deer-girl’s cunt") + " with every thrust. With the Christmas music softly jingling through the room, you find a nice rhythm, battering her honeypot with every jingle, and pulling out in preparation for another thrust with every jangle.");
	output("\n\nThe orgasm-wracked deer-girl convulses as she comes again and again, each time nearly sending you to the brink with her, until you can’t help but finally succumb. When she twists around in the seat, twisting the tip of your dick like a corkscrew, you give one last thrust. Your whole body tightens up, your dick stiffening and ");
	var cumQ:Number = 0;
	if(x >= 0) 
	{
		cumQ = pc.cumQ();
		output("abruptly unleashing jet after jet of [pc.cum] directly into Krissy’s waiting womb");
		if(cumQ >= 10000) output(", causing her stomach to bulge lewdly outward due to the volume, jostling to and fro like a bowl full of jelly");
		if(cumQ >= 1000) output(", causing her stomach to distend slightly due to the sheer volume");
		output(".");
	}
	else output("sending a powerful pulse of orgasmic energy into you.");
	output("\n\nKrissy shakes with yet another orgasm as <i>“Knotty or Nice”</i>, an Ausari Christmas classic, begins to play. You stumble back a step, admiring your handiwork as ");
	if(x >= 0)
	{
		if(cumQ < 1000) output("your [pc.cum] dribbles out of her gaping slit");
		else if(cumQ < 10000) output("your [pc.cum] runs out of her like a small waterfall, dribbling down onto the seat and floor beneath her");
		else output("your [pc.cum] periodically jets out of her abused, gaping slit, as though another cock were nestled inside and cumming endlessly. It drips down onto the chair and absolutely drenches the floor beneath her");
	}
	else output("her drooling cunt winks lewdly at you, with droplets of femcum dripping onto the chair and floor below");
	output(".");
	output("\n\nThings don’t seem to be over for her, however, as the ribbons seem to be sending her body into overdrive. Her eyes have rolled so far back you can only see white, her tongue is lolling out, and a trail of spit and drool leads from her chin down onto her bountiful breasts. It’s nice to just watch her for a minute as the ribbons send her into climax after climax, but eventually you find a pair of scissors and cut her free from the devious device. She breathes a sigh of relief when the holiday music ceases its incessant racket, and the pleasurable shocks come to an end.");
	output("\n\n<i>“Wow, okay,”</i> she gasps out, regaining her composure, <i>“adding that to my list for next year too.”</i> You lift up the exhausted deer-woman and carry her back to your bed, figuring she’s earned a nice nap after all that.");
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",KrissyKringleEpilogueThird,x);
}

public function KrissyKringleEpilogueThird(x:int = 0):void
{
	clearOutput();
	showKrissy(true);
	author("Thirdgames");
	output("When you awake, Krissy is just putting on her dress and getting her things together. Your ship alerts you that you’ve arrived at Canadia Station, so you head into the cockpit, flick the controls onto manual, and land the ship where you’re directed by the station.");
	output("\n\n<i>“Thanks for the lift, [pc.name],”</i> she says, applying a fresh layer of chocolate-colored lipstick and giving you a big wet kiss on the lips. <i>“And everything that followed, of course. I’m glad it was you that picked me up. It certainly made the trip memorable.”</i>");
	output("\n\nHah, you think to yourself, that’s an understatement. The sight of her being brought to one orgasm after another by a measly ribbon is not something you’re going to forget anytime soon.");
	output("\n\n<i>“But I should get going. My roommate is going to be so worried about me. I think I’ll pick her up a roll of that ribbon too, I bet she’d enjoy it as much as I did.”</i> Krissy giggles, seeming to lose herself in the memory before snapping back to reality.");
	output("\n\nShe gives you a big, full body hug and another kiss before passing you a napkin with her contact information on it. <i>“Maybe we can meet up again sometime? Make this a Christmas tradition?”</i>");
	output("\n\nWith that, Krissy struts out of your ship... and you notice " + (x >= 0 ? "two things, first that there’s a small stream of suspiciously cum-colored fluid dripping down her leg, and second, ":"") + "she’s wearing a section of that bondage ribbon around her neck like a lace choker. It’s cute... and oddly the lights are on.");
	flags["KRISSY_INTRO_RESULT"] = 3;
	processTime(4*60);
	shipLocation = "CANADA1";
	currentLocation = "CANADA1";
	output("\n\n");
	quickLoot(new SantaHat());
}