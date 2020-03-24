import classes.Characters.SydianMale;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Miscellaneous.NoItem;
public function encounterMaleSydian():void
{
	showName("FIGHT:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//Male Encounter
	//First Time
	if(flags["MET_SYDIAN_MALE"] == undefined)
	{
		author("Lukadoc");
		flags["MET_SYDIAN_MALE"] = 0;
		output("\n\nA nearby junkpile shudders, drawing your attention. You look closer, and this time you see something besides rotten rubber and discarded machinery: a pair of wiggling antennae that seem to be groping around rusted metal, further corroding it with every touch. Then, as if somehow aware of your presence, the creature below moves, sending the concealing mound shuddering. Tiny cascades of detritus roll down the side as a vaguely humanoid mass rises up out of it, chewing metallic flakes as the dust settles.");
		output("\n\nThe creature dusts itself off as it regards you, giving you time to do the same. It stands about seven feet tall. Its shape is the fairly common bipedal configuration with thick, powerful limbs covered in reddish armor plating. A long, powerful tail sways behind it, tipped feathery feelers that look similar to its antennae and plumage.");
		//No new PG
		//Met lady rust monster
		if(flags["MET_FEMALE_SYDIAN"] != undefined) output(" It has to be a male sydian!");
		//Unmet
		else
		{
			output("\n\nYou’ve never met its like before, but the codex is way ahead ahead of you.\n\n<i>“Sydian detected. Initial reports their feelers and antennae secrete a highly corrosive substance with mild aphrodisiac qualities. This codex is not rated to withstand such materials. Hostility is rated roughly within terran norms. Tread with caution,”</i> the codex chimes. The alien smirks at the sound of it.");
		}
		//Merge
		output("\n\nRolling its shoulders as if to stretch, it looks you up and down. <i>“Here in the wilds of Tarkus, the only law is that the strong get what they want, and I think I want you, offworlder... or at least some of that tasty-looking kit.”</i> He blinks his insectile eyes and steps into a comfortable, battle-ready pose.");
		output("\n\nIt looks like you’ll have to prove your strength if he’s going to take you seriously.");
	}
	//Repeat
	else
	{
		output("\n\nA male sydian emerges from the heap that he was rifling through and smiles at your approach, obviously intending to subdue you by force. You’ll have to fight!");
	}
	flags["MET_SYDIAN_MALE"]++;
	
	CodexManager.unlockEntry("Sydians");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new SydianMale());
	CombatManager.victoryScene(beatUpARustMonster);
	CombatManager.lossScene(loseToSydianMaleRouter);
	CombatManager.displayLocation("SYDIAN (M)");
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
}

//Win Menu
public function beatUpARustMonster():void
{
	showName("DEFEATED:\nSYDIAN MALE");
	author("LukaDoc");
	//Win by HP:
	if(enemy.HP() < 1)
	{
		output("Unable to maintain his balance, the sydian falls to his knees. At your approach, he raises his hands in a defensive gesture. " + pc.mf("","<i>“Beaten by a girl, huh?”</i> he sighs. ") + "<i>“Alright, you won. I surrender. To the victor go the spoils,”</i> he says, looking down in submission.\n\n");
		//(Display sex options + Leave)
	}
	//Win by Lust:
	else
	{
		output("Panting with lust, the sydian falls to his knees, stroking his [enemy.cock]. As you approach, he looks up to you with lust addled eyes. <i>“Mhmm, I give up. " + pc.mf("","I don’t care that you’re a girl. ") + "Do whatever you want with me,”</i> he says, licking his lips as he continues to shamelessly masturbate before you.\n\n");
	}
	if(pc.lust() < 33) 
	{
		output("You aren’t aroused enough for any forms of sex.\n\n");
		clearMenu();
		addDisabledButton(0,"Pitch Anal","Pitch Anal","33 lust and a phallus that will fit into the sydian is required for anal sex.");
		addDisabledButton(1,"Cowgirl","Cowgirl","33 lust and a vagina are needed for this scene.");
		addDisabledButton(2,"Tailpeg+","Tailpeg+","33 lust and a tailcock are needed for this scene.");
		addDisabledButton(3,"Tailsuck","Tailsuck","Using your tail on the sydian requires a tail vagina and 33 lust.");
	}
	else
	{
		clearMenu();
		//Dudes Buttfukk - Dick that fits in butt
		if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(0,"Pitch Anal",dudesButtFuckInATotallyNonGayWay,undefined,"Pitch Anal","Buttfuck the brute.");
		else addDisabledButton(0,"Pitch Anal","Pitch Anal","A phallus that will fit into the sydian is required for anal sex.");
		//Chicks Go For A Ride
		if(pc.hasVagina()) addButton(1,"Cowgirl",chicksRideASydian,undefined,"Cowgirl","Mount the brutish sydian and ride him, leaving no doubt that you’re in charge.");
		else addDisabledButton(1,"Cowgirl","Cowgirl","In order to ride the sydian cowgirl, you need a vagina.");
		//Peg & Footjerb a Rustmonster With Your Cocktail
		if(pc.hasCockTail()) addButton(2,"Tailpeg+",greatFootjerbSavin,undefined,"Tailpeg+","Use your tailcock to plunder him from behind while teasing his own member.");
		else addDisabledButton(2,"Tailpeg+","Tailpeg+","You need a tailcock for this scene.");
		//Hungry Hungry Tailgina
		if(pc.hasTailCunt()) addButton(3,"Tailsuck",hungryhungryTailginasThirst,undefined,"Tailsuck","Feed your tail cunt a meal of delicious xeno cum.");
		else addDisabledButton(3,"Tailsuck","Tailsuck","Using your tail on the sydian requires a tail vagina.");
	}
	//Have a Drink on Me (Victory Blow the Sydian)
	//frogapus (threw in some snowballing, too. If it’s not your thing, feel free to drop it)
	addButton(4,"Give BJ",haveADrinkOnMeWithSnowBallsMrRustBro,undefined,"Give Blowjob","Get down and give the alien a blowjob, striking a blow for improved intergalactic relations.");
	addButton(5,"Spank",spankHPBeatenRustBro);
	addButton(14,"Leave",chooseToLeaveBeatenRustBro);
}

//[=Leave=]
public function chooseToLeaveBeatenRustBro():void
{
	clearOutput();
	author("LukaDoc");
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//Kind:
	if(pc.isNice() || pc.isMischievous()) 
	{
		if(enemy.HP() < 1) output("<i>“Just go,”</i> you tell him, waving him off in dismissal.\n\n<i>“Um, thank you,”</i> he says, scuttering away.");
		else output("<i>“Just finish your business and go,”</i> you tell him, waving him off in dismissal.\n\n<i>“Um, thank you,”</i> he says, still masturbating as you leave him behind.");
	}
	//Hard:
	else {
		if(enemy.HP() < 1) output("Taking your " + pc.meleeWeapon.longName + " in hand, you promptly give the sydian a well deserved strike with the blunt side. He falls down on his face, butt raised for the pleasure of whatever predator decides to take the slut. That oughta teach him to mess with you.");
		else output("Taking your " + pc.meleeWeapon.longName + " in hand, you promptly give the sydian a well deserved strike with the blunt side. He falls down on his face, butt raised for the pleasure of whatever predator decides to take the slut. That oughta teach him to mess with you.");
	}
	output("\n\n");
	CombatManager.genericVictory();
}
public function spankHPBeatenRustBro():void
{
	clearOutput();
	author("LukaDoc");
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	output("Pushing him down, you lift one of his legs and begin administering a well deserved spanking to the naughty critter. <i>“Bad boy!”</i> you exclaim as you wail on that butt until your hand’s imprinted on his sorry behind.");
	if(enemy.HP() < 1) output("\n\nThe sydian yelps in pain until eventually his yelps turn into lusty moans. You note his cock is erect and throbbing visibly when he starts moaning. So the slut’s enjoying this? What a perverted sydian.");
	else output("\n\nThe sydian moans as you administer his punishment. It’s quite obvious he’s enjoying this. Quite the slut, this guy.");
	output("\n\nSatisfied with the sydian’s punishment, you release his leg and leave him to rub at his sorry behind. <i>“Scram!”</i> you say authoritatively.");
	output("\n\nThe sydian immediately scurries away, not bothering to look back");
	if(enemy.lust() >= enemy.lustMax()) output(", a trail of his silvery pre tracing his path");
	output(".\n\n");
	CombatManager.genericVictory();
}

