public function timesGloryholesUsed():Number
{
	if(flags["GLORYHOLE_MOUNTER"] == undefined) return 0;
	return flags["GLORYHOLE_MOUNTER"];
}
public function timesGloryholesWorked():Number
{
	if(flags["GLORYHOLE_SERVER"] == undefined) return 0;
	return flags["GLORYHOLE_SERVER"];
}

//Gloryhole
public function canadiaGloryhole():Boolean
{
	gloryholeGenerate();

	var occupant:Number = pc.statusEffectv1("Gloryhole Shift Activated");
	var otherCummed:Boolean = (pc.statusEffectv2("Gloryhole Shift Activated") != 1);
	var overcumDesc:String = pc.getStatusTooltip("Gloryhole Shift Activated");
	
	//Empty.
	if(occupant == 0 || (occupant >= 5 && occupant <= 6)) 
	{
		output("\n\nNobody is working the gloryholes right now. You could climb in and man them yourself, if you wanted.");
		addButton(0,"Work Hole",workTheGloryhole,undefined,"Work Hole","Climb into the gloryhole yourself, and suck some dick.");
	}
	//Staffed!
	else
	{
		//Tentacle Fun
		//tentacle-tongue beej - get sucked off while foot-long tongue jerks off, lots of suction and sloppy messy drooliness.
		if(occupant == 4)
		{
			showName("\nGLORYHOLE");
			author("SKoW");
			output("\n\nYou call out into the quiet stall, waiting for an answer. It’s not quite an expected answer; perhaps it’s racist to say but the voice is very... alien. There’s an almost hypnotic, sybiliant hiss followed by a whispery giggle. <i>“Ah... my next visitor. I am glad I brought a drink in with me, a little palate cleanser.”</i>\n\nOkay, a little bit creepy. Do you stick your dick in?");
			processTime(1);
		}
		//Deertaur/Catgrill normal Beej
		else if(occupant <= 3)
		{
			output("\n\nThe stall full of gloryholes is presently occupied.");
			if(pc.hasCock()) output(" Now would be the perfect time to stick your dick through an adjacent slot and get an anonymous blowjob.");
			else output(" Since you don’t have a dick, there’s nothing you can do for now.");
		}
		//No new PG for bonus additions
		//Centaur girl
		if(9999 == 0) output(" The floor surrounding the stall is wet with... girlcum. A moist little fillie must be hard at work inside.");
		//Futa/Male overcum?
		if(overcumDesc != "") 
		{
			output(" Streams of " + overcumDesc + " flow from under the edge, following grooves in the floor toward the drain.");
			if(otherCummed) output(" Either the person inside busted a backed-up nut or serviced a pair of blue-balled stallions.");
			else output(" You made quite a mess.");
		}
		//In heat
		if(9999 == 0) output(" Quiet moans emanate from a clearly masturbating occupant.");
		addButton(0,"Use Hole",mountGloryhole,undefined,"Use the gloryhole, and the person working inside.")
	}
	vendingMachineButton(1, "XXX");
	if(flags["KALLY_POSTERED"] == undefined)
	{
		output("\n\nOccupying an otherwise bare wall next to the door, is a poster of the bar-tending Tanuki. Apparently she's looking for new hires! You could swipe it to decorate your own vessel with if you wished, though the double-sided stickytape holding it to the wall might make that a tricky proposition. How steady are your fingers?");
		addButton(2,"Take Poster",takeKallyPoster,undefined,"Take Poster","Stealing this is going to require steady hands. Are you up to the challenge?");
	}
	return false;
}
public function takeKallyPoster():void
{
	clearOutput();
	if(pc.aim()/2+rand(20)+1 > 30)
	{
		showName("\nYOINK!");
		pc.addMischievous(2);
		output("With hands steady enough to bullseye a swamp rat from 100 meters out with a G-17, you carefully separate the poster of the curvaceous bartender from the wall without any damage. Score!\n\nOh, and the back has information on the artists - Tsuda's lines and Tisinrei's colors!\n\n");
		processTime(5);
		quickLoot(new KallyPoster());
		flags["KALLY_POSTERED"] = 1;
	}
	else
	{
		showName("\nDISASTER!");
		output("No matter how careful you try to be, your hands are just too jittery! The poster rips in four different places before you give up and let it dangle from the wall like a cowboy's fringe.");
		processTime(5);
		flags["KALLY_POSTERED"] = -1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function gloryholeGenerate():void
{
	//v1 stores occupant.
	//0 - empty
	//1 - nervous deertaur
	//2 - kittykat
	if(!pc.hasStatusEffect("Gloryhole Shift Activated"))
	{
		pc.createStatusEffect("Gloryhole Shift Activated",rand(7),0,0,0,true,"INVISIBLE","",false,(60+rand(120)),0xB793C4);
	}
	//v2 stores if PC cumblasted the stall. 1 = yes.
}

public function mountGloryhole():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	output("What will you stick through? The hole looks about four inches wide.\n");
	clearMenu();
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		output("\n" + (x+1) + ": " + StringUtil.capitalize(pc.cockNounComplex(x)) + " - ");
		if(pc.cThickness(x) > 4) output("Too thick.");
		else output(Math.round(pc.cThickness(x) * 10)/10 + "\" thick.");
		addButton(x, StringUtil.toDisplayCase(num2Text(x+1)), stickDickThroughGloryhole, x);
	}
	addButton(14,"Back",mainGameMenu);
}

public function fatFlare(arg:Number):Boolean
{
	return (pc.hasCockFlag(GLOBAL.FLAG_FLARED, arg) && pc.cThickness(arg) >= 3);
}
public function fatKnot(arg:Number):Boolean
{
	return (pc.hasKnot(arg) && pc.knotThickness(arg) >= 4.1);
}

