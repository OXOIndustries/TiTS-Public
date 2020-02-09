//Lusty Korgonne Male
//by William
//Random one-off pupper in Siege of Korg’ii Hold. Got hit with lust darts. Help him get over it.

//Appearance: A 5’3 korgonne male with an impish handsomeness to his face. Somewhat thick, shoulder-length braid of white hair going down his back, with a single savicite ornament holding it together. Very masculine, and has good physique; could be a long-serving hunter or crafter. He has an attractively humble visage. Fluffy, tawny fur, lighter at the front and more hairy on the arms and legs. Big pettable ears. Ten inch canine cock dark blue in color, big knot, single large-huge ball.

public function showDosedKorgMale():void
{
	showName("MALE\nKORGONNE");
	//showBust("DOSED_KORGONNE_MALE");
	showBust("KORGONNE_MALE_WHITE_NUDE");
}

public function dosedKorgiMaleEncounter():void
{
	showDosedKorgMale();
	author("William");
	output("\n\nOff to the side, you spot a korgonne male knelt down, clutching his stomach... <i>crotch</i> in fact. Beside him lies an unconscious invader. His clenching breaths and guttural groans intensify the longer you look on, finally spotting the other hand nursing a painful erection hidden behind his clothes. When you take another step forward, his pointy ears shoot up and he stares coldly at you. Since you’re not a milodan, it thaws into desperate need.");
	output("\n\n<i>“P-please,”</i> he husks, ears folding anxiously over his head. <i>“Help,”</i> he says, shuffling forward. <i>“Help!”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Help",helpOutDosedMaleKorg,undefined,"Help","The poor pup’s all fired up and too shy to show it. You can think of a few ways to help him get over it.");

	addButton(1,"Don’t Help",dontHelpThatKorgo,undefined,"Don’t Help","You can’t get caught up fucking at random in a pitched battle!");
}

//[Don’t Help]
// Tooltip: You can’t get caught up fucking at random in a pitched battle!
public function dontHelpThatKorgo():void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	output("He’ll have to help himself right now. The only immediate danger he’s in is of the critical nut kind. The korg’s needy groans fade into the background as you move on.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Help]
// Tooltip: The poor pup’s all fired up and too shy to show it. You can think of a few ways to help him get over it.
public function helpOutDosedMaleKorg():void
{
	clearOutput();
	showDosedKorgMale();
	if(!pc.hasStatusEffect("MDruggedKorgTimer"))
	{
		pc.createStatusEffect("MDruggedKorgTimer");
		pc.setStatusMinutes("MDruggedKorgTimer",75);
	}
	author("William");
	output("On your approach, the somewhat slender korg pulls his hands away. There’s a tapered tentpole pitched at the center of his outstretched loinwear, marked by a wet spot of precum. His bound dick is ripping out the stitches holding the leather.");
	output("\n\nHe shifts to his knees and stares up defeated, whatever pride he may’ve possessed lost in a haze of unnatural desire. The handsome pup is unwounded, save for the dart sticking out of his shoulder. His heady scent permeates the air, tickling your nostrils on its search for partners. <i>“" + (!korgiTranslate() ? "Fangcat’s dirty fighting. Can’t ignore strange, strong heat. Share with?":"The milodan fight dirty, all of them. I can’t ignore this heat... will you share it with me?") + "”</i> he asks almost too quietly.");
	output("\n\nLeaning down, you swipe the dart from the chiseled canine’s shoulder, figuring the best way to handle a gruff horn-dog is...");
	processTime(4);
	//[Oral] [Frot & Fuck] [Get Fucked]
	clearMenu();
	if(pc.isTaur()) 
	{
		addDisabledButton(0,"Get Sucked","Get Sucked","Sadly this scene was not written with support for this body type in mind.");
		addDisabledButton(1,"Get Licked","Get Licked","Sadly this scene was not written with support for this body type in mind.");
	}
	else
	{
		if(pc.hasCock()) addButton(0,"Get Sucked",getOralFromDoggo,true,"Get Sucked","Put his mouth to work.");
		else addDisabledButton(0,"Get Sucked","Get Sucked","You should probably have a penis for this.");
		if(pc.hasVagina()) addButton(1,"Get Licked",getOralFromDoggo,undefined,"Get Licked","Put his mouth to work.");
		else addDisabledButton(1,"Get Licked","Get Licked","You should probably have a penis for this.");
	}
	if(pc.hasCock()) addButton(2,"Frot&Fuck",frotAndFuck,undefined,"Frot & Fuck","Rub dicks with the helpless hound. Maybe pound his butt while you’re at it.");
	else addDisabledButton(2,"Frot&Fuck","Frot & Fuck","You need a dick for this.");
	addButton(3,"Get Fucked",vaginaRouter,[getFuckedByKorgo,150,1,0,false],"Get Fucked","He’s pent up and needs a place to put all that cum. Why not in you?");
}

//[Oral]
// Tooltip: Put his mouth to work.
// Tooltip, taur: You need to be bipedal for this.
// Tooltip, neuter: You need genitals for this. Sorry, a butthole isn’t a genital.
// Requires genitals. No taurs or neuters.
// Herms can choose between Dick and Vag. Cock will need to fit. No hyper.
// Leads to [Deepthroat/Stay] or [69] (supports both); If PC is using dick, then the option is [Deepthroat], if PC is using vag, then it is [Stay].
public function getOralFromDoggo(useCock:Boolean = false):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	output("<i>“Sure,”</i> you start" + (!pc.isCrotchExposed() ? ", pulling down your equipment":"") + ". He’s immediately enthralled by ");
	if(pc.isHerm()) output("your [pc.cocks] and [pc.vaginas]");
	else if(pc.hasVagina()) output("your [pc.vaginas]");
	else output("your [pc.cocks]");
	output(", to the point his tongue falls from his mouth in surprise reverence. It’s only when you ");
	if(useCock) output("point to [pc.oneCock]");
	else output((pc.balls > 0 ? "heft your [pc.sack] and ":"") + "point to [pc.onePussy]");
	output(" that he’s shaken from his reverie, understanding his role. You open your mouth to speak " + (pc.legCount > 1 ? "while using your [pc.foot] to slide his loincloth away":"while gesturing for him to remove his loincloth") + ".");
	// Bimbo
	if(pc.isBimbo()) output("\n\n<i>“" + (useCock ? "Sucking cock’s great! Just thinking about it makes me wanna cum already!":"Don’t worry, the water’s nice and warm. It’s a tasty pussy, after all; you’ll be jizzing all over me in no time!") + "”</i> you sing, rubbing a finger " + (useCock ? "across [pc.eachCockHead]":"through your sopping [pc.vaginaColor] slit") + ".");
	// Bro
	else if(pc.isBro()) output("\n\n<i>“‘Share heat’, then. With your mouth,”</i> you say bluntly, tapping your [pc.thigh] expectantly.");
	// Kind
	else if(pc.isNice()) output("\n\n<i>“Better make it quick, before someone else finds us. Right now, I’m only interested in sharing with you.”</i> You wink cutely, " + (useCock ? "patting your [pc.cockNoun]":"drumming your [pc.clit]") + ".");
	// Misch
	else if(pc.isMischievous()) output("\n\n<i>“Help me, help you.”</i> You wink, running a [pc.hand] across " + (useCock ? "your thrumming [pc.cockType] shaft":"your soaking [pc.pussyNoun]") + ".");
	// Hard
	else output("\n\n<i>“Better work fast, unless you want to stay like that all day,”</i> you say" + (useCock ? ", poking his cheek with [pc.oneCock]":", pushing his face closer to [pc.onePussy]") + ".");
	var x:int = -1;
	if(useCock) 
	{
		x = pc.cockThatFits(700);
		if(x < 0) x = pc.smallestCockIndex();
	}
	else x = rand(pc.totalVaginas());
	// Merge
	// PC using Cock
	if(useCock)
	{
		output("\n\nHis green eyes cross when you inch closer, resting your [pc.cockHead " + x + "] on his nose. The bashful korg inhales loudly, and with enough force that your [pc.cockNoun " + x + "] throbs out another ");
		if(pc.cumQ() < 15) output("trickle");
		else if(pc.cumQ() < 50) output("bead");
		else if(pc.cumQ() < 500) output("wad");
		else output("squirt");
		output(" of pre he hungrily catches. Now he’s salivating and heaving. Brown-furred pecs press like bellows while you plant the crown on his tongue. You let him suck you in, " + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED) ? "peeling your foreskin back slowly, ":"") + "establishing a connection that tickles all your dominant feathers.");
		output("\n\nMoaning with him, you place your [pc.hand] on his head, rubbing behind his ears. His large paws end up around your [pc.thighs]. He hugs you tight, pulling you closer to his throat in a sensually slow series of movements that have you seeing lewd colors in the back of your eyelids. His tail is wagging to a happy blur" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " just like yours":" now") + ". <i>“Good,”</i> you say, caressing his forceful, hollowing cheeks.");
		output("\n\nSinking lower, his tug on your [pc.cock " + x + "] is exquisitely pressurable, forcing you to groan at the lumbering, changing direction of your ");
		if(pc.cockVolume(x) < 50) output("schlong");
		else output("mast");
		output(". ");
		if(pc.cockVolume(x) < 450) output("It’s small enough that he can comfortably handle it, often bringing you fully into his accepting maw.");
		else output("It’s too big for him to reasonably swallow down, and there’s always more unshined flesh steaming just outside the comfort of his lips.");
		output(" Soft hews of halting arousal have you arching back and lining more of his sensuous throat with beefy [pc.cockNoun " + x + "]. His hands rub down your waist towards your ");
		if(pc.hasCocks()) output("extra prick" + (pc.cockTotal() > 2 ? "s":"") + ", tugging firmly to the tip" + (pc.cockTotal() > 2 ? "s":"") + " and down to the [pc.base " + x + "]" + (pc.cockTotal() > 2 ? "s":""));
		else output("[pc.base " + x + "], lavishing your [pc.skinFurScales] with adoration");
		output(". ");
		if(pc.hasSheath(x)) output("One of his fingers slips into the sensitive space between cock and sheath, and you’re riding on maddening twinges of pleasure towards the orgasmic line while the horny hound wiggles in and out of your prick-protector.");
		if(pc.hasKnot(x)) output(" He grips your swollen knot lovingly, squeezing it as if he would his own" + (CodexManager.entryViewed("Korgonne") ? " - innately expecting you to spurt inside him, much like the males of his kind":"") + ".");
		output("\n\nThe hyperventilating pup jerks his head left and right, bulging his lubed cheeks with the [pc.cockHead " + x + "], dragging your burgeoning tool through the salivating locale. No doubt you’ve rinsed his palate enough that if you blindfolded him and gave him a taste test, he’d be able to identify your cock without error. He’s molding himself to your [pc.cockType " + x + "] shape with taciturn tugs and pleasure-spiking licks to your glans. It won’t be long before this korgonne is your penile scabbard.");
		output("\n\nWhen you deign to start thrusting, you’re not surprised that he gags. Being a gracious partner, he tightens his grip, shuts his teary eyes, and makes an earnest effort to suppress his reflex. Shined inches disappear into his maw" + (pc.cockVolume(x) >= 500 ? ", bulging his neck outwards with the shape of your [pc.cockHead " + x + "]":"") + ". Gradually his pains disappear, replaced with audible slobberings. Satisfied for the moment, you let him work your pole at his own pace.");
		output("\n\n<i>“Not bad,”</i> you moan out, <i>“...wonder how many times you’ve had to do this. Or are you just that desperate?”</i>");
		output("\n\nMoistened lips slide up and down your " + (pc.isHerm() ? "herm-":"") + "meat, depressing the lust-bloated veins as they go. His tongue coils around every inch that vanishes into his muzzle, flexing on the tenderest spots. At one point he withdraws entirely, laying his tongue out flat before guiding your [pc.cockNoun " + x + "] back in: his muscle undulates like a whirlpool, and the extremeness of the act is undefinable. He massages your urethra into greater wideness, rewarding himself with the succor of [pc.cumFlavor] dick-drool.");
		// PC Suula or Aphrodisiac Cock
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe alien tendrils lining your [pc.cockNoun " + x + "], tired of being withheld, lash out at the masculine pup’s mouth, shooting potent, weaponized loads of lust-venom into his bloodstream. Hopefully he doesn’t mind that you’re the one doing it this time. If he protests, you can just remind him this is how outsiders share heat!");
		// Merge
		output("\n\nThrobbing in anxious need, your [pc.cocks] take" + (!pc.hasCocks() ? "s":"") + " over, lurching you into a small thrust that meets his inward stroke. There’s a delightful <i>’thud’</i> against your groin where his nose crashes into your abdomen");
		if(pc.balls > 0)
		{
			output(" and your ");
			if(pc.balls == 1) output("single ball bounces off");
			else output("balls clap lewdly against");
			output(" his chin");
		}
		output(". You move a little faster, tightening your grip on his head and placing one [pc.hand] on your waist, settling into a joyous, euphoric pace.");
		output("\n\nIt strikes you that a proud korg such as himself may be degraded by this act, but neither of you can deny how ultimately pleasurable it is." + (pc.isBimbo() && pc.isTreated() ? " There really is nothing better than sucking dick!":""));
		// Herm
		if(pc.isHerm())
		{
			output("\n\nGently gripping his paw, you guide the brawny, tawny pup’s fingers to [pc.oneVagina], swirling his finger around your [pc.clit]. With a new goal lodged in his addled mind, he rubs small, blissful circles around your erecting bud, rocking your world and [pc.legOrLegs] with clitoral stimulation that grows alongside your button’s emergence. He flicks it back and forth like a switch, making you juke in the direction of his needle-tipped finger. When you become too unsteady, he props you up by slotting himself to the knuckle in your [pc.pussy], softly rubbing against your silken walls.");
		}
		// Merge
		output("\n\nIt’s inevitable you fall forward, lancing his throat with more prick than he could reasonably handle. He gurgles around your member");
		if(pc.hasCocks()) output((pc.cockTotal() > 2 ? ", the others":", the other") + " slapping cummy-pre and sweat against his brow-fur");
		output(". Water leaks from the corners of his eyes, but you know that this is what he wants. He makes no attempt to reverse direction - in fact, he’s seeing to himself now, jacking and squeezing his doggie-dong.");

		if(CodexManager.entryViewed("Korgonne")) output(" The knot is comically inflated, possessing an abnormal girth that shames the width of his dick. No wonder he doesn’t care he’s sucking dick: if you were so pent-up that your knot had to function as a backup nut, you wouldn’t be so choosy either.");
		// Balls
		if(pc.balls > 0)
		{
			output("\n\nAfter staining his own hands in korgi cock-slime, he reaches for your [pc.balls], slathering " + (pc.balls == 1 ? "it":"them") + " in his own mixture. Your ");
			if(pc.hasScales()) output("scaly");
			else if(pc.hasFur()) output("fuzzy");
			else if(pc.isGoo()) output("gooey");
			else output(num2Text(pc.balls));
			output(", trembling sack pulses warmly in his palms, heating up the more he rubs into your spunk-tank" + (pc.balls == 1 ? "s":"") + ". Pleasant squeezes and tender jostlings help brew the fattest load possible, one that, at this point, may put some of your expulsions to shame.");
			output("\n\nSo, sensibly, you step over him a little more until he can reach every inch of your quaking nut" + (pc.balls > 1 ? "s":"") + ". Sumptuous ballflesh shined by pre glistens in the light, and he doesn’t forget his manners with a mouthful of [pc.cockNounSimple " + x + "]. You’re not just his partner, nor his saviour, <i>you’re his provider.</i> Already you feel heavier - you feel the flow of [pc.cumVisc] spooge thickening. Your testicular core tightens, reacting to the strong efforts of its worshiper. Now... you can’t wait to show him what a good boy he is.");
		}
		// Merge
		output("\n\nPre-cum flowing, he’s done a great job so far... but you find yourself needing more than he’s capable of giving. The korg-man slumps, pumping his puppy-prick, wagging his tail and spreading more musk through the area. Once-faint whines are now keening cries - he <i>needs to cum.</i> There’s no bodily function more important to him now... but it’s up to you to decide how to finish. A change in position could be good now, seeing as he can’t keep himself upright anymore.");
	}
	// PC using Vagina
	else
	{
		output("\n\nThe tawny pup’s green eyes cross this close to your " + (pc.isHerm() ? "hermaphroditic equipment":"sublime, juice-glistening [pc.pussyNoun " + x + "]") + ". He scoots closer, tail wagging even faster" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " alongside your own":"") + ", anticipation growing to record levels. His mouth slowly opens while he ogles your ");
		if(pc.vaginas[x].wetness() < 2) output("slightly glazed");
		else if(pc.vaginas[x].wetness() < 5) output("beautifully soaked");
		else output("wonderfully drenched");
		output(" slit, admiring its gentle curves and shimmery lips.");
		if(pc.vaginalPuffiness(x) >= 1) output(" The fat, rubbery folds of your cunt dominate him with winking sparkles along their tempting ridges.");
		output("\n\n<i>“Go ahead, big boy!”</i> you simper, ruffling the white hair on his head. <i>“All for you, go for it!”</i> His muzzle shoots open as wide as his jaw will allow, and he devours [pc.onePussy] almost. His wide, flat tongue bowls over your bare twat, hungrily slurping up all the caked-on girly juice. Hissing nasal breaths tickle your mons and make you squeak; make you hope your [pc.girlCumFlavor] girlmusk will stoke his ardor before long.");
		output("\n\nFaint groans and lewd-sounding kisses from below " + (pc.balls > 0 ? "your brow-mounted ballsack ":"") + "make it clear the addled korg-man appreciates his place below you. Heavy airs wash over your exterior, rabid need building inside him. His neck bobs back and forth, only as much as your grip will allow, and he licks left, right, left, right, lashing your gash from north to south. Desperate licks part your cuntlips for the first time, and thanks to his desire for sweaty, supple pussy, you begin to share in his wild need. Praise for his cunnilingual expertise flows from your mouth in babbles incoherent.");
		output("\n\nWhile his tongue spreads your clenching canal wider, shooting bolts of frenetic pleasure throughout your edging body, his wet nose bounces off your [pc.clit]. It wasn’t just a lubed up deflection, it was an aching <i>thump</i> you felt in your heart. It happens again. You realize that he’s not content with merely licking, he’s wedging his face deeper into you. That’s when you skyrocket through the atmosphere, propelled by vaginally-induced bliss.");
		output("\n\n<i>“Yes!”</i> you shout, <i>“you have to do this for me later!”</i>");
		output("\n\nYour ravenous partner’s chin wiggles left and right, framing itself with the inside of your fertile tunnel. When you orgasm now" + (!pc.isSquirter() ? ", when fireworks explode in your mind":", when your thighs squirm and your pussy squirts") + ", he’s in the perfect position to catch every single drop of [pc.girlCumVisc] passion. He audibly gulps down your [pc.girlCumNoun], closing off the drift around you. His tongue’s intensity increases, turning into a molten spear that is as hot as he is, as hot as his cock is - you can feel it around your [pc.footOrFeet].");
		output("\n\nWhat you’re radiating is nothing compared to what’s burning inside him. Whatever was in that drug has turned him into the best cunt-kisser in the hold. You can’t hope to command a tongue that free and animalistic, only direct it to where its needed most. The raw sensation of his muscle sliding across your hypersensitive underside, drumming against your [pc.clit], nearly throws you over the edge into orgasmic release.");
		output("\n\nBut you hold on just a little longer. You stare down, pushing him back, [pc.fingers] pressed tight into his temples. He stares up to you with awe, reverence, <i>love.</i> He will follow your lead, do anything you say.");
		output("\n\nSo you scritch him behind his thick-furred ears and guide him back, letting him start again with slower, tentative strokes, guiding his hands elsewhere to better please you");
		if(pc.hasVaginas()) output(", this time sharing his obsession " + (pc.totalVaginas() == 2 ? "with your other slit":"among your other slits"));
		output(". You sense, or think, that he wants to say something, maybe rail you until you’re carrying his kids, but it’s all drowned out in squelching suckles and spikes of spastic enjoyment.");
		// PC Suula or Aphrodisiac Pussy
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nResubmerged in feminine fluids, he makes himself vulnerable to your alien venom. The cilia lining your embry furnace sting the dog-man’s tongue when he slides back in, slapping him in and on the face with a potent dose of unnatural lust. Hopefully he doesn’t protest. ‘Sides, if he does, you can tell him this is just how outsiders share heat!");
		// Merge
		output("\n\nHis padded hands caress your [pc.thighs], your waist, and especially your [pc.ass], palming large, circular motions across your [pc.skinFurScales]. You coo in delight, stroking his pussy-slimed cheek, rubbing your increasingly noticeable girlscent in as an afterthought - maybe you’ll find him after the siege, give him a reward for getting you off so well? He whimpers, pulling back to lick his lips; tilting his head, he re-enters again, this time in yet another uniquely pleasurable way.");
		output("\n\nFuck! It’d be a shame if he was taken already! You’re going to need a licker as good as him when you save this place!");
		// Herm
		if(pc.hasCock()) output("\n\nAlthough you’ve got him focused on your [pc.pussy " + x + "], he takes the angry throbbing of your [pc.cocksLight] as a sign to pay respects. Furry fingers trace webs of pleasure along the girth" + (pc.hasCocks() ? "s":"") + ", playing along the lust-swollen veins" + (pc.balls > 0 ? ", tying them to your [pc.balls]":"") + ". What [pc.cumColor] prejizz leaks out he uses to enhance the flavor of your dewy mound, mixing himself a delectable cocktail of [pc.cumNoun]-seed and [pc.girlCumVisc], [pc.girlCumFlavor] femslime.");
		// Merge
		output("\n\nDeciding to care for himself at last, the diligent korg lowers a hand to his cock. The veins, even from here, look like they’re about to pop, to say nothing of his fat knot. The sheer bulge on that breeding knob makes you wince - it also makes you understand that you need to pick up the pace if you’re to save the handsome hound from the worst case of literal blue-balls you’ve ever seen." + (CodexManager.entryViewed("Korgonne") ? " It’s no surprise that he’s so desperate to get off. You can’t say you wouldn’t suck the first dick or clit that came your way if you had a knot that collected the greatest excesses of your overflowing jizz. Who could be so choosy when they look like they’re about to explode?":""));
		// Big Clit
		if(pc.clitLength >= 3)
		{
			output("\n\nHis strength wanes as the whines and cries become more frequent, but your fluffy box-muncher isn’t quite finished. The ample size of your [pc.clits] give" + (pc.totalClits() == 1 ? "s":"") + " him one last idea. He grips " + (pc.totalClits() == 1 ? "it":"each of them") + " tightly, tugging outwards as if stroking on a penis. Nearer to the base your feminine fuckpole is thicker, and it’s the place he focuses his tongue. Sensations never meant to be experienced blaze a path from your overgrown anatomy to your cortex, making you shriek in pleasure too strong.");
			//Clit Dick (add-on)
			if(pc.clitLength >= 6)
			{
				output("\n\nAnd then he ups it. Somehow, he improves upon his mad skill for clitoral fellatio. The [pc.vaginaColor] rod " + (pc.balls > 0 ? "prodding into the flesh of your [pc.sack]":"jutting out with desire") + " proves to be as easily pleased as the cock it pretends to be. He rests the tip of it on his tongue and sucks it into his mouth, lining his throat with the furthest rim of it. What this does to your psyche is indescribable. Your whole brain explodes into a million pieces just trying to stay conscious. Hell, you can’t <i>be anything but conscious</i>, and it takes a deathgrip to slip him off without detonating inwards and outwards.");
			}
		}
	}
	// Merge
	output("\n\nYour pampered pooch is hyperventilating. His arms are only good for light, useless jerks to his bloated cock. You realize now that the only way to achieve a worthwhile orgasm is to switch positions, or smash his muzzle in all the way. Your partner needs you just as much as you need him.");
	output("\n\nAll you have to do is figure out <i>where...</i>");
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	if(useCock) addButton(0,"Deepthroat",getDeepthroughted,x,"Deepthroat","Rail his mouth! It’s all you need, and all he needs!");
	else addButton(0,"Stay",stayForBeejCuntsuckythings,x,"Stay","Stay right where you are. He’s got his dick in his hands and you need that muzzle where it is!");
	addButton(1,"69",sixtyNineKorgoborgo,[x,useCock],"69","Switch things up and return the favor, getting a bellyful of korg-spunk.");
}



