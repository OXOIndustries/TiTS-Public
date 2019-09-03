import classes.Characters.ZilMale;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;
//Male Zil Encounter

// Flags:
// TIMES_LOST_TO_ZIL : TODO - FIXME

public function maleZilEncounter():void {
	showBust("ZIL");
	showName("FIGHT:\nMALE ZIL");
	//[First Time]
	if(flags["ENCOUNTERED_ZIL"] == undefined)
	{
		output("\n\nA humanoid of slight build emerges from behind a mammoth tree, wearing nothing but a satchel filled with pollen. His body is covered in a black, reflective skin, almost armor-like in appearance, and he moves with near liquid grace, hovering in the air with wings that flutter so fast they seem a blur. His eyes shine oil-black in the leaf-obscured shafts of sunlight that reach you here, alien and unknown.");
		output("\n\nYou step back and raise a weapon, expecting a fight, when an odd scent reaches your nostrils, musky and yet sweet at the same time. Staggered by the buzz of warmth that slowly rises in your veins, you barely notice a corner of the newcomer’s mouth crook upward in a smile. The plate on his groin recedes into the thicker armor above, and the shining alien exposes himself to you. He has a dangling, half-hard cock somewhere between five and seven inches long, completely obscured by foreskin. A shining, hairless sack dangles beneath it, pulsing slightly as his tool hardens and the intensity of his... scent doubles.");
		output("\n\nBeeping, your codex alerts you that this is a male of the ‘Zil’ race, and issues a warning about their pheromones. Well, it’s a bit late for that!");
		output("\n\nThe slender male buzzes closer and finally speaks, <i>“You’re rather " + pc.mfn("handsome","cute","attractive") + ", for an alien.”</i>");
		output("\n\n<b>It’s a fight!</b>");
		//Make sure monster statblock has eyes set to black!

		flags["ENCOUNTERED_ZIL"] = 1;
	}
	//[Repeat]
	else
	{
		output("\n\nA faint buzz is the only warning you get before a male zil flutters out of the sky in front of you, crotch plate retracted and dick waving at head-height, just a few feet away. He winks and says, <i>“Hey, I brought a snack,”</i> while pulling his foreskin back just far enough for you to see an ebony tip peek through. <i>“You hungry?”</i>");
		output("\n\n<b>It’s a fight!</b>");
		flags["ENCOUNTERED_ZIL"]++;
	}
	
	CodexManager.unlockEntry("Zil");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new ZilMale());
	CombatManager.victoryScene(winVsZil);
	CombatManager.lossScene(zilLossRouter);
	CombatManager.displayLocation("MALE ZIL");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//*Win Scenes:
public function winVsZil():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	// HP:
	if(enemy.HP() <= 0)
	{
		output("The zil gives one last feeble shudder as he struggles to remain upright, but the damage is simply too much. His wings cease their incessant buzzing and drop him straight onto his ass, causing him to wince in pain and discomfort. Looking up hesitantly, he slouches his shoulders in submission and admits, <i>“I’m yours, " + (pc.hasVagina() ? "to breed" : "to play with") + ", I guess.”</i> He cannot conceal the way his maleness swells inside its sheath-like skin. What do you do?");
	}
	// Lust
	else
	{
		output("The zil tugs on his his boner almost feverishly by this point, throwing back his head and whimpering when amber juices begin to roll out of his concealed crown, beading on his knuckles before dripping free. His wings cease their fluttering and drop him to the ground. Kneeling, he looks up at you eagerly and admits, <i>“I’ve never lost to an alien before. Are you going to " + (pc.hasVagina() ? "breed" : "fuck") + " me?”</i> Regardless of your choice, his essence is flooding the air between you and driving your body to take him up on his offer. What do you do?");
	}
	//Raise lust to 33 minimum, menu.
	if(pc.lust() < 33) pc.lust(33-pc.lust());
	clearMenu();
	//if(pc.hasCock() && pc.shortestCockLength() <= 20) addButton(0,"Buttfuck",buttfuckDefeatedZil);
	//else addDisabledButton(0,"Buttfuck","Buttfuck","You’ll need a dick shorter than 17\" long to plug this wasp.");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.analCapacity()) >= 0 || pc.shortestCockLength() < 20) addButton(0,"Buttfuck",buttfuckDefeatedZil);
		else addDisabledButton(0,"Buttfuck","Buttfuck","You’ll need a smaller sized cock in order to plug this wasp.");
	}
	else addDisabledButton(0,"Buttfuck","Buttfuck","You’ll need a cock for this!");
	//*Ride His Cock
	//To cumfinity, and beyond! REQS CUNT
	if(pc.hasVagina()) addButton(1,"Ride Him",rideDatZilCawk);
	else addDisabledButton(1,"Ride Him","Ride Him","You must have a vagina to ride this ride.");
	//*Footjob scene - Req's humanlike feetsies
	//(By Miesha)
	if(pc.hasFeet() && !pc.isTaur()) addButton(2,"GiveFootjob",giveTheZilAFootjob);
	else addDisabledButton(2,"GiveFootjob","GiveFootjob","Giving a zil a footjob requires human-like feet.");
	
	//*Foreskin Oral Play
	//(By Alkahest) (If this needs to be edited, I will do so. Lemme know your opinion plz)
	//Requires a decent amount of zil sex, a dick, a pussy, or nippledicks!
	//Reqs loss suck some.
	if((pc.hasCock() || pc.hasVagina() || pc.hasNippleCocks()) && flags["TIMES_LOSS_SUCKED_ZIL_MALE"] >= 2) addButton(3,"Oral Play",alkahestsForeskinOralPlay);
	else if(pc.hasCock() || pc.hasVagina() || pc.hasNippleCocks()) addDisabledButton(3,"Oral Play","Oral Play","This scene would only make sense if you’ve had to suck a zil off twice already after losing in combat....");
	else if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] >= 2) addDisabledButton(3,"Oral Play","Oral Play","You need genitals for this!");
	else addDisabledButton(3,"Oral Play","Oral Play","This scene would only make sense if you’ve had to suck a zil off twice already.... Oh, and you’ll need to have genitals too.");
	//*Tailcock Peg Him
	if(pc.hasTailCock()) addButton(4,"Tail Peg",tailCockPegTheZil);
	else addDisabledButton(4,"Tail Peg","Tail Peg","You’ll need a tailcock to peg the zil with it.");

	if(pc.hasCuntTail()) addButton(5,"Tail Milk",useTailOnZilWhenUWin,undefined,"Tail Milk","Milk his sugary dick with your parasitic tail.");
	else addDisabledButton(5,"Tail Milk","Tail Milk","You need a tail-mounted vagina to do this.");

	if(pc.hasCock()) addButton(6,"Get BJ",getABJFromAManzil,undefined,"Get BJ","Get a BJ from the waspy male.");
	else addDisabledButton(6,"Get BJ","Get BJ","Get a blowjob from the zil before you.");

	//Cuff&Fuck
	cuffNFuckButton(7, enemy);
	//Femzil prompt
	if(pc.hasKeyItem("Capture Harness") && flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] == undefined) {
		addButton(9,"Capture",useTheCaptureHarness);
		output("\n\n<b>Doctor Julian Haswell wanted you to use a capture harness on a zil. Now would be the perfect time.</b>");
	}
	output("\n\n");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//*Butt Fuck Him
