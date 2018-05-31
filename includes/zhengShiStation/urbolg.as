import classes.Items.Protection.ProtoShield;
import classes.Items.Protection.JumperShield;
import classes.Items.Armor.RattyArmor;
import classes.Items.Guns.HandCannon;


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
	else
	{
		if(pc.hasStatusEffect("URBOLG_DISABLED"))
		{
			output("\n\nUrbolg the korgonne mechanic is here, working on something, but he still looks kind of mad. Letting him cool off for a day might be best.");
			addDisabledButton(0,"Urbolg","Urbolg","Urbolg is still mad at you.");
			return false;
		}
		//Defeated Urbolg by lust or ever fucked him:
		else if(flags["URBOLG_LUSTED"] != undefined || flags["SEXED_URBOLG"] != undefined) output("\n\nUrbolg the korgonne mechanic busily works to repair a scrap engine hanging from a lift, but he keeps casting sly glances in your direction with his robotic eye. The fluffy little devil seems to have taken a liking to you!");
		//Normal Urbolg
		else output("\n\nUrbolg the korgonne mechanic busily toils over junked engine. The hunk of blast-ruined metal hangs from a lift as he works on it, fully absorbing his attention.");
		addButton(0,"Urbolg",peacefulApproachUrbolg);
	}
	return false;
}

