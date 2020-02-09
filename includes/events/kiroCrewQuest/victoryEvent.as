//Kiro Recruitment Meeting Event.
//Landing pad bonustexties!

public function kqVictoryRewardBonus(slot:int):void
{
	output("\n\nKiro’s vessel, the leaf-shaped <i>“Blade,”</i> sits parked precariously close to your own, almost like the independent-minded ‘nuki would rather risk crashing than having a little more distance. Your Codex chimes with a message from her, inviting you to come in and talk.");
	addButton(slot,"Kiro’s Ship",enterKirosShipForPostKQReward,undefined,"Kiro’s Ship","It would seem Kiro wants to get together, perhaps to celebrate your victory over Illustria Po’s mad laboratory.");
}

//ENTER!
public function enterKirosShipForPostKQReward():void
{
	clearOutput();
	showName("THE\nBLADE");
	showBust("BLADE");
	author("Fenoxo");
	output("You make your way up the Blade’s boarding ramp, happy at the prospect of visiting your fluffy ");
	if(flags["KIRO_GF"] != undefined) output("girl");
	flags["KQ_REWARDED"] = 1;
	output("friend under less threatening circumstances after that mess with Doctor Po. The door is locked, of course. You tap key to request access, hear the muffled tinkling of bells through the reinforced hull, and nearly jump when the door swishes open in a microsecond. Hopefully it closes a little slower - or gets routine maintenance on the safety sensors.");
	output("\n\nYou stride into the familiar halls. Path lighting appears underfoot as you explore, directing you toward a room on the far side of the vessel. Brightness spills out from around the doorway as it illuminates like a glowbug in spring.");
	output("\n\nYou’ve been invited in.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",kqVictorySurprise);
}

public function kqVictorySurprise():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	showImage("KiroInWhite");
	output("Kiro lays sprawled supine across a comfy-looking futon, completely nude. The raised side allows her to lounge in a manner somewhat approximating sitting upright, and also to spread her legs wide, revealing a pair of recently-milked, apple-sized balls - and the titanic length of her equine girth, sheathed in a decorative, silky-white cocksock. Small off-white stains mar the fabric below where she’s leaked out a bit of excitement, but all you can smell are faint, wispy tones of lavender from a recent shower. She brushes back her hair and smiles joyously in your direction, a bit of shyness keeping her from staring straight at you. <i>“Hiya, Angel.”</i>");
	//Bro
	if(pc.isBro()) output("\n\n<i>“Hey,”</i> you grunt, " + ((pc.isErect() || !pc.hasCock()) ? "standing a bit straighter":"stiffening appreciably at the sight") + ". <i>“Is this for me?”</i>");
	//Bimbo
	else if(pc.isBimbo()) output("\n\n<i>“O-M-G!”</i> you scream, clapping your hands to your mouth. <i>“You’re so </i>gorgeous<i>! Did you do all this,”</i> you bite your lip in obvious desire, <i>“for me?”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Hi yourself,”</i> you answer with a grin of your own. <i>“Did you get all dressed up for me?”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“Hi yourself,”</i> you quip with a cocksure grin of your own. <i>“Did you do this for me?”</i>");
	//Hard
	else output("\n\n<i>“Hey,”</i> you answer, unable to keep a grin of your own from surfacing. <i>“Was this for me?”</i>");
	//Merge
	output("\n\nKiro nods meekly. Despite the constant flaunting of her sexuality, it must not have been easy for her to present herself this way: naked and vulnerable. <i>“Yes.”</i> She inhales deeply. <i>“You deserve it, baby. You saved me from myself back in the day - probably thought I was just some down on her luck slut. Then you stuck around. You could’ve been a dishonest ass to me. Most pirates and Rushers are. We’re cut from the same cloth like that.”</i> A quiet huff wheezes through her parted lips. <i>“But you were straight to me.");
	if(flags["KIRO_MET_KALLY"] != undefined)
	{
		output(" You were there to help me with my sister.");
		if(kiroKallyThreesomes() > 0) output(" Maybe you helped a little more than I asked for, but wow was it worth it!");
	}
	output(" And then you flew across the stars like a shot from a railgun to save me from my own overconfidence.”</i>");
	output("\n\nAll this flattery is making you blush.");
	output("\n\n<i>“Yes, [pc.name]. All this is for you. All of me.”</i> She gestures down the length of her body");
	if(kiro.biggestTitSize() > 11) output(", pausing at her recently enhanced bosom");
	output(", careful not to brush the tightly-bound shaft below. <i>“I love you, [pc.name]" + (kiroKallyThreesomes() > 0 ? " - you and Kally both":"") + ". You don’t have to say it back.”</i> The kui-tan sprawls wider across the couch, presenting herself. <i>“Right now... just let me reward you. We can talk out the serious stuff later.”</i> Perhaps feeling that she hasn’t seduced you enough, she adds, <i>“" + ((!(kiro.vaginalVirgin && pc.hasCock())) ? "I cum so easy ever since Po had me in her clutches.":"You can have my virginity, if you want it.") + "”</i>");
	output("\n\nIt’s a more than appealing offer.");
	processTime(5);
	pc.changeLust(25);
	kqVictoryMenu1();
}

public function kqVictoryMenu1():void
{
	clearMenu();
	if(pc.hasCock()) addButton(0,"Fuck Pussy",penisRouter,[fuckKirosPussyAwwwYeeeeeeea,80085,false,0],"Fuck Pussy",(kiro.vaginalVirgin ? "Take Kiro’s virginity.":"Further cement your claim to the tanuki’s glimmering twat."));
	else addDisabledButton(0, "Fuck Pussy", "Fuck Pussy", "You lack the penis this requires.");
	addButton(1,"RideHerCock",vaginaRouter,[rideKirosVictoryCocku,kiro.cockVolume(0),1,0,true],"Ride Her Cock","Let that velvet-wrapped beast-pole fill you warmth and love.");
	if(!kiroIsCrew())
	{
		if(flags["KIRO_GF"] == undefined) 
		{
			addButton(2,"No Sex",dontWantSexFromYou,undefined,"No Sex","");
		}
		else 
		{
			addDisabledButton(2,"No Sex","No Sex","She’s already your girlfriend. Now isn’t exactly the time to be breaking up with her...");	
		}
		if(flags["KIRO_LOVED"] == undefined) addButton(3,"I Love You",tellKiroYaLoveHerYouDolt,undefined,"I Love You","Confess your own feelings right here, right now, damnit!");
	}
}

//I Love You
public function tellKiroYaLoveHerYouDolt():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“I love you too.”</i> You answer plainly, but it’s enough to make tears well at the corner of Kiro’s eyes.");
	flags["KIRO_LOVED"] = 1;
	if(flags["KIRO_GF"] == undefined)
	{
		output("\n\n<i>“I guess that makes you my [pc.boyGirl]friend, huh?”</i> the kui-tan nervously ventures.");
		output("\n\nYou answer, <i>“I guess so.”</i>");
		output("\n\nKiro balls up her fists in front of her chest and nods vigorously. <i>“Yes." + (kiroKallyThreesomes() > 0 ? " I hope you don’t mind sharing me with Kally. Fuck, polyamory is rad!":" I hope you don’t mind if I keep fucking around though. Monogamy never really worked for me, and it would be so selfish to expect you to keep up with all this.") + "”</i>");
		output("\n\nEven as your girlfriend, Kiro will still be a slut. Is that okay?");
		processTime(3);
		
		clearMenu();
		addButton(0,"Yes",yesPolyAmoryIsOkayKiro,true,"Yes","Take Kiro as your girlfriend.");
		addButton(1,"No",noPolyForMeThanks,true,"No","Polyamory is a problem for you.");
	}
	else
	{
		output("\n\n<i>“I couldn’t have asked for a better [pc.boyGirl]friend,”</i> the kui-tan proudly sighs.");
		output("\n\nYou agree with her.");
		output("\n\nKiro socks you in the shoulder hard. <i>“Don’t let your head get too big about it.”</i> She flashes her fangs in a broad grin. <i>“");
		if(pc.hasCock())
		{
			output("Unless it’s the one below the belt. " + (!pc.hasCocks() ? "That one can get as big as it wants.":"Those ones can get as big as they want."));
			output(" Not even her chocolate fur can hide the crimson blush glowing beneath.");
			output(" <i>“Now back to the matter at hand...”</i>");
		}
		processTime(5);
		kqVictoryMenu1();
	}
	//Use reactions from below <i>“Late Love”</i> heading.
}

