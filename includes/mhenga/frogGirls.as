import classes.Characters.FrogGirl;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
//Summary
//frog grills. not much i would consider gamebreaking here. new tf. unique random proc event. drop their tf as loot.

//Mechanics and such
//tf
//https://docs.google.com/document/d/180f-MSkg1GbLcjWtxRkCfcK7X2cnVECwBrvyYn3AJfM/edit?usp=sharing

//Parser tags for skin color
//Set these all in skintone for the mob.
/*
"orange and green" 
"mottled brown" 
"black and gold" 
"black and blue" 
"black and red" 
"black and purple" 
"red and blue" 
"black, blue, and yellow" 
"gold"
*/

//[kerokorasSkinDetail]
public function keroSkinDetail(tEnemy:Creature = null):String
{
	if (tEnemy == null) tEnemy = enemy;
	
	if(tEnemy.skinTone == "orange and green") return "bright orange with splashes of pale green";
	else if(tEnemy.skinTone == "mottled brown") return "mottled earthy brown with muddy spots";
	else if(tEnemy.skinTone == "black and gold") return "pure inky black with patches of gold on her upper body";
	else if(tEnemy.skinTone == "black and blue") return "sea blue with black blotches along her back and sides";
	else if(tEnemy.skinTone == "black and red") return "dark inky black with vibrant blood red patches across her body";
	else if(tEnemy.skinTone == "red and blue") return "vibrant red with deep blue arms and legs";
	else if(tEnemy.skinTone == "black, blue, and yellow") return "blue striped black legs with a bright yellow upper body";
	else return "solid sparkling gold";
}

public function showFrogGirl(tEnemy:Creature = null):void
{
	if (tEnemy == null) tEnemy = enemy;
	showBust(tEnemy.bustDisplay);
	if (inCombat()) showName("FIGHT:\nKEROKORAS");
	else showName("\nKEROKORAS");
}

public function frogGirlsEncounter():void
{
	author("Gardeford");
	var tEnemy:Creature = new FrogGirl();
	showFrogGirl(tEnemy);
	IncrementFlag("MET_KEROKORAS");

	//First Encounter
	if(!CodexManager.entryUnlocked("Kerokoras"))
	{
		output("\n\nThe over-sweet scent of decaying vegetation mixed with the sour scent of stagnant water reaches your nose as you push your way through the dense foliage and come upon a small bog lake covered in algae and violet hued lilypads as big around as a hoverskiff’s braceplate.");
		output("\n\nYou can hear the buzzing of insects and the occasional cry of birds high above you, however it is a deep and resonant <i>“Croooooooak!”</i> that draws your attention. You spin towards the sound to find a lithe " + tEnemy.skinTone + "-skinned creature rising up from the murky bog water.");
		output("\n\nIt is impossible to tell the creature’s gender at first, with a complete lack of secondary sexual characteristics, it just looks boyish and sleek, an effect that is amplified by the light refracting off the beads of water running along its skin. It isn’t until it is fully out of the water and standing that you can see that it is female. A kerokoras, according to your codex's yammering.");
		output("\n\nHer amphibious body has more in common with frogs than anything else, despite her humanoid figure. Her skin is a " + keroSkinDetail(tEnemy) + ", and is completely devoid of hair or fur. She looks at you with her large golden eyes and sniffs at the air curiously through her broad spaced nostrils, which draws attention to the lack of a nose on her rather smooth face. Her wide mouth turns into a grin and she croaks out, <i>“I smell ‘man...”</i>");
		// Seems predicated on smell/scent, hence cockcheck rather than mf()
		// hasCock: 
		if(pc.hasCock()) output("\n\nShe starts to walk towards you, her narrow hips swaying sensuously with her every step. Her webbed hands draw up over her smooth belly and across her flat and featureless chest before sliding behind her neck as she gives you a lust filled look. Clearly she is trying to seduce you with her androgynous body.");
		// !hasCock:
		else output("\n\nShe starts to walk towards you, her narrow hips swaying sensuously with her every step. Her webbed hands cross defiantly across her flat and featureless chest before she levels her gaze at you. The posture of her androgynous body is one of frustrated hostility. It looks like you have a fight on your hands.");

		output("\n\n");
		processTime(3);

		if(pc.lust() >= 33 && pc.hasCock()) 
		{
			output("It looks like you have two real options. You can either let her ravish you, or you can try to fight her off. The choice is yours.");
			//[Ravish]**	[Fight]*
			//(* Proceed with the (lust < 40) text.)
			//(** loss by lust, but without any resistance.)
			clearMenu();
			addButton(0,"Fight",configFrogGirlFight, tEnemy);
			addButton(1,"Submit",submitToFrogSex, tEnemy);
		}
		//(hasCock && lust < 41):
		else
		{
			output("Her eyes narrow when you don’t immediately respond to her advances and her grin fades into a bit of a scowl. What do they say about a woman scorned? It looks like it’s a fight.");
			clearMenu();
			addButton(0,"Next",configFrogGirlFight, tEnemy);
		}
		CodexManager.unlockEntry("Kerokoras");
	}
	else
	{
		//Repeat Encounter
		output("\n\nA lusty resonant croak once again signals the appearance of a kerokoras woman, this one " + tEnemy.skinTone + " skinned.");
		if(!pc.hasCock()) output(" It sighs, apparently annoyed that you aren’t male.");
		if(pc.lust() >= 33 && pc.hasCock()) 
		{
			output("\n\nIt looks like you have two real options. You can either let her ravish you, or you can try to fight her off. The choice is yours.");
			//[Ravish]**	[Fight]*
			//(* Proceed with the (lust < 40) text.)
			//(** loss by lust, but without any resistance.)
			clearMenu();
			addButton(0,"Fight",configFrogGirlFight, tEnemy);
			addButton(1,"Submit",submitToFrogSex, tEnemy);
		}
		else 
		{
			clearMenu();
			addButton(0,"Next",configFrogGirlFight, tEnemy);
		}
	}
}

public function configFrogGirlFight(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(victoryAgainstTheFrogs);
	CombatManager.lossScene(loseAgainstTheFrogs);
	CombatManager.displayLocation("KEROKORAS");
	CombatManager.beginCombat();
}

//Tongue lash
//special attack: deals lust damage if no shields


//Lick
//used for basic attack if the pc has no shields. deals moderate lust damage


public function victoryAgainstTheFrogs():void
{
	author("Gardeford");
	showFrogGirl();
	//Victory by lust:
	if(enemy.lust() >= enemy.lustMax()) 
	{
		output("The slick-skinned frog girl falls to the ground, eyeing you up with lusty eyes. Her legs clamp tightly and rub together, making her need visibly obvious.");
		output("\n\n<i>“Please?”</i> she whimpers.");
	}
	//Victory by HP:
	else output("The slick-skinned frog girl falls back, nursing her injuries. She looks at you with pouting lips, breathing heavily, a hint of excitement in her alien eyes.");
	output("\n\n");
	// Player victory scenes
	//[Naleen huntress ambush] // unlocked if join tormentors is chosen during naleen huntress event.
	//[footjob] //(male)	-lets make use of these while we’re at it. Also thighs.
	//[Facesitting] // (female)- males get the tongue, why shouldn’t girls.
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock()) addButton(0,"Footjob",frogGirlFootJoerb,undefined,"Footjob","Get a footjob from the frog.");
		else addDisabledButton(0,"Footjob","Footjob","You need a dick in order to be on the receiving end of a footjob.")
		if(pc.hasVagina()) addButton(1,"Face Sit",femaleVictoryFacesitting,undefined,"Face Sit","Sit on her face and have her put that tongue to work.");
		else addDisabledButton(1, "Face Sit", "Face Sit", "You need a vagina to properly enjoy sitting on her face.");
		if(pc.hasCock()) addButton(2,"Fuck Her",penisRouter, [frogGirlsFuckHer, 99999, false, 0],"Fuck Her","Stuff the frog alien. Vigorously.");
		else addDisabledButton(2,"Fuck Her","Fuck Her","There'll be no good fuckin' <b>without a penis.</b>")
	}
	else 
	{
		addDisabledButton(0,"Footjob","Footjob","You aren't aroused enough to pursue any kind of sex.");
		addDisabledButton(1,"Face Sit","Face Sit","You aren't aroused enough to pursue any kind of sex.");
		addDisabledButton(2,"Fuck Her","Fuck Her","You aren't aroused enough to pursue any kind of sex.");
	}
	addButton(14,"Leave", CombatManager.genericVictory);
}

public function loseAgainstTheFrogs():void
{
	//Loss by Lust text
	if(pc.lust() >= pc.lustMax())
	{
		output("You fall to your knees, unable to contain your lust any longer. The frog girls toxins are overwhelming your senses, suppressing your ability to consider anything but your base desires. The excited amphibian saunters over to you ");
		if(pc.hasCock()) output("in the sexiest way she can, giving you a look that sets your loins to melting");
		else output("in a lethargic fashion, trying to decide what to do with you. She licks her lips, and you feel yourself wetten at the sight of her tongue.");
	}
	//Loss by HP text
	else output("Despite your mind’s protests, your body can no longer resist the beating it has been subject to. The victorious frog girl saunters proudly over to you, grinning as she decides what she should do with you.");
	output("\n\n");
	
	kerokorasLossScene();
}

public function kerokorasLossScene():void
{
	// Player loss scenes
	//[hasCock Loss] // Obv. cocks >= 1
	//[!hasCock Loss] // basic fem/neuter loss scene
	//[Item rape] // if fem pc has any items that would cause dick growth, frog girl eats it, sexes pc with new cock.
	if(pc.hasVagina() && pc.hasItemByClass(Throbb)) itemRapeAFrogGirl();
	else if(pc.hasCock()) hasCockLossForForgGirls();
	else youDontHaveADickLossToFrogGirls();
}

public function submitToFrogSex(tEnemy:Creature):void
{
	clearOutput();
	setEnemy(tEnemy);
	showFrogGirl(tEnemy);
	
	kerokorasLossScene();
}