public function stickDickThroughGloryhole(arg:int):void
{
	clearOutput();
	showName("\nGLORYHOLE");
	var occupant:Number = pc.statusEffectv1("Gloryhole Shift Activated");
	//Too Big
	if(pc.cThickness(arg) > 4) 
	{
		output("No matter how you wriggle or thrust, it just won’t fit. You’re too big!");
		if(pc.cockTotal() > 1) output(" Perhaps you’d like to try a different member?");
		clearMenu();
		if(pc.cockTotal() > 1) addButton(0,"Next",mountGloryhole);
		else addButton(0,"Next",mainGameMenu);
		return;
	}
	else if(occupant == 3)
	{
		usingTheHoleBySkowzers(arg);
		return;
	}
	else if(occupant == 4)
	{
		yesSpookydicksucksAreHabbening(arg);
		return;
	}
	else if(occupant <= 2)
	{
		output("You thrust yourself through the hole. ");
		if(fatFlare(arg)) output("The flare catches briefly on the meager entrance, but a little pressure makes it bow back, then pop through a second before it gets painful. You might have to wait a bit after you cum before you can get out... ");
		else if(pc.cThickness(3.4)) output("It’s a tight fit, girthy as you are, but you manage. ");
		if(fatKnot(arg)) output("The [pc.knot " + arg + "] compresses slightly, then pops in. You’ll likely be stuck once you blow your load. That’s the price you’ll have to pay for improved insemination! ");
		else if(pc.hasKnot(arg)) output("The [pc.knot " + arg + "] slips in with ease. It might not even trap you inside once you blow your load. Sometimes, it pays to be the little guy. ");
		if(pc.cThickness() <= 2) output("Gosh, the hole is so much thicker than you! What kind of monsters was this place built for? ");
		if(pc.isGoo() && pc.balls > 1) output("Your [pc.balls] ooze in through the hole after, courtesy of your amorphous nature. ");
		output("It takes but a moment for the occupant to notice the lusty intruder.");

		var cumQ:Number = pc.cumQ();
		
		//Kitty
		if(occupant == 2)
		{
			output("\n\n<i>“Mmm... ");
			if(pc.cocks[arg].cType == GLOBAL.TYPE_FELINE) output("hey there, tiger.");
			else if(pc.cocks[arg].hasFlag(GLOBAL.FLAG_FLARED)) output("such a stud.");
			else if(pc.hasKnot(arg)) output("what a big, bad wolfy.");
			else if(pc.cLength(arg) >= 12) output("hey there, big boy.");
			else if(pc.cLength(arg) <= 5) output("what a cute little penis. The small ones twitch so adorably when they cum!");
			else output("what a delicious treat!");
			output("”</i> The voice is so sultry that it’s almost a purr. <i>“I can’t wait to play with it!”</i>");
			output("\n\nA hand wraps around you near the base. It squeezes gently, so gently that you nearly miss the not-so-gentle pricks of sharp claws. <i>“Hold still.”</i> Another claw traces along the underside, menacing your nerves with a hint of danger.");
			output("\n\nYour heart hammers in your chest, yet somehow, you keep your [pc.cockNoun " + arg + "] still.");
			output("\n\n<i>“Ohh, you’re good at this.”</i> A wet, warm tongue caresses the [pc.cockHead " + arg + "]. <i>“And tasty!”</i> Soft lips surround you. Her mouth is so hot! It glides over more and more of your member, and as you adjust to the rapturous embrace, you become aware of the subtle details. Her tongue, dragging on your most sensitive places. Her hand, so supple as it gently twists. The mystery woman has clearly never had to do anything harder than tugging on a prick, but she does that so, so well.");
			output("\n\nBlood surges into your dick. It leaps upward, bumping you into the anonymous woman’s sharp teeth. Her claws prick the underside as she tightens her grip.");
			output("\n\n<i>“Can’t control yourself?”</i> Your rod feels naked and cold without her mouth around it. She pumps up and down");
			if(pc.cLength(arg) >= 12) output(", using both hands to wrangle your plus-sized totempole");
			output(", greasing the whole of its length in slick saliva. <i>“I guess if you had self-control, you wouldn’t have thrust your dick into a hole for a stranger to play with.”</i> Her tongue drags around the rim of your [pc.cockHead " + arg + "]. Predictably, you twitch once more, jutting upward by virtue of your own incredible rigidity.");
			output("\n\nThe voice laughs, then sucks your [pc.cock " + arg + "] in");
			if(pc.cLength(arg) <= 5) output(", devouring most of the undersized length");
			else output(", though only the first few inches");
			output(". Those lips feel too luscious, too plush to be real - likely a side-effect of your limited senses. Their surface is as smooth as silk and as slick as oiled latex. They provide a perfect, vacuum seal. You revel in it, grinding your [pc.hips] against the crudely carved hole, pushing as hard as possible to expose more of yourself to the lovely fellatrix. Your prick obligingly throbs inside her mouth");
			if(cumQ >= 400) output(", leaking pre");
			if(cumQ >= 10000) output(" like a broken faucet");
			output(".");
			output("\n\nWet-sounding smacks fill the air when she bobs her head back and forth.");
			if(pc.isGoo() && pc.balls > 1) output(" Her second hand drifts down to your [pc.sack], to cradle your balls. Fingertips casually caress the swollen orbs, almost worshipful in their attentions.");
			output("\n\nA moan slips free. Belatedly, you identify it as your own.");
			output("\n\nWith a wet ‘pop,’ the casual cock-sucker lets you slide out. Her hands are far from idle. They pick up where the mouth left off, stroking and tugging.");
			if(pc.cLength(arg) >= 3) output(" They can’t fully encircle your big dick, but why should they? Feeling her small hands trying to please your every part is half of the enjoyment.");
			output(" She gasps, voice garbled by a mouthful of spit and pre, <i>“Ohh, you liked that, did you?”</i> The mystery mouth-slut slaps your [pc.cockNoun " + arg + "] into her cheek once, twice... thrice. <i>“I like it when they make noise.”</i> She nuzzles your cock, stroking the other side. <i>“Are you ready to cum");
			if(pc.cocks[arg].cType == GLOBAL.TYPE_FELINE) output(", little kitten?");
			else if(pc.cLength(arg) < 12) output(", horny boy?");
			else output(", big boy?");
			output("”</i> A wet smooch is planted by your base. She drags her way back, tongue hanging out, lapping the whole of your underside.");
			output("\n\nYou groan once more, not even trying to hide it.");
			output("\n\n<i>“Yes you are...”</i> The mouth peppers you with soft kisses. The hands stroke. The claws tease in slow circles. <i>“You’re going to cum so hard.”</i>");
			output("\n\nYour dick dances in her hands, bouncing around as if it could force itself into her mouth by sheer force of arousal alone.");
			output("\n\n<i>“Everybody cums for this.”</i> That lovely mouth envelops you once more. This time, she keeps sliding forward, gobbling up inch after inch of dick.");
			if(pc.cLength(arg) <= 5) output(" Your diminutive member is swallowed whole in seconds. Those all-encompassing lips press through the hole surrounding you to kiss your crotch.");
			else if(pc.cLength(arg) < 8) output(" It goes deeper... and deeper. Her hand releases, getting out of the way before those all-encompassing lips devour them as well. Soon, you’re completely swallowed, her puckers pressed through the hole to kiss your crotch.");
			else output(" It goes deeper and deeper. She gobbles down as much dick as she can, but even the most professional of tool-tamers would struggle with a prick like yours. Unsatisfied by this, she wraps both hands around the exposed length and jackhammers them back and forth.");
			output(" A gentle suction makes itself known beneath the waves of heat and undulating tongue-pressure.");
			output("\n\nYour voice hitches in the back of the throat, and you pound your palm weakly against the wall, [pc.legs] shaking. You’re so close! That telltale pressure is welling up inside you. The littlest addition would send you tumbling ov-");
			output("\n\n<i>VIBRATION.</i> The anonymous dick-sucker’s throat vibrates, all the way from her deepest recesses to tightly-sealed lips. Alongside it, you barely hear the sound of a quiet purr.");
			output("\n\nOh fuck! You moan loudly - maybe loud enough for it to be heard in the bar.");
			output("\n\nElsewhere in the bathroom, someone chuckles.");
			output("\n\nYou’ve tipped over the precipice now. Even if she stopped and pulled off, you’d hose a load into the mystery gal’s face. You’d fucking paint her. But she isn’t pulling off. Her purr is getting louder, and with it, the vibrations intensify. Your [pc.cock " + arg + "] surges against her dancing tongue. Her purr reaches a fevered pitch.");
			output("\n\nYou erupt. The [pc.cum] squirts deep in the horny girl’s mouth, but it doesn’t stop her purr. Far from it. She purrs louder. Her cheeks and tongue are like vibrators cranked to their highest settings, blasting climax-sensitized nerves into the stratosphere. Rhythmic, ecstatic clenches seize your middle as your body’s instincts take over, trying their damnedest to knock up the talented cock-sucker’s mouth.");
			//None to normal
			if(cumQ < 250) output("\n\nYou spend what feels like a minute in non-stop ecstasy, though common sense tells you it couldn’t have been more than fifteen seconds. Nonetheless, the purr slowly dies down, the better for your orgasm-pulverized nerves to endure. Then, the lips release. Your [pc.cockColor " + arg + "] skin feels cold in the empty air.");
			//250mL to 1L
			else if(cumQ < 1000)
			{
				output("\n\nYou writhe in non-stop ecstasy as you are relentlessly milked for every drop of [pc.cum]. Spurt after spurt is spent straight into the tart’s rapacious maw. You can even hear her gulping, taking big swallows of seed just to keep you from overflowing her mouth. She bobs her head when the flow slows, encouraging you to keep going.");
				if(pc.balls > 1 && pc.isGoo()) output(" She even gently squeezes your [pc.balls] to beg for more.");
				output(" Sadly, no amount of bliss can overcome biology. The lips release a few seconds after you go dry. Your [pc.cockColor " + arg + "] skin feels cold in the empty air.");
			}
			//1L to 10L
			else if(cumQ < 10000)
			{
				output("\n\nThe first tremendous squirt pumps so much seed into the tart’s stuffed maw that you lose all contact with her cheeks. You can feel your own [pc.cumNoun] churning around as you pump more in, and the vibrations through it, but her cheeks must be bulging with your load.");
				if(pc.balls > 1 && pc.isGoo()) output(" Wetness trickles down your [pc.sack] once you completely overload her, but the image of a hapless girl with a waterfall of [pc.cumGem] fluid spilling from her lips only makes you nut harder.");
				else output(" Muted, bubbling gurgles reach your ears, and with it, the mental image of a hapless girl spilling a waterfall of [pc.cumGem] fluid down her chin.");
				output(" She gulps loudly, but barely puts a dent in your load. The purring stops, and her suck-hungry mouth lets go. [pc.CumNoun] arcs through the air, slapping wetly into the stall’s walls and, you imagine, her face. To her credit, she strokes you the whole way through.");
			}
			//10L+
			else
			{
				output("\n\nAll the tart’s talent and skill matters for nothing when you erupt. So much seed spills into her mouth, that it actually pushes her off of your dick. You hear her scrabbling around in an increasingly sticky puddle, but you also hear her moan with each wet slap of [pc.cumNoun] on skin. Hands grab hold of you - one to stroke, and one to aim. Your mystery dick-lover pumps your hyper-virile dick in a frenzy, pivoting so firmly that she must be hosing herself down with it - that or ensuring you soak every inch of exposed stall.");
				output("\n\nSperm-slicked hands wring you dry, letting you waste your load as you will. A puddle of [pc.cumColor] appears at the edge of the stall, but grooves in the floor carry it away toward a drain. Then the cat-girl is under your [pc.cock " + arg + "], furiously tonguing it. You cum all over her. You’re sure of it. She must be getting absolutely showered in spooge, and judging by her continued purring, she loves it.");
				output("\n\nIt isn’t until your firehose-like eruptions dwindle into a gentle leak that she sucks you in once more. She stops purring to spare your orgasm-tenderized nerves. She does not, however, stop licking you. Her tongue is a rogue instrument, gathering pockets of flavor from your still-stiff shaft to swallow. She doesn’t let you go until you’ve had a thorough tongue-bath. The air feels frigid against your moistened dick.");
				pc.setStatusValue("Gloryhole Shift Activated",2,1);
				pc.setStatusTooltip("Gloryhole Shift Activated", pc.fluidColorSimple(pc.cumType));
			}
			//No fatflare or fatknot but massive cumload
			if(cumQ >= 1000 && !fatKnot(arg) && !fatFlare(arg))
			{
				output("\n\n<i>“Ah... ahhh... uh... wow.”</i> The sound of smacking lips is unmistakable. <i>“I think I’ve... had enough for today.”</i> Sharp claws push on the tip of your [pc.cock " + arg + "], forcing you to pull out of the hole. <i>“Urp.”</i> A giggle follows the burp. <i>“I’m gonna taste you for hours!”</i>");
				output("\n\nIt would seem she’s not entirely displeased by the results. You step out of the stall with a spring in your step");
				if(pc.balls > 1) output(" and lighter [pc.balls]");
				output(".");
				processTime(20);
				pc.orgasm();
				clearMenu();
				addButton(0,"Next",mainGameMenu);
			}
			//No fatflare or fatknot. More normal cumloads
			else if(!fatKnot(arg) && !fatFlare(arg))
			{
				output("\n\n<i>“Ahhh, that’s the stuff.”</i> Lips wetly smack, then plant a kiss upon your slowly deflating member. <i>“You should come back when you’re hard again.”</i> Another kiss alights on your tender flesh. <i>“And I’ll make you cum again.”</i> She kisses the very tip-top of your penis, though this time with closed lips, pushing you back through the hole. Once you’re fully outside, a narrow tongue rolls out to slap the underside, then disappears. You briefly catch a hint of emerald lips. <i>“It was fun playing with you.”</i>");
				output("\n\nIt definitely was. You leave with a spring in your step and a clearer head.");
				processTime(16);
				pc.orgasm();
				clearMenu();
				addButton(0,"Next",mainGameMenu);
			}
			//Knot
			else if(fatKnot(arg))
			{
				output("\n\n<i>“Ooh...”</i> Lips wetly smack, and the hand slowly circles around your expanded bulb.");
				output("\n\nThere’s no way you can pull out.");
				output("\n\n<i>“Looks like this kitty’s caught herself a hound-dog.”</i> The mysterious cock-sucker purrs as she handles your still swollen prick. <i>“How’s this feel?”</i> She squeezes around it, tight.");
				output("\n\nYou moan for her.");
				output("\n\n<i>“I thought so.”</i> She plays with your knot like it’s her own personal stress-release ball. Her grip is not so firm as to hurt, but at the same time it dances next to the line between pleasure and pain. <i>“Moan, puppy.”</i> She tugs it on expertly. You’re clearly not the first to find yourself in such a state. <i>“Moan.”</i>");
				output("\n\nThis time, your moan is louder. It’s incredible. It’s like she’s giving you micro-orgasms, one after another. You even dribble [pc.cum] while she does it.");
				output("\n\n<i>“Good puppy,”</i> the playful voice purrs. Both hands wrap around and tightly squeeze.");
				output("\n\nYour resulting fluid dribble splatters the floor.");
				output("\n\n<i>“Such a good puppy.”</i>");
				output("\n\nYou lose track of time - and moans, but at some point, your [pc.cock " + arg + "] can take no more. [pc.CumNoun] stops drizzling out, and you shrink down enough to escape.");
				output("\n\n<i>“Go take a walkie, pup, and come back once you’ve got another load. Kay?”</i>");
				output("\n\nYou pull out, wobbling a little, and agree without thinking much about it.");
				processTime(38);
				pc.orgasm();
				clearMenu();
				addButton(0,"Next",mainGameMenu);
			}
			//Fatflare
			else
			{
				output("\n\n<i>“Oooh...”</i> Lips wetly smack, and a hand slowly encircles your expanded flare. <i>“Looks like you’re stuck. Big boys like this take a while to calm down, eh?”</i> She pats your slowly, very slowly, deflating member. <i>“I guess I get to play a while longer, then!”</i>");
				output("\n\nThe wall-concealed temptress does her best to keep you from going soft, teasing you with her hands and her lips. At one point, you’re even pressed between two rows of pert breasts and given a double-titfuck. Just what kind of woman is on the other side of that stall?");
				////High libido
				if(pc.libido() >= 75)
				{
					output("\n\nPredictably, you rise to the occasion in short order. Again, she blows you, though this time it is no teasing, gentle affair. She works your dick over. She milks it with businesslike efficiency, hitting you with her trademark purring vibrations so fast that you’re spilling a second load of seed in record time. This time, she doesn’t tease you, at least not with her body. <i>“Pull out before you get hard again, or I’m going to wind up with a sore jaw.”</i> She burps, then giggles. <i>“");
					if(cumQ < 250) output("Still, it was a lovely appetizer...");
					else if(cumQ < 1000) output("Though that did hit the spot.");
					else if(cumQ < 10000) output("Leave a girl a little room for dessert, will ya?");
					else output("Oof, I must look pregnant.");
					output("”</i>");
					output("\n\nYou pull out and leave after the ten minutes or so it takes for you to get small enough to escape.");
					processTime(18);
					pc.orgasm();
					processTime(10);
					pc.orgasm();
					clearMenu();
					addButton(0,"Next",mainGameMenu);
				}
				////Not high libido
				else
				{
					output("\n\nShe teases you for close to a half hour. Then, she stops, but your dick won’t go soft. You keep imagining her, about to tease you some more. The troublesome wench has you wrapped around her finger, and your fattened prickhead won’t seem to deflate enough for you to escape.");
					output("\n\n<i>“You </i>are<i> fun to play with.</i> A gasp of alarm comes from within the stall. <i>“Ohh, who is this?”</i> The voice quiets as it turns away from you, distracted by what can only be someone else on the other side. <i>“We are going to have so much fun...”</i>");
					output("\n\nAt that declaration, you wilt quickly enough to escape within the minute. With your load literally lightened, you’re able to leave with an extra spring in your step, though you keep getting boners when you remember her teasing...");
					processTime(28);
					pc.libido(1);
					pc.orgasm();
					clearMenu();
					addButton(0,"Next",mainGameMenu);
				}
			}
		}
		//deertaur
		else if(occupant == 1)
		{
			output("\n\n<i>“Oh wow!”</i> The voice is almost breathless with excitement. <i>“It’s so... so...");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output(" familiar...");
			output("”</i> A finger caresses the side of your phallus, accompanied by a deep inhalation of breath. <i>“...wow.");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined && flags["DEERTAUR_GLORYHOLED"] >= 3) output(" It’s you again, isn’t it? I knew you couldn’t stay away.");
			else if(pc.cLength(arg) >= 14 && pc.cLength(arg) < 22 && pc.cocks[arg].hasFlag(GLOBAL.FLAG_FLARED)) output(" You didn’t peek, did you?”</i> She giggles. <i>“This is perfect for me.");
			else if(pc.cThickness(arg) > 3) output(" And so big! How’d you fit through the hole?");
			else if(pc.cLength(arg) <= 5) output(" And so small. Poor bipedal women! Do they really fuck dicks like this? It’s snack-sized!");
			else output(" And so hard.");
			output("”</i> That finger becomes two, three, then a whole hand. It squeezes you gently, its owner marveling. <i>“It’s so warm.”</i> The owner of the voice sniffs loudly. <i>“And smells so gooood.”</i>");
			if(pc.isBro()) output(" She pauses, then sniffs again. This time for twice as long. <i>“Sooooo good.”</i> Her voice is made unsteady by her pheromone-inspired desire. <i>“Awesome.”</i>");
			output("\n\nYour dick jumps in the stall-bound seductress’s grip, smacking lightly into her nose.");
			output("\n\nShe squeaks cutely and tightens her grip. <i>“");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("Oh! Right, you’re a jumpy one.");
			else 
			{
				output("Oh! I guess I’ve gotta keep a tight grip on you, huh ");
				if(pc.cLength(arg) > 16) output("big fella?");
				else output("little guy?");
			}
			output("”</i>");
			output("\n\nFingers tighten around you, forcing blood into your [pc.cockHead " + arg + "]. It must look obscene, like an overstuffed sausage. You wince in slight discomfort. Whoever is on the other side, they’re clearly ");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("still an amateur, by cock-sucker standards");
			else output("unskilled");
			output(".");
			output("\n\n<i>“Okay.”</i> A soft kiss is planted against the side of your penis. <i>“I can do this.”</i> Another presses against the underside. <i>“I’ll make you feel ");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("even better this time");
			else output("really good");
			output(".”</i> Her lips are soft, just a little wet with spit. This time, she sucks gently, extending her tongue properly taste you. <i>“");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("Do you like it?");
			else output("Am I doing it right?");
			output("”</i>");

			output("\n\n<i>“");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("Yes, but u");
			else output("U");
			output("se your mouth more,”</i> you answer, starting to breathe heavily. <i>“And loosen your grip a little.");
			if(pc.isBimbo()) output(" You gotta like, really love on that cock.");
			output("”</i>");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output(" You’re starting to think she likes squeezing, perhaps to see how big she can make you swell?");

			output("\n\n<i>“Oh! Sorry!”</i> The mysterious stranger lets go of the base. <i>“");
			if(flags["DEERTAUR_GLORYHOLED"] == undefined) output("I didn’t mean to hurt you.");
			else output("The veins just get all huge when I squeeze like that.");
			output("”</i> Her hand returns, far more gently this time. Now, you can tell that her fingers are inhumanly slender; they’re delicate little digits, and they ");
			if(pc.cThickness(arg) <= 2) output("dazzle the nerves on every side of your [pc.cock " + arg + "] with their touches.");
			else if(pc.cThickness(arg) <= 3.5) output("almost manage to wrap the whole way around your [pc.cock " + arg + "], dazzling the sensitive underside with their touches.");
			else output("have no hope of encircling that titanic sausage. Instead, they tickle around the swollen veins, dazzling sensitive serves with their touches, one at a time.");
			output(" <i>“So you like my mouth?”</i> Hot breath washes over your [pc.cockHead " + arg + "]. Wet lips brush your most sensitive places. <i>“Okay. ");
			if(flags["DEERTAUR_GLORYHOLED"] == undefined) output("Let me know how this feels.");
			else output("Let’s see if you like it as much as I like tasting you.");
			output("”</i>");

			//Small cock.
			if(pc.cLength(arg) <= 5) output("\n\nThe hand falls away, and lips swallow you whole. Whatever your thoughts on your modest size, there is something incredible about feeling an instant transition from inexpert hand to suckling mouth. It’s warm - hot even. The girl blowing you is definitely inhuman, her body temperature at least a few degrees above your own. It’s a feverish blowjob, one that perfectly surrounds you, bathing every inch of hyper-sensitive micro-dick in boiling pleasure.");
			//Med cock
			else if(pc.cThickness(arg) < 3) output("\n\nLips swallow your [pc.cockHead " + arg + "] whole. Whatever thoughts you had, they vanish in a puff of pleasure. Ecstasy creeps along your shaft as the mystery woman slides her face forward, devouring inch after inch of very pleased dick. Her mouth is warm... better than warm - hot. She’s definitely inhuman. Her body temperature must be at least two or three degrees hotter than a terran’s, and it feels fantastic. You love this oral sauna and tremble against a slowly-licking tongue, luxuriating into the incredible heat and friction it provides.");
			//Too big cock
			else output("\n\nLips stretch wide around your [pc.cockHead " + arg + "], slowly enveloping it. Teeth brush against your tender [pc.cockNoun " + arg + "] once, but quickly pull away. The poor girl is clearly unused to serving such well-endowed visitors, and it shows. Still, she strains to open wider and succeeds in sucking the first few inches inside. She doesn’t have to go far for you to love it, not when there’s so many nerves wrapped around the circumference of your member to please. And she’s warm. She’s so warm - definitely warmer than a terran ever would be. It’s like getting a blowjob in a hot-tub, only this hot tub comes with two delicate hands to worship the rest of you.");
			//Merge
			output("\n\nYou grunt and push harder against the wall, squeezing another quarter-inch in for her to play with.");
			output("\n\nThat delicious, heated maw pulls away, leaving you cold and dripping the mystery woman’s saliva. <i>“Really?”</i> Her hands pump, spreading her spit around, transforming the remnants of her ");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("sloppy");
			else output("first");
			output(" blowjob attempt into an eager handie.");
			output("\n\nYou catch yourself nodding, then moan, <i>“Yes!”</i> It’s so hard to think straight when your imagination is completely fixated on what’s happening just beyond the wall.");
			output("\n\n<i>“Yay!”</i> the anonymous cock-sucker cheers. <i>“");
			if(flags["DEERTAUR_GLORYHOLED"] == undefined) output("I’ll do that until you squirt then. Is that okay?");
			else output("Did you bring me more cum than last time? You can’t cum unless you did, okay?");
			output("”</i>");
			output("\n\nInarticulately grunting, you flex your [pc.cock " + arg + "] in her hands. Hopefully, she’ll understand.");
			output("\n\n<i>“Great!”</i> Her voice is husky with want. She sounds like what you imagine a girl would sound after edging herself two or three hours. Then she’s on you once more. Those lips, cherry-hot with lust, frame a tunnel of pure delight that bathes you in sloppy, wiggling pleasure.");
			if(pc.cLength(arg) >= 8)
			{
				output(" Her hands continue to stroke, pumping faster and faster, squeezing your urethra as if she could milk the orgasm out of your body with simple pressure alone.");
			}
			output(" Slipping her tongue over the cushion of her lower lip, the amateur suck-slut reveals another perk of her biology - a muscle so long it can reach a full six inches out of her mouth ");
			if(pc.cLength(arg) >= 13) output("in a vain attempt to polish the entirety of your rod.");
			else if(pc.cLength(arg) >= 6) output("and polish the entire underside of your rod.");
			else output("in an effort to taste even more of you, slipping out the hole and lapping wetly at your crotch.");
			output("\n\n");
			if(pc.hasToes()) output("Curling your toes in delight");
			else output("Trying to keep your [pc.legs] from shaking");
			output(", you vocalize your pleasure with a long, slow, <i>“yeessss...”</i>");
			output("\n\nAn answering gurgle ripples over your dick. Did she try to talk with her mouth full? Regardless, it felt <i>good</i>. The mystery mouth doesn’t try again. Instead, it launches into a rapid, back-and-forth motion. It’s fast enough to make lewd-sounding ‘schlorp’s and ‘slurck’s, and it only gets faster. Her technique is inexpert but eager, the frenzied attempt of a newcomer to claim her prize with raw athleticism over skill.");
			output("\n\nIt’s working.");
			output("\n\nYour body responds to her urgent urgings, tightening the muscles in your middle until you feel like a cock-tipped spring. Her mouth clamps down when you start throbbing inside");
			if(cumQ >= 1000) output(", and she whimpers in choked delight when you fill her mouth with a flood of fresh pre-cum");
			else if(cumQ >= 40) output(", and she whimpers with excitement when your pre-cum splashes off her tongue");
			else output(", though she seems disappointed when no pre leaks out");
			output(". Pressure mounts higher, then higher still. You feel like you’re about to pop.");
			output("\n\nAnd you finally do.");
			output("\n\nSurprisingly, she pulls off the moment the first jet of [pc.cumNoun] hits her tonsils.");
			//No new PGs
			//Low/No cum
			if(cumQ < 20) 
			{
				output("\n\nThe few drops you manage beyond that sprinkle on her face, hidden from view, but she keeps working you with both hands, wringing you for every drop.");
				output("\n\n<i>“...Is that it?”</i> a quiet voice wonders. You’re tugged twice more, to no avail. <i>“I thought there would be more.”</i>");
				output("\n\nYou clear your throat.");
				output("\n\n<i>“Oh. Umm... I hope you had a good time?”</i> You’re released");
				if(fatFlare(arg) || fatKnot(arg))
				{
					output(" to wait for your ");
					if(fatFlare(arg)) output("knot");
					else output("flare");
					output(" to deflate. The woman in the stall apparently lost all interest in you the moment your pathetic orgasm failed to paint her.");
				}
			}
			//Above average to 150mLs
			else if(cumQ < 150)
			{
				output("\n\nIt doesn’t stop you from erupting like a geyser. Ropes of [pc.cum] unload from your [pc.cock " + arg + "], guided by the pair of hands that wind themselves around your [pc.knot " + arg + "]. They stroke and pump, encouraging you even after you stop spending your passion, milking a last few dribbles of liquid delight onto an unseen face.");
				output("\n\n<i>“Ahhh, it’s... nice,”</i> a quiet voice muses aloud. <i>“So much hotter... than I imagined.”</i> You hear squishing sounds as your [pc.cumNoun] is smeared around inside the stall. A happy peck lands upon your ");
				if(!pc.hasKnot(x)) output("drooping");
				else output("drooling");
				output(" mast. <i>“You’re really good at this...”</i> She giggles. <i>“Cumming, I mean. I hope ");
				if(flags["DEERTAUR_GLORYHOLED"] != undefined) output("you keep visiting me.");
				else output("we do this again.");
				output("”</i>");
				output("\n\nYou do too");
				if(fatFlare(arg) || fatKnot(arg)) 
				{
					output(" - once your ");
					if(fatKnot(arg)) output("knot");
					else output("flare");
					output(" deflates enough to let you escape. The mystery woman is nice enough to lick you clean while you wait, even if it does delay your expeditious retreat");
				}
				output(".");
			}
			//150mLs to 2L - body/face paint
			else if(cumQ < 2000)
			{
				output("\n\nA good thing too, because you spray your voluminous load with enough force to gag an inexperienced cock-sucker like her. Guiding you with both hands, she strokes you as you climax, burbling excitedly from underneath a thickening mask of [pc.cumNoun]. [pc.CumVisc] goo splashes audibly. Between it and the whimpers of your sperm-loving partner, you have more than enough auditory encouragement to squeeze out a few spurts thick enough to satisfy the lustiest cum-queen.");
				output("\n\n<i>“S-so wet!”</i> the gloryhole occupant’s voice cheers. <i>“And you’ve still got more, don’t you?”</i> She milks you, palms sliding against iron-hard flesh, wringing you for a few last lurid dribbles. <i>“Mmmm, that’s nice.”</i> She giggles. <i>“You can’t see it, but you drenched me. My head is completely [pc.cumColor]!”</i> She kisses your [pc.cockHead " + arg + "], and you feel your own warm spoo dripping over your rod. <i>“Whoopsie!”</i>");
				output("\n\nYou can’t help but smirk smugly at that");
				if(!fatFlare(arg) && !fatKnot(arg)) output(" and pull your dick out, spent");
				output(".");
				////Knotted/Flared
				if(fatKnot(arg) || fatFlare(arg))
				{
					output("\n\n<i>“Oh, you’re stuck, aren’t you?”</i> A note of concern lingers in the lusty woman’s voice.");
					output("\n\n<i>“Yeah.”</i>");
					output("\n\nHands roam over your [pc.cock " + arg + "], pushing and prodding it. <i>“Can I help?”</i>");
					output("\n\nYou chuckle. <i>“You can play with it if you want me to stick around a while longer, otherwise leave it alone.”</i>");
					output("\n\n<i>“Oh. Alright, I’ll clean it off, a little.”</i> She sniffs. <i>“Stars, all I can smell is cum! You have no idea how wet I am over here...”</i> Her tongue goes to work, licking every ounce of spent love-juice from your length. By the time you’re able to escape, your prick is glossy with spit and unwilling to go completely soft. Maybe you could give her another whirl...");
				}
			}
			//2L-10L - drench
			else
			{
				output("\n\nA good thing too, because the river you release is thick enough to drown a fish, let alone a moistened tart. It hoses over her, undoubtedly drenching her well-hidden visage in a curtain of [pc.cumColor]. Shimmering, [pc.cumGem] waterfalls audibly splash into puddles on the floor. You feel it rocketing through you, the waves of gooey heat distending your urethra. Each time, the pressure builds to almost painful intensity, then releases with a burst of ecstasy so intense it may as well be a lesser-person’s orgasm.");
				output("\n\n<i>“Wow,”</i> a meek voice gasps in between splatters. <i>“So much.”</i> Her hands start to gently stroke to the timing of your squirts, coaxing your spurts to be even thicker - and messier. The voice whimpers. The hands angle you down. <i>“All over my titties!”</i> She giggles, and you’re left to imagine the sight of cum cascading through jiggling cleavage.");
				output("\n\nYou’re wobbled back and forth, presumably to make sure both globes have an even coat. Maybe you’re hitting her shoulders too?");
				output("\n\n<i>“Oh-fuck, keep going!”</i> The voice’s owner yanks your dick upward at a forty-five degree angle. <i>“Get my hindquarters too!”</i>");
				output("\n\nAs if you could stop yourself from continuing to cum.");
				output("\n\nThe ecstatic voice coos, <i>“Yeah all over my back... and my butt... and in my fur...”</i> She whimpers. <i>“It’s dribbling down my ass... and my pussy.”</i> You start to go dry, but the hands pump you faster, compelling you to give one, last tremendous burst of [pc.cumNoun]. It lands with an incredibly loud ‘splat.’");
				output("\n\n<i>“F-fuck, I almost wish I hadn’t had my ovaries turned off!”</i> You hear wet squishing sounds accompanied by loud clicks of hoof on tile as the girl shifts position. <i>“My pussy is sitting in a puddle of your cum, " + pc.mf("mister","miss") + ". And the rest of me is soaked. Here, feel.”</i> She touches your tool to the side of her head. Pointed ear and hair alike are clearly buried beneath a thick layer of [pc.cumNoun]. <i>“");
				if(flags["DEERTAUR_GLORYHOLED"] == undefined) output("I um... hope you’re a regular here. I hope you’re here every time I climb in this stall...");
				else output("I um... hope you had fun. I had fun. I almost wish I could see you, just to know whose dick I’m drooling over every night.");
				output("”</i>");
				output("\n\n");
				if(flags["DEERTAUR_GLORYHOLED"] == undefined) output("You do too.");
				else output("You sort of wish you could see her too.");
				if(fatFlare(arg) || fatKnot(arg)) output(" After a suitable amount of time to let your swollen anatomy deflate, y");
				else output(" With a sated groan, y");
				output("ou pull and prepare to leave.");
				if(flags["DEERTAUR_GLORYHOLED"] != undefined && !pc.isAss()) output(" <i>“You’ve got a talent for this. Thanks.”</i>");
				pc.setStatusValue("Gloryhole Shift Activated",2,1);
				pc.setStatusTooltip("Gloryhole Shift Activated", pc.fluidColorSimple(pc.cumType));
			}
			if(fatKnot(arg)) processTime(45);
			else if(fatFlare(arg)) processTime(35);
			else processTime(25);
			pc.orgasm();
			IncrementFlag("DEERTAUR_GLORYHOLED");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		IncrementFlag("GLORYHOLE_MOUNTER");
	}
}