//DontWantSex
public function dontWantSexFromYou():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	flags["KIRO_LOVED"] = -1;
	output("<i>“No.”</i> You shake your head. <i>“Kiro... we’re friends");
	if(pc.isBimbo()) output(" - super great friends! Yah! S");
	else output(". Great friends. Yeah, s");
	output("ometimes things might even get a bit lewd, but... I don’t want this kind of relationship with you.”</i> You take a step back.");
	output("\n\n<i>“Oh.”</i> Kiro sniffles, wiping her nose on her freshly laundered armfur. <i>“It figures." + (kiroKallyThreesomes() > 0 ? " At least I have Kally.":" I finally meet someone good enough to consider an honorable relationship with, and they’re the one person with the balls to turn me down.") + "”</i> Her sable lips quirk at that thought a moment before she springs to her feet. <i>“Let me get dressed. I must look as stupid as a girl misreading signs at the yearly fertility festival...”</i> A voluminous mass of striped tail swishes by a few inches from your face; the kui-tan makes for a nearby door. <i>“Don’t go anywhere, okay? We still have a lot to talk about.”</i>");
	output("\n\nYou can do that much.");
	processTime(5);
	pc.changeLust(-5);
	pc.libido(-2);
	clearMenu();
	addButton(0,"Next",postFuckTalkies,false);
}

