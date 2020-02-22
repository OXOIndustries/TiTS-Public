public function kiroBimboRecruited():Boolean
{
	return (flags["KIRO_RECRUITED"] == 1 && kiro.isBimbo());
}
public function kiroBimboIsCrew():Boolean
{
	return (flags["KIRO_ONBOARD"] == 1 && kiro.isBimbo())
}
public function kiroAngelOrMaster():String
{
	if(kiro.short == "Kiro") return "Angel";
	else return "[pc.Master]";
}
public function bimboKiroTest():void
{
	clearOutput();
	output("Recruited: " + kiroBimboRecruited() + ", KIRO_RECRUITED: " + flags["KIRO_RECRUITED"] + ", bimbo? " + kiro.isBimbo());
	output("Onboard: " + kiroBimboIsCrew() + ", KIRO_ONBOARD: " + flags["KIRO_ONBOARD"] + ", bimbo? " + kiro.isBimbo());
}
//First Time BimboKiro Approach
public function approachBimboKiroCrew(back:Boolean = false):void 
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	if(flags["KIRO_BIMBO_MET"] == undefined)
	{
		flags["KIRO_BIMBO_MET"] = 1;
		output("You knock on [kiro.name]’s door.");
		output("\n\n<i>“Come in!”</i> her friendly voice calls back, lilting into the upper pitches of her vocal range with apparent happiness.");
		output("\n\nYou open the door to find a very naked [kiro.name] sprawling out on her bed, jerking off two-handed. If she feels any shame in the act, she doesn’t show it. In fact, she jerks harder and smiles more broadly when she notices where you’re staring, gathering a dollop of pre onto her finger to trace down the syrupy, well-drenched length of her cock. A distinctly equine flare appears the tip, swelling out with the beat of her heart, but somehow, she doesn’t cum. She rides the edge like an expert, locking eyes with you the entire time and licking her lips in apparent hunger.");
		output("\n\nAfter a minute of waiting for her to say something, anything, about the events that lead to her being in this state, you venture, <i>“Are you okay?”</i>");
		output("\n\nThe question makes [kiro.name]’s eyes light up. <i>“Am I okay? " + (kiro.short == "Kiro" ? "Angel":"[pc.Master]") + ", I just got rescued from capture by the best owner a girl" + (kiro.short != "Kiro" ? "-turned-toy":"") + " could ask for. And now like, I’ve had all this time to play with my cock, and all I can think about is how fucking awesome it is now. It’s better than ever. Po " + (flags["KQ_PO_DEAD"] != undefined ? "may have been":"may be") + " a total bitch or whatever, but " + (flags["KQ_PO_DEAD"] == undefined ? "she’s super hot":"she was super hot") + " too, and really, really good at making a girl cum hard. So hard.”</i> She actually breathes heavily at that admission. <i>“And after I jacked off four or five different ways, I realized you probably wouldn’t want me blowing huge sticky loads all over your nice ship all the time, and edging got so much easier! So yeah... I’m really horny, and I feel really good, and I want to fuck you or get fucked by you and kind of do whatever you want. It’s weird.”</i>");
		output("\n\nThat... is a lot to take in, but you knew [kiro.name] wasn’t going to be the same when you rescued her. <i>“What about being a pirate?”</i>");
		output("\n\n[kiro.name] drops her dick and shrugs, suddenly unsure. <i>“I loved it. Really. But if I’m being honest with myself, it was mostly a great excuse to go to strange places, meet strange aliens, and get my dick wet in new ways.”</i> She taps her chin as her flare recedes, the cummy length of her pole slacking the moment it becomes clear you’d rather talk than fuck. <i>“Now... you’re so much hotter than them. You’re like the galaxy’s " + pc.mf("hunkiest star","biggest bombshell") + ". Nobody else makes my dick hard as fast as thinking of you. I don’t want to go anywhere when I can be with you, helping you out.”</i> She chews one plush lip, thumbing at the expanded pout. <i>“And I know it’s artificial. I’m not an idiot, but to me, it feels real. Too real to ignore. Whatever I was before, I’m yours now [pc.Master].”</i>");
		output("\n\nYou ask her if that bothers her at all.");
		output("\n\nAn uncaring shrug ripples through the sluttified kui-tan. <i>“I guess sort of, but Po was my owner for a little bit too, and I just get hard instead of mad when I think about her. I really, really hope that doesn’t bother you. It’s just who - what I am nowadays. I’m like a living sex-doll now, and to me, it feels amazing.”</i> She shudders, stroking her hands across her cartoonishly swollen chest, making the milk-heavy masses wobble like bowls of jello. Her nipples blossom into swollen, distended teats from the mere sensation. <i>“I’m still the same girl - like, if you put me at some controls I can reach over these hefty beefers, I’ll still love flipping a ship through a gut-twisting corkscrew. It would just be better to do it with a dildo embedded in the seat and you telling me what I good pet I am for doing it. I am a good pet, right?”</i>");
		output("\n\n...uh, is [kiro.name] a good pet?");
		processTime(4);
		clearMenu();
		addButton(0,"Yes",yesKiroYoureAGoodPet,undefined,"Yes","After everything she's been through, it's the least you can do.");
		addButton(1,"No",noKiroYoureNotAGoodPet,undefined,"No","You're not going to drown her in superfluous praise.");
		return;
	}
	if(back)
	{
		output("[kiro.name] waits for you to make a decision with an adoring grin.");
		processTime(1);
		kiroBimboCrewMenu();
		return;
	}
	//Approaching BimboKiro v1 - horny bathroom girl
	if(rand(3) == 0)
	{
		output("You enter [kiro.name]’s quarters but the dolled-up tanuki is nowhere to be found. Your only clues are piles of cum-soaked panties and the fresh clouds of re-engineered kui-tan pheromones, pervasive yet strangely enticing. The sights and scents are so flagrantly erotic that you nearly forget to check the bathroom - until [kiro.name] flounces out with a supernova-sized smile and matching hard-on. Behind her, a bathtub worth of ‘nuki-spooge swirls and audibly churns in a drain-bound vortex.");
		output("\n\n<i>“" + (kiro.short == "Kiro" ? "Angel":"[pc.Master]") + "!”</i> Your sexdoll of a kui-tan drops to her knees with total enthusiasm, futilely struggling to contain her porno-tier tits’ errant jiggling. <i>“Do you wanna fuck?”</i> An accidental brush of a nipple forces out a gasp and a shudder. <i>“Mmmm that’d be really nice.”</i> She waddles forward on her knees, licking her lips.");
		output("\n\nWhat do you want to do with your pet?");
		processTime(2);
		kiroBimboCrewMenu();
		return;
	}
	//Approaching BimboKiro v2 - glossylips
	else if(rand(2) == 0)
	{
		output("Entering [kiro.name]’s quarters is like walking onto the set of a porno: you never know what perverse sight you’re going to see, but a musky cloud of fuck-scent will hang in the air all the same. This time, your dollified tanuki-pet lounges on her bed, idly stroking herself with one hand while the other precisely touches up her make-up. A codex, balanced on her distended sheath, provides a simple, cam-based mirror.");
		output("\n\n<i>“Ohhh, " + (kiro.short == "Kiro" ? "my Angel":"[pc.Master]") + " is going to ");
		if(pc.hasCock() && (!pc.isHerm() || rand(2) == 0)) output("demand I suck [pc.hisHer] cock when [pc.heShe] sees me like this.”</i> Swooning slightly, [kiro.name] purses her perfectly glossed lips one last time and gives an authoritative nod. <i>“[pc.HeShe] probably won’t even have to ask. [pc.HeShe]’ll just grab me back the back of my the head and fuck my slutty throat full of [pc.hisHer] perfect dick again and again~! I’m such a perfect to- Oh, hiya " + kiroAngelOrMaster() + "! Did you wanna fuck my face or like...”</i> she fumbles with her tits, <i>“fuck the rest of me?”</i>");
		else if(pc.hasVagina()) output("demand I plant these pussy-pleasers right on [pc.hisHer] cunt and make [pc.hisHer] eyes cross! [pc.HeShe] probably won’t even tell me. [pc.HeShe] will just grab me and use me, and it’ll feel sooo good.”</i> She purses her bubbly, glossed lips on last time and nods in satisfaction. <i>“I am such a perfect fuckto- oh, hiya " + kiroAngelOrMaster() + "! I just got done getting ready for you. You can put these slutty pussy-pillows to work right away... if that’s what you want. Or whatever, like, you wanna do.”</i> She tweaks one of her own nipples, whimpering encouragingly. <i>“Or any part of me you want to do.”</i>");
		else output("demand I give [pc.himHer] all the biggest, wettest, sloppiest kisses when [pc.heShe] sees this!”</i> Giggling to herself, [kiro.name] runs her tongue in a slow circuit over the pink-glossed angel bows, redoubling their shine until you begin to think you can see yourself in their coral reflections. <i>“[pc.HeShe]’ll use my slutty mouth again and again until [pc.heShe] gets so worked up that [pc.heShe] has to get a bunch of Throbb and Pussyblossom, take it all, and use the rest of me like [pc.heShe] does my mouth.”</i> Fumbling to dispose of the codex, your friend-turned-sex-pet boasts, <i>“I am such a perfect fuckto- oh, hiya " + kiroAngelOrMaster() + "! Did you wanna do some Throbb so you can fuck my face and pussy and ass back-to-back-to-back? It’d be super fun.”</i>");
		processTime(2);
		kiroBimboCrewMenu();
		return;
	}
	//Approaching BimboKiro v3 - self-milking
	else
	{
		output("Walking into [kiro.name]’s room provides you with a sumptuous view of your favorite furry fuck-toy greedily suckling at her own nipple. She’s so into guzzling her milk that she doesn’t seem to notice your entrance - or the rivers of creamy goodness sluicing through her otherwise gleaming, spotless fur. Her cock, jutting angrily upward, bobs with every swallow she takes, nuzzling into the cushy softness of cleavage like a pet begging for attention. Sadly, [kiro.name] is too busy milking herself to bother with masturbation. Simple suckles are sufficient to keep her eyes rolled most of the way and her occasional gasps for breath accompanied by joyful squeaks.");
		output("\n\n<i>“[kiro.name]?”</i> You clear your throat.");
		output("\n\nDespite her apparent subservience to your every whim, it takes a full minute for [kiro.name] to float back down from her lactic high. The milk-distended length of her nipple seems determined to stay locked within her maw, exposing a quarter inch of dusky, cream-glossed surface at a time. When it finally does pop free, milk splashes into [kiro.name]’s lap, and the tanuki wobbles from the burst of frictional pleasure. Still rubbing her productive tits, the sex-supercharged kui-tan has to blink a few times before her eyes will focus on you. <i>“" + kiroAngelOrMaster() + "? You know I’d never intentionally ignore you.”</i> She licks the excess milk residue from her lips. <i>“What can I do for the sexiest Captain-slash-owner in the galaxy?”</i>");
		processTime(2);
		kiroBimboCrewMenu();
		return;
	}
}

