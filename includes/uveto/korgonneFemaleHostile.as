import classes.Characters.KorgonneFemale;

public function korgiSillyTranslate():Boolean
{
	return true;
}

public function showKorgiFemaleHostile(nude:Boolean = false):void
{
	showName("FEMALE\nKORGONNE");
	if(nude) showBust("KORGONNE_FEMALE_NUDE");
	else showBust("KORGONNE_FEMALE");
}
//Encounter Text
public function encounterAKorgonneFemaleHostile():void
{
	clearOutput();
	showKorgiFemaleHostile();
	if(flags["MET_FEMKORGONNE"] == undefined)
	{
		output("The snow around you explodes upward into a blinding cloud of icy crystals. You avoid the straps of a weighted net by diving to the side and, scrubbing your eyes, cast about for the source of the ambush.");
		if(pc.isTaur()) output("\n\nSomething impacts your flank, taking you by surprise and dropping you to your side. Small, strong hands grab for your wrists, trying to twist them behind your back, but you roll back to throw off the attacker before they can bind your hands.");
		else output("\n\nSomething impacts your back, dragging you to the wintry ground. Small, strong hands grab for your wrists, trying to pin them behind you, but you use the momentum of the tackle to your advantage, rolling and tossing your attacker into the snowdrift with a soft crunch.");
		output(" You struggle to your [pc.feet], taking stock of the foe who now rises from the snow with a bristling growl.");

		output("\n\nRoughly five feet tall, your attacker appears to be a tan, short-furred, canine barbarian. She’s covered in a coat of stitched hides that has been dyed to blend in with the frozen tundra she stalks. Her chest bulges within it, her curves evident even under the fibrous wrap. The coat hangs down to her thighs, but she doesn’t seem to be wearing anything underneath; dense fur seems more than enough to keep her warm. A curled tail wags in agitation behind her, while her partially braided hair hangs like a mane around a plump, muzzled face. Both her lips and nose are blue, but that seems to be their natural coloration, rather than the result of exposure. Her huge, wide eyes are trained wholly on you; the strange, rectangular pupils within her emerald irises remind you of a goat’s.");
		output("\n\nYour Codex chirps, to get your attention. <i>“Korgonne, female. Native to Uveto VII. Honorable but exceedingly libidinous. Usage of a breathing apparatus is recommended due to potent pheromones...</i>”");
		if(!CodexManager.entryUnlocked("Korgonne")) CodexManager.unlockEntry("Korgonne");
		output("\n\n<i>“Alien!”</i> she barks in accusation, the sharpness of her tone carrying even through the muffling silence of the hill-cracked snowy plains.");
	}
	//Repeat Encounter
	else
	{
		output("A strange quiet settles over the tundra, the keening moan of the wind masking something. You feel the silence out a bit more, a creeping sense dawning on you that that it’s not emptiness, but rather the intentional lack of noise. Holding one hand over your brow and squinting against the rolling white drifts, you spot a small, suspicious indentation. ");
		if(!pc.isAss()) output("Grinning, you ");
		else
		{
			output("You ");
		}
		output("grab a handful of snow ");
		if(pc.isAss()) output("and ice ");
		output("and ball it up, then whip the snowball right in the middle of the suspect dimple and are rewarded by a surprised yelp. The would-be ambusher rises from the snow, shaking off the boreal camouflage. As you suspected, it’s a roly-poly korgonne, her expression flushed with chagrin.");
		//if translated: 
		if(korgiSillyTranslate()) output("\n\n<i>“Think is funny, yes?”</i> she yells, glowering. <i>“My laughs now!”</i>");
		else output("\n\n<i>“Wow! Such embarrass. Many rudes.”</i>");
		output(" She reaches for her weapons and lunges toward you with bounding strides!");
	}
	IncrementFlag("MET_FEMKORGONNE");
	
	//9999 fightan start
	clearMenu();
	addButton(0,"Next",fightFemKorg);
}

public function fightFemKorg():void
{
	var tEnemy:KorgonneFemale = new KorgonneFemale();
	CodexManager.unlockEntry("Korgonne");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(defeatDaKorgiShit);
	CombatManager.lossScene(loseToKorgiGirlRouter);
	CombatManager.displayLocation("KORGONNE (F)");
	CombatManager.beginCombat();
}

//Sex Scenes
//Defeat
public function loseToKorgiGirlRouter():void
{
	if(pc.isTaur()) loseToKorgonneFemaleAsScentTaurus();
	else if(dickBigEnoughForHyperKorgi() && flags["KORGI_BIG_DICKED"] != undefined) loseToKorgonneWithABigDickAfterGivingHerBigDickFetish1();
	else if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) loseToKorgonneFemaleIfHasCock();
	else loseToFemKorgonneNoDick();
}

public function dickBigEnoughForHyperKorgi():Boolean
{
	return (pc.biggestCockLength() >= 42);
}

