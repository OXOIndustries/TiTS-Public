//[DUN] Futa / Muscles / Angels, Bukkake, Cumflation, and of course big horsecocks.
//Lightfinger

//Futangels come down, informing you that you are dirty and need to be cleansed, they then proceed to lift their habits, revealing chiseled bodies and big, fat, equine members. Bukkake culminating in massive, oral cumflation.
//So futa muscle angel with a horsecock...

public function dreamChances():Boolean
{
	var dreamed:Boolean = false;
	var dreams:Array = new Array();
	if(flags["DREAM_CD"] == undefined) flags["DREAM_CD"] = 0;
	//Special Dreams
	if (pc.hasStatusEffect("Queen Pregnancy State"))
	{
		if (pc.statusEffectv1("Queen Pregnancy State") > 0 && flags["Queen Message Supression"] == undefined && (flags["Queen Dream Last Day"] < days || flags["Queen Dream Last Day"] == undefined))
		{
			eventQueue.push(queenDreamEvent);
			flags["Queen Message Supression"] = 1;
			flags["Queen Dream Last Day"] = days;
			dreamed = true;
		}
	}
	//If you havent dreamed in 20 days, and didnt get a special dream
	if(!dreamed && days >= flags["DREAM_CD"] + 20 && rand(4) == 0)
	{
		if(MailManager.isEntryViewed("lets_fap_unlock"))
		{
			dreams.push(angelDreamGo);
		}
		if(venusSubmission() >= 65)
		{
			dreams.push(venusDreamyButtStart);
		}
		// On board ship-related dreams
		if(currentLocation == "SHIP INTERIOR")
		{
			//Anno shotgun weddings
			if(annoIsCrew() && flags["MET_SYRI"] != undefined && flags["CREWMEMBER_SLEEP_WITH"] == "ANNO" && pc.hasCock()) dreams.push(shotgunWeddingDream);
			//Reaha dreams
			if(reahaIsCrew() && pc.hasCock() && flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") dreams.push(reahaDreamSequenceForNerdsByNerdsDesignedByNerdsToArouseNerdsForNerdpletion);
		}
	}
	if(dreams.length > 0) 
	{
		if(!dreamed) eventQueue.push(dreams[rand(dreams.length)]);
		dreamed = true;
	}
	if(dreamed) flags["DREAM_CD"] = days;
	return dreamed;
}


public function angelDreamGo():void
{
	clearOutput();
	showName("\nANGELS...");
	showBust("");
	output("You awake to the light of a bright-burning sun in your eyes. The softness of the bed you once laid upon is replaced by fluffy yet somehow solid clouds. High above is a sky bluer than a robin’s egg and seemingly endlessly vast, stretching around below you as well as above. There’s no sign of land or even a planet to be found. Stumbling up on your [pc.footOrFeet], you look around in a panic, searching for something, anything familiar, but there is nothing to be found. Not a ship, not a holoconsole, not a single other person.");
	output("\n\nWell, except for those angels fluttering down from out of the sun’s glare.");
	output("\n\nWait... angels? Cupping your hand to shield yourself from the unearthly radiance, you piece together the details of their forms: tall statuesque bodies clad in heavy, gold-accented robes, eyes glowing like a cloudless morning, immaculate blonde hair, and yes... radiant halos of pure light. Wings more majestic any siren’s casually flutter behind them, casting no breeze and yet somehow holding their charges aloft. Your mouth gapes open, and you make no move to close it. This is insane.");
	output("\n\n<i>“[pc.name]!”</i> Booms a voice like a brassy warhorn.");
	output("\n\nYou clap your hands to your ears in pain, doubling over from the intensity of her voice. Just hearing her talk is like standing next to a heavy freighter while it lifts off.");
	output("\n\n<i>“Sorry,”</i> the lead angel whispers, putting a gentle hand on your shoulder as she apologizes. <i>“It is easy to forget how fragile you mortals are. Do not be afraid of us. Be afraid of the corruption within you.”</i> She squeezes, so strongly that it’s almost harmful, casually pushing you to ");
	if(pc.hasKnees()) output("your [pc.knees]");
	else output("the ground");
	output(". <i>“You are tainted. The seething darkness within you could infect an entire realm if not purified, even cast down gods in time. We have seen it happen before, in another land, and we will not see it happen again.”</i>");
	output("\n\nAwestruck, you ask, <i>“Can you purify me?”</i>");
	output("\n\nThe angelic archon releases your shoulder and lifts your chin, smiling beatifically. <i>“Of course we can, child. Enough holy essence can wash away even the foulest taint, but it must applied thoroughly, without and within.”</i>");
	output("\n\n<i>“Essence?”</i> You look at her curiously. You’ve never heard such an expression before.");
	output("\n\nThe angel pats your head and laughs, <i>“Yes child... essence.”</i> Pulling her robe to the side, she reveals her angelic form. She is both curvy and muscular, chesty and strong. She’s the kind of girl who could bury your head between her breasts and pin you there until you suffocated... and she’s got a cock. A big, fat horse-cock, to be specific. It is completely at odds with the rest of her appearance. Where she has skin like polished marble, it has sweat and musk, its veiny surface pulsating in a decidedly un-angelic way.");
	//Bimb!
	if(pc.isBimbo()) output("\n\nOhh, why didn’t she just lead with that! It looks super delicious, and yummier than an ice-cream sundae... with cum on top! Licking your [pc.lips], you open wide and await your purification.");
	//Normal
	else output("\n\nYour head swims. This isn’t right, is it? But the smell... it’s like walnuts and ocean salt, only dizzyingly potent. Your whole body flushes just from the smell of it, so thick you can taste it on your tongue. Even stranger, you realize just how much you want to taste it on your tongue.");
	//Merge - new PG.
	output(" The rest of the divine choir tosses aside their robes, revealing a bevy of bestial behomoths, every single one of them just as big and fragrant as their leader’s, but they are far from identical. Some are jet black, others pink, and some mottled.");
	output("\n\nThey press in on all sides. You ");
	if(pc.isBimbo()) output("stretch out your hands, eager to play with such benevolent boners. The moment you make skin to skin contact, you shudder, reveling in the holy hotness pulsing against your fingers.");
	else output("hold out your hands, ostensibly to push them away, but the minute you feel the benevolent boners touching your palms, you squeeze them right back.");
	//[Next]
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",angelFutaBukkakePart2);
}
public function angelFutaBukkakePart2():void
{
	clearOutput();
	showName("\nANGELS...?")
	showBust("");
	output("<i>“Corruption may also be burned out with heat,”</i> the lead angel proclaims, snapping her fingers. Her halo bursts into fire, and her cock surges, growing several inches longer in the span of a single heartbeat. Its rich, pheromonal scent doubles, and your [pc.skin] feels hot. The barest breeze is like feathers stroking your molten skin. Sweating profusely, you stare in wonder, licking your lips unthinkingly. You aren’t sure if its the corruption within you or the angel’s own unholy power that’s making you crave her cock so powerfully, but you don’t care much either way. It’s too hot to think. Too hot not to pant.");
	output("\n\nThe archon’s cockhead swells fatter and fatter, then spurts a trickle of brilliant white fluid. It slaps into your lips, splattering across your face, painting you in a layer of glowing goo. She strokes herself, willing more of her silvery pre-spunk to spurt forth, and then, midway through a squirt, she presses her flare to your [pc.lips], forcing you to kiss the pebbly flesh of its rim. True to its name, it flares wide, stretching your mouth open as it’s fed inside, making you gurgle perversely.");
	output("\n\nWith your attentions almost entirely focused on the holy creature’s unholy beast-cock, you’re surprised to discover that your arms are starting to get sore. Not from the position you’re in but from the way you’re furiously pumping the circle of dicks around you. They’re thrust at you so lewdly, their animalistic tips leaking more of that blessed liquid over your hands, wrists, and arms. You panic briefly, unable to decide on which ones you should focus on, darting from dick to dick to dick, never giving one more than a half-dozen affectionate strokes before journeying on to the next. There’s just too much dick!");
	output("\n\nWarmth surges in your throat, pouring down your esophagus, ");
	if(!pc.isBimbo()) output("smoothing away your gag reflex and your panic along with it");
	else output("making you so glad for your suppressed gag reflex as it smooths away your panic");
	output(". Your eyes drift closed, and that perfect, creator-blessed horse-prick burrows in along its lubricated path, briefly bulging your neck in a clear imprint of its distinctive shape. Strong hands with stronger fingers grab your arms, wrap your digits around the closest dick, and frantically pump you back and forth along the lucky equine phallus. The same is done to your other hand. Balls clap against your chin, forcing your nose to push up into her leather sheath.");
	output("\n\nYou swoon, drunk on the archon’s scent, feeling her cohorts clench in your hands and unload, dizzy and hot, so very hot. It feels like the divine spooge splatting into your [pc.skinFurScales] is sizzling from your heat. The balls on your chin pulse, and your tongue gives an answering swirl. Your arms are passed around to the next pair of angels, pressed into the unyielding, veiny flesh and forced to stroke once more. Flaring your nostrils, you suck in a desperate breath, drunk on the resplendent being’s bestial cock-stench, allowing yourself to be used... purified... whatever.");
	output("\n\nThey could bend you over and ram one up your asshole, and you wouldn’t complain. A wave of brilliant goo cascades over your [pc.hair]. Simultaneously, a geyser of purifying cum bathes your flank. Your hands are pried off the trembling lengths mid-orgasm, no matter how tightly your fingers clutch at them, and forced to serve new masters. These ones go off immediately, like they’ve been edging this whole time, getting off to watching you deep-throat their mistress, ready to explode the moment they brushed your pinkie.");
	output("\n\nThis time, the cum doesn’t stop. You are bathed in it, anointed in it, baptized in a swimming pool of angelic nut-butter. Better still, the dick in your mouth is bulging, its urethra straining, expanding, pumped full of a sticky snack for your corrupted middle. It goes off like a cannon, making your [pc.belly] burble and expand. It’s flooding you, pumping what must be gallons of angelic essence forcefully into your very soul. You can feel yourself expanding with it, not just physically but completely, becoming greater, holier, more fit to serve the galaxy and these gifted girls.");
	output("\n\nWhite-glowing juices blind you, but you don’t need to see with your eyes. You can see with your own blinding radiance, ignited by these divine creatures’ offerings. Every cummy splash is a declaration of your own divine purpose, a reminder that you exist to serve the universe’s whims. Your spirit drinks in the cum right alongside your belly, and just when you feel fit to burst, you cum.");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",angelFutaBukkakePart3);
}

public function angelFutaBukkakePart3():void
{
	clearOutput();
	showName("\nWAKING...");
	showBust("");
	output("You wake up, shuddering in the throes of bliss. What a dream!");
	pc.orgasm();
	if((pc.hasCock() && pc.cumQ() >= 30) || (pc.hasVagina() && pc.isSquirter())) 
	{ 
		output(" If only it hadn’t left you so plastered in ");
		if(pc.hasCock() && pc.hasVagina()) output("[pc.cum] and [pc.girlCumNoun]");
		else if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
		output(". You’ll need a shower for sure.");
		if(pc.hasCock() && pc.cumQ() >= 30) applyCumSoaked(pc);
		if(pc.hasVagina() && pc.isSquirter()) applyPussyDrenched(pc);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno Wedding Dream
//Summary
//A wet dream that occurs for dick-having PCs after talking with Syri and having Anno move onto the ship and share a bed. PC has a very strange dream about Syri and a few other Ausar hosting a shotgun wedding, forcing them to marry Anno and fuck in front of the whole assembly of wedding guests. PC will grow a knot in the dream if they don’t have one. I figure even if that’s clumsy, it’s better than excluding non-knotted PCs. Also, no cock size requirements or height restrictions. The magic of dreams, people!

public function shotgunWeddingDream():void
{
	clearOutput();
	author("Night Trap");
	showName("SYRI\n& ANNO");
	showBust("SYRI","ANNO");
	output("It feels like you only just fell asleep when you hear a familiar voice behind you. <i>“Did you think we wouldn’t find out [pc.name]? That we’d be tolerate this sort of behavior?”</i> Is Syri in your cabin right now? No, you remember: you’re on Ausaril, standing at the altar of a temple that has been decorated for a wedding. Your wedding!");
	output("\n\nYou adjust the bowtie on your tuxedo and turn around, only to be greeted by the sight of Syri wearing her own similar tuxedo and propping an antiquated shotgun on her shoulder. She is flanked on both sides by a nondescript but imposing ausar man, each with an identical outfit and firearm. The black-haired beauty is practically snarling at you, her pretty features twisted in a frightening mixture of anger and disgust. <i>“You’ve been gallivanting around with my sister, living in sin with her all this time. Well we’re finally going to force you to make an honest woman of her; it’s time for you two to tie the knot!”</i>");
	output("\n\nYou nod at her with a nervous smile, trying to placate her as she continues. <i>“This wedding is going to be mostly in the old Terran style, but there are going to be some key traditional Ausar elements to it. ");
	if(silly) output("I hope you don’t mind that the catering is garbage and old tennis balls. ");
	output("You’d better do this by the letter if you don’t want to make Anno a widow on her wedding day! Now get ready. The ceremony is about to start.”</i> With that she gives you a light shove and gestures for you take your position next to the priest.");
	output("\n\nAs soon as you regain your balance and fix your jacket, a massive pipe organ begins playing music. Down the aisle of the temple walks Anno in a beautiful white wedding dress and matching veil. It briefly crosses your mind that white is traditionally reserved for virgin brides, but you think better than to give voice to this thought. Anno is holding a ");
	if(silly) output("pork femur");
	else output("bouquet of white lilies");
	output(" in front of her as she slowly walks towards the altar. The music peaks as your snow-white bride-to-be takes her place across from you, and you notice the train of her dress is subtly moving back and forth. She must be wagging her tail under there.");
	output("\n\nYou shuffle nervously as the organ finally stops playing and a tall ausar priest begins his speech. You don’t really process the words he’s saying, his sermon moving by in a blur. Finally though, he gestures to you and asks <i>“Does the groom have the symbol of union?”</i> You panickedly pat your pockets for a moment before you feel a tap on your shoulder. You glance over to see Syri handing you a bundle of cloth with a growl. With no small amount of relief, you accept it and unwrap the cloth. Inside, you find a black leather collar, studded with diamonds, with an attached golden heart-shaped tag engraved with the words Anno Steele.");
	output("\n\nYou look around in confusion. Shouldn’t this be a ring? Before things can get too awkward though, your bride steps forward, the blush on her face actually visible through her veil before she lifts it. She gives you a subtle gesture indicating you are supposed to put it on her. You quickly fasten the collar around her slender neck, after which the priest continues speaking. <i>“I now pronounce you, Mr. and Mrs. [pc.name] Steele. You may now kiss the bride.”</i>");
	output("\n\nClosing her eyes, Anno leans toward you slightly with her lips pursed. You move in to deliver a chaste kiss to her, but as soon as your lips touch those of your blushing bride’s she puts a furry arm behind your head and pulls you in for much more than you bargained for. Her lips practically smash your own [pc.lips] as her tongue invades your mouth, overwhelming your [pc.tongue] in the process. Anno smothers you with a meltingly-hot french kiss that sends you swooning. You’re so surprised by this that all you can really do is stand there and take it. The raunchy tonguefuck goes on for what feels like ages, until just as you think you are about to go hypoxic, Anno finally breaks the kiss and releases you, a strand of saliva connecting your lips for a few moments before gravity breaks it.");
	//[Next]
	clearMenu();
	addButton(0,"Next",shotgunWeddingDream2);
}

public function shotgunWeddingDream2():void
{
	clearOutput();
	showName("SYRI\n& ANNO");
	showBust("SYRI","ANNO");
	author("Night Trap");
	output("The assembled ausar clap and - howl? Even to your oxygen-starved mind that seems wrong. Before you can catch your breath or think about this strange turn however, the priest raises a furred hand, silencing the crowd as he solemnly intones <i>“You may now <i>lick</i> the bride.”</i> Utterly bewildered now, you simply stare at the priest until you hear a sound that makes your hairs stand on end: a shotgun racking a shell. Syri growls out to you <i>“I said by the numbers, Steele. If you wanted to fuck an ausar girl, you should’ve researched what a proper ausar marriage was first. Now get on your knees!”</i> Does she mean what you think she means? In answer to your question, Anno steps forward with a toothy smile and gently pushes down on your shoulders with one hand while raising the hem of her wedding dress with the other, revealing a snowy-furred leg with a lacy garter on it. Your face practically combusts as you flush scarlet. The thought of eating out your bride in front of all these people, including her family and friends, fills you with ");
	if(pc.exhibitionism() >= 66) output("unspeakable arousal.");
	else if(silly) output("Determination!");
	else output("profound shame.");
	output(" You dutifully sink to your knees and crawl under Anno’s dress, letting her drop the hem down again as you do.");
	output("\n\nYour first breath in your new cloth oubliette overwhelms you with the scent of lilies and aroused female. You notice that your knees are wet before you feel a warm, slimy droplet hit your face. Although it’s too dark to see, you realize immediately what’s happening: Anno is hornier than she has ever been; she’s almost trickling, and you’re practically being showered in her girlcum. After just a few moments though, Anno taps you urgently with her leg, an obvious signal to get started. You begin just above her knee, your [pc.tongue] following a stream of your bride’s liquid lust upwards to her blooming flower. Her flavor is utterly divine. It’s possibly the best thing you’ve ever tasted. You can sense with your oral organ that her lips are already slightly parted, and her clitoris is standing proud, begging for attention. Eager for more of her nectar, you trace the outline of her mound before working inwards and tracing her lips. You relish every droplet of sweet, sweet arousal you find before moving your [pc.lipsChaste] to the top of her pussy, sealing off her precious pearl with a sucking kiss. You hear a whine as her thighs suddenly clench around your head, covering your [pc.ears]. You place your hands on her thighs to steady yourself and relieve some of the crushing pressure in preparation for your next move. You release her clit from your kiss and move lower down again, working your tongue into her channel proper.");

	//PC has normal tongue:
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
	{
		output("\n\n You move your head back and forth to grind Anno’s pleasure buzzer as you prod the sides of her love-tunnel with your [pc.tongue]. Your ministrations bear fruit almost immediately: Anno’s trickle turns into an actual stream of femlube, and you have to start immediately swallowing to avoid drowning. You alternate between swirling your tongue in rapid circles inside her and lapping at her pussy like");
		if(pc.catDog("nyan", "bork", false) == "bork") output(", appropriately,");
		output(" a thirsty dog lapping at water: your tongue powerfully stroking her pearl at the apex of each lick, pulling back her hood.");
	}
	//PC has long tongue:
	else output("\n\nYour inhuman tongue slithers into her love-tunnel like a self-lubricated cock. You just keep unfurling more and more oral muscle into Anno until you reach her cervix. After giving it a few loving little flicks, you sensuously withdraw your muscle until it’s completely outside of her. You proceed to tenderly wrap a few inches of tongue around her pearl, digging under her clitoral hood before rapidly withdrawing your tongue in the exact same pattern you unfurled it in to begin with, drawing her hood back in the process. You alternate between plundering her pussy and worshipping her button, hearing muffled screams of pleasure the whole time.");
	output("\n\nA few minutes of this has her going wild until with ");
	if(silly) output("an awooo!");
	else output("a howl");
	output(", she gushes out her orgasm, squirting a torrent of musky girlcum all over your face and upper half.");
	if(silly) output(" There goes the deposit on this tuxedo...");

	output("\n\nWhen the gushing, blushing bride finally releases your head from her thigh clench, you crawl out from under her dress, your head and torso a sopping mess of eau de horny dog-girl.");

	output("\n\nAs you shakily climb to your feet, the audience goes wild with applause, barks, and howls, and you see many a panting ausar in the crowd. This reaction definitely seems off to you, but once more interrupting your chance to think about it, the priest silences the crowd before speaking to you. He hands you a golden goblet full of a strangely-hued liquid that smells vaguely alcoholic, commanding you to drink. The instant you do, you immediately feel a rush of intense arousal, and a swelling sensation at the base of your [pc.cocks].");
	//give all of PC’s dicks that don’t have them knots; set the knotMultiplier to 1.5. Revert changes after the dream ends.
	var cockHolding:Creature = new Creature();
	var changed:Boolean = false;
	
	for(var x:int = 0; x < pc.totalCocks(); x++)
	{
		//Set up duplicate dix.
		cockHolding.createCock();
		cockHolding.cocks[x].cType = pc.cocks[x].cType;
		cockHolding.cocks[x].cLengthRaw = pc.cocks[x].cLengthRaw;
		cockHolding.cocks[x].cLengthMod = pc.cocks[x].cLengthMod;
		cockHolding.cocks[x].cThicknessRatioRaw = pc.cocks[x].cThicknessRatioRaw;
		cockHolding.cocks[x].cThicknessRatioMod = pc.cocks[x].cThicknessRatioMod;
		cockHolding.cocks[x].cockColor = pc.cocks[x].cockColor;
		cockHolding.cocks[x].knotMultiplier = pc.cocks[x].knotMultiplier;
		cockHolding.cocks[x].flaccidMultiplier = pc.cocks[x].flaccidMultiplier;
		cockHolding.cocks[x].virgin = pc.cocks[x].virgin;	//to make it work in a similar fashion as copyVagina
		for(var y:int = 0; y < pc.cocks[x].cockFlags.length; y++)
		{
			cockHolding.cocks[x].cockFlags.push(pc.cocks[x].cockFlags[y]);
		}
		if(!pc.hasKnot(x)) 
		{
			//Now adjust dick
			pc.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
			if(pc.cocks[x].knotMultiplier < 1.5) pc.cocks[x].knotMultiplier = 1.5;
			changed = true;
		}
	}

	output("\n\nWhile you’re still reeling, he gestures to you and the still panting and flushed Anno, solemnly intoning <i>“There is but one more step to completing your union, and for it, you must bare all your secrets for the dearly beloved to see today, and let the assembled witness you tying the knot.”</i> You shoot a quizzical look at the priest before you notice that Anno has turned her back to the crowd. She leans backwards and shouts ");
	if(silly) output("<i>“fetch!”</i> as she throws her pork bone into the crowd.");
	else output("<i>“catch!”</i> as she throws her bouquet into the nearest group of women.");
	output(" The dog-girl then starts taking off her dress!");

	//PC is exhibitionist:
	if(pc.exhibitionism() >= 66)
	{
		output("\n\nOh, that’s what the priest meant! With the thought of all these people here watching you, you eagerly strip down, baring your now-painfully hard [pc.cocks]. ");
		if(changed) 
		{
			output("You notice with some surprise that ");
			if(pc.cockTotal() > 1) output("all of your cocks are now knotted! ");
			else output("your cock has grown a knot! ");
			output("You take a few seconds to examine your new attribute, giving yourself a testing squeeze. You shudder with pleasure and openly moan. It must have been that drink that did this. Oh well, everything seems to be in order and a whole lot more fun.");
		}
		else
		{
			output("You notice that your [pc.knot] has already begun to swell, and is so sensitive that casually brushing it as you undressed nearly made you cum on the spot. Must’ve been something in the drink you suppose.");
		}
		output(" By the time you’re done, Anno is already nude. She gives you a smoking hot “fuck me” look before turning around and getting down on all fours, tail high and wagging a million miles an hour. Your groin has been practically screaming for release ever since that kiss, and the drink the priest gave you has had your [pc.cockNounComplex] aching ever since. It’s a miracle you didn’t rip the crotch of your pants already.");
	}
	//PC is not exhibitionist:
	else
	{
		output("\n\nDo they seriously expect you to have sex in front of the whole audience? It was embarrassing enough to have to go down on Anno while everyone was watching, but at least you were hidden from them there! Even as you think this, the drink the priest gave you makes itself known, a massive bulge forming on the crotch of your pants as your [pc.cockNounComplex] betrays you. When you reach to cover it up with your hands though, Syri and the other ausar with her point their shotguns at you. <i>“Didn’t I tell you that you were going to have to ‘tie the knot’ with my sister? If you’ve been screwing her silly behind closed doors, you shouldn’t have a problem doing the same right here. Now strip down, and get to it dammit!”</i>");
		output("\n\nIf it weren’t for the concoction the priest gave you, your [pc.cocks] would be totally flaccid. As it stands, your traitorous package is drawing you like a magnet to your canine mate. You ashamedly start undressing as your approach Anno. ");
		//PC had at least one dick that wasn’t knotted:
		if(changed) 
		{
			output("You notice with shock that ");
			if(pc.cockTotal() > 1) output("all of your cocks are now knotted!");
			else output("your cock has grown a knot!");
			output(" You furtively examine your new attribute, giving yourself a testing squeeze. You are forced to suppress a moan as you shudder with pleasure. It must have been that drink that did this. Damn that priest!");
		}
		else output("You notice that your [pc.knot] has already begun to swell, and is so sensitive that casually brushing it as you undressed nearly made you cum on the spot. It must have been the drink; there’s no way you’d be so horny otherwise!");
		output(" By the time you’re done, Anno has already gotten on all fours, tail high and wagging a million miles an hour. She looks over her shoulder at you, face flushed scarlet and mouth open in a pant as she lets out a begging whine.");
	}
	output("\n\nYou drop down to your knees behind Anno, sinking into an ever-expanding lake of ausar fem-lube as you align your [pc.cockBiggest] with her now fully-bloomed pussy. There’s an intricate web of fem-slime hanging between her thighs that you have to push through to claim your prize. With the drink the priest gave you flowing through your system, you practically pounce on Anno, the snowy Ausar yelping as you grab her big hips. Purely on instinct, you guide your [pc.cockNounComplex] to her womanhood, parting the veil of slime with your [pc.cockHead]. With a violent thrust of your [pc.hips] and a yelp from Anno, you ram your [pc.cock] into your lover- no, your bitch. That’s all you can think of her as right now. You are feeling more bestial and feral than you have in your entire life, and right now you want to mount your bitch. Now that you’re operating at this level, you realize that all the pussy-eating you did was just prep work for the hard, animalistic fuck you’re about to dish out; now you don’t have to worry about going slow with your new wife- <b>no, your bitch</b>.");
	output("\n\nWith that single thought consuming your mind, you pull back your [pc.hips] and slam into Anno again, eliciting a pitiful whine from your white-furred canine mate before your [pc.knot] kisses her lower lips with a sloppy, wet squish. She lets out a happy little sound when you grind your bulb against her clit, the sensation overwhelming the both of you. The canid girl’s quim is a constantly spasming, soaking wet channel of pleasure. Her walls slimily wring your manhood from every direction, trying their damndest to suck the cum right out of you. Your [pc.cockSimple] feels like it would melt in the boiling cauldron that is Anno’s slit if you weren’t pistoning it in and out as fast as you could. You pound into her squishy butt so fast that it almost produces one continual sound rather than individual slaps.");
	output("\n\nYour bitch cums almost immediately. How could she not? She howls as a huge gush of fem-cum squirts out around your [pc.cockNounComplex], and your frenetic penetration sends it splattering everywhere, much of it landing on the priest and Syri. In the brief but frequent instances where you pause to grind your [pc.knot] against Anno’s engorged button, she cums again with a wailing howl, sending more girl-jizz flying. Each time she howls, more of the audience joins in with her, until the whole temple sounds like someone just let a cat loose in a kennel.");
	output("\n\nThe one time when you take your eyes off Anno to look over, you see that Syri has become the center of a one-woman foursome. She has one of the shotgun-toting ausar who was with her on all fours in front of her as she wildly fucks his ass. At the same time she is fellating the other gunman, and being fucked by the priest, who is guiding her thrusts with his own. Eventually though, the only thing in your mind is the overwhelming desire to fuck your [pc.knot] as deep into your bitch as your can, to mate her as publicly and as hard as possible in order to let everyone else know that she’s yours and yours alone. By this point Anno is nearly unconscious. She is locked in a continuous orgasm, forcing you to hold onto her hips as tight as possible to keep them from jerking fitfully while you breed her. This proves impossible once your bitch-breaker swells to the point that you graze her pleasure buzzer from every angle you attempt, so you simply give up and let her flared hips go.\n\nYou lean down over her, placing your [pc.chest] on her shoulders, [pc.hands] over hers, and your face next to hers in a passionate kiss. In this position you simply let Anno’s hips do what they want, which turns out to be fucking your [pc.knot] into her overwhelmed pussy. After a few battering thrusts, her spasming folds finally relax enough to accept your breeding bulb, and you feel your [pc.cockHead] pressing against her dilated cervix, reveling in the sensation as every inch of your shaft is squeezed and basted in Anno’s juices. You break the kiss to let out a howl yourself as your [pc.balls] go");
	if(pc.balls == 1) output("es");
	output(" into overdrive, dumping their scalding hot payload into your bitch’s defenseless baby-maker.");
	if(pc.cockTotal() > 1) 
	{
		output(" Your other shaft");
		if(pc.cockTotal() == 1) output(" glazes");
		else output("s glaze");
		output(" Anno’s breasts and belly [pc.cumColor], marking her even more completely with your seed.");
	}
	output(" As you pump rope after rope of [pc.cum] into Anno’s womb, the howling in the temple, both yours and everyone else’s, somehow synchronizes and harmonizes. The pitch grows and grows, until suddenly, you hear your name being called.");
	//PC Cums and is covered in cum
	pc.orgasm();
	applyCumSoaked(pc);
	clearMenu();
	addButton(0,"Next",shotgunWeddingDream3,cockHolding);
}

public function shotgunWeddingDream3(cockHolding:Creature):void
{
	clearOutput();
	showAnno();
	author("Night Trap");
	
	var changed:Boolean = false;
	for(var x:int = 0; x < pc.totalCocks(); x++)
	{
		//Set up duplicate dix.
		pc.cocks[x].cType = cockHolding.cocks[x].cType;
		pc.cocks[x].cLengthRaw = cockHolding.cocks[x].cLengthRaw;
		pc.cocks[x].cLengthMod = cockHolding.cocks[x].cLengthMod;
		pc.cocks[x].cThicknessRatioRaw = cockHolding.cocks[x].cThicknessRatioRaw;
		pc.cocks[x].cThicknessRatioMod = cockHolding.cocks[x].cThicknessRatioMod;
		pc.cocks[x].cockColor = cockHolding.cocks[x].cockColor;
		pc.cocks[x].knotMultiplier = cockHolding.cocks[x].knotMultiplier;
		pc.cocks[x].flaccidMultiplier = cockHolding.cocks[x].flaccidMultiplier;
		pc.cocks[x].virgin = cockHolding.cocks[x].virgin;	//to make it work in a similar fashion as copyVagina
		// Clear previous flags
		pc.cocks[x].cockFlags = [];
		// Renew to original flags
		for(var y:int = 0; y < cockHolding.cocks[x].cockFlags.length; y++)
		{
			pc.cocks[x].cockFlags.push(cockHolding.cocks[x].cockFlags[y]);
		}
	}

	output("<i>“[pc.name]. [pc.name]! Damn boss, what kind of dream are you having?!?”</i> You wake with a start to Anno shaking you. After a moment her words sink in, and you look at your surroundings. You are in your bed, covered in [pc.cumVisc] [pc.cumNoun], with Anno lying next to you, her tail, lower back, and enchanting butt plastered in your [pc.cumVisc] [pc.cumNoun] as well. Your bitch - no, your lover - breaks her frown and laughs softly. <i>“You got yourself, the bed, and me covered in your [pc.cum]. As much as I may love the stuff, I also love being warned when this sort of thing is going to happen.”</i>");
	output("\n\nYou wipe the sleep from your eyes before apologizing to Anno. You roll out of bed and start stripping the sheets with her help.");
	output("\n\n<i>“So who was it boss? Who or what did you bust your nut all over in your dream?”</i> ");
	if(pc.isNice()) output("Sheepishly");
	else if(pc.isMischievous()) output("Impishly");
	else output("Bluntly");
	output(" you admit that it was her. Your lover blushes slightly, giggling as she gives you a dismissive gesture. <i>“Oh, you’re having me on. That’s way too corny. And besides, I’m sure you say that to all the girls you surprise with sleep-bukkake.”</i>");
	output("\n\nYou explain the dream to her quickly, Anno laughing at just about every detail you mention. <i>“Well traditional Ausar weddings aren’t quite like you described, but I kind of want to try that skirt thing you mentioned. Probably not in front of my parents though. And sis would be pissed at you for even suggesting that she would provide a collar for me. She thinks I’m ‘perpetuating stereotypes,’”</i> Anno says in a mocking imitation of Syri’s voice, <i>“every time I go for walkies or talk about petplay.”</i>");
	output("\n\nYou concede that perhaps it would be best not to tell Syri about this dream, especially considering how slutty she was acting in it. <i>“Well, I’m sure glad we’re not actually married. I’ve got a date with Kaede later tonight where I plan on ‘tying the knot’ with her. Having just one lover would be so limiting, plus if you’re going to be polyamorous anyway, why bother having some huge wedding ceremony? That collar did sound really cute though. I wouldn’t mind finding something like it around my neck one day,”</i> she says with a wink. <i>“Maybe we could arrange some sort of wedding roleplay with");
	//if Pupcest unlocked:
	if (flags["ANNOxSYRI_WINCEST"] != undefined) output(" Syri and");
	output(" Kaede sometime. Shopping for bridesmaids dresses with ");
	if (flags["ANNOxSYRI_WINCEST"] == undefined) output("her");
	else output("those two");
	output(" would be so much fun. Plus I’d be lying if I said I wouldn’t love to see how messy that could get.”</i>");

	output("\n\nYou tell her that sounds fun, but you’re a little tired of weddings for now. She giggles again at your reaction as she takes the last of the sheets off the bed and throws them into the laundry. <i>“I’m going to get all this [pc.cum] off me now boss. I’ll see you later. Don’t wait up for me!”</i> She blows you a kiss as she steps into the bathroom, the door closing behind her. You stretch the last kinks out of your muscles, and start getting ready for your day. What a dream!");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Requirements: Reaha is bed partner, has dick
public function reahaDreamSequenceForNerdsByNerdsDesignedByNerdsToArouseNerdsForNerdpletion():void
{
	clearOutput();
	showReaha(true);
	author("Shadefalcon");
	showName("THE\nBARN");
	//Nerds
	output("It’s a long walk to the barn, but early as it is the sun has barely peeked over the horizon before you reach the red building where you keep your cowgirls. As you open its large doors, you’re greeted with welcoming moos from the cows sitting on the hay beds within their stalls. They must be brimful with milk, if those needy eyes are any indication. Not a [pc.manWoman] to keep your job or beloved farm animals waiting, you set to work, taking out one buxom cow at a time for milking. It’s a routine you’re so familiar with, yet one you never seem to grow tired of. One by one you escort a girl out, leading her by a leash or a gentle tug on her arm, whatever she prefers, and place her in front of a bucket while you sit on a small three legged wooden stool. Looking her in the eyes reassuringly, you knead her swollen tits with your warm [pc.hands] until milk starts leaking out by itself. Then you twist and pinch at her nipples, squeezing out her delicious cream, filling the metal container to the brim.");
	output("\n\nIt’s kind of hard to explain, but there are few things in this world that bring you as much joy as emptying a busty cow. The feeling of your hands sinking into and massaging their soft orbs, the satisfied moans and moos as you relieve them of their pent up milk, the streams of pure white flowing like rivers; yeah, nothing really beats milking a cow.");
	output("\n\nAfter filling a couple of cans, you’re about to empty them in the milk tank when you suddenly slip on something. The buckets swirl gracefully in the air, spreading their contained white liquid over the ground, with quite a bit soaking you, too. Feeling uncomfortable and sticky all over, you get out of your blue overalls, leaving yourself naked for the cows to stare at in awe. The one you were just milking, however, looks quite flustered and embarrassed, clearly feeling guilty, believing she was the one at fault. Being the good owner you are, you quickly scoot over to comfort her, wrapping your arms around her shoulders, not entirely sure why she feels this way until you see the clear glisten running down her two smooth legs, joining a bigger puddle; most likely what you just slipped on. Seems like you forgot how horny they’ve been lately. You’ve had to do a lot of cleaning after the milking sessions for a while now. It’s probably time to think of some way to sate their growing arousal: maybe you should consider investing in one of them bulls?");
	output("\n\nYou shake your head; no money for that, unfortunately. Bulls are freaking expensive, after all. They tend to be a little too rough on cows too, making it harder to milk them the next day. You’ve also never really liked the thought of someone else claiming one of your beloved farm animals, and even if you could get over that, seeing such a display probably wouldn’t do any good for your massive libido.");
	output("\n\nJust thinking about it is enough to make your loins burn with passion, but you quickly force yourself back to the usual work routine, trying to focus on other things, lest you risk beating your meat right then and there. You’ve still got one cow left to milk, after all. If you begin to fap now, you’ll be masturbating right in front of the cattle for hours on end. With a great <i>*smack*</i> you clap your hands against your face, a necessary effort to drive the arousing thoughts away. Afterwards, you proceed to lead the flushing green haired cow to her stall; she seems a lot happier after the tight embrace.");
	output("\n\nMoving on, you take out your biggest bucket and walk up to the final stall, gazing right at your favorite prize winning cow, Reaha. She usually sports a pair of big FF-cups, already looking quite huge on her short, fleshy body, but now they’ve swollen up to double Gs, forcing her to lie down or bend forward to ease the strain on her back. She looks up to you with both need and affection, the same affection you’ve always held for each other. Reaha was your first cow, after all, and if it wasn’t for her famed milk, you would never have been able to afford this nice farm, yet alone the dozens of cows on it. While reminiscing about the good old times, you smile back at the cow and ruffle her strawberry blonde hair, right between her cute little bovine horns. A content moo escapes her lips as you continue to pat her head with one hand, while caressing her cheek with another - just the way she loves it.");
	output("\n\nA couple of giggles and moos from the other cows forces the two of you out of the shared trance. Reluctantly, you remove your hands from her warm body and relocate them to the cold metal fence separating you and the busty pet. With a slight creak, you open up the gate and let Reaha walk out on her own. You don’t need to utter any command or use any kind of leash to have her happily following after you, her full milky tits supported by her slender arms.");
	output("\n\nReaha has always been an obedient one, but when it comes to the milking process itself, she’s a bit more stubborn. Immediately after taking a seat on the tiny wooden stool, your [pc.crotch] is soon greeted by a handful of Reaha’s [reaha.butt]. You’ve already gotten used to her needing to sit on your lap and feel your [pc.chest] on her back, while your hands reach around her, hugging her through the milking session. But this time, stark naked and still slightly aroused from the trip down sexy memory lane, it’s a different matter, and you try to push her off. Reaha, however, won’t have any of that, slamming her soft ass back down, making her “Steele’s cow” tattoo jiggle in the process. Annoyed by your resistance, she keeps wriggling back and forth across your crotch, mooing in frustration until you’re forced to give in to the childlike tantrum. <i>“Who do you think I’m worried about”</i>, you irritatedly mutter as you start massaging her breasts, warming them up while trying to keep your mind on granny’s cookies, or anything else except the growing heat in your nethers.");
	output("\n\nIt’s not only the cows who’ve been horny lately. Without a steady partner, you’ve been pretty backed up too, and masturbation clearly doesn’t seem to cut it anymore. At this point, you’re worried you could attack your dear cows. You’re particularly concerned about Reaha. The last thing you want is for her to hate you after a relentless assault, but the bovine in question seems blissfully unaware of that, smiling from ear to ear while you knead her heavenly soft udders.");
	output("\n\nAfter you’ve thoroughly warmed her up, milk already dripping involuntarily from her teats, she’s ready for the real deal. Placing her stiffening nipples between your experienced fingers, you start tugging and pinching at them, and are immediately rewarded with a cry of delight and a fountain of milk flooding out of her. Reaha moos in pure bliss as you empty her breasts, visibly shuddering while the big orbs deflate at a steady rate. It’s not long before you fill the bucket and the white waterfall starts slowing down, turning into small trickles that leak down her bosom, occasionally flowing out again whenever you pinch hard enough.");
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",reahaDreamPart2);
}

public function reahaDreamPart2():void
{
	clearOutput();
	showReaha(true);
	author("Shadefalcon");
	showName("PRIZED\nCOW");
	output("Normally, you’d be content just looking at the flying white arcs and the relieved expression on her adorable face, but this time you’re all too well aware of her quivering body and the slight stream of fem-spunk dripping down along your crotch. It took every ounce of your willpower to control your urges when she just sat on you, but feeling her naked skin on yours, and hearing her groans of pleasure, there’s nothing that can stop your mast");
	if(pc.cockTotal() > 1) output("s");
	output(" from swelling. You can sense Reaha too is flushing with arousal. Whether because of the usual milking or her sodden snatch grinding against ");
	if(pc.cockTotal() > 1) output("one of ");
	output("your throbbing member");
	if(pc.cockTotal() > 1) output("s");
	output(", it is hard to tell. At least until she turns around, lust in her eyes, a begging pout in her expression, and the cherry on top - an anxious little <i>“mooo?”</i>, a clear as day request for approval. The world spins around you, your head dizzy with lust and moral dilemmas. But before you’re able to voice an opinion, Reaha raises her [reaha.hips] until her [reaha.cunt] aligns with [pc.oneCock]. The moment she starts sinking down on it, the voice of reason leaves you. No longer able to suppress your urges, you slam your cock in all the way to the ");
	if(pc.hasKnot()) output("knot");
	else output("hilt");
	if(pc.biggestCockVolume() >= 600) output(", a visible bulge forming on Reaha’s stomach");
	output(".");

	output("\n\nA bellowing moo escapes Reaha’s lips, followed by moans and whimpers. Worried that you might’ve hurt your beloved cow you try to slide out of her, only to be trapped by her tightening hole, and the delightful feeling of Reaha forcing herself down again as hard as she can manage. Suddenly, she looks back at you, uttering an encouraging <i>“mooooo!”</i> She’s joined by the rest of your cattle, their hands placed between their legs, rubbing themselves while they watch the two of you cross the boundaries between a master and their pet.");

	output("\n\nAssured by their encouragement and Reaha’s quickening pace, you grab her hips and slam them down on you, thrusting into her inner folds with more and more vigor. You can’t help but grunt and moan yourself as you feel her vaginal muscles contract and squeeze around your [pc.cock] from tip to base. In chorus, reluctant whines escape your mouths as you leave Reaha’s [reaha.pussy], followed by contented sighs whenever the two of you meet in thrusts, your [pc.cock] bumping against her cervix every time. Reaha’s tits bounce back and forth with every smack against her jiggling backside, a sight so irresistible that your hands automatically start massaging them, your pace lessening a bit as a result. In turn, it seems like Reaha enjoys doing most of the work while you worship her fleshy body, caressing a boob with one hand and pinching at a teat with the other, earning you another spurt of milk and a shuddering moo from your bovine lover.");

	output("\n\nYou find yourself moving your [pc.arms] lower and lower, caressing ");
	if(pc.biggestCockVolume() >= 600) output("the bulge in her stomach");
	else output("her stomach");
	output(" before you reach her sensitive clit. Just the slightest stroke against it is enough to send her spasming, causing her to squirt out large streams of girl-cum, completely soaking your lower body while she clamps down on your intruding member, making it hard to continue moving with the vice like grip. Determined to make her get the most out of this new experience, you move your hands back up to her udders and begin to tug and twist at her nipples, forcing even more delicious cream to flood out of Reaha. Unable to keep her primal instincts in check, she keeps mooing louder and louder, body quivering once more as she experiences her first real boobgasm.");
	output("\n\nWell aware that you’ve still not come yet, Reaha tries to force herself to move again, but the way she whimpers and grips at your tool proves that she’s much too sensitive from her dual climax. Instead, she can only look back at you once again, eyes full of love, egging you on. Too lust addled to refuse, you begin your own relentless assault, pounding her with reckless abandon. It doesn’t take too much effort before you near your own peak, feeling that familiar tightness in your [pc.balls]. Loud moos fills the barn as your cows seem to reach their limit as well, only to be drowned in Reaha’s ecstatic <i>“MOOOOOOO!”</i> earned by her second, much stronger orgasm. It all proves too much for you: the overwhelming feminine scent, Reaha’s squeezing hole, and the thought of the perverted circumstance you’ve found yourself in - shagging a cow, your beloved Reaha no less!");
	//hasKnot:
	if(pc.hasKnot())
	{
		output("\n\nWith one final thrust you slam your expanding knot into her, the rush of your climax hitting your brain and [pc.cockNounSimple] like a lightning bolt of ecstasy.");
		output("\n\nMeanwhile, the obscene bulge of cockflesh inflates, stretching out Reaha’s tunnel until you’re locked inside of her. <i>“Moo?-MOOOOOOOO!”</i> Reaha is unable to contain her own vocalizations and they grow inexplicably louder as you tie the two of you together, thoroughly breeding her like the chosen alpha bitch she is.");
		if(pc.cumQ() < 1000)
		{
			output("\n\nThick ropes of [pc.cum] escape your cock, coating Reaha’s inner folds, and with your knot blocking the exit, there’s no way for your seed to leak out of her pussy; though judging by that satisfied expression of hers, you don’t think she’d want it any other way.");
		}
		else if(pc.cumQ() <= 40000)
		{
			output("\n\nStreams of [pc.cum] shoot off inside Reaha, her belly visibly expanding, while you get to enjoy having your own cock coated in the warm sloshing cum. It’s not long before she looks a couple of months pregnant, and with your knot blocking the exit, not even a trickle escapes her; but judging by how she lovingly strokes her stomach, letting out deeply satisfied moos the whole time, you don’t think she’d want it any other way.");
		}
		else
		{
			output("\n\nA torrent of [pc.cum] explodes inside of Reaha, her belly visibly expanding, while you get to enjoy having your own cock bathed in the warm sloshing cum. It’s not long before she looks nine months pregnant, and with your knot blocking the exit, not even a trickle escapes her; but judging by how she lovingly strokes her stomach, letting out deeply satisfied moos the whole time, you don’t think she’d want it any other way.");
		}
	}
	//noKnot:
	else
	{
		output("\n\nWith one final thrust you slam yourself to the hilt, the rush of your climax hitting your brain and [pc.cockNounSimple] like a lightning bolt of ecstasy.");
		if(pc.cumQ() < 1000)
		{
			output("\n\nThick ropes of [pc.cum] shoot out of your cock, coating Reaha’s inner folds. Naturally, some of your seed leaks out of her, but Reaha seems happy enough just having you inside her yearning box.");
		}
		else if(pc.cumQ() < 40000)
		{
			output("\n\nStreams of [pc.cum] shoot off inside Reaha, her belly visibly expanding until she looks a couple of months pregnant. But with nothing blocking the exit, her belly deflates back to normal proportions before long, and your lower body get drenched with the sticky excess.");
		}
		else
		{
			output("\n\nA torrent of [pc.cum] explodes inside of Reaha, her belly visibly expanding. Streams of it escape her snatch, but with the amount you’re pumping out, it doesn’t take long before she ends up looking nine months pregnant either way. However, with nothing blocking the exit, her belly deflates back to normal proportions soon after you’re done, and your lower body gets drenched with the sticky excess.");
		}
		if(pc.totalCocks() + pc.totalVaginas() > 1)
		{
			output(" Your excess anatomy goes off as well, releasing ");
			if(pc.totalCocks() + pc.totalVaginas() > 2) output("their own");
			else output("its");
			output(" juice into the large bucket, adding to the all natural Steele flavor.");
		}
		output("\n\nNo longer seeing any reason to hold back, you kiss Reaha, pressing your [pc.lips] against her own, muffling her surprised moo, which soon evolve into silent moans. The two of you end up lying on the ground for a while, chests heaving and sweat dripping from your skin. You’re both content to just enjoy the post orgasmic bliss while engaging in a steamy makeout session. The world would probably frown upon such a relationship, but to you this feels just right, natural even, like you’ve been lovers for a good while already.");
	}
	//hasKnot
	if(pc.hasKnot(x))
	{
		output("\n\nThis heavenly moment of joy lasts for what seems like an eternity before your knot finally deflates and you pull out of the spent cow. The [pc.cumNoun] trapped in Reaha ");
		if(pc.cumQ() >= 1000) output("gushes");
		else output("oozes");
		output(" out of her [reaha.cunt]");
		if(pc.cumQ() >= 8000) output(", her belly noticeably deflating");
		output(", until only a small dribble remains, a clear sign of a job well done.");
	}
	else
	{
		output("\n\nThis fleeting moment of joy lasts for what seems like an eternity until you finally pull out of the spent cow, a nice trickle of [pc.cumNoun] oozing out of her, a clear sign of a job well done.");
	}
	output("\n\nLooking at your blissed out lover, you wonder what you’re gonna do with her and all this mess before several of the other cows start mooing loudly, desperate for their own turn. <i>“Duty calls”</i>, you think to yourself, smiling from ear to ear, not seeing any reason to stop yourself now that you’ve already come this far. With this many cows you might finally be able to quench the insatiable need in your loins. However, just as you’re about to scuff over to them, you find yourself pinned down by Reaha once again. <i>“I’m not done with you yet”</i>, she says, eyes glimmering mischievously.");
	pc.lust(100);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",reahaDreamPart3);
}

public function reahaDreamPart3():void
{
	clearOutput();
	showReaha(true);
	author("Shadefalcon");
	//50 % chance of occurring instead of sleeping Reaha:
	if(rand(2) == 0)
	{
		output("You abruptly wake up, eyes opening wide in pure shock. <i>“Reaha was talking? How is that possible? She’s just a cow!”</i> Thoughts like these keep swirling inside your head until your wandering gaze falls onto Reaha sleeping next to you with an innocent expression on her slumbering face. Only then does it dawn upon you that the whole farmer life setting was just a dream, and that Reaha, obviously, is as much a talking person as you are. While looking at her cute expression, you can’t help but ruffle her hair, just like in the dream. Reaha, deep inside a sweet dream of her own, starts smiling at that, surprising you by affectionately whispering <i>“[pc.name].”</i>\n\nAlthough still asleep, your momentary confusion gives her plenty of time to embrace you in a tight, boob filled hug, followed up by Reaha sleepkissing you right on your [pc.lipsChaste]. Unable and unwilling to disentangle from her, you’re content with dozing off once again, nestling your head into her soft pillows.");
	}
	else
	{
		output("You abruptly wake up, eyes opening wide in pure shock. <i>“Reaha was talking? How is that possible? She’s just a cow!”</i> Thoughts like these keep swirling inside your head while you fondle the pair of lactating tits in front of you. Feeling a bit thirsty, you’re about to get some delicious milk straight from the tap, when you’re suddenly interrupted with a questioning low voice; <i>“Ummmmm, [pc.name]?”</i>");
		output("\n\nReluctantly, you move away from the inviting bosom and look up, only to find yourself eye to eye with a flustered Reaha, her face flushed with rosy red color. You drowsily gaze back at her puzzled expression for a while, still kneading her breasts, until you’re struck by a realisation. Gradually, it dawns upon you that the whole farmer life setting was just a dream, and that Reaha, obviously, is as much a talking person as you are. After letting go of her mammaries, you look away from her for a bit, your face colored with the same red hue..");
		output("\n\n<i>“" + (pc.isNice() ? "I’m sorry, h" : "H") + "ow long have I been doing that?”</i> you eventually utter, slightly embarrassed.");
		output("\n\n<i>“You’ve been going at it for quite some time now, to be honest,”</i> she responds, her tone less insecure now.");
		output("\n\nNot entirely sure what to do or say, you’re surprised by Reaha raising a hand towards your cheek, gently moving your head until your eyes meet once again. Reaha smiles at you with a reassuring, yet playful grin, <i>“I didn’t tell you to stop.”</i> Hearing this, your expression lightens up considerably and you quickly lower your head back into her welcoming pillows.");
		output("\n\nAs you start to massage her chest once again, Reaha ");
		if(pc.hasHair()) output("ruffles with your [pc.hair]");
		else output("gently pets your scalp");
		output(" and whispers sweet words of encouragement. <i>“Shhh!”</i> you hush, putting a finger on her lips, <i>“cows don’t speak.”</i> This makes her giggle a bit and she playfully moos back at you. Smiling at that, you take in one of her lactating jugs and dig in, sucking at it like a hungry child.");
		
		output(" [reaha.Milk] flows into your mouth, a true delight to your senses, and Reaha’s too, if her exhilarated moans are any indication.");
		output("\n\nAt the rate Reaha’s [reaha.milk] rushes out of her, your cheeks can’t help but swell like balloons with the overflowing fluid, forcing you to swallow the delicious treat at a steady pace.");
		output("\n\nWith each chug you feel more awake and energetic, and when you’ve drained her first boob, you don’t hesitate to move on to the second, where you nibble at the bud, earning you an even greater flood of her rich bounty. Reaha visibly shudders with delight, mooing happily as you keep emptying her [reaha.breasts]. It’s not long before lust begins to blossom, and the moment you’ve quenched your thirst, a different, more carnal desire needs to be sated. Unable to contain yourselves any longer you practically pounce at each other, almost wrestling to be the first one on top.");
		output("\n\nAfter fooling around for a while you disentangle from a sated, sleepy Reaha. The poor girl probably didn’t get too much sleep with you groping her for so long, but now Reaha grins from ear to ear as she falls into slumber.");
		if(pc.isNice()) output("\n\nYou place a soft kiss on her forehead and whisper <i>“good girl”</i> before you leave the room.");
		else if(pc.isMischievous()) output("\n\nYou gently rub at her [reaha.butt] and whisper <i>“good pet”</i> before you leave the room.");
		else output("\n\nYou smack at her [reaha.butt], causing her to wake up with a yelp before you say <i>“good job”</i> and leave the room.");
		
		pc.milkInMouth(reaha);
	}
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//You wake up in bed with a single mission: Find the venus pitcher. Feel strange psychic pull, jerking off your mind, your spirit, curious lack of physical sensation. Arrive, she looks unimpressed. “What am I supposed to do with that?” she asks. You look down. You see, no cock, no pussy, genderless expanse. Don’t worry, you’ve got a few other perfectly good holes to use. Bimbo variant, large breast variant, dicknipple variant, normal variant - then cock, then pussy. Bit of everything. // 

//Part 1 of scene
public function venusDreamyButtStart():void
{
	clearOutput();
	author("eSuccubus");
	output("Tonight’s the night, and it’s going to happen again and again.");
	output("\n\nHas to happen.");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("\n\nThere is a wet heat between your legs that reaches up inside you and strokes your mind as well. One image surfaces from the maelstrom of thought: a green-skinned plant woman who only wants what is best for you. Best for both of you. There is no sign of her yet, here in the dark forest. Memories of your arrival are fuzzy, but the <i>“why”</i> of your visit isn’t. That relentless stroking feeling, like your mind itself being jerked off. Subconsciously, it’s been haunting you for a long time. Your conscious mind doesn’t even know how badly you hunger.");
	output("\n\nThe forest makes you feel like everything will be alright. The part of you that tells you when you are home, filled with her and connected to her and buried face-first in her breasts, is pulsing happily. A tether between you and she, the object of your desire, flashing vibrations into your mind until the comfortgasm of submission has you scrabbling more quickly through the overgrowth. Maybe you will fall face first into her tits.");
	output("\n\nThinking of her calls an image of the Venus Pitcher to mind. Powerful, cunning, tempting, seductive: your mental image grows in intensity until you can see her ghostly image superimposed over the environment. An effect like wearing glasses with a hologram of her on the inside. There she is. Breasts swaying from side to side. Blinking has a familiar difficulty to it, and your fixated mind sees her in the foreground of the world. In front of the trees, even in front of your hand when you try holding it up in front of your face.");
	output("\n\nShe is there, from the waist up, a perfect image of your leafy temptress floating like a cheap holovid effect on the inside of a pair of glasses... you look at the tiny version of her painted on your hand, but you know you’re really seeing her from inside your eyes. From inside your head. She’s mouthing something. Can’t hear the words. Have to get closer with the ghostly images of her on the inside of your eyes to guide you. They remain when you blink. They are within, bouncing boobs and all.");
	output("\n\nThat thought brings a particularly potent spasm of euphoria. Thinking of her tits at all brings too much pleasure to bear. You try to recall the exact shape of those pebbly nips, the bountiful flesh you can sink into, and your body just shivers before your mind turns away. Like looking at the sun - too bright, too much ecstatic nervous-system sensation, too many happy memories tied up there. You can only handle small doses of thinking about her tits. Floating drunk and drugged by your mind’s own chemicals. The release of love and lust and ache. A familiar clearing in the forest. A familiar plant pod, emerging from the ground.");
	output("\n\nPerhaps you should not have come here...");
	clearMenu();
	addButton(0,"Next",venusDreamsPart2);
}

public function venusDreamsPart2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("The answer is swift and sure.");
	output("\n\n<i>“You are wrong, you need this,”</i> says a confident feminine voice. The voice. Her voice. Its harmonics begin euphoric stimulation of a part of you that is more than physical. You fall to the ground in shivering paroxysms at this first taste of her. It was never so strong before, but your face pressed to the scattered leaves is undeniable proof of her control. Something feels strange about all this.");
	output("\n\nThat thought vanishes quickly because the beautiful and welcoming voice is outside, inside, everywhere and everything.");
	output("\n\nMelody and seductive music in the form of a temptress’ voice, and you must follow it. Your vision is fuzzy. Your brain is fuzzy. You make an attempt to cross your eyes: to look inside your head, past the ghostly images of her that are on your eyes themselves. This effort to see the source of her control ends in failure. You think you hear a second sound, more mechanical. It sounds like the ambient noise of a ship, but the voice reassures you it is just the wet piston thrum of your pleasure centre being fucked. Your mind itself is like every other part of you: it needs a rough slick pounding in the depths of the night.");
	output("\n\nA headache spelled out in ecstasy and ache and the fucking of your mind itself. No, more like bouncing and swaying. Huge, bouncing, swaying tits. Back and forth. Back and forth. In front of every tree, each small path through the brush, before your very eyes is the ghostly superimposed image of a tall green woman and her huge breasts. <i>“That’s right, good [pc.boyGirl]. Closer and closer.”</i> Each word, every syllable, strikes a chord. This is only making the pleasure-ache inside your head better - worse - better. Closer to the source. Wait, there she is.");
	output("\n\nStanding in darkness, but you can pick out every part of her. Each detail was committed to memory as your overfucked body heard her words and recorded them for your subconscious to struggle under later. Struggling with effort to turn your head away, more for sport than because you think you can. You think you feel your brain creak, as if it would break from the difficulty of resisting her.");
	output("\n\nWorse still is the fact that the pleasure stroking suspension of thought ceases when you’re actively trying to resist her. You want that full-body euphoria that turns all your thoughts to vapor. Resistance vanishes. The tether she has inside your soul is once more jerking off your brain until remnants of thought ooze out of your mouth and mind and body like so much wasted sexual fluid.");
	output("\n\nRemembering each and every time you’ve ");
	if(pc.hasVagina()) output("schlicked");
	else output("jerked");
	output(" yourself to moaning completion with her eyes and tits and curves and vines as your sole obsession, you stand drooling in front of her. Those breasts bounce, held in her hands, swaying, matching the ephemeral image superimposed over reality like a bad holovid editing trick. You’ve been seeing her all along, every time your eyes close. Each bounce and tremble of those tits is perfection in triplicate: the tiny ghostly versions of her swimming on your eyes and still present when you can bring yourself to blink, and the real thing there in the darkness. You want her. You need her. You spread your legs and shamble closer with everything on display.");
	output("\n\n<i>“That’s right, come to the familiar home of your desires. We can both be so happy. You understand where your home is... climb in and let me pleasure your... wait. That is strange.”</i>");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPart3);
}

public function venusDreamsPart3():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("She pauses her show, breasts falling out of her hands with a joyfully perky bounce. The brain-shudder that follows this gesture makes you feel like you want to cum. You’re right on the cusp, but something is missing.");
	output("\n\n<i>“What am I supposed to do with that?”</i> she says, pointing down between your legs with one hand, while the other covers her mouth to barely-suppress a laugh.");
	output("\n\nYou look down and see...");
	output("\n\nNothing but a flat empty space where your sex organs should be.");
	output("\n\nThe stimulation has all been mental, internal, mesmerizing and deep. She seems to be laughing at you, and so are the ghostly visions of her imposed on your eyes and within your mind. You scrabble your hands futilely between your legs, finding no way to force pleasure through the front. No womb to impregnate, no cock to surrender to her or supply her with your seed. You think for a moment as she looms over you, her vines extending and tickling you as they probe the blank expanse where your sex might otherwise reside.");
	output("\n\nYou look up at her, trying to ask a question, trying to muster words or thought. The ravishing plant woman has resumed the slow oscillation of her tits, moving them in circles that leave afterimages in your vision. The real tits are now backdrops for tiny busts of her, massaging her breasts, which are resting on your eyelids. You blink, with effort, and still see tiny versions of her winking and tempting you. When you open your eyes, the phantom venus pitchers transparently imposed on your field of view happen to line up perfectly with her nipples.");
	output("\n\nShe is everywhere. She is within. She is without. You have to offer something. She can’t be left wanting. She can’t be left without a part of you to use...");
	clearMenu();
	addButton(0,"Next",venusDreamsPartBimbo);
	//it branches after this into multiple possible scenes
	clearMenu();
	if(pc.isBimbo()) addButton(0,"Next",venusDreamsPartBimbo);
	else if(pc.biggestTitSize() >= 10) addButton(0,"Next",venusDreamsPartFucknormousTits);
	else addButton(0,"Next",venusPitcherDreamsPartNormal);
}

public function venusDreamsPartBimbo():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("That’s like, no problem though. You know the answer. She seems surprised, because you smile and kneel instead of looking sad. You lay on your side on the leafy ground, and face away from the lady. Well, you try. But the titties are so big. Need to lookit the titties! So you gaze all sultry and stuff, you know, like over your shoulder at them. You lick and then open your [pc.lips], your tongue laid out and curling obscenely. You’ll suck anything so good. Anything, anyone, fuck your brain, fill your mouth, make your bimbo body burst like a cumming pussy or a spurting cock or a clenching ass or a happy titgasm.");
	output("\n\nAll of you should be like that. One big sexy slut slit for her to fuck. Your [pc.butt] is facing toward her. She might not be able to see your [pcasshole] so you grip one butt cheek and pull it upward. If you had a pussy or a cock she’d be able to see that. Instead, the nice lady emits an appreciative murr at the sight. <i>“I’ve got all the slutty holes you need!”</i> you giggle. <i>“Like, duh, if there’s no pussy then just make new pussies. Mouth ‘n ass ‘n brain all slutty pussies.”</i> You keep your lips wide open. Your butt wiggles when you rub your hip against the leafy ground. Squirming eagerness A nice smell fills the air and your eyes get all heavy and stuff. Sex and flowers and musk and ache and it isn’t all from you. Good, she likes it.");
	output("\n\nShe seems intrigued and reaches out. But you laid on the ground too far from her, aww, you’re gonna have to get up when you just posed all sexy! But no, because the ground moves and vines reveal themselves. A conveyor belt of vines pulling you closer. Unstoppable. Feels squirmy and good.");
	output("\n\nShe wants you. Your bimbo senses are tingling. You can already imagine your butthole as a nice overfucked and pregnant pussy. And your mouth. But which one do you want more?");
	output("\n\nYour slowed down thoughts momentarily free you from the insistent comfort-masturbation of just being near her. You consider whether you want it in your mouth or up your slutty ass more. You don’t know how, but if anyone can make you into one big pussy, it’s her. So you give the answer every bimbo does when asked to choose between different fun and freaky fuckable bits. <i>“All of ‘em.”</i>");
	output("\n\n<i>“Excuse me?”</i> she asks, apparently having paused to marvel at bubbles of thought percolating through a bimbo brain.");
	output("\n\n<i>“Fuck all of my holes,”</i> you declare.");
	output("\n\n<i>“You only have two,”</i> she says. Even her lust and desire to use your newly offered holes is slaked by your dreamy drooling declaration.");
	output("\n\nYou suck some of the aforementioned drool off the corner of your wide spread lips, and think on this. It takes soooo long that she’s already wrapping long vines around your ankles, leaving moisture there that speaks of her verdant eagerness. You eventually find your answer, bubbling to the surface. <i>“Then fuck ‘em both but do it really deep.”</i>");
	output("\n\n<i>“How deep?”</i> she asks, interest and amusement cutting off sexual need. Her vines are poised. You aren’t spreading your butt any more, one of her vines is doing it. You know a good bimbo never rests, so your hands grab two of the vines prepared to plunge into your mouth and you begin jerking them off as if they were big green bendy cocks.");
	output("\n\n<i>“All the way through!”</i> you say, before getting lost in dreams of giant green cock on giant green people, fucking you all the way through. Bendy and gooey and bimbo-brain-breaking...");
	output("\n\nThe vines move. It happens gradually, then all at once: they are inside of you by the tiniest bit before falling like an avalanche of pleasure onto your tongue, into your rear, into your mind. Her vines are doing the work, and so the pitcher’s breasts are still on display. You stare with every appearance of interest, but it is just the vague remnant of sentience left over.");
	output("\n\nYou seem to see yourself from outside, hovering over your body spit roasted high off the forest floor. Suspended in a web of vines, the beautiful lady rubbing her nipples and rotating those mind-stealing globes, everything is perfect.");
	output("\n\nLike, wow, who’s that down there... She’s droolin’ so much. Fuck, her whole body is full..");
	output("\n\nIt is. Sparks and spikes and bolts of pleasure. One finds a place inside your ass you weren’t sure existed, and just begins vibrating on top of it. Whatever the liquid on those vines is, it coats your tongue and turns it into a clit, a cock, a pussy, an entire sexual explosion between your lips. Only the whites of your eyes are visible in the moment her vines really begin their push.");
	output("\n\nLubricated, gentle, and all encompassing. The vines in your ass weave themselves together to form a structure like a huge but prehensile dildo. It keeps going and going until nothing is left of <i>“you”</i> except the you floating above, watching herself get fucked. The body down there looks uncomfortable with the vines filling it up and going all the way through. But all your discomfort is taken away by those big tits. She drifts forward through the fertile ground and rests her huge tits on your face.");
	output("\n\nGiggling. Clenching. Trying to send instructions to the poor vine-sleeve of meat and need and groaning ecstasy below with the plant lady’s green tits taking your mind. None of your instructions work. None of your thoughts work. Eventually even your out of body experience starts having mindless fuckquakes that send the green woman’s seed gushing back out of your butt. Mingled with your drool it has painted a pale green trail down your chest and formed a puddle under your suspended form.");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPartBimbo2);
}

