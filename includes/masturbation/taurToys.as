//[Masturbate] -> [TaurEquipment]
//[Milker]
//Requires cock.
//tooltip:Use the Stud-Milker to get yourself off.
//Invalid:You’ll need a cock to use the Stud-Milker.
public function masturbateWithTaurMilker():void
{
	clearOutput();
	showName("\nSTUD-MILKER");
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	output("You’ve got all this equipment laying about in the hold - you might as well use it.");
	output("\n\nApproaching the milker, you give it a quick once-over" + (!pc.isCrotchExposed() ? " while you take your [pc.crotchCovers] off":"") + ". With its adjustable height it’s not too much trouble to set it up the right way and since it was originally designed for tauric races, it can accommodate even the largest of cocks with its almost organic stretching function: a proper Stud-Milker, indeed.");
	output("\n\nRight now, though, you’re not overly concerned with the somewhat fancy settings - just with busting a massive nut inside it." + (pc.isTaur() ? " Mounting the milker and a":" A") + "ligning your [pc.cock " + x + "] with the entrance, you slide yourself in and groan in pleasure" + (flags["STUD_MILKED"] == undefined ? " as you discover the depth of its functionality. A gentle friction grips at you, warmth enveloping your rock-hard shaft as the milker self-adjusts to take you in with the tightest fit it can. Fuck... it even lubricates itself.":" while you reacquaint yourself with the various systems designed to please you. It hugs and squeezes your painfully hard member, taking you deeper."));
	output("\n\nThere’s no need to consider your partner; these things were made to take a fucking <i>beating</i>. Gripping it tightly" + (pc.isTaur() ? " between your [pc.legs]":" with your hands") + ", you use them to steady yourself as you begin to slide yourself home. Slower at first, but as the machine gets warmer and wetter you find yourself naturally inclined to just let it all go and fuck it as hard as you can.");
	output("\n\nSoon you’re grunting and panting, sweat starting to run down your " + (pc.tone < 30 ? "soft ":"") + (pc.tone > 70 ? "finely chiselled ":"") + "body as you approach an orgasm that the milker seems to want every bit as much as you do. It sucks at your [pc.cockHead " + x + "], encouraging you to blow as soon as you can and endeavoring to bring you to the point of climax. It doesn’t take too long.");
	output("\n\nGroaning, you hilt yourself" + (pc.cocks[x].cLength() >= 48 ? " - a rarity for you, owing to your size -":"") + " and feel the first load all but squeezed from the end of your" + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? " blossoming,":"") + " pulsing cock. It’s like there’s a set of careful, loving fingers that gently milks you from base to tip, the origin of the motion repeating before it’s even ended. The end result is you slumping over the milker moaning out loud, futilely humping the machine while it greedily sucks you dry." + (pc.cumQ() >= 15000 ? " The excess spews to the ground but it does better than you expected - better than most actual partners, for sure.":""));

	output("\n\nYou’re sedately massaged through your entire orgasm");
	if(pc.balls > 0) output(", your [pc.balls] aching as " + (pc.balls == 1 ? "it’s drained" : "they’re emptied") + " to the very last drop");
	output(".");
	
	processTime(20);
	pc.orgasm();
	
	output(" You finally withdraw with a satisfied sigh, patting the machine in appreciation.");
	if(amberIsCrew())
	{
		output("\n\nYou know, you could call Amber over to trade shots in this thing... watching her buck and moan as it swallows her swollen cock might be fun.");
		clearMenu();
		addButton(0,"Call Amber",callAmberForMoreFun,undefined,"Call Amber","Call Amber over and see if she wants to take turns fucking the milker.");
		addButton(14,"Leave",mainGameMenu);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	IncrementFlag("STUD_MILKED");
}

