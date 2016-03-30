public function showSydianFemale():void
{
	showName("FIGHT:\nSYDIAN FEMALE");
	showBust("SYDIAN_FEMALE");
	author("Zeikfried");
}

public function encounterFemaleSydian():void
{
	var tEnemy:SydianFemale = new SydianFemale();

	if (flags["MET SYDIAN FEMALE"] == undefined)
	{
		flags["MET SYDIAN FEMALE"] = 1;

		output("\n\nHisses and scratches follow you at a distance as you pick your way through the junk, but nothing is moving when you look except your dust. The noises return when you try to press on... there’s <i>something</i> out here. Unable to find it in the irregular garbagescape, you become paranoid....");
		
		output("\n\n");
		if (pc.isBimbo()) output("<i>“Like, this isn’t fair!”</i>");
		else if (pc.isBro()) output("<i>“You wanna go?!”</i>");
		else if (pc.isNice()) output("<i>“Who’s there?”</i>");
		else output("<i>“Show yourself!”</i>");
		output(" you cry out.");
		
		output("\n\nA face pokes up from behind a pile, waving two fuzzy antennae. Despite a fetching brush of " + tEnemy.hairColour + " hair, the multi-faceted "+ tEnemy.eyeColor +" eyes and segmented covering give the creature an insectoid, alien appearance. The impression doesn’t go away when it skitters over the pile like a cockroach - though the slim waist and wide hips hint strongly that this is");
		if (flags["MET_MALE_SYDIAN"] != undefined) output(" a female sydian.");
		else output(" the female of whatever it is.");
		
		output("\n\nYour codex beeps out a " + (CodexManager.hasViewedEntry("Sydians") ? "confirmation" : "warning") +": sydian. <i>“Enzymes in the body covering catalyze rapid oxidization of most metals. Skin contact causes mild arousal in 99.8% of reported cases. Females are capable of greater enzyme production than males. Engagement at a distance is recommended.”</i> The strange woman smiles.");
		
		output("\n\n<i>“It speaks,”</i> she says. <i>“But does it have the sense to give me what I want?”</i> She pushes herself upright and you glimpse a flash of orange. Instead of taking a hostile stance, she waggles her hips, lashing her long, brushed tail. <i>“I don’t mind persuading, if you’re wavering.”</i>");
		
		output("\n\nThe sandy sizzle and visible corruption under her clawed feet suggest that resistance is in your financial interest!");
	}
	else
	{
		flags["MET SYDIAN FEMALE"]++;

		output("\n\nA hiss and scuttle follows you again. You pick up a hefty chunk of metal and throw it hard at the sound; it impacts with an echoing");
		if (rand(pc.aim() + pc.reflexes()) > rand(tEnemy.aim() + tEnemy.reflexes()))
		{
			output(" 'thwack'");
			tEnemy.shieldsRaw -= rand(5) + 1;
		}
		else output(" ‘clank’");
		output(". A female sydian reveals herself, bemused.");

		output("\n\n<i>“How rude,”</i> the woman says. She skitters toward you, and you prepare for the fight!");
	}
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(tEnemy);
	CombatManager.victoryScene(sydianFemalePCVictory);
	CombatManager.lossScene(sydianFemalePCLoss);
	CombatManager.beginCombat();
}