//Work the Hole
public function workTheGloryhole():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	//First time / Examine room.
	if(flags["GLORYHOLE_SERVER"] == undefined)
	{
		output("The inside of the gloryhole stall is nicer than you would have imagined. All traces of plumbing are gone - no troublesome toilet remains to get in your way, and the walls have padded cushions, shiny and poreless, to lean against - none too close to any of the holes, of course. For the many-legged, a set of specially-shaped pillows are hung from the back wall to allow for more comfortable seating. It’s quite cozy. It could be almost lovely, if it weren’t for the odd stain and the lingering hint of sexual congress.");
		//First time only:
		output("\n\nYou make yourself comfortable and wait for a ‘customer’.");
		clearMenu();
		addButton(0,"Wait",gloryholeWait);
		addButton(14,"Leave",mainGameMenu);
	}
	//Repeat
	else
	{
		output("It takes but a moment to settle into the cozy little cubby. Holes flank you on either side, empty for the moment, but soon to be filled with potential phalli. All you have to do is wait.");
		clearMenu();
		addButton(0,"Wait",gloryholeWait);
		addButton(1,"Examine",gloryHoleAppearance);
		addButton(14,"Leave",mainGameMenu);
	}
}

public function gloryHoleAppearance():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	output("The inside of the gloryhole stall is nicer than you would have imagined. All traces of plumbing are gone - no troublesome toilet remains to get in your way, and the walls have padded cushions, shiny and poreless, to lean against - none too close to any of the holes, of course. For the many-legged, a set of specially-shaped pillows are hung from the back wall to allow for more comfortable seating. It’s quite cozy. It could be almost lovely, if it weren’t for the odd stain and the lingering hint of sexual congress.");
	processTime(1);
	clearMenu();
	addButton(0,"Wait",gloryholeWait);
	addButton(14,"Leave",mainGameMenu);
}

