//Yay, written by Adjatha!

//Notes
//Run by Cyber Punks? Some cyber dealie to keep ‘em pacified maybe,
//Nominal credit charge for occupants (maybe one with their price tweaked to ‘free’ for extra degredation) or buy a <i>“Puss Pass”</i> key item to skip the payment prompt.
//holo pics of the occupants on each stall
//If enough stalls are added, put an ‘availability’ time span on them, where somebody else is using the stall. Possibly add opportunities where you can interact with a pirate who is using one of the stalls during this ‘down time’.
//
//Suggestions:
//- rodenian earfucks, has shallow vibe plugs in both ears passively,
//- rahn tit fucks: HUGE milf girl, anti-morph collar, no mouth, huge areola, pussy nips, several time slots where a various pirate is using one tit and the player can take the other (contest to fill asymmetrically, bro-down, ?)
//- kui-tan with huge balls, fuck his ass and plap balls, take him ass to ass and plap balls, visited by slyveren w/ bubble buddy who wants to have the two of you frot into mega bubbles
//- dzaan alpha with hefty, low-hanging balls and ass plug for pussy-only fucks. Has bubble buddy on her ladder-pierced cock and a collection basket under to gather her climaxes (player can collect/buy alpha bubbles to add gain extra strength lust dmg bubble projectile weapons?)
//- Vem easter egg (via Delita on HF), body writing prompt, pregnant w/ pussy plug
//- Laquine, former jumper, punished/kicked out and cum-dumpified
//- Human female with huge horsecock. Has a basket of condoms next to her and a cum-tank w/ tube going into her ass, can rawdog her pussy or use condom and toss it into the tank to help fill up her gut
//- Ovir on the wall with huge pussy lips, fuck her butt and her big gigantic ovir dick pops out of the cloaca and spunks all over you. Fuck her in the cloaca for the ultimate power move

public function showCherry():void
{
	showBust("CHERRY");
	showName("\nCHERRY");
}

//Cherry’s Tap-Hall
public function cherryTapHallBonerBonus():Boolean 
{
	showCherry();
	author("Adjatha");
	//First Time:
	if(flags["MET_CHERRY"] == undefined)
	{
		flags["MET_CHERRY"] = 1;
		output("A huge neon sign announces that you’re entering ‘Cherry’s.’ As you step into the market-style hall, the first thing that hits you in this room is the faint scent of cherry perfume. The second is ");
		if(pc.hasCock())
		{
			if(!pc.isErect()) output("the raging, rock-hard erection that springs up from your loins. It’s like your [pc.cocks] " + (pc.hasCocks() ? "have":"has") + " been kicked into overdrive and the tidal rush of blood leaves you faint-headed.");
			else output("the bass-like vibrations thrumming inside your [pc.chest], stoking the flames of your burning need to breed.");
		}
		else if(pc.hasVagina()) output("the heavy, moist need that thrum inside your loins. Your breath comes in short gasps and your head swims as your [pc.vaginas] drool" + (!pc.hasVaginas() ? "s":"") + " with impatient thirst.");
		else output("a blossoming warmth spreading across your face. It’s as if an insistent heat is being stoked within you, drawing lurid desires by simple proximity.");
		output(" Casting about for the source of this sudden, uncontrollable lust, you spy a battery of hefty, LED-lit machines that vibrate with a low, steady thump that seems to shake the air inside your lungs.");
		output("\n\nNone of the other figures filtering through the corridor seem alarmed by the machines, so you move to investigate just what’s going on for yourself. The dark, textured cylinders look " + (pc.isBimbo() ? "like person-sized, fuzzy dildos":"almost like omni-directional subwoofers") + ". A small pink-on-black placard mounted above them reads: <i>“Aural Stimulation Speakers provided compliments of the Cyber Punks.”</i>");
		output("\n\nThe mystery of your vibration-fed libido may have temporarily distracted you, but once you have a moment to survey the whole room, the purpose of the arousal engines becomes clear. The left wall of the hall is laden with a host of hardlight partitions, dividing the long chamber into a series of shallow compartments. The primary occupants of these stalls are humanoid figures mounted halfway through the wall by cushioned ovals. Some have their lower halves hanging out, bare legs fidgeting in place. Others have been bound the opposite way, their upper halves exposed and defenseless. There seems to be a few who are almost entirely hidden from view, folded in half so that only their ass and abdomen jut out like a pair of ripe hemispheres. Strapped in and utterly at the mercy of whomever might pay them a visit, you’d expect these victims to be struggling for their freedom, but their languid, writhing movements and heated, whimpering moans suggest otherwise.");
		pc.lust(75);
		clearMenu();
		addButton(0,"Next",meetCherriesPart2);
		return true;
	}
	//Repeat:
	else
	{
		output("The cloying scent of Cherry’s bio-chemical perfume wafts around you as the throbbing, subliminal vibrations of the Cyber Punks’ lust generators fill you once more. Your libido kicks into overdrive just by walking the length of the Tap-Hall. The wall of public use sluts is as popular as ever, but there are still plenty of unoccupied stalls.");
		//is lust is not at least 30, set lust to 30
		processTime(75);
		clearMenu();
		addButton(0,"Wall Sluts",pickWallSlut,undefined,"Wall Sluts","Take a gander at the wares on display.");
		return false;
	}
}

public function pickWallSlut():void
{
	clearOutput();
	showCherry();
	author("Fenoxo");
	output("Which wall-slut would you like to use? Or would you rather talk to Cherry?");
	//[Cherry] [Black Dragoness] [Double Booty] [Thick Goblin] [Leave] 
	// After using a wall-slut, deactivate their option for 2 hours (to let the staff clean up)
	pickWallSlutMenu();
}