public function getDeepthroughted(x:int):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	
	var ppKorgMale:Creature = new KorgonneMale();
	
	output("After a particularly feral grunt, you tap his head and grin. <i>“Hold still,”</i> you start, rearing back, <i>“you’re gonna need to concentrate for this.”</i> You thrust in savagely, eliciting a yelp" + (pc.balls > 0 ? " and a loud slap of ballflesh against his dick-braced jaw":"") + ". <i>“I know...”</i> You shudder, ");
	if(pc.hasCuntTail()) output("weaving your [pc.cuntTail] forward and cooing when it inhales his virile dick. He won’t need to masturbate like this, won’t need to worry about his lusts. He’ll just need to worry about nutting as hard as you do.");
	else if(pc.isNaga()) output("shifting position so that your snake tail’s tapered tip can rub at his member");
	else if(pc.isGoo()) output("pushing the tip of his tool into your gooey blob");
	else output("shifting a [pc.foot] onto his puppy-prick and stroking");
	output(". <i>“...It’s hard.”</i>");
	output("\n\nCock- and fuck-drunk, the brown-furred korgonne growls a rumbly purr around your pistoning [pc.cockType " + x + "] dong. His jaw works harder, automatically sucking for air when you pull back enough. His eyes flutter as he tries to cope with your aggressive skull-rutting, and doesn’t resist in the slightest as more of his throat spreads to accommodate your [pc.cock " + x + "].");
	output("\n\nWhen you thrust all the way into your puppy-puppet’s cock-socket, he groans so hard and unceasingly that you feel you’re relaxing in a jacuzzi, thrusting in and stroking out ecstatically. It’s so smooth and ripply and easy that your legs feel like water, but that’s just the numbness and the migration of blood. Your [pc.balls] " + (pc.balls > 1 ? "tighten":"tightens") + " on the journey to eminent orgasm");
	if(pc.balls > 0 && pc.ballDiameter() > 5) output(", smacking into and pooling across his face on increasingly greedy motions");
	output(".");
	output("\n\nWhile his consciousness flags, yours sharpens. ");
	//haveCuntTail:
	if(pc.hasCuntTail()) output("He wants to masturbate, but can’t quite comprehend the cum-sucking parasite handling his dick for him. Whenever it leaves space of his oh-so-tender knotty cock, he tries to pleasure, to rub at his sack, but you remind him sternly to let you work. With the last of his strength, he gets both paws on your [pc.thighs] and holds tight. He could squeeze his knot anytime he wanted, but he’s clearly waiting now...");
	else output("He’s masturbating so furiously now that his hands are a blur. Even if you focused on it you wouldn’t be able to follow those prick-pleasing digits with any clarity. Korg-cock stains itself white, but he’s yet to squeeze his knot, to drain his mighty nut of its drug-infused burden. Maybe he’s just holding back, waiting for the right moment. Or maybe...");
	output("\n\n...He’s waiting for you.");
	output("\n\nYou can’t really ask him though, not in the position you’re in. Your [pc.tongue] is hanging out");
	//long:
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" low enough to glide across your [pc.nipples]");
	output(", spraying beads of oral moisture in visible, humid arcs. Now, you’re not just holding on to the sides of his head, you’re clutching it like a pocket pussy, locking him to your crotch and leaning over his head. Humping in rapid bursts you straighten his throat out one " + (pc.cocks[x].cLength() < 14 ? "neck-bulging":"belly-reaching") + " <i>fuck</i> at a time.");
	// Multicock
	if(pc.hasCocks()) output("\n\nBouncing around uselessly like lop-rabbit ears, your " + (pc.cockTotal() == 2 ? "secondary cock":"other dicks") + " pokes, prods, slaps, and flops around his head, smearing his fur with ruddy [pc.cumColor] " + (pc.isHerm() ? "herm-":"man-") + "makeup. Fur mats under the [pc.cumVisc] assault which threatens to leak into his ears. You dare to break your relentless rhythm to shove " + (pc.cockTotal() == 2 ? "your extra":"another") + " dick into his mouth, railing him until it glows searingly hot and steams when bared to the air.");
	// Merge
	output("\n\nHot wetness douses your [pc.legOrLegs], yanking your attentions downward. In the haze of horniness you feel his throat lock around your [pc.cockHead " + x + "]. You hiss right through your teeth, barely catching the next thick arc of boiling-hot spooge that splatters and sizzles against " + (!pc.isNaga() ? "the ground behind you":"your snake-tail") + ", struggling to exist.");
	output("\n\nYou’re not far behind either. Esophageal friction releases the pressure in your loins, and the first load races to visceral eruption. A deep emotional satisfaction washes over you when your ");
	if(pc.balls == 0) output("prostate clenches");
	else output(" ball" + (pc.balls > 1 ? "s":"") + " tighten" + (pc.balls == 1 ? "s":"") + " and lurch" + (pc.balls == 1 ? "es":""));
	output(". On the tiny backstroke, the last bit of pre fires, and on the korg-claiming thrust, you erupt.");

	// PC low cum (<=500mL / add-on, no new PG)
	if(pc.cumQ() <= 500)
	{
		output(" The first shot [pc.cum] feels better than it let on, and after only a few ropes of [pc.cumVisc], belly-filling seed, your climax reduces to a dribble that you jerkily work out at his oxygen-deprived expense. Reacting to yours, his tapered tool fires off an enviable");
		if(pc.hasCuntTail()) output(" payload that satisfies your [pc.cuntTail] <i>very well</i>");
		else if(pc.isNaga()) output(" puddle that mostly drenches your [pc.leg]");
		else if(pc.isGoo()) output(" payload that dissolves into your gooey mass");
		else output(" puddle on the floor around you");
		output(".");
		if(pc.hasCocks()) output(" What little springs from your extra prick" + (pc.cockTotal() > 2 ? "s give":" gives") + " the korg a few nice [pc.cumColor] highlights to his headfur.");
	}
	// PC oodles of cum (501-2999mL / add-on, no new PG)
	else if(pc.cumQ() < 3000)
	{
		output(" Jet after jet of [pc.cum] steals a few hardened tendons from the korg-man’s gut, giving him the tiniest belly swell after its superheated journey to the center of him. Your thick, [pc.cumVisc] orgasm is not something he can taste while you’re embedded, but it’s something that must make him supremely happy... if the amount he’s firing off down below ");
		if(pc.hasCuntTail()) output("into your deeply satisfied [pc.cuntTail]");
		else if(pc.isNaga()) output("against your snake-tail");
		else if(pc.isGoo()) output("into your gooey body");
		else output("between your [pc.legsNoun]");
		output(" is any indication!");
		if(pc.hasCocks()) output(" It makes your extra equipment’s job of plastering his headfur with a few [pc.cumColor] ropes far more appreciable, too.");
	}
	// PC plenty of cum (3000-5999mL / add-on, no new PG)
	else if(pc.cumQ() < 6000)
	{
		output(" The visceral rush of masculine release is felt in every muscle of your body. The amount of [pc.cum] you’re blowing is seen in your korg’s, too. The gulps and suckles audibly deepen with each thick lasso of [pc.cumVisc] [pc.cumNoun] sliding into his belly. It’s a marvelous orgasm that builds back up his windpipe, funneling around your entrenched [pc.cockNoun " + x + "] and leaking from his nostrils onto the shaft it traveled! Your cock-hoster’s orgasm ended long before yours, ");
		if(pc.hasCuntTail()) output("satisfying your [pc.cuntTail] thoroughly");
		else if(pc.isNaga()) output("dripping down your snake-tail");
		else if(pc.isGoo()) output("filling your gooey body with fresh essence");
		else output("puddling rank on the ground behind you");
		output(".");
		if(pc.hasCocks()) output(" Your extra endowment" + (pc.totalCocks() > 2 ? "s mark":" marks") + " him in a musky [pc.cumColor] deposit of seed in gratitude, shooting out so much that you leave behind a huge reminder of your tryst.");
	}
	// PC lots of cum (6000-10000mL / add-on, no new PG)
	else if(pc.cumQ() < 10000)
	{
		output("\n\nYour groaning eruptions stretch the poor pup’s neck wide, every drop of your virile [pc.cumNoun] surging into his belly. The handsome hound gags and chokes, thrashing in the midst of his own orgasm and the air-locking flow of [pc.cumVisc] seed rushing back up around your rod and beyond his lips. [pc.CumFlavor] spunk dribbles down his chin like fresh spit and spills from his nose onto the top of your [pc.base " + x + "] as his abdominals disappear into a rounding cum-gut. His own orgasm ended long ago, ");
		if(pc.hasCuntTail()) output("guzzled into the mysterious locale of your [pc.cuntTail]’s biology");
		else if(pc.isNaga()) output("plastered on your snake-leg");
		else if(pc.isGoo()) output("lost in your gooey mass");
		else output("wasted on the ground");
		output(".");
		if(pc.hasCocks()) output(" What your extra dick" + (pc.cockTotal() > 2 ? "s fire":" fires") + " off leave his backside plastered and a wave of sperminess coating the floor.");
	}
	// PC inhuman cum (>=10000mL / add-on, no new PG)
	else
	{
		output("\n\nWhen you orgasm, feeling drains from everywhere in your body, leaving you empty like a husk for an instant when the first throat-bulging load cannonballs into the poor korg’s belly. He thrashes and pleasure-seizes, his climax suddenly fading to a dribble while you pneumatically inflate his belly with [pc.cum]. It crashes in and rushes out around your [pc.cockNoun " + x + "], spilling from his nostrils like two tiny faucets and from the corners of his mouth against your [pc.base " + x + "].");
		output("\n\nHis stomach distends and brushes against your [pc.legOrLegs], wobbling under the ludicrous weight of [pc.cumFlavor] jism. While it may be a bit mischievous, you gurgle out a half-giggle, draining your superheated spooge into him. It might help him in a few ways... maybe make the invaders think he’s already been enslaved and filled. Nobody’ll want to touch him! Of course he came, but it didn’t last as long as yours, and it was a distant irrelevance ");
		if(pc.hasCuntTail()) output("that your [pc.cuntTail] happily availed itself to");
		else if(pc.isNaga()) output("that drenched your snake-tail");
		else if(pc.isGoo()) output("that has already been absorbed into your biomass");
		else output("that puddles behind you even now");
		output(".");
		if(pc.hasCocks()) output(" You don’t envy anyone having to clean up the unbelievable spermy mess your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " made of this corridor. Even the unconscious milo wasn’t safe from your [pc.cumVisc], inhuman climax!");
	}
	// Merge
	output("\n\nYour softening [pc.cockNoun " + x + "] emerges wetly, spurting out a final load against his cheek which he swallows with the rest. The korgonne looks up" + (!pc.isCrotchExposed() ? " as you re-dress":"") + ", quavering tail slowly brushing back and forth in the afterglow. A smile crests his [pc.cumNoun]-flecked face. Based on his performance, you can safely say it’s the second best thing he can do with his lips.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Much thankings, alien. Think heat gone now.":"Thank you, alien. I think the heat’s passing now.") + "”</i> He nods slowly, standing" + (pc.cumQ() >= 6000 ? " and hefting the weight of his temporary cum-balloon":"") + ". He grabs a spear from the ground and " + (pc.cumQ() < 6000 ? "scurries":"waddles") + " away.");
	output("\n\nBetter get going yourself! ...Hey are those some healing poultices on the ground? The plucky, cummy korg seems to have forgotten them in his haste.\n\n");
	processTime(15);
	pc.orgasm();
	if(pc.hasCuntTail()) feedCuntSnake(ppKorgMale);
	else if(pc.isGoo()) pc.addBiomass(500);
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}