public function getGloryholePregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.cumType = GLOBAL.FLUID_TYPE_CUM;
	pp.balls = 2;
	pp.cumMultiplierRaw = 3;
	pp.cumQualityRaw = 1;
	pp.ballSizeRaw = 2;
	pp.ballFullness = 100;
	pp.ballEfficiency = 15;
	pp.refractoryRate = 9999;
	pp.minutesSinceCum = 65;
	return pp;
}

public function gloryholeWait():void
{
	if(kiroKallyThreesomeUnlockPoints() >= 3 && flags["KIRO_KALLY_PICARDINE_QUEST"] == 3 && flags["KALLY_FAP_2_KIRO"] != undefined && kiroKallyThreesomes() == 0)
		kallyAndKiroGloryholeThreesomeMeeting();
	else if(flags["GLORYHOLED_KAEDE"] == undefined && flags["KAEDE_FUCKED"] != undefined && flags["KAEDE_FUCKED"] > 0 && flags["KAEDE_NT_ENCOUNTER"] != undefined && flags["KAEDE_CS_COUNTDOWN"] != -1)
	{
		processTime(2);
		kaedePopsIntoZeGloryHole();
	}
	else if(rand(3) == 0)
	{
		clearOutput();
		showName("\nWAITING");
		output("You want and wait, but after an hour, no one comes.");
		if(silly) output(" Literally.");
		processTime(60);
		clearMenu();
		addButton(0,"Wait More",gloryholeWait);
		addButton(14,"Leave",mainGameMenu);
	}
	//SKoW Stuff :3
	else if(rand(4) == 0) 
	{	
		processTime(rand(35)+1);
		latexBeejhole();
	}
	else if(rand(3) == 0)
	{
		processTime(rand(35)+1);
		pupperBeejBySKowzers();
	}
	//Space trucker
	else if(rand(2) == 0)
	{
		processTime(rand(35)+1);
		spaceTruckerGlory();
	}
	//Throbb user!
	else
	{
		processTime(rand(35)+1);
		randomThrobbUserBeej();
	}
}

//Blowing a Space Trucker
//Cause you assholes love the gay shit
public function spaceTruckerGlory():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	output("You hear the door to your left swing closed, followed by the rattle of buckles releasing. They jingle a second later, accompanied by the soft ‘whump’ of pants hitting the floor. Then a pudgy cock pushes through the hole, barely half-hard and still thick enough to fill most of the four-inch cutout. It belongs to a terran, judging by the shape, pinkish-red coloration, and uncircumcised foreskin. It’s glossy with sweat, and growing larger by the moment.");
	output("\n\nDo you suck it?");
	processTime(1);
	clearMenu();
	addButton(0,"Yes",yesSuckSomeTruckerCawk);
	addButton(1,"No",dontSuckSpaceTrucker);
}

//No
public function dontSuckSpaceTrucker():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	output("You decide against servicing that dick. It probably hasn’t been washed in a week. There’s got to be someone with a better sense of hygiene you can take care of.");
	output("\n\n<i>“What’s the deal? Ain’t somebody in there?”</i> Angry thumps rattle the adjacent wall.");
	output("\n\nYou stay quiet.");
	output("\n\n<i>“Fuck this. Maybe they got a Beth’s somewhere in this shitheap of a station.”</i> The dick is withdrawn, and heavy footfalls leave the bathroom.");
	processTime(5);
	//[Wait] (Reroll) [Leave]
	clearMenu();
	addButton(0,"Wait",gloryholeWait);
	addButton(14,"Leave",mainGameMenu);
}

