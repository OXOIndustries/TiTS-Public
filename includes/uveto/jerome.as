import classes.Characters.Jerome;
import classes.Characters.PlayerCharacter;

public function jeromeAtBar(btnIdx:int):Boolean
{
	if (flags["JEROME_APPROACHED"] != undefined && flags["JEROME_APPROACHED"] == days) return false;
	if (hours < 3 || (hours > 9 && hours < 12) || hours > 22)
	{
		var metJerome:Boolean = flags["MET_JEROME"] != undefined;
		
		if (!metJerome)
		{
			output("\n\nA stout figure shrouded in a cloak of shadow");
		}
		else
		{
			output("\n\nJerome");
		}

		output(" is tucked in against one end of the bar, hunched over a drink.");
		if (!metJerome) output(" The huddled shape");
		else output(" He");
		output(" looks up occasionally, surveying the other patrons, and you just about catch");
		if (!metJerome) output(" a pair of");
		else output(" his");
		output(" eyes lingering over your form for longer than should be considered polite.");

		addButton(btnIdx, metJerome ? "Jerome" : "Figure", approachJerome, undefined, "Seduce " + (metJerome ? "Jerome" : "the Figure"), "Well if you're so captivating, it'd be rude not to introduce yourself....");

		return true;
	}

	return false;
}

public function showJerome(asNude:Boolean = false):void
{
	showName(silly ? "\nJERBEAR" : "\nJEROME");
	showBust("JEROME" + (asNude ? "_NUDE" : ""));
	author("Gedan");
}

public function approachJerome():void
{
	clearOutput();
	showJerome();

	var metJerome:Boolean = flags["MET_JEROME"] != undefined;

	output("You lock eyes with");
	if (!metJerome) output(" the figure");
	else output(" Jerome");
	output(" and");
	if (pc.isBiped()) output(" strut");
	else if (pc.isNaga()) output(" slither");
	else if (pc.isTaur() && pc.hasHooves()) output(" clop");
	else if (pc.isTaur()) output(" saunter");
	else output(" glomp");
	output(" your way towards");
	if (!metJerome) output(" them");
	else output(" him");
	output(". In the dim light, you can just make out the whites of");
	if (!metJerome) output(" their");
	else output(" his");
	output(" eyes briefly enlarging, before");
	if (!metJerome) output(" they turn");
	else output(" he turns");
	output(" away back to");
	if (!metJerome) output(" their");
	else output(" his");
	output(" drink and hunches over the bar even further. Too late for that though; you’ve caught");
	if (!metJerome) output(" them");
	else output(" him");
	output(".");

	if (!metJerome)
	{
		output("\n\nAs you [pc.move] closer, you finally start to make out some of the details behind the figure. The hungry eyes belong to a portly bear of a man, heavy set yet visibly well built, if the sheer size of his shoulders are anything to go by. A tight security uniform forms around his upper body, leaving a poof of off-white fur bursting out from the neck of the armored vest-come-shirt to obscure most of his neck and jawline.");
	}
	else
	{
		output("\n\nJerome’s trying his best to pretend like he hadn’t just been busy undressing you with his eyes. He’s not doing a very convincing job, if the rapidly swelling bulge in the crotch of his pants is anything to go by.");
	}

	output("\n\nYou come to a stop shoulder-to-shoulder with your admirer; uncomfortably close, if the restless shifting on his seat is anything to go by.");

	if (!metJerome)
	{
		output("\n\n<i>“[pc.name],”</i> you start.");
		
		output("\n\n<i>“Huh? Are you talking to me?”</i> He looks around almost nervously.");
		
		output("\n\nA affirmative nod prompts him to continue.");
		
		output("\n\n<i>“J-Jerome.”</i>");
		
		output("\n\n<i>“");
		if (pc.isBimbo()) output("Like, ");
		output("I thought you’d want to know what to moan under your breath later");
		if (pc.isBimbo()) output(", babe");
		output(",”</i> you tell him through a cocky grin, a reflection of your teeth clearly visible in his eyes as you lick teasingly at your canines.");
		
		flags["MET_JEROME"] = 1;
	}
	else
	{
		if (flags["FUCKED_JEROME"] != undefined)
		{
			output("\n\n<i>“Didn’t");
			if (pc.isBimbo()) output(" you, like, get enough of me the last time");
			else output(" learn your lesson the last time");
			output("\n\n, huh?”</i>.");
		}
		else
		{
			if (pc.isBimbo()) output("\n\n<i>“Like, all you gotta do is ask, big guy!”</i>");
			else output("\n\n<i>“Did nobody ever tell you it’s not polite to stare?”</i>");
		}
	
		output("\n\n<i>“Ah, well... I’m sorry, I just-”</i>");

		if (silly) output("\n\n<i>“No tears now, only dreams,”</i>");
		else output("\n\n<i>“Maybe you need another lesson?”</i>");
		output(" you tell him through a cocky grin, a reflection of your teeth clearly visible in his eyes as you lick teasingly at your canines.");
	}

	output("\n\nOne of Jerome’s massive hands clamps around the comparatively tiny drink seated on the bar in front of him, bringing it to his mouth in an attempt to disguise a nervous gulp.");
	
	flags["JEROME_APPROACHED"] = days;

	clearMenu();
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(0, "Pegging", jeromePegging, undefined, "Pegging", "Teach him to be more careful.");
	else addDisabledButton(0, "Pegging", "Pegging", "You'd need the proper tool to discipline Jerome thusly.");

	addButton(1, "Hipbuster", jeromeHipbuster, undefined, "Hipbuster", "Ride his cock until his hips regret the actions of his greedy eyes.");
		
	addButton(14, "Back", mainGameMenu, undefined, "Back Away", "You've teased him enough, maybe he's learned his lesson.");
}

public function jeromePegging():void
{
	clearOutput();
	showJerome(true);

	jeromeSceneIntro();

	clearMenu();
	addButton(0, "Next", jeromePeggingII);
}