public function kiroBimboCrewMenu():void
{
	clearMenu();
	if(pc.lust() >= 33) addButton(1,"Sex",bimboKiroSexApproach,undefined,"Sex","Have some sex with your tanuki-pet.");
	else addDisabledButton(1,"Sex","Sex","You aren't aroused enough right now.");
	addButton(14,"Back",crew);
}

//No
public function noKiroYoureNotAGoodPet():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“No,”</i> you answer. <i>“A good pet would earn her praise instead of trying to bait me into it.”</i>");
	output("\n\nThe nude tanuki recoils as if struck, but she nods along with every word. <i>“You’re right, " + (kiro.short == "Kiro" ? "Angel":"[pc.Master]") + ". Po really didn’t get rid of my old instincts.”</i> She seems almost saddened by that. <i>“But if I can be an infamous pirate, I can definitely be a good pet. Watch and see, [pc.Master]. I’m going to make you so happy.”</i>");
	output("\n\nLike it or not, <b>[kiro.name] is your pet now.</b>");
	IncrementFlag("KIRO_BIMBO_NOTGOODGAL");
	//Strip bolds from above if crew notices added.
	//crew menu here~!
	processTime(1);
	kiroBimboCrewMenu();
}

//Yes
public function yesKiroYoureAGoodPet():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“Yes,”</i> you answer with a friendly smile. This is [kiro.name], the friend you flew across the galaxy to rescue. If she wants to be a good pet, well, she’s well on her way to being the best pet. The <b>best girl</b>. <i>“You’re amazing.”</i>");
	output("\n\nYour words strike [kiro.name] like a physical object. Recoiling, the tanuki’s falls backwards onto her tail, eyes rolling back in apparent bliss. She whimpers, squirming in gasping in pure, sublime joy, eventually managing to murmur, <i>“[pc.HeShe] said I’m amazing!”</i> Cum drizzles from the tip of her half-hard cock, thick and copious enough to frost a dozen cupcakes but instead creating a deep, ball-soaking puddle. She writhes in her own mess in mindless ecstasy, yet somehow she manages to do so in a way that displays as much of her hyper-sexualized form as possible. Even when experiencing orgasmic pleasure, she’s still trying to please you.");
	output("\n\nYou’re tempted to say it again, just to see what would happen.");
	output("\n\n<i>“" + (kiro.short == "Kiro" ? "Angel":"[pc.Master]") + ",”</i> [kiro.name] whimpers, slowly dragging herself up to a seated position position once more, a task made more difficult by her own puddled virility. <i>“I... wow. It feels... good to be a good girl. Amazing.”</i> You can’t see it, but she’s definitely blushing under her fur. Tucking her arms under her chest, the gasping, self-identified pet says, <i>“You need to know that even before this... I would have picked you. If I was told I would be </i>someone’s<i> pleasure slave, and that I got to pick my who, I would have picked you.”</i> The gleeful kui-tan reaches for a couple sets of lacy undies (where did those come from?) and gingerly dabs at her messy genitalia. <i>“Now, are you going to let me be a real good girl and let me service you, or do you need my help manning a turret or something? I bet the vibrations feel really good...”</i>");
	output("\n\nIt would seem that <b>[kiro.name] is your pet now</b>, and a good one at that!");
	processTime(2);
	IncrementFlag("KIRO_BIMBO_GOODGAL");
	//Sex menu
	kiroBimboCrewSexMenu();
}


//Sex Approach BimboKiro
public function bimboKiroSexApproach():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("[kiro.name] will gladly join you in any position or request you make of her. All you have to do is say the words.");
	output("\n\n<i>“Oooh, I know that look!”</i> the bouncy happy-go-lucky fuck-pet cheers. <i>“You’re thinking about banging me, aren’t you?”</i> Stroking a suddenly rock-hard cock, [kiro.name] arches her back and hefts a tit with her free hand. <i>“Why don’t you take a moment and admire the total package? All of this,”</i> she strokes from the tip of her flaring dick all the way down her sheath, around the curvature of her swollen nutsack, and back to her pussy, <i>“is yours. All of it.”</i> She lifts her leg to better display the slick entrance, nearly losing her balance when her tits shift in an unexpected way.");
	output("\n\nShe certainly is quite the sexual cornucopia. How will you take her?");
	processTime(2);
	pc.changeLust(5);
	kiroBimboCrewSexMenu();
}
public function kiroBimboCrewSexMenu():void
{
	clearMenu();
	if(pc.hasCock())
	{
		addButton(0,"Titfuck",penisRouter,[tittyFuckBimboKiroWithNormalDingus,80085,false,0],"Titfuck","Slide your dick into her breasts and let her milk the orgasm right out of you.");
	}
	else addDisabledButton(0,"Titfuck","Titfuck","You don't have the male genitalia required for this.");
	if(pc.hasVagina())
	{
		addButton(1,"Ride Her",vaginaRouter,[rideCowgirlBimboKiro,kiro.cockVolume(0),0,0,true],"Ride Her","Lay Kiro back on the bed and ride her cow-girl.");
	}
	else addDisabledButton(1,"Ride Her","Ride Her","This requires you to have a crotch-mounted vagina.");
	addButton(14,"Back",approachBimboKiroCrew,true);
}

