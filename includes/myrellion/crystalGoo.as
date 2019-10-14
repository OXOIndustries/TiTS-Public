public function showGardeGoo(nude:Boolean = false):void
{
	showName("CRYSTAL\nGOO");
	if (enemy != null)
	{
		if (nude) showBust(enemy.bustDisplay + "_NUDE");
		else showBust(enemy.bustDisplay);
	}
	else clearBust();
}
public function showGooKeep():void
{
	showName("GOOEY\nSHOPKEEPER");
	showBust("CRYSTAL_GOO_SHOPKEEP");
}

//Crystal goo knight encounter
public function crystalGooFenBurps():void
{
	author("Gardeford");
	
	var gooKnight:Creature = new GooKnight();
	setEnemy(gooKnight);
	
	//load encounter to determine color, for reasons.
	if(flags["MET_GOO_KNIGHT"] == undefined)
	{
		output("\n\nAs you wander through the damp caves, you hear someone running behind you. You turn just in time to dodge a sword that might’ve done some major damage. The [enemy.skinTone] blade clangs into the stone floor, sending small chips flying in every direction. When you recover enough to examine the sword’s owner, you find it to be a tall knight wearing armor of similar color to its sword.");
		if(!CodexManager.entryUnlocked("Ganrael"))
		{
			output(" Your codex beeps, alerting you that the knight is a ganrael, a species of goo-creature.");
			CodexManager.unlockEntry("Ganrael");
		}
		else output(" It’s a ganrael!");
		output("\n\n<i>“En-garde, star creature! I will defeat you!”</i> it yells, revealing a high pitched, feminine voice. You take up a battle stance, Preparing yourself for another blow from the sword. She circles you, her helmet and armor hiding any useful information that you could use. Her chest plate compresses her chest so tightly that you would never tell her gender by looking at her. You ready your weapons, preparing for the fight ahead.");
		flags["MET_GOO_KNIGHT"] = 1;
	}
	//Repeat
	else
	{
		IncrementFlag("MET_GOO_KNIGHT");
		output("\n\nYou hear clanking on the rocks just in time to avoid a slash from a ganraen knight. It looks like you’re a popular choice for their attacks. You ready your weapons and prepare to fight.");
	}
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(gooKnight);
	CombatManager.victoryScene(beatUpCrystalGoo);
	CombatManager.lossScene(gooKnightLossRouter);
	CombatManager.displayLocation("GOO KNIGHT");
	
	showGardeGoo();
	
	addButton(0,"Next",CombatManager.beginCombat);
}