//Ride Cock
//Let that velvet-wrapped beast-pole fill you warmth and love.
public function rideKirosVictoryCocku(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	//Crotch covered
	if((!pc.isCrotchExposed() && x >= 0) || (!pc.isAssExposed() && x < 0)) output("You can’t get out of your clothes fast enough.");
	//Exposed
	else output("You’re suddenly thrilled to have " + ((!pc.hasVaginas() || x < 0) ? "a ":"") + "fully-exposed and available " + (x >= 0 ? "[pc.vaginas]":"[pc.ass]") + ".");
	//Mergies. No new PGs
	output(" Kiro is right there... and so incredibly <b>hard</b>. You can see her throb through the silky coverings, every beat of her heart pumping that lovely cock full for you. It takes every ounce of willpower in your body not to bend over and present your [pc.vagOrAss " + x + "] on the spot. Somehow, you gather enough will to saunter forward, hips swishing wide, and drop " + (pc.hasKnees() ? "to your [pc.knees]":"to the ground") + " in front of the futon. Hefty tanuki-dick bobs inches from your face, the floral aroma in the air tainted by the sudden presence of rich, fresh prickmusk. You look up at your soft-furred lover and loving reach out to stroke her.");
	output("\n\nShe swoons. For a moment, your gazes lock, and it feels like the rest of the universe falls away. Nothing exists but your love.");
	output("\n\nA wet kiss against your cheek draws you from your adoring reverie, leading you to turn your head and accidentally brush tanuki-pre over your [pc.lips]. You don’t mind, and you let her know by opening wide and gratefully wrapping your mouth around the blunted equine crown, playfully stroking the exposed shaft with its velvetine coating in one hand. Sweet juices drench your tongue in no time, but you know Kiro can be so much messier - so virile and juicy!");
	output("\n\nMaking a show of swallowing, you cup your other hand around her fluffy nutsack, rubbing the heavy orbs until she’s pouring a steady stream of gloriously gooey juices into an increasingly slick maw. It’s then that you let her flop out of your mouth with a wet ‘pop’, pushing her weighty shaft straight upright. It pulsates, and Kiro makes a plaintive whine from the back of her throat. You shush her from underneath her dick, tickling fingers along the quivering urethra while a lake forms on her flat tip.");
	output("\n\n<i>“I’m going to love riding you,”</i> you promise.");
	output("\n\nThat’s all it takes for Kiro to overflow her prick-top fluid feature and unleash a creeping tide of clear lubricant. Streamers of pre wind around clearly-defined veins, soaking into the fabric as they go. You playfully stroke your fingers through the mess, smearing it all over her the upper half of her girth, teasing and toying until the recently rescued pirate is cooing and half-slickened. A gentle squeeze to her balls shoots another shot glass’s worth of pre an inch into the air - more than enough to waterfall past the first wave’s progress and impregnate the rest of her cocksock with sopping-wet, slick pre.");
	output("\n\nKiro pants, <i>“Ohh, Angel! Hurry! You’re gonna make me cum!”</i>");
	output("\n\nYou wouldn’t dare make her pop in the open air after all this build up. Climbing up onto the futon, you mantle past the jutting pole to straddle Kiro on the couch, looking her square in the eyes as you use both hands to guide the slippery totem into position against your [pc.vagOrAss " + x + "].");
	if(x >= 0) output(" It’s so warm against your [pc.clits] that your body involuntarily shivers and moistens." + (pc.wetness(x) >= 4 ? " Your own lusty cream pours out in response, offering up its juicy interior entirely without an ounce of input from you.":" Your own contribution is nothing in face of the kui-tan’s near-tidal arousal. She leaves you as wet as a galotian call-girl and twice as horny."));
	else output(" It’s so warm against your dark star that your body involuntarily makes a quivering clench, dragging your crinkled flesh across the sensitive cocktip until you’re as wet as galotian call-girl and just as horny.");

	output("\n\nPowerful flexes of Kiro’s flare strain in a pointless attempt to wrench you open - pointless because gravity is doing it for her. Your [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " already relaxing, allowing the universe’s most constant force to work its magic on your body, using your own bodyweight to spread you wide for that that pillar of rigid need. Sinking down Kiro’s dick feels like getting split in half, like it should hurt, but the only thing you feel is pure <i>pleasure</i>. It is straining fullness the most delightful form, tricking neurons that should be broadcasting torrid pain into singing sensuous praises. Wordless gasps of delight squeeze out of you with every inch you take.");
	output("\n\n<i>“A-a-angel please!”</i> Kiro pants, settling her hands on your [pc.butt]. Her fingers twitch against your [pc.skinFurScales] like she can’t quite contain herself. It’s taking every ounce of the kui-tan’s considerable will not to grab you with all her strength and bury herself to the hilt. She’s holding herself back for <i>you</i>, denying her domineering nature to let this gentle lovemaking proceed. <i>“I can’t!”</i>");
	output("\n\nYour " + (x >= 0 ? "lips catch":"ring catches") + " on the increased girth of the tanuki’s medial ring. Like most horse-cocks, hers has a thicker band of flesh near the center, and rubbing against it is driving you wild with desire. You twist and rotate in place, moaning wildly, heedless to Kiro’s increasingly desperate moans and the warm, heated throbbing of her expanding flare. Rather than stopping to give her a breather, you bounce in place and greedily lean forward to steal a kiss.");
	if(x >= 0) pc.cuntChange(x,kiro.cockVolume(0));
	else pc.buttChange(kiro.cockVolume(0));
	output("\n\nKiro’s lips are soft, wet, and wide-open, thoughtlessly acceptive of your affections as she begins to cum.");
	output("\n\nYou weren’t ready for her to climax this soon. A geyser or potent, fresh-brewed seed erupts directly into your unresisting " + (x >= 0 ? "cervix":"intestines") + ((x >= 0 && !pc.isPregnant(x)) ? ", flooding past that arousal-weakened gate to flood your womb":"") + ". Kiro ejaculates so powerfully that you can hear her seed roiling and churning in your [pc.belly], each blissful burble accompanied by a bit of swelling pudge in your middle. There’s something amazing about being transfixed by her dick as it impels ever-greater volumes of seed into your ");
	if(x < 0) output("gut");
	else if(pc.isPregnant(x)) output("channel");
	else output("womb");
	output(", but all good things must come to an end.");
	processTime(20);
	pc.changeLust(50);
	if(x >= 0) pc.loadInCunt(kiro,x);
	else pc.loadInAss(kiro);
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",rideKirosVictoryCocku2,x);
}
public function rideKirosVictoryCocku2(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("Kiro’s eyes stop rolling back as her orgasm tapers down, and she finally starts to kiss you properly, tonguefucking you as what feel like gallons of excess, " + (x < 0 ? "ass-impregnating":"cunt-drenching") + " seed backwash down her pole, making that bulging middle ring so slick that you ca-");
	output("\n\n<i>’POP’</i>");
	output("\n\nYour well-filled [pc.vagOrAssNoun " + x + "] swallows the obstruction with ease, snapping tightly back against Kiro’s veiny second half as you glide down. Now it’s your turn to struggle to stay coordinated. Kiro’s tongue is everywhere. It roams over your [pc.lipsChaste]. It gently prods your own, sliding alongside it affectionately as she fills two holes with quiet intensity. You tremble in her paws, letting her. Your [pc.thighs] quiver, and you struggle to breath, too blissed out to worry as you begin to cum.");
	output("\n\nYou’re a white-hot nova of lust and desire, wrapped tight around the biggest, most bestial fuckpole in the galaxy. Kiro keeps you moving, even when your spasming body bottoms out on her sheath, bunching it up against your");
	if(x >= 0) output("cum-drenched cuntlips");
	else output("cum-drenched star");
	output(". She’s gentle, post-orgasm. Her fingers squeeze and tease as they guide you through your climax with perfect attentiveness. Somehow, through all the ecstatic euphoria, you feel safe above all else.");
	output("\n\nShe cares for you.");
	output("\n\nShe cradles you.");
	output("\n\nShe fills you.");
	output("\n\nShe makes you feel... complete.");
	output("\n\n<i>“Angel?”</i> Kiro whispers. She kisses your nose. <i>“Was that alright?”</i>");
	output("\n\nYou answer by wrapping your arms around her neck and kissing her back. In this moment, there’s nothing you want more. Minutes pass with nothing but the unsubtle sounds of swapping saliva and heavy breathing. Every inhalation is filled with her natural scent, the fragrant smell of freshly washed hair, and humid traces of her own exhaled oxygen, like neither of you is even breathing on your own. For this minute, you are one being - one tangle of limbs and adoration that never wants to come apart.");
	output("\n\nKiro sighs, <i>“Maybe Po’s changes weren’t all bad.”</i> She must sense that the statement makes you recoil a little, because she explains, <i>“That was as good as some of the best sex I’ve ever had, and I went off early like a blushing virgin.”</i> She fondly strokes your back, her tail wrapping tight around your [pc.butt] to hold you still. <i>“I got to give the cutest Rusher captain in all the stars a creampie just for climbing onboard. No struggling, sweating, barely able to cum nonsense.”</i> As she talks, you can feel her cock stiffening inside you, pushing through deposits of sticky jism as it works its way back to ramrod straight. <i>“And now, when you ride me - if you still want to, you can take it as slow as you want... and I’ll probably go off again. I don’t have to bang you hard and fast.”</i> She grins. <i>“I can just enjoy... you.”</i>");
	processTime(10);
	if(x >= 0) pc.loadInCunt(kiro,x);
	else pc.loadInAss(kiro);
	kiro.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",rideKirosVictoryCocku3,x);
}
public function rideKirosVictoryCocku3(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You aren’t sure at what point you start rolling your [pc.hips] in Kiro’s lap, but at some point, needs aside from companionship asserted themselves. Was it the tanuki’s fault? Her hands are on your [pc.butt], kneading the flesh, guiding you as you roll your creampied " + (x >= 0 ? "passage":"backdoor") + " around her throbbing horse-meat. Or did your own wanton desire for more coerce you into action?");
	output("\n\nIt hardly seems to matter.");
	output("\n\nStroking the lusty kui-tan’s cheek, you lift yourself up to feel even greater friction, arching your back so sharply that it nearly hurts, but the angle allows you to gyrate around steaming-hot cock in whole new ways. Kiro whimpers in the cutest way when a fist-sized globule of spent seed slips out of you and into her ballfur, matting around the overworked orbs. With a naughty giggle, you reach back to collect some in your palm, bringing it up to smear down your [pc.chest] as you drop back down, taking her to the hilt" + (pc.hasVagina() ? ", wet fur tickling your [pc.clits]":"") + ". An even naughtier idea occurs while you’re rubbing it into your [pc.nipples]: <i>what if you got Kiro to lick them clean?</i>");
	output("\n\nYou don’t have to ask.");
	output("\n\nYour disparate but paired consciousnesses coalesce around the idea at the same time; the beaming, lawbreaking hermaphrodite leans forward with her sable lips parted" + (kiro.biggestTitSize() > 11 ? ", her augmented breasts dragging the heavy points of her nipples against your [pc.belly]":"") + ", her tongue outstretched. She glances up, an inch away from your cum-covered peak, but the second her tongue makes contact with the virile coating, Kiro’s eyelids drift closed in delight. Her cheeks hollow, and her tongue swipes back and forth in greedy strokes, harvesting what spent seed it can, dragging it deep into her maw.");
	//Dicknipples
	if(pc.hasDickNipples())
	{
		output("\n\nThe vacuum-like attention draws your [pc.dickNipples] out of hiding - and straight into the tanuki’s hungry mouth. Her eyes widen in surprise, but she does not stop what she’s doing. Instead, she shifts her tongue to explore the slowly-expanding, turgid flesh, tickling the phallus-like shape until you’re dripping a whole other kind of cream into Kiro’s maw - one she clearly enjoys, judging by the wagging of her tail and the muffled ‘mmm’s of delight.");
	}
	//Lipples
	else if(pc.hasLipples()) output("\n\nTanuki tongue burrows into your nip-lips a moment later, daringly exploring your interior in the quest for even more of her home-brewed, second-hand goo. Instead she finds herself distracted by the texture of your [pc.lipple] against her mouth, the way your exotic anatomy squeezes down on her tongue as if in welcome. She makes out with your chest with clear enthusiasm. Sometimes she even clutches your [pc.breast] with both hands and squeezes in obvious desire.");
	//Milky
	else if(pc.isLactating()) 
	{
		output("\n\n[pc.Milk] eases into your [pc.nipples] in response to the suction, trickling" + (pc.canMilkSquirt() ? " then spurting":"") + " into the tanuki’s hungry mouth. Her eyes widen in surprise, then bliss. After a quick, nostril-flaring breath, she sucks again, harder, wicking the last of her sperm free from your flesh as she coaxes you into giving her a mid-fuck snack as well. You let her. Wrapping your hands around the back of Kiro’s head, you support her while she drinks, and she thanks you for it by tempering her nursing to rhythmic suckles.");
	}
	//Merge
	output("\n\nYou hear a faint gurgle from below. It isn’t your stomach - far too low for that. It could only be Kiro’s balls.");
	output("\n\nThe suckling kui-tan bounces to your next " + (pc.hasDickNipples() ? "[pc.dickNipple]":"[pc.nipple]") + " like a junkie chasing her next hit. Her hands roam everywhere, but the moment she gets a taste of her own seed again, Kiro goes almost completely still, aside from her maw. Somehow she’s even more efficient in the collection of her juices. Quick strokes of her tongue gather sweat and semen together into a slutty, easily-swallowed slurry, then snap back out for more. Her thumb catches a dribble sliding down your chest and pushes it back up into her cream-glazed lips, popping out a second later with spit-slicked fur.");
	output("\n\nThose low-down gurgles come again, louder and more authoritative. Warmth presses against your [pc.butt] from below, pushing up like bread in an oven. Silken fur slides delightfully against your [pc.skinFurScales] as the sensations tug your mind from your [pc.nipples] to the space below your well-filled " + (x >= 0 ? "pussy":"pucker") + " - where Kiro’s balls churn and wobble, inflating her fluffy sack with a fresh load of creamy cum. Her thighs spread wider, not because she deigned to move them that way but because the roiling liquid mass between pushes them out, and as they swell up underneath you, the cum-drunk tanuki’s eyes snap back open with clear desire.");
	output("\n\n<i>“Oh Angel, you naughty slut,”</i> Kiro growls, her hands latching onto your ass. <i>“One just wasn’t enough for you...”</i> She lifts you up high enough to expose the bottom half of her semen-drenched cocksock. Blobs of cum squish out of the bottom edge, drooling toward the ever-rising expanse of ballsack below. Kiro grins. <i>“I’m glad you did that, though.”</i> She lets go, and you travel down ten inches of spasming horsecock in an instant, struck senseless by the explosion of pleasure. Something wet gushes into you, forcing more old jizz out of your creampied " + (x >= 0 ? "[pc.vaginaNoun " + x + "]":"rectum") + " to smear the couch and tanuki alike. <i>“It means I get to flood you with more than love.”</i>");
	output("\n\nYou shiver in delight as Kiro bounces you again. This time she takes you higher, nearly three quarters of the way up her equine pole - high enough for your distended " + (x >= 0 ? "twat":"asshole") + " to pleasantly pop around her thick, middle ring on the up and down both. You gush sounds of praise and mixed sex-juices in equal measure, encouraging your roguish lover not to stop, and she doesn’t. Kiro keeps you going, keeps pumping her rod deep into your increasingly dick-addicted " + (x >= 0 ? "vagina":"anal star") + " until you’re too busy gasping for air to give proper voice to your bliss. You’re a wet hole on a thick rod that gets wetter and sloppier and more well-fucked by the second.");
	output("\n\nYour [pc.lips] fall open, and Kiro stuffs two of her fingers in there. Wordlessly suckling on them feels a little filthy, like it should be beneath you, but it also feels so <i>right</i>. There’s something dirty and primal about the act, especially when you realize that she smeared them through her semen-soaked ballfur before bringing them up to your drooling maw. Still, you like the taste, salty and warm. Your mouth is like a " + (x >= 0 ? "second ":"") + "cunt for Kiro to fuck, another hole you can use to play with your favorite tanuki whenever " + (!pc.isBimbo() ? "you - or she -":"she") + " is horny. Closing your eyes to focus on savoring the experience seems like the best idea in all the universe.");
	output("\n\nAnd it is.");
	output("\n\nWith your eyes closed, the sensations from your " + (x >= 0 ? "[pc.vagina " + x + "] and [pc.clits] become":"[pc.asshole] becomes") + " that much more intense. The plush softness of Kiro’s fingerpads resolves itself in higher detail on your tongue and on your buns. Throbbing veins stroke places you couldn’t even consider with your eyes open. Juices cling to " + (x >= 0 ? "folds":"your ring") + ", oozing and dripping in sensuous delight. You clench tightly. It’s the best way you can think to pay Kiro back for how well she’s fucking you - how incredible it feels to let her bounce-fuck you on the ballooning beachballs of hers. You squeeze and ripple");
	if(pc.isBimbo() || pc.isTreated()) output(" in ways lesser " + pc.mf("men","women") + " never could");
	else output(" as best as you can");
	output(", letting out full body shudders when the tanuki-tool lodged in your " + (x >= 0 ? "quim":"anus") + " releases a ");
	if(x >= 0 && !pc.isPregnant(x)) output("womb-flooding ");
	output("deluge of buttery pre.");
	output("\n\n<i>“Oh stars, I can’t stop it,”</i> Kiro admits, her clawtips digging deep into your flesh. <i>“It’s too easy! You’re too fucking hot, [pc.name]!”</i> She heaves you up, almost the entire way to her cockhead, exposing the shining mass of her slutty spear. Gravity pulls you back down. You slap into place atop the fluffy, roiling throne that is Kiro’s nutsack, feeling it working overtime to get her spooge in position to flood your creampied " + (x >= 0 ? "honeypot":"sphincter") + ". <i>“I love you, Angel!”</i> She cries, her whole dicklength throbbing with " + (x >= 0 ? "cunt":"ass") + "-stretching excitement. Her prickhead balloons");
	if(x >= 0)
	{
		output(" against your cervix");
		if(!pc.isPregnant(x)) output(", prying open a urethra-sized gap just above her cumslut");
	}
	output(". Vanishing from your ass and mouth, her arms reappear around your shoulders, and Kiro nuzzles her face into the nape of your neck. <i>“I love you so much!”</i>");
	output("\n\nYou don’t feel the kui-tan’s climax like you might a terran’s, or an ausar’s, or any other lesser species. It’s overwhelming. The sheer difference in displacement triggers an adrenaline response that makes time seem to slow to a glacial pace. You can feel the heat and pressure unfolding inside yourself in slow motion, aware of the slight variances in backpressure from Kiro’s flagging abdominals. Creamy kui-tan seed sloshes in eddies and currents of liquid pleasure, fighting against itself while the pressure ratchets up.");
	output("\n\nYou have all the time in the world to relish the feeling of becoming Kiro’s personal creampuff. Heartbeats last for an age. A throbbing spike of pleasure becomes a crescent wave of eye-rolling bliss. Your own climax arrives without warning, and you let it take you. You wash away on a tide of pleasure and tanuki-cum, spasming in Kiro’s arms while she plants an impassioned nip on your neck. <i>Full.</i> You’re so full, and fuller by the moment. You’re flooding and filling and squealing until it’s impossible to discern anything more than the weight and girth of Kiro’s too-virile cock.");
	output("\n\nYou float on a swirling tide of cum, leaning into soft fur. It’s hard to keep your eyes open - harder still to hold your [pc.hips] still. It’s easier to go limp. Your pulse steadies, then slows, no longer hammering quite so hard in your ears, even if Kiro is still cumming");
	if(pc.hasCock()) output(", oblivious to the [pc.cumNoun] you shot into her [kiro.chest]");
	if(pc.isSquirter()) output(", seemingly pleased to be covered in your squirted [pc.girlCum]");
	output(". She’s so warm...");

	processTime(20);
	kiro.createPerk("Fixed CumQ",45000);
	if(pc.isLactating()) pc.milked();
	if(x >= 0) pc.loadInCunt(kiro,x);
	else pc.loadInAss(kiro);
	kiro.orgasm();
	pc.orgasm();
	kiro.removePerk("Fixed CumQ");
	clearMenu();
	if(!kiroIsCrew()) addButton(0,"Next",rideKirosVictoryCocku4,x);
	else addButton(0,"Next",mainGameMenu);
}

public function rideKirosVictoryCocku4(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You wake up in Kiro’s arms, her cock still inside you, still hard, and still wreathed in a halo of her own cum. She strokes your [pc.belly] fondly. <i>“You look good like this... but we should really clean up.”</i>");
	output("\n\nYou nod, unmoving.");
	output("\n\nKissing your nose, the tanuki giggles. <i>“I guess I’ll have to carry you, then.”</i>");
	output("\n\n<i>“I guess you will.”</i>");
	//Big PC
	if(pc.tallness > 6*12+6) output("\n\nDespite her legs wobbling with effort, Kiro somehow manages to stagger your enormous frame into her ship’s shower.");
	//Moderate
	else if(pc.tallness >= 5*12) output("\n\nWith a huff of effort, Kiro hefts you up off of the couch and staggers with you into the ship’s shower.");
	//light
	else output("\n\nKiro hefts you into the air with ease, letting her cock hold most of your weight as she sashays into the ship’s shower.");
	//Merge no new pg
	output(" She slaps the controls almost immediately, drenching you in a stream of perfectly temperature-regulated water while her cock rests inside you. It’s like an anchor, holding you still while she soaps up the rest of you, washing off the filth and pheromones. <i>“Mmm, you make me wanna fuck you again, Angel,”</i> she quips, reaching down to sponge around your spread-open " + (x < 0 ? "backdoor":"petals") + ". <i>“But we can do that any time.”</i> She eases herself out of your [pc.vagOrAss " + x + "], and a waterfall of fertile fluids rush down the drain. The water cleanses any residue from your [pc.legOrLegs]. <i>“We should probably have a sit-down talk before we ruin more cocksocks.”</i>");
	output("\n\nYou nod, and Kiro departs the shower.");
	processTime(34);
	pc.shower();
	clearMenu();
	addButton(0,"Next",postFuckTalkies,true);
}

//Fuck Pussy
//Take Kiro’s virginity.
//else: Further cement your claim to the tanuki’s glimmering twat.
public function fuckKirosPussyAwwwYeeeeeeea(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	//Covered
	if(!pc.isCrotchExposed()) output("You can’t get your troublesome garments out of the way fast enough.");
	//Exposed & Hard
	else if(pc.isAss()) output("You’ve never been happier to be strolling around with " + (!pc.hasCocks() ? "an ":"") + "exposed hard-on" + (pc.hasCocks() ? "s":"") + ".");
	//Exposed & Unhard
	else output("Your [pc.cocks] answer" + (!pc.hasCocks() ? "s":"") + " for you. In the brief time it took you to contemplate your next course of action, " + (pc.hasCocks() ? "They":"It") + " throbbed to life, jutting forward with obvious desire.");
	//merge no new PG
	output(" Kiro is <i>right there</i>, and not just incredibly hard but incredibly <i>wet</i>. You can smell the subtle scent of it already, but when the tanuki guesses your intent and lifts up her balls to expose her dewy twat, her fragrance breaks over you like a wave. If you weren’t hard before, you are now.");
	//Huegus Dickus
	if(pc.cockVolume(x) > kiro.vaginalCapacity(0))
	{
		output("\n\n<i>“Angel, that’ll never fit inside me like this.”</i> The coy lawbreaker circles her cunt with her fingertips, showing exactly how wide it can stretch - clearly not wide enough for you. <i>“Lucky for you, I keep a bottle of this around for emergencies.”</i> She reaches under the futon and comes up with a brand new container of ‘Peggy’s Elasticizing Oil,’ wiggling it playfully above her twat. <i>“Here you go, " + (pc.mf("stud","you fucking amazon")) + ".”</i> She twists the top with one finger, and a stream of clear goo issues out from the nozzle. It splatters across her balls and exterior cuntlips before the sprawling pirate gets the angle just right to fully infuse her interior. She smartly twists it closed and tosses it over her shoulder. <i>“Now I can take it.”</i> She hooks her fingers in, pulling her twat inhumanly wide with apparent ease. <i>“" + (!kiro.vaginalVirgin ? "Now you can stretch me out like your very own, brand-new kui-tan condom.":"Now you can finally claim my v-card, once and for all. My cunt will never be the same.") + "”</i>");
	}
	//Normie dickus
	else
	{
		output("\n\n<i>“Oh Angel, that looks so fucking good.”</i> The grinning lawbreaker circles her cunt with her fingertips, pulling herself open to show you exactly how wet she is inside. <i>“You’re going to fit me perfectly, aren’t you?”</i> She thumbs at her clit, trembling in sudden, violent need. Her cock slaps hard against her belly, slinging a fat rope of pre-cum across her darker-furred face. <i>“Come fuck me." + (kiro.vaginalVirgin ? " Teach me how good it can be to get fucked like a girl. You’ll be the only [pc.guyGirl] in the whole galaxy with Kiro Tamahime’s v-card.":" You already own my v-card, and this time I’m asking for it - begging for it. Fuck my pussy like you own it.") + "”</i>");
	}
	//Merge
	output("\n\nYou step forward with your [pc.cock " + x + "] in hand, lining the [pc.cockHead " + x + "] up with the waiting tanuki’s dewy gash. Genitals brush genitals. The accidental touch leaves both of you swooning, equally amazed by the passionate heat radiating from the other’s loins. Kiro shifts, grabbing one leg by the ankle and raising it high overhead, to better present her bare cunt for the taking. She bites her lower lip and bats her eyelashes in your direction. Looking back, you see plainly displayed adoration mixed with a healthy coat of lust, but when it comes to Kiro, everything comes with a healthy coat of lust.");
	output("\n\nShe’s blushing like a school-girl getting asked out for prom.");
	//Normal
	if(pc.cockVolume(x) <= kiro.vaginalCapacity(0))
	{
		output("\n\nYou thrust into the virgin" + (!kiro.vaginalVirgin ? "-esque":"") + " kui-tan without another word, sliding inch after inch through a deluge of feminine lust. Soaked undersack caresses the topside as you press onward, somehow just as warm and wet as the cunt below. You can feel her arousal through it, judge her pleasure by the way those balls jump and clench as you spear past them. A simple shift in angle earns a bounce and spurt of creamy pre. A gentle caress of one as you shift it out of the way is sufficient to make Kiro squeak and paw at your [pc.chest]. Clapping your hips together");
		if(pc.hasSheath()) output(" as your sheath bunches up against her lips");
		else if(pc.hasKnot(x)) output(" as your partly-swollen knot pops inside");
		output(" feels like it’s almost too much.");
	}
	//Huegebois
	else
	{
		output("\n\nYou’re too big to simply thrust your way inside and be done with it. You have to work slowly, prying the virgin" + (!kiro.vaginalVirgin ? "-ish":"") + " cunt-lips open with your [pc.cockHeadNoun " + x + "].");
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) output(" A blunted boner isn’t the best tool for this part of the job, but it’s sooo satisfying to finally pop inside, at which point the heavy crown stops being a disadvantage and starts becoming a real pussy plow. As you drive home the first four inches, you’re treated the sight of Kiro’s face contorting through a half-dozen different expressions of pleasure before finally drifting into slackened bliss.");
		else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output(" A pointed tool is the perfect tool for this part of the job. It can slip into position in spite of your size, and the deeper you push it, the more naturally it spreads the tanuki’s pussy out. Every inch you feed Kiro pushes her to new levels of distention and pleasure. By the time you’re five inches in, she’s cycling through a half dozen expressions of pleasure, finally culminating in a look of slackened bliss.");
		else output(" They vise open without too much effort on your part, wrapping snugly around every inch of anatomy you feed her. Kiro’s cunt feels perfectly mated to you, like that oil she used actually made her pussy an even better fit for your prick. Soon, she’s contorting through a half-dozen different expressions of pleasure, slackening into idle bliss as you pass inch number five.");
		output(" Sinking the rest in is so much easier. You just hold her by the hips and do what comes naturally, pressing onward until the shape of your member is clearly outlined in the horny hermaphrodite’s bellyfur." + (pc.cockVolume(x) >= 1000 ? " Soon, she’s stretched out like a living condom and rubbing the shape of it through herself in awe.":""));
	}
	if(kiro.vaginalVirgin) kiro.cuntChange(0,pc.cockVolume(0));
	takeKiroginity();
	pc.cockChange();
	//murgie wurgies.
	output("\n\n<i>“Oh yes!”</i> Kiro screams in rapturous joy, suddenly scissoring her thighs closed above your [pc.butt]. <i>“Fuck me like I’m your woman, Angel!”</i> She holds you there, fully impaled, her toeclaws tickling against your spine. With her hands, she reaches up to your shoulders so that she can pull her face up for a kiss. It’s a forceful forceful, tongue-swapping french one, the kind where you’re not sure if you’re going to end up with bruised lips when it finally ends. She holds you tight in a full-body embrace, warm and adoring.");
	output("\n\nFor this moment, you are less two people and more one entity, joined everywhere you can be, buoyed by mutual affection and lust until you may as well be floating on a cloud of love. Kiro’s crimson eyes seem lighter and less threatening than at any time, almost like luminous rose petals. Looking into them, you swear you can see the vulnerable girl beneath all the bravado and bluster, and she’s beautiful. Letting her lips part from yours feels like it ought to be a crime.");
	output("\n\nKiro does you the favor of breaking that particular law, if only so she can mouth, <i>“I love you,”</i> once more before releasing her hip-pinning thigh-grab. <i>“Now fuck me, before I cum just from kissing you.”</i> She rolls her hips, undulating the taut confines of her twat around your [pc.cockNoun " + x + "]. <i>“It seems so easy now... like we’ll have a hard time counting all the times you bring me off.”</i> She shakes out her hair and furtively asks, <i>“Can you go all our first? Really pound me, [pc.name]. I’m already too close. Just fuck me silly.”</i>");
	output("\n\nYou nod silently but enthusiastically, drawing back in slow anticipation... and driving home with full force. Your [pc.sheathOrKnot " + x + "] slaps home, splattering droplets of girlish joy across your intimately paired thighs. Kiro cries out again, fingers scrabbling madly over your [pc.skinFurScalesNoun]. When you repeat the motion, she becomes even less coordinated and allows her eyes to drift closed. Successive, hip-battering thrusts are answered with unthinking grunts and squeaks of joy. When you grab her ass in both hands and really ram yourself home, thrusting with every ounce of power your body possesses, Kiro thrashes and cums.");
	output("\n\nWrapped in satiny ribbon, you’re treated to the sight of that ludicrously large equine cock straining against its forced containment, nearly ripping seams with the force of its engorgement. Arcs of shimmering pearl blast out with cannon-like force. They’re less like lances of creamy cum and more like full glasses launched into the air. Kiro, still joyfully twitching, throws her head back and opens her mouth in time to catch the first full-on with her vulnerable visage. It drenches her in an instant, webbing down her hair and pooling deep in her maw. She swallows it while her gyrations bury her dick into her own tits.");
	output("\n\nViscous goo pours back out the bottom of Kiro’s cleavage and forms a salty leak on the top - until the next cumblast. Seizing in delight, the tanuki floods her tit-valley past capacity. Streams of kui-tan spooge race down her [kiro.chest] replaced in a second by the next wave of her orgasm. As for your hips, they’re swiftly drenched with wasted seed. Kiro’s semen backwashes over everything, and there’s no way to avoid all of it while you’re jackhammering your heart out.");
	output("\n\n<i>“Yes!”</i> the cum-drunk pirate gasps, lapping the residue off her lips. <i>“So goooood,”</i> she purrs, rubbing her cummy tits around her quivering dick as the last, sputtering shots fire off. <i>“And I swallowed so much. You’ll have to keep me cumming, [pc.name].”</i> Her tail pulls in to squeeze you closer. <i>“And I’ll have to put on a condom if we don’t want the room to flood.”</i> She produces a handful of brightly-covered, kui-tan-grade condoms from somewhere. <i>“Unless you want to help?”</i>");
	output("\n\nStill [pc.knotBallsHilt " + x + "] deep inside her, you point out that it seems like she planned for this.");
	output("\n\nThe warmth and weight of the outlaw’s sack against your [pc.belly] ratchets up warningly as Kiro tears a package open with her teeth and tosses it your way. <i>“I plan pirate jobs, Angel. I prepare for sex.”</i> She smirks a little blearily. <i>“Now help me get this condom on before I ruin another room.”</i>");
	output("\n\nAnother one?");
	processTime(30);
	pc.changeLust(100);
	kiro.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",fuckKirosPussyAwwwYeeeeeeea2,x);
}
public function fuckKirosPussyAwwwYeeeeeeea2(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("Wrestling a condom onto a 20-plus inch cock is no easy task. Doing it while said cock is throbbing, semi-flared from a recent orgasm, and slick with a gangbang’s worth of spent seed is even harder. You pry the musky prong out of Kiro’s white-painted tits and wrestle the concerningly thin latex around the rim of the flare, but every time you’re about to get it on, your fingers slip. Or Kiro twitches because you bumped a sensitive vein. Or a fresh upwelling of slick juices emerges from her distended urethra. With her kui-tan instincts kicking into overdrive, wrestling your fluffy friend’s phallus is like trying to tame a bucking bronco.");
	output("\n\n<i>“Ohhh, let me help,”</i> Kiro implores, reaching out to steady her cock with one hand and compress her tip with the other. Immediately, her plan backfires. She bucks her hips - wrenching your [pc.cock " + x + "] around inside her - and fires a fresh-brewed bolt of semen-infused pre into her chin. <i>“Oh-oh stars!”</i> she cries, cramping her fingers down harder about her exquisitely sensitive flare while her other hand gives into pleasure, stroking across an expanse of climax-lubricated cockflesh in hedonistic joy. <i>“Hurry, [pc.name]! I can’t hold it!”</i>");
	//Phys check! High phys success:
	if(pc.PQ() >= 75) output("\n\nBunching the condom up in your fingers, you stretch the goo-catching prophylactic dangerously. It’s so wide that when Kiro tells you to, you’re able to slide it into place almost immediately, unrolling the bunched base on your way down her pole until you’ve seated the tight ring deeply into her sticky sheath-folds. That much pressure that low down seems to set her off again, filling the high-grade condom with a soccerball’s worth of seed in short order.");
	//Low phys fail.
	else 
	{
		output("\n\nYou panic and strain as hard as you can, but no matter how you twist and writhe and press, you can’t seem to get the goo-catching prophylactic in place. All the squirming and sliding your efforts involved were clearly too much for the beleaguered kui-tan, because she goes off before you can even get the condom in place. It deflects off the surface and sputters through your fingers, bathing you in wasted seed. Kiro’s spasming cock jerks around, flinging more and more of her cum every which way while you struggle in what feels like vain, but the moment that ludicrious cum-shot tapers down, you finally catch a bit of luck.");
		output("\n\nOne of her ecstatic twitches actually helped push the whole of her flare under the condom’s rim, and from that point, it’s a simple matter to drag it down the rest of the herm’s slimy horse-prick. By the time you have it nuzzled against her base, she’s finally stopped cumming, leaving you with only a softball’s worth of spooge captured - and a much more voluminous coating across the rest of her body.");
	}
	//Merge
	output("\n\n<i>“Po wasn’t kidding about the refractory period,”</i> Kiro gasps, shuddering in the aftermath of a second climax. <i>“Can you... can you fuck me slow for now, Angel? I think... I want to be at least semi-conscious when you finally creampie me.”</i>");
	output("\n\n" + (pc.PQ() < 75 ? "That sounds worth the unexpected discharge, at least.":"Now that’s a cause worth holding back for.") + " <i>“");
	if(pc.isBimbo()) output("That sounds sooooo amazing! You’re gonna totes love it!");
	else if(pc.isBro()) output("Fuck yes.");
	else if(pc.isNice()) output("Of course.");
	else if(pc.isMischievous()) output("Kiro Tamahime, wanting to fuck slow?”</i> You scratch your chin. <i>“If I wasn’t so sure it was you, I’d be checking to make sure you’re not a pod person.");
	else output("With how tight your pussy is squeezing me, I’m not sure I could keep up that pace anyway.");
	output("”</i>");
	processTime(25);
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",fuckKirosPussyAwwwYeeeeeeea3,x);
}
public function fuckKirosPussyAwwwYeeeeeeea3(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You join Kiro on the couch with a slight shift in position, fucking her missionary. It may not be the best position for physical pleasure or breeding, but it is the best position to stare into her eyes and give her a slow kiss while you rock your [pc.hips] back and forth, dragging your [pc.cockNounSimple " + x + "] through Kiro’s flushed black cunt. She throbs back against");
	if(pc.hasCocks()) output(" your unused penis" + (pc.cockTotal() > 2 ? "es":""));
	else output("your [pc.belly]");
	output(" seemingly at random. Sometimes, her dick seems happy to be ignored while you plunder her pussy’s silken depths. Other times, it jumps and bounces. Swirls of pre roil through the captive bubble at the tip, and it swells against its resting place in Kiro’s cleavage, looking ever more like a third breast - this one pure white.");
	output("\n\n<i>“You know I don’t call you Angel just because you rescued me, right [pc.name]?”</i> Kiro’s hands stroke your back while you ride her. <i>“Well, at first I did, but now? Now it’s half that and half that you put up with me.”</i> Her pussy clings to you for dear life, so firmly clenched that you can register the layout of her internal folds. <i>“That you still come around even though I’m a horny nympho... that you still want my pussy even though I make a show of wanting to stick my dick in any willing hole I can find.”</i> She gulps, then leans up to press her nose against yours. <i>“That even though I scream about how I’m a solo act, you’ve stuck around and protected me like crew.”</i> She shifts angle, and kisses you once more.");
	output("\n\nThis time, it goes on for what feels like ever. The gentle, wet sounds of continuing copulation form a rhythmic backdrop for a long, passionate kiss. Kiro’s hands squeeze intently yet gently, roaming up to your shoulders and neck. You can’t do the same, needing to support yourself while you continue to drill the eager alien, but you gently suck at her lip, or trace your [pc.tongue] around the contours of her maw, or slide it against her own questing muscle.");
	output("\n\nBreaking that kiss produces a moment of near-stillness. You gaze into each other’s eyes, wearing matching smiles, your hips gently rocking against one another. The condom in Kiro’s tits is slowly expanding, becoming more translucent by the second.");
	output("\n\n<i>“You know I c-can feel you rubbing my prostate from the other side,”</i> the lusty hermaphrodite admits. <i>“When you go all the way in - j-just like that - I can actually feel it milk out a dollop of pre.”</i> She shivers, her syrupy passage contorting encouragingly. <i>“You can make me cum anytime you want.”</i> A tear of joy rolls down her cheek. <i>“Just do it yourself. Creampie me, and I’ll climax so hard.”</i> Arching her back, she shivers from the feeling of her latex-wrapped cock slipping through her cum-matted titty-fur. <i>“I’ll make you the biggest no-prep cum-balloon I’ve ever created. It’s going to be so easy!”</i>");
	output("\n\nYou increase your pace slightly at her words. How could you not? The galaxy’s hottest, sluttiest pirate has you clutched in her nethers and is all but begging you for a creampie. Your [pc.cock " + x + "] urges you on demandingly. When you bury yourself deep, it throbs anxiously. When you stroke back, it twitches powerfully. When you feel your own pleasure slowly rising, it compels you to hold yourself inside her and shift around, rolling your girth over every interior inch until you get to feel it squeeze down on Kiro’s prostate - and milk out a cum-shot worth of pre.");
	output("\n\nKiro moans, beyond the point of further speech. Her hands drift away from you and back to herself, settling on her cream-coated" + (kiro.biggestTitSize() > 11 ? ", augmented":"") + " tits. She squeezes and rubs, lubricated by a curtain of her own cum" + (kiro.isLactating() ? ", expressing milk in heavy, delicious flows that a New Texan could envy":"") + ". When you hilt her, she jerks in ecstasy, wobbling those heaving breasts around. " + (!kiro.isLactating() ? "Her fingers zero in on her nipples, squeezing and stroking them, tugging them to full hardness and then some. Every exposed inch of her body is flushed with desire, with want - with the need for more of you.":"Her fingers work over her nipples until they’re rigid and distended both with arousal in milk. She freely spills her bounty over her own supine form, further drenching her fur and likely ruining the couch below. You even hear her quietly moo, under her breath, as she gives into the lactic ecstasy and pumps her fecund teats."));
	output("\n\nYou can’t maintain the slow pace in sight of such erotic imagery, especially when Kiro’s entire body is basically drenched in her too-lewd pheromones. Every sound she makes spurs you onward. The sight of her curvaceous body, writhing in obvious ecstasy, leaves you tight and rigid, unable to stop your muscles from clenching and launching you forward. When you gasp for breath, you smell nothing but Kiro and her varied fuckjuices, pumped out in her excitement for you.");
	output("\n\n<i>“Kiro, I’m gon-”</i>");
	output("\n\nYou go off with your [pc.cockHead " + x + "] kissing the kui-tan’s cervix. It happens without warning, and the subconscious demands climax places on your body forces you to smash your hips as firmly into Kiro’s sloppy crotch as you can, rubbing formly against her prostate through her cunt as you cum.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 100) output(" Your own [pc.cumNoun] spurts valiantly inside her, but it’s nothing next to the body-sized balloon that’s growing between you, prying you apart.");
	else if(pc.cumQ() < 1000) output(" Your own [pc.cumNoun] sprays valiantly inside her, drenching her from womb to netherlips in a tide of your [pc.cumVisc] lusts, but the volume can’t compare to the swelling jizz-balloon between you. Even now, it’s forcing you apart, swelling up from a dangerously virile cumshot.");
	else if(pc.cumQ() < 10000) output(" Your own [pc.cumNoun] erupts with cannon-like force, cramming the tanuki’s womb full of your virile leavings, then backwashing out around your [pc.knotOrSheath " + x + "]. You pump her full enough to satisfy a galotian, then cum a little more, but Kiro cums too. She pumps that captive jizz-balloon larger and larger until it’s physically forcing the two of you apart.");
	else output(" Your own [pc.cumNoun] rolls out in a tide of womb-inflating joy, cramming the tanuki so full that she visibly inflates. You round her middle out like she rounds out the condom she’s wearing, one spunk-infused blob to another. Unfortunately, all that volume divides you, pushing you apart as even as you spray the rest of your seemingly endless load into her quivering thighs.");
	output("\n\nYou stagger up and back, still embedded in Kiro, still spurting your last, as her cumsack inflates, hiding her face from view. Her arms stick out above it, holding it back from outright smothering her, but that also means it has nowhere to expand but down and out. Hot, roiling ‘nuki-spooge forces you to disengage" + (pc.hasKnot(x) ? " with a noisy, knot-tickling ‘pop’":" with wet-sounding ‘schluck’") + ". You stagger back and fall onto your [pc.butt]. Your [pc.legOrLegs] " + (pc.legCount > 1 ? "are":"is") + "n’t exactly working well right now.");
	output("\n\n<i>“O-ohhhhhh,”</i> Kiro moans, rolling to the side, slapping her still-swelling orb onto the floor next to her. It’s already waist high and wider than two people, but judging from the way Kiro’s balls are twitching, she’s still cumming hard. <i>“I can’t stop... it’s so easy!”</i> she complains, turning so her feet are on the floor to either side. She places her hands on top of the cumball and humps, driving her cock into it like a pussy. <i>“C-c-cuming out the whole damned cascade! Angel, hold me! Please!”</i>");
	output("\n\nYou circle around, climbing onto the couch behind Kiro to hold her while she empties the rest of her biologically inconceivable orgasm into the artificial reservoir.");
	output("\n\n<i>“Yesssss....”</i> she hisses, her head falling back onto your shoulder. <i>“...love you so much.”</i>");
	processTime(30);
	kiro.orgasm();
	kiro.loadInCunt(pc,0);
	pc.orgasm();
	clearMenu();
	if(!kiroIsCrew()) addButton(0,"Next",fuckKirosPussyAwwwYeeeeeeea4,x);
	else addButton(0,"Next",mainGameMenu);
}
public function fuckKirosPussyAwwwYeeeeeeea4(x:int):void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You wake up in Kiro’s arms, her cock no longer in that condom, though still quite hard and still wreathed in a halo of her own cum. She strokes your [pc.hair] fondly. <i>“You really are a helluva fuck, Angel.”</i>");
	output("\n\nYou nod, stretching slowly.");
	output("\n\nKissing your nose, the tanuki giggles. <i>“I guess we both need a shower, don’t we?”</i>");
	output("\n\n<i>“I guess we do.”</i>");
	output("\n\nIt comes as a surprise when Kiro drops you to sprint for the shower, not weighed down by her well-milked balls in the slightest.");
	if(pc.reflexes() / 2 + rand(20) + 1 > 30) output(" You catch her in a flash and dive through the doors before she can muscle you out of the way. Victory!");
	else output(" You spring after her, but the cheater has way too much of a head start to make up for. You have to settle for diving in the door a split-second after her.");
	//Merge no new pg
	output(" Kiro slaps the controls almost immediately, drenching you in a stream of perfectly temperature-regulated water. Her cock rubs gently but insistently against you while she soaps up the rest of you, washing off the filth and pheromones. <i>“Mmm, you make me wanna fuck you again, Angel,”</i> she quips, reaching down to sponge around your " + (pc.balls > 0 ? "[pc.balls]":"[pc.cock " + x + "]") + ". <i>“But we can do that any time.”</i> She gently reaches between her legs, and a waterfall of fertile fluids rush down the drain. The water cleanses any residue from your [pc.legOrLegs]. <i>“We should probably have a sit-down talk before we ruin more cocksocks.”</i>");
	output("\n\nYou nod, and Kiro departs the shower.");
	processTime(15);
	pc.shower();
	clearMenu();
	addButton(0,"Next",postFuckTalkies,true);
}

