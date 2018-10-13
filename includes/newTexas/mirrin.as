/*
Mirrin Arkosduttir, qilin-morph
 
Ultra-buff half gryvain half equine swimsuit model herm thing idea
By SoAndSo*/

public function showMirrin(nude:Boolean = false):void 
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("\nMIRRIN");
	showBust("MIRRIN"+nudeS);
}

public function goToFrontOfGym():void
{
	move("569");
}

//Descriptions/First Interaction
//tooltip: Just a dragon girl, living in a lonely world.
public function mirrinGymBonus(button:int = 0):Boolean
{
	if(!pc.hasStatusEffect("MIRRIN_DISABLED"))
	{
		if(flags["MET_MIRRIN"] == undefined) 
		{
			// While in Ten Ton Gym, description before first encounter: Dragon-morph
			output("\n\nA rather imposing figure performs squats and deadlifts near the weights. A flurry of red, silver and green, you vaguely think you’ve seen her somewhere else...");
			addButton(button,"DragonMorph",approachMirrinFirstTime,undefined,"Dragon-Morph","Just a dragon girl, living in a lonely world.");
		}
		// While in Ten Ton Gym, repeat encounter: Mirrin
		else
		{
			// While in Ten Ton Gym, PC has had sex with her at least once, has done [Talk] > [Confidence]: Mirrin
			if(flags["SEXED_MIRRIN"] != undefined && flags["MIRRIN_CONFIDENTED"] != undefined)
			{
				output("\n\nMirrin is working out in her usual spot by the weights. Every so often, a gym-goer walks up and talks with her, usually ending in an autograph. Perhaps she could use a distraction?");
			}
			else
			{
				output("\n\nMirrin is working out in her usual spot by the weights. Despite the popularity of the gym, she seems to be on her own...");
			}
			addButton(button,"Mirrin",repeatMirrinApproach,undefined,"Mirrin","Just a dragon girl, living in a lonely world.");
		}
		if(pc.isTaur())
		{
			if(flags["MET_MIRRIN"] != undefined) addButton(button,"Mirrin",taurTrainingAbortGo);
			else addButton(button,"Dragon-Morph",taurTrainingAbortGo);
		}
	}
	return false;
}

//Dragon-morph
public function approachMirrinFirstTime():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	showName("DRAGON-\nMORPH");
	output("You walk towards the energetic figure, watching her hunching and extending form carry out some impressive squats. You note that the weights set on the barbell are within the several hundreds of kilograms, deepening the impression when you note how consistent she is with each squat.");
	output("\n\nGetting closer, her towering shape becomes more imposing and you notice that her corner of the large room seems relatively empty. She’s facing a large mirror, the reflection showing a calm, slightly grimaced face with eyes that dart all over. Her breathing is quite worked up, every exhale being a loud and deep gush of air through her flared nostrils.");
	output("\n\nYou get a quick glance over her: clay-red skin, silvered hair and fierce, draconic features. A straining set of E-cup breasts fight against the black material of her sports shirt. Every squat pushes out her perked up ass, drawing the attention of some distanced onlookers. She doesn’t seem to have acknowledged you yet...");
	output("\n\nSo you introduce yourself, starting with a simple greeting.");
	output("\n\nShe stops mid squat - her butt low to the ground - saying with a strained voice <i>“Just a sec.”</i> Bending her back upwards to complete the squat movement, she breathes out a huff of hot air, her sweat-dripping mouth making a large O shape in the process. She relaxes her posture, reverses carefully to the nearby bar rack and then sets the weights in place with a double <i>clack</i> sound. Dusting her palms off against her shorts, she puts her hands on her hips in a power stance.");

	output("\n\n<i>“Hey, sorry for all that,”</i> she ventilates as she gestures vaguely towards the weights. <i>“What can I do for you?”</i>");
	output("\n\nShe’s now got her bright red eyes on you, the stare of a businesswoman that never flinches away. Steele charm, don’t fail you now!");
	output("\n\n<i>“My name is [pc.name], [pc.name] Steele. I was wondering if you could help me with...”</i> you begin ");
	if(pc.isNice()) output("politely.");
	else if(pc.isMischievous()) output("with a wry smile.");
	else output("in a clinical manner.");
	output("\n\nThat stare seems to get to you. Hang on, what did you want again...?");
	output("\n\n<i>“Personal training?”</i> She says reflexively.");
	processTime(5);
	clearMenu();
	addButton(0,"Yes!",sayYesToDragonPT,undefined,"Yes!","It’s definitely not because you’re mental.");
	addButton(1,"Uh, No...",uhNoDragonPT,undefined,"Uh, No...","How are you getting out of this faux pas...");
}

//Taur/Height/Hyper Restriction
public function taurTrainingAbortGo():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	if(flags["MET_MIRRIN"] == undefined) showName("DRAGON-\nMORPH");

	output("You walk towards the energetic figure, watching her hunching and extending form carry out some impressive squats. You note that the weights set on the barbell are within the several hundreds of kilograms, doubling the impression when you note how consistent she is with each squat.");
	output("\n\nHowever, she spots you in the mirror and approaches you first.");
	output("\n\n<i>“Heeey, friend. If you’re looking for training, I’m afraid you’re out of my range of expertise. Keep trying though”</i> she says in a businessy way. She goes back to her weights.");
	output("\n\nYou shrug, having lost nothing, then get back to your business here.");
	if(flags["MET_MIRRIN"] != undefined) output("\n\nShe must not recognize you with such a drastically changed lower body.");
	//PC returns to front of gym.
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Yes!
//tooltip: It’s definitely not because you’re mental.
public function sayYesToDragonPT():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("Of course that’s what you’re here for! Obviously...");
	output("\n\n<i>“Yeah, I’d like some professional tips and... demonstrations,”</i> you say, the last word trailing off somewhat as the image of the mighty being in front of you remains fresh in your memory.");
	output("\n\n<i>“Sure! I do free lessons most times of the day; can start right now if you like. The name’s Mirrin,”</i> she replies with enthusiasm, turning her attention to the weights by her side. Her accent and mannerisms are a little strange: Terran sounding but you can’t quite place it. ");
	flags["MET_MIRRIN"] = 1;
	processTime(3);
	//[Train] [Free?] [Not Now]
	clearMenu();
	var momsSpaghetti:String = "";
	if(silly) momsSpaghetti = ".. mom’s spaghetti.";
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(0,"Train","Train","You’re too tired for a training session.");
	else addButton(0,"Train",trainWivDragonBonars,undefined,"Train","Time to make ya palms get sweaty, knees weak." + momsSpaghetti);
	addButton(1,"Free?",askMirrinAboutFreebootie,false,"Free?","Seems too good to be true.");
	addButton(2,"Not Now",downTurnDragonPT,undefined,"Not Now","You can train with her later.");
}

//Uh, No...
//tooltip: How are you getting out of this faux pas...
public function uhNoDragonPT():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("<i>“Oh, autograph then,”</i> she says, quickly scouting the floor for something.");
	output("\n\nYou hold up your hands to signal her to stop. <i>“I don’t actually know who you are,”</i> you interject ");
	if(pc.isNice()) output("with a cautious tone.");
	else if(pc.isMischievous()) output("with a smile and a chuckle.");
	else output("flatly.");
	output("\n\n<i>“Hm... turn this way for a second.”</i>");
	output("\n\nYou note that she has a bit of a strange accent; definitely Terran but unfamiliar.");
	output("\n\nShe points to a rather large poster on the other side of the room. It depicts a highly muscled and completely nude figure baring their exposed chest, oiled abs and two soft, dangling horsecocks with a text blurb for some fitness product.");
	output("\n\nIt takes you a second but the clay-red skin gives it away. You’re surprised her face is mostly cut off by the print itself. You also note some... questionable stains that dot the image, especially on that set of divine tits.");
	output("\n\nYou feel a quick, heavily calloused hand on your [pc.hip]: a hand that gently turns you to fully face the direction of the poster. She’s standing right next to you with a ‘told you so’ sort of face. <i>“And the name is Mirrin, for reference. Now you know,”</i> she quips, turning away just as quickly to fiddle with some weights. <i>“Sure you wouldn’t like to uuh, train?”</i> She seems to pause a lot, gesturing with a twirling finger when she needs to say a certain word.");
	flags["MET_MIRRIN"] = 1;

	//[Train] [Free?] [Not Now]
	clearMenu();
	var momsSpaghetti:String = "";
	if(silly) momsSpaghetti = ".. mom’s spaghetti.";
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(0,"Train","Train","You’re too tired for a training session.");
	else addButton(0,"Train",trainWivDragonBonars,undefined,"Train","Time to make ya palms get sweaty, knees weak." + momsSpaghetti);
	addButton(1,"Free?",askMirrinAboutFreebootie,true,"Free?","Seems too good to be true.");
	addButton(2,"Not Now",downTurnDragonPT,undefined,"Not Now","You can train with her later.");
}
//Train
//Moves PC forward 1 hour of in-game time.
//tooltip: Time to make ya palms get sweaty, knees weak {silly:, mom’s spaghetti...}
public function trainWivDragonBonars():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You’re ready for anything, good a time as any!");
	output("\n\n<i>“Hang on, hang on,”</i> says Mirrin, raising a hand. <i>“Uhh, what about gym wear, you sure you want to go around like </i>that<i>?”</i>");
	output("\n\nYou look down at your ");
	if(pc.isNude()) output("bare body.");
	else if(!(pc.armor is EmptySlot)) output("[pc.armor]");
	else if(!(pc.upperUndergarment is EmptySlot)) output("[pc.upperUndergarment]");
	else output("[pc.lowerUndergarment]");
	output(". <i>“It’ll be </i>fiiiiiine<i>,”</i> you say ");
	if(pc.isNice()) output("reassuringly.");
	else if(pc.isMischievous()) output("with that special Steele charm.");
	else output("begrudgingly.");

	output("\n\nMirrin just shrugs back, gesturing to some mats a few meters away. <i>“Need to see how you measure up,”</i> she flatly replies. As she walks over to said mats, you notice that her strides are quite powerful for a biped, her hooves <i>clop clopping</i> lightly against the hard floor. You wonder: how she could even manage the more reasonably proportioned running machines with those things?");
	output("\n\nOnce you’re in position - straightened up, facing towards the mirror - she stands at your side. <i>“Okay, so this is training. You’re here to learn. The grinding, hard stuff will come naturally when your technique is approved,”</i> she explains. You wonder if she’s being euphemistic. <i>“Alright, do a T-pose for me.”</i>");
	output("\n\nYou press your feet together and outstretch your arms to a 90 degree angle each way.");
	// PC tone >70 and Physique >25:
	if(pc.tone > 70 && pc.physique() > 25)
	{
		output("\n\nYou’re very confident in your rigid posture, [pc.legs] bent ever so slightly forward. You don’t even need to look! Easy stuff.");
	}
	//PC tone between 30-70 and Physique 10-25:
	else if(pc.tone > 30 && pc.physique() > 10) output("\n\nYou assume the position, checking your limbs for deviance in form and technique. Looks pretty ok to you!");
	//else:
	else output("\n\nYou’re holding it well but you’re not sure if you’re perfectly straight.");

	if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output("Even so, there’s a certain confidence and swiftness to your movements, something that get’s a <i>“hmm”</i> out of Mirrin.");

	output("\n\nShe gives you a looking over. ");
	if(pc.tone > 70 && pc.physique() >= 25) output("<i>“Hm, pretty shipshape, Steele. You’ll do well,”</i> she says with a hint of admiration.");
	else if(pc.tone > 30 && pc.physique() >= 10) output("<i>“Hmmm, not so bad, Steele. I think we can make this work,”</i> she appraises.");
	else output("She taps the side of her mouth. <i>“Mm... well, I started off worse,”</i> she flatly states.");
	if(pc.thickness > 65) output(" She also gives your [pc.belly] a rough patting. <i>“We’re cutting down on this,”</i> she says with a smirk. A flush runs through your cheeks.");

	output("\n\n<i>“Right, stretches.”</i>");
	output("\n\nShe stands on the mat next to you. <i>“Copy me as best you can,”</i> she commands. She swiftly goes through several recognisable stretching motions and exercises, calling out the timing of each one. You mimic them ");
	if(pc.tone > 70 && pc.physique() >= 25) output("in perfect sync with your draconic instructor.");
	else if(pc.tone > 30 && pc.physique() >= 10) output("relatively cleanly.");
	else output("with a fair bit of sluggishness.");
	output(" You explore at least fifteen different patterns, from triceps to hamstrings and everything in between. ");
	if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output("These movements seem like second nature to you! ");
	output("Mirrin signals for a quick breather. By the end of it, your body is ");
	if(pc.tone > 70 && pc.physique() >= 25) output("feeling a consistent, energised warmness.");
	else if(pc.tone > 30 && pc.physique() >= 10) output("comfortably loose and innervated.");
	else output("a little bit thrown about but happily warmed up.");

	output("\n\n<i>“Right, show me your press-ups,”</i> she says with a breathy sniff. You nod, laying front first with your palms on the ground, your [pc.chest] pressed under your weight. She’s standing over you with folded arms.");

	output("\n\n<i>“As many as you can - go!”</i>");

	//PC tone >70 and Physique >25:
	if(pc.tone > 70 && pc.physique() >= 25)
	{
		output("\n\nYou power through your first thirty with relative ease, not too fast or too slow. The more you do, the more spurned on you become to do more. You’re going so low that your [pc.chest] and [pc.belly] seem to bounce you back up again. Mirrin’s calling out every tenth press but you’re too focused to care. Soon though, you’re feeling the shakes <i>and</i> the burn");
		if(silly) output(" and also something to do with the fat cats on Wall Street goes in and out of your mind");
		output(". You push yourself up with a final bit of drive and say <i>“Done”</i> a bit breathlessly.");
		//PC is Athletic:
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" You’re still up for more! Blessed be these Steele genes.");

		//This makes no sense. SNIP! 
		//output("\n\n<i>“[RNG= 75-105], pretty good work, Steele,”</i> comments the impressed draconid. <i>“Take a minute, then we do crunches.”</i>");
	}
	//PC tone between 30-70 and Physique 10-25:
	else if(pc.tone > 30 && pc.physique() >= 10)
	{
		output("\n\nYou power through your first twenty with relative ease, fresh off the previous warmup. The more you do, the easier it becomes. Mirrin’s calling out every tenth press, something you note. Soon though, you’re feeling the shakes. You finish one last press, retract your legs in and slowly rise. <i>“Done, I think,”</i> you breathlessly say.");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" But you’re still up for more! Blessed be these Steele genes.");
		//This makes no sense. SNIP! 
		//<i>“[RNG= 50-75], not so bad, Steele,”</i> comments the draconid. <i>“Take a few minutes, then we do crunches.”</i>
	}
	//else:
	else
	{
		output("\n\nYou power through your first set of ten relatively easily, if a little slowly. The more you do, the better you feel. Mirrin’s calling out every tenth press, although you’re already mouthing the number of each one anyway. A bit sooner than you thought, you’re feeling the shakes. You finish one last press, slumping on your front for a few seconds then slowly rise to stand up. <i>“Duh... done,”</i> you breathlessly say.");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" But you’re feeling a second wind! Blessed be these Steele genes.");
		//This makes no sense. SNIP! 
		//<i>“[RNG= 35-50], hmmm... well, it’s what you’re here for, eh?”</i> comments the smirking draconid. <i>“Take a few minutes, then we do crunches.”</i>
	}
	output("\n\nYou follow her lead all the way, absent minded of the time. It just seems to breeze by! After going through press-ups, crunches, basic squats and some final stretches, an hour has disappeared.");
	output("\n\n<i>“Okay, that’s enough for this session,”</i> says the sweat-sheened dragon. <i>“I think I’ve got a good idea of what to do with you next. Come by later, Steele.”</i>");
	output("\n\nShe gives you a hefty pat on the shoulder. You ");
	if(pc.isNice()) output("smile and wave,");
	else if(pc.isMischievous()) output("slap her unwavering abs,");
	else output("shake your head,");
	output(" then leave her to her business.");

	//PC gains +7 tone, +2 Physique and +1 Willpower from this scene. Gains ‘Sore’ and ‘Sweaty’ status effects.

	processTime(60);
	pc.modTone(7);
	pc.slowStatGain("physique",2);
	pc.slowStatGain("willpower",1);
	soreDebuff(5);
	sweatyDebuff(1);
	pc.energy(-50);
	
	IncrementFlag("MIRRIN_TRAINED_FIRSTIE");
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Free?
//tooltip: Seems too good to be true.
//If [Uh, No...] was chosen, PC automatically gains +50 lust. //else, PC automatically gains +15 lust.
public function askMirrinAboutFreebootie(bonusLust:Boolean = false):void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("<i>“Free? Seems like an odd business choice,”</i> you inquire. While she’s busying herself with some more weight adjustments there’s time to ogle her assets from behind. Her heavily muscled legs and beautifully toned butt protest the bindings of her skintight shorts");
	if(bonusLust) output(" and now that you’ve seen her in the buff, there really is little needed for the imagination. If she turned round now with her wetted brace of horse peckers getting as hard as her body, oh <i>boy</i>.");
	output("\n\n<i>“Ehh, it’s mostly for rep. Whole posing thing is... it’s silly money, actually,”</i> she chuckles to herself. <i>“Plus, sucks not having a trusty spotter sometimes,”</i> she adds. Makes sense.");
	output("\n\nA few seconds later and Mirrin’s finished with her adjustments.");
	output("\n\n<i>“Ready to get ripped?”</i>");

	if(bonusLust) pc.lust(50);
	else pc.lust(15);
	processTime(2);
	//[Train] [Not Now]
	clearMenu();
	var momsSpaghetti:String = "";
	if(silly) momsSpaghetti = ".. mom’s spaghetti.";
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(0,"Train","Train","You’re too tired for a training session.");
	else addButton(0,"Train",trainWivDragonBonars,undefined,"Train","Time to make ya palms get sweaty, knees weak." + momsSpaghetti);
	addButton(1,"Not Now",downTurnDragonPT,undefined,"Not Now","You can train with her later.");
}

//Not Now
//tooltip: You can train with her later.
public function downTurnDragonPT():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	var tired:Boolean = (pc.energy() < 50 || pc.isWornOut());
	if(pc.isNice()) output("<i>“I’m afraid I’" + (tired ? "m a bit too tired at the moment" : "ve just remembered: I’ve another appointment") + ". Back later?”</i> You say sincerely.");
	else if(pc.isMischievous()) output("<i>“So sooorry, " + (tired ? "kinda tired" : "double booked") + ". Catch you later?”</i> You say with a cheeky smile.");
	else output("<i>“" + (tired ? "Too tired right now" : "Important things to do") + ", some other time perhaps,”</i> you say with a dismissive sniff.");
	output("\n\nMirrin shrugs and smirks. <i>“Sure, I’m here most of the day.”</i>");
	if(pc.isNice()) output("\n\nWith a wave, ");
	else if(pc.isMischievous()) output("\n\nBlowing a kiss, ");
	else output("\n\nQuickly turning around, ");
	output("you leave her to her exercise.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Mirrin
public function repeatMirrinApproach():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	//One time scene after PC has completed [Training] four times and gone for [Food!] four times.
	if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_TREATMENT_TALKED"] == undefined)
	{
		output("You see that she’s even more into her routines than usual, nostrils flared like she’s facing down a rampant bull. It’s better if you talk about what happened at the grill before something happens.");
		output("\n\nStill, a sensation wells up inside your chest as you marvel at her phenomenal speed and precision. A force of nature...");
		//Most options will be greyed out for this part, the only available option being [Talk] > [Treatment].
		clearMenu();
		mirrinMenu();
	}
	//One time scene after PC has talked [Treatment]
	else if(flags["MIRRIN_TREATMENT_TALKED"] != undefined && pc.hasGenitals() && flags["SEXED_MIRRIN"] == undefined)
	{
		output("You approach her with caution. She doesn’t seem upset per se but you can’t know without asking her.");
		output("\n\n<i>“Mirrin...?”</i> You say ");
		if(pc.isNice() || pc.isMischievous()) output("softly.");
		else output("firmly, trying to grab her attention.");
		output("\n\nShe seems to be doing a complex arrangement of arm stretches, music blaring loudly from one side of her head.");
		output("\n\n<i>“Ah... hey [pc.name]. Look, it’s probably easier if we take this a bit more... privately,”</i> she slowly begins, a concerned - almost fearful - look on her face. <i>“Let’s go to my apartment, it’s close.”</i>");
		//[Hmm...]
		clearMenu();
		addButton(0,"Hmm...",mirrinFirstTImeOneOffSex,undefined,"You wonder where this is heading...");
	}
	else
	{
		output("You wander over to ");
		//PC has had sex with her at least once:
		if(flags["SEXED_MIRRIN"] != undefined) output("your qilin lover,");
		else output("the conspicuous bodybuilder,");
		output(" stepping around bits of equipment and a few water bottles. She appears to have a small device on her right ear, and some sort of erratic music drifts around her the closer you get.");
		output("\n\nShe seems to be really into her deadlift routine at present. Every pull and drop makes her sweaty limbs ripple and tense when she completes a movement. You can’t help but admire her form and dedication to technique.");
		output("\n\nAnd that saintly toned ass of course.");
		output("\n\n");
		//PC has had sex with her at least once: 
		if(flags["SEXED_MIRRIN"] != undefined) output("Her unavoidable eyes have been following you since you came in but it hasn’t distracted her too much. <i>“Heya <i>*huff*</i> Steele”</i> says the puffing deadlifter with a wink. Did you just see her bulge twitch?");
		else output("She’s facing a mirror so she should see you in it, although it never usually hurts to be polite...");

		processTime(5);
		//[Appearance] [Training] [Talk]* [Her Place]**
		clearMenu();
		mirrinMenu();
		//*Unavailable/Greyed out until PC has done gone through [Training] at least once.
		//**Unavailable/Greyed out until PC has gone through all dialogue options through [Talk].
	}
}

public function mirrinMenu():void
{
	clearMenu();
	addButton(0,"Appearance",mirrinAppearance,undefined,"Appearance","Quick! She’s not looking...");
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(1,"Training","Training","You’re too tired for a training session.");
	else if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_TREATMENT_TALKED"] == undefined) addDisabledButton(1,"Training","Training","Maybe you should talk about what happened before doing more training.");
	else if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_CONFIDENTED"] == undefined) addDisabledButton(1,"Training","Training","Maybe you should talk about that last bout of fun before any more training...");
	else addButton(1,"Training",repeatableMirrinTraining,undefined,"Training",("Get cut!" + (silly ? " Put that knife down..." : "")));

	if(flags["MIRRIN_TRAINED"] == undefined) addDisabledButton(2,"Talk","Talk","She’s not interested in talking right now.");
	else if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_TREATMENT_TALKED"] == undefined) addButton(2,"Talk",talkToMirrin,undefined,"Talk","Might be a good idea to see how she’s doing...");
	else addButton(2,"Talk",talkToMirrin,undefined,"Talk","Surely there’s more to her than swole gains?");
	if(flags["SEXED_MIRRIN"] == undefined) addDisabledButton(3,"Her Place","Her Place","You definitely haven’t gotten the okay for this.");
	else if(flags["MIRRIN_CONFIDENTED"] == undefined) addDisabledButton(3,"Her Place","Her Place","Maybe talk to her about last time, give her some <i>confidence</i>.");
	else addButton(3,"Her Place",visitMirrinsPlace,undefined,"Her Place","Into the dragon’s lair...");

	addButton(14,"Leave",goToFrontOfGym);
}

//Appearance
//tooltip: Quick! She’s not looking...
public function mirrinAppearance():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("As you’re standing behind her while she faces the mirror, you give her flexing body a look over.");
	output("\n\nMirrin ");
	//PC has gone to Talk > Race:
	if(flags["MIRRIN_RACE_TALKED"] != undefined) output(" is a self-described qilin.");
	else output(" appears to be a heavily modded half-gryvain, half-equine morph.");
	output(" Like a lot of the residents of New Texas, she’s a very large individual at around 8’ in height by your guess, her horns adding a bit more on top of that. She towers over or matches those in the gym, including most of the larger bulls.");
	if(pc.tallness < 80) output(" You feel just a <i>little</i> bit small and insignificant standing next to her...");

	output("\n\nThe ");
	//PC has gone to [Talk] > [Race]:
	if(flags["MIRRIN_RACE_TALKED"] != undefined) output("qilin");
	else output("curious hybrid");
	output(" has clay-red skin. Some darker red scales cover parts of her body - notably thighs, arms, clawed hands and shoulders - like most gryvain, although Mirrin appears to have less scales than the norm. Other places - elbows, back of her calves - have tufts of silver and jade fur, much like a horse’s mane. The silver-and-jade hair on her head is uniformly straight and about 2’ long, bound in a tight ponytail with 3’ of binding instead of a hairband. Her shorter silver horse-tail bobs about, tilted at an angle above her shorts and is bound in the same way as her hair.");

	output("\n\nA set of two ornate, fearsome, jade-green draconic horns extend from the top of her forehead. Complex, erratic swirls and patterns adorn them. They curve back over her head, the points then curving upwards towards the ceiling. You’d say they were at least a foot long. Her ears appear to do the same: long, lithe things, almost elven in shape with a slight upward bend towards the tip. They’re also a foot long by your reckoning.");
	output("\n\nShe has a surprisingly feminine face: a straight, pointed nose and lack of makeup add a hint of masculinity. Her eyes are draconic but are red in color instead of the typical yellow you normally see amongst gryvain.");
	//PC has had sex with her at least once:
	if(flags["SEXED_MIRRIN"] != undefined) output(" You know that her mouth hides a dextrous, foot long tongue: a thought that tickles the hot, sordid memories you have of her.");
	output("\n\nShe is exceptionally powerful in her build: A rock-hard mass of sculpted, flexing muscle. Her shoulders, abs and biceps have particularly detailed muscle mass. She stands on two similarly built equine legs with strange hooves. Said hooves are slightly splayed and are jade green in color, patterned much like her horns.");
	if(flags["MIRRIN_TRAINED"] != undefined && flags["MIRRIN_TRAINED"] >= 4) output(" You’ve heard her true voice: somehow, she’s got a second set of vocal chords, powerful enough to emulate a mythical dragons roar.");

	output("\n\nHer shapely chest heaves and expands with every stretch she makes, all tightly bound inside a black sports top. She looks like an E-cup, although her overall size makes her chest seem more reasonably proportioned. Looking further down, your eyes are drawn to the impressive bulge between her legs. Black straps peek out over the rim of the strained pair of skintight black shorts that hold it all in, implying a particularly restrictive jockstrap. You find yourself biting your [pc.lipChaste].");
	if(flags["SEXED_MIRRIN"] != undefined) 
	{
		output(" Underneath it all, you envision her retracted, sheathed twin horsecocks that threaten to burst out at any second. She also has a Terran pussy, one that’s quite sensitive and criminally underused.");
		output("\n\nOccasionally, she turns her head to your direction. A wink here, a licking of the lips there, she even slows down a squat so you get a proper view of her ultra-toned ass.");
	}
	else output("\n\nShe appears to be focused on her routine and doesn’t seem to notice you looking her over... or just won’t say anything about it.");

	mirrinMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re looking at her right now!");
}