public function showUrbolg(nude:Boolean = false):void
{
	showName(flags["MET_URBOLG"] == undefined ? ((CodexManager.entryUnlocked("Korgonne") ? "KORGONNE" : "CANINE") + "\nMECHANIC") : "\nURBOLG");
	showBust("URBOLG" + (nude ? "_NUDE":""));
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
	pc.lust(25);
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
	//Lust
	if(enemy.lust() >= enemy.lustMax())
	{
		output("The mechanic abruptly holsters his pistol, conscious of the bulge in his apron, and throws up his hands placatingly. <i>“Alright, alright. Ye made yer point " + pc.mf("lad","missy") + ". Yer more than lewd enough to belong here, and if ye be with the long arm of the law... well at least whoever you’re after is gonna have a fun time resisting arrest.”</i> He winks his robotic eye in your direction. <i>“I won’t be stopping ye if ye want to stretch yer legs on the rest of the station, just don’t be leaving too many cases of blue balls in yer wake, eh? And maybe pay me a visit if ye get a touch too randy yerself. Name’s Urbolg.”</i>");
		flags["URBOLG_LUSTED"] = 1;
	}
	//HP
	else
	{
		output("<i>“Hold!”</i> the mechanic bellows, smartly holstering his pistol. He throws his hands up in the air placatingly. <i>“Ye proved yer fekkin’ point! No bloody bastards are gonna be walking over you, no sir.”</i> He harrumphs, <i>“Meself included! Ye fight with the burning determination of a quasar and the wisdom of a frostwyrm. Either you’re a pirate to be proud of or peacekeeper I’d rather stand clear of. So go on, stretch your legs");
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
	addButton(14,"Leave",mainGameMenu);
}
//Appearance
public function urbolgAppearance():void
{
	clearOutput();
	showUrbolg();
	output("The korgonne mechanic’s stocky body stands all of 4’11”</i> tall, but he carries himself with the implacable authority of a bouder. His gleaming, mechanical hand further lends to his fearsome appearance, and you’ve seen all too well the number of gadgets and weapons concealed within. A thick, pocket-laden apron offers him dozens of places to conceal armaments and tools. The extra-large shield belt he cinches tight around his solidly built waist holds it all in place, at the same time offering him protection from stray sparks and gunfire.");
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
	output(" He strokes at the longish fur of his chin. <i>“Doesn’t seem so long ago now, but I guess it must have been... what, thirty terran years back? ‘Round then I was a little upstart on Uveto. Not sure if you’ve ever been there, but the place is a frozen hellhole populated by shut-ins and assholes. I was one of the former.”</i> He pounds his metal fist into his chest. <i>“’Cept I was young and stupid. Figured I could take on the whole of the tundra by meself. Nothing but stolen coats, a spear, and the determination to come back with a bloodied Kor’diiak hide.”</i>");
	output("\n\nYou ask if he did.");
	output("\n\n<i>“Fek no. I never stood a chance. Managed to track one of the beasts, ye, even stuck her pretty good with my spear.”</i> He mimics a violent, downward stabbing motion. <i>“Course when yer face ta face with something ten times your size, your spear might as well be a toothpick. I never managed to pull it out for another strike. The beast threw me a good ten or fifteen feet with a shrug. Landed in a snowdrift.”</i> Urbolg holds up his metal arm, flexing the whirring servos in anger. <i>“She was on me in seconds, all teeth and claws. I was fucked, and I knew it.”</i>");
	output("\n\nListening attentively, you ask how he survived.");
	output("\n\n<i>“Same way anybody does, swallowing all the terror and pain for a chance to spit in the devil’s eye one last time.”</i> Ubrolg punches the air. <i>“I grabbed the beastie by the tongue before she could get her jaws around my head, and I twisted for everything in me little arms. Shoulda heard the pop it made. Sweeter than a suula symphony. Course all that did was piss ‘er off. By that point the left half of my face was a mask of blood, and there’s not much ta do when dagger-sized teeth are sawing your arm in half. I mighta took a couple swings with my other hand, but what’s that gonna do against thousands of pounds of monster?”</i>");
	output("\n\n<i>“Nothing,”</i> you admit.");
	output("\n\nUrbolg nods gruffly, pulling his flask for another swig. He doesn’t offer any for you this time. <i>“Twas about halfway bled out and down one hand when that cursed bear slumped over into the snow. I didn’t know what happened. Figured I was already dead or worse. Last thing I saw was a laquine standing over me toting a rifle about twice her size. I didn’t know what the fuck she was saying, but she screamed and hollered up a storm while I lost consciousness.”</i>");
	output("\n\n<i>“And?”</i>");
	output("\n\nThe korgonne smirks at you. <i>“And she hauled my sorry ass in for medical treatment, I guess. Woke up in her ship with a stump below the elbow, one good eye, and a translator strapped around my neck. Tried to fight my way out once, before I passed out. If ye can believe it, I was a bit of a savage back then. Thought the core magics would corrupt me.”</i> He glances to his arm and sighs. <i>“Twas about half right about that, truth be told.”</i>");
	output("\n\nYou ask him why he stayed instead of going home, if he was that worried about corruption.");
	output("\n\n<i>“Didn’t have much choice.”</i> He barks out a bawdy laugh. <i>“When ye wake up in a pirate cruiser, ye can either chip in and earn a share or get sold off into slavery. Me? I chipped in, and I chipped in hard.”</i> He wiggles his fingers. <i>“Once they calmed me down and stuffed a new hand on me stump, I got put to work cleaning out under the engines, reactors, and anywhere else to small or dirty for a bigger pirate to bother with. It’s how I got me start, bein’ an artificer.”</i>");
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
	output("\n\nUbrolg nearly doubles over cackling. <i>“Fek no! Besides the whole owing \[[[REDACTED\]]] my life thing, I developed a... how do you say... a taste for it. I saw more miracles in my first week in space than our tribe’s wildest legends could’ve prepared me for. The vastness of space. Lethal wounds knitted into healthy flesh in minutes. The feeling of opening a new eye after finally adjusting to the raw, empty socket.”</i> He gestures at the hangar. <i>“Wide open spaces of gleaming metal built to house majestic vessels, each more than capable of leveling a korgonne hold. Once I’d seen... this, I knew I couldn’t ever go back to me old life.”</i>");
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
	output("\n\n<i>“That description is just as apt for yer science boys and gals, spendin’ all day studying arcane formulae and physics to wring a few extra wats into a laser pistol. And don’t tell me that the warp gates that stitch this universe together ain’t the product of some black magic. Somebody musta traded their heart to a demon for the keys to that puzzle. Just ‘cause core magic’s a bit more finicky than the stuff of legend don’t make it not be magic.”</i>");
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
	output("\n\n<i>“It may a bit, aye. But who cares about hoppin’ around all nimbly bimbly when you can shrug off a hit from an RPG with a smile?”</i> He pounds a meaty fist to his fluffy shoulders. <i>“I know it too. Happened once. Gave the fekkin’ tool a few missing limbs for his trouble. ‘Course I built him some new ones after. ‘Twas better than he deserved, the sneak, but it’s worth it to hear him clomp around on the deck”</i> He hops and pounds his paws into the deck heavily, chuckling. <i>“Ye let me know if ye see ol’ no-legs around. We’ll have a giggle and a drink over it.”</i>");
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
	pc.lust(5);
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
			if(flags["URBOLG_DOGGYED"] >= 3) output("Will you show me how a </i>real<i> alpha fucks his little slut, daddy?”</i> you moan, wagging your [pc.tails] in need");
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
		output("\n\n<i>“Good [pc.girlBoy]");
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
		output(",”</i> he mutters, placing a hand on your head and taking the invitation.");
	}
	output("\n\nHis tapered tip slides across your tongue and into your mouth without stopping, Urbolg taking the opportunity to hold you in place and thrust into your cheeks. You gladly allow him, curling your [pc.tongue] around as much of his fat cock as you can manage while your cheek bulges with cock. He holds you there for a few seconds while you slobber and slurp all over his dick, your lips sealing around the middle of his cock and sucking as hard as you can manage.");
	output("\n\nUrbolg grunts in pleasure, pulling back and thrusting deeper into your mouth, the head of his cock kissing your tonsils for a second before he pushes further. Every inch he sinks inside you makes you");
	if(pc.isHerm()) output(" wetter and harder");
	else if(pc.hasVagina()) output("wetter");
	else output("harder");
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
		if(isDog && pc.tailCount > 0) output(" wagging your [pc.tails]");
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
	if(x >= 0) output(" running his finger up the centre of your dripping pussy and making you shiver");
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
		output("‘bout time I taught you");
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
		else output("stretched-wide pussy");
	}
	else output(" intestine");
	output(" every second. <i>“Fuck! Fuck! Fuck");
	if(flags["URBOLG_DOGGYED"] >= 3) output(" me, daddy");
	output("! Uhhh!”</i>");

	output("\n\n<i>“Not the first slut I’ve had singing in their own cabin and I doubt ye’ll be the last, either,”</i> Urbolg cackles, spanking your ass with his non-mechanical arm. The impact is loud enough to surprise you more than the stinging sensation that settles in a second later, your [pc.ass] jiggling with the contact. You open your mouth to complain but all that comes out is the long, eager moan of a whore getting what [pc.heShe] wants.");

	output("\n\nFuck it, he can spank you like a bitch and talk all the shit he wants if he keeps fucking your needy");
	if(x >= 0) output(" cunt");
	else output(" pucker");
	output(" like this! You throw your head back and groan in satisfaction, your voice coming from deep in your throat as he pounds your ass. His hips smack into your behind with the force of a blast door closing, each slap resounding in your bedroom.");
	//Crew: 
	if(crew(true) > 0) output(" If any of your crewmates are around, they know for sure you’re getting fucked in here like the slut you are.");
	if(x >= 0) output(" Your mind’s delving into deeper and deeper submission faces a sudden interruption when you feel something cold and metallic pressing at your asshole.");

	output("\n\n");
	if(flags["URBOLG_DOGGYED"] == 1)
	{
		output("<i>“W-what i-i-is that,”</i> you pant, getting fucked too hard to speak properly, let alone look back for yourself. <i>“Guh-nnngh! Oh! Oh! Fuck!”</i>");
		output("\n\n<i>“Jus’ a spare finger I had lyin’ around,”</i> Urbolg says, and the next moment your eyes bulge in shock.");
	}
	else output("<i>“O-o-oh g-o-o-od,”</i> you whimper needily, already knowing what’s going to happen.");

	output("\n\nHis finger extends all on its own, springing forward from his lower knuckle and penetrating your unprepared asshole several inches deep before you can even think to clench. By the time you do, it’s far too late - it’s pounding you like a machine at a rate of what feels like five thrusts a fucking second.");

	output("\n\n<i>“Ye seem like the kinda " + pc.mf("lad","lass") + " who’d appreciate two at once,”</i> Urbolg says, and you can hear the mirth in your voice. He’s teasing you, using your own libido against you, and god damn it he’s right. It <i>does</i> feel better with his finger jammed up your asshole, fucking you almost as hard as the fat cock between your thighs.");

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
	if(flags["URBOLG_DOGGYED"] <= 2)
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
	processTime(30);
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
	shopkeep.inventory = [new HandCannon(),new JumperShield(),new RattyArmor()];
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
	else output(", pinky pressing against your [pc.sack]");
	output(". <i>“Pirate like you ain’t gonna settle for no friendly handjob, right?”</i>");

	output("\n\n<i>“Right,”</i> you softly moan, exploring Urbolg’s cock. It’s a proud canine dick by the feel of it. The shaft is nice and thick, tapering slightly toward an angular tip. When your fingers get too close to its animalistic crown, the whole thing jerks in your hand, and when you gently contact the knot, dribbles of sticky-slick cock-sap flow over your knuckles to grease your palm. A map of his rigidly erect features meticulously assembles itself in your mind, fed by your fingers’ eager fondling.");
	processTime(5);
	pc.lust(10);
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
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",urbolgToysPartIII,x);
}

