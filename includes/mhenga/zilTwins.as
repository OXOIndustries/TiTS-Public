/* if something breaks, go find lighterfluid
 * flaggo flaggies:
 *	- ZILTWINS_MET
 * 		0 - said no
 * 		1 - said fuk yea bby
 * 		no points for guessing what this does
 *	- ZILTWINS_BARCOUNTERS
 *		encounters in bar, geddit?
 * 	- ZILTWINS_MICA_TEASED
 * 		1 - ye
 *	- ZILTWINS_MICA_BUTTFUCKED
 * 		1 - ye
 * 	- ZILTWINS_TETRA_FUCKED
 * 		1 - ye
 * 	- ZILTWINS_BOTH_FUCKED
*/

public function zilTwinsAtBar():Boolean
{
	//The zil show up on FUZZBUZZ
	return flags["ZILTWINS_MET"] != undefined && pc.hasGenitals() && !pc.isTaur() && hours >= 10 && hours < 18 /*&& (days % 3 == 0 || days % 5 == 0)*/;
}

//nekkidStates: 0 - not showing up, 1 - chitined, 2 - naked
//luckily, this won't be my job until someone makes busts
public function showZilTwins(nekkidTetra:int = 0, nekkidMica:int = 0, tetraInFront:Boolean = true):void
{
	var tetrabust:String = (nekkidTetra == 0 ? "" : (nekkidTetra == 2 ? "TETRA_NUDE": "TETRA"));
	var micabust:String = (nekkidMica == 0 ? "" : (nekkidMica == 2 ? "MICA_NUDE": "MICA"));
	if (!tetraInFront || nekkidTetra == 0) showBust(micabust, tetrabust);
	else showBust(tetrabust, micabust);
	
	showName("TETRA\n& MICA");
	author("HugsAlright");
}

public function zilTwinsEsbethBonus():Boolean
{
	if (pc.level >= 2 && flags["ENCOUNTERED_ZIL"] && pc.hasGenitals() && !pc.isTaur() && flags["ZILTWINS_MET"] == undefined && pc.hasGenitals() && rand(5) == 0) 
	{
		zilTwinsInitialEncounter();
		return true;
	}
	return false;
}

public function zilTwinsInitialEncounter():Boolean
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 2);

	output("As you’re [pc.walking] down the paths of Esbeth and going from prefab to prefab, you pass a pair of zil, a male and a female, not thinking much of it at first until you hear one of them say, <i>“Hmm, how about [pc.himHer], Mica?”</i>");
	output("\n\nThat grabs your attention well enough, causing you to turn and face the couple of waspy aliens. You catch them both looking at you, with the female whispering something into her friend’s ear, keeping a hand firmly on his. Staring at them for a moment, you can see that the zil are very similar in appearance:");
	output(" they’re both the same height, have the same brightly-coloured hair, share the same patterns of black-and-yellow on their skin, and it’s hard to tell their faces apart, especially with the male being nearly as feminine as his counterpart. Though, it’s still easy to tell which one’s male with his big zil-cock hanging freely in the open, while his feminine friend keeps her privates hidden behind chitin layers.");
	if (CodexManager.entryViewed("Zil")) output(" Well, if you had to guess, these two are twins.");
	else output(" Maybe these two are siblings?");
	output("\n\nThe female of the two notices you looking back at them and smiles wide, and a bit lustfully, before pulling away from her compatriot and sauntering a bit closer to you.");

	if (pc.isAss())
	{
		output("\n\nYou cross your arms as she approaches and ask her why she and her buddy are talking about you.\n\n<i>“Hello to you too, offworlder,”</i>");
		output(" she says, sounding a bit more well-spoken and posh then most of her kin, <i>“My brother,");
	}
	else
	{
		output("\n\nYou cock a curious eyebrow as she approaches, prompting a little chuckle from the bee girl.\n\n<i>“Hello there, offworlder,”</i>");
		output(" she says, sounding a bit more well-spoken and posh then most of her kin, <i>“I hope it’s not too rude to your people, but my brother,");
	}
	
	output(" Mica, and I were just... admiring you for a moment, and I myself was wondering if he might... sample you.”</i>");
	output("\n\n<i>“Sample me?”</i> you question, noticing her struggle to come up with those last couple words.");
	output("\n\nThe bee woman grins wide and knowingly at that, walking back over to circle her brother, <i>“Why, yes! My brother is just positively gifted at the art of oral-pleasure... and I was hoping he could possibly service you, and tell me if you taste good enough for me to try.");
	if (pc.race() == "zil") output(" Because even though you may look like one of us, you certainly don’t </i>smell<i> like a zil.");
	output("”</i> With that, she’s behind Mica, who’s keeping his place, blushing and silent while his sister trails her hands down his sides and all the way to his exposed wasp-cock before wrapping her fingers around his tool and stroking it.");
	output("\n\nThe zil boy gasps at her touch, turning all the more red but doing nothing to stop the zil girl as his dick starts to harden.");
	output("\n\nThe seemingly-dommy wasp-woman licks her lips before looking to you with a lusty grin, <i>“So, what do you say to letting my brother dearest here have a taste of");
	if (pc.isNude()) output((pc.hasCock() ? " your alien cock?”</i>" : " your alien pussy?”</i>"));
	else output(" what’s under your pants?”</i>");
	output("\n\nWell, that’s pretty straight forward, but you wouldn’t really expect anything less from a sex-hungry zil. You don’t think you have much time to ponder, though.");
	output(" So, you could either indulge these alien siblings and let Mica go to town on your naughty bits, and with potent zil pheromones already wafting your way, you’d definitely be indulging yourself as well, or you could just leave if cute bee-boys and public settings aren’t your thing.");
	output("\n\nEither way, the waspy pair eagerly awaits your answer, Mica’s tool getting harder with each passing moment you don’t speak up.");
	
	addButton(0, "Yes", zilTwinsInitialD, undefined, "Yes", "Let Mica " + (pc.hasCock() ? "suck you off" : "eat you out") + " and get a mouthful of your alien flavor.");
	addButton(1, "No", zilTwinsInitialDissapointment, undefined, "No", "Nah, you aren’t into this kind of thing.");
	return true;
}

public function zilTwinsInitialD():void //GEEEEEEEEEET IIIIIIIIIIIIIIIT
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 2);
	
	var cIdx:int = -1;
	var vIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();
	if (pc.hasVagina()) vIdx = rand(pc.vaginas.length);
	
	if (pc.isNude()) output("Not one to deprive yourself of an exhibitionistic opportunity like this, you tell the lusty zil lady you’d be fine with letting her brother get a taste of your " + (cIdx >= 0 ? "[pc.cock " + cIdx + "], reaching down to stroke your tool." : "[pc.vagina " + vIdx + "], spread your nether lips."));
	else output("You smirk at the lusty lady zil and tell her you’d be fine with letting her brother get a taste of your " + (cIdx >= 0 ? "[pc.cock " + cIdx + "]" : "[pc.vagina " + vIdx + "]") + ", going to remove your clothes and stripping yourself bare, much to the delight of both the siblings, as well as anyone else that might happen by. ");
	output("\n\nMica seems relieved at that, and his sister only grins all the wider, letting her brother’s fully-erect honey-wand fall free from her grasp and pulling herself off the zil boy’s back.");
	output(" <i>“Well,”</i> she coos, circling her femmy bee-brother and trailing a single finger along his svelte shoulders, <i>“The nice offworlder said yes, Mica, what are you waiting for? Go on and give them what they were promised.”</i>");
	output("\n\nBoth the zil and his cock jump to attention at his sibling’s words, stammering out a quick <i>“Yes, sister”</i> in a gentle, subdued voice before beginning his trip over to you.");
	output(" He walks your way with quite the swing to his girly hips, his big dick wobbling back and forth until he reaches you, then quickly dropping to his knees in front of you.");
	output("\n\nQuite the obedient thing, isn’t he?");
	output("\n\nMica looks up at you with his big black eyes and an almost-shy smile on his face, cheeks flushed red, treating you to a nice wafting of his potent pheromones.");
	output(" You can’t help but smile back down at the girly wasp and reach a hand down to rest between his antennae, running through his short blonde hair. Then, with a lick of his lips, he gets to the matter at hand.");

	if (cIdx >= 0)
	{
		output("\n\nThe zil takes a hand and grabs at the base of your [pc.cockNoun " + cIdx + "], angling your tool towards his shapely lips and letting his long tongue loll from his mouth.");
		output(" He drags his hollow oral-organ across your [pc.cockhead " + cIdx + "], making you shudder as he wets your tip and wraps his lips around it.");
		output(" Taking a moment to enjoy your flavor, Mica suckles on your cockhead like a piece of candy, lavishing it with his tongue and kissing at your sensitive flesh now and then before he starts to push himself onto your tool.");
		output("\n\nYou nearly moan as the girly zil boy starts to sheathe your length between his lips, working his tongue along your undercarriage with practiced grace that has your legs quaking. Soon enough Mica has your dick all");
		if (pc.cLength(cIdx) >= 12) output(" the way down his throat");
		else output(" in his mouth");
		output(" and starts to slide his tongue all around your [pc.cockNoun " + cIdx + "], wetting your cockflesh and keeping you in constant bliss, tearing a few groans from your lungs. Then, the alien");
		output(" femboy starts to bob his head up and down the length of your tool, using his mouth like a warm, wet onahole for you to enjoy.");
		if (pc.hasKnot(cIdx)) output(" He even treats your knot to a nice tongue polishing, licking and kissing at the sensitive ball of dickmeat.");
		output("\n\nHis sister wasn’t kidding, this zil knows how to work a cock, getting you to moan and groan quietly out here in the open while his feminine companion looks on, biting her lip, the chitin near her crotch growing visibly wet with golden honey.");
		output("\n\nAnd, despite your public setting, Esbeth is quiet enough to the point where you can enjoy this cute bee boy in relative privacy.");
		output("\n\nWith all this oral pleasure (and all these pheromones in the air), though, it isn’t too long before Mica gets that sample he’s looking for.");
		output(" You can feel the need for release burning in your loins, your peak rapidly swelling until your willpower can no longer hold back your orgasm.");
		output(" Your grip tightening on his scalp, you grunt hard and thrust your hips forward, forcing your [pc.cock " + cIdx + "] down the zil’s throat as your tool swells and spasm, making him whine.");
		output(" The first spurt of your [pc.cumNoun] hits the alien femboy’s tongue and mouth with a satisfied sigh from the bug guy. Your [pc.hips] buck jerkily as your climax continues, practically fucking Mica’s face as you fill his mouth with all the warm seed he could possibly want, making sure he gets a good taste of what you have to offer.");
		output("\n\nThe girly boy does his best to pleasure you even while your orgasm carries on, making sure to use his tongue to lap up all the cum he can get.");
		output("\n\nEventually, though, your pleasurable peak turns into a plateau, leaving a haze of lust clearing from your eyes and your [pc.chest] heaving tiredly. You manage to look down at Mica while your [pc.legOrLegs] wobble");
		if (!pc.hasLegs()) output("s");
		output(", looking down into a pair of deep-black, but happy eyes. The zil pulls himself off your softening tool, but continues to lick and kiss at it, making sure it’s good and clean.");
	}
	else
	{
		output("\n\nThe zil rests his hands on the sides of your [pc.thighs] before kissing gently at your lower lips, drawing a few pleasure gasps from your lungs.");
		output(" Mica’s quite tender with your lady-bits, gently pressing his lips to them and letting his long, hollow tongue loll from his mouth to drag it along your slit, just ever so slightly parting your labia.");
		output("\n\nIt feels like he’s teasing you, but judging by how you’re dripping your feminine fluids onto the ground, you think the bee boy’s just very diligent with getting " + pc.mf("guys", "girls") + " like you ready.");
		output("\n\nLuckily, Mica soon finds that he’s gotten you nice and wet enough for his, or his sister’s, likings, and delves his tongue into your [pc.vagina " + vIdx + "], spreading your lower lips.");
		output(" You moan aloud as his oral organ rubs against your inner walls, even as he continues to kiss at your puffy nether lips. Mica’s long tongue easily reaches your deepest, most sensitive spots, leaving you to cry out with bliss.");
		output(" The waspy femboy even pulls himself from your muff now and then to lick and kiss at your clit, making your legs tremble and your breath stutter. All the while Mica laps as much of your natural lubricants as he can get, with most of it ending up trickling down his chin while he learns your flavor.");
		output("\n\nHis sister wasn’t kidding, this zil knows how to eat pussy, getting you to moan and groan quietly out here in the open while his feminine companion looks on, biting her lip, the chitin near her crotch growing visibly wet with golden honey.");
		output("\n\nAnd, despite your public setting, Esbeth is quiet enough to the point where you can enjoy this cute bee boy in relative privacy.");
		output("\n\nWith all this oral pleasure (and all these pheromones in the air), though, it isn’t too long before Mica gets that sample he’s looking for. You can feel the need for release burning in your loins, your peak rapidly swelling until your willpower can no longer hold back your orgasm.");
		output(" Your grip tightening on his scalp, you grunt hard as your [pc.vagina " + vIdx + "] clenches down around the zil’s tongue, inner walls spasming. You gush [pc.girlcum] out into the alien femboy’s mouth with a satisfied sigh from the bug guy.");
		output(" Your [pc.hips] buck jerkily as your climax continues, grinding against Mica’s face as you fill his mouth and coat his cheeks with all the girlcum he could possibly want, making sure he gets a good taste of what you have to offer.");
		output("\n\nThe girly boy does his best to pleasure you even while your orgasm carries on, making sure to use his tongue to lap up all the [pc.girlCumNoun] he can get.");
		output("\n\nEventually, though, your pleasurable peak turns into a plateau, leaving a haze of lust clearing from your eyes and your [pc.chest] heaving tiredly. You manage to look down at Mica while your legs wobble, looking down into a pair of deep-black, but happy eyes.");
		output(" The zil pulls himself from your sopping folds, but continues to lick and kiss your [pc.vagina " + vIdx + "] and thighs, making sure you’re good and clean.");
	}
	
	output("\n\nAt the same time, his sister saunters her way over to the two of you, smiling wide and giving you a wink. <i>“So,”</i> she begins, looking down to her brother, <i>“How is [pc.he], Mica?”</i>");
	output("\n\nHer demanding tone prompts a quick response from the cum-glazed zil boy, but <i>“Oh, well... [pc.he]-”</i> is as far as he gets before he’s cut off by his compatriot again.");
	output("\n\n<i>“Actually, wait,”</i> the wasp woman says with a grin, reaching a finger down to hook under Mica’s chin");
	if (silly) output(" wow nice unintentional rhyme you dr suess ass lookin idiot");
	output(", <i>“It looks like you enjoyed it... so maybe I should try it for myself.”</i> With that, the alien mistress coaxes her brother back to his feet, and quickly presses her plump lips to his, trapping the bee boy in an incestuous kiss.");
	output("\n\nMica doesn’t protest, eagerly accepting his sister’s oral embrace, letting her enjoy your flavor while it’s still on his tongue, their long, hollow oral organs visibly playing across each other from time to time.");
	output(" As they kiss, the more feminine sibling reaches a hand down to wrap around her brother’s big, now pre-leaking cock to jerk him off, probably a reward for a job well done.");
	if (pc.isNude()) output(" The whole thing sets blood rushing to your genitals again and leaves you blushing.");
	else output(" The whole thing almost makes you reconsider putting your clothes on just in case there’s more fun on the way.");
	output("\n\nAnd after " + (cIdx >= 0 ? "sucking your dick" : "eating you out") + ", it seems the bee boy is very worked up, because he reaches his own orgasm quite quickly.");
	output(" He grunts and moans quietly into his sister’s mouth, his long, girthy tool spasming in the waspy woman’s grasp, convulsing and erupting thick ropes of golden-yellow honey-cum all over the girl’s hand.");
	output("\n\nWhen the zil finally comes down from his peak, his sister breaks the kiss and pulls back, licking her lips happily and staring lustfully into Mica’s eyes.");
	output(" She takes another moment to savor your flavor, clearly enjoying it if the look on her face is any indicator. Then, the bee girl turns to you again with a wide smile.");
	if (pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output("\n\n<i>“Mmm, so familiar, but so good");
	else output("\n\n<i>“Not too bad");
	output(",”</i> she coos, now bringing her cum-covered hand up to her subservient brother’s face, who quickly opens his mouth to start licking her fingers clean without even being told.");
	output(" The zil woman doesn’t break eye contact as Mica cleans his own seed from her fingers and continues to talk with a wide smile on her face,");
	output(" <i>“I’m Tetra, by the way, and I think I can say that my dear sibling and I both enjoyed this little excursion. I don’t think either of us would mind seeing you again, right, Mica?”</i>");
	output("\n\nThe zil in question pulls back from his sister’s now-clean hand, licking his lips of any stray cum, and nods hastily, <i>“Yes, sister.”</i>");
	output("\n\nTetra smiles at that and wraps an arm around her brother’s shoulders, <i>“You should come visit us at Burt’s sometime... We like to relax there from time to time, and could always use some company, especially from offworlders like yourself.”</i>");
	if (pc.isAss()) output("\n\nYou tell the couple you’ll consider it.");
	else output("\n\nWell, after all that, how can you say no? You grin and tell the couple you’d be happy to meet them again.");
	output("\n\nWith that, she winks and turns herself and Mica around to continue on their trip down the paths of Esbeth, pausing to look over her shoulder at you, <i>“Until next time.”</i>");
	output("\n\nLike that, the incestuous pair of zil are gone, leaving you alone again");
	if (!pc.isNude()) output(" and quickly putting the last of your clothes back on");
	output(". After an alien adventure like that, you’re very much looking forward to getting on with your journey... and possibly meeting Tetra and Mica again.");
	
	pc.orgasm();
	if(InPublicSpace()) pc.exhibitionism(1);
	flags["ZILTWINS_MET"] = 1;
	
	addButton(0, "Next", mainGameMenu);
}