//Training
//tooltip: Get cut! {Silly: Put that knife down...}
//Moves PC forward 1 hour of in-game time after each session.
public function repeatableMirrinTraining():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	//1st Training Session
	if(flags["MIRRIN_TRAINED"] == undefined)
	{
		output("<i>“Hey there, can we do some training?”</i> You say from behind the hulking dragon.");
		if(flags["MIRRIN_TRAINED_FIRSTIE"] != undefined) output("\n\n<i>“Yup, lemme finish up here.”</i>");
		else output("\n\n<i>“Well, I’m not sure how you’ll measure but we can go easy.”</i>");
		output("\n\nShe unloads her barbell onto the nearby rack. It’s amazing how it seems to always grow in size every time you see her use it and now it’s probably at around 450 kilos...");
		output("\n\n<i>“Just some ground rules: You focus on me and only me. What I say goes, if you falter, I’ll help but that’s not likely to happen,”</i> she explains.");
		if(pc.isTreated()) output(" It might be hard to focus with all these hefty, heaving bulls and cows smelling so <i>good</i> all the time...");
		output("\n\n<i>“Right now... I want to see you squat,”</i> she finishes, more forwardly than you expected.");
		if(pc.isNice()) output("\n\n<i>“I-if you’re sure...”</i> you say, a little cautious at the prospect.");
		else if(pc.isMischievous()) output("\n\n<i>“Just had to ask, big girl,”</i> you say with a wink. She briefly raises an eyebrow.");
		else output("\n\n<i>“Better be fair with me...”</i> you tepidly say.");

		if(pc.isNice()) output("\n\n<i>“Mmmhm, don’t worry. I’ll be with you every step of the way,”</i> she assures you.");
		else if(pc.isMischievous()) output("\n\n<i>“Guess it makes a change from you checking <i>me</i> out,”</i> she sasses you. Shit, that means she saw you peeping.");
		else output("\n\n<i>“Ah, don’t be such a panzer,”</i> she jokes, lazily waving her hand at your statement. You’re fairly sure she meant to say pansy.");
		output("\n\nInstead of adjusting the manual weights on the rack, she picks up a curiously shaped metal bar. It’s roughly the same size but has a thicker middle section with a tiny control panel on it and dull metal spheres on both ends. <i>“Right, stand in front of the mirror, Steele,”</i> she directs, hefting the bar a foot above her horn-crowned head.");

		output("\n\nStanding perfectly opposite to the mirror, you straighten your [pc.legs] in preparation. Mirrin artfully hefts the strange bar onto your shoulders and you instinctively grab the handles. It feels cold but comfortable enough against your [pc.skinFurScales]. <i>“Think I got it,”</i> you say.");
		output("\n\n<i>“Nooope, I haven’t set the weight yet,”</i> she counteracts. <i>“This calculates uhhh, your potential load based on your body strength. I’ve set it to 50 percent of what you theoretically can do so shouldn’t be too harsh.”</i>");
		output("\n\nShe’s using her thumb to key in the buttons while holding the bar along with you. There’s a bit of apprehension in the air...");
		output("\n\nSuddenly, you feel it!");
		output("\n\nAn immense pressure on your frame makes you tense briefly. You take a few seconds to adjust. It’s heavy as <i>hell</i> but you have an inkling that it’s manageable. Unexpectedly, she puts her large and rough, heat-radiating hands around your waist. ");
		if(pc.thickness >= 65 && pc.tone < 50) output("Your doughy midsection prevents her clawtips meeting in the middle... but she’s definitely trying, squeezing your flub something fierce. Said clawtips dig in to your [pc.skinFurScales] quite firmly.");
		else if(pc.thickness >= 35) output("Your midsection tightens as her claws try to meet in the middle. The claws themselves pull a little sharply on your [pc.skinFurScales] but not painfully so.");
		else output("Your thinner frame feels almost immaterial as her fingers wrap tightly enough for her claws to meet. The tips grip into your [pc.skinFurScales] but not enough to hurt or do damage.");

		output("\n\n<i>“We go together, kay?”</i>");

		output("\n\nWith a lead-in from your trainer, you slowly bend down. Your [pc.knees] feel stiff but steady. As you descend, Mirrin’s powerful thumbs presses into different places on your back, encouraging you to push out certain parts of your body. Particularly, your [pc.ass] feels a little strain as it perks itself out under all this weight, not to mention the way her movements makes your [pc.chest] push a little bit more forward. If it gives the gym regulars a show...");
		if(pc.exhibitionism() >= 33) output(" you bite your lip at the thought.");
		else output(" you’re a little tentative at the thought.");

		output("\n\nYou feel your [pc.butt] hit the backs of your ankles. Success! Sort of?! At this point, Mirrin lets go, standing up behind you. <i>“Now, complete the movement,”</i> she encourages. ");
		if(pc.tone > 70 && pc.physique() >= 25) output("It’s a bit tough at first but you’re able to push yourself up steadily back to a standing position.");
		else if(pc.tone > 30 && pc.physique() >= 10) output("It’s a strain to push yourself up again but after the initial, troublesome uphill thrust, you reach the standing position.");
		else output("You find it quite difficult to complete the motion at first. You feel that your body lacks a certain strength in some areas. Nevertheless, your struggling eventually lets you to finish at the correct position.");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" This feels quite natural, now that you think about it.");
		output("\n\nDespite all that, you’re sure that your [pc.ass] is going to appreciate your efforts...");

		output("\n\nFlaring her nose a bit, Mirrin saunters around you with a particularly piercing gaze. You watch her movements with your peripheral vision and all you see is a set of unblinking red eyes staring you down. <i>“Eight more,”</i> she commands. <i>“This thing has a rep counter so I’ll </i>know<i> if you skip, Steele. Now I’ll be back in a bit.”</i>");
		output("\n\nShe strides off towards the changing rooms for something... but you have more pressing things to handle. You plow on through with your reps ");
		if(pc.tone > 70 && pc.physique() >= 25) output("with some ease, although you could swear that the damn bar was getting heavier each time.");
		else if(pc.tone > 30 && pc.physique() >= 10) output("smoothly but not without strain, the last three being exceptionally slower than usual.");
		else output("at a slow pace, focusing on the technique over anything else.");

		output("\n\nYou spot Mirrin in the mirror’s reflection although she’s... wearing something else. It appears to be a particularly low-cut mint green jacket, like a Terran style hooded top. The label covering the chest in white text says ‘F O X F I T’. She seems to be sporting matching knee-length leggings, which are a white color with a singular mint stripe down each leg. Modelling stuff?");
		output("\n\nShe says <i>“smiiile,”</i> as she approaches from behind, holding up some sort of small dataslate in her hand. Angling it to catch the both of you, you hear a distinct <i>tk-tzzch</i> sound, like an old style camera. It all happens so fast that you don’t even change expression. You haven’t even taken the bar off of your back.");
		output("\n\n<i>“Have a look.”</i>");
		output("\n\nShe pretty much forces the slate into your face and you see a highly stylized and filtered picture of you, cowed by the weights on your back and Mirrin looking exceptionally photogenic... even though only half of her face is in the shot. You just about have enough time to read a sentence.");
		output("\n\n<i>“Working on a new one, could be a keeper x.x.x Special thanks to FoxFit for these awesome garbs!”</i>");
		output("\n\nAside the name drop, you’re not quite sure what to make of it all. During this time, the refreshed Mirrin is fidgeting with the panel on the bar weight. <i>“Hmm, good work, Steele,”</i> she says, betraying a hint of approval. <i>“Now do five more sets of eight.”</i>");
		output("\n\n");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output("Nice, a challenge!");
		else output("<i>Groan</i>.");

		output("\n\nOnce you’ve pretty much exhausted your strength, the bar near-instantly becomes light again. It’s enough that you can lift it over your head despite your very tired out arm muscles. <i>“I’d say that calls for food,”</i> she says.");
		output("\n\nAw, food sounds <i>so</i> good right now...");
		if(pc.thickness > 65) output(" even if she might point out your extra dough later.");
		output("\n\n<i>“On me, how about it?”</i> she adds.");
		//PC gains +4 tone, +1 Physique, +1 Reflexes and +1 Willpower. Gains ‘Sore’ and ‘Sweaty’ status effects.
		processTime(60);
		pc.modTone(4);
		pc.slowStatGain("physique",1);
		pc.slowStatGain("reflexes",1);
		pc.slowStatGain("willpower",1);
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy(-50);
		IncrementFlag("MIRRIN_TRAINED");
		//[Food!]
		clearMenu();
		addButton(0,"Food!",foodWithMirrin);
	}
	//2nd Training Session
	else if(flags["MIRRIN_TRAINED"] == 1)
	{
		output("<i>“Hey there, can we do some training?”</i> you say from behind the hulking dragon.");
		output("\n\n<i>“Back for more? I got some good stuff planned,”</i> says Mirrin.");
		output("\n\nIn a true reflection of what she does, she’s wearing a skintight leotard. Its color scheme is somewhat garish - covered in black, yellow and pink - but it appears to be incredibly well fitted, almost unnaturally so. Her intrusive, distracting bulge leaves even less to the imagination than before... you just about manage to tear your [pc.eyes] away from it.");
		//PC is kind:
		if(pc.isNice()) 
		{
			output("\n\n<i>“Can’t wait! I’ve gotten pretty strong from all this,”</i> you chirp.");
			output("\n\n<i>“Mm, I betcha have,”</i> says the distracted trainer. She is - quite unapologetically - checking out your [pc.butt], an eyebrow raised.");
			output("\n\n<i>“Uhh, what are we doing today, then?”</i> You ask, to which she <i>slowly</i> brings her gaze to your eye level.");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“Niiice outfit,”</i> you say, a vague hint of sarcasm coming through.");
			output("\n\n<i>“Niiice ass,”</i> she says rather flatly, checking your [pc.butt] out unapologetically.");
			output("\n\n<i>“Heyy-”</i> you start but she interrupts.");
			output("\n\n<i>“Mess with the dragon, you get the horns,”</i> she grins, red eyes staring right into yours.");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“I expect it to be more challenging,”</i> you say dismissively, arms folded. Mirrin appears to be slightly distracted, checking out your [pc.butt] without a care.");
			output("\n\n<i>“I’m talking to <i>you</i>, Mirrin,”</i> you add. She slowly turns her gaze from below you to directly at you, a rather displeased expression on her face. She raises an eyebrow.");
			output("\n\n<i>“And...?”</i> she flatly states. It seems to be tit for tat with her.");
			output("\n\n<i>“Anyway...”</i>");
		}
		output("\n\n<i>“We’re doing something necessary today,”</i> she continues in a business-like tone.");
		output("\n\n<i>“</i>Cardio<i>.”</i>");

		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output("\n\nFuck yes.");
		else output("\n\nFuck.");
		output("\n\nShe briskly paces over to the rowing machines and you follow suit. The gym is a little emptier today than normal but still the few gym goers around disperse when she walks up to the machines. They really want to avoid her for some reason...");
		output("\n\nYou set yourself up on one of the machines, placing your [pc.ass] on the sliding seat and comfortably setting your [pc.legs] to the omni-fitting foot latches. You curl forward and pull up the handle on the machine. It’s a surprisingly tough pull: the machine appears to be adjusting to your body strength. There’s a monitor right in front of you that confirms what you assumed.");
		output("\n\n<i>“15 kilometers. All in your own time,”</i> she says, thrusting her posture forward slightly. Well, at least there’s a good view of some boobs...");
		output("\n\nYou begin.");
		output("\n\nIt’s not quite as hard as you thought but very quickly you’re respiring and perspiring all over the place. ");
		if(pc.tone > 70 && pc.physique() >= 25) output("You work the proper technique to the finest detail, your limbs and body working in tandem with mechanical consistency.");
		else if(pc.tone > 30 && pc.physique() >= 10) output("You’re familiar with the proper technique, although you feel yourself slipping a bit in some places. Still, you’re certain it’s consistent enough.");
		else output("It’s quite a bit of effort but you find a rhythm. You start to feel yourself straining early on.");
		output("\n\nThroughout all this, Mirrin appears to be ignoring you. She’s now leaning her hip on the machine in a relaxed way, a look of disinterest on her face as she fiddles with the dataslate in her hand. Every so often, you see her stroke, touch and scratch the material covering her tightly packed chest. It bounces and springs with every prod she makes. Such a tease...");
		output("\n\nAfter a bit of time, a double beep from the rowing machine signals you that you’ve reached 15k. <i>“Oop, finished,”</i> says your alerted trainer. She gives the monitor a quick once-over, ‘umming’ and ‘ahhing’ to herself.");
		output("\n\nYour limbs are like jelly after the rowing but the afterglow is warming your tired senses all around your body. You slovenly slide your [pc.legs] from the all-fitting foot rests to sit up properly. <i>“Huh *<i>gasp</i>* how’d I do?”</i>");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" You almost feel ready to go again!");
		output("\n\n<i>“Enough,”</i> she says with a grin. <i>“Let’s get some grub. Could murder some junk food right now.”</i>");
		//PC gains +2 Reflexes, -6 thickness and +1 Willpower. Gains ‘Sore’ and ‘Sweaty’ status effects.
		pc.modThickness(-6);
		processTime(60);
		pc.slowStatGain("reflexes",2);
		pc.slowStatGain("willpower",1);
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy(-50);
		IncrementFlag("MIRRIN_TRAINED");
		//[Food!]
		clearMenu();
		addButton(0,"Food!",foodWithMirrin);
	}
	//3rd Training Session
	else if(flags["MIRRIN_TRAINED"] == 2)
	{
		//PC gains +50 lust.
		output("<i>“Hey Mirrin, can we do some training?”</i>");
		output("\n\n<i>“Of course, Steele. I just need to go change a sec,”</i> she says in a chipper manner. She’s even got something of a genuine smile on her face. What could it be for...");
		output("\n\nYou spot that the gym floor is a little more crowded than usual. Did Quenton organise something...?");
		output("\n\nMirrin returns and immediately most of the heads in the room turn to her. She’s not looking at them but her face is prideful all the same. She’s wearing a thin latex bikini, almost completely transparent. You don’t even <i>need</i> your imagination anymore! Although, a second look suggests the bikini bottoms might not be too adept at holding back the monsters beneath...");
		output("\n\nIt’s only just dawned on you that you’ve been staring her up and down at point blank range for almost a minute. The she-dragon casually clears her throat.");
		output("\n\n<i>“Eyes up here, Steele,”</i> she says with a knowing smirk. ");
		if(pc.tallness > 80) output("Your [pc.eyes] meet her at eye level, ");
		else output("Your [pc.eyes] meet hers from below, ");
		output("a wash of embarrassment filling your [pc.face]. She leans in just a bit closer, almost uncomfortably so.");
		output("\n\n<i>“Benchpress, go,”</i> she lazily commands, pointing you to it’s general direction.");
		output("\n\nYou walk briskly over to an empty bench, Mirrin’s heavy <i>clop clops</i> just behind you. Eager to ");
		if(pc.isNice()) output("please,");
		else if(pc.isMischievous()) output("eye her on the side,");
		else output("get this forced guilt trip over with,");
		output(" you lay down on your back. Your draconid trainer places the strange spheroid barbell from before on the stands behind your head. <i>“Same settings as before. One set of 8 reps, go.”</i>");

		output("\n\nLifting the thing off of its hooks is simple if a bit slow at first. ");
		if(pc.tone > 70 && pc.physique() >= 25) output("You make sure your arms are angled to a perfect 90 degrees, the load spread evenly across your palms. After a couple of reps, the rhythm you make does the work for you.");
		else if(pc.tone > 30 && pc.physique() >= 10) output("You’ve got your arms angled accurately although the load is a little tough to deal with. After four reps, you feel a surge of will to complete them properly.");
		else output("It turns out to be tougher than you thought but not impossible. You work through the set slowly, making sure your technique is the focus.");
		output(" When the beep sounds, you place the bar in its resting position with a hefty exhale.");

		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" Easy! Let’s do more!");
		output("\n\n<i>“Hmm, take a breather,”</i> says Mirrin, tapping away at the control panel on the barbell. Relaxing your chest muscles, you idly glance around you. Immediately, you see that Mirrin’s impressive bulge is barely inches away from your [pc.face]. Holy <i>shit</i>, is it huge. Maybe not the biggest you’ve seen but there’s <i>two</i> of those meaty horsedicks curled away, a rounded and smooth coconut-sized semen sphere on each side. The pressure they must be under, wrapped inside that thin layer of latex...");
		output("\n\n<i>“Back to work, Steele,”</i> she chimes, breaking you out of that trance. She appears to wander away somewhere and goes out of your periphery. <i>“I’m just over here,”</i> she says, resting a hand on your [pc.legs] for a few seconds. Hotdamn, are those things rough on your [pc.skinFurScales].");
		output("\n\nGetting back into your sets, you find it a little easier than before. You’re pretty warmed up after all! That must be it...");
		output("\n\nThe rest of the session seems like a breeze since that moment, Mirrin’s occasional words of encouragement spurring you on. She intervenes to give you a bit of direction, her rough, radiating clawed hands guiding you here and there with angles and posture. Sometimes, she brushes over your [pc.groin] ever so lightly and there’s a delightful internal twinge from the mere contact.");
		output("\n\nWithout warning, someway through your sets, a <i>something</i> lands abruptly on your face. Immediately, you clamber to set your barbell properly, just about managing to do so from intuition.");
		output("\n\nWhat in the hell is...? <i>Oh.</i>");
		output("\n\nMirrin is standing just above your head but... her bikini bottoms have ripped themselves off!");
		output("\n\nIt’s all quite overwhelming. You get a strong waft of warm plastic and a subtle but complex musk, something like burning coals, cinnamon and... hmmm.");
		if(pc.isTreated()) output(" It’s more than enough to drive your other senses insane, a reactionary heat rising in your [pc.crotch]. On top of that, you’re feeling the ache in your nipples as they harden up. But she’s not even Treated!");
		output("\n\n<i>“Huh... wardrobe failure,”</i> says the apathetic dragon. She does quickly grab the ripped plastic from your face but she’s still standing right over you... along with two unfurled horsecocks, just inches from your [pc.lips].");
		if(pc.isBimbo()) output(" The temptation to slide your [pc.tongue] all over these monsters is difficult to resist. You could almost give in if she wasn’t giving you such a deathly stare!");
		output("\n\n<i>“Well don’t stop lifting, keep going,”</i> she calls out, staring you right in the eyes from above. ");
		output("\n\nWith a little bit of hesitation and a big distraction dangling around your face, you plow on through with your last set. You swear you can see right into her urethra the entire time...");
		output("\n\nWith one final, blessed beep, you haul the hateful barbell onto its handles. Mirrin walks around to your side and only then do you exhale fully, trying to come down from your energetic high. All this time, the gym goers appear to have gravitated ever so slightly towards you and Mirrin... True to the spirit of New Texas, there’s enough catcalling, wolf whistling and genital jostling to drown out a sports crowd.");
		output("\n\n<i>“Ugh... give me a few minutes,”</i> Mirrin says in response. She clops off to the changing rooms, ignoring the crowd around her. You yourself slowly sit up, stretching out your [pc.arms] and [pc.legs]. There’s still a vague hint of musk floating around your [pc.face].");
		if(pc.isTreated()) output(" It’s enough to keep you flushed and horny for a good while. So much smokey dragon flavor...");
		output("\n\nAlmost as quickly as she left, Mirrin is back and covered up. She’s changed to a rather unremarkable white bikini top with white short shorts. However, she doesn’t seem to have <i>quite</i> got her full package to fit properly... they’re still inside her shorts but almost wrap round her hips, forming two snakelike bulges.");
		output("\n\n<i>“I could do with some grill, what do you say to food, Steele?”</i>");
		//PC gains +6 tone, +2 Physique and +1 Willpower. Gains ‘Sore’ and ‘Sweaty’ status effects.
		processTime(60);
		pc.lust(50);
		pc.modTone(6);
		pc.slowStatGain("physique",2);
		pc.slowStatGain("willpower",1);
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy(-50);
		IncrementFlag("MIRRIN_TRAINED");
		//[Food!]
		clearMenu();
		addButton(0,"Food!",foodWithMirrin);
	}
	//4th Training Session
	else if(flags["MIRRIN_TRAINED"] == 3)
	{
		//PC gains +50 lust.
		output("After the last session’s... incident, you’re not really that phased to go for another one. <i>“Got time for some training today, Mirrin?”</i> You start.");
		output("\n\nThe jacked ");
		//PC has read [Race]:
		if(flags["MIRRIN_RACE_TALKED"] != undefined) output("qilin");
		else output("dragon-morph");
		output(" perks up at hearing your voice, hurriedly finishing her rep. <i>“Eyyy, [pc.name]. Something awesome that I’ve been saving for some time,”</i> she greets, not exactly with a smile but friendlier than usual. She hands you a small plastic bottle of something orange and oily.");
		output("\n\nYou ask her what it is. As she hands it to you, you feel its weight. It’s surprisingly dense, almost like handling mercury. Opening it up, the odour is rather lacking but it smells vaguely <i>warm</i>.");
		output("\n\n<i>“It’s a kind of uuuuh, muscle stimulant,”</i> she replies. <i>“It’s not like steroids, more like uhh, energy and stamina that you just rub on yourself instead of eat. This isn’t the awesome thing, just part of it. Follow me.”</i>");
		output("\n\nShe walks with a bit of spunk, heading towards the gym’s front desk. There, she waves over Quenton - who appears to just be scratching his dick - and has a few quiet words and nods out of earshot. Intriguing.");
		output("\n\nShe turns to you, beckoning you with a finger. Her and Quenton slip behind the front desk into an inconspicuous back room. WELP, you came for training after all, it seems best to follow her. Although, you never know if you’ll end up with a horsedick in your face again...");
		output("\n\nWhat you see when you enter is altogether different. It’s a rather blank, dimly lit white room with only a few skylights for illumination. Mirrin and the bull are standing by a large, complex looking bit of machinery. As you get closer, Quenton abruptly turns to leave.");
		output("\n\n<i>“Hey good lookin’, ‘sgonna be a fun day,”</i> he says, a knowing wink and a smile beaming from his chiseled face.");
		output("\n\nAt least it’s not horsedicks, you say to yourself. Then again, is that ever a bad thing?");
		output("\n\nMirrin’s got her fingers all over some sort of control panel, one that looks quite alien. The entire machine could be summed up as such, too: It’s about four metres tall and three metres wide with two big saucers - one on the floor, one in the air - holding some sort of massive, white metal cylinder in a gravitational field. It’s surface is exceedingly smooth but every so often, it appears to ‘ripple’ like a thick liquid.");
		output("\n\n<i>“Uh, Mirrin... what in the tits is this thing?”</i>");
		output("\n\nYou stand by her side, ");
		if(pc.tallness > 80) output("looking to her");
		else output("looking up at her");
		output(" for an answer.");
		output("\n\n<i>“It’s uuuh, sort of a present,”</i> she says with a small sniff and twirl of the finger. <i>“Not that it’s mine to go give. But somehow Quenton got his hands on this... marvel of bodybuilding magnificence and we,”</i> she pauses, pointing to you and then herself.");
		output("\n\n<i>“We get to use it.”</i>");
		output("\n\nYou ask her what it’s actually meant to be ");
		if(pc.isNice()) output("with curiosity.");
		else if(pc.isMischievous()) output("with open confusion.");
		else output("with indignant disbelief.");

		output("\n\n<i>“Kind of everything... I guess?”</i> states the unconvincing she-dragon. <i>“So like, you stand on the pads there and you push down with your legs but push up with your arms. Full body workout, fits to your shape, fits to your strength and it goes up to weights of seven Terran tons.”</i>");
		output("\n\nWhat. The. Balls.");
		output("\n\n<i>“So, you. Steele. Heir to Steele Tech and general galactic busybody with </i>moi<i>, Mirrin Arkosduttir, galactic model and freaky dragon thing, get to test this badass... whatever it is,”</i> she exclaims, having a smile so wide that this is the happiest you’ve seen her.");
		output("\n\nInterested in the prospect, you clamber onto the all-purpose foot pads that hover a foot in the air. They’re not actually attached to anything - at all - and yet they feel very stable. With caution, you put your hands onto two handles that float close to your shoulders. You end up in a squatting position. At that moment, you feel an invisible pressure round your [pc.hips] and midriff.");
		output("\n\n<i>“Don’t worry about that, it’s just a failsafe sort of thing,”</i> calls out Mirrin.");
		//PC is kind:
		if(pc.isNice())
		{
			output("\n\n<i>“Mirrin, I trust you but... is this really safe?”</i> You call back, a little bit alarmed.");
			output("\n\nShe smiles back at you. <i>“I’d never try to hurt you, Steele. Too many lawsuits!”</i>");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“I swear, if this starts ripping my clothes off, I’m strapping you in this damn thing forever,”</i> you call back, half joking, half serious.");
			output("\n\nShe just laughs. <i>“You’ll be fiiiiine, you’re a Steele. You’re hard as rocks,”</i> she reassures you. Ooo, it wouldn’t be good if she started confusing rocks with metals now...");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“If I get sucked into some unknown portal to hell, I’m coming back from the dead and fucking killing you,”</i> you shout back, wide-eyed and paranoid.");
			output("\n\nShe just waves it away. <i>“Such a joker, Steele. This is a great experience!”</i> She exclaims, sounding like a peppy therapist on a caffeine drip.");
		}
		output("\n\nShe’s got the bottle of orange oil in her hands. She wanders over to you, squirting a bit on her left palm. <i>“Now just relax,”</i> she says with a toothy grin, pulling back parts of your [pc.gear] and rubbing the oil over your biceps, [pc.belly], [pc.hips] and [pc.legs]. She seems to be having more fun with that than she lets on... her rough hands feel a helluava lot smoother.");
		output("\n\nShe finishes, her face barely a few inches from your own [pc.face].");
		output("\n\n<i>“Ready? Gimme 8 reps.”</i>");
		output("\n\nYou nod. She steps back, admiring her work. You begin to push up with the handles and push down with the pads. It’s a bit disconcerting at first but after a few lifts and bends, you find it easy to get into. Still, the sensation of being held in place while your arms and lower half push in opposite directions is new.");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" You find an internal balance pretty quickly, however. It makes you want to try all the more! But...");

		output("\n\nThis thing is <i>hard</i>. Aside from your neck, the intense rush, burn and strain on your musculature both syncs your limbs together. It does, however, wear them out faster than you expected.");

		if(pc.tone > 70 && pc.physique() >= 25) output("\n\nWithout the mechanical feedback you’re used to, you adjust to the more floaty sensation of the pads. Combined with your balanced body, your first set of reps go by smoothly, if slowly.");
		else if(pc.tone > 30 && pc.physique() >= 10) output("\n\nWithout the mechanical feedback you’re used to, you have to try hard to adjust to the floating sensation of the pads. Your body handles it well and your reps go down steadily but slowly.");
		else output("\n\nWithout the mechanical feedback you’re used to, the sensation is a little wobbly. You find yourself coping with the pads but your body feels a little out of whack. Your perform your reps slowly, focusing on technique.");
		output("\n\nThe sensation of the oil is intense. It fills your [pc.skinFurScales] with natural heat and momentum, providing you with the energy you need to keep going. Mirrin’s glancing you over. Her fiery red eyes seem to glow in the dim light of the room.");
		output("\n\nOnce you’ve finished your first set, she just holds up her hand with her fingers spread out and you know she means five more sets...");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" Here we go!");

		output("\n\nHaving a breather between each set, Mirrin re-applies some of the oil to bits of your body.");
		if(pc.thickness < 35) output(" She spends a little extra time touching up your [pc.belly], particularly your visible, tensing abs...");
		else if(pc.thickness > 65) output(" She spends a little extra time on your [pc.hips] and [pc.belly]. You feel her claws pulling slightly on your flesh and you’re fairly certain she’s watching out for some sort of jiggling...");
		output("\n\nThe oil is absorbed pretty quickly into your skin so every bit reapplied feels like a fresh, new sensation. Judging by how you’re still able to keep going, it’s doing it’s job.");
		output("\n\nSuddenly, Mirrin calls <i>“Stop!”</i> and you snap out of your rhythm. You ask if there’s something wrong.");
		output("\n\n<i>“Ey, no, no... I just want a go,”</i> she says, somewhat envious of the sweat you’ve worked up. <i>“You did good but <i>fuck</i>, I can’t miss this.”</i>");
		output("\n\nYou let go of the handles above you and the hard grip round your middle disappears. Instinctively, you move your body forward but your limbs feel like jelly!");
		output("\n\nYou slip.");
		output("\n\nAnd Mirrin lurches forward to catch you.");
		output("\n\n<i>“Gotcha, gotcha!”</i>");
		output("\n\nYou regain your sense of self, finding yourself clasped tightly against her with her face a few inches from yours. It’s those eyes... your chest flutters. You both lock into each others gaze for a few seconds.");
		output("\n\n<i>“You okay, [pc.name]?”</i> asks the velvety voiced she-dragon.");
		if(pc.isNice()) output("\n\n<i>“Uhh... yeah,”</i> you nod slowly, unable to break eye contact.");
		else if(pc.isMischievous()) output("\n\n<i>“Uhm... maybe,”</i> you say with a quiver, placing a hand on her arm.");
		else output("\n\n<i>“Just about”</i> you say in a subdued voice, blinking a bit.");

		output("\n\n<i>“Good,”</i> she says softly, a hard emphasis on the D.");
		if(silly) output(" Much like this game in general, huehuehuehuehuehuehue.");

		output("\n\nShe lowers you down in a gentle fashion, enough that you can find your footing on your own. You thank her in turn. Then, she has a fiddle on the control panel. The white cylinder in the gravity field seems to bend and squash into a slightly rounder shape. An alert pops up.");
		output("\n\n<i>“<i>Warning, loads in excess of 1 Terran Tonne require added supervision.</i>”</i>");
		output("\n\n<i>“Ignore it,”</i> says a confident Mirrin, stepping onto the hovering pads with her hooves. You get a glimpse of the control panel: It reads 1372.3kg.");
		output("\n\n<i>Fuck</i>.");
		output("\n\nShe’s already oiled up, it seems. Her black top and shorts are slightly damp from it. She inhales deeply then begins her first push.");
		output("\n\nIt takes her 20 seconds to extend her limbs out fully. Through your tired out vision, her muscles seem to bulge to twice the size! She holds the pose for one second... two seconds... three... four... five...");
		output("\n\n<i>Scrcchh!</i>");
		output("\n\nYou see her black top burst forward from her chest! Instantly, she lets go of the bars and covers her E-cups. Apparently the failsafe stops everything from crushing people caught in it...");
		output("\n\n<i>“Shit!”</i> she shouts.");
		output("\n\nThis seems familiar...");
		output("\n\nShe steps off the pads, ventilating quite heavily. A sheen of sweat sticks to her now mostly bare body.");
		if(pc.isTreated()) output(" Goddamn, her smoky scent is stronger than ever... there’s that tell-tale twinge in your [pc.groin].");
		output("\n\n<i>“I am a *</i>huff<i>* fucking disaster zone,”</i> she says, somewhat vexed. You keep your eyes away from her chest, even though the temptation is real. She relaxes, putting her hands on her hips.");
		output("\n\n<i>“Still, how’d it look, Steele?”</i>");
		if(pc.isNice()) output("\n\n<i>“Very, uhm... very impressive,”</i> you say, desperately trying to keep your eyes on her face.");
		else if(pc.isMischievous()) output("\n\n<i>“Breast I’ve seen you do, I mean... best I’ve seen you do,”</i> you say, a little flustered.");
		else output("\n\n<i>“Your form was a little off,”</i> you say, your voice cracking a little on the last syllable. It’s also hard to hide the blush you’ve gained.");
		output("\n\nMirrin breaks into a laugh. <i>“You can look, you know,”</i> she grins, jiggling her chest a little. <i>“I’m gonna re-dress, then uh... let’s get grub, [pc.name].”</i>");
		output("\n\nHell yeah, tits and steak.");
		//PC gains +7 tone, +3 Physique and +1 Willpower. Gains ‘Sore’ and ‘Sweaty’ status effects.
		processTime(60);
		pc.lust(50);
		pc.modTone(7);
		pc.slowStatGain("physique",3);
		pc.slowStatGain("willpower",1);
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy(-50);
		IncrementFlag("MIRRIN_TRAINED");
		//[Food!]
		clearMenu();
		addButton(0,"Food!",foodWithMirrin);
	}
	//Repeatable Training
	//unlocks after PC has sex at least one time. 2 hours of ingame time passes.
	else
	{
		output("<i>“Heey Mirrin, can we do some training?”</i> You ask your dragon friend.");
		output("\n\n<i>“Always, Steele,”</i> she says back, eyeing your body all over. <i>“Let’s get you doing the whole works, yes?”</i>");
		output("\n\nShe sets her own weights down and points to the stretching mats. Getting into that familiar stance, you attempt to synchronize with your draconic trainer down to the detail with success. She adapts her speeds and positions for workouts that are comfortable for your bodyshape, spending extra time on working your thighs and glutes...");
		output("\n\nThen to weights: various types of squats, presses and deadlifts that work both of your upper bodies and midsections. Mirrin gives you extra support when tackling the last few sets, getting a little frisky with her hands and fingers on your sweating body.");
		output("\n\nFinally, some general cardio and more stretches: A few laps, a few kilometres on the treadmill, with Mirrin’s voice and direction guiding you all the way.");
		output("\n\nYou’re pretty tired but not worn just worn out yet. You’ve definitely worked up a proper sweat, however. You feel Mirrin’s hands on your [pc.hips]. <i>“So how about we go back to mine for more... training?”</i> she whispers.");
		//PC gains +2 tone, -2 thickness, +1 physique and +1 willpower. PC gains ‘Sore’ and ‘Sweaty’ status effects.
		processTime(60);
		pc.modTone(2);
		pc.modThickness(-2);
		pc.slowStatGain("physique",1);
		pc.slowStatGain("willpower",1);
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy(-50);
		IncrementFlag("MIRRIN_TRAINED");
		//[Her Place]* [Leave]
		//*Goes straight to [Her Place] dialogue/scene.
		clearMenu();
		addButton(0,"Her Place",visitMirrinsPlace,undefined,"Her Place","Into the dragon’s lair...");
		addButton(14,"Leave",leaveMirrin);
	}
}

