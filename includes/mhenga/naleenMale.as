import classes.Characters.NaleenMale;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;

//First Time:
public function naleenMaleEncounter():void
{
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("FIGHT:\nNALEEN MALE");
	if(flags["TIMES_MET_MALE_NALEEN"] == undefined)
	{
		output("\n\nAs you walk through the jungles, you do your best to keep alert, scanning for the danger that could come from any angle.  You are certain that you sense movement close to your [pc.feet]. You react as quickly as you can, falling into your combat stance and looking around, trying to establish just what it was that you sensed.");
		output("\n\nAs you do so, something long and sinuous slaps out at you, forcing you to dodge it. You quickly shift back into position as a figure slides out of the undergrowth, revealing itself ");
		if(hours < 17) output("in the light.");
		else output("in the starlight.");

		output("\n\nA form not unlike a gargantuan serpent coils before you, readying itself to strike. You realize that this is no mere snake you’re facing, though. Where the head would be instead rises a masculine torso covered in jet black fur, like a panther’s. He has the face of a human man, but covered in short feline fur, and instead of human ears, feline ones jut from atop his skull. They are currently lying flat, complementing the threatening scowl he’s giving you. His messy hair is long enough to reach his shoulders, held out of the way of his golden eyes by a green headband of woven leaves.");
		output("\n\nYour codex chimes to warn you that this is a naleen, an indigenous predatory sapient.");
		if(flags["TIMES_MET_NALEEN"] != undefined) output(" This is the male variety of the species.");
		output("\n\n<i>“Not bad, I love it when prey proves a challenge,”</i>  he says, a hint of a hiss under his breath. <i>“It makes catching you all the more fun.”</i>");
		output("\n\nHe bares his claws at you and growls. It’s a fight!");
		flags["TIMES_MET_MALE_NALEEN"] = 1;
	}
	else
	{
		output("\n\nAs you walk through the jungle you hear a growling nearby. You quickly scan the area for the source and you notice a serpentine form partially hidden in the trees.");
		output("\n\n<i>“Hello again, prey,”</i>  the naleen panther greets you. His face contorts into an angry scowl as he bares his claws at you. Looks like he wants a rematch.");
		output("\n\nYou ready yourself for combat!");
		flags["TIMES_MET_MALE_NALEEN"]++;
	}
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new NaleenMale());
	CombatManager.victoryScene(defeatAMaleNaleen);
	CombatManager.lossScene(loseToDudeleenRouter);
	CombatManager.displayLocation("NALEEN MALE");
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
}

/*
Likes/Dislikes:
Feminine faces: Kinda likes!
Big butts: Really likes!
Small butts: Kinda likes!
Big breasts: Really likes!
Small breasts: Kinda likes!
Penises: Dislikes!
Big masculine endowments: Dislikes a lot!
Multiple sex organs or breasts: Kinda likes!
Hypersized attributes: Kinda likes!
Gaped orifices: Dislikes!
Tails: Really Dislikes!
Tail genitalia: Dislikes a lot!
Lactation: Kinda Likes!
Baldness: Dislikes!
Long hair: Kinda likes!
*/

public function naleenMaleAI():void {
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("FIGHT:\nNALEEN MALE");

}


//Victory
public function defeatAMaleNaleen():void {
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	//Victory by HP
	if(enemy.HP() <= 0) {
		output("The naleen struggles to lift his torso from the ground, too beaten to do anything but glare defiantly at you as he tries to slither away.");
		//if Kind:
		if(pc.isNice()) output("\n\nYou watch him from a distance, putting your weapons away now that he’s beaten. A curious sight does catch your eye, though. His twin reptilian cocks are standing at half-mast; seems like he found the fight enjoyable. Maybe you should do something about that?");
		//Mischievous:
		else if(pc.isMischievous()) output("\n\nYou smirk confidently, looking down at his defeated form. Suddenly your eyes catch a most curious sight. Seems like someone’s enjoyed your little dance a bit too much. His twin reptilian shafts are standing at half-mast, emerging from a nearly-concealed genital slit located just below where his feline half meets his snake half. Whatever are you going to do about that?");
		//Hard
		else output("\n\nYou glower at your defeated foe, strutting confidently towards him as he growls and tries to slither away. As you look him over and decide what you should do, you cannot help but notice the slut’s getting hard. Twin reptilian peckers emerge from a nearly concealed slit located right between his feline and snake halves. Seems like you are not quite done with this one yet.");
	}
	//Victory by Lust
	else
	{
		output("He immediately stops trying to fight you and sits back on the ground, furiously masturbating his bulbous pricks. They emerge from a nearly-concealed genital slit located just below the border between his feline half and serpentine end.");
		output("\n\nYou watch his erections and his furious hands with a pang of pleasure; teasing a naleen into submission is quite a feat for most people, after all. Hmm... he’s not exactly hard on the eyes; maybe you could help him get off?");
	}
	// menu here!
	clearMenu();
	//Ride Him
	//Requires PC has at least one vagina and not taur
	if(pc.hasVagina() && pc.lust() >= 33 && !pc.isTaur()) addButton(0,"Ride Him",rideDudeleensWithAPussaaaaah,undefined,"Ride Him","Ride that snake-cat to the ground. Your [pc.vagina] won’t brook anything else.");
	else addDisabledButton(0,"Ride Him","Ride Him","You need suitable arousal, a vagina, and not to be a taur in order to pursue this action.");
	//Get Blown
	//Requires PC has at least one penis
	if(pc.hasCock() && pc.lust() >= 33) addButton(1,"Get Blown",getBlownByDudeleen,undefined,"Get Blown","Put the mouthy kitty to work tending to your needs.");
	else addDisabledButton(1,"Get Blown","Get Blown","You need a penis and to be suitably aroused in order to get a blowjob.");
	if(pc.lust() >= 33) addButton(2,"Blow Him",maleNaleenSucksPCOff,undefined,"Blow Him","The poor kitty just needed some loving. Now that he’s no longer dangerous, you can send him on his way with a smile...");
	else addDisabledButton(2,"Blow Him","Blow Him","You’re not really in the mood to hand out blowjobs.");
	addButton(3, "Buttfuck",getButtfuckedByDudeleen,undefined,"Get Buttfucked","Have the naughty kitty plow your ass.");

	addButton(14,"Leave",leaveDefeatedDudeleen);
}

public function leaveDefeatedDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	if(pc.isNice()) output("You’ve probably done enough already. You turn to leave, shooting him a victorious grin as you go.");
	else if(pc.isMischievous()) output("Too bad you’re not really in the mood right now. He’s one lucky cat... or maybe not so lucky after all? You motion a small farewell to the prone naleen and move away.");
	else output("You kick his tail away and tell him to scramble. You don’t have time to waste with wimps like him.\n\nThe naleen turns and slithers away as fast as he can, before you can change your mind.");
	output("\n\n");
	processTime(3);
	CombatManager.genericVictory();
}


//Male naleen victory scene. PC gets naleen to pork their bum with one hot dog and use their cheeks as a bun for the other, or ram both dicks into one hole. And the PC's cunt-tail can have some fun, too, if they’ve got one.
public function getButtfuckedByDudeleen():void
{
	clearOutput();
	author("MistyBirb");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	
	if(pc.isAss())
	{
		output("You yank the naleen upright and give his cocks a rough squeeze, getting a feel for their size. Satisfied, you ");
		if(pc.armor.shortName != "" || pc.upperUndergarment.shortName != "") output("turn away and strip down to nothing");
		else output("sigh and run your hands across your naked body} as the alien hunter ogles you.");
	}
	else
	{
		output("You bite your lip, approaching the feline-reptile hybrid with an obvious excitement. He looks at you, following your gaze down to his twin reptilian dicks.");
		if(pc.armor.shortName != "" || pc.upperUndergarment.shortName != "") output(" You peel off your clothing and bare your [pc.skinFurScales] to the humid jungle air");
		else output(" He clears his throat as you flash a smile");
		output(", ready for some fun.");
	}
	
	output("\n\nWith a seductive shake of your [pc.hips], you sashay away in search of a suitable spot, leaving the naleen to stare after you. He’s shamelessly aroused already, each dick stiff and leaking precum, but you hold him in anticipation. You need to find the right spot.  A nearby tree catches your eye, perfectly sized for you to lean against it. You press your palms to the vine-covered trunk and stick out your ass, then give the naleen a sultry look over your shoulder");
	if(pc.hasTail()) output(", raising your [pc.tails] to ensure a perfect view of all you have to offer");
	output(". The alien hunter jumps to attention, unable to contain himself any longer. He slithers forward and runs his hands across your [pc.ass], and you scoot back into him and grind your butt against his dicks.");
	output("\n\n<i>“Can you figure it out, or do I just need to say it?”</i> you ask as the naleen does nothing more than marvel at your backside.");
	output("\n\nHe clears his throat and takes the hint,");
	if(pc.hasVagina())
	{
		output(" but as he moves to thrust you feel a cock testing the entrance of [pc.oneVagina].");
		output("\n\n<i>“Ah!”</i> you scold, shifting away, <i>“Hold on.”</i> You glance back and line up your [pc.asshole] with the lower of his two shafts, settling the other in between the cheeks of your ass. <i>“Much better.”</i>");
		output("\n\nThe naleen doesn’t complain, too eager for satisfaction to care which hole he squeezes into. He flicks his tongue and grips your [pc.hips], then dives into your [pc.asshole] with a vigorous energy.");
	}
	else output(" lining up one of his reptilian dicks with your [pc.asshole] and sliding inside you.");
	
	if(pc.analVirgin)
	{
		output("\n\nGiven your inexperience, the process is a little rougher than you’d like, and you almost begin to regret giving in to your adventurous side. But the naleen seems to pick up on your discomfort. You hear him chuckle as he slows down and ");
		if(pc.hasHair()) output("runs his fingers through your [pc.hair].");
		else output("traces a claw down your back.");
		output("\n\n<i>“You’re pretty brave, aren’t you?”</i> he asks, to which you respond with a strained smile and a shrug. The dick buried halfway in your ass swells a bit before you feel it move forward, inching deeper inside you. The naleen starts to rock his hips gently, easing himself in and out of your untrained ass. He carefully stretches you with his girthy reptilian dick and, slowly but surely, pleasure replaces pain.");
		output("\n\nThe naleen picks up his pace, but keeps his thrusts shallow, at least until your ass stops putting up so much of a fight. Just as your pleasure begins to outpace your breath, the alien lets out a predatory hiss and drives himself deeper. Your whole body tenses and you let out a cry of surprise as he starts pounding away at your [pc.ass], but he gave you enough of a warm up that you can take him decently well. You grunt and gasp, the slapping of the naleen’s balls against your butt punctuating the ambience of the jungle.");
	}
	else
	{
		output("\n\nYou sigh in satisfaction and focus on relaxing your rear end to take your alien lover as deep as possible. It only takes a few thrusts before his hips meet your [pc.ass], his dick swallowed whole. The feeling of fullness coaxes out a long, lewd moan, and ");
		if(pc.hasCock()) output("[pc.eachCock] twitch as your [pc.tongue] lolls out of your mouth.");
		else output("you let your tongue loll out of your mouth.");
		output(" The naleen pounds away, one shaft buried in your [pc.asshole] while the other slides between your asscheeks.");
		if(pc.hasTail())
		{
			output(" The upper shaft grinds against the base of your [pc.tails], hitting the deliciously sensitive spot right where ");
			if(pc.tailCount > 1) output("they meet");
			else output("it meets");
			output(" your spine.");
		}
		output("\n\n<i>“More,”</i> you say, turning back to look him in the eye, <i>“");
		if(!silly) output("Faster! Harder!");
		else output("Harder, better, faster stronger!");
		output("”</i>");
		output("\n\nHe flicks his forked tongue and winks. There’s a pause as he draws his hips back, holding you in suspense, until he surges forward and nearly slams your face against the tree. You cry out in approval, and the naleen leans forward to hammer against you. ");
		if(pc.isNaga()) output("Your serpentine tails entangle one another, scales sliding over scales and muscles twisting every which way. Each of you coils around the other, keeping your lower halves together as your top halves maintain the excited, rhythmic fucking. ");
		output("You grunt and gasp, the slapping of the naleen’s balls against your butt punctuating the ambience of the jungle.");
	}
	
	var analCap:Number = pc.analCapacity();
	pc.buttChange(enemy.cockVolume(0));
	
	if(pc.hasVagina())
	{
		if(pc.totalVaginas() > 1) output("\n\nYour untouched slits let out a dribble of [pc.girlCum], as if indignant that they’ve been ignored. ");
		else output("\n\nYour untouched slit lets out a dribble of [pc.girlCum], as if indignant that it’s been ignored. ");
		if(pc.genitalLocation() >= 2) output("Sadly, you can’t reach your [pc.cunts], having to settle for the buttfuck alone. Or so you think. While the naleen may have respected where you did or did not want his dick, he’s still a little eager to try out your feminine side. You giggle as you feel a few furred fingers slip into [pc.oneVagina], expertly teasing it. ");
		else
		{
			output("Unable to resist, you ")
			if(pc.hasLegs()) output("tuck a hand between your [pc.legs]");
			else output("slide a hand towards you waist");
			output(" and set to work, giving [pc.eachClit] a little tweak. The eye-fluttering stimulation combined with naleen’s thrusting is almost too much, and you groan in ecstasy.")
		}
	}
	if(pc.hasCuntTail()) output("\n\nWith lust and satisfaction occupying your mind, you don’t pay much attention to your tail, but the [pc.tailVagina] at its tip is determined to get in on the action, too. You unconsciously curl the prehensile length around to engulf the naleen’s upper dick, surprising him enough that he actually stops his pounding. As soon as your tail gives his cock the first of many rough squeezes, though, he jumps back into action, now with both dicks buried inside you.");
	if(analCap > 300)
	{
		output("\n\nThe naleen’s dick pistons in and out of you, but it’s not quite enough. You need more. You twist back and hold up a hand, signaling him to stop for a moment. He looks up at you in confusion, and you take a deep breath before pointing to his other penis.");
		output("\n\n<i>“Both. I want both.”</i>");
		output("\n\nHis eyes light up, and he pulls away to grab each of his reptilian dicks. He squeezes the bulbous rods together and presses both of their heads against your [pc.asshole], stretching you with twice as much girth as before.");
		output("\n\n<i>“Fuck yes...”</i> you moan, biting your lip. You give a frantic nod as the naleen picks up where he left off, your ass filled with a huge amount of cock.");
	}
	
	output("\n\nThe buttfuck gets more and more intense, and you lean heavily against the tree to keep yourself steady. Your [pc.chest] " + (pc.hasBreasts() ? "are" : "is") + " mashed against it as the naleen continues to pound you, ");
	if(pc.isLactating()) output("and the pressure squeezes streams of [pc.milk] from your [pc.nipples], sending trails of [pc.milkColor] racing down the tree to pool on the earth below. ");
	else output("but the harsh pressure is really just one more bit of stimulation. ");
	output("As your alien lover begins to grunt with every increasingly powerful thrust, it almost feels like you’re holding on for dear life.")
	if(analCap > 300) output("Your stomach swells in time with his movements, the combined girth of his dicks stretching you to an incredible extreme.")
	output(" But the pleasure doesn’t lie, and the roughness only serves to highlight how good it all feels.");
	
	output("\n\nThere’s only so much you can take, though, and you feel your limits being tested. The naleen is barely holding on himself, shivering whenever your [pc.ass] ");
	if(pc.hasCuntTail()) output("and [pc.tailVagina] squeeze his dicks.");
	else if(analCap > 300) output("squeezes his dicks.");
	else output("squeezes his dick.");
	output(" Eventually a long groan overcomes him as he slams into you one final time, burying himself as deep as he can. Both of his cocks pulse as they blow their load, and the sensation of being ");
	if(!pc.hasCuntTail() && analCap < 300) output("simultaneously covered and ");
	output("filled with cum is your breaking point.");

	if(pc.hasCock())
	{
		output("\n\nYou arch your back, [pc.eachCock] ");
		if(pc.cumQ() > 1000) output("letting out a flood of [pc.cum]");
		else output("shooting ropes of [pc.cum]");
		output(" against the base of the tree")
		if(pc.hasVagina()) output(" and your [pc.cunts] spasming in turn");
		output(". A series of rapid, breathy pants escape from your mouth as [pc.eachCock] paints the jungle floor [pc.cumColor], and you’re too entangled in pleasure to vocalize anything of substance. You’re left gasping for air, and you cling limply to the tree for support.");
	}
	
	if(pc.hasVagina() && !pc.hasCock()) output("\n\nYou arch your back, [pc.eachVagina] spasming and soaking the naleen’s waist with [pc.girlCum]. A series of rapid, breathy pants escape from your mouth as your body is assaulted by orgasm, and you’re too entangled in pleasure to vocalize anything of substance. You’re left gasping for air, and you cling limply to the tree for support.");
	
	if(pc.hasCuntTail()) output(" Amid it all, your tail clenches and sucks, muscles pulsing to draw the naleen’s seed deep inside. It squeezes every last drop out of the naleen, not relenting until its meal is totally exhausted. Hunger satisfied, it slips off the alien’s shrinking dick and flops against your [pc.ass].");
	
	output("\n\nBoth you and the naleen are still for a few moments as your orgasms wind down, until he withdraws to ");
	if(pc.isNaga()) output("uncoil himself from around your tail and ");
	output("slither away. You eventually manage to pull yourself together, semen leaking from your ass. Several feet away, the naleen sighs and stretches, giving a tired wave as you begin to collect your things. You reciprocate before ");
	if(pc.armor.shortName != "" || pc.upperUndergarment.shortName != "") output("getting dressed and ");
	output("wordlessly setting out into the jungle. You’re left feeling a bit winded, but definitely satisfied.");
	
	processTime(20);
	pc.orgasm();
	pc.loadInAss(enemy);
	
	output("\n\n");
	CombatManager.genericVictory();
}


