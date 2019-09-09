public function showCoronaFlamer(nude:Boolean = false, aut:Boolean = true):void
{
	showBust((nude ? "FIREPUP_NUDE" : "FIREPUP"));
	showName("CORONA\nLORD FLAMER");
	if (aut) author("Wsan");
}

public function coronaFlamerEncounter():Boolean
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	if (fireBitchPunishSceneAvailable()) return fireBitchBeingANicePuppyForOnce(flags["FIREPUP_PUNISHED"]);
	else if (flags["FIREPUP_ENCOUNTERS"] == undefined)
	{
		output("<i>“Hey, " + pc.mf("buddy", "girlie") + ",”</i> you hear, and turn to see a fit, curvy huskar woman clad in nothing but taut straps striding towards you. Her lips curl into a dangerous smirk as she eyes you up and down. <i>“You’re not meant to be here.”</i>");

		if (flags["FORGEHOUND_WREKT"] == 1)
		{
			flags["FIREPUP_TOLD_HOUND"] = 1;
			if (pc.isBro()) output("\n\n<i>“Heh, I remember your dog told me the same thing,”</i> you grunt in amusement. <i>“At least you’re a damn sight prettier than he was.”</i>");
			else if (pc.isBimbo()) output("\n\n<i>“Awww! But I even beat the nice dogman doorkeeper,”</i> you moan, pouting. <i>“Doesn’t that count?”</i>");
			else if (pc.isNice()) output("\n\n<i>“Hmmm. I seem to recall someone else telling me the same thing,”</i> you say, smiling pleasantly. <i>“I think he called himself the forgehound.”</i>");
			else if (pc.isMisch()) output("\n\n<i>“Ooh, sorry babe,”</i> you say, spreading your arms and shrugging. <i>“Your big doggy told me the same thing, but I whooped his ass too.”</i>");
			else output("\n\n<i>“The last dog-eared person I met down here told me the same thing,”</i> you grunt. <i>“He was a bit bigger than you, though.”</i>");
			output("\n\n<i>“You- you’re the one?”</i> she says, her brow creasing in momentary concern before she shakes it off. <i>“No... you wouldn’t just hang around here. But you had me for a moment, heh. " + (silly ? "Time to <b>light you up!" : "I’m gonna <b>light you up, sweetcheeks!") + "</b>”</i>");
			output("\n\nGrinning savagely, she sets her feet apart and readies her flamethrower.");
		}
		else
		{
			if (pc.isBro()) output("\n\n<i>“Shame,”</i> you say, shaking your head. <i>“At least you’re gonna look real beautiful with your legs spread after the dance.”</i>\n\n<i>“Cocky, I like it,”</i> she growls, grinning savagely as she sets her feet apart and readies her flamethrower. <i>“But it’s not gonna stop me from <b>lighting you up!</b>”</i>");
			else if (pc.isBimbo()) output("\n\n<i>“Oh, did I go the wrong way?”</i> you fret, eyes wide in concern before you smile. <i>“At least I’ve got a total hottie to keep me company!”</i>\n\n<i>“Heh, you’re about to be a lot hotter than I am,”</i> she growls, grinning savagely as she sets her feet apart and readies her flamethrower. <i>“I’m gonna <b>light you up!</b>”</i>");
			else if (pc.isNice()) output("\n\n<i>“And I don’t suppose you’re going to let me through, are you?”</i> you reply.\n\n<i>“Nope!”</i> she says, grinning savagely as she sets her feet apart and readies her flamethrower. <i>“I’m gonna <b>light you up!</b>”</i>");
			else if (pc.isMisch()) output("\n\n<i>“You sure? I got a permit and everything,”</i> you mutter uncertainly, looking down and patting your [pc.thighs]. <i>“Oh shit, I must have left it back on my ship.”</i>\n\n<i>“Funny,”</i> she says, grinning savagely as she sets her feet apart and readies her flamethrower. <i>“But it’s not gonna stop me from <b>lighting you up!</b>”</i>");
			else output("\n\n<i>“Huh,”</i> you grunt, checking your [pc.weapon]. <i>“Guess I’ll just have to go through you.”</i>\n\n<i>“Ooh, I like a confident [pc.man],”</i> she growls, grinning savagely as she sets her feet apart and readies her flamethrower. <i>“But it’s not gonna stop me from <b>lighting you up!</b>”</i>");
		}
	}
	else if (flags["FIREPUP_SEXED_ROUGH"] != undefined)
	{
		output("<i>“Oh? Look who it is,”</i> a familiar voice calls, and you turn to see the flamer huskar stalking towards you with her heavy weapon at the ready. <i>“The best fuck I’ve ever had, just walking around like you </i>want<i> me to find you.”</i>");
		output("\n\n<i>“You really want to fight again?”</i> you say, smirking at her as she licks her lips.");
		output("\n\n<i>“Of course I do, <b>[pc.daddy]</b>,”</i> she says excitedly, lifting her flamethrower up. <i>“The fire gets me all revved up and ready for you to ride!”</i>");
		output("\n\nWell, you already knew the fire excited her. If that’s what it takes to get this bitch going, you’ll indulge her for the moment.");
	}
	else
	{
		output("<i>“Hey! You!”</i> a familiar voice calls, and you turn to see the flamer huskar stalking towards you with her heavy weapon at the ready. <i>“Thought I told you to keep out of here the last time.”</i>");
		output("\n\n<i>“Guess I didn’t get the message,”</i> you reply, eyeing her warily.");
		output("\n\n<i>“You’re making my job difficult,”</i> she sighs theatrically, a finger lightly tapping the side of her gun. <i>“I wish you’d just stay away...”</i>");
		output("\n\n<i>“No you don’t,”</i> you say, turning to face her with your [pc.weapon] at the ready. <i>“I can see you trembling in excitement. You’re just itching to use that flamethrower on me, aren’t you?”</i>");
		output("\n\n<i>“Heh heh,”</i> she chuckles, the facade cracking, then crumbling away. <i>“Hahahaha! I can’t believe you came back for more! I can’t believe how lucky I am!”</i>");
		output("\n\nShe splits her face with a toothy grin that you’d swear stretches up to her ears, her arms shaking as she lifts her flamethrower. <i>“Time to turn up the heat!”</i>");
	}

	output("\n\n<b>It’s a fight!</b>");

	IncrementFlag("FIREPUP_ENCOUNTERS");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CoronaFlamer());
	CombatManager.victoryScene(coronaFlamerGotHerJetsCooled);
	CombatManager.lossScene(coronaFlamerIsTooHotForYou);
	CombatManager.displayLocation((silly ? "FIREBITCH" : "CORONAFLAMER"));

	addButton(0, "Fight!", CombatManager.beginCombat);

	return true;
}

public function coronaFlamerGotHerJetsCooled():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();

	if (flags["FIREPUP_VICTORIES"] == undefined)
	{
		if (flags["FIREPUP_TOLD_HOUND"] == undefined) output("<i>“Awww... I hate losing,”</i>");
		else output("<i>“H’aawww, fuuuuck... I guess you really did beat the hound,”</i>");
		output(" she moans, slumping to her knees before looking at you with a hopeful gleam in her eye. <i>“But now you’re gonna fuck me, right?”</i>");
	}
	else
	{
		output("<i>“Ooh, fuck, you’re t-too fucking good for me,”</i> she pants, slumping to her knees and staring at you hungrily.");
		if (flags["FIREPUP_SEXED_LAST"] == undefined) output(" <i>“Are you gonna fuck me this time, [pc.daddy]? I’ll be a good little girl...”</i>");
		else output(" <i>“Are you gonna fuck me again, [pc.daddy]? I’ll be your good little girl again... or bad, if you prefer that.”</i>");
	}

	if (!pc.hasGenitals())
	{
		addDisabledButton(0, "Sure", "Sure", "With what exactly?");
		addDisabledButton(1, "Maybe", "Maybe", "You don’t have any parts for her to persuade you with.");
	}
	else
	{
		addButton(0, "Sure", coronaFlamerAboutToGitFukt, false, "Sure", "This woman is fucking crazy but she has the figure of a goddess and" + (flags["FIREPUP_SEXED"] == undefined ? " probably" : "") + " fucks like she fights, which is to say with utter abandon and joy mixed with violence.");
		if (flags["FIREPUP_DENIED"] == undefined) addButton(1, "Maybe", coronaFlamerGetsAChanceToShowOff, undefined, "Maybe", "You’re not sure. Maybe she can convince you.");
		else addButton(1, "Maybe", coronaFlamerGetsASecondChanceToShowOff, undefined, "Maybe", "You’re not sure. Maybe she can convince you.");
	}
	addButton(2, "No", coronaFlamerGetsRejected, undefined, "No", "You’re not touching this psycho with a ten foot pole.");
}

public function coronaFlamerAboutToGitFukt(skipClothes:Boolean):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	output("<i>“Sure,”</i> you say,");
	if (pc.isNude() || (skipClothes && !pc.hasUpperGarment())) output(" looking her over.");
	else output(" shedding your [pc.gear].");
	output(" <i>“Lie back.”</i>");
	output("\n\n<i>“Oh my god, yes, [pc.daddy]!”</i> she cries, her eyes lighting up with feverish lust as she throws herself onto the ground before you, spreading her powerful thighs so wide she’s almost doing the splits.");
	if (pc.hasCock()) output(" <i>“Give me that stud cock in my hot little pussy!”</i>");
	else output(" <i>“Do whatever you want with my hot little pussy!”</i>");

	if (!pc.hasGenitals()) addDisabledButton(0, "Rough Dom", "Rough Dom", "Requires genitals.");
	else addButton(0, "Rough Dom", coronaFlamerAboutToGetFuckedLikeTheBitchInHeatSheIs, undefined, "Rough Dom", "Slap and choke the huskar slut silly while she begs for more.");
	if (pc.hasCock()) addButton(1, "Facefuck", penisRouter, [coronaFlamerGetsABoneToPlayWith, pc.biggestCockVolume()+1, false, 0], "Facefuck", "Fuck this huskar bitch in the mouth until she’s gagging for it.");
	else addDisabledButton(1, "Facefuck", "Facefuck", "Requires dick.");
	addButton(2, "Get Rimmed", coronaFlamerPerformsMillenialMemes, undefined, "Get Rimmed", "Make your willing slutpuppy eat your ass.");
	if (!pc.hasGenitals()) addDisabledButton(3, "Standing 69", "Standing 69", "Requires genitals.");
	else if (pc.physique() < 20 || pc.tallness < 60) addDisabledButton(3, "Standing 69", "Standing 69", "You have to be 5 foot or higher as well as fairly strong to perform this.");
	else addButton(3, "Standing 69", coronaFlamerGetsHerWorldFlippedUpsideDown, undefined, "Standing 69", "Pick your slut up and put her to work.");
	addButton(4, "Punish", coronaFlamerGetsWhatBadBitchesGet);
}

public function coronaFlamerAboutToGetFuckedLikeTheBitchInHeatSheIs():void
{
	var cockArgs:Array = [coronaFlamerFuckedLikeTheBitchInHeatSheIs, pc.biggestCockVolume()+1, false, 0];
	var vagArgs:Array = [coronaFlamerMeetsTheRealAlphaBitch, 0, 0, 0];
	if (pc.isHerm())
	{
		clearMenu();
		clearOutput();
		output("What will you dominate her with?");
		addButton(0, "Cock", penisRouter, cockArgs);
		addButton(1, "Vagina", vaginaRouter, vagArgs);
	}
	else if (pc.hasCock()) penisRouter(cockArgs);
	else vaginaRouter(vagArgs);
}