// Stay
public function stayForBeejCuntsuckythings(x:int):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	
	var ppKorgMale:Creature = new KorgonneMale();
	
	output("Scratching behind the pussy-drunk pup’s ears, you step forward, " + (pc.legCount > 1 ? "scissoring him between your [pc.thighs]":"grinding your front into his skull") + " and rubbing your [pc.clits] on his head. Lightheadedness follows when he licks and suckles at your engorged buzzer, polishing its surface until you’re seeing stars and impregnating his fur with another batch of [pc.girlCumNoun]. <i>“Whew,”</i> you huff, petting him with as much energy as his tail wags, <i>“you keep that up, just like that, and I’ll help you get off.”</i>");
	output("\n\nShivering and moaning, you ");
	if(pc.isNaga()) output("slither your snake-tail close enough to brush his cock");
	else if(pc.isGoo()) output("inch forward so that his cock-tip slides into your gooey form");
	else output("move a [pc.foot] closer to his cock");
	output(", giving him a little love in return. <i>“Lick!!”</i> you shout, gripping him by the jaw and sliding his muzzle into your honeypot. His jaw works harder, automatically sucking for air when you relax.");
	output("\n\nHe doesn’t resist any of the roughness. How could anyone when presented with a stunningly drenched mound of " + (pc.vaginalPuffiness(x) > 0 ? "chubby, ":"") + "clenching cunt?");
	output("\n\nThe hound-dog’s entire body freezes when you carry his upper snout a few inches into your convulsing box. You’re close enough that your [pc.clit] throbs against his skull, overwhelming his senses and yours. His wide tongue does its best to show you how much he appreciates his position below you. On another particularly penetrative thrust, you spasm and seize so hard that he’s trapped in your pussy" + (pc.isSquirter() ? ", being showered in [pc.girlCumVisc], piping-hot loads of juice":"") + ".");
	output("\n\nYou’re outputting so many pheromones that anybody would be forgiven for thinking he belonged to you. Renewed sexual strength speeds the pumping hands around his doggie-dong. The korg’s tongue, finally freed, chooses to remain inside you, settling into its new home. Adoration shines bright enough in his eyes that it reflects in yours, making the thought of falling cunt-first on his dick, taking his knot past your lips, and getting a wombful of hot korg-spunk a too-compelling one.");
	output("\n\nMasturbation ramping up, your magnificent man-hound gulps and slurps until he’s drinking in a ");
	if(pc.vaginas[x].wetness() < 2) output("trickle");
	else if(pc.vaginas[x].wetness() < 4) output("stream");
	else output("waterfall");
	output(" of [pc.girlCumVisc] bliss. Your lower handiwork ceases as you hold tight, falling over his head, mopping your mound with slickened amber fur. He takes it all from there, jerkily working his muscles to finish his perverse harvest of the [pc.raceShort]-[pc.boyGirl] he’s socketing.");
	// Herm
	if(pc.hasCock())
	{
		output("\n\nYour [pc.base] glides over his glazed face");
		if(pc.balls > 0) output(", your [pc.sack] too");
		output(". You latch on and squeeze him into your groin, desperate for him to take you to the edge of rapture. You paw all over your [pc.cocks], taking them up with you into the euphoric high. They twitch as powerfully as your [pc.pussyNoun " + x + "], so close to releasing their loads.");
	}
	// Merge
	output("\n\nLurid squelches echo down the frostbitten halls. Whatever or whomever this fluffy korgonne serves has an unparalleled muff-muncher at their beck and call, and you hope for their sake they’re using him to his fullest. The cycle grows more intense as your body demands even greater amounts of pleasure. You can’t get enough, you can’t fuck him enough. The friction of moist fur gliding across your hyperactive endowments make you scream in delight.");
	output("\n\nYou surrender to powerful orgasm first with a heavy gasp then a pleased sigh" + (pc.hasCuntTail() ? ", one that that breaks apart into benignness when your [pc.cuntTail] wraps begins to milk out his cum":"") + ".");
	// PC don’t squirt (add-on, no new pg)
	if(!pc.isSquirter()) output(" Groaning, your whole head throbs and pulses. It feels like you’re standing too close a night club’s speaker system, subliminal bass thumps rippling into your psyche and inducing a sensory overload that has you seeing colors, pictures, and exploding stars. The pussy-pleasing pup wrings out every drop from you in your moment of enthusiastic release, lapping you through each contraction. He’s anointed in your [pc.girlCum], baptized in a [pc.girlCumVisc] rain of drizzling, teeth-drowning release" + (pc.hasCock() ? ", all while your masculine endowments spurt [pc.cumNoun] as a welcome addition":"") + ".");
	// PC squirts (add-on, no new pg)
	else output(" Screaming, your whole body quivers and spasms violently when the first [pc.girlCumVisc] missile of feminine release lances him in the throat, followed by another that breaks apart his brow. Your head pulses and throbs in the interim, only lifting when you squirt again. With him lodged in, most of it finds its way down to his belly. The pussy-pleasing pup squeezes your [pc.thighs] on each contraction, masterfully coaxing out your bucket-filling orgasm one jet of [pc.girlCumNoun] at a time. He fucks you through every painful contraction, drowning himself in a storm of girly juice" + (pc.hasCock() ? " and [pc.cumFlavor]-addition, courtesy of your [pc.cocksLight]":"") + ".");
	// Merge
	output("\n\nYou almost don’t have the strength to stay awake after that. You can ");
	if(pc.hasCuntTail()) output("tell your [pc.cuntTail] is happy to have been fed");
	else if(pc.isNaga()) output("feel his cum dripping down your snake-tail");
	else if(pc.isGoo()) output("sense a change in fullness after his orgasm fed your gooey form");
	else output("smell his cum puddled behind you");
	
	output(". If not for his strong arms holding you up, you would have stumbled to the stony floor.");

	output("\n\nWhilst the afterglow fades, you can’t help but smile. Him too. He’s completely coated in your juices, your scent. You hope they have good bathing methods, otherwise he’ll never find a mate - they’ll think he’s marked!");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Very thank, alien. Fun heat share, nothing like before! Gooding feels now.");
	else output("Thank you, alien. I’ve never shared heat like that before, it felt better than anything else.");
	output("”</i> He stands and kisses you on the cheek, beginning to gather his things. When he collects a spear, he hands to you a small medicinal pack, herbs wrapped in gauze. <i>“Use for troubles,”</i> he says, scurrying off before you can thank him.");
	output("\n\nWhen you’re ready, you do the same before that milodan comes to...\n\n");
	processTime(15);
	pc.orgasm();
	pc.loadInCunt(ppKorgMale, x);
	if(pc.hasCuntTail()) feedCuntSnake(ppKorgMale);
	else if(pc.isGoo()) pc.addBiomass(500);
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}

