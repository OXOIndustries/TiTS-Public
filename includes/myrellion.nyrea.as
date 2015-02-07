public static const NYREA_UNKNOWN:uint = 0;
public static const NYREA_ALPHA:uint = 1;
public static const NYREA_BETA:uint = 2;

public function nyreaHeader(nyreaType:uint = NYREA_UNKNOWN):void
{
	author("Savin");
	
	switch(nyreaType)
	{
		case NYREA_UNKNOWN:
			showName("\nNYREA");
			showBust("NYREA");
			break;
			
		case NYREA_ALPHA:
			showName("ALPHA\nNYREA");
			showBust("ALPHANYREA");
			break;
			
		case NYREA_BETA:
			showName("BETA\nNYREA");
			showBust("BETANYREA");
			break;
		
		default:
			break;
	}
}

public function nyreaHeaderFromCreature(target:Creature):void
{
	if (target is NyreaAlpha) nyreaHeader(NYREA_ALPHA);
	else if (target is NyreaBeta) nyreaHeader(NYREA_BETA);
	else nyreaHeader();
}

public function encounterNyreaHuntress():void
{
	clearOutput();

	var nyreaType:uint = NYREA_UNKNOWN;
	var nyreaEggs:Boolean = false;

	nyreaHeader(nyreaType);

	if (rand(10) < 4)
	{
		nyreaType = NYREA_ALPHA;
		if (rand(10) < 6) nyreaEggs = true;
	}
	else
	{
		nyreaType = NYREA_BETA;
		if (rand(10) < 4) nyreaEggs = true;
	}

	output("As you make your way through the dark caverns, you become increasingly aware of a mounting feeling of unease. As if something is watching you, hidden just out of sight in the darkness of the tunnel. You slow your pace, hand drifting down to the");
	if (pc.hasRangedWeapon()) output(" butt of your gun");
	else if (pc.hasMeleeWeapon()) output(" hilt of your [melee.weapon]");
	else output(" ground, picking up the meatiest rock you can find to defend yourself with");
	output(") as your [pc.ears] perk up, listening for any trace of a possible assailant.");

	output("\n\nYou turn, just in time to see something rushing out of the darkness at you!");

	var missedNet:Boolean;
	if (pc.RQ() / 2 + rand(pc.RQ() / 2) > 50)
	{
		missedNet = true;
		output(" You tumble out of the way just in time as a net soars by you, its weights clattering against the stone as it flies back in the darkness.");
	}
	else
	{
		missedNet = false;
		output(" You give out a startled yelp as a heavy net slams into you, throwing you to the ground under its entangling weight.");
	}
	output(" From the darkness, a feminine figures steps out,");
	if (missedNet)
	{
		output(" tsking her tongue as she follows her wide-flying net with her eyes, clearly disappointed");
	}
	else output(" taking advantage of your vulnerable state to loom over you threateningly, spear leveled at you.");
	if (nyreaEggs)
	{
		output(" <i>“I'm not too picky where I put my eggs,”</i> she growls, circling you, <i>“Even an offworlder will do in a pinch. So why don't you just make this easy on yourself and submit. You might even like it.”</i>");
	}
	else
	{
		output(" <i>“You look like a healthy breeder,”</i> she growls, circling you, <i>“so why don't you just make this easy on yourself and submit. You might even like it.”</i>");
	}

	if (!CodexManager.entryUnlocked("Nyrea"))
	{
		output("\n\nYou stare at the insectile woman as your codex beeps, <i>“Warning: Nyrea encountered. This species’ females are known to be extremely hostile, and may attempt to use unsuspecting travelers as breeding stock or as incubation space for her eggs. Caution is recommended, especially around the species' pseudo-penis.”</i>");

		output("\n\n<i>“Cute toy,”</i> the huntress grins, twirling her spear. <i>“Don’t think it’ll help you now, though.”</i>");
	}

	processTime(10);

	clearMenu();
	addButton(0, "Fight!", nyreaFight, [nyreaType, nyreaEggs]);
}

public function nyreaFight(settings:Array):void
{
	var nyreaType:uint = settings[0];
	var nyreaEggs:Boolean = settings[1];

	var tString:String;

	if (nyreaType == NYREA_ALPHA) tString = "NYREA ALPHA";
	else tString = "NYREA BETA";

	startCombat(tString);

	if (nyreaEggs) foes[0].createStatusEffect("Nyrea Eggs", 0, 0, 0, 0, true, "", "", true, 0);
}

// ALPHA Nyrea have more health, plus a SHIELD bar. Betas are faster-moving / have a higher dodge chance. They're more lust-focused in their attacks, but as they take damage, will switch to more physical attacks (especially Power Strike and Net Throw). 

public function alphaNyreaAI():void
{

}

public function betaNyreaAI():void
{

}

public function nyreaSpearThrust():void
{
	/*
	//Basic Attack
	They nyrea charges forward, thrusting her heavy spear at you!
	//Miss: You duck aside, letting her momentum carry her past you.
	//Hit: She turns the blade at the last second, slamming the blunted haft of the spear into your chest, throwing you back with the force of the blow!
	*/
}

public function nyreaMeatSpin():void
{
	/*
	//Basic lust attack. She'll use this especially against females.
	With a lusty grin, the nyrean woman pulls up her chainmail bikini, letting her massive pseudo-cock flop out. Her hands rub across the long length, emphasizing its huge, blunted head and the fearsomely thick knot at its base, clearly ready to tie you like a bitch. She thrusts her hips, making the semi-turgid member bounce. A dribble of lubricant is flicked out, splattering across your [pc.face].
	Miss: You wipe her cock-drool off with disgust.
	Hit: Unwittingly, you breathe in at that exact moment, getting a full blast of the potent sexual aroma the insectile beauty is giving off. 
	*/
}

public function nyreaPowerStrike():void
{
	/*
	//Rarest of her attacks, ramps up use on low HP. Lower chance to hit, but HEAVY damage. Has a chance to STAGGER the PC.
	The nyrea woman rushes at you, leaping into the air and issuing a mighty warcry as she slams her spear down at you with crushing force.
	Hit: You cry out as the spear crashes into you, throwing you to the ground with nearly bonecrushing force. You blink hard {thankful your shields held / wiping blood from your brow"} as your vision swims. The nyrea, battered herself, scowls at you. "You wanted to do this the hard way!" {You are STAGGERED}. 
	Miss: You tumble out of the way in the nick of time, looking back to see the huntress crash into the ground, nearly falling over thanks to the force of her attack. She staggers to her feet and scowls. "You wanted to do this the hard way!"
	*/
}

public function nyreaPoledance():void
{
	/*
	//Her preferred lust attack against males. 
	The nyrea plants her spear in the ground, leaning heavily on the sturdy shaft, pressing it between her impressive rack. "Like what you see?" she giggles, voice suddenly sultry as she leans back from the haft, twisting around you give you a full view of her taut ass and long, chitinous legs. She bends over, rubbing her spear through her crack, smearing it with her psuedo-cock's ample pre. "Come off it already... put your weapons down... {if beta: I promise you'll be glad you did // if Alpha: You can't win against a body like mine... I'm so above your class, offworlder. Just submit, like you know you want to}."
	Miss: You look away from her tantalizing display, doing your best to contain your lust.
	Hit: You can't deny the growing heat in your loins as the nyrea puts on a show for you, all but inviting you into her embrace... 
	*/
}

public function nyreaNetThrow():void
{
	/*
	//She'll use this frequently to disable the PC, especially as she starts taking damage. Inflicts RESTRAINED.
	Using her longspear to force some distance between you, the nyrea reaches into her pack and pulls out another hunting net. With a flick of her wrist, she hurls it at you.
	Miss: You roll aside, letting the net go clattering off into the darkness.
	Hit: You try and dodge, but too late! You give a yelp as the heavy net carries you down to the ground, entangling you! 
	*/
}

public function nyreaMilkRub():void
{
	/*
	//Light lust attack, heals some of her HP
	Giving you a cocky look, the nyrea pulls up the thin veneer of chain covering her ample bosom and cups her tits, giving them a long, obviously-pleasurable squeeze. A trickle of cream-colored milk spurts out at her touch, barely needing to be coaxed. She winks at you, bringing one of her teats to her lips and drinking long as the other drizzles all over her body, which she deftly rubs into her skin and armor. 
	Miss: God, that smells delicious...
	Hit: You try to contain the watering of your mouth as you watch the lewd display in front of you. What you wouldn't give for a taste of that sweet cream...
	*/
}