public function coronaFlamerFuckedLikeTheBitchInHeatSheIs(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(10+rand(21));

	output("You kneel over her and place your hand at her throat, a gesture that makes her respond with immediate joy. Her long pink tongue lolls out as you begin to choke her, breath coming in short, halting gasps when you allow her to breathe. She shudders and shakes in your grip, eyes rolling in her head as her back arches off the ground.");
	output("\n\nShe’s having <i>too</i> much fun. You loosen your grip slightly and slap her hard enough to bring her back to her senses, her cheek reddening immediately as she turns back to you with her shining eyes focused on yours, panting in bliss and taking long, grateful breaths. Squeezing the sides of her neck, you watch her head droop momentarily before you let go and she springs back up, drooling running from the corner of her lips.");
	output("\n\n<i>“Oh my god-- ghhk,”</i> she chokes, shivering beneath you, <i>“I think I love you!”</i>");
	output("\n\n");
	showImage("PyropupChokeFuck");
	output("You give her a light slap to the other cheek and she gasps, tilting her head upward to expose more of her vulnerable neck while you align your [pc.cock " + cockIdx + "] with her juicy, dripping pussy. She screams in delight as the [pc.cockHead " + cockIdx + "] teases her slit open, spreading her wide, and can’t help but squirt all down your shaft as her legs thud against");
	if (pc.hasLegs()) output(" yours.");
	else output(" your side.");
	output(" Her lower back comes off the ground completely, undulating up and down while she cums, holding your gaze with adulation in her eyes the entire time.");
	output("\n\nThe walls of her pussy are soft, warm and impossibly tight around your dick, her entire canal squeezing lovingly down on you as muscular spasms shoot up her quivering thighs. She welcomes you inside her, slowly sliding her shaking legs around your [pc.hips] while she moans in abject pleasure. You stifle them by way of cutting off her airflow momentarily and she bucks her hips, cumming even harder as her mouth yawns open in a silent scream of ecstasy. By the time she gets her breath back you’re fucking her hard and fast,");
	if (pc.balls > 0) output(" [pc.balls] slapping against her jiggling ass.");
	else output(" groin smacking against her stiff little clit.");
	output("\n\n<i>“O-o-oh fuck,”</i> she gasps, holding your");
	if (pc.tone > 65) output(" muscular");
	else if (pc.tone < 20) output(" soft");
	output(" arms tightly. <i>“Oh, fuck, <b>[pc.daddy]!</b>”</i>");
	output("\n\nYou ride her like a stallion, slamming into her flexing cunt and squeezing her supple throat, and she responds in kind by worshipping you with her fertile body. She hasn’t <i>stopped</i> cumming since you started, squirting submissively every time you thrust into the depths of her warm wetness. She’s loving what you’re doing to her, and the more you indulge in her wanton urges the closer you get to cumming yourself.");
	output("\n\n<i>“In-inside,”</i> she pants harshly, choking the words out in desperation as she wraps her arms and legs around your back, locking you in. <i>“Pump my slutty cunt f-gghrk!”</i>");
	output("\n\nYou cut off any further pleading with your hand to remind her that <b>you</b> are the one who decides that, but with the way she’s shaking and cumming all over your cock, you were never going to pull out in the first place. Roaring as you thrust yourself to the hilt");
	if (pc.cLength(cockIdx) > 12) output(" and feel her cervix squish against your throbbing tip");
	output(", you let out");
	var cumQ:Number = pc.cumQ();
	if (cumQ < 1000)
	{
		output(" all the [pc.cum] you have stored up into your subservient little bitch’s womb. A quiet scream escapes her lips as her vaginal walls wring you out, milking every last drop into her slutty body.");
		output("\n\nYou pull out and");
		output(" a spring of your seed immediately springs forth between her thighs, dripping from her well-fucked slit.");
	}
	else if (cumQ < 3000)
	{
		output(" enough [pc.cum] into the subservient little bitch’s womb to make her stomach swell outwards. Her eyes bulge as the ecstasy of being so full of her dominator’s seed rushes through her, vaginal walls desperately working to milk every last drop of you into her slutty body.");
		output("\n\nYou pull out and seed streams from her well-fucked slit, spurting out onto the ground as she quivers and flexes her vaginal muscles, moaning in decadent joy.");
	}
	else if (cumQ < 6000)
	{
		output(" such an enormous river of [pc.cum] it fills the subservient little bitch’s womb to the brim an instant, further swelling it with every subsequent load. The seconds go by as you grunt and strain, her eyes bulging as complete awe overwrites the expression on her face, some of the excess squirting back out of her cock-plugged cunt to spatter her shaking thighs.");
		output("\n\nHer hands drop from your back to her bulging, cum-pumped tummy as she lets out a whore’s moan, tilting her head back to expose her neck to you in the ultimate display of submission. This bitch is yours now.");
		output("\n\nYou pull out and seed gushes from her well-fucked slit, pooling between her quivering thighs. That baby bump isn’t going away any time soon, either. She’s going to be walking around dripping cum and looking like she’s carrying your kids when she gets back to patrolling.");
	}
	else
	{
		output(" a torrent of [pc.cum] that splatters loudly into the subservient little bitch’s womb, filling her past capacity immediately. Her stomach blooms outwards as your seed swells her, drowning her fallopian tubes in your jizz while her womb stretches to contain your immense loads. The seconds go by as you grunt and strain, her eyes bulging as complete awe overwrites the expression on her face, some of the excess squirting back out of her cock-plugged cunt to spatter her shaking thighs.");
		output("\n\nHer hands drop from your back to her bulging, cum-pumped tummy as she lets out a whore’s moan, tilting her head back to expose her neck to you in the ultimate display of submission. This bitch is yours now.");
		output("\n\nYou pull out and a torrent of your seed immediately gushes from her well-fucked slit, splattering the ground between her quivering thighs while she moans loudly. It looks like she’s cumming all on her own this time, so spurred on by your essence flowing down her thighs is she. That baby bump isn’t going away any time soon, either. She’s going to be walking around dripping cum and looking like she’s carrying your kids when she gets back to patrolling.");
	}
	output("\n\n<i>“Not bad,”</i> you remark, at last lifting your hand from her throat and giving her one last slap across the face.");
	output("\n\n<i>“Oh! Oh my god, you are <b>exactly</b> what I need...”</i> she sighs, lying back and whispering. <i>“Thank you, [pc.daddy]...”</i>");
	output("\n\nShe’s not the type to desire aftercare. You leave her there on the ground, her limbs spread like a starfish and moaning happily as her eyes flutter closed, cum leaking from between her legs.");

	pc.orgasm();
	enemy.loadInCunt(pc);
	IncrementFlag("FIREPUP_SEXED");
	IncrementFlag("FIREPUP_SEXED_ROUGH");
	flags["FIREPUP_SEXED_LAST"] = 1;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerMeetsTheRealAlphaBitch(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(10+rand(21));

	output("You kneel over her and place your hand at her throat, a gesture that makes her respond with immediate joy. Her long pink tongue lolls out as you begin to choke her, breath coming in short, halting gasps when you allow her to breathe. She shudders and shakes in your grip, eyes rolling in her head as her back arches off the ground.");
	output("\n\nShe’s having <i>too</i> much fun. You loosen your grip slightly and slap her hard enough to bring her back to her senses, her cheek reddening immediately as she turns back to you with her shining eyes focused on yours, panting in bliss and taking long, grateful breaths. Squeezing the sides of her neck, you watch her head droop momentarily before you let go and she springs back up, drooling running from the corner of her lips.");
	output("\n\n<i>“Oh my god-- ghhk,”</i> she chokes, shivering beneath you, <i>“I think I love you!”</i>");
	output("\n\nYou give her a light slap to the other cheek and she gasps, tilting her head upward to expose more of her vulnerable neck while you circle around her labia with your other hand, stroking her oh-so-delicately with your fingers. She wants you to violate her, to rough her up and destroy her, but you’re not giving it to her. Not yet. Straining and panting, she lifts her hips upwards in a desperate plea matched by the look in her eyes before at last, falling back down in exhaustion.");
	output("\n\n<i>“Ready to listen to me?”</i> you murmur.");
	output("\n\n<i>“A-anything you say, [pc.daddy],”</i> she pants.");
	output("\n\nYou get her to sit up and turn around, your");
	if (pc.hasBreasts()) output(" [pc.breasts]");
	else output(" [pc.chest]");
	output(" against her back as she excitedly scoots back into your lap, fuzzy ears twitching in anticipation. She doesn’t at all expect the hand that comes down and slaps her right in the muff, setting her quivering as she lets out a high-pitched scream and pushes back against you. The sensation of her tail dragging itself across your [pc.stomach] as it tries to furiously wag doesn’t go unnoticed, and it halts when you raise your hand again, her entire body tensing up in anticipation of your next move.");
	output("\n\nShe’s completely caught offguard when you instead lean forward and bite her neck, tilting her head upwards in a show of utter bitch-like submission and moaning loudly, her muscles relaxing. <i>That’s</i> when you bring your palm down, even harder than last time, and earn a throat-vibrating howl of ecstasy that only cuts off when you reach up and choke it off.");
	output("\n\n<i>“Quiet, little bitch,”</i> you tell her, and you can feel her tail wagging again. She likes that name.");
	output("\n\nYou begin to rub her sensitized pussy, dragging your fingertips across her reddened lips and studiously avoiding any contact at all with her stiff, bulging clit. She doesn’t get to cum until you make it so, and she knows it. A happy whine escapes her mouth as you rub your middle finger between her dripping lips, digging into the wet warmth of her pussy. This bitch is so wet already you wouldn’t be surprised if she squirted all over your hand the moment you slid a finger inside.");
	output("\n\n<i>“<b>Don’t</b>,”</i> you murmur to her firmly, tightening your grip on her throat until her breath cuts out completely, <i>“cum. Don’t cum. Got that?”</i>");
	output("\n\nShe nods wildly in your hands, her hair flying everywhere in her eagerness. You let her go at last and she tilts forward, her head dragging downwards then to the side as she struggles back to life, taking a gasping breath.");
	output("\n\n<i>“Y-y-yes, " + pc.mf("d-daddy", "m-mommy") + ",”</i> she rasps, leaning back against your shoulder as the wetness between her legs redoubles. <i>“Oh, god...”</i>");
	output("\n\nYou lean forward and lick her windpipe right when you slide your middle finger into her sodden slit, marvelling at how tight she is. She cries out in joy at your carnal embrace, her walls flexing and clenching down on you, welcoming you inside with her entire body, wanting, needing you deeper. Her groan of lust is a beautiful sound, filling your ears as you sink your finger all the way in and slide it back out.");
	output("\n\nYou pump her calmly and steadily, adjusting yourself behind her until you can grind your [pc.pussy " + vagIdx + "] on her tail. She doesn’t even notice, too caught up in getting fucked to pay any heed to the feeling. That suits you just fine.");
	output("\n\nSlipping your hand from her throat and sliding it down to one of her breasts, you cup it gently and give her a slight squeeze before shifting to her diamond-hard nipple, rubbing it between your forefinger and thumb. She knows what’s coming and shivers in excitement, gooseflesh standing up on her areola as she arches her back to press her breast into your hand. A loud moan spills from her lips when you cruelly squeeze down on the sensitive flesh, pressing it into your thumb until she begins to shake.");
	output("\n\nBetween the middle finger pumping in and out of her dripping honeypot and the groping at her breasts, the huskar is panting and moaning in your arms like an eager whore.");
	output("\n\n<i>“" + pc.mf("D-daddy", "M-mommy") + ", can I cum yet? Can I cum, [pc.mommy]?”</i> she begs plaintively, grinding herself back into you.");
	output("\n\n<i>“Not yet,”</i> you whisper, the fur on her arms and legs standing up on end as she whines happily.");
	output("\n\nYou continue riding her tail, head over the huskar girl’s shoulder and feeling her body shiver against yours every time you plumb her tight, slick depths with your finger and squeeze her tits. She’s been teetering on the edge for minutes and now you’re getting closer yourself, ready to grant her the release she so desperately desires. You can hear her whimpers as you lean forward, roughly licking her neck as you issue the command.");
	output("\n\n<i>“Cum,”</i> you growl, grabbing her throat once more.");
	output("\n\n<i>“O-hhhk- my, g-ghk- god!”</i> she half-chokes, half-pants as spit flies from her mouth, your tight grip ensuring she never gets more than a word out at a time. <i>“Cuh-cuuhhmmmnnngggh!”</i>");
	output("\n\nFemcum squirts and squirts from her clenching pussy as you pop your finger free, grunting as your own orgasm rocks your [pc.hips] into her back. Not done with your fun just yet, though, you position your fingers over her oversensitive clit and begin violently rubbing her, suppressing the scream that threatens to rip from her throat with the other hand. She chokes and gasps, bucking and jerking like an animal, but never once makes a move to stop you.");
	if (pc.isSquirter()) output("\n\nYou squirt");
	else output("\n\nYou cum");
	output(" all over the ground listening to her slutty bitch wails,");
	if (pc.isNaga()) output(" wrapping her lower body in coils and pulling her legs apart to ensure");
	else output(" wrapping her legs in your own and forcing them apart, ensuring");
	output(" she’s wholly subject to your torturous overstimulation of her pussy. You finally let your hand slip from her throat and she doesn’t even seem to realize, making deep choking noises as she tries to reconcile the physical stimulation with her mental state, her furred legs trying to pull her meaty thighs together and failing. Finally, she gives in to the dominant handling and just lets herself continue squirting all over your fingers, almost crying in relief.");
	output("\n\n<i>“Good bitch,”</i> you murmur, sucking her neck hard enough to leave a mark.");
	output("\n\n<i>“Ooohhhnnn,”</i> she groans, tilting her head back over your shoulder. <i>“I love you...”</i>");
	output("\n\n<i>“I know,”</i> you reply, sticking your cum-soaked middle finger into her mouth. Her eyes droop half-closed as she sucks it, running her tongue across and over your skin until it’s completely clean. Giving her breasts a last hard squeeze, you");
	if (pc.isNaga()) output(" unwrap her legs and raise yourself, ready to leave.");
	else output(" unlink your legs from hers and get to your [pc.feet], ready to leave.");
	output(" The huskar flops onto her back, limbs spreadeagled and only just conscious after the fight followed by violent fucking.");
	output("\n\nYou don’t say anything to her as you depart, knowing she’s staring at your back and already fantasizing about the next time you’ll fuck her silly.");

	pc.orgasm();
	IncrementFlag("FIREPUP_SEXED");
	IncrementFlag("FIREPUP_SEXED_ROUGH");
	flags["FIREPUP_SEXED_LAST"] = 1;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsABoneToPlayWith(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(10+rand(21));

	output("You position yourself over the pyromaniac puppyslut, her tail sweeping against the ground as her excitement grows more palpable by the second. Just looking at your [pc.cock " + cockIdx + "] has her spreading her meaty thighs and panting hard, her cheeks burning red with lust. You don’t even need to tell her what to do. The moment your [pc.cockHead " + cockIdx + "] kisses her lips she closes her eyes and lets her tongue loll from her mouth, wrapping around your cockhead to pay it worship.");
	output("\n\nYou’ve got the feeling that left to her own devices, she’d happily get you off with her mouth -- eventually. But you have no intention of allowing her the leisure. You know how this woman operates; she wants to be held down and <i>fucked</i>, not to pleasantly suck your cock. Luckily for her, your goals currently align.");
	output("\n\nGrabbing her hair, you slide yourself right between her soft lips and across her warm, wet tongue into her tight little throat, forcing her to noisily gag under you. She coughs and splutters");
	if (pc.cLength(cockIdx) < 8) output(" into your stiff dick, her arms coming up to roughly grip and squeeze your [pc.thighs] as you force yourself into her.");
	else if (pc.cLength(cockIdx) < 14) output(" into your enormous prick, her arms coming up to roughly grip and squeeze your [pc.thighs] as you force your iron-hard length into her gullet.");
	else if (pc.cLength(cockIdx) < 23) output(" around your gigantic cock, her arms shakily coming up to grip and squeeze your [pc.thighs] as you force more than a foot of fat dick down her stretched-out gullet.");
	else output(" around your colossal cock, her arms shakily coming up to grip and squeeze your [pc.thighs] as you force an absurd amount of hard, fat dick down her slutty, stretched-out gullet.");
	output(" Saliva bubbles at her lips as she struggles to breathe, her back arching in sympathetic ecstasy.");
	output("\n\nYou’d half-expected it, but it’s still fun to see; as you");
	if (pc.balls > 0) output(" roughly press your [pc.balls] against her ");
	else output("r groin comes into contact with her chin");
	output(", her wide hips kick upwards and she cums violently, squirting all over the ground with bucks and jerks. She gurgles loudly into your cock, inadvertently swallowing it all down and hilting you inside her while her toes curl and her knees knock together behind you. You can see the whites of her eyes as they roll upwards into her head momentarily before she gets a grip on reality again, gagging hard against your");
	if (pc.balls > 0) output(" nuts.");
	else output(" dick.");
	output("\n\n<i>“You like that, don’t you?”</i> you murmur to the insatiable cockslut, giving her just enough freedom of movement to allow her a few enthusiastic nods. <i>“Thought so.”</i>");
	output("\n\nNow that she’s had her fun, you’re inclined to take yours. Raising your [pc.hips], you gradually slide your");
	if (pc.cLength(cockIdx) < 8) output(" stiff prick");
	else if (pc.cLength(cockIdx) < 16) output(" thick shaft");
	else output(" massive dick");
	output(" out of her throat and allow her a scant second to take a great, gasping breath before you slam it right back into her, cutting off her airway as you slip all the way into the recesses of her throat. Her eyes roll once more as she grabs your [pc.ass], holding you against her and squeezing as hard as she can as you grunt in pleasure. You let her feel it for a few seconds more, quietly choking against the base of your dick before you take it out and start pounding her sloppy oral fuckhole in earnest.");
	output("\n\nYou grunt and pant as you take her, stretching out into a new position to fuck her face even harder, her hips rising off the ground with every hilt-deep penetration. She clearly doesn’t spend much time sucking anyone else’s dick but it doesn’t matter, she’s so fucking tight and wet you’re about to explode into her stomach and leave her wanting a second round. You don’t bother warning her; with her hands busy groping at you, it’s not like she could do anything differently.");
	output("\n\nShe squeals into your throbbing prick as you cum, drowning her voice in");
	var cumQ:Number = pc.cumQ();
	if (cumQ < 1000)
	{
		output(" ropes of [pc.cum] that splatter her throat and drip down into her stomach, leaving her with a nice tummyful of your seed. You pull out and the bitch sticks her tongue out for the rest, getting a nice spurt of seed across it and her cheek before she pulls it in to swallow.");
		output("\n\n<i>“Good girl,”</i> you grunt, standing. She stays on the ground as you leave, two fingers in her throat and three shoved up her cunt, masturbating to the still-fresh memory of you blowing down her throat.");
	}
	else if (cumQ < 3000)
	{
		output(" streams of [pc.cum] that splatter against the back of her throat and run down into her stomach, leaving her insides [pc.cumColor] in its wake. You pull out and after several loud, painstaking swallows the bitch sticks her tongue out for the rest, getting a few spurts of seed across her face before she pulls it back between her lips with a grin.");
		output("\n\n<i>“Good girl,”</i> you grunt, standing. She stays on the ground as you leave, two fingers shoved up her cunt and the other hand rubbing her tummy, masturbating to the still-fresh memory of you blowing down her throat.");
	}
	else if (cumQ < 6000)
	{
		output(" a river of [pc.cum] that forcefully splats against the back of her throat and gushes down into her stomach, leaving her insides [pc.cumColor] in its wake. You pull out after emptying yourself inside her and after multiple loud, painstaking swallows the bitch sticks her tongue out for the rest, getting several squirts of thick seed across her face before she pulls it back between her lips with a grin.");
		output("\n\n<i>“Good girl,”</i> you grunt, standing. She stays on the ground as you leave, two fingers shoved up her cunt and the other hand rubbing her cum-swollen belly, masturbating to the still-fresh memory of you blowing down her throat.");
	}
	else
	{
		output(" a torrent of [pc.cum]. You hold her head in place and forcibly ejaculate down her throat as she gurgles, load after load swelling her neck outwards as it pumps down into her stomach, bloating her with your thick, roiling jizz like she’s nothing more than a drum to be filled.");
		output("\n\n<i>“Gllk! Glllrrrg- glk-”</i> she chokes, her throat bulging with your pulsing cumvein.");
		output("\n\nYou clutch her throat and <i>strain</i>, forcing more and more creamy spunk down her gullet as she gags, rivulets of your seed spurting from her nose every time you squeeze her. The slosh of fluids jetting into her stomach is just loud enough for you to hear it over her choked-out coughing, along with the femcum squirting from between her weakly shaking thighs.");
		output("\n\n<i>“Good girl,”</i> you grunt to the well-used huskar.");
		output("\n\nYou pull out the moment she passes out and roll her onto her side to squirt the remainder across her cheek and breasts, basting her upper half in your jizz before you leave. She’s already regaining consciousness by the time you’re");
		if (pc.isNaga()) output(" slithering");
		else output(" walking");
		output(" away, and by the looks of it the first thing she’s going to do is furiously masturbate while the memory of you plowing her cum-dripping face is still fresh in her mind. That’s about what you expected.");
	}

	pc.orgasm();
	enemy.loadInMouth(pc);
	IncrementFlag("FIREPUP_SEXED");
	flags["FIREPUP_SEXED_LAST"] = 1;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerPerformsMillenialMemes():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(10+rand(21));

	output("You squat over her and kneel facing her body, eyeing her beautiful tits while you plant your [pc.ass] on her face. She grabs your cheeks and squeezes, breathing hard against your [pc.skinFurScales] until you give her a command.");
	output("\n\n<i>“Lick,”</i> you growl.");
	output("\n\nShe obeys immediately, spreading your ass and laying her warm tongue against your [pc.asshole] to lick it from bottom to top, planting a wet, passionate kiss on the darker skin. Pressing her lips right into your");
	if (pc.hasPlumpAsshole()) output(" soft, sensitive ring");
	else output(" soft, saliva-slick hole");
	output(", she makes out with your ass like she’s a horny teenager, her legs spreading toes curling with the pleasure of submitting.");
	output("\n\nWhat an eager bitch.");
	if (!pc.hasGenitals()) output(" Thanks to being neutered you don’t even have to pay heed to your non-existent genitals,");
	else output(" You hardly find it necessary to " + pc.cockAndVagina("stroke your [pc.cocks],", "rub your [pc.clits],", " or "));
	output(" sighing contentedly as the huskar noisily and enthusiastically tongues your asshole. It’s only when she digs into you with a loud slurp, driving her tongue inches deep into your guts, that you groan in pleasure. She’s <i>good</i> at this.");
	if (pc.isHerm()) output("\n\nYour [pc.pussy] drips juices down her chin in time with your " + (pc.hasCocks() ? "cocks" : "cock") + " throbbing in your " + (pc.hasCocks() ? "hands" : "hand")); 
	else if (pc.hasCock()) output("\n\nYour " + (pc.hasCocks() ? "cocks throb" : "cock throbs") + " in response, flexing in your " + (pc.hasCocks() ? "hands" : "hand"));
	else if (pc.hasVagina()) output("\n\nYour [pc.pussy] drips juices down her chin in response, clenching beneath your circling fingers");
	else output(" You clench your ass tight then relax, alternating");
	output(" while your facesitting session continues. You’d have thought she’d run out of gas but this slutty cunt seems to be getting more motivated as she goes, outright tongue-fucking your asshole and pulling her thighs together in pleasure. When you lean forward to squeeze one of her nipples she gives you a muted scream of pleasure, her legs shaking and a little bit of girlcum squirting from her pussy.");
	output("\n\n<i>“You’re enjoying this just as much as I am, aren’t you?”</i> you ask her.");
	output("\n\n<i>“Mmmh-hmmmn!”</i> comes the muffled reply, punctuated by licks and sucks.");
	output("\n\n<i>“What a whore,”</i> you reply.");
	output("\n\n<i>“Mmmmmnnnn,”</i> she moans in assent, the vibrations running through you in a distractingly enjoyable manner.");
	output("\n\nYou’re getting closer by the second, driven onwards by the huskar’s unstoppable kink for sticking her tongue several inches up your asshole");
	if (pc.hasCock()) output(" to tickle your quivering prostate");
	output(".");
	if (pc.isHerm()) output(" You start jacking your straining " + (pc.hasCocks() ? "cocks" : "cock") + " harder, grunting in pleasure as you feel your muscles clenching up around her tongue. Having something to brace against makes the sensation even more intense, and soon your " + (pc.hasVagina() ? "pussies are" : "pussy is") + " right on the edge of orgasm too, just seconds away from explosive release.");
	else if (pc.hasCock()) output(" You start jacking your straining " + (pc.hasCocks() ? "cocks" : "cock") + " harder, grunting in pleasure as you feel your muscles clenching up around her tongue. Having something to brace against makes the sensation even more intense, and soon you’re downright growling in anticipation of what’s to come, your " + (pc.hasCocks() ? "hands" : "hand") + " flexed so tightly your veins stand out.");
	else if (pc.hasVagina()) output(" You desperately finger yourself while molesting your stiff, throbbing " + (pc.totalClits() > 1 ? "clits" : "clit") + ", arousal dripping and spurting from your slit all over the huskar’s upper half. She’s so good back there you’re right on the edge now, just seconds away from an explosive release.");
	else output(" It builds and builds inside you, making your muscles flutter and strain against her tongue, clenching around her until you’re right on the edge of an internal orgasm.");
	output("\n\nYou let out a massive groan as you cum,");
	if (pc.isHerm())
	{
		output(" [pc.cum] shooting from your pulsing " + (pc.hasCocks() ? "cocks" : "cock") + " as the huskar squeezes your ass and lifts her hips to spray femcum all over the ground.");
		if (pc.isSquirter()) output(" You match her by gritting your teeth and squirting [pc.girlCum] all across the huskar’s heaving, sweaty tanned tits and her bared tummy");
		else output(" You suffer your own vaginal orgasm just watching her, dripping [pc.girlCum] all across the huskar’s heaving, sweaty tanned tits");
		output(", gasping in dual release. You both cum as hard as you can, your fluids spattering all over her fight-warmed body until at last it’s over, the sensations still lingering as you pant on top of her.");
	}
	else if (pc.hasCock()) output(" [pc.cum] shooting from your pulsing " + (pc.hasCocks() ? "cocks" : "cock") + " as the huskar squeezes your ass and lifts her hips to squirt all over the ground. You jack yourself off all over her body, covering her in seed until she’s dripping with it, leaving a pool of seed between her heaving, sweaty tanned tits.");
	else if (pc.hasVagina())
	{
		output(" [pc.girlCum]");
		if (pc.isSquirter()) output(" squirting from your " + (pc.hasVaginas() ? "cunts" : "cunt") + " to spatter across the huskar’s heaving, sweaty tanned tits and her bared tummy, only to be matched when she lifts her hips and femcum spurts from between her shaking thighs onto the ground. You both cum as hard as you can, moaning while the spurt of juices slows to a trickle and then stops");
		else output(" dripping from your " + (pc.hasVaginas() ? "cunts" : "cunt") + " to spatter across the huskar’s heaving, sweaty tanned tits, only to be outmatched when she lifts her hips and femcum sprays from between her shaking thighs onto the ground. You both cum as hard as you can, moaning while the trickle of your juices slowly halts");
		output(", the sensations still lingering as you pant on top of her.");
	}
	else output(" your butt clamping down on her heated tongue so hard she can’t even move it, your muscles tensing in an inwards concentric ring as you cry out again and again, suffering what might be the most intense orgasm you’ve ever had. She lifts her hips and sprays femcum from between her legs when she feels you cum, bucking and jerking until she collapses back onto the ground and you almost follow suit, panting and gasping.");
	output("\n\nYou finally lift yourself off her and take a look. The insatiable bitch is laid out and gasping, tongue lolling from her mouth and eyes glossy as femcum slowly drips from her soaking wet cunt. Looks like she did end up enjoying it as much as you did.");
	output("\n\n<i>“You’re a disgusting little ass-slut,”</i> you tell her, nudging her as you make to leave.");
	output("\n\nThat sets her tail trying to wag under her, and she watches you with a look of longing as you depart. Hopefully you run into her again for some more of the same.");

	pc.orgasm();
	IncrementFlag("FIREPUP_SEXED");
	flags["FIREPUP_SEXED_LAST"] = 1;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsHerWorldFlippedUpsideDown():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(10+rand(21));

	output("<i>“Stand up, bitch,”</i> you say, jerking your head up. <i>“Get over here so I can pick you up.”</i>");
	output("\n\n<i>“Ooohhh, <b>fuck</b> yeah!”</i> she growls, bounding to her feet and crossing to you with a lusty grin. <i>“What’re you gonna do to me, huh? You gonna fuck me up?”</i>");
	output("\n\nYou slap the overexcited huskar across the face hard enough to make her gasp, leaving your hand on her reddening cheek as she curls her lips upwards in an ecstatic smile. She wordlessly raises her own hand to put it on yours, holding it against her sensitive, punished skin as she gazes at you in utter adoration.");
	output("\n\nPlacing your other hand on her firm, curvy ass, you pick her up and have her wrap her legs around your [pc.hips] for support, the huskar giggling as she pushes her groin into you and bites her lip. It takes");
	if (pc.tone > 80) output(" you no effort at all to get her oriented the other way around, sliding her head down your [pc.stomach] while you hold her juicy thighs and");
	else output(" some effort to get her oriented the other way around but you get it in the end, the pyro slut’s hands against your [pc.thighs] to support herself while you");
	output(" eye her needy, dripping slit. She starts before you do.");
	if (pc.hasCock())
	{
		output("\n\nHer tongue wraps around your [pc.cockBiggest] and you have to remind yourself to keep your [pc.legOrLegs] firmly planted in light of the exciting sensation, feeling her");
		if (pc.balls > 0) output(" lightly suck on your [pc.balls] before kissing your nutsack all over.");
		else output(" kiss and lick at your base like a long-lost lover.");
		output(" Forgoing one hand’s grip on your thigh she raises it to shakily take your shaft, holding it and raising herself up to lap at your [pc.cockHeadBiggest]. You shift against her, readying yourself for your next move.");
		output("\n\nThe moment she positions her open mouth above your stiff, flexing cock you drop her several inches, impaling her throat as she gurgles in realization. Her fingernails dig into you for a moment and then she relaxes, almost <i>purring</i> in happiness around your pulsating shaft. Acceptably subdued, she lets you begin pumping your hips, sucking down more and more of your rock-hard cock");
		if (pc.biggestCockLength() < 24) output(" until she’s noisily gagging and coughing around the base of it.");
		else output(" until you can’t get it any deeper than the two feet or so she’s noisily gagging and coughing around.");
		output("\n\nNo longer able to hold yourself back from the delectable pheromone-scented pussy before your eyes, you feel her entire body suddenly tense as your [pc.tongue] strokes her right between the lips, as though she’d forgotten you were going to do it. A little bit of femcum squirts across your tongue and down your chin upon your initial penetration, her plump thighs wiggling and tightening a little. As stimulated as she is between slutting it up on the end of your fat prick and having her cunt eaten, you don’t expect she’ll last very long.");
		output("\n\nYou’re not disappointed. After half a minute of having her mouth fucked and pussylips sucked she begins to shake and shiver, her thighs flexing until you can see the muscles lying beneath, then she lets it all go and squirts all across your [pc.lips] with a loud, suckling moan. She’s sweet on your tastebuds, driving you to tonguefuck her even harder and in turn spurring her on into cumming as explosively as she can, a gargling scream of bliss vibrating against your dick. Perhaps motivated or just desperately seeking to focus on something other than the mind-shattering overstimulation, she throws herself into pleasing you with reckless abandon, violently bobbing her head up and down your throbbing shaft.");
		output("\n\nThe way she works you like a shameless whore is nothing less than what you expect of her, and the way she so urgently tries to exceed your expectations has you wanting to give her exactly what she wants. Grunting as you fuck her from below and eat her out from above, you get closer to exploding in her throat with every thrust until your hips are shaking with the enormity of what’s about to happen. Recognizing your feral, animalistic need, the huskar hollows her cheeks and <i>sucks</i>, swallowing to tighten her throat around your entire length.");
		output("\n\nThat does it. You squeeze her asscheeks and roar, crying out in rapturous release as [pc.cum] shoots up into her throat. Gravity forces it from her nostrils but still she faithfully blows you through your entire orgasm, spurting and dripping your seed from her nose and lips. Each load you blow inside her just leaves her further gulping or throwing up jizz until at last you’re done with her, letting her slide down into a panting, sweaty heap on the ground.");
		output("\n\n<i>“Clean up every drop you spilled,”</i> you say, indicating the spilled semen all over the floor of the forge deck with a nod. <i>“With your slut tongue.”</i>");
		output("\n\nShe responds immediately, dragging herself to her knees to passively lick up every last drop and swallow it down, breasts swaying and tail furiously wagging as she bends to her task. The bitch is still cleaning up when you leave");
		if (!pc.isNude()) output(" fully dressed and equipped");
		output(", intent on following your instruction to the letter.");
		enemy.loadInMouth(pc);
	}
	else
	{
		output("\n\nHer tongue presses against your [pc.clit] to begin massaging it and you have to remind yourself to keep your [pc.legOrLegs] firmly planted in light of the exciting sensation. She’s a little calmer and more methodical than she usually is, your inner thighs flexing with every move she makes, [pc.nipples] hardening in response to her loving oral caresses. The delicious scent of the pheromones emanating from the slick, rosy pussylips between her legs is too much to ignore.");
		output("\n\nYou kiss her clit, ignoring the way she suddenly tenses up against you, and suck the sensitive little nub between your [pc.lips] to give it some proper care. She <i>moans</i> into you, catching herself before she loses focus and throwing her entire body into pleasing you, digging her fingertips into your legs and jamming her head between your tensing thighs to hungrily suck at your dripping wet lips. Licks and laps become sucks and slurps, the two of you noisily, wantonly sharing in each other with all the ardor of a secret, desperate rendezvous after months apart.");
		output("\n\nA feral need drives you onwards, slipping your [pc.tongue] into her sopping cunt and stroking her until you feel her shiver under your caress, then honing in on that point until she lets out a muffled scream from underneath you. The sweet flavor of her suddenly intensifies and she violently squirts in your mouth, her entire pussy clenching as she lets it all go and cries out in utter release. You swallow her down and don’t stop, pushing her over the edge of overstimulation as she shakily tries to endure.");
		output("\n\nEither by newfound motivation or a desperate need to focus on something that isn’t the way you’re electrifying her, she thrusts her tongue inside and begins tonguefucking you from below until you’re gasping and moaning between her labia, taking deep, willful inhales of her wonderful scent while you taste her on your lips. Kissing the entrance to her canal seems to drag her back towards the orgasm she thought she was escaping, and soon enough you’re approaching your own while she’s on the verge of suffering a second.");
		output("\n\n<i>“Cum, you little cunt!”</i> you gasp, squeezing her head between your shaking thighs.");
		output("\n\nShe <i>does</i>, filling your mouth with femcum sprayed from her quivering pussy while you");
		if (pc.isSquirter()) output(" squirt across her tongue and down her throat");
		else output(" cum on her tongue");
		output(", groaning in utter bliss in between swallows of her juices and sweeps of your tongue across your wet lips. The two of you hang trapped in what feels like endless ecstasy, bolts of lightning running up your spine as your stomach clenches and recoils with every rough, violent pang of orgasm, your [pc.pussy] clenching so hard your eyes momentarily roll upward.");
		output("\n\nWhen at last you’re done with her you let the huskar bitch slide into a sweaty, panting heap on the ground, lying on her back and gazing up at your bare pussy. She holds her tongue out and opens her mouth wide, catching a droplet and grinning as she swallows it down.");
		output("\n\n<i>“Good bitch,”</i> you murmur, picking up your gear. <i>“You can have more the next time.”</i>");
		output("\n\n<i>“Thank you, mommy,”</i> she whispers, gently rubbing her pussy as she watches you leave.");
	}

	pc.orgasm();
	IncrementFlag("FIREPUP_SEXED");
	flags["FIREPUP_SEXED_LAST"] = 1;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsWhatBadBitchesGet():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(5+rand(11));

	output("<i>“Come here,”</i> you instruct her, taking a seat. <i>“Lie across my lap.”</i>");
	output("\n\n<i>“Ooh, are you going to spank me?”</i> she murmurs, hopping onto her front and crawling towards you, pushing her face close to yours. <i>“[pc.Mommy] gonna punish [pc.his] little girl?”</i>");
	output("\n\nYou calmly place your hand at her throat and squeeze, choking the air from her lungs. Her eyes roll upwards as drool runs from the corner of her mouth, her lips pulled back in a grin of wild, unrestrained ecstasy. Her head begins to sag and droop as she struggles to maintain consciousness, the whites of her eyes showing until you finally release her.");
	output("\n\nThe moment she takes a ragged, choking breath you slap her across her slutty face, saliva flying from her lips on impact. Her only reaction is to show you the other one and smile, to which you respond by smacking her hard enough to instantly redden her tanned skin. After that, her implacable desire for you to fuck her up seems to be mollified, and she crawls into your lap with her tail slowly wagging.");
	output("\n\nShe’s not at all innocent and you know it. The way she’s showing off her big, curvy ass and subtly wiggling her butt, the huskar slut <i>wants</i> you to keep going, to leave her panting and red all over. That will come in time but for now, you need to teach this wanton bitch a lesson.");
	output("\n\n<i>“Stop,”</i> you murmur, feeling her immediately pause at your touch. <i>“Stay.”</i>");
	output("\n\nShe holds the position, on all fours with her belly over your groin. You lightly, casually run your fingers down her spine as she shivers, your hand drifting down to her asscheek and alighting upon it. Unable to completely hide her anticipation her fuzzy tail begins to wag before she forcibly stops herself, trying to obey your order to the letter. Your other hand goes under her, to her overlarge breasts, and when you cup one she can’t help but let out a quiet gasp.");
	output("\n\nSoftly and silently you rub her, lulling her into a tranquil idleness with gentle movements of your fingers, just barely acknowledging her diamond-hard nipple jutting from her areola with your fingertip. She wants it, <i>needs</i> it so badly that you can feel her straining to make you touch it, to titillate her, but you deny her the pleasure until her mind is so wholly focused on your hand the rest of the world falls away.");
	output("\n\n<i>SLAP.</i>");
	output("\n\nYour other hand whips against her jiggly ass so hard you palm stings in the wake of it -- but not half as much as her ass hurts. She <i>yelps</i> in pain and surprise, arching her back to get her rear lower, but to no avail. You spank her across the other cheek hard enough to make her squeal in genuine pain, hard enough to make tears well in her big green eyes. It doesn’t escape your notice, though, that between those big, red asscheeks, her pussy is so wet she’s dripping on your leg.");
	output("\n\n<i>“Do you like being punished?”</i> you ask her, gently running your fingertip between her inflamed, dripping lips.");
	output("\n\n<i>“Nooo,”</i> she moans, shaking in frustration. <i>“I hate it...”</i>");
	output("\n\n<i>“What would you rather be doing?”</i> you say.");
	output("\n\n<i>“Getting <b>fucked</b>,”</i> she groans, her tail drooping. <i>“I want you to fuck me, [pc.daddy]... I’ll be so good for you, I promise.”</i>");
	output("\n\n<i>“But you haven’t been good, have you?”</i> you murmur, holding your finger close -- so close -- to her stiff, sensitive clitoris. Close enough for her to feel your body heat and whine, knowing she can’t press herself into you lest she be punished and debating doing it anyway. You pull your finger away before she can make the decision herself and she slumps in defeat, the fight gone out of her. <i>“You’ve been a bad girl.”</i>");
	output("\n\n<i>“Nooooo,”</i> she whines, louder this time. <i>“I’m sorryyyyyy, I’ll be good...”</i>");
	output("\n\n<i>“Will you?”</i> you prompt her, watching her fervently nod before you at last sink your middle finger into her needy slit, reminding of what being a good girl feels like.");
	output("\n\n<i>“Oh! Oh my god, [pc.mommy],”</i> she whispers, closing her eyes and shuddering violently. <i>“I’m going to cum!”</i>");
	output("\n\n<i>“Promise me,”</i> you whisper, pumping her clenching, quivering cunt with your finger, letting her ride the utmost edge of an impossibly hard orgasm. <i>“The next time I see you, you won’t do anything but...”</i>");

	addButton(0, "Bend Over", coronaFlamersOrder, FIREPUP_BEND, "Bend Over", "Tell her to bend over and present her pussy for a hard fuck the next time you see her.");
	addButton(1, "Open Mouth", coronaFlamersOrder, FIREPUP_KNEEL, "Open Mouth", "Tell her to kneel and open her mouth for hard oral next time around.");
	addButton(2, "Up The Ass", coronaFlamersOrder, FIREPUP_BUTT, "Up The Ass", "Tell her to bend over and present her tailhole for a hard fuck the next time you see her.");
}

public function coronaFlamersOrder(order:int):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(2);

	switch (order)
	{
		case FIREPUP_BEND:
			output("<i>“The next time I see you, you won’t do anything but bend over like a good little bitch and let me fuck your little slut cunt,”</i> you whisper to her, pushing her closer and closer.");
			output("\n\n<i>“Yes! YES! ANYTHING!”</i> she screams, arching her back so fiercely her shaking tits are thrust upward as she cums. <i>“[pc.Daddy]! Ooohhhhh, [pc.daddy]yyy!”</i>");
			output("\n\nSatisfied with her answer, you let her cum, shoving your finger in as deep as you can and stroking her violently clenching walls as she grunts and squirts, eyes rolling in her head. The intensity of it all has worn her to pieces and now she can barely stay up on all fours, her arms shaking with the effort while she cums herself to unconsciousness. By the time she’s finished she’s laid across your lap, her eyelids drooping as she drifts to sleep in a pool of her own juices, the fur on her plump legs soaked through.");
			output("\n\n<i>“Don’t forget,”</i> you murmur to her as a reminder, rolling her off your lap as you stand.");
			output("\n\nThe next time you meet her should be fun.");
			if (!pc.hasCock() && !pc.hasHardLightAvailable()) output("\n\n<b>Better get a cock or strapon so you can make good on your promise next time!</b>");
			break;
		case FIREPUP_BUTT:
			output("<i>“The next time I see you, you won’t do anything but get down on all fours and let me fuck your tight little asshole,”</i> you tell her.");
			output("\n\n<i>“Yes! Yes! You can fuck my ass!”</i> she screams, clenching around your finger so tightly you can feel her hammering heartbeat as she cums. <i>“Oh! OH! GOD!”</i>");
			output("\n\nFemcum sprays from her quivering cunt in repeated spurts, her lower half rocking violently back and forth as she covers her thighs and furry calves in her own juices. By the time she’s done cumming so much has been taken out of her she slumps forward, her arms giving way beneath her. You roll her off you and bend down to whisper in her twitching ears.");
			output("\n\n<i>“Don’t forget.”</i>");
			output("\n\nThe next time you meet her should be fun.");
			if (!pc.hasCock() && !pc.hasHardLightAvailable()) output("\n\n<b>Better get a cock or strapon so you can make good on your promise next time!</b>");
			break;
		case FIREPUP_KNEEL:
			if (pc.hasCock()) output("<i>“The next time I see you, you won’t do anything but kneel and present your mouth to get fucked,”</i> you tell her.");
			else output("<i>“The next time I see you, you won’t do anything but kneel and present your mouth so I can ride your face,”</i> you tell her.");
			output("\n\n<i>“Yes! Anything you want! Oh! OH!”</i> she screams, squeezing her eyes shut as she cums. <i>“Hnnngh- nnnnnnhhhh!”</i>");
			output("\n\nShe squirts around your pumping finger so hard her juices spray across her thighs and the fur of her plump legs as well as the ground, coating everything behind her in a mist of her own femcum. Groaning, she collapses forward as her arms give out, slumping into a pool of her juices. She’s slipping towards unconsciousness even as you roll her off.");
			output("\n\n<i>“Don’t forget,”</i> you murmur to her as a reminder.");
			output("\n\nThe next time you meet her should be fun.");
			if (!pc.hasGenitals()) output("\n\nBetter get some genitals for her to please next time!");
			break;
	}

	flags["FIREPUP_PUNISHED"] = order;
	flags["FIREPUP_SEXED_LAST"] = undefined;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsAChanceToShowOff():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(5+rand(11));

	output("<i>“I dunno...”</i> you say, shrugging as you walk up to her. <i>“You’ll have to help me decide.”</i>");
	output("\n\n<i>“Of course,”</i> she purrs,");
	if (pc.isCrotchGarbed()) output(" removing your [pc.lowerGarments] for you.");
	else
	{
		output(" eyeing your");
		if (pc.hasCock()) output(" [pc.cockBiggest] eagerly.");
		else output(" [pc.pussy] eagerly.");
	}
	output(" <i>“Silly me, asking for a reward right away. What a bad dog I am - mmmmm...”</i>");
	output("\n\nShe finishes her sentence by");
	if (pc.hasCock())
	{
		output(" wrapping her lips around the head of your cock, eyes slowly fluttering closed as she moans in outright lust. What follows is one of the most enthusiastic and violent blowjobs you’ve ever gotten, the huskar woman slurping at your cock with animal need, slamming her nose into your groin and noisily gagging as she holds herself there.");
		output("\n\nWhen she draws back her eyes are beginning to tear up but she doesn’t care, hollowing her cheeks to suck on your [pc.cockHeadBiggest] while she watches for your reaction, then bobbing her head with deepening strokes until she’s back at the base of your prick, coughing and choking. She finally pulls back and lets the saliva run down her chin as she gasps for air, drooling all over the floor and grabbing at your [pc.legOrLegs].");
	}
	else
	{
		output(" pressing her mouth to your pussy and sucking at your lips, eagerly licking your juices up as she moans in outright lust. Then she’s grabbing your [pc.thighs] and shoving her tongue inside you in horny, artless desperation, tongue-fucking your slit and mashing her nose against your [pc.clit].");
		output("\n\nHer technique is absent but her enthusiasm more than makes up for it, tongue washing up and down your lips and sliding into your pussy for more whenever she thinks she can get some, stretching your labia with her lips. Eyes closed, she slaps wet, passionate kisses all over your saliva-slicked cunt, squeezing your [pc.ass] until she grinds her face upwards and gasps for air.");
	}
	output("\n\n<i>“<b>Fuck</b> me, [pc.daddy],”</i> she whispers, looking up at you");
	if (pc.hasLegs()) output(" from between your legs");
	output(".");

	applyDamage(new TypeCollection({ tease: 40 }), enemy, pc, "suppress");

	addButton(0, "Sure", coronaFlamerAboutToGitFukt, true, "Sure", "This woman is fucking crazy but she has the figure of a goddess and" + (flags["FIREPUP_SEXED"] == undefined ? " probably" : "") + " fucks like she fights, which is to say with utter abandon and joy mixed with violence.");
	addButton(1, "Nah", coronaFlamerIsntAGoodEnoughCockSuckerSlashRugmuncher, undefined, "Nah", "Not good enough.");
}

public function coronaFlamerIsntAGoodEnoughCockSuckerSlashRugmuncher():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	output("<i>“You’re alright, but nothing special,”</i> you sigh, stepping back as the huskar recoils like she’s been slapped across the face. <i>“Try harder next time.”</i>");
	output("\n\nShe gapes at you in utter shock, eyes wide, as though she can hardly believe you’re not going to pound her into the ground. Flopping backwards as you leave, she lets out an anguished moan. Serves her right -- hopefully she’ll do better the next time you ask her to convince you.");

	flags["FIREPUP_DENIED"] = 1;
	flags["FIREPUP_SEXED_LAST"] = undefined;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsASecondChanceToShowOff():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(10+rand(16));

	output("<i>“Eh,”</i> you say noncommittally. <i>“You didn’t do a very good job last time.”</i>");
	output("\n\n<i>“I will!”</i> she cries, scrabbling forward on her hands and knees to grab your [pc.thighs]");
	if (pc.isCrotchGarbed()) output(" and take your [pc.lowerGarments] off");
	output(". <i>“I’ll show [pc.daddy] I’m a good girl!”</i>");
	output("\n\nThat’s more like it. The huskar bitch throws herself into pleasing you, restraining her own desires for your benefit.");
	
	if (!pc.hasVagina() || rand(2) == 0)
	{
		var cawk:int = pc.biggestCockIndex();
		output(" She sucks your [pc.cockBiggest] like an experienced whore, licking at your [pc.cockHeadBiggest] before rubbing it against the warm inside of her cheek, lovingly running her tongue along its underside. Her glittering green eyes hold your gaze as she swallows you, all but begging for your approval as you grip her flowing hair.");
		output("\n\nShe’s doing a lot better now that she’s paying attention only to you instead of herself. You don’t even find it necessary to direct her; she bobs her head and sucks you deeper all on her own, trying not to gag");
		if (pc.biggestCockLength() < 8) output(" and barely suppressing the reflex as she takes a gasping breath.");
		else output(" and failing, coughing up spit but still focusing entirely on pleasing you. To her credit, it doesn’t stop her for a second, and she’s right back at sucking on your cockhead like an eager slut the moment she stops choking.");
		output("\n\n<i>“That’s right,”</i> you mutter to her, feeling her squeeze your thighs. <i>“Keep that up and you can get a reward.”</i>");
		output("\n\nHer tail begins to furiously wag behind her as the furry ears atop her head lay back; she’s really serious about getting that reward. Eyes closed, the huskar slut slathers your rock-hard cock with love and attention,");
		if (pc.biggestCockLength() < 8) output(" rapidly fucking her own face hard enough to make her skin slap against yours.");
		else if (pc.biggestCockLength() < 15) output(" fucking her own face hard enough to reach your " + (pc.balls > 0 ? "[pc.balls] and strain against them, just barely getting the tip of her tongue out from under your fat dick to lick at your nuts." : "groin. She’s <i>good</i> at this."));
		else output(" fucking her own face on your enormous dick. She can’t hope to reach your " + (pc.balls > 0 ? "[pc.balls]" : "groin") + " but fuck if she isn’t trying her damnedest, gagging and choking as she extends her tongue along your veiny underside.");
		output("\n\nThe closer you get to orgasm the slower and harder she goes, her every action deliberate and demonstrating just how much she’s learned about you in the past few minutes. You find yourself grunting in pleasure as she tends to you");
		if (pc.hasCockFlag(GLOBAL.FLAG_FLARED, cawk)) output(", your bloated flare slowly flowering in her throat as she gags on it");
		else if (pc.hasCockFlag(GLOBAL.FLAG_TAPERED, cawk)) output(", your tapered tip drooling precum into her throat while she gags around the rest of it");
		else if (pc.hasCockFlag(GLOBAL.FLAG_NUBBY, cawk)) output(", experiencing a form of uncommon pleasure watching her loudly gag on your barbed cock");
		else if (pc.cockCanSting(cawk)) output(", listening to her loudly gag as your envenomed stingers slap at the inside of her throat");
		output(". Reaching up to your [pc.ass], she grabs your cheeks and pulls you into her, skewering herself on your pulsating prick.");
		output("\n\nThat does it. With a strained, jaw-clenching groan you explode down her throat, [pc.cum]");
		var cumQ:Number = pc.cumQ();
		if (cumQ < 1000)
		{
			output(" spattering the back of it as she desperately swallows it all. In her heated ardor she manages to suck down every last drop and gulp it down, her tail slowly beginning to wag again when she realizes what she’s done. You rub her between the ears, the most affection she’s ever going to get out of you, as a reward for a job well done.");
			output("\n\n<i>“Good girl,”</i> you murmur.");
			output("\n\n<i>“Thgk oo ‘" + pc.mf("dy", "my") + "...”</i> she mumbles around your softening cock, slowly dragging herself backwards. <i>“Nnn...”</i>");
			output("\n\nYou note the puddle of girlcum beneath her, still dripping from between her juicy thighs. Seems like she’s gotten more than one reward, and why not; she did a stellar job.");
			if (pc.isCrotchGarbed()) output(" Re-dressing yourself, y");
			else output(" Y");
			output("ou leave her there on her back and stroking her tummy, happily moaning as her eyes flutter closed.");
		}
		else if (cumQ < 3000)
		{
			output(" gushing down her gullet as she tries to desperately swallow it all. Even chugging your loads down as fast as she can she can barely manage it, her throat working to try and keep it down as spunk spurts from her nostrils and she begins to tear up, but she manages to get it done in the end. You rub the seed-dribbling bitch between the ears, the most affection she’s ever going to get out of you, as a reward for a job well done.");
			output("\n\n<i>“Good girl,”</i> you murmur.");
			output("\n\n<i>“Thgk oo- gllrk,”</i> she chokes, spitting up semen from her nose as you step back. <i>“Nnngh-”</i>");
			output("\n\nYou note the puddle of girlcum beneath her, still dripping from between her juicy thighs. Seems like she’s gotten more than one reward, and why not; she did a stellar job.");
			if (pc.isCrotchGarbed()) output(" Re-dressing yourself, y");
			else output(" Y");
			output("ou leave her there on her back and stroking her tummy, happily moaning as her eyes flutter closed.");
		}
		else if (cumQ < 8000)
		{
			output(" pouring down her gullet and into her stomach in a long, continuous stream from your throbbing tip. Shocked into servility, the huskar stares up at you in wide-eyed awe as you pump load after load down her throat, filling her tummy to bulging with your seed.");
			output("\n\nShe barely seems to be able to process just what you’re doing to her, though you notice -- even though she hasn’t -- that she’s squirting all over the ground in submissive orgasm, too preoccupied with the pulse of your cum-spurting cock. Her entire body is held immobile until you finally finish draining yourself into her and pull back with a satisfied sigh, rubbing your bitch between the ears.");
			output("\n\n<i>“Good girl,”</i> you murmur.");
			output("\n\nShe blinks once, mouth still held in a wide-open O, and works her jaw before she gets the words out. <i>“Th-thank you for the reward, [pc.daddy]...”</i>");
			output("\n\nHer purpose served, you");
			if (pc.isCrotchGarbed()) output(" re-dress and");
			output(" leave her behind, lying on her back and stroking her seed-pumped tummy as her eyes flutter closed.");
		}
		else
		{
			output(" flooding her throat and splattering into her rapidly-swelling stomach as her eyes go wide, watching you in awe. Seed begins to violently spew from her nostrils until you reach down and hold them shut, her eyelids fluttering in alarm as she realizes you’re filling her up like a barrel drum with no intent to stop.");
			output("\n\nHer hands slip from your thighs to the sides of her burgeoning stomach as it swells, roiling with thick seed, her skin stretching taut until she looks like you’ve impregnated her with an entire sports team of your children.");
			if (cumQ >= 20000) output(" Even then the flow continues unabated, jetting down into her innermost recesses until you have to spread your legs and step over her to make room for her swollen belly. From this angle she’s looking straight up at you with your dick pointing right down to her tummy, and you have to admit it’s an enchanting view. Her eyes flick from your flexing cock to your face before they narrow, as if she can scarcely believe what you’re doing to her.");
			else output(" Her gaze continually flicks from the base of your flexing cock up to your face as if she can scarcely believe what you’re doing to her, staring you down with nothing but adoration in her eyes.");
			output("\n\nWhen at last you’re done pumping the pyromaniac pup full of jizz like little more than a condom, you pull out and let it slap her on the face. She responds only by looking up at you with half-lidded eyes and panting hard, the desire written all over her face. She’s going to want more of that whenever you want to give it to her.");
			output("\n\n<i>“What do you say?”</i> you ask her.");
			output("\n\n<i>“Th-thank you for the reward, [pc.daddy]...”</i> she mumbles, trying not to cough.");
			output("\n\n<i>“Good girl,”</i> you murmur, scratching the bitch between the ears.");
			output("\n\nHer purpose served, you");
			if (pc.isCrotchGarbed()) output(" re-dress and");
			output(" leave her behind, lying on her back and stroking her seed-pumped tummy as her eyes flutter closed.");
		}
		
		enemy.loadInMouth(pc);
	}
	else
	{
		var vag:int = rand(pc.vaginas.length);
		output(" She’s evidently wised up a bit, because this time the first thing she focuses on");
		if (pc.totalClits() > 1) output(" are your [pc.clits], running her warm tongue over them in equal measure and watching for your reaction. The way your [pc.legs] shake is apparently good enough feedback for her, repeating the route of her tongue while her fingers come into play.");
		else output(" is your [pc.clit " + vag + "], running her warm tongue over it again and again while she watches for your reaction. The way your [pc.legs] shake is apparently good enough for her, circling your rosebud with her saliva-drooling tongue and gently sucking it between her lips while she brings her fingers into play.");
		output("\n\nYou sigh in happiness as two of her fingers brush softly against your lips before pushing inside you, immediately crooking in a ‘come hither’ motion against your soft inner walls. So she <i>can</i> do this when she tries... you’ll have to remember that. Eyes half-lidded, you give her a smoldering look that very obviously informs her to keep doing what she’s doing and don’t dare to stop.");
		output("\n\nShe reaches up behind you and plants her hand on your [pc.ass] to pull you in, an invitation for you to wrap her head in your legs, and one you’re only too happy to accept. She looks a lot happier between your thighs, eyes dreamily half-closed while she tongues and fingers your");
		if (pc.vaginas[vag].looseness() < 3) output(" tight little slit.");
		else if (pc.vaginas[vag].looseness() < 5) output(" dripping cunny.");
		else output(" well-used fuckhole.");
		output(" No need for her to be a wild bitch when you can just keep her slutty little self here, where she belongs.");
		output("\n\n");
		if (pc.isSquirter()) output("<i>“Keep going and I’ll squirt in your mouth,”</i>");
		else output("<i>“Keep going and I’ll cum in your mouth,”</i>");
		output(" you murmur to her, grip tightening on her hair. <i>“You’d love that, wouldn’t you?”</i>");
		output("\n\nHer eyes widen momentarily as she realizes she’s <i>doing</i> it, she’s pleasing you, and her tail begins to wag behind her as she redoubles her efforts. She’s motivated now, fingering you with careful, loving strokes that make you bend at the knees, a quiet moan escaping your [pc.lipsChaste].");
		if (pc.hasToes()) output(" Your toes curl up as you slowly rock back and forth,");
		else output(" You slowly grind against her,");
		output(" running your quivering cunt over her probing tongue and shuddering in pleasure.");
		output("\n\n<i>“It’s coming,”</i> you caution her, hands grasping at her head and hair. <i>“Don- nh! Don’t stop now!”</i>");
		output("\n\nYou lift your head and let out a loud moan as you");
		if (pc.isSquirter()) output(" squirt [pc.girlCum] all over her tongue and down her throat");
		else output(" cum all over her tongue");
		output(", shaking and shuddering with her every tiny movement. This is <i>bliss</i>, and you reach down to squeeze her hair while your thighs press into her cheeks, trapping you between her legs as your little pussy-eating slave. She couldn’t be happier about it.");
		output("\n\n<i>“Uh! Nnh! That’s it,”</i> you pant, clenching your fists so hard your knuckles go white. <i>“Nnnngh!”</i>");
		output("\n\nThe huskar slut looks up at you with love written across her muff-drowned face as she drinks you down, slurping at your clenching pussy and sucking on your shivering lips as you groan in outright ecstasy. What a perfect little bitch she is.");
		output("\n\nYou release her at last with a gasp, stepping back as she obediently flops backwards, licking her lips. There’s a puddle of girlcum between her plump thighs, evidence she apparently enjoyed eating your cunt every bit as much as you did. You step over her and squat down, putting your dripping pussy against her face as you rub her between the ears.");
		output("\n\n<i>“Good girl,”</i> you murmur.");
		output("\n\nThat’s all the praise she’s going to get for you. Standing");
		if (pc.isCrotchGarbed()) output(" and getting re-dressed");
		output(", you make to leave as she lies on her back, moaning happily.");
		
		enemy.girlCumInMouth(pc);
	}

	pc.orgasm();
	IncrementFlag("FIREPUP_SEXED");
	IncrementFlag("FIREPUP_SEXED_ORAL");
	flags["FIREPUP_DENIED"] = undefined;
	flags["FIREPUP_SEXED_LAST"] = undefined;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerGetsRejected():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	if (pc.isBro()) output("\<i>“Think I’ll take my chances elsewhere,”</i> you grunt. <i>“G’luck.”</i>");
	else if (pc.isBimbo()) output("<i>“Nuh uh. You’re a naughty girl, and naughty girls don’t get presents,”</i> you say, shaking your head. <i>“Bad. Bad dog.”</i>");
	else if (pc.isNice()) output("<i>“No, I don’t think I will,”</i> you say, grimacing at the thought of it. <i>“Get some help, woman.”</i>");
	else if (pc.isMisch()) output("<i>“Haha, yeeaaaahno,”</i> you say, shaking your head. <i>“I don’t want my back raked to ribbons.”</i>");
	else output("<i>“You are fucked up,”</i> you mutter, shaking your head. <i>“The less I see of you the better.”</i>");
	output("\n\n<i>“What?”</i> she pants, looking up at you despairingly as you walk away. <i>“No! No! Don’t leave! Fuck, I’m so horny already! God- nnnghh!”</i>");
	output("\n\nHer frustrated moans follow you until she realizes you’re really not coming back for her and flops onto her back with a tired sigh. Hopefully you don’t run into her again.");

	flags["FIREPUP_SEXED_LAST"] = undefined;

	coronaFlamerVictoryEnd();
}