//Post Fucky Feeling Shitty
public function postFuckTalkies(fucked:Boolean):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("Kiro rests on the same couch as before, but this time dressed in her usual attire." + (fucked ? " She looks so much more relaxed after that tryst, like between her confession and the fuck, every ounce of tension in her body is gone.":" Her posture is both perky and firm. She holds herself proudly upright in spite of so recently getting shot down. Her eyes, a little misty, meet your gaze with ease.") + " <i>“Now that we have the fun stuff out of the way, let’s talk brass tacks.”</i> Kiro drums her fingers against the sofa’s edge. <i>“This is the second time you’ve saved this dumbass ‘nuki from herself. I don’t want it to have to happen again.”</i>");
	output("\n\n<i>“Oh?”</i> You look at her quizzically. <i>“You’re not retiring, are you?”</i>");
	output("\n\nKiro slaps her knee and bursts into " + (!fucked ? "laughter":"a giggling fit") + ". <i>“No, no. Of course not.”</i> She pauses. <i>“Well, maybe. You see, I was thinking - you haven’t needed saving once. You’re doing better than most pirates just by plumbing the Rush, and it’s probably less dangerous too.”</i> She stops to take a big breath. <i>“So my idea was, if it’s not too much trouble - I’d like to join your crew, at least until the Rush is over. We both know I’m good in a scrap. I’m a good pilot, a decent gunner, better bed-warmer.”</i> Her tail puffs up nervously. <i>“My skillset is pretty perfectly matched to Rushing, and we could cover twice as much ground together. It’d be nice to be on a crew again.”</i>");
	output("\n\n<b>Kiro wants to join your crew!</b> How do you respond?");
	processTime(5);
	kqVictoryMenu2();
}

