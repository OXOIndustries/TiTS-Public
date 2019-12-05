public function extrameetKaedeDate():void
{
	if (flags["EM_KAEDE_DATE"] == undefined)
	{
		extrameetKaedeFirstTime();
	}
	else
	{
		extrameetKaedeRepeat();
	}
}

public function extrameetKaedeRepeat():void
{
	clearOutput();
	showKaede();

	output("A few minutes after you tap Kaede’s profile and send a request through it, you receive your reply in the form of a smiley-face and an address on-station. It looks like Kaede’s around and ready to have some fun! You do a quick search for where the ginger puppyslut’s sending you and set off in search of your date...");

	switch(rand(5))
	{
		case 0:
		default:
			output("\n\nYou end up meeting Kaede outside a small arcade wedged between a Martian pub and a small office park, down a few decks from the main shopping concourse you usually frequent. Your date’s already inside by the time you get there, wearing a big, awkward VR headset that looks 100 years out of date and waving around a hardlight wand at some evil necro-ausar wizards on her screen. It’s all too easy to sneak up on her while she’s distracted by the game, grabbing two handfuls of pert puppyslut booty. She yelps and flails, bonking her head on the inside of the helmet hard enough to kill her character in a conflagration of spectral fire.");

			output("\n\n<i>“Oof,”</i> she groans, reeling out of her helmet and into your arms. <i>“Hey, [pc.name]! There goes my high score hopes... your turn!”</i>");

			output("\n\nYou get a quick intro to the retra spell-’em-up <i>Tower of the Mummy Witch</i> while Kaede straps you in and hooks a holographic projector to your wrist. All you gotta do is match the arcane symbols on screen before the mummy witch’s goons get to you, wave after wave. And every time you fail, you gotta put more credits in. Simple enough.");

			var aimQ:Number = pc.AQ();
			if (aimQ >= 90) output("\n\nYou easily weave your wand across the screen as hordes of anubians and undead assault your scantily-clad sorceress-slash-archaeologist, blasting foes to kingdom come with ease. By the time you reach the final level and shove your staff up the mummy’s ass, Kaede’s jaw is practically on the floor and your name is forever etched on the high score board.");
			else if (aimQ >= 65) output("\n\nYou make it look easy, weaving your wand across the screen as hordes of anubians and undead assault your scantily-clad sorceress-slash-archaeologist. You miss a few sigils here and there, but it only burns a few of your credits before you manage to beat the titular witch.");
			else if (aimQ >= 35) output("\n\nYou gotta say, this game’s pretty hard! Your wand doesn’t want to really respond the way you want, and your scantily-clad sorceress-slash-archaeologist gets herself mauled by golden anubians and undead monsters left and right. By the time you give up, Kaede’s grinning - she’s still got a higher score than you, at least.");
			else output(" At least, you think so. What the fuck’s with this game, though? You keep waving your wand like it tells you, but it barely registers your input at all. No wonder this never got a sequel! You’re forced to watch with a huff as your scantily-clad sorceress-slash-archaeologist gets herself mauled by golden anubians and undead monsters left and right. By the time you give up, Kaede’s snickering beside you as a huge falcon-man rips the mage’s face off with a shriek. <i>“Oh, wow, you suck!”</i>");

			output("\n\nAfter it’s all said and done, Kaede’s all grins as she takes her turn on another few games, each more esoteric than the last, which she’s happy to nerd out about in great detail. You’re happy to follow her around and try the sampling, squeezing through the narrow paths between machines. Everything’s delightfully retro, from the Ausaril thrash-metal music to the holo-projector cabinets, and every new game you get to keeps Kaede’s tail wagging hard behind her... and every time you agree to play something, Kaede’s arms wrap around you, and you feel her slender little body pressed against yours as she watches over your shoulder.");
			break;

		case 1:
			output("\n\nYou find Kaede nestled into a booth at the very back of a little East Terran restaurant down by the docks - just a stone’s throw from her pop’s shop, she says, as you scoot in and take a menu from a cute waitress in a form-hugging pink dress.");
			
			output("\n\n<i>“I think my dad’s family was from this part of the world,”</i> she muses, sucking cola noisily up a straw. <i>“You know, like a thousand years ago. I wonder what Earth’s really like now... I’ve never been anywhere near Sol, and I can’t imagine the holos really do it justice.”</i>");
			
			output("\n\nAfter placing your own order, you wonder aloud if she’s really that interested in her human heritage. She’s always seemed to favor her ausar side farm more than her human one. The accusation makes her ears go flat, and she stops slurping for a thoughtful moment.");
			
			output("\n\n<i>“I... I guess, yeah. It makes sense, though, doesn’t it? I went to ausar schools, most of my friends have always been ausar... I lost my v-card to an ausar. They’ve always been a bigger part of my life than humans were. I guess I never really thought about it before is all.”</i>");
			
			output("\n\nThe waitress brings your food a short while later, distracting you both from such heavy topics. Kaede’s mind inevitably wanders back to her business, to the excitement and the adventure of flying through Rush Space. That, at least, is a topic you can relate to wholeheartedly, leading you down a rabbit hole of conversation that lasts until you’ve both cleared your plates and knocked back plenty of wine.");
			break;

		case 2:
			output("\n\nYou meet Kaede outside a cute little club down by the merchant docks. It’s already hopping, with a heavy bass beat thumping straight out through the doors as columns of scantily-clad twenty-somethings like you pour in and out. She greets you with a kiss and takes your arm, guiding you through the doors and into the sultry dark dance floor. A DJ in an exaggerated mouse-head helmet is cranking a massive rack of synthesizers, propelling men and women from dozens of worlds to jump and sway to the beat.");
			
			output("\n\nThis doesn’t seem like Kaede’s kind of place, but she’s surprisingly confident in her movements. You let her take the lead for once, putting her hands on your [pc.hips] and pulling you close. You can’t talk over the pounding bass, and the dense crowd pushes you so close together that you can’t help but grind on each other. Before long you’re feeling Kaede’s bulge through her jeans, rubbing on your [pc.leg] with every shimmey of her hips.");
			
			output("\n\nWho cares about the dance when you’ve got this cutie all up on you, getting harder with ever song the DJ meanders through. It’d almost be perfect, if Kaede’s poor fluffy tail wasn’t constantly getting stepped on by careless drunks. At least you aren’t getting on each others’ feet. You casually take point from her as the puppy-slut’s arousal gets too much for her, pressing your own body so tight against hers that you can feel her cock pulsing through her pants, the veiny knot swelling so much that anybody in the club could see it if they looked.");
			break;

		case 3:
			output("\n\nThis time, Kaede bids you meet her at a holoplex a couple decks above Ilaria’s shop, where they’re showing a weekly double feature of classic fantasy movies. She’s already got more popcorn and candy than she can carry by the time you get there, and is instantly all grins and wagging tail when you walk through the door.");
			
			output("\n\n<i>“These are two of my favorites!”</i> she explains as you head through the halls towards your theater. <i>“Tales of courage and honor and <b>romance</b>, full of clashing swords and big-budget CGI spells! Ahhh, I love just losing myself in these.”</i>");
			
			output("\n\nYou find your seats on an otherwise empty row just in time for the last previews to fade out on a big shot of Steph Irson’s shorts-straining ass, before the opening scene of two mud-splattered knights dueling on a rain-slicked bridge begins to play amidst swelling orchestral tunes. The first movie goes by at a steady, predictable pace, clearly setting up for a sequel with the villain escaping at the end and a romance arc between hero and heroine that never quite gets the climax it deserves. The follow-up, though, kicks off with a rapid-fire series of action sequences and magical duels that leave you on the edge of your seat, but shortly after, things calm down as the hero’s finally rescued his love from the clutches of evil, and on the eve of a critical battle, they make love under the moonlight.");
			
			output("\n\nThat scene’s surprisingly <b>spicy</b>; it’s probably what earned it the Age 18 rating more than all the bloody violence before it. Nobody cares about all of that, right? As the saucy she-elf pins her ausar prince to the bed and plants her skirts over his tunic’s hem and starts moving those waifish hips, you hazard a glance down into the seat beside you. Even in the all-concealing darkness of the movie theater, you can see Kaede’s sporting a serious bulge. Her eyes track the elf’s little tits bouncing on screen, and her breath quickens; her nipples stiffen beneath her tanktop in short order, oh so cute and pinchable.");
			
			output("\n\nYou can’t help yourself. Stealthy as can be, you snake your had from around Kaede’s shoulders down into her lap. You find her she-cock straining her jeans, and it’s almost effortless to wiggle her zipper down. Kaede gasps, suddenly cutting her eyes over to you but powerless to stop you lest she make a scene");
			if (flags["KAEDE_EXHIBITIONISM"] >= 30) output("... even if she wanted to. And the way her cock throbs in your hand the moment it spills out of her fly, you know she’s just as excited about the prospect of a covert handy as you are.");
			else output(". Her cock’s still rock-hard when you fish it out of her pants, though, trembling at your touch.");
			
			output("\n\nYou keep your eyes on the screen now, steadily pumping your wrist to the same tempo as the elven witch on screen rides her beau. When the prince reaches up and grabs her tits, Kaede crosses her arms and starts working her own nipples, biting her lips to keep from moaning.");
			
			output("\n\nYou keep going, following the heroes’ pace straight to the she-elf’s corny quip as her gallant price gives her the <i>“marriage knot,”</i> when you reach down to the base and take Kaede’s own bitch-breaker in your fist and squeeze. Your other hand gently guides her bag of popcorn down between her legs, angling her dick into the ready receptacle as she nears her peak, just like the prince must be.");
			
			output("\n\nWhile the movie isn’t quite as explicit about the inevitable end of the sex scene, you’re quite happy to make sure Kaede gets her happy ending. Her legs kick and thrash for a moment, and then you feel her red rocket tense and start to leak. A little squeeze and knead on her knot is enough to seal the deal. You smell more than see the results; a salty musk that spreads over the buttery popcorn between Kaede’s knees, accompanied by the faintest wet sounds over the orchestral surge as a new scene begins.");
			
			output("\n\nBreathing hard, Kaede slumps back against her seat and favors you with a sultry little smirk as she reaches into the bag and stuffs her face with salt-slathered corn.");
			break;
	}

	processTime(15+rand(10));

	clearMenu();
	addButton(0, "Next", extrameetKaedeRepeatII);
}