//RideCowgirl BimboKiro
//Ride her on the bed. If you have crotch-covering panties, tie them over her nose-mouth halfway in.
//Paragraph of titfucking for futas + cummy titties paragraph
//Treated pussy admiration
//Venompussy double-cummies
public function rideCowgirlBimboKiro(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("The instant you suggest riding her cow-girl, [kiro.name] catapults back on the bed, all but pinned beneath the weight of gargantuan breasts, with her cock surging up her belly so rapidly that the surrounding bellyfur visibly ruffles. Her fat flare batters her boobs out of the way to strike deep into the kui-tan’s cleavage. Physics doesn’t let it linger long; her pressurizing phallus plumps and pumps, bouncing up at inch at a time, erecting itself to stuttering tempo of steadily-mounting ardor. Her dusky chocolate cock quivers in the air, almost vibrating with need.");
	output("\n\nIt looks like it’s begging for you already.");
	//Covered
	if(!pc.isCrotchExposed()) output("\n\nYou shed your coverings in a hurry" + (!pc.isCrotchExposedByLowerUndergarment() ? ", slinging your [pc.lowerUndergarment] onto the bed next to [kiro.name]. She might appreciate a whiff of your cunt since she’s about to be intimately acquainted with it":"") + ".");
	//murgie wurgies! ~OwO~ no new pawagwaffs!
	output(" A little care might be in order for most girls, but you know from experience that [kiro.name] prefers the direct approach. The floor vanishes as you launch into bed, landing " + (pc.legCount > 1 && pc.hasKnees() ? "with your [pc.knees] to either side of a leg":"landing squarely between [kiro.name]’s legs and well shy of her sweltering ballsack") + ".");
	if(pc.tallness < 60) output(" Cock looms in front of you like a titanic totem.");
	else output(" Cock waves eagerly in front of your [pc.chest].");
	output(" The air around it appears cloudy with the tanuki’s augmented pheromonal load, intense enough to make your [pc.vaginasLight] ");
	if((pc.vaginalPuffiness(x) >= 1 && rand(2) == 0) || pc.vaginalPuffiness(x) >= 2) output("ripen to dangerously puffy plumpness");
	else if(pc.wetness(x) < 2) output("dampen");
	else if(pc.wetness(x) < 4) output("transition from moistened to truly wet");
	else if(pc.wetness(x) < 5) output("wet enough to dribble down your [pc.thighs]");
	else output("soak your [pc.thighs]");
	output(" from a single whiff. Leaning closer seems the right idea, and extending your tongue to lavish a slow lick from the medial ring all the way up to the pulsating tip is even better.");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your cunt" + (pc.hasVaginas() ? "s":"") + " clench" + (!pc.hasVaginas() ? "es":"") + " hard from the taste.");
	else output(" You spool out more and more oral muscle, pressing tastebud after tastebud to cock until your puss" + (pc.hasVaginas() ? "ies are":"y is") + " violently clenching from the flavor alone.");
	output("\n\n<i>“Yesss,”</i> hisses the supine slut. <i>“But I thought you were going to riii-i-i-YEEEAAAA!”</i>");

	output("\n\nA flick of the tongue a wet kiss from your [pc.lips] is all it takes to keep [kiro.name] in the right state of mind. She bucks against you until you pull away, only bothering to master her surging animal instincts when they cost her pleasure.");
	output("\n\n<i>“Mmmmph... please don’t stop. I don’t care how you fuck me, " + kiroAngelOrMaster()  + ". Just please... don’t stop.”</i>");
	output("\n\nStifling a giggle of your own, you stop teasing the poor thing and rise up, holding [pc.oneVagina] in place just above [kiro.name]’s sloppy, drooling crown. You can sort of feel it, even without touching it, like the heat and passion are so intense that they can radiate through empty air to tease your cuntlips. It’s enough to give you pause - for all of a half-second. You can’t hold back now, not when penetration and pleasure are so close. All you want to do is slam down and powerfuck your way to " + (!pc.isPregnant(x) ? "a belly-bulging creampie":"a cunt-flooding powerfuck") + ".");
	output("\n\nSomehow, you master your baser impulses enough to arrest your rapid descent before impact. [kiro.name]’s blunt, beast-taming tip kisses down on your vulva like a long lost lover, but a kiss alone won’t satisfy you. You relax your [pc.legOrLegs] a little and let gravity help, driving that fat crown through your ");
	if(pc.wetness(x) >= 4) output("gushing");
	else if(pc.wetness(x) >= 3) output("drooling");
	else if(pc.wetness(x) >= 2) output("dribbling");
	else output("sopping");
	output(" gates with a satisfying ‘pop’. It feels better than you could have thought. In a single instant, you go from horny to full, drowning in a wave of frictional sensation that hits so hard you forget your name for a " + (!pc.isBimbo() ? "second":"while.\n\nWhatever. Who needs a name when you can fuck someone this good?"));
	output("\n\nYou come to with [pc.oneClit] caught on [kiro.name]’s medial ring" + (pc.vaginalCapacity(x) < kiro.cockVolume(0)*1.2 ? ", your cunt straining so taut and tight around the tanuki’s animal anatomy that the lips shine like brand new plastic":", your capacious cunny more than willing to glide down the rest of the tanuki’s animal anatomy the moment you adjust your angle or provide a touch more force.") + " She’s just so damn <b>warm</b> inside you. Being filled by [kiro.name]’s horse-dick is a heavenly sensation. She feels like she’s doing nothing but radiating heat and love into your body.");
	output("\n\nYou vagina is just her conduit.");
	output("\n\n<i>“" + (kiroAngelOrMaster()) + "?”</i> the fluffy fuck-toy moans. She’s looking at you with deep concern, her eyes fluttering from your " + (pc.vaginalCapacity(x) < kiro.cockVolume(0)*1.2 ? "straining":"distended") + " quim to your face with alarmed rapidity.");
	output("\n\nYou nod, not quite trusting your voice when mouth is so full of drool. A gentle, reassuring belly-pat gives you all the time you need to swallow and say, <i>“I’m fine. It just feels really, really good.”</i> You work yourself a bit lower, gasping when the medial ring performs a second pussy-pleasing pop, and manage to keep your eyes from rolling back long enough to coo, <i>“See?”</i> You sink an inch at a time, ratcheting that feeling of glorious fullness higher and higher and higher. The more cock you take, the better you feel. Touching down against her precum-soaked sheath almost comes as a disappointment - until you wiggle your hips and realize how good those slippery folds of skin feel rolling over your clit" + (pc.totalClits() > 1 ? "s":"") + ".");
	//Virginity checks
	pc.cuntChange(x,kiro.cockVolume(0));
	//Treated Pussy
	if(pc.isTreated()) output("\n\n[kiro.name] is no better off. Her fingers dig deep into the bedsheets, squeezing in helpless joy at just how good your [pc.vagina " + x + "] feels. <i>“Void, you Treated " + pc.mf("folks","girls") + " break my dick every time.”</i> She whimpers, her whole body shivering. <i>“Fucks like this are half the reason it got so hard for me to get off, but now... the only thing keeping me from cumming is that I want to wait for you.”</i> An uncharacteristically high-pitched whine slips from her pink, pursed lips. <i>“You’re probably not even thinking about it. You just do it. Your muscles just - hnng - squeeze and ripple better than my milker ever did. It’s like every inch of your cunt is begging for my cum, and it’s sooo hard to hold back for you. If I could go back in time, I’d just beg you to take the Treatment sooner.”</i>");
	//Hosspussin’
	else if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE) output("\n\n[kiro.name] fares no better. Staring down in fascination, she mumbles, <i>“Mmm... stupid... horse-pussy ruins me...”</i> She twists her fingers deeply into the sheets, hapless against the perfectly mated shape of your animal-like anatomy. <i>“Rubs the best parts the right way... an’ so tight and hot - ung!”</i> [kiro.name]’s eyes roll halfway back, but it doesn’t stop her babbling on about your plump pussy. <i>“Makes me wanna blow a load right now. Like this is just... where it belongs. You have the perfect pussy for me, " + kiroAngelOrMaster() + "!”</i> Powerful throbs roll through her, flexing and flaring all twenty-plus inches equine power. <i>“Mmm, makes me feel like some kind of breeding toy. Like I was already designed for you before anything else happened to me! This cunt... this cunt tames me.”</i>");
	//Venompuss
	else if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) || pc.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_BASED)) output("\n\n[kiro.name]’s eyes go wide for a second. <i>“Did... umm... whoah.”</i> Her blunted clawtips dig deep furrows into the sheets as she scrabbles wildly. <i>“Ohhh that makes so much more sense.”</i> Her whole rod, captive in your venomous cunt, spasms violently, taking on a little more blood to pump up for your pleasure. <i>“Void, I can’t control it! So hot and sensitive! I’m just soaking up your venom aren’t I?”</i> Her eyes roll back, but she keeps babbling, <i>“Oh fuck, I’m just your lust-drugged fuck-doll. Just being inside you is as good as cumming.”</i> Powerful throbs roll through her, one after another. True to her word, it sort of feels like an orgasm but without all the cum you’d expect. <i>“Just hook me on your pussy and never take me out!”</i>");
	//Normalpuss
	else output("\n\n[kiro.name] slaps the sheets, her eyes rolled halfway back. <i>“Y-y-yeah. You’re so fucking fine!”</i> Her dick throbs potently inside you. <i>“I don’t know if it’s ‘cause I’m horny for you all the time now or if I’ve just always loved you this much, but it feels you have the best pussy in the entire galaxy.”</i> She pants for more breath while awkwardly rubbing at her fat, wobbling tits. <i>“" + (pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY ? "It’s a literal honey-cunt! Even if it wasn’t, it would be sweet to me.":"It’s such a honey-cunt!") + " I could probably track you by it for miles, crawling obediently after you with my dick rock-hard and ready the entire way”</i> [kiro.name]’s eyelids flutter as she whorishly moans. <i>“The moment you looked back and crooked your finger, I’d probably cum right then and there.”</i>");
	//Merge
	output("\n\nPraise like that is all well and good, but you came to [kiro.name] for a serious dicking, and as her owner, you’re going to claim it. <i>“Thanks, sugar.”</i> You brace your hand against her chest and scissor your hips up into the air, dragging yourself across a full ten inches of horse-dick without even hitting the midway point. <i>“Now I’m gonna fuck ya.”</i> You throw yourself back down with every bit of force you can muster, slapping your [pc.butt] into [kiro.name]’s thighs hard enough generate a thunderous clap.");
	output("\n\nThe cock-capturing impact ripples all the way through the kui-tan’s body to her plush pillows of her chest. Dribbles of milk spill out as they shake, but you’re already rebounding, bouncing up all the way to the medial ring this time before reversing direction. A full of fragrant, trembling pole plows through your [pc.vaginaNoun " + x + "], slamming the next foot or so straight up against your " + (!pc.isPregnant(x) ? "dilating":"taut cervix") + ". You wiggle in place, grinding your hips in a slow circuit, then rise up for another.");
	var y:int = pc.biggestCockIndex();
	if(!pc.hasCock()) y = -1;
	//Titfuck
	if(y >= 0 && pc.cocks[y].cLength() >= 16)
	{
		output("\n\nAt times like this, you adore being a hermaphrodite. You’re having the fuck of a lifetime, and without any additional effort on your part, your [pc.cockBiggest] flops out right into the space between [kiro.name]’s tits. Of course the sex-addicted tanuki props her wobbly mountains up around it right away, letting the up-and-down motions of the rest of your body drag your sensitive length in and out. You fuck her tits without even trying. It’s simply nature.");
	}
	output("\n\nThis isn’t tender love-making. This is primal, hungry mating. Pinning [kiro.name] down with your [pc.hips] has never felt more powerful or more right. Shifting to grab her tit instead of politely bracing on her chest seems like the best idea in all the known universe, so you do it, daring to go so far as to pinch her nipple until it fountains milk.");
	output("\n\n<i>“Haaaaa! Yes, " + kiroAngelOrMaster() + "! Fucking use me! All of me!”</i> the grinning doll begs, pushing up her other breast for you to abuse. <i>“Just touching you is happier than all the birthdays in the world, and I know on some level that squeezing like that ought to hurt my nipple, but it’s just like... more pleasure. Pointier pleasure. Pinch my other one!”</i> She bites her lip, aware that she’s in no position to demand anything. <i>“You could probably slap me, and I’d get too horny to think. Mmmf, just do whatever the fuck you want to me. Choke me out; I don’t care. Fucking-oh-my-stars, I love being your toy!”</i>");
	output("\n\nNow there’s an idea - would you rather keep playing with her boobs or see how the tanuki would appreciate a firmer grip on her psyche?");
	processTime(12);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Tits",pinchyPinchyKiroNippy,x,"Tits","Pinch and play with her big, milky tits.");
	addButton(1,"Choke",chokeUrNuki,x,"Choke","Give her what she wants and get a little edgier.");
}