public function kqVictoryMenu2():void
{
	clearMenu();
	addButton(0,"Join Me",joinMyCrewKiro,undefined,"Join Me","Invite Kiro to join the crew. Together, you can rule the galaxy as Rusher and Pirate!");
	addButton(1,"Stay Solo",staySoloKiro,undefined,"Stay Solo","You aren’t looking for another crew member right now.");
	if(flags["KIRO_LOVED"] == undefined) addButton(2,"Confess Love",lateLoveDeclaration,undefined,"Confess Love","It’s a little late, but confess your own love back to her.");
	else addDisabledButton(2,"Confess Love","Confess Love","Been there, done that.");
}

//Late Love
public function lateLoveDeclaration():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	flags["KIRO_LOVED"] = 1;
	output("You reach out and shush the tanuki. <i>“I love you too, you big horndog.”</i> With that out of the way, you take your finger away from the joyfully squealing pirate and add, ");

	if(flags["KIRO_GF"] == undefined)
	{
		output("<i>“I guess that makes you my [pc.boyGirl]friend, huh?”</i>");
		output("\n\nKiro balls up her fists in front of her chest and nods vigorously. <i>“Yes." + (kiroKallyThreesomes() > 0 ? " I hope you don’t mind sharing me with Kally. Fuck, polyamory is rad!":" I hope you don’t mind if I keep fucking around though. Monogamy never really worked for me, and it would be so selfish to expect you to keep up with all this.") + "”</i>");
		output("\n\nEven as your girlfriend, Kiro will still be a slut. Is that okay?");
		processTime(5);
		clearMenu();
		addButton(0,"Yes",yesPolyAmoryIsOkayKiro,false,"Yes","Take Kiro as your girlfriend.");
		addButton(1,"No",noPolyForMeThanks,false,"No","Polyamory is a problem for you.");
	}
	else
	{
		output("\n\n<i>“I couldn’t ask for a better girlfriend.”</i>");
		output("\n\nKiro socks you in the shoulder hard. <i>“Flattery doesn’t work on me.”</i> She flashes her fangs in a broad grin. <i>“Except when it does, like right fucking now, but back to the matter at hand...”</i> Not even her chocolate fur can hide the crimson blush glowing beneath.");
		processTime(5);
		kqVictoryMenu2();
	}
}

