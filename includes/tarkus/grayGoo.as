import classes.Characters.GrayGoo;
import classes.Creature;
import classes.GameData.CombatManager;
//The Gray Goo
//A TiTS Combat Encounter
//By Savin: Age 12

//Design Notes
//Relatively resistant to Physical/Kinetic attacks. Decent Lust resistance. Vulnerable to Energy attacks and explosives (I'd imagine the Gravidic Disruptor / Frag Grenades would fuck up their shit). 
//If a PC has sex with / is raped by a Gray Goo, they may gain a temporary vulnerability to TFs (ie, TF items have greater effect) since the PC's microsurgeons and the Gray Goo would be interfering with each other. 
//Most Gray Goo attacks are Lust based or Grapple/Restraint attacks. They deal no physical damage. If the PC buys some kind of EMP grenade, could be an instant-win attack.

//Encountering the Gray Goo
public function encounterDasGooGray():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("\nGRAY GOO");
	output("As you make your way through the byzantine maze of junk strewn across Tarkus’ surface, you slowly come to the realization that... something... is moving through the debris around you. Your hand sneaks down to your " + pc.rangedWeapon.longName + " as you catch a flash of movement atop the wreckage of what might have once been a tank. By the time you’ve whirled ‘round to face whatever it was, it’s long gone. You sigh with frustration before turning back to your path - and coming face to face with a hyper-busty woman, her skin made of a reflective gray-blue material that shimmers in the hazy light. Her huge, gravity-defying tits bounce jubilantly as she steps forward, her feet melting and reforming on the ground with every wobbling step.");
	output("\n\n<i>“Hi!”</i> she giggles in a voice just faintly synthetic, more bubbly than menacing. Seeing that she’s caught your attention, the metallic babe arches her back, making her great big tits stand even further out, literally dripping");
	//first time: 
	if(flags["MET_GRAY_GOO"] == undefined) {
		output(" whatever strange stuff she’s made out of onto the ground around her “feet”. As she preens for you, your Codex beeps an urgent warning: <i>“Gray goo detected. These active micro-machine clusters are known to attack without provocation. U.G.C. Scout Authority suggests extreme caution, as well as hydration, around the native goo.”</i>");
		output("\n\n<i>“Aww, so much for surprise!”</i> the gray goo giggles, licking her lips. <i>“I just need some all-natural lubricant, " + pc.mf("Mister","Miss") + " - and you’re gonna give it to me!”</i>");
		flags["MET_GRAY_GOO"] = 1;
	}
	else
	{
		IncrementFlag("MET_GRAY_GOO");
		output(" down her feet. The gray goo steps forward on her unsteady legs, licking her lips hungrily. <i>“I just need some all-natural lubricant, " + pc.mf("Mister","Miss") + " - and you’re gonna give it to me!”</i>");
	}
	output("\n\nIt doesn’t look like she’ll take no for an answer!");
	clearMenu();
	
	CodexManager.unlockEntry("Gray Goos");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new GrayGoo());
	CombatManager.victoryScene(pcDefeatsGrayGooInTheNameOfLove);
	CombatManager.lossScene(loseToGrayGooRouter);
	CombatManager.displayLocation("GRAY GOO");
	
	addButton(0,"Next",CombatManager.beginCombat);
}

//[Do Nothing]
public function dontDoAnythingFromHardenAttack():void
{
	clearOutput();
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("FIGHT:\nGRAY GOO");
	author("Savin");
	// PC +Lust, Goo -Lust
	output("The goo gives you a pleading look, but after a moment her now more-solid fingers plunge into her empty cooch anyway, jilling the slavering hole with abandon. Her synthetic voice cries out as she teases her nub of a clit, back arching as she slides a pair of fingers in up to the last knuckle. You feel a stirring in your [pc.groin] as the goo puts on a show for you, her eyes locking with yours as she puts on her lewd display. After a moment, she hops onto her feet, keeping to a low crouch as she continues to finger herself; she cups one of her oversized tits, bringing the teat up to her mouth to suckle on it, tongue swirling around her hard, silver areola.");
	output("\n\n<i>“Like what you see, space cow" + pc.mfn("boy","girl","person") + "?”</i> she giggles, rolling onto all fours and giving you a full view of her jiggling ass. She reaches back around, sticking a few fingers back in her slit before humping back against them, thrusting faster and faster until you can see a wet sheen spilling down around her digits... which she promptly licks up, bringing it to her lips and cleaning off each finger with measured, sultry slowness. Licking her lips, she rises back to her feet, clearly done going it solo and ready for more!");
	
	// TODO Peep a better way to handle this
	// GetHostileOfType? Index override? By unique-name?
	var hostiles:Array = CombatManager.getHostileActors();
	for (var i:int = 0; i < hostiles.length; i++)
	{
		if (hostiles[i] is GrayGoo)
		{
			hostiles[i].lust( -50);
		}
	}
	
	pc.lust(10);
	CombatManager.continueCombat();
}

//[Quickie] (Masculine) {PC -Lust, Goo -Lust, Goo +HP}
public function quickieAfterGooHarden():void
{
	clearOutput();
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("FIGHT:\nGRAY GOO");
	author("Savin");

	if(pc.hasCock())
	{
		output("Well, shit, you’ve got some steam to blow off, too. You grab [pc.oneCock] and hop on the rock-hard cyber-girl, actually able to get a good enough grip on her many-faceted body to hold her steady as you line up for the thrust. <i>“Oooh, that’s the spirit!”</i> she giggles, long legs wrapping around your [pc.hips] and guiding you in. For a moment, you contemplate the fact that you’re just GIVING the creature what it wants, but in that instant, your cock spears her slippery hole, and all doubt fades away in a moment of bliss. You thrust into her welcoming slit, mind reeling between the throes of battle and love-making as you pound the cyber-goo’s cunt. It’s a few, fleeting moments of pleasure as the creature’s cunt wraps and wrings your [pc.cock] in inhuman ways, milking you with all the intensity of a well-oiled machine. As pumped-up as you are, you don’t take long to cum into her, cock spasming into the goo’s writhing, vice-like hole. She grins and moans, back arching in a nearly human way to urge you on as you shoot a thick load deep into her.");
		output("\n\n<i>“Mmm, just what I needed!”</i> the goo teases as you pull out, rolling out of her reach and back into a combat stance. She hops up, good as new and ready for more!");
	}
	//[Quickie] (Lady Bits) {PC -Lust, Goo -Lust, Goo +HP}
	else
	{
		output("Well, shit, you’ve got some steam to blow off, too. Despite her rapidly hardening exterior, the goo-girl swirls a finger around her slit’s prominent clit and pulls it out, reshaping the micro-bots inside her cyber body into a long, thick phallus for you to ride. Licking your lips, you hop on that dick without much in the way of foreplay, pinning the goo-girl between your thighs as you slide down her rod in rapturous pleasure, shuddering full-body as her gooey wet member spears your [pc.vagina]. For a moment, your mind yells at you that you’re just giving the creature what it wants, but then again, the feeling of a thick, slippery dick spreading your slit wide is all it takes to ease your trepidation, and indeed urges you into rocking your [pc.hips] and starting to bounce. <i>“Oh, that’s a good girl!”</i> the goo coos, hands gripping your waist tightly as you ride her pseudo-dick, bouncing on that cock until you’re just on the edge.");
		output("\n\nJust as you’re about to cum, the goo pulls you down onto her, locking you in a tight embrace, lips seeking out your [pc.chest] as her hips start to pound into you. You find yourself hurtling over the edge of climax on the back of a violent fucking that leaves the wasteland echoing with the sound of wet goo slapping against [pc.vaginaColor]. You barely have time to enjoy the afterglow of your quick sexual escapade before you’re tossed off the goo as she resumes her combat pose. Time to get back at it!");
	}
	pc.orgasm();
	
	var hostiles:Array = CombatManager.getHostileActors();
	for (var i:int = 0; i < hostiles.length; i++)
	{
		if (hostiles[i] is GrayGoo)
		{
			hostiles[i].orgasm();
		}
	}
	
	CombatManager.continueCombat();
}

public function loseToGrayGooRouter():void
{
	if((pc.hasCock() || pc.hasVagina()) && rand(2) == 0) bodySuitedKirbuDefeat();
	else pcDefeatByGooBitch();
}