//Choke
public function chokeUrNuki(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output((pc.tallness >= 60 ? "Leaning a little higher up":"Stretching and straining to reach higher") + ", you grab [kiro.name] by the sides of her throat and squeeze. You don’t go for her windpipe - that would be cruel and unnecessary, even if she truly is incapable of suffering at your hands. No, you focus on pressing your fingers and thumb down from the sides, compressing her neck just enough to make her feel owned and perhaps a little light-headed.");
	output("\n\nIt does the trick.");
	output("\n\n[kiro.name]’s jaw goes slack and her eyes immediately unfocus, gazing deeply into nothing. It’s far too soon for your firm hand to cut off any serious air or blood flow, yet the tanuki is so limp in your grip that you could probably pose her however you liked - if you weren’t too busy fucking her like your pussy depended on it.");
	//First time no new pg
	if(flags["KIRO_BIMBO_CHOKED"] == undefined)
	{
		output(" <i>“[kiro.name],”</i> you call, still holding firm but increasingly concerned.");
		output("\n\nThe choke-doped tanuki’s head lolls vaguely in your direction. <i>“Yah-huuuh?”</i>");
		output("\n\n<i>“Are you okay?”</i>");
		output("\n\n<i>“Mmmhmm,”</i> [kiro.name] hums as her cock continues to floss through your netherlips at speed. <i>“Yurr chokhing mhe shoooo good. Like an off schwitch for muh brain. Just yur fuckmeat.”</i>");
		output("\n\nOh. Okay then. You tighten your grip down with confident authority, and [kiro.name] responds by exploding into violent orgasm.");
	}
	//Repeats no new pg
	else
	{
		output(" <i>“[kiro.name],”</i> you call with a saucy smile, <i>“tell me again what choking you makes you?”</i>");
		output("\n\nThe dopey tanuki’s head lolls in your direction with the vaguest hints of ecstasy writ across her mostly-limp features. <i>“Yurr fuckmeat. It’s schooo good... like you schqueesh down ahn muh brain flipsh off. You control everrrrything... ‘shpecially muh dick and cum an... uh... goood...”</i>");
		output("\n\nThere’s your slutty girl. You squeeze her a little tighter, and right on cue, her dick goes off like shaken champagne bottle, exploding into violent orgasm.");
	}
	//Merge - no new PG
	output("\n\nThoroughly enslaved spunk spatters" + (!pc.isPregnant(x) ? " against the deepest depths of your womb, flooding your fallopian tubes with gooey goodness.":" against your sealed cervix, backwashing out around the jerking horse-cock’s base to drench the supine herm.") + " So much kui-tan seed rockets out" + (!pc.isPregnant(x) ? " that you quickly sport a bit of a cum-heavy bump.":"that the fur beneath you goes from chocolate to pure white in heartbeats."));
	output("\n\nYou don’t let the cascades of spunky goodness weaken your grip, nor do you allow them to affect the rhythm of your hips. You fuck the tanuki the whole way through her climax, loving how it feels when your downstrokes collect layers of pudding-thick semen on your well-fucked lips. Then you slap the whole mess home on [kiro.name]’s sheath and belly, impregnating her fur with her own load. There’s something so hot about feeling jisming bubbling and churning inside of and out of you while you take what is yours. Sex shouldn’t be capable of being this hot, or this wet, or this good.");
	output("\n\n[kiro.name] agrees with you. She’d be flopping around like a bobble-head if you didn’t have her neck clamped tight, yet you know that behind those vacant eyes, she’s loving this. You can feel it the way her cock stays rock-hard despite a flagging orgasm, how it violently jerks with the effort of discharging its load as deeply into you as possible. Slipping your thumb into her loose lips seems like the obvious next step, and the randy slut proves you right by clamping those pink-painted kissers down and sucking hard.");
	output("\n\n<i>“Mrmmm...”</i> comes the low groan of satisfaction as the last sloppy shots " + (!pc.isPregnant(x) ? "force their way into your cum-saturated uterus":"backwash their way onto the bed") + ". Perhaps now would be a good time to check on her....");
	output("\n\nYou increase your pace but loosen your grip, panting, <i>“[kiro.name]?”</i>");
	output("\n\nThe tanuki doesn’t respond right away, too busy suckling your digit like the tastiest treat in the galaxy, and when she does, it’s to look up at you with pleading doe-eyes. One of her hands tenderly reaches up and grabs your wrist, silently pushing it further against her neck.");
	output("\n\n<i>“Okay,”</i> you say, letting that hand hold its position while the other gathers a creamy dollop of spooge on its thumb. <i>“Let’s give you something better to taste this time.”</i> Your fingers seem to fit back against her neck perfectly. You swap thumbs, and the kui-tan’s lights go off with a satisfied-sounding moan from the upper reaches of her airway. She doesn’t need to use her voice to tell you how much she loves it though, you can tell how much she loves it when her diminishing flare reverses directions, pressing hard on your walls.");
	IncrementFlag("KIRO_BIMBO_CHOKED");
	kiroBimboCowgirlRideAfterChoice(x,true);
}