public function coronaFlamerVictoryEnd():void
{
	output("\n\n");
	IncrementFlag("FIREPUP_VICTORIES");
	if (CombatManager.inCombat) CombatManager.genericVictory();
	else addButton(0, "Next", mainGameMenu);
}

public function coronaFlamerIsTooHotForYou():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();

	output("<i>“Heh,”</i> the huskar says, grinning as you fall to your knees. <i>“Out of luck, home[pc.boyGirl]. I only fuck winners.”</i>");
	output("\n\nShe stalks towards you and rifles through your belongings, bending over with her pussy bared to your face. She’s <i>dripping</i> with excitement, feminine arousal rolling down her thighs unbidden.");
	if (flags["FIREPUP_SEXED"] == undefined) output(" Does she get off on the fire..?");
	else if (silly) output(" Of course... the hot ones are always crazy.");
	else output(" She’s getting off on these fights, on setting everything alight. A pyromaniac through and through.");
	output("\n\nApparently satisfied with what she’s got, she tosses your stuff back over her shoulder and straightens up, making to leave with your hard-earned money without a second glance.");

	addButton(0, "Fine", coronaFlamerLeavesCauseYoureACoward, 1, "Fine", "Whatever. You’ll make the money back elsewhere or take it back the next time.");
	addButton(1, "Beg", coronaFlamerPlsGetMeOff, undefined, "Beg", "Beg her to give you some relief.");
}