public function buttfuckDefeatedZil():void {
	clearOutput();
	if(enemy.hasPerk("Penny Quest AI")) showBust("ZIL_RED");
	else showBust("ZIL");
	showName("MALE\nZIL");
	if(pc.isNice()) output("Chuckling happily, you tell the zil that you have every intention of playing with him for as long as possible.");
	else if(pc.isMischievous()) output("Grinning mischievously, you inform the poor zil that you’re going to have quite a bit of fun with him.");
	else output("Lording a cruel smile over your latest prey, you let him know that you’re going to have quite a lot of fun with him.");
	output(" He looks up hopefully at your statement, but you grab him by his shoulders and spin him around, pushing him forward so that he’s on his hands and knees, ass in the air. His cute little ball-sack glistens with sweat from your recent exchange, connected by a narrow strip of soft taint to his tight, winking anus. Combined with his well-filled foreskin, the male’s softest, most vulnerable points are all lined up and displayed for you, one erotic line of pliant flesh sandwiched between the glossy, chitinous plates of his cheeks.");
	
	output("\n\nYou slap one of the zil’s butt-plates and admire the way it compresses his asscheek down, distorting his anus slowly. Spitting on his smooth pucker to lubricate it, you ");
	if(pc.isTaur()) output("step forward to align ");
	else output("handle ");
	output("[pc.oneCock], pushing your ");
	var x:int = pc.cockThatFits(zil.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("[pc.cockHead " + x + "] across the wrinkled entrance. The simpering, submissive male grunts in discomfort");
	if(!pc.isTaur()) output(" until you let your other hand dip down to his dangling tool, slowly circling his flesh-wrapped dick and gently stroking it. His manhood obligingly erects to full mast in your comfortable grip.");
	else output(" until his dangling, alien cock twitches. His manhood obligingly erects to full mast, slapping against his belly to display his wanton need.");
	output(" At the same time, his sphincter relaxes enough for you to start pushing forwards, his wings giving up weak little flutters of excitement.");
	
	// Sub 7":
	if(pc.cocks[x].cLength() <= 7) {
		output("\n\nAlmost immediately, the wasp-boy’s tight little hole lets you slide right in thanks to your saliva, perfectly tight around your " + pc.cockDescript(x) + " and reflexively squeezing down around you like a warm sleeve.");
		if(pc.cockTotal() == 2) output(" Your other penis slides across his strip of exposed flesh, sawing through his crack with your pushes, far from neglected.");
		else if(pc.cockTotal() > 2) output(" Your other penises slide across his exposed flesh and plated bottom, gaining what friction they can.");
		output(" He sighs once you’ve bottomed out, and he slowly begins to leak, honey-like, from his bouncing boner, ribbons of the stuff dripping out of his covered cock. Grabbing hold of his hips, you massage your fluttering, anal toy and make ready to truly plumb his depths.");
	}
	// Sub 15":
	else if(pc.cocks[x].cLength() <= 15) {
		output("\n\nYour " + pc.cockDescript(x) + " batters at the wasp-boy’s tight little hole again and again, but it refuses to yield to your stubborn thrusts at first. He obviously hasn’t seen much action, as his butt just isn’t used to stretching for a big, stiff cock like yours. You keep at it, and his anal defenses slowly fall before your amorous assault, at first just allowing your " + pc.cockHead(x) + " to slip inside and then almost gleefully accepting inch after inch of throbbing, " + pc.mf("male","herm") + " lust.");
		if(pc.cockTotal() == 2) output(" Your other penis slides across his strip of exposed flesh, sawing through his crack with your pushes, far from neglected.");
		else if(pc.cockTotal() > 2) output(" Your other penises slide across his exposed flesh and plated bottom, gaining what friction they can.");
		output(" It takes some time to completely bottom yourself out. The zil’s rectum is well and truly stuffed, so you grab hold of his hips and make ready to start fucking your anal toy.");
	}
	// HUGE SCENE STARTS HERE
	else {
		output("\n\nYou try to line yourself up with his tight little hole, but no matter how you arrange it, there’s way you can make this work without splitting him in two. The simple truth of the situation is that you can’t fuck his ass while you’re as big you are. You push your thumb into the little asshole to buy yourself some time, rubbing around until you feel a hard little knot. Pushing on it, your efforts are rewarded by a torrent of thick wasp-pre from your submissive lover, pouring out of his defenseless dong and down his nubile, glossy armored thighs. An idea comes to you while you watch the amber fluid shine...");
		if(pc.isTaur()) output("\n\nShifting back to mount him again,");
		else output("\n\nDipping down,");
		output(" you place [pc.eachCock] in between his legs and slide through the smooth, slick area, feeling his musky, scented cock sliding and rubbing against your own. His balls twitch on top of you, helplessly bound up by the sweet, sweet friction of dick-on-dick.");
		if(pc.isTaur()) output(" The heated action causes him to drip his syrupy boy-milk all over, turning the area between his thighs into a sloppy, sticky morass.");
		else output(" You push your thumb back into him and make him drip his syrupy boy-milk all over, turning the area between his thighs into a sloppy, sticky morass.");
		output(" The zil’s wings flutter futilely as you finish gathering your lube and bottom out against his butt, grabbing his hips as you ready yourself to properly fuck him.");
	}
	pc.cockChange();
	
	// Merge back together
	output("\n\nDropping down to rest himself with his shoulder upon the ground, the zil looks back at you as you use him, reaching under himself with one hand to ");
	if(pc.cockTotal() > 1) output("rub your dicks together");
	else output("tug on his fleshy phallus");
	output(". His potent, musky scent fills the air when you pull back, suffusing the air around with you honeyed aroma. You suck in a deep lungful of it, admiring the way it makes [pc.eachCock] thicken with fresh excitement while your head swims. The zil smiles gleefully as you give in to his pheromones and begin to move faster and faster.");
	
	output("\n\nYou eye your carapace-coated lover’s almost heart-shaped ass as you clap against it over and over. Your [pc.hips] seem to move of their own volition while you tilt your head back and sigh, watching nothing with half-closed, dilated eyes. With so much pleasure coursing through your [pc.cock " + x + "] and such a wonderful scent all around, you can barely think well enough to remain upright.");
	
	output("\n\nYour lusty reprieve is ended by a high-pitched whine from the Zil, one that culminates in explosive");
	if(pc.cocks[x].cLength() <= 15) output(", squeezing tightness in his rectum");
	else output(", spastic twitches of his erection");
	output(". Messy globs of cum gather in his foreskin before dribbling out in languid waves,");
	if(pc.cocks[x].cLength() > 15) output(" pooling on your own mammoth erection, further lubricating your thorough thigh-fucking.");
	else output(" pooling beneath him, wastefully filling a depression in the ground with oodles of viscous boy-honey.");
	
	output("\n\n<i>“Unghhh.... yes!”</i> the orgasmic waspling blurts while his wings buzz with uncoordinated movements, and you have to agree with his assessment. You fuck him harder and faster while he comes, letting his climactic jerks and spasms assist you in getting your own pleasure.");
	if(pc.cocks[x].cLength() <= 15) output(" At this point, his asshole is getting nice and stretched around your girth, to the point where when you pull back you can see it gape. Then, you fill it back up with the dick it needs.");
	else output(" At this point, his thighs are getting nice and sloppy from all the cum he’s spurted, but it just makes them feel hotter and wetter. You pull back to admire them before filling his legs up with a real cock, unintentionally frotting with his still-dripping prick while you do it.");
	
	output("\n\nThe zil goes completely nervous under your assault, and with a quick glance, you confirm your suspicions: he’s smiling dopily and sagging into your grip. If you’d cum first, you’d probably be doing the same thing, but for now, the only thing on your mind is ");
	if(pc.isNice()) output("cumming just as hard as he did");
	else if(pc.isMischievous()) output("making sure your orgasm is even better than his was");
	else output("using him to cum as fast as possible");
	output(". The cacophonous smacks of [pc.skinFurScales] on armored bottom fills the air, accompanied by the sloppy slurps ");
	if(pc.cocks[x].cLength() > 15) output("you make as you saw through his thighs");
	else output("his stretched-out asshole makes as you unceasingly sink in and out of it");
	output(". Like a broken machine, you go faster and faster until a tiny part of you worries that you’ll fly apart into a million pieces. The heat of friction and your own passions climbs to intolerable levels, gathering in your [pc.balls] like molten-hot metal.");
	
	output("\n\nSeizing up, your muscles plunge you into your target’s backside with enough force to nearly topple him over, and the sweltering, liquid deluge erupts from [pc.eachCock] almost without warning. Your eyes roll back and your body shudders as you push the zil’s cheek into the dirt with the force of your orgasm");
	if(pc.cumQ() >= 50) {
		if(pc.cocks[x].cLength() > 15) output(", rope after rope splattering onto the ground, mixed with the waves of amber honey your pet has already produced.");
		else output(", splattering the inside of his rectum with thick spooge.");
		if(pc.cumQ() >= 500) output(" Your [pc.cum] seems to come out almost without end, extending your pleasure for as long as the tide will last.");
		if(pc.cumQ() >= 7000) {
			output(" It must be enough to fill a ");
			if(pc.cumQ() <= 14000) output("few gallon jugs");
			else if(pc.cumQ() <= 25000) output("small tub");
			else if(pc.cumQ() <= 50000) output("big tub");
			else if(pc.cumQ() <= 100000) output("small closet");
			else if(pc.cumQ() <= 200000) output("big closet");
			else if(pc.cumQ() <= 300000) output("small room");
			else if(pc.cumQ() <= 500000) output("big room");
			else if(pc.cumQ() <= 700000) output("small pool");
			else output("huge pool");
			if(pc.cockVolume(x) <= zil.analCapacity()) output(", but the zil’s rectum just can’t handle it. Much of your ejaculate pours back out in a wave");
			output(".");
		}
	}
	if(pc.canMilkSquirt() || pc.hasDickNipples()) {
		if(pc.hasDickNipples()) output(" Your [pc.dickNipples]");
		else output(" Your [pc.nipples]");
		output(" orgasm in sympathy, spewing [pc.milk] over your conquest. Much of it runs down the small of his back in a narrow river that splits at his neck and spiny hair.");
		pc.milked();
	}
	// Nice
	if(pc.isNice()) {
		output("\n\nYou pull away, clearheaded for the first time since you smelled your foe. Oddly, though you are aware of his scent, it doesn’t seem to affect you as it did before. You catch the zil before he falls down into the cum puddled below and gently rest him down on the ground, patting him ");
		if(pc.cocks[x].cLength() <= 15) output("while your cum pours out of his ass unimpeded");
		else output("while he gathers your cum from his thighs and licks it off your fingers");
		output(". The armored male lounges, fondling himself while you get dressed, and by the time you leave, he’s openly masturbating himself towards a second orgasm.\n\n");
	}
	// Mischievious
	else if(pc.isMischievous()) 
	{
		output("\n\nYou pull away, chuckling when your foe collapses into the puddled cum, soaking himself with it. Oddly, his scent doesn’t seem to be addling your wits anymore, and you’re able to enjoy the sight of your submissive foe in the dirt properly. The zil doesn’t seem to mind much, so you leave him there while you get ");
		if(!pc.isNice()) output("dressed");
		else output("what little gear you wear back together");
		output(". By the time you’re dressed, he’s lost in masturbation, and you give his balls a playful tweak to remember you by as you leave.\n\n");
	}
	// Asshole
	else {
		output("\n\nYou smirk and pull out, pushing him down into the puddled cum as you do. Oddly, his pheromones don’t seem to be affecting you now that you’ve blown your load, so you’re able to focus with a clear head as you put your [pc.foot] on his back and push him down into it. You get tired of debasing him pretty quickly and get dressed. By the time you finish, the wasp-boy has started masturbating shamelessly, so you make sure to slap his balls before you go. Surprisingly, that sets him off, and you leave him squirting behind you.\n\n");
	}
	processTime(30+rand(10));
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//*Ride His Cock
//To cumfinity, and beyond!
public function rideDatZilCawk():void {
	clearOutput();
	if(enemy.hasPerk("Penny Quest AI")) showBust("ZIL_RED");
	else showBust("ZIL");
	showName("MALE\nZIL");
	if(pc.isNice()) output("Smiling amiably, you tell him that you plan to take his seed in the most pleasurable way possible.");
	else if(pc.isMischievous()) output("Smiling roguishly, you tell him that he’s going to have a hard time walking when you finish.");
	else output("Smiling cruelly, you promise that he’ll be lucky to ever orgasm again once you’re done with him.");
	output(" The zil gasps as you push him flat on his back, and he openly ogles your [pc.chest]");
	if(!pc.isCrotchExposed()) output(" as you strip off your offending clothing");
	else output(" as you admire his smooth, polished figure");
	output(". There’s no way to conceal the turgid stiffness of his member, bouncing slightly above his smooth abdominals. You actually have to stop him from tugging on the almost phimotic tool - the only way he’s getting pleasure is when you stuff it in [pc.oneVagina].");
	
	output("\n\nSlowly and with deliberate sensuality, you lower yourself down so that [pc.oneVagina] is just above his groin, the hot heat of your puffy slit steaming the base of the aggressive alien boy’s shaft. He shifts nervously below you, but remains meek and submissive, unwilling or unable to force himself upward after being so humiliated in a fight. You lean forward to meet his exotic, black gaze while your [pc.hips] drag your ready quim against him. Letting out an anguished sigh, the zil twitches underneath you and releases a tiny dribble of gold pre-ejaculate onto his tight tummy.");
	output("\n\nThe sight of his liquified ardor combined with the sweet wasp-boy’s scent is enough to drive you to distraction, and you begin to grind yourself against him unashamedly");
	if(pc.hasClit()) output(" until [pc.eachClit] peeks out of its hood, stiff and moist with your own lubrication");
	output(".");
	if(pc.hasClit() && pc.clitLength >= .5) {
		if(pc.totalClits() == 1) {
			output(" It swells ");
		}
		else {
			output(" They swell ");
		}
		if(pc.clitLength < 3) output("up nice and big.");
		else {
			output("well beyond what’s normal for a human, absolutely cock-sized at this point.");
			if(!pc.isTaur()) output(" You run a finger along the underside and nearly cum on the spot, but you hold out. There’s a juicy, slippery cock you want to feel submitting inside your snatch first.");
		}
	}
	if(pc.hasCock()) {
		output(" [pc.EachCock] is almost as hard as his");
		if(pc.cockTotal(GLOBAL.TYPE_BEE) == 0) output(", though you lack the thick, wrinkled, musky shroud his has");
		output(". ");
		if(pc.cockTotal() == 1) output("It drips");
		else output("They drip");
		output(" with your own unspent need, but what you really want right now is a nice, full snatch.");
	}
	output(" The zil’s hairless, ebony pouch bobs needily underneath you in response to your slippery affections, and he whimpers, <i>“Please!”</i>");
	
	// Mean PCs
	if(pc.isAss()) {
		output("\n\nHis plea shakes you out of your aroused haze. You cruelly pull back, ");
		if(!pc.isTaur()) output("grabbing hold of his cock and ");
		output("saying, <i>“Beg me for it.”</i>");
		output("\n\n<i>“Please! Please! Fuck me, offworlder. You’re so sexy... and exotic!”</i> the zil cries in answer while casting his eyes down submissively.");
		output("\n\n<i>“Not convinced,”</i> you chide. <i>“I guess you don’t want a nice, hot pussy to sink this stinky ol’ dick into, huh?”</i>");
		output("\n\nThe chitinous male shudders and groans, turning his head to the side as his hips futilely strike upward, trying to press into you. <i>“I... I’ll do anything. Do you want to know where my village is so you can fuck me every day? I’ll do it. You can come and put me in a collar, then parade me around in front of my friends. Please, just let me cum first!”</i>");
		output("\n\n<i>“Better,”</i> you purr.");
	}
	// Mischievous PCs
	else if(pc.isMischievous()) {
		output("\n\nHis plea rouses you from the sexual haze, and you pull back to expose his dick, now coated thoroughly with vaginal secretions.");
		if(!pc.isTaur()) output(" You pump it lewdly a few times, slowly teasing him with long slow tugs that stretch his foreskin before peeling it back from his glistening crown, exposing the leaking cum-slit to your rapacious gaze.");
		output("\n\n<i>“How deliciously decadent,”</i> you purr");
		if(!pc.isTaur()) output(" with a few last tugs");
		output(". The zil whimpers again and futilely tries to snap his loins up into yours, but the positioning is all wrong. His face contorts in the cutest way as he tries to fight towards orgasm, his mouth opening with his tongue lolling out. Giggling, you tease, <i>“Of all the bug-boys in these woods, I get the shuddering submissive. Lucky for you, I wanna feel just how hard you can squirt inside me.”</i>");
	}
	// Nice PC
	else {
		output("\n\nHis plea rouses you from the sexual haze, and you pull back to expose his dick, now coated thoroughly with vaginal secretions.");
		//HORSE: 
		if(!pc.isTaur()) output(" You smile warmly,");
		else output(" You stroke it with your hand while you bend down to purr into his ear,");
		output(" whispering, <i>“Ohh, a sexy </i>");
		if(pc.tallness >= 80) output("<i>little </i>");
		output("<i>guy like you? Of course I’m gonna let you pop inside me. I bet you have a thick, sticky load in these shuddering balls of yours just waiting to baste my cunny, huh?”</i> He nods vigorously, his tool clenching");
		if(!pc.isTaur()) output(" in your hand");
		output(" as it nears orgasm.");
		output("\n\nYou pinch him tightly around his base, bottling up his cum before he can release it and chasing away the relief he so desperately sought. <i>“Sorry, cutie. I just want to make sure we both get to cum together, hard. I’ll put you inside now, okay?”</i>");
		output("\n\nThe zil nods and smiles.");
	}
	var x:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	if(x < 0) x = pc.cuntThatFits(enemy.cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	// End personality forks
	// Too big 4 u
	if(enemy.cockVolume(0) > pc.vaginalCapacity(x)) {
		output("\n\nWincing, you push his lubricated member against your ");
		if(!pc.vaginalVirgin) output("almost ");
		output("virginally-tight entrance. He’s just so... so big, that you can’t seem to fit him! You push and grind, allowing his warm pre-cum to slather across your labia");
		if(pc.hasClit()) output(", letting him bump into your [pc.clits] again and again as you slowly loosen yourself to allow him entrance");
		output(". Slowly, you work his concealed tip inside you, then, the first two... three inches. The tight friction peels his skin back to expose his sensitive glans to your silken walls, and between that and his gushing pre, you find the motivation to push down the rest of the way, fully embedding your onyx lover in your depths. He groans quietly once he realizes you’ve completely taken his member.");
	}
	// Just rite
	else if(enemy.cockVolume(0) * .6 > pc.vaginalCapacity(x)) {
		output("\n\nYou slowly slide his lubricated member into your slick entrance, your honeypot swallowing up his tool as if it was made to accept it. Pushing against you, the submissive zil meets you motion for motion, embedding himself fully inside you. You push yourself violently against him");
		if(pc.hasClit()) output(", hard enough for your [pc.clits] to grind up on your impromptu lover’s groin");
		output(". He settles down under the forceful pressure and completely submits to your will. There’s nothing in his eyes but hope and subservience, which as far as your [pc.vagina " + x + "] is concerned, is just perfect. As a bonus, his foreskin is quickly peeled back by your silken channel, and his glans begins to exude pre in larger globs than before.");
	}
	// Loosey Goosey
	else {
		output("\n\nYou swiftly burrow his shaft inside you, reveling in the feeling of it spreading your capacitative cunny wide. He’s surprisingly thick given his relatively average length, but that doesn’t even phase you. The sloppy sound of your snatch swallowing him is accompanied by both sets of voices groaning with unadulterated pleasure. You swing your hips back and forth to ensure that his foreskin peels back and his head presses against a sensitive nerve-bundle inside you, blasting your brain with stars of pleasure until you feel like your IQ is dripping out your twat.");
	}
	// end cunt forks
	// stretch check.
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	
	output("\n\nMoving faster now, you pivot your hips in small circles in order to grind every millimeter of your interior against his lovely, ebony shaft, your cunt clenching unintentionally whenever he hits a sensitive spot, squeezing just hard enough to make him feel as if you’re milking him. Then, you switch tempos, bouncing on his cock, letting your [pc.butt] compress against him each time you bottom out.");
	if(!pc.isTaur()) {
		output(" The zil’s hands zero in on your [pc.nipples] in an instant, and he begins to pinch and squeeze them");
		if(pc.biggestTitSize() >= 1) output(" while groping your [pc.chest]");
		output(". It feels too good to care about that minor rebellion, but a moment later you grab him by the wrist and shove his hand down to your impaled womanhood.");
	}
	if(pc.hasClit())
	{
		output("\n\nImpatiently, you put his hand on [pc.oneClit], and order, <i>“Play with it,”</i> in between lascivious moans. ");
		// small clits
		if(pc.clitLength < .5) output("It takes him a few moments to isolate the diminutive button, but when he does, damn, does it feel good! His fingertips are similarly textured to a human’s, unarmored but textured a bit more strongly than your own. The zil is soon expertly rubbing your buzzer. The proof of his dexterity is dripping out all over him. Soon, your walls are convulsing around him unintentionally, and orgasm is just a breath away.");
		// medium clit
		else if(pc.clitLength < 3) output("He quickly finds your over-engorged buzzer. It’s actually big enough that two of the wasp-man’s fingers can easily pinch it from either side. The finger-sized protrusion pulses pleasantly in his grip, and soon the zill has you squirming and writhing atop him. Cunt-clenching spasms wrack your quim as you try to hold it together, but your orgasm hangs on the edge of your consciousness, just one breath away.");
		// huge clit
		else output("He tentatively grasps your cock-like buzzer, and it feels powerfully good. You don’t even have to tell him what to do. The zil just starts to pump, slowly at first but with increasing certainty. Up and down, up and down, he strokes your lady-prick faster and faster. You can barely stay conscious through the haze of pleasure it’s forcing upon you. Orgasm is but a breath away, but you wish you could lay here and let him jerk on your giant clit for hours. It feels so good!");
	}
	
	output("\n\nThe pulsating wasp-cock swells with an impending load inside you, the extra friction is just what you need to get off yourself. You grab hold of his shoulders, arching your back, and you cum all over his twitching, sable member. Wringing that cock with slow ripples, your [pc.vagina " + x + "] does its best to pull it deeper inside you, stroking the foreskin back up over the glans a split-second before it begins to spurt. Sweet, sticky wasp-boy cum splatters into your cervix in squirt after squirt");
	if(!pc.isPregnant(x)) output(", already trickling into your unoccupied womb");
	output(". The heavy, spunky honey-sludge floods your passage while you shiver in ecstasy, getting a nice, long, slit-filling cum thanks to your partner’s sweet scent and lovely dong.");
	if(pc.vaginaTotal() > 1) {
		if(pc.vaginaTotal() > 2) {
			output(" Your extra vaginas ");
			if(!pc.isSquirter()) output("dribble");
			else output("squirt");
			output(" along with the lucky winner, hugging phantom cocks that only exist in your bliss-addled mind.");
		}
		else {
			output(" Your extra vagina ");
			if(!pc.isSquirter()) output("dribbles");
			else output("squirts");
			output(" along with the lucky winner, hugging phantom cocks that only exist in your bliss-addled mind.");
		}
	}
	if(pc.cockTotal() > 0) {
		output("\n\nNo orgasm would be complete without a nice, long cum from your [pc.cocks], and this one does not disappoint. You launch ropes of sticky jism all over your conquered, primitive pet, spattering his chest and face with your juicy goo. His carapace is soon slippery with your spunk, and you make sure to land as many squirts as possible onto his open-mouthed, orgasmic target of a face.");
		if(pc.hasDickNipples()) output(" Even your dicknipples get in on the action and paint a fresh layer of [pc.milk] on your prize.");
	}
	// No dicks but dicknipples:
	else if(pc.hasDickNipples()) {
		output("\n\nNo orgasm would be complete without a nice, long cum from your dicknipples, and this one does not disappoint. You launch ropes of sticky jism all over your conquered, primitive pet, spattering his chest and face with your juicy goo. His carapace is soon slippery with your spunk, and you make sure to land as many squirts as possible onto his open-mouthed, orgasmic target of a face.");
	}
	output("\n\nYou revel in it for as long as you can, but like all good things, your pleasure does eventually subside. Stretching, you look down at the zil as you prepare to rise; his eyes are closed and his mouth is smiling a happy smile. It looks like you both got what you needed. You pull off with a shudder and leave a well-milked, submissive wasp-boy in your wake. Maybe next time he won’t accost the first off-worlder he sees.\n\n");
	
	processTime(21+rand(4));
	pc.orgasm();
	pc.loadInCunt(enemy, x);
	CombatManager.genericVictory();
}

//*Footjob scene - Req's humanlike feetsies
//(By Miesha)
public function giveTheZilAFootjob():void {
	clearOutput();
	author("Miesha");
	if(enemy.hasPerk("Penny Quest AI")) showBust("ZIL_RED");
	else showBust("ZIL");
	showName("MALE\nZIL");
	output("You watch the Zil collapse, exhausted. A delightfully perverted idea comes to mind as you watch the boy pant. <i>“Awh, poor little thing, all tired and burned out are we?”</i> You stroll towards him, your smile growing with every step.");
	output("\n\nThe Zil, on the ground, tries crawling backwards but ends up hitting the foot of a tree. He looks from side to side, worried as you come to a halt right in front of him. <i>“W-what are you planning?”</i>");
	output("\n\n<i>“Oh, don’t you be so frightened, boy. I won’t cause any permanent damage to you,”</i> you tell him, coyly.");
	output("\n\nAs you say this, you raise your [pc.leg] and place your [pc.foot] against his crotch, pushing teasingly against his exoskeleton. <i>“You lost, and you know what happens to the loser right?”</i> You lean down, increasing the pressure with your [pc.foot] as you whisper into his ear. <i>“The loser becomes the victor’s plaything. Can you say you would have done anything different?”</i> As he realizes his predicament, you lift your [pc.foot] off of the insectile humanoid’s genitals.");
	
	output("\n\nThe young Zil can’t hide his growing arousal, his body warming up to the idea of you dominating him. ");
	if(pc.armor.shortName == "") output("Noticing this, you decide it’s time to rid yourself of your footwear. ");
	output("Free of obstruction, you wiggle your " + (pc.hasToes() ? "[pc.toes]" : "[pc.feet]") + " and look seductively at him, further increasing his arousal. His cock is standing rapt at attention, to your amusement and his bashful shame.");
	
	output("\n\n<i>“Oh, look at that. The boy is turned on by the thought of being the loser? How cute.”</i> You laugh cruelly and place one naked [pc.foot] against the base of his dick, watching him shudder at the sensation. Pushing your [pc.foot] forwards and up, the wasp-boy’s shaft is pinned between your heel and his abdomen. When you reach the top, you rub his wet, slippery precum around and " + (pc.hasToes() ? "wrap your [pc.toes]" : "glide your [pc.toe]") + " along the head before sliding down, enjoying the feeling of his slimy pre and hard cock " + (pc.hasToes() ? "between them" : "against it") + ". As he gasps and twitches, you laugh.");
	
	output("\n\n<i>“So sensitive, aren’t we? What would your friends think if they saw you like this, getting off from a strange alien’s feet, hmm?”</i> That seems to have the desired reaction as he groans and thrusts his hips. You sit down in front of him and place your other [pc.foot] against his throbbing, needy cock. Bringing both your [pc.feet] together with his prick perched in-between, you start moving them up and down playfully, using his pre as lube.");
	
	output("\n\nAs you jack him off with your [pc.feet], you can’t help but notice how docile he’s been, never actually resisting your actions. You didn’t really think he would like it but as you keep working to get him off, he gets more and more into it, grabbing your [pc.feet] and using them as a makeshift pussy, thrusting his hips against your [pc.toes] to get off. It only makes you laugh as his desire makes him so willing, so depraved. <i>“Mmh, yes... fuck those feet. You love that feeling, don’t you boy?”</i>");
	
	output("\n\nHearing his gasping moans of approval, you change your movements, alternating between giving him the pressure he needs and pushing your [pc.feet] and [pc.toes] against the length of his cock, rubbing it while your [pc.toes] squish and toy with his smooth, dusky nutsack. <i>“You need to come, don’t you boy? You want to blow that filthy load of cream all over my feet.”</i> You urge him on, teasing him like that for minutes on end before you let him go into the frenzy his pent-up orgasm has driven him to.");
	
	output("\n\nIt’s not long before he reaches the point of no return, groaning as you squeeze him a little harder with your soles, feeling him throb and bulge as his climax washes over him and over your [pc.legOrLegs], much to your amusement. He grunts his approval and sags back against the tree, spent. You won’t have any of that however, and lean forward, grab the back of his head and push his face against your [pc.legOrLegs]. <i>“Lick up your mess, boy. We’re not done until you’ve cleaned up all of this, you understand?”</i> You grin and give him another push against your sticky " + (pc.hasToes() ? "[pc.toes]" : "[pc.feet]") + " and [pc.legOrLegs], moaning as you feel his agile tongue against your [pc.skinFurScales].");
	output("\n\nHe dutifully laps up the sticky mess from your [pc.skinFurScales], his dexterous, tube-like organ sucking up the gooey cum even from between your toes, tickling you a bit. Soon your [pc.feet] are slick and clean and you give him a gentle pat on the head, leaving him there as you ready your gear and continue your journey.\n\n");
	processTime(10+rand(10));
	pc.lust(5);
	CombatManager.genericVictory();
}

//*Foreskin Oral Play
//(By Alkahest) (If this needs to be edited, I will do so. Lemme know your opinion plz)
//Requires a decent amount of zil sex, a dick, a pussy, or nippledicks!
//Reqs loss suck some.
public function alkahestsForeskinOralPlay():void {
	clearOutput();
	author("Alkahest");
	if(enemy.hasPerk("Penny Quest AI")) showBust("ZIL_RED");
	else showBust("ZIL");
	showName("MALE\nZIL");
	//this is too worshipful to be a plain win scene; if it were a loss or there were an addiction mechanic where you needed to be highly addicted to the zil before you could select it, it would make more sense -Z
	output("You inhale deeply as the scent of his now freely-flowing honeyed pre suffuses your senses, overriding all things other than the source of that heavenly smell, your body tingling and warming as the powerful pheromones begin to go to work.");
	// NICE
	if(pc.isNice()) output("\n\nLocking eyes on his dripping cock, you take another lungful of the intoxicating aroma emanating from the pretty little wasp-boy’s thick shaft and, with a longing smile on your face, tell your defeated foe you have no plans on passing up so lovely a treat.");
	// MISCHEVIOUS
	else if(pc.isMischievous()) {
		output("\n\nWith a sly grin you eye his throbbing dong. Taking another whiff of his delectable scent, you inform the incapacitated zil that you’re not going to let him get away without having at least a nice snack.");
	}
	// MEAN
	else output("\n\nYou leer at his pulsating rod, still dripping with pre. With a cruel smirk you tell your little wasp-toy that you have no intention of letting such a fine fuck-toy escape you unused.");
	
	output("\n\nYou push the zil’s chest until he takes the hint and lies down on the ground, languidly stroking his pulsating cock, gobs of his amber elixir oozing out with each exaggerated jerk. Firmly grasping his arms, you shove them under his chitinous backside; he looks at you in mild desperation as his member throbs with his heartbeat and wobbles gently with his antsy struggling, practically begging you with his eyes to be allowed to touch his thick ebony shaft.");
	
	output("\n\n<i>“Now now, to the victor go the spoils, right? You wouldn’t want to deprive me of my prize,”</i> you say with a grin as you grasp his turgid phallus. The soft skin of his shaft stretches to a few experimental strokes as you watch, nearly hypnotized, at the sensitive band of his foreskin gently gliding back and forth, opening wide over the thick head of his fat cock. The defeated zil moans, half in protest and half in lusty anticipation.");
	
	output("\n\nYou gently lay your face at the base of his penis and close your eyes, draping the thick, moist wasp-dick across them. Attempting to lose yourself in his musky-sweet odor, you inhale deeply. As you slowly stroke his thick, throbbing cock, you knead and stretch the soft foreskin tube surrounding his shaft as you go; a steady stream of his delicious fluid flows liberally down the side of his shaft with each of your strokes. However, this eventually grows insufficient in your mind; you become impatient for more of his sweet nectar. Pausing your languid rubbing, you lazily open your eyes and look up to the source of that amber flow.");
	
	output("\n\nAs you stop your ministrations, your captive wasp boy whines with his need, looking down at you with tears brimming in his eyes. You bring one of your honey-slicked fingers to your captive’s lips. Pushing it into his mouth, he begins to lick himself off of your fingers. As he suckles your finger you gently shush him, pursing your lips.");
	output("\n\nYour captive mollified for the moment, you return your attention to his shaft, bobbing lightly in your grip as he shifts uncomfortably. You begin to lick and kiss your way up his throbbing dong, gently nibbling and tugging at his soft, thick foreskin with your teeth as you go. After a minute of this, you arrive finally at the destination you had sought, the drooling crown of the zil’s wide dick. You dip your nose into the puckered ring at the tip of the zil’s fat head and inhale deeply, relishing in the sweet, musky scent.");
	
	output("\n\nThe heat suffusing your body from the zil’s heady pre-ejaculate causes you to abandon all pretenses and you dive your tongue deep into the folds of the wasp-boy’s foreskin, lapping up the golden liquid that is pooling inside, enjoying the sensation of being between his thick skin and smooth spongy glans. The zil strains against you, gasping at the sudden stimulation, and struggles to thrust his thick shaft into your mouth to gain more pleasure, golden pre-ejaculate practically pouring into your mouth. You firmly place a hand on his stomach and force him back to the ground, glaring into his eyes. He shudders and closes his eyes as he ceases to struggle, abandoning himself to your ministrations.");
	
	output("\n\nYour delicious treat secured, you decide to have some fun with your Wasp-toy’s fat dong, diving two of your fingers into his sensitive band and pulling them apart, stretching the zil’s tight rubbery opening of his foreskin wide as he screams in a mix of pleasure and pain. You swirl your tongue around his exposed glans, drinking down the amber fluid that continues to flow out of his cum-slit and suck on the thick head of your captive’s sturdy pulsating cock. Removing your fingers from his foreskin, it snaps back into place with an audible slap, a new spurt of pre-ejaculate, and a loud moan from the zil.");
	
	output("\n\nYou grab the edge of his foreskin in your teeth and gently tug upwards eliciting another moan from the poor wasp-boy. You feel it’s about time to finish this up, your captive’s breathing has become ragged and his pre-cum is flowing faster than ever. You insert a finger into the stretched out band at the tip of his cock, and pump it in and out of the tight pocket, scraping the underside of the zil’s glans on each upstroke. You furiously finger-fuck the captive zil’s foreskin, swirling your finger around the head; a loud squelching noise emanates from his sopping glans.");
	
	// Random Wasp-Boy Butt fingering
	if(rand(3) == 0) {
		output("\n\nAs you do so you sneak a sticky golden hand under the zil’s shiny smooth sack which is gurgling and churning with the need to release. Lightly shoving it out of the way you proceed back towards your goal, the wasp-boy’s cute chitinous backside, until your hand runs into an obstruction in front of his puckered asshole. You smile at your captive as you move the finger from his trapped hand that had been stroking the outside of his hole. With a wicked grin you shove two of your pre-slicked fingers up to the knuckle in his ebony backside; the Wasp-boy’s face lights up in a mixture of surprise, pain, and intense pleasure.");
		output("\n\nYou quest around his warm rippling insides looking for the supple knot of flesh that you’re sure is there. Before long your finger locates the hard lump and presses down hard, eliciting a loud gasp from your captive zil; the golden pre seeping out of his cock doubles its flow. You idly wonder to yourself in your lust addled haze where he’s keeping it all.");
	}
	// End Random Butt Fingering
	
	output("\n\nAfter a minute of this, suddenly you feel your Wasp-boy tense up and his thick cock begins to dilate. Thinking fast, you pinch off the top of his foreskin and pull upwards and watch with glee as shot after shot of delicious honey scented cum fills up the poor abused zil’s foreskin like a balloon. The zil howls in pleasure as his foreskin balloon dilates further and further as his orgasm winds down. Licking your lips you clamp your mouth over his cock-head and suck greedily, mouthful after mouthful of the zil’s honeyed ejaculate flowing freely from his cum-balloon of a foreskin.");
	
	//(DIS IN PROGRESS YO)
	// PLAYER AROUSAL STUFFS HERE
	output("\n\nHaving ingested the wasp-boy cum and what seems like a gallon of his delicious pre, your [pc.skin] heats up even further and tingles as though your entire body was an erogenous zone.");
	// IF DICK
	if(pc.hasCock()) {
		output(" You feel [pc.eachCock] grow ever thicker");
		if(pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "") {
			output(" in the strained confines of your ");
			if(pc.armor.shortName != "") output(pc.armor.longName);
			else output(pc.lowerUndergarment.longName);
		}
		output(", throbbing with heat, snaking ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" way further down. You feel what seems like an ocean of your own pre-cum flowing down your [pc.leg] and you shiver with the sensation. You pull your [pc.cocks] ");
		if(pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "") {
			output("out of your ");
			if(pc.armor.shortName != "") output(pc.armor.longName);
			else output(pc.lowerUndergarment.longName);
		}
		else output("out");
		output(" and watch ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" wobble in the open air, pulsing with lust and dripping pre.");
	}
	
	// IF PUSSY..and legs? I guess?
	if(pc.hasVagina()) {
		output("\n\nYour [pc.vaginas] tingle");
		if(pc.vaginaTotal() == 1) output("s");
		output(" with the same heat as the rest of you; boiling juices flow freely down the inside of your thighs. You");
		if(pc.legCount > 1) output(" squeeze your [pc.legs] together");
		else output(" wriggle your [pc.legOrLegs]");
		output(" to increase the stimulation on your sopping [pc.vaginas].");
		if(pc.hasClit()) output(" [pc.EachClit] strains against its hood, throbbing with need.");
	}
	// IF NIPPLECOCKS
	if(pc.hasDickNipples()) {
		output("\n\nYou gasp with lust and glance down at your [pc.fullChest], the fat heads of your [pc.nippleCocks] snaking their way out under your [pc.nipples]");
		if(pc.armor.shortName != "" || pc.upperUndergarment.shortName != "") {
			output(", their glans’ rubbing against the rough interior of your ");
			if(pc.armor.shortName != "") output(pc.armor.longName);
			else output(pc.lowerUndergarment.longName);
			output(", causing you to gasp with the stimulation");
		}
		output(". With another gasp of pleasure, ");
		if(pc.armor.shortName != "" || pc.upperUndergarment.shortName != "") output("you rip open your coverings, ");
		else output("you shake in excitement, ");
		output("your [pc.chest] bouncing out and your [pc.nippleCocks] flopping out after them, wobbling around with your heartbeats and dripping their own flood of fluid.");
	}
	// PLAYER AROUSAL STUFF ENDS HERE
	// PLAYER ORGASMY STUFF HERE (This area will be filled out in my final draft. For now this is mostly placeholder text, please let me know your opinions)
	//(Menu to pick which organ to come with)
	output("\n\nHow do you cum?");
	clearMenu();
	if(pc.hasCock())
	{
	if(pc.cockTotal() > 1) addButton(0,"Dicks",foreskinWorshipCumWithDick);
		else addButton(0,"Dick",foreskinWorshipCumWithDick);
	}
	else addDisabledButton(0,"Dick","Dick","You need a penis for this.");
	if(pc.hasVagina()) addButton(1,"Pussy",foreskinWorshipWithPussyCum);
	else addDisabledButton(1,"Pussy","Pussy","You need a vagina for this.");
	if(pc.hasDickNipples()) addButton(2,"DickNipples",foreskinWorshipWithNippleCocks);
	else addDisabledButton(2,"DickNipples","Dick Nipples","You need dick nipples for this.");
}

// IF DICK
public function foreskinWorshipCumWithDick():void {
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	output("You look at your [pc.cocks] throbbing and swaying around in the open air and suddenly have an idea; you reach down and grab the zil’s fat dick, prompting another scream of pleasure as you man-handle his sensitive dong. Grabbing up handful after handful of his cum and pre, you smear the sweet sticky fluid all over your [pc.cocks]. Slowly but firmly you begin to stroke yourself, relishing the sticky texture of the zil’s pre acting as the perfect lube for your ministrations.");
	var x:int = pc.aCockToSuck();
	// IF DICK LENGTH = SUCKABLE (Zil cum Lollipop-Cock)
	if(pc.canSelfSuck(-1)) {
		output("\n\nYou sniff at the [pc.cock " + x+ "] wobbling in front of you, smelling the golden pre-cum you slathered over it and lick your lips. Opening your mouth wide you lean forward and take your [pc.cock " + x + "] into your mouth, tongue lapping around your head looking to get every bit of the zil’s sweet liquid off of it. Slowly you begin bobbing your head up and down your length as far as you can go, slurping loudly as your tongue lashes your [pc.cock " + x + "].");
	}
	if(pc.cockTotal() > 1 && pc.canSelfSuck(-1)) {
		output("\n\nAs you bob up and down on your [pc.cock " + x + "], you pump your other ");
		if(pc.cockTotal() > 2) output("[pc.cocks]");
		else output("dick");
		output(" with vigor. Your own slick pre leaking from the heads mixing with the zil’s syrupy offering. You alternate your pumps with your sucking, creating a rhythm as you fellate yourself. After a minute of this you feel your [pc.balls] clench up as you gargle a moan of ecstasy through your dick-stuffed throat. Your zil-drenched lolipop begins firing blast after blast of your own [pc.cum] down your gullet into your stomach, stretching it further and further with each shot of ejaculate.");
		output("\n\nAs the throbbing dong stuffed down your throat begins firing into you, you feel your other [pc.cocks] begin ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" orgasm as well ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" cumslit dilating widely as you feel a load of cum traveling from your balls. With all the thought you can muster in your lust-soaked mind, you aim your ");
		if(pc.cockTotal() == 2) output("dick");
		else output("dicks");
		output(" at the pretty little wasp-boy at your feet, basting him from head to toe with your [pc.cum]. After a while your orgasm winds down and your [pc.cock] pops from your mouth and slaps wetly against your thigh. Your [pc.cocks] soften and sway gently in the open air, dripping with the mixture of saliva, [pc.cum] and the remnants of the zil’s own orgasm.");
		foreskinPlayJizzOnZil();
	}
	// if #Dicks > 1 & NOT SUCKABLE
	else if(pc.cockTotal() > 1) {
		output("\n\nYou hug your [pc.cocks] to your stomach, rubbing the group of pulsating shafts against your belly. In the back of your lust addled mind you relish the sensation of multiple cocks rubbing together, and bundling the bunch together you begin to stroke your [pc.cocks] as though they were one, slipping and sliding with the sweet lube that coats your lengths. Increasing your tempo, you feel your [pc.balls] tense up and your orgasm approaches.");
		output("\n\nFeeling bad for taking so much of the poor zil’s delicious cum, you feel magnanimous enough to share your own, levelling your cocks at the dazed wasp-boy, you fire shot after shot after shot of hot, sticky [pc.cum] all over him, giggling as you aim for his face which after a while is barely visible under your onslaught. After a while your orgasm subsides and you gasp for breath and view your handiwork with a modicum of pride.");
		foreskinPlayJizzOnZil();
	}
	// if #Dicks = 1 & NOT SUCKABLE
	else if(!pc.canSelfSuck(-1)) {
		output("\n\nYou relish in the sensation of your gooey sticky hand gliding up and down your length. You pause to rub the tip of your [pc.cock] with your palm, working more and more of the zil’s natural lubricant into your penis. You feel your [pc.cock] growing more and more sensitive until you finally feel your [pc.balls] tense up and you let yourself ride the wave of your orgasm.");
		output("\n\nYou aim your [pc.cock] at the reclining Zil, who’s struggling to sit up and looks at you, golden irises focused on your [pc.cock] as the first volley of your own [pc.cum] rockets out of the tip of your dick and hits him square between the eyes. He gasps in surprise as the next shot of your ejaculate hits him in directly in the mouth. Swallowing your creamy load down, he meekly asks you to stop, but each new load of your [pc.cum] lands on his chitinous hide. Finally, your orgasm subsides and you look down at the poor zil plastered in your [pc.cum].");
		foreskinPlayJizzOnZil();
	}
	else didntCumOnZilForeskinPlay();
	// ENDIF
}
// IF PUSSY
public function foreskinWorshipWithPussyCum():void {
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	output("Deciding on pleasing your lady parts, you plop on the ground and your hands glide over your pussy-lips, teasing your folds");
	if(pc.hasClit()) output(" and stroking your clit");
	output(". Feeling slightly more adventurous, you insert a number of fingers into your sopping cunt and piston in and out. With your remaining hand you tease and pinch [pc.oneVagina]. As you continue your ministrations your body becomes hotter and hotter, sexual fluids in a flood pouring out of your pussy.");
	output("\n\nYou feel your release building and building until suddenly the dam breaks and your orgasm floods over your body, wave after wave of electric pleasure passing through you. Having robbed the strength from your [pc.legOrLegs], the force of your orgasm causes you to fall on your back, your back arched in pleasure. Your moistened passage ripples and contracts around your invading finger as you scream in pleasure at your release. After the waves of your orgasm subside, you lay in your warm afterglow for a minute before standing and stretching.");
	didntCumOnZilForeskinPlay();
}

// IF NIPPLECOCKS
public function foreskinWorshipWithNippleCocks():void {
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	output("You tentatively reach up and grasp the [pc.nippleCocks] jutting out of your [pc.chest]; you think to yourself you’ll never get one-hundred percent used to the sight or sensation of this, but at the moment you honestly don’t care. You jack your tits off with reckless abandon, your hands flying up and down the slick lengths of your freakish appendages, gasping at the sensation.");
	
	output("\n\nAs you leak more and more precum from your [pc.nippleCocks], you shove one into your mouth and take it as far down your throat as you possibly can. You suck the [pc.nippleCock] in your mouth as though you were trying to take it off, bobbing your head back and forth as you jack off the remaining [pc.nippleCock] in your free hand.");
	
	output("\n\nAfter a minute you feel something tense up deep inside your [pc.chest] and popping the [pc.nippleCock] from your mouth you aim your freakish nipples at the zil laying on the ground as your boobgasm takes over your thoughts. You cup your hands around your [pc.chest] and squeeze hard with each blast of cum. Without your hands to guide them, your [pc.nippleCocks] begin firing wildly in the zil’s general direction painting the little wasp-boy with your own sticky ejaculate.");
	
	output("\n\nFinally, you feel your orgasm winding down and your [pc.nippleCocks] droop down to lay on your chest before sliding back into the depths of your [pc.chest], a slimy trail the only evidence of their passing.");
	// ENDIF
	foreskinPlayJizzOnZil();
}

// END PLAYER ORGASMY STUFF HERE
//(If you came on the zil)
public function foreskinPlayJizzOnZil():void {
	output("\n\nYou take in the appearance of your conquered foe with a sigh of satisfaction. He’s coated from head to toe in a mixture of his golden cum and your own emissions. He lays curled up in a post-orgasmic haze, fingering both his asshole and foreskin, smearing the sweet milky mixture of your and his sexual fluids all over his body, periodically pausing to suck the fluids from his fingers.");
	zilForeSkinPlayOutro();
}
//(If you did not come on the zil)
public function didntCumOnZilForeskinPlay():void {
	output("\n\nYou look at your defeated enemy with a satisfied smirk. The little wasp-boy lays curled up on the ground in a post orgasmic haze, idly fingering his foreskin and asshole.");
	zilForeSkinPlayOutro();
}

public function zilForeSkinPlayOutro():void {
	// COMBINED
	showBust("ZIL");
	showName("MALE\nZIL");
	output("\n\nYou move up to your defeated foe’s gasping mouth and give him a deep, cummy kiss; his tongue quests into your mouth searching for more of his sweet nectar. You stand and stretch languidly before winking at him and sauntering away, licking your lips all the while.\n\n");
	processTime(27+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}
//*Tailcock Peg Him
public function tailCockPegTheZil():void {

	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	output("You settle on a wicked idea for how to sate yourself on this rather dashing, nubile alien. Your [pc.tail] stiffens, the skin slowly peeling back to expose your [pc.tailCock] to the humid air. The pulsating organ wobbles back and forth slightly as it fills to full tumescence. It thickens tremendously as you look at your prize. He’s staring, gape-mouthed at your powerful tail, smaller boner bobbing in a weak imitation of your powerful phallus.");
	output("\n\n<i>“Is... is... is that a cock- on your tail!?”</i> the zil whispers with a confused look on his face. His fingers idly play along the underside of his own member, barely tugging his skin back just enough for you to see his head peep out of its sheath.");
	// Nice
	if(pc.isNice()) {
		output("\n\nYou admit, <i>“Why yes, it is, and you two are going to get very comfortable with each other.”</i>");
		output("\n\nThe wasp-boy gasps and covers his mouth in surprise. He shuffles slightly backwards, but his dick seems perceptively thicker and more rigid. You calmly approach him and tenderly caress his inner thighs, just above where his carapace ends. <i>“Relax, I’ll be gentle,”</i> you promise.");
	}
	// Mischievious
	else if(pc.isMischievous()) {
		output("\n\nYou taunt, <i>“Why yes, yes it is. I think it’s a bit bigger than yours too, isn’t it?”</i>");
		output("\n\nThe wasp-boy numbly nods and chews nervously at his lip. His hand never really strays from his shamed boner, stroking it a little faster in the face of your words.");
		output("\n\nYou swagger up to him and put your hand on his thigh, rubbing it in small, playful circles. <i>“I just want to have a little fun...”</i>");
	}
	// MEAN
	else {
		output("\n\nYou cackle, <i>“Of course it is! What else would this be, a cake baster?”</i>");
		output("\n\nThe wasp-boy stares dumbly at you, not quite comprehending what you mean.");
		output("\n\nYou stalk up to him confidently. <i>“You’ve got me worked up to the point where I’ve gotta blow off some steam, and your ass is gonna catch all of it.”</i> Slapping his thigh, you trace his dick on the way up, feeling it twitch in its soft skin-cocoon in response.");
	}
	// END
	output("\n\nA slow trickle of pre-cum begins to ooze from your [pc.tailCock]’s cum-slit as you manhandle the submissive male. You hurry him into a receptive, on-all-fours position, his bare, armored ass upraised for easy access. His taut ballsack sways slightly underneath him along with his dick, trailing a ribbon of amber pre-honey all over the ground. You tremble in expectation as your hand falls on the smooth, armored plates that gird his cheeks, idly slipping a finger into the softer skin of his taint and winking, puckered star. He sighs into you and pushes back a bit. This clearly isn’t the zil’s first anal rodeo, but you plan to make it the most memorable.");
	output("\n\nSnaking up around your elbow and over your forearm, your [pc.tailCock] makes its way into your palm, trailing cock-slime behind and tingling oh-so-pleasantly from the way you cup it. You guide it down towards the willing, waiting entrance and urge it to slide forward an inch at a time, inexorably advancing on the puckered anus, dripping its juices as a lubricating vanguard before it batters down the wasp-boy’s anal gates. The sudden feel of your slimy cockhead grinding on him has you feeling momentarily weak, so you rest your hand on his back for support and watch while your wiggling appendage slowly burrows into the tight, hot hole.");
	output("\n\n<i>“Ohhh, it’s so... so strange!”</i> your squirming cock-sleeve pants as he wiggles his stuffed ass back in your direction. For one who was so determined to be on top, he sure seems to be spreading his innards wide to ease your passage. His bottom is thoroughly plugged with undulating tailcock");
	//(horse or U-sex)
	if(pc.isTaur() || (!pc.hasCock() && !pc.hasVagina())) output(", and you stand there and watch as you plow the defeated bee’s bottom, slowly turning him into your honey-dripping bitch-boy with each plunge of your rapacious cock-tail.");
	else {
		output(", and as you watch the exotic sight, you realize your hands are completely free to play with your untouched crotch. You begin masturbating right there, ");
		if(pc.hasVagina()) output("fingerfucking yourself");
		else output("stroking [pc.oneCock]");
		output(" and making sure to drip on his back while you plow this defeated bee’s bottom, slowly turning him into more of a honey-drooling bitch-boy with each plunge of your rapacious cock-tail.");
	}
	output("\n\nThe zil’s rectal walls feel almost like they’re textured for your benefit, each fold and ripple squeezing and sliding against you whenever you push in or out. Flexing your tingling, blissful member, you push it hard against something inside the svelte boy’s bottom, compressing it. He gives up a steady trickle of sweet cum and a whimpering moan of excitement, begging, <i>“Ung... right there! More-ahhh!”</i>");
	output("\n\nYou increase the pressure at his request, still sliding in and out while your bubbly pre turns his rectum into a gloriously slick slip-n-slide. An idea comes to you, and you hold your hand under his drooling member to collect his fragrant honey");
	if(!pc.isTaur()) {
		if(pc.hasCock() || pc.hasVagina()) output(", slathering it over your genitals for extra lubrication while you masturbate.");
		else output(", slathering it over your [pc.asshole] as you finger yourself, getting in on the anal pleasure in a whole different way.");
	}
	else output(", admiring its taste and texture as you drill him.");
	
	output(" The slim, pegged male is shuddering and quaking, barely managing to stay upright. He’s right there on the edge; all he needs is a little push.");
	output("\n\nForcefully redoubling, you begin to truly pound the zil’s asshole, hammering stroke after stroke home with such passion that his petite body is rocking back and forth, nearly tipping over into the ground. His poor, bloated erection is bobbing like crazy, constantly leaking slime. You press against his prostate a touch harder, and he cums. The first sign of orgasm is an almost vice-like seizing of his sphincter, closely followed by the sight of his dick swelling. His foreskin actually inflates at the tip, forming an oblong cum-balloon as the excess gushes from the opening like a pressurized spout. The zil falls to the ground, collapsing into his own honeyed jism, but it provides no relief. Your tail stubbornly continues to fuck him, milking more and more cum from your beleaguered bitch.");
	output("\n\nThe zil writhes in helpless pleasure, forced through one orgasm after another, unable to stop or think or talk. He moans and gasps inarticulately, unable to vocalize anything other than the mind-melting pleasure he’s enduring. The sight is enough to launch you over the edge as well, and you thrust as deeply inside him as you can, waves of cum already beginning the journey from your [pc.balls], through your [pc.tail], and out your [pc.tailCock]. The relief is palpable, and you slump back, releasing as deeply into your bitch as you can");
	if(pc.hasCock()) output(". [pc.EachCock] launches ropes of [pc.cum] onto his smooth, reflective butt at the same time, truly making it shine");
	output(".");
	if(pc.hasVagina()) output(" Spasming wildly, [pc.eachVagina] squelches and releases a flow of girly secretions.");
	if(pc.hasDickNipples()) output(" Your [pc.nippleCocks] climax as well, spraying their own [pc.milk] onto his back. The lust-lost zil doesn’t seem to care.");
	else if(pc.canMilkSquirt()) {
		output(" Your [pc.nipples] spray [pc.milk] as your climax rocks your body, splattering across his back in waves.");
		pc.milked(25);
	}
	
	output("\n\nAfter the first few pumps, your [pc.tailCock] seems to develop a mind of its own, and it begins to rock back and forth, plowing through it’s own ejaculate in its incessant quest for enjoyment. You keep fucking the zil until his asshole is gaping and frothing with your [pc.cum]. He doesn’t seem to mind, if the puddle of honey soaking his legs is any indications. Shuddering, you pull out and let your [pc.tail] close back up.");
	output("\n\nThe zil is lying there lamely, twitching his rump from time to time with a dopey smile on his face. This is an encounter he won’t soon forget.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}

//This is an additional on-victory sex scene for the male zil. Requires a cock. Should be suitable for taurs as long as they have front-mounted genitalia. Contains some brute/bimbo dialogue too.
//-Susumu
//Blowjob Time.
public function getABJFromAManzil():void
{
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	author("Susumu");
	output("Though he lies defeated in front of you, the zil-boy’s pheromones continue to cloud the air and charge through your system. He looks up at you expectantly, waiting to discover whether or not you’re one of the more cruel monsters in this jungle.");
	//Bimbo:
	if(pc.isBimbo()) output(" He’s so cute, but he looks uneasy! You know what always makes you feel better - lots and lots of yummy cum!");
	else if(pc.isBro()) output(" You’ve shown him who the alpha is. Time to get your reward.");
	else
	{
		output(" Calmy,");
		if(!pc.isCrotchExposed()) output(" you discard your [pc.gear] and");
		output(" slowly step towards him.");
	}
	output(" His gaze has shifted from your face to your crotch, mesmerised by your rising [pc.cocksNounSimple]. His mouth is hanging open by the time you reach him - your ");
	if(pc.cockTotal() > 1) output("biggest dick");
	else output("[pc.cockBiggest]");
	output(" is at its fullest.");

	output("\n\n<i>“Well?”</i> you say. <i>“Suck.”</i>");
	output("\n\nHe manages to pull some semblance of a stupid, lusty grin onto his face before getting up on his knees and pulling your [pc.cockBiggest] towards his lips, using it to part them with just the right amount of force. He’s clearly not new to this. The [pc.cockHeadBiggest] of your member is treated to a brief massage from the zil’s expert lips before being pulled into his wet mouth.");
	output("\n\nHis hands begin to explore your shaft, his fingers tracing up your cock towards its base before breaking into a steady pumping action.");
	if(pc.balls > 0) output(" One hand slips underneath to your [pc.balls], where it starts to rub, tug and tease.");
	else if(pc.hasVagina()) output(" One hand slips behind your [pc.cockBiggest] to start working its sensitive fingers into [pc.oneVagina].");
	else output( "One hand slips behind your cock, feeling around your taint for something else to play with. Finding nothing, it moves on undeterred to your [pc.asshole] where it starts to make itself useful.");
	output(" It seems you’ve happened upon quite the competent slut. Smiling, you jerk your hips forward, pushing further into his mouth and startling the zil-boy. He");
	if(pc.genitalLocation() < 2) output(" looks up at you and");
	output(" flutters his pretty wings lightly");
	if(pc.genitalLocation() < 2) output(", looking straight into your [pc.eyes]");
	output(" as he teases you with his tongue.");

	output("\n\nThe zil-boy’s tongue is exquisite, rolling around the tip of your increasingly horny member and collecting every bit of pre that you so graciously release. It soon slips out from between your [pc.cockBiggest] and his lower lip, managing to lick all the way along the bottom of your shaft and almost to the base. The bright yellow organ’s tube is normally used for collecting nectar, but this zil-boy slut uses it expertly to plant tiny kisses all across your length as it makes its journey.");
	output("\n\nWith your [pc.cockBiggest] occupied by his tongue and your ");
	if(pc.balls > 0) output("[pc.sack]");
	else if(pc.hasVagina()) output("cunt");
	else output("butthole");
	output(" occupied by one of his hands, he drops the other hand down to his own jet-black boner and begins jerking, his drooping foreskin quickly becoming wet with sweet-smelling pre.");

	output("\n\n");
	if(pc.genitalLocation() < 2) output("You put a hand behind his head, enjoying the feel of his downy spine-hair. He looks up at you, making his best subservient-little-bitch-boy face. You give his head a sudden pull");
	else output("Encouraged by your subservient little bitch-boy, you push your [pc.lowerBody] forward some");
	output(", forcing your member further into his mouth. H");
	if(pc.genitalLocation() < 2) output("is eyes widen, but h");
	output("e adjusts himself, and with a wiggle of his hips, continues jerking away at his swollen boner and planting tongue-tube kisses all over your length.");

	output("\n\nYou jerk your hips again, pulling him closer still. The zil-boy almost starts to choke as your [pc.cockBiggest] pushes into his throat, but now he understands what you want.");
	if(pc.balls > 0 || pc.hasVagina()) 
	{
		output(" The hand on your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.cunt]");
		output(" moves behind you and firmly holds your [pc.butt]");
	}
	else output(" The fingers pleasuring your [pc.asshole] pull out as a chitinous hand places itself on one of your cheeks");
	output(". Your cocksucker uses his new grip to push himself forward, finally pushing the oral invader into the depths of his throat. His eyes water as you rock your hips, pushing in and out of him.");

	output("\n\nTaking a firmer grasp of the zil’s head, you start rocking faster and harder, giving him inches at a time and taking them away just as soon. He’s stopped using the tube in his tongue to pepper your [pc.cockBiggest] with kisses. He’s trying to control it, trying to dab at your length with it but losing control. It lolls down his chin as he closes his eyes, jerking himself harder and allowing your cock to push further into him.");

	output("\n\nJust as you think you’re going to have to slap him to get his full attention back, the hand on your [pc.ass] moves back to ");
	if(pc.balls > 0) output("your [pc.sack] and gives it a squeeze");
	else if(pc.hasVagina())
	{
		output("your [pc.vagina]");
		if(pc.hasClit()) output(" and squeezes [pc.oneClit]");
	}
	else output("your waiting [pc.asshole]");
	output(", right as his throat contracts around what portion of your length is inside him. It pushes you over the edge and your [pc.cockBiggest] explodes. For a second, you almost think he’s going to be able to swallow everything you’re pumping into him, but the hand ");
	if(pc.balls > 0)
	{
		output("on your ball");
		if(pc.balls > 1) output("s");
	}
	else if(pc.hasVagina())
	{
		if(pc.hasClit()) output("playing with your [pc.clit]");
		else output("playing with your slit");
	}
	else output("fingering your hole");
	output(" moves to your waist and pushes, sliding off of your cock. Your last few spurts of [pc.cumColor] shower his face. A sweet, intoxicating aroma hits you as you realize that the zil-boy has painted his thighs with his species’ signature honey-like ejaculate.");
	output("\n\nThe zil-boy lazily cleans your cock off with his tongue before you collect your [pc.gear] and dress yourself. You leave him on the ground, still panting, taking occasional sips from the mixture of honey and [pc.cum] on his chitin-covered thighs.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}

public function zilLossRouter():void {
	if(flags["TIMES_LOST_TO_ZIL"] == undefined) flags["TIMES_LOST_TO_ZIL"] = 1;
	else flags["TIMES_LOST_TO_ZIL"]++;
	var choices:Array = new Array();
	choices[choices.length] = swallowDatZilCockCauseJooLost;
	//need twat
	if(pc.hasVagina()) choices[choices.length] = getBredByZil;
	//Req tailcunt
	if(pc.hasTailCunt()) choices[choices.length] = getTailPussyFuckedByZil;
	//NeedaDick
	if(pc.hasCock()) choices[choices.length] = zilSticksItInYourBoot;
	choices[choices.length] = theZilPretendToBeHelia;
	choices[rand(choices.length)]();
}

//Loss Scenes:
//*Swallow.
public function swallowDatZilCockCauseJooLost():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] == undefined) flags["TIMES_LOSS_SUCKED_ZIL_MALE"] = 1;
	else flags["TIMES_LOSS_SUCKED_ZIL_MALE"]++;
	// HP
	if(pc.HP() <= 0) output("Staggering back, too winded to fight, you wobble unsteadily on your [pc.feet] before your body gives out and drops you onto your back. You struggle to rise, but the zil is there almost immediately. He hovers just above you with his legs spread and his cock dangling. There’s no escaping his musk now. It hangs around your head in a cloud, and you wind up inhaling lungfuls of his scent. Your head is pounding with unexpected emotions that make it hard to remember how to fight. After a few failed attempts to rise, you stop trying, and just look up and breathe while the zil’s wings blow his honey-sweet pheromones at you.");
	// Lust
	else output("Dropping to your knees, you look up at the zil with an emotion you can’t quite place. He’s fluttering closer, and as you admire the shape and texture of his cock from afar, still breathing deeply of his pheromones, you recognize it for what it is: adulation. This alien is amazing, and he smells so... so sexy. He buzzes by your head and you crane to follow, licking your lips as your eyelids lower into a seductive cast. Seeing your receptive state, he hovers closer, blowing a few last waves of musk your way, ones you’re all too happy to inhale as you eye his ebony cock.");
	// Combine
	output("\n\nWhen the bug-man’s thighs brush against your face and his knuckles clack against his hips in excitement, you know you’re going to get the object of your desire. The zil’s loins are slick with sweat from the exertions of the fight, but like the rest of him, are sweet in scent. Just admiring his natural aroma");
	if(pc.hasVagina()) {
		output(" causes [pc.eachVagina] to tingle hotly, growing more and more moist.");
		if(pc.hasCock()) output(" A familiar, aching hardness even spreads through your [pc.cocks].");
	}
	else if(pc.hasCock()) output(" causes [pc.eachCock] to thicken to an aching hardness.");
	else output(" causes your [pc.skin] to flush hot with lust.");
	output(" You sigh contentedly when the honey-oozing member rubs across your cheek, smearing its sweet slime onto your skin and subjecting you to an even more potent dose of the male bouquet that has you so spellbound.");
	
	output("\n\nThe zil grabs hold of your [pc.hair] and begins to grind himself up and down your [pc.face], letting his balls rest on your lips, draping you in moist wasp-cock until you can barely tell what’s going on anymore. A simple, facile expression overtakes your face; the scent has become so enjoyable, so all-consuming, that you just stop thinking. Your mouth opens and accepts the smooth, cute sack inside it, polishing it to a reflective sheen with your tongue.");
	output("\n\nGroaning appreciatively, the zil admits, <i>“Ungh... you know what you’re doing, for an off-worlder. Yes, right there.”</i> His hips jerk slightly as he begins to hump your face, rubbing his potent odor all over you, his glans just barely peaking above his soft foreskin at the apex of his thrusts. <i>“Mmmm, not bad.”</i>");
	output("\n\nThe corners of your mouth quirk up in a simple smile at the praise, and when his balls finally exit your mouth, you wipe away the spit and giggle, <i>“Really?”</i> Your good humor wavers a bit when you realize that the sensory pleasure has diminished slightly. Seeing this, the zil puts his cock into your open, confused mouth, his slippery skin sliding effortlessly along your saliva-slick tongue. You hum in excitement, and cup his balls in your hands, wafting more of his sweet pheromones at you while you seek to please your insectile master.");
	output("\n\n<i>Master...</i>");
	output("\n\nYes, that seems like the right title. This cock, this delicious, honeyed, foreskin-sheathed cock... it owns you. Your cheeks hollow as you begin to suck, and the reward of sweet honey flows out onto the back of your tongue in response. Gulping it down, you pry your tongue under his foreskin and collect some more of his pre-honey, circling slowly around his tip. It dribbles out more sweet reward to collect - a sure sign of Master’s approval.");
	output("\n\n<i>“Do not stop! I... oh... I’m close,”</i> the zil admits as he runs a hand over your [pc.hair].");
	output("\n\nHis wish is your command. You squeeze his sack a little tighter and begin to bob up and down slowly, dragging your lips across his folded skin, admiring the way it rolls back to place his sensitive tip on the back of your tongue whenever your mouth presses against his abdomen. Every breath you take is laced with his musk and sweetness. You shudder uncontrollably as you service him, and he’s quickly forced to move your head for you, pistoning your mouth up and down his ample length. You look up at your master while he uses your face as his personal mouth-pussy, and he meets your gaze, his balls jumping in your hand.");
	
	output("\n\nA rope of honey-like cum splatters off your tongue and slides down your throat before you can react. Master’s balls twitch so perfectly, pumping their syrupy load through his lovely dick and into your waiting mouth. You collect as much as you can on your tongue, holding each successive squirt on your palate until your cheeks are puffed out almost comically. He groans and pulls out, stroking himself as he fires a series of long, wet ejaculations over your [pc.face] and [pc.hair]. You smile, still holding his load, and let him coat you with the ropes of goo.");
	output("\n\n<i>“Swallow,”</i> your master’s voice buzzes in your ears. You open your mouth to show it to him, and then gulp noisily. It takes two big, long swallows to consume all his honey. Then, you open wide to show him what you’ve done.");
	output("\n\nThe zil pats your head and chirps, <i>“Nice work.");
	if(!silly) output(" Perhaps we’ll meet again and I can bring you home.");
	else output(" Perhaps if we meet again you’ll get a little bee all your own.");
	output("”</i>");
	output("\n\nYour master has you lick him clean before he buzzes off into the trees, leaving his sensuous taste to remember him by. You sit there, staring at nothing for perhaps thirty minutes. Then, as the effect he had on you evaporates, you realize just how fucking horny you are! You vigorously masturbate for the next two hours before finally sating yourself and passing out.\n\n");
	// Blah blah, combat texts.
	pc.loadInMouth(enemy);
	processTime(40);
	pc.orgasm();
	CombatManager.genericLoss();
}

//*Get Bred.
public function getBredByZil():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	if(pc.HP() <= 0) {
		output("You take one shuddering step forward and collapse facedown in the dirt. The zil silently buzzes over and grabs your ");
		if(pc.isBald()) output("head");
		else output("[pc.hair]");
		output(", pulling your face up so that his curiously swollen dong fills your view. A single bead of honey drips from the tip to fall on your lips, and as you breathe in his scent, his heavenly scent, you feel your slit transform from moist pussy into lewdly dripping quim. Seeing the effect he has on you, he backs off while you ");
		if(pc.isTaur()) output("squirm your hindlegs, desperate for friction on your cunny.");
		else output("dive finger-first into your cunny, admiring the lust he’s inspired within you.");
	}
	else {
		output("You cast one lewd glance at the zil’s wondrous, cunt-dampening dong and sink down to your knees, eventually pitching over with your ass up and ");
		if(pc.isTaur()) {
			output("your soaked sex");
			if(pc.vaginaTotal() > 1) output("es");
			output(" fully displaying your need.");
		}
		else {
			output("two fingers diddling ");
			if(pc.vaginaTotal() == 1) output("your ");
			else output("a ");
			output("needy quim.");
		}
	}
	output("\n\nGroaning as your labia spread wide around your questing fingertips, you begin to rock back and forth for the male’s amusement, imploring him to stick his thick wasp-dong into your ready passage. Looking at the way his skin glistens with sweat and pre-cum, you wonder just what his fully exposed glans must look and feel like. Will his ebony cock-covering roll back inside you and let his sensitive tip experience your pussy first-hand, or will it stay phimotically closed? You hum in excitement and forget about why you were resisting him. Your attention is entirely focused on his drooling member and your gushing cunt. It’s as if your entire universe has become nothing more than one big, horny slit, aching to be filled with the zil’s musky member.");
	output("\n\nYour future mate admires your prone form, and he slowly circles, trailing soft touches on your [pc.butt] as he admires the way you spread yourself for him. Your [pc.hips] lurch back, almost of their accord. You want him inside you, and with him this close, blowing his fragrance around, you’re too horny to think straight. Juices drip down your thighs in rivulets while you work yourself over.");
	output("\n\n<i>“Very nice,”</i> the wasp-like alien admits. <i>“You look a fine mother for my young, assuming you can bear a zil.”</i> His hand connects with one of your cheeks, slapping it just hard enough to make your [pc.skin] sting. <i>“Very nice, indeed.”</i> He squeezes it affectionately and ");
	if(pc.tone >= 65) output("pinches your bottock, admiring the firmness of it.");
	else output("jiggles your bottock, admiring the way it ripples while your juices stream unchecked from your fingers.");
	output(" The male’s fingers join yours in exploring your netherlips. Gingerly, he rubs the outside of your soaked folds, adding a second sensation to your already overburdened vagina.");
	var x:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	if(x < 0) x = pc.cuntThatFits(enemy.cockVolume(0));
	if(x < 0) x = 0;
	output("\n\n<i>“Are you ready to be bred?”</i> the zil asks with a hint of politeness. His tone brooks no disagreement. The question is a formality - you both know you want, no, need it. You bite your lip and nod. At the same time, you pull your fingers free of the steaming-hot honeypot between your [pc.legOrLegs]. Your " + possessive(pc.vaginaDescript(x)) + " lips are slightly parted, spread and open, ready to be taken.");
	
	output("\n\n<i>“Fuck me,”</i> you whimper.");
	
	output("\n\nHe does, sliding forward in one powerful stroke, his hands pulling on your [pc.hips] for leverage. Unlike the rest of his carapace-gilded frame, the zil’s hands are soft and fleshy like a human’s. His grip is solid and effortless, just like his thrusts. You can feel his cock inside you, nice, thick, and warm. It caresses your folds perfectly, and even with your moisture, ");
	if(rand(2) == 0) output("you can feel your cunny pulling back his skin to expose his crown.");
	else output("you can feel your cunny vainly trying to pull back his phimotic dick-skin. His crown stays steadfastly hidden from your lusty snatch, but you’re sure you’ll make him fill you all the same.");
	//Cuntchange!
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	output("\n\nYou feel the zil’s hands shift to wrap around your chest");
	if(pc.biggestTitSize() >= 2) output(" and hold onto your [pc.chest]");
	else output(" for support");
	output(". His wings buzz louder and louder to keep him aloft, and he slides out slickly, his excess skin shifting perfectly inside you to aid in lubrication. You moan at this, hungry for him to return to your silken depths. He doesn’t keep you waiting long. His dick burrows into your [pc.vagina " + x + "] with confidence and skill, pressing across a sensitive spot inside you.");
	//HOARSE VERSION.
	if(pc.isTaur())
	{
		output("\n\nHe exhales against your ear, <i>“A shame you can’t reach");
		if(pc.hasClit()) output(" [pc.eachClit]");
		else output(" your slit");
		output(" from up there, isn’t it? I want to see you make yourself cum for me.”</i>");
		output("\n\nShuddering as his dick pistons through your sloppy channel, you whimper at the aching coming from your hindquarters. He’s right of course; you desperately desire to slip a hand into your folds, plowing yourself wide open");
		if(pc.hasClit()) output(", perhaps fondling [pc.eachClit]");
		output(" just to give the Zil the show he desires. The fantasy and desire is so intense that [pc.eachVagina] clenches with need, fluttering anxiously.");
	}
	//NON HOARSE
	else 
	{
		output("\n\nHe exhales against your ear, <i>“Touch ");
		if(pc.vaginaTotal() > 1 && pc.hasClit()) output("one of your clits");
		else if(pc.hasClit()) output("your clit");
		else output("yourself");
		output(", little flower, I want to see you bloom.”</i>");
		if(pc.hasClit()) 
		{
			output("\n\nShuddering as his dick pistons through your sloppy channel, you obey. [pc.EachClit] pulses pleasantly as if it senses what’s to come.");
			if(pc.clitLength >= 3) {
				output(" You immediately wrap your hand around ");
				if(pc.totalClits() > 1) output("one of them");
				else output("it");
				output(" and begin to stroke it, pulling and squeezing slowly. The sensitive, cock-sized pleasure-buzzer trembles in your grip, and you nearly black out from the bliss that it brings.");
			}
			else if(pc.clitLength >= .75) output(" You immediately reach up and begin to caress [pc.oneClit], squeezing and caressing its swollen surface. The sensitive organ seems to inflate, growing larger in response to your touches, and you nearly black out from the bliss that it brings.");
			else output(" You immediately reach up and begin to thumb at [pc.oneClit], rubbing around its small surface with familiar touches. The sensitive organ is so pleasant to touch that it nearly blacks you out with the bliss your affections bring.");
		}
		else
		{
			output("\n\nShuddering as his dick pistons through your sloppy channel, you obey. [pc.EachVagina] pulses pleasantly as if it senses what’s to come and you nearly black out from the bliss that it brings.");
		}
	}
	//MERGE
	output("\n\nThe zil ");
	if(pc.hasNippleCocks()) output("strokes");
	else if(pc.hasFuckableNipples()) output("fingers");
	else output("pinches");
	output(" your [pc.nipples], and then you’re cumming on him. You shudder and squirm on his magnificent pole like a whore in heat, ");
	if(pc.wetness() <= 2) output("dripping");
	else if(!pc.isSquirter()) output("leaking");
	else output("squirting");
	output(" all over his perfect cock while he manipulates your most erogenous areas. He ");
	if(pc.hasNippleCocks()) output("pumps your nipplecocks faster");
	else if(pc.hasFuckableNipples()) output("fingers your fuckable nipples faster");
	else output("pinches your nipples harder");
	output(", and your orgasm redoubles, turning you into a weak, mewling puddle, body shaking weakly while your cunt hungrily squeezes on your mate’s member. The zil ruts at [pc.oneVagina] the entire time");
	if(pc.totalVaginas() > 1) output(", sometimes shifting to plunge into another, different fuck-hole");
	output(". Your [pc.butt] seems magnetized to his crotch. You’re little more than a bliss-drugged passenger in your own body at this point, and it’s amazing.");
	//Second cunt change
	if(pc.totalVaginas() > 1) {
		for(var y:int = 0; y < pc.totalVaginas(); y++) {
			if(y != x) {
				pc.cuntChange(y,enemy.cockVolume(0),true,true,false);
				break;
			}
		}
	}
	output("\n\n<i>“Such an obedient alien. You will make a fine mother,”</i> the zil compliments as you slowly sink back down from the heights of ecstasy. His movements intensify to the point where his hips are jackhammering your cunt almost as fast as his wingers are fluttering. Your juices are splattering out onto his crotch with each ass-jiggling impact, thick with the bug-man’s sweet pre-cum. There’s a constant trickle of his warm love-juice in your [pc.vagina " + x + "] now, and you can feel his tight, smooth ballsack clenching underneath him as he mounts you.");
	
	output("\n\nThis male is going to fill your juicy, oversensitive slit with cum until you’re pregnant! A voice in the back of your mind tries to warn you that there’s something wrong with that, but you just... you can’t bring yourself to care. He’s so wonderful, and he smells... so... GOOD. You find the strength to swivel your hips on the zil’s soaked crotch, and you look over your shoulder at the slender male, egging him on with your eyes, begging him to fertilize you, to spend his musky, honeyed cum deep into your waiting womb.");
	output("\n\nA powerful twitch works its way through the wasp-guy’s more-than-ample cock in that moment, filling you delightfully for a half-second before a gush of warmth spouts from the end to spray against your cervix. You can feel some of it slip inside, causing a wrinkle of worry to cross your brow, but that thought is obliterated by a fresh deposit of wasp-spunk. His cum thoroughly seeds [pc.oneVagina]. You regret not getting a sample of it to taste until he begins to thrust once more, pushing his thick juices deeper inside to more effectively inseminate you.");
	output("\n\n[pc.EachVagina] convulses in a second climax, brought on by the feeling of simultaneous fucking and filling. Pistoning back and forth, the zil seems heedless of your pleasure, and he focuses entirely on fucking your [pc.vagina " + x + "] as hard and fast as possible in order to prolong his own orgasm. Strings of honey and girl-cum dangle between your matched genitals when he pulls back. Your eyes rolls back under the decadent sexual assault");
	if(pc.cockTotal() > 1) {
		output(", while [pc.eachCock] dumps a wasted load on the ground");
		if(pc.cumQ() <= 100) {}
		else if(pc.cumQ() <= 1000) output(", forming a big puddle");
		else if(pc.cumQ() <= 4000) output(", forming a small lake");
		else output(", forming a huge lake");
	}
	output(".");
	if(pc.hasFuckableNipples()) output(" [pc.Cum] erupts from your [pc.nippleCocks] in long streams of phallic pleasure while the zil looks on, bemused by your copious fluid production.");
	else if(pc.canMilkSquirt()) 
	{
		output(" [pc.Milk] erupts from your [pc.nipples] in long streams of lactic pleasure while the zil looks on, bemused by your copious fluid production.");
		pc.milked(25);
	}
	
	output("\n\nTime loses all meaning to you, so when you finally come down, you’re more than a little confused. How long were you been cumming anyway? Globs of amber juice drip from your well-used entrance. It’s puffy, engorged, and so sensitive from the recent breeding that you dare not touch yourself just yet. The zil suddenly appears in front of your and holds his dick, obviously expecting you to clean it. You stifle your eagerness until you catch a whiff of his pheromones, and then you’re tugging him into your mouth, licking every drop of honey from his member. You tongue around under the foreskin to collect every delicious drop, savoring the strengthening scent and taste of your alien lover’s physique.");
	output("\n\nAbruptly, he pulls himself out, clean of everything but your spit. Just how long were you cleaning him? The zil gathers some soft ferns and makes you a soft bed from them. You’re all too happy to lie on it, even if it does lift your [pc.butt] up in the air and make sure that all his seed stays deep inside you...\n\n");
	processTime(30+rand(15));
	pc.orgasm();
	pc.loadInCunt(enemy, x);
	CombatManager.genericLoss();
}
//*Get tailpussy fucked.
public function getTailPussyFuckedByZil():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	if(pc.HP() <= 0) output("Falling over from from the beating you’ve taken");
	else output("Utterly immobilized by your lust for this remarkable specimen");
	output(", you lie prone on the ground, your sinuous, prehensile tail whipping back and forth in the air, excited into a frenzy by the scent of a fresh, horny cock in the air. It waves above you like a half-hypnotized snake-charmer’s viper.");
	output("\n\nSwaying rhythmically, the zil zips closer and remarks, <i>“Oh, that is an odd place for a vagina.... Did you get it from a cunt-snake, or something else?”</i> He cocks his head to the side, regarding it while his wings beat me more of his pheremonal scent towards you. This in turn causes your [pc.tailgina] to secrete fresh droplets of lubricant, and they spatter down over your [pc.butt] in lewd trails.");
	
	output("\n\nThe zil flits closer and pats your swaying appendage, tilting his head to the side curiously as it adjusts itself to rub its glossy cunt-lips across his palm. He giggles in pleased surprise and tugs on himself almost gleefully. The cocky wasp-boy is as entranced by your [pc.tailgina] as it is by his thick, honey-dripping member, and nervously, the two slowly close in on each other. Gingerly touching, the soft, fragrant penis presses against your sensitive folds, and an electric thrill spasms up your spine. Your prehensile tail pushes back against it, parting slowly, its outside bulging to accept the cylindrical shape of the fat wasp-cock.");
	output("\n\n<i>“Ahhhh,”</i> the eager bug-boy sighs as your tail devours his copious pre-honey. Concentric ripples writhe along the outside of your tail, obviously matched by a pleasant internal motion that pulls the sable alien dong deeper into your [pc.tailgina]’s grip. The foreskin wrapping up his thick, sweet shaft stretches from suction, drawn in more rapidly than the rest of his erection. Windmilling his arms around in confusion, he seems unready for the intense stimulation your seductive, rear-mounted limb can provide. Your lusty captor’s wings beat out of sync as your tailcunt truly begins to work, making lewd squishes around the girthy tool, dribbling streams of lubricant down his pert ballsack.");
	output("\n\nA sudden thump assaults your ears a moment later. You blink, taken aback by the abrupt audio, but your view is blocked by a glossy forearm. The zil has fallen down onto all fours; his hot breath washes over your ear as he shudders and groans, passionately twitching his hips back and forth fruitlessly. Your milking, squeezing little quim has a firm grip on the zil’s member, so his humping makes no difference - the slit is securely attached to his loins no matter how he shakes.");
	output("\n\nThe pleasure is like a constant, euphoric buzz, which, for you, is a lovely change of pace. You lie there, your own [pc.hips] slowly swiveling to press your crotch into the ground, anxious for any pleasure or friction. ");
	// Cocks!
	if(pc.hasCock())
	{
		output("\n\nYour [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" pleasantly full down below. The ripples of pleasure from your prehensile quim seem to vibrate through your middle straight into your stiff dick");
		if(pc.cockTotal() > 1) output("s");
		output(", and you begin to leak pre-cum quite freely. Your efflux turns the dirt to mud, which makes your grinding that much more pleasurable, causing yet more to escape your urethra. The sexual sludge adheres to your [pc.cocks]");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" to cover ");
		if(pc.cockTotal() + pc.balls <= 1) output("it");
		else output("them");
		output(" with filthy moisture.");
	}
	// Else Cunts
	else if(pc.hasVagina()) {
		output("\n\nYour [pc.vaginas] tingle");
		if(pc.vaginaTotal() == 1) output("s");
		output(" hotly from the slow grind. The ripples of pleasure from your prehensile quim seem matched by the ones in your [pc.vaginas], and your swollen, puffy pussy-lips start to ");
		if(pc.wetness() <= 2) output("dribble");
		else if(!pc.isSquirter()) output("stream");
		else output("gush");
		output(" fluids with lusty abandon. The liquid ardor soaks into the mud, which makes your grinding that much more pleasurable, causing even more feminine efflux to escape your body. The slimy, sexual sludge coats your vulva with filthy moisture.");
	}
	else
	{
		output("\n\nYour groin tingles hotly from the slow grind along with your [pc.asshole]. The ripples of pleasure from your prehensile quim seem matched by clutching contractions in your back passage. Somehow the feeling of grinding your bare crotch on the dirt is arousing you. Flecks of dirt stick to your sweaty [pc.skin]. You have a hard time caring.");
	}
	
	output("\n\nThe zil’s rutting motions slowly increase in speed and force until you can feel his smooth thighs smacking off your [pc.butt]. Slipping and sliding, your tail barely hangs on it, actually coming partway off his cock before vacuuming tight to his hairless nethers. You exhale loudly at the new sensations this brings to you and rest your head on your arms, luxiriating in the feelings pulsing through your back-facing sex organ and groin.");
	if(pc.hasNippleCocks()) output(" Your [pc.nipples] even get in on the act, leaking their own pre despite being compressed by your [pc.fullChest].");
	
	output("\n\nEventually, even supporting himself becomes too much for the frenzied zil. He flops down and rolls aside, grabbing your tail in both hands for leverage. Your slick, inner passage feels almost violently hot. It convulses around the honey-leaking cock inside it whenever the wasp-boy bottoms out inside it. He’s fucking your tailslit like some kind of cheap sex-toy, not attempting to pleasure you in the least. Of course, the way you’re starting to pant and moan, there’s no way you can conceal just how good your gushing, squeezing snatch makes this feel. That little cunt is just packed full of nerves, and you know that all it’s going to take to make you cream yourself is one good squirt from your lover’s dick.");
	output("\n\nYou flex muscles you’re barely aware of controlling. The concentric rings of pleasant, cock-draining pressure ripple along the musky wasp-dong faster and faster, pleasuring your honey-scented lover while he uses you as little more than a hungry, disposable pussy. Your juices run so freely that every pull up is matched by a lewd ‘schlorp’ and followed by a squirt of your girl-spunk as it bottoms back out. You squeeze tighter, just around his base, feeling his urethra expand, filling up with hot, sticky boy-honey mere moments before it explodes inside you.");
	output("\n\nA supernova of white-hot ecstasy explodes in your tail-bound canal, and as the heat dissipates into a nebula of pleasure, you feel the zil’s foreskin stretch tight for a millisecond before another cosmic anomaly is battering your confused nervous system. The contractions before... they were nothing compared to what’s going on in your tailcunt now. If you didn’t have your eyes slammed shut while you writhe in the dirt, you’d see massive distensions along your flexible, pseudo-female anatomy, greedily siphoning the fresh honey deeply inside you. The only thing to escape around the puffy lips of your [pc.tailCunt] are a few drizzles of your own fresh lubricant. Every single drop of spooge is devoured by your alien anatomy, feeding its insatiable cum hunger.");
	// cocks
	if(pc.hasCock()) {
		output("\n\n[pc.EachCock] suddenly begins to flex through the mud-bath underneath you, arcing and straining with unrepentant lust as it prepares to fire its creamy load into the morass. You grit your teeth anxiously as the upwelling [pc.cum] dilates your urethra");
		if(pc.cockTotal() > 1) output("s");
		output(", abruptly exploding out of you in hot, sticky jets, each pulse thicker and more pleasant than the last. The mess below squishes as you unload, and ");
		if(pc.cumQ() < 1000) {}
		else if(pc.cumQ() < 5000) output("it’s gotten so wet and sticky that your entire front is soaked with the cum-mud, but you have a hard time caring, as good as it feels.");
		else if(pc.cumQ() < 10000) output("it’s gotten so wet and sticky that you sink partway into the mire, but it feels too good to care.");
		else output("everything is so wet and sticky that a fair portion sinks into the swamp of cum-mud you’ve made. It feels so good that you don’t even care - you just luxuriate in your dripping, spent spunk.");
		if(pc.hasNippleCocks() || pc.canMilkSquirt()) {
			output(" At the same time, your ");
			if(pc.hasNippleCocks()) output("[pc.nippleCocks]");
			else output("[pc.nipples]");
			output(" are adding to the deluge. If you had any sense, you’d grab hold to ");
			if(!pc.hasNippleCocks()) output("milk them");
			else output("jerk them off");
			output(".");
		}
		if(pc.hasVagina()) output(" [pc.EachVagina] is fluttering in neglected sympathy.");
	}
	// else cunts
	else if(pc.hasVagina()) {
		output("\n\n[pc.EachVagina] suddenly begins to spasm in the moist mud underneath you, expelling ");
		if(pc.wetness() <= 1) output("droplets");
		else if(pc.wetness() <= 2) output("dribbles");
		else if(pc.wetness() <= 3) output("a small stream");
		else if(pc.wetness() <= 4) output("a stream");
		else output("a gushing river");
		output(" of your girl-cum.");
		if(pc.hasClit())
		{
			output(" Your throbbing hard clit feels fantastic as you hump the ground below, mashing it into the mud your juicy snatch");
			if(pc.vaginaTotal() > 1) output("es are");
			else output(" is");
			output(" so willing to provide.");
		}
		output(" Fruitlessly humping, you writhe your way through your tail’s orgasm, wishing you had something inside the entire time.");
		if(pc.hasNippleCocks() || pc.canMilkSquirt()) {
			output(" At the same time, your ");
			if(pc.hasNippleCocks()) output("[pc.nippleCocks]");
			else output("[pc.nipples]");
			output(" are adding to the deluge. If you had any sense, you’d grab hold to ");
			if(!pc.hasNippleCocks()) output("milk them");
			else output("jerk them off");
			output(".");
		}
	}
	output("\n\nThe zil eventually finishes pumping his honey-flavored goo into your tail and slumps weakly onto his back. His heavy breathing is audible, and you can tell he’s trying to recover quickly. It doesn’t help, then, that your tail is still connected to his genitals, slowly sliding up and down his length to coax a last few droplets him. You relax and wonder if you can encourage him to go again. His surprisingly soft hands grab your hungry pussy and yank it away before you can make up your mind. Stumbling drunkenly, the well-milked zil makes his way towards the concealing forest, nearly tripping over his feet a half-dozen times. From where you lie, you note a definite reduction in the size of his smooth pouch.");
	output("\n\n<i>“Good boy,”</i> you think as you let your eyes flutter closed and relax in post-coital bliss.");
	//[Next]
	clearMenu();
	processTime(40+rand(20));
	pc.orgasm();
	pc.loadInCuntTail(enemy);
	addButton(0,"Next",tailPussyFuckZilEpilogue);
}
public function tailPussyFuckZilEpilogue():void {
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	output("An hour later, you wake from your sexual slumber, feeling a little bit worse for the wear.");
	if(pc.hasCock() || pc.hasVagina()) output(" Fragrant, musky mud clings to you all over. You fairly reek of your own sexual effluence - gross. Luckily, a babbling brook can be heard a short distance away, and you spend the better portion of another hour cleaning up.");
	processTime(30+rand(15));
	clearMenu();
	output("\n\n");
	CombatManager.genericLoss();
}
//*Apparently Dudes Can't Peg Other Dudes:
public function zilSticksItInYourBoot():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	//(HP Loss) 
	if (pc.HP() <= 0) 
	{
		output("Staying upright has become a challenge you aren’t fit to overcome anymore. This zil is just too strong for you. You catch yourself on your hands to maintain some semblance of control over your situation, casting a rebellious look at your alien aggressor. He chortles, tracing carapace-clad knuckles softly over your spine, his wings fluttering softly as he circles your semi-prone form. An exposed palm falls on your [pc.butt] and squeezes one supple cheek reassuringly, almost apologetically. You try to look up at him, and in that action is your undoing. A soft, cushy weight falls across your nose, drooling a little bit of honeyed fluid onto your cheek. Its musky, sweet scent fills your nostrils, making your head spin with its potent aroma.");
		output("\n\nYou cross your eyes to look at it; the glistening, onyx skin filling your view with its supple, surging length. The thick zil-cock spurts a few thick globs of honey onto the bridge of your nose as you drink more deeply of his scent, and [pc.eachCock] ");
		if(pc.lust() <= 60) output("hardens");
		else if(pc.lust() <= 80) output("grows harder");
		else output("begins to pulsate");
		output(" from fresh surges of lust");
		if(pc.hasVagina()) {
			if(pc.vaginaTotal() == 1) output(", your cunny");
			else output(", your cunnies");
			output(" joining it in engorging to delicious, sexual sensitivity");
		}
		output(". You moan as the alien’s cockscent addles your thinking; your arms folding as they forget how to support you in the face of this all-consuming lust.");
		output("\n\nYour rational thought abandons you at this point. You want to fuck this zil and to be fucked by him at all costs. Your genitalia will accept nothing but wasp-induced orgasm. Pulling off your gear, you present yourself in hopes that he’ll at least touch your dribbling boner");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	// Lust Induced Loss
	else 
	{
		output("Shuddering as the scent of the alien aggressor overwhelms your feeble resistance, you fall down in an uncoordinated heap, one hand plunging into your equipment to strip it away. Your heart is hammering, each beat carrying the fevered lust deeper into your groin, inflating [pc.eachCock] to steel-hard rigidity. Pre-jism drips out in heavy droplets, spattering the ground underneath you in a mockery of jungle dew.");
		output("\n\nThe zil flutters up curiously, his gaze flitting past yours as he admires the way your groin secretes evidence of your lust.");
		output("\n\n<i>“");
		if(pc.hasVagina()) output("I originally thought to breed you. I’ve changed my mind,");
		else output("A shame you are not female. I had hoped to breed,");
		output("”</i> he admits, but then his hand comes to rest on your upraised [pc.butt], giving it a none-too-subtle squeeze. <i>“We can still have fun, I think.”</i> The waspling’s wings buzz around you as he floats back before you. His leaking, foreskin-shrouded cock presses against your cheek abruptly, sliming you with the stuff as he forces you to take a direct dose of his pheromones. <i>“Yes... this will be fun.”</i>");
		output("\n\nYou moan and raise your ass higher, overcome with lust. He’s right.");
	}
	// Both
	output("\n\nAn alien palm gently grips your chin and lifts your head so that his spongy, dripping skin is wrinkling, pushed against your lips. The sheer softness of his hand and his organic cocksleeve surprises you, considering the chitin that covers the rest of his body. As your lips open and his velvety, honeyed boner slips inside you, you suppose that a creature with such a hard outside must have a soft, beautiful center. You slide your tongue into the tip of his dickskin to collect the fresh honey, circling the glans while you slobber all over the rest of his length, gratefully soaking this alien boner with your spit. The taste and the smell combine into a brain-breaking deluge of foreign, sexual excitement, and you’re beginning to feel almost utterly addicted to the way this is making you feel.");
	output("\n\n<i>“Ohhh, not so fast,”</i> the zil moans, rocking his boyish hips back and forth in your lips without meaning to. <i>“We’re both going to have fun!”</i>");
	output("\n\nThe sable seductor pushes you away almost regretfully, connected to your broad, unthinking smile by a strand of your eager, bubbling saliva. The web of clear spit eventually breaks with an abruptness that startles you from your dick-sucking daze, though the scent remains heavy on your mind.");
	output("\n\n<i>“Hold that pose,”</i> the onyx-armored male coos as he circles you, passing beyond the edges of your vision. You shiver nervously and try to obey. If you didn’t, he might not make you cum your brains out, or let you scent his heavenly erection anymore!");
	output("\n\nA prod on your [pc.asshole] alerts you to the zil’s plans");
	// butvirgins
	if(pc.analVirgin) {
		output(", and you actually pull away, a little scared to be taken in such a way.");
		output("\n\nThe alien blinks his black eyes and cocks his head to the side. <i>“You have not... played with this hole?”</i>");
		output("\n\nYou bite your lip and nod, finding yourself almost eager to please him in spite of your earlier reservations. You’re so fucking horny for him, but you just can’t imagine that sex this way would feel good at all!");
		output("\n\nThe zil reassuringly strokes his hand along your back, gently pulling you towards him as he buzzes, <i>“Relax and it’ll feel good. You made me nice and slippery, remember?”</i>");
		output("\n\nYou lick your lips and nod, biting your lips as the zil brings his cock closer to your unprotected anus. His palms press on each side of your upturned rump while his thumbs reach inward, spreading your [pc.butt] nice and wide to give his spit-dripping cock an easy, puckered target. The zil smushes his himself against you, the dickskin bunching up and folding back as spreads your sphincter, inch after inch slowly sliding into your virginal asshole. You groan in a mixture of pain and discomfort; the sensations are completely foreign to you, and it’s hard to make yourself relax.");
		output("\n\n<i>“You’re tight!”</i> the zil chirps as he continues to slide inside you, able to plunder your once-virgin ass thanks to your own slobber. Spasming around him, your sphincter flutters on the edge of control. You’re trying so hard to relax, but this is all so... so odd! Slowly, you’re becoming aware of another sensation, a pleasant one, that’s building up in your crotch. [pc.EachCock] had softened, but now, ");
		if(pc.cockTotal() == 1) output("it’s");
		else output("they’re");
		output(" rising up against your belly with fresh lust, spooling out ribbons of pre-cum that seem without end.");
		// lose virginity!
		pc.buttChange(enemy.cockVolume(0),true,true,false);
		output("\n\nThe alien slaps your [pc.butt] when he bottoms out, making you drip even harder, and he congratulates you, <i>“Good " + pc.mf("boy","girl") + ". It’s going to get even better. Now just take it and cum yourself dry.”</i>");
		output("\n\nIt gets better? A sudden void encompases your consciousness as the zil withdraws, but he’s back a moment later, slapping his hips into your ass with one smooth pump. He bounces back off and assumes an easy rhythm, fucking you firm and gentle. He seems to love the way you feel wrapped around his tool - that or he’s loving the fact that he’s the one to deflower you.");
	}
	// repeat!
	else {
		output(", and you sigh when you realize what he wants to do.");
		output("\n\nThe alien blinks his black eyes and chortles, <i>“Not your first time?”</i> His finger presses against your anal star, wiggling around and exploring you in anticipation of the butt-fuck to come. <i>“No, not your first time. That’s good; I won’t have to go easy on you.”</i>");
		output("\n\nYou whimper at that declaration, but your insectile master proves it true a moment later when he smoothly thrusts himself inside you. His slippery dick slides right past your sphincter in seconds, the inches plowing aside your body’s token resistance as you simply try to relax and enjoy it. It’s not easy, but after he bottoms out with his balls resting against you, you find yourself feeling rather good. [pc.EachCock] rises to full size and begins to dribble a steady runnel of pre-cum onto the ground, spilling out your orgasmic precursor in quantities far beyond normal.");
		// buttchange
		pc.buttChange(enemy.cockVolume(0),true,true,false);
		output("\n\nThe zil squeezes your cheeks in his hands and begins to knead them with almost mindless attention, rolling and squeezing the closest bit of your flesh that he can get in his palms. His hips slowly pull back to leave you empty. A moment later, he’s back inside, pumping you full of his hot wasp-cock with slow, steady strokes. Between your skin and his copious, honeyed pre, he’s able to violate your bottom without an ounce of resistance. His strokes are long and firm, and he shows no sign of stopping. Not that you want him to.");
	}
	// both
	output("\n\nWith one hard shove after another, the zil pumps you full of his cock. It feels like every stroke is pushing more and more sexual excitement, more bliss, deep into your bottom, and it spills out unhindered from your loins. He hits your prostate with almost unerring accuracy. It’s starting to make your muscles spasm around a knot of molten-hot arousal in your core. Your body shakes like crazy as you climb towards the edge of release.");
	
	output("\n\nThe zil sees it and feels the way you convulse around him, and he coos, <i>“It’s okay, go ahead and cum.”</i> He strikes your rump and repeats, <i>“Cum.”</i>");
	output("\n\nYou explode all over the ground. Heated surges of [pc.cum] spout out of [pc.eachCock] in a river that feels endless, pouring waves of jism out while your body convulses around the ass-impaling zilcock. His dick keeps pumping through it, passing through your fluttering anus while your butt tries its best to milk his cock deeper. The zil moans, reaching around to stroke your sloppy, [pc.cum]-drooling dick, and he squeezes the last of your orgasm from you just in time to cum himself.");
	output("\n\nIt feels surprisingly good. A slow, warm sense of fullness gradually worms its way up your back, leaking out around the cock plugging your [pc.asshole] in honeyed strands. The zil hilts himself deeply while his balls jump and contract on your [pc.butt], pumping fat dollops of honey into your innards until you feel full of his sweetened seed. By this point, your own orgasm has ceased, but trickles of [pc.cumColor] still leak from your tip");
	if(pc.cockTotal() > 1) output("s");
	output(". Your remaining strength gives out, and you collapse ");
	if(pc.cumQ() <= 2000) {
		output(" onto ");
		if(pc.cumQ() <= 150) output("the tiny puddle");
		else if(pc.cumQ() <= 1000) output("the puddle");
		else output("the large puddle");
	}
	else {
		output(" into the ");
		if(pc.cumQ() <= 4000) output("inches-deep lake");
		else if(pc.cumQ() <= 10000) output("six-inch deep semen morass");
		else output("foot deep cum-lake");
	}
	output(" you made, the zil spurting his last ropes across your [pc.legOrLegs], [pc.butt], and back.");
	
	output("\n\nHe lands a few feet away and admits, <i>“That was better than I thought it would be. I hope we’ll meet again. Maybe I’ll");
	if(rand(2) == 0) output(" even let you be on top!");
	else output(" fuck you so hard you don’t want to leave!");
	output("”</i>");
	output("\n\nYou slip into an exhausted daze, losing consciousness as the insect-man takes off and floats away.\n\n");
	processTime(25);
	pc.orgasm();
	pc.loadInAss(enemy);
	processTime(30+rand(10));
	CombatManager.genericLoss();
}
	
//The Zil Pretend to be Helia
//Not for pussy virgins or folks with no pussy who are buttvirgins.
public function theZilPretendToBeHelia():void {
	showBust("ZIL");
	showName("MALE\nZIL");
	//(Lose by HP)
	if(pc.HP() <= 0) {
		output("You reel backward, unable to stand any longer in the face of such a determined and powerful foe. The fight has sapped your strength and battered your muscles to such a degree that you don’t think you’re even capable of resisting any more, and as that realization sinks in, you slump over, panting from exertion. The zil’s shadow falls across your prone form. A curious, lighthearted expression has spread across his inhuman visage.");
		output("\n\n<i>“Hey, I won, so I hope you’re ready for your snack,”</i> he states a little over eagerly, <i>“I didn’t actually want to hurt you bad or anything.”</i>");
		output("\n\nAbruptly, the bushes behind him rustle. They part a moment later, and a lissom pair of latex-black legs stride out of the foliage, swaying back and forth so sensuously that you momentarily forget your pain. The reason for the newcomer’s unusual gait is made apparent when it turns to regard the male zil; a heavy, insectile abdomen hangs behind it from just above her buttons, tipped with a deadly-looking stinger.");
	}
	//(Lose by Lust)
	else {
		output("You shudder and slump back onto the ground with a lusty sigh, overcome by the potent male’s pheromones. His very scent sends hot bolts of lust through your bloodstream strong enough to make your vision seem tinged pink and your groin afire with need. Your once foe and soon-to-be lover flutters over to you with a curious smile on his string, black-eyed visage.");
		output("\n\n<i>“Oh, if you wanted me to take you, why did you try to resist?”</i> he asks.");
		output("\n\nYou... you can’t really remember through the fog of sexual heat that has settled over your consciousness. It’s omnipresent, and you lick your lips in a manner you assume will please him, hoping to seduce him into sexual congress.");
		output("\n\nA sudden noise foils those plans, pulling your alien overlord’s attention towards the rustling bushes behind him. The leafy foilage draws back like shimmering curtains to reveal a pair of latex-black legs. One swaying step after another, the newcomer waggles its broad hips salaciously, pendulously swaying them with the heavy bob of its reflective, insectile abdomen.");
	}
	// Both
	//(not a new pg)
	output(" The omnipresent aroma of lust that hangs in the air thickens with this newcomer’s arrival, and you find yourself becoming aroused by the simple presence of this pair, obviously the male and female complement of their race.");
	output("\n\n<i>“Nice catch,”</i> the female remarks as she circles you and your captor warily. The armored plates that covered her chest and groin retract, exposing well-formed breasts and a dewy thatch of pubes that barely conceals the folds of her alien, black-lipped sex from view.");
	output("\n\nThe erect male flutters in a semi-circle on the opposite side of you, fanning fresh waves of his sweet aroma across your form, towards his opposite number as he replies, <i>“Yes, " + pc.mfn("he","she","it") + " is. I claim the right to breed " + pc.mfn("him","her","it") + " as I will.”</i>");
	output("\n\nThe female shifts position, grinding her chitinous thighs together as rivulets of honey-colored lubricant drip down her inner thighs unimpeded. Her nipples have completely erected, and they stand out as black bullseyes on her bright yellow chest. She bats her eyelashes innocently and suggests, <i>“Could I have " + pc.mfn("his","her","its") + " face then? I had to service a female from your village and need to be sated.”</i>");
	output("\n\nThe flying wasp-man nods graciously as he comes back around behind you, squeezing your [pc.butt] affectionately");
	if(pc.isNaga()) output(" before flipping you over to have access to your vagina");
	output(". His sheathed prong slides across your " + pc.skinFurScales() + " eagerly, barely exposing his tip, leaking his masculine pre-honey across your eager flesh. You ache to have him inside you, but you’re little more than a spectator in this play. A literal and figurative honey-pot is brought closer, so close that it blocks most of the surroundings from your view, filling the air with the lusty aroma that has your head swimming. A tuft of neatly trimmed hair sits above it, covered in droplets of accumulated ardor, and underneath you see inky pussy, its lips puffy and ever-so-sightly parted by the bud of her clit.");
	output("\n\nSome unseen signal passes between your waspy lovers, and they press their hips in on you from both sides as one. The taste of a lovely, wondrous pussy on your lips wars with the sensation of being suddenly stuffed from behind with a throbbing, dominant cock. The member drips and dribbles a bit of pre-emptive payload to smooth its passage as it burrows into your [pc.vagOrAss]. The honey suspended in the surprisingly soft pubic hair above the female’s cleft smears across your nose, assisting you deeper into your lusty fugue, and your mouth dumbly falls open, the tongue extending of its own volition to taste the marvelous flavor the wasp-woman has to offer.");
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(x < 0) x = pc.cuntThatFits(enemy.cockVolume(0));
		if(x < 0) x = rand(pc.vaginaTotal());
	}
	// stretch
	if(x < 0) pc.buttChange(enemy.cockVolume(0),true,true,false);
	else pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	output("\n\nSmooth armor compresses your [pc.butt] when the foreskin-wrapped dick bottoms out, the zil’s smooth, hairless sack rubbing against you for a moment before he draws back and begins to fuck your [pc.vagOrAss] slowly, almost languidly.");
	output("\n\n<i>“Oh, this is nice,”</i> he admits. His sack seems to grow a little bit bigger against your body as his constantly leaking pre turns your innards into a slippery mess. The slow friction gradually increases as the zil begins to pump faster and faster, locking eyes with his opposite across your submissive, conquered frame. His dick grows a hair thicker and plumper; his hips thrust faster, and you know a messy, gooey climax is close at hand for the bug-man.");
	output("\n\nThe female bites her lips and shudders while your tongue polishes her clit, gathering every drop of her hot honey, sliding deeper into her folds where it can properly tickle the rest of her nerve endings. You dole out cunnilingus with no thought but eagerness for the taste in your mouth, instinctively improving your technique whenever you discover something that gets you a fresh dribble of her juices. Her legs are quaking lustily around your head as she rides you towards a much-needed cum. If your mouth weren’t muff-deep in cunt, a dopey smile would be visible on it.");
	// Vagina
	if(x >= 0) {
		output("\n\n");
		if(pc.hasClit()) output("[pc.EachClit] is throbbing, beaded with honeyed moisture and your own secretions. ");
		output("The dick inside you is sliding perfectly through you while your tunnel flutters around with unadulterated pleasure, spurred on by the scents locking your body into a breeding frenzy.");
		if(pc.hasPregnancy()) output(" Were your womb empty, you’re sure you could feel your eggs descending, hungry for fertilization.");
		output(" A needy whimper slips out around the quim stuffing your gob, and you find yourself cumming, creaming messily about the modest alien-cock inside you. The honey-spewing dong is just what you needed to get off, and you wiggle your [pc.butt] at the alien as you convulse around him, milking him with slow squeezes while you ");
		if(!pc.isSquirter()) output("drip with love.");
		else output("spray your love across him.");
		if(pc.vaginaTotal() > 1) {
			output(" The extra, unoccupied slit");
			if(pc.vaginaTotal() > 2) output("s are");
			else output(" is");
			output(" suddenly plugged by ");
			if(pc.vaginaTotal() == 2) output("a narrow digit");
			else output(" narrow digits");
			output(", and you cum even harder around the faux phalluses.");
		}
	}
	// Buttpussy
	else {
		output("\n\nYour [pc.asshole] is well used to the shape of the male’s dong at this point, squeezing him whenever he pushes in and winking at him whenever he pulls out to goad him back inside. A slippery flow of honey escapes whenever he draws back, but thankfully he does not stay away long. The zil’s wonderfully thick tool bounces in and out with such rapidity that you find yourself climbing towards the edge of climax before you know it, your [pc.legOrLegs] quivers dramatically as you get off on being used. Your [pc.asshole] is cumming to being used, and the shockwaves of disabling pleasure shiver through your body.");
	}
	// dicks
	if(pc.hasCock()) {
		output("\n\n[pc.EachCock] shamefully begins to ejaculate, spraying [pc.cum] without any shred of modesty. ");
		if(!pc.isTaur()) {
			output("You reach down to caress your spasming tool");
			if(pc.cockTotal() > 1) output("s");
			output(", accidentally catching a gob of your jism in your palm before you jerk your way through the rest of a long, blissful ejaculation.");
		}
		else {
			output("Your spasming tool");
			if(pc.cockTotal() > 1) output("s lurch");
			else output(" lurches");
			output(" up to slap against the bottom of your multi-legged form, the impacts jarring pleasure through your body the entire way through a blissful ejaculation.");
			if(pc.cumQ() >= 5000) {
				output(" Feeling your warm cum rising up around your ");
				if(pc.cumQ() <= 10000) output("[pc.legOrLegs]");
				else if(pc.cumQ() <= 20000) output("elbow");
				else output("[pc.chest]");
				output(" would worry you if your brain wasn’t single-mindedly occupied with breeding.");
			}
		}
	}
	output("\n\nJust when you finish, the aliens are getting started. Two pairs of hands grab you - one set on your rump and the other on your head, and they piston their hips together, compressing you into a soon-to-be-slimed captain sandwich. Honey splatters across your face and down your throat. You catch as much of it as you can while your [pc.vagOrAss] is thoroughly seeded. The male behind is cumming so hard that you can actually it feel it flowing deep into your body, the satisfying warmth nearly bringing you off again.");
	output("\n\nAs their climaxes conclude, the spent pair pull away, dropping you into the puddled, mixed sex-juices before turning on each other, grinding their sloppy genitalia against each other as they prepare to fuck away the rest of their insatiable lust. Your eyes flutter closed as your body asserts its need for rest, lulling you into a dreamless, sticky slumber.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	if (x >= 0) pc.loadInCunt(enemy, x);
	else pc.loadInAss(enemy);
	var ppZilFem:ZilFemale = new ZilFemale();
	pc.loadInMouth(ppZilFem);
	processTime(59);
	CombatManager.genericLoss();
}

//Cunt tail sex with Male Zil - Frogapus
public function useTailOnZilWhenUWin():void
{
	clearOutput();
	if(enemy.hasPerk("Penny Quest AI")) showBust("ZIL_RED");
	else showBust("ZIL");
	showName("MALE\nZIL");
	author("Frogapus");
	output("You grin as you flex your supernumerary tail muscles, flexing your tail up to your side. It curls up just under your hand as you look down hungrily at your anthophile opponent. He pushes himself up weakly to his hands, looking up at you with glossy black eyes, and you trace a finger along the finely scaled top of your symbiotic tail.");
	output("\n\nThe shiver of pleasure runs up through your shared nervous systems, making the [pc.tailCunt] drip viscid ropes of arousal down to the forest floor. You grin broadly");
	if(pc.hasCuntSnake())
	{
		output(", and the zil at your feet buzzes in alarm.");
		output("\n\n<i>“That’s-that’s a cunt znake!”</i> he exclaims, trying to push himself up to a sitting position. <i>“You’re infected!”</i>");
		output("\n\n<i>“That’s right,”</i> you " + pc.mf("chuckle","purr") + ". <i>“And it feels so good.”</i>");
	}
	else output(".");
	output("\n\nThe nubile zil manages to scramble to a sitting position, but before he can say any more, you feel the folds of your tail-mounted pussy part, exposing your slobbering interior. The slight breeze in the forest, warm and humid normally, feels cool against your shared lips. You initially wonder what your tail is doing, but then catch sight of the zil.");
	output("\n\nHis blank eyes appear locked on your cunt tail’s dewey opening. As you watch, his expression softens slowly, turning from horror to hunger as your tail sways slowly back and forth. The zil makes a soft, buzzing noise as he slides his hand down to his groin, his chitin retracting, his onyx cock swelling up between his amber fingers.");
	output("\n\n<i>“You want it, don’t you?”</i> you ask, watching in amusement as the zil begins to stroke himself to the sight of your swaying tail cunt.");
	output("\n\n<i>“Yes...”</i> he buzzes, licking his lips.");
	output("\n\n<i>“Good.”</i> You smile and ");
	if(pc.isNaga()) output("surge forward, looping a heavy coil of your tail atop his chest, weighing him down to the ground.");
	else output("step forward, placing a [pc.foot] on the Zil’s chest, pushing him down to the ground.");
	
	output(" Flat on his back, he looks up at you, first in confusion, then hungry anticipation as he feels the heat from your symbiont over his engorged cock.");
	output("\n\nYou feel another surge of pleasure from your tail. You’re not sure how much it’s aware of, exactly, but it does seem to approve of a helpless, erect cock for its use. The surge ripples outward, and you ");
	if(!pc.hasCock()) output("feel your nipples stiffen under your [pc.clothes]");
	else output("shudder with an answering stiffening from your [pc.cocks], already erect at the thought of using this helpless Zil to get you off");
	output(". ");
	if(pc.hasVagina()) 
	{
		output("A heartbeat later, you feel your cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" throb in appreciation at the endorphins your tail is feeding you. ");
	}
	output(" The zil moans softly, biting his lip as your tail cunt drips strings of arousal atop his cock, slathering it with your shared stimulation.");

	output("\n\nYour insectile victim squirms under you, and you push down harder. He stills obediently, and you reward him with the first, sweltering touch of your cunt. It swings over his throbbing cock, brushing his tip across its folds. You groan softly, feeling the sensations radiating out to your fingertips. The zil’s breath quickens as your tail begins to push down against his cock.");

	output("\n\nYou feel him enter the oozing folds of your tail cunt, hearing the squelch as your tail engulfs him, effluxing wetness around his length, squeezing tight. Your breath catches in your throat and you hold still, momentarily frozen in enjoyment of the delicious sensations running throughout your shared nervous system. Your tail, however, is ravenously mobile, already sliding down the bee’s length, burying the zil inside it. It pushes deep, hungry for his length, engulfing not just the zil’s shaft, but its balls, held tight against the base of his shaft.");

	output("\n\nYou nearly double over as your tail slides back up with a squelch, leaving a feeling of insatiate emptiness in you. The zil leans his head back, mouth agape as your tail slides down again, its tight inner walls rippling against the zil’s cock. His hips buck upward, desperate for more your symbiotic love, and your cunt tail obliges. It surges down again, drawing a loud moan from the zil-one almost drowned out by your own. When you clench your muscles and draw your tail back up again, the two of you harmonize in debauched groans of pleasure.");

	output("\n\nYou look down at the zil, meeting his blissed-out expression with your own, practically drooling down on his face as your tail pumps against him. ");
	if(!pc.isNaga()) output("The leg you’re keeping on his chest starts to tremble with");
	else output("Your snake-like coils on his chest shift as you squirm in delight at");
	output(" the shudders of pure joy running through your body. Your tail is moving faster now; you can feel it flexing inside, massaging and milking the zil’s dick.");

	output("\n\nFaster and faster your cunt tail pumps. ");
	if(pc.hasCock())
	{
		output("Your cock");
		if(pc.cockTotal() > 1) output("s are");
		else output(" is");
		output(" throbbing now, fit to burst, already oozing pre from ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" lengths, down to the face of the zil. He seems only vaguely aware of it, adrift in a sexual haze, his tongue slipping out to lap softly at it. ");
	}
	if(pc.hasVagina())
	{
		output("Your puss");
		if(pc.cockTotal() == 1) output("y leaks");
		else output("ies leak");
		output(" your arousal down your quaking thighs, running down hot and slick. ");
	}
	output("Your whole body is trembling, and you’re on the verge of collapsing on top of your “victim.”");
	output("\n\nWith a strangled groan, the zil finally cums, his cock flooding your ravenous tail with thick, sweet honey. Your mouth waters as your cunt tail shares the sensation of the heady, sacchrine zil cum running down its endless gullet. Your tail clamps down hard on the zil’s package, sealing tight and rippling as it noisily slurps every drop of his syrupy seed.");

	output("\n\nIn thick jets cum oozes into your tail, and you swear you feel your tail pulse, pumping endorphins into your system, flooding you with bliss. You gasp, hips thrusting forward as you yourself cum.");
	if(pc.hasCock()) 
	{
		output(" You fumble at your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" managing only to point ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" down in time to unload a ");
		if(pc.cumQ() < 15) output("spatter");
		else if(pc.cumQ() < 250) output("load");
		else output("torrent");
		output(" of cum over the Zil’s face. He gapes up at you, too lost in bliss to care, his mouth open to take in your seed as he pumps his into your tail.");
	}
	if(pc.hasVagina())
	{
		output(" You reach down to your needy cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" as you drive a finger into ");
		if(pc.totalVaginas() == 1) output("it");
		else output("one");
		output(", moaning as you ");
		if(!pc.isSquirter()) output("dribble");
		else if(pc.girlCumQ() < 1000) output("squirt");
		else output("spray");
		output(" your juices across the zil’s smooth chest.");
	}

	if(!pc.isNaga()) output("\n\nYour legs actually do give out, then, and you fall atop the zil, ");
	else if(pc.isTaur()) output("All four of your legs give out, and you fold atop the zil, your body pressed against him, ");
	else output("\n\nYour trembling body finally does give out and you collapse atop the zil, ");
	output("forcing another spasm from the svelte creature, pumping another round of honey-thick loads into your tail. You shudder against the zil’s cum-drenched body, drooling softly in bliss as your tail milks him for the next hour or so. It looks like your cunt tail particularly enjoys the taste of honey.");
	output("\n\nYou wake up later in an empty clearing. Your tail lies fat and sated, and a small package sits on the bracken in front of you. You lick your lips, tasting honey on them, then reach for the package. It seems that after all of your coaxing, the zil learned to appreciate you and your tail.\n\n");
	pc.orgasm();
	processTime(85);
	pc.orgasm();
	pc.loadInCuntTail(enemy);
	CombatManager.genericVictory();
}

public function zilPregnancyBirthing(pregSlot:int = 0, numBabies:int = 2):void
{
	if (pc.pregnancyData[pregSlot].pregnancyType == "ZilBullPregnancy" && getPlanetName() == "Mhen'ga" && (rooms[currentLocation].hasFlag(GLOBAL.FOREST) || rooms[currentLocation].hasFlag(GLOBAL.JUNGLE)) && rooms[currentLocation].hasFlag(GLOBAL.OUTDOOR)) return zilBullPregEndScene(numBabies);

	clearOutput();
	showName("\nBIRTHING!");
	author("HugsAlright");
	
	var isSmol:Boolean = (!pc.isTaur() && pc.tallness <= 64);
	var isZil:Boolean = (pc.raceShort() == "zil");
	var isNude:Boolean = (pc.isNude());
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("Pain wracks your gut, bending you over as you protectively place a hand on your [pc.stomach]. That and the fluids spilling onto");
	if(!isNude) output(" your " + (!pc.isCrotchExposed() ? "[pc.lowerGarments]" : "clothing"));
	else output(" the " + ((inShip || inPublic) ? "ground" : "floor"));
	output(" are sure signs that your babies are coming.");
	// mhen’gaWilderness:
	if(getPlanetName() == "Mhen'ga" && (rooms[currentLocation].hasFlag(GLOBAL.FOREST) || rooms[currentLocation].hasFlag(GLOBAL.JUNGLE)) && rooms[currentLocation].hasFlag(GLOBAL.OUTDOOR))
	{
		showBust("ZIL");
		
		output("\n\nOut in the wilderness of the hot, humid jungle, you have no choice but to find a suitable place to safely deliver your young. A sudden burst of pain leaves you groaning, urging you to");
		if(!isNude) output(" strip yourself and");
		output(" sit down on the ground with haste, prepping for a more “natural” birth.");
		output("\n\nJust as you’re wishing you had stayed in Esbeth a little bit longer, you hear rustling in the nearby undergrowth.");
		output("\n\nWhat?! Zil?! Naleen?! Not now!");
		output("\n\nThen, you’re met with a sense of calm as a familiar musk fills your nostrils, and out from the brush comes the zil who fathered your child.");
		if(flags["MET_ZIL_SIRE"] != undefined) output(" Like last time, that scent of his lets you know exactly who he is, like it’s especially produced for you, giving you quite a bit of release");
		else output(" You vaguely recognize the bee-boy’s face, but it’s his scent that gives his identity away, like it’s there just for you");
		output(".");
		output("\n\n<i>“It is you!”</i> he says, walking up to you before noticing what’s going on, <i>“And you’re... oh, oh!”</i> The zil hurries to your side and kneels beside you, <i>“Here, my village’s midwife can help. This jungle is no place for children to be born.”</i> With that, he");
		if(isSmol) output(" hooks an arm under your [pc.legOrLegs] and another under your neck, lifting you up into the air");
		else output(" lifts your arm over his shoulder and helps you to your feet, and it takes most of his and your strength to get you up");
		output(".");
		if(isSmol) output("\n\nDespite being a reasonable size for the alien to carry, you guess your added baby-weight inhibits the use of his wings, but he carries you swiftly and carefully through the Mhen’ga jungle.");
		else output("\n\nObviously too big for the alien to carry, your weight is supported by the zil’s back-breaking efforts as he carefully leads you through the Mhen’ga jungle.");
		output("\n\nAfter");
		if(isSmol) output(" walking for");
		output(" what feels like an eternity, you and your bee-daddy enter a clearing in the brush, leading to what looks to be a zil village, with tents everywhere, longhouses, and native peoples working around nearby bonfires.");
		if(isZil) output(" No one seems to pay attention to you or the father of your children, most likely due to your heavily-modded appearance.");
		else output(" Your trip through the camp draws a few strange glares and gasps, leaving you to wonder if there’s ever been an offworlder here before.");
		output("\n\nThe hormones and pain raging in your head make your trip through the village seem naught but a blur, but before you know it, you’re inside a tent being laid down on the ground before a thickset zil woman.");
		output("\n\n<i>“Midwife!”</i> your companion calls out as he sets you down, <i>“This offworlder is my mate... I found her out in the jungle. She needs help!”</i>");
		output("\n\n<i>“An offworlder?”</i> the zil woman questions, kneeling down in front of you, <i>“I can’t say I’ve had the chance to work with one before. I will do my best to help her, if she is indeed your mate.”</i> She eyes you up before");
		if(!pc.isTaur() && !pc.isNaga()) output(" spreading your legs and");
		output(" getting a good look at your downstairs, <i>“Oh my, you haven’t come a moment too soon... looks like it’s time to get started.”</i>");
		output("\n\nYour next hour after that is spent almost entirely in pain with only a few brief moments of respite. The village midwife helps you along the way, seemingly well experienced, a small wonder, given by how libidinous most zil are. All the same, your mate holds your hand the whole way through this ordeal. Your mind seems completely devoted to birthing your children, because you can’t really remember much of the whole event once your first baby wiggles free, slowly sliding from your vagina and into the arms of the midwife. The newborn’s " + (numBabies == 2 ? "twin follows" : "siblings follow") + " soon after.");
		output("\n\nThen, the sound of hoarse crying seems to clear all that pain from your eyes, leaving you with the view of your newborn children being swaddled and cleaned by the zil woman before you.");
		output("\n\nTheir crying is silenced when they’re placed in your and their father’s arms, wrapped in a warm embrace, held carefully like the delicate bundles they are. Like a proper mother should, you let the hungry babies suckle from your teats,");
		if(numBabies <= pc.totalBreasts()) output(" one for " + (numBabies == pc.totalBreasts() ? "each breast" : "most of your breasts"));
		else output(" having your mate hold the one" + (numBabies <= 3 ? "" : "s") + " you can’t immediately feed");
		output(". Looking at them as they enjoy their first meal, you notice they’re some sort of biological chimera, possessing a mostly zil-like appearance, but with human skin, [baby.skinTone] like yours, and [baby.hairColor] fuzz atop their heads too.");
		output("\n\nOnce the midwife has made sure all is in order and your children are healthy and fed, she leaves you and your bee-boyfriend alone with your newborns. There’s a few moments of blissful silence that you spend reveling in warm, parental emotions, looking at your babies, their tiny hands grasping at your fingers.");
		output("\n\n<i>“I- I think you should take them,”</i> the zil finally speaks up, causing you to turn towards him, only to see a somewhat distressed look on his face, <i>“This jungle... it’s dangerous, my people don’t live very long because of it. I’ve seen Esbeth though, and the technology you offworlders have, so I- I think they’d be much safer, and happier, somewhere like that.”</i>");
		output("\n\nYou contemplate that for a moment, and it all makes sense. Nothing about the zil’s tone or words makes it seem like he’s trying to shirk responsibility. No, he’s being completely genuine. Giving him a nod in response, you carefully pull out your Codex and tap the screen a few times, calling a drone to collect your children and take them to the nursery your dad had built.");
		output("\n\nYou spend just a little while longer in the company of your mate and your children before the probes arrive, startling more than a few villagers as they fly their way to your tent and present a small space for you to put your children.");
		output("\n\n<i>“Th- these will keep our children safe?”</i> the zil boy asks, seeming a bit nervous at the sight of all that cold, unfeeling metal.");
		output("\n\nYou tell him they’re specially made to transport your newborns safely to a high-tech nursery in another system.");
		output("\n\n<i>“Oh, alright then...”</i> he says, standing up with one of your half-breed babies in his arms and walking towards a probe, <i>“Sh- should I just put them in here?”</i>");
		output("\n\nAfter you give him a nod, the zil carefully puts his child into the cushioned, life supported compartment, lingering a few moments before stepping back, allowing the pod to close. Then, like that, they’re off with your precious bundles en-route to Tavros, leaving you and your mate alone.");
		output("\n\nHe breathes a long sigh, before turning to you again. <i>“It will be nice knowing they’re safe out there,”</i> he says, <i>“but, I... I hope one day I will see them again, and their mother.”</i> With that, he smiles at you, <i>“But I think it might be time for you to leave... as much as I wish you could stay, no doubt the rest of the tribe is getting antsy with an outsider around for so long.”</i>");
		output("\n\nThe bee-boy walks his way to the tent’s flap and opens it to invite you out, <i>“" + (!isNude ? "Once you’ve dressed yourself and feel rested" : "Once you feel rested enough to move") + ", I can lead you back to Esbeth, if you’d like.”</i>");
		output("\n\nHis invitation puts a grin on your face for some reason, maybe it’s just all this class from a race of apparent fuck-happy barbarians. You accept his offer and pick yourself up from the floor");
		if(!isNude) output(" along with all your gear");
		output(", taking a deep breath as you gather your thoughts and strength before getting ready to make your way back to civilization as a new " + pc.mf("father", "mother") + "...");
		output("\n\n");
		
		processTime(248);
		// Returns the PC to Esbeth, removes pheromone flag, resets belly rating, puts zil kids in nursery.
		IncrementFlag("MET_ZIL_SIRE");
		currentLocation = "JUNGLE EDGE";
	}
	// Ship:
	else if(inShip)
	{
		showBust("");
		
		output("\n\nYou hurry to the nearest box of medical supplies, breathing heavily and counting yourself lucky you’re somewhere safe. Once you’ve made the proper preparations");
		if(!isNude) output(" and striped yourself bare");
		output(", you lie down on your bed");
		if(!pc.isTaur() && !pc.isNaga()) output(" with your legs spread");
		output(", ready to deliver your children.");
		output("\n\nYour next hour after that is spent almost entirely in pain with only a few brief moments of respite. There’s only you and yourself to hold your hand or help you with your kids now, and part of you wishes you were in a clinic. You don’t have time for those worries though, because you know the wellbeing of both your and your babies depends on you doing everything right. Your mind seems completely devoted to birthing your children, because you can’t remember most of the whole even once your first baby wiggles free, slowly sliding from your vagina. The newborn’s " + (numBabies == 2 ? "twin follows" : "siblings follow") + " soon after.");
		output("\n\nThen, the sound of hoarse crying seems to clear all that pain from your eyes, leaving you with the view of your newborn children, who you promptly proceed to clean and swaddling them.");
		output("\n\nTheir crying is silenced when they feel your touch, wrapped in your arms, held carefully like the delicate bundles they are. Like a proper mother should, you let the hungry babies suckle from your teats,");
		if(numBabies <= pc.totalBreasts()) output(" one for each breast");
		else output(" and unfortunately you don’t have enough breasts for all of them, resorting to having them take turns");
		output(". Looking at them as they enjoy their first meal, you notice they’re some sort of biological chimera, possessing a zil’s appearance, but with [baby.skinTone] human skin like yours, and [baby.hairColor] fuzz atop their heads.");
		output("\n\nAfter you spend a little bit more time making sure your babies are in good health and well-fed, you pull out your Codex and tap the screen a few times; before you can say “Steele Tech,” a drone prepared to carry your children to your personal nursery arrives. They seem to have no trouble getting into or out of your ship, docking with the nearest airlock. You carefully place your newborns inside the cushioned, life-supported compartment, giving them each a long, warm hug before letting them go. Once you’ve said your goodbyes, the drone closes itself and detach safely from your ship before flying off, en-route to Tavros.");
		output("\n\nYou let out a heavy sigh, a little pang of sadness caused by having to leave your kids like that so soon, but the rational part of your brain reminds you that uncharted space is no place for a baby to be. With that, you");
		if(!isNude) output(" dress yourself and");
		output(" prepare to continue your journey as a new " + pc.mf("dad", "mom") + "...");
		output("\n\n");
		
		processTime(236);
		// Removes the preggomones, puts the PC in their ship, and brings the babies to the nursery.
	}
	// Civilization:
	else if(inPublic)
	{
		showBust("LEITHAN_MALE");
		
		output("\n\nYour hunched position and pained noises attract the attention of a nearby leithan male, who hurries his way up to you and asks if you need help.");
		output("\n\nSure enough, you do need help, and tell the large purple bug-pony you think your water just broke.");
		output("\n\n<i>“Oh! Uh- darn it if only I had stuck to medical school!”</i> he curses before looking up at you, <i>“There’s a clinic not to far from here I could help you get to!”</i>");
		output("\n\nYou’re only able to muster a <i>“Yes”</i> at that proposition, noticing that the leithan is trotting in place nervously on all six legs.");
		output("\n\n<i>“Okay, here,”</i> he says,");
		if(isSmol) output(" extending his arms to scoop you up, ready to carry you");
		else output(" placing your arm over his shoulder, supporting most of you weight with his large frame");
		output(", <i>“Let’s get you to a hospital.”</i>");
		output("\n\nAfter that, it’s not too long a " + (isSmol ? "trip" : "walk") + " to the nearest clinic, where your spontaneous aid walks in and announces that you need help. Immediately, nurses rush to your side, and you’re placed on a gurney and quickly transported to a nearby emergency room.");
		output("\n\nWith the comfort of modern technology and experienced professionals all around you, your next hour passes with great amounts of pain, but much easier than it would have if you were on your own in the wilds. Doctors constantly check your vitals and carefully watch your still unborn children as your contractions continue. Your mind seems completely devoted to birthing your children, because you can’t really remember much of the whole event once your first baby wiggles free, slowly sliding from your vagina and into the arms of the clinic staff. The newborn’s " + (numBabies == 2 ? "twin follows" : "siblings follow") + " soon after.");
		output("\n\nThen, the sound of hoarse crying seems to clear all that pain from your eyes, leaving you with the view of your newborn children being swaddled and cleaned by the nurses before you.");
		output("\n\nTheir crying is silenced when they’re placed in your arms, wrapped in your arms, held carefully like the delicate bundles they are. Like a proper mother should, you let the hungry babies suckle from your teats,");
		if(numBabies <= pc.totalBreasts()) output(" one for each breast");
		else output(" and unfortunately you don’t have enough breasts for all of them");
		output(". Looking at them as they enjoy their first meal, you notice they’re some sort of biological chimera, possessing a zil’s appearance, but with human skin, [baby.skinTone] like yours, and [baby.hairColor] hair too.");
		output("\n\nOnce your doctors have made sure all is in order and your children are healthy and fed, they leave you alone with your newborns. There’s a few moments of blissful silence, reveling in warm, parental emotions as you look at your babies, their tiny hands grasping at your fingers.");
		// onTavros
		if(getPlanetName() == "Tavros Station")
		{
			output("\n\nEventually, though, you realize your kids should probably be in your nursery, and that you should be on your way soon. So, you call over a nurse and ask her that your bee-babies be taken to your nursery on the station. Once she realizes just who “[pc.name] Steele” is, she hurries along, gathering other nurses and equipment to safely bring your children elsewhere.");
			output("\n\nYou make sure to give each one of them a warm hug before letting them go.");
		}
		else
		{
			output("\n\nEventually, though, you realize your kids should probably be in your nursery, and that you should be on your way soon. You pull out your Codex and tap the screen a few times, and after a few more moments alone with your babies, a nurse appears in your room. She tells you there’s some strange drone in the waiting area asking for “[pc.name] Steele,” and you say to let them in.");
			output("\n\nSure enough, they’re the probes made to take your newborn young to the nursery your dad had prepared for you. You carefully place your newborns inside the cushioned, life-supported probes, giving them each a long, warm hug before letting them go. Once you’ve said your goodbyes, the drone closes themselves and detach safely from your ship before flying off, en-route to Tavros.");
		}
		output("\n\nYou breath a heavy sigh, a little pang of sadness left behind after having to leave your kids like that so soon, but you know you have to get moving again, and you’ll be able to see them again soon. Then all it take is a bit of paperwork and a quick once-over from a medical scanner and before you know it you have your [pc.gear] back and you’re ready to continue your journey, this time as a brand-new " + pc.mf("dad", "mom") + ".");
		output("\n\n");
		
		processTime(248);
		// Removes the preggomones, puts the PC outside nearest clinic if possible, and brings the babies to the nursery.
		currentLocation = nearestMedicalCenter();
	}
	// Wilderness:
	else
	{
		showBust("");
		
		output("\n\nOut in the wilderness, you have no choice but to find a suitable place to safely deliver your young. A sudden burst of pain leaves you groaning, leading you to");
		if(!isNude) output(" strip yourself and");
		output(" sit down on the ground faster, prepping for a more “natural” birth.");
		output("\n\nYour next hour after that is spent almost entirely in pain with brief moments of respite. There’s only you and yourself to hold your hand or help you with your kids now, and part of you wishes you were in a clinic. You don’t have time for those worries though, because your mind seems completely devoted to birthing your children, to the point where you can’t remember much of the whole event. Soon, your first baby wiggles free, slowly sliding from your vagina, the newborn’s " + (numBabies == 2 ? "twin" : "siblings") + " following soon after.");
		output("\n\nThen, the sound of hoarse crying seems to clear all that pain from your eyes, leaving you with the view of your newborn children, quickly cutting the cords, cleaning them off, and swaddling.");
		output("\n\nTheir crying is silenced when they feel your touch, wrapped in your arms, held carefully like the delicate bundles they are. Like a proper mother should, you let the hungry babies suckle from your teats,");
		if(numBabies <= pc.totalBreasts()) output(" one for each breast");
		else output(" and unfortunately you don’t have enough breasts for all of them");
		output(". Looking at them as they enjoy their first meal, you notice they’re some sort of biological chimera, possessing a zil’s appearance, but with human skin, [baby.skinTone] like yours, and [baby.hairColor] hair too.");
		output("\n\nAfter a few more moments of making sure your babies are in good health and well-fed, you pull out your Codex and tap the screen a few time, and before you can say “Steele Tech,” a drone prepared to carry your children to the your personal nursery arrives. They seem to have no trouble getting to you, hovering around and repeating pre-programmed commands. You carefully place your newborns inside the cushioned, life-supported probes, giving them each a long, warm hug before letting them go. Once you’ve said your goodbyes, the drone closes itself before flying off, en-route to Tavros.");
		output("\n\nYou breath a heavy sigh, a little pang of sadness left behind after having to leave your kids like that so soon, but your instincts remind you that this place is nowhere for a baby to be. With that, you");
		if(!isNude) output(" dress yourself and");
		output(" prepare to continue your journey as a new " + pc.mf("dad", "mom") + "...");
		output("\n\n");
		
		processTime(252);
		// Removes the preggomones and brings the babies to the nursery.
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Special Sex Scene
// This scene can occur if the PC has preggomones and is in the Mhen’ga wilderness.
public function maleZilPreggomonesEncounter():void
{
	showBust("ZIL");
	showName("MALE\nZIL!");
	author("HugsAlright");
	
	output("\n\nAs you’re moving through the jungle, rustling in the nearby undergrowth catches your attention, and you instinctively reach for your [pc.weapon]. A powerful, familiar musk suddenly fills your nostrils and imbues you with a sense of calm.");
	if(flags["MET_ZIL_PREGGOMONES"] == undefined) output(" Then, out from the brush a zil-boy appears, and you don’t know just why you are certain of this, but it’s the father of the children inside you... Wait, it’s the pheromones! Sure, the bee-boy’s face looks vaguely familiar, but it’s his scent you recognize, like it was tailor made for you, setting your heart fluttering.");
	else output(" Then, out from the brush, a zil-boy appears, and just like last time, his scent gives his identity away. Those pheromones let you know just who he is and set your heart fluttering.");
	output("\n\n<i>“Ah, it’s you!”</i> he says, stepping out from the foliage to reveal his naked form, a chitinous codpiece retracting to display his slowly stiffening cock.");
	output("\n\nHis sex-filled musk is having a similar effect on you, your pussy already glistening with beads of girlcum");
	if(pc.hasCock()) output(" and your [pc.cocks] stiffening noticeably");
	output(". Your mind calls for you to fall into the zil’s arms and let him take you.");
	output("\n\n<i>“So, offworlders can smell it too, then?”</i> the zil coos, walking a bit closer to you, <i>“Oh, but let me explain! This is how my people remember our mates. Our scents become attuned to one another, and aren’t nearly as potent to anyone else. It tends to draw mates together, and makes them more protective of each other.”</i> He pauses and stops in front of you, <i>“Not to mention it makes time spent with one’s mate a bit more... rewarding.”</i> He’s got a warm smile on his face after that... not very devious or sexual, just happy, like simply being here with you is enough to get him up.");
	output("\n\n");
	if(flags["MET_ZIL_PREGGOMONES"] == undefined) output("Well, that explains your new pheromones and how you know just who this alien is. ");
	output("You look down to notice his shaft is at full-mast, and his gaze seems to be stricken dumb with lust... and you’re not feeling too different.");
	output("\n\n<i>“So, mate,”</i> he says, stepping back a bit, <i>“How would you feel about spending a bit of time together like that?”</i>");
	output("\n\n");
	
	IncrementFlag("MET_ZIL_PREGGOMONES");
	
	pc.lust(50);
	processTime(2);
	
	clearMenu();
	addButton(0, "Yes", maleZilPreggomonesEncounterNext, "yes", "Yes", "Fuck the zil-boy. Right here. Right now.");
	addButton(1, "No", maleZilPreggomonesEncounterNext, "no", "No", "Resist your urges and carry on with your journey.");
}
public function maleZilPreggomonesEncounterNext(response:String = ""):void
{
	clearOutput();
	showBust("ZIL");
	showName("MALE\nZIL");
	author("HugsAlright");
	clearMenu();
	
	switch(response)
	{
		case "yes":
			output("There’s no doubt you want your mate as badly as he wants you right now, and without another word exchanged, you fall into each other’s arms. Your lips lock together and your tongues slide across one another as you both succumb to lust.");
			// Normal Variant
			if(!pc.isTaur())
			{
				output("\n\nYour bee-boyfriend breaks the kiss, leaving both of you with hungry looks on your faces. His arms shift around you, getting a good hold around your shoulders and waist before he starts to lower you.");
				output("\n\n<i>“Here, lie down,”</i> he whispers, gently laying you on the soft jungle turf, leaving you gazing up into his black orbs and the few rays of light breaking through the canopy.");
				if(!pc.isNude()) output(" Quick to realize your clothes are still in the way, you reach for your [pc.gear] to pull it all away, and your mate is happy to assist until you’re as nude as he is. All that’s left then is for the zil to pull himself back and position his sleek form right between your eagerly spreading thighs.");
				else output(" With you already as nude as he is, all the zil has to do is pull himself back and position his sleek form right between your eagerly spreading thighs.");
				output("\n\nYou wiggle in anticipation as you lay there on your back, trying to line your [pc.vagina] up with his honey-drooling cock. Luckily, your mate doesn’t seem like one to keep a lady waiting, or is just as eager as you are. He rocks his hips forward, pressing his glans against your sopping folds and drawing a gasp from your lungs. You wrap your [pc.legOrLegs] around his waist in a fit of lust-filled instinct, grasping at his shoulders as you try to quell the mind-blowing pleasure of that simple touch.");
				output("\n\nThe zil doesn’t need " + (!pc.hasLegs() ? "you" : "your legs") + " to help him in though, because he’s already pushing into you, gently moving his hips forward, penetrating your honeypot and stretching your nether lips around his engorged shaft. You moan under the weight of pheromone-induced bliss, unable to quiet yourself as your hypersensitive inner walls are caressed by alien cockflesh with one smooth thrust inwards. It’s all enough to make you cum on the spot. Your whole body tenses, bracing for shockwave after shockwave of pleasure that rock your body soon after. Your [pc.vagina] clenches and convulses around your lover’s honey-dipper, trying to milk an orgasm from the alien atop you, but to no avail.");
				if(pc.hasCock()) output(" At the same time, your [pc.cocks] empt" + (pc.cocks.length == 1 ? "ies itself" : "y themselves") + " onto your [pc.chest], a few stray spurts of [pc.cum] splattering your lover as well.");
				output("\n\nYou go limp as you come down from your sudden and powerful climax, left gazing up at your smiling lover, who seems unphased. No, it’s obvious from the look on his face that there’s more to come, already thrusting his hips against your own.");
				output("\n\nIt’s strange; he’s small like most zil, lithe and bordering on a girly physique, but something about the musk in the air is making him seem so... manly? All those thoughts fade from your head when your bee-boyfriend darts down and takes one of your [pc.nipples] between his lips. His tongue swirls around your teat, drawing circles around the nub until you’re whimpering with need, his hips slowly thrusting against your own.");
				if(pc.isLactating()) output(" Before too long, your mate gives you what you need and starts to suckle on your [pc.breast], drawing [pc.milk] into his mouth and leaving you moaning in bliss.");
				output("\n\nWith all the attention you’re receiving, it’s no surprise you’re");
				if(pc.hasCock()) output(" already hard again and");
				output(" speeding towards your next orgasm, but you bite your lip and hold on until your lover can finish with you. His hips pumps faster and faster against yours, fucking you hard");
				if(pc.hasBreasts()) output(" enough to make your tits wobble and rock with each thrust");
				else output(" enough to have you in a constant state of ecstasy");
				output(" while still being gentle with your pregnant body. Your legs stay locked around his back, keeping him in place as he has his way with you, but you don’t think the bee-boy would necessarily be going anywhere if you were to let go. All the same, your embrace pulls him closer and his sweet-pre leaking prick deeper inside you, rubbing against your deepest depths until there’s not a moment of silence between your moaning and groaning.");
				output("\n\nDespite your attempts to delay your climax, it comes again, and even more powerful than the last. Your cock-filled pussy spasms, squirting [pc.girlcum] onto your lover’s crotch, your [pc.hips] grinding against his in a series of autonomous, lust-driven movement, rubbing your most sensitive parts against his shaft.");
				if(pc.hasCock()) output(" What [pc.cum] you have left splatters you and your bee-boyfriend as your love-muscle convulses with the weight of your second orgasm.");
				output(" All the while you scream with bliss, and luckily it doesn’t look like your mate is far behind you this time. Your nipple pops free of his lips as he pulls off it, letting out a howl of pleasure and burying his honey-stick inside you with one good thrust. The turgid shaft spasm inside you, coating your inner walls with honey-cum that soon dribbles out of your slit without a knot to hold it back, his hips bucking against yours.");
				output("\n\nWith a few last jerky hip-thrusts and spurts of sweet, golden cum, you both come down from your peaks, left gazing happily into each other’s eyes before your mate pulls out of your honey-dripping cunt. You whimper as his cockflesh rubs against your still-sensitive pussy one last time, and your lover rolls to your side. There, he’s able to wrap his arms around you and you’re able to rest your head on his chest. It seems like you’re both ready for sleep after that, and with your mate holding you tight, you’ll feel safe taking a nap in the jungle with him.");
			}
			// Taur Variant
			else
			{
				output("\n\nWith a body like yours, it’s obvious you aren’t going to be able to get any action from this end, so you break the kiss, leaving your bee-boyfriend gazing hungrily at you before you turn yourself around. Then you bend down on your front legs and present your [pc.ass] to the zil, looking over your shoulder and smirking at him.");
				output("\n\nBehind you, the alien");
				if(!pc.isNude()) output(" is already tearing away your clothes, licking his lips at the sight of your [pc.vagina], his cock twitching with need");
				else output(" licks his lips, his eyes locked on your [pc.vagina] and his cock twitching with need");
				output(". A moment after you turn back around, you feel a pair of hands grab at your backmost hips and pull your rear just a bit closer until his glans press against your sopping folds drawing a gasp from you lungs. You bite your lip in response, trying to quell the pleasure of such a light touch.");
				output("\n\nEager for more, you try to rock your hips back against the zil’s honey-dripping tip. He doesn’t need the help, though, because he’s already pushing into you, gently moving his hips forward, penetrating your honeypot and stretching your nether lips around his engorged shaft. You moan under the weight of pheromone-induced bliss, unable to quiet yourself as your hypersensitive inner walls are caressed by smooth cockflesh with one smooth thrust inwards. It’s all enough to make you cum on the spot. Your whole body tenses, bracing for the shockwaves after shockwaves of pleasure that rock your body soon after. Your [pc.vagina] clenches and convulses around your lover’s honey-dipper, trying to milk an orgasm from the alien atop you to no avail.");
				if(pc.hasCock()) output(" At the same time, your [pc.cocks] empty onto the ground below, leaving your legs shaking with the force of your peak.");
				output("\n\nYou go limp as you come down from your sudden and powerful climax. You’re barely able to muster the strength to look back at your smiling lover, who seems unphased. No, it’s obvious from the look on his face that there’s more to come, already thrusting his hips against your own.");
				output("\n\nIt’s strange, he’s small like most zil, lithe and bordering on a girly physique, but something about the musk in the air is making him seem so... manly? All those thoughts fade when you feel a finger make contact with your [pc.asshole], making you gasp before a bit of pressure appears behind that digit. Turning around again, you see your lover grinning at your needy face as his finger presses against your pucker, until it finally slips in with little more than a whimper from you.");
				output("\n\nWith all the attention you’re receiving, it’s no surprise you’re already");
				if(pc.hasCock()) output(" hard again and");
				output(" speeding towards your next orgasm, but you bite your lip and hold on until your lover can finish with you. His hips pump faster and faster, hard enough to keep you in constant bliss, but gentle enough for your pregnant body. A sly digit still probes at your ass, small movements that have you groaning and clenching around your lover’s finger. Even with its fairly modest size, your mate’s cock stays well sheathed inside you, rubbing against your sensitive inner walls and seeking out your deepest depths.");
				output("\n\nDespite your attempts to delay your climax, it comes again, and even more powerful than the last. Your cock-filled pussy spasms, squirting [pc.girlcum] onto your lover’s crotch, your [pc.hips] grinding against his in a series of autonomous, lust-driven movement, rubbing your most sensitive parts against his shaft. Following suit, your [pc.asshole] clamps down around the member filling it.");
				if(pc.hasCock()) output(" What [pc.cum] you have left splatters you and your bee-boyfriend as your love-muscle convulses with the weight of your second orgasm.");
				output(" All the while you scream with bliss, and luckily it doesn’t look like your mate is far behind you this time. He lets out a howl of pleasure behind you and buries his honey-stick inside you with one good thrust. The turgid shaft spasm inside you, coating your inner walls with honey-cum that soon dribbles out of your slit without a knot to hold it back, his hips bucking against yours.");
				output("\n\nWith a few last jerky hip-thrusts and spurts of sweet, golden cum, you both come down from your peaks, and your mate pulls out of your honey-dripping cunt. You whimper as his cockflesh rubs against your still-sensitive pussy one last time. With barely any willpower left to hold you you up, you carefully lay yourself down on the soft turf of the Mhen’ga jungle. Your lover joins you on the ground soon after. There, he’s able to wrap his arms around you and you’re able to rest your head on his chest. It seems like you’re both ready for sleep after that, and with your mate holding you tight, you’ll feel safe taking a nap in the jungle with him.");
			}
			output("\n\n");
			
			pc.orgasm();
			processTime(25);
			
			addButton(0, "Next", maleZilPreggomonesEncounterNext, "next");
			break;
		case "next":
			output("You awake sometime later with a zil-boy still holding you close, and are quick to give a yawn and stretch your tired limbs, which seems to wake your mate. He does the same as you, stretching and yawning until he turns to you. <i>“Hello, my mate, sleep well?”</i> he asks,");
			if(pc.hasBreasts()) output(" groping at one of your still naked tits");
			else output(" circling one of your still naked nipples with his finger");
			output(".");
			output("\n\nYou " + (!pc.isTaur() ? "gasp" : "whimper") + " slightly at his touch and tell the zil you did rest well with him at your side.");
			output("\n\nHe smiles, <i>“Care to stick around then?”</i>");
			output("\n\nAs much as you would love to stay with him for a bit longer, you remember you still have a fortune to chase, and tell the bee-boy you have to get moving again.");
			output("\n\nYour mate seems a bit disappointed at that, but seems happy all the same. <i>“Of course,”</i> he says, pulling himself from your embrace and rising to his feet, <i>“I’d offer to escort you back to my village, but it looks like you have your own places to be. So, until next time, my mate, stay safe.”</i>");
			output("\n\nLike that, he’s gone again, back into the jungle, clearing your mind of that lusty haze. The zil was right though, you do have places to be. Standing yourself up straight");
			if(!pc.isNude()) output(" and dressing yourself");
			output(", you get ready to move again.");
			
			processTime(237);
			restHeal();
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "no":
			output("You try to clear your head enough to form a coherent decision, taking a deep breath to empty that musk from your lungs. Then, once you’re back in your own head, you tell the zil that you don’t think you you’re going to be spending any time with your mate today.");
			output("\n\nYour mate seems a bit disappointed at that, but still smiles all the same. <i>“Of course,”</i> he says, taking a few steps away from you, <i>“I’d offer to escort you back to my village, but it’s obvious you have your own places to be. Stay safe, my mate.”</i>");
			output("\n\nLike that, he’s gone again, back into the jungle, clearing your mind of that lusty haze. The zil was right though, you do have places to be.");
			output("\n\n");
			
			processTime(2);
			// Should add some lust.
			pc.lust(15);
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

