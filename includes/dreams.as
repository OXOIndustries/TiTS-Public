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
		//Anno shotgun weddings
		if(annoIsCrew() && flags["MET_SYRI"] != undefined && flags["CREWMEMBER_SLEEP_WITH"] == "ANNO" && pc.hasCock()) dreams.push(shotgunWeddingDream);
		//Reaha dreams
		if(reahaIsCrew() && pc.hasCock() && flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") dreams.push(reahaDreamSequenceForNerdsByNerdsDesignedByNerdsToArouseNerdsForNerdpletion);
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
		output("\n\n You move your head back and forth to grind Anno’s pleasure buzzer as you prod the sides of her love-tunnel with your [pc.tongue]. Your ministrations bear fruit almost immediately: Anno’s trickle turns into an actual stream of femlube, and you have to start immediately swallowing to avoid drowning. You alternate between swirling your tongue in rapid circles inside her and lapping at her pussy like ");
		if(pc.race() == "ausar" || pc.race() == "half-ausar") output(", appropriately,");
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
		output(" By the time you’re done, Anno is already nude. She gives you a smoking hot <i>“fuck me”</i> look before turning around and getting down on all fours, tail high and wagging a million miles an hour. Your groin has been practically screaming for release ever since that kiss, and the drink the priest gave you has had your [pc.cockNounComplex] aching ever since. It’s a miracle you didn’t rip the crotch of your pants already.");
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
	output("\n\nYou concede that perhaps it would be best not to tell Syri about this dream, especially considering how slutty she was acting in it. <i>“Well, I’m sure glad we’re not actually married. I’ve got a date with Kaede later tonight where I plan on ‘tying the knot’ with her. Having just one lover would be so limiting, plus if you’re going to be polyamorous anyway, why bother having some huge wedding ceremony? That collar did sound really cute though. I wouldn’t mind finding something like it around my neck one day,”</i> she says with a wink. Maybe we could arrange some sort of wedding roleplay with");
	//if Pupcest unlocked:
	if (flags["ANNOxSYRI_WINCEST"] != undefined) output(" Syri and");
	output(" Kaede sometime. Shopping for bridesmaids dresses with ");
	if (flags["ANNOxSYRI_WINCEST"] != undefined) output("her");
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
	output("\n\nJust thinking about it is enough to make your loins burn with passion, but you quickly force yourself back to the usual work routine, trying to focus on other things, lest you risk beating your meat right then and there. You’ve still got one cow left to milk, after all. If you begin to fap now, you’ll be masturbating right in front of the cattle for hours to end. With a great <i>*smack*</i> you clap your hands against your face, a necessary effort to drive the arousing thoughts away. Afterwards, you proceed to lead the flushing green haired cow to her stall; she seems a lot happier after the tight embrace.");
	output("\n\nMoving on, you take out your biggest bucket and walk up to the final stall, gazing right at your favorite prize winning cow, Reaha. She usually sports a pair of big FF-cups, already looking quite huge on her short, fleshy body, but now they’ve swollen up to double Gs, forcing her to lie down or bend forward to ease the strain on her back. She looks up to you with both need and affection, the same affection you’ve always held for each other. Reaha was your first cow, after all, and if it wasn’t for her famed milk, you would never have been able to afford this nice farm, yet alone the dozens of cows on it. While reminiscing about the good old times, you smile back at the cow and ruffle her strawberry blonde hair, right between her cute little bovine horns. A content moo escapes her lips as you continue to pat her head with one hand, while caressing her cheek with another - just the way she loves it.");
	output("\n\nA couple of giggles and moos from the other cows forces the two of you out of the shared trance. Reluctantly, you remove your hands from her warm body and relocate them to the cold metal fence separating you and the busty pet. With a slight creak, you open up the gate and let Reaha walk out on her own. You don’t need to utter any command or use any kind of leash to have her happily following after you, her full milky tits supported by her slender arms.");
	output("\n\nReaha has always been an obedient one, but when it comes to the milking process itself, she’s a bit more stubborn. Immediately after taking a seat on the tiny wooden stool, your [pc.crotch] is soon greeted by a handful of Reaha’s [reaha.butt]. You’ve already gotten used to her needing to sit on your lap and feel your [pc.chest] on her back, while your hands reach around her, hugging her through the milking session. But this time, stark naked and still slightly aroused from the trip down sexy memory lane, it’s a different matter, and you try to push her off. Reaha, however, won’t have any of that, slamming her soft ass back down, making her <i>“Steele’s cow”</i> tattoo jiggle in the process. Annoyed by your resistance, she keeps wriggling back and forth across your crotch, mooing in frustration until you’re forced to give in to the childlike tantrum. <i>“Who do you think I’m worried about”</i>, you irritatedly mutter as you start massaging her breasts, warming them up while trying to keep your mind on granny’s cookies, or anything else except the growing heat in your nethers.");
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
	output("\n\nLooking at your blissed out lover, you wonder what you’re gonna do with her and all this mess before several of the other cows start mooing loudly, desperate for their own turn. <i>“Duty calls”</i>, you think to yourself, smiling from ear to ear, not seeing any reason to stop yourself now that you’ve already come this far. With this many cows you might finally be able to quench the insatiable need in your loins. However, just as you’re about to scuff over to them, you find yourself pinned down by Reaha once again. <i>“I’m not done with you yet”</i>, she says, eyes glimmering mischievously.”</i>");
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