//hasCock Loss
//should be able to fit just about anything under a foot thick.
public function hasCockLossForForgGirls():void
{
	author("Gardeford");
	showFrogGirl();
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("The lithe frog-girl walks around your helpless body, appraising her prize carefully. She makes a few short hops over to you and presses your ");
	if(inCombat()) output("weakened");
	else output("submissively kneeling");
	output(" frame down onto the ground, evidently having made her decision.");
	//lust:
	if(pc.lust() >= pc.lustMax() || !inCombat())
	{
		output("\n\nYou feel [pc.eachCock] begin to stiffen as the kerokoras plops herself down onto your chest. <i>“I’m glad you aren’t fighting, it’s much more satisfying when you want it,”</i> she says, tracing a drug laced finger around your lips. Her voice is more melodious than the croaking would suggest, but that might just be the toxin taking root.");
	}
	//hp:
	else output("\n\nYou look at the smiling kerokoras, who looks back at you with hopeful glee. Her hands hold your weakened arms steady as she leans in close to you. <i>“I’m sorry you had to lose, but you don’t have to be grumpy about it.”</i> she says, mockingly pouting in front of you. Her long tongue tumbles out of her mouth and onto your neck. You tense as she licks upward, covering your face in drugged saliva. Your vision blurs as your reason is overwhelmed by slowly growing lust.");
	output("\n\nWhile you are busy getting lost in a haze of lust toxin, the frog girl turns her upper body and ");
	if(pc.isCrotchGarbed()) 
	{
		output("fishes through the lower half of your armor to find [pc.eachCock], making an excited noise upon seeing ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
	}
	else
	{
		output("grasps [pc.eachCock], making a happy churr upon seeing your hard length");
		if(pc.cockTotal() > 1) output("s");
	}
	output(". Deft hands play gracefully across your [pc.cock " + x + "], bringing it to full rigidity in seconds. You’re unable to stifle moans as she softly presses her palm against your [pc.cockHead " + x + "], rubbing in circles and letting her webbed hands catch the slow streams of pre that have begun to drip from your cum-slit.");

	output("\n\nAs she works on your member, the rest of your body is not left unattended. You watch through your lust fogged vision as the kerokoras’ warm, gooey tongue trails venomous saliva across every accessible part of your body. You feebly attempt to raise an arm to involve yourself in what’s going on, but are reduced to simply bucking your hips against her hands when she gives your arm a lick from shoulder to hand.");

	output("\n\nSoon her tongue makes it to your head, teasingly tickling your neck with sweltering wetness. She caresses your lips before pushing through them and uniting your tongues. You mindlessly spar with her expert oral muscle, quickly losing what little of a battle there was and letting her explore your mouth without hindrance. Some part of you knows it must be the ‘venom’, but her tongue tastes divine, and you suckle around it blissfully.");

	output("\n\nSugary stars and naked women dance before your eyes, and pleasure courses in an endless circuit through your veins. Your hips jounce uncontrollably, and the wily frog girl repositions her hands so that your [pc.cock " + x + "] slides through them with ease. You feel the conduit of electric bliss begin to focus inside you, driving all your pleasure straight to your sex. Noticing your state, the frog girl pops her tongue from its position as your comforting lollipop, and ");
	if(pc.cockTotal() == 1) output("encircles your cock in a vice-tight lock");
	else output("weaves around [pc.eachCock] until they are trapped in a vice-tight lock");
	output(".");

	output("\n\nYour impending orgasm is cut short, and you groan as the feeling rebounds through your body. So much pressure that aches to be released, but held fast by a stopper. The frog girl shakes her head with a sly smile.");

	output("\n\n<i>“Thsk thsk, babymaker; we’re not ready yet,”</i> she says, lisping with her tongue hanging from her mouth, snuggling in close and rubbing her face against yours. All the while her organ plays with [pc.eachCock], never letting you rest. Her hands, now free to work on other things, caress your [pc.chest]. ");
	if(pc.hasBreasts()) output("She seems especially interested in your [pc.nipples], tweaking and tugging them whenever the opportunity arises.");
	else output("She seems to have a lot of experience with this, leaving no flesh un-touched.");
	output(" Her ongoing ministrations temporarily keep your mind off the ache that she continues to build upon. After an embarrassingly short time you’re reduced to begging her for release.");

	output("\n\n<i>“Jutht a little bit mo-ah, babymaker, I want a hundred percent chanth,”</i> she promises, patting you on the shoulder. She positions her hips around your head. <i>“You help too, gotta make sure I’m prepared.”</i>");

	output("\n\nHer slick, plush hips squish against your cheeks as she mashes her vagina against your mouth. Thoughtlessly, you begin licking her sex with reckless abandon, eager to receive the assured release. She tastes sweet on your tongue, and you lick like your life depends on it. You find her fuckhole, plugging it with your tongue and wetting it as much as possible. Your nose rubs against her rigid clit, causing soft yips of pleasure to emanate from her with each passing nudge. Her insides suck your tongue deeper until you can’t get any further down.");
	if(pc.cocks[x].cLength() >= 10) output(" You even manage to reach so far that you feel it touch her cervix.");

	output("\n\nAfter a few moments of heated tasting, the " + enemy.skinTone + " colored beauty draws her cunt away from your mouth. A thin trail of saliva and juices connects you for a moment before breaking and falling to your face. With nothing further to hold your attention, it is brought back to your aching loins. The anuran nymph grasps your [pc.cock " + x + "] and gyrates her hips atop your [pc.cockHead " + x + "]. You thrust weakly in an attempt to drive your way into her snug pussy.");

	//cockFits:
	if(pc.cockVolume(x) <= enemy.vaginalCapacity(0))
	{
		output("\n\n<i>“Good, babymaker. Now you can thill me up with babies,”</i> she says with a loving tone between gasps of pleasure. Without warning her hips slam down over you, driving your [pc.cock " + x + "] deep into her velvety cunt. At first she simply bounces on top of you, slickening your shaft with sex juices and venom");
		if(pc.cockTotal() > 1) 
		{
			output(", her legs slapping against ");
			if(pc.cockTotal() == 2) output("your other prick");
			else output("your other pricks");
			output(" as she thrusts");
		}
		output(". You feel your mind melt into the need to impregnate her with everything you have.");
		pc.cockChange();
		output("\n\nThe fuck hungry frog girl unwraps her tongue from around your cock");
		if(pc.cockTotal() > 1) output("s");
		output(", dragging it back up into her mouth with a sucking slurp. For a few seconds your body doesn’t even notice the change, but then you feel something catch within you, like a fuse that didn’t start right away. You feel the [pc.cum] streaming through [pc.eachCock], blinding you with molten aphrodisia as it pulses from your cumslit.");
		output("\n\nRopes of jizz stream through her cervix and into her hungry womb ");
		if(pc.cockTotal() > 1) output(", [pc.eachCock] not wrapped in the blissfully tight warmth of the frog girls pussy blowing their own loads all over her legs and the surrounding jungle in tandem");
		output(". You moan with the satisfaction of long awaited release, and the frog girl reciprocates, shuddering with primordial bliss as she’s filled to the brim with your fluid. After the last of your juice has been expelled into her, she weakly pulls herself from your [pc.cock " + x + "]. She idly rubs her full belly and kisses your still half-erect dick.");
		output("\n\n<i>“That’s... good babymaker. Enough for now, I’m sure there’s plenty of them in here now,”</i> she states, a pleased smile on her face. The " + enemy.skinTone + " girl scoots back to the water, kicking away on her back and leaving you to recover yourself.");
		
		enemy.loadInCunt(pc, 0);
	}
	else
	{
		output("\n\n<i>“Ugh. It don’t fit, but we can still get babies out of dis,”</i> she says, her tone a mix of frustration and determination. She continues to circle her hips around [pc.cockHead " + x + "], keeping herself poised directly above your too-large cock. Her legs brush the sides of your [pc.cock " + x + "], and your shaft is drenched in her salacious love juices");
		if(pc.cockTotal() > 1) output(", droplets landing on [pc.eachCock], only to be rubbed in by her thighs");
		output(". Your thoughts melt into the singular drive of impregnating her with all the force you can.");
		output("\n\nThen the tongue imprisoning your lust is pulled away, sucked back into her mouth as she prepares herself. For a short moment your body doesn’t seem to make the connection, but then you feel a tightness in your body break its bonds, like a fuse that didn’t start right away. [pc.Cum] rushes madly into her hole, quickly filling it and lifting her a few inches ");
		if(pc.cumQ() < 500) output("before promptly ceasing its flow");
		else output("as spurts blast against her and bounce back from the overfull passage");
		output(". She struggles to ");
		if(pc.cumQ() < 500) output("Ensure that nothing is dropped, giving you a quizzical look about the amount.");
		else output("keep you capped, but the sheer volume is too much.");
		if(pc.cumQ() < 1000) output(" A lonely rope of [pc.cum] manages to spurt its way out of your [pc.cockBiggest].");
		else output(" Blasts of brain-melting bliss spurt from [pc.eachCock], coating the blissful frog girl along with your surroundings.");
		output(" You groan with the satisfaction of your release, and the frog girl leans down, stuffing your open mouth with her tongue in an over-eager french kiss. After your ");
		if(pc.cumQ() < 3000) output("pleasure spasms end");
		else output("torrent dies down");
		output(", she pulls back and kisses you on the forehead before sliding off of you.");
		output("\n\n<i>“Good, babymaker. I can feel your seed swimming in my womb. Surely this much will catch from someone as strong as you,”</i> she states, a dreamy smile on her face. The " + enemy.skinTone + " girl slides ");
		if(pc.cumQ() < 1000) output("over the damp");
		else output("through the cumslicked");
		output(" jungle floor and slips into the water, kicking away on her back while you recover yourself.");
	}
	output("\n\nYou awaken a bit later, feeling a little sore, but otherwise somewhat rested. You get up and gather your [pc.gear] and return to your prior affairs.");
	processTime(60 + rand(30));
	frogGirlsSimplePreg();
	pc.orgasm();
	output("\n\n");
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}
// !hasCock Loss
// No dicks
public function youDontHaveADickLossToFrogGirls():void
{
	author("Gardeford");
	showFrogGirl();
	output("The nimble frog-girl walks up to your helpless body, sighing as she appraises you carefully. After a moment she hops over to you and presses your weakened frame into the ground, apparently having made her decision.");

	if(pc.lust() >= pc.lustMax())
	{
		output("\n\nYou feel [pc.eachVagina] wetten anticipating what might happen. The kerokoras stands above you, looking down with a bemused smile. <i>“In our culture, the loser of a spar must clean the winner’s feet,”</i> she says, shifting you into a kneeling position. <i>“If you do a good job I might even alleviate that problem you’re trying so desperately to hide.”</i>");
	}
	else output("\n\nYou glare at the kerokoras standing above you. Despite your body’s cries to the contrary, you still aren’t quite ready to give up. <i>“I’m sorry you had to lose, but in our culture the loser of a spar has to clean the winner’s feet,”</i> she says, lifting you into a kneeling position. A frown crosses her features and she slips her tongue out. You shiver as she gives you a lick from your chin up to your forehead. <i>“There, now if you do a good job you’ll get more of that.”</i>");

	output("\n\nYour thoughts fog over with a haze of lust, and the frog-girl’s skin begins to look rather inviting. You’re pretty sure it’s just the venom clouding your judgement, but you just want to kiss her all over and become lost in the sensuality of her body. You are brought out of your fantasy when the anuran beauty brushes one of her dextrous feet against your cheek. You sigh happily as she brings it around, brushing your lower lip before settling on your chin.");

	output("\n\nYou grip her by the heel and ankle, the salacious sweat seeping into your [pc.skinFurScales]. As you kiss along the side and top of her foot, you note the coiled muscle beneath her pliant skin; her legs have a lot more meat than their appearance first suggests. With each kiss a tingling sensation grows in your lips, causing your body to become hotter with each passing moment.");
	output("\n\nHer lusty secretions are sweet in your mouth, and you find yourself longing for more. With a start, you notice that your quick pecks have turned into passionate licks; the realization does nothing to prevent your tonguing and sucking. You hold her tight to help her balance, kissing her heel deeply and rubbing your nose against the sole of her foot. You want nothing more than to be lost in her prurient nature.");
	output("\n\nBetween motions you notice the kerokoras girl’s breath has become heavy and ragged, her smooth chest heaving as more of her weight shifts onto you.");
	output("\n\n<i>“You are good at this. You would do well as a lower class Kero-ooooooh”</i> she manages, her attempted insult turning into a guttural moan as she loses her balance and falls on her cushiony bottom. You use her moment of weakness to focus your assault.");
	output("\n\nYour tongue weaves across her toes, and you cheer happily internally as you see her lean back on her arms. Her eyes are glossy and she looks to be trying hard to keep up her concentration. You playfully move your hand along her upturned leg, walking with your fingers and lingering with each ‘step’. Her eyes follow your movement until you reach her crotch, at which point they unfocus as you spread her nether lips and rub the entrance to the biological boiler that lies inside.");
	output("\n\n<i>“Hey, hang on! I didn’t say you could touch there,”</i> she says weakly, doing nothing to stop your fingers from dipping inside her entrance. Her insides part easily, obviously prepared for intrusion, but still cling tightly around you; each time you pull out your fingers are sucked relentlessly back in.");
	output("\n\nYou rub your thumb over the moaning frog girl’s clit, and whenever you touch the slick bead her insides pulse with tight convulsions. Her " + enemy.skinTone + " flesh sparkles in your vision, and you close your eyes against the brightness, burrowing your face into the curves of her foot. Her webbed toes clench as you pleasure her, and you massage them with your free hand while your tongue lathers her heel.");
	output("\n\nYou’ve long since lost track of time, but after what feels like a pleasant eternity the frog girls breathing picks up speed. She shuts her eyes and scrunches up her face in silent orgasm as her toes splay out and her inner folds trap your fingers with binding contractions. A puddle of sexual fluids and lusty poison has formed over the course of your endeavors, and after her muscles relax the frog girl lies in it, softly panting as she rests.");
	output("\n\nIf you still had your wits about you, you may have found it prudent to leave with this turnabout victory... but the haze of lust in your body is so overwhelming that you simply lower her leg to the ground and position yourself at her crotch. Closing your eyes, you move closer to her sweltering, juicy pussy and suckle firmly on her clit. The moment your lips make contact, the combination of her drug-enhanced taste, smell, and touch is too much for you. You slowly drift into unconsciousness suckling her sensitive button, lost in dreams of fucking all manner of alien creatures.");
	output("\n\nYou wake up a few hours later with an ache in your side from sleeping on the rough jungle undergrowth. The effects of the venom seems to have dissipated, but you still feel hot and unsatisfied; you’ll have to be careful getting back if you don’t want to end up as someone’s toy.");

	processTime(120+rand(60));
	pc.orgasm();
	pc.changeLust(33+rand(33));
	output("\n\n");
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}

//Victory Footjerbs
//requires cock, accounts for size
public function frogGirlFootJoerb():void
{
	clearOutput();
	author("Gardeford");
	showFrogGirl();

	output("You step leisurely around your fallen prey, considering just what you should do with her... time and again, your attention is drawn back to her well toned legs and large feet. You ");
	if(!pc.isNude()) output("remove your [pc.gear], dropping it to the jungle floor, before");
	output(" mov");
	if(pc.isNude()) output("e");
	else output("ing");
	output(" in closer to your prize. She looks at you with cautious optimism, still unsure of what she’ll be getting out of this.");

	output("\n\n<i>“Oh no, I-I’ve lost! Now I have to have your babies, right?”</i> the Kerokoras says, her eager hope leaking through her attempted concern. She makes a failed effort to inconspicuously open her legs, but all it serves to do is stoke your desires, the smooth inner curves of her thighs drawing your eye along their well-toned length.");

	output("\n\nYou move closer, telling her that isn’t quite what you had in mind. You want her to use those flexible feet of hers to massage your [pc.cockBiggest]. She frowns begrudgingly, not entirely willing to give up her crusade for impregnation. She crosses her arms, thinking hard for a moment about her situation.");

	output("\n\n<i>“But, wouldn’t you rather-”</i> she manages before you shush her.");

	output("\n\n<i>“I’d rather you follow my instructions, and maybe if you follow them closely enough I might just rethink your proposition,”</i> ");
	if(pc.isNice()) output("you tell her with a wink");
	else if(pc.isMischievous()) output("you tease with a grin");
	else output("you lie with a disarming chuckle");
	output(". That puts a lusty smile on her face and she scoots closer to you, moving until she sits within reach of [pc.eachCock].");

	output("\n\nShe leans back on her elbows and brings her legs up to a better position. From where she’s situated her feet easily reach [pc.eachCock], sliding across your burgeoning flesh with fluid motions. These muscles might be developed for movement, but damn if she isn’t good at using them while stationary. The slick, venomous sweat coating her entire body only serves to make it easier for her to caress every inch of your [pc.cocks].");

	output("\n\nSpeaking of the slippery liquids the kerokoras secretes, you can feel the heat rising in your loins as the lust inducing venom that coats her body seeps into your [pc.skinFurScales]. [pc.EachCock] grow");
	if(pc.cockTotal() > 1) output("s");
	output(" to full hardness within a matter of moments. When the frog-like girl notices the effect she’s having on you, she smiles triumphantly and runs her gooey tongue over her lips, steeling herself for her task.");

	output("\n\nWithin moments your expectations are met in full, possibly even surpassed; this decision is shaping up to have been worth it so far. The libidinous venom in her sweat might be influencing your feelings, but you’re content to let it considering the results. Her dexterous toes are long enough that ");
	if(pc.biggestCockThickness() <= 7) output("they surround your [pc.cockBiggest] entirely");
	else output("they begin to wrap around your [pc.cockBiggest]. The webs between her digits tickle you as the smooth pads along the underside of her toes trail up and down your slickened [pc.cockNoun " + pc.biggestCockIndex() + "].");

	output("\n\nShe gauges your reaction and continues her ministrations, stopping when her foot reaches your tip. Her toes whirl around your [pc.cockHeadBiggest], causing it to swell from its lusty sweat coating. With every touch you feel the blood pumping to your nether region, and you let out a soft moan at the sweet thought of release.");
	output("\n\nIt doesn’t take much more; the lithe kerokoras brings the sole of her foot over your [pc.cockHeadBiggest], and with a soft swirl you feel as if your reserves have been uncorked.");
	if(pc.balls == 1) output(" Your [pc.ball] tenses as it pushes");
	else if(pc.balls > 1) output(" Your [pc.balls] tense as they push");
	else output(" You feel your loins tense as your prostate pushes");
	output(" a load of [pc.cum] onto the curves of her leg.");

	output("\n\nThe fervent frog-girl seems to have momentarily put aside her desire to breed. Even as your last spurts drip from her " + enemy.skinTone + " flesh, she brings her other foot up to aid in the massage; one foot continues to weave ");
	if(pc.cockTotal() > 1) output("through");
	else output("around");
	output(" [pc.eachCock], making sure ");
	if(pc.cockTotal() == 1) output("it is");
	else output("they are");
	output(" entirely coated with a sheen of her venom. Her second foot travels under your package, lathering ");
	if(pc.hasVagina()) output("the folds of [pc.eachVagina]");
	else if(pc.balls > 0) output("your [pc.sack]");
	else output("the [pc.skinFurScales] beneath [pc.eachCock]");
	output(" with the lust-inducing substance.");

	output("\n\nRigidness returns to you with painful force, and you are brought out of your lusty trance by the shock. You buck your hips in time with the motion of her feet, using the space between her webbed toes as an improvised onahole. No matter how many times you thrust, the cool air brings a gasp of shock to your lips as your flesh is exposed.");

	output("\n\n<i>“Again, again!”</i> laughs the cock-crazed kerokoras as she hurries to milk your [pc.cockBiggest]. The jungle is humid and hot, but the surrounding air still feels cold against the volcanic, lust flamed heat of your [pc.cocks]. You can feel a second load of pressurized [pc.cum] fit to burst free from your over-sensitive flesh, rapidly approaching the sweet release her ministrations promise.");
	output("\n\nYour muscles tense as you cum again, this time pumping hot [pc.cumNoun] over her lustrous " + enemy.skinTone + " stomach. The sight of your cream running off her sweat-slicked skin only inflames your venom induced libido further. You grasp her firm thighs, one in each hand, and press them tightly together. You can feel the cords of muscle tensed beneath her " + enemy.skinTone + " legs, but the outer flesh remains pliant and soft to the touch.");

	output("\n\nYou slide your [pc.cockBiggest] in between the space below her pelvis, squishing it amidst the towers of her legs. Gently, you begin to rock back and forth, using all of your willpower to steady yourself. Your dick");
	if(pc.cockTotal() > 1) output("s");
	output(" slide");
	if(pc.cockTotal() == 1) output("s");
	output(" over the folds of her sodden cunt with every thrust, grinding your flesh into the sweltering heat of her own need.");

	output("\n\nThe nimble frog-girl moans with each pass of her increasingly soaked fuckhole - at least until it becomes evident that the penetration she longs for will not be forthcoming. She tries to voice her disappointment, but the only utterance she can manage is a pleased ‘ooooo’ as the stimulation of her sex floods her brain with sweet bliss. You hug her legs together as tight as you can, pushing through her soft thighs with every thrust of your hips.");
	output("\n\nYou see the kerokoras girl’s webbed fingers dig into the earthy floor of the jungle as her body twitches and tenses at your touches, struggling to find purchase as her body is wracked with orgasmic bliss. When her search fails, the digits of both her hands and feet splay out, stretching tightly as her muscles lock up. She tries to screw up her face to hide her pleasure from you, but only manages to look thoroughly fucked.");
	output("\n\nThe sight of her rapidfire orgasms brings you to the edge in moments. You shout in ecstasy as you cum for the third time, [pc.eachCock] blasting her legs ");
	if(pc.cumQ() > 250) output("and chest");
	output(" with [pc.cum].");
	if(pc.cumQ() > 1000) output(" Ropes of [pc.cumColor] jizz land on her face, obscuring her vision as she gasps for breath, recovering from the onslaught of pleasure that you’ve burdened her with.");
	output("\n\nYou collect your [pc.gear], leaving the beleaguered frog-girl to rest. A flush runs through your body as you return to your mission. Her venomous sweat must not have completely worn off.\n\n");
	processTime(45+rand(15));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	CombatManager.genericVictory();
}

//Naleen huntress rescue/ambush
//Requires having met a venus pitcher
//Must have met fem naleen
/*9999 THIS CONTENT IS CUT!
public function naleenAmbushRescueThing():void
{
	//figure out how to show naleen and frog-girl bust at same time
	output("\n\nAs you wander through the jungles of Mhen’ga you become aware of a... noise. Freezing for a moment, you listen carefully. Sure enough you hear a cry from somewhere close by; it sounds like someone is trying to fight off an attacker! It could just be one of the venus pitchers you’ve seen around the forest, but you’d better check it out just in case.");
	output("\n\nYou move carefully through the underbrush, ");
	if(hoverboard9999) output("deftly maneuvering your transportation around jungle overgrowth");
	else output("avoiding all manner of overgrowth cluttering the ground");
	output(". Eventually you get closer to the noise and can make out someone asking for help, along with two higher pitched voices giggling softly that weren’t audible before. You pull apart the leaves and vines that block your vision and check to see what’s happening.");

	output("\n\nTo your surprise you see the naleen huntress you’ve met around the jungle being accosted by two ");
	//entryUnlocked: 
	if(9999) output("kerokoras");
	else output("short, slimy aliens your codex recognizes as ‘kerokoras’");
	output(". The kitty-naga’s fur is matted ");
	if(9999) output("with what you assume to be the aggressors’ venom, the");
	else output("with");
	output(" liquids oozing slowly down her her body and scaled tail. One of the frog-like girls stands behind the naleen, caressing her breasts and licking her neck between intermittent giggles as she holds her steady. This one’s skin is colored similarly to the kitty-snake, with black stripes dotted over a glossy orange hue.");

	output("\n\nThe other one of the short girls stands in front of the cat-naga, pacing back and forth with short strides. She appears to be talking to the captive, but her voice is too quiet for you to make out the exact words. You’re puzzled for a moment; from what ");
	if(9999) output("you know");
	else output("your codex says");
	output(" kerokoras usually don’t go after women. What passes for the races’ relations with other species mostly focuses on being impregnated by whatever native males they can find. You ");
	if(pc.meleeWeapon is Rock || pc.rangedWeapon is Rock) 
	{
		output("ready your weapon");
		if(pc.meleeWeapon is Rock && pc.rangedWeapon is Rock) output("s");
		output(" and ");
	}
	output("prepare yourself, not wishing to be caught unawares if they intend to fight.");

	output("\n\n<i>“Hey! What are you doing!?”</i> you call out, emerging from your cover");
	if(pc.meleeWeapon is Rock || pc.rangedWeapon is Rock) 
	{
		output(" with your weapon");
		if(pc.meleeWeapon is Rock && pc.rangedWeapon is Rock) output("s");
		output(" ready");
	}
	output(". You make eye contact with the trapped naleen, and can see a shimmer of hope flicker when she recognises you. The frog girl who had been talking turns to you, her wide mouth still set in a smile that makes her eyes seem smaller. The other girl simply pauses mid lick, her gooey pink tongue resting halfway up the naleen girl’s arm. Now that you’re a bit closer you can see that her hands are both focused on covering her genital slit, obscuring it from view.");

	output("\n\n<i>“Normally the huntress hunts us! Not happy that we try to take kitty babymakers!");
	if(!silly) output("But there was a miracle");
	else output("But now SOMEBODY SET HER UP THE WANG");
	output("! Now huntress is a babymaker too!”</i> she says with a laugh, her words coming rapidly in her excited mood. You wonder for a moment what she could mean, but she doesn’t keep you guessing for long. She moves toward the captive cat-snake, nearly skipping as she goes. When she’s close enough she grabs the naleens wrists, tugging her hands away from their position. The naleen shivers with a whimper at the touch but can only manage to fix the short frog girl with a stare, who takes no notice as she looks back to you.");

	output("\n\n<i>“See! Now we can beat her just like the males!”</i> She says in an enthusiastically triumphant tone. She beams at you as if this is some great accomplishment whilst idly running her first two fingers through the huntress’s genital slit. When she reaches the top she presses lightly, and you’re surprised to see a reptilian cock slip out from the hole, flipping up to an erection once it’s fully clear. The naleen blushes and glares harder at the offending captor, even as her cock twitches softly in the open air.");

	output("\n\nThe other kerokoras, totally unfazed by these events, renews her licking. You can see her tongue leaving swathes of the lust inducing chemical sweat across the poor huntresses fur. With her new cock the amount of heat built up inside her must be the reason she has been unable to free herself. The talkative frog-girl turns her attention back to the naleen, whispering humiliating sweet things between licks of her body.");

	output("\n\nYou should probably rescue the huntress, but ");
	if(pc.hasCock()) output("the juices coating her cock make it look awfully inviting");
	else output("the sight and scent of the event before you is awfully enticing");
	output(". It looks like you have a decision to make....");
	// [rescue] [join] [leave]
}

//Rescue
public function rescueTheNaleenFutaFromFrogs():void
{
	clearOutput();
	author("Gardeford");
	output("<i>“");
	if(pc.isNice()) output("Back off, I’m not going to sit around while you rape her");
	else output("Back off, I want her for myself");
	output(",”</i> you say");
	if(pc.meleeWeapon is Rock || pc.rangedWeapon is Rock) 
	{
		output(", raising your weapon of choice at the aggressing frog-girls");
	}
	output(". The talkative one sighs at you before giving the beleaguered huntress a smile. She licks the trapped kitty naga upside the face, smearing the lust venom over her mouth and nose. When she’s done the naleen collapses, her eyes rolling back into her head as she inhales the powerful fumes.");

	output("\n\nThe rear kerokoras lets the cat-naga drop, and you wince as she hits the ground like a sack of potatoes. Luckily her head lands on a coil of her tail, but it still looked like a hard fall.");
	output("\n\nBoth of the nimble frog girls turn to face you, salacious smiles covering their features. <i>“You talk big ");
	if(pc.hasCock()) output("babymaker");
	else output("girly");
	output(", but can you back it up?”</i> she asks as the both of them split up and begin to circle around you.");

	//fight 2 frog girls
	//fight! win!? lose?
	//9999 OHGODWHY
}

//Lose to forg gorls
public function loseToForgGorls():void
{
	//9999 show double bust
	output("You collapse from the double threat of the kerokoras. One of them backs away snickering, walking to the collapsed huntress and preparing to take her away. Before she can do anything the huntress whacks her on the head with her tail and rushes off into the forest. You on the other hand are not so lucky.");
	output("\n\n<i>“Tsk, we’ll get her later. Her new smell is strong; we can find her any time... so we’ll just settle for </i>you<i>.”</i>");
	//-transition to your genders loss scene
	//9999 maybe change this so one chases after the naga.?
}

//Win the fight
public function beatUpSomeForgGoils():void
{
	clearOutput();
	author("Gardeford");
	//9999 show 2frogs & Naleen
	output("The two frog girls dart off into the forest, clutching their wounds as they zip out of sight. They’re surprisingly quiet as they run, but you’re perfectly fine with that. You rush to the fallen huntress, preparing to help her should she be injured. To your surprise she rises as you approach; apart from being covered from head to... tail-tip with a still-damp sheen of kerokoras venom.");

	output("\n\n<i>“<i>W-well, pet. One of you off-worlders kidnapped me and ran some... ‘tests’ on me before giving me a nasty tasting food that made me grow this,”</i> she says, pointing to the softly pulsing cock still half-erect and poking free of her genital slit. She appears to be trying very hard to retain her composure. <i>“If you would be so kind as to get something to help me remove this I would make it worth your while”</i>.");

	output("\n\nSounds like as good a reason as any; now to find something that can remove cocks.");

	// [Help] - Requires 4x of ???
	// - Requires an intermediate menu so the PC can select if they have multiple items.
	// - Requires 4 of the same item rather than mix & match
	// [Leave]?
	//9999
}

//repeat
public function encounterNaleenWivCocksGuvnah():void
{
	//showNaleen();
	output("\n\nYou find the huntress looking warily around, still careful to not be ambushed in her fragile state.");
	output("\n\n<i>“Did you find something?”</i> she asks, eager for a positive response.");
	// [Help]
	// [yes]
}

//Help
public function helpNaleenDeCock():void
{
	clearOutput();
	author("Gardeford");
	//showNaleen();
	output("\n\nYou bring out {itemName}, and the over-eager snake snatches it from your hand, practically inhaling it before you can tell her what it is. She waits expectantly for a few seconds before frowning with disappointment.");
	output("\n\n<i>“How long does this stuff take to start working anyway,”</i> she asks impatiently. You offer her another and she takes it, but after this one she rubs her stomach with an unpleasant look on her face. You bring the third to her lips and she takes it reluctantly, pushing away any further attempts to feed her more. You decide it might be best to ");
	if(!pc.isAss()) output("take a direct approach.");
	else output("apply it directly to the affected area.");

	output("\n\n<i>“H-hey! Stop that!”</i> she shouts as you push inside her genital slit with two fingers, hooking them around her unwanted appendage and tugging softly until it emerges from its hiding place fully, hanging in the open air at half mast. The flustered feline-naga continues to voice half complaints as you rub her with the {itemShort}. Her flaccid phallus quickly rises to attention, throbbing needfully as you tend to it.");
	output("\n\nHer distressed objections turn to pleasurable moans as you continue rubbing. You make sure not leave her feminine parts unattended, and when you dip a pair of fingers into the deeper parts of her femslit you are happy to hear her coo with rapture. Some part of you realizes you’ll be taking her virginity, at least as far as <i>this</i> cock is concerned, with this orgasm. Her reptilian cock gives one more painful looking pulse before her newly minted cherry is popped.");
	output("\n\nShe shouts in ecstasy as ropes of pearly jizz spurt from her like a fountain. You ");
	if(!pc.isAss()) output("direct her cum-cannon away from her body, figuring she’d rather have as little to do with it as possible");
	else output("aim her cum-cannon directly upwards, causing the brunt of her deluge to splatter onto her face");
	output(". With each pump of liquid lust her dick gets a little smaller. Eventually you’re left rubbing only her pliant insides and thumbing her swollen clit.");

	output("\n\n<i>“Thanks for that pet, but we’re not done. You’ll be helping me sweat off this venom as well before you leave. Think of it as a thank you gift,”</i> she purrs seductively, wrapping her arms over your shoulders. The hunger in her voice sets your heart to beating, but it might just be that the venom is getting to you as well.");

	processTime(50+rand(20));
	// (go to dick sex if dick, go to tail peg if grill)
	// hasCock: bendNaleenOver
	// hasCock || hasVagina: obligatorySavinTailPegging
	//9999
}

Join Tormentors
output("\n\nMale");

output("\n\n<i>“Stop!”</i> you tell the two frog girls. They turn towards you, tensing as they prepare for a fight. The huntress’s eyes shimmer with hope as she watches you. <i>“Don’t start without me.”</i>");

output("\n\nThe hope drains from the snake girl’s eyes as she realizes the implications of your statement. The talkative frog girl stares at you blankly for a moment before an excited grin breaks her shock. The quiet one just turns back to her licking, nuzzling deeper into the kitty-snake’s fur with her kisses. It seems like she might have been anticipating something like this for a while.");

output("\n\n<i>“Really? We get two babymakers, and we didn’t even have to fight for either of them!”</i> the overexcited amphibian says on each exhale of her rapid breaths. For a moment you’re worried she might hyperventilate, but she manages to calm down enough simply be giddy instead of frighteningly thrilled. She shifts happily as she waits for you to walk closer.");

output("\n\n<i>“You can ride her cock while I take care of her pussy”</i> you tell the eager kerokoras, finally taking note of that fact that this one’s skin is solid gold, like a golden dart frog from Terra. The naleen girl glares at you, but can’t keep up the effort for long under the assault of her color mimic’s ministrations.");

output("\n\n<i>“Hey, just because you joined us willingly doesn’t mean we don’t want your babies too,”</i> the golden girl says warily. You assure her that you’ll have enough left to satisfy her as well, especially with the aid of her venom. You strip yourself of your gear, rubbing your [pc.cock] to attention. You reach down and cup one of the kerokoras’ butt cheeks, earning a smile and a gasp from her as she waits for you to start on the huntress.");

output("\n\nNot wanting to keep her waiting for too long, you sidle up to the huntress, planting two fingers in her painfully engorged pussy lips. You doubt her throbbing reptile cock would yield at all, let alone slip back inside her slit at this point. You guide [pc.cock] into her yielding folds, gently rubbing her clit as you enter her. The fair sized bud is about as hard as her cock is, and you see shivers run through her with every brush of your thumb.");

output("\n\nThe talkative frog girl slips between the two of you, crawling up in front of you and angling the bumpy lizard cock up to her sopping cunt. It might just be the heat, but she seems to be excreting much more venom than the a kerokoras should. She lets herself drop down, sighing as the ring of her pussy lips wraps around the bumpy dick. The huntress moans despite herself as the frog girl begins to gyrate her hips.");

output("\n\nYou begin to move your own hips in tandem with the girl before you. With every thrust you make into the naleen, the golden dart frog’s plush, venom-drenched butt slaps into your stomach. The lust inducing venom makes you even harder than the kitty-naga’s constricting folds already had. You grasp her lightly furred hips for leverage as you piston into her. The tiger colored kerokoras continues to lick and fondle various parts of the naleen’s upper body, tweaking her nipples and kissing her on the cheek as she moans.");

output("\n\nThe combined pleasures bring you to an apex much more quickly than you’d like, and you grit your teeth as liquid lust courses through you, funneling out and into the poor girls pussy. Virile [pc.cumNoun] courses into her tightly clenched passage{cumQ > 500:, most of it being pushed back out and flowing in runnels down her snake tail}. The frog girl atop her shares your orgasm with near perfect timing, tensing and moaning as she clamps tighter around the twin orbed reptile cock.");

output("\n\nThe huntress seems to be on the verge of cumming herself, and you watch her face intently to witness the exact moment {she orgasms for the first time/she orgasms again}. To your surprise, the tiger patterned frog girl drags her companion off the dazed cat-snake, letting her fall to the ground with a grunt of protest. You pull out and back away a few feet as the orange and black frog comes around from her spot behind the huntress to straddle her front.");

output("\n\nThe diminutive girl looks especially small perched on the naleen’s stomach, and she stares nervously at the taller kitty-naga. She slides into a position that places the crux of her sex directly atop the naleen’s dick, precum visibly dribbling from the throbbing member. The huntress is looking rather haggard but somehow manages to direct her focus to the girl seated on her belly.");

output("\n\n<i>“I love you! We’re the same color, and I’ve wanted to tell you for a long time. Now that you have a dick I have to have sex with you, so please don’t be too mad. I’m sorry,”</i> She says, the orange portions of her cheeks turning as red as a grapefruit. Before the naleen woman has time to respond, the tiger striped frog girl gives her a kiss, filling her mouth with her gooey venom-coated tongue.");

output("\n\nIn tandem the frog-girl shifts her butt up and over the kitty-naga’s cock before lowering back down and encasing it in the hot folds of her cunt. The poor huntress cums on the spot, her already weakened resolve no match for the overwhelming sensation of a tight twat enclosing her maleness. Her hips rocket upward, spasming every few seconds as ropes of jizz fill the kerokoras’ womb until the excess flows back outside and drips to the jungle floor.");

output("\n\n<i>“She could’ve at least told me before hand. I probably maybe might have let her go first. At least then I wouldn’t have been thrown off,”</i> the other frog girl says as her friend is pumped full of naleen spunk. She turns to you with an enchanting gaze, her lips twisting into a devious grin as she repositions herself to face you.");

output("\n\n<i>“At least I still have you. Now give me those babies you promised,”</i> she demands sternly, spreading herself open for you. Since the huntress is preoccupied, the tiger-striped girl doesn’t seem overly open to sharing; considering just how laced with the lust-inducing kerokoras venom your system is... well, you figure you might as well oblige her. There’s also no telling how long she’ll wait before taking the initiative for herself.");

output("\n\nThe kerokoras’ pussy glitters with the same golden color that coats the rest of her slippery flesh. The metallic flesh of her pussy gleams under your gaze, and she begins to fidget impatiently as you examine her. You rub the solid nugget of her clit with your thumb, setting her to moaning and tensing at the lightest touch; her hyperactivity must come with the added bonus of hypersensitivity.");

output("\n\n<i>“O-oh yeah, I forgot some of you alien races like that foreplay stuff before sex. I </i>guess<i> I can go along with it if you really want,”</i> she says in an effort to maintain authority over the situation. You give her an appeasing nod as you lie back, letting her get close to your loins, all the while keeping your hand within range of her well-heated cunt. She grasps your [pc.cock] awkwardly, holding it between her hands and rubbing it gently.");

output("\n\n<i>“I think I’ll put your baby-making stick in my mouth; with my tongue I’ll should be the best at this kind of foreplay, you’ll see!”</i> she says confidently, leaning toward your pelvis. She breathes hotly against [pc.cock], mentally preparing herself for what she’ll be doing. You feel a dab of gooey wetness as her tongue touches the base of your flesh, a sigh of pleasure escaping your throat as the sensation of her stretchy tongue wrapping around your dick like a rope intensifies.");

output("\n\n<i>“I can feel your heartbeat whenever it throbs,”</i> she says excitedly. Whenever she talks her tongue constricts and vibrates around you. Her head bobs down, lowering her oversized mouth around your dick; the bumps on her tongue slowly depress as her mouth moves, feeling like a warm, wet tunnel of deliciously tight rings around your length. The aphrodisiac in her saliva is less potent than that on her skin, but it still has you painfully hard in the confines of her tongue.");

output("\n\nShe continuously dives down your cock until your [pc.cockHead] hits the back of her throat; with each tap against her insides she gives a short grunt of pleasure that reverberates through the length of her tongue, the quivering cords of muscle delivering echoes of pleasure into your core, and it’s not long before you’re grasping the back of the kerokoras’ slippery head and pressing her down as far as you can.");

output("\n\nHer eyes widen and then dilate as your cum forces its way through the vice-tight grip of her tongue. With some effort, great gobs of jizz force their way through the restricted length of your [pc.cock], pushed on by your bodies’ desire to impregnate. Whilst said desire remains temporarily unfulfilled, it doesn’t make filling the golden frog’s throat and stomach with your [pc.cumNoun] any less satisfying. Droplets of [pc.cumColor] cream dribble from her mouth and roll down her flat chest.");

output("\n\nHer tongue lolls out of her mouth as she pulls back, letting it lick your [pc.skinFurScales] as she edges her way along your [pc.belly] en-route to your [pc.chest]. Her oral muscle stays elongated across your stomach, taking its sweet time in reeling back up to her mouth. Her head lies between your [pc.breasts] at the center of your chest, her breath coming in ragged, lusty gasps as she recovers from your last reaming. For a moment you think you’ve fucked the excitement out of her, but after a few seconds she looks into your eyes, her coppery irises filled with renewed ardor.");

output("\n\n<i>“Babies,”</i> she manages before reaching down and positioning your [pc.cockHead fits] at the entrance to her flaxen fuck hole. Her balance disappears as violent spasms of pleasure bring her plummeting down onto your [pc.cock fits] until {cockLength >= 7: your [pc.cockHead fits] bumps into her womb/your [pc.cock fits] is completely enveloped in her folds}.");

output("\n\nAs soon as her short fall ends, she loudly exclaims her pleasure; the inner walls of her vagina contract and milk the length of your [pc.cock fits] as she cums simply from the act of being filled by your cock. Fueled by the sticky aphrodisiac in her sweat, you take hold of her squishy hips, massaging the corded muscle in her legs as you begin to pull her spasming body up and down your [pc.cock fits]. The golden kerokoras attempts to talk, but she can manage nought but orgasmic nonsense and babbling.");

output("\n\nSoon, she ceases her attempted conversation, resorting to lavishing your [pc.chest] with kisses and licks. You slide your hand up her back, slowly tracing her spine with your fore and middle fingers. Your other hand remains on her butt, and she leisurely grinds her hips to assist you. Despite her previous Loquaciousness she keeps her mouth shut as she blindly follows your lead.");

output("\n\nThe unstoppable urge to fill her with every ounce of your [pc.cumNoun] wells up inside you like a typhoon. You pull the lithe frog girl down until your [pc.cock fits] is as deeply buried in her cunt as you can manage. Her dextrous limbs try to find purchase against your body, but her grip continually fails, her hands slipping off of you thanks to the high concentration of sweat and slick venom. Instead, her arms and legs splay and tense as her body prepares to accept your offering.");

output("\n\nUnable to hold back any longer, you unleash a flood of [pc.cum] into the soon-to-be expectant mother. Her fists clench and her toes stretch as far as they can, her limbs seeking contact with the source of her pleasure. Rope after rope of your [pc.cum] fills her womb, and her inner walls clench so tightly around you that {cumQ < 5000: none/cumQ < 7000: little/streams} of it escape{s} {cumQ>= 5000:, despite her slowly bloating stomach’s best efforts to contain it.} {cocks > 1: Your other cock{s} cover{s} her body with the same life-giving seed that fills her insides.}");

output("\n\nFor a moment you worry about the strength of her orgasm; her corded muscles are wound so tightly that you don’t think she could open her mouth if she wanted too. She simply rests against your body, twitching at odd intervals. Thankfully she relaxes after another few seconds; her muscles go from being wound like a bowstring to falling limp as noodles in the blink of an eye. She appears to be in no position to do anything else at the moment, so you slide her happily impregnated body off of you{cumQ >= 5000:, unleashing a fountain of no longer contained cum as you do,} and return your attention to the other pair.");

output("\n\nThe huntress and her similarly colored fan are entwined rapturously. The busty naleen’s tail is wrapped up to the kerokoras’ waist, tightly pulling her freshly minted reptile cock into her former prey’s soaking wet box. On the other end the frog girl’s tongue is wrapped around the kitty-naga’s upper body, weaving around her breasts and neck until it winds up caressing one cheek with the tip sitting in her mouth, giving the insensate snake ample opportunity to suckle it dutifully.");

output("\n\nThe tiger striped frog twitches every time her tongue is sucked and doubly so when the huntress’s dick is driven inside her. Seed drips from her insides and pools on the forest floor beneath the intertwined pair. The cat-snake’s own tongue stretches to wrap around the one filling her mouth, and she shouts around it as another round of creamy jizz surges into the overfull cavity. The pearly essence rebounds and flows out of the full passage, its owner either not caring or too exhausted to stay tight enough to keep it all in.");

output("\n\nYou figure you should take this time to escape. You leave the two to finish and gather your things before heading back to your previous endeavors.");

output("\n\nFemale");

output("\n\n<i>“Stop that!”</i> you yell at the pair of frog girls. The two of them tense and glare at you as they prepare for a fight; the huntress gives you a thankful look. <i>“I want some too.”</i>");

output("\n\nThe snake girl’s look sours as she realizes the implications of your statement. The talkative frog girl stares at you blankly for a moment before frowning. The quieter one simply nuzzles deeper into the kitty-naga’s fur with her licks and kisses. She seems a bit more intent than before; someone doesn’t seem keen on giving her prize up any time soon.");

output("\n\n<i>“I guess you can join in, but don’t expect us to let you have her dick,”</i> she says condescendingly. You begrudgingly accept her terms for now, but if the opportunity presents itself you won’t make any guarantees. You finally take note that the more outgoing of the pair has the same color as a golden dart frog from Terra. She bounces over to the defeated huntress, the excitement of the situation showing on her face.");

output("\n\nShe makes an exaggerated show of rubbing herself against her newfound prey before sliding into position above the captured girl’s dick. The huntress still resists as her cock penetrates the frog girl’s flaxen folds. The tiger striped kerokoras eyes her companion enviously, but continues to hold her place in back.");

output("\n\nThe golden dart girl frantically bucks her hips, almost slipping off the aphrodisiac coated virginal cock. Following her over, you lick your way into the kitty-naga’s genital slit to lick her clit while her maleness is ravaged. You squeeze the 24 carat butt-cheeks that bounce up and down above you, hearing the trapped girl moan as their owner’s insides tighten from your efforts.");

output("\n\n<i>“Yes! I’ll get babies from our enemy!”</i> the excitable frog girl yells as her mind abandons her. Suddenly she’s lifted away from your grip and falls to the ground behind you. You back away as the tiger striped girl pushes her way to the front; the huntress’s eyes are fading in and out of focus, but she manages to look at the noticeably nervous woman before her. Her fully erect cock twitches and drips with a combination of pre-cum and lust inducing venom.");

output("\n\n<i>“You know, we’re the same color... and I’ve got something I’ve wanted to tell you for a long time. I love you! N-now that you have a dick, w-we can have sex!”</i>");

output("\n\n<i>“I’m sorry, please don’t be too mad,”</i> she says. Unable to help herself she leans in to kiss the object of her affections. The confession catches her by surprise, melting any resistance she might have still had. With the naleen momentarily distracted, the frog girl slides into position to bury the kitty-naga’s cock into her eager, wet cunt. The tight embrace of the kerokoras pussy wrings an orgasm from the huntress with a single downward thrust");

output("\n\n<i>“Ugh, she could’ve told me – then I might have let her go first,”</i> you hear from behind.");

output("\n\nAs you turn you spy the golden frog girl pushing herself weakly from the ground. The movement places her in the perfect position for some karmic justice. You leave the scene of new-found love behind you and focus on the vulnerable kerokoras. The alarmed yelp as you pin her to the ground is music to your ears, the feel of her struggling only arousing you as you stroke your fingers along her squishy tail.");

output("\n\n<i>“H-hey now. Don’t be so hasty, you can have some of it too. I was just joking earlier!”</i> she complains, letting out a small moan as your fingers move from her tailbone down through her cheeks and lightly dancing across her asshole. She tenses under you, and her golden face turns rosey as you continue to rub around her ass, massaging her well defined butt with your other hand.");

output("\n\n<i>“Oh? It looks like someone likes having their asshole played with. {nice/misc: I’ll make sure you enjoy yourself/hard: I thought your race was all about breeding. Funny that you like this kind of thing},”</i> you tell her with a grin as you slip one finger into her naturally slickened hole. Her attempts to resist result in a muffled cry somewhere between pleasure and stubbornness, and the inside of her body feels as hot to the touch as the molten color on her face.");

output("\n\n<i>“No wait! You can get snake babies before me, just don’t do that,”</i> she half pleads as her ass tightens around your finger, practically begging you to go deeper. You oblige her lower half having deemed it the more honest of the two, and her complaints stop as you push further inside her. One finger is quickly joined by a second, and a third as her accommodating passage gladly accepts the new digits.");

output("\n\nHer half-hearted struggles continue, punctuated with grunts and gasps, but you put an end to it when your thumb casually slips down to meet her clit. It’s love at first touch, and all of her pent up resilience is obliterated in one moaning sigh. She breathes heavily as liquid rapture rushes in to refill the chalice left empty by her earlier defiance; you can feel the lust building as her muscles heat up and more venomous sweat lets you move even faster.");

output("\n\n<i>“Yes! Tease my butt till I cum!”</i> she shouts before covering her mouth with her hands, eyes widening in surprise. Her shock shields her for a second before she’s pulled butt-first back to reality. An orgasm rocks her body, starting at her waist and reverberating up and down her gilded flesh. Her legs tense and turn in to spasming jelly as her toes splay out. A torrent of fem-cum splatters against your hand and the forest floor as you continue to play with her shuddering body.");

output("\n\nHer long tongue hangs out of her mouth as her hands clench and unclench at invisible holds. The lean muscles in her arms flex with each repetition, and you squeeze them softly to make sure she doesn’t pull one of them in her tensed pleasure. You look over to the other two {silly: members of Team Forest Debauchery/writhing bodies}, finding them in a similar state to the one you left them in: the huntress’s tail is wrapped around her newfound friends lower body, pulling the frog-girl onto her dick. A near constant string of orgasms has left the tails and pair of legs completely covered with creamy white jizz. The tiger striped kerokoras is so full of cum you can’t imagine a scenario where she doesn’t wind up pregnant.");

output("\n\nThe orange and black frog girl’s tongue is wrapped around the pairs heads before it weaves back and into the naleen woman’s mouth, where it is dutifully suckled as the two rub their sweat slicked noses together. The kitty-naga’s ears stick out from the swaddle of tongue, soaked in lust venom and twitching cutely. The two are facing each other, but you doubt their gazes actually meet beyond the thick haze of lust that hangs in the short space between them.");

output("\n\nWhen you turn back to your own amphibious fuckbuddy you find her attempting to grasp {!pc.isNaga: one of your [pc.feet]/the tip of your tail}. You begin to pull away but she clenches harder around them, almost hard enough for them to slip out of her grip.");

output("\n\n<i>“No! I have to lick it. Our culture compels us to lick another females feet when we lose to them in battle,”</i> she says subserviently. You cautiously let her continue, and she seems placated once she gets the {!pc.isNaga: [pc.toes]/tip of your tail} into her mouth. Her tongue is warm and wet on your [pc.skinFurScales], and it leaves a pleasant tingling on the surfaces it touches. You continue slowly fingering the girl, switching to her cunt this time, as she deserves a reward for being such a good sport.");

output("\n\n<i>“You seem pretty skilled at this. I guess you must lose often,”</i> you say as her tongue swirls around. {You press your [pc.foot] against her cheek, and she closes her eyes as she nuzzles against it/ You push your tail deeper into her mouth, forcing her to deepthroat your tip as her saliva paints its length}. She doesn’t respond to your comment, simply continuing to do her duty as you watch and finger her. The venom in your body doesn’t let you relax, however, and each of her licks feels like it hits your [pc.vagina] directly.");

output("\n\nWith surprising speed the full weight of the poison hits you. A momentous orgasm melts your mind, causing shockwaves of ecstasy to shoot through your muscles. Your {[pc.toes]/tail} slips out of the golden frog-girl’s mouth, but she hardly notices. She cums again as your fingers splay out within her, her slippery body trying and failing to give you a tight hug as she spasms. You do her job for her, mashing the girl against your [pc.chest] and sucking the gooey tongue out of her mouth.");

output("\n\nBy the time you pull away from the kiss she seems to have passed out, overloaded with sexual bliss. You set her down gently on the soggy vines and get up with a stretch. The other two seem to have passed out using each other as pillows, and you don’t want to disturb their moment. You gather your gear and return to your previous quest.");
*/

//Item Rape
//Loss - req's throbb & a vagina
public function itemRapeAFrogGirl():void
{
	author("Gardeford");
	showFrogGirl();
	pc.destroyItemByClass(Throbb, 1);
	output("The nimble frog-girl walks up to your helpless body, sighing as she appraises you carefully. After a moment she hops over to you and presses your weakened frame into the ground, apparently having made her decision. As you fall to the floor the contents of your pack spill out around you, and the kerokoras pauses to scan the scattered items. She steps over you to pick something up, and you can see her examining it closely.");
	output("\n\n<i>“Hey, isn’t this one of those things sky people use to become babymakers? I wonder what it feels like...”</i> she says, and you hear her gasp as she injects herself with the syringe of Throbb you were carrying. You hear a wet schlick and a moan of pleasure from the frog-girl before she turns to face you.");
	output("\n\n<i>“This is feeling like a really good idea so far. I very much hope you’ll agree,”</i> she says as she spins back to face you. An 8” long " + enemy.skinTone + ", human-looking dick sprouts from just above her clit, already rock hard and twitching; the need to use it is apparent in its owner’s eyes. The lithe now-futa girl practically hops over to you, kneading your body with her slippery hands as she strips you of your [pc.gear].");
	output("\n\nThe lusty venom in her sweat seeps into your body as she rubs it in, feeling up every part of your body with fervor. Her fingers slide over your [pc.fullChest], and she giggles when your [pc.nipples] harden with the combination of chemicals and attention. Before the venoms totally inhibit your common sense you manage to keep one thought at the top of your head. This harlot is using YOUR injector of Throbb, and by the stars you’ll get your money’s worth.");
	output("\n\nYou muster all of your desire into strength and grasp the kerokoras’s freshly grown cock, feeling lightheaded for a moment at its touch. Despite looking human, its length is drenched in the lust inducing sweat that slickens the rest of her body. You recover your wits, and notice that the frog girl is entirely at your mercy, shuddering uncontrollably as you hold her pulsing member.");
	output("\n\nYou grin as you lead her by the dick to kneel before you, her breath coming in ragged huffs as your hand glides over her saturated cockflesh. The poor girl collapses as you pump her, and you continue your assault, flattening her rod against her stomach as you skim rapidly across its underside. Pre gushes from her tip with every pass, and you can see her juices soaking deeper into the jungle floor with each return.");
	output("\n\nSuddenly she tenses up, pushing into your grip as her virgin cock throbs one final time and releases a stream of hot, white cum. You continue to rub her as she spurts rope after rope of jizz all over her face and chest. She moans between each pulse, but her voice is cut short by each orgasmic surge. You simply smile as you watch the pleasure in her glazed expression, slowing your efforts as her tide ebbs.");
	output("\n\nYou pull your new pet up, and she follows weakly as you guide her to a kneeling position between your legs. The sight of [pc.eachVagina] causes her cock to spring back to hardness, and droplets of lusty juices and cum fall down onto your [pc.skinfurscales]. A rush of pleasure runs through your body with every drop, and you quiver with anticipation as you lower your frog-girl thrall’s trembling cock into your hole.");
	output("\n\nYou sigh contentedly as she slides into you");

	var x:int = rand(pc.totalVaginas());
	if(pc.vaginas[x].hymen) output(", hardly even noticing as your hymen is broken");
	output(", ");
	if(pc.vaginalCapacity(x) < 100) output(" her pliant cock fitting snugly inside you.");
	else output(" your walls contracting tightly around her pliant cock.");
	output(" The kerokoras’s eyes are glazed over, and you imagine she’s having a hard time focusing on or thinking about anything that isn’t her dick. She begins to move her hips weakly in a thrusting motion, her nerves slow to react as they’re overwhelmed by the new sensations.");
	pc.cuntChange(x,25,true,true,false);

	output("\n\nYou grasp her by the hips, squeezing her tensed muscles and helping her pick up the pace. She attempts to hold on to your own hips, but with her slick skin she just slides off and holds herself up from the ground, her long tongue lolling from her mouth onto your bare stomach, dripping with chemicals that send your libido into overdrive.");

	output("\n\nForcing her to pick up the pace, you ram her into you as fast as you can push and pull. She numbly follows your hands as best she can, chest heaving as juices splash between you when she hilts inside. The toxic lube coated cock flows in and out of your [pc.vagina " + x + "]");
	if(pc.legCount > 1) output(", and you lock your [pc.legs] around her to make sure it gets as deep as it can");
	if(pc.totalVaginas() > 1) 
	{
		output(", your other entrance");
		if(pc.totalVaginas() > 2) output("s wettening as their");
		else output("wettening as its");
		output(" sister is penetrated again and again");
	}
	output(".");

	output("\n\nYou can practically feel her lust building to match yours, marked by the relentless throbbing of her freshly ripened cock within the confines of your passage, and judging by the look on her face she’s almost ready to drop. This cock came from your hard earned credits, and you plan to get your moneys worth, so with one final clench of your legs you bring the inexperienced frog girl home.");

	output("\n\nShe shouts in orgasmic bliss as her cock erupts inside you, and you squeeze her supple buttocks as you pull her closer, feeling the muscles beneath them clench tightly with each spurt of cum. Her shaking arms fail her and she falls onto you, holding her eyes closed as she rides out her orgasm. The well-fucked frog-girl weakly kisses the side of one of your [pc.breasts], and you give her a peck on the ");
	if(pc.tallness <= enemy.tallness - 6) output("head");
	else output("cheek");
	output(" as the mounting poison brings you over the edge.");

	if(pc.totalVaginas() < 3) output("\n\n[pc.EachVagina] clenches tightly around her cock, milking it for everything it has to give.");
	else output("\n\n[pc.EachVagina] clench tightly, but only the middle one gets the chance to milk her cock for everything it has to give.");
	output(" Your vision is reduced to a haze of lust that blurs your surroundings into beautiful lights, and you clutch her body tightly to you as if to solidify the thought that she belongs to you. In the end your grip is too tight, and your hands slide off of her slippery skin, splaying out on the jungle floor and grasping fistfuls of dirt and vines.");

	output("\n\nAs her flow begins to die down, the insensate kerokoras attempts to pull out, only to shout as she cums again. She collapses against you a second time as her flood of jizz rebounds from your full womb and splashes out onto the ground. You also feel her cock begin to shrink, releasing another spurt of cum and shrinking another inch or so with every attempt to pull out. By the time she’s free she has been returned to her dickless self. In a final act of clarity you grasp her head and shove it between your legs.");

	output("\n\nWith her brain numbed from the intensity of her orgasm, the frog-girl does the only thing she can make sense of given her situation and begins sucking and slurping the fluids leaking out of your [pc.vagina " + x + "]. Her gooey tongue slides inside you, licking up everything she can reach. You squeeze your [pc.breasts] as she licks, feeling satisfied with your purchase. Maybe you should try this again sometime.");
	output("\n\nAt least that’s what you thought at first. You shake your head, realizing that a few hours must’ve passed. Your, err, the kerokoras is nowhere to be found, and your body aches now that the poison is wearing off. You gather your gear, grumbling about being careful the next time as you go back to what you were doing before.\n\n");

	//Handy cum dispensor that cums normal cum!
	pc.loadInCunt(chars["EMMY"],x);
	processTime(34 + rand(10));
	pc.orgasm();
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}

//Female victory: Facesitting.
public function femaleVictoryFacesitting():void
{
	clearOutput();
	author("Gardeford");
	showFrogGirl();
	output("You saunter over to your defeated would-be attacker. She’s still breathing heavily from the fight, and can hardly keep herself propped up. You lean down, pressing on her washboard flat chest until she falls to her back with a grunt of frustration. You take advantage of her helpless state to poke and prod at her fit physique, her cords of well defined muscle feeling oddly soft beneath her pliant skin.");
	output("\n\nShe tries to avert her gaze as you think of a good way to punish her, but in her weakened state she can’t move her head very far. You snicker at her attempts, gently returning her head to a forward facing position. As you do so your fingers brush her lips, and you wonder what they would feel like against [pc.eachVagina].");
	output("\n\nYou slide yourself up until your pelvis is perched in front of her face, giving her a warm smile and caressing her cheek. Despite her position she blushes sheepishly and smiles back, and you think that maybe you got a member of the species used to losing fights. Hopefully that means she’s used to pleasing her competitors. You lower yourself atop her, making sure to not drop all your weight at once.");
	output("\n\n<i>“Aren’t you a cutie. If you do a good job there might be something in it for you,”</i> You tell your prey. The eager girl begins licking as soon as her heavenly lips touch your folds, her warm tongue tickling your mons");
	if(pc.hasClit()) output(" as her flat nose brushes [pc.oneClit]");
	output(". Her hot breaths warm your nethers, making the jungle air seem cold during its recess. You moan at her tongue's ministrations, and she licks you with renewed vigor, not wanting to disappoint the female who bested her.");
	output("\n\nOn the other hand, some of her eagerness might stem from the fact that she appears to be getting about as much pleasure from this as you are. Her " + enemy.skinTone + " legs cross and twitch uncomfortably, cunt soaked in both toxic sweat and juices. Based on her current performance you think a reward isn’t entirely out of the question. You let one hand travel back and between her legs, sliding through the slick skin of her clenched thighs.");
	output("\n\nShe moans as you rub her cunt, pinching her clit between two fingers. Her hands cling tightly to your hips, pulling her face deeper into your [pc.cunt]. The insensate kerokoras’ legs can’t decide whether to open or tighten like a vice, alternating between both options at odd intervals. The only difference between the two is that the air is cool and her legs are blazing hot against your [pc.skinFurScales]. The heat of her insides is equally intense as they clamp around your fingers.");
	output("\n\nYou brush your fingers against the fit frog-girl’s inner walls, sending jolts of pleasure through her athletic frame. You bite your bottom lip as the cocktail of aphrodisiac venom sends shockwaves of its own up your arm. You can hardly feel your fingers beyond the pleasure emanating from between her legs.");
	output("\n\nThe lithe kerokoras’ tongue pushes its way up into your passage, and you feel the gooey muscle contort as your walls crush in around it. It feels like electric ecstasy inside your body, and it continues to push until it swirls around the ring of your cervix. Her lips suck on the entirety of [pc.oneVagina]");
	if(pc.hasClit()) output(", and each time [pc.oneClit] is rubbed,");
	else output(" and");
	 output(" you feel like a small portion of your mind is lost to the pleasure.");
	if(pc.totalVaginas() == 2) output(" Your other cunt pangs in blissful sympathy whenever the first is sucked.");
	else if(pc.totalVaginas() > 2) output(" Your other cunts pang in blissful sympathy whenever the first is sucked.");
	output("\n\nYou begin to buck your hips into her head as your pleasure builds to unbearable levels, and the poor girl is forced to close her eyes as her face is spattered with juices from [pc.eachVagina]. Some part of you worries about how well she can breathe, but if she is having any trouble she certainly doesn’t make her problems known, continuing to make out with your crotch like it’s her last night on Mhen'ga.");

	output("\n\nPowerful spasms start in your pelvis and spread to the rest of your body, and you press the frog girl’s face as hard as you can into [pc.oneVagina]. Femcum showers the frenzied frog, and she licks up your juices with her eyes still closed from the shower. Her tongue draws out from your insides to clean the rest of [pc.eachVagina].");

	output("\n\nThe kerokoras’ own orgasm follows swiftly behind yours, and she pauses in her licks as her body locks up and pushes itself off the ground. You continue to rapidly fingerfuck her tight cunt even as her juices schlick and drip to the jungle floor, and her legs slide out from under her on the damp ground. A wet slap resounds as her butt hits the cum soaked vines, and your movement slows as your energy peters out.");

	output("\n\nThe two of you collapse in a bundle of twitching nerves, eventually falling asleep holding each other. You awaken first, a few minutes later, and manage to get up, giving the " + enemy.skinTone + " colored beauty a kiss on the forehead. It must’ve rained for a time while you were asleep, as the kerokoras’ venom has been washed away and replaced by plain water. You stretch before gathering your things and returning to your quest, feeling surprisingly relaxed for having slept on vines.\n\n");
	processTime(100+rand(30));
	pc.orgasm();
	CombatManager.genericVictory();
}
//This returns your preg score on a scale of 0-99999, or 0%-99.999%
public function frogGirlsKnockupChance():int
{
	var vir:Number;
	var chance:Number = -.693; //base 50%
	var cumQ:Number = pc.cumQ();
	
	if(pc.virility() == 0 || enemy.fertility() == 0 || chance == 0) return 0;
	
	vir = (pc.virility() + enemy.fertility());
	
	//increase base virility by cum volume up to a max of +2 (at a certain point the rest is just excess and will never get near the egg and is irrelevant for preg chance)
	//plus this keeps player virility more important than volume for large preg change increases
	if (cumQ >= 2000) vir += 2;
	else if (cumQ > 0) vir += cumQ / 1000;
	
	vir = vir / 2;
	
	return (1 - Math.exp(chance * vir)) * 10000;
}
//simple preg function, steele will not ever know how many kids or met them, but they are out there...
public function frogGirlsSimplePreg():void
{
	var chance:Number;
		
	if (pc.virility() == 0) chance = 0;
	else chance = frogGirlsKnockupChance();
	
	//rand returns 0 to 9999, chance returns 0 to 9999, 0 chance will never result in pregnancy obviously
	if(rand(10000) < chance)
	{
		//succesful impregnation
		IncrementFlag("KEROKORAS_PREG");
		pc.clearRut();
	}
}
public function frogGirlsFuckHer(kok:int=0):void
{
	clearOutput();
	author("William");
	showFrogGirl();
	
	output("Gathering lust shunts in the direction of your [pc.cocks] the longer you stare down at the naked kerokoras. Her rubbery skin glistens under a coat of venomous, libido-inflaming sweat. Past her flat chest and between her spreading thighs is a tight, wet pussy, shining under layers of liquid submission. It has a slight sponginess. She knows what you want, and she demonstrates her willingness to be your sperm-sponge by deploying her long tongue to flick at the greased folds, opening her interior for further inspection. " + (pc.isCrotchExposed() ? "[pc.CocksLight] flapping in the open air, you step forward." : "Before your crotch-guard gets any more tight, you whip out your [pc.cocksLight] and step forward."));
	output("\n\nLooming over the alien sexpot,");
	if (pc.isBimbo()) output(" you flash a winning smile and tell her, <i>“Give " + (pc.cockTotal() > 1 ? "'em" : "it") + " a quick taste 'n I'll fuck you good!”</i>");
	else if (pc.isBro()) output(" you grunt, <i>“Suck " + (pc.cockTotal() > 1 ? "'em" : "it") + ", then I'll fuck it.”</i>");
	else if (pc.isNice()) output(" you smilingly order, <i>“Get me ready.”</i>");
	else if (pc.isMischievous()) output(" you bop your [pc.cockHeads] to her bald head, slyly grinning. <i>“Don't take too long, or you might not get that big belly you want so bad.”</i>");
	else output(" you bend your waist and swing back, slapping your [pc.cockType " + kok + "] shaft to the alien's face. <i>“Suck. Make it quick.”</i>");
	
	if (pc.cocks[kok].cLength() >= 16)  output("\n\nDemonstrating her biological elasticity, the toothless creature widens her jaw to an almost obscene degree, utilizing her predatory functions to inhale your gargantuan member’s many rigid inches, molding her exotic form to the shape of turgid [pc.cockType " + kok + "] meat.");
	else output("\n\nWordlessly, the toothless creature’s jaw springs open and inhales " + (pc.cockTotal() > 1 ? "one" : "your") + " rigid tumescence, membranous cheek muscles kneading your insistent boner to maximum erection, every oral muscle devoting itself to the important task of pleasing a superior lifeform.");
	
	output("\n\nMind-melting pleasure follows, impossibly wet jaw-nerves slobbering on your pre-spurting meat, bobbing back and forth in obedient bliss");
	if (pc.cockCanSting(kok)) output(" that compels your venomous cock-tendrils to sting the venomous creature with your own brand of chemical joy");
	output(". Veins violently pulse, claiming the furthest depths of the kerokoras' cock-bloated esophagus, her succulent throat tighter than a BDSM queen's thigh-high boots.");
	
	output("\n\nThat tongue is staying busy too");
	if (pc.balls > 0) output(", weaving itself around your [pc.sack] and soaking the [pc.skinFurScales] on your egg-stash lovingly");
	if (pc.hasVagina()) output(", prodding at your [pc.pussies], slipping and sliding across the juicy terrain of your " + (pc.puffiestVaginalPuffiness() >= 2 ? "puffy " : "") + "nethers");
	else
	{
		if (pc.cockTotal() > 2) output(", engloving your other phalli in clutching, coiling mawflesh");
		else if (pc.cockTotal() > 1) output(", engloving your other phallus in clutching, coiling mawflesh");
		else output(", engloving your exposed girth in clutching, coiling muscle");
	}
	if (pc.isTaur()) output(". Belly on her head, moaning with fervor, you put the ambushing slut’s slick, smooth throat through its paces, humping back and forth in a building frenzy, liquid friction generating obscene slurping sounds and rhythmic slaps. The camouflaged huntress looks dumbly in your direction, none-too-quiet <b>’thlocc’</b> deepthroats hanging in the damp air; she reaches over to cup your [pc.thighs], slitted eyes closing and soft lips curling in the expectation of having a fat wad blown down her neck.");
	else output(". [pc.Hand] on her head, moaning with fervor, you put the ambushing slut’s slick, smooth throat through its paces, humping back and forth in a building frenzy, liquid friction generating obscene slurping sounds and rhythmic slaps. The camouflaged huntress looks dumbly in your direction, none-too-quiet <b>’thlocc’</b> deepthroats hanging in the damp air; she reaches over to cup your [pc.thighs], slitted eyes closing and soft lips curling in the expectation of having a fat wad blown down her neck.");
	
	output("\n\nYou drive towards her gullet, groaning at the latex-like creak of her body stretching to handle your lust-fattened pressure, fucking her sugar-seeking tongue back into its lair. Her legs squirm around on autopilot, twisting for sympathetic spurts of feminine musk. Springy lips stroke and caress your girth with each luscious pump, her oh-shaped aperture sealing down in that sinfully pleasant way the more strength you apply to her slavering fuck-gutter, gargling on overflowing volume.  [pc.CumVisc] prejizz bubbles out of her wide nostrils. Orgasmic juices soak your rigor on its distant explorations into rapidly-suckling depths, intensifying the satisfaction of treating a heavily breathing mouth like a mating hole.");
	output("\n\nThis was just the start. Yanking the hairless amphibian from your loins is as easy a tugging off a tailored glove. Your persistent boner" + (pc.cockTotal() > 1 ? "s throb" : " throbs") + " angrily, large cords of spit dripping from the peak down your well-nursed undervein. Thick drooly slaver pours down the gasping girl’s chin, fresh [pc.cumColor] lacquer flexing from your [pc.cocksLight] to join the skin-smearing mess.");
	if (pc.libido() >= 66) output(" Pure animal desire carries you down with a guttural grunt, roughly grabbing the girl by her shoulders and twisting her onto all fours.");
	else if (pc.libido() >= 33) output(" Your sexual appetite is eager for a taste of Mhen’ga’s fauna, and by pushing her over on all fours, it soon gets what it wants.");
	else output(" Pushing her over on all fours, your rising urges can no longer be denied.");
	
	output("\n\nMounting her is easy. If anything, she makes it trivial to assume the position, knowing on a very deep, primitive level that she’s little more than someone’s fuck-toy. Their incubator. Her sweet, cloying folds take the bumping impact of your [pc.hips] with a mighty shudder. The frog’s dripping-wet cooch winks open, painting a butterfly on your shaft. Wherever the stuff lands or cascades, you’re set alight with raw, pleasurable sensation, your column" + (pc.cockTotal() > 1 ? "s" : "") + " of phallic meat radiating such power that " + (pc.cockTotal() > 1 ? "they quiver" : "it quivers") + " with new, untapped potential.");
	output("\n\nPotential that you waste no time ramming into a snug sheath.");
	pc.cockChange();
	pc.maxOutLust();
	
	processTime(5+rand(5));
	clearMenu();
	addButton(0,"Next",frogGirlsFuckHer2,kok);
}
public function frogGirlsFuckHer2(kok:int=0):void
{
	clearOutput();
	author("William");
	showFrogGirl();
	var firstHyper:Boolean = true;
	if (flags["KEROKORAS_HYPER"] == 1) firstHyper = false;
	
	output("It feels wrong to compare this alien’s vagina to any kind of fruit, yet there’s some inexpressible <b>sweetness</b> to the act of claiming her. As you’re feeling right now on your first pleasurable push, it’s a taut, cock-grappling canal more than capable of handling your size" + (pc.cocks[kok].cLength() >= 18 ? ", which is far in advance of what most known races could feasibly manage" : "") + ". The lusty girl voices a whorish, glottal croak, smooth inner walls squashing on your inexorable journey towards her sugary core. The fierce knead and squeeze of exotic twat teases, coaxes, entices... inflames. You feel as hard as a bar of iron and you’re still going, wearing this biological dick-sleeve the way she was seemingly born (hatched?) to be, oozing lubricants into the gape.");
	if (pc.cockTotal() > 1) output("\n\nPenetrating her ass is an equally simple achievement, her gleaming sphincter languorously spreading to accommodate the gloriously endowed. The crush of penetrating two erogenous zones at once makes your head light up real nice, swaddling your breeder brain in cottony fuzz. Acute awareness of every blood-filled duct flashes before your eyes, your [pc.cocksLight] surrounded by acres of aching suppleness hungry for cum.");
	output("\n\n[pc.KnotBallsHilt " + kok + "]-deep in addictive pussy" + (pc.cockTotal() > 1 ? " and rectum" : "") + ", you let out a sigh of accomplishment before hauling in reverse, stimulating your lust-sore shaft" + (pc.cockTotal() > 1 ? "s" : "") + " to orgasmic heights. Translucent goo flows from her in dribs and drabs, high impact sexual desire screwing the developing pockets into splattery puddles. Nearby bushes shake from the ravenous urge you drive into her fertile wetness, euphoric hums and moans preluding spurts of crystal-clear musk below the rhythmic slap of " + (pc.balls > 0 ? "your [pc.balls] to her ample derriere." : "your [pc.hips] to her wobbly rump."));
	if (pc.cockTotal() > 1) output("\n\nWider and wider her entrances give around your tense boners. You fuck her in both tunnels, bending those colorful buttocks to your whims, a suffocating fever dream clamping down on your far-reaching erections.");
	else output("\n\nWider and wider her entrance gives around your tense boner. You fuck her in the cunt, bending those colorful buttocks to your whims, a suffocating fever dream clamping down on your far-reaching erection.");
	output("\n\nHer head sinks into the muddy soil, cheek pressed to the earth where it belongs, every part of her delightfully springy body designed for the pleasure of others. It’s no wonder these kerokoras seek others out. They’re built to be fucked. No matter how many cervix-battering thrusts you rail her thirsty quim with, no matter how many times your meat pleasantly tingles, her physiology entreats you with high-pitched squeals and panting need.");
	
	output("\n\nHer sweat has saturated your [pc.belly], washed across your crotch - her venom is affecting you.");
	if (pc.inRut()) output(" Not much, given that you’re rutting and therefore pounding her belly into the most vulgar shapes imaginable, but that unmistakable edge is there. It amplifies a monstrous libido, encouraging it to work harder, beyond all reason.");
	else output(" It’s obvious, isn’t it. Only someone in rut would be pounding a pussy this hard, intent on fertilizing another’s eggs with their DNA, the future of their dynasty. You briefly wonder if that’s so bad, but she’s the one who attacked you, and she’s getting off on being turned into a cum-dump!");
	
	output("\n\nCritical thinking is pushed out of your brain in short order, replaced by the need to break this hole in for all time. Her womb’s aching for your cum, that’s why she’s on all fours. Her clutching muff is a vessel that exists for you to dump your loads into, and anyone else who would deign to do so.");
	if (pc.isTaur()) output(" Rearing back on the verge of withdrawal, you throw all your weight into a womb-shattering lunge, shocking every hyper-aware pussy-nerve into a state of constricting shock.");
	else output(" Raising an open palm, you crack her on the ass with a firm slap, forcing every nerve inside into a state of tightening shock.");
	output(" And then you fuck her even harder, barreling through flushed clenchness, lust-heat billowing from your lungs in a feral roar that has no understanding of exhaustion.");
	
	output("\n\nThis isn’t enough! One hilt later, you grab the wiggling creature’s birthing hips and twist flip her. Now she’s on her back and getting a face full of your [pc.chestNoun].");
	if (pc.hasTits()) output(" Your [pc.breasts] smush into her neckline" + (pc.isLactating() ? ", leaking [pc.milk] in orgasmic gouts" : "") + ".");
	output(" Finding release is getting tougher, as, paradoxically, the longer you fuck her, the more you start to feel like you haven’t been fucking her at all. There’s only throbbing-hard need at your groin, culminating in a tower of breed meat crackling with the urge to stuff this greedy slut’s insatiable cunt. The kerokoras rides her mindless climax, arms splayed out to her sides; you slam into those sweat haunches, prying her agape mouth open in an increasingly debauched expression of keening ecstasy.");
	
	output("\n\nYou can’t calm down at all, so you try the mating press, lifting her heels over her head, pinning them, and nailing her cushiony interior for dear life");
	if (pc.cockTotal() > 1) output(", your extra cock" + (pc.cockTotal() > 2 ? "s" : "") + " flopping around useless around her mons");
	output(". Convulsions wrack the boneless incubator-to-be. Her muscles have lost all their strength, fucked too powerfully by your length into a flickering state to be controlled, and thus have been reduced to a wild frenzy determined to milk the");
	if (pc.isHerm()) output(" herm desperate to breed it.");
	else output(pc.mf(" man", " woman") + " desperate to breed it.");
	
	output("\n\nIt. Still. Isn’t. Enough. Mhen’ga itself must be shaking from the tectonic ferocity you drive into her, banging that weeping cunny into a shape it’ll never recover from. All thought fades into lewd pictures and pornographic emotions, your capacity for anything that isn’t mindless seeding lost to the Void. Each wet plap against your prize provokes another womb-piercing splurt. Effluence flings from your conjoined crotches; you heave against her, reaming her into the grass and flattening her ass, fresh seed boiling up" + (pc.cocks[kok].hasFlag(GLOBAL.FLAG_FLARED) ? " as your flare billows out into a uterus-sealing saucer." : "."));
	output("\n\nIn those split seconds before you cum, you’re jolted back to reality long enough to be surprised at how loud you roar, body trembling with more effort and ecstasy than you know what to do with. Fortunately, you don’t need to think about that. Your hips swivel up and back before crashing down again" + (pc.hasKnot(kok) ? ", [pc.knot] splitting her cunt apart" : "") + " and unloading all you’ve got into that writhing swamp, the world whiting out whilst your [pc.cocks] bloat" + (pc.cockTotal() > 1 ? "" : "s") + " with fervor.");
	
	output("\n\nThe initial spurts of syrupy orgasm are heavenly" + (pc.balls > 0 ? ", and you know she can feel every clench in your churning nutsack, spooling out ropes of [pc.raceShort] DNA" : "") + ". [pc.Cum] weaves into the bred frog’s innards, fresh gouts of steaming-hot jism plastering her baby-maker in delicious climax, the sensations so overwhelming that she automatically curls up in bliss. You’re not gentle during this process: you’re ramming each passionate ejaculation into her womb, delivering all that [pc.cumVisc] [pc.cumColor] nut directly where it needs to go. Her ovaries must be tossing out egg after egg to meet demand. [pc.CumGem] breeding urge paints her corrugated nethers, spunk washing out everything that isn’t the all-consuming motivation to bear a conqueror’s children.");
	if (pc.cumQ() >= 2500) output("\n\nYour mast pulses with a desperate onrush, climax elongating. The alien’s gut expands to house the surging thickness, [pc.cumNoun]-filled curves developing the lithe, petite ambush-predator into a pleasing fertility idol. As you kegel twitch another fat, gurgling wad out, the inner heat elevates to volcanic proportions. [pc.CumVisc] excess pushes out and fills the spaces around your [pc.cockNoun " + kok + "], encasing your girth in more [pc.cumColor] jism than her body can reasonably account for.");
	if (pc.cumQ() >= 10000)
	{
		flags["KEROKORAS_HYPER"] = 1;
		output("\n\nDespite the kerokoras’ incredible flexibility, you’re still cumming, and your" + (pc.balls > 0 ? " [pc.balls]" : " seed") + " will not be denied. The sheer liquid weight distending your phallus and destroying this alien’s future attempts at self-preservation is incomprehensible. She’s so full, and she’s still being pumped full of slick issue. Pure, frothy nut overflows, now splattering back into your groin" + (pc.hasKnot(kok) ? " past your [pc.knot]" : "") + ", absolutely nowhere left to hide, no nook left to fill - she cannot handle any more. Your eyes shut uselessly as the gushing gallons pour out, splashing everywhere, leaving no doubt in anyone or anything’s mind who this protein guzzling cock-warmer belongs to. She’ll remember, for all time, the [pc.raceShort] from the stars who made " + (firstHyper ? "her the first jizz bank of her species." : "her the newest jizz bank in her species."));
	}
	
	output("\n\nOnce the bulk of your spunky saturation has been deposited, you finally let yourself fall on top of her, sweat dripping from your [pc.skinFurScales]. You’re spent and vulnerable, and she’s been fucked stupid, straight into dreamland. Your body still pushes to give the slut’s box every last drop it’s earned");
	if (pc.hasKnot(kok)) output(", the rhythmic pulsations felt passing through the center of your inflated bitch-breaker");
	output(".");
	if (pc.cockTotal() > 1) output(" The rest of your load is found puddled around, or smeared across her lips. Having more than one cock always leads to such wonderful messes.");
	
	if (pc.hasKnot(kok))
	{
		output("\n\nIt takes longer than you’d like to calm down. It’s only after you’ve given up every ounce of spooge that your body reluctantly works to untie you from the gooey crevice. You tug backwards and drag her with you, before exhaling and applying gradual amounts of insistent pleasure, thinking up the most boring fuckin’ subjects you’ve ever had to endure in school or elsewhere. She’s clamping down in her dreams, probably still replaying the sordid act. Only when you consider the inanity of planes, trains, and plantains does it finally pop free, a deluge of cooling virility following it out.");
		output("\n\nOnce everything’s in order, you don’t spare a second thought to the still-unconscious frog on your way forward.");
		processTime(15+rand(10));
	}
	else
	{
		output("\n\nA flood of rapidly-cooling virility spills out of the kerokoras’ innards when you withdraw, sagging cords clinging to your softening manhood. You sit up to your knees before standing, getting yourself in order and turning back to whatever task is at hand.");
		output("\n\nYou don’t spare a second thought to the still-unconscious frog on your way.");
		processTime(5+rand(5));
	}
	frogGirlsSimplePreg();
	pc.orgasm();
	CombatManager.genericVictory();
}