public function jeromePeggingII():void
{
	clearOutput();
	showJerome(true);

	var cIdx:int = pc.hasCock() ? pc.biggestCockIndex() : -1;

	output("A predatory smile spills over your face, Jerome too busy enjoying your hand to notice. You give him one last demanding <i>squeeze</i> before you slip your fingers under the waist of his underwear and tug them down, his knees happily bending to your will to slip them off entirely. With them out of the way you sidle back up between his legs, his imposingly thick cock now defenseless against your questing touch.");

	output("\n\nYou take hold of his mammoth meat pole again, your fingers wrapping around half of it at best. Angling it up you get a good look at the underside, a series of heavy ridges along the bottom just perfect to strum along with your thumb- and strum you do. The combination of your index finger dancing over one of the nubs behind his fat cockhead and your thumb rubbing along the ridges has Jerome moaning and growling in seconds, his pleasure confirmed by the heavy flow of pre liberally oozing from his cock and quickly spilling over your fingers.");

	output("\n\nWith the bear thoroughly blissed out by your relatively sedate, all things considered, handjob, he doesn’t seem to notice when you switch hands, leaving you with one [pc.hand] full of cock and one [pc.hand] full of slick pre. Your grin intensifies a thousand fold");
	if (cIdx >= 0)
	{
		output(" as you");
		if (pc.isTaur()) output(" struggle to reach back");
		else output(" reach down");
		output(" to your [pc.cock "+cIdx+"] with the home-made lube Jerome has oh-so-graciously provided, smearing it along your length with abandon as you work yourself to full hardness.");
	}
	else
	{
		output(" as you");
		if (pc.isTaur()) output(" struggle to reach back");
		else output(" reach down");
		output(" and blindly fondle around with a messy finger, looking for a certain hidden little button. The instant you make contact, the distinctive hum of your faux-cock materializing into existence spills out from between your legs. You give it a quick grope with the drippy cockjuice you’ve milked from Jerome and marvel in the emulated sensation of throbbing, unyielding flesh.");
	}

	processTime(10 + rand(2));
	// Taur Fork
	if (pc.isTaur())
	{
		output("\n\nProperly prepared, you reluctantly allow your hand to slip away from the bear’s ribbed cock and");
		if (pc.hasHooves()) output(" clop");
		else output(" step");
		output(" a little further forward before rearing up to heft your");
		if (pc.legCount == 6) output(" four");
		output(" forelegs up onto the bed. The");
		if (cIdx >= 0) output(" [pc.cockHead "+cIdx+"]");
		else output(" flared head of your holodick");
		output(" sends tingles down your spine when it squishes into the bear’s prodigious balls, slipping lower under their weight, coming to a rest almost perfectly poised, the");
		if (cIdx == -1) output(" simulated");
		output(" cumvein kissing the portly guy’s plump pucker in the process.");

		output("\n\nIt all happens too fast for Jerome to properly register what’s happening, a confused grunt his only response before the weight of your body comes to rest atop his, sandwiching his nubby cock between two soft and pliant bellies. With a wiggle of your hips, you nestle your dick in just right; and fully envelop his cock in the tight embrace of your combined forms. He most definitely seems to enjoy the sensation if the heavy spurt of pre");
		if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(" soaking into the [pc.skinFurScales]");
		else output(" splattering against the [pc.skinFurScales]");
		output(" of your underbelly is anything to go by.");

		clearMenu();
		addButton(0, "Next", jeromePeggingIIITaur);
	}
	else
	{
		output("\n\nProperly prepared, you grab a firm hold of your");
		if (cIdx >= 0) output(" [pc.cock "+cIdx+"]");
		else output(" simulated cock");
		output(" and glide yourself forward. Your");
		if (cIdx >= 0) output(" [pc.cockHead "+cIdx+"]");
		else output(" faux glans");
		output(" slides under the silky smooth skin of the bear’s heavy balls before coming to a rest almost perfectly poised, the");
		if (cIdx == -1) output(" holographic");
		output(" tip of your cock kissing the portly guy’s plump pucker in the process.");

		output("\n\nA confused grunt rumbles out of Jerome’s throat as your cock nestles into position, but you placate him with a skilled twirl of your wrist, your digits dancing around the cock firmly in your grasp. You reach out with a finger and play lightly across the surface of one of the nodules just under the head of his cock, and he falls back into your bed again as a heavy spurt of pre sputters forth and splats onto his belly.");

		clearMenu();
		addButton(0, "Next", jeromePeggingIIIBiped);
	}
}

