//By Wsan
//Fen Notes: Milodan War-Lion - Mercenary-Class-like Milodan. Loss scenes should result in unconsciousness for chaining into bad-ends. He could totally just knock you out if you don’t want to write them. Make sure to leave a place in the win scene routing for the PC to interact with a rescued hostage if one is in play.

public function showWarLion(nude:Boolean = false):void
{
	showBust("WAR_LION" + (nude ? "_NUDE":""));
	showName("\nWAR-LION");
}
//Intro
public function warLionFightGoooo():void
{
	showWarLion();
	author("Wsan");
	output("\n\nAmidst all the smoke and gunfire, a huge shadow suddenly looms in front of you.");
	output("\n\nYou roll to the side as it brings down a heavy blade as quick as a flash, then spring straight forward as you hear the whine of energy ammunition beginning to cook. A hail of laser fire rips through the cloud in front of you, but you’re already under the gun and ");
	if(pc.PQ() >= 80) output("rocketing a fist upwards");
	else output((!(pc.rangedWeapon is EmptySlot) ? "firing your own upwards":"swinging your [pc.meleeWeapon] upwards"));
	output(". The figure jumps back, lightning on his feet, and you get your first good look at him.");

	output("\n\nIt’s a gigantic milodan, adorned head to foot in Pyrite Industries riot/combat gear. The parts of him that aren’t covered you can see are bulging with muscle - little wonder that they gave this guy the gear he’s holding, he must be one of the only ones who could carry it. In one hand he’s carrying some kind of tri-barreled energy rifle with an overhand grip, still spinning after its recent ammunition expenditure. You can see it’s attached to a backpack the milodan is wearing.");
	output("\n\nIn his other hand, he’s wielding an energy sword that looks to have electricity shimmering around its edge. As you watch, he holds a trigger and it begins to crackle, sending sparks hissing into the air! Without warning, he launches himself forward straight at you!");
	output("\n\n<b>It’s a fight!</b>");
	startWarLionFight();
}