//Loss (Centaur)
public function loseToKorgonneFemaleAsScentTaurus():void
{
	showKorgiFemaleHostile();
	author("Adjatha");
	output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before swinging her spear around and cracking it against the back of your skull. Your sight blossoms into a brilliant sea of white, as if the permafrost had swallowed you whole. Numbness. Darkness. A sensation of tugging and pushing. When you come to, your situation seems more or less unchanged. Judging by the snow, it looks like the little native tried dragging you somewhere, but the bulk of your tauric body proved too heavy for her. What a lucky break!");
	var damage:Number = (pc.HPMax() - 1);
	var maxDamage:Number = (pc.HPRaw - 1);
	if (damage > maxDamage) damage = maxDamage;
	if (damage > 0) applyDamage(new TypeCollection( { unresistablehp: damage }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
	output("\n\n");
	CombatManager.genericLoss();
	//(maybe the player loses a consumable in their inventory? Doesn’t make a ton of sense for a barbarian to steal credits, but I guess she could do that too.)
}

//Loss (Male/Futa)
public function loseToKorgonneFemaleIfHasCock():void
{
	showKorgiFemaleHostile();
	author("Adjatha");
	if(pc.isGoo()) output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before swinging her spear around and cracking it against the back of your skull. The strike has little effect on your gooey frame, but you act dazed to avoid letting your captor know too much. With a self-satisfied nod, she grabs hold and begins to drag you toward a snow bank that conceals a small cave. She strips you of your equipment quickly and efficiently, before you can recover enough to stop her.");
	else 
	{
		output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before swinging her spear around and cracking it against the back of your skull. Your sight blossoms into a brilliant sea of white, as if the permafrost had swallowed you whole. Numbness. Darkness. A sensation of movement. When you come to, the snow is gone but the snow’s daughter remains.");
		applyDamage(new TypeCollection( { unresistablehp: 10 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
	}
	processTime(30);
	clearMenu();
	addButton(0,"Next",korgiLadyDickLossPart2);
}

public function korgiLadyDickLossPart2():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	author("Adjatha");
	output("Staring at you with flat, alien pupils, the korgonne raider ");
	if(!korgiSillyTranslate()) output("mutters words you don’t understand, more a moaning, wind-like song than speech as you know it");
	else output("offers a frank assessment. <i>“Fight is fun, but now for prize,”</i> she murmurs");
	output(". The savage has stripped off her thick leathers now that she’s out of the cruel wind’s reign. Your Codex has been tossed aside, but its screen still provides enough illumination to see. In the close, hot darkness, the woman squatting beside you seems almost tame. Her thick fur and stocky frame give the barbarian a softness that seems out of place in this harsh, frozen world. Thin straps of black leather hold her hefty breasts high on her chest, while small pieces of jewelry serve as her only decoration apart from her braids.");
	if(!korgiSillyTranslate()) output("\n\nShe asks you a question in her strange, whispering language and curls up her lip at your empty expression. <i>“Alien,”</i> she mutters, stretching the word out into an accusation.");
	else output("\n\n<i>“You good fuel for Great Forge. But maybe little forge good too,”</i> she chuckles, glancing between her legs. You don’t react to her joke, apparently offending the girl. Her eyes narrow.");
	output(" She leans forward, one paw on your chest, the other seizing your [pc.cock " + x + "].");
	output(" Startled, you become aware that you’ve been stripped to your bare [pc.skinFurScales]. You’d hardly noticed, your captor’s fervid body heating the cave as well as any thermal coat. She must’ve taken you into one of the tunnels pocking the surface of the icy plains.");

	output("\n\nHer grip on your shaft tightens, bringing you back to the present in an instant. Swallowing hard, you opt for silence while the savage lowers her furred face inches from your own. Her large ears twitch and lay flat, while her sapphire nose breathes hot air against your cheek. Dragging soft finger-pads up your [pc.chest] and across your shoulders, she grasps your jaw, pulling your head upwards to expose your throat. With a sub-vocal growl, she leans in and places her short teeth against your neck, pressing in ever so slightly - just hard enough to let you know she could tear you open if she chose.");
	if(korgiSillyTranslate()) output(" <i>“You lose, so I take heat,”</i> she purrs.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",korgiLadyDickLossPart3,x);
}

public function korgiLadyDickLossPart3(x:int):void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("Your body slowly releases its tension as she softens the pressure of her bite, the barbarian’s long, rough tongue sliding out from her short muzzle ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("to lick at dimples her teeth left in your skin. ");
	output("It seems almost an affectionate gesture, with your firmness slowly stiffening in her hand. <i>“Alien,”</i> she curses to herself, her tongue turning aggressive. Cerulean lips practically devour you as she licks from your collar all the way to your chin, using the whole length of her tongue. Her fingers flex across your length, as much to exert dominance as in exploration of ");
	if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE && pc.hasKnot(x)) output("your knotted, canid shaft.");
	else output("your strange anatomy.");
	output(" Rubbing her palm up and down your thickening cum vein, the primitive girl circles the base of your shaft with her thumb, ");
	if(pc.hasKnot(x)) output("appreciatively feeling the swell of your [pc.knot " + x + "].");
	else output("a low growl rumbles in her chest. <i>“Small body no good for breeding.”</i> she reprimands. <i>“Seed leak without knot! Dumb alien.”</i>");

	output("\n\nPushing you to your back, the korgonne woman straddles your [pc.hips]. Her moist pussy drips on your [pc.legFurScales] as she takes her position. A faint, unidentifiable perfume wafts across, filling your nose with tingling warmth. Your [pc.cocks] thicken");
	if(pc.cockTotal() == 1) output("s");
	output(", your twitching length");
	if(pc.cockTotal() > 1) output("s");
	output(" tapping her plump ass in time to your accelerating heartbeat. Her knees tightly clenched around your ribs, the raider rocks back and forth, hot wetness dripping from her pale blue pussy lips only to be massaged into your [pc.skinFurScales] by her thick, yielding thighs. The girl’s short, curled tail wags in the near-darkness of the tunnel. Above you, her husky breasts strain against the thin leather that barely hides nipples the color of a frozen lake. Supple flesh and dense fur swallow the black straps with every slow lift of her hips - the thin bra’s whining tension mirroring the girl’s own cooing delight.");
	output("\n\nSeemingly satisfied with the responsive member throbbing between her asscheeks, the korgonne girl stands up. Pawed hands guide your cockhead to her dripping, aquamarine folds. Lowering herself onto your [pc.cockShape " + x + "] shaft, the barbarian flashes a primal grin, her wide eyes glistening in your Codex’s faint light. She pulls back slightly, and you slip from her pussy with a wet, audible slurp before she drops down, swallowing your inches greedily. The girl’s depths are surprisingly pliant, her inner walls tightening and relaxing with every rocking motion of her plump rear. You can’t help but thrust upwards, the stout girl taking your swollen bulk with ease.");
	pc.cockChange();
	output("\n\nUntamed and untamable, the savage leans forward to lock her padded digits around your ribs, forcing you deeper into her taut tunnel. ");
	if(!korgiSillyTranslate()) output("<i>“Ffffffuck...”</i> she moans, revealing a second, far more favorable word in her lexicon.");
	else output("<i>“Ffffffuck...”</i> she moans, lost in the breaching bulk of your shaft.");
	output(" Your ass muscles tense as the barbarian clenches, ");
	if(pc.hasKnot(x) && pc.knotThickness(x) >= 3) 
	{
		output("the muscles at her labia kissing and suckling at the thickened flesh of your [pc.knot " + x + "], practically milking the top of your breeding bulb. Her ass sways with your shallow pumps and she groans in need.");
		if(korgiSillyTranslate()) output(" <i>“Fill body with water-heat,”</i> she moans.");
		output("\n\nWith a growl, she pushes down, stuffing the full diameter of your bloated swell past her fat pussy lips, a surge of intense bliss leaving your tongue mute and your jaw clenched.");
	}
	else
	{
		output("the muscles at her labia kissing and suckling at your [pc.knot " + x + "], practically milking you from bottom to top. Her eyes unfocused, biting her teal lower lip, the barbarian grabs one of your hands and pulls it to your shaft.");
		if(korgiSillyTranslate()) output(" <i>“Need more,”</i> she pants. <i>“Need thicker!”</i>");

		output("\n\nPressing your palm against your throbbing meat, she curls your fingers, one by one, until you’re clenching the [pc.base " + x + "]. With a satisfied smirk, she lowers herself slowly, achingly, her yielding lips kissing the top of your fist with slick honey. She quivers atop your knuckles, her undulating hips building momentum before she drops her entire weight wholly on your clutched root, hand and all. The korgonne lets out a weak moan as your fist slips inside her twat with a wet schlick.");
		if(korgiSillyTranslate()) output(" <i>“Now is right size,”</i> she murmurs, closing her eyes and biting her lower lip with satisfaction.");
		output(" Her body trembles, inner recesses clenching at your suffocating girth. The engorged flesh of your swollen shaft bloated even thicker by the pressure her stuffed cunt is putting on your snugly sealed fist.");
	}

	output("\n\nTied to your [pc.cockNoun " + x + "] by the primal strength of her own hungry cunny, the savage mounting you takes a moment to catch her breath, her chest rising and falling with pendulous weight. Perhaps it’s a trick of the light, but a vulnerable expression crosses her face. Her hips rotate around the bulbous leash of your flesh, muscles throbbing with an electric sensitivity. ");
	if(!pc.hasKnot(x) || pc.knotThickness(x) < 3) output("You can just make out the bulge in her abdomen where she’s forced your body past her too-tight slit with the single-mindedness of a bitch in heat.");
	//for large knots:
	else output("Your hefty knot is visible by the clear outline of a bulge below her belly, swallowed by the proud raider’s greedy puss.");
	output(" The korgonne girl gently touches the swell of her midriff and her whole body tenses, shivering delight locking her onto you tighter and tighter.");

	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiLadyDickLossPart4,x);
}

public function korgiLadyDickLossPart4(x:int):void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	if(!korgiSillyTranslate()) output("<i>“Alien, fuck,”</i> she murmurs, the wave of her orgasm slowly fading.");
	else output("<i>“Alien a good fuck,”</i> she sighs, milking her first orgasm.");
	output(" With both paws now, she begins to rub and stroke your bulge through her abdomen. Every second brings a new tightness down on your body as her pace grows frantic; her womb is kissing your cockhead even as her slit clenches tighter than an S&M holovid cockring.");
	if(pc.hasVagina())
	{
		output(" Your own [pc.vaginas] clench");
		if(pc.totalVaginas() == 1) output("es");
		output(" in time, sympathetically echoing the lupine ecstasy of the bulb-bound coupling.");
	}
	output(" You have a mere fraction of an inch to aid in your own thrusting, desperate for a release to the building pressure");
	if(pc.balls > 0) output(" in your swollen and churning sack.");
	else output(" that shoots cold numbness down your [pc.legOrLegs], sapping your strength.");
	output(" The need builds to painful levels and you can’t restrain yourself any longer. As the barbarian shudders from her latest orgasm, you seize a padded foot and use the leverage to spin her around. The bliss-drunk girl hardly understands what’s happening as she swivels on your swollen knob. With her plump posterior sliding back and forth atop your waist, you rise to a sitting position. She glances back as she practically vibrates in your lap, half-lidded eyes unfocused and uncomprehending.");
	output("\n\nSummoning a surge of strength, you grab the curly tail now facing you and lunge forward, taking the raider by surprise and pinning her under you. ");
	if(korgiSillyTranslate()) output("<i>“Wha-? Fight over!”</i> she protests weakly.");
	output(" Her leather bra snaps as massive, cushiony tits spill onto the cave floor, burying her face between them. The girl’s ass is helplessly lifted in the air, yoked to your turgid girth. She struggles beneath you, but her orgasms have left her muscles trembling and useless. Finally in a proper breeder’s position, you go into overdrive, pumping away with all the force you can muster, making the most of that bare inch between your [pc.knot " + x + "] and ");
	if(pc.balls > 0) output("the liquid weight of your [pc.sack].");
	else output("the [enemy.girlCumNoun]-slick surface of your nearly numb pelvis.");
	output(" The coiled, fluffy tail in your hand twitches as you use it to guide her ass back and forth in time with your pounding thrusts. From between her breasts she gurgles out a weak protest, ears low and flat as you ride her cerulean puss with abandon.");
	output("\n\nYou release her tail and reach around to grasp the girl’s abdominal bulge, sinking your fingers into her dense fur. An electrogun couldn’t have sent a more violent spasm through the girl, a muffled scream of bliss milked from her with the lightest touch. Heedless of her sensitivity, you tighten your grip around ");
	if(pc.hasKnot(x)) output("your aching and still growing knot");
	else output("your swallowed fist and sore [pc.base " + x + "]");
	output(" and begin pumping. Jerking yourself off through the korgonne’s nerve-dense pelvis brings immediate relief. Like you’ve hit an off-switch, her body relaxes under you and the suffocating tightness finally gives out.");

	output("\n\nWasting no time, your body bucks in the pressurized release of your [pc.cumVisc] geyser. Load upon load floods the savage’s trembling tunnel, your [pc.cockHead " + x + "] showering her depths with [pc.cumColor] streams. Her pudgy rump wobbles, wagging her tail in delight with each jet of spunk.");
	if(pc.cumQ() < 750) output(" Your orgasm is short-lived-but-intense; the seconds stretch out with every racing heartbeat. The girl under you squirms from the sensation of your liquid heat seeping into the muscled folds of her body.");
	else if(pc.cumQ() < 10000) output(" Time rolls by as your spine prickles with the rapture of your [pc.cumVisc] issue. The volume of your orgasm floods the barbarian’s body, leaving her tight muscles unable to hide the fluid bulk that renders her bloated and jiggling.");
	else output(" Time loses all meaning as the endless gallons pour from your sorely-abused frame into the presumptuous savage. Her belly expands, ballooning with [pc.cumNoun]; unable to push even a trickle around your plug, it fills the girl to twice her original thickness. The brash raider, reduced to a fuzzy, overfilled spunk sleeve, sways under you with a gurgling whine - living testimony to the dangers of vaginal hubris.");

	if(!pc.hasKnot(x)) output("\n\nYou draw your hand back from the girl’s slavering cum-tunnel. Thick webs of spoo drip from your sore fingers and leave gooey blobs across the korgonne’s fat rear. Pulling out of the subdued savage, you rise quickly to leave before she regains the use of her higher motor function. Unfortunately, you’re considerably more tired than you realized; your [pc.legs] give out and you land right on your [pc.ass]. A wave of dizziness overtakes you and, chest heaving from the exhausting ordeal, you lean against the tunnel’s wall to gather your strength.");
	else 
	{
		output("\n\nYour gushing stream of seed slows to a mere rivulet and finally, after a few more weak pumps, your orgasm recedes. You lay on top of the girl, heart racing and lungs gulping warm, musky air. After a minute or so, you rise to leave, but find yourself stuck. It seems your [pc.knot " + x + "] has swollen to its fullest, tying the two of you together in a bestial bond. You try to pull off, but between the girl’s tightness and your girth, you may as well be conjoined. Seed sloshes around your softening member, sealed within her plump pussy.");
		if(!pc.isAss()) output(" In deference");
		else output(" To further humiliate");
		output(" to the bound savage, you lift your [pc.leg] over her and climb off, turning around so that your [pc.ass] rests against hers.");
		if(korgiSillyTranslate()) output(" <i>“Such knot,”</i> she moans, twitching with well bred delight.");
		output(" Joined at the root, you settle down to wait out the tender bloat of your [pc.knot " + x + "].");
	}
	processTime(25);
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",dickwieldersLoseToKorgonneEpilogue);
}

public function dickwieldersLoseToKorgonneEpilogue():void
{
	clearOutput();
	author("Adjatha");
	output("You awaken, unaware of having fallen asleep. The korgonne woman is gone, but she’s left your belongings at your side. Your body is sore, but the ache is a sweet one; the memory of her body is one that will be hard to forget.");
	output("\n\n");
	processTime(45);
	CombatManager.genericLoss();
}

//Loss (Female / Neuter)
public function loseToFemKorgonneNoDick():void
{
	showKorgiFemaleHostile(true);
	author("Adjatha");
	if(pc.isGoo()) output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before swinging her spear around and cracking it against the back of your skull. The strike has little effect on your gooey frame, but you act dazed to avoid letting your captor know too much. With a self-satisfied nod, she grabs hold and begins to drag you toward a snow bank that conceals a small cave. She strips you of your equipment quickly and efficiently, before you can recover enough to stop her.");
	else output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before swinging her spear around and cracking it against the back of your skull. Your sight blossoms into a brilliant sea of white, as if the permafrost had swallowed you whole. Numbness. Darkness. A sensation of movement. When you come to, the snow is gone but the snow’s daughter remains.");
	output("\n\nStaring at you with flat, alien pupils, the korgonne raider ");
	if(!korgiSillyTranslate()) output("mutters words you don’t understand, more a moaning, wind-like song than speech as you know it");
	else output("offers a frank assessment. <i>“Fight is fun, but now for prize,”</i> she murmurs");
	output(". The savage has stripped off her thick leathers now that she’s out of the cruel wind’s reign. Your Codex has been tossed aside, but its screen still provides enough illumination to see. In the close, hot darkness, the woman squatting beside you seems almost tame. Her thick fur and stocky frame give the barbarian a softness that seems out of place in this harsh, frozen world. Thin straps of black leather hold her hefty breasts high on her chest, while small pieces of jewelry serve as her only decoration apart from her braids.");
	if(!korgiSillyTranslate()) output("\n\nShe asks you a question in her strange, whispering language and curls up her lip at your empty expression. <i>“Alien,”</i> she mutters, stretching the word out into an accusation.");
	else output("\n\n<i>“You good fuel for Great Forge. But maybe little forge good too,”</i> she chuckles, glancing between her legs. You don’t react to her joke, apparently offending the girl. Her eyes narrow.");
	output(" She leans forward, her paws seizing your [pc.chest].");
	output(" Startled, you become aware that you’ve been stripped to your bare [pc.skinFurScales]. You’d hardly noticed, your captor’s fervid body heating the cave as well as any thermal coat. She must’ve taken you into one of the tunnels pocking the surface of the icy plains.");

	if(!pc.isBlocked(0))
	{
		output("\n\nThe padded paw on your slit begins to slide up and down, stroking your folds with an uncertain, almost experimental curiosity. You gulp as heat floods into your hips, squirming under the savage’s inexpert motions. One of her soft, leathery fingertips grazes [pc.oneClit], and you roll your shoulders with a slight moan as the girl’s soft leather strokes your sensitive nub. Her wide eyes open a bit wider at your reaction, and her thumb bears down with an intensity that leaves you shuddering and gasping for air.");
		if(korgiSillyTranslate()) output(" <i>“Alien wears joy on outside of body?”</i> she discovers with a shock. <i>“So weak! Anyone breed you with touch,”</i> she sneers, adding a tweak to prove her point.");
		output(" Currents of bliss crackle up and down your abdomen as the korgonne’s other fingers roll, pinch, and massage the yielding folds of your labia. Reaching one hand up to grasp your [pc.nipple] and the other to your mouth, you jam the second knuckle of your forefinger between your teeth to mute your cries of pleasure.");
		output("\n\nJust as your hips begin bucking under the girl’s assault, she stops, leaving you squirming and panting with unfinished need. ");
	}
	else output("\n\n");
	output("The barbarian flashes a superior smile, her plump teal lips curling wickedly. ");
	if(korgiSillyTranslate()) output("<i>“You explore planet first. Now you explore korgonne.”</i> ");
	output("She turns about, straddling your shoulders between her stout thighs and wagging her curled tail. You can feel warm droplets of her excitement dripping down onto the [pc.skinFurScales] of your neck as her hands move to tweak your [pc.nipples]. The heat of her sex pours down on you with a damp moistness that drives all thoughts of cold and ice from your mind. Sliding her hips back and forth, her puffy vulva hugs the curve of your neck, you find your upper body coated in her fragrant, semi-sweet musk.");

	processTime(36);
	clearMenu();
	addButton(0,"Next",korgiNoDickPart2Loss);
}

public function korgiNoDickPart2Loss():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("A subtle, perfumed scent pours from the fluffy girl’s drooling pussy, leaving you feeling weak, with a powerful need to bury yourself in her. Gradually she leans back, settling her thick thighs around your head, the savage’s honeypot directly over your nose. A vise of soft fur claps around your vision, the girl’s weighty posterior settles onto your face, her swollen turquoise labia atop your lips. As her paws knead your [pc.chest], you pant against the bulging folds kissing you with wet warmth. Her [enemy.girlCumNoun] drips into your mouth, the taste both sweet and exhilarating, with almost the brisk coolness of mint.");
	output("\n\nPutting your [pc.tongue] to work, you trace the barbarian’s slit, slowly at first, using just the tip to apply thin lines of pressure to the silken folds before circling her nub of a clit. Surprisingly, her firm little sapphire elicits almost no response. ");
	if(korgiSillyTranslate()) output("<i>“Inside,”</i> she instructs, impatiently. <i>“Korgonne joy inside body!”</i> ");
	output("Pulling back, you flatten out your [pc.tongue], spreading its broad surface to encompass the whole of the girl’s drooling puss, starting at the back of your length and curling the sides just enough to cup the whole of her pliant plumpness with your [pc.tongue]. Wide thighs tighten around your head, a ripple of vulnerable weakness trembling through the porcine posterior straddling you. She grips your [pc.chest] harder and sinks down with a high-pitched moan of <i>“Fuuuuuck...”</i>");
	output("\n\nThe korgonne’s aggressive downward motion presses your [pc.face] to her cunt; lips and folds part around you as you plunge into her quivering tunnel. Your heart races, your [pc.skinFurScales] prickle");
	if(!pc.hasFur() && !pc.hasScales() && !pc.hasFeathers()) output("s");
	output(", and you nearly orgasm from the immersion in her depths. This faint, yet overpowering scent... it must be the girl’s pheromones, driving you wild. You try to cry out, opening your mouth an inch. The added girth of the insertion drives the girl wild; her soft moans turn loud enough to echo through the tunnel. The ecstasy even reaches you, with your ears clamped down by the pudgy thighs enveloping your head. You thrust your nose deeper, feeling her strong muscles yield to the invasive olfactory assault. Within seconds, the girl’s impatient twat suckles at your [pc.face] with a level of need normally reserved for a dog in heat.");
	output("\n\nBy wiggling your face side to side, you manage to squeeze your tongue out into her recesses. Your nose is flooded with bracing, minty scent and her gushing interior clamps down with orgasmic spasms, you lap at her vulnerable core with a lewd fascination. It’s as if every inch of her inner passage is as sensitive as a clit! No matter where you lick, the pressure of your tongue milks another orgasm from the bucking barbarian. Rivulets of femme cum stream from her vaginal depths faster than you can lick, the glistening nectar rolling down your chin even as her thighs and ass clench hard enough to pick up a face-shaped imprint. Howling, she collapses atop your chest.");
	if(pc.hasVagina()) output(" Slowly, gratefully, her long, rough tongue begins to lap at your [pc.clit], its rough surface playing merry havoc on your over-excited nerves. With idle, swishing motions, the savage easily brings you to climax - a small reward for your earlier enthusiasm.");
	output(" Between the soft weight of the plump korgonne atop you and the exhaustion of your fight and subsequent fuck, you drift off.");
	output("\n\nWhen you rouse, the savage is gone, though thankfully she left your gear behind. You’re tempted to go deeper into the tunnel to try to find her for a second round, but think better of it. The minty taste is still on your lips as you set off once more.");
	processTime(22);
	if(pc.hasVagina())
	{
		pc.orgasm();
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//Victory
public function defeatDaKorgiShit():void
{
	clearOutput();
	showKorgiFemaleHostile();
	author("Adjatha");
	output("The barbarian crouches low in the snow and ice, breathing clouds that billow around her sapphire snout. It’s hard to think about what to do with the girl while the cold creeps in at every corner, so you grasp her wrists and lead her a short distance away, to an embankment where the snow has formed a natural shield against the biting wind. When the two of you step into the meager shelter, the korgonne sinks to all fours, casting aside her wintry gear, leaving only an odd assortment of jewelry and thin straps of black leather to restrain her massive, E-cup chest. Head downcast, she leans forward to rub the backs of her ears against your crotch in deference.");
	if(!korgiSillyTranslate()) output(" She mumbles in a soft, sing-songy language rather like the hiss of the wind over your haven. The only words you catch are a common ones: <i>“Alien”</i> and <i>“fuck.”</i>");
	else output(" <i>“Alien is good for fight,”</i> she coos. <i>“Strong body fire. Is good for fuck, yes?”</i>");

	if(flags["KORGI_VICTORY_COUNT"] == undefined) 
	{
		output("\n\nA little surprised at her sudden turn from violence to sexuality, you punch up your Codex for a quick korgonne primer. It seems sex is a fairly common part of their civilization, used more for enjoyment and social bonding than actual procreation. <i>“Even ‘convincing’ a recalcitrant lover to mate with short-lived spats of violence is not frowned upon,”</i> the tablet adds.");
		output("\n\nIt seems she may have taken your fight as the overture to romantic advances. As much as she appears to distrust your alien appearance, she seems perfectly willing to join you in sharing body heat the fun way.");
	}
	else output("\n\nYou’ve brought the puppy to heel; time to put her through her paces.");
	
	IncrementFlag("KORGI_VICTORY_COUNT");

	processTime(3);
	//[Sit On Her] (requires centaur) [Let Her Lead] (requires dick)    [Ride Her Tongue] (requires pussy)  [Tit Fuck] (requires dick)   [Pump her Puss] (requires dick)   [Leave] (ends encounter)

	clearMenu();
	//[Pump Her Puss]
	//Cock that fits in pussy
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(0,"FuckHerPuss",pumpKorgiPuss,undefined,"Fuck Her Pussy","Fuck her right in the pussy.");
		else addDisabledButton(0,"FuckHerPuss","Fuck Her Pussy","You need a penis that fits in her vagina in order to do this.");
	}
	else addDisabledButton(0,"FuckHerPuss","Fuck Her Pussy","If you want to breed the puppy, you’ll need a cock.");

	//[Tit Fuck]
	//Needs cock
	if(pc.hasCock())
	{
		if(pc.genitalLocation() >= 2) addDisabledButton(1,"Tit Fuck","Tit Fuck","Your genitals are not in the proper location to try this!");
		else if(pc.smallestCockLength() < 42) addButton(1,"Tit Fuck",titfuckKorgonneWin,undefined,"Tit Fuck","A tightly bound chest like hers would be perfect for people with dicks.");
		else addDisabledButton(1,"Tit Fuck","Tit Fuck","You’re too big this. Maybe do something more appropriate to the size of your maleness.");
	}
	else addDisabledButton(1,"Tit Fuck","Tit Fuck","You need a penis to tit-fuck her.");

	//Giant dick sex - dick >= 42
	if(pc.hasCock() && dickBigEnoughForHyperKorgi()) addButton(2,"DickWorship",winVsKorgonneAndMakeHerLoveTheBigDeeeeek,undefined,"Dick Worship","You’d never fit inside the little thing, but that doesn’t mean she can’t please your maleness in other ways.");
	else addDisabledButton(2,"DickWorship","Dick Worship","You need a dick at least 42 inches long for her to please you with her whole body.");

	//[Ride Her Tongue]
	if(pc.hasVagina())
	{
		if(!pc.isBlocked(0)) addButton(3,"Ride Tongue",rideTheKorgiTongue,undefined,"Ride Tongue","That long tongue of hers would probably feel great if you had a pussy!");
		else addDisabledButton(3,"Ride Tongue","Ride Tongue","You ought to get rid of that plug in your puss first.");
	}
	else addDisabledButton(3,"Ride Tongue","Ride Tongue","You need a vagina in order to ride her tongue.");

	//[Let Her Lead]
	//Needs fittable dick
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(4,"Let Her Lead",letDatKorgiLeadWinsex,undefined,"Let Her Lead","Have her ride you.");
		else addDisabledButton(4,"Let Her Lead","Let Her Lead","You need a dick that will fit in her ass for this.");
	}
	else addDisabledButton(4,"Let Her Lead","Let Her Lead","You’ll need a dick if you want her to ride you.");

	//Requires taur + dick/balls or vagina.
	if((pc.hasVagina() && !pc.isBlocked(0)) || (pc.hasCock() && pc.balls > 0))
	{
		if(pc.isTaur()) addButton(5,"Sit On Her",sitOnKorgiForTaurs,undefined,"Sit On Her","Use your tauric body to sit on her.");
		else addDisabledButton(5,"Sit On Her","Sit On Her","Only centaurs are going to be able to do this.");
	}
	else addDisabledButton(5,"Sit On Her","Sit On Her","You need to be a centaur with a vagina or a centaur with balls and a penis for this.");
	
	if(eligibleForKorgiHumiliation()) addButton(6,"CockMockery",korgonneHardlightPussyStuffsStuffStuffings,undefined,"Cock Mockery","Your [pc.cockBiggest] is nothing to scoff at. Use it instead.");
	else if(pc.hasHardLightEquipped() && pc.hasKeyItem("Hardlight Strap-on Upgrades")) addButton(6,"HardlightFuck",korgonneHardlightPussyStuffsStuffStuffings,undefined,"Hardlight Punishment","See if your hardlight sextoy can satisfy this insatiable puppy slut.");
	else if(pc.hasCock()) addDisabledButton(6,"CockMockery","Cock Mockery","Your [pc.cockBiggest] is not nearly thick enough for this.");
	else if(!pc.hasHardLightEquipped()) addDisabledButton(6,"HardlightFuck","Hardlight Punishment","You need hardlight-enabled underwear for this.");
	else if(!pc.hasKeyItem("Hardlight Strap-on Upgrades")) addDisabledButton(6,"HardlightFuck","Hardlight Punishment","You need hardlight-enabled underwear for this - <b>with the upgrade that enables you to change the size.</b>.");

	addButton(14,"Leave",defeatDaKorgiLeave);
}