public function meetCherriesPart2():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("The only figure who doesn’t seem to be examining or using the merchandise is a ruby red zel’rahn who leans against the far wall. Though she’s mostly nude, what draws your attention are the large, cybernetic legs she’s poured herself into. Catching your look, she shifts upright, the servos in her robotic lower half whirring to life as she stomps toward you, her torso wobbling like gelatin on vibrator.");
	output("\n\n<i>“You look new,”</i> she murmurs, eyes dipping to groin level. <i>“Not bad. Right then, the pitch. I’m Cherry and this is my Tap-Hall. You step up to a compartment, pay the price, and debauch.”</i> She gestures expansively, sending her chest jiggling.");
	output("\n\nAs she talks, your nose fills with a fruity perfume that makes your mouth water. Heedless of her effect on you, she pushes on. <i>“Anybody in the wall is fair game, but respect the bio-plugs - some of their owners like keeping certain holes on a VIP basis, yeah? The prices are set by whoever rented the hole in the first place, so don’t come to me for a discount.”</i>");
	output("\n\nShe folds her arms under her chest, sending fresh ripples through all the non-cybernetic bits. <i>“There’s also a Puss Pass for regulars. Everything gravy? Cool, on your way then.”</i> She shoos you toward the booths and goes back to leaning against the wall and watching her customers enjoy themselves.");
	output("\n\nSome of the nooks are currently in use while other, recently used captives still have ivory cream leaking from between their legs. An exceedingly chubby, pink galotian in a white collar oozes happily along, cleaning up after the patrons as best she can. The janitor, apparently.");
	processTime(5);
	clearMenu();
	//[Cherry] [Black Dragoness] [Double Booty] [Thick Goblin] [Leave]
	pickWallSlutMenu();
}

//[Cherry]
public function goForCherryStuff():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("The rahn as red as her namesake appears to be watching clients with a tireless interest. At your approach, she tilts her head sideways until her narrow, elfin ear touches her shoulder. <i>“What’s jigglin’, new meat?”</i>");
	//[Appearance] [Puss Pass] [Talk] [Give Bubble] [Leave]
	cherryMenu();
}

//[Appearance]
public function cherryAppearance():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("Like most of her kind, the rahn is well sculpted and curvaceous in all the wickedest ways. This gel girl, however, has poured her legs up to the peak of her thighs into a pair of white, cybernetic legs shaped vaguely like set of armored, high-heeled boots. Besides those, she’s wearing precious little in the way of clothing. There’s a double-banded collar around her neck and a thick white band around her ‘hair’ giving her a crimson ponytail nearly as long as she is tall. It could be your imagination, but the ponytail almost seems to wags like a tail at your presence. A glowing VR visor perched just below her eye level gives her slender face a neon underlight.");
	output("\n\nHer globular breasts would be E-cups on an organic woman, but she’s sculpted them without nipples, giving her a slightly more professional appearance. She wears a pair of thick, waterproof gloves on both hands and an even thicker lacquer of glossy black lipstick on her plush lips. Her only other adornment is a thin, loose-fitting belt draped over one curvaceous hip. Attached to the belt by loops are a series of multicolored, golf ball-sized latex orbs");
	//player has bubble buddy:
	if(pc.hasItemByClass(BubbleBuddy)) output(" that you recognize as filled Bubble Buddy condoms");
	output(".");
	//if player has given Cherry small bubbles:
	if(9999 == 0) output(" You recognize a few of the cum-filled balls as your own, an act of generosity that Cherry certainly seemed to appreciate.");
	output(" A larger, grapefruit-sized bubble sags between her upper thighs, hiding her pussy, though just barely.");
	clearMenu();
	addButton(0,"Next",goForCherryStuff);
}

public function cherryMenu():void
{
	clearMenu();
	addButton(0,"Appearance",cherryAppearance);
	if(pc.hasKeyItem("Puss Pass")) addDisabledButton(1,"BuyPussPass","Buy Puss Pass","You already have a Puss Pass!");
	else if(pc.credits >= 50000) addButton(1,"BuyPussPass",pussPassBuy,undefined,"Buy Puss Pass: 50,000C","For the low price of 50,000 credits, you can use the Tap-Hall as much as you like.");
	else addDisabledButton(1,"BuyPussPass","Buy Puss Pass","You don’t have enough money for this. Come back with 50,000 credits.");
	addButton(14,"Leave",pickWallSlutMenu);
}

//[Puss Pass]
//mouseover: For the low price of 50k credits, you can use the Tap-Hall as much as you like.
//50000
public function pussPassBuy():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You mention that you’d like to get one of those unlimited passes she mentioned.");
	output("\n\nShe flashes a grin and kicks off the wall to turn to you. <i>“Oh yeah? Loving the enthusiasm. Flash that fat cred stick my way and we’ll get you set.”</i>");
	output("\n\nYou produce the requisite cash and Cherry’s ponytail swings up to grab the chit from your hand, careful not to make any skin contact. She slaps it into a terminal and nods at the subsequent beep. Gesturing for you to follow her, she sashays with thudding impacts to a slightly raised platform marked by two vaguely-footprint like buttons.");
	output("\n\n<i>“Just stand there and give us a smile,”</i> she instructs, tapping out a code on the wall to expose a shuttered lens. You take your place, getting your [pc.feet] more or less on both buttons and ");
	if(pc.isNice()) output("beam at");
	else if(pc.isMischievous()) output("stick out your tongue to");
	else output("stare down");
	output(" the ocular as it opens and runs a green laser across your features. When if finishes, a plastic rectangle bisected by narrow circuitry spits out of the machine.");
	output("\n\nCherry presents the card to you with the tips of her fingers, showing off the holo-pic that floats an inch off the surface. When you take it, a painful jolt jumps through your hand and the plastic turns rose red. <i>“There you go, all set up to your biosignature. You change, it changes with you.”</i>");
	output("\n\nLeaning in until her lips are almost touching your [pc.ear], Cherry whispers, <i>“I look forward to seeing you work.”</i> She pulls back with a wink and takes her accustomed place, watching the patrons busting nuts in the wall-sluts.");
	//add <i>“Puss Pass”</i> to Key Items and remove [Puss Pass] from Cherry’s dialog options
	// Puss Pass Mouseover:
	output("\n\n(<b>Key Item Gained:</b> Puss Pass! This red card has a holographic picture of you on it that somehow changes whenever you change. It grants unlimited access to Cherry’s Tap-Hall in Zheng Shi station.)");
	pc.createKeyItem("Puss Pass", 0, 0, 0, 0, "A red card granting unlimited access to Cherry’s Tap-Hall in Zheng Shi Station.");
	processTime(5);
	pc.credits -= 50000;
	clearMenu();
	addButton(0,"Next",goForCherryStuff);
}

//[Talk]
// wears belt of filled condoms (bubbles) patrons give her as appreciation gifts (like leaving a tip)
//exudes rahn chemicals that put biologicals to sleep when policing the Tap-House. When she’s horny (turns a slightly pink), bodily contact simply paralyzes them. Has ‘squirt-gun’ arm cannon in one of her legs robo-cop style that lets her weaponize her chemicals from a distance

