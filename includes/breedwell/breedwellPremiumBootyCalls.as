/* Breedwell Premium Breeder by Nonesuch*/

/**
	 * ...
	 * @author DrunkZombie
	 */

//Note: this is the class for the booty calls while under contract
//see breedwellPremium.as for the core contract functionality
//
//mhenga
public function breedwellPremiumBootyCallsPheromonalFuurahn():void
{	
	clearOutput();	
	showBust("");
	showName("PHEROMONAL\nFUURAHN");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(5);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var hole2:int = 0;
	
	output("<i>“Oh thank the Void!”</i>");
	output("\n\nThe blue-and-green rahn in the jungle fatigues is over to you almost the moment you step into the clearing. Her sober clothes, glasses and tied back gel fronds suggest a serious field researcher, but right now her face is flush and she looks utterly desperate.");
	output("\n\n<i>“Some... natives dosed me really bad with their ph... ph... smell,”</i> she explains, as she tears off her clothes, allowing her small breasts and fat, six-inch ovipositor to swell out of her white panties. The latter is strainingly erect, oozing plentiful lube at the tip. <i>“Thought they were joking when they told me to sign up to this scheme if I was going to Mhen’ga, but now... fuck! Fuck!”</i> She pushes you against a tree and presses her soft, wet mouth against yours, tongue curling around hers as she humps your [pc.thigh] urgently.");
	output("\n\nShe");
	if (!pc.isCrotchExposed()) output(" shoves down your [pc.lowerGarments] and");
	output(" hoiks you up by the [pc.thighs], parts your [pc.vagina " + hole + "] with the slick, bulbous crown of her egg-cock and thrusts its supple hardness in deep, a burble of hyper-aroused nonsense tumbling out of her mouth as she does so. She fucks you like a rabbit in rut, waves of lithe gel washing up your body as she judders into you with helpless abandon, a pulsating truncheon inside you that quickly drives you almost as wild as her. Your shared gasps and moans fill the glade.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\nShe cums with an almost pained wail, pressing you against the tree and swelling your");
	if (pc.isPregnant(hole)) output(" pussy");
	else output(" womb");
	output(" with a huge load of goopy eggs, many of which quickly ooze back down your [pc.thighs]. You orgasm to the wonderful feeling of it, your [pc.vagina " + hole + "] crimping up sensationally around her bulging cock.");
		
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	output("\n\n<i>“Oh! Oh! Ohhhhh...”</i> the fuu’rahn groans, at last coming loose from you. <i>“Oh thank fuck that’s out of me.”</i> She gazes down at her club-like ovipositor, still pheremonally charged and hard, and smiles at you amorously. <i>“Now I can get down to really enjoying you.”</i>");
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = pc.findEmptyPregnancySlot(1);
		if (hole2 < 0) hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	else hole2 = -1;
	
	processTime(10 + rand(10));
	output("\n\nThe lithe, mottled gel-woman lays you down on the warm grass, tongue hungrily flicking over your [pc.skinFurScales] and [pc.nipples] as she peels your [pc.thighs] open again, this time to slot her hot, chubby egg delivery tube into your");
	if (hole2 < 0)
	{
		output(" [pc.anus]. The smooth member is slathered in readymade lube, and she’s easily able to part you, pushing herself deep into the tightness of your [pc.ass]. You grit your teeth at the intense sensation.");
		pc.buttChange(ppRahn.cockVolume(0));
	}
	else
	{
		output(" [pc.vagina " + hole2 + "]. You hum with joy at receiving a filling in your second vagina, your first still awash in wonderful, slimy sensation as the tunnel behind is being filled out.");
		pc.cuntChange(hole2, ppRahn.cockVolume(0));
	}
	output("\n\nShe saws into you steadily this time, kissing, fondling and licking you as she pushes her ovipositor again and again, drawing you up to orgasm first this time, making you moan and clench up around her before spewing a fresh, rich load of steaming eggs into your");
	if (hole2 < 0)
	{
		output(" colon");
		pc.loadInAss(ppRahn);
	}
	else
	{
		output(" second cunt");
		breedwellPremiumCreampie(hole2);
		pc.loadInCunt(ppRahn, hole2);
	}
	pc.orgasm();
	output(" in one big eye-crossing load.");
	output("\n\nFinally, still laden and fretful with alien fuck-chemicals, she gets you to lick her pussy: plump, gooey little fruit below her aching ovipositor that begs for the ministrations of your [pc.tongue]. Leg in the air, she sighs and then clutches the turf as you get in there deep, lapping, kissing and flicking at her sweet, sticky tunnel until she smears your face with rahn-juices with an ululating, glorious moan.");
	output("\n\nIt’s whilst you’re relaxing next to the happy, dozing rahn that you hear the movement in the branches above; the smirking, delighted laughter.");
	output("\n\n<i>“Woooow,”</i> says the elfin zil male, lounging in the blue-barked tree far above, pupil-less eyes feasting on your sweaty flesh. <i>“I’ve gotta try and hit more aliens with the sweet breeze. You guys know how to put on a show!”</i>");
	
	breedwellPremiumRecordSex();
	pc.applyPussyDrenched();
	pc.exhibitionism(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
//uveto
public function breedwellPremiumBootyCallsUvetanExplorer():void
{	
	clearOutput();	
	showBust("");
	showName("UVETAN\nEXPLORER");
	author("Nonesuch");	
	
	output("Once you start towards the signal, it’s relatively easy to see where it’s coming from. A distant red glow burns through the incessant snowstorm, and as you get closer you can make out a large, heavily layered tent.");
	output("\n\nThe tall, bundled-up fuu’rahn pauses over her stove unit when you crunch out of the blizzard into its light, simply staring at you blankly over her scarf for a time.");
	output("\n\n<i>“...I turned that app on as a joke,”</i> she says eventually, in a deep, oboe-like voice. <i>“Get a couple of likes on social media when I demanded to know why Tamani don’t have any bed-warmers where you really need ‘em. Uh. Guess they actually do.”</i>");
	output("\n\nShe rubs her mittens together, and then gestures at the stove.");
	output("\n\n<i>“...want some coffee?”</i>");	

	processTime(120);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsUvetanExplorerNext);	
}
public function breedwellPremiumBootyCallsUvetanExplorerNext():void
{	
	clearOutput();	
	showBust("");
	showName("UVETAN\nEXPLORER");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(4);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var hole2:int = 0;
	
	output("You sit yourself down opposite the warm glow of her multi-use power unit and accept a steaming cup. Mmm - just the ticket. The tall, thickly-built mottled rahn is a biologist-cum-survivalist, eschewing the sterile safety of her lab to spend weeks on her own in hostile, distant environments like the ones Uveto has to offer, studying the organisms that cling to life out here.");
	output("\n\nShe’s seen and done many things, and her reserved manner loosens when you return with some of the things you yourself have seen and done in the far corners of the frontier. The researcher is unexpectedly shy when she asks you about your more amorous adventures, and the frank, outrageous tales of a dedicated egg-slut clearly warm her up. As the deadly chill of night starts to take hold, she feeds you a vegetable stew, invites you into the welcoming snugness of her tent, and then finally into her big, furry sleeping bag.");
	output("\n\nHer insulated underclothes rub over your [pc.belly] and [pc.chest] as she disgorges her bulbous, seven-inch ovipositor with a husky grunt, and after you’ve lovingly rubbed it between your [pc.thighs] and hands for a while, and she sunk her fingers quizzically into your [pc.vagina " + hole + "], she twines her legs around your [pc.legs] and spreads your lips with its warm, springy girth.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\nThere isn’t room to go nuts in that cocoon of warmth, with the ceaseless storm whipping at the fly sheet above - you simply rock against each other, taking from each other’s warmth, corkscrewed. You fondle the rahn’s lovely gooey boobs and soft gut as your [pc.vaginaNoun " + hole + "] shifts up and down her thick ovi-dick, until the sighs in your ear turns to impassioned groans, she grips your [pc.ass] and balloons your [pc.belly] outwards with thick, gooey warmth, quickly spreading down your intertwined thighs.");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	output("\n\nYou go to sleep intertwined, and then do it again in the morning, and this time it’s even better.");
	
	processTime(480);
	dailyAutoSleep(540);
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = pc.findEmptyPregnancySlot(1);
		if (hole2 < 0) hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	
	pc.cuntChange(hole2, ppRahn.cockVolume(0));
	breedwellPremiumCreampie(hole2);
	pc.loadInCunt(ppRahn, hole2);
	pc.orgasm();

	output("\n\n<i>“I may not be able to tell anyone about this. Good story though it is,”</i> she says, matter-of-factly putting her thick coat back on. <i>“It would hurt my cred a lot if it turns out I ordered a fuck while I was out here on my lonesome.”</i> ");
	output("\n\nShe smiles at you shyly as you prepare to brave the freeze again.");
	output("\n\n<i>“I really hope you’re on the next hellhole I’m assigned to, though... ”</i>");
	
	processTime(60);
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
//used in runOnEnter in tavros rooms.as
public function breedwellPremiumBootyCallsCheckTavrosCouple():Boolean
{
	if (breedwellPremiumBootyCallCheck("tavros station") && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing();
		return true;
	}
	return false;
}
public function breedwellPremiumBootyCallsTavrosCouple():void
{	
	clearOutput();	
	showBust("");
	showName("TAVROS\nCOUPLE");
	author("Nonesuch");	
	
	moveTo("TAVROS_TEMPO");
	
	output("The signal leads you into one of the pretty, metropolitan wings of the Residential Deck, from there to a smallish townhouse.");
	output("\n\n<i>“Honey, the sex has arrived!”</i> calls the go’rahn who answers the door. <i>“Please, come in, come in. [pc.name], isn’t it? Are you hungry? Dinner will be in ten minutes.”</i>");
	output("\n\nThe white rahn is the lesser-seen masculine rahn, trimly built with a flat chest and a jaw that’s probably about as square as an amoeba ever gets. His partner is a voluptuous, merry-faced zel’rahn bustling around the kitchen.");
	output("\n\n<i>“Ooh, isn’t [pc.he] precious!”</i> she beams. <i>“Sit yourself down, dear. It’s lovely to have such fresh-faced company.”</i>");
	output("\n\nYou do so, and wind up enjoying a large, homemade meal with plenty of wine. You don’t recognize anything the red rahn puts in front of you, but it’s all delicious. You tell them stories of your exploits on the frontier, which they spur on by filling your glass whenever it is empty. Laughter spills out into the hallway.");
	
	if (pc.isPregnant())
	{
		output("\n\n<i>“Remarkable. And you’re not currently... full?”</i> the go’rahn asks, glancing at your [pc.belly].");
		if (pc.isFullyWombPregnant())
		{
			output("\n\nMaybe... but you didn’t get into this purely to make baby rahn and money. You do it for the joy of it.");
			output("\n\n<i>“That’s great,”</i> beams the zel’rahn. <i>“We’d only want to do this kind of thing with breeders who are really <i>willing</i>, you know? That’s what the advert promised.”</i>");
		}
		else
		{
			output("\n\nYou give him a coquettish rise of the eyebrow and respond that <i>one</i> of your wombs is currently hard at work, yes.");
			output("\n\n<i>“One - ohhhh,”</i> he says, wonder quickening into lust as his eyes dance over you.");
		}		
	}
	else
	{		
		output("\n\n<i>“And... is this your first time?”</i> the go’rahn asks, glancing at your [pc.belly].");
		output("\n\nOoh no, you’ve been present at plenty rahn rodeos before. But... you give him a coy smirk... it <i>could</i> be your first time, if they wanted. It’s their pleasure, after all.");
		output("\n\nHe blushes and coughs into his napkin.");
		output("\n\n<i>“Wow,”</i> he says, glancing at his partner with flashing eyes. <i>“They certainly do pick them, don’t they?”</i>");
	}
	
	processTime(60);
	pc.imbibeAlcohol(10);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTavrosCoupleNext);	
}
public function breedwellPremiumBootyCallsTavrosCoupleNext():void
{	
	clearOutput();	
	showBust("");
	showName("TAVROS\nCOUPLE");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(3);
	var ppRahn2:PregnancyPlaceholder = getBreedwellRahnPregContainer(6);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var hole2:int = 0;
	var isPreg:Boolean = pc.isPregnant();
	
	output("After you’ve all digested a bit they take you upstairs to a cozy bedroom that contains a king-sized bed. The couple watch, fondly stroking each other’s gooey flesh, as you give them a strip-tease, removing your [pc.gear] item by item and tossing it to the floor, giving your");
	if (pc.hasTits()) output(" [pc.boobs]");
	else output(" [pc.ass]");
	output(" a sexy little wiggle when you’re done.");
	output("\n\nThe go’rahn then moves across, puts you on your back, spreads your [pc.thighs] and fucks you rotten. He holds your [pc.ass] up so he can thrust his thick, tapering ovipositor into your [pc.vagina] particularly hard, spreading and filling you with gooey rahn cock. Ooh, it’s got little stubs along its length that drag along your walls! Your giggles and squeals join the squishes and boyish groans, your pleasure building into a feverish foam as he thrusts it home again and again.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\n<i>“That’s it, give the delicious little thing hard,”</i> cries the zel’rahn, one set of fingers stuffed into her pussy, other coaxing her own fat, drooling tube-cock out into a full, ardent erection. <i>“Oh, I love watching you do that, darling!”</i>");
	output("\n\nYou make sure you orgasm loud, moaning and crying out wantonly as your [pc.vagina]");
	if (pc.isSquirter()) output(" spurts [pc.femcum]");
	else output(" dribbles [pc.femcum]");
	output(" out around your stuffed entrance, the go’rahn ardently screwing the sounds and wetness out of you with one thrust of his fuck-club after another.");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	output("\n\n<i>“Whew!”</i> he sighs, when he tumbles down beside you at last, ovipositor still engorged, soft, wet hands spreading around your");
	if (pc.hasTits()) output(" [pc.boobs] and");
	else output(" [pc.ass]");
	output(". You’re in enough of a fuck-daze to respond readily, letting your");
	if (pc.hasTits()) output(" curves");
	else output(" body");
	output(" swell into his grip. <i>“You need to try [pc.him] yourself, dear.");
	if (pc.vaginas[hole].looseness() >= 2) output(" You can definitely tell [pc.he]’s a broodmother. So soft, wet and willing back there.”</i>");
	else output(" [pc.he]’s so tight - not used to being a breeder! [pc.he] needs someone big and loving and fertile to break [pc.him] in.”</i>");
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = pc.findEmptyPregnancySlot(1);
		if (hole2 < 0) hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	
	pc.cuntChange(hole2, ppRahn2.cockVolume(0));
	
	output("\n\n<i>“Yeah?”</i> The zel’rahn’s hands are upon your [pc.legs]; she coaxes you onto your hands and [pc.knees], wedged between them. You sigh as her fingers find [pc.eachVagina], fondling your well-opened twat" + (pc.vaginaTotal() > 1 ? "s" : "") + " with interest, then gasp as the crown of her ovipositor butts against your lips. She’s considerably bigger than her guy. <i>“And what are you going to do, whilst I’m doing that?”</i>");
	output("\n\nSomething bulky and moist bumps against your brow. You look up, and are confronted with the white rahn’s own ovi-cock, still erect, thick and ready. He smirks at you above it.");
	output("\n\n<i>“Give [pc.him] dessert, of course.”</i>");
	output("\n\nThey spit-roast you slowly at first, one phallus swelling into your [pc.vagina " + hole2 + "] whilst another is dipped into your mouth, enjoying you whilst getting you used to taking both of their sweet protrusions at once. Lust swarms over your senses from the stimulation of it, and you coax them on with ardent movements of your [pc.tongue] and [pc.lips] over his crown and pushing your [pc.hips] back into her, sinking your fingers into trim, gooey tush.");
	output("\n\nThey respond eagerly, laughing with glee as they take a firm hold of you and fuck you firmly in the mouth and cunt. You gaze needily up the flat, athletic front of the go’rahn, and he responds by gripping your [pc.hair] and slotting himself into the tightness of your throat, the smoothness and gooeyness of his ovipositor easily allowing him entrance into your air-hole. His partner huffs huskily as she pounds your [pc.vagina " + hole2 + "], her wide, wobbly thighs and gut bouncing briskly against your [pc.ass]. ");
	output("\n\nYou orgasm again there, transfixed on egg-cock, [pc.eachVagina] crimping up again and again to the ecstatic sensation of being so swollen with delicious egg-cock, huffing and whining around the one halfway down your neck. Your only dim thought is to pleasure your lovely hosts in every way you’re able.");
	output("\n\n<i>“Huff! Huff! Huff! Oh, it’s so good!”</i> moans the red rahn, thrusting that massive, malleable egg-tube into you deep. <i>“And I’m so - swollen - ”</i>");
	output("\n\n<i>“Give [pc.him] what [pc.he] came for, darling...”</i> groans her partner. She does so a few seconds later with an eye-crossing squelch, a huge load of fertilized eggs bulging up that long ovipositor stuffed inside and bulging your gut out with its thick, slimy warmth. It quickly backs up and squirts out heavily down your [pc.thighs], but she keeps going, bloating you with a reservoir of gel girl love.");
	
	breedwellPremiumCreampie(hole2);
	pc.loadInCunt(ppRahn2, hole2);
	pc.orgasm();
	
	output("\n\nShe reaches out and kisses her partner over you as she does it, and as they do so he cums too with a heartfelt bark, a similarly outrageous torrent of thick, sweet fluid swelling your cheeks out. Like a good [pc.boyGirl] you swallow it down, lips and tongue working around his girth to encourage him on, glad of this nourishment you’re going to need to bear the offspring");
	if (isPreg) output(" you’re already carrying.");
	else output(" his partner is currently amorously bulking you out with.");
	
	pc.loadInMouth(ppRahn);
	
	output("\n\nHe finishes by pulling out and spraying your face with the last of it, which you accept with an open mouth and outstretched [pc.tongue], following by a happy smile and lick of the [pc.lips]. Could you call yourself a Premium Breeder if you didn’t?");

	pc.applyCumSoaked();
	breedwellPremiumRecordSex();
	processTime(300);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTavrosCoupleNext2);	
}
public function breedwellPremiumBootyCallsTavrosCoupleNext2():void
{	
	clearOutput();	
	showBust("");
	showName("TAVROS\nCOUPLE");
	author("Nonesuch");	
	
	output("<i>“Mmm... I love doing this with you, darling!”</i> the zil’rahn trills, a few moments later. They have you between them, their squishy bodies sliding over your heated flesh as they cuddle each other around you. <i>“Sharing is so much fun! Oh, it’s a shame we can’t do it more often.”</i>");
	output("\n\n<i>“I’ll get that promotion,”</i> the go’rahn murmurs, <i>“and so will you. And then we’ll just buy ourselves a premium breeder, full time, and enjoy [pc.him] every single night. How does that sound?”</i> he asks you teasingly, brushing your [pc.hair]. <i>“We’ll only make you wear a collar if you want.”</i>");
	output("\n\nWell... not right now, anyway. You catch a shower with their blessing, and then head back out into Tavros, feeling distinctly fuller than you did before.");
	
	processTime(60);
	pc.shower();
	clearMenu();
	addButton(0, "Next", move,"RESIDENTIAL DECK 14");	
}