public function yesPolyAmoryIsOkayKiro(early:Boolean = false):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("You nod emphatically. Now, back to the matter at hand...");
	flags["KIRO_GF"] = 1;
	if(early) kqVictoryMenu1();
	else kqVictoryMenu2();
}

//[No]
public function noPolyForMeThanks(early:Boolean = false):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("You shake your head sadly. <i>“I can’t do that, Kiro.”</i>");
	output("\n\n<i>“I understand,”</i> the kui-tan murmurs, dropping her hands in defeat. <i>“It’s not the first time my... needs were too difficult for a partner’s heart to take. We don’t have to be any different than we are right now... even if I wish we could be.”</i> She sniffs. <i>“Now, back to the matter at hand...”</i>");
	processTime(2);
	clearMenu();
	if(early) kqVictoryMenu1();
	else kqVictoryMenu2();
}

//Join Me, Luke Skywalker. Together we shall rule the galaxy as nuki and cockholster!
public function joinMyCrewKiro():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("You nod, but think to add, <i>“What about your ship?”</i>");
	output("\n\nKiro cocks her head and smirks. <i>“The Blade’s a real beauty, ain’t she? If you want, you could captain her for a spell - till the Rush is over at least. Getting used to serving under you is easier than learning a whole new ship. Just don’t try to sell her or ditch her; I’ll gut you worse than a varmint queen if you try and pull a con like that on me.”</i> The glint in her eyes clearly communicates the severity of her threat. <i>“But you wouldn’t do that, would you?”</i> Small fangs clip over her bottom lip. <i>“You’re not the type. So yeah - consider her yours for the time being. Show me how the Steele family makes their fortune.”</i>");
	output("\n\nYou whistle appreciatively. <i>“Really?”</i>");
	output("\n\n<i>“Really.”</i> Kiro nods soberly. <i>“I did pretty good solo. It’s time I tried the crew game again. This time with the best possible crew.”</i> She smiles bashfully. <i>“Now go on. I have to get this thing suitably sanitized for use by an actual crew... and swing by your mechanic to see her added to your collection.”</i> Tail wagging, Kiro guides you toward the door. <i>“I’ll be quick, promise. Betcha I’ll even make it onto your ship before you stop back by the berth.”</i>");
	output("\n\n<b>Kiro has joined your crew!</b>");
	flags["KIRO_RECRUITED"] = 1;
	clearMenu();
	//add blade to shippies~!
	if(shipStorageRoom() > 0)
	{
		output("\n<b>New ship acquired: the Blade!</b>");
		flags["KIRO_ONBOARD"] = 1;
		storeKirosShip();
		addButton(0,"Next",mainGameMenu);
	}
	else 
	{
		clearMenu();
		addButton(0,"Next",shipsFullGetKiros);
	}
}