public function startWarLionFight(noCaptive:Boolean = false):void
{
	var tEnemy:MilodanWarLion = new MilodanWarLion();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(winVsWaryLiono);
	CombatManager.lossScene(loseToWarLion);
	CombatManager.displayLocation("WAR-LION");
	if(!noCaptive) randomKorgSavingProcChances();
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Loss
public function loseToWarLion():void
{
	showWarLion();
	author("Wsan");

	output("On your knees and panting in exhaustion, you struggle to climb back on your feet, but it’s all for naught. The war lion hauls you off your feet and smacks you straight in the face, sending you flying backwards and landing in a " + (!pc.isTaur() ? "balled-up heap":"tangle of limbs, tauric and otherwise") + ". It’s not a very graceful defeat, to say the least. Before you know it the milodan is on top of you, " + (!pc.isCrotchExposed() && !pc.isChestExposed() ? "ripping your [pc.clothes] from your body and ":"") + "getting a good look at your naked form. Panting hard after the fight and covered in sweat, the" + (pc.tallness < 8*12 ? " much larger":"") + " man very clearly likes what he sees if the tent he’s pitching in his fatigues are any indication.");
	if(!pc.hasGenitals())
	{
		output("\n\nAlthough he does pause, and after a moment of consideration, produces a vial of glowing blue liquid. He wastes no time in jabbing it directly into your crotch, but somehow it doesn’t hurt. There’s a sense of impact, sure. You’re aware of a strange warmth, then in a in single, powerful contraction, a powerful ache bursts forth from your body.\n\n<b>You grew a cock!</b> It wobbles with its own weight, drooling out masculine slickness.");
		output("\n\n<i>“There. Not so boring now.”</i>");
		pc.createCock();
	}
	output("\n\nGiving you a momentary reprieve while he fumbles with his buckles and fasteners, shucking his gear off in a desperate frenzy, you glance around wearily. All around you the same situation is taking place, korgonnes being overcome by stronger and better-armed milodan. The war is lost, and you’re just one of many among the defeated. Helpless prey.");
	output("\n\nHaving dispensed with all of the unnecessary clothing, the milodan turns back to you with an eager gleam in his eye and a frighteningly erect cock, so stiff you can practically feel it throbbing from here. His intentions leave little to the imagination, and when you feel his strong, muscular arm on you, you can already see where this is going. He grabs your face and, squishing your cheeks, inspects your state of consciousness, staring into your eyes. You give him a hateful glare and spit on his hand, but he ignores both, apparently satisfied with the fact you’re still awake.");
	if(!pc.isTaur() && pc.tallness < 6*12+6) 
	{
		output("\n\nThe giant milodan has no trouble at all lifting you with one arm, dangling you helplessly in the air. You brace yourself for the inevitable violence, closing your eyes, but it never comes. Instead, what you feel is yourself being gently dropped onto the base of his dick. Opening your eyes, you’re treated to the sight of his cock stretching up from between your legs, coming up to");
		if(pc.tallness < 5*12) output(" your head");
		else if(pc.tallness < 5*12+6) output(" your chest");
		else if(pc.tallness < 6*12) output(" your ribs");
		else output(" past your belly button");
		output(". Wrapping both of his hands around your [pc.hips], it’s very clear what’s going to happen after the graphic demonstration and all you can do is brace yourself for it.");
		output("\n\nIt doesn’t help. He lifts you up and slams you down on his fat dick so hard your breath is mercifully knocked from you, causing you to focus on breathing rather than the sensation that your body is now host to something that’s definitely too big to belong. As he begins pumping, though, it’s impossible to ignore - your halting breath comes out in moans and gasps as he fucks you with a rhythm that has your [pc.vagOrAss] twitching and squeezing around him, only enhancing his pleasure.");
		if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
		output("\n\nHaving his dick inside you drives all other thoughts from your head, leaving you with only the sense of embarrassing, debased pleasure from being thoroughly dominated by your captor. You can’t help it - just the way he uses his hips to pound you from below has you wanting to scream, his harder thrusts forcing submissive, high-pitched moans bordering on girly shrieks from your throat. The way his soda can sized cock has you stretched out is almost painful, but it feels too good to even notice.");
		output("\n\nHe hammers your " + (pc.hasVagina() ? "cunt":"asshole") + " so hard that when he pauses momentarily, you don’t even question it, just silently thank him for an opportunity to breathe. Leaving you impaled on his cock, he reaches under your [pc.thighs] and holds your legs up - then, in one swift movement, swings his hands up over your shoulders and links them behind your head. Having caught you in a full nelson, he grunts in pleasure when he begins to pump you again. With your limbs in his grip and his cock in your " + (pc.hasVagina() ? "pussy":"ass") + ", you’re completely helpless while he uses you like nothing more than a toy.");
		output("\n\nCrumpled up and compressed in his grip, he equally brings his hips up and slams you down onto his dick to fuck you, eliciting animalistic screams of pleasure and lust from your mouth. It was hard to admit it, but easier now that you have: being held like this and savagely fucked as if you were a masturbatory aid feels fucking amazing. This hulking brute of a man has you cumming your brains out with no effort at all, ");
		if(pc.hasCock() && !pc.hasVagina()) output("[pc.cum] spattering onto the ground from your wildly flopping cock, half-erect as you get an assful of milodan");
		else if(pc.isHerm()) output("[pc.cum] spattering onto the ground from your wildly flopping cock, your cunt clenching as you get a pussyful of milodan dick");
		else if(pc.hasVagina()) output("femcum dripping down the milodan’s cock, your cunt desperately gripping him even as he forces himself deep inside");
		output(".");

		output("\n\nDeep enough for his massive cock to " + (pc.hasVagina() ? "show between your [pc.hips]":"distend your [pc.stomach]") + ", the war-lion fucks you better than he has any right to, blowing your mind over and over. You can feel his rhythm throughout your entire body, your muscles aching from being held immovably in this position while he recklessly abuses your fuckhole. You’ve been cumming for close to a minute straight, moaning so loudly it’s practically an ongoing wail signalling how much of a slut he’s making you into.");

		output("\n\nTo make matters worse or maybe better, you can feel him beginning to tense up all around you, his bestial grunts growing louder and his motions getting wilder as he gets closer to cumming, to unleashing that hot, sticky load into your " + (pc.hasVagina() ? "wet, willing pussy":"tight, accommodating asshole") + ". With a loud growl, he slams you down on his dick as deep as he can get it, right as it begins to throb and flex inside you.");
		output("\n\nYour cries of pleasure become soft moans as the soothing feeling of being inexorably filled with warm cum washes over you, his bountiful loads filling you up so fast each release quickly begins to spurt from your [pc.vagOrAss]. The intense sensation of being stretched taut by the milodan’s cock begins to fade as his sticky spunk fills you up, driving you to realize with some shame just how comfortable you are speared on his prick, despite your positioning. Almost as if being held like this and used was natural to you.");
		output("\n\nApparently satisfied, the milodan begins to withdraw with a sigh and relinquishes his intense hold on you, his cock sliding from your gaping hole even as your body defensively tries to close it, clenching down on him as he escapes from its grip. With a moan, you find yourself miserably wondering about your immediate future until you realize the milodan is still just standing there, looking at you. His eyes rove over your body hungrily and it’s only then that you see that fat, swollen cock of his is still nice and hard, clearly ready to go again.");
		output("\n\nYou can’t resist - you’ve already lost, and now the only thing in your power is the ability to enjoy what comes next. Hanging from his grip with one arm free, you gingerly reach out and touch the tip of his dick, gently rubbing him as you submissively look up into his face. You can’t be sure, but you think he grins.");
		output("\n\nThe next half an hour is a blur. He takes you deeper into the hold, yes, but he does so while he has you impaled on his cock, holding you there with one strong, muscular arm and fucking you from below with every step. You helplessly cum all over his cock three times before you even make it to your destination, a bare room with naught but a bed inside it. He tosses you onto it and immediately begins to rut you so hard you scream, not in pain or pleasure but in final recognition that you’re truly just a toy, to be ridden at your captors’ convenience. When he busts a massive nut inside your " + (pc.hasVagina() ? "fertile channel":"asshole") + " and flips you over to start fucking your face, you eagerly accept him inside, greedily opening your throat in the hopes of getting more of his hot, virile jizz inside your stomach.");
		output("\n\nEventually, you can’t keep up with his insane stamina. You pass out with your [pc.ass] in the air, your face down and his massive cock embedded deeply inside you, serving your purpose as well as you can. You don’t know what will happen next, but you have a pretty good guess.");
		processTime(40);
		if(pc.hasVagina()) pc.loadInCunt(enemy,0);
		else pc.loadInAss(enemy);
		pc.loadInMouth(enemy);
		pc.orgasm();
		//go to bad end
	}
	//Nontaur, >6’6
	else if(!pc.isTaur())
	{
		output("Reaching under your armpits, he tries to tug you upwards but can’t, owing to your size. With a disappointed grunt he throws you back on the ground, knocking the breath out of you and leaving you gasping for air. Staring upwards and trying to stop the world from spinning, his shadow falls across you as he stands directly above you and then suddenly sits, planting his heavy, furred balls right on your nose and squishing it.");
		output("\n\nThe musk hits you immediately. With as many stims as this guy is probably on, he’s coated in sweat and no doubt surging with adrenaline, and you can <i>feel</i> the evidence in the air. His scent permeates your nostrils like tendrils of lust, his masculinity invading your mind like it’s about to invade your body.");
		output("\n\n<i>“Lick or punish,”</i> the war lion grunts, his speech thickly accented but meaning perfectly clear. You aren’t totally certain what punishment might entail, but frankly it’s probably best not to push.");
		output("\n\nYour tongue hesitantly slides from between your [pc.lipsChaste], pressing against his sweaty fur and getting your first taste of the war lion’s fat, round balls. He grunts in approval from above you, clearly pleased with your choice, and presses down. Given no alternative and starting to think he’d happily suffocate you down here, you start to lick him properly, wetting his soft balls. Tasting your captor’s ballsweat is incredibly demeaning, but seemingly temporary. After half a minute or so of shuffling your tongue around his nuts, he raises his hips over you and shuffles down your body slightly on his knees.");
		output("\n\n<i>“No teeth,”</i> is all the warning you get before he presses his soda can sized cock against your tongue and suddenly thrusts into your mouth, his powerful hips generating enough force to shove it right up against the back of your throat in one go. Eyes bulging, you’re forced to lie there helplessly with the massive milodan on top of you as he works his way further down your throat with slow, incremental thrusts and grunts until your neck is positively bulging with his dick, stretched to absolute capacity and barely allowing for breath. It’s only on his outstroke that you get a ragged inhale that’s swiftly cut short by his sloppy re-entry.");
		output("\n\nTrying to dislodge him for even just a second to get some air, the milodan doesn’t even notice your hands weakly beating at his massive thighs, too absorbed in throatfucking you into submission. It’s working, too - already beaten down and then deprived of air, you’re hardly in the position to fight back. You find yourself hoping he’ll just hurry up and bust the massive nut he has in those balls just so you can breathe, and start sucking at his infernally large cock just to hurry the process up. You’re not even sure if it helps, but you’ll do anything at this point.");
		output("\n\nYou can feel his breathing becoming more and more labored, but between his groin pressed into your face and the rush of blood in your ears growing steadily louder, your grasp on your senses is getting tenuous. Your vision blurry and your hearing dull, all you can pay attention to is the motion in your fuck-slick throat, being treated like like a whore’s pussy by this overgrown hulk with nothing more on his mind than blowing his load into your stomach.");
		output("\n\nLuckily, right when you think you’re about to lose it, he withdraws from your throat entirely and you get a long, deep gasp of air, blessed air, before suddenly your windpipe is shut off again and he’s back inside you as deep as he can get. He withdrew because he was about to cum, and as your senses return you can feel it firsthand. Your throat grows warmer as his thick, sticky seed begins to spray down it, his cumvein throbbing hard against the inside of your neck while he groans in relief.");
		output("\n\nYou swallow it gratefully, silently thanking him for allowing you to breathe even as you chug down his spunk. Even when he slowly withdraws from your throat, granting you the gift of regular breathing that doesn’t make your ribs ache with effort, you continue to suckle his cockhead until he truly has nothing more to give you, making a display of swallowing his seed down. When he stands up off you, you keep your mouth open for a few seconds just to make sure he really knows you sucked down <i>all</i> of it, that you were good and don’t need to be punished.");
		output("\n\nGathering you up and supporting you enough to limp your way into the hold, he thrusts you into a room and has his massive cock buried a foot into your [pc.asshole] in seconds. On all fours and groaning somewhere halfway between pain and pleasure, it’s all you can do just to support yourself on your hands while he mercilessly abuses your asshole, stretching it out around his giant dick.");
		pc.buttChange(enemy.cockVolume(0));
		output("\n\nWhen he cums, he " + (pc.hasHair() ? "reaches forward and roughly grabs your [pc.hair]":"grabs you around your [pc.hips]") + ", pulling you upwards and into him with a grunt. With his other hand, he");
		if(pc.hasVagina()) output(" shoves two oversized fingers into your [pc.pussy] and has you screaming in orgasm, dancing on his palm while");
		else if(pc.hasCock()) output(" roughly jacks your [pc.cock] off, bringing you to an irresistible orgasm even as");
		output(" he dumps his load deep inside you.");
		output("\n\nBoth of you panting and covered in sweat, he pushes you off onto the bed and wipes his brow, considering his next move. Your asshole openly gapes and winks at him, utterly ruined by his size and dripping with his seed. With your face in the sheets as he gropes a handful of your asscheek, you can only hope the next penetration will be easier.");
		output("\n\nThe war-lion, having won you as a spoil of war, fucks you again and again. Your body absolutely covered in spunk both inside and out, you resemble a well-used sex toy, which really isn’t far from the truth. You feel you consciousness slipping away from you after a couple of hours of hard sex, unable to hold on as the reality of being a live-in fuckhole bears down on you. You can’t say what tomorrow will bring, but you have a pretty good guess.");
		processTime(30);
		pc.loadInMouth(enemy);
		pc.loadInAss(enemy);
		pc.orgasm();
	}
	//bad end
	else
	{
		output("Eyeing your tauric form lying on its side, the milodan walks to your hind half while you watch in trepidation. As he crouches down to see what he’s working with, you realize you must be a complete novelty to him. He’s probably never seen a ‘taur in his life if he’s been living in a village on Uveto his whole life, let alone fucked one... though no doubt the latter is about to change.");
		output("\n\nSure enough, he lifts your rear hindleg and exposes your [pc.vagOrAss], ");
		if(pc.hasCock()) output("not to mention your [pc.cocks]");
		else output("ready for the taking");
		output(". You suspect your larger capacity for taking dick owing to your biology is about to be your undoing, as he slips two large fingers right into your " + (pc.hasVagina() ? "pussy":"ass") + " with hardly a hitch, seemingly surprised by how much success he has. Then he’s on his knees, and you can’t see what he’s doing.");
		output("\n\n<i>“Oh, fuck!”</i> you scream raggedly, half in surprise at his abrupt taking of your " + (pc.hasVagina() ? "cunt":"asshole") + " and half in dismay at the fact that having his giant cock pressing at your insides from behind feels really, <i>really</i> good. He’s so fucking wide he’d give any breeding stud a run for their money, not to mention so hard it’s like having a fucking pole stuffed in you - a really warm, veiny pole that’s threatening to push you over the edge of orgasm within a couple of minutes.");
		if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
		output("\n\nHe fucks you experimentally, with slow movements of his wide, powerful hips at first, but realizes very quickly he doesn’t need to bother with any of that boring shit. In less than a minute he’s pounding your fucking " + (pc.hasVagina() ? "pussy":"ass") + " hard enough to make you scream, your cries going practically unnoticed by anyone else in the afterbattle haze, but they sound fucking loud to <i>you</i>. It’s embarrassing enough to get so thoroughly dominated, but fuck if enjoying it so much doesn’t take it the extra mile. You’d hang your head in shame if you weren’t busy bellowing in ecstasy, your mouth stretched in a wide ’O’ as you begin to feel yourself cum all on your own.");
		output("\n\n<i>“Huhhh! Hnnnnnngh!”</i> you grunt through grit teeth, trying and failing to keep yourself quiet during your massive orgasm. <i>“Ohhh, fuuuuck!”</i>");
		if(pc.hasCock() && !pc.isHerm())
		{
			output("\n\nYour [pc.cockBiggest] spurts spunk so violently it almost hurts to cum, your asshole clenching around the milodan’s cock so hard he has to spank you to make you reflexively loosen up again");
			if(pc.cockTotal() == 2) output(", your other cock drooling a continuous stream");
			else if(pc.cockTotal() > 2) output(", your other cocks drooling continuous streams");
			output(". That doesn’t stop you from flexing your flanks and thrusting forward out of instinct, though, the hazy idea that you should be breeding something when you cum driving you onwards. All you really accomplish is looking like a huge fucking slut though, what with the way you’re wildly thrusting back and forth and cumming like a fountain while the milodan remorselessly rails your asshole");
		}
		else if(pc.isHerm()) output("\n\nYour [pc.pussy] clenches down on the milodan’s cock so hard he almost stops for a moment, grinding against the friction, but in less than a second he’s beaten you and your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " spurting all over your stomach, marking you bodily as a slutty bitch who can’t help but cum when you get savagely fucked. Unable to fight back, you instead ball your fists up and scream in agonizing pleasure, your dignity circling the drain even as your wet, hungry cunt gets brutally filled with milodan cock");
		else if(pc.hasVagina()) output("\n\nYour sloppy cunt involuntarily clenches down on the milodan’s massive cock, but all that accomplishes is an increase in the friction he encounters, inadvertently making you all the more susceptible to the sensations emanating from your hind half. Doubled over and screaming, you cum so explosively your voice cracks and no sound comes out of your mouth. Your juices splatter everywhere, fucked from your pussy by the savage motions of the milodan, rolling down his shaft and dripping from his balls like a loving caress of a horny slut: you");
		output(".");
		output("\n\n<i>“Bitch,”</i> he grunts from behind you, the first word he’s said in minutes, and you can’t even disagree. You’re too busy fighting to keep your eyes from rolling back in your damn head.");
		output("\n\nHe fucks you so hard you lose yourself in the multiple orgasms, the sensation of being brought to the peak so many times leaving you shivering with euphoria. You don’t even notice he’s about to cum until it happens, thick, heavy ropes of spunk shooting into your " + (pc.hasVagina() ? "womb":"asshole") + ", defiling it and marking you as his bitch. You groan half in despair and half in recognition of the fact that having his hot spunk inside you feels <i>amazing</i>, good enough to push you lightly over the edge and have you weakly cum one last time before he pulls out.");
		output("\n\nYour fuckhole gaping and dripping spunk, you’re in no position to mentally resist as he equally drags and half-walks you to a spare room like you’re nothing more than a beast, whereupon he pushes you down on your forelimbs and abruptly shoves his balled-up fist inside your freshly-fucked " + (pc.hasVagina() ? "cunt":"asshole") + ". <i>That</i> gets a nice, long scream of surprise and pleasure - how does that feel so good - out of you, then a loud groan as he begins to make you cum all over again. Your unique morphology is a novelty to this man, something to be exploited over and over for fun, and you can already tell he’s got a lot of ideas in mind.");
		output("\n\nEventually, he tires of thrusting his muscular arm to the elbow inside your sloppy hole and pulls out, instantly replacing it with his cock. Incapable of putting up anything even resembling a fight so thoroughly has your spirit been fucked out of you, you slowly let your back legs spread and sink to the ground, bringing the milodan lower until he can rest on his knees and fuck you from behind. The path of least resistance taken, you let your front half fall to the ground and the darkness take you while he pummels your hindquarters, spanking you even as you pass out. You can’t say what tomorrow will bring, but you have a pretty good guess.");
		//bad end
		processTime(30);
		if(pc.hasVagina()) pc.loadInCunt(enemy,0);
		else pc.loadInAss(enemy);
		pc.loadInMouth(enemy);
		pc.orgasm();
	}
	flags["WARGII_BADEND_FUCKED"] = 1;
	clearMenu();
	addButton(0,"Next",wargiiBadEnds);
}

//Win
public function winVsWaryLiono():void
{
	author("Wsan");
	if(enemy.HP() <= 1) output("Beaten, the milodan falls to his knees, trying desperately to get back up by bracing himself with his sword, but to no avail. The heavy combat gear he’s wearing is working against him now, and he doesn’t have the strength to counteract it.");
	else output("Beaten, the milodan falls to his knees, trying to strip off his pants so he can get at his dick, but his movements are too sluggish and slow and his fingers too uncoordinated. He whines in desperate frustration.");

	//output("\n\n{hostage stuff}");
	//output("\n\nHostage freed, you turn your attention back to the defeated milodan");
	output(" You watch for a moment just to see what he does, and shake your head");
	output(". He’s planted his sword in the ground and is trying to raise himself back to his knees, but failing pretty spectacularly. Striding towards him, he topples over backwards before you even reach him, landing on his backpack with a nasty crunch. Dazedly seeing you standing above him, he tries to hit you but you leisurely block his arm with a foot and tap it back onto the ground. You can see his eyes are crossed and he’s barely holding it together, and bend down to lightly slap him across the face a couple of times.");
	output("\n\n<i>“You in there, buddy?”</i> you ask.");
	output("\n\n<i>“Kill you,”</i> he moans, rolling onto his side and trying to force himself upwards.");
	output("\n\n<i>“Yeah, probably not happening,”</i> you inform him, rolling him back.\n\n");
	processTime(3);
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(1000) >= 0) addButton(0,"Face Fuck",penisRouter,[faceFuckYonderMiloBoi,1000,false,0],"Face Fuck","Ram [pc.oneCock] down his throat until you’re satisfied.");
			else addDisabledButton(0,"Face Fuck","Face Fuck","You’re too well-endowed for this.");
			if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(2,"Fuck Ass",penisRouter,[fuckBigBoiMiloBooty,enemy.analCapacity(),false,0],"Fuck Ass","Fuck his ass.");
			else addDisabledButton(2,"Fuck Ass","Fuck Ass","You’re too well-endowed to fuck his ass!");
		}
		else 
		{
			addDisabledButton(0,"Face Fuck","Face Fuck","You need a penis for this.");
			addDisabledButton(2,"Fuck Ass","Fuck Ass","You need a penis for this.");
		}
		if(pc.hasVagina()) addButton(1,"Ride Face",rideDatBoisFace,undefined,"Ride Face","Plant your pussy on his face and ride him until he satisfies you.");
		else addDisabledButton(1,"Ride Face","Ride Face","You need a vagina for this.");
		addButton(3,"Ride Cock",vaginaRouter,[rideDaWarlionCawwwwk,enemy.cockVolume(0),1,0,false],"Ride Cock","Ride this big boys dick anally" + (pc.hasVagina() ? " or vaginally":"") + ".");
		addButton(4,"Suck Cock",suckThatMiloCock,undefined,"Suck Cock","Suck the war-lion’s cock.");
	}
	else
	{
		addDisabledButton(0,"Face Fuck","Face Fuck","You aren’t turned-on enough.");
		addDisabledButton(1,"Ride Face","Ride Face","You aren’t turned-on enough.");
		addDisabledButton(2,"Fuck Ass","Fuck Ass","You aren’t turned-on enough.");
		addDisabledButton(3,"Ride Cock","Ride Cock","You aren’t turned-on enough.");
		addDisabledButton(4,"Suck Cock","Suck Cock","You aren’t turned-on enough.");
	}
	captiveRescueButton(5);
	if(fightHasCaptive()) addDisabledButton(14,"Leave","Leave","You can’t leave the captive behind!");
	else addButton(14,"Leave",wargiiLeaveCombatEnd);
}

