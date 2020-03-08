//JoyCo Magic-Milker 7
//Tooltip:
//"For expectant mammalian mothers or personal use. Please consult an expert in your species' physiology before inducing lactation."
//The JoyCo Magic Milker 7 looks like little more than an apple-sized sphere with an activation stud and two tiny, clear cups hanging off of metallic tubes. It seems that in order to use it, one nearly needs to hold it near exposed nipples and press the button. The machine will do the rest, even reshaping the cups to accommodate multiple nipples or revealing more in the case of particularly boobilicious users.
//Intro
public function joyCoMagicMilker7Sucks():void
{
	clearOutput();
	showName("MAGIC\nMILKER");
	
	var milkProduced:Number = pc.milkQ();
	
	output("Grabbing the Magic-Milker 7, a product of JoyCo, in your hand, you can’t help but marvel at the sleek, engineered surface. Two small, clear cups hang down from the glittering orb on umbilicals of polished metal, dangling limply, though you know they’ll spring to life as soon as you push the button on the central ball.");
	//No Top
	if(!pc.isChestGarbed()) 
	{
		if(pc.hasFuckableNipples()) output("\n\nYour " + pc.allBreastsDescript() + " are already bare to the world, and your [pc.nipples] have pursed up a bit from the chill. You’re not going to get any more ready for a quick, machine-assisted milking.");
		else output("\n\nYour " + pc.allBreastsDescript() + " are already bare to the world, and your [pc.nipples] have grown hard and a little crinkly from the chill. You’re not going to get any more ready for a quick, machine-assisted milking.");
	}
	//Has Top
	else 
	{
		if(pc.hasFuckableNipples()) output("\n\nYou peel your [pc.upperGarments] away from your " + pc.allBreastsDescript() + " and shiver as your [pc.nipples] purse up a bit in the cool air. There’s nothing between you and a quick, machine-assisted milking now.");
		else output("\n\nYou peel your [pc.upperGarments] away from your " + pc.allBreastsDescript() + " and shiver as your [pc.nipples] immediately perk up, crinkling in the chill air. There’s nothing between you and a quick, machine-assisted milking now.");
	}
	//Intro Pt II
	output("\n\nThe button audibly clicks under your thumb, and the miniaturized milker whirrs. Like someone waking from a long sleep, the machine’s tubes writhe and lift, barely coordinated. After a few seconds of this, they lift the cups up before you.");
	if(pc.totalBreasts() > 2) output(" A hatch on the Magic-Milker’s main body opens, and " + num2Text(pc.totalBreasts()-2) + " more milking cup" + ((pc.totalBreasts()-2) == 1 ? " emerges" : "s emerge") + " to complement the original pair, a tube for every single one of your breasts.");
	output(" The ");
	if(pc.totalBreasts() > 2) output("many ");
	output("milkers arrange themselves so that they’re hovering a scant few inches from your soon to be sucked nipples and pause as if considering their options or calculating something.");
	if(pc.hasFuckableNipples()) 
	{
		output("\n\nYou frown, and then coo and flinch slightly as the small cups reach out to gently brush over your [pc.nipples], then retract and reconfigure. Out of the centre of each grows a long, slim brown phallus with a pinpoint hole at the end, not a million miles away from an over-long baby bottle teat - although considerably harder, by the looks of it.");
		if(pc.hasCuntNipples()) output("\n\nThey thrust forward suddenly, spearing into your cunt nipples, and the cups snap themselves over your areolae, forming a seal. The protrusions feel warm inside your breasts, their tenderness amplified by the gentle, hissing suck of the vacuum on the outside until they are plush, wet and eager.");
		else output("\n\nThey slowly move forward, halting when their blunt tips are pressed against your plump lipples. They react instinctively, opening up to greedily suck them inside, making you gasp with their slutty willfulness.");
		output("\n\nArousal beginning to coil through you, you let go of the machine and cup yourself. It’s enough to support the weight of the whirring device as it activates, but the spherical device is only getting started. Rising to a higher-pitched whine, the milker judders - and that judder is translated straight down to the pseudo-dildos embedded in your boobs, vibrating stringently against the inner walls. Beguiling sensation sweeps through you, only getting stronger as the cups tug at the outer flesh and the nozzles at the teat tips begin to suck, aiming to draw out all of your [pc.milkNoun] before it can even be expressed.");
		if(pc.totalNipples() > 2) output(" With all the tubes hanging off your front, you find yourself wondering if this is what a cow feels like.");
		output("\n\nThe phalli pump vibrate you until your ");
		if(pc.hasCuntNipples()) output("cunt nipples");
		else output("lipples");
		output(" are plush and bee-stung, ready to convulse with orgasmic joy");
		if(pc.canMilkSquirt()) output(", already drooling [pc.milkNoun] in eager anticipation");
		output(". Then, it starts stuttering it in a staccato rhythm designed to maximum lactic stimulation.");
	}
	else 
	{
		output("\n\nYou sigh in anticipatory boredom; nothing slows the passage of time like waiting for a pleasant activity. In this case, time seems to be slogging through molasses, though only a few seconds have passed. The Magic-Milker 7 activates just as you’re inhaling a breath of fresh air, the cups snapping forward");
		if(pc.nipplesPerBreast > 1 || pc.nippleLength() > 1 || pc.nippleWidth() > 1.5) 
		{
			output(", expanding as they go to ");
			if(pc.nipplesPerBreast > 1) output("handle the multiple nipples your breasts house");
			else if(pc.nippleLength() > 1) output("handle the lengthy teats");
			else output("fat areolae");
		}
		output(". They feel warm and wet on your [pc.skinFurScales] hissing softly as they suck down against you, forming a perfect seal.");
		
		output("\n\nGasping, you let go of the machine and cup yourself, feeling your [pc.nipples] hardening from the gentle, almost imperceptible vacuum. It’s enough to support the weight of the whirring device as it activates, but the spherical device is only getting started. Rising to a higher-pitched whine, the milker smoothly cranks the suction up until your [pc.nipples] start swelling, immensely hard");
		if(pc.canMilkSquirt()) output(" and already dripping [pc.milkNoun]");
		else if(pc.milkFullness >= 50) output(" and glossy with barely-leaking [pc.milkNoun]");
		output(".");
		if(pc.totalBreasts() > 2) output(" With all the tubes hanging off your front, you find yourself wondering if this is what a cow feels like.");
		output("\n\nThe pump pulls tighter and tighter until it hits some kind of predefined vacuum-ceiling. Then, it starts stuttering the tugs into a staccato rhythm designed to maximize lactic stimulation. ");
	}
	//No new PG
	//Teats B' Dry Yo
	if(milkProduced < 100)
	{
		if(pc.hasFuckableNipples())
		{

			output("The sensation is wonderful, overpowering, and you are brought to a quivering boobgasm, making you snap your head back and yelp at the ");
			if(rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) output("ceiling");
			else output("sky");
			output(" as it pulses and quivers through you... but no [pc.milk] is forthcoming, no matter how ardently the milkers vibrate and suck you. You couldn’t care less. You sit there squirming with delight for at least fifteen minutes, the delightful erogenous zones you’ve grown upon your chest relentlessly stirred to at least three quaking highs, before finally the machine auto-shuts off. The moistened phalli click out, and the cups detach, shrinking back to their passive size. You’re left bare and sore, but deeply pleased.");
			output("\n\nA single, blue-tinged holographic display briefly emerges above the spent sphere. It reads:");
			output("\n\n<b>0 mL</b>");
			//Pass 20m + rand(5)
			processTime(20+rand(5));
			//Reset lust
			pc.orgasm();
			//BoostLactation by a tiny amount.
			pc.boostLactation(1);
		}
		else
		{
			output("It makes your pumped-up teats tingle more than a little as it tries to pull the [pc.milk] out of you, but nothing is coming. You sit there squirming for at least fifteen minutes, [pc.nipples] sweating only the barest residue of [pc.milk] before you’re forced to give up and press the deactivation button.");
			output("\n\nThe cups detach and shrink back to their passive size");
			if(pc.totalBreasts() > 2) output(", the extra arms withdrawing into the main chamber");
			output(", leaving your [pc.chest] bare and sore. A single, blue-tinged holographic display briefly emerges above the spent sphere. It reads:\n\n<b>0 mL.</b>");
			//Pass 20m + rand(5)
			processTime(20 + rand(5));
			//Raise lust by 10-15
			pc.changeLust(10+rand(5));
			//BoostLactation by a tiny amount.
			pc.boostLactation(1);
			//Nipples Enlarged
			if(pc.nippleWidthRatio < 2 && rand(5) == 0)
			{
				output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They’re wider for sure.</b>");
				pc.nippleWidthRatio += 0.1;
			}
			//Nipples Lengthened
			else if(pc.nippleLengthRatio < 3 && rand(3) == 0)
			{
				output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
				if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
				if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += 0.2;
				pc.nippleLengthRatio += 0.2;
			}
		}
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else
	{
		//Lactation Success: quantity low
		if(milkProduced < 300)
		{
			if(pc.hasFuckableNipples())
			{
				output("The sensation is wonderful, overpowering, and you are brought to a quivering boobgasm, making you snap your head back and yelp at the ");
				if(rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) output("ceiling");
				else output("sky");
				output(" as it pulses and quivers through you, and a thin amount of [pc.milk] gushes from your breasts, quickly suckled up by the dildo-nozzles. That, however, is as good as it manages, and despite the fact you’re stirred to repeated highs, and your [pc.nipples] wind up swollen and distended, they only manage mere drops, which are quickly hoovered up. Your [pc.fullChest] just aren’t very full right now, ");
				if(pc.biggestTitSize() >= 12) output("no matter how enormous they are or how they jiggle from the application of suction.");
				else output("perhaps if they were larger you could hold more.");
				output(" Eventually the moistened phalli click out, and the cups detach, shrinking back to their passive size. You’re left bare and sore, but deeply pleased. A small [pc.milkColor] baggie dangles from the back of the Magic-Milker 7, easily detached.");
				//Reset lust
				pc.orgasm();
				
			}
			else
			{
				output("It makes your [pc.nipples] visibly swell and distend, quickly gaining a moist shine as your body begins to let down. Trickles of liquid leak out one lazy drop at a time, hanging on your engorged tips before falling into the cups to be whisked away by the machine.");
				output("\n\nSome of the harder tugs earn tiny sprays of [pc.milk], but the streams are thin and insubstantial. Your [pc.fullChest] just aren’t very full right now, ");
				if(pc.biggestTitSize() >= 6) output("no matter how enormous they are or how they jiggle from the application of suction.");
				else output("perhaps if they were larger you could hold more.");
				output(" Still, it feels nice to be doing something, even if that something is leaning back and ensuring that every single drop of your body’s [pc.milk]-supply is thoroughly extracted. A small [pc.milkColor] baggie dangles from the back of the Magic-Milker 7 to hold it all.");
				pc.changeLust(10);
			}
		}
		//Lactation Success: quantity decent
		else if(milkProduced < 700)
		{
			if(pc.hasFuckableNipples())
			{
				output("You moan as a feeling of deep, wet release combines with the rising tide of boobgasm, and then squeal, fingers tightening into your [pc.chest] as it hits, a big gush of [pc.milk] escapes your breasts, suckled up adroitly by the dildo-nozzles. Your ");
				if(!pc.hasLipples()) output("nips");
				else output("lipples");
				output(" drip [pc.milkNoun] steadily in response to the stimulation, as if it were ");
				if(!pc.hasLipples()) output("pussy juices");
				else output("drool");
				output(", seizing up to release another big squirt of it as a second orgasm creases you up.");

				output("\n\nThe sloshing liquid foams slightly before the motor pulls it down the silver tubes to the main sphere. There, it’s collected into a clear back that dangles from the back of the device, turning [pc.milkColor] as hangs against your [pc.belly], filling. Eventually the moistened phalli click out, and the cups detach, shrinking back to their passive size. You’re left bare and sore, but deeply satiated.");
				//Reset lust
				pc.orgasm();
			}
			else
			{
				output("It makes your [pc.nipples] swell with soon-to-be released [pc.milkNoun], turning shiny and glossy a second before they start drooling into the cups. Those trickles turn into a series of rapidly expressed droplets and occasional squirts.");
				output("\n\nYou sigh at the feeling of release and watch the cups fill with the sloshing liquid. It foams slightly before the motor pulls it down the silver tubes to the main sphere. There, it is collected into a clear bag that dangles from the back of the device, turning [pc.milkColor] as it hangs against your [pc.belly], filling. You groan from the feeling of having your sensitive flesh so aggressively worked over and do the only thing you can in such a situation: enjoy every second of it.");
				pc.changeLust(25);
			}
		}
		//Lactation Success: quantity good
		else if(milkProduced <= 1000)
		{
			if(pc.hasFuckableNipples())
			{
				output("You moan as a feeling of deep, wet release combines with the rising tide of boobgasm, and then squeal, fingers tightening into your [pc.chest] as it hits, a big gush of [pc.milk] escapes your breasts, suckled up adroitly by the dildo-nozzles. Your ");
				if(!pc.hasLipples()) output("nips");
				else output("lipples");
				output(" squirt [pc.milkNoun] in response to the insistent stimulation, as if it were ");
				if(!pc.hasLipples()) output("pussy juices");
				else output("drool");
				output(", seizing up to release another big gout of it as a second orgasm creases you up.");

				output("\n\nIt’s intense beyond anything a human would normally experience, and you quickly get lost in it, eyes rolling as you’re stirred to repeated highs, enough [pc.milk] teased out of your breasts that it escapes your nipples and swells the squeezing cups [pc.milkColor]. It manages to cope with it adroitly though, vacuuming it all away to the swelling bag on the back side of the machine. You cup your [pc.chest], squeezing to coax out more, shuddering and moaning at each exquisite spurt of [pc.milk] only to have the next well up before you finish. Reveling in the act of giving and producing becomes your entire focus, and you let it subsume you while the device whisks your body’s juice away.");
				output("\n\nAt long last your boob ");
				if(!pc.hasLipples()) output("pussies");
				else output("mouths");
				output(" drool their last. The moistened phalli click out, and the cups detach, shrinking back to their passive size. Luxuriating in the afterglow, you consider the stretched bag of [pc.milk] propped up on your [pc.belly].");
				output("\n\nGetting milked is too damned good.");
				pc.orgasm();
				//reset lust
			}
			else
			{
				output("It makes your [pc.nipples] swell up a moment before they finally let down, gushing steady streams of [pc.milk], filling the cups while leaking drops from the tips. The flow seems steady and reliable, above terran norms by a decent amount.");
				output("\n\nYou groan at the intensity of the sensations you’re presented with, cupping your [pc.chest] behind the device and squeezing to coax out more, shuddering at each exquisite spurt of [pc.milk] only to have the next well up before you finish. Reveling in the act of giving and producing becomes your entire focus, and it subsumes you while the device whisks your body’s juice away. On the rear of the milker, a [pc.milkColor] bag has emerged. It hangs against your [pc.belly], half full and only getting fuller.");
				if(pc.hasCock()) output(" Down south, [pc.oneCock] has risen up, throbbing with hot desire and pressing against the bag, pinning it to your body while it expands.");
				output(" You whimper and tremble. Being milked is too damned good.");
				pc.changeLust(50+rand(10));
			}
		}
		//Lactation Success: quantity superhuman
		else if(milkProduced <= 4000 || pc.hasFuckableNipples())
		{
			if(!pc.hasFuckableNipples())
			{
				output("It makes your [pc.nipples] swell obscenely just before they finally burst, spraying streams of [pc.milk] into the accommodating cups, flooding them in superhuman amounts of liquid. Honestly, it could cut the suction in half, and you would gush just as hard. Your [pc.chest] are better at giving than most charities.");
				output("\n\nYou can’t stifle a " + pc.mf("groan","moan") + ", nor do you want to. You lean back, chest quivering, and give your full attention to the fluttering suckles of your [pc.nipples], rubbing along the undersides of your [pc.chest] to encourage the fluid-filled organs to release even more. Sharp tingles of sensation rise up with every staccato suck, and even when they relax, your [pc.nipples] thrum with tingles of titty-pleasing pleasure. If everyone in the galaxy knew how good they can feel, you’re certain you’d be surrounded in mooing milkmaids in no time.");
				output("\n\nWatching the [pc.milkColor] fluid vanish into the silvery tubes, you marvel at the engineering might displayed by the Magic-Milker. Someone at JoyCo did their job very - you gasp at a particularly potent surge of ecstasy - very right. A heavy, [pc.milkNoun]-filled bag has fallen out of the far side of the device to rest against your [pc.belly], and it’s rapidly filling with the [pc.milk] you’re producing.");
				if(pc.hasVagina() || pc.hasCock()) 
				{
					output(" You barely notice ");
					if(pc.hasVagina())
					{
						output("the [pc.girlCum] dripping from ");
						if(pc.legCount == 1) output("above your [pc.leg]");
						else output("between your [pc.legs]");
						if(pc.hasCock()) output(" or ");
					}
					if(pc.hasCock())
					{
						output("the turgid stiff");
						if(pc.cockTotal() > 1) output("ies");
						output(" pressing up against the underside of the bag, pulsating as ");
						if(pc.cockTotal() == 1) output("it’s");
						else output("they’re");
						output(" wreathed in barely-contained [pc.milk]");
					}
					output(".");
				}
				pc.changeLust(100);
			}
			else
			{
				output("You moan as a feeling of deep, wet release combines with the rising tide of boobgasm, and then squeal, fingers tightening into your [pc.chest] as it hits, a massive gush of [pc.milk] escapes your breasts, suckled up adroitly by the dildo-nozzles. Your ");
				if(!pc.hasLipples()) output("nips");
				else output("lipples");
				output(" gush [pc.milkNoun] in response to the insistent stimulation, as if it were ");
				if(!pc.hasLipples()) output("pussy juices");
				else output("drool");
				output(", seizing up to release another big gout of it as a second orgasm creases you up.");

				output("\n\nIt’s far too much for the phallus nozzles to easily hoover up, and the cups themselves swell hugely with escaped [pc.milkVisc] produce. Your [pc.tongue] lolls out of your mouth in ecstasy at finally releasing your massive mammary build-up at the same time as receiving such stimulation. Take it all, get it to take it all! You rub the undersides of your [pc.chest] to encourage the fluid-filled organs to release even more. Sharp tingles of sensation rise up with every staccato suck, and even when they relax, your [pc.nipples] thrum with tingles of pleasure.");
				output("\n\nAgain and again your tits are driven to orgasm, each time a big gush of glorious [pc.milkNoun] is sourced, and you are quickly lost in the sensuality of being such a juicy, fecund, productive titty monster. ");
				if(pc.hasLipples()) output("Your lipples suckle greedily on the vibrating pseudo-cocks, and your whole chest quivers with the pleasure of it");
				else output("Your pussy nipples clench down on the vibrating pseudo-cocks, and your whole chest quivers with the pleasure of it");
				output(". [pc.milkColor] fluid is endlessly vacuumed away down into the machine, engorging the bag beneath it - until at last it clips free, dropping into your [pc.legs], and another one begins to be filled.");
				if(pc.hasGenitals()) 
				{
					output(" You barely notice ");
					if(pc.hasVagina())
					{
						output("the [pc.girlCum] dripping from ");
						if(pc.legCount == 0) output("above your [pc.leg]");
						else output("between your [pc.legs]");
					}
					if(pc.hasVagina() && pc.hasCock()) output(" or ");
					if(pc.hasCock())
					{
						output("the turgid stiff");
						if(pc.cockTotal() > 1) output("ies");
						output(" pressing up against the underside of the bag, pulsating as ");
						if(pc.cockTotal() == 1) output("it’s");
						else output("they’re");
						output(" wreathed in barely-contained [pc.milk]");
					}
					output(".");
				}
				output(" There is nothing but the endless, inhuman pleasure seizing up your steadily draining tits.");

				output("\n\nAt long last your boob ");
				if(!pc.hasLipples()) output("pussies");
				else output("mouths");
				output(" drool their last. The moistened phalli click out, and the cups detach, shrinking back to their passive size. Luxuriating in the afterglow, you consider the stretched bag of [pc.milk] propped up on your [pc.belly].");
				output("\n\nGetting milked is too damned good.");
				pc.orgasm();
			}
		}
		//Lactation Success: quantity good for everybody else
		else
		{
			output("It makes your [pc.nipples] nearly double in size before they gush out [pc.milk] like fire hoses, spraying against the inside of the cups with enough force to nearly pop them off. The durable little milker hangs on for dear life in spite of your torrential lactation.");
			output("\n\nThere’s no way to describe the pleasure and relief that expressing so much [pc.milk] gives you. Instead, you slump down to the ground and moan, writhing in place, your hands feverishly groping and squeezing encouragingly at your [pc.chest]. The gurgling sounds the Magic-Milker makes as it works are drowned out by your own vocalizations of pleasure, and your eyes roll back from bliss, not bothering to watch the [pc.milkColor] fluid drain away into a bag on the back-end of the device. Shocks of ecstatic pleasure jostle and jiggle your leaking teats as you stagger through one boobquaking orgasm after another, leaving your head fuzzy with pleasure-static and thoughts of giving your [pc.milk] again and again.");
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		
		var bagPops:Boolean = (milkProduced >= 3000 && rand(4) != 0);
		
		//Bag Pops Cause Yer Hyper Milky
		if(bagPops)
		{
			if(pc.hasLipples())
			{
				output("\n\nThe plastic bag has sprung a leak, and has soaked you from the waist down in [pc.milk]. You didn’t even notice, you were that into it. Even now, considering the mess you’ve caused and the [pc.milkFlavor] produce wasted, you’re finding it difficult to care. Another pleasurable throb echoes through you, making you coo woozily.");

			}
			else
			{
				output("\n\nThe plastic bag expands and expands... and expands, every wrinkle on its surface vanishing while it’s pulled tight by the voluminous fluid inside. It audibly creaks, and for a second, you think it’s going to pop. Then, it springs a leak in the corner, gushing [pc.milk] out onto the ground. That leak is rapidly joined by another in the opposite corner, and then the whole bottom of the bag gives out, soaking you from the waist down in your own [pc.milkColor] liquid.");
				output("\n\nOf course, the pump keeps going on as if nothing happened, and you’re too into it to mind a little mess.");
			}
		}
		//Liter readout for cool kids that don't look at explosions.
		output("\n\n");
		if(!pc.hasFuckableNipples())
		{
			output("The Magic-Milker 7 tugs your teats until they’re inflamed and sore. Every single drop that you have to give has been taken");
			if(!bagPops)
			{
				if(milkProduced < 3000) output(" and bagged.");
				else
				{
					output(" and bagged--though being as productive as you are, some [pc.milkNoun] has spilled out of the machine, creating");
					if(milkProduced < 4000) output(" a small");
					else if(milkProduced < 7000) output(" a noticeable");
					else if(milkProduced < 10000) output(" a large");
					else output(" a sizeable");
					output(" [pc.milkColor] puddle underneath you.");
				}
			}
			else output(", bagged, and spilled.");
			output(" Detecting this, it turns off and withdraws the cup-tipped arms from your [pc.fullChest]. ");
		}
		output("A blue-tinged holographic appears above the orb, reading:\n\n<b>" + Math.round(milkProduced) + " mLs.</b>");
		
		//Nipples Enlarged
		if(pc.nippleWidthRatio < 2 && rand(5) == 0)
		{
			output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They’re wider for sure.</b>");
			pc.nippleWidthRatio += 0.1;
		}
		//Nipples Lengthened
		else if(!pc.hasFuckableNipples() && pc.nippleLengthRatio < 3 && rand(3) == 0)
		{
			output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
			if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += 0.2;
			pc.nippleLengthRatio += 0.2;
		}
		//Get Milk Item
		if(!bagPops)
		{
			var foundLootItems:Array = [];
			var fluidType:Number = pc.milkType;
			var quantity:Number = 1;
			var i:int = 0;
			
			var cycleBagging:Boolean = false;
			
			if(!cycleBagging)
			{
				foundLootItems.push(createMilkBag(fluidType, milkProduced, quantity));
			}
			else
			{
				if(milkProduced >= 2100)
				{
					quantity = Math.floor(milkProduced / 2100);
					if(quantity > 6) quantity = 6;
					foundLootItems.push(createMilkBag(fluidType, 2100, quantity));
					milkProduced -= (2100 * quantity);
				}
				if(milkProduced >= 1400)
				{
					quantity = Math.floor(milkProduced / 1400);
					if(quantity > 10) quantity = 10;
					foundLootItems.push(createMilkBag(fluidType, 1400, quantity));
					milkProduced -= (1400 * quantity);
				}
				if(milkProduced >= 700)
				{
					quantity = Math.floor(milkProduced / 700);
					if(quantity > 15) quantity = 15;
					foundLootItems.push(createMilkBag(fluidType, 700, quantity));
					milkProduced -= (700 * quantity);
				}
				if(milkProduced >= 100)
				{
					quantity = Math.floor(milkProduced / 100);
					if(quantity > 30) quantity = 30;
					foundLootItems.push(createMilkBag(fluidType, 100, quantity));
					milkProduced -= (100 * quantity);
				}
			}
			
			output("\n\n");
			if(foundLootItems.length == 1 && foundLootItems[0].quantity == 1) output("The bag seals off, leaving you with " + foundLootItems[0].description + ".");
			else if(foundLootItems.length > 0)
			{
				output("The machine finishes its packaging, leaving you with ");
				var numBags:int = 0;
				var diffSize:int = foundLootItems[0].fullnessLevel;
				for(i = 0; i < foundLootItems.length; i++)
				{
					numBags += foundLootItems[i].quantity;
					if(i != 0 && foundLootItems[i].fullnessLevel != diffSize) diffSize = foundLootItems[i].fullnessLevel;
				}
				switch(numBags)
				{
					case 1: output(" a bag"); break;
					case 2: output(" a couple bags"); break;
					case 3: output(" a few bags"); break;
					case 4: output(" some bags"); break;
					default: output(" several bags"); break;
				}
				output(" of " + GLOBAL.FLUID_TYPE_NAMES[fluidType].toLowerCase());
				if(numBags > 1 && diffSize != foundLootItems[0].fullnessLevel) output(" in various sizes");
				output(".");
			}
			else output("The machine finishes its packaging, leaving you with nothing at all!");
			output("\n\n");
			
			if(foundLootItems.length > 0)
			{
				itemScreen = mainGameMenu;
				lootScreen = mainGameMenu;
				useItemFunction = mainGameMenu;
				//Start loot
				itemCollect(foundLootItems);
			}
			else
			{
				clearMenu();
				addButton(0,"Next",mainGameMenu);
			}
		}
		else
		{
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		processTime(20+rand(5));
		pc.milked(pc.milkFullness);
	}
}
public function createMilkBag(fluidType:Number, milkProduced:Number, quantity:Number = 1):ItemSlotClass
{
	var milkBag:MilkBag = new MilkBag();
	
	milkBag.fluidType = fluidType;
	if(milkProduced < 700)
	{
		milkBag.shortName = "S." + GLOBAL.FLUID_TYPE_SHORT[fluidType] + "Bag";
		milkBag.longName = "small bag of " + GLOBAL.FLUID_TYPE_NAMES[fluidType].toLowerCase();
		milkBag.fullnessLevel = 1;
		milkBag.stackSize = 30;
		milkBag.basePrice = 2;
	}
	else if(milkProduced < 1400)
	{
		milkBag.shortName = "M." + GLOBAL.FLUID_TYPE_SHORT[fluidType] + "Bag";
		milkBag.longName = "medium bag of " + GLOBAL.FLUID_TYPE_NAMES[fluidType].toLowerCase();
		milkBag.fullnessLevel = 2;
		milkBag.stackSize = 15;
		milkBag.basePrice = 4;
	}
	else if(milkProduced < 2100)
	{
		milkBag.shortName = "L." + GLOBAL.FLUID_TYPE_SHORT[fluidType] + "Bag";
		milkBag.longName = "large bag of " + GLOBAL.FLUID_TYPE_NAMES[fluidType].toLowerCase();
		milkBag.fullnessLevel = 3;
		milkBag.stackSize = 10;
		milkBag.basePrice = 6;
	}
	else
	{
		milkBag.shortName = "X." + GLOBAL.FLUID_TYPE_SHORT[fluidType] + "Bag";
		milkBag.longName = "full bag of " + GLOBAL.FLUID_TYPE_NAMES[fluidType].toLowerCase();
		milkBag.fullnessLevel = 4;
		milkBag.stackSize = 6;
		milkBag.basePrice = 10;
	}
	milkBag.description = indefiniteArticle(milkBag.longName);
	milkBag.tooltip = "[altTooltipMilkBag]" + milkBagTooltipBonus(milkBag);
	
	TooltipManager.addFullName(milkBag.shortName, StringUtil.toTitleCase(milkBag.longName));
	TooltipManager.addTooltip(milkBag.shortName, milkBag.tooltip);
	
	//Milk items probably just good for selling. Value relatively low for normal milk but honey is worth 2x milk, and maybe other more exotic lactations could also get value boosts?
	//Set value and adjust descs
	milkBag.quantity = quantity;
	milkBag.basePrice = fluidValue(fluidType, milkBag.basePrice);
	milkBag.hasUniqueName = true;
	milkBag.hasRandomProperties = true;
	
	return milkBag;
}
public function altTooltipMilkBag():String
{
	var tooltip:String = "This bag was filled from a Magic-Milker 7, a product of JoyCo. JoyCo makes no guarantees of the quality or safety of the fluid this bag contains.";
	tooltip += "\n\nThe value of this item will vary depending on its level of fullness and the fluid inside, though most liquids will never bypass basic commodity levels.";
	return tooltip;
}
public function milkBagTooltipBonus(milkBag:MilkBag):String
{
	var tooltip:String = "\n";
	tooltip += "\n<b>Fluid Type:</b> " + ((milkBag.fluidType >= 0 && milkBag.fluidType < GLOBAL.FLUID_TYPE_NAMES.length) ? GLOBAL.FLUID_TYPE_NAMES[milkBag.fluidType] : "<i>Unknown</i>");
	tooltip += "\n<b>Fullness:</b> ";
	switch(milkBag.fullnessLevel)
	{
		case 0: tooltip += "Empty"; break;
		case 1: tooltip += "Not Very Full"; break;
		case 2: tooltip += "Somewhat Full"; break;
		case 3: tooltip += "Mostly Full"; break;
		case 4: tooltip += "Dangerously Full"; break;
		default: tooltip += "<i>Unknown</i>"; break;
	}
	return tooltip;
}

// Alter fluid's total value with a rarity multiplier! (put at the end of fluid calculations.)
public function fluidValue(fluidType:Number = -1, basePrice:Number = 0):Number
{
	if(fluidType < 0) return 0;
	
	var rarity:Number = 1;
	
	switch(fluidType)
	{
		case GLOBAL.FLUID_TYPE_OIL:
			rarity = 0.5;
			break;
		case GLOBAL.FLUID_TYPE_MILK:
		case GLOBAL.FLUID_TYPE_CUM:
		case GLOBAL.FLUID_TYPE_GIRLCUM:
			rarity = 1;
			break;
		case GLOBAL.FLUID_TYPE_SPECIAL_GOO:
		case GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO:
		case GLOBAL.FLUID_TYPE_HRAD_CUM:
			rarity = 1.25;
			break;
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
		case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
		case GLOBAL.FLUID_TYPE_VANILLA:
		case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
			rarity = 1.5;
			break;
		case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
		case GLOBAL.FLUID_TYPE_SYDIAN_CUM:
		case GLOBAL.FLUID_TYPE_GABILANI_CUM:
		case GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM:
		case GLOBAL.FLUID_TYPE_NYREA_CUM:
		case GLOBAL.FLUID_TYPE_NYREA_GIRLCUM:
		case GLOBAL.FLUID_TYPE_EGGNOG:
		case GLOBAL.FLUID_TYPE_PEPPERMINT:
			rarity = 1.75;
			break;
		case GLOBAL.FLUID_TYPE_HONEY:
		case GLOBAL.FLUID_TYPE_MILKSAP:
		case GLOBAL.FLUID_TYPE_CUMSAP:
		case GLOBAL.FLUID_TYPE_FRUIT_CUM:
		case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
			rarity = 2;
			break;
		case GLOBAL.FLUID_TYPE_NECTAR:
		case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
		case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
			rarity = 2.25;
			break;
		case GLOBAL.FLUID_TYPE_VANAE_CUM:
			rarity = 2.5;
			break;
	}
	
	return Math.round(basePrice * rarity);
}
// To return only the fluid's rarity multiplier.
public function fluidRarity(fluidType:Number = -1):Number
{
	if(fluidType < 0) return 1;
	return fluidValue(fluidType, 1);
}