public function zilTwinsInitialDissapointment():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("You shake your head and tell the zil woman you’d rather not engage in this sort of thing, much to her dismay.");
	output("\n\nShe frowns, still stroking her brother’s big, thick dick, and speaks up again, <i>“Aww, that’s too bad.”</i> The alien girl pauses to kiss at Mica’s neck for a moment,");
	output(" <i>“I’m Tetra, by the way, and even though you aren’t feeling... up to it right now, I don’t think either of us would mind seeing you again, right, Mica?”</i>");
	output("\n\nThe femboy whimpers and trembles in his sister’s embrace, but nods hastily, <i>“Yes, sister.”</i>");
	output("\n\nTetra smiles at that and wraps an arm around her brother’s shoulders, <i>“You should come visit us at Burt’s sometime... We like to hang out there from time to time, and could always use some company, especially from offworlders like yourself.”</i>");
	output("\n\nWith that, she releases Mica’s throbbing cock as a big glob of pre forms on his tip, leaving him to whine at the absence of his sister’s touch.");
	output(" She winks at you and goes to wrap an arm around her brother’s svelte shoulders, and turns herself and Mica around to continue on their trip, pausing to look over her shoulder at you, <i>“Well, it seems I need to take care of my brother dearest now, until next time.”</i>");
	output("\n\nLike that, the incestuous pair of zil are gone, leaving you alone again to continue your journey... and with an offer to “hang out” with some cute aliens.");
	
	flags["ZILTWINS_MET"] = 0;
	
	addButton(0, "Next", mainGameMenu);
}

public function zilTwinsBarBonus():Boolean
{
	output("\n\nIn the back, you can just barely make out the frames of Tetra and Mica");
	if (flags["ZILTWINS_BARCOUNTERS"] == undefined) output(", those incestuous zil twins you met before,");
	output(" sitting together in a booth. Though, it’s hard to tell exactly what they’re doing with the low lighting. You don’t think they’d mind a visit from you.");

	addButton(1, "Tetra&Mica", zilTwinsBarcounter, undefined, "Tetra & Mica", "Pay a visit to the lusty zil siblings.");
	return false;
}

public function zilTwinsBarcounter():void
{
	clearMenu();
	clearOutput();
	
	var scene:int = (flags["ZILTWINS_BARCOUNTERS"] == undefined ? 3 : rand(3));
	IncrementFlag("ZILTWINS_BARCOUNTERS");
	
	output("You decide to pay a visit to Tetra and Mica while you’re all here in Esbeth, and start to [pc.walk] your way over to them.");
	
	switch(scene)
	{
		case 0:
			showZilTwins(1, 2);
			output("\n\nOnly then does it become clear what the incestuous couple is doing in the dark corners of the bar.");
			output("\n\nBoth of the twins are sitting on the same side of the booth, gently kissing each other in the low-light of their seat.");
			output(" Neither of them notice until you’re near, giving you a few moments to admire the couple as their tongues pass across one another, lips parting and connecting again and again.");
			output(" You even catch a few glimpses of Mica’s erect cock throbbing, obviously needing some release from his sister.");
			output("\n\nTetra is the first to notice you when you take a seat across from the pair. She grins and breaks her kiss, leaving a trail of crystal-clear saliva between hers and her brother’s lips, and Mica with a needy, lust ridden face.");
			output("\n\n<i>“Hello there, [pc.name],”</i> she coos, getting herself and her femmy sibling to face you, <i>“Good to see you again... I was just feeling like Mica and I could use some company.”</i>");
			output("\n\nShe smirks deviously and reaches a hand down to give her brother’s cockhead a little rub, <i>“He’s awfully pent-up, and I think he could use the help of a nice offworlder like yourself to deal with that. Isn’t that right, Mica?”</i>");
			output("\n\n<i>“Y-yes, Tetra,”</i> the alien femboy manages to stammer out.");
			output("\n\nHis compatriot can only grin wider at that, releasing his needy tool and putting her attention on you again, <i>“So, [pc.name], how shall we spend our time together?”</i>");
			break;
		case 1:
			showZilTwins(2, 2);
			output("\n\nOnly then does it become clear what the incestuous couple is doing in the dark corners of the bar.");
			output("\n\nBoth of the twins are sitting on the same side of the booth, but Mica is sitting in his sister’s lap, receiving a handjob from his sibling while he suckles Tetra’s cuppable tits, free of their chitin cover for the moment.");
			output(" You enjoy the show as you [pc.walk] towards their booth, watching zil cock throb and honey flow from coal-black nipples as you take a seat across from them.");
			output("\n\nTetra notices you and smiles your way, a gentle whimper escaping her lips as she’s suckled, her brother moaning quietly as well. It seems like you came at a good time too, because Mica is just on the verge of his climax.");
			output(" He grunts, still swallowing his sister’s honey, his hips bucking up against the zil woman’s hand slightly. His thick alien tool convulses in Tetra’s grip, fountaining ropes of golden cum all over himself and his companion’s hand.");
			output("\n\nOnce the femboy’s orgasm has ended, he pulls himself from his sister’s nipple, smiling up at his sibling lustfully for a moment before licking his lips of any stray honey and turning his attention towards you.");
			output("\n\n<i>“Hello there, [pc.name],”</i> Tetra says coyly, covering her breasts with chitin once more and sliding out from under Mica, allowing him to sit down beside her, <i>“Nice of you to visit us.");
			output(" I thought my poor brother and I were going to be all alone today.”</i> She gives you a wink, wrapping an arm around her twin’s girly shoulders, <i>“Now that you’re here, though, why don’t we spend some time together?”</i>");
			break;
		case 2:
			showZilTwins(2, 2);
			output("\n\nOnly then does it become clear what the incetuous couple is doing in the dark corners of the bar.");
			output("\n\nGrunting and gentle moaning fills your ears as the twins come into view, with both of them sitting on the same side of the booth, or at least one of them is sitting.");
			output(" Tetra is bouncing up and down ever so slowly in her brother’s lap, and upon further inspection, you can see Mica’s menacing zil-dick stretching his sister’s pucker, pounding her ass while golden girlcum spills from the bee girl’s unused slit.");
			output(" Neither of them notice as you approach, too enthralled in each other to look at you.");
			output("\n\nIt seems you arrived at a good time, though, because Tetra slams her wide hips down, burying her brother’s cock inside her. She lets out a short, blissful cry while her whole body tenses, her legs shaking as what looks to be an orgasm overtakes her.");
			output(" With clenched fists, the wasp woman’s puffy black pussy visibly spasms, gushing honey all over her brother’s lap.");
			output(" And, at the same time, Mica presses his lips to Tetra’s back and moans quietly, his hips bucking upward just slightly, giving you a better view as cum spills out from his sister’s convulsing asshole.");
			output("\n\nThey both come down from their climaxes and finally notice you just as you’re taking a seat across from them.");
			output("\n\n<i>“Oh... Hello... [pc.name],”</i> Tetra pants, her exposed chest heaving along with her brother’s, <i>“I hope you don’t mind that Mica and had some fun before you got here... you’d think he never gets off, the way he was begging to be inside his dear sister.”</i>");
			output(" The zil woman grins, looking over her shoulder at the femboy in question and cupping his cheek, <i>“Isn’t that right, Mica?”</i>");
			output("\n\n<i>“Yes... Tetra...”</i> the girly bee stammers out between heaves of his flat, chitinous chest.");
			output("\n\nTurning back towards you, the dommy-wasp smiles before going to lift herself off her brother’s softening cock, leaving her pucker gaping and leaking still-warm honey-cum onto the cushion beneath her.");
			output(" She slides off Mica’s lap and goes to take a seat beside him, wincing slightly when her tender ass touches the seat of the booth, but breathing a contented sigh as she’s finally emptied.");
			output("\n\n<i>“Now that we’re all here,”</i> Tetra coos, leaning into her brother and resting her head on his shoulder, <i>“We can all have some quality time together. How does that sound, [pc.name]?”</i>");
			output("\n\nWell, if it’s anything like what you just saw, it sounds pretty great");
			break;
		case 3:
			output("\n\nNearing the alien pair, you can see Tetra is reclining in her booth, while her brother is standing at the edge of the table with his hands folded over his crotch, foreskin-covered cock still hanging in the open for all to see.");
			output("\n\nThe more feminine of the duo notices you approach, smiling wide and sitting up in her seat.");
			output(" <i>“Look at this, Mica,”</i> she says, leaning onto the table and getting her brother to look toward you, <i>“Our friend’s come to pay us a visit, isn’t that nice?”</i>");
			output("\n\nThe zil boy smiles and blushes shyly when he sees you,");
			if (flags["ZILTWINS_MET"] == 1) output(" probably remembering your oral excursion together,");
			output(" <i>“Yes, sister.”</i>");
			output("\n\nAs you reach their table, Tetra invites you to take a seat across from her, and you happily do just that, sliding into the booth.");
			output("\n\n<i>“Hello again, offworlder,”</i> she says, pausing and furrowing her brow after that last word, <i>“Actually, I don’t believe I got your name last time we met, care to remedy that?”</i>");
			if (pc.isAss()) output("\n\nYou respond by telling the zil to call you <i>“[pc.name]”</i> before leaning back in your seat.");
			if (pc.isMisch()) output("\n\nWith a sly grin you introduce yourself as <i>“Steele, [pc.name] Steele”</i> and lean forward on an elbow.");
			if (pc.isNice()) output("\n\nSmiling, you tell the couple that they can call you <i>“[pc.name]”</i>.");
			output("\n\nTetra smirks, <i>“Alright, [pc.name], now that you’re here, care to spend some quality time with my brother dearest and I?”</i>");
			output(" With that, she wraps an arm around Mica’s waist and pulls him close, almost nuzzling her head against his smooth stomach, both of them smiling your way.");
			output("\n\nWell, you definitely came to visit the lusty twins, so what do you want to do with them?");
			break;
	}
	
	zilTwinsMenu();
}