public function defeatDaKorgiLeave():void
{
	clearOutput();
	showKorgiFemaleHostile();
	output("On second thought, you think it would be best to leave, so you do.");
	processTime(1);
	output("\n\n");
	CombatManager.genericVictory();
}

//Requires taur + dick/balls or vagina.
public function sitOnKorgiForTaurs():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("The fluffy Korgonne looks so soft and so warm, ");
	if(pc.isNice() || pc.isMischievous()) output("an amusing");
	else output("a perverse");
	output(" idea strikes you. You guide her to lay on her back, arms at her sides. The girl is not sure what to make of your prompting, and mutters her confusion.");
	if(silly) output(" <i>“Many sleeps? Much ground. Few sexes?”</i> she whines.");
	else if(korgiSillyTranslate()) output(" <i>“Is no time for rest,”</i> she whines.");
	output(" Rising, you trot over the recumbent barbarian until your [pc.legs] surround her. You ");
	if(!pc.isCrotchExposed()) output("strip off your [pc.lowerGarments] and, with a smile, you ");
	output("lower yourself on top of her.");

	output("\n\nThe girl under you lets out a <i>“whoof!”</i> as your bulk pins her to the ground. You can feel the little fuzzball under you, squirming and trying futilely to wiggle out. As she shifts to the right, you lean slightly to to keep her under, switching to the left when she tries that direction instead. Just as you thought, she’s both absurdly soft and deliciously warm - practically a heated pillow, albeit a struggling one.");

	output("\n\nEnough fun, you figure. Time to put her to work. You shift forward slightly, so that her head pokes out under your backside. The canid takes a deep breath, drinking in your scent as she does so. Glancing over your shoulder, you enjoy the sight of the Korgonne’s ears twitching frantically, her face filled by the eclipsing closeness of your [pc.ass]. Under you, the girl’s hefty melons squish and roll against the [pc.skinFurScales] of your underside, her nipples hard enough to be felt even through the taut straps of her bra. You wiggle slightly ");
	if(pc.tailCount > 0) 
	{
		output(", raising your [pc.tail] ");
	}
	output("to direct her attention to your posterior, arms crossed under your [pc.chest]. The savage seems to take your meaning.");

	if(pc.balls > 0)
	{
		output("\n\nHer tongue flicks out, the moist organ sliding against your [pc.balls}, licking eagerly against the ");
		if(pc.ballDiameter() < 2) output("snug package resting atop her small snout.");
		else if(pc.ballDiameter() < 5) output("weighty orbs that droop against her panting face.");
		else output("ponderous sack that covers her head with the bloated promise of its copious, creamy contents.");
		output(" Lapping at your balls with wet, caressing strokes, she tongue-washes every inch of your pouch with single-minded fixation. Pressing hot kisses against the tender flesh, she squeezes your testes with soothing touches.");
		if(pc.hasCock()) output(" The length and hunger of her fondling tongue is so satisfying that you can feel your [pc.cocks] stiffening and swelling between the two of you. The girl under you moans at the burgeoning stiffness, unable to tend to your swelling lust with anything but her mouth.");
		output(" As tempting as it is to let her suckle at your balls all day, you wiggle forward just a bit, to move the girl on to her next task.");
	}
	if(pc.hasVagina() && !pc.isBlocked(0))
	{
		output("\n\nThe restrained girl draws her seven inch tongue up to the summit of [pc.oneVagina]. Boldly pushing against the plump surface of your labia with brash vigor, she hones in on your [pc.vagina], thrusting her organ inside without delay. You shudder from the intrusion, your muscles clamping down on the barbarian’s tongue with a vulnerable tightness. Despite her immobilized body, the korgonne pushes her thick inches into your quivering slit with osculating sweeps. Though she pays little attention to [pc.eachClit], the questing touches of her slurping tongue is enough to send a ripple of bliss through your body. She laps up the [pc.girlCum] dripping from [pc.eachPussy] with loud, wet delight, polishing the plumpness of your lower lips to gather up every drop of your [pc.girlCumFlavor] moisture. Panting and eager for the final course, you scoot up just a bit more, leaving no room for doubt where the girl must send her tongue next.");
	}
	processTime(10);
	clearMenu();
	addButton(0,"Next",taurSitOnKorgi2);
}

public function taurSitOnKorgi2():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("The captive girl under your [pc.legOrLegs] gulps audibly. Letting out an eager huff, you drag your fingertips across your [pc.nipples]");
	if(pc.tailCount > 0) output(" while swaying your elevated tail impatiently");
	output(". Tentatively, the korgonne stretches her head upward, her body shifting under you");
	if(pc.hasCock()) output("r [pc.cocks]");
	output(". She presses her warm moistness against your [pc.asshole], bashfulness making her caresses weak and halting.");
	if(!pc.isNice()) output(" You rise an inch off of her and drop yourself back down atop the pudgy canid, driving the air from her chest.");
	output(" Gasping, she licks harder, her tongue encircling the fleshy folds of your backside. Growing more confident with each circuit, the girl beneath you traces her licking path teasingly across the tender ingress of your [pc.asshole]. Leaning back to press the full weight of your [pc.ass] against her face, your [pc.chest] rise" + (pc.hasBreasts() ? "" : "s") + " with the sharp sensitivity of your saliva-glossed posterior.");

	output("\n\nDrooling slobber dripping down your rump, the girl bound beneath you takes a chance and presses her tongue against your [pc.asshole]. She forces inch upon inch of her slippery organ past your sphincter with reckless fervor. You squirm and shudder at the intrusion, leaning forward with eyes clenched shut against the astonishing sensation of the korgonne’s eye-crossingly talented tongue. Rocking back and forth against her face helps feed the full seven inches into your pucker. The girl’s girthy bulk sweeps against your nerve-dense threshold so vigorously, it almost feels as if she’s licking your very core.");
	var cums:int = 0;
	if(pc.hasCock())
	{
		cums++;
		output("\n\nYour [pc.cocks] bloat");
		if(pc.cockTotal() == 1) output("s");
		output(" with orgasmic nearness, grinding your hardness against the supple curves of the rotund girl under you. She locates your prostate and it’s all over. The pressure of your body atop hers seems to reverse itself the moment her writhing muscle presses against your inner walls, milking you from within. Your body lurches as your [pc.cocks] hit");
		if(pc.cockTotal() == 1) output("s");
		output(" orgasmic release, cum flooding the slim space between your underbelly and her pliant pudge. [pc.CumVisc] [pc.cumNoun] washes over her dense fur and your [pc.skinFurScales] with a heat that bridges your bodies in a way no words possibly could.");
	}
	if(pc.hasVagina() && !pc.isBlocked(0))
	{
		cums++;
		output("\n\nAnother wave of ecstasy prickles within your [pc.pussy], your backside quivering with delight at the savage’s eagerness to please. As she grinds her short muzzle against your [pc.ass], the bulge of her jutting lower lip begins to stroke against your [pc.clit]. The sweet, tickling brush of her heated lips renews the tender tingles that leave your pussy pulsing with inner contractions that rob your muscles of their strength. Gasping moans rise from your [pc.chest] at each stroke and in no time, fresh blobs of [pc.girlCum] dribble down across your captive’s face.");
	}
	output("\n\nEven after your climax, the korgonne keeps her tongue-lashing up, her heat rising into you like a fever. Your head swims and your eyes unfocus. Losing track of yourself, you ride the small savage for some time before finally passing out in exhaustion. When you come to, you find yourself rolled on your side. The girl has gone, but the imprint of her stocky frame is still visible in the melted snow where you pinned her down. You have to admit - her race must be quite dense little pups, if they can take the full weight of your tauric frame and still use their tongues like that! Grabbing your [pc.gear], you rise and prepare to set out once more.");
	processTime(10);
	for(var x:int = 0; x < cums; x++)
	{
		pc.orgasm();
	}
	output("\n\n");
	CombatManager.genericVictory();
}

