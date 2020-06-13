import classes.Items.Protection.ProtoShield;
import classes.Items.Protection.JumperShield;
import classes.Items.Armor.RattyArmor;
import classes.Items.Guns.HandCannon;
import classes.Items.Melee.Vibrolass;
import classes.Items.Guns.TriBeamRifle;
import classes.Items.Melee.TrickBracer;



/* By Fenoxo Fenbutte:
Teenage runaway who got mauled by a Kordiiak Bear.
Big game hunting pirate killed the bear, saved him, and adopted him. Name/Rank TBD, but probably one of the bosses.
Speaks decent english, but a bit of an oddity. Considers technology to be magic and himself an artificer.
“Affably Gruff” personality.
Other young pirates took him out for an “initiation” when he came of age, resulting in his more interesting sexual attributes and heightened libido.

Appearance:
4'11" tall and stocky.
White fur, green eyes,
Robotic hand halfway up his forearm. Sophisticated and packed with retractable tools.
Claw scars across his face and one subtly robotic eye. Bite scars on his shoulder (the same side as the eye and arm injury)
11" bright blue dog-dick with an oversized knot that engorges fully whenever he has a boner.
Leaks cum the moment any pressure is applied to his knot, often running dry long before the actual orgasm.
*/

//Urbolg First Time Meeting
public function zhengShiHangerFloorBonus():Boolean
{
	if(flags["MET_URBOLG"] == undefined) 
	{
		urbolgMeeting();
		return true;
	}
	else if (!pc.hasStatusEffect("Rat Delay") && flags["RATS_ENABLED"] == undefined)
	{
		ratsAttemptUrbolgRobbery();
		return true;
	}
	else
	{
		if(pc.hasStatusEffect("URBOLG_DISABLED"))
		{
			output("\n\nUrbolg the korgonne mechanic is here, working on something, but he still looks kind of mad. Letting him cool off for a day might be best.");
			addDisabledButton(0,"Urbolg","Urbolg","Urbolg is still mad at you.");
			return false;
		}
		else if(pc.hasStatusEffect("URBOLG_DISABLED_BY_COOKIES"))
		{
			output("\n\nUrbolg is still cleaning up the mess he made with those cookies! Wow, that’s a lot of cum!");
			addDisabledButton(0,"Urbolg","Urbolg","Urbolg is still cleaning.");
			return false;
		}
		else if(pc.accessory is MaikesCollar) output("\n\nUrbolg the korgonne mechanic is cussing at a piece of machinery. <b>Maybe he’ll help you get this collar off?</b>");
		//Defeated Urbolg by lust or ever fucked him:
		else if(flags["URBOLG_LUSTED"] != undefined || flags["SEXED_URBOLG"] != undefined) output("\n\nUrbolg the korgonne mechanic busily works to repair a scrap engine hanging from a lift, but he keeps casting sly glances in your direction with his robotic eye. The fluffy little devil seems to have taken a liking to you!");
		//Normal Urbolg
		else output("\n\nUrbolg the korgonne mechanic busily toils over a junked engine. The hunk of blast-ruined metal hangs from a lift as he works on it, fully absorbing his attention.");
		addButton(0,"Urbolg",peacefulApproachUrbolg);
	}
	//Bonus shortcut!
	if(flags["ZHENG_SPACEWALKED"] != undefined || flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined)
	{
		if(pc.hasAirtightSuit() && !(pc.armor is SpacesuitComplete)) 
		{
			addDisabledButton(1,"Spacewalk","Spacewalk","You need a spacesuit with magnetic boots if you’re going to walk around out there. Maybe you can find one in the mines.");
		}
		else if(pc.armor is SpacesuitComplete) 
		{
			output("\n\nYou could walk around the outside of the station to get back into the mines without enemy interference....");
			addButton(1,"Spacewalk",fastSpacewalkToAirlock,undefined,"Spacewalk","Take a jaunt in the vacuum back to the mine’s airlock.");
		}
		else
		{	
			addDisabledButton(1,"Spacewalk","Spacewalk","Stepping into space without protection is a one-way ticket to a real quick death. You aren’t feeling particularly suicidal today.");
		}
	}
	if (boredJumperPregScene() > 0) return boredJumperPregHangerEncounter();
	
	return false;
}

public function showUrbolg(nude:Boolean = false):void
{
	showName(flags["MET_URBOLG"] == undefined ? ((CodexManager.entryUnlocked("Korgonne") ? "KORGONNE" : "CANINE") + "\nMECHANIC") : "\nURBOLG");
	showBust("URBOLG" + (nude ? "_NUDE":""));
}
public function pbcookiesUsedOnKorgonne():Number
{
	var count:Number = 0;
	if(flags["LUND_PB"] != undefined) count += flags["LUND_PB"];
	if(flags["URBOLG_PBED"] != undefined) count += flags["URBOLG_PBED"];
	if(flags["TUUVA_COOKIES"] != undefined) count += flags["TUUVA_COOKIES"];
	if(flags["NENNE_COOKIES"] != undefined) count += flags["NENNE_COOKIES"];
	return count;
}

public function urbolgMeeting():void 
{
	clearOutput();
	showUrbolg();

	output("The landing ramp lowers with an audible hiss and thump. A surly looking ");
	if(CodexManager.entryUnlocked("Korgonne")) output("korgonne");
	else output("canine");
	output(" stands squarely at the base of it, arms folded impassively. One gleams with obvious metallic shine - a prosthetic, well made. A similar glint from his left eye hints that the cybernetics don’t end there, but you have little time for a more in-depth appraisal.");
	output("\n\n<i>“Oi! If you’re a pirate, then I’m a fekkin’ nursemaid’s tit. Ye oughta turn yer ass about and make with the flying if ye know what’s good fer ye.”</i>");
	output("\n\n<i>“That’s not what the docking agent told me.”</i>");
	output("\n\n<i>“The docking agent?”</i> He lifts his metal arm and raises the middle finger, sparking a plasma flame to life. <i>“That’s what I think of the stars-blasted ‘docking agent.’ Who the fuck even uses words like ‘docking agent,’ anyway? Cops, maybe.”</i> He steps closer, knuckles refining into wicked-looking spikes. <i>“Or Black Void. Don’t care one whit. Ye want in this station, yer gonna have to go through me.”</i> The other hand dips into an oil-stained apron, coming up with a comically-large hand cannon. <i>“Fekkin’ sneakers.”</i>");
	output("\n\nIt looks like you’ve have to fight the ");
	if(CodexManager.entryUnlocked("Korgonne")) output("stocky korgonne mechanic.");
	else
	{
		output("stocky mechanic. Your Codex weakly chimes to alert you that he’s something called a ‘korgonne,’ for all the good that will do you now.");
		CodexManager.unlockEntry("Korgonne");
	}
	processTime(3);
	var tEnemy:Urbolg = new Urbolg();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(defeatUrbolg);
	CombatManager.lossScene(loseToUrbolg);
	CombatManager.displayLocation("MECHANIC");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//PC Loses His Shit
//Urbolg drags you into your ship
public function loseToUrbolg():void
{
	if(flags["URBOLG_LOSSES"] == undefined)
	{
		//Lust
		if(pc.lust() >= pc.lustMax()) 
		{
			output("You writhe on the ground from your overwhelmingly passionate desires. Who cares that the mechanic didn’t even try to turn you on? You’re enough of a slut for the both of you!");
			output("\n\n<i>“Not sure what yer trying fer, but I ain’t got the time for it.”</i>");
		}
		//HP
		else
		{
			output("You collapse onto the deck, too bloodied to raise a finger to the mechanic.");
			output("\n\n<i>“Ye stupid shit. Kor’diiak bear couldn’t finish me. How in a snowy hellstorm did ye stand a chance?”</i>");
		}
		//Merge - no new pg
		output("\n\nMetal fingers firmly grab you by the wrist. <i>“Get yer shit together in yer ship, and get out of me hangar.”</i>");
		output("\n\nYou’re dragged bodily up your own boarding ramp and back to your own cabin by the uncaring korgonne.");
		output("\n\n<i>“Decent piece of hardware, at least.”</i> He drops you there and stomps out, grumbling something about idiots trying to get themselves killed. In the distance, you hear your boarding ramp hiss closed.");
		flags["URBOLG_LOSSES"] = 1;
		output("\n\n");
		currentLocation = "SHIP INTERIOR";
		generateMap();
		CombatManager.genericLoss();
	}
	//PC Loses Twice: Bad End
	else
	{
		output("You lie there, too ");
		if(pc.lust() >= pc.lustMax()) output("turned on");
		else output("injured");
		output(" to resist.");
		flags["MET_URBOLG"] = 1;
		showUrbolg();
		output("\n\n<i>“Idiot.”</i> The mechanic scowls. <i>“I tried to save, ye stupid cunt.”</i> He shakes his head sadly and stalks forward, pulling a metal collar from one of his pockets. <i>“But I guess some folk are meant to be slaves. Ye throw yourself out there without an ounce of skill or wisdom. People like you... collaring’s a mercy. Better I claim ye than ye get yerself killed by someone worse.”</i>");
		output("\n\nWait, collar? You try to wave it away, but the ice-cold metal snaps around your neck with deafening finality. It’s cool and tight, cinching itself down to perfectly match the contours of your throat without choking off your breath.");
		if(pc.hasChitin() || pc.hasFur() || pc.hasFeathers() || pc.hasScales()) output(" A faint hiss sounds as it eats through your [pc.skinFurScales] to press against the bare skin beneath.");
		output(" You poke and prod at the nefarious piece of jewelry, but when you begin to wiggle a finger beneath the metal, everything below your neck lights up in incandescent pain.");
		output("\n\nYou thrash and scream while the korgonne drags you up the ramp into your ship. Lightning eats at you from your fingertips to your [pc.toes].");
		output("\n\n<i>“See? Stupid. Somebody slaps an obedience collar on ye and the first thing ye do is trigger the failsafe.”</i> The frustrated dog-man drops you on the deck and pulls hand-sized computer out of a pocket. <i>“Good thing I was here ta baby ye, or you’d be screaming till I wandered back.”</i> A few taps on its screen end the torture, though your teeth chatter at the same, still trying to come to terms with the unearthly agony.");
		if(pc.lust() >= pc.lustMax()) output(" The previously overwhelming lust feels so much more manageable now.");
		output("\n\n<i>“Wha...?”</i>");
		output("\n\nStepping over your middle, the mechanic rudely sits down on your [pc.chest]");
		if(pc.biggestTitSize() >= 4) output(", slapping a tit for good measure");
		output(". <i>“Lemme start over. That thing around your neck is an obedience collar. A good one too. Not one of the cheap ones that’ll leave ye burnt out and braindead after a few weeks.”</i> He slips the device away and wipes the sweat from his brow. <i>“Fuck with it, and it’ll make ye wish for death. Don’t fuck with it. Yer a pretty bitch, and I’d rather leave ye smilin’ than crying.”</i>");
		output("\n\nYou nod, unwilling to attempt a struggle until you know for sure you can safely do so.");
		output("\n\n<i>“Ahh, good. Yer learning.”</i> His expression turns genial. <i>“Ye got a name, slave?”</i>");
		output("\n\n<i>“[pc.Name],”</i> you answer in a meaker voice than you meant to use.");
		output("\n\n<i>“[pc.Name]? I can work with that, but I’ll probably call ye bitch more often’n not.”</i> He smirks. <i>“Perks of owning a slave. Now, my name’s Urbolg, but ye call me Master. Go on. Try it.”</i> He folds his arms and looks on impatiently.");
		output("\n\nYou feel like you should resist, maybe force him to torture you into it, but why bother? You’ve already lost, already been collared. You may as well play along until you get your chance to turn the tables.");
		output("\n\n<i>“Yes, Master.”</i>");
		output("\n\nRelief floods through your body as your pain tightened muscles slacken, singed nerves soothed into placid coolness. The sensation is not unlike getting a full-body massage. Invisible hands tease apart every single knot of tension, work away any hint of discomfort until you’re left with such a powerful sense of full-body wellness that you can’t help but release a blissful sigh.");
		output("\n\n<i>“Ye like that, do ye?”</i> Urborg grabs you roughly by the chin and turns your head from side to side. His piercing mechanical eye seems to bore right through you. <i>“Yeah ye do. Collar looks good on ye. Tighter than a whore’s corset.”</i> His furred finger strokes the cold metal. <i>“You’ll start ta like it before long, mark my words. Hard ta stay made at something what can make ye feel so nice.”</i>");
		output("\n\nIt takes a few too many seconds to remember to shake your head in protest. That lingering sense of well-being makes it hard to remember to fight, not when complying can feel that good. <i>“No I won’t.”</i>");
		output("\n\n<i>“Aww, so ye’re packin’ a backbone after all.”</i> Urbolg lifts his apron off his shoulders and tosses it aside, revealing his... <i>everything</i>. It’s impossible not to look at the bulging sheath or the hint of bright blue cock that’s begun to rise out of it. <i>“Shame it won’t matter. Say it again. Call me Master.”</i>");
		output("\n\n<i>“No.”</i> Now that you’ve tasted the pleasure it offers, you have no urge to further indulge the insidious collar or your korgonne captor any further.");
		output("\n\n<i>“Psh. Say it. I’d rather not have ta trigger the failsafe for ye.”</i>");
		processTime(20);
		clearMenu();
		addButton(0,"Next",ubrolgBadEndII);
	}
}

public function ubrolgBadEndII():void
{
	clearOutput();
	showUrbolg(true);
	output("Fuck. You don’t really have an option here. You can resist and suffer excruciating pain until you break and do it anyway, or... just go along with it and try your damnedest to maintain your defiance in spite of the pleasures obedience offers. Urbolg’s got you right where he wants you: right between his legs and compelled into reluctant submission.");
	output("\n\n<i>“Master,”</i> you spit the word, schooling your eyes to stare defiantly into his own instead of down at his big, fuzzy balls or slowly-emerging cock. Your willpower lasts for all of the second it takes for the collar to give you its reward, suffusing your every pore with contentment, smoothing away your aches under a coat of artificial satisfaction. Knowing that the collar is somehow hijacking your nervous system doesn’t provide you with the tools to resist its artificial bliss.");
	output("\n\nYou moan, eyes fluttering closed, and slowly blink them open, your vision filled with the sight of Urbolg’s cock. It’s plenty big, nearly a foot long and so heavily engorged that it wobbles with the korgonne’s excited heartbeat. <i>“Whoah. You um...”</i> Still feeling tingles of niceness sparking ");
	if(pc.hasToes()) output("between your [pc.toes]");
	else output("between your fingers");
	output(", you mouth damning words before you can think to stop yourself, <i>“You’ve got a really big cock, Master.”</i>");
	output("\n\nInstead of becoming overwhelming, the nebulous feeling of wellness seems to subtly thicken instead, like pulling a second blanket over yourself on a cold winter’s night. You look up at Urbolg to see him smiling down at you. He’s actually kind of handsome, in a roguish, fluffy sort of way.");
	output("\n\n<i>“Good bitch,”</i> the dog-man growls with gentle head-pat that turns into a long stroke along the outer edge of your [pc.ear]. <i>“See? Better to be smiling. Best part is, the longer ye wear yer collar, the better it gets at training you. Pretty soon ye won’t even need to say it. Just thinking about being a good bitch’ll get ye rewards. Ain’t it nice?”</i>");
	output("\n\n<i>“Yeah,”</i> you groan, languidly sprawling out as much as Urbolg’s weight will allow, feeling too nice to manage the sarcasm you meant to inject. <i>“It feels preeeetty good.”</i>");
	output("\n\n<i>“Tch. Te be honest, I’m about half jealous of ye.”</i> He snorts. <i>“You get contentment from a few words, and I’m ‘ere with a boner hard enough to bend metal. Guess it’s a good thing you’re gonna be helping me with it, eh?”</i>");
	output("\n\n<i>“Huh?”</i> Ur- no, <i>Master</i> seems like he needs something from you. You look up, staring at the turgid dog-cock he’s presented with, suddenly very aware of the heavily swollen knot at its base. It looks almost ready to pop, and the heady musk that swims around it raises the temperature of your obedience-induced satisfaction a few degrees. <i>“Master’s so hard,”</i> you observe.");
	output("\n\nYou can’t stop yourself. Calling him ‘Master’ feels too nice.");
	output("\n\n<i>“How’d ye feel ‘bout suckin’ it?”</i>");
	processTime(15);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",ubrolgBadEndIII);
}

public function ubrolgBadEndIII():void
{
	clearOutput();
	showUrbolg(true);
	output("Now that he’s asked, you can’t help but consider it. Regardless of your previous feelings on the korgonne, as soon as you imagine your lips touching down on that bitch-breaker of a boner, you grow hot and horny, your body filled with a strange blend of anticipatory excitement and blissful complacency. You could still say no. You know that you could. Just turn your head to the side and choose not to indulge in your collar’s rewards.");
	output("\n\nA few aches make themselves known in the back of your head until you envision yourself tonguing over his heavy, bestial balls. You’ve <i>obeyed</i> more than enough to be spared his ire, should you decline, but why bother? Master’s got you trapped for now. You might as well enjoy yourself. Why not see how nice sucking his cock can feel?");
	output("\n\nYou regrettably drag your eyes back up to Urbolg’s face. <i>“");
	if(pc.isBimbo()) output("Like, if you want me to, I’d suck it super good!");
	else output("If you want me to, I guess I can.");
	output("”</i>");
	output("\n\nThe canny korgonne raises an eyebrow. <i>“Of course I do, ye silly bitch. It sounds like yer itchin’ to give it a lick, to me. Try asking nicer.”</i>");
	output("\n\nInhaling through your nose, you can’t help but bask in Master’s undeniably male aroma. <i>“Can I... can I lick it?”</i> The temperature in the room seems to rise. <i>“Or kiss it?”</i> You swoon and stare at Urbolg’s cock, wishing he would scoot a little closer. <i>“I wanna suck it.”</i> You really do. Admitting it has made you so hot and horny, so ");
	//Juicy and hard and compliant: not grammatically correct but please no "fix"
	if(pc.hasVagina()) output("juicy and ");
	if(pc.hasCock()) output("hard and ");
	output("compliant. You lick your [pc.lips]. <i>“Please let me suck your cock, Master.”</i> You stretch out your [pc.tongue] and look up, begging with your eyes.");
	output("\n\nSliding forward on your torso, Urbolg holds you by the ");
	if(pc.hasLongEars()) output("ears");
	else output("head");
	output(" as he brings his dick to rest on tastebuds. It’s salty with sweat and some undefinable tangy residue. He’s not content wait there. The masterful canine presses himself forward into your maw now that your eyes have rolled back, filling your mouth with the taste of his turgid meat. On its own, there’s nothing particularly amazing about the sensations his cock provides; it’s the collar’s reactions that make it special, the sudden intense hunger that blooms in your belly and makes your heart flutter in excitement.");
	output("\n\n<i>“Good bitch.”</i> The words stroke the back of your brain as he slides into the back of your throat. Urbolg’s pointed tip presses at the back of your throat, finding little resistance on its way into your gullet.");
	if(!pc.canDeepthroat()) output(" Your gag reflex is gone on a obedience-induced vacation.");
	else output(" Good thing you don’t have a gag reflex!");
	output(" That pulsing hot cock slips past your tonsils, bowing just enough to slide deeper. Heavy sheathmusk fills your nose when his bulged-out knot stretches your [pc.lips] into straining ‘O’.");
	output("\n\nUrbolg reverses direction and pulls back. The tips of his clawed fingers lavish you with affection as inch after inch of spit-shined dick exits your maw. <i>“Squeeze my knot next time, slave.”</i>");
	output("\n\nA command! You thrill at the knowledge that you’ve found something else you can <i>obey</i>, a new way to please yourself and Master at the same time.");
	output("\n\nHe slaps his hips forward hard, uncaring for your comfort, using your face like a cheap sextoy. Tears well up at the corners of your eyes from the sudden change in fullness, but they feel like tears of joy as they stream down your cheeks. You reach up and grab Master’s tremendously swollen knot and give it a gently squeeze as soon as it reaches your lips, feeling warmth splash into the back of your throat.");
	output("\n\nIs that... cum?");
	output("\n\nThe thought that you’re helping Master cum, that you’re milking his dick directly into your throat, is borderline orgasmic. This pleasure is different of course. It doesn’t make you shake or shut down. It fills you with purpose. It makes you happy to squeeze and massage as spurt after spurt of thick, creamy cum splashes down into your belly. You’re crying hard now, not from instinctive discomfort but from joy, from the knowledge that you’ve pleased your Master so thoroughly.");
	output("\n\nIt’s like falling in love, you realize. That’s what this feels like: affection so deep and unrelenting that you’d endure anything to stay closer to the source. You want to tell Urbolg what he’s done to you, but you can’t. Sucking his cock is too important. Rubbing his knot isn’t just your job for the moment, it’s your purpose, body and soul. You lovingly milk Master’s dick until you’re feeling uncomfortably full, and then you milk it some more.");
	output("\n\nBreathing is secondary. You do it when you get the chance, but only because Master’s pulls back enough to let you. Besides, it gives you a chance to recover enough sense to gaze up at him adoringly, the corners of your mouth twisting into a smile.");
	output("\n\nThen he’s pinning you to the deck, jackhammering your mouth with a mostly-drained knot. It pops in and out of increasingly jizz-flecked lips. You’re definitely <i>his slave</i>, you realize, midway through a throat-straining thrust, a thought that makes it feel like your entire body is cumming. Every square inch of skin feels like a sexual organ in the moment of climax, rewarding you for being such a <i>good bitch</i>. You hardly mind that you’re blacking out from lack of oxygen. So long as <i>Master</i> enjoys pounding into your tonsils and spraying more cum into your fuckable mouth, you’re happy.");
	processTime(35);
	pc.orgasm();
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",ubrolgBadEndIV);
}
public function ubrolgBadEndIV():void
{
	clearOutput();
	showUrbolg(true);
	output("In hindsight, you never really stood a chance. Obedience collars are pretty much foolproof. Urbolg let you look over the manual the other day as a reward for ");
	if(!pc.hasVagina()) output("being such a good <i>girl</i> with your new-grown vagina");
	else output("licking his balls during his entire lunch break");
	output(". He must have done a lot of work on yours, because the default settings are supposed to take at least a week to break someone, but you fell in love with <i>obeying Master</i> almost immediately!");
	output("\n\nYou can still remember what it felt like to embrace your role as his cock-holster for the very first time, the way it made your eyes roll back and your entire body happy. That’s what being a slave is like: endless amounts of happiness. All you had to do is <i>obey</i>. Free will seems wildly overrated.");
	output("\n\nYou remember what it was like before, when you would stress and agonize about all sorts of things, like inheritances and cousins and whatnot. Now? You don’t even get bored anymore. If Master’s around, you’re too busy experiencing the sublime joy of being a slave to be bored, whether it’s giving him a full body tongue bath or letting him fuck each of your holes in sequence, shaping your body’s various eroginous zones to his purposes.");
	output("\n\nFuck, being a slave is so... <i>hot</i>!");
	output("\n\nAnd if Master is busy working, he even lets you play some of his videogames. You’re not very good at them anymore. More often than not, something on screen will remind you about something he owns, and you’ll wind up spacing out and fantasizing about all the different ways you can be a good bitch and let you fuck you with it... or on it, depending. It’s easier to load his skin into your favorite porno-sim and let him fuck you on a loop until he shows up in the real world to bang your sloppy cunt to pieces.");
	processTime(60*24*7);
	clearMenu();
	addButton(0,"Next",urbolgBadEndV);
}
public function urbolgBadEndV():void
{
	clearOutput();
	showUrbolg(true);
	output("One of the other pirates tried to steal you from Master Urbolg once. They even drew a gun on him! Of course he had his shields on. He’s too cunning to get caught with his pants down, unless he’s asking you to lick his dick until you’re tasting him in your dreams...");
	output("\n\nAnyway, watching him crush the poor girl’s pistol into scrap with nothing but his metal hand made you swoon, and then you got to fuck him right in front of the greedy tramp. Seeing him so assertively claiming his property was almost too much for your weak little slave-brain, but you managed to stay conscious long enough to enjoy the feeling of him loading you down with one of his trademark sticky creampies. If you think about it hard enough, you can still feel the trickles of cum clinging to your thighs.");
	output("\n\nUrbolg’s the best thing that ever happened to you.");
	output("\n\nYou love him more than life itself.");
	badEnd();
}

//PC Wins Fight:
public function defeatUrbolg():void
{
	flags["MET_URBOLG"] = 1;
	pc.createStatusEffect("Rat Delay"); pc.setStatusMinutes("Rat Delay", 3*24*60);
	//Lust
	if(enemy.lust() >= enemy.lustMax())
	{
		output("The mechanic abruptly holsters his pistol, conscious of the bulge in his apron, and throws up his hands placatingly. <i>“Alright, alright. Ye made yer point " + pc.mf("lad","missy") + ". Yer more than lewd enough to belong here, and if ye be with the long arm of the law... well at least whoever you’re after is gonna have a fun time resisting arrest.”</i> He winks his robotic eye in your direction. <i>“I won’t be stopping ye if ye want to stretch yer legs on the rest of the station, just don’t be leaving too many cases of blue balls in yer wake, eh? And maybe pay me a visit if ye get a touch too randy yerself. Name’s Urbolg.”</i>");
		flags["URBOLG_LUSTED"] = 1;
	}
	//HP
	else
	{
		output("<i>“Hold!”</i> the mechanic bellows, smartly holstering his pistol. He throws his hands up in the air placatingly. <i>“Ye proved yer fekkin’ point! No bloody bastards are gonna be walking over you, no sir.”</i> He harrumphs, <i>“Meself included! Ye fight with the burning determination of a quasar and the wisdom of a frostwyrm. Either you’re a pirate to be proud of or Peacekeeper I’d rather stand clear of. So go on, stretch your legs");
		if(pc.legCount == 1 || (!pc.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE) && !pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))) output(", err yer whatever");
		output(". Old Urbolg won’t be getting in yer way.”</i>");
	}
	//Merge
	output("\n\nWell, that ended on surprisingly amicable terms. If only every fight you stumbled into could be resolved so cleanly! This Urbolg fellow cautiously backs off your boarding ramp and lumbers toward a nearby toolbox. Zheng Shi Station is yours to explore.");
	output("\n\n");
	CombatManager.genericVictory();
}

