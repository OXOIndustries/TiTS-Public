/*Paige sex shit by B.

Overview:

This document is all about fuckin’ Paige. She’s got a sweet yoga bod and is willing to have sex with any gender, be they man, woman, both, or neither, and she’s down to clown with you if you have two legs, four legs, or no legs.

While the player can choose how to have sex with Paige (oral, anal, etc), the PC takes a very passive role in the lovemaking while Paige does most of the exploring. When the PC takes a more active role, it’s usually because Paige has asked/allowed them to. Paige is always in control, but she actively makes sure it’s as good and important to you as it is to her.

Before I get to the nitty-gritty, I just want to say something. A lot of scenes in TiTS have a similar problem: they’re awfully long-winded and they tend to fluff the point as much as possible. It gets kind of hard to enjoy myself when the porn is submerged in a lake of prose. I’m certainly guilty of this, in the porn and out of it, and far be it from me calling the kettle black, so I’m going to try and be the change I want to see with Paige’s sex scenes and how they’re constructed.

One criticism I got with Lane when I wrote him was that his scenes didn’t allow for a lot of variety. It gave me an idea on how to improve the variety, and therefore the longevity, of the sex scenes in TiTS, or at least with Paige/my future projects, depending on how well it goes.

The concept is that, in an effort to cut down on the intimidating length of some scenes without removing any content, each scene is several small pages rather than one massive one with tons of different variations to assume different genitals/species/number of tongues/whatever.

Ideally, every page would be just between one and three paragraphs long, before asking the player for some kind of input. Here’s a basic example:
<i>“Paige stands above you, her tight Ausar cunt glistening with its own juices in anticipation for you and your tongue.
You lick your lips and, both hands on her tight ass for stability, pull yourself in, your lips meshing with hers and your tongue slithering into her tunnel in a hurry.
<i>“Oh yes,”</i> she moans as her fingers play with your hair. Her leg lifts up to start draping over your shoulder and give her more leverage to fuck your face. It seems she wants to take a more dominant position over you.
[=Allow Her=] [=Push Her Away=]”</i>
The scene would unfold like that, taking on a new path with every decision the player makes. Every scene would have a tree of options that changes how it generally plays out.

Of course, the sex itself wouldn’t change without plenty of forewarning: oral sex would be oral sex the whole way through. What would change is who is doing the oral, or how gently/roughly the pitcher treats the catcher, etc etc.

I’d like to apologize in advance to whoever drew the short straw on programming these.*/


// Play this the first time the PC has sex with Paige
// Action Tree: http://i.imgur.com/OfBwRIx.png
public function paigeFirstTimeIntro():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	IncrementFlag("SEXED_PAIGE");
	output("Paige slithers her way up your body, licking her lips as she does, her nose trailing up your [pc.chest]");
	if(pc.biggestTitSize() < 1) output(", snaking up the crease of your ribs");
	else output(", brushing in through your cleavage");
	output(" until she bumps your chin. From there, she lunges forward, her lips meeting yours and her wanting, wandering tongue bursting forth in a hurry to meet yours.");

	output("\n\nHer hips meet yours, her sweet, wet cunt brushing against you");
	if(pc.hasCock() && !pc.hasVagina()) 
	{
		output("r [pc.eachCock]");
		if(pc.balls > 0) output(", her juices dripping down the shaft and pooling onto your [pc.sack]");
	}
	else if(pc.hasVagina()) output("r own, ready [pc.vaginaNoun], her juices mingling and mixing with yours");
	output(". She grinds against you, masturbating you both with her pussy, teasing you both towards something greater.");

	output("\n\nYou memorize her taste as her tongue coils over yours; you familiarize yourself with the smooth texture of the wriggling muscle in your mouth. Her whole body rubs against you; the static of her fur tickles and excites you. Your hands grip at nothing, dying to touch her.");
	processTime(5);
	pc.lust(10);
	args.push("First Time");
	//[=Embrace Her=][=Grab Her Ass=][=Do Nothing=]
	// end scene (scene: First Time)
	clearMenu();
	addButton(0,"Embrace Her",FTEH1,args);
	addButton(1,"Grab Her Ass",FTGHA1,args);
	addButton(2,"Do Nothing",FTDN1,args);
}

//[=Embrace Her=]
// (scene: FTEH1)
public function FTEH1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTEH1");
	output("Your arms lift up and wrap around her back gently, holding her close. You can’t get enough of the way her tongue so eloquently dances with yours and explores your cheeks, or the way her hips grind so teasingly against yours, or the way her hard nipples dig and button into your");
	if(pc.biggestTitSize() <= 5) output("s, the energy between them conducive and <i>real</i>.");
	else output(" [pc.chest], the meat between your upper bodies cushioning you both.");
	output("\n\nPaige moans into you, enjoying the sensation between you as much as you are her. Her eyes have closed blissfully as she absorbs your every facet. Her left hand goes to your head, caressing your cheek");
	if(pc.hasHair()) output(" and playing with your hair");
	output(". When she finally pulls away, her eyes are open and locked onto yours");
	if(paigeBlind()) output(" (generally)");
	output(".");

	output("\n\n<i>“I’m normally the aggressive type in bed, I’m told,”</i> she whispers to you, her fingers tracing from your scalp to your earlobe. <i>“But today, I want it to be about us both. Tell me what you want, [pc.name]. How do you want me, baby?”</i>");

	processTime(5);
	pc.lust(5);
	//[=Love Her=][=Take Her=][=More Teasing=]
	// end scene (scene: FTEH1)
	clearMenu();
	if(pc.cockVolume(0) >= paige.vaginalCapacity(0)) addButton(0,"Love Her",FTLH1,args,"Love Her","You’re too big to fuck Paige. But that doesn’t mean you can’t still love her...");
	else addButton(0,"Love Her",FTLH1,args);
	if((pc.hasCock() && pc.cockVolume(0) <= paige.vaginalCapacity(0)) || (pc.hasVagina() && (!pc.hasCock() || pc.cockVolume(0) <= paige.vaginalCapacity(0))) || !pc.hasGenitals()) addButton(1,"Take Her",FTTH1,args);
	else addDisabledButton(1,"Take Her","Take Her","You’re too big to fuck Paige. But there are other ways to enjoy each other...");
	addButton(2,"More Teasing",FTMT1,args);
}

//[=Grab Her Ass=]
// (scene: FTGHA1)
public function FTGHA1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTGHA1");
	output("You bring both your hands forward and swiftly clap them onto both cheeks of her tight ass. You’ve wanted it since the first time you’ve seen her in class, and she said herself, she loves the way she can flaunt it and call it yoga. It’s all yours now, and you won’t wait a second longer.");
	output("\n\nPaige catapults from the kiss, yelping in surprise at the ferocity of your hands. Her fur stands on end, but when she feels your grip on her, she coos and smiles down at you. <i>“Should have seen this one coming,”</i> she laughs. <i>“But I don’t blame you for wanting to get right to the good stuff. It </i>is<i> a pretty fine ass, after all.”</i>");
	output("\n\nYou grip her tightly and readjust your fingers several times in affirmation. She hums in delight and, from her higher position, grinds more forcefully onto you. ");
	if(pc.hasCock())
	{
		output(" [pc.EachCock] turns purple from the delicious pressure between your bodies and begs you for a chance at her.");
	}
	else if(pc.hasVagina()) output(" Your [pc.vagina] drinks in the tortuous pleasure and the extra fluids, begging to end the teasing and start the real deal.");
	else output(" Her fluids stain the featurelessness of your crotch, and you feel her liquid heat against your skin; you may not have anything to fuck her with, but that’s not about to stop you.");
	output("\n\n<i>“Normally I take a more aggressive approach in bed,”</i> she says huskily, her eyes burning into yours ");
	if(paigeBlind()) output("(generally)");
	output(". <i>“Feels like you’re more than ready to keep up with me. How do you want me, babe? Tell me how you want me.”</i>");

	processTime(5);
	pc.lust(10);
	clearMenu();
	//[=Take Her=][=Hotdog=][=69=]
	// end scene (scene: FTGHA1)
	if((pc.hasCock() && pc.cockVolume(0) <= paige.vaginalCapacity(0)) || (pc.hasVagina() && (!pc.hasCock() || pc.cockVolume(0) <= paige.vaginalCapacity(0))) || !pc.hasGenitals()) addButton(0,"Take Her",FTTH1,args);
	else addDisabledButton(0,"Take Her","Take Her","You’re too big to fuck Paige. But there are other ways to enjoy each other...");
	if(pc.hasCock()) addButton(1,"Hotdog",FTHD1,args);
	else addDisabledButton(1,"Hotdog","Hotdog","This scene requires a penis.");
	if(pc.hasGenitals()) addButton(2,"69",FT691,args);
	else addDisabledButton(2,"69","69","This option requires a gender.");
}

//[=Do Nothing=]
// (scene: FTDN1)
public function FTDN1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTDN1");
	output("Your hands remain dutifully above your head and open, though they grope at nothing, trying to imagine the feel of her skin and fur against them. Yet, for all your desire, Paige is the one being predatorily forward, and you figure that this is probably how she likes it, and tonight is about her as much as it is about you.");
	output("\n\nPaige’s tongue swirls and moves against your own as she takes in your taste and scent. Her other liquids continue to drip onto you");
	if(pc.hasGenitals()) output("r genitals");
	output(", eager for you to touch her and to please her the way your hands voluntarily aren’t.");

	output("\n\nShe releases the kiss and takes a heady breath of air; her wind washes down your neck and between your bodies. Her right hand finds your shoulder, then maps its way down your body, tickling its way past your ribs and belly, then claws tenderly-yet-possessively at your [pc.hip]. <i>“God, I’ve wanted to taste you like that for a while now,”</i> she whispers, knowing what sort of effect it’ll have on you.");
	output("\n\n<i>“I noticed you haven’t touched me yet. I know it’s not because you’re scared,”</i> she mocks playfully. <i>“Maybe you don’t like being in control? Tonight is about us, sweet thing, but if you want me to be the toucher, I’ll gladly play the part.”</i> She licks her lips and narrows her eyes at you. <i>“Tell me what you want from me, babe.”</i>");

	processTime(5);
	pc.lust(10);

	clearMenu();
	//[=69=][=More Teasing=][=Be Her Toy=]
	if(pc.hasGenitals()) addButton(0,"69",FT691,args);
	else addDisabledButton(0,"69","69","This option requires a gender.");
	addButton(1,"More Teasing",FTMT1,args);
	addButton(2,"Be Her Toy",FTBHT1,args,"Be Her Toy","Relinquish all control of the situation and submit to Paige...");
}

//[=Take Her=]
// This scene can be played if the PC has a reasonably-sized penis, a vagina only, or neither. If the PC meets none of these requirements (i.e. has a penis that is too big (Cock Length of 18 or larger)), grey this button out and display the following tooltip. Otherwise, display no tooltip.
// Tooltip: You’re too big to fuck Paige. But there are other ways to enjoy each other...
// (scene: FTTH1)
public function FTTH1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTTH1");
	// Play from here if the PC has a penis
	if(pc.hasCock()) 
	{
		output("You have a horny Ausar on top of you, begging for some of your dick, and you’re not about to disappoint her. You reach down to your package, gripping it just beneath the [pc.cockHead], and slowly drag it between her pussy lips, letting her liquid lust smear across the skin of your shaft.");
		output("\n\nShe whines in pleasure as you tease her. You don’t keep up the act: as soon as you’re lined up, you thrust forward, claiming Paige’s cunt for yourself.");
		output("\n\nShe yips in surprise and her body jolts upward, but she quickly grows accustomed to the feel of you inside her. She hums in warm satisfaction and sinks onto you until her hips settle against yours");
		if(pc.balls > 0) output(", the fur of her pert, tight bottom tickling your [pc.sack]");
		else if(pc.hasVagina()) output(", the fur of her drooping, swishing tail occasionally tickling against your [pc.vagina]");
		output(".");
		output("\n\nShe begins to rock her body back and forth, coercing your dick to rub around inside her. You watch her body sway above you, her free tits jiggling in the air, her nipples pointed in unspoken want, inviting you to them.");
	}
	// Play from here if the PC has a vagina, or curiously lacks sexual endowments
	else
	{
		output("You have a horny Ausar on top of you, begging for a piece of you, and you’re not about to disappoint her. You reach a hand up and worm it between her breasts, coping a coarse feel for a moment, and then trail it down, mapping the ridges of her abs, until you find her pointed button and her soaking cunt.");
		output("\n\nShe hums in pleasure as you tease her, stroking and petting until your fingers are soaked through. Yet, to her surprise, you take them away, leaving her frustrated. You bring your fingers to your nose and take an exaggeratedly long whiff (since she can’t see you do it) before slipping them into your mouth. The second her taste hits your buds, you thrust up, your crotch hammering into hers.");
		output("\n\nShe yips in surprise and her body jolts with the motion, but the combined heat of your two ");
		if(pc.hasVagina()) output("cunts");
		else output("bodies");
		output(" melts her shock and she eases onto you. She grows heavy with lethargic pleasure as she sits on you, her hips settled against yours – you take the initiative and start fucking your body against her.");
		output("\n\nThe rough rocking of your two bodies kick-starts her, and she quickly matches your rhythm, ");
		if(pc.hasVagina()) output("tribbing against you, your individual juices mixing together and soaking you both");
		else output("her wet and hot pussy slapping against your featureless skin");
		output(". You watch her body sway above you, her free tits jiggling in the air, her nipples pointed in unspoken want, inviting you to them.");
	}
	//[=Grope Tits=][=Suck Tits=][=Grab Hips Instead=]
	// end scene (scene: FTTH1)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Grope Tits",FTGT1,args);
	addButton(1,"Suck Tits",FTST1,args);
	addButton(2,"Grab Hips",FTGHI1,args);
}

//[=More Teasing=]
// (scene: FTMT1)
public function FTMT1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTMT1");
	output("<i>“There’s no rush tonight, Paige,”</i> you say to her, leaning forward to kiss her again. She hums in appreciation, and opens her mouth again so that you may explore each other some more.");
	output("\n\nYour hands roam over her powerful body: from her stout shoulders to her tight ass, you can make out every yoga-toned muscle beneath her fur as you go, mapping out their ridges and valleys. And when you get to her smooth, round, perfect ass, it’s as tough as clay. You scratch your fingers across its skin, testing its tautness.");
	output("\n\nPaige’s grinding escalates from her lower body to her upper body as well. ");
	if(pc.biggestTitSize() < 1) output("Her furry breasts smooch and caress against your less-substantial set, overwhelmed by their firmness and their size relative to yours. Her pointed, excited nipples draw rough circles into your chest as she gyrates on top of you, using every part of your body to stimulate every part of hers.");
	else if(pc.biggestTitSize() <= 6) output("Her nipples connect with your own [pc.nipples], electrifying you both and incentivizing her to do it again and again. Her mind almost seems to blank out as she focuses between humping, kissing, and frotting your breasts, and with each press of your equally-formidable mounds together, she gets more and more into it. You match her tempo precisely, and you get as big a thrill out of every pass as she does.");
	else
	{
		output("Her body arches slightly to get over the hills of your breasts, but it only serves to entice you both: with every rock and rub as she alternates between humping between your legs and frotting against your breasts, another pleasurable chill runs from ");
		if(pc.hasCock()) output("your [pc.cocks] and ");
		else if(pc.hasVagina()) output("your never-wetter [pc.vagina] and ");
		output("your [pc.nipples], straight to your spine.");
	}
	output("\n\nThe teasing has driven Paige into another gear; her tongue buries itself into your mouth and her toned body is using all its strength to keep you pinned. She doesn’t seem to care the way your hands, still clasped to her ass, inch their creeping fingers ever farther south. With one particular roll of her hips, she almost seems to be encouraging it.");

	processTime(5);
	pc.lust(10);
	//[=Finger Her=][=Finger Her Butt=][=Do Nothing=]
	//// end scene (scene: FTMT1)
	clearMenu();
	addButton(0,"Finger Her",FTFH1,args);
	addButton(1,"Finger Butt",FTFHB1,args);
	addButton(2,"Do Nothing",FTDN2,args);
}

//[=69=]
//if {played FTDN1}
// Requires any gender. If the PC has none, grey this button out and display the following tooltip. If the PC has one, do not display a tooltip.
// Tooltip: This option requires a gender.
// (scene: FT691)
public function FT691(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FT691");
	output("<i>“I want to taste you,”</i> you tell her sultrily, and you lick your [pc.lips] for effect. <i>“");
	//if {played FTDN1}
	if(InCollection("FTDN1", args)) output("I want to taste you as badly as you wanted to taste me. ");
	output("Give me some of what you got, Paige.”</i>");

	output("\n\nPaige hums twice, enjoying the idea, and licks her own lips in anticipation. <i>“My my, what a wonderful idea,”</i> she concedes. She rocks her body to your right side, lifting her leg and disengaging from you entirely. <i>“But,”</i> she says as she turns her body around, bringing her rear to your front. <i>“It’d be rude of you to have all the fun.”</i> Her glistening sex hangs above you, droplets of her dripping from her puffy, wanting sex and onto your nose. The smell is intense and the heat is positively radiating – you can only imagine what she must taste like.");
	output("\n\nYou feel her breath over your crotch as she, almost nervously, eases herself onto your equipment. You don’t have to imagine her taste for long. Just as her mouth approaches you, she plunges her hips down, her sex making soft contact with your face. All you have to do is reach your tongue a bit forward, and....");

	//[=Next=]
	// end scene (scene: FT691), continue at (scene: FT692)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FT692,args);
}

//[=Love Her=]
// This scene can be played if the PC has a penis, a vagina, or neither. If the PC is pure male and their equipment is very large, display the following tooltip. Otherwise, display no tooltip.
// Tooltip: You’re too big to fuck Paige. But that doesn’t mean you can’t still love her...
//(scene: FTLH1)
public function FTLH1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTLH1");
	output("<i>“I just want you,”</i> you whisper back. <i>“Don’t make me choose how. Let’s just go with it.”</i>");
	output("\n\nPaige smiles down at you. <i>“Sounds good to me.”</i>");
	
	if(pc.hasCock()) 
	{
		// {PC has a dick that’s too big}
		if(pc.cockVolume(0) > paige.vaginalCapacity(0))
		{
			output("\n\nPaige leans her body back, bumping her butt and raised tail against your colossal [pc.cock]. She draws her lower body up, pressing her upper body down and into yours, as she measures you with her ass – and she gets some fun out of it, rubbing the lips of her pussy against you, marking you with herself. The skin she touches grows cool in the surrounding air, damp with her juices.");

			output("\n\n<i>“It’s not gonna fit,”</i> she warns after a bit, biting her bottom lip in concentration. <i>“But we can work with that.”</i> She pulls herself forward, lowering herself back down – and then back up, and then back down. She wraps her fluffy tail around the upper end of your dick to keep it steady and against herself. <i>“Better than any handjob, huh, sweet thing?”</i> she asks you.");

			output("\n\nShe doesn’t give you an opportunity to answer as she lifts her body entirely, and even steps off the bed for a moment. She finds your [pc.cock] with her hand by following her own tail as she steps around the bed, then crawls back onto it, and onto you. <i>“I have another idea,”</i> she says, opening her legs and pressing her pussy against the base of your dick, and its head ");
			if(pc.cocks[0].cLength() <= 13) output("against her belly.");
			else if(pc.cocks[0].cLength() <= 25) output("between her breasts.");
			else output("against her face.");

			output("\n\nShe eases down");
			if(pc.balls > 0) output(", her bottom gently resting against the tops of your [pc.balls]");
			output(", settling into her new position. <i>“This will be a little new to me,”</i> she says mischievously, <i>“but I got a couple ideas.”</i>");
		}
		else
		{
			output("\n\nWith her free hand, she reaches back between you, gently grasping onto [pc.oneCock]. She strokes it teasingly, coaxing more blood into it, hardening it further – she even pulls a small bead of pre from its head as she goes. Pursing her lips, she rocks her hips forward, scraping her vulva across your shaft, lubing it slick with herself.");
			output("\n\nWhen you’re both in position, she aligns you both, then shifts backward, absorbing you into herself. She winces in delight, biting into her lower lip, and her arms tense in pleasure as your [pc.cock] spears into her. You hear an audible squelch as you split through the film of her juices and into her warm, tight tunnel.");
			pc.cockChange();
		}
	}
	// {the PC has only a vagina, or has a vagina with too large a penis}
	if(pc.hasVagina() && (!pc.hasCock() || pc.cockVolume(0) > paige.vaginalCapacity(0))) 
	{
		output("\n\nShe leans back");
		if(pc.hasCock()) 
		{
			output(", pulling [pc.eachCock]");
			if(pc.balls > 0) output(" and your [pc.balls]");
			output(" out from between you two, sandwiching ");
			if(pc.cockTotal() + pc.balls == 1) output("it");
			else output("them");
			output(" between your bodies. With ");
			if(pc.cockTotal() + pc.balls == 1) output("that");
			else output("them");
			output(" out of the way, she rolls her hips a bit");
		}
		output(", aligning her hot, dripping cunt with your own feminine prize. Your heats mingle together, warming your skins in heady preparation for what’s to come.");

		if(pc.hasCock())
		{
			output("\n\nShe grips onto your rock-hard dick");
		}
		else if(pc.isNaga()) output("\n\nShe grips hard onto your hips");
		else output("\n\nShe lifts your [pc.leg] up");
		output(" for support as she braces for contact. You see her abs crunch and tense in anticipation – she can’t see, so every centimeter without contact is another unbearable centimeter of suspense. You feel the moisture of her pussy before you feel her vulva make contact with yours.");
		output("\n\nAnd feel it, you do.");
	}
	//[=Next=]
	processTime(5);
	pc.lust(10);
	// end scene (scene: FTLH1), continue at (scene: FTLH2)
	clearMenu();
	addButton(0,"Next",FTLH2,args);
}

//[=Hotdog=]
// This scene, and all connecting scenes requires a penis. If the PC does not have one, grey out this button and display the following tooltip. Otherwise, display no tooltip.
// Tooltip: This scene requires a penis.
// (scene: FTHD1)
public function FTHD1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTHD1");
	output("<i>“Let me appreciate the goods a bit first,”</i> you say as your hands mold and knead the taut flesh of Paige’s ass. Both cheeks are exactly big enough for your hands, and they’re practically fat-less – in some ways, a disappointment, but they offer a gentle firmness that no other body part can offer, or entice, you with.");
	output("\n\nYou slap the left cheek once. It doesn’t jiggle or wobble at all. Yet when you grip the skin, it pulls and pushes with your insistence, offering as much give as you need. Paige sighs in delight as you manhandle her booty; she arches her back for your benefit, giving you more to play with. <i>“Just don’t forget that I want to play too,”</i> she says in a lazy sing-song voice.");
	output("\n\n<i>“Of course,”</i> you tease. You stretch her cheeks apart, exposing her cunt and her bare anus to the air of the room – and you promptly slip your [pc.cock] between them and shutting them together again, trapping you between her. You thrust once: the shaft of your dick scrapes just right against Paige’s cunny, making her yip in pleasure.");
	output("\n\nYou wonder how long you can keep this up before she begs you.");

	processTime(5);
	pc.lust(10);
	
	// end scene (scene: FTHD1)
	clearMenu();
	//[=Penetrate Her=][=Finger Her Butt=][=Keep Going!=]
	addButton(0,"Penetrate Her",FTPH1,args);
	addButton(1,"FingerHerButt",FTFHB1,args);
	addButton(2,"Keep Going",FTKG1,args);
}

//[=Be Her Toy=]
// Tooltip: Relinquish all control of the situation and submit to Paige...
// (scene: FTBHT1)
public function FTBHT1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTBHT1");
	output("<i>“I want you to be in charge, Paige,”</i> you say, almost daringly. <i>“Use that strong, sexy yoga body to keep me beneath you.”</i>");
	output("\n\nShe smiles, a wolf before a free meal, her teeth glistening. <i>“Gods, but aren’t you just the perfect partner?”</i> she asks. Before you can change your mind, she crawls forward, drawing her slick cunt up across your body and her chest up to your face. <i>“Show me how much you love my tits, [pc.name]. One of the most important parts of that strong, sexy yoga body you worship.”</i>");
	output("\n\nYou do as she demands: you kiss the valley of her breasts and lick along the furry flesh wherever your tongue can find the chance. Paige uses her forearms to squeeze her boobs together, suffocating you between them, making your lavishing a bit harder. <i>“Tell me you love it,”</i> she says. <i>“You love being right there, sucking your teacher’s titties. There’s no place you’d rather be....”</i> She hums in thought. <i>“Well, there’s</i> one <i>place</i> I’d <i>rather you be....”</i>");
	output("\n\nPaige shifts forward even more, lifting herself onto her knees. You take a deep breath, freed from your prison – and you’re greeted with the sight of Paige’s dripping, nearly-steaming cunt. The heat of her sex wafts between you, and you involuntarily (at first) breathe it in. <i>“Deep breath,”</i> she commands, and you feel her hand grip you by the back of your head.");

	processTime(5);
	pc.lust(10);
	//[=Resist=][=With Pleasure!=]
	// end scene (scene: FTBHT1)
	clearMenu();
	if(pc.hasGenitals()) addButton(0,"Resist",FTR1,args);
	else addDisabledButton(0,"Resist","Resist","You could bargain with Paige, but seeing as you have no gender to bargain with, that would be awfully difficult.");
	addButton(1,"With Pleasure!",FTWP1,args);
}

//[=Grope Tits=]
// (scene: FTGT1)
public function FTGT1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTGT1");
	output("Paige’s eyes are closed in concentrated bliss as she grinds on top of you. Her excited nipples guide your hands to them, asking you to fondle her, to make it a better experience for her. You’re all too happy to oblige.");
	output("\n\nPaige has a set of tits worth fantasizing over: each large enough to fill your hands with just a little bit of overflow; pert without being tough, and soft without being saggy. Her nipples dig into your palms, flexing against your ministrations. Paige gasps out loud in pleasure as you touch her. Her body lazily follows your wrists when you palm her breasts in one direction or another.");
	output("\n\nShe leans forward, her own hands falling to your [pc.chest]");
	if(pc.biggestTitSize() <= 2) output(" for stability as she rides you");
	else output(" to not only return the favor, but for stability as she moves her hips atop you");
	if(pc.hasCock()) output(" gently. Your thrusting is restrained as you both enjoy each other’s bodies; there’s plenty of time, and neither of you are going anywhere. From the look on her face as she absently paws at your own chest, she’s more than content to take you all night long, if you can last.");
	else output(". You both rock gently into each other, not content to simply get off and wanting to spend the night to enjoy each other’s bodies. With her every push of her slick twat over your own, her hands knead into your boobs, which has you rock against her, which pulls her back, so she pushes forward....");
	output("\n\n<i>“Gods, you’re good at that,”</i> she congratulates you as she pushes her chest into your hands. Incentivized, you keep it up, paying attention to what each finger is doing to her and watching how she reacts when you palm her nipple in just the right way.");

	processTime(5);
	pc.lust(10);
	//[=Next=]
	// end scene (scene: FTGT1), continue at (scene: FTGT2)
	clearMenu();
	addButton(0,"Next",FTGT2,args);
}

//[=Suck Tits=]
// (scene: FTST1)
public function FTST1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTST1");
	output("Paige’s eyes are closed and her chin is tilted up as she concentrates on the pleasure and the intimacy of her hips joined to yours. Her breasts jiggle in the motions, her nipples gently swaying before you, asking for some attention. Attention that you don’t think your hands can provide.");
	output("\n\nYou pause your ");
	if(pc.hasCock()) output("thrusting, causing Paige to whine cutely in frustration");
	else output("rocking, causing Paige to sigh through her nose in mock exasperation");
	output(" so you can sit up. Your upper bodies press together; with her hips atop yours, she has the leverage, aligning your mouth to her breasts perfectly. You wrap your [pc.lips] around one nipple, sucking on it and lavishing it gently");
	if(pc.isNaga()) output(". Your serpentine lower body coils up and around Paige’s legs gently, enclosing her in your unique embrace without losing any of your own thrusting power.");
	else output(". You bend your legs at the knees, closing your body around Paige as best as you can without losing too much thrusting power.");

	output("\n\nPaige coos. <i>“That’s it, [pc.name],”</i> she says as she wraps her arms around your shoulders, one hand on the back of your head to keep you to her. <i>“Suck them gently. That’s how I like it.”</i> You wrap your own arms around her body, pressing your hands into the small of her back as she talks. <i>“Goodness, you’re a gentle lover, aren’t you?”</i> she asks, in a congratulatory way. <i>“I’ll have to keep that in mind for next time....”</i>");
	output("\n\nYou resume your ");
	if(pc.hasCock()) output("thrusting");
	else output("grinding");
	output(" – although your leverage is a bit neutered, the intimacy of your new positions makes the experience all the more important to you both. Paige continues to whisper gentle instructions and praises to you as you work your tongue on her breasts and your hips against hers.");

	processTime(5);
	pc.lust(10);
	//[=Next=]
	// end scene (scene: FTST1), go to (scene: FTST2)
	clearMenu();
	addButton(0,"Next",FTST2,args);
}

//[=Grab Hips Instead=]
// (scene: FTGHI1)
public function FTGHI1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTGHI1");
	output("Paige’s breasts are wanting and inviting, but there’s a more important prize for you both, and you’re not going to interrupt your pace. Your hands travel down her sides, lightly tickling at her skin and ribs, resting on the swell of her hips. Your fingers clench and scratch lightly at her fur as you grip onto her rump for stability.");

	// Continue here if the PC has a penis
	if(pc.hasCock())
	{
		output("\n\nYou thrust into her");
		if(pc.cLength(0) <= 6) output(", your [pc.cock] ridging itself against her cunt just right. Paige’s breath comes out as ragged gasps – sometimes as jovial laughs with every pleasurable press into her body");
		else if(pc.cLength(0) <= 11) output(", Paige squeaking out in surprise as your [pc.cock] forces its meaty way into her body. She chews her bottom lip with every drive into her pussy and she can’t keep the smile off her face if she tried. From the way her body shakes with every jerk into her and the way her hands softly claw at your [pc.chest], you must be just her size");
		else output(" with some effort. Her abdominals bulge as you force your [pc.cock] into her, and she grunts out in concentrated pleasure each time. Her hands travel up to your shoulders for her own stability as she humps back onto you – your size is a little daunting for even her strong body, but she’s not about to stop the ride");
		output(". <i>“You can play with my ass if you like,”</i> she tells you, noticing how your hands keep bouncing around on her flesh with every thrust.");
		pc.cockChange();

		output("\n\nYou don’t pass up the invitation and grope at the fine fur on her ass, but you never stop your thrusting. You even take the initiative with your exploration and stroke along the cleft of her cheeks up to her coccyx, searching for any erogenous zones. Paige enjoys your game and leans forward a bit to give you more to explore; you find one particular spot that makes her tail straighten and her to exhale sharply through her nose. That’ll be a fun spot to remember.");
		output("\n\n<i>“I love the way you touch me, [pc.name],”</i> she whispers over the sound of her body clapping onto yours. <i>“You’re good at finding all the best spots. Keep going....”</i> At her insistence, you continue your ministrations for her benefit.");
	}
	// Continue here if the PC has a vagina, or curiously lacks sexual endowments
	else
	{
		output("\n\nYou thrust up and against her, feeling her heat against you");
		if(pc.hasVagina()) output("r [pc.vaginas]");
		output(". The rooms fills with the wet clap of her wet body against yours, followed by the illicit moans of lust from you both. Paige tilts her head back, her lips curled into a jovial smirk and her bottom lip pinched between her teeth as she takes a deep breath through her nose.");
		output("\n\nShe grinds herself onto you; there’s very little bouncing, although every time she does, the brief, cool air between you is a delicious contrast to the bubbling friction. Your hands don’t leave her taut ass the entire time, and she notices, flexing her glutes for your entertainment every time she rocks forward. <i>“You can play with my ass if you’d like,”</i> she whispers to you, lifting her tail out of the way.");
		output("\n\nYou don’t pass up the invitation and grope at the fine fur on her ass, but you never stop your grinding. You even take the initiative with your exploration and stroke along the cleft of her cheeks up to her coccyx, searching for any erogenous zones. Paige enjoys your game and leans forward a bit to give you more to explore; you find one particular spot that makes her tail straighten and her to exhale sharply through her nose. That’ll be a fun spot to remember.");
		output("\n\n<i>“I love the way you touch me, [pc.name],”</i> she whispers over the sound of your bodies rocking on her bed. <i>“You’re good at finding all the best spots. Keep going....”</i> At her insistence, you continue your ministrations for her benefit.");
	}
	//[=Next=]
	// end scene (scene: FTGHI1); go to (scene: FTGHI2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTGHI2,args);
}

//[=Finger Her=]
// (scene: FTFH1)
public function FTFH1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTFH1");
	output("You multitask between Paige’s aggressive kissing and your fingers inching their way ever closer to her wet treasure. You feel her heat before you feel her moisture or texture. You don’t make it a secret that your fingers are inching their way to her pussy; you gently play with her spongy labia a bit before you grow bolder and stuff a finger into her.");
	output("\n\nShe hums in excitement into your mouth as you move. You experiment with multiple techniques, judging her reactions with each one: you thrust your digit into her slowly, and she rocks her hips back onto your hand, sucking you up to the knuckle. You rotate your hand in gentle circles, and she sways her body with every rotation. You withdraw the digit entirely to reach farther north, flicking at her clit, and she inhales and exhales sharply with every pass over her sensitive button. Finally, you plunge back in with a second digit – Paige ‘mmm-hmms’ into your mouth. Seems you found the winner.");
	output("\n\nYour fingers bicycle in her cunt and spin in different circles, exploring her wet walls for her G-spot. All the while, your left hand continues to grope and squeeze at her buttcheek, and Paige’s mouth hasn’t left yours. In reciprocation, Paige reaches her own hand down between you, easily finding your ");
	if(pc.hasCock()) output("rock-hard [pc.cockNounSimple] and stroking it. Pre-cum beads from your [pc.cockHead] and smears across her palm, which she eagerly uses to lube the whole shaft for the journey it’s about to take.");
	else if(pc.hasVagina()) output("just-as-wet [pc.vagina] and playing with it the same way you’re teasing her. She slips two fingers between the gap of your lips and uses the flat of her finger to brush against your [pc.clit]. You couldn’t be more ready for her if you both tried, but you know the anticipation is going to make the climax all the better.");
	else output("crotch, but not finding anything to play with. She hums in confusion, then disappointment as her hand brushes over flat skin again and again. So, instead, she hooks her hand around your hips to grab onto your [pc.ass], squeezing it as reverently as you are to hers.");

	output("\n\nPaige pulls away from you, and you both gasp in a few deep breaths. She licks her lips and eyes you predatorily. <i>“Damn, I could kiss you all night, you sexy beast,”</i> she whispers huskily. Neither of your hands leave each other");
	if(!pc.hasGenitals()) output("’s genitals");
	output(". <i>“But I can only take so much teasing, [pc.name]. I’m hungry for the real deal.”</i>");

	output("\n\nYou couldn’t agree more.");

	//[=Next=]
	// end scene (scene: FTFH1); go to (scene: FTFH2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTFH2,args);
}

//[=Finger Her Butt=]
//(scene: FTFHB1)
public function FTFHB1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTFHB1");
	output("Paige uses her hips to nudge your wandering hands in a direction she wants, but her attention is mostly elsewhere. You know exactly where she wants your hands and your fingers, but you have other plans. Just as you feel the heat of her cunt against your [pc.skinFurScales], you change course and head north – and as soon as you find her sphincter, you show yourself in.");
	output("\n\nPaige’s back goes straight, her head points upward with her lips pursed tightly, and her body goes rigid in surprise. But she doesn’t protest, and you continue, penetrating up to your second joint. She hums in concentration and rocks her hips a bit – she isn’t sure if she enjoys it or not. <i>“Can’t say I’ve ever had anything up</i> there<i>,”</i> she admits. <i>“But... keep going. We’ll see.”</i>");
	output("\n\nYou go slowly, thrusting only up to your second knuckle. <i>“Little deeper, sweet thing,”</i> she encourages, and you oblige. You use your other hand to grope and squeeze at her butt cheek, keeping the taut globes apart to make room for your other, busier hand. When you sink up to your first knuckle, unable to go any deeper, you use your other fingers to play with the vulva of her cunt. It feels just a <i>little</i> bit hotter than it did before.");
	output("\n\nHer back is still arched above you as she determines whether she enjoys having something up her ass. You take advantage of her position and climb forward, latching your mouth onto her closest tit. <i>“Getting a finger up my butt is hardly my idea of a romantic first time,”</i> she tells you. Accustomed to the sensation, she draws one hand down your [pc.chest], heading south towards your own crotch. <i>“But hey, I won’t say no to new experiences....”</i>");
	flags["PAIGE_FTFHB1"] = 1;
	//[=Next=]
	// end scene (scene: FTFHB1); go to (scene: FTFHB2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTFHB2,args);
}

//[=Do Nothing=]
// Coming from (scene: FTMT1)
// (scene: FTDN2)
public function FTDN2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTDN2");
	output("Despite Paige directing you towards her crotch, you tease her further by not accepting her invitation. Besides, you’re rather content with having a sexy, tone Ausar woman on top of you, making out with you passionately, while you handle her ass.");
	output("\n\nShe grunts playfully when you avoid touching her the way she wants. She withdraws her tongue from your mouth and pulls away from you, smirking at you mischievously. <i>“Not in the mood to play with me?”</i> she asks, tracing her finger down your chest");
	if(pc.biggestTitSize() >= 3) output(" and between the valley of your [pc.chest]");
	output(". Your hands do not leave the fat of her ass as she grinds her hips onto you, ");
	if(pc.hasCock()) output("sandwiching [pc.eachCock] between your [pc.belly] and her dripping pussy, lubing the shaft for the journey she’s teasing it won’t take");
	else 
	{
		output("her hot cunt just inches north of ");
		if(pc.hasVagina()) output("your own");
		else output("where yours would be");
		output(". Her juices leak and smear onto your [pc.skinFurScales], and all she would have to do is lean her hips back a bit");
		if(!pc.hasVagina()) output(", not that it would make a difference to you, honestly");
		output(", but she’s having fun teasing you, as if it’s not going to happen");
	}
	output(". <i>“Hmm,”</i> she mumbles, her lips curling. <i>“What am I going to have to do to get you to cooperate? I’m nothing, [pc.name], if not persuasive.”</i>");

	output("\n\nYou roll your hips up and against her, causing her to coo in delight as the motion tickles her vulva. You tell her that it’s not going to take much.");

	output("\n\n<i>“Is that right?”</i> she asks, licking her lips. <i>“Well then.”</i> She lifts her hips slightly as she draws them back, ");
	if(pc.hasCock()) output("allowing [pc.eachCock] to stand upright beneath her. She aligns your [pc.cockHead] with her sopping tunnel, rubbing your sensitive flesh against hers, just enough to coax out a fresh bead of precum");
	else if(pc.hasVagina()) output("positioning her own pussy above your ready [pc.vagina]. Her liquids drip in long strings from her cunt onto yours; the heat mixing between your crotches is palpable. You throb in agonizing desire: the teasing between you has left you more worked up than you realized");
	else output("her crotch hot and dripping onto your featureless [pc.skinFurScales]. You bite your bottom lip; your lust for Paige has never been greater, and you have no outlet for your frustrations. You double your resolve, knowing that the only pleasure you’ll get is from pleasuring Paige");
	output(". <i>“I have just the bargaining tool.”</i>");
	output("\n\nShe’s done with the teasing. Her hips collide with yours in one lust-filled motion.");

	processTime(5);
	pc.lust(10);
	//[=Next=]

	// end scene (scene: FTDN2); go to (scene: FTDN3)
	clearMenu();
	addButton(0,"Next",FTDN3,args);
}

//[=Penetrate Her=]
// (scene: FTPH1)
public function FTPH1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTPH1");

	output("Paige does nothing to stop your teasing as you slide your [pc.cock] against her pussy, sandwiched between her ass cheeks. As fun as it is to have her ride you like this, and as tantalizing as the sensations are, you both want something a little more and you’re not going to get any hornier.");
	output("\n\nYou use your left hand to reach down to the base of your dick, drawing it back just slightly, letting your [pc.cockHead] ply against her taint to elicit more cute sounds from your Ausar lover. With that, you line up your shot, and you penetrate Paige’s honeypot, spearing yourself into her supple, soaking cunt.");
	output("\n\nShe hisses out in pleasure and pauses her rocking motions to let you go as you like. You inch your way in slowly, letting her adjust to your girth. She’s tighter than you expected – she wasn’t kidding about not having any lovers since she became blind. But that’s hardly going to stop either of you, and you muscle into her impatiently.");
	output("\n\nShe hardly minds: her eyes close in bliss as she enjoys the first dick in her in a long time. She grabs onto her tits and massages them as you worm into her tunnel until you bottom out. With you fully immersed into her, you grab her hips again and get to work.");
	pc.cockChange();

	processTime(2);
	pc.lust(10);
	//[=Next=]
	// end scene (scene: FTPH1); go to (scene: FTPH2)
	clearMenu();
	addButton(0,"Next",FTPH2,args);
}

//[=Keep Going!=]
// (scene: FTKG1)
public function FTKG1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTKG1");
	output("Paige’s noises are cute and sexy, but they also give you something of a perverse thrill, knowing how badly she wants it and you won’t give it to her. It gives you a sense of power, to reduce such a physically powerful and tone woman to a puddle of desire. You thrust your [pc.cock] between her ass cheeks imperiously, and, while you both get pleasure from the rubbing and the scraping, it’s not enough and you both want more. It comes down to who gets impatient first.");
	output("\n\nShe keeps it together for another few minutes, but it’s clear that you’re not going to put it inside her anytime soon. <i>“Well, now I’m getting impatient,”</i> she says, playful yet frustrated. Paige grabs you by the forearms and, with her superior position and leverage, yanks them down, your hands peeling off her ass in one swift motion. <i>“I don’t want you having all the fun, [pc.name]. It’s my turn to have some.”</i>");
	output("\n\nPinned as you are, you’re powerless to stop Paige as she rears her butt back, tracing your [pc.cock] with her labia until your head is directly lined up with her cunt. With her rump raised, she lowers her face to yours until your noses touch. <i>“I told you before,”</i> she whispers, <i>“I haven’t gotten laid in a long time. I don’t need teasing. I don’t need ‘prepping.’ I need a fucking dick in me.”</i>");
	output("\n\nPaige impales herself on your hot [pc.cock], whether you want it to or not. But she also doesn’t let go of your arms: you’re pinned entirely underneath her weight and strength. She begins bouncing on top of you, her hips clapping against yours wetly. Looks like it’s Paige’s show now.");
	pc.cockChange();

	processTime(5);
	pc.lust(10);
	//[=Next=]
	// end scene (scene: FTKG1); go to (scene: FTKG2)
	clearMenu();
	addButton(0,"Next",FTKG2,args);
}

//[=Resist=]
// This scene requires a gender. If the PC does not have one, display the following tooltip; otherwise, display no tooltip.
// Tooltip: You could bargain with Paige, but seeing as you have no gender to bargain with, that would be awfully difficult.
// (scene: FTR1)
public function FTR1(args:Array):void
{
	clearOutput();
	showPaige();
	args.push("FTR1");
	output("You place your hands on Paige’s hips, obstructing her descent, her pussy juice dripping the few inches difference between your face and her. <i>“That hardly seems fair,”</i> you tell her. You use one finger to tweak her clitoris, causing her to sharply inhale in pleasure. <i>“You have some responsibility as the top too, Paige.”</i>");
	output("\n\nPaige hums in consideration as she gyrates her hips in time with your playing with her clit. <i>“Fair enough, [pc.name].”</i> She lifts her body away from you and your face, then swings one leg over your head to turn herself around. <i>“I wouldn’t be much of a teacher if I didn’t teach by good examples.”</i>");
	output("\n\nWhen she’s settled, you’re greeted by the similar sight of her cooch hanging above you, but the clit facing the other way. Paige squats herself back onto your face while you feel her body bend, her tits pressing into your lower belly and her fingers ");
	if(pc.hasCock()) 
	{
		output("stroking excitedly at your [pc.cock]. She tests its rigidity with her palms and teases at its sensitive flesh with light brushes of her fingers and claws; her breath washes over it");
		if(pc.balls > 0) output(" and lightly toasts the skin of your [pc.sack]");
		output(", coaxing out another bead of your precum.");
	}
	else if(pc.hasVagina()) output("brush gently against your labia, testing their pliability and soaking the fur on her fingers with your [pc.girlCum]. She gauges your reactions when she hits all the sensitive spots and dips herself inside you, warming you for her tongue; her breath washes over you, tickling [pc.eachClit] and communicating to you just how close you are to her touch.");

	output("\n\nHer scent, heat, and the liquid drips drives you impatient, and you don’t wait for Paige to close the distance – you lunge forward, both hands whipping up and wrapping around her waist to pull her onto your face and thirsty mouth. Inspired by your initiative, Paige dips down, taking yourself into her mouth as well.");

	//[=Next=]
	// end scene (scene: FTR1); go to (scene: FT692)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FT692,args);
}

//[=With Pleasure!=]
// (scene: FTWP1)
public function FTWP1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTWP1");
	output("You don’t resist as Paige uses her grip to pull you towards her steaming slit, and she thrusts her hips forward to close the gap. Your nose presses into her lower belly unceremoniously and your [pc.lips] squash against hers wetly. Your mouth is flooded with her taste and moisture, but it’s not enough for her. And, truth be told, you want some more too.");
	output("\n\n<i>“That’s it, [pc.name], eat up.”</i> Your [pc.tongue] lashes out and into her, drilling into her tunnel and worming its way against her walls, collecting and savouring every drop it finds. You put your upper lip to work by rubbing and bumping against her button, and you bring your hands up and around to Paige’s butt to keep her in place. <i>“Mmm,”</i> Paige congratulates, <i>“you’re very attentive, aren’t you? Everything gets a piece of you, doesn’t it?”</i>");
	output("\n\nYou don’t try to pull away to breathe, and instead use your nose, sucking in every bit of Paige’s scent as you do. Her hips quiver in excitement with every pass of your tongue into her, and she humps herself into your face rhythmically, making sure that every part of her horny quim isn’t left ignored.");
	output("\n\n<i>“How do you like me, [pc.name]?”</i> You don’t attempt to answer and continue your work diligently. <i>“I’m sure you’ve wanted a taste for a while now. Am I everything you’ve hoped I would be? Is you being under me a part of your fantasies? We don’t only have to do this once. I’ll fuck your face whenever you want me to....”</i>");
	output("\n\nYour lower body twists in agonizing want");
	if(pc.hasCock()) output(", [pc.eachCock] pointing to the sky as a beacon of your desire");
	else if(pc.hasVagina()) output(", your [pc.vagina] lonely and seeping onto the sheets of her bed");
	output(". Paige leans back, making sure her cunt never leaves your mouth, and she uses her hand to judge just how much you want her. ");
	if(pc.hasCock()) output("She finds [pc.eachCock] and plays with you, enjoying the effect she’s having on your manhood.");
	else if(pc.hasVagina()) output("She slips her fingers into your [pc.vagina], testing you and enjoying the way you squirm against her in surprise.");
	else output("She finds nothing at all but a flat slab of skin where something usually is. She hums out in surprise as she continues searching, but no matter how far she reaches, there’s nothing.");
	if(pc.hasGenitals()) output(" <i>“But there’s more to you than your mouth, and I’m sure you’d like me to pay attention to the rest of you.”</i> You, again, say nothing. <i>“Don’t worry.”</i> She disengages herself from your mouth (allowing you to take a breath of fresh air for once) and she maneuvers herself down your body, aligning her genitals with yours. <i>“I’m not a cruel teacher. I take care of my students.”</i>");
	else output(" <i>“Hmm. I wasn’t expecting you to not have either, [pc.name]. That makes things a bit trickier.”</i> She disengages herself from your mouth (allowing you to take a breath of fresh air for once) and she maneuvers herself down your body, aligning her genitals with your blank crotch. <i>“We’ll figure something out, sweet thing.”</i>");

	//[=Next=]
	// end scene (scene: FTWP1); go to (scene: FTWP2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTWP2,args);
}

// (scene: FT692)
public function FT692(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FT692");
	output("Paige’s hips obscure your face, submerging you into the thick of her hips and your lips against her pussy. Your tongue, eager to explore her further, pierces into her, tasting every bit of her: you wriggle it against her walls while you kiss and massage her vulva, teasing out as much of her femcum as you can. And, of course, you pay close attention to her engorged clit whenever you can, flicking at it with the tip of your tongue and delighting in the way she convulses in pleasure above you each time you do.");
	output("\n\nPaige is hardly idle herself, her face aligned with your crotch and her mouth just as eager to get started. ");
	if(pc.hasCock())
	{
		if(pc.cLength(0) <= 12) 
		{
			output("She keeps your [pc.cock] steady and still with one hand while her tongue roves over the shaft’s taut skin. She whimpers out in joy as her lips kiss and suckle on you, just beneath the glans of your [pc.cockHead], and her tongue slithers and lathers all over you, tasting every bit of you and loving all of it. Your precum beads out of you in exaggerated drops, and she lets it coat her fingers as she works you over");
		}
		else output("At first, she’s hesitant at your immensity, but she steels herself and begins devouring you: you’re not going to fit into her throat anytime soon, but she has a tongue and a pair of lips, and she uses both to wash and worship your [pc.cock], slathering every inch she finds with her kisses and saliva");
		if(pc.cockTotal() > 1) 
		{
			output(". Your second member isn’t left unattended, yet she only has one mouth: with her free hand, she jerks and massages your other shaft, her rhythm alternating between stroking up and slurping down");
			if(pc.cockTotal() >=3 ) output(", even while the rest of you slaps her wantonly in the face as she does so. She has no way of pleasuring all of you, and she whimpers in frustration at the fact");
		}
		if(pc.balls > 0) output(". Her other hand plays with your [pc.sack], juggling your orbs delicately, sloshing the cum in you around as she works for her meal");
		if(pc.hasVagina()) output(". She happens to brush against your [pc.vagina] as she plays, and your hips tense in the pleasurable shock – once she realizes what she’s found, she’s quick on the draw, lowering her palm until she’s cradling your balls with two fingers and fucking you with another two");
	}
	else if(pc.hasVagina())
	{
		output("She hooks both her hands underneath your body to clasp onto your [pc.ass] to lock you both into place, and she lunges into your [pc.vagina], slavishly penetrating into you as you are into her. Her long, flat Ausar tongue reaches deep into you, twisting and pushing at every ridge and cranny it finds.\n\nMimicking your technique, her lips purse rhythmically with her tongue’s lunges, eking out as much pleasure from every facet of your feminine parts as she can. With her superior position, she has an easier time using her lower lip to rub at your [pc.clit], and with each press of that particular button, you involuntarily thrust your hips into her thirst mouth");
	}
	output(".");

	output("\n\nYour senses are overwhelmed with Paige and everything about her. Her taste cakes your tongue and floods your mouth; you inhale her scent with every breath, your nose pressed firmly against her taint; her fur digs and brushes over your skin as she rocks back and forth on top of you; the sounds of her pussy’s wet squelching as you kiss and suck it, and the sounds of Paige moaning in the pleasure you’re giving her, fill your ears; and, of course, there’s not much else to see but Paige’s toned, tight, furry Ausar ass above you, her tail wagging slowly in contentment.");
	output("\n\nThe pleasure you’re giving each other using only your mouths is intense, and after several minutes, it’s clear to you both that you have no intention of stopping, even if it meant something better. The quivering on Paige’s hips get more and more intense the longer you two remain in place, and her devotions to your own hips and crotch become more and more eager and wanting. She’s very close, but she wants nothing more than to taste you, <i>all</i> of you, and she’s doing her level best to hold off until you cum with her.");
	output("\n\nShe doesn’t wait long...");
	processTime(6);
	pc.lust(12);

	//[=Climax=]
	// end scene (scene: FT692); go to (scene: FT69E)
	clearMenu();
	addButton(0,"Next",FT69E,args);
}

// (scene: FTLH2)
public function FTLH2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTLH2");
	output("Paige’s body alternates on top of you, tensing her upper body so she can roll her hips on you, then keeping her lower body rigid so she can reset her top. Your senses are bombarded with Paige and her actions: you feel the heat radiate off her body and the way her fingers lightly grip onto your skin; the scent of your juices fills your nostrils and the light slapping of your skins is music to your ears.");
	//if {The PC is pure male and is too big}
	if(pc.hasCock() && !pc.hasVagina() && pc.cockVolume(0) > paige.vaginalCapacity(0))
	{
		output("\n\nPaige keeps your [pc.cock] pressed against her body lovingly as she humps against your base. Your taut flesh is too thick and hard for even strong Paige to bend easily, which is just fine: she uses you as a pole to masturbate herself on, and with every slow, loving, sliding motion up, she teases out just a bit more pre from you");
		if(pc.balls > 0) output("r aching [pc.balls]");
		output(".");

		if(pc.cocks[0].cLength() <= 13) output("\n\nYour [pc.cockHead] grazes the underside of her breasts, wedging itself in the valley of her abdominals and enjoying the warm, tight ridges there. With every push up, Paige’s hands fondle and tickle your shaft, and occasionally she brushes her thumb over the tip, swiping away the liquids that have pooled there to lube her hands further.");
		else if(pc.cocks[0].cLength() <= 25) output("\n\nYour [pc.cockHead] nestles itself warmly between the valley of Paige’s breasts – the beat of your heart communicates with her own through the turgid flesh of your steely dick. Paige uses her hands to tickle your shaft and her forearms to squeeze her tits together, ensuring that the ride is amazing all the way through. She occasionally dips her head down to run her tongue along your sensitive head, sampling your liquids before they overflow into her soft fur.");
		else output("\n\nYour [pc.cockHead] lurches up and past Paige’s head, dwarfing her kneeling form and obscuring her from your sight. Paige, for her part, doesn’t miss a beat, and wraps the whole of her body around your monster of a dick to pleasure as much of it as she can. Her breasts form a fine, warm, furry wrapping around one part of your dick, while her mouth kisses and licks higher up, and her hips bump and hump lower down. Occasional beads of your pre cascades from your summit, sometimes dripping onto Paige’s hair and sometimes finding its way onto her tongue.");

		output("\n\nHer slavish efforts pay off for you both: the sensations of her skin drawing over yours, and the heat of your pole searing into her hands and fur, and the smell of your overpowering masculinity, and just the <i>perverseness</i> of the whole scenario, gets to Paige, and soon she’s distracting herself from pleasuring you to pleasuring herself by using you. Her moans escalate with every push forward, and soon she’s calling your name as her hips take control of herself.");

		output("\n\nYou feel a gush of liquid splash against your crotch, where Paige’s unseen cunt meshes against you. You feel a certain gush of another liquid rising from somewhere else...");
	}
	else if(pc.hasCock() && pc.cockVolume(0) <= paige.vaginalCapacity(0)) 
	{
		output("\n\nBut more than that is the fact that you’re making love to her. Paige is doing most of the work, but nonetheless, your [pc.cock] juts into her: the smoothness of your shaft melds with the ripples of her tunnel, and you bottom out just before you bump into the dead end. She fits you like a glove, and from the delighted moans above you and the way her body’s rocking is picking up in speed, you fit her like a key.");
		pc.cockChange();
		output("\n\nYour hands explore her body, from the meat of her ribs down to the swell of her ass, where you lock in place for stability. You thrust against her, needful: every push in is another taste of heaven and every draw out is a promise. Your left hand leaves the meat of her ass and tickles its way down her right forearm – when your hands meet, your fingers interlock.");
		output("\n\nPaige’s voice rises in jubilation in time with the creaks of her bed. Your own voice is restrained, but you moan her name, letting her know that she’s pleasing you like nobody else in the universe can. Your dick stiffens");
		if(pc.balls > 1) output(", and your [pc.balls] tense against you");
		output(", ready to quench her seven-year thirst. Paige’s back arches and her grip on your hand tightens as she yells out your name in time with her first convulsion.");
		output("\n\nYou’re only a thrust or two away yourself...");
	}
	//if {The PC has only a vagina, or a vagina and a dick that’s too big}
	if(pc.hasVagina() && (!pc.hasCock() || pc.cockVolume(0) > paige.vaginalCapacity(0)))
	{
		output("\n\nElectric pleasure surges from your [pc.vagina], lighting up your spine and energizing your abdominals. With one heavy draw, Paige’s hips slickly slide up and across yours, her sex mingling and meshing with yours: your [pc.clit] presses her own button on the way up");
		if(pc.balls > 0) output(", then pushes against your [pc.sack]");
		output(", then kisses it again on the way down. Lubricant paints both of your crotches and it’s only going to get messier.");

		output("\n\nYou match every motion, every grind and press, thrusting your own [pc.hips] up to meet Paige halfway");
		if(pc.hasCock()) output(", your [pc.cock] slapping coldly but not forgotten against her furry torso");
		output(". The room fills with the lewd squishing of your liquids; your nose fills with her scent, and you wonder if all she can smell is you. Your left hand finds Paige’s right, gripping onto her wrist; she lets go of the sheets and her fingers curl around yours. Her grip is a little tight, but that’s okay.");
		output("\n\nPaige bends forward, her body draping over yours. The sound of her creaking bed is drowned beneath both of your insensible moans: you switch and start calling her name as you feel your orgasm approaching, the familiar dam building inside you. Soon, Paige reciprocates, enunciating every forward motion with your name, shouting it louder and louder, her body growing needier and more wanton, until she lurches backward, her body stiffening, her voice leaving her –");
		output("\n\nIt’s more than enough to push you over, too.");
	}
	//[=Climax=]
	// end scene (scene: FTLH2); go to (scene: FTLE)
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",FTLE,args);
}

// (scene: FTGT2)
public function FTGT2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTGT2");
	output("It takes a bit of doing to multitask between fucking Paige and making sure her tits get the attention they deserve. Sometimes, you lapse into doing one too much over the other. But Paige doesn’t seem to mind, and continues to whisper sweet encouragements to you, letting you know how she enjoys being handled.");
	output("\n\n<i>“Pinch my nipples a bit,”</i> she instructs as she fucks you. You oblige, worming your thumb and forefinger beneath her fine fur and find the pointed nub, giving a bit of a squeeze. <i>“There you go. Not too hard. Just right.”</i> She sighs in elation, ");
	if(pc.hasCock()) output("slowing her bouncing on your dick a bit");
	else output("her own sliding growing slow and erratic");
	output(" as she enjoys the sensations in her tits. <i>“Heft them up. Get a good squeeze.”</i> You do so, weighing them in your hands and watching her flesh jiggle. <i>“Stars, I could get off from this alone.”</i>");

	output("\n\nYou take that as a challenge. Your fingers explore her boobs, scratching through the thin film of her fur, searching for every erogenous spot, no matter how small. You massage one tit in one direction, and she leans with you, but then you tweak the other nipple in the opposite. You turn one hand to tickle at her underboob, and she tenses – every time her body goes stiff, you thrust into her, knowing that she’s at her weakest. Conflicted and loving every second of it, her moans slowly grow more and more intense, and in response, your mauling of her flesh grows bolder and bolder.");
	output("\n\n<i>“[pc.name],”</i> she gasps out. You interrupt her by thrusting up, ");
	if(pc.hasCock()) output("spearing into her body just a little deeper. Her pussy squeezes harder, in time with both your lower body motion and your busy hands");
	else output("smashing your crotch against her own. Her pussy juice floods out and soaks into you a little more with every coordinated attack on her body");
	output(". Her body slowly leans forward, her hips jackhammering onto yours, and she starts to heave her chest more frantically, encouraging your hands to move faster. <i>“[pc.name]!”</i> she exclaims, again and again with each bounce on top of you. <i>“[pc.name]...!”</i>");

	output("\n\nShe stops, unable to say any more. You only need to go a few more pumps yourself.");
	processTime(5);
	pc.lust(10);

	//[=Climax=]
	// end scene (scene: FTGT2), go to (scene: FTCE)
	clearMenu();
	addButton(0,"Next",FTCE,args);
}

// (scene: FTST2)
public function FTST2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTST2");
	output("You move your [pc.lips] across the gap of her breasts to show the other the same attention. Paige");
	if(pc.hasHair()) output(" runs her fingers through your [pc.hair]");
	else output("’s hands gently cradle your head against her chest");
	output(" as she does most of the work at your hips, bouncing lazily ");
	if(pc.hasCock()) output("onto your [pc.cock]");
	else output("atop you for stimulation");
	output(".");

	output("\n\nYour left hand travels from her lower back to the swell of her ass. You rake your nails through the thin, short fur, lightly scratching and tickling her; it’s effective, and Paige tenses her glutes in enjoyment. Her sweet pussy ");
	if(pc.hasCock()) output("tightens around you");
	else output("clenches above you, her hot juices dripping");
	output(" as your fingers coil beneath the trunk of her tail, finding an erogenous zone.");

	output("\n\n<i>“I’m getting close, baby,”</i> she tells you. You don’t reply. It’s rude to talk with your mouth full. <i>“I want you to cum with me, [pc.name]. Are you close? Don’t let me go without you.”</i>");

	output("\n\nYou hum in the affirmative but you don’t change your pace or your direction – not that it would make a difference since Paige is doing most of the work. ");
	if(pc.hasCock()) 
	{
		output("Going by the telltale tickle in your glans");
		if(pc.balls > 0) output(" that travels down your shaft and into your [pc.balls]");
		output(", you have only a dozen thrusts or so at the pace you two are going");
		if(pc.hasVagina()) output(". Your [pc.vagina] clenches and practically spews at nothing, insulted at the neglect, but you have no doubt that every part of you will be enjoying this.");
	}
	else if(pc.hasVagina()) output("The wafting heat from Paige’s quim radiates with your own; your juices mix and wash together with her every swipe, your vulva meshing and kissing with hers. You thrust involuntarily whenever your [pc.clit] happens to rub against hers. You sharply inhale through your nose: you could count the number of passes it’ll take to finish you on both hands...");
	else output("Of course, you mostly just humour her: you’re not entirely certain she’s aware that you don’t have any genitals and she’s been fucking nothing this whole time. Still, the intimacy of the moment is what’s important, and if you <i>had</i> something down there, you have no doubts that you’d be close.");

	output("\n\n<i>“Just a bit more, sweet thing,”</i> she says, breathless. Her pace is barely restrained and her hips are shaking in her eagerness to reach her peak. <i>“Cum with me, [pc.name]. Cum with me!”</i>");
	processTime(10);
	pc.lust(20);
	//[=Climax=]
	// end scene (scene: FTST2); go to (scene: FTLE)
	clearMenu();
	addButton(0,"Next",FTLE,args);
}

// (scene: FTGHI2)
public function FTGHI2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTGHI2");
	output("Paige sits up straight on top of you, displaying her glorious, toned yoga-body for your benefit. She puts both her own hands on her breasts, playing with them and pinching and tweaking her nipples – since you’re too busy with her ass and they’re not about to pinch themselves. She gasps out the occasional laugh and you feel her ");
	if(pc.hasCock()) output("tunnel contract just a bit around your length");
	else output("hips quiver a bit on top of yours and against your sensual grip");
	output(" each time she does.");

	output("\n\nHer eyes haven’t opened in a while, too concentrated on the bliss between you. She’s put a lot of focus on her breathing, trying to maintain it and keep it steady; in through her nose and out through her mouth. You tease her by lightly brushing at the zone you found, and her breath audibly catches in her throat each time.");
	output("\n\nYou enjoy each other in the dimness of her room. There’s nothing particularly adventurous about your sex, but it’s obvious that that’s what Paige adores most: two lovers appreciating each other without things getting freaky or boisterous (at least, not this time). The calm pace between your bodies puts a sort of calm into her, and then into you, as you ride your way to your orgasm. Which isn’t far.");

	// Continue here if the PC has a penis
	if(pc.hasCock())
	{
		output("\n\nPaige’s head turns down in concentration: her eyes haven’t opened, but her smile is gone in place of a primeval concentration on her orgasm. Her bouncing grows more needy and intense, ");
		if(pc.cLength(0) < 7) output("rising high enough that your crown threatens to slip out if she wasn’t clenching so tightly");
		else if(pc.cLength(0) <= 11) output("riding every tantalizing centimeter on your [pc.cock] to get the full experience, from base to bulging shaft to bloated head");
		else output("which, you can imagine, will leave her sore later – she’s essentially clubbing herself in the cunt with your endowments – but she’s not about to stop and you’re not about to make her");
		output(".");

		output("\n\n<i>“I’m close,”</i> she warns you through dry breath. Her hands travel in circles around her tits, maintaining a rhythm above you. Again, you stroke her at the base of her tail, around the zone you found earlier. She winces, <i>“especially if you keep doing that!”</i>");

		output("\n\nYou’re very close yourself, and you tell her as much. T");
		if(pc.balls > 0) output("he telltale squeeze in your balls and t");
		output("he familiar bloat in the veins of your [pc.cock] as it prepares to shoot a load or two");
		if(pc.cumQ() >= 350) output(" or five");
		output(" send their signals up your spine. <i>“Cum with me, [pc.name],”</i> she implores, opening her eyes and staring straight into yours. <i>“I want to feel you inside me. Let’s finish together.”</i>");
		output("\n\nYou’re only a few thrusts away. And then one less. And then....");
	}
	// Continue here if the PC has a vagina, or is curiously lacking sexual endowments
	else
	{
		output("\n\nPaige’s head turns down in concentration: her eyes haven’t opened, but her smile is gone in place of a primeval concentration on her orgasm. Her grinding grows more needy and intense, drawing farther back and pushing harder forward, practically leaving friction burns on you");
		if(pc.hasVagina()) output("r abused, but just as ready and willing, [pc.vagina]");
		else output("r crotch – but you welcome them gladly, knowing that you got them because you pleased your woman as well as you did");
		output(".");
		output("\n\n<i>“I’m close,”</i> she warns you through dry breath. Her hands travel in circles around her tits, maintaining a rhythm above you. Again, you stroke her at the base of her tail, around the zone you found earlier. She winces, <i>“especially if you keep doing that!”</i>");
		output("\n\nYou’re very close yourself, and you tell her as much. ");
		if(pc.hasVagina()) output("The building wave of pleasure surges through you, threatening to overtake your body in just a few more strokes");
		else output("And you’re not entirely dishonest. The feeling you get when you ‘have’ sex since losing your genitals isn’t quite what you remember a conventional orgasm is, but the release you <i>do</i> experience is similar");
		output(". <i>“Cum with me, [pc.name],”</i> she implores, opening her eyes and staring straight into yours. <i>“I want to finish with you. Don’t make me wait.”</i>");
		output("\n\nThat won’t be a problem: you’re only a few grinds away. And then one less. And then....");
	}
	processTime(5);
	pc.lust(15);
	//[=Climax=]
	// end scene (scene: FTGHI2); go to (scene: FTCE)
	clearMenu();
	addButton(0,"Next",FTCE,args);
}

// (scene: FTFH2)
public function FTFH2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTFH2");
	output("Paige repositions herself so that her sopping wet sex is directly above your own, and as she does so, she brings her hands up to her face – taking an exaggerated sigh through her nose and then tasting the collected fluids on it");
	if(!pc.hasGenitals()) output(" (mostly for effect, since any fluids on it are hers)");
	output(". <i>“I’ll have to have some more of that later,”</i> she says sultrily, and then closes the distance, ");
	if(pc.hasCock()) output("devouring your [pc.cock] with her body");
	else if(pc.hasVagina()) output("meshing your [pc.vagina] with hers");
	else output("pressing her body against the flat of your crotch");
	output(".");
	output("\n\nYou’re both momentarily paralyzed, but your sensations come to you quickly. The excitement ");
	if(pc.hasCock()) output("of being inside Paige ");
	else if(pc.hasVagina()) output("of grinding and tribbing against Paige ");
	output("after all that teasing makes you a bit lightheaded, and it takes Paige starting before you to snap you out of it.");

	output("\n\nYou push against her, your movements frenzied; you’re closer to orgasm than you thought, although after all that foreplay, you’re not terribly surprised. ");
	if(pc.hasCock()) output("Your [pc.cock] throbs with your heart, bulging inside her, massaged by her every muscle and contour");
	else if(pc.hasVagina()) output("Your [pc.vagina] clenches in vain, hungry for Paige’s fingers, or anything");
	else output("Your time with your lack of genitals has accustomed you to how sexual ‘release’ works in your body, and it’s not far");
	output(". Paige matches your every aggressive movement, just as ready as you; she says no words but her whimpers are all you need to know how close she is, and she’s close.");
	output("\n\nDespite the urgency between you, you try to hold back, wanting to share in your release. You both lose all sense of grace and finesse: your hips both move with power and demand but they grow sloppy as they contradictorily speed you both to the finish and attempt to resist the coming tide as best they can.");
	output("\n\nIt doesn’t work for very long.");

	//[=Climax=]
	// end scene (scene: FTFH2); go to (scene: FTLE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTLE,args);
}

// (scene: FTFHB2)
public function FTFHB2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTFHB2");
	// Continue here if the PC has a penis
	if(pc.hasCock())
	{
		output("You take your penetration slowly as Paige works between your bodies to align your [pc.cock] into herself – your hands are busy, after all. She lifts her hips and wriggles them forward a bit to get them lined up, and you take the opportunity to twist your digit in her tight anus. The concentrated faces she makes are as funny as they are sexy.");
		output("\n\nYour [pc.cockHead] sinks past the tight, wet vulva of her cunt, and she stops momentarily to tease you both. You’re not having any of that, though. Your left hand spanks her ass cheek and your right hand drives deeper into the cleft of her butt. She yips in surprise and sinks to your hilt immediately – and then she yips again in passion as she experiences you finally and fully inside her.");
		pc.cockChange();
	}
	// Continue here if the PC does not have a penis
	else
	{
		output("You take your penetration slowly as Paige works between your bodies to align her crotch with your own – your hands are busy, after all. She gets lazy in her anally-teased stupor and presses down instead, slowly dragging her leaking pussy from your lower abdomen until it finds its mark at your crotch.");
		output("\n\nVulva to vulva, clit to [pc.clit], Paige closes her eyes in lust, enjoying the surging heat between you. She goes too slowly for your liking: your left hand spanks her ass cheek and your right hand drives deeper into her butt. She yips in surprise and drives forward an inch – and then yips again in passion as your tribbing sends her to a different place.");
		// Continue both here
	}
	output("\n\nNow that you both have what you both want, you’re not as interested in teasing her butt and slowly withdraw, making a show of it at your knuckles. Once you’re out, you go about the sex with a more vanilla speed. You don’t have much leverage for pushing, but you don’t need a lot to get the reactions you wanted.");
	output("\n\n<i>“I’m not going to lie, sweet thing,”</i> Paige says, focusing her gaze in your (relative) direction. <i>“I kinda liked it. We’ll have to explore later.”</i>");
	output("\n\nShe leans her body forward, pressing her boobs to your [pc.chest]. <i>“Would you like that?”</i> she asks lowly while her hips move with a renewed, focused purpose. <i>“You want to ");
	if(pc.hasCock()) output("shove this thick meat up my ass");
	else output("fuck me with the biggest strap-on we can");
	output("? Get the full yoga-body experience, [pc.name]?”</i>");

	output("\n\nAll the teasing and foreplay has apparently gotten her closer to completion than you realized. Her breathing has quickened and her body is moving at a more telltale pace. <i>“Something to think about. But in the meantime,”</i> she whispers, then sits back up, her knees on either side of your waist and her cunt plowing down onto your");
	if(pc.hasCock()) output(" rock-hard dick");
	else output(" crotch");
	output(". <i>“There’s something else we need to finish first.”</i>");

	output("\n\nThe dirty promises have gotten you a lot closer, along with her pounding overdrive onto you. You’re only a couple pumps away, until...");

	//[=Climax=]
	// end scene (scene: FTFHB2); go to (scene: FTCE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTCE,args);
}

// (scene: FTDN3)
public function FTDN3(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTDN3");
	output("Paige’s wet, hot, and tight tunnel claps against your [pc.hips], ");
	if(pc.hasCock()) 
	{
		output("swallowing your length down to its very base. The shock of her body against yours ripples up your [pc.belly]");
		if(pc.balls > 0) output(" and down across your [pc.sack], sloshing and multiplying the load within for her");
		output(". Your [pc.cockHead] spears just deep enough into her and your girth flits against all the right spots – and her pocket, in turn, squeezes you in just the right ways and kisses your crown with just enough pressure");
	}
	else if(pc.hasVagina()) output("your [pc.vagina] melding against hers in a sloppy facsimile of a kiss. Her body straightens and her tail goes rigid whenever her button happens to glide against yours, and you sharply inhale and mimic her form in kind. Her body seems to complement yours perfectly: the way your genitals happen to form against each other and the way you intrinsically know, and match, each other’s rhythm, knowing when to draw back and when to push up and in");
	else output("meeting and coalescing with nothing. Her body’s rhythm is rocked and unsteady at first as she takes broad strokes, dragging her pussy all over your blank crotch – she knew there was no dick but she at least expected a vagina to bond with. You both can’t help but be a little disappointed, although Paige is too horny to stop and you’re not about to ask her to");
	output(".");

	output("\n\n<i>“Yes,”</i> she drones. Her right hand trails down your arm until it finds yours, and she interlocks her fingers with your own. <i>“God, it’s been so long.”</i> Her eyes are closed, focusing entirely on the electricity between you both with her every movement. ");
	if(pc.hasCock()) output("She takes her time pulling up and away, savoring every nuance of your dick inside her and she’s remiss to let it out for even a little bit, and then she sighs as she bounces back down, taking you to your limit once again");
	else if(pc.hasVagina()) output("Her movements are slow, languid, and fluid, enjoying the rush of every lazy upstroke. Her body quivers every time and her grip on your hand gets tighter, then looser, flexing with the rest of her body");
	output(". With your free hand, you gently grip and ply at her buttock, kneading it with her every roll of the hip.");

	output("\n\n<i>“I don’t think I’ll last much longer,”</i> she laughs nervously. <i>“God again, I feel like it’s my first time all over, going only a few minutes.”</i>");
	output("\n\n<i>“Who says we’ll only be doing this once?”</i> you ask her. She laughs again, though this one was more of an exhalation: she’s very close. <i>“Don’t hold back on my account. We’ll do this as many times as it takes, Paige.”</i>");
	output("\n\n<i>“You know just what to say,”</i> she whispers. Her grip on your hand tightens. <i>“But I don’t want to finish without you.”</i>");
	output("\n\nYou push your [pc.hips] up for emphasis as you tell her, through gritted teeth, <i>“you won’t have to worry about that.”</i>");
	output("\n\nHer body quakes at the news and she rocks atop you once, twice, and a third time, before her body stiffens. You only need one or two more yourself, and then...");

	processTime(5);
	pc.lust(10);
	//[=Climax=]
	// end scene (scene: FTDN3); go to (scene: FTLE)
	clearMenu();
	addButton(0,"Next",FTLE,args);
}

// (scene: FTPH2)
public function FTPH2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTPH2");
	output("You take Paige at a casual pace: too slow and, while romantic, you’d get what you both need later, and you both need to get off. Too fast, and you worry it might come off as a little impersonal to Paige, especially since you’re her first in many years. You pound into her at a comfortable, constant speed, and she coos and bounces with you, appreciating the sensations just as much.");
	output("\n\n<i>“That’s it, baby,”</i> she says, a little louder than she probably meant. She gropes at her breasts, tweaking and pulling at her nipples, partly for your benefit. With every push onto your body, you feel her skin and her fur bounce from the impact, and her breasts bounce along with her, giving your eyes the candy they appreciate.");
	output("\n\nShe moves with experience, lifting her hips just enough that your [pc.cockHead] pulls at her, then drops down, sucking all of you into her body. Then she rocks a little bit, letting her heartbeat pulse through her and around your [pc.cock], before lifting and repeating. One hand leaves her boob and travels down her body, her fingers bouncing along her tightened abs, before finding her clit and playing with it – and reaching further in to stroke at any exposed shaft she might find on her lifts.");
	output("\n\n<i>“How long have you wanted me, [pc.name]?”</i> she asks huskily, her eyes narrowed seductively. Her other hand leaves her other boob and grips the back of her own hair, displaying her full chest to you.");
	output("\n\n<i>“Since the day I saw you,”</i> you admit. Whether or not it’s true, you know what she wants to hear. <i>“I had no idea yoga could do that to a body.”</i>");
	output("\n\nYou can feel her grip on you tighten in excitement as you congratulate her form. <i>“Tell me what you thought that day,”</i> she implores, her eyes closing as she imagines you walking into her class that fateful day.");
	output("\n\nYou whisper a bunch of nothings to her, about how much she impressed you and how much you wanted to feel her. With every dirty little secret you tell, she gets wetter and her humps onto your turgid length grow more impatient. You emphasize your stories by running your hands all over her body, from her taut rump to the ridges of her abs to the firmness of her breasts.");
	output("\n\n<i>“Just a little more, sweet thing,”</i> she says, her voice growing high-pitched. You cap your stories by telling her how much you wanted a piece of her crowning achievement, and grab two fistfuls of ass to punctuate yourself. Paige’s breathing becomes quickened and nasally, her fingers working overtime on her clit. <i>“A little more!”</i> she begs, but you don’t have much more breath to talk, yourself. You respond instead by increasing your pace, slamming yourself into her–");
	output("\n\nShe selfishly stops and you feel her body grow tense, especially around your [pc.cock]. Her body grips you, but you fight her for your own finish, which, as you feel her fluids wash down your dick and splash against your [pc.skinFurScales], is only a pump away...");

	processTime(5);
	pc.lust(10);
	//[=Climax=]
	// end scene (scene: FTPH2); go to (scene: FTCE)
	clearMenu();
	addButton(0,"Next",FTCE,args);
}

// (scene: FTKG2)
public function FTKG2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTKG2");
	output("You’re helpless underneath Paige’s superior position: your arms already grow sore and you know they’ll be bruised by the time she’s done with you. To say nothing of your poor pelvis: Paige pounds you like a jackhammer, her body thwacking hard against yours, driving your [pc.cock] deep into her and nearly out again on the upswing. But, hell, it feels great, you’re not about to complain.");
	output("\n\nStill, you feel lame as she does all the work. You try to do something to enhance the experience – maybe hold Paige by the hips for some thrusting power, or maybe latch your mouth onto a titty or something – but she’s not having any of it. Her knees lock against either side of your stomach; whenever you try to move your arms, she tightens her grip and leans into you; if you even try to thrust and meet her halfway, she growls and hits you back down with her ass");
	if(pc.PQ() < 70) output(", which is quite a bit more... powerful than your own");
	output(".");

	output("\n\n<i>“You wouldn’t give me what I wanted when I asked,”</i> she hisses, enjoying the dominate position. <i>“So I won’t give you what you want either. Fair’s fair, right?”</i> Well, whatever. If being dominant is what she wants, you won’t deny her.");
	output("\n\nThe Ausar above you takes your silence as submission and eases her position, just enough to drive yourself into her at a different angle. She takes a heady breath through her nose and chews her lower lip; you can tell that her tail is wagging a bit whenever she sits herself back down. <i>“Thank me,”</i> she says, clearly, but you ask her to repeat herself. <i>“Thank me for fucking you!”</i> she demands, much louder.");
	output("\n\nYou babble your thanks, telling her how privileged you are for letting you into the temple that is her body. Her body grows tenser and her hole tightens around your shaft. <i>“Tell me you want me!”</i> That one’s easy: you tell her that she’s beautiful, strong, and drop-dead sexy; you’d thought as much since you first met. <i>“Tell me you want me to fuck you!”</i> You <i>beg</i> her to not let this be a one-time thing, and that you’d do <i>anything</i>, with emphasis, to be put in your place beneath her again.");
	output("\n\n<i>“Tell me... tell me...,”</i> she says, whimpering as her hips pound you again and again, more eager and wanting than ever. Her breathing stutters as she leans into you, nose to nose. Her humping and shaking is stirring the load in you");
	if(pc.balls > 0) output("r [pc.balls]");
	output(", and you can feel the telltale burst rising and bubbling just beneath the surface, bloating your [pc.cock] in preparation. <i>“Tell me you’re close,”</i> she says.");

	output("\n\nThat one is also easy to say.");

	//[=Climax=]
	// end scene (scene: FTKG2); go to (scene: FTPFE)
	processTime(7);
	pc.lust(14);
	clearMenu();
	addButton(0,"Next",FTPFE,args);
}

// (scene: FTWP2)
public function FTWP2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTWP2");
	output("Paige thrusts onto you with authority, claiming you");
	if(pc.hasCock()) output(" by engulfing you");
	else if(pc.hasVagina()) output(" by dominating your [pc.vagina] with her own");
	output(". The sound of her furry flesh clapping onto your [pc.skinFurScales] reverberates through the room, and then again as she fucks you. You’ll probably be sore later.");

	output("\n\nPaige straightens her body, bringing both her arms up, her elbows above her head and her hands hooked behind it. She flaunts her perfect, toned body to you: her breasts bounce in front of you, her nipples taunting you to come at them, and she flexes her stomach with her every lift, her fur visibly indenting along her abdominals.");
	output("\n\n<i>“Tell me how much you like it,”</i> she says huskily, her" + (paigeBlind() ? " blind" : "") + " eyes piercing into yours. <i>“You’re getting what you wanted, [pc.name]. Your sexy yoga teacher is fucking you. She’s got her tits out for you. She’s naked; she’s </i> soaking <i>wet; and she’s all over you. Tell her how much you love being beneath her; how much you’d love to do it again.”</i>");
	output("\n\nYou repeat everything she says, and more, sprinkling in dialogue about how strong she is and how the dominant attitude suits her. True or not, the words really seem to work for Paige, and with every submissive acquiescence, her grin grows wider and her body becomes tenser. <i>“Aren’t you just the perfect little pet,”</i> she says, gasping out with every bounce. <i>“");
	if(pc.hasCock()) output("A vibrator would never ask me to keep going or tell me how much they love it");
	else if(pc.hasVagina()) output("A hot little bitch for the hot top bitch to play with");
	else output("The fact you don’t have anything to work with makes it even hotter. Like it’s something else I can dominate you with");
	output(".”</i> She leans forward, her hands drawing across your torso. <i>“I love all my pets. They make me happy. And I like making them happy.”</i> Her bouncing grows more intense and needy as her breaths come out in heavier draws – all the dominant talk has gotten her very close. <i>“What can I do to make you happy, [pc.name]?”</i>");
	output("\n\nHer fingers tense sharply, gripping onto your flesh for control and stability. You yelp in surprise as your own release bubbles inside you, just moments away from exploding. <i>“I’m close!”</i> you shout helplessly");
	if(!pc.hasGenitals()) output(", more for effect than anything");
	output(".");

	output("\n\n<i>“");
	if(!pc.hasGenitals()) output("Really?”</i> she asks, surprised and confused, but doesn’t stop. Her apprehension fades as quickly as it starts, too distracted by her own impending orgasm. She smiles. <i>“Well, ");
	output("I am too.”</i> Her hips draw up farther and slam down faster as she continues. Her nose is pressed to yours, her breath against your neck. <i>“Let’s get there together.”</i>");

	//[=Climax=]
	// end scene (scene: FTWP2); go to (scene: FTPFE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",FTPFE,args);
}

// (scene: FT69E)
public function FT69E(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FT69E");
	output("Paige’s hips stiffen and her muscles, from her abs to her rump and all the way down to her calves, become taut. Paige whines once, loudly, and you feel her explode into your mouth: her pussy convulses against your [pc.lips], squirting Paige’s distinct femcum across your tongue and down into your waiting, thirsty maw. Her clear, salty honey coats your teeth and your cheeks, and you let it, before you willingly swallow – and yet she’s not done, squirting again.");

	// Continue here if the PC is male or herm
	if(pc.hasCock())
	{
		output("\n\nYour orgasm is hot on her heels, and the sensation of her losing control sends you over yourself. Your cum surges from you");
		if(pc.balls > 0) output("r [pc.balls]");
		output(" and up your shaft, ");
		if(pc.cLength(0) <= 12) output("which is lodged deep in Paige’s mouth as she sucks you fervently for her prize.");
		else output("the exposed skin bloating visibly before reaching your glans, which is comfortably lodged in Paige’s hungry mouth.");

		if(pc.cumQ() <= 349) output("\n\nYour [pc.cum] returns the gesture and paints Paige’s mouth with itself, which she willingly and joyfully accepts. You pump your hips impishly against her, depositing your load as deep into her throat as you can, and she lovingly takes it all, swallowing one mouthful before sucking down another. She easily and expertly handles everything you give her, and when you finish (before her, you note), she patiently suckles on you for anything you might have hidden from her.");
		else if(pc.cumQ() < 1000) output("\n\nYour initial burst takes her aback, but she relaxes as she swallows you patiently, as though she were drinking from an exceptional straw. You feel each individual bubble of your [pc.cum] travel up your shaft and across her waiting tongue, inflating her cheeks just slightly before she, with a sexy sigh, swallows it to make room for your next batch. You share fluids like that for a moment, each pulse of yours timed perfectly with hers until you’re both dry.");
		else 
		{
			output("\n\nPaige takes your first two bursts like a champ, but she loses the fight between her throat and your prodigious load. She swallows the first two mouthfuls of [pc.cum], but her cheeks fill faster than her mouth can swallow, and soon it comes leaking from the corners of her mouth. But she doesn’t give up, even as you’re slipping from her by the batch; she doesn’t mind the full stomach and, judging from the way her hips continue to convulse, especially when she gulps down another bubble, she’s kind of into it.");
		}
		//if (pc.hasBalls = true)
		if(pc.balls > 0) output("\n\nThe hand she has on your [pc.balls] coaxes every load gently, pawing and squeezing, almost as if she’s pumping out your cum manually. They squeeze into your body each time, and when they relax back into your palm, she rotates her wrist just right, and back up they go.");
		if(pc.hasVagina()) output("\n\nThe fingers she has locked into your [pc.vagina] work diligently, knowing just how important it is that your dick’s sister gets off too. Your [pc.girlCum] coats her digits and her palm as your [pc.vagina] grips, relaxes, and grips again, vainly trying to squeeze Paige’s cum from her fingers.");
	}
	// Continue here if PC is vanilla female
	else
	{
		output("\n\nYour orgasm is hot on her heels, and the sensation of her losing control sends you over yourself. Your [pc.girlCum] bursts from your [pc.vagina] in equal fervor, soaking Paige’s hard-working tongue and into her Ausar mouth. She lazily yet expertly hits all the spots that are clenching the hardest as she happily gulps down your juice with as much enjoyment as you.");
		output("\n\nHer grip on your [pc.ass] tightens as she pulls you into her face, not letting a single drop of you escape: her wide, flat tongue rakes over your sensitive folds again and again, rewarding her for her diligence with more cum for her to collect.");
		output("\n\nShe, of course, pays no small attention to [pc.eachClit]; not enough to make it painful, but enough to remind you how hard you came when she did, which makes you cum again. It’s a feedback loop that doesn’t stop until you can take no more.");
	}
	// Merge here
	output("\n\nExhausted and spent, you both collapse, her onto your [pc.skinFurScales] and you onto her bed, sinking yourself into the fabric of her sheets. You’re both dry for now.");
	output("\n\nPaige takes her time clambering off your body; she peels herself from you, chest off your lower abdomen and butt off your chest. The cool breeze of the room sweeps across your body, at least until she spins herself around so that she’s meeting you face-to-face.");

	//[=Afterglow=]
	// end scene (scene: FT69E); go to (scene: FTAG)
	processTime(6);
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",FTAG,args);
}

// (scene: FTPFE)
public function FTPFE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTPFE");
	output("Paige stops on top of you, shuddering and groaning, and you feel her squirt and soak your crotch with her explosive orgasm. Her girlcum spreads quickly, coating your pelvis from taint to lower abdomen – and it keeps going as Paige keeps fucking you with abandon, clearly uninterested in stopping. The sound of her body impacting yours becomes wet and she has to peel herself from you every time she lifts or grinds against you.");

	// Continue here if the PC is male or herm
	if(pc.hasCock())
	{
		output("\n\nYou’re about to make it a whole lot messier as you");
		if(pc.cumQ() <= 349) output("r [pc.cum] erupts from your hard shaft, buried and abused in Paige’s twat. It blasts from your [pc.cockHead] and deep into her, and her body ripples around your length, eager and ravenous for more. Again and again, you give her what she demands, helpless beneath her as you inseminate her. Despite your effort to keep up with her, Paige is still cumming and the pool of her femcum is still growing between you for a few moments after you’ve gone dry.");
		else if(pc.cumQ() < 1000) output(" erupt inside her, dousing her flaming honeypot with some liquid love of your own. You attempt to count the shots your [pc.cock] makes into her, but you lose focus after four and instead just ride out your shared orgasm. Paige keeps rocking her body on top of you, sucking down load after load with every bounce, and she hums in delight with each warm, flowering bubble within her. Eventually, your backlog is too much for her to fully contain, and a splash of [pc.cum] bursts from her, trickling down the veins of your shaft and coating your lower body.");
		else output("r immense load ignites in her ovaries, blasting her vaginal walls and deep into her body again and again. Paige’s" + (paigeBlind() ? " blind" : "") + " eyes cross in her head as she takes your fourth load, then your fifth, and then you both quickly lose count; her toned stomach slowly balloons as she absorbs you, and soon that’s also not enough and your [pc.cum] bursts from between your dick lodged in her cunt, adding your spunk to the growing pool of femcum between you. Paige, though, makes no effort to remove herself; she takes every drop as best as she can, and from her blissed-out expression, she loves the sensation.");
		if(pc.balls > 0) output("\n\nYour [pc.balls] tense underneath you, pulling up and squeezing with your every contraction to meet Paige’s voracious quota for more cum. Their mass gets lighter and lighter with each one, giving you an easier time to thrust up into her – if only you weren’t already exhausted, and if Paige would just let you.");
		if(pc.hasVagina()) output("\n\nYour [pc.vagina] cums as well, cold and lonely, wishing to be abused and battered just like Paige’s. Your [pc.girlCum] adds to the mess spreading around you; your walls wink and compress invitingly for something, <i>anything,</i> to give it a taste of the euphoria Paige is going through, but nobody answers its cry.");
	}
	// Continue here if the PC is female
	else if(pc.hasVagina())
	{
		output("\n\nYou lie helpless beneath Paige and her domineering orgasm as you writhe through one yourself. The splashing squirts of Paige’s girl cum incites your own to burst from your [pc.vagina], squirting up and into the waiting maw of Paige’s twat, and you swap flavors. Paige times her cascades with needy humps forward, brushing her button over your oversensitive [pc.clit], stimulating another body-stiffening orgasm from you. You maintain yourself (if not your composure) for as long as you can, matching Paige orgasm for orgasm – by the time you both calm down, you, and especially Paige’s bed, are a total mess.");
	}
	// Continue here if the PC curiously lacks any sort of sexual endowment
	else
	{
		output("\n\nPaige’s orgasm triggers a memory within you. It’s been a familiar sensation, since you lost your genitals: your body rocks in time with hers, your featureless crotch bathed and baptized in Paige’s fluids, and you experience a sort of light-headedness that reminds you, if only a bit, of what orgasms used to feel like. You have no release, and you have no fluids to mingle with Paige’s, but you reach a type of endorphin high that, you accept, is going to be as close as you’re going to get. Paige, meanwhile, is loving it, and continues to grind the skin of your pelvis to an angry red as she enjoys herself on you three more times.");
	}
	// Merge here
	output("\n\nEventually, Paige’s unreal stamina taps out, and her rapid, obsessive movements slow to a stop. Her body twitches above you, eking out the last of her stress and energy through her abused-yet-happy cunt, and she finally stops, resting her body on yours as she swallows lungful’s of air.");
	output("\n\nShe’s released you from her grip in her stupor. You could fight to get up if you wanted, but not only do you not want to, but you wouldn’t have the energy. You lay together, soaked in various bodily juices, helpless to each other as you breathe and recuperate. Paige’s breath washes over your shoulder and down your back, until she recovers enough to prop herself onto her elbows, her eyes meeting yours and your noses touching.");

	//[=Afterglow=]
	// end scene (scene: FTPFE); go to (scene: FTAG)
	processTime(5);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",FTAG,args);
}

// (scene: FTCE)
public function FTCE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTCE");
	output("Paige’s eyes keep shut and she lets out a deep, guttural groan as you feel her twat gush around you, splashing its contents across your pelvis. <i>“Yes,”</i> she hisses, pumping her hips in time with her convulsions. She doesn’t stop, and she’s not about to stop – so, you join her in her release.");

	// Continue here if PC is male or herm
	if(pc.hasCock())
	{
		if(pc.cumQ() <= 349) output("\n\nYour hands tense, pulling at her body as your [pc.cock] shoots its heady load deep into her body. Paige purses her lips and flares her nostrils with every pulse of your [pc.cum] she feels you inject into her thirsty canal. <i>“Keep going, sweet thing,”</i> she cheers through a dry mouth, and you comply, giving her every drop you have stored up. She smiles and hums to herself through it all, up until you have nothing left to give.");
		else if(pc.cumQ() <= 1000) output("\n\nYour fingers dig into her fur and you feel your [pc.cock] inflate inside her, stretching her tunnel to accommodate the sudden girth. Your first bunch nestles deep into her womb, but it grows crowded and stuffed in moments with your quantity. <i>“My, sweet thing,”</i> she says, rocking her hips every time she feels another load inside her, <i>“you were almost as pent up as me. Keep it up, give me all you got.”</i> Despite her confidence, her body, paunch with cum, can’t contain all of you, and your [pc.cum] seeps from her in small rivers around your still-pounding dick. But she’s happy to keep trying.");
		else output("\n\nYou momentarily lose control over your motor functions as your titanic load bursts from your [pc.cockHead], filling Paige’s body to the brim in moments. <i>“Holy cow,”</i> she laughs, frozen on your body as you helplessly pound another few kilograms of sheer [pc.cum] into her body. The definition in her abs vanish before your eyes, replaced by a paunch of liquid. <i>“Don’t tell me you’ve been saving this for me, sweet thing? Give me all you got~.”</i> Your [pc.cock] bloats again and again with fresh surges of cum in time with your heartbeat, and you have no say whether you wanted to give her everything or not. Despite her confidence, your progeny bursts from the seal of your dick in her pussy as quickly as you deposit them – but, it’s not hurting her, and in fact she’s pretty into it, so you keep going.");
		if(pc.balls > 0) output("\n\nYour [pc.balls] squelch and pull into you with every shot, then relax just enough to build the pressure back up for another batch. Paige wanted everything from you, and your body is more than happy to give her what she wants.");
		if(pc.hasVagina()) output("\n\nThe sensation of cumming so hard into the Ausar above you gives you enough residual pleasure to cum hard from your neglected [pc.vagina]. It squeezes at air, lonely and jealous of its brother, wishing for a hard dick of its own to suck the cum from, but it makes due with pretending.");
	}
	// Continue here if PC is female
	else if(pc.hasVagina())
	{
		output("\n\nYou bite into your lower lip and unintentionally flex your fingers, clawing into Paige’s fur, as you cum with her. Your [pc.girlCum] squirts from you, splashing against the jets from the Ausar’s cunt, mingling their juices as they stick to both of you. <i>“Fuck,”</i> Paige winces, unable to articulate anything more poignant. Your [pc.clit] goes into overdrive, especially when it connects with Paige’s, both buttons pushing each other in your aimless throes. Your vulva presses squarely against hers in a lewd, passionate kiss, drooling out the last bits of your orgasm together.");
	}
	// Continue here if PC is genderless
	else
	{
		output("\n\nPaige’s orgasm triggers a memory within you. It’s been a familiar sensation, since you lost your genitals: your body rocks in time with hers, your featureless crotch bathed and baptized in Paige’s fluids, and you experience a sort of light-headedness that reminds you, if only a bit, of what orgasms used to feel like. You have no release, and you have no fluids to mingle with Paige’s, but you reach a type of endorphin high that, you accept, is going to be as close as you’re going to get. Paige, meanwhile, is loving it, and continues to grind the skin of your pelvis to an angry red as she enjoys herself on you three more times.");
	}
	// Merge here
	output("\n\nMoments later, you’re both spent, exhausted, and (figuratively) dry. You both heave and pant in the stuffy, smelly room, basking in each other’s heat as you come down from your individual highs. Paige sits on you, her body straight and stiff for moments, until she slowly collapses forward, laying her chest atop yours.");
	output("\n\nYou both rest there, silent but for your beating hearts in each other’s ears. Paige lays still at first, but, once she’s gathered her strength, she lifts her arms and gently wraps them around your shoulders and behind your neck, lightly embracing you.");


	//[=Afterglow=]
	// end scene (scene: FTCE); go to (scene: FTAG)
	processTime(5);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",FTAG,args);
}

// (scene: FTLE)
public function FTLE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTLE");
	output("Paige’s grip on your hand tightens, almost to the point of being painful, as she spasms and orgasms on top of you. Her pussy gushes everything it has onto you, imploring you to join it and her. Paige wanted you to cum with her, and you’re not going to make her wait.");

	// Continue here if the PC is male or herm, but not if the PC’s penis is too large
	if(pc.hasCock() && (pc.cockVolume(0) <= paige.vaginalCapacity(0) || InCollection("FTFH2", args) || InCollection("FTDN3", args)))
	{
		if(pc.cumQ() <= 349) output("\n\nYour other hand grabs a fistful of Paige’s ass as you climax into her, shooting your load deep into her loving, thirsty channel. Paige winces and chews her bottom lip as she feels you throb and burst inside of her. <i>“Yes, [pc.name],”</i> she implores; her movement has slowed, only enough to coax out your individual orgasms and liquids, instead using her energy to bask in the glow of your climaxes. <i>“[pc.name], I...,”</i> she says, then stops herself before she says something out-of-turn.");
		else if(pc.cumQ() <= 1000) output("\n\nPaige huffs deep breaths every time she feels you deposit another heavy load of [pc.cum] into her; your dick gets thicker just before every wad, and she clenches a little tighter after every one. <i>“Yes, [pc.name],”</i> she whispers, begging with her body for you to keep going. Both of your hands clench, your left squeezing her own and your right pulling at her tough skin as your load surges through your [pc.cock] and into her. <i>“Keep it up, sweet thing,”</i> she says, rocking her hips and stiffening with every new shot.");
		else output("\n\nPaige’s breath and voice catch in her throat as your immense load catches her pleasantly off-guard. Your force and quantity are unrelenting, giving her heaps and heaps of [pc.cum][if (pc.hasBalls = true), your overstuffed [pc.balls] clenching again and again with every new batch");
		output(". <i>“Wow, [pc.name],”</i> she manages to laugh, her grip on your limp-from-overstimulation hand tightening with every new shot. <i>“Give me all of you, baby. Paige wants it all.”</i> You couldn’t stop the flood if you wanted – not that you want to.");
		if(pc.hasVagina()) output("\n\nYour [pc.vagina] spasms in perfect sync with Paige’s, such to the point that you almost feel like it’s <i>you</i> that’s getting fucked and filled with cum. Every time Paige clenches on you, your pussy mimics her exactly, sucking load after load of empty air but pretending it’s cum anyway. It’s enough to make you cross-eyed.");
	}
	// Continue here if the PC is female, and/or has a penis that is too big
	else if(pc.hasGenitals())
	{
		if(pc.hasVagina()) output("\n\nPaige’s cunt deluges yours in her squirting juice, and your own [pc.vagina], not to be outdone, replies with its own ripping orgasm: both of you become speechless in her room as you press vulva to vulva and button to [pc.clit], lewdly meshing and kissing your bottom lips with each other. You exchange fluids, coating each other’s genitals, all the way to your lower stomachs and down across your taints. Paige’s hand grips tightly onto yours as though she were trying to keep from falling off, and you respond in kind, one hand in hers and your other scratching and pulling at her body for vain stability.");
		if(pc.hasCock()) 
		{
			output("\n\nThe wet heat suddenly splashing against your base massages your rock hard [pc.cock] as cum visibly rockets itself up and towards your bloated [pc.cockHead]. Your glans flare slightly and the color deepens before the first spurt of heavy, abundant cum slips, then fires from your tip, ");
			if(pc.cLength(0) <= 7) output("coating the underside of Paige’s breasts and her belly");
			else if(pc.cLength(0) <= 23) output("splashing Paige in the face, coating her cheek in its goo, yet she’s too blissed out to care (and, from the way she groans, she might actually like it)");
			else output("arcing high into the air, nearly touching her ceiling, before raining back down on her, splashing across her hair, nose, and occasionally, into her mouth");
			output(". You feel each shot as it inflates your [pc.cock] and rubs against Paige’s body on the way out.");
		}
	}
	// Continue here if the PC is genderless
	else output("\n\nThe wet heat splashing against your groin, and the sudden heft to Paige’s musk, triggers a sort of memory within you. You can no longer ‘release’ the same way you could when you had genitals, but the sensation you get – a heat that originates in your stomach, then blooms to your limbs, to your fingers and to your scalp – resembles what you remember an orgasm to be. It’s not the same and not nearly as potent, but it calms your body the same way an orgasm does.");
	// Merge here
	output("\n\nYour orgasms last the better part of a minute, and then your bodies both begin to calm. You sink and sag into Paige’s bed, spent and exhausted – and only now are aware of the crushing pain in your left hand from Paige’s grip. You don’t really care, though. You’ve just had one of the best experiences of your life with one of the best women in the universe, still sitting stunned and senseless on top of you.");
	output("\n\nEventually, Paige joins you in the room, her consciousness returning to her. She flexes the fingers in her right hand, eventually releasing you as she tumbles forward, gently setting her chest on yours and greeting you nose-to-nose. Without warning, she leans forward and plants a long, lingering, tongue-less kiss on your lips.");

	processTime(5);
	pc.orgasm();
	//[=Afterglow=]
	// end scene (scene: FTLE); go to (scene: FTAG)
	clearMenu();
	addButton(0,"Next",FTAG,args);
}

//[=Afterglow=]
// (scene: FTAG)
public function FTAG(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FTAG");
	output("<i>“God, did I ever fucking need that,”</i> she says huskily, her eyes locked onto yours and a smile brighter than the sun on her face. <i>“You are just the whole package, [pc.name]. Not only can I trust you with a secret, but I couldn’t have asked for a better ");
	//if {not FTPFE}
	if(!InCollection("FTPFE", args)) output("lover");
	//if {FTPFE}
	else output("toy");
	output(".");
	//if {FT69E} 
	if(InCollection("FT69E", args)) output(" And one that tastes</i> delicious, <i>too");
	output(".”</i>");

	output("\n\n<i>“Anytime,”</i> you reply, a goofy smile on your own face. Paige’s afterglow is contagious, and if she could see your face, you’re sure you’d have the same effect on her.");
	output("\n\n<i>“Do you promise?”</i> she asks playfully, although the giddiness in her words is apparent. <i>“");
	//if {FTLE}
	if(InCollection("FTLE", args)) output("I haven’t felt this... this involved, this</i> wanted, <i>in so long. I feel like I’m in college all over again");
	//if {not FTLE}
	else output("I have seven years to catch up on. You’re going to need all the stamina you can");
	//if {FTPFE}
	if(InCollection("FTPFE", args)) output(", especially if you’re going to keep letting me take charge like that");
	output(".”</i>");

	output("\n\n<i>“I’m not going anywhere,”</i> you reassure her, and to seal your word, you lean forward, giving her a kiss on the forehead.");

	output("\n\nShe smiles and sighs, then lays her head down, resting her cheek just above your breast. You lay with each other for a moment, still winding down from the excitement.");
	//if {FT69E}
	if(InCollection("FT69E", args)) output(" <i>“And we didn’t even get to the main course. If you’re as good at fucking as you are eating pussy, we’ll never leave this room.”</i>");
	//if {FTFHB1}
	if(InCollection("FTFHB1", args)) output(" <i>“I meant what I said, by the way. I never even thought to try having something up my ass. I’m willing to give it a try if you are.”</i>");
	//if {FTPFE}
	if(InCollection("FTPFE", args)) output(" <i>“You... you don’t mind if I get aggressive in bed, right? If you wanted me to stop, I would have stopped.”</i> You tell her that you wouldn’t mind changing it up now and again, but if being the top is what she enjoys, you’re all for it. <i>“Good.”</i>");
	//if {FTLE}
	if(InCollection("FTLE", args)) output(" <i>“Hey, um...,”</i> she stutters. With her head on your chest, you feel her mouth words to herself, but she says nothing. <i>“Never mind.”</i>");

	output("\n\nYou and Paige both pass out for hours. When you awake, you stink like a horny Ausar and you’re plastered to the bed – but you’ve never felt fresher or more energetic. She’s hesitant to let you go, and from the way she fondles you as you redress yourself, she’s two words away from throwing you back onto the bed and ruining it some more. But, she knows, she can’t – you’re both responsible adults, after all.");

	output("\n\nShe makes you promise that you’ll visit her again, and soon, before she lets you leave her unit.");

	// end scene (scene: FTAG); if gendered, reduce Lust to 0; if genderless, reduce lust to 15; advance clock by eight hours; restore Energy to 100; place PC one square outside Paige’s Unit
	processTime(8*60);
	pc.lust(-10);
	sleepHeal();
	clearMenu();
	addButton(0,"Next",moveSouth);
}

// (scene: Sex Select)
// This is the group of scenes that the PC unlocks after having sex with Paige for the first time. The following input is from the base document, copied for posterity.
public function sexWithPaige():void
{
	clearOutput();
	showPaige(true);
	output("You answer Paige’s question by sliding closer to her. You snake your arm across the small of her back, rubbing at the base of her tail and itching up her spine just slightly. <i>“I have no plans,”</i> you say to her lowly. <i>“I have plenty of ideas, though.”</i>");
	output("\n\n<i>“Oooh,”</i> Paige hums, flexing her back and cooing when your fingers tickle a particularly erogenous zone. Her tail swishes behind her, flapping against your forearm and stroking it. <i>“I’m listening, sweet thing.”</i>");
	output("\n\n<i>“I could tell you,”</i> you flirt, leaning in and kissing the back of her ear, <i>“but that would ruin the surprise, don’t you think? It’d be better to show you.”</i>");
	output("\n\nPaige turns her head, her nose burying into your neck. She takes a deep breath, immersing herself in your scent, readying herself for the immediate future, and then continues your game. <i>“");
	if(paigeBlind()) output("And just what do you think you can show a blind woman, [pc.name]?”</i>");
	else output("And just what in the universe do you think will surprise me by now, [pc.name]?”</i>");

	output("\n\nYour fingers dip into the hem of her pants, and you rake your fingers across the fine fur and tight muscles of her ass. You feel her shudder in excitement as your fingers trace lower, towards the cleft. <i>“You’ll be seeing stars by the time I’m done with you, Paige.”</i>");

	output("\n\nApparently having enough, Paige pushes you down, and you flop onto her bed with no resistance. ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output("In no time at all, you’re naked as could be, and w");
	else output("W");
	output("ith you prone, Paige takes her position over you, straddling your hips with hers. You can feel the heat of her pussy");
	if(pc.hasCock()) output(" bathe against the meat of your [pc.cock]. She eagerly begins to grind herself on it, soaking it in her essence");
	else if(pc.hasVagina()) output(" and directly onto your own [pc.pussy], her dripping essence mingling with yours");
	else output(". She pleasures herself on the featurelessness of your crotch");
	output(", but she doesn’t take it any further – not until she’s decided what she wants to do to you. <i>“We’ll see who will be seeing what, [pc.name],”</i> she challenges breathlessly, humping against you between words.");

	output("\n\nYou know that Paige likes to be in control during your lovemaking, but it’s pretty easy to influence her actions on what she does to you. How do you want Paige to fuck you?");
	clearMenu();
	//[=Vanilla=][=Anal=][=Tribadism=][=Down On You=][=Down On Her=]
	// end scene (scene: Sex Select)
	if(!pc.hasCock()) addDisabledButton(0,"Vanilla","Vanilla","You need a penis to have sex with Paige this way!");
	else if(pc.cLength(0) > paige.vaginalCapacity(0)) addDisabledButton(0,"Vanilla","Vanilla","You might literally split the poor girl in half with your monster! Maybe you should look into some reduction to have sex with Paige this way.");
	else addButton(0,"Vanilla",SSVI,undefined,"Vanilla","Just straight, no-nonsense ugly bumping.");
	if(!pc.hasCock()) addDisabledButton(1,"Anal","Anal","You need a penis to have sex with Paige this way!");
	else if(pc.cockVolume(0) > paige.analCapacity()) addDisabledButton(1,"Anal","Anal","You need a smaller penis to take the back door. You don’t want to hurt her!");
	else addButton(1,"Anal",SSAI,undefined,"Anal","Knowing Paige, she’ll probably let you do this. Couldn’t hurt to try!");

	if(pc.hasCock() && !pc.hasVagina()) addDisabledButton(2,"Tribadism","Tribadism","Vaginas only – no penises allowed!");
	else if(pc.hasCock()) addDisabledButton(2,"Tribadism","Tribadism","You can’t do this if you have a penis! Why not just use it instead?");
	else if(!pc.hasVagina()) addButton(2,"Tribadism",SSTI,undefined,"Tribadism","You can still do this even if you have no vagina, although it probably won’t be as fulfilling for you.");
	else addButton(2,"Tribadism",SSTI,undefined,"Tribadism","Fuck Paige the way only another woman can.");

	if(pc.isHerm()) addButton(3,"Down On You",SSDY,undefined,"Down On You","Paige is the explorative type. She’d love to have a face-to-crotch look at your exotic set.");
	else if(pc.hasCock()) addButton(3,"Down On You",SSDY,undefined,"Down On You","Ask Paige to suck you off. She’ll probably be all for it, knowing her.");
	else if(pc.hasVagina()) addButton(3,"Down On You",SSDY,undefined,"Down On You","See if Paige is up to eating you out. Knowing her, she’d love to.");
	else addButton(3,"Down On You",SSDY,undefined,"Down On You","You don’t have anything for Paige to play with, but if you asked nicely, she’d at least pretend.");
	addButton(4,"Down On Her",SSDH,undefined,"Down On Her","You wouldn’t mind going down on Paige this time. She’d probably love to hear you say that.");
	if(paigeIsCrew()) addButton(5,"Reenact",SSR,undefined,"Reenact","Replay the night you and Paige first had sex. To the best of your memory, anyway...");
	else addDisabledButton(5,"Locked","Locked","Paige’s relationship with you is not developed enough for this...");

	addButton(6, "BodyWorship", studyHerPaigeByPaige, undefined, "Worship Her Body", "Paige has put a lot of effort into her body. You could make love to her, but that doesn’t seem like it’d be paying her efforts enough due diligence. Maybe spending some <i>quality time</i> with her will get the message across...");
}

//[=Vanilla=]
// Requires a penis with an area of 65 or less
// Tooltip (No penis): You need a penis to have sex with Paige this way!
// Tooltip (Penis is too big): You might literally split the poor girl in half with your monster! Maybe you should look into some reduction to have sex with Paige this way.
// Tooltip (Yes penis): Just straight, no-nonsense ugly bumping.
// Action tree: http://i.imgur.com/vW6QpSw.png
// (scene: SSVI)

public function SSVI():void
{
	clearOutput();
	showPaige(true);
	IncrementFlag("SEXED_PAIGE");
	output("You’re horny, and Paige is horny. You don’t need any more foreplay and you’re not interested (this time) in being a little more adventurous – you need a warm hole to bust a nut into, and she needs a hard dick inside her. From the way she’s greedily jilling herself off on you, she agrees");
	if(pc.hasVagina()) output(". Your [pc.vagina] clenches in frustration at being ignored, but your [pc.cock] is the focus this time");
	output(".");

	output("\n\nYou say nothing as you clamp onto Paige’s arm with your left hand for stability, then reach down between you and stroke your [pc.cock] along her soaking wet slit with your right. Paige humphs once in surprise, and you give her another shock by lifting your thumb and gracelessly scraping it across her clit as you position yourself.");
	output("\n\n<i>“That’s it, don’t make me wait,”</i> she says through gritted teeth. Her abdominals flex, her toned six-pack showing through her fur, as she prepares herself for the penetration. Her focus is elsewhere – if you wanted to take this lovemaking in a different direction, now is your time to strike.");
	var args:Array = [];
	//[=Be Bottom=][=Be Top=]
	// end scene (scene: SSVI)
	args.push("SSVI");
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Be Bottom",SSVBB,args);
	addButton(1,"Be Top",SSVBT,args);
}

//[=Be Bottom=]
// (scene: SSVBB)
public function SSVBB(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You’re quite alright where you are, you decide: Paige atop you, shivering in eagerness to get fucked, with all her finest assets on display for you. Rather than waste the time and energy jockeying for positions with her, you cut to the chase and thrust up and into her.");
	pc.cockChange();
	output("\n\n<i>“Oh!”</i> she says in surprise; once you’re fully hilted in her, you grab onto her other wrist to keep her steady");
	if(pc.isNaga()) output(" and you coil your [pc.legs] around hers gently, enough to keep her in place but not tight enough to restrict her");
	output(". You withdraw and thrust a few times, testing her wetness, her grip and her heat and adjusting her body to your sudden girth. She hums in lazy delight and melts on her kneeled position above you as you do the work, slouching forward.");
	output("\n\nHer face presses to yours and you can feel the heat of her breath gasp out with every inward thrust across your [pc.chest]. She leans on her elbows on either side of your shoulders, then works her own hips, pounding back onto you, reaching as deep into her as she can. ");
	if(pc.cLength(0) <= 11) output("<i>“That’s it, fuck me harder, [pc.name],”</i> she says huskily");
	else output("<i>“Gods, I feel so tight on you. You’re gonna ruin me for anyone else,”</i> she laughs");
	output(".");
	output("\n\nYou both enjoy a fairly casual pace, humping and bumping against each other. Paige takes the time to play with your [pc.hair] and coo occasionally whenever your [pc.cock] hits a particularly vulnerable spot inside her, and you keep busy by running your hands all over her sexy body, from her shoulders to the meat of her ass.");
	//[=Kiss Her=][=Spank Her=]
	// end scene (scene: SSVBB)
	processTime(5);
	pc.lust(10);
	args.push("SSVBB");
	clearMenu();
	addButton(0,"Kiss Her",SSVKH,args);
	addButton(1,"Spank Her",SSVSH,args);
}

//[=Be Top=]
// (scene: SSVBT)
public function SSVBT(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige is naturally dominant in the sack, but that gets boring (and kind of emasculating) the more often you let her do it. You decide that this time, you want to be the top, and you’re prepared to ‘convince’ Paige to let you.");
	output("\n\nYou tease her, rubbing your [pc.cockHead] against her mons until she sighs in horny exasperation. When she does, you lift up, grabbing her by just under her tit and lifting her off you and to your side. <i>“Oh, big [pc.boyGirl] wants to top, does [pc.heShe]?”</i> Paige asks playfully, then resists, locking her legs on either side of your waist and flexes her arms against yours, fighting to keep herself upright.");
	output("\n\nIt’s an intense struggle between you two: not only do you have to push Paige down beneath you, but you have to keep her from impaling herself on your [pc.cock]. If she does, she wins. And with the way her cunt keeps sliding over your tool, and how your head sometimes slips in, and how your best source of leverage is to grab her boobs (and of course you’re copping a good feel too, why not), you keep getting harder and the fight keeps slipping from your control.");
	output("\n\nFinally, you manage to one-up her by bending at the hip, grabbing her by her ass, and turning as you toss her into the air. She comes crashing down, giggling like a horny freshman with you on top of her");
	if(pc.PQ() < 60) output(". Although you take pride in the win, you can’t help but feel Paige might have given it to you.");
	else if(pc.PQ() < 80) output(". It was a hard fought win, and having overtaken Paige fair and square has made you even harder.");
	else output(". Truth be told, most of that fight was foreplay and you were just humoring her – and it looks like it worked.");

	output("\n\n<i>“Okay, [pc.name], you win,”</i> she says, lowering her head into the pillow and lifting her hips for your perusal. <i>“Claim your prize. Don’t make me wait any more.”</i>");
	output("\n\nShe never said <i>how</i> to claim your prize, though....");

	//[=Doggy Style=][=Missionary=]
	// end scene (scene: SSVBT)
	processTime(5);
	pc.lust(10);
	args.push("SSVBT");
	clearMenu();
	addButton(0,"Doggy Style",SSVDS,args);
	addButton(1,"Missionary",SSVM,args);
}

//[=Kiss Her=]
// (scene: SSVKH)
public function SSVKH(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You reach up and cup Paige’s cheek with your hand. She leans into it affectionately, and you boldly lean forward, placing your lips on hers. She doesn’t push you away or even hum in surprise like she usually does; instead, she melts some more and opens her mouth, letting her tongue out to play.");
	output("\n\nThough the sex is fairly casual, you both make it intimate: your hands explore each other, pressing and tickling at the spots you both know you’re weakest at. You both do half the hip movement so that one isn’t working too hard and you both massage each other’s tongues and count each other’s teeth in long, languid strokes. It’s not strenuous; it’s not exhausting; but it’s passionate, and something about it being Paige makes the experience all the more special.");
	output("\n\nShe pulls away and makes a show of licking her lips to enjoy your taste. She sits up, squatting her hips down onto yours, all the way to your base. <i>“You’re a good kisser,”</i> she congratulates breathlessly as she rotates her hips, nudging your [pc.cock] against every vein and bump inside her. <i>“We’ll see about putting that tongue to other use later.”</i>");
	output("\n\nPaige begins to bounce, her breath shallow and getting shallower every time you bottom out. She raises her arms above and behind her head, thrusting out her tits for you. <i>“Touch me,”</i> she asks. <i>“I like it when you do. I cum harder when you appreciate me and my form.”</i>");
	output("\n\nWell, it <i>is</i> a pretty sexy form. You watch her as she flouts her body and her nipples as they draw oblong circles with her bouncing. You wouldn’t leave her waiting, would you?");

	//[=Caress=][=Manhandle=]
	// end scene (scene: SSVKH)
	processTime(5);
	pc.lust(10);
	args.push("SSVKH");
	clearMenu();
	addButton(0,"Caress",SSVCa,args);
	addButton(1,"Manhandle",SSVMH,args);
}

//[=Spank Her=]
// (scene: SSVSH)
public function SSVSH(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Her leaning frame and proximity give you the perfect angle of attack for a hard, sexy slap on the ass. You trail your hands across her back, making it like you tracing its defined muscles as you map out their contours, then, as you make it to her waist, you strike, whipping both hands back and lunging them, cracking them hard against the taut muscle of her derriere.");
	output("\n\n<i>“Hah!”</i> she laughs, ");
	if(pc.PQ() < 60) output("thrusting her hips back into your palm. <i>“You call that a spank? Come on, really put your arm into it! Show me you mean it!”</i>");
	else if(pc.PQ() < 80) output("keeping her body low and her face close to yours. <i>“You like that? You ever spank an ass that tight, [pc.name]? Do it again!”</i>");
	else output("biting into her lower lip to keep from shouting. <i>“A bit lighter next time, okay?”</i> she whispers, then shouts, <i>“But don’t you dare stop! Beat my tight ass like it owes you money!”</i>");
	output(" You do as she commands and you wind back to slap both her cheeks once again, feeling the shock ripple through her cunt and all across your [pc.cock]. <i>“There you go!”</i>");

	output("\n\nThe pace of your sex hasn’t changed, but your hands become much more active, groping and pulling at various parts of her body; you run them down her legs and feel the strength in her calves, then up her hips to her powerful stomach. Paige is sitting up, squatting on your [pc.hips] and bottoming you out with every bounce. <i>“I like this,”</i> she says nonchalantly. <i>“I like it when my bottoms take some initiative.”</i>");
	output("\n\nShe likes initiative? Well, with her new position, her breasts are bouncing firmly in front of her, her nipples drawing lazy circles in the air. If there’s any one part of her body that’s easy to appreciate, it’s right in front of you, and you doubt she’d stop you.");

	//[=Chew=][=Lick n’ Suck=]
	// end scene (scene: SSVSH)
	processTime(5);
	pc.lust(10);
	args.push("SSVSH");
	clearMenu();
	addButton(0,"Chew",SSVCh,args);
	addButton(1,"LickN’Suck",SSVLnS,args);
}

//[=Doggy Style=]
// (scene: SSVDS)
public function SSVDS(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("<i>“On your stomach,”</i> you growl lustfully, settling into the dominant role. <i>“Don’t make me make you.”</i>");
	output("\n\nPaige does as commanded, swinging her left leg in front of you as she rolls over, presenting her raised tail to you. <i>“You want me face down?”</i> she asks as she moves backward, trapping your [pc.cock] between your lower belly and her horny Ausar slit, frigging herself against it as she speaks. <i>“Like a real bitch, [pc.name]? Well, here I am: a real bitch. A real</i> horny <i>bitch that wants an alpha to</i> fuck <i>her like one.”</i>");
	output("\n\nYou read her loud and clear: you lean your [pc.hips] back just enough to line up your shot, and you drive into her, wrapping her around your dick in one thrust. She groans out and muffles her face into her pillow, submissively raising her ass higher so you can get more thrusting power. You don’t worry if she’s uncomfortable; her bent position is probably nothing compared to her years of yoga.");
	pc.cockChange();
	output("\n\nShe wants to be fucked like a dog, so you fuck her like one: you lean forward, lining your [pc.belly] against her back (letting her tail out to the side) and you wrap your arms around her, gripping onto her swinging tits. <i>“Yesssss, fuck me,”</i> she demands, even as you squeeze her tits. <i>“That’s right, [pc.name], you’re the real ");
	if(!silly) output("alpha here, aren’t you?");
	else output("man now, aren’t you, dawg?");
	output("”</i>");

	output("\n\nDespite the reversed positions, it feels like Paige is still the one calling the shots – and from the way her breathing has quickened and her pitch is rising, surefire signs of an impending orgasm, it sounds like she’s going to get there before you. From your superior position, you could try to teach her not to be so insolent to her alphas – and even if it doesn’t take, you’ll both probably still enjoy it.");

	//[=Rougher=][=Gentler=]
	// end scene (scene: SSVDS)
	processTime(5);
	pc.lust(10);
	args.push("SSVDS");
	clearMenu();
	addButton(0,"Rougher",SSVR,args);
	addButton(1,"Gentler",SSVG,args);
}

//[=Missionary=]
// (scene: SSVM)
public function SSVM(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("In all honesty, you didn’t really have any plans to exercise your superior position in any particular way. You just wanted to be the top.");
	output("\n\nYou reach between your bodies, aligning your [pc.cockHead] with her drooling Ausar cunt. You feel its heat against your glans well before you feel anything else, and you fix that with one hearty thrust forward, sinking into her depth. Paige closes her eyes and hums in delight as she feels your heavy [pc.cock] reach deeper and deeper into her.");
	pc.cockChange();
	output("\n\nOnce you’re bottomed out and nestled, you lean forward, draping your body over hers. ");
	if(pc.biggestTitSize() <= 2) 
	{
		output("Your [pc.chest] kisses against hers, nipple to [pc.nipple]; her tits may be bigger than yours");
		if(pc.biggestTitSize() <= 1) output(" (not that you’ve been trying very hard or anything)");
		output(", but that only gives you something bigger to lean against");
	}
	else if(pc.biggestTitSize() <= 7) output("Your [pc.chest] overwhelms hers, her nipples kissing against your [pc.nipples] in an attempt to push their weight off them, but your significant assets squash hers flat");
	else output("Paige vanishes into the valley of your [pc.chest], swallowing her whole torso and pinning her arms by their shoulders. She squirms in their warmth, but it’s pointless for her to try and escape");
	output(". In the more intimate proximity, you reach for her hand and lock your fingers with hers.");
	output("\n\n<i>“It’s sexy being the top, isn’t it?”</i> she asks, a warm, wide smile on her face as she looks (approximately) into your eyes. <i>“I don’t mind being the bottom for you, [pc.name].”</i> For emphasis, she lifts her legs and wraps them both around your [pc.hips], keeping you from withdrawing too far. You feel her tunnel clench against your [pc.cock] as she does. <i>“Now, show me what else you can do.”</i>");

	output("\n\nYou do as she asks, and you thrust into her again and again, fighting against her leg-lock as you do. The rough foreplay had a stronger effect on her than you realized: her breathing quickens, her hot breath rinsing ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your scalp");
	output(" in just a few short minutes. Her grip on your hand becomes tighter, and she begins mouthing and gently moaning your name.");

	output("\n\nYou’re not as close as she is, but it’s not a race. Still, you could expedite things a little for your benefit, if you wanted.");

	//[=Anvil Position=][=Kiss Her Neck=]
	// end scene (scene: SSVM)
	processTime(5);
	pc.lust(10);
	args.push("SSVM");
	clearMenu();
	addButton(0,"Anvil Pos.",SSVAP,args);
	addButton(1,"KissHerNeck",SSVKHN,args);
}

//[=Caress=]
// (scene: SSVCa)
public function SSVCa(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Who could turn down an invite like that? Maintaining your composure and focusing to keep your pace, you reach up, palming Paige’s breasts, just as she asked you. <i>“That’s it,”</i> she praises, thrusting out her chest as she bounces. <i>“They’re just for you, [pc.name]. Show them you love them.”</i>");
	output("\n\nYou feel her nipples, hard as stone, dig into your palms as you flex your fingers and clamp into the meat of her chest – but only hard enough to keep your grip. When you lift and heft them, Paige sighs and lifts her nose towards the ceiling. When you press them together, she coos and uses her forearms to squeeze them even closer. <i>“You’re being very gentle this time,”</i> she notes. <i>“That’s perfect. Take your time. Appreciate it all....”</i>");
	output("\n\nPaige’s breath begins catching in her throat and her bouncing becomes elongated and sloppy. Close and borderline desperate, she lifts her own hands, grabbing yours and keeping them on her chest. She bites into her lower lip and she hisses, <i>“[pc.name]....”</i> You feel the fur of her chest and her thighs begin to stand on end as her body prepares for the finale.");
	output("\n\nSeeing strong, proud Paige reduced to a sexy Ausar puddle on top of you just from playing with her boobs gets you a lot closer too. Your caressing stops in favor of simply hanging on as your hips pump and pound, feeding your length into her, and you feel the familiar release bubbling just beneath the surface.");
	output("\n\n<i>“I’m almost...!”</i> Paige exclaims. You thrust harder and faster, eager to take you both to the end at once.");

	//[=Climax=]
	// end scene (scene: SSVCa); go to (scene: SSVE1)
	processTime(5);
	pc.lust(10);
	args.push("SSVCa");
	clearMenu();
	addButton(0,"Next",SSVE1,args);
}

//[=Manhandle=]
// (scene: SSVMH)
public function SSVMH(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Don’t mind if you do! You cease Paige’s booby bouncing by bracing them in your grip, palming and groping the fat of her tits in your lunging, greedy hands. They easily fill them both with just a little bit of overflow between your digits, and they’re firm as could be. Her rock-hard nipples pierce into your palms as you rotate your wrists, flexing and hefting her chest.");
	output("\n\n<i>“Oh my, greedy [pc.boyGirl]!”</i> Paige exclaims, but makes no effort to stop you. <i>“That’s alright, [pc.name], get a good, thick handful. They’re all for you, sweet thing.”</i> You release one to tweak and pinch at her nipple, pulling and pressing at it, yanking on it as you thrust wantonly into Paige’s tight tunnel. <i>“The girls haven’t had this kind of attention in years!”</i>");
	output("\n\nPaige reaches up to grab you by the wrists, and pulls your already-busy hands harder against her chest. She takes one, heavy draw of air through her nose as she directs your hands to fondle her the way she wants. With every new rotation, her boobs flexing and taking all your aggressive love with ease, and she bounces on your [pc.cock] with just a little more fervor.");
	output("\n\n<i>“Little more, sweet thing,”</i> she whispers huskily, her pitch high and her breath shallow. Her bouncing becomes aimless and sloppy, but that just makes it hotter, knowing that she’s nearly ready to cum. Your dick throbs in excitement, your own release broiling just beneath the surface. <i>“A little more...!”</i>");

	//[=Climax=]
	// end scene (scene: SSVMH); go to (scene: SSVE2)
	processTime(5);
	pc.lust(10);
	args.push("SSVMH");
	clearMenu();
	addButton(0,"Next",SSVE2,args);
}

//[=Chew=]
// (scene: SSVCh)
public function SSVCh(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You sit up with Paige, your face flush with her mounds. You kind of like the new, active direction the sex has gone, and it emboldens you to try something a little riskier. You wrap your arms around her body, keeping her close, then open wide and latch onto a tit – teeth included.");
	output("\n\nYou don’t bite, of course; you’re careful to not be forceful enough to damage the goods, but you’re just intense enough. The sharp electric sensation causes Paige to jolt upright, breathing sharply through her nose. <i>“That’s a new one,”</i> she says. You release your jaw, but not your [pc.lips], then clamp down again, your tongue slathering across her nipple each time.");
	output("\n\n<i>“Little gentler,”</i> she instructs, and you comply. <i>“Too gentle,”</i> she admonishes, and you comply. It’s a difficult balance! <i>“Now the other one.”</i> You release her boob and move to the other, biting into it. You catch a glimpse of the damage you’ve done to her first: enough to indent her fur and irritate the skin, but not enough to leave a mark.");
	output("\n\n<i>“Little harder!”</i> she shouts – which you’d love to do, but her increased bouncing and excitement is making it difficult to strike that balance. Paige’s breathing has increased and her pitch is rising, and, although you can hear her wince when you chew just a little too hard, she’s not telling you to stop. <i>“Fuck, I’m nearly there!”</i> she shouts.");
	output("\n\nThat’s sign enough to stop chewing on her and focus on your fucking. You grip hard onto her glutes and start pounding harder into her, your own release surging beneath your [pc.cock]. With Paige’s taste still in your mouth, you only need a few more thrusts, and then....");

	//[=Climax=]
	// end scene (scene: SSVCh); go to (scene: SSVE2)
	processTime(5);
	pc.lust(10);
	args.push("SSVCh");
	clearMenu();
	addButton(0,"Next",SSVE2,args);
}

//[=Lick n’ Suck=]
// (scene: SSVLnS)
public function SSVLnS(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You sit up with Paige, your face flush with her mounds. If she likes initiative, you’ve got a few ideas for those sweet, grope-able, suck-able tits of hers. You wrap your arms around her torso, locking them just above the small of her back to keep her in place, then open wide, latching your mouth onto her left nipple.");
	output("\n\nYour ministrations are gentle, but fervent and frequent: you swipe the flat of your [pc.tongue] over her stubby nub in time with your every thrust and you move your lips, sucking on her spongy flesh, making a loud ‘pop’ every time you release. <i>“Goodness,”</i> Paige says breathlessly, her hands on your skull to guide you. <i>“Don’t leave her sister jealous now, [pc.name].”</i>");
	output("\n\nAs you release her nipple and move to the other, you slide one hand down, gripping onto her ass while the other climbs up, across her strong back and onto her shoulder. <i>“You’re a good lover,”</i> she says suddenly – making your pride (and your [pc.cock]) swell. <i>“You use everything to pay attention to everything. You know when to be gentle and when not to.”</i> Her bouncing slowly becomes greedy and misaligned the more you do to earn her praise. <i>“And you know how to make a girl cum. A big plus in today’s universe.”</i>");
	output("\n\nYou rotate your head, pursing your [pc.lips] on her swollen point, but your own thrusting is getting aimless as your climax is just around the corner. You keep your head on her chest and your mouth on her tit, but you don’t do much else, focusing on breathing and keeping up the intense pounding into her tight Ausar cunt. Paige moans your name a few more times, each time higher-pitched than the last, until you feel her squeeze and milk you, which is just enough for you to....");
	//[=Climax=]
	// end scene (scene: SSVLnS); go to (scene: SSVE3)
	processTime(5);
	pc.lust(10);
	args.push("SSVLnS");
	clearMenu();
	addButton(0,"Next",SSVE3,args);
}

//[=Rougher=]
// (scene: SSVR)
public function SSVR(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("It simply won’t do to have Paige still boss you around in the sack when she’s supposed to be the bottom this time. You’ll just have to teach her that there are certain ways to act in certain positions.");
	output("\n\nYou give her tits one last squeeze before you lean back, keeping your [pc.hips] to hers so that you don’t slip out. Then, with one hand, you press down on her shoulders, keeping her face buried in the pillow, and with the other, you reach to her ass, then up to the base of her tail – and you grip it tightly, giving it a yank.");
	output("\n\nWith every thrust in, you pull on her tail to force her back onto you. Paige tries to say something, but the fabric of her pillow is completely obstructing her, and the most you understand is whenever she moans out in lust from your ‘assertiveness.’ You fuck her with all the strength your muscles have, sending ripples from the meat of her butt all the way to your grip on her shoulders.");
	output("\n\nPaige lies mostly still, but uses whatever movement she can to meet your bucking with her own. Your [pc.cock] hilts to the [pc.knot], pounding your full length into her");
	if(pc.balls > 0) output(", your [pc.sack] slapping against her raised thighs");
	output(" with every thrust – it’s having an effect on Paige as her Ausar twat grips you tighter, her own juices leaking down your [pc.legs] and her incoherent whining grows higher in pitch.");
	output("\n\nIt’s hard to maintain control over everything – your weight on Paige without hurting her and your steady grip on her tail – while your orgasm is so close, so you don’t try. You relax slightly and focus instead on just fucking your bitch until you seed her. You give both you and Paige a workout yoga could never hope to match, and then, with one final push, you mark Paige for yourself.");

	//[=Climax=]
	// end scene (scene: SSVR); go to (scene: SSVE5)
	processTime(5);
	pc.lust(10);
	args.push("SSVR");
	clearMenu();
	addButton(0,"Next",SSVE5,args);
}

//[=Gentler=]
// (scene: SSVG)
public function SSVG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You shake your head; Paige trying to remain dominant beneath you is just you trying to justify more power plays. You’re the top and you have her face down beneath you – how much more do you need to prove yourself this time?");
	output("\n\nYou relax on top of her, nuzzling your nose into the crease of her neck as you fondle her boobs, maintaining your pace as you spear into her. <i>“That’s right, alpha,”</i> she coos, raising her rump and lowering her chest, giving all of her to all of you. <i>“Fuck your conquest the way you like. She’s all yours.”</i>");
	output("\n\nYour [pc.cock] pumps and inflates with her submissive words (even if the tone doesn’t quite match). You feel her clench tighter with every pound, her tunnel refusing to let you go even as her liquid gushes around your prick");
	if(pc.balls > 0) output(" and across your [pc.sack], wetting the slaps they make against her thighs");
	output(".");
	output("\n\nYou push your nose deeper against her neck and give the skin you find there a long, languid lick. Paige shudders beneath you as your tongue traces up to just behind her pointed Ausar ear. <i>“If you want a good taste,”</i> she says, her breath shallow, <i>“there’s plenty other things that taste better. Next time.”</i> The idea turns her on, and you feel her clench beneath you as she takes deep huffing breaths through her nose.");
	output("\n\nIn response to her body’s incoming orgasm, you feel your own push and bubble just beneath your [pc.base], ready to give your horny Ausar lover what she needs and what she deserves. You squeeze her boobs a bit harder than you mean to as you thrust one last time....");

	//[=Climax=]
	// end scene (scene: SSVG); go to (scene: SSVE4)
	processTime(5);
	pc.lust(10);
	args.push("SSVG");
	clearMenu();
	addButton(0,"Next",SSVE4,args);
}

//[=Kiss Her Neck=]
// (scene: SSVKHN)
public function SSVKHN(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("The destination is less important than the journey, and you’re the type to make the journey as important an experience as possible for your partner. Paige is already very close, so you lean in to seal the deal: you bury your face into the cleft of her neck and inhale through your nose, imprinting her scent on you, as you gently kiss, lick, and nip at the skin you find there.");
	output("\n\n<i>“Gods,”</i> Paige says, giggling in delirious lust, her legs tightening around you and her hips vaulting off the bed to match your pumps. <i>“Give you a bit of power and you turn into the</i> perfect <i>gentle" + pc.mf("","wo") + "man, huh, [pc.name]?”</i> Her hands explore your back, hugging to tightly to her as she moans your name through a bit lower lip. <i>“Just a little more, baby, just a little more....”</i>");
	output("\n\nHer tunnel clenches onto you; every pass, in or out, is practically an ordeal as you fight her grip to maintain your pace. Her juices coat your [pc.cock]");
	if(pc.balls > 0) output(" and splash out against your [pc.sack], as high as your [pc.base]");
	output(", encouraging you to finish with her. Your hips grow more frenzied as you feel the familiar tightening in your prostate and the chill up your dick.");
	output("\n\nYou don’t stop your gentle kissing, not until the last moment. Your left hand snakes down her quivering, pre-orgasmic body until it comes to her tight, squeezing rump, which you grip and lift for more thrusting power. That’s enough for Paige: she grunts out once, long and high-pitched, and that’s enough for you, too.");

	//[=Climax=]
	// end scene (scene: SSVKHN); go to (scene: SSVE4)
	processTime(5);
	pc.lust(10);
	args.push("SSVKHN");
	clearMenu();
	addButton(0,"Next",SSVE4,args);
}

//[=Anvil Position=]
// (scene: SSVAP)
public function SSVAP(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("While you’re not exactly in a hurry to finish, you <i>do</i> have an idea to make things a little more... extreme. A little more power behind your hips might make for a more intense climax for you both.");
	output("\n\nYou withdraw, just enough to reach behind Paige’s legs and lift them both up and over your shoulders, and you lean forward. Paige is surprisingly compliant and willing, waiting to see ‘what else you can do.’ With her body bent in half and her cunt basically out in the open, you have a much easier angle to really pound her into the mattress.");
	output("\n\n<i>“That’s it, sweet thing,”</i> she encourages – she’s not out of breath or even strained. This position must be peanuts to some of her yoga exercises. <i>“Pound me raw!”</i> You do as she demands, using your new leverage and gravity to drive your [pc.cock] deeper into her than you could before");
	if(pc.balls > 0) output(". Your [pc.sack] slaps wetly against her flank with every downward bounce, churning the cum in them and readying themselves for the final push");
	output(".");

	output("\n\nYour hands are still interlocked, and she reminds you by gripping tightly as her orgasm approaches. <i>“Nearly there, [pc.name],”</i> she says huskily, her eyes (almost) on yours. <i>“Cum in me, stud. Plough me!”</i> Her whole body shakes and rocks in pre-orgasmic bliss and you feel her tunnel try and suck you deeper into herself with every inward press. Her pussy drools all over your shaft, thirsty for your load – and you’re not going to disappoint her.");

	//[=Climax=]
	// end scene (scene: SSVAP); go to (scene: SSVE3)
	processTime(5);
	pc.lust(10);
	args.push("SSVAP");
	clearMenu();
	addButton(0,"Next",SSVE3,args);
}

// (scene: SSVE1)
public function SSVE1(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige breathes deep and exhales through her nose, moaning through a closed mouth as her body shudders and ripples; her tunnel clamps on you and milks you wantonly, urging out your cum for her, to give her as much as you can. Her grip on your wrists becomes almost painful, unable to control herself as she cums and cums.");
	output("\n\nRight on time, you join her, ");
	if(pc.cumQ() < 300) 
	{
		output("giving her exactly what she wants. Your ");
		if(pc.balls > 0) output("[pc.balls] tense and squeeze as your ");
		output("[pc.cum] blasts from your throbbing dick, washing and mixing with her own feminine cum as you offload into her. You hold still, then pump with each new shot, causing Paige to moan and chew into her bottom lip. <i>“It’s warm,”</i> she says, clenching her abs as each new volley makes its way inside her.");
	}
	//if (pc.cumQuantity >= 300)
	else
	{
		output("giving her a bit more than she bargained for. Your ");
		if(pc.balls > 0) output("[pc.balls] shuck into your body as they shoot their immense deposit, and your ");
		output("[pc.cock] bloats with your [pc.cum], dousing Paige’s tunnel. She hums appreciatively as she feels it all pool inside her; she relaxes her grip on one wrist so she can pat her tummy as it struggles to keep it all in her. <i>“Feeling a bit pent up, sweet thing?”</i> she asks, your cock spurting all the while. <i>“You should see me more often, then. I’ll help you out...”</i>.");
	}
	output("\n\nIt all ends after another few moments of helpless squirming through your individual orgasms, and then the afterglow sets in. Once Paige stops, she releases your cramped wrists and falls forward, her face to yours. Panting and satisfied, she wraps both her arms around your shoulders and plants a lingering kiss on your lips – with a little bit (but not a lot) of tongue.");

	processTime(10);
	pc.orgasm();
	clearMenu();
	//[=Afterglow=]
	// end scene (scene: SSVE1); go to (scene: SSVAG)
	args.push("SSVE1");
	clearMenu();
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSVAG,args);
}

// (scene: SSVE2)
public function SSVE2(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("<i>“Fuck!”</i> Paige yelps, and she cums, her body shaking with the intensity of her orgasm as you pound her, just moments away from your own. She winces through clenched teeth, and you feel her juices douse your [pc.cock] and coat your pelvis with her incessant bouncing. <i>“H-Hurry up!”</i> she demands, desperate to feel you cum inside her.");
	output("\n\nWith just another thrust or two, your release comes bundling up your dick and into her waiting and thirsty tunnel. ");
	if(pc.cumQ() < 300)
	{
		output("Your [pc.cum] coats and lines the velvet walls of her cunt, shooting just a little deeper with every progressive wad. <i>“That’s it, that’s it!”</i> she shouts, her legs tightening around you in pleasure every time she feels a new one. Paige keeps bouncing on you, squeezing out every last drop she can");
		if(pc.balls > 0) output(", even after you thought your [pc.balls] had been milked for their every drop");
		output(".");
	}
	else 
	{
		output("Paige’s breath catches in her mouth as she feels you fill her with just a few pumps, and she grins, knowing that it’s only the beginning. <i>“Give me all of it!”</i> she encourages, bouncing aimlessly on you as you blow load after load into her. She puts one hand on her belly, massaging it, clenching her fingers with every new bunch inside her. <i>“Give me every last drop");
		if(pc.balls > 0) output(" those big-ass balls of");
		output(" you");
		if(pc.balls > 0) output("rs");
		output(" have!”</i>");
	}
	output("\n\nNot wanting to disappoint her, you give her everything you’ve got, humping against her errantly as your orgasm peters off. Once you’re bone dry and once Paige’s muscles can’t handle any more, she slumps forward, her chest to yours and yours faces against each other. <i>“Damn, that’s good,”</i> Paige says, as much to you as to herself, and sighs dreamily as the afterglow sets into her.");
	processTime(10);
	pc.orgasm();
	//[=Afterglow=]
	// end scene (scene: SSVE2); go to (scene: SSVAG)
	args.push("SSVE2");
	clearMenu();
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSVAG,args);
}

// (scene: SSVE3)
public function SSVE3(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige takes a deep, sharp breath through her open mouth, and you suddenly feel her Ausar pussy clench onto your shaft, rippling from your base to your tip. <i>“I’m, uhh,”</i> she groans out senselessly, then gives up on forming a sentence. She lets her body do the talking for her, and her body is begging you to give it your cum. Who are you to turn her down?");
	output("\n\nYour [pc.cock] bloats as your [pc.cum] launches into her, ");
	if(pc.cumQ() < 300)
	{
		output("crawling deep into her body");
		//if {SSVAP}
		if(InCollection("SSVAP", args)) output(" and having an easy time of it with your higher position");
		output(". Paige licks her lips as her belly crunches, feeling every blast getting drank and absorbed by her thirsty body. <i>“Keep it coming,”</i> she begs, her voice fluttering through her own orgasm");
	}
	else
	{
		output("taking Paige by surprise by your sheer quantity. Your seed fills her to stuffing in just a few quick loads");
		//if {SSVAP}
		if(InCollection("SSVAP", args)) output(", and it has nowhere to go but down");
		//if {SSVLnS}
		else if(InCollection("SSVLnS", args)) output(", then it overfills her, splashing back out and onto your crotch");
		output(". <i>“I can take it,”</i> she says huskily");
		//if {SSVLnS}
		if(InCollection("SSVLnS", args)) output(", possibly oblivious to the mess you’re both making");
		output(". <i>“Give me all you got, [pc.name]! Cum in your Ausar!”</i>");
	}
	output("\n\nYou both ride it out: you doing as she commands and giving her your every last drop, and her body coaxing them all out. Your individual orgasms last moments longer; when you’re dry and she’s spent, you both collapse back onto her bed");
	//if {SSVAP}
	if(InCollection("SSVAP", args)) output(" – you gently push to one side, laying side-by-side next to Paige");
	//if {SSVLnS}
	if(InCollection("SSVLnS", args)) output(" – her on top of you, her heavy chest heaving against yours");
	output(", face-to-face.");

	output("\n\nPanting, Paige ends the journey with a kiss on your lips. It’s more passionate than it is sexy, but there’s just a little bit of tongue.");

	//[=Afterglow=]
	// end scene (scene: SSVE3); go to (scene: SSVAG)
	processTime(10);
	pc.orgasm();
	args.push("SSVE3");
	clearMenu();
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSVAG,args);
}

// (scene: SSVE4)
public function SSVE4(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Her breath comes out in shudders, and you feel her neck tighten as she tries to maintain her pace with you. Her primeval need to cum overtakes any control she thought she had over herself, and she squeezes your dick greedily as you feel her juices splash and coat over it, soaking you back to your crotch");
	if(pc.balls > 0) output(" and across the taut skin of your [pc.sack]");
	output(".");
	output("\n\nYou don’t need much more coaxing, and with another thrust, ");
	if(pc.cumQ() < 300) 
	{
		output("you squirt your own [pc.cum] deep into Paige’s waiting womb, ready to douse the fiery need in there. She ");
		//if {SSVG}
		if(InCollection("SSVG", args)) output("moans into her pillow");
		//if {SSVKHN}
		if(InCollection("SSVKHN", args)) output("coos out your name and strokes your upper back");
		output(" as the warmth of your load blooms inside her, reaching up and deep into her belly. ");
		//if {SSVG}
		if(InCollection("SSVG", args)) output("Paige’s hands grip onto the sheets of her bed helplessly and she humps her ass back into you with every spurt, eager for your every drop.");
		//if {SSVKHN}
		if(InCollection("SSVKHN", args)) output("<i>“Goodness,”</i> she sighs dreamily, lifting her hips with every spurt. <i>“Gimme all you got, sweet thing. Yessssss.”</i>");
	}
	//if (pc.cumQuantity >= 300)
	else
	{
		output("your [pc.cum] comes gushing from your prick, cramming Paige full of your seed in just a few short bursts, and you’ve got a whole lot more where that came from. Paige ");
		//if {SSVG}
		if(InCollection("SSVG", args)) output("gasps and chokes on her own breath slightly, unable to form a coherent thought or sound");
		//if {SSVKHN}
		if(InCollection("SSVKHN", args)) output("holds her breath and clenches her fingers on your back");
		output(" as she feels her womb fill and her normally-tight belly bulge from your volume. ");
		//if {SSVG}
		if(InCollection("SSVG", args)) output("Despite her surprise and her difficulty breathing through the fabric of her pillow, she raises her ass higher and presses against you more eagerly, to drink every drop, despite being so full already that it begins to spill from her and splash back onto you.");
		//if {SSVKHN}
		if(InCollection("SSVKHN", args)) 
		{
			output("Her legs clench and tighten against her hips, locking you in place as she instinctively yearns to keep every drop inside her. <i>“I had no idea you were so pent up,”</i> she says through shuddering, lusty breaths. <i>“You should come to me more often. I’ll make sure");
			if(pc.balls > 1) output(" those heavy nuts of");
			output(" you");
			if(pc.balls > 1) output("rs");
			output(" never get this backed up again.”</i>");
		}
	}
	output("\n\nYou thrust impiously with every pulse of your [pc.cock] as you unload into her, until your hips cramp and your dick grows oversensitive from the stimulation. The last of your load dribbles from your [pc.cockHead] into her honeypot, and you both collapse, spent. Before you have a chance to un-cross your eyes, Paige has her face, and her lips, against yours – the kiss is quick, but passionate, and with a little bit of tongue.");

	//[=Afterglow=]
	// end scene (scene: SSVE4); go to (scene: SSVAG)
	processTime(10);
	pc.orgasm();
	args.push("SSVE4");
	clearMenu();
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSVAG,args);
}

// (scene: SSVE5)
public function SSVE5(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige struggles momentarily, her fingers clenching at the bed and her body quivering beneath you as she cums from a combination of your domination and the rough fucking you’re giving her. With what little leverage her arms have, she uses the last of her strength to buck against you, begging with her pussy for you to join her in orgasm. The only noise she makes is a long, weak squeal, muffled through her pillowcase.");
	output("\n\nYou acquiesce; Paige has taken to the role of the bottom well, and it wouldn’t be right to not reward her. You thrust twice more, burying yourself to your [pc.base]");
	if(pc.cumQ() < 300) 
	{
		output(", and then the orgasm you’ve been vying for rocks up, through your cock and into your bitch. Your hand tugs on her tail a little harder than you meant, and your grip tightens as you feel her ripple and squeeze, drinking your [pc.cum] eagerly and massaging you for more. You thrust in time with your pulses, sowing her deeply; each push no less enthusiastic even as you");
		if(pc.balls > 1) output("r [pc.balls] become less dense and your loads");
		output(" get drier and drier.");
	}
	else
	{
		output(" so that your prodigious quantity has nowhere to go but deep inside your bitch, soaking her womb and rounding her tight tummy with your [pc.cum]. Paige is helpless to resist or even vocalize, but from the way her cunt grips you and the way her body shudders again and again beneath you, she’s loving every thick wad of cum she feels spread inside her. You never stop your thrusting through the whole thing, even as your cum bursts from her tunnel and soaks back against you. Your frenzied breeding of your Ausar underling slows only with your orgasm, until you");
		if(pc.balls > 0) output(" and your once-dense [pc.balls]");
		output(" are completely dried.");
	}
	output("\n\nWhen it ends and you have nothing more to give, you release your grip on her tail and your weight on her shoulders. You fall to the side, out of breath but feeling nonetheless powerful and, for lack of a better word, masculine. Paige, for a moment, is content to maintain her position, face in the pillow and ass in the air, until, groggily, she twists her body to face yours, eye-to-eye and lips-to-lips in a soft, slow, sensual kiss with her alpha.");

	//[=Afterglow=]
	// end scene (scene: SSVE5); go to (scene: SSVAG)
	processTime(10);
	pc.orgasm();
	args.push("SSVE5");
	clearMenu();
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSVAG,args);
}

// (scene: SSVAG)
public function SSVAG(args:Array):void
{
	clearOutput();
	showPaige(true);

	//if {not SSVE5}
	if(!InCollection("SSVE5", args)) output("<i>“You are just a treasure, aren’t you, [pc.name]?”</i> she asks.");
	//if {SSVE5}
	else output("<i>“Stars, but being the bottom is fun sometimes,”</i> she pants exhaustively.");
	//if {SSVE1}
	if(InCollection("SSVE1", args)) output(" <i>“A perfect, attentive lover. Gentle and pliant. God, I could see myself fucking you for years.”</i> You laugh: it’s hardly the most romantic way for Paige to admit her feelings, but you leave it to her not wanting to admit them yet. She laughs too, knowing exactly what she said.");
	//if {SSVE2, SSVE3 or SSVE4}
	if(InCollection("SSVE2", args) || InCollection("SSVE3", args) || InCollection("SSVE4", args))
	{
		output(" You know exactly when to take an opportunity when you see one.");
		//if {SSVCh}
		if(InCollection("SSVCh", args)) output(" <i>“The girls are going to feel that in the morning – but they wouldn’t mind feeling it a whole lot more.”</i> You grin exaggeratingly, showing off your teeth and give them a quick gloss with your tongue. <i>“Not too rough, and just rough enough,”</i> she says, rubbing her tit with her free hand where you bit her. <i>“You have some really impressive control.”</i>");
		//if {SSVAP}
		if(InCollection("SSVAP", args)) output(" <i>“I liked what you did at the end, too. Don’t be afraid to twist me around,”</i> she winks. <i>“All those years doing yoga, a weird position like that isn’t going to hurt me at all.”</i> Her hand reaches out to yours, interlocking your fingers again. <i>“If you’re the top, you do</i> whatever <i>you want. I’m all yours, sweet thing.”</i>");
		//if {SSVG}
		if(InCollection("SSVG", args)) output(" <i>“And I love the way you know when not to press too hard. Once you got me ass up, you turned into such a gentle" + pc.mf("","wo") + "man – I’d never been so dominated by someone so gentle. It was the whole package.”</i> She smiles lazily, her eyes drooping. <i>“Fuck,”</i> she whispers, her hand caressing her belly, <i>“thinking about it is making me horny for it all over again.”</i>");
		//if {SSVMH, SSVLnS, or SSVKHN}
		if(InCollection("SSVMH", args) || InCollection("SSVLnS", args) || InCollection("SSVKHN", args)) output(" <i>“Gentle and loving, but when there’s a chance to strike, you’re all over me like a rabid wolf.”</i> She grins predatorily, and her hand reaches over to you, trailing down your side and resting on your [pc.hip]. <i>“I like a lover that knows when to take what [pc.heShe] wants. And there’s gonna be more where that came from, sweet thing.”</i>");
	}
	//if {SSVE5}
	if(InCollection("SSVE5", args)) output(" <i>“You’re not often that rabid, or domineering, or... </i>forceful<i>,”</i> she says huskily. <i>“Once you got on top, there was no stopping you. I think we’ll need to explore this side of you more often.”</i> Her hand snakes out, raking the claws on her fingers across your [pc.skinFurScales] lustily. <i>“After seven years of not getting laid, I completely forgot how good it is to get fucked raw. I’d ask you to do it again if I didn’t know I’m already going to walk funny tomorrow.”</i>");
	output("\n\n<i>“You got someplace you need to be?”</i> she asks suddenly, and you answer negatively. <i>“Good. Let’s just stay like this for a little while longer.”</i> Sounds like a plan to you: you two stay together in that position, long after your [pc.cock] softens and slips out of her");
	if(pc.cumQ() >= 300) output(", spilling yet more seed that Paige couldn’t contain onto yourself");
	output("; you gently tease each other and whisper a bunch of nothings as the time passes.");

	output("\n\nEventually, rested and satiated, you both grow restless, and Paige lets you get up and out of her bed. <i>“I enjoyed that,”</i> she tells you. <i>“All of it. The sex and the cuddling. Let’s do it again sometime, [pc.name].”</i> You tell her that it’s a promise.");
	output("\n\nA short while later, you’ve got your gear back on you, and, energized, you leave Paige’s unit and ready to tackle your next adventure.");

	// end scene (scene: SSVAG); reduce Lust to 0; advance clock by two hours; place PC one square outside Paige’s Unit
	processTime(120);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Anal=]
// Requires a penis that has an area of 50 or less.
// Tooltip (No penis): You need a penis to have sex with Paige this way!
// Tooltip (Penis is too large): You need a smaller penis to take the back door. You don’t want to hurt her!
// Tooltip (Yes penis): Knowing Paige, she’ll probably let you do this. Couldn’t hurt to try!
// Action tree: http://i.imgur.com/GqjxQnn.png
// (scene: SSAI)

public function SSAI():void
{
	clearOutput();
	showPaige(true);
	IncrementFlag("SEXED_PAIGE");
	IncrementFlag("PAIGE_ANAL");
	var args:Array = [];
	output("You grind your [pc.cock] up between Paige’s cheeks as she humps and teases you. You gently snake your hands up her thighs until they come to a rest on her pert, tight asscheeks, gripping them in your fingers and pulling them apart to make room for your dick");
	if(pc.cockTotal() >= 2) output(". [pc.EachCock] sit between your bodies, sandwiched between your lower belly and her sopping cunt, purple with blood and the heavy pressure above them");
	output(".");

	output("\n\nShe moans wordlessly as you tease each other. You wait for just a moment, and then shift your [pc.hips], aligning your [pc.cockHead] with her asshole. ");
	//if {First time}
	if(flags["PAIGE_ANAL"] == 1)
	{
		output("Paige tenses and gets goosebumps, taken by surprise by the sudden plying");
	}
	else output("Paige shudders, but doesn’t skip a beat and keeps teasing you");
	output(". ");
	//if {First time, and PC has seen FTFHB1}
	if(flags["PAIGE_ANAL"] == 1 && flags["PAIGE_FTFHB1"]!= undefined) output("You remind Paige that she was willing to try something a little more adventurous, and ask her if she’s okay with giving it a try");
	//if {First time}
	else if(flags["PAIGE_ANAL"] == 1) 
	{
		output("You ask Paige if she’s feeling a little adventurous today. You’ll only go as far as she lets you");
		
	}
	//if {Not first time}
	else output("You ask Paige if she’s up for some more butt stuff. She was pretty into it last time");
	output(".");

	output("\n\nPaige hums in thought as she bounces on you. She leans forward and, with some exaggeration, draws your dick, from [pc.base] to tip, all through the cleft of her cheeks. Her bottom lip is bit in concentration – you realize that she’s measuring you with her ass! <i>“");
	//if {First time, and PC has seen FTFHB1}
	if(flags["PAIGE_ANAL"] == 1 && flags["PAIGE_FTFHB1"]!= undefined) output("I did say that, didn’t I?”</i> she reminisces. <i>“This is a bit... more than a finger, though. I trust you, [pc.name]. Let’s give it a shot");
	//if {First time}
	else if(flags["PAIGE_ANAL"] == 1) output("I’ve never done it up the ass,”</i> she admits. <i>“But my life has been full of firsts since you came into it. I’ll give it a try – with you");
	//if {Not first time}
	else output("I dunno if I’m just a slut for butt stuff or if I’m a slut for you,”</i> she says sultrily, licking her lips, <i>“but if you want another round, I’m all for it, sweet thing");
	output(".”</i>");

	output("\n\nThat’s all you need to hear. You frig your prick between her globes another few times, your pre-cum beading down and slicking your shaft and her taint in preparation. You’re so close, a quick thrust would be all you need – but are you in that sort of rush? You could take things a little easier, if you’d rather.");

	args.push("SSAI");
	//[=Gently=][=Raw=][=Prep=]
	// end scene (scene: SSAI)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Gently",SSAG,args);
	addButton(1,"Raw",SSAR,args);
	addButton(2,"Rim",SSAP1,args);
}

//[=Prep=]
// Tooltip: This scene involves rimming and will lead into the <i>“Gently”</i> path.
// (scene: SSAP1)
public function SSAP1(args:Array):void
{
	args.push("SSAP1");
	clearOutput();
	showPaige(true);
	output("<i>“We’re in no rush,”</i> you tell Paige, your [pc.cockHead] straining against her, begging to differ. <i>“Why don’t we get each other ready?”</i>");
	if(flags["PAIGE_RIMMING"] == undefined) flags["PAIGE_RIMMING"] = 1;
	//if {PC has only ever seen SSAP1}
	if(flags["PAIGE_RIMMING"] == 1) 
	{
		output("\n\nPaige squints her eyes in your (general) direction, trying to get a read on your tone. <i>“You’re suggesting you eat my ass, right?”</i> she asks incredulously. You hum affirmatively. Paige clicks her tongue as she thinks about it. <i>“");
		//if {First time anal}
		if(flags["PAIGE_ANAL"] == 1) output("Hell, I already said I’d let you fuck it. Let’s make tonight a night of firsts. Just remember – you offered");
		else output("Hell, why not? I’m already a big fan of having my ass played with. Let’s go for the whole package. Just remember – you offered");
		output(".”</i>");
	}
	//if {PC has only ever made it to SSAP2}
	else if(flags["PAIGE_RIMMING"] == 2) output("\n\nPaige smirks a bit as she considers it. <i>“Well, hell, any excuse to get your dick in my mouth, [pc.name],”</i> she says, <i>“But something about my ass must have been a good time if you’re willing to do</i> that <i>again.”</i> You make no comment. <i>“Alright then, perv, let’s get to it.”</i>");
	//if {PC has seen SSAP3}
	else output(" Paige smirks as she considers it. <i>“I guess we’ve both got our vices,”</i> she sighs. <i>“I’m a cum-thirsty whore and I like having things up my butt – and you like having your face in it. Hell, I’m not going to complain. You want another taste, sweet thing, you got it.”</i>");

	output("\n\nPaige, with excited swiftness, lifts one leg over your head as she pivots around and leans forward, your cock in her face and your face under her tail. Her soaking cunt and puffy vulva press into your collarbone, knowing that tonight isn’t about them – your eyes go north, to her dry, winking anus, the star of the show.");
	output("\n\nPaige wastes no time in stuffing your [pc.cock] into her mouth, lathering it with her wet tongue. You tense as you feel it wrap around your shaft, her thick Ausar tongue expertly covering everything in one pass, but she doesn’t stop, getting you nice and slick. It takes you a moment to remember that you should be doing the same, and you crane your head forward, sticking out your [pc.tongue] and giving her ass a long, lascivious lick.");
	output("\n\nYou feel her abdomen tense, then relax lazily as the sensations of having a tongue against her asshole cause her to melt in pleasure. You draw your tongue back in, soaking it in spit, then back out, getting her nice and lubed for your cock. Your nose brushes against the underside of her tail’s base with every upward swing, and, it being an erogenous zone, she moans in pleasure each time.");
	output("\n\nAfter a few minutes, you’re nice, hard, and wet, and her hole is about as lubed as you’re going to get it. You could stick around and make <i>absolutely</i> sure, though.");

	//[=Gently=][=Keep Prepping=]
	// end scene (scene: SSAP1)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Gently",SSAG,args);
	addButton(1,"Keep Going",SSAP2,args);
}

//[=Keep Prepping=]
// Tooltip: Better safe than sorry!
// (scene: SSAP2)
public function SSAP2(args:Array):void
{
	args.push("SSAP2");
	clearOutput();
	showPaige();
	if(flags["PAIGE_RIMMING"] == 1) flags["PAIGE_RIMMING"] = 2;
	output("You’re rather content where you are, you decide. Paige’s ass is one of her finer features, and she knows it, constantly showing it off and deliberately taking some lewder yoga poses that really highlights it. The idea of motorboating those tight cheeks and getting a good taste has crossed your mind once or twice.");
	output("\n\n<i>“Damn,”</i> Paige moans as she feels you press your face deeper into her cleft. <i>“Eager [pc.boyGirl]!”</i> She wiggles her butt, massaging your face with her tight ass as your tongue swipes across her hole and pierces into its clenching center now and again. <i>“You getting comfortable back there, [pc.name]? Don’t forget, that’s only the entrée before the main course.”</i>");
	output("\n\nYour hands reach up to grip onto her ass, letting your fingers clench into the sort fur and taut flesh, pulling them apart and pressing them together, squishing your nose and tongue as you work her over. Paige is back on your dick, making sure it’s as wet and ready as ever, although she’s trying to keep herself restrained: she’s committed to having you in her ass, and she doesn’t want you to cum beforehand.");
	output("\n\nYou barely notice her slowing down on you, you’re so focused on her ass. You hear her moan, and you just want to keep doing what you’re doing. <i>“");
	//if {PC has not seen SSAP3}
	if(flags["PAIGE_RIMMING"] != 3) output("I’m all for showing my ass some attention, [pc.name], but it’s not going to get any more ready for you,”</i> she chides playfully. <i>“Give your tongue a rest and let [pc.name] Junior take over");
	else output("I know for a fact you’re ready to go, [pc.name],”</i> she chides playfully, <i>“but, knowing you, you’re probably going to want to just keep going, right? I guess I can give you another minute");
	output(".”</i>");

	//[=Gently=][=Keep <i>“Prepping”</i>=]
	// end scene (scene: SSAP2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Gently",SSAG,args);
	addButton(1,"Keep Going",SSAP3,args);
}

//[=Keep <i>“Prepping”</i>=]
// Tooltip: Maybe just a little longer.
// Tooltip (Silly Mode, if possible): You just like eating ass, don’t you, [pc.name]?
// (scene: SSAP3)
public function SSAP3(args:Array):void
{
	args.push("SSAP3");
	clearOutput();
	showPaige(true);
	if(flags["PAIGE_RIMMING"] == 2) flags["PAIGE_RIMMING"] = 3;
	output("You unwaveringly proceed. Paige laughs, then disengages from your [pc.cock] entirely, letting it stand, hard, wet, and cooling in the air, as she squats on your face. <i>“Fine,”</i> she says, letting her full weight rest on your face. <i>“Get in there deep, [pc.name]. Show me how much you love my ass.”</i>");
	output("\n\nYou don’t register the words, but you obey them nonetheless: your dedication to lubing her progresses to you fucking her ass with your mouth. Paige hums in enjoyment at the attention, but she refuses to touch herself and keeps her arms up and over her head while she rides your face.");
	output("\n\nSomething about your position keeps you there: it might be how Paige’s body is the pinnacle of feminine fitness, and being where you are is like a reward of some kind; it might be the way you hear her moan as she sits on you making you feel powerful yourself, knowing that <i>you</i> are doing that to her and that <i>you</i> are giving her that pleasure; it might be that you just love the sheer subservience of having your tongue in someone else’s asshole, their cheeks framing your face so warmly and comfortably. Whatever the case, you lose yourself in your ‘job,’ licking her and thrusting into her absently–");
	output("\n\n<i>“Alright, that’s enough,”</i> Paige says, lifting her off your face and subjecting you to the sudden comparative chill of the room. <i>“Having a tongue in my butt is great and all, but I want a dick in there, [pc.name], and it won’t do to have either of us cum before we get there.”</i>");
	output("\n\nYou’re in something of a daze and you only catch half of what she says, but, when your eyes focus, you see her back in her position, her legs on either side of your [pc.hips] as she aligns your [pc.cockHead] with her thoroughly lubed anus. Her pussy is red and puffy with sheer desire; Paige is already on the verge of cumming a geyser and it must have taken a bit of willpower on her part to force you to stop.");

	//[=Gently=]
	// end scene (scene: SSAP3)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Gently",SSAG,args);
}

//[=Gently=]
// (scene: SSAG)
public function SSAG(args:Array):void
{
	args.push("SSAG");
	clearOutput();
	showPaige(true);
	//if {Coming from SSAP1 or SSAP2}
	if(InCollection("SSAP1", args) || InCollection("SSAP2", args)) output("That’s enough: you’re as hard as can be and slick with spit, and Paige’s tight asshole has been as moistened as you can make it. You tell her that you’re ready, and, legs quaking with excitement, she lifts her body off you and pivots back around, her legs straddling your body and your [pc.cockHead] aligned with her exit once more.");
	//if {Coming from SSAP3}
	else if(InCollection("SSAP3", args)) output("The sensation of Paige’s body heat against the head of your dick snaps you out of the dizzy reverie you built up from being face-deep in her booty. You’re reminded of exactly how hard and needy you are, and when your eyes uncross enough to make out the red gorging of her vulva, you learn exactly how needy she is too.");
	else output("You rock your lower body against hers a few more times, readying your [pc.cock], not that it needed more readying. The heat of her body excites you even further, and you finally your hips back, lining yourself up with her exit. You give her a teasing moment, wordlessly offering her the chance to back out, but her bit bottom lip and anxious smile are all the answer you need.");
	output("\n\nAlmost reflexively, you buck your [pc.hips] upward, spearing into her ass. You don’t go far – just the [pc.cockHead] – but you want to take things slowly and gently for her, to adjust to your size. Paige inhales sharply through her nose and exhales in a pleasant moan: all the sign you need to keep going.");
	if(pc.cLength(0) <= 9) 
	{
		output("\n\nAfter a tantalizing journey, Paige’s pert, tight asscheeks rest against your pelvis, with every bit of you stuffed inside her butt. Paige exhales in exhilaration, satisfied in a unique way, at the sensation of having every part of you");
		if(pc.cockTotal() >= 2) output(" (or, every part of <i>one</i> of you)");
		output(" inside her.");
	}
	//if (pc.cockLength >= 10)
	else 
	{
		output("\n\nPaige grunts in a weird mix of pleasure and frustration as you feel her butt clench tightly around your shaft, and you watch her ripped abs flex in effort. <i>“I think that’s about my limit,”</i> she says");
		//if (pc.cockLength = 10)
		if(pc.cLength(0) >= 10 && pc.cLength(0) < 11) output(", to your dismay – you’re so close! But you don’t push her. It’s her ass");
		output(". <i>“I’ll have to look into fixing that. I... I kind of want more,”</i> she laughs sheepishly.");
	}
	pc.cockChange();
	output("\n\nWith her boundaries defined, Paige leans backward, her hands on either side of your ankles, as she lifts up her butt until you’re barely still inside her, and then slams back down, as far as she can. ");
	//if {SSAP1 or SSAP2}
	if(InCollection("SSAP1", args) || InCollection("SSAP2", args)) output("The time you spent lubing each other up really comes into play, removing much of the friction of the act.");
	//if {SSAP3}
	else if(InCollection("SSAP3", args)) output("The combined spit on your dick and her ass makes the fucking a lubricated cinch, although somewhere in the back of your mind, you regret that it wasn’t easier.");
	output(" Paige’s puffy, needy honeypot bounces with the rest of her, right in front of you, and Paige is too busy keeping herself steady to pay attention to it. You could help her out, if you wanted....");

	processTime(5);
	pc.lust(10);
	//[=Finger Her=][=Do Nothing=]
	// end scene (scene: SSAG)
	clearMenu();
	addButton(0,"Finger Her",SSAFH1,args);
	addButton(1,"Do Nothing",SSADN1,args);
}

//[=Raw=]
// (scene: SSAR)
public function SSAR(args:Array):void
{
	args.push("SSAR");
	clearOutput();
	showPaige(true);
	if(flags["PAIGE_ANAL"] == 1) output("You’re a little overeager, you realize, but Paige is a tough girl, and, knowing her, she’d probably like i");
	else output("Paige knows exactly what she’s getting into with you, and, to be frank, she’s a bit of a butt-slut. Hell, she might even appreciate skipping the foreplay to get to the good stuff");
	output(". You thrust into her, burying more than a little bit of your [pc.cock] into her asshole");
	if(flags["PAIGE_ANAL"] != 1) output(", but not more than you know she’s comfortable with");
	output(".");

	output("\n\nPaige nearly shouts in surprise at your intrusion, and she goes stiff all over as she adjusts with you inside her. Before she gets too comfortable, you pull out slightly, only to thrust back in further than before. The only lube between you is your pre-cum, which is enough for you. ");
	//if {First time}
	if(flags["PAIGE_ANAL"] == 1) output("You keep your eyes on Paige’s expression, just in case you’re being too sudden, but she’s all mischievous-smiles. <i>“Guess I should have seen this coming,”</i> she laughs, and then starts matching your pace. <i>“Come on, then, [pc.name]. Let’s really break my ass in!”</i>");
	//if {Not first time}
	else output("You’re both grinning at the pleasure, and the unsaid contest between you and Paige to find her breaking point. Of course, you’re not anywhere near it. <i>“I love that you know when to take me hard, [pc.name],”</i> she says through gritted teeth. <i>“Give your slutty puppy what she wants!”</i>");

	output("\n\nYou do exactly what she asks, and lay into her, your [pc.hips] pumping up while hers hump down, squeezing your [pc.cock] into her bowels again and again. Paige’s abs and strong calves ripple and flex around your body as she takes you into her butt again and again; her breathing quickens in excitement as she feels every throb of your dick inside her. Her toes begin to splay and she even drools a little onto bouncing titties.");
	pc.cockChange();
	output("\n\n<i>“Hold on a second,”</i> Paige asks you, a flash on inspiration crossing her muzzle. She stops her bouncing on your lap – which stops your pleasure. You practically ache inside her, edging closer to your release, yet it’s still so far away. You’re sure Paige would understand if you didn’t stop like she asked, or you could see what’s on her mind.");

	//[=Wait=][=Pull Her Down=]
	// end scene (scene: SSAR)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Wait",SSAW,args);
	addButton(1,"PullHerDown",SSAPHD,args);
}

//[=Finger Her=]
// (scene: SSAFH1)
public function SSAFH1(args:Array):void
{
	args.push("SSAFH1");
	clearOutput();
	showPaige(true);
	output("Well, hell, it’s so inviting; it would be rude to turn it down when it asked so nicely.");
	output("\n\nYou reach forward, one hand playing and lightly clawing down her chiseled abs, and the other tickling along her left calf, as both hands make their way to her dripping cunt. Your left hand’s fingers find her vulva, pulling and squishing and playing with her lips between your fingers, while your right thumb finds her clit, pressing her button and flicking her switch.");
	output("\n\n<i>“Ah, fuck, right there,”</i> she says, throwing her head back and gripping onto the sheets of her bed in pleasure. <i>“Gods above but don’t you make the best of any situation, don’t you, [pc.name]? What did I ever do to deserve you?”</i> You respond to her compliments by playing with her bits some more, teasingly slipping a finger in and feeling how her body eagerly sucks you in, milking your digit.");
	output("\n\nNeither of you stop the real entertainment, naturally, but your extra attention pays off: with every sensitive nub you happen to brush against, her ass clenches down on you, providing that little extra warmth and friction for you to fuck into. You slip a second finger inside her, feeling her heartbeat all the way down to her pussy, and you time her beats with light brushes against her clit.");

	//[=Next=]
	// end scene (scene: SSAFH1); go to (scene: SSAFH2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAFH2,args);
}

//[=Do Nothing=]
// (scene: SSADN1)
public function SSADN1(args:Array):void
{
	args.push("SSADN1");
	clearOutput();
	showPaige(true);
	output("It’s a bit selfish of you, but in your defense, you’re a little preoccupied and splitting your focus would mean you wouldn’t do either as well as you could. You focus on plowing Paige’s ass, knowing that she’s clearly into it, and hoping that it would be enough.");
	output("\n\nShe bounces on your [pc.cock], breathing steadily and deeply through her nose. You match her rhythm, pulling out when she rises and feeling her body contort around you as you penetrate her when she falls. She controls the flow, and she’s taking it at a relaxed pace. <i>“You’re being awfully passive, [pc.name], considering your dick is in my ass,”</i> Paige chides playfully.");
	output("\n\nIn response, you double the pace for a few pumps, surprising her and lifting her with the force of your hips. The breath leaves her in surprise, and then she laughs. <i>“It wasn’t a challenge!”</i> she says, cooing at the friction. <i>“But hey, now that you’ve started, you may as well keep going.”</i>");
	output("\n\nThat’s an invitation if you’ve ever heard one. You grip onto Paige’s ankles, steadying yourself.");

	//[=Next=]
	// end scene (scene: SSADN1); go to (scene: SSADN2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSADN2,args);
}

//[=Wait=]
// (scene: SSAW)
public function SSAW(args:Array):void
{
	args.push("SSAW");
	clearOutput();
	showPaige(true);
	output("You do as Paige asks and stop your thrusting into her butt, difficult as it is – you’re anxious to keep going for your own pleasure, but if Paige has an idea, it’s probably a good one.");
	output("\n\nWith some skill, Paige lifts one leg over your body, your dick still firmly lodged inside her as she twists herself around. You bite your lower lip in concentration as the sensation of her whole body twisting and pulling at the skin of your shaft tickles nerves you didn’t know could be tickled that way. She pulls the other over you, and she’s spun around entirely.");
	output("\n\nSighing in delight, Paige leans into you");
	if(pc.biggestTitSize() <= 2) output(", her back flat against your [pc.chest]");
	//if (pc.biggestTitSize >= 3)if (pc.biggestTitSize <= 6)
	else if(pc.biggestTitSize() <= 6) output(", your [pc.chest] giving her something soft to lay into");
	else output(", squirming snuggly in the valley of your [pc.chest] until she’s good and nestled");
	output(". <i>“There we go,”</i> she says, reaching up and running her fingers through your [pc.hair] as she settles. <i>“This ought to give you more to play with.”</i>");

	output("\n\nBut, you complain, Paige doesn’t have any thrusting power – it means you also have to do all the work! <i>“Oh, I’m sorry,”</i> she rebukes. <i>“If fucking my ass is too much work for you, we can always stop.”</i>");
	output("\n\nYou both laugh and you both definitely don’t stop. But she <i>is</i> right: you have some more options for your roaming hands. But where do you focus? Decisions, decisions.");

	//[=Up Top=][=Down Low=]
	// end scene (scene: SSAW)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Up Top",SSAUT,args);
	addButton(1,"Down Low",SSADL,args);
}

//[=Pull Her Down=]
// (scene: SSAPHD)
public function SSAPHD(args:Array):void
{
	args.push("SSAPHD");
	clearOutput();
	showPaige(true);
	output("Fuck that, things were just getting good. You lean forward to grab her by the wrists, and you yank her forward, taking away her balance and toppling her onto you.");
	output("\n\n<i>“Oh!”</i> she exclaims, her breasts squishing against your [pc.chest]. You don’t stop your thrusting: if anything, you take advantage of Paige’s disorientation to fuck her harder, your hips audibly clapping against hers");
	if(pc.balls > 0) output(" and your [pc.balls] bouncing up to brush against the finer fur of her ass");
	output(". It takes a few more thrusts until Paige rights herself and catches her breath. <i>“Message received,”</i> she laughs. <i>“Let’s just fuck my ass, then, [pc.name]!”</i>");

	output("\n\nYou continue gladly, letting Paige lean on her elbows for her own comfort as you thrust into her and she backs into you. Paige’s breath comes out in billows between you, and her boobs press against you");
	if(pc.biggestTitSize() <= 1) output("r [pc.chest] warmly, cushioning you both with their firmness");
	else if(pc.biggestTitSize() <= 5) output("r [pc.chest], electrifying you both when your [pc.nipples] rub against each other in the heat");
	else output(" ineffectually: her firm tits do little more than flatten against your [pc.chest], easily dwarfed by your own");
	output(". Her body goes limper with every other thrust into her as she loses cognizance to your brutalizing her asshole.");

	output("\n\nShe’s fairly pliable in your hands as you ream her, and your hands are both free now that she’s fine with you doing what you’re doing to her. There are a few things you could think to do to her while she’s unfocused.");

	//[=Kiss Her=][=Finger Her=]
	// end scene (scene: SSAPHD)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Kiss Her",SSAKH,args);
	addButton(1,"Finger Her",SSAFH3,args);
}

//// (scene: SSAFH2)
public function SSAFH2(args:Array):void
{
	args.push("SSAFH2");
	clearOutput();
	showPaige(true);
	output("Paige rocks awkwardly on top of you, attempting to alternate between stuffing your [pc.cock] into her and attempting to snatch more of your hand into her. She accomplishes neither, but she clearly doesn’t care; her breathing gets shallow and her moans rise in pitch quickly. <i>“I’m getting close,”</i> she warns you, her head still thrown back. Her breasts heave with her shallow breath and her abs flex and then don’t un-flex. <i>“Damn, really close!”</i>");
	output("\n\nYour own focus is torn between fingering her so she gets there before you, and fucking her harder so that you reach your climax sooner. Paige, noticing your flagging focus, reaches forward and grips your wrist tightly, shoving your hand deeper into her cooch. <i>“Don’t you fucking slow down on me, [pc.name],”</i> she dares you. <i>“I’m... nearly there!”</i>");
	output("\n\nPaige fucks herself with your hand, taking the decision away from you and giving you a chance to focus on fucking her ass. With renewed vigor, you plow into her all the harder – and in no time at all, your orgasm is hot on your heels. The familiar bubbling in your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("loins");
	output(" rushes higher and higher up your [pc.cock] until, just as Paige cums, clenching your fingers and hard onto your dick, you can hardly contain yourself as you explode inside her.");

	//[=Climax=]
	// end scene (scene: SSAFH2); go to (scene: SSAE1)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAE1,args);
}

// (scene: SSADN2)
public function SSADN2(args:Array):void
{
	args.push("SSADN2");
	clearOutput();
	showPaige(true);
	output("Anchoring yourself to Paige’s bed, you lay into her with all the force and energy still in your pelvis to fuck your Ausar’s ass until her puffy twat you’ve neglected explodes all over you.");
	output("\n\nPaige loves it: her tight ring clenches around your impulsive shaft and doesn’t let up no matter how much you pound into it. She crunches her abdomen reflexively as you go, forcing more resistance onto you, but that’s all for the better for you both: the unique contours of her butt massage you in a way her pussy couldn’t, and you love it.");
	output("\n\nYou let Paige know you love it by fucking her harder. The sound of your hips clapping into hers");
	if(pc.balls > 0) output(", your [pc.sack] bouncing up with the rest of you");
	output(" fills the room, fighting with Paige’s lustful gasps and rising yips as she gets closer. <i>“Fuck me,”</i> she manages to stutter out between forceful pushes up. <i>“I’m close, [pc.name], fuck my ass! Fuck it like you own it! You</i> own <i>it, [pc.name]!”</i>");
	output("\n\nHer shouts and exaltations are what she needs to go the last little way, and with a few more pumps into her, she’s cumming on top of you. Her body stiffens and spasms involuntarily, sending quakes down your shaft and into your loins; her orgasm is what you need, and soon, you’re cumming right after her.");
	//[=Climax=]
	// end scene (scene: SSADN2); go to (scene: SSAE2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAE2,args);
}

//[=Up Top=]
// (scene: SSAUT)
public function SSAUT(args:Array):void
{
	args.push("SSAUT");
	clearOutput();
	showPaige(true);
	output("The horny Ausar is practically <i>begging</i> you to fondle her boobs, and really, who are you to turn down an invitation like that? Nobody in their right mind would pass up the chance to grab a handful of those tight yoga tits.");
	output("\n\nThirsty, your hands strike at her chest, gripping at each boob suddenly and a little rougher than you meant. Her pointed nipples, practically sharp, dig into your palms as you squish and knead her flesh, unsynchronized from your abject fucking into her butt. <i>“Good [pc.boyGirl],”</i> Paige sighs, one hand firmly on your skull and the other on yours, guiding it along the erogenous spots of her titflesh. <i>“The girls just</i> love <i>getting some attention. Pinch my nipples a bit, sweet thing.”</i>");
	output("\n\nYou do as she command, pinching both nipples and pulling on them just a little. She winces through clenched teeth and you feel her sphincter tighten around your [pc.cock]. <i>“That’s good, just like that!”</i> she shouts, and you continue to handle her nipples the way she likes. <i>“Gods, having my tits handled gets me close. Cum with me, [pc.name]! Cum in my ass! Fill me up!”</i>");
	output("\n\nPaige combats your every thrust by slamming her rump back down onto you as best she can, lodging you as deeply into her as she can take with every push");
	if(pc.cLength(0)) output(", and ‘as deeply’ keeps getting redefined");
	output(". With one last bounce, she stops entirely, her body stiffens, her breath leaves her, and her ass grips you almost painfully tightly.");

	output("\n\nWhich is good, because you’re on the verge of an orgasm yourself.");

	processTime(5);
	pc.lust(10);

	//[=Climax=]
	// end scene (scene: SSAUT); go to (scene: SSAE3)
	clearMenu();
	addButton(0,"Next",SSAE3,args);
}

//[=Down Low=]
// (scene: SSADL)
public function SSADL(args:Array):void
{
	args.push("SSADL");
	clearOutput();
	showPaige(true);
	output("If there’s any part of Paige that desperately needs some attention right now, it’s her neglected cooch, even if it isn’t the focus of the show.");
	output("\n\nYou keep one hand rested on her belly, admiring and playing with the ridges of her toned six-pack abs, while the other travels farther down, gliding seamlessly over her vagina, your middle finger easing itself between the lips of her vulva. You palm gently yet insistently against her clit, swishing it up and down with every other pass. Your hand is <i>soaked</i> the moment you complete one full pass.");
	output("\n\n<i>“Shit!”</i> Paige whispers sharply, her grip on your skull tightening and her biceps bulging in barely-restrained pleasure. Her belly, along with the rest of her, rocks in time to your palming her pussy, which is in time with your thrusting into her butt. You change your attack by thrusting your middle finger up and in, crooking it against her tight vaginal walls, and using your thumb to continue passively assaulting her button. <i>“Shit!”</i> she mouths again.");
	output("\n\nKnowing that you’ve robbed Paige of the coherence to say much else draws your orgasm all the closer. You latch your lips to her neck, sucking on the taut skin and fur there, and then draw your [pc.tongue] up along her neck and up to the back of her triangular ear.");
	output("\n\nThat’s enough for her, and she squeals through pursed lips as her tunnel clamps on your finger and her sphincter seals itself damn-near airtight on your [pc.cock]. The paltry fluids on your palm before is nothing compared to the veritable waterfall gushing from her now. With so many fluids of hers on you, it would be rude to not give some back.");
	//[=Climax=]
	// end scene (scene: SSADL); go to (scene: SSAE2)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAE2,args);
}

//[=Kiss Her=]
// (scene: SSAKH)
public function SSAKH(args:Array):void
{
	args.push("SSAKH");
	clearOutput();
	showPaige(true);
	output("You keep one hand on the meat of her ass to keep her steady (and also to grab a handful. Who wouldn’t?), and you use the other to gently cup the underside of Paige’s muzzle to direct her eyes to yours. Once they ");
	if(paigeBlind()) output("(generally)");
	output(" meet and lock, you lean forward, aggressively putting your lips to hers and, forgoing the foreplay, stick your tongue out.");
	output("\n\nShe has enough sense to reciprocate, opening her mouth and allowing you in, although she’s fairly lazy about it. Your [pc.tongue] plays and dances with her long-and-flat Ausar tongue, tasting each other’s nuances and counting the teeth in each other’s jaws. You slow your fucking her ass slightly, your attention divided, though you hardly stop.");
	output("\n\nWhile your mouth is busy, the hand on her ass crawls its fingers into the cleft of her cheeks, tickling at the rim of her asshole as it gets reamed again and again. Paige hardly notices; her eyes are closed deliriously and her tongue is moving in broad, sweeping strokes with your own. Her mind’s taken a back-seat, overloaded with the sensations in both ends of her body.");
	output("\n\nYou can’t tell how close she is, but you know you’re just a few pumps away. You give Paige a shock to her system by releasing her asscheek and grabbing the base of her tail, your fingers scratching along its underside. You know it’s a particularly vulnerable erogenous zone, and it does what you hoped: Paige’s body stiffens and she squeals into your mouth, while her ass grips you tighter and she soaks your crotch in her feminine cum.");
	output("\n\nAnd not a moment too soon....");
	//[=Climax=]
	// end scene (scene: SSAKH); go to (scene: SSAE3)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAE3,args);
}

//[=Finger Her=]
// (scene: SSAFH3)
public function SSAFH3(args:Array):void
{
	args.push("SSAFH3");
	clearOutput();
	showPaige(true);
	output("If there’s any one thing that will probably snap her back to reality, and it’s <i>not</i> a dick in the ass, it’s a finger up the cooch");
	if(pc.hasVagina()) output(", speaking from experience");
	output(".");

	output("\n\nIt’s a bit tricky to worm your hand in between your rocking, humping bodies, but you get it in there with every outward thrust of your hips, getting it closer and closer until you find your hot and sopping wet prize. You wait until your hips are apart, and then you strike, crooking a finger and letting Paige land right on it, spearing into her suddenly.");
	output("\n\n<i>“Whoa!”</i> Paige says, eyes wide and unfocused. Your palm does not stay with her on your ‘backswing,’ and instead acts as a peg to impale Paige with every other swing in. She breaths in through her nose and it comes out as a stiff hiss; her clit bounces hard against your upturned palm with every thrust, sending shivers up her body");
	if(pc.cockTotal() >= 2) 
	{
		output(". You realize that using just your finger is a bit ineffectual when you <i>could</i> just use");
		if(pc.cockTotal() == 2) output(" your [pc.cock 1]");
		else output(" another one of [pc.eachCock]");
		output(", but that would mean pulling out and shuffling your equipment around, and that’s a lot of hassle considering you’re about to burst right now");
		output(".");
	}
	output("\n\n<i>“Fuck me,”</i> Paige whispers, more as a statement than a demand or request. She humps against your hand whenever it and her pussy meet, sliding up and down on both your digit and your member, squeezing as much pleasure out of both as she can. <i>“Nearly there,”</i> she warns you, and in response, you clamp your hand against her, thrusting your ring finger inside her cooch as well. <i>“A whole lot closer now!”</i> she hollers, before stiffening.");
	output("\n\nA gush of womanly cum drenches your hand as your fingers splay inside her. You’re about to reciprocate with a gush of your own fluids....");
	//[=Climax=]
	// end scene (scene: SSAFH3); go to (scene: SSAE4)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSAE4,args);
}

// (scene: SSAE1)
public function SSAE1(args:Array):void
{
	args.push("SSAE1");
	clearOutput();
	showPaige(true);
	output("Paige draws in one, long hiss of air, and then goes silent on top of you. Her body is hardly still: her lower abdomen convulses in pleasure, the muscles of her abdominals crunching from her lower belly to her jiggling breasts. Her pussy gushes flow after flow of her girl jizz all over your hand and across your own [pc.belly]; and her ass becomes almost painfully tight, clenching you involuntarily in its ring.");
	output("\n\nKnowing that Paige is having an orgasm on top, and because, of you, triggers something primeval in your head, and you join her, ");
	if(pc.cumQ() < 300)
	{
		output("painting her insides with your [pc.cum]. Y");
		if(pc.balls > 0) output("our [pc.sack] tenses in time with your jets, coiling up against your taint with every shot of cum, and y");
		output("our shaft flexes in time with your shots, blood coursing through its bloated veins, depositing every little bit you have into your Ausar lover. <i>“Fuck,”</i> Paige manages to gasp out, composing herself just enough. <i>“I can feel it, [pc.name],”</i> she whispers. <i>“I can feel every drop in me. I want it all, [pc.name]. Give me all you have.”</i>");
	}
	else 
	{
		output("blasting your [pc.cum] into her body. Your impressive load pools within her, y");
		if(pc.balls > 0) output("our [pc.balls] flexing like pumps to deposit every drop they have into your fleshy, furry condom. Y");
		output("our ");
		if(pc.balls > 0) output("struggling shaft fights to");
		else output("shaft struggling to");
		output(" get your jizz out and into your Ausar, but it can barely flex wide enough to accommodate your load while Paige’s sphincter strangles it. <i>“Holy shit,”</i> Paige gasps out, cognizant enough to run her mouth. <i>“It... I can feel it. I can feel all of your cum, [pc.name].”</i> She tries to remain still, yet the telltale convulsions around your fingers make it difficult for her. <i>“I want it all... I want it all inside me. Don’t stop. Don’t stop!”</i>");
	}
	output("\n\nKnowing how thirsty Paige is spurs you on to give her all you can. You shoot every drop into her ass, just like she asked you. She occasionally rocks her hips and gyrates on top of you, coaxing out everything she can");
	if(pc.cumQ() < 300) output(", even after your orgasm peters to nothing");
	else output(", even after her belly begins to paunch from the load she’s already taken");
	output(". Your hand starts to turn purple from how hard she’s squeezing it against her cooch, but neither of you notice.");

	processTime(5);
	paige.loadInAss(pc);
	pc.orgasm();
	//[=Afterglow=]
	// end scene (scene: SSAE1); go to (scene: SSAAG)
	clearMenu();
	addButton(0,"Next",SSAAG,args);
}

// (scene: SSAE2)
public function SSAE2(args:Array):void
{
	args.push("SSAE2");
	clearOutput();
	showPaige(true);
	output("You’re assaulted by a number of sensations, from Paige squirting all over the place to her toned ass clenching so tightly that you find it too difficult to thrust into her anymore. She doesn’t have the cognizance (or the breath) to say anything: her explosive orgasm is her only means to communicate with you.");
	output("\n\nYou reply to her message with an orgasm of your own: ");
	if(pc.cumQ() < 300)
	{
		output("you press in as deeply as you can before shooting, your [pc.cock] bloating as much as it can and firing your [pc.cum] as deeply into her bowels as you can reach. Paige’s body is rigid, but you can feel her flex and tense with your every load. <i>“You,”</i> she finds the strength to gasp out, <i>“you’re cumming in my ass... I can feel it, [pc.name]. It feels so warm.”</i> She whimpers and tries to writhe on you, to suck out more cum from y");
		if(pc.balls > 0) output("our [pc.balls]");
		else output("ou");
		output(". <i>“Give me more....”</i>");
	}
	else
	{
		output("with one final thrust, you lodge yourself as deeply into her body as you can, and you unleash the torrent that is your [pc.cum]. The breath leaves Paige’s lungs in coughs timed with your waves; her yoga-trained glutes become water-tight and don’t allow a single drop of you to escape her, and in no time at all, you watch as her belly begins to bloat and misshape from your quantity");
		if(pc.balls > 0) output(", and yet, from the mildly-unsatisfied tingling in your [pc.balls], you know you have so much more to give her");
		output(". <i>“I love it,”</i> she says meekly, unable to control her still-spasming, still-squirting quim.");
	}
	output("\n\nYou");
	//if {SSADL}
	if(InCollection("SSADL", args)) output("r hand and most of the bed");
	output(" are completely soaked and drenched in Paige’s cum – you’re going to smell like a bitch Ausar in heat for a while yet. And yet Paige’s orgasm soldiers on: her honeypot’s run dry of fluids to squirt, but her convulsions continue, growing weaker as time goes on but lasting far longer than yours");
	if(pc.cumQ() >= 300) output(", despite your immense load");
	if(pc.hasVagina()) output(". It honestly makes you a little jealous");
	output(".");
	processTime(5);
	paige.loadInAss(pc);
	pc.orgasm();

	//[=Afterglow=]
	// end scene (scene: SSAE2); go to (scene: SSAAG)
	clearMenu();
	addButton(0,"Next",SSAAG,args);
}

// (scene: SSAE3)
public function SSAE3(args:Array):void
{
	args.push("SSAE3");
	clearOutput();
	showPaige(true);
	//if {SSAUT}
	if(InCollection("SSAUT", args)) output("Paige awkwardly shifts her body, thrusting her chest into your hands and pressing her butt onto your crotch");
	//if {SSAKH}
	else output("Paige’s tongue lies still in your mouth, yet her tail sways stiffly with your every scratch at her zone");
	output(" while she shamelessly cums and cums again from having her ass fucked and owned. She makes no attempt to move, lacking the strength as the convulsions from her pussy control her every other muscle, other than to shift her ass from side to side just enough to try and lodge you deeper into her.");

	output("\n\nHer orgasm is, in a way, her congratulations to you for fucking her practically senseless, and with the burst of pride at a good job comes a burst of something else: ");
	if (pc.cumQ() < 300) 
	{
		output("with one final pump to dig yourself as deeply inside her as you can, you shoot your [pc.cum] into her; you feel the individual bursts rise from your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("loins");
		output(" and make their way up her bowels. Paige takes your load like the champion she is, exhaling with every new wave of liquid heat she feels crawl up her abdomen. ");
		//if {SSAUT}
		if(InCollection("SSAUT", args)) output("<i>“It’s so deep,”</i> she whispers, rocking her hips on yours to get it even deeper. <i>“I can feel it go so deep inside me, [pc.name].”</i> She laughs. <i>“I feel it rising... I wonder how deep it’ll go?”</i>");
		//if {SSAKH}
		else output("Paige’s tongue flops around in your mouth in time with every new sensation in her ass, moaning in delirious pleasure as she feels your warm cum rise higher and higher into her abdomen.");
	}
	//if (pc.cumQuantity >= 300)
	else
	{
		output("you cum just as you thrust one final time, getting a headstart for your massive load. In one long, drawn-out burst, you’ve cum more than the average [pc.race], and there’s oh-so-much more to go: Paige’s body bloats around your payload and already you feel it start to backwash against your [pc.cock], but the almost superhuman tightness of her anus keeps it all watertight. ");
		//if {SSAUT}
		if(InCollection("SSAUT", args)) 
		{
			output("<i>“Oh wow,”</i> Paige says, almost whimsically");
			if(pc.balls > 0) output(", and she gasps out with every new pulse in your [pc.balls] and a new load in her bowels");
			output(". <i>“It’s so deep... It’s so warm....”</i> Her hand gently grips at your head as she tries to control her body. <i>“Keep filling me. I want it deeper....”</i>");
		}
		//if {SSAKH}
		else output("Paige goes completely slack on your body and in your mouth, humming insensately as she feels your cum pool deeper inside her body. You keep kissing her, doing all the tongue-wrestling for the both of you, but she’s clearly just along for the ride as her ass absorbs the sensation of having so much cum inside it.");
	}
	output("\n\n");
	//if {SSAUT}
	if(InCollection("SSAUT", args)) output("You don’t ignore Paige’s breasts in your hand, working them expertly");
	//if {SSAKH}
	else output("Your bodies are still and lame");
	output(" as you both ride out your orgasms. As Paige had asked of you, you fill her with as much as you can offer,");
	if(pc.cumQ() < 300) output(" and yet the thirsty bitch keeps rubbing her rump on you to try and eke out just a little more");
	else output(" and you’re not even sure she regrets it even after her belly loses its definition and rounds out like a balloon");
	output(". ");
	//if {SSAKH}
	if(InCollection("SSAKH", args)) output("She finally disengages her mouth from yours, laying her head on your collarbone");
	//if {SSAUT}
	if(InCollection("SSAUT", args)) output("She finally relaxes her back, gently coming to rest on your [pc.chest]");
	output(", and you both begin to wind down from your intense anal session.");

	processTime(5);
	paige.loadInAss(pc);
	pc.orgasm();

	//[=Afterglow=]
	// end scene (scene: SSAE3); to go (scene: SSAAG)
	clearMenu();
	addButton(0,"Next",SSAAG,args);
}

// (scene: SSAE4)
public function SSAE4(args:Array):void
{
	args.push("SSAE4");
	clearOutput();
	showPaige(true);
	output("There are alternating waves of convulsions between Paige’s cooch and her asshole: the former wants to milk your intrusive fingers for whatever cum they can spare (which isn’t a lot, it turns out) while her ass doesn’t naturally ‘milk’ you for anything but nonetheless attempts to clench even tighter around you, strangling your [pc.cock] for its load.");

	output("\n\nDespite your Ausar bitch’s tightness and adamant musculature, your load can’t be denied, ");
	if(pc.cumQ() < 300) 
	{
		output("and your [pc.cum] rockets up and through your shaft, into the tight confines of her rectum. You jill her further, clenching your own fingers involuntarily with every spurt of hot cum, rubbing the butt of her palm a little roughly against her clit, but all the sensations serve to heighten her orgasm. <i>“I want every fucking drop,”</i> she tells you through clenched teeth. Y");
		if(pc.balls > 0) output("our [pc.balls] are more than happy to comply, and y");
		output("our shaft bloats rhythmically with every gooey wad you loose into her. <i>“It’s so warm, [pc.name].”</i> The puddle of girlcum on your [pc.belly] grows with your every spurt. <i>“I want it all.”</i>");
	}
	//if (pc.cumQuantity >= 300)
	else
	{
		output("bloating your vas deferens as it erupts from you, fighting against the pinch of her anus to deposit your gargantuan load. Your [pc.cock], and also her asshole, relax after the first wad, but then the second comes, shooting a heftier wad than most terrans could hope to match in a whole week. You jill her off, thrusting into her in time with your own shots, but you needn’t waste the effort: orgasm after orgasm wracks Paige with every hot bubble she feels deposit in her innards. <i>“Holy shit, [pc.name],”</i> she says breathlessly, unable to process the explosive squirting from herself and the pandemonium happing in her ass. <i>“Give me every drop you have, you assfucker!”</i> she demands");
		if(pc.balls > 0) output(", unaware just how much more your [pc.balls] have left to give");
		output(". <i>“Fuck my ass!”</i>");
	}
	output("\n\nBy the time you’re both done, Paige’s ass is stuffed with cream");
	if(pc.cumQ() >= 300) output(" to spare");
	output(", and your [pc.belly] is soaked up to the chest in horny Ausar girl-jizz. Your hand begins to cramp from the awkward angle it’s been in, and you go through the effort of peeling your [pc.skinFurScales] from between you. You’re both out of breath and exhausted, but settle into bed beyond satisfied with each other.");

	//[=Afterglow=]
	// end scene (scene: SSAE4); go to (scene: SSAAG)
	processTime(5);
	paige.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",SSAAG,args);
}

// (scene: SSAAG)
public function SSAAG(args:Array):void
{
	args.push("SSAAG");
	clearOutput();
	showPaige(true);
	output("You lay together, out of breath and winding down, waiting for your [pc.cock] to deflate enough to slide out of Paige’s ass. ");
	//if {SSAE1 or SSAE4}
	if(InCollection("SSAE1", args) || InCollection("SSAE4", args)) output("You’re soaked from your stomach to your lower chest in Paige’s cum");
	//if {SSAUT}
	else if(InCollection("SSAUT", args)) output("You can feel Paige’s heart beating through the flesh and fur of her breasts");
	//if {SSAKH}
	else if(InCollection("SSAKH", args)) output("She’s still on top of you, her breasts pressed to your [pc.chest] and her breath washing against your neck in stutters");
	else output("You’re both well-worn and exhausted from one of your more exciting trysts");
	output(", proof of your satisfaction with one-another. You already know this probably isn’t a one-time thing, that is if you don’t want it to be.");
	output("\n\n<i>“Goddamn,”</i> Paige whispers finally, her strength returning to her. <i>“");
	//if {First time}
	if(flags["PAIGE_ANAL"] == 1) output("I’ve never had anything up my ass before, [pc.name].”</i> She giggles. <i>“And I can already tell you, if every time is going to feel that... exotic, it won’t be the last either.");
	else output("It’s almost like every time I shove you up my ass is a brand new experience, [pc.name],”</i> she giggles. <i>“I’m glad the one to bring out my inner butt-slut was you.");
	//if {SSAP1 or SSAP2}
	if(InCollection("SSAP1", args) || InCollection("SSAP2", args)) output(" You don’t have to eat my ass out every time, too,”</i> she says, giggling again, <i>“but, fair warning, I won’t say no if you offer again.");
	//if {SSAP3}
	else if(InCollection("SSAP3", args)) output(" And I doubt that’ll be the last time you’ll be shoving your face up there too,”</i> she mocks, giggling again. <i>“I don’t blame you, though. It’s a pretty perfect ass.");
	output("”</i>");

	output("\n\nPaige shifts herself on your lap, feeling your still-turgid-but-softening [pc.cock] shift inside her. <i>“");
	//if (pc.cumQuantity <= 299)
	if(pc.cumQ() < 300) output("Mmm, Gods above, but that feels so</i> different<i>,”</i> she says, one hand trailing down to her tummy. <i>“I could feel you cum inside me, but it felt different from in my cooch. I liked it! I dunno if I liked it</i> more <i>than in my cooch, but I liked it");
	else 
	{
		output("Mmmmmm, you just cum like a firehose, don’t you, [pc.name]?”</i> she slurs, rubbing her mildly-bloated tummy. <i>“It felt like you weren’t going to stop. I could feel it all the way up my stomach. I feel so warm... I hope this doesn’t hurt my figure too much.");
		//if {SSAP3}
		if(InCollection("SSAP3", args)) output(" Do you always cum that much? Is eating asses your secret, [pc.name]?");
	}
	output("”</i>");
	
	output("\n\nEventually, she stops talking – or you pass out, you’re not certain which one happens first. Either way, when you’re sensate again, you’re soft as could be and you’ve long-since fallen out of Paige’s ass");
	if(pc.cumQ() >= 300) output(", along with the excess seed lodged in Paige’s belly");
	output(". You arduously pull each other apart, despite Paige’s half-hearted attempts to get you rowdy for a round two; ");
	//if {SSAE1 or SSAE4}
	if(InCollection("SSAE1", args) || InCollection("SSAE4", args)) output("you still stink of her girl-cum and bits of her fur stick to your [pc.skinFurScales], and ");
	output("as much as you think you might");
	//if {SSAP3}
	if(InCollection("SSAP3", args)) output(" (like she said, it’s a pretty perfect ass)");
	output(", you two have other things you need to do today.");
	output("\n\n<i>“Hey,”</i> she says, <i>“all joking aside, I enjoyed that. You probably don’t get told that often from all the people I’m sure you’ve drilled in the butt,”</i> she laughs. <i>“It won’t take much to convince me to try it again, if it’s with you.”</i> You tell her that, hell, if she’s down, you’re down.");
	output("\n\nA short while later, you’ve got your gear back on you, and, energized, you leave Paige’s unit and ready to tackle your next adventure.");
	// end scene (scene: SSAAG); reduce Lust to 0; advance clock by two hours; place PC one square outside Paige’s Unit
	processTime(120);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Tribadism=]
// Requires a vagina and a LACK of a penis, or no endowments at all; grey out for men and herms
// Tooltip (PC has a penis but no vagina): Vaginas only – no penises allowed!
// Tooltip (PC has a vagina and a penis): You can’t do this if you have a penis! Why not just use it instead?
// Tooltip (PC has a vagina only): Fuck Paige the way only another woman can.
// Tooltip (PC is an ironing board): You can still do this even if you have no vagina, although it probably won’t be as fulfilling for you.
// Action tree: http://i.imgur.com/xoYddfh.png

// (scene: SSTI)
public function SSTI():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	output("The way Paige’s sweet, wet cunt presses against yours in her hedonistic fervor drives a tingling sensation up your spine and alights all the pleasure centers in your head. Instinctively, you rise your [pc.hips] against hers, eager for more; you were in the mood before, but now you’re straight-up horny, and you doubt Paige is any different.");
	output("\n\n<i>“Sorry, sweet thing,”</i> Paige says suddenly, <i>“but I’ve never been one for toys with my partners. I’ve always preferred fuckin’ them myself. I love knowing that it’s me and not some piece of rubber or plastic making them cum.”</i>");
	output("\n\nYou grin at Paige. <i>“You sure you think you’re enough for me?”</i> you ask deviously.");
	output("\n\nShe laughs. <i>“It wasn’t a challenge, [pc.name], but if that’s how you wanna fuck, we can make it a challenge.”</i>");
	output("\n\nYou’re humping against each other greedily, her pussy on you");
	if(pc.hasVagina()) output("rs");
	output(". You could make it a little spicier, if you want, or you could put aside the one-upmanship and get right to it.");

	IncrementFlag("SEXED_PAIGE");
	processTime(5);
	pc.lust(10);

	args.push("SSTI");
	//[=Use Thigh=][=Use Fingers=]
	// end scene (scene: SSTI)
	clearMenu();
	if(pc.isNaga()) addButton(0,"Hip Thrust",SSTUT,args,"Hip Thrust","It’s not about who can fuck whom any ‘better;’ just get down to it and start humping, already!")
	else addButton(0,"Use Thigh",SSTUT,args,"Use Thigh","It’s not about who can fuck whom any ‘better;’ just get down to it and start humping, already!");
	addButton(1,"Use Fingers",SSTUF,args,"Use Fingers","What better way to assert yourself by shoving your fingers up Paige’s cooch? Of course, she’ll probably accept your challenge....");
}

//[=Use Thigh=]
// Tooltip: It’s not about who can fuck whom any ‘better;’ just get down to it and start humping, already!
// If PC is a naga, change this button to [=Hip Thrust=]
// (scene: SSTUT)

public function SSTUT(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You take advantage of Paige straddling your body – ");
	if(!pc.isNaga()) output("specifically, your thigh");
	else 
	{
		output("specifically, your upper tail, just south of you");
		if(pc.hasVagina()) output("r wet treasure");
		else output("r pelvis");
	}
	output(" – by rocking it up and grinding the meat of your ");
	if(!pc.isNaga()) output("upper leg");
	else output("[pc.skinFurScales]");
	output(" against her thirsty tunnel. <i>“Just fuck me, you hot bitch,”</i> you growl, clapping your hands against her own legs, gripping the toned muscles you find there.");

	output("\n\n<i>“That’s what I thought,”</i> Paige growls back. Her hands press against your [pc.chest] lightly as she tenses her abdominals, reciprocating your motions similarly, grinding her leg against you");
	if(pc.hasVagina()) output("r [pc.vagina]");
	output(". You bite your lip, feeling the fine fur of your fit furry lover abuse you");
	if(pc.hasVagina()) output("r puffy vulva");
	output(", especially when she leans forward enough to bump against your ");
	if(pc.hasVagina()) output("stiff button");
	else output("lower belly");
	//if (pc.vaginas = 2)
	if(pc.totalVaginas() == 2) output(". She doesn’t notice, or maybe she doesn’t care, about your additional cunt, but whether she does or not, you’re getting all the tactile sensations you need from her rocking");
	output(".");

	output("\n\nPaige’s breath comes out in needy shudders as she humps you: her eyes cross and her eyelids droop as she loses herself, forgetting about you momentarily as she focuses on the rising burn between her legs. As pleasurable as it is, you know that humping Paige’s leg like a dog (appropriately enough as it is) would only serve to make you hornier. You slap one hand on Paige’s thigh again, the reverberating sound of flesh-on-tight-fur echoing off the walls of Paige’s unit.");

	output("\n\nIt snaps her awake, just like you hoped. <i>“Getting impatient?”</i> she chides. She separates herself from you, leaving you wet and needy in the stuffy air as she realigns herself, straddling your [pc.hips] properly, her crotch pressing directly against your [pc.belly].");
	if(pc.hasVagina()) output(" With a glide backward, you’d be lips-to-lips.");
	output("\n\nAn idea pops into your head: if you act quickly enough, you could change positions by rolling you both over, putting you on top and in charge. Paige <i>is</i> moving a little slowly, after all....");

	processTime(5);
	pc.lust(10);
	args.push("SSTUT");
	//[=Leg Lock=][=Roll Over=]
	// end scene (scene: SSTUT)
	clearMenu();
	if(pc.isNaga()) addButton(0,"Coil",SSTLL,args,"Coil","");
	else addButton(0,"Leg Lock",SSTLL,args,"Leg Lock","");
	addButton(1,"Roll Over",SSTRO,args,"Roll Over","");
}

//[=Use Fingers=]
// Tooltip: What better way to assert yourself by shoving your fingers up Paige’s cooch? Of course, she’ll probably accept your challenge....
// (scene: SSTUF)
public function SSTUF(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("<i>“Consider it a challenge,”</i> you tell her, and you punctuate your statement by reaching forward, thrusting two digits of your right hand between the [pc.skinFurScales] of your [pc.leg] and into Paige’s tunnel, crooking them once they’re inside.");
	output("\n\nPaige shudders in pleasure, but she doesn’t lose her composure. <i>“Oh, it’s on, you sexy bitch,”</i> she croons, and she reciprocates, leaning back just enough to give her fingers some room to respond in kind. You feel her furry fingers ");
	if(pc.hasVagina()) output("spear into you: they wriggle and massage you, encouraging your every drop of feminine fluids to pool on her hand. She also splays them occasionally, making them feel bigger than they are.");
	else output("on you: they pat and massage at your crotch, looking for something to play with, but find nothing. That doesn’t stop her from mimicking your actions, and you nonetheless feel a pleasant tingling between your legs as she works you.");

	output("\n\nShe goes further, reaching up your body and finding your [pc.chest], ");
	if(pc.biggestTitSize() <= 2) output("squeezing a mound in her tight grip, pulling harshly at your flesh, squishing and pressing against the [pc.nipple] there");
	else if(pc.biggestTitSize() <= 5) output("getting a good handful of boob to pull and play with as she assaults your sex, letting your [pc.nipple] press into her palm");
	else output("intent on assaulting your boobs with her deft, strong hands, but the amount of boob she finds is simply too much; she can barely get a solid grip on you, and even has trouble simply teasing your [pc.nipple] instead");
	output(". But the finger-fucking and the breast-play only serves to make her hornier, and she growls in frustration. <i>“Gonna need more than some fingers, [pc.name],”</i> she says lowly.");

	output("\n\nPaige leans back and shuffles her hips forward, drawing her slick and gushing cunt upward until it connects with your");
	if(pc.hasVagina()) output("s");
	else output(" [pc.crotch]");
	output(". The electric sensation of feeling another woman’s mons against you");
	if(pc.hasVagina()) output("rs");
	output(" causes your breath to catch, especially every time she slides north a bit and her button presses ");
	//if (pc.hasVagina = true)
	if(pc.hasVagina()) output("yours");
	else output("against a particularly sensitive part of your flesh");
	output(". Your muscles begin to flake, but you catch yourself before you fall under Paige’s control. There’s one of two ways you can make this <i>really</i> fun....");

	//[=Sit Up=][=Spank=]
	// end scene (scene: SSTUF)
	processTime(5);
	pc.lust(10);
	args.push("SSTUF");
	clearMenu();
	addButton(0,"Sit Up",SSTSU,args,"Sit Up","");
	addButton(1,"Spank",SSTS1,args,"Spank","");
}

//[=Leg Lock=]
// If PC is a naga, change this button to [=Coil=]
// (scene: SSTLL)
public function SSTLL(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige is moving exactly fast enough, but that doesn’t mean you can’t be a little more assertive. As the Ausar yoga master slides her body down, you ");
	if(!pc.isNaga()) output("lift your [pc.legs] up");
	else output("coil your [pc.leg] up");
	output(" and around her hips, just before her tail, locking her to you and making sure she can’t lift too far.");

	output("\n\nPaige hums in delight at your unspoken desire. <i>“Don’t you worry,”</i> she assures you, cooing as she teasingly lingers. <i>“We’ve only just started, [pc.name].”</i> And with that, she leans back, and your ");
	if(pc.hasVagina()) output("individual mons");
	else output("crotches");
	output(" brush and connect, but only for a moment – and then she languidly pulls forward, exaggerating her hips as she thrusts and presses you");
	if(pc.hasVagina()) output("r sexes");
	output(" together.");

	output("\n\nThe wet sliding of flesh on flesh");
	if(pc.hasVagina()) output(", button on button,");
	output(" has your eyes rolling in your head. You lose motor function in your hands, laying still on the bed as Paige has her way with you, yet your [pc.legs] maintain their grip, perhaps even moreso as your [pc.hips] involuntarily spasm in pleasure with every rock and pump of Paige’s body against yours.");

	output("\n\nShe is hardly any better, and she draws in her breath in heavy stutters with her every upward slide. Your crotches get wetter and stickier as time goes on; the scent of ");
	if(pc.hasVagina()) output("your mingling");
	else output("her");
	output(" juices floods the room and only makes you hornier yet. Unable to maintain her upward stance, Paige falls forward, ");
	if(pc.biggestTitSize() <= 5) output("her tits against your [pc.chest]");
	else output("leaning over your massive [pc.chest], her tits resting on top of yours");
	output(", eyes closed as she focuses on fucking you.");

	output("\n\nHer head rests on your shoulder, her chin bumping against your collarbone every time she thrusts her cunt upward against yours. She unintentionally offers her neck to you, too lost in her pleasure to consider it or anything but fucking you.");

	processTime(5);
	pc.lust(10);

	args.push("SSTLL");
	//[=Kiss It=][=Bite It=]
	// (scene: SSTLL)
	clearMenu();
	addButton(0,"Kiss It",SSTKI,args);
	addButton(1,"Bite It",SSTBI,args);
}

//[=Roll Over=]
// (scene: SSTRO)
public function SSTRO(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You’re horny and impatient, and Paige is going a little too leisurely for you. You raise your [pc.legs], wrapping ");
	if(!pc.isNaga()) output("them");
	else output("yourself");
	output(" around her waist and across the small of her back. <i>“Mmm,”</i> Paige hums, assuming the action to be a sort of acquiescence. <i>“Don’t you worry–”</i>");
	output("\n\nBefore she can get another word out, you grab her by the shoulders and jerk to your right, twisting you both over. You tumble over each other, Paige laughing delightedly at the sudden force, until you’re the one on top and she’s helplessly pinned beneath you. <i>“I won’t,”</i> you reply, <i>“but maybe you should.”</i>");
	output("\n\nShe giggles some more, wriggling in your grip, mostly for show. <i>“Welp! I guess I’m at your mercy, [pc.name],”</i> she says, laying her arms to her sides and spreading her own legs and mimicking your actions, lifting them and wrapping them around the small of your back to keep you in place");
	if(pc.tailCount > 0) output(". She uses the claws on her toes to tickle at your coccyx, causing your tail to stiffen");
	output(".");

	output("\n\n<i>“I’m all yours.”</i> True to her word, she doesn’t struggle anymore and instead uses her strong arms and legs to keep her pressed against you, excited for whatever you have planned for her. <i>“But whatever you do,”</i> she warns, trying to sound serious but her girlish smile and giggling gives her away immediately. <i>“You</i> definitely <i>can’t fuck me. We may be naked, and horny");
	if(pc.hasVagina()) output(", and cunt-to-cunt");
	output(", and I may want you more than I’ve wanted anyone right now, but you</i> absolutely <i>can’t do it, okay?”</i>");

	output("\n\n<i>“Yep,”</i> you lie.");

	args.push("SSTRO");
	processTime(5);
	pc.lust(10);
	//[=Missionary=][=Twist & Straddle=]
	// end scene (scene: SSTRO)
	clearMenu();
	addButton(0,"Missionary",SSTM,args);
	addButton(1,"TwistStraddle",SSTTANDS,args);
}

//[=Sit Up=]
// (scene: SSTSU)
public function SSTSU(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You decide you’re not content to just lay there while Paige has her sexy way with you. Grunting a bit, you sit up without moving your hips, bringing you chest to chest and face to face with Paige. <i>“Let’s make this a little more intimate,”</i> you tell her, wrapping your arms around her back and hugging her closer.");
	output("\n\nPaige hums in agreement and does the same, hugging you closer. ");
	//if (pc.biggestTitSize <= 2)
	if(pc.biggestTitSize() <= 2) output("You’d be lying if you said you weren’t a little jealous of Paige’s firm and pert C-cups; feeling them press into your [pc.chest] makes you long for some pillows of your own to be played with, but, on the other hand, it makes playing with hers more exciting, in its own way");
	else if(pc.biggestTitSize() <= 5) output("Your [pc.chest] meshes against her soft C-cups, your [pc.nipples] kissing and rubbing each other in the tight confines between you. The sensitive flesh on your chest excites you in ways your tribbing pussies don’t; you exaggerate your humping against her to frot your breasts together, massaging hers with your own");
	else output("Your [pc.chest] eclipses hers, and you can’t help but grin a little smugly in how Paige’s tits, as firm as they are, don’t hold a candle to your own. You hug her tighter to you, letting your boob-flesh press and overwhelm hers; you can feel her hardening nipples dig against you helplessly. Paige hums to herself, and you can tell it’s out of frustration, but she makes no attempt to stop anything – it feels pretty good regardless of whose tits are bigger");
	output(".");
	//if {pc.hasDickNipples = true}
	if(pc.hasDickNipples()) 
	{
		output("\n\nYour unique nipples, erect as they’ve ever been, press a little painfully into Paige’s chest and they resist against you when you try to hug her closer. <i>“Heh,”</i> says Paige, ");
		if(paigeBlind()) output("knowing exactly what she’s feeling when she moves against you");
		else output("knowing that this was coming, after getting an eyeful of your body");
		output(". <i>“That’s awkward.”</i>");
	}
	//if {pc.breastRows < 1}
	if(pc.bRows() > 1) output("\n\nWhen you press your bodies tighter together, Paige hums in confusion as she feels your [pc.nipples 1] dig against her belly. She shuffles her torso against you, confirming what she’s feeling is what she’s feeling, then giggles and keeps doing it.");

	output("\n\nNow that you’re closer to Paige, sitting up on the edge of her bed, ");
	if(pc.hasVagina()) output("your [pc.vagina]");
	else output("your bare crotch");
	output(" against her wet Ausar twat, you do what comes naturally and start humping her: every gentle rock of your hips against hers gets hotter and stickier with every pass. You can’t help but moan, but you <i>can</i> help moaning her name, to get her hotter for you. You punctuate yourself by gently kissing her neck, then capping it with a languid lick from her shoulder to where her ear connects with her head.");
	output("\n\n<i>“You sure know how to make a horny girl feel wanted,”</i> Paige says sincerely. To show you that your efforts are working, she humps you faster, rocking her hips off-rhythm with yours. <i>“");
	if(pc.hasVagina()) output("Let’s do something about that wet box of yours, [pc.name]");
	else output("Let’s see what we can do about my horny [pc.race], [pc.name]");
	output(".”</i>");

	processTime(5);
	pc.lust(10);
	args.push("SSTSU");
	//[=Grind=][=Spank=][=Stand Up=]
	// end scene (scene: SSTSU)
	clearMenu();
	addButton(0,"Grind",SSTG,args);
	addButton(1,"Spank",SSTS2,args);
	if(pc.PQ() >= 85) addButton(2,"Stand Up",SSTStU,args);
	else addDisabledButton(2,"Stand Up","Stand Up","You’re not strong enough to fuck Paige like this.");
}

//[=Spank=]
// (scene: SSTS1)
public function SSTS1(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You withdraw your fingers from Paige’s snatch, playing with the viscous fluid collected on them for a moment – before rearing your hand back and slapping Paige on the ass. You flex your fingers, raking them across her globes for effect. <i>“Me too,”</i> you say to her dauntingly. <i>“Show me how much more you need, Paige.”</i>");
	output("\n\nShe reaches behind herself and grips onto your wrist tightly, pinching the nerves there as she holds you still. <i>“You got it,”</i> she replies. Paige leans forward, over you, readying herself and her leverage for the fucking you’ve dared her to give you, and then she starts.");
	output("\n\nShe humps against you almost as if she had a penis, but not quite: it’s more of an up-and-down motion than in-and-out. The effect that it achieves is <i>delicious:</i> every upward rock of her powerful yoga-trained hips drags the ");
	if(pc.hasVagina()) output("labia of your [pc.vagina]");
	else output("thick skin of your [pc.crotch]");
	output(" up with her, but not so far and not so roughly for it to be painful. It drives a tense, hot feeling up your spine, and every downward motion resets you, relaxing you");
	if(pc.hasVagina()) output("r bits");
	output(" and cooling the sudden heat, before it starts all over again.");

	output("\n\nMore than the motion is the raw, intense passion Paige has not just for the act, but for you: she grunts out on every other pass in effort as she fucks you with every muscle her years of yoga have tuned up. She winces inwardly as she rises and she draws the motion out as long as she can, caressing every part of you");
	if(pc.hasVagina()) output("r sex");
	output(" with every part of hers, and exhales on the way down. Her body is pressed tightly against yours, and with every motion, she presses a little tighter.");

	if(!pc.isNaga()) output("\n\nHer left hand trails down your thigh and hooks beneath your knee. You feel her lift it, trying to direct your leg up and over her shoulder so she can fuck you with a bit more leverage");
	else output("\n\nHer hands trail down your body until she gets to your [pc.ass], then she hooks them beneath your weighty lower body. She disengages herself from you as she tries to lift you up and over her shoulder so she can fuck you with a bit more leverage");
	output(". But she also stops her fucking in order to get this new position. Are you gonna stand for that?");

	processTime(5);
	pc.lust(10);
	args.push("SSTS1");
	//[=Comply=][=Grab Forearms=]
	// end scene (scene: SSTS1)
	clearMenu();
	addButton(0,"Comply",SSTC,args);
	addButton(1,"Grab Forearms",SSTGF,args);
}

//[=Kiss It=]
// (scene: SSTKI)
public function SSTKI(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You can’t help but feel a little intimate, given your positions and the... the <i>things</i> Paige is doing to you. You reach up and wrap up arm behind her back, keeping her close, while the other runs through her hair, playing with it. You close the distance and lay a long kiss on her exposed neck.");
	output("\n\nShe says nothing, but her eagerness for you increases, her hips jacking up and down across your sensitive skin. Her breathing gets heavier, partly from the exertion, but mostly from the incoming orgasm. You kiss her neck at a different spot, your fingers scratching at her triangular Ausar ears, your [pc.legs] tightening around her waist as her fucking grows more earnest.");
	output("\n\nYou lick at her, covering her fresh hickeys with your tongue. Your every breath is inundated with her heady scent, her particular musk growing thicker the closer she gets to her orgasm. You work together: Paige focuses on the motions while you lift your [pc.hips], keeping you both together. You can feel her arms and torso tense tightly while her humping grows impatient and frantic. It won’t be long for her.");
	output("\n\n<i>“I’m nearly there, babe,”</i> you tell Paige");
	if(!pc.hasVagina()) output(". Where ‘there’ is isn’t something you can easily explain, but whatever it is, you’re definitely nearly there");
	output(". You’re pretty sure she knows, but you also know she likes it when you tell her.");
	output("\n\n<i>“I’m,”</i> Paige whimpers, trying to talk through her unsteady breath. You return to kissing her neck, sucking lightly on the skin there. <i>“Me too, sweet thing.”</i> She returns to her mission, her strong hips molesting yours, your tits rubbing against each other: every sense bombarded with Paige and her body as your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.crotch]");
	output(" sends your head its telltale signals that you’re about to cross that special line, thanks to her.");

	args.push("SSTKI");
	processTime(5);
	pc.lust(10);
	//[=Climax=]
	// end scene (scene: SSTKI); go to (scene: SSTE1)
	clearMenu();
	addButton(0,"Next",SSTE1,args);
}

//[=Bite It=]
// (scene: SSTBI)
public function SSTBI(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige’s intensity and the intimacy between you has you get a little carried away. Paige’s masterful tribbing against you gets you excited, and you open your mouth, making a long lick along her neck, before biting down on her, nibbling on the skin past the thin fur.");
	output("\n\nPaige winces sharply and her body jitters at the sudden pain. You feel a pang of guilt – you hadn’t meant to hurt her – but Paige, the trooper she is, just laughs derisively. <i>“Didn’t take you for a biter, [pc.name],”</i> she says, then resumes fucking you with everything she’s got. <i>“You trying to play dirty or something?”</i>");
	output("\n\n<i>“I got a little excited is all,”</i> you admit, kissing gently at where you bit her. <i>“You just...</i> do <i>that to me, Paige.”</i>");
	output("\n\nShe hums in approval and doesn’t let up, gliding her slick snatch over you");
	if(pc.hasVagina()) output("rs");
	output(" almost angrily. <i>“I’ll be doing something else to you in a minute.”</i> Her gyrating hips increase in intensity, drawing longer up your body and pressing tighter against your crotch. She feels up every centimeter of your ");
	if(pc.hasVagina()) output("snatch");
	else output("crotch");
	output(" with her own, coaxing out every drop of your ");
	if(pc.hasVagina()) output("lady lube");
	else output("sweat");
	output(" for herself.");

	output("\n\nShe digs her nose into the crease of your neck, breathing deeply through her nose – and then she nibbles at your [pc.skinFurScales], much lighter than you did to her. Her hands travel down to your [pc.ass], grabbing both cheeks tightly and lifting your hips to hers, using the leverage to fuck you harder. <i>“Cum for me,”</i> she says, neither a suggestion nor a request.");
	output("\n\nYou can’t muster a reply: your breath catches in your chest and she forces it out of you every time she pumps against you. All you can do is clutch onto Paige, your arms wrapped around her strong, toned back... and her fur in your mouth.");

	//[=Climax=]
	// end scene (scene: SSTBI); go to (scene: SSTE2)
	processTime(5);
	pc.lust(10);
	args.push("SSTBI");
	clearMenu();
	addButton(0,"Next",SSTE2,args);
}
//[=Missionary=]
// (scene: SSTM)
public function SSTM(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You grip onto Paige’s shoulders for stability, and then start rocking your hips back and forth, gliding your");
	if(pc.hasVagina()) output(" slippery [pc.vagina]");
	else output("self");
	output(" over hers. The unique sensation of having ");
	if(pc.hasVagina()) output("another woman’s labia pressed against yours");
	else output("someone dominate you in a way that doesn’t involve your mouth or your ass");
	output(" feels delightful – Paige bites her lip and inhales sharply through her nose, lifting her crotch up to hump back.");

	output("\n\n<i>“What did I just say?”</i> she chides, occasionally stopping her hips to make you do the work. You draw your left hand down her body, tracing your fingers down her abs until it finds the tight globe of her ass cheek. You pinch it, and Paige ‘eep!’s her hips up into you, completing the circuit between you again. You grab her butt with the whole of your palm to keep her there.");
	output("\n\n<i>“We’re not fucking,”</i> you reply, tribbing your ");
	if(pc.hasVagina()) output("thirsty quim");
	else output("blank but hungry crotch");
	output(" against hers, the pool of juices between yourselves growing thicker. You massage her butt as you keep her against you, and you don’t stop your rocking. <i>“We’re just rubbing against each other. Nothing sinister about that, is there?”</i>");

	output("\n\n<i>“How can it be wrong if it feels so right, right?”</i> Paige laughs, and then leans forward, bringing her lips to yours. Neither of you waste time snaking your tongues into each other’s mouths, careful not to nip each other in your frantic not-fucking. <i>“Gods,”</i> she sighs whimsically, leaning back and letting you have your way with her. <i>“You are just</i> perfect. <i>I’m so close already....”</i>");
	output("\n\nYou lean forward, your nose in the crease of her neck, nuzzling against her. You’re starting to feel the strain of your propped position and excessive motion, but the end is in sight: the familiar feeling of your orgasm crawls its way from your ");
	if(pc.hasVagina()) output("[pc.vagina],]");
	else output("[pc.crotch] – you’re not sure how, but you’re not about to ask questions –");
	output(" soaked in both of your juices, and quickly makes its way up your belly, then through your chest. Paige tenses underneath you by the time that feeling gets to that little spot in your head that tells you to cum....");

	//[=Climax=]
	// end scene (scene: SSTM); go to (scene: SSTE2)
	processTime(5);
	pc.lust(10);
	args.push("SSTM");
	clearMenu();
	addButton(0,"Next",SSTE2,args);
}

//[=Twist & Straddle=]
// (scene: SSTT&S)
public function SSTTANDS(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You sit up, Paige’s legs still around your waist, but you reach behind yourself and pull her left one away. Paige lays still, a goofy grin on her face as she waits torturously for whatever it is you have planned.");
	output("\n\nWith a heft, you left her leg up and over your shoulder, and, with some authority, twist her lower body to one side. With the open angle to her crotch, you slide in, pressing your ");
	if(pc.hasVagina()) output("wet cooch");
	else output("[pc.crotch]");
	output(" against hers once again. <i>“[pc.name]!”</i> Paige chastises. <i>“You just told me you wouldn’t fuck me, no matter what!”</i>");

	output("\n\n<i>“I’m sorry,”</i> you reply, rolling your hips and flexing your abs, bumping your");
	if(pc.hasVagina()) output(" [pc.vagina]");
	else output("self");
	output(" against hers with every inward thrust and using her overturned thigh to masturbate yourself on the backswing. When you’re all the way in, you move from side to side, meshing yourself against her until you’re both good and wet. <i>“I lied.”</i>");
	output("\n\nPaige chews her lips, her hands gripping onto the sheet tightly as your every push forward elicits another wave of pleasure, making her visibly shiver all the way from her legs to her eyes. <i>“You</i> villain,<i>“ she gasps, the words coming out shaky as she convulses beneath you.");
	output("\n\nDespite not doing any of the work, Paige is soon out of breath from your ravaging her tight, vulnerable cunt with your superior leverage. Your every push inward is accented with a passionate yet fierce rub up, then down, slathering every part of her sex with your ");
	if(pc.hasVagina()) output("own.");
	else output("[pc.crotch].");

	output("\n\nThe sideways position pulls at you");
	if(pc.hasVagina()) output("r labia and especially your [pc.clit]");
	output(" in a unique way, but more than the physical sensations, seeing Paige reduced to a puddle of feminine satisfaction – breasts heaving; eyes unfocused and slowly rolling upward; her arms struggling to thrash if it weren’t for her grip on her bedsheets – triggers something in you");
	if(pc.hasVagina()) output("r own [pc.vagina]");
	output(". A sense of pride in seeing your woman taken so wantonly, knowing that her orgasm is something that only you could have done right then and there.");
	output("\n\nIt almost makes you forget that your own orgasm is right there as well.");

	//[=Climax=]
	// end scene (scene: SSTT&S); go to (scene: SSTE3)
	processTime(5);
	pc.lust(10);
	args.push("SSTT&S");
	clearMenu();
	addButton(0,"Next",SSTE3,args);
}

//[=Grind=]
// (scene: SSTG)
public function SSTG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("There’s nothing stopping you from just straight-up humping each other. So you do.");
	output("\n\nYou move your [pc.hips] forward, feeling your [pc.ass] slip off her bed just a little before you pull back. Paige matches your rhythm easily: her humping isn’t as forward-and-backward as yours, but she bounces on your lap, rubbing your ");
	if(pc.hasVagina()) output("twats");
	else output("crotches");
	output(" and your chests together, making you both hotter, sweatier, and hornier.");

	output("\n\nShe rests her head on your shoulder as her breathing gets heavier. You feel her breath go down your back with her every pleasured moan. You trail one hand down her back, tickling at her spine until you come to her tail, and then scratch just underneath it, where her base meets her back. She twitches in surprise and holds her breath before melting into you, her box getting all the slicker and making your fucking a little easier.");

	output("\n\nPaige lovingly yet errantly licks at your neck, lost in the intimate lovemaking between you. Your every push, every mesh and grind between your bodies sends electricity through you");
	if(silly) output(", possibly due to static discharge, but if not");
	output(": maybe it’s because it’s Paige, and she’s a fucking hot Ausar and she’s clearly into you and not just for the sex, but you");
	if(pc.hasVagina()) output("r [pc.vagina], much less the rest of you,");
	output(" can’t get enough of her");
	if(pc.hasVagina()) output(" and hers");
	output(". You can’t remember the last time you felt like this when you had sex with another woman.");

	output("\n\n<i>“Nearly there,”</i> Paige warns you redundantly: you’re close too, and you figured you’re both going to cum together. You kiss her neck back as your fingers scratch at her tail, pushing her that last little distance. Her tight body bounces against yours messily, her nose buried into the nape of your neck so she can cum with your scent on her mind.");

	output("\n\nWhen you finally do cum, you push so hard against her that you nearly fall off the bed.");


	//[=Climax=]
	// end scene (scene: SSTG); go to (scene: SSTE3)
	processTime(5);
	pc.lust(10);
	args.push("SSTG");
	clearMenu();
	addButton(0,"Next",SSTE3,args);
}

//[=Spank=]
// (scene: SSTS2)
public function SSTS2(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You rear your right hand back and give her cheek, so deliciously vulnerable to spanking, a good, hard spank. The sound of your hand clapping against her tight booty echoes off the walls of the room. Paige doesn’t even whimper; she laughs once, leans back, and grins at you. <i>“Fuck my wet box like you mean it,”</i> you challenge.");
	output("\n\n<i>“Coming right up,”</i> she says, then leans her hips back for the windup before slamming back into you. You don’t have time to retort or respond when she’s reared back to do it again, and then again: Paige uses her arms, locked behind you back, to keep you both in place while she humps you, her sloppy cunt riding a trail of its own juices up and down your thighs and making a splash when it hits yours.");
	output("\n\n<i>“That’s it,”</i> you congratulate, loving everything about Paige and what she’s doing to you. You sit still, not really participating in the fucking beyond giving Paige something to anchor to: her frantic humping against you is more than enough stimulation. Your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.crotch]");
	output(" is getting pounded as if Paige were actually a horny dog. You errantly wonder, if this is how Paige fucks another woman, just how hard she’d fuck you if she had a dick.");//Fuckin' tease.
	output("\n\nShe stops your daydreaming by leaning in, planting her lips furiously against yours, her tongue snaking out to invade your mouth almost angrily. She doesn’t slow down for even a second while she counts your teeth. You taste her tongue, pressing the flat of yours against hers as she violates your privacy. In fact, judging from her intense movements and faster breathing, she’s probably close.");
	output("\n\nGood timing.");

	//[=Climax=]
	// end scene (scene: SSTS2); go to (scene: SSTE4)
	processTime(5);
	pc.lust(10);
	args.push("SSTS2");
	clearMenu();
	addButton(0,"Next",SSTE4,args);
}

//[=Stand Up=]
// Requires Physique to be 85% of the cap or higher
// Tooltip (not strong enough): You’re not strong enough to fuck Paige like this.
// (scene: SSTStU)
public function SSTStU(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Your hands trail down her back, tickling at her spine as they go, before gripping onto the tight globes of her ass. Paige giggles at first, thinking you’re just after a handful – then gasps in surprise as, with a grunt, you heft her up, standing on your [pc.legs] with her arms wrapped around you and her supported by the ass by nothing but your hands.");
	output("\n\n<i>“You’re strong,”</i> you whisper to her, moving your [pc.hips] against hers, but you don’t have a lot of leeway until she plays along. <i>“It’s one of your sexier qualities. But I’m strong too.”</i>");
	output("\n\nShe hums contemplatively, suppressing a girlish giggle as she wriggles in your grasp. She lifts her legs and wraps them around the small of your back, locking herself in place and pressing every part of her body against yours. <i>“Show me how strong, big [pc.boyGirl].”</i>");
	output("\n\nYou acquiesce: by bending your knees in time with lifting Paige’s body up and down yours, you stimulate every part of her tits with your [pc.chest] and every part of her box with your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.crotch]");
	output(". She hums in delight with every rock and lift against you: your ");
	if(pc.hasVagina()) output("[pc.clit]");
	else output("blank pelvis");
	output(" smashes against hers on every pass, making her dissolve in your grip and your knees buckle, but the sheer thrill you get by fucking Paige like this gives you the strength to not let it stop.");
	output("\n\nWhile you do all the hard work, Paige does the little, extrasensory things to keep you ");
	if(pc.hasVagina()) output("wet and ");
	output("horny: she licks and kisses at your neck and your cheek and she rocks her chest from side to side against your titties, stimulating");
	if(pc.bRows() > 1) output(" all of");
	output(" them. Her hands roam over your flexing back, admiring the sturdy muscles she finds there.");

	output("\n\n<i>“Gods, but aren’t we just two tight bitches?”</i> she asks redundantly. Despite doing little work herself, she’s out of breath. Her hands accidentally scratch at you in pleasure and her legs lock around you a little painfully, but, you’re close too, and you doubt you have any more control than she does. <i>“That’s right, [pc.name], claim me. Mark me with your scent forever. Nobody else can take me like you can.”</i> She takes a deep breath through her nose, and then exhales shakily. <i>“Cum with your woman.”</i>");
	output("\n\nLike a good, attentive lover, you do as she asks.");

	//[=Climax=]
	// end scene (scene: SSTStU); go to (scene: SSTE3)
	args.push("SSTStU");
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSTE3,args);
}

//[=Comply=]
// (scene: SSTC)
public function SSTC(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Whatever it is Paige is planning on doing, you’re sure it’s going to be worth it. Her hands are shaking as she lifts your [pc.leg]; you feel a twinge of discomfort as she pulls it up and over her shoulder, lifting you out of a natural position, but with you up in the air like that, she has a much easier time straddling your crotch and giving you a proper scissoring.");
	if(!pc.isNaga()) 
	{
		output("\n\nPaige lifts her right leg and, with the gap between each of your legs, collides her sex with your");
		if(pc.hasVagina()) output("s");
		else output(" gap");
		output(" in an easy, fluid motion");
	}
	else
	{
		output("\n\nYour lack of lower legs means Paige has to get a little creative, but by twisting your body just slightly and straddling you that way, she achieves the desired effect");
	}
	output(". With you");
	if(pc.hasVagina()) output("r [pc.vagina]");
	output(" against her");
	if(pc.hasVagina()) output("s");
	output(", she rocks against you, sliding her slick cunt up and down easily and smoothly against you");
	if(pc.hasVagina()) output("rs");
	output("; you hear the schlicking noise of ");
	if(pc.hasVagina()) output("your");
	else output("her");
	output(" juices ");
	if(pc.hasVagina()) output("mingling ");
	output("and you feel her the lips of her labia kiss against your");
	if(pc.hasVagina()) output("s");
	else output("crotch");
	output(" sloppily. You can also feel her lower abdomen quake in pleasure.");

	output("\n\nShe reaches forward and palms at a ");
	if(pc.biggestTitSize() >= 1) output("titty");
	else output("pec");
	output(", squeezing at it as she pushes into you. You play with the other while your free hand squeezes at her bedsheets for dear life as she pushes and plies into you: Paige fits against you so perfectly, you can hardly believe the stars she’s making you see. Her defined abs flex visibly under her fur and her biceps bulge slightly against your upturned leg.");

	output("\n\nHer breathing was already labored before she started doing you in earnest, but, her mouth agape and dry, the sweat collecting between you two as she constantly moves and she moves you, it’s easy to tell her orgasm is coming. <i>“Fuck me, Paige,”</i> you goad, staring into her eyes");
	if(paigeBlind()) output(", more for your effect than hers, but somehow, you think she can tell");
	output(". <i>“I’m close too. Fuck me into your bed!”</i>");

	output("\n\nShe bites her lip and sharply inhales through her nose for her last few thrusts against you. ");
	if(pc.hasToes()) output("You think you curl your toes, but it’s hard to tell when one leg has gone numb.");
	else output("You lost feeling at your very lower extremities a while ago, but you’re sure you’re thrashing in pleasure.");

	//[=Climax=]
	// end scene (scene: SSTC); go to (scene: SSE4)
	processTime(5);
	pc.lust(10);
	args.push("SSTC");
	clearMenu();
	addButton(0,"Next",SSTE4,args);
}

//[=Grab Forearms=]
// (scene: SSTGF)
public function SSTGF(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("<i>“Nope,”</i> you challenge, gripping onto both of Paige’s arms with your steely, vice-like grip. <i>“We’re not stopping for anything. Fuck me like this!”</i>");
	output("\n\nPaige hesitates before shrugging her shoulders. You don’t let go of her arms, so she twists them until she can grip your forearms as well. <i>“Your call,”</i> she says, then fucks into you, using your arms as an anchor to pull herself in. It hurts a little at first, but you wise up to her maneuver and do the same, using her body to pull yourself into her.");
	output("\n\nYou both go at each other: with matching rhythms, you bump your ");
	if(pc.hasVagina()) output("cunts together, your [pc.vagina]");
	else output("crotch against her sopping cunt,");
	output(" tribbing against Paige’s <i>hard,</i> hard enough to make it sore later. Every hit is a burst of electricity up your back; it causes ripples up your bodies, jiggling your [pc.chest] and hers. Paige’s abs flex solid every time she pulls in and loses their rigidity as she relaxes for another hit.");
	output("\n\nYou’re going at each other like you have something to prove. She’s pulling you up at the same time you’re pulling her down, and when you relax before another pull, you’re flopping back onto the bed. It’s wild, and you’re loving every second of it: the pain you");
	if(pc.hasVagina()) output("r [pc.vagina] takes");
	else output("’re experiencing");
	output(" is overshadowed immediately by the rough pleasure");
	if(pc.hasVagina()) output(", and your [pc.clit] is engorged from the abuse, making it easier <i>to</i> abuse");
	output(".");

	output("\n\nBoth of you are breathing heavier and heavier over time, and not because of the exertion. Your orgasm comes up on you like Paige is pounding it out of you; you’re more than ready to ");
	if(pc.hasVagina()) output("soak her with everything you’ve got, and you’d be disappointed if she didn’t do the same");
	else output("douse this building fire in your body, and you’d be disappointed if Paige doesn’t give you the fluids to extinguish it");
	output(". Her eyes are closed in concentration and she’s breathing wholly through her nose, up until the last hip thrust forward, where she stops and groans out her satisfaction to her audience.");
	output("\n\nYou thought you could go a little longer, but as soon as you feel her pussy twitch and then spray on you, you thought wrong.");

	//[=Climax=]
	// end scene (scene: SSTGF); go to (scene: SSTE5)
	processTime(5);
	pc.lust(10);
	args.push("SSTGF");
	clearMenu();
	clearMenu();
	addButton(0,"Next",SSTE5,args);
}

// (scene: SSTE1)
public function SSTE1(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Unable to multitask between kissing her neck and humping against her as your orgasm rocks through you, you lay your head back onto the pillow of her bed and let out a long hiss between clenched teeth. Paige, surprisingly, does the same, collapsing onto you as her muscles give out and her own orgasm controls her body.");
	output("\n\nYou can feel her vulva undulating on top of you");
	if(pc.hasVagina()) output("r [pc.vagina]");
	output(", in addition to her full-body quaking and shivering, her breath coming out ragged and her voice breaking occasionally. The moisture between your thighs before is nothing compared to the pool explosively gushing from ");
	if(pc.hasVagina()) output("both of you");
	else output("Paige");
	output(": with an involuntarily thrust of Paige’s hips, you can feel her squirting as high as your [pc.chest].");

	output("\n\nYour limbs, still locked behind Paige’s back, squeeze her tightly as you try, and fail, to contain your own orgasm even slightly: your vision goes blurry as you feel wave after wave of tension-undoing pleasure signal from your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.crotch]");
	output(", causing your ");
	if(!pc.isNaga()) output("toes to splay");
	else output("tail to stiffen");
	output(" and your fingers to dig into the thick of her upper back. You pump against her, riding it out as long as you can, ");
	if(pc.hasVagina()) output("over-stimulating your [pc.clit] and ]hoping that you can pull out another one or two before you collapse in exhaustion.");

	output("\n\nPaige thinks similarly, and even as she loses her strength and her motor functions, she does her best to keep bumping against you, eking out every last drop of pleasure. Another orgasm, weaker than the first but enough to keep you silly, rocks you both; a third one survives by your [pc.nipples] tweaking against Paige’s as she aimlessly humps you. You’ve lost track of how many Paige has had, but by your fourth, you’re completely insensate.");

	processTime(5);
	pc.orgasm();
	args.push("SSTE1");
	//[=Afterglow=]
	// end scene (scene: SSTE1); go to (SSTAG)
	clearMenu();
	//paigecuddles exception
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSTAG,args);
}

// (scene: SSTE2)
public function SSTE2(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Your rough fucking of each other comes to a head, and you feel that familiar feeling of your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("body");
	output(" clenching");
	if(pc.hasVagina()) output(", trying to milk something for its cum");
	else output(" pleasurably, the tension leaving your body in a hurry");
	output(". You stop your movement, caught up in the sensation at first; perhaps triggered by the feeling of your body tightening and quaking against you, Paige’s orgasm arrives just seconds later, which reminds you to keep fucking, hard as it might be.");

	output("\n\n");
	//if {SSTBI}
	if(InCollection("SSTBI", args)) output("Paige’s head is against yours. You have enough sense to not try and bite her again – you might do more than nip her in your current condition");
	//if {SSTM}
	if(InCollection("SSTM", args)) 
	{
		output("You drop your head, yours against hers, as you lose all control of your body, surrendering everything to your ");
		if(pc.hasVagina()) output("genitals");
		else output("body");
		output(" in the moment");
	}
	output(". Your lungs burn as you realize you haven’t taken a breath in a while, and you inhale deeply, assaulting your nose with everything Paige, from the sweat building under her fur to the poignant girl-jism squirting from her cunt. With her scent imprinted in your head, you cum a second time.");
	output("\n\nPaige tries to say something – an expletive, from the first syllable – but she can’t, too lost in her bliss.");
	//if {SSTBI}
	if(InCollection("SSTBI", args)) output(" She bumps forward a few more times, each one punctuated by another convulsion starting at her groin. Her hands are stuck to your [pc.ass], groping at you as she fucks you, but her grip grows weaker over time.");
	//if {SSTM}
	if(InCollection("SSTM", args)) output(" Her arms and legs are locked behind you, keeping you to her, but she doesn’t make any effort to do much else, her mind too primeval to focus on anything.");
	output("\n\nYou’re both wet, sticky, and exhausted, but you keep going, doing everything you can to each other to maintain your pleasure. You thrust your [pc.hips] against hers; she licks at your neck; you grope at her body; she tweaks your [pc.nipples] with hers, frotting her boobs against yours. You have a third, and you’re pretty sure you have a fourth, but at that point, you’ve checked out mentally and can’t enjoy it as much as you want.");

	processTime(10);
	for(var i:int = 0; i < 4; i++) { pc.orgasm(); }
	args.push("SSTE2");

	//[=Afterglow=]
	// end scene (scene: SSTE2); go to (SSTAG)
	clearMenu();
	//paigecuddles exception
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSTAG,args);
}

// (scene: SSTE3)
public function SSTE3(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Your breath catches in your throat as that familiar tingling of your orgasm, starting from");
	if(pc.hasVagina()) output(" your [pc.clit]");
	else output("between your [pc.legs]");
	output(", then travelling somewhere inside you, and then spreading to the rest of your body, overtakes you completely. You’re consumed with just one thought: to ride it out for as long as you can, and you do that by continuing to fuck Paige.");

	output("\n\nHer body locks up and shakes as she yips in delight rather loudly");
	//if {SSTStU}
	if(InCollection("SSTStU", args)) output("; her remaining still makes it easier for you to do what you want to her");
	output(". Her pussy gushes her Ausar fem-cum across your crotch, squirting so hard that it travels up your abdomen. ");
	//if {SSTT&S}
	if(InCollection("SSTT&S", args)) output("Her fingers dig into the quilts of her bed, yanking them up and out of position");
	else output("Her limbs lock tightly around you, her fingers clawing into your [pc.skinFurScales] just a little painfully");
	output(" as she tries to cling to anything at all for stability. You don’t stop against her, and you feel her hips twitch some more before another one racks her body.");

	//if {SSTT&S}
	if(InCollection("SSTT&S", args)) output("\n\nYou grope at her thigh and lay a hand on her stomach");
	else output("\n\nYour hands stay on her tight ass, groping at it");
	output(" as you fulfill some animalistic need not met by your domineering ");
	if(pc.hasVagina()) output("[pc.vagina] and its ");
	output("orgasm. ");
	//if {SSTG}
	if(InCollection("SSTG", args)) output("The thought that you’re doing this to each other");
	else output("The thought that you’re doing this to her");
	output(" enhances the experience for you: ");
	//if {SSTG}
	if(InCollection("SSTG", args)) output("you’re partners, bringing each other to climax in a way and with an intensity you’d hardly ever experienced before, and");
	else output("you’re the only one in the universe right now that can do this to her, and knowing that fills you with horny pride");
	output(" that only makes you want to fuck her more.");
	//if {SSTG}
	if(InCollection("SSTG", args)) output(" From the way Paige is fucking you back, she feels similarly.");

	output("\n\nYou have a second orgasm, ");
	if(pc.hasVagina()) output("your");
	else output("her");
	output(" cum dripping between you and soaking into ");
	//if {SSTStU}
	if(InCollection("SSTStU", args)) output("her floor");
	else output("her bed");
	output(", but you don’t stop, already hunting for your third. It’s only another few moments of grinding until you find it");
	//if {not SSTT&S}
	if(!InCollection("SSTT&S", args)) output(", eased by your [pc.nipples] being tweaked and massaged by Paige’s");
	output("; unsatisfied yet exhausted, out of breath, and weak, you keep going, thumping into each other, your [pc.crotch] meshing with hers like a wet and sticky jigsaw piece. When the fourth peters its way up your spine, you collapse ");
	//if {SSTStU}
	if(InCollection("SSTStU", args)) output("backward, onto her bed; you have just enough strength to remain upright, but only just.");
	else output("onto Paige for support, your energy gone.");

	//[=Afterglow=]
	// end scene (scene: SSTE3); go to (SSTAG)

	processTime(8);
	pc.orgasm();
	pc.orgasm();
	args.push("SSTE3");
	clearMenu();
	//paigecuddles exception
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSTAG,args);
}

// (scene: SSTE4)
public function SSTE4(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Paige’s movements get more and more frantic, the friction between your bodies growing and getting hotter. You do your part, moving against her when she humps you in just the right way, but for the most part you just let her have her way with you, which you’re perfectly compliant with. You do mostly nothing, <i>and</i> you get fucked until you’re cross-eyed? Awesome!");
	output("\n\nThat said, Paige cums first: her body stiffens and her fur stands on end, her snatch tight against you");
	if(pc.totalVaginas()) output("rs");
	output(" as it spasms, its liquids launching straight ");
	if(pc.hasVagina()) output("into your tunnel");
	else output("up your stomach");
	output(" like some facsimile of a man’s cum. She groans out, long and deep, and she quivers in pleasure as she squirts and squirts, soaking you");
	if(pc.hasVagina()) output("r [pc.vagina] and even");
	output(" as high up as your upper abdomen in her Sapphic delight.");

	output("\n\nThe sight, the sounds, the smells, and the sensations triggers your own orgasm, and you join her, wincing in an effort to keep your composure while a lightning bolt strikes up your spine from your crotch. Your [pc.chest] rocks with your heavy breathing, which is rocked by the convulsions ");
	if(pc.hasVagina()) output("your cunt");
	else output("the ghost of your genitals");
	output(" controls your nerves with.");
	if(pc.hasVagina()) output(" Paige’s feminine squirts are matched with your own [pc.girlCum].");

	output("\n\nPaige doesn’t stop fucking you until you’ve both had a second orgasm. Her grip on you grows looser as her energy winds down, leaving her body through her pussy, but she doesn’t stop; she commands a third one from you both, her incessant grinding slowing only just; eventually, you’re both tired and lethargic, and when you have a fourth, you’re barely sensate enough to really enjoy it.");

	//[=Afterglow=]
	// end scene (scene: SSTE4); go to (scene: SSTAG)
	processTime(15);
	pc.orgasm();
	pc.orgasm();
	args.push("SSTE4");
	clearMenu();
	//paigecuddles exception
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSTAG,args);
}

// (scene: SSTE5)
public function SSTE5(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You’re both getting bruised and battered, but it’s the kind of hurt that you love; something that stings at the moment of impact but leaves a tingling so pleasant that... well, you could cum from it. You wouldn’t call yourself or Paige masochists, but your competitive, dominant one-upmanship has led to this, and frankly, you love it.");
	output("\n\nPaige hums with need with every exhaustive thrust against you, her pleasure mounting quickly, her clit engorged and battered");
	if(pc.hasVagina()) output(", just like yours. Your juices create audible splashes with every collision");
	output("; finally, Paige presses in, moans out, and you feel her body, and especially her cunt, convulse against you, splashing more of her feminine cum into your tunnel and squirting it onto your flexed abdominals.");

	output("\n\nYou follow suit, groaning loudly as your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("crotch");
	output(" owns your body with the shocks its sending through your muscles again and again. You crunch your stomach as you practically detonate, ");
	//if (pc.hasVagina = true)
	if(pc.hasVagina()) output("squirting your [pc.girlCum] up and against Paige, coating her in yourself just as she had done to you");
	else output("the exhaustive sensation of tension, then release, dominating you both");
	output(". Both of you have an iron-fisted grip on each other, at this point less for the competition or any dominant attitudes and more for mutual support as you lose every semblance of control to your pleasure.");

	output("\n\nHalfway through her orgasm, Paige regains control of herself, and she resumes bucking against you, bringing a second orgasm to you both. Not to be outdone (as soon as your eyes uncross), you respond in kind, yanking her back to you and abusing her ");
	if(pc.hasVagina()) output("cunt with your own ");
	output("for a third. By the time you each have your fourth, you’re too exhausted to keep fucking each other – and the pleasurable pain is starting to turn into regular pain. Unable to proceed, Paige collapses on top of you, panting and disheveled.");

	// end scene (scene: SSTE5); go to (scene: SSTAG)
	processTime(15);
	for(var i:int = 0; i < 4; i++) { pc.orgasm(); }
	args.push("SSTE5");
	clearMenu();
	//paigecuddles exception
	if (paigePostCuddles(args)) return;
	addButton(0,"Next",SSTAG,args);
}

// (scene: SSTAG)
public function SSTAG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You think you fainted from exhaustion – either that, or you came so hard and so many times that you lost all sense of self for a time. Either way, you’re not positive how much time has passed. You remember being out of breath and you and Paige having your way with each other, and you remember loving every second of it.");
	output("\n\nYour Ausar lover moans and starts to shuffle ");
	//if {SSTM or SSTT&S}
	if(InCollection("SSTM", args) || InCollection("SSTT&S", args)) output("underneath");
	else output("on top of");
	output(" you; apparently she had blacked out from the excitement as well. She absently nuzzles you, enjoying using you as her pillow. Her hand travels along your body in her sleepy daze; when she finds your ribs and your [pc.chest], she rises her head in curiosity before realizing that she’s not alone in her bed.");
	output("\n\n<i>“I didn’t dream any of that,”</i> she says, rousing herself. You feel her kick her legs slightly, and she winces; she’s still sore. <i>“Nope. I’m definitely going to walk funny for a day or two.”</i>");
	output("\n\nYou laugh together, and she places her head back where it was against you. <i>“");
	//if {SSTE5}
	if(InCollection("SSTE5", args)) output("I never thought I’d meet a woman that could... keep up with me, [pc.name]. Gods above, is this how I left some women?”</i> She giggles sheepishly, a bit embarrassed for herself. <i>“It’s like... I’m already looking forward to next time, but I’m worried I’ll get pulverized even harder. Is that normal? Is this what it’s like to meet my match?");
	//if {SSTStU}
	else if(InCollection("SSTStU", args)) output("So what was that all about? Were you just trying to show off? Prove to me you’ve gotten so strong you can fuck me while you’re carrying me like some luggage?”</i> Her hand trails down your arm, tickling at your biceps. She squeezes at your [pc.arm], and she suppresses a sexy moan. <i>“‘cause it worked. Gods, that was</i> delicious<i>.");
	else output("You know, I’m bisexual, but I’ve usually had a preference for men. And ever since I lost my eyesight, I hadn’t entertained the idea of getting any at all, much less from another woman.”</i> She trails a finger down your [pc.chest], her finger tickling its way down your cleavage. <i>“It’s different with you. I feel like... it doesn’t matter</i> what <i>you are, [pc.name]. It’s almost like I’m [pc.name]-sexual.");//GAYYY~!
	output("”</i>");

	output("\n\nYou laugh with Paige, then, with extreme reluctance, you pull away from her. Your body is stiff and sore all over, and you’re dry, sore, and sticky around your [pc.crotch] and a little bit up your stomach. You absolutely stink of horny Ausar, too. You have some other things you need doing today – not the least of which is to find a shower.");
	output("\n\n<i>“I could be convinced to go for round two...”</i> Paige croons. As much as you probably could too, you tell her that you both have responsibilities as adults. <i>“Yeah, I know, it sucks.”</i> She hooks a hand around your [pc.hips] and pulls you in for a lingering kiss. <i>“You know where to find me when you change your mind.”</i>");
	output("\n\nJust a few minutes later, you have your effects back on you and you’re ready to leave Paige’s unit.");

	// end scene (scene: SSVAG); reduce Lust to 0; advance clock by two hours; place PC one square outside Paige’s Unit
	processTime(120);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Down On You=]
// Can be done no matter what, including if the PC is genderless. It makes no real sense but go with it.
// If the PC is a herm, make it 50/50 on which of the PC’s bits she will focus on. All scenes will include text for herms, but she will focus more on one or the other throughout the act.
// Of all of Paige’s sex scenes, this one will probably be the worst to code, due to the sheer variety per scene. I’m sorry.
// Tooltip (Dick Only): Ask Paige to suck you off. She’ll probably be all for it, knowing her.
// Tooltip (Vagina Only): See if Paige is up to eating you out. Knowing her, she’d love to.
// Tooltip (Both): Paige is the explorative type. She’d love to have a face-to-crotch look at your exotic set.
// Tooltip (Neither): You don’t have anything for Paige to play with, but if you asked nicely, she’d at least pretend.
// Action tree: http://i.imgur.com/ZFDGGg3.png

// (scene: SSDY)
public function SSDY():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	IncrementFlag("SEXED_PAIGE");
	//0 = vag, 1 = dick, -1 neutershit
	if(pc.isHerm()) args.push(rand(2));
	else if(pc.hasCock()) args.push(1);
	else if(pc.hasVagina()) args.push(0);
	else args.push(-1);
	args.push("SSDY");
	output("You grind yourself against Paige, letting yourself get roused underneath her weight. ");
	if(pc.hasCock()) output("[pc.EachCock] rises quickly, sandwiching between her tight cheeks");
	if(pc.isHerm()) output(" while [pc.eachVagina]");
	else if(pc.hasVagina()) output("[pc.EachVagina]");
	if(pc.hasVagina()) output(" slickens itself in preparation for whatever it is Paige can throw at you");
	if(!pc.hasGenitals()) output("You don’t have any sexual endowments to show for it, but the familiar tingling at your crotch where you <i>used</i> to have them is signal enough to you");
	output(".");
	output("\n\nYou bite your lip as Paige bounces on you, waiting for your decision. <i>“This will sound a bit selfish–”</i>");
	output("\n\n<i>“Say no more,”</i> she interrupts, licking her lips as her body slides down you, her wet pocket going down your [pc.thighs] until she’s on her knees at the edge of her bed, her breasts against your crotch");
	if(pc.hasGenitals()) output(", tickling against your junk");
	output(". <i>“Don’t worry about being ‘selfish’ with me, [pc.name]. Who doesn’t love a");
	if(pc.hasCock() && !pc.hasVagina()) output(" good blowjob now and again?");
	else if(pc.hasVagina() && !pc.hasCock()) output(" thick tongue in their box every once in a while?");
	else if(pc.isHerm()) output("n attentive mouth to get all the good spots from time to time?");
	else output(" mouth to touch them somewhere a little more exotic now and then?");
	output(" And, Gods know I don’t mind being on my knees for extended periods.”</i>");
	output("\n\nShe doesn’t waste any time, getting to work on your crotch, her hands first playing with the thick of your thighs as her mouth inches its way closer, salivating on you as she leans in. She’s clearly all for it. Do you let her go at her own pace, or do you take advantage of her generous offer?");

	processTime(5);
	pc.lust(10);
	//[=Let Her=][=Take Control=]
	// end scene (scene: SSDY)
	clearMenu();
	addButton(0,"Let Her",SSDYLH,args);
	addButton(1,"Take Control",SSDYTC,args);
}

//[=Let Her=]
// (scene: SSDYLH)
public function SSDYLH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYLH");
	output("You lean back, resting on your elbows, allowing Paige to go at her own pace. She’s being awfully proactive about going down on you, and you don’t want to push your luck with a good thing. She pulls your [pc.legs] over her shoulders, positioning herself perfectly, face-to-crotch.");
	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1) 
	{
		output("\n\nShe gently takes your [pc.cock] in her hand");
		if(pc.cockTotal() >= 2)
		{
			if(!pc.hasVagina()) output(" and your [pc.cock 1] in the other");
			else if(pc.hasVagina()) output(" and, ignoring your [pc.cock 1], slips her other hand lower, towards your [pc.vagina]");
		}
		output(", stroking ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(", feeling your blood rush through ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(", rising ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" to full mast; she times your heartbeat with her strokes, relishing in how her gentle hands can cause such a reaction in a person.");
		if(pc.hasVagina()) output(" Her other fingers ply at your entrance, soaking themselves in yourself, readying themselves for the voyage they’re about to take.");

		output("\n\nPaige leans in, pressing her cold Ausar nose against the base of your [pc.cock], making you shiver in surprise. She takes a deep breath through her nose, taking in your scent, and, in a lazy daze, slips her tongue out, ");
		if(pc.balls > 0) output("lathering the top of your [pc.sack] before ");
		output("coating you in her spit");
		if(pc.cLength(0) >= 12) 
		{
			output(". She’ll never take all of you into her mouth – you think – but that’s okay. Hell, being beneath your massive dong");
			if(pc.cockTotal() > 1) output("s");
			output(" seems to excite her a little more, going by the starry look in her eyes");
		}
		if (pc.hasVagina())
		{
			output(". Despite her lethargic licking, her fingers pull and squish against your labia; she knows how important it is she doesn’t ignore your [pc.vagina], despite her focus being elsewhere");
		}
		output(".");

		output("\n\nIt doesn’t take long until Paige has you rock hard, and she begins trailing her tongue up your shaft, meticulously licking at every bit of [pc.skinFurScales] on her way. You feel a chill against your [pc.cock] with her every heady, exaggerated breath through her nose, and a hot wash of wind every time she shudders out an exhale. When she gets to your [pc.cockHead], she slips her upper lip over your tip first, giving you one last lick, before slipping it inside.");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nPaige plays with you");
		if(pc.hasVagina()) output("r [pc.vagina], tickling at your labia with gentle passes of her fingers against your sensitive skin");
		//if (pc.cocks = 1)
		if(pc.cockTotal() == 1) output(" while her other hand busies itself with your half-mast-and-rising-fast [pc.cockNoun]");
		else output(" and yet leaves the rest of you alone and frustrated, her attention elsewhere");
		output(". You’re slick already and only getting wetter, excited for the unique sensation of having a tongue inside your pocket. But Paige takes her time, going so far as to hot-dog her finger between your puffy lips to make <i>sure</i> you’re ready for her");
		//if (pc.hasVagina = false)
		if(!pc.hasVagina()) output("r empty crotch, stroking at the flat skin she finds there. She’s neither nonplussed nor even hesitant at paying you some attention, even if there isn’t anything to really play with. It says a lot, you think, about how much she simply enjoys being with you if she’s willing to go down on nothing");
		output(".");

		output("\n\nShe shuffles forward, leaning in slightly. ");
		if(pc.hasVagina()) 
		{
			output("She removes her fingers from you, slick and sticky with your fluids – she brings them to her nose, looking into your eyes");
			if(paigeBlind()) output(" (generally)");
			output(" as she takes a deep breath through her nose, getting your girly musk imprinted into her nose, before slowly licking each digit clean");
			if(pc.hasCock())
			{
				output(". [pc.eachCock] immediately turns to stone, as hard as ");
				if(pc.cockTotal() == 1) output("it’s");
				else output("they’ve");
				output(" ever been, which makes it all the harder to mentally deal with, knowing ");
				if(pc.cockTotal() == 1) output("it isn’t");
				else output("they aren’t");
				output(" the treasure Paige is after");
			}
		}
		//if (pc.hasVagina = false)
		else
		{
			output("She removes her hand, rubbing her fingers together as if she were sampling some kind of powder as she regards your crotch. Without warning, she leans in, pressing her cold Ausar nose against you, and taking in a deep breath through her nose. She isn’t about to get any sort of ‘musk high’ off you, but the intent was clear, and the burn in your loins grows all the harder to deal with, in a wonderful way");
		}
		output(".");

		output("\n\nWith ");
		if(pc.hasVagina()) output("you nice and wet, and with ");
		output("your scent on Paige’s mind, she crosses the line");
		if(pc.hasVagina())
		{
			if(pc.balls > 0) output(", nuzzling herself beneath your [pc.sack]");
			output(" and presses her lips to your [pc.vagina]. She rests there for a moment, letting your essence coat her lips momentarily – she twists her head to one side, lewdly kissing you, before slipping her tongue out and into you");
		}
		else output(", laying her lips against your blank crotch, kissing you gently there, as if she were kissing any other part of your body. She stays like that for a moment, then slips out her tongue, swathing it against your body, soaking it in her saliva");
		output(".");
	}
	// Merge here
	output("\n\nThe sensation of having Paige’s mouth on you has you clutching at her bedsheets, both in pleasure and in excitement for what more she’s going to do: this is only the beginning, after all. When your knuckles turn white, you realize that you don’t have to be totally still in this experience. You could keep them busy by playing with her hair – or you could offer something else.");

	processTime(5);
	pc.lust(10);
	//[=Her Hair=][=Offer=]
	// end scene (scene: SSDYLH)
	clearMenu();
	addButton(0,"Her Hair",SSDYHH,args);
	addButton(1,"Offer",SSDO1,args,"Offer","It takes two to tango, after all! Ask Paige if she’s into a bit of 69 action.");
}

//[=Take Control=]
// (scene: SSDYTC)
public function SSDYTC(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYTC");
	output("Paige sometimes likes to go on about being dominant or submissive in bed, and how she doesn’t mind being the bottom every once in a while. Seeing her now –");
	if(currentLocation == "PAIGE_HOUSE") output(" in her own unit,");
	output(" on her knees, her mouth inches from your crotch, ready to serve you – you think she might appreciate you taking on a more controlling attitude. You’d be lying if you said you weren’t into that too, of course.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nShe gently takes your [pc.cock] in her hand");
		if(pc.cockTotal() >= 2)
		{
			if(!pc.hasVagina()) output(" and your [pc.cock 1] in the other");
			else output(" and, ignoring your [pc.cock 1], slips her other hand lower, towards your [pc.vagina]");
		}
		output(" – then, before she has a chance to stroke them to full mast, you grip her by the back of her head and thrust your [pc.hips] forward, meshing her face into the base of your shaft");
		if(pc.cockTotal() > 1) output("s");
		output(". Your [pc.cock] lays itself flat against her cheek");
		if(pc.cockTotal() == 2)
		{
			output(" while your [pc.cock 1] bats into her nose, audibly slapping against her");
		}
		else if(pc.cockTotal() >= 3) 
		{
			output(" while the rest of [pc.eachCock] bats against her face, her nose, and her neck, each of them vying for her attention and each one getting larger by the second");
		}
		if(pc.cockTotal() >= 7) 
		{
			output(". You practically lose Paige in the vineyard that is your crotch, her features disappearing into the valley of your shafts");
			if(pc.cLength(0) >= 12) output(", her body disappearing in the shadow of your towers, each one");
		}
		output(", ready for her service.");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) output("\n\nYour [pc.cocks]’ sister is wet and envious but patient, knowing that this show isn’t about her. Still, Paige, attentive and loving as she is, doesn’t leave your [pc.vagina] unattended; even in the confusion, she doesn’t forget to keep a hand against your mons, playing with your labia there.");
		output("\n\nWhen it’s clear she’s not the one in control, Paige goes slack in your grip, allowing you to have your way with her. Your grind your crotch into her face, sliding [pc.eachCock] against her features, feeling yourself get harder with every upward thrust against the fine fur on her cheek. You feel her take a deep breath through her nose, taking in your scent");
		if(pc.balls > 0) output(", and you then feel her warm, flat Ausar tongue massage at your [pc.balls] in her submissive servitude.");
		else output(", and then her tongue snakes out to lap at the base of [pc.eachCock], coaxing you to the last bit of stiffness you need.");

		output("\n\nYou grip the base of your shaft, humping your [pc.hips] against her still face twice more, before pulling back far enough to line up your shot. You trace her lips with your [pc.cockHead], easing them open just enough to slip inside. Once you’re inside, you take her unspoken invitation to lean forward, driving yet more of yourself inside her.");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nPaige plays with you");
		if(pc.hasVagina()) 
		{
			output("r [pc.vagina], tickling at your labia with gentle passes of her fingers against your sensitive skin");
			if (pc.cockTotal()) output(" while her other hand busies itself with your half-mast-and-rising-fast [pc.cock]");
			if(pc.cockTotal() > 1) output(" and yet leaves the rest of you alone and frustrated, her attention elsewhere");
			output(". You’re slick as could be, so you don’t need more teasing, and you show her as much by grabbing the back of her head and thrusting your [pc.hips] forward, squashing her nose right up against your [pc.clit]");
		}
		else output("r empty crotch, trailing her fingers along the valley there. You don’t need teasing, since there isn’t anything to tease, and you let Paige know as much by grabbing her head and meshing her face up against your [pc.crotch]. There’s nothing there to lord over her with, but the action alone is more than enough for her to get the message");
		output(".");

		output("\n\nPaige gasps in surprise");
		if(pc.hasVagina()) 
		{
			output(", taking in a whiff of your feminine scent, buried up to the nostrils in your [pc.vagina] – after a pause, she takes a much deeper one, immersing herself in her position and your scent. She goes limp in your grip, nuzzling her cold Ausar nose into your bits, getting her snout drenched in your [pc.girlCum]");
			if(pc.hasCock()) 
			{
				output(". [pc.EachCock] leaks pre-Cum, the juices slowly dripping down your shaft");
				if(pc.cockTotal() > 1) output("s");
			 	output(" until they drop low enough to mingle with the rest of your fluids, but Paige is already deeply entranced by your pussy’s juice and, besides stroking you and occasionally bumping your base with her nose, pays [pc.eachCock] only a token thought");
			}
		}
		//if (pc.hasVagina = false)
		else output(", taking in the scent of your [pc.skinFurScales], her nose squashed a bit painfully against your pelvis – and then submits, nuzzling her nose against you, leaning in and angling her nose upward to more appropriately appreciate her station. Her tail wages lazily behind her as she waits for your command, verbal or otherwise, to begin what she set out to do");
		output(".");

		output("\n\nYou reach down, hooking a thumb into Paige’s mouth. She opens up, suckling on your digit a bit, gliding her tongue over it. You lead it from her mouth, out into the open air, and");
		if(pc.hasVagina()) output(" into your sodden tunnel, as deeply as you can until her lips mesh against your mons, letting her take it from there");
		else output(" against your [pc.crotch], giving her the go-ahead she was looking for. She has no singular target and instead blankets you with her tongue, coating your pelvis in her saliva, slowly and steadily");
		output(".");
	}
	// Merge here
	output("\n\nYou sit up, confidently locking Paige’s head between your [pc.thighs] as she services you. The sensation of having tough, dominant Paige reduced to little more than a willing mouth for your body gives you a rush, and it’s only just begun. One hand is still locked behind her head, keeping her in place; now that she’s well within your control, you could play with her a little bit. She might like it, too.");

	//[=Her Hair=][=Her Ears=]
	// end scene (scene: SSDYTC)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Her Hair",SSDYHH,args);
	addButton(1,"Her Ears",SSDYHE,args);
}

//[=Her Hair=]
// (scene: SSDYHH)
public function SSDYHH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYHH");
	output("You run your fingers through Paige’s shoulder-length brown hair, playing with the strands there are she works on you. You massage her scalp as if you were moisturizing it for a shower. Now <i>that</i> gives you an idea for later.");
	if(silly && flags["ANNO_SHOWER_SEX"] == undefined) output(" You’ve never had sex with a dog-lady in a shower before. What a unique idea!");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nPaige hums appreciatively as you play with her hair, making sure it stays out of her mouth as she sucks your [pc.cock]. She takes her time, going slowly on your shaft, letting your [pc.cockHead] bump against the ridges of her palette. Her tongue does most of the work, slipping out to cover as much of your shaft as she can before dipping lower");
		if(pc.cLength(0) >= 12) output(", which, despite her elongated face and long, flexible tongue, <i>still</i> doesn’t cover a lot of area of your gargantuan prick");
		output(".");
		//if (pc.cocks >= 2)
		if(pc.cockTotal() >= 2) 
		{
			output(" She jerks your [pc.cock 1], making sure its erection doesn’t flag – then, surprising you, slips off your [pc.cock 1] and dives on the other, taking it as deep as the first, and alternating her handjob to the now-wet first prick");
			if(pc.cockTotal() >= 3) output(". The rest of you flops against her, waiting for their turn in her hot, wet mouth; you’re not certain how much attention Paige will be giving all of you, but you wait patiently");
			output(".");
		}
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) 
		{
			//if (pc.cocks = 1)
			if(pc.cockTotal() == 1) output(" Her left hand is down beneath your shaft, toying with your [pc.vagina], fingering it in time with her bobs up and down your shaft, but not too deep; just deep enough to keep your [pc.legs] tensed on either side of her and to keep her hand oiled for when she decides to go deeper.");
			//if (pc.cocks >= 2)
			else if(pc.cockTotal() >= 2) output(" With surprising control and impressive multi-tasking, Paige expertly works your [pc.vagina] with her free hand, making sure that every part of her is giving every part of you the best experience she can. She has the awareness to be rougher with your [pc.cock 1] than with your honeypot, but not <i>too</i> rough – it almost makes you wonder if she’s done this before, with the amount of expertise she’s demonstrating.");
		}
		output("\n\nDip lower she does, until half of you is inside her maw");
		//if (pc.CockLength <= 11)
		if(pc.cLength(0) <= 11) output(" and the other half is being tickled and caressed by her deft tongue, down to your base");
		else output(" and her tongue covers as much else as she can from there");
		output(". She tilts her head to the side, letting you ride up the inside of her cheek, slurping noisily as she draws back before lunging forward again. You clench involuntarily and buck your [pc.hips], stuffing more into her mouth, which she happily accepts.");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nPaige hums appreciatively as you play with her hair, making sure it stays out of her mouth as she ");
		if(pc.hasVagina()) 
		{
			output("eats your [pc.vagina]. She’s slow and meticulous; her tongue doesn’t penetrate into you and instead lingers and plays with your labia, pressing flat against your genitals and covering every centimeter of your sex with a single, languid lick, from bottom to button, before doing it again");
			if(pc.totalVaginas() == 2) 
			{
				output(". Mindful of your extra equipment, she switches between your cunt and your [pc.vagina 1], repeating the process on her sister twice before swapping again");
				if(pc.hasCock()) output(". Her hands on your [pc.cock] never forget their mission; she keeps you up, one hand pinching lightly at your base and the other gently making passes over your [pc.cockHead], collecting and spreading the pre-cum beading there occasionally. Her every jerk up your shaft coaxes out some more, soaking her hand even further");
			}
			output(".");
		}
		//if (pc.hasVagina = false)
		else output("licks at your [pc.crotch]. She’s attentive and dedicated, even when there’s nothing for her to play with; her hands crawl down your [pc.ass] and grab at the globes there, kneading the thick flesh of your butt as she hungrily licks, kisses, nips and gnaws at you. The sensation reminds you of what it was like to have something there, and, though it’s a ways away, the tingling sensation of an orgasm is nonetheless present deep within you.");

		output("\n\nShe takes another deep breath, ");
		if(pc.hasVagina()) 
		{
			output("twisting her head to one side as if she were kissing you, then drives her tongue forward, slipping it inside your moist pocket. You gasp in pleasure as she goes, wriggling her tongue up and down and side to side, bloating it to fill you out as much as she can and press against your every pleasurable nook. She angles her head up, lining her upper lip with your [pc.clit], then makes a light chewing motion to include it in her deliberation against your [pc.vagina]");
			//if (pc.hasCock = true)
			if(pc.hasCock()) output(". [pc.EachCock] is rigid as could be, the residual pleasure from your girly bits having you hard as could be for some extra attention, even though the most you’ll get is her hand");
			output(".");
		}
		//if (pc.hasVagina = false)
		else
		{
			output("really taking in your scent to acclimatize herself to her position. Her fingers trail farther up your butt until they meet at the cleft, interlocking behind you – and then, suddenly, she slips a finger in between your crack, seeking out your [pc.asshole]. You shudder and relax: you weren’t going to ask Paige to do this, but hell, if she’s offering, you won’t say no. It’ll make things a little saucier for you both, and get you closer to that edge that isn’t easy for you to reach nowadays.");
		}
	}
	// Merge here
	output("\n\nYou’re melting from her expertise; ");
	if(args[0] == 1)
	{
		if(pc.cockVirgin) output("is this what all blowjobs feel like, or is Paige exceptionally skilled?");
		else output("you’ve had blowjobs before, but something about Paige in particular makes her better at it.");
	}
	//if (pc.hasVagina = true)
	else
	{
		if(pc.vaginalVirgin) output("is this what it’s like to get eaten out every time, or does Paige have more girl-girl experience than she wants you to believe?");
		//PC is not a virgin
		else output("you’ve been eaten out before, but Paige has more experience than most other women.");
	}
	output(" You feel kind of lame, gasping in barely-contained self-control as Paige <i>does</i> things to you, and the only thing you’re doing in exchange is running your mitts through her hair. Surely she’d appreciate a few good words on a job well done, at least?");

	processTime(5);
	pc.lust(10);
	//[=Tell Her=][=Show Her=]
	// end scene (scene: SSDYHH)
	clearMenu();
	addButton(0,"Tell Her",SSDYTH,args);
	addButton(1,"Show Her",SSDYSH,args);

}

//[=Her Ears=]
// (scene: SSDYHE)
public function SSDYHE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYHE");
	output("You run one hand through her hair, enjoying the pleasant sensation of her smooth hair sliding between your digits. You massage her scalp a bit, lulling Paige into a sort of transient state of complacency – you even call her a ‘good girl’ as she works you over. Then, you grab her ears and hold onto each one like a handlebar.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nYou aren’t tight enough to make her yip in pain, but you’re tight enough that she can’t turn to one side or the other without twisting them. With your grip secured, you slam your [pc.cock] into her throat, deep enough until you feel her resist, and then you ease up to let her adjust before cramming your way back in");
		//if (pc.CockLength <= 12)
		if(pc.cLength(0) <= 12) output("; you never go so deep as to choke her (after all, you’ve got a whole lot of cock for her to suck), but you go deep enough to let her know that the option is present");
		//if (pc.cocks >= 2)
		if(pc.cockTotal() >= 2) output(". The rest of your manhood, hard as steel, crams against various areas of Paige’s face: impiously against her cheek and reaching as high up as her eye");
		//if (pc.hasBalls = true)
		if(pc.balls > 0) output(". Your [pc.balls] slap against her chin with every powerful thrust against her face, your [pc.cum] churning and readying to shoot deep into your subservient bitch’s throat. You know she’ll love every second of it");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) output(".\n\nPaige attempts to maintain her attention on your hungry quim, keeping a finger or two lodged into your tunnel, but the sudden and forceful ramming into her face, along with the mildly uncomfortable twisting of her ears, makes it difficult for her to focus – which, in some sadistic way, makes your [pc.vaginas] a little wetter, knowing that she’s having trouble handling you");
		output(".");

		output("\n\nThough Paige is held still in your grip, she does all she can to enhance your experience: she moans sexily, tickling your [pc.cock] with her throat’s vibrations and letting you know just how much she enjoys her position. Her tongue tastes every nuance of your flesh, gliding over your [pc.cockHead] when you pull back and tasting your shaft when you push in");
		if(pc.cockTotal() >= 2) 
		{
			output(". She has");
			if(pc.hasVagina()) output(" one hand jerking your [pc.cock 1]");
			else output(" one hand on your [pc.cock 1] and the other wrapped around your leg for stability");
			output(", stimulating as much manhood as she can with what she has available to her. You briefly consider the possibility of shoving [pc.cock 1] into her maw alongside its brother...");
		}
		output(".");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nYou aren’t tight enough to make her yip in pain, but you’re tight enough that she can’t turn to one side or the other without twisting them. With your grip secured, you thrust forward, slamming your pelvis against Paige’s listless face, inundating her nose with ");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) 
		{
			output("your wet scent. You rub her face in your [pc.vagina], getting her acquainted with its every nuance");
			//if {pc.vaginas = 2}
			if(pc.totalVaginas() >= 2) output(", then you shift your [pc.hips] a bit to align her snout with your [pc.vagina 1], letting Paige know exactly what it is she’s getting into");
			if(pc.hasCock()) 
			{
				output(". [pc.EachCock] swings in the air under her weak grip, slapping into her forehead");
				if(pc.balls > 0) output(" and your [pc.balls] across the bridge of her nose");
				output(", spewing your pre-cum up and across her hair");
			}
		}
		//if (pc.hasVagina = false)
		else output("the scent and texture of your [pc.skinFurScales]. You have no dick to shove down her throat and no cunt to take advantage of her tongue, but in some perverse way, that makes your experience all the stronger, knowing that Paige is on her knees servicing <i>you</i> and not any set of genitals");
		output(".");

		output("\n\nPaige does not struggle in your grip or under your control; she dutifully sticks out her tongue, sliding it wetly ");
		if(pc.hasVagina())
		{
			output("into your [pc.vagina], eager to taste you and bring you pleasure. She moans into you, her lips sealing against your body to make sure that no drop of [pc.girlCum] is lost between you two. She makes a light chewing motion with her lips, tickling your vulva and using her upper lip to brush against your [pc.clit] with every pass");
			if(pc.hasCock()) output(". Her hands are busy, tending to [pc.eachCock]; despite your rampant humping against her maw and the mild discomfort of your grip on her Ausar ears, her hands are deft and sure, as if this sort of multitasking is second-nature to her and she’s been through worse");
			output(".");
		}
		//if (pc.hasVagina = false)
		else output("against your [pc.crotch], tasting what she finds there. She moans out, her vibrating tongue tickling at your pelvis as she does so, familiarizing herself with the canvas that is your body. She brings her hands up to your [pc.ass], at first holding onto the flesh she finds there for stability – then, without being coy about it, you feel one of her fingers crawl upward, into your cleft, seeking out your [pc.asshole]. You weren’t about to ask for that sort of attention, but hell, if that’s what she wants to make things even saucier for you two, you’re all for it.");
	}
	// Merge here
	output("\n\nPaige is really working you over; her mouth is too busy to tell you how much she’s enjoying it, but it’s clear from her actions that your overactive dominant position has energized her as well. You’re appreciative of Paige being beneath you, working you over with her skilled tongue – if she’s showing you just how much she enjoys it, surely you could return the favor and communicate to her just how much you enjoy being above her.");

	processTime(5);
	pc.lust(10);
	//[=Show Her=][=Jackhammer=]
	// end scene (scene: SSDYHE)
	clearMenu();
	addButton(0,"Show Her",SSDYSH,args);
	addButton(1,"Jackhammer",SSDYJH,args);
}

//[=Tell Her=]
// (scene: SSDYTH)
public function SSDYTH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYTH");
	output("<i>“Gods,”</i> you gasp out, shuddering helplessly under Paige’s ministrations. Your hands never leave her head, gripping her helplessly and playing with her loose hair. <i>“I can,”</i> you say, trying to think of something sexy to say. <i>“I can barely contain myself, Paige. Fuck, you’re</i> skilled.”</i>");
	output("\n\nPaige hums amusedly as she continues to work on you. <i>“Paige,”</i> you gasp, struggling to think of something. A ton of ideas come to mind, but you’re worried most of them would come off as mildly offensive – how do you politely tell someone that they’re a great");
	if(args[0] == 1) output(" cocksucker");
	else if(args[0] == 0) output(" box eater");
	else output("... uh... pelvis-licker");
	output("? Rationalizing that there <i>isn’t</i> a way to, you stop struggling and just say anything.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\n<i>“Are all the Ausar as good at sucking dick as you are? Or do you just know how to please a dick?”</i> She hums again, compacting her cheeks and making a long, exaggerated lick up ");
		if(pc.cLength(0) >= 11) output("every inch of your [pc.cock]");
		else output("every bit of [pc.cock] she can cram inside her mouth");
		output(". <i>“You have an amazing tongue... I don’t think I can go back to any other mouth in the universe after you.”</i>");

		output("\n\nPaige closes her eyes as she focuses on her work");
		if(pc.cockTotal() >= 2) output(", suckling on your [pc.cock] and alternating her motions with stroking your [pc.cock 1]");
		//if (pc.cocks >= 3)
		if(pc.cockTotal() >= 3) output(", and helplessly letting [pc.eachCock] bump against her features as she goes");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) output(". She crooks her fingers on her other hand, pushing at your sensitive vaginal walls, looking for your G-spot. You don’t know where it is, but your lips are pursed in sheer anticipation of her finding it");
		output(". <i>“You’re a bit of a fiend for cum. You must be, if you suck dick this well.”</i> Her fur stands on end slightly in the playful chiding, but her motions speed up, confirming you. <i>“");
		//if (pc.cumQuantity <= 299)
		if(pc.cumQ() <= 300) output("The good girl’s going to get her reward very soon");
		else output("Let’s see just how much, thirsty girl");
		output(".”</i>");
		if(pc.balls > 0) 
		{
			output(" Your [pc.balls] churn");
			if(pc.balls > 1) output(" with their");
			else output("s with its");
			output(" load, lifting high enough to slap Paige in the ");
			if(pc.cLength(0) <= 11) output("chin");
			else output("chest");
			output("; whenever she has a moment, she tickles along your [pc.sack], coaxing out your every drop.");
		}
	}
	// Continue here if Paige is focusing on the PC’s vagina
	else if(args[0] == 0)
	{
		output("\n\n<i>“Are all the Ausar this talented at eating cunts, or is it just you? Do you have a lot of experience with your mouth on a wet pussy?”</i> She hums again, bloating her tongue inside you to cover everything she can in one pass, before withdrawing her tongue and thrusting it back in. <i>“Stars, but you’re amazing... I don’t think anyone else will be able to compare to you. I don’t think I’ll be satisfied with anyone else.”</i>");
		output("\n\nWhether your words are true is irrelevant; the effect it has on Paige is obvious as she redoubles her pace and her efforts. ");
		if(pc.hasCock()) output("She alternates expertly between fucking your [pc.vagina] with her jerking off your [pc.cock], knowing just how hard to squeeze, and where, and when, timing her palm with her amazing Ausar tongue. ");
		//if (pc.hasBalls = true)
		if(pc.balls > 0)
		{
			output("Your [pc.balls] bounce");
			if(pc.balls == 1) output("s");
			output(" excitedly on the bridge of her nose, your [pc.cum] building up rather quickly as your release is just over the bend. She nuzzles against your taint lovingly, readying them and herself for your release. ");
		}
		output("You wince pleasurably, feeling your orgasm build up in your loins. <i>“You’re a good girl,”</i> you congratulate her, twirling her hair slightly for emphasis. Your breathing grows shallow in your excitement. <i>“Good girls get cookies.”</i>");
	}
	// Continue here if the PC is sexless
	else
	{
		output("\n\n<i>“You’re a very obedient girl, doing everything you get me off.”</i> You twirl her hair between your fingers for emphasis; Paige says nothing, focused on her task of bathing your crotch. <i>“If I had a dick, it’d be hard as diamonds. If I had a cunt, Gods, I’d probably be cumming already, you hot slut.”</i>");
		output("\n\nYou pet her. Not in a demeaning way, but more in a satisfied, pleased way. <i>“Something about not having either makes this... not better, but still... fucking hot. It’s hot, seeing you on your knees, getting me off even when I have nothing to get off with. It tells me you care. It tells me you</i> want <i>it. And I’d love nothing more than to give it.”</i>");
		output("\n\nDespite your lack of equipment, you feel something broiling in your loins. It reminds you of an orgasm, back when you had something to orgasm with, but different: more intense, but with a cooler undercurrent from the realization that your ‘quest’ for your orgasm isn’t going to end yet. <i>“I’m nearly there,”</i> you tell her. <i>“I don’t know where I’m nearly at, but you’re getting me there. Keep being a hot bitch and we’ll get there.”</i>");
	}
	// Merge here
	output("\n\nYour orgasm");
	if(args[0] == -1) output(" (or whatever it is)");
	output(" isn’t far off, and Paige knows it. Your [pc.hips] quiver beneath her, shaking in pleasure, ready to burst into her mouth, and she pulls out every stop to get you there. You remove your hand from her scalp, losing control over your fingers and toes in short order. You look down at Paige, watching her work on you with an intense, hungry fervor. It strikes you with inspiration, but... you’re so close! Do you even bother? Is it worth interrupting Paige?");

	processTime(5);
	pc.lust(10);
	//[=Offer=][=Climax=]
	// end scene (scene: SSDYTH); if [=Climax=], go to (scene: SSDYE)
	clearMenu();
	addButton(0,"Offer",SSDO2,args,"Offer","There’s nothing saying only one of you has to cum tonight...");
	addButton(1,"Climax",SSDYE,args);
}

//[=Show Her=]
// (scene: SSDYSH)
public function SSDYSH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYSH");
	output("Why tell Paige how good of a job she’s doing, when you can show her? She’s already ");
	if(args[0] == 1) output("blowing you");
	else if(args[0] == 0) output("eating you out");
	else output("beneath you");
	output("; you being a little more proactive is to be expected of you, really.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nYou massage ");
		//if {SSDYHH}
		if(InCollection("SSDYHH", args)) output("her scalp, playing with her hair");
		//if {SSDYHE}
		else output("her ears, flicking the flexible skin");
		output(" and you moan loudly and lewdly for her benefit. You hold Paige’s head still with one hand and grip ");
		if(pc.cockTotal() == 1) 
		{
			output("the [pc.knot] of your [pc.cock]. You point it inside her maw, rubbing your tip against the roof of her mouth and along the inside of her cheeks before laying it flat on her tongue, rubbing it against her. Your orgasm is incoming, and you reward her still obedience with a hot splurt of pre-cum");
		}
		else if (pc.cockTotal() >= 2)
		{
			output("your [pc.cock 1] with your other. You grunt as she works you over, licking and sucking, playing with your [pc.cock] with her tongue; you bathe her tongue with pre-cum while your second cock shows its adoration by shooting its own into her hair and across her cheek, which she takes without resistance");
			if(pc.cockTotal() >= 3) output(". The rest of your [pc.cocks] flop about, hard as nails and neglected, their own brands and juices going every which way as your [pc.hips] rock into her mouth");
			else output(". You’re hard as nails, your [pc.hips] rocking into her mouth, signs of your impending orgasm just on the horizon");
		}
		output(".");

		output("\n\nPaige moans as you control her, sending good vibrations down your dick");
		//if (pc.hasBalls = true)
		if(pc.balls > 0)
		{
			output(", bubbling the cum in your [pc.balls], getting ");
			if(pc.balls > 1) output("them");
			else output("it");
			output(" ever closer to release");
		}
		output(". You play with her hair as you hump her face, running your fingers messily and wantonly through her strands, exaggerating your motions intentionally. Your breathing deepens and your thrusting grows fiercer");
		if(pc.cLength(0) <= 11) output(", your [pc.crotch] slapping her on the nose as you slip every inch of yourself down her gullet");
		else output(", doing everything you can to impiously stuff your entire length into her mouth");
		output(".");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nYou rock your [pc.hips] back and forth, squeezing your thighs together to keep Paige in place");
		if(pc.hasVagina()) 
		{
			output("; you crunch your [pc.stomach] in an effort to lock her tongue deep inside your snatch. Your hands are clamped to ");
			//if {SSDYHH}
			if(InCollection("SSDYHH", args)) output("her scalp, toying with her hair");
			//if {SSDYHE}
			else
			{
				output("her ears, flicking the flexible skin as you hump her face, your [pc.clit] slapping against her nose repeatedly in your horny fervor");
				if(pc.totalVaginas() == 2) output(". Your [pc.vagina 1] squeezes against Paige’s cheek, soaping her fur with your girlish lube, demanding the same attention Paige is showing her sister, yet she only has one tongue to use on you");
			}
			output(".");
		}
		if(!pc.hasVagina())
		{
			output(" as you abuse her mouth with her crotch. You rub against her lips and you scrunch against her nose as her tongue slathers you, soaking you and imprinting the taste of your [pc.skinFurScales] on her tongue. She goes with it – more along for the ride for your pleasure than really having much input herself.");
		}
		output("\n\nShe moans, sending good vibrations up your body. Your breathing grows shallow and hurried as you pump against her, the familiar tingling of your orgasm bubbling in your loins. ");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) output("Your feminine pre drips onto Paige’s eager tongue, never going dry and never quenching her thirst. Your clamped hands draw her hair into knots as you ride her mouth, [pc.hips] gyrating quickly out of control.");
		else output("It’s been a long time since you’ve had a proper one, and you’re not positive this will be any different, but the sensation – the heat building in your crotch, ready to peak and spill over some imaginary edge – is impossible to categorize as anything else.");
	}
	// Merge here
	output("\n\nYou’re giving off all the telltale signs of one of the biggest orgasms");
	if(args[0] == -1) output(" (or something like it)");
	output(" of your life, and Paige knows it. She hears your heartbeat against her cheeks and in her mouth, assaulted on all angles by your body. Your fingers dig into her head unintentionally and your toes go numb. Her tongue goes overtime on you, covering as much surface as she can with every pass, bringing you closer, and closer, until....");

	processTime(5);
	pc.lust(10);
	//[=Climax=]
	// end scene (scene: SSDYSH); go to (SSDYE)
	clearMenu();
	addButton(0,"Next",SSDYE,args);
}

//[=Jackhammer=]
// (scene: SSDYJH)
public function SSDYJH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYJH");
	output("The position Paige has put yourself in, and the position she’s put herself in, kind of get to you, and you let it. She’s little more than a warm, wet mouth and a wriggling tongue for your pleasure, and her pointy Ausar ears are the perfect handlebars. You’re horny, and Paige has offered to get you off. That’s about all you need to focus on right now.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nYou rear your [pc.hips] back, holding Paige steady. She grunts in confusion as you leave just your tip in her mouth. She rolls with it, licking at it gently – and then you thrust in");
		if(pc.cLength(0) <= 11) output(", practically punching Paige in the teeth with your [pc.knot]");
		else output(", ramming in until your head punches her in the soft palette. You only stopped from going further because you had the sense to");
		output(". Her eyes go wide, and she sputters around your thick shaft, but you don’t stop: you pull out again, then ram back in hard");
		//if (pc.cocks >= 2)
		if(pc.cockTotal() >= 2) output(". [pc.EachCock] flops and slaps against Paige loosely, taken for the ride, sputtering their pre-cum all through the air, through her hair, and all across her face");
		//if (pc.hasBalls = true)
		if(pc.balls > 0) output(" as your [pc.balls] audibly slap her in the chin with every thrust");
		if(pc.hasVagina()) output(".\n\nPaige’s fingers are still locked in your [pc.vagina], bless her, but, taken as ferociously and so suddenly as she is, she doesn’t have the wherewithal to maintain her thrusting or playing and just has them sit in there. That’s fine. You’ll manage");
		output(".");

		output("\n\nYou treat Paige as little more than an object for your pleasure: your hips jackhammer against her, bruising her lips and making her gag every time you ");
		if(pc.cLength(0) <= 11) output("bottom out");
		else output("hit her limit");
		output(". Her own breathing grows shallow and needy as time goes on: she takes deep huffs every time you pull out and tries to hold her breath when you’re in. You grunt in animalistic need as you plough her mouth, ignoring the displeasure of your [pc.hips] battering into her face");
		if(pc.balls > 0) output(", and the general sting of your [pc.sack] slapping her in the chin");
		//if (pc.cocks >= 2)
		if(pc.cockTotal() >= 2) output(", and [pc.eachCock] wagging in the air, directionless and slapping against her every facial feature");
		output(". You just need to cum!");
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nYou keep Paige’s head still and pull your [pc.hips] away from her, far enough to withdraw her tongue. She hums in curiosity, keeping her tongue out and panting for you – and then you thrust back onto her face, ");
		if(pc.hasVagina()) 
		{
			output("slamming your [pc.vagina] onto her unsuspecting tongue. You grunt out, half in sexual ecstasy and half in some sort of primal victory, as you conquer Paige’s face with your cunt in one messy, wet, borderline visceral swing. It feels so good that you rear back to do it again");
			//if (pc.hasCock = true)
			if(pc.hasCock()) output(". You don’t even care that [pc.eachCock] isn’t getting anything out of the whole ordeal other than waving in the air impetuously, spewing its pre-cum every which way");
			output(".");
		}
		else output("slamming your [pc.crotch] onto her unsuspecting tongue. You grunt out, half in sexual ecstasy and half in some sort of primal victory, as you conquer Paige’s face with your blank crotch in one hard, borderline aggressive swing. You don’t know what it is that’s making you act like this: Paige going down on you isn’t exactly as fulfilling as when you had genitals, but, just something <i>about</i> the scenario is rising something inside you – something akin to an orgasm. Or, what you remember an orgasm to be.");

		output("\n\nPaige goes limp under your control, staying still in your grip with her tongue out for you to fuck. ");
		if(pc.hasVagina()) 
		{
			output("You impale yourself on her tongue again and again, relishing in the act more than the sensation of her listless tongue doing any work. Your fluids splash across her nose, drowning her nostrils in your scent, while more than a little bit collects on her tongue before washing down her throat. In just a moment, there will be a whole lot more where that came from");
			//if (pc.hasCock = true)
			if(pc.hasCock()) output(".\n\nThe same tingling builds in [pc.eachCock], starting at their base, inside your crotch, and quickly making its way up. You hope Paige enjoys getting messy");
			output(".");
		}
		else output("Like you had hoped, the tingling sensation of an orgasm is building quickly inside your [pc.crotch]. It’s not going to have an outlet, and it’s tempered somewhat by that fact, but it’s coming. It’s been a very long time since you’ve felt anything akin to a proper one, and this one is shaping up to come very, <i>very</i> close.");
	}
	// Merge here
	output("\n\nIt’s only a matter of a few more humps against Paige’s pliant, obedient face, until your orgasm is knocking on your door. You grunt out something akin to a warning, but it comes out as gibberish, and you doubt Paige has enough sense in her battered head to understand you anyway. Two more pumps, then one, and then... well, you just hope Paige can hold her breath, because....");

	//[=Climax=]
	// end scene (scene: SSDYJH); go to (scene: SSDYE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSDYE,args);
}

//[=Climax=]
// (scene: SSDYE)
public function SSDYE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDYE");
	output("You do Paige the courtesy of tapping on her head, telling her with your hands when your mouth is too dumb to move, that you’re about to cum. In response, Paige takes a practically Zen, calm and relaxed posture, minimalizing her movements on your sex. She’s ready to take whatever you’ve got in her mouth, and you’re ready to give it to her.");

	// Continue here if Paige is focusing on the PC’s penis
	if(args[0] == 1)
	{
		output("\n\nYour [pc.legs] tense enough to lift your ass off the mattress of her bed, thrusting your meat deeper into her maw to deposit your load.");
		if(pc.cumQ() < 300) 
		{
			output(" You feel your [pc.cock] bloat with your [pc.cum], spewing pulse after pulse into Paige’s gullet. ");
			//if (pc.CockLength <= 11)
			if(pc.cLength(0) <= 11) output("You hear her sigh through her nose as she handles your liquid love easily, taking only a moment to savor your flavor before swallowing and taking the next batch");
			else output("She struggles to breathe through the area of your cock, and pulls away, just enough so that your [pc.cockHead] isn’t battering her throat – and so she can get a taste");
			output(".");
		}
		//if (pc.cumQuantity >= 300)
		else
		{
			output(" Your [pc.cock] expands with each burst of fresh [pc.cum], immediately saturating Paige’s mouth with your seed. She audibly struggles at first, gulping down each shot as quickly as she can, but her throat is too slow, and you feel your cum start to pool and spill from the corners of her mouth");
			if(pc.cumQ() >= 600) output(". You’re impressed she’s handling you as well as she is – it sounds like a real challenge down there. You’re almost sorry that you’re not even halfway done");
			output(".");
		}
		//if (pc.cocks >= 2)
		if(pc.cockTotal() >= 2) output(" The rest of you not lodged in her mouth shoots your load every which way: across her cheek, over the bridge of her nose, in her hair, across her eyes, and, with some manual handling, down her cleavage. She’s focused primarily on the one in her mouth and does nothing to stem or redirect the flow of your... enthusiasm.");
		//if (pc.hasVagina = true)
		if(pc.hasVagina()) 
		{
			output("\n\nYour [pc.vagina] clenches around her fingers, deluging her hand up to her wrist in your [pc.girlCum]. It spasms uselessly, jealous at her lucky brother");
			if(pc.cockTotal() > 1) output("s");
			output("; you cum from your feminine half with nothing but Paige’s useful fingers and the residual pleasure coming from your masculine half.");
		}
		paige.loadInMouth(pc);
	}
	// Continue here if Paige is focusing on the PC’s vagina, or if the PC is sexless
	else
	{
		output("\n\nYour [pc.legs] tense enough to lift your ass off the mattress of her bed, thrusting your ");
		if (pc.hasVagina()) 
		{
			output("[pc.vagina] against her lips and explorative tongue to squirt your [pc.girlCum] as thoroughly into her mouth as you can. Paige doesn’t let up through the whole thing, assaulting your quim and attacking your [pc.clit] through the whole thing, squeezing a second orgasm out of your first, then a third out of your second, happily gulping down every feminine load she can");
			if(pc.hasCock()) output(".\n\n[pc.EachCock] spasms jealously, raining your [pc.cum] down every which way as she attentively milks you, spraying your cum in the air and back down onto her, across her face and in her hair. She’s ultimately distracted by your cunt, but she knows exactly where to touch and press against you to get that last little bit of cum out of you and somewhere else in the room");
			output(".");
			paige.girlCumInMouth(pc);
		}
		//if (pc.hasVagina = false)
		else output("[pc.crotch] against her face. Your [pc.legs] tense, and suddenly you’re bucking and bouncing helplessly as what is <i>definitely</i> an orgasm rips through you, from your crotch, up your spine, and up your neck. It’s all too familiar: the crunching in your abdominals and the tensing between your legs, followed by a ticklish sensation all over your body. Paige doesn’t stop licking and kissing your blank crotch, enhancing the sensation as best as she can, and it works: you ride out your long-lost orgasm for as long as you can, knowing that it’ll probably be a while you’ll feel this again – assuming Paige doesn’t work her witchcraft on you.");
	}
	// Merge here
	output("\n\nYou hump against Paige’s mouth a few more times, eking out the last little bit of your pleasure, dumping every bit of cum into your slutty Ausar as you can. It takes a little while, but after a few more pumps, you’re satiated; you slump backward, flopping onto Paige’s bed as you exhaustively catch your breath");
	//if {Getting sucked off}
	if(args[0] == 1) output(", still hard but growing soft");
	else if(args[0] == 0) output(", still wet and kind of horny but becoming sensitive");
	output(".");

	processTime(10);
	pc.orgasm();
	//[=Afterglow=]
	// end scene (scene: SSDYE); go to (scene: SSDYAG)
	clearMenu();
	addButton(0,"Next",SSDYAG,args);
}

// (scene: SSDYAG)
public function SSDYAG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You’re not sure how much time passed – you might have blacked out. Eventually, you feel Paige crawl her way up your body, onto the mattress, and on top of you");
	if(args[0] == 1 && pc.cumQ() >= 800) 
	{
		output(". Her normally flat, toned belly is replaced with a noticeable paunch full of cum. You hope you didn’t ruin her figure");
		if(silly) output(", but hell, it can’t be any worse than her protein shakes, you figure");
	}
	output(". She eyes you");
	if(paigeBlind()) output(" (generally) with a satisfied look of her own, smiling confidently, her eyes half-lidded. She exaggeratedly licks her lips for show");
	if(args[0] == 1 && pc.cumQ() >= 300) output("; as she does, a burp takes her by surprise. You both can’t help but chuckle a bit");
	output(".");

	output("\n\n<i>“");
	//if {SSDYJH}
	if(InCollection("SSDYJH", args)) output("Damn,”</i> she says, rubbing her lips and wincing slightly. <i>“You got pretty intense at the end, there. If you lasted a minute or two longer, I might be eating through a straw for the next few days");
	else output("Another satisfied student,”</i> she says haughtily, rubbing her lips with the back of her wrist. <i>“Gods, I’m not gonna lie, but I missed going down on a sweet thing like you. Does that make me a slut? I think I’m okay with that");
	output(".”</i> You say nothing, and instead wrap your left arm around Paige, holding her close to your body. She drapes her leg over your waist, none-too-subtly rubbing her cooch against you, letting you know exactly how horny she is.");

	output("\n\n<i>“");
	//if {SSDYHE}
	if(InCollection("SSDYHE", args)) output("I love it when you take charge,”</i> she tells you, trailing a finger down your [pc.chest]. <i>“Putting a hot little number like me on my knees and controlling me like that... I’m all for being up top, but heavens if being the bottom isn’t a huge thrill sometimes. Just... be a little gentler on the ears next time, okay? Just a little.");
	//if {SSDYTH}
	else if(InCollection("SSDYTH", args)) output("You know what one of the sexiest things a [pc.guyGirl] can do when you’re going down on them is?”</i> she asks rhetorically. <i>“It’s all the noises. The moaning; the grunting; telling you you’re pleasuring them. Stars above, that got me so</i> hot. <i>Talk to me more next time, sweet thing.");
	else output("I dunno if it’s just that I haven’t done that in a dog’s age, [pc.name], but you might have to tell me what it is you’re eating,”</i> she tells you, errantly playing with a [pc.nipple]. <i>“It was delicious. Or maybe I’ll just keep eating you. Call me crazy, but I think you might be okay with that.");
	output("”</i>");

	if(args[0] == -1) output("\n\n<i>“I got a question for you.”</i> You could probably guess what it is, but you ask her to ask you. <i>“Did you really get off from me going down on you? You don’t have anything to get off with. Life must be tough for you.”</i> You admit that it’s... hard. But it comes with its own occasional thrills that you can’t rightly explain. You also answer her question affirmatively: you definitely just got off from that.\n\nPaige leans back and grins like a fool at the news. <i>“I can’t believe that I’m</i> so good <i>at going down that I brought off someone that doesn’t have any!”</i> she exclaims. <i>“I could damn near put that on a resume!”</i>");

	output("\n\nYou lie together for a few more moments, coming down from your orgasmic high and Paige enjoying the afterglow of a job well done. After a few minutes, you check your codex for the time, then pull yourself to your [pc.feet]. Your lower stomach is notably lubricated with Paige’s own juices. <i>“Don’t forget,”</i> Paige says, slapping you on the [pc.ass] as you get your effects back on you, <i>“you owe me one.”</i>");
	// end scene (scene: SSDYAG); reduce Lust to 0; advance clock by one hour; place PC one square outside Paige’s Unit
	processTime(60);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Down On Her=]
// No requirements
// Tooltip: You wouldn’t mind going down on Paige this time. She’d probably love to hear you say that.
// Action tree: http://i.imgur.com/ZFDGGg3.png
 // (scene: SSDH)
 public function SSDH():void
 {
 	clearOutput();
 	showPaige(true);
 	var args:Array = [];
 	IncrementFlag("SEXED_PAIGE");
 	output("You let Paige – your hot, horny Ausar lover – grind on you a moment longer, teasing you both until you’re good and ready. You fuck her with your eyes, watching her titties bounce and jiggle as she grinds on you, and the way her abs crunch into perfectly defined squares as she rocks forward. Every part of her looks delicious and the feel of her slippery wet sex against your body gets you a little parched.");
 	output("\n\n<i>“I’m in the mood for something a little different,”</i> you say to her, trying to sound a little mischievous. It works: Paige doesn’t stop but hums inquisitively. <i>“How about you get on this bed, spread your sexy yoga legs, and I eat you out like I’m starving?”</i>");
 	output("\n\nHer ears perk straight and stiff as her eyes grow wide. <i>“Hell no!”</i> she says, <i>“is there any way I’m saying no to that!”</i> You both laugh – she nearly got you that time. Paige is markedly more eager than you are at your invitation; she practically vaults off you, twisting her body and flopping backside-first onto her bed. She follows your instruction and spreads her legs, showing you to her glistening pussy, already dripping for you.");
 	output("\n\nWell, don’t mind if you do. You shuffle off her bed, turning around and sitting on your knees, wedging yourself between her spread legs. Paige idly tweaks her clit as she waits for you to close the gap between her hungry maw and your own. You could dive right in and fuck the foreplay, of course... but what’s the rush?");

 	processTime(5);
 	pc.lust(10);
	args.push("SSDH");
 	//[=Tease=][=Dive In=]
	// end scene (scene: SSDH)
	clearMenu();
	addButton(0,"Tease",SSDHT,args);
	addButton(1,"Dive In",SSDHDI,args);
}

//[=Tease=]
// (scene: SSDHT)
public function SSDHT(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHT");
	output("Paige is butt-naked, legs spread, playing with herself, with her cunt just centimeters from her face. She’s dripping her lady lube all over her bedsheets and down her taint. Her vulva is red and damn-near inflated with her horny need. You could probably smell her familiar Ausar tang from three airlocks away. But do you know what Paige <i>really</i> needs? More teasing, of course.");
	output("\n\nYou place both hands on her thighs before leaning in. Paige tenses in suspense, ready to feel your tongue inside her, and you don’t give it to her. Instead, you nudge her fingers away from her cunt, giving you unabated passage to her tunnel – then you nuzzle your nose into her, inhaling deeply. The message is clear and the bodily response is immediate: y");
	if(pc.hasCock()) output("our [pc.cock], previously at half-mast, becomes hard as diamonds, ready to inseminate this perfect specimen of an Ausar in front of you");
	if(pc.isHerm()) output(". Likewise, y");
	if(pc.hasVagina()) output("our [pc.vagina], initially confused by the feminine musk, soaks itself at the opportunity of meeting this sexy stranger personally and intimately, ready to mingle with hers at the drop of a hat");
	if(!pc.hasGenitals()) output("ou’d burn a hole through your pants immediately if you had anything to burn them with. And you were wearing pants right now");
	output(".");
	output("\n\n<i>“[pc.name]~”</i> Paige whines, thrusting her hips against your face, smearing her juice across your features. <i>“I don’t need teasing, you asshole! I’m wet enough to drown a Galotian, just hurry up and eat me out like you promised!”</i>");
	output("\n\nYou entertain yourself a bit more, letting Paige have her way with your face without much effort on your part. Paige plays with your [pc.hair] as she does, directing your face as she humps it. You drum your fingers on her thighs, inching them closer to her treasure – she’ll get a little more than a mouth on her, if that’s what she really wants.");
	output("\n\nStill, that act of huffing her musk has had its effect on you. You’re a whole lot hornier now than you were before; maybe Paige wouldn’t mind spicing this up a little bit?");

	//[=In Her Cooch=][=Offer=]
	// end scene (scene: SSDHT); increase Lust by 20
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"In Her Cooch",SSDHIHC,args);
	addButton(1,"Offer",SSDO1,args,"Offer","It takes two to tango, after all! Ask Paige if she’s into a bit of 69 action.");
}

//[=Dig In=]
// (scene: SSDHDI)
public function SSDHDI(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHDI");
	output("Paige is butt-naked, legs spread, playing with herself, with her cunt just centimeters from her face. Honestly, you don’t need a written invitation: she wants a goddamn tongue in her cunt, and by Gods, you have a tongue that wants to be in her cunt.");
	output("\n\nYou lean in, but before you get to it, you snake both your hands around her waist, aiming for the fat of her ass (not that there’s much of that, toned as she is), gripping onto it for stability. <i>Then</i> you dive right in: your nose bumps against her clit unceremoniously as your [pc.lipsChaste] mesh with her labia, forming the perfect seal for your tongue to spear into her.");
	output("\n\nPaige tenses in suspense, then struggles to maintain her voice, ready to cry out in pleasure as you work her over. Her taste in uniquely Paige, a flavor you can’t describe but instinctually crave more of: your [pc.tongue] wriggles inside her, desperate to get every drop she’s secreting, collecting on its broad side before trickling slowly down your tastebuds and into your flexing mouth. You twist your tongue to the side and start all over again.");
	output("\n\n<i>“Holy shit,”</i> Paige says, already panting at your ministrations. You have enthusiasm, finesse, and technique, but eating out your woman is hardly an exact science: you fuck her with your tongue, doing tricks and pulling stunts that no dick could hope to achieve");
	if(pc.hasCock() && pc.cocks[0].hasFlag(GLOBAL.FLAG_PREHENSILE)) output(" (except maybe yours)");
	output(". You already have her squirming underneath you, and you’ve both only just started.");

	output("\n\nYou grope at her ass, pulling at her taut skin there. As you adjust your grip, your fingers get a little deeper into the cleavage of her butt than you meant, but it gave you an idea. You have more than just a tongue – now, where to put your fingers to work....");

	//[=In Her Cooch=][=In Her Ass=]
	// end scene (scene: SSDHDI)
	clearMenu();
	addButton(0,"In Her Cooch",SSDHIHC,args);
	addButton(1,"In Her Ass",SSDHIHA,args);
}

//[=In Her Cooch=]
// (scene: SSDHIHC)
public function SSDHIHC(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHIHC");
	//if {SSDHT}
	if(InCollection("SSDHT", args)) output("You promised that this time would be about her – it’s disappointing and a little painful, but you put your own needs aside for now. You have a pussy to please!\n\n");
	output("You back up a little bit");
	//if {SSDHDI}
	if(InCollection("SSDHDI", args)) output(", much to Paige’s confusion, so you can replace your tongue with");
	//if {SSDHT}
	else if(InCollection("SSDHT", args)) output(", slipping your hand against her peach, aligning");
	output(" your finger against her mons and between her plump lips. You play with her a bit, enjoying the feminine squeaks above you, loving how her muscles ripple with pleasure all around you. But, she needs more than a finger, and you wouldn’t be satisfied with just this either.");
	output("\n\nYou don’t remove it, and instead introduce your tongue into her");
	//if {SSDHDI}
	if(InCollection("SSDHDI", args)) output(" again");
	output(", using both to find all those hidden contours in the tunnel of her crotch. It takes a bit of multitasking, but you alternate directions with your limbs, swinging your hand to the left when your tongue goes right. You also rub your [pc.lips] against her, massaging her outer lips with your own.");

	output("\n\nThe bedsheets around Paige’s hands become noticeably disheveled as she grips and regrips the fabric in an effort to control something. Her legs lock behind your neck, making sure you’re not pulling away a second time, not that you had much intention to. Her breathing is ragged and she’s cursing lightly under her breath. It’s all music to your ears and candy to your mouth.");

	output("\n\nDespite your best efforts to maintain control and utilize everything in your power to make it a good time for her, it’s difficult to not get lost in the sensations: the flavors, the scents, the sounds and the sights have you drifting into a horny, borderline euphoric stupor as you eat her out. Only when Paige huskily shouts out, <i>“[pc.name],”</i> do you have the sense to recognize just how vulnerable Paige is. You could really work with that....");
	//[=Get Aggressive=][=Nice & Easy=]
	// end scene (scene: SSDHIHC); increase Lust by 20
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Get Aggressive",SSDHGA,args);
	addButton(1,"Nice & Easy",SSDHNANDE,args);
}

//[=In Her Ass=]
// (scene: SSDHIHA)
public function SSDHIHA(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHIHA");
	output("She’d never see it coming.");
	output("\n\nYou maintain your course for a moment, going down on her with a thirsty intensity that has her squirming and insensate. You withdraw your tongue and make a long, broad lick straight up between her labia – as you do, you adjust your grip, then strike, slipping your middle finger deep enough into her cheeks to find her star.");
	output("\n\nShe tenses and yips in surprise, making your entry a little difficult at first: just shy of your first knuckle. You wriggle your tongue and your finger in time with each other, judging Paige’s reaction as you do. Her ‘reaction’ is to relax once she realizes what you’re doing, giving you an easier time into her rear. ");
	//if {PC has seen SSAP3}
	if(flags["PAIGE_RIMMING"] == 3) output("<i>“Really,”</i> Paige says when she has the control to speak between gasps, <i>“considering how much you’re into butt stuff, I should have figured you’d try this. My fault for giving you the opportunity.”</i>");
	output("\n\nHer compliance gives you the entry you need, and you worm yourself inside, up to your second knuckle, then giving her a chance to adjust before sinking up to your third. <i>“I kinda,”</i> she gasps out as you work her over from both ends. <i>“I kinda wonder what it’d be like to have a dick. Prostates are pretty fun to have, I hear.");
	//if {PC has seen SSAP3}
	if(flags["PAIGE_RIMMING"] == 3) output(" Would have been a good time, knowing how often you’re back there.");//Fukken tease.
	output("”</i>");

	output("\n\nYou continue your assault, eating her wet box and fucking her butt with your middle finger, wriggling both appendages every which way when they’re deep inside her. Paige is open and vulnerable to anything else you can throw at her. There isn’t much more that comes to mind, other than getting more aggressive with your current course. Well... no, there is <i>one</i> thing. You have a free hand. Women may not have prostates, but they have buttons. Maybe you’ll find out just how wild you can make this for her if you press it.");

	processTime(5);
	pc.lust(10);
	//[=Get Aggressive=][=Push The Button=]
	// end scene (SSDHIHA)
	clearMenu();
	addButton(0,"Get Aggressive",SSDHGA,args);
	addButton(1,"PushTheButton",SSDHPTB,args);
}

//[=Nice & Easy=]
// (scene: SSDHN&E)
public function SSDHNANDE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHN&E");
	output("You dial it back just a little: eating out a woman is an experience, and it’s not something that you want to burn through lickety-split. You <i>could</i> really dive into her, and she’d probably cum waterfalls, but why not make it a little more meaningful than just a dine-and-dash?");
	output("\n\nPaige, eyes unfocused and crazily scanning the room");
	if(paigeBlind()) output(" (more as a reaction than anything)");
	output(", releases her ironclad grip on her bedsheets and finds your free hand, squeezing you lovingly as your actions lull slightly and tightening in pleasure when you find a weak spot of hers. She gasps out your name a few more times as she reflexively fucks your face, her hips following your mouth and exploring tongue.");
	output("\n\n<i>“Gods above, you are an</i> angel, <i>you know that?”</i> she asks breathlessly. You don’t stop – she would’ve scolded you if you did. <i>“Or maybe a devil? Do angels eat pussies? Would they eat them as good as you? Maybe you’re something in between.”</i> She starts laughing in between her carefree moans. <i>“I think those are called ‘mortals.’ Listen to me! You’ve got me so riled up, I’m saying the first bullshit thing that pops into my head!”</i>");
	output("\n\nYou smile but don’t respond, continuing your task. Paige’s thighs are clenching a little tighter around your head and her reflexive jerks against your face are getting more and more pronounced. <i>“If there’s any one thing I can say that makes total sense,”</i> she says, her voice quaking and her body jerking, <i>“it’s that I’m nearly there. I’m... I’m about to cum, [pc.name]!”</i>");
	output("\n\nYou think quickly. You believe her completely – the signs are all there – but, the fact remains, you’re horny as hell yourself and Paige probably wouldn’t turn you down if you wanted to finish this session off in style. Do you risk slowing things down enough to make it a party, or do let Paige have her big finish?");
	//[=Climax=][=Offer=]
	// end scene (scene: SSDHN&E); if [=Climax=], go to (scene: SSDHE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Climax",SSDHE,args);
	addButton(1,"Offer",SSDO2,args,"Offer","There’s nothing saying only one of you has to cum tonight...");
}

//[=Get Aggressive=]
// (scene: SSDHGA)
public function SSDHGA(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHGA");
	output("Fuck it: you’ve got Paige on the edge of one of the biggest climaxes of her young life");
	//if {SSDHIHA} 
	if(InCollection("SSDHIHA", args)) output(" (along with a finger in her tight ass)");
	output(". She doesn’t need more teasing; she doesn’t need to be pushed harder than you already are; and the last thing she needs is for you to slow down. Time to double-down on your bitch!");
	output("\n\nThe finger in her pussy is taking up room that should be used for your tongue. You start by taking it out and slapping your [pc.lips] against her labia, thrusting your pink, squishy muscle as deeply as you can. You twist it and turn it, tracing and tickling the ridges and muscles you find inside Paige’s vagina, doing your level best to find her elusive G-spot.");
	output("\n\n<i>“Fuck!”</i> Paige exclaims, panting helplessly, her hips moving on their own, following your every move. When your tongue goes left, she leans left, but only slightly and subconsciously. While your tongue squirms inside her, you move your yawning jaw broadly, covering her delicate outer folds as thoroughly as possible.");
	output("\n\n<i>“I’m cumming!”</i> she all but shouts, sitting up on her elbows, then collapsing, then sitting up again, unable to find a comfortable position as she arrives. <i>“Gods, [pc.name], I’m cumming! Just a little more, baby, gimme what I need!”</i> You lean forward, bloating your tongue fat inside her and using your nose to push against her clit, sending those last little shocks through her system to achieve what you want.");
	output("\n\nAnd you get it.");
	//[=Climax=]
	// end scene (scene: SSDHGA); go to (SSDHE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSDHE,args);
}

//[=Push The Button=]
// (scene: SSDHPTB)
public function SSDHPTB(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHPTB");
	output("Come on, what’s the fun in <i>not</i> pushing buttons? Paige is already so horny she’s ready to pass out. You’re curious as to what would happen if you drove her further.");
	output("\n\nYou keep up your alternating pace between your tongue in her cooch and the finger in her tight ass, but you withdraw the finger alongside your mouth. Paige doesn’t seem to care; you make a show of slipping the finger in your mouth and sucking it clean");
	//if {Paige is blind}
	if(paigeBlind()) output(", not that she can see it");
	output(" before running your moist hand up her thigh, inching it closer to her occupied quim – and then snaking a finger up and onto her clit.");

	output("\n\nShe hisses noisily, arching her back. Each one of her six chiseled abs pop out from beneath her fur as every muscle in her body clenches at your intrusion, but you don’t stop. You’re gentle, but insistent, rubbing her one way until it stops giving, then rotating it another way. You increase your speed with every circle, and in no time, Paige’s hips are following you, going in shallow, lazy circles with her clit.");
	output("\n\n<i>“I’m close!”</i> she says through halting breath. You close your thumb onto the other side of her clit, pinching it just slightly, ");
	if(pc.hasVagina()) output("knowing exactly how much force to apply for the best results");
	else
	{
		output("ballparking how sensitive a clit is");
		if(pc.hasCock()) output(", assuming it to be about as sensitive as the glans on a dick");
	}
	output(". Paige covers her mouth with her arm to stifle the noises she’s making.");

	output("\n\nAll the while, your tongue is digging into her like she’s got buried gold inside her, and you use the finger in her ass to influence when to thrust against your mouth. You come at her from all angles, her edge just moments away and closing fast. Everything you do to her overloads her senses, and she’s tensing again, her breathing stopping entirely, her vagina clenching on your face–");

	//[=Climax=]
	// end scene (scene: SSDHPTB); go to (scene: SSDHE)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSDHE,args);
}

//[=Climax=]
// (scene: SSDHE)
public function SSDHE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDHE");
	output("Paige grunts once, long and drawn out. Her body becomes rigid, from her hands displacing the sheets to her hard thighs wrapping around your head. She quakes and vibrates on the spot in pleasured effort.");
	//if {SSDHIHA}
	if(InCollection("SSDHIHA", args)) output(" Her ass clenches hard, vacuuming your finger trapped inside her.");
	output(" You’re intimate with the one part of her body that <i>isn’t</i> relatively still.");

	output("\n\nPaige’s feminine Ausar cum floods from her, gushing from her wet depths and onto and down your tongue, washing into your willing maw. The taste caking your tongue is overridden by the sterner ambrosia she’s squirting into you; her juices leak from the sides of your mouth, not because of the volume but because her constantly shaking body disconnects you long enough to get it onto your face, your shoulders, and onto her bed.");

	if(pc.hasVagina()) output("\n\nJust as you had hoped, Paige cums again,");
	else output("\n\nYou’re not certain if Paige is cumming a second time or if it’s just one really long one, but");
	output(" the intensity of her quivering maintain");
	if(pc.hasVagina()) output("ing");
	else output("s");
	output(" through it all. It lasts for a lot longer than you had anticipated, and you gladly let her fuck your face through it all, depositing her next girlish load onto your tongue as you’re halfway through swishing and swallowing the last.");

	pc.girlCumInMouth(paige);
	pc.girlCumInMouth(paige);

	output("\n\nMoments later, though her body is calming, she’s still going, her convulsions growing weaker and weaker. You hear her gasp, shucking in huge lungful’s of air as she remembers to breathe. Your frantic tongue-thrusting slows with her, turning from full-on fucking to gentle licks and caresses, soothing her down.");
	//if {SSDHIHA}
	if(InCollection("SSDHIHA", args)) output(" Once she relaxes enough, you slowly withdraw your hand from her ass, giving her cheek a squeeze as you return it to your side.");

	output("\n\nFinally, Paige comes to a rest on her bed, heaving in exhaustion and with nothing more to milk from her sensitive folds. You pull away from her crotch, a stupid, satisfied grin on your sore jaw at the sight of a job well done. You don’t even mind that you won’t be tasting anything else for a couple hours.");

	//[=Afterglow=]
	// end scene (scene: SSDHE); go to (scene: SSDHAG)
	processTime(5);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",SSDHAG,args);
}

// (scene: SSDHAG)
public function SSDHAG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("You slink the way up the bed and up Paige’s heaving body, mapping the way up her shaking belly and through her cleavage with your nose, until you’re face to face with your Ausar lover. The look on her face – eyes closed, mouth curled in a gentle smile, cheeks practically glowing – of total satisfaction, has the goofy grin of your own return from earlier. Being proud of a good job is one thing, and knowing that someone else appreciates it is another, but there’s something carnal and rooted about your pride when it comes to sexually pleasing your partner, and you couldn’t be feeling it more when you look at her.");
	output("\n\n<i>“Holy shit,”</i> she says, looking at you");
	//if {Paige is blind}
	if(paigeBlind()) output("r general direction");
	output(" as she comes down from her sexual high. She heedlessly hooks an arm around your shoulders, bringing you crashing onto her tight body for a lazy cuddle. <i>“Good Gods, you are some kind of karmic reward or something, [pc.name],”</i> she says, her weak arms curling around you as she spoons into your naked body");
	if(pc.hasCock()) output(", her tired and oversensitive cunny just millimeters from your hot and hard [pc.cock]");
	else if(pc.hasVagina()) output(", your neglected and lonely [pc.vagina], dripping and hot, coming just millimeters from her satiated own");
	output(".");

	output("\n\n<i>“You should teach classes,”</i> she says, making idle conversation while she unwinds and you two cuddle. <i>“You can use my studio. We can have sessions after hours. What you do is an</i> art. <i>It’d be a crime to horde it from the rest of the universe.");
	//if {SSDHIHA}
	if(InCollection("SSDHIHA", args)) output(" I’m sure a lot of men and herms would love to experience the way you do butt stuff, too.");
	output("”</i> She’s just bullshitting (you think), but you laugh with her as she congratulates you in new ways again and again.");
	output("\n\n<i>“Sometimes I wonder what I did to deserve you, seriously,”</i> she says, nuzzling her nose into your neck. She doesn’t say anything more, and even dozes off for a moment in your embrace on her bed. You enjoy the downtime between you, giving your mouth the break it’s earned.");
	output("\n\nShe’s reluctant to let you go when you get up, playfully keeping you in place until you struggle away from her. <i>“You’ve set the bar for me pretty damn high,”</i> she says, admiring you");
	//if {Paige is blind}
	if(paigeBlind()) output(" in her own way");
	output(" as you gather your effects and redress. <i>“I don’t like having debts, [pc.name]. Next time, I’ll have taken a page from your book and have you cumming buckets, mark my words!”</i>");

	// end scene (scene: SSDYAG); increase Lust by 40; advance clock by one hour; place PC one square outside Paige’s Unit
	processTime(5);
	pc.lust(5);//Fen note: already many lust gains on the way here. No need to go crazazle.
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Offer=]
// Coming from either (scene: SSDHT) or (scene: SSDYLH)
// Tooltip: It takes two to tango, after all! Ask Paige if she’s into a bit of 69 action.
// (scene: SSDO1)
public function SSDO1(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDO1");
	//if {SSDHT}
	if(InCollection("SSDHT", args)) 
	{
		output("<i>Damn,</i> you think to yourself, submitting to your baser desires. Maybe taking a huge whiff of a horny Ausar’s scent wasn’t the brightest idea. <i>“Paige,”</i> you say, still toying with her cunt idly, <i>“why not make this a little more... involving? I got a package that needs some tending to, too.”</i>");
		output("\n\nPaige huffs in a bit of mock frustration, grinning wryly at hearing your request. <i>“But it’s supposed to be my turn~”</i> she whines in a sing-song tone. <i>“But if you insist. I’m being the top, though.”</i>");
	}
	//if {SSDYLH}
	if(InCollection("SSDYLH", args)) 
	{
		output("You think to yourself what Paige must be feeling, on her knees, between yours, ready and willing to go down on you like the good lover she is. She must be pretty horny herself, and it would be rude of you to leave her excluded. <i>“Paige,”</i> you say, patting her on the forehead to keep her still, <i>“wanna make this a little more... inclusive? I’m not the only one that needs some release, I bet.”</i>");
		output("\n\n<i>“Fuck yeah, I do,”</i> Paige says quickly, pulling herself to her feet. Her wet Ausar pussy is displayed for you, proof of your correct assumption. You could tell, not just from her words or expression, that she was hoping you’d offer. <i>“You mind if I’m on top, though? I cum harder when I’m the top.”</i>");
	}
	output("\n\nFair trade!");
	if(silly) output(" You’ll just roll over when you’re done and she can have the wet spot.");
	output(" You show yourself onto the bed as Paige moves to one side, giving you a wide berth. Once you’re settled on your back, ");
	if(pc.hasCock()) output("[pc.eachCock]pointed to the ceiling");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("your [pc.vagina] on sopping wet display");
	if(!pc.hasGenitals()) output("your blank crotch is on display");
	output(" for Paige to ‘entertain’ you both with.");
	if(!pc.hasGenitals()) output(" She’ll probably have to get a little inventive, but you’re confident she can pull it off.");

	output("\n\nPaige doesn’t waste time getting herself into position, straddling your neck and lowering her face to your [pc.crotch]. That heady scent of your woman, wet and ready for you, barrels into your nostrils, and you enjoy the aroma a moment before leaning forward, kissing her labia deeply");
	//if {SSDHT}
	if(InCollection("SSDHT", args)) output(" and finally");
	output(". Paige winces in pleasure, rocking her hips onto your face to get herself comfy (you’re sure), until she lowers her own mouth and gets to work.");

	processTime(5);
	pc.lust(10);
	clearMenu();
	// end scene (scene: SSDO1); go to (scene: SSDO2)
	clearMenu();
	addButton(0,"Next",SSDO2,args);
}

//[=Offer=]
// Coming from either (scene: SSDHN&E); (scene: SSDYTH); or (SSDO1)
// Tooltip (if not coming from SSDO1): There’s nothing saying only one of you has to cum tonight...
// (scene: SSDO2)
public function SSDO2(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDO2");
	//if {SSDHN&E}
	if(InCollection("SSDHN&E", args)) 
	{
		output("Fuck, the sight of Paige on the verge of an earthshattering orgasm is <i>hot.</i> So hot that you’re almost as aroused as she is, and you’re probably just as close. <i>“Paige,”</i> you say huskily.");
		output("\n\n<i>“What!”</i> she responds brashly and immediately. She’s so close, you pulling away to talk to her is borderline torture.");
		output("\n\n<i>“I’m close too,”</i> you all but plead. <i>“I don’t think a hand is going to do me, Paige.”</i>");
		output("\n\nIn response, she kicks you away, turning to one side and motioning for you to get onto the bed. <i>“Quick!”</i> she demands, flapping her hand at you. <i>“I can’t wait another minute!”</i>");

		output("\n\nYou do as she demands, vaulting onto the bed and onto your back, y");
		if(pc.hasCock()) output("our [pc.cocks] swollen with desire, your pre-cum leaking and dribbling all over the place with your erratic movements");
		//if (pc.isHerm = true)
		if(pc.isHerm()) output(", and y");
		if(pc.hasVagina()) output("our [pc.vagina] soaking wet, desperate for attention as your [pc.girlCum] leaks down your [pc.legs] in smooth torrents");
		if(!pc.hasGenitals()) output("our [pc.crotch] facing upward. You’re not visibly aroused, but that doesn’t mean you aren’t, and you’re positive Paige will know what to do for you");
		output(".");
		output("\n\nShe doesn’t waste a moment and clambers onto you, the pussy you’ve grown acquainted with squatting on your nose, ready for some more attention. At the same time, Paige, desperate, immediately dives for your crotch, ready to do whatever it takes to get off.");
	}
	//if {SSDYTH}
	if(InCollection("SSDYTH", args))
	{
		output("Fuck it. If you’re this close to cumming, Paige must be on the verge herself. You can only imagine the mess she’s probably making – what good, attentive lover wouldn’t want to help out? <i>“Paige,”</i> you say, tapping on her forehead. She initially takes it to mean you’re about to cum, but you pull away from her, getting your attention. <i>“I need you in my mouth, too.”</i>");
		output("\n\nThere’s no preamble and no hesitation: Paige leaps to her feet, tackling you onto her bed. <i>“Good Gods above, I was hoping you’d say that,”</i> she says out-of-breath. She’s a little awkward about it, but she turns around, aligning herself back to your [pc.crotch] while aligning her own with your face. <i>“Hope you’re thirsty, [pc.name].”</i>");
		output("\n\nShe’s not kidding: her girlish lube is <i>coating</i> her pussy, moist lines drawing down from her pelvis as far as her knees. Her pussy is red and puffy and her clit is as engorged as you’ve ever seen it. You can’t help but admire the sight a little bit; the sensation of Paige’s mouth back on you snaps you out of your trance, and you get to work.");
	}
	output("\n\nYou plunge your tongue into her, reaching as deeply as you can, assisted by gravity pulling Paige’s strong hips down and onto your willing face. You reach up, gripping onto her ass with both hands, massaging the taut butt-flesh you find and keeping her horny hips in place for you to properly service. You pull back, stretching out your tongue to reach forward, batting at her clit before drawing languidly up and across her vulva, then repeat the process.");

	output("\n\nPaige focuses on you in kind, ");
	//if pc.gender = 3]
	if(pc.isHerm()) output("indecisive at first on which part of you to focus on, then decides on sticking your [pc.cock] in her mouth and shoving two fingers deep into your [pc.vagina]. She alternates between both your sexes, going deep as she pulls out, then thrusting in as she backs off. A hot spurt of pre-cum lodges into her mouth and her hand is soaked to the wrist in moments; after having a thorough taste, she switches, leaning forward to stick her tongue in your twat while she uses her freshly-lubed hand to press your [pc.cock] against her cheek to jerk you off");
	//if (pc.gender = 1)
	else if(pc.hasCock()) output("taking your [pc.cock] eagerly into her maw, introducing you to the warm wetness and gentle attention of her tongue. Her efforts are rewarded with a quick spurt of pre-cum, a taste of what you have in store for her. She takes you as deeply as she can, and when she draws up, keeps her lips to your shaft, tickling every centimeter of [pc.skinFurScales] as she does, before giving your [pc.cockHead] a kiss and starting again");
	else if(pc.hasVagina()) output("mimicking your technique by diving as deeply into your [pc.vagina] as she can, tasting every nuance of your essence. She twists and bloats her tongue inside you, getting against every sensitive muscles and tendon as she can. When she pulls out for a breath, she turns her head sideways, tracing along the inside of your pussy lips and batting your [pc.clit] with her tongue");
	//if (pc.gender = 0)
	else output("pressing her tongue against your [pc.crotch]. You have nothing for her to focus on, though, but, horny as she is, she doesn’t ask questions and just does it: her tongue swaths across your pelvis, tasting the sweat on your [pc.skinFurScales] as she goes. Her own hands hook to your [pc.ass], massaging your globes as she goes");
	output(".");

	output("\n\nYou’re a whole lot closer than you realized; after just a moment of her work on you, you can feel your orgasm coming just around the corner. From the sounds of Paige’s frantic moaning down by your [pc.legs], she’s the same way. No point in wasting breath talking sexy: you have more important work for your mouth.");

	output("\n\nYour diligence is rewarded soon enough....");

	//[=Climax=]
	// end scene (scene: SSDO2); go to (scene: SSDO3)
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",SSDO3,args);
}

//[=Climax=]
// (scene: SSDO3)
public function SSDO3(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("SSDO3");
	output("Paige gets there first: her muscles tense and, muffled by your crotch, she groans out, long and low. Your mouth is flooded with more of her nectar, stronger than the preparatory lube you’ve been enjoying. Her pussy clamps hard on your invasive tongue, milking it like a cock for all the sweet cum it can’t produce. Her hips mash down and she lewdly humps your face, riding out her orgasm for as long as you can, smearing her cum not just on your mouth but as far down as your neck and as far high as your forehead.");

	output("\n\nHer orgasm triggers your own, and you follow the same bodily response: ");
	//if (pc.gender = 3)
	if(pc.isHerm()) 
	{
		output("both your sexes erupt in sexual euphoria, blasting different juices this way and that. Your first shot of [pc.cum] vaults into the air and splatters along Paige’s upper back while your first squirt of [pc.girlCum] pools into both her cheeks. On the second wave, she pulls back and take your [pc.cock] into her mouth, bathing your [pc.cockHead] in your own girly ichor. ");
		if(pc.cumQ() < 300) output("It mixes well with the cum blasting into her throat, the flavors of your cunt mixing with the viscosity of your cock to make something that Paige audibly enjoys savoring");
		else output("It’s washed away fairly quickly by the immensity of your masculine load, and Paige has difficulty keeping both your quantities in her mouth at once. After the first swallow, she’s still on you, ready for the second");
		paige.girlCumInMouth(pc);
		paige.loadInMouth(pc);
	}
	//if (pc.gender = 1)
	else if(pc.hasCock()) 
	{
		output("you cum into Paige’s mouth");
		if(pc.cumQ() < 300) output(", coating the inside of her cheeks with your [pc.cum]. She takes it easily, letting it pile up on her tongue before swishing it around and swallowing, ready for your next batch");
		//if (pc.cumQuantity >= 300)
		else output(", her cheeks ballooning in your volume as she struggles to keep up. She’s halfway through swallowing your first batch before the second is already pressing past her lips; she gulps audibly through the whole thing, taking it all like a champion");
		output(". She jerks your dick with her right hand and pulls back, keeping a seal around your [pc.cockHead] so you can spray directly onto her tongue, and you ride out the rest of your orgasm that way");
		paige.loadInMouth(pc);
	}
	//if (pc.gender = 2)
	else if(pc.hasVagina()) 
	{
		output("your body tenses and your [pc.vagina] clamps onto hers, desperate for her own cum and starved when it doesn’t get it, but that doesn’t stop it from trying. She doesn’t stop, kissing at your sensitive spots without pulling out and reaching back to her chin, tweaking your [pc.clit] to prolong your orgasm as long as she can. She hums at the taste of your [pc.girlCum] flooding her mouth, enjoying it and leaning forward, covering more of yourself for a second helping");
		paige.girlCumInMouth(pc);
	}
	else output("your muscles tense up around your pelvis and you feel a sort of release echo throughout your body. It’s definitely reminiscent of an orgasm, but somehow a little ‘less’ because there isn’t anything to vent with. Your body goes through the forgotten motions, every moment a reminder of what you had and an experience on what you have. Whatever it is, you can already tell you’re coming off of it satisfied");
	output(".");

	output("\n\nYou both ride out your orgasms as long as you can: when Paige’s begins to wane, she starts rocking her hips far more purposefully, drawing hers out for a few extra seconds at a time, really bathing your face in what she has. By the time you’re both done, you’re sore, empty, and satisfied.");

	output("\n\nPaige collapses on top of you, and the only thing you feel from her mouth is heavy, deep breaths, winding down from her excitement and difficult work. ");
	if(pc.hasGenitals()) output("The stiffness and arousal from your genitals leads to the usual calmness about them");
	else output("The orgasm, if it can be called that, passes through you and relaxes the fire that’s burned between your legs since you lost your genitals");
	output(". You relax with Paige, sinking into the comfort of her mattress as you both take a moment to collect yourselves.");

	processTime(5);
	pc.orgasm();
	clearMenu();
	//[=Afterglow=]
	// end scene (scene: SSDO3); go to (scene: SSDOAG)
	clearMenu();
	addButton(0,"Next",SSDOAG,args);
}

//[=Afterglow=]
// (scene: SSDOAG)
public function SSDOAG(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Heaving and stiff, Paige pulls away from you, getting onto her hands and knees before pivoting her body back to face you. <i>“Goddamn,”</i> she breathes, putting her nose to yours as goofy smile spreads across her face, then, infectiously, yours. <i>“Leave it to you to come up with the best ideas, [pc.name].”</i>");
	output("\n\nSure, you’ll take the credit for that. You lay together, embracing each other in the stuffy room of her unit, cuddling while you come down. Neither of you say much; in fact, you’re pretty sure you both doze off at different points.");
	output("\n\nIt takes some doing to pull Paige off of you: she fights to keep you in bed and maybe, from her playful-and-sexy tones, have another round. As tempting as the idea is, you both have things to do, and you manage to pull away, getting to your wobbly [pc.feet]. <i>“Don’t think this is the last we’ve had of</i> that, <i>[pc.name],”</i> she says, slapping your [pc.ass] for good measure. <i>“I don’t think I’ll be able to go long without feeling that tongue in my hot box again. Make sure you’re ready!”</i>");
	output("\n\nYou tell her that you accept her challenge. Shortly after, you have your effects back on you, and you’re back at the door, ready to tackle whatever the universe has for you.");
	// end scene (scene: SSDO3); decrease Lust to 0; advance clock by one hour; place PC one square outside Paige’s Unit
	processTime(30);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Reenact=]
// Hide this button unless Paige is a crewmate
// Tooltip: Replay the night you and Paige first had sex. To the best of your memory, anyway...
// (scene: SSR)
public function SSR():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	output("You trail your hands down the thighs of your Ausar lover as she grinds against you. You smile at her, watching her beautiful blue eyes, and she smiles back. You’ve come an awfully long way together, and seeing her lust for you makes you a bit nostalgic.");
	output("\n\n<i>“Hey Paige,”</i> you say, <i>“remember our first time together?”</i>");
	output("\n\n<i>“Gods above, sweet thing, how could I forget?”</i> she asks, her eyes fluttering as she recalls it. <i>“That was... an important night for us both.”</i>");
	output("\n\nYou gently kneed her legs as she straddles you, envisioning yourself in the same position back then. <i>“What do you say we play that special night out again? Let’s try to remember how we felt that night, and... see where it takes us.”</i>");
	output("\n\nShe leans into you and gives you a quick kiss on the lips. <i>“Corny as it sounds, every time with you is special to me. I’d love to.”</i> She licks her lips. <i>“And if I remember right, it started with....”</i>");
	output("\n\nShe lunges forward, burying her tongue deep into your mouth, letting you memorize her taste and texture. You keep your hands to your sides, gripping at nothing and dying to touch her. Now, what is it you did next...?");

	args.push("SSR");
	//[=Embrace Her=][=Grab Her Ass=][=Do Nothing=]
	// end scene (scene: SSR); continue along the First Time path
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Embrace Her",FTEH1,args);
	addButton(1,"Grab Her Ass",FTGHA1,args);
	addButton(2,"Do Nothing",FTDN1,args);
}