public function coronaFlamerPlsGetMeOff():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	output("<i>“Please,”</i> you gasp, calling out to her.");
	output("\n\nShe stops, looking back at you for a second before she turns on her heel, her expression blank as she walks back over and straddles you, sitting on your [pc.chest]. Grabbing your [pc.hair], she yanks you up and slaps you across the face so hard you see stars.");
	output("\n\n<i>“I <b>said</b> I only fuck winners,”</i> she says calmly, karate chopping you in the throat just hard enough to make you choke and cough. The moment you open your lips to do so, though, she forcefully spits straight into your mouth and closes it for you, firmly pressing her fingertip up into your chin. <i>“Shut the fuck up.”</i>");
	output("\n\nYou’re forced to exhale from your [pc.nose] instead, coughing erratically while she gazes calculatingly down at you. <i>“But I guess I could use you to get off.”</i>");

	addButton(0, "Change Mind", coronaFlamerLeavesCauseYoureACoward, 2, "Change Your Mind", "Change of plans.");
	if (pc.hasGenitals()) addButton(1, "Let Her", coronaFlamerIsCajoledIntoTakingHerPrize, undefined, "Let Her", "Give yourself over to this rabid huskar woman.");
	else addDisabledButton(1, "Let Her", "Let Her", "You don’t want to imagine how she’d react if she found out you have nothing for her to get off with.");
}

