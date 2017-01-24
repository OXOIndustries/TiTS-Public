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
		if(annoIsCrew() && flags["MET_SYRI"] != undefined) dreams.push(shotgunWeddingDream);
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
	output("You awake to the light of a bright-burning sun in your eyes. The softness of the bed you once laid upon is replaced by fluffy yet somehow solid clouds. High above is a sky so bluer than a robin’s egg and seemingly endlessly vast, stretching around below you as well as above. There’s no sign of land or even a planet to be found. Stumbling up on your [pc.footOrFeet], you look around in a panic, searching for something, anything familiar, but there is nothing to be found. Not a ship, not a holoconsole, not a single other person.");
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
	else output("\n\nYour inhuman tongue slithers into her love-tunnel like a self-lubricated cock. You just keep unfurling more and more oral muscle into Anno until you reach her cervix. After giving it a few loving little flicks, you sensuously withdraw your muscle until it’s completely outside of her. You proceed to tenderly wrap a few inches of tongue around her pearl, digging under her clitoral hood before rapidly withdrawing your tongue in the exact same pattern you unfurled it in to begin with, drawing her hood back in the process. You alternate between plundering her pussy and worshipping her button, hearing muffled screams of pleasure the whole time.}");
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
		for(var y:int = 0; y < cockHolding.cocks[x].cockFlags.length; y++)
		{
			pc.cocks[x].cockFlags.push(cockHolding.cocks[x].cockFlags[y]);
		}
	}

	output("<i>“[pc.name]. [pc.name]! Damn boss, what kind of dream are you having?!?”</i> You wake with a start to Anno shaking you. After a moment her words sink in, and you look at your surroundings. You are in your bed, covered in [pc.cumVisc], with Anno lying next to you, her tail, lower back, and enchanting butt plastered in your [pc.cumVisc] as well. Your bitch- no, your lover, breaks her frown and laughs softly. <i>“You got yourself, the bed, and me covered in your [pc.cum]. As much as I may love the stuff, I also love being warned when this sort of thing is going to happen.”</i>");
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