//Dudes Buttfukk
public function dudesButtFuckInATotallyNonGayWay():void
{
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//Better get nakkers
	if(!pc.isNude())
	{
		output("You strip out of your [pc.gear] with a lecherous smile on your face");
		if(pc.lust() >= 75) output(", groaning when [pc.eachCock] lurches free of the confining garments, engorging in anticipation of the reaming you plan to dole out.");
		else 
		{
			output(", groaning when you take the time to stroke your [pc.cocks] one-handed, feeling ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" swelling in anticipation of the reaming you’re about to dole out.");
		}
	}
	//Already nuddies
	else {
		output("You roll your exposed shoulders and smile lecherously, reveling in your nudity and the ease with which it allows your prick");
		if(pc.cockTotal() > 1) output("s");
		output(" to swell to full tumescence, unfettered by restraining garments or armors.");
	}
	//Merge
	output(" The captive sydian watches with a slow, sly smile of his own. Perhaps he secretly hoped it would come to this if he lost. It’s certainly better than the more violent alternatives, that’s for sure. Giving yourself a few firming pumps, you advance on the supine creature, your eyes tracing the sculpted curvature of his muscular frame down to his narrow hips and tight-looking ass.");
	output("\n\nYou point at him, and he looks back, confused");
	if(enemy.lust() >= enemy.lustMax()) output(" but erect and drooling his silvery pre-cum");
	else output(" but rapidly stiffening in response to the sight of your body");
	output(". Sighing, you make a circular gesture with your fingertip - surely he can figure out that you want him on his hands and knees. How else would you vent the lusts he excited in your body? He seems to get it after a moment of consideration and climbs up, presenting his taut, armored ass for your inspection, a single crimson star visible in the shadow of his tail.");
	output("\n\nHe actually backs up into you before you can get into position. What a greedy slut. Grabbing hold of his tail before he can slap you with it or its feelers, you lift it out of the way and deliver a quick slap to his ass. He shudders but stops his feverish, anal advances with a sigh.");
	output("\n\n<i>“Atta boy,”</i> you growl in the back of your throw, shifting his tail to one side so that you can lay both your hands on his hips, guiding his hungry pucker to a more fitting place - right against your [pc.cockHead " + x + "]. The lusty alien male wiggles his narrow hips as if to encourage you, and his tail wraps around to press against your [pc.butt], smearing some quickly-absorbed substance onto your [pc.skin] while he tries to spur you into thrusting forward.");
	output("\n\nAmazing how a little show of dominance can turn the swaggering rust-beast into an eager, lusty trollop. You push into his tailhole. At first, it’s slow going. He may be eager for a fuck, but his star is far from well-worn. His sphincter tries to remain stubbornly closed, yet it gives all the same, eventually acceding to your [pc.cock " + x + "] rapacious demands for entrance. He’s so very warm on the inside, and you slide into the sensuous ring with glee, all the way to your [pc.knot " + x + "].");
	if(pc.hasKnot(x)) output(" At that point, the additional girth catches, but it’s nothing a few gentle rubs of your new fuck-buddy’s ass won’t help him relax for. A few pushes later, and you’re in.");
	output("\n\nDroplets of what looks like pure silver slowly roll out of his lust-bloated cocktip as you ream him, liquid evidence of his enjoyment. A bass groan rumbles out of his chest as you pull back only to turn into a higher-pitched yelp when you roughly jackhammer in a second thrust. You rebound off his ass for another and another, and another... and another. Your [pc.cock " + x + "] blasts through his black hole rapid-fire, focused entirely on using him as little more than a pleasing sleeve, but he seems to enjoy it all the same.");
	pc.cockChange(true,false);
	output("\n\nThe sydian’s tail slaps your [pc.butt] every time you slow, spurring you to thrust further - and harder - into your chosen cum-dumpster. The repeated strikes leave behind more of that sticky secretion. It may absorb into your [pc.skinFurScales] almost immediately, but it leaves behind a little more heat and a little excess need with every strike. [pc.EachCock] feels overburdened with blood, so hard that it’s becoming painful. With your need always on the rise, you piston harder and faster, squeezing more silvery pre-jizz out of him from the inside.");
	output("\n\n<i>“More!”</i> the encouraging sydian growls from below. <i>“Harder!”</i>");

	output("\n\nYour next thrust hits him hard enough to grind his cheek into the sand. It’s good enough that you can feel his ring clamping down around, spasming with wild abandon and pleasure. His cock visibly throbs and pulsates beneath him, spewing long ropes of gooey, mirrored jism, unable to contain so much pleasure any longer. Regardless of whether he’s cumming or not, you redouble your efforts, using his puckered entrance to climb to an orgasm all your own.");

	output("\n\nThe rusty slut manages to make quite the little puddle by the time you finally near a ");
	if(pc.balls > 0) output("ball-draining");
	else if(pc.hasKnot(x)) output("knot-swelling");
	else output("sphincter-flooding");
	output(" climax. Slapping his ass, you dig your fingers into the edges of his chitin and warn, <i>“Cumming!”</i> a moment before the fuck-eroded dam inside you bursts, releasing your [pc.cum] straight into his butt");
	if(pc.hasKnot(x)) output(", but not before filling your knot");
	output(". You bottom out and stay there, your [pc.hips] pushed forward as hard as physically possible in order to fully impregnate the sydian’s ass. ");
	if(pc.cumQ() < 5) output("Tiny trickles of [pc.cum] are all that you have for him, milked nearly dry as you are. It might be time to take a break from the ceaseless fucking to build up a decent load.");
	else if(pc.cumQ() < 25) output("Your [pc.cumColor] seed rushes out in energetic ropes, nestling deeply into his every nook and cranny.");
	else if(pc.cumQ() < 100) 
	{
		output("Your [pc.cumColor] seed bursts out in huge, thick ropes, heavy enough to make him gurgle as you thoroughly sperm-up his guts.");
		if(!pc.hasKnot(x)) output(" He moans as a single trickle of [pc.cum] escapes from around you to trickle down his leg.");
		else output(" He groans at the way your knot keeps it all sealed inside.");
	}
	else if(pc.cumQ() < 500)
	{
		output("Your [pc.cumColor] seed erupts in seconds-long spouts of belly-packing goodness, voluminous enough to make him audibly gurgle. He cradles his belly to feel the sheer weight of it");
		if(pc.hasKnot(x)) output(" while your knot seals it up tight inside him");
		output(".");
	}
	else {
		output("Your [pc.cumColor] seed erupts in enormous fountains, heavy and long to flood his ass, making his belly gurgle noisily before it distends, rounded by the voluminous ejaculate.");
		if(pc.cumQ() >= 4000)
		{
			output(" You keep nutting until he looks pregnant");
			if(!pc.hasKnot(x)) output(" and [pc.cum] fountains out around the imperfect seal of your [pc.cock " + x + "]");
			output(".");
			if(pc.cumQ() >= 10000) output(" Then, you swell his gravid dome into an obscene pillow that would support him even if he weren’t on his hands and knees.");
		}
	}
	//Knotted
	if(pc.hasKnot(x))
	{
		output("\n\nFinishing takes a good long while with a knot, but you don’t mind. You rock your hips back and forth gently rubbing his sensitive internals while trickling your entire load into him, working him dry well before your bulb shrinks enough for you to pop out.");
		if(pc.cumQ() >= 500) output(" A waterfall of [pc.cum] pours out after you, rolling out of his knot-ruined pucker like a sexual parody of Niagra Falls.");
	}
	//Not knotted
	else
	{
		output("\n\nOnce you finish up, you slide out and admire the way his asshole hangs open, shaped in imitation of your dick.");
		if(pc.cumQ() <= 300) output(" Some [pc.cum] slips out of as well, rolling down his own balls and cock to mix with his silver release and the ground.");
		else output(" Gushes of [pc.cum] well up from inside him, rolling down his own balls in shining, slick rivers before mixing with his silvery release on the ground.");
	}
	//No new PG
	output(" The sydian collapses once no longer impaled, ");
	if(!silly) output("giving you a weak smile and nod ");
	else output("giving you a weak thumbs up ");
	output("before closing his eyes in slumber. You suppose they won’t do much about the stereotype of males sleeping after sex.\n\n");
	processTime(20+rand(10));
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Chicks Go For A Ride
public function chicksRideASydian():void
{
	var x:int = pc.cuntThatFits(enemy.cockVolume(0));
	// Preg check
	if(pc.isPregnant(x))
	{
		var i:int = 0;
		var wombs:Array = [];
		x = -1;
		for(i = 0; i < pc.totalVaginas(); i++)
		{
			if(!pc.isPregnant(i)) wombs.push(i);
		}
		if(wombs.length > 0) x = wombs[rand(wombs.length)];
	}
	if(x < 0) x = rand(pc.totalVaginas());
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	output("Fighting this brutish sydian male has worked up a powerful appetite within you, one that flutters down your belly to your [pc.thighs] and, more importantly, your [pc.vaginas]. A seven foot tall xeno with a huge, thick dick and ");
	if(flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] != undefined) output("fluttering cilia just waiting to stroke your canal?");
	else output("who knows what kind of pleasurable quirks?");
	output(" That’s just what you needed. How fortunate one decided to present himself to you. Swaying your [pc.hips] back and forth, you advance on the ");
	if(enemy.lust() >= enemy.lustMax()) output("distracted");
	else output("momentarily downed");
	output(" male");
	if(!pc.isNude()) output(" and peel your [pc.gear] off as sensuously as possible.");
	else output(" and let your hands play across your [pc.skin] as sensuously as possible.");
	output(" You want him hard when you take him.");

	if(enemy.lust() >= enemy.lustMax()) output("\n\nNot that you needed to bother with the enticement, he was already helplessly stroking himself off from your previous antics. All you did was make his jaw drop and his tongue loll.");
	else 
	{
		output("\n\nNot that much enticement was necessary, he firmed up nicely to the sight of your naked body and glistening womanhood");
		if(pc.vaginaTotal() > 1) output("s");
		output(", and his hand found its way to his cock all on its own.");
	}
	output("\n\n<i>“Atta boy. I like you better like this... but ");
	if(!pc.isAss()) output("cumming now won’t be anywhere as good as sating yourself inside me, will it?");
	else output("if you cum anywhere but where you belong, you’re not gonna like it. I’ve no use for a limb noodle or a weak fuck.");
	output("”</i> you coo while circling slowly around him, smiling as you trace one hand over the [pc.skinFurScales] of your chest");
	if(pc.biggestTitSize() >= 1) output(", just between your [pc.chest]");
	output(".");

	output("\n\nThe sydian’s eyes widen appreciatively, and he reluctantly slows the fevered stroking of his pre-slicked, brass-colored rod. <i>“I-I am not sure how to-... how to submit... to a woman.”</i> He looks down and to the side, onyx eyes unwilling to meet your own.");
	output("\n\nYou ");
	if(pc.isNaga() || pc.isGoo()) output("slither on top of him, poking him with the tip of your [pc.foot] for good measure.");
	else output("place a [pc.foot] square on his chest for good measure.");
	output(" <i>“You don’t have to be sure,”</i> you say as you sidle into position above him. <i>“You just have to stay hard for me.”</i>");
	output("\n\nThe male’s tail, folded beside him by own supine position, flicks back and forth in agitation, but he does not respond. His gaze remains fixedly aimed at the ground in a gesture of submission, though his three-fingered hands clench in irritation. So long as he doesn’t get any bright ideas about being on top, you’ll get along fine.");
	output("\n\nEasing yourself down, you grab hold of his fuzzy, orange prick. The thousands of little brushes that coat it wriggle and squirm against your hand, made sticky by the liquid excitement he’s leaking. You can’t wait to have them inside you, squirming and rubbing along the inside of your tunnel, massaging pleasure into every square inch of nerve-packed skin. Trickles of moisture leak down your [pc.legOrLegs]. You don’t really mind; the extra lubrication is just going to make this all the more pleasurable.");
	output("\n\nThe turgid, alien cock’s cilia flutter against your netherlips as the greater bulk of his mass parts them, wracking you with far more sensation than simple insertion alone should provide. Then again, most tools don’t come with build-in stimulation functions. Your [pc.lips] open wider than their sisters down south as you moan and slip down, letting a half-dozen inches of thick, orange prick deep into your canal. Every bit of him is covered in those squirming tendrils, and the ones coming into contact with you kick lightning-fast, stroking your walls with hellishly distracting pleasure.");
	//Cuntchange: half volume.
	pc.cuntChange(x,enemy.cockVolume(0)/2,true,true,false);
	output("\n\nShuddering, you try to still your body’s frantic desire for a deeper, more fulfilling fuck and ultimately fail. Your hips drop, impaling you all " + num2Text(Math.round(enemy.cocks[0].cLength())) + " inches of hole-stretching, wall-massaging cunt-stuffer at once.");
	if(pc.vaginalCapacity(x)/2 > enemy.cockVolume(0)) output(" Silently, you wish he was a little bigger.");
	else if(pc.vaginalCapacity(x)/1.5 > enemy.cockVolume(0)) output(" It slips into your capacious slit like a hand into a tailored glove.");
	else if(pc.vaginalCapacity(x) * .9 >= enemy.cockVolume(0)) output(" It slips into your slit tightly but not tightly enough to be painful. If it wasn’t for how wet you’ve gotten, you might not be enjoying this as much.");
	else output(" It slips in with more than a little bit of pain, stretching your walls further apart than they were meant to go before pushing at your cervix like a battering ram. You hold still as your [pc.vagina " + x + "] adjusts to the oversized intrusion, thumping a fist at the chitinous brute’s pecs until the fiery pain cools to warm pleasure.");
	output(" His member’s unique attributes all move now, wriggling and slipping against your insides, feeling every nook and cranny.");
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	output("\n\nThis moment, right here, right now, is the moment the sydian was waiting for - the moment when his tool sufficiently distracted you, the moment when your nervous system was too overwhelmed by cascades of sensation to function properly. He grabs you by the arms and pulls, dragging you down to his chest, your [pc.chest] pressed flat against him. His tongue lolls out to lick to against your cheek while he forcefully lifts his hips and begins bouncing you in place, fucking you like a ragdoll. There’s no skill to it, just rough, animal fucking - one pair of hips slapping into another again and again.");
	output("\n\nEyes crossed in ecstasy, you try not to let it show how much you’re enjoying this or that you expected something like this to happen all along. Instead you focus on the rough plowing of your [pc.vagina " + x + "] and wrapping your arms around your stud’s neck so that you can steady yourself against the rampant fuck and nuzzle into his neck at the same time. He growls, a powerful bass rumble that vibrates out of his throat more than his mouth but doesn’t move to stop you. In fact, he licks your cheek with a long orange tongue, slobbering his affections as his dick grows thicker within you.");
	output("\n\n<i>“Not yet,”</i> you manage to say without sounding like a moaning harlot. You reach back to find his balls, already slick with your [pc.girlCum], and grab him around the top of his sack, pinching tight around them and his shaft together. <i>“Naughty boys don’t get to cum unless they get mistress off. Go on,”</i> you pant, <i>“Harder.”</i>");
	output("\n\nAt first, he slows in confusion, but then, with rising urgency, he picks up the tempo, slamming himself into you again and again, so hard that you feel your juices splattering off the knuckles you’re keeping locked about his length. His arms grab you by the waist to move you faster, throwing you around like a ");
	if(pc.tallness <= 70) output("tiny ");
	else if(pc.tallness >= 84) 
	{
		output("big");
		if(pc.tone < 50 && pc.skinType != GLOBAL.SKIN_TYPE_CHITIN) output(", soft");
		output(" ");
	}
	output("fuckdoll, slapping his bitch-breaking girth into you with bruising force. Your composure slips once more, and this time, you’re sure you’re going to cum.");
	output("\n\nThe sydian must sense this because he grabs hold of ");
	if(pc.hasCock() || pc.hasClit())
	{
		if(pc.hasCock()) output("[pc.oneCock] and starts pumping you towards your orgasm, seemingly comfortable with handling another’s member so long as he’s hilt-deep in a pussy.");
		else if(pc.clitLength > 4) output("[pc.oneClit] and starts pumping the enormous lady-boner, wracking you with intense sensation.");
		else output("[pc.oneClit] and starts rubbing against it, wracking you with intense sensation.");
	}
	else output(" your groin and deeply massages your mons, wracking you with intense sensation.")
	output(" You give in, eyes crossed, and let it happen. You let the heat in your [pc.vaginas] blossom into a wonderful, glowing bloom. [pc.GirlCum]");
	if(pc.isSquirter()) output(" washes out of you in a tide");
	else if(pc.wetness(x) >= 3) output(" soaks your mate");
	else output(" dribbles out");
	output(" at your orgasm, and your walls wring the trapped dick for all they’re worth, trying to milk it for cum that isn’t going to come until you let him.");
	output("\n\nThe sydian squirms and writhes, noisily grunting and growling, obviously needing to cum. You regard him, your face still flushed with the heady glow of pleasure. What do you do? Are you going to let him cum inside you or make him squirt all over himself?\n\n");
	if(flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] == undefined) flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] = 0;
	flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"]++;
	processTime(30+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Inside",takeRustBroCumInside,x);
	addButton(1,"Outside",takeRustBroCumOutside,x);
}