//Approach:
public function peacefulApproachUrbolg(back:Boolean = false):void
{
	clearOutput();
	showUrbolg();
	if(back) output("Is there something else you need from Urbolg?");
	//Special collar stuff.
	else if(pc.accessory is MaikesCollar)
	{
		output("<i>“Ho ho! What a fine mess you’ve gotten yerself into, eh?”</i> Urbolg shakes his head, barely suppressing a giggle. <i>“I thought ye were good enough to stay out of slavery, but I guess I can’t be right about everything. Still...”</i> He strokes his chin. <i>“...I suppose it’s a mark in yer favor that you’re fighting off the shocks to come see me about it. Might even be able to get it off ye, if ye make it worth me while.”</i>");
	}
	//Lust defeated or fucked
	else if(flags["URBOLG_LUSTED"] != undefined || flags["SEXED_URBOLG"] != undefined) output("<i>“Oi, if it isn’t the new [pc.guyGirl]. Been wondering when ye were planning ta stop by and pay ol’ Urbolg a visit. What can I do for ye?”</i> The korgonne puts his hands on his hips and flashes a fanged smile at you.");
	//Regular
	else
	{
		output("You have to tap Urbolg’s shoulder to get his attention.");
		output("\n\n<i>“Fek! Don’t go sneaking up on a guy like that! Could get a body hurt, sneaking about.”</i> Urbolg dusts off his hands and plants them on his hips. <i>“What can I do fer ye, new [pc.guyGirl]? Armor plating need replacing, or ye just want to spend some time with the most honorable pirate you’re gonna find on this side of the rim?”</i>");
	}
	//[Appearance] [Talk] [Flirt/Sex]
	urbolgMenu();
}

public function urbolgMenu():void
{
	clearMenu();
	addButton(0,"Appearance",urbolgAppearance);
	addButton(1,"Talk",talkToUrbolg);
	addButton(2,"Buy",buyFromUrbolg);
	if(pc.lust() >= 33) 
	{
		if(flags["SEXED_URBOLG"] == undefined) addButton(3,"Flirt",urbolgFlirtSex);
		else addButton(3,"Sex",urbolgFlirtSex);
	}
	else addDisabledButton(3,"Flirt","Flirt","You’re not really in the mood for that right now.");
	if(pc.hasGenitals()) addButton(4,"PB Cookie",urbolgPBCookiesBYOUMADMAN,undefined,"PB Cookie","You often see Urbolg when he’s hard at work. Maybe he’d like to have a nice treat to relax after some hard work.");
	else addDisabledButton(4,"PB Cookie","PB Cookie","You need traditional genitals of some sort to pursue such an action.");
	if(pc.accessory is MaikesCollar)
	{
		addDisabledButton(5,"Slave Collar","Slave Collar","You’re in no position to trade one slave collar for another!");
		addButton(6,"Remove Collar",askUrbolgToRemoveYourCollar,undefined,"Remove Collar","See what Urbolg wants in exchange for getting this hunk of junk off you.");
	}
	else if(flags["URBY_COLLAR_FUN"] != undefined) addButton(5,"Slave Collar",urbyCollarBadEndByWsan,undefined,"Slave Collar","It’s so tempting. You could have it all again if you just put it on... just once more should be fine.");
	else addButton(5, "Collar", urbyCollarFunByWsan, undefined, "Collar", "There’s a collar sitting out on his workstation. Ask him about it.");
	
	if (amberShowTaurEquipButton()) addButton(7, "Taur Equip", amberUrbolgTaurEquipTalk, undefined, "Taur-centric Ship Equipment", "Ask Urbolg about setting up some ‘taur-centric equipment in your ship.");
	else if(pc.hasKeyItem("Taur-centric Ship Equipment")) addDisabledButton(7,"Taur Equip","Taur-centric Ship Equipment","Taur-centric ship equipment is already installed on your ship!");

	addButton(14,"Leave",mainGameMenu);
}

public function askUrbolgToRemoveYourCollar():void
{
	clearOutput();
	showUrbolg();
	author("Fenoxo");
	if(pc.isBimbo()) output("<i>“Sooo... like, can you pleeeeease get this collar off? It hurts!”</i>");
	else if(pc.isBro()) output("You point at your collar and grunt, <i>“Off.”</i>");
	else
	{
		output("You tug at the collar’s cold metal. ");
		if(pc.isNice()) output("<i>“I’m sure a nice guy like you wouldn’t overcharge me for a little help. Right?”</i>");
		else if(pc.isMischievous()) output("<i>“Seeing as how this ain’t really my style, I suppose I could work something out with you. What’s it going to cost?”</i>");
		else output("<i>“Get this shit off of me!”</i>");
	}
	output("\n\nThe scruffy-looking mechanic folds his metal arm over his biological one. <i>“Well, seeing as how I’m damn near the only one on this whole blasted station who’s soft enough on ye to lend a hand... I figure five thousand credits ought to do the job.”</i> He looks you over from head to toe. <i>“But I could always use a helping hand in my forge, if ye don’t mind getting a bit of mess on yer face. It’s a small price to pay, ain’t it?”</i>");
	clearMenu();
	if(pc.credits >= 5000) addButton(0,"Pay 5k",payUrbolgCreditsForCollar,undefined,"Pay 5k","Pay Urbolg in credits for help with the collar.");
	else addDisabledButton(0,"Pay 5k","Pay 5k","You can’t afford that.");
	addButton(1,"Pay Facial",payUrbolgFacial,undefined,"Pay Facial","Pay him in sexual favors, resulting in a face-full of korgonne cum.");
	addButton(14,"Leave",peacefulApproachUrbolg,true);
}

public function payUrbolgCreditsForCollar():void
{
	clearOutput();
	showUrbolg();
	author("Fenoxo");
	output("You transfer the credits to Urbolg.");
	output("\n\n<i>“Atta [pc.boyGirl]. Hold still a tick.”</i> He grabs you roughly around the neck, metal fingers clicking against the collar’s smooth surface. There’s a few uncomfortable seconds followed by a ‘click’. Relief at last.");
	output("\n\n<i>“You find yourself in any more of these little beasties, and I’ll take care of it fer ye. Same rate.”</i>");
	output("\n\nYeah, sure.");
	pc.accessory = new EmptySlot();
	processTime(3);
	clearMenu();
	addButton(0,"Next",peacefulApproachUrbolg,true);
}