//[69]
// Tooltip: Switch things up and return the favor, getting a bellyful of korg-spunk.
public function sixtyNineKorgoborgo(args:Array):void
{
	var x:int = args[0];
	var useCock:Boolean = args[1];
	clearOutput();
	showDosedKorgMale();
	author("William");
	
	var ppKorgMale:Creature = new KorgonneMale();
	
	output("[pc.Fingers] grappling his head, you ease him to the ground. The further his paws move from his twitching cock the louder he whines. Indeed, when you floor him and steal a glance at it, it looks so needy that you feel a bit bad. <i>“Don’t worry,”</i> you comfort him, pushing your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(useCock) output("[pc.base " + x + "]");
	else output("[pc.clit]");
	output(" against the bridge of his nose. <i>“I’ve got this covered.”</i> You sit up and quickly reverse, resting your ");
	if(useCock) output("[pc.cocks]");
	else output("[pc.pussies]");
	output(" on his face while you touch your nose to ten inches of korgonne cock. <i>“Looks like you could use some help.”</i>");
	output("\n\nYou lick over your [pc.lipsChaste] once then twice, sizing up your partner’s beefy cock. Pre drools almost endlessly, squirting out on every throb. You can feel his heartbeat against your [pc.belly], forcing out more of that head-swimming musk. After one whiff of it, you ring its tapered head before stretching your [pc.lipColor] lips around his girth, swiveling backwards towards his muzzle while you suck out more. Your hound thrusts upwards, rocketing towards your throat before sliding back out.");
	output("\n\nSticky slime washes your tastebuds and dribbles out with your spit. There’s the familiar salty base to it, and beneath that is a crisp flavor that you can’t help but think improves the taste of his beefy dick. His knot begs for attention, for kisses and squeezes. Your nose dips towards his slippery sheath, [pc.tongue] leading the stimulating charge around its sensitive nerves. The most bloated veins are found there on his breeding bulge, and they abate for only a blissful flash when you warm them with your sensual touch.");
	output("\n\nLapping up all that " + (pc.isBimbo() ? "yummy ":"") + "pre caking it is a start. Polishing its exotic blue shape until it shines with spit is the next thing. He’s groaning into your nethers when you treat his cock like your new favorite lollipop, earning you larger, creamier rewards. It’s also barely noticeable, but you could swear his knot just swelled a teensy bit more.\n\n");
	if(pc.isCumSlut()) output("Fuck yes! You’re going to milk so much from him that he won’t get horny even if they hit him with three of those drug darts, and you’re going to get all the hot, rich, slimy cum you could ever want in a day! ");
	output("Meanwhile, the eager pup is seeing to your loins even better than before. Now that he doesn’t have to worry about staying up, he can worry about his only place in life right now.");
	// Used Cock
	if(useCock) 
	{
		output("\n\nThat place is welcoming your [pc.cock " + x + "] back into his mouth. You lift your hips and he does the rest, guiding you back towards his throat. The ease at which he takes you in this position urges you to go balls-deep and unload in his gut. His gag reflex doesn’t give you much trouble this time, and he’s licking and lapping at yours with the same effort you show his.");
		output("\n\nBefore you know it, you’re both sucking each other off with reckless abandon. You hollow your cheeks and seal down on his prick, bobbing up and down while thrusting in and out, swallowing loads of leaking juices with eager gulps. He’s already brought you back to the level of arousal from before by teasing your tenderest places and groping wildly at your [pc.ass].");
		if(pc.hasCocks()) output("\n\nYour extra cock" + (pc.cockTotal() > 2 ? "s":"") + " flop uselessly around his face, slapping him with [pc.cumColor] discolorations he’ll be hard pressed to clean off later. His dusky lips can’t hope to catch all of the runoff, either. He can’t even keep his chin-slickening drool in!");
	}
	// Used Vagina
	else
	{
		output("\n\nThat place is hammering himself back into your [pc.pussy " + x + "], pressing for its furthest regions and coaxing out fresh loads of [pc.girlCumNoun]. His hands wrap around your [pc.thighs], groping wildly at your [pc.ass] while stroking down your [pc.thighs]. Before you know it, you’re sucking him off with the same determined frenzy, feeling blessed by the presence of such a fat, horny, bloated, engorged dick like his. Your [pc.lips] slide up and down his moistened shaft while he humps and grinds in the throes of lust.");
		if(pc.hasCock()) output("\n\nYour [pc.cocks] bounce" + (pc.cockTotal() == 1 ? "s":"") + " harmlessly and almost unloved around his throatily groaning face. The overly-sensitive shaft" + (pc.hasCocks() ? "s share":" shares") + " in the ministrations your [pc.pussy " + x + "] enjoys, but his focus is well and truly on that overly-sensitive honeypot. You briefly consider slotting " + (!pc.hasCocks() ? "it":"one") + " in his throat, pumping a few loads of pre in there, but the thought is licked away like ice cream.");
		output("\n\nHe pumps his tongue in and out of your glistening quim, groaning in unthinking delight. The fluids spurting from your silky soft pussylips are like ambrosia to him. You’re happy to squeeze out more and more to keep him active for long minutes of natural-born mound-munching mastery. Your eyes roll back when he thrusts in at the same moment you suck him down again.");
		output("\n\nYou wonder if his did, too.");
	}
	// Merge
	output("\n\nCrying out, you suck the korg-man down to his knot, ");
	//snakeByte:
	if(flags["USED_SNAKEBYTE"] != undefined) output("the ribbed muscles of your slutty neck clenching tight to his prick, blowing his mind away with unparalleled oral pleasure. All you have to do is squeeze his knot - something you can do with your enhanced jaw capacity - and every drop will find its way to your stomach");
	//bimboTreated:
	else if(pc.isBimbo() && pc.isTreated()) output("moaning happily around his prick, thrilled that you’re blessed with the absence of a gag reflex! You’re so close to cumming now, all you’d have to do is squeeze his knot");
	else if(pc.canDeepthroat()) output("athrill that you don’t have a gag reflex");
	//gag:
	else output("chest tightening up and tears welling in your eyes as you do");
	output(".");
	output("\n\nWhile you consider your options this close to the precipice, [pc.hips] squirming around on autopilot, he makes the first move. ");
	if(!useCock) output("His fingers land on and tug your [pc.clit] at the same time his tongue lunges for your cervix.");
	else output("His hand wraps around your " + (pc.balls > 0 ? "[pc.balls]":"[pc.base " + x + "]") + " and squeezes gently, one final inhalation right after.");
	output(" Vision crossing and blurring, you hilt yourself into his face, blissful spasms flaring up across your [pc.skinFurScales] in fits and starts.");
	output("\n\nYour [pc.fingers] curl around his sensitive knot and <i>grip.</i> When you squeeze that inflated orb, a creamy deluge fires into your maw. The subsequent shots bubble out and arc towards your belly while you fondle that fluffy sack. His relief is yours in a way. All that penile pressure venting into you while his cum-factory deflates... you have a pretty good idea how sensational it must be for him");
	//treatedOrBimboOrSnakebyte:
	if(flags["USED_SNAKEBYTE"] != undefined || pc.isTreated() || pc.isBimbo()) output(" considering it’s making you feel hot enough to fall into oral-orgasm-induced-coma. If you weren’t busy sucking down all his loads, you’d be screeching loud enough to alert the entire invasion force!");
	else output(".");
	// PC Used Cock
	if(useCock) 
	{
		output("\n\nFiring right back, you slap your crotch to what’s been responsible for your pleasure thus far: his jaw. [pc.Cum] rises up through your [pc.balls] and crashes out first in a bubbly rope. Bolts of lightning arc up your spine and strike your brain, shattering it into shards of gloriously discharged lust.");
		//cumV<=500mL: 
		if(pc.cumQ() <= 500) output("Midway through muscle-locking release, the mutuality of your throbs dies off, your orgasm ending sooner. Your stomach inflates a tad on his mighty sperminess, and all you’ve given the korg is a cup of [pc.cumFlavor]-tea in return.");
		else if(pc.cumQ() < 3000) output("Mutually throbbing and bucking against each other, you bulge and plaster each other’s throats with the wholeness of equal virility, setting off chain reactions of bubbly release. When the roughness fades, you’re luxuriating in each others heat, feeling fuller... feeling sated. You’re still dribbling a little into his maw long seconds after his dick begins to soften.");
		//3000-5999mL:
		else if(pc.cumQ() < 6000) output("Your tongue would loll if it wasn’t pinned by cock, but so would his. In fact, cum would be leaking alongside his if you weren’t burrowed in so deep. Even after the mutual throbbing and thrashing ceases, you cum and cum, squishing and squelching against his cum-clogged neck until he’s losing consciousness for a lake of gunk. His brain finds the power to help ease the rest of your [pc.cumVisc] torrents out, augmenting your blissful enjoyment.");
		//>6000mL:
		else output("Drinking down his musky cum leads you to mewl, the strength and force of your surging [pc.cumNoun]-spulsion. You know his throat is bulging - bigger than yours when you took all of his. Even after a few seconds, it’s like your [pc.balls] hadn’t begun. Rivers of [pc.cumVisc] gunk pour into his belly, filling back up through his throat and around your [pc.cocksLight]. He’s shuddering and quivering nervelessly under you while you airily thrust, those tiny vibrations helping the torrid excess soak into his fur.");
		if(pc.hasCocks())
		{
			output("\n\n" + (pc.cockTotal() == 2 ? "The dick":"What cocks") + " not in his mouth " + (pc.cockTotal() == 2 ? "blows its":"blows their") + " conjoined jets into his neck and chest, the hip-rocking you’re doing rubbing it deep into his fluffy coat.");
		}
		//herm:
		if(pc.isHerm()) output("\n\nFeminine release comes moments later, " + (!pc.isSquirter() ? "thin streams":"body-splattering squirts") + " of [pc.girlCumVisc] [pc.girlCumNoun]" + (!pc.isSquirter() ? " oozing in sparkling waves":" loosing in bucket-filling amounts") + ".");
	}
	// PC Used Vagina
	else
	{
		output("\n\nEventually, you lazily blink, feeling your [pc.pussies] contract. Your partner’s firmness draws out a violent reaction from your body, while gentler gropes and clit-tweaking motions make you whimper through the funneling spooge overlaying your belly acids. Your stomach balloons with his seed, and your [pc.pussyNoun " + x + "] puffs out bright red, gasping like your wanton ‘O’ lips. Stars shoot across your narrow bands of vision, eliminating color and reality as [pc.girlCum] " + (!pc.isSquirter() ? "oozes out in thin streams, expedited by that unfailing tongue":"lances against his tonsil and uvula in powerfully loosed squirts") + ".");
		output("\n\nFeminine release dominates your mind, slowly massaging you through gradual expressions of receding euphoria. You’re completely surrounded by his soft fur, warming you better than the ambient temperature, sliding easily against your [pc.skinFurScales] since it’s been moistened with sweat and jism. You twist back and forth, grinding it all out.");
		if(pc.hasCock()) 
		{
			output(" Your masculine endowment" + (pc.hasCocks() ? "s":"") + " add sympathetic amounts of [pc.cumNoun] to the mix, though the ");
			if(pc.cumQ() < 10) output("small");
			else if(pc.cumQ()< 50) output("thin");
			else if(pc.cumQ()< 500) output("thick");
			else output("waves");
			output(" of [pc.cumVisc] seed-filled fluid spurt into wastedness.");
			output("\n\nAll your thinking of now is why you didn’t ask him to fill your pussy with that cum instead...");
		}
	}
	// Merge
	output("\n\nWhen his prick pops free of your [pc.lipsChaste], it twitches. You lick the dregs from your lips and clean a trickle from his girth. With a husky moan you sag off of him" + (pc.cumQ() >= 3000 && useCock ? " and his cum-plumped belly":"") + ", sighing dreamily.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Alien... Very happying. Heat gone and bettering feels now.":"That was... wonderful, alien. The heat’s gone; I feel much better now.") + "”</i> He sits up and eyes you with a handsome smile, not at all caring that he’s covered in your juices. When the afterglow fades and you re-dress, he grabs a spear, collects his items, and presents you with a healing poultice. <i>“Use if hurt,”</i> he nods, tail wagging when you accept the medicine. He " + (pc.cumQ() >= 3000 && useCock ? "waddles":"scampers") + " off without another word.");
	output("\n\nHopefully you didn’t lose too much time.\n\n");
	processTime(15);
	pc.orgasm();
	pc.loadInMouth(ppKorgMale);
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}