//Tits
public function pinchyPinchyKiroNippy(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You’re quite fine with her tits, but you can give her the two-handed approach she so desperately deserves. You grab [kiro.name]’s other nipple and pinch it twice as hard, and true to her word, she doesn’t cry out in pain. She screams with joy.");
	output("\n\nMilk fountains high into the air over [kiro.name] as she’s driven to an instantaneous orgasm. Her flare doubles in width in the span of a few heartbeats, forming a tight seal around the borders of your deepest recesses, and then it unleashes a thick, hot flow of kui-tan seed, so high-pressure" + (!pc.isPregnant(x) ? " it floods directly into your vacant womb":" it bows her cockhead backwards around the edges and erupts out of your cunt across the bed") + ". You keep bouncing, however. It’s fun to watch the fluffy fuck-doll’s features contort through different, rictus-like expressions of mind-bending joy as you twist and tweak her nipples into giving up nearly a liter of milk.");
	//bonusfuta addon:
	var y:int = pc.biggestCockIndex();
	if(!pc.hasCock()) y = -1;
	if(y >= 0)
	{
		output("\n\nAnd your [pc.cockBiggest]! Resting where it is, it has the unique pleasure of getting to experience everything you’re doing to [kiro.name]’s nips secondhand. When you twist or tug, the jello-like mass of kui-tan tit radiates the kinetic energy down as additional friction. The milk soaks into your prickskin, changing the texture from silken fur to swampy, well-used sex-toy. It feels so good that it actually forces you to change the way you hump, swiveling your hips a bit forward to get a bit more sensation through your rigid shaft.");
	}
	output("\n\n[kiro.name] is a dazed mess by the end of, but despite her flare receding, her body won’t let her go soft while she’s inside. She’s steady and sturdy, firm and warmer than ever with the addition of a heaping helping of her warm, fresh-brewed cum. Smiling up at you, she whimpers something that sounds a lot like <i>“love”</i> and presses in on her tits from the outside, bulging them higher and firmer, presenting you a clearer line of bouncing cleavage to enjoy while your humps subconsciously accelerate.");
	kiroBimboCowgirlRideAfterChoice(x,false);
}

//murgies
public function kiroBimboCowgirlRideAfterChoice(x:int, choked:Boolean = false):void
{

	output("\n\nThere’s no way you can hold yourself back now. You’re too horny - too full of cock and cum and clenching, desperate for more. You look down at the " + (choked ? "semi-conscious ragdoll":"milk-painted doll") + " and smile to yourself. She loves you completely and totally, with no exception. Her cock is hard, not just because she knows you want it to be, but because she desires you utterly and wholly." + (choked ? " It’s such a sweet, blissful thought that you nearly let go of her neck":" You actually go easy on her nipples for a moment") + " - until a paroxysm of pleasure wrings your fingers tighter and drives everything but the feel of your pussy around a hot, hard, horse-dick from your head.");
	output("\n\n<i>Cock.</i>");
	output("\n\nYou cling to it. You squeeze it. You bounce, not even aware that you’re humping nearly the full twenty-plus inches with each stroke. It’s good, and it’s yours. You can ride this dick as much as you want, and nobody will mind, especially not its owner. " + (!choked ? "Her eyes are large and luminous as her flare firms up once more, somehow able to tell that you want the extra friction on your walls.":"Her eyes are dull and rolled back most of the way. She wants to be treated like brain-dead fuck-meat, and you’re doing it, even the sensation of her flare massaging your walls causes your grip to slip."));
	output("\n\nYou cum" + (pc.hasCock() ? " like a firehose":"") + ".");
	output("\n\nSuddenly, whatever your hands were trying to do isn’t important anymore. They fly to your [pc.chest]");
	if(pc.hasDickNipples()) output(", rooting your [pc.dickNipples] so you finally let loose a long backed-up load from them");
	else if(pc.hasLipples()) output(", rooting into your [pc.lipples] so you can feel full and warm in as many holes as possible");
	else if(pc.canLactate())
	{
		output(", coaxing yourself to spray [pc.milk] across [kiro.name]’s own leaky udders with artless enthusiasm");
	}
	else if(pc.biggestTitSize() < 1) output(", rubbing your [pc.nipples]");
	else output(", groping your [pc.chest] so hard that it hurts, but much like [kiro.name], it only makes your climax better");
	output(".");
	output(" You scream in joy as a river worth of baby batter bursts into your seizing twat. Your cunt blisses out on it, blasting your brain with a supernova of pleasure.");
	output("\n\nThere is only [kiro.name]’s cock, spraying cum.");
	output("\n\nThere is only your cunt, scoring white-hot lines of ecstasy up your spine.");
	var y:int = pc.biggestCockIndex();
	if(!pc.hasCock()) y = -1;
	if(y >= 0) output("\n\nThere is only the deepening puddle of [pc.cumNoun] in your pet’s cock-worshipping tits.");
	output("\n\nYou shudder, and the lights go out.");
	output("\n\nThe pleasure remains...");
	processTime(20);
	pc.orgasm();
	if(!pc.hasDickNipples() && !pc.hasLipples() && pc.canLactate()) pc.milked();
	clearMenu();
	addButton(0,"Next",kiroBimboCowgirlOutro,x);
}

public function kiroBimboCowgirlOutro(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("When you come to, you’re snuggled up into [kiro.name]’s expansive chest. Her cock, you note, is still stuffed firmly between your " + (pc.legCount > 1 ? "[pc.legs]":"[pc.thighs]") + ", just as hard as before yet somehow, it feels... passive." + (!pc.isCrotchExposedByLowerUndergarment() ? " The tanuki has your undies in her hand, held up to her nose as she slumbers. Whenever she inhales, her dick throbs, and her sleeping lips curl upwards in a saucy smile.":" The tanuki rests fast asleep, seemingly content to be your personal pillow-slash-pussyrest."));
	output("\n\nYou’re so sensitive that pulling out nearly tempts you into fucking the slumbering slut all over all again, but with gritted teeth, you guide her fattened prickhead out of your " + (pc.vaginas[x].looseness() < 4 ? "temporarily ":"") + "gaped hole and rise up.");
	output("\n\n<i>“" + kiroAngelOrMaster() + "?”</i> [kiro.name] murmurs, <i>“Am I a good girl?”</i>");
	//[Good Girl] [Sleep, slut]
	processTime(25);
	clearMenu();
	addButton(0,"Good Girl",goodGirlCowgirlBimboKiro,undefined,"Good Girl","Make her feel even better.");
	addButton(1,"Sleep Slut",tellBimboKiroToSleepAfterCowgrill,undefined,"Sleep Slut","Tell her to rest up. Who knows when she'll need to be ready to satisfy you again...");
}

//Sleep, slut
public function tellBimboKiroToSleepAfterCowgrill():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Go back to sleep, slut,”</i> you whisper back. [kiro.name] shifts slightly" + (!pc.isCrotchExposedByLowerUndergarment() ? ", burying her nose into a different pair of undies when you snatch yours back":", burying her nose into a pile of lacy undies") + ". Her breaths steady as her eyes close. Even if you didn’t say it, you know in the back of your mind that she’s a pretty good girl.");
	processTime(2);
	IncrementFlag("KIRO_BIMBO_NOTGOODGAL");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Good girl