public function gooKnightLossRouter():void
{
	if(pc.hasGenitals()) gooKnightLossScene();
	else genderlessLossToGooCrystals();
}
public function gooKnightLossScene():void
{
	author("Gardeford");
	//hp
	if(pc.HP() < 1) output("You collapse to the ground, unable to hold yourself up any longer. Your body is too weak to respond to your commands.");
	//lust
	else
	{
		output("Your [pc.legOrLegs] buckle");
		if(pc.legCount == 1) output("s");
		output(" underneath you, taking you to the floor. Your body is flushed with heat and doesn’t respond to your commands.");
	}
	//merge
	output("\n\nThe ganraen knight walks over to your helpless body, dropping her sword and shield into a pile as she walks. She pulls off her helmet, revealing a cute face with an imitation of lengthy hair. You remember the codex mentioning that this race usually affects the facial features of races it sees, but this one seems to have gone the extra mile. If it weren’t for the fact that her body was opaque goo you might’ve been convinced she was a human. Her eyes, lips, and nose are picture perfect, and she even has a strand of hair falling over her forehead.");
	output("\n\nBy the time she reaches you, all that covers her humanoid shaped body is the chestplate. Her pussy is in plain sight between a pair of curvy thighs. She pulls the last concealing garment away, setting free a pair of jiggly DD’s with puffy nipples a shade darker than the rest of her body. With the armor on the knight had looked like an ironclad warrior, but now that it’s gone, she embodies a sensual ");
	if(!silly) output("goddess");
	else output("goo-ddess");
	output(". She kneels next to your defeated frame, giving you an excited smile as she pulls away your [pc.gear].");

	output("\n\n<i>“Now that I’ve defeated you, we’re going to play a game. You be the prince, and I’ll be the brave knight who rescued you. Everyone knows that the reward for saving the prince is a bout of passionate lovemaking, so be sure to do your best!”</i> she says with a wink. Her gooey hair bounces whenever she shifts position, and her body seems oddly tough when she wants it to be. She ");
	if(pc.hasCock()) output("smiles");
	else output("frowns");
	output(" as she ");
	if(pc.isCrotchGarbed()) output("pulls off your [pc.lowerGarment]");
	else output("looks at your naked crotch");
	output(".");
	var fauxCock:Boolean = false;
	var tempSkin:int = pc.skinType;
	var tempFlags:Array = pc.skinFlags;
	var tempTone:String = pc.skinTone;
	if(pc.hasCock()) output("\n\n<i>“Amazing! Truly a cock befitting the prince of this planet,”</i> she says happily, taking [pc.oneCock] between her hands. Her goo feels nice and warm in the open cave air, and you gasp at her touch.");
	else 
	{
		output("<i>“This is no good... Princes are supposed to have cocks,”</i> she says, shaking her head in disappointment. She reaches down to [pc.oneVagina], and you feel a small rubbing sensation. When she raises her hand, a long rod of goo is left attached to [pc.oneClit], vibrating strongly whenever it’s touched.");
		//make goo-cock
		pc.createCock();
		pc.cocks[0].cLengthRaw = 8;
		pc.skinTone = enemy.skinTone;
		pc.skinType = GLOBAL.SKIN_TYPE_GOO;
		pc.clearSkinFlags();
		fauxCock = true;
	}
	output(" When she finishes admiring her prize, her hands gently milk your [pc.cock], skillfully enough that you imagine you aren’t the first target of her lusts.");

	output("\n\n<i>“That’s a good prince. Now what should we do first? I think a royal blowjob is in order, and maybe I’ll even use my tits!”</i> she says, her excitement increasing by the second. Her hand pistons so fast along your length that it loses coherency and becomes a slick tube of [enemy.skinTone] goo. She pulls it back and waits for it to reform with an apologetic shrug. You sit in awe of her excitement. Didn’t you just lose a fight?");
	output("\n\n<i>“Sorry about that, I’m just super excited,”</i> she explains as she wraps her warm, gooey tits around your [pc.cock]. Their wetness serves as a natural lube as she rubs them all over your length, starting low and slowly rising until their bottoms are at your [pc.cockHead]. When your [pc.cocks] ");
	if(pc.cockTotal() > 1) output("are");
	else output("is");
	output(" about to fall out");
	output(" she lets her [enemy.skinTone] breasts drop and encompass ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" in cozy liquid.");
	output("\n\nAll you can do is lean back and watch as she smooshes her boobs around your length");
	if(pc.cockTotal() > 1) output("s");
	output(" while encouraging you with baby talk. The confusing nature of it distracts you from how close you are to going over the edge, and by the time you come back to your senses it’s too late. ");
	if(!fauxCock)
	{
		output("You cum into her cock-surrounding cleavage, filling her body with ");
		if(pc.cumQ() < 10) output("a few spurts");
		else if(pc.cumQ() < 500) output("a cloud");
		else output("clouds");
		output(" of [pc.cumColor]. She gives a surprised, but happy, gasp as you do so, mostly muffled by the moan that escapes your lips.");
	}
	else 
	{
		output("The false cock she attached to your [pc.clit] vibrates intensely, forcing you into a pelvis melting orgasm. Your [pc.girlCum] is siphoned through it and ejected onto the ganraen girl’s cleavage, and you notice that the false rod has grown stiffer than when she originally placed it.");
	}
	pc.cockChange();
	output("\n\n<i>“You’re not supposed to cum before I even get my mouth on there, but I suppose you couldn’t help it,”</i> she says grumpily, leaning in to take your [pc.cockHead] between her lips. She sucks out the last of the ");
	if(!fauxCock) output("[pc.cum]");
	else output("[pc.girlCum]");
	output(" that remains while her long tongue cleans the surface to spotlessness. You get caught up watching your jizz slip through her insides, traveling towards whatever serves as her stomach until it gets too far into her opaque body for you to see.");

	output("\n\nShe happily and noisily sucks at your [pc.cock], bathing you with affection while you lie helpless. Her hands move upwards across your [pc.skinFurScales], rubbing over your stomach and pressing against your [pc.chest] before returning to their work. Your own hands disobey any attempts to control them and hold her head from both sides, brushing her gooey hair as she services you. A part of you wonders if this goo girl is crazy, or if the royal gold myr families actually used to keep ganrael for leisure.");

	output("\n\nEither way she seems perfectly happy with her work, and continues to lick your [pc.cockHead]. While her mouth holds you steady, her breasts continue to lather you with goo-lube. ");
	if(pc.cocks[0].cLength() > 8) output("Her body seems to mash together, providing you the sensations of a blowjob and a boobjob simultaneously.");
	output(" By now your ");
	if(pc.cockTotal() == 1) output("[pc.cock] is");
	else output("loins are");
	output(" so hot that her body is starting to feel cool. She pinches her squishy nipples, pressing them so tight that you’re afraid they’ll fall apart in her fingers. Her solid [enemy.skinTone] eyes droop into a dreamy glaze of lust.");

	output("\n\nYou feel another wave of ecstasy building, and pull the eager knight’s face until your [pc.cock] is sunk so deeply into her throat that the [pc.cockHead] blurs in your vision. ");
	if(!fauxCock || (pc.hasCock() && pc.hasVagina()))
	{
		output("You cum again as her throat spasms around you, her tongue snaking out to lap at your ");
		if(pc.balls > 0) output("[pc.balls]");
		else if(pc.hasVagina()) output("[pc.eachVagina]");
		else output("[pc.asshole]");
		output(". [pc.CumColor] jizz pulses into her in strings, and some droplets fall out, dripping onto her tits as she gulps down what she can handle.");
	}
	else output("Another shot of the buzzer draws your [pc.girlCum] right up into her throat, giving her the meal she desires while she melts your mind with pleasure. Her long tongue zips out to lick your [pc.vaginas] and [pc.asshole]. By now the fake cock she’s given you is nearly as solid as the plates she was wearing for armor, and each touch affects the buzzer even more sensitively.");
	output(" She pulls away from you, licking her lips and staring into your eyes. You doubt she sees anything but sex at the moment.");

	output("\n\n<i>“N-now for the main event. A good prince makes their savior a princess,”</i> she says as she stands, straddling your hips before lowering herself onto your [pc.cock]. The viscous surface of her legs holds her fast to your [pc.skinFurScales] as the folds of her cunt run like silk over the underside of your shaft. She leans closer to you, so close that you can see the bubbles in her goo-formed body. When she gets close enough she kisses you, invading your mouth with her tongue as she finishes sheathing your [pc.cock] in her [enemy.skinTone] cunt.");
	output("\n\nHer DD-cup’s mash against your [pc.chest] as she gyrates madly atop you. Were she human the motions might be more hurtful than pleasurrable, but her malleable insides follow and massage your [pc.cock] throughout her rapid fucking. The amount of stamina you’ve used up prevents you from doing anything but holding weakly to her hips as they bounce. As she moves faster your hands sink in an inch or two, stuck tight in her sticky body.");
	if(!fauxCock) 
	{
		output("\n\nSoon the final burst of energy rears its head, and the goo girl shoots up with a moan. Her legs clamp so tightly to your sides that they explode into a puddle of liquid. She holds herself up with her hands as [pc.eachCock] releases torrential spurts of [pc.cum] into her pussy. Her body is too opaque for you to see clearly, but you can see the throbbing silhouette");
		if(pc.cockTotal() > 1) output("s");
		output(" of your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" pumping loads of [pc.cumNoun] inside.");
	}
	else output("\n\nYour forced strapon has become fully hardened, now buzzing every second with variable levels of force. You lost track of when you started cumming, but [pc.girlCum] has been leaking out of her gooey hole and into a puddle under your [pc.butt] for some time. You moan around her tongue as the relentless buzzer takes more than you thought you could give.");

	output("\n\nWhen she recovers, the ganraen knight pulls herself off your exhausted frame");
	if(fauxCock) output(", taking the false cock along with her");
	output(". You watch as she concentrates for a minute, regenerating an entire suit of armor similar to the one she was wearing at the start of the fight. She turns to you and winks before shutting the visor and grabbing her sword. She moves off deeper into the caves, a skip in her step as she leaves you helpless on the cave floor. You stare at the ceiling, reflecting on matters of the universe until you recover enough to grab your [pc.gear] and head back to your previous plans.\n\n");
	if(fauxCock)
	{
		pc.skinTone = tempTone;
		pc.skinType = tempSkin;
		pc.skinFlags = tempFlags;
		pc.removeCock(0,1);
	}
	pc.orgasm();
	processTime(10);
	pc.orgasm();
	processTime(15);
	pc.orgasm();
	processTime(33);
	CombatManager.genericLoss();
}

//Genderless loss
public function genderlessLossToGooCrystals():void
{
	showGardeGoo();
	author("Gardeford");
	//hp
	if(pc.HP() < 1) output("You collapse to the ground, unable to hold yourself up any longer. Your body is too weak to respond to your commands.");
	//lust
	else
	{
		output("Your [pc.legOrLegs] buckle");
		if(pc.legCount == 1) output("s");
		output(" underneath you, taking you to the floor. Your body is flushed with heat and doesn’t respond to your commands.");
	}

	//merge
	output("\n\nThe victorious knight saunters over to your defeated frame, leveling a lusty gaze that sweeps over you. When she reaches you she ");
	if(pc.isCrotchGarbed()) output("pulls off your [pc.lowerGarment] to get at your crotch");
	else if(pc.legCount != 1) output("pulls apart your [pc.legOrLegs] to reveal your crotch");
	else output("pulls you into a position that makes your crotch visible");
	output(". A look of shock covers her face as she discovers your abscence of genitals, followed quickly by a frustrated frown.");

	output("\n\n<i>“Why do I have to get a weird one. Where are all your bits? The ones that are usually around here,”</i> she grumbles, pointing to your groin. You tell her that you have nothing like that anywhere on your body. You might have when you were born, but not any more.");
	output("\n\n<i>“W-what? But that’s dumb! How do you make babies? How do you feel good? How- how do you pee?”</i> she asks in rapid succession, sounding totally flabbergasted. You reply that there are other ways to feel good, even without having parts like that. She gives an irritated huff in response, and pulls her slate-like blade up. The longsword melts down steadily until it’s little more than a butchers cleaver.");
	output("\n\n<i>“Stupid weird spacewalkers. Just when I was gonna have fun,”</i> she says, steadying one of your arms with a firm grip as she reaches in to make a cut with the knife. As she readies herself, the edge brushes against your [pc.skinFurScales], sending a rush of pleasing shivers through your body. You attempt to hide your reaction, but the attentive knight notices immediately.");
	output("\n\n<i>“Oh? What do we have here? Are you feeling good when you’re about to be cut? I suppose I can have a little fun with you since you messed up my plans,”</i> she says, her frustration replaced with a playful coyness. She brings the knife sized blade to your [pc.chest], ");
	if(pc.isChestGarbed()) output("moving your [pc.upperGarment] before ");
	output("sliding the edge along it. You hear the keen blade’s edge as it moves over your body, sounding like nothing less than a fine hum in your ears.");
	output("\n\n<i>“So you like the sound too? Allow me to fill your ears with it,”</i> she whispers, and in the corner of your eyes you see two smaller blades form, each with a separate whetstone to sharpen them. She places them close enough to your ears that you can feel the vibrations reverberating on either side of your skull. All the while her original blade caresses your inner thighs, ");
	if(pc.hasFur()) output("shaving the furthest tips of your fur");
	else if(pc.hasScales()) output("clicking over your scales");
	else output("tickling your bare [pc.skinFurScalesNoun]");
	output(".");

	output("\n\nYou sigh as the sensations fill you with a tingling bliss, and gasp when a sharp prick on your arm takes it all away. The [enemy.skinTone] knight gives you a sadistic grin, licking the blood that drips from the dagger. A small gash sits on your arm, not dangerous but still a bit painful. The warrior woman notices your bitter staring, and snickers at your discomfort.");
	output("\n\n<i>“Maybe if you get some real parts I’ll let you feel the full experience instead of a taste,”</i> she says with a teasing tone. She reforms the damage she took during the fight, leaving you lying there as she returns to the caves. Eventually you recover enough to retrieve your [pc.gear] and return to exploring the caves, only missing a few shreds of dignity.\n\n");
	pc.lust(20);
	processTime(35);
	CombatManager.genericLoss();
}

//Win menu options
public function beatUpCrystalGoo():void
{
	output("The ganraen knight collapses from the pressure of the battle, ");
	if(enemy.HP() < 1) output("her armor mostly decimated by your concentrated attacks");
	else output("most of her armor slipping off as her body secretes lusty juices");
	output(".\n\n");
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock()) addButton(0,"Dick Fuck",malesBeatGoo,undefined,"Dick Fuck","Use your male parts on the fallen warrior.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You do not have a penis to fuck her with.");
		if(pc.hasVagina()) addButton(1,"Vag Fuck",femaleCrystalGooWin,undefined,"Vagina Fuck","Use your girlybits on the fallen warrior.");
		else addDisabledButton(1,"Vag Fuck","Vagina Fuck","You do not have a vagina to fuck her with.");
		if(pc.isTaur()) addButton(2,"Centaur Ride",centaurRideSpecialVictory,undefined,"Centaur Ride","Give her a ride she won’t soon forget.");
		else addDisabledButton(2,"Centaur Ride","Centaur Ride","You need to be a tauric creature, like a leithan, to do this action.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You aren’t turned on enough for that.");
		addDisabledButton(1,"Vag Fuck","Vagina Fuck","You aren’t turned on enough for that.");
		addDisabledButton(2,"Centaur Ride","Centaur Ride","You aren’t turned on enough for that.");
	}
	if(hasGooArmorOnSelf() && !hasGooArmorUpgrade("ganrael")) addButton(14,"Leave",armorGooVictoryShits);
	else addButton(14,"Leave",CombatManager.genericVictory);
}

