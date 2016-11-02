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

	//Empty.
	if(pc.statusEffectv1("Gloryhole Shift Activated") == 0) 
	{
		output("\n\nNobody is working the gloryholes right now. You could climb in and man them yourself, if you wanted.");
	}
	//Staffed!
	else
	{
		//Deertaur/Catgrill normal Beej
		if(pc.statusEffectv1("Gloryhole Shift Activated") <= 2)
		{
			output("\n\nThe stall full of gloryholes is presently occupied.");
			if(pc.hasCock()) output(" Now would be the perfect time to stick your dick through an adjacent slot and get an anonymous blowjob.");
			else output(" Since you don’t have a dick, there’s nothing you can do for now.");
		}
		//No new PG for bonus additions
		//Centaur girl
		if(9999 == 0) output(" The floor surrounding the stall is wet with... girlcum. A moist little fillie must be hard at work inside.");
		//Futa/Male overcum?
		if(pc.statusEffectv2("Gloryhole Shift Activated") == 1) 
		{
			output(" Streams of white flow from under the edge, following grooves in the floor toward the drain.");
			if(pc.statusEffectv2("Gloryhole Shift Activated") != 1) output(" Either the person inside busted a backed-up nut or serviced a pair of blue-balled stallions.");
			else output(" You made quite a mess.");
		}
		//In heat
		if(9999 == 0) output(" Quiet moans emanate from a clearly masturbating occupant.");
		addButton(0,"Use Hole",mountGloryhole,undefined,"Use the gloryhole, and the person working inside.")
	}
	return false;
}