public function jeromePeggingIIITaur():void
{
	clearOutput();
	showJerome(true);

	var cIdx:int = pc.hasCock() ? pc.biggestCockIndex() : -1;

	output("<i>“You remember my name, right?”</i> you ask him, your ");
	if (cIdx == -1) output("faux");
	output("cock nestled right up against his asshole.");

	output("\n\n<i>“" + (pc as PlayerCharacter).short.substring(0, 1) + "-[pc.name].”</i>");

	output("\n\n<i>“Then </i>ask<i> me for it.”</i> You grind against his ass in emphasis, reminding your strapping bear exactly what he’s requesting.");

	output("\n\nA needy throb against your underbelly, in combination with an excited little wiggle of his hips betrays his intentions before he manages to utter the words. Another little thrust of your hips, just barely threatening to squeeze your fat");
	if (cIdx == -1) output(" holodong");
	else output(" [pc.cockHead "+cIdx+"]");
	if (silly) output(" right where it belongs.");
	else output(" into the bear’s pliant hole.");

	output("\n\n<i>“Fuckin’ do it. Fuck me [pc.name],”</i> he half-growls in his deep, baritone voice.");

	output("\n\nHappy to oblige his request, you give your hips a firm thrust and pop");
	if (cIdx >= 0) output(" your [pc.cockHead "+cIdx+"]");
	else output(" the flare of your glowing mare-breeder");
	output(" past his plump pucker, tempting warmth enveloping you, inviting, demanding you thrust deeper.");
	(pc as PlayerCharacter).cockChange(true, false);
	output(" You take your time sliding forward, enjoying the rich sensation of gradually plowing your way through the succulently snug space that you’ve claimed as your own; you want every last inch of your");
	if (cIdx >= 0) output(" [pc.cock "+cIdx+"]");
	else output(" fauxcock");
	output(" nestled in that ass, and you’re going to take as much time as it needs to make that happen.");

	output("\n\nJerome seems to be enjoying himself, if the firm little thrusts of hips serving to grind the ribbed underside of his fat cock into your underbelly are anything to go by. Every inch you feed into his greedy ass seems to trigger another wiggle from his spine and another needy hump into your [pc.skinFurScales].");
	if (cIdx == -1 || pc.cocks[cIdx].cType == GLOBAL.TYPE_EQUINE)
	{
		output(" And the cute little mewl that slips from his throat as your chunky");
		if (cIdx == -1) output(" simulated");
		output(" medial ring stretches him open to burrow its way inside is just <i>music</i> to your ears.");
	}

	output("\n\nAnother thrust forth into the sumptuous warmth enveloping you poses a problem though; you’ve got another couple of inches left to feed into the portly ball of fur, but you’ve run out of space between his legs.");

	output("\n\n<i>“Be a good boy,”</i> you leave as an open-ended order, tapping against his thigh with your hand.");
	
	output("\n\nThe bear wraps his coarsely-furred legs around your flank, his thick limbs forming around the barrel of your hips as he tries to lock his feet together around your back. His shifting body seems to suck you in another couple of inches deeper, his legs pulling your body down onto himself; a firm rub along the bottom of his dick in exchange for another couple of inches disappearing into his ass seems like a fair trade.");

	if (cIdx >= 0 && pc.hasKnot(cIdx))
	{
		output("\n\nAlmost there now; you bare down on the bear and glide the last few inches of your [pc.cock "+cIdx+"] into him, right up until your [pc.knot "+ cIdx + "] nudges against his heavy balls and bumps into the plump little donut of his ass. A ginger grind against the resistance signals your intentions; you’re not going to be satisfied until he’s taken every last thing you have to offer.");

		output("\n\nPulling back just enough to feel his softly furred sack drag back over your [pc.knot " + cIdx + "], you reverse course and grind the fat bulb against him. And again. And again.");

		output("\n\nYour belly grinds heavily into his cock with every attempt, a near constant stream of pre liberally pooling against your undercarriage and running down his cock... a faucet of lubrication oozing over his balls and across your [pc.knot "+ cIdx +"]. It’s almost like he’s going out of his way to help you claim his ass! You hold yourself in position just there, warmth seeping into your [pc.cock "+cIdx+"] as ever greater splurts of Jerome’s pleasure add a thick shine to your bulbous knot.");

		output("\n\nWith a grunt you push forth one final time, your knot briefly held back by the tight ring threatening to reject its entry before it’s swallowed whole with an audible ‘POP!’.");

		output("\n\nThe fat intrusion finally sets the bear off, his legs clamping tight around your back, his cock flexing and throbbing against your belly with vigour as it spews his heavy load between the two of you. His ass though; the suckling warmth wrapped so tightly around your [pc.cock "+ cIdx +"] milks you firmly, hoovering an orgasm out of you.");
	}
	else
	{
		output("\n\nAlmost there now; you bare down on the bear and glide the last few inches of your");
		if (cIdx >= 0) output(" [pc.cock]");
		else output(" equine holocock");
		output(" into him, right down until your " + (cIdx >= 0 ? ("[pc.sheath "+cIdx+"]") : ("hardlight base")) + " nudges past his heavy balls and bumps into the plump little donut of his ass. Finally hilted, you start to work yourself into a little rhythm, humping the final few inches of your cock into him.");

		output("\n\nYour belly grinds heavily into his cock with every thrust, a near constant stream of pre liberally pooling against your undercarriage and running down his cock... a faucet of lubrication oozing over his balls to drip across the top of your");
		if (cIdx == -1) output(" glowing");
		output(" dick. Every glob feeds warmth into your flesh, bringing you a little closer....");

		output("\n\nWith a grunt you push forth one final time and the bear goes off like a firework, his legs clamping tight around your back, his cock flexing and throbbing against your belly with vigour as it spews his heavy load between the two of you. His ass though, the suckling warmth wrapped so tightly around your");
		if (cIdx >= 0) output(" [pc.cock "+cIdx+"]");
		else output(" faux cock");
		output(" milks you firmly, vacuuming an orgasm out of you.");
	}

	output("\n\nStars explode across your vision as you struggle to stay upright under your own power, your legs threatening to give up from under you as his own orgasm tapers off.");
	if (cIdx == -1)
	{
		output(" Your simulated cock bulges as if it were spewing quart after quart of spunk into a needy mare but with naught to show for the effort.");
	}
	else
	{
		output(" Your [pc.balls] pulse");
		if (pc.balls < 2) output("s");
		output(" heavily as you pump a");
		if (pc.cumQ() <= 250) output(" tiny");
		else output(" substantial");
		output(" wad of spunk deep inside.");
		if (pc.cumQ() >= 2500) output(" Quart after quart throbbing along the thick length of meat impaling the bear’s ass; your body giving no concern to the fact that it’s pumping so much cum into a hole that can’t be bred.");
		if (pc.cumQ() >= 7500) output(" After a while, you can feel each heavy splurt ripple out across Jerome’s gut against your underbelly, the sheer amount of spunk you’re capable of producing packing his ass full of jizz and adding an extra bit of weight to his already considerable frame.");
	}

	output("\n\nGathering your wits, now thoroughly sated, you begin the arduous process of extracting yourself from the");
	if (cIdx >= 0 && pc.cumQ() >= 7500) output(" visibly larger");
	output(" bear, lewd squishes and squelches almost tempting you into a second round as you separate from him.");

	output("\n\nTaking one final step back as your half-limp");
	if (cIdx == -1) output(" faux");
	output(" cock slips from his well-used ass, you take a moment to survey your work;");
	if (cIdx >= 0 && pc.cumQ() >= 2500) output(" a thick rivulet of your cum drools from his plump pucker, matched by an equally");
	else output(" a");
	output(" thick puddle");
	if (cIdx >= 0 && pc.cumQ() < 2500) output(" of cum");
	output(" soaking the fur across his gut, his cock laying in the mess limply.");
	
	output("\n\nYou");
	if (pc.hasHooves()) output(" trot");
	else output(" saunter");
	output(" off to your attached washroom to clean yourself up, Jerome’s spunk dripping from your underside with every step. It takes a fair amount of effort to scrub your underbelly clean, having to stretch and contort yourself around to reach all the spots that his spunk managed to seep.");

	processTime(10+rand(2));
	jeromePeggingMerge();
}