//[Fuck face]
//requires dik
public function faceFuckYonderMiloBoi(x:int = 0):void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("Tugging his helmet off, you study his dazed, weary expression and deem him not much of a danger to anyone, let alone yourself.");
	if(pc.isBimbo()) output("\n\n<i>“Don’t get all bitey or I’ll have to punish you,”</i> you caution him, pointing at his sword. <i>“That would be so bad!”</i>");
	else output("\n\n<i>“Bite me and I’ll cut your fucking dick off,”</i> you tell him, pointing at his sword. <i>“Understand?”</i>");

	output("\n\nHe doesn’t look happy about it, but all’s fair in love and war. Besides, he has it coming.");

	if(!pc.isTaur()) output("\n\nPulling his snout open, you " + (pc.cocks[x].cLength() > 10 ? "get a glimpse of his eyes widening in shock as he catches sight of the size of your erect cock":"park yourself on his chest") + " and smugly snicker before shoving yourself right down his throat.");
	else output("\n\n<i>“Open that mouth,”</i> you command him as you position yourself over his face. Looking down, you get a nice look at his eyes widening when he catches sight of your [pc.cock " + x + "] hardening, but it’s far too late for him to do anything about it. Dropping your hips, you groan in satisfaction as you shove yourself right down his throat.");
	output("\n\nHe gags immediately, but you don’t care, pressing your hips down into him and forcing him to adapt. Spit bubbles form around his lips as you withdraw to let him breathe, then cut short his inhale by shoving yourself back in.");
	if(pc.isBimbo()) output("\n\n<i>“Awwww,”</i> you moan in pleasure");
	else output("\n\n<i>“Nnnngh,”</i> you grunt in approval");
	output(", riding his face for all he’s worth. " + (pc.isBimbo() ? "<i>“Keep still, cutie!":"<i>“Just hold still and take it, bitch.") + "”</i>");
	output("\n\nYou adjust your seating position to sit right on his face, drawing your hips up and slamming them down, listening to the milodan’s wet, noisy gags as he struggles to cope with his throat being full of cock.");
	output("\n\n<i>“Oooh, fuck, that’s good,”</i> you groan, " + (!pc.isTaur() ? "reaching down to hold him in place by his hair. <i>“Keep sucking, you look so hot when your throat bulges like that.”</i>":"revelling in his tight, warm throat. <i>“Keep that up and you’ll get a nice, warm prize in your stomach...”</i>"));
	output("\n\nMuscled though he may be, he’s still just a bitch when he’s got several inches of dick swelling his neck outwards." + (!pc.isTaur() ? " You gingerly prod his neck just to check, and, yep - you can definitely feel your hand. That’s pretty good, actually. You wrap your fingers around his throat and, careful not to choke him any more than you already are, begin fucking him in earnest":" Having turned him into your own pliable, restrained little fuckboy is <i>hot</i>, and you’re more than happy to indulge yourself in the fantasy. After all, he has it coming") + ".");
	output("\n\nBefore long you find yourself wildly slamming your hips down into his face, your fucktoy long having given up trying to resist or keep you out of his throat. His face is a mess, the fur around his mouth matted with saliva and precum, his pride taken from him and substituted with a dick in his mouth.");
	output("\n\nYou groan in release when you cum the first time, your" + (pc.balls > 0 ? " cumtanks right up against the milodan’s face and throbbing with every ejaculation":" [pc.cockHead " + x + "] swelling slightly as you cum as deep as you can inside him") + ". Your [pc.ass] tenses with the effort of orgasm, flexing every time you unleash another spurt down his throat.");
	output("\n\nWhen you withdraw, the milodan turns his head to the side and lets the excess run from his mouth. You let him breathe for a while, your [pc.cock " + x + "] stirring restlessly. It’s hard to resist going again, and watching his lips drip with your seed quickly evaporates your reason to do so.");
	output("\n\n" + (pc.isBimbo() ? "<i>“Silly puppy!”</i> you giggle, putting a hand over your mouth. <i>“I’ve still got like, sooo many loads for you to swallow!”</i> Stroking your cock, you hover your hips over his face and angle yourself downwards. <i>“Open wiiiide...”</i>":"<i>“Alright, puppy, enough rest,”</i> you tell him, stroking your cock. With your hips above his face, you angle yourself downwards. <i>“Open wide, bitch.”</i>"));
	output("\n\nWith his throat lubed by your [pc.cum] and spending a lot less time gagging, fucking the war-lion’s face proves to be a worthwhile use of time. You spend the next few minutes cumming almost whenever you want, busting several nuts’ worth of spunk into his tummy until, finally, you can feel he’s on the edge of unconsciousness. Pulling out, you " + (!pc.isTaur() ? "jack yourself off":"aim your spurts") + " all over his chest and face as his eyes flutter closed. Should be a nice reminder of who owns him when he comes to.");
	//main menu
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	enemy.loadInMouth(pc);
	output("\n\n");
	wargiiFightWinRouting();
}