//Cum Inside You
public function takeRustBroCumInside(arg:int = 0):void
{
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	var x:int = arg;
	output("Perhaps you’re feeling generous.");
	if(!pc.isPregnant(x)) output(" Perhaps you’d like to see if a sydian can impregnate you.");
	output(" Perhaps you feel that he deserves the same kind of pleasure you experienced. Or... perhaps you just like the feel of cum splashing against your inner walls, the heated tingle of thick seed bathing your passage’s every nook and cranny. He’s never going to know, but he will get to cum inside. You’ve made up your mind, and as your fingers release their rigid grip, you feel him swell with his impending release.");
	output("\n\nThe burly male’s chest heaves with a sharp intake of breath. His cock surges. His sack tightens, and then, he’s cumming. You can only tell by the sputtering sensations of wet warmth within your channel, growing more and more noticeable as the overwarm spooge fills you, lapping at your ");
	if(pc.isPregnant(x)) output("closed ");
	output("cervix as if to beg for entrance. Smiling, you look down at him as he tips head back with his eyes closed in pleasure. You deigned to give him release, to let him explode inside of you, and you revel in it all: his pleasure, the control, and the wonderful feelings inside your [pc.vagina " + x + "].");
	output("\n\nTrickles of silvery spooge leak around his length as he finishes. When you rise up off of him, those same trickles turn into fat globules of wasted spunk, but more than enough clings inside you to leave you sticky and sated.");
	output("\n\nHe sits there leaking thin trails of excess spunk onto his belly while you gather your [pc.gear]. By the time you depart, he’s asleep and gently stroking himself to what you can only assume are dreams of you.\n\n");
	processTime(5);
	pc.loadInCunt(enemy,x);
	CombatManager.genericVictory();
}
//Cum Outside
public function takeRustBroCumOutside(arg:int = 0):void
{
	var x:int = arg;
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	output("Giggling, you slide yourself off his quim-tickling length and watch it throb. The brushes are moving wildly, going nuts trying to stroke a phantom pussy, his need superseding his body’s natural instincts. The sydian looks at you pleadingly, and with a nod, you relax the iron-hard grip on his dribbling dick. He swells immediately and significantly, growing at least 25% thicker in the span of half-dozen pounding heartbeats.");
	output("\n\nYour [pc.lips] curl slowly as you whisper just loudly enough for him to hear, <i>“Good boy. Cum.”</i>");
	output("\n\nAs if the sydian could do anything else! He tips his head back and closes his eyes. The pupils were already rolling back anyhow, and his tongue lolls from his mouth, slathering his cheek and neck in clear spittle. More importantly, his expanded boner’s shape distends from the cum surging into it just before going off. Silver seed arcs up into the air, hanging in long, solid streams before splattering off his armored chest in long ropes. The alien’s hips twitch, repeating the action again and again. You count six such ejaculations before you give up and just enjoy the show, watching him waste his cum for your benefit, his prick doing exactly what you want it to do.");
	output("\n\nWhile he’s still squirting and dribbling, you make to grab your [pc.gear]. The wastes wait for no one. Your codex and belongings secure, you turn back for one last look at your spent mate; he’s already asleep, drooling while one of his hands slowly fondles his half-hard cock, obviously dreaming of you.\n\n");
	processTime(5);
	CombatManager.genericVictory();
}
//Have a Drink on Me (Victory Blow the Sydian)
//frogapus (threw in some snowballing, too. If it’s not your thing, feel free to drop it)
public function haveADrinkOnMeWithSnowBallsMrRustBro():void
{
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	author("Frogapus");
	output("The Sydian staggers back, collapsing against a nearby junk pile as he ");
	if(enemy.lust() >= enemy.lustMax()) output("grips his massive cock, masturbating furiously.");
	else output("clutches at his wounds.");
	output(" As he slowly sinks to the rubble-strewn ground, legs spreading, you get an idea.");
	output("\n\nLicking your lips, you saunter towards the prone form of the rust monster.");
	output("\n\n<i>“Puh-please, I can’t take anymore,”</i> he mumbles, unable to meet your gaze.");
	output("\n\nYou smirk and let him know that you’ve worked up a pretty big thirst fighting him, and he needs to take responsibility for that. The burly male freezes, looking up hopefully as you drop ");
	if(pc.hasKnees()) output("to your [pc.knees] in front of him");
	else output("down");
	output(", ");
	if(!pc.isNaga()) output("your [pc.legs] straddling");
	else output("your coils draped over");
	output(" his broad tail. ");
	if(enemy.lust() >= enemy.lustMax()) output("He hesitantly removes his large hand from his thick meat as you settle yourself down.");
	else output("His cock immediately perks up at you settle your weight on him.");

	output("\n\nYou touch a fingertip to the tip of his cock, watching it throb to full stiffness, delighting in the way the feathery surface of his shaft ripples out from your touch. The massive brute moans, leaning back against the junk pile, his hips bucking up slightly at your touch. You " + pc.mf("chuckle","giggle") + " at his sensitivity and decide to have some fun.");
	output("\n\nYour weight firmly planted on the base of his tail, you trace the tips of your fingers up and down his shaft, drawing out heavy groans and panting from the sydian. His sensitive little feathers make ripple patterns in the wake of your touch, and he tries to buck up against you, unable to move with your weight on the base of his tail. You cup his balls with your other hand, enthused by their heavy weight, giving them a warm squeeze. The rust monster shudders, and a trickle of silvery pre spills down from his cockhead, running down his throbbing length.");
	output("\n\nEncouraged, you continue tickling him, caressing his balls, until his pre becomes a steady, shimmering stream. Your tickling hand switches to smearing that cum over the length of his shaft, soaking him with his own juices.");
	output("\n\n<i>“Please... please... I need to-”</i> he begins, barely coherent.");
	output("\n\nYou cut him off with a quick puff of your cheeks, blowing out a cool jet of air over his wet cock. The air and wetness have the chilling effect you hoped for as his whole body quakes, nearly bucking you off. His cock twitches in your hands, a tiny spurt of pre arcing out to splash against your cheek.");
	output("\n\n<i>“Why are you... I can’t... So good...”</i> he pants, clearly unable to even string a sentence together.");
	output("\n\nYou continue massaging his balls, taking the time to run a finger through the pre on your cheek, sampling his warm, saltiness. At the same time, his quaking quiets, and his babbling dies down to quiet whimpers.");
	output("\n\nDeeming the cum acceptable, you smile at the Sydian. His eyes are unfocused and heavy lidded at this point - it’s unclear how much he can even make out. Dispensing with preamble, you ");
	if(pc.hasHair() && pc.hairLength >= 4) output("tuck your hair back behind your ears and ");
	output("duck your head down, taking his shiny tip in your mouth, sucking on it like a lollipop.");
	output("\n\nThe rust monster lets out a bestial groan as you swirl your tongue around his smooth cockhead. Pressing the tip of your tongue against his slit, you feel the pressure of his salty precum flowing into your mouth. You grin, gulping, listening to the Sydian’s moans of pleasure as you plunge your head down further, feeling the fluttering of the cock’s feathered surface against the inside of your mouth. You feel an answering tingle under your tongue as your mouth waters and you gulp reflexively, enjoying the wet mouthful.");
	output("\n\nYou bob your head playfully up and down the male’s member for several minutes, loving the way he writhes beneath you.");
	//Vagina:
	if(pc.hasVagina())
	{
		output(" In fact, you decide to use that writhing to your advantage, rubbing your [pc.vaginas] against the heavy chitin of his tail, riding the muscular limb until you let out a small, intensely satisfying orgasm across his bulky plates.");
	}
	//Penis:
	if(pc.hasCock())
	{
		output(" As he jerks up and down, you settle your penis down against his muscular tail, enjoying the slickness of his sweat against your ");
		if(pc.balls > 0) output("[pc.balls] and ");
		output("shaft. It doesn’t take long for you to cum - apparently you’re enjoying this as much as he is, and you leave a thick spray of [pc.cumNoun] across his heavy chitin.");
	}
	output(" His heavy fingers run ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your head");
	output(" as you nurse at his cock. It’s clear that he won’t last very long - not after all of your teasing.");

	output("\n\nYour prediction is correct, and as you give his balls a final squeeze, taking his length all of the way into your mouth, he cums, shooting several long jets directly down your throat, filling your gullet with heavy, hot seed. You draw back, lips still around his cockhead, tongue tickling his slit as you take the last jet directly in your mouth, warm and salty, and wonderfully thick.");
	output("\n\nYou remove your mouth from his cock, looking up at the panting brute, utterly collapsed and exhausted against the scrap heap. You climb up his muscular frame, body ");
	if(pc.biggestTitSize() >= 1) output("and breasts ");
	output("rubbing against his glistening, rippling muscles until you reach his face. You cup the sides of his face with your cum-slick fingers, turning it to you as you press your lips against his.");
	output("\n\nHis eyes struggle to open, and he lets out a muffled protest as your kiss forces his last load into his mouth. He would probably fight if he had any energy left. As it stands, he provides only a moment’s resistance before swallowing his own seed, delivered by your kiss, your tongue forcing it into his mouth, playing with his broad, thick tongue.");
	output("\n\nWhen you break the kiss, he whimpers briefly before his eyes close, and he passes out, snoring immediately. You grin, rising from your seat on the rust monster, swaying a bit as you shake off the quaking rhythm you’ve been riding for the past half hour. As you leave, you take one last look, nodding in satisfaction at the cum-smeared hulk snoring gently in the junk pile.\n\n");
	pc.changeLust(10+rand(10));
	pc.orgasm();
	pc.loadInMouth(enemy);
	processTime(20+rand(5));
	CombatManager.genericVictory();
}