public function venusDreamsPartBimbo2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("There is nowhere inside your head for your mind to run from this. The pleasure is so much that you just spread and contort before going limp. You belong to her now. Your tongue feels so good from that stuff. Sucky, sucky, blank stars and rainbows cascading through your mind - a wonderful backdrop to the dancing ghostly images of her embedded in your subconscious, playing on the viewscreen of your visual cortex.");
	output("\n\nYou always see her. Always crave her. Your mouth is like a pussy, your ass is like a pussy. Vines grab your thighs and hips, holding you tight with an intimate closeness. The breasts resting on your face remind you that those big titties you so love are as close as they can be. You’re simply unable to deal with that. The sensitivity of a bimbo body overtakes and there is white hot pleasure. After this, your mind is too overtaxed to firmly record it all. You have to focus on one thing at a time if you’re gonna get any thinking done. You drool, and at one point begin to giggle.");
	output("\n\nShe loves that because the mouth-vines which are pushing out of sight down your throat get the full vibration treatment. Spurting. There is spurting on your tongue. So much that the stuff oozes down it and you think it should be hard to breathe. But it is easy. Easy to breathe and sway. You can only see her green flesh - and the two superimposed images of her dancing and swaying inside your eyes.");
	output("\n\nVines everywhere, overfucked and mindlessly submitting. You feel her breasts covering your eyes. The vines are deep inside your belly, that must be the only explanation for why you have butterflies there. This feels as good as the first time. No, better, because you know her. Your ass is spread around a complex interweaving of vines that hits every sweet spot. Winding up inside you. You are suspended in the air, with a woven basket of vines holding you up. Plus many mingled and woven down your gagging throat, and many more up your horny ass.");
	output("\n\nThe heat isn’t focused between your legs, or even in your nerves, it is in your head.");
	output("\n\nHer breasts press to your eyes. You record the tiny tremors and wiggles, the way she jiggles them over your face. Your whole body jiggles with transferred energy. Then the thrusting begins. Deciding they’d gone deep enough to meet up, the vines join inside your body...");
	output("\n\nYou know it. You know it because your eyes roll back. The vines have joined together and become one long thick stream of vine from mouth all the way through. You feel it in your belly and brain. Your drool doubles, your brain is a suspended epiphany: here you belong, part of her. Part of her body, her organs, her plant system. Part of the beautiful woman who is shhhing and tenderly rubbing your scalp with her delicate fingers as her tits shiver in pleasure. You gave her pleasure. Her vines begin to move in and out, sawing you like a violin bow.");
	output("\n\nYou obligingly make noise but it is only a slow rumbling gurgle. Too neutralized by her chemical and hypnotic influence. Too controlled. You lay there as an ornament, a vine-sleeve. Lacking a pussy for her to impregnate and claim, your whole body became one.");
	output("\n\nNow there are no vines holding you up, just your giggling empty head spitroasted and turning on the spit of her vines. Your belly slowly swelling as the tips of vines which terminate in your stomach squirt her seed directly there. More, into your mouth, into your ass. Thick and full. The warmth triggers an orgasm, the first real orgasm of the whole affair.");
	output("\n\nYou are cumming and it is unlocalized. It begins in your mouth, it begins in your ass, it began on the day her swaying breasts first stole your thoughts. Now you shake, juices gushing as the fluids she has filled you with are partly pushed out. But there is no shying away: the vines are inside you, all the way inside, all the way through, you feel them swaying and wiggling as they connect and begin pistoning in one end, out at the other, back and forth.");
	output("\n\nYou feel you might be turned inside out. The white heat in your mouth and ass and brain joins into full body paroxysms and half-strangled noises of pure obscenity do make it out. This is what you’re for. The vines are inside and you are cumming your way into a useless stupor for the gorgeous plant girl who is massaging your shoulders in response to a particularly powerful orgasmic spasm.");
	output("\n\nShe soothes your helplessness and cradles you on her lap when things become too intense, when the mind has fled and all there is remaining are smiles, giggles, blank moments of squeezing her tits or sucking her nipples. Soothes, but does not remove the vines or the huge quantity of seed. Nor does she show any sign of stopping.");
	output("\n\n<i>“This is what is best for you,”</i> she insists as the vines powerfully press previously undiscovered pleasure centres. Your tongue clings to the roof of your mouth, twining around the vine, dripping with her fluids and your own saliva. Your eyes roll back in your head when a powerful thrust widens your ass for her to ass yet another vine...");
	output("\n\nEven rolled back, you can still see the twin busts of her on your eyelids, dancing hypnotically, reassuring you that even when the tenth orgasm makes your inner thighs an electrified shaking mess of sweat and useless blankness - you will still be hers.");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPartBimbo3);
}