//[Let Her Lead]
//Needs fittable dick
public function letDatKorgiLeadWinsex():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You ");
	if(!pc.isCrotchExposed()) output("strip off your gear and ");
	output("sit down at her side, spreading your arms in an open gesture of yielding consent. A grin overtakes her teal lips and the submissive girl regains a measure of her savagery.");
	if(korgiSillyTranslate()) output(" <i>“Strong alien is smart. Make weak please strong. Is best.”</i>");
	output(" Leaning forward, she presses her supple E-cups against your chest, while rising to press plump pussy lips against your [pc.cock " + x + "]. The girl’s curled tail wags energetically, a mischievous look of predatory glee on her face as the warm nectar of her slit drips down your shaft. A thrill of cold heat runs through you, your [pc.cocks] stiffening as her faintly minty scent fills your nostrils. Squeezing her thighs around you, the primal girl drags her melons over your [pc.skinFurScales] while her fingers trace the interiors of your arms. Her palms apply pressure to keep your hands against the ground, while she wiggles her small blue nose in your face before lightly nibbling at your [pc.nipples].");
	output("\n\nBubbles of your precum add froth to the girl’s dripping lubrication, leaving your cock faintly glistening in the embankment’s shadowed shelter. Reaching between her legs, she curls her padded fingers around your girth, stroking slowly as her pussy lips engulf your cockhead.");
	if(pc.balls > 0) output(" Her precum-slick palm slides across your swollen sack, offering a surprisingly tender massage. She caresses your [pc.sack] possessively, a small trickle of drool building at the corner of her mouth.");
	output(" The korgonne woman pushes forward on her knees, her hand moving upward in short, swift strokes, spurring your stiffness to almost painful nearness. As she reaches your [pc.cockHead " + x + "], she pulls back and settles her ass against your lubricated tip. You rise just a fraction and she thrusts you flat against the ground once more. With agonizing slowness, she pushes herself down onto your length, sighing with satisfaction as each inch parts her suckling pucker a little bit more.");
	pc.cockChange();
	output("\n\nArching your back, the velvet tightness of her asshole seems to draw you deeper with each milking contraction. The gooey lubrication oozing down your cock leaves her ass so slick, your gradual rocking becomes a deep, brutal thrusting in mere moments. The slapping impacts of her fat cheeks against your [pc.thighs] leave the savage’s weighty bottom slick, each jiggling impact louder and harder than the one before. The girl’s voice gains an octave as she cries out in her melodic language, ");
	if(!korgiSillyTranslate()) output("making fervid oaths whose meanings are all too clear, despite the fruitlessness of the individual words.");
	//translated: 
	else output("<i>“Cock like spire! Heat like Great Forge! Weak serves strong and strong pleases weak!”</i>");
	output(" She bottoms out on your [pc.cock " + x + "], wiggling in a rapid rotation to bring every muscle of her clenching sphincter to bear. Rising once more, she holds only the crest of your cockhead within her ass, kissing your peak with teasingly taut caresses.");

	output("\n\nThe girl’s unpredictable pace keeps your climax at bay, riding the exotic rhythm of the korgonne’s fat ass and toned thighs. Switching from fast to slow with capricious perversity, the girl has more energy than you’d have been prepared to expect. Her paws straddling her abdomen, she strokes inside her darkened, indigo labia. You reach up and pull the black strap of her bra, releasing the wobbling E-cup puppies to bounce with the rest of the dog. Each hefty breast is capped by a sapphire nipple, firm as an icicle. You seize the roly-poly cainid’s porcine endowments, fingers sinking into the yielding fur and flesh of her rotund globes. With thumbs circling her warm, blue peaks, the barbarian tosses back her head, catching the light in her long, golden mane. Her tongue lolling happily out of one side of her mouth, the savage leans forward to put the full weight of her ponderous tits fully at your mercy; Tweaking and rolling her nipples between your thumbs and forefingers, you clench her bovine tips in time with the squeezing pressure.");

	output("\n\nUnable to hold back, the korgonne girl’s body tenses as her muscles tighten with the vigorous intensity of her climax. She collapses against your [pc.chest], rocking against your shaft so quickly that she’s nearly vibrating. The steady, swift motion, along with the firm shaft suckling of the savage’s thick booty sends you over the edge as well. Your pelvis bucks and spurts of torrid jizz flood the barbarian’s rear. Bloated ropes of [pc.cumVisc] [pc.cumNoun] gush up your throbbing length and into depths of her impassioned interior; pussy walls rippling with fresh contractions as each sticky torrent jets into her.");
	if(pc.cumQ() >= 3000) 
	{
		output(" Her gut bloats at the volume of your seed, spurts of cum leaking from her ass to splatter your lower body with every fresh gushing stream.");

		if(pc.hasKnot(x)) output("\n\nYour knotted bulb inflates hot on the heels of your orgasm, sealing off the leak and swelling her abdomen further as the trapped [pc.cumNoun] bubbles deeper into her belly. Her speech devolves into a panting string of meaningless syllables, possibly playfully cursing your [pc.knot] or perhaps thanking her primitive deity. The korgonne climaxes again from the fullness of your expanding meat plug, rocking against you to milk out every last [pc.cumGem]. The two of you spend the next half hour locked in this embrace; her eagerness brings you to release once more while her own orgasms are too numerous to count. Finally, your [pc.knot " + x + "] recedes and releases a small ocean of spunk gushing from the girl’s gaped posterior.");
	}
	output("\n\nPanting, the two of you hold each other close as the ardor of your union slowly cools. ");
	if(pc.cumQ() >= 100) output("When you finally pull out, your cum dribbles between her legs in long, thick rivulets. ");
	if(!korgiSillyTranslate()) output("<i>“Fuck alien,”</i> she says, with a frisky, approving growl.");
	else output("<i>“Alien come back in time of plenty,”</i> she suggests. <i>“Breed with korgonne for strong pups.”</i>");
	output(" She squeezes her husky frame back into her gear and sets off into the snow with a single glance back that is as much encouragement to return as any heartfelt plea you’ve heard.");
	output("\n\n");
	processTime(25);
	enemy.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	CombatManager.genericVictory();
}

//[Ride Her Tongue]
public function rideTheKorgiTongue():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("You lower yourself, hands loosely draped across the girl’s shoulders. Dancing your fingers up her collar and across her stout jaw, you push her onto her back, leaning forward to rub the side of your nose against her cheek. Moving up, you press the supple swell of your [pc.lipsChaste] against her teal pillows, mouths trespassing on one another with light whispers and airy kisses. Pressing down, you nibble at the pliant threshold of her lower lip, applying enough force to draw a slight wince before sweetly sucking the flesh into your mouth and licking the dimples left by your teeth.");
	output("\n\nYou open a touch wider and lock your [pc.lips] around hers, sighing in equal measure, smiling and kissing while you pull down the leather bands holding back her ample bosom. Your hand finds hers and you pull both up to one of her wobbling breasts. Your fingers interlock around the turquoise peak of her petite nipple, squeezing in time with the swaying pace of your lips. The korgonne’s tongue darts out to encircle and suckle your own and the sheer length is marvelous. Its surface is semi-coarse with the subtle bumps of swollen taste buds that seem to savor and explore you.");
	output("\n\nBreaking the kiss, you cup the barbarian’s ponderous E-cups, lifting the tender mounds and squeezing them together until the sapphire nubs at their tips rub against one another, inches below her face. With a slow lunge, you spread your [pc.tongue] out as wide as it will go and lick the other girl’s peaks, starting at the yielding base of her quaking cleavage and rising until the very tip teases both nipples at once. The husky girl in your arms trembles and, as you pull away with a suggestive eyebrow raised, she nods with uncharacteristic meekness. ");
	if(korgiSillyTranslate()) output("<i>“Strong mouth,”</i> she praises, one expert to another. ");
	output("She lowers her head, feeding the long inches of her own tongue out of her short muzzle, the massive organ starting at the top of her breasts and slowly licking downwards. When she reaches the bottom of her breasts, the full length of her seven inch tongue glistening, you reach out and seize the organ between your forefinger and thumb, then tug. Her face is held smushed between her almost bovine tits, and the korgonne rolls her eyes upward to meet your gaze.");

	output("\n\nReleasing the girl for a moment, you");
	if(!pc.isCrotchExposed()) output(" strip out of your [pc.lowerGarments] and");
	output(" straddle her face, gently grabbing her ears. Lowering [pc.vaginas] to rest atop her warm, wet lips, you busy your thumbs stroking the edges of her ears.");
	if(pc.balls > 0)
	{
		if(pc.ballDiameter() < 5) output(" Your [pc.sack] rests atop the bridge of the girl’s snout, twitching with anticipation and drinking in the heat of her flushed face.");
		else output(" Your [pc.balls] settle over the girl’s head like a pair of heaving, liquid pillows. Her face covered by your wobbling orbs, her vision is entirely consumed by the tableau of your titantic testes, [pc.skin] gently throbbing across her cheeks, swollen with their [pc.cumVisc] promise.");
	}
	if(pc.hasCock()) output(" [pc.EachCock] twitches as the girl’s wet nose presses up against your eager lips, filling with the rush of firmness that leaves your chest rising and falling ever faster. Inch after inch stiffens, bobbing above the girl’s head as you put her to work.");
	output(" The barbarian’s strong, soft hands grab your [pc.ass], one velveteen paw on either cheek as her warm nose strokes the petals of your plump pussy.");

	output("\n\nTeasing pokes of her lengthy tongue at the bare periphery of your slit turn to slight caresses, her lips rolling over your mound with warm pecks on your left side, then your right. Opening her mouth, she engulfs the whole length of your slit, hot breath against your lower lips with just the hint of her firm moisture to tantalize. Her hands cup your asscheeks while her thumbs stroke your inner thighs, squeezing your mons as her lips release your labia with a wet pop. Tightening your [pc.thighs], your fingers worrying the plush fuzz of her twitching ears, your hips roll, and you stroke your pelvis against her face, impatient for that warmly-anticipated tongue.");

	pc.lust(30);
	processTime(20);
	clearMenu();
	addButton(0,"Next",korgiLicksPCPussPart2);
}

public function korgiLicksPCPussPart2():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("As if to taunt you, the korgonne nips at the bud of [pc.oneClit] just hard enough to draw a yelp from you before her tongue slides out to lick the tweaked nub with tender strokes. Instead of soothing you, her bumpy muscle provokes ever greater twitches in your spine, numbing your fingers");
	if(pc.hasToes()) output(" and toes");
	output(". Sliding the tip of her tongue down to the entrance of your cunny, her oral wetness curls to continue its lapping vibrations against your pleasure button. Narrow at first, her tongue enters your [pc.pussy] with delicate concern, poking and prodding at your recesses while beads of your lubrication roll across her tastebuds. Another inch enters, and then another. You shake in the building throes of an orgasm, [pc.oneClit] seemingly bonded to the korgonne’s mouth, her upper teeth prodding at the fleshy hood around your pussy pearl. Six inches inside you, the savage uncurls her tongue, spreading it to its full, flat girth with a swirling orbit.");
	output("\n\nIt’s too much. The girl’s tongue seems everywhere at once, your mind unable to keep up with its speed and size, much less the polishing friction of the bumpy buds on your overloaded clit. You abandon the woman’s ears to seize locks of her golden mane, lacing your fingers through her braids to pull her deeper into your pussy. Trembling with the toe-curling orgasm, you let out a few choice oaths and cum.");
	if(pc.hasCock()) output(" [pc.EachCock], overloaded from the pleasures below, twitches and throbs, expelling small blobs of [pc.cum].");
	if(pc.balls > 0) output(" The [pc.balls] resting on the barbarian’s face thrill with the tingling burden filling them, their bulk rolling back and forth against the soft cushion of her densely-matted fur.");
	output("\n\nHer thumbs stop stroking fleshy grooves into your [pc.ass] to slide underneath and locate your [pc.asshole]. Your entire bottom is soaked with the korgonne’s saliva");
	if(pc.wettestVaginalWetness() >= 4) output(" and your own gushing nectar");
	output(", so she uses the warm leather of her paw pads to gather fluid and lubricate the entrance with wide, whorling patterns. Pressing against the cushioned pucker, the girl under you slips the tips of two fingers into your sphincter, pressing in as her tongue applies equal pressure from the other side. The nerve clusters react with such intensity that you nearly jerk right off of her face; she responds by rolling her tongue over in your [pc.pussy], doubling its girth and thickening around your [pc.clit] as well.");

	output("\n\nYour first orgasm was a mere flurry compared to the whiteout of your second. Every muscle in your body tenses; your jaw so tight it aches and your thighs so taut the girl under you lets out a muffled yipe.");
	if(pc.hasCock()) output(" Even without a hand laid on it, your [pc.cockBiggest] leaps under the intensity of your bliss, discharging thick, [pc.cumColor] streams with wild abandon. Each twitch sends it bouncing madly, arcs of spunk splattering in wild ropes against the snow while others go high, splashing against your [pc.chest] and even your [pc.hair].");
	if(pc.balls > 0) output(" Your groaning sack wobbles " + (pc.hasCock() ? "as its sticky issue geysers out in a libertine spree" : "with your pent-up seed") + ". The wanton orbs bounce atop the girl’s face, their vulgar weight audibly slapping her with their liquid mass.");

	output("\n\nYour [pc.pussy] grips the alien tongue with desperate need, and your hips rock back and forth as you grind against her soaked muzzle. You impale yourself again and again on the korgonne girl’s coiled organ, savoring each contour and every bloated taste bud. Her upper teeth slip down, past your clittoral hood and nip once more at the raw nub of [pc.oneClit], a third orgasm building as she nibbles and munches your pearl and pussy with relentless gluttony. Your muscles burning, your body aching, your genitalia raw from the barbarian’s assault, you let yourself collapse on top of her, surrendering yourself to the savage’s tender mercies.");

	output("\n\nYou can barely stand by the time it’s all over. Rather than take advantage however, the korgonne merely licks your cheek, smearing globs of drool and your own [pc.girlCumNoun] across your [pc.skinFurScales]. With something approaching affection, she offers only a single word: <i>“Alien.”</i> This time, however, her lips are curled with pleasure. As she sets off, hardly winded, you give yourself a few more minutes to recover. You decide it’s definitely worth putting up with this world’s cold if there are such warm havens as the korgonne.\n\n");
	processTime(25);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[Tit Fuck]