public function jeromePeggingIIIBiped():void
{
	clearOutput();
	showJerome(true);

	var cIdx:int = pc.hasCock() ? pc.biggestCockIndex() : -1;

	output("<i>“You remember my name, right?”</i> you ask him, your ");
	if (cIdx == -1) output("faux");
	output("cock nestled right up against his asshole.");

	output("\n\n<i>“" + (pc as PlayerCharacter).short.substring(0, 1) + "-[pc.name].”</i>");

	output("\n\n<i>“Then </i>ask<i> me for it.”</i> You grind against his ass in emphasis, reminding your strapping bear exactly what he’s requesting.");

	output("\n\nA needy throb in your hand, in combination with an excitedly little wiggle of his hips betrays his intentions before he manages to utter the words. You give your hips a restrainted thrust, just barely threatening to squeeze your");
	if (cIdx == -1) output(" holodong");
	else output(" [pc.cockHead "+cIdx+"]");
	if (silly) output(" right where it belongs.");
	else output(" into the bear’s pliant hole.");

	output("\n\n<i>“Fuckin’ do it, fuck me [pc.name],”</i> he half-growls in his deep, baritone voice.");

	output("\n\nHappy to oblige his request, you give your hips a firm thrust and pop");
	if (cIdx >= 0) output(" your [pc.cockHead "+cIdx+ "]");
	else output(" the glowing glans of your fauxcock");
	output(" past his plump pucker, tempting warmth enveloping you, inviting, demanding you thrust deeper. You take your time sliding forward, enjoying the rich sensation of gradually plowing your way through the succulently snug space that you’ve claimed as your own; you want every last inch of your");
	if (cIdx >= 0) output(" [pc.cock "+cIdx+"]");
	else output(" fauxcock");
	output(" nestled in that ass, and you’re going to take as much time as it needs to make that happen.");

	output("\n\nHe seems to be enjoying himself, if the firm little thrusts of his hips as he futilely tries to grind into a phantom pussy are anything to go by. Every extra inch you feed into his greedy ass seems to trigger another wiggle from his spine and another hump into your [pc.hand]. With one last push, your hips grind into his butt and you hilt your");
	if (cIdx >= 0) output(" [pc.cock "+cIdx+"]");
	else output(" fake cock");
	output(", leaving his own fat, dripping dong to bump against your [pc.belly].");
	
	output("\n\nYou cup his cock to your body, rubbing the thick ridges of its underside against your [pc.skinFurScales]");
	if (pc.biggestTitSize() >= 4) output(" and nestling the plump head amongst your [pc.chest]");
	output(" whilst you idly stroke at the sensitive nodules along the top half. You rock back and forth into his ass, simultaneously");
	if (pc.biggestTitSize() >= 4) output(" fucking his cock between your tits.");
	else output(" rubbing against all of the most sensitive parts of his cock.");
	
	output("\n\n<i>“Good boy,”</i> you utter under your breath between thrusts, purposefully speaking not toward him per-se, but to his cock, your breath blowing over his glans for an extra little touch. He responds with a thick spurt of pre, oozing down your [pc.chest] and serving to help better properly smother his cock.");

	if (cIdx >= 0 && pc.hasKnot(cIdx))
	{
		output("\n\nYou work up to a good pace, thrusting into his ass with solid tempo and force, working him open slowly but surely. You change angle slightly and bare down on the bear, gliding the last few inches deep into him until your [pc.knot "+cIdx+"] nudges past his heavy balls and bumps right into the plump little donut of his ass. A ginger grind against the resistance signals your intentions; you’re not going to be satisfied until he’s taken every last thing you have to offer....");
		
		output("\n\nPulling back just enough to feel his softly furred sack drag back over your [pc.knot "+cIdx+"], you reverse course and grind the fat bulb against him. And again. And again.");
		
		output("\n\n");
		if (pc.biggestTitSize() >= 4) output("Every motion is deep enough to pop the head of his cock out from between your [pc.chest], only to thrust back between them again a moment later. ");
		output("You grind his cock heavily against yourself with every attempt, a near constant stream of pre liberally oozing down your [pc.belly] and over his balls... a faucet of lubrication dribbling across your [pc.knot "+cIdx+"]. It’s almost like he’s going out of his way to help you claim his ass! You hold yourself in position just there, warmth seeping into your [pc.cock "+cIdx+"] as ever greater splurts of Jerome’s pleasure add a thick shine to your bulbous knot.");
		
		output("\n\nWith a grunt you push forth one final time, your knot briefly held back by the tight ring threatening to reject its entry before being swallowed whole with an audible ‘POP!’.");
		
		output("\n\nThe fat intrusion nestling tight against his prostate finally sets the bear off, his cock cradled tight");
		if (pc.biggestTitSize() >= 4) output(" between your [pc.chest]");
		else output("ly against your chest");
		output(" when his orgasm finally hits. His dick flexes and throbs within your grip as it spews his heavy, thick load");
		if (pc.biggestTitSize() >= 2) output(" between your tits and");
		output(" over the bottom of your [pc.face], only for it to ooze back down and thoroughly coat the bear’s stout belly too. The suckling warmth sheathed so tightly around your [pc.cock "+cIdx+"] milks you firmly, vacuuming an orgasm out of you.");
	}
	else
	{
		output("\n\nYou work up a good pace, thrusting into his ass with solid temp and force, working him into a fervor slowly but surely. You change angle slightly and nudge his prostate with your");
		if (cIdx >= 0) output(" [pc.cockHead "+cIdx+"]");
		else output(" glowing cocktip");
		output(". His ass rewards you with an involuntary squeeze, the tight tunnel closing in around your sensitive flesh from all sides, doubling your pleasure in turn.");
		
		output("\n\nBack and forth you saw over the solid little bulb, your cock poking into it");
		if (cIdx >= 0 && pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_RIBBED)) output(" before slipping past, only for the heavy ribs along the underside of your cock to stimulate it even more");
		output(". Each little touch against that spot milking another heady spurt of pre from the fat log of dong cradled tight");
		if (pc.biggestTitSize() >= 4) output(" between your tits");
		else output(" against your chest");
		output(".");
		
		output("\n\n");
		if (pc.biggestTitSize() >= 4) output("Every motion is deep enough to pop the head of his cock out from between your [pc.chest], only to thrust back between them again a moment later. ");
		output("You grind his cock heavily against yourself with every thrust, a near constant stream of pre liberally oozing down your [pc.belly] and over his balls... a faucet of lubrication dribbling across your " + (cIdx >= 0 ? ("[pc.sheath "+cIdx+"]") : ("hardlight base")) + ".");
		
		output("\n\nWith one final retreat you settle your hips into the perfect angle, your target now properly sighted, and thrust, hard. Your");
		if (cIdx == -1) output(" faux");
		output(" cock batters firmly against the little bundle of nerves, finally setting Jerome off like a firework.");
		
		output("\n\nHis dick flexes and throbs within your grip as it spews his heavy, thick load");
		if (pc.biggestTitSize() >= 2) output(" between your tits and");
		output(" over the bottom of your [pc.face], only for it to ooze back down and thoroughly coat the bear’s stout belly too. The suckling warmth sheathed so tightly around your " + (cIdx >= 0 ? ("[pc.cock "+cIdx+"]") : ("strap-on")) + " milks you firmly, hoovering an orgasm out of you.");
	}

	output("\n\nStars explode across your vision as you struggle to stay upright under your own power, your legs threatening to give up from under you as his own orgasm tapers off.");
	if (cIdx == -1)
	{
		output(" Your simulated cock emulates the process of spewing a thick load deep into a needy pussy.");
	}
	else
	{
		output("\n\nYour [pc.balls] pulse");
		if (pc.balls < 2) output("s");
		output(" heavily as you pump a");
		if (pc.cumQ() <= 250) output(" tiny");
		output(" substantial");
		output(" wad of spunk deep inside.");
		if (pc.cumQ() >= 2500)
		{
			output(" Quart after quart throbbing along the");
			if (pc.cocks[cIdx].thickness() > 5) output(" thick");
			output(" length of meat impaling the bear’s ass; your body giving no concern to the fact that it’s pumping so much cum into a hole that can’t be bred.");
		}
		if (pc.cumQ() >= 7500) output(" After a while, you can feel each heavy splurt ripple out across Jerome’s gut as it touches your own, the sheer amount of spunk you’re capable of producing packing his ass full of jizz and adding an extra bit of weight to his already considerable frame.");
	}

	output("\n\nGathering your wits, now thoroughly sated and slathered in his cum, you let his cock flop free from your grasp");
	if (pc.biggestTitSize() >= 4) output(", a rush of air being displaced as it slips from your [pc.chest]");
	output(". The lewd squishes and squelches as you draw your half-hard cock from his ass almost tempts you into a second round as you separate from him.");

	output("\n\nA final step backward allows your");
	if (cIdx == -1) output(" faux");
	output(" cock to slip from his well-used ass. You take a moment to survey your work;");
	if (pc.cumQ() >= 2500) output(" a thick drool of your cum pours from his plump pucker, matched by an equally");
	else output(" a"); 
	output(" thick puddle");
	if (pc.cumQ() < 2500) output(" of cum");
	output(" soaking the fur across his gut, his cock laying in the mess limply.");

	output("\n\nYou");
	if (pc.isNaga()) output(" slither");
	else if (pc.isGoo()) output(" glomp");
	else output(" saunter");
	output(" off to your attached washroom to clean yourself up, Jerome’s spunk dripping from your [pc.face]");
	if (pc.biggestTitSize() >= 2) output(" and tits");
	output(" with every step. It takes a fair amount of effort to scrub yourself clean, having to hunt down every last nook and crevice that his explosive orgasm managed to spew his cum.");

	jeromePeggingMerge();
}