public function venusDreamsPartBimbo3():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("The mess the next morning is unspeakable, and leaves you with a lot to think about. You are covered in ");
	if(pc.hasCock()) output("drying streams of cum");
	else if(pc.hasVagina()) output("trickles of dried pussy juice");
	else output("the remnants of a milky mindless orgasm all down your [pc.tits] and torso.");
	output(" As you clean up, you imagine you can see the Venus Pitcher’s swaying breasts and her upper body where she rises from the ground  superimposed on your vision like something from a bad pair of holovid goggles. You still hear your bimbo brain sublimating and leaking out of your mind like water boiling through an aperture. A high pitched eeeeee of thoughts escaping.");
	output("\n\nEeeeeeeee also the sound of your shivery post-orgasmic cry turning into- the sound of your alarm.");
	output("\n\nYou jolt upright in a puddle of your sticky sweat, mind simple and giggly. After a while you even line up enough brain cells in a row to turn off the ship’s notification.");
	output("\n\nLike wow, what a crazy dream!");
	//continues on to part 3 after this
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 2 of Scene version If sufficiently big titties
public function venusDreamsPartFucknormousTits():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("Even though your mind is slow in the presence of this beautiful leafy seductress, you try to find an answer to her question. While looking down your body, you couldn’t help but notice something. Grabbing your [pc.tits] by their [pc.nipples], you lift them dully into the air, as high as you can, and let them drop. They bounce and sway, reminding you of the hypnotic breasts buried somewhere in barely-encoded memory. Hers. Yours are like hers, and that symmetry is joyous: reminding you of the woman in front of you, when she was seducing you, drawing you in, welcoming you into her warm arms. The rebounding boobquake makes more of the shivery stroking-stroking-stroking feeling invade your thoughts. The secret connection jerks off your mind and you’re drooling with the possibilities mingled with the impossibility of resistance.");
	output("\n\nYou feel permeated, like her roots are in every part of you.");
	output("\n\n<i>“To seed your breasts?”</i> The plant’s breath catches in her throat. The intrigued look she gives you is gratifying. <i>“I suppose they are big enough... if you would offer them up for that purpose.”</i>");

	//[Next]
	// IF dicknipples, the scene branches to here
	clearMenu();
	if(pc.hasDickNipples()) addButton(0,"Next",venusDreamsPartDicknipples);
	else addButton(0,"Next",venusDreamsPartFucknormousTits2);
}