//Needs cock
public function titfuckKorgonneWin():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("Setting aside your tablet, you take a seat next to the busty barbarian, curling one hand behind the small of her back while your other reaches up under one of her hefty mounds. The yielding weight sinking between your fingers with fleshy malleability brings a flush to the savage’s face: her nose colors a darker shade of teal. The black leather straps holding her bounty tightly against her chest creak as your groping becomes more forceful. Fingertips pressing into her heavy tits, rolling and kneading the furred surface, you draw her closer. You lean forward into her plump curves, just a teasing inch from her turquoise lips; your breath mixing in misty clouds that rise like steam. Her bra protests again as her stiff nipples peek out from the constraining bands. Above and below the wrap her breasts bulge lewdly, promising too much to pass up.");
	output("\n\n");
	if(pc.isAss()) output("Pushing the korgonne over, you ");
	else output("Guiding the korgonne to her back, you ");
	if(!pc.isCrotchExposed()) output("slip out of your [pc.lowerGarments] and ");
	output("straddle the girl’s chest with your [pc.cockBiggest] over her cleavage. She tucks one thumb between her glistening blue lips while the other hand tentatively caresses your alien length. Soft paw pads stroke your swelling shaft");
	var x:int = pc.biggestCockIndex();
	if(pc.hasSheath(x)) output(" and fingertips play with the tender folds of your bestial sheath");
	if(pc.hasKnot(x)) output(", brushing along the bulging bulb of your [pc.knot]");
	output(" before fondling the full length of your fat cum vein all the way up to your [pc.cockHead " + x + "]");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output(" where she pulls and pinches at the copious folds of your fleshy foreskin");
	output(".");

	output("\n\nThe savage’s shy exploration of your biology deserves a little reward, you decide, and you push your thumb a fraction of an inch into her eager slit. The korgonne takes the hint and nervously cranes her neck forward, kissing your [pc.cockHead " + x + "] before her vibrant, azure tongue spirals out of her maw around your thickening meat. It proves longer than you would’ve thought and in another moment, a full seven inches of drooling flesh are coiled around your girth with a serpent’s taut grip. Warm, wet, and squeezing, she uses her slavering tongue to haul you past the lips and into her impatient mouth. Her squat muzzle hugs your inches, stuffing her chubby cheeks with [pc.cockHead " + x + "]. While the lengthy tongue wriggles and writhes across your sensitive surface, you begin to pump at her pucker. Her head bobs with wet, gleeful gulps when your fingers begin to weave and stroke the entrance to her pussy, drawing out runners of her clear lube.");

	output("\n\nSteadying your breathing, you slowly pull out of the barbarian’s mouth, her tongue desperately trying to hold you in, but unable to find purchase amid the dripping goo that coats you from her overeager blowjob. ");
	if(korgiSillyTranslate()) output("<i>“But- but alien taste good!”</i> she whines. ");
	output("Pulling your hand up from the girl’s quivering snatch, you admire the sticky web of femme cum that sags between your fingers. With a few strokes, you mix it with the slobber already dribbling from your girth to create a glaze of sloppy, viscous knob-polish. Scooting back an inch, you lower the full, turgid length of your [pc.cock " + x + "] to the tight fuckhole her leather bra has made of her E-cup cleavage.");

	output("\n\n");
	if(pc.cocks[x].cLength() < 12) output("You sink into the yielding curves easily, their pliant mass hugging you snugly. The mounds rock gently back and forth as your lubricated shaft slides into their sweet embrace. The barbarian presses her hands to either side of her titanic chest, fingers digging into her fur with restless eagerness. The girl’s added pressure squashes her fat tits tighter, and you pick up your pace to take advantage. Bucking back and forth, riding her fuzzy udders with wild abandon, the girl’s whole body shakes with tidal ripples. Her face curls into a toothy smile and she snakes her cobalt tongue past her sapphire lips to plunge into her cleavage from the top, meeting your prodding flesh within. Lapping up pre-cum, she coils around your [pc.cockHead " + x + "], drawing you deeper with every thrust. Before long, you’re practically bouncing atop the girl’s stout frame. The restrained bulk of her chest thwacks her chin while your organ is jerked off in the pillowy vice of her mammoth milkers.");
	else output("You brace your monstrous member at the base of her constrained curves, pushing the well-lubricated tip into her cinched cleavage with a groan of effort. The pressure is incredible; the leather straps holding her breasts whine with the strain of your invading girth. Even with your ample lubrication, it’s slow going, her mammary vale at once pliant and firm. Her breasts bulge with every motion, setting off gasps from the girl, who caresses her tender, bound nipples. Your [pc.cockHead " + x + "] pushes through the chesty canyon, glistening inches pushing deeper until the precum-leaking slit emerges from the other side to bump against her little blue nose.");
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",titFuckKorgiWinPart2,x);
}

public function titFuckKorgiWinPart2(x:int):void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("With relish, she takes the tip into her mouth and begins to suckle at it as you slowly thrust in the tethered tightness of the savage’s fat tits. ");
	if(pc.cocks[x].cLength() < (12 + 1)) output(StringUtil.capitalize(num2Text(Math.floor(pc.cocks[x].cLength() - 1))));
	else output("Twelve");
	output(" of your inches assault the girl’s wobbling melons while the remainder are greedily sucked down into her slavering maw. The oral attention sets your hips bucking, swollen girth adding too much strain to the korgonne’s banded chest. One by one, the hide belts around her chest groan, stretch, tear, and finally buckle with a series of sharp snaps! The barbarian gasps again as the tension releases, and you use the opportunity to shove your length deeper into her mouth with a hungry growl. With the crushing softness around your shaft loosened, you pump eagerly, her breasts jiggling energetically at their freedom.");
	output("\n\nWhen you finally feel the inevitable cascade of your orgasm rising in prickling tension at the back of your gut, you pull back until only your [pc.cockHead " + x + "] is tucked within her plush cushions. Your [pc.cock " + x + "] bulging with its brimming load, you seize the plump peaks of her E-cups, sinking your grasping digits into her supple curves while the tips of your thumbs flick the rigid stiffness of her nipples. With a few more pumps into the unresisting tracks of her swaying mountains, your orgasm overflows.");
	output("\n\nHer prodigious bust wobbles as you release your [pc.cumFlavor] bounty between her considerable endowments. Spurting spunk with wild abandon, you flood the korgonne’s cleavage with hot gouts of streaming spoo. Jizz fills the taut crevasse rapidly, blobs splurting from the top of her curves, [pc.cumVisc] [pc.cumGem] speckling her throat and splattering against her cerulean nose and lips.");
	if(pc.cumQ() >= 2000) output(" The full pressure of your release kicks in, and the lonely [pc.cumColor] lakes adorning your big-titted savage are quickly bolstered by more thick ropes of [pc.cumVisc] stuff. The geyser of your orgasm splashes against her muzzle, as much filling her shocked mouth as blasting against her wide-eyed face. She blinks and sputters as [pc.cumNoun] fills her nostrils and festoons her braided mane in a [pc.cumVisc] [pc.cumGem] tiara. By the time you’re done, the lake of semen between her breasts sloshes over her shoulders and drips from her jaw.");

	output("\n\nA chuckle sets the girl’s smut-lacquered tits to jiggling once more. With a sly wink, she deploys the long, cobalt length of her tongue, licking the [pc.cumNoun] from her face and neck. With a satisfied gulp, she swallows your alien seed before inserting her tongue into the depths of her jizz-filled cleavage. She siphons the reservoir between her teats up the seven long inches of her sapphire mouthpiece and into her short, muzzled mouth, filling her cheeks with the volume of your sticky issue. Panting and wonderfully sore, you lay down on top of her, watching the husky canid drinking down your spunk as she cleans the herself with lewd, slurping gulps.");
	output("\n\nWhen she’s finally clean, you ");
	if(!pc.isAss()) output("give her freshly-plumped belly an affectionate pat and ");
	output("tweak one of her prominent nipples, promising another meal the next time you meet. She laps a stray blob of spunk from the bridge of her nose and flashes a smile that seems to say she’s looking forward to it. <i>“Alien,”</i> she murmurs appreciatively, licking the tips of her fingers one at a time before shrugging into her gear and setting off.");
	processTime(20);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Pump Her Puss]
//Cock that fits in pussy
public function pumpKorgiPuss():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("The korgonne’s jiggling curves and dense, fluffy coat look oh-so-inviting in Uveto’s unrelenting cold. Pulling her close, you squeeze the girl’s plump ass and slide your fingers through the loose braids of her hair. The barbarian’s strange, rectangular pupils meet your gaze with a look of mild defiance, but her mouth curls at the edges, spoiling her bravado. ");
	if(korgiSillyTranslate()) output("<i>“Alien bold. You claim prize?”</i> she asks. ");
	output("You lean in close, inches from the canid’s sapphire nose, and smile as her nostrils widen to take in your scent. A slight tremble flutters down her spine, radiating outward into a full body shudder, her slight motions magnified by the pudgy heft of her stout frame. Breathing deeply, she crosses the final inch between your lips with a fierce sigh, all reluctance melted by the heat blossoming between your bodies.");
	output("\n\nHer kiss is aggressive, pressing tightly against you, exploring your [pc.lipsChaste]. Tightening your grip on her hair, you pull her firmly against your [pc.chest], unable to sate the enkindled yearning by the caressing embrace of her cobalt lips alone but unwilling to abandon her strong, skillful tongue. Her hands slide between the two of you, resting on your [pc.hips] before moving to your [pc.thighs]. ");
	if(!pc.isCrotchExposed()) output("You unhook and slide out of your [pc.gear]; t");
	else output("T");
	output("he sharp, frigid air of the planet is actually refreshing on your overheated [pc.skin] and burning blood. Shivering slightly, you draw the savage closer, her warmth as intoxicating as any spirit.");
	output("\n\nFueled by the girl’s flourishing vigor, the bulk of your [pc.cocks] stiffen");
	if(pc.cocks.length == 1) output("s");
	output(" between you. She closes her eyes and coos with delighted impatience as you swell against her soft stomach. ");
	if(!korgiSillyTranslate()) output("She rocks her hips against yours with a need that transcends language.");
	else output("<i>“Share water-heat,”</i> she begs softly. <i>“Fill korgonne with seed.”</i>");
	output(" You break the embrace slowly, lips tingling from the final lick of her blue tongue.");
	if(pc.genitalLocation() <= 1) output(" A strand of saliva bridges the gap between the two of you as she opens her eyes, her heart fluttering against your chest.");
	output(" Sliding your hips " + (pc.genitalLocation() <= 1 ? "back" : "forward") + ", you brace your [pc.cockHead " + x + "] against the husky mounds of her torrid labia, kissing the folds of her dripping tunnel.");
	output("\n\nHer nose blushes a dark indigo and she nods ever so slightly and you push into the savage with a slow-but-unrelenting stroke. She tenses, clutching your shoulders as her tongue lolls from her mouth, panting steamy clouds that flicker and writhe around your eyes. Her tightness slows your stroke to a crawl, but you push on, driving your swollen inches as deeply as ");
	if(pc.cocks[x].cLength() < 9) output("you can.");
	else output("the girl’s pussy permits.");
	output(" Entrenched inside the barbarian,");
	if(pc.genitalLocation() <= 1) output(" you grasp her thighs,");
	output(" thumbs sinking into her plush curves. And yet, under her jiggling exterior, you can feel the firm, corded muscles of the raider’s robust strength. Yielding and yet dense, the girl reminds you of some fruits: sweet, succulent flesh around a firm core.");
	pc.cockChange();
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiPussPump2,x);
}