//Leave
public function leaveMirrin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You decline, feeling that you’ve got what you’ve wanted for now. She smiles, says <i>“No worries,”</i> and gets back to her routine. You leave the room.");
	//PC goes to front of Ten Ton Gym.
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Food!
//These scenes play after each respective Training Session barring the repeatable one.
//tooltip: MEAT PUN.
public function foodWithMirrin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	moveTo("528");
	if(flags["MIRRIN_TRAINED"] == 1)
	{
		//1st Food! Scene
		//PC gains +3 thickness.
		output("You both head over to the Barbecue Pit, Mirrin in the lead. The walk is thankfully slow, enough for you to work out the excess energy and acid built up in your [pc.legs]. New Texas is balmy today, a little on the subdued side.");
		output("\n\nEntering the grill proper, ");
		if(flags["MET_HERMAN"] == undefined) output("the chef");
		else output("Herman");
		output(" gives you both a wave. Mirrin waves back while you’re scouting for seats. It’s a surprisingly quiet day in the eatery: Aside the sound of sizzling meat, there’s only a few voices around the slightly smoky room. <i>“I got this,”</i> Mirrin says, walking to the BBQ pit with a slight spring in her step. Her hooves make a certain <i>clack</i> on the tiled floor. She holds two fingers up to Herman. He gives her a smiling nod and holds up eight of his own.");
		output("\n\nYou’re seated in a fairly accommodating booth. Probably for the best, given how large the clientele tend to be. Like your dad used to say: ‘Everything’s appropriately sized in New Texas’.");
		output("\n\nMirrin saunters over with two beer bottles. She plops one down on your side and slides into the other seat. <i>“Not too long, Steele. You’re gonna love this,”</i> she winks.");
		output("\n\nNow’s a good a time as any to ask her about your performance.");

		//PC tone >70 and Physique >25:
		if(pc.tone > 70 && pc.physique() >= 25)
		{
			output("\n\n<i>“Solid, I’d say. Not quite professional level but you know your stuff,”</i> she says calmly, neutral in her tone. <i>“I think we’ll do well, at least.”</i>");
		}
		//PC tone between 30-69 and Physique 10-24:
		else if(pc.tone > 30 && pc.physique() >= 10)
		{
			output("\n\n<i>“Better than I expected, actually. You’ve got good control, I think we could make this work,”</i> she says with a positive inflection, although her face remains neutral.");
		}
		//else:
		else
		{
			output("\n\n<i>“Hmm, don’t think you did badly, but there’s a ways to go,”</i> she says bluntly. <i>“S’alright though, is what you’re here for, yes?”</i>");
		}
		output("\n\nYou’re a little relieved by her appraisal.");
		if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC) output(" <i>“I like your attitude about it too, it’s not just your words but your drive,”</i> she posits, rubbing her nose.");
		if(pc.thickness > 65) output(" <i>“That extra puff isn’t uhhh, doing much good for you though,”</i> she adds, pinching a bit of your shoulder fat. You’re not sure if you’re comfortable with that...");
		output("\n\nA ding chimes somewhere and Mirrin reflexively gets up and wanders over to the counter. She comes back with four different, <i>huge</i>, punnets of food balanced in her hands and arms. Placing them down, you see that <i>ho-lee shit</i>, it’s the works: Steak, ribs, fries, salad, all with their own side sauces.");
		output("\n\nTime to chow down! You both dive into different dishes. Your [pc.lipsChaste] are already wrapping round some sauce slathered ribs, the flame-blasted meat just falling into your mouth. There’s definitely enough to go around for two but you’re watching Mirrin and she’s... really going at it. The sides of her mouth have at least three different sauces dotted around already, and she’s got a chunk of steak resting in between her claws.");
		output("\n\n<i>“Fuckin’ *</i>slurp<i>* greatest place in the world,”</i> she says in between mouthfuls. ");
		if(pc.isNice()) output("You beam back at her, sensing a secret shared love: ");
		else if(pc.isMischievous()) output("You encourage her with a few ribs, realizing the shared secret you have: ");
		else output("You eyeroll at her enthusiasm but realize you’re enjoying the same thing: ");
		output("stuffing juicy meat into your mouth.");
		output("\n\nThere doesn’t seem to be much room to talk: It takes a straight twenty minutes for you to both clear out the food, although Mirrin definitely took the lion’s share. Your body’s going to be angry at you sooner rather than later... and Mirrin’s just out for the count. Slovenly hunched over, it seems she’s had more than she can handle. You wonder if she’s hiding something from you...");
		output("\n\n<i>“Can’t... </i>*huff*<i> fuckin’... </i>ertu að djóka<i>, I’m... so bad,”</i> she says, staring at the empty punnets. She slowly dunks her head on the table, her normally immaculate hair looking frazzled. You almost get grazed by her horns...");
		output("\n\nThinking that she’d probably be better off to take a breather before trying to move, you say your goodbyes. She’s laughing to herself but gives you a lazy wave anyway. Back to the ship!");
		processTime(40);
		pc.modThickness(3);
	}
	//2nd Food! Scene
	//PC gains +3 thickness.
	else if(flags["MIRRIN_TRAINED"] == 2)
	{
		output("You both make your way over to the grill, a little on the slow side. There aren’t many words said but there’s a few jokes to be made about some shy bull-boys gossiping about Mirrin.");
		output("\n\nWhen you enter, it’s at a busy time. The line is quite long and there even appears to be temporary servers dishing out meals. Still, Mirrin just walks up to the counter, gives the same sign to Herman as last time and comes back with two beers.");
		output("\n\nYou find a similar spot to last time, tucked away from most of the crowd. When she slides into her seat, you ask her about how she’s able to get prefered service.");
		output("\n\n<i>“Oh, uhh... Herman’s a </i>very<i> big fan. Very willing to help a girl out...”</i> she says, giving you a wink. <i>“Same with Quenton actually. You know, as far as low-level business deals go, New Texas has been... accommodating.”</i>");
		output("\n\nThe implication sounds sordid in the least.");
		output("\n\n<i>“Oh that reminds me, remember this?”</i> She asks, showing you the photo of you two from last time. It seems to have gone through even more stylizing, enough that you’re not even sure if that’s the real you in the picture. <i>“Watch.”</i>");
		output("\n\nShe taps on a few buttons, then puts it down. <i>“Promise, just watch,”</i> she says, a knowing grin on her face.");
		output("\n\nWhat sounds like a chorus of various different alerts fills the restaurant. The bulls - and a lot of the cows - pull out various handheld devices and open them up. Being a friendly bunch, they’re all showing each other with saucy grins and whistles.");
		//PC is kind:
		if(pc.isNice()) 
		{
			output("\n\n<i>“Uhm, what did I just see?”</i> You begin, not quite making the connection.");
			output("\n\n<i>“Hiding in plain sight,”</i> she replies, sniffing at the end of it.");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“So what, you’re a hacker too?”</i> You say with a laugh.");
			output("\n\nShe giggles, more feminine than her usual laugh. <i>“No, nooo. But it’s interesting, right?”</i>");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“Hm, surprised they even have extranet here,”</i> you say, trying not to sound impressed.");
			output("\n\n<i>“Oh Steele, so pious,”</i> she chides, then laughs.");
		}
		output("\n\n<i>“So... everyone’s a little odd around me. At least here, on New Texas. Other planets, ooh, waah, big celebrity, crowd, crowd, crowd,”</i> she begins explaining in her own special way. <i>“But uh... for whatever reasons, very few here want to talk to me. And yet... they all have my social media alerts. I just know that they’re gonna get home or have five minutes in the toilet and just blow their loads over all </i>this<i>,”</i> she says, pointing up and down her frame.");
		output("\n\nHow curious, you posit. There’s not much more that can be said in time as the food arrives.");
		output("\n\n<i>“Aw, all this </i>beef<i>,”</i> says a woozy Mirrin. It’s mostly the same as the last meal you had with her but the fries appear to be covered in some sort of cheese and gravy. You deal out a generous portion for yourself and tuck in.");
		output("\n\nMirrin seems to be eating slower than last time. You ask her about the sudden change.");
		output("\n\nShe stops mid-steak. <i>“Ey, so... obviously being this uhhh, jacked, you need pure physical matter to build yourself with. Buuut... I was also a compulsive eater when I was younger. Eh, I’m good at maintaining myself but I can just... eat and eat, until it comes back to bite me,”</i> she says, a little embarrassed. She even puts down her fingerful of diced steak.");
		output("\n\n<i>“Gah, what kind of personal trainer gorges in front of her client, eh? Enough for me,”</i> she concedes, downing a big glug of beer.");
		//PC is kind:
		if(pc.isNice())
		{
			output("\n\n<i>“I guess we’re both getting something out of this, right?”</i> You say to her, taking a swig with her.");
			output("\n\nShe eyes you for a second then raises her bottle. <i>“Hmm... good point, Steele. Cheers!”</i>");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“That’s right, you gotta be my role model, you slob,”</i> you joke, raising your bottle to her.");
			output("\n\n<i>“One of these days, Steele,”</i> she sighs, clinking her bottle with yours.");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“Maybe you’ve got more to learn than I do,”</i> you say, throwing back a swig of beer.");
			output("\n\n<i>“Jeez, you’re such a... </i>kúkalabbi<i>,”</i> she smiles, waving your statement away.");
		}
		output("\n\nYou finish off your fill of food in a short while, the weight of all that deliciously grilled meat slowing your body and mind right down. Mirrin’s finished too, just idly fiddling around with her dataslate while sipping on a last bit of beer.");
		output("\n\nAfter a day of emptying and then filling yourself again like the confusing person you are, you decide it’s time to return to the ship. You wave goodbye to your trainer. <i>“See ya, Steele,”</i> she says back, vaguely gesturing a wave with her hand.");
		processTime(40);
		pc.modThickness(3);
	}
	//3rd Food! scene
	//PC gains +3 thickness.
	else if(flags["MIRRIN_TRAINED"] == 3)
	{
		output("Although it’s all gone by, you both joke about the exploding bikini while you amble down to the Barbecue Pit. It’s made Mirrin more open and less aloof, you surmise, especially by the way she’s laughing at every joke - lame or otherwise - that you put forward.");
		if(silly) output(" She’s particularly enthralled about the time you got confused for the main character from a time-revered Terran porn novel.");
		output("\n\nThe eatery seems to be chugging along regularly today, even though there appears to be several trysts floating around the back of the room. Mirrin makes her usual gesture, Herman signaling back with a gesture you’ve never seen him do before. Hmm...");
		output("\n\nFinding a more open table closer to the serving counter, you immediately feel compelled to talk about today’s...happenings.");
		output("\n\n<i>“Jeez, I don’t mind the whole clothes thing it’s just... feeling all those bull’s eyes staring at us. Like holy shit, not everyone just gets their rocks off of as soon as they get their clothes off, you know?”</i> She starts, keeping a grin on her face.");
		output("\n\n<i>“Hmm, explains why there were loads of them though... see that bikini was a new model, very expensive, very exclusive. I was lucky to land that contract. Obviously, suppliers fucked up, doesn’t fit me at all. At least I got something to show the fans though.”</i>");
		output("\n\nShe shows you a picture of <i>that</i> pose where her meatsticks dangled very close to your mouth.");
		//PC is kind:
		if(pc.isNice())
		{
			output("\n\nYou pull a very embarrassed, flushed red face, crossing your arms close to your [pc.chest]. <i>“Jeez, I can’t believe you kept that...”</i> you timidly respond.");
			output("\n\nShe girlishly giggles - a rare thing for her - eyeing you while she rests her head on her palm. <i>“You’re adorable like that,”</i> she teases.");
			output("\n\n<i>“And send,”</i> she says out loud, tapping on her dataslate.");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“Oh my FUCK...”</i> you blurt out with exasperation, proceeding to bury your head in your arms on the table.");
			output("\n\nMirrin lets out a big belly laugh. <i>“Baha! Your </i>fokking<i> face! So precious!”</i>");
			output("\n\n<i>“And send,”</i> she says out loud, tapping on her dataslate. <i>Great</i>.");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“Oh you are <i>not</i> putting that online,”</i> you angrily say back, pointing right at her.");
			output("\n\n<i>“Already trendiiiing,”</i> she chimes melodiously, shaking the device in her hand. You slouch back with your head in your hands. <i>“Aw, you’re so cute like that, Steele...”</i> she teases.");
		}
		output("\n\nThere’s a ding and a cow-server comes by with food. She gives you both a wink, presenting just two big punnets of food: More cheesy gravy fries but also what looks like huge slab of pulled pork smothered in a dark glaze.");
		output("\n\n<i>“Eat up, babes,”</i> she winks to you both, then trots off with a wiggle of her hips.");
		output("\n\nMirrin is sitting there slack jawed. <i>“Hoooo... ly shit. I just... dibs!”</i> she calls out, stabbing it in the side with a disposable fork.");
		output("\n\nSo much for last session’s restraint...");
		output("\n\nYou jump into the substantially overstacked meal, the smoky sauce glaze is particularly friendly to your nose.");
		if(pc.isTreated()) output(" Something about it reminds you of the indescribably rich musk of your dragon trainer. Ooo, if only you could get that close again...");
		output("\n\nAside the sounds of enthusiastic noshing, you don’t say much to each other: This slab of juicy, thick meat just feels <i>so good</i> in your mouth!");
		output("\n\nMirrin finishes a mouthful. <i>“Just gonna grab another uhhh, beer, [pc.name],”</i> she says, twirling a finger.");
		output("\n\nShe gets her brewski quickly enough but a group of three shirtless bulls suddenly stand in her way. Huh... you cautiously get up to get a better look.");
		output("\n\n<i>“Heeeey, darlin’,”</i> you hear the biggest of the three say, a heavily bearded and bald alpha bull who’s only a few inches taller than Mirrin. He’s pretty much a beef mountain by the looks of things, a small pair of shorts being his only bit of clothing.");
		output("\n\n<i>“Me an’ the boys saw that there picture of you an’ yer friend over there,”</i> he says, eyeing you from behind Mirrin.");
		output("\n\n<i>“We got ta thinkin’: bet a she-bull like you ain’t had a proper ride! I’m sure ya friend has done you right afore but " + pc.mf("he","she") + " can’t give you what we got: Pure Texas beef™, </i><b>URNGH!</b><i>”</i> he boasts, posing with his chiseled guns.");
		if(pc.isBimbo() && pc.isTreated()) output(" He’s a proper bull alright and you’d be pulling down those useless shorts there and then if you could, just go get a taste...");
		output("\n\n<i>“Yeah, that’sa spirit, Doug!”</i> says a random voice behind him.");
		output("\n\nMirrin just stands there, leaning on a forward thrusted hoof. Her look is one of sheer incredulity. She places her bottle back on the counter.");
		output("\n\n<i>“Uh, whatsaname... Doug? Listen to me, Doug,”</i> she begins, a feigned note of friendliness in her voice. She slaps a particularly quick hand onto the bull’s bulging shoulder. He’s still smiling.");
		output("\n\n<i>“Here’s the thing...”</i>");
		output("\n\nYou see her slowly squeeze, claws dug into his muscle.");
		output("\n\n<i>“Sure, that sort of thing could work on any respectable cow...”</i>");
		output("\n\nVery visibly, his arm seems to tense and spasm. His face is contorted in pain and the speechless bull is gradually sinking to the floor.");
		output("\n\n<i>“But you <b>certainly</b>”</i> - did she just <i>growl?</i> <i>“are not on my level. Take your friends...”</i>");
		output("\n\nHe’s on his knee, desperately clutching at her unmoving, locked fingers.");
		output("\n\n<i>“And fuck right off.”</i>");
		output("\n\nShe lets go and instantly, the defeated bull staggers back with him and his cohorts backing out of the restaurant. <i>Wow</i>.");
		output("\n\nThe room has mostly turned quiet but Herman calls out <i>“Nothin’ ta see, folks! Come getcha grub!”</i>");
		output("\n\nNormalcy ensues.");
		output("\n\nGrabbing her beer, she swaggers back over to you with a look of pride. She slides into her seat like nothing happened. You follow her.");
		output("\n\n<i>“So...”</i> she says, hand on beer.");

		//PC is kind:
		if(pc.isNice())
		{
			output("\n\n<i>“Are... you alright? Is </i>he<i> alright?”</i> You inquire, a little anxious.");
			output("\n\nShe looks at you with somewhat tired eyes. <i>“Mmm, don’t worry about me. Or him, actually. It’s fine, [pc.name],”</i> she says with a weak grin.");
		}
		//PC is misch:
		else if(pc.isMischievous())
		{
			output("\n\n<i>“Jeez... you could crush a brick with those hands,”</i> you say with a hint of awe.");
			output("\n\n<i>“Not could; can,”</i> she says with a wink. <i>“He’ll be fine though, just something he’ll feel for a few days.”</i>");
		}
		//PC is hard:
		else
		{
			output("\n\n<i>“Are you insane? You could’ve ripped his damned arm off,”</i> you say, mixing concern with disbelief.");
			output("\n\n<i>“Literally asking for it,”</i> she says, downing her beer. <i>“Or not literally. Whichever.”</i>");
		}
		output("\n\nShe flares her nose and inhales deeply. <i>“Guy deserved it though. Don’t go mixing horny and dumbass, else that happens. Thankfully, New Texas is mostly just horny,”</i> she opines with a smirk. <i>“Hmm, although... sometimes those uhhh, amazon types are just begging for a fist. Especially that Zephyr nutjob or whatever her name is.”</i>");
		output("\n\nYou’re not sure on what version of ‘fist’ she means.");
		output("\n\n<i>Slurp</i> <i>“You know, I turned down her arm wrestle thing and she got </i>super<i> pissy. Eh, fuck it though,”</i> she finishes, leaving her empty bottle on the table.");
		output("\n\n<i>“Sorry you had to see that, Steele. All good?”</i>");

		output("\n\nYou nod, although you might have to talk more about it later. You say your goodbyes and leave for the ship.");
		processTime(40);
		pc.modThickness(3);
	}
	//4th Food! scene
	//PC gains -5 thickness. (for reasons)
	else
	{
		output("Your fun with the weird weights machine has left the both of you tired. Mirrin is back in her casual white bikini and shorts combo, her hoofsteps noticeably slow and a little unbalanced. Guess she’s not completely immortal...");
		output("\n\nThe grill seems surprisingly quiet again, although some sort of music plays in the background. It sounds like old Terran country... hey, at least it’s thematic.");
		output("\n\nYou’re not feeling so hot after the gravity machine of the gods or whatever it was messed with your sense of bodily awareness. Something easy on the stomach today, you suggest to Mirrin. She nods, idly rubbing her biceps.");
		output("\n\nYou find a familiar spot to sit in, the usual exchange between Mirrin and Herman going off without incident this time. Your [pc.belly] feels quite strained from today so you slouch a bit.");
		output("\n\nMirrin comes back with what appears to be two cocktails. <i>“Just something to say how cool today was. I don’t think the public’s going to use that machine for months,”</i> she says with some relief. You get the feeling that she’s more worn out from the test than she’s letting on.");
		output("\n\n<i>“Hey, listen for sec, I-”</i>");
		output("\n\nHer speech is interrupted by the shadow of a large figure from behind.");
		output("\n\n<i>“Heya, she-bull. Figured you’d be showin’ up round here,”</i> says a vaguely threatening, familiar voice. It’s that dumbass Doug from before.");
		output("\n\n<i>“Ahh, is just not my day...”</i> sighs your ");
		//PC has done [Talk] > [Race]: 
		if(flags["MIRRIN_RACE_TALKED"] != undefined) output("qilin friend.");
		else output("dragon trainer.");
		output(" She slowly rises to meet his eye level.");
		output("\n\n<i>“So what is it uhh, Doog? Need a shoulder massage?”</i> she sasses. <i>“I mean, I am pretty handy after all.”</i>");
		output("\n\nShe raises said left hand, inspecting each hooked claw in front of Doug’s full view.");
		output("\n\n<i>“I ain’t one to back down from a challenge no matta’ how tall the order,”</i> he boasts, grandstanding to the mostly empty restaurant. <i>“You just playin’ hard ta get, like all them uppiteh amazawns round heeyuh! No one can resist this absolute artistry of muscle and </i>POWAH, <b>UNGHH</b><i>!”</i>");
		output("\n\nHis friends pat him on the back in agreement. <i>“Now listen, she-bull. I can forgive ya. Lil’ bruisin on the arm ain’t nothin’ for this bronco. But,”</i> he stops, placing his right hand on Mirrin’s shoulder.");
		output("\n\n<i>Uh oh...</i>");
		output("\n\nShe slowly turns her head to look at his hand, and then to Doug’s shit-eating grin. Her face is <i>livid</i>. And... that sound is there, that deep, throaty rumble that you’ve only heard in truly mammoth creatures on the verge of crushing small furry mammals.");
		output("\n\nOut of nowhere, she suckerpunches him right in the guts!");
		output("\n\nThe effect is immediate. He buckles over her fist, grasping for something to hold on to. There’s no visible damage but his buddies go paramedic on the disabled bull. Only just able to hold himself up, he tries saying something even though he’s thoroughly winded. <i>“Lucky... shot... *<i>hnggg</i>*”</i>");
		output("\n\nThe three ne’er-do-wells hightail out of the eatery with the incapacitated Doug having to slowly limp out the door.");
		output("\n\nMirrin’s still visibly fuming. <i>“Fucking... fucking... <b>fucking</b>...”</i> you can hear her fume under her breath. Well, you have to say something!");
		if(pc.isNice()) output("\n\n<i>“Mirrin...? You’ve done all you need...”</i> you meekly say, placing a hand on her hip from behind. You can feel the raw tension in her muscles.");
		else if(pc.isMischievous()) output("\n\n<i>“Heeeey, big girl... time to reign it in,”</i> you say with a light-hearted tone. You place a hand on her hip. Even in that spot, you can feel the tension.");
		else output("\n\n<i>“That’s enough. He’s not coming back,”</i> you say sternly, conveying authority. You slowly place your hand on her hip.");
		output("\n\nShe turns to you, her posture relaxing when she looks at you ");
		if(pc.tallness > 80) output("at eye level.");
		else output("from above.");
		output(" She places a hand on your face, an affectionate look in her eyes. It only lasts for a moment. Abruptly, she starts walking to the door.");
		output("\n\n<i>“I have to go, I-I don’t want...”</i>");
		output("\n\nYou decide that it’s best not to follow her.");

		processTime(40);
		pc.modThickness(-5);
		//She’ll be unavailable for 48 hours of in game time, returning to her usual spot after that time.
		pc.createStatusEffect("MIRRIN_DISABLED");
		pc.setStatusMinutes("MIRRIN_DISABLED",(60*24*2));
	}
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