public function storeKirosShip():void
{
	var shipID:String = "";
	for(var i:int = 0; i < shipStorageLimit(); i++)
	{
		shipID = String("SHIP_" + (i+2));
		if(shits[shipID] == undefined) break;
	}
	var tempShip:ShittyShip = new Blade();
	//tempShip.credits = 0;
	if(shipID != "") shits[shipID] = tempShip;
}
public function shipsFullGetKiros():void
{
	clearOutput();
	showName("MAKE\nROOM");
	author("Fenoxo");
	output("Your hangar is already at capacity. Kiro comes with her ship - if you want to recruit her, you’ll need to sell off an old vessel to make room.");
	output("\n\n<b><u>Stored Vessels</u>:</b>");
	var storageLimit:int = shipStorageLimit();
	var btnSlot:int = 0;
	for(var i:int = 0; i < storageLimit; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Nevermind", staySoloKiro);
			btnSlot++;
		}
		if(btnSlot >= 60) break;
		
		var shipID:String = String("SHIP_" + (i+2));
		if(shits[shipID] != undefined)
		{
			var shipA:ShittyShip = new Blade();
			var shipB:ShittyShip = shits[shipID];
			output("\n" + shits[shipID].short);
			addShipCompareButton(btnSlot,shipA,shipB,shipB.short,sellOldShipAndGetKiros,shipID,shipB.short);
			btnSlot++;
		}
		else
		{
			output("\n\\\[Empty Storage\\\]");
			addDisabledButton(btnSlot,"Empty","Empty","There is no ship stored here.");
			btnSlot++;
		}
		if(storageLimit > 14 && (i + 1) == storageLimit)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Nevermind", staySoloKiro);
		}
	}
}