public function goodGirlCowgirlBimboKiro():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output((!pc.isCrotchExposedByLowerUndergarment() ? "Snatching back your undies, y":"Y") + "ou say, <i>“Yes, [kiro.name]. You’re a good girl,”</i> and pat her gently on the head. Her ears fold the whole way back as she sighs in quiet satisfaction, only nosing back into the blankets and forest of used panties once you let her go. Then, she starts to snore, her cock-rock hard and drooling as she murmurs, <i>“Im sucha good gurrrl for [pc.name],”</i> under her breath. <i>“Gunnah... be... sho goooooood.”</i>");
	output("\n\nYou bet she will.");
	processTime(2);
	IncrementFlag("KIRO_BIMBO_NOTGOODGAL");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tittyfuck Kiro - Normal Dongalongs
//PC sat on bed, Kiro kneels and services the titties - choice of lube: cum/pussy. Nut deep into cleavage. Never see cock pop out cuz too smol.
public function tittyFuckBimboKiroWithNormalDingus(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You announce that you’d like to fuck [kiro.name]’s tits, and the moment you speak the words, you know you’ve made the right choice.");
	output("\n\n[kiro.name]’s eyes light up as her hands dip down to heft the titanic melons. <i>“You wanna fuck these?”</i> It takes all of her strength to lift one up, but she does so with precision, causing the pillowy mounds to roll and wobble against one another like cresting waves of flesh. Her cleavage is an undulating snake, wiggling more artfully than a stripper’s hips or a belly-dancer’s middle. It calls to you, beckons for you to grab hold and use them, but [kiro.name] isn’t closing the distance just yet. She’s too busy watching you while wearing a lopsided, pointy-toothed grin and jostling her boobs around like she should’ve been born a galotian.");
	output("\n\n<i>“Yes.”</i> Your mouth feels dry");
	if(!pc.isCrotchExposedByLowerUndergarment()) output(" and your undies tight.");
	else if(!pc.isCrotchExposedByArmor()) output(" and your equipment tight.");
	else output(" and your [pc.cocks] unreasonably hard.");
	output("\n\n<i>“Then sit down" + (!pc.isCrotchExposed() ? " and whip it out":"") + ", " + kiroAngelOrMaster() + ". You should really be seated while I take care of " + (!pc.hasCocks() ? "that bulge":"those bulges") + ".”</i> [kiro.name]’s tail gestures behind you at a relatively clean, dry corner of the bed. <i>“That way you can relax while the tits you love so much smother every... inch... of cock.”</i> She purses her fuschia lips thoughtfully. <i>“I bet if I squeeze you long enough and tightly enough, you might even swell up enough for me to kiss the tip!”</i>");
	//Close:
	if(pc.cocks[x].cLength() > 15)
	{
		output("\n\nSparing a glance the sheer size of the kui-tan’s bosom while you climb onto the bed" + (!pc.isCrotchExposed() ? " and undress":"") + ", you have to admit that her suggestion is a distinct possibility. With a little luck, you just might pierce the veil of her smothering cleavage and meet the luscious swells of her lips.");
		if(!pc.isCrotchExposed()) output(" Your [pc.cocks] swing" + (!pc.hasCocks() ? "s":"") + " up, ready for the challenge.");
	}
	//Not close.
	else
	{
		output("\n\nDismissively glancing at the kui-tan’s bosom while climbing into bed, you immediately disregard the suggestion. No matter what she thinks of you or your dick, there’s no way you could mount those luscious swells from bottom to top, let alone actual stretch out for the smothering warmth of her lips.");
		if(!pc.isCrotchExposed()) output(" Undressing comes as an afterthought but a necessary one. Your [pc.cocks] swing" + (!pc.hasCocks() ? "s":"") + " up, free and ready.");
	}
	//merge
	output("\n\n<i>“Oooh,”</i> [kiro.name] gawks as she tumbles to her knees in front of you, leaning forward to nuzzle her cheek against [pc.oneCock]. <i>“What a lovely penis you have, " + kiroAngelOrMaster() + ". So haaaard.”</i> She pants, a little unfocused when her fat, blunted tip unintentionally bumps against your [pc.leg]. <i>“Mmmm, but it wouldn’t be much of a titfuck without lube, would it?”</i> She kisses ");
	if(pc.hasSheath(x)) output("the deepest, most recessed parts of your sheath with a happy purr.");
	else if(pc.hasKnot(x)) output("around the circumference of your [pc.knot] a dozen times, each one harmonized with a happy purr.");
	else output("all over your base, daring to slurp her tongue across your pubic mound with a happy purr.");
	output(" Pulling away seems to be a supreme act of will on her part, like the cock has a magnetic leash on her brain that won’t let her drift too far away, but somehow, she manages to hold herself at bay long enough to ask, <i>“Should I use milk... or my girljuices, or my cum" + (pc.cumQ() >= 10000 ? ", or just let you fountain pre like some kind of sex-god":"") + "?”</i>");
	//[Pussyjuice] [Cum] [Your Pre][Milk]
	processTime(10);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Milk",lubeBimboKiroTitsWivMilkies,x,"Milk","Use her milk for lube.");
	addButton(1,"Pussy Juice",kiroBimboLubesTitsWithPussy,x,"Pussy Juice","Use vaginal juices for lube.");
	addButton(2,"Cum",kiroBimboLubesWivHerCummies,x,"Cum","Lube her tits with her cum.");
	if(pc.cumQ() >= 10000) addButton(3,"Your Pre",useMyPreForLubeKiro,x,"Your Pre","Use your copious pre for lube.");
	else addDisabledButton(3,"Your Pre","Your Pre","You're do not produce enough pre-cum for this.");
}

//Your Pre
public function useMyPreForLubeKiro(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“My pre,”</i> you answer with supreme confidence. Why else would you have made yourself so full of cum that you can shoot pre like lesser " + pc.mf("","wo") + "men orgasm?");
	output("\n\n[kiro.name] slurps up a little drool and nods obediently. <i>“Right. Your... pre.”</i> She reaches for [pc.oneCock] and begins to gently stroke it, sending shivers of delightful pleasure up your spine. She knows just how to handle your " + pc.mf("man","herm") + "hood, all the best places to touch and to rub. It is with almost effortless ease that she seems to coax you into leaking, but she doesn’t bother to catch that trifle, not when she can squeeze you from the tumescent base all the way to swollen tip and gather enough to slick her palm. <i>“Ohhh, this is why I love you, Angel. You make it so easy for me.”</i> She repeats the motion, filling her paw to overflowing. <i>“And so <b>wet</b>.”</i>");
	output("\n\nYour slutty service nuki slops the gathered goo directly into her cleavage, offhandedly caressing your [pc.cocksLight]. Once her hand emerges, largely dry, her grip re-tightens. This time when she milks you, it only takes a single stroke to flood her hand to overflowing. Dribbles spill out onto the horny hermaphrodite’s thighs, but she hardly minds. Instead, she shovels the clingy pre-spunk back onto her chest with obvious delight. [kiro.name] drools in cum-thirsty hunger, her spit mixing with the fragrant, cock-spewed slurry as she heaves larger and larger quantities of pre into her chesty chasm.");
	//Multidicks
	if(pc.hasCocks())
	{
		output("\n\nYour other endowment" + (pc.totalCocks() > 2 ? "s are":" is") + " not left out. A flex and phallic bounce is all it takes for your tanuki-slut to zero in on " + (pc.totalCocks() == 1 ? "it":"them") + ". Two handed, she can pump " + (pc.totalCocks() == 2 ? "both pricks at once":"two pricks at a time, rotating to touch each and every single one of your needy poles") + ". Nobody should be this good at giving handjobs, but her fingers know exactly where to press down to the millimeter, and the supple warmth of her padded paws feels so good once a hint of pre transforms them into high-quality masturbation toys. They’re even better when she forgets to take the pre where she’s supposed to.");
	}
	//merge
	output("\n\nThe kui-tan can’t even seem to find a dry spot to wipe her hand" + (pc.cockTotal() > 1 ? "s":"") + " off anymore. Most of her pelt shines, visibly slicked down, and the interior of her cleavage is completely impregnated with distilled lust. When she smears " + (pc.cockTotal() > 1 ? "a":"her") + " hand around the bottom of her sultry canyon, crystalline droplets well up around her fingers, which only seems to encourage her to rub further afield, smushing gooey pre over every inch of tit she can reach until her nipples glisten and gleam like beacons.");
	output("\n\nPretty soon, your [pc.cocks] drool" + (!pc.hasCocks() ? "s":"") + " whether [kiro.name] touches " + (!pc.hasCocks() ? "it":"them") + " or not. She gives up on stroking you to capture as much of the fragrant cock-honey as possible and smush it everywhere, even her underbust, where lubricant won’t do anything but stick to your lap on a downstroke. [kiro.name] can’t seem to help herself, however. Her eyes are unfocused. With so much preseed clinging to her, filling her nostrils with pheromonal need and virility, it’s all she can do to continue whatever it was she was up to when this all started, proceeding in a sort of cum-commanded autopilot.");
	output("\n\nYou stop her when she’s midway through painting her belly with your offerings, reminding her that she promised you a titfuck.");
	output("\n\nPussyjuice splatters the floor as [kiro.name]’s priorities realign, the dominant desire in your voice all she needs to have a microgasm of her own. <i>“Right. I’m... going to give you a titfuck... with my boobs all covered in pre. So - much - pre!”</i> For a moment, she looks like she’s going to start sucking her fingers dry, but her eyes refocus on your [pc.cocks], slathered with erotic promise.");
	kiroBimboTiddyFuckContinuePostLubeSplit(x,"pre");
}