//Talk
//All dialogue options through [Talk] should grey out and become unavailable after being read through once
//tooltip: Surely there’s more to her than swole gains?
public function talkToMirrin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	//\/ \/ \/ Alternative one-off [Talk] scene after PC has completed [Training] four times and gone for [Food!] four times.
	//tooltip: Might be a good idea to see how she’s doing...
	if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_TREATMENT_TALKED"] == undefined)
	{
		output("Mirrin seems quite agitated, most likely due to the incident at the grill earlier. She suddenly drops her barbell mid rep, the very heavy object making a booming noise as it hits the dampening material below. At the same time, she buckles over somewhat and lets out a vicious roar. Not merely a shout, but a roar! Gryvain genes...");
		output("\n\nIgnoring the genuinely perturbed gym-goers around, you stand right behind her, ");
		if(pc.tallness > 80) output("placing a hand on her shoulder.");
		else output("tapping her on the arm.");
		output(" <i>“We should talk about this, ");
		if(pc.isNice()) output("I’m worried about you,");
		else if(pc.isMischievous()) output("you’re scary when you’re mad,");
		else output("you’re causing a goddamn scene,");
		output("”</i> you say, hoping that she’ll relent.");
		processTime(2);
		//unlocks [Treatment]
	}
	else
	{
		output("<i>“Fancy a break? ");
		if(pc.isNice()) output("I wanna know more about my personal trainer,”</i> you probe, scratching the back of your head.");
		else if(pc.isMischievous()) output("I gotta tap that big ol’ head of yours,”</i> you tease, matching her gaze with your own.");
		else output("Your posture’s slipping, you should have one,”</i> you say firmly, arms folded.");

		if(pc.isNice()) output("\n\n<i>“Alright, cute stuff”</i> she replies with a faint smile, finishing her last rep.");
		else if(pc.isMischievous()) output("\n\nShe stops mid rep. She raises an eyebrow, grins and then rolls her eyes. <i>“Sure thing, champ,”</i> she says.");
		else output("\n\nShe inhales sharply through her nose, stops mid rep and looks at your reflection. <i>“Might be right actually,”</i> she replies.");
		output(" She places the barbell on the floor with a dull <i>vumff</i> then takes a big glug of water.");

		output("\n\n<i>“Chat for a bit?”</i> she shrugs, taking a seat on a bench press nearby, said bench press creaking a little underneath her.");
		processTime(2);
	}
	//[Her] [You]* [Race] [Mods] [New Texas] [Treatment]** [Confidence]***
	//*Only available after PC has asked [Her].
	//**Only available after PC has completed [Training] four times and gone for [Food!] four times.
	//***Only available after PC has had sex with her at least once.
	mirrinTalkMenu();
}

public function mirrinTalkMenu():void
{
	clearMenu();
	if(flags["MIRRIN_TRAINED"] == 4 && flags["MIRRIN_TREATMENT_TALKED"] == undefined)
	{
		addButton(5,"Treatment",mirrinTreatmentTalk,undefined,"Treatment","It could actually be beneficial...");
		addDisabledButton(0,"Her","Her","Now’s not a good time...");
		addDisabledButton(1,"You","You","Now’s not a good time...");
		addDisabledButton(2,"Race","Race","Now’s not a good time...");
		addDisabledButton(3,"Mods","Mods","Now’s not a good time...");
		addDisabledButton(4,"New Texas","New Texas","Now’s not a good time...");
		addDisabledButton(6,"Confidence","Confidence","Now’s not a good time...");
	}
	else
	{
		if(flags["MIRRIN_HER_TALK"] == undefined) addButton(0,"Her",askMirrinAboutHer,undefined,"Her","Get to know the curious hybrid.");
		else addDisabledButton(0,"Her","Her","You’ve already had this conversation.");
		if(flags["MIRRIN_YOU_TALK"] == undefined) 
		{
			if(flags["MIRRIN_HER_TALK"] != undefined) addButton(1,"You",talkToMirrinAbootYuuuu,undefined,"You","You showstopper, you.");
			else addDisabledButton(1,"You","You","You should probably talk about her first.");
		}
		else addDisabledButton(1,"You","You","You already had this talk.");

		if(flags["MIRRIN_RACE_TALKED"] == undefined) addButton(2,"Race",talkAboutMirrinRace,undefined,"Race","You wonder what she considers herself now.");
		else addDisabledButton(2,"Race","Race","You already talked about this.");

		if(flags["MIRRIN_MODS_TALKED"] == undefined) addButton(3,"Mods",mirrinModsTalk,undefined,"Mods","Those TF’s seem pretty extensive.");
		else addDisabledButton(3,"Mods","Mods","You already talked about this.");

		if(flags["MIRRIN_NT_TALKED"] == undefined) addButton(4,"New Texas",talkAboutNewTexas,undefined,"New Texas","Ask her about New Texas.");
		else addDisabledButton(4,"New Texas","New Texas","You already talked about this.");

		if(flags["MIRRIN_TREATMENT_TALKED"] == undefined) addDisabledButton(5,"Treatment","Treatment","She isn’t ready to talk about this yet.");
		else addDisabledButton(5,"Treatment","Treatment","You already talked about this.");

		if(flags["SEXED_MIRRIN"] != undefined && flags["MIRRIN_CONFIDENTED"] == undefined) addButton(6,"Confidence",mirrinYerConfidenceBaaaaaeby,undefined,"Confidence","Give her a much-needed boost of confidence.");
		else addDisabledButton(6,"Confidence","Confidence","Now’s not a good time...");
	}
	addButton(14,"Back",repeatMirrinApproach);
}

//Her
//tooltip: Get to know the curious hybrid.
public function askMirrinAboutHer():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("<i>“Well, I don’t know much about you,”</i> you begin, leaning against a nearby pillar. <i>“Start from the top, I guess?”</i>");
	output("\n\n<i>“Hmmm...”</i>");
	output("\n\nScratching the underside of her jaw, she begins <i>“So, the name is Mirrin Arkosduttir,”</i> and ");
	if(pc.IQ() > 50) output("you already need a second to process the jumble of syllables into a name you can repeat. <i>“Arkos...duttir?”</i> You say under your breath.");
	else output("you immediately blank at the deluge of unfamiliar sounds coming out. <i>“Wha...?”</i> You say with an open mouth.");
	output("\n\nShe grins, stifling a laugh through her nose. <i>“Yah, yah I know. So like, my father’s name was Arkos Arkossonne and where I grew up, you take the uhh, paternal name first and change it for gender. So, I’m Arkosduttir,”</i> she explains, taking a second to find the right word.");
	output("\n\n<i>“Anyway,”</i> she continues, resting her elbows on her knees, <i>“so technically I’m... Terran, I suppose. Born there, raised there, schooled there and also very happily left there.”</i> She flares her nostrils and takes a swig of water from a closeby bottle.");
	output("\n\n<i>“Not quite all of it. My mother, father? Other father... no, mother,”</i> is what she finally gets to, punctuating each title with a finger gesture. <i>“She’s gryvain. Hence uhhh, most of this,”</i> she grins, pointing from her top to her bottom. You follow those movements with your eyes, another opportunity to get a good look at her imposing structure up close.");
	output("\n\n<i>“Childhood didn’t suck, although father was usually... not there. He was rich as hell come to think of it but apparently industrial building supplies ‘make the bread’,”</i> she explains, that last butchered phrase making you raise an eyebrow.");
	output("\n\n<i>“He was alright, I guess. My mother... kind of the same. Money does things, you know?”</i> She looks at you for affirmation. ");
	//PC is Pampered:
	if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_PAMPERED) output("You, of course, couldn’t imagine a life without all that sweet, <i>sweet</i> money from daddy but you nod away in agreement.");
	else output("You think to the stories of your own dad galavanting about space, getting junked up on mods and easy lays, desperately wishing that ‘special’ childhood could be conveyed in the straight faced nod you give her.");
	output("\n\n<i>“Yah, so”</i> <i>swig</i> <i>“being a Terran-mongrel in a fancy Terran school for Terrans was fun,”</i> comes the sarcastic blurb, her arm closest to you flexing and contracting as if to work off some tension. <i>“Were you ever 6’ tall at twelve years old, covered in scales and able to rip down a fucking wall in your teens?”</i> She seems to sincerely ask, nostrils flared. The grip from her red-scaled, clawed hand seems to be a little tighter on that water bottle.");
	//PC has Half-Gryvain as starting race:
	if(pc.originalRace == "half-gryvain") 
	{
		output("\n\n<i>“Mmm, something like that,”</i> you say, pointing out features you inherited from your mother.");
		output("\n\n<i>“Then you know, it’s crazy how much uuuuh, arousal you get at that age! And then you have to deal with all those genes hating each other...”</i> she finishes with a flair of anger, aghast at remembering her troublesome teens. You blush a little as your gryvain body remembers what she means.");
	}
	//else:
	else
	{
		output("\n\nYou shake your head and smile weakly, a confusing image flashing through your head of an angsty she-dragon punching a brick wall.");
		output("\n\n<i>“It sucked! Had to spend three weeks a year in bed getting off to boring Terran porn...”</i> she finishes with frustration in her composure, exasperated at remembering her troublesome teens.");
	}
	output("\n\nIt seems like a good moment to console her. You put your hand on her knee.");
	//PC is kind:
	if(pc.isNice())
	{
		output("\n\n<i>“I’m sorry it was difficult, are you alright, Mirrin?”</i> You console with sincerity.");
		output("\n\nShe looks straight into your eyes, grins and pats your hand. <i>“Nah, nah, don’t worry, just me getting worked up. It’s all uuuh, behind me,”</i> she says calmly.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Oh gods, being so </i>horny<i> every day, must’ve been just </i>dreadful<i>,”</i> you sarcastically tease. She effeminately giggles, a bit of a turn for her.");
		output("\n\n<i>“I gueeess,”</i> she concedes, tapping you on the shoulder. Tapping - in this case - being closer to almost shoving you off the bench.");
	}
	//PC is hard:
	else
	{
		output("\n\n<i>“Sucks,”</i> you flatly state, accompanying it with a hard squeeze of her knee.");
		output("\n\nShe shakes her head. <i>“Is nothing, just bullshit,”</i> Mirrin replies, taking another swig.");
	}
	output("\n\n<i>“Enough about that though, all history. So basically, school, then I didn’t really know what to do with myself. I did young person stuff. Travel everywhere, you know. Or really just Eastern Asia,”</i> she states, placing her water bottle down and playing with her ponytail. <i>“I just... got really into a thing one day. That became more of a uhhh, life goal. I loved the tales of ancient dragons with power and strength weaving their way through the chaotic lives of mortal folk. I guess I tried to be like that,”</i> she finishes.");
	output("\n\nYou convey how ambitious that must have been.");
	output("\n\n<i>“Fuck yah! I had to make a lot of quick money... luckily, there’s always a market for ‘exotic’ modelling so some friends of friends got me a decent start in it all. Aside from the actual mods, it’s all been a blur since then. Being famous in places and being unknown in others. Everyone’s scared to talk to you but you just know they’re jackin’ it to your latest pictures,”</i> is her disdain-fueled reply. <i>“Still, I’ve had my share of fun. When my naked picture is on every wall around town on every nearby planet, it’s easy to get laid, get booze, forget it all. Glad I stuck to body building...”</i>");
	output("\n\n<i>“Ehh, less about me though, tell me about you.”</i>");
	processTime(30);
	flags["MIRRIN_HER_TALK"] = 1;
	//disable button, mark read.
	mirrinTalkMenu();
}

//You
//tooltip: You showstopper, you.
public function talkToMirrinAbootYuuuu():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You go with her original question.");
	output("\n\n<i>“Well...”</i> you begin, starting with your parents, childhood and so on. You talk about your career as [pc.aStartingCareer] and the early exploits you’ve gone through, the planets you’ve seen, the locals you’ve... become <i>very</i> familiar with. Mirrin laughs with her hand over her mouth at some of those tales.");
	output("\n\nThe talk quickly shifts to the mess surrounding your inheritance of SteeleTech, the mention of which makes the attentive Mirrin raise an eyebrow.");
	output("\n\n<i>“That’s you?? I thought Steele was just a common name. But holy <i>shit</i>, that’s actually pretty baller,”</i> she exclaims, inching ever so slightly closer to you. <i>“So what, you’ve got your ship here and just do anything anywhere being the baddest ass?”</i>");
	output("\n\nMy ass isn’t <i>that</i> bad, you think to yourself. Oh wait.");
	output("\n\n<i>“Uh, yes! At the minute, I’m trying to out-do my cousin,”</i> you say, ‘cousin’ said through gritted teeth, <i>“and we’ve got this whole ace space-race...? Going on.”</i>");
	output("\n\nWas that intentional?");
	output("\n\n<i>“Sounds like a hell of a life. Must have some good friends, no?”</i> She asks, a little bit of curiosity in her voice.");
	output("\n\n<i>“Yes, on my ship actually, I’ve got ");
	if(annoIsCrew()) output("Anno, she’s pretty spunky, ");
	else if(celiseIsCrew()) output("uhh, Celise, a pile of... goo, ");
	else if(reahaIsCrew()) output("Reaha, pretty sweet cow, might be familiar, ");
	else if(yammiIsCrew()) output("Yammi, she actually worked at that shop across the road, ");
	else if(gooArmorIsCrew()) output("[goo.name], who’s... a trip,");
	else if(seraIsCrew()) output("Sera, my personal toy,");
	else output("uh, ");
	output("mmm...”</i>");
	output("\n\nYou tap your head for names of other people you’ve run into.");
	output("\n\n<i>“Interesting,”</i> the she-draconid responds, a pensive look on her face.");
	output("\n\n<i>“How about you? Any special people in your life?”</i> You ask ");
	if(pc.isNice()) output("sincerely.");
	else if(pc.isMischievous()) output("with added emphasis on ‘special’.");
	else output("as an afterthought.");

	output("\n\n<i>“Ehhhhh... rather not say,”</i> she says slowly. <i>“Anyway, breaks over, want to get back to it?”</i>");
	output("\n\nWell that’s rather abrupt.");
	processTime(20);
	flags["MIRRIN_YOU_TALK"] = 1;
	//[Training] [Later]
	clearMenu();
	var momsSpaghetti:String = "";
	if(silly) momsSpaghetti = ".. mom’s spaghetti.";
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(0,"Train","Train","You’re too tired for a training session.");
	else addButton(0,"Train",repeatableMirrinTraining,undefined,"Train","Time to make ya palms get sweaty, knees weak." + momsSpaghetti);
	addButton(1,"Later",laterMomsSpaghetti,undefined,"Later","Mom’s spaghetti won’t wait forever.");
}

//Later
//tooltip: Mom’s spaghetti won’t wait forever.
public function laterMomsSpaghetti():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You stand up to your full height, stretching your [pc.feet] and [pc.legs]. You even give your [pc.hips] a good old spin. <i>“Gotta scoot, I’m afraid.");
	if(pc.isNice()) output(" I enjoy this training so much, I’ll be back soon!”</i> You finish.");
	else if(pc.isMischievous()) output(" I’ll be fittin’ this fitness in my business schedule,”</i> you finish with a wink and a grin.");
	else output(" Might be back later,”</i> you say cooly, dusting yourself down.");
	output("\n\nMirrin waves in response. <i>“Be a stranger! Or don’t be. Which? Nevermind,”</i> she fumbles, getting up to jump into more exercise.");
	processTime(2);
	//[Next]
	//PC returns to front of gym.
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Race
//tooltip: You wonder what she considers herself now.
public function talkAboutMirrinRace():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You posit a potentially delicate question. You trust in your SteeleCharm™.");
	output("\n\n<i>“So what exactly... </i>are<i> you?”</i> you say apprehensively. <i>“It’s just... I’ve never seen anyone as unique as you,”</i> you add, scrambling for diplomacy.");
	output("\n\nMirrin just laughs. <i>“Yah, guess I sort of stand out in crowd of horned, muscled beasts, right?”</i> She says, briefly admiring her reflection as a horned, muscled beast. <i>“S’alright though, I’ll try my best with this.”</i>");
	output("\n\nYou begin with <i>“You said you’re Terran ‘technically’?”</i>");
	output("\n\n<i>“Yah. Well... about half, a little bit less than half terran. That whole side is screwy, trust me,”</i> she assures you. <i>“Human father, gryvain mother. It was kind of mutual for them, if I remember. Younger me looks very different to current me,”</i> Mirrin recalls, re-adjusting her ponytail bindings. Her densely packed, contracted bicep flexes and twists as she does, hidden tendons and muscles seem to jump underneath her taut skin. You feel a hypnotic pull as you watch them work.");
	output("\n\n<i>“Some few problems can happen with those types of births so even before I was born, I had gene mods and expression controls fucking around with my uuuh, body,”</i> she explains in a straight manner, some of her phrasing being a bit... Mirrin-ish.");
	output("\n\n<i>“So I got human skin, face and lungs. Then gryvain parts. Scales, claws, height, and so on. It’s what’s on my birth certificate anyhow.”</i>");
	output("\n\n<i>“And now? You’re quite far gone from either,”</i> you ask with curiosity.");
	output("\n\n<i>“So like, in what was known as Ancient China so and so many millennia ago, a myth around a certain creature came about, yadda yadda. It was called a qilin. Said to be incredibly auspicious, ordained by the spirits to choose worthy emperors,”</i> she recalls whimsically, her distracted eyes gazing up somewhere. <i>“I just couldn’t get it out of my mind. Terra actually having an analogue for gryvain! Or what Terrans call gryvain, anyway,”</i> she smirks, briefly glancing to you as she does.");
	output("\n\n<i>“Once I had a design, it was merely about the money. I liked the pottery of that same period of Chinese history, so... skin,”</i> Mirrin shows you a clay-red forearm. <i>“And the obsession with... carved jade happened too,”</i> she continues, stroking both of her ornate dragon horns. You notice her biting her lip as she does...");
	output("\n\nShe quickly regains her train of thought. <i>“Horse stuff is easy, just controlled pills. So, legs, hair, tail, hooves... it did also make me a little slow in the memory, though.”</i>");
	output("\n\nThat explains why she has pauses and weird phrasing in her speech. She sticks a double jointed, equine leg forward, swiveling a jade hoof around.");
	output("\n\n<i>“And other things,”</i> she adds, her knees rubbing together briefly. You note the squeeze it has on her bulge...");
	output("\n\n<i>“So yah, I’m Mirrin, I’m a qilin. Or at least, something like it,”</i> finishes Mirrin, a satisfied look on her face.");
	processTime(15);
	flags["MIRRIN_RACE_TALKED"] = 1;
	mirrinTalkMenu();
}