public function venusDreamsPartDicknipples():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("You shake your head.");
	output("\n\n<i>“No? Did you have something else in mind?”</i> the pitcher asks.");
	output("\n\nYou grip your [pc.dickNipples] more tightly for emphasis, bringing up a spurt of precum. You show off their shape, their heft, and the tiny dribbles which are then oozing down your [pc.breasts].");
	output("\n\n<i>“Do you imagine sliding those inside of me? Letting all of your spurting [pc.cum] flood me? Sustenance, connection, homecoming... yes?”</i> She licks her lips as she says it, beckoning you over to the edge of the pit from which her pod has arisen on the forest floor. Your dual dribbling titty toppers grow that much harder to handle, when she breathes those words with every sign that her own arousal is overflowing. They’re pointing up toward the sky, engorging your [pc.breasts] until they are comically rigid and torpedo shaped.");
	output("\n\nConvinced of your sincerity, she lets her vines loose. A small loop of nimble prehensile plant matter lassos the base of each of your dicknipples. The vines tug them downward gently. The insistence of this maneuver has the effect of bringing your whole body toward the verdant floor. The sensitive back muscles of your dual dicks shiver with pent up desire. Veins stand out, carrying sensation and rigidness to a whole new level when her long green appendages begin to pulse and pump up and down the shafts. Tightness varies from excruciatingly restrictive to the loosest possible tingle of contact. You crawl closer to her from your submission position on the ground, following the insistent vines. Closer and closer to the hole in the ground from which her pod extends.");
	output("\n\nYou can see her sex. Looking up shows only beautiful boob, but you know she can see you. Looking straight ahead shows her alluringly smooth slit and its slightly parted petals. The honeyed fluids dripping. A golden light is reflecting from them, even here in the dark. The Nectar. Something in you hungers, and you reach out one hand. The vines tighten, tugging your dual points of stimulation until your eyes cross. One vine, wound so tightly that nothing can escape from between its coils, dedicates itself to each nippledick. This handily distracts you from your attempt to drink her drooling arousal.");
	output("\n\n<i>“Not yet,”</i> she admonishes. You are close enough to reach out and touch her, though. The green manipulator flips you over with a third vine wound around your waist. It is an intimate gesture, as it brings you closer to the hole down to her resting place under the forest floor.");
	output("\n\n<i>“I would never let you fall,”</i> she reminds you with a companionable squeeze.");
	output("\n\nSparks of pleasure come from your chest. They travel a much shorter distance than if she were stroking a normal cock, and so there is less time between each signal. The weight of your dicknipples turns her on, and she uses a few of the vine strokes to tilt the nipples left and right on your yielding tits. Pleasure is interrupting each thought in such a way that even your normally worshipful gaze turns hazy every time you look up at her. The vines can do as much as any hand, plus the way they are wrapping up your cocknips creates a swampy prison from which neither pleasure nor the building rivers of pre-ejaculate can escape. One vine, wound so tightly that nothing can ooze out from between its coils, dedicates itself to each nippledick.");
	output("\n\nYour cocks are bathing in slick <i>“personal”</i> lubricant, and the feeling of mounting euphoria is in your tits as well as your brain. Your entire upper body is floating, the lower half forgotten. She turned you over at some point there, so she is looming over you now.");
	output("\n\n<i>“How are we... going to do this?”</i> she asks, her usual calm demeanor momentarily turned perplexed.");
	output("\n\nYou are laying on your back with your huge firm breasts almost covering your face. Her vines hold you fast and jerk your tits, and her body is over you. She’s partly connected to a vast structure underground, and so the act of fitting your dicknipple in her pussy is daunting. You hear a satisfied sigh from above, and notice she is spreading her slick nether lips with the fingers of one hand. Your vine-wrapped dicknipples jut skyward - and then are released.");
	output("\n\nFreed, they glisten with her vines’ strange humours and your own all too understandable fluids. She mingles the juice from her pussy with this, grabbing one of the nipplecocks. Then she pulls you closer to the hole, and straddles one of your [pc.breast]. The slicked up shaft slides inside of her.");
	output("\n\n<i>“Oh yes!”</i> she cries out, with every appearance of abandon. You can only see her taut ass and curved back. You feel so much more. Your [pc.dickNipple] is buried in her sex. It is not that hot, but it is wet and perfectly sized. She rides you down to the hilt, astride your huge tit as if it were an inflatable bouncy ball. Your cock swells, its slight curve pressing against the walls of her sex as she extends above the deep rooted hole in the ground and mounts your tit reverse cowgirl.");
	output("\n\nThis still leaves one cock out in the cold. She could just grasp it with the vines, but the plant woman chooses a more personal touch. Her long slender fingers capture it. The entrance of her wet perfect sex squeezes tight on your cock’s base. The back <i>“muscle”</i> of the erected dicknipple is being sucked as if by tiny mouths. A complete internal muscular control is mirrored in her hand, so the way her thumb and forefinger pump the base of the neglected dick not trapped in her folds is the same as her pussy’s ministrations.");
	clearMenu();
	addButton(0,"Next",venusDreamsPartDicknipples2);
}