//[Ride face]
//requires puss, non-taur
public function rideDatBoisFace():void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("You tug the dazed milodan’s helmet from his head and survey his expression. He looks pretty out of it. Sitting on his chest, you give him another couple of cursory slaps until his eyes are more or less honed in on your face.");
	output("\n\n<i>“I’m going to ride your face,”</i> you tell him, jabbing his chest with a finger, <i>“and if you don’t use that tongue of yours to make me cum I am going to be extremely unhappy.”</i>");
	output("\n\nYou indicate his sword, embedded in the ground a couple of feet away.");
	output("\n\nWhen you " + (!pc.isCrotchExposed() ? "disrobe and ":"") + "present your [pc.pussy] to the milodan, he seems to gain a bit of vigor. Whether guided by instinct or desire, his tongue rolls from his mouth all the same, and you groan in pleasure as it laps at your lips.");
	output("\n\n<i>“Ooh, yeah,”</i> you moan, shuffling up his torso until you’re sitting right above his face. <i>“Good boy. Now worship me, doggy.”</i>");
	output("\n\nTo his credit, he does exactly what he’s told. Running his hot tongue up and down your slit before momentarily plunging it inside to lick up every bit of wetness you have to offer, he serves his master. A stifled grunt of satisfaction escapes your lips, revelling in the eager-to-please milodan’s willingness. Some instincts never change, you guess.");
	output("\n\nIt doesn’t take long for you to start feeling the weightlessness between your hips, groaning as you rub your [pc.clits] all over the war-lion’s tongue, your stomach tensing sharply with every grinding contact.");
	output("\n\n<i>“Uuuugh!”</i> you cry out, hands firmly wrapped in the milodan’s hair as he sucks and licks at your spasming pussy. <i>“God, fuck! Nnnnnngh!”</i>");
	output("\n\nDoubled over and panting, you can still feel his tongue lapping at your oversensitive pussy, and you don’t see any reason to refuse him. Gritting your teeth so as to not scream in ecstasy, " + (pc.isSquirter() ? "you squirt so hard the milodan has to stop to swallow before he can even continue":"you cum so hard the milodan’s tongue stops inside you, unable to move as you squeeze down on him") + ".");
	output("\n\n<i>“Fuckfuckfuckfuckfuck,”</i> you pant, desperately bucking your hips back and forth across his face, lowering yourself to the point you’re sitting on him. <i>“Nnngh! Guuuhhh! Fuuhhuuck...”</i>");
	output("\n\nWith a flushed, sweaty face, you look down at the milodan and grin. <i>“Ooooooh yeah, good doggy... now do it again, and harder. C’mon!”</i>");
	output("\n\nJerking your [pc.hips], you enjoy the sharp pangs of pleasure that radiate throughout your [pc.pussy]. You throw your head back in pleasure and scream amidst the chaos, pulling the war-lion’s hair and shoving his face into your sopping wet cunt. By the time he passes out, you’ve cum half a dozen times just using his snout. Letting him fall back limp, you lift yourself off the damp, matted fur of his face with a satisfied sigh. He might not have been able to beat you in a fight, but at least he was good for something.\n\n");
	enemy.girlCumInMouth(pc);
	processTime(30);
	pc.orgasm();
	wargiiFightWinRouting();
}