public function extrameetKaedeRepeatII():void
{
	clearOutput();
	showKaede();

	output("When it’s time to leave, there’s only one next destination on your mind: somewhere where you can get this ginger beauty all to yourself. Her apartment’s not far, a small and spartan affair, with only a few comforts like the two-seat sofa and a cabinet full of holos around the wall-mounted screen to prove that it’s been lived in at all. You’re not here for the scenery, though: you slip your arm around your lover’s slender shoulders, letting the pretty pup nestle in close. Her tail flicks up onto your lap, draping across your crotch and swathing you in fluffy warmth.");
	
	output("\n\nWhen she finishes her drink, Kaede leans her head in against your shoulder, and one of her hands starts creeping its way across your [pc.chest]. You glance a hungry little smile playing across her lips, almost begging you to lean in and kiss them. Who are you to refuse? Cupping her chin in a hand, you bring them up to your [pc.lips] and lean into her, feeling the warmth of Kaede’s sweet breath against you.");
	
	output("\n\nWhen you break the kiss, Kaede pushes forward with uncharacteristic aggression. Her lips lock back against yours, and she swings a leg over to straddle you. You can feel her bulge grind against your [pc.belly], and instinctively your fingers find their way to her jeans’ zipper and start sliding it down. A moment later and there’s a throbbing red rocket rubbing on your stomach as Kaede’s hands desperately claw your [pc.gear] off between tongue-filled smooches.");
	
	output("\n\nThen her tail sweeps across the coffee table, clearing it off with one mighty wag.");
	
	output("\n\n<i>“Oops,”</i> Kaede giggles, biting a lip as her remotes go tumbling. <i>“Guess you better take me to the bedroom before I make more of a mess...”</i>");
	
	output("\n\nSo how’s the going to play out?");

	//[Pound Her] [Blow&Bounce] [Fuck Her Ass] [Rocket Ride]
	//PC can choose Canadia Station scenes (those last two), modified slightly with new intros. All go back to the "End Date" scene at the end.

	clearMenu();
	if (pc.hasCock()) addButton(0, "Pound Her", extrameetKaedePoundHer);
	else addDisabledButton(0, "Pound Her", "Pound Her", "You need a wang-dangle to pound her!");

	addButton(1, "Blow&Bounce", extrameetKaedeBlowNBounce, undefined, "Blow & Bounce", "Actually, you like Kaede right where she is... with her dick out and in your hands.");

	if (pc.hasCock() || pc.hasHardLightAvailable()) addButton(2, "Fuck Her Ass", extrameetKaedeFuckHerAss, undefined, "Fuck Her Ass", "Time to take this pretty puppy to pound-town.");
	addButton(3, "Rocket Ride", extrameetKaedeRocketRide);
}

