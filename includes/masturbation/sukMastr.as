public function useTheSuckMasta():void
{
	//Too pumped!
	if(pumpedCunts() >= pc.totalVaginas())
	{
		clearOutput();
		output("You're too pumped up! The instant you fit the cup over [pc.oneVagina], you've already filled it. ");
		if(pc.totalVaginas() == 1) output("It is ");
		else output("They're simply ");
		output("too swollen.");
		clearMenu();
		addButton(0,"Next",masturbateMenu);
		return;
	}
	if(pc.totalVaginas() > 1)
	{
		clearOutput();
		showName("WHICH\nVAGINA?");
		clearMenu();
		output("Which vagina will you pump up?");
		output("\n");
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			output("\n" + (x + 1) + ": " + StringUtil.upperCase(pc.vaginaNoun2(pc.vaginas[0], false)));
			addButton(x,"#" + (x+1),properlyUseTheSukmastr,x,"#" + (x+1),"Use it on your [pc.vagina " + x + "].");
		}
		addButton(14,"Back",masturbateMenu);
	}
	
	properlyUseTheSukmastr(0);
}
public function pumpedCunts(both:Boolean = false):Number
{
	var count:int = 0;
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED)) count++;
		else if(both && pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) count++;
	}
	return count;
}

public function properlyUseTheSukmastr(x:int = 0):void
{
	clearOutput();
	showName("SUKMASTR\n2000");
	//Not on ship
	if(!InShipInterior()) output("You might not be in the comforting privacy of your own quarters, but that doesn’t mean you can’t put your portable pussy-pumper to work.");
	//Ship
	else output("There’s no matter place to indulge yourself with an expensive sextoy than in the privacy of your own quarters.");
	//Merge, no new pg
	output(" Pulling the SukMastr 2000 out");
	if(!pc.isCrotchExposed()) output(", and your clothing off");
	output(", you ");
	if(!InShipInterior()) output("find a comfortable spot to sprawl");
	else output("sprawl across your bunk");
	
	//Pumped pussy
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) || pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
	{
		output(", delighted to discover that the cunt-moulded cup in your hand will still fit over your expanded pussy, allowing you to pump it up once more. Best of all, the cup still lingers with your residual scent");
		if(flags["PUMPED_KIRO_PUSSY"] != undefined) output(" alongside Kiro's muskier, rich aroma");
		output(". The sensuous smell instantly ");
	}
	else if(flags["PUMPED_KIRO_PUSSY"] != undefined) 
	{
		output(", delighted to discover that the cunt-moulded cup in your hand still smells vaguely of Kiro’s luscious pussy. It’s a heady aroma that instantly ");
	}
	//Used before
	else if(flags["SUKMASTRED"] != undefined) output(", delighted to discover a hint of lingering, salacious scent, the evidence of your previous play. It's a heady aroma that instantly ");
	//Catch-all
	else output(", delighted to discover that the cunt-moulded cup comes pre-treated with a dusting concentrated doh'rahn pheromones. It's a heady, musky aroma that instantly ");
	if(pc.hasCock())
	{
		if(pc.lust() >= 75) output("induces your [pc.cocks] to throb ");
		else output("stiffens your [pc.cocks] and ");
	}
	output("enflames the target of ");
	if(hours >= 6 && hours <= 17) output("today");
	else if(hours > 17 || hours < 3) output("tonight");
	else output("this morning");
	output("’s endeavor - your [pc.vaginas]");
	if(pc.lust() < 50) output(", making the lips puffy and sensitive.");
	else
	{
		output(", delighted to feel your ");
		if(pc.vaginas[x].wetness() < 3) output("moistening");
		else if(pc.vaginas[x].wetness() < 4) output("constantly-wet");
		else output("dripping-wet");
		output(" lips squishing and sliding against each other with every movement of your body. You haven’t even pumped them yet, and they’re already so sensitive and puffy!");
	}

	output("\n\nYou rub the edges of the pump’s lewdly shaped cup against [pc.oneVagina], teasing yourself with the cool, hard edge. An involuntary shiver climbs up between your shoulder blades at first but quickly fades beneath the heady tightness of your arousal, allowing you to enjoy the touch of the rapidly warming plastic. ");
	if(pc.lust() >= 75 || pc.vaginas[x].wetness() >= 3) output("It’s so slick with your drooling lubricant that it slips and slides all over your mons with a minimum of effort, bumping your [pc.clits] in an entirely pleasant way.");
	else 
	{
		output("It grows slick with your lusty lubricant before long, allowing you to slip and slide it across your most sensitive places. As a result, your [pc.clits] ");
		if(pc.totalClits() == 1) output("is");
		else output("are");
		output(" soon ");
		if(pc.clitLength >= 3) output("rock-hard");
		else output("firm");
		output(" and aglow with pleasure.");
	}
	output("\n\nOne meaningful wiggle later, and the cup is nestling snugly around ");
	if(pc.totalVaginas() == 1) output("your");
	else output("the lucky");
	output(" mound, giving you the appearance of a transparent and obscenely-inflated terran pussy superimposed atop your ");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("partially-inflated one");
	else if(pc.vaginas[x].type == GLOBAL.TYPE_HUMAN) output("natural one");
	else output("less-than-human original");
	output(". It feels weird, putting all the pressure around the exterior of your vagina, like you’re a teenager still learning where and how to touch yourself.");
	if(pc.clitLength >= 3)
	{
		output(" The jumbo-sized clit");
		if(pc.totalClits() > 1) output("s don’t");
		else output(" doesn’t");
		output(" help either, all wobbly and hyper-sensitive. The cup won’t fit over such a sausage, so you’re forced to nestle it a little lower.");
	}
	else if(pc.balls > 1)
	{
		output(" Your [pc.balls] don’t help, ");
		if(pc.ballDiameter() >= 5) output("constantly flopping down and threatening to obscure everything between their sloshing weight.");
		else output("constantly flopping on the top, begging to be handled. Well too-bad, testes! You’ve got a slit pump, and you mean to use it!");
	}
	else if(pc.hasCock())
	{
		output(" Your [pc.cocks] ");
		if(pc.totalCocks() > 1) output("aren’t");
		else output("isn’t");
		output(" helping either, getting all hot and hard and pressing needfully against your [pc.belly], distracting you with ");
		if(pc.totalCocks() == 1) output("its");
		else output("their");
		output(" achy throbs. It’d be nice if just this once the horny boy");
		if(pc.cockTotal() > 1) output("s");
		output(" would give you a few minutes alone with your juicing lad");
		if(pc.totalVaginas() == 1) output("y");
		else output("ies");
		output(".");
	}
	output("\n\nYou press the activation button.");
	output("\n\nWhirring softly, the SukMastr 2000 does what it was designed to do - suck on cunt. It tugs gently on your pussylips, making them swell and tingle");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output(" even more");
	output(". It’s a strange feeling, being tugged at by nothing, but it’s also pervasive, reaching into every nook and cranny to draw more and more blood to your most sensitive tissues. You squirm quietly, wishing you could reach through the plastic to stroke your puffed-up pussy directly. Juices leak everywhere, fogging the inside of the cup with their lurid warmth, but confined to the interior, they can do nothing but continue to accumulate, transforming your mons into a ");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("rapidly-inflating fuck-reservoir. It would seem your creaming cunt is ready and prepared to balloon in size once more. It’s already flushed and obscene, the skin tight and shiny. You wonder how fast it can fill the cup.");
	else output("slowly-inflating fuck-reservoir.");

	output("\n\nOnce your [pc.girlCum] reaches the level of the pump’s hose, it loudly burbles, devouring your lady-jizz with enthusiasm, seemingly doubling the suction in an instant. Your pussy puffs up, and the pleasure comes back twice as strong. Your [pc.hips] shake, and your body quivers, delighted to be so forcefully sucked. Nerves sizzle and misfire. Your crotch is a constant barrage of pleasure and desire, delirious tingles and masochistic pain mixing together into an ecstatic stew.");
	output("\n\nUnable to keep your hands off your puffed-up puss, you flick the release switch, briefly shutting off the pump so that you can touch the raw, engorged flesh. ");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("The expression ‘flicking the bean’ suddenly makes a lot more sense now that your gash is so swollen, and you do that once, making your puffy pussy jiggle delightedly. ");
	else output("Giggling, you 'flick the bean,' marveling at how your bloated femininity jiggles, not losing an ounce of its expanded size. ")
	output("You revel in molesting the swollen flesh, plunging fingers in, squeezing the lips together, and softly spanking its tender surface.");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("\n\nIf it’s this good now, what’ll happen once you pump it up even more?");
	else output("\n\nIf it's staying this big now, how long can you keep it looking lewd if you blow it up all the way?");
	output("\n\n");
	//Get count of total max-pumped vags
	var totalPumpedVags:int = 0;
	for(var y:int = 0; y < pc.totalVaginas(); y++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED)) totalPumpedVags++;
	}
	if(pc.totalVaginas() > 1 && totalPumpedVags < pc.totalVaginas())
	{
		output("Sparing a glance to your neglected, secondary vagina");
		if(totalPumpedVags + 1 < pc.totalVaginas()) output("s");
		output(", y");
	}
	else if(pc.totalVaginas() > 1)
	{
		output("Sparing a glance at your ludicrously expanded vagina");
		if(pc.totalVaginas() > 2) output("s");
		output(" and grinning, y");
	}
	else output("Y");
	output("ou grab the cup once more, placing it squarely over the ");
	if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("partially-inflated");
	else output("blissfully-expanding");
	output(" slit. It fits so much better now that your mound has risen to the occasion, and you crank the pump back up to a much higher setting, throwing back your head and moaning out loud. Your chubby cunt-lips gradually balloon, rising up the sides of the clear plastic, pressing so tight that you can hear the sloppy skin squelch. Higher and higher, your taut cunny climbs. It’s so wet and so engorged that it looks almost cartoonish.");
	output("\n\nThe machine dings and shuts off before your fattened nethers can be pinched by the vacuum tube, but the pressure does not fade. The seal is perfect, allowing your [pc.vagina " + x + "] to swell for a few moments more before it becomes completely, totally plumped. It is molded to the shape of the oblong cup and practically frothing with lust.");
	if(pc.vaginas[x].wetness() >= 4) output(" Your drizzling, omnipresent lube fills the last few gaps, then breaks the seal, pouring out in a waterfall. You let the discarded cup splash down in your flooding cuntsauce, too fascinated by the sight of your wobbling mound to care.");
	else output(" You pry it off, gasping at the sight of runnels of cuntsauce rolling down your [pc.thighs]. You let the sticky cup fall to the floor and marvel at the sight of your wobbling mound.");
	output("\n\nIt’s so <i>huge</i>. So fuckable. You gently pet it, dazzled by the sensation flood forth from the too-tender folds. Your finger curls up into the slit on its own, parting the rubbery veil and plunging you into bliss. It doesn’t even feel like your [pc.vagina " + x + "]. It feels like a sex-toy - a big, plush sextoy that jiggles and wobbles with every poke and prod. You add a second finger as your [pc.hips] lift, humping and grinding into your palm. Thumbing your clit, you give up on controlled pleasure and give yourself over to your lusts, humping and grinding in wild abandon.");
	output("\n\n[pc.GirlCum] drips everywhere. It hangs in webs from your fingertips. ");
	if(!pc.isSquirter()) output("Droplets roll down your thighs");
	else output("Curtains spray out");
	output(" mid-orgasm. Crying out, you let your fingers twitch and your passage squeeze, inadvertently pressing your palm flat on your sensitized mound. Fireworks explode behind your eyes, even when you close them, and you slump back, boneless and quivering.");
	output("\n\nAftershocks of pleasure won’t stop racing through your body, twitching your [pc.legOrLegs]. You close your eyes and slowly, artlessly drag your slick digits across your body and up to your [pc.chest], cupping yourself and idly rubbing your nipples. Nothing feels quite as good as a nice a cum.");

	if(rand(4) == 0 && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
	{
		output("\n\nYour rubbery, inflated cunt aches, but it isn't receding much at all. You sit there, watching it, occassionally reaching down to give it a little love-pat, amazed at how plush it seems. <b>Your [pc.vagina " + x + "] appears to to be permanently irrecovably expanded.</b> Pumping it any more would be pointless - it fills the cup as is.");
		pc.vaginas[x].addFlag(GLOBAL.FLAG_PUMPED);
	}
	else if(rand(3) == 0 && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED))
	{
		output("\n\nWhen you look down, you realize that your [pc.vagina " + x + "] is taking a long time to shrink back down. You wait, but it only loses half of its size before stopping. <b>It looks like you have a permanently pumped-up pussy.</b>");
		pc.vaginas[x].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
	}
	else if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED))
	{
		output("\n\nEventually, your [pc.vagina " + x + "] stops looking so obscenely-inflated and shrinks back down to its normal, puffy self. You wonder if a few more play sessions won't fix that. After all, it worked once...");
	}
	else
	{
		output("\n\nEventually, your [pc.vagina " + x + "] returns back to its regular size, though a pleasant soreness lingers.");
	}
	processTime(45);
	IncrementFlag("SUKMASTRED");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}