//[Fuck ass]
public function fuckBigBoiMiloBooty(x:int = 0):void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("<i>“Why don’t you slip out of that and let me make you more comfortable, doggy?”</i> you ask with a predatory smile, bending down and undoing his fatigues. <i>“You’ve got something in there I want.”</i>");
	output("\n\nWith a few deft movements, you have the milodan’s pants around his knees and his ass in the air, having flipped him on his stomach and shoved his legs under him for support.");
	output("\n\n<i>“Isn’t that more comfortable?”</i> you say, moving around behind him. <i>“Well, you might be a little cold even with all that fur, but that’s not going to be a problem for long...”</i>");
	output("\n\nTarget in your sights, you can’t help but lick your lips. This well-muscled military boy has <i>definitely</i> been doing his squats. His ass is firm, athletic, but most importantly, large and rounded. Really, you have to wonder what the milodan military is like if all their men are this hot, but that’s conjecture for another time. You also note his soda can sized cock, erect and straining against his stomach.");
	output("\n\n<i>“Too bad,”</i> you murmur, mostly to yourself. <i>“Maybe I’ll take some pity later.”</i>");
	output("\n\nFor now, you’re more interested in " + (!pc.isTaur() ? "getting down on your own knees":"positioning yourself behind him") + " and lining up your [pc.cockHead " + x + "] with his tight little asshole, winking a little in the cold wind. He shivers when you press against his ring, though whether out of fear at the sensation or the cold, you can’t say. What you do know is that he’s going to be a very, very tight fit around your [pc.cock " + x + "] and with all those muscles, he’s going to squeeze down on you like a vise. You can’t stop yourself from grinning in eagerness.");
	output("\n\n<i>“One-two-”</i> you count, then shove yourself forward immediately, catching the milodan offguard.");
	output("\n\nHe yelps in pain, your ");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output("flat, blunt head");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output("pointed tip");
	else output("cockhead");
	output(" sinking a few wonderfully tight inches into the milodan’s ass. You give him a ");
	if(!pc.isTaur()) output("nice spank across his ass just to remind him who’s in charge while you wait a ");
	output("few seconds for him to adjust, clearly unused to such invasions of his ass, but that’s all he gets. Rather than withdrawing for another thrust, you just press inexorably forward, eliciting an ongoing groan from the milodan as you work your way deeper into his blessedly warm insides.");
	pc.cockChange();
	output("\n\n<i>“Aww, not happy with your treatment?”</i> you ask him, making an exaggerated sad face. <i>“Too bad, bitch. I know you’d be doing the same if you’d beaten me, and probably worse. Now quit whining and accept you’re my sexy little slut for the next few minutes.”</i>");

	output("\n\nTo his credit, he does quiet down as you get deeper and deeper, your length working its way through his guts until ");
	if(pc.cocks[x].cLength() < 12) output("you’re completely hilted. You let out a groan of satisfaction when your " + (pc.balls > 0 ? "[pc.balls] come to a rest":"groin smacks") + " against his fat ass, inwardly thrilled you’re going to get to recklessly fuck him with your entire length");
	else if(pc.cocks[x].cLength() < 23) output("you have over a foot of your fat, swollen cock inside his depths. Groaning in need, you shuffle forward a couple of inches to get the leverage required to get the rest in, pulling your hips " + (!pc.isTaur() ? "back and bucking forward":"up and thrusting downwards") + ". His stretched-taut asshole greedily swallows your entire length without a hitch, and <i>fuck</i> it feels amazing. You take a few seconds just to moan in pleasure with your " + (pc.balls > 0 ? "[pc.balls]":"groin") + " resting against his fat ass, having subdued his complaints with your massive cock");
	else if(pc.cocks[x].cLength() < 35) 
	{
		output("you’ve got the first foot of cock inside him, spreading that tight little asshole taut around your massive prick. Getting closer as you pull your hips back, you drive forward and gain another half a foot of ground deep inside him, grunting in deep satisfaction - you can scarcely believe your luck having found someone able to actually take so much of you in, and the dream of getting your entire cock inside this sweltering hot asshole is still within reach.");
		output("\n\nWith a particularly strong thrust, you force his stretched-wide asshole to swallow your entire length, letting out a loud grunt of both pleasure and domination. Wrapping your hands around his hips, you take a few seconds just to enjoy the amazing sensation of having your entire cock inside an accepting orifice and the way he’s desperately squeezing down on you, far too late to prevent your entrance." + (pc.balls > 0 ? " [pc.Balls] flush":" Groin pressed") + " against his fat backside, you sigh both in satisfaction and with eager joy at the fact you’re going to get to recklessly fuck this guy until you cum your brains out without worry of hurting him with your magnificent size.");
	}
	else if(pc.cocks[x].cLength() < 44)
	{
		output("you have just over a foot and a half of cock inside him" + (pc.balls > 0 ? ", your [pc.balls] swaying pendulously in the air between you and his fat, welcoming backside":"") + ". It’s going to be a very tight fit, but it just might be possible to get your entire behemoth length inside this massive milodan, thanks to his size.");
		output("\n\n<i>“Mmmm - bet you never thought of this aspect of being big, huh?”</i> you tease him, slowly working your way inside. <i>“Being able to fit three feet" + (pc.cocks[x].cLength() > 36 ? " and change":"") + " of fat, veiny alien cock in your ruined asshole. There’s a good little bitch.”</i>");
		output("\n\nRepositioning yourself a couple of more times, you successfully feed his greedy asshole more and more inches of your swollen cock until, with a massive final thrust, your " + (pc.balls > 0 ? "[pc.balls]":"groin") + " slap" + (pc.balls <= 1 ? "s":"") + " against the milodan’s fat, muscular ass as you sink your entire dick inside him.");
		output("\n\n<i>“Ohhhh, fuuuck,”</i> you groan in pleasure, steam coming from your mouth in the cold of Uveto. <i>“Your ass is fucking amazing. I wonder if you’d fit in my ship...”</i>");
	}
	else
	{
		output("you’ve fed at least two feet of swollen cock into his greedy asshole, absolutely ruining it in the process. When you take it out he’ll probably be gaped for the rest of his life, looking every bit like the buttslut you’re about to treat him as, but for now you have no such intention. All you care about is getting more of yourself inside this wonderfully warm, tight fuckhole and maybe getting a handful of that fat ass of his.");
		output("\n\n<i>“C’mon, bitch, just a little more,”</i> you murmur to him, shifting around to get deeper.");
		output("\n\nOver the next couple of minutes you manage to force another foot and a half of hyper-sized dick inside him, but you can’t get the full length in." + (pc.cocks[x].cLength() < 51 ? " What a shame, too - you only have a few inches left outside the giant milodan’s incredibly tight guts.":"") + " On the bright side, you’re really, really looking forward to being able to cum this deep inside someone.");
	}
	output("\n\nFinally, you start to withdraw from his ass, his tightness making it surprisingly difficult. His grip on your cock is incredibly firm, his abdominal muscles squeezing you as tightly as possible, and he makes an endearingly cute whining noise as you shift a few inches inside him. It’s his prostate, you realize, feeling a slight bump against your cumvein. He’s probably never experienced the joy of a prostate orgasm, one of the pleasures afforded to being a bottom bitch. With a grin, you decide to treat him to it. Reinforce his position at the very bottom of the hierarchy.");
	output("\n\n<i>“Good doggy,”</i> you tell him, beginning to slowly rub back and forth over the same spot, angling yourself so the protrusion of your cumvein hits it just right. <i>“Just lie there and you can get to cum with your ass.”</i>");
	output("\n\nIt doesn’t take long. His confused whines and yelps coalescing into a higher, louder moan, you can feel him start to shake around you as he begins to <i>really</i> clamp down on you, squeezing several times a second. The feeling is clearly beyond his control, his body running wild on autopilot, and with a grin you notice he hasn’t ejaculated at all - you’re too deep for it to be anything but a dry orgasm for him. Good. He can stay backed up, for all you care. If he gets to spurt any cum from that straining loser’s cock of his today it’ll be because you took pity on him.");
	output("\n\nIn the wake of his orgasm, you take the initiative and begin thrusting for real, eager to get off in the milodan’s guts. You want to feel him squeeze down on your cock, milk you from base to tip, all because you’re blowing a fat load in his ass. Working yourself up to a nice, solid rhythm, you grunt with every push into his asshole, slapping his cheeks every so often just to make him squeeze you.");
	output("\n\nBetween his incredible tightness and his tendency to clamp down on you any time you move, it doesn’t take much for you to cum. With a bestial roar, you slam forward, " + (!pc.isTaur() ? "pushing him flat on the ground and thrusting downwards into his exposed asshole while you begin jizzing in his deepest recesses":"forcefully lying atop him and pressing him into the ground, rocking your hips up and down while you jizz into his deepest recesses") + ".");
	output("\n\n<i>“Mmmmmnnggh, fuck!”</i> you grunt loudly, " + (!pc.isTaur() ? "squeezing his hips so tightly you leave finger imprints on him":"grabbing his shoulders so tightly you leave finger imprints on them") + ". <i>“Take it all, you little bitch!”</i>");
	output("\n\nRelentlessly pounding his ass, you noisily drain your " + (pc.balls > 0 ? "balls":"self") + " with the slap of flesh against his wobbly asscheeks. " + (!pc.isTaur() ? "Moving your hands up to his shoulderblades, you press him down":"Sitting atop him, you relax and leisurely hump away") + " as you empty the last of your cum all the way inside him, groaning all the while. You can feel him shuffling below you, his arms reaching downwards. He’s trying to get off with his hands, but he’s too woozy to get it right. You could flip him over and do it for him or leave him there with an assful of your jizz, unfulfilled.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Use Hands",handiesForWarLions,undefined,"Use Hands","Not even your enemies deserve to have blue balls.");
	addButton(1,"Don’t",noHandjobsForLionO,undefined,"Don’t","Don’t help him get off. He deserves blue balls.");
}