public function zilTwinsMenu(grayout:Boolean = false):void
{
	if (grayout) addDisabledButton(0, "Appearance");
	else addButton(0, "Appearance", zilTwinsAppearance);
	addButton(1, "Talk", zilTwinsTalk);
	if(pc.lust() < 33) addDisabledButton(2, "Sex", "Sex", "You are not aroused enough for this!");
	else addButton(2, "Sex", zilTwinsFuckmenu, undefined, "Sex", (silly ? "It’s hip to fuck bees!" : "Is there anything better than sex with libidinous twins in public?"));
	addButton(14, "Leave", mainGameMenu);
}

public function zilTwinsAppearance():void
{
	clearMenu();
	clearOutput();
	showZilTwins(2, 2);
	
	output("Tetra and Mica are identical zil twins, with both of them standing at about five-and-a-half-feet tall. They both possess the same colours and patterns of their skin, as well as the same blonde hue of their hair.");
	output(" Their frames are also exceedingly similar, with Tetra being a fine example of womanly beauty, with all the curves you’d find on a galactic-grade model, while her brother is also quite feminine for a boy with his girly hips,");
	output(" smooth midsection, and svelte shoulders, as well as thighs and an ass that might rival most unmodded citizens. It’s easy to tell them apart by their hair-styles, though, since Mica keeps his short and straight, while Tetra’s is long and curly.");
	output(" They both have all the usual zil traits like antennae, chitin, and black, insectile eyes.");
	output("\n\nOf course, being separated by gender alone, the pair of aliens have their differences.");
	output("\n\nTetra, being female, possesses two C-cup breasts filled to the brim with delicious honey, which would probably be leaking from her pert black nipples if they weren’t covered by her chitin right now.");
	output(" She also has a puffy, nectar-leaking pussy hidden beneath the plate of natural armor covering her groin, just ever-so-slightly parted from what you can only guess to be years of taking her brother’s monstrous zil-cock.");
	output(" Like all zil females, Tetra has a bug-like abdomen trailing behind her, tipped with a venomous stinger, sure to induce lustful reactions in anyone it pricks.");
	output("\n\nMica, on the other hand, has a flat chest that’s normally covered in a layer of chitin, while his throbbing, girthy, foreskin-covered, 10-inch cock and plump balls hang free at all times, uncovered by his cockplate, twitching needily whenever his sister is near.");
	output(" Being a male zil, this femboy has a pair of insectile wings on his back, good for hovering and flying around his jungle homeworld. He also has a nice, fuckable pucker placed between his big, squeezable ass cheeks.");
	output("\n\nAll in all, they’re a cute pair of aliens, and you can see why they like each other so much.");
	
	zilTwinsMenu(true);
}

public function zilTwinsTalk():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Tetra grins a little at that suggestion. It probably wasn’t what she was expecting, but she seems happy nonetheless.");
	output("\n\n<i>“Sure, [pc.name],”</i> she coos, <i>“I’m sure the three of us could hold a pretty interesting conversation, depending on what you want to talk about.”</i>");

	addButton(0, "Them", zilTwinsTalkThem);
	addButton(1, "Tetra", zilTwinsTalkTetra);
	addButton(2, "Mica", zilTwinsTalkMica);
	addButton(3, "Zil", zilTwinsTalkZil);
	addButton(14, "Back", zilTwinsStopTalking);
}

public function zilTwinsTalkThem():void
{
	clearMenu();
	clearOutput();
	processTime(5);
	showZilTwins(1, 1);
	
	output("You decide to ask the zil about themselves: them, their relationship with each other, how they came to find Esbeth, and how they’re enjoying civilization.");
	output("\n\n<i>“I guess there’s quite a bit to talk about there,”</i> Tetra says with a smile, pulling her brother close, <i>“We’ll try to tell you all we can remember, at least.”</i>");
	output(" Then, she starts to explain, <i>“Well, I don’t know if you’re aware of this or not, but zil are always born in pairs, twins, like Mica and I.");
	output(" We siblings always grow up very close, spending most of our time with each other, like the best friend anyone could want.”</i>");
	output(" Smiling, Tetra nuzzles against her brother, and he returns the embrace, <i>“and some grow up to be closer than others, like us.”</i>");
	output("\n\nShe smirks and turns to face her sibling-lover, <i>“Why look for a mate when you can be happy with the person you’ve always known and loved already, right, Mica?”</i>");
	output("\n\nThe girly zil boy is somewhat shy with his answer, <i>“Yes, sister. There’s no one else’s orders I’d rather follow.”</i> That puts a little smile on his sister’s face, leading her to plant a little kiss on his blushing cheek.");
	output("\n\nShe turns toward you again, <i>“As for finding Esbeth, our village is rather close to this town, and after some of our fellow tribemates found this place, well, I simply had to see it.");
	output(" Mica had his reservations about visiting, but I just needed to see this place, these ‘offworlders’, but how could I go anywhere without my brother dearest?”</i>");
	output(" She sighs and leans into her brother again, <i>“He wasn’t eager to join me, but he followed me nonetheless, and we ended up exploring this Esbeth of yours for a few days, taking in all that your culture has to offer.”</i>");
	output(" Laughing a little, the zil continues to explain her first experiences with alien civilization, <i>“The stories we told the village... you should have seen the looks on their faces when we told them about your ‘holograms’ and ‘starships’.”</i>");
	output(" She shakes her head, smiling at fond memories, <i>“After all of that, how could I resist coming back? Well, I’m sure my brother would rather laze about the village with me all day long.”</i>");
	output("\n\n<i>“I... do get a bit nervous here,”</i> Mica says, shrinking in his seat and turning to his sister, <i>“but I’m happy as long as I’m with you, Tetra.”</i>");
	output("\n\nThat statement brings joy to the bee girl’s mien and has her resting a hand lovingly on her brother’s chitinous chest, <i>“See, how could I afford to come to Esbeth without this lovely thing?");
	output(" But, yes, we visit the town as often as we can to enjoy ourselves... and offworlders, if we can’t help it.”</i>");
	output("\n\nWith that, she gives you a knowing little wink.");
	output("\n\nStill, though, even after all that, you have to ask why Mica walks around with his dick hanging out all the time while she stays covered.");
	output("\n\n<i>“Because I told him to,”</i> Tetra says with a devious grin, <i>“Why wouldn’t I want to have all of this out and ready whenever I want it.”</i>");
	output(" She licks her lips and wraps her fingers around her brother’s tool, giving it a few loving strokes that have it twitching and its owner gasping, <i>“It’s like when they were passing out spines, Mica got in line for dicks a second time.”</i>");
	output(" Then, just as quickly as her lustful actions started, she lets off, leaving Mica’s wasp-cock pulsing to hardness, and her words causing him to blush embarrassedly.");
	output("\n\n<i>“Honestly,”</i> Tetra sighs, turning to stare into her twin’s black eyes and hook a finger under his chin, <i>“I don’t understand how some of you offworlders can stand being only-children.”</i>");
	output(" With that, she plants a little kiss on Mica’s shapely lips before smiling and turning to you again.");
	
	addButton(0, "Next", zilTwinsTalk);
}

public function zilTwinsTalkTetra():void
{
	clearMenu();
	clearOutput();
	processTime(5);
	showZilTwins(1, 1);
	
	output("<i>“Oh, me?”</i> Tetra says coyly, placing a hand just above her chest, <i>“Why, I’m just a nice native girl who loves her brother and enjoys all you offworlders have to offer.”</i>");
	output(" Obviously not fooling you, the zil leans forward onto the table. <i>“If you really want to know,”</i> the wasp woman continues, <i>“I’m a seamstress in our village.”</i>");
	output("\n\nYou tell her that seems odd considering that most zil you meet don’t seem like the modest types.");
	output("\n\nTetra chuckles in response, <i>“Yes, while I don’t really work on anything in the way of clothes, I help build new homes for our tribe and keep them from falling apart when the need arises...");
	output(" I also make and mend bags, pouches, belts, ropes, and straps, and I’m sure my brother here could attest to those last two.”</i>");
	output(" As she say that she leans into her sibling, her words and closeness making the zil boy blush and smile nervously.");
	output("\n\nYour wasp friend lets off, leaving her brother’s head full of what you can only guess to be devious memories before putting her attention on you again, <i>“Honestly, though, I’m much more interested in all the wonderful things your people have here than anything at the village...");
	output(" well, other than Mica, of course. Hopefully the two of us can spend even more time here soon.”</i> With that, she wraps her arms around her brother to hold him close for a moment, smiling your way.");
	
	addButton(0, "Next", zilTwinsTalk);
}

public function zilTwinsTalkMica():void
{
	clearMenu();
	clearOutput();
	processTime(5);
	showZilTwins(1, 1);
	
	output("Mica blushes when you ask about him, shrinking in his seat, but his sister seems all too keen to make him talk, leaning into the femboy before whispering, <i>“Go on, Mica, the nice " + pc.mf("sir", "lady") + " asked you about yourself.”</i>");
	output("\n\nThe zil fidgets in response for a moment, but ultimately complies and speaks up, <i>“Oh... well... I’m from the Lishka village... a-and so is Tetra.”</i>");
	output(" The bee boy is clearly struggling to come up with something coherent to tell you, but continues all the same, <i>“I’m one of the healer’s assistants there. I help to gather herbs and make poultices... those kinds of things...”</i> Mica goes quiet after that, either looking for something more to say or done with talking about himself.");
	output("\n\nTetra, though, seems to feel like her brother has more to say and encourages him to speak up, <i>“Come now, Mica, there’s more to you than just that.”</i>");
	output("\n\n<i>“I guess I...”</i> the zil boy manages to stutter out, rubbing at the back of his neck, <i>“Well... I enjoy dancing quite a bit...”</i>");
	output("\n\nTetra smiles wide at that before leaning into him, pressing her chitin laden breasts against his shoulder, <i>“And who do you dance for, Mica?”</i>");
	output("\n\n<i>“Th-the women of our village... m-mostly...”</i> he says, blushing hard, but not being rude enough to break eye contact or mumble into his chest.");
	output("\n\nHis sister pulls back with a grin, turning her attention to you now, <i>“See, he’s quite the talented guy, isn’t he?”</i>");
	
	addButton(0, "Next", zilTwinsTalk);
	
}