//Yes
public function yesSuckSomeTruckerCawk():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	
	var pp:PregnancyPlaceholder = getGloryholePregContainer();
	
	output("It looks like a mouthful. More than a mouthful. It’s already six inches long, and judging by its downward droop, it’s got quite a bit more growing to do. You lean forward and gently blow on it. Predictably, the big ol’ dick surges forward, gaining an inch of length in an instant. It almost bumps into your lips. You pull back and " + pc.mf("chuckle","giggle") + ". <i>“Hmmm, eager boy.”</i> It surges upward once you start speaking. This time, there’s no stopping that fat fuckstick from touching you. It slaps up into your chin.");
	output("\n\n<i>“Fuck yeah!”</i> calls your mysterious suitor. <i>“Suck it, slut.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nLike, what else would you do? <i>“Yes sir!”</i> You grab it in both hands, your enthusiasm as plain as the smile on your parted lips. It feels just as good against your skin as you’d imagined: heavy, a little slick with its own sweat, and throbbing waves of delight through your palms. Whimpering softly, you brush back the course pubes around the base and give it a stroke, bunching the thick dickskin up around the tip. On the way back, the foreskin peels back, exposing growing, purplish glans. It smells strongly of unsatisfied dick - your favorite smell in the whole wide universe.");
	//Bro
	else if(pc.isBro()) output("\n\nHe talks too much. You make an agreeable-sounding grunt. Time to get suckin’ on some cock. You grab it in both hands, business-like. A few long hairs almost get caught between your knuckles, but you brush them back. This guy must be a real quick shot, because he gets most of the way hard in the time it takes you to get a proper heft of his equipment. His glans is shiny and purple, half hidden beneath his foreskin, so you do the sensible thing and tug his foreskin back. Void, he’s throbbing harder than an overloading engine. Just how long has it been since this dude busted a nut?");
	//High libido
	else if(pc.libido() >= 66) output("\n\nElectricity thrills down your spine at being given such a lewd command. Your answer is as much lewd moan as acknowledgement. <i>“Yesss!”</i> You push his coarse pubic hairs out of the way and grab hold in both hands, making it jump like an eager dog, if that dog was a large-bred monster. Even the glans is enormous. You watch it fill up to its full size, stretching the copious foreskin tight around the purplish crown. Drool fills your mouth, but you take the time to give him a few pumps, peeling the foreskin back to expose the gleaming tip. It throbs none-too-gently. Hopefully it won’t go off too soon...");
	//Med libido
	else if(pc.libido() >= 33) 
	{
		output("\n\nA shameful tingle of arousal rolls down your spine at the command. Something about the base sexuality of the request resonates deep within you. Mostly within your ");
		if(pc.hasGenitals()) output("crotch");
		else output("ass");
		output(". <i>“Sure.”</i> You reach out and grab hold of the beast’s base, ignoring the tangle of pubic hairs that crowd around the sweaty staff. It jumps in your hands, filling out before your eyes. The bulbous tip swells up like a time-lapse video of a growing mushroom, stretching the foreskin until it looks like gleaming shrinkwrap. You peel it back before it gets too uncomfortable for the guy, enjoying the sight of his throbbing, purplish glans. It’s actually sort of appetizing.");
	}
	//Low libido
	else 
	{
		output("\n\nYou blush, full-bodied, not sure why you put yourself in such a situation. He’s being so crude! But despite that, you realize that the blush isn’t entirely embarrassment. A part of you enjoys it. Mostly ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("below the waist");
		output(". <i>“O-okay.”</i> Gingerly, you grab hold. It bounces and pulses, and you pull away, watching it add inches with each beat of its owner’s heart. How are you supposed to suck something so big? Grabbing hold once more, you give it a few tentative pumps. At first, they’re a little jerky, but you soon slip into it, your palms greased with the working man’s sweat. Soon, his foreskin rolls back to expose his purplish crown. It looks sort of nice, actually, if a little big.");
	}
	//Merge
	output("\n\nExtending your tongue, you lick it from just underneath the urethral slit to just above. It ");
	if(!pc.isBimbo()) output("tastes like skin, especially salty skin, but still just skin. Satisfied with the flavor, you lick again, this time wiggling your tongue against the frenulum before arcing up the side. Your patron moans in apparent approval. Smiling to yourself, you open wide and engulf his mushroom-like tip, straining your jaw to take the whole thing.");
	else 
	{
		output("tastes heavenly, sort of like most cocks, but somehow better - thicker and more intense than you would expect. Your lips chase after your tongue before it can pull away, wrapping up the delicious dick in your bubbly, penis-loving lips. This time, you taste the underside, around the frenulum, and you do your best to wiggle it back and forth against the sensitive bundles of nerves there. Your patron moans in approval, and you nearly cream yourself in delight, the vibrations of his voice almost as good as strokes against your ");
		if(pc.totalClits() > 0) output("[pc.clit].");
		else if(pc.hasCock()) output("[pc.cocks].");
		else output("[pc.asshole].");
	}
	output("\n\nThis monstrous dong fills your mouth so fully that you’re not sure if you could manage to get it inside again once you pull back, so you flare your nose, breathing rapidly. His musk is so potent, so virile, that it makes you feel a little dazed, maybe a touch dizzy, but you press on. You slide your head forward, at the same time changing up your strokes to match. One hand at a time, you grab hold of him, just in front of your lips, and drag your palms down to his pubic bush. To him, it must feel like he’s endlessly sliding deeper into lustily caressing flesh. To you, it’s a challenge; coordinating your hands and tongue while trying to push past the ridge of his tip is no easy feat.");
	output("\n\n<i>“Oh yeah,”</i> the bass voice groans. <i>“F-fuck it’s been too long. Hope you’re ready for a big load. I been savin’ this one for a slut like you for a week.”</i>");
	output("\n\nYou swirl your tongue against him in a quick figure eight");
	if(pc.isBimbo()) output(" to show your appreciation for bringing you such a lovely treat");
	else if(pc.isBro()) output(" to shut him up so you can focus on sucking every drop of spunk out of his balls");
	else output(" in response, curious to see what a week of his backed-up spunk will feel like");
	output(". Unintelligible sounds of pleasure accompany a sudden flaring of the mouth-bound tip, straining you to the absolute limit. You feel his pre-cum a half-second later. It’s sweet on your tongue after tasting nothing but sweat-coated dick, and there’s enough of it for the excess to roll into the spaces between your teeth and your cheeks.");
	if(pc.isBimbo()) output(" Oh stars, it’s so good! You give him an extra suck to coax out a little more, practically purring when a wave of it rolls across your sensitive dick-licker.");

	output("\n\n");
	if(!pc.isBimbo()) 
	{
		output("Four or five inches is the most you can take. He’s too big not to struggle with");
		if(pc.libido() >= 80) output(", even for someone as accomplished as yourself");
		output(".");
	}
	else output("Seven or eight inches is the most you can take, not because he’s too big or too long, but because he’s too thick to make the bend down into your throat - and the angle in the stall is all wrong for you to straighten your neck.");
	output(" You stop pumping on him now that he’s started drooling, intent on drawing this out for the maximum amount of pleasure. Instead, you slide your fingers slowly over his skin, teasing him with subtler caresses");
	if(pc.isBimbo()) output(", a sensuous display of your complete adoration");
	output(". More pre-cum leaks into your mouth, almost as thick as refrigerated syrup and copious enough to bulge your cheeks like a squirrel.");

	output("\n\nAll that liquid love forces you to slide back a little, just to give you room to swallow, but the motion makes your anonymous lover dribble still more. ");
	if(pc.isBimbo()) output("An errant thought bubbles up, then pops into pleasant euphoria before it can fully form. It’s like there’s not room in your brain for anything but this big, yummy cock!");
	else
	{
		output("How backed up can one man be?");
		if(pc.isNice()) output(" Or maybe, you’re just doing a really good job!");
		else output(" Or maybe, he just can’t help himself in a mouth like yours.");
	}
	output(" You stop trying to swallow and reverse your motion into a quick, back-and-forth bob, mixing his phallic fluid with your spit and letting it dribble out of the corner of your mouth. Slickness quickly coats his cock and your fingers alike, making every touch feel as smooth and effortless as oiled silk.");
	output("\n\n<i>“Aww, yeah! Mmm... faster!”</i> the gruff voice bids.");
	output("\n\nIt sounds almost desperate, so you decide to grant it mercy. Grabbing him firmly, you start rapidly jacking the exposed portion of his length, squeezing him tighter than a virgin’s pussy. Your head slides back and forth so fast that strings of spit form, flying everywhere. Some sticks to your cheeks and chin. There’s no need to move your tongue. Instead, you press it upward to increase the friction against the lucky man’s bulging urethra, letting the motion apply the friction he so desperately craves.");
	output("\n\nYou feel it in your hands first - a sudden bulging, the fruits of your thick-dicked stud’s inevitable orgasm. Pressure pulls your fingers a little farther apart. The swelling cumvein distends so massively that it must be a little pinched by the size of the hole. It hits your lower lip a split second later, just in time for you to close your eyes");
	if(pc.isBimbo()) output(" and open your throat wide, like a good slut.");
	else output(" and brace for impact");
	output(".");
	if(!pc.isBimbo())
	{
		output(" You nearly choke on the first gout. It’s so thick, and there’s so much, that it overwhelms any attempt to swallow it. You may as well try to drink a quart of yogurt all at once. You pull off in a panic");
		if(pc.libido() < 33) output(", inexperienced hands falling away. It doesn’t stop the orgasm, however.");
		else if(pc.libido() < 66) output(", doing your best to hold onto the jerking rod as it unloads into your face.");
		else output(", but not even that could stop you from properly stroking the jerking dick, milking it for the biggest load possible.");
		output(" Cum pumps out in huge gouts, each big enough to fill a whiskey glass. It splashes over your " + (pc.hasHair() ? "hair" : "head") + " and across your [pc.skinFurScales]. Sperm cascades down your shoulders");
		if(pc.biggestTitSize() >= 1) output(" and over the swells of your [pc.biggestBreastDescript]");
		output(". It’s every bit as warm and sticky as it is sexy.");
		
		processTime(16);
		pc.loadInMouth(pp);
	}
	else
	{
		output(" It pumps right on in. Instead of trying to catch it in your mouth, you let it burrow straight into your tummy. There’s so much that you still taste it on the back of your tongue, the tip of the salty deluge, and enough to satisfy you for the moment. Your hands keep right on milking, wringing the silly, cummy dick until your belly feels stuffed to capacity. Then you lean back, letting it fill your mouth with a cheek-bulging treat (just to savor the flavor) before popping your lips clean off. It thanks you by squirting all over your face, revealing just how much the backed-up spacer had saved for to wring out.");

		processTime(16);
		pp.createPerk("Fixed CumQ",10000,0,0,0);
		pc.loadInMouth(pp);
		pp.removePerk("Fixed CumQ");
	}
	//Silly
	if(silly) output("\n\nYou feel like a spooky ghost. Booooo! Ectoplasm everywhere.");
	//Back2Normies
	output("\n\nSpooge");
	if(pc.isBimbo()) output("y goodness")
	output(" obscures your vision, but you’re able to identify the end of the orgasm when the heady fuck-juice stops splashing against your forehead and transforms into a slow, sated dribble against your [pc.chest]. Squeezing gently, you stroke the big dick, feeling it soften slightly even as its owner groans in absolute satisfaction.");
	output("\n\n<i>“Fuuuuck, you’re good at this.”</i> He pulls himself out of your hands and back through the hole. <i>“You did a damned good job, slut. I guess you Vesperian girls are good for something after all. Might have to stop by on my next haul.”</i> The clanking sound of belts being fastened interrupts any further dialogue, followed by the abrupt ‘click’ of the door latch.");
	output("\n\nYou’re left alone with a mouthful of cum and slimy hands.");
	if(pc.isBimbo()) output(" Finger-licking good.");

	processTime(20);
	var lustBonus:Number = 0;
	if(pc.isBimbo()) lustBonus += (10+rand(10));
	pc.changeLust(10+rand(10)+lustBonus);

	IncrementFlag("GLORYHOLE_SERVER");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Blowing Throbb User
//Semirandomized race uses throbb for the first time with the gloryhole, cause apparently there’s a dealer in the bar that recommends using the gloryholes when they do it. Balls are small enough to slip through, post throbb too big. PC has to help get them out, one at a time.
//Races/Dongs:
//Gryvain - quiet nervous - Bright crimson
//Ovir - trembly nervous - purple
//Zil (how’d he get hereeeee?) - high pitched voice nervous - ink black
//Green plantcock - hushed nervous - sorta more confident?
public function randomThrobbUserBeej():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	var user:int = rand(4);
	output("Quiet footsteps enter the bathroom, and unlike the usual traffic, they nervously scuffle their way into the stall on your right. After latching the door, you hear heavy, nervous breathing. A ");
	if(user == 0) output("quiet whisper");
	else if(user == 1) output("trembling voice");
	else if(user == 2) output("reedy voice");
	else output("hushed voice");
	output(" asks, <i>“Is anybody in there?”</i> It sounds feminine.");

	output("\n\nDo you answer?");
	clearMenu();
	addButton(0,"Yes",blowAThrobUser,user);
	addButton(1,"No",turnDownThrobbyBeej);

}

//No
public function turnDownThrobbyBeej():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	output("You keep quiet, and they leave a short while later. Crisis averted.");
	clearMenu();
	addButton(0,"Wait",gloryholeWait);
	addButton(14,"Leave",mainGameMenu);
}