//Ride Him
//Requires PC has at least one vagina and not taur
public function rideDudeleensWithAPussaaaaah():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	var x:int = pc.cuntThatFits(enemy.cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	var y:int = -1;
	if(y < 0 && pc.totalVaginas() > 1)
	{
		y = 0;
		if(y == x) y = 1;
	}
	output("You feel your own desires peak as you look over your quarry; you know exactly what you want to do with him. But first, you need to secure him, just in case he gets any bright ideas about those claws of his.");
	output("\n\nProcuring a nearby vine, you roll the naleen onto his belly, pinning him to the ground as you forcefully tie his hands behind his back. Satisfied that he won’t be using those sharp claws anytime soon, you roll him over once more and take a good look at him.");
	output("\n\nYou’ve caught yourself quite a fine specimen here. His features are attractive; masculine, but not overly developed, giving him smooth, clean lines. Atop his head are his cat-like ears, which flick from time to time as he watches you through defiant, golden eyes. He growls softly as you examine him with just a hint of a hiss under his breath.");
	output("\n\nDrawing yourself up to your full height, you ");
	if(!pc.isNaga()) output("place your [pc.foot] atop his chest, pushing down firmly with enough weight to make yourself felt without hurting him");
	else output("wrap your [pc.legOrLegs] around his chest, trapping him within bindings of your scaled flesh");
	output(".");

	//if Hard:
	if(pc.isAss()) output("\n\nGlowering down imperiously from on high, you demand he lower his eyes and show you proper respect.");
	output("\n\nHe huffs and turns to look away.");

	output("\n\nDespite his reaction, you watch with amusement as you notice his soft-barbed dicks");
	if(enemy.HP() <= 0) output(" throbbing as a bead of pre begins to form on their twin tips.");
	else output(" throb in excitement as a large dollop of pre forms on their twinned tips, sliding down his lengths as he makes his excitement clear.");

	//if Hard:
	if(pc.isAss()) output("\n\nWith a smile, you compliment him on being such a good bitch and understanding his place.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nWell, that’s frankly quite flattering. One can only hope to have this kind of effect on such a fine looking kitty as him.\n\nHe glances at you momentarily before looking away. If it weren’t for his black fur you’re certain he’d be blushing in embarrassment. Cute.");
	else output("\n\nYou tell him that as long as he doesn’t give you a reason to hurt him, you won’t. Plus you’ll make it feel good for him too.\n\nYour only reply is a grunt of acknowledgement.");

	output("\n\nOn a whim, you ");
	if(!pc.isNaga()) output("move your [pc.foot] back against the exposed flesh and begin to stroke one of his dicks, feeling the surprisingly soft barbs bend and flex as you run your [pc.foot] over them");
	else output("bring up the very tip of your tail and start to stroke his cocks with it, coiling it into a perverse figure eight, running over soft, pliant barbs and feeling them tickle across your scales");
	output(". He groans as you do so.");

	output("\n\nSome predator he is, getting off on being utterly dominated by his <i>prey</i>. You tease him for being so accepting of your advances. He glares menacingly back at you, growling even louder.");

	//Hard:
	if(pc.isAss()) {
		output("\n\nAh-ah! You chide him to play nicely, or else, ");
		if(!pc.isNaga()) output("grinding your [pc.foot] into that one dick even harder");
		else output("coiling tighter around his oozing pricks as you give them a nice, hard squeeze");
		output(", though not hard enough to actually hurt... yet.");

		output("\n\nHe grunts in understanding as he lays down and begins to relax, acknowledging that he’s at your mercy.");
	}
	//Mischievous
	else if(pc.isMischievous()) output("\n\nNow, now. If he doesn’t play nice, you might have to do something you’ll both regret. So he’d better get over himself and submit. Plus he seems to be enjoying himself too, you tease.\n\nHe grunts in pleasure as you give his shaft a firm stroke with your [pc.foot], his doubled spurts of pre signaling his undeniable enjoyment as he calms down.");
	else output("\n\nYou warn him against fighting back. He obviously wanted sex with you. All he has to do is lie back and you can both enjoy it.\n\nHe scoffs at first, but after a moment to think he decides to play along. With a nod of understanding he quiets down. You give him a congratulatory stroke on with your [pc.foot], earning a pleasured sigh from the increasingly aroused, alien naga.");

	output("\n\nThat’s better. Lowering yourself down until you are ");
	if(pc.legCount == 1) output("positioned above");
	else output("straddling");
	output(" his waist, just above where his cocks emerge, you feel one ");
	if(!pc.isNaga()) output("rubbing against your [pc.ass]");
	else output("pushing against your [pc.legOrLegs]");
	output(". Once in position, you drag yourself up his body, sliding your [pc.vaginas]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(" over his form, reveling as his soft fur tickles you, slipping over his firm, defined muscles until you are resting on his collarbone with your [pc.vaginas] hovering above his face. <i>“Lick,”</i>  you demand before warning him that you had better not feel so much as a scratch from his teeth.");

	output("\n\nHe hesitantly extends his tongue to give [pc.oneVagina] a tentative lick, then another, and another.");

	output("\n\nYou shudder a little as his tongue’s touch sends the most delicious tingles up your spine, but stay quiet, casting a stern gaze down at him to make sure he continues.");

	output("\n\nYou feel his tongue circling your labia");
	if(pc.hasClit()) output(", teasing your [pc.clits], then backing down");
	 output(" as he licks your opening. As moisture gathers, he eagerly laps it up.");

	output("\n\nAmusement mingles with your pleasure; the once-stern expression on the naleen’s face has softened, swept aside by his concentration on the task so literally in front of him. You reach down with one hand and caress his head, scratching gently between his ears, smiling as you praise him for his efforts.");

	output("\n\nHe begins purring, sending rumbling vibrations through your canal. Slowly he inches closer, lifting himself slightly off the ground");
	if(pc.hasClit()) output(" until his nose bumps against [pc.oneClit]");
	output(". You moan appreciatively, bucking slightly as you encourage him to go faster.");

	output("\n\nHis tongue is a blur on your [pc.vagina " + x + "], earnestly licking all around and inside you with apparent hunger, quite a turn from the previously hesitant feline-snake.");

	output("\n\nThe pleasure washes over you; if you were to let him, why, you could probably cum from just this alone... but you don’t feel like letting him just yet. Instead, you steel yourself and pull away from his face and questing tongue, dragging your now-slick and dripping cunt back over his belly towards his loins.");
	if(pc.vaginaTotal() > 1)
	{
		output(" Its empty sister");
		if(pc.vaginaTotal() > 2) output("s quiver");
		else output(" quivers");
		output(" needily, but you only had time for one tongue-job.");
	}
	output(" His dicks are hot and damp as your netherlips touch them, soaked in pre-cum wrung from him whilst he was lavishing his attention on your cunt before. You grind back against ");
	if(pc.vaginaTotal() == 1) output("one");
	else output("them");
	output(", tantalizingly brushing ");
	if(pc.vaginaTotal() == 1) output("its");
	else output("their");
	output(" rubbery nubs against your outer lips but not actually allowing ");
	if(pc.vaginaTotal() == 1) output("it");
	else output("them");
	output(" to penetrate you. You look down at him with imperious regality from your perch, waiting to see what your little pet will do now.");

	output("\n\nHe tries to move himself so he can properly align himself with your entrance");
	if(pc.vaginaTotal() > 1) output("s");
	output(", but a menacing glare quickly stops him on his tracks. Writhing with eager need, the naga does his best to entice you before his bindings arrest his movements. With nothing else to do, he looks at you, panting, and then he whispers, <i>“P-please....”</i>");

	output("\n\nYou tilt your head slightly. What did he just say? You didn’t catch that right.");

	output("\n\n<i>“Please, I need-”</i>  he catches himself mid-sentence, swallowing audibly. <i>“Please,”</i>  he begs.");

	output("\n\nWell, how could you refuse such a request? You take hold of his barbed ");
	if(pc.totalVaginas() == 1) output("prick and align it with your opening.");
	else 
	{
		output("pricks and align them with ");
		if(pc.totalVaginas() > 1) output("two of ");
		output("your entrances.");
	}
	output("\n\n<i>“Ah, yes....”</i>");

	output("\n\nSlowly you begin sliding down ");
	if(pc.totalVaginas() == 1) output("its length");
	else output("their lengths");
	output(".");

	output("\n\n<i>“Yes!”</i>");

	output("\n\nYou moan as ");
	if(pc.totalVaginas() == 1) output("it spears");
	else output("they spear");
	output(" inside of you, ");
	if(pc.totalVaginas() == 1) output("its");
	else output("their");
	output(" flexible bristles sending sparks of pleasure coursing along your nerves as they caress your inner walls. Down and down you sink over inch after inch of thick, textured naga-cock.");

	output("\n\n<i>“Yes-sssss!”</i>  he hisses, as you finally bottom out. His face contorts in equal parts relief and pleasure.");

	//CHECK VIRGINITIES HERE!
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	if(y >= 0) pc.cuntChange(y,enemy.cockVolume(0),true,true,false);

	output("\n\nYou groan lustily, clenching down and feeling ");
	if(pc.totalVaginas() > 1) output("their");
	else output("its");
	output(" hot, hard length");
	if(pc.totalVaginas() > 1) output("s");
	output(" inside of yourself, savoring the soft barbs as they caress your inner walls. Mustering your strength, you raise yourself upwards and then slam yourself back home again, setting a quick and passionate pace that sends shivers of pleasure through your sopping-wet womanhood");
	if(pc.totalVaginas() > 1) output("s");
	output(". Again and again, you bounce atop his scaly body, working his purplish prick");
	if(pc.totalVaginas() > 1) output("s");
	output(" with libertine enthusiasm, caring only for the way they feel inside you and praying that he doesn’t get off before you do.");
	if(pc.totalVaginas() == 1) output(" His unused dick threads through the crack of your [pc.butt] like the sinuous snake that it’s attached to, leaking in between throbbing pulses of excitement.");

	output("\n\nSoon enough he starts bucking against you, his body now moving on full, biological automatic. His coils thrash against the ground as he erratically thrusts into you, flattening plants and digging deep furrows into the ground. He yowls and mewls in a crescendo as he escalates towards the peak of his pleasure. You grab hold of his shoulders for stability and ride him like a ship in a storm, only the crests of these undulating waves make your [pc.vaginas] sizzle with drippy, leaking bliss.");

	output("\n\nYou clamp down with your [pc.vagina " + x + "] for all you’re worth, losing yourself in the sheer pleasure you’re feeling. The electric sparks his nubs tease from your misfiring nerves make it difficult to do anything but groan and bounce, your mind entirely filled full of fuck and need. You are getting so close that you can feel little else, and with all the bubbling pre drizzling out of your slit");
	if(y >= 0) output("s");
	output(", the naleen appears equally close. Each wet slap of flesh on flesh could be the one that brings one of you off. Each shuddering sigh of bliss could be the signal of an impending orgasm. Both your bodies are quivering with palpable need, and any second now, one of you is going to cum.");

	output("\n\nUltimately, the naleen finishes first. With a yowl that quickly dissolves into a hiss, he thrusts upward, bending his back with inhuman flexibility as he unloads all of his cat-snake cream into into your juicing cunn");
	if(y < 0) output("y");
	else output("ies");
	output(". Jet after jet of warm jism plasters your walls as his thrashings slowly fade into weaker and weaker twitches. Every ejaculation seems to rob him of strength until his body is still and his members are dribbling virile spunk into your creampied snatch");
	if(y >= 0) output("es");
	output(".");

	output("\n\nLuckily, the feeling of hot spooge pouring into your receptive, quivering entrance");
	if(y >= 0) output("s");
	output(" is the last stimulant you need. Your [pc.vaginas] clamp");
	if(y >= 0) output("s");
	output(" down with all ");
	if(y >= 0) output("their");
	else output("its");
	output(" might, instinctively trying to hold as much of his cum inside of you as possible while your climax rocks you. You fling back your head and cry out in pleasure, oblivious as ");
	if(pc.hasCock())
	{
		output("[pc.eachCock] ");
		if(pc.cumQ() <= 25) output("spurts");
		else if(pc.cumQ() <= 100) output("sprays");
		else if(pc.cumQ() <= 500) output("gushes");
		else output("cascades");
		output(" [pc.cum] onto his belly and chest while ");
	}
	output("[pc.eachVagina] gushes and drools, washing his loins with your own female orgasm. Your interior muscles rhythmically clench and squeeze with excited trembles. Each time you gasp and moan, riding your orgasm long past the end of the naleen’s quick cum.");

	output("\n\nYou take a deep breath, finally able to relax after getting your rocks off, and lick your lips in contentment. It takes a moment to extract yourself from your naleen partner’s many coils, but when you do, a stream of mixed juices drips down from your well-used hole");
	if(y >= 0) output("s");
	output(" and down onto his slowly receding, purple cocks.");

	output("\n\n<i>“Now that wasn’t so bad, was it?”</i>  You say with a superior look.");

	output("\n\nThe naleen is openly purring, eyes closed as he enjoys his afterglow. Looks like he’s on the verge of taking a catnap.");

	//Orgasm and time pass before endings!
	processTime(20+rand(25));
	pc.orgasm();
	pc.loadInCunt(enemy, x);
	if (y != -1) pc.loadInCunt(enemy, y);
	
	//if Kind / Mischievous:
	if(!pc.isAss()) {
		output("\n\nYou roll him on his side and undo his bindings before giving him a soft pat on the head.");
		output("\n\n<i>“Thank you...”</i>  he exhales in an exhausted whisper, momentarily opening his eyes to gaze at you.");
		output("\n\nSatisfied, you don your [pc.gear] and leave him lying on the jungle floor.\n\n");
		CombatManager.genericVictory();
		return;
	}
	//Hard
	else output("\n\nYou look at the lazy cat-snake. Off to nap already. You ponder if you should even bother releasing him at this point.");
	
	clearMenu();
	addButton(0,"Release",releaseNaleenAfterLadyWins);
	addButton(14,"Leave",leaveTheDudeNaleenAfterLadyWins);
	//[Release][Leave]
}

//[=Release=]
public function releaseNaleenAfterLadyWins():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You roll him on his side, undoing his bindings and leaving him to pass out on the ground.");
	output("\n\nSatisfied for the moment, you don your [pc.gear] and leave him lying on the jungle floor.");
	output("\n\n");
	CombatManager.genericVictory();
}