public function coronaFlamerIsCajoledIntoTakingHerPrize():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(4+rand(11));
	pc.lust(pc.lustMax());

	output("<i>“First things first...”</i> she murmurs, twisting around and");
	if (pc.isCrotchGarbed()) output(" pulling your [pc.lowerGarments] off.");
	else output(" checking on you.");

	if (pc.hasCock())
	{
		var bigDicks:Array = new Array();
		for (var cawk:int = 0; cawk < pc.cocks.length; cawk++) if (pc.cLength(cawk) >= 8) bigDicks.push(cawk);

		output(" <i>“Oh, good. At least you have a dick, so you’re not totally useless.”</i>");

		if (bigDicks.length <= 0)
		{
			output("<i>“Wait...”</i> she says, eyes narrowing as she pivots around, leaving her curvy ass in your face and leaning in closer. <i>“God damn it, your cock is fucking tiny! Fuck this, I’m going to go wrestle a Jumper girl into bed. Dumb bunnies at least fuck my pussy right.”</i>");

			addButton(0, "Fine", coronaFlamerLeavesCauseYoureACoward, 3, "Fine", "Let her go.");
			addButton(1, "Rim Her", coronaFlamerSitsOnYourFace, undefined, "Rim Her", "Pull her ass in and push your tongue out.");
			return;
		}

		cawk = RandomInCollection(bigDicks);
		
		output("\n\nShe slides down your body and spins around, sitting in your lap and taking your [pc.cock " + cawk + "] between her thick thighs. A few squeezes and you’re throbbing to life in her fingers, fully erect for her meaty body in seconds.");
		if (pc.cLength(cawk) < 14) output("\n\n<i>“Ooh, not a bad cock you’ve got here,”</i> she murmurs, rubbing her thumb over the [pc.cockHead " + cawk + "]. <i>“I was expecting smaller.”</i>");
		else if (pc.cLength(cawk) < 19) output("\n\n<i>“Ooh, big [pc.boyGirl],”</i> she purrs, patting your [pc.cockHead " + cawk + "]. <i>“Just like my favorite toys.”</i>");
		else if (pc.cLength(cawk) < 24) output("\n\n<i>“Oh, boy,”</i> she says, sarcasm heavy in her voice. <i>“It’s a good thing you’re not the one on top, because I bet you can’t fuck for <b>shit</b>. The big ones never can.”</i>");
		else output("\n\n<i>“You fuckin’ moron, who are you going to fuck with this?”</i> she curses, shaking your enormous cock. <i>“Fuck, this’ll show through my ribs if I take it in through my goddamn pussy!”</i>");
		if (pc.cLength(cawk) < 19) output("\n\nAlready so wet, she wastes no time aligning you with her slit -- and then, with a grunt, slamming her wide hips right into your groin to take you [pc.knotBallsHilt " + cawk + "]-deep in one swift, slick movement. A shiver runs up her spine, her massive asscheeks flexing and clenching together as a strained noise of pleasure slips from between her lips. Despite the ease with which she took you in, she is fucking <i>tight</i>. It feels like every inch of her is wrapped around your dick, constricting it from every angle.");
		else
		{
			output("\n\nYou’re slightly surprised when she oh-so-carefully aligns you with her slit, gently rubbing her netherlips up and down your cockhead before she pushes herself down, biting her bottom lip as her massive hips sink lower. She hisses in mixed pleasure and anger at the situation and you have to stifle your own groan of bliss for fear of retaliation -- she is fucking <i>tight</i> around your cock, as though every inch of her fertile body is wrapped around you.");
			output("\n\nThough the initial trip downwards is slow and halting, her complaints begin to dissipate and turn to moans the deeper she takes you until at last she’s sitting in your lap facing away and groaning in ecstasy. You can see her back arching and feel her thighs squeezing inwards as she rubs them together, her asscheeks clenched in pleasure. She’s clearly unused to your size but it looks like she’s growing to appreciate it...");
		}
		output("\n\nThe huskar girl raises her hips and you watch mesmerized as her lips grip you all the way to the very tip of your penis, only to wince as she slams herself back down onto your crotch with a feral grunt. She does it again, and again, each time getting faster and more wild in her movements until the slap of her big, curvy ass against your groin is ringing in your ears. She’s like a beast in heat, gripping your [pc.legOrLegs] and riding you with reckless abandon.");
		output("\n\nYou can understand what she meant -- she’s not fucking you, she’s <i>using</i> you, like you’re nothing more than a sex toy. Once you’re past the initial pain of impact, though, you hardly mind at all. Her slick, juicy cunt is so fucking tight you’re close to cumming by the time she has her first orgasm.");
		output("\n\n<i>“Ooohhhh, god, yeah,”</i> she moans, shuddering on the end of your iron-stiff cock as she runs her hands up her body, groping her own breasts. <i>“Nnnnnf, fuck...”</i>");
		output("\n\nThen she dismounts, letting your cock slip from her pussy with a slurp and immediately turning around to grab it and jack you off, ignoring your moans of protest. Then, right as you give up and close your eyes, secure in the knowledge that you’re at least about to cum impossibly hard, she stops completely and lifts her hand away. You open your eyes and try to hold back as you realize what she’s doing, but it’s too late.");
		output("\n\nYou cum without an ounce of pleasure, your");
		if (pc.balls > 0) output(" [pc.balls] tightening as they pump a");
		else output(" stomach tightening as you pump a");
		output(" meaningless load up your throbbing shaft and out of your stinging tip. The huskar watches you with a cruel smirk, relaxing as your ruined orgasm continues, wasted seed dribbling down your underside.");
		output("\n\n<i>“Haha, come on! Spew it all out,”</i> she jeers, grinning down at you. She");
		if (pc.balls > 0 && !pc.hasStatusEffect("Uniball")) output(" reaches in and squeezes your nuts, forcing the spunk upwards.");
		else output(" lightly flicks your cock, making it wobble in the air.");
		output(" <i>“Aaawww, you’re gonna be sooo backed up. Oops! But hey,”</i> she says, leaning in to whisper in your twitching ear, <i>“I did say I only fucked winners, <b>loser</b>.”</i>");
		output("\n\nShe’s gone by the time you recover, lying on your side. You’re missing credits, too. Sighing as you make your way to your [pc.feet], you clean yourself off");
		if (pc.isCrotchGarbed()) output(" and reclothe yourself before setting out again.");
		else output(" and set out again.");

		IncrementFlag("FIREPUP_SEXED");
		IncrementFlag("FIREPUP_SEXED_BEGGED");

		coronaFlamerLossEnd();
	}
	else
	{
		var vag:int = rand(pc.vaginas.length);
		output(" <i>“No dick. That’s a pretty pussy, though.”</i>");
		output("\n\nShe slides down your body for a closer look, watching your face as she slides two fingers right into your [pc.pussy " + vag + "] to gauge your reaction. Even biting your lower lip can’t stop you from moaning; it’s like she’s intimately familiar with your pussy, knowing just how to get you going. Your [pc.thighs] begin to draw inward before she forcefully spreads them with her hand, keeping them apart.");
		output("\n\n<i>“You’re so cute,”</i> she says, smiling. <i>“Makes me want to fuck you up.”</i>");
		output("\n\nYou have to admit having");
		if (pc.tallness > 77) output(" the shorter woman");
		else output(" the fit huskar woman");
		output(" call you cute makes your heart pound a little, though maybe it’s the way she’s so expertly manipulating your slit with her fingers. Your [pc.hips] struggle to rise and fall against her hands, shivering with pleasure while she lazily brings you closer and closer to an incredible orgasm. Stars, this is going to be <i>massive</i>-");
		output("\n\n<i>“I- I’m, I’m cumming,”</i> you gasp, back arching off the ground. <i>“Oh! O-”</i>");
		output("\n\nThe huskar woman pulls her fingers free of your quivering cunt and slaps you upside the face so hard your head lurches sideways, the stinging of your cheek all you can feel in the wake of it. Your orgasm dies down in seconds, the pleasure fading away while the huskar bitch smiles down at you, grabbing your hands and entwining her fingers in yours, slamming them to the ground as she leans in. Her warm, wet tongue trails up");
		if (pc.hasBreasts()) output(" between your [pc.breasts]");
		else output(" your [pc.chest]");
		output(" all the way to your throat, licking and suckling at your exposed, vulnerable neck.");
		output("\n\nThen, ever so slowly, the huskar bares her canines and places them at your neck, her hand finding its way back down to your [pc.clit " + vag + "] to rub you. You can feel her teeth slowly pressing into your [pc.skinFurScales], not yet breaking the skin but digging in hard enough that you can feel them scrape across your throat. Despite it all, despite the danger and the humiliation, you find your hips beginning to slowly jerk and roll with the movement of her fingers");
		output("\n\n<i>“<b>Oh</b>,”</i> you groan, your freed hand slowly coming to rest against the back of her head. <i>“Oh, stars...”</i>");
		output("\n\n<i>“I bet you’ve never been fucked like this before, little cunt,”</i> she whispers, sensually licking your throat. <i>“Or maybe it’s the experience of submission that makes you roll over for me so easily. Hm?”</i>");
		output("\n\n<i>“Nnnh- hhuh,”</i> you shakily moan, unable to turn your head or do anything but suffer the torturous so-close pleasure as she builds you up from nothing again.");
		output("\n\n<i>“Hmmmh,”</i> she murmurs, lifting herself away. <i>“Sit up and turn around.”</i>");
		output("\n\nOnce you’ve switched positions she roughly pulls you in against her, pressing her curvy breasts into your back as one of her hands comes to rest at your throat and the other returning to stimulating you below. By now she has you so wet you just want to <i>cum</i>, to make the burning lust inside you go away and to at last satisfy your desires. The domineering woman slides her fingers over your throat, still slick with her saliva as she gently rubs at your engorged clit.");
		output("\n\n<i>“So close now,”</i> she notes quietly, watching and feeling you shudder against her body, her legs coming around to softly entwine themselves with yours.");
		output("\n\n<i>“Ah,”</i> you gasp, your head tilting back as she delicately caresses your neck. <i>“Ah!”</i>");
		output("\n\nYou can feel it -- the little lightning bolts shooting up your [pc.thighs], flexing and trying to rub against each other but prevented by the huskar’s firm legholds. Your core begins to flutter as you press your shoulders back into her, all but melting against her while she takes you higher and higher.");
		output("\n\n<i>“Beg,”</i> she whispers in your [pc.ear]. <i>“Beg me to cum.”</i>");
		output("\n\n<i>“Please,”</i> you pant, breathless with desire. <i>“Please let me cum! Pl- hhhkk-”</i>");
		output("\n\nShe encloses her hand around your throat, choking the words from your mouth before you can even get them out.");
		output("\n\n<i>“I can’t hear you,”</i> she whispers even quieter. You can barely hear her yourself, the sound of rushing blood filling your eardrums until she relaxes her grip just slightly.");
		output("\n\n<i>“Please! Please let me c-gghk!”</i> you try to scream, rocking against her as she calmly strangles the air from your throat.");
		output("\n\n<i>“You want to cum?”</i> she murmurs.");
		output("\n\nAll you can think to do is nod, your face turning red as you bob your head in her grip, and then suddenly you feel it -- her fingers digging into your slippery cunt, curling upwards while her thumb comes down on your oversensitive clit. Letting out a strangled cry of bliss, you cum while being asphyxiated, your entire body trembling with the effort of release.");
		if (pc.isSquirter()) output(" You squirt");
		else output(" You drip");
		output(" all over the ground, shaking and gasping, your mouth open wide in a silent scream as she locks your legs open with her own.");
		output("\n\nShe makes you cum so hard you can feel your eyes rolling back, your [pc.feet] kicking as you lose control of your body, the choking getting more and more intense until you can’t keep it up any more. You’re still cumming violently as you feel your body go numb, drooling spit from the corner of your mouth.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she whispers. <i>“Good [pc.boyGirl].”</i>");
		output("\n\nThen everything goes black.");

		pc.orgasm();

		addButton(0, "Next", notHideOrHairOfTheCoronaFlamerThatBitYou);
	}
}