public function breedwellPremiumBootyCallsMyrellionQuickie():void
{	
	clearOutput();	
	showBust("");
	showName("MYRELLION\nQUICKIE");
	author("Nonesuch");	
	
	output("<i>“Hey! HEY! In here!”</i>");
	output("\n\nAlmost the moment you click accept, you are beckoned into a disused storage space by a slender, speckled loo’rahn in a UGC uniform. ");
	output("\n\n<i>“Thank the One you were just passing,”</i> she says, blinking at you. <i>“I’ve only got ten minutes left of my break and... can you give me a hand shandy real quick?”</i> She unbuttons her trousers, her heavily engorged orange egg-tube immediately swelling outwards like a prize zucchini. She groans in discomfort. <i>“Please.”</i>");
	output("\n\nEmploying all your expertise and professionalism to the situation, you get to work without another word, gripping the supple, squishy phallus and jerking it swiftly up and down. You keep your gaze locked on her pretty, speckled face, judging what movement of your hand in particular makes her groan in ardour.");
	output("\n\n<i>“Yeah... yeah!”</i> she cries, shoving her back against the wall and jerking her hips to it as you crank her hot, waggly meat hard. <i>“Fuck you, Sergeant Harris! Oh, what I’d give to bend you over a desk and fuck your prissy little boy hole!”</i>");
	output("\n\nRahn fluids throb under your hand and fountain spectacularly out of her engorged tip all over the dusty floor. You, a professional, saw it coming and are over to one side before they can hit you in the [pc.chest]. No need to get mucky on a short operation.");
	output("\n\n<i>“Th- thank you,”</i> she mutters, sagged against the wall and withdrawing her sagging balloon animal back into her. <i>“That was necessary. Uh... ignore everything that I said. And don’t tell anyone about this. Thanks again.”</i>");
	output("\n\nOf course. You’re a professional, after all.");
	
	pc.lust(30);
	processTime(10 + rand(10));
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
public function breedwellPremiumBootyCallsFlahne():void
{	
	clearOutput();	
	showFlahne(true);
	author("Nonesuch");	
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	
	moveTo("CUSTOMS OFFICE");
	
	output("You smirk when you see where the text coordinates are telling you to go. Surely there isn’t another rahn working in Esbeth spaceport? Nope. You find yourself walking straight into Flahne’s office.");
	output("\n\n<i>“Oh, hi there [pc.name]!”</i> the plump loo’rahn trills nervously. She fiddles with an unwrapped lollipop. <i>“So nice of you to drop by. I’m expecting an appointment though, so maybe - ?”</i>");
	output("\n\n<i>“You are, are you?”</i> You grin at her knowingly, leaning against the doorframe.");
	output("\n\n<i>“You - you!”</i> she says, eyes widening, hand shooting up to her neck. Her bust heaves delightfully. <i>“But... you don’t need to work for Tamani, [pc.name]! Why are you doing this?”</i>");
	// medium difficulty int check
	if (pc.IQ() > rand(75))
	{
		output("\n\n<i>She</i> doesn’t need call [pc.boyGirl]s, not working the front desk of a spaceport... not being the thoroughly friendly and voluptuous individual that she is! So why is she paying for the Premium Breeder plan?");
		output("\n\n<i>“It caught my eye, and... I thought I would help the Great Effort,”</i> Flahne mumbles, blushing. <i>“Every rahn should do their part, right? And... it excited me, [pc.name],”</i> she finally admits. <i>“What if my manager finds out I’ve been having call [pc.boyGirl]s in here?");
		output("\n\nOoh, it would be such a shame, such a scandal. What if I had to tell a court of arbitration about everything I’ve gotten up to in here...”</i> she blinks, mouth open, face glowing dark orange. <i>“...can we do it now? I really, um, I really do need it.”</i>");
	}
	else
	{
		output("\n\nYou shrug carelessly. Well, sure, you should be out somewhere on the Frontier, questing after daddy’s legacy. But all you really want to do is get down and dirty with as many big-dicked gel ladies as you possibly can... and you’ve found your perfect calling.");
		output("\n\n<i>“Ooh, you are <i>naughty</i> [pc.name],”</i> scolds Flahne with a big smile. She touches her stuffed bust again. <i>“Gallivanting around and being mucky instead of doing what you should be doing! I’ve got no choice but to stuff you full of my eggs. Maybe being an incubator will finally get you flying on the straight and narrow!”</i>");
	}
	output("\n\nYou close the door - but don’t lock it - and sashay across, loosening your");
	if (pc.isChestExposed()) output(" [pc.gear]");
	else output(" [pc.upperGarments]");
	output(" as you come. Flahne bites her lip, leaning back on her chair and watching as you clamber on to her desk, removing the rest of your ");
	if (pc.isCrotchExposed()) output(" gear");
	else output(" clothes");
	output(" so she can see the goods. She may have seen it before, but she’s no less turned on by it, as evinced by the thick, delicious bulge in the front of her skirt.");
	output("\n\nThe orange gel lady opens her thick thighs and lets her long, wet ovipositor ease outwards, giggling and sighing with delight when you take a firm hold of it, sliding your hand up and down it, then climb on top of her, making her chair creak as you slowly penetrating yourself on that lovely, girthy litheness, [pc.vagina " + hole + "] dripping and pulsing to the sensation of it.");
	
	pc.cuntChange(hole, flahne.cockVolume(0));
	
	output("\n\n<i>“Ooh,”</i> Flahne quivers, moist hands molding themselves around your [pc.butt] and back as you sink downwards, enveloping more and more of her pseudo-dick, <i>“you weren’t what I expected, [pc.name]... but this is ahhh, aaas nice a surprise as a girl could get.”</i>");
	output("\n\nYou rock on top of her, enjoying that expanse of soft, jiggling orange beneath you as you get what you need, your [pc.vagina " + hole + "] stretched full of rahn-cock, delivering wonderful little spasms of pleasure up your spine that urge you to ride her harder.");
	output("\n\nYou touch her pointed ears with your [pc.lips], whisper that if she’s giving you fertile eggs, she must have had someone else in here... she must have had someone else giving her the business another way. Would that be right? Did someone bend a big, jiggly orange ass over a desk recently?");
	output("\n\n<i>“You’re so... so naughty [pc.name]...”</i> she moans, clutching you hard giving back to you now. Your eyes roll upwards as orgasm shudders through you, that hard yet malleable ovipositor bending into your [pc.vaginaNoun " + hole + "] in <i>just</i> the right way to make it melt and force a slutty squeal out of your mouth. Fuck do you love rahn-cock.");
	output("\n\nThere’s a knock on the door, and the handle turns.");
	output("\n\n<i>“Ms. Flahne, did you see that email I...”</i>");
	output("\n\n<i>“Not now! Not now!”</i> she cries, wobbling delightfully. <i>“Appointment here! Later!”</i>");
	output("\n\nThe handle stops turning immediately. She may not want to be caught, but you’d guess Flahne’s extracurricular activities are becoming well known around here.");
	output("\n\nNot that you care. You care about tightening your [pc.thighs] around her, fondling her lovely, soft boobies and making her moan with delight, her ovipositor swelling mightily within you and then blooming a goopy, ripe load of eggs into your");
	if (pc.isPregnant(hole)) output(" [pc.vagina]");
	else output(" womb");
	output(". You simmer in the delightful sensation, rocking on top of her as her plump thighs slap reactively against your [pc.ass].");
	
	flahne.impregnationType = "RahnPregnancyBreedwell";
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(flahne, hole);
	flahne.impregnationType = "";
	pc.orgasm();
	pc.exhibitionism(1);
	
	output("\n\nYou sit for a little while like that with her, steaming together gently, before she shoos you off.");
	output("\n\n<i>“I... need to get back to work,”</i> she says. <i>“I can’t let anyone...”</i> she sighs as she watches you leave an alabaster trail of goop from your opened pussy all over the floor. <i>“...well, maybe I can get a galotian in here.”</i>");
	output("\n\nShe pulls you into a loving kiss, and pushes a lollipop into your hand before you go, though.");
	output("\n\n<i>“My naughty little surprise,”</i> she says with a shake of the head and a smile.");
	
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
public function breedwellPremiumBootyCallsTarkusMercs():void
{	
	clearOutput();	
	showBust("");
	showName("TARKUS\nMERCS");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(1);
	var ppRandom:PregnancyPlaceholder = breedwellPremiumGetRandomCock(4);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var hole2:int = -1;
	
	moveTo("302");
	
	output("The alert leads you into the crowds, noise and smells of the Mess.");
	output("\n\n<i>“Heeyyyyy there, good looking!”</i> smiles the zel’rahn perched upon the hulking cundarian’s knee. She is quite short and boyish, small tits pressing on a faded vest, her red head-fronds bunched into a pony-hawk. He is heavily-built, corded with blue muscle, tentacle locks flowing down his shoulders. Both are dressed in the bulky, well-used armor of mercs the galaxy over.");
	output("\n\n<i>“What did I tell you, small man,”</i> she says, poking him in the side. <i>“This app’s so convenient when you’re light years away from the nearest chicken coop. You’re telling me we could pick up anything as " + pc.mf("hunky","pretty") + " as that around here?”</i>");
	output("\n\nHe grunts, eyeing you up.");
	output("\n\n<i>“I dunno. You might not like shortstacks. I do,”</i> he says, squeezing her ample backside. <i>“But... I’m not gonna say no.”</i>");
	output("\n\nThey lead you to the quarters they’ve commandeered, a poky little space in the bowels of the ship that’s barely big enough for the three of you. Once it gets going though, once you’re sandwiched between thick muscle on one side and soft goo on the other, once they’ve ripped your [pc.gear] off and have started exploring your body with interest, big rough hands on your [pc.chest] and small slick ones between your [pc.thighs], you quickly forget about that. ");
	output("\n\nThey are as raucous, rough and enthusiastic as you’d expect, pushing you down on your hands and [pc.knees] so that they can spit-roast you, the zel’rahn’s thighs slapping against your [pc.ass] as she shove her tapered, knotted ovipositor into your unfurled [pc.vaginaNoun " + hole + "], pleasurable sensation pulsing into your core as you wrap your hands around the cundarian’s sheathed horse-dick and slather its blunt heads with kisses and licks.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\nHe isn’t as big as his frame suggests - possibly in consideration of his small partner - but that’s still a good ten inches of bulging, veiny meat you wedge deep into your mouth, looking up at him as you get your [pc.tongue] beyond your lips to lap at his balls.");
	output("\n\n<i>“Oooohhhh sky-shit, big girl,”</i> he groans, muscles trembling up his rippled front. <i>“What a mouth this one’s got! You have to try it...”</i>");
	output("\n\n<i>“I gotta, I gotta give it [pc.him] in the back end first,”</i> she responds, hands clutching your [pc.thighs] as she rams her bendy ovi-prick into you again and again, waves of motion carrying up your body, forcing you deeper onto the space-goat’s own dick. <i>“Gotta - give [pc.him] what [pc.he] came for...”</i>");
	output("\n\nShe trails off into an orgasmic croon, and your eyes cross as you feel that familiar, gorgeous sensation: your");
	if (pc.isPregnant(hole)) output(" cunt");
	else output(" womb");	
	output(" dilating with the thick, fertile rahn-eggs she is cannoning out of her with one ardent pump of her hips after another. The cundarian cums himself, bestial grunts vibrating off the walls as semen-foam blooms into your packed mouth like you’re sucking on a whipped cream dispenser. You crunch down on it easily, salt and musk that disappears down your hungry gullet.");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.loadInMouth(ppRandom);
	pc.orgasm();
	
	output("\n\nYou relax together for a little bit then, all stickily piled on top of the bunk that the pair have long since broken the legs of with their own exploits. A half-full bottle of something amber and fiery is passed around, and they tell you about some of their adventures on the frontier in exchange for yours. A lot of them sound like bullshit - on the other hand, you realize how absurd your own stories sound once they start leaving your mouth.");
	output("\n\nTipsy laughter echoes around the room, replaced by sighs when you lift the zel’rahn’s plump short leg and lap at her plump, soft pussy, soon coaxing a small stream of sweet juices out of her gulley onto your [pc.tongue]. The cundarian scootches up and watches wolfishly, pumping his stallion dick into a fresh erection as you bring his girlfriend to a shivering, spine-tingling orgasm.");
	
	processTime(15 + rand(15));	
	pc.imbibeAlcohol(20);
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	
	output("\n\nThen he bends you both over, giving it you in the");
	if (hole2 < 0) output(" [pc.anus]");
	else output(" [pc.vagina " + hole2 + "]");
	output(", hot, thick dick filling you up and beating against your tenderest spots until you clamp up tight around him, forced to another scintillating high with your [pc.ass] in the air; then he withdraws with a grunt and thrusts himself into the zel’rahn leaking, opened puss, taking full advantage of the groundwork you’ve done for him. You lie on your front, zoned out, holes gaping and drooling slightly, listening to the red rahn’s moans and squeals escalate to a squishy, energetic conclusion, her soft gel wobbling against your side.");
	
	if (hole2 < 0)
	{
		pc.buttChange(ppRandom.cockVolume(0));
		pc.loadInAss(ppRandom);
	}
	else
	{
		pc.cuntChange(hole2, ppRandom.cockVolume(0));
		pc.loadInCunt(ppRandom, hole2);
	}
	pc.orgasm();
	pc.applyPussyDrenched();
	
	output("\n\n<i>“Mmm... come back around this way if you get the chance, breeder,”</i> she says a little while later, lying on her side and watching you splash a bit of water over yourself from the tap and put your [pc.gear] back on. She pats her swollen midriff, and rubs her slumbering partner’s thigh. <i>“I’ll always have a nice load of fertile eggs ready for a " + pc.mf("handsome","sweet") + " bit of chicken like you.”</i>");
	
	if(!CodexManager.entryUnlocked("Cundarians")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Cundarian race.");
		CodexManager.unlockEntry("Cundarians");
	}
	
	processTime(30 + rand(30));	
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
//used in runOnEnter in tavros rooms.as
public function breedwellPremiumBootyCallsCheckTavrosAusar():Boolean
{
	if (breedwellPremiumBootyCallCheck("tavros station",1) && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing(1);
		return true;
	}
	return false;
}
public function breedwellPremiumBootyCallsTavrosAusar():void
{	
	clearOutput();	
	showBust("");
	showName("TAVROS\n‘RAHN’");
	author("Nonesuch");	
	var ppRandom:PregnancyPlaceholder = breedwellPremiumGetRandomCock(2);
	
	output("The signal leads you to the north west area of the commercial deck, a relatively clean and spacious set of shops.");
	output("\n\n<i>“Hello,”</i> says a figure, leaning against a wall near a gap between two stores. <i>“Are you my breeder buddy?”</i> ");
	output("\n\nShe’s an orange gel girl, dressed in plain office clothes, pert breasts and butt pressing gently against them. She grins as she eyes you, and with a certain, strange extravagance walks towards you.");
	output("\n\n<i>“I’m so glad you’re here!”</i> she oozes. <i>“I’m soooo pent up with my eggs, you see, as we rahn get...”</i> She tugs at her sleeve and darts her eyes at the alleyway. <i>“I’m so desperate, in fact, we’ll need to do it in this alleyway! That’s a thing we rahn do, you know. We’re very open and... so sexual.”</i>");
	output("\n\nA bit closer, you notice the gel girl has a nose, and her ears are blunt and floppy, rather than long and pointy. You put your hands on your hips and simply frown at her.");
	output("\n\n<i>“...is there something wrong? I thought Tamani hired people who were really into rahn. Which I am.”</i> The heavily modded ausar sighs. <i>“Alright, look. Do you think you could just... go along with it? It’s... it’s my thing, ok. I don’t mean any harm. Please?”</i>");
	output("\n\nYou sigh. Fine. You aren’t going to get eggs out of this, but presumably she can still give you a thumbs up. You put your perkiest expression on and tell her you can’t <i>wait</i> to relieve all that pressure she’s feeling. Because of all the eggs. She brightens up, and practically skips into the alleyway.");
	output("\n\nWhen you kneel in front of her and she unbuttons her skirt, a pointed, tapered cock with a thick bulb of meat at its base flops out and bops you on the face. You pull it to one side and glare up at her.");
	output("\n\n<i>“I’ve not gotten around to modding it,”</i> she mumbles. <i>“It’s, the tube ovi-thingy, it’s the hardest thing to... oh...”</i> she trails off as you begin jerking her, lightly fingering that ever-so-sensitive point as you smother the dog-gel-thingy in attention.");
	output("\n\nSighs tumble down to you as you spread your [pc.lips] over it, easily taking the rocket-shaped member into your maw. Well, she got one thing right - the fluid which beads over your [pc.tongue] as you pump your mouth up and down it are nice and sweet. You grip her knot firmly, alternating between firm, wet pumps and licking lavishes of her tip.");
	output("\n\nThe exhibitionist element of this clearly arouses her - people are going about their business not more than ten feet away from where you’re pleasuring her, and she keeps shooting looks that way, biting her fingers and gasping with delight.");
	if (pc.exhibitionism() >= 33) output(" As, to be fair, it does you. You see yourself as you are - a whore on [pc.his] [pc.knees], blowing a client where anyone could see [pc.him], and [pc.eachVagina] grow shamelessly wet at the thought.");
	output("\n\n<i>“Oh yes...”</i> she moans, eyes closed, hand gripping your [pc.hair] as she gets close. <i>“I get so heavy with eggs... I’m so slutty and needy, I’ll do it in public... uunnnngh!”</i> Thick sugar spurts deep in your mouth, knot throbbing against the saliva-seal of your lips. You work your mouth and throat with professional skill, wetly sucking her cum away at the same time as working her completely dry.");
	output("\n\n<i>“Thank you for your donation,”</i> you say, giving her your best smile once she’s unplugged herself from you.");
	output("\n\n<i>“It was my pleasure to help the Great Effort!”</i> she beams, tucking herself away. She shoots a nervous look to the entrance of the alley as you get up, and touches you on the shoulder. <i>“Uh... thank you. For doing that. Please don’t tell your boss. Please?”</i>");
	output("\n\nShe’s hurried away before you’re done dusting your [pc.knees] off.");
	
	if(!CodexManager.entryUnlocked("Ausar")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Ausar race.");
		CodexManager.unlockEntry("Ausar");
	}
	
	processTime(10 + rand(10));
	pc.loadInMouth(ppRandom);
	pc.lust(30);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();	
	pc.exhibitionism(2);
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
public function breedwellPremiumBootyCallsZhengShiTwofer():void
{	
	clearOutput();	
	showBust("");
	showName("ZHENG SHI\nTWOFER");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(7);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var hole2:int = -1;
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	
	output("This is hardly the place to go looking for a hook-up... but you’re a professional. If there’s some luscious, pent-up gel dick in here somewhere, it’s your job to find it and drain it. Cautiously, you follow the coordinates down a side passage into a grubby docking area. A group of Corona Lords working around a docked freighter turn to stare at you askance.");
	output("\n\n<i>“Oh fuck,”</i> says a deep, rich voice. <i>“A breeder! I completely forgot I still had that app turned on.”</i> It belongs to a masculine fuu’rahn, swaggering along the gantry from the opposite direction. He’s one of the biggest rahns you’ve clapped eyes on, well over six foot tall, lean but powerfully built (for a single-celled organism, anyway). He laughs, considering you with lively eyes.");
	output("\n\n<i>“You didn’t risk your ass to come all the way out here to do me, did you?”</i> the blue-and-green collosus asks. Shrugging, he");
	if (pc.tallness >= 82) output(" clamps his arm around your waist.");
	else output(" clamps his arm around your waist, then hoists you over his shoulder, [pc.ass] in the air. You stomach lurches.");
	output(" <i>“Well, whatever. I got a booty call to see to! See you losers later.”</i>");
	output("\n\nThe other pirates grumble resentfully and return to their duties.");
	if (pc.tallness >= 82) output("\n\nHe takes you into his quarters, dimly lit and littered in junk, trophies and soiled clothes, and pushes you onto the bed.");
	else output("\n\nHe carries you into his quarters, dimly lit and littered in junk, trophies and soiled clothes, and flings you onto the bed.");
	output(" You eye him somewhat nervously as he rips off his shirt and unclasps his armored bottoms.");
	output("\n\n<i>“Man, if you’re scared about me slapping a collar on you or something, don’t be.”</i> He lays his soft yet incredibly strong hands on you, slipping his hand");
	if (pc.hasTits()) output(" around your breast");
	else output(" down your flat chest");
	output(", squeezing you as flicks his long tongue over your [pc.skinFurScales], tasting you with interest. Inevitably you feel your heat building as he slides his other hand gracefully between the cleft of your [pc.thighs], tracing the lips of your [pc.vagina " + hole + "] before slipping inside, pushing two fingers gently into your tunnel.");
	output("\n\n<i>“If I wanted a slave fuck, I could get that easy. What I want, why I got the app...”</i> He pulls back, opens his thighs with a wet rumbling of lust. You stare as not one but two ovipositors sprout out from his groin, both easily 9 inches long and human-like in shape. He grasps them both, hefting them ponderously. <i>“...is to sow my wild oats. Pirates don’t last forever, y’know? While I’m out here, having fun, I wanna swell as many rusher bellies as I can. Even if I won’t know my kids, <i>I’ll</i> know they’re out there.”</i>");
	output("\n\nHe finishes in a lusty growl, diving on top of you, smothering you in thick, warm gel. Your [pc.ass] is hoisted into the air as he levers your [pc.legs] over his shoulder");
	if (!pc.isNaga()) output("s");
	output(", and then he spears his first dick into your [pc.vagina " + hole + "], working the smooth, sturdy member into your hole steadily, giving you plenty of time to soften and");
	if (pc.isSquirter()) output(" drool");
	else output(" drip");
	output(" [pc.femcum] in response, your pussy ever-eager for a warm, supple filling of gooey gel.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	if (hole2 >= 0)
	{
		output("\n\n<i>“Void-damn,”</i> he grunts, fingers trailing down your [pc.eachVagina]. <i>“Fucking love a [pc.boyGirl] who packs more than one.”</i> You sigh in anticipation, then moan as he lines his other ovipositor up with your [pc.vagina " + hole2 + "] and then works himself in, helped by a");
		if (pc.isSquirter()) output(" gush");
		else output(" trickle");
		output(" of [pc.femcum] that ensues as the sensation of getting");
		if (pc.vaginaTotal() > 2) output(" two");
		else output(" both");
		output(" of your pussies stuffed fulled of wiggly rahn dick overwhelms you. <i>“I’m gonna pack you... so... full of eggs.”</i>");
		pc.cuntChange(hole2, ppRahn.cockVolume(0));
	}
	else
	{
		output("\n\n<i>“Aww,”</i> he husks teasingly, fingering your [pc.clit] as he saws into you. <i>“Only one? Too bad.”</i> You gasp and then whine as you feel him rub his ovipositor between your buttocks, then line it up with your [pc.anus]. <i>“Guess I’ll have to fuck your ass instead.”</i> He grinds against your ring with the blunt, pre-slickened end, working his way in slowly but surely. You cry out as he triumphantly holsters a good five inches of wiggly rahn dick into your bowels all at once. ");
		pc.buttChange(ppRahn.cockVolume(0));		
	}
	output("\n\nYou ball the sheets into your hands as he fucks you enthusiastically, holding you up so he can plunge his double ovi-dicks into your");
	if (hole2 >= 0) output(" twats");
	else output(" pussy and ass");
	output(" deep, one long plunge after another. They stuff you and rub at each other through your walls, incredibly intense sensation, and you orgasm in a sudden, wet and prickly burst, moved to shout at him to keep doing that as your holes clamp up around him and pleasure rocks through your core");
	if (!pc.isNaga()) output(", waggling your [pc.feet] gleefully in the air");
	output(".");
	output("\n\n<i>“That’s it [pc.boy], nice and loud,”</i> groans the fuu’rahn, supple, muscular thighs slapping against your [pc.ass]. <i>“Let those lunkheads out there know how a real rahn fucks...”</i>");
	output("\n\nPassion hardening his features, he pulls out and twists you around, pushing you onto your hands and your knees, before screwing his thick, malleable pseudo-cocks back into your opened holes. Having thoroughly softened and widened you, he’s able to really let rip, growls and grunts storming out of his mouth as he pins you down and drives himself into your");
	if (hole2 >= 0) output(" cunts");
	else output(" cunt and asshole");
	output(" up to his groin, one hard pump after another. [pc.ass] in the air, eyes rolled, all you can do is flare your butt-cheeks and give some push back, willing that wonderful twin injection of hot, thick gel dick into you, making you squeal with delight.");
	output("\n\nHe takes hold of your [pc.hair] as he pushes himself in up to the hilts and cums, making you arch your back as goopy warmth pulses into");
	if (hole2 >= 0) output(" [pc.eachVagina]");
	else output(" your pussy and bowels");
	output(" in generous swells. You orgasm again to the sensation of it, your tunnels tightening up around him, willing every last sweet drop into your waiting");
	if (hole2 >= 0) output(" wombs");
	else output(" tracts");
	output(", and he rewards you with a pleased groan, a swat on the [pc.ass] and an extra large bloom of egg-cum.");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	if (hole2 >= 0 )
	{
		breedwellPremiumCreampie(hole2);
		pc.loadInCunt(ppRahn, hole2);
	}
	else pc.loadInAss(ppRahn);
	pc.orgasm();
	
	output("\n\nHe keeps thrusting into you until it’s spurting out thickly around his girth, both");
	if (hole2 >= 0) output(" of your pussies");
	else output(" your pussy and ass");
	output(" utterly packed out and stretched with fertile goop. He lets go and slowly slithers out of you, gushes of it following him outwards and down your splayed [pc.thighs].");
	output("\n\n<i>“Here,”</i> he says lowly, soothing, soft hands travelling down your back and hips. <i>“Let me have a look.”</i>");
	output("\n\nYou shift over on the bed and lie on your side, allow him to gaze at his handiwork - your [pc.belly] utterly swollen with his nascent eggs");
	if (pc.hasTits()) output(", your [pc.boobs] sitting on top of it");
	output(". You look at least 8 months gone. The ripped, masculine rahn beams at the sight. There’s a certain sad wistfulness in that smile.");
	output("\n\n<i>“Use the shower, if you like,”</i> he says. <i>“And... you get out Zheng Shi right away, ok?”</i> he goes on, as you crab-walk your throbbing way towards the bathroom. <i>“I can tell my guys to leave you alone. But this isn’t a place for a pregnant " + pc.mf("person","lady") + " to be hanging around. It would sure suck a lot if I found you in the slave pens later on.”</i>");

	pc.shower();
	processTime(60);
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}
public function breedwellPremiumBootyCallsTarkusStacey():void
{	
	clearOutput();	
	showBust("");
	showName("RAHN\nBIMBO");
	author("Nonesuch");	
	
	moveTo("ARBETZ POOL");
	
	output("What’s a rahn doing out here? It starts making sense when you see where the signal is leading you: the far north west tip of the landmass.");
	output("\n\n<i>“Oh, not you as well,”</i> gripes Una when you [pc.move] through the travel agency’s door, then on into the outdoor area.");
	output("\n\n<i>“Hiiiiiii!”</i> trills the loo’rahn sunbathing next to the swimming pool. She has long head-fronds and is decked out in shades and a fashionable one-piece swimsuit, painted on over her tight, orange curves. <i>“I just wanted someone to hang, and you looked cool in your profile. Treeka was meant to meet me here, but she’s late. She is SUCH a ditz. Hey Petr!”</i>");
	output("\n\n<i>“Hey,”</i> grunts the human walking past. The loo’rahn watches him go with a bright smile.");
	output("\n\n<i>“Isn’t he hot?”</i>");
	
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTarkusStaceyNext);	
}
public function breedwellPremiumBootyCallsTarkusStaceyNext():void
{	
	clearOutput();	
	showBust("");
	showName("RAHN\nBIMBO");
	author("Nonesuch");	
	
	moveTo("ARBETZ POOL");
	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(2);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	
	if (pc.isNude() || (pc.hasArmor() && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))) output("You");
	else if (pc.inSwimwear(true)) output("You strip down to your [pc.underGarments] and");
	else output("You strip and put some spare swimclothes on and");
	output(" sit yourself down on the lounger next to her.");
	if (pc.isBimbo()) output(" It’s so nice to sit in the sun with a kindred spirit! You lie there and happily natter with her about clothes, extranet icons, where it’s hot, where it’s not, cute videos of pets... the time just flies by.");
	else output(" The loo’rahn is a complete imbecile, but not a malicious one, and honestly, in the warm sun next to the gentle lap of a swimming pool, it’s easy enough to let her prattle.");
	output("\n\n<i>“I love that tattoo! Did they make you get it? Well, it totally suits your [pc.skinFurScales]! Hey there, Una! Have you lost weight? You’re looking sooooooo trim in that shirt!”</i>");
	output("\n\nThe gabilani grits her teeth. Her long ears twitch.");
	output("\n\n<i>“Petr. My room. Now.”</i>");
	output("\n\n<i>“She adores me, you know,”</i> the loo’rahn tells you conspiratorially, touching your arm. <i>“I can tell. I have that, kind of, sensitivity for people, you know. Oh! Oh dear.”</i> She giggles, embarrassed, as the rough, squishy sounds of sexual congress begin to float down from the opened windows of Una’s suite.");
	output("\n\nThe sounds do get her own juices running though, and running her hand down the slim curve of her calf she asks you about your career as a premium breeder. Each story is met with coy giggles.");
	output("\n\n<i>“That sounds soooo much fun! It’s not something I could do, though - I need to feel, like, an intimate bond with someone to have sex with them. Oh! Do you want my eggs?”</i> she asks, as if this had only just occurred to her. She shifts her one-piece to one side, and out of her mound sprouts her small, chubby ovipositor, oozing moisture at the tip. She sighs, fingers trailing over your [pc.chest] as you shift your hand over to it, giving it a few experimental pumps. <i>“You can, if you like. They might not be, like, fertile - although I guess I did blow that guy at the party two nights ago...”</i>");
	output("\n\nUna and Petr don’t sound like they’re going to be done anytime soon. You slither over to the loo’rahn’s lounger and mount her, clasping her firm boobies as you sink your [pc.vagina " + hole + "] down her stubby ovi-cock. Her sunglasses are knocked askew, allowing you to see her unfocused, transported eyes as you rock your [pc.ass] on top of her, pleasuring your entrance, [pc.femcum] soon sliding down your inner lips.");
	
	processTime(60 + rand(60));
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\nShe reaches out and grasps your [pc.ass], her mouth open as the heat intensifies, the growly, snarly sex from the windows above filling your ears, and then with a great shudder and a squeal the orange rahn cums, a thick squirt of oozing warmth released into your depths. She bucks under you a few times, thrusting her spurting ovipositor into you, a jiggling mattress of gel that finally relaxes with a sigh, a big goofy grin written on her round, noseless face.");	
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	output("\n\nYou’ve managed to give yourself a quick wipe from the swimming pool and rearranged your swimming clothes by the time a flushed Una comes striding out again, herself giving her office garb a straighten. The gabilani gives the two of you a suspicious look, but says nothing. The loo’rahn dissolves into giggles once she’s gone.");
	output("\n\n<i>“Oh hey, Treeka’s trying to get ahold of me,”</i> she says, checking her device. She touches your arm. <i>“Listen it’s totally lame, but I gotta go now, ok? Thanks for being a " + pc.mf("cool guy","doll") + " and chilling with me.”</i>");
	if (pc.isBimbo()) output("\n\nYou totally understand. You should check your codex to see what’s been happening whilst you’ve been doing sexy times with your new best friend, too. You blow her a big kiss as you’re leaving, and she returns it with one of her own and a wiggle of her fingers.");
	else output("\n\nShe launches into a phone conversation a moment later, having completely forgotten you’re there. You just hope the app reminds her to give you a thumbs up a bit later.");

	processTime(10 + rand(10));
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", move, "225");	
}
//used in runOnEnter in tavros rooms.as
public function breedwellPremiumBootyCallsCheckTavrosDomme():Boolean
{
	if (breedwellPremiumBootyCallCheck("tavros station",2) && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing(2);
		return true;
	}
	return false;
}
public function breedwellPremiumBootyCallsTavrosDomme():void
{	
	clearOutput();	
	showBust("BREEDWELL_DOHRAHN_BUSINESS");
	showName("LAVENDER\nLEVERAGE");
	author("Nonesuch");	
	
	moveTo("TAVROS_TEMPO");
	
	output("The coordinates lead you to a trim, anodyne set of business offices on the south side of the commercial district. Lavender Leverage? You step into the intimidatingly clean and opulently furnished reception. Man, there’s even a water feature in here.");
	output("\n\n<i>“Excellent,”</i> says the holo-bespectacled, business-suited do’rahn in her smooth, calm voice waiting at the entrance. <i>“I thought I recognized you in your profile.”</i>");
	output("\n\nIt takes you a moment - but then the memory of being stuck in a breeder harness and watching this rahn very slowly take her clothes off, assaulting you with gales of her powerful pheromones comes back to you, and your heart lurches. She smirks, and slides her crisp cotton shirt down just a little, enough to give you the tiniest whiff of musky spice. It’s enough to make heat and moisture rush to [pc.eachVagina].");
	output("\n\n<i>“Yes. You remember.”</i> She swivels on her heels and strides towards the stairs. <i>“Follow.”</i>");
	output("\n\nYou follow her tight scrunch of her skirt-clad ass up the stairs. It’s as if you’re being carried along by her scent. It seems to reach inside your brain, that cloying, sexual smell, and twitch at your deepest impulses, making you powerless to do anything but follow and obey. And drip. ");
	output("\n\n<i>“We are down a couple of office relaxers today,”</i> she explains breezily, once she’s led you into a kind of cloakroom on the second floor. <i>“It won’t do. A premium breeder is an adequate substitute. And an investment in the future. Put this on.”</i>");
	output("\n\nShe hands you a white, short-sleeved cotton shirt and a short black skirt. Appropriate office wear - just about. Your [pc.skinFurScales] prickles when you feel just how much of it is on display once you’ve button it all up. The do’rahn briskly clips a tight-fitting metal collar around your neck. ‘Office Relaxer. I’m here to help!’ reads the dangling tag.");
	output("\n\n<i>“You can start on the third floor,”</i> she says, glancing at her phone. <i>“I’ve got a meeting - you are to report to my office in five hours time. Your performance will be reviewed then.”</i>");
	output("\n\n<i>“Uh... what do I do?”</i> you ask, touching the collar and watching her do that tight swivel and stride of hers.");
	output("\n\n<i>“Do?”</i> She pulls down her holo-glasses and gazes at you. <i>“Whatever you’re told, of course. I mean, it’s not like a pheromone-drenched, dedicated rahn bottom like you can do anything else is it?”</i> She waves her arm at you, and smirks as you whimper, [pc.femcum] drooling down your inner thighs. <i>“Bark. Bark like a bitch.”</i>");
	output("\n\nYou struggle for a moment, that incredible, overwhelming rush of scent that makes your body and mind feel so sensitive and soft, fighting a one-sided battle with your dignity.");
	output("\n\n<i>“... woof,”</i> you mumble, cheeks burning. <i>“Bark bark bark.”</i>");
	output("\n\n<i>“Good [pc.boy]!”</i> the do’rahn coos. <i>“You carry that attitude around for the next little while and you’ll do fine. Ciao for now.”</i>");

	flags["BREEDWELL_PREM_BADEND_LAVLEV"] = 1;
	
	processTime(30);
	pc.lust(30);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTavrosDommeNext);	
} 
public function breedwellPremiumBootyCallsTavrosDommeNext():void
{	
	clearOutput();	
	showBust("");
	showName("LAVENDER\nLEVERAGE");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(4);
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var rn:int = 10 + rand(10);
	var rn2:int;
	
	output("It’s all do’rahn. All purple, scented gel women, all dressed in intimidating business suits, from the fifth floor to the ground. How is that even possible?");
	output("\n\nThere are a lot of things that don’t seem possible about Lavender Leverage, but as you feel your way into your role as Office Relaxer, some parts of it start to make more sense. There is serious business taking place here - mergers, buy-outs, lobbying taking place on a planetary scale, livelihoods and vast amounts of credits winking in and out of existence at the twirl of a stylus in a gooey, purple hand. ");
	output("\n\nThis is an incredibly stressful, tetchy workplace, and the staff need... relaxation. On a constant basis. A rahn will finish a six hour long session pulling as much stock out of a solar system predicted to crash as possible by bending you over a desk, hoiking your skirt up, and fucking you with wild abandon. Your [pc.vagina " + hole + "] will spasm and spurt [pc.femcum] gleefully around her thick ovipositor until, with an almost pained groan, she holsters it entirely within you and spurts her heavy, goopy load in deep. Once you’re done, you wipe clean her leaking ovi-cock and the office equipment and then hurry on. She’s already settled into the next load of work, and somebody new is already pinging you.");
	output("\n\nThe role of Office Relaxer is diverse - a real gap filler. Sometimes you’re needed to sit in the corner and take notes at a meeting. Sometimes somebody just wants a coffee made. Sometimes a middle manager’s temper has run over, and she needs someone to strip her down, gag her, tie her wrists to metal links built into the ceiling, and stripe her back and ass with a riding crop, issuing gratified, muffled barks as you send pleasant waves of purple flesh this way and that with one well-directed blow after another. ");
	output("\n\nOn several occasions you see things - vid-conferences in darkened offices, glimpses of funds moving in strange ways, email exchanges with UGC officials - that you’re pretty sure you aren’t meant to see. The uneasiness you feel combines soupily with the pheremonal haze you’re swimming in, that sexual spice that’s always in your mouth and nostrils, making you docile and horny and happy to just be around the perfumed rahn, doing whatever they say, touching their soft flesh, thrilling at their oozing, supple ovipositors stretching your holes. You begin to see why the two might go together.");
	output("\n\nThis culminates in you serving at a particularly high-powered meeting of execs with another Relaxer. Some of the things being said above that matte black table top should make your skin crawl, but the only thing that matters is the thick, pliant pair of thighs your face is buried between, lapping at the gaping, oozing, grape wonder of the executive’s pussy. What matters is carefully coordinating with the saeri girl whose pert thighs and ass your own [pc.thighs] and [pc.ass] are tightly bound to, the double-ended dildo stuffed into your pussies vibrating away, so that you can service two do’rahn on opposite sides of the table at the same time. The meeting goes on for hours. You are shuffling through puddles of [pc.femcum] by the end.");
	output("\n\n<i>“That was... productive,”</i> sighs one, when it’s finally over and you’ve been untied. She clasps the shoulder of the saeri. <i>“I’m gonna take this one into the rec room for a little afters. That one only a loanee? Aw, shame. Lovely tongue on [pc.him].”</i> ");
	output("\n\nShe gives you a brisk slap on the [pc.ass], and you feel a glow of accomplishment.");
	
	for(var y:int = 0; y < rn; y++)
	{
		rn2 = rand(4);
		if (rn2 == 0)
		{
			pc.lust(30);
			pc.loadInMouth(ppRahn);
			if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
		}
		if (rn2 == 1)
		{
			pc.buttChange(ppRahn.cockVolume(0));
			pc.loadInAss(ppRahn);
			pc.orgasm();
		}
		else
		{
			hole = pc.findEmptyPregnancySlot(1);
			if (hole < 0) hole = rand(pc.vaginaTotal());
			pc.cuntChange(hole, ppRahn.cockVolume(0));
			breedwellPremiumCreampie(hole);
			pc.loadInCunt(ppRahn, hole);
			pc.orgasm();
		}
	}

	pc.exhibitionism(2);
	processTime(300);
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTavrosDommeNext2);	
} 
public function breedwellPremiumBootyCallsTavrosDommeNext2():void
{	
	clearOutput();	
	showBust("BREEDWELL_DOHRAHN_BUSINESS");
	showName("LAVENDER\nLEVERAGE");
	author("Nonesuch");	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(4);
	var hole:int = rand(pc.vaginaTotal());
	
	output("You find your mentor in her glass-and-marble-heavy office, and begin your performance review. You kneel beneath her desk as she taps at her lap device, [pc.lips] stretched around thick, delicious egg-tube, head bobbing enthusiastically. You <i>really</i> want that recommendation.");
	output("\n\n<i>“Mmm,”</i> she says crisply. <i>“Almost uniformly positive feedback for you. Almost. That’s very strong work for an intern. I’m only going to have to discipline you a little bit.”</i> She leans back, bosom heaving against her suit, mouth opening as you take her deep, [pc.tongue] sliding right down her gel shaft. <i>“That’s it, piggy, you work for it, you get what you need... uungh!”</i> She clutches your [pc.hair] as she cums, ensuring that every last drop of pheromone-laden egg-goop that she throbs out courses down your neck. You coo woozily when she withdraws, your head a morass of submissive bliss. You do everything she orders you to do next in a sultry cloud of happiness.");
	output("\n\n<i>“Tamani will make you another offer, eventually,”</i> the do’rahn intones. You feel the vibrating rod dip between your [pc.thighs], and you whimper through the ball gag as she toys with your [pc.vagina " + hole + "], passing it over your throbbing [pc.clit " + hole + "]. You are hog-tied with strong cord, dangling from a metal link fixed to the office’s ceiling. You are blindfolded by a black kerchief that reads OFFICE RELAXER IN TRAINING. PLEASE TAKE A MOMENT TO TEASE ME! across it. You know, because you put it on yourself. The calm, smooth words of your do’rahn boss march into your ears as she moves the vibrating rod over your [pc.nipples]");
	if (pc.isLactating()) output(", making them swell and leak [pc.milk].");
	else output(", turning them into hard, tender points.");
	output("\n\n<i>“They usually do, to their highest performing breeders; Tamani prefers to have them in-house. They’re invested in the whole Breedwell scheme not just to test new products, but to find fresh lab rats. I’m going to make you a counter-offer.”</i> Her lips touch your ear. <i>“Come to us, instead. You belong under a desk, not in some laboratory. Perform as well as you did today and I’ll turn you into my personal bitch. Your life will be exquisitely painful.”</i> She bites your earlobe and pulls at it, as she withdraws.");
	output("\n\n<i>“One way or another, you’re going to end up with a corporate logo on your ass.”</i> She slaps it hard, making you jolt and moan through the saliva-clogged ball gag. <i>“With Lavender Leverage, you’ll be getting the personal touch. Think about it.”</i>");
	output("\n\nShe sighs, and you hear her tap on her holo screen.");
	output("\n\n<i>“Business calls. I’m going to hang you in the foyer. For half an hour, the least amount of time. You earned that.”</i>");

	pc.exhibitionism(1);
	processTime(15 + rand(15));
	pc.lust(30);
	pc.loadInMouth(ppRahn);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();	
	clearMenu();
	addButton(0, "Next", breedwellPremiumBootyCallsTavrosDommeNext3);	
} 
public function breedwellPremiumBootyCallsTavrosDommeNext3():void
{	
	clearOutput();	
	showBust("");
	showName("LAVENDER\nLEVERAGE");
	author("Nonesuch");	
	
	moveTo("9014");
		
	output("Somebody does eventually let you down. Somehow, you wind up outside the corporate office in your [pc.gear], barely able to stand, [pc.eachVagina] and [pc.nipples] throbbing painfully, still sluggish and tipsy with pheromones. You turn to look at LavLev’s facade: utterly innocuous, blandly corporate. Slowly, you take in just how many glass or synth-marble financial offices there are in this part of Tavros. They all look exactly the same.");
	output("\n\nThe air touches your bare neck, where the collar was. You [pc.move] away as fast as possible. The spicy smell, though, lingers.");

	processTime(30 + rand(15));
	soreDebuff(2);
	breedwellPremiumRecordSex();
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
} 