public function jeromeHipbuster():void
{
	clearOutput();
	showJerome(true);

	jeromeSceneIntro();

	output("\n\nA burning need quickly develops in your loins, stoked hotter with every throb of the bear’s chunky dick within your grasp. It just looks so thick and... <i>satisfying</i> straining against the bounds of its clothy prison. You slip your fingers under the edge of his underwear and tug them down. His fat cock jounces free just as soon as you’ve given it room to do so, slapping into the bear’s belly with a wet and hefty <i>thud</i>.");

	output("\n\nYou leave it to sit there for a moment, regarding its imposing girth as though the bear’s dickmeat were a dangerous creature just waiting for the perfect second to strike out at you. The thick ridges along its underside throb and bulge with every beat of Jerome’s heart, the undulations only serving to intensify the illusion further; a dangerous creature, thick, corded muscles wound tight and ready to attack when the moment is right.");

	output("\n\nThe sweltering void");
	if (pc.isBiped()) output(" between your thighs");
	else output(" inside you");
	output(" returns with a vengeance, demanding that your lusts be slaked; and the perfect tool for the job is pulsing away before your very eyes. A firm shove against the bear’s knees has him graciously part his legs for you as they hang off the edge of bed, providing all the space you need. Turning round");
	if (!pc.isTaur()) output(", you brace yourself against Jerome’s thighs, and");
	output(" lower your [pc.butt] down.");

	output("\n\nYou coo as the heat of the underside of his cock nestles up between your cheeks, a pleasant warmth wetly kissing at your [pc.asshole] as you settle down onto the fat cock. A firm grind of your");
	if (pc.isBiped()) output(" hips");
	else if (pc.isTaur()) output(" hindquarters");
	else output(" ass");
	output(" back and forth has the bear growling deeply in pleasurable bliss whilst the thick ridges tug sensually at your opening, spreading the slick precum liberally drooling from its tip all over your ass.");

	// Capture a bunch of state now before the subscenes can modify the properties that might change the results.
	// pass the object between the subscenes to maintain consistency.
	var s:Object = {};

	s.vIdx = -1;
	if (pc.hasVagina())
	{
		if (pc.gapestVaginaLooseness() >= pc.ass.looseness())
		{
			if(!pc.isBlocked(pc.gapestVaginaIndex())) s.vIdx = pc.gapestVaginaIndex();
		}
	}

	s.vGape = (s.vIdx == -1 ? pc.ass.looseness() : pc.vaginas[s.vIdx].looseness());
	s.vCap = (s.vIdx == -1 ? pc.analCapacity() : pc.vaginalCapacity(s.vIdx));
	s.holeStr = (s.vIdx == -1 ? "[pc.asshole]" : ("[pc.vagina " + s.vIdx + "]"));
	s.simpleHoleStr = function(vIdx:int):Function {
		return function():String {
			if (vIdx == -1) return RandomInCollection("ass", "asshole", "butthole");
			else return RandomInCollection("pussy", "cunt", "vagina");
		}
	}(s.vIdx);
	s.va = function(vIdx:int):Function {
		return function(v:String, a:String):String {
			return (vIdx == -1 ? a : v);
		}
	}(s.vIdx);

	// 9999 prefer a hole thats at least 4 gapeness if available (ass or vag), use vidx = -1 for asses

	if (s.vIdx >= 0) output(" A slight change of angle as you push back against him drags your [pc.cunts] over the ridges too, the texture pulling maddeningly softly against your netherlips.");
	output(" His cock swells with every rock of your hips, the girth of the bear’s tumescent cock increasing as your [pc.buttcheeks] mold around it.");

	output("\n\nWith one last twist of your [pc.hips] you lift your ass");
	if (s.vIdx >= 0) output(" and cunt");
	if (pc.vaginas.length > 1) output("s");
	output(" away from Jerome’s dick to give him an eyeful of your pre-slicked undercarriage.");
	if (pc.balls > 0)
	{
		output("\n\nThe motion carries through your body and");
		if (pc.ballSize() <= 3) output(" brings");
		else if (pc.ballSize() <= 8) output(" jostles");
		else output(" swings");
		output(" your"); 
		if (pc.ballSize() <= 3 && pc.hasStatusEffect("Uniball")) output(" trappy");
		else if (pc.ballSize() >= 10) output(" bloated");
		output(" ball");
		if (pc.balls > 1) output("s");
		output(" just close enough for");
		if (pc.balls == 1) output(" it");
		else output(" them");
		output(" to bump into the bear’s");
		if (pc.ballSize() <= 3) output(" much larger");
		else if (pc.ballSize() <= 8) output(" larger");
		output(" velveteen own. An uncontrollable shudder lances through your [pc.legOrLegs] as the soft, fuzzy covering of his sack tickles you pleasantly, your [pc.knees] weakening and lowering you just enough to fully rest your [pc.balls] atop the bear’s.");
		if (pc.ballSize() <= 3) output(" They utterly dwarf your tiny nuts by comparison, as ponderously massive the bear’s endowments are.");
		else if (pc.ballSize() <= 8) output(" Even your respectably large balls pale in comparison, as ponderously massive the bear’s endowments are.");
		else if (pc.ballSize() <= 12) output(" As hefty as you consider yourself, the bear seems almost equally well equipped.");
		else
		{
			output(" As ponderously massive as the bear’s balls may be, you’ve got him beat");
			if (pc.ballSize() >= 15) output(" easily");
			output(" in that department.");
		}
		output(" You can <i>feel</i>");
		if (pc.ballSize() <= 12) output(" them");
		else output(" his balls");
		output(" rumbling below you, so productive and overfull; it’s almost as if they’re just begging for a tight hole to thunderously unload their virile contents into.");
	}
	else
	{
		output(" A patchwork of gloopy splotches coat you from back to thighs, the bear’s freely flowing precum drooling thickly and getting <i>everywhere</i>. You can feel it beading on your [pc.skinFurScales] and pulling away from your body as it flows slowly, dripping down onto the bear below. Your hand subconsciously finds its way to his sack, fingers gently cupping the ponderously massive spunk factories. You can <i>feel</i> them rumbling in your grasp, so productive and overfull; it’s almost as if they’re just begging for a tight hole to thunderously unload their potent contents into.");
	}

	output("\n\nYou cast a fiery glance over your shoulder. Jerome is seemingly transfixed by your [pc.butt] hovering so close to his dick. His restraint is palpable, desperately holding back his desire to grab hold of the focus of his lust and fuck it senseless; the look in his eyes tells you all you need to know... but you’ve not given him your consent- your <i>permission</i> - yet.");

	output("\n\n<i>“Something the matter, </i>bear<i>?”</i> you sultrily tease.");
	
	output("\n\n<i>“Please...”</i> he grunts through gritted teeth.");
	
	output("\n\n<i>“Please what?”</i>");
	
	output("\n\n<i>“Please, I’m gonna explode.”</i> He sounds almost anguished that his dick isn’t buried in you right this second.");
	
	output("\n\nHis fat cock once again finds itself sandwiched between your [pc.buttcheeks] as you lower yourself back down and grind your way back up the length of his ridged dick, collecting a fresh sheen of pre in the process. His eyes look set to pop free from his head, so enamored they must be with your glistening [pc.asshole].");

	output("\n\n<i>“I don’t know- it doesn’t sound like you </i>really<i> want to,”</i> you tease.");

	output("\n\nJerome lets out a little defeated grunt.");

	output("\n\n");
	if (pc.isNice()) output("<i>“Tell me what you want and then maybe I can help you out,”</i>");
	else if (pc.isMisc()) output("<i>“Tell me what you want and then maybe - </i>maybe<i> - I’ll see what I can do to help,”</i>");
	else output("<i>“Tell me what you want and then maybe I’ll see what I can do,”</i>");
	output(" you tell him with an authoritative tone.");

	output("\n\n<i>“Please, let me fuck your");
	if (s.vIdx == -1) output(" [pc.asshole]");
	else output(" [pc.cunt "+s.vIdx+"]");
	output(", wrap your");
	if (s.vGape < 4) output(" tight");
	else output(" perfect");
	if (s.vIdx >= 0) output(" cunt");
	else output(" pucker");
	output(" around my cock and fuckin’ cum my brains out before my balls </i>explode<i>. I need it, I </i>need<i> to cum [pc.name], I need to fuck my massive balls dry before I pop- it fucking </i>hurts<i> seeing such a succulent, juicy");
	if (s.vIdx >= 0) output(" pussy");
	else output(" ass");
	output(" just screaming for a proper dick, screaming for a massive load of jizz </i><b>please</b><i>”</i>, he rambles, faster and faster as he goes.");

	output("\n\n<i>“Really? You like my");
	if (s.vIdx >= 0) output(" pussy");
	else output(" ass");
	output(" that much?”</i> you quip.");

	output("\n\nRather than try and speak again, Jerome just harrumphs affirmatively.");
	
	clearMenu();
	addButton(0, "Next", jeromeHipbusterII, s);
}