public function urbolgToysPartIII(x:int):void
{
	clearOutput();
	showUrbolg(true);
	//Cumslut of any kind.
	if(pc.isDependant(2) || pc.isBimbo() || pc.isCumSlut())	
	{
		output("Your eyes cross to take in the puddle of creamy goo on your chest. The salty, musky aroma wafts up to your nostrils, and your mouth can’t help but water. Your cock can’t help but throb. You can’t help but lick your lips and prepare yourself for a mighty thrust. Of course you want more of his cum! You want to milk it out in long loving strokes until you’re bathing in it. You want it slicking back your hair and danging from your eyelashes. You want it bubbling around a glowing, cum-drunk smile.");
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

	output("\n\nAs expected, the sensation is exquisite. His heartbeat thrums through his cock as it slides against your own length, the twin dongs shifting slightly on curtains of pre and cum. The aroma of sex, particularly the musky masculine notes, fills the air as you grab Urbolg by his not inconsiderable waist and happily grind your [pc.hips] into him, frotting so heavily that you can hear the squishing sounds of cum-soaked skin slipping and slapping in your lusty fervor. It’s music to your ears when combined with the beefy mechanic's moans.");
	output("\n\nSpooge slaps down on your [pc.skinFurScalesNoun] every few seconds - slower than a typical ejaculation but perfectly matched to the heavy press of your [pc.cock " + x + "] to his knot. You’re dribbling a bit yourself by now.");
	if(pc.ballFullness <= 10) output(" It doesn’t matter if you feel drier than a desert well from all your other sexual activity, the prostate stimulation has made you a very drippy [pc.boyGirl].");
	output(" The frission of spunk-oiled skin gliding on skin is <i>exactly</i> what you needed to match the buzzing deep inside.");

	output("\n\nSoon you feel your insides tightening up, twisting around the deep-seated thrumming of Urbolg’s toy. Your thrusts get shakier. As you look up at the panting mechanic, watching him continue to paint you in alabaster relief, your muscles tremble, and you nearly lose it.");
	output("\n\nHe notices too. The talented artificer puts one hand behind your head and lifts you up even as he leans down, uncaring that your [pc.lipsChaste] are layered droplets of his cum. You lose yourself in his lips, in the salt-and-spit sense of tongues meeting and twirling. His fur tickles your cheek as you make out, and your [pc.cocks] ache");
	if(pc.cockTotal() == 1) output("s");
	output(" from the ecstatic tightness building within. There’s no art to the kiss, just pure, wanton, animal arousal driving you both to lick and suck and fill the other even as your body’s are pushed to the very edge of climax.");
	output("\n\nTorrents of bliss rocket down your spine and into your crotch on the back of that kiss, somehow hotter and more exciting than the sloppy dick-to-dick grinding.");
	if(pc.cumQ() < 100) output(" You pump out dollop after dollop, far more than you should, but there’s no denying that Urbolg’s output shames you. He cums with a roar, blasting your face in white so thick and creamy that it feels like you’re buried under a half-inch of virile goo.");
	else if(pc.cumQ() < 1000) output(" Your first spurt is a stream every bit as heavy as Urbolg’s earlier jets, but the virile mechanic’s output from actual, proper orgasm still dwarfs your own. Huge jets of pearly cream fall over your face until you’re buried under what feels like a half-inch of virile goo. All the while, you spray what feels like your biggest load in a long time onto the soupy puddle on your [pc.belly]");
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
	if(pc.isDependant(2) || pc.isBimbo() || pc.isCumSlut())	
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
	if(pc.isDependant(2) || pc.isBimbo() || pc.isCumSlut())	
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