public function handiesForWarLions():void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("<i>“Alright, cutie,”</i> you tell him good-naturedly, <i>“since fucking your ass was so nice, I’ll let you get off just this once. Here.”</i>");
	output("\n\nRolling him over while you’re still inside him, you both grunt at the feeling of your cock swishing around his innards, and he reflexively clamps down on you once more. You give him a genial smile as you softly remove his hands from his dick, placing your own there in their stead.");
	output("\n\n<i>“Just relax,”</i> you say.");
	output("\n\nHe doesn’t bother putting up any resistance. Gently stroking his fat, swollen length from tip to base, he soon starts thrusting his hips upwards into your grip, to which you respond by holding him down and jacking him off a little more roughly. Soon, he makes an adorable whine as his stomach tenses and he lets loose a little spurt of cum from his tip. You keep it aimed upwards at his face, rubbing him as his whining slowly lowers in volume as he finally achieves ejaculation, cumming his backed-up spunk all over his own chest and belly. There’s a <i>lot</i> of it, but you suppose that’s to be expected when you made him get off from his prostate without letting him cum any of it out.");
	output("\n\n<i>“Theeere you go,”</i> you comfort him, his thrusts growing weaker as exhaustion overtakes him. <i>“Not a bad reward for a bitch, is it?”</i>");
	output("\n\nWith a final whimper and a massive spurt from his cock, he collapses back onto the ground and falls unconscious. You gently pull yourself out, wipe your hand and cock on his fatigues, and stand back up" + (!pc.isCrotchExposed() ? " after clothing yourself":"") + ". He’ll be fine if you leave him here, though he might have some explaining to do about the state he’s in if he’s found by his own faction.");
	output("\n\n");
	processTime(7);
	pc.changeLust(2);
	wargiiFightWinRouting();
}

