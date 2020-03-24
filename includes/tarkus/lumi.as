/* Lumi by Skom*/

/**
	 * ...
	 * @author DrunkZombie
	 */

import classes.Characters.Lumi;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Miscellaneous.Throbb;
import classes.Items.Transformatives.Soak;
//Smart and competent tech who wants to prove herself by becoming the first person of her race to create a biomod acknowledged by the UGC.
//To this end, she goes around collecting and studying genetic material from spacers. That is, until she turned into a Soak junkie after taking a dose, thinking it was candy.
//Lumi remains steadfast in her goal, but now also has a fiery libido to deal with.
//flags 
//LUMI_HAS_MET			Tracker for first encounter
//LUMI_PC_WINS			Counter for how many times pc has won
//LUMI_PC_MILKED		Counter for how many times the pc has been milked
//LUMI_ADDICTION		Counter for PC addiction / submissiveness
//LUMI_FREEBIES			Counter for how many times she's given you Throbb / Soak
//LUMI_DISABLE			Timestamp to turn off her encounter
//LUMI_PC_SEX			counter for times had sex

//show nude, tits and/or preg bust
public function lumiShowBust(nude:Boolean = false,preg:Boolean = false):void
{
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//always set false until preg is implemented
		preg = false;
	}
	
	if (flags["LUMI_HAS_MET"] == 1) showName("\nLUMI");
	else showName("ORANGE\nGABILANI");
	showBust("LUMI" + (preg ? "_PREG" : "") + (nude ? "_NUDE" : ""));
	author("SKOM");
}
public function tryKnockUpLumi():Boolean
{
	//empty placeholder function
	return false;
}
public function lumiAddictionLevel(amt:int = 0, supercede:Boolean = false):int
{
	if (flags["LUMI_ADDICTION"] == null) flags["LUMI_ADDICTION"] = 0;
	
	var lvl:int = flags["LUMI_ADDICTION"];
	
	if (supercede) lvl = amt;
	else lvl += amt;
	
	if (lvl > 50) lvl = 50;
	if (lvl < 0) lvl = 0;
	
	flags["LUMI_ADDICTION"] = lvl;
	
	return lvl;
}
public function lumiDisable(numHours:int=1):void
{
	if (numHours < 1) numHours = 1;
	var setTime:int = numHours * 60;
	
	if (pc.hasPerk("Breed Hungry")) setTime *= .5;
	
	flags["LUMI_DISABLE"] = GetGameTimestamp() + setTime;
}
public function lumiEncounterActive():Boolean
{
	if (pc.level < 6) return false;
	
	if (flags["LUMI_DISABLE"] == undefined || flags["LUMI_DISABLE"] <= GetGameTimestamp()) return true;	
	
	return false;
}
	