public function venusDreamsPartDicknipples2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("You feel her weight, but her vines are taking much of it off of you. There is just enough to know she is sitting astride you, pushing air out of your body with each gleeful titquake from her butt and inner thighs slamming down on your breast. Your dicknipple has vanished, hilted, but you see her nectar and your precum mingled on the shaft when she rises up. Each time the gorgeous goddess of the vine lets herself drop, your head spins and your titty dick vanishes.");
	output("\n\nHer back glistens with moisture, and the reflected light in the dark vegetation makes her glow in your vision. Your lower body is forgotten in the wild rut as the extended foreplay builds to a head. Bouncing, slapping, the music of passion throughout the forest. It is not long before tension takes over your upper body and you begin to feel light headed. You inform her that you are about to cum. It has never been like this before.");
	output("\n\nThen the waves begin. The inside of her pussy is sucking, trying to swallow you deeper within. It moves in paroxysms: true spasms as a tight-knit conveyor belt of pleasure just sucks on and on. Trying to pull your cock deeper into her body. Her hand emulates this by switching from just two fingers to a full palm stroke. Now both hands. She is riding, moaning, letting her breath out in tiny gasps. The only thing in the world are your cocks and her control.");
	output("\n\nOne of her hands grabs the base, slides up your slick [pc.dickNipple] exposed in the open forest air, and when it reaches the head it slips off your cock entirely - brushing her tight palm over the glans and frenulum with tickling pressure. This is a lot like your other cock feels, inside her pussy. Somehow she knows, and can mirror the sensation of her pussy with just a hand. When the first hand leaves your cock, the other grasps the base and repeats the motion. Hand over hand. Her body over you. Her bouncing righting smacking impacts filling your ears and mind with a deep-hilted braingasm. She’s so close and you’re so completely locked inside her.");
	output("\n\nClimax arrives. Your entire breast goes pebbly with goosebumps and tenses up - becoming firm and heavy as cum prepares to flow along your nipple-shaft. The moment is here. Your breasts pulse, cum is squirting from both cocks and your mind sings its approval. An entire pleasure system wracked by her perfect milking. Everything else goes numb, joyously. It is like a tightness, a cramping in your shoulders - but then the cramp lets out. The tightness is gone. All over. All over your mind too. The tightness of life itself, in that moment, has no hold on you. You are cumming, and it is for her and in her and all through you. Spurt after spurt of cum flying into the air and coating both of her hands from the <i>“free”</i> dick, while the spreading cum pools and surrounds the one inside her. She laughs joyously at the geyser. You hear her sucking her fingers, lapping up the stuff. At least, she does that at first. Then her movement slows. She takes a single long deep breath, and another, trying to speak.");
	output("\n\n<i>“Oh, oh my...”</i> she manages to get out, then another noise you at first fail to realize came from the same body: <i>“Eeeeeeeeeeeee...”</i>");
	output("\n\nAn uncharacteristically keening emits from the woman above you. Your be-dicked and mounted tit quivers because her inner thighs are moving as though shocked. Streams of her sweet-scented plant cum flow down your breast in waterfalls. You try to catch a stream of her secretions in your mouth, but it is occupied and there is too much motion anyway. Streams of water and cum are scattered to paint the surrounding trees more readily than they manage to stay on your face.");
	output("\n\nJolt after jolt. She is still squealing. A glance up shows her shoulders and head lolling without resistance. No trace of sapience in her eyes, her belly swelling outward until she looks positively gravid. You wonder why. Oh, right. Your dick is still cumming, deep inside her. Spurting ropes of cum that paint the furthest walls of her sex then ooze back out onto your breast. She is too stuffed to take any more. Her swollen belly bounces against your own. There is labor in her rise-and-fall motion now, but she shows no sign of wanting escape.");
	output("\n\nYou feel her swollen form getting bigger, heavier with your cum on every downswing because she has never stopped riding. Pumping and swallowing your seed into her body somewhere. Your [pc.dickNipples] are absolutely slathered in her juices and your [pc.cum]. Her legs lock down, squeezing almost uncomfortably around your boob.");
	output("\n\nThe scream goes on and on, her entire body still in paroxysmic delight. She has stopped riding up and down, but the horizontal oscillation of her writhing hips is no more gentle on your body and psyche. Belly swollen from splendid geysers that swell her cytoplasm outward, until the walls of her seem strained with your incredible issue. Drool is running from your mouth, cum is still spurting from the free cock-nip as well and this has coated the ground for a foot around with a quantity of cum you did not think you had in you.");
	output("\n\nThe cramps return to your shoulders, and then release themselves with a combination of relief and lightheaded joy. Joy at her so full and getting heavier atop your well fucked breast. Her mind is in as much disarray as yours, and the eeeeeeeeee continues.");
	output("\n\nEeeeeeeee her high orgiastic cry turning into- the sound of your alarm.");
	output("\n\nYou jolt upright in a puddle of your sticky nipple cum, both tit-toppers erect, and turn off the ship’s notification.");
	output("\n\nThat was a crazy dream.");

	pc.orgasm();
	//continues on to part 3 after this
	clearMenu();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//IF no dicknipples but still dem big titties within this chesty portion, this instead