//Mods
//tooltip: Those TF’s seem pretty extensive.
public function mirrinModsTalk():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You jump off the bridge she built. <i>“So, horse mods? What else did you use?”</i> you inquire.");
	output("\n\nMirrin straightens herself up, dusts herself down and clears her throat. It reminds you of a particularly proud museum curator.");
	output("\n\n<i>“Right, so... Skin. And by extension, scales,”</i> she begins, putting her right hand on her left forearm. <i>“An offshoot of Rainbowtox. A contact in pharmaceuticals narrowed it down to uuuh, a washed out color palette. Happy with red, would’ve preferred slate-blue. Hair,”</i> she grabs a hold of her ponytail and actual pony tail with a smug grin. <i>“Au natural. Only change is some parts are a bit green.”</i>");
	output("\n\nShe holds one of her legs up, bending it so it rests on the opposite knee. She points to one of her slightly over-sized hooves. <i>“These were hard. So like... When I was describing how I wanted it to work to the pharmacy guy, he explained what he was going to use and it was such a complex chemical name. Beta-xenophylenophena-something-or-other. Worked it real good but fucking. Expensive. Same with these beauts,”</i> she’s holding one of her horns again. <i>“Took a while to grow but they’re just perfect.”</i>");
	output("\n\nLooking at both horn and hoof properly, the detail is staggering. Almost translucent, you could imagine that a particularly strong light would irradiate her crown of horns with a green glow.");
	output("\n\n<i>“How about the horse, er, bits?”</i> You say, idly fidgeting with your [pc.hair].");
	output("\n\n<i>“Like I said, pills. Pricy ones, though. I had the effects tailored to what I wanted. None of that overly ticklish foot shit anymore,”</i> she continues, shuffling her feet around a bit at the thought.");
	//PC has read Codex:
	if(CodexManager.entryViewed("Gryvain")) output(" You recall that gryvain tend to have extremely sensitive feet, perhaps it became difficult to train with them?");
	output("\n\n<i>“Fucking... estrus cycles.”</i>");
	output("\n\nShe seems to be genuinely happy with getting this off her chest, perhaps almost as happy as you’d be getting her <i>clothes</i> off said chest. You stow that thought for later...");
	output("\n\n<i>“So yah, cut down on that shit too. I mean, things are a little colder down here,”</i> she comments, casually tapping her tightly bound bulge like it ain’t no thing. <i>“At least I’m not ruining yet more pants from fucking... stepping on the soft grass! Could be worse though. Could be some cow getting drowned in my own juice from sniffing a sock or some silly shit,”</i> she finishes, chuckling away.");
	if(pc.isNice()) output("\n\nYou smile as she lets her figurative hair down.");
	else if(pc.isMischievous()) output("\n\nYou laugh along with her.");
	else output("\n\n<i>“Can say that again,”</i> you add, a wry grin spreading across your face.");
	output(" She’s a little bit more loose towards you now...");
	if(flags["SEXED_MIRRIN"] != undefined)
	{
		output("\n\nOne more thought crosses your brainwaves: Why does she have <i>two</i> dongers?");
		output("\n\nShe shrugs. <i>“It just happened, really. Gryvain plus enough of the right mods all going crazy inside. I don’t really want to remove them...”</i> she replies, shuffling about.");
		output("\n\n<i>“Using them is still... normal, just using one sometimes sets the other off unintentionally. And I often... tend to make a mess.”</i>");
		output("\n\nInteresting that she’s so candid about it.");
	}
	processTime(30);
	flags["MIRRIN_MODS_TALKED"] = 1;
	mirrinTalkMenu();
}

//New Texas
//tooltip: Issa not so bad, issa nice place.
//PC automatically gains +50 lust.
public function talkAboutNewTexas():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You ask her about staying on New Texas and what she thinks of it.");
	output("\n\n<i>“Ah, fantastic beef,”</i> she says with a joyous gasp. <i>“I could spend a week in the local grills, gorging on all this... </i>meat<i> and ruining my abs forever.”</i>");
	output("\n\nHer face implies she’s dreaming of personal heaven, although the mention of ‘meat’ reminds you of the ever-tempting, ever-horny bulls and cows that flit and float around you in the gym.");
	output("\n\n<i>“Of course, they’re all cows here, so like... is it uhhh, cannibalism? Fake beef? You know, best if I don’t ask that,”</i> she rushes, quickly downing half a bottle of water. There’s - naturally - a bit of an awkward silence.");
	output("\n\n<i>“So yah, uhm, it’s nice. Like Earth. Bit cold sometimes,”</i> she sniffs. <i>“Kinda handy that it looks nice, means I can do all my photoshoots here. Gym is... a big bonus. People are kind enough, perhaps too kind.”</i>");
	output("\n\nDefinitely something you can attest to.");
	output("\n\nYou probe her on why she doesn’t seem to talk to many people around her, finding it curious that this known fitness model seems actively shunned by locals known for their friendliness.");
	output("\n\n<i>“Mmmm... they expected something different, I think. Gryvain smell it when you’re horny. These people are </i>always<i> horny. So they put two and two in the basket, think that I’m just as up for it as they are. Literally everyone: Bulls, cows, the big girly ones, small manly ones...”</i>");
	output("\n\nShe shakes her head.");
	output("\n\n<i>“It’s not how I work though. I didn’t want to be cock hungry all the time, so I uuuh, dulled my drive with mods. I can’t really smell their pheromones either, somehow. So, they have to talk more about what they want, find out I’m not interested either way and then walk away with these droopy faces...”</i>");
	output("\n\nShe mimics said droopy face. <i>“Not my problem,”</i> she finishes. You sense that it’s more complicated than that.");
	output("\n\n<i>“Anyway, up for some exercise?”</i>");
	processTime(30);
	pc.lust(10);//Fen note: this is less than 50 because this doesn’t seem like a +50 scene.
	flags["MIRRIN_NT_TALKED"] = 1;
	clearMenu();
	var momsSpaghetti:String = "";
	if(silly) momsSpaghetti = ".. mom’s spaghetti.";
	if(pc.energy() < 50 || pc.isWornOut()) addDisabledButton(0,"Train","Train","You’re too tired for a training session.");
	else addButton(0,"Train",repeatableMirrinTraining,undefined,"Train","Time to make ya palms get sweaty, knees weak." + momsSpaghetti);
	addButton(1,"Later",laterMomsSpaghetti,undefined,"Later","Mom’s spaghetti won’t wait forever.");
}

//Treatment
//tooltip: It could actually be beneficial...
public function mirrinTreatmentTalk():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You’ve got the ‘incident’ from the restaurant still in your mind, now’s a good as time as any.");
	output("\n\n<i>“So about the whole ‘burst of rage’ thing,”</i> you begin ");
	if(pc.isNice()) output("slowly.");
	else if(pc.isMischievous()) output("haphazardly.");
	else output("authoritatively.");
	output("\n\n<i>“Yah, yah... I lost my shit,”</i> she concedes, sitting down on the bench press. <i>“It’s frustrating. Like, they’re talking on a level I can’t even follow. Doesn’t help that I’m all... pent up,”</i> she sniffs, her knees and thighs briefly rubbing together. <i>“And that fucking bull and his dumb shit... how do these women even like that sort of thing?? It makes no sense, I just...”</i>");
	output("\n\nShe quickly clears her throat. <i>“Sometimes I just want to be able to go for it. Say ‘yeah, let’s bang ok’. Can’t do it. I can’t get that excited so easily. I get pent up cuz I just can’t truly connect with anyone here. You know, they just take everything so easily, it’s not precious or special. I guess I’d have to be thinking at their level to understand...”</i>");
	output("\n\nA crazy thought crosses your mind. <i>“What if </i>you<i> get the Treatment, Mirrin?”</i>");
	output("\n\nShe looks directly at you as if you’ve just vomited all over her chest.");
	output("\n\n<i>“I... no. Just no. I need an on and off switch not an ‘always on’ switch. Plus, I don’t want to end up like Doogle or whatever, just sticking my dicks in everything that shows a bit of leg. Then it’s gonna ruin all my hard earned mods,”</i> she says listlessly, despairingly grasping one of her ornate jade horns.");
	output("\n\nYou think back to the restaurant, the way she touched your face. You remember the way she’s been teasing you, flirting you, letting you into her life bit after bit. She needs relief and you’re the best person for the job right now. Plus, ya know, dragon-tits...");
	output("\n\n<i>“I can help you, ya know,”</i> you say charmingly, placing your hand on her tensed up thigh. ");
	if(pc.isNice()) output("You give her your ‘sincere and sweet’ face, biting your [pc.lip] as she looks at you.");
	else if(pc.isMischievous()) output("You bite your [pc.lip] along with that rehearsed cheeky grin, inching your [pc.face] closer.");
	else output("You stare her down with authoritative [pc.eyes], firmly squeezing her rock solid quads.");

	output("\n\nHer eyes widen. <i>“[pc.name], I...”</i> her chest is visibly heaving and it’s not from the exercise. <i>“I shouldn’t. I mean, we’re friends and...”</i> she trails off. She firmly grips you by the wrist and quickly removes your hand from her thigh. She suddenly stands up, her expression becoming more neutral.");
	output("\n\n<i>“I need to think. I have to... do something. Can you meet here later?”</i> she asks, looking down at her hands. As soon as she finishes, she’s already hurriedly walking to the exit of the gym. Looks like you’ll have to see how this pans out.");
	processTime(20);
	flags["MIRRIN_TREATMENT_TALKED"] = 1;
	clearMenu();
	addButton(0,"next",mainGameMenu);
	//She’ll be unavailable to interact with for 72 in game hours, after which she’ll return to the Ten Ton Gym. Completing this scene unlocks [Her Place] i.e. sex stuff.
	pc.createStatusEffect("MIRRIN_DISABLED");
	pc.setStatusMinutes("MIRRIN_DISABLED",24*60*3);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Hmm...
//First sex scene. One-off. 
//tooltip: You wonder where this is heading...
public function mirrinFirstTImeOneOffSex():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	moveTo("MIRRINS");
	output("She gestures her hand towards the gyms exit, intending for you to go first. She follows behind you and you can hear her inhaling and exhaling rather deeply. You wave to the staff members on your way out, Quenton especially giving you a wink and a toothy smile. Mirrin doesn’t seem to react at all, merely keeping by your side as you both exit.");
	output("\n\nAs you leave, she begins talking to you from behind.");
	output("\n\n<i>“So... New Texas is all business for me. At least, I hoped it would be. Stay here a few years, expand the fanbase, try other things... that mostly turned out ok. But it’s so </i>lonely<i>. Almost everyone here is like uhhh, always horny or really close to it. They see me - this extranet famous model - and it’s like a competition. They all get in my face, can’t stand it. Doesn’t help that their Treatment or whatever just doesn’t react with me,”</i> she says, rather matter-of-factly.");
	output("\n\nYou nod along for the most part, acknowledging what she says.");
	output("\n\n<i>“And uh, well... you’re really the only person to just not be a brick wall about it. Ehh, this is all making me sound so fucking </i>weak<i>,”</i> she says, abruptly stopping along the pavement. Hang on...");
	//PC is kind:
	if(pc.isNice())
	{
		output("\n\n<i>“No, not at all. How could you be? Ya big muscle girl, you,”</i> you say with a smile, grabbing onto one of her hands. <i>“Maybe a bit brickheaded sometimes,”</i> you chuckle.");
		output("\n\nShe smiles too but doesn’t look at you. Still, you feel her gentle squeeze from held hands.");
	}
	//PC is misch:
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Oh come ooon, you floored a guy just by patting him on the shoulder! You’re a badass,”</i> you laugh, pulling on her arm.");
		output("\n\nShe smiles but doesn’t look at you. She does pat you on the shoulder in return, however.");
	}
	//PC is hard:
	else
	{
		output("\n\n<i>“Oh don’t talk crap. You almost broke a guy in half and had the will to do so,”</i> you say with admonishment, wishing she’d see the simple truth.");
		output("\n\nShe smiles at you, crossing her arms. <i>“That’s a good point, actually...”</i>");
	}
	output("\n\nYou both return to ambling along, a little bit of small talk here and there. You notice that she very subtly guides you along to wherever it is you’re going but very soon, you come face to face with a building that seems sort of out of place.");
	output("\n\nIt’s still in the ‘ranch’ style of some of the bigger houses on New Texas but it’s surrounded by a brick wall. A lone human guard in a flowery shirt and shorts stands outside it. He’s huge but strangely, he doesn’t seem Treated. <i>“Heya, Brescoe,”</i> waves Mirrin. The man just gives her a nod. The wooden gates to the house slowly open automatically and you both enter.");
	output("\n\nThe inside of the house is open plan. Pretty much everything is one giant room, separated only by structural pillars. Can’t see any open toilets, however. You note that it’s rather plainly decorated. The walls are pure white and there’s some minor wood panelling for detail but the furniture is spartan and practical over aesthetically interesting. That said, there is a huge series of door-windows at the very back, illuminating most of the place with natural sun rays. There are some stands with what appear to be ancient Terran weapons - including a <i>guandao</i>, an ancient, curved-blade spear - most of them in pristine shape. And of course, several plinths with carved jade statues of dragons and other mythical creatures. Well, she’s certainly consistent...");
	output("\n\nThere’s a particularly large bedroom ‘area’ in the far right corner of the place. It looks cozy despite its spartan appearance. There’s home-gym equipment dotted about, which Mirrin leads you to by the hand. Your body feels a flutter all over while");
	if(pc.isCrotchExposed() && pc.isChestExposed() && pc.isAssExposed()) output(" your skin gets goosebumps all over...");
	else output(" your [pc.gear] seems a bit heavier than normal...");

	output("\n\nWithout a word, she’s got her hands all over you. ");
	if(pc.isCrotchExposed() && pc.isChestExposed() && pc.isAssExposed()) output("She shows no restraint towards your bared body");
	else output("She - with a forceful urgency - undoes your [pc.gear], setting it aside on the floor");
	output(". ");
	if(pc.tallness > 80) output("She’s not giving you any eye contact but instead pauses to stare every so often, taking in every aspect of your physique. She certainly seems interested in your [pc.groin]....");
	else output("The qilin treats you more like a doll than anything, placing hands here and there all over. She’s almost invasive but you’re not sure that it’s wise to resist... she puts a rough palm in the middle of your [pc.chest], spending a few seconds just holding it there.");
	output(" Is she inspecting you? It’s a bit bizarre...");
	output("\n\n<i>“Hm...”</i>");
	output("\n\nMirrin takes a step back, leaving your naked self to awkwardly stand in the middle of the space. <i>“Should I...”</i> you begin, your speech cut off by Mirrin’s gesture.");
	output("\n\n<i>“The ground rules: You follow me and only me. What I say goes. If you need a break, then I may allow it,”</i> comes the authoritative reply. ");
	output("\n\nWith that, you’re pushed onto the awaiting, plush bed behind you. She pulls her black shirt up over her head, revealing her smooth, springy E-cups. Not that you weren’t familiar with them anyway. She squeezes them between her python-like biceps, ensuring you get a good view.");
	output("\n\nStill a tease.");
	output("\n\nMoving closer, she digs a claw into the back of her skintight shorts and there’s an audible rip. They just slide to the floor, exposing your hard-earned prize: two flaccid, monster members!");
	output("\n\nYou try to sit up to get a closer look but she’s on to you. Literally. With a firm - but not forceful - push of her palm, you’re on your back. With your [pc.legs] dangling off of the edge, she clambers onto the bed, a few audible creeks here and there.");
	if(pc.tallness < 80) output(" She’s just <i>huge</i> this close up. You seem more outclassed than ever...");
	output("\n\nShe’s on top of you like a predator about to finish off its prey. She takes a second to undo her ponytail and her unbound, silver-jade hair flows down her neck and shoulders all the way to your [pc.chest]. It’s more coarse than it looks, tickling your [pc.skinFurScales] something fierce. She leans in, just inches from your [pc.lips].");
	output("\n\n<i>“So... what do I do with you, hm?”</i>");
	output("\n\n<i>“Uhhh”</i> you begin, but then she presses her lips to your open mouth, locking you both into a kiss. <i>Mmmhmm</i>.");
	if(pc.isTreated() && pc.hasGenitals()) 
	{
		output("\n\nThat aroma is back: smokey, throat tickling, warm musk... you feel your");
		//PC has both:
		if(pc.isHerm()) output(" [pc.cocks] rise and your [pc.biggestVagina] wetten");
		else if(pc.hasCock()) output(" [pc.cocks] rise");
		else output(" [pc.biggestVagina] wetten");
		output(" in response.");
	}
	else
	{
		output("\n\nYou can feel her warmth for you brush against your body, making your ");
		if(pc.isHerm()) output("[pc.cocks] rise and your [pc.biggestVagina] wetten");
		else if(pc.hasCock()) output("[pc.cocks] rise");
		else output("[pc.biggestVagina] wetten");
		output(" in response.");
	}
	output("\n\nShe’s rather gentle, placing both hands round your jaw. Still, you can’t shake the feeling that... <i>oh</i>.");
	output("\n\nThe more this goes on, the more you feel her tongue trying to find space in your mouth. It’s already wrapped around your own [pc.tongue], tightening like a constricting snake. You feel it go deeper, just about tickling the very back of your larynx. Gag reflex don’t fail ya now!");
	output("\n\nThrough all this, she’s hunched herself up to a kneeling position over your prone form and you haven’t the focus to adjust. You ‘hmmm’ to each strong push and pull of her tongue, completely at its mercy. And then she pulls back, her deep red, draconic tongue being slowly drawn out of your mouth. You eye the writhing thing escaping from you: it must be a foot long at least! It hangs in the air, dripping with mutual saliva; of which the breathy qilin slurps up.");
	output("\n\n<i>“Goddamn *<i>huff</i>* didn’t think you were such a pushover, Steele...”</i> she teases, licking and sucking on one of her fingers. You <i>really</i> want to say something back to her but your tongue is just a little worn out right now. Your arms splay out behind you as an added sign of defeat.");
	output("\n\n<i>“I think I know how to handle you, </i>elskan<i>...”</i> she whispers.");
	processTime(35);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",ohJeezRickMirranIsGonnaFuckYa);

}

//PC lust set to 100.
public function ohJeezRickMirranIsGonnaFuckYa():void
{
	clearOutput();
	showMirrin(true);
	pc.lust(100);
	author("SoAndSo");
	output("Without any other words, the domineering qilin thrusts her hips toward your face. The largest of her two members - a 16’’ python of a horsedick - pushes aggresively against your [pc.lips].");
	output("\n\n<i>“<b>Suck.</b>”</i>");
	output("\n\nYou’re in no position to refuse... you open your mouth as wide as you feel you can, enough for her pulsing cockhead to sit in it comfortably. At least it only gets thicker the further down you go! Both of her cocks sit perfectly in the middle of your [pc.fullChest], using your flesh and [pc.skinFurScales] as an extra layer of friction. They’re not even hard yet...");
	output("\n\nShe pushes just a little bit more aaand it’s in, filling up most of your mouth in an instant. Using your [pc.tongue], you eagerly try to find her cumslit. A stifled squeal from your dragon lover confirms your skill at finding it. You look up with your eyes and she’s looking back, biting hard on her bottom lip.");
	output("\n\n<i>“That’s it, right there...”</i> she whispers.");
	output("\n\nIt hardens, getting a little thicker and <i>much</i> heavier as it fills out your greedy mouth-hole all the more. It’s sheer size prevents you from moving your jaw much but it seems she’s getting by with just the attention from your tongue. You help her along with groans of encouragement, but only to make sure she doesn’t get any rougher with your throat.");
	output("\n\nAfter teasing, tonguing and pleasing her cockhead for a good few minutes, she pulls it out of your mouth rather abruptly.");
	output("\n\n<i>“That’s enough... now, turn over.”</i>");
	processTime(4);
	pc.lust(5);
	clearMenu();
	IncrementFlag("SEXED_MIRRIN");
	addButton(0,"Next",firstTimeMirrinSexActual);
	//(This scene has different content based on the following PC requirements)
	//V1: [Any pc] = Hoisted Painal (default result)
	//V2: [pc has vagina, H or F, Kind, PC tone >70 and Physique >25, overrides V1] = Tender Struggle
	if(pc.hasVagina() && pc.tone > 70 && pc.physique() >= 25) addButton(0,"Next",firstTimeMirrinSexActual,2);
	//V3: [pc has dick 18< inches, H, M or T, Hard, PC tone >70 and Physique >25, overrides V1 and V2] = Dom Ride/SNU SNU
	if(pc.hasCock() && mirrinSelectADick() >= 0 && pc.tone > 70 && pc.physique() >= 25) addButton(0,"Next",firstTimeMirrinSexActual,3);
}