//[=Leave=]
public function leaveTheDudeNaleenAfterLadyWins():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("He’s a big kitty, he can take care of himself.");
	output("\n\nYou put on your [pc.gear] and leave the naleen to fend for himself.");
	output("\n\n");
	CombatManager.genericVictory();
}

//Get Blown
//Requires PC has at least one penis
public function getBlownByDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("Looking between your would-be assailant and your crotch, you decide there’s only one thing to do in this situation. Turnabout is fair play, after all, but first, you had better see about securing his hands. You don’t want any nasty little surprises if he gets a second wind, after all. With plenty of nearby vines, finding something to bind his hands is as simple ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("as a bodyguarding job");
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("as a borderworld smuggling run");
	else output("as a drive calibration");
	output(".");

	output("\n\nHe glares at you, growling defiantly as you gaze down upon him.");

	//Hard:
	if(pc.isAss()) output("\n\nYou deliver a slap across his face, immediately silencing him. You remind him of his position, and warn him that unless he fancies being left helpless for the zil, he had best cooperate.\n\nHe looks away; it’s clear that your slap hurt his ego more than it hurt him. When he gazes back at you, you observe he seems much more mellow and accepting. Good.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nYou warn the little kitty to play nice. You took him down once already, and you can take him down as many times as you need. So he might as well as be a good boy and save you both the trouble.\n\nHe looks away with a scowl, but otherwise seems compliant. Now that’s much better.");
	else output("\n\nYou simply continue to look down at him, not reacting to his threatening growl at all.\n\nHe tries to struggle against his bindings, but you pin him down by his shoulders. Your message is clear, either he stays quiet and lets do your thing or you’re not budging and neither is he.\n\nHe snorts in frustration, but after a few moments he decides to comply. You release him as he goes slack, patting him on the head for his cooperation.");
	output("\n\nNow that he’s calmed down you’re free to secure his hands behind his back so you can start with the fun stuff. After all, he seemed pretty intent on doing this kind of stuff to you. He’s probably more upset about being on the bottom than he is about the sex. Stepping closer to him, you adjust your [pc.gear] to expose your ");
	if(pc.cockTotal() == 1) output("half-erect [pc.cockNounSimple], letting it wave in the naleen’s face");
	else output("[pc.cocks]. Then, you take your [pc.cockBiggest] in hand and wave it in the naleen’s face");
	output(". He considers it for a moment, but you command him to lick it before he can give any response.");

	output("\n\nHe nervously extends his quivering tongue, giving your [pc.cockHeadBiggest] a tentative lick, barely tasting you.");

	output("\n\nWith a click of your tongue, you push your dick against the naleen’s face, rubbing it along his cheeks and under his nose, forcing him to inhale your masculine scent even as you instruct him to try again, and lick properly this time.");

	output("\n\nNodding reluctantly in understanding, he looks up. The aggressiveness he once spouted has been completely replaced by compliance. Extending his tongue once more, he tries his best to lick the underside of your [pc.cockBiggest]. Though he is earnest in his attempt, there’s only so much he can do whilst lying prone and helpless. The warm pressure of his tongue against your length is pleasant nonetheless.");

	output("\n\nWith a better blowjob in mind, you set out to remedy his subpar positioning. You pull him upright by his muscular shoulders, settling him against a nearby tree so that he’ll remain upright in spite of his restraints. Then, you straddle his chest and stroke his ears. That’s a good kitty. Now, if he wants to keep being a good boy, he needs to keep licking. You present him with your [pc.cockBiggest] once more, admiring the way his saliva has made it shine.");

	output("\n\nDetecting just the faintest hint of what might be a purr, you smile as he noses your throbbing shaft. He sniffs you softly, taking in your scent as he extends his tongue once more. Though his movements are slow, you notice that he seems to be more eager than before. Perhaps the erotic contact and scent of your [pc.cockBiggest] is starting to get to him?");

	output("\n\nHe takes his time lapping along the underside, the sides, and even the top of your shaft all the way from the [pc.sheath " + x + "] to the tip. A bead of pre forms on your [pc.cockHeadBiggest] and is eagerly swiped by the naleen’s feline tongue, drawn deep into his rumbling throat.");

	output("\n\nYou purr in pleasure as his tongue caresses your sensitive flesh, your [pc.cockBiggest] growing harder under his ministrations, rewarding him with ever-more pre-cum to lap up. Unable to remain passive, you start to buck against his tongue, rolling your shaft along the hot, wet length of his caressing muscle until you find yourself almost accidentally thrusting against his lips, dragging your [pc.cockHeadBiggest] back against them, leaving a trail of shining pre in your wake.");

	output("\n\nYou continue your soft motions until - with a gasp of surprise - you finally find yourself inside the naleen’s warm mouth. He looks strangely pleased, pursing his lips over your [pc.cockHeadBiggest] and beginning to suckle it like a teat. His tongue, not missing a beat, begins circling around it, pushing against your cumvein as you hiss in pleasure.");

	output("\n\nSqueezing with your [pc.legOrLegs], you pull back slightly, just enough to keep your cock out of his mouth, well beyond his reach. As you do so, you praise him for getting into the spirit of things; he’s doing very well.");

	output("\n\n<i>“Please, can you...?”</i> he pleads.");

	output("\n\nYou look at him in confusion.");

	output("\n\n<i>“My hands are tied,”</i>  he says, struggling against his bonds.");

	output("\n\nLooking over at your former foe, you turn your head back to see just how horny his submission has made him. He’s panting slightly with frustrated lust, both cocks jutting forth hard and firm from his loins, already dripping with his desire.");

	output("\n\nIf you were feeling generous, you could give him some relief. Maybe you could use your hands, or maybe you could let him take your ass.");
	if(pc.hasCuntTail()) output(" Better yet, you could give your [pc.tailgina] an orgasmic snack.");
	output(" Then again, he did attack you. You could just ignore him and get yours.");
	if(pc.hasCuntTail())
	{
		if(flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7) {
			output(" <b>While pondering the choice, the hunger grows to an overwhelming degree. You cannot resist. You HAVE to feed your tail");
			if(pc.tailCount > 1) output("s");
			output(".</b>")
			clearMenu();
			addButton(3,"Cunt Tail",cuntailOnDudeleen);
			addDisabledButton(0,"Ignore");
			addDisabledButton(1,"Handjob");
			addDisabledButton(2,"Take Anal");
		}
		else
		{
			clearMenu();
			addButton(0,"Ignore",ignoreDasNaga);
			addButton(1,"Handjob",handjobThatDudeleen);
			addButton(2,"Take Anal",getTakenInTheAssByDudeleen);
			addButton(3,"Cunt Tail",cuntailOnDudeleen);
		}
	}
	else {
		clearMenu();
		addButton(0,"Ignore",ignoreDasNaga);
		addButton(1,"Handjob",handjobThatDudeleen);
		addButton(2,"Take Anal",getTakenInTheAssByDudeleen);
		addDisabledButton(3,"Cunt Tail");
	}
}