public function sellOldShipAndGetKiros(arg:String):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("You make a quick phone call to have Vahn sell off your " + shits[arg].short + " for " + Math.round(shits[arg].shipCost()/2) + ". This frees up space to store the Blade! You can fly the Blade yourself by visiting Vahn and swapping your current vessel for a stored one.\n\n<b>New ship acquired: the Blade!</b>");
	pc.credits += Math.round(shits[arg].shipCost()/2);
	var newBlade:ShittyShip = new Blade();
	//newBlade.credits = 0;
	shits[arg] = newBlade;
	flags["KIRO_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Stay Solo
public function staySoloKiro():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“You don’t need to give up on your dreams because of two bad turns,”</i> you explain. <i>“The Kiro I saved didn’t give up for either of those rescues. Most people, when they find hardship, they collapse like a house of cards. You? You dug your heels in and scrabbled for your freedom until you got it back.”</i> You give Kiro a respectful nod. <i>“You don’t need to throw it all away and hitch your wagon to me because of a few bad spots.”</i>");
	output("\n\n<i>“I... yeah, I guess, but the offer stands if you change your mind about it.”</i> She stands up, and sweeps you up into a hug. <i>“I’ll just be a little bit more careful, but if you ever get in a tough spot and need saved yourself - don’t hesitate to call. Or be smart, call me first.”</i> Kiro flashes a Cheshire grin. <i>“We can get in so much trouble together... but if I’m not joining up with you, I should probably get to work. This baby doesn’t fuel up herself.”</i> She raps her knuckles on the ceiling.");
	output("\n\nYou say your goodbyes and leave Kiro’s vessel, the knowledge that <b>you can invite Kiro to join your crew at any time</b> firm in your mind.");
	flags["KIRO_ONBOARD"] = undefined;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}