public function jeromeHipbusterII(s:Object):void
{
	clearOutput();
	showJerome(true);

	output("<i>“Well be a good boy,”</i> you start, lifting your hips up higher, <i>“and line that fat dick up for me.”</i>");
	
	output("\n\nNo sooner have the words left your mouth does a heavy, wet <i>’smack’</i> greet your ears, the fat tip of the bear’s cock slapping into your [pc.asshole]");
	if (s.vIdx >= 0) output(" before trailing further forward and parting the lips of your [pc.vaginaNounSimple "+s.vIdx+"]");
	output(" as he follows your order. Lodged in place with the fat cumvein perfectly poised, it’s not long before your "+s.holeStr+" is treated to its first direct, thick injection of Jerome’s liberal lubrication.");

	if (s.vGape < 4)
	{
		output("\n\nSlowly you begin to lower yourself down, putting weight on the joining between your "+s.simpleHoleStr()+" and the tree trunk of a dick attempting to batter its way inside you. It’s slow going, but between the bear's over productive balls");
		if ((s.vIdx == -1 && pc.ass.wetness() >= 4) || (s.vIdx >= 0 && pc.hasVagina() && pc.vaginas[s.vIdx].wetness() >= 4))
		{
			output(", your own sopping wet "+s.simpleHoleStr()+",");
		}
		output(" and no short amount of determination, the bulbous head of his dick gradually works its way closer to being sheathed in you.");
		
		if (s.vIdx >= 0) pc.cuntChange(s.vIdx, jerome.biggestCockVolume(), true, true, false);
		else pc.buttChange(jerome.biggestCockVolume(), true, true, false);
		
		output("\n\nA needy groan builds in your throat as the tipping point is reached; one more push sees the bear’s tip finally slip into you, paving the way for the rest of his thick dick to follow. Inch by inch it slips deeper, the ridges and the bumps each serving as a minor roadblock before your "+s.holeStr+" once again relaxes enough to swallow them.");
		
		output("\n\nYou finally come to a stop with a quarter of his dick still left to go; the sheer thickness of the bear’s cock, combined with how tightly your "+s.simpleHoleStr()+" is wrapped around it, stops you from taking any more of it under your own power. Even lifting your [pc.feet] from the floor to use all of your weight as leverage barely moves you anymore. You’re not going to be satisfied having come <i>this close</i> to taking the entire thing. Only one thing for it then....");
		
		output("\n\n<i>“Be a good boy and help a "+ pc.mf("guy", "girl") +" out?”</i>");
		
		output("\n\nHis hands are wrapped around your [pc.hips] in an instant, his powerful muscles working to pull you lower, yet his grip feels surprisingly measured and careful. Your slow descent resumes with Jerome’s aid, his thickly ridged cock gradually burrowing its way into you even as the bear’s breathing grows more desperate. His need to have something wrapped tightly around the entirety of his massive cock becoming ever more pressing, testing his restraint to the limit.");
	}
	else
	{
		output("\n\nYou begin to lower yourself down, putting weight on the joining between your " + s.simpleHoleStr() + " and the tree trunk of a dick attempting to batter its way inside you.");
		if (s.vIdx >= 0) pc.cuntChange(s.vIdx, jerome.biggestCockVolume(), true, true, false);
		else pc.buttChange(jerome.biggestCockVolume(), true, true, false);
		output(" As experienced as you are when it comes to handling such impressively large endowments, Jerome still proves to be somewhat of a stubborn challenge; his girth alone is beyond the limits of all but the most determined and promiscuous of potential partners. The thick ridges running all the way along its underside only seem to amplify his already ridiculous proportions to the absurd, the feature both deeply pleasurable yet difficult to acclimatize to quickly.");

		output("\n\nThe bear’s over productive balls providing a near endless stream of lubrication directly to your "+s.simpleHoleStr()+", combined with no shortage of determination, keep your inexorable slide toward your goal on track. Inch after inch of fat bear cock disappears into you, replaced with the glowing internal warmth of your body stretching around the thick invader.");
	}

	output("\n\nSoft fuzz tickles at your [pc.butt] as you come to an abrupt halt, the bear’s hips having finally met your rear. A wiggle of your hips grinds his cock into all of your most deliciously sensitive places and settles you completely around his cock, leaving you sat flush with his pelvis. Jerome’s legs tremor as you shift around; you can feel his muscles straining against your [pc.skinFurScales] as the shudder makes its way up to his hips. He’s barely keeping himself together on your behalf, his body warring against itself as he holds back his hips from thrusting, from driving his cock into the tight sheath wrapped so thoroughly around it.");

	output("\n\nYou brace yourself against Jerome’s thick thighs and lift yourself up, your "+s.holeStr+" so snug around the fat bearcock you almost feel anchored in place. The bumps and crevices adorning its surface pull at your deepest, most sensitive places as you gingerly slide up its length. Ridge after ridge slips");
	if (s.vIdx >= 0)
	{
		if (pc.hasClit()) output(" past your [pc.clit]");
		else output(" through your stretched-taught labia");
	}
	else
	{
		if (pc.hasCock()) output(" over your [pc.prostate]");
		else output(" out of your [pc.asshole]");
	}
	output(", grinding pleasure into your flesh as each one passes with a flick.");

	output("\n\nThe sensation comes to a stop all too soon, and it’s only with its absence that the lust-fueled befuddlement clouding your mind starts to dissipate. Your legs are straight, stood as high as you can, and");
	if (pc.tallness >= 72) output(" the bear’s chunky cockhead is still buried in your");
	else if (pc.tallness >= 60) output(" there’s still a couple of inches of fat bearcock buried in your");
	else output(" half of the bear's thick dick is still buried in your");
	output(" " + s.simpleHoleStr() + ". Guess there’s only one thing for it then...");
	
	processTime(10 + rand(3));
	
	clearMenu();
	addButton(0, "Next", jeromeHipbusterIII, s);
}