public function notHideOrHairOfTheCoronaFlamerThatBitYou():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	processTime(45+rand(196));

	output("You awaken groggy and sore all over, lying in a pool of your own juices... and stained with hers. You can only imagine she got herself off watching you slowly pass out while in the throes of orgasm. Cheeks flushed and shaking your head in an attempt to clear it, you dazedly make your way to an upright position");
	if (!pc.isNude()) output(" and check for your clothes.");
	output(" Some of your credits are gone, but you hardly notice.");
	output("\n\nRe-equipping your [pc.gear] and rubbing your neck, you slowly set off once more. You can still feel her fingers lingering at your throat...");

	pc.applyPussyDrenched();

	IncrementFlag("FIREPUP_SEXED");
	IncrementFlag("FIREPUP_SEXED_BEGGED");

	coronaFlamerLossEnd();
}

public function coronaFlamerSitsOnYourFace():void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(5+rand(11));

	output("You don’t give her the time to leave. Pulling her in as hard as you can, you shove your [pc.tongue] right up against her sweaty asshole, licking her butt with enthusiasm born of desperation. She murmurs approvingly from above, relaxing in your grip as she adjusts her legs to sit on your face more comfortably. You’ve convinced her to give you a chance; now you need to convince her to stay.");
	output("\n\nShe growls in lust as your tongue rubs against her sensitive squeezing ring, winking as it begins to gleam with your saliva. Clutching her cheeks, you gently spread them apart and teasingly wiggle the tip of your tongue at her dark entrance before thrusting it inside, transforming the deep rumble in her throat into a high-pitched moan of satisfaction. A shudder runs up her furred body from fat bottom to top, her back straightening as if she’s suddenly paying more attention.");
	output("\n\n<i>“Oh, you’re <b>good</b> at that,”</i> she purrs. Suddenly you feel a hand around your [pc.cockBiggest], squeezing you gently as you throb to life in her fingers. <i>“Keep going.”</i>");
	output("\n\nQuiet, breathy moans begin to spill from her lips as you swirl your tongue inside her, never focusing too much on one spot until you can <i>feel</i> how horny she is by the way she’s jerking your cock, rough and erratic in her rhythm. Then you press your face right between her asscheeks, digging in as deep as you can get");
	if (pc.hasLongTongue()) output(" and unfurling the entire length of your tongue to massage her insides.");
	output(" and concentrate on licking around her sensitized entrance.");
	output("\n\nThat does it. With a deep, strained groan of effort the huskar woman squirts all over your chest,");
	if (pc.hasBreasts()) output(" covering your [pc.breasts] in femcum.");
	else output(" covering your upper half in femcum.");
	output(" The longer you lick the harder she cums, her plump thighs shaking on either side of your body as more and more of her juices spurt and dribble down your [pc.stomach] while she pants in joy, almost whining as you drive your tongue inside her.");
	output("\n\nSo excited are you to be tongue-deep in this dominant cunt of a huskar’s guts, her lackadaisical efforts prove to be more than enough to get you off. [pc.Cum] spurts from your flexing cock, dribbling and flying all over her fingers. She makes sure to squeeze every last drop from you, running her thumb up your cumvein and over your [pc.cockHeadBiggest] to force it all out.");
	output("\n\n<i>“Oh!”</i> she gasps as you take your tongue back out, saliva dripping from her winking hole.");
	if (flags["FIREPUP_RIMMED"] == undefined) output(" <i>“Ooh... damn, [pc.boyGirl]. Never had that done for me before, but I think we’ve got a winner... I’m still gonna go find that Jumper to give me a good fuck, though.”</i>");
	else output(" <i>“Fuck... not bad, [pc.boyGirl]. I should keep you around to eat my ass more often. Maybe right after a Jumper fucks it.”</i>");
	output("\n\nWiping her hand off on your [pc.thigh], she hops up and stretches, squeezing her asscheeks together as drool runs between them. She gives you a wink over her shoulder as she bends over to pick up the flamethrower, showing her asshole off before walking away with a few of your credit chits. Well... that could have gone worse, given her inclinations.");
	output("\n\nYou get to your [pc.feet] and stand, checking yourself over");
	if (pc.isCrotchGarbed()) output(" as you re-clothe yourself");
	output(". You’re poorer, but there’s no lasting injuries except to maybe your ego. Onwards you go.");

	IncrementFlag("FIREPUP_SEXED");
	IncrementFlag("FIREPUP_SEXED_BEGGED");
	IncrementFlag("FIREPUP_RIMMED");
	pc.lust(15+pc.libido()/4);

	coronaFlamerLossEnd();
}