//Yes
public function blowAThrobUser(user:int):void
{
	clearOutput();
	showName("\nGLORYHOLE");
	
	var pp:PregnancyPlaceholder = getGloryholePregContainer();
	switch(user)
	{
		case 0:
			pp.shiftCock(0, GLOBAL.TYPE_GRYVAIN);
			pp.cocks[0].cockColor = "bright crimson";
			pp.makeBallsInternal();
			break;
		case 1:
			pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
			pp.cocks[0].cockColor = "purple";
			break;
		case 2:
			pp.shiftCock(0, GLOBAL.TYPE_BEE);
			pp.cocks[0].cockColor = "ink black";
			pp.cumType = GLOBAL.FLUID_TYPE_HONEY;
			break;
		case 3:
			pp.shiftCock(0, GLOBAL.TYPE_TENTACLE);
			pp.cocks[0].cockColor = "bright green";
			pp.cumType = GLOBAL.FLUID_TYPE_CUMSAP;
			break;
	}
	
	output("<i>“Yeah.”</i> You ");
	if(pc.libido() < 33) output("clear your throat.");
	else if(pc.libido() < 66) output("bite your lower lip before adding,");
	else output("lick your [pc.lipsChaste] eagerly.");
	output(" <i>“Show me what you got.”</i>");
	output("\n\nAs quietly as possible, the mystery companion strips out of her lower garments. <i>“");
	if(user == 0) output("Good. Here you go.");
	else if(user == 1) output("G-g-great! Uh.. here!");
	else if(user == 2) output("Really? Okay, sure.");
	else output("All right. You asked for it.");
	output("”</i> A penis thrusts through the wall. ");
	if(user == 0) 
	{
		output("It’s not particularly impressive, maybe six inches of crimson shaft. At least it’s nice and thick, with the half-hidden bulge of a knot behind.");
		if(CodexManager.entryUnlocked("Gryvain")) output(" You’re pretty sure it belongs to a Gryvain - a small one for the race.");
	}
	else if(user == 1)
	{
		output("It looks more like it would belong on a tiny horse than any spacefaring sapient - barely five inches long and blunt tipped, though its purple hue betrays its alien origins.");
		if(CodexManager.entryUnlocked("Ovir")) output(" Probably Ovir.");
	}
	else if(user == 2) 
	{
		output("It’s five inches long when rock hard, as it is now, with no signs of getting any bigger. Interestingly, the shaft and foreskin are ink-black, nearly hiding a bright-yellow tip from your appraising eyes.");
		if(CodexManager.entryUnlocked("Zil")) output(" Likely a zil. How’d she get off Mhen’ga... and get a dick?");
	}
	else if(user == 3)
	{
		output("It’s bright green and all of four inches long, the shaft lined with interwoven, petal-like folds. What a strange, small penis. You have no idea what sort of being produces such vegetative-looking equipment.");
	}
	output(" The newcomer wiggles around");
	if(user != 0) output(", then squeezes a small pair of balls into the hole");
	output(". <i>“Is that good?”</i>");
	output("\n\nYou reach out and touch it. <i>“Yeah, ");
	if(pc.isBimbo()) output("just let me take care of you!");
	else if(pc.isNice()) output("that’s fine");
	else if(pc.isMischievous()) output("getting your dick sucked is pretty easy work.");
	else output("it’s not hard, genius.");
	output("”</i> It’s nice and warm under your fingertips, the skin smooth and supple");
	if(user == 0) output(", so supple that you can’t help rub your way down to the knot, just to see if it’ll react before its owner actually orgasms.");
	else if(user == 1) output(", so supple that you can’t help but tug on the bunched-up foreskin and play with it between your fingertips.");
	else if(user == 2) output(", so supple that you can’t help but run your fingers around the rim of the blunted tip, feeling the smoothness of its taut dermis.");
	else output(", so supple that you can’t help but tenderly probe the joints between folds. A lotion-like secretion oozes out, slippery and smelling faintly of mint.");
	output(" Satisfied, you run your digits along the underside in a line of unbroken pleasure, then bring your other hand up to stroke the sides and top.");
	output("\n\n<i>“I always thought I’d have to pay for service like this, this close to the core,”</i> the anonymous dick-girl whispers. She thrusts harder against the wall");
	if(user != 0) output(", balls bouncing");
	output(", pushing another quarter-inch of shaft through, not that it’ll make much difference with ");
	if(user == 0) output("such an average dick");
	else if(user == 1) output("such an undersized horse-dick");
	else if(user == 2) output("such a tiny xeno-dick");
	else output("such a tiny, strange dick");
	output(". It’s barely more than a mouthful at best.");

	output("\n\nOpening wide, you lean down and engulf it in your lips, wrapping it up in your hot little pillows. It trembles, a motion you imagine travels the whole way up its owner’s spine. She squeaks cutely when you start to suck, then lets out a low groan when you wiggle your tongue. It’s easy to milk encouraging audio from the excited futanari. Slowly bobbing back and forth leads to blissed-out sighs. Flicking your tongue out to lap ");
	if(user != 0) output("at her balls");
	else output("at her crotch through the hole");
	output(" earns you the sound of ragged inhalations. A slight twist of your neck is all it takes to make her whimper. She’s putty in your mouth.");
	output("\n\nYou’re so focused on playing with the phallus in your mouth, that it takes you a few back-and-forth sucks to realize that your ecstatic blowee is trying to ask you something.");
	output("\n\n”</i>");
	if(user == 0) output("Mmm... hey... you like big dicks too?");
	else if(user == 1) output("A-ah! H-hey! Do you suck big c-cocks too?");
	else if(user == 2) output("Ohh... mmm... you’re cool, with like, bigger dicks. Right?");
	else if(user == 3) output("Yeaaaah... hey, can I get bigger?");
	output("”</i>");

	output("\n\nThe question is strange enough for you to stop sucking and lean back, leaving a very slick phallus hanging in the air, shining with a layer of your spit. After a second, you grab and start stroking, mulling over the query. <i>“Yeah, that’s fine.”</i>");
	if(user != 0) output(" You fondle her balls with the other hand");
	else output(" You rub a fingertip in small circles around the tip");
	output(", making her wiggle adorably. <i>“Such a naughty girl, distracting me while I’m trying to work.”</i> After a second to catch your breath, you dive back down and resume sucking, your attention one hundred percent focused on making the modest tool cream all over your tongue.");
	output("\n\n<i>“Oh, awesome.”</i>");
	output("\n\nDoes this girl ever shut up?");
	output("\n\nYour eyes nearly go cross trying to look at the base of the ");
	if(user == 0) output("vivid alien shaft");
	else if(user == 1) output("lavender length");
	else if(user == 2) output("inky length");
	else output("exotic length");
	output(", but it’s better than staring at the wall. You get to watch the veins plump up when you do something particularly nice. The color subtly shifts the longer you keep it erect, ripening to a vivacious hue.");
	output("\n\nThen a needle plunges into it.");
	output("\n\n<i>What the fuck?</i>");
	output("\n\nThrough the upper edge of the hole, you catch a brief glance of a blue fluid being pumped into the dick. A second later, it’s taken away.");
	output("\n\n");
	if(CodexManager.entryUnlocked("Throbb") || flags["PENNY_THROBB_USES"] != undefined) output("Recognizing the throbb for what it is, you keep sucking, waiting to see how it’ll affect the clueless alien.");
	else output("Dismissing her usage of an obvious performance enhancing drug, you go back to sucking, figuring she’ll probably blow any second.");
	output(" It’s eerily quiet in the stall. The girl isn’t saying anything, or even moaning anymore. All you can hear are the wet sounds you make when you slap your [pc.lips] against her crotch.");
	output("\n\n<i>“Fuck!”</i> the dick-girl angrily cries. <i>“That bitch must have ripped me off.”</i> She even goes a little soft in your mouth.");
	output("\n\nCompassionately, you slide your tongue into action, hoping to make her forget her wasted credits. She throbs back to full hardness. Her next heartbeat, her dick does it again. It’s warmer, maybe even heavier than a few seconds ago.");
	output("\n\n<i>“Ohhhh,”</i> the anonymous futanari gasps her way into a moan, <i>“...hot... f-f-fuck!”</i>");
	output("\n\nIncreasing thickness spreads your jaw wider as the alien’s phallus burrows deeper, growing in short spurts to the tempo of her fluttering heart.");
	output("\n\n<i>“Your mouth... so good...”</i> Gasping, the clearly-drugged woman rolls her hips against the wall. It would be more of a problem if her penis didn’t get longer to compensate for the inch or two yanked out of your mouth. <i>“I love you.”</i> Her hips lurch with the words, and you feel warm juices roll out of a widening tip. Her urethra bulges obscenely, seemingly filled with more. Strangely ");
	if(user == 0 || user == 1) output("the over-eager spunk");
	else if(user == 2) output("the sweet honeyspunk");
	else output("the fruity plantspunk");
	output(" doesn’t squirt out in bursts, like an orgasm. Instead, it boils over in a slowly-widening stream.");
	//Nongryvain:
	if(user != 0) output("\n\nYou’d have to be blind not to see why. Just below the hole, the formerly cute balls have swollen into decent-sized nuts. They’re still getting bigger, too - and rounder. The more they grow, the more spherical they become, perhaps stretched out by the incredible amounts of seed they’re presently producing. You heft one, and swear you feel it slosh. It weighs heavier on your palm the longer you examine it before finally stopping at the size of a baseball. Wow.");
	//Merge
	output("\n\nYou accept the bizarre situation for what it is and start to swallow. It becomes a bit of a rhythm game for you, sliding back, collecting some in your mouth, then pushing forward until the embiggened dick is about to brush your tonsils and swallowing, forcing it to bathe in its own overeager juices.");
	output("\n\n<i>“Oh, don’t stop!”</i> Not a single trace of nervousness remains in your blissed-out, rapacious patron. <i>“Just suck me forever.”</i> Her hips tremble, and an especially rich blend of foreign seed spills into your throat.");
	output("\n\nEnough dick has grown for you to wrap a hand around while you blow. You do so, rubbing your thumb back and forth against the sensitive underside.");
	output("\n\nA full-body quiver sluices through the prick-fixated futanari. <i>“It’s like... mmm...”</i> She’s struggling with her words, battling to the all-consuming pleasure to try to tell you something. <i>“L-like all my nerves are in my... myyah!”</i> Her hips jerk. <i>“...in my cock.”</i> She pulls an inch back from the wall and slams her hips into it hard enough to rattle the fasteners. <i>“Like you’re sucking all of me in your mouth, and it’s so wet and warm, and I love it so much, and I love you. I love you so much.”</i>");
	output("\n\nAppraising the drugged woman’s dick, you figure it must be at least ten inches long by now, maybe even 11. The growth is slowing, but her sexual fluids aren’t. It takes both hands to tend to all of her rod. It still throbs like crazy, pulsing faster and faster, building to something.");
	output("\n\n<i>“I’m gonna knock up your mouth!”</i> She isn’t even trying to make sense anymore. <i>“I’m gonna knock up your mouth, and marry it, and you’re gonna suck my dick every day!”</i>");
	output("\n\nThat fantasy clearly overloads her, because her dick chooses that moment to release a torrent of hypersexual release directly into your throat mid-swallow. You pull back rather than choke on it, but not so far that it strokes your face. Instead, you wrangle the wildly spurting penis with your hands, trying to catch its exuberant release in your mouth. Lance after lance of thick, alien seed fills your maw, faster than you can swallow. You can practically feel her drug-augmented sperm swimming around your teeth. Trickles leak from the corners of your mouth, then in a waterfall over your lower lip. And she’s still cumming.");
	output("\n\nFiguring you’ll keep yourself from getting entirely soaked, you slide to the side and pump her dick hard, making her shoot the whole way across the stall to splatter on the wall. A previous occupant even drew some targets for you to aim at, and you do your best to nail every single one of them.");
	output("\n\nAfter two or three minutes of uninterrupted squirting, the drug-dosed futanari stops cumming. She’s panting for breath, breathing just as heavily as a distance runner after a race. Stroking her gently, you ask her how she feels.");
	output("\n\n<i>“I uh... sorry about that.”</i> A blush reaches all the way down to her dick. <i>“I got a little crazy on the Throbb. I hope I didn’t weird you out.”</i> The voice pauses to pant.");
	output("\n\nYou kiss her dick. It was pretty fun, weirdness and all.");
	output("\n\n<i>“Mmm... is it always going to be this intense? She... she was so right about this stuff. Taking it while I was in your mouth... mmm...”</i> The voice trails off. <i>“I’ll never forget how that felt. You’re an angel.”</i>");
	//No balls
	if(user == 0) output("\n\nGingerly pulling herself out, the dick-girl gathers her things and leaves, but not before leaning down to the hole and blowing you a kiss.");
	//Balls
	else {
		output("\n\nGingerly attempting to pull herself, the dick-girl pauses when she realizes she can’t get her balls out. The dick is easy to slip out once it starts going soft, but her balls are simply too large to fit through together.");
		output("\n\n<i>“Hold on,”</i> you chide.");
		output("\n\nGently hefting the cock-wielding woman’s balls up one at a time, you roll them through the opening. If they had gotten any larger, you might have had to call an emergency crew to free her.");
		output("\n\n<i>“There you go.”</i>");
		output("\n\n<i>“Thanks,”</i> the voice is heavy with relief. You hear the stranger gathering her things on the other side, struggling to tuck her expanded package away. She leans low before leaving and blows you a kiss through the hole. <i>“Thanks again.”</i>");
		output("\n\nYou almost tell her that the pleasure was all yours... but it would seem she was the winner in that regard.");
	}
	processTime(25);
	var lustBonus:Number = 0;
	if(pc.isBimbo()) lustBonus += 5+rand(5);
	pc.changeLust(10+rand(10)+lustBonus);
	pc.loadInMouth(pp);
	IncrementFlag("GLORYHOLE_SERVER");
	IncrementFlag("GLORYHOLE_THROBBS");
	pc.setStatusValue("Gloryhole Shift Activated",2,0);
	pc.setStatusTooltip("Gloryhole Shift Activated", pp.fluidColorSimple(pp.cumType));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//SKoW's GLORIOUS HOLE
//Staffing the hole
//Pupper Beej
public function pupperBeejBySKowzers():void
{
	clearOutput();
	author("SKoW");
	showName("\nGLORYHOLE");
	output("A loud crack of the bathroom door being slammed open nearly makes you jump out of your seat; your wait at the hole seems to be temporarily over. You can practically hear the sway to their step as they approach before there’s a surprisingly polite knock on the wall. Up close it’s possible to smell Kally’s special brew wafting off of the new arrival, it looks like now would be the time to say hello or stay quiet.");
	processTime(2);
	clearMenu();
	addButton(0,"Suck",pupperSuckBeej,undefined,"Suck","Open wide!");
	addButton(1,"Hide",nahNoDoggoDick,undefined,"Hide","Not this time, drunko.");
	//[Succ] //Open wide! [Hide] //Not this time, drunko.
}

//[Succ]
//Open wide!
public function pupperSuckBeej():void
{
	clearOutput();
	author("SKoW");
	showName("\nGLORYHOLE");
	output("What the hell else are you here for? You call out to them and get comfortable, waiting for the inevitable. <i>“Hey great! Do you know how fucking wild this stuff drivesh you? I could nut to the photo of an open purshe right about now!”</i> Their voice is a combination of feminine and husky (and drunk), painting the mental image of the giant plush-fluffy pups from Uveto. Or perhaps some other kind of lusty lady of amazonian figure.");
	output("\n\nIt looks like your first guess was right on the money though; a peek through the hole reveals a some thick thighs and a skirt being flipped up to reveal about eight inches of puppy-prick already oozing a thick bead of pre-cum. Hanging around your anonymous partner’s fluffy knees are some already-stained cute pink panties, and you can just about spot the side-to-side wag of a tail just barely out of sight. <i>“Alright! Here she comesh!”</i> There’s a moment’s pause followed by a chuckle, <i>“Literally!”</i>");
	output("\n\nYou have to lean back to avoid getting a cock in the eye, but at last you’re treated to the sight of a delightfully thick dick. It’s already the deep red of someone aching with need, and the knot at its base is already starting to swell and engorge. It jumps in your grasp when you give it a stroke, not stopping until you’ve squeezed enough musky husky pre to coat her bone with. Just those few moments of jerking have her knot so swollen that a wicked realization comes to mind...");
	output("\n\n<i>She’s trapped</i>. More important than that; this girl’s desperate to cum already. Instead of give her exactly what she wants though, you start to tease her tapered tip. Watery ivory dribbles freely down her length before dripping to the floor in a quickly growing puddle, and the only contact your mouth makes is to plant small kisses along the length. <i>“H-hey, come on...”</i> She moans, humping against the stall wall hard enough to make it rattle. <i>“O-oh! I’m shtuck... I see. You-you’re a mean one.”</i> There might have been more accusation in her statement if not for the fact it ends in a hiccup-burp combo. As it is, you have this musky husky right where you want her.");
	output("\n\nA few kisses is all it takes to bring your [pc.lips] to a perfect shine, and you’re sure to stroke and rub her every few moments. Not too hard of course, just enough to ensure that her member doesn’t flag. It’s unlikely your partner’s going to pull out, but it wouldn’t do to let the poor thing nut soft. Her low moans and drunken murmuring is music to your ears as you repeatedly swap between teasing kisses and polishing her pole, playing the perilous game of keeping her edged.");
	output("\n\nAfter a while you get used to the sounds she makes; they pick up just when she’s on the verge, and settle down to a whimpering moan when the waves recede. Similarly even despite the slim size of her cumslit it’s starting to look wide enough to sink your tongue into. By now she’s panting for breath and slapping her palm on the door, letting out helpless whines as she once again comes close to completion. You wrap both [pc.hands] around her knot, stroking and rubbing the practically-aching flesh. Oh the other side of the wall she all but babbles and begs you to let her cum, and at last you open wide.");
	output("\n\nShe yelps in surprise at your hot breath washing over her cock, before finally going quiet. It’s rather a shame that her begging comes to a close, but considering the fact that you can see her knot visibly pulse in time with her heartbeat it’s time to set her free. You moan and groan as deeply in the back of your throat as you can while swallowing her length, forced to stretch as you reach her girthier base. You don’t stop until your pre-coated lips are smashed up against her glistening knot, " + (!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) ? "all but wrapping your tongue":"coiling your prehensile tongue") + " around her shaft.");
	output("\n\n<i>That</i> gets a proper scream out of her. She starts slamming her body against the wall so hard you’re afraid that something’s going to break, and there’s one last almighty pulse against your tongue to herald her final screaming orgasm. You back up the moment the first rope of cum goes blasting down the back of your throat, sucking with concave cheeks so that you pull free with a loud pop. It turns her thick ropes into a messy spray of ivory that cascades down around you, painting your [pc.face] and [pc.fullChest] ivory.");
	output("\n\nThe musky futa husky comes hard for a seriously long time, not stopping until you’re literally dripping with seed and the last few spurts lack the power to do much more than dribble back down her length and onto her knot.");
	output("\n\nThis presents a fresh issue for her, while you’re busy with all-but-bathing in the musky-sweet mixture of male and female hormones dripping into your " + (pc.biggestTitSize() >= 1 ? "cleavage and ":"") + "lap. She’s still completely locked there even after finishing.");
	output("\n\n<i>“Uh... fuck.”</i> She eventually mumbles, gasping for breath. <i>“Thought I wash gonna pass the fuck out just then.”</i> It’s a good thing she didn’t; collapsing with all your weight when you’re knotted in the wall is probably a bad time. <i>“I think I’m gonna be shtuck here awhile h–”</i>");
	output("\n\nYour anonymous puppy partner’s cut off by the sound of the bathroom door slamming open again, followed by a stop of confusion. <i>“Ah fuck.”</i> Says a fresh, growly voice alive with the typical New Texan drawl. <i>“Tha’s just not fair lil’ lady. How’s a fella supposed t’get his dick suck with you all in the way there?”</i>");
	output("\n\n<i>“Tell you what, handshome. This hole may be closed for bushinesh, but I hear a new one just opened up!”</i>");
	output("\n\nYou should probably leave, it looks like the stall’s going to be occupied for a while. Even <i>if</i> it’s tempting to sit around and listen to a futa get railed to some massive bull, the chances of them getting caught and told off for making a mess are a lot higher.");
	output("\n\nWhen you exit it’s finally possible to see the two of them; at least eight foot of horned (horny) bull boy and a not-much-shorter huskar woman with curves you could get lost in. She looks in your direction but the man behind her places a hand over her eyes. <i>“Now, now missy! Y’not supposed t’know what the pretty filly or fella on the other side’s s’posed t’look like!”</i> He gives you a wink before leaning into one of her ears, letting you leave with a dripping trail behind you. <i>“I bet I can make an even bigger mess.”</i> Are the last words you hear before closing the door behind you.");
	//Become cum-covered, become aroused, trigger kui-tan balls
	processTime(10);
	pc.changeLust(10);
	pc.applyCumSoaked();
	IncrementFlag("GLORYHOLE_SERVER");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//[Hide]
//Not this time, drunko.
public function nahNoDoggoDick():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	author("SKoW");
	output("You’re not so convinced you want to get particularly intimate with someone who’s probably too drunk to stand up. When you remain silent on your end of the hole there’s a long pause, followed by a sigh before they step (or more likely stumble) away.");
	//[Next] //Return to waiting!
	clearMenu();
	addButton(0,"Wait",gloryholeWait);
	addButton(14,"Leave",mainGameMenu);
}