//[Frot & Fuck]
// Tooltip: Rub dicks with the helpless hound. Maybe pound his butt while you’re at it.
// Tooltip: You need a dick for this.
// Requires Dick. No taurs or neuters.
// Can fuck him if not too big.
public function frotAndFuck():void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	var x:int = pc.biggestCockIndex();

	output("Grinning, you tap his head, ");
	//notExposed:
	if(!pc.isCrotchExposed()) output("drawing his attention to the bulge in your [pc.crotchCoverUnder]. You pull them down, letting your [pc.cocks] pulse in the warm air");
	else output("drawing his gaze to your [pc.cocks], pulse in the warm air");
	output(". You grunt as you start to stroke your [pc.cocks] into raw readiness, captivating him with ");
	if(pc.cocks[x].cLength() < 8) output("your smaller member" + (pc.hasCocks() ? "s":""));
	else if(pc.cocks[x].cLength() < 20) output("your well-hung dick" + (pc.hasCocks() ? "s":""));
	else output("your monumental erection" + (pc.hasCocks() ? "s":""));
	if(pc.balls > 0) output(" and the [pc.balls] attached underneath " + (!pc.hasCocks() ? "it":"them"));
	output(". <i>“Mmm,”</i> you moan, sitting down and sliding his loincloth aside. ");
	if(pc.isBimbo()) output("<i>“This is the best way to share heat!”</i> you sing.");
	else if(pc.isBro()) output("<i>“I’ve got just the thing for you,”</i> you nod.");
	else if(pc.isNice()) output("<i>“This’ll do nicely, just follow my lead.”</i> You wink.");
	else if(pc.isMischievous()) output("<i>“Sit tight and watch. I’ll get ‘ya cooled off with me.”</i>");
	else output("<i>“If this isn’t your idea of fun then too bad,”</i> you glower at him.");

	output("\n\nThe korgonne’s white braid flips over his shoulder when he lurches into you. He squirms helplessly against your [pc.cockType " + x + "] pressure, taking hold of his cock and jerking without a second thought. You slap his hands away and plant your [pc.cocks] in their place. Hisses of pleasure whistle through your teeth and his, the sensitive spots beneath [pc.eachCockHead] enjoying the squeaky phallic amore.");
	output("\n\nTen inches of tapered korg-dick audibly rebound off your [pc.cockNoun " + x + "], getting it harder and hotter for the bit of fun to come. Sticky precipitations develop at the summit of his and yours. Even this is enough to get him interested. He seems totally entranced by what’s going on - his tail is wagging dopily, and there’s a vacant lust in his eyes. ");
	if(pc.cocks[x].cLength() < 8) output("Inversely, a mixed rush of excitement and shame blows through you, manifesting as the brightest blush your [pc.face] can wear. <i>You’re not as big as him.</i> Your [pc.cock " + x + "] is an inferior thing to his. You’re not sure if it’s the embarrassment that makes squirming against him so satisfying, or just how sensitive it is.");
	else if(pc.cocks[x].cLength() < 20) output("It’s hard not to be amused by the fact your [pc.cock " + x + "] is larger than his. They bounce and sway against each other, making you both arch back with throaty, needy groans.");
	else output("It’s fundamentally impossible not to smirk and laugh a bit. The blue doggie-dong attached to him is totally obscured by your own. Your cock grows so large that it keeps you pinned in place; it’s a [pc.cockColor " + x + "] pillar of superlative maleness that could grapple his, show it how inferior it is. They wiggle playfully against one another, tickling you both to greater stiffness with heat and friction.");
	if(pc.balls > 0) 
	{
		output(" You heft your [pc.balls], encouraging him to do the same, eventually exchanging fondles of admiration. In his carnal dizziness, sinking his fingers into your ");
		if(pc.hasFur()) output("fluffy");
		else if(pc.hasScales()) output("scaly");
		else if(pc.hasChitin()) output("chitiny");
		else if(pc.isGoo()) output("gooey");
		else output("smooth");
		output(" cumsack seems to be a captivation he can’t shake.");
	}
	output("\n\n<i>“" + (!korgiTranslate() ? "Strange heat-share... joyful soft-wet!":"It’s a strange position, but the soft wetness is wonderful!") + "”</i> he barks out, visibly shuddering from the sensation. Tough fingers dig into your [pc.cockNoun " + x + "], jerking up and down while you sway inwards and outwards, doing the same for him. The longer your [pc.hand] remains on his musky, leaking cock, the more he squirts It bulges in your hand, growing bigger.");
	output("\n\nHis knot has also inflated to such a width that the girth of his manhood is shamed by it. The veins there bloat the most, looking close to popping. The breeding bulb looks like it’s about to explode. His green eyes roll back when you caress its spherical shape, delighting in its unique texture. Your pup’s hips lurch upwards against your shaft and a tiny rope of cum fires out, " + (pc.cocks[x].cLength() < 8 ? "slapping across your [pc.chest]":"plastering the underside of your inhumanly swollen dong") + ". Tongue lolling, he at least finds the sense to return the affection to your [pc.base " + x + "]" + (pc.hasKnot(x) ? ", squeezing your [pc.knots] with the same amount of delicate respect":"") + ".");
	if(CodexManager.entryViewed("Korgonne")) output("\n\nReally, it makes sense that he’s so eager for any kind of sexual relief. If you were so pent-up that your knot had to act as excess storage for your cum, you’d accept any amount of depravity to vent that pressure.");
	output("\n\nRolling your [pc.hips], you squirm against him in earnest, jerking each other off, ");
	if(pc.cocks[x].cLength() < 8) output("smiling embarrassedly");
	else output("grinning goofily");
	output(". His muzzle broadens into a pleased and toothy countenance. For a moment, you wonder if he’s laughing under his breath.");
	if(pc.hasCocks()) output(" Being the accommodating hound he is, he finally lifts his other hand to tend your spare cock" + (pc.cockTotal() > 2 ? "s":"") + ", jerking " + (pc.cockTotal() == 2 ? "it":"them") + " until they’re drooling as much as the one against his.");
	output("\n\nThe slender canine rubs all that emerges from your cumslit" + (pc.hasCocks() ? "s":"") + " down your shaft" + (pc.hasCocks() ? "s":"") + ", shining them in accumulating moisture. Sometimes he can’t even keep up with it, but by now you’re leaking so much that it rolls down under its own weight. He’s happy to try and catch it all, and because of his lust-inundated faculties, you’re feeling harder, firmer, much more eager... and you start moving a lot faster.");
	output("\n\nA change in position would be ideal, but you could revel in this for a few moments longer. He bites into his lower lip when you reach over, ");
	if(pc.cocks[x].cLength() < 20) output("grabbing both greased poles and jerking them in all cardinal directions like you’re piloting a ship, or are in the middle of an undisciplined dance. Whatever, the pleasure is real.");
	else output("leaning you totem towards his face and burying his dick into the [pc.base " + x + "]. You’d need to wrap a cock your size in a body to control its reckless fervor. It’s like an amazon crushing the waistbone of her weaker partner. You’re just grinding and leaking and grinding some more, pounding squishily against it.");//hyper
	// Breasts and Lactation
	if(pc.biggestTitSize() >= 1) output("\n\nHe reaches across to your [pc.breasts]" + (!pc.isChestExposed() ? ", sliding past your [pc.chestCover]":"") + " and fills his hand with one boob, rolling it in a circle before pinching the [pc.nippleColor] teat capping it. One of your hands finds its way there too, undoing your solid, phallus-on-phallus balance for a second." + (pc.isLactating() ? " A thin stream of [pc.milkColor] [pc.milkNoun] shoots out of the double-squeezed tit, splashing your oh-so-hard dicks with a dash of [pc.milkVisc] warmth.":""));
	// PC Dicknipple
	if(pc.hasDickNipples()) 
	{
		output("\n\nConfusion and awe shine plainly in his alien eyes when your [pc.dickNipples] rouse thanks to the attention. You couldn’t hope to hold them back from this obscene session. Your nubs transform into rigid rods that destroy his concept of biology. They jut powerfully, aligning perfectly with his shocked eyes for seconds before throbbing and bouncing disoriented. What you’re doing is so tame compared to sex and you’ve gotten this hard from the prospect of cumming all over each other!");
		output("\n\nHe gingerly reaches for one, pumping it a few times before tracing the junction where smooth chest meets firm nipple-cock, galvanizing you with mammarian pleasure. He moves back to pumping it, wearing faces of gradual dismay and interest when it begins to leak precious pearls of tit-jizz. All this does for you is make you moan in delight as he becomes more comfortable with it, stroking your salacious organ with innate expertise.");
	}
	// PC Lipples/Nipplecunts etc
	if(pc.hasFuckableNipples()) 
	{
		output("\n\nAll the insistent pressing parts your [pc.nipple], and his thumb sinks into the wet " + (pc.hasLipples() ? "suck-":"cunt-") + "hole. Your back arches in reaction, drawing the claw-tipped digit into the knuckle" + (pc.canMilkSquirt() ? " and bathing it in a blast of [pc.milk]":"") + ". His eyes widen and he recoils in shock, though that yank only undulates reflexively. Your eyes cross and you lose grip in your fingers, squealing and shuddering, begging him to take advantage of your plush, mammarian tunnels.");
		output("\n\nHe stares at you for a split second, his concept of biology obliterated when his probing thumb is welcomed back into the velvety embrace of your modded tit. He watches your face the whole time for pangs and flares of joy, inching closer to give the other some much-needed attention.");
	}
	// Merge
	output("\n\nScooting forward, the howling hound ");
	if(pc.legCount > 1) output("scythes your legs in his");
	else output("wraps his legs around your [pc.hips]");
	output(", jerkily working his muscled thighs to hump and hump at your [pc.cock " + x + "]. All he can manage now are whimpers. His hands are splayed behind him, balancing him for the phallic tribadism going on in the gap between your bellies. It’s almost like sex now, if the imaginary figure you were stuffing was invisible and not just a figment of fuck-drunk fantasy.");

	// PC small or medium dick
	if(pc.cocks[x].cLength() < 20) 
	{
		output("\n\nHe slams forward, reaching an arm under yours and tugging you into it. He’s been moaning huskily the whole time. Saliva rains in thick strings from his jaw, adding extra layers of lubrication to the action below. Your heart is beating like crazy and [pc.eachCock] is feeling more like a jackhammer than blood-hardened breeding tool. You slam forward, hard enough to push him back, beginning to realize there is some merit to the idea.");
		output("\n\nHe’s much too lost to pleasure, evident by the way his cock is gushing out musky satisfaction next to yours. There’s no way he could resist you planting his butt on your lap and spearing it. Sure, you could stay just like this. It feels great! But it could always feel better...");
	}
	// PC hyper dick (automatically go to [Keep Frotting] scene, can’t pound his butt this big)
	else
	{
		output("\n\nPerhaps it’s the drug that brings him closer to your [pc.cock " + x + "]. There’s something about the way he continues to paw at its seemingly endless expanses of flesh that fattens it with greater desire; it surges forward stronger and stronger, finally throwing him back. Thick arcs of cum fly up, hanging in the air, and fall onto your urethral bulge. When a few droplets slip into your pricklips you bounce forward and bury him under the mast, no longer in control of your lust.");
		output("\n\nIt was bound to go down like this. What else is a dick this big good for, than being worshiped by a lesser male? To be ravished with attention from all sources until its erupting geyser-like jets of virile spunk? It doesn’t care where the pressure comes from. It doesn’t care what makes its abnormal veins swell. It just wants to leak and cum. And that’s what you’re about to give it.");
	}
	//([Next] //if Hyper) [Fuck His Butt] [Keep Frotting]
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	if(pc.cocks[x].cLength() >= 20) addButton(0,"Next",keepuFrottuWang,x);
	else
	{
		if(pc.cockThatFits(1000) >= 0) addButton(0,"Fuck His Butt",penisRouter,[fuckDatKorgosButt,700,false,0],"Fuck His Butt","Turn him around and fuck his butt.");
		else addDisabledButton(0,"Fuck His Butt","Fuck His Butt","You’re too big for this.");
		addButton(1,"Keep Frotting",keepuFrottuWang,x,"Keep Frotting","Shower each other in jizz.");
	}
}

//[Fuck His Butt]
// Tooltip: Turn him around and fuck his butt.
// PC is offered this option if dick isn’t hyper.
public function fuckDatKorgosButt(x:int):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");

	output("Caught unawares, the korg only gives a grunt of confusion when you grab his shoulders and twist him around. The chiseled canine slumps forward, his muscle-stacked butt clenching in the suddenness of lost pleasure. Lifting and pulling him back is an trivial effort, and your slimed cock easily lubricates the cleft of his backside, additional wads of pre oozing out to slicken his entrance. <i>“The other way wasn’t good enough,”</i> you chuckle. <i>“Just go with it.”</i>");
	output("\n\nHe’s not listening. Really, the only thing on his mind is cumming, and that’s what his fingers are trying to enable. You wipe your [pc.cockHead " + x + "] across his asshole a few times before bucking forward, wasting no time and giving him none to adjust. Loud yelps and pleasured moans tear through his throat while your cock-tip languishes in the warm security of his cavern. You slide him down your shaft a few more inches, moistening his innards with more and more [pc.cumColor] pre, so much that it leaks back around.");
	output("\n\nStill stretching to your size, and still moaning to the tiniest pleasure-throbs, you drive into him all the way, placing a hand on his thigh to give a reassuring squeeze. Lava-like warmth spreads through your [pc.hips] and to the rest of you. His sphincter tightens around you, and the fresh smell of spunk hits your nostrils. Wet splatters of wasted seed bid you to look around - he’s clenched around his knot. He’s cumming already.");
	output("\n\nGuess he couldn’t hold back. Then you can’t stay passive either!");
	output("\n\nThe dosed-up korgonne looses a howl of delight when you slap your [pc.base " + x + "] to his asscheeks, hammering home in a consistent yet somewhat awkward rhythm. You reach a [pc.hand] around to his belly and us the other to fondle his sack or cock, whichever it feels like. Even though he started cumming a little early, you know it’s not the entire load. He’s only just started the process of releasing it. Knowing you have a few precious seconds of enjoying the alien-pup’s hole, you savor the slide of your [pc.cock " + x + "] through the frictious skin of his ring.");
	pc.cockChange();
	output("\n\nHe falls backwards into your shoulder, hyperventilating, his feet practically vibrating now. When he twitches, it sends a ripple inward like a communicative quiver. Pendulous up and down humps have his cock jacked by hand and yours squelching in the embrace of well-lubed korg-butt. With how easy it is for him to relax and pleasure you in return, you surmise that he mustn’t be a stranger to taking as well as giving.");
	output("\n\nCarefully, you lower your hands to his waist and interlock them, your knuckles rubbing against his tip on the rise and fall. You feverishly hump, feeling the steady trickle of dick-goo turn into a stream. The powerful need to orgasm wells up inside, budding at your core and blossoming through your limbs. It drives you to squeeze his belly, to grunt out praise for him, and to squeeze around his cock one last time.");
	output("\n\nYou try to hit every angle, searching for his cum-dispenser. You listen carefully to the notes in his blissed out voice until you strike his prostate on the most strenuous thrust. That’s where you aim from here. Loud <i>plat plat</i> noises sound when puddles of spooge form to the front of him. The sounds he’s making now could stir you to full mast later. As it is, they’re bringing you to the edge of full-body orgasm.");
	output("\n\nBoiling fluid surges up through you on the final thrust when you hilt your handsome hound. The korgonne’s voice moans into a climaxing roar of pleasure. It’s the voice of someone who is getting everything they want, who is happy with their place." + (pc.hasKnot(x) ? " His final act is to reach down and squeeze your [pc.knot " + x + "], perhaps expecting it works like his. It doesn’t lead to premature ejaculation, but it does speed along what’s already coming.":""));
	// PC low cum (<=500mL)
	if(pc.cumQ() < 500)
	{
		output("\n\nYour [pc.cum] spurts out in short, thin ropes of superheated fluid. It’s nothing to write home about, but the spasms they cause when painting his butt are. Animalistic warmth spreads through the both of you while it quickly reduces to a dribbly goo that sloughs inside and stays inside, swished and swashed around by the twitching of your [pc.cockNoun " + x + "].");
		if(pc.hasCocks())
		{
			output(" [pc.CumColor] ropes of relief lasso across your partner’s face from your unslotted cock" + (pc.cockTotal() > 2 ? "s":"") + ".");
		}
	}
	// PC oodles of cum (501-2999mL)
	else if(pc.cumQ() < 3000) 
	{
		output("\n\n[pc.Cum], hot as magma, bulges through your cum-vein, rushing to fill the space its offered. You gently thrust your [pc.cockNoun " + x + "] in and out, easing your load into his joy-inundated interior, plastering his walls and giving him an extra inch of gape when the column passes through your dilated urethra. His belly unfirms from your thick and unsedate climax, losing a bit of defined muscle as it rounds out to handle your load.");
		if(pc.hasCocks()) output(" His body’s not doing too well at that either. Your extra dick" + (pc.cockTotal() > 2 ? "s pump":" pumps") + " out so much that it whirls into the air and rains down on his head.");
	}
	// PC plenty of cum (3000-5999mL)
	else if(pc.cumQ() < 6000)
	{
		output("\n\nEvery muscle in his body locks when your [pc.cock " + x + "] swells with a urethral-bulging load of [pc.cum], depositing it right into his asshole and flooding him with [pc.cumColor] release. Bubbly-hot jizz washes throughout his interior and leaks back out. His abdominals disappear into a rounding gut, his body expanding in the only way possible to handle the volume of your fierce, keening orgasm.");
		if(pc.hasCocks()) output(" Your extra dick" + (pc.hasCocks() ? "s pump":" pumps") + " out giant wads of gunk that batter against the ceiling and drip down, if they don’t just fall like [pc.cumVisc] bullets on his head.");
	}
	// PC lots of cum (6000-10000mL)
	else if(pc.cumQ() < 10000)
	{
		output("\n\nThe korgonne thrashes when you cum, the first pillar of [pc.cum] shooting into his gut with such force that he reacts as if struck by lightning. His arms flail outward and his legs bounce about like he’s a carelessly handled ragdoll. The fluffy cum-receptacle can do naught but moan, helpless to do anything but accept the muscle-erasing belly he’s becoming the bearer of. All the liquid weight you pour into him sags him downward, easily shaming his own orgasm.");
		if(pc.hasCocks()) output(" Fat lines of [pc.cumNoun] fly into the air from your unholstered [pc.cocksLight], easily shattering against the ceiling and reversing momentum, raining in a [pc.cumVisc] shower on your fucktoy.");
	}
	// PC inhuman cum (>10000mL)
	else
	{
		output("\n\nIn a gaspless moment, you can’t be blamed for screaming when your [pc.cock " + x + "] erupts. Nor can he. A torrent of [pc.cum] powerful enough to launch into space breaks apart into a thousand droplets on the ‘ceiling’ above your [pc.cockHead " + x + "], followed by another, and another. His whole body seizes and thrashes, falling limp in your [pc.arms] while you flood his interior with so much cum that it backwashes. You’re not even sure if the pup was able to cum at any point, having no sense to realize that his belly is rounding out beautifully with the sheer volume you’re pumping into him.");
		output("\n\nYou shudder as the bubbly-hot spooge washes back out around your [pc.base " + x + "], coating your groin in [pc.cumColor] release. But you’re far from done. It’s easy to sympathize with him. He doesn’t look like he’s going to be doing any fighting in this position and... wait.");
		output("\n\nHe coughs, and a wad of [pc.cumNoun] launches from his maw, splattering next to the meager puddles of his own making. You shoot and shoot, and that repeats only once before you finally slump in the most amazing relief.");
		if(pc.hasCocks()) output(" He’s not going to be washing off any time soon either. Your extra [pc.cocksLight] " + (!pc.hasCocks() ? "has":"have") + " output a gunk-tsunami that’s despoiled the corridor just as much as him with its ruddy runoff.");
	}
	// Merge
	output("\n\nThe burden off your shoulders, you pull free of his sphincter" + (pc.cumQ() >= 3000 ? ", a [pc.cumVisc] deluge following your spent prick":"") + ". The drugged dogman flops to the side" + (pc.cumQ() >= 10000 ? ", a column of stuff spurting obscenely from his barren bum":"") + ", huffing contentedly. You’re the first to find strength to stand, gathering your things.");
	output("\n\nIt takes him a little longer to get up than you though, but when he does, he’s all smiles, even with a rather sharp looking spear in his hand. <i>“" + (!korgiTranslate() ? "Thanking alien heat-share. Bettering feels now. Can fight!":"Thank you for sharing heat, alien. I feel better than ever, enough to fight again!") + "”</i> he pounds his chest" + (pc.cumQ() >= 6000 ? " while his big belly wobbles":"") + ", gathering up his belongings and presenting you with a well-wrapped poultice. <i>“For troubles,”</i> he smiles, tail wagging when you accept the medicine. He " + (pc.cumQ() < 6000 ? "runs":"waddles") + " off before you can even consider responding.");
	output("\n\nNo reason to stick around now.\n\n");
	processTime(15);
	pc.orgasm();
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}