//[Give Bubble]
//Mouseover: <i>“Offer Cherry a sealed cum snack”</i>
//Cherry will wear PC’s small bubbles like jewelry on her tip belt, eat their medium bubbles on the spot, take the PC to the office to enjoy large bubbles, and tag in the janitor for double team on huge bubbles
// has a wide collection of Bubble Buddies she uses in conjunction with her waterproof lipstick to allow for blowjobs without ‘harming’ her partner. Sometimes likes paralyzing them for ‘time stop’ roleplay
//can manifest omnipositor when extremely high arousal (huge cum bubble), wears a cock-ring ‘belt’ w/ two large bubbles hanging like balls after layer donates 2+ large bubbles

public function pickWallSlutMenu():void
{
	//add a text display with brief descs for each NPC and if they are disabled
	clearMenu();
	addButton(0,"Cherry",goForCherryStuff,undefined,"Cherry","Talk to the owner instead of jumping straight to the wall-bound sluts.");
	
	if(pc.hasStatusEffect("BlackDragDisable"))
	{
		output("\n\nWhile the black dragoness is still resting in her spot in the wall, she has been shut down until Cherry has a moment to get her cleaned up for the next customer. Maybe if you come back in an hour or two, you can hit her up.");
		addDisabledButton(1,"Black Dragon","Black Dragon","The black dragon is closed for cleaning.");
	}
	else addButton(1,"Black Dragon",blackDragonessUse,undefined,"Black Dragon","Investigate the big, dark dragon booty.");
	
	if(pc.hasStatusEffect("RaskvelDisable"))
	{
		output("\n\nThe raskvel are still there, but shut down for cleaning at the moment.");
		addDisabledButton(2,"DoubleRask","Double Raskvel","The raskvel are closed for cleaning.");
	}
	else addButton(2,"DoubleRask",doubleBooty,undefined,"Double Raskvel","Investigate two sandwiched raskvel.");

	if(pc.hasStatusEffect("ThiccGobDisable"))
	{
		output("\n\nThe gabilani is closed for cleaning. Maybe next time!");
		addDisabledButton(3,"Thick Goblin","Thick Goblin","The goblin is closed for cleaning.");
	}
	else addButton(3,"Thick Goblin",thickGoblinSmex,undefined,"Thick Goblin","Investigate a gabilani.");
	addButton(14,"Leave",mainGameMenu);
}

//[Black Dragoness]
//10'+ dark purple fanfir woman
//lower torso, vaginal only
public function blackDragonessUse():void
{
	clearOutput();
	showName("FANFIR\nPUSSY");

	author("Adjatha");
	output("You select a particularly prodigious posterior and take a moment to take it all in. By far the largest occupant of the Tap-Hall, this girl’s upper half is hidden on the other side of the wall, but the holo-pic next on the wall shows a mature, fanfir woman with narrowed eyes and a defiant glower, with a price at the bottom. Her lower half is at least 6’ tall, from her fat-tailed booty, down her thick, digitigrade legs to her taloned feet. An adjustable elevating platform has been installed for customers of every size.");
	output("\n\nThe draconic matron’s scales seemed black from further back, but up close you can tell that they’re actually a deep purple-blue, like a midnight-blooming lotus. Each cheek of her girthy rump is nearly as large across as your shoulders and her plump ass seems so wedged into the oval-shaped window that you don’t think she’s getting out without some serious construction work. A band of vibrating metal runs the circumference of her hefty tail, keeping the appendage limp and twitching instead of batting potential clients brainless.");
	output("\n\nThere is an orange bio-plug in her ass, but her pussy is open for business. It will cost " + 2000 + " credits to fuck the fanfir." + (pc.hasKeyItem("Puss Pass") ? " <b>Of course, for you, it’s free.</b>":""));

	processTime(3);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 2000 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(1500) >= 0) addButton(0,"Fuck Pussy",cockSelect,[pussyDatGryvain,1500,false,0],"Fuck Pussy","Plow that pussy" + (!pc.hasKeyItem("Puss Pass") ? " for 2000 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","Despite the enormity of her ass, you’re just too well endowed to take her for a spin.");
		}
		else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You can’t afford to ride this ride.\n\nCosts 2000 credits.");
	}
	else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Pussy]
//requires dick under 12" girth
public function pussyDatGryvain(x:int):void
{
	clearOutput();
	
	author("Adjatha");
	showName("FANFIR\nPUSSY");

	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 2000;
	}
	//has puss pass:
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\nPutting the others in the Hall out of your mind, you step up to the deep indigo ass, ");
	//nude:
	if(!pc.isCrotchExposed()) output("giving your [pc.cock " + x + "] a few strokes");
	//clothed:
	else output("loosening your [pc.crotchCovers] enough to let your [pc.cock " + x + "] stand free");
	output(". Gingerly mounting the elevating platform, you ");
	//pc under 8’:
	if(pc.tallness < 8*12) output("tap the controls to raise dais until you’re at a more accommodating height.");
	else output("ignore the controls and instead run your palms across her supple hindquarters, delighting in an ass sized perfectly for your own titanic stature.");
	output(" You slide your girth atop the deep vale of her moon-wide cheeks, just under her rotund tail. You can feel the draconic captive tense, but the yielding warmth of her torso-sized bubble butt invites more vigorous admirition. Sinking your fingers into the malleable mountains of her aft orbs, you delight in the silky softness of her fine scale-skin. With just a bit of gripping force, your palms vanish into the doughy depths of her ample cushions. You squeeze and rub, rolling the massive mounds in slow clapping circles, gradually swallowing your [pc.cocks] into the fathomless cleft of the pillowy posterior.");
	output("\n\nRiding the tidal waves of her velvet hinterlands is a massaging delight, but your ");
	if(pc.libido() <= 33) output("rising, repressed desires");
	else if(pc.libido() <= 66) output("eager, unrestrained appetites");
	else output("raw, animalistic urges");
	output(" demand a more procreative position. You reach down and guide your [pc.cock " + x + "] to the nadir of the giantess’ exposed form until you settle at the cusp of her purple pussy. Even here, her girthy curves have given the woman a thickness far beyond human proportions. Her plum-colored vulva is as wide across as your head, making the plump cunt less a peach to be savored and more a whole melon just begging to be split open. You tweak and clasp the bulbous lips, earning a steady, drooling trickle of anxious juices from within.");
	output("\n\nWhen you finally push your [pc.cock " + x + "] in, you find her valley as plump within as without. ");
	//normal cocks: 
	if(pc.cocks[x].thickness() < 3) output("There is no canyon here, only a taut channel of rippling muscle that suckles your inches as eagerly as if you were twice her size. Almost virginal pressure squeezes around you, her clenching lust coaxing you as deep as your body can manage.");
	//huge cocks:
	else if(pc.cocks[x].thickness() < 5) output("Rippling inner muscles part with suckling pressure, your obscene, breeder’s mass no hindrance when pushing into a fanfir’s pussy. Obviously accustomed to far smaller patrons, her body quivers at your girth, a gush of femme cum pouring across your length from just the first sensations of penetration.");
	else output("Your monstrous endowment, far wider than most races can handle, meets an unusually yielding resistance. Elephantine, egg-laying hips squirm and twist as you push, inch by sweet inch through the colossal woman’s cock-stuffed tightness. Your shuddering, girthy pressure is the perfect compliment to the stretched, lust-fattened thickness of the behemoth-sized slut.");
	pc.cockChange();
	output(" You drive into her, groaning with satisfaction as the giantess’ core strokes and slurps at your [pc.cock " + x + "] with each luscious pump. The oval aperture sealing her upper half in the wall creaks with the tension your hips apply to her tremendous stern.");

	output("\n\nHer posterior takes the slapping impact of your [pc.hips] indulgently, cheeks clapping their approval while matron-fattened thighs squeeze together.gushing nectar spills from her hefty snatch, soaking you from groin on down and even pooling at the base of the elevating platform. Enjoying yourself so much, you almost don’t noticed when the fanfir woman’s broad tail rises, casting an ominous shadow over you. You tense, but instead of striking, thankfully, it simply droops down over your shoulder. Its length wraps around your shoulders and down to the small of your back, before coiling around your [pc.footOrFeet], hugging you closely.");

	processTime(25);
	clearMenu();
	addButton(0,"Next",moreDragonfucks,x);
}