public function gloryholeGenerate():void
{
	//v1 stores occupant.
	//0 - empty
	//1 - nervous deertaur
	//2 - kittykat
	if(!pc.hasStatusEffect("Gloryhole Shift Activated"))
	{
		pc.createStatusEffect("Gloryhole Shift Activated",rand(3),0,0,0,true,"INVISIBLE","",false,(60+rand(120)),0xB793C4);
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
		output("\n" + (x+1) + ": " + pc.cockNounComplex(x) + " - ");
		if(pc.cThickness(x) > 4) output("Too thick.");
		else output(Math.round(pc.cThickness(x) * 10)/10 + "\" thick.");
		addButton(x,num2Text(x+1),stickDickThroughGloryhole,x);
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
	//Too Big
	if(pc.cThickness(arg) > 4) 
	{
		output("No matter how you wriggle or thrust, it just won’t fit. You’re too big!");
		if(pc.cockTotal() > 1) output(" Perhaps you’d like to try a different member?");
		clearMenu();
		if(pc.cockTotal() > 1) addButton(0,"Next",mountGloryhole);
		else addButton(0,"Next",canadiaGloryhole);
		return;
	}
	//Centaur/Kaithrit blowie.
	if(pc.statusEffectv1("Gloryhole Shift Activated") <= 2)
	{
		output("You thrust yourself through the hole. ");
		if(fatFlare(arg)) output("The flare catches briefly on the meager entrance, but a little pressure makes it bow back, then pop through a second before it gets painful. You might have to wait a bit after you cum before you can get out... ");
		else if(pc.cThickness(3.4)) output("It’s a tight fit, girthy as you are, but you manage. ");
		if(fatKnot(arg)) output("The [pc.knot " + arg + "] compresses slightly, then pops in. You’ll likely be stuck once you blow your load. That’s the price you’ll have to pay for improved insemination! ");
		else if(pc.hasKnot(arg)) output("The [pc.knot " + arg + "] slips in with ease. It might not even trap you inside once you blow your load. Sometimes, it pays to be the little guy. ");
		if(pc.cThickness() <= 2) output("Gosh, the hole is so much thicker than you! What kind of monsters was this place built for? ");
		if(pc.isGoo() && pc.balls > 1) output("Your [pc.balls] ooze in through the hole after, courtesy of your amorphous nature. ");
		output("It takes but a moment for the occupant to notice the lusty intruder.");

		//Kitty
		if(pc.statusEffectv1("Gloryhole Shift Activated") == 2)
		{
			output("\n\n<i>“Mmm... ");
			if(pc.hasKnot(arg)) output("what a big, bad wolfy");
			else if(pc.cocks[arg].cType == GLOBAL.TYPE_FELINE) output("hey there, tiger");
			else if(pc.cocks[arg].hasFlag(GLOBAL.FLAG_FLARED)) output("such a stud");
			else if(pc.cLength(arg) >= 12) output("hey there, big boy");
			else if(pc.cLength(arg) <= 5) output("what a cute little penis. The small ones twitch so adorably when they cum!");
			else output("what a delicious treat!");
			output("”</i> The voice is so sultry that it’s almost a purr. <i>“I can’t wait to play with it!”</i>");
			output("\n\nA hand wraps around you near the base. It squeezes gently, so gently that you nearly miss the not-so-gentle pricks of sharp claws. <i>“Hold still.”</i> Another claw traces along the underside, menacing your nerves with a hint of danger.");
			output("\n\nYour heart hammers in your chest, yet somehow, you keep your [pc.cockNoun " + arg + "] still.");
			output("\n\n<i>“Ohh, you’re good at this.”</i> A wet, warm tongue caresses the [pc.cockHeadNoun " + arg + "]. <i>“And tasty!”</i> Soft lips surround you. Her mouth is so hot! It glides over more and more of your member, and as you adjust to the rapturous embrace, you become aware of the subtle details. Her tongue, dragging on your most sensitive places. Her hand, so supple as it gently twists. The mystery woman has clearly never had to do anything harder than tugging on a prick, but she does that so, so well.");
			output("\n\nBlood surges into your dick. It leaps upward, bumping you into the anonymous woman’s sharp teeth. Her claws prick the underside as she tightens her grip.");
			output("\n\n<i>“Can’t control yourself?”</i> Your rod feels naked and cold without her mouth around it. She pumps up and down");
			if(pc.cLength(arg) >= 12) output(", using both hands to wrangle your plus-sized totempole");
			output(", greasing the whole of its length in slick saliva. <i>“I guess if you had self-control, you wouldn’t have thrust your dick into a hole for a stranger to play with.”</i> Her tongue drags around the rim of your [pc.cockHeadNoun " + arg + "]. Predictably, you twitch once more, jutting upward by virtue of your own incredibly rigidity.");
			output("\n\nThe voice laughs, then sucks your [pc.cock " + arg + "] in");
			if(pc.cLength(arg) <= 5) output(", devouring most of the undersized length");
			else output(", though only the first few inches");
			output(". Those lips feel too luscious, too plush to be real - likely a side-effect of your limited senses. Their surface is as smooth as silk and as slick as oiled latex. They provide a perfect, vacuum seal. You revel in it, grinding your [pc.hips] against the crudely carved hole, pushing as hard as possible to expose more of yourself to the lovely fellatrix. Your prick obligingly throbs inside her mouth");
			if(pc.cumQ() >= 400) output(", leaking pre");
			if(pc.cumQ() >= 10000) output(" like a broken faucet");
			output(".");
			output("\n\nWet-sounding smacks fill the air when she bobs her head back and forth.");
			if(pc.isGoo() && pc.balls > 1) output(" Her second hand drifts down to your [pc.sack], to cradle your balls. Fingertips casually caress the swollen orbs, almost worshipful in their attentions.");
			output("\n\nA moan slips free. Belatedly, you identify it as your own.");
			output("\n\nWIth a wet ‘pop,’ the casual cock-sucker lets you slide out. Her hands are far from idle. They pick up where the mouth left off, stroking and tugging.");
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
			output("\n\n<i>VIBRATION.</i> The anonymous dick-sucker’s throat vibrates, all the way from her deepest recesses to tightly-sealed lips. Alongside it, you hear barely hear the sound of a quiet purr.");
			output("\n\nOh fuck! You moan loudly - maybe loud enough for it to be heard in the bar.");
			output("\n\nElsewhere in the bathroom, someone chuckles.");
			output("\n\nYou’ve tipped over the precipice now. Even if she stopped and pulled off, you’d hose a load into the mystery gal’s face. You’d fucking paint her. But she isn’t pulling off. Her purr is getting louder, and with it, the vibrations intensify. Your [pc.cock " + arg + "] surges against her dancing tongue. Her purr reaches a fevered pitch.");
			output("\n\nYou erupt. The [pc.cum] squirts deep in the horny girl’s mouth, but it doesn’t stop her purr. Far from it. She purrs louder. Her cheeks and tongue are like vibrators cranked to their highest settings, blasting climax-sensitized nerves into the stratosphere. Rhythmic, ecstatic clenches seize your middle as your body’s instincts take over, trying their damnedest to knock up the talented cock-sucker’s mouth.");
			//None to normal
			if(pc.cumQ() < 250) output("\n\nYou spend what feels like a minute in non-stop ecstasy, though common sense tells you it couldn’t have been more than fifteen seconds. Nonetheless, the purr slowly dies down, the better for your orgasm-pulverized nerves to endure. Then, the lips release. Your [pc.cockColor " + arg + "] skin feels cold in the empty air.");
			//250mL to 1L
			else if(pc.cumQ() < 1000)
			{
				output("\n\nYou writhe in non-stop ecstasy as you are relentlessly milked for every drop of [pc.cum]. Spurt after spurt is spent straight into the tart’s rapacious maw. You can even hear her gulping, taking big swallows of seed just to keep you from overflowing her mouth. She bobs her head when the flow slows, encouraging you to keep going.");
				if(pc.balls > 1 && pc.isGoo()) output(" She even gently squeezes your [pc.balls] to beg for more.");
				output(" Sadly, no amount of bliss can overcome biology. The lips release a few seconds after you go dry. Your [pc.cockColor " + arg + "] skin feels cold in the empty air.");
			}
			//1L to 10L
			else if(pc.cumQ() < 10000)
			{
				output("\n\nThe first tremendous squirt pumps so much seed into tart’s stuffed maw that you lose all contact with her cheeks. You can feel your own [pc.cumNoun] churning around as you pump more in, and the vibrations through it, but her cheeks must be bulging with your load.");
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
			}
			//No fatflare or fatknot but massive cumload
			if(pc.cumQ() >= 1000 && !fatKnot(arg) && !fatFlare(arg))
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
					if(pc.cumQ() < 250) output("Still, it was a lovely appetizer...");
					else if(pc.cumQ() < 1000) output("Though that did hit the spot.");
					else if(pc.cumQ() < 10000) output("Leave a girl a little room for dessert, will ya?");
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
		else if(pc.statusEffectv1("Gloryhole Shift Activated") == 1)
		{
			output("\n\n<i>“Oh wow!”</i> The voice is almost breathless with excitement. <i>“It’s so... so...");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined) output(" familiar");
			output("”</i> A finger caresses the side of your phallus, accompanied by a deep inhalation of breath. <i>“...wow.");
			if(flags["DEERTAUR_GLORYHOLED"] != undefined && flags["DEERTAUR_GLORYHOLED"] >= 3) output(" It’s you again, isn’t it? I knew you couldn’t stay away.");
			else if(pc.cLength(arg) >= 14 && pc.cLength(arg) < 22 && pc.cocks[arg].hasFlag(GLOBAL.FLAG_FLARED)) output(" You didn’t peek, did you?”</i> She giggles. <i>“This is perfect for me.");
			else if(pc.cThickness(arg) > 3) output(" And so big! How’d you fit through the hole?");
			else if(pc.cLength(arg) <= 5) output(" And so small. Poor bipedal women! Do they really fuck dicks like this? It’s snack-sized!");
			else output(" And so hard.");
			output("”</i> That finger becomes two, three, then a whole hand. It squeezes you gently, its owner marvelling. <i>“It’s so warm.”</i> The owner of the voice sniffs loudly. <i>“And smells so gooood.”</i>");
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
			output("se your mouth more,”</i> you answer, starting to breath heavily. <i>“And loosen your grip a little.");
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
			else output("\n\nLips stretch wide around your [pc.cockHead " + arg + "], slowly enveloping it. Teeth brush against your tender [pc.cockSkin " + arg + "] once, but quickly pull away. The poor girl is clearly unused to serving such well-endowed visitors, and it shows. Still, she strains to open wider and succeeds in sucking the first few inches inside. She doesn’t have to go far for you to love it, not when there’s so many nerves wrapped around the circumference of your member to please. And she’s warm. She’s so warm - definitely warmer than a terran ever would be. It’s like getting a blowjob in a hot-tub, only this hot tub comes with two delicate hands to worship the rest of you.");
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
			output("\n\n<i>“Great!”</i> Her voice is husky with want. She sounds like you imagine a girl would sound after edging herself two or three hours. Then she’s on you once more. Those lips, cherry-hot with lust, frame a tunnel of pure delight that bathes you in sloppy, wiggling pleasure.");
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
			if(pc.cumQ() >= 1000) output(", and she whimpers in choked delight when you fill her mouth with a flood of fresh pre-cum");
			else if(pc.cumQ() >= 40) output(", and she whimpers with excitement when your pre-cum splashes off her tongue");
			else output(", though she seems disappointed when no pre leaks out");
			output(". Pressure mounts higher, then higher still. You feel like you’re about to pop.");
			output("\n\nAnd you finally do.");
			output("\n\nSurprisingly, she pulls off the moment the first jet of [pc.cumNoun] hits her tonsils.");
			//No new PGs
			//Low/No cum
			if(pc.cumQ() < 20) 
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
			else if(pc.cumQ() < 150)
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
			else if(pc.cumQ() < 2000)
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