//[Keep Frotting]
// Tooltip: Shower each other in jizz.
// PC is offered this option if dick isn’t hyper.
// PC is automatically brought to this if Hyper, via Next.
public function keepuFrottuWang(x:int):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	// PC small/medium dick variant
	if(pc.cocks[x].cLength() < 20)
	{
		output("It <i>can</i> feel better.");
		output("\n\nYou shimmy up from your sitting position and lean forward like you’re fucking him missionary. He naturally reclines, no strength to assert back if he wanted. Your [pc.cock] stays planted on his");
		if(pc.hasCocks()) output(", and the " + (pc.cockTotal() > 2 ? "rest":"other") + " inhabit the nooks and crannies of his matted fur");
		output(". He growls in equal parts relief and arousal, perhaps glad he doesn’t have to work so hard for the release your presence promises. <i>“Just sit back, then,”</i> you grunt, hiking his legs over your shoulders, <i>“...and let it happen.”</i>");
		output("\n\nThe swampy feeling of dribbling so much fluid onto him is nearly orgasmic. Letting all that liquid pressure puddle out onto him produces a satisfaction that strengthens the buzz of dominant service in the back of your mind. On each thrust now your prejizz is able to reach other parts of his body, curtaining him fully in a glistening sheen of [pc.cumColor] goo.");
		output("\n\nRubbing urethras so fervently has dilated your internal plumbing as well as a tight pussy or ass could. It’s just waiting for the cum to justify its state now. It’s ready to enjoy dousing him in it. Your mind can only come up with all sorts of images that show him painted in [pc.cum], all returning the same opinion: <i>it’s going to be hot.</i>");
		output("\n\nSlick and slimed fur catches your [pc.cocksLight] when you thrust too far and his puppy-prick rockets back up, standing like a defiant statue, waiting to be put back in its place. You do so, holding your tools together, responding eagerly to the subconscious desire to rut his price like some unfinished pocket pussy.");
		if(pc.hasCocks()) output(" You grab " + (pc.cockTotal() == 2 ? "your other dick":"all your dicks") + " together, bundling them together for the hungriest of your frenzied poundings, watching his ebony lips strain into an outspread O.");
		output("\n\nHe lurches upwards in perfect sync with your forward swings, smashing into the stone below on the reverse. Drool rains from his cheeks and chin preceded by husky moans. You make sure to grind [pc.eachCockHead] against his" + (pc.hasKnot(x) ? " and your [pc.knots] to his":"") + ", maximizing his volume and enjoyment. Puddles of liquid musk are gushing out below, trickling in an unbroken cord.");
		output("\n\nFeverishly humping his crotch, you force your [pc.hips] into his like you’re trying to crater his pelvis. The overly-sensitive korg-man seems to purr now, copious lubricants trailing down his spongy fur. His nails curl into the rock at the same moment his spunk-hole visibly parts. It’s no surprise you turn your wild gropes to that too, palming over the urethral opening with roughness that makes him flail.");
		output("\n\nEventual lazy blinks warn you of his impending climax. He reaches for his knot, but just doesn’t have the strength in his saliva-slathered biceps to do anything with it. When you look into his unfocused green eyes, you can see only one thing: begging. He tries again to reach his knot, curling a thumb and finger around it, but falls to your heaving humps.");
		output("\n\nHe’s gotta cum. There’s no other way to discern this. Luckily, you’re right there with him. Your motions flag to more deliberate, thunderous strikes of [pc.raceShort] on korgonne" + (pc.balls > 0 ? ", hard enough for your [pc.sack] to bounce off his with tiny pangs of pain":"") + ". Audible slaps of body against body control the local air space. His tongue begins to loll, hanging from his steaming maw.");
		output("\n\nYou take firm hold of his dick and smush it into yours, fingers sliding down to the knot. When you squeeze it, you’re caught off guard by a veritable lance of cum squirting out with the twitch in his sloshing nutsack. The torrid wave arcs majestically through the air, breaking apart on and near the unconscious milodan just a few feet away. His screeching voice accomplishes the same for you... with a little languid caress of his paw to your [pc.base].");
		// PC low cum (<=500mL)
		if(pc.cumQ() <= 500)
		{
			output("\n\nYour [pc.cocks] spurt out every drop of [pc.cum] you’ve got to give. It’s not much, and it’s certainly not as much as his. Gouts of [pc.cumVisc] seed paint his cheeks, his neck, and his pecs. It’s enough to paint his fur with a few highlights of erotic relief while the remainder of his dribbles out into his crotch.");
		}
		// PC oodles of cum (501-2999mL)
		else if(pc.cumQ() < 3000)
		{
			output("\n\nHe can’t throw his arms up to block the thick wave of sperminess aimed at his chiseled frame. [pc.CumVisc] columns of spooge fire off from [pc.eachCock], sizzling in their travel through the crisp air towards their landing zone. From head to belly you paint him in a fresh layer of sloppy [pc.cumNoun], giving him a [pc.cumColor] set of highlights to enhance his coat of fur while you’re at it.");
		}
		// PC plenty of cum (>=3000mL)
		else output("\n\nHis head jerks back when your [pc.cocks] hose him down with room-flooding amounts of [pc.cum]. It catches you both by surprise, and absorbs the runoff of his orgasm where it lands, creating a multi-colored pool on the stone and on the canvas of his torso. All the excess semen that his fur doesn’t absorb gives him a nice, deep pool of [pc.cumVisc] spunk to bathe in. But you don’t stop there. What would be a dribble for others is still gouts for you... gouts that batter his face and make a sloppier mess.");
		// Merge
		output("\n\nFalling back in relief, you sigh airily, a line of [pc.cumNoun] falling from your swollen spunkslit to the floor before you stand on shaky legs. The korg-man rolls over and growls in pleasure, sounding fiercely satisfied. He stands and collects a spear from near the unconscious milodan, laughing that the fallen invader is stained in light of your heat sharing.");
		output("\n\n<i>“" + (!korgiTranslate() ? "Thankings to alien. All I needed more-know. Safe-stay!":"Thank you, alien. I needed that more than you know. Stay safe!") + "”</i> he says, not caring at all that he looks like he’s spent a day working in the scummiest skank-hole you can imagine.");
		output("\n\nOnce you’ve gotten your things together, you get back to the task at hand.");
	}
	// PC hyper dick variant
	else
	{
		output("\n\nBreathing hard, you spring forward, fucking his entire body and making a mockery of his maleness with your ");
		if(pc.cocks[x].cLength() < 36) output(num2Text(pc.cocks[x].cLength()) + "-inches of");
		else output("monstrous");
		output(" length. With little else to do, his legs shoot up and wrap around the biggest shaft of a cock rippling with joy. Your mind gives up on abstractism, common sense, anything that’s taking up your mental capacity better used for all the pleasure produced by the worship of an overwhelmingly turgid [pc.cockNoun].");
		output("\n\nSandwiched between heated rock and delightfully hot dick, the korg man twists around your totem pole like a ritual dancer. His fluffy hugjob has your [pc.balls] working overtime, coaxed and persuaded to give out the largest pre-gumballs " + (pc.balls == 1 ? "it":"they") + " can develop.");
		if(pc.cocks[x].cLength() < 36) output(" When those gigantic pearls emerge from your cumslit, they sag under their enormous weight and puddle in his mouth");
		else output(" Tremendous pearls of pre, like mini stellar objects, dribble down your shaft and drip into his maw with obscene splashes");
		output(", forcing him to take enormous gulps of liquid musk. Your cock-drool spreads your signature through his body, accelerating the swiveling of his limbs. Brazen moans tickle the underside of your [pc.cockHeadBiggest] and muscly thighs massage most of its length with great verve.");
		output("\n\n[pc.CockBiggest] saws the korgonne in half while he lavishes it with oral attention. Erratic flexes and strains along your gigantic phallus inevitably lead to your dilating urethra stretching wider and your cumvein swelling with as much pre as the average terran can output cum." + (pc.balls > 1 ? " Your ‘nads are swinging back and forth with such heavy motions that you can’t imagine how much [pc.cumNoun] you might shoot off now.":""));
		output("\n\nLike an animal clinging to a branch, the gruff dog-man latches on to your phallic obelisk, beckoning you to speed up. You plunge through the cocksleeve that is his entire body with long, languid thrusts of your [pc.hips]. Jaw slackening, your tongue hangs from your mouth, pooling saliva that nearly makes you choke on the backstroke. Carnal sensations too much for your mind to take lock your muscles; your oral organ bounces and flings spittle on every pleasure-spiking thrust.");
		output("\n\nHis failing grips shift to squeeze your tip and [pc.base] possessively. You can’t tell what’s a finger and what’s the drag of a tongue anymore. If he wanted, he could probably tongue-fuck your urethra, stuff it with his tongue until all your pre backs up and hoses him down, floods this corridor. If he did that, you could probably ruin this invasion - and the hold, really - by filling it with [pc.cum].");
		output("\n\nHe’s a good enough cock-slut to make it happen.");
		output("\n\nPrecum is streaming down the stony corridor anyway, and he’s bathing in several inches of it. Just dribbling in dick-goo and lurching back and forth is a strange kind of pleasure, but one that’s got you whining over the top of his voice. So coated in your own juices, you can’t even feel his cock anymore beneath the warm numbness");
		if(flags["LANDED_ON_TEXAS"] != undefined) output(" beneath the thick layer of pre that’d have the entirety of New Texas lining up for a taste");
		output(".");
		output("\n\nBlunt-clawed fingers dig into your rigid veins, mapping the blood-filled schema of your colossal cock. The tiny blockages create pockets of pressure that relieve in widely different ways. The result is always the same though: you fall further and further apart, little more than [pc.aRaceShort] controlled by a string. A big string: your [pc.cock]. It’s all that matters.");
		output("\n\nSavage cries echo down the corridor; you haul forwards and backwards, ripping your throat apart with all the air stored away in your lungs. Thunderous thrusts and quick yanks gush [pc.cumColor] goo that puddles and sparkles in what light there is, nicely complementing what sloshes in on the next pump. Shudders interrupt your once consistent rhythm. You’re close to begging him to move faster, thinking it’s not enough to give you the release you crave...");
		output("\n\n...But he knows exactly what you both need.");
		output("\n\nHis now ponderous pace smothers and strains your [pc.cock] until it changes color. It throws your head back, dilating your [pc.eyes] to the size of dinner plates. Your mind focuses on the pleasure only a gifted hypersexual could know. Fully-soaked fur strokes noisily across the tenderest spots, and now you’re spurting thick gobs of pre. Glazed muscles tighten when they rub you in the opposite direction of your thrusts, smashing into a tighter vice.");
		output("\n\nYou can feel it now. Dizziness gives up the assault only to be replaced by ecstasy. You moan in mindless bliss as your " + (!pc.isGoo() ? "tendons burn":"body burns") + " from the reaming. You don’t care. <i>It’s coming.</i> You drill home, hard enough to feel your pre-pumping organ" + (pc.hasCocks() ? "s":"") + " preparing to pour out its lusts, to leave a mark befitting its size and shape. One last time and you slam in so hard his feet kick into your gut" + (pc.balls > 0 && pc.ballDiameter() >= 2.5 ? " and your weighty sack rams into his crotch":"") + ". All the pressure releases at that dick-swelling moment, and the familiar wetness and tightness of orgasm saturates your soul in that reflexive impulse to ejaculate.");
		// low cum (<=500mL)
		if(pc.cumQ() <= 500)
		{
			output("\n\nYou climax, but it’s pathetic. " + (silly ? "No offense, but that’s just silly! How can you have such big hot dick and only be able to trickle seed? ":"") + "Compared to all the pre you’ve dribbled, [pc.cumVisc] [pc.cumNoun] drips from your leaky pipe, puddling weakly and washing away down the rivers of inferior liquids. Still, the korgonne cums at the same time, drowning out your [pc.cumColor] load at the top of his convulsing peak.");
		}
		// oodles of cum (501-3999mL)
		else if(pc.cumQ() < 4000)
		{
			output("\n\n[pc.Cum] spurts out directly onto the korgonne’s head. He can move, but you can’t, and he uses that privilege to catch your [pc.cumVisc] orgasm in different places. A particularly fat line paints his elongated snout. The most of it ends up on his tongue, and when he swallows he spasms beneath your cock, squirting creamy white puppy-seed all over himself. And the underside of your bursting rod.");
		}
		// plenty of cum (4000-10000mL)
		else if(pc.cumQ() < 10000) output("\n\nThe hapless hound couldn’t have asked for a better partner. You share your heat in long, heavy ropes that spatter down the hallway. The [pc.cumNoun] splatters can be heard from the other end. When you get your dick under control, the rest burst out across his face and drown him in a pool of [pc.cumVisc] [pc.cumColor] spooge. His ecstatic scream is muffled by the waves of spooge spraying in nearly unbroken streams from your rod, pooling around him, pooling on him, flowing from the declinations of his [pc.cumNoun]-basted form.");
		// inhuman cum (>10000mL, add-on to plenty)
		if(pc.cumQ() >= 10000)
		{
			output("\n\nYou’re still climaxing. You’ve gone from spraying fuckjuice to just blasting it in geyser-like eruptions. He sprawls in the sloughing puddle building up around his body. The source is your dick. It comes from your straining urethra, it rains from the ceiling like ambrosia from the korgonne deity. He tries to gulp down the [pc.cumFlavor] jism that lands in his hoarsened mouth. You fall backwards, and the last massive pulses completely web him in your outpourings. If you didn’t know better, you would think this is some monstrous experiment gone wrong.");
			output("\n\nBut really, it’s just a funny-talking dog cocooned in spunk.");
		}
		// Merge
		output("\n\nSatisfied, you let your [pc.cocks] go flaccid, making ready to move on. The sexy korg-man looks up to you after wiping the spooge from his eyes. <i>“" + (!korgiTranslate() ? "Perfect helpings... Safe-staying, alien...":"It was perfect... stay safe alien...") + "”</i> he groans, content to stew there in your sex-scent. <i>“Take medicine,”</i> he points to one of his scattered belongings, singling out a well-wrapped poultice.");
		output("\n\nFine by you.\n\n");
	}
	processTime(12);
	pc.orgasm();
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}