//Latex Beej
//by skowzers
public function latexBeejhole():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	author("SKoW");
	output("After waiting, your [pc.ears] are feeling alert for any potential sound on the other side of the glory hole wall. Even if they weren’t you’d be able to recognize the sound that plays out after the door comes open; it’s that silky-soft squeek of thick latex-covered thighs rubbing gently together. A peek under the gloryhall wall shows a thick fur coat dropping to the ground, and the limits of some exceptionally-skinny high-heels.");
	output("\n\n<i>“Why hello there~? Any sweet young thing waiting on the other side want to suck a pre-wrapped treat?”</i> Comes a voice more suited to the belle of the ball than a shrink-wrapped lady looking for a bit of wall-strange.");
	//[Succ] //Hey, not like latex tastes that bad. [Stay Quiet] //Meh, it’s not for you.
	processTime(2);
	clearMenu();
	addButton(0,"Suck",suckThatLatexProngodong,undefined,"Suck","Hey, not like latex tastes that bad.");
	addButton(1,"Stay Quiet",stayQuietForLatexBeejAvoid,undefined,"Stay Quiet","Meh, it’s not for you.");
}

//[Succ]
//Hey, not like latex tastes that bad.
public function suckThatLatexProngodong():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	author("SKoW");
	output("With a grin you take your position, making sure to rattle the wall a little to make yourself known. <i>“Oh aint’cha you just the best? I tell you sweet-thing, an evening drinking that cutie patootie behind the bar’s special-somethin’? I’m fit t’burst!”</i> She crams her cock through the hole in the wall so fast she almost takes your eye out. <i>“And I do so love to make a mess in this~”</i>");
	output("\n\nYou’re treated to a glistening black prick perfectly encased in black synthetic. It forms such a tight layer it’s possible to make out the thick veins that travel through the otherwise (surprisingly, besides the footlong size) human-looking member. Strangely enough it seems to keep the heat in, as your [pc.hands] soon find when you give her mass an experimental squeeze. <i>“Oooh, aint it pretty? I bet it’ll look even prettier with a spitshine there sweetie-pie!”</i> She insists, twitching in your grip.");
	output("\n\nShe’s not wrong either. You noisily spit onto the latex length, giving her a swift jerk that has it reflecting the pale light of the stall. The mushroom-head of her cock is a broad thing, but not so much that you can’t " + (!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? "wrap your mouth fully around it":"draw it completely into your muzzle") + " and start to suck and tongue. <i>“O-oh! That’s a lovely lil’ kisser you have! Don’t f’get to work the base, I get eeeever-so-sensitive there!”</i>");
	output("\n\n" + (pc.isBimbo() ? "Please, this is hardly your first dick-sucking rodeo. ":"") + "There’s enough of her that you’ve got to make sure she’s properly coated before you can start jerking her off further down, and it takes a few moments to gather up that much saliva. Once you <i>do</i> manage however it’s more like you’ve started fisting her judging by the way she squeals for you. The base of her cock really is something intensely sensitive, and you can actually feel the definition in her latex-wrapped cockhead start to fail as the tip begins to fill with pre. You come away with a loud lurid <i>’pop’</i>, twisting your hand around your base until she’s gasping and singing your praises. There’s some discoloration at the head of her prick where deep white seed has turned black latex the slightest bit grey.");
	output("\n\nKeep this up though and you could make some serious balloons.");
	output("\n\nConsidering her cock’s more sensitive a lot further down – odd, now that you think about it – you might as well get properly introduced to it. Making sure to swallow a few times, you wrap her cock up once more. This time instead of suckle on the head you press further forward, furiously jerking her off as you take more and more of her down. Her moans transform, following a rising crescendo of gasps until you come to a brief pause. The broad head of her cock presses at the limits of your throat, and every time you swallow it seems to get even thicker.");
	output("\n\nFighting against the urge to back up however, you push yourself in even deeper, finally letting go of her cock in order to slap both your palms against the wall. This time you don’t stop until you’re noisily gurgling on the prick aimed down into your stomach while your lips grind and grip on that overly-sensitive base. <i>“O-oh sweetie I’m about fit t’burst...”</i> She moans in response, throbbing in your maw while you do your valiant best to fuck your throat onto her. You only suck harder and faster, bobbing back and forth until you’re sure your throat’s stretching around her. It’s definitely getting harder to gulp down ear with a gobful of shiny latex.");
	output("\n\nThankfully she cums before you start risking blacking out... which presents a brand new issue.");
	output("\n\nThe latex doesn’t break.");
	output("\n\nShe gasps and cries out, fucking the hole in the wall (and your face by extension) as she lets go and cums. Where her cum-vein has your tongue mashed to the floor of your mouth it’s possible to feel each rope pass through her, and more importantly you can feel a swollen core of heat in your stomach grow.");
	output("\n\nAnd grow.");
	output("\n\nWhen you finally start trying to drag yourself off of her you’re tempted to try and rip the stretch material so that she can dump her load in you. It’s hard to say what it’s actually made of, but the girl plowing your maw full is simply giggling and humping as you attempt to get free. Finally you manage, flopping backwards and gasping for breath. A great big grey/white balloon of roiling spunk falls out and drops onto your chest, just daring you to pop it and send the whole lot exploding over you. Sadly you’re too busy catching your breath, flushed with the effort as she starts feeding the spit-coated cum-balloon back out through the hole.");
	output("\n\n<i>“Oh you are just the sweetest thing! I didn’t expect you to swallow the whole lot!”</i> She giggles and wiggles, before there’s an audible <i>’snap’</i> accompanied by sloshing. <i>“Oooh, I can feel it in my suit sugar-dumplin’! Just movin’ all around. Mnf. Puts a shiver in me right down t’the toes. And look! All the fun, no mess.”</i>");
	output("\n\nWell, that’s a somewhat fair point. Just about every visitor is expecting to paint you from head-to-toe or fill you up until you’re practically pregnant. Still, you could do without the choking hazard.");
	processTime(15);
	pc.changeLust(10);
	IncrementFlag("GLORYHOLE_SERVER");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay Quiet]