public function extrameetKaedeRocketRide():void
{
	clearOutput();
	showKaede(true);

	var ppKaede:PregnancyPlaceholder = getKaedePregContainer();

	output("Sounds like a plan.");
	
	output("\n\nYou heft Kaede up, one hand under each cheek of her ass, and carry her to the bedroom. She giggles and squeals, legs wrapping tight around you until you send her sprawling back on the bed and crawl in over her. A hungry grin spreads across your lips when you feel something thick and hot pressing against your [pc.butt], rubbing against your thigh. Slowly, you lean down over Kaede, stretching out so that your [pc.belly] presses against her taut stomach, and your chin comes to rest just past her perky little tits.");
	
	output("\n\n<i>“You’re so "+ pc.mf("handsome", "beautiful") +",”</i> she murmurs, sitting up on her elbows and staring at you with those big, blue eyes of hers. You can’t help but "+ pc.mf("chuckle", "giggle") +", leaning in and planting another kiss on those rosy lips of hers. Your tongue slithers out, slipping through the bridge of your kiss to entwine with her own; all a distraction while one of your hands traces down her tummy and straight down her pants.");
	
	output("\n\nThat sure gets her attention! Kaede gasps, squirming as your fingers tickle the tip of her pecker before wrapping around it, helping the throbbing shaft find its way out of her pants. Something hot and slimey drools onto a finger, just before you pull Kaede’s pants down and fully free her succulent red shaft. It bobbles and wobbles, coming to a standstill sticking straight up at your [pc.butt] with your hand wrapped around the girthy bulge at its base.");
	
	output("\n\n<i>“Puppy’s got such a nice bone,”</i> you smirk, giving her cock a loving little stroke. <i>“Mind if I play with it?”</i>");
	
	output("\n\nKaede nods breathlessly, eyeing you lustfully as your [pc.butt] wavers over her tapered crown. Though you definitely have her attention now, you decide to give the eager puppy a show. You shimmy out of your gear, groping at and caressing yourself at every opportune moment, keeping your pet pooch in rapt attention. Her eyes follow your movements, eventually settling on your [pc.chest] as the last of your equipment clatters to the deck.");
	
	output("\n\n");
	if (pc.biggestTitSize() >= 1)
	{
		output("Kaede reaches up and cups your [pc.boobs], running her thumbs across your [pc.nipples]. Ooh, that feels nice. You grin down at her and return the favor, slipping her cock between");
		if (pc.hasVagina()) output(" the lips of your [pc.cunt]");
		else output(" the cheeks of your [pc.butt]");
		output(" and rocking your hips for her. That just elicits a moan from your lover, and her hands zip down to grip at your [pc.hips].");
	}
	else
	{
		output("Kaede reaches up and grabs your [pc.butt], sinking her fingers in and trying to guide you to onto her needy cock. You playfully refuse, making the poor girl work for it: she moans and bites her lip, trying to wrestle you down. After a few teasing moments, you allow it - but you redirect her tapered crown, burying it between");
		if (pc.hasVagina()) output(" the lips of your [pc.cunt]");
		else output(" the cheeks of your [pc.butt]");
		output(" and rocking your hips for her. That just elicits a moan from your lover, and her hands zip down to grip at your [pc.hips].");
	}

	if (pc.hasVagina()) pc.cuntChange(0, ppKaede.cockVolume(0));
	else pc.buttChange(ppKaede.cockVolume(0));
	
	
	output("\n\n<i>“You tease!”</i> Kaede whimpers, squirming under you. <i>“J-just take it already, would ya?”</i>");
	
	output("\n\n");
	if (pc.isMisc() || pc.isBimbo()) output("<i>“Say please,”</i>");
	else output("<i>“Only if you ask nice,”</i>");
	output(" you grin.");
	
	output("\n\n<i>“P-please?”</i> your lover whines, dick urgently throbbing against your entrance. <i>“I want it so bad.”</i>");
	
	output("\n\nYou smile knowingly and shift overtop her, aligning the pointed pinnacle of her prick with your [pc.vagOrAss]. She gasps, biting her lip and trying to hold back a moan as you slowly ease yourself down. You stop again, just as the first inch of steamy cockmeat presses into your entrance. Pausing a moment to enjoy that sensation of being spread open, slowly but surely, inch by inch... you shudder and let your eyes flutter closed, letting gravity do the hard work of dragging you down Kaede’s cock and into her lap.");
	
	output("\n\nA few seconds later, you’re nestled onto Kaede’s crotch and basking in the wonderfully hot fullness of ausar cock. Underneath you, your lover’s breath comes in ragged little gasps, and her hands squeeze down on your hips. Your wiggle your [pc.butt] over the slowly-stiffening knot, giving her a thrill until you’ve adjusted to her straining girth.");
	
	output("\n\n<i>“Better?”</i> you ask, giving one of Kaede’s nipples a playful tweak.");
	
	output("\n\nShe gasps, tail thumping against your [pc.leg]. <i>“Oh yeah... much. Nothing better than being in one of my best friends.”</i>");
	
	output("\n\nKaede manages to control herself enough to smile and rock her hips, bouncing you in her lap. You let her take the lead for a moment, bracing yourself on her chest and spreading your cheeks for the thrusting spear of crimson cockflesh. Pretty soon, the little room is echoing with the heavy sounds of flesh slapping flesh, and your [pc.butt] is jiggling with Kaede’s constant thrusts. For such a shy thing, once she gets going, Kaede can be an absolute beast - she’s grunting and gritting her teeth, throwing everything she can into pleasuring your");
	if (pc.hasVagina()) output(" pussy.");
	else output(" behind.");
	
	output("\n\nSo much so that one particularly deep thrust into your [pc.vagOrAss] hammers your hole with the now-turgid ball of knotty bitchbreaker at the base of Kaede’s cock. Rather than back off, Kaede’s grip on your [pc.hips] yanks you down hard on her knot, and you shriek with pleasure and shock as you’re tied down.");
	
	output("\n\n<i>“Oh <b>fuck</b>!”</i> you yelp, gasping for the breath that she just knocked out of you.");
	
	output("\n\nKaede giggles, but that gets cut off in the blink of an eye when you squeeze your");
	if (pc.hasVagina()) output(" pussy’s");
	else output(" anal");
	output(" muscles for her, turning into a long moan. Her back arches off the bedsheets, and you feel that familiar wetness of pre bubbling up inside you, almost ready to burst. You smirk and cup Kaede’s tits, whispering sweet nothings about how she’s such a good, pretty girl... and that she should let it all out and cum for you. All the while, you start to move your hips, rocking back and forth on her throbbing, cum-swollen knot, working to milk that sweet puppy-spunk out.");
	
	output("\n\nYour urging is all she needs. Kaede gasps, going rigid in your hands, and her dick thrusts as deep into you as her little hips can push it. Her knot makes one might pulse, balls churning with all that pent-up cream, before steamy, sticky cum splatters all inside your");
	if (pc.hasVagina()) output(" pussy");
	else output(" bowels");
	output(". Now it’s your turn to moan, putting a hand on your [pc.belly] as you’re pumped full of the puppy’s seed.");
	
	output("\n\nAll you need to do is keep moving, tugging on Kaede’s knot with your [pc.vagOrAss] to milk her dry. Feeling her cock spurt and wobble around in your");
	if (pc.hasVagina()) output(" slit");
	else output(" ass");
	output(" just adds to your own pleasure: she’s tied herself at just the right depth to");
	if (pc.hasVagina()) output(" put pressure on the underside of your clit, rubbing you through your hood with every little motion.");
	else output(" grind against your prostate, making your [pc.cock] jump to attention and start drooling all over Kaede’s belly.");
	
	output("\n\nA minute of bouncing on her knot later, and you’re cumming your brains out for her,");
	if (pc.hasCock()) output(" painting her tits and neck with a streak of [pc.cum]");
	if (pc.isHerm()) output(" and");
	if (pc.hasVagina()) output(" drooling femcum down her crimson shaft");
	if (!pc.hasGenitals()) output(" squeezing your ass for her as your sexless body climaxes");
	output(". When you finish moaning through your orgasm, it all at once feels as though all the breath has gone out of you - along with all the tension and stress of your long journey, all the worry of the day...");
	
	output("\n\nYou slump down overtop Kaede, resting your cheek against one of her sinfully soft little breasts. There’s a thin, glistening sheen of sweat built up from her vigorous fucking, but her cleavage is still nice and cool for you. Kaede giggles when you nuzzle up, wrapping her big ginger tail around your [pc.butt] and pulling the sheets up over you both.");
	
	output("\n\n<i>“Hope you’re comfortable,”</i> she murmurs, yawning and reaching up for the lights. <i>“Gonna be stuck there awhile.”</i>");
	
	output("\n\nYou smile up at her and slip your arms around her. <i>“Nowhere I’d rather be...”</i>");

	processTime(35);
	if (pc.hasVagina()) pc.loadInCunt(ppKaede, 0);
	else pc.loadInAss(ppKaede);
	IncrementFlag("KAEDE_FUCKED");

	for (var i:int = 0; i < 3; i++)
	{
		pc.orgasm();
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function extrameetKaedeFuckHerAss():void
{
	clearOutput();
	showKaede(true);

	var x:int = -2;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(370);
		if(x == -1) x = -2;
	}
	if(x < 0 && pc.hasHardLightEquipped()) x = -1;
	if(x == -2) { output("ERROR. INVALID WANGER. DEFAULTING TO HARDLIGHT VARIANT. PLZ NOTIFY FEN.\n\n"); x = -1; }

	output("Sounds like a plan.");
	
	output("\n\nYou heft Kaede up, one hand under each cheek of her ass, and carry her to the bedroom. She giggles and squeals, legs wrapping tight around you until you send her sprawling back on the bed and crawl in over her, hands caressing her hips and working up under her shirt until your palms are on her breasts, feeling her nipples pressing through the thin layer of cloth between your flesh and hers. Her breath catches as your thumbs brush across her stiff little peaks, spending a moment to rub and pinch them before reaching up and cupping her cheeks. She smiles up at you, inviting another kiss onto those rosy lips; her legs curl up around your [pc.hips], locking over your ass and pulling you in.");
	
	output("\n\nSometime during your lengthy entwinement, Kaede’s arms slip down and pull her shirt up, breaking your kiss when she peels it over her head. She’s gone braless, leaving her perky C-cups bouncing until you seize hold of them again, squeezing the sinfully soft mounds until she’s squirming and arching her back, pressing that little package of hers against your thigh.");
	
	output("\n\n<i>“What’s this?”</i> you grin, reaching down and wrapping your hand around her crotch. Something thick and knotty throbs just below her jeans, enticing you to undo her belt and shimmey her pants on down to finally unleash that lush red rocket in all its glory. The shaft bobbles in the air, swaying weightily until you push it down onto Kaede’s belly, trapping it between your bodies.");
	if (pc.isBimbo()) output(" As yummy as that dick looks, you’re thirsty for a piece of that ass instead!");
	else output(" You can’t wait to see her dick bouncing and leaking when you start digging into that sweet shemale ass.");

	output("\n\nBefore you can go much further, Kaede twists around underneath you and reaches for the nightstand’s drawer. She tosses you a little travel-sized bottle of lube and, while your hands are caught up with it, she ");
	//clothed: 
	if(x >= 0 && !pc.isCrotchExposed()) output("pulls your [pc.lowerGarments] out of the way and ");
	else if(!pc.isCrotchExposedByArmor()) output("pulls your [pc.armor] out of the way and ");
	//cock:
	if(x >= 0) output("wraps a hand around your [pc.cock " + x + "], stroking your hardening length.");
	//hardlight:
	else output("finds her way to the activation button hidden in your [pc.lowerUndergarment]. Your hardlight cock springs to life in a rush of sensation, forming a solid, glowing shaft of luminescent artificial cockflesh right into her hand.");
	output(" Kaede glances between the bottle and her hand around your [pc.cockOrStrapon " + x + "], smiling lasiviously up at you.");

	output("\n\n<i>“Just work it in for me,”</i> you tell her, tweaking one of her pink nipples. The bottle pops open with a flick of your thumb, and you start pouring a line of lube from your base to your crown, covering Kaede’s fingers as you go. As commanded, she starts stroking as soon as you’ve given her something to work with, using her hand to smear the cool liquid around in a nice, even glaze. All you need to do is sit back and enjoy the handjob, pouring on extra lube or groping Kaede’s cock and tits as you please.");
	output("\n\nBefore long she’s a mess, her belly slathered in run-off lube and her dick leaking a salty white from all the teasing, hard as a rock despite the lack of dedicated attention. <i>“Nice and ready,”</i> Kaede says, leaning up to plant a kiss on your ");
	if(x >= 0) output("[pc.cockHead " + x + "]");
	else output("hardlight crown");
	output(".");
	if(x >= 0)
	{
		output(" Her tongue runs across your slit");
		if(pc.cocks[x].cLength() >= 12) output(", probing into your gargantuan vein and");
		output(" lapping up the first sweet beads of pre she’s worked out of you already.");
	}

	output("\n\nAs nice as that is, you’ve got something other than Kaede’s mouth in mind. You grab her just under her breasts and heave your lover over, rolling her face-down on the bed with her tight little ass flush against the underside of your prick. She gives a little gasp of surprise, but her bright orange tail immediately curls up her back and out of the way, silently inviting you to do as you please with her defenseless backside.");
	output("\n\nYou give Kaede’s ass an appreciative spank, grinning as the flesh quivers at your touch. She grabs the pillow and hugs it to her chest, glancing back at you with wide, hungry eyes. <i>“Come on already! God, I want it!”</i>");
	output("\n\nThat’s what you like to hear. You plant your hands on her ass and use your thumbs to spread her cheeks apart, revealing the little star of her asshole tucked just behind her taut sack. The entrance seems to wink at you, clenching and unclenching with Kaede’s rising anticipation. The red shaft of her prick lies flat against the bed, thrust out between her legs. The soft swell of her knot pulses with her quickening heartbeat, and her veiny shaft drools whiteness as your [pc.cockOrHardlight " + x + "] closes on her tight tailhole.");
	output("\n\nThe tip of your glistening prick brushes across her opening, and Kaede’s tail flicks across her back in a nervous twitch. Your crown presses against her asshole, lubed and ready; all you need is to rock your [pc.hips] forward, pressuring her clenching star until it submits and opens for you, admitting the slow, steady ingress of your [pc.cockOrHardlight " + x + "]. You hear her breath catch; see her fingers digging into the sheets; feel her ass stretching and squeezing as you slide deeper and deeper inside her.");
	output("\n\nKaede’s legs curl up behind you, groping blindly at your ");
	if(pc.tailCount > 0) output("[pc.tail]");
	else if(pc.isTaur() || pc.isNaga()) output("bestial lower body");
	else output("backside");
	output(". Her whole body feels like it’s going wild, muscles spasming in a vain attempt to adjust to your thick " + (x >= 0 ? "manhood" : "sextoy") + " stretching out her ass. Your [pc.hips] roll forward, pushing more and more " + (x >= 0 ? "dickmeat" : "hardlight") + " into her until you’re sitting flush against her tight little rump, squeezing her hips between your [pc.legs] and letting your " + (x >= 0 ? "throbbing" : "projected") + " erection settle in her bowels. Your hands play across her butt, kneading the halfbreed’s supple, pale flesh between your fingers. Slowly, she starts to relax, finally getting used to your unyielding hardness stretching out her tailhole.");
	
	if(x >= 0) pc.cockChange();
	
	output("\n\n<i>“Okay. Okay...”</i> Kaede breathes between soft little moans. <i>“Startin’ to feel good back there. I think... I think it’s okay to move now.”</i>");
	output("\n\nYou didn’t know you were waiting on her permission, but now that you have it... Giving Kaede’s cheek an affectionate squeeze, you start to rock your hips back - a little more quickly than with your entrance - and Kaede starts moaning for you, oh-so-sweetly. No sense giving her time to recover now: you keep your [pc.hips] moving, sawing your shaft back out and in again, picking up speed with every thrust.");
	output("\n\nThe heavy, wet sounds of flesh slapping against flesh echo through the room, accompanied by Kaede’s whimpering grunts of pleasure and the creaking of the bedframe under you. Your hands plant themselves on Kaede’s shoulderblades, pushing the cock-hungry halfbreed into the sheets, letting your hammering crotch do the same to her ass. Kaede sinks into the bed, tail flicking against your [pc.face], her body completely at your mercy.");
	output("\n\nAnd she’s loving every second of it.");
	output("\n\nKaede’s tailhole squeezes hard around your thrusting dick, and you can feel something thick and meaty throbbing against your thigh, leaking to the beat of Kaede’s racing heart. A few moments later, she gives voice to it: <i>“O-oh fuck! Too much, too much, too-”</i>");
	output("\n\nKaede’s voice breaks into a cry of unrepentant anal pleasure. Her once-rhythmic squeezes around your [pc.cockOrHardlight " + x + "] become a wild barrage of sensation, gripping and grinding on your lube-slicked shaft. One particularly tight clench heralds a sudden rush of steamy, creamy heat across your [pc.leg]. You look down with a grin at the streak of white puppy-jizz splattered across your thigh and the now-sullied bedsheets.");
	if(pc.isNice() || pc.isBimbo()) output("\n\n<i>“Good girl,”</i> you whisper into one of Kaede’s big, ginger ears, nibbling at the edge. <i>“Let it all out for me.”</i>");
	else output("\n\n<i>“Bad girl!”</i> you chide, leaning into the orgasming pup’s back and nibbling on her ginger ear. <i>“You made a mess!”</i>");

	output("\n\nKaede whimpers, a lurid little whine of pleasure and embarrassment, even as her cock’s still squirting the little aftershots of her orgasm. With your [pc.chest] pressed against her back, you keep her pinned right where you want her while your [pc.hips] pound away, milking that sweet boy-clitty inside until she’s cum every last drop all over you, herself, and her bed.");
	output("\n\n<i>“K-keep going,”</i> she moans, twisting around to kiss you. <i>“I want your load inside me! I wanna feel it deep!”</i>");
	if(x < 0) output("\n\nWell, she’ll get as close to a load as your hardlight prick can give her....");
	else output("\n\nThen she better work for it, huh?");

	output("\n\nGrinning, you grab Kaede just under those perky tits of hers and flip her over. There’s a moment of intense tightness around your [pc.cockOrHardlight " + x + "], accompanied by a poof of ginger fur in your face and a yelp of surprise from the cum-drained puppy-slut. Her legs curl around your [pc.butt] and her cock flops half-hard on her flat belly, trembling with the rapid rise-and-fall of her breath.");

	output("\n\nThat’s more like it! You grab her tits for leverage and hammer your dick home as hard and fast as you can, letting the tight embrace of her tailhole wring out your inevitable climax.");
	if(x >= 0) output(" Between your final thrusts, your mind races to make a choice.");

	processTime(25);
	pc.lust(200);
	clearMenu();
	IncrementFlag("KAEDE_FUCKED");

	if (x >= 0)
	{
		addButton(0,"Cum Inside",cumInsideKaedesBootyButt,x,"Cum Inside","Cum in her butt.");
		addButton(1,"Facialize Her",facializeKaedeAfterBootyButting,x,"Facializer","Cum on her face.");
	}
	//else: Go right to Cum Inside
	else addButton(0,"Next",cumInsideKaedesBootyButt,x);
}

public function extrameetKaedeFirstTime():void
{
	clearOutput();
	showKaede();
	moveTo("BUNBAKERY");

	output("A split second after you electronically confirm the date, your Codex beeps with an incoming message - not over ExtraMeet, but over your personal comms. Sure enough, the incoming call displays an origin of <i>“Kaede Entara.”</i>");
	
	output("\n\nYou pick up and are instantly assaulted by the thunderous sounds of a crowded Tavros consumer deck. Kaede’s voice comes loud and clear, though: <i>“Ohmygod was... is that you on ExtraMeet right now?”</i>");
	
	output("\n\nYou say that it sure is. Where does she want to meet up?");
	
	output("\n\nKaede giggles, and the roar of the crowd dims somewhat. Maybe she’s ducked into a storefront. <i>“Uhhh, oh man, I honestly forgot Anno made me set that EM profile up. I haven’t gotten swiped on in forever and a half! D-do you really want to...?”</i>");
	
	output("\n\nYou can practically hear her blushing when you say that you do.");
	
	output("\n\n<i>“Wow! S-sure, I’d love to hang out, too. There’s a little confectionary up on the Res Deck I’ve always loved. Wanna meet up there? I’m just about to finish my shopping, so I can be there in just a few minutes.”</i>");
	
	output("\n\nSounds good to you. You tell her that you’ll be there.");

	processTime(30);

	clearMenu();
	addButton(0, "Next", extrameetKaedeFirstTimeII);
}

public function extrameetKaedeFirstTimeII():void
{
	clearOutput();
	showKaede();
	showName("KAEDE\n& ILARIA");
	showBust("KAEDE", "ILARIA");
	author("Savin");

	output("You’ve only just sat down at your table in the bustling little corner cafe when the door opens and a familiar ginger pup comes your way. Kaede’s wearing the same leather-and-jeans getup as in her profile pic, though she’s got a satchel slung on a shoulder with a big, smiling JoyCo logo on it and several plastic bags peeking up from inside. She’s breathing hard, tail battering the flood behind her.");

	output("\n\n<i>“Hi! Did I keep you long? The line was killer, so I ran straight here as soon as I got out.”</i>");
	
	output("\n\n<i>“It’s fine,”</i> you assure her, as Kaede plants a little kiss on your cheek and slides into the booth across from you. <i>“Just got here myself.”</i>");

	output("\n\nBefore long,");
	if (flags["MET_ILARIA"] != undefined) output(" Ilaria");
	else output(" a perky blue-haired girl with rabbit ears and a skirt that’s just a little too short to hide her hermaphroditism");
	output(" bounces up with a tablet under an arm, ready to take your order.");

	output("\n\n<i>“Heyya, Kaedypoo!”</i> the waitress beams, bouncing on her heels in a way that brings her dangerously close to exposing herself.");

	if (flags["ILARIA_TOTAL_KIDS"] != undefined)
	{
		output("\n\n<i>“Whatcha doin’ here with my mate, hmm?”</i>");
		
		output("\n\n<i>“Y-your mate?”</i> Kaede blinks, gulping.");
		
		output("\n\nIlaria giggles and leans down to plant a smooch on your cheek, right where Kaede did a moment ago. <i>“Yup. [pc.name] here’s my baby " + pc.mf("daddy", "mommy") + ". Don’t you worry, I’m not the jealous type. Well, maybe a little jealous of [pc.name] getting hands-on with you before I ever did.”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\n<i>“Duh!”</i> Ilaria says. <i>“I’ve been living on Tavros since I was 10. There’s only one school on this tub, so, y’know.”</i>");
		
		output("\n\n<i>“And Ilaria’s why I love coming here. Plus it’s like a block from my apartment,”</i> Kaede admits. <i>“It’s nice seeing familiar faces.”</i>");
		
		output("\n\nIlaria grins. <i>“Aww, you too. Anyway, what can I get you cuties?”</i>");
	}
	else if (flags["FUCKED_ILARIA"] != undefined)
	{
		output("\n\n<i>“Whatcha doin’ here with my favorite backroom buddy, hmm?”</i>");
		
		output("\n\nKaede blinks. <i>“Your what?”</i>");
		
		output("\n\nIlaria giggles and leans down to plant a smooch on your cheek, right where Kaede did a moment ago. <i>“I dunno, that sounded more clever in my head. Nevermind.”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\n<i>“Duh!”</i> Ilaria says. <i>“I’ve been living on Tavros since I was 10. There’s only one school on this tub, so, y’know.”</i>");
		
		output("\n\n<i>“And Ilaria’s why I love coming here. Plus it’s like a block from my apartment,”</i> Kaede admits. <i>“It’s nice seeing familiar faces.”</i>");
		
		output("\n\nIlaria grins. <i>“Aww, you too. Anyway, what can I get you cuties?”</i>");
	}
	else
	{
		output("\n\n<i>“What can I get you and your cutie date, hmm?”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\nKaede giggles. <i>“Y-yeah, I mean, there’s only one school on Tavros so all us station kinds kinda do. Oh, uh, this is Ilaria. Ilaria, [pc.name].”</i>");
		
		output("\n\n<i>“Any friend of Kaede’s a friend of mine!”</i> the waitress says, rocking back on her heels. <i>“Especially the cute ones! You better snag [pc.himHer], Kaede, or I just might!”</i>");
		
		output("\n\nYour date blushes fiercely while the bunny girl laughs. <i>“Oh, I’m awful. So what’ll hit the spot, you two?”</i>");
	}

	processTime(20+rand(5));

	//Display Ilaria's shop menu. No escape clause. Hit the player with the effect of their chosen dish, but combine whatever they choose into the following scene UNLESS they choose the Sinabunny and they've already had sex with Ilaria. That gets the "Kaede Surprise" scene...

	// Me: :catstare:

	kaedeDataIlariaMenu();
}

public function kaedeDataIlariaMenu():void
{
	clearMenu();
	var free:Boolean = (flags["ILARIA_PREG_EMAIL1"] == 2);

	// Savin never accounted for the player having not enough credits, so I'm just
	// gonna swing this as a wink-nudge from Ilaria giving you the cheapy thing
	if (flags["FUCKED_ILARIA"] == undefined) addButton(0,"Sin-a-Bunny",kaedeDataIlariaOrder,"Sin-a-Bunny","Sin-a-Bunny","Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!");
	else addButton(0, "Sin-a-Bunny", extrameetKaedeSurprise, "Sin-a-bunny", "Sin-a-Bunny", "Order one of Ilaria’s infamous ‘special sauce’ sinabunnies. Let’s be honest: Kaede would eat that sauce by the gallon anyway.")
	if(getOrderPrice("Vanilla Iced Teats") <= pc.credits) addButton(1,"Vanilla Ice C.",kaedeDataIlariaOrder,"Vanilla Iced Teats","Vanilla Iced Teats","Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!");
	else addDisabledButton(1,"Vanilla Iced Teats","Vanilla Iced Teats","You can’t afford this.");
	if(getOrderPrice("Kaithrit Kittycake") <= pc.credits) addButton(2,"Kaithrit Cake",kaedeDataIlariaOrder,"Kaithrit Kittycake","Kaithrit Kittycake","Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!");
	else addDisabledButton(2,"Kaithrit Kittycake","Kaithrit Kittycake","You can’t afford this.");
	if(getOrderPrice("Ausar Pup Pie") <= pc.credits) addButton(3,"Ausar Pup Pie",kaedeDataIlariaOrder,"Ausar Pup Pie","Ausar Pup Pie","A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!");
	else addDisabledButton(3,"Ausar Pup Pie","Ausar Pup Pie","You can’t afford this.");
	if(getOrderPrice("Dzaan Cream Smoothie") <= pc.credits) addButton(4,"D. Smoothie",kaedeDataIlariaOrder,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!");
	else addDisabledButton(4,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","You can’t afford this.");
	if(getOrderPrice("Raxxian Road") <= pc.credits) addButton(5,"Raxxian Road",kaedeDataIlariaOrder,"Raxxian Road","Raxxian Road","A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!");
	else addDisabledButton(5,"Raxxian Road","Raxxian Road","You can’t afford this.");
	if(getOrderPrice("Gryvain Jigglers") <= pc.credits) addButton(6,"GryvainJiggler",kaedeDataIlariaOrder,"Gryvain Jigglers","Gryvain Jigglers","A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!");
	else addDisabledButton(6,"Gryvain Jigglers","Gryvain Jigglers","You can’t afford this.");
}

public function extrameetKaedeSurprise(order:String):void
{
	clearOutput();
	showName("KAEDE\n& ILARIA");
	showBust("KAEDE", "ILARIA");
	author("Savin");

	output("You tell Ilaria that you’ll both have her famous Sinabunnies... with plenty of the special sauce.");
	
	output("\n\nThe bunny-pup glances between you and Kaede, as if to ask if you’re sure, until Kaede says, <i>“Ohh, I love cinnamon so much. That sounds great!”</i>");
	
	output("\n\n<i>“Alllrighty,”</i> Ilaria grins, tapping your order onto her datapad. <i>“Double stuffed Sinabunnies cumming right up. You’re gonna love it, Kaede.”</i>");
	
	output("\n\nKaede smiles innocently, tail wagging as the sinful chef saunters into the backroom to milk those bunny balls dry for you. As soon as she’s gone, Kaede claps her hands to her burning cheeks. <i>“Ahh, I didn’t think Lari would make a fuss. I’m sorry!”</i>");
	
	output("\n\nPerish the thought. Besides, Kaede’s always so cute when she’s embarrassed.");
	
	output("\n\nThat just makes her blush a little harder, sinking down in her seat. Considering what you’re about to trick her into, you decide it’s only appropriate to keep pushing this relationship button, telling Kaede that it sure seems like Ilaria wants a piece of Kaede’s cute little ass. What’s been keeping her from letting that bunny hop right on her dick?");
	
	output("\n\n<i>“I... I mean, I dunno,”</i> she shrugs. <i>“Lari was always super sweet in school, but I was too dense back then to tell the difference between friendship and flirting. Believe me, there’s a lot of people I wish I’d had the nerve to ask out back then.”</i>");
	
	output("\n\n");
	if (flags["SEXED_CASS"] != undefined)
	{
		output("<i>“Like Cass?”</i>");
	
		output("\n\nKaede squirms, ears ducking. <i>“Y-yeah. Like Cass. God, I wish so much we’d gotten together under normal circumstances. Maybe I could have stopped her from... you know...”</i>");
	
		output("\n\nShe sighs and shakes the idea off with long draw on her drink. ");
	}
	output("<i>“Anyway,”</i> she says, <i>“Lari’s sweet. And I love the mod work her family has... they’re from this little ausar colony on Angelus, where everybody gets bunny mods to help ‘em avoid the mega-fauna. They’re all so cute, I just wanna rub their ears.”</i>");
	
	output("\n\nThe feeling appears to be mutual.");
	
	output("\n\nBefore you can press Kaede’s love of bunnies any further, Ilaria returns with a pair of plates positively <i>slathered</i> in steaming hot ‘special sauce’, so thick and creamy that it looks almost indiscernible from the real thing. No doubt Ilaria had a little extra motivation whipping these up.");
	
	output("\n\nShe grins and bounces on the balls of her feet after sliding the two plates onto your table, a gesture that does positively hypnotic things to her too-short skirt");
	if (chars["ILARIA"].bellyRating() >= 20) output(" and baby-laden belly");
	output(". <i>“Here you go, my personal recipe. C’mon, Kaede, lemme see the look on your face with that first bite. I know you’re gonna love it.”</i>");
	
	output("\n\nPoor Kaede doesn’t have a suspicious bone in her body. She wags her tail and accepts the tainted sweet without question. You and Ilaria exchange a glance as the hapless half-ausar gets her fork and knife and slices off a big chunk, one with a nice fat glob of sauce jiggling between the bun’s valleys. While you and the chef watch with breathless suspense, Kaede slowly brings the treat up between her lips.");
	
	output("\n\nHer eyes light up the moment she tastes it. <i>“O-ohhh! Lari, that’s delicious,”</i> she says, swallowing with gusto. You knew she was the kinda girl to swallow. <i>“It’s kinda salty, but also so sweet... and thick! Mmm, I could eat that sauce all by itself!”</i>");
	
	output("\n\n<i>“G-glad you think so!”</i> Ilaria says, hiding her devlish grin behind a hand. <i>“[pc.name] sure is a big fan of it! Sometimes [pc.heShe] even helps me make it.”</i>");
	
	output("\n\n<i>“R-really? I had no idea you were a culinarian, [pc.name],”</i> Kaede giggles, taking another big bite. <i>“What’s a rich [pc.boyGirl] like you doing working at a cafe?”</i>");
	
	output("\n\nOh, you don’t really work here. You just like plugging Ilaria into her milker behind the counter and helping her cum big, fat loads for her special customers to eat.");
	
	output("\n\nKaede’s eyes go wide, darting between you and Ilaria, searching for some sign that you’re just teasing her again. All she gets is a shit-eating grin from the ballsy bunny-girl... and a tent in her skirt that threatens to lift it straight up until she quickly brings her empty serving tray down to hide it from the other customers. For her part, Kaede’s cheeks burn a bright crimson as the reality of your prank settles in on her, and her ears tuck flat against the top of her head.");
	
	output("\n\n<i>“W-why’s it taste so good then?”</i> is all Kaede can manage to say, prompting a giddy laugh from Ilaria. Well, at least she’s being a good sport about it. You didn’t think she’d mind too much, after all, and as Ilaria’s puffball tail wiggles behind her, so too does Kaede’s start wagging again. Still staring up at the server-bunny, Kaede takes another bite slathered with ball-sauce.");
	
	output("\n\n<i>“I knew I liked you for a reason!”</i> Ilaria grins. <i>“Tell ya what, why don’t you forget the pastry and come with me to the back. I can show you how the sauce is made up close...”</i>");
	
	output("\n\nKaede’s eyebrows disappear into her ginger hair. <i>“I, uh, um... I mean, if [pc.name] comes too... we’re on a date, Lari.”</i>");
	
	output("\n\n<i>“Ohh, I think [pc.heShe] is craving it, too...”</i>");
	
	output("\n\nYou’ve been waiting for this since you sat down.");

	processTime(20);
	setOrderTFAndDeets(order, true);
	pc.credits -= getOrderPrice(order);
	if (pc.credits < 0) pc.credits = 0;

	var useCock:Boolean = pc.hasCock();
	
	clearMenu();
	addButton(0, "Next", extrameetKaedeSurpriseII, useCock);
}

public function extrameetKaedeSurpriseII(useCock:Boolean):void
{
	clearOutput();
	showName("KAEDE\n& ILARIA");
	showBust("KAEDE_NUDE", "ILARIA_NUDE");
	author("Savin");

	output("Ilaria leaves out a small “Out for Lunch” sign before escorting you and Kaede through the little back door in the shop and up a short metal staircase to the second floor. You quickly realize that this must be her apartment, a little nook above her shop where Ilaria’s been living. It’s unremarkable aside from its pastel colors and alarming number of plushies lining the shelves and furniture. The middle of the one-room flat is dominated by a heart-shaped bed that quickly draws both girls over to its edge.");
	
	output("\n\n<i>“Never been here before,”</i> you remark, watching the bunny’s tail practically vibrate her skirt straight off. Kaede helps it the rest of the way, grabbing Ilaria’s ass in both hands as she does. You’re able to watch as the bunny’s fluffy balls and canid cock sway into view, no less stiff for the brief interlude. She grins at Kaede over her shoulder and wiggles her hips back into the half-ausar’s hands, letting the skinny girl feel just how much <i>meat</i> she’s got on her bones.");
	
	output("\n\nRather than just sit back and watch, you circle around and sit yourself down on the edge of the heart-shaped bed, wrapping both hands around Ilaria’s puppy pecker, enveloping it down to the knot.");
	
	output("\n\n<i>“Ohh, does that mean I’m the meat of the sandwhich?”</i> she giggles, resting both hands on your shoulders and wiggling her hips. <i>“Here I was thinking I was finally gonna give Kaede the knot.”</i>");
	
	output("\n\n<i>“I’m right here, you know,”</i> Kaede says, giving the bunny a playful slap on the rear. <i>“H-have you really been waiting?”</i>");
	
	output("\n\nIlaria rolls her eyes. <i>“Since high school, ya ditz!”</i> She turns on her heel, sliding her cock out of your hands and sliding down to sit in your lap, hands grabbing Kaede by the belt. <i>“Now let’s get you out of these clothes, huh?”</i>");

	output("\n\nYou watch over Ilaria’s shoulder as she fiddles with Kaede’s belt, eventually working it off and sliding the half-ausar’s jeans down, revealing a pair of paw-print panties and a prick peeking out of the band. Kaede’s pouch is spilling out of them too, enough to draw one of Ilaria’s hands to heft up her sack, and the other to guide Kaede’s cock to her lips. Ilaria swallows all eight-ish inches in one go, kissing Kaede’s bitch-breaker and giving her old friend the puppy-dog eyes from her base. Kaede can’t help but grin, biting her lip to stifle a moan while the bunny bobs her head up and down her rod.");
	
	output("\n\nWhile that’s going on, you get your hand back around Ilaria’s dick, stroking the red rocket off nice and slow. Ilaria moans around her mouthful of cock, eyes rolling closed as she starts really polishing it. As she leans in to work the knot, her ass wiggles in your lap,");
	if (useCock) output(" grinding against your cock");
	else output(" rubbing her balls into your muff");
	output(". It’s hard not to want to take the thick bunny-slut and get her on the bed under you, but you brought the girls up here for Kaede’s sake, not just yours... So for now, you content yourself to watch Ilaria get her nice and ready, using your hands to play with the bunny’s balls and cock, sometimes running them up her");
	if (chars["ILARIA"].bellyRating() >= 20) output(" pregnant");
	else output(" flat");
	output(" belly to play with her tits.");
	
	output("\n\nJust as you’re wrapping your hands around Ilaria’s weighty tits, Kaede pulls herself back from the bunny’s mouth, coming away with her chest heaving and her cock shining in the light.");
	
	output("\n\n<i>“Oooh, I think I’m about to get ravished, [pc.name]!”</i> Ilaria giggles. <i>“I better present my ass, huh?”</i>");
	
	output("\n\nShe’d better. You let her turn and push you down on the bed, straddling your [pc.hips] with her fluffy white balls resting on your thigh. She");
	if (useCock) output(" shifts up, planting her pussy on your rock-hard rod and slides down your length, leaning in against you as she takes your dick. She ends up with her tits pressed against your [pc.chest], moaning whorishly while your throb inside her soaked quim. Her dick smears pre across your [pc.belly], trapped between your bodies.");
	else output(" slides two fingers into your cunt, stretching your lips open like she’s testing you, stirring you up with her digits for a second before shifting back on her hips and rubbing the tapered crown of her dick into her slit. She gives you a playful little wink and eases herself in, leaning in with her whole body until the knot of her dick is grinding against your [pc.clit] and her tits are pressed against your [pc.chest].");
	
	if (!useCock) pc.cuntChange(0,chars["ILARIA"].cockVolume(0));
	else pc.cockChange();
	
	output("\n\nThe position leaves her ass wobbling, practically in Kaede’s face. The horny halfbreed chews her lip just long enough for the two of you two get settled in each other’s arms before she strides up, kicking her jacket and shirt aside, and grbs Ilaria’s big breeder’s hips.");
	
	output("\n\nThe bunny kisses you full on the lips, murmuring <i>“I’ve been waiting for this for a-aahhh!”</i>");
	
	output("\n\nHer whole body tenses as Kaede drives in, spearing Ilaria’s ass with spit-slicked cock. Her little tail buzzes gaily behind her, vibrating more vigorously with every inch of doggy-cock that slides through her sphincter. You feel Ilaria’s fingers squeeze your shoulders; feel her");
	if (!useCock) output(" cock throb in your pussy, leaking pre inside you");
	else output(" pussy clench hard around your [pc.cock]. You can even feel Kaede’s member through the thin walls of Ilaria’s body, rubbing against the underside of your own dick.");
	
	output("\n\n<i>“Ah, you’re tight, Lari!”</i> Kaede moans, hilting herself with a clear grunt of effort. <i>“H-have you been saving this hole just for me?”</i>");
	
	output("\n\nIlaria just gives you a wink and pushes back against the hung half-ausar, battering her own hole against the knot and bucking her hips against your own. You take the opportunity to grab her tits,");
	if (flags["ILARIA_TOTAL_KIDS"] != undefined) output(" hard enough to make a little milk dribble from Ilaria’s puffy teats. She gasps, giving you an embarrassed half-smile before another of Kaede’s thrusts turns her lips into an <i>“O”</i> of pleasure.");
	else output(" squeezing hard enough to make the fuck-bunny moan.");
	output(" Kaede starts really thrusting a moment after, making Ilaria’s whole body rock back and forth overtop you, sending ripples through her thick body every time Kaede’s slender hips crack against Ilaria’s fat behind.");

	if (useCock)
	{
		output("\n\nWith Ilaria rocking on top of you, you figure it’s time to start thrusting up to meet her. Your [pc.hips] lift off the bed when Kaede pushes her forward, slamming your [pc.cock] up into her eager puss. Every time she comes back down on the two cocks spearing her, the slutty bunny moans like a bitch in heat - like what she <i>is</i> deep down under all those mods of hers. You can feel her muscles hugging every inch you’ve slid inside her, riding it hard while her own uselessly drools onto your [pc.belly]. White streakers spill down your [pc.skinFurScales] onto the bed beside you.");
	}
	else
	{
		output("\n\nIlaria’s erratic full-body thrusts drive her knotty cock deep into your [pc.cunt] every time Kaede’s hips smash her forward. The bunny girl can’t do much but moan, sandwiched between you and Kaede as she is, so you decide to help her keep quiet - can’t have her customers downstairs hear what’s going on, can we? Since you’re already groping her boobs, you use them to pull her down into a hard kiss. Ilaria giggles, shaking those hips for Kaede - and wiggling her dick inside you, making her knot grind on your [pc.clit].");
	}

	output("\n\n<i>“Ohh, I feel her swelling up!”</i> Ilaria moans, drawing in a deep breath as Kaede hilts her, no doubt stretching the bunny open around the front of her thick tie. <i>“Let’s switch it up, huh?”</i>");

	processTime(15);

	clearMenu();
	addButton(0, "Next", extrameetKaedeSurpriseIII, useCock);
}

public function extrameetKaedeSurpriseIII(useCock:Boolean):void
{
	clearOutput();
	showName("KAEDE\n& ILARIA");
	showBust("KAEDE_NUDE", "ILARIA_NUDE");
	author("Savin");

	output("As soon as you nod, the bunny-girl pushes herself up onto her knees (with a little help from your hands still on her rack) and grabs Kaede’s hips at the apex of her last thrust. The ginger pup makes a surprised whine in her throat, blinking at Ilaria as her old friend slowly slides her cock out of her ass. In a blink, Ilaria pushes Kaede face-down on the bed beside you and hops to her feet, a gesture that makes her tits and balls bounce alluringly.");
	
	output("\n\n<i>“Okay, Kaede, spread those cheeks for me. If you like my sweet cum so much, let me give it to you the fun way.”</i>");
	
	output("\n\n<i>“I’m more of a bottom anyway,”</i> the slut-puppy sighs, grabbing her ass in both hands and spreading herself. Her own dick wobbles off the edge of the bed, thumping against the sheets with every beat of Kaede’s heart.");
	
	output("\n\nSuddenly, you’re feeling a little left out. You scoot up the bed and run your hand through Kaede’s shaggy red mane, hefting it up so that her face is planted straight between your [pc.legs]. She gets the cue and lolls her tongue out,");
	if (useCock) output(" wrapping it around the [pc.knot] of your [pc.cock].");
	else output(" licking around the lips of your pussy, still agape from Ilaria’s deep thrusts.");
	output(" She barely has time to get started before the bunny-girl gives her a good slap on the ass and drives her hips forward. Kaede gasps, mouth going wild on you for a moment as Ilaria’s tool drives into her tight little tailhole.");
	
	output("\n\n<i>“So good!”</i> Ilaria grins, groping Kaede’s ass in both hands. <i>“Oh, Kaede, your ass is amazing.”</i>");
	
	output("\n\n<i>“S-so’s your dick,”</i> the ginger answers back around her mouthful of");
	if (useCock) output(" [pc.cock]");
	else output(" muff");
	output(". <i>“And those balls feel so huge...”</i>");
	
	output("\n\nIlaria giggles, shaking her hips in such a way that her grapefruit-sized gonads slap heavily against Kaede’s little pouch. The ginger shemale moans into you, and you’re able to watch her own puppy-cock wobble beneath her, drooling pre as Ilaria drives right for her anal g-spot.");

	output("\n\nYou tell Kaede she’s a good girl and stroke her hair, gently pushing her down");
	if (useCock) output(" on your cock");
	else output(" into your pussy");
	output(". Her tongue goes to work sure enough, and she’s quick to kiss and lick her way all over your sex while Ilaria starts really fucking her ass, pounding hard away at the shemale’s tight hole. Kaede squeals and bucks her hips back against her, making her dick swing forward and back like a pendulum. A pendulum that’s leaking profusely now, turgid at the knot and ready to burst at the slightest provocation.");
	
	output("\n\nBefore Kaede can reach her orgasm, you");
	if (useCock)
	{
		output(" take hold of the back of her head and push her all the way down your shaft, making the ginger pup suck down every inch of [pc.cockType]-meat. She deftly keeps herself from gagging on the sudden thrust, even giving you a slutty little wink before she resumes ardently sucking. Now that she’s kissing your [pc.knot], you lean back in the heart-shaped bed and guide her bobbing head, keeping her impaled on your tool until her thrashing tongue has you feeling the rising tension in your [pc.balls].");

		output("\n\nConsidering how turgid Kaede is, almost ready to cum all over Ilaria’s sheets, there’s no reason to hold back anymore. You let the slutty puppy go to town, slurping away to her heart’s content until you feel the inevitable rush of cum rising up your length. Kaede seems to sense it the moment before your climax hits, and she gives you a lewd little wink and goes all the way down to the base just in time for the first gout of your [pc.cum] to pump straight down her throat.");

		output("\n\nKaede dutifully swallows every drop, happily sucking on your [pc.cock] as she’s railed from behind.");
	}
	else
	{
		output(" squeeze your thighs together around Kaede’s head and vigorously scratch the disheveled hair between her towering ears. She moans, but she dives into your muff with renewed vigor. Her tongue drives deep, inexorably homing in on your G-spot and battering away at it until your voice joins the girls’, crying your own ecstasy so loud that there’s no way all Ilaria’s customers can’t hear you - even over the pounding bass of her trashy pop music.");

		output("\n\nYou feel your back arching, [pc.chest] heaving as orgasm crashes through you. Kaede’s driven into your crotch even harder by Ilaria’s pounding hips, ass quivering with every impact. Her own cock’s on the edge, knot swollen and veins pulsing to the beat of Ilaria’s ass-fucking.");
	}

	output("\n\n<i>“Cum for me, baby,”</i> Ilaria murmurs, leaning over Kaede’s back and pressing her big");
	if (chars["ILARIA"].bellyRating() >= 20) output(", milky");
	output(" tits into the half-ausar’s back. Her teeth nip at the back of a ginger ear, whispering into it: <i>“Lemme feel that ass cumming for me.”</i>");

	output("\n\nYou have to imagine she gets her wish. Kaede tenses between your [pc.legs], and you grin down at her as the first thin ropes of milky fem-spunk squirt out of her turgid red rod, pooling between her knees in quivering puddle of musky");
	if (silly) output(" husky-goo.");
	else output(" goo.");
	output(" Kaede shudders and whimpers, leaning into you while Ilaria milks all that sweet puppy cream out one ass-shaking thrust at a time - right until she plows too deep, and you can feel the moment Kaede takes the knot by the way her tongue goes rigid, all her muscles tensing as the tie breaches her behind.");

	output("\n\nWhatever Kaede’s asshole does in its climax is more than enough to drive Ilaria over the edge right after her. The bunny-girl grabs Kaede’s hips in both hands, holding herself flush to the pup’s tight behind as her fluffy white balls discharge straight into Kaede’s bowels. You know full well how much the bunny-girl can produce all at once, but your lover’s utterly unprepared for the sheer volume of lapine fluid flooding into her fuckhole. And not one drop is going to escape, meaning every ounce of bunny-spunk strains her poor belly more and more, forcing her flesh to stretch in accomodation.");
	
	output("\n\nBy the time Ilaria’s balls have emptied, Kaede’s cradling a cute little ponch in both hands. Her own cock’s pressed between her stomach and the bedsheets, basting in its own wasted seed while the knotted bunny strokes and kisses its owner.");
	
	output("\n\n<i>“Totally worth the wait,”</i> Ilaria purrs, grinning up at you. <i>“I knew Kaede would be...”</i>");
	
	output("\n\n<i>“I’m gonna blush,”</i> Kaede giggles, returning one of Ilaria’s kisses.");

	processTime(15+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", extrameetKaedeSurpriseIV, useCock);
}

public function extrameetKaedeSurpriseIV(useCock:Boolean):void
{
	clearOutput();
	showName("KAEDE\n& ILARIA");
	showBust("KAEDE_NUDE", "ILARIA_NUDE");
	author("Savin");

	output("A few minutes later, you’re sitting on the bed’s edge with Kaede’s head resting on your shoulder, enjoying the show of Ilaria struggling to stuff herself back into her corset and skirts. When she finally gets her garments on around");
	if (chars["ILARIA"].bellyRating() >= 20) output(" her big, pregnant belly and");
	output(" her huge tits, the bunny girl strikes a pose and gives you both a V for victory.");
	
	output("\n\n<i>“That was <b>amazing</b>, you guys. Boner fuel for the rest of the year right there. But I gotta bounce before I go bankrupt. Feel free to lounge until you can feel your legs again!”</i>");
	
	output("\n\nShe does, indeed, bounce straight out the door and down the stairs, leaving you and Kaede reclining in each others’ arms. Your lover’s bare, sweat-slicked skin is hot against your own [pc.skinFurScales], doubly so as her lush red tail flicks up to drape across your laps.");
	
	output("\n\n<i>“I think as far as first dates go, that was a winner...”</i>");
	
	output("\n\nYou grin, putting an arm around Kaede’s slender shoulders and holding her close.");
	if (silly || pc.isMisc()) output(" First date? Guess you’re so good that you fuck <i>before</i> the first date!");
	else output(" Huh, she’s right: this is technically your first real date, isn’t it?");
	
	output("\n\nKaede giggles, nuzzling into your arm. <i>“As long as it’s not the last.”</i>");
	
	output("\n\n<i>Definitely</i> not.");
	
	output("\n\n<i>“Good,”</i> she smiles. <i>“Now... do you see where my pants went?”</i>");

	processTime(5);

	clearMenu();
	addButton(0, "Next", extrameetKaedeSurpriseV, useCock);
}

public function extrameetKaedeSurpriseV(useCock:Boolean):void
{
	clearOutput();
	showKaede();
	
	output("<b>A few minutes of searching, and a little playful grab-ass, later...</b>");
	
	output("\n\nYou and Kaede give Ilaria a parting wave as you make your way out of the bunny-girl’s bakery. Only a couple of her customers give you knowing looks, and luckily they’re of the same oversexed adult variety as the proprietress. No harm done despite all your yelling, you guess - thanks to that thumping bass that follows you straight out the door and halfway down the street to the elevator.");
	
	output("\n\n<i>“Alright, I gotta pop home and check my mail before I head back spaceward. I, um... I’ll see you soon, right? Don’t be afraid to use that app every so often. Maybe we’re both on Tavros more often than we think! I’ll definitely be keeping that profile active just for you.”</i>");
	
	output("\n\nSounds good. You catch Kaede’s wrist before she can finish turning to go, pulling her back in for one last kiss and send her on her way with a slap on the booty. She skips down the street with a pronounced wag in her tail, leaving you smiling as she vanishes in the crowd.");
	
	output("\n\nWhat a good girl.");

	processTime(5);

	IncrementFlag("KAEDE_FUCKED");
	IncrementFlag("FUCKED_ILARIA");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeDataIlariaOrder(order:String):void
{
	clearOutput();
	showKaede();

	output("<i>“Ooh, that sounds good. Same for me.”</i>");
	
	output("\n\n<i>“‘Kay!”</i> Ilaria grins, spinning on a heel. <i>“Be right up!”</i>");
	
	output("\n\nAs soon as she’s gone, Kaede claps her hands to her burning cheeks. <i>“Ahh, I didn’t think Lari would make a fuss. I’m sorry!”</i>");
	
	output("\n\nPerish the thought. Besides, Kaede’s always so cute when she’s embarrassed.");
	
	output("\n\nThat just makes her blush a little harder, sinking down in her seat. Before <i>all</i> her blood migrates to her cheeks, you figure you better change the subject: what was she getting at JoyCo earlier?");
	
	output("\n\n<i>“O-oh, just a few things for living ship-side. Ration bricks, bath scrub, sterilex, some of that fuzzy stuff you spray on engines if they get overheated. You know, nothing special. I had a few other places I was gonna go, but I wasn’t gonna miss an opportunity like this.”</i>");
	
	output("\n\nIs that right?");
	
	output("\n\nBefore you can press that button, Ilaria returns with a pair of plates laden down with treats. She slides them onto the table between you with a wink and a shake of her hips that brushes awfully close to Kaede’s face before leaving you two to enjoy your snack.");
	
	output("\n\n<i>“She’s such a flirt!”</i> Kaede says, somewhere between a laugh and a sigh as she takes a first bite. <i>“I wish I had her confidence...”</i>");
	
	output("\n\n");
	if (pc.isAss()) output("What would she need with it? She’s already a babe magnet.");
	else output("Nah, she’s perfect the way she is.");
	
	output("\n\nKaede huffs, but her tail thumps side to side in the booth behind her. You grin at her as she stuffs her face with a few consolation bites, which are all it takes to lighten the mood back up again. Before long she’s chatting away at you, laughing about some embarrassing Anno moment back in college, then retelling an encounter between her little freighter and a dastardly crew of pirates that came close to ending her young career. By the time she’s talking about her strained relationship with her mother, your plates have been cleared off and Kaede’s leaning back in her chair with her hands on her stomach.");
	
	output("\n\n<i>“God, how long have I been rambling on?”</i> she gasps, looking past you at the changing street lights outside. <i>“You should have stopped me half an hour ago!”</i>");
	
	output("\n\nNonsense. It’s not often you get the chance to just sit back and relax with her, after all. Kaede laughs and wags her fluffy tail, staring into her empty soda glass for a moment before saying, <i>“You know, I could go for a stiffer drink... and my appartment’s a little closer than Anon’s. Care to, um... join me?”</i>");

	pc.credits -= getOrderPrice(order);
	if (pc.credits < 0) pc.credits = 0;

	processTime(55+rand(11));

	setOrderTFAndDeets(order);

	clearMenu();
	addButton(0, "Next", kaedeDataIlariaOrderII);

}

public function kaedeDataIlariaOrderII():void
{
	clearOutput();
	showKaede();

	output("Kaede’s not kidding: her appartment’s only a stone’s throw away from Ilaria’s little restaurant, off the main thoroughfare in a cozy little block. As you’re walking, you ask her why she has it at all - doesn’t she basically live on <i>Talon Rogue</i>?");

	output("\n\nKaede scrunches her lips, thinking. <i>“I guess I do, yeah, but since I’m a Tavros native it’s cheap as hell to keep a small place here on the Res Decks. Thanks to your dad for pitching in so much funding for the station, I guess, cuz I know I’ve been reaping the benefits my whole life. Anyway, I don’t mind living shipboard, but sometimes it’s nice to have some solid ground under my feet, you know?”</i>");

	output("\n\n<i>“Solid ground... on a space station?”</i>");

	output("\n\n<i>“You know what I mean!”</i> she laughs. <i>“Being on an <b>actual</b> planet for too long makes me groundsick. Nah, space station living is the best the galaxy has to offer. All the benefits of stability and comfort with none of the giant open sky and horrible diseases. Ah, here we are...”</i>");

	output("\n\nKaede leads you up a short set of stairs to a little sliding door with her name printed beside it, surrounded by a floral pattern that’s gotten dusty with her absence. You follow her on inside, watching as the ginger pup shucks off her bags and flicks the lights on with the tip of her tail. As soon as the door slides shut behind her, a hologram snaps to life on a pillar beside the door, taking the form of a human woman in some kind of ancient toga and bronze armor.");

	output("\n\n<i>“Captain, you have new me- you have company, my apologies.”</i>");

	output("\n\n<i>“That’s fine, Athena. I’ll catch up later!”</i> Kaede calls, already disappearing into a side room. The hologram raises an eyebrow at you, then winks back out.");

	output("\n\nYou gotta ask, <i>“Who was that?”</i>");

	output("\n\nA moment passes. <i>“My ship’s A.I.,”</i> Kaede answers, coming back into view with a bottle of rum tucked under an arm. She’s shed her jacket, too, leaving pale, freckled flesh on display as she meanders over to the couch. <i>“Don’t mind her. She won’t interrupt again.”</i>");

	output("\n\nAlright, alright. You follow Kaede over, glancing around as you do. Her apartment’s small and spartan, with only a few comforts like the two-seat sofa and a cabinet full of holos around the wall-mounted screen, to prove that it’s been lived in at all. At least it’s well kept.");

	output("\n\nWhile you’re looking around, Kaede produces a pair of glasses and pours, raising hers for you to clink. <i>“To good friends and good booze!”</i> she cheers, leaning back into your shoulder and knocking back her drink. You slip your arm around her slender shoulders, letting the pretty pup nestle in close. Her tail flicks up onto your lap, draping across your crotch and swathing you in fluffy warmth.");

	output("\n\nWhen she finishes her drink, Kaede leans her head in against your shoulder, and one of her hands starts creeping its way across your [pc.chest]. You glance a hungry little smile playing across her lips, almost begging you to lean in and kiss them. Who are you to refuse? Cupping her chin in a hand, you bring them up to your [pc.lips] and lean into her, feeling the warmth of Kaede’s sweet breath against you.");

	output("\n\nWhen you break the kiss, Kaede pushes forward with uncharacteristic aggression. Her lips lock back against yours, and she swings a leg over to straddle you. You can feel her bulge grind against your [pc.belly], and instinctively your fingers find their way to her jeans’ zipper and start sliding it down. A moment later and there’s a throbbing red rocket rubbing on your stomach as Kaede’s hands desperately claw your [pc.gear] off between tongue-filled smooches.");

	output("\n\nThen her tail sweeps across the coffee table, clearing it off with one mighty wag.");

	output("\n\n<i>“Oops,”</i> Kaede giggles, biting a lip as her remotes go tumbling. <i>“Guess you better take me to the bedroom before I make more of a mess...”</i>");

	output("\n\nSo how’s the going to play out?");

	processTime(55+rand(11));

	clearMenu();
	if (pc.hasCock()) addButton(0, "Pound Her", extrameetKaedePoundHer);
	else addDisabledButton(0, "Pound Her", "Pound Her", "You need a wang-dangle to pound her!");

	addButton(1, "Blow&Bounce", extrameetKaedeBlowNBounce, undefined, "Blow & Bounce", "Actually, you like Kaede right where she is... with her dick out and in your hands.");
}

public function extrameetKaedeBlowNBounce():void
{
	clearOutput();
	showKaede(true);

	output("Actually, you like Kaede right where she is, and you let her know with a long kiss as you wrap your fingers around her knotty cock. She just moans into your mouth as you roll her over, putting her back into the couch while you slink down her svelte body and onto the floor between her trembling legs. She stares with awestruck eyes as you let your [pc.tongue] play out around the plump base of her dick, lapping at the swelling knot until its throbbing between your [pc.lips]. You slowly, sensually trace your mouth up her nearly eight inches of length until you’re kissing her slender spearhead.");
	
	output("\n\n<i>“O-ohhh, that’s good,”</i> Kaede murmurs, settling her hand on your head and gently guiding you down. You let her, just this once; it’s nice to know your mouth’s appreciated, and she moans with every inch you swallow. By the time you’re kissing her swell again and the crown has thrust past your tonsils, you can feel her veiny shaft throbbing with need against your [pc.tongue]. When you withdraw to the tip, she’s squirming and moaning... and when you go down again, her thighs clench around your [pc.ears].");
	
	output("\n\n<i>“Take it easy,”</i> Kaede whines, shivering for you. <i>“I... I haven’t cum for a bit. Don’t be so aggressive...”</i>");
	
	output("\n\n<i>Sorry, can’t hear you with your legs on my ears,</i> you think, starting to suck and writhe your tongue. Her knot engorges between your teeth, forcing your jaw open around her girth. You clench your thumb to fight down a gag as a thick stream of salty pre leaks down the back of your throat, heralding the inevitable consequences if you keep this up.");
	
	output("\n\nThat’s almost as much encouragement as anything. You swallow, letting your throat massage her top inches as your lips slavishly kiss and suckle on her knot. Though her tail’s wagging something fierce, Kaede’s voice comes out as a rasping whine: <i>“T-t-take it easy I’m gonna... gonna...”</i>");
	
	output("\n\nYeah, you know. Figuring you might as well cut to the chase, you slip a finger in through her open fly and press it into her tight little hole, prodding that prominent clit hidden just within. Kaede shrieks in surprise, and sure enough, you feel her veiny red rocket swell all the way down your throat. Hot, sticky juice flows down your gullet as Kaede’s legs kick and squirm over your shoulders, flailing like she’s lost all control of her body.");
	
	output("\n\nA wicked idea crosses your mind, and you pull yourself back up her shaft so that the latter half of her explosive orgasm ends up caught across your [pc.tongue]. You roll the thick, salty spooge around between your cheeks, gently sucking on her tip until every drop’s been spilled. When it’s done, you pull yourself off her knob and back onto the couch, straddling Kaede’s little hips to kiss her. The moment her lips open to accept your tongue, you feed her her own jizz. She gasps and squirms, but getting a mouthful of cum is basically her natural state, and her resistance fades into desperate horniness moments later. Her dick doesn’t bother softening, like it knows all the cum and drool clinging to it is only lube for what’s to come.");
	
	output("\n\nYou shed what’s left of your gear and lean down in Kaede’s lap, never breaking the kiss even as her spunk-slathered shaft slides into your [pc.vagOrAss]. The dog-girl swallows hard as you spear yourself on her cock, draining all that creamy cum you so generously gave her back with a ragged moan. By the time your [pc.butt] comes to rest on her thighs, her knot is throbbing");
	if (pc.hasVagina()) output(" between the lips of your quim");
	else output(" in the ring of your ass");
	output(", threatening to sink inside if you don’t raise yourself back on your [pc.knees] and start riding that dick.");
	var ppKaede:PregnancyPlaceholder = getKaedePregContainer();
	
	if (pc.hasVagina()) pc.cuntChange(0, ppKaede.cockVolume(0));
	else pc.buttChange(ppKaede.cockVolume(0));
	
	output("\n\n<i>“A-aah,”</i> Kaede moans, grabbing at your hips. <i>“You’re such a bully!”</i>");
	
	output("\n\nMaybe, but she loves having her dick bullied, doesn’t she?");
	
	output("\n\nThe ginger halfbreed blushes fiercely, but she can’t deny the charge with her rock-hard cock buried inside you. Instead, you guide her hands to your [pc.hips], getting her to help steady you while you start to ride that sweet shaft of hers. She’s so wet that it’s effortless to slide up and down her length, bouncing off her knot with every nadir.");
	if (pc.hasCock()) output(" Your own [pc.cock] slaps against her stomach, smearing the space between her perky tits with your own pre.");
	output(" Kaede’s sweet little moans echo through the spartan apartment, mixing with the wet slaps of flesh against flesh to form a lurid chorus.");
	
	output("\n\nYou play your hands up across Kaede’s chest, running your thumbs over her stiff teats; just a touch is enough to make her tremble, and her breasts perfectly fill your hands when you go to grope and squeeze them. Oh, they’re nice and tender, aren’t they? Perfect targets for your [pc.lips] to suckle and kiss.");
	
	output("\n\nWith just a little pressure on her chest, Kaede collapses back into the couch, taking you with her. Your bodies press together");
	if (pc.hasCock()) output(", grinding against your [pc.cocks]");
	output(", and her thighs wrap around your waist. You just keep riding her, moaning into her tits every time her knot batters your [pc.vagOrAss]. It’s so hard to resist taking that incredible stretch... and why should you? Kaede’s already riding her edge again, and all you’d need to join her is to feel that bitchbreaker lodge itself inside your [pc.vagOrAss].");
	
	output("\n\nGrinning down at the panting pup, you raise yourself up as high as you can go without entirely drawing her all the way out of you. She has just enough time to blink at you before you drop yourself straight back down her throbbing red rocket. Her fist-sized knot punches straight through");
	if (pc.hasVagina()) output(" your pussy’s lips");
	else output(" the ring of your ass");
	output(", forcing a scream of orgasmic pleasure from your [pc.lips]. Her dick immediately erupts, swelling within your walls as alabaster seed shoots up her rod and into your waiting");
	if (pc.hasVagina()) output(" womb");
	else output(" gut");
	output(".");
	if (pc.hasCock()) output(" Your [pc.cock] gives her a shower in return, squirting all over her tits and face as you grind on her knot. She giggles as ropes of [pc.cumColor] slap her cheeks, licking it off her lips as it rains down on her.");
	else output(" Your [pc.vagOrAss] hugs her throbbing erection tighter with ever spurt, letting the lightning-bolts of ecstasy plow through your body to the beat of her ejaculation.");
	
	output("\n\n<i>“O-oh fuck,”</i> Kaede groans,");
	if (pc.biggestTitSize() >= 2) output(" hiding her face in your cleavage");
	else output(" covering her face in her hands");
	output(". <i>“I can’t feel my legs...”</i>");
	
	output("\n\nThat’s fine. She’s not going anywhere with that knot buried in you. So you push her back against the couch and lock lips, telling her that she’d better get some rest... unless she’s ready to go again.");
	
	output("\n\nKaede taps the side of the couch and pulls you in against her. <i>“I’m out... just stay still, or I’m never gonna deflate...”</i>");

	processTime(20+rand(10));
	if (pc.hasVagina()) pc.loadInCunt(ppKaede, 0);
	else pc.loadInAss(ppKaede);
	pc.orgasm();
	IncrementFlag("KAEDE_FUCKED");

	clearMenu();
	addButton(0, "Next", extrameetKaedeDateMerge, true);
}

public function extrameetKaedePoundHer():void
{
	clearOutput();
	showKaede(true);

	output("You grab Kaede’s tight behind in both hands, hefting her up off the couch with you. She squeals and giggles, wrapping her legs around your waist - and thrusting her naked cock against your belly with every step you take towards her bedroom. Like the rest of her apartment, it’s fairly spartan, but the bed is big and soft and makes a delightful <i>pomf</i> sound when you sprawl the wagging ginger out on her belly. Her boots and pants come off with a few good yanks, each punctuated by a grope or a firm spank that leaves Kaede moaning by the time you get both hands on her bare behind and spread it open.");
	
	output("\n\nWhile you’re busy molesting her butt, Kaede stretches out towards the nightstand and pulls out a bottle of clear oil <i>“Let me get you started?”</i>");
	
	output("\n\nAlright. You roll Kaede over onto her back and crawl onto the bed over her, letting your hardening [pc.cock] drag over her own member and then up her flat belly, eventually stopping with your head nestled between her breasts. Kaede grins and upends the bottle into her cleavage and pressing her shoulders together to smear it up both mounds. While she’s got her tits pressed tight, you ease your [pc.hips] forward, thrusting your [pc.cock] into her tits.");
	
	output("\n\nKaede grins ear to ear as you start going at ‘em. <i>“Haha, Anno teases me about being too small... but I can still give a titfuck!”</i>");
	
	output("\n\nShe’s just right. While her hands are keeping her lubed-up cleavage nice and tight, you lock your hands onto the bed on either side of her, getting the leverage you need to hammer those tits. Every thrust slathers your [pc.cock] with more and more lube, until your cock’s glistening with oil and drooling pre between Kaede’s tits. The puppyslut leans in and gives your sodden crown a wet lick, slurping up the glaze of [pc.cum] like it’s the sweetest thing in the world.");
	
	output("\n\nYou dismount her after that, drawing your hands down over her lubed-up chest and squeezing Kaede’s tits until she squirms. her little red rocket wobbles under its own hardness, throbbing in the wind while you sink your fingers into its owner’s boobs and play with her diamond-hard teats. Might as well show her a little mercy, you figure, and you let your hands trace down her flanks before wrapping them around her quivering pillar.");
	
	output("\n\nYour lover’s back arches off the bed amidst gasps of pleasure as your hands start riding up her length. Your own [pc.cock] rubs against her thigh, steadily pressing up against Kaede’s booty until you can’t take the tension anymore. Leaving one hand to keep jacking Kaede off, you use the other to align yourself with Kaede’s lonely hole, prodding her winking star your [pc.hips] can force it in.");
	
	output("\n\nKaede cries out, a girly shriek of pleasure that ends with white cream spilling down your fingers. She squirms, trembling until the last drop of seed has been spilled. <i>“Fuuuuuck, not already,”</i> she sighs. <i>“J-just fuck me, I can keep going...”</i>");
	
	output("\n\nIf she’s sure, you’re more than happy to start pounding the poor pup’s");
	if (silly) output(" pooper");
	else output(" ass")
	output(". Her legs are already limp, easily spreading for you and letting you go [pc.knotBallsHilt]-deep. Kaede moans and claws at her bedsheets. Her whole body rocks backwards under the force of your thrust as you sheathe yourself inside her wickedly tight ass. Her cock can’t soften with you battering her prostate, and so it’s left to wobble back and forth every time you drive yourself into its owner, flicking bits of salty seed acros Kaede’s belly.");
	
	output("\n\nYou lean in and kiss her again, pressing her dick down between your bodies as your hands cup her cheeks.");
	
	output("\n\n<i>“You make me feel amazing,”</i> Kaede admits, grinning at you between kisses. <i>“Soooo good.”</i>");
	
	output("\n\nSame to her. While she’s all smiles and ecstasy, you take the opportunity to hook your arms around Kaede and flip her over, letting her finally plant her face in her pillows and wag her ass in the air for you. Her tail bats your cheeks until you pin it down over her back, giving you a peerless view of her cheeks spread around your [pc.cock]. Kaede grips her pillow in both hands, burying her face in its fluffy embrace while you resume pounding her ass.");
	
	output("\n\nHer hole accepts every thrust of your [pc.cock] with wet slurps and tight squeezes. Her dick bobs fore and back every time your [pc.hips] slap against her butt, dripping lube and pre down to the beat of your sodomy. Before long, you end up wrapping your arms around Kaede’s waist and lifting her up on her knees so you can kiss those sweet lips of hers again. She keeps hugging her pillow and moans whorishly until you get one hand around her dick and your [pc.lips] on hers.");
	
	output("\n\nHer body’s lean and light, and Kaede’s putty in your hands at the worst of times; while she’s in the throes of ecstasy you can man-handle her any which way you want. Whether it’s pile-driving her into the sheets, rolling her on her back and teething on those tits, or making her bounce in your lap, Kaede follows your lead without question. Her vigorous grip on your [pc.cock] ensures that by the time Kaede’s pressing herself against you and screaming that she’s cumming again, you’re finally ready to join her. You buck your [pc.hips] up into her taut rear, relishing in her screams of pleasure one last time");
	if (pc.hasKnot()) output(" as your [pc.knot] breaches her");
	output(".");
	
	output("\n\nAn arch of pearly white spooge flies from the tapered tip of Kaede’s cock, milked out by your relentless pounding of her ass-clitty. She grabs her breasts in both hands and bucks in your lap, pushing down to the hilt and squealing as your own [pc.cum] shoots inside her. Kaede’s whole body goes limp in your arms, all her muscles going slack while your empty your [pc.balls] into her. When her own orgasm runs dry, she just sinks back into your [pc.chest], letting you finish pumping her belly full of your own [pc.cumNoun].");
	
	output("\n\n<i>“I love this feeling...”</i> Kaede murmurs, interrupting herself with a little gasp as your [pc.cock] throbs inside her. <i>“Let me just stay like this...”</i>");

	processTime(20+rand(10));
	pc.orgasm();
	IncrementFlag("KAEDE_FUCKED");

	clearMenu();
	addButton(0, "Next", extrameetKaedeDateMerge);
}

public function extrameetKaedeDateMerge(gotKnotted:Boolean = false):void
{
	clearOutput();
	showKaede(true);

	output("You wake up a little while later, surrounded by the familiar smell of puppy spunk and sweat. Kaede’s still snoozing under you, but she’s easily awoken by a few gentle kisses up her neck, and a hand gently groping a boob. She blinks, then smiles, making a little whining sound at the back of her throat when your thumb brushes her soft nipple.");
	
	output("\n\n<i>“H-hey,”</i> she smiles. <i>“I’m glad you’re still here.”</i>");
	
	output("\n\n");
	if (gotKnotted) output("Not like you had much choice, but you didn’t plan on going anywhere.");
	else output("You wouldn’t just dash on the poor pup.");
	
	output("\n\nA blush spreads on her cheeks as the two of you disentangle and start searching for discarded clothes. Kaede’s tail never stops slapping your [pc.legs], growing more excited the less skin you’re showing, until you’re half convinced the ginger hound’s going to rip your kit right back off and plow you into the couch. Instead, she steals a kiss before vanishing into the kitchen, offering to make a quick snack before you both have to return to your respective ships.");
	
	output("\n\nA few minutes later you’re sitting across from your disheveled lover, enjoying a cup of something that resembles coffee over idle chatter - comparing your old Casstech to Kaede’s, reminiscing about your first meeting thanks to Anno, or about the dangers you’ve both faced in frontier space. At least in the afterglow, Kaede’s a much more relaxed conversationalist than usual, hardly even tripping over her own words... until a ring on her holo-terminal disrupts your moment of quietus.");
	
	output("\n\n<i>“Oh, shit, that’s the work ringtone. I gotta get that...”</i>");
	

	output("\n\nWell, good things can’t last in this world, can they? You give Kaede a goodbye hug and move to let yourself out.");
	
	if (flags["KAEDE_EXTRAMEET_DATE"] == undefined)
	{
		output(" Before you make it to the door, though, Kaede grabs your hand and says, <i>“Hey, I had a great time... let’s do it again, okay?”</i>");
		output("\n\nNow that <b>Kaede’s just an Extrameet message away</b>... you don’t doubt you’ll see her again real soon.");
		flags["KAEDE_EXTRAMEET_DATE"] = 1;
	}

	//Next, put PC next to Ilaria's bakery.
	processTime(5);
	clearMenu();
	addButton(0, "Next", move, "RESIDENTIAL DECK 17");
}