public function encounterLumi():void
{
	clearOutput();
	lumiShowBust(false,true);
	
	var tEnemy:Lumi = new Lumi();
		
	//have met
	if (flags["LUMI_HAS_MET"] == 1)
	{
		output("Your wonderings are suddenly interrupted by a familiar voice coming from behind: <i>“Oh, hi there [pc.name], fancy meeting you again!”</i> You spin around and identify the source - it’s Lumi, the Gabilani tech, who beams a friendly smile at you, though her hand is worryingly close to the strange gun on her belt. You ask her what she’s doing here, and she answers it’s pretty much the same: looking for exotic samples of genetic material.");
		output("\n\nSpeaking of which... <i>“Say, feel like having a harvesting session? I plug some toys on you, and we have a sexy time while the machines do the work.”</i>");
		if (flags["LUMI_PC_MILKED"] >= 1 && flags["LUMI_PC_WINS"] >= 5) output(" She hesitates for a moment before adding: <i>“Or maybe we could try something else?”</i>");
		if (lumiAddictionLevel() >= 9 && pc.libido() >= 70 && (rand(100) <= (50 + lumiAddictionLevel() - (Math.round(pc.willpower()/3)))))
		{
			
			output("\n\nIt felt sooo good the last time you and Lumi had sex, your body is already getting all hot and bothered. In fact, how come you’ve managed to go so long without getting a taste of Lumi’s delicious pussy juices?! Trying (and probably failing) to keep yourself from sounding too needy, you shrug and tell her that sure, you wouldn’t mind helping her out.");
			output("\n\nA corner of your brain knows that you just can’t wait to get intoxicated by her drugs, then fitted with a dozen or so toys and milked like the slut you are.");
			processTime(2);
			clearMenu();
			//subtract 3 from addiction to balance out the 3 added in the submission scene so the player doesn't spiral downward without a chance to recover
			lumiAddictionLevel(-3);
			addButton(0,"Next",lumiSubmit, tEnemy);	
		}
		else if (lumiAddictionLevel() >= 6 && pc.libido() >= 50)
		{
			output("\n\nYou start to nod affirmatively but catch yourself and manage to turn the gesture into an awkward cough. What the heck: you were about to say yes without even thinking about it! Though, to be fair, just remembering the things she made you feel with her drugs and toys is enough to get a reaction from your groin. Maybe it wouldn’t be so bad to have some fun with Lumi every once in a while...");
			
			processTime(2);
			clearMenu();
			lumiMainMenu(tEnemy);
		}
		else
		{
			processTime(2);
			clearMenu();
			lumiMainMenu(tEnemy);
		}
		
	}
	//First Encounter
	else
	{		
		output("As you traverse the junkyard wilderness, you come across something unexpected: " + (CodexManager.entryViewed("Gabilani") ? "an amber-skinned Gabilani." : "a short girl that looks surprisingly similar to a goblin from some Terran RPG.") + " She sits on a stationary hoverboard while she tinkering with a deactivated drone. Some sort of explorer, perhaps? The safety goggles and backpack sure give off that impression.");
		output("\n\nThe stranger appears to be alone despite the many dangers of this place, so you’d wager she’s more than capable of defending herself, even though the gun on her hip looks more like something from a wacky retro-sci-fi movie than an actual weapon.");
		output("\n\nFor clothes, she is garbed in a white catsuit");
		if (pc.characterClass == GLOBAL.CLASS_ENGINEER && pc.IQ() >= 70) output(" that seems to be made of combat nanofiber, capable of hardening immediately as a response to attacks. If memory serves, it’s also fairly resistant to electricity and fire, but weak to corrosive damage.");
		else output(" that doesn’t seem to offer much protection.");
		output(" Still, the way it hugs her curves is quite tantalizing. Complementing the attire, a number of tool belts are strung around her chubby legs and fitted with all sorts of tech instruments, though some of them look suspiciously like dildos, plugs and fleshlights.");

		output("\n\nBefore you can decide whether to approach or avoid the Gabilani tech, a piece of dislodged metal comes clanking down from the junk pile you were using for cover. Her face turns immediately in your direction. <i>“Who the fuck is there?! If you don’t come out, I’m blasting the whole thing!”</i> She jumps to her feet and threatens, grenade already in hand.");
		output("\n\nYou walk out of your cover with both hands raised above your head to show that you mean no trouble. When the Gabilani sees you, the hostility vanishes from her face, replaced with a big, surprised smile, like someone who’s just won the lottery. <i>“A Rusher!!”</i> She says as she stores the grenade back on her pack and approaches you like it’s no big deal. <i>“Sorry about that, I thought it was another one of those pesky Rasks trying to pilfer my tools. Name’s Lumi, by the way!”</i>");
		output("\n\nYou introduce yourself and ask her if she’s some kind of explorer. Lumi chuckles. <i>“Kind of, I’m a scientist looking for unusual genetic samples for my research. My dream is to become the first Gabilani to create an UGC-acknowledged biomod!”</i> She declares proudly. <i>“Speaking of which...”</i> Lumi trails off as she starts fidgeting with a wristpad.");
		output("\n\nA moment later, the thing beeps and displays a miniature holographic report before her eyes. It’s hard to read the letters from behind, but you’re pretty sure your name is right there in the header. <i>“Oh, you’ve got a very interesting bio signature,”</i> she comments with fascination.");
		
		if (pc.hasGenitals()) 
		{
			output("\n\n<i>“What do you say we have a harvesting session?”</i>");
			output("\n\nNoticing the weirded out looks you’re giving her, the goblin tech elaborates: <i>“Oh, it’s no big deal, you just lie down on your back, then I plug a milker or two on your body and, you know, we have some fun while the machines do the work,”</i> she finishes with a wink. Judging by the assortment of sex toys strung on her tool belts, you’re pretty sure you know what kind of ‘fun’ she’s talking about...");

			clearMenu();
			lumiMainMenu(tEnemy);
		}
		else
		{
			output("\n\n<i>“Too bad you don’t have genitals, can’t really use your DNA in my research. But if you grow some, please let me know! Here, I’ll even help you,”</i> the Gabilani tech says, handing you a small medipen. On that note, the two of you say your goodbyes. Only after she’s gone do you have time to examine the medipen and realize it’s a dose of a highly illegal drug.");
			
			itemCollect([new Throbb()]);
			
			IncrementFlag("LUMI_FREEBIES");
			processTime(5 + rand(5));
			clearMenu();
			addButton(0,"Next",mainGameMenu);			
		}
		
		flags["LUMI_HAS_MET"] = 1;		

		if(!CodexManager.entryUnlocked("Gabilani")) 
		{
			output("\n\nYour codex beeps to inform you it’s identified the Gabilani race.");
			CodexManager.unlockEntry("Gabilani");
		}
	}
}
//standard menu
public function lumiMainMenu(tEnemy:Creature):void
{
	addButton(0,"Appearance",lumiAppearance, undefined,"Appearance","Give the goblin tech a once over.");
	addButton(1,"NoThxBai",lumiNoThxBai,tEnemy,"NoThxBai","Tell her you're not interested in getting... harvested. At least not for now.");
	addButton(2,"Submit",lumiSubmit, tEnemy,"Submit","Sure, it's a good idea to let a crazy goblin harvest your DNA for whatever purposes.");
	addButton(3, "Overpower", lumiOverpower, tEnemy, "Overpower", "Attack the crazy goblin now that she's dropped her guard!");
	if (flags["LUMI_PC_MILKED"] >= 1 && flags["LUMI_PC_WINS"] >= 5) addButton(4,"Sex",lumiSex, tEnemy);
}
//[Appearance]
public function lumiAppearance():void
{
	clearOutput();
	lumiShowBust(false, true);
	
	output("Lumi stands at an impressive 3’5” height, which is very tall by Gabilani standards but only brings her up to level with an average Terran’s waistline. Rather than having the typical hourglass figure of her race, Lumi’s orange-skinned body is closer to pear-shaped in build, with advantageous hips, a bountiful ass and thick, shapely thighs.");
	output("\n\nIntentionally or not, the tool belts strung around her legs like stockings help to emphasise her plumpness, and Lumi’s curves are further accentuated by her choice of wear: a white, tight nanofiber catsuit that even allows you to make out the contours of her juicy pussylips.");
	output("\n\nOnce you finally manage to unglue your [pc.eyes] from her lower half, you notice Lumi is a little on the chubby side, but the look fits her quite nicely. Her midsection presents an enticing target for some squeezing! Next, you take note of her mounds: modest C cups, but deliciously perky - and with quite large nipples that her catsuit utterly fails to subdue.");
	output("\n\nBut it’s not just her body that is attractive - she is one <i>very</i> pretty girl, with a cute, feminine face that comes across as youthful and earnest, complemented by full lips, pointy elfin ears and impossibly vibrant turquoise eyes that seem to shine with perpetual curiosity. However, those same eyes also betray subtle signs of drug use. The Gabilani’s light-grey hair is kept tied behind her in a tall ponytail, lending a note of seriousness to her charming looks.");
	output("\n\nAs you take in her features, your eyes happen to lock with Lumi’s, and she pouts coyly, crossing her arms, though you can see a very subtle blush on her cheeks. Just you were in sizing her up, it appears she wasted no time either. <i>“Have you ogled enough?”</i> She asks in a slightly peeved tone. The irony doesn’t escape you.");
	
	pc.changeLust(10);
	addDisabledButton(0, "Appearance", "Appearance", "You are already checking her out.");	
}
//[NoThxBai]
public function lumiNoThxBai(tEnemy:Creature):void
{
	clearOutput();
	lumiShowBust(false, true);
	
	if (flags["LUMI_PC_MILKED"] >= 1 && rand(3) < 2)
	{
		output("The Gabilani tech fixes you with a disappointed look. <i>“Sheesh! Here I am, all hot and bothered, and you won’t even scratch my itch?! Some friend you are! But it’s okay, I already got your genetic sample anyway, so I suppose I can find someone else to help me. Too bad you’re not the one who’s gonna be feeling soooo good a few minutes from now,”</i> she finishes in a peeved tone and starts walking away, not even saying goodbye. You don’t recall when you two became friends, but at least she’s out of your hair for now.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);		
	}
	else
	{
		output("The Gabilani tech gives you a sinister grin and takes off her goggles. If the crazed look in her bloodshot eyes is any indication, you’d say she’s been doing more drugs than she should. <i>“Playing hard to get? I wanted to make it easy for us both, but I’m not opposed to some rough and tumble, if it gets your juices flowing...”</i> Lumi trails off, drawing the wacky sci-fi gun from her belt even as a shield flickers into existence around her. Looks like she has either misunderstood your intentions, or she’s not taking no for an answer!");
		
		processTime(1);
		clearMenu();
		addButton(0,"Next",lumiOverpower, tEnemy);		
		
	}
}
//[Submit]
public function lumiSubmit(tEnemy:Creature):void
{
	setEnemy(tEnemy);
	enemy.maxOutLust();
	
	lumiDefeat();
}
//loss to Lumi
public function lumiDefeat():void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("LOST VS:\nLUMI");
	
	//lumi lust maxed out in submited path so check if that occured
	if (enemy.lust() >= enemy.lustMax())
	{
		output("<i>“I’m so glad you’ve decided to make it easy for the both of us!”</i> Unceremoniously, the goblin tech pulls a purple-colored inhaler out of her backpack and takes a quick whiff, which causes her expression to shift into a dopey smile as she approaches you. <i>“Want some too?”</i> She offers. You’ve already decided to have fun, so might as well go all the way. Besides, whatever it is, your nanomachines will probably prevent it from causing any real harm.");
		output("\n\nShortly after you take your first whiff, strength quickly leaves your body, and your lust-addled brain finds it increasingly hard to think clearly. Whatever she gave you, it’s potent stuff! And the sensation only gets better as you and Lumi share a few more breaths. In fact, you can’t recall when was the last time you’ve felt so... relaxed... like your worries are all melting away, and the only thing you need to focus on is feeling good.");
		
		lumiAddictionLevel(3);
		pc.libido(2);
		pc.taint(1);
		pc.maxOutLust();
	}
	else if (pc.HP() <= 0)
	{
		output("Lumi’s final attack breaks your balance, causing your [pc.legOrLegsNoun] to give under your own weight. Damn, you didn’t expect the chubby shortstack to be actually good in a fight! Or perhaps it’s just the drugs you were exposed to, which sap your strength and muddle your mind with lust. It gets increasingly hard to think clearly, but the sensation is actually pretty good. You can’t recall when was the last time you felt so... relaxed... like your worries are all melting away...");
		lumiAddictionLevel(1);
		pc.maxOutLust();
	}
	else
	{
		output("Releasing a loud, whorish moan, you finally give up the will to resist - your [pc.skin] has become so sensitive that even the friction of your [pc.gear] feels like a sensual caress. No doubt it’s the effect of Lumi’s drugs settling in, but you find that your lust-addled brain couldn’t care less. It’s as if a weight has been suddenly lifted off your shoulder, and your worries are all melting away, allowing you to truly relax for the first time in ages. And to focus on what really matters: feeling good.");
		
		lumiAddictionLevel(2);
		pc.libido(1);
		pc.maxOutLust();
	}
	
	output("\n\nIf you were to be entirely honest, you’d have to say your body is quite enjoying this situation, judging by your stiff and distractingly sensitive [pc.nipplesNounSimple].");
	if (pc.hasCock() && pc.hasVagina()) output(" Not to mention the throbbing tumescence of your [pc.cocksLight] and the unapologetic wetness in your [pc.vaginasLight]");
	else if (pc.hasCock()) output(" Not to mention the throbbing tumescence of your [pc.cocksLight]");
	else if (pc.hasVagina()) output(" Not to mention the unapologetic wetness in your [pc.vaginasLight]");
	output(", which makes it hard to focus on anything but the curves of Lumi’s body and your own desperate need for sexual release.");
	
	if (flags["LUMI_PC_MILKED"] >= 1) output("\n\n<i>“You know, [pc.name], I already have a sample of your genetic material, so normally I’d let you go, buuut since you’ve gone out of your way to get me worked up, I think you want me to use you, hmm? Yes, I guess we’d both enjoy that.”</i>");
	else output("\n\n<i>“Teehee! Guess who’s gonna have their DNA harvested? That’s right, [pc.name], you!”</i> Lumi says, and you have to admit her bubbly tone is very cute, even if her choice of words is a little ominous. <i>“Don’t worry, you’ll be feeling reeeal good, promise!”</i>");
	
	output("\n\nTo drive the point home, she fixes you with a smoldering gaze and runs a hand over her catsuit, all the way from her perky, tightly compressed breasts down her chubby midsection and big, swollen pussy, whose contours can be seen clearly on the latex-like fabric. The gesture causes you to gulp loudly despite yourself.");
	if (!pc.isNude()) output(" Your body moves of its own accord as you eagerly wiggle out of your [pc.gear].");
	
	output("\n\nIn one slow motion, Lumi pulls down the almost invisible zipper of her attire, causing the catsuit to part around her to reveal the amber Gabilani’s features in all their glory. As her perky breasts pop free of their confines with a jiggle, your [pc.eyes] are immediately drawn to her sizable nipples, then your gaze wanders down to her mouthwatering pussy and the rivulet of fem-juice that drools down her thick thighs.");
	
	processTime(3);
	clearMenu();
	addButton(0,"Next",lumiHarvesting, undefined);	
}
//harvest scene
public function lumiHarvesting():void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("LOST VS:\nLUMI");
	var x:int = 0;
	
	output("<i>“Okay, let’s get you ready. Lie down on your back for me, will ya [pc.name]?”</i> Lumi instructs, and you comply, since you don’t have the strength to resist. And, honestly, you don’t <i>want</i> to resist. Before starting, she pops a little pink candy in her mouth.");
	output("\n\n<i>“Oh, this? Don’t worry, it’s just some Soak. To get my juices flowing, you know. You’ll thank me later,”</i> she winks and goes back to rummaging through her backpack. You watch with curiosity as the tech emerges with various toys and starts outfitting you:");
	
	if (pc.hasCock())
	{
		output("\n\n[pc.EachCock] is equipped with a smooth, flexible tube that slides comfortably inside the urethra, and then a rubbery vibrator ring is wrapped just below the crown, holding the tube in place. The tube itself connects to a cum reservoir nearby, with a glassy surface and quantity markers.");
		if (pc.hasTailCock()) output(" The same treatment is given to your tail-mounted [pc.tailCocks].");
		if (pc.balls > 0) output(" Your [pc.sack], in turn, receives a stretchy ball harness, which Lumi masterfully adjusts to a snug fit, compressing your gonads as much as possible without it getting painful.");
	}
	else if (pc.hasTailCock())
	{
		if (pc.tailCount > 1) output("\n\nEach of your tail-mounted [pc.tailCocks]");
		else output("\n\nYour tail-mounted [pc.tailCock]");
		output(" is equipped with a smooth, flexible tube that slides comfortably inside the urethra, and then a rubbery vibrator ring is wrapped just below the crown, holding the tube in place. The tube itself connects to a cum reservoir nearby, with a glassy surface and quantity markers.");
	}
	if (pc.hasVagina())
	{
		output("\n\nInto [pc.eachVagina] goes a black nubby dildo, complete with a bullet-vibe protrusion at the lower end. Lumi makes sure that the vibe is perfectly positioned to stimulate the [pc.clitNoun] before pressing a button that causes the dildo’s base to inflate like a knot, keeping it locked in place.");
		if (pc.hasTailCunt()) output(" The same treatment is given to your tail-mounted [pc.tailCunts].");
	}
	else if (pc.hasTailCunt())
	{
		if (pc.tailCount > 1) output("\n\nInto each of your tail-mounted [pc.tailCunts]");
		else output("\n\nInto your tail-mounted [pc.tailCunt]");
		output(" goes a black nubby dildo, complete with a bullet-vibe protrusion at the lower end. Lumi makes sure that the vibe is perfectly positioned to stimulate the clit before pressing a button that causes the dildo’s base to inflate like a knot, keeping it locked in place.");
	}
	
	output("\n\nYou watch in powerless apprehension as she takes out a metallic plug, lubes it up and starts pressing it against your [pc.butthole]. The bulb-like object is slender at the tip, easily parting your entrance before the midsection stretches you up, but the pain is less than expected and lasts only a few seconds once the plug is fully lodged, your ass quickly conforming to its shape.");
	output("\n\n<i>“Looks like I picked the right size for you,”</i> she winks winningly. As a finishing touch, Lumi outfits your [pc.nipplesNounSimple] with metallic clamps, which wrap around your sensitive buds like tight miniature rings.");
	
	if (pc.hasCock() || pc.hasTailCock())
	{
		pc.taint(2);
		pc.libido(1 + Math.floor((100 - pc.libido()) / 10)); 
		
		output("\n\nWhile you’re distracted, the tech takes a medipen out of who-knows-where and quickly pricks the base of your");
		if (pc.hasCock()) output(" crotch.");
		else output(" [pc.tailNoun].");
		
		output("\n\nThe effect is almost instantaneous: your already-hard " + (pc.cockTotal() > 1 ? "boners start" : "boner starts") + " swelling up even more, growing in both size and girth before your awed eyes, which causes the rubbery vibrator");
		if (pc.cockTotal() > 1) output(" rings to tighten around the cockheads, though the self-adjusting toys yield a bit to compensate.");
		else output(" ring to tighten around the cockhead, though the self-adjusting toy yields a bit to compensate.");
		output(" Thankfully, it doesn’t feel <i>too</i> constricting, and the growth stops after about ");
		
		for (x = 0; x < pc.cockTotal(); x++)
		{
			if (pc.hasPerk("Mini"))
			{
				pc.cocks[x].cLengthRaw += 3;
				pc.cocks[x].cThicknessRatioRaw += .2;
			}
			else if (pc.hasPerk("Hung"))
			{
				pc.cocks[x].cLengthRaw += 9;
				pc.cocks[x].cThicknessRatioRaw += .6;
			}
			else
			{
				pc.cocks[x].cLengthRaw += 6;
				pc.cocks[x].cThicknessRatioRaw += .4;
			}			 
		}	
		if (pc.hasPerk("Mini")) output("three");
		else if (pc.hasPerk("Hung")) output("nine");
		else output("six");
		output(" inches, leaving you both relieved and wanting more. <i>“Don’t worry, it’s temporary,”</i> Lumi ensures, giggling at your disconcert.");
	}
	
	output("\n\nThen, tapping some quick commands on her wristpad, she turns on the toys.");
	output("\n\nIt starts off with the clamps sending a small electric discharge through your [pc.nipples], and you find yourself gasping in both surprise and pleasure. The next discharge comes a few seconds later, and then another, and another(...), following a predictable rhythm. Before long, your brain starts to anticipate and crave the sensation. You never knew your nips could feel so good - you might orgasm just from this, if it goes on long enough! There is a little pain involved, sure, but in your drugged state, it only helps to outline the ecstasy.");
	
	if (pc.hasCock())
	{
		output("\n\nNext, the ring under your [pc.biggestCockHead] springs to life, vibrating in a low, comfortable frequency that has you purring like a cat.");
		if (pc.cockTotal() > 1) output(" And the ring on your other " + (pc.cockTotal() > 2 ? "shafts follow" : "shaft follows") + " suit.");
		output(" [pc.EachCock] twitches needily");
		if (pc.hasTailCock()) output(", while your tail-mounted [pc.tailCocks] " + (pc.tailCount > 1 ? "thresh" : "threshes") + " restlessly in the air");
		output(" as your mind takes in the localized stimulation.");
	}
	else if (pc.hasTailCock())
	{
		if (pc.tailCount > 1) output("\n\nNext, the ring on each of your tail-mounted [pc.tailCocks]");
		else output("\n\nNext, the ring on your tail-mounted [pc.tailCock]");
		output(" springs to life, vibrating in a low, comfortable frequency that has you purring like a cat. Your tail" + (pc.tailCount > 1 ? "s thresh" : " threshes") + " restlessly in the air as your mind takes in the localized stimulation.");
	}
	if (pc.hasVagina())
	{
		output("\n\nNext up is the vibe stationed on your thoroughly stuffed [pc.vaginas]. The protrusion starts trembling very, very softly and stays like this for a while before jolting up the intensity for a hot second, causing you to release a loud, sultry moan - and then it falls back to the previous rhythm. The event repeats every few seconds, alternating with the nipple clamps and driving you even crazier with anticipation.");
		if (pc.hasTailCunt()) output(" And this extends to your tail-mounted [pc.tailCunts] as well, which " + (pc.tailCount > 1 ? "thresh" : "threshes") + " about restlessly in the air.");
	}
	else if (pc.hasTailCunt())
	{
		output("\n\nNext up is the vibe stationed on your thoroughly stuffed tail-mounted [pc.tailCunts]. The protrusion starts trembling very, very softly and stays like this for a while before jolting up the intensity for a hot second, causing you to release a loud, sultry moan - and then it falls back to the previous rhythm. The event repeats every few seconds, alternating with the nipple clamps and driving you even crazier with anticipation.");
	}
	
	output("\n\nLast but not least is the plug in your [pc.ass], which comes alive with a faint electric charge that starts at the very base, teasing your [pc.butthole] and then picking up intensity as it travels deeper, causing your internal muscles");
	if (pc.hasCock() || pc.hasTailCock()) output(" to contract in a way that nudges the toy against your sweet spot, and you can’t help but arch your [pc.hips] as your prostate gets milked.");
	else output(" to contract and relax deliciously around the plug.");
	output(" The electric charge itself is not painful at all, quite the contrary. And, like the other toys, this one also follows a steady, predictable rhythm. They alternate perfectly so as not to overstimulate.");
	
	output("\n\nUnable to contain yourself any longer, you reach for your crotch to masturbate, but Lumi swats the offending hand away. <i>“Hey, show some appreciation for my work!”</i> She complains, and proceeds to bind your arms with Grav-Wristbands. You couldn’t lift your hands off the ground if your life depended on it.");
	output("\n\nDeprived of a means to relieve yourself, you take a proper look at the goblin for the first time in a couple of minutes. The figure she presents just aggravates your predicament: one hand pinching her large nipples, while the other works her pumped-up, sopping cunt, its lips spread around four of her fingers.");
	output("\n\nYou can’t help but open your mouth and drool at the sight, be it because of your own instincts, or the drugs in your system. Prompted by your hungry gaze, Lumi maneuvers so your head is right under her parted thighs, fem-lube dripping on your [pc.face] as she smiles down on you and continues masturbating. From your position, she looks like a miniature giantess.");
	output("\n\nAs soon as the first few drops hit your [pc.lipsChaste], you can’t help but lick them to get a taste of the oily gray liquid that is her Gabilani girlcum. It’s kind of citrusy and a little sweet, which makes you crave it even more - and you’re not afraid to say it!");
	output("\n\n<i>“Hehe, I get that a lot,”</i> Lumi brags. <i>“If you want it so much, why don’t you help me give it to you, hmm?”</i> She kneels, her thick thighs carressing both sides of your face as her snatch presses against your waiting mouth, tongue out in the ready. As soon as it makes contact, you waste no time - your [pc.lips] proceed to kiss, suckle and worship her pumped-up cunt, while your [pc.tongue] flicks all over it until it reaches her red, ripe, inch-wide clit, licking it like a lollipop.");
	
	output("\n\n");
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("Your aphrodisiac saliva doesn’t even have time to do work before ");
	output("Lumi, who was already close, quickly reaches her orgasm, squealing in delight while her pussy squirts a deluge of delicious, sweet-smelling girlcum all over your face. You open your mouth wide, trying to drink and lap off as much as possible, but there’s just <i>so much</i> of it!");
	
	output("\n\nMeanwhile, the toys continue to work diligently on your [pc.crotch], bringing you closer and closer with their measured vibrations. Lumi, isn’t finished either: as soon as her climax calms down a little bit, she grabs your face pulls it back on her crotch as gently as she can manage under the circumstances, urging you to resume your ministrations.");
	output("\n\n<i>“Your hands aren’t working,”</i> she admonishes, and the Grav-Wristbands that were weighing you down turn off automatically. Your [pc.hands] waste no time in grabbing her soft, bountiful asscheeks, fondling and squeezing them while your [pc.tongueNoun] continues to taste her big, drooling snatch. At one point, you decide to give her butt a loud slap, which prompts Lumi to gasp with pleasure. <i>“Yes! More! HARDER!”</i> You don’t need any more encouragement to start spanking her, which soon triggers her second orgasm.");
	output("\n\nYou feel the Gabilani’s pussy shudder on your face as it squirts even more girlcum. The toys pick this moment to jack up their vibrations, which sends you tripping over the edge. Your entire body quivers as your reproductive system enters overdrive mode.");
	
	if (pc.hasVagina() || pc.hasTailCunt())
	{
		if (pc.hasVagina() && pc.hasTailCunt()) output("\n\nYour [pc.vaginas] and tail-mounted [pc.tailCunts]");
		else if (pc.hasTailCunt()) output("\n\nYour [pc.tailCunts]");
		else output("\n\nYour [pc.vaginas]");
		output(" shudder uncontrollably as you climax like a porn star,");
		if (pc.wettestVaginalWetness() >= 4 || pc.girlCumMultiplier() >= 5) output(" gushing out jets of [pc.girlCum] all over the place, each squirt accompanied by a muffled ecstatic cry.");
		else output(" releasing a long, steady stream of [pc.girlCum] as you let out muffled cries of ecstasy.");
		if (pc.hasVagina()) output(" Lumi's drooling cunt is still pressed against your [pc.lips], and your mind barely registers when the dildo stuffed into your [pc.biggestVaginaNoun] beeps a notification: <i>“Genetic reading complete.”</i>");		
		else output(" Lumi's drooling cunt is still pressed against your [pc.lips], and your mind barely registers when the dildo stuffed into your [pc.oneTailCunt] beeps a notification: <i>“Genetic reading complete.”</i>");	
		output(" The toy continues to vibrate at a low frequency for a full minute, coaxing every last drop of [pc.girlCumNoun] while you whimper in helpless bliss.");
	}
	
	if (pc.hasCock() || pc.hasTailCock())
	{
		var cumAmt:Number = pc.cumQ() * 2.5;
		if (pc.hasTailCock()) cumAmt += 2500 * pc.tailCount;
		cumAmt = Math.ceil(cumAmt);
		
		if (pc.hasVagina()) output("\n\nBefore your pussy orgasm even ends");
		else output("\n\nBefore you have time to process what’s going on");
		output(", you can already feel the river of [pc.cumFlavor] seed being pumped by your");
		if (pc.balls > 0) output(" harnessed [pc.balls] and");
		output(" electro-milked prostate, then travelling through your twitching");
		if (pc.hasCock() && pc.hasTailCock()) output(" [pc.cocks] and [pc.tailCocks]");
		else if (pc.hasCock()) output(" [pc.cocks]");
		else output(" tail-mounted [pc.tailCocks]");
		output(", until it bursts out in time with a loud, uncontainable moan.");
		
		output("\n\nMassive ropes of [pc.cum] fire out of your system and into the waiting tube, flowing into the reservoir. You can’t help but watch in awe from the corner of your [pc.eye] as it fills up with your seed. Markers on the glass surface inform your progress: ");
		if (cumAmt >= 100) output("100 MLs...");
		if (cumAmt >= 200) output("200 MLs...");
		if (cumAmt >= 500) output("500 MLs...");
		if (cumAmt >= 1000) output("1000 MLs...");
		if (cumAmt >= 2000) output("2000 MLs...");
		if (cumAmt >= 3000) output("3000 MLs...");
		if (cumAmt >= 5000)
		{
			output("\n\nBefore your orgasm even finishes, the reservoir has already reached the full 5000 MLs of capacity. A growing backpressure slows down the flow of cum, which in turn causes you to groan in tortured pleasure. Eventually, though, the sheer force of your virility wins out, forcing the tube off");
			if (pc.hasCock() && pc.hasTailCock())
			{
				output(" [pc.eachCock] and");
				if (pc.tailCount > 1) output(" each of your tail-mounted [pc.tailCocks]");
				else output(" your tail-mounted [pc.tailCock]");
			}
			else if (pc.hasCock()) output(" [pc.eachCock]");
			else
			{
				if (pc.tailCount > 1) output(" each of your tail-mounted [pc.tailCocks]");
				else output(" your tail-mounted [pc.tailCock]");
			}
			output(", allowing the rest of your [pc.cumNoun] to burst out in a torrent that lands all over your [pc.legOrLegsNoun], [pc.belly] and [pc.breastsNoun], as well as Lumi’s hair, back and ass.");
		}
		else 
		{
			output(cumAmt + " MLs is how much your body has been made to pump out by the time your orgasm finally winds down.");
		}	
		
		if (!pc.hasCock()) output("\n\n<i>Damn, you didn't know your " + (pc.tailCount > 1 ? "tailcocks" : "tailcock") + " could be <i>this</i> potent!");

	}
	
	output("\n\nSeveral minutes pass before you start to recover from your pleasure haze, and by that time Lumi is already dressed and ready to leave. All the toys have been removed from your body as if by magic. <i>“That was awesome, thanks! Maybe we can do this again sometime, if you’re in these parts,”</i> she blows you a kiss.");
		
	if (flags["LUMI_FREEBIES"] < 5)
	{
		IncrementFlag("LUMI_FREEBIES");
		output("\n\n<i>“Oh, by the way, here’s a reward for being a good donor,”</i> the Gabilani tosses a small package that lands across your chest, but you’re too spent to even check what it is.");
		
		if (pc.hasCock() && pc.hasVagina())
		{
			if (rand(2) == 0) itemCollect([new Throbb()]);
			else itemCollect([new Soak()]);
		}
		else if (pc.hasCock()) itemCollect([new Throbb()]);
		else if (pc.hasVagina()) itemCollect([new Soak()]);
		
		output("\n\nUtterly exhausted from being so thoroughly ‘harvested’, you black out for the next couple of hours.");		
	}
	
	if (pc.ass.looseness() < 2) pc.ass.loosenessRaw += 1;
		
	for (x = 0; x < pc.cockTotal(); x++)
	{
		if (pc.hasPerk("Mini"))
		{
			pc.cocks[x].cLengthRaw -= 3;
			pc.cocks[x].cThicknessRatioRaw -= .2;
		}
		else if (pc.hasPerk("Hung"))
		{
			pc.cocks[x].cLengthRaw -= 9;
			pc.cocks[x].cThicknessRatioRaw -= .6;
			//removed by author request
			//if (rand(4) == 0) pc.cocks[x].cLengthRaw += (1 + rand(5)) / 5;
		}
		else
		{
			pc.cocks[x].cLengthRaw -= 6;
			pc.cocks[x].cThicknessRatioRaw -= .4;
			//removed by author request
			//if (rand(4) == 0) pc.cocks[x].cLengthRaw += (1 + rand(5)) / 10;
		}			 
	}
	for (x = 0; x < pc.vaginaTotal(); x++)
	{
		if (pc.vaginas[x].looseness() < 2) pc.vaginas[x].looseness(1,false);
	}
	
	pc.applyPussyDrenched();
	if (pc.cumQ() >= 5000) pc.applyCumSoaked();
	for (x = 0; x < 10; x++)
	{
		processTime(6);	
		pc.orgasm();
	}
	
	IncrementFlag("LUMI_PC_MILKED");
	
	if (flags["LUMI_PC_MILKED"] >= 5 && pc.libido() >= 70 && !pc.hasPerk("Breed Hungry"))
	{
		pc.libido(20);
		pc.taint(10);
		pc.createPerk("Breed Hungry",15,0,0,0,"Increases speed that semen is created at and the pregnancy speed.");
		
		output("\n\nWhen you finally wake up, your head feels wooly, and your body strangely hot. Checking your Codex, you realize there’s an email from Lumi.");
		resendMail("lumi_breed_hungry", GetGameTimestamp());
	}
	
	processTime(60);
	lumiDisable(4);	
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();	
}
//email after gaining breed hungry perk
public function lumiBreedHungryEmail():String
{
	var eText:String = "";
	
	eText += "Hey [pc.name], since you like getting milked so much, I figured I'd go the extra mile and make something special just for you. (The truth is I've been secretly working on this since the first time we had fun, because you're so damn sexy!)";
	
	if (pc.hasCock()) eText += "\n\nIt’s a mod that boosts your cum refill rate, so you don’t have to wait so long between our little harvesting sessions. Oh, and it also speeds up your pregnancies, no matter if they’re vaginal " + (pc.hasVagina() ? "" : "(in case you decide to get a pussy in the future, I totes recommend it!) ") + "or anal. Call it a Gabilani thing, but when I read how long your species takes to give birth, I was stunned. You can thank me later!";
	else eText += "\n\nIt’s a mod that speeds up your pregnancies, no matter if they’re vaginal or anal. Call it a Gabilani thing, but when I read how long your species takes to give birth, I was stunned. Oh, by the way, it should also boost your cum refill rate if you decide to get a cock in the future, hehehe. You can thank me later!";
	
	eText += "\n\nI gave it to you while you were sleeping, hope you don’t mind. (Why am I even worried, of course a good " + pc.mf("boy","girl") + " like you wouldn’t mind it.) A pity I can’t commercialize this mod, since it’s made specifically for your genetic signature. Well, it’s still a step in my research, so you get a big thanks from me!";
	
	return doParse(eText);
}
//win vs Lumi
public function lumiVictory():void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("DEFEATED:\nLUMI");
	
	if (enemy.HP() < 1)
	{
		output("Your assault forces Lumi on the defensive, until she eventually trips and falls to the ground, raising her hand in defeat. <i>“Okay, okay, I give up! Just let me leave in peace and I’ll get out of your hair.”</i> Clearly dissatisfied with her attitude, you inform the clueless Gabilani that the least she can do is compensate you for the trouble she caused in the first place.");
		output("\n\nLumi frowns her brow. <i>“Well, I can send a few credits your way to pay for any damage to your gear, but...”</i> she draws out, giving you an obvious once over before continuing: <i>“What do you say we have some fun instead? To be honest, I’m kinda pent up, and you Rushers are so fucking hot...”</i> she concludes, running a hand over the contours of her pussy on the catsuit.");
	}
	else
	{
		output("<i>“Fine, you win, just-”</i> Overwhelmed by your sexiness, Lumi falls to the ground and stars running a hand over the contours of her pussy on the catsuit. <i>“-just fuck me, okay?! My pussy is so hot...”</i> Her voice quivers with obvious need, and her flushed face makes the invitation all the more tempting. It’s pretty clear that she’s not used to being on the receiving end of seduction.");
	}
	
	output("\n\nDeciding to play it cool, you cross your arms with an expression of doubt and ask her if that’s the best she can do. In response, Lumi gives you a coy look and starts wiggling out of her catsuit. With her chest bared, the Gabilani holds her perky breasts together and starts rubbing her own nipples, trying to entice you.");
	output("\n\nStill, you make an unconvinced look, which prompts her to pull her legs free and spread them far apart in a show of incredible flexibility. This gives you a mouthwatering view of her swollen pussy, its fem-juices drooling liberally down her plump thighs and asscheeks. <i>“Better now?!”</i> She asks, adorably vexed.");
	output("\n\nWell, well, well... what do we do next?");
	
	if (lumiAddictionLevel() > 1) lumiAddictionLevel(1,true);
	IncrementFlag("LUMI_PC_WINS");
	pc.changeLust(30);
	
	output("\n\n");
	clearMenu();
	lumiSexMenu();
	addButton(14, "Leave", lumiLeave, undefined, "Leave", "Tell the Gabilani you don't have time to indulge her right now.");
}
//[Sex]
public function lumiSex(tEnemy:Creature):void
{
	setEnemy(tEnemy);
	
	clearMenu();
	lumiSexMenu();
	addButton(14, "Back", lumiSexBack, tEnemy);
}
//[Back] inside sex sub menu above
public function lumiSexBack(tEnemy:Creature):void
{
	setEnemy(null);
	clearMenu();
	lumiMainMenu(tEnemy);
}
//sex menu
public function lumiSexMenu():void
{
	if (pc.hasCock()) addButton(0, "Satiate", lumiSatiate, undefined, "Satiate", "Since she's so needy, stuff her with your cock and her own toys.");
	else addDisabledButton(0, "Satiate", "Satiate", "You need a cock for this.");
	if (pc.hasVagina()) addButton(1, "Scissor",lumiScissor, undefined, "Scissor", "Teach her some new tricks by scissoring her wet, puffy pussy.");
	else addDisabledButton(1, "Scissor", "Scissor", "You need a pussy for this.");
	if (pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0 && flags["LUMI_PC_MILKED"] >= 1) addButton(2, "Impale", penisRouter, [lumiImpale, enemy.vaginalCapacity(0), false, 0], "Impale", "Use Lumi's experimental Throbb-lite and have her ride your rod as it grows inside of her. The effects are temporary... probably!");
	else addDisabledButton(2, "Impale", "Impale", "You must have been harvested at least once to know of this option, and you must have a cock that fits.");
}
//[Leave] without having sex
public function lumiLeave():void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("DEFEATED:\nLUMI");
	
	output("<i>“Wait, you get me all worked up and then just leave me like this?!”</i> The Gabilani tech asks in disbelief, but you’ve already started walking away. <i>“Heeeey! I’ll remember this!”</i> She yells at your retreating back. You wave a hand in goodbye, safe in the knowledge that it won’t take long until Lumi finds some needy locals to sate her, and then this whole incident will be wiped from her drug-addled brain.");
	
	lumiDisable(2);		
	CombatManager.genericVictory();
}
//[Satiate]
public function lumiSatiate():void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("DEFEATED:\nLUMI");
	
	output("In search of some inspiration, you start rummaging through Lumi’s discarded backpack. <i>“Hey, that’s my stuff!”</i> She complains, but you just <i>yeah yeah</i> her until you’ve found everything you need. Her apprehension turns to curiosity once you emerge with a bundle of sex toys in your arms and lays them on the hoverboard.");
	output("\n\n<i>“And <b>now</b> you decide to get kinky on me? You could have just asked, you kn-”</i> Lumi starts, but you surprise her by quickly taking hold of one of her wrists and shackling it with a set of Grav-Cuffs you were hiding behind your back. The other wrist follows suit, but once her surprise is over, she gives you an eager smile and starts rubbing her thick, lubed-up thighs together in anticipation.");
	
	if (!pc.isNude()) output("\n\nNow that the crazy goblin is properly restrained, you take the opportunity to slowly get out of your [pc.gear], but not before running a hand tantalizingly over your [pc.chest] and bulge for her benefit. Lumi’s gaze follows your every motion with unbirdled hunger.");
	
	output("\n\nAfter tapping the ‘on’ button, you adjust the cuffs to make Lumi practically weightless. She gives a surprised <i>ooohhh</i> as you lift her up by the hips and flip her horizontally, so that her snatch is at your waist level. <i>“Nice, what’s next?”</i> Lumi asks with eagerness, gazing at your crotch suggestively. You return to the pile of toys and consider the possibilities.");
	output("\n\nSoon, a pair of small, ring-like clamps finds itself attached to her nipples, though you just can’t resist fondling those perky mounds and pinching the stiff buds afterwards. Lumi moans softly at the attention, even though her eyes remain glued to your [pc.cocks]. Large dollops of oily gray fem-lube drool out of her sopping snatch and down the cleft of her ascheeks before falling on the ground below. <i>“Come onnnn!”</i> She pleads, but you’re not finished prepping her just yet.");
	output("\n\nYou pick up an electro-plug from the hoverboard and proceed to rub it on Lumi’s pussy, which has her moaning in seconds. However, once the bulb-shaped toy is properly lubed-up, you instead press it against her butthole, which prompts a surprised yelp, even as her backdoor parts with practiced ease to accept the intrusion. Once the plug is fully lodged inside, Lumi lets out a dreamy sigh. As a finishing touch, you pick a particularly long bullet vibrator and stick it in her spacious cunt, leaving the hook-like protrusion at the base facing down, to keep the toy from getting lost inside.");

	output("\n\n<i>“Okay, this is great, but can you just fuck me now?”</i> She asks needily. Annoyed with the goblin’s impatience, you " + (!pc.hasTailCock() && !pc.hasTailCunt() ? "take a bit gag from the toy pile and proceed to shut her up with it. There, much better. Then you " : "") + "start up the toys, which causes Lumi to yelp in pleasure as the vibe in her cunt springs to life in time with the first electric discharge that runs through her butthole. The stimulation gradually settles into an ebb-and-flow rhythm, allowing her to adjust.");

	output("\n\nSmirking at the sight of your own work, you pick her by the ankles, spread those thick legs wide open and line up with with her swollen, needy cunt. And without further ado, you dive in! The Gabilani is so wet and ready that your [pc.smallestCock] barely faces any resistance as it parts her silky walls, sliding along the vibrator’s length and causing Lumi to " + (!pc.hasTailCock() && !pc.hasTailCunt() ? "bite down on the gag and " : "") + "squeal in delight.");
	
	pc.cockChange();
	
	if (pc.cockTotal() > 1)
	{
		output("\n\nAt the same time, your [pc.biggestCockNoun], already slick with precum, slides over her inch-wide clit and soft belly,");
		if (pc.biggestCockLength() >= 10) output(" until it comes to nest between her breasts. Feeling this, the petite lady presses her sagless mounds together, giving your [pc.biggestCockHead] a very nice massage despite her modest cup size.");
		else output(" resting beautifully as it comes to a halt on the petit lady’s plump midsection.");
	}
	
	output("\n\nSince she’s very clearly comfortable, you start moving your [pc.hips] at a moderate pace. Every few seconds, the plug in her ass releases a discharge, which causes her snatch to clench around your cock, though the oily lubrication ensures that you don’t even slow down.");
	output("\n\nIt doesn’t take two minutes for Lumi to reach the first orgasm, which is marked by even more " + (!pc.hasTailCock() && !pc.hasTailCunt() ? "muffled " : "") + "squealing and a series of delicious rotations from the specialized muscles of her Gabilani cunt, wringing your shaft while she squirts girlcum all over your [pc.thighs]" + (pc.balls > 0 ? " and [pc.balls]" : "") + ", some of it going as far as to paint your [pc.belly]. You stop and wait patiently, but her orgasm just never stops.");
	
	if (pc.hasTailCock() || pc.hasTailCunt())
	{
		output("\n\nSince the high-pitched noises start to annoy you a little bit, you decide to bring your [pc.tailNoun] into the game and");
		if (pc.hasTailCock()) output(" ram [pc.oneTailCock] into her open mouth");
		else output(" shove [pc.oneTailCunt] onto her plump lips");
		output(", which prompts the Gabilani to tone it down a bit. Her sex-crazed brain understands the command at once, and she immediately starts to " + (pc.hasTailCock() ? "suck you" : "lick you") + " with gusto! The extra dose of pleasure travels through your tail and gathers up at the base of your spine, causing you to let out an ecstatic groan.");
	}
	
	output("\n\nCasting restraint aside, you proceed to roughly penetrate the goblin. Every time you thrust, your [pc.smallestCock] slides over the active vibrator and gets wrung by her silky, muscly walls, and every time you pull back, you hear the squishy sounds of fem-lube being pumped out.");
	
	if (pc.cockTotal() > 1)
	{
		output(" Meanwhile, your [pc.biggestCock] slides on her big clit " + (pc.biggestCockLength() >= 10 ? "and between her waiting breasts." : "and soft midsection."));
		if (pc.hasTailCock() || pc.hasTailCunt()) output(" And despite everything, the Gabilani’s fat lips and tongue never stopped working on your tail-mounted " + (pc.hasTailCock() ? "[pc.tailCock]!" : "[pc.tailCunt]!"));
	}

	output("\n\nYou know you won’t last long at this rate, but you don’t care. Lumi is way past caring too, lost as she is in her one continuous orgasm while being stimulated by you and the toys. Closing your [pc.eyes], you release a loud moan and surrender yourself to sensation, feeling your [pc.cocks] " + (pc.hasTailCock() ? "and tail-mounted [pc.tailCocks] " : "") + "pulsate powerfully as a deluge of [pc.cum] flows through " + (pc.cockTotal() > 1 ? "their" : "its") + " entire length and bursts out, filling the goblin's shuddering cunt " + (pc.hasTailCock() ? "and mouth " : "") + "with your virility" + (pc.cockTotal() > 1 ? ", as well as thoroughly painting her belly, breasts and face" : "") + (pc.hasTailCunt() ? ", while your tail-mounted [pc.tailCunt] squirts [pc.girlCum] all over her hungry mouth and wiggling tongue" : "") + ".");
	
	var cumAmt:int = pc.cumQ();
	if (pc.hasTailCock()) cumAmt += 1000;
	
	if (cumAmt >= 200) output("\n\nYour orgasm lasts a good minute before it finally starts to wind down...");
	if (cumAmt >= 2000) output(" There is just no way the Gabilani’s small body could contain the sheer amount of spunk you’re pumping in, most of which ends up gushing out of her overfilled cunt " + (pc.hasTailCock() ? "and mouth " : "") + "with squelching sounds. By the end of it, she looks pregnant with quintuplets!");
	else if (cumAmt >= 1000) output(" Inevitably, some of your voluminous spunk ends up spilling out of her overfilled cunt " + (pc.hasTailCock() ? "and mouth " : "") + "- by the time you’re finished, the Gabilani looks downright pregnant.");
	else if (cumAmt >= 500) output(" And by the time you’re finished, Lumi looks even chubbier and more adorable than before!");
	
	output("\n\nOnce you recover from the wave of bliss, you gather your things and make ready to leave. Lumi’s orgasm, by the looks of it, has only just run out of juice.");
	if (pc.isNice()) output(" You turn off the toys, uncuff her and gently lay Lumi on a towel before wiping her up somewhat. As you’re about to leave, you plant a kiss on the tech’s forehead, which has her smiling at you even in her sleep.");
	else if (pc.isMischievous()) output(" You graciously remove the toys but decide that the cuffs can stay. She’s a smart girl, she’ll figure her way out.");
	else output(" You briefly consider turning off the toys and uncuffing her, but nah, better for her to learn a lesson about never pissing you off.");
	output("\n\n");
	pc.applyPussyDrenched();
	if (cumAmt >= 1000) pc.applyCumSoaked();
	processTime(60);
	pc.orgasm();		
	lumiDisable(2);		
	IncrementFlag("LUMI_PC_SEX");
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericVictory();		
}
//[Scissor]
public function lumiScissor():void
{
	clearOutput();
	lumiShowBust(false,true);
	showName("DEFEATED:\nLUMI");
	
	var vag:int = pc.biggestVaginaIndex();
	
	output("With a smile, you " + (pc.isNude() > 1 ? "decide to give" : "start taking off your [pc.gear] in front of Lumi, giving") + " her a little show by running a [pc.hand] sensually over your [pc.breastNoun] and pinching a [pc.nippleNounSimple]. Your other hand snakes down towards your crotch and starts playing with your [pc.vaginas], spreading the lips apart while the Gabilani watches drooling from the mouth and pussy both.");
	output("\n\nYou tell Lumi that you want to have some girl fun and instruct her to lay down on her back for you. <i>“Oh, you want to sixtynine?”</i> She asks with a giggle, already spreading her beautiful legs, but you inform that you have something else in mind. Her brow creases in thought, but she can’t seem to guess what it is.");
	output("\n\nBetween her addiction to cock and her fixation with phallic toys, you’d wager she has limited experience with girl parts. It’s time to change this.");
	output("\n\nGently, you kneel between her spread legs, picking one up and leaning it on your [pc.breastNounChaste], then you");
	if (pc.isNaga()) output(" push your snake body closer, effectively");
	else output(" place");
	{
		if (pc.legCount >= 2) output(" one of your [pc.legs]");
		else output(" your [pc.leg]");
		output(" at the side of her chest, effectively");
	}
	output(" pressing your crotch against her plump thighs. After a moment, Lumi gets the idea and raises her broad, powerful hips to meet your [pc.vaginaNoun " + vag + "] with hers.");
	output("\n\nYou purr a low murmur of approval and proceed to rock your [pc.hips] ever so lightly, savoring the heavenly feel of her big, sopping snatch and inch-wide clit sliding over your [pc.vaginasNounSimple], [pc.clitsNoun]");
	if (pc.balls > 0) output(", kissing your [pc.ballsNounSimple]");
	else if (pc.hasCock()) output(", kissing the base of your [pc.cocksNounSimple]");
	output(" and smearing your [pc.thighs] with her oily fem-lube.");
	
	output("\n\nLumi’s eyes are closed, her face a dreamy expression as she absorbs the moment, burning it in her memory. After a short while, she gets bolder and decides to start moving her own hips, smearing you with even more citrusy-smelling juices. Lumi’s eager rocking prompts you to increase your own pace, locking the two of you in a dance of trying to match each other. She opens her eyes and gazes at yours with an unexpectedly intimate smile, and you find yourself " + (pc.isAss() ? "slapping one of her asscheeks, which prompts her to yelp in surprise before giggling." : "smiling back."));
	output("\n\nAnswering to her look, you lean in and pull Lumi into a kiss, which she returns with devotion, your [pc.lips] sliding over her plump ones as your tongues intertwine in sensual exploration.");
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" As her mouth drinks in your aphrodisiac saliva, you feel the goblin’s body growing hotter and needier, her legs pressing against yours as if in a plead.");
	output(" After breaking the kiss, you take a chance to play with her perky mounds, spreading your lips around one of her areolas and sucking, nibbling the large bud. Moaning in rapture, the goblin places a hand on your [pc.hair] and pushes you harder against her breast, before you decide to switch to the other one.");
	
	output("\n\nHer swollen pussylips continue to kiss yours for several minutes, and you are both panting from the exertion when her face suddenly strains. Knowing what is about to happen, you grin and rock your [pc.hips] more firmly, precipitating the chain reaction and watching in delight as she is reduced to a trembling mess, her arms hanging on to you for dear life.");
	output("\n\nGlued to your crotch, the goblin’s swollen snatch starts quivering and squirting superbly! You can literally feel the powerful squirts of her girlcum splattering against your [pc.vaginas] while she coos in whorish ecstasy. Occasional ropes even splash on your [pc.clits] - when " + (pc.vaginaTotal() > 1 ? "they are" : "it is") + " not being caressed by her labia or rubbing on her love button.");
	
	output("\n\nThe extra stimulation of her unending orgasm soon pushes you over the edge, and your voice rises to join Lumi’s moaning as your own [pc.biggestVagina] starts shuddering in bliss" + (pc.vaginaTotal() > 1 ? ", followed by the rest." : ".") + " [pc.GirlCum] ");
	if (pc.wettestVaginalWetness() >= 4 || pc.girlCumMultiplierRaw >= 5) output(" gushes out in large spurts,");
	else output(" spills out,");
	if (pc.hasCock()) output(" and [pc.eachCock] starts cumming in sympathetic orgasm,");
	output(" adding your own juices to the mess.");
	
	output("\n\nAn indeterminable amount of time passes while you and Lumi huddle together in joint climax, until eventually both of you come down. <i>“That was... wow, I never thought I could feel this good without something big inside!”</i> You chuckle and tell her there are infinite ways to feel good. Silence stretches as Lumi looks into your [pc.eyes] with fascination, and then a conspiratorial smile spreads across her lips. <i>“Wanna go again?”</i>");
	
	processTime(15);
	pc.orgasm();	
	clearMenu();	
	addButton(0, "Next", lumiScissor2, undefined);
}
public function lumiScissor2():void
{
	clearOutput();
	lumiShowBust(false,true);
	showName("DEFEATED:\nLUMI");
	
	
	output("Many orgasms later...");
	output("\n\nExhausted but satisfied beyond belief, you clean yourself, gather your things and kiss Lumi goodbye, though she makes you promise you’ll be back for a repeat. It would have been impossible to say no.");
	output("\n\n");
	for (var x:int = 0; x < 3; x++)
	{
		processTime(20);	
		pc.orgasm();
	}
			
	lumiDisable(1);	
	pc.applyPussyDrenched();
	IncrementFlag("LUMI_PC_SEX");
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericVictory();	
}
//[Impale]
public function lumiImpale(kok:int = 0):void
{
	clearOutput();
	lumiShowBust(false, true);
	showName("DEFEATED:\nLUMI");
		
	output("You mention her injecting something that made your cock" + (pc.cockTotal() > 1 ? "s" : "") + " bigger while Lumi was ‘harvesting’ your genes. <i>“What’s the deal with that mod?”</i> You ask while laying down a slender cushion on the ground in preparation for what you intend to do. The goblin goes to her backpack and returns holding a small medipen with a proud smile on her face.");
	output("\n\n<i>“I’m calling this Throbb-lite! It’s based on a sample of a drug I got my hands on a couple of months ago. Basically, it makes your cock grow for an hour and then go back to its original size, though to be honest there have been a couple of... mishaps... during the first couple of trials. This one shooould be safe though!”</i>");
	output("\n\nYou note the emphasis on ‘should’. Still, you’re in the mood for adventure, so you swipe the medipen from the tech’s hand and tell her you’ll be keeping it for now. Ignoring her half-hearted complaints, you " + (pc.isCrotchExposed() ? "" : "take off your [pc.crotchCovers], ") + "lie down on your back and start stroking your [pc.multiCocks] to full hardness.");
	output("\n\nThis is enough to shut her up - all the goblin can do is gaze hungrily at your meat, while her Soak-conditioned pussy drools more and more fem-juice down her thighs. Smirking, you give your [pc.cockNounSimple " + kok + "] a little suggestive shake and say that it won’t milk itself.");
	output("\n\nLumi snaps of her trance in the blink of an eye, moving to place her feet on either side of your [pc.hips]. Her cunt’s oily lube drips down your [pc.crotch] in large dollops - the sight brings a big smile to your face, and you can’t help telling her to wait just a bit as you take a pic with your Codex.");
	output("\n\nThe lusty tech bites her lip with anticipation until you hold up your junk and give her the go sign to start squatting down. Lumi makes it slow, allowing you both to savor the feel of your [pc.cockHead " + kok + "] making contact with her sopping, swollen pussylips and parting them to penetrate her silky depths. Inch by inch, your shaft buries into the warmth of her snatch, its specialized walls twisting and wringing you at a slow pace.");
	
	pc.cockChange();
	
	output("\n\n");
	if (pc.hasKnot(kok)) output("The knot goes in almost as easily as all the rest, prompting you to sigh contentedly at the uncommon sensation. Even if it’s not inflated, most people still can’t take a knot from the start like that! ");
	output("Once you’re completely bottomed out, the goblin places her knees on the ground to either side of your [pc.belly] and starts rocking her large hips up and down, riding you cowboy style at a measured pace. It doesn’t take long before she has you purring in relaxed pleasure."); 

	output("\n\nWith a slight break in the rhythm, she takes the chance to look deep into your [pc.eyes] and make a sultry face as she takes both of your hands and places them on her perky breasts. It’s a perfect fit. Your [pc.fingers] waste no time in fondling their firm, sagless curves and pinching her disproportionately large, stiff nipples, which causes her to throw her head up and start moaning in raptured pleasure, her hips picking up the pace again.");
	output("\n\nNow that she is distracted, you decide it’s the perfect time for a surprise: a short interruption is all it takes for you to prick the base of your " + (pc.hasKnot(kok) ? "[pc.knot " + kok + "]" : "dick") + " with the medipen. By the time Lumi notices once of your hands isn’t on her breast anymore, it’s too late - your [pc.cockNoun " + kok + "] quickly grows two full inches inside her cunt, causing Lumi’s eyes to widen in surprise.");

	pc.cocks[kok].cLengthRaw += 2;
	
	output("\n\nThe tech looks down, catching sight of the discarded medipen, and recognition shines in her eyes as, even in a lust haze, her smart brain quickly connects the dots. To her credit, she doesn’t slow down - quite the contrary, she starts bouncing on your meat with even more vigor, her muscly inner walls wringing your enlarged meat for all it’s worth. However, the extra stimulation has an effect on the goblin as well, who reaches an orgasm.");
	output("\n\nThe movement of Lumi’s hips stops momentarily as her cunt shudders and releases a river of oily-grey girlcum down your crotch" + (pc.balls > 0 ? ", [pc.balls]" : "") + " and [pc.thighs], but still your tool continues to grow, choosing this moment to fatten up.");
	
	pc.cocks[kok].cThicknessRatioRaw += .4;
	
	output(" You watch in a trance as her puffy pussylips spread further around your [pc.cock " + kok + "] as it widens before your eyes. Damn, you’re <i>fucking hung!</i>");
	
	output("\n\nPlacing your hands on the goblin’s broad hips, you start moving her up and down your length, practically using her as a fleshlight as you lose control, thanks to the amplified sensations being fed to your brain by the engorged dick in her pussy.");
	
	pc.cocks[kok].cLengthRaw += 2;
	
	output(" You can feel with amazing clarity your [pc.cockHead " + kok + "] plowing the deepest recesses of her vagina, sliding along the incredibly tight yet ultra-slick walls.");
	if (pc.hasKnot(kok)) output(" And every time you bottom out, your [pc.knot " + kok + "] stretches her pumped-up labia a little bit more, prompting you to briefly wonder if you’ll give her a gaping snatch");
	if (pc.cocks[kok].cLengthRaw >= 18) output(" You can even make out the contours of your ultra-hung rod distending her chubby belly!");
	
	output("\n\nLumi’s face shows a complex mixture of pain and pleasure as she bites her lip and groans in a sultry tone. Even her capacious cunt is having trouble with your huge meat, but in truth it is any Soak-addict’s dream to be speared like this. That’s why Soak makes girls’ holes so elastic and resilient in the first place, capable of getting off just from being stretched by monster cocks and having orgasm after orgasm without becoming too sensitive.");
	output("\n\nAs if waking up from a trance, Lumi smiles at you and bends down, placing her fat lips on your [pc.breasts], while her own mounds press against your [pc.belly]. Then, she proceeds to suck and bite playfully on your [pc.nipples] while you jerk her up and down your bloated junk.");
	output("\n\nMoving your [pc.hips] in tempo with her, you free one [pc.hand] and take the opportunity to give her fat, jiggly butt a good spanking, since she likes it so much. Each slap is accompanied by a whorish moan and a delicious contraction inside her snatch, which, you realize, has never stopped orgasming.");

	pc.cocks[kok].cLengthRaw += 2;
	
	output("\n\nAfter a couple of minutes, another growth spurt hits, causing you to suck in a sharp breath as sensation increases once again, flooding your mind with pleasure. The sudden rush of blood to your member makes you light-headed, and your brain finds itself with no space left to focus on anything but the delicious feedback from your [pc.cock " + kok + "] as it humps Lumi’s hot, shuddering, overstuffed cunt.");
	
	output("\n\nFeeling what is to come, you yank her down your");
	if (pc.hasKnot(kok)) output(" tool just in time for your [pc.knot " + kok + "] to start swelling, locking your cum hose inside her as it starts to pulsate powerfully.");
	else output(" cum hose as it starts to pulsate powerfully inside her.");
	output(" You can’t help but moan in absolute bliss when the first rope - or, more accurately, torrent - of [pc.cum] spills out of your [pc.cockHeadNoun " + kok + "] and deep into her love tunnel, followed by many more ropes.");
	if (pc.cockTotal() > 2) output(" Your other dicks join in a chorus of sympathetic climax, squirting [pc.cumFlavor] cum to the winds.");
	else if (pc.cockTotal() > 1)output(" Your other dick joins in a chorus of sympathetic climax, squirting [pc.cumFlavor] cum to the winds.");
	
	output("\n\nFeeling your seed splash against her walls causes Lumi’s orgasm to peak once again, reducing her to a moaning, trembling mess impaled on your big, fat pole.");
	
	if (pc.cumQ() >= 500) output(" You watch in glee as her belly expands from all the seed you’re pumping in, making her look quite chubby!");
	if (pc.cumQ() >= 1000) output(" But your pulsating cum hose doesn’t stop there, no. It goes on and on, feeding her womb until she looks downright pregnant with your spunk.");
	if (pc.cumQ() >= 2000) output(" Gradually, Lumi’s belly starts to balloon, up to the point where" + (pc.hasKnot(kok) ? ", despite your [pc.knot " + kok + "]," : "") + " the sheer backpressure causes cum to start leaking out of her stretched-up cunt.");
	
	if (pc.cumQ() >= 5000)
	{
		output("\n\nFinally, there is just no way her small goblin body can hold it in, and she starts getting pushed up out of your length, one millimeter at a time, until");
		if (pc.hasKnot(kok))
		{
			output(" your [pc.knot " + kok + "] comes free with a loud ‘pop’, accompanied by a torrent of [pc.cumNoun] that bursts out of Lumi’s small body, launching her up like a");
			if (pc.cumQ() >= 20000 && silly) output(" cannon ball!");
			else output(" champagne cork!");
			output(" She lands on top of your [pc.belly] with a gentle thud, the impact cushioned by her own cum-filled body.");
		}
		else output(" she slides free at last and lands gently on top of your [pc.belly], her own cum-filled body acting like a soft cushion.");
	}
	
	output("\n\nWhen your long cumshot finally ends, Lumi has given in to exhaustion and fallen into a catnap on top of you. Panting, you take a few minutes to recuperate, but end up joining her in blissful dreaming. By the time you wake up though, your [pc.cockNoun " + kok + "] has thankfully (or regrettably?) returned to its original size. Lumi is nowhere to be seen, save for the trail of [pc.cumNoun] she left while leaving. Chuckling, you gather your things and make ready to leave as well.");
	output("\n\n");
	//undo changes
	pc.cocks[kok].cLengthRaw -= 6;
	pc.cocks[kok].cThicknessRatioRaw -= .4;
	
	processTime(20);
	pc.taint(2);
	pc.libido(1 + Math.floor((100 - pc.libido()) / 10)); 
	pc.applyPussyDrenched();
	if (pc.cumQ() >= 1000) pc.applyCumSoaked();
	pc.orgasm();
	processTime(40);		
	lumiDisable(2);		
	IncrementFlag("LUMI_PC_SEX");
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericVictory();		
}
//[Overpower] start fight
public function lumiOverpower(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(lumiVictory);
	CombatManager.lossScene(lumiDefeat);
	CombatManager.displayLocation("LUMI");
	CombatManager.beginCombat();
}