//[Call Amber] [Leave] / [Next] (if no Amber)
//[Call Amber]
//tooltip:Call Amber over and see if she wants to take turns fucking the milker.
public function callAmberForMoreFun():void
{
	clearOutput();
	amberHeader();
	output("<i>“Amber!”</i> you call across the hold, looking for the lively deertaur. <i>“You around?”</i>");
	output("\n\nYou hear light hoof-falls before your dryad lover pokes her curious head around the corner of a crate and smiles.");
	if(amberDumbfuckDoses() == 0) 
	{
		output("\n\n<i>“Oh, hiya [pc.name]!”</i> Amber says, drawing closer. <i>“I thought I heard something over here, but you never know with this ship... so, what’s up? You having fun?”</i>");
		output("\n\n<i>“Sure am,”</i> you say, grinning. <i>“Whaddya say about joining me?”</i>");
		output("\n\n<i>“Never been one to turn down fun with my captain,”</i> she replies, grinning back.");
		output("\n\nYou stand back and watch as she mounts the milker, aligning her hefty, dripping dick with its entrance. A soft sigh of contentment escapes her lips as she slides inwards, looking over at you with a faint smile as she lets the machine adjust to her.");
		output("\n\n<i>“Do you like seeing me fuck it?”</i> Amber asks, pulling back before thrusting halfway back in. <i>“The way my cock just disappears into it... god, I can </i>feel<i> my balls filling up with cum. Having you watch is like ten times fucking hotter for some reason...”</i>");
		output("\n\nLeaning back, you let your hand fall away from your dick. She’s starting to really get into it and you want to focus on the sight - not to mention you’re definitely not going to need any help getting it back up. Just watching Amber lose herself in the pleasure is enough of a catalyst, your spent prick standing once more as the deergirl begins bucking and panting above the milker.");
		output("\n\n<i>“Hhhgh- fuck,”</i> she pants, shaking her head as she pauses for a second. <i>“I’m not gonna last long at all- nngh! I can feel your fucking cum coating my cock and it’s so- it’s so- nnnhm!”</i>");
		output("\n\nAmber breaks off her sentence to keep thrusting,  groaning louder and louder until she utters a scream of delight and stumbles forward, hilting herself while she hugs the milker to her body. Shudders run up and down her spine, culminating in her hindlegs shivering while she pours her essence into her mechanical partner. You can see her " + (amberEquilicumDoses() > 0 ? "gigantic quadballs":"hanging nuts") + " tighten up against her underside, the thick base of her cock pumping and pulsing in time with them.");
		output("\n\nJust like you she clings to the milker even after the main event is over, enjoying those last few seconds of attention before it comes to be too much. Pulling out, she sighs and gives you a happy smile.");
		output("\n\n<i>“You’re up next - looks like I don’t need to give you any more inspiration there, haha!”</i> Amber laughs, looking down at your cock impressed. <i>“Wow, you’re harder than a fucking rock.”</i>");
		output("\n\n<i>“What can I say?”</i> you say, shrugging and grinning at her. <i>“You’re my muse.”</i>");
		output("\n\nYou stand back in front of the milker again, looking at the way it drips with Amber’s spunk. A trail of it drools downwards to the floor, forming a puddle beneath. Sliding yourself back in, you find you don’t have to wait for lubrication this time around - Amber’s delivered on that front, and in heaping spades. You waste no time reinserting yourself, sliding into its warm, soaking depths.");
		output("\n\nShe was right, too - this <i>is</i> a lot hotter with her watching your every move intently, checking out the way your butt flexes and your hips buck as you thrust. Her cum splatters against your groin, mixing in with the precum dribbling from your cock and dripping down your" + (pc.balls > 1 ? " tightening balls.":" front.") + " The noise of your thrusts soon fills the room, the rest of the world fading away while the milker pleasures you. You cum with a moan, not realizing Amber’s snuck up behind you until her bare breasts are laid against your back, her hands squeezing your [pc.ass] while you buck and groan.");
		output("\n\n<i>“Oooh, fuck, this </i>is<i> really hot,”</i> she moans in your [pc.ear], licking your neck while her hands roam up your body. <i>“You’re cumming so hard, I can feel it...”</i>");
		output("\n\n<i>“My turn!”</i> Amber sings when you’re done, already hard and eager. <i>“Oh maaan, this is getting </i>wet<i>! Mmmm...”</i>");
		output("\n\nThe two of you trade back and forth until you collapse, lying against each other in a sweaty heap, breathing hard and laughing.");
		output("\n\n<i>“I don’t think I’ve ever been so happy to fuck an inanimate object!”</i> Amber half-gasps, half-giggles.");
		output("\n\n<i>“You’re telling me!”</i> you pant, patting her tauric flank. <i>“Hell, I don’t know if I’d even still call it inanimate!”</i>");
		output("\n\n<i>“Hahaha!”</i> Amber bursts out laughing. <i>“The milker might be a better fuck than some of the barflies!”</i>");
		output("\n\nYou stay there, laid across her back half and resting until standing up again seems like a feasible idea. You help Amber back to her shaky feet and she leans in to give you a kiss, lingering on your lips just a second too long to call it casual.");
		output("\n\n<i>“Okay,”</i> she says, pulling back with a grin. <i>“I’d better get to cleaning up before we make a whole new mess. See you soon, Steele.”</i>");
		output("\n\n<i>“Later,”</i> you say, waving her off as you stretch. You’ve lost count of how many times you came with Amber, your [pc.hips] slightly sore in the wake of it all. Using the milker turned out to be pretty fun after all.");
	}
	else
	{
		if(amberDumbfuckDoses() == 1)
		{
			output("\n\n<i>“Heya, [pc.name]!”</i> Amber says, looking you up and down as she draws nearer. <i>“So that’s what the noise was! I hope you called me over to join in...”</i>");
			output("\n\n<i>“Looks like you’re in luck, then,”</i> you announce, patting the milker. <i>“Getcha fluffy butt over here.”</i>");
			output("\n\n<i>“Ooh, yes " + (pc.mf("sir","ma’am")) + ",”</i> Amber giggles.");
		}
		else if(amberDumbfuckDoses() == 2) 
		{
			output("\n\n<i>“[pc.name]!”</i> Amber says, hopping closer and clinging to your arm. <i>“Were you using the milker? Oh, man... look at it. That’s fucking hot.”</i>");
			output("\n\n<i>“What’d be hotter is if you fucked it too,”</i> you suggest, nodding your head at the milker. <i>“I wanna see you mount it.”</i>");
			output("\n\n<i>“Wow, not gonna say no to </i>that<i>,”</i> she murmurs excitedly.");
		}
		else if(amberDumbfuckDoses() == 3)
		{
			output("\n\n<i>“[pc.name],”</i> Amber moans, her freckled cheeks already a little flushed. <i>“I’m so pent up... do you wanna fuck?”</i>");
			output("\n\n<i>“Come over here, then,”</i> you say, jabbing your thumb at the milker. <i>“Work out all that pent-up cum in those oversized balls of yours.”</i>");
		}
		else
		{
			output("\n\n<i>“[pc.name],”</i> Amber pants, freckled cheeks ablaze with barely-concealed lust. She drinks in the sight of you standing there before spotting the milker’s been used. <i>“Oh... oh! Oh... did you already fuck, [pc.name]?”</i>");
			output("\n\n<i>“There’s more to come,”</i> you promise, watching her visibly lighten up. <i>“C’mere and fuck it yourself. We’ll trade every time one of us cums, alright?”</i>");
			output("\n\n<i>“Alright,”</i> she breathes, drawing closer. You can see her gigantic cock, formerly drooping and drizzling precum, straighten up and become hard as a fucking rock underneath her white-furred tummy.");
		}
		output("\n\nShe mounts the milker with an enthusiasm born of need, grunting in pleasure as she slides herself into the welcoming orifice and letting out a moan when it begins to respond to her.");
		output("\n\n<i>“Fuuuck,”</i> she pants, thrusting harder.");
		if(amberDumbfuckDoses() <= 2) output(" <i>“This feels fucking </i>great<i> with all your cum inside it! Nnnf!”</i>");
		else output(" <i>“So good! Sooo good!”</i>");
		output("\n\nThe sight of her banging away at the milker, her " + (amberEquilicumDoses() > 0 ? "heavy, cum-filled quadballs":"large, cum-weighted balls") + " slapping against its cushioned surface, is more than hot enough to get you hard again without manual stimulation. The sex pheromones pour off her in waves with every thrust, her nutsack drawing taut and tightening as she gets closer and closer to cumming.");
		output("\n\n<i>“Oh god, oh god, fuck,”</i> Amber gasps, voice high-pitched and feverish. <i>“Gonna cum, gonna cum, gonna cuuuum!”</i>");
		output("\n\nShe bucks her feminine hips with such power you wonder for a moment if the milker can really stand it, Amber’s cries and grunts becoming more strained by the second.");
		output("\n\n<i>“NNNNNGGGGH!”</i> Amber groans through grit teeth, her entire body rippling from front to back as she sinks herself balls-deep. <i>“Uuuuugggh! Oohhh!”</i>");
		output("\n\nA gush of cum suddenly splats on the ground between her shaking hindlegs, her output too excessive for the milker. Then another, and another, and suddenly she’s bucking like a rabid stallion against the machine while crying out in bliss, thick equine cum splashing to the ground as she rapes it into submission.");
		output("\n\n<i>“Guh! Ngh! Ffffuh,”</i> she pants, sweat dripping down her body as her breed-hungry humping begins to slow. <i>“Oh, fuck...”</i>");
		output("\n\n<i>“Feeling a little better?”</i> you ask as she slowly dismounts, impressed by her efforts.");
		if(amberDumbfuckDoses() <= 2) output("\n\n<i>“Fuck, it feels </i>amazing<i> to cum inside it with you watching,”</i> she moans, wiping her damp brow. <i>“My cock’s all covered in your cum, [pc.name]... I wanna do it again. You’re gonna go again, right?”</i>");
		else output("\n\n<i>“Nnnh... fuck,”</i> she moans, shaking her body as if to loosen herself up. She gazes at you with lust burning in her eyes. <i>“Your turn?”</i>");
		output("\n\n<i>“Yup,”</i> you confirm, taking your place in front of the milker. Damn, she really went off on - and in - this thing. It’s filled to the brim with her strong, sticky spunk, dripping to the floor as you insert yourself once more, the opening spreading around you.");
		output("\n\n<i>“Amber..?”</i> you ask, feeling her breasts press at your back and her breath hot on your shoulder. Her nipples are as hard as diamond, jutting into you like studs.");
		output("\n\n<i>“Cum,”</i> Amber whispers, gently pushing your [pc.hips] forward from behind. <i>“Please cum!”</i>");
		output("\n\nYou can hear and feel her get more and more excited behind you, her hands roving over your [pc.stomach] and [pc.chest] while she breathes in your ear. Her fresh, warm jizz covers your dick, coating it in lubricant and ensuring that as hard as you fuck, it’s never too hard. It doesn’t take long for you to cum, groaning as your lower half tenses and relaxes in waves.");
		output("\n\n<i>“Are you cumming?!”</i> Amber exclaims, rubbing you all over. <i>“Oh fuck, oh fuck, you’re cumming so hard! Nnnn!”</i>");
		output("\n\nYou’re hardly even done before she ducks between your legs and opens her mouth wide, a stream of both her and your cum dripping from the milker onto her tongue.");
		output("\n\n<i>“Mmgh! Gglk! Mmmpfbl,”</i> Amber gurgles, rising as you step away and pressing her lips against the milker’s cum-soaked orifice with desperate intensity. You can see her throat working nonstop, her cheeks hollowing as she tries to suck out all of the cum contained within. Astonished, you watch her hips begin to buck as she drinks it all down.");
		output("\n\nShe starts to cum all over the floor, completely untouched save for the thick mix of spunk lining her throat. Her hind half jerks and spasms, legs shivering while her bulging nutsack draws tight and pumps its contents across the floor. The massive equine cock hanging between her legs flares and jumps, seeking a mate that isn’t there while Amber’s eyes roll in her head. She’s fucking out of it - this must be the Dumbfuck at work, driving her onwards.");
		output("\n\nYou can’t help it, watching such a sight. Instantly hardening again, you jack yourself off and cum all over her bare shuddering back, coating her skin in [pc.cumColor] [pc.cum] while she drinks her fill of the milker. By the time you’re both done she’s covered in spunk both front and back, having spilled enough of it down her chin that ropes of it hang from her heaving tits.");
		output("\n\n<i>“Good girl,”</i> you murmur, rubbing her head.");
		if(amberDumbfuckDoses() < 3) 
		{
			output("\n\n<i>“Oh... oh, fuck...”</i> Amber breathes, eyes looking a little less glassy but her pupils still dilated. <i>“It was just- just so delicious, mmph-”</i>");
			output("\n\nShe runs her hands down her tits and pops her fingers between her lips, groaning in delirious pleasure.");
		}
		else
		{
			output("\n\n<i>“God, so </i>good<i>,”</i> Amber groans breathlessly, eyes glassy and pupils dilated. She leans down towards the floor, tongue out and eyeing the thick puddle of spunk. Grinning, you leave her to it. She’ll <i>“come to”</i> later and clean herself off but for now, you might as well let her enjoy it the experience.");
		}
	}
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}