public function zilTwinsTalkZil():void
{
	clearMenu();
	clearOutput();
	processTime(5);
	showZilTwins(1, 1);
	
	output("<i>“Hmm, I’d much rather learn about you offworlders,”</i> Tetra insists, leaning forward and resting her chin in her hand, <i>“but, I suppose Mica and I could explain some things.”</i>");
	output(" She sighs, tapping a finger on her chin, <i>“Well, I believe the first thing you should know is that zil come in pairs, as twins, at the least, like Mica and I.”</i>");
	output(" She gestures to her sibling before turning to you again, <i>“There’s multiple tribes out in the jungle, but I don’t think it would be helpful to an offworlder like yourself to know all the subtle differences. Mostly because most will react to you the same way...”</i>");
	output("\n\n<i>“You see,”</i> she pauses, <i>“Most of our kin are just as, if not more, libidinous than me or my brother here... they- </i>we<i> really can’t help it. So, they’re more likely to fuck you than fight you.”</i>");
	output(" She smirks your way before continuing, <i>“We also produce pheromones which seem to greatly affect offworlders like yourself.”</i>");
	output("\n\nDo they ever.");
	output("\n\n<i>“Anyway,”</i> Tetra speaks up again, <i>“I’ve noticed you aliens come in quite a lot of flavors... while us zil only have males and females. Females like me have stingers like mine.”</i>");
	output(" She emphasizes that by swinging her hips slightly to bring her bug-like abdomen into view, <i>“They’re not very deadly, but it carries an aphrodisiac that’s pretty effective on naleen.”</i>");
	output(" Turning to her brother, Tetra smiles, <i>“I think Mica here could explain some of our male’s quirks better than myself.”</i>");
	output("\n\n<i>“Oh, yes,”</i> the femboy stutters with a voice much quieter than his sister’s, <i>“Well, we have wings like mine.”</i>");
	output(" With that he unfurls his insectile wings, letting them buzz for a short second, <i>“We can hover on them for quite some time, and some are better at it than others.”</i>");
	output(" The zil goes quiet after that, seeming like he doesn’t have more to say.");
	output("\n\nTetra then leans into her brother, resting her head on his shoulder, <i>“I hope we’ve told you something that’s the least bit helpful.”</i>");
	output("\n\nYou" + (pc.isAss() ? "" : " smile and") + " thank the incetuous pair for the information.");
	
	addButton(0, "Next", zilTwinsTalk);
}

public function zilTwinsStopTalking():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Tetra and Mica are sitting across from you, happily awaiting you to make a proposal on how to spend your time together.");
	
	zilTwinsMenu();
}

public function zilTwinsFuckmenu():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	var zilTwinsMica:Creature = (new ZilMale());
	var zilTwinsTetra:Creature = (new ZilFemale());
	var zilTwinsMicaVol:int = zilTwinsMica.analCapacity() * 1.15;
	var zilTwinsTetraVol:int = zilTwinsTetra.vaginalCapacity() * 1.1;
	var zilTwinsTetraButtVol:int = zilTwinsTetra.analCapacity() * 1.1;
	var zilTwinsTetraMinVol:int = Math.min(zilTwinsTetraVol, zilTwinsTetraButtVol);
	
	var cIdx:int = pc.cockThatFits(zilTwinsMicaVol);
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("With pheromones floating through the air and two incestuous, exhibitionist zil twins sitting across from you, you decide to suggest that you have some fun with the alien siblings while you’re in this dark, less-noticeable corner of the bar.");
	output("\n\n<i>“What a great idea,”</i> Tetra coos with a big, uncontrollable smile growing across her face, <i>“But, there’s three of us, and so many... interesting things we could do together.”</i>");
	output(" She finishes that sentence by wrapping her arms around Mica’s waist and pulling him close, making the femboy gasp as his back is pulled against his sister’s chest. <i>“So, what do you think we should do?”</i> the waspy mistress says with a wink before kissing Mica on the top of his head.");
	
	addButton(0, "Tease Mica", zilTwinsFuckMicaMentally, [zilTwinsMica, zilTwinsTetra], "Tease Mica", "Have Mica dance around the table for you and his sister. There’s probably going to be a lot of teasing... and blowjobs.");
	
	if (pc.hasCock() && pc.cockThatFits(zilTwinsMicaVol) != -1)
		addButton(1, "Fuck Mica", penisRouter, [zilTwinsFuckMicaForRealsies, zilTwinsMicaVol, false], "Fuck Mica", "Bend Mica over and fuck his cute butt while Tetra watches!");
	else
		addDisabledButton(1, "Fuck Mica");
		
	if (pc.hasCock() && pc.cockThatFits(zilTwinsTetraMinVol) != -1)
		addButton(2, "Fuck Tetra", zilTwinsFuckTetra, undefined, "Fuck Tetra", "Get a bit subby and get your dick in that honey-leaking zil pussy.");
	else
		addDisabledButton(2, "Fuck Tetra");
		
	addButton(3, "BBQSpitroast", zilTwinsFuckThemAll, [zilTwinsMica, zilTwinsTetra], "Honey BBQ Spitroast", ("Eat Tetra out while she has her brother plow your " + (pc.hasVagina() ? "pussy" : "ass") + "."));
}

public function zilTwinsFuckMicaMentally(arg:Array):void
{
	clearMenu();
	clearOutput();
	processTime(15);
	showZilTwins(1, 2, false);
	
	var zilTwinsMica:Creature = arg[0];
	var zilTwinsTetra:Creature = arg[1];
	
	var cIdx:int = -1;
	if(pc.hasCock()) cIdx = pc.biggestCockIndex();
	
	output("Grinning wide, you turn to Tetra’s girly, well-endowed brother and suggest that the cute bee boy give the both of you a little show. After all, you’ve got a nice, spacious table to act as a stage for all that femboy sitting across from you.");
	output("\n\nMica blushes at your words, looking flattered and just a touch nervous. His sister also seems intrigued by your proposal, releasing the femboy from her embrace and biting her lip.");
	output("\n\n<i>“You know,”</i> Tetra begins, taking a moment to stare at her beet-red brother, <i>“my dearest brother gets that asked of him more often than you’d think... always putting on little shows for the other girls in our village. He always gets so bashful about it too, but I know he loves the attention.”</i>");
	output(" The zil woman licks her coal-black lips at fond memories before actually addressing her sibling, <i>“Well, Mica, we’ve got a nice offworlder here and your own sister who’d like to see one of your little dances. Why don’t you show them?”</i>");
	output("\n\nThe bee boy can only blush harder at that, quickly sitting up from his seat with a sudden <i>“Yes, sister”</i> before beginning to climb onto the table.");
	output("\n\nHe nervously shifts his gaze between you and his sister, putting on a shy smile as he kneels down between the two of you with his legs spread, plush thighs squishing up against his calves.");
	output(" You watch on with a smile, and Tetra does the same, leaning onto the table and encouraging her brother with a few lusty looks. Once the alien femboy lays eyes on his sister again, he perks right up and begins his show.");
	output("\n\nResting one hand on his flat, chitinous chest, Mica reaches the other down to his exposed zil dick, already stiffening from the attention it’s getting.");
	output(" It’s hard to tear yourself from the girly bee’s long, monstrously-thick tool as it pulses to hardness, and you think that may have something to do with his potent pheromones being closer to you than before.");
	output(" Mica starts to jerk himself off without hesitation, stroking his tool from tip to base and pulling back his stretchy foreskin until he’s quivering in his spot, letting out quiet moans that send shivers down your spine.");
	output(" Soon enough, a dollop of sweet, golden pre forms on his cockhead, and that has both you and Tetra licking your lips.");
	output("\n\nThough, after a few more moments of Mica stroking himself, you realize this isn’t exactly a dance, and the zil’s twin notices as well.");
	output("\n\n<i>“Come on, Mica,”</i> Tetra chides, reclining in her seat and taking up a very regal pose, <i>“Our friend here didn’t come all the way here to watch my brother play with himself. I know for a fact you can do <i>much</i> better.”</i>");
	output("\n\nMica gets a bit flustered at that, the once smooth rhythm of his wrist becoming a bit off-tempo. <i>“I-I’m sorry, sister,”</i> the poor femboy stutters, <i>“I’ll try to do better.”</i>");
	output("\n\nWith that, the bee boy starts moving his girly hips, taking his hands off his pussy-pounding, 10-inch zil cock to run them up and down his sides.");
	output(" He moves his waist along with his hips in ways that accentuate and allow you to fully enjoy all his boyish curves, all the while pre-dripping tool wobbles back and forth near-hypnotically.");
	//output(" Mica’s moving like a well-practiced stripper, making sure to show off all his best in short bursts while continuously wiggling his hips and running his hands up and down his frame, making you wish those were your own fingers trailing along his smooth skin.");
	output(" Like a well practiced stripper, Mica’s moving in short bursts, continuously wiggling his hips and running his hands up and down himself to make sure he flaunts his delectable body. The tease makes you wish those were your own fingers trailing along his smooth skin.");
	output("\n\nBoth you and Tetra are clearly enjoying the show at this point, with the waspy girl leaning forward to get a closer look at her brother’s sensual motions, and your");
	if (cIdx >= 0)
	{
		if (pc.isCrotchExposed()) output(" [pc.cock " + cIdx + "] fully erect in the open.");
		else output(" [pc.cock " + cIdx + "] straining against your clothes.");
	}
	else output(" [pc.vaginas] growing ever wetter.");
	output(" It’s at that point she gets a bit touchy, reaching a hand out and cupping her brother’s full sack for a moment, making the zil pause his dancing and gasp as his balls are hefted and fondled.");
	
	output("\n\nLicking her lips, Tetra turns to you with a devious grin on her face, <i>“Don’t be afraid to touch, [pc.name]... I’m certainly not.”</i> She accentuates that by giving her brother’s sack a little squeeze, coaxing a thick glob of honey from his cock.");
	output("\n\nWell, if she insists. You grin wide, biting a lip and leaning forward to grab at one of the girly bee’s plush thighs, feeling his fatty tissues in your palm before moving your fingers to his throbbing shaft.");
	output(" Mica’s breath shudders as you take hold of his meaty tool, so warm to the touch, stroking his sensitive cockflesh until he starts to leak even more sweet pre.");
	output("\n\nIt seems Mica is enjoying all this attention, both physical and visual, because soon enough pre-cum is trickling down his honey-wand and all over your hand, dripping onto the table in increasing amounts.");
	output(" The femboy’s sister notices, licking her lips hungrily, then reclines in her seat and beckoning her brother over with a curling finger.");

	output("\n\nMica smiles at his sibling’s gesture between quiet moans, looking over his shoulder at you with an eager, but apologetic smile before crawling over to Tetra, leading his cock to fall from your hand, but treating you to a nice view of his squishy butt and plump balls.");
	output(" As he reaches his sister’s edge of the table, he leans back, resting on an arm and biting one of his fingers, hips thrusts forward with his monstrous zil-dick hanging in his sister’s face.");
	output(" Still gently fondling her brother’s sack, Tetra opens her mouth to accept Mica’s cum-dripping tip between her lips, eagerly suckling on it for a moment before pushing herself down his shaft.");
	output(" You can see the zil girl has trouble fitting it all in, struggling to force herself further down her brother’s thick, lengthy tool. Still, it’s clear she’s enjoying the taste of her twin’s honey-cum, pausing now and then to circle the bee boy’s girth with her tongue and gather up all the pre she can.");
	output(" Before too long, Tetra’s managed to swallow Mica’s cock to the hilt, deep throating his tool to the point where it’s bulging the girl’s throat.");
	output("\n\nOnce she’s completed that sexual feat however, the zil woman quickly pulls of her brother’s shaft with a big <i>“Mwah!”</i> and leaving a trail of saliva between her lips and his tip.");
	output(" Looking up at her blushing, panting twin, Tetra smiles and bites her lip, releasing Mica’s oversensitive sack and opting to give his spit-slick shaft a few loving strokes and one last kiss before directing the femmy wasp over to you with a nod of her head.");
	output("\n\nMica smiles and looks over his shoulder at you before turning his whole body around, bringing his needy cock into view, coated in his sister’s saliva.");
	output(" The alien femboy crawls over to you the same way he did to Tetra, locking his hungry gaze on yours and swinging his hips until he’s made it to your side of the booth.");
	output(" Then, he takes up the exact same pose he did on the opposite end of the table, leaning back on his arms with his legs spread, throbbing dick dangling in your face and his pheromones as potent as ever.");
	output("\n\nYou can’t help but grin at the sight, and after seeing how much his sister enjoyed it, how could you resist not getting a taste of Mica’s honey-wand?");
	output(" So, you take a hand and reach it to the base of the bee boy’s tool before wrapping your fingers around it and giving him a few tender strokes to coax some more sweet pre out of his tip. He whimpers and groans at your touch, his sister’s oral attentions obviously leaving him as needy as ever.");

	output("\n\nOnce he’s dripping honey all over again, you part your lips and heft Mica’s thick, heavy cock level with your mouth. You coo as your tongue is greeted with the first hint of his devilishly sugary seed, and it only furthers your need to have all of this cockmeat between your [pc.lipsChaste]."); 
	output(" Slurping down some more honey-cum, you start to push yourself down onto Mica’s tool, sheathing his length within the warm, wet embrace of your mouth until the cutie’s legs are quivering along with his voice.");
	output("\n\nThere’s actually so much zil-dick between the girly bee’s shaking legs that you have trouble fitting it all in!");
	output(" You can barely hollow your cheeks as you stretch your jaw to get Mica’s tip to the back of your throat, managing to supress your gag reflex when the alien’s tool jumps and twitches pleasurably and excitedly between your lips.");
	output(" Barely being able to see anything but Mica’s crotch, you still manage to look up at his face, filled with lust and satisfaction, his hands resting submissively folded against his chest.");
	output("\n\nIf you could smile at the sight of this adorable femboy, you certainly would, but with all this alien dick in your mouth, all you can really do is trail your [pc.tongue] along his sensitive undercarriage, leaving the zil moaning pleasurably.");
	output(" That also gets him leaking even more of his coveted cream onto your eager tastebuds. You’d almost think Mica wouldn’t have any cum left at the end of this!");
	output("\n\nTrying to gather up as much of his sweet seed as you can, you end up with the tip of your tongue right against his cockhead and flicking under his nerve-filled and stretchy foreskin, taking in his sweet taste and musky scent until the femboy is moaning aloud.");
	output(" Judging by the way Mica’s hips are moving and how his thick shaft is twitching in your mouth, you think this zil is almost on the verge of his orgasm... but with Tetra being so nice as to share her brother with you, you don’t think getting all this honey-cum to yourself would be fair.");
	output("\n\nSo, you pull off his shaft, leaving your jaw slightly sore and Mica’s tool covered in your saliva, jumping and convulsing needily while its owner whimpers pitifully as he’s left without your oral embrace.");

	output("\n\nAnd with the zil boy’s groin and tummy out of your face, you can finally see his twin again, who’s been watching your altercation with unbridled interest.");
	output(" With her brother’s cock finally free again, the waspy woman wastes no time in getting her hands all over Mica again, reaching across the table (quite rudely) to grope at the submissive sibling’s hand-filling butt and start stroking his spit-slick member, her finger tips not even touching when wrapped around his girthy tool.");
	output(" She flashes you a grin and a wink, encouraging you to do the same. How could you afford not to? You quickly lean forward with your arms outstretched to grab a nice handful of bee-butt and a palmful of plump, honey-filled testicles.");
	output(" Mica does his best to continue his dance now, but his once elegant movements begin to lose their flow as he comes closer and closer to his climax.");
	output("\n\nBetween pleasured groans and wiggles of his wide hips, the femboy starts to stammer, but <i>“S-sister, I’m going to-”</i> is as far as he gets before his voice breaks into a grunt, his sides lurching forward.");
	output(" Mica moans as his already girthy cock engorges in his sister’s grip, much to her delight, convulsing and squirting thick ropes of golden honey all over the table.");
	output(" The zil’s hips buck wildly, practically fucking his sister’s hand while she’s still jerking him off. At the same time, you massage his hefty sack, giving his cum-filled balls a little squeeze now and then to make sure all this subby bee boy has to offer gets out.");
	output("\n\nUnfortunately, the show has to finally end as Mica comes down from his climax with a heaving chest and shaking limbs after dispensing a whole puddle of honey onto the table.");
	output(" Tetra grins at her brother’s bounty and releases his softening dick so she can trail a single finger through the puddle of Mica’s thick, golden seed, coating her digit in the sweet sticky stuff.");
	output(" Then, cupping her twin’s cheek and turning him to face her, the wasp girl lifts her cum-coated finger to her dark, shapely lips and promptly licks it clean, taking a moment to savor her brother’s sugary flavor before smiling beckoning the bee boy to sit down next to her.");
	output("\n\nThe femboy grins back down at her, still panting with overstimulation as his afterglow begins to fade, and shakily makes his way to her side of the booth before sliding of the tables to take a seat right next to his dear sister.");
	output(" He rests his tired head on Tetra’s shoulder, his sibling gently brushing her hand through his short blonde hair until he’s coaxed into closing his sleepy eyes, chest still heaving.");

	output("\n\n<i>“See? He’s quite the little dancer, isn’t he?”</i> the zil woman coos before giving her brother a little kiss and turning to face you, <i>“What do you think? Was he as good as any of your offworlder dancers?”</i>");
	if (pc.isNice()) output("\n\nYou tell her that Mica most certainly is up to snuff, one of the cutest boys you’ve ever seen dance on a table.");
	else output("\n\nYou give Tetra a sly smirk and tell her you don’t know, and that you might need to see that routine a couple more times to make up your mind.");
	output("\n\nThat leaves Mica with a tired, but fulfilled smile on his face, and Tetra looking quite proud of her exhibitionist sibling.");
	output("\n\n<i>“Well,”</i> Tetra sighs happily, <i>“If you want to stick around, [pc.name], I’m sure we could chat for a bit while my brother dearest rests... but I’m sure he’ll be ready again in no time.”</i>");
	output(" She chuckles to herself, <i>“You should see him back at the village, some days the girls can’t get enough of him and he doesn’t get a lick of rest.”</i> Smiling fondly down at her brother, the waspy alien gives him another kiss before turning to you again, <i>“So, care to stick around?”</i>");
	output("\n\nAfter a show like that, you think you might need to stick around to blow off some steam with these incestuous siblings...");
	
	pc.loadInMouth(zilTwinsMica);
	flags["ZILTWINS_MICA_TEASED"] = 1;
	
	zilTwinsMenu();
}