public function coronaFlamerLeavesCauseYoureACoward(reason:int):void
{
	clearMenu();
	clearOutput();
	showCoronaFlamer();
	processTime(1);

	switch (reason)
	{
		default:
		case 1:
			output("At least she didn’t turn you to bacon, so it could be worse. You sigh and pat yourself off, collecting your gear and scattered chits. Everything smarts and you smell like ash but you’re still here, albeit poorer. Probably best to make yourself scarce before you run into her again.");
			break;
		case 2:
			output("<i>“Fuck- fuck off,”</i> you cough, turning your head. <i>“Goddamn psycho.”</i>");
			output("\n\n<i>“Wow, you sound like every ex I’ve ever had,”</i> she says, sighing. <i>“Silly [pc.boyGirl].”</i>");
			output("\n\nShe drives her thick ass into you hard enough to force the breath from your lungs and uses the momentum to spring back to her feet, hopping off you and walking away with her flamer. You’re intensely thankful she <i>did</i> leave; you like your hips being intact. Slowly gathering up your things and standing, you give yourself a once-over.");
			output("\n\nYou smell like ash, but you’re still here. That’s a start. Now to recuperate and recover so you’re more prepared for a second round.");
			break;
		case 3:
			output("Sighing in disappointment, she springs off your laid-out form and walks away, picking up her flamer without a glance back. You’re left with your [pc.cock] hanging out and your ego stung in her wake, not to mention the rest of your body aching. With a soft groan, you climb back to your [pc.feet] and");
			if (pc.isCrotchGarbed()) output(" re-clothe yourself before picking up your gear.");
			else output(" pick up your gear.");
			output(" At least you’re still alive, albeit poorer. Now to recuperate and recover so you’re more prepared for a second round.");
			break;
	}

	coronaFlamerLossEnd();
}

public function coronaFlamerLossEnd():void
{
	// Taken from the slutsneks
	var stolenCreds:Number = pc.credits/4;
	if(stolenCreds > 1000) stolenCreds /= 2;
	if(stolenCreds > 5000) stolenCreds /= 2;
	if(stolenCreds > 10000) stolenCreds /= 2;
	if(stolenCreds > 20000) stolenCreds /= 2;
	if(stolenCreds > 40000) stolenCreds /= 2;
	if(stolenCreds > 80000) stolenCreds /= 2;
	if(stolenCreds > 200000) stolenCreds /= 2;
	stolenCreds = Math.ceil(stolenCreds);
	if(stolenCreds > pc.credits) stolenCreds = pc.credits;
	if(pc.credits < 100) stolenCreds = 0;
	
	pc.credits -= stolenCreds;
	output("\n\n<b>" + stolenCreds + " credits lost.</b>");

	if (CombatManager.inCombat) CombatManager.genericLoss();
	else addButton(0, "Next", mainGameMenu);
}

public const FIREPUP_KNEEL:int = 1;
public const FIREPUP_BEND:int = 2;
public const FIREPUP_BUTT:int = 3;

public function fireBitchPunishSceneAvailable():Boolean
{
	switch (flags["FIREPUP_PUNISHED"])
	{
		default: undefined: return false;
		case FIREPUP_KNEEL: return pc.hasGenitals();
		case FIREPUP_BEND: case FIREPUP_BUTT: return pc.hasCock() || pc.hasHardLightAvailable();
	}
	return false;
}