public function sydianFemalePCVictory():void
{
	clearOutput();
	showSydianFemale();

	//shared intro
	if (enemy.HP() <= 0)
	{
		if (!enemy.hasStatusEffect("Unarmored") output("The sydian coughs and collapses, unable to fight further and unable to flee.");
		else output("Despite the beating, the sydian still tries to cover her exposed skin with her arms and legs from her new position on the ground.");
	}
	else
	{
		if (!enemy.hasStatusEffect("Unarmored")) output("Falling to her knees, the sydian frigs her cunt and thrusts her chest toward you brazenly. The flash in her eyes almost dares you to take advantage.");
		else output("The sydian eyes you from her new position on the ground, half-covering and half-caressing her skin through the ruins of her covering. Intense lust and fear are evident in her face.");
	}
	
	clearMenu();

	if (pc.lust() <= 33)
	{
		output("\n\nYou’re not aroused enough to take advantage of her, though.");

		addDisabledButton(0, "Fuck Her");
		addDisabledButton(1, "Get Licked");
		addDisabledButton(2, "Give Throbb");
	}
	else
	{
		output("You could use her to get off");
		if (enemy.hasStatusEffect("Unarmored"))
		{
			output(", though it might be fun to surprise her by being gentle, or to turn her over to her people in her humiliated state.");
		}
		else
		{
			output(" or just leave her here.");
			if (pc.hasItem(new Throbb()) output(" There’s an item you’re carrying that might adjust her bad attitude, too.");
		}

		if (!pc.hasCock()) addDisabledButton(0, "Fuck Her", "Fuck Her", "You don't have a wiener!");
		else if (pc.cockThatFits(enemy.vaginalCapacity()) == -1) addDisabledButton(0, "Fuck Her", "Fuck Her", "Your wiener is too big! It's a jumbo wiener!");
		else if (pc.thinnestCockThickness() > 4 && !enemy.hasStatusEffect("Unarmored")) addDisabledButton(0, "Fuck Her", "Fuck Her", "You could fit your wiener inside if her body armor weren't in the way...");
		else addButton(0, "Fuck Her", femSydianFuck, undefined, "Fuck Her", "Stick your wiener in it.");

		addButton(1, "Get Licked", femSydianEatsButtholes, undefined, "Get Licked", "Make her service your " + (pc.hasVagina() ? "vagina" : "asshole"));

		if (!pc.hasItem(new Throbb())) addDisabledButton(2, "Give Throb", "Give Throb", "You’re not carrying any Throbb.");
		else if (enemy.hasStatusEffect("Unarmored")) addDisabledButton(2, "Give Throb", "Give Throb", "The broken-armored sydian’s too nervous for you to get a clean stick with the needle.");
		else addButton(2, "Give Throb", femSydianGiveThrob, undefined, "Give Throb", "Jab the cocky bitch with a dose of Throbb and watch her break down and beg.");
	}

	addButton(14, "Leave", CombatManager.genericVictory);
}

public function femSydianGiveThrob():void
{
	clearOutput();
	showSydianFemale();

	output("Concealing the drug, you bring yourself to the sydian’s level. She");
	if (enemy.HP() <= 0) output(" smiles at the abjection");
	else output(" withdraws her hand from her glistening quim");
	output(" and motions you even lower. You kneel and place your palms to the ground, humoring and flattering the alien, and she rewards you by reclining on one elbow to display her sleek body. At the same time, she touches your shoulder, beckoning you closer.");
	
	output("\n\n<i>“Do you like this?”</i> she asks. You nod and allow her to pull you close, face-to-breastplate. <i>“Show me how much...”</i>");
	
	output("\n\nTaking the suggestion, you touch one of the breast cups. She rests her hand atop yours and you squeeze the firm plate, feeling the sydian’s real flesh quiver underneath. A faint heartbeat thumps at your palm. She raises your chin to meet her gaze; her pupils glitter with pride and affection.");

	output("\n\n<i>“Your sense of beauty is very fine");
	if (pc.isFeminine()) output(", especially for a female");
	output(",”</i> the sydian sighs. Her neck trembles when you press your lips close; she swallows hard, and closes her fingers over yours.");
	
	output("\n\n<i>“Mmmyess,”</i> you hum, drawing out your sibilants. Unobserved, the syringe moves into position while you nip her skin with your lips and she shivers. <i>“You’re almost perfect.”</i>");
	
	output("\n\nThe sydian’s larynx bobs under your nose. <i>“Almost...? I’m a work of art,”</i> she clucks. She tilts back to thrust her chest into view again and tries to push your head down as punishment - unfortunately for her, just the distraction you needed.");
	
	output("\n\n<i>“");
	if (pc.isBimbo()) output("Totally");
	else output("Indeed");
	output(".”</i> You punctuate by jabbing the needle under her pelvic plate and squeezing the plunger; she sits up in shock, and as the chemicals begin their redecorative rampage, her eyes widen.");

	output("\n\n<i>“Ugh,”</i> she grunts, swatting the syringe away. It shatters into a starburst of glass. <i>“What was that?”</i>");
	
	if (pc.isBimbo() || (pc.isBro() && !pc.hasCock()))
	{
		output("\n\n");
		output("<i>“Just");
		if (pc.isBimbo()) output(", like,");
		output(" adding the best bit,”</i> you");
		if (pc.isBimbo()) output(" giggle");
		else output("laugh");
		output(".");
	}
	else if (pc.isNice()) output("<i>“Completing the picture,”</i> you soothe, kissing her plated collarbone.");
	else output("<i>“Vandalism,”</i> you mumble, biting her playfully.");
	output(" Two fingers in her");
	if (enemy.lust() >= enemy.lustMax()) output(" sopping");
	output(" pussy distract her again - teasing the rim, you feel the surging temperature that heralds sudden growth. She squirms in your hands, unable to recover her composure in your intense stare.");
	
	output("\n\n<i>“Nnnn...”</i> she groans, <i>“... it’s hot!”</i> Even her neck begins to burn with racing blood, pulsing against your lips. You slide your fingers in deeper and kiss the woman’s inflamed skin, watching her measured, dominating persona crumble away.");

	output("\n\nThe sydian’s hips begin to tremble as pressure mounts. <i>“What the fuck did you do?”</i> she shrieks, pulling away from your fingers. Her pelvis pounds the air, hammering and writhing, and tears well up in her eyes. The sydian’s crotch-plate smokes like an unlubricated sex droid as she rakes it with her fingers, producing puffs of dried mud. With huge effort she pries the thin covering up, snapping it in half with a ceramic noise and hurling it away in a fit. With it gone, you can see her true skin.");
	
	output("\n\nThe location of the stick is a throbbing, reddish-orange welt, raised high on a pale delta; her fingers continue to scrape so furiously that you’re obliged to grab her wrists just to stop her drawing blood. Body heat seeps into your palms as she twists and jerks, trying to pull away, and her breaths hitch in short gasps. <i>“Ah... ah... ah... my body....”</i>");
	
	output("\n\nWith her hands restrained, the growth stalls until you touch your own finger to the tip. The teary sydian jerks and two inches of suppressed growth slide free. Inches blossom from from the mound, while the alien woman writhes in incomprehensible, foreign pleasure that will become very familiar before you’re finished with her. A slit opens as the orange growth tops half a foot, bubbling with proto-cum. Ministering to the new flesh, you tease her cock out to eight hefty inches, and little nodules with the beginnings of soft bristles develop along the crown. Her male lubrication increases to a rivulet, and streams over your hand.");

	output("\n\n<i>“What’s... happening?”</i> the sydian gasps, drawn so tight that she’s unable to breathe. The base of her new penis is still swollen and hot, promising more change. You release the slimy crown and rub the base - something is shifting under the skin. A weight drops into your palm, then another, descending until your hand is full of two heavy, sperm-stocked balls. <i>“It’s... nnn...”</i>");
	
	output("\n\nNo sooner has it filled than her new scrotum tightens up again, twitching to deliver sperm. Whining, the new herm loses her rigid tension in a prolonged spasm, and a blob of silvery cum erupts from her cock to lance the air and fall back onto the spurting tool. She sobs and moans through her coronation orgasm, bewildered by new sensations as jizz puddles in her crotch.");
	
	output("\n\nThe girl stares mutely at the veiny, orange prick dribbling globs of virgin cum, hands hovering nearby but afraid to touch. You give her some time to find her own courage but, when she’s still paralyzed after a minute, sweep up her hand in your own and guide it to the shaft. She shivers as you wrap her fingers, and yours, around it, squishing hot cum between them.");

	enemy.cocks.push(new CockClass());
	var c:CockClass = enemy.cocks[0];
	c.cLengthRaw = 6;
	c.cThicknessRatioRaw = 1.5;

	//vag-anal branch - mandatory for F/U, preferred (80-85%) if H or if M and player has selected female gender pronouns or has all cocks too large
	//preg chance for vag PC

	if (!pc.hasCock() || (rand(100) <= 85 && pc.hasStatusEffect("Force Fem Gender")) || pc.cockThatFits(enemy.vaginalCapacity) == -1)
	{
		output("\n\n<i>“What is this? My beautiful body...”</i> the sydian whimpers, in a tiny voice.");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“Like, you should try putting it in a hot little");
			if (pc.hasVagina()) output(" pussy");
			else output(" ass");
			output(" before you judge,”</i> you flirt,");
		}
		else
		{
			output("“<i>Nice, isn’t it? It’s even better if you put it in");
			if (pc.isFeminine()) output(" a woman");
			else output(" someone");
			output(",”</i> you rejoin,");
		}

		output(" dragging her cum-slicked hand to the tip and thumbing the crown. She sits up, and her flagging prick surges.");
		if (pc.isBimbo()) output(" <i>“When you shove it deep and shoot your little spermies, it’s the best,”</i>");
		else if (pc.isBro() || pc.isAss()) output(" <i>“Jamming it in and blowing a huge load... fucking nice,”</i>");
		else output(" <i>“Making love and finishing inside your partner is incredible,”</i>");
		output(" you");
		if (pc.hasCock()) output(" continue.");
		else output(" guess, trying to cajole her.");

		output("\n\n<i>“Yes...”</i> she says, face alight. <i>“I want to try... you have to let me inside! Please, I want to feel it!”</i>");
		
		output("\n\n<i>“");
		if (pc.isBimbo() || pc.isBro()) output("You gotta, like, be more");
		else output("Be");
		output(" romantic,”</i> you chide. <i>“Tell me how");
		if (pc.isFeminine()) output(" cute");
		else output(" good");
		output(" I look.”</i>");
		
		output("\n\nThe sydian leans forward");
		if (!pc.isTaur()) output(" and moves atop you");
		output(", reversing your positions. <i>“You do! Incredibly... you’re the most beautiful thing! Please, I beg of you.”</i>");
		
		output("\n\nThe woman’s horny honesty sends a tingle through you");
		if (!pc.isTaur())
		{
			output(" - or perhaps it’s the hot, cum-and-chemical-laden hand she’s slipped into your");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
			else output(" lap");
		}
		output(". Her breaths come so heavy they fog the air, and her eyes search yours for permission. A new trickle of lubrication beads atop her crown, unnecessary and almost unnoticeable among the silver, slick semen. Amused by her total inversion, you nod");
		if (!pc.isNaked()) output(" and begin to strip your [pc.gear]");
		output(". The sydian’s open mouth turns to a smile and she");
		if (pc.isTaur()) output(" circles to your backside, tracing your flank with one thick, slippery finger.");
		else if (pc.hasLowerGarment() || pc.hasArmor()) output(" assists you with the clumsy movements of a too-eager virgin. When she’s exposed your bottom, she forgets the rest and automatically guides her cock into position.");
		else if (pc.isNaked()) output(" immediately positions herself to spear you on her new tool.");
		
		output("\n\n");
		if (pc.hasLegs() && !pc.isTaur() && pc.hasVagina())
		{
			output("You spread your thighs to expose her desire’s object, and watch her eyes become glazy and her cock hard as iron. ");
		}
		output("Her glans bumps your");
		if (pc.hasVagina()) output(" labia");
		else output(" asshole");
		output(", leaving behind a kiss of cum; the sydian’s shoulders tremble from your heat, and her expression of utter concentration is adorable. One push and her cock slides into you, carrying half its last load in with it.");
		if ((pc.hasVagina() && pc.tightestVaginalLooseness() <= 1) || pc.ass.looseness() <= 1) output(" Even slicked by copious cum, she has to fight to hilt her dick in your [pc.vagOrAss]. The girl groans as tight flesh wrings her hard cock, and stops to recover so she doesn’t blow.");
		else if ((pc.hasVagina() && pc.tightestVaginalLooseness() <= 3 || pc.ass.looseness() <= 3) output(" Her cock fits perfectly in your [pc.vagOrAss], and the sydian pauses to savor her first penetration.");
		else
		{
			output(" Your [pc.vagOrAss] is so well-used that she overestimates her force and bumps into your");
			if (pc.isTaur()) output(" rump");
			else output(" chest");
			output(". She meets your eyes and colors, embarrassed but loving the sensations.");
		}
		output(" The spent jizz soaking into her crotch splats against your");
		if (pc.hasVagina()) output(" pussy");
		else output(" butt");
		output(" with a wet smack, smearing you with warmth, and the rest on her penis remains inside, licked off by your");
		if (pc.hasVagina())
		{
			output(" greedy, quavering quim.");
			var v:int = pc.cuntThatFits(enemy.cockVolume(0, true));
			if (v == -1) v = 0;
			pc.cuntChange(v, enemy.cockVolume(0, true), true, true);
		}
		else
		{
			output(" clenching, seizing asshole.");
			pc.buttChange(enemy.cockVolume(0, true), true, true);
		}
		
		output("\n\nWhen the virgin has had enough of reverence, she begins to thrust. Her first pushes are sloppy and free-form, like bad art, until she latches onto your [pc.hips]. Aphrodisiac wicks into your [pc.legFurScales] and when the sydian sees you react, she smiles again. She pulls on one antenna, gathering enzyme for you and leaving a little streak of silver cum behind on the bristles. Your breath catches when the laden hand comes to rest on");
		if (pc.hasVagina()) output(" your [pc.clit]");
		else output(" the small of your back");
		output(", shooting heat up your spine, and hers follows when your [pc.vagOrAss] clamps down from the arousal. Your hips jerk by themselves, pushing back against her cum-lubricated fuck while she shivers and tries to stretch the session. It barely works, and her cute moans go higher and higher as she picks up unintentional speed. Your [pc.vagOrAss] burns with need for release, and her aphrodisiac touch dances along your body, tensing the muscles and bringing you to climax.");
		
		output("\n\n<i>“Oh... yess...”</i> she moans, sawing into you like a senseless rutting beast. The sydian grunts, and something hot touches a deep place in your");
		if (pc.hasVagina()) output(" vagina");
		else output(" rectum");
		output(". Her orgasm is on, and the second stroke dumps into you, a hot tongue of sperm{(vag) pressing for entrance to your womb}. You shudder as three and four baste your insides, picturing the slivery slime spilling from her. The sydian’s eyes roll and her head lolls on her neck, and watching her enjoy you as hot semen pours in sets off your own pleasure. The poor girl practically melts when your climaxing {cunt/hole} attacks her sensitive cock, falling on top of you while the last strokes meander out.");
//female orgasm, reduce lust, put sydian load x2 in PC’s cunt

//cock branch
//pick biggest cock that fits
The girl moans and cum slops down her sensitized cock, the baby-making batter pressed into a makeshift hot lube by your grip; two aftershocks bubble from her twitching slit as her unwilling dick tries to go soft. The sydian shakes and sighs. “Stop... it’s too much...”

Wearing a sick grin, you prepare to show her all-new definitions of ‘too much’. {(bottom clothed and not horse)Your free hand works into your [pc.lowerGarments] and unleashes your [pc.cockNounComplex]/(nude or horse)Your [pc.cockNounComplex] throbs at you}, painfully erect from watching the girl’s growth and first, tear-streaked climax. The sydian, still limp from her ejaculation, only watches -- but when you spread her thighs, she bites her lip in recognition. Her pussy, half-draped in the strings of silver smut that drip down her crotch, quivers...

{(nice or horses)You pause in position, with your [pc.cockHead] close enough to whisper to her cunt, and look into her eyes. She says and does nothing for ten seconds, and then gives the most minute nod, consenting to the onrush of pleasure. With {(no horse)one hand still stroking her throbbing cock to male ecstasy/(horse)a careful thrust to avoid squeezing her balls, you impale her womanhood on {lesser of cock length or ten} inches of your pleasure tool. /(misch/mean and no horse)Your imagination spins to a perverted scenario, and the sydian looks concerned when you stop to gather her spent load. Her eyes widen to saucers when you coat your cock with her cum, making sure it’s slathered with fertile sydian sperm, and she chews her lip in resignation as your silver-smeared crown nudges at her labia. With evil relish, you thrust forward and deliver her own semen to her pussy, giving it a head-start on your building, churning jizz-wave. }

She swears in a strange language as you hilt in her slick, orange vagina, and her elbows dance in the dirt from the back-shaking pleasure{(no horse) you force on her virgin dick. With only one hand free to grip, y/(horse). Y}ou’re obliged to start slowly, sinking your [pc.cockNounSimple] into the hot sex in time with the slippery {(horse)flops/(else)strokes} of her penis, but as the fuck warms up, her flagging tool finally gives up on giving up and gets hard again. The sydian girl’s hand tightens as the pleasure returns, and within a few more thrusts, she’s jerking off{(no horse) faster than you can guide her. You let go and enjoy/(horse) with gusto. Blocked by your own bulky body, you can only imagine} the spectacle of the girl abandoning herself to hermaphro-heaven.

Her pussy seems to ratchet tighter with every stroke up her cock, until your own prick is fit to burst all over her insides. You exercise titanic restraint, trying to fuck her well enough that she’ll never forget the {man/herm} who gave her her first dual orgasm. Judging by the way she writhes like a snake with a pinned tail, she isn’t far off.

“N-no...” she moans, “... cumming soon! Don’t stop!” Her hand is a gray blur on her angry, swollen cock, stroking so hard that pre-cum is flung off the end without the chance to lubricate a damn thing. {(no horse)As you watch, one of the globlets hits her in the face/(horse)Many of the globlets spatter on your belly}; she pays no mind and continues jerking, tickling her urethra with a thumbtip like an experienced masturbator. Your own climax hits you, and you hilt deep in pussy to deliver your seed. The sydian notices, and you can feel her balls tighten with the base of your penis as the anticipation pushes her over her limit. Her pussy begins to quake just as the [pc.cum] climbs your shaft.

{(li’l cum)Your scanty load squirts out with no more energy than a handful of confetti thrown by a bored coworker at an office party. Her own ejaculation makes a better showing, and /(med cum)Your load escapes in several satisfying squirts; the girl flinches as each one touches her pussy. Her prick tries to match you like a synchronized spurting team, and /(big cum)Your load, more like a loaf, stretches your urethra in great gobs, dumping into the poor girl. Her pussy is filled in the first squirt, but cum keeps coming until her plugged hole resembles a cataract of [pc.cumColor] slime. Her own dick, red with shame and friction, }paints three lines of silvery spunk on her stomach and breastplate as her pussy drinks greedily from your genetic tap.

The girl and her new master shudder, releasing days and days of tension from her muscles along with the semen of her immense orgasm. Her hand comes to rest at the base of her cock, and you {(no horse)tickle her balls/(horse)scrape your belly on her frenulum} to bring her back to reality. She laughs{(no horse), and her silvery cum catches the light as her chest shakes}.

{(misch/mean and no horse)Watching her second load cooling on her belly stirs your recent memory. The sydian recognizes the naughty glint in your eye. “Don’t do it...”

You ignore her entreaties and lean down, collecting every drop of her second load and dripping it into your mouth. The sydian covers her eyes with her sticky hands, embarrassed, as you lift her ass up, spread her labia, and drool the salty, metallic cum into her wide-open pussyhole. “Waste not, want not,” you say, jiggling her hips to give the egg-hunting sperm a sporting chance. }
//male orgasm, reduce lust

//merge for ending
She rests quietly with you for a long time before speaking. “That was so strange,” she says. “Um...”

You pull apart from her with a wet, sucking sound{(mean), not really interested in what comes after ‘um’). {(not mean)”Yeah?”}

The sydian thinks for a moment. “Nevermind...” she eventually says. You look into her eyes; she’s uneasy. “It’s fine. I’ll figure something out.” She leans forward and kisses you a final time, then bids you goodbye.

You watch her satisfied hip-sway as she goes, thinking it might be a good idea to stock up on Throbb.
//end; orgasms and loads as specified in branches
}


public function femSydianEatsButtholes():void
{
	clearOutput();
	showSydianFemale();

	if (pc.hasCock())
	{
		output("Despite her debasement, the woman eyes your [pc.cocksLight] with interest once your [pc.gear] is out of the way. Her thighs even spread, exposing her orange-hued slit, but clamp shut again when you");
		if (pc.isTaur()) output(" turn about, displaying your [pc.vagOrAss] instead");
		else if (pc.balls > 0) output(" heft your [pc.balls] out of the way to display your [pc.vagOrAss]");
		else
		{
			output(" brush");
			if (pc.cocks.length == 1) output(" it");
			else output(" them");
			output(" upward, nearly touching your navel as you show off your [pc.vagOrAss]");
		}
		output(".");

		output("\n\n<i>“Hold on, you picked the wrong bit,”</i> she");
		if (!enemy.hasStatusEffect("Unarmored")) output(" teases. <i>“The hole is for boys to play with; girls get the penis.”</i>");
		else output(" panics. <i>“I’m not a male... I can’t give you babies.”</i>");
	}
	else if (pc.isSquirter())
	{
		if (!pc.isNaked()) output("You undress, and s");
		else output("S");
		output("he stares dumbly at your denuded form when you");
		if (pc.isTaur() || (!pc.hasCock() && !pc.hasVagina())) output(" turn and thrust your [pc.vagOrAss] toward her");
		else output(" slip your fingers into your [pc.vagOrAss] and begin to jill off");
		output(", sprinkling her with the obscene flecks of your ever-drooling lubrication.");
		
		output("\n\n<i>“Do you expect me to do something with that?”</i> she sputters, holding up a hand to fend off your spray.");
		if (!enemy.hasStatusEffect("Unarmored")) output("<i>“You do understand the difference between men and women, right?”</i>");
		else output("<i>“I can’t please you... I’m a female.”</i>");
	}
	else
	{
		output("Your [pc.gear] drops into a pile as you prepare to take advantage of the woman. She perks up as you");
		if (pc.isTaur()) output(" display");
		else output(" stroke");
		output(" your [pc.vagOrAss], curiosity piqued.");

		if (pc.hasVagina() && !pc.hasCock())
		{
			output("\n\n<i>“It looks like mine,”</i> she giggles, raising a finger. [pc.OneClitoris] trembles at her chemically-enhanced touch.");
			if (pc.vaginas[0].type != GLOBAL.TYPE_HUMAN && pc.vaginas[0].type != GLOBAL.TYPE_SYDIAN) output(" <i>“Kind of...”</i>");
			else if (pc.vaginas[0].color != "orange") output("<i>“Wrong color...”</i>");
		}
	}

	output("\n\n<i>“Lick");
	if (pc.isBimbo()) output(" my hot hole,”</i>");
	else if (pc.isNice()) output(", please,”</i>");
	else output(",”</i>");
	output(" you insist. <i>“And use your fingers.”</i>");

	output("\n\nThe sydian looks surprised, as if the thought had never occurred to her. She");
	if (pc.isTaur()) output(" curls under you");
	else output(" scoots up to your crotch");
	output(" and begins to caress your entrance. The enzymes in her hands heat your skin, making your");
	if (pc.hasKnees()) output(" knees weak");
	else output(" back quiver");
	output(" with the promise of a really good orgasm. A wet object slides into you, and the chemical passion intensifies - she must have coated the inside of her mouth in the stuff!");
	
	output("\n\n");
	if (!enemy.hasStatusEffect("Unarmored")) output("<i>“You like that?”</i> she asks, breath hot on your sex.");
	else output("<i>“Is this good?”</i> she asks, meek wisps of breath tickling your sex.");
	output(" You implore her to continue, and her smile breaks briefly before parting to reveal that evil tongue again. A gasp escapes from you as she slides it back in. Her");
	if (pc.isTaur()) output(" tail brushes");
	else output(" antennae brush");
	output(" against your [pc.belly], and without thinking you grab and rub");
	if (pc.isTaur()) output(" it");
	else output(" them");
	output(" against your [pc.nipples]. She sighs, and her free hand darts between her thighs.");
	
	if (pc.isAss())
	{
		output("\n\nHer enzymes are heavenly, but her technique doesn’t warrant any pride at all. <i>“Without your chemicals, you’d never please a man,”</i> you berate. The sydian keeps going, but looks up with smoldering eyes that fill you with cruel supremacy. You pull her");
		if (pc.isTaur()) output(" tail");
		else output(" antenna");
		output(" until she winces and bark, <i>“Stop playing with yourself - you haven’t earned it.”</i>");
	
		output("\n\nShe removes her hand from her crotch, exposing a fully-bloomed pussy that twitches from sudden neglect. You glare at her, and she realizes she needs to say something. <i>“Yes... my superior,”</i> she mumbles.");
	}

	output("Her other hand continues to caress, leaving greasy-feeling strokes of heat all around your hole.");
	if (pc.hasVagina())
	{
		output(" [pc.EachVagina]");
		if (pc.vaginas.length > 1) output(" burns with aphrodisiacs - what she lacks in talent, she makes up in thoroughness, fingering every hole she finds.");
		else output(" throbs without stopping, heated by the enzyme smeared on your [pc.clitoris].");

		if (pc.isSquirter())
		{
			output("Your [pc.girlCum] drips down your lover’s chin and");
			if (!enemy.hasStatusEffect("Unarmored")) output(" over the clefts in her body armor to tickle her cunt, clearly turning her on.");
			else output(" mingles with the dusty remnants of her covering, turning to a clumpy mess that sticks to her breasts.");
		}
	}
	else output(" Your [pc.asshole] is covered in oily love by the secret ass freak. ");
	

	output("\n\n<i>“Unghh,”</i> you moan, driven close to climax by the irresistible enzyme. A few licks locate sweet spots as the alien picks up technique and speed - she knows enough to");
	if (pc.hasVagina())
	{
		output(" envelop your [pc.clitoris] in her tongue’s hot folds often, working the [pc.cuntColor]");
		if (pc.clitLength < 2) output(" nub");
		else output(" rod");
		output(" with her oily muscle.");
	}
	else output(" keep her tongue circling to continually apply more enzyme.");
	if (!pc.isTaur()) output(" You grab her head in your hands, mashing her face into your hole every time she does something right and hoping she’ll take the hints.");
	output(" Her");
	if (pc.isTaur()) output(" tail twitches");
	else output(" antennae twitch");
	output(" against your chest, finding");
	if (pc.hasNippleCocks()) output(" the tips of your [pc.nippleCocks]");
	else if (pc.hasFuckableNipples())
	{
		if (pc.isTaur()) output(" its");
		else output(" their");
		output(" way into your [pc.nipples]");
	}
	else
	{
		output(" your");
		if (!pc.nippleType == GLOBAL.NIPPLE_TYPE_FLAT) output(" erect");
		output(" [pc.nipples]");
	}
	if (pc.hasNippleCocks() || pc.isLactating())
	{
		output(" and stimulating a trickle of [pc.milk] that falls");
		if (pc.isTaur()) output(" onto her stomach");
		else output(" into her hair");
	}
	output(".");

	output("\n\n<i>“Come for me");
	if (pc.isAss()) output(", my superior");
	output(",”</i> the woman hums, mouthing the words into your [pc.vagOrAss]. She looks up, then pulls at her antenna, gathering a huge dose of enzyme. You can feel the heat radiating from her fingers before she even touches you, and when she slides them in, your [pc.leg] buckles in a tiny earthquake.");
	
	output("\n\nYou twitch and shake, clenching with fits of climax. Swells of joy are pushed through your sex by aphrodisiac radiating from her fingertips, shooting through your limbs until you tingle all over.");
	if (pc.isSquirter())
	{
		output(" Your [pc.girlCum], already glistening on your lover’s face, fills her mouth in a spurt and sputter.");
		if (!pc.isTaur()) output(" Stuck to your opening by your unyielding arms, she swallows and swallows, drinking from you as liquid love streams down her chin.");
	}
	
	output("\n\nWhen your climax releases you, you slump into a pile");
	if (pc.isTaur()) output(" and the poor woman just barely skitters out from under");
	output(". The sydian looks over your satisfied shape. <i>“Must try that...”</i> she mumbles");
	if (pc.hasVagina()) output(", licking your [pc.girlCumFlavor] fluids from her lips");
	output(". She sits until you wave her away, then leaves you to re-equip with a wistful glance.");

	processTime(30+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", CombatManager.genericVictory);
}

public function femSydianFuck():void
{
	clearOutput();
	showSydianFemale();

	var cockIdx:int = (enemy.hasStatusEffect("Unarmored") ? pc.cockThatFits(4, "thickness") : pc.cockThatFits(enemy.vaginalCapacity));
	var asTailcock:Boolean = false; // 9999 This is going to require further science, urgh

	output("You push her shoulders to the ground, eyeing the "+ (enemy.hasStatusEffect("Unarmored") ? "crumbling chips that remain of her destroyed bodywork" : "detailed plating of her breasts and stomach") +". The sydian clucks at you.");
	
	if (!enemy.hasStatusEffect("Unarmored") output("\n\n<i>“What’s wrong, never seen a pretty girl before?”</i>");
	else output("\n\n<i>“What? Are you going to stare forever?”</i>");
	
	output("\n\nShe "+ (enemy.hasStatusEffect("Unarmored") ? "covers her chest" : "displays openly") +" while you set aside your [pc.gear], glaring the whole time. Paying little mind, you push her legs apart");
	if (pc.isTaur()) output(" with yours");
	output(". The show of naked force is turning her on despite her attitude; her pussy blooms slightly, a tiny window of orange.");
	if (asTailcock) output(" Your [pc.tailCock] slides free, drooling in anticipation.");
	
	output("\n\n");
	if (pc.isTaur())
	{
		output("You squat down until level with the sydian woman, rubbing");
		if (!asTailcock) output(" your [pc.cockHead "+cockIdx+"]");
		else output(" the lewd, slimy crown of your tail-cock");
		output(" against her vulva.");
	}
	else if (pc.legCount <= 1 || pc.isNaga())
	{
		output("You fall onto the woman, kissing her breast greedily, and your [pc.leg] wraps around one hard, armored leg, tingling wherever you touch the exoskeleton. Your");
		if (!asTailcock) output(" [pc.cockHead "+cockIdx+"]");
		else output(" perverted, sexual tail");
		output(" presses on her slit, and the woman’s sneer disappears.");
	}
	else
	{
		output("You lower yourself and lift her ass with your hands");
		//{(bare hands), savoring the tingle of pleasure on your palms}. 
		output(" Lining your");
		if (!asTailcock) output(" [pc.cock "+cockIdx+"]");
		else output(" [pc.tail]");
		output(" up, you nudge the woman’s vulva.");
	}
	output("She looks away coyly, and the bloom of warmth you feel when her pussy opens wider suggests that she’s enjoying your touch while she awaits your next move.");
	
	output("\n\n");
	if (!enemy.hasStatusEffect("Unarmored")) output("<i>“Well... hurry up!”</i> she barks.");
	else output("<i>“Ah... dangerous,”</i> she whimpers, trembling at the touch of your breath.");
	output(" Her thighs spread even further, encouraging your dominant, seemingly-uncaring demeanor.");
	if (!enemy.hasStatusEffect("Unarmored")) output("<i>“Is this is your first time with a female or something?”</i>");
	else output("<i>“What’s wrong? Are you nervous?”</i> she asks, cautiously.");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“No... well, that’s...”</i> you mumble, before trailing off.");
	else if (pc.isMischievous()) output("<i>“Like I’d admit it,”</i> you sass, grinning.");
	else output("<i>“Find out, slut,”</i> you command.");
	output(" The sydian’s reply is transformed into a grunt as you thrust forward, impaling her pussy on your");
	if (asTailcock) output(" tailcock");
	else output(" cock."); //{greater of cock length or 24} inches.");

	//Cockcchange check (whatever the fuck this is)
	if (!asTailcock) pc.cockChange(true, false);

	output("\n\n<i>“Nnnn,”</i> she groans, <i>“");
	if (!asTailcock && pc.cocks[cockIdx].cLength() < 6)
	{
		if (!enemy.hasStatusEffect("Unarmored")) output("It’s so tiny... Come on, little dick, fuck");
		else output("It’s so small... but it’s so hot. Fill");
	}
	else if (pc.cocks[cockIdx].cLength() > 56) output("So full... fuck");
	else output("Fuck");
	output(" me!”</i> Her hands wrap around you, depositing flares of chemical that agitate your blood.");
	if (!pc.isTaur())
	{
		output(" You grope her breast,");
		if (enemy.hasStatusEffect("Unarmored")) output(" rubbing her exposed nipple through ruined body paint,");
		else output(" squeezing until the body paint cracks,");
		output(" and watch her head roll from the pleasure.");
	}
	output(" Your shaft responds by stiffening even more, and the sydian’s eyes implore you not to tease. Unwilling to wait, you begin to pump.");
	
	output("\n\n<i>“That’s it, powerful male!”</i> she moans, <i>“More!”</i> You oblige and increase your pace, thrusting until the sydian’s pussy becomes frothy with beaded lubrication.");
	if (!pc.isTaur()) output(" Her legs wrap around your back, drawing two thick rays of pleasure on your [pc.ass].");
	output(" A hand slinks between you to tweak her clitoris, and the plates on her back click as she arches and writhes in ecstasy. Without warning, the same hand dives into your groin,");
	if (pc.balls > 0) output(" caressing your [pc.sack] with hot, slippery fingers");
	else if (!asTailcock && pc.hasKnot(cockIdx)) output(" gripping the [pc.knot "+cockIdx+"]");
	output(" and turning it into a ball of chemical lust. You hit your limit suddenly, and the sydian’s pussy twitches when she feels the first stroke of [pc.cum].");
	
	output("\n\n<i>“Yes... do it inside! I want strong children!”</i> she exclaims, slamming her hips into you.");
	if (pc.cumQ() <= 1500)
	{
		output(" She wrings you, clings to you, until you shoot every last string.");
		if (pc.cumQ() <= 150) output(" With how little your [pc.balls] produce, you doubt very much that she’ll get her wish.");
	}
	else
	{
		output(" The sydian grunts in surprise as your load fills her to capacity and begins to back-flow.");
		if (!asTailcock && pc.hasKnot(cockIdx))
		{
			output(" Her enthusiasm turns to discomfort when your knot prevents a single drop from spilling out.");
			if (enemy.hasStatusEffect("Unarmored")) output(" Without an escape, the seed distends her womb, rounding her belly until it can grow no larger.");
			else output(" Without an escape, the seed strains at her womb; as the pressure mounts, a terrible cacophony of tiny cracking sounds fills the air and her body paint fractures, freeing her belly to expand.");
		}
		else
		{
			output(" Despite writhing, grasping and squeezing her thighs around you, she has no way to keep it all inside, and it drools over her ass and onto the ground.");
		}
	}
	output(" You rest atop the woman for a few minutes,");
	if (!pc.isTaur()) output(" enjoying the ticklish feeling as she cradles your head,");
	output(" and then pull out. The sydian surprises you with a kiss");
	if (pc.cumQ() > 150) output(", and you think you see gratitude in her eyes");
	output(".");
	
	output("\n\n<i>“My powerful male,”</i> she mumbles again, intoxicated by your presence.");
	if (pc.isNice()) output(" Taken slightly aback,");
	else output(" Brimming with confidence,");
	output(" you collect your stuff and leave her there, stroking her belly.");
	
	//end; reduce lust, pass time
	processTime(30+rand(15))
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", CombatManager.genericVictory);
}