public function zilTwinsFuckMicaForRealsies(dickNumber:int):void
{
	clearMenu();
	clearOutput();
	processTime(30);
	showZilTwins(2, 2, false);

	var dik:String = String(dickNumber);
	var dikidick:CockClass = pc.cocks[dickNumber];
	var zilTwinsMicaVol:int = chars["ZIL"].analCapacity() * 1.15;
	
	var cIdx:int = pc.cockThatFits(zilTwinsMicaVol);
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("You find your gaze drawn to Mica, thinking about all his cute curves and that nice squishy butt of his.");
	output(" Having your eyes on him makes the zil boy blush in his place on the other side of the table, shifting in his seat like he’s trying to hide from you so his face will be a little less red.");
	output("\n\nSmiling, you turn to the femboy’s sister and tell her you were hoping that you could take Mica on your own... possibly bend him over a table or two.");
	output("\n\n<i>“Ooh... now there’s something I don’t get to see nearly as often as I’d like to,”</i> Tetra says with a low, sultry tone, reclining back far in her seat, <i>“I supposed I could just... sit back and enjoy myself while you two get");
	if (flags["ZILTWINS_MICA_BUTTFUCKED"] == undefined) output(" aquainted");
	else output(" reaquainted");
	output(".”</i>");
	
	output(" With that she turns to her blushing brother, biting her lip and smiling before tapping her brother with an outstretched leg, <i>“Go on then, Mica. Our offworlder friend has taken a liking to you, go ahead and get yourself ready for [pc.himHer].”</i>");
	output("\n\nThe zil is quick to hop from his seat with a call of <i>“Yes, sister”</i>, revealing his already-stiffening cock, all-too eager for what’s to come.");
	output("\n\nGiving Mica a warm smile, you go to stand up alongside him,");
	
	if (pc.isNude()) output(" already as naked as he is.");
	else output(" already stripping yourself to get ready.");
	output("\n\nThe bee boy steals a few glances at your [pc.cock " + dik + "]");
	if (pc.isNude()) output(" as you undress");
	if (pc.cockVolume(cIdx) >= zilTwinsMicaVol * 0.75)
	{
		output(", gulping slighty as he eyes up the slab"); 
		if (pc.hasCocks()) output("s");
		output(" of cockmeat hanging between your legs");
	}
	else output(", his yellow-black face turning a bright red as he eyes up your package");
	output(".");
	if (!pc.isNude()) output(" By the time you’re good and nude, Mica is walking around to the head of the table, and you join him there, standing behind him with a grin as he goes to bend himself over the table.");

	output("\n\nIt takes a while for the zil to get himself comfortable, his hips wiggling enticingly while he settles in, setting his hefty balls wobbling. When he’s finally got himself well in place, Mica looks over his shoulder at you with a shy, but pleased smile, obviously eager to get things going.");

	if (pc.isNice()) output("\n\nSmiling back down at the femboy, you grab at his girly hips and slowly pull");
	else if (pc.isMisch()) output("\n\nGiving the femboy a wink, you grab at his girly hips and slowly pull");
	else output("You grab roughly at his girly hips and yank");
	output(" him back against your crotch, stiff [pc.cockNoun " + cIdx + "] sliding right into the crack of his squishy cheeks.");
	if (pc.isAss()) output(" Mica yelps and his");
	else output(" His");
	output(" breath shudders as your warm cockmeat rubs against his fatty tissues, and his sister watches on with great attention, biting her lip.");
	output("\n\nYou slide your hands off your bee boy’s hips and down to his big ol’ butt, squeezing his lower cheeks and spreading them, causing Mica to gasp and giving you a good look at his winking pucker.");
	output(" Grinning at the sight, you pull your [pc.hips] back, dragging your tool through the crack until your [pc.cockhead " + cIdx + "] slips down and presses against his tight " + (silly ? "boy’s soul" : "asshole") + " with just the barest amount of pressure, able to feel him clench against your tip.");
	output("\n\nThe femboy squirms when he feels your glans against his pucker, but managing to calm and relax himself before looking back over his shoulder at you, giving you a blushing smile and an affirming nod.");
	output(" You grin back down at the zil,");
	if (!pc.isAss()) output(" gently rubbing a hand against his girly butt before");
	output(" putting some pressure behind your hips, just enough to spread his relaxed " + (silly ? "boi pucci" : "anus") + " with the tip of your cock, leaving him to moan gently.");
	output(" Not stopping, you continue to push your [pc.hips] forward, stretching Mica around your shaft, his fist clenching and back arching as little whimpers and groans of pleasure force their way past his shapely black lips.");
	output(" You put a hand to the zil boy’s back and" + (pc.isAss() ? "" : " gingerly") + " push him back down flat against the table. Can’t have your insectile friend getting too uppity, can you?");
	output("\n\nThe femboy responds well to the gesture, turning his head to the side so he can lay flat against the table, looking back at you with lust-ridden, alien eyes, panting heavily.");
	output(" You find yourself needing to pull your hips back now and then as you continue to push into Mica, sawing your [pc.cock " + cIdx + "] into him so he properly adjusts to your girth and length.");
	
	pc.cockChange();
	
	output("\n\nBy the time you get all your dickmeat into the cock-hungry zil, his inner walls are hugging tightly and spasming around your intruding member as he moans and moans.");
	if (pc.isAss()) output(" You’re the least bit");
	else output(" You’re");
	output(" kind enough to give Mica a few moments to get himself comfortable with the size of your [pc.cockNoun " + cIdx + "], giving his hips an affectionate little rub as he does.");
	output(" Looking up to his sister for a moment, you see she’s retracted all her chitin plates and is happily watching this sexual excursion unfold with one hand groping her own bare tits, and a pair of fingers deep in her honey leaking slit.");
	output(" Her face is flushed red, but she grins at you all the same, giving you a nod as she fingers herself into a lustful stupor.");

	output("\n\nYou can smell her pheromones and her twin’s growing more potent by the second. That wonderful, intoxicating scent and the tightness surrounding your shaft are enough to get you moving your [pc.hips] again.");
	output(" Pulling back, you drag your cockflesh along Mica’s sensitive depth, making him cry out with pleasure, especially when your throbbing dick passes over the ball of his prostate, causing his cock to jump against the underside of the table and dispense a thick glob of honey between his feet.");
	output("\n\nWhen your glans meets the bee boy’s pucker again, you hold there a few moments, enjoying the sounds of Mica’s whimpering, obviously not happy with the sudden feeling of emptiness. So, you thrust right back into him with a single fast stroke, setting the zil’s butt jiggle and its owner moaning blissfully again.");
	output(" His fists clench and his toes curl against faux wood floors as he’s speared on your manhood again, leaking honey-pre all over.");
	output(" Then, you pull your sides back and thrust into him again, slowly building to a nice pace that leave your insectile lover drooling with pleasure, and keeps his inner walls hugging and squeezing pleasurably around your [pc.cock " + cIdx + "].");
	output("\n\nAll the while Tetra watches on, vigorously masturbating until her sweet, natural lubricants are pouring from her dusky nether lips and playing with her perky black nipples until her nectars are flowing, crying out with an ecstatic, blissful look on her face.");
	output("\n\nIt seems Mica has quite the sensitive ass too, because your steady reaming has him close to his climax before too long. His body tenses in your grip and his already clenching pucker clamps down like a vice around your cock. At the same time his own tool convulses under the table,");
	output(" spraying thick ropes of honey all over the floor as his wide, girly hips buck backwards against your own, treating you to the sight of a nice jiggly butt, and the feeling of his ass caressing your cockflesh.");

	output("\n\nYou can hardly stave off your own orgasm with the zil’s pucker masassing your [pc.cock " + cIdx + "] like it is, along with all those pheromones and the little show his sister is putting on.");
	output(" No, it’s all just too " + (silly ? "gay" : "much") + " for you to handle any longer, so all you can do is let your willpower slip away and the pleasurable force of your climax take over your body.");
	output("\n\nYour [pc.hips] jerk forward against your insectile lover’s butt, burying your tool to the " + (pc.hasKnot(cIdx) ? "knot" : "hilt") + " inside him, and coaxing a few more pleasured groans from his lips.");
	output(" Letting out your own blissful cry, your [pc.cockNoun " + cIdx + "] convulses in Mica’s ass as your [pc.balls] empty into his depths,");
	if (pc.cumQ() >= 2000) output(" filling him with [pc.cum] until his flat tummy starts to distend under the pressure of your tremendous load");
	else output(" coating his inner walls with [pc.cum] until it’s leaking out around your cock");
	output(", leaving the femboy full of your seed.");
	
	output("\n\nFinally coming down from your climax, a haze of pheromones and lust clears from your eyes, leaving you looking down at a very pleased Mica, who’s gazing back sleepily at you, smiling as best he can.");
	output(" Seeing that satisfied look in his black, insectile eyes makes you grin, and leads you to finally start withdrawing your softening dick from the bee boy. He shudders as your tender cockflesh drags along his inner walls one last time, then whimpers when you eventually fall out of him, leaving the poor femboy woefully empty.");
	output(" [pc.cum] dribbles from his gaped wasp-hole and down his taint before dripping off his plump, empty sack.");
	output("\n\nSuddenly remembering that this nice piece of " + (silly ? "boi" : "bee") + " butt has a sister, you look to see that Tetra seems to have enjoyed her own orgasm as well, pulling a honey-coated hand from her crotch and releasing her nectar-dripping breasts.");
	output("\n\n<i>“Well...”</i> she breathes between heaves of her chest, <i>“That was... quite the show... I hope you enjoyed that as much as I did, [pc.name].”</i>");
	if (pc.isAss()) output("\n\nGiving Mica’s butt a rough little spank");
	else output("\n\nGiving Mica’s butt an affectionate squeeze");
	output(", you tell the wasp woman you most certainly did.");
	
	output("\n\nShe smiles at that and goes to sit back up straight, <i>“Good job, Mica. Why don’t you come sit with your sister again?”</i>");
	output("\n\nHis sister’s words give Mica the strength to peel himself from the table with a tired <i>“Thank you, sister”</i> and limps his way to sit next to his sibling, wincing when his tender pucker hits the cushion.");
	if (pc.isNude()) output("\n\nYou");
	else output("You pull your clothes back on and");
	output(" take your place across the booth from them, smiling happily at your femboy lover as he rests his sleepy head on his twin’s shoulder.");
	output("\n\n<i>“Well,”</i> Tetra sighs happily, <i>“If you want to stick around, [pc.name], I’m sure we could chat for a bit while my brother dearest rests... but I’m sure he’ll be ready again in no time.”</i>");
	output(" She chuckles to herself, <i>“You should see him back at the village, some days the girls can’t get enough of him and he doesn’t get a lick of rest.”</i> Smiling fondly down at her brother, the waspy alien gives him another kiss before turning to you again, <i>“So, care to stick around?”</i>");
	output("\n\nIf it means getting to spend more time with Mica, you think you might just have to.");
	
	pc.orgasm();
	flags["ZILTWINS_MICA_BUTTFUCKED"] = 1;

	zilTwinsMenu();
}