public function noHandjobsForLionO():void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("He might be a great fuck, but there’s no need for you to sully yourself with the seed of a loser. Pulling out with some care, his whining gradually recedes in volume until he falls asleep, too exhausted to carry on. You leave him there with his cock still painfully erect and twitching, and his backside leaking [pc.cum].\n\n");
	wargiiFightWinRouting();
}

//[Ride cock]
//vaginal has chance of milo pregnancy
public function rideDaWarlionCawwwwk(x:int):void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("Without words, you pull down the war lion’s fatigues to inspect what you’re working with and get a nice surprise. His cock’s as thick as a soda can and as hard as steel, no doubt a side effect of all the stims this guy must be on. It looks absolutely perfect for a long, hard ride starring you and your [pc.vagOrAss " + x + "], and you can’t help but grin up at the moaning milodan. You give him a quick, cursory jerk and rub, squeezing his cock to get a bit of precum out, and drool on his tip just to hasten the process. Spreading it around with your fingers, there should be adequate lube for you to have no problem taking him.");
	if(!pc.isTaur()) output("\n\nPlanting your hands on his rock-hard stomach");
	else output("\n\nStanding over him with your hind half bent low");
	output(", you shuffle backwards until the tip of his swollen, leaking dick is pressing at your entrance, letting it catch as you slowly raise your hips until you’re sitting above his groin. He weakly glances downwards, no doubt curious about what you’re going to do him, and catches sight of your " + (!pc.isTaur() ? "devilish grin":"plan") + " right as you bring your [pc.ass] down on his abdomen with a slap. Letting out a loud groan he lays back, his head emphatically thudding against the ground as his arms weakly shake.");
	var loosineeeeeee:Number = pc.ass.looseness();
	if(x >= 0) loosineeeeeee = pc.vaginas[x].looseness();
	output("\n\n");
	if(loosineeeeeee < 3) 
	{
		output("You can barely stifle a scream, having bitten off far more than you can chew with what feels like a foot-long iron rod in your " + (x < 0 ? "ass":"pussy") + ". The pain of having your abused " + (x < 0 ? "asshole":"cunt") + " stretched around the base of his massive, throbbing cock makes you reflexively squeeze him as hard as you possibly can, biting your lip and trying not to let your eyes water. It takes a little while for you to properly relax, still desperately squeezing every so often when your body remembers to try and defend itself, but you eventually overcome the impulse.");
	 	if(pc.isTaur()) output(" Even with your tauric hind half, this guy is really something else.");
	 	else output(" You don’t bother resisting the impulse to moan like a whore as you slide down his rock-hard rod, your pliable " + (x < 0 ? "asshole":"cunt") + " stretching around him just enough that it’s a nice, snug fit. You give him a few cursory squeezes on the way down just to let him know his services are appreciated, your eyes hooded as you bite your lip in pleasure. You’re going to fuck this guy’s brains out.");
	}
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	if(loosineeeeeee < 3) output("\n\nDelicately l");
	else output("\n\nL");
	output("ifting yourself halfway up his length, you bring yourself down with a light, seductive moan, just getting a feel for the way the grooves and veins of his rigid pole rub against you just right.");
	if(pc.hasCock() && x < 0) output(" The way he feels against your prostate is fantastic, too, and you have no doubt you’ll cum like this at <i>least</i> once during your little tryst.");
	output(" He gives you a warm dollop of precum every time you raise your hips, too, easing his passage inside your nethers with every stroke. At this rate, you might be able to cum before he does.");

	if(loosineeeeeee < 3)
	{
		output("\n\nSince you’re somewhat inexperienced with taking massive insertions, you take it slow. Moaning as you slide down that fat, engorged pole, your " + (x < 0 ? "asshole":"pussylips") + " being stretched taut around its size, you think you might be able to get used to this. Having such a impressive presence inside you, feeling for all the world like it’s distending your stomach, actually feels pretty amazing. You find yourself wearing an eager grin midway through, marveling at your own fortune. Yeah, this is <i>your</i> cock, and you’re gonna ride the fuck out of it.");
	}
	else
	{
		output("\n\nWell-experienced with insertions of this caliber by now, you confidently begin to ride him in earnest, enjoying the sensation of him filling you completely in a way only certain people can. Taking such a massive cock is like a reward in itself, and you can’t help but sigh in happiness as you feel the depths of your " + (x < 0 ? "ass":"pussy") + " stretch taut around the milodan’s length. Pausing at the bottom of a very deep stroke, you give him a long, hard squeeze, flexing your " + (!pc.isTaur() ? "butt":"flanks") + " and rolling your [pc.hips] forward, and grin deviously when you hear a muted groan from " + (!pc.isTaur() ? "up front":"below") + ". Oh yeah, he <i>likes</i> that.");
	}
	output("\n\nYou begin raising your hips with a little more fervor now, leaning " + (!pc.isTaur() ? "forward":"down") + " to sneak a look at the war lion’s expression. He has an arm over his face, but with every slap of your [pc.ass] on his crotch you can feel him tense up under you and sure enough, he’s biting his lip and trying not to groan. All that really does is provoke you, though - now you <i>really</i> want to make him cum as hard as he can. Pressing back into him, you begin to roughly gyrate on his groin, stifling moans as you slide across his fur.");
	output("\n\nHe can’t help but let out a small, desirous whine after a few seconds of the treatment, and fuck if it doesn’t feel good for you too. As a reward of sorts, you begin fucking his iron hard cock again but make sure to spend some quality time at the bottom of his shaft dancing on his hips, just to hear those sweet little moans. It doesn’t take very long for you to join him, unable to help yourself as you let loose with groans from deep in your throat, your deep satisfaction rising to the fore.");
	output("\n\nYour lusty, sexual performance has both of you on the edge already, the slaps of your [pc.skinFurScales] on his fur getting wetter and wetter by the second until you can no longer hold it in. With a loud, satisfied moan, you sink to the bottom of his fat, throbbing dick and cum so hard your entire body shakes, squeezing and tensing all over. The milodan immediately follows suit, completely unable to resist the sensation after such rough, methodical titillation.");
	output("\n\nA dopey smile crosses your face while you enjoy the war lion’s submission, a massive spurt of his cum shooting deep inside your [pc.vagOrAss " + x + "] with every orgasmic squeeze around the base of his dick, practically wringing it out of him by force. He offloads what feels like an entire gallon of stored-up seed inside you over the course of half a minute, your moans growing more erotic by the second as his virility is impressed upon you. He must have <i>really</i> needed that...");
	output("\n\nJust when you think he’s finally done, he jerks and grabs your " + (!pc.isTaur() ? "hand":"foreleg") + ", taking you by surprise and tugging you down to lie on top of him with a forceful exhalation. Holding your " + (!pc.isTaur() ? "hand":"leg") + ", he gives it a squeeze even as he shoots his biggest load yet inside you, then goes limp and lets go. He’s unconscious - the work you put him through has taken its toll on the already-tired milodan, and even his extraordinary stamina wasn’t enough.");
	output("\n\nIn the end he did manage to make you cum before he did, even if it was only by a few seconds. You give his " + (!pc.isTaur() ? "abs":"cheek") + " an affectionate pat before you shakily get back to your feet and " + (!pc.isCrotchExposed() || !pc.isAssExposed() ? "reclothe yourself before leaving him there, unconscious but with a faint satisfied grin":"leave, the milodan lying unconscious behind you with a faint but satisfied grin") + ".");
	processTime(30);
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	pc.orgasm();
	output("\n\n");
	wargiiFightWinRouting();
}