public function firstTimeMirrinSexActual(arg:int = 1):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	//V1
	if(arg == 1)
	{
		flags["MIRRIN_FIRST_SEX"] = "V1";
		//PC lust set to 0, ‘orgasm’ event.
		output("She slinks off to the side, reaching for something in a bedside cupboard. ");
		if(pc.isNice()) output("Tentatively,");
		else if(pc.isMischievous()) output("With a wiggle of the hips,");
		else output("Stubbornly,");
		output(" you concede to her demand, turning yourself over onto all fours. It’s not hard to guess what comes next...");

		output("\n\nShe swaggers over to your rear, a small jar of something in hand. Instinctively, you perk your [pc.butt] up just a little bit more.");
		if(silly) output(" Perhaps all those training sessions did something after all, you Pavlovian bitch.");
		if(pc.tailCount > 0) output(" You flex your [pc.tails] over your back. Your qilin lover would love the added view...");

		output("\n\n<i>“Just relax, </i>elskan<i>,”</i> she says cooly. You feel something pointed and slippery press on your exposed [pc.asshole], cold enough to make your [pc.legs] jitter and tense at the sensation. <i>“It’s just EasyFit, Steele...”</i>");
		output("\n\nShe adds a little to your rim in a rough circle then presses a singular claw ever so gently into your [pc.asshole]. At least the horny herm’s not being as rough as you expected. She’s slowly twisting it around, applying the cold cream all around your sphincter.");
		if(silly) output("\n\n<i>“Oh glorious Steeleburger, we bow to thee, the secrets of the universe are between the buns...”</i>");
		output("\n\nBut suddenly you feel her claw exit your hole with a painful twinge, enough to make you whine in discomfort. Then she grabs you by your [pc.hips], claws hooking into your [pc.skinFurScales] and she pulls you right off of the bed!");
		output("\n\nIt happens so fast that you can’t even react. She’s steadily holding you upright with your [pc.legs] folded against your body, just her left arm to hold you in place. Your lower half feels a limpness from such a position, discouraging you from struggling. ");
		if(pc.tallness > 80) output("You take note that she can even hold you up considering your shared sizes, but that isn’t so surprising anymore... ");
		output("Now that her mouth is right behind your head, you can hear her husky, deep breathing vibrate through you. <i>“Ready, [pc.name]?”</i>");

		output("\n\nYou nod weakly, looking down to the floor. It’s about 5 feet to the ground...");

		output("\n\nShe holds up her biggest horsemember in her other hand, its tip covered in an extra smear of EasyFit. She guides it to your floor-facing, exposed [pc.asshole] and presses <i>you</i> down on to it. Oh shit, it’s <b>huge</b>. Your tensed up [pc.asshole] gives way all the more easily thanks to the smear of cream, stretching painfully around the 4’’ wide horsecock.");
		output("\n\nAs you sink lower, that thickness grows and grows, stopping once you’re speared halfway down her rock-solid tool. Some nubbly sensation tortures your slick [pc.asshole]");
		if(pc.hasCock()) output(" and tender prostate");
		output(". You look to see that the bottom of her cock is covered in coil-like ridges that extend down from tip to bottom. <i>Ow</i>.");

		output("\n\nYou hear her whisper from behind: <i>“Fucking perfect, Steele... now just let it happen.”</i>");
		output("\n\nNow holding you with both arms round your legs and middle, she lifts your body up and down on her thick prick. It’s cruelly slow at first, the EasyFit taking a little bit of time to adjust your innards for her cock. She picks up a smooth rhythm when your muscles start relaxing, a speed which still feels uncomfortable for your stretched [pc.asshole]");
		if(pc.hasCock()) output(" and prostate");
		output(". She’s quiet all the same, aside making some throaty, pleasured grunts when she finds ‘resistance’.");
		pc.buttChange(mirrin.cockVolume(0));

		output("\n\nThroughout this torturous pounding, you think of your poor, poor pudenda. It all feels horribly, achingly ignored but you just can’t get your arms round her grip! She seems less than inclined to help... instead, she’s racking up the pace of her heaves and drops, spearing you a little further on her meat every time. The sheer sensation of it all overtakes your body as it’s abused like some disposable, fleshy cocksock. <i>“Mmmgods, Steele, how are you not just... *<i>hnng</i>* galaxy famous already from this </i>ass<i>,”</i> she teases under her breath, her vocal pitch rising to more feminine levels.");
		output("\n\nShe slides her right hand around your front for your ");
		if(pc.hasCock()) output("[pc.cockBiggest]");
		else if(pc.hasVagina()) output("[pc.biggestVagina]");
		output(", placing a palm down firmly. It’s very rough against your sensitive nerves.");

		//(cocks gain priority over vaginas in the case of PC having both)
		//PC has cock(s):
		if(pc.hasCock())
		{
			output("\n\nShe takes a hold of your [pc.cockBiggest] and pumps it without a care, working it like a high pressure piston. You feel the rise of your load - already jumpstarted by the prostate abuse - fill out your insides with heat and ecstasy. Then, you cum, loud and messy!");
			output("\n\nStrands of [pc.cum] erupt from your pulsing cock, the sensation burning away through your body. It audibly plops all over the floor, [pc.cumColor], [pc.cumVisc] jizz against mahogany.");
		}
		//PC has vagina:
		else if(pc.hasVagina())
		{
			output("\n\nShe digs two claws into your [pc.vagina], using the rough skin of her palms on your labia ");
			if(pc.totalClits() > 0) output("and [pc.clits]");
			output(". It doesn’t take long for your aroused [pc.pussy] to give in to her ministrations, [pc.girlCum] running down Mirrin’s clawed fingers in response. That familiar, orgasmic build up - already jumpstarted by your deep anal fuck - rises within, making you moan louder and louder until... you cum, loud and messy!");
			output("\n\n[pc.girlCumColor] fluid spurts onto the floor below, dripping all over your lower body and Mirrin’s hooves.");
		}
		output("\n\n<i>“Ahh... nice - </i>huff<i> - work, [pc.name]... but I’m not - </i>huff<i> - done with you.”</i>");
		output("\n\nUsing the energy of your messy orgasm, she goes for a final burst of thrusts. You can feel <i>something</i> pulsing through her rigid cock. She groans with throaty undertones louder and louder until she hammers you down one final time on her meatspear. Then it comes.");
		output("\n\nA thick surge of dragon-cum forces its way into your guts, filling out your colon almost instantly. It barely has room to move as your tightly fitted [pc.asshole] prevents it from leaving! Your belly swells up with what feels like a litre of hot, almost burning seed. Your qilin lover’s girlish moans fill your ears as she humps and pumps her final spurts of fresh semen. <i>“Ohh, <i>shit</i>... Steele...”</i> she trails off, nuzzling the side of your neck.");
		output("\n\nAfter half a minute of basking in the mutual afterglow, her donger softens and recedes from your well-stretched hole. A splattering of white fluid from your ass spills onto floor below. She’s still holding you, looking to your [pc.eyes] from the side with a tired, satisfied grin.");
		//[Next]
		processTime(30);
		pc.orgasm();
		pc.loadInAss(mirrin);
		clearMenu();
		addButton(0,"Next",mirrinFirstTimev1Part2);
	}
	//V2
	else if(arg == 2)
	{
		flags["MIRRIN_FIRST_SEX"] = "V2";
		var x:int = rand(pc.totalVaginas());
		//PC lust set to 0, ‘orgasm’ event.
		output("She slinks off to the side, double dicks protruding forward. You wonder what she’s about to do... without looking, you do as she asks, pressing your knees together as well. Getting on all fours on the plush bed is a little unstable but you manage. You push your [pc.ass] out invitingly, ");
		if(pc.tailCount > 0) output("flipping your [pc.tail] over your back and ");
		output("wondering what your dragon-Domme has in store.");

		output("\n\nShe swaggers around to your behind, some sort of small jar in her hands. <i>“Don’t worry about this, Steele. It’s just some EasyFit. Just to be sure, y’know?”</i> She reassures you, placing a comforting hand on your [pc.butt]. You get goosebumps and feel arousal all over from her tender attention. You’ve got your eyes towards the pillow end of the bed so you can’t clearly tell what she’s doing from behind, but the cold pressing of cream around your [pc.vagina " + x + "] tells you all. Mirrin’s gentle with the application, using one of her knuckles instead of claws to apply a little to your inner folds. It tingles teasingly against your labia.");
		output("\n\nThe qilin clambers back onto the bed, her hands all over the [pc.skinFurScales] of your [pc.ass]. All this touching makes your need for relief ache within you, your [pc.hips] wiggling in response to her rough touching. You can feel her line up her biggest cock in response. The tip is covered in more cold EasyFit, both for lube and your safety, or so you guess.");
		output("\n\nThe she-dragon grips firmly into your [pc.butt] with her claws then pushes the head of her dong into your folds. <i>Jeez</i>, it’s big. You reflexively tense up your inner muscles in response to soften the intrusion. It sort of works, the EasyFit needing a few more moments to fit your [pc.pussy] around her cock.");
		output("\n\n<i>“That feel *<i>unf</i>* okay... [pc.name]?”</i> Says a breathy Mirrin from behind. You get the impression that she wants you to be comfortable. You nod your head in response, biting on your lower lip as her cock sinks into you. Gods, she has to be at least halfway by now...");
		output("\n\nYou feel her grip on your [pc.ass] relax, instead she grabs a hold of your waist and pulls you up. ");
		if(pc.tallness > 80) output("You reciprocate by turning your head to her eye level, your sweet, lip-bitten [pc.face] conveying your need.");
		else output("You reciprocate by looking up at her sweetly with your lip bitten [pc.face], your head between her soft breasts.");
		output(" You feel her fully hard member pulse and tense inside you as you do so. Must be doing something right...?");

		output("\n\nBut while you’re looking at her, she very quickly brings her right arm round your neck, pulling you sharply and tightly to her skin. Instinctively, you grab onto her arm, only to relax when you sense that it’s a hold rather than an actual choke. <i>“Shhh...”</i> she whispers to you, slowly leaning the both of you forward until you’re back to being face first into the bed.");
		output("\n\nHaving her massive form cover you, her arm round her neck and your limbs pinned down underneath is alarming, scary even. Yet it fills you with a surreal sense of safety. With your face essentially buried into the bed, she pushes even deeper into your sensitive depths. Just how much cream did she use...?!");
		output("\n\nNerves afire, you squeak and squeal underneath the slow, deep fuck you’re under. The she-dragon’s cockhead continuously bottoms out, unable to fit all the way in yet constantly hitting your cervix. If you could touch your [pc.belly], you’d feel its outline bulging your abdomen!");
		if(pc.hasCock()) output(" During all this, your [pc.cocks] hurt from disuse but with your limbs pinned to the bed, nothing’s getting touched any time soon!");
		pc.cuntChange(x,mirrin.cockVolume(0));
		output("\n\nThe dragon’s breathing gets deeper and huskier as she slow-fucks you with a comfortable rhythm. You can really <i>feel</i> the intense heat from her body completely covering you. It overwhelms your sensitive, tender nerves, adding to the coming climax. She picks up the pace: harder, deeper, faster! Your [pc.vagina] is so comfortably stretched that she has no problem just thrusting and fucking you deeper. But you do feel her arm tightening around your neck... right at the point when you feel your climax hitting you!");
		output("\n\nYou cry out.");
		output("\n\n<i>“Ahhh</i>ckh<i>-!”</i>");
		output("\n\nA girlish squeal escapes you as your [pc.pussy " + x + "] spurts [pc.girlCum] around that mammoth dong.");
		if(pc.hasCock()) output(" A simultaneous, boiling surge of [pc.cum] erupts from your [pc.cocks], shooting straight into the bed covers.");
		output(" As if sensing you on a supernatural level, Mirrin tightens the grip on your neck!");
		output("\n\nInstead of fully choking you, it constricts your squeals and inhalations, making them rise in pitch.");
		output("\n\nWith a final surge of energy, you feel the monster dick inside you pulse and throb until it unleashes its load. Thick, unbearably hot cum floods every part of your womb and [pc.cunt " + x + "], so much of it filling you up that you feel it physically start weighing you down. Mirrin stifles her own throaty orgasm, burying her face beside yours into the bed.");
		output("\n\nWhat feels like an eternity of bliss being injected with so much baby batter is interrupted as she lets go of your neck. You splutter and gasp as cool air invades your lungs but the internal warmth you feel in your body overrides it.");
		output("\n\n<i>“*<i>huff</i>* Holy... *<i>huff</i>* shit...”</i>whispers your lover into your ear. <i>“Best... fuck ever...”</i>");
		output("\n\nShe - very thankfully - hasn’t slumped on top of you. You probably wouldn’t survive if she did. Instead, she basks in the afterglow, her hands moving up and down your [pc.skinFurScales] to comfort you. She still hasn’t actually removed her softening horsedick from your well-stretched cumhole...");
		//[Next]
		processTime(30);
		pc.orgasm();
		pc.loadInCunt(mirrin,x);
		clearMenu();
		addButton(0,"Next",mirrinFirstTimev2Part2);
	}
	//V3
	else
	{
		flags["MIRRIN_FIRST_SEX"] = "V3";
		
		var cIdx:int = mirrinSelectADick();
		
		//PC lust doesn’t change i.e. still at maximum, no orgasm event.
		output("You’re about to roll your body over but she raises her hand. <i>“On second thoughts... no,”</i> she says slowly, her turgid horsemembers seeming to stiffen on top of your [pc.chest] as she thinks of <i>something</i>.");
		output("\n\nShe shuffles backwards somewhat, her muscled ass grazing delightfully against your semi-hard, [pc.cockNounComplex " + cIdx + "]. It slots in between her crevice and then she proceeds to <i>squeeze</i>. It feels like an expert grip is sliding your [pc.sheath " + cIdx + "] up and down with dextrous force. Mirrin’s gaze never turns from yours, hot red eyes locking with your own [pc.eyes]. She then takes one of her rough palms and reaches around behind her, grasping your [pc.cock " + cIdx + "]. Slowly, she pumps.");
		output("\n\nHaving two different forces pump together feels instantly overwhelming but you endure, holding back your internal pleasure through sheer force of will. Your [pc.face] scrunches up in concentration and restraint, getting a giggle out of your dominant qilin lover. <i>“Well, Steele... if you’re going to be useless, better open up again,”</i> she chides, pushing her biggest dicks pulsing head onto your [pc.lips].");
		output("\n\nBegrudgingly, you let her inside, your jaw opening wider and wider to accept her. Your compliance brings a soft <i>“Ooh...”</i> from the draconid’s lips. Slowly at first, she rolls her hips up and around, both simultaneously grinding your now-solid [pc.cock " + cIdx + "] and using your mouth as a cock pleaser! The thought draws out a low groan from you, peaks and valleys of sensation tingling all throughout your body as you’re pinned down and used by this predator.");
		output("\n\nFrom nowhere, you feel a strong pressure on your ribcage. Mirrin’s sculpted, muscled thighs squeeze tightly against you, either out of purpose or from reflex... well, you’re too pre-occupied to think on it. However, it does make breathing a little harder: air going out is fine but coming in is a struggle. It’s already making your [pc.skin] tingle with numbness but your [pc.cock " + cIdx + "] remains rock hard.");
		output("\n\n<i>“That’s it, Steele... *<i>unff</i>* surrender...”</i> she breathlessly calls out, grinding her weighty testes and mammoth members across the front of your body. You can even feel a hot, wet sensation gliding against your lower belly... <i>ohhh</i>. Must be her under-appreciated pussy.");
		output("\n\nA spurt of smoky, hot pre-cum hits the roof of your mouth. Mirrin stifles a girlish moan as it happens, her lower body tensing up to hold it all back. She squeezes your ribs even harder, to the point where your arms lose some sensation. It’s getting... harder to... focus!");
		output("\n\nMirrin’s grip on your [pc.cock " + cIdx + "] gets tighter and tighter in her calloused palm, rough skin uncomfortably constricting on your sensitive shaft. If she’s this tight-gripped, you might not even be able to climax at all...");
		output("\n\nWith her strongest pump yet, she releases your tortured [pc.cock " + cIdx + "]. It still fits snuggly in between her cheeks but the smoother, soothing skin of her ass is a welcome reprieve. She stares you down from above, her foot long tongue seeping out of her mouth and her wide eyes full of lust. With both hands free, she grabs you by the top of your [pc.hair], pulling your head forward so her thick horsecock goes even further down your throat!");
		output("\n\nYou try to splutter and protest but between the forced blowjob, squished ribcage, and edging you’ve received, it’s physically impossible to resist her dominion over you. Reluctantly, you let her use your throat as her personal cocksleeve. At this angle, she can’t get more than ten inches down there but it’s enough. Between her thrusting and grinding, you can hear her wails and cries of bliss build and build, while your vision dims and dims...");
		output("\n\n<i>“fffuh..!”</i> With that, the tips of her two cocks erupt, a veritable flood of white hot seed filling your mouth, throat, and nose while your neck and face receive the same basting! You can feel it make its way all the way to your stomach, bloating your innards.");
		output("\n\nBut then your vision... dims and... it’s dificult to...");
		pc.loadInMouth(mirrin);
		processTime(20);
		pc.HP(-5);
		clearMenu();
		addButton(0,"Next",mirrinFirstTimev3Part2);
	}
}

public function mirrinFirstTimev1Part2():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("She lets you down onto the bed, a little sluggish in her movements. Your body is completely worn out, both from being manhandled and fucked silly from you qilin friend; so you just lay back, [pc.legOrLegs] and arms stretched out on the bed. Mirrin moves out of sight but the sound of a shower turning on tells you where she is.");
	output("\n\nShe comes back after letting you have a breather, sitting by your side.");
	output("\n\n<i>“Well then, [pc.name]... I’m a little drained right now but I want you again. I’m always at the gym if you want me back,”</i> she softly says, holding one of your hands. She then lets go, wandering off to the sound of running water.");
	output("\n\nYou feel it’s best to let her go after such an energetic session, gripping as it was, so you redress into your [pc.gear], call out your goodbyes and return to New Texas proper.");
	//PC gains ‘Anally filled’ (ALREADY DUN) and ‘Sore’ and status effects.
	processTime(10);
	soreDebuff(3);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function mirrinFirstTimev2Part2():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("Several minutes go by, the both of you enjoying each others aftercare. Your qilin lover slowly pulls herself up from you, her cum covered cock sliding lazily out of your [pc.pussy]. A little rope of the white stuff drips all over the bed as she does, adding to the metre-wide splatterzone of oozing babyjuice that’s pooled underneath you. Oh, so that’s what her <i>other</i> dick was doing...");
	output("\n\nJust how much can she put out...?! Patting your gurgling belly suggests... a lot.");
	output("\n\nMirrin idles out of view, the sound of a shower coming on from somewhere. You slowly pull yourself up, sated and tingly but completely worn out. It’s a bit of a struggle.");
	output("\n\nAfter sitting up for a few minutes, Mirrin returns to check on you. She sits by your side, pecking you on the cheek. <i>“You owe me a new bed,”</i> she says, smirking at you.");
	output("\n\nBut she made the mess! You meekly slap her on the shoulder then move off the bed with an eye out for your gear. She helps you put your [pc.gear] back on as well, much like a fussy spouse. When you finish, she gives you one final kiss on the cheek.");
	output("\n\nYou bid your goodbyes and head out to New Texas proper.");
	//PC gains ‘Vaginally filled’ (ALREADY DUN) and ‘Sore’ and status effects.
	processTime(10);
	soreDebuff(3);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function mirrinFirstTimev3Part2():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("You wake up.");
	output("\n\nIt can’t have been more than thirty seconds. Your throat and mouth feel absolutely stuffed with still-hot qilin cum, it’s flavor overpowering and smokey. You splutter before opening your eyes, the first instinct being to <i>breeeathe</i>.");
	output("\n\nThe first thing you see is Mirrin standing over the end of the bed, her brace of mammoth cocks not even soft after her load dump. Is she taking a picture?!");
	output("\n\n<i>“Hey-”</i> you weakly begin before coughing up yet more dragon cream onto your chest. Looking around your head, it’s as if someone threw an entire tin of paint of your upper body. Just how much cum can she make...?!");
	output("\n\n<i>“Hoooold still,”</i> she says, a photo shutter sound playing shortly afterwards. <i>“Perfect...”</i>");
	output("\n\nShe puts the slate on the side of the bed, approaching the bed from the side towards you. Unexpectedly, she reaches in to kiss you full on your [pc.lips], taking extra time to ‘clean’ your tongue with her own. Pulling away, she wipes her mouth clean, something that reminds you that you’re <i>absolutely caked</i> in the stuff.");
	output("\n\n<i>“So... now you know what happens on my level,”</i> she giggles, blowing a mock kiss to your direction. You can hear the sound of a shower automatically turning on somewhere. You have a quick peek at the dataslate while Mirrin’s getting prepped for a clean. The image it shows is of you, lying back in a prone state and looking positively sand-blasted in qilin cream. You also spot that your own [pc.multiCocks] apparently didn’t fire off, hanging uselessly at half mast... that <i>bitch</i>.");
	output("\n\nYou grab a towel that was next to the dataslate and wipe your face and body down, although you’re not sure if you got <i>all</i> of it. Even so, you’re spent, she’s spent and occupied. You call out your goodbyes to leave.");
	output("\n\n<i>“I better see you at the gym again, Steele,”</i> she coos from another room.");
	output("\n\nYou’ll get her next time, you’re sure of it. You re-equip your gear and leave the building for New Texas.");

	//PC gains ‘Orally Filled’, ‘Cum Covered’ and ‘Sore’ and status effects. Also (check to see if the former 2 are even the right names).
	processTime(10);
	soreDebuff(3);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Confidence
//PC gains maximum lust/full lust bar.
public function mirrinYerConfidenceBaaaaaeby():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("You set yourself down next to your qilin friend, enough for your body to rub up against hers. She smiles, wrapping her arm around your shoulder. <i>“So what’s this for, [pc.name]...?”</i> she asks with curiosity.");
	if(pc.isNice())
	{
		output("\n\n<i>“Just wanted to see you, is all. I keep thinking back to...”</i> you trail off, implying <i>that</i> particular recent memory.");
	}
	else if(pc.isMischievous()) output("\n\n<i>“Weeeell, I kept thinking real hard about you bending me over and...”</i> you trail off, not needing to say much else.");
	else output("\n\n<i>“Do I really need a reason?”</i> you say, squeezing her rock-hard thigh.");
	output("\n\n<i>“Awww, you missed me!”</i> She giggles regardless, squeezing you tightly to her. ");
	if(pc.tallness > 80) output("The abruptness doesn’t let you prepare for said tight squeeze.");
	else output("The abruptness doesn’t let you prepare for your [pc.face] meeting her bosom.");
	output(" But now you’re close, you can hear her whisper...");

	output("\n\n<i>“And I missed ");
	//PC did V1 scene: 
	if(flags["MIRRIN_FIRST_SEX"] == "V1") output("bending you up and abusing you with my </i>dick<i> like a little toy, Steele,”</i>");
	else if(flags["MIRRIN_FIRST_SEX"] == "V2") output("pinning you down and making you a </i>real<i> cockslut, Steele,”</i>");
	//PC did V3 scene: 
	else output("blasting your insolent face and denying your undeserving prick, Steele,”</i>");
	output(" says the slightly menacing qilin. You flush red as she says it, reminding you of the sensations you felt. She lets go of squeezing you, standing up to stretch a little.");

	output("\n\n<i>“Cuz of that, though, I gotta thank you. Being here on uhhh, New Texas, I admit that I was going... crazy or something,”</i> she says, twirling her fingers as usual. <i>“But all this, with you, shows that it’s all just me messing with me. Myself, even. ");
	if(pc.isNice()) output("You helped me with just being nice and... being sweet");
	else if(pc.isMischievous()) output("You helped me relax and feel great about being me");
	else output("You showed me how to be decisive and how to self-improve");
	output(",”</i> she says sincerely, her smile the widest you’ve seen yet.");

	output("\n\n<i>“Couldn’t have done it otherwise");
	if(pc.tone > 70 && pc.physique() >= 25) output("... plus you being the sexiest fucking thing for lightyears around helped");
	output(",”</i> she adds with a wink.");
	output("\n\n<i>“So, Steele. [pc.name]... if you want training or just want </i>me<i>, you know where to find me,”</i> she finishes. <i>“I’m going to squat, squat some more, then maybe... give out some autographs.”</i>");
	output("\n\nWith a kiss on your cheek, she returns to her weights with twice the enthusiasm. You let her get back to it.");
	processTime(15);
	pc.lust(5);
	flags["MIRRIN_CONFIDENTED"] = 1;
	//PC returns to the front of the gym. Unlocks [Her Place].
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

//Her Place/Bangin’
//Scene concepts and requirements:
//Oil Worship into Double Handjob: All PC’s. Very messy.
//Deep DP: PC has vagina, height 80<.
//Sparr Fight into Oral for the winner: PC has cock at 18’’< and/or vagina. High PC stats = wins.
//Humiliating Pork: (aside sounding like a bad chinese translation of something with bacon in it) REWORKED: All PC’s. Pure humiliation anal sex. Special things happen when PC thickness >65. That’s what ya get for being a fatty fat person, fatty. YEAH, YOU GET HOT BUTTSEX MY BRO.
//Dommy Oral: PC has cock at 18’’< and/or vagina. A merging of ‘TongueFun’ for ease. Written into Sparr Fight because it essentially ends up the same anyway if you win.

//Her Place
//tooltip: Into the dragon’s lair...
public function visitMirrinsPlace():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	moveTo("MIRRINS");
	//PC gains maximum lust/full bar.
	//PC is kind:
	if(pc.isNice())
	{
		output("<i>“Hey, I was wondering if we could... ya know. Back at your place?”</i> You chime, trying to hide a smile from her.");
		output("\n\nShe sets her weights down almost immediately. <i>“Aw, [pc.name]... let’s go </i>now<i>,”</i> she says, briefly stroking the side of your face.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("<i>“Soooo, mythical space dragon lady, mind if I walk ya home?”</i> You say with all the cheek in the world.");
		output("\n\nShe sets her weights down almost immediately. <i>“Sure thing, iron-carbonoid alloy person,”</i> she shoots back, blowing you a kiss.");
	}
	//PC is hard:
	else
	{
		output("<i>“You. Me. Your place,”</i> you say assertively.");
		output("\n\nShe sets her weights down almost immediately. <i>“Well shit, the challenger returns,”</i> she says with a grin, patting her palms together in glee.");
	}
	output("\n\nYou both leave with an eagerness that turns most heads in the gym, followed by a few whistles. <i>“Yeeeh, you get in that hot shit, Mirrin!”</i> You hear one regular shout.");
	output("\n\nShe leads the way back to her place, a bit of a skip in her hoofsteps. You almost have trouble keeping up. In no time at all, you’re back at that familiar ranch house, Mirrin saying <i>“Cheers Brescoe!”</i> as the security guard lets her through the gates.");
	output("\n\nOnce inside, she’s all over you.");
	output("\n\nInstantly, she pulls you right against her body, ");
	if(pc.tallness >= 80) output("locking your mouth to hers for a deep, impassioned kiss.");
	else output("bending over to lock your mouth to hers for a deep, impassioned kiss.");
	output(" She has very little difficulty undoing your [pc.gear] despite her oral ministrations. You can even feel that tongue of hers tease and taunt yours with its potential power.");

	output("\n\nShe pulls away, leaving your mouth wanting more. It’s brief though, as she merely removes her gym wear in an eerily quick fashion. How many of those things does she go through...?!");
	output("\n\nMirrin pulls you back to her, ");
	if(pc.tallness >= 80) output("looking straight into your eyes with a lustful, penetrating glare.");
	else output("looking down at you and straight into your eyes with a lustful, penetrating glare.");
	output(" Her breathing is hot and heavy.");

	output("\n\n<i>“So... what do I do with you, </i>elskan<i>?”</i>");

	processTime(15);
	clearMenu();
	//[BodWorship] [Deep DP] [Train..?] [Humiliation]
	mirrinSexMenu();
}

public function mirrinSelectADick():int
{
	if(pc.hasCock())
	{
		var aCocks:Array = [];
		for(var i:int = 0; i < pc.cocks.length; i++)
		{
			if(pc.cLength(i) < 18) aCocks.push(i);
		}
		if(aCocks.length > 0) return aCocks[rand(aCocks.length)];
	}
	return -1;
}
public function mirrinSexMenu():void
{
	clearMenu();
	addButton(0,"BodWorship",mirrinBodyWorship,undefined,"Body Worship","Oil her down with that orange stuff; watch her blow!");
	if(pc.hasVagina()) addButton(1,"Deep DP",deepMirrinDP,undefined,"Deep DP","Embrace the dragon’s power. Requires a vagina.");
	else addDisabledButton(1,"Deep DP","Deep DP","You need a vagina for this.");
	//Sparr Fight into Oral for the winner: PC has cock at 18"< and/or vagina. High PC stats = wins.
	if(mirrinSelectADick() >= 0 || pc.hasVagina()) addButton(2,"Train..?",trainFightyFlighty,undefined,"Train..?","Spar to see who cums out on top!");
	else addDisabledButton(2,"Train..?","Train..?","You need a penis of 18\" or less or a vagina for this.");
	addButton(3,"Humiliation",humiliationAnalWithMirrin,undefined,"Humiliation","Try something a bit different and a bit rougher.");
}