public function jeromeHipbusterIII(s:Object):void
{
	clearOutput();
	showJerome(true);

	output("Properly warmed up, your "+s.holeStr+" greedily slips back around Jerome’s cock with far greater ease than the initial, " +s.va("cunt-stretching", "gut-straining") +" penetration. The ridges thrum against your");
	if (s.vIdx >= 0 && pc.hasClit()) output(" [pc.clit]");
	else if (s.vIdx >= 0) output(" cuntlips");
	else if (pc.hasCock()) output(" [pc.prostate]");
	else output(" [pc.asshole]");
	output(" like an overpowered vibrator as you inexorably drop towards the bear’s crotch. All too soon, it feels like, you run out of cock as your [pc.ass]");
	if (pc.buttRating() <= 6) output(" bumps");
	else if (pc.buttRating() <= 12) output(" slaps");
	else output(" pancakes");
	output(" against your well-behaved cock-pet and you bottom out on his thick dickmeat. The wet slap of your ass against Jerome’s pelvis mixes with a deep groan from the bear, a noticeable throb snaking its way up the length of his cock before spilling out to spread fresh liquid-heat deep into your");
	if (s.vIdx >= 0 && pc.isPregnant(s.vIdx)) output(" cunt");
	else if (s.vIdx >= 0) output(" womb");
	else output(" bowels");
	output(".");
	
	output("\n\nYou wait a little, letting your");
	if (s.vIdx >= 0)
	{
		if (pc.hasPerk("Fertility") || pc.hasPerk("Incubator")) output(" ravenously cum-hungry");
		if (pc.isPregnant(s.vIdx)) output(" cunt");
		else output(" womb");
	}
	else output(" guts");
	output(" reaffirm");
	if (s.vIdx >= 0) output(" its");
	else output(" their");
	output(" claim over the thick invader stretching your");
	if (s.vIdx >= 0)
	{
		if (pc.hasPlumpPussy(s.vIdx)) output(" pumped-up");
		output(" pussylips");
	}
	else
	{
		if (pc.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || (s.vGape >= 3 && s.vGape < 5)) output(" puffy asshole");
		else if (pc.ass.hasFlag(GLOBAL.FLAG_PUMPED) || (s.vGape >= 5 && s.vGape < 7)) output(" plump donut");
		else if (pc.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) || s.vGape >= 7) output(" extremely fat donut");
		else output(" asshole");
	}
	output(" wide. The delectable strumming of the ridges calls to you before too long, your hips moving instinctively to drag the bear’s cock back out of you. You don’t wait around when you reach the peak this time, though, your ass sliding back down to swallow the throbbing cock much faster than your first descent. His hips meet your [pc.ass] with a thump as you reach the base of his towering pillar of fuckflesh again, another slightly-winded groan from the bear as you come to rest.");

	output("\n\nYour");
	if (s.vIdx >= 0 && pc.hasClit()) output(" [pc.clits] are thrumming");
	else if (s.vIdx >= 0) output(" g-spot thrums");
	else if (pc.hasCock()) output(" [pc.prostate] thrums");
	else output(" asshole thrums");
	output(" with pleasure almost immediately as you reverse course, your");
	if (s.vGape <= 3) output(" tight");
	else output(" snug");
	output(" hole heading back towards the peak of cock-mountain. No sooner");
	if (pc.legCount >= 2) output(" are your [pc.legs]");
	else output(" is your [pc.leg]");
	output(" straight, back as high as you can go, do you come crashing back down to the chubby, bear-shaped earth beneath your [pc.ass]. The ever increasing coating of precum Jerome is spurting thickly into your");
	if (s.vIdx >= 0) output(" [pc.cunt]");
	else output(" [pc.asshole]");
	if (s.vGape <= 3) output(" - not to mention the thorough reaming-out his cock is giving you -");
	output(" lets you thunder up and down his length faster with every hip-jarring bounce. The faster you go, the better the ridges feel passing");
	if (s.vIdx >= 0 && pc.hasClit())
	{
		output(" over your");
		if (pc.clitLength > 2) output(" engorged");
		output(" pleasure-button");
	}
	else output(" through you");
	output(". Jerome grunts as you slam into his hips, which only fuels your lust to headier heights; the thought that you might just be too much for the bear to handle playing on your mind.");

	output("\n\nThe pace of your fucking grows faster as you chase the building pleasure in your");
	if (s.vIdx >= 0) output(" [pc.cunts]");
	else if (pc.hasCock()) output(" [pc.cocks]");
	else output(" [pc.asshole]");
	output(", gradually shifting position as you lean further forward for extra leverage. A deep, rolling coo oozes from your throat like honey as the cock drilling into your depths grinds into you in new and interesting ways, mixing with the subtle, stinging warmth building in your [pc.ass] as you keep slamming butt-first into the bear.");
	if (pc.balls > 0)
	{
		output(" He shivers under you when the changing angle of attack positions you just right for your [pc.balls] to just barely kiss Jerome’s own bloated, velveteen nuts; a tender touch that you ensure repeats with every subsequent hip-battering, "+ s.va("cunt", "ass") +"-blastingly powerful stroke.");
	}
	
	output("\n\n<i>“I’m gonna- I’m gonna cuu-urgh!”</i> Jerome yells, his voice breaking into a gurgling-roar as you bottom out one last time.");
	
	output("\n\nHis cock throbs even thicker within your "+ s.va("pussy", "ass") +", the ridges engorging and sinking into");
	if (s.vIdx >= 0) output(" the folds of");
	output(" your sodden flesh just enough to anchor you with your ass planted squarely atop the bear’s bucking hips. A bulge of extra thickness rolls up his length, the same ribs keeping you stuck in place and grinding into you");
	if (s.vIdx >= 0) output("r g-spot");
	else if (pc.hasCock()) output("r prostate");
	output(" in a long, pulsing wave.");
	if (pc.balls > 0)
	{
		output(" With your [pc.balls] nestled");
		if (pc.ballSize() <= 3) output(" on");
		else if (pc.ballSize() <= 12) output(" against");
		else output(" around");
		output(" the bear’s balls, you can feel them pull taught, rumbling under you to fuel his spunk-spewing cock.");
	}
	output(" Heat blooms in your");
	if (s.vIdx >= 0 && pc.isPregnant(s.vIdx)) output(" cunt");
	else if (s.vIdx >= 0) output(" womb");
	else output(" bowels");
	output(" as Jerome’s thick load thunders out of his tumescent prick, providing the final spike of pleasure to push you over the cliff and face-first into a deeply satisfying orgasm of your own.");

	if ((s.vIdx >= 0 && !pc.isPregnant(s.vIdx)) || s.vIdx == -1)
	{
		output("\n\nPermeating heat builds in your "+ s.va("womb", "ass") +" with every heavy load of cum deposited; the rolling bulges traveling along your now over-sensitive canal mixing with the instinctively satisfying final chapter of your coupling with the bear drawing out your orgasm.");
		
		output("\n\nIt could be minutes, or it could be seconds, you’re not sure which, but you eventually start to return to some semblance of sensical thought, drawn out of your blissful coma by a subtle gurgling noise. Jerome’s prodigal virility has proven itself well, your belly rounded out into a sizable paunch given the sheer quantity of jizz he’s managed to stuff into your");
		if (s.vIdx >= 0)
		{
			if (pc.hasPerk("Fertility") || pc.hasPerk("Incubator")) output(" cum-hungry");
			output(" cunt");
		}
		else output(" ass");
		output(". So stuffed that the last waning jets of his orgasm are spurting out through your cock-plugged "+ s.va("cunt", "ass") +" and splattering his groin.");

		if (s.vIdx >= 0)
		{
			pc.loadInCunt(jerome, s.vIdx);
			pc.maxOutCumflation("vagina " + s.vIdx, jerome);
		}
		else
		{
			pc.loadInAss(jerome);
			pc.maxOutCumflation("ass", jerome);
		}
	}
	else
	{
		output("\n\nPermeating heat builds in your pussy with every heavy load of cum deposited; the rolling bulges traveling along your now over-sensitive canal mixing with the instinctively satisfying final chapter of your coupling with the bear drawing out your orgasm.");
		
		output("\n\nIt could be minutes, or it could be seconds, you’re not sure which, but you eventually start to return to some semblance of sensical thought, drawn out of your blissful coma by a subtle spattering noise. Jerome’s prodigal virility has proven itself well, a near-constant stream of his waning orgasm spurting out through your cock-plugged cunt to splatter his groin.");
	}

	output("\n\nGathering your wits, now thoroughly sated and with");
	if ((s.vIdx >= 0 && !pc.isPregnant(s.vIdx)) || s.vIdx == -1) output(" a belly full of cum");
	else output(" a cum-splattered crotch");
	output(", you start the arduous task of extracting his still semi-erect cock from your well-fucked "+s.va("pussy", "ass") +". The exertion of the last half-hour has left your");
	if (pc.hasKnees()) output(" knees");
	else output(" [pc.legOrLegs]");
	output(" weak, but with a solid heave you manage to get to your [pc.feet] and feel his cock flop free from your still weakly spasming tunnel.");
	
	output("\n\nYou take a moment to survey your work; Jerome is still out of it, fucked to exertion. A thick puddle of cum is soaking into the fur around his crotch with his half-limp cock draping across his gut to smear your mixed juices around. The skin visible around his crotch is tinged a noticeably rosy shade - a reminder of the heat throbbing away in your [pc.ass] as the cause of his tender flesh.");
	
	output("\n\nYou");
	if (pc.isNaga()) output(" slither");
	else if (pc.isGoo()) output(" glomp");
	else output(" saunter");
	output(" off to your attached washroom with a noticeable kink in your");
	if (pc.isTaur() || pc.isBiped()) output(" step");
	else output(" movement");
	output("; you’re definitely not going to be [pc.walking] right for a while after that performance, a certain sense of... hollowness between your");
	if (s.vIdx >= 0 && pc.hasLegs()) output(" legs");
	else output(" cheeks");
	output(".");

	jeromePeggingMerge();
}