//[=Ignore=] 
public function ignoreDasNaga():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You simply shake your head and inform him that you won’t. You’ll cut him loose once you finish, you promise, but right now, this is your time. He should be a good little pet and get back to licking - the sooner you’re done, the sooner he can go free.");
	output("\n\nHe nods in understanding, closing his eyes and opening his mouth. His tongue extends like a landing pad, ready to receive you. You’re more than happy to oblige.");
	output("\n\nYou clasp your hand around your shaft, stroking it a few times to ensure you are fully erect before aiming it at the naleen’s open maw. Smoothly you brush it along his warm, wet tongue, gliding inside his welcoming mouth");
	if(pc.biggestCockVolume() <= 100) output(" and pushing in until you have hilted yourself");
	output(".");
	if(pc.biggestCockVolume() > 100) output(" Despite your inhuman size, the naleen’s mouth just seems to keep stretching around it; evidently, it’s not just his tail that’s snake-like. Soon, your [pc.sheath " + x + "] is pressing hard against his lips thanks to the body-filling blowjob you’re receiving.");

	output("\n\nStraining to gulp around your entire length, the naleen closes his eyes. You feel his ");
	if(pc.biggestCockVolume() <= 100) output("lips");
	else output("throat muscles");
	output(" grip down against you from all sides, stroking you pleasurably as they attempt to draw you deeper, and can’t help but wonder at how well practiced he is at this.");

	output("\n\nThere’s only one way to find out.... You start to thrust your hips back and forth, sliding your cock in and out of the warm, wet velvet of his mouth, moaning at the feel of him wrapped so tightly around your shaft. Your rhythmic motions are effortless; it feels like kitty-snake lacks even a hint of a gag reflex.");
	if(pc.biggestCockVolume() > 100) output(" Not even your immense [pc.cockBiggest] seems to bother him. You can clearly see it outlined in his throat. Just how stretchy is he?");
	output(" You gradually become aware of his tongue’s movements slowing before going entirely slack beneath you.");

	output("\n\nHungry for more, you tell him to get back into it.");

	output("\n\nHe furrows his brows, but complies with your order. Slowly he works his tongue around your ");
	if(pc.biggestCockVolume() > 100) output("impressive ");
	output("girth, drooling around your [pc.cockBiggest] as he tries to swallow.");

	output("\n\n<i>“That’s a good boy,”</i>  you note, even as you pick up the pace of your thrusting. Now that you’ve seen how well he can handle it, you can start throat-fucking the oral cocksleeve in earnest.");

	output("\n\nThe naleen’s tongue coils and twists, wrapping up your " + pc.mf("man","herm") + "-meat even as you thrust it deep into his mouth and pull it out again. The heat and the friction send the most delicious sensations across your body. Growling like an animal, you fuck him as hard as you can, and your new bitch-boy seems to get off on it. You can feel him purring, vibrating your [pc.cockBiggest] in his throat, each pleasant rumble sending sparks cascading through your mind. You dimly feel yourself petting his ears, giving him an idly affectionate scratch as you continue to piston your hips.");

	output("\n\nHis brow softens a bit, and you feel him twisting slightly to lean in against your caressing hand. His purring intensifies slightly and his tongue begin stroking you a little more vigorously, pumping along your length. Between his mouth and the squeezing oral appendage, it becomes difficult not to immediately climax. The sensations are something akin to fucking a hot, wet passage while a smaller sleeve moves along your length, stroking to its own tempo. Your [pc.hips] lurch jerkily as you try to maintain your rhythm. Somehow, you hold on, thrusting with powerful, firm motions as you try to ignore his tongue’s rampant tugging.");

	output("\n\nYou gasp and moan, feeling the last of your resistances crumble beneath his added onslaught of pleasure. With an ecstatic cry, you plunge your shaft into his mouth one last time, completely hilting yourself as you erupt in orgasm, spilling your [pc.cum] down his throat");
	if(pc.cumQ() >= 500) {
		output(" until his belly bulges ");
		if(pc.cumQ() <= 1500) output("slightly");
		else if(pc.cumQ() <= 3000) output("hugely");
		else output("obscenely");
	}
	output(". Gasping for breath, you heave a huge sigh as you slump against him, absently pulling your semi-flaccid shaft from the naleen’s mouth.");

	if(pc.cockTotal() > 1)
	{
		if(pc.cockTotal() == 2) output(" Your other wilting length");
		else output(" Your other wilting lengths");
		output(" did a good job of splattering his fur with [pc.cumColor] streaks.");
		if(pc.cumQ() >= 500) output(" There’s even a puddle forming underneath him, staining his long, wriggling tail with your [pc.cum].");
	}
	output("\n\nHe gasps and coughs, some of your recent deposit drooling out of his mouth along with his saliva. <i>“Can you let me go now?”</i>");
	processTime(30+rand(10));
	pc.orgasm();
	//Kind / Mischievous: 
	if(!pc.isAss())
	{
		output("\n\n");
		if(pc.isMischievous()) output("Well, you are tempted to leave him and see how long it takes him to break free, but you don’t have time for that. ");
		output("You nod absently and clamber off of his chest, pulling him into a position where you can remove the vines binding his wrists. Gathering your gear, you turn and start heading off, leaving the now-free naleen behind you.");
		output("\n\nBefore you are out of sight, though, curiosity prompts you to look back. The horny being is busily wiping off some of the semen he spilt down himself during your coupling, applying it to his own dicks as makeshift lube and jerking himself off furiously. You chuckle at the sight.");
		output("\n\n");
		CombatManager.genericVictory();
	}
	//Hard:
	else {
		//[LetGo][Refuse]
		addButton(0,"Let Go",letThatNaleenBoyPussyGo);
		addButton(1,"Refuse",refuseToLetTheNaleenGo);
	}
}

//[=LetGo=]
public function letThatNaleenBoyPussyGo():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You nod as you get off of him and roll him on his side so you can get to his bindings.");
	output("\n\nYou’ve barely released him and the slut is already masturbating. The horny cat-snake wasted no time getting his paws around his peckers to pump himself to orgasm. Honestly, it’s kind of amusing, however you’ve no time to waste. You put on your [pc.gear] and leave the cat to his devices.");
	output("\n\n");
	CombatManager.genericVictory();
}

//[=Refuse=]
public function refuseToLetTheNaleenGo():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You shake your head.");
	output("\n\n<i>“What!? But I-”</i>");
	output("\n\nYou silence him with a finger.");
	output("\n\nIf he didn’t want to wind up tied in the middle of the jungle he shouldn’t have challenged you. He’s a big kitty. You have no doubt he’ll find a way to release himself.");
	output("\n\nYou chuckle as you step away from the cursing feline. He vainly tries to reach for his bindings with his claws, but in his current position this is more than a little difficult. Well, you got yours, so there’s no point in sticking around. You don your [pc.gear] and leave the thrashing cat-snake to his own devices.");
	output("\n\n");
	CombatManager.genericVictory();
}


//[=Handjob=]
public function handjobThatDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("Well, since he’s being so enthusiastic about it, you suppose it wouldn’t hurt to give him a hand. Reaching back behind you, your fingers close around one of the naleen’s lizard-like pricks, feeling the lumps adorning his shaft against your palm as your hand encircles it and makes the first stroke.");
	output("\n\nHe lets out a hiss of pure pleasure, idly humping your hands as you tease the soft swollen bulbs of one of his shafts.");
	output("\n\nWith a smirk you squeeze just a little tighter, enough to be firm but not painful, and start to stroke again, languidly drifting up and down his length, your fingers locked around him all the while. <i>“Ah, yeah...”</i>  you hear him whisper airily. His hips move slowly, tentatively at first, before he begins to thrust at a desirable pace.");
	output("\n\nSince you’re going to be nice, he’s going to have to get off before you can. With this realization, you release his dick and swivel around on his chest so that you’re facing his twin shafts. Now seated less awkwardly, you reach forward and take hold of his prick once more; this time you grab the second one too, teasingly caressing them with your fingers before squeezing them just right and starting to pump. You time yourself so that when one hand is stroking down its shaft, the other is stroking up the other.");
	output("\n\nThe naleen starts panting at that, a yowl of pleasure escaping his lips as you hear - and feel - the rumbling purring on his chest. Seems like he’s enjoying himself! Perhaps he’s imagining a pair of lovely females, one on each of lengths, bouncing up and down to a fast, alternating tempo.");
	output("\n\nGrinning to yourself, you press your advantage, stroking faster and faster, erratically squeezing and releasing his shafts in order to heighten his pleasure. Beads of pre-cum well from each tip, oozing down over your fingers, and you happily gather up this impromptu lube in order to increase the smoothness with which your hands fly over his dicks.");
	output("\n\nBy this point your former foe has been reduced to a mewling, moaning pile. He struggles futilely against his bindings with each yowl you draw from his lips. His hips thrust furiously against your hands, beads of pre flying off his twin reptilian pricks with each messy slap of cock on cock on hand. His throbbing along with the rising desperation in his voice make it clear that you don’t have long before he blows.");
	output("\n\nThat, naturally, only spurs you on, and you continue to piston away with your hands until he finally loses control and climaxes. You lean back to avoid being splattered, even as your hands are covered in his seed. You settle back, giving him a moment to catch his breath. He purrs, eyes closed in a happy smile as he leans back to get comfy against the tree.");
	output("\n\n<i>“Thanks, I really needed that,”</i>  he says, idly licking his lips.");
	output("\n\nShifting back to face him once more, you tell him that means it’s time for you to get off. As you say this, your hand starts stroking your own erection, to start lubing yourself up with the naleen’s own cum.");
	output("\n\n<i>“Oh, right,”</i>  he swallows, still panting. <i>“S-sorry, but I’m a bit tired after that.”</i>");

	output("\n\nWhat? You got him off and he’s not even going to have the courtesy of returning the favor? You might as leave him for the zil if that’s the case.");

	output("\n\n<i>“No, wait! I’m sorry... I suppose you could just use my mouth?”</i>  he suggests.");

	output("\n\nThat will do, you tell him. <i>“Now open wide....”</i>");

	output("\n\nAs he does so, you waste no time in sliding your jizz-slick and leaking [pc.cockBiggest] home, feeding it into the naleen’s unresisting mouth until you have hilted yourself inside of him.");
	if(pc.biggestCockVolume() >= 100) output(" His throat bulges around your hugeness, but he seems totally unphased by it. Clearly there’s more than a little snake in this kitten.");
	output(" His fatigue shows in that he makes almost no effort to assist you beyond trying to keep his mouth sealed around your cock and giving you the occasional lick; it’s like fucking an onahole. Still, not one to be stymied, you continue to hump his face until you can feel your climax approaching.");

	output("\n\nYour dick pops wetly from his mouth and you give him a second or two to realize what you have in mind before you point your [pc.cockHeadBiggest] at his face as you stroke yourself over the edge, erupting in a spray of [pc.cum] all over his face");
	if(pc.cumQ() >= 75) output(" and chest");
	if(pc.cumQ() >= 250) output(" and stomach");
	output(".");

	output("\n\nSighing in contentment, you slide off of the naleen, casually rolling him onto his side so you can undo his bindings. As you start making your way again, you turn back to see what he’s doing with his new freedom. You can’t resist smirking to yourself when you see he’s still where you left him, lazily licking his face clean as best he can.");

	output("\n\n");
	processTime(30+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}

//[=Ass=] 
public function getTakenInTheAssByDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You look at the strange half-cat, half-snake humanoid and a wicked idea comes to mind. Reaching back, you squeeze the cheeks of your [pc.butt], spreading them apart to reveal your back passage, telling him that if he can reach it, you’ll let him put it in.");
	output("\n\nFurrowing his brows, he begins adjusting his coils, humping the air to get some leverage so he can bend far enough to align one of his cocks with your pucker.");
	output("\n\nYou encourage him to keep at it, lust starting to grow as it becomes clear that he really can fuck you and suck you at the same time.");
	output("\n\nHe grunts with effort as he nears your ass. You have no doubt that this position will put quite a bit of strain on his back, but that’s not your problem. If he wants some, he’d better come and get it.");
	output("\n\nThe naleen manages a few thrusts against your [pc.butt], but his awkward position means he can’t aim all that well, so he winds up poking your cheeks with his bulbous pricks. You find yourself laughing as he tickles you with his tips. The look on his face is absolutely priceless. A mix of frustration and desperation; you tease him by rooting him on and patting him encouragingly.");
	output("\n\nTry as he might, though, it’s clear he just can’t get anywhere, not in his present state. Turned on as you are, now, the idea of letting him give up is unacceptable; you want his cock in your ass and your cock in his mouth! Reaching back behind you, you feel for his manhood, closing your fingers triumphantly around the hot, wet, bulbous flesh. You give him a tender caress, and then guide the chosen dick towards your asshole, aligning its tip with your opening.");
	output("\n\nYour captive naleen thrusts into your hand in excitement, which causes his cock to escape your grasp and brush along your [pc.butt]. You scold him for his impatience. If he doesn’t stop and let you do what you need, he’s not going to get anything.");
	output("\n\nNodding submissively, he complies immediately, letting you grab one of his snake-dicks and bring it closer. He doesn’t make a single move, just letting you guide him until you feel his tip press against your [pc.asshole]. See? Isn’t it much easier when he cooperates?");
	output("\n\n<i>“Now,”</i>  you tell him, <i>“go slowly; you want to savor this....”</i>");

	output("\n\nStraining to control himself, he begins pressing the tip of his shaft into your [pc.butt]. You purr in anticipation, waiting for the delicious feeling of being speared open. At first it’s just a small pressure; he dares not thrust inside you. Instead, he resolves to smear your opening with his pre.");
	output("\n\nYou chastise the naleen; you told him to go slow, not to just sit on his ass doing nothing.");

	output("\n\nSwallowing and furrowing his brows in concentration, he nods, and finally, he begins the slow process of spearing your bowels. Pressure is applied once more, but this time he doesn’t stop. Slowly, your sphincter conforms to the shape of his tip, allowing him entrance");
	if(pc.ass.looseness() >= 4) output(", not that there was much conforming for you to do, gaped as you are");
	output(".");

	output("\n\nWith a soft sigh of pleasure you release his shaft, confident that he can continue feeding it inside of you now. You can feel his other purple prick on ");
	if(pc.tailCount == 0) output("your lower back");
	else output("the underside of your tail’s base");
	output(".");

	output("\n\nHis entrance is slow, almost grudgingly so. Whenever he meets with resistance, he stops in his tracks and wiggles a bit to loosen you enough so he continue to press inside you. In a few moments, you feel the touch of his scaly snake half, and you smile knowing he’s fully hilted inside you. He lets out a grunt that easily devolves into a purr of enjoyment as you grip around his bulbous base with your sphincter.");

	//BUTTGINITY CHECK HURR!
	pc.buttChange(enemy.cockVolume(0),true,true,false);
	
	output("\n\nYou arch your back and moan in pleasure, praising the naleen for how good he feels inside of you, instructing him to thrust slowly, to let you feel him massaging your insides with his wonderful snake-cock. If he does well, you promise, you’ll reward him. In fact, you have something for him now, so he’d best open wide....");

	output("\n\nSmiling eagerly, he licks his lips and holds his maw open for you, his feline tongue slipping past his lips to lightly lick at your [pc.cockHeadBiggest], enticing you to give him his prize.");

	output("\n\nAnd give his prize you shall. Slowly, you start feeding your [pc.cockBiggest] into his mouth, feeling its velvety wetness engulf you as he swallows inch after inch.");
	//PC has HyperDick:
	if(pc.biggestCockVolume() >= 200) output(" Even your immense size doesn’t stop him. The naleen is able to smoothly gulp down your monstrous shaft without pause. Even the slow distention of his neck doesn’t arrest his efforts.");

	output("\n\nFinally, when you’ve been taken to the hilt, you moan in pleasure, both from the feeling of his throat wrapped around your prick and from the sensation of his cock as it slowly pushes in and out of your [pc.asshole], the bulbs covering his length stimulating you almost like anal beads, his other prick dripping hot pre-cum down the crevice between your cheeks and lubing his strokes.");

	output("\n\nYou slide back, drawing your cock from his mouth and pushing your ass harder into the naleen’s cock, then thrust forward again, feeling his mouth and throat stretch around your ");
	if(pc.biggestCockVolume() >= 200) output("huge ");
	output("dick with effortless ease. Nerves afire with pleasure, you continue to thrust and grind, absently ordering him to go faster now.");

	output("\n\nHe eagerly complies, speeding up his pace until you can hear the soft squelching of your ass being taken by his reptilian member, a deliciously lewd noise that encourages you to do the same to the feline mouth wrapped around your own [pc.cockBiggest]. Whenever he thrusts into you, he hits your prostate, and you moan, instinctively pumping into his eager mouth. He purrs as he feels you feed him more of your delicious rod. The rogue vibrations send sparks of pure enjoyment up your spine, which makes you spurt a fresh gob of pre into his hungry throat. As the electric pleasure dissipates, you instinctively clench your ass, drawing a pleasured grunt from your naleen partner, and he thrusts back into you.");

	output("\n\nThe two of you continue in this endless cycle of pleasure like a well-oiled machine.  You can feel the tightness of impending climax welling up ");
	if(pc.balls > 0) output("within your [pc.balls]");
	else output("at the base of your spine");
	output(", and you ride the wave of pleasure as it surges through your body towards its crescendo as best you can. A blissful cry tears its way out of your throat, promising the naleen that his reward is coming, commanding him to ravage you.");

	output("\n\nAs if he needed further invitation. He slams himself into you, all in one thrust, slapping your back with his snake-half as he sets about quickly pumping in and out of you. His pre, having pooled inside you, leaks from the seal of your ass like a perverted stream of pleasure. You don’t go easy on him either; you hold his face flush with your crotch, having fed him the entirety of your length. He struggles against his bonds, his throat giving you an impromptu massage as he licks and swallows. It’s all too much to bear, and without warning, you cry your pleasure to the heavens.");

	output("\n\nYou surrender yourself to the sensation as [pc.cum] floods from your shaft into his waiting belly");
	if(pc.cumQ() >= 1500)
	{
		output(", which begins to swell ");
		if(pc.cumQ() >= 3000) output("hugely ");
		output("as you flood him with your seed");
	}
	output(", riding a wave that shows no sign of ending. His cock grinds against your prostate and stretches your ass, keeping the feelings growing stronger even as you empty yourself into him.");

	output("\n\nRewarded with delicious [pc.cum] and having a ");
	if(pc.biggestCockVolume() >= 200) output("huge, ");
	output("throbbing dick shoved all the way inside him, he contentedly slams your [pc.asshole] with his throbbing snakehood. With a purring gurgle, you feel him flooding your backdoor with his alien fuckslime. Spurt after warm spurt of fertile seed inflames you and stokes the fires of your lust. Similarly, his left-over shaft spurts against your lower back, drenching your ");
	if(pc.tailCount > 0) output("[pc.tails]");
	else output("back");
	output(" and your [pc.butt] with his cum, washing you with a lewd layer of sticky release.");

	output("\n\nYou cry out again as your climax winds down, washing through your body with a last wonderful spasm of pleasure and warmth, finally allowing your [pc.cocks] to go limp. You slump atop him, gasping for breath and then, pull your shaft free of his mouth.");

	output("\n\nHe goes absolutely limp, tongue hanging out of his mouth, which seems to have been stuck in a huge ‘O’ shape. His cock is still buried deep inside you, no doubt being held by its bulbous shape.");

	output("\n\nWith a whimper of delight as it tickles your sensitive flesh, you wiggle and squirm atop of him, eventually pulling yourself free, feeling a hot cascade of jism flowing down your [pc.thighs]. Looking at your partner, you note he seems to be unconscious, and you promptly slap his face hard enough to snap him from his stupor. He blinks blearily at you until you present your cum-dripping ass to him, commanding him to clean up his mess.");

	output("\n\nBarely aware of what’s being asked, he extends his tongue, licking your butt clean of his seed. You gasp as his cold nose wedges itself into your ass-crack, licking the slowly trickling stream of white escaping your used hole. You moan at the feeling of his warm tongue, cleaning up your insides.");

	output("\n\nPleasant minutes pass before his tongue rolls away, and you no longer feel seed dripping from your ass. Straightening up, you turn back to him, praising him for the good bitch he is, only to find he’s almost asleep on his... well, tail. You give him a soft pat on his snout, and he actually collapses then and there, snoring faintly as he does so. With a smile, you free him from his vine bondings, gather your gear, and leave.");
	output("\n\n");
	processTime(30+rand(10));
	pc.orgasm();
	pc.loadInAss(enemy);
	CombatManager.genericVictory();
}

