import classes.Items.Miscellaneous.MilkBag;

//JoyCo Magic-Milker 7
//Tooltip:
//"For expectant mammalian mothers or personal use. Please consult an expert in your species' physiology before inducing lactation."
//The JoyCo Magic Milker 7 looks like little more than an apple-sized sphere with an activation stud and two tiny, clear cups hanging off of metallic tubes. It seems that in order to use it, one nearly needs to hold it near exposed nipples and press the button. The machine will do the rest, even reshaping the cups to accommodate multiple nipples or revealing more in the case of particularly boobilicious users.
//Intro
public function joyCoMagicMilker7Sucks():void
{
	clearOutput();
	var milkProduced:Number = pc.milkQ();
	output("Grabbing the Magic-Milker 7, a product of JoyCo, in your hand, you can't help but marvel at the sleek, engineered surface. Two small, clear cups hang down from the glittering orb on umbilicals of polished metal, dangling limply, though you know they'll spring to life as soon as you push the button on the central ball.");
	//No Top
	if(!pc.isChestGarbed()) output("\n\nYour " + pc.allBreastsDescript() + " are already bare to the world, and your [pc.nipples] have grown hard and a little crinkly from the chill. You're not going to get any more ready for a quick, machine-assisted milking.");
	//Has Top
	else output("\n\nYou peel your [pc.upperGarments] away from your " + pc.allBreastsDescript() + " and shiver as your [pc.nipples] immediately perk up, crinkling in the chill air. There's nothing between you and a quick, machine-assisted milking now.");
	//Intro Pt II
	output("\n\nThe button audibly clicks under your thumb, and the miniaturized milker whirrs. Like someone waking from a long sleep, the machine's tubes writhe and lift, barely coordinated. After a few seconds of this, they lift the cups up before you.");
	if(pc.totalBreasts() > 2) output(" A hatch on the Magic-Milker's main body opens, and " + num2Text(pc.totalBreasts()-2) + " more milking cups emerge to compliment the original pair, one for every single one of your breasts.");
	output(" The ");
	if(pc.totalBreasts() > 2) output("many ");
	output("milkers arrange themselves so that they're hovering a scant few inches from your soon to be sucked nipples and pause as if considering their options or calculating something.");
	output("\n\nYou sigh in anticipatory boredom; nothing slows the passage of time like waiting for a pleasant activity. In this case, time seems to be slogging through molasses, though only a few seconds have passed. The Magic-Milker 7 activates just as you're inhaling a breath of fresh air, the cups snapping forward");
	if(pc.nipplesPerBreast > 1 || pc.nippleLength() > 1 || pc.nippleWidth() > 1.5) 
	{
		output(", expanding as they go to ");
		if(pc.nipplesPerBreast > 1) output("handle the multiple nipples your breasts house");
		else if(pc.nippleLength() > 1) output("handle the lengthy teats");
		else output("fat areolae");
	}
	output(". They feel warm and wet on your [pc.skinFurScales] hissing softly as they suck down against you, forming a perfect seal.");
	output("\n\nGasping, you let go of the machine and cup yourself, feeling your [pc.nipples] hardening from the gentle, almost imperceptible vacuum. It's enough to support the weight of the whirring device as it activates, but the spherical device is only getting started. Rising to a higher-pitched whine, the milker smoothly cranks the suction up until your [pc.nipples] start swelling, immensely hard");
	if(pc.canMilkSquirt()) output(" and already dripping [pc.milkNoun]");
	else if(pc.milkFullness >= 50) output(" and glossy with barely-leaking [pc.milkNoun]");
	output(".");
	if(pc.totalBreasts() > 2) output(" With all the tubes hanging off your front, you find yourself wondering if this is what a cow feels like.");
	output("\n\nThe pump pulls tighter and tighter until it hits some kind of predefined vacuum-ceiling. Then, it starts stuttering the tugs into a staccato rhythm designed to maximize lactic stimulation. ");
	//No new PG
	//Teats B' Dry Yo
	if(milkProduced < 100)
	{
		output("It makes your pumped-up teats tingle more than a little as it tries to pull the [pc.milk] out of you, but nothing is coming. You sit there squirming for at least fifteen minutes, [pc.nipples] sweating only the barest residue of [pc.milk] before you're forced to give up and press the deactivation button.");
		output("\n\nThe cups detach and shrink back to their passive size");
		if(pc.totalBreasts() > 2) output(", the extra arms withdrawing into the main chamber");
		output(", leaving your [pc.chest] bare and sore. A single, blue-tinged holographic display briefly emerges above the spent sphere. It reads:\n\n<b>0 mL.</b>");
		//Pass 20m + rand(5)
		processTime(20 + rand(5));
		//Raise lust by 10-15
		pc.lust(10+rand(5));
		//BoostLactation by a tiny amount.
		pc.boostLactation(1);
		//Nipples Enlarged
		if(pc.nippleWidthRatio < 2 && rand(5) == 0)
		{
			output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They're wider for sure.</b>");
			pc.nippleWidthRatio += .1;
		}
		//Nipples Lengthened
		else if(pc.nippleLengthRatio < 3 && rand(3) == 0)
		{
			output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
			if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += .2;
			pc.nippleLengthRatio += .2;
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
			output("It makes your [pc.nipples] visibly swell and distend, quickly gaining a moist shine as your body begins to let down. Trickles of liquid leak out one lazy drop at a time, hanging on your engorged tips before falling into the cups to be whisked away by the machine.");
			output("\n\nSome of the harder tugs earn tiny sprays of [pc.milk], but the streams are thin and insubstantial. Your [pc.fullChest] just aren't very full right now, ");
			if(pc.biggestTitSize() >= 6) output("no matter how enormous they are or how they jiggle from the application of suction.");
			else output("perhaps if they were larger you could hold more.");
			output(" Still, it feels nice to be doing something, even if that something is leaning back and ensuring that every single drop of your body's [pc.milk]-supply is thoroughly extracted. A small [pc.milkColor] baggie dangles from the back of the Magic-Milker 7 to hold it all.");
			pc.lust(10);
		}
		//Lactation Success: quantity decent
		else if(milkProduced < 700)
		{
			output("It makes your [pc.nipples] swell with soon-to-be released [pc.milkNoun], turning shiny and glossy a second before they start drooling into the cups. Those trickles turn into a series of rapidly expressed droplets and occasional squirts.");
			output("\n\nYou sigh at the feeling of release and watch the cups fill with the sloshing liquid. It foams slightly before the motor pulls it down the silver tubes to the main sphere. There, it is collected into a clear bag that dangles from the back of the device, turning [pc.milkColor] as it hangs against your [pc.belly], filling. You groan from the feeling of having your sensitive flesh so aggressively worked over and do the only thing you can in such a situation: enjoy every second of it.");
			pc.lust(25);
		}
		//Lactation Success: quantity good
		else if(milkProduced <= 1000)
		{
			output("It makes your [pc.nipples] swell up a moment before they finally let down, gushing steady streams of [pc.milk], filling the cups while leaking drops from the tips. The flow seems steady and reliable, above terran norms by a decent amount.");
			output("\n\nYou groan at the intensity of the sensations you're presented with, cupping your [pc.chest] behind the device and squeezing to coax out more, shuddering at each exquisite spurt of [pc.milk] only to have the next well up before you finish. Reveling in the act of giving and producing becomes your entire focus, and it subsumes you while the device whisks your body's juice away. On the rear of the milker, a [pc.milkColor] bag has emerged. It hangs against your [pc.belly], half full and only getting fuller.");
			if(pc.hasCock()) output(" Down south, [pc.oneCock] has risen up, throbbing with hot desire and pressing against the bag, pinning it to your body while it expands.");
			output(" You whimper and tremble. Being milked is too damned good.");
			pc.lust(50+rand(10));
		}
		//Lactation Success: quantity superhuman
		else if(milkProduced <= 4000)
		{
			output("It makes your [pc.nipples] swell obscenely just before they finally burst, spraying streams of [pc.milk] into the accommodating cups, flooding them in superhuman amounts of liquid. Honestly, it could cut the suction in half, and you would gush just as hard. Your [pc.chest] are better at giving than most charities.");
			output("\n\nYou can't stifle a " + pc.mf("groan","moan") + ", nor do you want to. You lean back, chest quivering, and give your full attention to the fluttering suckles of your [pc.nipples], rubbing along the undersides of your [pc.chest] to encourage the fluid-filled organs to release even more. Sharp tingles of sensation rise up with every staccato suck, and even when they relax, your [pc.nipples] thrum with tingles of titty-pleasing pleasure. If everyone in the galaxy knew how good they can feel, you're certain you'd be surrounded in mooing milkmaids in no time.");
			output("\n\nWatching the [pc.milkColor] fluid vanish into the silvery tubes, you marvel at the engineering might displayed by the Magic-Milker. Someone at JoyCo did their job very - you gasp at a particularly potent surge of ecstasy - very right. A heavy, [pc.milkNoun]-filled bag has fallen out of the far side of the device to rest against your [pc.belly], and it's rapidly filling with the [pc.milk] you're producing.");
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
					if(pc.cockTotal() == 1) output("it's");
					else output("they're");
					output(" wreathed in barely-contained [pc.milk]");
				}
				output(".");
			}
			pc.lust(100);
		}
		//Lactation Success: quantity good for everybody else
		else
		{
			output("It makes your [pc.nipples] nearly double in size before they gush out [pc.milk] like fire hoses, spraying against the inside of the cups with enough force to nearly pop them off. The durable little milker hangs on for dear life in spite of your torrential lactation.");
			output("\n\nThere's no way to describe the pleasure and relief that expressing so much [pc.milk] gives you. Instead, you slump down to the ground and moan, writhing in place, your hands feverishly groping and squeezing encouragingly at your [pc.chest]. The gurgling sounds the Magic-Milker makes as it works are drowned out by your own vocalizations of pleasure, and your eyes roll back from bliss, not bothering to watch the [pc.milkColor] fluid drain away into a bag on the back-end of the device. Shocks of ecstatic pleasure jostle and jiggle your leaking teats as you stagger through one boobquaking orgasm after another, leaving your head fuzzy with pleasure-static and thoughts of giving your [pc.milk] again and again.");
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		//Bag Pops Cause Yer Hyper Milky
		if(milkProduced >= 3000)
		{
			output("\n\nThe plastic bag expands and expands... and expands, every wrinkle on its surface vanishing while it's pulled tight by the voluminous fluid inside. It audibly creaks, and for a second, you think it's going to pop. Then, it springs a leak in the corner, gushing [pc.milk] out onto the ground. That leak is rapidly joined by another in the opposite corner, and then the whole bottom of the bag gives out, soaking you from the waist down in your own [pc.milkColor] liquid.");
			output("\n\nOf course, the pump keeps going on as if nothing happened, and you're too into it to mind a little mess.");
		}
		//Liter readout for cool kids that don't look at explosions.
		output("\n\nThe Magic-Milker 7 tugs your teats until they're inflamed and sore. Every single drop that you have to give has been taken");
		if(milkProduced < 3000) output(" and bagged.");
		else output(", bagged, and spilled.");
		output(" Detecting this, it turns off and withdraws the cup-tipped arms from your [pc.fullChest]. A blue-tinged holographic appears above the orb, reading:\n\n<b>" + Math.round(milkProduced) + " mLs.</b>");
		//Nipples Enlarged
		if(pc.nippleWidthRatio < 2 && rand(5) == 0)
		{
			output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They're wider for sure.</b>");
			pc.nippleWidthRatio += .1;
		}
		//Nipples Lengthened
		else if(pc.nippleLengthRatio < 3 && rand(3) == 0)
		{
			output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
			if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += .2;
			pc.nippleLengthRatio += .2;
		}
		//Get Milk Item
		if(milkProduced < 3000)
		{
			var foundLootItems:Array = [];
			foundLootItems.push(new MilkBag());
			output("\n\nThe bag seals off, leaving you with");
			foundLootItems[0].hasRandomProperties = true;
			if(milkProduced < 700) 
			{
				foundLootItems[0].shortName = "S." + GLOBAL.FLUID_TYPE_SHORT[pc.milkType] + "Bag";
				foundLootItems[0].stackSize = 30;
				foundLootItems[0].longName = "small bag of " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType].toLowerCase();
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Not Very Full";
				foundLootItems[0].basePrice = 2;
			}
			else if(milkProduced <= 1400) 
			{
				foundLootItems[0].shortName = "M." + GLOBAL.FLUID_TYPE_SHORT[pc.milkType] + "Bag";
				foundLootItems[0].stackSize = 15;
				foundLootItems[0].longName = "medium bag of " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType].toLowerCase();
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Somewhat Full";
				foundLootItems[0].basePrice = 4;
			}
			else if(milkProduced <= 2100) 
			{
				foundLootItems[0].shortName = "L." + GLOBAL.FLUID_TYPE_SHORT[pc.milkType] + "Bag";
				foundLootItems[0].stackSize = 10;
				foundLootItems[0].longName = "large bag of " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType].toLowerCase();
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Mostly Full";
				foundLootItems[0].basePrice = 6;
			}
			else 
			{
				foundLootItems[0].shortName = "X." + GLOBAL.FLUID_TYPE_SHORT[pc.milkType] + "Bag";
				foundLootItems[0].stackSize = 6;
				foundLootItems[0].longName = "full bag of " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType].toLowerCase();
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Dangerously Full";
				foundLootItems[0].basePrice = 10;
			}
			foundLootItems[0].description = indefiniteArticle(foundLootItems[0].longName);
			
			TooltipManager.addFullName(foundLootItems[0].shortName, StringUtil.toTitleCase(foundLootItems[0].longName));
			TooltipManager.addTooltip(foundLootItems[0].shortName, foundLootItems[0].tooltip);
			
			output(" " + foundLootItems[0].description + ".");
			output("\n\n");
			//Milk items probably just good for selling. Value relatively low for normal milk but honey is worth 2x milk, and maybe other more exotic lactations could also get value boosts?
			//Set value and adjust descs
			if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY)
			{
				foundLootItems[0].basePrice *= 2;
			}
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
		pc.milked(pc.milkFullness);
		processTime(20+rand(5));
	}
}