public function jeromeSceneIntro():void
{
	moveTo("SHIP INTERIOR");

	output("You grab hold of his arm and pull him away from his seat.");
	if (pc.tallness > 80 || pc.tone > 80) output(" As large as you are yourself, h");
	else output(" H");
	output("is limb utterly dwarfs your grip, betraying an overwhelming difference in physical potential. There’s no way you could lead him this easily if he didn’t <i>really</i> want to follow your insistent pull; this is going to be <i>good</i>.");

	//output("\n\nDragging him towards the docking platforms, you don’t even spare a single glance backwards. The sooner you get back to your ship, the better, and you don’t want to waste a moment... and all the better to keep the stout mountain of man from falling out from under your spell.");
	output("\n\nDragging him towards the elevator, going up to the station proper, and making way to the docking platforms, you don’t even spare a single glance backwards. The sooner you get back to your ship, the better, and you don’t want to waste a moment... and all the better to keep the stout mountain of man from falling out from under your spell.");

	//output("\n\nRounding one final corner, you come face to face with your ship. A quick wave of your codex and the loading ramp responds, a heavy thunk of metal-on-metal allowing you to drag your thrall on board and into your cabin.");
	output("\n\nAfter traveling through the tether and rounding one final corner, you come face to face with your ship. A quick wave of your codex and the airlock responds. A hiss of pressurized air escapes and the door opens, allowing you to drag your thrall on board and into your cabin.");

	output("\n\nA firm hand placed on the bear’s chest, followed by an insistent shove is all it takes to send him sprawling backwards, a potentially painful landing arrested by a heavy woosh of air being forced out of your bed. Now on equal footing, you turn away from him");
	if (!(pc.armor is EmptySlot)) output(" and strip out of your [pc.armor]");
	else output(" and remove your equipment");
	output("; a quick peek over your shoulder");
	if (!(pc.armor is EmptySlot)) output(" as you stand back upright");
	output(" rouses him into action, his eyes tearing away from your");
	if (pc.lowerUndergarment is EmptySlot) output(" naked [pc.butt]");
	else output(" [pc.lowerUndergarment]-clad ass");
	output(" in a flash as his hands fumble with a resistant belt buckle.");

	output("\n\nClosing in, you grab at the bottom of his pants and help to slide them from his legs, an appreciative rumble emanating from his chest as means of thanks. With them out of the way, you’re free to properly appreciate the size and scale of his cock, his half-chub threatening to tear through the front of his boxers at any moment. A series of nubs are plainly visible through the fabric, the fingertip-sized nodules testing the limits of the cloth to the extreme, and they’re just <i>begging</i> for a little attention.");
	
	output("\n\nWith his hips off the edge of the bed, a firm push against his fur-lined knees is all you need to part them, giving you leave to slip between them and lay your [pc.hand] on his still-obscured dick. You give him a firm grope, your fingers wrapping partially around the heavy mass of cock - <i>damn</i> he’s big - and tease a few of the nubs near the fat head, the shape of it clear through his underwear.");
	
	output("\n\nYou’re rewarded almost immediately with another rumbling groan as a slick patch of pre spurts from his length, darkening the cloth as the musky ooze wicks through the fabric. Another hand-overflowing squeeze produces a near identical result, the bear relaxing bonelessly into the comfortable softness of your bed, content to let you massage his fat dick for as long as you deem suitable.");
}

public function jeromePeggingMerge():void
{
	pc.shower();
	processTime(30+rand(10));
	pc.orgasm();
	output("\n\nBy the time you step out of the steam-infused room and back into your bedroom, Jerome is gone. Presumably he slinked back off to his own bed to recover.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}