//BodWorship
//tooltip: Oil her down with that orange stuff, watch her blow!
//PC lust doesn’t change.
// In game time jumps forward 2 hours.
public function mirrinBodyWorship():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("<i>“Hm, I know,”</i> Mirrin says after a few seconds, letting you go to reach for something in a side cupboard. She pulls out another unmarked bottle of that orange oil you were using before. It’s not as full as the last but you’re sure she intends to use all of it...");
	output("\n\nShe tosses it to you, although you have to brace yourself considering it’s a far heavier liquid than it looks. You unscrew the top and that vaguely warm aroma passes under your nose.");
	output("\n\n<i>“You know, I always wondered what having that shit all over feels like,”</i> she says, leaning on her hip in the middle of the room. <i>“So... oil me up, Steele.”</i>");
	output("\n\nShe locks into a typical strongman pose, arm muscles bulging.");
	output("\n\nWelp, might as well ");
	if(pc.isNice()) output("test the results!");
	else if(pc.isMischievous()) output("take the opportunity to feel her up!");
	else output("see what you can get away with!");
	output("\n\nYou dribble a bit of the oil on your palm: it’s as gooey and thick as you remember. It instantaneously warms your hand up. Approaching the statue-esque qilin, you notice that she’s essentially immobile aside from her heaving chest. Hm...");
	output("\n\nYou start with her abs, a stack of meat-grinders that barely react to your smothering. You do get a pleasured rumble from your subject, though. Using that information, you hastily apply it to her sides, hips and back, making sure that not a single crevice or curve goes untouched. Mirrin’s reaction is still rather tepid but you can hear her breathing getting deeper and throatier the more oil you apply. Upon touching her forward thrusting breasts, she sighs a bit more audibly and with a hint of a voice break. You even catch her biting her lower lip as you continue, applying the juice to her hardening nipples.");
	output("\n\nAnd that’s not the only thing that’s hard...");
	output("\n\nYou peep down briefly as rivulets of oil slide down her ripped frame. Welp, both her ‘boys’ are up and about: Two meaty dicks at half mast. Hm, how would they react to the oil?");
	output("\n\nApplying oil to both hands, you set about on your ambitious aim. You firmly grab a hold of her rods, one for each hand. For a better grip, you kneel down so that you face her side on. Sliding with a firm grip is easy to do, the oil providing a better lube than it looks. Only a few seconds in and already she’s already at full mast, both members pointing up to a 70 degree angle. Time to make her blow!");
	output("\n\nYou pump at her oversized dongs, the pulse of her blood flow making them twitch and tense in response to your deft handiwork. Although her rock-solid pose doesn’t betray much, you can hear from her stifled sighs that she’s really into it. Already, her double dong’s tips are leaking some hot draconid spunk onto the floor! This is your chance...");
	output("\n\nWith a tighter than ever grip, you pump from her bases to her flared horse-tips as fast as you can. Her chest heaving madly, a singular, stifled squeak is the only warning you get as her cocks erupt in your hands! Thick, hot jets of dragon jizz shoot into the space in front of you. One shot, two shots, three, four... she doesn’t stop for a full twenty seconds, her babyjuice patterning the floor like an exploded can of paint. When it finally subsides, her double dongs very quickly fall limp.");
	output("\n\nAnd so does she.");
	output("\n\nMirrin slumps to the floor onto her toned butt, completely spent. <i>“Fuh... fuck... that was AWESOME,”</i> she exclaims, her face a panting, smiling mess. <i>“You never said you were so good with your hands...”</i>");
	output("\n\nHowever, she’s very quickly back on her feet. Giving you a thankful squeeze on the shoulder, she looks right at you.");
	output("\n\n<i>“Cheers, [pc.name]. I’m gonna need a bit to uhhh, get it back together again,”</i> she breathlessly whispers. She pecks you on the cheek, helping you with your gear. Saying a goodbye, you leave her to clean up her mess.");
	processTime(120);
	pc.lust(100);
	IncrementFlag("SEXED_MIRRIN");
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

//Deep DP
//tooltip: Embrace the dragon’s power. Requires a vagina.
//PC lust set to 0, orgasm event.
// In game time jumps forward 2 hours.
public function deepMirrinDP():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	var x:int = rand(pc.totalVaginas());
	output("<i>“Ohh... I know,”</i> she says, her eyes even more menacing and voice more assertive than usual. <i>“You just stand there, Steele.”</i>");
	output("\n\nShe holds both of your wrists, pulling you to a small chest of drawers. Letting go of one of your wrists to open the drawer, she pulls out a gravcuff set. She also takes out a jar of EasyFit and applies some to the tips of her hardening dicks...");
	output("\n\nWithout much hesitation, Mirrin slaps the cuffs onto both of your wrists. She fiddles with a setting or two and its effects are immediate: you find your body feel floaty and awkward, like a push with your foot would send you flying!");
	output("\n\n<i>“This is just to make it faster,”</i> she says matter-of-factly, turning you around on the spot. The giant qilin then proceeds to grab you from underneath, pushing your knees up to your [pc.chest] and lifting you into the air! She holds your [pc.legs] and body with one arm with little effort, the cuffs doing the work. With the other hand, she dexterously grapples her two monster members between her fingers and angles them to your exposed [pc.pussy " + x + "] and [pc.asshole]");
	if(pc.hasCock()) output(", your [pc.cocks] hanging uselessly in the air");
	output(". Uh oh...");
	output("\n\nShe lowers your body onto her upturned rods: first your [pc.asshole] then your [pc.pussy " + x + "]. They both offer little to no resistance as they both start stretching to fit! The ridged underside of her horsecocks grind uncomfortably against your insides");
	if(pc.hasCock()) output(", your sensitive prostate feeling it all the more");
	output(". She’s torturously slow at first, making sure you get used to the EasyFit <i>and</i> her double meat. You can feel your insides shifting around as 12 inches go in, 13, 14... all the way down to her bases.");
	output("\n\nYou’re now angled like a cocksleeve, 90 degrees from Mirrin’s pelvis. The amount of <i>fullness</i> you feel is almost overwhelming. Instead of crying out in pleasure, you can only whimper in meek mumbles and groans of discomfort.");
	pc.buttChange(mirrin.cockVolume(0));
	pc.cuntChange(x,mirrin.cockVolume(0));
	output("\n\nAs if sensing your pleasure-mixed pain, the in-control qilin uses a hand to stroke the [pc.skinFurScales] on your back. It doesn’t last. Using both hands, she grabs you by the hips and begins a deep, <i>deep</i>, fuck of both of your holes. A glimpse downwards and you can see the shifting bulge her second cock makes in your pelvis.");
	output("\n\nInstead of picking up the pace, she makes sure you feel every inch of her twin beasts from tip to base. She bottoms you out several, agonizingly, slow times. The stretching you are getting is definitely going to leave a mark...");
	output("\n\nWithout warning, she picks up the pace. Holding tight onto your [pc.hips] and with a slap on your [pc.butt], she <i>hammers</i> her full lengths into your slicked up holes. Each time she bottoms out, a reflexive moan escapes your agape mouth, energising her to go faster each time. Your [pc.pussy " + x + "] is so slick and slippery that [pc.girlCum] spurts and drips all the way down Mirrin’s shaft.");
	if(pc.hasCock()) output(" Your poor, semi-hard erection goes by untouched, aching from need.");

	output("\n\nWith a tell-tale roar from your qilin lover, a bulge of <i>something</i> rises from Mirrin’s shafts and you prepare for what comes next... a powerful, hot shot of qilin cum from each cock starts filling you up at a rapid pace, triggering your own climax! Femcum spurts around her deeply ingrained shaft, mixing with her burning, white cream to form a splatter on the floor below you.");
	if(pc.hasCock()) output(" [pc.EachCock] blows its own load right at the ground, adding to the sordid mixture.");
	output("\n\nThe uncomfortably hot fluid surges all the way into your guts and womb, visibly bloating your [pc.belly]. So much... her orgasm seems to last for eternity, even if it’s barely half a minute. By the end of it, you’re both breathless, panting and thoroughly drained of energy. Mirrin gently retracts her softening dongs, a double torrent of thick cream dripping from your well-fucked holes.");
	output("\n\nBeing as light as you are with the cuffs, she has no trouble setting you down on the bed. She removes the cuffs with some delicacy. <i>“Easy, easy...”</i> you can hear her whisper.");
	output("\n\nWhen she’s finished, she curls up to you on the bed with a creak, hands wrapped around your middle. You both take in the afterglow, her face nuzzling your cheek.");

	pc.loadInAss(mirrin);
	pc.loadInCunt(mirrin,x);
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mirrinDPEnd);
}

public function mirrinDPEnd():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("An hour or so later, you find yourself still wrapped up to your dragon queen. She’s fast asleep. Having spent yourself dry and still feeling <i>very</i> full, you decide to leave her in peace. Gathering your stuff, you get back to the ship.");
	//PC gains ‘Vaginally filled’, ‘Anally filled’ and ‘Sore’ status effects.
	//PC returns to the ship.
	IncrementFlag("SEXED_MIRRIN");
	soreDebuff(3);
	processTime(60);
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}


//Train...?
public function trainFightyFlighty():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	output("<i>“Hmm... I’m not sure,”</i> she muses, narrowing her eyes.");
	output("\n\nA crazy thought crosses your mind.");
	if(pc.isNice()) output("\n\n<i>“Why don’t we... switch things up and I choose?”</i> You ask her, giving her the puppy eyes.");
	else if(pc.isMischievous()) output("\n\n<i>“I could suggest something, ya know...”</i> you say with a grin, beaming right at her.");
	else output("\n\n<i>“How about I get to choose this time?”</i> You demand, narrowing your eyes back at her.");
	output("\n\nMirrin goes wide eyed. <i>“Well, Steele, if you want to try... come try,”</i> she replies, stepping back with her arms out like a grandstanding wrestler.");
	output("\n\nWhat, fight her? Fight <i>her</i>??? You raise a concerned hand.");
	output("\n\n<i>“Ah, don’t worry, Steele. Only rules are no weapons and the first on their knees, loses. Oh and no nutshots. Got it?”</i>");
	output("\n\nAlready this seems like a bad idea but if you actually win? Can’t pass that up!");
	output("\n\nYou both take a stance of equal distance from each other on opposite sides of the ‘bedroom’ area. Hers seems loose and relaxed.");
	//PC is Mercenary:
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nYou take a balanced, controlled martial arts stance that you’ve used during your Mercenary work, one that favors being able to adapt.");
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nYou adopt an aggressive posture, one based on your Smuggler’s ethos of fast attacks.");
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nYou take a defensive posture that you’ve gotten familiar with in your more risky Tech jobs, one that allows you to exploit weaknesses in enemy attacks.");
	output("\n\nAfter sizing each other up, a tension starts to build in the room.");

	processTime(10);
	clearMenu();
	addButton(0,"Next",trainFuckWivDisBitchMirrin);
}

public function trainFuckWivDisBitchMirrin():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	var won:Boolean = false;
	//PC is Mercenary:
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) 
	{
		output("Mirrin’s the first to go on the offensive.");
		output("\n\nShe aims with her hands, not with fists. You guess on the fly that she’s going for some kind of grapple or hold. It would fit her MO... each movement she makes, you block or avoid confidently, your stance allowing you to remain flexible in the face of each of her attacks.");
		output("\n\nHowever, one particularly wild strike from the side throws you off guard and she pounces!");
		output("\n\nLocking you into a bear grip, she squeezes your body like a vice. <i>“Gotcha, Steeley-boo,”</i> she mocks, her face a few inches away from your own.");
		output("\n\nAs the squeeze gets unbearably tight, you have one shot remaining: The trusty headbutt!");

		//PC tone >70 and Physique >25:
		if(pc.tone > 70 && pc.physique() >= 25)
		{
			output(" Using all the strength you have left, you mash your head into hers.");
			if(pc.horns > 0) output(" An audible, painful clack rings out as your [pc.horns] smack against the qilin’s!");
			output(" You both cry out from the hit. Mirrin grabs her forehead in both hands and drops to her knees.");
			output("\n\n<i>“Arg... fucking... dirty trickster, you!”</i> She shouts, visibly agitated.");
			output("\n\nYou win!");
			won = true;
		}
		//else:
		else
		{
			output(" You try to angle your head properly but... it’s harder to... lift...”</i>Ack!”</i>");
			output("\n\nYou cry out as you feel a sharp pain your spine. Instantly, Mirrin lets go of you and you fall onto the floor with your knees and hands buffering you.");
			output("\n\n<i>“Ah, don’t worry. Just a chiropractic trick, Steele!”</i> calls out Mirrin with a smug look on her face.");
			output("\n\nYou lose!");
		}
	}
	//PC is Smuggler:
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("You take the initiative.");
		output("\n\nGoing the offensive, you aim for her weak points first: ribs, knees and her centre of gravity. You strike fast rather than hard, although she’s quicker than her size would suggest. You miss most attacks, some are blocked and only a few appear to have a visible effect on her.");
		output("\n\nHowever, a counterattack from your side throws you off guard and she pounces!");
		output("\n\nLocking you into a bear grip, she squeezes your body like a vice. <i>“Gotcha, Steeley-boo,”</i> she mocks, her face a few inches away from your own.");
		output("\n\nYou have to think quickly! So you go for... the ribs!");
		//PC tone >70 and Physique >25:
		if(pc.tone > 70 && pc.physique() >= 25)
		{
			output("\n\nHaving figured out where her diaphragm is, you get both of your fists to simultaneously smack on the skin where it lines up! Mirrin instantly lets go, her arms and legs seizing up as she’s winded by the blow. You manage to fall on your feet but the qilin crumples over onto her knees.");
			output("\n\n<i>“Ahh, you sneaky shit!”</i> she calls out, a knowing smile on her face.");
			output("\n\nYou win!");
			won = true;
		}
		//else:
		else
		{
			output("\n\nIt’s just you can’t quite... get the... strength...”</i>Ack!”</i>");
			output("\n\nYou cry out as you feel a sharp pain your spine. Instantly, the qilin lets go of you and you fall onto the floor with your knees and hands buffering you.");
			output("\n\n<i>“Ah, don’t worry. Just a chiropractic trick, Steele!”</i> calls out Mirrin with a smug look on her face.");
			output("\n\nYou lose!");
		}
	}
	//PC is Tech Specialist:
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("Mirrin goes on the offensive.");
		output("\n\nUsing your technique, you stick to dodging and pushing away blows and grabs rather than countering or attacking. It works well: She can barely get a finger on you despite her speed and size!");
		output("\n\nHowever, a low blow from a leg you weren’t watching catches your eye at the wrong moment, giving her enough space and time to lock you into a crushing bear hug grip! <i>“Gotcha, Steeley-boo,”</i> she mocks, her face a few inches away from your own.");
		output("\n\nYou get an idea: Go for the joints!");
		//PC tone >70 and Physique >25:
		if(pc.tone > 70 && pc.physique() >= 25)
		{
			output("\n\nWhile she’s mocking you, you bring your [pc.legs] round the back of her knees and");
			if(pc.isNaga()) output(" strike with your tailbody!");
			else output(" strike with your heels!");
			output(" Taken by pure surprise, the qilin falls onto one knee, dropping you onto your feet.");
			output("\n\n<i>“Ah, you... <i>mudderfokker</i>!”</i> She says with a smile, muddling up her phrasing as usual.");
			output("\n\nYou win!");
			won = true;
		}
		//else:
		else
		{
			output("\n\nBut you can’t...quite...feel your lower body...”</i>Ack!”</i>");
			output("\n\nYou cry out as you feel a sharp pain your spine. Instantly, the qilin lets go of you and you fall onto the floor with your knees and hands buffering you.");
			output("\n\n<i>“Ah, don’t worry. Just a chiropractic trick, Steele!”</i> calls out Mirrin with a smug look on her face.");
			output("\n\nYou lose!");
		}
	}
	//[Win]* [Loss]**
	//*greyed out if pc loses
	//**greyed out if pc wins.
	processTime(20);
	clearMenu();
	if(won) addButton(0,"Next",winAgainstMirrin);
	else addButton(0,"Next",loseToMirrin);
}