public function zilTwinsFuckTetra():void
{
	clearMenu();
	clearOutput();
	processTime(30);
	showZilTwins(2, 1);

	var tetraVol:int = chars["ZILFEMALE"].vaginalCapacity() * 1.1;
	var tetraButtVol:int = chars["ZILFEMALE"].analCapacity() * 1.1;
	var zilTwinsTetraMinVol:int = Math.min(tetraVol, tetraButtVol);
	
	var cIdx:int = pc.cockThatFits(zilTwinsTetraMinVol);
	var cIdx2:int = -1;
	if(cIdx >= 0 && pc.cocks.length > 0) cIdx2 = pc.cockThatFits2(zilTwinsTetraMinVol);
	var knot2:Boolean = (cIdx2 >= 0 && pc.hasKnot(cIdx2));
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("You take a moment to take in the sight of Tetra while it’s available: from her womanly curves to her cuppable tits and pert nipples, along with her beautifully feminine face and alien features, this incestuous twin is the very picture of the alien beauty most rushers dream of.");
	output(" Looking at her, you can only come to one conclusion: you want to fuck her.");
	if (pc.isNice()) output("\n\nSo, you explain to the zil that you were hoping just you and her could have some fun.");
	else output("\n\nSo, you tell the zil that you’d like to get between her legs.");
	output("\n\nTetra lets out a mock-gasp, her face looking cartoonishly shocked as she pulls her brother close. <i>“And leave out my poor Mica?”</i>");
	output(" she asks, holding her sibling close to her cleavage, before her face turns to a smirk, <i>“But... I suppose some... exceptions can be made since you’re a guest to our planet.”</i>");
	output(" The zil woman starts to fall into her more dominant demeanor as she pulls her brother from her chest, <i>“Alright, why don’t the two of us get on the table then, should be more than spacious enough for all of us...”</i>");
	output("\n\nWith that, the alien girl starts to retract her chitinous chest guard to reveal her perfectly-proportioned C-cup along with the perky black nipples that top them, and starts crawling onto the table.");
	output(" Feeling compelled to do as the bee woman says, you");

	if (!pc.isNude()) output(" begin to strip yourself until you’re as bare as your native friends, then");
	output(" make your way onto the lacquered surface of this generously sized booth alongside the wasp woman.");
	output("\n\nOnce you’re both up there, Tetra takes a moment to scan your naked frame, your [pc.cocks] in particular, before swinging her legs forward and lying down on her back, her plush, partially-plated thighs spread to reveal her now-uncovered pussy:");
	output(" puffy, black, and leaking honey. You can barely keep yourself from drooling at the sight, your [pc.cocks] pulsing to hardness as pheromones work their magic on your already lust-ridden mind.");
	output("\n\nTetra licks her lips and rests herself on an elbow, giving you quite the pair of “fuck me” eyes before curling her finger to beckon you over. You’re quick to follow the dommy wasps lead and crawl between her legs with your hands straddling her shoulders.");
	output(" She smiles up at you and runs her hands up your arms before resting them on your back and quickly wrapping her legs around your waist, her abdomen and stinger left precariously close to your rear.");
	output("\n\nThough, before you can get to the good stuff, Tetra turns her gaze from you to her brother, who’s seeming a little bit dejected, even with his zil-cock slowly stiffening as the scene before him unfolds.");
	output("\n\n<i>“Come on, Mica,”</i> the alien beauty chides, <i>“I said there’s enough room up here for all of us, now get up here so I can make sure you aren’t touching yourself.”</i>");
	output("\n\nMica is quick to respond with a subservient <i>“Yes, sister”</i> before climbing up on the table and kneeling down with his arms held submissively at his sides, fists held tightly.");
	output("\n\n<i>“That’s more like it,”</i> his sister coos, turning her attention back to you, <i>“");
	if (flags["ZILTWINS_TETRA_FUCKED"] == undefined) output("Alright, [pc.name], why don’t you try and show me how you offworlders mate?");
	else output("I hope this is as good as last time, [pc.name].");
	output("”</i>");
	output("\n\nFinding yourself grinning and blushing at her words, you know you’ll endeavour to do your best to please this alien woman. So, you give your hips a little lurch forward, lining up");
	if (cIdx2 >= 0) output(" your [pc.cocks] with both her slightly-stretched slit and her narrow pucker, ready to give her some double-penetrative loving.");
	else output(" your [pc.cock " + cIdx + "] with Tetra’s slightly-stretched and honey-leaking slit, ready for you to fill it.");
	output(" Tetra bites her lips and tightens her legs behind you, attempting to pull you into her.");
	output("\n\nHer plan works, with your cockhead");
	if (cIdx2 >= 0) output("s spreading her pussy and asshole quite easily, drawing little more than a pleasured gasp from the girl as her delicious nectars coat your upper-most tip before the golden honey drips down, generously lubing the cock pressed against her pucker.");
	else output(" spreading her already-parted pussy, drawing little more than a pleasured gasp from the girl as she coats your [pc.cockhead " + cIdx + "] in her delicious nectars.");
	
	pc.cockChange();
	
	output("\n\n");
	if (pc.cockChange(false)) output("\n\n");
	output("<i>“Give me it all, [pc.name],”</i> commands Tetra, pulling you down a bit closer to her chest, <i>“I </i>want<i> it all, offworlder.”</i>");
	output("\n\nWell, you’re not sure you could deny the girl what she wishes, even if you wanted to, so you give your [pc.hips] a little thrust forward, spreading her sodden hole");
	if (cIdx2 >= 0) output("s around your dual shafts");
	else output(" around your [pc.cockNoun " + cIdx + "]");
	output(", and that manages to draw a quiet, blissful moan from the zil woman. Tetra continues to pull you further inside with her legs tightening around your hips, controlling your push into her honey-pot so it’s as fast as she like.");
	
	if (pc.cockVolume(cIdx) >= zilTwinsTetraMinVol * 0.75)
	{
		output(" Even with your own large package, you have a relatively easy time fitting your tool");
		if (cIdx2 >= 0) output("s into this bee woman’s pussy and asshole alike");
		else output(" into this bee woman’s pussy");
		output(", and for that you can probably thank Mica.");
	}
	else
	{
		output(" You can practically feel the constant attention this bee woman’s pussy");
		if (cIdx2 >= 0) output(" and asshole get");
		else output(" gets");
		output(" from her brother’s monster-cock with your own package sliding into her so easily.");
	}
	
	output(" Still, though, Tetra’s honey-glazed inner walls hug at your throbbing shaft" + (cIdx2 < 0 ? "" : "s") + " when you bottom out inside her, feeling her tummy hardening and tightening against yours as she works all her muscles to clench down around your [pc.cocks].");
	output("\n\nThat tightness leaves you groaning pleasurably, much to the dommy wasp’s delight. Before you can even think about pulling back, though, Tetra starts to roll her hips against yours, getting squeezing inner walls to rub against your cockflesh, setting your [pc.hips] twitching and tearing a pleasured whimper from your lips.");
	output("\n\n<i>“Come on, [pc.name],”</i> she breathes, cupping your cheek so you’re looking into her big black" + (silly ? " and soulless" : "") + " eyes, <i>“I want to see how offworlders treat their women.”</i>");
	output("\n\nIf you weren’t already feeling compelled to start moving your hips before, you are now, and quickly go to pull your [pc.hips] back,");
	if (cIdx2 >= 0) output(" both of your tools along stretching pucker and nether lips,");
	else output(" dragging your cock along her nether lips until she’s gushing out honey all over the table and midsection,");
	output(" setting her moaning as you go. Then, once your sides are pulled all the way back and you’re practically at risk of falling out of the girl, you slowly thrust your way back in with the aid of the wasp woman’s guiding legs.");
	output(" Sheathing your " + (cIdx2 >= 0 ? "[pc.cocks]" : "[pc.cock " + cIdx + "]") + " inside her a second time feels even better with Tetra now adjusted to your length and girth, gliding in easily thanks to her outpour of natural lubricants.");

	output("\n\nWith the dommy twin’s guidance, you repeat the same motion again, and again, and again until you’ve built up a steady rhythm that has your insectile lover moaning quietly and gushing her sweet fluids all over.");
	output(" All the while, Tetra keeps an eye on her brother, making sure the dejected bee boy isn’t touching himself, even with his zil cock throbbing and leaking honey-pre onto the table.");
	output(" When his sibling’s made sure he isn’t jerking off to this lovely scene, Tetra turns her gaze back to you, watching your lust-hazed, pheromone-addled face with a smile before placing a hand on the back of your head, and pushing you down to her chest.");
	output(" You don’t protest and groan happily as your face comes to rest in the bee girl’s cleavage, feeling warm boobflesh on your cheeks.");
	output(" For better or for worse, though, you don’t get to stay there long, because Tetra guides you out from between her C-cups and to one of her pert black nipples, with beads of honey already forming on her stiff teats.");
	output(" You instinctively open your mouth to accept the girl’s nipple, already tasting her sweet bounty as you close your lips around it.");
	output(" Beginning to suckle of your own accord, Tetra sighs contentedly as you’re still fucking her, running a hand");
	if (pc.hasHair()) output(" through your [pc.hair]");
	else output(" across your scalp");
	output(" while you swallow all the honey you can get. You occasionally pop off one nipple when the dommy wasp instructs you to so you can begin suckling the next.");

	output("\n\n<i>“Mmm, so obedient,”</i> the zil coos between gentle moans, <i>“You offworlders treat your females well.”</i>");
	output("\n\nHer words would leave you blushing if her pheromones weren’t already flushing your cheeks. Hearing the waspy domme’s voice and praises do lead you to speed up your thrusting, though, just ever so slightly so you can hear her blissful tones even more.");
	if (cIdx2 >= 0) output("\n\nAnd with your dual members still spreading and pleasuring the zil’s honey-slit and asshole alike");
	else output("\n\nAnd with your [pc.cock " + cIdx + "] still spreading and pleasuring the zil’s honey pot");
	output(", it’s no surprise the nectar-filled alien is close to her climax. Tetra tries to stave off her climax by biting her lip or clenching her fists, but with your suckling and fucking leaving her in a constant state of bliss, the bee girl can do nothing but let herself cum.");
	output(" Her legs and muscles clench, holding you still as her long awaited peak finally arrives.");
	output("\n\nYou groan when you feel her dusky pussy" + (cIdx2 >= 0 ? " and clenching pucker" : "") + " clamp down and convulse around your [pc.cocks], causing you to pop off her stiff nipples.");
	output(" Honey pours from Tetra’s cunt as her orgasms continues, coating your midsection and" + (cIdx2 >= 0 ? " uppermost" : "") + " cock with a substantial layer of sweet-tasting girlcum.");
	output(" All the while, Tetra thrashes and writhes with pleasure, back arching and her voice breaking into blissful moans, her brother watching on with great intrigue.");
	if (cIdx2 >= 0) output("\n\nWith the zil’s honeyed holes gripping at your needy tools");
	else output("\n\nWith the zil’s honeyed hole gripping at your needy tool");
	output(" tighter than ever and potent alien pheromones ravaging your mind, you feel like you can no longer hold back your climax either. Grunting hard, you thrust your [pc.hips] forward one last time,");

	if (pc.hasKnot(cIdx))
	{
		if (cIdx2 >= 0 && pc.hasKnot(cIdx2)) output(" stretching Tetra’s convulsing quim and asshole around your [pc.knot " + cIdx2 + "] until the obscene balls of cockflesh finally pop in after a few moments of pussy-spreading pleasure and orgasmic cries, locking you together at the groin.");
		else output(" stretching Tetra’s convulsing quim around your [pc.knot " + cIdx + "] until the obscene balls of cockflesh finally pop in after a few moments of pussy-spreading pleasure and orgasmic cries, locking you together at the groin.");
	}
	else output(" burying yourself deep inside Tetra’s convulsing quim" + (cIdx2 >= 0? " and asshole" : "") + " amongst a chorus of orgasmic cries.");
	output(" Not more than a moment later, your climax begins in earnest, [pc.cocks] spasming and [pc.balls] emptying inside of your alien lover");
	if (pc.cumQ() >= 2000) output(" until your warm seed starts to swell the zil’s flat, chitinous tummy to pregnant proportions, oh-so full of [pc.cum]. The sheer size of your load leaves Tetra groaning with fullness.");
	else
	{
		output(" until she’s full of your warm seed and");
		if (pc.hasKnot(cIdx)) output(" her inner walls are painted [pc.cumColor].");
		else output(" [pc.cum] is leaking out around your shaft.");
	}
	
	output("\n\nYou both finally end up winding down from your orgasms after a few more pleasurable moments, leaving you both panting heavily, and Tetra full of cum.");
	output("\n\nThe zil woman stares up at you for a moment, allowing you to see the satisfied look in her eyes while she pants, moaning now and then with your");
	
	if (pc.hasKnot(cIdx))
	{
		output(" knot" + (knot2 ? "s" : "") + " still stretching her.");
		output("\n\nSpeaking of, Tetra takes her gaze off you for a moment to look down at your tied-together crotches before smirking and chuckling.");
		output("\n\n<i>“I... often forget... that you offworlders have these,”</i> she says between heaves of her modest chest. With that, the zil reaches her hand down to her own pussy and begins to rub her puffy black mons in an attempt to coax your breeder’s knob" + (knot2 ? "s" : "") + " back out.");
		output("\n\nSeeing what she’s trying to do, you smile and relax yourself, just ever-so-slightly pulling your [pc.hips], causing the insectile mistress beneath you to whimper.");
		output(" Eventually, thanks to your combined efforts, you’re able to pull your knot" + (knot2 ? "s" : "") + " and the rest of your softening cock" + (cIdx2 >= 0 ? "s" : "") + " back out of Tetra, leaving her to sigh contentedly as she’s emptied completely.");
		output("\n\nThe bee girl is left no more gaped than she was before as you roll off of her and come down to lay beside her on the table, leaking");
	}
	else
	{
		output(" cock" + (cIdx2 >= 0 ? "s" : "") + " still stretching her.");
		output("\n\n<i>“Not... bad... offworlder,”</i> she says between heaves of her modest chest. With that, the zil begins to roll her own hips backwards, attempting to pull herself off your " + (cIdx2 < 0 ? "pussy-impaling shaft" : "dual shafts") + ".");
		output("\n\nWhen you realize what she’s doing, you pull your own sides back and take your [pc.cocks] along with you, emptying Tetra with one long stroke that has her sighing contentedly as she leaks");
	}
	
	if (pc.cumQ() >= 2000) output(" a cocktail of honey and [pc.cum] all over the lacquered wood.");
	else output(" both her honey and yours onto the lacquered wood.");
	
	if (!pc.hasKnot(cIdx)) output("\n\nYou leave the bee girl no more gaped than she already was when you finally roll off her womanly figure and come to rest on the table beside her.");
	
	output("\n\nThough, as your chest is still heaving and your well-used dick" + (cIdx2 >= 0 ? "s are" : " is") + " softening, Tetra doesn’t seem done yet, propping herself up on her elbows and setting her attention on Mica, still kneeling on the other end of the table, hands at his side, and his erection throbbing.");
	output("\n\nShe smiles at the sight of her well behaved brother then beckons him over with a curling finger. <i>“Well you’ve been a good boy, Mica. Come over here and get your reward.”</i>");
	output("\n\nYou watch as the zil boy’s eyes go wide and his sister spread her legs wide for him, revealing her cum-leaking, now even puffier pussy, finally unoccupied for him to use.");
	output("\n\n<i>“Th-thank you, sister!”</i> he stutters before eagerly getting on his hands and knees and crawling over on top of his sister. Mica stops when he’s over her, staring down hungrily into his sister’s eyes while his big, meaty prick drips pre onto her chitinous tummy.");
	output("\n\nTetra smiles up at him before cupping his cheek and pulling him down into a passionate, tongue-filled kiss. Her legs quickly wrap around her twin’s back, holding him in place as his hips inevitably start to move forward.");
	output(" The waspy woman whimpers when the tip of her brother’s tool presses into her now extra-puffy lower lips, her last orgasm leaving the zil incredibly oversensitive. Mica doesn’t stop and continues his push in, spreading his sister’s slit until she’s moaning and gushing out your [pc.cum] to make more room for all that honey-dick.");
	output("\n\nIt seems the femboy’s cock, as monstrous as it may seem for his species, is the perfect fit for his twin’s slit, stretching her just the wide amount so all of her sensitive inner nerves are caressed by his honey-leaking tool.");
	output(" Though, you guess that mold-and-cast fit might be thanks to what’s probably been years of that zil-prick gaping Tetra’s pussy.");
	output("\n\nStill, Mica has his sister moaning by the time he’s bottomed out inside her, already going to pull his girly hips back and pushing them back forward again.");
	output(" After a few more pumps like that, Mica has built up his thrusting to a vigorous pace, and then even further, to the point where he’s practically rutting Tetra’s honey-pot, keeping the two of them locked in constant bliss.");
	output(" Their moans and pleasured cries are muffled by each other’s lips, but you can still hear them well enough as they both writhe in the delight of their lovemaking.");
	output("\n\nSoon enough, with his sister’s hyper-sensitive quim and his monster cock pounding her silly, Mica has no trouble brining Tetra to her second orgasm.");
	output(" The zil woman breaks her kiss to let out a long, orgasmic cry as her whole body tenses, quivering with the force of her second climax and burying her face in her brother’s smooth chest. More of her sugary girlcum manages to spill out around the femmy zil boy’s shaft, coating it and the table in a new, glossy layer of lube.");
	output(" With the dommy wasp’s slit clenching and convulsing around her brother’s shaft, it’s no surprise Mica’s reached his peak too, especially after watching you two fuck for so long.");
	output("\n\nHe moans and grunts, girly hips lurching forward to bury himself deep inside his sister as his tool begins to spasm.");
	output(" Tetra gets yet another load of warm cum filling her womb for the second time in the past twenty minutes, crying out and moaning when her sibling’s sweet, golden honey begins to fill her, mixing with her own decadent fluids.");
	output(" The femboy’s hips buck and jerk against Tetras in a blur of black and yellow colours, the sound of skin-on-skin filling the air alongside the growing chorus of pleasured tones.");
	output("\n\nThe pair comes down from their powerful orgasms staring into each other’s eyes for a long moment, panting heavily, neither saying a word, the satisfied siblings enjoying a moment of silence before Tetra pulls him down for another kiss, setting their antennae twitching.");
	output("\n\nThey finally part from their embrace so Mica can sit himself upright, then start to pull his softening zil-cock out of his sister. Tetra whimpers and her breath shudders as she’s emptied, treated to once last stroke of her brother’s cockflesh along her inner walls.");
	output(" As the alien beauty is finally emptied, a whole puddle of honey, both hers and her twin’s, empties out onto the table... that Mica’s certainly a potent zil.");
	output("\n\nThe bee boy rolls off his sister and comes to rest beside her, opposite you, barely able to keep his eyes open, and come to think, you’re eyelids are feeling quite heavy too.");
	output("\n\nLuckily you and Mica aren’t the only ones with sleep on your minds, because Tetra’s soon wrapping her arms around the both of you and yawning. <i>“That was time well spent, don’t you think?”</i> she says tiredly, looking back between you and her twin with a smirk on her face.");
	output("\n\nMica blushes and turns to embrace his sister, <i>“Yes, sister...”</i>");
	output("\n\nTetra smiles at that and turns to face you, <i>“Well, [pc.name], care to stick around a while longer and rest with us?”</i>");
	output("\n\nWell... there’s probably more comfortable beds on Mhen’ga than this table, but how many of them have cute zil twins sleeping in them. Yeah, you figure you could go for a rest, and it’s not like anyone’s in this part of the bar to interrupt your post-threesome nap.");
	output(" So, you settle in next to your incestuous lovers and get ready to sleep away your afterglow.");
	
	pc.orgasm();
	flags["ZILTWINS_TETRA_FUCKED"] = 1;
	
	addButton(0, "Next", zilTwinsFuckAftermath);
}