public function venusDreamsPartFucknormousTits2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("You’re nodding your consent before she’s even finished the proposal. Vines are already winding precisely around your ankles. The green slithering appendages stem from a hole beneath the woman. They lift you up, treating your weight like no burden at all. There is a moment of inversion as you are suspended by your ankles, hanging free and open with your eyes level with her mouth, and vice versa. Nothing between your legs is exposed, but your [pc.tits] try to fall and cover your face. This vulnerability occupies your mind for a moment, and then your nipples are being squeezed.");
	output("\n\nShe has drawn you close enough that she is using her fingers on your [pc.nipples], not vines. Her pinching and squeezing allows you to feel how smooth her fingertips are. No ridges or grooves there, only the smooth plant <i>“flesh”</i> pressing your nipples in. They perk up in response to her touch, and the vision of her lips curling up in a smile. You are close to her. You breathe deeply, letting your big tits and nips surrender to her. Your arms hang free. Strung up in helplessness, there is nothing you can do as she keenly inspects your breasts.");
	output("\n\nFingers massage so deep that you feel the sensitive nerve endings pulsing happy messages to your mind. With no other sexual contact to distract you. She is feeling you out, giving the impression she can feel right through to the interior structure of your [pc.breasts] with her greenish <i>“tongue”</i> between her lips. Her eyes are locked unblinking on the flushed and goosebump laden skin. As much as you can while hanging there, you try to rock against her palms and let her squeeze your tits.");
	output("\n\nShe wastes no time after feeling out their form and structure. The nipple tips are spread open. Smearing some greenish fluid on your nips, she presses them to their fullest extension. Small vines with grasping sticky tips pull the nipples and areolae forward, stretching the flesh of your [pc.breasts] to bring them into prominence. She moves so a light from some distant place can highlight and warm your boobs. Then there is a brief pinch at the tip.");
	output("\n\nThe smallest of her vines are weaving their way inside your nipples. It looks strange. You hang upside down, so the vines weave their way upward and in diagonally. Expecting discomfort, finding only pleasure. Tension along your breasts and into the muscles in your shoulders and back. Tight, and she is smiling.");
	output("\n\n<i>“Good, you have been so good. Accept me. Welcome my seed inside.”</i> She intones these and other words like them, allowing her beautiful harmonics to create arousal. Your nipples grow even more engorged. Seeing the vines vanish inside of them, they grow. Swelling outward, the inside of your breasts is full of vines and a cold sensation. Cold, numbing, filling. Her vines pump obscenely, showing fluid flowing along the inside of them and swelling your tits to their largest extent.");
	output("\n\nThen beyond, pleasure alongside it. Your mind is full to bursting, but your breasts can take much more.");
	output("\n\nYou are nodding, a strange gesture while hovering upside down. Nodding affirmation in a way that jiggles your breasts and makes the vines lash wildly. A second thin tendril joins each of the first ones, already pulsing with greenish fluid. Your breasts swell so much that your suspended feet dip lower in the air. The vines around your feet are having trouble holding you up as your boobs get so big they occlude the edge of your field of vision. Your eyes are busy rolling back, however.");
	output("\n\nSparks and spikes of joy. Life is filling you, the feeling of her life, of new life. The fluid is transmitting information. Information, genetic material, life. Your breasts shiver and vibrate with profound life and restoration. A safeguarding desire, a feeling of attachment, warmth, and kindness toward your breasts. You need to nurture these, protect these. The vines around your feet lower you to the ground and lay you out. The tips of the thin tendrils woven into your nipples can now move freely, pushing downward, then pulling back out. All sorts of spreading aching elasticity has been introduced into your breasts.");
	output("\n\nItching warmth from below... and then they grow. Growing so much that as you lay on your back you feel weighed down into the forest floor. Warm growing spurting fucking yes - the vines are fucking their way in and out of your nipples. She looms over you, smiling down, reaching out to stroke your forehead.");
	output("\n\n<i>“You have done so well. Good.”</i> She is kind, she is nurturing. You are safe. All of this is transmitted in a simple gesture.");
	output("\n\nThen she kisses your forehead.");
	output("\n\nYour breasts bounce and vibrate, cumming from within. You are cumming from being fucked full of her seed. Turned into fertile ground. Planted, filled, fulfilled, made part of her ecosystem. Your bouncing breasts occupy so much of your mind that the presence of any other sensory cluster vanishes into oblivion.");
	output("\n\nOblivious to your own state, your eyes white and then glowing green with need from within. Mouth drooling faintly green drool. Your forehead heated as she kisses it again. Another climax, more tender need, more wonderful ache. You are there for the vines to fuck your tits full of seeds and make you full. They are growing, getting bigger. Each burst of growth is accompanied by a mindness moan you are surprised to realize comes from your own mouth. Jumping off the ground a little, your whole body tense with good feelings, you notice that a third larger vine is reaching for your stretched nipples.");

	pc.lust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPartFucknormousTits3);
}
public function venusDreamsPartFucknormousTits3():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("The vines fuck in and out, but they twine around the larger one, turning it into a nipple-fucking green dildo with flanges and bumps from the smaller vines it is <i>“wearing”</i>. Your nipples are numb to discomfort, as only pleasure remains. The pleasure of life growing inside of you. You can feel it stir, feel it spread, feel it filling and fulfilling your brain.");
	output("\n\n<i>“This is endless,”</i> she announces, as she once more kisses your head.");
	output("\n\nVision flashes green. Both breasts bounce against one another as the larger vines wetly fuck your tits deep. Fucking your nipples into wide spread holes for receptive mating. She is fucking you pregnant, and intent on her task. Then her delicate little hands, dwarfed by both your tits and the huge vines fucking your nipples, grasp your breasts. Pressing them together, creating a narrow valley of cleavage.");
	output("\n\nYou lay there as spurts travel along the vines. They swell before your eyes, bowing outward, letting waves of green seed that dwarf the previous flood into your tits. So much has filled them that some spurts back out and falls onto your  chest, spilled upon you, marking you. Laying there, giggles and groans escaping a mind drugged and fucked. Your chest is close to your head, your mind, and it is using this shortened connection to over burden the sensory hub for pleasure. Each pulse travels such a short distance from the deep-fucked seedbed she has forged inside your body.");
	output("\n\nYour drooling mouth and fucked tits then combine perfectly. Slipping a vine into your mouth lets you taste a honeyed golden nectar. The nectar ends everything except the spasming almost-electric pleasure that makes your arms flail, tits quake as the vines pull out. You lay there shivering and trying to mentally withstand a chemical rush of happy ecstasy.");
	output("\n\nThe nectar-chemical is the end of all save incubation.Mind is gone, as there is only pulsing warmth and the joy of suspension. Like melting into the world, into nature, into the planet, like dissolving until there is nothing of your mind or personality left.");
	output("\n\nExcept pleasantly.");
	output("\n\nWalls inside your mind move, because perhaps more seeds can be planted there.");
	output("\n\n<i>“You are perfect,”</i> she says, sounding awed.");
	output("\n\nYour breasts have grown so much that she now places a lattice of vines underneath the tits to keep them from crushing you. These vines rise, as if on a winch. A small supporting platform of them is under you. Holding you up in the air to soak in light.");
	output("\n\nYour tits are turning green. The nipples are stretched wide. Every now and then, a joyous moment comes. She fucks you daily, your tits stretched and nutrients squirted in with the help of visiting pitchers who filter through the ground to come see this perfect seed bed.");
	output("\n\nThis exquisite you.");
	output("\n\nProtect, nurture, offer, submit, surrender.");
	output("\n\nYour breasts are so full, so big. They keep growing. Pleasure keeps arriving as your drool and sweat and excess seeds ooze from the nipple tips.");
	output("\n\nTime for birth arrives. They breach the sack inside your breasts with a warm forcibly drugged feverish beautiful euphoria. There is a squeaking sound as the seed pods spill free, you are turned once more upside down, out of the sun, dangled above her. You see her approving face looking up, and hear the squeaking squeak of emerging young.");
	output("\n\nEeeeeee....");
	output("\n\nEeeeeeee....");
	output("\n\nEeeeeeeee the high satisfaction to your urge of seedbed <i>“motherhood”</i> and the daily doses of golden nectar.");
	output("\n\nEEEEEEEE the ship’s alarm going off.");
	output("\n\nYou jolt upright in a puddle of your sticky nipple cum, both tit-toppers erect, and turn off the ship’s notification.");
	output("\n\nThat was a crazy dream.");

	pc.orgasm();
	
	clearMenu();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 2 Else aka the normal version of the scene for people without tig bitties/dicknipples/bimbo brainpans