//Win
//PC lust set to 0, orgasm event.
public function winAgainstMirrin():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("You dust your naked self down, a comfortable warmth energizing you from the exertion. Mirrin has her head cowed, still smiling in defeat.");
	output("\n\n<i>“Whelp, rules is rules or some such. What does " + pc.mf("Sir","Madame") + " Steele require of her uhhh, subordinate?”</i> She says, shuffling closer to you. It’s strange to find you in a higher position while she kneels before you. Still, you know what to do with her.");
	output("\n\nYou draw a circle in the air around your pelvis and then point to her mouth.");
	//PC is kind:
	if(pc.isNice())
	{
		output("\n\n<i>“All this... please,”</i> you ask reservedly.");
		output("\n\nShe rolls her eyes then giggles. <i>“Meant to be assertive in your victory, sweety,”</i> she scoffs, helping you onto the bed.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("\n\n<i>“I want that tongue... all over this,”</i> you say in a seductive way.");
		output("\n\n<i>“Ooo, so forceful, " + pc.mf("my Lord","my Lady") + ",”</i> she says in that same mocking tone. Then, she effortlessly pushes you back onto the bed behind you.");
	}
	//PC is hard:
	else
	{
		output("\n\n<i>“Your whore mouth...sloppin’ on this,”</i> you demand with your arms folded, staring her down.");
		output("\n\nShe breathes in deeply through her nose. <i>“That’s it, Steele. Now you’re on my level...”</i> she says while meeting your gaze, gently pushing you onto the bed behind you.");
	}
	output("\n\nFeeling well-deserved in your victory, you let her do so: The poor thing’s ego can only get so bruised. You lie back on your elbows, a smug grin on your face. She sets herself next to you, hands all over your [pc.belly] and pelvis.");
	
	var cIdx:int = mirrinSelectADick();
	var cIdxB:int = -1;
	if(cIdx >= 0 && pc.cockTotal() > 1)
	{
		var aCocks:Array = [];
		var i:int = 0;
		for(i = 0; i < pc.cocks.length; i++)
		{
			if(i != cIdx) aCocks.push(i);
		}
		if(aCocks.length > 0)
		{
			cIdxB = 0;
			for(i = 0; i < aCocks.length; i++)
			{
				if(pc.cLength(aCocks[i]) < pc.cLength(cIdxB)) cIdxB = aCocks[i];
			}
		}
	}
	
	//PC has cock + vagina:
	if(cIdx >= 0 && pc.hasVagina())
	{
		output("\n\nMirrin visibly licks her lips at the sight of your [pc.cocks]");
		if(pc.balls > 0)
		{
			output(", [pc.balls],");
		}
		output(" and [pc.pussy]. Her tongue is already hanging out and slathered up, aiming downwards. She shifts herself down the bed somewhat, looking for the right angle of attack. Pressing her face down to your [pc.pussy], both of her calloused, clawed hands gripping comfortably on your [pc.cock " + cIdx + "]. Already she’s pumping at your shaft, the double grip of her hands impossible to resist through will alone.");
		output("\n\nSimultaneously, her thick, lively tongue trails itself across your labia, already teasing out your wetness.");
		if(pc.wetness(0) >= 4) output(" It doesn’t take long for your [pc.cunt] to get particularly juicy.");
		output(" Without warning, it slithers right roughly into your [pc.pussy], recieving a hot, wet welcome.");
		if(pc.looseness(0) >= 4) output(" Your [pc.vagina] is already used to such an invasion and gives her no resistance at all!");
		output(" A throaty groan escapes from your [pc.lips] as both shaft and snatch get worked over at the same time.");
		if(pc.cockTotal() > 1) output(" You’re not even concerned with your untouched [pc.cock " + cIdxB + "] while getting such special treatment.");

		output("\n\nYou find your hands are reflexively gripping the bedspread. Sure pays to have double sets of sexes! The lusty qilin reaffirms this by tightening her grip on your [pc.sheath " + cIdx + "] and <i>then</i> by pushing her mouth right up to your [pc.pussy] as if to fully engorge on it. Her monster tongue fills out your [pc.cunt] with ease, writhing and sliding inside against your hyper-sensitive walls. Having a glance down, you swear you can almost see it bulge through your [pc.skin]...");
		output("\n\nThe deeper it gets, the more agitated and active it becomes, finding places within that you’d never thought would be felt. Her mouth-snake constantly brushes, rubs and slides against your G-spot. Every slurp and sway of her tongue brings you closer and closer to climaxing, your pleasured cries getting louder and louder!");
		output("\n\n<i>“Cuh... fuh! Myeruh-”</i> you stammer, followed by a throat burning orgasm!");
		output("\n\nOverwhelming surges of sensation and heat that rise from your pelvis. With only a throaty cry, [pc.cumVisc], [pc.cumFlavor] [pc.cumNoun] shoots out over your [pc.belly] while a splash of [pc.girlCumVisc] [pc.girlCum] covers the eye-closed face of your qilin lover, leaving splotches of [pc.girlCumColor] [pc.girlCumNoun] all over her mouth and chin.");
		if(pc.cumQ() >= 500) output(" The sheer volume of your [pc.cum] output is shown on the bedsheets: a splatterzone of [pc.cumColor]!");
		output(" She keeps squeezing on your softening [pc.cock " + cIdx + "], trying to get as much love juice from you as possible while her tongue goes into overdrive, writhing wildly within your sensation-saturated walls.");
		output("\n\nFeeling light-headed, you lay onto your back, breath squeaky and fast from that intense double orgasm. Mirrin clambers up to you, her mouth liberally sprayed with your [pc.girlCum] and [pc.cumNoun]. Without hesitation, she draws your [pc.lips] to hers, giving you a long, impassioned and flavored taste of yourself.");
	}
	//PC has cock:
	else if(cIdx >= 0)
	{
		output("\n\nShe spies your freely swinging [pc.cock " + cIdx + "] and moves to put her roughly marbled palm over it. Mirrin proves to be gentle with her grip but still, the roughness of her palms is a strange sensation. Using her index finger, she very lightly taps on your [pc.cockHead " + cIdx + "] with a claw. It nicks and pulls on a cellular level against those ultra-sensitive nerves, making your [pc.cock " + cIdx + "] tense and pulse reflexively in discomfort, something that brings an even wider smile out of the she-dragon.");
		output("\n\nYour face screws up as she plays with your tip, hands gripping at the fabric of the bed.");
		if(pc.isNice()) output(" <i>“T-that’s a little... weird,”</i>");
		else if(pc.isMischievous()) output(" <i>“J-jeez, that feels like torture,”</i>");
		else output(" <i>“I w-will end you if you don’t stop that”</i>,");
		output(" you stammer, tensed up all over.");

		output("\n\n<i>“Aw, is little Steeley-boo uncomfortable?”</i> She fires back, her attention focused on teasing your [pc.cockHead " + cIdx + "]. <i>“Just relax.”</i>");

		output("\n\nShe bends her neck forward to engorge herself on your meat.");
		if(pc.biggestCockLength() >= 10 && mirrinSelectADick() >= 0) output(" She has no problem eyeing up and going down on your sizable tool.");
		output(" Her mouth is warm and welcoming, her monstrous tongue making itself scarce while she clamps her limps round your shaft. It’s a complete change from the teasing she was pulling earlier: A hot, wet clamp to satisfy you in victory. Then she begins pumping.");
		output("\n\nFinally at full mast, her ministrations quickly fill you with pleasurable sensations. Although she appears somewhat bored, most of the work is done by the sheer sizes of her respective grips. That’s when you feel the tongue. It begins slowly, teasing the very edge of your urethra. Tickling such a sensitive spot draws out a whine from your lips to which you qilin lover reciprocates with an approving <i>“hmmm...”</i>.");
		output("\n\nThen her tongue wraps itself around your meat in her mouth like a coiled snake, stopping halfway. It writhes and twists around your [pc.cock " + cIdx + "], slathering it in saliva. She slowly bobs her head up and down... <i>shit</i>, it’s like being wrapped in three different feeling planes of existence!");
		if(pc.totalCocks() > 1) output(" You’re not even concerned with your untouched [pc.cock " + cIdxB + "] while getting such special treatment.");
		output(" The tight grip of her hand, the sloppier, faster movement of her tongue and the smooth, gentle sensation of her mouth on your [pc.cockHead " + cIdx + "] are almost unbearable. She hasn’t even been going that long and already you can feel yourself close to cumming.");

		output("\n\nThen you feel it, that surge of sensation and heat that rises from your pelvis. With only a throaty cry, your [pc.cumVisc], [pc.cumFlavor] [pc.cumNoun] shoots out into your lover’s awaiting maw!");
		if(pc.cumQ() < 2000) output(" She’s prepared, holding her stance so that it goes right down her throat without stopping, her tongue frantically twisting around your orgasming [pc.cock " + cIdx + "].");
		else output(" She’s prepared for your output, her throat and stance ready to take in as much as possible. It quickly seems that that’s not enough, so she pulls her head back and aims your spurting [pc.cock " + cIdx + "] away from the bed. <i>“</i>Shit<i>, look at it go!”</i> She calls out, [pc.cumColor] trailing from her delighted face.");
		output("\n\nYou lay back off of your elbows, fully spent. Your cum-covered lover clambers on the bed to meet you eye to eye, drawing your mouth to her’s for a deep, [pc.cumFlavor] tasting kiss.");
	}
	//PC has vagina:
	else if(pc.hasVagina())
	{
		var x:int = rand(pc.totalVaginas());
		output("\n\nShe eyes the spot between your [pc.legs], her monstrous tongue undulating out of her mouth. Without a word, she lowers her head to your hidden honeybox, tongue out and slathered in spit. Very gently, the writhing appendage tickles and laps at the side of your labia, teasing your [pc.cuntColor] [pc.pussyNoun " + x + "] to wetness.");
		if(pc.wetness(x) >= 4) output(" It doesn’t take long for your [pc.cunt " + x + "] to get particularly juicy.");
		output(" She does you a kindness however by pushing her tongue straight into your [pc.vagina] without hesitation.");
		if(pc.looseness(x) >= 4) output(" Your [pc.pussy] is already used to such an invasion and gives her no resistance at all!");

		output("\n\nThe feeling of the slithering, slimy appendage within your most intimate pleasure zone draws out a stifled squeal from your lips. Gotta be strong, you won over <i>her</i>!");
		if(silly) output(" But your dad is also Victor, so that might make it weird that you’re your own dad.");

		output("\n\nShe eyes you when your mewling moans rise in frequency. Your [pc.legs] can’t seem to stay still as your lovebox is eaten out. She moves in even closer, her face barely a few inches from your pelvis proper. Having a glance down, you swear you can almost see it bulge through your [pc.skin]... her tongue goes as far in as it can, then begins to <i>writhe</i>.");
		output("\n\nAs if letting lose some manner of beast, Mirrin’s dextrous foot long tongue squirms, snakes, and fills out your tender [pc.pussy " + x + "]. Finding places you never thought possible, it constantly brushes and slides against your G-spot. Every slurp and sway of her tongue brings you closer and closer to climaxing, your pleasured cries getting louder and louder!");
		output("\n\n<i>“Cuh... fuh! Myeruh-”</i> you stammer, followed by a throat burning orgasm. A splash of [pc.girlCumVisc] [pc.girlCumNoun] covers the scrunched up face of your qilin lover, leaving splotches of [pc.girlCumColor] [pc.girlCumNoun] all over her mouth and chin. In those final few seconds, her tongue goes into overdrive, writhing wildly within your sensation-saturated walls!");
		output("\n\nFeeling light-headed, you lay onto your back, breath squeaky and fast. Mirrin clambers up to you, her mouth liberally sprayed with your [pc.girlCum]. Without hesitation, she draws your [pc.lips] to hers, giving you a long, impassioned taste of yourself.");
	}

	output("\n\nYou both stay locked to each others lips for a pleasant few minutes, enjoying the warmth of each others mouths.");
	output("\n\nAfter one final kiss on the cheek, Mirrin gets up to turn on the shower. Having spent yourself dry, you gather your things together, bid her farewell, and return to your ship.");
	//PC returns to ship.
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

//Loss
//PC lust remains unchanged, no orgasm event.
public function loseToMirrin():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("<i>“Woohoo, I’m a winner, a winner is me, oh yeh,”</i> jokes the qilin, doing a mock dance. She kneels down on the edge of the bed, her toned, bare butt pointed at your direction. She uses her elbows to rest on then turns her head to you. <i>“Come </i>oooon<i>, Steele.”</i>");
	//PC is kind:
	if(pc.isNice())
	{
		output("\n\n<i>“Fair’s fair, I suppose...”</i> you sigh, resigned to your fate as the royal cliteater.");
		output("\n\n<i>“That’s the spirit, [pc.name]. I saw, conquered and now I uhhh, about to came, yes?”</i> she giggles, laughing at her own bad joke.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("\n\n<i>“You’re never gonna let me live it down, are ya?”</i> You sigh, rolling your eyes at her cocky display.");
		output("\n\n<i>“Aww, don’t be like that Steeley-boo. Just try again later... if ya dare,”</i> she giggles, wiggling her stacked tush.");
	}
	//PC is hard:
	else
	{
		output("\n\n<i>“I’ll get ya one of these days, dragon-bitch,”</i> you say with a heavy frown, shaking your head at the same time.");
		output("\n\n<i>“You’re just so </i>adorable<i> when you try, Steeley-boo,”</i> she fires back, mocking your uptightness.");
	}
	output("\n\nYou lower herself to her physical level, eyeing up what she has in store: A clean shaven cameltoe, one that appears to be quite underused. Her perky, ultra-defined ass protects it like a mountain range. She’s got her dick and ballsack tucked in front of her legs, the way wide open for you to focus on only her pussy. It’s a rather cute thing, considering everything else about the fearsome qilin woman.");
	output("\n\nWithout extra thought, you just go for it. Using your [pc.tongue], you start from her slightly pointed clit. Pressing the hot wetness of your [pc.tongue] against the sensitive button already brings out a croon of approval from the she-dragon. You slowly drag all the way from the clit to the top, your [pc.tongue] picking up tastes along the way. That familiar musk of cinnamon and charcoal dances on your tastebuds, and by extension, your nose gets a whiff of the same thing. It’s a little bit bitter, and a little bit sweet.");
	output("\n\nShe very gently pushes her rear lower, wanting you to continue. Having little choice but to comply, you push your mouth to her folds and force your [pc.tongue] inside.");
	output("\n\nThere’s a bit of resistance: She’s actually tight! Using it’s dexterity, you set about to making sure your [pc.tongue] is properly felt within. The qilin does indeed gasp in surprise as your mouth meat brushes, slides and squirms all over her most sensitive places. After a few tests, you determine where her G-spot is based on her squeamish reactions alone.");
	output("\n\nLet’s turn the tables! Focusing on her G-spot, your [pc.tongue] moves enthusiastically across the nerve cluster. This makes your qilin lover shuffle her knees together reflexively, her barely contained, girlish squeals a testament to your accuracy and the power of having such a long piece of mouth muscle. She starts gripping onto the bedsheets in response, pulling at the covers.");
	output("\n\nShe’s already dripping musky fluid from your ministrations, her unexpectedly tight Terran pussy winking and hot. She must already be quite close!");
	output("\n\nYou push for that extra mile, really working your [pc.tongue] into as many spots as possible. You can feel her inner muscles trying to constrict the writhing sensation she’s feeling but the softness of tongue-flesh prevents her from slowing your movements. It must be torture for her to not be in control for once...");
	output("\n\n<i>“Fuh..! Stee-!”</i> She starts to cry out, a series of garbled squeals and moans signaling her female-focused orgasm! Mirrin plants her face straight into the bed, saying something in her native language that you can’t follow.");
	if(silly) output(" <i>“Helvitis fokking fokk!”</i> Or something like that.");
	output("\n\nA thick dribble of her femcum ends up in your mouth and all over your [pc.lips].");
	output("\n\nYou can feel her insides tensing and spasming against your tongue as her orgasm subsides, eventually going limp after a few more seconds.");
	output("\n\nYou withdraw your mouth from your sated lover, wiping your mouth of her femjuice; but not before savoring a little.");
	output("\n\nYou stand up to inspect your lover: Her arms lie splayed in front of her and her face is still planted into the covers. She meekly turns her head to you, droopy eyelids and a breathy grin on her face.");

	//PC is kind:
	if(pc.isNice())
	{
		output("\n\n<i>“Nooow who’s the adorable one? Silly Mirrin,”</i> you tease, a similar, cum-spotted smile on your face");
		output("\n\n<i>“I guess *<i>huff</i>* you’re the... </i>hu-<i>real winner here,”</i> she replies slowly, reburying her face in defeat.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("\n\n<i>“And with that, the mighty Steele did slayeth the Dragon Queen, within her own lair no less,”</i> you taunt, laughing all the way.");
		output("\n\nShe can only sheepishly giggle back.");
	}
	//PC is hard:
	else
	{
		output("\n\n<i>“Told you I’d get ya,”</i> you say flatly, a knowing, smug grin on your face.");
		output("\n\n <i>“Heh... *<i>huff</i>* remind me to uhhh... take you down a peg later,”</i> she replies slowly.");
	}
	output("\n\n<i>“Mmmm... just gonna... stay here for a few... hours,”</i> the breathy qilin adds, rubbing her face and bare chest against the covers. <i>“Think of that all over again...”</i>");
	output("\n\nShe seems rather worn out by the apparently amazing mouthjob you just gave her. Not wishing to disturb her, you gather your things together and bid the satisfied dragon goodbye. Back to the ship!");
	//PC returns to ship.
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

//Humiliation Anal
public function humiliationAnalWithMirrin():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("<i>“Hmm... I’ve got something buuut... tell me if is too much,”</i> she says, clasping your hands in her own.");
	output("\n\n<i>“So... you know I have an audience. A </i>very<i> open one. And uh... maybe we could put on a show together, hm? Up to you, though, </i>elskan<i>...”</i> she finishes, stroking the side of your [pc.face].");
	processTime(2);

	clearMenu();
	//[Yeah!] [Nah!]
	addButton(0,"Yeah!",yeahAnalStuff,undefined,"Yeah!","This could be interesting...");
	addButton(1,"Nah!",nahNoHumiliationAnal);
}

public function nahNoHumiliationAnal():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("You tell her you’re not into the idea.");
	output("\n\n<i>“No worries, I’ll think of something else for us...”</i>");
	processTime(1);
	//brings up [BodWorship] [Deep DP] [Train..?] [Humiliation] sex options menu.
	mirrinSexMenu();
	addDisabledButton(3,"Humiliation","Humiliation","You just opted out of that.");
}

//Yeah!
//PC exhibitionism increased by 10.
public function yeahAnalStuff():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	pc.exhibitionism(2);
	var piggie:Boolean = (pc.thickness > 65 && pc.tone < 50);
	output("Intrigued, you ask her what she’s going to do...");
	output("\n\n<i>“Well... that’d be telling,”</i> she winks at you, shuffling away to a chest of drawers by the side of the bed. She does a twirling hand gesture towards you. <i>“No peeking, Steele...”</i>");
	output("\n\nHaving agreed to play along with her games, you turn to face the window. The reflection in it is messed with by the light outside so you can’t quite tell what she’s getting out... after a few moments, her muffled <i>clop clops</i> approach from behind you. <i>“Have a look.”</i>");
	output("\n\nYou turn apprehensively. She’s holding some bundles of black bindings and straps, although it’s obvious what they’re going to be for. The she-dragon holds up wrist bindings, ankle bindings, and elbow-locks, looking back and forth to see how to adjust them. Unsure of what to do, you pipe up.");
	if(pc.isNice()) output("\n\n<i>“Uh, so... where’s what going?”</i> You enquire, feigning your foreknowledge of such things.");
	else if(pc.isMischievous()) output("\n\n<i>“Jeez, as if you needed more ways to pin me down,”</i> you joke sarcastically.");
	else output("\n\n<i>“So what, couldn’t use your fists to hold me down?”</i> You mock, folding your arms.");

	output("\n\n<i>“Dooon’t worry yourself, Steele. Just put your hands out,”</i> she instructs, walking behind you. Wishing to see where this goes, you comply. She pulls your hands round to your back, holding them at the wrists. You feel the tough fabric tighten around them both and within seconds, you find them severely restricted in movement. A similar feeling surrounds your elbows and with a quick pull, they too pull together. The bindings don’t feel so tight but the actual pose itself is awkward, almost uncomfortable. You find you bending over forwards to compensate.");
	output("\n\n<i>“Good, good,”</i> approves Mirrin, a hard emphasis on every D");
	if(silly) output(" and I’m not doing this joke again, lolol");
	output(". You can feel her hands round your ankles, more bindings keeping your joints together. She stands up and faces you, placing a hand on your cheek. She says nothing but her resultant grin tells all.");
	output("\n\nShe gets something else out of the drawer.");
	output("\n\n<i>“Alright, Steele, close your eyes, open your mouth wide and stick your tongue out,”</i> she says assertively.");
	output("\n\nYou comply but a certain anxiety comes about... you feel a round, hard object being placed on your outstretched [pc.tongue] and then pushed into your mouth. Then, there’s the feeling of several straps tightening against your head and [pc.hair]. <i>“Bite softly,”</i> comes another command.");
	output("\n\n<i>“And... open your eyes.”</i>");
	output("\n\nAs you’re already facing the window, you get a good look at your current, bound state.");
	if(pc.thickness > 65) output(" Is that an... apple in your mouth??");
	else output(" That’s one tight ballgag you have on...!");
	output("\n\n<i>“Hng hrrngngn,”</i> you try to say, only just realizing that you can’t actually speak...");

	//PC thickness >65:
	if(piggie)
	{
		output("\n\n<i>“Shh...”</i> says the whispering dragoness. <i>“Be a good piggy for me and keep silent until I say.”</i>");
		output("\n\nPiggy...?!");
	}
	//else:
	else output("\n\n<i>“Shh...”</i> says the whispering dragoness. <i>“Be a good fucktoy for me and keep silent until I say.”</i>");
	output("\n\nShe puts a firm hand on your shoulder, using it direct you to the bed. Already resigned to your fate, you shuffle timidly onto the bed knees first. She helps you along, manipulating your limbs so that you’re completely folded over: on your shins, your [pc.butt] touching your ankles and your knees touching your [pc.chest]. You’re not sure if you’ve ever been so vulnerable...");
	output("\n\n<i>“Hanging in there, ");
	if(pc.thickness > 65) output("piggy?");
	else output("bitch?");
	output("”</i> asks your dragon queen. Seeing as the only way out seems to be forward, you slowly nod, your eyes focused on your reflection in the window. With a particularly hard slap on your exposed [pc.butt] as you nod, the qilin takes a step back to admire her handiwork. She doesn’t say anything but you can palpably feel her gaze scanning every part of your naked, bound form. She reaches for her dataslate, tapping away on it.");
	output("\n\n<i>“Heeey guys, see where I am? Livestream in 5 minutes, make sure you’re </i>alone<i>. Got a special treat for all you amazing, amazing people, </i>muah<i>,”</i> she finishes, a blown kiss at the end.");
	output("\n\nOh shit, she was talking to her fanbase of untold hundreds of thousands... <i>and they’re going to be watching you</i>.");

	//PC thickness >65:
	if(piggie)
	{
		output("\n\n<i>“Almost forgot actually,”</i> she says out loud, reaching for something out of your vision. She very quickly comes into view with some sort of headband.");
		if(pc.earType == GLOBAL.TYPE_SWINE) output(" Mirrin pauses, giving it a look over. <i>“Naaah, you already got ‘em,”</i> she says, putting the headband away again.");
		else output(" Mirrin shows you the headband: A pair of plastic pig ears. So she’s done this before...? She slides it onto your head, manipulating your own [pc.ears] out of the way to make sure the fake ones are in full view.");
		output(" This all seems fairly degrading...");
	}
	output("\n\nYou watch her reach around for a jar of some cream - EasyFit on the label - and apply some to her palm. Reaching around to your behind, she roughly rubs a palmful of the cold cream down your crevice and against your [pc.asshole]. She presses very firmly onto your [pc.asshole] when she finds it, making sure your entire rim is creamed up and ready for a stretchin’.");
	output("\n\nShe brings up her dataslate. <i>“Lets see... hey, everyone! Here’s the treat I promised...”</i>");
	output("\n\nThe dragoness shoves the screen a foot in front of your face, enough for you to make out a smaller version of yourself surrounded by emote-filled, fast moving chat logs. Jeez, what a thing to agree to...");
	//PC thickness >65:
	if(piggie)
	{
		output("\n\n<i>“This lil’ piggy has been skipping " + pc.mf("his","her") + " exercises! You know how I tell you guys that commitment to fitness is king?”</i> she gestures with a fist pump and a bulging bicep.");
		output("\n\n<i>“Apparently, this piggy thinks no...”</i>");
		output("\n\nYour [pc.face] visibly scrunches up every time she says ‘piggy’, reflecting back to you in the dataslate. The chat goes wild.");
		output("\n\n<i>“So what do we do with naughty piggies, dear viewers?”</i>");
		output("\n\nVarious variations of <i>“punish!”</i> Pop up at an alarming rate, a repeated emote of some sort of chibi dragon appearing just as frequently. The slate goes from your field of view just as swiftly as it came. <i>“Let’s get to it guys, lets <i>roast</i> this pigslut!”</i>");
	}
	//else:
	else
	{
		output("\n\n<i>“This rich bitch ");
		if(pc.isNice()) output("just begged for my dicks!");
		else if(pc.isMischievous()) output("wouldn’t shut that dirty mouth!");
		else output("thinks we’re on the same level!");
		output(" You know what we do with that kind of naughtiness, guys?!”</i>");
		output("\n\nVarious variations of <i>“punish!”</i> Pop up at an alarming rate, a repeated emote of some sort of chibi dragon appearing just as frequently. The slate goes from your field of view just as swiftly as it came. <i>“Let’s get to it guys, let’s plow some bitchmeat!”</i>");
	}
	output("\n\nEep...");

	output("\n\nThe she-dragon takes her time with getting on the bed, constantly talking back into her dataslate that she holds up with a hand. When she’s in position, her palm <i>smacks</i> against your [pc.butt]. You want to yelp but you only manage to get a strained syllable out.");

	output("\n\n<i>“Ready, ");
	if(piggie) output("pigbitch?!");
	else output("fuckmeat?!");
	output("”</i> she shouts from on high, her throbbing meat pressing hotly on your exposed [pc.asshole]. <i>“Watch this one, guys...”</i> she says into her device.");
	output("\n\nWith a sharp shunt, she forces her mammoth meat inside you!");
	output("\n\n<i>“Unggg, look at THIS shit!”</i> she shouts out with exaggeration, angling down the device to where dickflesh meets your stretching sluthole. She’s mercifully slow with her first thrusts but each one goes deeper and <i>deeeeeper</i> until she hits a depth she’s comfortable with. With a clawed hand digging into your [pc.ass], she grips lightly enough that you feel her claws hook in but not break skin. Still, the pain compounds with the abuse your [pc.asshole] is going through, making your eyes water.");
	if(silly) output(" KreyGasm KreyGasm KreyGasm");
	if(piggie) output("\n\n<i>“Squeal, pigbitch!”</i>");
	else output("\n\n<i>“Scream for me, fuckmeat!”</i>");

	output("\n\nOn command, you whine through your restraint. An excited giggle from your dominator shows her approval but it only makes her redouble the efforts in fucking your gaping hole. ");
	if(pc.isHerm()) output("Your [pc.cocks] and [pc.pussies] - perpetually hard and wet from need");
	else if(pc.hasCock()) output("Your [pc.cocks] - perpetually hard from this brutal prostate punishment");
	else if(pc.hasVagina()) output("Your poor [pc.pussies] - in a burning heat of need");
	output(" - won’t be getting relieved any time soon...");

	output("\n\nTaking a pleasure in your whines and scrunched up face, the dragoness slows her thrusts but refocuses on trying to bottom out inside you. You and your poor sluthole are completely at her mercy. <i>“Holy <i>shit</i> guys, this is *</i>unffff...<i>* the best thing in the world. Don’t you guys just”</i> - she pauses, shunting her meatspear harshly into you - <i>“wish you had this ass right now, huh? Yeeeah, I see you in the chat you </i>dogs<i>,”</i> she murmurs with a sensuous voice into her dataslate. Hot pre-cum fills out what little space is left, some of it spreading all the way round Mirrins meatpole for added lube... and encouragement. The heat is enough to bring out a timid whine from your stuffed mouth which in turn makes Mirrin giggle maliciously at your feeble form. The claw gripping your [pc.butt] grips just a little bit harder...");

	pc.buttChange(mirrin.cockVolume(0));

	//PC thickness >65:
	if(piggie)
	{
		output("\n\n<i>“Well guys, uh *<i>unffff</i>* mmmmfuck... we stuffed this roast pretty good, huh? How bout we baste this *<i>nggshit...</i>* baste this piece of pigmeat?!”</i>");
	}
	else output("\n\n<i>“Well guys, uh *<i>unffff</i>* mmmmfuck... we’ve stretched this slut pretty good, huh? How bout we *<i>nggshit...</i>* claim this bitch as ours?!”</i>");
	processTime(30);
	pc.lust(40);
	clearMenu();
	addButton(0,"Uh oh",uhOhButtmiliation);
}

public function uhOhButtmiliation():void
{
	clearOutput();
	author("SoAndSo");
	var piggie:Boolean = (pc.thickness > 65 && pc.tone < 50);
	showMirrin(true);
	//PC lust set to 0, orgasm event. 1 hour 30 mins of in game time passes.
	output("You feel that familiar surge of a climax build up inside you! ");
	if(pc.isHerm()) output("With a tongue-blocked scream of pained pleasure, your [pc.cocks] and [pc.pussies] can’t hold back, unleashing a steamy, simultaneous burst of [pc.cum] and [pc.girlCum] all over your [pc.legs] and the bed!");
	else if(pc.hasCock()) output("With a tongue-blocked scream of pained pleasure, your [pc.cocks] has all the [pc.cum] you could muster unleashed against your [pc.belly]! It forms a gooey splatterzone on your underside and the bed.");
	//PC has vagina:
	else if(pc.hasVagina()) output("With a tongue-blocked scream of pained pleasure, your [pc.pussies] has all the [pc.girlCum] you could muster unleashed! It all spurts out uselessly against your [pc.legs] in a warm glaze.");
	
	output("\n\nNot to be outdone, you feel your qilin lover extract her massive meat when you’re mid orgasm, the emptiness you feel as it leaves your gaping [pc.asshole] adding catharsis to pleasure and pain. She very quickly moves off of the bed, jerking both her horsecocks with her free hand. Damn, those massive fingers! The familiar sight of her urethra pointed right at your face is enough warning for what’s to cum...");
	output("\n\nWith her dataslate pointed between her cocks and your face and a rising crescendo in her restrained wails, a thick, superhot double load of smoky dragoness babybatter splatters right into your [pc.face]! Keeping her grip stable even with the wild pumping she’s got going on, the qilin keeps virile shot after virile shot focused on your scrunched up face. You just about close your eyelids in time before you’re blinded!");
	output("\n\nIt takes almost half a minute for her double orgasm to subside. By the end of it, a metre wide, gooey pool of hot spunk drips from your face to the bed and to the floor. It’s all in your eyes and fills your nose up with its unique musk. Mirrin’s almost gone cross-legged, visibly trying to slow her breath from the intense sensation ripping through her hulking form.");
	//PC thickness >65:
	if(piggie) output("\n\n<i>“Hoooly shit, guys... *<i>huff</i>* now that’s a basted pig, huh? <i>Fokk...</i>”</i>");
	else output("\n\n<i>“Hoooly shit, guys... *<i>huff</i>* we own this bitch now, huh? <i>Fokk...</i>”</i>");

	output("\n\nShe lets her softening cocks dangle free, a little after-spooge pooling on the floor. Using her free hand, she wipes the goop away from your eyelids with the back of her wrist. Placing that hand with a genuine tenderness, she angles her device at your face. <i>“Hope ya had fun, guys. Got me a ");
	if(piggie) output("pig to clean...");
	else output("slut to clean up...");
	output("”</i>");

	processTime(20);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",oinkoinkEpilogueButtHimiliation);
}

public function oinkoinkEpilogueButtHimiliation():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	output("She exhales slowly and turns off the dataslate. Immediately, she sets about cleaning you up and untying your bonds. You’re so worn out from being used that your body seems limp and shaken from it all. Sensing this, Mirrin takes extra care to be gentle with her movements. After she finishes, she sits you up in her lap and holds you close to her warm skin. Together, you bask in each others warmth without a word, simply enjoying the comforting heat.");
	output("\n\nAfter half an hour of aftercare and cuddles passes you’ve regained some of your energy back.");
	output("\n\n<i>“Hope that wasn’t too uhhh... cruel of me,”</i> murmurs the dragoness in a low tone. <i>“We don’t have to ever do that again, you know. It’s for the fans, so really it’s just me being a complete </i>asni<i> to you and I can uhhh... get why you wouldn’t want that.”</i>");
	output("\n\nShe nuzzles the back of your neck.");
	//PC is kind:
	if(pc.isNice())
	{
		output("\n\nYou nuzzle back, cheek to cheek. <i>“It’s not </i>completely<i> off the table...”</i> you say, a weak grin trying to form on your face.");
		output("\n\nShe squeezes you even closer to her, adding a kiss on the cheek.");
	}
	//PC is misch:
	else if(pc.isMischievous())
	{
		output("\n\nYou squeeze both of her veiny forearms out of affection. <i>“You never know. The hugs are the best bit...”</i> you reply, rubbing your shoulders into her chest.");
		output("\n\nShe chuckles, squeezing you even closer to her.");
	}
	//PC is hard:
	else
	{
		output("\n\nA smile forms on your face. <i>“Well, only if the roles are reversed...”</i> you whisper in a disgruntled manner.");
		output("\n\nShe tsk-tsks at your suggestion, giving you a hearty squeeze with her arms as a show of force.");
	}
	output("\n\n<i>“Anyway, I gotta clean up then... get back to the gym. Routine doesn’t perform itself,”</i> she says with a hint of regret, rubbing one of your wrists. You tell her it’s ok, give her one last kiss, and gather your equipment together. With a goodbye, you leave for the ship.");

	processTime(10);
	pc.shower();
	clearMenu();
	IncrementFlag("SEXED_MIRRIN");
	addButton(0,"Next",move,shipLocation);
}