public function fireBitchBeingANicePuppyForOnce(order:int):Boolean
{
	clearMenu();
	clearOutput();
	showCoronaFlamer(true);
	processTime(15+rand(16));

	var cumQ:Number = 0;
	
	switch (order)
	{
		default:
		case FIREPUP_KNEEL:
			output("The flamer huskar spots you first, and alerts you to her presence with a loud clatter as she lets her heavy weapon fall to the ground and approaches you. She stops a few footsteps short and drops to her knees, spreading them to the sides as you watch, and opens her mouth as wide as she can. She looks like an utter slut, ready to go, and you’re only too happy to use her.");
			if (pc.hasCock())
			{
				output("\n\nYou step forward and brush your [pc.cockBiggest] against her face, moderately impressed when she doesn’t react at all except to hold herself still and gaze longingly up at you, just <i>wishing</i> you’d put it down her hot little throat.");
				if (pc.balls > 0) output(" Instead you dip your [pc.balls] into her mouth and she immediately closes her eyes to begin passionately sucking on them, rolling her warm, wet tongue across their surface until you lift them away and present the main article.");
				else output("\n\nInstead you rub the base against her tongue and she immediately closes her eyes, letting you do whatever you like to her, covering her in your scent until you lift yourself away and present the main article again.");
				output(" Once more she opens her mouth wide, watching and waiting, her tail betraying her joy at the situation.");
				output("\n\nYou don’t care if she gets off on this or not. What you do care about is the incredibly tight, warm and soft throat wrapping around your stiff cock as you step over her and begin to thrust your hips, holding the slut by her hair and roughly fucking her face as you grunt in pleasure. Stars, what she loses with inexperience she more than gains back with her complete and utter willingness to please. She gurgles and chokes beneath you and never once moves at all, gargling your cock in its entirety");
				if (pc.biggestCockLength() < 24) output(" while you thrust it to the hilt.");
				else output(" even as you thrust it into her stomach and leave behind precum in its wake.");
				output("\n\nControlling her so completely, it’s not hard to bust a nut down her throat. You grunt and strain, the huskar whore’s eyes widening in recognition while her tail begins to wag happily. [pc.Cum]");

				cumQ = pc.cumQ();
				if (cumQ < 1000) output(" shoots down her throat as her eyes roll up into her head in bliss, the familiar noise of her bitch pussy squirting all over the ground reaching your [pc.ears] while you empty yourself into her stomach. The moment you’re done you push her backwards coughing and choking, gagging on your cum mid-swallow.");
				else if (cumQ < 3000) output(" pours smoothly down her throat and into her stomach as her eyes roll up into her head in bliss, the familiar noise of her bitch pussy squirting all over the ground reaching your [pc.ears]. Her belly swells to contain your pumping loads until you’ve given her everything you care to and push her over into a puddle of her own juices, leaving her coughing and choking as she gags on your cum mid-swallow.");
				else if (cumQ < 6000) output(" gushes down her tight throat and into her gurgling tummy, pumping it full until her skin draws taut and begins to stretch outwards to contain your seed, her hands stroking the baby bulge. Only when you’re satisfied you’ve given her slut belly every last drop do you push her off the end of your prick into the puddle of juices her pussy squirted all over the ground during her usage, leaving her gagging and choking as she tries to draw air after her rough fucking.");
				else
				{
					output(" bursts down her flexing throat and fills her tummy to the brim immediately, each pulse of your throbbing cock depositing untold amounts of sperm into her as she swells to contain it all. Her eyes roll up into her head as she mindlessly orgasms, pussy squirting beneath her as you dump load after load down her throat and into her guts with a happy groan.");
					output("\n\nBy the time you finish she’s swollen to an absurd degree, unconscious on her knees with the whites of her eyes showing and spurting cum from both nostrils. Even passed out she’s cradling her incredibly bloated stomach, hands idly stroking the cum-blimp inside her. Now <i>that’s</i> a good use of a whore, you reflect.");
				}
				if (cumQ < 6000) output("\n\nYou depart with her struggling to gulp down the rest. The next time you run into her will be different now that her debt is paid but for now, you’re just glad to have blown a load down that bitch’s throat and taught her a lesson in being an obedient cumdump.");
				else output("\n\nYou leave her there like a little monument of your own virility, her plump breasts resting atop her hopelessly bloated stomach. The next time you run into her will no doubt be different now that she’s paid off her debt but for now, you’re just glad to have blown a load down that bitch’s throat and taught her a lesson in being an obedient cumdump.");
			}
			else
			{
				output("\n\nYou step forward and unceremoniously plant your [pc.pussy] on her lips, grinding yourself into her stuck-out tongue with a happy sigh. It’s only when you place your hand on the back of her head and grab her hair to pull her into you that she makes any move of her own, letting you use her however you want. With your tongue-slicked cunt in her mouth, though, your desire is fairly evident.");
				output("\n\nShe closes her eyes and sucks hard on your lips, running your sensitive skin between her bottom lip and her tongue in a double-sided massage. An indulgent moan of pleasure escapes your lips as the huskar pussyslut hones in on your [pc.clit], brushing her tonguetip across it with small, focused strokes that have you");
				if (pc.hasToes()) output(" standing on your tiptoes");
				else output(" flexing your [pc.legs]");
				output(" and squeezing your eyes shut in bliss. She knows what she’s here for -- to serve.");
				output("\n\nShe hasn’t touched herself at all, her hands sensually rubbing and squeezing your [pc.ass]. Groaning as she artfully sucks on your");
				if (pc.clitLength < 2) output(" stiff little button");
				else if (pc.clitLength < 4) output(" engorged nub");
				else output(" large, sensitive clitty");
				output(", you run your hands through her hair and tighten your grip -- you’re getting closer by the second, and she knows it. Lapping at you over and over, brushing her tongue up and down your dripping slit before passionately kissing your clit, she gets you there in a fit of moaning.");
				output("\n\nYou reflexively pull your thighs in as you cry out in release, gasping while [pc.girlCum]");
				if (pc.isSquirter()) output(" squirts all over her face and drips down her chin onto her heaving tits.");
				else output(" drips from your cunt onto her gentle tongue.");
				output(" Not even a moment later she joins you, moaning quietly as femcum spurts from between her legs and pools beneath her. Head raised and eyes shut as you enjoy your orgasm, you don’t notice her tail wagging submissively until you gaze back down at her with eyes half-lidded.");
				output("\n\nYou push her down and she flops backwards, spreading her legs and exposing her pussy to you as you");
				if (pc.isCrotchGarbed()) output(" re-dress and");
				output(" make to leave. No words pass between the two of you -- who would talk to a sex toy? -- but now that she’s paid her debt to you, the next time you meet will be different. Until then, though, you’re perfectly happy to have used her to get off and content knowing your juices are warming her tummy.");
			}
			break;
		case FIREPUP_BEND:
			output("You spot each other at the same time. The flamer huskar locks her fiery gaze on you and immediately approaches, dropping her flamethrower to the ground with a dull thud as you watch her stalk towards you. She doesn’t play, flirt, or work her fertile hips to entice you; she’s here to be your private cumdump, and she knows it. Turning on her heel, she bends over and presents you her plump ass, spreading her tight, curvy cheeks to reveal her dripping wet slit.");
			output("\n\nYou step forward, [pc.cockOrHardlight] in hand, and thrust yourself inside your slut’s tight, welcoming hole. She moans in lust as you sink into her warm, wet folds, coiling around");
			if (pc.hasCock()) output(" your [pc.cockHeadBiggest]");
			else output(" your sensitive cockhead");
			output(" until");
			if (pc.balls > 0) output(" your [pc.balls] lightly slap her in the clit");
			else output(" you’re hilted in her");
			output(" and you feel her shiver in utter bliss. Unable to even begin hiding her pleasure in being so dominantly taken, she pants and moans as you fuck her in earnest, intent only on getting off.");
			output("\n\nIt takes less than a minute of hard thrusting for your little bitch to cum her brains out, biting down on her lip and trying not to scream while you recklessly pound her squirting slit. Her juices spurt down her shivering thighs, her furred legs flexing fiercely as she wills herself to stay standing until you’re done using her. You give her a light spank for the effort and lean forward, grabbing her around her wide, womanly hips and starting to plow the fuck out of her.");
			output("\n\nAll pretense of stifling her voice is lost and she <i>screams</i>, her lust echoing across the forge deck as she’s overwhelmed, her cunt squeezing and flexing around your throbbing cock until you’re ready to give it to her. Reaching forward and roughly grabbing her hair, you pull her up and grunt, flexing your bicep and pulling your fist back hard enough that she’s staring you in the eyes from below with mouth wide as you cum.");
			if (pc.hasCock())
			{
				output("\n\n[pc.Cum] shoots up into her fertile womb as recognition flashes across her ecstasy-contorted face and she lets it all go, cumming all over your groin while you empty yourself inside her again and again. You leave her");
				cumQ = pc.cumQ();
				if (cumQ < 1000) output(" dripping with your essence, marked as your bitch");
				else if (cumQ < 3000) output(" with seed streaming down her thighs and her belly slightly swollen");
				else if (cumQ < 6000) output(" belly swollen outward with your cum and the excess flooding down her weakened thighs");
				else output(" with her womb utterly full and stretched, her belly absurdly swollen as the excess gushes from her sloppy cunt");
				output(", and push her off the end of your prick to her knees. She immediately turns around and leans in, closing her eyes as she sucks you completely clean.");
			}
			else output("\n\nYou grunt in orgasmic release as recognition flashes across her ecstasy-contorted face and she lets it all go, cumming all over your groin while you throb inside her cunny again and again. You leave her almost crying in relief and bliss and push her off the end of your hardlight to her knees. She immediately turns around and leans in, closing her eyes as she sucks the sensitive tool completely clean.");
			output("\n\nThe moment she’s done you");
			if (pc.isCrotchGarbed()) output(" redress and");
			output(" leave, sparing not a second thought for the huskar slut. The next time you meet will be different -- she’s paid her debt -- but this was little more than using a screaming, cumming fuckdoll. As far as experiences go, it wasn’t bad.");
			if (pc.hasCock()) new CoronaFlamer().loadInCunt(pc);
			break;
		case FIREPUP_BUTT:

			output("The huskar flamer spots you at the same time as you spot her, turning and walking towards you as she sheds her gear. Her weapon drops to the ground with a heavy clank, the straps securing her ammunition and covering her voluptuous tits springing free as she undoes them, and her last act is to bend down and place her combat visor on the ground before she turns around, gets on all fours, arches her back and raises her big, curvy ass for you without looking back.");
			output("\n\nThat’s more like it.");
			output("\n\nYou");
			if (pc.hasKnees()) output(" kneel");
			else output(" lower yourself");
			output(" down behind her,");
			if (pc.hasCock()) output(" grabbing your [pc.cockBiggest]");
			else output(" strapping your hardlight over your groin");
			output(" and aligning yourself with her cute little asshole. Though the huskar tries her best to relax you can still feel her muscles momentarily draw taut when you lay your hands on her puffy asscheeks, sweeping her tail forward to ensure it remains out of the way before she eases up again. She seems a little nervous, but that’s not your problem.");
			output("\n\nYou slide");
			if (pc.hasCock()) output(" your [pc.cockHeadBiggest] into her");
			else output(" the tip in");
			output(" slowly, relishing her groan of mixed pain and pleasure. She spreads wide around your");
			if (!pc.hasCock()) output(" thick, glowing shaft");
			else if (pc.biggestCockLength() < 14) output(" stud cock");
			else output(" enormous studcock");
			output(", clenching her fists and shivering as her back arches even further. You’ve got just the distraction she needs.");
			output("\n\nReaching forward, you gather her messy hair into an impromptu ponytail and yank her head backwards right as you thrust yourself to the hilt inside her,");
			if (pc.balls > 0) output(" your [pc.balls] slapping against her dripping, clenching pussy");
			else output(" your groin smacking her jiggling ass");
			output(" as she lets out a loud, tortured scream and lifts one leg, her toes curling. She lets out another when you draw back and slam yourself home, whimpering submissively as you begin to fuck her outright. She clearly doesn’t get it up the ass often, if ever, and you find yourself idly wondering");
			if (flags["FIREPUP_SEXED_ANAL"] == undefined) output(" if you’re taking her anal virginity.");
			else output(" if you were the one to claim her anal virginity.");
			output("\n\nYou push her front half down onto the ground, squishing her swinging titties into the floor while you claim her ass. Hammering away at her hard enough to make her bouncing cheeks clap against your [pc.thighs], you note the huskar’s bitch’s whines getting quieter and quieter until she begins to lustily moan instead, more and more liquid spattering to the ground between her legs. She’s still hurting, you can <i>feel</i> it, but now you’re forcing her to revel in the pleasure of her own brutal taking. That’s fine by you.");
			output("\n\nYou start to fuck her as hard as you can, piledriving her into the ground with every savage thrust, her pussy dripping and weakly spurting all over the floor as you get closer and closer to orgasm. Her anal ring clenches up on you and strokes your throbbing shaft from tip to base with every penetration, and at last it’s too good to resist.");
			output("\n\nWith a rough, feral grunt you hilt yourself inside her and cum,");
			if (pc.hasCock())
			{
				cumQ = pc.cumQ();
				output(" [pc.cum]");
				if (cumQ < 1000) output(" shooting into her heated bowels to lay claim to her insides, marking the bitch as yours. She responds by immediately squirting, unable to resist orgasming over being fucked like the bitch she is, streams of femcum spattering her squeezed-tight thighs. You pull out of her and watch your seed slowly drip from her ruined asshole for a moment, pooling in her folds and rolling downwards.");
				else if (cumQ < 3000) output(" surging into her heated bowels and filling her insides, marking the bitch as yours with a liquid bump in her stretched tummy. She responds by immediately squirting, unable to resist orgasming over being fucked like the bitch she is, streams of femcum spattering her squeezed-tight thighs. You pull out of her and watch your seed run from her ruined asshole for a moment, pooling in her folds and rolling downwards.");
				else if (cumQ < 6000) output(" flooding her heated bowels and swelling her tummy, stretching it taut with an absurd baby bump composed entirely of your seed. She responds by immediately squirting, unable to resist orgasming over being fucked and filled like the bitch she is, streams of femcum spattering her squeezed-tight thighs. You pull out of her and watch your seed stream from her ruined asshole for a moment, pooling in her folds and rolling downwards.");
				else
				{
					output(" flooding her heated bowels and surging up into her tummy, swelling her outwards in a second. You don’t stop there, though, wrenching her upward by her hair and catching her in a chokehold from the back with your other arm. Grunting and pumping her from below, you watch her grow and grow, her stomach gurgling loudly as she strains to hold it all until, at last, the inevitable happens.");
					output("\n\nShe makes a wet retching sound and tries to extend her neck, her mouth reflexively falling open as her body prepares her for what’s to come. All that falls out is a thick, never-ending stream of your seed as her pussy squirts violently into your groin, cum coursing through her entire body to pour from her yawning mouth. The huskar slut begins to go limp in your arms while you hold her there, forced to regurgitate every excess gallon of spunk you’re pumping inside her overtaxed body, her stomach swelling further even now.");
				}
			}
			else output(" throbbing in her heated bowels as you lay claim to her insides, grinding yourself into her. She responds by immediately squirting, unable to resist orgasming over being fucked like the bitch she is, streams of femcum spattering her squeezed-tight thighs. You don’t pull out until she’s completely drained, moaning like the whore she is.");
			if (pc.hasCock())
			{
				if (cumQ < 6000) output("\n\nYou leave her softly moaning on the ground, seed gleaming in her winking butthole and her insides stuffed with spunk. As far as making use of a cumdump goes, that was pretty great. The next time you meet will be different now that she’s fulfilled her promise to you, but there’s no reason you can’t just plow her into the ground all over again. You’ll have to think about what to do the next time you beat her down.");
				else output("\n\nBy the time you’re done she’s little more than a doll filled with spunk, the whites of her eyes visible as you push her down and onto her side. She coughs, gags and sputters as you" + (pc.isCrotchGarbed() ? " redress and" : "") + " make to leave, vomiting up great gouts of seed that leave her gasping for breath. The next time you see her will be different now that her promised punishment is over but you don’t expect that’ll be a lesson the slutty cumdump will forget any time soon.");
			}
			else output("\n\nYou leave her softly moaning on the ground, pussy dripping and asshole winking. As far as making use of a cumdump goes, that was pretty great. The next time you meet will be different now that she’s fulfilled her promise to you, but there’s no reason you can’t just plow her into the ground all over again. You’ll have to think about what to do the next time you beat her down.");
			IncrementFlag("FIREPUP_SEXED_ANAL");
			if (pc.hasCock()) new CoronaFlamer().loadInAss(pc);
			break;
	}

	pc.orgasm();
	flags["FIREPUP_PUNISHED"] = undefined;
	IncrementFlag("FIREPUP_SEXED");

	addButton(0, "Next", mainGameMenu);

	return true;
}