//[=CuntTail=]
public function cuntailOnDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("Well, this just seems like a perfect opportunity. Your [pc.cuntTail] writhes eagerly through the air behind you, its obscene tip opening up as you place it over one of his dripping shafts and start to greedily swallow it. You moan as the sensations hit your brain, feeling his long, rounded dick spreading your tail’s pussy wide and plunging deep inside of you, pushing down and down until you have taken it all.");
	output("\n\nHe yowls in pleasure, struggling against his bindings as he eagerly begins humping your tail end. A smirk of pleasure crosses your own lips, closing your eyes as you savor the feeling of fullness in your ever-hungry tail-cunt, squeezing down and slowly pumping up and down. You can feel your pre-cum drooling from your neglected [pc.cockBiggest] and you open your eyes, time to put that mouth to good use.");
	output("\n\nThe moment he opens his maw to moan in pleasure, you strike. With a powerful shove, you feed him half your cock");
	if(pc.biggestCockVolume() >= 200) output(", too horny to care that your girth forces his jaw to dislodge in order to accept you");
	output(".");

	//Kind:
	if(pc.isNice()) output("\n\nYou are surprised when the male cat-snake doesn’t gag. He must have experience with this kind of thing. You briefly wonder if he’s practiced on himself or had other partners to play with.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nYou are mildly surprised when he doesn’t gag. Seems like this kitty got around. Well, if he is so well trained, you see no reason not enjoy yourself to the fullest. You eagerly thrust inside the well trained cock-sleeve that is his throat.");
	//Hard:
	else output("\n\nYou smirk when you’re met with no gag reflex. What a slut! He must be used to taking cocks like a good little bitch. You give him a hard thrust, forcing him to swallow around you. <i>“That’s it, take it like a good little kitty slut.”</i>");

	output("\n\nWith your cock hilted in his mouth, and his cock hilted in your [pc.tailgina], you are finally ready to start pumping for real. You go slowly, at first, adjusting to keeping pace at both ends. The feeling is incredible: your cock in something hot and tight, pulsing flesh wrapped around your shaft and greedily taking in every inch you have to give it, but there’s also something in your tail-cunt too. The symbiote’s nerves feed you every delicious twitch and pulse the naleen’s prick makes inside of itself, letting you know the joy of being wrapped around someone else’s girth and having it hot and wet inside of you. You start to up the pace, slamming into his mouth while your tail does the same on his reptilian cock. The friction on and inside of you builds, pushing you ever onwards in your pleasure.");

	output("\n\nYour partner has been reduced to nothing more than a fuck-toy, mewling and moaning in pleasure whenever you pull back far enough to allow a sound to escape him. His other lizard-prick bounces, slapping enviously against your tail-cunt. Perhaps you should grant it some release too?");

	output("\n\nEven as you continue slapping your cock inside your victim’s throat, you try and concentrate on your tail’s slavering fuckhole. With an act of will, you force it to release his first drooling, bulbous prick. Quick as the snake it once was, it snatches up his other shaft, ravenously sucking him down to the hilt and starting to bob and squeeze just as it did the first one.");

	output("\n\nHis eyes roll to the back of his skull, a muffled scream ripping through his throat for a moment. In his currently overloaded state, his tongue starts darting around your [pc.cockBiggest], unintentionally teasing you in all the right spots. Damn, you’re getting close.");

	output("\n\nSpurred on by that thought, you slam him harder than ever, facefucking him like the living onahole he is in pursuit of your release, tailcunt doing its best to suck his balls out through his shaft behind you. The feel of him around you, inside you, it’s too much. With one last thrust, you arch your back and cry out as your male orgasm washes over you, sending [pc.cum] gushing into the naleen’s mouth.");

	output("\n\nGurgling, he chokes on your [pc.cum] for a moment before adapting and beginning to swallow. Your tail’s work finally pays off, and you feel a distinct warm stream being shot inside it with an equally warm stream being shot outside, splattering over your orgasmically quivering flesh.");

	output("\n\nYou moan in ecstasy as you idly hump his greedy mouth, letting the last of your load slip down his throat and into his ");
	if(pc.cumQ() >= 2500) output("bloated ");
	output("belly. You feel oh-so-deliciously full yourself, your tail-cunt gorged on his seed. Yet... you can fit more, and he has another cock. Drooling mixed fluids, your tail wetly slurps free of the naleen’s lower prick and moves back to the upper one with deceptive laziness, swallowing him up once more. With practiced ease, your tail pushes him over the edge, draining this second cock of all its remaining seed as well, leaving you groaning at the delicious sensation of being so utterly and completely stuffed with predator-spunk.");

	output("\n\nWith blissful laziness, you pull your cock free of the naleen’s mouth and slide off of his midriff, tail curling back around for you to inspect it. The perverse lips at its end are drooling thick gobbets of naleen seed, the scent of sex wafting from it with each twitch. Naughty boy, he got you so very messy....");

	output("\n\n<i>“Since this is your mess, you need to clean it up.”</i>  As you say this, you present your tail’s seed-dripping cunt to him, holding it within easy reach of his tongue where the obscene scents can fill his nostrils, right in front of his face.");

	output("\n\nHe sniffs the air, still dazed after his back-to-back double orgasm. But, surely enough, extends his tongue, taking a tentative lick at your slick cunt. You move it a bit closer to his, letting him taste around your puffy lips and just slightly penetrate your folds. You bite your lower lips as the surge of pleasure forces your tail to plug his mouth in a perverted kiss, extracting a purr of enjoyment as he begins drinking your mixed juices, lapping at your insides.");

	output("\n\nYou groan and purr to yourself, savoring the strange cunnilinguis you are receiving, but enough is eventually enough and you pull your now-cleaner cunt away. Graciously, you roll the panting naleen onto his side and remove his bonds, setting him free before turning and heading back on your way.");
	output("\n\n");
	
	pc.loadInCuntTail(enemy);
	processTime(30+rand(10));
	pc.orgasm();
	
	CombatManager.genericVictory();
}


public function loseToDudeleenRouter():void {
	if(!pc.hasCuntTail()) loseToDudeleenSex();
	else reverseFuckNaleenCuntTailGo();
}