public function moreDragonfucks(x:int):void
{
	clearOutput();
	author("Adjatha");
	showName("FANFIR\nPUSSY");
	output("Despite the wordless, affectionate embrace, the temptation to put her colossal derriere through its paces proves too much and you slow your pace just enough to let you appreciate what’s to come. Raising an open-palmed hand up, you bend your waist slightly and whip around to slap one of her cheeks with a startling crack. The unexpected blow sends rippling waves from one dark-hued cheek to the other and a split second later, her nerves register the shock with an internal clenching unlike anything you’ve ever felt. Her tail pulls you tight enough that it crushes the air out of your lungs while her pussy clamps down on your stem with such force that your fingertips start tingling.");
	output("\n\nThe hold relaxes gradually and you follow up with another slap, hard enough to leave your palm burning. Another clench and you almost lose your balance. It feels like your head is in a velvet vice for just a second before the blossoming heat of a climax cuts through the haze. The dragoness’s cunny is suckling so hard at your [pc.cock " + x + "] that you almost feel lifted off your [pc.footOrFeet]. There’s certainly no way you’re stopping now, so the spanking continues until you’re forced to switch hands from the sheer numbness in your limb. Each impact brings a fresh wave of grasping constriction that it feels like she’s vibrating - inside and out - from the punishing buffet. Her pussy clenches randomly and wildly as the paddling sparks an orgasmic feedback that robs the giantess of muscular control and milks you within an inch of your life.");
	output("\n\nThe fanfir’s crushing depths are almost too much for your lust-sore [pc.cockHeadNoun " + x + "]. You grab hold of her wobbling haunches, all sensations in your body compressed down to the surging rush of your [pc.cockHead " + x + "].");
	//balls: 
	if(pc.balls > 0) output(" The downpour of hot dragon-girl juices polish your [pc.balls] in slavish, liquid adoration. Though lost in the endless expanse of milfy thighs, your cum tanks churn with the need to fill the wall-slut’s womb.");

	var cumQ:Number = pc.cumQ();
	//cum volume low:
	if(cumQ < 500) output("\n\nWhen your cream spills forth, your tender flesh is at once soothed and exhilarated. The warmth of your seed is practically a cool breeze next to the estrus heat of the giant dragoness’ furrow. Even her taut embrace slacks to a docile, submissive coaxing. Every pumping spurt you loose into her is swallowed by loops of inner muscle, shepherded into her fathomless depths. You’d be hard pressed to imagine what kind of oceanic virility it would take to actually fill the fanfir, but the stroking coils of her winding tail suggest that she’s plenty pleased with your contribution.");
	//cum volume high:
	else if(cumQ < 10000) output("\n\nThe molten pressure of your orgasm bursts loose in raging ropes of [pc.cumVisc] spunk. The regal claws of her hind legs scrape and tear gouges in the steel floor as they curl in bred bliss. You slow to shallow strokes, indulging in the feel of gushing seed rushing over her muscled depths with every hip-smacking plap against her pregnable puss. Despite a volume of jizz that would balloon a galotian’s belly, not so much as a drop of your nut flows back the way it came, siphoned away to sate the titanic thirst of the wall-bound dragon’s womb.");
	//cum volume hyper:
	else output("\n\nRather than try in vain to stand against the tide, you lean forward and brace your upper half against the indigo peaks of the dragoness’ rump. Orgasmic gouts of needful seed buffet inner walls, liquid volume parting the puckered muscle. Her lower body jolt, one leg kicking back in shock. You can just about hear a wall-shuddering cry of bliss the other side of her imprisonment as your endless ejaculate plumbs uncharted depths. It is not long before the fullness of her canal has filled with your spunk, fluid pressure driving each subsequent load past her unprepared cervix to fill the giantess’ womb. Though blocked from sight by the straining, oval of her compartment’s hole, you can feel the groan of her nut-stuffed gut expanding under your hot burden. Her motherly curves seem all the fatter from housing every drop of your [pc.cumVisc] lust within herself. Only a woman of such gargantuan stature could ever hope to house the full, fountaning magnitude of your cum reservoir and that is precisely what the black-purple fanfir manages. Truly a magnificent woman!");

	//merge
	output("\n\nEven by the time your orgasm runs dry, the girl in the wall hasn’t recovered from your rump-thumping. Her inner walls tremble as you pull yourself free and the oscillating sway of her buns continue for several minutes after the last stroke. A steady stream of femme cum drools down her fat pussy lips while the rippling contractions of the huge girl’s nethers look almost like she’s begging for more. Yet, not so much as a hint of your cum finds its way past her navy-black nethers, her muscles well trained enough to jealously horde every drop. The giantess’ tail tip strokes the well-used puff of her exposed femininity, though if she’s doing it to soothe or further tease her dark purple sex is anyone’s guess.");
	output("\n\nThough your hands and hips are throbbing at the abuse of their titanic efforts, your mast still stands upright. The fucking was plenty exhausting, but Cyber Punk’s subliminal engines make sure that there’s no such thing as a flaccid cock at Cherry’s. Perhaps it’s the post-coital haze, but it feels like you could go another round or twenty.");
	//drop lust to 30, remove 10-20 energy
	pc.createStatusEffect("BlackDragDisable");
	pc.setStatusMinutes("BlackDragDisable",90);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	pc.energy(-5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Double Booty]
//Red and blue raskvel mounted on top of one another, puss to puss
//asses-out, vaginal only
public function doubleBooty():void
{
	clearOutput();
	showName("RASKVEL\nBOOTY");
	author("Adjatha");

	output("Why settle for one when you can enjoy two at the same time? You step over to an alcove shared by two raskvel women who have been installed atop one another, their tails buckled against the wall to keep the dextrous hind-limbs from getting up to any mischief. The one on bottom has a rich, crimson hue while the one above has fair, light blue scales. A pair of flickering, digital portraits on either side of the sandwiched booties depict the girls from the waist up, before they were installed here. The ruby girl has a regal air to her, clad in a tall-necked dress with coifed hair, her head turned in profile, like she’s too good to look directly at the camera. The turquoise girl, on the other hand, has no such restraint, as her picture shows a pierced, punky brat bending her head to lick her own nipple, without breaking eye-contact.");
	output("\n\nThough the oval gap conceals most of the girls’ bodies, there’s plenty on display in the form of breeding-widened hips, fat upper thighs, and even fatter asses. The red one on the bottom has a thicker ass than her companion, plump enough to muffin-top around the constraints of her hole. The blue girl’s most visible asset comes in the form of extra-puffy vulva lips, her outer labia at least half again the size of her cellmate’s. Both of the raskvel’s peach-shaped pussies are flushed from constant, rubbing contact. Their shared, dripping excitement has left the fissure between their womanhoods glistening. Slick with sweat and lubricant, their color-contrasting rumps shift slightly, as if the two are struggling against one another out of your sight.");
	output("\n\nThere’s a green bio-plug in the red one’s ass and a yellow one in the blue one’s, but both pussies are open for business. It will cost " + 1000 + " credits to ravish the raskvel.");
	if(pc.hasKeyItem("Puss Pass")) output(" Of course, <b>with your PussPass, it’ll be free</b>.");
	processTime(5);

	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 1000 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(800) >= 0) addButton(0,"Pussies",cockSelect,[raskvelCuntFun,800,false,0],"Pussies","Slide between those two sloppy cunts" + (!pc.hasKeyItem("Puss Pass") ? " for 1000 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You’re too big to even cram your cockhead inside those pint-sized pusses.");
		}
		else addDisabledButton(0,"Pussies","Pussies","You can’t afford to ride this ride.\n\nCosts 1000 credits.");
	}
	else addDisabledButton(0,"Pussies","Pussies","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Pussies]
public function raskvelCuntFun(x:int):void
{
	clearOutput();
	author("Adjatha");
	showName("RASKVEL\nCUNNY");
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 1000;
	}
	//has puss pass:
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\nYour [pc.cocks] " + (pc.totalCocks() == 1 ? "is":"are") + " stiff and growing harder the more you look at the two, squished pussies" + (!pc.isCrotchExposed() ? ", so you pull off enough of your [pc.crotchCovers] to unsheath your meat":"") + ". Lining up your [pc.cock " + x + "] with the nectar-glazed nexus of the wall-sluts, you slide your [pc.cockHead " + x + "] against the moist lower lips. Your cockhead slips easily past the pliant, lubricated mounds of their heated loins, virtually sucked in by their restless struggles. Perhaps startled, the two shift, trying to pull back or twist away but in their captive state they only succeed in vigorously rubbing themselves against your firmness. Pushing your way across their nectar-lubed cunts, your [pc.cock " + x + "] drinks in their pillowy cushions. Red’s copious ass is so wide, it hugs the underside of your length while Blue’s pleasure-pumped pussy lips enfold your girth in a heated embrace.");
	output("\n\nYou slide slowly between them with a long, drawn-out thrust. The soft, lust-slick scales of their loins are compressed with pussy tightness. As you rock your crest back and forth between them, you marvel at how the moist pocket of the girl’s mutual nook seems to fit you like a glove. The differing textures of their mounds complement each other in a way that sends a thrill up your abdomen and coaxes a slight spurt of [pc.cumVisc] pre-cum. Cushioning cunts buff the [pc.cumGem] cream between themselves, the voluptuous pair of quivering muffs drooling their own agitated passion against your [pc.cock " + x + "] in twin, seeping flows.");
	//cock 9+
	if(pc.cocks[x].cLength() >= 9) output("\n\nYou slide right through the plump pussies and across the girls’ taut stomachs. In short order, you press against a second, unseen barrier: the raskvels’ compressed tits. The slickness of their shared lust lubricate your invading mast, allowing you slide through the mutual cleavage without only minor pressure. The pictures of the two on your left and right depict fairly average B-cups, but the squishy gulf caressing your [pc.cockHead " + x + "] is anything but modest. Perhaps their confinement in the Tap-Hall has left them to accumulate caloric mass. Maybe their owners gave them a little quality of life modification before shutting them up together. Whatever the reason, the shortstacks now share a veritable valley of soft tit-flesh to surround and stimulate their better endowed clientele. Pumping a foot at a time, you draw back to gather the warm femme cum gushing in their pliant vulvas before thrusting forward into the buxom furrow of their massive mammaries.");
	//cock 18
	else if(pc.cocks[x].cLength() >= 18) output("\n\nEven filling the fullness of the raskvels’ mountanous titslit, isn’t enough for someone with your sheer mass. You push all the way between them, your [pc.cockHead " + x + "] sliding past slender necks and across narrow jaws to rest against the girls’ faces. They wiggle and squirm as their narrow compartment fills with your throbbing, pussy-juice soaked cock. Saturated with their own fluid passion and the fat bubbles of your pre-cum, you can only imagine their expression at being being cheek-to-meat with the firmness so aggressively teasing their exposed posteriors. One, at least, seems delighted by the intrusion, her thick, seven inch tongue gliding across your [pc.cock " + x + "] in coiling circles. The other, seemingly reluctantly, joins in, her tongue making a serpentine path to your urethra, squeezing the peak and flicking at the leaking pre.");
	//merge
	output("\n\nAs much as you’re enjoying the press of the mismatched pair across your cock, the tension blooming in your loins demands more. Burying yourself fully in the slut-stuffed booth, you pull out an inch or two before slamming back in, taking only shallow thrusts, but putting all your weight behind them. Your [pc.hips] smack against their asses with a soft clap that grows louder the faster you plow the double flanks. Each impact makes the two tense and squeeze in unison, their exposed nethers blushing and their booties quaking at the force of your rapid, slapping strokes. The azure puss puffs so large from the hotdogging that it seems to swallow your length with its outer, puffy folds alone. The massive, scarlet ass at the foundation of the tribbing duo serves as a deliciously plump pillow for your" + (pc.balls <= 0 ? " [pc.thighs]. Your [pc.skinFurScales] spank her bubble butt hard enough that you’re almost afraid you’re going to knock her the rest of the way into the wall!":" [pc.balls]. The supple weight of your sack bumps against the rippling ocean of her bubble butt, each yielding collision seemingly adding just a bit more to their fluid burden."));
	output("\n\nYou can feel the slight firmness of the girl’s clits through the softness of their fleshy muffs, four firm, hot bulbs buried in velvet folds, like a quartet of tongue-tips inside cock-stuffed cheeks. Grabbing a cheek on each girl’s ass, you brace yourself, grinding your [pc.cock " + x + "] against the aliens’ sensitive pearls. Blue surrenders first, gushing with warm, orgasmic fluid that washes over your girth, soaking her rosy companion’s pussy in the process. It’s not long, however, before the bottom joins her top’s clenching climax. Red’s climax is rather more spectacular, as her orgasm shoots spraying jets of femme cum in wild spree, squirting all over herself, her partner, your cock, and even fountaining back to splatter across your abdomen and [pc.legOrLegs] as well!");
	output("\n\nWith these two shuddering and squirting, you pull back to sample the goods themselves. As lubed as they’re likely to get, you line up your [pc.cockHead " + x + "] and thrust into a pussy with heedless abandon. You don’t even notice which girl you pierced at first, your penetration bringing on another wave of clenching, bucking bliss. Muscled folds suckle in spasming ecstasy as you pump her cunt properly, wet [pc.skinFurScales] slapping lust engorged scales in an orgy of lewd abandon. You pull out long enough to switch holes before slamming home again, the new pussy unprepared and taut with orgasmic tremors.");
	pc.cockChange();
	output("\n\nThe girls rock back and forth against one another, as eager to coax your shaft to plow their aching slit as to enviously tease their roomate. They’re so wanton that by the time you withdraw from one and push against the other, your [pc.cock " + x + "] slides right in like a well oiled machine. You fuck the ruby raskvel for a few dozen strokes before switching to the lapis one, groaning at the continually re-tightening of their lust-sloppy holes. In no time, you have a pattern of fucking the two in rapid succession, each trembling and tightening in an effort to prove themselves the more suitable cocksheath.");
	output("\n\nTheir cascading climaxes press on your libido like a button, urgency crackling across your body with electric need. " + (pc.balls > 0 ? "Breeding urges wash through your [pc.balls] like a throbbing bass beat. The gravity of your seed-stuffed sack leaves you light-headed and fills your ears with the foam-crashing sound a rising tide. ":"") + "When your orgasm does come, you’ve lost track of which hole belongs to which girl. They’re both just as wet and willing, their pussies milking the stranger inside them or still shuddering with the rippling thrill of their latest cock-stuffing. A heated release pushes past suffocating tightness and spurting loads gush into trembling, raskvel puss. Fervor-flushed walls drink deeply, their fecund folds contracting in suckling ripples. You fill your palms with the crimson girl’s supple cheeks and unburden vent your liquid passion with white-knuckled enthusiasm.");

	var cumQ:Number = pc.cumQ();
	//high cum additional text:
	if(cumQ >= 1000) output("\n\nYou feel the gush of overflowing spunk and take a breath mid-load. You’ve got seed enough for the both of them you realize. Even though you’d be splitting the creampie between two cunts, your body is more than up to the task of giving each 100%. Biting the inside of your cheek, you force yourself to continue your fucking rotation, swapping from one pussy to the next between gushing loads. The excess spilling over their curvaceous rumps just about paints over the red and blue of their scales with your own [pc.cumColor] lacquer. Fat wads of gurgling jizz fill their depths with your virility, but that doesn’t stop you from switching back, pumping and thrusting to drive your [pc.cumVisc] seed deeper and deeper within them. In your lust-drunk haze, you can imagine them feeling the weight of your [pc.cum] oozing past their cervixes and right up into their ovaries.");
	//hyper cum additional text:
	if(cumQ >= 25000) output("\n\nThe puddle forming at your [pc.footOrFeet] tells you the two wall-wombs are as stuffed as their stretchy bodies can get, so you change tacks. Instead of driving into the nut-stuffed cunts, you push back, between their fat vulvas. Returning to the cradle of their femininities, you blast ropes of hot semen across their swollen, tender clits. Resting your urethra against the sensitive pearls, you shoot again, hosing them down with such fluid pressure the two shake with renewed orgasms. Peaking mindlessly against one another, your spout floods the narrow gap between the compressed shortstacks and into the compartment on the other side of the wall. You can imagine your steady, body-shaking cum blasts washing across their jizz-bloated stomachs, and through their shared cleavage. Again and again you geyser [pc.cum] past the partition and into the wall-sluts’ cubby, [pc.cumVisc] waves streaming over their long tongues, flowing up their nostrils, and running down their feathery hair. The sheer mass of the bottom girl’s rump serves as an excellent plug, keeping the gallons of your the excess sealed in with them.");
	//merge
	output("\n\nWhen you at last step away from the gooey mess you’ve reduced the raskvel girls to, sated and satisfied, you can’t help but admire your handiwork. The quaking rumps mounted in the wall are even puffier from your vigorous efforts, swollen and tender but still alluring. Almost a shame you’ve got other things to see to. And speaking of other things, for some reason you’re still hard and feeling the tingle of your wild oats. There really is no rest for the wicked in Cherry’s.");
	pc.createStatusEffect("RaskvelDisable");
	pc.setStatusMinutes("RaskvelDisable",90);
	processTime(25);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Thick Goblin]