//Male win
public function malesBeatGoo():void
{
	clearOutput();
	showGardeGoo(true);
	author("Gardeford");
	output("All that remains is a chestplate, a flimsy looking skirt, and her helmet. You walk proudly over to her, grinning as she tries to think of something to do. You pull the helmet carefully off her head, freeing a beautifully featured face sculpted from her goo body, along with [enemy.hair]. Your codex mentioned that the ganraen sometimes shape themselves like humanoids.");
	output("\n\nYou grasp the plate covering her chest, pulling it away with a slick pop. A pair of DD-cup breasts are freed by the action, their puffy nipples already beginning to harden from the sensation. The knight gasps in alarm, attempting to cover her boobs with both hands. Her attempts are in vain when they hit so hard that they sink deeply inside, leaving her chest free for you to play with. You squeeze the [enemy.skinTone] tits, being sure to press more gently than she had. To your surprise she doesn’t have much of a reaction when you pinch her nipples near to flatness, and instead simply gives you a defiant smile.");
	output("\n\n<i>“Ha! That won’t work on me. I concentrated all my pleasure receptors into my vagina!”</i> she says proudly, her face flushing a moment later as she realizes her mistake. You aren’t sure whether or not she can move her receptors quickly, but just in case you don’t give her the time. By the time the awareness of her slip appears on her face, your hands are sliding under her crystal skirt and over her gooey mons.");
	output("\n\nAt your touch she goes as rigid as her semi-solid body will allow, letting out half a moan as all the pleasure buttons her body has available get pressed at once. Her hands retract from inside her and grip your arms for dear life, anchoring herself to something solid as the inside of her diamond hard skirt is plastered with sex juices. She continues to cum for what seems like minutes, but can’t be more than a few seconds, before collapsing into a breathless heap in front of you.");
	output("\n\nYou gently pull the armored undergarment off of her, tossing it into a pile with her sword and chestplate. Her juices form a sticky web between her legs, and she tries to catch her breath while you survey her body. Now that she’s fully naked she looks just like a galotian imitating a human form.");
	output("\n\nHer slippery thighs part easily as you pull them aside, revealing the sex soaked exterior of her pussy. The mimicked organ twitches needfully in the damp cave air, inviting you to plug it up. You ready your [pc.cockBiggest], rubbing the head between her squishy [enemy.skinTone] lips. She stirs as your brushing brings her out of her orgasm induced stupor.");
	output("\n\nYou line your [pc.cockHeadBiggest] up with her hole, pressing it gently forward to make sure it’s perfectly aligned before ramming in at full speed. ");
	if(pc.cockTotal() > 1)
	{
		output("Your other ");
		if(pc.cockTotal() > 2) output("[pc.cocks]");
		else output("phallus");
		output(" penetrate");
		if(pc.cockTotal() == 2) output("s");
		output(" her legs, encasing ");
		if(pc.cockTotal() > 2) output("themselves");
		else output("itself");
		output(" in warmth. ")
	}
	output("You take her gooey lower lip in your mouth, sucking on it as she moans in pleasure. The [enemy.skinTone] goo-girl tries to kiss your nose, but the trapped portion of her mouth makes it impossible to do anything more than lick haphazardly.");
	pc.cockChange();
	output("\n\nYour [pc.cockBiggest] is enveloped in liquid pressure, milking along its surface with alien fervor. Whenever you pull back, the chaotically formed goo hardens to prevent your movement, only to melt back into jelly when you thrust back in. The girl’s knight roleplay has been given up completely, and she molds her body into your actions, mimicking them in reverse as she moans into your mouth.");
	output("\n\nSuddenly the semiliquid lady jerks her head back, shouting in orgasm as her jellied flesh sticks to your [pc.skinFurScales]. As she cums her body becomes slightly more solid for a second, the outer layer of her hardening slightly. The event gives you an idea, and you continue to pound her toughening body.");
	output("\n\nThe ganraen girl makes unintelligible attempts at speech as you give her no chance to rest. She cums again in rapid succession, your [pc.cockNounBiggest] rubbing her cluster of pleasure sensing nerves. A shudder runs through her body, and you feel part of her thigh solidify under your fingers. She gives a whimpering moan as she looks at her arm, seeing portions of it freeze into the diamond hard crystal that her armor was made of.");
	output("\n\nYou focus your efforts, stroking her budding clit until it becomes as rigid as a gemstone. You kiss her neck, licking up to one of her squishy goo ears. A laugh escapes your lips as you go, prompted by your tongue leaving a trail of solidified [enemy.skinTone] crystal in its wake. Despite her predicament, the hardening harlot can’t resist her baser urges.");
	output("\n\nShe lathers the side of your face with kisses, even as her body slowly hardens. Whatever control centers decide how to form her plates seem to be gradually overridden by the ones that decide how hard she should be cumming. You wonder what both kinds of receptors would think of a hot injection of your seed.");
	output("\n\nYou don’t have to think for long. You join in the sensual moaning as your lust boils over the edge. [pc.EachCock] blows it’s load into her hungry form. You look down to see spurts of your [pc.cum] clouding the [enemy.skinTone] insides. The lust drugged goo-girl’s limbs stretch and tense, fingers and toes splaying as she frantically searches for something to hold.");
	output("\n\nHer efforts wind up being in vain, as a great shiver winds its way over her body. She lets out a final echoing moan that is cut off half way as her entire body solidifies into a crystal statue. Her cunt remains just liquid enough for you to pull away before it too hardens into a perfect crystalline imitation of a woman in orgasm.");
	output("\n\nYou stare at the frozen beauty for a moment, wondering whether you should just leave her there or not.");
	//pc nice/naughty: 
	if(!pc.isAss()) 
	{
		output(" Eventually you decide that you don’t want to just abandon her if she ends up being unable to get out of the statue. Wanting to fuck you probably doesn’t warrant eternal imprisonment.");
		output("\n\nAfter recovering your [pc.gear], you search for the pile of crystal equipment that she had arrived with. You find the bunch, gripping the large sword in your hands. Pulling the heavy blade back to the trapped goo-girl, you drag it up so the point rests on her stomach. Gently as you can, you begin to slowly use the weapon like an ice pick, breaking small chips of the diamond-like material away from the larger mass.");
		output("\n\nAbout half a minute of chiseling has the outer shell cracking and falling apart. A shapeless puddle of goo coalesces in the center of the shattered pile. You wait for a moment, staring at the blob as it increases in size. To your surprise, a feminine arm extends from the mass, handing you a small clump of metallic material.");
		output("\n\n<i>“Thanks for letting me out, you can have this pretty thing,”</i> she says shyly, her former personality gone with the body that accompanied it. You take the gel covered crystal, not sure if it will be worth anything, and head back to exploring. A quick scan reveals the stone to be a small colorful gemstone, not worth much of anything, but maybe the ganrael use them.");
		//force crystal looot
		if (rand(2) == 0) enemy.inventory.push(new Kirkite());
		else enemy.inventory.push(new Satyrite());
	}
	//pc mean:
	else
	{
		output(" You decide to leave the girl frozen there. You think you remember something in the Codex about them being able to melt their crystals over time. You grab your [pc.gear] and head back to cave spelunking.");
	}

	// {get a gemstone if nice/naughty}{pass 1 hour}
	processTime(65);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Female win
public function femaleCrystalGooWin():void
{
	clearOutput();
	showGardeGoo(true);
	author("Gardeford");
	output("All that remains is a chestplate, a flimsy looking skirt, and her helmet. You walk proudly over to her, grinning as she tries to think of something to do. You pull the helmet carefully off her head, freeing a beautifully featured face sculpted from her goo body, along with [enemy.hair]. Your codex mentioned that the ganraen sometimes shape themselves like humanoids.");
	output("\n\nYou lean down, giving the battle-exhausted knight a sloppy kiss. Gripping her forearm with careful pressure, you guide her hand over your pelvis");
	if(pc.hasCock()) output(", weaving around [pc.eachCock]");
	output(" until her fingers reach your [pc.vagina]. Her gooey flesh is as cool as the cavern air against your mons, sending a chilled tingling sensation through your body.");
	output("\n\n<i>“Wait! ");
	if(pc.hasCock()) output("Shouldn’t you use a");
	else output("Don’t you want me to give you a");
	output(" dick, since I’m shaped like a girl?”</i> She asks as you rub her fingers over your folds. You smile coyly and slip your fingers over the edge of her chestplate. The top of her bust is squashed down by the offending garment, and you pull it off. Her thankful DD-cups spring free, jiggling in the cave air.");
	output("\n\n<i>“Don’t you know? Some princesses prefer the female knights,”</i> you tell her before taking one of her gooey nipples between your teeth. The jellied nub is slightly tougher than its surroundings, and offers a little resistance when you press it down with your tongue. The ganraen girl coos in resignation, brushing a hand ");
	if(!pc.isBald()) output("through your [pc.hair]");
	else output("over your bare head");
	output(". You cease your guidance, and she continues to rub your [pc.vagina] with her other hand.");

	output("\n\nWith your newly freed fingers you caress her stomach, letting your digits swim through her mid-section. The feminine slime’s cooing melts into blissful moaning as you press further, letting your entire forearm sink into her yielding flesh. You slowly move up her belly and through her chest, eventually traveling past her throat and into her mouth. Your fingers exit her lips as they freeze in an orgasmic ‘O’ shape.");

	output("\n\nHer tongue tickles you as it licks around the intruders, and she sucks on them as her body relaxes. Her insides tighten like a pussy around your arm, massaging your muscles with calculated squeezes. All the while you continue to tease her nipples, switching breasts every couple seconds to make sure neither feels left out. By this time both of them have swelled to rougher nubs, and you can hardly squish them at all without roughly gnawing.");

	output("\n\nDown at your pelvis, the goo-knight’s fingers coalesce into a tendril of more solid material. You moan as her arm tentacle penetrates your [pc.vagina]");
	if(pc.totalVaginas() > 1) 
	{
		output(", and gasp as more split to tease your other vagina");
		if(pc.totalVaginas() > 2) output("s");
	}
	output(". Its tip searches your walls, rubbing and prodding until it finds what it’s looking for.");

	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		pc.cuntChange(x,100);
	}
	output("\n\nAs the curious member finds your g-spot, you feel your consciousness flutter. The ganraen woman notices your shiver of pleasure, immediately going on the attack. She lays into that spot, gently brushing and poking at it until you’re reduced to a fit of moans. You bury your face in her cleavage to mute yourself, and the sounds of the cavern are silenced as the warm goo of her mounds plugs your ears.");
	output("\n\nYou hear the liquid shifting of her body echoing around you, along with a dull hum that you eventually realize is your moans being quieted by her fluid interior. Her throat constricts around your fingers, preventing you from moving as her tentacle assaults your deepest pleasure spots. It only takes a minute or two before your body is fighting to move.");
	output("\n\nYour attempts fail as a wall of bright light falls on your mind. You twitch uncontrollably as the force of your orgasm renders you helpless. The semiliquid lady holds you as best she can as you spasm, her tongue still lapping at your digits. You ride out the intense wave of feeling, squeezing and molding the strangely supportive goo-flesh as your feeling returns to you.");
	output("\n\nAlong with the ability to move comes your senses, and you pull yourself away from the ganraen knight’s sticky chest. You take a deep breath, pressing on the semisolid slut’s nose with a kiss. She finally relaxes enough for you to pull your arm from the confines of her throat, immediately repositioning your freed fingers underneath her crystalline skirt.");
	output("\n\nInch by inch, you tug her skirt down around her squishy hips, tossing it into her pile of gear when you fully remove it. Her slippery skin makes it easy to trace down one of her legs until you’re rubbing her slit. You pinch her budding clit, squishing it together before letting your fingers slip inside her twitching cunt.");
	output("\n\nThe ganraen girl throws her head back with a lust drunk moan, and you seize the opportunity to lick at her exposed neck and chin until her mouth returns to receive your kisses. Each time your [pc.tongue] crosses her lips, her walls tighten around your pistoning fingers. Your thrusts move with such force that you’re not sure whether some of them make it to her passage, instead spearing a random portion of gooey interior.");
	output("\n\nIf you are making such errors your malleable partner gives no indication. Her shouts only increase in volume and frequency with each iteration of your plunging digits. You hear her moans echoing through the caves, and give her a kiss to try and muffle them in case something else hears your pleasurable romp.");
	output("\n\nYour last kiss ends up being too much for the beleaguered goo girl. She whimpers softly around her tongue as her body restricts too tightly to imitate speech. Her legs clench as you pull your fingers free and rub at her throbbing clit. Her feet press so tightly together that her lower body fuses up to the knees. Along with her orgasm comes a flash of solidity, freezing her into a diamond hard statue in a couple of seconds. You barely have time to pull away from your kiss, still connected to the effeminate effigy by strands of gooey saliva.");
	output("\n\nYou wipe your mouth, looking hazily around for her equipment.");
	//pc nice: 
	if(!pc.isAss()) 
	{
		output("\n\nYou eventually find the pile, pulling her sword out and lugging it over to her solidified body. You heft it and bring the tip down like a pick-axe, repeating the process until the crystal plating cracks and chips away. Inside a blob of goo coalesces into its center cavity. You wait for a moment, staring at the blob as it increases in size. To your surprise, a feminine arm extends from the mass, handing you a small clump of metallic material.");
		output("\n\n<i>“Thanks for letting me out, you can have this pretty thing,”</i> she says shyly, her former personality gone with the body that accompanied it. You take the gel covered metal, not sure if it will be worth anything, and head back to exploring. A quick scan reveals the stone to be a small colorful gemstone, not worth a ton, but maybe useful to someone.");
		if (rand(2) == 0) enemy.inventory.push(new Kirkite());
		else enemy.inventory.push(new Satyrite());
	}
	//pc mean: 
	else output("\n\nYou find her gear, but decide that maybe you shouldn’t free her. She did attack you after all, and you remember something in the codex about them being able to melt their crystal over time. You gather your [pc.gear] and return to your cave spelunking, leaving the statue of a girl to wait.");

	// {get a gemstone}{pass 1 hour}
	processTime(65);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Centaur ride special victory
public function centaurRideSpecialVictory():void
{
	clearOutput();
	showGardeGoo(true);
	author("Gardeford");
	output("The ganraen knight staggers from the pressure of the battle, ");
	if(enemy.HP() < 1) output("her armor mostly decimated by your concentrated attacks");
	else output("most of her armor slipping off as her body secretes lusty juices");
	output(". She manages to hold herself up with her sword, now clad in only a chestplate, her helmet, and a rapidly slipping plate-skirt. You canter over to your prey, circling the [enemy.skinTone] warrior to get a better view of her body. Futile attempts to cover her assets go unnoticed as you examine her curves.");
	output("\n\nOnce you’re done you move in closer, extending your hand to the defeated warrior. She gives you a suspicious look, taking a step back while eyeing you through the slit of her helmet.");
	output("\n\n<i>“Don’t be shy. Every knight needs a dashing steed, right?”</i> you ask, patting your rump invitingly.");
	output("\n\nThe colorful ganraen is taken aback, standing dumbstruck for a moment before taking your hand. You pull her up until her gooey frame is seated comfortably on your tauric hindquarters, semiliquid thighs feeling pleasantly cool on your [pc.skinFurScales]. While she gets adjusted you begin to trot in circles, helping her get accustomed to the movement. To your surprise, the armored goo girl gives a sudden moan as you begin to move.");
	output("\n\n<i>“W-wait! All my pleasure receptors are in my hips and pussy. Let me move some of them first, or it-it’ll-mmm. It feeelz too good,”</i> she begs as you move, her words becoming less coherent as she bounces atop your back. You gradually slow your trot, but just before you stop you pick up speed again, gracefully maneuvering through the cave tunnels. The surprised warrior’s legs clench instinctively around you, trying to maintain her hold as you cover ground.");
	output("\n\nPleasurable moans greet your ears as the crystal plated goo girl struggles to maintain her consistency. She collapses against your back, hugging her arms around your [pc.chest] to hold on. Some of her armored plating slips away in the confusion, leaving her bare breasts to rub against your [pc.skinFurScales].");
	output("\n\nThe cool tunnel air blowing on your working muscles makes the effort less strenuous, and the knight’s warm legs prevent it from cooling you down too quickly. Her plate-skirt manages to remain in place around her hips, but beads of liquid lust trail down your tauric hindquarters as her [enemy.skinTone] goo-pussy is pressed against your flexing muscles.");
	output("\n\n<i>“S-slow down! I’m about to c-cum!”</i> She shouts as you barrel through the caves, taking turns that bring you in a wide circle. Slowing down is the last thing on your mind as you bring the pleasure drunk warrior on a lustful journey through the tunnels. Your prisoner by proxy shudders, and you feel rivulets of sticky cum trickle down your sides.");
	output("\n\nOnce your rider settles down you finally decide to slow it down, stopping around the same place you fought her in the first place. Giving the exhausted girl her cavalry training has left you well worked and still raring to go, and the runnels of lust dripping along your [pc.skinFurScales] only fuel your desire. The plate skirt slips over her hips as you help her off your back, and her legs give out as soon as your support is withdrawn.");
	output("\n\nYou reach forward to pull off the crystalline helmet, figuring that since the rest of her clothes have fallen off you might as well finish the job. Underneath the armor she has a humanoid face, complete with a button nose and panting mouth. Droplets of goo fall from her makeshift hair, gradually being re-absorbed by her body after they hit the ground.");
	output("\n\n<i>“A knight needs to take care of her mount after a ride. You wouldn’t want me to be too tense for our next adventure, would you?”</i> You tell her as you knead her squishy nipples. She gives you a dazed nod, unable to give a more solid response as she moans from your touch. Semisolid flesh leaves an impression of wetness on your fingers, and you pull them away as you turn yourself toward her.");
	
	//male
	if(!pc.hasVagina() && pc.hasCock())
	{
		output("\n\nYou walk forward and over the kneeling knight, positioning [pc.eachCock] just above her face. Her simulated panting quickens at the sight, and you can practically feel her eyes tracing every part of your sex. Looking down, you notice her sitting near totally still, head swaying hypnotically as she stares at your underside.");
		output("\n\n<i>“Hey! Are you going to get started down there or should I find someone else?”</i> you tease, smirking when the entranced goo-girl snaps out of her haze. She scoots up, ");
		if(pc.cockTotal() == 1) output("kissing your [pc.cockHead] with liquid lips");
		else output("planting a kiss on each of your cockheads in turn");
		output(". Her malleable flesh leaves spots of wetness on your [pc.skinFurScales] that feel cool in the cavern air. [pc.EachCock] begins to stiffen at her attentions, twitching needfully in anticipation.");

		output("\n\nYour companion doesn’t leave ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" waiting for long, and you sigh as her mouth closes around your [pc.cockBiggest]. You stifle a moan as the warm, wet tunnel of her throat contours itself into the perfect fit for your member, and feel your hips give an instinctive thrust. The gooey warrior’s tongue wildly laps at your length, tasting every inch it can reach.");

		output("\n\n<i>“That’s a good girl, milk that stress out”</i> you instruct playfully. The ganraen woman hums happily at the praise, sealing her lips around your [pc.cockHeadBiggest] like a vacuum before letting it go with a loud pop. In seconds she’s back on the assault, ");
		if(pc.cockTotal() == 1) output("her hands assisting with the effort");
		else 
		{
			output("her hands playing with your other cock");
			if(pc.cockTotal() > 2) output("s");
		}
		output(". Fluid fingers brush along your [pc.cockBiggest] and ");
		if(pc.balls > 0) output("cup your [pc.balls], massaging them gently to coax their contents.");
		else output("between your legs, winding up circling your [pc.asshole].");

		output("\n\nA jolt of sexual energy causes you to buck your hips, and you feel a rush of cold air on your [pc.cockHeadBiggest]. You lean over to find out what happened, only to see your member sticking out of the semisolid slut’s head. She doesn’t seem perturbed in the slightest, using the opportunity to suction her lips all the way to your [pc.sheathBiggest]. The rapid movement sends shudders through your legs, and you quiver for a moment before they buckle.");
		output("\n\nAll of your weight falls atop the unsuspecting ganraen, causing a splash of [enemy.skinTone] liquid. You try to stand, only to fall again as the jellied gladiator sucks even harder. She’s been reduced to a puddle beneath your tauric frame, but now she covers ");
		if(pc.cockTotal() > 1) output("the entirety of [pc.eachCock]");
		else output("enough of your [pc.cockBiggest] to give it a full body massage");
		output(". Every thrust into the engulfing blob brings an inexorable tide of euphoric contractions that numb your thoughts and dull your reason.");

		output("\n\nAs the pieces of her body that were knocked away by your fall begin to reform, her body increases in size. A tendril of gelatinous lust creeps between your legs, caressing your ");
		if(pc.balls > 0) output("[pc.balls]");
		else if(!pc.hasVagina()) output("inner thighs");
		else output("[pc.vagina]");
		output(" before moving on to your [pc.asshole]. You gasp in shock as the tendril penetrates you, growing steadily more solid as it reacts to your body. The crystallizing tentacle lets free a burgeoning tide of lust that sweeps away the rest of your consciousness.");
		pc.buttChange(10);

		output("\n\nYou give one final thrust into the noisily slurping blob, your dick throbbing in the intense tightness before loosing a spurt of [pc.cum]. ");
		if(pc.cumQ() < 50) output("A few more strings quickly follow, slightly less impressive in size, but still formidable");
		else if(pc.cumQ() < 1000) output("A further gush of love juice swiftly follows, filling the cavity containing [pc.eachCock] with your seed");
		else output("A veritable flood of seed follows it in gushing streams, painting the [enemy.skinTone] blob a shade of [pc.cumColor] from inside to out");
		output(". Your entire body tenses, pushing the now solidified tendril out from between the cheeks of your [pc.butt] as your orgasm rushes through it.");
		output("\n\nUpon the conclusion of your ardor induced spasms, you collapse sideways onto the cave floor. The squished goo-girl extends her body to catch you, lowering you onto a spongy pillow of soft gel as she reforms herself. She runs her fingers ");
		if(pc.hasHair()) output("through your [pc.hair]");
		else output("over your smooth scalp");
		output(" as she waits patiently for you to recover. Once you feel confident enough to stand, the two of you get to your feet.");
		output("\n\n<i>“Come back sometime so we can play again. Maybe next time I’ll have better luck,”</i> she says as she retrieves her crystalline outfit. What she can’t find is steadily replaced by hardening portions of her body. You gather your own [pc.gear] and head off to explore more of the caves.\n\n");
	}
	//female
	else
	{
		output("\n\nYou step forward as you spin around, positioning your [pc.vagina] directly above the goo knight’s face. Her simulated breaths quicken at the sight of your dripping sex, and you can practically feel her need caressing your body. A quick turn of your head reveals her staring at your hindquarters with an awed glaze over her eyes.");
		output("\n\n<i>“Well? Stop looking and get to it! I don’t have all day to sit here while you stare and drool,”</i> you say, reaching back to spread your slick netherlips. The enraptured goo girl lifts herself up, burying her face in your backside. She laps at you with inhuman fervor, and you moan as her tongue explores your [pc.vagina].");
		output("\n\nThe ganraen woman’s lips vibrate gently as they brush against your [pc.clit], and you feel your hips shudder unconsciously in response. A tongue wetter than any human’s works to cool your overheating insides, lapping at every part of your inner folds it can reach. You subconsciously back up into her face, trying to push her tongue even deeper inside.");
		output("\n\nElectric pulses of pleasure run through your tauric half and up into your [pc.chest] as the alien beauty tries her best to oblige your needs. Your legs quiver and then buckle as your tired muscles are overloaded with pleasurable feelings, dropping your entire weight atop your partner. The [enemy.skinTone] goo-girl’s body splashes apart as you land, but immediately begins to reform. As her shape reforms, warm tendrils of goo slip inside your body.");
		output("\n\nThe vibrating glob that once made up the goo-girl’s humanoid face pistons into your body. Pleasurable pulsations echo in your core as the passionate puddle pumps herself through your [pc.vagina]. Your muscles futilely attempt to clench around the intruder, but her semi-liquid form resists even your tightest contractions.");
		output("\n\nGradually, you feel the sloshing gel within you begin to solidify into a definite shape. A quick glance over your shoulder reveals a lusty smile from the ganraen’s newly reformed lips. She holds the end of a [enemy.skinTone] dildo that she’s crafted as a perfect fit for your [pc.vagina]. The diamond hard rod finally gives you something to clench around, but the grinning knight moves it with no sign of straining.");
		output("\n\nThe shape hits all the right spots inside you, still not fully recovered from the assault of her tongue. Coo’s of happiness escape your lips as the now fully reformed goo-girl kisses both cheeks of your [pc.butt], gently nibbling at the [pc.skinFurScales] until she reaches the center. She gives you a wet, drawn out lick from the base of her gemstone dildo all the way to your [pc.asshole], continuing until ");
		if(pc.tailCount == 0) output("she reaches your tailbone.");
		else output("her face is buried beneath your [pc.tail].");

		output("\n\nYou find yourself trying to stand involuntarily as your hind legs tense up, but quickly slip on the fuck-puddle beneath you and splash back down to the cave floor. The ganraen’s form swirls around, leaving one of her arms to work the sex-toy while she pulls your humanoid upper body into a hug. Through the haze of lust you attempt to kiss her, but your [pc.lips] miss hers each time, wetting themselves on her [enemy.skinTone] face.");
		output("\n\nShe giggles at your attempts, finally cupping your cheek and guiding you to success. Blissful electricity melts your defenses as her tongue explores your mouth. Your [pc.vagina] clenches tightly in orgasm,");
		if(pc.totalVaginas() > 2) output(" its sisters spasming sympathetically as it attempts");
		else output(" trying fruitlessly");
		output(" to expel the crystalline cock. When the flood of ardor finally abates the goo-girl slowly retracts her dildo, easing it out of you inch by inch until it slides free.");
		output("\n\nYour humanoid upper body falls into the knights waiting arms, and you let her warm body soothe your aching muscles while you recover. When you finally feel ready to stand you pull back, wiping yourself dry and shakily getting to your feet. You gather your [pc.gear] as the [enemy.skinTone] ganraen reconstitutes herself into a more humanoid shape.");
		output("\n\n<i>“Come back some time so we can play again,”</i> she says, steadily reforming her armor as she turns to leave for a different part of the caves. <i>“Maybe next time you won’t be so lucky”</i>");
		output("\n\nYou laugh and return to exploring the caves, heading in a different direction than the semisolid fighter.\n\n");
	}
	processTime(55);
	pc.orgasm();
	CombatManager.genericVictory();
}

/* GOO VILLAGE */
//Visit goo village
public function gooVillageThinger():void
{
	author("Gardeford");
	showName("GOO\nVILLAGE");
	currentLocation = "2S29";
	generateMapForLocation(currentLocation);
	//Set village as met!
	flags["MET_CGOOS"] = 1;
	if(pc.canFly()) output("\n\nThe tightness of the passage and the jagged looking rocks at its ceiling make you think twice about flying through it, and you land to get a safer grip.");
	output("\n\nYou step into the thin crevasse, determined to find where the trickling liquid trail leads. The ground is incredibly slippery, and you reach for a rocky outcropping to steady yourself. Unfortunately the protruding stone is also covered in goo, and you topple over sideways. The tiny river is all it takes to coat your body with enough slime to make recovery improbable, and you cover your head as you barrel down the passageway.");
	output("\n\nThe slide ends more quickly than you would’ve thought, opening into a larger cavern full of swirling colors. You slide a few meters into the room before being stopped by an abrupt impact. ");
	if(pc.shields() > 0) output("Your shield fizzles as it blocks out the brunt of the hit");
	else output("The wind is knocked out of you by the force of the blow");
	output(", and you shield yourself as numerous heavy plates clang down atop you. Once the cacophony ends you have a little time to recover your bearings, calming your breathing as you hold what you now see are multicolored crystals above your head.");
	output("\n\nSuddenly, the plates covering you liquefy, coating you in more of the sticky goo that covered the passage. You do your best to wipe it from your eyes, blinking the last of it away to find out what happened. A group of variably colored goo-girls - and some with male forms as well - surround you, staring on with wide-eyed, apprehensive expressions. Your codex gives a slime-muffled beep to tell you that these are ganrael, ");
	if(CodexManager.entryUnlocked("Ganrael")) output("but you already knew that");
	else
	{
		output("a race of crystal forming goos");
		CodexManager.unlockEntry("Ganrael");
	}
	output(".");
	output("\n\nYou look around, noticing a number of small huts formed from crystalline panels. A bad feeling about the gemstone plates that covered you crosses your mind before the sticky gel that covers you solidifies, trapping you in place. The formerly surprised expressions shift to annoyed glares as your new captors close in around you. An orange-colored girl with a braid secured by citrines looms over you, and the others halt.");
	output("\n\n<i>“You knocked over my house,”</i> she states with heated fervor. Her frame looks incredibly tense for being less than fully solid, and she gives you a soul withering frown. The rest of her kin shake their heads and furrow their brows, looking ready to deliver mob justice. Heat flushes through your face as you try to think of a way out.");
	output("\n\n<i>“[pc.HeShe] must be punished! One day in jail and nominal discipline!”</i> the amber ganraen shouts, and the mob replies with smiles and exclamations of joy. What have you gotten yourself into? Three village members lift the entire crystal formation that encases you and carry it through the cavern. It looks like there are maybe six members total unless there are still some sleeping in the huts.");
	output("\n\nThe procession carries you past a handful of other small buildings, none any larger than ");
	output("nine feet");
	output(" high. At the back of the cave a larger crystalline cage sticks out, reaching all the way to the cavern ceiling with a number of floors. You’re carried to a medium sized cage along the structure’s front end, where your captors finally set you down. The solidified shackles melt once your pedestal is inside with the door locked behind you.");
	output("\n\n<i>“You stay here for now. We will come back with appropriate food at the designated feeding time, and then again at your designated punishment time,”</i> one of them states matter-of-factly. The group leaves after her instruction, heading back to mill about their village. You steel yourself and wonder what kind of punishment they have in mind, sitting on the squishy floor.");
	processTime(35);
	clearMenu();
	addButton(0,"Next",ganraelVillagePartTwo);
}

public function ganraelVillagePartTwo():void
{
	clearOutput();
	author("Gardeford");
	showName("GOO\nVILLAGE");
	output("<i>“Hey, are you just gonna sit over there and sulk or will you come introduce yourself?”</i> comes a voice from the back of the cell, making you spin in surprise. For the first time you take note of your cell’s other inhabitants. The voice belongs to a raven haired red myr woman, dressed in a cloth shirt and sweatpants. She’s sporting a DD-cup chest and a fit frame, sitting in the corner of the cell with her legs crossed.");
	output("\n\nThe other corner is inhabited by a female gold myr dressed in a posh sundress and high heels, one of which has broken off at the base. She has long platinum blonde hair and a noticeable tan, with jewelry full of semiprecious stones. With looks like that you’re surprised to see her in the deep caves at all, let alone a jail cell. She hugs herself with both sets of arms and leers at both you and the red.");
	output("\n\n<i>“Don’t worry about her. It’s her first time and she’s still grumpy about having to stay here,”</i> the dark haired ant explains, earning another glare from the disgruntled gold girl. You grin at the situation, easing up a bit despite your predicament.");
	output("\n\n<i>“Easy for you to say, since you live here or something! My girlfriend is a queen’s handmaiden, I shouldn’t have to deal with this,”</i> the rich woman snaps, tucking herself even more tightly into her corner. Her cellmate laughs at this, stretching out and getting to her feet in order to move closer to you.");
	output("\n\n<i>“So, what are you in here for? Richie rich over there tried to vaporize one of the knights with one of those fancy space-farer guns when she got separated from her cave tour group. I stole from the shop. Best way to get in without causing too much trouble,”</i> she says with a wink, whispering the last part. You tell her about your fall down the tunnel and knocking over the building, earning a laugh that she tries - and fails - to suppress.");
	output("\n\n<i>“I’m sorry, but that’s pretty hilarious. Don’t worry though, even the most hardened looking offworlders fall sometimes. It’s a good thing you didn’t get hurt running into that building, I broke an arm the first time I ran into the ganrael. Luckily their crystals are just as useful as splints as they are for breaking things,”</i> she says, smiling and rapping on one of the colorful bars. You ask her what miss princess meant when she talked about her living here.");
	output("\n\n<i>“Let me put it this way: I have the choice to go back to a war torn city that might not have even been part of my country’s culture in the first place. I might have gotten drafted, guilted into service, or settled down to live a boring life. Or... I come down here, make a little bit of trouble or try to take some meaningless balls of slime. In a matter of minutes I’m sitting in a sizeable room with soft bedding and as many cave berries or mushrooms as I can eat. Not to mention the guards are a lot of fun, in a silly-goo-creature kind of way. I can’t be the only person who would pick that as the better option,”</i> she says, her careless demeanor turning serious as she talks. When she’s finished she takes a deep breath before smiling again.");
	output("\n\n<i>“Anyway, I come down here all the time. I still go back and visit friends whenever I get out, and at least some of them know my general location when I disappear for a while. Little do they know I’m a repeat law-breaker in a crystal goo village,”</i> she laughs, leaning back against the cell bars.");
	output("\n\n<i>“That’s what will happen if her kind wins the war you know,”</i> comes the voice of the gold from her corner. <i>“Crime rates will jump up, and people’s wives will be stolen away by those sluts and their toxic spit that makes you crazy for sex! Our poor queens will be locked away forever.”</i> The red myr twirls her black hair as she listens, giving you an incredulous glance once the tirade is over.");
	output("\n\n<i>“I don’t know about them being locked up. I’m sure your queens would just love some of our delicious service,”</i> she jokes, making an exaggerated show of licking her lips in the gold’s direction.");
	output("\n\n<i>“That seems to be a big winner in gold propaganda; our saliva being an addictive chemical that brainwashes people into wanting sex all the time. It’s not that bad at all. Sure it works as an aphrodisiac, but the only people likely to get addicted to it are uptight snobs who can’t get pleasure in any other way,”</i> she explains, whispering her response to you so the rich girl can’t hear.");
	output("\n\n<i>“Of course we get propaganda that says all of their lot who aren’t posh higher ups are brainwashed into mindless slaves by their queens and have no sense of free will. I don’t believe a word of it. As much as she seems to prove them right, I’ve seen some perfectly willful individuals come out of those trenches only to be recruited directly to our side without much choice.”</i>");
	output("\n\nA racket from the door interrupts your conversation, and you turn to see an armored goo soldier opening the cage. He looks to be carrying a large platter, with a medium sized satchel draped over one of the gemstone plates on his arm. The platter is covered in an assortment of tiny mushrooms and dark berries, some occasionally pulsing with brighter colors.");
	output("\n\n<i>“Time to eat!”</i> the guard exclaims in a jovial and surprisingly deep voice. He shuts the door behind him and strides over to your corner of the room, handing the platter to the red myr and the satchel to you.");
	output("\n\n<i>“There are foods from above in that. It was confiscated from that one so you can eat them since your offense was only minor,”</i> he says, looking in the direction of the gold myr before prompting you to open the bag. She looks as if she wants to say something, but reconsiders when she meets his gaze. He turns to her again as he reaches the door.");
	output("\n\n<i>“Your punishment will be later tonight, you should eat before-hand,”</i> he states sternly, closing the door behind him before returning to the village. As soon as he is out of sight the four-armed brat scoots as close as she can to the taller red girl, mumbling about how that was her food and that her life is terrible.");
	output("\n\nYou open the pack to find a number of rations from a JoyCo standard exploration care package, each emblazoned with the company’s simple logo. ");
	if(pc.isNice()) output("Not wanting to incense her ill attitude, you hand the blonde ant one of the ration packs. She snatches it out of your hand, getting it halfway open before pausing and thanking you sheepishly.");
	else if(pc.isMischievous()) output("You hand the blonde ant one of the ration packs, yanking it away as she grasps for it before dropping it into her hands. A fierce blush covers her features as she opens it, eating the contents in silence.");
	else output("You open and devour one of the ration packs, not even looking in the blonde ant’s direction.");
	output(" The raven haired woman picks various berries and fungi to eat. She hands some to her cellmate as she picks through them, swatting the younger woman’s hand when she tries to reach for some herself.");
	output("\n\n<i>“Those are poisonous! The crystal goo people try hard, but they aren’t exactly the best judges of what’s healthy. Just sit back and I’ll make sure you get fed,”</i> she explains with a curt tone, passing over a handful of food. The pampered gold looks ashamed, eating her food slowly as she shifts around. The fair-skinned myr sighs, wrapping an arm around her counterpart.");
	output("\n\n<i>“Look, it’s not gonna be that bad. Their punishments won’t involve chopping you up or anything like that, and we’ll be here the whole time. I can’t tell you exactly what will happen, but I’m sure it’ll be over before you know it,”</i> she says in a much more comforting voice. For the first time since you arrived the sun-tanned girl relaxes, sitting more comfortably while she finishes her meal.");
	pc.energy(35);
	processTime(22);
	clearMenu();
	addButton(0,"Next",ganraelJail3);
}

public function ganraelJail3():void
{
	clearOutput();
	author("Gardeford");
	showName("GOO\nJAIL");
	output("After the three of you have eaten, a group of five ganrael approach the door, entering and forming a circle around your corner. A fully naked goo-girl with hefty G-cups beckons the gold myr to come out, frowning with a seriousness that dispels any questions about her nudity. The ant-girl hugs her new found friend tightly, unsure of what to do.");
	output("\n\n<i>“You have committed a severe crime against our people, so you will receive separate punishment from each of us in turn. If you do not comply your punishment will be more severe,”</i> the lead guard warns, beckoning again for the girl to come forth. The four-armed myr looks about ready to panic, looking between the ganraen captors and the two of you. The red-chitined woman takes the initiative, pushing the nervous girl to her front and steadying her upper pair of arms.");
	output("\n\n<i>“Here’s how this is gonna work. I’m gonna lift up my shirt, and you can suck on one of my tits while these goo creatures have their way with you. I’ll cover your ears so you can just imagine it’s that big important girlfriend of yours fucking you with a honey-coated dildo. I won’t ‘inject you with toxins’ or anything stupid like that,”</i> she instructs matter-of-factly. The gilded myr looks confused for a moment before recognition seems to click inside her.");
	output("\n\n<i>“I-I don’t even have a girlfriend. None of this jewelry is worth much, and I was just trying to sound important so they wouldn’t treat me badly. This is my f-first time, what if they ruin me so I’ll never feel good from anything except their goo cocks. O-or what if I’m fucked so senseless that I just become a sex slave here forever!”</i> You swear you can see her drooling as she goes on to describe other things that could happen, and you see the red myr’s expression move from compassion to bewilderment.");
	output("\n\nThe dark haired woman rolls up the base of her shirt, letting her close to E-cup breasts free from their containment. She pulls the gold out of her daydreams mid sentence, silencing her with a nipple. She signals the crew of goo-knights to start when she’s done, covering the gold’s ears with her palms before turning in your direction.");
	output("\n\n<i>“I swear she exists to prove all of our propaganda correct. Who even does that kind of thing,”</i> she asks, obviously not expecting an answer. A purple knight pulls the presenting myr’s pants down to her knees, and you see her eyes close tightly in preparation. The first ganrael up to bat is the bright orange female who first spoke, kneeling behind her and shaping a semi-solid cock from the coalesced goo above her pelvis.");
	output("\n\nThe ganraen judge rubs her bitch-breaking member between the ant-girl’s ass cheeks, eliciting a muted moan from the deafened recipient. The freshly crafted cock slips up her abdomen to reach her pussy, pausing for a moment before pressing in hard. Her whole body is pushed forward as the inconstant dick enters her body, and she shudders with pleasure as her face is squeezed tighter to the red’s chest.");
	output("\n\nDespite her imposing figure, the head judge appears to be quite the quick shot. Hardly more than a minute after she begins pistoning she falls atop the golden myr’s back, humping wildly as her massive bust soaks the smaller girl’s clothing. With one final thrust, she buries herself as deeply as she can reach and cums. You see her overall body size shrink as steaming orange ‘jizz’ floods back out from the ant-girl’s pussy. When she finally pulls out her massive breasts have been reduced to measly C-cups, and her stature has been reduced to almost cuddly proportions.");
	output("\n\nShe backs away, steadily reforming herself from the puddle of faux-cum that still drips out of the myr prisoner’s pussy. The purple knight comes second, removing some of his armor to reveal a male shape. He already has a fully solidified amethyst cock, and plunges it into her waiting cunt as soon as his partner is out of the way. The red ant makes sure her punished cellmate is situated before turning back to you.");
	output("\n\n<i>“So yeah, this is basically what punishment is around here. Though I must say it’s a bit less forceful when you haven’t nearly killed one of the villagers. The first time I came down here, when I broke my arm, they treated me so nicely I thought I must have felt what the gold queens feel with their constant pampering. I’m ashamed to say it felt kind of addict-OW! HEY,”</i> she shouts suddenly, swatting the gold myr on the head before covering her ear again.");
	output("\n\n<i>“No biting! I don’t know exactly how it works with you golds, but you aren’t gonna be getting any honey out of me no matter how hard you suck. Anyway, I stayed down here until my arm was fully healed. After that I came back whenever I was feeling down on my luck, or when I was sad and needed to unwind. These guys are really good at listening, sure they might not remember what you say after a few hours but still,”</i> she says, brushing the tips of her fingers through her fellow prisoner’s golden hair.");
	output("\n\nThe two of you return your attentions to the aforementioned cellmate, finding her trembling as a new member of the judge group fucks her into ecstasy. Judging by the multicolored pool of juices that she now kneels in you imagine this is the last member. The well fucked myrmedion’s lips part from their seal around her anchor’s breasts, and she buries herself into the raven haired girl’s cleavage as she moans in orgasm. Her final partner, a viridian female knight, draws back from the quivering ex-virgin, pulling a long and dextrous tongue out of the jewel- adorned girl’s asshole.");
	output("\n\n<i>“That was a good punishment! I’m afraid you two will have to wait a few more hours though, we need some time to process what we got from her,”</i> the orange head judge says, now fully restored to her previous height. The procession of giddy goo creatures exits your cage, giggling drunkenly and waving back until they disappear from sight. You turn back to your temporary companions, stretching wearily. The gold-plated girl has fallen asleep, using her former enemy’s stomach as a pillow.");
	output("\n\n<i>“You can get some sleep if you want. I’ll wake you up if anything interesting happens,”</i> the dark haired woman assures you. You lie down on the spongy gel that makes up the jail floor, finding a comfortable spot to get a few hours of sleep. It’s not often you get that kind of opportunity away from your ship.");

	processTime(34);
	pc.lust(45);
	clearMenu();
	addButton(0,"Next",ganJail4);
}

public function ganJail4():void
{
	clearOutput();
	author("Gardeford");
	showName("GOO\nJAIL");
	output("You awaken some time later to some kind of small cave lizard squawking at you from outside the cage bars. You sit up, wiping slimy gel off of your face as you gather your wits. A quick survey of your surroundings reveals no major changes. The trinket adorned gold myr is still sleeping, but her sex soaked clothing has been replaced by the shirt the red had been wearing before. A portion of the shirt is torn from the bottom, but the size difference makes up for it, covering her to just below her hips.");
	output("\n\nThe outfit’s former owner sits with the gold’s head in her lap, still wearing her pants and an improvised chest-wrap made from the torn cloth. She looks to have just woken up herself, stretching her arms and neck before looking down at the girl in her lap.");
	output("\n\n<i>“Damn, she’s really out cold. I changed her out of those soaked clothes so she wouldn’t get sick. It’s way too big for her, but it’ll work till she gets back up top, and I’ve got plenty of other shirts like it,”</i> she explains, brushing inky hairs away from her eyes. She looks towards the village proper just as you hear the rattle of the door. You turn to find the head judge from the night before entering the enclosure.");
	output("\n\n<i>“Good morning prisoners, did you have any good sleepings? I always wonder what you solid creatures are thinking when you do that stuff, but you sure look super cute doing it. Now, what did I come out here for... Oh yes! It is your punishment time. Since you’re a first time offender you have a choice to make. You can either accept the usual punishment, or we will make an exception and use a more crude method of extracting some of your genetic material,”</i> the orange bodied woman explains. It looks like you have a choice to make.");
	processTime(333);
	//[Acceptmale][acceptfemale]{take the usual, it can’t be that bad} [Deny]{goo sex doesn’t sound like your cup of tea right now}
	clearMenu();
	if(pc.hasCock()) addButton(0,"Accept (Dick)",acceptStupidoopyPunishment,true,"Accept (Dick)","Let her collect all the genetic material she wants from your penis. It can’t be that bad.");
	else addDisabledButton(0,"Accept (Dick)","Accept (Dick)","You have no dick to accept with.");
	if(pc.hasVagina()) addButton(1,"Accept (Vag)",acceptStupidoopyPunishment,false,"Accept (Vagina)","Let her collect fluids from your vagina. It can’t be that bad.");
	else addDisabledButton(1,"Accept (Vag)","Accept (Vag)","You have no vag to accept with!");
	addButton(2,"Deny",fuckGooSexThatsForGays,undefined,"Deny","Goo sex doesn’t sound like your cup of tea right now.");
}

//[Accept]
public function acceptStupidoopyPunishment(dongus:Boolean = false):void
{
	clearOutput();
	showName("CRIME\n& PUNISHMENT");
	var x:int = 0;
	author("Gardeford");
	output("You tell the ganraen judge that you’ll accept the punishment. It certainly sounds like less trouble than whatever alternative they would think of. The tall women looks relieved, clapping her hands together and moving closer to you.");
	output("\n\n<i>“");
	if(pc.isCrotchGarbed()) output("To begin with, we need to get those silly clothes off of you.");
	else output("Perfect! And you’re already without pants!");
	output(" I don’t know why people ever wear those silly things, they just get in the way,”</i> she confides, ");
	if(pc.isCrotchGarbed()) output("pulling your [pc.lowerGarments] off and casting them aside.");
	else output("grasping your [pc.hips] firmly in both hands.");
	output(" Droplets of citrine goo drip from the matronly figure as she assesses your crotch, apparently determining how she wants to come at you.");
	output("\n\n<i>“You just stay as still as you can while I dispense your punishment. Don’t confuse this with a play activity. I’ve come to find that this kind of thing can make natives and sky races alike feel very good, but it is also the best way to harvest genetic material. Don’t make me resort to less graceful means,”</i> she warns, backing up her command with a host of sharp needles that manifest from the gel around her. You ");
	if(pc.isBimbo() || pc.isBro()) output("agree wholeheartedly, seeing no need to ruin what could be a fun time.");
	else output("reluctantly agree, figuring you’ll be able to get a few ‘accidental’ movements in.");

	//male
	if(dongus)
	{
		output("\n\nThe peach-tinged peacemaker grins excitedly at your response, drawing her hands closer to your crotch. She wastes no time as she takes your [pc.cockBiggest] between them, kissing the [pc.cockHeadBiggest] before letting her lips drag swiftly to the [pc.sheathBiggest]. After a few seconds of kisses focusing on ");
		if(pc.balls > 0) output("your [pc.balls]");
		else output("the underside of your [pc.cocks]");
		output(" the ganraen arbiter licks all the way up your ");
		if(pc.cockTotal() > 1) output("biggest ");
		output("member.");
		output("\n\nOnce she reaches your [pc.cockHeadBiggest] again she takes the entirety of your member into her mouth. ");
		if(pc.biggestCockLength() < 7) output("She gives a satisfied hum as your whole length fits snugly in her mouth, sucking on it like a lollipop.");
		else if(pc.biggestCockLength() < 17) output("Your length ends up putting the end of your tip somewhere in her throat, and she hums happily at the intrusion.");
		else if(pc.biggestCockLength() < 36) output("Your length must be reaching into her stomach, but she simply hums with pleasure as she sucks on it.");
		else output("If you werent feeling it happen you wouldn’t have believed that someone could deepthroat your whole length, but she merely hums as her elastic body grows to accommodate you.");
		output(" Her singsong vibrations reverberate in your loins, amplifying the pleasure of the warm, wet enclosure. Droplets of gel roll down your [pc.legOrLegs], tickling you as they wetten your [pc.skinFurScales]. You can’t help but buck your hips instinctively, and the judge helps you to move them in the right direction.");
		output("\n\nThe orange bodied goo-girl doesn’t seem interested in a lengthy affair, and makes it painfully obvious once she secures herself to you. You feel the dewy drops of her fingertips as she walks them around your [pc.butt], stopping at the entrance to your [pc.asshole]. She gives you hardly a moment of time to prepare before her digits coalesce into a stream of liquid that courses into you. ");
		pc.buttChange(100,true,false,true);
		if(pc.hasVagina())
		{
			output("A separate batch of tendrils break off, jamming themselves into [pc.eachVagina].");
			for(x = 0; x < pc.totalVaginas(); x++)
			{
				pc.cuntChange(x,100);
			}
		}
		output("\n\nThe titian liquid floods your insides, searching for weakspots and ignoring the places that don’t provoke an immediate reaction. In a matter of seconds a hardening buzzer of citrine crystal is humming at your prostate, with every pulse sending your [pc.legOrLegs] into limp shudders. As much as you want to resist, the need to bring this pleasure to a climax overwhelms your mind.");
		output("\n\nA preemptive pulse of [pc.cum] propels itself into the clenching goo tube that encircles your [pc.cockBiggest], and surges of bliss knock out the stops preventing the orgasmic shocks from reaching your brain. You tense in climactic euphoria as ");
		if(pc.cumQ() < 10) output("your cock fires all the [pc.cumColor] cream it can muster");
		else if(pc.cumQ() < 500) output("you fill her mouth with ropes of [pc.cumNoun]");
		else if(pc.cumQ() < 2500) output("you fill her body with streams of [pc.cumNoun]");
		else output("your monstrous member overfills her and sends blasts of [pc.cumNoun] flooding into the room");
		output(", finally relaxing as she pulls away and allows you to slump to the ground. You shake yourself weakly as you try to recover from the ordeal.");
		output("\n\n<i>“Perfect! Another successful punishment");
		if(pc.cumQ() >= 2500) output(", though it’ll take me days to absorb all this");
		output(". When you feel able to stand, you can join me at the door to leave,”</i> she says with a cheerful smile. The red myr woman gives you a smug look and crosses her arms.");
		output("\n\n<i>“See, isn’t it great? After the first time they aren’t quite as quick about it either, all it takes is a knock on one of their less sound structures and boom, free mind-shattering sex. If you get caught again ask to be locked up with Issett, that’s me. They can be pretty accommodating,”</i> she explains with a smile. You make a note to try and remember this if you ever end up down here again before ");
		if(pc.isCrotchGarbed()) output("gathering your [pc.lowerGarment] and ");
		output("heading to the door. You turn and give the dark haired ant-girl your name before returning to the village proper.");
	}
	//female
	else
	{
		output("\n\nThe apricot-colored arbiter gives you an excited smile, drawing her hands closer to your crotch. She wastes no time in parting the folds of [pc.oneVagina], licking it from back to front before focusing on the [pc.clit]. Her semifluid fingers massage the muscles in your [pc.legOrLegs], holding you steady with a firmer grip than you would’ve thought capable.");
		output("\n\n<i>“I’m so glad you’re like the myr and not those pesky nyrea! These parts are much easier to work with,”</i> she says, pausing her efforts to talk for a moment. Once she finishes she returns to her work, ");
		//pc.clit smallormedium/large/dicksize/wtf: 
		if(pc.clitLength < 0.5) output("lapping at your [pc.clit] with renewed fervor");
		else if(pc.clitLength < 1) output("sucking at your [pc.clit]");
		else if(pc.clitLength < 6) output("sealing her lips around your [pc.clit] as she sucks its entire length into her mouth");
		else output("licking and sucking your monstrous clit");
		output(". As she works with her tongue, her fingers ");
		if(pc.totalVaginas() > 1)
		{
			output("play with your other clit");
			if(pc.totalVaginas() > 2 || pc.totalClits() > 2) output("s");
			output(" and the entrance");
			if(pc.totalVaginas() > 2) output("s to [pc.eachVagina]");
			else output(" to your other vagina");
		}
		else output("play with the entrance to [pc.eachVagina]");
		output(". Small runnels of her gel mixed with your juices trickle down your [pc.legOrLegs], tickling your [pc.skinFurScales] as they travel to the floor.");
		output("\n\nThe citrine skinned goo-girl doesn’t seem interested in a lengthy affair, and makes that painfully obvious once she gets comfortable. The semi-solid digits at your entrance");
		if(pc.totalVaginas() > 1) output("s");
		output(" coalesce into streams of goo, giving you scarcely a few seconds before they dive into [pc.eachVagina]. She also fills your [pc.asshole] in the same motion, steadily thrusting each tendril in turn.");
		if(pc.cockTotal() > 0) output(" A seperate set of tentacles springs off, milking [pc.eachCock] while the one in your ass massages your prostate.");
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			pc.cuntChange(x,100);
		}
		pc.cockChange();
		pc.buttChange(100);
		output("\n\nThe bright orange liquid explores your insides, searching for every weak-point it can find and ignoring areas that don’t give an immediate reaction. The places that do provoke moans and shudders are treated to humming buzzers of crystallized goo, leaving you weak and wobbling in a matter of seconds. Sexual juices drip from ");
		if(pc.legCount > 1) output("between ");
		output("your [pc.legOrLegs], and each drop of liquid lust takes a little bit of your reason with it. As hard as you wish to continue, the overwhelming pleasure flings all thoughts from your mind except for the need to cum.");

		output("\n\nThe sensual surges flood over your barriers and send bolts of pleasure into your mind. The warden holds you steadfast as your muscles alternate between blissful rigidity and slackened freedom. She swallows up your [pc.girlCum] with greedy slurps, ");
		if(pc.hasCock()) output("catching your [pc.cum] in sucking tendrils");
		else output("letting nothing escape");
		output(". When you finally manage to relax, the ganraen warden pulls back and lets you slump to the ground.");
		output("\n\n<i>“Wonderful! Another successful punishment. When you feel able to stand please join me at the door so you can rejoin society as a nicer person!”</i> she says, reshaping herself to a humanoid form. The red myr woman gives you a smug look and crosses her arms.");
		output("\n\n<i>“See, isn’t it great? After the first time they aren’t quite as quick about it either, all it takes is a knock on one of their less sound structures and boom, free mind-shattering sex. If you get caught again ask to be locked up with Issett, that’s me. They can be pretty accommodating,”</i> she explains with a smile. You make a note to try and remember this if you ever end up down here again before ");
		if(pc.isCrotchGarbed()) output("gathering your [pc.lowerGarment] and ");
		output("heading to the door. You turn and give the dark haired ant-girl your name before returning to the village proper.");
	}
	processTime(14);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Deny]
public function fuckGooSexThatsForGays():void
{
	clearOutput();
	if(silly) author("Gardenfork");
	else author("Gardeford");
	showName("CRIME\n& PUNISHMENT");
	output("You tell the ganraen judge you’d rather take the easy way out this time. Having a sticky goo creature assault your sex parts is not high on your bucket list. The tall woman nods, looking a little sad at your choice, but moving closer.");
	output("\n\n<i>“Very well, but know that this is a first time offer only. If you make any more mistakes you won’t get out so easily,”</i> she warns, flitting her wrist and producing a knife sized blade. She looks at your body, taking note of every visible inch.");
	output("\n\n<i>“You look to be made for this. You have the perfect amount of ");
	if(pc.tone > 50) output("muscle");
	else output("soft parts");
	output(" to select from. So many that it’s tough to choose,”</i> she says, pantomiming exasperation before she smiles, focusing on your upper arm. She leans in close, bringing the citrine edge close to your [pc.skinFurScales] with a surgeon’s precision. You remain as still as you can as she makes a small incision on your arm.");
	output("\n\nYou ");
	if(!pc.isGoo()) output("hiss at the sting as she collects a small portion of your blood, leaving a glob of goo that rapidly seals the wound");
	else output("smile jovially as she collects a small portion of your gooey body, wondering why this was such a big deal");
	output(". You watch as part of you dissolves into the ganrael’s sunny colored figure. That wasn’t so bad.");
	output("\n\n<i>“Alright. Now if you come with me I’ll take you back to the village proper where you can be on your way. Unless there was something you wanted, then you can do that,”</i> she says, beckoning for you to join her. You stand and walk to the door with her, turning back before leaving to say goodbye to your recent friends.");
	output("\n\n<i>“You know where to find me. I’ll probably be back down here after I make sure this one gets back to her city-folk life. My name is Issett by the way, since we were never properly introduced,”</i> she says as she waves goodbye. You give her your name as you leave, returning to the front of the cave.");
	processTime(5);
	pc.HP(-1);
	clearMenu();
	//not sure about resetting position.
	addButton(0,"Next",mainGameMenu);
}

//Goo Village: Repeat visits
//on maptile desc:
public function goovillageExtraShit():Boolean
{
	output("Now that you can look around the village proper, you see a small number of ganrael of various shapes and sizes performing sometimes nonsensical mimicries of everyday tasks. Some of them have tablets of crystal in the shape of portable computers, and pretend to click various buttons while showing off to other nearby community members. A solitary female stands behind a counter with what look like globs of colorful goo.");
	//[Visit shop]
	addButton(0,"Enter Shop",visitCrystalGooShop);
	return false;
}

public function talkToGooVillagers():void
{
	clearOutput();
	output("What will you ask about?")
	clearMenu();
	addButton(14,"Back",visitCrystalGooShop);
	addButton(0,"The Village",talkToGanraelAboutVillage);
	addButton(1,"War",talkToGooCrystalsAboutWar);
	addButton(2,"Space Goos",spaceGooTalk);
}

//Visit shop
public function visitCrystalGooShop():void
{
	clearOutput();
	author("Gardeford");
	showGooKeep();
	output("You decide to check out the ganraen that looks like a shopkeep. As she notices you she waves, showing off four crystal coated arms. It seems like this one is mimicking the appearance of a gold myr, confirmed by the presence of a golden crystal abdomen just above her butt. She smiles ecstatically when you reach her, straightening some of her merchandise.");
	output("\n\n<i>“Oh my gosh! An outworlder! I have some things you can buy here just like they do it in the big cities. This is how they do it right?”</i> she exclaims, whispering the last question. You stare for a few seconds before asking her what exactly she’s selling.");
	output("\n\n<i>“I’m glad you asked. I sell nothing but the highest quality samples of goo, perfect for patching up nasty scrapes, fixing buildings, lots of other things, and even more stuff!”</i> she says, showing off the softball sized spheres of semisolid gel. The jellied orbs jiggle softly at the minor vibrations of the cave, but don’t fall from the table they occupy. You ");
	if(!pc.isGoo()) output("mention that you aren’t made of goo, so most of those things won’t help you");
	else output("clap happily, wondering which of the blobs you should get");
	output(".");
	flags["MET_CGOO_SHOPKEEP"] = 1;
	CodexManager.unlockEntry("Ganrael");
	//The shopkeeps wares include purple, yellow, orange, green, black, red, blue, white, and pink. alternating every day in groups of 4
	//[buy goo ball][talk][leave]
	clearMenu();
	addButton(0,"Shop",ganraelShop);
	addButton(1,"Talk",talkToGooVillagers);
	addButton(14,"Leave",leaveGooShop);
}

public function ganraelShop():void
{
	clearOutput();
	showGooKeep();
	shopkeep = chars["CRYSTALSHOPKEEP"];
	shopkeep.keeperBuy = "<i>“Take your time looking. I can help you whenever you decide what you want!”</i>\n";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	buyItem();
}

//Leave shop
public function leaveGooShop():void
{
	clearOutput();
	author("Gardeford");
	output("You leave the shop for now, waving goodbye to the myr mimicking saleswoman.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk to Ganrael
public function talkToGanraelAboutVillage():void
{
	clearOutput();
	author("Gardeford");
	showGooKeep();
	//option 1: Village
	output("You ask the goo shopkeeper about the village, seeing as your codex says ganrael don’t usually work together.");
	output("\n\n<i>“Of course we don’t, silly! If they stay here for too long they know I’ll steal their ideas, but who else are they going to show off to? None of us stay here all the time, except maybe me I suppose...,”</i> she explains cheerily.");
	output("\n\n<i>“The houses are kept up all the time, but the occupants change every couple of days. Sometimes people from other races come to talk and play with us, and that’s always fun, but I’m too busy to go anywhere else,”</i> she states with an obstinate tone. You ask her what she’s so busy doing, and why the store can’t just change owners like everything else.");
	output("\n\n<i>“What? Well, loads of stuff. Who else is gonna sort these rocks, or count the number of houses? It’s most definitely not because I don’t remember how to change my shape and am stuck to the ground here. I could leave at any time, but I’d rather do this,”</i> she says adamantly. You aren’t sure you believe her, but she doesn’t seem to be interested in talking anymore.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",talkToGooVillagers);
}

//option 2: War
public function talkToGooCrystalsAboutWar():void
{
	clearOutput();
	author("Gardeford");
	showGooKeep();
	output("You ask the spunky shopkeep what she thinks of the war, obtaining a grumpy scowl in response. She crosses her arms and huffs.");
	output("\n\n<i>“It’s so dumb. Why do they have to kill each other when they could be having sex instead? I know that’s what I would do. One side has giant girls with tits full of succulent honey, and the other has tasty venom that makes sex even better! Why have they not combined those things yet?”</i> she asks. You nod and act interested, prompting even more explanation from the opinionated lady.");
	output("\n\n<i>“Like, we sometimes get some backed up honey ants down here, and it’s really fun when we have sex with them and the red myr at the same time. Once they’ve been fucked till they can’t think straight, neither of them care that they’re screwing the enemy. If that’s all it takes then why shouldn’t they just do that all the time? I think deep down that’s what they really want, and they could just stop at any time if the other side does it at the same time,”</i> she rants, her body shifting to darker shades as she grows angrier.");
	output("\n\n<i>“Mainly I just want them to come down here more often. If it weren’t for the war, they could come down here and have all the sex I wanted. Maybe even with ALL the ants at the same time. Can you imagine it?!”</i> She continues, sinking into her thoughts when she finishes. You suppose you weren’t expecting much opinion regarding the war, and she doesn’t seem to be interested in talking about this subject anymore.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToGooVillagers);
}

//option 3: Space goo’s
public function spaceGooTalk():void
{
	clearOutput();
	author("Gardeford");
	showGooKeep();
	output("You ask the crystal plated goo-girl if she has seen any of the <i>“star-walking”</i> goo races, and what she thinks of them. She gives you a confused stare for a few seconds before recollection coats her features.");
	output("\n\n<i>“Oh I know I know. I saw one of them the other day. She was with uhh, xenagem biotimes, must’ve been a news person. She wasn’t really the same as me though. I could see through her, but her body was too hard. She said something about being a ‘ran’, but she didn’t seem like she was gonna run away,”</i> the semi-solid girl explains, continuing to talk as you process the information.");
	output("\n\n<i>“There were also some who were like us, but they couldn’t make crystals at all. They were with a man in a shiny white suit, just hanging all over him. At least I think it was a man, he had lots of tentacles instead of a head. I didn’t get to talk to them cause there were too many people around, but it was very interesting. I had no idea that sky people had so many different shapes,”</i> she confesses sheepishly.");
	//if pc goo: 
	if(pc.isGoo()) 
	{
		output(" You ask her how she makes crystals, part of you hoping that it’s a magic trick that you can learn.");
		output("\n\n<i>“Well, I just think about it and it happens. But I do know that newly split members of our race can’t make crystals until they have sex at least once, so maybe they get it from older people? But if that’s how it is, then how did it start? It’s really confusing,”</i> she says, rubbing her temples and frowning at the thought.");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",talkToGooVillagers);
}