public function zilTwinsFuckThemAll(arg:Array):void
{
	clearMenu();
	clearOutput();
	processTime(45);
	showZilTwins(2, 2);
	
	var zilTwinsMica:Creature = arg[0];
	var zilTwinsTetra:Creature = arg[1];
	
	var cIdx:int = -1;
	var vIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();
	if (pc.hasVagina())
	{
		vIdx = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	}
	
	output("Looking between the twins, you find yourself torn between wanting to get yourself between Tetra’s shapely legs and wanting Mica to pound you silly.");
	output(" No, they’re both too cute for you to decide, with their feminine curves, Tetra’s long, curly locks and shapely breasts, and with Mica’s hole-stretching zil cock.");
	output(" So, you quickly explain to the incestuous siblings that you’d like to take them both at once.");
	output("\n\nThat has Mica blushing and his sister smiling.");
	output(" <i>“That sounds like a great idea,”</i> she coos, leaning forward onto the table and licking her lips while she sinks an arm under the table to give her sibling a stealthy handjob, <i>“Doesn’t it, Mica?”</i>");
	output("\n\nThe femboy brother is quick to respond with a shuddering <i>“Yes, sister”</i> as his cock hardens beneath the table.");
	output("\n\n<i>“Sounds like we’re all in agreement, then,”</i> Tetra says, releasing her brother’s stiffening zil prick to start climbing onto the table, leaving Mica to whimper,");
	output(" <i>“Why don’t you join me up here and get things started, [pc.name], should be roomy enough for all three of us.”</i>");
	output("\n\nYou’re eager to do as she says and");
	if (!pc.isNude()) output(" start to undress yourself as you");
	output(" climb onto the table alongside Tetra.");
	
	output(" She takes a few moments to run her big black eyes over your bare body, enjoying your alien form and licking her lips at the sight before she retracts her chitinous plate, baring her perky breasts and dusky nether lips to you.");
	output("\n\nOnce she’s gotten herself a bit less modest, the waspy woman lies back on the table, propping herself up on her elbows and spreading her legs to give you an even better view of her puffy black pussy, dripping beads of her sweet, natural lubricants onto the table, her lower lips just ever so slightly parted.");
	output(" She smirks while you stare at her honey-slit, curling a finger to beckon you closer, <i>“Come and get it, offworlder. I know how much your people love how us zil taste.”</i>");
	output("\n\nHow can you refuse an invitation like that? You’re quick to get on your hands and knees, right between Tetra’s legs, getting a facefull of her potent pheromones as you get your head level with her leaky quim.");
	output(" The scent would make you drool if the thought of licking up all of the zil’s sweet honey cum wasn’t making you already.");
	output(" Before you can dig in yourself, your insectile mistress places a hand on the back of your head, and pushes you right down against her honey-glazed nether lips.");
	output(" A combination of the zil’s scent and the first taste of her sweet nectars makes you groan with pleasure");
	if (vIdx >= 0) output(", your own [pc.vaginas] growing wet");
	output(". All you can bring yourself to do now is dig in, kissing at Tetra’s sugary labia before letting your [pc.tongue] loll from your mouth and trail it along the bee woman’s slit, from clit to taint, gathering her delicious natural lubricants as you go.");
	output(" She just barely whimpers at the sensation of your tongue caressing her lower lips, but her legs clamp down around your head, trapping you in a prisons of smith, chitinous thighs.");
	output(" You don’t let up and delve into the zil’s honeyed cunt, spreading her dusky pussy as your oral organ works its way deeper inside her.");
	output(" Tetra starts to moan as your tongue caresses her inner walls, her legs tensing around your head and her voice breaking into a quiet moan.");

	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nYou work your long, dexterous oral organ into the zil’s deepest, most sensitive spots, leaving her to sink back onto the table and groan in bliss.");
	else output("\n\nYou work your [pc.tongue] along the zil’s most sensitive spots, leaving her to sink back onto the table and groan in bliss.");
	output(" Your oral affections coax more and more honey out of Tetra’s pussy, the golden fluids practically gushing out of her sugary slit and right onto your tongue, and you take in as much of it as you can.");
	output("\n\nShe’s just so delicious! So perfectly sweet that you can’t help but want more, it’s like zil were made for Terrans to eat out! Her flavor and scent have you feeling hot and needy, lust burning in your loins to the point where you feel compelled to touch yourself.");
	output(" Luckily, though, Tetra knows just what you need.");
	
	output("\n\n<i>“Alright, Mica,”</i> she says between moans, hand running " + (pc.hasHair() ? "through your [pc.hair]" : "across your scalp") + ", <i>“Why don’t you show [pc.name] a bit- unf! A bit of zil hospitality?”</i>");
	output("\n\nYou can’t see him, but you hear the subby brother respond with an eager <i>“Yes, sister”</i> before he crawls onto the table behind you.");
	output(" Not more than a moment later you feel Mica’s hands on your [pc.hips], caressing your [pc.skinFurScales] as something hot and hard presses against your [pc.vagOrAss].");
	output(" You nearly moan at the simple sensation of his tip against your " + (vIdx >= 0 ? "nether lip, gently spreading your sodden" : "pucker, gently spreading your naughty") + " hole, already feeling honey-pre dripping down your skin.");
	output(" Whining and whimpering with need, you wiggle your hips in an attempt to get the bee boy to push into you, but it seems you’re both on the same page already.");
	output("\n\nMica pulls back on your hips and pushes his own girly sides forward, stretching your [pc.vagOrAss] around his fat zil cock.");
	output(" You moan into his sister’s mons as you’re utterly impaled by ten girthy inches of alien dick meat, doing to best to continue pleasuring her while her brother does the same to you.");
	output(" The bee boy’s long, slow thrust in leaves you quivering with bliss by the time he’s buried himself to the hilt inside you, all of your nerves in overload thanks to the cock stretching your [pc.vagOrAss] and all the potent pheromones in the air.");
	output(" Mica gives you a few moments to adjust to his length, and even though you wish he’d just start fucking you already, you can’t help but enjoy the moment as the zil boy rubs a hand on your [pc.hip].");
	output("\n\nOnce your " + (vIdx >= 0 ? "pussy" : "pucker") + " has stopped spasming, your femboy lover starts to pull back again, dragging his cockflesh along your inner walls slow enough to make you shudder.");
	output(" You whimper as you’re emptied, left only with his foreskin-covered glans spreading your [pc.vagOrAss], barely inside you at all.");
	output(" Just when you’re on the brink of pushing your own hips back to get all that cock inside you again, the femboy slams his sides forward, sinking his honey-rod into you again, causing you to cry out with bliss.");

	output("\n\nMica gradually speeds himself up to a steady, but vigorous thrusting, keeping you both locked in constant pleasure as you’re filled with the zil boy’s thick alien member and your [pc.vagOrAss] hugs at his tool.");
	output(" All the while, your face is buried between Tetra’s legs, tongue-fucking her honey-cunt until she’s like a bottle of honey that just doesn’t empty, her sweet sticky stuff filling your mouth and coating your cheeks until you feel like you’re about to go into a sugar-coma.");
	output(" You have the zil moaning aloud, her legs and pussy clenching every now and then when you hit a particular <i>“sweet”</i> spot, letting you know you’re doing a good job.");
	output("\n\nWith the oral affections you’re giving her and the show her brother’s putting on it’s no surprise the dommy wasp is close to her climax. She throws her legs around your shoulders, keeping you in place as her voice breaks into a short, high-pitched cry of pleasure.");
	output(" All of her muscles seem to tighten at once, pulling you deeper into Tetra’s slit as it clamps down around your [pc.tongue]. Muffled whimpers fill your ears as an overabundance of the zil’s sweet honey-cum floods your mouth.");
	output(" You revel in the flavor of Tetra’s sweet fluids while her orgasm ensues, her inner walls spasming, causing more and more of her girlcum to flow.");
	output(" At the same time, her pheromones increase in their potency, blurring your vision with lust and clouding your mind to the point where you can think of nothing but the decadent nectars lining your tongue and the thick cock pounding your " + (vIdx >= 0 ? "pussy" : "ass"));
	output("\n\nYou can feel the need for release welling in your loins, and with Mica behind you keeping your nerves burning with ecstasy, you can no longer stave off your climax.");
	output(" Moaning against Tetra’s slit, you grind and buck your hips against Mica’s as your own inner walls start to convulse around his monstrous zil prick, hugging his shaft tightly.");
	output(" Your own voice is added to your waspy mistress’ chorus of orgasmic tones, unable to quiet yourself with inexorable bliss burning in your mind, your ecstatic moaning making Tetra shiver.");
	if (vIdx >= 0) output(" All the while your [pc.vagina " + vIdx + "] pours [pc.girlcum] all over the table, coating Mica’s crotch in a fine, glossy layer of your girlcum and creaming his cock.");
	if (pc.hasCock()) output(" Even though " + (pc.hasCocks() ? "they haven’t" : "it hasn’t") + " been getting much attention, your [pc.cocks] spasm and erupt into a fountain of [pc.cum] under the weight of vigorous " + (vIdx >= 0 ? "vaginal" : "anal") + " pounding and zil pheromones, covering the table beneath you in your seed.");
	
	output("\n\nIt seems your convulsing [pc.vagOrAss] is finally enough to bring your insectile bee boy to his peak as well. He grunts and thrusts his hips forward, hard, setting you moaning again and filling you to the brim with his honey-wand.");
	output(" Speaking of honey, you nearly fall into a second orgasm when the first shot of Mica’s sweet, warm cum hits you inner walls, coating your " + (vIdx >= 0 ? "pussy" : "asshole") + " with his golden seed. And there’s just so much of it!");
	output(" It’s almost like his plump balls are bottomless, filling your " + (vIdx >= 0 ? "womb" : "depths") + " until you’re groaning at the pleasurable sensation of fullness and the sticky yellow stuff is flowing from your well-fucked hole.");
	output("\n\nIt continues on like that for some amount of time you can’t determine, with a seemingly endless wave of endorphins and pheromones clouding all your senses.");
	output(" All you can think about and remember is pleasure and honey by the time it’s over, your vision seeming to clear to reveal you’re still most certainly between Tetra’s legs.");
	output(" Before you can pull yourself from her quim, though, you’re stricken by a terrible feeling of emptiness as Mica goes to pull himself out of your sodden " + (vIdx >= 0 ? "cunt" : "pucker") + " in one long stroke, leaving you shivering and leaking");
	if (vIdx >= 0) output(" [pc.girlcum] and");
	output(" honey onto the table");
	if (vIdx >= 0 && pc.vaginas[vIdx].looseness() <= 2) output(", and more than a bit gaped");
	output(".");
	
	if (vIdx >= 0) pc.cuntChange(vIdx, zilTwinsMica.cockVolume(0));
	else pc.buttChange(zilTwinsMica.cockVolume(0));
	
	output("\n\nThen, Tetra reaches a hand down to cup your cheek, pulling your face from her puffy, nectar spilling slit so you can look up at her clearly satisfied face and bare, heaving chest.");
	output("\n\n<i>“So... [pc.name]...”</i> she says between labored breaths, <i>“Do you... enjoy how we zil treat our... guests?”</i>");
	
	output("\n\nSo woozy, tired, and fucked-silly, all you can really manage to do is smile and nod before promptly collapsing onto Tetra with your head rest in her cleavage. You can feel and hear her chuckle slightly at that, but she wraps her arms around your tired body all the same.");
	output(" Not too long after, she calls her brother over to rest with the two of you, stopping to deliver a little kiss to one of your cheeks before before settling in alongside his twin, facing you.");
	output("\n\nBefore your eyes close, you get a good look at his blushing face, and barely make out him whisper, <i>“I hope I serviced you well, offworlder.”</i>");
	output("\n\nTo which, you smile before finally closing your eyes, ready to sleep away your afterglow in this amorphous cuddle pile.");
	
	if (vIdx >= 0) pc.loadInCunt(zilTwinsMica, vIdx);
	else pc.loadInAss(zilTwinsMica);
	pc.girlCumInMouth(zilTwinsTetra);
	pc.orgasm();
	flags["ZILTWINS_BOTH_FUCKED"] = 1;
	
	addButton(0, "Next", zilTwinsFuckAftermath);
}

public function zilTwinsFuckAftermath():void
{
	clearMenu();
	clearOutput();
	processTime(120);
	showZilTwins(1, 1);
	
	output("After a nice post-coital nap, the three of you awake, still covered in cum, and move back to your");
	output(" seats, with Mica and Tetra sitting across from you. Even after all that, the pair still seems very");
	output(" keen on enjoying your company, and ask you to stay a while longer.");
	
	zilTwinsMenu();
}