//Defeat Sex
//If you don’t have a pussy, he just ass-fucks you. They’ll be largely similar for the most part.
public function loseToDudeleenSex(tailIntro:Boolean = false):void {
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	var x:int = -1;
	var y:int = -1;
	if(pc.hasVagina())
	{
		x = pc.cuntThatFits(enemy.cockVolume(0));
		y = -1;
		if(x < 0) x = rand(pc.totalVaginas());
		if(y < 0 && pc.totalVaginas() > 1)
		{
			y = 0;
			if(y == x) y = 1;
		}
	}
	if(!tailIntro)
	{
		output("Lording over your ");
		if(pc.HP() <= 0) output("beaten");
		else output("lusty");
		output(" form, his mouth opens into a predatory grin.");

		output("\n\n<i>“You invaders are all the same. Take away your walls and your guns, and you are all wimps,”</i>  he mocks you. <i>“But you did put up a decent struggle; it was fun, so this time I’ll spare you,”</i>  he says, coiling his body around himself.");

		output("\n\nYou begin to pick yourself up, shakily climbing to your [pc.feet] in order to leave when you find yourself roughly pushed on your back. You struggle to keep your footing, but are too dazed to avoid falling down.");

		output("\n\n<i>“I didn’t say you could go,”</i>  he says, slithering around you and stopping right before you, heavy coils pinning you down. <i>“Hunting always makes me feel... hot. And since I’m sparing your life, I expect you to at least take responsibility for these,”</i>  he moves his coils to lift your chin, and you find yourself face-to-dick with a pair of reptilian shafts, already leaking pre-cum.");
		output("\n\n");
	}
	output("Fixated on the pricks confronting you, knowing you are completely at his mercy, you give your assent to taking care of them, however he wants you to do so.");

	output("\n\nHe releases you but keeps you surrounded by his coils. <i>“Strip,”</i>  he orders, crossing his arms as he waits for your compliance.");

	output("\n\nNodding your head, you pick yourself up and begin to remove your [pc.gear].");
	if(pc.lust() >= 75 || pc.libido() >= 60) output(" Despite everything, your arousal spikes at what is about to happen to you, and you can’t resist doing your best to put on an impromptu show for the naleen.");
	output(" Licking his lips, he makes a circular motion with his index, ordering you to give him a good look at your naked body.");

	output("\n\nWith a nod of your head, you slowly twirl around, letting him drink in every inch of your now-naked form.");

	output("\n\n<i>“Not bad, I might even consider keeping you around if you do well enough.”</i>  His coils begin closing in around you, and soon enough you feel them wrapping around your midriff. He grips you firmly enough to ensure you have nowhere to go, but not tightly enough to provide any real discomfort. His slithering body proves to be quite stimulating, and you find yourself ");
	if(pc.hasCock() && pc.hasVagina()) output("hardening and moistening in equal measure");
	else if(pc.hasCock()) output("hardening");
	else if(pc.hasVagina()) output("moistening");
	else output("growing excited");
	output(" under his caress.");

	//if Cocks:
	if(pc.hasCock()) 
	{
		output("\n\nHe feels you poke his snake-half with your [pc.cockBiggest], chuckling softly at your eagerness. <i>“That’s the spirit. No reason why you shouldn’t enjoy yourself too,”</i>  he grins.");
		output("\n\nAlmost despite yourself, you feel your [pc.cocks] growing harder in anticipation, stoked further by the sensation of smooth scales sliding over your sensitive prick-flesh.");
	}

	output("\n\nHe continues to wrap you, coiling around just beneath your [pc.butt], and hoisting you up and off the floor. You immediately move your hands to support yourself on his topmost coils while he moves you into a sitting position");
	if(pc.isNaga()) output(" atop your own");
	else if(pc.legCount == 1) output(" with your [pc.leg] positioned out of the way.");
	else output(", [pc.legs] spread.");

	output("\n\nExposed, you can’t help but wriggle slightly to better raise your ass and let him see what there is to play with down there.");

	output("\n\nHe moves closer and under you, to examine what you have to offer.");

	//if one Vagina:
	if(pc.totalVaginas() == 1)
	{
		output("\n\nYou jump within his coils as he licks you, from the bottom of your nethers to the tip of");
		if(pc.hasClit()) output(" [pc.oneClit].");
		else output(" your womanhood.");

		output("\n\nYou bite back a moan as his tongue circles your");
		if(pc.hasClit()) output(" pleasure-button");
		else output(" labia");
		output(", nether-lips starting to grow damp in anticipation, unconsciously wriggling closer to his face in hopes of another lick.");

		output("\n\n<i>“Delicious, and eager too. Prey like you are the best,”</i>  he says, licking his lips.");
	}
	else if(pc.totalVaginas() == 2)
	{
		output("\n\n<i>“Two!?”</i>  he exclaims in surprise. <i>“Quite a catch I made. You have one for each of mine... never seen an invader like that,”</i>  he chuckles. <i>“I wonder... were you planning on seducing one of us? Never mind, you have two and I intend to put them to good use,”</i>  he says, licking his lips.");
		output("\n\nA perverse thrill surges through you at his words, the prospect of getting <b>both</b> of your cunts stuffed at the same time filling you with lustful eagerness despite the circumstances.");
	}
	//else if more Vaginas:
	else if(pc.totalVaginas() > 2)
	{
		output("\n\n<i>“Wow, what a nice selection you have. I don’t even know which to take,”</i>  he says as he examines your setup. <i>“Makes me wonder what kind of partners you must have. Don’t worry, even if I only have two, I’m pretty sure you’ll remember me,”</i>  he says licking his lips.");
		output("\n\nYour multitude of cunts clench in anticipation of this, and you bite back a lewd moan at the promise.");
	}
	//else if Male:
	else if(pc.hasCock())
	{
		output("\n\n<i>“Nothing... that’s too bad,”</i>  he comments. <i>“Guess I’ll have to use this little hole then.”</i> You jump as you feel his nose dig ");
		if(pc.balls > 0) output("behind your [pc.sack]");
		else output("between your [pc.thighs]");
		output(".");

		output("\n\nYou bite your lips as you feel his wet tongue slide out and start to caress your sensitive taint, slowly working its way up your body, towards your [pc.asshole].  As it circles your back passage, you can’t help but moan softly. An amused chuckle is your response, and then you clench up as you feel his tongue worming his way into your ass. Insistently he pokes and prods at you, squirming inside of you as you loosen up under his tongue’s perverse caresses, making you gasp and whimper as you feel it squirming around inside of you, leaving you slick with saliva.");
		output("\n\nHe rises, licking his lips. <i>“I think you’re ready.”</i>");
	}
	else
	{
		output("\n\n<i>“Nothing here too, what a weird invader you are....”</i>");
		output("\n\nYou jump as you feel his nose dig ");
		if(pc.balls > 0) output("behind your [pc.sack]");
		else output("between your [pc.thighs]");
		output(". <i>“Luckily, you still have something back here,”</i>  he chuckles.");
		output("\n\nAnything you might have said is cut off by a whorish moan as his warm, wet tongue suddenly slurps lewdly at your [pc.asshole], tickling your anus with perverse caresses and starting to worm inside. You can’t help but clench down, trapping the deliciously wriggling invader inside of you, but its fluttering strokes tease you open and allow him to squirm it deeper inside of you, lathering you with his makeshift lube.");
		output("\n\nHe rises, licking his lips. <i>“I think you’re ready.”</i>");
	}
	output("\n\nHe adjusts his coils so he can support your back as he adjusts you and aligns himself with your ");
	if(pc.hasVagina()) output("[pc.vaginas]");
	else output("[pc.asshole]");
	output(".");

	//if one Vagina:
	if(pc.totalVaginas() == 1)
	{
		output("\n\nYou groan as you feel his lower cock spearing inside of you, piercing through your folds as it plunges inside of you to the hilt. Its strange, lumpy texture produces the strangest and yet most delightful feelings.");
		if(!pc.hasCock()) output(" His neglected upper cock glides onto your belly, already starting to drizzle pre-cum onto your [pc.skinFurScales].");
		else
		{
			output(" Over the pussy his upper cock goes, ");
			if(pc.balls > 0) output("scraping along your [pc.balls] before ");
			output("sliding its strangely textured shaft over your own [pc.cockBiggest], unabashedly frotting you as it goes.");
		}
		pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	}
	//if two or more Vaginas:
	else if(pc.totalVaginas() > 1)
	{
		output("\n\nYou moan like a whore, unable to help yourself as you feel him penetrate ");
		if(pc.totalVaginas() > 2) output("two");
		else output("both");
		output(" of your [pc.cunts] at the same time, spreading you wide in unison and sliding home with a smoothness that you doubt could be achieved by taking two partners at once. The bulbs lining his shafts seem to almost massage the thin wall between your stuffed pussies, as if trying to frot themselves inside you even as he penetrates you.");
		pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
		pc.cuntChange(y,enemy.cockVolume(0),true,true,false);
	}
	else //If the PC only has their ass.
	{
		output("\n\nWith only the one hole available to him, his topmost shaft slides home, stretching you out as the progressively larger bulges of his shaft push through your [pc.asshole] like a cross between a dildo and a string of anal beads, rubbing you in the most delicious of ways. His second cock has to settle for gliding through your [pc.butt]");
		if(pc.tailCount > 0) output(" and eventually rubbing against the base of your [pc.tails]");
		output(", taking what pleasure it can from the friction there.");
		pc.buttChange(enemy.cockVolume(0),true,true,false);
	}
	trace("NALEEN COCK RATING: " + enemy.cockVolume(0));
	trace("PC ButtCapacity: " + pc.analCapacity());
	trace("PC CoochCapacity: " + pc.vaginalCapacity(0));

	output("\n\nThe naleen doesn’t spare you much time to adjust, eager to get off himself, he begins thrusting at a rather brisk pace.");

	output("\n\nYou moan as you feel your hole");
	if(y >= 0) output("s");
	output(" stretched by his alien length");
	if(y >= 0) output("s");
	output(", the bulges aligned in such a way to caress your walls and tease you, stretching and releasing as ");
	if(y >= 0) output("they go");
	else output("it goes");
	output(" go further in and then pull out");
	if(pc.hasCock()) output(", grinding against [pc.oneCock]");
	output(", making you instinctively start to hump back against him.");

	output("\n\nHe grunts and groans as his thrusts become increasingly erratic and desperate, a soft growl building in his throat as he nears his peak.");

	output("\n\nYou shudder and groan, writhing around his impaling prick");
	if(y >= 0) output("s");
	output(" as you do your best to keep up with his increasingly erratic thrusts. You find yourself pushing against him harder, anxious to take pleasure from this as well.");

	//if Vagina:
	if(pc.totalVaginas() == 1)
	{
		output("\n\nYou let out a mewl of disappointment as he suddenly pulls himself completely free of your cunt, your netherlips clenching down on a cock that is no longer there. You were so close....");
		output("\n\nHe pants, growling softly as he adjusts himself, positioning his lower shaft on the entrance of your [pc.asshole] and his topmost on the entrance to your [pc.vagina].");
		output("\n\nA thrill of desire surges through you as you realize what he intends. You don’t really have time to say or do anything else, as he begins penetrating you once more. The first few inches of his [pc.girlCumNoun]-drenched shaft penetrate your ass while his throbbing topmost tool enters your pussy. As soon as the first few inches are safely guarded within you, he bucks violently, feeding you his twin bulbous cocks at once.");

		output("\n\nYou cry out in pleasure at the feeling of being stuffed in both holes simultaneously, stretching around his paired phalli and rubbing through your inner walls, massaging you inside with incredible intimacy.");
		pc.buttChange(enemy.cockVolume(0),true,true,false);

		output("\n\nHe pounds your holes with renewed vigor, snarling furiously as, with a final shove, he yowls, and you feel warmth beginning to soak your insides.");
		output("\n\nThe feeling of his seed rolling around inside of you is all the stimulus you need, and you cry out as your own orgasm washes through you, your holes clamping down on the naleen’s shafts and milking him for all he’s worth as you climax together. You grip the twin members impaling you with each shuddering wave of electric pleasure that crashes over you");
		if(pc.hasCock()) output(", painting your [pc.chest] and face with your own [pc.cum] as your male half makes your pleasure known");
		output(". As you are filled with naleen spunk, you blank out, and by the time you come to your senses, you can only feel the emptiness left by his lizard-like cocks.");

		output("\n\n<i>“You look good,”</i>  he chuckles, eyeing the streams of white vacating your used [pc.vagina] and your abused ass, joining together into a perverted cascade.");

		output("\n\nYou simply groan deeply, too caught up in your afterglow to think of anything more coherent. You are dimly aware of his coils slowly lowering you to the forest floor and untwining themselves from about your limb");
		if(pc.legCount > 1) output("s");
		output(". You simply let your eyes sink closed and breathe slowly, getting your strength back.");
		output("\n\nThe moment you open your eyes, you are met with his golden, slitted ones. <i>“It’s such a pity I have to let you go... but do come back. Intruders like you make the best prey,”</i>  he grins");
		if(pc.hasCock()) output(", extending his tongue to lick a stray strand of [pc.cum] off your [pc.face]");
		output(".");
		pc.orgasm();
		pc.loadInCunt(enemy, 0);
	}
	//else if two or more Vaginas:
	else if(pc.totalVaginas() > 1)
	{
		output("\n\nYou cry out as he suddenly vacates your pussies, ");
		if(pc.vaginaTotal() == 2) output("both");
		else output("all");
		output(" sets of nether-lips clenching down and trying to hold onto cocks that are no longer there. You cast a look his way, wondering what is going on; he was close to cumming as well, so why is he....  You don’t time to finish that thought as you are suddenly jerked around in his undulating coils, his visage being slowly replaced by the floor. By the time he stops, you are more than a little dizzy.");
		output("\n\nYou suddenly feel the naleen’s bulbous tips press against your [pc.vaginas] once more. And before you are able to utter a single syllable, he’s pistoning inside you again. Any hopes of speech dashed, you resign yourself to moaning whorishly as he pounds your cunnies into a bubbling mess of mixed fluids that grows wetter and hotter with each passing second.");
		output("\n\nYou writhe and thresh in the naleen’s coils, helpless to do anything otherwise, abandoning yourself to feeling your ");
		if(pc.vaginaTotal() > 2) output("first ");
		output("two pussies getting the sort of pleasure you could never get from two separate partners. You can feel that wonderful wall giving way, your own orgasm impending. When your partner cries out, his doubled shafts pouring thick, warm seed into your greedy fuckholes. The sensation is the last little push you need to arch your back in blissed doubled climax, crying out");
		if(pc.cockTotal() > 1) output(" as [pc.eachCock] sprays in wild surrender");
		output(".");

		output("\n\nAs you come down from your mind-shattering orgasm, you have the distinct feeling of being hefted towards the ground. His shafts pull out of you with twin pops, giving way to a pair of streams composed of your mixed juices. You close your eyes, resting for a moment before you are awakened to meet the naleen’s golden-eyed gaze.");
		output("\n\n<i>“You’re not so bad, for an intruder. It’s truly a pity I can’t just keep you... but hunting you is very fun. Not many intruders out there that make prey as fine you are,”</i>  he chuckles, slithering away.");
		//loss message
		pc.orgasm();
		pc.loadInCunt(enemy, x);
		pc.loadInCunt(enemy, y);
	}
	else //PC’s ass
	{
		output("\n\nYou moan in desire as you feel him withdraw, leaving you panting in frustration as the sudden, horrible emptiness fills you. Before you can think to complain, plead, do anything, you feel his powerful coils rippling and twitching, shifting you around in his grasp until you are facing away from him, [pc.butt] up in the air and back exposed.");
		output("\n\nThe Naleen slaps your [pc.butt], leaving a reddened stamp, as he forcefully grabs your hips and prepares for reinsertion. This time, however, he aligns his lower shaft, and before you know it he’s already shoved several inches inside you.");
		output("\n\nYou groan, deep and low as you are filled again, clenching down on this new shaft as it spears inside of you, welcoming the feeling of being stretched out once more.");
		output("\n\nHe fucks you with uncontained lust, his top bulbous shaft slapping against your butt-cheeks, leaving off-white marks of his pre as he approaches the edge. With a yowl and a final lunge, he comes. Jet after jet of white, fertile naleen spunk being fed into your bowels. An equally enthusiastic stream showers over your back, partially protected by his coils, but most of it slides along the circumference of his snake half to pool at your back");
		if(pc.canFly()) output(" and wings");
		output(".");
		output("\n\nYou arch your back, feeling his sticky seed sliding over your [pc.skin], the perverse sensation and the feeling of his warmth flooding inside of you all that you need to push you over the edge and achieve your own orgasm. Your ass squeezes and clenches for all it’s worth, milking him dry and sucking his load deep inside of you, pleasure crackling through your nerves");
		if(pc.hasCock()) output(", [pc.eachCock] spraying its own [pc.cum] across his coils");
		output(". You gasp and moan and shudder, finally sprawling limply in his coils, a dripping, blissed-out mess.");
		output("\n\nPanting, he taps your ass gently as he lowers you to the jungle ground. Once he’s safely deposited you, he uncoils, freeing you. <i>“That wasn’t half bad. Pity I can’t keep you.”</i>");
		pc.orgasm();
		pc.loadInAss(enemy);
	}

	//if PC cock:
	if(pc.hasCock())
	{
		output("\n\nHe takes a deep breath and his eyes suddenly catch a glimpse of your spent member");
		if(pc.cockTotal() > 1) output("s");
		output(", still half-erect, and not able to contain himself he decides to have a little taste. He swipes his finger over your [pc.cockHeadBiggest] and licks the small gob off. <i>“Hmm, tasty.”</i>");

		//if high Libido / min Lust:
		if(pc.libido() >= 60 || pc.lust() >= 50) {
			output("\n\nYou find yourself growing hard again at the display. Your [pc.cocks] stiffening in response as you groan.");
			output("\n\nYour snake-cat captor watches you, half in amusement and half in disbelief. <i>“Well, if you aren’t a very special invader....”</i>");
			output("\n\nHis interest rekindled, he slithers your way, grabbing your rock-hard [pc.cockNounSimple]. You gasp in pleasure as he begins to slowly stroke you, drawing a pleasured moan from your lips as your sensitive member is stimulated.");
			output("\n\nIt doesn’t take long for you to fire a couple weak bursts all over his hand. He withdraws and watch your [pc.cocks] shrinking. <i>“That’s better,”</i> he says, licking his hand clean.");
		}
		output("\n\nHe slithers away, looking back at you with a predatory grin. <i>“See you next hunt, invader.”</i>");
		pc.orgasm();
	}
	//Loss message
	output("\n\n");
	processTime(30+rand(10));
	CombatManager.genericLoss();
}