//Milk
public function lubeBimboKiroTitsWivMilkies(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Your milk,”</i> you state, openly ogling [kiro.name]’s juicy teats.");
	output("\n\nThe tanuki smiles warmly at the suggestion, admitting, <i>“I was hoping you’d say that.”</i> Sliding her hands up her endlessly productive udders, [kiro.name] drums her fingertips on the taut skin, dancing along every step on the journey to the jutting tips of her nipples. They’re fully engorged, yet simple contact with her roving digits is sufficient to coax them into an excessive glut. They hang low from kui-tan’s prow like ripe fruit. You swear her nipples are already so full that you could make them squirt with a simple squeeze.");
	output("\n\nThis is confirmed when the tanuki herself applies a hint of pressure. Creamy, uncontrolled eruptions blast out. They fork in a dozen different directions. Milk spatters your face, and while you’re busy wiping it away, [kiro.name] changes tactics. She releases one of her errant nozzles and focuses the full brunt of her erotic attention on the other, bending it toward the depths of her cleavage before applying a commencing a more forceful squeeze. It looks sort of like she’s wringing herself out, working from the base all the way up to the reddening tip, pouring out enough fresh milk to fill a bowl of morning cereal.");
	output("\n\nYou consider an offer of help until you realize how much the sloppy, dripping kui-tan is having fun.");
	output("\n\nShe’s grinning, her tongue flopping from her maw. When she works her nipple, that grin broadens. Her gaze slips far away. She seems almost, content - at peace with herself, or the universe, or <i>something</i>.");
	output("\n\nAnd the milk flows. It sputters and pumps and pours - especially the unattended spout on [kiro.name]’s left. While she is busy tending to right, utilizing it for her very specific, very phallus-focused goals, the other weeps freely. The sympathetic drizzle pools underfoot, yet the giggling bimbo pays it no mind. She’s more concerned by how <i>white</i> all that milk is making her fur. Her cleavage shines with it. When she curiously presses down on her pelt, streams of pearly goodness well up around her digits and race for the floor.");
	output("\n\nPleasure may seem a good reason for [kiro.name] to suddenly inhale, but it would not be the truth - not all of it anyway. She swaps to her neglected teat with a dextrous movement of her hands, shoveling the wet, bulging flesh into her greedy, sucking lips. Her cheeks hollow, and she whines in obvious delight. You can hear the swallowing. She gulps with all the gracefulness of a pig at a trough. Her gluttony allows wasted blobs to escape from the corners of her mouth and dribble from her chin. Spillage is good for her, though. Additional fluid only makes a further mess of well and truly soaked tits. Some makes it low enough to cling to her belly. Some forms a tea-cup sized pool in her cleavage.");
	output("\n\nYou’re so enraptured by the sight that you almost miss the pussyjuice streaming down [kiro.name]’s thighs. Almost. And now that you know you’ve seen that, the expression on her face makes a lot more sense - especially the way her eyes try to roll into the back of her head when she’s suckling up a mawful. It tempts you to abandon your post and come closer. The rhythmic dripping of her excess cuntjuice hitting the floor is like a siren song, one you’d love to follow if only [kiro.name] didn’t suddenly stop drinking and glance your way with a knowing smirk.");
	kiroBimboTiddyFuckContinuePostLubeSplit(x,"milk");
}

//Pussyjuice
public function kiroBimboLubesTitsWithPussy(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Your pussyjuice,”</i> you answer almost immediately, licking your lips.");
	output("\n\n[kiro.name] nods, reaching between her legs and behind her balls for the moist honeypot she calls her pussy. Obviously concentrating, she shivers when she brushes what must be her clit. You can’t really see from where you’re seated, but you can watch her expression shift and contort in obvious pleasure. She cums in the space of a minute, her climax as obvious as the lurid splatters hitting the floor. The air, already damp with all kinds of sex pheromones, floods with the spiced scent of her alien womanhood, and [kiro.name]’s palms emerge cupped together, cradling fresh, fragrant girlcum.");
	output("\n\nShe dumps it into valley of her cleavage without a second thought, throwing back her head and sighing in satisfaction as it wicks into the fur. [kiro.name] must love the sensation of her own girlish goo sloughing into her skin. Both hands dive in to ensure her feminine prize is evenly distributed, squeezing and groping and exploring like they belong to a teenage boy who can’t quite control himself in the presence of such delectable mountains. Soon, [kiro.name]’s chest is as slick and wet as her cunt - or close, anyway.");
	output("\n\nSpatters of hot pussy-juice are still dribbling out of her and onto the floor with no sign of stopping.");
	kiroBimboTiddyFuckContinuePostLubeSplit(x,"pussy");
}

//Cum
public function kiroBimboLubesWivHerCummies(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Your cum,”</i> you answer with a knowing smile.");
	output("\n\n[kiro.name] nods, reaching down to heft the weighty pull and thread it up through her cleavage - all the way to her mouth. Once positioned, her lips seal around the fat, flat tip, and her cheeks hollow. She keeps one hand low, rubbing a slow circuit across an increasingly heavy ballsack while the other fingers the hypersensitive flesh just inside her sheath. Watching her work, you can’t help but be impressed by how well-suited to the act the dollified tanuki is. Every single part of her seems perfectly sized to fit into the other - her cock into her tits, the head into her mouth, and her fingers into her sheath.");
	output("\n\nClimax announces itself not with a moan, cry, or shudder, but with the audible gurgle of a large fluid mass pumping through a set of pipes a size too small for its volume. [kiro.name] locks eyes with you just before it erupts, full of love and desire, and then she’s too busy wrestling the jaw-flooding deluge of ‘nuki-cream for control to do anything else. She gulps down some of it, you notice. It seems instinctual, automatic, but most of it she lets fall back out into her cleavage. Sticky blobs of spooge pile up on her cow-grade tits, soaking into her fur at a rate far slower than she climaxes.");
	output("\n\nSoon, rivers of excess [kiro.name]-cum race down the wobbling planetoids she calls breasts, and an olympic-sized swimming pool of semen rests at the source of it all, filled by the seemingly infinite waterfall that pours from her drooling, cum-smeared maw. Taking a hand away from relentless working her balls seems like it slows her ejaculation somewhat, but only until she brings it up to her tits and starts working the cummy goo in, massaging her breasts with all the fervor of a hypnotized tit-worshipper. She cums and rubs and massages until every single inch of boob is thoroughly saturated with a layer of off-white cream.");
	output("\n\nBubbly droplets dribble from your futanari fuck-doll’s nipples when she at last lets her dick slip out of her mouth. Her eyes zero back in on <i>your</i> equipment, her own phallus forgotten the instant it stopped flexing - making way for you to use her tits the way they were meant to be used.");
	kiroBimboTiddyFuckContinuePostLubeSplit(x,"cum");
}