public function pcLossToNyrea():void
{
	clearOutput();

	nyreaHeaderFromCreature(foes[0]);

	output("You give a cry of surprise and pain as the nyrea deftly knocks your [pc.weapon] out of your hand, shoving you back up against a cave wall - and pressing herself tight against you, already pulling the chain bikini off from around her hefty tits, letting them press against you as her fingers work into your [pc.gear], beginning to peel it off.");
	
	output("\n\n<i>“I knew you’d come around,”</i> she purrs. You suddenly become very aware of the pseudo-cock pressing into your thigh, already dribbling pre.");

	//Nyrea Has Eggs: Buttstuff
	//Cockworship, then oviposition :D
	if (foes[0].hasStatusEffect("Nyrea Eggs") && !pc.isPregnant(3))
	{
		output("\n\n<i>“It’s your lucky day, offworlder,”</i> the huntress grins, one of her chitinous hands wrapping over the pseudo-cock between her legs, too large to get her fingers completely around. <i>“I’ve got a belly full of eggs desperate for somewhere to go.”</i>");
		
		output("\n\nHow does that make you <i>lucky</i>!?");
		
		output("\n\n<i>“Best get me ready, offworlder,”</i> she coos, giving you a gentle push down onto your [pc.knees], putting your face on level with her thick shaft, its X-shaped slit glistening with moisture. <i>“I’d hate to damage you... too much.”</i>");
		
		output("\n\nAs if to emphasize the subtle threat, the huntress’s thumb brushes across the net of soft little spines growing from the crown of her rod. They don’t look sharp or stiff enough to hurt you, but the idea of them dragging through your");
		if (!pc.hasVagina()) output(" bowels");
		else output(" [pc.cunt]");
		output(" sends a shiver through you. Her other hand plants itself atop your head, brushing");
		if (pc.hairLength > 0) output(" through your [pc.hair]");
		else output(" across your bare scalp");
		output(" and slowly pulling you toward the flared haft of her cock.");

		if (pc.isTreatedFemale() || pc.isBimbo()) output(" It may not be a REAL cock per-se, but your spunk-craving brain’s primal instincts kick in all the same, and you practically leap onto the offered rod, wrapping your [pc.lips] eagerly around the thick crown.");
		else
		{
			output(" You struggle against the nyrea’s grasp, but you’re far too");
			if (pc.HP() <= 0) output(" battered");
			else output(" aroused");
			output(" to resist her for long. You put up only what amounts to a token resistance before you find your [pc.lips] pressing into the slip of her over-sized egg-layer, flicking across the crown of her prick.");
		}
		output(" The Huntress coos, guiding you down the length of her shaft with firm, unyielding hands. You quickly find your lips spread around what feels like an arm’s girth of nyrean cock, the blunted crown battering against the back of your throat. You gulp it down, suppressing your gag reflex and opening your throat up like a pussy for the chitinous beauty to fuck.");
		
		if (foes[0] is NyreaAlpha)
			output("\n\n<i>“That’s it, offworlder.... You do know how to pleasure a woman, don’t you? If only more of my harem sluts had your touch...”</i>");
		
		output("\n\nThe nyrea’s hands settle on the sides of your head, holding you steady against the jagged cavern wall. All you can do is try not to choke on the massive rod as she starts to piston into you, using her hips to pound away into your mouth. Tears well up in your eyes as the dull spines on her cockhead rake through your throat, not truly painful but intensely discomforting. The swell of her knot hammers against your [pc.lips], even thicker than the mighty shaft you’re being face-fucked with, and much too big to get your lips around");
		if (pc.isTreatedFemale()) output(" no matter how much you may want to");
		output(". The fleshy bitch-breaker only grows as your throat plays pussy for her cock, swelling to terrifying thickness in front of your eyes.");
		
		output("\n\nThe huntress sees where your eyes are going and grins down at you. <i>“Better prepare yourself. I need that inside you to release my eggs, after all.”</i>");
		
		output("\n\nYou gulp around her cock, your utterly pillaged throat clenching tight enough to send a shiver of pleasure through the nyrea’s body. She grunts tersely after that, and pulls her prick out of your mouth without warning. You’re left coughing and gasping for breath, bridges of spittle trailing between your abused lips and the slathered crown of the huntress’s thorny pseudo-cock.");
		
		if (foes[0] is NyreaAlpha)
		{
			output("\n\n<i>“Not bad,”</i> she coos, grabbing you by the scruff of the neck and shoving you onto all fours. <i>“I can feel my eggs stirring... my young aching for release.”</i>");
		
			output("\n\nShe plants a chitinous foot on your back, pinning you down as she strokes herself overtop you. <i>“You’ll take good care of my eggs, won’t you, offworlder? Perhaps you’ll spread my spawn to the stars. Ah, they’ll be like gods to my people.”</i>");
		}
		else
		{
			output("\n\nThe huntress groans, rapidly stroking herself. <i>“I can’t... I can’t keep my eggs back much longer, offworlder. I need to get them out... I need to put myself inside you now, okay?”</i>");
		
			output("\n\nNot that you have much choice in the matter. You hazily nod your understanding as she gives you a gentle push onto all fours. <i>“Just relax... it won’t hurt. You’ll just feel full afterwards. I know; plenty of alphas like to give me their eggs, too.”</i>");
		}
		
		output("\n\nYou lie there with your ass in the air, ripe for the huntress’s pleasure. She slowly lowers herself down, latex-smooth fingers brushing across your [pc.skin] as she rips away your [pc.gear]. One of her hands cracks against your [pc.butt], a spank hard enough to rip a yelp of surprise from your lips");
		if (pc.buttRating() >= 12) output(" and leave your big butt jiggling");
		output(". While you’re recovering, a single chitin-clad digit slips between your cheeks, sloppily wet with the huntress’s own spit, and presses against the ring of your [pc.asshole]. You suck in a sharp breath as the huntress presses it into you, sliding it into the knuckle and slowly thrusting, getting you nice and ready. You let your head sink down to the cavern floor, trying not to look at the bristling, knotted mammoth hanging between her legs. Dread courses through you as the huntress finishes with her finger, drawing it out of your ass with a wet pop. Her legs shift, almost straddling your upturned backside, and her ovipositing cock drops heavily between your cheeks. You shudder as the soft barbs around her crown tease the over-sensitive flesh of your [pc.butt], scraping down your bare [pc.skinFurScales] until the flared head rests squarely against your [pc.asshole].");
		
		output("\n\n<i>“Try and relax,”</i> the nyrea urges, her hands gripping your [pc.hips] firmly. Easy for her to say! You take a deep breath to steady yourself, trying to force your anus to unclench. Regardless of your readiness, though, you soon feel a mounting pressure as the huntress");
		if (silly) output(" mounts");
		else output(" starts to penetrate");
		output(" you. A mix of pleasure and pain overtakes you as the elephantine pecker pushes your ass in, spreading your sphincter wide around its flared cockhead. Your eyes go wide, mouth curling open in a scream that just fails to come, leaving your lips agape in a silent <i>“O.”</i>");
		
		output("\n\nMore than the heft of her cock, you feel the soft barbs ringing her flare scraping along the insides of your [pc.asshole]. Your back arches like a whore’s, instinctively reacting to the alien sensation. Seeing your reaction, the huntress gives your [pc.butt] another slap, making you clench around the intruding pseudo-cock and driving its spines hard against your spasming walls. She digs into you inside and out, fingers sinking into your backside and spines grinding against your anal walls. The huntress doesn’t thrust or grind, just slides herself ever deeper inside you, her sheer size forcing your guts out of the way and stretching you out like a condom around her shaft.");
		
		output("\n\nLooks like she’s not as interested in fucking as much as she is in laying her eggs in you. The way she’s going, it isn’t long before the sensation of her prick sliding into you gives way to an immense pressure resting against your stretched-out hole: the nyrea’s knot. You gulp, finally giving in and looking at her over your shoulder. Her eyes are rolled back, long tongue lolling out of her mouth - totally consumed by pleasure. Completely on instinct, however, her hips press relentlessly against you, trying to brute force the knot inside you. There’s not much you can do about it, other than try not to scream as she starts to ramrod the knot into your [pc.asshole].");
		
		output("\n\nIt’s not one final plunge that gets her knot in, but a series of short, jerking thrusts; she has to work herself into you, inch by agonizing inch. You feel something change as she does so, a sudden flush of moisture rushing into your stretched-out bowels, followed by a throbbing in her knotted cock so powerful that you can feel the huntress’s heartbeat through her member, pulsing between the walls of your [pc.asshole].");

		output("\n\nSomething shifts <i>inside</i> her cock, coming up slowly from within the huntress. She thrusts as much as her tied position allows her, working the first of her eggs out. You squirm uncomfortably as her cock engorges inside you, and your gut is filled with a distinctly ovular, smooth shape that squirts into you and settles against your stomach, stretching your bowels out in a whole new way.");

		pc.loadInAss(foes[0]);

		var pData:PregnancyData = pc.getPregnancyOfType("NyreaEggs");
		
		output("\n\n<i>“Take my eggs,”</i> the huntress growls as the hefty orb enters you, lodging in your ass amid the sticky swamp of sexual fluids she’s squirting. Another egg soon follows, discharged into your rapidly-growing belly.");
		if (pData.pregnancyQuantity >= 4) output(" Another comes");
		if (pData.pregnancyQuantity >= 5) output(", and another, until");
		else if (pData.pregnancyQuantity == 4) output(" and");
		if (pData.pregnancyQuantity >= 4) output(" you count "+ pData.pregnancyQuantity +" big, hard-shelled eggs now resting inside you.");
		
		output("\n\n<i>“Finally free,”</i> the nyrean woman sighs, resting a hand on her own belly. <i>“Goodbye, my young. Live well and flourish.”</i>");
		
		output("\n\nYou groan as the huntress drags her barbed cock out of you, dragging those spines of hers back through your rectal passage and leaving you feeling loose and full at the same time. She stands, running a surprisingly affectionate hand across your up-turned ass and down to your belly, caressing the swell of your now-visible pregnancy. <i>“Take care of my young, hmm?”</i>");
		
		output("\n\nAll you can do is groan weakly, trying to adjust to the added presence of the huntress’s eggs inside you. She winks at you and departs, slipping off into the darkness.");

		pc.orgasm();
	}
	else
	{
		//Eggless Nyrea: Gib Sperm
		//Nyrea teases and strips the PC, then either fucks her cunt if female (whoops!) or gets confused and demands the PC explain what's up and also give her some sperm... somehow! 

		output("\n\n<i>“Now you’ll get to father my young,”</i> the huntress adds, her hands rubbing all over you, tits squeezing so hard against your [pc.chest] that a little dribble of moisture beads on her black nipples. <i>“I’ve never been with an offworlder... I wonder what our children shall look like, hmm?”</i>");
		if (!pc.hasCock()) output(" She clearly doesn’t realize just how impossible that is!");
		
		output("\n\nYou squirm under her grasp, trying to evade her playful hands and failing miserably. She grins at you, slipping a hand");
		if (pc.isNude()) output(" across your [pc.chest]");
		else output(" under your [pc.gear]");
		output(" and pinching one of your [pc.nipples], making you suck in a sharp breath. <i>“Come now, there’s no reason we can’t enjoy each other, is there? Just relax, and we can both walk away happy...”</i>");
		
		output("\n\nIt’s not like you have much choice. Might as well enjoy it, right? You let your hands slip down past the huntress’s waist and grab a couple handfuls of her backside, squeezing her ass until the pseudo-cock pressing against your thigh jumps with excitement. <i>“That’s the spirit!”</i> she laughs, starting to strip off your [pc.gear]. Her smooth, chitinous hands play across your [pc.skinFurScales], working slowly towards the space between your [pc.legs], eagerly approaching your [pc.crotch].");
		
		//PC has a cock, no vag scene
		//Awkward! PC explains that he’s not a female, nyrea awkwardly asks how they’re going to couple. PC gets a very experimental handjob from the nyrea.
		if (pc.hasCock() && !pc.hasVagina())
		{
			output("\n\nThe huntress slowly but surely strips off your [pc.gear], baring your body for her perusal. Smooth fingers play across your body, exploring what to her must be a fairly alien form. You return the favor, groping and caressing her hips and butt, trying to guide her wandering hands downwards toward your [pc.crotch]. She takes the hint, but not before slipping out of her chainmail top and offering the swells of her bare breasts to you. She slips a hand behind your head, guiding you down to one of her big, black nipples. You take it eagerly, wrapping your [pc.lips] around it and suckling. A stream of sweet, rich cream answers your call, flooding into your mouth in a steady stream. It’s almost candy-like, making you shiver with pleasure at the taste.");
			
			output("\n\nThe nyrea giggles, urging your head further into her bust. <i>“You like it? Good. Some say a female’s milk increases virility. You’ll need it, when I’m done with you.”</i>");
			
			output("\n\nJudging by the huge hard-on she’s sporting, you don’t doubt it. How exactly she intends to drain the spunk from you, though, you can’t imagine. Her hand slips down from your head and down to her own prick, stroking herself to full hardness - she’s as thick around as your arm, and nearly as long. You shudder as the soft, feline spines crowning her flared cockhead brush your bare thigh, and again as she starts to grind her hips against you, rubbing her cock against your own.");
			
			output("\n\n<i>“I’d heard you offworlders had strange genitals,”</i> she says, chewing on her lip and looking down towards your akimbo cocks. <i>“You are a... male of your species, yes?”</i>");
			
			output("\n\n");
			if (pc.mf("m", "f") == "f") output("Considering she’s a female of her race with a beast like that between her legs, you suppose you can forgive the oversight. ");
			output("A hand clasping around your [pc.cock], giving it an experimental stroke, wrings a nod of affirmation from you. The huntress’s brow furrows as her hand caresses your rod, stroking you to hardness. <i>“How do... how do members of your race breed, offworlder?”</i>");
			
			output("\n\n<i>“What.”</i>");
			
			output("\n\nShe scowls at you. <i>“What does a male do with... with this?”</i> She tugs your dick for emphasis.");
			
			output("\n\nYou awkwardly try and explain the birds and the bees to the huntress. As you speak, you can see the confusion written blatantly over her face, especially when you mention inserting your dick into a girl’s vagina. Her eyes dart between your [pc.cock] and her own pole of meat.");
			
			output("\n\nShe takes a step back and says, <i>“You can’t expect to put yours... in mine... that won’t...”</i>");
			
			output("\n\nShe plants her free hand on her hip, glowering in consternation as she tries to figure out how to copulate with you. After a moment, she slips down onto her knees, bringing herself down to your dick’s level. She looks up at you, still pumping your shaft, and asks, <i>“If I... caress this enough, your seed will spill out, yes?”</i>");
			
			output("\n\nYou nod, adding a subtle hint to be gentle with your member.");
			
			output("\n\nShe thinks another moment, gives you a determined nod, and cups one of her breasts. She squirts a little of her sweet breastmilk into her hand, just enough to get her chitinous hand slick, and gets herself a firm, wet grasp on your [pc.cock].");
			
			if (foes[0] is NyreaAlpha) output("\n\n<i>“How strange,”</i> the huntress murmurs,");
			else if (foes[0] is NyreaBeta) output("\n\n<i>“I’ve never done anything like... like this before,”</i> the huntress says to you,");
			output(" starting to stroke you again, her fingers gliding along your [pc.cock]. Your fingers clutch at the jagged wall behind you, your back arching as the nyrea picks up a little speed, growing more confident in her motions as she goes. After adding a little more milk, her hand starts to really glide across your cockflesh, pumping from base to [pc.cockHead] to ease. You actually see her smile a bit after a while - she’s really getting the hang of this! A little bit longer and you’ll be giving her that seed she’s working for.");
			
			output("\n\nDeciding to press your luck, you murmur between husky moans that maybe she’d have better luck using her breasts to milk out your sperm.");
			
			output("\n\n<i>“My breasts?”</i> she says, cocking her head to the side and cupping one of her tits.");
			
			output("\n\nYou nod, telling her that many off-worlders enjoy milking sperm that way, and explain how to go about it. She listens intently the whole while, still jerking you off as she does so. Only when you get to the part about wrapping her big, milky tits around your [pc.cock] and humping away with her entire body does she actually stop, looking up at your incredulously. <i>“You mean like this?”</i> she asks, dropping your prick and squeezing her breasts together; a little trickle of milk seeps out between her fingers. You nod encouragingly.");
			
			output("\n\n<i>“This is embarrassing,”</i> she huffs, moving her hands slightly to let you holster your [pc.cock] between her ample mounds.");
			
			output("\n\n<i>“You’re the one who wanted to breed,”</i> you answer, casting a glance to her awkward pseudo-cock, still hanging half-hard between her legs. She scowls, muttering about how she ought to have just found a nice, pussy-bearing male nyrea full of semen-sacs for her to fuck. You interrupt her with, <i>“Do you want my cum or not?.”</i>");
			
			output("\n\n<i>“Fine,”</i> she snaps, using her hands and shoulders to wrap her tits around your shaft. You grin down at her, running a hand through her spiny hair and up her long, tapered ear. She shivers with pleasure when your fingers brush her ear, her flesh flushing a shade darker. You rub it gently, just enough to urge her to start moving in turn. Unsteadily, her whole body moves, using her knees to propel herself up and down your milk-slick shaft. She drags you slowly through the wet valley of her cleavage, making it into a nice little pussy to fuck you with. It’s not tight, really, but her tittyfucking is nice and wet and surrounded by soft, yielding flesh that seems to swallow your cock.");
			
			output("\n\nYou assure the huntress she’s doing good, which earns you");
			if (foes[0] is NyreaAlpha) output(" a scowl that reminds you that - at least in theory - she’s in charge here");
			else if (foes[0] is NyreaBeta) output(" a proud smile from the huntress, and even a lick across the [pc.cockHead] of your prick when it pops up from between her boobs");
			output(". You smirk down at her, though your grin quickly gives way to a groan of pleasure as she starts to move faster, almost matching the prior pace of her hands while bouncing on her knees.");
			
			output("\n\nIt doesn’t take much of that to finish what her hands had started. Your [pc.balls] churn");
			if (pc.balls <= 1) output("s");
			output(" as the huntress lavishes your [pc.cock], treating it with all the love and attention of some alien god. You try to warn her, but the huntress seems to catch the drift before you say a word, looking up and locking eyes with you with a big, lustful grin on her face.");
			
			output("\n\nShe didn’t know what she was getting herself into, though. A few more pumps of her tits, and you feel a surge of spunk rushing up your [pc.cock], and straight onto her face. The nyrea gives a startled squeal, squirming as a thick spurt of [pc.cumNoun] splatters across her face. She turns a cheek, letting the next several squirts smear her neck and jaw before settling into a steady trickle into the valley of her tits, forming a little lake of cum between them. When her eyes flicker back open, they’re instantly drawn to the little pool of spunk, which she samples with her long tongue, spooning it up to yourself.");
			
			output("\n\n<i>“I’ve never... tasted it before,”</i> she murmurs.");
			if (foes[0] is NyreaAlpha) output(" <i>“I’ve tasted worse things, I suppose.”</i>");
			else if (foes[0] is NyreaBeta) output(" <i>“It’s... actually really good,”</i> the beta huntress giggles, eating a little more.");
			
			output("\n\nAfter a few moments, though, the nyrea remembers her purpose in this whole affair, and scoops up some of your [pc.cum] towards her ovipositor-cum-cock. Awkwardly, she grabs her shaft and fingers a little bit of your spooge in through her X-shaped slit, shivering as she rubs it in.");
			
			output("\n\n<i>“You offworlders are odd,”</i> she comments, paying you no further mind as you gather your equipment and skedaddle.");

			pc.orgasm();
		}
		//PC has a vag.
		//PC gets fucked. Poor nyrea has no idea she can’t get pregnant from fucking a cooch! Who knew?");
		else if (pc.hasVagina())
		{
			var tVag:int = pc.biggestVaginaIndex();

			output("\n\nThe strange alien woman makes steady progress to the slit of your [pc.cunt " + tVag + "]");
			if (pc.hasCock()) output(", ignoring your [pc.cock] despite her stated desire to breed");
			output(". You squirm under her caresses, heart racing as her chitinous fingers brush along the lips of your sex.");
			
			output("\n\n<i>“Mmm. This part of you certainly wants me,”</i> she teases, bringing up a pair of black-clad fingers glistening with");
			if (pc.wetness(tVag) <= 3) output(" moisture");
			else output(" [pc.girlGumNoun]");
			output(". You flush as she laps it off her digits, cleaning them off one by one. <i>“I can all but taste your virility... you’ll give me fine young, won’t you offworlder?”</i>");
			
			output("\n\nDoes she... does she think you’re...?");
			if (CodexManager.hasViewedEntry("Nyrea")) output(" You vaguely remember something about male nyrea having genital slits not unlike pussies, but surely she can’t think that you’re built like her race. You don’t have sperm sacs lodged somewhere up your twat!");
			
			output("\n\nBefore you can give voice to your less-alien biology, the huntress plants a newly-cleaned hand on your shoulder and forces you down onto your [pc.knees], putting you right on level with her half-hard rod. It’s a massive slab of meat, better suited for a pony than the insectile huntress before you, as thick around as your arm and cresting a foot in length. A ring of soft, blunted spines surrounds her shaft’s flared head, surrounding a thick X-shaped slit that drools a murky moisture. She bucks her hips forward, ramming her shaft against your [pc.lips], demanding entry. You try to protest, but quickly find yourself with a mouthful of nyrean prick parting your lips. You gag and sputter as the massive rod slides home into your mouth, making you open wide to take the huntress’s inhuman girth. Her hammering hips slam you hard against the cavern wall, dazing you enough that you can do nothing to stop her forceful face-fucking.");
			
			output("\n\n<i>“Get me nice and ready");
			if (foes[0] is NyreaAlpha) output(", slut");
			output(",”</i> the huntress commands, thrusting into your gaping maw. Her soft barbs scrape across your cheeks, teasing you with just enough drag to make your head bob with every thrust. Her hands play across your [pc.hair] and [pc.ears], gently but firmly holding you in your place. That place, of course, is as her personal fucktoy, little more than an onahole to wet her cock in. All you can do is try and relax, opening yourself utterly to the huntress’s pleasure. She moves faster in turn, jackhammering her crotch against your jaw, stuffing inch after inch of turgid cockflesh past your [pc.lips].");
			
			output("\n\nAfter a few minutes of preparatory cock-worship, the huntress gives a sated grunt and pushes you off her cock, letting you slump to the ground in a pile of abused, horny need. <i>“Much better,”</i> she coos, admiring her slick cock that gleams in the dim, fungal light of the caverns. <i>“Your [pc.cunt " + tVag+ "] will thank you afterwards.");
			if (foes[0] is NyreaBeta) output(" Trust me, I know.");
			output("”</i>");
			
			output("\n\nYou gulp as the nyrea flips you onto your back and spreads your [pc.legs], looking down with hungry eyes at your bare pussy. She moves to straddle you, dropping the massive heft of her prick onto your [pc.crotch], smearing your loins with your own thick saliva. You");
			if (pc.looseness(tVag) >= 5) output(" shiver in anticipation");
			else output(" whimper in fear");
			output(" as the nyrea shifts her wide hips back, drawing the shaft of her dick back across your bare groin and lining her flared head up with your [pc.cunt " + tVag + "]. Here it comes...");
			
			output("\n\nYou close your eyes and brace yourself for it, fingers digging into the stone, [pc.legs] spreading wide for her. Her smile widens, hands playing across your thighs, teasing your tender [pc.skinFurScales]. Her cock slowly creeps towards your sex, the blunted head pressing against your lips, barbs teasing your mons. Your breath catches as she pushes into you, slowly but surely stretching your slit around herself. The barbs catch on your most tender bits, scraping softly against your cunt’s squirming walls and wringing a scream of pleasure from you. Your back arches, hands scrabbling for purchase on the stone as the huntress pushes herself into your [pc.cunt]. The stretch is");
			if (pc.looseness(tVag) < 5) output(" unlike anything you’ve ever felt before");
			else output(" like when you were a virgin, giving even your well-tamed cunt a nice workout");
			output(". Despite her size, the nyrea slides relentlessly into you, her member molding to the exact contours of your womanhood, filling you utterly. Groans of pleasure escape your lips, torn from you as the huntress’s barbs grind into the walls of your cunt, sending shocks of pleasure through your body that nearly drive you to orgasm.");
			pc.cuntChange(tVag, foes[0].biggestCockVolume(), true, true, false);
			
			output("\n\n<i>“That’s it... squirm for me,”</i> the nyrea murmurs into your ear, <i>“Now, where’s that sweet little cumsac, hmm?”</i>");
			
			output("\n\n<i>“I don’t-”</i> you start to say, your voice twisting into a scream when the huntress pounds her hips into you, ramming her meat the rest of the way into you. You can see your [pc.belly] bulge a bit with the sudden, forceful insertion. Her knot bumps against your lips, swelling larger as she steadily rocks her hips, grinding into you. Her barbs caress your deepest recesses, scoring the muscle around your cervix, too close for comfort.");
			
			output("\n\nShe gives a grunt of consternation and starts to move her hips, thrusting awkwardly into you. <i>“Where is it?”</i> the huntress demands, giving you another knot-deep thrust. <i>“Don’t tell me another bitch got to you today already?”</i>");
			
			output("\n\nYou squirm under her relentless assault, trying to give voice to an explanation, but only managing to moan like a whore as she fucks you. Your breath comes ragged, and you cry out as her knot and barbs torment you with pleasure");
			if (pc.looseness(tVag) <= 2) output(", threatening to break you with the tie’s sheer thickness");
			output(". The huntress’s fingers dig into your");
			if (pc.biggestTitSize() <= 1) output(" shoulders");
			else output(" [pc.chest]");
			output(", squeezing you roughly as she moves faster, hammering her knot against you until it finally breaches your defenses, pumping into you. You both scream in pleasure, and you suddenly feel the tidal wave of orgasm crashing against your crumbling willpower.");
			
			output("\n\nYour hands wrap around the huntress, grabbing at her as she drives you over the edge. She gives you a lascivious grin as she pounds you, continuing her determined pace with complete disregard for your state. Her cock constantly searches for a sperm sac that’s never going to appear, trying to batter you open and suck out your seed through her massive member. All you can do is hold on for dear life as pleasure overwhelms you, sending spasms through your [pc.cunt " + tVag + "]");
			if (pc.hasCock()) output(" and making your [pc.cocks] stiffen and shoot, blasting a load of that precious seed she was after all across your [pc.belly]");
			output(". Your wringing cunt is the only thing that stops her, trapping her like a wriggling vice of pleasure that soon has her panting and gasping, trying to hold on.");
			
			output("\n\n<i>“Give me... your...”</i> she tries to say, but ends up just moaning and humping faster until you’re squirting around her, splattering her thighs and your with [pc.femCumNoun].");
			
			output("\n\nBy the time she’s done, you’re a mess of ");
			if (!pc.hasCock()) output("fem");
			output("cum and sweat, gasping for breath on the cave floor in a puddle of your juices. The huntress overtop you scowls between heavy, husky breaths, looking you up and down. <i>“Deceitful offworlder. Where is your sperm?”</i>");
			
			output("\n\nYou try to explain, but find yourself cut short as she pulls out of you, dragging those fiendishly tickling barbs back across every inch of your [pc.cunt " +tVag +"]. She stands, letting her drooling want swing free between her legs as she collects her equipment. <i>“I suppose I’ll have to find another mate. Still, you were... pleasurable, to say the least.”</i>");
			
			output("\n\nShe laughs to herself and stalks off, leaving you in a pile to recover from your ordeal.");

			pc.orgasm();

		}
		// Genderless get fucked
		else
		{
			output("\n\n<i>“What... what is the meaning of this!?”</i> the nyrea snaps as her chitinous fingers brush across your bare crotch. <i>“What is... how...”</i>");
			
			output("\n\nYou blush as the huntress stumbles over her words, trying to make sense of your genderlessness. <i>“What manner of creature are you?”</i> she demands. All you can do is shrug.");
			
			output("\n\nShe huffs, crossing her arms under her breasts. <i>“What use is there for a creature with no genitals!? You offworlders are strange!”</i> Without another word, the nyrea turns on a heel and stalks off into the cavern.");
		}
	}

	processTime(30);
	genericLoss();
}