//Reverse Rape
//Can only happen if the PC has a cunt-tail. Two or more gives you an alt version.
public function reverseFuckNaleenCuntTailGo():void {
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("Lording over your ");
	if(pc.HP() <= 0) output("beaten");
	else output("lusty");
	output(" form, his muzzle opens into a predatory grin.");

	output("\n\n<i>“You invaders are all the same. Take away your walls and you are all wimps,”</i>  he mocks you. <i>“But you did put up a decent struggle, it was fun, so this time I’ll spare you,”</i>  he says, coiling his body around himself.");
	output("\n\nYou begin to pick yourself up, shakily climbing to your feet in order to leave when you find yourself roughly pushed on your back. You struggle to keep your footing but are too dazed to avoid falling down.");
	output("\n\n<i>“I didn’t say you could go,”</i>  he says, slithering around you and stopping right before you, heavy coils pinning you down. <i>“Hunting always makes me feel... hot. And since I’m sparing your life, I expect you to at least take responsibility for these,”</i>  he moves his coils to lift your chin, and you find yourself face-to-dick with a pair of reptilian shafts, already leaking pre-cum.");

	//if one Cunt-tail:
	output("\n\nAs you stare at the dripping dicks, a pang of sudden, intense need fills your mind. You <b>have</b> to have that cum! You realize dimly that it’s coming from the symbiont");
	if(pc.tailCount > 1) output("s");
	output(" grafted to your spine, which ");
	if(pc.tailCount == 1) output("is");
	else output("are");
	output(" practically drooling at the thought of sucking your assailant dry.");
	output("\n\nDo you hold the cunt-tail");
	if(pc.tailCount > 1) output("s");
	output(" back, and let the naleen have his way with you? Or will you feed the cunt-tail");
	if(pc.tailCount > 1) output("s’");
	else output("’s");
	output(" hunger?");
	if(flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7) {
		output(" <b>While pondering the choice, the hunger grows to an overwhelming degree. You cannot resist. You HAVE to feed your tail");
		if(pc.tailCount > 1) output("s");
		output(".</b>")
		clearMenu();
		addButton(0,"Feed",feedYourCuntTailWithDudeleen);
		addDisabledButton(1,"Resist");
	}
	else 
	{
		//[Feed] [Resist]
		//If the cunt-tails haven’t been fed in a while, PC picks GiveIn without a choice.
		clearMenu();
		addButton(0,"Feed",feedYourCuntTailWithDudeleen);
		addButton(1,"Resist",resistLossRape);
	}
}

public function resistLossRape():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	output("You decide to resist your urges for the moment and see what the naleen has in store for you.");
	//(Everything else play as a normal defeat rape.)
	loseToDudeleenSex(true);
}

//[=Feed=]
public function feedYourCuntTailWithDudeleen():void {
	clearOutput();
	author("Lukadoc & QB");
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	if(pc.tailCount == 1)
	{
		output("Your tail writhes and squirms, thrashing free of the naleen’s larger, clumsier coils. Like a biological whip it cracks out, pussy-orifice opening like a toothless maw and impaling itself on his topmost cock, greedily swallowing it almost to the hilt and making you cry out as the sensation of rough and hard penetration feeds back to you.");
		output("\n\n<i>“What the...!”</i>  a sheer cry of pleasure rips through the naleen’s throat as your tail-cunt forms a vacuum-like seal around his cock. It pulls and tugs at his member, mixing pain with pleasure, and whether intentionally or not, you do feel his coils slackening around you.");
		output("\n\nA surge of energy fills your limbs, lust and power washing over your senses, filling you with fresh power and vitality. With his coils slackened, you wrestle yourself free of his grasp, pushing him to the ground and straddling his waist below his members, pinning him in place. Your tail’s ravenous pussy squeezes and clenches, roughly milking him of his rich, glorious seed.");
		output("\n\n<i>“G-Get off!”</i>  he protests, shortly before you will your tail to give him a hard suck. His protests silenced for the moment, you’re left to hear his weak mewls of pleasure as you overpower him easily.");
		output("\n\nIgnoring him, your eyes fall upon his second member. It just doesn’t sit right with you that you have two thick, juicy, cum-filled cocks to drain and only one tail to drain them with. As you ponder the matter, your tail falls still, ceasing its pumping whilst you contemplate. The naleen under you starts to wriggle at that, but you clench your tail’s cunny with eye-watering force, making him painfully aware that he cannot topple you that easily.");
		output("\n\nMaking your decision, you raise your tail up and off his first shaft, aligning it with the tip of his second one. Before you can penetrate yourself with it, though, you muse to yourself about why you should leave one out of the fun? Your hand closes around the base of his upper shaft and you press his two cocks together, so they are as close as they can be. You give him a moment to contemplate what you’re doing, and then your tail dives down, stretching obscenely over each tip, devouring the two cocks, your hot cunt gulping down inch after inch of bulging shaft until you have forced yourself upon him to the hilt, your eyes rolling back in your head at the sensations of being crammed so full, stretched so wide!");
		output("\n\nUnder you, you receive no protests as a pair of black furred hands set upon your [pc.hips]. His grip is not tight, in fact it’s almost like he was holding you for support. Looking down, all you can see is his desperate gaze; lust, fear and need all congealed into a single gaze. You can barely feel his hips moving, whatever fight he had in him, you seem to have drained when you set your tail loose upon his shafts. He’s probably as harmless as a little kitty right now.");
		output("\n\nYou grin down at him and reach out a hand to gently pat his cheek, telling him that if he’s a good boy, you’ll give him a special treat. You start to pump his shafts with your tail for emphasis, biting back a moan as your over-stretched orifice glides wetly over his flesh, rippling around them in an instinctive attempt to milk him of all that delicious seed.");
		output("\n\nNerves aflame with pleasure, your tail’s rapacious cunt veritably devours the shafts, the sensation of being stretched over two cocks at the same time absolutely incredible. You continue to pump and suckle, moaning like a whore as your senses give way under the tide of feedback, until your back arches and you cry out in ecstasy as your body shudders before the orgasm rippling up your perverse tail.");
		if(pc.hasCock()) output(" [pc.EachCock] explodes, spattering [pc.cum] across the naleen’s torso as it goes off in sympathy.");
		if(pc.hasVagina()) 
		{
			output(" Your [pc.vaginas] clench");
			if(pc.totalVaginas() == 1) output("es");
			output(" in sympathetic climax, drooling your [pc.girlCum] over the coils upon which you sit.");
		}

		output("\n\nWhen you finally come down from your orgasmic high, you look down to see the naleen, out cold, with his tongue hanging out. You feel your prehensile tail-cunt give those twin reptilian poles a couple finishing sucks before its vice-like grasp loosens itself, allowing you to pull away.");
		output("\n\nAs your tail’s opening lets go with a loud, wet, obscene slurping, the naleen’s two shafts are revealed. They’re bright red now, practically glowing with heat; you’ve fucked him raw with your tail. Not that he doesn’t deserve it, after all. Calmly you gather your things, put on your gear, and continue on your way, leaving the unconscious naleen in your wake. Maybe he’ll be a little more cautious in the future....");
	}
	//if two Cunt-tails:
	else
	{
		output("Your tails writhe and squirm, threshing free of the naleen’s larger, clumsier coils. Like a pair of biological whips they crack out, pussy-orifices opening like toothless maws and impaling themselves on his twin cocks, greedily swallowing each almost to the hilt and making you cry out as the doubled-over sensation of rough and hard penetration feeds back to you.");
		output("\n\nThe naleen yelps in shock, dropping you roughly onto the jungle floor. He poises his claws to strike at your tails, but a painful squeeze is all that’s needed to stop him in his tracks.");
		output("\n\nTail-cunts clenched to keep him from trying anything, you pick yourself up off the ground and advance, unable to resist a triumphant sneer; the tables have turned. Forcibly you push him down onto his back, straddling his waist so that you can pin his wrists down. Now that he’s secured, your tails can really get to work, alternatively rising up and then sliding down, stroking each shaft in turn, greedy flesh milking his cocks.");
		output("\n\nAll fight leaves him as your milking tails reduce him to a pile of mewls and moans. He surrenders to the pleasure and can only gaze at you through half-lidded eyes as you drain him of his precious seed. He doesn’t buck and doesn’t fight your advances; he’s completely at your mercy.");
		output("\n\nYou pat him on his head, softly stroking his ears, praising him for his surrender. The only answer you get though, is a moan. Your prehensile pussies continue to suck on his bulbous shafts, their strange shape forming an excellent makeshift plug for your tail-cunts, preventing any unwanted spills. You close your eyes and just enjoy the ride for a few moments.");
		output("\n\nIt doesn’t last long, though. A grunting yowl, shakes you from your trance as you feel his shafts throbbing, followed shortly by the warmth of his seed entering your vaginas. That was quick!");
		output("\n\nYou tails continue to slurp away, pumping at his spent shafts and keeping them from going totally limp, milking up every last drop of seed they have to offer. Even when no more emerges, you continue sucking away with your obscene tails, even as you ");
		if(pc.isAss()) output("praise him for his cooperation, congratulating him on being so clever as to make the best of this.");
		else output("tease him about blowing his load so early. Were your cunts just that good?");
		output(" Stretching your back, you shift forward slightly and lay down on his belly, pinning his top under your own, his head placed squarely ");
		if(pc.biggestTitSize() < 1) output("against your chest");
		else output("between your [pc.chest]");
		output(", your tails still milking him in hopes of coaxing another load from him.");

		output("\n\nYou feel a warm wetness on your [pc.nipple], and when you look down, you see he’s decided to lap at your [pc.chest].  You consider stopping him. You were just relaxing and not inviting him to partake of your bared flesh, but he seems earnest in his desire to please; plus it just feels too good. So for now, you let him do as he pleases, settling down once more atop him.");

		output("\n\nAs the naleen’s tongue plays across your [pc.nipples] and his shafts start to harden within your still-milking tails, a warm feeling washes over you. You feel strangely sleepy and content, and you can’t fight back a yawn that slips up your throat. Feeling comfortable with such a soft, fuzzy cushion under you, you decide there isn’t any harm in it. Laying your head down, you allow your eyes to fall closed as you drift off to sleep.");
		output("\n\n<b>Later....</b>");

		output("\n\nWith a contented yawn, you lift yourself from your impromptu bed and stretch yourself; you feel so rested now. You realize that the naleen is stretched underneath you, completely still, though a closer look confirms he’s fine, just passed out. Your need for seed feels sated, the hunger of your inhuman tails no longer clawing at the back of your mind, and you look back towards his loins as you gently slip them free of the naleen’s cocks. As they slide back inside his groinal slit, you notice that there isn’t a single drop of seed smeared against them or your own tail-cunts; they’ve absorbed every last drop. Looks like your tails milked him totally dry; you idly wonder how many orgasms he must have had before unconsciousness claimed him.");
		output("\n\nSatisfied with how things turned out, you remove yourself from the comatose naleen’s form, gather up and reapply your [pc.gear], and continue on your way.");
	}
	
	// 2dix = 2loads rite
	pc.loadInCuntTail(enemy);
	pc.loadInCuntTail(enemy);
	
	pc.orgasm();
	
	output("\n\n");
	processTime(30+rand(10));
	CombatManager.genericLoss();
}