//[Get Fucked]
// Tooltip: He’s pent up and needs a place to put all that cum. Why not in you?
// If PC has both, then the player chooses between Vag or Ass.
// Taurs and Neuters allowed.
// Can impregnate the PC if doing vaginal - slot it into Generic Korg Pregnancy.
// If PC is in heat, automatically go with Vagina.
public function getFuckedByKorgo(x:int):void
{
	clearOutput();
	showDosedKorgMale();
	author("William");
	
	var ppKorgMale:Creature = new KorgonneMale();
	
	// PC not in heat
	if(!pc.inHeat()) output("There’s no better way to share heat. A lot of things are rushing through you right now, but the primary thoughts all come from what you see when you shifted his loinwear aside. A pent-up korgonne, a sexy, handsome, fluffy specimen of his race all to yourself, made ready by his previous scrap with one of the invaders. He stares up at you imploringly, a tiny smile crossing his muzzle when " + (!pc.isCrotchExposed() ? "you throw off your equipment and":"you") + " plant a hand to your " + (x >= 0 ? "[pc.pussy " + x + "]":"[pc.asshole]") + ".");
	// PC in heat
	else 
	{
		output("He wants to share heat? Then he asked the right person. You’re <b>in heat,</b> and a young, virile korgonne is waiting right there for you, made ready by a nefarious drug-dart, backed up with so much cum you’ll bear multiple kids in his image. Answering his call for help is something you do with profound ease. You don’t care that your biology is overwriting everything else. Your brain reminds you every second how good of an idea it is to let him fuck you, to pump you full of kids, to extinguish your infernal need with every single sperm in his body right now.");
		output("\n\nThere’s absolutely no chance you won’t conceive.");
	}
	// Merge
	// PC bimbo
	if(pc.isBimbo()) output("\n\n<i>“Let’s get that taken care of all proper-like!”</i> you rock your hips, eyes dilating with hunger. You gaze longingly at his dick, feeling your heartbeat match the throbs of pre oozing out of the tip. <i>“Come ‘n give me all of it,”</i> you moan" + (pc.biggestTitSize() >= 1 ? ", cupping your [pc.breasts] together in a gleefully whorish display":"") + ". After a little tease, you hop to the nearest wall and playfully slapping your [pc.ass]" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", your [pc.tails] fluttering happily":"") + ": <i>“Right here!”</i>");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“It’ll be good for the both of us. Come on, up, and make it quick,”</i> you say with a muscly flourish, walking over to the nearest wall" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", [pc.tails] wagging as you go":"") + ".");
	// PC kind
	else if(pc.isNice()) 
	{
		output("\n\n<i>“I’m here to help. I think I can spare a few minutes for you, big boy,”</i> you say, smiling cutely, ushering him to the nearest wall");
		if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" while your [pc.tails] happily wag" + (pc.tailCount == 1 ? "s":""));
		output(".");
	}
	// PC misch
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Alright, you better fuck as good as you look, otherwise I might regret helping you out,”</i> you wink, crooking a finger and beckoning him to the nearest wall");
		if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("while your [pc.tails] wag" + (pc.tailCount == 1 ? "s":"") + " expecting only the best");
		output(".");
	}
	// PC hard
	else output("\n\n<i>“Don’t keep me waiting then,”</i> you grunt, being rather blunt in the way you beckon him to the nearest wall" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", unable to keep your [pc.tails] from wagging in anticipation":"") + ". <i>“And don’t make me regret it.”</i>");
	// Merge
	output("\n\nLooking over your shoulder, you see the korgonne man staring wide-eyed at your [pc.ass]. For a second, you think he gulps at the presentation. He finally finds the sense to stop masturbating when his view is dominated by [pc.raceShort] butt, sagging forward and crawling in your direction with a slight whimper.");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" You wiggle a finger under your [pc.crotchCoverUnder] and slide the protective material down halfway, baring your [pc.vagOrAss " + x + "] to the crisp air with a teasing shake.");
	else output(" You run a [pc.hand] " + (!pc.isTaur() ? "over your ass ":"") + "towards your [pc.vagOrAss " + x + "], teasingly shaking your rump.");
	output("\n\nYour partner’s tongue lolls in supplication, almost unbelieving that you’ve offered yourself up just like that. It takes a backwards nudge to get him going, though. When you smother his face with your glistening derriere you wince from temperature contrast, using your body to tell him <i>“Hurry up!”</i> in the most informal way possible.");
	output("\n\nStoked by your physicality he pushes you back into the wall until your cheek is pressed to the stone. You’re filled with wondrous warmth when you feel his tongue crawling " + (pc.hasVagina() ? "down your crack towards your [pc.pussies]":"up your crack towards your [pc.asshole]") + ". His aggressions and savage desires pour out uninhibited, manifesting as feverish licks and rough gropes from ass to thigh, and you find that you’re braced for those and not just comfort.");
	// Using Vagina
	if(x >= 0)
	{
		output("\n\nHis tongue swims through your [pc.vaginaColor " + x + "] crease, soaking your " + (pc.vaginalPuffiness(x) > 0 ? "chubby ":"") + "delta in more spit than girly juice, clearly obsessed with the [pc.girlCumFlavor] scent of [pc.raceShort]. The way his oral organ undulates against your netherlips, coaxing out your [pc.clits] and parting your shimmery folds portends an encounter to remember. He licks and he licks, practically mopping your pussy with his facial fur.");
		output("\n\nIt’s at that moment you feel his nose ‘boop’ off [pc.oneClit], following up with a suckling lick that trails thickly to the center of your feminine entrance. First his tongue slithers inside, its narrow, flat shape perfect for that slit-servicing purpose. Muffled whimpers vibrate through your freshly cleaned muff, coming back up your throat when you feel part of his elongated face slipping inside for a taste of your silken walls.");
		output("\n\nYour partner is rewarded with a fresh rain of [pc.girlCumNoun] when a mini orgasm steals your muscle control away. That’s fine, because he’s holding you up. ‘Course, when you fall into him, that just makes you cum all over again when his upper jaw glides into your plush passage. Little more than a blissful wreck, there’s something unmistakably arousing about all this.");
		// Suula or Aphro Pussy
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nOn the next particularly penetrative oral thrust, the tawny pup is stung by your venom-bearing cilia. Tiny tendrils sting the full length of his tongue and some of his face, flushing his restraint in a tide of chemical lust. He must have turned crimson that instant, because everything got hotter down there. You can’t even begin to imagine the effect two different types of arousing drug will have on his system.");
		// Merge
		output("\n\nUnder all of his animalism and feral desire, he is still in total control of you and your pleasure, and you can’t imagine something hotter than that right now.");
	}
	// Using Ass
	else
	{
		output("\n\nHis tongue swirls your [pc.asshole]" + (pc.analPuffiness() >= 2 ? ", caressing the obscenely inflated flesh in a half-trance state":"") + ", wettening your taint with warm spit. Dappling sweat is sucked up in his lusty haze" + (pc.hasVagina() ? (", and there are moments he falls towards your [pc.vagina], only for you to remind him of what he’s allowed to have"):"") + ". The korg-man’s paws spread your ass cheeks wider, exposing your once-hidden sphincter to the air and further abuse.");
		output("\n\nBefore you can snap about the frozen feeling on your butthole, he envelops your backside with his whole mouth, raking his tongue up and down the narrow, winking entrance. Smooth canine tongue slows from rampagingly fast to slow and flicking, always flourishing at the end of his up-and-down pressures. On the next gulp of what you presume is the sweat he " + (pc.hasFur() ? "sucked from your fur":"slurped from your [pc.skinFurScales]") + ", dizziness assaults you the moment his tongue glides through unopposed.");
		output("\n\nYou cry out in pure, wanton need, wriggling uncontrollably against his probing flesh, circling the fringes of your chute. Spittle leaks from your cavern as the seconds tick by, parted by dusky lips and throaty groans. You almost cum, but he stops just before you do. You’re left a quivering wreck steadied only by the wall and his body - the realization that he is in full control of you and your pleasure is an unmistakably arousing one...");
	}
	// Merge
	output("\n\n");
	if(pc.libido() < 33) output("Somehow, the alien dog’s lusts have unlocked a wilder side in you. If he wanted to make you his mate, you’d be hard pressed to resist your urges.");
	else if(pc.libido() < 66) output("You merely offered relief, and he’s given his all for your pleasure in return. You feel like you could cum on the spot if he looked at you hard enough, or if you thought long enough about how much of a beast he’ll be like when he ruts you.");
	else output("Excitement flows through you like lifeblood. His lusts have turned you into the most willing cumdump. Offering help is great, but to think that you’re about to be the target of his bestial affections is making you cum again and again. If he can treat you like this with his tongue...!");
	output("\n\nInspired by your reactions, and your increasing clamor for more, the " + (x >= 0 ? "cunt-kissing":"butt-loving") + " pup focuses on other parts of your body.");
	// PC butt <=5 (add-on, no new pg)
	if(pc.buttRating() <= 5) output(" His tongue paths over your petite rump, clapping his hands off the " + (pc.tone < 5 ? "soft":"muscled") + " cheeks in alternating spanks. Your firm tush offers no eye candy in return, only tiny ripples. Although you don’t have an appreciable jiggle, he delights in the sounds you make when he squeezes and adores it. <i>“" + (!korgiTranslate() ? "Alien small-rear... Pleasant.":"You’re small, alien... It’s pleasant, in a way.") + "”</i>");
	// PC butt 6-12 (add-on, no new pg)
	else if(pc.buttRating() <= 12) output(" Your jiggling tush captivates him when he leaves your [pc.vagOrAss " + x + "] alone, and you almost whine when he pulls out to enjoy the wobble after he claps his hands to your hand-filling [pc.skinFurScalesNoun]. Awed heaves warm your quaking moons with puffs of worshipful air. While you want his tongue back on your [pc.vagOrAss " + x + "], you hope that he’s enjoying everything about your shapely bottom. <i>“" + (!korgiTranslate() ? "Alien butt is bounty. Perfect mate-partner.":"Your butt is a bounty on its own, alien. You’d be someone’s ideal mate...") + "”</i>");
	// PC butt >=13 (add-on, no new pg)
	else
	{
		output(" <i>“" + (!korgiTranslate() ? "Alien is... Wondrous-big...":"Alien... you’re wonderfully big...") + "”</i> the korgonne husks, slapping at your [pc.ass] with wild abandon. He doesn’t just tongue over your [pc.skinFurScales], he gropes it, he plays with it, he watches all the fat on your ass wobble enticingly. His fingers leave imprints that lash the rest of your body with a feeling of possession. He loses his face into your deliciously smothering jiggle. Ripples fan out past your waist while breathy pants of joy warm your [pc.asshole].");
		output("\n\nHis love and worship for your [pc.ass] nicely complements your arousal to this point, and you’re perfectly happy to let him enjoy it. It’s not often you get to experience the kind of ecstatic kneading a true appreciator of callipygian luxury can provide. Overwhelming praise for your form crashes up his throat until he’s repeating himself. <i>He loves your butt.</i>");
		output("\n\nYou hope he likes fucking it, too.");
	}
	// Merge
	output("\n\nThe hungry hound’s tongue dips back into your rear cleft, bringing its heavenly heat back to your [pc.vagOrAss " + x + "]. Your [pc.hips], firmly in his strong grasp, stubbornly resist being held down. Despite his hold you still sink further down, an instinctual urge to place yourself lower than him" + (x >= 0 ? ", to look like the ready breeding partner you are":"") + ". He drinks in loads of [pc.raceShort]-flavored sweat, intensifying his thirst with each swallow.");
	// PC not in heat
	if(!pc.inHeat()) output("\n\nHe’s got you nice and pliant, and you can’t wait any longer. You cry out for him to take you then and there before you go mad from unsated arousal. Bubbling over with bliss, you smile and shake your butt just a little harder in four directions, begging with your [pc.eyes] and pursed [pc.lipColor] lips.");
	// PC heat
	else output("\n\nYou can tell your fertile pheromones are having a strong effect on him. Your [pc.legOrLegs] are trembling in his paws, shaking with the desire to bear children. They don’t react in pleasure, only havoc, disdain. You need his cock, and you need it now. Crying out in pure, delirious want you beg him to fuck you, to shove his cock so far in that his knot breaks you apart, and then he can fuck your knot in while he delivers all that seed straight to your womb. <i></b>Your ovaries need to be drowned in cum!</b></i>");
	// Merge
	output("\n\nYou shriek in joy, hyperventilating when he stands and presses his crotch into your rear, rubbing the head of his pre-glazed cock to your [pc.vagOrAss " + x + "].");
	// PC not Taur, PC Height <=5' 2" (add-on, no new pg)
	if(!pc.isTaur() && pc.tallness <= 5*12+2) 
	{
		output(" The way he dominates your small form with the entirety of his rough-hewn body fills you with ecstasy. ");
		if(pc.biggestTitSize() >= 1) output("He grabs " + (pc.totalBreasts() == 2 ? "both of":"a set of your") + " [pc.breasts], grunting approvingly. ");
		output("On some primal level you feel safe, secure, and <i>claimed.</i> Wrapped in his arms you aren’t going anywhere. You wouldn’t want to anyway, not when your furry mate keeps you warmly docile underneath his powerful physique. Mounted on you, he only has one goal in mind: to " + (x < 0 ? "fill your [pc.asshole]":"breed your [pc.pussy " + x + "]") + "." + (pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " You coil your tail around his waist, bringing him a little closer to do just that.":""));
	}
	// PC not Taur, PC Height >=5' 3" (add-on, no new pg)
	else if(!pc.isTaur()) 
	{
		output(" Your korgonne lover imposes himself on you in an ecstatically thrilling way, enveloping as much of your body as he can with his rough-hewn musculature. ");
		if(pc.biggestTitSize() >= 1) output("He grabs " + (pc.totalBreasts() == 2 ? "both of":"a set of") + " [pc.breasts], growling approvingly. ");
		output("You wiggle back into him, putting a [pc.hand] over his paw and rubbing at his tensed knuckles. He’s got you pinned against the wall and his cock pointed at your [pc.vagOrAss " + x + "]. You could get out if you wriggled hard enough, but shirking the protection of his dominant embrace is not something that crosses your mind for even a second." + (pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " Instead, you wrap your [pc.tails] around his waist and pull him closer.":""));
	}
	// PC taur
	else output(" Rough paws grip the sides of your [pc.ass] and force you down slightly. The korgonne aligns himself with your [pc.vagOrAss " + x + "], growling when you buck upwards from the touch of his cock to your " + (x >= 0 ? "slit":"sphincter") + ". The anticipation of this dosed up and lusty beastman fucking you the way you need to be is killer. Passive moments lead you to attempt insertion on your own, but all you get is a slap on the ass and a gruff bark telling you to hold still. Being manhandled like this only makes you crazier, because it makes him crazier. Fuck, could he just start!?");
	// Merge
	output("\n\nAfter " + (x >= 0 ? "shining himself in your accumulated juices":"smearing his prick with copious pre") + ", the korgonne humps against your body, grunting at the nadir of his whimpering thrusts. You look " + (!pc.isTaur() ? "down":"back") + " to see his green eyes incandescent with arousal. When you feel his furry nutsack clap against your nethers you let out a tiny squeak, body shaking in another small orgasm. He languishes in the warmth for only a moment longer, rearing back - your fingers dig into the rock, a reflex one inevitably gets when they’re about to be " + (x < 0 ? "anally":"vaginally") + " hammered.");
	output("\n\nThere’s absolutely nothing gentle about the way he howls and rams into you");
	var looseness:Number = pc.ass.looseness();
	if(x >= 0) looseness = pc.looseness(x);
	if(looseness < 3) output(", fighting against the tightness of your [pc.vagOrAss " + x + "] on his way. Even with how well prepared you were beforehand, there was a spike of pain when he lanced you down to his knot");
	else output(", finding purchase in the welcoming embrace of your well-fucked [pc.vagOrAss " + x + "]. You accept him readily enough, but there’s a spike of pain when he smacks his knot into you");
	output(". Eager heartbeats pound against the walls that squeeze him tight as your vision adjusts to his unrestrained aggression.");

	if(x >= 0) pc.cuntChange(x,ppKorgMale.cockVolume(0));
	else pc.buttChange(ppKorgMale.cockVolume(0));

	output("\n\nOnce he lets you adjust to his puppy-prick, he takes you to the pound. He heaves and growls, clutching you tight. His animalistic dick rails you in long, rapid beats, pulling out to its thin head and launching back inside on burly hips. You can’t be blamed for how broken up your voice is by his feral fucking. Your voice reduces on every impact, climbing back up only to be muffled again" + (pc.biggestTitSize() >= 1 && pc.isLactating() ? ", all while he squeezes out a fresh stream of [pc.milk] from your boobflesh":"") + ".");
	output("\n\nYou can feel every twitch and throb ");
	if(x >= 0) output("inside your flexing [pc.pussyNoun " + x + "], your walls parting like a sea for his veiny lance");
	else output("within your deepest recesses, his tip battering against new surfaces each time" + (pc.hasCock() ? ", coming so close to your prostate":""));
	output(". Feverish humps bring you to the tell-tale crescendoing of orgasm");
	if(pc.isHerm()) output(", [pc.eachCock] and [pc.eachPussy] spurting out mixed, gushy loads");
	else if(pc.hasVagina()) output(", [pc.eachPussy] adding more and more [pc.girlCumVisc] lubrication to the action");
	else if(pc.hasCock()) output(", [pc.eachCock] helplessly flopping and squirting tiny ropes of [pc.cumNoun]");
	output(".");
	output("\n\nThe satin-soft embrace of your [pc.vagOrAss " + x + "] is something he intends to enjoy to its fullest. Through his cock you can feel the crazy beating of his heart. Every time he drills home you feel his softball-sized knot slapping insistently at your " + (x >= 0 ? "spread [pc.vaginaColor " + x + "] walls":"[pc.asshole]") + ", perhaps trying to drive itself inside. You hope for it.");
	output("\n\nYou try for it. He yelps back at you when you squeeze him tight, rocking your hips slightly against his ass-locked lap. <i>“T-Think you can get it in t-there?”</i> you stammer.");
	output("\n\nLurching forward, still held tight " + (!pc.isTaur() ? "in his meaty arms":"by his iron-grip") + ", you push back and wiggle again, starting to miss his rampant pace. Husky moans tear through his throat while he does the same, grinding his bitch-breeder against your hole, trying to spread you that much wider so he can fuck it into you." + (pc.biggestTitSize() >= 1 ? " Your [pc.breasts] wobble from all the pressure.":""));
	output("\n\nAs if struck by lightning your whole face twists in agonized ecstasy, a tiny pop swirling through your [pc.ears] for one brief moment. <i>He succeeded.</i> Spittle falls from your mouth in long strings, and all of a sudden his rock-hard fingers dig harder into your [pc.skinFurScalesNoun]. He pulls out, and your powerful sense of fullness abates... only to return in the next second when he plows into you, knot included. The raw sensations don’t end there: you’re seeing fireworks and exploding stars when ropes of cum squirt into your innards,");
	if(x >= 0) output(" plastering your [pc.girlCumNoun]-flooded interior");
	else output(" squelching past your " + (pc.analPuffiness() > 0 ? "engulfing ":"") + "ring of anal flesh");
	output(".");
	output("\n\nHungry for " + (x >= 0 ? "cunt":"ass") + ", the korg enters a berserk state, frantically fucking you from orgasm to orgasm. All you can do in your state is moan, cum, repeat. Cushiony skin parts for his magnificent member. His seed-stuffed sack bounces and sloshes against your well-fucked hole. You both clench up and tighten, you especially when you feel a heavy twitch in his cumsack.");
	output("\n\nAll of a sudden he grabs you by the ");
	if(!pc.isTaur()) 
	{
		output("shoulders, pulling you away from the wall and forcing you down on your knees, his knot still inside you, still spurting small amounts of spunk into your [pc.vagOrAss " + x + "]. He forces your head to the ground and your ass into the air, asserting himself on you without hesitation");
		if(pc.tailCount > 0) output(" by grabbing " + (pc.tailCount > 1 ? "a [pc.tail]":"your [pc.tail]"));
		output(".");
	}
	else output("rear, forcing you down on your knees and mounting your backside without hesitation. His knot still lodged inside, still spurting tiny amounts of spunk into your [pc.vagOrAss " + x + "], he prepares to fuck you like never before.");
	output("\n\nOverwhelmed by your masculine partner’s ferociousness, " + (!pc.isTaur() ? "you clutch the paws gripping your [pc.chest]":"you clutch the wall pushing back against your [pc.face]") + ". He pumps so deeply that you can feel his sheath crinkle up around your " + (x >= 0 ? "slit":"crease") + ". It makes him moan so loudly, too, like fluid trickles out and gets into the space between it and his cock. Your moist [pc.lipColor] lips stretch into an ‘O’ of delight. You’re in a bliss-filled ditch being fucked by an ideal mate, feeling the pleasure rise and crest.");
	output("\n\nIt’s all about his pleasure now. His pleasure is your pleasure. Your brain is totally occupied with thinking about how great it’ll be when he cums, how perfect a situation you’ll be in when he knots you");
	if(pc.hasVagina()) output(" and breeds you");
	output(". It feels great. Better than great... divine. Completely lost to excess, he shows no mercy when he handles you now, and you don’t want him to anyway." + (pc.hasLongEars() ? " In fact, when he shifts to grip your [pc.ears] and tug your head back, you’re all smiles.":""));
	output("\n\nHe misses out on the beginning your climax. It isn’t until your voice reaches its highest pitch and slowly dies down that you melt into his unbreakable grasp and clamp down around his cock on its final thrust. Your whole body shakes hard and you slump forward. He falls onto your back and, burrowed down to his pricksheath, cums. The first thick rope to hit your " + (x < 0 ? "colon":"cervix") + " shatters your thoughts to pieces. The horny korg’s second viscous rope makes you feel lightheaded.");
	output("\n\nClimax rushes down your spine; you would thrash and explode if he wasn’t latched onto you like the dutiful mate he is. Spittle froths in your mouth while your ");
	if(pc.isHerm()) 
	{
		output("[pc.cocks] helplessly balloons and burst" + (pc.cockTotal() == 1 ? "s":""));
		if(pc.cumQ()< 50) output(" thin streams");
		else if(pc.cumQ() < 1000) output(" thick cords");
		else output(" torrential waves");
		output(" of [pc.cumNoun] that paint the floor under your belly, followed by " + (!pc.isSquirter() ? "oozing strings":"wet splurts") + " of [pc.girlCumNoun]");
	}
	else if(pc.hasVagina())
	{
		output("[pc.pussies] plump and " + (!pc.isSquirter() ? "ooze feather-light lines":"force out loin-soaking squirts") + " of [pc.girlCum]");
	}
	else if(pc.hasCock())
	{
		output("[pc.cocks] balloon, twitch, and erupt with ");
		if(pc.cumQ() < 50) output("thin streams");
		else if(pc.cumQ() < 1000) output("thick cords");
		else output("torrential waves");
		output(" of floor-painting orgasm, drawing lewd art with [pc.cum]");
	}
	else output("whole body vibrates outward from the center in a blissfully warm sensation of release");
	output(".");
	output("\n\nThe once-bloated knot deflates inside you, venting its pressure straight into your " + (x < 0 ? "intestines":"womb") + " while still maintaining enough girth to lock his crotch to yours, to seal it all inside in a most depraved position. You’re too fuck-drunk to care, and your eyes nearly roll back while you spasm. His slowly-emptying cum-factory eases you through the afterglow with its rhythmic pulses and twinges.");
	output("\n\n" + (x >= 0 ? "Your womb accepts every drop of his torrid virility. Goo splatters your insides, sliding down to your ovaries. The arms bear hugging you right now make the sensation all the more better.":"Your belly swells a bit with the sheer volume of his locked-in load. Warm goo sloughs through your interior, and you bet the arms bear hugging you right now are helping guide its passage."));
	output("\n\nA warm hand rubs over your head" + (pc.hasHair() ? ", threading your [pc.hair] between its fingers":"") + ". " + (pc.hasEmoteEars() ? "The soft skin behind your [pc.ears] is ravished with attention by his needle-tipped fingers. ":"") + "The momentary adoration helps you pass the minutes until his knot deflates enough to pull out, a few sticky lines of korg-spunk connecting his tip to your slightly gaped hole. He lets you down gently, crawling over to plant a wet kiss on your [pc.face].");
	output("\n\n<i>“" + (!korgiTranslate() ? "Wonderful-shares, alien. Thankings for all time. Safe-staying, please...”</i>":"Our bonding was wonderful, alien. You have my thanks for all time. Stay safe, please...") + "”</i> he whispers, kissing you on the lips and then the [pc.ear] before standing.");
	output("\n\nHe collects a spear and re-dresses what little he has, gathering his scattered belongings before nodding at you. By your side he places a medicinal pack, herbs tied together by gauze. <i>“For troubles,”</i> he says gruffly, hurrying off afterwards. When you can finally stand, a little cum leaks out while you gather your things and do the same. Hopefully he’ll stay safe, too...");
	output("\n\n");
	if(x >= 0) pc.loadInCunt(ppKorgMale,x);
	else pc.loadInAss(ppKorgMale);
	processTime(12);
	pc.orgasm();
	var poulties:HealingPoultice = new HealingPoultice();
	poulties.quantity = 2;
	quickLoot(poulties);
}