//[Suck cock]
public function suckThatMiloCock():void
{
	clearOutput();
	showWarLion(true);
	author("Wsan");
	output("<i>“I bet there’s a huge fucking cock waiting for me under this gear,”</i> you murmur, eyes roving over his muscular form. <i>“Probably all hard and dripping, you stimmed-up psycho.”</i>");
	output("\n\nSure enough, after getting his pants down and taking a few seconds to admire the fat bulge through his underwear, you get his dick out in the open and wrap a hand around it. It’s extremely hot to the touch, slick with sweat and precum, and every bit as big as the rest of him. You can hardly fit your hand around the base. Stims or not, this guy is fucking rock hard.");
	output("\n\n<i>“Mmmf, fuck,”</i> you moan, bringing your other hand into play and squeezing him all the way from his thick, swollen base to his tapered tip, earning a dollop of precum for your efforts. <i>“Mmmph-”</i>");
	output("\n\nYou immediately lick up all of the precum dribbling from his cockhead, sliding your tongue down to his balls and taking them into your mouth with hooded eyes. They’re all sweaty and musky and just full of warm, churning need. You pay them reverence with your [pc.tongue], coiling it around and all over their surface while making tiny, slutty moans of desire. You oh-so-desperately want to taste what this hulking slab of meat is keeping inside them, but all things in good time.");
	output("\n\nYou lick every inch of his bulging balls clean, leaving the surrounding fur damp with saliva and his sack covered in wet kiss marks. You can hear him making grunts of pleasure above you, though he still seems too weak to direct you. No matter, you’re perfectly capable of getting him to nut all by yourself.");
	output("\n\nMoving your attentions back the crown of his cock, you pop your mouth around its fat, swollen head and suck like your life depends on it, earning a loud, deep groan of pleasure from the milodan. Unable to suppress a smile, you carefully take him deeper inside, avoiding your teeth as you begin to deepthroat him in earnest. He’s too weak to facefuck you, but you’re more than happy to simulate the experience for him.");
	output("\n\nTaking quick, shallow breaths, you violently bob your head up and down his entire length, slamming your nose into his groin while he begins to weakly jerk his hips. You can <i>feel</i> how close he is to getting off, and that he just needs one final push for him to let it all go inside your wet, warm mouth. Gripping the undersides of his muscular thighs, you push yourself into him with ever more vigor, turning your throat little more than an irresistible fuckhole for him to enjoy. Finally, your efforts pay off.");
	output("\n\nSummoning perhaps his last vestiges of strength, the war-lion desperately holds you down on his dick, whining in blissful, needy release while his cock throbs and pulses in your throat, ropes of jizz spattering your esophagus. You’re only too willing to wrap your mouth around the base of his fat, cum-spurting cock and suck as hard as you can, hollowing your cheeks to ensure he feels as good as possible. You eagerly swallow down load after load as he groans, so turned on that you cum the moment");
	if(!pc.isTaur())
	{
		output(" you ");
		if(pc.hasCock()) output("start to jerk yourself off, your [pc.cockBiggest] spurting wasted seed all over the ground.");
		else if(pc.hasVagina()) output("slide two fingers into [pc.oneVagina], your hips jerking as " + (pc.isSquirter() ? "you emphatically squirt all down your thighs":"femcum leaks down your thighs") + ".");
	}
	else
	{
		output(" you ");
		if(pc.hasCock()) output("rub yourself against the ground, your [pc.cockBiggest] spurting wasted seed all over your tummy.");
		else if(pc.hasVagina()) output("your squeeze your [pc.pussy] hard enough, your hips jerking as " + (pc.isSquirter() ? "you emphatically squirt all down your hindlegs":"femcum leaks down your hindlegs") + ".");
	}
	output("\n\n<i>“Glrgk- grrgl- glk- glk- glk,”</i> you choke, chugging the milodan’s spunk as he squeezes you between his legs, forcefully ejaculating straight down your throat with desperate, nose-squishing thrusts. <i>“Glllrrrglk-!”</i>");
	output("\n\nWhen he finally finishes using your face as a cumdump, he suddenly sags and falls back completely unconscious.");
	output("\n\n<i>“Holy shit,”</i> you gurgle, blinking teary eyes and looking down at the sleeping man with some awe. Slowly lifting yourself off his dripping, softening prick and taking deep breaths, you allow yourself a content grin after giving your lips a cursory lick. His massive load of thick, sticky cum warming your tummy, you’re not even left with a mess to clean up. Wiping your watery eyes and drool-covered chin, you get up and move on significantly more full.");
	processTime(30);
	pc.orgasm();
	pc.loadInMouth(enemy);
	output("\n\n");
	wargiiFightWinRouting();
}