//Male naleen blowjob victory-scene:
//Author: hawke56
public function maleNaleenSucksPCOff():void
{
	clearOutput();
	showBust("NALEEN_MALE");
	showName("NALEEN\nMALE");
	author("Hawke56");
	output("Your [pc.eyes] focus on the twin shafts of the defeated naleen, and you can feel the lust rise in your own loins.");
	//if cock:
	if(pc.hasCock())
	{
		output(" Your [pc.cocks] harden");
		if(pc.cockTotal() == 1) output("s");
		output(" noticeably");
		if(pc.hasVagina()) output(", and y");
	}
	else if(pc.hasVagina()) output(" Y");
	if(pc.hasVagina())
	{
		output("our [pc.vaginas] start");
		if(pc.totalVaginas() == 1) output("s");
		output(" to drool feminine juices");
	}
	if(pc.hasCock() || pc.hasVagina()) output(".");
	output("\n\nBut more importantly right now, your mouth starts to water at the sight of these magnificent penises. Absentmindedly, you flick your [pc.tongue] over your [pc.lips].");
	if(pc.isBimbo()) output("\n\nThey look so yummy. Your eyes glaze over with whorish lust as you imagine slipping one of the bulbous, reptilian pricks into your warm, wet mouth and sucking on it until it spurts a big load of creamy cum down your throat. A needy whimper escapes you just thinking about it.");
	else output("\n\nThey look very inviting and delicious to you. You wonder what they’d taste like. Well, no time like the present to find out.");
	output("\n\nHaving decided what you want to do with the defeated kitty-naga, you ");
	if(!pc.isNude()) output("strip out of your [pc.gear] and ");
	output("seductively ");
	if(pc.isNaga()) output("slither");
	else output("strut");
	output(" over to him" + pc.mf("",", wiggling your [pc.hips] in an erotic fashion") + ". The naleen male still looks up at you defiantly through his golden eyes, but his hard cocks twitch with excitement and give away his eagerness. Letting your gaze roam over your prey sitting before you, you note that you’ve caught yourself quite a fine specimen here. His features are attractive; masculine, but not overly developed, giving him smooth, clean lines. Atop his head are his cat-like ears, which flick from time to time.");
	if(pc.isBimbo()) output("\n\nYou giggle and give him a suggestive wink. <i>“You are a total cutie. Don’t worry I’ll make you feel so good, just wait.</i>”");
	else if(pc.isBro()) output("\n\nYou leer down at your prey and bluntly say: <i>“Hah, nice try boy. Now let’s fuck.”</i>");
	else if(pc.isNice()) output("\n\nYou give the feline a reassuring smile and say: <i>“Well I don’t appreciate being attacked, but I am willing to have some fun. As long as you behave from now, I’m sure I can make you feel good as well.”</i>");
	else if(pc.isMischievous()) output("\n\nYou give the feline a big grin and tell him: <i>“Well, tiger, today seems to be your lucky day because I’m actually in the mood. Just be a dear and behave then I bet we can get along just fine.”</i>");
	else output("\n\nYou laugh at the defeated feline and shoot him a lusty look: <i>“You didn’t even put up a fight at all, did you? I bet you wanted to lose and be dominated by a " + pc.mfn("real man","beautiful girl","awesome alien") + " you little kitty-bitch. Don’t worry my little plaything, I know just how to deal with submissive fucktoys like you. So just do as I tell you and maybe I’ll give you just what you want.”</i>");
	output("\n\nYour only response from the male naleen is a small");
	if(pc.isAss()) output(", obedient mewl.");
	else output(", acknowledging grunt.");

	if(pc.isTaur()) 
	{
		output("\n\nLowering the tauric half of you body to the ground in front of your soon to be lover you lean your humanoid upper torso forward to cup the naleen’s cheek with one of your hands, forcing him to look into your ");
		if(pc.isBimbo()) output("lust-fogged ");
		output("eyes.");
	}
	else
	{
		output("\n\nYou slowly sink to your knees, getting to the same height as your soon to be lover and cup his cheek in one of your hands, forcing him to look into your ");
		if(pc.isBimbo()) output("lust-fogged ");
		output("eyes.");
	}
	output("\n\nThen you lean forward and press your [pc.lips] against his in an aggressive kiss.The poor kitty is surprised at first, but soon enough, he kisses you back with eagerness. Your bodies press together, your [pc.skinFurScales] rubbing against his black fur sensually.");
	if(pc.biggestTitSize() >= 2) output("\n\nYour [pc.fullChest] presses into the naleen’s toned front, and you can’t help but " + pc.mf("groan","moan") + " into the kiss as your rock hard [pc.nipples] grind against your lover.");
	if(pc.isLactating()) output(" It doesn’t take any more for your sensitive [pc.nipples] to start leaking thin [pc.milkColor] streams of your [pc.milkNoun] that drench both your own mammaries and the fur of the naga-kitty.");

	output("\n\nDeepening the kiss, you slip your tongue into the naleen’s mouth and explore it with raw sexual hunger. Your partner mewls submissively against your [pc.lips]. When you finally break the kiss, a sole strand of saliva still connects both your mouths for a second, before it breaks. You don’t intend to give the cute feline a break though. Instead, you start to assault his neck with kisses while one of your hands finds its way down to his groin. The naleen gasps as you close your fingers around his uppermost erection and give it a playful squeeze. The throbbing, bulbous shafts twitches and small spurt of pre drips over your hand.");
	output("\n\nWith a ");
	if(pc.isBimbo()) output("delighted giggle");
	else output("self-assured smile");
	output(" you decide to finally get to the main event.");

	if(!pc.isAss()) 
	{
		output("\n\nGently, you push your partner onto his back while you move yourself down his body, trailing your entire way with kisses to your lover’s fur");
		if(pc.isLactating()) output(" and occasionally lapping up the wet stains your own [pc.milk] left on him earlier");
		output(". Meanwhile you also start to slowly pump his rigid shaft in your hand, caressing the glands on its underside and gently massaging his entire length with skillful strokes.");
		output("\n\nYou lover groans: <i>“Oh, yes! Are all offworlder" + pc.mf("s so good at this?","-girls so skilled at pleasing a male?") + "”</i> His body shudders with pleasure before you can answer");
		if(pc.isNaga()) output(", and his tail wriggles itself around your own [pc.leg], trying to entwine your two tails. Seeing no harm in letting him continue you let it happen");
		output(".");
		output("\n\nEventually your head reaches it’s destination, right in the crotch of the kitty-naga. The musky smell of his twin reptile-cocks assaults your nose, and ");
		if(pc.isBimbo()) output("you swoon in sheer delight as ");
		output("it makes you lick your [pc.lips] in anticipation.");
	}
	else
	{
		output("\n\nYou give your partner a quick shove which knocks him on his back hard.");
		output("\n\n<i>“Hey, " + pc.mf("man","girl") + "! Can you be a bit more care-”</i> the naleen starts to complain, but is cut short when pinch one of his nipples hard. He let’s out a half-pained half-aroused hiss instead.");
		if(pc.isBimbo()) output("\n\n<i>“Like be quiet, I’m your mitress... missess? Uh...you know... I’m like the one in charge here.”</i>");
		else output("\n\n<i>“Silence, my submissive fucktoy. I want to hear nothing from you but moans for your [pc.master].”</i>");
		output(" You start to slowly pump his rigid shaft in your hand, caressing the glands on its underside and gently massaging his entire length with skillful strokes, enjoying the sight of your toy as it squirms in your grasp afraid to make any noise but low pleasured groans.");
		output("\n\nYou pinch his nipple once more for emphasis then, without further ado, you slide yourself down his body until your head rests close to his twin shafts. The musky smell of his reptile-cocks assaults your nose and ");
		if(pc.isBimbo()) output("you swoon in sheer delight as ");
		output("it makes you lick your [pc.lips] in anticipation.");
	}

	output("\n\nLetting your [pc.tongue] flop out of your mouth, you slowly run it over your lover’s lower shaft, tasting the reptilian cock for the first time. It tastes a little bit salty and slightly alien but not in a bad way. Eagerly, you start to lick the entire length of the reptilian prick, slathering it with your saliva. At the same time you keep jerking the second dick with your hand. The feline naga-man is putty in your capable hands by now and unable to vocalize anything but needy groans. Your tongue moves up to the head of his shaft, where you teasingly lap at his cumslit. Immediately, you are rewarded by a spurt of delicious pre.");
	if(pc.isBimbo()) output("\n\nMmmh. You love the taste of cum. You are almost drooling at this point and the salty taste leaves you craving for more. There is nothing better than sucking on big fat cock until it fills your mouth with a big, nice load of delicious cream. Well except for getting fucked maybe. You unashamedly moan and finally wrap your [pc.lips] around the naleen’s cockhead and start to suckle on his crown.");
	else output("\n\nThe salty taste is delicious and it leaves pleasant tingles on your tongue. Finally you wrap your [pc.lips] around the naleen’s cockhead and start to suckle on his crown.");
	output(" His erection throbs in your mouth, and more precum leaks into your eager maw. Shivering with need you " + pc.mf("let out a needy groan around the cock in your mouth.","moan around the cock in your mouth like a bitch in heat."));

	if(pc.lipRating() >= 6) output("\n\nYour whorish, cocksucker lips seal around the penis tightly, and their smooth, soft  flesh makes the naleen shiver under your ministrations. You decide to really get going and descend on his shaft. Your [pc.lips] slide down the reptilian prick with ease and massage the senitive dickfesh almost as well as a terran pussy. Your sensitive, pornstar-level dickpillows tingle with pleasure as you wrap them around the naleen’s length.");
	else output("\n\nGently you circle the penis with your tongue, before you descend on his shaft. You stretch your jaw wide and slide your [pc.lips] down on the reptilian prick.");
	output("\n\nSoon enough you can feel it poke at the back of your throat. You suppress your gag reflex as best as you can and force the rigid shaft further down. You shudder in delight as it pushes into your tight throat. So does the your lover. The naleen lets out a pleasured cry and another spurt of precum shoots straight into your gullet. By now your [pc.skin] is flushed with arousal and you can barely think straight.");
	if(pc.isBimbo()) output("\n\nSucking a big cock always gets so hot and bothered and it feels just soooo good. It’s way more fun to use your mouth for cocksucking than for talking at any rate.");
	if(pc.legCount == 1) output("\n\nIn your groin");
	else 
	{
		output("\n\nBetween your");
		if(pc.isTaur()) output(" hind");
		output(" [pc.legs]");
	}
	output(", you can feel your");
	//if cock: 
	if(pc.hasCock()) 
	{
		output(" [pc.cocks] throb and ache with unattended desire.");
		if(pc.cumQ() < 250) 
		{
			if(pc.cockTotal() == 1) output(" It spurts little droplets of precum on the ground from time to time.");
			else output(" They spurt little droplets of precum on the ground from time to time.");
		}
		else 
		{
			if(pc.cockTotal() == 1) output(" It practically leaks pre like a faucet.");
			else output(" They practically leak pre like faucets.");
			output(" The ground beneath you is getting drenched in your copious fluids.");
		}
		//if herm: 
		if(pc.hasVagina()) output(" Similarly ");
	}
	//if vagina: 
	if(pc.hasVagina())
	{
		if(pc.hasCock()) output("your");
		output(" [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" completely wet and drips continually");
		if(pc.wetness() >= 3) 
		{
			//if high wetness:
			output(", ");
			if(pc.hasCock() && pc.cumQ() >= 250) output("contributing to the puddles of sexual fluids below");
			else output("already forming a puddle of sexual fluids below");
			output(". ");
			if(pc.totalVaginas() == 1) output("It aches for a nice cock to fill it.");
			else output("They ache for some nice cocks to fill them.");
		}
	}
	//if genderless: 
	if(!pc.hasCock() && !pc.hasVagina()) output("[pc.asshole] contract and spasm in jealousy of your filled mouth but it this time it remains ignored.");
	output("\n\nNow you start to bob  your head up and down on the kitty-naga’s shaft, relentlessly spearing your own throat on it. Every inch of cock that isn’t engulfed in the tight passage of your gullet gets caressed by your hungry tongue. At the same time, you still jerk of the naleen’s second dick with expertise. Soon enough you have built a steady rhythm, and you give your lover the blowjob of his lifetime.");
	//if if lips >= bee stung:
	if(pc.lipRating() >= 6) output(" Well, after all, your [pc.lips] were practically made for sucking cock.");

	output("\n\nHe groans above you and warns, <i>“If you keep this up I’m going to cum soon.”</i>");


	if(!pc.isAss()) 
	{
		output("\n\nContinuing to work his turgid prick with your mouth, you look up at his face and give your lover a reassuring wink, telling him it’s okay for him to climax.");
		if(pc.isBimbo()) output(" You hope he’ll give you a huge, tasty load of yummy cum.");
		output("\n\nEncouraged by that, the naleen surprises you when he suddenly grabs you by your [pc.hair] and thrusts your head down into his crotch, forcing his thick reptilian shaft as far down your throat as it can get. His dick twitches and then erupts into a messy orgasm that shoots cum straight down your throat. You can’t do anything but swallow as your lover fills your stomach with his seed, not that you are complaining. Simultaneously, the second dick spurts thick ropes of semen in the air and quite a lot of it lands in your [pc.hair] and on your face.");
		output("\n\nOnce he is spent and his dicks dribble their last drops into your throat and hair respectively, the naleen sighs happily and lets go of you. You let his dick slide out of your well fucked throat.");
	}
	else
	{
		output("\n\nWell didn’t you ");
		if(pc.isBimbo()) output("like ");
		output("tell him to be quiet. Seems like some punishment is required. You grin deviously around your kitty play toy’s turgid shaft and give his second bulbous length, which you are still jerking, a hard, slightly painful squeeze. The poor guy screams out in pain and pleasure and is brought over the edge. His hips jerk upwards and push his thick reptilian shaft as far down your throat as it can get. His dick twitches and then erupts into a messy orgasm that shoots cum straight down your throat. You can’t do anything but swallow as your lover fills your stomach with his seed, not that you are complaining. Simultaneously, the second dick spurts thick ropes of semen in the air, and quite a lot of it lands in your [pc.hair] and on your face.");
		output("\n\nOnce he is and his dicks dribble their last drops into your throat and hair respectively the naleen sighs happily and you let his dick slide out of your well fucked throat.");
	}
	output("\n\n It leaves your ");
	if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output("maw");
	else output("mouth");
	output(" with a wet pop.");
	output("\n\nYour partner mumbles a quiet: <i>“Thank you offworlder, that was great.”</i> before he slumps down exhausted already snoring.");
	if(pc.isBimbo()) output("\n\nYou giggle at the cute kitty-naga boy and give his lower cock a parting kiss, barely resisting the urge to start sucking on it again.");
	else if(pc.isNice()) output("\n\nYou smile at the spent naleen and  give him a little peck on the cheek.");
	else if(pc.isMischievous()) output("\n\nYou grin at the spent naleen and give him a gentle pat on the shoulder.");
	else output("\n\nNow the little fucktoy has the nerve to speak without your permission again and then doze of right afterwards? He’s lucky that you have more important things to do than giving him the  punishment he would deserve.");
	output("\n\nYou ");
	if(pc.isNaga() && !pc.isAss()) output("gently untangle your tail from your sleeping lover, ");
	output("get up, clean the worst cum from your face, and [pc.hair], grab your [pc.gear] and, with a last look back at the peacefully sleeping naleen male, leave the area.");

	//Probably add +20? 30? lust here since PC doesn’t actually cum.
	pc.lust(20+rand(10));
	pc.loadInMouth(enemy);
	output("\n\n");
	processTime(20+rand(3));
	CombatManager.genericVictory();
}