//PC Victory
public function pcDefeatsGrayGooInTheNameOfLove():void
{
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Jiggling and deforming under the ");
	if(enemy.lust() > 99) output("teasing display of sensuality you’re giving it");
	else output("brutal physical attacks you’re slinging");
	output(", the gray goo finally collapses into little more than a puddle of goop on the ground, only vaguely in humanoid shape. Looming over her - it - you could do just about anything. And it probably wouldn’t even mind.\n\n");
	
	clearMenu();
	if(pc.intelligence() >= 20 || pc.characterClass == GLOBAL.CLASS_ENGINEER) addButton(0,"Reprogram",reprogramGrayGoosForYerPleasure,undefined,"Reprogram","Reprogram the goo into a less harmful form.");
	else addDisabledButton(0,"Reprogram");
	if(pc.lust() >= 33)
	{
		if(pc.hasCock()) 
		{
			addButton(1,"MutualFap",mutualGooMasturbation,undefined,"Mutual Masturbation","It starts out as a blowjob but winds up being so much more!");
			if(pc.cockTotal() > 1) addButton(2,"MultiFuck",multiCockMayhem,undefined,"Multicock Fuck","Use multiple dicks on her simultaneously.")
			else addDisabledButton(2,"MultiFuck", "Multicock Fuck", "If only you had more than one cock....");
		}
		else
		{
			addDisabledButton(1, "MutualFap", "Mutual Masturbation", "If only you had a cock....");
			addDisabledButton(2, "MultiFuck", "Multicock Fuck", "If only you had a pair of cocks....");
		}
		if(pc.hasVagina()) addButton(3,"Catch: DP",divideAndConquerGinasWithGoos,undefined,"Catch: Double Penetration","Get the goo to divide and take you both ways at once!");
		else addDisabledButton(3,"Catch: DP", "Catch: Double Penetration", "If only you had a vagina....");
	}
	else
	{
		output("<b>You aren’t aroused enough to engage in any forms of coitus with the goo.</b>\n\n");
		addDisabledButton(1,"MutualFap");
		addDisabledButton(2,"MultiFuck");
		addDisabledButton(3,"Catch: DP");
	}
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Reprogram
// Requirement: Tech Specialist /or/ INT of 20+
public function reprogramGrayGoosForYerPleasure():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Hmm. According to the Codex, this slut’s just a great big pile of micro-bots, kind of like your micro-surgeons. Assuming a networked intelligence, it shouldn’t be too hard to muck around with her mind. Maybe get this one to be a little friendlier in the future.");
	output("\n\nYou pull the hefty Codex out of your backpack and spend a few minutes fiddling with the wireless networks nearby before finding the one holding the gray goo together. As you’re poking around on the dataslate, though, the gray goo shudders and re-forms into her over-sexed human babe form, lips pursed quizzically as she watches you work.");
	output("\n\n<i>“A-are you not going to fuck me?”</i> she asks after a moment, cocking her head to the side. Even that slight motion gets her huge, wobbly tits jiggling.");
	output("\n\n<i>“What’s that?”</i> you ask, pressing a button on your touch screen. The goo-girl freezes up, eyes wide. Another click, a few taps and new lines of code and her body shudders violently as the micro-bots inside her rearrange themselves.");
	output("\n\nAfter a few moments, the goo-girl stands up straight, eyes vacant and staring straight ahead. Flatly, her voice intones: <i>“Bell-Isle/Grunmann Technologies Integrated Triage System rebooting. This system has not rebooted in \\\[\\\[UNKNOWN\\\]\\\] -- \\\[\\\[UNKNOWN\\\]\\\] -- years. Systems resetting. Standby.”</i>");
	
	CodexManager.unlockEntry("BI/G");
	
	if(!CodexManager.entryViewed("BI/G") && flags["DECK13_CREW_TALK"] == undefined) output("\n\n<i>“Bell-Isle/Grunmann?”</i> you muse, watching the goo-girl reformat herself. <i>“Never heard of ‘em.”</i>");
	else output("\n\nYou watch the goo-girl reformat herself.");
	output("\n\nAnother violent shudder and the goo-girl blinks as if waking from a long sleep. Her body quickly morphs itself into more... normal... human proportions: still voluptuous, but her tits slip down to a reasonable D-cup, and her butt and hips slim down to a more reasonable level. Were it not for her gray, shimmering exterior, she might just pass for human, now.");
	output("\n\nTurning to you, she says, <i>“You are not on the crew manifest. ADDENDUM: Databanks corrupted. Re-setting security protocols to factory standards. How may I help you, master?”</i>");
	output("\n\nNeat!\n\n");
	processTime(5+rand(3));
	clearMenu();
	if(pc.HP() < pc.maxHP()) addButton(0,"Heal Me",healMeGrayGooYoureMyOnlyHopeDotDotDot,undefined,"Heal Me","Have the goo woman user her microsurgeons to heal you.");
	else addDisabledButton(0,"Heal Me");
	addButton(1,"Take Sample",takeASampleOfTheGrayGoo,undefined,"Sample","Collect a sample of the mysterious woman for... science!");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Heal Me
// Needs less than max HP
public function healMeGrayGooYoureMyOnlyHopeDotDotDot():void {
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("It did say it was a medical system, after all...");
	output("\n\n<i>“Yes, master,”</i> the goo says, stepping up to you and unceremoniously putting a finger in your mouth. You try to pull back, but too late - you can feel several drops of microbots already swimming down your throat. A moment later, a shudder works its way through your body as they do their job, your bruises and cuts from prior fighting quickly healing.");
	output("\n\n<i>“Services rendered. Good day, master,”</i> the goo says before wandering off.");
	output("\n\nThat’s one less rape-monster on this planet. You do good work!\n\n");
	pc.HP(50);
	processTime(1);
	CombatManager.genericVictory();
}

//Take a Sample
public function takeASampleOfTheGrayGoo():void {
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Now that the goo-girl’s not in rape-mode anymore, you might be able to find a use for some of the microbots that comprise her shimmering gray body. You pull a vial from your pack and step up: <i>“Just, uh, need to take a sample. Hold still.”</i>");
	output("\n\n<i>“Yes, master,”</i> she intones blankly, holding stock still as you dip the vial into one of her tits, filling it up with squirming micro-machines. You cork it and stow the vial back in your pack.");
	output("\n\n<i>“If that’s all, master,”</i> she says before wandering off into the wastes.");
	output("\n\nThat’s one less rape-monster on this planet. You do good work!\n\n");

	eventQueue[eventQueue.length] = getSomeGrayGoo;
	processTime(1);
	CombatManager.genericVictory();
}

public function getSomeGrayGoo():void {
	clearOutput();
	output("That gray vial of microbots is still here.\n\n");
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new GrayMicrobots();
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}


//Multicock Victory
// PC has 2+ cocks
public function multiCockMayhem():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Looking at the nearly amorphous pile of cybernetic goo at your feet, a dirty little thought crosses your mind. If she wanted some of that “organic lubricant,” why not give her all she can handle? Licking your lips, you step up to the gray goo and drop your [pc.gear], revealing the swelling shafts of your [pc.cocks]. The goo gasps in delight as the drooping lengths of your multiple cocks drag across her gel-like skin, sending ripples through her as you look for a hole to fuck.");
	output("\n\nTo your surprise (delight?), one forms for you as the cyber-goo-girl finally reconfigures herself, the comically-busty babe appearing once more from the puddle of micro-machines, but this time with a great big gaping pussy situated between the cleavage of her breasts. Woah, nelly. <i>“Maybe this’ll be more your style?”</i> she says with an exaggerated wink, jiggling her massive tits around the gaping slit of her faux-pussy, inviting you to ram your rods right on in. You step up as if to straddle the goo’s waist, but she gives you a quick shake of her head and twirls her fingers - come in from the other side.");
	output("\n\nWell, what’s the harm? You swing around and lower yourself onto the prostrate goo’s level, shuddering a bit as one of your cocks touches her shimmering surface, slipped easily into the gulf between her tits, pressing into the open gash between them. Her soft, wet fingers wrap around your [pc.legOrLegs] as you settle in, spreading them wide as a long, languidly moving tongue slithered out from her mouth and straight up into your undercarriage.");
	output("\n\n");
	//If PC has balls. Plural.: 
	if(pc.balls > 1) 
	{
		output("You only just stifle a gasp as her tongue wraps around your [pc.balls], slowly encircling the heavy orbs, tip flicking and licking across the taut flesh. The goo cranes her neck up");
		//if tauric:
		if(pc.isTaur()) output(", inhumanly so,");
		output(" to bring her lips to them, suckling on one of your churning nads. Biting your lip to contain your gasps of pleasure, you let your hands sink into the goo’s slippery, pliant body, at one moment groping her big, soft tits, and the next watching your hands sink into them, surrounded by a gooey prison of churning cyber-goo. It’s impossible to concentrate on that, though, as the gooey babe slowly suckles her way from one [pc.ball] to the other, tongue trailing behind her lips as it continues to wrap and squeeze your sack. Just as you’re about to push into her slit, the goo tightens her grip on your [pc.balls], almost on the verge of being painful, rooting you in place as her lips lock onto the bottom of your scrotum, sucking for a moment before opening wide and taking your whole sack in!");
		output("\n\nAny hint of pain vanishes as the goo gobbles up your balls, submerging your [pc.balls] in an ocean of gently squeezing, caressing goo inside her locked lips. The gray goo murmurs happily around your nads, tongue lapping away at what little of it remains on the surface, occasionally reaching up to tease and prod your [pc.asshole]. As she does so, her back arches ever so slightly, spreading her tits wide for you, finally ready for the main event.");
	}
	//PC has a monoball or no balls: 
	else
	{
		output("Your body shudders reflexively as her long, snakey tongue slithers");
		if(pc.legCount > 1) output(" up between");
		else output(" around");
		output(" your [pc.legOrLegs] to the crack of your [pc.butt], strong enough to spread your cheeks apart and bare your [pc.asshole] to the naked air. Breath catches in your throat as the goo’s tongue teases the tight-clenched ring of your ass, gentle yet forceful strokes that soon have you subconsciously relaxing your body. Biting your lip to contain your gasps of pleasure, you let your hands sink into the goo’s slippery, pliant body, at one moment groping her big, soft tits, and the next watching your hands delve into them, surrounded by a gooey prison of churning cyber-goo. It’s impossible to concentrate on that, though, as the silvery babe slowly presses her long, writhing tongue into your [pc.asshole], spreading you apart and pushing the tip into you.");
		output("\n\nThe sensation is practically overwhelming, feeling the writhing, tentacle-like length of gooey micro-bots slithering through your ass, spreading your rectal passage wide. You shift your [pc.hips], rolling them back across the goo’s face, shuddering as her tongue slips almost out of you, only to thrust back in. Your back arches as you’re penetrated, hips moving instinctively as the goo-girl rims you; your hips bring your [pc.cocks] closer and closer to the goo’s chest-cunt, inching towards the spread cleavage between her massive mounds, the gash between them all but drooling in anticipation.");
	}
	// Combine
	output("\n\nSpurred on by the goo’s oral ministrations, you finally press into the slick slit between her tits. You both share a gasp as your [pc.cocks] spread");
	output(" the forged lips of her silver pussy, spreading her whole body wide to take your multiple lengths together like only a goo can. You watch with glee as her torso deforms to take your [pc.cocks], widening and deepening to accommodate all the cockmeat you can offer her. And you’re happy to give it: the feeling of your cocks submerged in an undulating sea of slippery goo is almost too much for you, and it takes everything you have to hold back your orgasm.");
	pc.cockChange();
	output("\n\nDespite having her head buried under your [pc.butt], the goo seems acutely aware of your predicament, and quickly shifts her hands to squeeze her big ol’ tits around your cocks, encasing what little remains outside of her stretched body in slippery, soft goo-boob. You draw your hands out of their gooey prison, twisting the big, dark nipple that forms in their absence, helping the cyber-girl to squeeze her squishy tits around your pricks as you spear her with ");
	if(pc.cockTotal() == 2) output("both");
	else output("all " + num2Text(pc.cockTotal()));
	output(" lengths.");

	output("\n\nFully sheathed inside the confines of the defeated goo-girl, you let yourself breathe a moment, enjoying the sensation of her soft, cybernetic body gently but incessantly squeezing and wringing around your cocks, every micro-bot inside her collective working its hardest to milk you of your precious seed. She’s damn good at it, too - you feel as if you’re in a sea of squeezing, slippery gel, utterly enwrapping and sucking on your cocks, as tight as an ass, as wet as a cunt, and sucking harder than a whore’s mouth. Slowly, you start to thrust into the magnificent hole, drawing your [pc.cocks] out, only to ram it back in, taking the goo’s lengthy tongue in with you, making her head bob and buck as she lavishes your most sensitive spots with her tongue and lips.");
	output("\n\nYou pick up speed, fucking her faster and harder until you’ve reached a frantic pace, every motion punctuated by a flick of her tongue or a squeeze of her breasts, lavishing you in a ceaseless barrage of sensation that threatens to wring your orgasm from you with every passing moment. Your fingers dig into her tits, savaging the great mounds until the goo’s crying out in pleasure, voice muffled by your [pc.butt] gliding across her smooth face. Between her mouth and cunt-like body, you lose yourself into a bliss of sexual pleasure, surrendering to the inevitable and thrusting your hips as fast as you can, pounding the goo as she works for her meal.");
	output("\n\nYour orgasm is an explosive crescendo in a symphony of pleasure: you convulse atop the gray goo, hammering your multiple rods ");
	if(pc.balls > 1) output("balls deep");
	else output("as deep as you can");
	output(" into her eager pussy, groin rebounding off her bouncing boobs as you shoot your [pc.cum] deep into her cunt-like body, filling the greedy monster with the cum she was so desperate to wring from you. Waves of pleasure crash through you, nearly throwing you from the bucking goo-girl as your cocks fill her with jizz. Her body seems to bloat out as you fuck her full of cum, your load powering her cybernetic processes just enough to get her really moving. You can feel the gushing tides of microbots caressing your cock as she revs up, finally achieving lubrication!");
	output("\n\nPanting and gasping from sexual exertion, you finally roll off the goo, covered in cum, sweat and little puddles of micro-bots riven from the whole. Your cocks are still twitching, drooling their last bits of cum which the goo-girl is quick to slurp up, rolling onto all fours to suckle from your fountains, mouth stretched wide to accommodate them. You shudder and gasp as she sucks the last of your seed from your well-fucked rods, tongue lashing across your glans as her lips wring and caress until you feel like you could cum again.");
	output("\n\nShe doesn’t let up until you do. Minutes pass as the goo-girl suckles from your exhausted body, head bobbing happily up and down your lengths, even getting her tits in on it, rubbing your rods between their soft, jiggling mounds until your back is arching with the overwhelming pleasure. Another orgasm rocks through your body, another rush of cum shooting from your lip-locked [pc.cocks] until the girl’s cheeks are bulging with a second wave of seed.");
	output("\n\nSlurping it down with a happy hum, the gray goo finally releases your cocks, wiping a trickle of cum from her puffy lips and giving you a playful wink as she stands. <i>“Thanks for that!”</i> she beams, staggering to her feet. <i>“A little all-natural lubrication’s just what I needed! See ya around!”</i>");
	output("\n\nYou start to speak, but the goo’s slipped off beyond the junk before you can say a word. With a fatigued sigh, you gather up your gear and stumble off.\n\n");
	
	for(var c:int = 0; c < pc.cockTotal(); c++) { enemy.loadInCunt(pc, 0); }
	pc.energy(-5);
	processTime(20+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Mutual Masturbation
public function mutualGooMasturbation():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Time to put this cybernetic goo-girl’s endurance to the test. You shuck your [pc.gear] and approach the defeated goo. Seeing your bared [pc.cock] hanging half-hard " + (pc.legCount > 1 ? "between" : "on") + " your [pc.legOrLegs], she quickly reforms into the ultra-busty babe she attacked you as, big lips pursed in a curious expression as you loom over her.");
	output("\n\n<i>“Oooh, that’s a nice [pc.cockNounSimple] you’ve got there,”</i> the silver goo giggles to herself, her gray eyes locked on your stiffening shaft, crossing each other as you present it to her lips for a sucking. <i>“Y-you want me to... but... why’d you fight me? I was gonna make you feel good anyway!”</i>");
	output("\n\nYou scowl down at the goo and thrust your hips forward, prodding her lips open around the [pc.cockHead] of your prick. She tries to speak, but her words are quickly muffled around the head of your cock as you take the opportunity to thrust into her open mouth; her throat is as stretchy as you might imagine, easily taking every inch you can offer the insatiable goo before you can blink. Her voice breaks into a sultry moan as your ");
	if(pc.balls > 1) output("[pc.balls]");
	else if(pc.balls == 1) output("[pc.ball]");
	else output("groin");
	output(" slap her chin, your [pc.cock] stuffed all the way in, making her throat bulge visibly to accommodate your girth.");

	output("\n\n<i>“That’s more like it,”</i> you laugh, patting the slimy slut on the head. <i>“Now start sucking.”</i>");
	output("\n\nHer big, solid eyes look up at you as the defeated goo starts to fulfill your command, head bobbing up and down the length of your shaft, dragging it through the tight, squirming vice of her slimy throat, just like a well-lubed onahole. Your fingers slip through her solid mass of hair, penetrating the girl’s viscous head to get a grip on her; she gives a startled little yelp, but doesn’t seem to mind beyond that as you force her head down your [pc.cock] until her puffy lips are pressed against the base of your dick");
	if(pc.balls > 0) 
	{
		output(", her long tongue rolling out to slurp hungrily at the meaty swell of your ");
		if(pc.balls == 1) output("[pc.ball]");
		else output("[pc.balls]");
		output(".");
	}

	output("\n\nNot bad. But you could get a blowjob anywhere; it’s time to put this goo’s unique characteristics to use. You have the goo get you nice and hard, letting her spit-shine your [pc.cock] until it glistens with every bob of her head before moving on to the main course. You give her a little push, just enough to pop her vacuum-like mouth off your slick schlong. Giggling, the goo-girl slips down onto her back and spreads her legs, revealing the drooling delta of her sex, ripe for penetration, begging you to fuck her with the cute, needy look in her eyes. Not quite what you had in mind, but you play along for the moment, slipping between the goo’s legs, hefting them over your shoulders to give you unimpeded access to her crotch, her bubble butt lifting an inch off the ground to accommodate you.");

	output("\n\nRather than sliding right into that inviting womanhood, though, your thrusting hips bring your [pc.cock] to flop onto the girl’s belly, throbbing hungrily atop her slick, cool flesh. The goo looks up at you with questioning eyes, casting glances down at the dick so close to her sex. Indeed, her pulsing, sex-engorged delta is drooling with wanton anticipation, all but begging for a stiff, thick cock to spear it. One you aren’t supplying. You grin down at her, hands moving up to grope at the big, bouncy breasts on her chest, and whisper, <i>“You’ll have to work for it, slut.”</i>");
	output("\n\nThe goo stares at you, uncomprehending for a long moment before her lips turn up into a wide, hungry grin, and her hand slips down to your [pc.cock]. You only just stifle a gasp as her cool, gooey hand wraps around your length, fingers almost melting at the burning heat coursing through your loins as she starts to jerk you off. Her wrist moves with inhuman speed, pumping your prick like the machine she is as her other hand slips into her own sex, fingers dipping into the sweet slit between her legs.");
	output("\n\nAnd from that slit, she draws forth a cock of her own.");
	output("\n\nThe googirl shudders from head to toe as her big clitty transforms into a thick, hard imitation of your own [pc.cock], flopping beside its twin on her belly. Her wrist shifts ever so slightly to keep jacking, masturbating her cock and yours at once. <i>“You like it?”</i> she teases, laughing hard enough to get her tits bouncing again. You grin and shift ever so slightly, bringing your [pc.cock] to rest atop its gooey brother; to your surprise, rather than wrapping her hands around the twin shafts, the goo gives her hips a little shake, and you soon find your prick sinking into a tight squirming, wet embrace of a million writhing microbots. The sudden rush of pleasure through your sensitive skin nearly sends you into an instant orgasm - only with every fiber of your willpower are you able to hold back as your [pc.cock] is utterly encased in the giggling googirl.");
	output("\n\n<i>“You </i>definitely<i> like it!”</i> she giggles, reaching down and grabbing her cock-encompassing prick with both hands - which has the added effect of squeezing her massive tits together oh-so-enticingly.");

	output("\n\nYou struggle to nod as her long, surprisingly strong fingers take hold of your manhood through the thin membrane of her own, giving you both an experimental tug that sends shivers of ecstasy through both your bodies. Biting her lip, the goo starts to move her hand a bit more quickly, sliding her fingers easily along the slippery length of your paired pricks. The feeling of your more sensitive parts being encased in the gently shifting, flowing bond of the goo’s cock is heavenly. You barely have the willpower to stay upright, looming over the giggling goo only long enough to target in on one of her big, dark teats before diving in, lips wrapping around its stiff point as you curl up against her. As you move, her legs shift around your shoulders, wrapping themselves around your [pc.hips] and urging you onward, driving your [pc.cock] further into hers.");

	output("\n\nNow it’s the goo whose fingers brush ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("across your head");
	output(", leaving a thin, slimy trail as she strokes you comfortingly, gently pushing your face into the soft embrace of her breast. You answer with a flick of your tongue, teasing the prominent point at its center to the beat of her wrist’s quickening jerks on your [pc.cock]. It’s getting harder and harder to hold back your now-inevitable orgasm, but as you orally assault the goo’s tits, you can hear her breath quickening, chest heaving as the pleasure starts to get to the cybernetic girl as well. Just a little longer....");
	output("\n\nYou moan with pleasure into the breast at your mouth as the goo-girl switches to slower, firmer strokes, milking your cock. <i>“Go ahead, blow your load all inside me,”</i> she coos, planting a kiss on the top of your head. <i>“Don’t hold anything back!”</i>");

	output("\n\nTry as you might, with an invitation like that your body’s natural instincts take over. Arching your back with head thrown back, you let out a primal grunt of pleasure as a thick wad of cum shoots through your shaft towards sweet release. The goo gasps as your nut busts in her silver-sheened cock, and you both watch in rapture as her gooey flesh turns a brighter shade of gray as your [pc.cumColor] spunk shoots into it, filling the tight milker of her faux-phallus. Her sheathe goes wild as it’s filled with [pc.cum], the sea of microbots surrounding your cock moving madly across your sensitive skin, lapping up every drop of seed they can find, which only serves to coerce more and more from your spasming schlong. Both her hands sweep down to grab your cock, pumping hard and fast, letting her insides suck and squeeze to draw your orgasm out, leaving you a moaning, panting, gasping lump of pleasure atop her, barely able to move by the time you think your [pc.cock] has finally given its last hurrah. Not that you’d want to; the micromachines that make up the sheath around your member are still wiggling around, eagerly massaging your twitching prick even in the afterglow, sending shockwaves of sensation up your spine.");
	output("\n\nWrapped in the goo’s tender embrace, you all but lose track of time, too enthralled with the wondrous pleasure her willing body’s able to provide. You’re aware of another orgasm pending, but do nothing but lie atop her and let it wash over you, [pc.cock] erupting inside its gooey prison once again... and again... each time leaving you more and more addled by the sexual pleasure. The ceaseless sensation threatens to overwhelm you, orgasm after orgasm eroding at your already fleeting desire to leave.");
	output("\n\nThankfully, even your reservoirs of cum are not infinite. With a lurch and a moan, you shudder through another orgasm, shooting a slim load into the now cum-swollen sack of her schlong, itself bulbous and heavy with the sheer load of your many orgasms. Your cock is now surrounded by a shifting, roiling sea of spunk and goo, constantly massaged and caressed by the sticky, smooth fluids. But with no more to give her, the goo-girl tsks her tongue and props herself up on her elbows, causing your head to finally roll from her bust, rousing you from your sexual reverie.");
	output("\n\n<i>“Aww, no more? Well, thanks for all the cum! It was a blast!”</i> She giggles, gently rolling you off her. Your [pc.cock] slips out of its gooey twin with an audible POP, trickles of goo and seed smearing on your thighs and the red dirt as your member’s set free. Giving a contented sigh, the gray goo slithers up to her feet to stroke your head with surprising affection before departing, leaving you a helpless, sexually exhausted heap on the ground.");
	output("\n\nYou’re gonna be sore in the morning.\n\n");
	pc.orgasm();
	pc.energy(-5);
	processTime(20+rand(5));
	CombatManager.genericVictory();
}

//Divide and Conquer (Goo Splits in half, double-teams)
// PC needs a ladyhole
public function divideAndConquerGinasWithGoos():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("DEFEATED:\nGRAY GOO");
	output("Looking over the defeated pile of goo before you, you can’t help but feel a twinge of lust for its malleable, ever-changing body. You give a little shudder as [pc.eachVagina] starts to soak your ");
	if(pc.isCrotchGarbed()) output("[pc.lowerGarment]");
	else output("thighs");
	output(", mind flooding with images of gooey cocks spearing your holes and flooding you with cyber-seed. Seeing your hesitance to finish her off, the gray goo re-forms into her busty, feminine form, looking almost cartoonishly helpless and forlorn in her defeat. <i>“You wouldn’t hurt a defenseless little cyber-girl like me, would you?”</i> she pleads, showing you a pair of big, gray puppy-dog eyes. <i>“I was just gonna make you feel good - honest!”</i>");

	output("\n\nYou let a devilish grin play across your features as you drop your [pc.gear]: <i>“Well, why don’t you prove it then, robo-slut?”</i> you tease, baring your [pc.vagina] to the silvery goo.");
	output("\n\nShe beams at your bare pussy, barely containing a squeal of excitement as you approach. You lean down toward the goo-girl’s groin, fingers teasing along the pliant, slippery “skin” surrounding her drooling sex. Your thumb flicks across the prominent gray bud of her clit, eliciting a pre-programmed gasp from the synthetic girl, her face flushing darker as you move to straddle her big hips. While you’re getting into position, the goo giggles to herself and reaches down, grabbing your hand and giving it just enough of a <i>push</i> to force it through her skin, into the gooey sea of microbots within her. You give a little gasp of surprise, not expecting the cold shock of the wet, gel-like interior of her body - or the sudden <i>hardness</i> filling your hand. When you pull back, the girthy, pulsating thing comes with you, revealing the sheer shaft of a thick, rigid humanoid cock, bubbling a steady flow of gooey machine seed across your fingers, drenching you in her thick fluids.");
	output("\n\n<i>“All yours!”</i> she says, flashing you a bright smile as she leans back, propping herself up on her elbows and spreading her legs, surrendering herself utterly to you, however you want her. That’s more like it! You slip down into her lap, your simmering slit brushing against the slick shaft of her hefty prick as you lower yourself down, hands wandering up her willing body to cup the massive orbs of her over-sized tits, fingers all but sinking into them as you grope and squeeze, pinching and twisting the big nipples at their tips until the goo’s moaning and biting her lip, trying not to cry out with pleasure. As you tease her tits, you start to move your [pc.hips], rocking them along the girthy length of goo-cock wedged between the lips of your [pc.vagina], threatening to slip into you at any moment.");
	output("\n\nWorking the cyber-goo’s cock and breasts soon has her quivering with pleasure, whimpering and moaning with every movement of your hips and hands, your body steadily covered in more and more of her sticky gray goo as her cock continually drools across your [pc.legOrLegs] and slit. Finally, you slide forward, as far as you can, until the crown of her cock is nestled into the gash of your sex, its thick cum-vein able to pour the first trickles of synthetic seed into your waiting [pc.vagina]. Digging your fingers into the goo-girl’s tits, you let the head of her prick slip in, and slowly ride it down. Her dick’s incredible: thick and slimy and throbbing with every breath, stretching and filling your cunt - filling it to the breaking point before you’re even half-way down her length.");
	pc.cuntChange(0,40,true,true,false);

	output("\n\nBy the time you bottom out, you can <i>see</i> your stomach bulging from the sheer amount of goo stretching your pussy, filling your womb with cool, slimy goo. You shudder as her full, rounded balls press into your [pc.butt], confirming that you’ve taken all she has to give. Panting, you plant your hands on her tits for support, suppressing a slight smile as her hands wrap over yours, holding you to herself as you slowly start to move in her lap.");
	output("\n\nThen another pair of hands grabs your ass.");
	output("\n\nYour breath catches in your throat as your booty’s grabbed and groped from behind. You try to turn around, but the cock inside you seems to hold you still, only letting you catch a glimpse of your attacker - the goo-girl!");
	output("\n\n<i>“Heh, hold still, silly!”</i> the second goo-girl teases as the first’s cock wiggles tentacle-like inside your [pc.vagina]. As it does so, a second slippery rod flops down between your spread cheeks, its gooey tip pressing dangerously against the dark ring of your [pc.asshole]. You wince as the second goo presses in, just on the edge of penetration; her identical twin gives her a sultry wink, jiggling her tits enticingly. The second goo gets the hint, and a firm hand pushes you down to rest your head in the soft, cool pillow that is the girl’s cleavage, cheek nestling against one of her quaking boobs as both girls’ hands grab your ass, spreading your cheeks wide.");
	output("\n\nFrom your new vantage point, you can see that the girls are connected at the feet -- their legs trailing off at the calf into a pool of goo between them, bridging the gap between googirls. They both giggle as you notice, saying in unison, <i>“Double the pleasure, double the fun!”</i>");

	output("\n\nWell, you can’t argue with that. You clutch at the original goo’s chest, holding her tight and relaxing your [pc.asshole] as best you can as her sister starts to push in. The feeling of her entering you is totally alien");
	//if not anal virgin:
	if(!pc.analVirgin) output(", unlike anything you’ve ever felt before");
	output("; she doesn’t stretch you out at all at first, more pouring into you through the ");
	if(pc.ass.loosenessRaw <= 2) output("ever so slight");
	else if(pc.ass.loosenessRaw <= 4) output("sizable");
	else output("massive");
	output(" gape left by your stretched cheeks, a trickle into your butt that has you shivering and shuddering as she enters you. But that blessed respite lasts only a moment, and soon the trickle turns into a thickening rod with a firmly-established beachhead in your colon, stretching out from the inside, filling you utterly with a thick, slippery shaft of goo-cock.");
	pc.buttChange(40,true,true,false);

	output("\n\nSpeared on two sides by googirl dicks, your body is consumed by shockwaves of pleasure that leave you writhing in the first sister’s tender embrace, her arms holding you tight into her breasts as her hips start to thrust her cock into you. The slow, almost tender motion is mirrored by the other goo, whose hands hold your [pc.hips] rock-steady as she starts to withdraw her prick from you, only to let its self-lubricated length glide back in through your defenseless sphincter. Though they start in sync with each other, the giddy pair of goo-girls start to develop their own rhythms for fucking you, one thrusting deep in as the other pulls out, working together to make sure you’re never without a thick, throbbing cock to stretch and fill you. The sensation is overwhelming, and you’re soon a moaning, quivering pile of lust and fuck atop the first sister, your hips bucking to meet theirs, mouth coming to enclose one of her big, dark teats as her fingers guide you to it. Your muffled cries are absorbed into the jiggling, gooey boob, though to your satisfaction, your tongue and squeezing holes are able to draw a few quiet moans and gasps from the goo-sisters.");

	output("\n\nThe goo behind you hefts your [pc.hips] up, pushing you further into her sister’s bust as she starts to speed up, fucking your [pc.asshole] faster and harder, making you squirm and moan all the louder. Giggling, the other goo picks you off her teat and wraps you into a surprisingly affectionate kiss, her tongue punctuating every thrust of her own cock into your drooling sex. With what little strength you can muster between the mind-melting pleasure of the double-penetration, you wrap your arms around the first sister, kissing back, holding her tight as the first tense hints of what promises to be a mind-blowing orgasm approach.");

	output("\n\nBetween the two dicks thrusting deep into your [pc.vagina] and [pc.asshole], you can’t hold out for long. You let out a wild, animalistic cry of pleasure into the goo’s mouth as her and her sister pound you right over the edge. Your cunt and ass contract mercilessly around the twin cocks inside them, your whole body writhing madly as pleasure overtakes you. All you can think of is more - you need more! You buck your hips against the cocks, bouncing in the goo’s lap, trying to get every last inch of cyber-cock inside you, pinching and twisting your nipples, and arching your back as sharp as you can.");
	output("\n\nYour orgasm seems to last a blissful eternity, waves of pleasure crashing through your body until you’re leaning exhausted in the googirl’s arms, panting and moaning as her sister continues to fuck your butt. The first goo coos happily, cradling you in her arms as she sets your head back to rest on the soft, comfy cushion of her tits. It doesn’t look like they’re done yet....");
	output("\n\nWhat must be an hour passes like that. The first goo sister holds you tenderly as her sister fucks your ass again until you cum once more, then switches to your pussy, joining her sister’s cock to stretch you until you’re screaming into your bed of boob-flesh. A third and fourth orgasm are wrung out of you, your pussy-fluids drooling into the waiting pool of goo");
	if(pc.legCount > 1) output(" between");
	else output(" around");
	output(" your [pc.legOrLegs], swallowed eagerly by the cyber-babes between fuckings.");
	output("\n\nWhen you cum a fifth time, they finally relent, your chest heaving and mind nearly blank with overwhelming pleasure. Giggling to themselves, the goo sisters rest you back onto the ground, finally withdrawing their cocks from you and unleashing a torrent of pent-up goo-spunk and fem-cum in the process, which they quickly lap up.");
	output("\n\n<i>“" + pc.mf("He","She") + "’s so much fun!”</i> one of the giddy girls giggles, leaning down to plant a sweet parting kiss on your brow. You merely moan in response, too weak to speak.");
	output("\n\n<i>“Too fun!”</i> her sister concurs, mirroring the first goo’s gesture of affection. <i>“And she had </i>so much<i> fluid for us!”</i>");

	output("\n\n<i>“I know! Offworlders are the best,”</i> the first titters. <i>“C’mon, let’s get going.”</i>");
	output("\n\n<i>“Wait a sec,”</i> the second girl says haltingly, looking between you and her sister. <i>“Why are we talking?”</i>");
	output("\n\n<i>“Uh... cuz?”</i> her sister answers, brow furrowing in an exaggerated caricature of thought. <i>“Oh, wait! Look!”</i>");

	output("\n\nShe points to the pool of goo that had once connected the pair of girls, now cut in half between your prone form. You roll over, looking to the puddle of mixed fluids around your well-fucked holes as the googirls loom over, inspecting it.");
	output("\n\n<i>“Huh,”</i> the second sister says, <i>“Guess we must have gotten separated!”</i>");

	output("\n\n<i>“Aw, poo.”</i>");
	output("\n\n<i>“Oh, cheer up, sis!”</i> the goo says with a smile, <i>“Now we can harvest TWICE the fluid! Come on, I’ll go this way, and you go that way, and we’ll fuck so many little rasks they won’t know what hit ‘em!”</i>");
	output("\n\n<i>“Okay!”</i> the first sister beams, giggling as she starts to slither away in the direction her sister pointed. <i>“Bye, sis! See you later!”</i>");
	output("\n\n<i>“Bye!”</i> the other goo says, waving as she, too, wanders away, leaving you soaked in a pool of your own cum and discarded goo-bots.");
	output("\n\nYou’re gonna be sore after that.\n\n");
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.loadInCunt(enemy, 0);
	pc.loadInCunt(enemy, 0);
	pc.loadInCunt(enemy, rand(pc.vaginas.length));
	pc.loadInCunt(enemy, rand(pc.vaginas.length));
	pc.loadInCunt(enemy, rand(pc.vaginas.length));
	pc.loadInCunt(enemy, rand(pc.vaginas.length));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.applyPussyDrenched();
	pc.energy(-5);
	CombatManager.genericVictory();
}

//PC Defeat
//PC gets Body-Suited and Fucked in Every Hole
// Omni-gender. In soviet Tarkus, goo wear you.
public function pcDefeatByGooBitch():void
{
	author("Savin");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("LOST VS.\nGRAY GOO");
	output("Your skin flushes, blood rushing to your genitals as the gray googirl’s sensual display continues. Jiggling her huge, bouncy tits and wiggling her over-sized hips, she dances around you, rubbing up against any exposed bit of [pc.skin] she can find, pressing her chest to you, hands groping and squeezing your [pc.crotch]. You stifle a gasp as her gooey body flows ");
	if(!pc.isNude()) output("through your [pc.gear], slipping inside, only to start stripping you bare");
	else output("across your bare skin");
	output(", a pair of dainty fingers taking your " + pc.meleeWeapon.longName + " from you as another hand strips off your remaining gear. She leans down, setting aside your kit and giving you a final, enticing view of her big, jiggling butt. Giggling as you lustily moan, overcome by your desirous, traitorous body’s sexual urges, the goo teases, <i>“Go ahead, stick your face riiiiight on in!”</i>");
	output("\n\nYou fall to your [pc.knees], burying your face in the soft sea of gray microbots, shuddering as you’re enveloped between two cool, squishy ass-cheeks. Grabbing her wide hips, you motorboat her ass, digging into that crack to get at the tasty little cunny hidden below. When you find it, your nose is already all but stuffed into the drooling folds of her slit, and your tongue is easily able to slip out and find the bud of the goo-girls clit; she shudders delightfully around you, bubble butt jiggling against your cheeks. Liquid goo pours freely across your [pc.tongue] as you lick through the slit of her pussy, and pretty soon your whole face is plastered with a thick, silver sheen.");
	output("\n\nStill, you press on, your lust sending shivers through your body as the eager googirl easily assents to your oral advance, clearly just as happy to fuck as to fight.");
	//If PC has a cock:
	if(pc.hasCock()) 
	{
		output(" The more you lick, the harder [pc.eachCock] gets, diamond hard and ready to fuck thanks to the heavenly feeling of the googirl’s pussy on your lips. A few more moments of this and you don’t think you’ll be able to stop yourself from ramming your rod");
		if(pc.cockTotal() > 1) output("s");
		output(" home in that inviting little cunt!");
	}
	else if(pc.hasVagina()) output(" And she’s not the only one who’s wet! You let a hand slip back to [pc.oneVagina], fingers digging into the hot box");
	if(pc.legCount > 1) output(" between your [pc.legOrLegs]");
	output(", desperate for a little relief. Sensing your rising tension, the goo giggles, <i>“Don’t worry, babe, I’ve got something nice and hard for that slutty little hole of yours!”</i>");
	
	output("\n\nAs you’re busy eating out the googirl and enjoying the all-encompassing softness of her ass around your face, you only barely notice her butt seeming to grow, expanding back around your head slowly but surely, getting a little bigger with every flick of your tongue. By the time you consciously see that your head’s been all but enveloped in goo-butt, it’s too late! You start to pull back, only to find yourself trapped, wedged beneath a sea of goo that only seems to be growing, streams of gray goop rolling down your body, forming like sleeves to capture your arms and [pc.chest]. Oh shit....");
	output("\n\n<i>“Hehe... Don’t worry, cutey!”</i> the goo’s voice whispers, all around you now, <i>“Just relax, and this’ll be as fun for you as it is for me!”</i>");

	output("\n\nYou try to respond, but your voice is utterly muffled by a wall of gray goop as the googirl reforms around you, slowly encasing your body. You try to stand and escape, but it’s much too late for that, and blind as you are, all you can do is stumble aimlessly before falling again, your [pc.legOrLegs] suddenly bound in tight gray goo that utterly retards your ability to move. Struggle as you might, you’re now nothing more than a prisoner in your own body, unable to move a muscle in the tight constraints of your captor.");
	output("\n\n<i>“Oops! Hold on... aaaaaannnnd,”</i> the goo hums happily, more to herself than to you, as the gray glaze on your eyes retracts away, letting you see the junkyard wastes once again and your arms and [pc.legOrLegs] before you, tightly encased in silver goo. <i>“There we go!”</i> she cheers - no, <i>you</i> cheer, jaw and lips forced to move by the googirl as if they were her own.");
	output("\n\n<i>“Oh, you’re a nice fit! Let’s see, uuuup we go!”</i> she says as you stand, limbs haltingly working to right you. You stagger to your [pc.feet], swaying slightly as your captor accommodates herself to your body. A little more sure of herself, the googirl brings her/your arms in front of your eyes, inspecting her new hands... before using them to grope your [pc.crotch], sending tingles of pleasure through your body as her fingers stroke your goo-coated ");
	if(pc.hasCock()) output("[pc.cocks]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("groin, emitting a little tsk of displeasure at finding no gentialia there");
	output(".");

	//If PC doesn't have a cock:
	if(!pc.hasCock())
	{
		output("\n\n<i>“Hmm, what do you say we make this fun?”</i> the goo coos, not waiting for your reply as her fingers swirl around your groin, teasing the sensitive skin there. Slowly, her fingers pull at the gooey coating on your crotch, and you shudder as it stretches out to form a long, thick phallus: a massive equine member that would give a pony a run for his money! Giggling, the goo gives it a few experimental strokes, and you can’t help but gasp as you... you <i>feel</i> it!");
		output("\n\n<i>“Niiiice,”</i> the goo giggles, jacking herself off -- and you with her. Your mind recoils as pleasure sweeps through you, an alien sensation beyond your cockless body’s ability to understand.");
	}
	//If PC has a cock less than 18 inches long:
	else if(pc.biggestCockLength() < 18 && pc.hasCock())
	{
		output("\n\n<i>“Hmm, what do we have here?”</i> the goo hums, grabbing your prick and giving it a few experimental strokes.");
		output("\n\n<i>“Tsk, not quite what I had in mind. But hey, we can fix that! WITH SCIENCE!”</i> she declares, grabbing your silver-sheened dick and pulling. You shudder as the goo around your member stretches out to form a long, thick phallus: a massive equine member that would give a pony a run for his money! Giggling, the goo gives it a few experimental strokes, and you can’t help but gasp as the sensation seems to carry through right to your real cock.");
		output("\n\n<i>“Niiiice,”</i> the goo giggles, jacking herself off - and you with her. Your mind recoils as pleasure sweeps through you, an alien sensation beyond your body’s ability to understand.");
	}
	//If PC has a great big dick:
	else {
		output("\n\n<i>“Oooh, this is SO PERFECT!”</i> the goo declares, grabbing your massive wang with both hands, jacking it off vigorously. <i>“And it’s all mine! Mineminemine!”</i>");
		output("\n\nYou shudder as the goo surrounding your dong shifts and writhes, sending shockwaves of pleasure through your body, nearly enough to knock your off your [pc.feet].");
		if(pc.cocks[pc.biggestCockIndex()].cType != GLOBAL.TYPE_EQUINE) output(" You gasp and groan as the glistening waves of liquid metal shape your member into the form of an immense, equine-like phallus.");
	}
	// Combine all cock variants:
	output("\n\nHappily jerking on her big, new cock, the goo-girl takes a few steps forward, twisting her head as if looking for something. <i>“Hmm. Where’s a cute lil’ raskvel when you need one, huh? Ooh! I think I hear one over there!”</i>");
	output("\n\nA few more paces brings you around a nearby pile of junk and right into the waiting wrench of a diminutive brown raskvel girl. Seeing what’s coming for her, though, she gives a terrified yelp and drops her wrench, trying to escape. You and your gooey captor are much too fast for the little thing, though, and in a flash she’s been barreled to the ground, pinned beneath your [pc.legOrLegs] as your massive prick slaps down onto her belly, half as large as she is!");
	output("\n\n<i>“G-get away from me!”</i> the scaley wench cries out, squirming underneath the goo’s grasp. <i>“You can’t even give me eggs!”</i>");
	output("\n\n<i>“Aww, come on,”</i> the goo teases, leaning down to lick your shared tongue across the rask’s cheek, fingers slowly peeling away her clothing. <i>“A little fun never hurt anybody, did it? Just relax, and I’ll make you feel better than some silly breeding!”</i>");
	output("\n\nThe poor little raskvel struggles in vain for a moment more before realizing it’s hopeless. She sighs and spreads her legs, revealing the already-damp gash between them, its paired pleasure buzzers red with excitement. <i>“J-just make it quick,”</i> she pouts, though even you can see her big eyes are glued to the blunted, gooey head of your schlong. Licking her lips, the googirl shifts her hips back, dragging the goo-cock down the raskvel’s tummy until the crown brushes one of her clits, sending a shudder of pleasure through the submissive slut.");
	output("\n\nA trickle of lube slips from her lower lips, just a few droplets worth, but when the googirl sees it she seems to go wild with need. The rask barely has time to brace herself as the massive cock is rammed home into her waiting hole, so thick and long that you can immediately see her stomach bulging, her body struggling to make room for the massive member being stuffed into it. She lets out a startled scream of pleasure, back arching off the ground as she’s suddenly and ferociously fucked. The goo doesn’t give her a second to recover, instead slapping her hips in again, starting to pound the scaly little slut with everything she has. All three of you are soon moaning with the overwhelming pleasure, chests heaving as the predatory googirl uses you to fuck her prey, pounding the raskvel’s pussy like a jackhammer. You’ve never moved so fast in all your life, hips a flurry of motion as the googirl slams her cock home again and again. You cum within the first minutes, ");
	if(pc.hasCock()) output("blowing a thick load into the gooey sheathe around your cock, your load captured for the googirl’s use before the raskvel’s eggs can catch it");
	else output("your faux-cock somehow stimulating your pleasure senses through the gooey sheathe around your body until you orgasm, body convulsing with alien sensation");
	output(". But the ride doesn’t stop there - oh no! The googirl’s not nearly satisfied by one orgasm from you or the raskvel girl.");

	output("\n\nBefore she can get any further with your poor body, however, another voice from behind you cries out, <i>“Woah! What’s going on here!?”</i>");
	output("\n\nLooking over her shoulder, you and the googirl see a male raskvel, dressed in nothing but a loincloth covering a very clearly tented cock, staring at your up-raised ass and the schlong currently spearing the rask girl below you.");
	output("\n\n<i>“Oh, hey, cutie!”</i> the googirl says, your mouth mimicking her words. <i>“Don’t just stand there all shy - come on and get some sweet relief. I think we both know you want it!”</i>");
	output("\n\nWait, what? You gulp as the googirl pats her ass, and a sudden rush of goo floods in your backdoor, such a tiny trickle at first that your sphincter can’t stop it until it’s much too late: you give a gasp as the goo forces your [pc.asshole] to open up invitingly, exposing your pucker to the open air, pointed right at the rask-boy’s pre-drooling pecker as he giddily hops over toward the easy fuck.");

	output("\n\nYou shriek as he plunges right in, his reptilian-like cock spearing your [pc.asshole] to the hilt in one go. He grabs your [pc.butt] and goes to town, thrusting into the goo-slicked hole on offer without a second thought. You can’t even bite your lip, clench your jaw, do anything to keep yourself from screaming in pleasure as the raskvel male takes your [pc.asshole], your cock hammering the female below you in turn, dashing any hope of a refractory period in a new wave of sensual bliss. Giggling madly, the googirl grabs the rask-slut’s tit in one hand, squeezing and pinching the prominent little nipple atop it; the other hand reaches back to grab the male’s tight butt, a ring of goo easily slipping around his waist, binding him into the steadily growing orgy around your helpless body.");
	pc.buttChange(25,true,true,false);

	output("\n\nAnd grow the orgy does. Just as the male rask blows his load in your ass, filling you with his hot, creamy seed, another male seems to take his place, another cock slamming into the abused hole. You cry out, just in time for another cock to find your mouth an inviting target, plunging it.");
	//This should be changed to a male raskvel once they're done.
	var ppRaskvel:RaskvelMale = new RaskvelMale();
	pc.loadInAss(ppRaskvel);

	output("\n\n<i>“Oh, wow, there’s SO MANY!”</i> the googirl giggles into your ear, twisting your head just enough to let you see a growing crowd of rask boys clambering over the junk toward the sounds of rampant sex. <i>“Oooh, you’re gonna get me so much juice!”</i>");

	output("\n\nOh, God.");

	output("\n\nYou’re utterly helpless to do anything but moan and cry as a raskvel boy fucks your face with abandon, the goo-girl keeping you nice and wide for him until with a cute little grunt he blows his load, smearing seed all across your lips and face - which the googirl is quick to absorb as another takes his place, and another, now two cocks sharing your throat. Your voice is muffled into nothing but animalistic grunts as you’re fucked on every front, and each load of alien spunk seems to only beckon another raskvel to you. Your ass is left agape and drooling white only for an instant before another male takes the last’s place, and your mouth is soon home to <i>three</i> pricks, all their owners fighting for traction to fuck your face. You cum, yourself, the pleasure so overwhelming that you nearly pass out. By the time an ass-fucking wrings a third orgasm out of you, you slip out of consciousness, left kneeling in the dirt and servicing five or more rask, even your hands starting to search out pricks to jerk.");

	output("\n\n<b>You awaken two hours later</b>, sore and exhausted and so full of what you can only imagine is cum that your belly is quite literally bloated, stretching by the amount of seed that even the googirl couldn’t steal from you. Around you is a pile of raskvel boys and girls, some still fucking each other, others exhausted and snoring. There must be nearly fifty here, and you have no doubt your goo girl bodysuit let every one of them bust a nut in you. At least she’s gone, having gotten all she could from your body.");
	output("\n\nYou stagger off to find your gear, leaving the rask to work out what lust they have left.\n\n");
	processTime(120+rand(10));
	pc.exhibitionism(1);
	//This should be changed to a male raskvel once they're done.
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.loadInAss(ppRaskvel);
	pc.loadInMouth(ppRaskvel);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.shower();
	pc.energy(-5);
	CombatManager.genericLoss();
}

//PC Defeated
//Body-suited, one-on-one, cock and cunt variations. Random chance between applicable scenes on defeat.
public function bodySuitedKirbuDefeat():void
{
	author("Kirbu");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("LOST VS.\nGRAY GOO");
	output("Your best efforts are slain by wanton lust, weighing you down to a single knee before a rather excited victor. Even through your labored breathing, you can tell plain as day that the technological gelatin can’t even begin to decide what to do with you. Judging by her boisterous attitude, you suspect it’s been quite some time since this gray gal’s last meal. A rather impatient gaze on your part eventually catches her attention, knocking her out of her babbling trance.");
	output("\n\n<i>“Oh, you’re rather anxious, aren’t you?”</i> the goo girl responds, rambunctiousness practically dripping from her voice. She steps your way, trying to hide her excitement with a sexy gait. Doubt melts away at the sight of her jiggling, exaggerated hips, each alternating in size in time with her overstated steps. <i>“There’s nothing but–”</i>");
	output("\n\nThe majesty dies the second the slimy oaf trips over her own amorphous feet. The sudden shock of the fall causes her to lose her form, leaving naught but a gray blob heading your way. An involuntary gasp is all you can manage before your world is shrouded in gooey, undulating darkness. She hit you hard enough to knock you flat onto your back. With the debilitating sexual high losing to a resurgence of adrenaline, you work to try and get out of the gray curtain.");
	output("\n\nAn incredibly faint <i>“Oh, fuck it.”</i> comes from somewhere. The utterance is your only warning before life surges back into the silver mass. She’s clinging to your body, completely immobilizing you; your struggle’s been decimated before it even had a chance to begin! ");
	if(pc.armor.shortName != "") output("Your " + pc.armor.longName + " proves worthless as the goo girl seeps in underneath it. The goop easily undoes your protection, popping it off piece by piece. ");
	output("The onslaught of flowing mischievousness adheres to your facet, leaving no tender spot unloved. Inconceivably small nano-bots explore your every pore wrinkle, hair, and whatever else you have on you.");

	output("\n\nThat gasp of air you took in earlier is starting to run dry, you realize. The gray goo notices your panic, and her mass shoves its way into your mouth. You involuntarily gag, but she stops just short of your throat, coating the interior of your mouth with her silvery slime. Her mass lightens to an imperceivable film across your eyes, granting you the opportunity to watch the rest of her body form to your own. It’s nearly overwhelming just how powerful the sensation is; focusing in on any particular part of it may as well be impossible. The gray goo finishes her lamination in just a few more brief moments, leaving a rather remarkable silver facsimile of your nude form, albeit with a little more jiggle and shine.");
	output("\n\n<i>“Let’s say that I meant to do this.”</i> Your mouth moves as if of its own accord, and the voice of the gray goo is all that exits it. It’s clear the hijacker has assumed full control over you, save for the darting eyes trying their damnedest to take in everything going on. You can feel your body lurching around awkwardly as if the goo girl was settling into it a little more.");
	output("\n\n<i>“Can’t say I’ve ever thought to try and network with a creature before,”</i> she jokes, forcing a smile out of you. While your hands heed the call of their new owner to explore your hills and valleys, the true impact of the gray goo’s seemingly flippant utterance sinks in. Being a collection of infinitesimal robots of a sort, there’s a high likelihood that they’ve communicated with your internal workings. It would certainly explain your new role as puppet. It also sheds some light on another development: that you can feel the open air around you despite being sealed in slime. Seems there’s a little more handshaking then you would have first assumed.");
	output("\n\nThe gray goo girl snaps out of her little self-absorbed trance, forcing your hands away from your body. <i>“We don’t want to rush the show just yet. Not until I get a better view of the action...”</i> Her voice trails off as she has your tongue absentmindedly exploring the inside of your cheeks. She’s scanning the horizon for something. Your head focuses in on some large piece of junk off in the distance and the gooey lass propels you off towards it. She’s at least a little more mindful – if not rather awkward – with how she moves using your [pc.legOrLegs]; hopefully her first impression wasn’t a sign of more to come.");
	output("\n\nYou’re driven to some dirty slab of scrap, unable to discern just what the monolith must have once been. The gray goo works up a ball of saliva in your mouth and spits on the drab, smooth surface. <i>“Just a little elbow grease, and we’ll have ourselves a nice view of the action,”</i> she says while smearing the surface with your gooey hand. A minute or two later, you have yourself a nice, large mirror and an exceedingly enamored goo girl. <i>“Now I can really take stock of this warehouse!”</i>");
	output("\n\nAfter a few moments of posing and turning, your enslaved hands begin their journey by grasping onto your [pc.fullChest].");
	if(pc.biggestTitSize() < 1) output(" <i>“Can’t say I’m used to such a flat tract of expanse,”</i> she kids.");
	else if(pc.biggestTitSize() <= 3) output("<i>“These mosquito bites could use some work,”</i> she chides. Regardless, it’s plain to see how much she enjoys your little mounds by her fondling.");
	else output("The gray goo is speechless, enraptured by your chest-bound mountains. Her joyous groping goes on for some time, further torturing you.");
	output(" Your mitts eventually move on to the rest of your body, avoiding the main attractions to explore the remainder of your curves and features. Each stroke along your gooey skin sends shivers down your spine.");
	if(pc.isPregnant()) output(" Your grasp dances around your full belly next. <i>“Looks like we aren’t alone, huh?”</i> the goo girl remarks with a warm smile across your face.");
	//if rare features i.e. dick nipples, cunt tail, etc.
	if(pc.hasFuckableNipples() || pc.hasCuntTail() || pc.hasCockTail() || pc.hasDickNipples()) output(" <i>“You’ve even got some bits and bobs I’ve not seen much of,”</i> she admits with clear fascination.");

	clearMenu();
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) addButton(0,"Next",cockVariantForGrayGooKirbutashis);
	else addButton(0,"Next",gooGooEnvelopsCunts);
}

//Cock Variant
public function cockVariantForGrayGooKirbutashis():void
{
	clearOutput();
	author("Kirbu");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("LOST VS.\nGRAY GOO");
	output("<i>“You know... I’ve always had an appreciation for the arts,”</i> the gray goo suddenly blurts from your mouth. She ceases the caress and puts your hands on your hips. It isn’t entirely clear what she’s alluding to until you feel your [pc.cocks]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(" jiggle about of their own accord. Seems she’s ready for your entree. The slick sheath surrounding your manhood feels electric, anxious for some action and impatiently arousing your every nerve.");
	output("\n\n<i>“There’s just something so fulfilling with the act of creation,”</i> she continues while shuffling your body over towards a smooth, waist-high block of some unknown origin close by. She gesticulates with your arms on each syllable, and the act would appear to be extending down to your swinging length below. There’s no doubt your lust-riddled form is being pushed to some extreme despite your outward appearance; the goo girl is slightly constricting just as much as she’s fondling. The gray gal refuses to let things move at any pace but her own, too intoxicated by playing with a physical body full of genuine, unchained pleasure.");
	output("\n\nHer slow stride finally ends at the bronze cube jutting out of the ground. Your slimed prick lifts up proudly into the air, still forced in some flaccid state just shy of unyielding rigidity.");
	//if > 24”</i> cock
	if(pc.biggestCockLength() >= 24) output(" The goo girl does grunt a little in response to the otherwise hands-free action. This hefty prick seems to require a bit of effort.");
	output(" A slight flow of movement takes shape throughout your silver cocoon – not helping your sexual frustration in the least, of course – that seems to be gathering right at your [pc.cockHeadBiggest]. Some manner of giant blob is collecting right at the tip of your dick, essentially teasing you with the release you’re being denied.");

	output("\n\n<i>“There’s no satisfaction to be had if you don’t put a little work into this,”</i> the slippery rogue continues, a dumb, self-serving grin forced across your face, <i>“The journey really is just as important as the end product. Wouldn’t you agree?”</i> The collection of goo teasing you from the end of your sex has grown quite large by this point. It finally splits off – the air rushing in between it and your faux skin is maddeningly arousing – and rests on the smooth surface inches below. Your [pc.cockBiggest] vibrates a little as it sheds the weight.");

	output("\n\n<i>“This journey is one of pure craftsmanship!”</i> she exclaims. The gray goo girl resumes her penile puppet show by thrusting your length down atop the silver blob, forcing a constrained gasp out of you. Your dick begins shaping the glob like a mound of clay, bending and rubbing against its surface. ");
	if(pc.balls > 0) {
		output("She even gets your [pc.balls] in on the act, pressing ");
		if(pc.balls == 1) output("it");
		else output("them");
	}
	output(" up against the front of the mass and massaging it smooth and flat.");
	output(" It’s an unreal sensation to say the very least, and the bitch’s refusal to let your mast reach full sail is driving you out of your mind. Each bizarre little pat, knead and swing of your cock is an onslaught of pleasurable torment of your nerves. You haven’t even been able to process the goo girl’s little soliloquy as she goes about her business. It was probably just more vapid analogies between art and fucking or something.");

	output("\n\n<i>“...experimentation, right?”</i> The words forced out of your mouth start to pierce your mind once more. A celebratory slap of your dick atop the creation – it’s no less arousing as the rest of the act – seems to hail the end of this round of craftsmanship. It looks like the little dome of goo was shaped into a jiggling cylinder with a little hole in the center.");

	output("\n\nShe made an onahole out of herself.");
	output("\n\n<i>“And now for the final touch,”</i> the gray goo smirks with a snap of your fingers. There’s no sound produced by your gooey, slick fingers, but it doesn’t stop what comes next: your [pc.cockBiggest] bolts into full erection complete with a little silver splash. The teasing of your anatomy loosens a little; it’s relieving, but not entirely satisfying your pent-up frustrations.");

	output("\n\nSuddenly your hips bolt backwards. Your dick wobbles into place. The gray goo is aiming her shot. She closes one of your eyes. Your hands brace the goal. The teasing is unbearable. You have no patience for billiards. She finally thrusts your cock forward into the tight squeeze. There’s hardly a moment for the vice grip to sink in before she’s pulling back out. Something snapped inside the goo girl the second she inserted your dick, as any pretense for culture has eroded away into manic jackhammering.");
	pc.cockChange();

	output("\n\nYou lose yourself in the frantic fuck, bombarded by the dual sensations of your silver skin shifting against your dick and the broadcasted feeling of said skin rubbing against the firm, ribbed makeshift toy. The longer it goes on, the tighter the goo feels around your [pc.cockBiggest]. Something about this is sending the goo girl out into orbit, you figure. She must be enjoying a similar sensory overload of her own. Each thrust is stronger than the last. The customized toy fits you perfectly, covering your prick right down to the hilt at maximum pound.");
	output("\n\nThe yearn to climax has about knocked you out. Your overwrought senses fell off a cliff back when the goo girl turned your cock into a sculpting tool. But the silver computer made of slime really is the captain of this ship after all. And it just so happens that she’s now ready to turn hard to port. She rams your tool deep in the silver mound and the floodgates burst open. Your silver-coated body convulses over each orgasm. There’s no keeping count in either of the pleasure-pounded minds, just a seemingly unending series of releases. The silver toy turns a shade of [pc.cumColor] as it’s saturated by your relief.");
	output("\n\nYou aren’t sure who’s in control for a moment. The two of you merely bask in an afterglow, paralyzed with your [pc.cockBiggest] still lodged inside what once appeared to be a sculpted onahole.");
	output("\n\n<i>“Wow. What a meal,”</i> you’re finally forced to say. <i>“I... I didn’t expect this little experiment to give such a jolt.”</i>");
	output("\n\nThe [pc.cumColor]-colored blob sinks into your cock to rejoin its brethren. The rushing sensation is quite pleasurable.");
	output("\n\n<i>“Having a physical body... this is pretty great.”</i>");
	output("\n\nYou’re started to get worried.");

	output("\n\n<i>“If... If I keep you fed- We can just keep on doing stuff like this right? I’ll get to keep on...”</i>");
	output("\n\nSomething whirs to life within you. This line of thinking is going to get you fucked in an unending way if you don’t do something. You try and move... and it registers! Some manner of hidden force manifests in your adrenaline-fueled body, and you proceed to tear your slimy covering off! However, the goo girl doesn’t put a fight and merely sinks to your [pc.feet].");
	output("\n\n<i>“Okay! Okay! I’m not in the slave-taking business!”</i> the blob shouts. She meekly reforms beside you, barely even resembling her original appearance. It’s apparent just how much that little masturbatory session took out of her.");
	output("\n\n<i>“But you gotta admit you enjoyed it as much as I did.”</i>");
	output("\n\nA raising hand is the most you’ll give her, still a tad out of breath. You think she rolled her eyes in response, but there’s no telling. Despite her words to the contrary, you imagine your predicament would have been entirely different had she the strength to subdue you. With that chilling thought, you see yourself away and back to where you lost your gear.\n\n");
	
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.shower();
	pc.energy(-5);
	CombatManager.genericLoss();
}

//Cunt Variant
public function gooGooEnvelopsCunts():void
{
	clearOutput();
	author("Kirbu");
	userInterface.showBust("GRAY_GOO");
	userInterface.showName("LOST VS.\nGRAY GOO");
	output("<i>“You know... I’ve always had an appreciation for the theater,”</i> the gray goo suddenly blurts from your mouth. She wanders over and sits you down on a little outcropping of assorted junk just in front of her makeshift mirror.");
	output("\n\n<i>“I think I’ve got quite the knack for storytelling myself,”</i> she boasts, your arms wildly gesticulating for emphasis. The prima donna is spreading your [pc.legOrLegs]");
	if(pc.balls > 0) output(", trying");
	output(" to get a clear view of your gray-painted [pc.vaginaNounSimple].");
	if(pc.balls > 0) output(" <i>“Hey! Down in front!”</i> Her silvery shout causes your [pc.balls] to flop upward with a will of their own, stopping them from obscuring your [pc.vaginas].");
	if(pc.totalVaginas() == 1) output("It looks ");
	else output("They look ");
	output("to be quivering and dripping in anticipation to you. Whether or not it’s spurred on by your jiggling friend, you have no clue. What you do know is that there’s a electric anticipation teasing [pc.eachVagina] to no end, making your mind beg for some closure.");
	output("\n\nThe gray goo girl rests your arms to the side, getting nice and comfortable. <i>“I think you’ll like this one. It involves a musclebound knight coming home after countless days out... um... slaying dragons or something.”</i> Your canyon walls are rubbing together, making the painful stalling only more obvious. <i>“It’s not that important,”</i> she jokes with a sly grin across your face.");
	output("\n\n<i>“The knight’s wife has saved herself all this time, anxious for her husband’s return. They don’t waste time with any pleasantries or shit like that. No, they want to fuck. Obviously. A bitch in heat can’t be bothered with such trivialities.”</i> This silver starlet is really getting into her vapid setup apparently. <i>“The wife spreads her legs open, inviting her husband to dive right in. But the jerk has to get in a little foreplay. Who would want to keep a woman waiting like that? The nerve! But he persists, kissing and licking at her inner thighs.”</i>");
	output("\n\nWhat was that? You felt something along your own inner thighs. Seems this stupid little story isn’t as pointless as it first appeared. Each description out of your mouth has a corresponding action down south. You can even see faint impressions on your silvery skin. They of course match up with the actions exactly, right down to the sparks of pleasure they’d normally deliver.");
	output("\n\n<i>“This woman’s snatch is getting tired of being teased! She grabs her husband by his hair and drags that anxious little tongue up to where the action’s at. So, he goes to work slobbering all over her plump, succulent walls. This guy’s like a fat kid at an all-you-can-eat buffet. I don’t know what’s gotten into him! But he’s not done teasing yet. No way.");
	if(pc.hasClit()) output(" That [pc.clit] is still as dry as a powder house.");
	output("”</i>");
	output("\n\nYou can barely gasp, moan or do much of anything. There’s a hint of joy mixed in with mischief on your possessed face, so you know this little act is working on at least two participants.");
	output("\n\n<i>“The wife can barely stand it. She’s just about to step in again when the knight goes in for the jugular. He’s got- He’s got...”</i>");
	output("\n\nYour");
	if(pc.hasClit()) output(" joy buzzer is deep in the middle of some oral assault. Your eyes only see it wiggling and wobbling");
	else output(" female sex is laid victim");
	output(" to some unseen force, but the sensation is spot-on sucking, licking and even a little nipping. The gooey storyteller is losing her words, but she fights on. It’s too soon for her to drop the act.");
	output("\n\n<i>“P-Pardon me. The knight’s a pro at this. His wife is just falling to pieces! ‘Just fuck me already!’ she shouts. The housewife is anxious for a hot slab of husband deep in her cooch. But he ignores her, his mouth attempting to pick up the pace. She shoves him off.”</i>");
	output("\n\nThe oral barrage halts, giving your battered senses a momentary reprieve.");
	output("\n\n<i>“‘What’s wrong with you?’ the wife shouts. Her knight hesitates. There’s a look of shame in his face.”</i>");
	output("\n\n<i>“‘M’lady... I was cursed during my journey,’ he responds, a look of sadness in his face. Before his wife can ask, he drops his trousers to reveal this massive horse cock of his.”</i>");
	output("\n\nOh fuck.");
	output("\n\n<i>“His wife is ecstatic. ‘Curse? Honey, this is a blessing!’ The knight can hardly believe his spouse’s words. ‘Stop moping! I can take whatever that thing can dish out!’ She grabs him by his flared tip, pressing it right up against her [pc.vagina].”</i>");
	output("\n\nYou can feel it. The head of this thing really is pretty massive.");
	output("\n\n<i>“The knight’s breathing heavy. His cursed dong is as rigid as a telephone pole! ...Wait, they didn’t have telephone poles back then.”</i> The goo girl pauses to think for a moment, still teasing your pussy with this invisible horse cock of hers. <i>“Well, whatever. This thing’s erection was like a steel girder. The wife was ready. ‘Now fuck me!’”</i>");
	output("\n\nAnd in it goes. You watch your cunt go wide – super wide. This fantasy fuck is stretching you out as far as the gray goo can push you. It’s hard to focus in on the mirror, your vision quavering by what your mind perceives as a earth-shattering phallus striking your malleable cunt with ferocity. There’s a very evident sense of pleasure from your narrator as well. The goo girl is stuck in a moment of euphoria, your mouth agape with her pleasure. She lightly shakes your head before continuing.");
	pc.cuntChange(0,148.44,true,true,false);
	output("\n\n<i>“The- the wife can’t fucking believe how good this feels. The knight can’t fucking... can’t fucking believe...”</i>");
	output("\n\nHer ability to tell a coherent narrative has faltered.");
	output("\n\n<i>“He fucks her!”</i>");
	output("\n\nThe imaginary cock starts pumping and thrusting.");
	output("\n\n<i>“He fucks her! He fucks her! He fucks her! He fucks her!”</i>");

	output("\n\nYour whole body is convulsing now. Both you and the silver sheath are slaves to the pounding. It’s not even clear if she’s in control of this anymore; your mouth is just stuck repeating the same phrase over and over. This goes on for several more minutes at varying degrees of intensity. Every so often you catch a glimpse of the action on the mirror: a spread-open cunt being fucked by some unseen rod. It makes little sense, but you aren’t entirely in the mind to decipher the spectacle.");
	output("\n\nA blissful orgasm finally strikes you, causing you to convulse and spout, and your partner to moan out in ecstasy. Your gray covering contains your offering, but there’s little sign of the goo girl knowing what’s she’s received. She just continues the onslaught, and you continue to cum. The thrusts get slower as time goes on; strength is escaping the enraptured tech-goo. The knight’s unseen horse wang slowly slides out of your battered sex, leaving the two of you to recover.");
	output("\n\nThe gray goo eventually speaks up, <i>“And they fucking lived happily ever after.”</i> She weakly gets a smirk out of your face. <i>“Wow. That was way more intense than I would have figured. I fucking love having a physical body.”</i>");
	output("\n\nHaving?");
	output("\n\n<i>“If I keep you fed - We can just keep on doing stuff like this right? I’ll get to keep on...”</i>");
	output("\n\nSomething whirs to life within you. This line of thinking is going to get you fucked in an unending way if you don’t do something. You try and move... and it registers! Some manner of hidden force manifests in your adrenaline-fueled body, and you proceed to tear your slimy covering off! However, the goo girl doesn’t put a fight and merely sinks to your [pc.feet].");
	output("\n\n<i>“Okay! Okay! I’m not in the slave-taking business!”</i> the blob shouts. She meekly reforms beside you, barely even resembling her original appearance. It’s apparent just how much that little acting session took out of her.");
	output("\n\n<i>“But you gotta admit you enjoyed it as much as I did.”</i>");
	output("\n\nA raising hand is the most you’ll give her, still a tad out of breath. You think she rolled her eyes in response, but there’s no telling. Despite her words to the contrary, you imagine your predicament would have been entirely different had she the strength to subdue you. With that chilling thought, you see yourself away and back to where you lost your gear.\n\n");

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.shower();
	pc.energy(-5);
	CombatManager.genericLoss();
}
