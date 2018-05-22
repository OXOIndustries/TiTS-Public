/* By Fenoxo Fenbutte:
Teenage runaway who got mauled by a Kordiiak Bear.
Big game hunting pirate killed the bear, saved him, and adopted him. Name/Rank TBD, but probably one of the bosses.
Speaks decent english, but a bit of an oddity. Considers technology to be magic and himself an artificer.
<i>“Affably Gruff”</i> personality.
Other young pirates took him out for an <i>“initiation”</i> when he came of age, resulting in his more interesting sexual attributes and heightened libido.

Appearance:
4’11”</i> tall and stocky.
White fur, green eyes,
Robotic hand halfway up his forearm. Sophisticated and packed with retractable tools.
Claw scars across his face and one subtly robotic eye. Bite scars on his shoulder (the same side as the eye and arm injury)
11”</i> bright blue dog-dick with an oversized knot that engorges fully whenever he has a boner.
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
	return false;
}

public function showUrbolg(nude:Boolean = false):void
{
	if(flags["MET_URBOLG"] == undefined) showName("KORGONNE\nMECHANIC");
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
	CombatManager.displayLocation("KORGONNE\nMECHANIC");
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

/*
output("\n\nUrbolg Repeat Appearances");
output("\n\n//Bonuses:");
output("\n\n//Defeated Urbolg by lust or ever fucked him:");
output("\n\nUrbolg the korgonne mechanic busily works to repair a scrap engine hanging from a lift, but he keeps casting sly glances in your direction with his robotic eye. The fluffy little devil seems to have taken a liking to you!");
output("\n\n//Normal Urbolg");
output("\n\nUrbolg the korgonne mechanic busily toils over junked engine. The hunk of blast-ruined metal hangs from a lift as he works on it, fully absorbing his attention.");

output("\n\n//Approach:");
output("\n\n//Lust defeated or fucked");
output("\n\n<i>“Oi, if it isn’t the new [pc.guyGirl]. Been wondering when ye were planning ta stop by and pay ol’ Urbolg a visit. What can I do for ye?”</i> The korgonne puts his hands on his hips and flashes a fanged smile at you.");
output("\n\n//Regular");
output("\n\nYou have to tap Urbolg’s shoulder to get his attention.");
output("\n\n<i>“Fek! Don’t go sneaking up on a guy like that! Could get a body hurt, sneaking about.”</i> Urbolg dusts off his hands and plants them on his hips. <i>“What can I do fer ye, new [pc.guyGirl]? Armor plating need replacing, or ye just want to spend some time with the most honorable pirate you’re gonna find on this side of the rim?”</i>");

output("\n\n//[Appearance] [Talk] [Flirt/Sex]");
output("\n\nAppearance");
output("\n\nThe korgonne mechanic’s stocky body stands all of 4’11”</i> tall, but he carries himself with the implacable authority of a bouder. His gleaming, mechanical hand further lends to his fearsome appearance, and you’ve seen all too well the number of gadgets and weapons concealed within. A thick, pocket-laden apron offers him dozens of places to conceal armaments and tools. The extra-large shield belt he cinches tight around his solidly built waist holds it all in place, at the same time offering him protection from stray sparks and gunfire.");
output("\n\nUrbolg’s shaggy white hair and fur are both spotted with blooms of soot from his work, though otherwise well groomed. Intelligent green eyes stare out at you from under his dirty mop, the left one clearly artificial in nature, rimmed by jagged, claw-shaped scars. His snout is stubby and short, typical of a korgonne, capped by a black nose and slight blue lips. When he speaks, an equally cyan tongue can be spotted inside his sharp-toothed maw.");
output("\n\n//Fucked!");
output("\n\nAn 11”</i> canine penis nestles snugly within his overstuffed sheath, just above a pair of obviously-enhanced, fist-sized testes. When it gets excited enough to pop out, his larger-than-normal knot immediately and powerfully inflates, big enough to break a lesser bitch in half. The thick blue bulb pulsates with every beat of his heart in visible sympathy.");
output("\n\nOf course, he’s got a similarly blue asshole nestled between his chubby cheeks, right where it belongs, not that he displays much interest in making use of it.");
output("\n\n//Not fucked");
output("\n\nWhile you haven’t seen undressed, Urbolg doesn’t bother much with clothes, aside from his apron. The bulge of a decent-sized set of balls is visible even through the thick fabric, and when he turns around, there’s nothing to hide his chubby buttcheeks or the bright blue lining of his asshole.");
output("\n\n//merge");
output("\n\nHis fluffy tail wags when he sees you looking, though his expression is as stoic as ever.");
output("\n\nTalk");
output("\n\nWhat do you want to ask Urbolg about?");
output("\n\n[His History]");

output("\n\n//Talk: His History");
output("\n\nYou ask Urbolg how he became a pirate.");
output("\n\n<i>“In a storytelling mood, are ye?”</i> the fluffy mechanic smirks and slaps a workbench with his metal hand, filling the hangar with echoing reverberations. <i>“Then ye came to the right place. I’m happy to share a tale with such a formidable foe. Rest a spell. Take a load off.”</i> He produces a flask from his apron and takes a swig, offering you a pull.");
output("\n\nDo you accept?");
output("\n\n//No");
output("\n\nYou wave it away, and Urbolg shrugs.");
output("\n\n<i>“Suit yourself.”</i>");
output("\n\n//Yes");
output("\n\nYou take a drink of the burning alcohol, unable to suppress a wince.");
output("\n\nUrbolg cackles with glee as he takes it back. <i>“That’ll light a fire in yer belly.”</i>");
output("\n\n//Merge - no new pg");
output("\n\nHe strokes at the longish fur of his chin. <i>“Doesn’t seem so long ago now, but I guess it must have been... what, thirty terran years back? ‘Round then I was a little upstart on Uveto. Not sure if you’ve ever been there, but the place is a frozen hellhole populated by shut-ins and assholes. I was one of the former.”</i> He pounds his metal fist into his chest. <i>“’Cept I was young and stupid. Figured I could take on the whole of the tundra by meself. Nothing but stolen coats, a spear, and the determination to come back with a bloodied Kor’diiak hide.”</i>");
output("\n\nYou ask if he did.");
output("\n\n<i>“Fek no. I never stood a chance. Managed to track one of the beasts, ye, even stuck her pretty good with my spear.”</i> He mimics a violent, downward stabbing motion. <i>“Course when yer face ta face with something ten times your size, your spear might as well be a toothpick. I never managed to pull it out for another strike. The beast threw me a good ten or fifteen feet with a shrug. Landed in a snowdrift. <i>“ Urbolg holds up his metal arm, flexing the whirring servos in anger. <i>“She was on me in seconds, all teeth and claws. I was fucked, and I knew it.”</i>");
output("\n\nListening attentively, you ask how he survived.");
output("\n\n<i>“Same way anybody does, swallowing all the terror and pain for a chance to spit in the devil’s eye one last time.”</i> Ubrolg punches the air. <i>“I grabbed the beastie by the tongue before she could get her jaws around my head, and I twisted for everything in me little arms. Shoulda heard the pop it made. Sweeter than a suula symphony. Course all that did was piss ‘er off. By that point the left half of my face was a mask of blood, and there’s not much ta do when dagger-sized teeth are sawing your arm in half. I mighta took a couple swings with my other hand, but what’s that gonna do against thousands of pounds of monster?”</i>");
output("\n\n<i>“Nothing,”</i> you admit.");
output("\n\nUrbolg nods gruffly, pulling his flask for another swig. He doesn’t offer any for you this time. <i>“Twas about halfway bled out and down one hand when that cursed bear slumped over into the snow. I didn’t know what happened. Figured I was already dead or worse. Last thing I saw was a laquine standing over me toting a rifle about twice her size. I didn’t know what the fuck she was saying, but she screamed and hollered up a storm while I lost consciousness.”</i>");
output("\n\n<i>“And?”</i>");
output("\n\nThe korgonne smirks at you. <i>“And she hauled my sorry ass in for medical treatment, I guess. Woke up in her ship with a stump below the elbow, one good eye, and a translator strapped around my neck. Tried to fight my way out once, before I passed out. If ye can believe it, I was a bit of a savage back then. Thought the core magics would corrupt me.”</i> He glances to his arm and sighs. <i>“Twas about half right about that, truth be told.”</i>");
output("\n\nYou ask him why he stayed instead of going home, if he was that worried about corruption.");
output("\n\n<i>“Didn’t have much choice.”</i> He barks out a bawdy laugh. <i>“When ye wake up in a pirate cruiser, ye can either chip in and earn a share or get sold off into slavery. Me? I chipped in, and I chipped in hard.”</i> He wiggles his fingers. <i>“Once they calmed me down and stuffed a new hand on me stump, I got put to work cleaning out under the engines, reactors, and anywhere else to small or dirty for a bigger pirate to bother with. It’s how I got me start, bein’ an artificer.”</i>");
output("\n\n[Continue] [Artificer?] (starts artificer talk)");
output("\n\n//Continue:");
output("\n\n<i>“So you’ve just been trapped onboard all this time?”</i>");
output("\n\nUbrolg nearly doubles over cackling. <i>“Fek no! Besides the whole owing \[[[REDACTED\]]] my life thing, I developed a... how do you say... a taste for it. I saw more miracles in my first week in space than our tribe’s wildest legends could’ve prepared me for. The vastness of space. Lethal wounds knitted into healthy flesh in minutes. The feeling of opening a new eye after finally adjusting to the raw, empty socket.”</i> He gestures at the hangar. <i>“Wide open spaces of gleaming metal built to house majestic vessels, each more than capable of leveling a korgonne hold. Once I’d seen... this, I knew I couldn’t ever go back to me old life.”</i>");
output("\n\nYou nod understandingly.");
output("\n\n<i>“Course I did try an’ go back to visit once.”</i> Urbolg snorts, ears swiveling back in irritation. <i>“Couldn’t even get into the hold. The guards damn near tried to kill me.”</i> He flashes his fangs. <i>“Called me ‘ghost devil’. I suppose I can’t blame them. The artificial eye I was packin’ back then glowed hot as a sun’s flame, and me hand was a lot more primitive lookin’ - practically skeletal. Hard to believe I used ta be like that.”</i> Another swig of whiskey soothes the korgonne’s anger into sullenness. <i>“Never got ta see me mother or sire. Just tossed a letter and a few trinkets I hand-forged for them on the floor and put it all behind me.”</i>");
output("\n\n//bimb");
output("\n\n<i>“Awww, that’s so saaad!”</i> You throw your arms around the stout dog-man and squeeze him into a tight hug, uncaring if it makes you smell like grease and sweat. <i>“You poor boy!”</i>");
output("\n\n//Bro");
output("\n\n<i>“Shit.”</i>");
output("\n\n//Nice");
output("\n\n<i>“My condolences,”</i> you say, putting your hand on his shoulder and squeezing reassuringly. <i>“That’s a tough pill to swallow.”</i>");
output("\n\n//Misch");
output("\n\n<i>“If you forge half as well as you fight, I’m sure your mom and dad were brawling over your gifts later.”</i> You offer, <i>“Besides, I know I’d rather my kid be some kind of demon-blessed immortal than dead. I’m sure they feel the same way.”</i>");
output("\n\n//Hard");
output("\n\n<i>“You tried. That’s more than most.”</i>");
output("\n\n//Merge");
output("\n\n<i>“Right.”</i> The fluffy mechanic clears his throat. <i>“So that’s me story. Did some dumb shit, paid for it, and got handed the keys to the universe. Now I do whatever the fek I want, which for right now means working some of the sweetest mechanical magic you’ll ever see.”</i> He glances around to make sure nobody else is within earshot. <i>“And between you and me, the sex ‘round these parts ain’t bad neither.”</i>");
output("\n\n//Talk Artificer?");
output("\n\n<i>“Why do you call yourself an artificer?”</i>");
output("\n\nUrbolg leans back cautiously and stares at you out of the corner of his eye. <i>“Ain’t it obvious? That’s what I am!”</i> He slaps himself in the chest. <i>“Your kind... you call all your machines and your magic words like ‘technology’ and ‘science,’ but the truth is, that’s just wizardry by another name. Me? I might not understand every little magical law that governs these wonders, but I’ve learned to work on ‘em, maintain ‘em, and sometimes even squeeze ‘em for a little extra oomph. What better title than artificer is there?”</i>");
output("\n\nYou point out that science is hardly magic.");
output("\n\n<i>“Isn’t it?”</i> The scruffy dog-man tilts his head, eyes twinkling.");
output("\n\n<i>“It isn’t.”</i>");
output("\n\n<i>“So yer saying it isn’t magic, but... isn’t magic just understanding the invisible forces that bind together our universe and tweaking ‘em in just the right way to accomplish something miraculous?”</i> Urbolg seems to be holding back a giggle.");
output("\n\nConsidering how it functions in most fantasy holos, you admit that it seems an apt description.");
output("\n\n<i>“That description is just as apt for yer science boys and gals, spendin’ all day studying arcane formulae and physics to wring a few extra wats into a laser pistol. And don’t tell me that the warp gates that stitch this universe together ain’t the product of some black magic. Somebody musta traded their heart to a demon for the keys to that puzzle. Just ‘cause core magic’s a bit more finicky than the stuff of legend don’t make it not be magic.”</i>");
output("\n\n<i>“That’s... {like, a super smart way to think about it!/a fair point.}”</i> You concede that discussion but raise another, <i>“What about psionic powers? There seem to be more psychics every year.”</i>");
output("\n\nUrbolg winces. <i>“The kind of magic I don’t want to fekken’ be around. Don’t need nobody else rootin’ around in me head or making me feel a certain way just ‘cause they want me to. Scrap that. I got word there’s some designs out there to block that sort of power. You can bet yer ass I’ll be building some as soon as I can get my hands on the components. Just gotta... ya know... get the creds together and find a source who deals in ultra-rare materials. Not real easy.”</i> He waves his hand dismissively. <i>“The important thing is the regular, everyday magic can deal with it.”</i>");
output("\n\nFlirt/Sex Intro");
output("\n\n//Haven’t yet banged and won via HP:");
output("\n\n//Talked about him till he mentioned the sex is good here");
output("\n\n<i>“How much of the sex being good is your doing?”</i> You raise an eyebrow and glance appraisingly down at his apron. <i>“It takes two to tango.”</i>");
output("\n\nUrbolg scratches nervously at one of his ears. <i>“More than my fair share, I wager. Not sure what a tango is, but if I catch yer meaning right, yer itching to see how good the crafty pirate is with his hands.”</i> He grins. <i>“But ye best not bark up that tree unless yer prepared ta be absolutely ravaged.”</i>");
output("\n\n//Not sex mentioned");
output("\n\n<i>“Interested in a little fun?”</i> You step close to the mechanic and gently brush his thigh. <i>“You seem like you could use a break.”</i>");
output("\n\nUrbolg looks you up and down appraisingly. <i>“I suppose I got time to give yer systems a once-over, but ye best not be pullin’ on me tail, or you’ll be in fer a harsh lesson in fairness.”</i> Despite the threat, his tail is wagging happily. <i>“I must admit, you’ve a fine booty.”</i>");
output("\n\nWas that... a pirate pun?");
output("\n\n//Lust teased during fight but not sexed.");
output("\n\n<i>“How about I finish what I started during our little tussle,”</i> you suggest, glancing pointedly at the korgonne’s crotch.");
output("\n\nA slight distention immediately appears in the middle of his apron. <i>“That uh...”</i> He drums his metal fingers on a nearby table and nods. <i>“I was thinkin’ of taking a break anyhow.”</i> His tail wags. <i>“Ye best not be up to something. I may seem a noble beast, but I’ll </i>destroy<i> you if ye cross me.”</i>");
output("\n\n//Sexed");
output("\n\n<i>“Got time to blow off a little steam?”</i> You lean close to Urbolg and ruffle his hair, scratching the spot right between his ears.");
output("\n\nThe mechanic’s tail thumps heavily into the side of a workbench. <i>“Oh? Yer climate control system’s on the fritz?”</i> He nods pointedly toward your ship. <i>“Guess I could do a few repairs for ye, so long as I can count on ye to handle a few pieces of sensitive equipment.”</i>");
*/