public function lazySavinToes():String
{
	if(pc.legType == GLOBAL.TYPE_HUMAN) return "toes";
	else return pc.foot();
}

//Peg & Footjerb a Rustmonster With Your Cocktail
public function greatFootjerbSavin():void
{
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//Savin
	//+5 Classiness
	author("Savin");
	output("You step up over the defeated sydian, eyes wandering over his bare, muscular form. With a slight push from ");
	if(pc.legCount == 2) output("your [pc.foot]");
	else if(pc.legCount > 2) output("one of your many [pc.legs]");
	else output("the tip of your [pc.foot]");
	output(", you get him on his back and wedge his legs apart. He resists at first, but the prize between them betrays its master before he can say a word, a tent-pole of alien meat rising to prominence as your [pc.leg] spreads his apart. You playfully tsk your tongue as the alien’s shaft reveals itself as your [pc.foot] works up the inside of his thigh, sending a visible shudder up his powerful, yet prostrate body.");
	output("\n\n<i>“Oh, don’t tell me you get turned on by losing!”</i> You tease, [pc.foot] dancing up his leg until you brush against the swell of his sack, hooking yourself underneath it so that you can really feel the heft of his nuts, the heat of them. You chuckle to yourself as he looks pointedly away from you, cock bobbing in the air, all but drooling already. <i>“Or are you just so pent up that you don’t care how you get fucked? Must be hard finding a willing lay out here, huh?”</i>");
	output("\n\nHe mumbles something in response, shifting his surprisingly broad hips slightly. <i>“What was that?”</i> you grin, gripping your " + lazySavinToes() + " around his sack.");
	output("\n\n<i>“Just do what you’re gonna do,”</i> he grumbles, rising up to his elbows, his large eyes finally look up definitely at you, awaiting whatever sexual torment you’re intent on bringing down upon him. Poor thing’s convinced himself he’s not going to enjoy this. You shake your head in mock disappointment, scooting up towards your would-be attacker to give yourself some more room to work with, your [pc.leg] looming large over his exposed shaft. Slowly, you shift up from his heavy sack, feeling more than seeing as you make your way up the soft, tender skin of the alien man’s balls to the rigid hardness of his undercarriage. When you touch it, the rusty-hued man freezes up, body tensing as you touch the tenderest parts of him, slowly and sensually slipping up the underside of his sex, shivering yourself as your skin comes into contact with the legions of pulsating, writhing sicilia along his thick member’s haft.");
	output("\n\n<i>“Ugh. That feels... that feels...”</i>");
	output("\n\n<i>“Nice?”</i> you finish for him, ");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output("pinching his big, orange dick between your toes");
	else if(pc.legType == GLOBAL.TYPE_SNAKE) output("wrapping your tail around his oversized cock, heart fluttering as his many cilia writhe across your own tender flesh");
	else if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) output("wrapping his oversized cock up in amorphous tendrils");
	else output("pushing back against his rigidly hard orange rod with your [pc.leg]");
	output(".");

	output("\n\nHe hesitates a moment, but finally, his big, tough, masculine demeanor crumbles away to nothing. His rusty orange cheeks flush hotly as he admits, <i>“Yeah... nice...”</i>");

	output("\n\nYou grin, letting your [pc.foot] work up his shaft a little further, teasing his many tendrils before working your way up to the crown of his cock, rubbing in under the sensitive, throbbing glans. The sydian’s head lolls back, a powerful, guttural rumble of pleasure escaping his lips as you start to massage up and down his wiggling wang, putting just enough pressure on him to push it back against his flat, chiseled belly, giving you easy access to the sheer length of his rigid cock’s underside. A few minutes’ attention to it soon has the sydian groaning and gasping, fingers digging trenches through the loose topsoil as he tries to hold himself together as you pleasure him, seeming to have forgotten his loss to you, original intent vanishing into the haze of lust the monstrous man’s slowly slipping into.");
	output("\n\nIt’s like he’s forgotten this is just the intro.");
	output("\n\nWith his cock pressed up into his belly, there’s just one obstacle between you and returning the favor that was nearly inflicted on you. With a wiggle of your [pc.hips], you bring your [pc.tail] into the game, the cock-tipped member wriggling out around your [pc.leg] to taste the light. The rusty monster’s dark eyes dart down as your wriggling tail slithers closer, slipping between the cleft of his legs towards his rear end... and to your surprise, he lifts his ass for you, spreading ‘em wide.");
	output("\n\n<i>“Slut!”</i> you tease, cocktail giving him a slap on the thigh. <i>“I knew you’d come around.”</i>");
	output("\n\n<i>“Don’t - ah!”</i> he groans as your tail’s tip brushes against his heavy, swinging sack, <i>“Don’t make it weird.”</i>");
	output("\n\n<i>“Yeah, yeah,”</i> you chuckle, giving his member a little more pressure as yours roots its way under his cum-swollen nads, lifting them up and out of the way to get at the dark star of his ass.");

	output("\n\nHe gives a little gasp as your tail-borne prick brushes up against his butt, sliding through the cleavage between his cheeks to get him worked up a little. Between your cocktail’s teasing and the relentless pressure gliding across his tendrily manhood, the sydian’s back arches ever so slightly, his moans of pleasure quickening as your [pc.foot] moves faster. Better get on with it before he creams himself, or else you’ll be on sloppy seconds before you begin!");

	output("\n\nYou brace yourself for the hard push as your tailcock lines up with the sydian’s tailhole. You both grunt, teeth bared as you meet a fierce resistance from his ass. The sydian gives you an apologetic look, obviously trying to relax but not succeeding; you let slip a little sigh and bend down, slowly pushing your tail further in, the pressure just enough to slip through despite his sphincter clenching. Your partner gives a low growl as you force your way into him, fingers digging hard at the ground as his breath seems to catch on your penetration.");
	output("\n\nThe moment of breakthrough is pure ecstasy, both of you gasping and shuddering as your cock is enveloped in a world of tight, wringing muscles, clawing and squeezing at your prick. Your [pc.foot] trembles, squeezing the sydian’s dick in return which itself puts a new wave of pressure on your cock through his groin, making his muscles go wild with multiple sources of pleasure and sensation rippling through them. Oh, that’s nice. You let your tail-dick slither forward, his rectum now powerless to stop your advance as you spear him on more and more tailmeat.");

	output("\n\n<i>“Nice and tight,”</i> you coo, voice trembling under the intense, vicelike tightness around your tailcock.");
	output("\n\nThe rusty alien grins slightly around a grunt of pleasure. <i>“Should be. Not much, ah, goes back there...”</i>");
	output("\n\nOh-ho! You grin at his admission, letting your tail wriggle serpentine inside him, stimulating his every anal nerve as you start to shift your hips and pump your tail, bringing yourself almost out of his now-loosened pucker. Plunging back in, he lets out an endearingly shrill cry of pleasure, hips bucking, cock throbbing hard under your [pc.foot]’s tender ministrations. He’s getting close now, chest heaving, breath coming ragged as you fuck his hole and wrap your [pc.foot] around his wang, squeezing it and jerking it as best you can.");
	output("\n\nWith a final, bestial roar of pleasure, the sydian male cums. You gasp in surprise as a sudden flood of warmth smears across the ");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output("sole of your foot");
	else output("bottom of your [pc.foot]");
	output(", basting your [pc.skin] with a hot, creamy spurt of spunk. As he does so, his ass-muscles clamp down so hard around your tailcock that you can’t help but whine, your tail writhing as your cock is milked by the convulsing corridor of his ass. Your tail pounds into his hole, fucking the sydian’s tight little ass with growing speed as his orgasm dwindles, hoping to join him in his pleasure before it’s too late.");
	output("\n\nYou make it to the edge of climax just as the sydian man is collapsing back, panting heavily. With a final thrust and a gasp of pleasure, you feel your tentacle-like appendage swelling with seed before letting loose, spraying his colon with [pc.cum]. The alien grunts with approval, shuddering slightly as he feels himself filling with your hot seed. Your tail gives a few final thrusts, milking itself out of every drop it can splooge out before finally starting to go soft inside him, easily slipping out of his now-loose hole.");
	output("\n\n<i>“Not so bad, was it?”</i> you grin, patting the rusty-hued alien on his chitinous leg.");
	output("\n\n<i>“No. Not bad,”</i> he sighs, head reclining back into his hands as his own wiggling tool retracts into the sea of spooge on his belly. You gather your [pc.gear] back up and leave him there, basking in the afterglow to contemplate his new experience.\n\n");
	processTime(30+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Hungry Hungry Tailgina
public function hungryhungryTailginasThirst():void
{
	clearOutput();
	showName("DEFEATED:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//Well fed
	if(flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined || flags["DAYS_SINCE_FED_CUNT_TAIL"] < 7)
	{
		output("With a knowing glint in your eyes, you command your prehensile, vaginally-tipped tail");
		if(pc.tailCount > 1) output("s");
		output(" to sway around your body and into your hand");
		if(pc.tailCount > 1) output("s");
		if(pc.tailCount > 2) output(", as the excess spread around you an obscene, eager halo");
		output(". Your fingers slip inside the dusky, symbiotic genitalia to show the prone sydian just how wet and eager your body is");
		if(pc.hasParasiteTail())
		{
			output(", never mind the worry in the back of your mind that ");
			if(pc.tailCount == 1) output("it");
			else output("they");
			output(" might be ");
			if(pc.tailCount == 1) output("a parasite");
			else output("parasites");
		}
		output(". ");
		if(enemy.HP() < 1) output("His flagging erection stiffens in two rapid pulsations at the sight of such slick, promising depths, and an eager, almost too eager, smile crosses his face at the same time.");
		else output("His immensely tumescent length twitches back and forth at the sight, and an eager, almost too eager, smile crosses his features at the same time.");
	}
	//Hungry
	else
	{
		output("It’s all you can do to hold your [pc.tails] back while you advance, literally. You’re holding ");
		if(pc.tailCount == 1) output("it one-handed");
		else if(pc.tailCount == 2) output("them in each hand");
		else output("two in your hands");
		output(", stuffing them with your fingertips to temporarily sate their fuck-thirst ");
		if(pc.tailCount == 1) output("its");
		else output("their");
		output(" drooling entrance");
		if(pc.tailCount > 1) output("s");
		output(" while you look down at the prone sydian and ");
		if(enemy.HP() < 1) output("his rapidly stiffening member");
		else output("wonderfully throbbing, alien erection");
		output(". The sight of such a hard cock triggers a surge of pleasure from your [pc.tails]. You’re going to feed, and feeding makes you feel good.");
	}
	//Merge
	//Nice
	if(pc.isNice()) output("\n\n<i>“Sorry for the fight. I needed to make sure we could do this my way. Lie back now; I promise this is going to feel wonderful,”</i> you explain to your captive audience as you mount his chest, dropping your [pc.butt] down on his chitin-armored chest.");
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“I hope your dick has a little more vim and vigor than its owner. Surely you could’ve put up a better fight than that?”</i> you tease as you settle into position atop his chest. <i>“Lucky for you, I was in the mood for cum.”</i>");
	//Asshole
	else output("\n\n<i>“I don’t know why you even bothered to fight me. You never had a chance. All you had to do was kneel obediently, and you could’ve gotten to the good part so much quicker,”</i> you explain as you settle into place on his chest. You deliver a few teasing slaps upon his face to punctuate your points. <i>“Dumb slut.”</i>");
	//Merge
	output(" Your hands find their way to his armored pectorals and slide across the gleaming, almost-polished surface, admiring the masculine shape and the shine that’s so uncommon on this world.");
	if(pc.hasCock() || pc.hasVagina()) output(" A pleasant tingle runs through your [pc.crotch], earning a few pleasured twitches of your [pc.hips]. You still the errant motions to give your [pc.tails] maximum stability. No point in making it harder to hit your target after all.");
	output("\n\n<i>“I didn-”</i> the sydian starts in quiet protest.");
	output("\n\nHis words die when [pc.oneTailgina] whips over to his cilia-covered cock, brushing its lips against its head as if to taste it.");
	if(pc.tailCount == 2) output(" The second one comes in a second later, kissing and slurping against his side, sometimes bumping at the one on his head as if to push it aside.");
	else if(pc.tailCount > 2) output(" The others come in a second later, kissing and slurping all along his sides, sometimes bumping at the one on his crown as if to bump it aside.");
	output(" Any reply you might have summoned up is stifled by roiling waves of magma-hot pleasure that travel up your spine before breaking across the shoals of your consciousness. You moan like a wanton whore. You couldn’t suppress it if you tried. All you can do is try to keep yourself from shaking too much and try to enjoy it.");
	output("\n\nThe distracting bliss makes it difficult to focus on anything but the automatic motions of your posterior limb");
	if(pc.tailCount > 1) output("s as they worship");
	else output(" as it worships");
	output(" the lucky alien’s blood-swollen seed-dispenser. Unfortunately, the sydian has a tail of his own, and he brings it forward to caress the side of your neck and face. While it’s ultimately soft and pleasurable, it’s also coated in something that immediately wicks into your [pc.skinFurScales], leaving a pleasant heat in its wake that gathers in your [pc.tails] and loins. Your [pc.tailgina], perhaps encouraged by the chemical aphrodisiac, lunges downward to take him to the root, filling and stretching itself in a way that makes it difficult to control yourself, let alone maintain conscious thought.");
	output("\n\nThe rings of muscle that line your prehensile pussy go to work on the sydian while his vibrant phallus’ cilia swirl against them. He obviously did not expect such a strong, skillful milking, and his eyes roll back. His tongue drools from the corner of his mouth, and he begins making happy-sounding grunts accompanied by gentle, needy twitches of his hips.");
	output("\n\nOf course, nothing could prepare you for the sensory artillery his cilia turned out to be. If your nervous system is like a power grid, then everything behind your [pc.butt] is experiencing a power surge, sparking and trembling, too sizzlingly hot to handle. Your vision goes black when your eyes roll back, useless to the ecstasy-addicted mind controlling you, and your body sags down atop the supine sydian, [pc.chest] to hardened chest. Your head lolls ");
	if(pc.tallness > 90) output("above his");
	else if(pc.tallness >= 76) output("next to his");
	else if(pc.tallness >= 68) output("into the crook of his neck");
	else output("against his muscular body");
	output(" and drools. Your fingers twitch and claw futilely. The only part");
	if(pc.tailCount > 1) output("s");
	output(" of you under your control - the only part");
	if(pc.tailCount > 1) output("s");
	output(" you care to control - ");
	if(pc.tailCount > 1) output("are");
	else output("is");
	output(" your [pc.tails].");

	output("The two of you would look like embracing lovers from a distance. Up close, it’s clear that you’re both subsumed in pleasure, helplessly bound by each other’s sexual techniques and talents. Your ");
	if(pc.tailCount > 1) output("lucky ");
	output("tail undulates wildly through the air, sometimes appearing as an arch or a vague ‘M’ shape as it starts truly pumping, sliding up and down in addition to squeezing. Strands of lubricant squirt out around the edges of your [pc.tailgina] whenever it bottoms out. They roll down the alien’s abdomen and thighs, and though you’re not consciously aware of it, your scent is filling the air. No scent-sensing creature would doubt that this male belongs to you.");

	output("\n\nHe’s going to cum first. There’s no doubt. After all, your [pc.tailgina] has had millennia to evolve into the perfect sperm-predator for species across the galaxy. It’s true that many species have different methods of ejaculation, but enough signs of a messy climax are there: the increased heart-rate, a sudden increase in genital thickness, expression of pre-cum. You don’t think about this, of course. Your brain is far too busy trying not to black out from ecstasy to actually think, yet you still KNOW. The alien nervous system");
	if(pc.tailCount > 1) output("s");
	output(" conjoined to you ");
	if(pc.tailCount == 1) output("has");
	else output("have");
	output(" passed that information on. Doing its part, your body thrusts your tail down, smashing it practically flat against the sydian’s armored abdomen to prevent even a single drop of sperm from escaping.");

	output("\n\nThe " + enemy.skinTone + "-hued alien begins grunting softly, one after another; he’s cumming! You can feel the silvery spooge burst out of his over-engorged crown in thick lances, flooding your contracting cunt for the split-second before it’s devoured, pulled deep inside you for use as a genetic catalyst. It’s so warm too! You shudder and shake, finally climaxing");
	if(pc.hasCock()) output(", spewing [pc.cum] from your [pc.cocks] in rampant, unassisted orgasm");
	output(".");
	if(pc.tailCount > 1)
	{
		output(" Your other tail");
		if(pc.tailCount > 2) output("s spasm");
		else output(" spasms");
		output(" in midair before falling limp on your mate, oozing [pc.girlCum] from ");
		if(pc.tailCount == 2) output("its forgotten entrance");
		else output("their forgotten holes");
		output(".");
	}
	if(pc.hasVagina()) 
	{
		output(" [pc.GirlCum] ");
		if(pc.wetness(x) <= 1) output("oozes from");
		else if(pc.wetness(x) <= 2) output("leaks out from");
		else if(pc.wetness(x) <= 3) output("soaks");
		else if(pc.wetness(x) <= 4) output("squirts from");
		else output("geysers out of");
		output(" [pc.eachVagina] as ");
		if(pc.totalVaginas() == 1) output("it gives");
		else output("they give");
		output(" in to the rampant coruscating pleasure that’s jumping between your nerves like electricity from a live wire.");
	}
	output("\n\nYour moans grow louder rather than dying down, while the alien’s grunts fade into pleased sighs. Quiet slurps and sucks sound from your conjoined organs, drinking the last few drops from the alien’s powerful tool, its outline visible in stark relief through your tail’s contorting shape. He starts going limp before your [pc.tailgina] stops sucking, and when it does finally deign to pull off, his orange dick and bristles are slick with your [pc.girlCum]. Not a single droplet of his silvery spunk remains.");
	output("\n\nStaggering up panting, you stumble around drunkenly. That orgasm was more than powerful enough to count for two, and it’s a little hard to control your muscles in the wake of such an experience. You’ll have to make do. The wilds of Tarkus are no place to be unawares. Your now-slumbering foe is likely to find that out on his own.\n\n");
	processTime(35+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
	pc.loadInCuntTail(enemy);
}

public function loseToSydianMaleRouter():void
{
	var choices:Array = new Array();
	if(pc.hasVagina()) choices[choices.length] = pcVagoosGetPlowedOpenByRustBrosAfterAphrodisiacs;
	if(pc.hasCock()) choices[choices.length] = getPeggedToOrgasmByRustBro;
	choices[choices.length] = mouthfulOfPenniesByFrogalog;

	choices[rand(choices.length)]();
}


//Loss Scenes
//Choose whatever fits at random!
//Vaginas Get Plowed Wide-Open After Aphrodisiacs
public function pcVagoosGetPlowedOpenByRustBrosAfterAphrodisiacs():void
{
	showName("LOST VS:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	var x:int = rand(pc.totalVaginas());
	//HP
	if(pc.HP() < 1) 
	{
		output("Slipping to the ground, you cradle your aching side and look back at the sydian with defiant, proud eyes. The alien may have knocked the fight out of your body, but that doesn’t mean you’re going to just give in to him. He chuckles, unmoved by your rebellious looks, circling you with a patient yet hungry gaze.");
		if(pc.isNude()) output(" As he takes in your nude, vulnerable body, a look of approval overtakes his previous expression, and he circles in close, kneeling down beside you with a much gentler smile. <i>“Surely a creature like you, naked of the coverings most off-worlders wear, must have come out seeking to be used, yes?”</i> He does not wait for an answer.");
		else output(" As he takes in your covered shape, a look of disapproval overtakes his previous expression, and he circles in close, kneeling down beside you with a huff. <i>“This will not do.”</i> The sydian’s three-fingered hands latch onto your [pc.gear] a piece at a time, throwing your possessions aside. <i>“Surely you would have prepared yourself if you did not want this.”</i> He does not wait for a reply.");
		output("\n\nThe seven foot tall male’s tail curls to lay against your [pc.hip], letting you feel the soft antennae that radiate from its tip. They’re incredibly soft and coated in a viscous substance that feels warm on your skin. Shivering in disgust, you squirm away only to discover that the greasy secretion is already vanishing, but where it touched you, your skin is hot and flushed. What’s more, you’re starting to feel warm in other places too - places you didn’t think would be feeling this way around such a brutish, alien oaf.");
		output("\n\nYou gasp as the unnamed creature brings his tail against you once more, this time draping it over your [pc.belly], slicking it with a much thicker layer of his mysterious fluid. It feels... good, better than it has any reason to. You’re forced to bite your [pc.lip] to keep from crying out, and you struggle mightily to keep from rubbing the stuff all over. A whimper escapes you anyway, high pitched and keeping. Your captor smiles knowingly as his tail traces across your [pc.fullChest]. There’s no hiding the ");
		if(pc.wetness(x) <= 2) output("dew dutifully beading on your netherlips");
		else if(pc.wetness(x) <= 3) output("slick glossiness of your netherlips");
		else if(pc.wetness(x) <= 4) output("way your juiced-up netherlips are dribbling with need");
		else 
		{
			output("puddle spreading beneath you as your over-juiced puss");
			if(pc.totalVaginas() > 1) output("ies get");
			else output("y gets");
			output(" wet enough for a gangbang");
		}
		output(". Much as you’d like to protest... the idea of taking that big, thick cock is seeming more and more appealing.");
		
		output("\n\nYour heart pounds, your [pc.legOrLegs] quiver" + (pc.legCount == 1 ? "s" : "") + ", and the need grows unbidden until you realize just how badly you need to fuck - how deliriously urgent your need for a cock or a tongue has become. You’ll do anything to sate the burning desires welling through you, even mate with a mysterious alien you just met, anything to quell the fires in your loins.");
	}
	//Lust
	else
	{
		output("Sinking to the ground, you look up at the victorious alien with unbridled lust in your eyes, begging him to take you here and now, to use your sexually overwhelmed body for his own gratification and little else. He kneels next to you");
		//Nakkers
		if(pc.isNude()) output(" and smiles. His antennae-tipped tail runs along the side of your [pc.hip] and [pc.ass], caressing you with the odd appendage. In the process, he leaves behind a trail of some warm secretion. Ordinarily, you’d recoil at being exposed to a strange fluid, but aroused as you are, you want to be made into a hot, wet mess. Your [pc.skin] absorbs the mystery juice nearly as fast as he can spread it on, and as it vanishes, it leaves behind a tender, sensitive flush you can feel all the way down in your [pc.vaginas].");
		//Not nakkers
		else {
			output(" and sighs. First, his hands busy themselves with tearing away your [pc.gear], tossing your every possession into a pile on the ground behind you to reveal the real prize - you, the hapless damsel. You squirm and press yourself against him, but his hands are as firm as they are strong, holding you still until you are completely disrobed.");
			output("\n\nThen, his tail winds its way up to you. It brushes the side of your [pc.hip] innocently at first, and in its wake, it leaves behind a smear of some warm secretion. Too turned on for disgust, you revel in it, feeling your [pc.skin] absorb the mystery goo until nothing but a hot, urgent flush remains in its place. The alien slathers more on your [pc.belly] and [pc.fullChest], painting you with the stuff until you can feel the feverish pulsations of pleasure gathering in your [pc.vaginas].");
		}
		//Merge
		output(" You may have thought you were overwhelmingly horny before, but now you’re a wriggling bundle of pernicious, sexual ardor that would hock her soul for just a few strokes from a tongue or cock.");
	}
	//Merge it all together now!
	output("\n\nNeither of you says a word; the time for verbal communication has long passed. The alien simply picks you up and bends you over the side of an ancient transport, and you let him");
	if(pc.legCount > 1) output(", your [pc.legs] spreading of their wanton accord");
	output(". The brief, fluttering touches of his antennae are all the foreplay you’re going to get. His cock presses against your cheeks, thicker and harder than you remember it being earlier. The cilia covering it are flat at the moment. You can feel them clinging wetly to his length, unmoving but still giving him a unique texture.");
	output("\n\nThe sydian doesn’t ask for permission, and you don’t give it. He simply thrusts and takes while you yield before his might, spread bare to worship on the altar of his glorious orange cock, feeling it plunge deep into your folds as if belonged there. Rather than squeezing down to press his veins more firmly against your inner walls, you wind up feeling his cilia rise up against you, their tips feathery, like little brushes. They flit and flutter inside you whenever their owner bottoms out inside you, massaging starbursts of pleasure into your nerves, moving like one thousand little tongues.");
	//Cunt change!
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	output("\n\nHis squared, chitinous hips slap against your [pc.butt] with echo-birthing force, jolting you against an ancient deckplate");
	if(pc.biggestTitSize() >= 4 || pc.buttRating() > 10)
	{
		output(" and sending ripples through your ");
		if(pc.buttRating() > 10) output("[pc.butt]");
		else output("[pc.chest]");
	}
	output(". You hold on for dear life as he mercilessly ruts you. His tail, flicking back and forth, rises up between his legs to rub against your [pc.belly] once more, smearing more of his viscous, aphrodisiac goo across. You get hotter and hotter until your ");
	if(pc.legCount > 1) output("[pc.legs] give out");
	else output("[pc.leg] gives out]");
	output(" and leave the sydian to support you, something he does with aplomb.");
	output("\n\nBouncing on that glorious, lust-swollen cock, feeling it wring blissful wave after blissful wave from your squeezing nethers, you give up all pretenses of control and moan like a fuck-addled whore. You transfer every ecstatic twitch of your forceful mate’s cock into a cacophony of lurid vocalizations until it all blends together into a keening wail. The myriad sensations are too overwhelming for you to do anything but screech like a banshee while your eyes drift closed. You’re utterly focused on what’s happening in [pc.oneVagina]");
	if(pc.totalVaginas() == 2) output("; the other simply drips with need, unlucky enough to be neglected by this perfect, fuck-dispensing cock");
	else if(pc.totalVaginas() > 2) output("; the others simply drip with need, unlucky enough to be neglected by this perfect, fuck-dispensing cock");
	output(". Your eyelids drift closed, and your eyes themselves roll up.");
	output("\n\nYou’re awash in a sea of ass-slapping thrusts and insistent rubbing along every inch of your canal, so much so that you fail to notice when your lover abruptly stops thrusting. His cock swells inside you, and every one of his cilia goes into overdrive, thrashing, pressing, and rubbing your blissed-out nerves with raw, animal passion. A jet of bubbling warmth erupts deep ");
	if(pc.isPregnant(x)) output("against your closed cervix, spattering off it as it fills every nook and cranny of your interior with reproductive goo.");
	else output("into your cervix, some slipping through into your vulnerable womb while the rest fills every nook and cranny of your tunnel with reproductive goo.");
	output(" His hands rest on his shoulders as he pushes harder against you. You mewl, cumming to the feeling of being filled, shuddering as rivulets of silvery seed drip along your thigh.");
	output("\n\nAn indeterminate amount of time later, the male withdraws, discarding your well-fucked form onto the ground. Reflective, inhuman cum mixes with your [pc.girlCumColor] juices as it leaks out of you, and your [pc.vagina " + x + "] is left temporarily gaped in the shape of the sydian’s shaft. Exhausted by the trauma, your eyes drift closed.");
	output("\n\nWhen you come to, the male is gone");
	if(!pc.hasStatusEffect("Rusted Emitters")) 
	{
		output(", and your shield emitter is damaged.");
		applyRustBroStatus();
	}
	else output(", and your shield emitter is as damaged as it was before.");
	output(" You’ll have to go get it repaired at Novahome if you want your full shield capacity back.\n\n");
	pc.loadInCunt(enemy,x);
	processTime(35+rand(5));
	pc.orgasm();
	CombatManager.genericLoss();
}

public function applyRustBroStatus():void
{
	if(!pc.hasStatusEffect("Rusted Emitters")) pc.createStatusEffect("Rusted Emitters", 0, 0, 0, 0, false, "DefenseDown", "Your shield emitters have been damaged by sydian secretions, reducing your shield maximum by 25%. You’ll need to find someone in Novahome to repair them to get back to full strength.", false, 0);
}


//Dickwielders Get Pegged And Tailstroked Until They Cum
public function getPeggedToOrgasmByRustBro():void
{
	showName("LOST VS:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//By JimT & LukaD
	author("JimT & LukaD");
	//HP
	if(pc.HP() < 1) 
	{
		if(pc.hasKnees()) output("You fall to your [pc.knees]");
		else output("You sink down to the ground");
		output(", utterly bested by the tall, muscular sydian who now stands over you. You hear a rich laugh and feel the sensation of a three fingered hand brushing along your [pc.hip], teasing your [pc.skin].");
		output("\n\n<i>\”</i>Now aren’t you a tasty little morsel? And to the victor goes the spoils.”</i></i> His voice is rich and confident. His grip is incredibly strong as he squeezes you pointedly - he has every reason to sound cocky right now. The alien Adonis is far more powerful than you; you’re just lucky he sees you as his plaything. Or are you?");
		//Not Naked:
		if(!pc.isNude()) output("\n\nAs the seven foot tall male looks you over, it is clear he finds your coverings distasteful – possibly even offensive. To rectify this he begins to strip off your [pc.gear] piece by piece, tossing it aside until you are completely naked whether you want to be or not.");
	}
	//lust + clothed
	else if(!pc.isNude())
	{
		if(pc.hasKnees()) output("Falling on your [pc.knees] ");
		else output("Sinking down to the ground ");
		output(" you look at the victorious alien standing over you. Your [pc.gear] never felt so bothersome. There’s a part of you that just wants to take them off right now");
		if(pc.hasCock() || pc.hasVagina()) output(" and let your [pc.crotch] escape the searing heat that courses through your body");
		output(".");
		
		output("\n\nThe male sydian just shakes his head and pushes you on your back. He begins stripping off your [pc.gear] with practiced ease, and before you know you it, you’re completely naked and at his mercy. You’d be worried, but you’re just too horny to care. As long as he does something, <b>anything</b>, to rid you of this heat, you just don’t care.");
	}
	//Nekkid:
	else
	{
		output("Thankfully you’re already naked, so the cool air helps dissipate some of the searing heat coursing through you. Still you can’t help but feel attracted by this handsome hunk of a male standing before you.");
		output("\n\nThe victorious alien watches you with a grin. <i>“I see that you’re already prepared. That’s good,”</i> he remarks, approaching you.");
	}
	//Merge: 
	output("\n\nYou can feel the sydian reach down and begin to gently stroke [pc.oneCock], letting out a little chuckle. <i>“");
	if(!pc.hasVagina()) output("Mmm, it seems you are a male of your species. No matter - I promised I would claim my prize, and claim it I shall.");
	else output("You are the male and female of your species? How interesting! There are so many ways to claim my prize.");
	output(" But first, you are going to need a little bit of preparation, I think.”</i>");
	output("\n\nSuddenly, his long tail curls around your [pc.hip], and you can feel the soft antennae brushing against your [pc.ass]. You try to wiggle away in vain as a a gooey, viscous substance is being smeared all over your buttcheeks, though for what purpose you do not know. His tail also slips between your [pc.thighs] and slathers [pc.eachCock] with the sticky liquid. Whatever he’s doing, you’re sure the handsome sydian has something sexual in mind.");

	output("\n\nAs an exquisite heat travels up from your saturated loins, you realize the sticky solution is an aphrodisiac. Suddenly [pc.oneCock] feels incredibly hypersensitive; your [pc.legOrLegs] quiver");
	if(pc.legCount == 1) output("s");
	output(" as he grabs your tool in one of his powerful hands and begins to gently stroke it.");

	output("\n\nThe sensation of his fingers rubbing along your [pc.sheath] feels just as exquisite as the act of sex itself, your [pc.cockHead] bubbling pre-cum as you let out a whimpering moan. As the male sydian begins to stroke faster, you bite your lower lip, and suddenly you’re letting out an uninhibited cry of delight.");
	if(pc.cumQ() < 25) output(" Tiny trickles of [pc.cum] dribble from your tip, as you convulse in his manly grip.");
	else if(pc.cumQ() < 250) output("You shoot ropes of your [pc.cum] all over the ground, convulsing all the while in his manly grip.");
	else output("Your [pc.cumNoun] bursts out in huge, thick ropes all over the ground, creating a gigantic [pc.cumColor] pool. You convulse and throb wildly as he milks your cock for every last drop.");
	pc.orgasm();
	output("\n\n<i>“Oh, a little premature aren’t we? The fun has yet to begin, my prey.”</i> The hunky sydian presses up against your bare flesh, his chitinous pectorals rubbing against your body. His other hand slips around and grabs your now sensitive rump and gives it a tight squeeze. You jump with pleasure and your [pc.cock] flexes in his tight grip, shamefully spurting a little more of your [pc.cumNoun] on the ground. <i>“You’re so fun to play with! I could do this all day.”</i>");

	output("\n\nDespite this claim, he is soon pushing your head down and forcing you to present your [pc.ass] to him, slapping your bare buttocks with a strong open handed slap. You can feel a stinging sensation traveling through your rump along with electrifying pleasure that causes [pc.eachCock] to tingle and jerk against your [pc.belly]. You almost cum again from the pleasure, your [pc.cock] already coated and dripping with your sticky [pc.cumColor] seed.");

	output("\n\nYou can feel your buttocks being parted and his tail smearing his druggy secretions all around and inside your [pc.asshole]. If you came just from him touching your cock, how are you going to survive a pounding from behind? The idea makes you shiver with delight as you present your bare bum to him, your [pc.legOrLegs] quivering with barely contained anticipation.");
	output("\n\n<i>“Beg for my manhood, offworlder, or else I’ll keep toying with you until you go insane with lust.”</i> The male sydian teases you as his prehensile tail wraps around your [pc.cock], smearing it even more with his secretions as his feathery antennae tease your tip. The pleasure you’re feeling is so intense that it is almost agonizing, all you can do is let out short desperate gasps as your sensitive [pc.cockHead] is exquisitely toyed with.");
	output("\n\n<i>“Please, I’m begging you, fuck my [pc.ass] and fill me to the hilt with your cock!”</i> You discard whatever shame you have as you bitch yourself out to the mysterious alien man; you’d do anything to sate the burning desires coursing through your body at this point.");
	output("\n\n<i>“As you wish, my mate.”</i> You swear you hear the seven foot male sydian chuckle triumphantly as he presses the head of his alien tool against your back door. It’s a good thing you’re well lubricated by his juices as he plunges his glorious orange cock right into your [pc.asshole], claiming it for himself.");
	// Check buttginity.
	pc.buttChange(enemy.cockVolume(0),true,true,false);
	output("\n\nShockwaves of ecstasy course through your body and you shoot your load just from his insertion, spurting ");
	if(pc.cumQ() >= 10) output("your [pc.cum]");
	else output("tiny dribbles of [pc.cum]");
	output(" as he buries his raging manhood deep within your rear tunnel. You begin to drool and moan as the thousands of feathery cilia along the length of his cock brush along your inner walls. They flit and flutter inside of you, massaging starbursts of pleasure into your nerves, moving like one thousand little tongues.");
	pc.orgasm();
	output("\n\nAs the powerful male syndian begins to mercilessly rut you, you can feel him secreting even more of his aphrodisiac inside your fuck chasm. As he pistons back and forth his brush like cilia rub it into your inner walls, causing your innards to become even more sensitive.");
	output("\n\nAs the male sydian pushes up against your prostate, you scream with pleasure and climax for the third time in a row. Your eyes roll back, your tongue lolls out, and you simply moan like a fuck-addled whore. You’re so into it that you don’t even realize your ");
	if(pc.legCount > 1) output("[pc.legs] have given out");
	else output("[pc.leg] gave out]");
	output(", and you are being held up by the muscular sydian as he pounds your pucker from behind.");

	output("\n\nHis tail is wrapped around your [pc.cock] and milking it madly as you coat it in your [pc.cumColor] [pc.cum], blowing ");
	if(pc.cumQ() < 10) output("tiny ");
	output("load after load onto his feathery feelers. You’re in such a state of euphoric, ass-slapping and cock-jerking bliss that you fail to notice when he grabs your waist and thrusts against you right to the hilt. His cock swells deep inside of your slick bowels, and every one of his cilia goes into overdrive, thrashing, pressing, and rubbing your blissed-out nerves with raw, animal passion.");
	pc.orgasm();
	output("\n\nThis time you both climax at the same time as your rear passage is splattered and filled with his slick hot alien cum, jets of bubbling warmth spraying deep inside of you. You let out a whimpering sigh as your [pc.ass] is filled to the brink with his boiling seed, his powerful hands grabbing your waist as he makes sure every last drop shoots into the very depths of your rump.");
	pc.orgasm();
	output("\n\nYou instinctively milk his glorious alien cock with your ass for every last drop. Meanwhile he returns the favor, stroking the very last of your [pc.cum] from [pc.oneCock] with his prehensile appendage.");
	output("\n\nAs a finale, the muscular alien man forces you to lick your own ejaculate from the tip of his tail, smearing your [pc.cumColor] [pc.cumNoun] all over your lips. You’re in such a drug-addled haze that you obediently lap it all up. An indeterminate amount of time later, the male withdraws, discarding your well-fucked form onto the ground. Reflective, inhuman cum leaks out of your backside as your [pc.asshole " + x + "] is left temporarily gaped in the shape of the sydian’s shaft. Exhausted by the trauma, your eyes drift closed.");
	output("\n\nWhen you come to, the male is gone");
	if(!pc.hasStatusEffect("Rusted Emitters"))
	{
		applyRustBroStatus();
		output(", and your shield emitter is damaged.");
	}
	else output(", and your shield emitter is as damaged as it was before.");
	output(" You’ll have to go get it repaired at Novahome if you want your full shield capacity back.\n\n");
	pc.loadInAss(enemy);
	processTime(90+rand(10));
	// Five PC orgasms, one orgasm in the PC's ass by the Male Sydian.
	pc.orgasm();
	CombatManager.genericLoss();
}

//Mouthful of Pennies (Male loss, Blowjob for the Rust Monster)
public function mouthfulOfPenniesByFrogalog():void
{
	showName("LOST VS:\nSYDIAN MALE");
	showBust("SYDIAN_MALE");
	//frogapus
	author("Frogapus");
	output("As you collapse at the feet of the burly rust monster, he chuckles and bends down, grabbing you by your [pc.gear]. He strides towards a nearby junk pile, dragging you along the ground before dropping you at his feet. He plops down backward atop the scrap, the metal hissing and corroding slowly into a throne-like depression for the monster man.");
	output("\n\nHe spreads his legs wide and grins. Slowly, his thick cock swells, rising up an inch from your face. The feathery plumes covering his brassy meat flutter out as he stiffens. Watching your expression intently, he chuckles once more. <i>“I think you know what to do.”</i>");
	output("\n\nYou groan, pushing yourself up");
	if(pc.hasKnees()) output(" to your [pc.knees]");
	//lust loss:
	if(pc.lust() >= pc.lustMax()) output(", already panting for a mouthful of whatever thick cum he has to offer");
	else output(", unsure if you have the strength to do this");
	output(". The Rust Monster smirks, flexing his groin, slapping his meat across your cheek, smearing a stretch of precum across your lips. His tiny feathers tickle your lips, leaving them flushed and tingling, and you reflexively lick them, his seed hot and salty.");
	output("\n\nYour cheeks flush, growing warm, but you’re unsure if that’s the effect of his seed or his fuzzy shaft. The same warmth that builds flushes across your lips suddenly heats up under your tongue, as your mouth begins to water uncontrollably. It gets harder and harder to think clearly. All you know is that you’re suddenly drooling, saliva spilling down your [pc.lips], and all you can think about is getting more of that warm, alien goo.");
	output("\n\nYou lean in, grasping the base of his cock with your hands as you drag your [pc.tongue] across the bright orange head of his dick. With every lick, more of his pre spills out, and your greedy mouth can’t help but slurp it up. It’s harder and harder to control your mouth’s eager slobbering, as every lick brushes his feathers over your tongue and [pc.lips]. You drool heavily down his shaft as your drape your tongue in long, wet laps up from the base of his cock up to the tip. You suck noisily each time you reach his smooth, wide head, but can’t seem to swallow enough.");
	output("\n\nLuckily, the Sydian is more than willing to help you. His strong hands push down on the back of your head, guiding your whole mouth down over his cock, and you gurgle your gratitude, your head spinning from the tingling touch of his dick. You gulp and moan, your head sliding down onto his shaft, his salty, metallic pre splashing against the back of your throat.");
	output("\n\n<i>“Wow,”</i> you hear him murmur overhead. <i>“I might just decide to keep you, offworlder.”</i>");
	output("\n\nYou burble your appreciation around his cock, realizing that the touch of his equipment barely bothers the back of your throat. Dizzy from his touch, you thrust him further into your mouth, your whole mouth engulfing his shaft, his head slipping down the back of your throat. You drag your head back, drooling messily down his entire length, then gobble him back down. You push both of your hands against his muscular thighs, spreading him wider and clearing more space for your head to bob up and down. You’re barely aware of your gag reflex, feeling like you could do this all day. Come to think of it, that doesn’t actually sound too unpleasant.");
	output("\n\n<i>“Oh yeah, that’s it...”</i> groans the Rust Monster. You feel his hand disappear and hear the metal creak. You look up at him, locking eyes as he leans back in his throne. <i>“Just like that, cocksucker,”</i> he rumbles approvingly.");
	//[Realizing that this might work for male and female pcs. This would be the section to throw in something about the PC’s physical response. 
	if(pc.hasCock()) output(" Your own cock is rock hard, twitching painfully, but you can’t think of pleasuring any cock other than the magnificent specimen in your mouth.");
	else if(pc.hasVagina()) output(" You’re clearly wet, if the warmth down your thighs and small puddle around your knees are any indicator, but you’re having trouble thinking about anything other than the monstrous cock in your mouth.");
	output(" You’re not entirely sure how long you");
	if(pc.hasKnees()) output(" kneel");
	else output("’re");
	output(" there, servicing the Sydian. With your head spinning, you can’t focus on anything but working that meat, and how right it feels to have it pumping in and out of your dripping mouth. Finally though, you feel the thick cock begin to twitch between your lips, and you double your efforts, panting like an animal in heat as you pump your head up and down on the burly humanoid’s dick.");
	output("\n\nFinally, he’s there. His thick fingers grasp the back of your head and shove you down as he shoots a massive load straight down your throat. You gurgle for breath, but it’s only secondary to the satisfaction of finally pleasing him. His cock throbs, filling your entire mouth, making your jaw ache, but all you can feel is the dizzying satisfaction of his hot, thick seed pouring down your gullet and filling your belly.");
	output("\n\nHe tilts your head back, making sure you watch his face as he finishes cumming. Your cheeks flush even more as he smiles approvingly at you. <i>“Good job, slut,”</i> he mutters with a grin. You feel a warm tingle up your spine at his words. <i>“Now, I’m going to take a little nap, and you’re going to clean up while I get some shut-eye.”</i>");

	output("\n\nHe pats your head once, then leans back in his scrap-pile, beginning to snore almost immediately. Still woozy from the experience, you begin to obediently slurp at his absolutely soaked cock. With the sydian asleep, you have time to recover from the mind-bending ordeal his cock instigated. It’s not until you’ve nearly finished licking his cock clean that your head completely clears, and you realize that you should probably go.");
	output("\n\nAs you gather your things and sneak away, you spy one of the Sydian’s eyes open, watching your clumsy escape. He snorts, but doesn’t seem interested in stopping you.");
	pc.changeLust(40+rand(10));
	output("\n\n");
	pc.loadInMouth(enemy);
	processTime(40+rand(10));
	CombatManager.genericLoss();
}