public function kiroBimboTiddyFuckContinuePostLubeSplit(x:int,lube:String):void
{
	output("\n\n<i>“Here you go, [pc.Master],”</i> [kiro.name] says with the kind of throaty purr that makes her words feel like tongues on your ears. She leans forward, letting the weight of her expanded bosom swing it forward into your lap and around your [pc.cocks]. <i>“My savior,”</i> she croons, drifting closer until she’s nearly nose to nose with you, blushing furiously. <i>“I love you so much.”</i> Her hands move into position on either side of her titanic breasts and squeeze them inward, sinking her elbows in so deeply that that all but vanish from view. Pillowy pressure vices you into a steamy-slick, cock-wringing embrace so intense that your eyes cross" + (pc.hasToes() ? " and your toes curl":"") + ". [kiro.name]’s voice is gentle in your ear, adoring even: <i>“My Angel.”</i>");
	output("\n\nYou swoon, and you throb. Toppling over and allowing her to do whatever she wants with your crotch seems like it ought to be a bad idea, but it just feels too good to care. Besides, she <b>loves</b> you. The least you can do is trust her to pamper you with tit. <i>“Goooood giiiirl,”</i> you breathe, nearly inaudibly. The bed is so soft underneath you, and down here, everything smells like [kiro.name] and sex swirled together in a blender.");
	output("\n\nYou didn’t know you could get this hard.");
	output("\n\n<i>“Oooh, " + kiroAngelOrMaster() + ", just relax and enjoy yourself.”</i> The tanuki’s tail wooshes back and forth behind her excitedly as she smears ");
	if(lube == "pre") output("your pre");
	else if(lube == "cum") output("her cum");
	else if(lube == "pussy") output("her pussy");
	else output("milk");
	output("-soaked tits around your cock, twisting and bouncing in alternating rhythms to provide supple strokes and caresses to every square inch of exposed phallus. <i>“I know exactly how good it feels. The first time I titfucked myself with these babies, I came so hard I passed out.”</i> She hums softly as her chest-mounted cushions vigorously squelch and drip" + (pc.balls > 0 ? " onto your [pc.sack]":"") + " like well-squeezed sponges. <i>“And knowing that they’re making you feel just as good makes me leak like a goo-girl. Just let me love you with my tits.”</i>");
	output("\n\nYou do. What the adoring kui-tan is doing feels exactly as described: like pure adulation twisted into a vice-like sleeve. It’s every bit as wet and every bit as tight as a pussy but so much nicer to watch bouncing around in the bottom of your vision. There is a sea of beautiful, bountiful bosom squeezing endless waves of bliss into your [pc.cocks]. It’s a ");
	if(lube == "pre") output("sweet and sultry");
	else if(lube == "cum" || lube == "pussy") output("salty and sultry");
	else output("creamy and dreamy");
	output(" embrace that you can’t get enough of. If thrusting would do you any good, you would. However, when you’re already pinned in [kiro.name]’s heavenly prison, luxuriating in the sensation is the only option available.");
	output("\n\nThis chesty tanuki could already squeeze you dry with her tits, but now that she’s been transformed, she has become a goddess of mammary-based masturbation. Her breasts are two miracles, and she blesses you with perfect skill, carrying you to the cusp before easing back and working her way back up all over again. She squeezes you until you’re shuddering and twitching, coaxes you into quivering, into riding the edge even when she slows down. You could cum so easily, all it would take is-");
	output("\n\n[kiro.name]’s breasts tighten into a torrid sleeve, and you cum. You cum hilt-deep in her cleavage, pumping lurid lances of ");
	//ParseText and swap any mention of <i>“cum”</i> to <i>“seed”</i> to prevent echo:
	output(ParseText("[pc.cum]").replace("cum","seed"));
	output(" into her furthest reaches, invisible to anyone’s eyes but oh-so-palpable when it backwashes across your [pc.cocks]");
	if(lube == "pre") output(" with a helpful mix of pre-produced pre");
	else if(lube == "pussy") output(" with a bit [kiro.name]’s fragrant cuntjuice mixed in");
	else output(" with a helping of [kiro.name]’s own contribution");
	output(". ");
	var cummies:Number = pc.cumQ();
	if(cummies < 50) output("Those mind-blanking, breasty behemoths swallow your entire orgasm with ease. They’re simply too large and too absorbent, even after being pre-treated with slutty juices, to let your climax escape. When [kiro.name] lets your dick" + (pc.hasCocks() ? "s":"") + " free with a noisy ‘schlick,’ the only visible evidence of your ejaculation is a single strand of glittering [pc.cumGem] dangling from her underbust.");
	else if(cummies < 500) output("Those breastly behemoths welcome your orgasm into their juicy morass, at first sopping up the bulk of it, but increasingly dribbling out excess to splatter on [kiro.name]’s untouched rod. Even now, it sympathetically weeps a trickle of white. Letting your dick" + (pc.hasCocks() ? "s":"") + " escape somehow produces a sound louder and wetter than withdrawing from her cunt ever could and a delicate web of straining, [pc.cumGem] filaments that cling to your grinning ‘nuki’s sublimely saturated melons in a stunning display of climatic beauty.");
	else if(cummies < 5000) output("Those mind-melting titty-behemoths take your orgasm like champs... at first. Soon, her fur has absorbed as much of your sloppy deluge as it can take, and with each fresh squirt, you unleash small waterfalls from the underside of her cleavage, liberally glazing [kiro.name]’s sympathetically weeping girl-cock with the dominating mess of your own excess load. You scarcely notice your spent length" + (pc.hasCocks() ? "s":"") + " sliding free. [kiro.name]’s too gentle and caring, handling your tingling shaft" + (pc.hasCocks() ? "s":"") + " with incredible delicacy. She even kneels down to slurp the leftover juices off" + (pc.hasCocks() ? " of each one in sequence":"") + ". Her lips form a perfect seal.");
	else output("Those mind-meltingly tight gigatits try their damnedest to handle your vigorously shot load, but the first burst alone stretches their absorptive abilities to the max. Successive cumblasts make the whole of the cushy prison wobble around for a moment before discharging a thick river of glittering [pc.cumGem] directly onto [kiro.name]’s sympathetically weeping horse-dong, painting it so thickly that nobody in the known universe could doubt who owns it. You cum for so long that a few dollops actually manage to pump up to the top of the kui-tan’s cleavage, shimmering gently. [kiro.name] laps at it for a bit, then releases you, moaning when she realizes how thoroughly drenched she’s become.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tiddyFuckingKiroEpilogue);
}

public function tiddyFuckingKiroEpilogue():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“" + kiroAngelOrMaster() + "?”</i> [kiro.name] gently whispers in the aftermath, <i>“Do you mind if I eat it?”</i> She scoops a handful of leftovers from her tits. <i>“It smells soooo good, and I’ve been a real good girl, right?”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Yes",yesCummiesKiro);
	addButton(1,"No",noCummiesKiro);
}

//No
public function noCummiesKiro():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“No cummies this time, [kiro.name]. Get a shower.”</i>");
	output("\n\nThe drenched tanuki pouts so hard you worry her lip is going to pop right off, but eventually relents. <i>“Okaaaaaayyyyy. But I’m gonna I’m gonna smell so pretty when I’m done that you’ll have to do this all over again, and then you’ll be so happy that you’ll have to let me eat all the cum!”</i>");
	output("\n\nYou don’t argue the point. Better to leave the room before she drags you into a conversation about which pheromone-infused shampoo will make your cock" + (pc.hasCocks() ? "s":"") + " the hardest.");
	processTime(2);
	IncrementFlag("KIRO_BIMBO_NOTGOODGAL");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Yes
public function yesCummiesKiro():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“You’ve been a very good girl,”</i> you coo, watching [kiro.name]’s knees knock together as her pussy gushes rivers down her inner thighs. Her cock slaps up right into the middle of her chesty wet patch and adds a few dollops of its own special sauce, just in time for [kiro.name] to scissor her cleavage closed and pile as much sexjuice as she can onto her flare. Then, she scoops fingerfuls of the swirling jism off of it like a plate, sucking them draw with obvious enthusiasm. The scent of aroused kui-tan somehow grows even more overwhelming while [kiro.name] sags into the recently-vacated bed, now beginning to titfuck the intermingled loads from the inside of her tits all the way up to her wide-open maw.");
	output("\n\nWhen she sees you watching, she winks. She really is a good girl.");
	processTime(2);
	IncrementFlag("KIRO_BIMBO_GOODGAL");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}