public function korgiPussPump2(x:int):void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	author("Adjatha");
	output("The korgonne girl rocks back and forth, drawing you deeper into her slick depths. Pumping in time with her motions, you savor the fleshy ripples your thrusts make against her abdomen and thighs. She wags her small, curled tail as your pace quickens, turning shallow pokes to impassioned lunges. She humps her lower body into yours with a delight that transforms into bliss as her body tenses with a blossoming orgasm hot as a rain forest. Your swollen shaft fights against her greedy, clinging slit, bouncing the barbarian’s fat ass in your lap hard enough to leave your [pc.hips] aching. A faint hint of mint perfumes the air, electrifying and accelerating your movements.");
	output("\n\nThe throbbing weight of your member presses down on your mind, blurring your sight as your climax builds. Releasing all restraint, your pace becomes bestial. You pound the girl’s pussy while ravenous lust boils in your veins. The heavy breasts heaving against your [pc.chest] are slowing your pace, so you tilt forward, driving yourself deeper and harder into the plump, boneless bliss of the savage’s orgasmic stupor. Your peak comes with dizzying suddenness as the girl clamps down with every inch of her well-muscled tunnel, milking your frenzy from you in hot, [pc.cumVisc] blasts that flood her tenderness with the feral abandon of a rutting beast. Locking her ankles around your [pc.ass], she pulls you in as deeply as she can, hips rolling in time with your swelling discharge.");
	if(pc.cumQ() >= 2000) 
	{
		output("\n\nThe girl beneath you coos in delight, perhaps mistaking the meager overture of your orgasm for its entirety. Your [pc.ass] twitching, you grab the small of the girl’s back and grip her tightly as waves of seed gush into her. She shudders from the unexpected flood, wide-eyed and staring at the space between your bodies as the belly-bloating goo surges against her squeezing muscles.");
		if(pc.cumQ() >= 25000) output(" The canid’s core fills with a fresh flood at each impassioned pump, her eyes rolling back as the [pc.cumFlavor] tide stuffs her spasming snatch beyond anything she’s ever experienced. Thick streams spurt from her gaped pussy, but the leaks cannot keep pace with your gut-stuffing flow. The barbarian’s abdomen swells against yours, the fluid girth expanding the girl’s tummy from adorably plump to outright gargantuan. With every womb-filling load, she balloons with liquid weight. When finally, achingly, your orgasm slows and stops, the husky savage has been reduced to a roly-poly blimp, so full she can only gurgle in overwhelmed bliss.");
	}
	output("\n\nThe two of you cling to one another for a long time, shared body heat leaving you both panting while your [pc.cumVisc] [pc.cumNoun] sloshes inside her.");
	if(pc.hasKnot(x)) output(" The inflated mass of your [pc.knot " + x + "] plugs your seed within, tight against her taut tunnel. The sheer size of your knot seems to leave the girl beneath you in a cascade of climaxes, her oversensitive inner passage overloaded by the breeder’s knob swollen within her. When it does recede, the girl is so far gone that a single kiss might set off another orgasm.");
	output(" You withdraw from the plump korgonne");
	if(!pc.isCrotchExposed()) output(" and wrap yourself in your [pc.gear] once more - a poor replacement for her sultry body");
	output(".\n\n");
	processTime(10);
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	CombatManager.genericVictory();
}

//By fenoxo, because the Korgonne are lacking in awesome.
//Win with Giant Deeek Sex
//Replaces titfuck if dick >= 42
public function winVsKorgonneAndMakeHerLoveTheBigDeeeeek():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	var x:int = 0;
	//Covered
	if(!pc.isCrotchExposed())
	{
		output("Boy is she in for a surprise. You answer her in the only language she’ll understand: shifting your [pc.lowerGarments] to free the behemoth");
		var bigDicks:int = 0;
		for(x = 0; x < pc.totalCocks(); x++)
		{
			if(pc.cocks[x].cLength() >= 42) bigDicks++;
		}
		if(bigDicks > 1) output("s");
		else if(pc.totalCocks() > 1)
		{
			output(" and his little brother");
			if(pc.totalCocks() > 2) output("s");
		}
		if(bigDicks > 1 || pc.totalCocks() == 1) output(" inside");
		output(".");
		if(bigDicks > 1) output(" You make sure the biggest comes out first, hitting her square on her chilly snout, nearly flattening the poor little pup in unwieldy, swiftly swelling cockmeat.");
		else output(" You make sure you flop it out square onto her chilly little snout, nearly flattening the poor pup in a wave of swiftly swelling cockmeat.");
		output(" Somehow, she keeps from buckling entirely, rolling it onto her shoulder and looking up at you with wide, amazed eyes.");
		x = pc.biggestCockIndex();
	}
	//Uncovered
	else
	{
		x = pc.biggestCockIndex();
		output("The poor pup is beside herself with want, particularly once the feeling of her hot breath on your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.base " + x + "]");
		output(" has your length engorging, flooding out inch after inch of turgid cockflesh, spilling over her shoulder and smearing past her cheek. You bathe her in the scent of your musky, unrepentantly fuck-hungry odor until her tail is wagging and her eyes are a little glassy. She whimpers briefly, eyes darting between your crotch and slab of dick threatening to bowl her over.");
	}
	//Merge
	output("\n\n<i>“Such big... wow....”</i> The savage’s eyes are as wide as dinner plates, and her tongue is dangling free, panting excitedly, bathing your veins in warm puffs of barbarian breath.");
	if(flags["KORGI_BIG_DICKED"] != undefined)
	{
		output("\n\nYou grab a fistful of her tawny locks in your fingers and drag her head back. <i>“You missed this, didn’t you?”</i>");
		output("\n\nInstead of answering, she tentatively extends her tongue further, lapping from the base of your crotch");
		if(pc.hasSheath(x)) output(" up your sheath");
		output(" to the first few inches of your dick, smearing it in warm, viscous saliva. It would seem she did.");
	}
	else
	{
		output("\n\nYou grab a fistful of her tawny locks and press her moist lips to your crotch. <i>“Show me how much you want it.”</i>");
		output("\n\nAnswering in the affirmative, the furry nymphette unspools a few inches of lengthy tongue, gingerly pressing it to ");
		if(!pc.hasSheath(x)) output("the base of your crotch");
		else output("your sheath");
		output(", briefly licking in slow circles before dragging it upward, coating the first few inches of your underside in warm, viscous saliva.");
	}
	//Merge
	output("\n\nKorgonne tongues must have been designed to lick dick. It feels absolutely perfect, like a warm wet sleeve of muscle that curls at the sides to cradle every nook and vein. It’s smooth too, a sensation enhanced by her slick saliva, rendering her surprisingly adept tonguejob every bit as slippery as a high-grade sextoy. You relax, letting the tension of the fight ooze out of your frame so that you can focus completely on enjoying her oral attentions, and she pays you back by licking more vigorously, craning her neck to polish more of your still-growing rod.");
	output("\n\nLetting her go, you sit yourself down in order to give her better access to your mammoth erection, dragging her tongue up the underside of your urethra in the process. Your [pc.legs] nearly give");
	if(pc.legCount == 1) output("s");
	output(" out in the process, trembling from the sudden rush of pleasure, but the fluffy warrior doesn’t lose her oral grip in the slightest. She may as well be glued to your cock for how little effect your shuddering has on her totem-worshipping. [pc.Butt] on the ground, you’re free to lean back and enjoy your victorious reward.");
	//Dick taller than the Korgonne
	if(pc.cocks[x].cLength() > 66)
	{
		output("\n\nSadly the fluffy savage still can’t reach the tip of your [pc.cock " + x + "], even now that you’re seated. It looms above her");
		if(pc.cumQ() < 30) output(", twitching and seemingly unattainable");
		else if(pc.cumQ() < 1500) output(", dribbling the first dollops of pre");
		else output(", dribbling a curtain of pre");
		output(". But that doesn’t slow her down at all. She licks her way up as high as she can, and when she can lick no higher, she wraps her arms around your hyper-sized girth, pushing your moistened flesh against her pillowy breasts while simultaneously pulling you downward, letting your dick’s own tremendous weight assist her in reorienting your phallus to a slightly more horizontal angle.");
		output("\n\nShe’s like an adorable, cold-weather gymnast, climbing hand-over-hand up your length. She slobbers and moans against it, and you can feel her nipples as they slide over your spit-lubed dick, gently digging into the sensitive skin like the corner of a half-melted ice cube. You " + pc.mf("groan","moan") + " encouragingly and try your best not to shake your hips. You can always grind her into a puddle of cum and melted snow later - if she fails to properly sate you.");
	}
	//Merge
	output("\n\nThe noisily slurping native climbs your [pc.cock " + x + "] with the kind of eager affection you’d expect from a hungry galotian or ausar in heat, squeezing and stroking just slightly off-tempo from her slithering, salivating tongue. When she finally reaches the summit and seals her lips around your ");
	if(pc.cumQ() >= 1500) output("drooling");
	else output("semi-rigid");
	output(" urethral entrance, your eyes cross from the pleasure. Her tongue burrows right on on, scooping out thick dollops of pre-cum one after another, then thrusts inside and wiggles around, stimulating the inside of your dick just as effectively as her spit-lubed, stroking paws.");
	output("\n\nFuck, you can’t hold back anymore. You pump your [pc.hips], groaning with the titanic effort of lifting your cock and the korgonne both. She clings on like she’s hanging on for dear life, wrapping her legs around the girth, veiny shaft and her arms just below the [pc.cockHead " + x + "]. She never lets more than a few inches of tongue slip out of your urethra, continually stroking and pumping, fucking your cock with a tongue far too long for her otherwise diminutive size.");
	output("\n\nNo matter how violent your bucks, the slutty savage hangs on, her whole body slipping and squeezing each time, her efforts succeeding only in further stimulating you, driving you hump the air (and her arms and legs) harder. Your [pc.cock " + x + "] bloats beyond its normal, erect size, overinflating, the excess blood trapped by the korgonne’s legs. She’s like a clingy organic cock-ring and fuzzy onahole all wrapped up in one jiggly little package, squirming happily.");
	output("\n\nTickles and tingles radiate from where the korgonne’s wagging tail brushes against your swelling, expanding urethra, teasing muscles that are already beginning to clench in orgasmic ecstasy into seizing, violently jerking your prick straight up.");
	if(pc.balls > 0) 
	{
		output(" Your [pc.balls] tighten and jump, pumping out little swimmers by the ");
		if(pc.cumQ() < 100) output("ounce");
		else if(pc.cumQ() < 3785) output("billion");
		else if(pc.cumQ() < 14000) output("gallon");
		else output("barrel");
		output(" to be mixed into your bubbling lovejuice.");
	}
	output(" Climax explodes inside you with the force of a lightning strike. Your [pc.hips] jerk forward, fully extending, making your [pc.legs] tremble in the midst of your bliss.");
	output("\n\nAnd at the top of it all sits your alien prize, her cerulean lips sealed to your distending urethra.");
	if(pc.cumQ() < 20) output(" Her eyelids droop as you pump your meager orgasm onto her waiting tongue. She drinks it happily, humming in blissful satisfaction with every taste of heir protein-packed prize. By the time she finishes, she’s looking happy, content to slide down your mast to rest on the ground.")
	else if(pc.cumQ() < 250) output(" Her eyelids droop as you pump thick wads onto her waiting tongue, using her curved muscle as a pipe for your [pc.cumVisc] load to travel through. Gulping noisily, the korgonne seems utterly content to be devouring her protein-packed prize. By the time she finishes, she look tired and happy, content to slide down your mast to rest on the ground.");
	else if(pc.cumQ() < 1500) output(" Her eyelids droop, then shoot wide open as the first blast of seed floods along her tongue and into her maw. Cheeks bulging, she swallows in a panic at first, then with increasing confidence once she adjusts to the rhythm of your ejaculations. For some time, you stay like that, you straining and squirting, her drinking and gurgling, slowly relaxing her grip on your girth. By the time she finishes, her belly is pressing back against your dick, slowing her slide back to the ground.");
	else output(" Her eyelids droop contentedly, then blow wide open in shock and alarm as the first shotgun blast of seed unloads into her mouth, bulging her cheeks. Excess [pc.cumNoun] squirts from her strained lips as she gurgles messily, her throat bulging in a failed attempt to keep up with your obscene volume. The second ejaculation literally blows her face back from your dick, painting her muzzle in a sheer coat of glittering [pc.cumGem] while jism freely pours out of her overtaxed maw. The determined little slut doesn’t let go, though. She hangs on, edging part of her mouth over your dick in time for the next squirt. Her hair is instantly soaked, but the savage slut claims a more manageable sample of the protein she was looking for, gulping down a mouthful of every torrid spunk-eruption.");
	//Excessive
	if(pc.cumQ() >= 10000) output("\n\nFor the better part of a minute, she hangs on as best she can, but even her considerable fitness is put to the test after clinging onto a cum-greased pole for a full sixty seconds. Slowly, she slides down, her wobbling, sperm-filled belly the only part of her that seems to provide any friction for her descent. When she lands on her ass, she lands hard, belching lewdly enough to create a momentary [pc.cumNoun]-bubble, too stunned by this turn of events to get out of the way of your voluminous sex-shower.");
	//Less excessive
	else if(pc.cumQ() >= 3000) output("\n\nBy the time you’ve both had your fill, her belly is wobbling and stuffed with [pc.cumNoun], and her face is covered in a sperm-frosted grin. She slowly slips down your length to the ground, landing on her cushy butt. Burping, the korgonne’s lips blow a jizz-bubble, then hang open in wonderment.");
	//Merge
	output("\n\n<i>“S-s-such cock,”</i> the barbarian babbles. <i>“");
	if(pc.cumQ() >= 10000) output("Cum forever.");
	else if(pc.cumQ() >= 250) output("Many cum.");
	else output("Tasty cum.");
	output("”</i> One of her paws is between her legs, pumping wildly, soaked with what must be the product of an easy orgasm. <i>“Find again. Alien sex.”</i>");
	output("\n\nIf every meeting is going to be like this, you’ll look forward to it.\n\n");
	//20 minutes, orgasm, increment counter for times hypered the korgonne.
	processTime(20);
	pc.orgasm();
	IncrementFlag("KORGI_BIG_DICKED");
	CombatManager.genericVictory();
}