public function pcVictoryOverNyrea():void
{
{by Lust:} The nyrea stumbles back, breathing hard as you relentlessly tease her, forcing her further and further back until she's pressed against a cave wall, helpless. She tries to ward you off with her spear; you easily bat her spear-point away, pressing yourself right up against her. She gives a quiet moan, hands reaching for her groin, desperate for release. You grab her wrists, pinning them to the cave wall.
{by Physical:} Battered down, the nyrea starts trying to withdraw, warding you back with increasingly desperate thrusts of her spear. You grab the tip at the apex of one of her weakest thrusts, and easily snap the haft over {your knee / a nearby rock}, leaving her helpless. With a look of panic, the nyrea turns to run, but finds nothing but cave wall behind her. You slam her up against it, grabbing her wrists before she can try and strike back.

{combine:}
"No..." she moans, going almost limp in your grasp. {If Beta: "She turns her cheek from you, refusing to meet your gaze. "H-how am I ever going to get my own harem fighting like this... I'm too weak to even ambush an offworlder. Go ahead... do whatever you want to me. I deserve it." // if Alpha: "Go ahead," the alpha nyrea growls, looking you dead in the eye, "I've taken my share of conquests... I know how this goes. You won, fair and square. I won't resist you... this time."}

[Pitch Anal] [Ride Her Cock] [Docking]

Pitch Anal
You give the nyrea a slight push, and she obediently falls to her knees. Planting a hand on her head to keep her right where you want her, you start to strip out of your [pc.gear], setting it aside. The nyrea watches your movements, following with her eyes as you strip down, baring your [cock] as the semi-turgid shaft flops down onto the bridge of her nose. You suppress a grin, seeing the tell-tale look of hunger flash across the bug-woman's eyes; for the moment, though, you content yourself to let your prick rest on her face, motionless as you reach down and peel off the chain armor covering the nyrea's cock and breasts, letting both hang free and at your disposal. 

{if Beta nyrea: "The huntress looks down in shame as you strip her, though you can see her breath quicken, her cock hardening as she's rendered naked. Satisfied with your work, you tilt her head back ever so slightly and press the tip of your [pc.cock] into her lips. She shudders slightly, but doesn't resist as you start to push in. At a word from you, she leans in and cups her own breasts, pressing them around the spare inches of cockflesh, encasing your manhood between a valley of tits and a hot, wet mouth. Now we're talking." // Alpha: "The huntress never breaks eye contact with you as you pull her clothes off, grinning proudly as you cup one of her full breasts. "Like them? Let me show you what they can do" she purrs, cupping the two hefty orbs and reaching up, catching your [pc.cock] in her cleavage. You gasp as she starts to tit-fuck you, but can hardly complain as she moves with expert, practiced motions, rubbing your shaft across every inch of boobflesh before bringing the [pc.cockHead] to her lips, using her tongue to guide it in."} You suppress a shudder as the huntress takes your cock into her mouth, sliding through a valley of boobflesh before docking in the wet confines of her mouth, wrapped in her wriggling, hot tongue. Your hand strokes reassuringly through her spine-like hair, guiding her lips down until {they kiss the base of your [pc.cock], your shaft fully buried in her throat // you can feel her throat bulging around your massive erection, your [pc.cock] stretching her wide until she's struggling to breathe}. You keep her there a few moments before relenting, pulling back into her bust until just your crown is parting her black lips. 

With a slight flex of your wrist, you give the suddenly submissive nyrea the idea that she should start sucking. With a lust-filled look, she does as commanded, using her tits as a buffer between your groin and her mouth as her head starts to bob up and down your shaft, tongue coating you with a thick glaze of spit. The parts of your prick not currently being worked over by the buzzing beauty's tongue have a different surprise in store as her fingers clench around her tits, and a thin drizzle of creamy alien milk beads up from her nipples, patterning onto the floor until you step in. Content to let the nyrea suck you off herself, you reach down and grab her tits, pinching the nipples hard enough to elicit a sharp gasp from your conquest, and a more powerful stream of her motherly fluids to pool in your hands. You angle her teats inward onto your cock, milking them until they're slathering your shaft in thick, creamy whiteness. Now <i>that</i>'s lube. The nyrea gives an indignant, muffled grunt as a few trickles flow down your shaft and into her mouth, clearly not enjoying the taste; to see for yourself, you lick a few drops off your hand -- it’s surprisingly thick and sweet, less like cow's milk and more like a warm cream soda. It even tastes vaguely like vanilla. 

Not bad.

Satisfied that your [pc.cock] is sufficiently wet and ready, you pull the nyrean girl up and march her over to a relatively flat, open expanse of cave floor. She gets the hint and lies back, {if beta: shame-facedly // alpha: eagerly} spreading her legs for you, giving you a good look at her own hefty pecker and her tight little ass, hidden between her clenched cheeks. She's nice and hard, but her pseudo-cock flops easily onto her belly at your touch, dribbling a watery pre onto her gut as she gasps, biting her lip with the sudden sensation of your touch. She actually looks kind of cute as she reels from the unexpected, but clearly <i>very</i> pleasurable touch, and she's quick to look away when you glance up at her. 

She's been very cooperative so far. Maybe it wouldn't hurt to help your conquest get off, too?

Get Her Off
{+Kind}
You decide to take pity on your insectile lover, and wrap a hand around her over-sized prick, giving it a few pumps until it can stand on its own. She gasps, back arching ever so slightly as you jack her off. Her legs twitch, as if she's trying to hold them back, before they instinctively wrap around your [pc.hips], pulling you in until your sodden dick's pushing into her cheeks. You both moan as your [pc.cock] spreads her cheeks, easily finding the dark star of her back door; she winces at the feeling of wetness on her ass, but makes no move to resist your now inevitable penetration. Instead, she wraps her hands around yours, working with you to pump her shaft as you start to press in, [pc.hips] thrusting slowly but surely into her. 

{if Beta: "Aaaahhhhh. T-tight!" the beta moans, hips rocking back as you plunge forward into her tight backdoor, "P-please, slow down, I can't..."
{if Alpha: "Ah yeah, just like that," the alpha hunter groans, gritting her teeth as you plunge into her receptive backdoor, "Come, stud, fuck me hard!"} You silence her with a kiss, leaning over her quaking body as your [hips] slide in, pressing against her tensed butt. She groans into your mouth, breathing hard... but still, her tongue rolls out, playing across your own as she tries to relax, opening herself up to you. Though her ass still protests, you push forward, using your thick coating of spit-lube and superior positioning to keep pushing into her until you're nice and buried in the hot, squeezing grip of the nyrea's hole, able to feel every beat of her heart translate through her muscles as they go wild around you. 

You break the kiss, shifting down to the peak of one of her bountiful breasts. She tenses as your hand squeezes the mound, wincing with sudden sensation as you draw a bead of her milk out and lap it up. {If egg & beta: "Wh-what are you..." the nyrea whines as you plant your lips on her teat, starting to suckle. "That's for my hatchlings..." // if egg & alpha: "What, you actually like that? You big baby..." the alpha sighs, though you think she's just trying not to moan as you settle into her tits, suckling on the puffy, beading teats}. Between your hand and lips, both working ceaselessly on her tits, the nyrea's soon unable to hold back, letting out a long moan as you drink from her, enjoying the creamy bounty. As she finally gives in, her ass relaxes around your [pc.cock], letting you start to thrust again: slowly at first, but quickly mounting to a steady hammer-fall of a pace that has your conquest moaning opening, hands digging at the stone for purchase as you pound her ass. 

Her ass wrings and contracts, squeezing hard around your cock, varying her hole between almost impossible to move in and loose enough to take you to the hilt in a single thrust. Every movement you make, though, is rewarded with an ever-louder moan or grunt from the nyrea huntress. Her voice crescendos as you redouble your attentions on her cock, encasing it in a double-handed grip and pumping to the beat of your thrusting, working to get you both off. You're quickly rewarded with a spurt of sticky pre that drools down onto your fingers, quickly making itself useful as lube when you pick up the pace, hammering into her ass and pumping her prick until you're both moaning wildly, riding the brink of orgasm, clutching and clawing at each other as the pressure and need rises with every thrust. 

A particularly feral grunt announces your orgasm as you slam yourself hilt-deep into the nyrea's butt, wringing out a thick load that fills the huntress's tight passage. She's not far behind you, and feeling the flood of spunk rushing into her bowels seems to set her off: the nyrea gives a sharp cry as she cums, back arching and pseudo-cock spraying a thick, viscous load across her chest{if egg: " -- but that's just the beginning. You watch with alarm as her cock seems to distend in your hands, a huge ovoid shape rising up along its length to the blunted head. Your eyes widen a bit as you find yourself fucking a fist-sized white egg out of the huntress: her cock engorges as the hefty orb flows through it, before the blunt head of her shaft spreads open like a mini-vagina, letting the slimy white egg roll out onto the new mother's belly in a puddle of her own cum. (if beta: "Oh, no... I didn't want... now I have to take care of it," she whines, taking hold of her accidental discharge." elseif Alpha: "Ah, damn, I guess it was really ready to come out..." she sighs, picking up the accidental discharge and cradling it against her breast, "Unless you wanna little nyrea for yourself, I guess I'll try and shove this up one of my harem boys' slits till it hatches. That's what I get for losing, huh?"}

With a heavy sigh, you pat the cum-soaked huntress on the thigh and pull out of her, wiping the last of your own seed off on her chitinous leg before reaching back to gather your gear. By the time you've got a hold of it, the huntress is already on her feet, walking shakily away. "Thanks for being a friend," she says with a slight smile, indicated her cum-spattered legs and wilting prick. You wave as she departs, leaving you to catch your breath. 

Fuck Her
No. You doubt she'd be as kind were you on the receiving end of that mammoth member. You push the alien's dong out of your way, giving you unimpeded access to her tight little ass. She gives a slight groan as you grab her asscheeks, spreading them wide for your sodden member{s}. Her legs uselessly flail, twitching around your shoulders as she feels the wet, slimy head of your [pc.cock] against her asshole. 

With a grunt, you hike her useless legs over your shoulders, which has the added, welcome effect of pulling her ass off the ground, angling her hole up to meet your encroaching member. The nyrea gasps, moaning as your crown starts to spread her hole, fingers digging into the rock around her, desperate for purchase; as you press into her, those gasps turn to moans, and then a shrill cry as you finally force yourself inside. 
{if Beta: "Aaaahhhhh. T-tight!" the beta moans, hips rocking back as you plunge forward into her tight backdoor, "P-please, slow down, I can't..."
{if Alpha: "Ah yeah, just like that," the alpha hunter groans, gritting her teeth as you plunge into her receptive backdoor, "Come, stud, fuck me hard!"} 
You silence her with a slap on the ass, sending her taut flesh shuddering with the force of the impact. Her pale skin reddens in a hand shape as you deliver a second swat, and her ass clenches tight around your cockhead, threatening to stop your advance in its tracks. She groans, cupping her boobs and panting heavily, clearly trying to adjust to the foreign intrusion inside her. You relent for a moment, giving her a chance to catch her breath -- but only that much, and once her ass relaxes a tiny bit, you press onwards, rocking your hips in until they're bumping into the sheer, raised cheeks of her backside. 

As soon as you bottom out in the insectile slut, you pull back again, keeping your strokes nice and slow for now, letting her ass get used to your presence. Soon, though, you're building up speed, pounding away at her hole with wanton lust: her dark star seems to suck you back in with every forceful push. She moans lewdly, back arching as you slam back into her with a particularly powerful thrust -- so powerful, even, that a spurt of cream erupts from her nipples of its own volition, spattering across her chest and trickling down the big mounds of her teats. 

With a lascivious grin, you pull your conquest closer, watching her big tits jiggle with the sudden downward motion as you pin her hips to yours, bringing that bountiful bosom down to easy reach. She gives a startled gasp -- especially as your cock rams even deeper into her quaking hole -- and blushes a dark rosey red as you grab her tits, squeezing the massive orbs until their sweet cream flows over your fingers. {If egg & beta: "Wh-what are you..." the nyrea whines as you plant your lips on her teat, starting to suckle. "That's for my hatchlings..." // if egg & alpha: "What, you actually like that? You big baby..." the alpha sighs, though you think she's just trying not to moan as you settle into her tits, suckling on the puffy, beading teats}. Between your hand and lips, both working ceaselessly on her tits, the nyrea's soon unable to hold back, letting out a long moan as you drink from her, enjoying the creamy bounty. As she finally gives in, her ass utterly relaxes around your [pc.cock], giving it unrestricted access to the spasming, tight, wet depths of her ass. You plunge in eagerly, each stroke taking you from crown to hilt to the beat of your suckling, hammering home with each deep drink you draw forth. 

Between your thrusting [pc.cock] and the creamy, near-vanilla milk you're draining from her teats, the nyrea is soon locked in a prison of pleasure, barely able to move or even moan between the overwhelming sensations. You can feel her cock twitching, pinned between your bodies, helpless without some tender touch. You deny it, and her, the bliss of release, content to take what you want from the surprisingly submissive slut. You continue to remorselessly fuck her ass, delighting in her helpless squirms and pleasured grunts, keeping her so close to release, but always coming short of giving it until you feel your own orgasm welling inside you, your [pc.balls] swelling with impending need. 

With a fierce, primal roar, you slam your [pc.hips] into the nyrea's cushiony ass, cock buried to the hilt in her hole as you cum. She gives a startled gasp, back arching as your hot [pc.cumColor] seed floods into her bowels. Your [pc.hips] continue to slam forward, short, jerky thrusts working out more and more seed into her hole until your [pc.balls] feel{s} utterly drained, leaving you panting and gasping, head buried in the nyrea's bust as you recover from the orgasm.

After a moment's rest, you manage to work up the strength to pull out of her, shuddering at the over-sensitive sensation along your [pc.cock] as you withdraw, wiping the last of your leaking post-cum seed on her thigh. With your work finished, you stagger to your feet and collect your [pc.gear], leaving the slut in a heap on the ground, leaking cum from her hole as she furiously masturbates, trying to get herself off. 

Ride Her Cock
//vagOrAss scene?

Looking down at the defeated huntress, you can't help but let your eyes play across her body -- the swells of her breasts, barely concealed by the chain bikini-bra she's sporting, and the tight, flat plane of her belly. And, finally, to the fur-padded bulge in her bottom. You lean over her and hook a finger through the chainmail, slipping her garments down around the stiff, thick rod of her cock straining against it. {if Beta: The nyrea squirms under your grasp, her legs spreading unconsciously as she does so. "D-don't," she manages to gasp, before your fingers wrap around her shaft and give it a gentle tug -- just enough to twist her voice into a moan of pleasure. //if Alpha: "Is that what you want?" the nyrea purrs, spreading her legs and stroking her member for you. "Should have just let me win..." You give her a look, and she answers with a little shrug. True to her word, she's unresisting as you brush her hand off her rod and take it for yourself, giving it a few experimental tugs.} You slowly start to pump the huntress's pseudo-cock, running your hands from the turgid knot at her base to the halo of soft spines around her flared crown. 

Your thumb swirls around the flared head of the huntress's cock, teasing the X-shaped slit at the heart of her flare. The nyrea sucks in a sharp breath, groaning as you tease the opening to her hollowed-out prick. Her hips hump up, grinding into the palm of your hand. Just a little attention seems to be all it takes to get this huntress into a mindless rut, it seems! Her eyes roll closed as you tease her hefty shaft, little moans of pleasure following pressing into her slit. You easily push into her, the folds that make up her cockhead parting around your digit to give access to the hollow, wet egg-laying tube inside. 

You bring a little of that sweet, warm moisture out to rub down on the outside of her prick. It's not much, but you're confident your [pc.vagOrAss] will thank you for it soon. The nyrea seems to as well: her hips keep thrusting, doubly so whenever you let a finger slip inside her, teasing the clearly quite sensitive inner walls of her prick. {if Beta: "That's... that's not bad," she purrs, wiggling her hips under you. "Do all of you offworlders do things like this?" elseif Alpha: "Mmm, that's good," she purrs. "I might have to show a few of the betas around here that little trick...."} You grin down at her and shift on your [pc.legs], straddling her hips. The nyrea's eyes light up as you move overtop her, and she eagerly shimmies out of her armor, giving you unrestricted access to her body. 

"A little eager, aren't we?" you tease, reaching up and pinching one of her nipples.

{if Beta: The huntress flushes darkly, looking sharply away from you. //elseif Alpha: The huntress scowls, but her throbbing erection completely destroys any hope of denying it.} You cup and squeeze her tits, massaging the two hefty mounds until a little trickle of moisture beads from her nipples, staining your fingers with her sweet cream. You withdraw your hand and bring your digits up to your mouth, licking up the sweet, thick mixture of cockjuice and milk from your fingers. Delicious! You wouldn't mind pinning the sultry huntress down and just suckling from her... but for now, you've got other plans. 

Giving the nyrea a lascivious wink, you start to shimmy down toward the drooling head of her cock. The meaty shaft throbs between your fingers, trembling with anticipation as it slips between your [pc.legs] and brushes against the {lips / rim} of your [pc.vagOrAss]. She coos happily as she feels the heat of you against her flare, your [pc.skinFurScales] brushing against the soft barbs near her crown. Oh, you can't wait to feel those little beauties teasing your insides. You shift down, letting the head of your lover's cock press against your hole before, with just a little pressure, you pull it inside. The huntress groans as she slides inside you, her back arching off the stone and a thicker trickle of milk pouring from her tits just from the stimulation coursing through her. You grab her breasts, giving them a rough squeeze so that milk spurts out and slathers your hands and her belly. 

{if Beta: "T-too much," the huntress squeals, squirming under you as you slowly slide down on her cock and mercilessly grope her rack. "You're going to make me... make me..."
{if Alpha: "That's it... don't stop," the huntress groans, her chitinous fingers digging into your [pc.hips]. Cute that she still thinks she has any control here. "Yes, keep it up. I'm... I'm getting close..."}

You can't blame her. Feeling her feline-esque barbs gently scraping through the walls of your [pc.vagOrAss] is enough to {make your [pc.cock] jump with excitement // send shivers of pleasure through your body, almost enough to force you to orgasm yourself}. You give the huntress an encouraging nod and complete your descent, taking the whole mass of her cock into your quivering hole right to the flush of the knot, letting the swollen ball of flesh nestle {between your asscheeks / into the lips of your [pc.cunt], barely stopping it from penetrating}. You shiver at the feeling of fullness, the massive foot of nyrean meat stretching your hole wide; one of your hands instinctively rises to your belly, rubbing your stomach over the gut-straining girth inside yourself. As planted on the nyrea's cock as you intent to be, you start moving your [pc.hips] ever so slightly, grinding back and forth in her lap until she's groaning aloud, bucking her hips to desperately try and drive her knot into you. 

She's not able to do it before she climaxes, driven wild by your clenching hole and the pressure in her chest. A veritable geyser of milk spurts from her teats, cascading up and onto your arms and chest. Now that's a shower! You open your mouth to catch a few of the errant drops, loving her sweet nectar's taste. You feel no flood of cum from her pseudo-cock, though: she's got no jizz to flood you with, though that doesn't stop her prick from twitching and throbbing, straining your [pc.vagOrAss]'s walls. Her feline nubs rub you in all the right places, teasing your tender muscles {if PC has a cock: right through to your [pc.cock], making your manhood jump with excitement, drooling pre onto the huntress's bare belly. //if PC has cunt: , massaging the full passage of your pussy. Her flared head batters against your cervix, reaching up to kiss it. You can't help but shiver as her spiney cockhead reaches deep into you. // if no cock/cunt: . Your ass stretches in the most pleasurable of ways around the huntress's thick member, every bounce or shift of your [pc.hips] dragging those soft spines across your walls, driving you mad with pleasure.} 

You start to move your [pc.hips] more, bouncing on the nyrea's cock as she cums, refusing to let her go soft on you. Lucky you, she might have a mighty dick, but the huntress has a girl's refractory period -- you're able to ride her right through her orgasm, only increasing the pace until the alien warrior's a blissed-out mess, moaning whorishly as you ride her into the ground. Every movement you make draws her fat knot closer to the {lips/ring} of your [pc.vagOrAss], hammering against your hole in demand of entry. The urge to feel that mass of muscular, throbbing cockflesh in you is too great: you grit your teeth and sink down, forcing yourself to take the huntress's knot. 

An explosion of pleasure and pain rocks your body as the turgid bitch-breaker slides into you, stretching your [pc.vagOrAss] wide around itself. You try to move again, but find yourself all but rooted to the huntress's lap, able only to make the slightest of motions -- every one of which sends shocks of pleasure through your body, driving you inexorably towards your own climax. 

{if Nyrea has eggs:
Suddenly, you feel something bulging in the base of the huntress's cock, and it's not her knot. Your eyes widen, drawn down to your conjoined groins. Her prick strains around something... coming out. Something huge.

"Oh, fuck yeah," the huntress groans, looking lustily up at you, squeezing your hips. "Take my egg, offworlder. Carry my young inside you..."

Uh-oh. You instinctively try and wrench away from the nyrea, but her knot anchors you to her, preventing your escape. A groan escapes your lips as the nyrea's egg pushes up through her girthy pseudo-cock, giving you a whole new kind of stretch as it passes from her to you. A surge of hot liquid bastes {your bowels, making / your cunt, sloshing into your womb and making} way for the nyrea's spawn. All you can do is try and take it, relaxing your body around the fully-buried ovipositor as it deposits its tiny, precious load inside you. Your hand falls back to your belly, feeling it bulge and distend, stretched out by the egg inside you. 

You shudder and moan as the sheer, soft surface of the egg crowns into you, brushing your inner walls. The nyrea's cum acts as lube, allowing the egg to slide into you with merciful ease. The egg lodges in you, held in place by your own clenching muscles and the sickly sticky lube she's sprayed into you, filling your {womb / ass} with alien spooge and egg.

And then another egg starts making its way inside you, pushing the first even deeper, filling your {cunt / ass} with egg after egg... you count as at least {3-5} eggs that eventually swell your belly before the nyrea runs out of ammunition, and her knot deflates enough to allow you to slump off of her. Listlessly, you collapse onto the ground, rubbing your swollen belly full of eggs.

Expended, the nyrea slumps back against a rock, catching her breath. {if Beta: "S-sorry about that," the beta nyrea says, looking pointedly away from you. "You won. I shouldn't have... I just... I couldn't hold back. You made me feel too good." /// if Alpha: "Ooh, that was very kind of you, taking my eggs like that," the huntress coos, stroking her well-used, well-stretched cock. "Saved me the effort of having to pin you down and break you in... really, if that's what you wanted, you could have just bent over the moment you saw me. Saved us both the trouble." You glower at her, but a churning in your gut prevents you from saying anything -- your new eggs are settling.}

Slowly, the huntress slips up to her feet and flicks a little of her lube from the flared crown of her prick. She sashays over to you, plants a chitinous hand on your full belly and strokes your obvious pregnancy. "Don't worry. They'll come out in a few days. Almost ready to hatch, these ones..." 

{if Beta: The huntress gives you an apologetic, almost bashful look -- and a peck on the cheek before skipping away, off into the caves whence she came. //if alpha: She smiles at you, stroking your [pc.hair] with surprising affection before sauntering off back into the caves.}

<b>You're now carrying nyrean eggs!</b>

{if Nyrea has no eggs:
"If only I had eggs to give you," the huntress coos, chewing on her lip and caressing your [pc.hips] and [pc.legs]. "Nothing wrong with just a little fun, though, right?"

You wink down at her, squeezing her breasts and wiggling your backside around her knotted prick. You can't do much more, given your knotted position, but it's enough to make the both of you cry out in pleasure, voices giving way to moans laden with lust and desire. The wonderful stretch, the gentle scratch of her barbs inside you, and the {cunt/ass}-straining knot all work together to drive you inexorably towards orgasm, rushing after the huntress towards climax. 

Your rising pleasure finally breaks, coming to a head as the huntress grabs your hips and pulls you down on her rod. The whole swell of her knot pushes into you, tying you together and sending such a shock of pleasure through your spasming {cunt / asshole} that you can't help but cum. You scream aloud, voice echoing out through the caverns, announcing your orgasm to the rest of the planet. You force yourself to keep moving, riding the nyrea until she, too, gives a cute gasp and cums again. Her prick twitches inside you, her spines teasing you in just the right ways to make your own climax even more intense. Your whole body tingles with the sensation, shivering as you ride her massive shaft to the very end. 

When you've come down from your orgasmic high, you find yourself slumping a bit, resting on your [pc.knees] as the nyrea's knot slowly begins to deflate inside you. The huntress lies back, idly playing with one of her big, milky teats and purrs, "{if Alpha: If only you'd mounted me reverse, perhaps we could have cuddled a bit. Ah, well. //if beta: "That was... magnificent. Do all of you off-worlders mate like that?}"

You grin down at her, letting your hands play across her supple, sexy body until her knot's gone down enough to let you slip off of her. Her cock makes a loud, wet plopping sound as it slips free of you, flopping onto her belly in a smear of her own lubricants. She giggles and waves to you as you gather your things and depart, leaving her happily masturbating. 

Tailock Docking
//Needs a tailcock less than 3 inches thick. Length is irrelevant. 

You lick your lips, eyes wandering over the defeated huntress, taking in the lovely curves and taut muscles of her athletic body. The nyrea {if alpha: stares defiantly into your eyes, visage full of fire //if beta: whimpers slightly, refusing to meet your gaze as you drink in her body}. One of your hands wanders from her wrist, slipping into the cup of her fur-lined chain bikini to cup one of her ample breasts. Her breath catches when your fingers dig into her surprisingly soft tit, squeezing her nipple until a little trickle of moisture beads out onto your fingertips. Yum. 

You quickly peel the huntress's chain top off, letting her bust pop free and into your wandering grasp. Rivulets of pearlescent cream drool from her midnight-black teats, and you can't stop yourself from leaning in and wrapping your [pc.lips] around one of them, suckling like a babe at breast. Her milk pours out at the slightest touch, sweeter and richer than a cow's, almost like candy. Your body presses against hers, squeezing the insectile beauty against the cavern wall as you drink deep of her lactic bounty. She moans as you suckle, chitinous fingers brushing {through your hair / across your cheek}; more tellingly, though, you feel a pressure rising against your thigh, urgently demanding attention through the huntress's mail panties. 

You let your hands wander down, slipping into the hem of her bottom and down her plated legs, letting the hefty pseudo-cock between her legs slip free and into your waiting hand. You give her thick, flared shaft a few experimental strokes, and are instantly rewarded with a girlish gasp from your would-be attacker, followed by a steady increase in the flow of milk into your mouth. Oh, she likes that! You move your wrist faster, pumping the huntress's prick until she's openly moaning, desperately thrusting her hips into your hand.

Torn between continuing to enjoy the delicious meal on offer from her breasts or giving that thick, turgid shaft of pseudo-cock a little loving, you feel a familiar rise of tension at the tail-end of your parasitic tail. Now that's an idea... you flex your tail muscles, bringing the thick appendage down between your [pc.legs] like a prehensile dick to wrap around the huntress's own member. She gasps as your [pc.tail] coils around her, trembling as you give her just enough of a squeeze to milk out a little moisture from her X-shaped cumslit. Good, you'll need that for what's coming next. 

You continue to coil your cocktail around her like a serpent, slithering it along her long, thick shaft until the slender tip of your parasitic appendage brushes against her own phallic opening, teasing the rim so that your own cockhead pokes out, stiffening to the heat and throbbing proximity of the nyrea's shaft. Her eyes go wide when she sees it, then lull nearly closed as understanding washes over her. 

"You've got one of </i>them<i>," she murmurs, and you can feel her prick relaxing in your grasp, the X-shaped slit almost begging for you to enter her. 

"Someone likes my [pc.tailCock]," you note, popping off the nyrea's breast just long enough to whisper it into her long elfin ear, then nibble along its length. Her whole body goes rigid when your teeth gently close around her aural flesh, shivering from head to toe as you tease it. Delightfully sensitive! You take that moment to seal the deal, as it were, shifting your cocktail's crown to brush against her own, and slowly slip inside. 

The huntress stiffens at the moment of penetration, gives a little gasp, and all but melts in your grasp. The inside of her cock is wonderfully wet, a sultry heat that pounds in on your [pc.tailCock] from the throbbing walls of muscles squeezing gently around your tail-mounted member. You slither deeper and deeper in, gliding through her wet and surprisingly welcoming passage as if you were fucking a pussy -- which, in the grand scheme of things, you might as well be doing. 

{if Nyrea = no eggs: The huntress groans as you slide your tail-member deeper into her pseudo-cock, sucking in a sharp breath as you penetrate to the base of her shaft, and into the open, sweltering heat of her belly. "Mmm, do you want to... give me a few eggs?" she breathes, planting a hand on her flat stomach, just over the top of her cock. "It's been so long since I had a nice, fertile clutch in me..."
{if Nyrea = has eggs: The huntress groans as you slide your tail-member deeper into her pseudo-cock, sucking in a sharp breath as you penetrate to the base of her shaft. Your cockhead comes up against several big, rounded surfaces -- soft, but unyielding as you bump against them. The huntress grins proudly as she feels you prodding around inside her, planting a hand on her slightly-swollen belly just over her ample cock. "Sorry, offworlder. I already found a nice, virile male to fertilize my clutch... though I wouldn't mind you helping me be thorough..."}

Now that's an offer you can't refuse. You put your hips into it, thrusting deep into the nyrea's drooling slit. You push her hard against the cavern wall, driving your [pc.tailCock] deep into her utterly alien, and utterly beautiful, body. She gives a cute little gasp, and soon you find her chitinous legs wrapped around your pistoning [pc.hips], holding you tight against her. {if PC has a cock: One of her hands slips down to your groin, wrapping around the shaft of your [pc.cock]. The huntress gives you a wink and starts to stroke your length, moving her wrist quickly to stimulate you from root to [pc.cockHead].} In turn, you let your mouth wander across her luscious body, from the tip of her tapered ear down her neck. Finally, your lips return back where they started: the full swells of the huntress's breasts, laden with sweet cream that's irresistibly ripe for the taking. 

You latch onto one of the nyrea's teats and start to suckle again, drawing out a stream of her candy-sweet milk to the beat of your thrusting hips, overwhelming the huntress with pleasure on two fronts. She gives as good as she gets, though: her pseudo-cock clenches hard around your thrusting tail-prick, milking you for your cum. She groans lewdly, sultry moans of pleasure that urge you to give her your seed, to spray it into the depths of her alien womb{ and across her fertile, welcoming eggs // and across the already-seeded eggs swelling her belly}. You don't resist her pleas -- you couldn't if you wanted to. You move yourself with greater urgency, hammering your [pc.tailCock] into the huntress's hot, tight hole until you feel the sudden rush of orgasm, engorging your tail with semen. {if PC has cock: Her deft hands don't leave your [pc.cock] far behind, either: a moment behind your tail, you shudder with pleasure as your normal prick swells with need, rushing to catch up with your rear-mounted genitals.}

{if Beta: "Please... harder..." the huntress gasps, struggling just to speak. "Give it to me, please!"
{if Alpha: "Just like that," the huntress coos, arching her back against the stone -- and thrusting her bust into you, swallowing your [pc.face] in titflesh. "Spill your seed into me, offworlder. Every drop."}

As if on command, you shoot your load into her. Your tail shivers, swells, and busts its nut, flooding the nyrea's hole with [pc.cum]. Her head rolls back, a cry of exultation leaving her lips as you fuck your jizz deep inside her, slathering her eggs with seed. {Her thighs and legs get a coating of spunk a second later as her hands work your [pc.cock] to climax, milking out a thick stream of [pc.cumNoun] from your throbbing erection.} She revels in the feeling of your [pc.cumType] inside her{ and on her skin and chitin}, purring like a wanton slut as you fill her. 

With a shuddering gasp, you plant your head fully into the huntress's cleavage, panting hard as her body drains the cum from you. Her hands play across you, stroking and caressing all the right places to make you shiver with delight -- and make you give her every drop your [pc.balls] can give her. A long minute passes in her arms before you finally feel yourself wholly emptied, and begin the long process of extracting yourself from the huntress's lengthy shaft. She actually whimpers as you start to pull out, biting hard on her lower lip to contain herself as you pull your [pc.tailCock] out through twelve inches of overly sensitive, post-orgasmic meat. You take your time, withdrawing with agonizing slowness that torments the nyrea with inexorable pleasure -- you almost think she'll cum again just from your pulling out. 

Finally, your [pc.cockTail] pops out of her, trailing spunk and her own juices across her legs. You step back, and the huntress slides down to the ground, her knees buckling under her. She stares up at you, a blissful smile on her lips as her hand wraps around her well-fucked pole, stroking it languidly. You gather your things and leave her there to bask in the afterglow{ and her new clutch of eggs}.
}