//Meh, it’s not for you.
public function stayQuietForLatexBeejAvoid():void
{
	clearOutput();
	showName("\nGLORYHOLE");
	author("SKoW");
	output("You stay quiet, waiting for the uncomfortable silence to clear. After a while there’s a soft tongue-clicking, before the coat is picked up again. Once more there’s the subtle squeak of latex and the click-clack of high-heels as she exits the room, leaving you in silence once more.");
	clearMenu();
	addButton(0,"Wait",gloryholeWait);
	addButton(14,"Leave",mainGameMenu);
}

//Using the hole
//The Switcharoo
public function usingTheHoleBySkowzers(x:int):void
{
	clearOutput();
	author("SKoW");
	showName("\nGLORYHOLE");
	output("You saunter up to the stall wall, before knocking and waiting. There’s barely a moment between your introduction and a bubbly voice responds. <i>“Oh yay! I was worried I’d have to wait for aaages... Come on! Show me what you’ve got!”</i>");
	output("\n\nWell, she’s an eager one at least. You shrug" + (!pc.isCrotchExposed() ? " and strip yourself gradually out of your coverings":"") + ", listening for any sounds on the other side of the wall as you gradually render yourself nude. When you press your cock through the wall it’s answered by a satisfied squeak. <i>“Oh look at that! It’s perfect. I could just eat you all up...”</i> Then her bubbly voice dips a register, and you can all but hear the woman on the other side licking her lips. <i>“But I’ve got a much better idea...”</i>");
	output("\n\nAnd then she backs into you. At least, you can only assume she’s backing into you; the heat that suddenly washes over the head of your [pc.cockType " + x + "] cock certainly comes from no mouth you’ve ever felt. And when the first inch of your prick is all but sucked up your assumptions turn to certainty. It’s not a quick penetration, and you’re left to nothing but imagination and the sounds of your anonymous lover moaning. She’s ridiculously wet; it feels like each inch you drive into her is actually pushing juices out of her. You can hear moisture drip to the floor by the time she finally bottoms out. With the barrier of a wall behind you it’s hard to tell, but you can just about hear her ass bouncing against the wall before she goes still.");
	pc.cockChange();
	output("\n\n<i>“I know the servicer’s meant to do all the work, but whaddaya think? I’ll leave myself riiight here and you just rut this wall like a beast!”</i> She gasps and rolls her hips, squeezing you with the muscles buried right down in her depths until she’s practically slavering and gnawing at your cock. She may want you to pull out and start fucking, but her body wants to keep you buried in her. Each time your heart beats and your blood pumps she seems to squeak and whimper, before there are a few more humps against your drenched bone.");
	output("\n\nTaking the hint, you get to work. It’s difficult to find anything similar to a rhythm, and there’s nothing to grab onto. The comfiest position is to plant your palms on the wall and simply thrust your hips back-and-forth on the spot. She begins to cry out now, staying still as promised while you rapidly hammer yourself into her willing twat.");
	output("\n\nThen rather suddenly you’re left wanting. You pull out to the sound of yet more juices splattering to the ground, and a muffled moan of ecstasy. But when you thrust again there’s nothing but empty air. <i>“H-hold on a sec, sorry. Phew. Should’ve warned you...”</i>");
	output("\n\n<i>“I didn’t expect to cum so soon!”</i> She explains, and you can hear a little fabric-rustling. <i>“But don’t you worry, I wouldn’t leave a lovely thing like this hanging.”</i> Her voice moves around in the stall, until you’re pretty sure she’s facing you; those guesses prove correct, as the heat that washes over your soaking cocktip now is the wash of breath. <i>“I just love the smell and taste of myself, nothing makes me...”</i> She trails off, licking your crown. <i>“Hotter,”</i> Another lick. <i>“Hornier,”</i> And one more for good measure. <i>“Hungrier...”</i>");
	output("\n\nYou’re practically drooling pre straight onto her tongue as she teases you, growing closer while she works herself up. A soft <i>’aaahn~’</i> tracks her progress before it’s muffled by cock and the vibrations are sent right down to your base. She slurps and sucks noisily, moaning as she goes to enhance those sensations. Now you get to try the guessing game as to who (or what) it is that you’re actually fucking. She seems to have a short muzzle, and it doesn’t take much work for you to pass the limits of her mouth and push right down into her throat before she’s practically kissing the stall.");
	output("\n\nShe stays there for a while, sucking and exploring every " + (pc.cocks[x].cLength() < 12 ? "modest":"incredible") + " inch of you with her tongue. Eventually she runs out of breath, pulling off of you with a gasp that leaves your twitching cock alone in the open air. She slowly jerks you off with firm fingers while preparing for round two, ensuring the flames she’s stoked in you don’t get a chance to die down. <i>“Aww, I’ve licked you clean... we’ll just have to get you all </i>juicy<i> again.”</i>");
	output("\n\nThat sounds pretty fucking good to you. Once more there’s the awkward pause while she re-adjusts, but this time you’re ready for the treat that’s coming. There’s no slow teasing this time; she lines up, giggles, wiggles her hips against you like a golfer lining up for the swing, and impales herself on you. She’d been so wet before that each errant thrust was forcing pussy juices out of her, and this time it noisily splashes. It’s thicker and stickier now - no doubt the result of copious girl-cum - and when you bottom out (literally, her bottom slams into the wall and stops her short) " + (pc.cocks[x].cLength() < 12 ? "you wish you had a few extra inches to fill her with.":"you could swear you’re pressing at her cervix and waiting to push the rest of the way into her."));
	output("\n\nSadly there’s no extra give; whatever muscles she’s got must be exercised to all hell judging by the way she milks your cock without letting you into her deepest depths. A few more thrusts later and there’s a tightness in your prostate that heralds the end. <i>“Oooh, you’re getting thicker inside me! You’re about to cum, huh? I wonder how you – nfh – taste!”</i>");
	output("\n\nShe pulls herself off of you quickly and spins around, mashing her face into your dick in one fell swoop that has you pointed directly into her stomach. She sucks so hard you’re worried for a moment your orgasm is going to be stolen by vacuum-force before she relaxes again. Drool escapes around the base of your prick and joins the puddle of girly juices on the floor, and her tongue assaults you with manic need.");
	output("\n\nNo point in keeping her waiting. The pressure building up in your core is enough to have you aching with need in the first place, and when you finally let go it’s more akin to a river bursting its banks. Her cock-hungry moans become a muffled squeak of surprise, and you can feel cum spray out despite the tight seal of lips around you. ");
	if(pc.cumQ() < 1000) output("All too soon your flow comes to a stop, but you can at least hear her satisfied <i>’muah’</i> before she plants a kiss on your cock.");
	else output("Her stomach probably swells with the weight of your liquid load, but to her credit your anonymous cockslut doesn’t pull off until your last potent loads have trickled down to nothing.");
	output("\n\nAfter a moment’s pause you call out, suddenly worried about her silence. <i>“Grbfl.”</i> Comes her succinct response, and with a laugh you redress yourself. Now a lot lighter, you make ready to return to the companionable din of Kally’s bar.");
	//[Next] //Back to Business.
	processTime(30);
	IncrementFlag("GLORYHOLE_MOUNTER");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Yes]
//As if a spooky voice is going to get between you and some dick-sucking.
public function yesSpookydicksucksAreHabbening(x:int):void
{
	clearOutput();
	showName("\nGLORYHOLE");
	author("SKoW");
	output("You opt to answer with actions rather than words, quickly shucking off your clothes. Apparently your spooky mystery mistress is listening closely, judging by the soft clapping of hands you hear on the other side. <i>“Delightful, you shan’t be disappointed dear.”</i> She insists with a hungry hiss.");
	output("\n\nHer hiss transforms into a satisfied sigh at the presentation of your cock, and surprisingly gentle hands wrap around it and jerk a few times. <i>“This will do... nicely.”</i>");
	output("\n\nSomething in her voice sends a shiver down your back, but any discomfort is quickly forgotten as a... something trails along the topside of your cock. You’d argue it was a tongue, but there’s a lot more going on with it than the normal texture. Nodules rub and grind you, before the unknown appendage literally coils around your [pc.cock " + x + "]. There’s a muffled giggle on the other side of the wall that makes you shiver again, before the tentacle – it must be some kind of tentacle – starts to squeeze and milk you.");
	output("\n\nYet more of the hot bumpy mass wraps around your dick until you’re entirely enveloped in over a foot of the stuff, before it begins to wring and milk you. It turns out you aren’t just getting some kind of tentacular hand-job though; the moisture that builds up around your enveloped dick-meat can only be drool. When the first sounds of pleasure creep out of you a satisfied purr answers on the other side of the gloryhole. Even wrapped up in tentacle-tongue as you are it’s possible to feel the heat and pressure of a mouth swallowing you whole.");
	output("\n\nWhatever this woman is on the other side, she’s got a long, animalistic face. It’s hard to put a mental image to the combination of sensations, but it’s a long muzzle or snout. The length of your cock is being held in that giant maw, covered in drool and squeezed by this woman’s organic milker of a tongue. You could only imagine what else that tongue were capable of.");
	output("\n\nAnd it seems it has another trick waiting for you. She starts to bob her head back and forth with noisy spitty gurgles, but her tongue moves in the opposite direction. You’re literally jerked off by the appendage, and she doesn’t appear to mind the fact that her tongue is slapping against the stall wall. Your own [pc.hands] smack the wall in time with it as you’re assaulted from tip to base with suction and jerking, all within the tight sloppy seal of a cavernous maw.");
	output("\n\nShe must produce a lot of spit, judging by the amount that still manages to escape that vacuum-tight suction. It’s also far thicker than before now that it’s mixed with your still-thickening pre. Her coaxing speeds up, trying to bring you ever-closer to completion despite how desperately you hold back.");
	output("\n\nTo your own undeniable credit, you hang in there for maybe two minutes of this brutal assault on your senses. There’s a puddle on the ground and your creepy partner’s moans are a mixture of horny and desperate. There’s no preventing the inevitable though, and by this point you’re struggling to find your breath. Each squeeze and roll across the length of your shaft is enough to make your legs tremble.");
	output("\n\nFinally you nut, hosing down the insides of this woman’s alien maw. Her spit-laden gurgles turn into deeply satisfied coo’ing noises, and your dick is released. The sultry air of the room – long since heated by sexual effort – still manages to feel cold on your cock now that it’s exposed. While she no doubt drowns herself in the delight of a mouthful of cum, you still dredge up a few last ropes of it to try and mark whatever else her body looks like.");
	output("\n\n<i>“Oh! Hmph, how very naughty... I’ll have to clean that with my tongue.”</i> Again you’re reminded of some horror-movie monster-girl voice. Perhaps it’s time to beat a hasty retreat.");
	processTime(20);
	pc.orgasm();
	IncrementFlag("GLORYHOLE_MOUNTER");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}