//Repeat - Lose to Korgonne Fun
public function loseToKorgonneWithABigDickAfterGivingHerBigDickFetish1():void
{
	clearOutput();
	showKorgiFemaleHostile();
	if(pc.isGoo()) 
	{
		output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before ");
		if(pc.lust() < pc.lustMax()) 
		{
			output("swinging her spear around and cracking it against the back of your skull. The strike has little effect on your gooey frame, but you act dazed to avoid letting your captor know too much.");
			applyDamage(new TypeCollection( { unresistablehp: 5 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
		}
		else output("hefting her spear and giving you a warning look. It’s a wasted gesture; you’re too turned on and eager for whatever she has planned to resist in the slightest.");
		output(" With a self-satisfied nod, she grabs hold and begins to drag you toward a snow bank that conceals a small cave.");
	}
	else 
	{
		output("When you sink to the ground, the barbarian nods with satisfaction. The tan korgonne offers a slight smirk before ");
		if(pc.lust() < pc.lustMax()) 
		{
			output("swinging her spear around and cracking it against the back of your skull. Your sight blossoms into a brilliant sea of white, as if the permafrost had swallowed you whole. Numbness. Darkness. A sensation of movement. When you come to, the snow is gone but the snow’s daughter remains.");
			applyDamage(new TypeCollection( { unresistablehp: 10 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
		}
		else output("hefting her spear and giving you a warning look. It’s a wasted gesture; you’re too turned on and eager for whatever she has planned to resist in the slightest. With a self-satisfied nod, she grabs hold and begins to drag you toward a snow bank that conceals a small cave.");
	}
	var prelust:Number = pc.lust();
	processTime(30);
	pc.lust(prelust,true);
	clearMenu();
	addButton(0,"Next",loseToKorgonneWithABigDickAfterGivingHerBigDickFetish2);
}
//Fen note - make sure she always has a giant-dick fetish after the first time you use the scene for easier combat tease!
public function loseToKorgonneWithABigDickAfterGivingHerBigDickFetish2():void
{
	clearOutput();
	showKorgiFemaleHostile(true);
	output("Staring at you with flat, alien pupils, the korgonne raider can’t suppress her grin. <i>“My turn. Make warm, alien. Sex-warm.”</i> She places one hand on your ");
	if(!pc.isCrotchExposed()) output("bulge");
	else output("[pc.cockBiggest]");
	output(" without further ceremony, nonchalantly squeezing it while casually unlacing her own leathers. With Uveto’s cutting winds blocked by this balmy cave’s warmth, she doesn’t put a second thought into discarding her clothes, revealing her fluffy, nude form and abundant jewelry. She squeezes again, ");
	if(!pc.isCrotchExposed())
	{
		output("giving the intervening garment");
		output(" the same treatment before ");
	}
	var x:int = pc.biggestCockIndex();
	output("watching your ");
	if(pc.lust() < 80)
	{
		output("dick swell against her padded palms");
		if(pc.hasSheath(x)) output(", spooling out of your sheath whether you want it to or not");
		else output("swiftly expanding toward full size whether you want it to or not");
	}
	else output("newly freed dick twitch excitedly, bouncing in place like an excited puppy");
	output(".\n\n<i>“Big [pc.boyGirl]. Good.”</i>");
	if(pc.lust() >= pc.lustMax()) output("\n\nYou certainly feel like a good boy, what with how fucking horny you are. You got nice and aroused all on your own, without any help from the sexy little fluffball. Still, you feel like you’re getting harder and harder the longer you sit in this cramped cave, like the faint scent of mint in the air is swirling up your nose and down into your [pc.cocks]. It must be her pheromones, making you still more aroused, begging you to give in to the urges thudding in your ears. Why resist when you can lie here, presenting your mountainous member for the horny bitch to climb?");
	else
	{
		output("You certainly don’t feel like a good [pc.boyGirl], not when you’re bruised and hurting, but it’s getting easier and easier to forget about the aches harder you get. ");
		if(pc.cocks[x].cLength() >= pc.tallness/1.6) output("Until your [pc.cock " + x + "] punches into your chin, that is, making you wince and twist to the side to let it grow by. The korgonne giggles and teasingly squeezes and rubs it, making it grow past your head, declaring itself as your body’s biggest and most important organ. The pleasure it exudes would seem to agree.");
		else 
		{
			output("The nerve-dense bundle of arousal between your legs gradually drowns out every other sensation, replacing pain with the feeling of it sliding up your chest");
			if(pc.biggestTitSize() >= 2) output(", pressed between your [pc.chest] and the woman’s soft palm");
			output(", expanding until it is its full, tumescent size. Yet it keeps getting harder, firmer than it even should be from such minimal stimulation. It’s like the vaguely minty scent in the air is swirling up your nose, down your throat, and into your cock, forcing you to become completely, irrevocably aroused.");
		}
	}
	//Dick chin-punch variant additional pg:
	if(pc.lust() < pc.lustMax() && pc.cocks[x].cLength() < pc.tallness/1.6)
	{
		output("\n\nYou crinkle your nose at the faint minty smell in the air, feeling your dick throb against your ear with every breath you take, like there’s something in that smell that’s forcing you to get even more rigid, even more prepared for whatever the korgonne has planned. It must be her pheromones! Your [pc.cock " + x + "] surges at the mere thought, your traitorous flesh entirely too pleased to have an excuse to go into rut.");
	}
	//Doge climbs on dick and humps, soaking in pussy juice and spit, then cumshot later?
	output("\n\n<i>“Fun time,”</i> the savage slut pants, climbing atop your turgid mast. <i>“Wow.”</i> Her eyes meet yours, looming over the side of your pole, dilating wide with desire. Clenching tight, her furry thighs are the first part to wrap around your member, joined shortly after by cushy tits and fur-padded arms. The little pads on the tips of her fingers press down over your throbbing veins, rubbing in slow circles while their owner begins to grind her crotch against you.");
	output("\n\nYou can barely comprehend just how <i>wet</i> the little bitch’s pussy. Rivulets of girlish excitement are streaming down either side of your [pc.cock " + x + "], rapidly transforming your mountainous slab of maleness into a well-lubricated machine, one the savage is thrilled to treat like her personal piston. She huffs hotly, her breaths coming in foggy little pants as she grinds against it, spreading the fragrant cuntjuice further and further along your shaft and matting her own fur in the process.");
	output("\n\nThe cave fills with the fragrant aroma of sex, your own rich male odor mixing in with the korgonne’s sweet mint. Her pheromones appear to be affecting more than just the size and firmness of your erection too; her tongue is lolling out of her mouth, dipping lower every time her sodden puss hitches on a vein so tumescent that it vibrates with your heartbeats. In the time it takes her to make a few more dick-pleasing humps, her tongue slips the rest of the way out, revealing upwards of seven inches of cerulean muscle - muscle that slaps wetly against your urethra whenever the pervy pup shifts position.");
	output("\n\nAnd she will <i>not</i> sit still. Her fluffy tail is flapping back and forth");
	if(pc.balls > 0) output(", gently slapping your [pc.balls]");
	output(". Her hips hitch and jerk in between long drags up and down your shaft. The tiny little sizequeen can’t even keep her fingers from feverishly fondling your sensitive [pc.cockColor " + x + "] skin. Girlcum is streaming out of her now, washing out in thicker waves whenever she quivers particularly hard.");
	output("\n\nThe savage is actually getting off on grinding against your [pc.cock " + x + "]. She seems to have forgotten about the rest of you in her zeal to mount it, and the sensations pumping out of your crotch are good enough for you not to care. She’s using you like her own personal sex-toy, just a big dick that can’t help but jerk and throb against her, perfectly fulfilling her fetishes until she tires of it.");
	output("\n\nIn a surge of inspired passion, the korgonne shimmies upward and bends lower, nuzzling her nose against the side of your urethra just below your [pc.cockHead " + x + "]. Her tongue lashes against your frenulum, lashing up and down the sensitive skin while her hips go into overdrive. She moans ecstatically as she tongue-polishes the dick she has obsessed over ever since that time you forced her to please it, losing herself to the thrill of contact with a member ");
	if(pc.cocks[x].cLength < 65) output("nearly as big as she is.");
	else if(pc.cocks[x].cLength() < 66) output("just as big as she is.");
	else output("bigger than she is.");
	output("\n\nThrough it all, she remains completely oblivious to the way you squirm below. Not even your [pc.cock " + x + "] lifting up and fattening in pre-orgasmic bliss is enough to rouse her from her frenzied stupor. For all she notices, your urethra may as well have always bulged like that, heavy with a load of [pc.cumNoun] just shy of exploding.");
	output("\n\nYou don’t see much point in warning her, but a groan slips from your throat all the same. She’s just too damned soft, warm, and slick not to cum with her rubbing all over you. Passion swells in a mighty wave, matched by the flexing expansion of your cock, then bursts through the dam that is your self-control, ");
	var cum:Number = pc.cumQ();
	if(cum < 250)
	{
		if(pc.cocks[x].cLength() < pc.tallness/2)
		{
			output("spurting ropes of spunk ");
			if(cum >= 100) output("all ");
			output("over your [pc.face].");
		}
		else
		{
			output("spurting ropes of spunk ");
			if(cum >= 100) output("all ");
			output("over the cave wall.");
		}
	}
	else if(cum < 500)
	{
		output("unleashing heavy ropes of spunk that ");
		if(pc.cocks[x].cLength() < pc.tallness/2) output("paint your face in a thick coat of [pc.cumColor].");
		else output("paint the wall into a perverse, [pc.cumColor] mural.");
	}
	else if(cum < 2000 && pc.cocks[x].cLength() < pc.tallness/2) output("drenching your [pc.face] in a tremendous coat of [pc.cum] and creating a halo-shaped puddle of libidinous excess on the floor below");
	else if(cum < 2000) output("drenching a cave wall in a tremendous coat of [pc.cum], painting a mural of libidinous excess atop the frosty rocks until they seem to steam with spent passion.");
	else
	{
		output("drenching ");
		if(pc.cocks[x].cLength() < pc.tallness/2) output("your face and every part of the cave from your neck upward in");
		else output("the cave above and behind in");
		output(" a perverted deluge. Spurt after spurt squirts out, splashing messily into the puddle, and still the korgonne writhes atop you, encouraging you to squeeze out every drop. By the time you become aware of anything but the all-consuming relief, you realize you’re lying in a several inches deep pool of your own [pc.cum].");
	}
	output("\n\nThe fucked-out puppy-girl seizes a moment later, then goes limp, sliding heavily ");
	if(cum >= 2000) output("into your artificial lake with a sloppy splash");
	else output("to the floor");
	output(". She sighs contently then wearily climbs up onto her feet. <i>“Good dick-[pc.boyGirl]. Fun fuck. Do again.");
	if(silly) output(" Such sex!");
	output("”</i>");
	output("\n\nYou roll over and try to get up but find yourself still winded from ");
	if(pc.lust() < pc.lustMax()) output("the damaging fight");
	else output("an orgasm too long in coming");
	output(". By the time you sit up, she’s already lacing up her boots. With a feral grin, the korgonne licks her lips and disappears into the snow.\n\n");
	processTime(30);
	pc.orgasm();
	CombatManager.genericLoss();
}

public function eligibleForKorgiHumiliation():Boolean
{
	return (pc.hasCock() && pc.biggestCockThickness() < 2.7);
}

//hardlight overclock versus giant korgonne pussy [tbd title]
//button name: "Cock Mockery" (maybe) or "Hardlight Punishment" (meh)
//PC win scene for female korgonne boobarian
//requires equipped hardlight and either no cock or all cocks are too small (coder to determine size limit)
//korgonne scoffs at PC's dick size/absence, PC turns on hardlight, forces size to maximum and punishes the bad dog
//tooltip: See if your hardlight sextoy can satisfy this insatiable puppy slut.
//disabled tooltip, no hardlight: You need hardlight-enabled underwear for this.
//disabled tooltip, has a cock above minimum size: Your [pc.cockBiggest] is nothing to scoff at -- just use that instead.
public function korgonneHardlightPussyStuffsStuffStuffings():void
{
	clearOutput();
	author("Zeikfried");
	showKorgiFemaleHostile(true);
	var bimbo:Boolean = pc.isBimbo();
	var bro:Boolean = pc.isBro();
	var buttfux:Boolean = (pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) 
	//intro for small cocks
	//coder to define 'small' based on korgonne capacity
	if(eligibleForKorgiHumiliation())
	{
		output("You ");
		if(!pc.isCrotchExposedByArmor()) output("begin to strip your [pc.armor]");
		else output("advance on the korgonne");
		output(", but she takes one look at you and laughs. Stunned, you follow her gaze to the object of her mirth - your [pc.cockNounSimple " + pc.biggestCockIndex() + "]");
		if(!pc.isCrotchExposedByLowerUndergarment()) output(", bulging in your underthings");
		output(".");
		output("\n\n<i>“Youngling no good for fuck,”</i> the woman sneers. <i>“Maybe hunt cat girl instead. She not mind tiny.”</i>");
		if(bimbo) output("\n\n<i>“Izzat so?”</i>");
		else output("<i>“Yeah?”</i>");
		output(" you challenge, irritated.");

		output("\n\n<i>“Is so,”</i> snaps the dog bitch. She slips her pudgy fingers into her pussy, burying her hand to the knuckle - and then, with no discomfort and every evidence of relish, <i>curls them into a fist inside herself</i>. She is apparently much roomier on the inside, built to accommodate a huge knot. The korgonne shudders as she pulls her fist back out. <i>“");
		if(pc.catDog("nyan", "bork", false) == "bork") output("Stranger");
		else if(pc.catDog("nyan", "bork") == "nyan") output("Cat");
		else output("Alien");
		output(" too thin.”</i>");

		output("\n\nYour blood burns and your cheek tingles in shame as the cold wind licks at your blushing face. A desperate urge to punish bubbles up in you");
		if(pc.isNice()) output(", though you try to force it down");
		output(". You’re tempted to fuck her anyway, even if she wouldn’t feel anything... and then you remember the special equipment you’re packing in your [pc.lowerUndergarment]. You could use your adjustable, high-tech hardlight underwear to give her a dicking fit to stretch a leithan, if you were of a mind....");
		output("\n\n<i>“What about this, then?”</i> You reach for the controls and activate the hardlight projection. A long, glimmering white light-cock springs forth.");
		output("\n\nThe korgonne is stunned - at least, for a moment. <i>“Pleasure shines,”</i> she oohs and ahhs. Her expression dulls. <i>“But still no knot. Useless.”</i>");

		if(pc.isNice() || pc.isMischievous()) 
		{
			output("\n\n<i>“Just give it a chance. Maybe it’ll");
			if(bimbo) output(", like,");
			output(" grow on you,”</i> you offer, moving in. The defeated korgonne is unimpressed, but leans back and motions you in anyway.");
		}
		else output("\n\n<i>“Fuck you,”</i> you answer. The defeated korgonne huffs, but leans back and keeps her legs spread anyway.");
	}
	//if no cock
	else
	{
		output("\n\nYou ");
		if(!pc.isCrotchExposedByArmor()) output("shed your [pc.lowerGarment] and ");
		output("begin to remove your [pc.lowerUndergarment], but the korgonne cocks her head and looks at you so quizzically that you stop.");

		if(bro || pc.isAss()) output("\n\n<i>“What?”</i> you demand.");
		else if(bimbo) output("\n\n<i>“Get an eyeful, honey,”</i> you flirt, running a hand over a [pc.hip].");
		else output("\n\n<i>“Something on your mind?”</i> you ask.");

		output("\n\nThe pudgy dog-girl begins to giggle disturbingly - moreso because she’s staring at your crotch when she does.");
		output("\n\n<i>“Dumb ");
		var isCat:Boolean = (pc.felineScore() >= 4 || pc.catDog("nyan", "bork") == "nyan");
		if(isCat) output("cat");
		else output("stranger");
		output(" no need get butt cold,”</i> the barbarian laughs. <i>“Can see in pants... much flat, no bulge. No pleasure. Use hand instead.”</i> She spreads her fuzzy, plump thighs wide, exposing herself. Her puffy, bluish labia look normal, until she sticks her pudgy fingers inside and spreads them easily, revealing that deeper within she could easily accommodate a leithan without any trouble.");
		if(!pc.isAss()) output("\n\n<i>“Hand? I could fit a leg in there,”</i> you spit.");
		else if(bimbo || pc.isNice()) output("\n\n<i>“Hey, that’s mean,”</i> you protest.");
		else output("\n\n<i>“It doesn’t matter if you don’t have the key when the lock is stripped,”</i> you frown.");

		output("\n\nThe korgonne still laughs. <i>“Dumb ");
		if(isCat) output("cat");
		else output("stranger");
		output("...”</i> she repeats. The busty bitch’s mocking eyes bring the blood to your face; your nerves tingle as the cold wind licks at you through your protection, and you find yourself getting angry. Your thoughts flash to your ");
		if(!pc.isTaur()) output("thumbs still tucked in the waist of your ");
		output("[pc.lowerUndergarment] and its adjustable dildo projection - just the perfect thing to shut up this cocky, cock-demanding slut. Your fingers drift to the controls.");

		if(pc.isAss() || bro) output("\n\n<i>“Scope this,”</i>");
		else if(bimbo) output("\n\n<i>“Honey, you’re so fucked and you don’t even know it,”</i>");
		else output("\n\n<i>“Yeah? What do you think of this?”</i>");
		output(" you challenge. With a touch of the main power, the holo-dick springs into existence.");

		output("\n\nThe korgonne’s tongue reels in and she sits up so fast her boobs bounce. <i>“Pleasure shines!”</i> she marvels. Her excitement doesn’t last long, though; when the holo doesn’t do anything else, she leans back again and resumes her bemused expression. <i>“Knot many too thin. Good for cat - not korgonne.”</i>");

		if(bro || pc.isAss()) output("\n\n<i>“Deal with it,”</i> you grunt,");
		else if(bimbo) output("\n\n<i>“Gosh, you’re picky. Don’t you think all dicks have their own charms?”</i> you ask facetiously,");
		else output("\n\n<i>“I’m sorry you feel that way,”</i> you snap,");
		output(" and begin to advance on the big-titted babe. She frowns, but then shrugs and spreads her legs again, preparing to enjoy herself anyway.");
	}
	//merge
	output("\n\nInstead of simply falling on the ready woman, you step up and nudge her with your ");
	if(pc.isTaur()) output("fore ");
	output("[pc.foot] until she huffs and rolls over. The barbarian takes up position on hands and knees, hanging her head to try to watch the penetration but unable to see past either her heavy tits or her wide ass.");

	output("\n\nYou place your ");
	if(pc.isTaur()) 
	{
		output("fore ");
		output("[pc.feet] ");
	}
	else output("hands ");
	output("on her hips and pull her in, lining her up with the tip, then rest it inside her puffy vulva.");
	if(pc.isTaur()) output(" She braces against the ground as you spear forward, sinking the holo-prick into her.");
	else output(" Instead of guiding her onto the prick as she expects, however, you release her hips and lean forward, grabbing two handfuls of her huge breasts and carrying her off the ground, mashing them to her chest as you pull her roughly down onto your crotch. The korgonne moans as you manhandle her, a deep rumble that’s almost like a purr of pleasure. With the holographic rod in place, you let her drop again and she hits the ground with a ‘whoof’.");
	output("\n\nAs you begin to pump, you can feel the korgonne trying to shift her hips to stimulate herself on the dildo - she continually drags the tip against a ring of nerves deep inside, emitting cute yips and grunts whenever you touch it.");
	if(!pc.isTaur()) output(" Her enthusiasm is such that you find you have to move your hands back to her hips to keep the strap-on inside her, but this just makes her whine harder when she can’t scratch her itch.");
	
	var sThing:String = "Alien";
	if(pc.catDog("nyan", "bork", false) == "bork") sThing = "Stranger";
	else if(pc.catDog("nyan", "bork") == "nyan") sThing = "Cat";
	
	output("\n\n<i>“Bigger!”</i> grunts the wide-assed bitch. <i>“Need bigger for joy!”</i> She pushes her colossal heinie into you, trying to force more dildo inside, but there’s nothing left to take - your photonic cock is so deep in her pussy that the emitter is in the shade. <i>“" + sThing + " too small!”</i>");

	output("\n\nWhy, this awful slut... your back stiffens in anger");
	if(!pc.isTaur()) output(" and your fingers dig into her plush ass, which only makes her purr again");
	output(". You had wanted to warm her up a little and grow the projection gradually, but without really thinking about it you find your rhythm slowing as your fingers go for the controls.");
	output("\n\n<i>“Now slow, too,”</i> whines the korgonne. <i>“Small and slow... no joy.”</i>");
	output("\n\nYou swallow the last insult she’ll deliver and hilt yourself deep inside, then release the safety and begin to crank up the size of the projection - rapidly. The hum from the device intensifies, but it’s still barely audible above the ambient wind... and the korgonne’s mewling. Suddenly, her spine straightens.");
	output("\n\n<i>“Ooh?”</i> grunts the alien.");
	output("\n\nYou can only imagine the sensations she’s experiencing. The length control maxes out early as the tip of the holo-cock bumps against the stout korgonne’s womb... but the girth just keeps going and going, spreading the dog-girl’s cerulean labia wider and wider. The slider reaches 60% of the maximum and the korgonne is only just now beginning to feel the effects.");
	output("\n\n<i>“" + sThing + " get bigger? Give water-heat soon?”</i> the puppy slut croons.");

	output("\n\nYou continue to swell your penile projection, inch by inch, until you begin to feel resistance. The big-booty bitch feels it as well - she lowers her chest to the ground, mashing her huge tits into the snow, trying to angle her body to help the tool touch every one of her insides.");

	output("\n\n<i>“What? " + sThing + " knot everywhere!”</i> She clenches her jaw as you max out the girth slider - the tip is clearly hurting, but the base must be touching <i>all</i> of her sweet spots, because she’s gyrating her hips like a dynamo and moaning. <i>“Joy! Korgonne feel joy!”</i>");

	if(bimbo) output("\n\n<i>“I bet you do, honey,”</i> you sigh, looking wistfully at the monster cock you’re plunging into her ravenous pussy.");
	else if(bro) output("\n\n<i>“Fuckin’ a right,”</i> you grunt.");
	else if(pc.isNice()) output("\n\n<i>“Hope it’s not pinching too much,”</i> you say solicitously - though you’re still half-annoyed at the ungrateful breeding bitch.");
	else if(pc.isMischievous()) output("\n\n<i>“Why? Your municipal bonds finally mature?”</i> you grunt, pummeling the korgonne’s womb with your dildo.");
	else output("\n\n<i>“Keep quiet,”</i> you grunt, <i>“or I’ll shrink it back down.”</i>");
	output(" The korgonne doesn’t acknowledge you... unless you count lowering her chest and raising her ass another inch, trying to milk more nerve connections from the swollen cock. Her breasts are bulging against their feeble leather bindings, now, and squashed to the point that that they’re visible around the edges of her stocky chest.");

	output("\n\n<i>“Joy... j... fuck...”</i> stammers the woman. Her voice breaks into a cute grunt whenever you piston her pelvis with your faux-cock, becoming more and more a stream of gibberish than coherent speech. The uniform thickness of the cock is playing hell with her pussy - the nerves built to be pressed by a korgonne knot are not only being pressed, but dragged, rubbed, and smeared every which way as the un-tapered prick slides through her. The dog-girl’s eyes roll, and her tongue lolls further from her mouth with every thrust, until it’s a foot-long ribbon of limp, blue putty sculpting meaninglessly-abstract shapes against the white snow background.");

	//if has cock (i.e. if entered via ‘cock too small’ criteria) and is not taur, stick a cock in her hairy asshole
	if(buttfux) 
	{
		output("\n\nThe dumbstruck ecstasy of the busty bitch underneath you is a gratifying sight, especially after her mockery - but still, it’s a damn shame that <i>she’s</i> the one getting off most. Your [pc.cockSmallest] throbs in your underwear with every dose of nerve impulse the undies transmit, pinched against the back of the strap-on and ");
		if(pc.cumQ() < 500) output("drooling");
		else output("gushing");
		output(" with pre. The woman’s plump ass taunts you, swaying from side to side and jiggling in your hands; a small, dark blue pucker peeks from between her cheeks every time you slam into her, just below her jaunty spitz tail. The longer you stare at it, the more your desire crystallizes... finally, unable to endure any more, you pull out of the korgonne and come to a rest.");
		output("\n\n<i>“Why stop?”</i> grunts the savage, mazy with endorphins. <i>“Want finish...”</i>");
		output("\n\nYou ignore her whining and reach into your [pc.lowerUndergarment], fishing for your maligned [pc.cockNounSimple " + pc.smallestCockIndex() + "]. When you feel the [pc.cockHead " + pc.smallestCockIndex() + "] in your hand, you pull it free and let it hang over the waistband of your underwear, bobbing merrily above the holographic hard-on. The korgonne shifts uneasily in your hands, and you squeeze harder to quiet her, which makes her purr unbecomingly once more. Lining up with her asshole, you draw back and thrust in again, spearing her gaping pussy on the strap-on and her asshole on your pre-drooling prick.");
		pc.cockChange();
		output("\n\nThe new pressure straightens the korgonne’s back immediately. ");
		if(sThing == "Cat") output("<i>“Ooh... cat aim bad like usual... wrong hole,”</i>");
		else output("<i>“Stranger fuck like cat... wrong hole,”</i>");
		output(" she snarks. Despite her sass, she pushes back against you eagerly, and her tight pucker wraps around your prick like melting velvet as you resume thrusting once again.");
	}
	output("\n\nSawing into the lusty savage, you make sure each stroke goes as deeply as possible to maximize the drag on her ultra-sensitized ring of nerves. The korgonne, for her part, tries to resist you, clamping down on your holo with her vaginal muscles, but she’s defeated by her own libido - her pussy gushes lubrication, thoroughly dousing your underwear with an intoxicating mint aroma. The pheromones begin to make you light-headed; your strokes feel far away and the korgonne’s plush ass jiggles hypnotically, to the point that ");
	if(buttfux) output("if your cock weren’t about to pop from the pleasure of her tight asshole ");
	output("you’d keep fucking her forever just to watch that hypnotic shake.");

	output("\n\nThe korgonne, however, has no such endurance in her. A howl erupts from the lusty bitch as she climaxes, and she pushes hard off of the ground, trying to hilt herself on the dildo so forcefully that she almost knocks you down. You can feel vise-like muscles tightening and pulling on the hardlight; the projector’s hum deepens and your underwear are ");
	if(silly) output("wedgied right into your buttcrack");
	else output("tugged forward insistently");
	output(" as her pussy tries to drink cum that’s not coming.");

	//if has cock
	if(buttfux) 
	{
		output("\n\nHer asshole is spasming too, writhing and washing over your cock with folds of warm flesh like a storming ocean. All the cum her pussy isn’t getting spurts from you, ");
		if(pc.cumQ() < 15) output("drooling into her pucker a few drops at a time, pinched off by her tense squeezing and barely able to escape.");
		else output("backing up against her tight-squeezed pucker, pinched off inside your urethra until the pressure of your load is too much to contain. An extra-large, stored-up load of [pc.cum] forces its way down your cock, squeezing through the korgonne’s gate to burst inside her.");
		if(pc.cumQ() >= 15000) output(" The puppy-slut’s back arches as you dump spurt after spurt, distending her fuzzy belly until it pushes against the bottoms of her heavy breasts and pops them right out of the top of their flimsy restraints.");
		//end ‘has cock’ insert
	}
	else
	{
		output("\n\nYou try to ignore the incredible pleasure coursing through your body, passed on by the phantom phallus, but there’s too much. The dog-slut’s pussy feels too tight. The fake cock feels too good - better than it has any reason to. You take a moment to mentally compliment the scientists who built this thing, and then forget all about it once your [pc.hips] start bucking with orgasmic bliss. Pleasure bursts up through your spinal cord and into your brain, distracting your conscious mind with a wall of heavenly ecstasy. Meanwhile, your body fucks the slobbery strumpet like a jackhammer, pounding your way through an orgasm, one alien-plowing thrust at a time.");
	}
	output("\n\nWith a single button press, you disperse the hardlight projection and the korgonne ");
	if(buttfux) output("slides off your dick and ");
	output("falls flat on the ground.");

	output("\n\n<i>“What... knot gone... seed leak...”</i> she mumbles, half-asleep from her mind-melting orgasm. You collect your things and leave her there");
	if(buttfux)
	{
		output(", drooling [pc.cumNoun] from her asshole all over her thighs");
		enemy.loadInAss(pc);
	}
	output(".");

	//pass time, if has cock and is not taur then do pc orgasm, else raise lust
	processTime(40);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}