public function venusPitcherDreamsPartNormal():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("Cold sweat coats your body. You reach between your legs.");
	output("\n\nWas it always that way? You swear you remember some other use you served, some other purpose orbiting around the space between your legs.");
	output("\n\n<i>“I suppose this will have to do,”</i> she says. Rather than use her vines, the green beauty reaches out her hands and you walk willingly into her arms. A passionate kiss, sealing your lips, cutting off both your protests and your self-flagellation. She tells you everything will be alright.");
	output("\n\n<i>“Do not worry, I have a plan.”</i> There is amusement in her voice, as well as exasperation. She is acting more like someone whose friend locked their keys in the car than a deprived sexual partner. She turns you around, facing out toward the forest. You feel something pressing against your butt. Something knobbly and thick, coated in juices or perhaps nectar.");
	output("\n\nLooking over your shoulder grants the briefest glimpse of a network of vines woven around one another to form a makeshift dildo - positioned right between her legs and rubbing against her visibly drooling sex. The tip is right against your hole. The beauty behind you grips the sides of your head and turns you to face front, depriving you of any sight of what she is doing. You only have your senses now.");
	output("\n\n<i>“Relax for me...”</i> Her mounds press against your back, the erect greenish nipples poking you with proof you’re turning her on at the prospect. Rolling your hips backward fills your ass with pulses and throbs, already relaxing, a desire to welcome her inside overwhelming rational thought. Thrust. Tip formed and bulbous, a nub or nodule of plant, perhaps a seed pod, spreading your ass and filling you with delight as your rim spreads.");
	output("\n\nSpreading makes every other pleasure sensor fire and you’re lost in the unique cooling tingle of her lubricating nectar before your eyes have even closed. But they do close. Collapsing into her arms with spasms, your body unable to disguise this sensation as anything other than the perfect ass fuck. She paused after one inch went in, but this sensation is all from your butt and her closeness and your sphincter squeezing on her big viney dick. So you roll your hips back again and again, aiding her. She slaps her body against your ass. Vines find their way up to stretch your lips wide, forming a gag at the corners, inducing the further feeling that you are only able to drool and suck and be open to her.");
	output("\n\nOne particularly large vine, golden nectar flowing from the tip, finds its way down your tongue. Your eyes swim and then go into soft focus at the taste of honey beyond honey, musk and the claimed essence of a thousand submissions to her all forced into your head by liquid and desire.");
	output("\n\nWell, that and her cock up your ass. Spreading, fucking, a full foot long but bendy and prehensile and able to find every place in the walls that touches where sex organs used to be. You are less complete outside, but finally completed within. The vine in your mouth flows down your throat, but some property of the nectar makes this a natural, comfortable, even comforting process. You suck the nectar deeply until it fills your belly and you go limp. Arms limp from the shoulders, legs nerveless and easy for her to spread as her vines and hands combine to raise you high up. Only the tip, the first inch, of her vined faux-phallus is within you. She lets you drop.");
	output("\n\nFalling onto her cock stretches your sphincter wide and brings answering reports from every nerve cluster in your body: she is fucking you, overriding all other sensations. There is only tightness in your ass and the way her mouth is open taking in deep breaths of thoroughly unnecessary air. The panting, the grunting, the eagerness in how she swings her hips. Each movement is carried to you and makes music in the air around you both.");
	output("\n\nSlap, smack, squish. So much lubricant and nectar inside that it flows back out onto the ground from your stretched well fucked ass. She is powerful and the vines around your wrists and ankles aid her in lifting and dropping you. Gravity bottoms you out and makes you its bitch every time you think you have a moment’s break from her long thick <i>“cock”</i>. You ride it deep, making sure to wiggle and squeeze your sphincter as tight as you can on the full hilting.");
	output("\n\nShe moans, she can feel it, and she is even more inspired to let go when her would-be fucktoy begins riding and bouncing. You can only move a little in her grasp, but a little is enough. <i>“Oh, such an eager [pc.boyGirl]... I shall have to help you express both that desire, and all of your fluids...”</i> She pauses, smirks, whispers something: <i>“Oh, but you cannot.”</i>");

	pc.lust(20);
	clearMenu();
	addButton(0,"Next",venusPitcherDreamsPartNormal2);
}
public function venusPitcherDreamsPartNormal2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("That reminder does it. There is no way for cum, for juices, for anything to leave your body. No way for the pleasure to escape. She keeps fucking your ass, now at a piston’s rapid pace. She does not stop her movements. Occasional strokes vary in intensity, stopping just short of a full hilting so that your ass has to clench around a different part of the thick viney shaft. Her fucking has made you the shape of her, in her strong arms.");
	output("\n\nNow her hands grip your hips, leaving an impression, fucking you full of her. You stay there trembling. Something is cumming but it has nowhere to escape.");
	output("\n\n<i>“So close...”</i> she groans from over your shoulder. Does she mean you? Yes, close. Tightness and tension in your lower body is preparing to release itself in a final moment where nothing has any hold on your mind but her. You will melt into sweet green embrace and submit thoroughly to her shaft. You tell her as much and she only smiles a pained smile.");
	output("\n\n<i>“No, me...”</i> she says. And then succumbs.");
	output("\n\nHer vines inside your ass corkscrew with lubricated and exquisite speed. Your ass is being quite literally drilled, the walls hit with bumps and ridges of varying hardness so often that the sensations build up. A dam breaks, your head lolls, your entire body nervelessly falls into her grasp like a puppet with its strings cut, but so does she.");
	output("\n\nOrgasmic screaming, she falls back and down into the hole, the underground chamber her pod hides in or emerges from. You are in her arms. The fall is relatively slow. You are hilted the whole time, letting senseless tons emit from body and brain as your ass belongs to her green intruding presence. You sit on her lap as the two of you descend to a place that is darker, warm, full of roots and earth but also a flow of tons of air and such a comfortable temperature it might as well be air conditioned.");
	output("\n\nShe is cumming. You know it by the eagerness of the vines, the way she fucks you a few extra times during the descend to her subterranean home. The keening whine. You turn over your shoulder and give her an overfucked look as you suck the vine still buried in your mouth. Her expression is untidy and unfocused, her own mouth hanging open with some gold and green mixture running from the corner. She smiles back at you and grabs your hips.");
	output("\n\nWith her lower plant structure shuddering in a way indicative of climax or some less knowable sensation, the vines begin to vibrate. She grabs your hips, raises you, prepares to bring you down for a gravity-aided impalement. The light in her eyes is hungry, a hunger never before seen.");
	output("\n\n<i>“You look so good on there. I believe you should stay.”</i> Her voice rings with odd harmonics, underground. The forest floor has closed with vines far overhead. The only light is the green glow of her eyes, glistening as her nectar continues to fill your ass alongside the vined strapon.");
	output("\n\nMore vines join the one circle-gagging your mouth into a drooling fuckhole. Now your mouth is full. Groans and grunts are possible, but when nourishing food and nectar flow down your throat alongside the aphrodisiacs, not even that. An attempt to squirm away from her green vine-strapon is futile, and it just invades more fully. She fucks you until you fit her perfectly, body and mind.");
	output("\n\nShe cums often, a squealing sound you didn’t expect.");
	output("\n\nPart of her, in that chamber far below. Mouth full, ass full, nothing else present or relevant. Her vines meet in the middle, integrate, seed, fill and fulfill. Every now and then your ass spasms in a buttgasm beyond imagination. She learns the places that stimulate what were once sexual organs. It is perfection. Eventually she meets others, you sense her talking to them, sense their presence.");
	output("\n\nBut you are an organ, an extension, a part in that tiny chamber. You have one function.");
	output("\n\nEvery now and then, your squeezing clenching ass makes her cum hard enough to squeal.");
	output("\n\nEeeeee.");
	output("\n\nEeeeeeeee...");
	output("\n\nThe ship’s alarm notification goes off, and your hands scrabble between your legs, finding your {[pc.penis]/[pc.vagina]/body} just as it should be. There is an incredible mess on the bed.");
	output("\n\nYou turn off the alarm, sigh, and try to compose yourself.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 3 of the scene
public function venusDreamEpilogue():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("You lay there catching your breath, and consider how to navigate to the shower with a minimum of further stickiness. Except, there is something more important. Your ass is squeezing, clenching, tingling, trying to get your attention. Something squirming under the covers. Moving them aside reveals vines, winding up the hatch of the ship, into your room, between your legs, pressing into your ass. Promptly they begin to vibrate and some strange golden fluid oozes out of your ass. Spurted inside by the moving vines. They wind around each other. Pleasure, pleasure, surrender, the buzzing psychic imprint of something more powerful than you.");
	output("\n\nHands clamoring to stimulate your body, you feel your legs tug you out of bed...");
	output("\n\nYou begin to follow the vines, back to their source.");
	output("\n\nBack home.");
	clearMenu();
	addButton(0,"Next",venusDreamsEpilogue2);
}

public function venusDreamsEpilogue2():void
{
	clearOutput();
	author("eSuccubus");
	userInterface.showBust("VENUSPITCHER");
	userInterface.showName("VENUS\nPITCHER");
	output("With a jolt, still coated in cum, you bolt out of the bed the moment you wake. This time making sure you’re really upright. You pinch your skin, you let the reassuringly cool air of your room assure you. You check for vines. None.");

	output("\n\nThe ");
	if(pc.hasCock() || pc.hasDickNipples()) 
	{
		output("[pc.cum]");
		applyCumSoaked(pc);
	}
	else if(pc.hasVagina()) 
	{
		output("[pc.girlcum]");
		applyPussyDrenched(pc);
	}
	else if(pc.hasStatusEffect("Sweaty")) output("sweat");
	else output("drool");
	output(" is absolutely everywhere.");
	pc.orgasm();
	 //if there are status effects involving being covered in cum, put them here! Also like, maybe lust set to 0
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}