//Gabilani w/ torso-sized tits in a windowed compartment
//ass-out, anal only
public function thickGoblinSmex():void
{
	clearOutput();
	author("Adjatha");
	showName("THICK\nGOBLIN");
	output("One of the booths catches your eye with an unusual difference. Rather than blank wall and holo pic, this compartment has its wall made from a thick, translucent plastic, almost like a fish tank. Its occupant is a short, green skinned girl with long, fey ears and heaving, J-cup breasts that entirely cover her torso and smother the lower half of her face. The gabilani’s plump legs and high-heel clad feet have been pulled back by ankle cuffs so that they form a V around her head. The only thing sticking out of the wall is her fat, emerald rump. ");
	//player hasn’t fucked her yet:
	if(flags["THICK_GAB_USED"] == undefined) output("Her expression flickers from outrage to disgust every moment you spend near her, but any attempts at speech she might be making are swallowed by the compartment. A far cry from the slack, wanton lust of the others in the Tap-Hall, you’d guess she’s a recent installation.");
	else output("Her glower turns to wide-eyed shock. Apparently she remembers you! How fun.");
	output("\n\nThere is a glowing green bio-plug in her pussy, but her ass is open for business. It will cost " + 500 + " credits to gape the gabilani.");
	if(pc.hasKeyItem("Puss Pass")) output(" Of course, <b>with your PussPass, it’ll be free</b>.");
	processTime(4);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 500 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(700) >= 0) addButton(0,"Buttfuck",cockSelect,[goblinAnalStuff,700,false,0],"Buttfuck","Take the hesitant gabilani for a spin" + (!pc.hasKeyItem("Puss Pass") ? " for 500 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Buttfuck","Buttfuck","You’re too big to even cram your cockhead inside dat ass.");
		}
		else addDisabledButton(0,"Buttfuck","Buttfuck","You can’t afford to ride this ride.\n\nCosts 500 credits.");
	}
	else addDisabledButton(0,"Buttfuck","Buttfuck","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Anal]
//requires cock
public function goblinAnalStuff(x:int):void
{
	clearOutput();
	showName("\nGABILANI");
	author("Adjatha");
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 500;
	}
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\n");
	if(pc.isNice()) output("Though the enslaved girl’s predicament anguishes your better nature, the heat between your hips drowns out the anxiety with the promise of a damn fine lay." + (!pc.isCrotchExposed() ? " Your [pc.gear] is already off before you notice removing it.":""));
	else if(pc.isMischievous()) output("Leaving a gift-wrapped girl to suffer the chill of an unfilled ass would be downright cruel, you consider" + (!pc.isCrotchExposed() ? ", stripping off enough of your [pc.crotchCovers] to lend a helping hand":"") + ".");
	else output("You meet the girl’s gaze with a steady star and smile at her indignant glare. Clearly she hasn’t accepted her place just yet, you muse" + (!pc.isCrotchExposed() ? ", setting aside your [pc.crotchCovers]":"") + ". A lesson at your hands should prove instructive.");
	output(" The lust-stuffed atmosphere of the Tap-Hall is only partially responsible for your avid itch to sample the verdant-hued captive’s glossy, pre-lubricated ass. Your excruciatingly hard [pc.cockNounSimple " + x + "] feels almost numb as you step up to the mint-hued short stack. She eyes your cock with a wide, alarmed expression, her eyebrows arching to the peak of her tousled tresses. Her smaller size must surely make your member seem all the more intimidating.");
	output("\n\nPressing your crest against her plump, donut-lip anus, you take a moment to savor the involuntary bucking of her hips against the fuck-shelf’s restraints. She seems to be saying something, but her words are as much muffled by the wall between you as by the wildly disproportionate breasts wobbling atop her diminutive frame. You wonder if the pirates gave her those outrageous melons or if she did that to herself, but decide you really don’t care and focus on the task at hand.");
	output("\n\nYou press forward, into the girl’s sweat-slick rump with heated relish. Even lubricated, she’s so tight you can barely squeeze your [pc.cockHead " + x + "] past her tea-green ring. You huff a few deep breaths, lust-heat boiling in your lungs and sending tendrils of tingling urgency across your [pc.skinFurScales]. You seize hold of the goblin’s exposed inner thighs, sinking your fingers into the pliant handholds and push an inch deeper. She wiggles frantically, her heels helplessly kicking air as your girth spreads her publicly-use ass-pussy. Her taut abdomen visibly expands, the bulge of your encroaching tip pushing up her plugged cunt as you plumb her squeezing depths.");
	output("\n\nNo matter how many deep breath you take, you just can’t calm the urge to stuff the defenseless gabilani while she watches, bound and bucking. The last vestiges of your restraint vanish like whispers in the wind. ");
	if(pc.cocks[x].cLength() < 8) output("Plunging your full length in a single stroke, you ram your [pc.hips] against the green slut’s rotund rear with a lube-squelching slap.");
	else if(pc.cocks[x].cLength() <= 17) output("A half-foot at a time, you ram your length into the jade slut’s rippled rear until every last inch is buried in the alien slave.");
	else output("Though only the peaks of her hips muffintop through the wall’s oval, they’re thick enough to serve as handhold as you buck into the unprepared captive. Your girth strains against her containment, but you manage a full foot and a half into her large intestine before your progress is arrested by biology.");
	pc.cockChange();
	output(" Her eyes cross, irises contracting to pinpoints as the overwhelming sensations of your mismatched size spears through her mind. Clenching shudders all along your length tell you she’s orgasming harder than her small body is built for. As you’d guessed, she makes for a lovely cocksleeve. It’s a pity you can’t take her with you.");
	output("\n\nWhile the gabilani mindlessly rides her anal climax, you spear through her overstuffed hindquarters with relative ease. It’s not that she’s not squeezing you for dear life, it’s more that her muscles are just too weak to stand against your lubed length. Slapping and pumping the wall-slut to your heart’s content, you find yourself marvelling at the feel of her interior. The cushioned, bedding-like texture of her body, the taut sensation of her inner folds, the suckling draw of her whorish derriere... it’s like her ass was made for you.");
	output("\n\nYour vision darkens and sensations become flickering flashes of intense pleasure as your body takes the reigns. Pumping hard and fast into the voluptuous ass, her whole diminutive frame rocks against her restraints. Mammoth mammaries buffet her face, but every so often you can see the petite, panting pucker of her agape mouth, frozen in a blissed-out, soporific smile. You’re vaguely aware of an urgent tightness that must be your orgasm, but your frenzied state hardly registers such an insignificant detail. You slam against the lush, olive haunches jutting from the windowed wall, the gabilani girl’s fat-ringed asshole like a wedding band around your [pc.cock " + x + "].");
	var cumQ:Number = pc.cumQ();
	//cum volume low
	if(cumQ < 1000) output("\n\nBefore you realize it, you’re cumming, your orgasm weaving delicious tendrils of release into your fervent ass-pounding. " + (pc.balls > 1 ? "Your [pc.balls] clench as they strain to keep pace with the manic, reaming pace you’ve reached. ":"") + "You pound a fist against the thick plastic pane and bite your lower lip. Slapping her gut with your [pc.cockHead " + x + "], each wet plap delivering another spurt of your [pc.cumVisc] passion into her bowels. Her rump flushes from the relentless pace, faint red blush blossoming across her skin while her porn-star tits smack her face to a similar, humbled hue. You spunk her with everything you’ve got, slamming the nut all the way up into her belly, all while your capacity for cognizant thought recedes into an emerald haze.");
	//cum volume high
	else if(cumQ < 10000) 
	{
		output("\n\nIt feels like you’ve been slapped when your orgasm hits. Your [pc.cock " + x + "] pulses and bulges with the onrush, provoking a renewed tension all down your mast. She tenses but you’ve worn her down so savagely, that when your jizz hits her gut, her back arches and bucks wildly. Gouts of spunk rush into gabliani, so much so that at first you think her tits are growing even larger. It isn’t until your third or fourth load that you realize her gigantic bosom is merely being lifted up by the belly distending nut flooding into her.");
		output("\n\nDespite her race’s incredible elasticity, there’s only so much her stomach can take. " + (pc.balls > 0 ? "The weight of your [pc.balls] slapping against your inner thighs serves as an urging counterpoint to the fleshy sounds of your ass-twapping onslaught.":"") + " As you ram yet another load into her, you spy a trickle of gooey white running down , through her cleavage. Apparently she’s so full, she started overflowing from her mouth! Even though your inner heat has been spent, you keep pounding her long after, spilling fresh gouts of excess across her slick skin.");
	}
	//cum volume hyper
	else 
	{
		output("\n\nThe crushing weight of your tectonic climax surges upward, distending your [pc.cock " + x + "] with the volume of its ascent. The goblin girl, feeling the rising thickness spreading her wider still, thrashes silently on the other side of the wall. Far too late to hold back, you catch the wall-slut’s rich hips in a white knuckled grip, rocking your plumping pressure for all its worth. Clenching your eyes shut at the moment of release, you can feel the impaled ass tighten uselessly as an uninterrupted stream of spunky goo rushes through her body. The gushing gallons can only flood her so fast, so a wake of [pc.cumColor] washes back past her trembling green donut hole and splashes across her exposed rump.");
		output("\n\nThe bulk of your seed runs its torrential path through the gabilani, saturating every crevice of her inner passages. It innundates her gut all the way up to her belly, which it swiftly fills. Your pounding loads expand the slut’s body to the point of obesity, but there is always another load to go. Her huge tits slide aside just long enough for you take her expression of confused alarm as her cheeks bloat and her glossy lips part, spilling your cream into her cleavage. You wallop that fat ass for all its worth while the inconceivable volume of your orgasm pumps fresh gallons to replace the old. A [pc.cumGem] fountain sputters from her lips, drenching the interior of the goblin girl’s compartment with your excess. Filling the cube as a puddle at first, she tries to keep her mouth closed but the [pc.cumVisc] spills from her nostrils instead. The sealed container fills faster than you’d have believed, the green girl slowly vanishing in the rising tide of [pc.cumColor] cum. Your eyes close again, as you push yourself to empty completely and give that slut every last drop her ass has earned.");
	}
	//merge
	output("\n\nYour sight clicks back on, registering an uncertain passage of time. You don’t know how long you spent fucking the green skinned girl or how many time you came, but if her ");
	if(cumQ < 1000) output("cum-drunk expression is any indication, the two of you were at it for quite a while. Though all you can see above her bloated tits is her eyes, the dazed expression would look perfectly at home on a junkie who just had their hit. If she had any doubts about her new career as a public use cum dump, it seems she’s fully convinced now.");
	else if(cumQ < 10000) output("ballooned, cum-stuffed gut is any indication, the two of you were at it for quite a while. The narrow-waisted woman’s abdomen is so large that it dwarfs even her porn star J-cups. She has all the curves of an overfilled water balloon, her hoisted thighs squeezing the prodigious gut to fully block her vision of the world around her.");
	else output("nearly cum-filled compartment is any indication, the two of you were at it for quite a while. The narrow space on the other side of the translucent display wall looks very nearly like an aquarium, filled as it is with your slimy spunk. The peaks of her tips and her raised, restrained legs poke up through the [pc.cumColor] lake like verdant islands, while a pair of emerald lips just barely reach the surface. The fluid level does seem to be dropping slightly, bit by bit, from some too-narrow drain. Well, until then, at least you’ve given her a nice, warm bath.");
	output("\n\nYou pull yourself free of her still-clenching ass with some effort. Like pulling out a plug, the gooey excess of your bliss comes drooling from her freshly gaped booty. The well-used girl oozes like an over-filled condom and you give her a pat of appreciation on her jiggling, sweat-slick ass cheeks. Though a bit fatigued, your libido hasn’t appreciably diminished after your carnal spree. You don’t know if it’s the subliminal machines, the possibly pheromone-laced cherry perfume, or some other mechanism to keep the Tap-Hall’s clients at peak arousal, but you’re actually beginning to feel warm again.");
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	pc.energy(-5);
	IncrementFlag("THICK_GAB_USED");
	pc.createStatusEffect("ThiccGobDisable");
	pc.setStatusMinutes("ThiccGobDisable",90);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}