public function payUrbolgFacial():void
{
	clearOutput();
	showUrbolg(true);
	author("Fenoxo");

	output("You tell Urbolg that you don’t mind a bit of mess in exchange for some help with the collar.");
	output("\n\n<i>“On ");
	if(!pc.hasKnees()) output("the ground");
	else output("yer knees");
	output(" then.”</i> Urbolg points at the floor in front of him with one hand and tugs the laces to his apron free with the other. <i>“Fekkin’ Star Vipers thought it’d be funny te hit my office with a bit of aphrogas. Feels like I been carrying this load of cum fer days.”</i> A dick-shaped distention appears through the thick fabric, growing by the minute.");
	output("\n\nYou ");
	if(pc.isBimbo() || pc.libido() >= 90) output("eagerly ");
	output("sink to ");
	if(pc.hasKnees()) output("your knees");
	else output("the ground");
	output(" as you were bid");
	if(pc.isBimbo()) output(", licking your [pc.lipsChaste] with obvious dick-thirst");
	output(".");

	output("\n\n<i>“Be a real shame to let it go to waste, but I reckon a bit of face-painting’s as good a use as any.”</i> The dog-man throws his apron over his shoulder with a flourish, revealing the bright blue mast between his legs. A heavily inflated, practically balloonish knot bobbles above his sheath, swollen with his thick canine load. <i>“‘Sides, a nice thick layer of cum might even get those stimmed up Jumper bitches te leave off ye for a bit. Not real big on sharing, those ones. A cum-covered slave is a claimed slave.”</i> He pats your head affectionately. <i>“Are you ready to get messy?”</i>");
	if(pc.isBimbo())
	{
		output("\n\nYou vigorously nod, opening your mouth wide and rolling your tongue out like a welcome mat.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" The lengthy organ wiggles further and further until it’s tickling his ball-fur, begging him to smother your tastebuds in his salty love.");
	}
	else
	{
		output("\n\nYou ");
		if(pc.libido() >= 66) output("eagerly nod.");
		else if(pc.libido() >= 33) output("nod, excited but unsure.");
		else output("hesitantly nod.");
	}
	output("\n\nUrbolg wraps his biological hand around the base with surprising gentleness. <i>“Good.”</i> He looks like he’s trying damned hard not to give it a squeeze. <i>“See, when I’m this backed up, it actually sorta hurts.”</i> The furred alien winces slightly as pre-cum dribbles from his tip. <i>“Just gotta give the ol’ knot a squeeze and milk it out. Don’t even care if I cum at this point. Emptying this fat, fucking knot’ll be good ‘nuff, and your face...”</i> His robotic hand strokes your cheek affectionately, pulling you underneath his dick.");
	output("\n\nA droplet of musky juice falls on your upturned nose.");
	output("\n\n<i>“Yer face’ll look prettier than the thirsty galotian’s.”</i> A tremor ripples through the korgonne’s fingers, squeezing his taut knob.");
	output("\n\nFrom where you’re sitting, you have a front row seat to the sight of his urethra bulging with a heavy load of cum, sliding up all eleven inches of proud dog-cock pour out onto your [pc.face]. It doesn’t spurt. He’s not squeezing hard enough for that. The cum gently streams out, softly splattering across your cheeks and nose. Gobs drip over your [pc.lipChaste] and tongue. ");
	if(pc.hasFur() || pc.hasFaceFlag(GLOBAL.FLAG_FURRED)) output("Your [pc.skinFurScales] is soon slick with it, soaking it up sponge-like. If you put a hand to your cheek, Urbolg’s jizz would squish out.");
	else output("A stray runnel of pearly goo hangs from your chin, threatening to break free the moment another ounce of fluid finds its way onto you.");
	output("\n\nThe burly male grunts, <i>“Ahhh... shit yeah. Didn’t even mean to start, but I ain’t stopping now.”</i> His hand squeezes harder, fingers sinking into the springy flesh, forcing an even bigger load into his dick.");
	output("\n\nYou look up in time to see the wave of ivory spunk crest from his cocktip. You can scarcely believe the quantity or how fully it fills your vision. As it falls, you reflexively blink your eyes, shielding them from the ensuing splatter. It cascades over your forehead");
	if(pc.hasHair()) output(" and into your [pc.hair]");
	else output(" and across the top");
	output(". The weight of it puddles over your eyes, forcing you to hold them shut. Even if you wanted to open them, the thick breeding material is all but glueing them shut. Breathing itself is a challenge. Every exhalation produces wobbling bubbles of spooge.");

	//bimbo
	if(pc.isBimbo()) output("\n\nYou adore it. Shoveling as much into your mouth as possible, you take huge swallows of Urby’s delicious cum. Again and again, you swallow as much of his load as possible. When you hear him grunt once more, you surge forward with whorish hunger, sealing your lips around his trembling tip. You won’t let a single drop escape. It doesn’t matter if your cheeks bulge and you can’t swallow fast enough. You just ignore any sort of gag reflex and let it pump directly into your belly, reveling in the salty, spunky taste when it slides across your [pc.tongue]!\n\nYum!");
	//furry
	else if(pc.hasFur()) output("\n\nYou’re an absolute mess. Every inch of fur from the shoulders up is saturated in Urbolg’s jizz. It makes you feel like some sort of cum-sponge. The clingy breeding goo hangs in webs from your ears, and he’s still going. Fresh splatters slide down your slick, matted fur to dribble from your chin. Swallowing some is inevitable. You’ve got to gulp at it just to make room for air, and then another fat globule of musky goo is bathing your tongue, forcing you to swallow again! You barely notice when he grabs you by the scruff of the neck and commences smearing his cum across you with his dick, pumping fresh wads deep to impregnate your fur.");
	//Nonfur nonbimbo
	else output("\n\nYou can’t help but wind up swallowing his jizz. It’s everywhere, and when you open your mouth to breathe, some inevitably sloughs in. You drink it down only to wind up with a fresh dollop poured in, but after swallowing that, you’re finally free to gasp for oxygen. Of course, Urbolg is pressing his cock into your cheek now, using it to smear the puddling goo across your [pc.face] to produce an even coat. He glazes you with cum, then bathes you in a fresh load. No matter how much he pours onto you or how heavy the dribbling webs that hang from your chin, there’s almost more. Always heavier, muskier loads to pour on your face.");
	//Merge
	output("\n\nThe korgonne uses you and degrades you, but if you’re going to be honest, ");
	if(pc.isBimbo()) output("you love it");
	else output("it feels kind of nice");
	output(". As an added bonus, the collar isn’t even tingling anymore. You suppose to these libidinous pirates, getting fucked is probably about as good as working, and if being a cum-dump gets you a little relief from the stinging around your neck, you’re more than happy to comply. Besides, he’s going to take it off after he finishes dispensing your spunkbath, right?");
	output("\n\nYou open your mouth to ask, only to have him stuff his tip");
	if(pc.isBimbo()) output(" deeper");
	output(" inside.");
	output("\n\n<i>“Swallow the rest, then we’ll get that collar off ye.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("Oh stars yes!");
	else output("You can manage that.");
	output(" Sucking with cheek hollowing force, you help Urbolg drain another superhuman rope of spunk into your maw. This time, he’s squeezing hard enough that it bursts out with tonsil-drenching power. You briefly sputter, eyes watering, and swallow down the stuff. The sperm-infused fluid is so thick it’s almost chunky, clinging to your teeth. No matter how many times you gulp, you can still taste it on your tongue and smell it on your breath.");
	output("\n\nUrbolg gasps, <i>“One more!”</i> and then unloads, spraying hot, virile juice into your sluttily suckling mouth. His cum bulges your cheeks and trickles down your [pc.lips] as his hips make half-restrained thrusts, burying a bit more bone inside. Your senses are entirely filled with the taste, scent, and texture of his cum. It’s all you’re aware of and all you can think about, even after he pulls out to watch you slowly imbibe his final offering.");
	if(pc.isBimbo()) output("\n\nYou orgasm powerfully, body automatically rewarding you in kind of the pleasure you’ve offered. You love sucking cock and cumming your brains out just from the feeling of it sloshing in your belly. Yay!");
	else if(pc.libido() < 33) output("\n\nThat was... actually sort of fun.");
	else if(pc.libido() < 66) output("\n\nYou flush hotly, more turned on than you care to admit.");
	else output("\n\nYou groan in raw passion, so turned on from the one-man bukkake that you’re ready for round two.");
	output("\n\n<b>You’re absolutely drenched in cum, but Urbolg pops the collar off while you’re wiping it out of your eyes.</b> Yes!");
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	processTime(24);
	if(pc.isBimbo()) pc.orgasm();
	else pc.changeLust(20*pc.libido()/100+10);
	pc.loadInMouth(chars["URBOLG"]);
	pc.accessory = new EmptySlot();
	IncrementFlag("SEXED_URBOLG");
	clearMenu();
	addButton(0,"Next",peacefulApproachUrbolg,true);
}

//Appearance
public function urbolgAppearance():void
{
	clearOutput();
	showUrbolg();
	output("The korgonne mechanic’s stocky body stands all of 4’11”</i> tall, but he carries himself with the implacable authority of a boulder. His gleaming, mechanical hand further lends to his fearsome appearance, and you’ve seen all too well the number of gadgets and weapons concealed within. A thick, pocket-laden apron offers him dozens of places to conceal armaments and tools. The extra-large shield belt he cinches tight around his solidly built waist holds it all in place, at the same time offering him protection from stray sparks and gunfire.");
	output("\n\nUrbolg’s shaggy white hair and fur are both spotted with blooms of soot from his work, though otherwise well groomed. Intelligent green eyes stare out at you from under his dirty mop, the left one clearly artificial in nature, rimmed by jagged, claw-shaped scars. His snout is stubby and short, typical of a korgonne, capped by a black nose and slight blue lips. When he speaks, an equally cyan tongue can be spotted inside his sharp-toothed maw.");
	//Fucked!
	if(flags["SEXED_URBOLG"] != undefined) 
	{
		output("\n\nAn 11” canine penis nestles snugly within his overstuffed sheath, just above a pair of obviously-enhanced, fist-sized testes. When it gets excited enough to pop out, his larger-than-normal knot immediately and powerfully inflates, big enough to break a lesser bitch in half. The thick blue bulb pulsates with every beat of his heart in visible sympathy.");
		output("\n\nOf course, he’s got a similarly blue asshole nestled between his chubby cheeks, right where it belongs, not that he displays much interest in making use of it.");
	}
	//Not fucked
	else output("\n\nWhile you haven’t seen undressed, Urbolg doesn’t bother much with clothes, aside from his apron. The bulge of a decent-sized set of balls is visible even through the thick fabric, and when he turns around, there’s nothing to hide his chubby buttcheeks or the bright blue lining of his asshole.");
	//merge
	output("\n\nHis fluffy tail wags when he sees you looking, though his expression is as stoic as ever.");
	clearMenu();
	addButton(0,"Next",peacefulApproachUrbolg,true);
}

//Talk
public function talkToUrbolg():void
{
	clearOutput();
	showUrbolg();
	output("What do you want to ask Urbolg about?");
	clearMenu();
	addButton(0,"His History",urbolgsHistory);
	if(flags["URBOLG_ARTIFICER"] != undefined) addButton(1,"Artificer",urbolgArtificerTalk);
	else addDisabledButton(1,"Locked","Locked","You don’t know enough about him to ask this.");
	addButton(2,"His Shield",urbolgHisShield,undefined,"His Shield","Ask him where he got such a fabulous shield from.");
	addButton(14,"Back",peacefulApproachUrbolg,true);
}

//[His History]
//Talk: His History
public function urbolgsHistory():void
{
	clearOutput();
	showUrbolg();
	output("You ask Urbolg how he became a pirate.");
	output("\n\n<i>“In a storytelling mood, are ye?”</i> the fluffy mechanic smirks and slaps a workbench with his metal hand, filling the hangar with echoing reverberations. <i>“Then ye came to the right place. I’m happy to share a tale with such a formidable foe. Rest a spell. Take a load off.”</i> He produces a flask from his apron and takes a swig, offering you a pull.");
	output("\n\nDo you accept?");
	processTime(2);
	clearMenu();
	addButton(0,"Yes",yesSwigUrbolg);
	addButton(1,"No",noDontSwigUrbolg);
}

public function noDontSwigUrbolg():void
{
	clearOutput();
	showUrbolg();
	output("You wave it away, and Urbolg shrugs.");
	output("\n\n<i>“Suit yourself.”</i>");
	urbolgHistoryContinue();
}
//Yes
public function yesSwigUrbolg():void
{
	clearOutput();
	showUrbolg();
	output("You take a drink of the burning alcohol, unable to suppress a wince.");
	output("\n\nUrbolg cackles with glee as he takes it back. <i>“That’ll light a fire in yer belly.”</i>");
	pc.imbibeAlcohol(80);
	urbolgHistoryContinue();
}

public function urbolgHistoryContinue():void
{
	output(" He strokes at the longish fur of his chin. <i>“Doesn’t seem so long ago now, but I guess it must have been... what, thirty terran years back? ‘Round then I was a little upstart on Uveto. Not sure if you’ve ever been there, but the place is a frozen hellhole populated by shut-ins and assholes. I was one of the former.”</i> He pounds his metal fist into his chest. <i>“‘Cept I was young and stupid. Figured I could take on the whole of the tundra by meself. Nothing but stolen coats, a spear, and the determination to come back with a bloodied Kor’diiak hide.”</i>");
	output("\n\nYou ask if he did.");
	output("\n\n<i>“Fek no. I never stood a chance. Managed to track one of the beasts, ye, even stuck her pretty good with my spear.”</i> He mimics a violent, downward stabbing motion. <i>“Course when yer face ta face with something ten times your size, your spear might as well be a toothpick. I never managed to pull it out for another strike. The beast threw me a good ten or fifteen feet with a shrug. Landed in a snowdrift.”</i> Urbolg holds up his metal arm, flexing the whirring servos in anger. <i>“She was on me in seconds, all teeth and claws. I was fucked, and I knew it.”</i>");
	output("\n\nListening attentively, you ask how he survived.");
	output("\n\n<i>“Same way anybody does, swallowing all the terror and pain for a chance to spit in the devil’s eye one last time.”</i> Ubrolg punches the air. <i>“I grabbed the beastie by the tongue before she could get her jaws around my head, and I twisted for everything in me little arms. Shoulda heard the pop it made. Sweeter than a suula symphony. Course all that did was piss ‘er off. By that point the left half of my face was a mask of blood, and there’s not much ta do when dagger-sized teeth are sawing your arm in half. I mighta took a couple swings with my other hand, but what’s that gonna do against thousands of pounds of monster?”</i>");
	output("\n\n<i>“Nothing,”</i> you admit.");
	output("\n\nUrbolg nods gruffly, pulling his flask for another swig. He doesn’t offer any for you this time. <i>“Twas about halfway bled out and down one hand when that cursed bear slumped over into the snow. I didn’t know what happened. Figured I was already dead or worse. Last thing I saw was a laquine standing over me toting a rifle about twice her size. I didn’t know what the fuck she was saying, but she screamed and hollered up a storm while I lost consciousness.”</i>");
	output("\n\n<i>“And?”</i>");
	output("\n\nThe korgonne smirks at you. <i>“And she hauled my sorry ass in for medical treatment, I guess. Woke up in her ship with a stump below the elbow, one good eye, and a translator strapped around my neck. Tried to fight my way out once, before I passed out. If ye can believe it, I was a bit of a savage back then. Thought the core magics would corrupt me.”</i> He glances to his arm and sighs. <i>“Twas about half right about that, truth be told.”</i>");
	output("\n\nYou ask him why he stayed instead of going home, if he was that worried about corruption.");
	output("\n\n<i>“Didn’t have much choice.”</i> He barks out a bawdy laugh. <i>“When ye wake up in a pirate cruiser, ye can either chip in and earn a share or get sold off into slavery. Me? I chipped in, and I chipped in hard.”</i> He wiggles his fingers. <i>“Once they calmed me down and stuffed a new hand on me stump, I got put to work cleaning out under the engines, reactors, and anywhere else too small or dirty for a bigger pirate to bother with. It’s how I got me start, bein’ an artificer.”</i>");
	if(flags["URBOLG_ARTIFICER"] == undefined) flags["URBOLG_ARTIFICER"] = 0;
	//[Continue] [Artificer?] (starts artificer talk)
	processTime(8);
	clearMenu();
	addButton(0,"Continue",urbolgHistoryContinueContinue);
	addButton(1,"Artificer?",urbolgArtificerTalk);
}

//Continue:
public function urbolgHistoryContinueContinue():void
{
	clearOutput();
	showUrbolg();
	output("<i>“So you’ve just been trapped onboard all this time?”</i>");
	output("\n\nUbrolg nearly doubles over cackling. <i>“Fek no! Besides the whole owing \\\[REDACTED\\\] my life thing, I developed a... how do you say... a taste for it. I saw more miracles in my first week in space than our tribe’s wildest legends could’ve prepared me for. The vastness of space. Lethal wounds knitted into healthy flesh in minutes. The feeling of opening a new eye after finally adjusting to the raw, empty socket.”</i> He gestures at the hangar. <i>“Wide open spaces of gleaming metal built to house majestic vessels, each more than capable of leveling a korgonne hold. Once I’d seen... this, I knew I couldn’t ever go back to me old life.”</i>");
	output("\n\nYou nod understandingly.");
	output("\n\n<i>“Course I did try an’ go back to visit once.”</i> Urbolg snorts, ears swiveling back in irritation. <i>“Couldn’t even get into the hold. The guards damn near tried to kill me.”</i> He flashes his fangs. <i>“Called me ‘ghost devil’. I suppose I can’t blame them. The artificial eye I was packin’ back then glowed hot as a sun’s flame, and me hand was a lot more primitive lookin’ - practically skeletal. Hard to believe I used ta be like that.”</i> Another swig of whiskey soothes the korgonne’s anger into sullenness. <i>“Never got ta see me mother or sire. Just tossed a letter and a few trinkets I hand-forged for them on the floor and put it all behind me.”</i>");
	//bimb
	if(pc.isBimbo()) output("\n\n<i>“Awww, that’s so saaad!”</i> You throw your arms around the stout dog-man and squeeze him into a tight hug, uncaring if it makes you smell like grease and sweat. <i>“You poor boy!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“Shit.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“My condolences,”</i> you say, putting your hand on his shoulder and squeezing reassuringly. <i>“That’s a tough pill to swallow.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“If you forge half as well as you fight, I’m sure your mom and dad were brawling over your gifts later.”</i> You offer, <i>“Besides, I know I’d rather my kid be some kind of demon-blessed immortal than dead. I’m sure they feel the same way.”</i>");
	//Hard
	else output("\n\n<i>“You tried. That’s more than most.”</i>");
	//Merge
	output("\n\n<i>“Right.”</i> The fluffy mechanic clears his throat. <i>“So that’s me story. Did some dumb shit, paid for it, and got handed the keys to the universe. Now I do whatever the fek I want, which for right now means working some of the sweetest mechanical magic you’ll ever see.”</i> He glances around to make sure nobody else is within earshot. <i>“And between you and me, the sex ‘round these parts ain’t bad neither.”</i>");
	flags["URBOLG_HISTORYED"] = 1;
	processTime(6);
	clearMenu();
	addButton(0,"Next",talkToUrbolg);
}

//Talk Artificer?
public function urbolgArtificerTalk():void
{
	clearOutput();
	showUrbolg();
	output("<i>“Why do you call yourself an artificer?”</i>");
	output("\n\nUrbolg leans back cautiously and stares at you out of the corner of his eye. <i>“Ain’t it obvious? That’s what I am!”</i> He slaps himself in the chest. <i>“Your kind... you call all your machines and your magic words like ‘technology’ and ‘science,’ but the truth is, that’s just wizardry by another name. Me? I might not understand every little magical law that governs these wonders, but I’ve learned to work on ‘em, maintain ‘em, and sometimes even squeeze ‘em for a little extra oomph. What better title than artificer is there?”</i>");
	output("\n\nYou point out that science is hardly magic.");
	output("\n\n<i>“Isn’t it?”</i> The scruffy dog-man tilts his head, eyes twinkling.");
	output("\n\n<i>“It isn’t.”</i>");
	output("\n\n<i>“So yer saying it isn’t magic, but... isn’t magic just understanding those invisible forces that bind together our universe and whatnot, tweaking ‘em in just the right way to accomplish something miraculous?”</i> Urbolg seems to be holding back a giggle.");
	output("\n\nConsidering how it functions in most fantasy holos, you admit that it seems an apt description.");
	output("\n\n<i>“That description is just as apt for yer science boys and gals, spendin’ all day studying arcane formulae and physics to wring a few extra Watts into a laser pistol. And don’t tell me that the warp gates that stitch this universe together ain’t the product of some black magic. Somebody musta traded their heart to a demon for the keys to that puzzle. Just ‘cause core magic’s a bit more finicky than the stuff of legend don’t make it not be magic.”</i>");
	output("\n\n<i>“That’s... ");
	if(pc.isBimbo()) output("like, a super smart way to think about it!");
	else output("a fair point.");
	output("”</i> You concede that discussion but raise another, <i>“What about psionic powers? There seem to be more psychics every year.”</i>");
	output("\n\nUrbolg winces. <i>“The kind of magic I don’t want to fekken’ be around. Don’t need nobody else rootin’ around in me head or making me feel a certain way just ‘cause they want me to. Scrap that. I got word there’s some designs out there to block that sort of power. You can bet yer ass I’ll be building some as soon as I can get my hands on the components. Just gotta... ya know... get the creds together and find a source who deals in ultra-rare materials. Not real easy.”</i> He waves his hand dismissively. <i>“The important thing is the regular, everyday magic can deal with it.”</i>");
	flags["URBOLG_ARTIFICER"] = 1;
	processTime(8);
	clearMenu();
	addButton(0,"Next",talkToUrbolg);
}

//Talk: His Shield
public function urbolgHisShield():void
{
	clearOutput();
	showUrbolg();
	output("You glance at Urbolg’s belt.");
	//no new pg.
	//bimbo
	if(pc.isBimbo()) output(" <i>“Your shield is really like, super strong, isn’t it?”</i>");
	//Bro
	else if(pc.isBro()) output(" <i>“Nice shield.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“You’ve got a really nice shield. Where’d you get it?”</i>");
	//Misch
	else if(pc.isMischievous()) output("<i>“So did you make that shield yourself or peel it off some unlucky sap?”</i>");
	//Hard
	else output("<i>“Know where a [pc.guyGirl] can get a shield like that?”</i>");
	//Merge
	output("\n\nThe korgonne tugs at his ample waist, <i>“This beauty?”</i> He lifts it up a bit and pats at one of several blocky boxes along its length. <i>“Made her meself. Took a couple of half-fried belts off the scrapheap, redid the supercaps, wound some new coils by hand, and topped it all off by putting three times as many power cells and emitters as anything on the market. Tch.”</i> Urbolg spits. <i>“Core-sucking babies can’t handle a little weight ‘round the middle. Bah!”</i>");
	output("\n\nIt does appear to be a bit weightier than most. <i>“Probably slows you down a bit, huh?”</i>");
	output("\n\n<i>“It may a bit, aye. But who cares about hoppin’ around all nimbly bimbly when you can shrug off a hit from an RPG with a smile?”</i> He pounds a meaty fist to his fluffy shoulders. <i>“I know it too. Happened once. Gave the fekkin’ tool a few missing limbs for his trouble. ‘Course I built him some new ones after. ‘Twas better than he deserved, the sneak, but it’s worth it to hear him clomp around on the deck.”</i> He hops and pounds his paws into the deck heavily, chuckling. <i>“Ye let me know if ye see ol’ no-legs around. We’ll have a giggle and a drink over it.”</i>");
	output("\n\nA quick scan of the hangar reveals that whoever no-legs is, he isn’t around.");
	output("\n\n<i>“Doncha worry, yer head ‘bout him. ‘E doesn’t come in here if he can help it, on account of me threatening to take the legs back and give him some curvy pink numbers as replacements.”</i> Urbolg bellows with mirth. <i>“I’ll do it too. I made some real cute looking limbs for the next idiot who comes after me. Got ‘em locked up in my office. Even left a few surprises in the sensory circuits to leave ‘em squirming like a virgin on New Texas.”</i> He glances your way. <i>“Why, was you wanting one?”</i>");
	output("\n\nDo you want one?");
	processTime(10);
	clearMenu();
	addButton(0,"Yes",yesGimmeShieldUrbolg);
	addButton(1,"No",noShieldForYouUrbolg);
}
//No
public function noShieldForYouUrbolg():void
{
	clearOutput();
	showUrbolg();
	output("You shake your head in the negative.");
	output("\n\n<i>“Probably fer the best. I only made the one, and I ain’t of a mind to make the same thing twice if’n I can help it.”</i> Urbolg slaps your back");
	if(pc.physique() < chars["URBOLG"].physique()-4) output(" hard enough to make you stumble");
	output(". <i>“I like a [pc.manWoman] who’s confident in their gear. Shows ye got some backbone in there. Just don’t let it lead ye into foolishness. Sooner or later ye gotta get some new kit, or the wizard-engineers in the core’ll leave ye behind.”</i>");
	output("\n\nThere’s more than some sense in that.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",peacefulApproachUrbolg,true);
}

//Yes
public function yesGimmeShieldUrbolg():void
{
	clearOutput();
	showUrbolg();
	output("You nod.");
	//Already got a shield generate
	if(flags["GOT_URBOLGS_SHIELD"] == 1)
	{
		output("\n\n<i>“Fek you!”</i> Ubrolg bellows. <i>“Greedy sodding sack of shit-fer-brains. Ye come into my shop and have the nerve to ask for me for shield belt after shield belt like I’m some kind of belt-sewing machine!”</i> He spits on your [pc.foot]. <i>“I may look like an endless pile of goodwill, but yer on thin ice, " + pc.mf("boy","missee") + "! Get out of me face before I do something you’ll regret. Fek!”</i> He brusquely waves you off. <i>“Sodding empty-souled cred-mongers...”</i>");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		pc.createStatusEffect("URBOLG_DISABLED");
		pc.setStatusMinutes("URBOLG_DISABLED",60*24);
	}
	//No freebie yet
	else
	{
		output("\n\n<i>“One like this?”</i> Ubrolg lifts his belt with a proud smile.");
		output("\n\n<i>“Exactly.”</i>");
		output("\n\n<i>“Too bad.”</i> The scruffy korgonne barks a laugh. <i>“I don’t make the same thing twice if’n I can help it. No fun in repeating yourself word for word, so to speak. Besides, if I wanted to slap together the same boring piece of tech over and over again, I’d have set up in some slapdash core shop. The freedom out here is worth the risk... and the pay cuts.”</i>");
		output("\n\nUrbolg looks appraisingly at your belt. <i>“");
		if(pc.shields() >= 150) output("You’ll do just fine with what ye got, I reckon. Just pick your fights carefully.”</i>");
		else
		{
			output("Still, that piece of garbage about your waist ain’t doing ye any favors. I did make a prototype before to test out my ideas before putting this beaut together. I guess ye can have her if ye need. Head on up to my office and hit up the brown safe under my computer desk. Combo is 7-8-9.”</i> He grins savagely. <i>“Don’t worry ‘bout traps or nothing. It’s the black one that’s rigged with a bomb. And some of the other ones. Moral of the story is: don’t fuck with my shit.”</i>");
			output("\n\nYou promise not to.");
			flags["GOT_URBOLGS_SHIELD"] = 0;
		}
		processTime(2);
		clearMenu();
		addButton(0,"Next",peacefulApproachUrbolg,true);
	}
}

//Open brown safe
public function collectUrbolgsSafe():void
{
	clearOutput();
	output("You cautiously avoid the nearby black safe - the one with the bomb - and delicately spin the combination lock in the specified pattern: 7... 8...");
	output("\n\n...9... ‘click’! The door swings open, revealing a matte black shield belt. Crude, boxy protrusions house the assorted emitters and machinery that allow for it to project a defensive screen. As promised, it’s far heavier than most and capable of putting up an impressive shieldwall.");
	output("\n\nUrbolg was true to his word.\n\n");
	flags["GOT_URBOLGS_SHIELD"] = 1;
	processTime(3);
	quickLoot(new ProtoShield());
}
	
//Flirt/Sex Intro
public function urbolgFlirtSex():void
{
	clearOutput();
	showUrbolg();
	//Haven’t yet banged and won via HP:
	if(flags["URBOLG_LUSTED"] == undefined && flags["SEXED_URBOLG"] == undefined)
	{
		//Talked about him till he mentioned the sex is good here
		if(flags["URBOLG_HISTORYED"] != undefined)
		{
			output("<i>“How much of the sex being good around here is your doing?”</i> You raise an eyebrow and glance appraisingly down at his apron. <i>“It takes two to tango.”</i>");
			output("\n\nUrbolg scratches nervously at one of his ears. <i>“More than my fair share, I wager. Not sure what a tango is, but if I catch yer meaning right, yer itching to see how good the crafty pirate is with his hands.”</i> He grins. <i>“But ye best not bark up that tree unless yer prepared ta be absolutely ravaged.”</i>");
		}
		//Not sex mentioned
		else
		{
			output("<i>“Interested in a little fun?”</i> You step close to the mechanic and gently brush his thigh. <i>“You seem like you could use a break.”</i>");
			output("\n\nUrbolg looks you up and down appraisingly. <i>“I suppose I got time to give yer systems a once-over, but ye best not be pullin’ on me tail, or you’ll be in fer a harsh lesson in fairness.”</i> Despite the threat, his tail is wagging happily. <i>“I must admit, you’ve a fine booty.”</i>");
			output("\n\nWas that... a pirate pun?");
		}
	}
	//Lust teased during fight but not sexed.
	else if(flags["SEXED_URBOLG"] == undefined)
	{
		output("<i>“How about I finish what I started during our little tussle,”</i> you suggest, glancing pointedly at the korgonne’s crotch.");
		output("\n\nA slight distention immediately appears in the middle of his apron. <i>“That uh...”</i> He drums his metal fingers on a nearby table and nods. <i>“I was thinkin’ of taking a break anyhow.”</i> His tail wags. <i>“Ye best not be up to something. I may seem a noble beast, but I’ll </i>destroy<i> you if ye cross me.”</i>");
	}
	//Sexed
	else
	{
		output("<i>“Got time to blow off a little steam?”</i> You lean close to Urbolg and ruffle his hair, scratching the spot right between his ears.");
		output("\n\nThe mechanic’s tail thumps heavily into the side of a workbench. <i>“Oh? Yer climate control system’s on the fritz?”</i> He nods pointedly toward your ship. <i>“Guess I could do a few repairs for ye, so long as I can count on ye to handle a few pieces of sensitive equipment.”</i>");
	}
	processTime(3);
	pc.changeLust(5);
	urbolgSexMenu();
}

public function urbolgSexMenu():void
{
	clearMenu();
	if(pc.hasGenitals()) addButton(0,"Catch Doggy",vaginaRouter,[getDoggyDoggyUrbolg,chars["URBOLG"].cockVolume(0),1,0],"Catch Doggy","Let Urbolg have you doggy style.");
	else addDisabledButton(0,"Catch Doggy","Catch Doggy","You need genitals for this scene.");
	if(flags["URBOLG_TOY_MILKING"] == undefined)
	{
		if(pc.hasCock()) addButton(1,"Fuck Him",urbolgFuckHimOrToyMilking,undefined,"Fuck Him","Bend Urbolg over and use him as your pound puppy.");
		else addDisabledButton(1,"Fuck Him","Fuck Him","You need a penis for this.");
	}
	else
	{
		if(pc.hasCock()) addButton(1,"Toys & Frot",urbolgFuckHimOrToyMilking,undefined,"Toys & Frot","Have a session with Urbolg and some of his prostate-stimulating toys! No penetration required!");
		else addDisabledButton(1,"Toys & Frot","Toys & Frot","You need a penis for this. Never should have gotten rid of it!");
	}
	addButton(2,"SuckCock",giveUrbolgBlowies,undefined,"SuckCock","Give the half-pint half-mechanical mechanic some oral service.");
	if(pc.isTaur())
	{
		if(pc.hasVagina()) addButton(3,(flags["URBY_TAUR_FUX"] == undefined ? "TaurFuck" : "TaurFist"),urbyTaurFux,undefined,(flags["URBY_TAUR_FUX"] == undefined ? "Taur Fuck" : "Taur Fist"),"Have Urbolg take you for a ride.");
		else addDisabledButton(3,(flags["URBY_TAUR_FUX"] == undefined ? "TaurFuck" : "TaurFist"),(flags["URBY_TAUR_FUX"] == undefined ? "Taur Fuck" : "Taur Fist"),"You need a vagina for this.");
	}
	else addDisabledButton(3,(flags["URBY_TAUR_FUX"] == undefined ? "TaurFuck" : "TaurFist"),(flags["URBY_TAUR_FUX"] == undefined ? "Taur Fuck" : "Taur Fist"),"You need to be a centaur for this.");
	if(flags["URBOLG_DOGGYED"] >= 3) addButton(4,"RideHisCock",vaginaRouter,[rideUrbolgsCock,chars["URBOLG"].cockVolume(0),1,0],"Ride His Cock","Ask Urbolg if you can ride his cock.");
	else addDisabledButton(4,"RideHisCock","Ride His Cock","Maybe if you let Urbolg pound you out and suck his cock a little he’ll be more amicable towards the idea of letting you ride him.");
	addButton(14,"Leave",leaveUrbolgSexAngerRar);
}

//[GetDoggy]
//Tooltip: Get done korgonne-style in your ship.
//2656 word commission, penned by Wsan.
public function getDoggyDoggyUrbolg(x:int):void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	
	var isDog:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	
	IncrementFlag("URBOLG_DOGGYED");
	
	if(pc.mf("m","") == "m" && flags["URBOLG_DOGGYED"] == 1) 
	{
		output("<i>“Do you go for guys?”</i> you ask, smiling");
		if(pc.tallness-5 >= chars["URBOLG"].tallness) output(" down");
		output(" at the stocky korgonne.");
		output("\n\n<i>“Aye, if they’re nice to look at I’ll bend ‘em over all the same,”</i> he says, nodding at you.");
	}
	else if(pc.isBimbo()) 
	{
		output("<i>“Wanna like, make my");
		if(x >= 0) output(" pussy");
		else output(" asshole");
		output(" feel real good with your cock");
		//thirdtime:+
		if(flags["URBOLG_DOGGYED"] >= 3) output(", daddy");
		output("?”</i> you ask, giving him a cute smile and idly touching your [pc.chest].");
		output("\n\n<i>“Up to your ship then, c’mon,”</i> Urbolg says, flicking his head towards the ramp. <i>“Get yer sweet ass on the bed, lass.”</i>");
	}
	else
	{
		if((pc.race().indexOf("ausar") != -1 || pc.race().indexOf("huskar") != -1) && pc.tailCount > 0)
		{
			output("<i>“");
			//thirdtime+: 
			if(flags["URBOLG_DOGGYED"] >= 3) output("Will you show me how a </i>real<i> alpha fucks his little slut, daddy?”</i> you moan, wagging your [pc.tails] in need.");
			else output("Wanna take charge and teach me which one of us is the alpha dog?”</i> you say, grinning and wagging your [pc.tails].");
			output("\n\n<i>“Always a punk kid that needs to be put in their place proper-like,”</i> Urbolg says, shaking his head even as his tail wags along. <i>“Go on, then. Up the ramp like a good pup.”</i>");
		}
		else
		{
			output("<i>“");
			if(flags["URBOLG_DOGGYED"] >= 3)
			{
				output("Wanna bury your big, hard bone in my");
				if(x >= 0) output(" tight little slutpussy");
				else output(" ass");
				output("?”</i>");
			}
			else output("So I’ve heard male dogs take their mates from behind...”</i> you say, grinning at Urbolg. <i>“Think you can help verify that?”</i>");
			output("\n\n<i>“Aye, ye look like a bitch that could use a good fuck,”</i> he says breezily, turning your dog joke around on you. <i>“Get up that ramp and I’ll show ye in yer ship, ‘Captain’.”</i>");
		}
	}
	output("\n\nUrbolg hustles you up the ramp, smacking your butt once for emphasis.");
	if(pc.isBimbo() || flags["URBOLG_DOGGYED"] >= 3) output(" You moan and giggle at the impact, turning over your shoulder and sluttily winking at him");
	else output(" It puts a jump in your step, that’s for sure");
	output(". By the time you’ve reached your ship’s bedroom, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output(" you can hardly wait to jump on daddy’s cock and let him fuck your brains out with his stud cock");
	else 
	{
		output(" you’re incredibly horny from having escorted a stocky");
		if(flags["SEXED_URBOLG"] != undefined) output(", hung");
		output(" pirate onboard for the sole purpose of pounding your");
		if(x >= 0) output(" cunt");
		else output(" asshole");
	}
	output(". You hardly <i>know</i> him, and that only makes you feel all the more slutty.");

	output("\n\n");
	//Firsttime:
	if(flags["URBOLG_DOGGYED"] == 1) output("<i>“Wee ship,”</i> he grunts. <i>“Smaller inside than it looks. Hopin’ you’re not the same way, kid, ‘cause this is goin’ inside ye one way or another.”</i>");
	else 
	{
		output("<i>“Ship never gets any bigger, does it?”</i> he grunts once inside your bedroom. <i>“That");
		if(x >= 0) output(" cunt");
		else output(" asshole");
		output(" of yers sure does, though. Good thing, too.”</i>");
	}
	output("\n\nLooking back you see Urbolg has already stripped down, revealing his body and perhaps most importantly, his cock.");
	if(pc.isBimbo()) 
	{
		output(" It’s colored like delicious candy! You’re on your knees immediately, obediently presenting your open mouth and poking your tongue out for his use.");
		output("\n\n<i>“Aaah.”</i>");
		output("\n\n<i>“Good [pc.girlBoy],”</i>");
	}
	else
	{
		output(" It’s <i>huge</i> on him, convincing you he could break a smaller slut in half. His doggy knot is already pumped up, too. He’s every bit as ready for this as you are.");
		output("\n\n<i>“Suck it,”</i> he growls, nodding downwards. <i>“Never fit otherwise.”</i>");

		if(flags["URBOLG_DOGGYED"] >= 3) output("\n\n<i>“Yes daddy,”</i> you moan, obediently kneeling before him and opening your mouth as wide as you can, letting your tongue loll from your lips");
		else output("\n\nGetting down on your hands and knees, you crawl forward and open your mouth for him");
		if(isDog) output(", your tongue hanging out like the bitch you are");
		output(".");

		output("\n\n<i>“");
		if(flags["URBOLG_DOGGYED"] >= 3) output("Good [pc.girlBoy]");
		else output("Least ye follow orders");
		output(",”</i>");
	}
	output(" he mutters, placing a hand on your head and taking the invitation.");
	output("\n\nHis tapered tip slides across your tongue and into your mouth without stopping, Urbolg taking the opportunity to hold you in place and thrust into your cheeks. You gladly allow him, curling your [pc.tongue] around as much of his fat cock as you can manage while your cheek bulges with cock. He holds you there for a few seconds while you slobber and slurp all over his dick, your lips sealing around the middle of his cock and sucking as hard as you can manage.");
	output("\n\nUrbolg grunts in pleasure, pulling back and thrusting deeper into your mouth, the head of his cock kissing your tonsils for a second before he pushes further. Every inch he sinks inside you makes you");
	if(pc.isHerm()) output(" wetter and harder");
	else if(pc.hasVagina()) output(" wetter");
	else output(" harder");
	output(", halfway to cumming before he’s even gotten between your thighs. Right as he’s about to get balls deep in your welcoming throat,");
	//firsttime
	if(flags["URBOLG_DOGGYED"] == 1) output(" though, you get a surprise");
	else output(" he pulls it off again");
	output(".");

	output("\n\nAs his knot presses up against your lips, you feel a warm, sticky spurt of what can only be Urbolg’s cum, squirting from his dick and splattering against the back of your throat, marking you. You head spins with the feel of it, its taste rising back up to the back of your tongue even as it begins to trickle down into your stomach. Then the next thrust has him holding you down, pressing your lips firmly against his knot in a loose, sloppy kiss,");
	//firsttime:
	if(flags["URBOLG_DOGGYED"] == 1) output(" and at last you understand");
	else output(" getting a heaping second helping directly down your throat");
	output(".");

	output("\n\n<i>“Nnnh, fuck,”</i> Urbolg grunts, meeting your eyes as you gaze up at him in");
	if(flags["URBOLG_DOGGYED"] == 1) output(" wonder");
	else output(" fulfillment");
	output(". He says nothing more, just keeps facefucking you and cumming more and more with every press against his knot.");
	//Thirdtime+:
	if(flags["URBOLG_DOGGYED"] >= 3)
	{
		output(" You can scarcely keep yourself from cumming as you swallow his seed, each shot making your");
		if(pc.isHerm()) output(" [pc.vaginasNounSimple] pussy throb and your [pc.cocksNounSimple] drip");
		else if(pc.hasCock()) output(" [pc.cocksNounSimple] flex, dripping");
		else output(" [pc.vaginasNounSimple] throb, dripping");
		output(" in need.");
	}
	output(" Eventually, when you’ve swallowed down what must surely be all he has to give, he pulls himself from your warm, wet mouth with a pop and you take a gasping breath. Somehow, he’s still hard after all that.");
	output("\n\n<i>“How’s that for a treat afore we get started");
	if(isDog) output(", pup");
	output("?”</i> he says, hand");
	if(pc.hasHair()) output(" in your [pc.hair].");
	else output(" still on your head.");

	if(flags["URBOLG_DOGGYED"] >= 3)
	{
		output("\n\n<i>“Thank you, daddy...”</i> you moan,");
		if(isDog && pc.tailCount > 0) output(" wagging your [pc.tails].");
		else output(" desperately resisting the urge to get yourself off.");
	}
	else if(isDog && pc.tailCount > 0) output("\n\nYou stay silent and just wag your tail, panting and smiling up at him.");
	else 
	{
		output("\n\n<i>“Guh-goddamn,”</i> you pant, unconsciously reaching to your lips and touching them. <i>“");
		//Firsttime: 
		if(flags["URBOLG_DOGGYED"] == 1) output("That’s... amazing");
		else output("Never get used to that..");
		output(".”</i>");
	}
	output("\n\n<i>“Aye, I thought");
	//Thirdtime+:
	if(flags["URBOLG_DOGGYED"] >= 3) output(" you’d say");
	output(" as much,”</i> he chuckles");
	if(isDog && !pc.hasNonScritchEars()) output(", scratching your ear");
	output(". <i>“Now up on the bed and spread yerself.”</i>");

	output("\n\nYou’re only too happy to get to it,");
	if(pc.isTaur()) 
	{
		output(" clambering up on the bed and seating yourself in the middle,");
		if(pc.tailCount > 0) output(" lifting your tail and");
		output(" exposing your hind half’s ");
		if(x >= 0) output("pussy");
		else output("asshole");
	}
	else output(" getting up on the bed and crawling forward on all fours");
	output(".");
	//Nonexhibitionist: 
	if(pc.exhibitionism() < 33) 
	{
		output(" Your cheeks tinge a faint shade of pink when you feel his hands on your asscheeks, spreading them wide and inspecting");
		if(x >= 0) output(" how wet you are");
		else output(" your rear");
		if(pc.hasCock()) output(". He can see how hard you are");
		output(" after sucking his cock for a few minutes");
	}
	else 
	{
		output(" You eagerly raise your rump in the air, showing all of yourself to Urbolg");
		if(x >= 0) output(" and dripping all down your inner thighs");
		else output(" and winking");
		output(".");
	}
	output("\n\n<i>“No shame in a bitch bein’ a bitch,”</i> he says simply,");
	if(x >= 0) output(" running his finger up the centre of your dripping pussy and making you shiver.");
	else output(" licking his finger before sticking it in your ass.");
	output("\n\n<i>“Nnnh,”</i> you moan quietly, trying not to make a big deal out it. It feels so <i>good</i>, though...");
	output("\n\nHe doesn’t spend much time on foreplay - that finger is pretty much all the warning you get before he’s behind you and aligned with your fuckhole.");
	output("\n\n<i>“");
	if(isDog) 
	{
		output("Here’s how an alpha does it, bitch,”</i> he growls, roughly seizing your tail and lifting it out of the way.");
		if(flags["URBOLG_DOGGYED"] > 1) output(" <i>“Just in case you’d forgotten.”</i>");
	}
	else 
	{
		output("‘Bout time I taught you");
		if(flags["URBOLG_DOGGYED"] > 1) output(" some more about");
		output(" how to properly please a man, slut.”</i>");
	}
	output("\n\nYou moan, <i>loud</i>, as the korgonne sinks half of his length into you in one stroke. With the next, he’s balls deep and you’re face down on your pillow,");
	if(pc.isTaur()) output(" gritting your teeth and trying not to sound like you’re his bitch mare");
	else output(" ass in the air and trying not to scream in pleasure");
	output(". It doesn’t work, though. It only takes a few seconds of him pounding your");
	if(x >= 0) output(" slick, welcoming cunt");
	else output(" stretched-taut asshole");
	output(" for you to be honest, lifting your head to half-moan, half-scream his praises.");
	if(x >= 0) pc.cuntChange(x,chars["URBOLG"].cockVolume(0));
	else pc.buttChange(chars["URBOLG"].cockVolume(0));

	output("\n\n<i>“Ooohooh, god!”</i> you cry out, feeling him bottom out inside your");
	if(x >= 0)
	{
		if(pc.isBimbo()) output(" tight little cunny");
		else output(" stretched-wide pussy");
	}
	else output(" intestine");
	output(" every second. <i>“Fuck! Fuck! Fuck");
	if(flags["URBOLG_DOGGYED"] >= 3) output(" me, daddy");
	output("! Uhhh!”</i>");

	output("\n\n<i>“Not the first slut I’ve had singing in their own cabin and I doubt ye’ll be the last, either,”</i> Urbolg cackles, spanking your ass with his non-mechanical arm. The impact is loud enough to surprise you more than the stinging sensation that settles in a second later, your ass jiggling with the contact. You open your mouth to complain but all that comes out is the long, eager moan of a whore getting what [pc.heShe] wants.");

	output("\n\nFuck it, he can spank you like a bitch and talk all the shit he wants if he keeps fucking your needy");
	if(x >= 0) output(" cunt");
	else output(" pucker");
	output(" like this! You throw your head back and groan in satisfaction, your voice coming from deep in your throat as he pounds your ass. His hips smack into your behind with the force of a blast door closing, each slap resounding in your bedroom.");
	//Crew: 
	if(crew(true) > 0) output(" If any of your crewmates are around, they know for sure you’re getting fucked in here like the slut you are.");
	if(x >= 0)
	{
		output(" Your mind’s delving into deeper and deeper submission faces a sudden interruption when you feel something cold and metallic pressing at your asshole.");

		output("\n\n");
		if(flags["URBOLG_DOGGYED"] == 1)
		{
			output("<i>“W-what i-i-is that,”</i> you pant, getting fucked too hard to speak properly, let alone look back for yourself. <i>“Guh-nnngh! Oh! Oh! Fuck!”</i>");
			output("\n\n<i>“Jus’ a spare finger I had lyin’ around,”</i> Urbolg says, and the next moment your eyes bulge in shock.");
		}
		else output("<i>“O-o-oh g-o-o-od,”</i> you whimper needily, already knowing what’s going to happen.");

		output("\n\nHis finger extends all on its own, springing forward from his lower knuckle and penetrating your unprepared asshole several inches deep before you can even think to clench. By the time you do, it’s far too late - it’s pounding you like a machine at a rate of what feels like five thrusts a fucking second.");

		output("\n\n<i>“Ye seem like the kinda " + pc.mf("lad","lass") + " who’d appreciate two at once,”</i> Urbolg says, and you can hear the mirth in your voice. He’s teasing you, using your own libido against you, and god damn it he’s right. It <i>does</i> feel better with his finger jammed up your asshole, fucking you almost as hard as the fat cock between your thighs.");
	}

	output("\n\n<i>“Guhhhh,”</i> you groan, starting to wonder if you’ll even be able to weather the storm, each slap of his knot against your ass starting to squirt cum into your defenseless ");
	if(x >= 0) output("snatch");
	else output("asshole");
	if(x >= 0)
	{
		output(" even as his finger rubs your");
		if(pc.hasCock()) output(" sensitive prostate");
		else output(" insides");
	}
	output(". <i>“Oh, fuhuuuck! ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("Daddy, p");
	else output("P");
	output("lease!”</i>");

	output("\n\n<i>“Right on the edge, my little whore,”</i> he grunts, increasing his pace until each impact against your behind sounds like he’s slapping you across the face as hard as he can, over and over. <i>“Riii-i-ight... here!”</i>");

	output("\n\nWith most of his cum already inside you he only fires off a few strong, thick ropes of cum before it slows to a trickle - but the way he <i>throbs</i>, flexing and straining inside your [pc.vagOrAss], is enough to bring you to an explosive, screaming orgasm. You arch your back again and again, thrusting yourself back into his knot, earning yourself a few pity-shots of cum and an intense, body-shaking sensation radiating outwards from");
	if(x >= 0) output(" between your [pc.thighs]");
	else output(" your rear");
	output(".");

	output("\n\nHe immediately pulls out when you’re finished, leading you to half-scream as your oversensitive and well-used fuckhole gapes open, clenching and trying to close itself. You struggle to sit back up, but feel a metal arm on your back.");
	output("\n\n<i>“Stay down,”</i> Urbolg commands, and you obey without question.");
	output("\n\n<i>“Yes, daddy,”</i> you moan, caught up in being utterly and brutally dominated by a man probably more than twice your age.");
	
	if(flags["URBOLG_DOGGYED"] <= 1)
	{
		output("\n\n<i>“Fek, yer more of a slut than the slaves on the station,”</i> the gruff korgonne sighs in disappointment, moving to your front. He presents you with his still-hard, juice-covered dogcock. <i>“Clean it.”</i>");
		output("\n\nYou dutifully suck his cock, spitshining it to a saliva-slicked finish and getting several throatfuls of his cum as his bulging knot very slowly deflates.");
		output("\n\n<i>“Always preferred my sluts from both ends,”</i> he sighs in satisfaction as he dresses, his immense canine cock finally flagging after your minutes-long blowjob. Just how long can he go for? <i>“Arright. You come see me when ye need some takin’ care of, " + pc.mf("lad","lass") + ". I’ll do ye right.”</i>");
		output("\n\nWith a wink, he disappears from your room and your hear his bootfalls leading down the ramp. Not long afterwards, you hear the whine of machinery as he works on something. You just stay on your bed facedown for a while, wondering if his cock destroyed your mind as much as your [pc.vagOrAss]. After about ten minutes of thinking about him and his fantastic dick, you decide it’s probably best to take a shower");
		if(!pc.isNude()) output(" and get dressed");
		output(". Half an hour later and cheeks still slightly flushed with afterglow, you’re ready to go.");
	}
	else if(flags["URBOLG_DOGGYED"] <= 2)
	{
		output("\n\n<i>“You attached to that word, are ye?”</i> he grunts, not sounding too displeased this time. <i>“Fekkin’ sluts. Here.”</i>");
		output("\n\nUpon being presented with his swollen, juice-covered cock you practically leap forward, eager to clean him off and show your thankfulness for his time. He worked you over so thoroughly you can’t help but want to suck him, loudly gulping down his seed every time your lips encounter his knot and gazing upwards for his approval.");
		output("\n\nWhen he’s finally finished, he");
		if(isDog) output(" scratches you behind the ear");
		else output(" pats your head");
		output(" and dresses, making to leave.");
		output("\n\n<i>“Can we fuck again sometime?”</i> you ask, hopeful.");
		output("\n\n<i>“Aye, a’course,”</i> Urbolg nods. <i>“Long as ye don’t get too clingy like. I got an obedience collar for that if I want it. No doubt I’ll see ye again soon,");
		if(isDog) output(" bitch");
		else output(" pup");
		output(".”</i>");
		output("\n\nWith a wink, he disappears from your room and your hear his bootfalls leading down the ramp. Not long afterwards, you hear the whine of machinery as he works on something. You just stay on your bed facedown for a while, wondering if his cock destroyed your mind as much as your [pc.vagOrAss]. After about ten minutes of thinking about him and his fantastic dick, you decide it’s probably best to take a shower");
		if(!pc.isNude()) output(" and get dressed");
		output(". Half an hour later and cheeks still slightly flushed with afterglow, you’re ready to go.");
	}
	else
	{
		output("\n\nThis time, as he circles to your front so you can clean him off, you speak up.");
		output("\n\n<i>“How’d you like my");
		if(x >= 0)
		{
			if(pc.vaginas[x].looseness() <= 3) output(" tight little");
			else output(" whore");
			output(" pussy");
		}
		else
		{
			if(pc.ass.looseness() <= 3) output(" tight");
			else output(" stretchy");
			output(" asshole");
		}
		output(", daddy?”</i> you ask, fluttering your eyelashes and taking hold of his warm, hard cock in your hand. <i>“Deep and warm enough for you?”</i>");
		output("\n\n<i>“Don’t push yer luck, kid. Call me that outside o’ ye bedroom once and it’s out the airlock fer you,”</i> he says, looking at you meaningfully.");
		output("\n\n<i>“But you don’t mind </i>in<i> the bedroom, do you daddy?”</i> you murmur to him, running your other hand through the thick fur of his stomach.");
		output("\n\n<i>“Aye, a’ guess it’s grown on me a bit,”</i> Urbolg admits, sitting back on his knees and letting you stroke him. <i>“Still weird like, but can’t deny havin’ a " + pc.mf("boyslut","pretty lass") + " sayin’ it to me makes me dick hard.”</i>");
		output("\n\n<i>“Uh huh,”</i> you grin deviously, your battle won. You spend the next half an hour sucking his immense cock, letting him throatfuck ever more spunk into your stomach and gazing up at him worshipfully. By the time he’s going you can hardly talk, but you make sure to kiss his crown and caress his balls before he dresses and leaves.");
		output("\n\nYou spend the next hour masturbating in the shower, thinking of Urbolg’s cock spearing your holes over and over. By the time you exit, you’re about ready to have another round with the burly mechanic.");
	}
	processTime(60);
	pc.orgasm();
	pc.loadInMouth(chars["URBOLG"]);
	if(x >= 0) pc.loadInCunt(chars["URBOLG"],x);
	else pc.loadInAss(chars["URBOLG"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	currentLocation = "SHIP INTERIOR";
	generateMap();
	IncrementFlag("SEXED_URBOLG");
}

//[Leave]
public function leaveUrbolgSexAngerRar():void
{
	clearOutput();
	showUrbolg();
	output("<i>“Don’t tease me like that or I’ll have ye over a fekkin’ crate, ya little shit,”</i> Urbolg grumbles, turning away.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function buyFromUrbolg():void
{
	clearOutput();
	showUrbolg();
	shopkeep = chars["URBOLG"];
	shopkeep.keeperBuy = "You indicate that you’d like to buy something from him.\n\nUrbolg raises an eyebrow. <i>“Ye ain’t pulling on my tail, are ye? Most of the stuff I have laying around fer sale isn’t exactly masterwork material, just standard gear some idiot broke and tossed my way. Lucky for you, it was me what fixed it up, so this second-hand junk’ll serve ye better than the brand new crap from JoyCo.”</i>\n";
	shopkeep.inventory = [new HandCannon(),new JumperShield(),new RattyArmor(), new Vibrolass(), new TriBeamRifle(), new TrickBracer()];
	if(flags["MAIKE_HELMET_TAKEN"] != undefined && flags["ZHENG_SPACESUIT_TAKEN"] != undefined)
	{
		var suitypants:ItemSlotClass = new SpacesuitComplete();
		suitypants.basePrice = 30000;
		shopkeep.inventory.push(suitypants);
	}
	if(flags["ZHENG_SHI_JUMPSUITED"] != undefined) shopkeep.inventory.push(new Slavesuit());
	buyItem();
}

//Fuck Him/Toy Milking
public function urbolgFuckHimOrToyMilking():void
{
	clearOutput();
	showUrbolg();
	output("Leading the way, you guide Urbolg to your ship.");
	output("\n\n<i>“Not bad. Not good either, but luckily I’m not here for yer bucket of bolts.”</i> The korgonne crudely squeezes his crotch. <i>“What ye got in mind?”</i>");
	//Repeat:
	if(flags["URBOLG_TOY_MILKING"] != undefined)
	{
		output("\n\n<i>“Your toys.”</i>");
		output("\n\nJovially grinning, Urbolg marches to your quarters. <i>“I was hoping ye’d say that. There’s more than a few gadgets in here I’d like to see hanging off you.”</i>");
		urbolgToyMilkingPlayScene();
	}
	//First time
	else
	{
		output("\n\nYou ");
		if(pc.isCrotchExposed())
		{
			output("grip ");
			if(pc.totalCocks() == 1) output("your");
			else output("one");
			output(" exposed, turgid prick");
		}
		else output("squeeze your crotch meaningfully");
		output(" and announce, <i>“");
		if(pc.isBimbo()) output("Banging your heiny, silly!");
		else if(pc.isBro()) output("Your ass.");
		else output("Fucking your sweet ass.");
		output("”</i>");
		output("\n\nLoudly scoffing, Urbolg bellows, <i>“Good luck with that one, ye horny tramp! Urbolg don’t bend over nothing ‘cept a busted reactor compartment. Course if’n yer wanting to wanting to jizz yer dick silly, I’m still up to help ye out. Even got some fun toys a kinky wanker like you might enjoy.”</i>");
		output("\n\nDo you take him up on his offer?");
		processTime(7);
		flags["URBOLG_TOY_MILKING"] = 0;
		clearMenu();
		addButton(0,"Yes",comeOnUrbyLetsToyPlay);
		addButton(1,"No",noUrbolgToyPlay);
	}
}

//No:
public function noUrbolgToyPlay():void
{
	clearOutput();
	showUrbolg();
	output("You turn down the offer and consider your options. Maybe there’s something else the two of you could do together...");
	//Display sex menu, fuck him/toy milking grayed out
	urbolgSexMenu();
	addDisabledButton(1,"Toys & Frot","Toys & Frot","You just turned that down!");
}

//Yes:
public function comeOnUrbyLetsToyPlay():void
{
	clearOutput();
	showUrbolg(true);
	output("By the sounds of it, Urbolg has some fun tech squirreled away in his pockets, and so long as you get to squirt out a load with the beefy dog-man, you’re game. <i>“Let’s do it.”</i>");
	output("\n\n<i>“Aye,”</i> Urbolg smacks the door release button, <i>“that’s the idea.”</i>");
	urbolgToyMilkingPlayScene();
}

//Merge
public function urbolgToyMilkingPlayScene():void
{
	showUrbolg(true);
	currentLocation = "SHIP INTERIOR";
	generateMap();
	output("\n\nYour bed looks more than roomy enough for you both. You ");
	if(pc.tallness < chars["URBOLG"].tallness - 5) output("scamper");
	else if(pc.tallness < chars["URBOLG"].tallness + 12) output("breeze");
	else output("lumber");
	output(" past the mechanic to take a seat");
	if(!pc.isCrotchExposed()) 
	{
		output(", shedding clothes until your [pc.cocks] bounce");
		if(pc.cockTotal() == 1) output("s");
		output(" free");
	}
	else
	{
		output(", [pc.cocks] bouncing free");
	}
	if(!pc.isErect()) output(", engorging rapidly");
	else output(", already hard and rearing to go");
	output(".");
	//React to biggest dick!
	var x:int = pc.biggestCockIndex();

	//48+
	if(pc.cocks[x].cLength() >= 48) output("\n\n<i>“How d’ye keep from tripping over that behemoth when yer walking around?”</i> The wide-eyed korgonne lays one of his soft-padded paws against the side, feeling your heartbeat through the tumescent shaft. <i>“Cock like this’d split a leithan in half and probably impregnate everyone in a one click radius in the process. It’s gonna be real fun to tease.”</i>");
	//36+
	else if(pc.cocks[x].cLength() >= 36) output("\n\n<i>“Can’t believe anybody lets ye fuck ‘em with a monster like that.”</i> He gently cups it below the [pc.cockHead " + x + "], soft-padded paws rubbing affectionately. <i>“Still, looks right nice, I have ta say. It’s a dick to be proud of.”</i>");
	//24+
	else if(pc.cocks[x].cLength() >= 24) output("\n\n<i>“Oof! That’s a dick and a half right there. You only screw leithans or something?”</i> The korgonne grins slyly and strokes his supple paw-pads along the underside. <i>“Or ye just grow this porn-size pecker for showing off? Betcha it makes a real pretty mess when it finally goes off...”</i>");
	//16+
	else if(pc.cocks[x].cLength() >= 16) output("\n\n<i>“Now that’s an augmented cock if I’ve ever seen one. Ain’t nobody born with one like that natural.”</i> The korgonne runs his soft-padded paw along the underside, squeezing gently just to see how hard you are. <i>“Probably drives the size-queens wild, and I’ll admit, I’m enjoying the show a bit meself.”</i>");
	//12+
	else if(pc.cocks[x].cLength() >= 12) output("\n\n<i>“I see yer a [pc.manWoman] after me own heart.”</i> The korgonne reaches out to give your dick a stroke. <i>“Big enough to put on a pretty show, but not too big to squeeze into a tight little bitch when the night calls for it. It fits my hand quite nicely.”</i>");
	//9+
	else if(pc.cocks[x].cLength() >= 9) output("\n\n<i>“Packing a high caliber cannon are ye?”</i> The korgonne reaches out to give you a squeeze, his soft-padded paws wrapping firmly around your length. <i>“Pretty nice piece of equipment. I’ll be counting down the seconds till I can see it go off.”</i>");
	//6+
	else if(pc.cocks[x].cLength() >= 6) output("\n\n<i>“Decent pecker ye got there.”</i> The korgonne casually wraps his fingers around it, the soft paw-pads compressing tight. <i>“Size that’ll squeeze in damn near any cunt with enough heft to keep ‘em coming back fer more. And it fills me paw very nicely.”</i>");
	//else trapcawk
	else output("\n\n<i>“Awww, that’s a cute lil’ dick ye got there.”</i> The korgonne slyly reaches down to tickle it with the soft pads of one of his fingers. <i>“But it’s real sensitive too. A whole prick’s worth of nerves condensed down into that perky little package. Yer gonna squirt so prettily.”</i>");
	//merge
	output("\n\nYou gasp from the attention and fail to stifle a smile, rocking your hips into Urbolg’s hand. <i>“Yeah... but what about you?”</i> You pat the bed next to you, smiling when the gruff mechanic swings his naked ass around onto your sheets. His hand stays right where it is, however.");
	output("\n\nA rather large tent rises in the canine alien’s apron, and emboldened by the feeling of his silky fur sliding against your [pc.cockSkin " + x + "], you reach under Urbolg’s apron in search of his clearly tumescent cock. The fur on his thigh is a bit rougher, but you’re soon past it, burrowing into the swampy, musky air surrounding his cock. Your fingers bump into steely smoothness and reflexively grab hold.");
	output("\n\n<i>“Ahhh,”</i> Urbolg sighs, <i>“now yer gettin’ it. But I promised ye toys, didn’t I?”</i> He plays with your [pc.cock " + x + "] one-handed while he talks");
	if(pc.hasSheath(x)) output(", pinky circling around your sheath");
	else if(pc.hasKnot(x)) output(", pinky circling around your [pc.knot " + x + "]");
	else if(pc.balls > 0) output(", pinky pressing against your [pc.sack]");
	else output(", pink pressing against your perenium");
	output(". <i>“Pirate like you ain’t gonna settle for no friendly handjob, right?”</i>");

	output("\n\n<i>“Right,”</i> you softly moan, exploring Urbolg’s cock. It’s a proud canine dick by the feel of it. The shaft is nice and thick, tapering slightly toward an angular tip. When your fingers get too close to its animalistic crown, the whole thing jerks in your hand, and when you gently contact the knot, dribbles of sticky-slick cock-sap flow over your knuckles to grease your palm. A map of his rigidly erect features meticulously assembles itself in your mind, fed by your fingers’ eager fondling.");
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",urbolgToysPartII,x);
}

public function urbolgToysPartII(x:int):void
{
	clearOutput();
	showUrbolg(true);
	output("Urbolg smiles wide and produces a small silver disk from the seemingly endless pockets of his apron. <i>“Yeah hands are nice, but this beaut’s something else.”</i> He gently presses it against your bare loins, a few inches above your [pc.cocks], and it holds fast as if bound by invisible adhesive. <i>“Everybody’s got their panties in a knot over miniaturized vibrators, but those are idiot toys fer teenagers. This’ll the real deal. Scans local tissue to locate the prostate, then uses shaped waves to shake every drop out of the cummy lil’ bastard.”</i>");
	output("\n\nYou stare at Urbolg in disbelief, still attentively stroking in spite of him letting go. <i>“You’re kidding.”</i>");
	output("\n\nA faint, low-pitch hum answers your incredulous query with strangely deep-seated pleasure. [pc.EachCock] jerks and surges, somehow even thicker and harder. If you close your eyes, you can sort of feel the high-tech vibrator working, sending powerful vibrations ripping through a ");
	if(pc.ballFullness >= 80) output("cum-swollen ");
	else output("sensitive ");
	output("gland.");
	if(pc.analVirgin) output(" You’ve never taken it in the ass, but you imagine that what you’re feeling is like all the best parts of it condensed down into one point of potent pleasure.");
	else output(" It’s like all the best parts of anal condensed down into one point of potent, dick-milking pleasure.");
	output(" Out of the blue, your [pc.cocks] flex");
	if(pc.cockTotal() == 1) output("es");
	output(" again. Glossy pre beads on the tip");
	if(pc.cockTotal() > 1) output("s");
	output(".");

	output("\n\nYou have every confidence that the wonderful little circle on your belly is going to drive you over the peak eventually. It’s simply a matter of enjoying it until you blow... or bringing your hands in to wring it out all the faster.");
	output("\n\nUrbolg’s heavy apron drops to the floor, revealing his vibrant blue boner to you in all its tumescent glory. A heavy knot bulges obscenely at the base, loaded up and ready to go. <i>“Don’t think I’d let you have all the fun.”</i> He places identical disks down on either side of his sheath and immediately groans, tongue lolling. <i>“That’s the fucking shit right there.”</i>");
	output("\n\nYou know what he means. Laying back in the bed together, dicks standing high and proud, spooling out ribbons of pre-cum, you groan in agreement. You don’t have to do <i>anything</i> to earn the buzzing waves of pleasure that course through your [pc.cocks], squeezing bolts of bliss from an otherwise untouched prostate. The whole of your crotch is engorged, heavy and sensitive. You can feel the ship’s climate control faintly licking at your increasingly pre-moistened tumescence, and you never want it to stop.");
	output("\n\n<i>“Awww, ye really like that, eh?”</i> Urbolg rolls over on top of you, his thick thighs splayed wide");
	if(pc.balls > 0) output(" to rest his fuzzy balls atop your own");
	else output(" to let his fuzzy balls rest atop your [pc.sheath " + x + "]");
	output(". <i>“Let’s have a bit more fun, seein’ as how we’re both feeling so nice.”</i> He smiles down at you, the weight of his body ever so slightly compressing his knot against ");
	if(pc.hasKnot(x)) output("yours");
	else output("your [pc.sheath " + x + "]");
	output(". A thin rope of cum squeezes out of him to fall on your chest. No more follow, though from Urbolg’s smile, he’s loving the experience. <i>“Move those hips of yours if you want more.”</i>");
	processTime(10);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",urbolgToysPartIII,x);
}

public function urbolgToysPartIII(x:int):void
{
	clearOutput();
	showUrbolg(true);
	//Cumslut of any kind.
	if(pc.isBimbo() || pc.isCumSlut())	
	{
		output("Your eyes cross to take in the puddle of creamy goo on your chest. The salty, musky aroma wafts up to your nostrils, and your mouth can’t help but water. Your cock can’t help but throb. You can’t help but lick your lips and prepare yourself for a mighty thrust. Of course you want more of his cum! You want to milk it out in long loving strokes until you’re bathing in it. You want it " + (pc.hasHair() ? "slicking back your hair" : "coating your head") + " and danging from your eyelashes. You want it bubbling around a glowing, cum-drunk smile.");
	}
	//Not cumslut, sub 50 libido
	else if(pc.libido() < 50) 
	{
		output("Your eyes cross to take in the sight of the creamy goo on your chest. Despite your near incandescent arousal, it isn’t the idea of squeezing out his cum that motivates you; it’s the knowledge of how good it will feel to rub your [pc.multiCocks] against his while the magical toy bathes your prostate in sinfully erotic vibrations. Besides, at least some of his cum is going dribble down onto you, further lubricating your powerfully erect maleness");
		if(pc.totalCocks() > 1) output("es");
		output(".");
	}
	//50+ libido, non-cumslut
	else if(pc.libido() < 75)
	{
		output("Your eyes cross to behold the puddle of creamy goo on your chest, aware of its potent, musky aroma tickling your nostrils. Normally, the idea of squeezing out a load of hot korgonne spunk onto your [pc.chest] and [pc.belly] wouldn’t seem so grand, but with your heightened libido, almost anything sounds erotic. You hope the next squirt hits you on the face so the mechanic will have something pleasant to watch while he cums. Then, you’re going to wring him dry, maybe even swallow a couple mouthfuls. You can already feel your hips tensing with readiness.");
	}
	//75+ libido
	else output("Your eyes cross to behold the puddle of creamy goo on your chest, aware of its potent, musky aroma tickling your nostrils. It smells <i>good</i>, at least in your hyper-sexed, over-aroused state. You can’t wait to milk some more out of him, to rub your dick on his and see how many squirts his balloon of a knot has packed inside. He’ll probably lose it the moment he sees you with your [pc.chest] glazed and your [pc.lipsChaste] painted, and the dribbling excess is going to feel so good on your [pc.cocks].");
	//Merge
	output("\n\nYou feel your body lurch into action the moment you make up your mind, lifting your [pc.butt] clear off the mattress as the urge to cum and be cummed upon seizes hold of your motor cortex. Urbolg grunts in surprise, but more important is the thick wad of jizz that spurts out of his dick like water from a firehose. It impacts the wall overhead hard enough to burst apart into a salty rain.");

	output("\n\nAs expected, the sensation is exquisite. His heartbeat thrums through his cock as it slides against your own length, the twin dongs shifting slightly on curtains of pre and cum. The aroma of sex, particularly the musky masculine notes, fills the air as you grab Urbolg by his not inconsiderable waist and happily grind your [pc.hips] into him, frotting so heavily that you can hear the squishing sounds of cum-soaked skin slipping and slapping in your lusty fervor. It’s music to your ears when combined with the beefy mechanic’s moans.");
	output("\n\nSpooge slaps down on your [pc.skinFurScalesNoun] every few seconds - slower than a typical ejaculation but perfectly matched to the heavy press of your [pc.cock " + x + "] to his knot. You’re dribbling a bit yourself by now.");
	if(pc.ballFullness <= 10) output(" It doesn’t matter if you feel drier than a desert well from all your other sexual activity, the prostate stimulation has made you a very drippy [pc.boyGirl].");
	output(" The frission of spunk-oiled skin gliding on skin is <i>exactly</i> what you needed to match the buzzing deep inside.");

	output("\n\nSoon you feel your insides tightening up, twisting around the deep-seated thrumming of Urbolg’s toy. Your thrusts get shakier. As you look up at the panting mechanic, watching him continue to paint you in alabaster relief, your muscles tremble, and you nearly lose it.");
	output("\n\nHe notices too. The talented artificer puts one hand behind your head and lifts you up even as he leans down, uncaring that your [pc.lipsChaste] are layered with droplets of his cum. You lose yourself in his lips, in the salt-and-spit sense of tongues meeting and twirling. His fur tickles your cheek as you make out, and your [pc.cocks] ache");
	if(pc.cockTotal() == 1) output("s");
	output(" from the ecstatic tightness building within. There’s no art to the kiss, just pure, wanton, animal arousal driving you both to lick and suck and fill the other even as your body’s are pushed to the very edge of climax.");
	output("\n\nTorrents of bliss rocket down your spine and into your crotch on the back of that kiss, somehow hotter and more exciting than the sloppy dick-to-dick grinding.");
	if(pc.cumQ() < 100) output(" You pump out dollop after dollop, far more than you should, but there’s no denying that Urbolg’s output shames you. He cums with a roar, blasting your face in white so thick and creamy that it feels like you’re buried under a half-inch of virile goo.");
	else if(pc.cumQ() < 1000) output(" Your first spurt is a stream every bit as heavy as Urbolg’s earlier jets, but the virile mechanic’s output from actual, proper orgasm still dwarfs your own. Huge jets of pearly cream fall over your face until you’re buried under what feels like a half-inch of virile goo. All the while, you spray what feels like your biggest load in a long time onto the soupy puddle on your [pc.belly].");
	else if(pc.cumQ() < 10000) output(" You pump out a huge rope of [pc.cumNoun], more than you expected. The pleasure of propelling that thick stream of release out of your distended urethra is mind-blowingly good, yet you fail to stop there. Again and again you squirt, matched by Urbolg’s own peak. He delivers an avalanche of white jism onto your face, painting you until you feel buried by inches of creamy korgy goo.");
	else output(" You blast out a volcano of [pc.cumVisc] release, even more voluminous than your usual, obscenely potent releases. This one feels like a tidal wave pouring from your straining urethra, pressing on climax-sensitized nerves from the inside until you feel like you’re on the edge of passing from the ecstasy of ejaculation. Urbolg must know how you feel, because he’s cumming too. He sprays his pearly load all over your face, but there’s simply not enough left in his knot for him to compete with your deluge of seed. You smile up at him from under a caked-on mask of mixed ejaculate and ride the experience for as long as your overworked [pc.balls] will let you.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",urbolgToysPartIV,x);
}

public function urbolgToysPartIV(x:int):void
{
	clearOutput();
	showUrbolg(true);
	output("Semen is everywhere. It’s all over your sheets, ");
	if(pc.hasHair()) output("in your [pc.hairNoun]");
	else output("on your head");
	output(", and thoroughly glazing the rest of you.");

	output("\n\nUrbolg is no better off. The stocky dog-man’s crotch is plastered with mixed sperm all the way down to his knees, and he’s panting like he just finished a marathon. He rolls off of you, cock still hard and drooling. His artificial eye is completely unfocused as he groans and twitches. Both his toys are still going strong, even as you peel your own off.");
	output("\n\nWiping the seed from your eyes, you watch him for a bit. His cyan knot seems to be filling up quite rapidly, even if his brain is taking its sweet time to recover.");
	if(pc.isBimbo() || pc.isCumSlut())	
	{
		output(" You do him the favor of sealing your lips around his slippery tip and sucking. A hand around his knot soon has him spraying creamy delight into the back of your throat, something you’re all too happy to swallow down. There seems almost no end to his loads. One cheek-bulging deposit inevitably gives way to another, and another... and another. You just focus on sucking like the natural-born cock-sucker you are. Urbolg deserves to be <i>satisfied</i>.");
		output("\n\nYour tummy gurgles and wobbles from fullness before the korgonne stops giving you musky treats, but at least the size of his squirts and the thickness of his load has diminished. What a productive doggy! You ease off his cock and brush off his toys before he can die from dehydration, though. The cum flavored burp you have while you wait for Urbolg to wake up is nature’s way of letting you know you did a good job. Yay!");
	}
	//No new pg:
	else
	{
		output(" If you let him keep going, he’s going to lose the rest of the day cumming all over himself and your sheets.");
		if(pc.libido() >= 50) 
		{
			output(" Tempting as that may be, you have a pirate base to explore");
			if(pc.libido() >= 75) output(", and new pirates to fuck");
			output("!");
		}
		else output(" You both have better things to do.");
		output(" Brushing off his toys, you sit down next to him and do your best to wipe off the worst of his cum.");
	}
	//Merge
	output("\n\nPerhaps two minutes later, Urbolg stretches slowly and sits up. <i>“Told ye I had the best toys, eh?”</i> He wipes some of the cum off your cheek and sucks his finger clean. <i>“Fucking primo orgasms. Thick enough to knock up a whole tribe of ausar bitches with furry bastards.”</i> He gestures to his thighs and smiles. <i>“Ye did a pretty good job yerself. Gonna need ta git myself a shower in a bit, I wager.”</i>");
	output("\n\nThe korgonne heaves himself up and grabs his apron, perhaps the only thing in the immediate area to survive your bit of playtime un-spunked. <i>“I’ll be seeing ye outside. Lemme know if I can do anything for ye, or if ye want another go with me toys.”</i>");
	output("\n\nYou definitely will.");
	//Apply cumsoaked.
	if(pc.isBimbo() || pc.isCumSlut())	
	{
		processTime(30);
		pc.loadInMouth(chars["URBOLG"]);
	}
	else processTime(10);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("URBOLG_TOY_MILKING");
}

//[=PB Cookie=]
// Display this button in Urbolg’s main menu
// Tooltip: You often see Urbolg when he’s hard at work. Maybe he’d like to have a nice treat to relax after some hard work.
public function urbolgPBCookiesBYOUMADMAN():void
{
	clearOutput();
	showUrbolg(true);
	author("B!");
	if(flags["URBOLG_PBED"] == undefined)
	{
		output("You check the time. ");
		if (hours < 7) output("It’s pretty late at night; you wonder if Urbolg is in the mood for a quick bite to eat.");
		else if(hours < 12) output("It’s about morning. You idly wonder if Urbolg’s had anything to eat, and if he wouldn’t mind having a quick, early snack with you.");
		else if(hours < 18) output("It’s about afternoon. Given that Urbolg is a mechanic by trade, there’s a good chance he hasn’t had many opportunities to stop for some food. You wonder if he’s willing to pass the time with a snack.");
		else output("It’s starting to get a little late, and Urbolg is still hard at work; maybe he’s in the mood to share a snack to wind down from a hard day’s work.");
		output(" You ask him if he’s feeling hungry.");

		output("\n\nHe hums in thought at the question and pats at his stomach through his thick apron. <i>“Aye, ‘spose I could go fer somethin’ t’ take the edge off,”</i> he admits. <i>“Whatcha thinkin’, " + pc.mf("lad","lass") + "?”</i>");

		output("\n\nYou say that you have a handful of field rations that you always keep on you that you’re willing to share. They aren’t exactly a five-star meal but they’ll tide you both over for a little while, at least. <i>“Take it from me, livin’ on a rock like this, ye get used to eating whatever’s about.”</i>");

		output("\n\nAt that, you reach into your pack and scrounge for the treats you had in mind. The first thing your hands find are a pack of about a half-dozen ");
		if(yammiIsCrew()) output("home-baked ");
		output("peanut-butter cookies, wrapped in a single, clear plastic baggie to maintain their freshness. Three between you and Urbolg ought to be plenty.");

		output("\n\nYou withdraw the baggie and hold it in the air for Urbolg to see. You ask him if he’s ever had a peanut-butter cookie before.");

		output("\n\nAt the question, and when he recognizes what it is you’re holding, his eyes widen and his back straightens. <i>“Ah, " + pc.mf("lad","lass") + ",”</i> he says with a start. He’s surprised, momentarily at a loss for words, but he recollects himself. <i>“In a bit of a kinky mood, are ye? And here I thought ye were just lookin’ fer somethin’ to munch on. Er... maybe ye are?”</i>");

		// Continue here if the PC has never given any other character a PB cookie
		if(pbcookiesUsedOnKorgonne() == 0)
		{
			output("\n\nYou tilt your head and ask him what he means.");
			output("\n\n<i>“Ye fer real?”</i> he asks incredulously. <i>“Ye really be havin’ no idea what peanut butter be doin’ to a Korgonne’s, uh... biology?”</i> You answer positively: ");
			if(pc.race() != "korgonne") output("he’s the first Korgonne you’ve ever offered a peanut-butter cookie to.");
			else output("you hadn’t had peanut butter cookies in a while and thought they would just be a fun, nostalgic snack. Should you have not done that?");

			output("\n\n<i>“No way to mince werds, then,”</i> he says, not shying away from the topic. <i>“Peanut-butter, in any shape er form, makes us Korgonne jizz like a fekkin’ fire hydrant. One taste of the stuff and we’re cummin’ our brains straight through our dicks; shit, us Korgonne aren’t exactly the most sexually aggressive out there, and just a whiff’a peanut butter’ll get us ready to rut like horny bastards. Werks on our women, too. Don’t matter if yer gay or straight, either: one of them cookies’ll make a hell of a mess, fer sure.”</i>");
			output("\n\nYou stare at Urbolg, surprised and amazed; you scan his expression to see if it’ll crack, and it doesn’t. He’s telling the truth.");
			output("\n\nYou look at the cookies. They <i>truly</i> have that sort of effect on a Korgonne? <i>“Do I look like a fekkin’ liar to ye?”</i> he asks, his tone lighter than his words. <i>“One bite o’ one of them cookies and ");
			if(pc.race() != "korgonne") output("I’ll");
			else output("we’ll");
			output(" be fekkin’ paintin’ the floor with ");
			if(pc.race() != "korgonne") output("my");
			else output("our");
			output(" cum.”</i>");

			output("\n\nHe crosses his arms as your gaze goes from him, back to the cookies, then back to him. Honestly, you’re at a loss as to how this is a bad deal. You impishly ask him if he wants one or not.");

			output("\n\nUrbolg hums and strokes at the bottom of his muzzle as he considers it. <i>“Hell, why not,”</i> he asks as he hooks his hands underneath his apron to lift it off himself, bearing his full, nude body to the air. <i>“Could go for some relief, an’ I’m a bit peckish, besides.”</i>");
		}
		// Continue here if the PC has given any Korgonne a cookie even once
		else
		{
			output("\n\nYou smirk; you’ve been caught and you know it. You ask Urbolg how he figured out what peanut butter does to Korgonne.");
			output("\n\n<i>“We didn’ have nothin’ like peanut butter back in the hold,”</i> he explains. <i>“When I left Uveto, and I got integrated into new cultures and shit, I was told that a normal pick-me-up was somethin’ called a peanut-butter-and-jam sammich. So I gave ‘er a try.”</i>");
			output("\n\nHe chuckles as he recalls the memory. <i>“Caught that fekkin’ nurse I was with for a loop, fer sure. ‘Course, afterwerd, I wanted te know what part of the sammich could gimme such a reaction. For, uh, science, and junk. Long story short, that’s how I know.”</i>");
			output("\n\nYou tell Urbolg that he’s the first Korgonne you’ve met that knew what peanut-butter did to them beforehand. It was always a bit of a kick to feed a Korgonne such a plain, innocent cookie, and... be treated to a ‘show’ in return.");
			output("\n\n<i>“Well, hell, " + pc.mf("lad","lass") + ", if that’s what yer after, I ain’t sayin’ no to some food and a good time,”</i> he offers.");
			output("\n\nNow that you two are on the same page, you open up the baggie, letting the scent of your peanut-butter treats permeate the air. <i>“Thassa good [pc.boyGirl],”</i> Urbolg says as he hooks his arms beneath his apron and lifts it over his head, bearing his full, nude body to the air. <i>“Could go for some relief, an’ I’m a bit peckish, besides.”</i>");
		}
	}
	// Continue here for subsequent cookies
 	else
 	{
 		output("You glance at your Codex for the time.");
 		output("\n\n<i>“Time for another cookie, is it, [pc.name]?”</i> Urbolg asks quickly when he sees your by-now familiar motion. You look at him and smirk, and he straightens himself at his sudden, uncharacteristic change in demeanour. After just a few cookies, you’ve already gotten him trained to respond to some specific motions and commands.");
 		output("\n\n<i>“Oh, fuck off,”</i> he says, annunciating his curse as clearly as he can, making it clear that he doesn’t appreciate being likened to some trained pet. <i>“Don’t pretend you’d pass up a chance to eat somethin’ that makes ye blow yer load when it hits yer tongue. A’course I want some more!”</i>");
 		output("\n\nUrbolg hasn’t been a part of the Korgonne hold for some time, now. He’s aware of what peanut butter does to him, and he <i>must</i> know that it’s not exactly a difficult commodity to find – why doesn’t he just go and buy some jars and skip the cookies altogether?");
 		output("\n\n<i>“Ye outta yer mind? With that much peanut butter lying around my workshop, I’d get nothin’ done! As great as it is to feckin’ cum myself dry, it ain’t what I’d call productive. Not in th’ sense I’m thinkin’, anyway.”</i> He eyes you impatiently and his robotic arm’s finger taps on the table; he wants a cookie, and he’s getting tired of answering questions. <i>“But I ain’t gonna resist if some’a the stuff</i> happens <i>to find its way here. Now, ya gonna gimme some ‘er not?”</i>");
 		output("\n\nYou point out that you never said you were carrying any; just that he assumed that you were, and all that from glancing at your codex. Just as Urbolg’s expression begins to sour, you point at that, of <i>course</i> you have some cookies. You wouldn’t dream of teasing one of your favourite Korgonne like that.");
 	}
	// Merge here
	processTime(6);
	clearMenu();
	addButton(0,"Next",urbyPBCookie2);
}

public function urbyPBCookie2():void
{
	clearOutput();
	showUrbolg(true);
	author("B!");
	if(flags["URBOLG_PBED"] != undefined) output("In an excited, horny flash, his smithy’s apron is off, and he’s bared all of himself to you in the light of his workshop. ");
	output("You catch yourself stealing glances at his package, knowing what sort of power something as simple as peanut-butter – a staple condiment where you come from – has on a Korgonne’s biology. You lick your [pc.lipsChaste], and wonder idly if you’re more looking forward to the cookies, or to... something else.");
	if(pbcookiesUsedOnKorgonne() == 0 && flags["ULA_SAVED"] != undefined) output("\n\nYou wonder to yourself if you could get away with smuggling some cookies back into the Korgonne hold on Uveto. What sort of havoc would you induce by introducing something so powerful into their ecology?");
	output("\n\n<i>“Hand ‘em over,”</i> he says impatiently, his robotic hand outstretched for the cookies in your baggie. <i>“I know I’m a sight to see, but just you wait ‘till I git myself one’a them in my mouth.”</i>");
	output("\n\nYou do as he asks, reaching into the bag to withdraw three cookies to give to him, keeping the other three for yourself. He waves you towards the other side of his workbench, where he has a pair of scrap chairs, cushioned by a leathery material that you don’t immediately recognize. They look like he made them himself. You sit in the furthest chair: it’s not the most comfortable of seats, but, it’s a chair. And it reclines!");
	output("\n\nUrbolg flops into his seat with familiar, graceless flair, kicking his legs up as it absorbs his weight. <i>“Bottoms up to ye, " + pc.mf("lad","lass") + ",”</i> he says, toasting you across the gap between you with his first cookie. You respond in kind with a smile, but you let him bite into his cookie first.");

	output("\n\nHe does so immediately: he opens his mouth wide and shucks the whole thing in, chewing through the entire cookie in a single bite. You wait for the reactions: first, Urbolg sighs in delight at the taste of the home-baked treat... and then, the show begins.");

	output("\n\nUrbolg spreads his legs slightly, and his sexual reaction is immediate. Originally, his overfull sheath bobbed against his heavy, bloated testicles under its own weight, resting snuggly in the valley between his balls – once the cookie’s flavor hits the right tastebuds, it fills and bloats at a shocking pace, going from stuffed, to stiff, to half-erect, to spurting, in the space of a few exaggerated bites and a few pumps of his heart.");
	output("\n\nUrbolg grunts through a clenched jaw and he wraps his biological hand around his shaft, stroking it until it’s at its full, concrete, complete hardness, standing at an intimidating twelve inches");
	//fucked Urbolg:
	if(flags["SEXED_URBOLG"] != undefined) output(" – it’s standing longer and thicker than you remember it being. Perhaps the cookie is giving his body a bit of extra oomph, to push it to its very limits");
	output(". Beneath it, his heavy, fuzzy balls pull up against his pelvis, bouncing and tightening at the sensations, already working to shoot his cum from his rocket and arc it through the air between you.");

	output("\n\n<i>“Yep,”</i> Urbolg says to nothing in particular as his first orgasm overtakes him. His back arches, and he consciously focuses on not crushing the other two cookies in his hand, while his cock bloats with his seed. His abs crunch as the first elongated, pearly streak shoots from him, audibly splurting from his body. His first shot of his Korgonne cum is so long that, despite having an arc that reaches over three feet off the ground, it touches down before the first string cuts off from his body.");
	output("\n\nHe has the decency to not point his dick in your direction, aiming his spasming cock away from you, while still giving you the full show that you had come to expect with giving him a cookie. He times his masturbating hand with his bites into the cookie: every bite, he jerks his rod five or six times, making sure that his white cum reaches as far as it can. He grins whenever some new splurt makes it the furthest; like he had just broken his high score or something.");
	output("\n\nAs soon as he swallows what’s remaining in his mouth, and he jerks out the last few bursts of jizz, he doesn’t hesitate to stuff his second-of-three cookies into his maw and start the cycle over again. He crunches his body forward and works his wrist furiously on his meat: he grips it by the knot and only jerks his hand and fingers by centimeters at a time, coaxing out his cum and taking advantage of his own leaky weakness to ensure that his orgasm is as messy as possible.");
	output("\n\nYou’re so engrossed in the sight of Urbolg and his showmanship, that you’ve forgotten to even bite into your own cookies. They sit, forgotten, in your baggie, which rests on your lap; your eyes follow each streak of his white jizz as they first bubble from his enormous balls, then erupt from his canine cock and audibly hit the growing puddle of his cum with a wet ‘plap.’");
	output("\n\n<i>“Not feelin’ so hungry?”</i> Urbolg asks through a mouthful of cookie, panting in exertion. You shake your head slightly, shaking the daze from your eyes, as you turn your face to his. You ask him to repeat the question. <i>“I’m sayin’ you haven’ had any, urrrnghh,”</i> he grunts, riding out another intense, sloppy orgasm, his hand rubbing and jerking at his meat, <i>“any cookies. You gonna have yers, or didja just wanna watch an old Korgonne cum himself silly?”</i>");
	output("\n\nYou glance toward your cookies, and you lick your [pc.lipsChaste] once more. Watching the display has gotten you a bit hungry, you won’t deny it. But... are you hungry for <i>cookies</i>, exactly? Or, would you rather put yourself in the crossfire with an open mouth and sate yourself on Urbolg’s fountaining jizz?");
	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Cookies",urbyCookiePCSnacks);
	addButton(1,"Jizz",drinkYummyUrbolgCum);
}

//[=Cookies=]
public function urbyCookiePCSnacks():void
{
	clearOutput();
	showUrbolg(true);
	author("B!");
	// Continue here if the PC is not a Korgonne
	if(pc.race() != "korgonne") 
	{
		output("Urbolg’s chiding snaps you out of your reverie and reminds you that, yes, you have cookies, and yes, you’re hungry. You thank him for goading you out of your daze as you reach for the cookies in the bag.");
		output("\n\n<i>“Right,”</i> he hums in disinterest through the cookie in his mouth. His abdominals crunch as his body strains to keep up with its own output: his testicles visibly contract, then relax, over and over, and every shaking, quivering clench is met by another beady stream of cum arcing through the air between you, exactly as impressive as the one before it.");
		output("\n\nYou study the floor in front of Urbolg as you eat your own cookie. His cum diffuses onto the steel floor shortly after it splats down, making the streaks not-as-white as you’d expect. His longest shot had reached a good five or six feet from him, and every time his most recent wave of jizz calms down, it adds to the veritable runway of Korgonne seed, widening the streak. You won’t shy away from saying that Urbolg has some pretty big balls, but it’s insane that some peanut butter could kick his reproductive and refractory periods into such an overdrive.");
		output("\n\nHis throat works down his cookie, and he refreshes his maw with his third and final pastry. <i>“Damn, but don’t that taste good,”</i> he hums absently as the cycle starts for the third time: his body, particularly everything between his abdominals and thighs, clench in effort and pleasure as he spontaneously orgasms from the taste of the peanut butter hitting his tongue. And when his teeth chew down, his blue rocket pulses with effort and bloats with cum before breaking his five-or-six-foot record with a fresh shot.");
		output("\n\nYou swallow your own cookie and reach for the second while Urbolg jerks himself casually, yet quickly, through orgasm after orgasm. You ask aloud if there’s a limit to how much a Korgonne can cum from peanut butter; Urbolg’s eaten two-and-a-half and he’s jizzed enough to fill a small bucket – or impregnate maybe dozens of women.");
		output("\n\n<i>“Dunno,”</i> he answers through gritted teeth and a mouthful of pastry. In his current predicament, he’s not exactly above table manners. <i>“Never really, hnnng... never tested meself. I’d just eat whatever’s there and be done with it.”</i>");
		output("\n\nOn that note, he chews once, his tongue flicking out from between his chops, and he arcs another elongated shot through his workstation. He reclines into his chair as he goes, and he takes a deep sigh through his nose as he watches his ‘product’ coat the floor in front of him. <i>“Korgonne, though,”</i> he says wearily, <i>“normally, we ain’t so... libidinous. I think that’s the word.”</i> His jerking hand dips a little lower and wraps itself around his bulging knot, squirting out a bit more juice. <i>“Maybe’s the stuff unleashes some repressed sexual energy or summin’. Whatever. Makes me cum buckets, an’ that’s all I need to know.”</i>");
		output("\n\nYou agree; it’s a matter for someone else. You kick back in your own chair and swallow your second cookie while you watch Urbolg take his time; as you put the third cookie in your mouth, you can’t help but realize that you’ve been kinda thirsty ever since Urbolg started his show. You’re sure it’s the dry pastry’s fault. Surely.");
		output("\n\nUrbolg’s display finally winds to a close: he savors what remains in his mouth for as long as he can, eking out his pleasure every time his tongue swishes the cookie mush around in his mouth, before finally swallowing. His bright-blue cock gives one final pulse, its veins thumping angrily on the surface of its skin, and then, his final blast of canine cum squirts from his tip and adds to the lake of semen beneath him. He’s exhausted and spent for his finale, but it’s nonetheless impressive considering all he’s done is eat a cookie.");
		output("\n\nHe exaggerates one last sigh as he sinks into his chair. He kicks out his legs and rests his arms on his stomach, keeping his hands away from his surely-by-now sensitive dick; he’s content to merely lounge and watch his own erection slowly flag and recede back into his sheathe.");
		output("\n\n<i>“Feckin’ thing’s gonna be an arse to wipe up,”</i> he muses; he doesn’t sound too terribly distraught. <i>“Moppin’ up yer own jizz after a hearty peanut butter snack or two gits old real fast, lemme tell you, but I’ll be fekked sideways if it ain’t worth the time.”</i>");
		output("\n\nYou swallow the remainder of your final cookie and take a similar posture as him. You ask if he’d be in the mood for some more some other time.");
		//SUCH A COP-OUT! Just do a repeat intro >.>
		output("\n\n<i>“Yeh, of course,”</i> he replies. He stretches his body, unwinding the kinks and knots his muscles had built up from staying tense for so long. <i>“An’ next time we can pretend ye still just wanna gimme a cookie, and that yer not interested in watching a man blow his load all over the place.”</i>");
		output("\n\nAt that, he falls silent and relaxes into his chair – but only for a moment. After a blissful few seconds of cooling down, he turns his chair towards you and stands. His cock has receded quite a bit: only the head and maybe half an inch of his shaft are still exposed to the air.");
		output("\n\n<i>“Better git to mopping this up before it dries and stains,”</i> he grunts as he reaches for his apron.");
		output("\n\nYou stand and excuse yourself. You wouldn’t want to get in the way of Urbolg cleaning up his own mess.");
		processTime(20);
		pc.changeLust(10);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// Continue here if the PC is a Korgonne
	else
	{
		output("Urbolg’s put on a pretty impressive display, no doubt... but, you wonder as you eye your cookies, still in their baggie on his workbench, if you can’t do better. You reach for the bag and withdraw a cookie; you run it across your nostrils and take a whiff. It was just a quick sniff, not a deep lungful - but your [pc.crotch] responds immediately, rousing and stirring, putting you in the mood in a hurry. It wouldn’t take much teasing to get you full-blown horny, and that was only a sniff!");
		output("\n\nUrbolg watches you as you flirt with your food, readying yourself to take a bite and join him in his ecstasy. <i>“Go ahead, " + pc.mf("lad","lass") + ", it ain’t gonna bite ya back,”</i> he encourages, waiting for you to take the plunge before he goes any further, though his bright-blue cock continues to beat and pulse with his adrenaline-fueled heartbeats.");
		output("\n\nYou don’t make him wait any further, and you bite in, letting the flaky peanut-butter pasty coat your [pc.tongue].");
		output("\n\nJust like what had happened with Urbolg, your bodily reaction is intense and sudden: your [pc.belly] crunches under sudden pangs of pleasure coursing through your body, originating at your mouth and bee-lining straight to your crotch. Y");
		if(pc.hasCock()) 
		{
			output("our [pc.cock], at first moderately aroused from Urbolg’s display, launches to its full " + num2Text(Math.floor(pc.cocks[0].cLength())) + "-inch");
			if(pc.cockTotal() > 1)
			{
				if(pc.cockTotal() > 2) output(", followed by [pc.eachCock] after it");
				else output(", followed by your other one");
			}
			output(". At first, it’s moderately uncomfortable: it feels like your ");
			if(pc.cockTotal() == 1) output("dick is");
			else output("dicks are");
			output(" too tight for ");
			if(pc.cockTotal() == 1) output("itself");
			else output("themselves");
			output(", with your cock flesh stretching to accommodate so much blood so suddenly");
		}
		if(pc.isHerm()) output(". And, on top of that, y");
		if(pc.hasVagina()) 
		{
			output("our [pc.vagina], already slick from the display, suddenly gushes itself soaked: at first, you were aroused and in the mood, but in a flash, your [pc.clit] is engorged and your pussy-lips are all puffed and thick, ready for the thickest, most phallic thing in the room to fuck it. It takes no small amount of willpower to jump from your chair and pop a squat on Urbolg’s lap. Not that you have the time to formulate any plan of action");
		}
		output(": like Urbolg before you, the arousal is eclipsed very suddenly by one <i>hell</i> of an orgasm.");

		output("\n\nYou clench onto the armrests of Urbolg’s chair, your [pc.legs] quivering and shaking as ");
		if(pc.hasCock()) output("rope after rope of jizz");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("jets of ladyspunk");
		output(" eject from your body at wild, intense rates and speeds. Your vision crosses, and after a moment, your lungs start to burn because you had forgotten to breathe.");

		output("\n\nUrbolg laughs well-meaningly at your reaction. <i>“You’ll get used to it,”</i> he says as he bites into his cookie, and he joins you in rapt, continuous orgasm. <i>“But, urrrnghh, don’t rush it. I wish I were still as fresh to it as you.”</i>");

		output("\n\nYour heart is hammering in your ears, and y");
		if(pc.hasCock()) output("our [pc.cock], as hard as you’ve ever seen or felt it, shoots your [pc.cum] so far forward that it splashes against the wheels of Urbolg’s chair. You barely have the cognizance to try and move a bit to the side, so you can cross your stream with his");
		if(pc.isHerm()) output(". Likewise, y");
		if(pc.hasVagina()) output("our [pc.vagina] clenches and spasms on nothing, again and again; your [pc.girlcum] builds up on your seat, soaking up to your [pc.ass] and down your [pc.thighs], before dribbling off the side and splashing to the floor ineffectually");
		output(". You gasp in pleasure, which causes you to bite down, and you start the whole sequence over again.");

		output("\n\n<i>“Fuck,”</i> Urbolg says crassly, his eyes on your quivering form. His own jerking on his rod and his own streaming jizz doesn’t stop for anything the whole time, but it’s obvious to you both where his attention is. <i>“It’s different watching another Korgonne do it. Feels like I’m back at one’a them rutting rooms in the hold.”</i>");

		output("\n\nDrool drips from your mouth, taking bits of cookie with it, as your loins clench and spasm uncontrollably, spilling your juices every which way. Spittle builds up in your mouth, and you instinctually swallow, taking the bit of cookie still in your mouth with it, and the patterns start over: y");
		if(pc.hasCock()) output("our rod bloats with another fresh few loads of hot cum to spray all over the floor");
		if(pc.isHerm()) output(", and y");
		if(pc.hasVagina()) output("our pussy clenches and pulls at nothing, showering your seat, and then the floor, with more of your juice");
		output(".");

		output("\n\nUrbolg swallows what’s left of his cookie, then reaches for his third and final pastry, but waits patiently for you to calm down from the last aftershocks of your own. It takes you some time: your body still fidgets in muscles and joints even after there’s no more cookie on your tongue, and your genitals push out more liquids time and again, adding to your mess. It takes you a few minutes to calm down.");

		output("\n\n<i>“Last one?”</i> he asks, holding up his own cookie. You’re panting from the exertion, but, yes – you have one more, and you likewise lift it to show him.");

		output("\n\nHe grunts, then kicks off the floor, bringing himself towards you. He swivels on his chair so that his erect, throbbing, <i>angry</i> cock is pointing in your direction, his knot bulging and his cum dribbling from his tip.");

		output("\n\n<i>“Left yer legs an’ put yer feet on my armrests,”</i> he instructs, and he follows his own instruction as he places his paws on your own chair. You do as he commands, and you’re taint-to-taint: your genitals are a scant few inches from each other. <i>“Let’s make the last one real messy, " + pc.mf("lad","lass") + ", whaddya say?”</i>");
		output("\n\nYou’re way too horny to argue: you lift your cookie, toasting him, and he responds in kind. When your words are done, you place the whole cookie into your mouth and bite down.");
		output("\n\nYour reaction comes first: like before, the pleasure starts at your tongue, then shoots straight to your [pc.crotch], before spreading to the rest of your body. You can hardly believe that some cookies are capable of making you cum so much");
		if(pc.cumQ() < 1000) output(", and that it’d make you cum so much more than you thought you were capable of");
		output("!");

		output("\n\nBut, you and Urbolg are seeing the effects in real-time: y");
		if(pc.hasCock()) output("our [pc.cock] inflates with your seed once again, and it streams from you unabated and uncontrolled, directly onto Urbolg’s stomach and chest. You barely have the wits to aim it anywhere, and it never goes higher than his neck, but your [pc.cum] gets all over him: from his burly, fluffy chest, to his stomach, and all over his jerking hands and writhing cock");
		if(pc.isHerm()) output(". Adding to the mess, y");
		if(pc.hasVagina()) output("our [pc.vagina], given a target (and an object of inspiration), squirts its lube through the air, arcing the distance between your body and Urbolg’s; your juices coat his stomach and his hands, which in turn coat his cock as he masturbates it. You catch a few glances at his face, and his eyes are rather determinedly on your crotch: it would only take a word and you know he’d thrust forward without hesitation, to give all the cum that he’s about to shoot a warm home – but you say nothing. You’re barely sensate enough to form words, and besides... being covered in each other’s cum is hotter");
		output(".");

		output("\n\nUrbolg’s reaction, especially now that he’s covered with your fluids, come shortly after: with a grunt and a chew, his rod bloats, and you’re given a birds-eye view of his urethra as it expands, ushering his jizz forward. Reciprocating you, his cum arcs through the space between you, and it lands squarely on your [pc.belly], arcing as high as your neck");
		if(pc.biggestTitSize() >= 3) output(". More than a bit of it lands in your cleavage; with a free, shaking hand, you press your boobs together, drawing his cum deeper into the valley of your chest and getting your boobs nice, warm, and slick");
		output(".");
		output("\n\nYou two remain like that for as long as you have cookies in your mouths: every bite is punctuated by two more explosive orgasms, heading in different directions, splashing and soaking onto Urbolg’s fur and onto your [pc.skinFurScales]. It’s difficult to keep track of anything: your senses are so overloaded that sometimes, it’s difficult to tell who’s cum is going where.");
		output("\n\nYou both swallow, and you’re both treated to one final show: you recline into your seat as Urbolg’s slick, sticky jizz pools in the crunch of your abs and it drips off the side of your body. After he blows his last few shots, he does the same, taking a similar posture as you.");
		output("\n\n<i>“Damn,”</i> he sighs, his hand still on his cock and giving it a few more strokes for good measure. You agree wholeheartedly, though you refrain from touching yourself: everything feels so sensitive that you might just be on a hair-trigger for another round or two. Hell, if wouldn’t be hard to bake some more; your ship isn’t far from here, after all.");
		output("\n\n<i>“Can’t say I’ve met many other Korgonne outside’a the hold, and definitely never shared any peanut-anything with ‘em,”</i> he says as he shuffles his chair backward. <i>“Sure was a fucker of a trip, fer damn sure.”</i>");
		output("\n\nIt takes you some time to collect yourself (and for your eyes to un-cross). <i>“If ye ever make any other’a them cookies, " + pc.mf("lad","lass") + ", you bring ‘em here and we’ll, uh, have another go, if ye want.”</i> You hear the words, but the sentiment doesn’t settle into your head for at least a another little while.");
		output("\n\nIt must have been minutes before Urbolg starts patting you on the side, urging you to move. He’s wearing his smithy apron, hiding whether he still has an erection, though you can still see his fluffy, low-hanging balls, and they’re still pretty wet from some combined, accumulated juices. <i>“C’mon, now, I gotta mop up these floors an’ clean these chairs, a’fore they leave a kinda grease stain that I ain’t ever explaining away.”</i>");
		output("\n\nGroggily, you stand. You have some stains of your own that you should probably get to washing out, too.");
		// exit to map; decrease Lust to 0; add Cum Covered status
		processTime(30);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.applyCumSoaked();
		IncrementFlag("SEXED_URBOLG");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	if(!pc.hasStatusEffect("URBOLG_DISABLED_BY_COOKIES")) pc.createStatusEffect("URBOLG_DISABLED_BY_COOKIES");
	pc.setStatusMinutes("URBOLG_DISABLED_BY_COOKIES",25);
	IncrementFlag("URBOLG_PBED");
}

//[=Jizz=]
public function drinkYummyUrbolgCum():void
{
	clearOutput();
	showUrbolg(true);
	author("B!");
	output("You know what? You’re the one who introduced the peanut butter to Urbolg, and all you’re doing is sitting there while the dog-man is jizzing himself dry just a few feet away from you. You have an idea that’s positively slutty and degenerate, but hell, Urbolg is having the time of his life with just a few pastries; why not have a bit of fun yourself?");
	output("\n\nYour cookies remain on Urbolg’s worktable, forgotten. You slump out of the chair");
	if(pc.hasKnees()) output(", onto your knees");
	output(", and shuffle your way forward, toward Urbolg. Your movement surprises the older Korgonne; he knows exactly what it is you’re about to do, but he can scarcely believe you’re about to do it.");

	output("\n\nIt only takes him a moment to snap out of his surprise, though. <i>“Heh,”</i> he chuckles when you shimmy your way into your position between his spread legs. He does his best to crook his tongue away from the peanut butter cookie already in his mouth, to try to save and stem the flow until you’re in place. <i>“But aren’t ye just a slut at heart, " + pc.mf("lad","lass") + ". You’d give some of the thirstiest whores in the hold a run.”</i>");
	output("\n\nYou grin wryly in response, aware of how you look (and how you’re <i>about</i> to look). Urbolg doesn’t give you much time to prepare or to make yourself comfy: as soon as your mouth is open, he realigns the tip of his bulging blue cock in between your [pc.lips] and chews again.");
	output("\n\nHis cum lands squarely in your mouth, dousing your tongue and pinching your soft palette a bit with the force of his jet. He’s so copious and so forceful that already it backwashes a bit, and you drool a strand of his cum from the corner of your lips; you fix yourself and lean forward, sinking your mouth halfway down his burgeoning shaft, and you audibly gulp and swallow the first load – the first of many.");
	output("\n\nUrbolg grunts in pleasure as your lips seal around his flesh and your [pc.tongue] laps and presses against the underside of his shaft. <i>“Work the knot,”</i> he instructs you, and you do: you reach up with one hand and massage his inflated knot, and he moans in delight at the sensation. The stream of cum in your mouth reinvigorates with each press and prod your digits make on him. <i>“The nuts too.”</i> With your other hand, you massage his quaking balls, easing them as they tense against his body and force out another thick wad into your mouth.");
	output("\n\nThere’s a disparity between what’s going into Urbolg’s body and what’s coming out: he chews into his cookie, finishing it off, and in exchange for the one mouthful of pastry, you get three full gulps of his creamy cum down your throat. Your submissive posture and working hands and mouth contribute to his pleasure and his output, but even if you had chosen to remain in your seat, it’s incredible that the Korgonne isn’t cumming dust, or that he isn’t severely dehydrated.");
	output("\n\n<i>“Ye know,”</i> he says casually as he reaches for his third and final cookie. He pauses for effect, watching you as your motions become automatic: without the cookie in his mouth, you’re simply blowing him. <i>“There ain’t a lot of people that’re interested in feeding an old dog like me some cookies just so they can get a good bellyful of his cum. If all ye were interested in was sucking down some Korgonne jizz, I could always slap one’a my collars on ye. Make it better for ye. Give us both something we want.”</i>");
	output("\n\nYour eyes close; there’s something awfully zen about blowing someone. Your mind wanders to his offer and you consider it; right this red-hot moment, it doesn’t sound so awful to you.");
	output("\n\nWith your eyes closed, you don’t see Urbolg place the last pastry in his mouth, and you don’t brace for the flood of Korgonne jizz suddenly pounding you in the mouth. You struggle momentarily, swishing the hot juice in your mouth with your tongue, your cheeks bloating, until you remember to swallow. Compared to how much he’s putting out, it’s a negligible effort.");
	output("\n\nCum slips from the union of your lips and his cock, dribbling down your chin and dripping onto your [pc.chest]. You grunt and moan in combined effort and pleasure as you try and keep up with him: with every swallow, your [pc.belly] gets a little fuller and a little warmer. You certainly wouldn’t have gotten this kind of meal from some measly cookies!");
	output("\n\nSeeing your effort to stay paced with him, Urbolg pools the remainder of his cookie in his cheek, keeping it away from his tongue. The onslaught of semen calms down enough for you to catch up; you struggle to chug his load, and you feel like such a tramp doing it, but hell, if it doesn’t make you ");
	if(pc.hasCock()) output("hard as diamonds");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("wet as a puddle");
	output(".");
	output("\n\n<i>“Thanks for the cookies,”</i> Urbolg says suddenly. You glance up his fluffy, furry body, towards his face, and you see one of his cheeks bulging with what remains of the last cookie. <i>“Now, say ‘you’re welcome.’”</i>");
	output("\n\n<i>“You’re welco–”</i> you try to say, but Urbolg bites into the remainder of his cookie, and the flow restarts: caught unawares, his jizz blasts onto your tongue and pools in your cheeks and across your gums. With nowhere to go, it splashes back across his crotch.");
	output("\n\n<i>“Keep trying,”</i> he says. It’s probably just a hot idea, at least to him, to see you visibly and audibly struggle with so much cum.");
	output("\n\n<i>“You’re wel – grk!”</i> you gurgle, his white streams washing back across your hands, which haven’t stopped working his genitals the whole time. <i>“You’re welc–”</i> you sputter as one well-placed shot reflexively makes you swallow. <i>“You’re welco–”</i> you say, when one particularly strong wave causes his cock to wrench from your control, and his cock’s head aims squarely for your right cheek, followed by it drawing a long, white line up to your forehead.");
	output("\n\nUrbolg swallows the remainder of his cookie, signalling to you that you’re about to take the last couple shots of his cum. You forgo the games: you clamp your lips, now soaking and dripping with his spooge, as far down as you can: they wetly press against his knot and massage against his bulging flesh while his vibrating dick shoots his final loads directly down your throat. You moan in slutty delight as each stream warms your throat and pools in your stomach.");
	output("\n\n<i>“Good to know your momma raised you with some manners,”</i> Urbolg snickers as his dick lurches one final time in your maw, depositing the last of his load. You remain still for a time, resting in between his legs with his thick dick lodged knot-deep into your face, wallowing in the position you’ve put yourself in.");
	output("\n\nYou lick and suckle at his cock as it recedes into his sheath. You debate with yourself if you want another round or three – your cookies are still on Urbolg’s worktable, after all.");
	output("\n\n<i>“Tha’s enough,”</i> Urbolg says, tapping at your skull to get you to disengage. Reluctantly, you do so; you give his fleshy sheath a kiss before pulling away, your [pc.tongue] licking and cleaning your [pc.lips] without thought.");
	output("\n\n<i>“Much as I could eat yer share a’ the cookies, and much as I’m sure ye’d let me, I gotta say, that’s enough for now. Ain’t much to be done when yer sitting around all day eating pastries and getting your dick sucked.”</i>");
	output("\n\nYou shuffle away from him, allowing him to stand. When he does, he gives a big stretch, working out all the tension in his limbs and his torso that had built up with his prolonged orgasms. <i>“That said, ye come straight back to me when yer fixin’ for another load or two dozen,”</i> he laughs as he reaches for his smithy apron. <i>“Nobody’s ever gonna say no to blowing a load and I’m sure as shit not gonna say no to a treat and a show.”</i>");
	output("\n\nIt takes you a moment longer to pull yourself to your [pc.feet], dazed and high of the sexual energy Urbolg had given off from some cookies. You’re positively dripping with his load – your ship is nearby, if you wanted to take a shower. Or, of course, you still have your cookies, if, like Urbolg had offered, you’d rather add to your mess....");
	processTime(25);
	pc.loadInMouth(chars["URBOLG"]);
	pc.loadInMouth(chars["URBOLG"]);
	pc.loadInMouth(chars["URBOLG"]);
	pc.changeLust(25);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("URBOLG_PBED");
	IncrementFlag("SEXED_URBOLG");
}

//[SuckCock]
//Tooltip: Give the half-pint half-mechanical mechanic some oral service.
public function giveUrbolgBlowies():void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	if(!pc.isBimbo()) 
	{
		output("<i>“Wanna teach me the finer points of paying oral respect to my elders,");
		if(flags["URBOLG_DOGGYED"] >= 3 && flags["URBOLG_DOGGYED"] != undefined) output(" daddy");
		else output(" Urbolg");
		output("?”</i> you say, grinning.");
		if(pc.tailCount > 0) output(" while your tail wags.");
	}
	else 
	{
		output("<i>“Umm,”</i> you begin, looking down at Urbolg’s apron innocently. Your tenuous grasp on words slips away from you when you think about what lies under it. <i>“Can I suck your cock,");
		if(flags["URBOLG_DOGGYED"] >= 3 && flags["URBOLG_DOGGYED"] != undefined) output(" daddy");
		else output(" Urbolg");
		output("?”</i>");
	}
	output("\n\n<i>“Aye, a’reckon I can spare some time for ye,”</i> Urbolg nods, dropping a wrench onto a nearby crate. <i>“Not in my workspace, mind. Be better to teach you with some space, and ‘sides,”</i> he says, eyeing you meaningfully, <i>“yer gonna need somewhere comfortable to lay.”</i>");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Let’s go play in my ship then,”</i> you say, clapping your hands together and smiling as you head towards your ship. <i>“I can’t wait");
	else output("Oh, not keen to take me over a crate?”</i> you say over your shoulder, already [pc.walking] towards your ship. <i>“I thought worse of you");
	output("!”</i>");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("Hnh,”</i> Urbolg grunts, walking up the ramp behind you. <i>“Nice view");
	else output("Aye, no doubt,”</i> he says, grinning up at you from down the ramp. <i>“But the workplace is fer </i>work<i>, [pc.girlBoy]. Can’t have ye dirtying it up");
	output(".”</i>");

	output("\n\n<i>“Good to know even pirates have their standards,”</i> you murmur, approaching your room.");
	if(!pc.isChestExposed() && !pc.isCrotchExposed()) output(" You have your clothes off by the time Urbolg joins you in the room");
	else output(" By the time Urbolg enters after you, you’re ready for him");
	output(". Turning and");
	if(pc.isTaur()) output(" seating your rear half");
	else output(" sitting");
	output(" on the edge of your bed, you smile at the stocky korgonne.");

	output("\n\n<i>“How do you want me?”</i> you ask.");
	output("\n\n<i>“Preferably with those lips of yours forming a vacuum seal around my dick,”</i> Urbolg grunts, lifting his apron over his head and tossing it to the floor. His light blue cock is already making a tantalizing appearance from his sheath, pushing upwards gradually. You’ll have to be quick if you want to coax it out for yourself.");
	output("\n\nLuckily, Urbolg takes a couple of steps closer and you take the matter into your own hands. Kissing the tip, you sink your lips down to his overtaxed sheath, already beginning to bulge as his knot inflates. Feeling him growing, throbbing and hardening in your mouth,");
	if(pc.hasCock()) output(" you can’t help but get erect yourself");
	else output(" your [pc.vagOrAss] squeezes tight, as if to just affirm in your mind that he could fuck you there too if he wanted");
	output(". Worshipping a man has never felt so satisfying.");
	output("\n\n<i>“Hnn... can’t tell whether I like ye more with or without the ability t’speak,”</i> Urbolg sighs, looking down at you. <i>“Feels nice having my cock inside yer mouth either way. Now take the rest of it.”</i>");

	output("\n\nWith a commanding hand");
	if(pc.hasHair()) output(" gripping your [pc.hairNoun]");
	else output(" on the back of your head");
	output(", Urbolg slowly pushes you down his oversized cock. The taper means the first few inches are a cinch, but the next several not so much. It takes you a couple of tries and some wet, dribbling jaw-stretching, but you get it eventually. Your reward is the feeling of smooth, gradual friction being applied to your lips as Urbolg holds you in place and slides his entire cock up into your mouth and down your throat.");
	output("\n\n<i>“Fek... yer talented alright, [pc.boyGirl],”</i> Urbolg grunts, your eyes watering a little as you approach his knot. <i>“Give ye that much.”</i>");
	output("\n\nWhen at last your lips touch his bright blue, throbbing knot, you get a");
	if(flags["SEXED_URBOLG"] != undefined) output(" nice, thick rope of cum right down your throat. The more you bob against his knot, the more of it pumps into your stomach. Maybe you can empty him before he even cums for real if you try hard enough");
	else output(" sudden shock as a rope of cum shoots down your throat. You can tell he’s not cumming what with the glaring lack of reaction, but there’s milky jizz trailing down to your stomach all the same. Urbolg’s full of surprises");
	output(". Softly laying your hands on his thighs, you close your eyes and let him fuck your face at his own pace.");

	output("\n\nAs it turns out, his own pace is pretty rough");
	if(flags["URBOLG_DOGGYED"] >= 3 && flags["URBOLG_DOGGYED"] != undefined) output(", not that you’re surprised with your prior experience");
	output(". Your throat is getting a heavy dose of cream filling while he jerks you up and down, lurid wet noises emanating from between your lips. Every thrust gets you another faceful of spunk, his warm knot pressing against your mouth with need. In mere minutes, Urbolg has you looking like a mess. Your face is red, your eyes are watering, and drool runs freely from the corners of your mouth. You get a brief respite when he pulls out and nods at the bed.");
	output("\n\n<i>“Lie down on yer back,”</i> Urbolg grunts, swollen dick in one hand and patting your face with the other. <i>“Time for a change of scenery.”</i>");
	output("\n\n<i>“Uh huh,”</i> you pant, dazed and not really thinking anything of his instructions.");
	output("\n\nIt’s only when you’re lying on your back with");
	if(pc.isTaur()) output(" your [pc.legs] curled up and");
	output(" a korgonne poised to sit on your face that you realize he was speaking for himself. Of course - in his new position he’ll be able to see every little reaction your body goes through while he’s balls-deep in your mouth.");

	output("\n\nUrbolg doesn’t wait around, grunting as he angles himself for penetration and slides right in. Your vision is almost wholly occupied by his fuzzy butt, but his nuts sitting on your nose are a nice distraction. They’re the size of clenched fists and already pumping more seed down your throat.");
	output("\n\n<i>“Glk! Gllrk, goghk,”</i> you choke around his cock, each thrust to the hilt punctuated by your gagging exclamation. <i>“Urllgh!”</i>");
	output("\n\n<i>“Sexiest thing you’ve said t’me,”</i> Urbolg grunts, then leans forward and begins pounding your face hard enough to sting.");
	output("\n\nHands on his legs, you just lie there with your eyes bulging and");
	if(pc.hasCock()) output(" cock hard");
	else 
	{
		if(pc.hasVagina()) output(" pussy");
		else output(" asshole");
		output(" twitching");
	}
	output(" while he fucks you with reckless abandon, driving your head into the pillows with the force of it. You can feel him getting closer, both with your throat and your nostrils. His oversized balls are withdrawing, getting tighter in his sack and dragging over your nose as he approaches his peak.");
	output("\n\n<i>“Nnnnngh,”</i> Urbolg groans, finally cumming between your lips. His movement halted, you give the underside of his fat prick a cursory lick and get a drip of his seed for your efforts. Owing to his unique biology, he’s already completely emptied himself into your stomach.");
	var cummed:Boolean = false;
	if(pc.isBimbo()) 
	{
		output("\n\nAt the last taste of his rich seed, you cum");
		if(pc.hasCock()) output(" all over yourself, [pc.cockBiggest] fountaining upwards over your stomach while your hips jerk instinctively");
		else if(pc.hasVagina())
		{
			output(" hard");
			if(!pc.isTaur()) output(" down your [pc.thighs], hips rolling in pleasure");
			else output(", femcum rolling down your hindquarters");
		}
		else output(" in submission, your bimbo bitch instincts bringing you to a giggly peak");
		cummed = true;
	}
	else
	{
		if(flags["URBOLG_DOGGYED"] >= 3 && flags["URBOLG_DOGGYED"] != undefined) 
		{
			output("\n\nHaving serviced your daddy like the good little slut bitch you are, you feel a slight bit of guilt for cumming before the ecstasy washes it away as you cum your brains out all over the bed. Even Urbolg grunts in pleasure as your throat massages his half-hard cock while your");
			if(pc.isHerm()) 
			{
				output(" [pc.biggestCock] spurts all over your [pc.stomach], your [pc.pussy] sympathetically squeezing and");
				if(pc.isSquirter()) output(" squirting");
				else output(" dripping");
			}
			else if(pc.hasVagina())
			{
				output(" [pc.pussy] flexes hard, squeezing as if his cock were hilted there instead of in your face");
			}
			else if(pc.hasCock()) 
			{
				output(" [pc.biggestCock] unloads itself all over your [pc.stomach], spurting seed all");
				if(!pc.isTaur()) 
				{
					output(" up your torso");
					if(pc.biggestTitSize() >= 1) output(" and spattering the underside of your tits");
				}
				else output(" over the bed beneath you, staining your underside");
			}
			cummed = true;
		}
		else output("\n\nYou don’t reach orgasm yourself, but you’re pretty close to satisfied just bathing in the afterglow of the mechanic’s orgasm");
	}
	output(".");

	output("\n\n<i>“Hmmmmmnh,”</i> Urbolg sighs in satisfaction, still sitting on your face.");

	if(cummed) output(" <i>“Glad you had some fun too");
	else output(" <i>“Looks like you had a little bit of fun yourself");
	output(", kid.”</i>");

	output("\n\nHe reaches down to lightly squeeze your [pc.nipples], gently rolling them between his fingers and making you moan around his cock.");
	if(pc.biggestTitSize() < 1) output(" <i>“Doesn’t feel too bad,”</i> he chuckles at your earnest admission of pleasure. <i>“Have t’remember that one.”</i>");
	else if(pc.biggestTitSize() < 3) output(" <i>“These’re nice,”</i> he mutters in appreciation. <i>“Modest, but nice.”</i>");
	else if(pc.biggestTitSize() < 7) output(" <i>“Beautiful big tits for such a polite young lass,”</i> he says, getting a nice squeeze of your [pc.breasts] in as his balls lay across your face. <i>“Mebbe I should fuck these next time.”</i>");
	else if(pc.biggestTitSize() < 24) output(" <i>“Bloody hell, these are a sight for sore eyes,”</i> he murmurs, grabbing your [pc.breasts] and squeezing. <i>“That’s one way to keep every eye in the room on ye, kid.”</i>");
	else output(" <i>“Fuck, kid, ye look like a sex toy with these udders of yers,”</i> Urbolg says, taking a couple of handfuls and squeezing. <i>“Guess that’s what yer into, ye little slut.”</i>");

	output("\n\nHe finally lifts himself from your face with a long, wet slurp as his cock exits your throat. You groan as you feel yourself tighten back up upon his exit, the passage still slick with sperm and saliva. A rope of spit intimately connects the two of you until it snaps, landing across your face. Urbolg grabs a towel and rubs himself off before tossing it to you, letting it land squarely across your face.");
	output("\n\n<i>“For yer face,”</i> he explains, pointing. <i>“Ye look like shit.”</i>");
	if(pc.isBimbo()) output("\n\n<i>“Hey, thanks!”</i> you say, appreciating the gift rather than the insult");
	else if(flags["URBOLG_DOGGYED"] != undefined && flags["URBOLG_DOGGYED"] >= 3) output("\n\n<i>“Thank you daddy,”</i> you mumble, trying not to cough");
	else output("\n\n<i>“Thanks, I think,”</i> you mutter");
	output(".");

	output("\n\nYou wipe yourself off for a little bit as Urbolg leaves, going back to tending his machines. It doesn’t take you long to give up on the idea and take a shower instead");
	if(flags["URBOLG_DOGGYED"] != undefined && flags["URBOLG_DOGGYED"] >= 3) 
	{
		output(", but not before letting the towel rest across your face and inhaling. Your master’s scent...");
		output("\n\nYou spend close to half an hour in the ship’s shower,");
		if(pc.isHerm()) output(" desperately frigging your cunt with your fingers while you jack yourself off");
		else if(pc.hasCock()) output(" jacking yourself off roughly while you groan and imagine Urbolg dominating you");
		else if(pc.hasVagina()) output(" fingerfucking yourself desperately while you imagine it’s Urbolg’s thick, fat doggycock");
		output(". When you finally emerge from the shower, your skin is flushed");
		if(pc.hasFur()) output(" under your fur");
		else if(pc.hasScales()) output(" where it isn’t covered by scales");
		output(". You’re ready to begin your journey anew, or maybe to pay another visit to the manly mechanic just outside");
	}
	else
	{
		output(".");
		output("\n\nYou step out five minutes later, refreshed and ready to begin your journey anew. Or ready to see Urbolg again");
	}
	output(". You haven’t decided which yet.");
	processTime(30);
	pc.orgasm();
	pc.shower();
	pc.loadInMouth(chars["URBOLG"]);
	IncrementFlag("SEXED_URBOLG");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Collar]
public function urbyCollarFunByWsan():void
{
	clearOutput();
	showUrbolg();
	author("Wsan");
	if(flags["URBY_COLLAR_FUN"] == undefined) 
	{
		output("<i>“Oho, what’s this?”</i> you say, spotting something on a crate that looks like oddly mechanical jewelry, like a bracelet of some kind. You pick it up to inspect it.");
		output("\n\n<i>“Don’t touch that, ye fekkin’ moron,”</i> Urbolg says angrily, his fur bristling as he snatches it out of your hands. He sighs in exasperation. <i>“Blasted kids! Always touching before asking.”</i>");
		output("\n\n<i>“Alright old man, how about you educate me then?”</i> you challenge him, leaning back against the crate. <i>“What’s so special about your bracelet?”</i>");
		output("\n\n<i>“Arright,”</i> he starts, waving it in your face. <i>“First off, ye fekwit, it’s </i>not<i> a bracelet. It’s a collar. Goes around yer neck and stays there.”</i>");

		if(pc.isBimbo()) output("\n\nYou gasp, wide-eyed. <i>“Is it a </i>special<i> collar?”</i>");
		else output("\n\n<i>“I take it it’s not a regular collar, though, based on your reaction,”</i> you note.");

		output("\n\n<i>“Aye, it’s one of a kind, even,”</i> Urbolg says, putting it back down on the crate. <i>“It’s a slave collar, top o’ the line, registered t’yours truly. Put it on and it’ll have ye cumming yer fuckin’ brains out and calling me master before you can blink, and ye’ll never go back to normal - never </i>want<i> to go back to normal.”</i>");
		output("\n\n<i>“Oh.”</i>");
		output("\n\n<i>“Yeah, ‘oh’ is right,”</i> he agrees. <i>“Now don’t touch it again. It’s valuable.”</i>");
		
		processTime(5);
		clearMenu();
		if(pc.hasGenitals()) addButton(0,"Put It On",putOnUrbysCollar,undefined,"Put It On"," An intrusive thought muscles its way to the front of your mind. You should put it on and see if you can resist it, just for fun.");
		else addDisabledButton(0,"Put It On","Put It On","This won’t be much fun without any proper genitalia.");
		addButton(1,"Don’t",dontUseUrbysSlaveCollar);
	}
}

//tooltip: An intrusive thought muscles its way to the front of your mind. You should put it on and see if you can resist it, just for fun.
public function putOnUrbysCollar():void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	IncrementFlag("URBY_COLLAR_FUN");
	output("You wait until the fiery korgonne isn’t looking and grab it from the crate. The sudden movement alerts him to what you’re doing, but it’s too late - you’re already snapping it around your neck with a big grin.");
	output("\n\nThe moment you do, everything <i>changes</i>. Just a subtle shift in perception, like your head spun 360 degrees. Everything’s all right, but not... <i>right</i>. You hold out your hands and look at them for a moment, slightly dazed and disoriented until you hear a click of the tongue and a familiar voice.");
	output("\n\n<i>“Ah, ye fekkin’ moron.”</i>");
	output("\n\nYou whip your head around to look for the source of it and almost fall over, dizziness sending you staggering into a stack of metal crates. You slump to the floor, still gazing intently at the owner of the voice. So <i>that’s</i> what it was! For a moment there the world was drab and depressing and wrong, but that’s all better now. Your master is here! Wait... no, he’s not your master <i>yet</i>. Where are these thoughts coming from?");
	output("\n\n<i>“Aye, can’t imagine yer having too much of a good time trying to fight against it,”</i> Urbolg sighs, crouching down in front of you.");
	output("\n\nYou open your mouth to speak but all that comes out is a lusty, desirous moan. Even so, you don’t panic - there’ll be all the time in the world to tell your master about whatever’s troubling your little head soon enough. His lips move again and you find yourself leaning forward automatically,");
	if(pc.hasLongEars()) output(" cocking your [pc.ears] and");
	output(" hanging on his every word.");
	output("\n\n<i>“Since ye ‘pparently can’t be fekked listening to me, I reckon a punishment’s in order,”</i> he says, rising back to his feet. <i>“Aye, bitch?”</i>");

	output("\n\nAt the word ‘punishment’, a strange buzz emanates through your body starting from the collar and ending in your ");
	if(pc.hasCock()) output("[pc.biggestCock]");
	else output("[pc.vagOrAss]");
	output(". A punishment is meant to be bad, but...");
	if(pc.canineScore() >= 3)
	{
		if(pc.tailCount == 1) output(" your [pc.tail] is wagging furiously, and");
		else output(" your [pc.tails] are wagging furiously, and");
	}
	output(" you find yourself looking forward to it, thinking - <i>knowing</i> - that not only do you deserve it but that you can’t fucking wait for <i>master</i> to lay his hands on you.");

	output("\n\nThen he lifts his apron aside and all conscious thought is blown from your mind like a leaf in a gale. There, in all its magnificence, is your master’s fat fucking cock, already erect and just <i>waiting</i> for you to place your fucking lips on it and suck as hard as you can. You can already feel the thick, hot jizz sliding down your throat as you automatically swallow and draw nearer, pupils dilated.");

	output("\n\n<i>“Stay.”</i>");

	output("\n\nYou immediately halt, freezing in place with one arm half outstretched towards the glorious erect cock of your master.");
	output("\n\n<i>“Oh, so </i>now<i> ye wanna listen,”</i> he grumbles, taking his apron off completely and throwing it to the ground. He looks pretty pissed off but you can hardly help yourself - your [pc.tongue] lolls from your mouth, saliva dripping from the end of it. That bright blue dick and the heavy balls beneath them have never looked so <i>delicious</i>, like they could feed you for days if you just had the mere opportunity to suck on them... but you can’t. Master doesn’t want you to.");
	output("\n\n<i>“Only one thing t’do with bitches that don’t listen,”</i> he says, looking down at you. <i>“Stand up. Turn around. Hands out against the crates.”</i>");
	output("\n\nYou follow his orders with liquid grace, as if you’ve given up the control of your body to your master and his words are merely for show. You have yourself lined up and your [pc.ass] stuck out for him before he’s even finished talking, the perfect slut for ");
	//doggied3times: 
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(". You shiver when he touches you, pleasure radiating outwards from the point of contact.");
	if(!pc.isCrotchExposed()) output(" He tugs your [pc.crotchCovers] downwards, letting them slide down your [pc.thighs] to fall to the floor.");

	output("\n\nThe feeling when he slides himself into your exposed [pc.vagOrAss] is unlike anything you’ve ever experienced in your life. You don’t even have a warning before you’re crying out, a huge smile on your face as");
	if(pc.isHerm()) 
	{
		output(" cum fountains from your [pc.cocks] against the crates, your pussy");
		if(pc.isSquirter()) output(" spraying femcum all over Urbolg’s balls");
		else output(" squeezing and dripping all over Urbolg’s cock");
	}
	else if(!pc.hasVagina() && pc.hasCock()) output(" your dick jumps upwards, cum fountaining from the tip to splatter against the crates");
	else 
	{
		output(" your ");
		if(pc.hasVagina()) output("pussy");
		else output("ass");
		output(" clamps down on Urbolg’s dick, your stomach clenching so hard with the pleasure that you almost cramp");
	}
	output(".");
	if(pc.hasVagina()) pc.cuntChange(0,chars["URBOLG"].cockVolume(0));
	else pc.buttChange(chars["URBOLG"].cockVolume(0));

	output("\n\nIf only you had known... if you’d just known how good this could feel, how good giving up <i>everything</i> could feel, you would have thrown yourself at your master’s feet the moment you got off your ship, naked and ready. Even though - even though he’s <i>not really</i> your master...");
	output("\n\n<i>“How does that feel, bitch?”</i> Urbolg asks");
	if(pc.isTaur()) output(" from behind you");
	else output(", murmuring in your ear");
	output(" while he’s balls-deep in your fuckhole. <i>“Well, guess I can see it fer myself. Feel it, too.”</i>");

	output("\n\n<i>“It-it feels </i>amazing<i>,”</i> you choke, almost brought to tears of happiness by the pure satisfaction of it all. It’s a difficult thing in life to find one’s purpose, but you’ve finally discovered yours: to bounce on top of ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("’s cock forever, for the rest of your life, and be his sexy little cumdump. To let him blow his load inside you over and over and revel in the feeling");
	if(pc.hasVagina()) output(" of your womb swelling with his young");
	else output(" of his warm seed spreading throughout your guts");
	output(". <i>“I love you ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("!”</i>");

	output("\n\n<i>“Aye, see how ye think when I take it off, ye fekkin’ moron,”</i> he mutters, but you don’t catch all of the sentence and frankly it’s hard to concentrate so much on words right now. All of your attention is focused wholly on the way his big, warm doggydick is sinking inside you, plowing your ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output(" like you’re his two-chit whore. You shiver in pure joy when you feel his knot press against your [pc.ass], expelling hot cum from his tip whenever he pushes into you.");

	output("\n\nHe pounds you harder and harder, grunting and gripping you so hard your");
	if(pc.isTaur()) output(" haunches");
	else output(" hips");
	output(" are going to have marks left when he’s done. Your face is mushed up against the crates" + (pc.hasCock() ? ", your stomach pressed against the cum you left there earlier":"") + ", and it feels <i>so fucking good</i>. You want him to manhandle you more, to <i>dominate</i> you, to leave nothing in your head but thoughts of pleasing him.");
	output("\n\n<i>“Gonna cum, bitch,”</i> Urbolg grunts, slapping your ass and pumping you hard enough to drive you into the crates a little with every push. <i>“Whaddye say?”</i>");

	output("\n\n<i>“Fuck me ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("!”</i> you scream, your brain desperately fumbling to find the words to encourage him before just letting the collar tell you. <i>“Empty your balls into me! Pump me full of spunk!”</i>");

	output("\n\n<i>“S’about what I expected,”</i> he growls. <i>“Good [pc.girlBoy].”</i>");

	output("\n\nThe moment he says it you can feel him cumming, throbbing and pulsing in your ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output(". You groan in ecstasy, quivering in his rough, manly hands, the hands of the man you love, your master. It feels like nothing else in this universe to bring him to orgasm, the endorphins flooding your body giving you a natural high unrivalled by any drug. You can’t help but crack a big, dopey grin as Urbolg caresses you, his hand reaching up to your neck.");

	output("\n\nThe moment he takes the collar off you, the fun stops. You gasp and collapse to the metal floor, patting at your neck and panting. Your throat’s disconcertingly unadorned, no comforting metallic presence to keep your sense of self at bay. Your vision swims, the floor coming in and out of focus before you see a pair of fluffy feet make their appearance at the edge of perceivable space. A slight tug on the back of your head that you’re just a little too eager to obey, and suddenly your face is upturned and you’re looking into Urbolg’s chilly green eyes.");

	output("\n\n<i>“So,”</i> he grunts. <i>“Had yer fun?”</i>");

	output("\n\n<i>“Ah... uhhh...”</i> you mumble, grasping for words. It’s a little rough without the collar feeding you hot, horny phrases to say, but you get there eventually. <i>“That was... something.”</i>");

	output("\n\n<i>“Aye. Never been inclined to try it myself, but the manual makes specific mention of ‘complete lack of freedom’ and ‘loss of control’. Several times, actually. Now go have a think about how dangerous that might be to a space-farin’ adventurer like yerself, kid,”</i> Urbolg says, shaking his head. <i>“Though I gotta feeling ye’ll be back again.”</i>");

	output("\n\nEverything’s a little grayer and duller than before, or maybe that’s just the station’s ‘decor’. You slowly get back to your feet as Urbolg stands up and turns away. You can see his tail drooping unhappily. All the things you said to him make your cheeks burn a dull scarlet. Maybe putting on the collar wasn’t such a great idea... but as much as you’re loathe to admit it, you find yourself gazing longingly at it. You know the next time you put it on there’s probably going to be much more permanent repercussions, but that was genuinely a once-in-a-lifetime experience.");

	processTime(24);
	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(chars["URBOLG"],0);
	else pc.loadInAss(chars["URBOLG"]);
	IncrementFlag("SEXED_URBOLG");
	clearMenu();
	addButton(0,"Next",urbyCollarFunByWsanII);
}

public function urbyCollarFunByWsanII():void
{
	clearOutput();
	author("Wsan");
	showUrbolg();
	output("Having worn Urbolg’s slave collar, you find you’re more suggestible than you were. Pleasure pathways that weren’t there before have been forcibly emblazoned on your brain, your");
	if(pc.hasCock()) output(" [pc.cocks]");
	else output(" [pc.nipples]");
	output(" hardening and heart skipping a beat at the prospect of calling someone ‘master’. It’s become that much harder to resist coercion, sexy or otherwise. If you’re not careful, some pirate on this station will have you obediently living under their desk, eagerly sucking cock and gulping jizz for the rest of your life.");
	output("\n\n<b>You have lost a significant amount of willpower.</b>");
	processTime(3);
	pc.willpower(-10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//Rename button ‘Slave Collar’.
}

//[Don’t]
//tooltip: You weren’t planning on it, anyway.
public function dontUseUrbysSlaveCollar():void
{
	clearOutput();
	showUrbolg();
	author("Wsan");
	output("<i>“Alright, alright,”</i> you say, putting your hands up. <i>“I won’t touch your collar.”</i>");
	output("\n\n<i>“Least ye can listen, kid,”</i> Urbolg says, shaking his head. <i>“Somethin’ to be said fer it.”</i>");
	processTime(1);
	urbolgMenu();
}

//[Slave Collar]
//tooltip: It’s so tempting. You could have it all again if you just put it on... just once more should be fine.
public function urbyCollarBadEndByWsan():void
{
	clearOutput();
	showUrbolg();
	author("Wsan");
	output("You teeter on the brink. You know that, in all likelihood, the moment you put this on your life as you know it is over. You will never reach the probes your father laid out for you. You will never reach the top as the CEO of a trillion-dollar corporation. Standing behind the busy mechanic, he has no idea what you’re thinking. Your hands are shaking. You reach out for the collar and-");

	output("\n\nBy the time Urbolg even turns around you’re");
	if(!pc.isNude()) output(" completely naked and");
	output(" gasping in joy, sinking to your knees. Your");
	if(pc.hasCock()) 
	{
		output(" [pc.cockBiggest], still");
		if(pc.isErect()) output(" hard,");
		else if(pc.hasSheath(pc.biggestCockIndex())) output(" sheathed, half-hardens and");
		else output(" limp,");
		output(" spontaneously blows your entire load on the floor");
		if(pc.legCount > 1) output(" between your [pc.legs]");
	}
	else if(pc.hasVagina())
	{
		output(" [pc.pussies]");
		if(pc.totalVaginas() > 1) output(" simultaneously spasm, squeezing down in satisfied recognition of the fact they’re gonna get slammed full of spunk for the rest of your days");
		else 
		{
			output(" spasms, femcum");
			if(pc.isSquirter()) output(" spraying all over the station deck");
			else output(" dripping with a continuous flow");
			output(" while your fuckhole tightens up and squeezes");
		}
	}
	else output(" asshole squeezes and flexes, just waiting to be fucked");
	output(". You look up at Urbolg as sweat begins to bead on your forehead, your cheeks flushing while you pant lightly.");

	output("\n\n<i>“I’ve been such a bad [pc.boyGirl], ");

	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(",”</i> you moan, slowly rolling your hips. <i>“Won’t you punish me?”</i>");

	output("\n\n<i>“Aye,”</i> he says, expression grim. <i>“I’ll punish ye,");
	if(pc.canineScore() >= 3) output(" pup");
	else output(" kid");
	output(". Be doing you a favor.”</i>");

	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",urbyCollarBadEndByWsanII);
}

public function urbyCollarBadEndByWsanII():void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	output("You can’t breathe. He doesn’t have his hands on your head, you’re not being impeded in any other way, but you can’t breathe all the same. His big, fat, bulging cock is shoved so deeply down your throat that your eyes are watering, but you don’t pull back. You can’t pull back. You’d much rather be <i>here</i>, faithfully serving ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("your master");
	output(", choking on his dick. You can feel ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("’s thick cum shooting down your throat in ropes even now, its warmth sliding down into your tummy.");
	output("\n\n<i>“S’a good start, bitch, but don’t go passing out afore I’m even done,”</i> Urbolg sighs, leaning forward in his chair a little to");
	if(pc.hasHair() && pc.hairLength >= 3) output(" grab your hair and");
	output(" pull you back off his dick.");
	output("\n\nYou’re in his room, Urbolg having taken a break from work to break you in. Granted a momentary reprieve by your sexy master, you take a couple of grateful, halting breaths before coughing once or twice. When you’ve recovered, you look up at him and smile gratefully.");
	output("\n\n<i>“Sorry, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("... I got a little carried away when I felt that hot, sticky cum inside me...”</i> you trail off, shivering in lust as you eye his dick. <i>“Can I keep going?”</i>");

	output("\n\n<i>“Aye, just don’t pass out on me,”</i> he says, and you dive back onto his prick, engulfing it with your [pc.lips]. <i>“If I have to wake up someday with you curled around me and choked to unconsciousness on my cock I’ll be pissed.”</i>");
	output("\n\nYou try to obediently hum ‘yes ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("’ but it just comes out as garbled, slutty choking on his doggy dick.");
	output("\n\nAfter you’ve sucked out and swallowed down all of his cum Urbolg has you spread the cheeks of your [pc.ass] with your hands and sit in his lap, sliding down onto his cock. You moan in whorish ecstasy the whole way down, cumming the moment you come to a rest against his knot. It’s just so hard <i>not</i> to when you’re having sex with master. His cock is so <i>big</i> and <i>manly</i> that you can’t find it within you to put up any resistance. When he fucks his knot inside you during your orgasm that only drives you further onwards, crying out for ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(" as he begins to pound you from below, knot and all.");
	output("\n\n<i>“Oh, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("! Don’t stop! I love you so much!”</i> you moan, feeling your [pc.vagOrAss] stretch open every time his knot enters you. <i>“Your cock is so fucking good!”</i>");
	output("\n\nWhen he cums you gasp at the top of your lungs and moan, joyously shuddering in his lap while you squeeze down on his quivering cock.");
	output("\n\n<i>“Oh my god, you’re so good,”</i> you whisper, reaching back to caress his face. <i>“Thank you, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(".”</i>");

	processTime(20);
	pc.loadInMouth(chars["URBOLG"]);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",urbyCollarBadEndByWsanIII);
}

public function urbyCollarBadEndByWsanIII():void
{
	clearOutput();
	showUrbolg();
	author("Wsan");
	output("The next few days are full of lusty, vigorous sex wherein Urbolg has you indulge him any way he wants. You’re just happy to serve, and you cum your fucking brains out no matter how he fucks you anyway. Whether he’s fucking your face so hard it thuds against the headboard of the bed, bouncing you on his dick, or letting you suck him off under the table while he’s working, you cum impossibly hard every time. It’s his <i>cock</i> - it’s just too good, too delicious and fat and <i>suckable</i>. One look at it and you’re a puddle of goo to be manipulated by hand or word of your master, and he knows it.");
	output("\n\nThough it takes an incredible feat of willpower, you manage to hold yourself back around him so that he can do some proper work while you’re in his presence. He tried to keep you in his room during the day at first, but you’re just too attached to him. Rather than letting you wander about - not that you’d ever go very far, given that he’s right here - he puts you on a leash, leaving it attached to various surfaces as he works. For the sake of your master, you can delay your own gratification. You love him <i>so</i> much, after all.");
	output("\n\nYou’re sat behind a crate, arms crossed on top of it and head resting on top of them so you can gaze lovingly at your master when the first customer you’ve seen since shacking up with him arrives.");
	output("\n\n<i>“Oh, got yourself a slave, Urbolg?”</i> the pirate asks, grinning at him before giving you a wink. <i>“Hey, cutie.”</i>");
	output("\n\nYou turn away from him with an indignant huff. You only have <i>one</i> master, and you don’t really care about anyone else, not even if he’s a muscular half-ausar with a massive bulge in his pants. Urbolg chuckles.");
	output("\n\n<i>“Don’t mind [pc.himHer]. Jes’ gettin’ the bitch used to my regular workdays,”</i> he says to the pirate. <i>“Whatcha shopping for?”</i>");
	output("\n\nThey haggle for a little while, talking credits while you zone out and watch Urbolg, wishing the pirate would go away. The faster master’s done with his work, the sooner you can be laid out on the ground getting your ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output(" pounded full of hot doggyspunk like the little bitch you are. You’re still dopily fantasizing with a vacant look on your face when the deal wraps up and the pirate nods at you.");
	output("\n\n<i>“Looks like we bored [pc.himHer]. Those collars are really somethin’, huh?”</i> Shaking his head, he leaves with a wave to your master. <i>“Thanks for the shield belt, old man.”</i>");
	output("\n\n<i>“Aye,”</i> he says, then turns to you. <i>“S’pose I should give ye a reward for being a good bitch, then.”</i>");
	processTime(48*60+rand(1000));
	clearMenu();
	addButton(0,"Next",urbyCollarBadEndByWsanIV);
}
public function urbyCollarBadEndByWsanIV():void
{
	clearOutput();
	author("Wsan");
	showUrbolg();
	output("It’s like your dream’s come true. Lying on the deck while Urbolg grunts above you, his hands roughly grasping your [pc.hips], your back arches off the ground as you groan in ecstasy. You <i>writhe</i> in his grip, pressing your [pc.chest] into him with every mind-breaking thrust. The collar is more than generous with its rewards as long as you’re obedient, and you’ve never found a good reason to disobey. Why <i>would</i> you, when every fuck with ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("your master");
	output(" feels so good?");

	output("\n\n<i>“I’m cumming, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(",”</i> you moan, hips bucking weakly into his thrusts. <i>“Oh god, you’re so- guh! Good! Oohhh!”</i>");

	output("\n\n<i>“Good [pc.boyGirl],”</i> he grunts,");
	if(pc.hasCock()) 
	{
		output(" watching your [pc.biggestCock] shoot seed all up your [pc.stomach]");
		if(pc.biggestTitSize() >= 1) output(" and coat the underside of your breasts");
		else output(" and torso");
	}
	else output(" your [pc.vagOrAss] squeezing down on him with pleasure");
	output(". Your bliss is so blatantly evident, written all across your face in the giant ‘O’ of orgasm your lips make and the deep, lusty groans of joy coming from deep in your throat.");

	output("\n\nHe makes you cum three more times before he does himself, your legs wrapped firmly around his back, relishing the slight pain as your fuckhole stretches wide around his immense knot.");

	output("\n\n<i>“Ooo-o-oh god, yeah,”</i> you pant, staring up at him with nothing but devoted love in your eyes. <i>“Knot your slutty little bitch, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("...”</i>");

	output("\n\n<i>“");
	if(flags["URBOLG_DOGGYED"] >= 3) output("Daddy");
	else output("Master");
	output("’s got a lot more for you where that came from, bitch,”</i> he growls, reaching up to squeeze one of your [pc.nipples].");

	output("\n\nHe really does. You can scarcely believe your own luck but he’s apparently in the mood for an extended break, pulling out and flipping you onto your stomach. Before your face is pressed into the ground you catch a glimpse of his cock, still hard and dripping spunk, before you feel it in your asshole");
	if(!pc.hasVagina()) output(" again");
	output(".");

	output("\n\nYou scream out loud in pleasure, your slutty voice carrying far enough across the deck that even hidden amongst the crates as you are, someone else probably heard that. You can hear Urbolg sigh exasperatedly from above you.");
	output("\n\n<i>“How many times have I told ye t’be quiet? Now I’ve got to punish ye as a reminder.”</i>");
	output("\n\nYou bite your bottom lip in glee so hard it starts to bleed, feeling his thrusts get rougher and rougher until the sound of his waist smacking against your [pc.ass] is almost as loud as your scream was. The only sound escaping your mouth is a series of small, pathetically high-pitched gasps as the savage rhythm brings you effortlessly to orgasm. Your");
	if(pc.hasCock())
	{
		output(" cock");
		if(pc.totalCocks() > 1) output("s splurt");
		else output(" splurts");
		output(" jizz all over the deck, leaving a nice stain to remember this by.");
	}
	else output(" asshole squeezes down on him desperately, instinct quickly giving way to submission as your body just lets him keep fucking you.");
	output("\n\n<i>“That shut ye up, didn’t it?”</i> he grunts, a little smugness in his voice.");
	output("\n\nBy the time he’s finished with you and gone back to work, you’re slack-jawed with pleasure and leaking cum");
	if(pc.hasVagina()) output(" from every hole");
	else output(" from both ends");
	output(". It takes you the better part of ten minutes to rouse yourself back to action and then, even when you do, you can’t resist");
	if(pc.hasCock()) output(" roughly jacking off in a pool of cum, both his and yours");
	else 
	{
		output(" desperately finger-fucking your ");
		if(pc.hasVagina()) output("pussy");
		else output("asshole");
	}
	output(". Your hips buck wildly when you cum,");
	if(pc.hasCock())
	{
		output(" though barely anything comes out from your [pc.cockHeadBiggest] - ");
		if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
		else output("master");
		output(" fucked it all out of you earlier");
	}
	else output(" your abused fuckhole clenching on your fingers so hard it almost hurts to leave them in there");
	output(". Panting unsteadily, you retreat to Urbolg’s quarters to wash up before you present yourself to your master again.");
	processTime(30);
	pc.loadInAss(chars["URBOLG"]);
	pc.loadInMouth(chars["URBOLG"]);
	if(pc.hasVagina()) pc.loadInCunt(chars["URBOLG"],0);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",urbyCollarBadEndByWsanV);
}

public function urbyCollarBadEndByWsanV():void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	output("It’s been a learning experience, being Urbolg’s live-in slave bitch. You help him out with the simpler aspects of work sometimes, carrying his toolbox around and handing him things from it when he needs them. It’s not like you’re stupid, it’s just - it’s so <i>hard</i> to think about anything that isn’t bouncing on ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output("’s cock. Or sucking it. Or starting from the tip and planting sensual kisses on it all the way down to the bottom until you reach his balls, then suckling those too.");
	output("\n\nThere are so many ways you can bring your master happiness, so many ways you can utilize your body for him. Doing so is even its own reward, with the collar drowning you in pleasure every time you obey his whims or submit your holes to him. Not that you’d refuse even without the collar, of course, but having it on just feels so much nicer and more secure. This way you can be sure you’ll <i>never</i> want to think about anything else.");
	output("\n\nYou’d never imagined your journey coming to an end in such a manner, but as you greedily drink down Urbolg’s seed, your throat bobbing with every swallow, you know for certain this is far more of a satisfactory ending than being some boring CEO. This is where you were meant to be - on your knees, hands squeezing your master’s thighs while his pumping balls quake against your chin. Like a good little cumdump. If you’re lucky, ");
	if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
	else output("master");
	output(" might even fuck your ass afterwards or hand you off to take care of some pirates.");
	output("\n\nYou can’t imagine wanting anything more.");
	//GAME OVER
	badEnd();
}

public function urbyTaurFux():void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	//After first time, change button to ‘Taurfist’.
	output("<i>“");
	if(flags["URBY_TAUR_FUX"] == undefined)
	{
		output("Sure you can handle me, Urbolg?”</i> you ask, grinning. <i>“");
		if(flags["SEXED_URBOLG"] != undefined || pc.hasKeyItem("Taur-centric Ship Equipment")) output("Though I guess you certainly do have some ‘special’ equipment");
		else output("I hope you’ve got some special equipment");
	}
	else output("Up for another tussle onboard my ship, Urbolg? Still got the equipment set up, after all. Seems a shame not to use it");
	output(".”</i>");

	if(flags["URBY_TAUR_FUX"] == undefined && !pc.hasKeyItem("Taur-centric Ship Equipment"))
	{
		output("\n\n<i>“Hnnh,”</i> he says, considering something. <i>“Ye know... I’ve got a bunch of tools designed for ‘taurs. I see all manner of idiots coming through here and plenty of their stuff gets left behind. Pair ‘a leithans rolled through and never came back fer it. What say ye help me bring it up to your ship and set it up?”</i>");
		output("\n\n<i>“Sure,”</i> you say, shrugging. <i>“I’ll take your junk off your hands.”</i>");
		output("\n\n<i>“S’not </i>junk<i>,”</i> he insists, leading you over to where he keeps spare parts. <i>“I jes never found a use fer it. ‘Til now.”</i>");
		output("\n\n<i>“Right. Thanks, Urbolg.”</i>");
		output("\n\nIt takes the two of you working together almost twenty minutes to get all of Urbolg’s kindly donated equipment into the hold of your ship, the only location you could possibly fit all this. By the time you’re done, you’re both breathing a little harder and sweating a bit.");
		output("\n\n<i>“Too tired to fuck, old man?”</i> you ask, grinning at the korgonne.");
		output("\n\nUrbolg responds by flipping you off with a metal finger. <i>“Fek off ye little shit,”</i> he huffs, looking");
		if(pc.tallness - 12 > chars["URBOLG"].tallness) output(" up");
		output(" at you with a determined expression. <i>“Be a cold day in hell ‘fore I let some smartass kid get away with talkin’ shit t’me.”</i>");
		output("\n\nYou laugh. <i>“I was hoping you’d say that. So, show me how this stuff works.”</i>");

		output("\n\nYou pass the time with idle chatter, but the longer it goes on the more you feel inclined towards silence. Both to let the half-pint mechanic get his work done and because, well, the eroticism of this is really starting to impress upon you. Your front half is draped over a suspended mounting platform and your hindlegs are locked apart, ensuring your partner has easy access to your behind. Couple that with the fact he’s tying your loose limbs up in restraints and it feels a little like you’re a mare waiting to be bred by a stud.");
		if(pc.hasCock())
		{
			output(" Your [pc.biggestCock] is already hard in anticipation,");
			if(pc.balls > 0) output(" your [pc.balls] drooping low with liquid weight");
			if(pc.hasVagina()) output(" while your [pc.pussy] drips down your rear");
			output(".");
		}
		else if(pc.hasVagina()) 
		{
			output(" [pc.EachVagina] drips with anticipation,");
			if(pc.tailCount > 0 && (pc.tailType == GLOBAL.TYPE_EQUINE || pc.tailType == GLOBAL.TYPE_LEITHAN)) output(" somewhat hidden beneath your tail but nonetheless");
			output(" waiting to be stretched wide around Urbolg.");
		}
		else output(" Your [pc.asshole] tightens up, winking in anticipation.");
		output("\n\nYour stud circles you, checking the tightness of the equipment and ensuring everything is in position before finally wiping his forehead and sighing. <i>“There.”</i>");
		output("\n\n<i>“So... what are you gonna do first?”</i> you ask him, a little curious to hear what he’ll say.");
		
		if(!pc.hasKeyItem("Taur-centric Ship Equipment")) pc.createKeyItem("Taur-centric Ship Equipment", 0, 0, 0, 0, "Equipment to accommodate a taur living on your ship.");
	}
	else
	{
		output("\n\n<i>“Aye, go on then,”</i> he says, waving you off. <i>“I’ll join you in yer ship in a moment.”</i>");
		output("\n\nYou trot back up the ramp, heading to the hold. It’s not exactly the most intimate setting, but it was the only place all of the mounting equipment would fit. Hopefully you never have to answer a docking agent’s questions about it. You manage to get most of the setup done yourself before Urbolg comes, the korgonne dutifully doing up the rest of the restraints and sealing you in place. You");
		if(pc.tailCount > 0) output(" flick your [pc.tails] and");
		output(" look back at him, winking in more ways than one.");
		output("\n\n<i>“You got me all tied up, ");
		if(flags["URBOLG_DOGGYED"] >= 3) output("daddy");
		else output("big man");
		output(". What’re you gonna do to me?”</i>");
		//merge
	}
	output("\n\nThe answer sends a little shiver down your spine. <i>“What am I gonna do?”</i> Urbolg echoes, beginning to smile. <i>“Whatever I damn well please.”</i>");
	output("\n\nHe gently runs a finger down your backside, the tip of it grazing");
	if(pc.hasVagina()) output(" the lips of [pc.oneVagina], quivering at his touch");
	else output(" your pucker, instinctively squeezing tight when you feel him there");
	output(".");
	if(pc.hasCock()) 
	{
		output(" Your cock");
		if(pc.cockTotal() > 1) output("s stir");
		else output(" stirs");
		output(", twitching against your underbelly.");
	}
	output(" Without warning, he slips two fingers inside your");
	if(pc.hasVagina()) output(" rear-mounted vagina");
	else output(" asshole");
	output(" and starts stretching you out, pulling them apart.");

	output("\n\n<i>“Oh... Ooh,”</i> you moan gently, not having expected such gentle titillation. It’s a nice departure from the usual - and then there’s another finger. And another. Spreading you wide, Urbolg draws his hand back to the very edge of your entrance and you feel his thumb join in, too. Now this is a lot more in line with what you thought you had coming.");

	output("\n\n<i>“Uhhhnnnnnnh!”</i> you scream as he sinks his hand into your stretched-out fuckhole, using your own body’s strengths against you. <i>“Uhhhh! Fuck! God!”</i>");

	output("\n\n<i>“Ye should feel lucky I’m using this hand and not th’other,”</i> Urbolg reminds you good-naturedly, tapping your butt with his still-free mechanical arm. <i>“Lots more goodies on that one.”</i>");

	output("\n\n<i>“Hhhhnngh, uhh, haahh,”</i> you pant, alternating between clenching and trying not to clench up on the intrusion into your rear. It’s a tough fight, battling against your own instincts, but eventually Urbolg has his arm inside you almost to the elbow. <i>“Oohhh fuck,”</i> you groan, suddenly intensely grateful for the restraints and support. You might have collapsed otherwise. <i>“That’s intense...”</i>");

	output("\n\n<i>“Aye, imagine so,”</i> Urbolg agrees. <i>“Seen a leithan girl -");
	if((pc.race() == "leithan" || pc.race() == "half-leithan") && pc.mf("","f") == "f") output(" jes’ like you, actually");
	else output(" not that different from yerself, really");
	output(" - get fucked like this by a power loader. She screamed so loud when she came the entire station heard it, I reckon. There was a </i>lot<i> of juice to clean up. Lucky for me,”</i> he continues, slowly dragging his arm backwards as your taut orifice refuses to let him go, <i>“this en’t my ship.”</i>");

	output("\n\nYou scream once more, this time in pleasure, as he starts fisting your");
	if(pc.hasVagina()) output(" squelching cunt");
	else output(" gaped asshole");
	output(" in earnest. He’s going slowly, but <i>fuck</i> - slow is all it takes. Finding your baser animal needs met, you orgasm with a " + pc.mf("deep, rumbling groan","loud, highpitched moan") + " of ecstasy.");
	if(pc.hasCock())
	{
		output(" Your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" spurt [pc.cum] up between your front legs, splattering against a wall");
		if(pc.hasVagina()) output(" while your gaped pussy clamps down on him so hard you can hear him grunt");
		output(" as you strain through grit teeth.");
	}
	else if(pc.hasVagina())
	{
		output(" You feel a sudden kinship with the leithan girl Urbolg mentioned as your pussy clamps down <i>hard</i> on Urbolg’s arm. You can just hear his grunt as you strain through grit teeth, noisily cumming while you wrap his arm in your walls.");
	}
	else output(" You’re unable to completely subdue your instincts, your ass clamping down on Urbolg hard enough to make him grunt. Bucking your hips as best you can, you feel yourself release then squeeze him over and over while you ride him through your orgasm.");

	output("\n\nYou’re leaned over and panting hard with the effort of cumming so forcefully when you feel Urbolg stir behind you.");

	output("\n\n<i>“Once more fer effect, aye?”</i> he says, winking at you when you turn around. <i>“Then I’m getting me arm out ‘fore ye take it off.”</i>");

	output("\n\n<i>“Waitwaitw- uuuhhh! Oh, fuck! Fuck, fuck, fuck!”</i> you scream, beginning the process anew.");

	output("\n\nIt’s over almost as abruptly as it began. Urbolg forces you to another violent orgasm, your behind squeezing and rocking forward so hard it must look like you’re trying to seed a mare");
	if(!pc.hasCock()) output(" despite your lack of necessary qualifications");
	output(". Slumped over the platform and covered in sweat, you wince as Urbolg withdraws from your gaped orifice, your hindlegs twitching while you automatically begin winking at him.");
	output("\n\n<i>“Nice view,”</i> he says, chuckling. <i>“Could get used to it.”</i>");
	output("\n\nYou moan, half in embarrassment and half in exertion. It’s over... and you have <i>covered</i> your hold in juices, just like he said.");
	output("\n\n<i>“Ye know, I could leave ye here,”</i> Urbolg says, slapping your rump and cackling. <i>“Share the secret with a couple pirates. Ye’ll have a fanclub before ye know it.”</i>");
	output("\n\n<i>“You wouldn’t,”</i> you gasp in dismay, realizing your error before he waves you off.");
	output("\n\n<i>“Not my thing,”</i> he says, shaking his head. <i>“Funny t’think about, though.”</i>");
	output("\n\nHe undoes your restraints and you gratefully flop out of them, managing to stay standing as you rub your arms.");
	output("\n\n<i>“Well, I en’t stickin’ around to help with cleanup,”</i> Urbolg says, turning and giving you a wave. <i>“Come see me if you need some more later.”</i>");
	if(flags["URBOLG_DOGGYED"] >= 3) output("\n\n<i>“Thank you daddy!”</i> you call after him.");
	else output("\n\n<i>“Yeah, thanks Urbolg,”</i> you sigh.");
	output("\n\nIt takes you a while to get the hold free of stains and in the end you’re covered with a fresh coat of sweat, but you manage it. Maybe you should take a shower.");
	IncrementFlag("URBY_TAUR_FUX");
	//maingamemenu
	processTime(25);
	sweatyDebuff(1);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[RideCock]
//Requires that you’re calling him daddy by now (so fucked him 2 or more times?)
//Invalid tooltip: Maybe if you let Urbolg pound you out and suck his cock a little he’ll be more amicable towards the idea of letting you ride him.
//Valid: Ask Urbolg if you can ride his cock.
public function rideUrbolgsCock(x:int):void
{
	clearOutput();
	showUrbolg(true);
	author("Wsan");
	output("<i>“So, </i>daddy<i>,”</i> you murmur, leaning " + (pc.tallness > 66 ? "down":"forward") + " and slipping a hand around his apron to run your fingers through his thick white chest fur, " + (flags["URBOLG_RIDES"] == undefined ? "<i>“can I ride":"<i>“wanna take me for another ride on") + " that big, fat, knotty cock of yours?”</i>");
	output("\n\n<i>“Yer becomin’ a bonafide slut for me, ain’tcha?”</i> Urbolg says, watching you stroke his stocky chest. <i>“Aye, I’ll let you have a ride. Get yer butt up the ramp so I can fuck it, then.”</i>");
	output("\n\n<i>“Mmm, I like the words I’m hearing,”</i> you say lightly, turning around and smiling when the korgonne mechanic grabs a handful of your [pc.ass]. <i>“The preview’s free just for you.”</i>");
	output("\n\nYou’re in your room" + (!pc.isCrotchExposed() ? " naked":"") + " not long afterward, letting Urbolg sit at the head of the bed while you crawl up to meet him. His canine cock, as always, looks gigantic on him. It’s absurdly proportioned relative to his body, his overbearing sexuality and masculinity readily evident. His overeager knot is already halfway inflated, blood surging to his nethers.");
	output("\n\n<i>“Let me get that for you, daddy,”</i> you say quietly, leaning down as Urbolg makes himself comfortable with your pillows, spreads his legs, and puts his hands behind his head. <i>“I’ll get you all ready...”</i>");
	output("\n\n<i>“Knock yerself out, ‘captain’,”</i> he grunts, the slightly degrading barb inciting your");
	if(pc.hasCock()) output(" [pc.cock]");
	else output(" [pc.vagOrAss " + x + "]");
	output(" to twitch in eagerness. You could listen to him talk down to you while you get him off all day. For now, though, you’ll content yourself with warming him up.");
	output("\n\nHolding his cock with a gentle grip, you spend the next few minutes licking him up and down at a relaxed pace. You finish up by planting a kiss on the crown of his stiff doggydick and letting him slide between your [pc.lips], slipping him as deep into your throat as you can manage before giving him a long, hard suck on the way out. You settle back and give him a lascivious grin.");
	output("\n\n<i>“Not bad,”</i> he mutters, reaching down to wipe a bead of precum already poking out from his tip. He smears it across your ");
	if(pc.hasFur()) output("furry");
	else if(pc.hasScales()) output("scaled");
	else output("smooth");
	output(" cheek. <i>“Now hop on it ‘fore I pin ye down myself.”</i>");

	output("\n\n<i>“Yes, daddyyy,”</i> you say in a singsong tone, hopping forward to mount him and raise your ass in the air. Placing your hands on his firm shoulders and leaning forward, you whisper in Urbolg’s ear. <i>“Just relax and let me do all the work.”</i>");

	output("\n\nYou lower yourself with a soft sigh, easing him into your [pc.vagOrAss " + x + "]. The tapered head of his doggy dick makes for a comfortable entry, your " + (x >= 0 ? "pussy":"asshole") + " slowly being speared on its tip, but it’s impossible to ignore just how thick the rest of him is.");

	var looseness:Number = pc.ass.looseness();
	if(x >= 0) looseness = pc.vaginas[x].looseness();
	if(looseness < 3) output("\n\nYour tight hole");
	else output("\n\nEven your lewd hole");
	output(" is stretched taut around him, his imposing knot still sitting at the base of his fat cock like a prize you’re going to have to work for. A little moan of excitement escapes your lips.");

	if(x >= 0) pc.cuntChange(x,chars["URBOLG"].cockVolume(0));
	else pc.buttChange(chars["URBOLG"].cockVolume(0));

	if(pc.felineScore() >= 3) output("\n\n<i>“The kitty’s jes’ a bitch in the end, eh?”</i> Urbolg mutters fondly.");
	else if(pc.canineScore() >= 3) output("\n\n<i>“My bitch puppy feeling good before [pc.hisHer] master?”</i> Urbolg teases you.");
	else output("\n\n<i>“Don’t ye get too excited ‘fore the main event, kid,”</i> Urbolg reminds you.");

	output("\n\nYou take his jab in stride and begin the process of slowly stretching yourself out for him, enjoying the journey every bit as much as you’re going to enjoy the result. You bring your ass back up and let yourself sink down another couple inches every time, your hole slipping snugly around his cock and wrapping it in an intimate embrace. It takes a minute for you to get to the bottom but when you finally get there and your butt presses down on his knot, you feel a blast of hot seed right up your distended passage.");

	output("\n\nYou fix Urbolg with a huge smile and roll your [pc.hips] back, milking him for more.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] gently press");
		if(pc.balls == 1) output("es");
	}
	else output(" Your ass presses");
	output(" against his massive, throbbing knot with every rock of the bed, increasing in intensity until you find yourself panting and moaning above him, almost lost in your fervent indulgence. Slowing it down a little, you let yourself relax until you’re poised to take it inside.");
	output("\n\n<i>“Oh fuck, you’re so hard,”</i> you murmur, shuddering as you settle atop his fat knot and begin to take it in. <i>“Nnnnnh...”</i>");
	output("\n\n<i>“S’more like it,”</i> Urbolg grunts, reaching forward to take ahold of your hips. <i>“Down ye go.”</i>");

	output("\n\n<i>“Oh, daddyyyy,”</i> you moan, long and drawn-out while he drags you over his knot until, at last, it pops into you and seals you up. You give a groan of pleasure at the feeling, the massive protrusion stretching you out in the way only it can. <i>“I’m gonna milk you so hard...”</i>");

	output("\n\nKnotted like a bitch and as ready as ever, you employ the limited range of motion available to you and begin rolling your hips once more. It’s a <i>lot</i> harder now, the difficulty of moving with such a massive knot and a fat cock inside you making itself apparent, but you’re more than ready to meet the challenge. After all, you need to make daddy cum.");

	output("\n\nHarder than he already is, anyway. Urbolg’s not-so-little quirk already has you on edge, his virile cum shooting up into your warm, welcoming and completely airtight fuckhole and suffusing your insides with erotic heat. He slaps your ass as if to drive you onward, an enthusiastic grin on his face. He must be loving watching you debase yourself for him on your own bed.");

	output("\n\n<i>“Sorry, daddy, I’m going to cum before you do,”</i> you pant, tongue hanging out and eyelids fluttering as you roughly buck your hips against him. <i>“O-oh, oh god, oh fuck, nnnn-”</i>");
	output("\n\n<i>“Slut,”</i> Urbolg chuckles.");

	output("\n\nThe word sends a shiver down your spine that doesn’t stop, your lower half quivering in pleasure as your breath catches in your throat and your eyes widen. Waves of pleasure wash through you from bottom to top, making you buck your hips and arch your back until you reach orgasm. All of the muscles in your body tighten and flex while you shudder, gritting your teeth and letting out a low, sultry groan.");

	output("\n\n<i>“Huh- uh- oooohhhh goood- nnngh!”</i>");

	if(x >= 0) 
	{
		output("\n\nYour sodden pussy suddenly seizes up on Urbolg’s cock, squeezing a massive shot of fresh spunk out of him that splatters against your cervix. He’s so <i>warm</i> that you can’t stop yourself from letting out a happy moan, letting your master know his bitch can’t resist his dick. His only response is to spank you again, forcing you to roll your eyes upwards and reflexively tighten up on him.");
		output("\n\n<i>“Thas’ more like it,”</i> he grunts in amusement.");
	}
	else
	{
		output("\n\nThe pleasure rolls through you time and time again, making you tighten your abdominals with increasing fierceness until you realize that no matter how much you force this, nothing’s going to come out. You let out a low moan as all of the bliss stays internal");
		if(pc.hasCock()) output(", your cock shaking and flexing while you suffer a massive dry orgasm");
		output(". He’s so deep and big inside you that you never had a chance. Urbolg just grins up at you and spanks you again, forcing you to roll your eyes upwards and reflexively tighten up on him.");
		output("\n\n<i>“Nnnngh! Nnnn- nnnnuuuhh...”</i> you moan.");
		output("\n\n<i>“Maybe next time, kid,”</i> Urbolg grunts in amusement.");
	}
	output("\n\nStill suffering the aftershocks of orgasm but unwilling to give up your mission to make daddy cum, you raise your hips once more.");
	if(x >= 0) output(" You’re so oversensitive after being made to cum that it’s a hell of a struggle, but you’re determined to do it for him");
	else output(" His giant knot moving around inside you " + (pc.hasCock() ? "grants the slightest of opportunities for cum to slowly drip from your half-hard cock, bouncing against his stomach with dull splatters" : "stirs your arousal to the edge as you bounce against his stomach") + ". Honestly, you couldn’t care less right now");
	 output(". You just want to make him cum, to hear his groans of pleasure, to feel him shudder and throb inside your" + (x >= 0 ? " dripping, needy cunt":" stretched-taut, squeezing asshole") + ".");
	output("\n\n<i>“Nnn, fuck,”</i> Urbolg curses, grabbing your hips and beginning to bounce you more forcefully. <i>“C’mon, ye little slut!”</i>");
	output("\n\n<i>“Oh! Oh, daddy!”</i> you half-scream, every bit of your body responding with red-hot lust. <i>“Fuck me! Fuck me! Fuck my little " + (x >= 0 ? "cunt":"asshole") + "!”</i>");
	output("\n\nUrbolg lets out a breathless groan of release, his arms and legs tensing so hard against you that you can’t resist feeling them up as you arch your back for him. Responding in kind to his obvious pleasure, you feel yourself suffer a second orgasm as he lifts you up and slams you all the way to the hilt of his giant knot" + (pc.hasCock() ? ", the sheer force sending [pc.cum] streaming from your [pc.cockHeadBiggest]":"") + ". You moan like a whore to underline his desperate panting, the man you desire so badly shivering underneath you. <i>Fuck</i>, that feels good...");
	output("\n\nHolding you in place and spreading your legs with his own, Urbolg strains and grunts while he rides out his orgasm. The sheer eroticism of watching him grit his teeth and squeeze his eyes shut has you halfway to cumming again before he finishes");
	if(x >= 0) output(", your pussy quivering in utter submission around his brutal knot");
	else if(pc.hasCock()) output(", your cock" + (pc.cockTotal() > 1 ? "s":"") + " standing upright once more");
	output(". God... maybe you should look into a more permanent arrangement with him.");

	output("\n\nHe finally lets you go, allowing you to collapse forward onto his generous, furred tummy and his muscular chest. Just getting to lie on top of the tough but fluffy man feels like a reward all on its own, your fingers running through the korgonne’s thick fur. You close your eyes to savor the moment before opening them and seeing Urbolg looking up at you with a lazy confidence.");
	output("\n\n<i>“Oh... that was amazing,”</i> you moan");
	if(pc.hasCock()) output(", your cock" + (pc.cockTotal() > 1 ? "s":"") + " drooling wasted spunk");
	output(".");

	output("\n\n<i>“Aye, wasn’ too bad, kid,”</i> Urbolg says,");
	if(pc.hasEmoteEars()) output(" rubbing your [pc.ears]");
	else output(" rubbing your head");
	output(". <i>“Time well spent, I reckon.”</i>");

	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("\n\nYour [pc.tail] swishes through the air");
	else output("\n\nYou try to slow your frantic post-orgasm breathing");
	output(" while you lay on top of him, filled with contentment. You awaken a couple of minutes later after he taps you on the " + (pc.hasMuzzle() ? "snout":"nose") + ", a surprised murmur escaping your lips. You hadn’t even realized you’d fallen asleep!");

	output("\n\n<i>“Gotta get back to work, kid,”</i> Urbolg says, lifting you up with surprising ease. Your moan as he slips free of your gaping " + (x >= 0 ? "pussy":"ring") + " is loud enough to make his ears flick back. <i>“Don’ worry, ye can come back and get stretched out again any time ye like.”</i>");

	output("\n\n<i>“Yes, daddyyyy,”</i> you moan as he deposits you face-down on your bed and dresses himself. Affording yourself a lusty gaze at his strong back and thick buttcheeks as he fastens his apron, you admire his staunch form. You could spend all <i>day</i> just licking and massaging that, like worshipping at a temple. Just the thought of it makes you shiver in amongst your sheets a little");
	if(x >= 0) output(", arousal heating your body");
	else if(pc.hasCock()) output(", your cock stiffening to full erection against your mattress");
	output(".");
	output("\n\n<i>“Arright. Come get me when ye need some more,”</i> Urbolg says, nodding at you before grinning. <i>“Got a feelin’ it’ll be sooner than later. See ya, kid.”</i>");
	output("\n\n<i>“Bye, daddy,”</i> you say, waving until you’re alone in your room, thick sperm slowly dripping down your [pc.thighs] as if to mark you as property. If that’s what it takes, you’re <i>more</i> than happy to play the part. Your flexing, aching fuckhole is going to remember this encounter every bit as much as you will, that’s for sure...");
	currentLocation = "SHIP INTERIOR";
	processTime(55);
	if(x >= 0) pc.loadInCunt(chars["URBOLG"],x);
	else pc.loadInAss(chars["URBOLG"]);
	IncrementFlag("URBOLG_RIDES");
	IncrementFlag("SEXED_URBOLG");
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}