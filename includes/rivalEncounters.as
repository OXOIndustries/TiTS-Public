/*Rival Encounter
Notes
Approach
Fight
Insult
Dane Omni-explanation
Wait
Notes
Cousin has coordinates already, but he's so goddamn cocky that he leaves a copy for you, "just so you can stick around to see my inevitable victory."
Cousin has ausar mercenary by the name of Dane.
Dane has albino skin, white hair and fur, red eyes
Four arms - Dane is one of very few with the motor skills to independently use all of them for different tasks.
Dane has a tentacle dick that can extend up to 9' in length, studded with knots about every six inches.
Uses two high caliber pistols and a two electrified blades.
[Win] Cousin leaves dane to stall, picks him up after driving the PC back with a strafe from his gunship
[Lose] Dane violates the PC then hops on the gunship.
*/

//Approach
public function approachRivalOnMhenga():Boolean 
{
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined)
	{
		flags["UNLOCKED_JUNKYARD_PLANET"] = 1;
		userInterface.showBust(chars["RIVAL"].short.toUpperCase());
		userInterface.showName(chars["RIVAL"].short.toUpperCase());
		output("\n\nYour cousin is here! [rival.Ey] was kneeling over the pod, but at the sound of your approach, [rival.ey] rises to [rival.eir] full height, trim form on full display under a simple, white bodysuit. [rival.Eir] hands fall on [rival.eir] hips. <i>\"It looks like the slowest horse finally finished the race. That's about what I'd expect from Uncle Vic's kid.\"</i> [rival.Ey] tosses [rival.eir] head, laughing uproariously. <i>\"Don't worry, cousin, I've copied the coordinates onto this data-chit. We are family, after all.\"</i> [rival.Ey] smiles broadly at you. <i>\"How else would you follow along to witness my glory?\"</i>");
		output("\n\n[rival.short] tosses the chit over [rival.eir] shoulder into a bush. <i>\"Whoops! I slipped. Guess you'll have to scrabble around in the dirt for it, like one of the filthy locals.\"</i> Shrugging, your cousin turns away. <i>\"See ya at the next pod - if your weakass genes will let you stumble there in decent time. I can always leave you a love note if you don't make it.\"</i> [rival.Ey] snickers.");
		output("\n\nIf you wait, [rival.ey]'s going to leave! What do you do?");
		//[Fight] [Insult] [Wait]
		clearMenu();
		addButton(0,"Fight",fightYerRivalOnMhenga);
		addButton(1,"Insult",insultYourRivalOnMhenga);
		addButton(4,"Wait",letRivalGoOnMhenga);
		return true;
	}
	else 
	{
		output("\n\n<b>You've already gotten the data from this pod. It was a set of coordinates to another planet, likely with its own pod.</b>");
		return false;
	}
}

//Fight
public function fightYerRivalOnMhenga():void {
	clearOutput();
	userInterface.showBust(chars["RIVAL"].short.toUpperCase());
	userInterface.showName(chars["RIVAL"].short.toUpperCase());
	output("<i>\"");
	if(pc.isNice()) output("I won't just sit here and take your insults. Why don't we just settle this here and now? Fight me!");
	else if(pc.isMischievous()) output("You expect me to sit here and take your lame insults sitting down? I don't think so, you cheating sack of crap, we're fighting!");
	else 
	{
		output("I'm going to knock that sorry grin off your face, and when I'm done with you, you're going to wish I had left enough of you for one of the ");
		if(flags["ENCOUNTERED_ZIL"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined) output("zil");
		else output("locals");
		output(" to ream!");
	}
	output("\"</i>");
	output("\n\n[rival.short] turns back around, sighing. <i>\"Please. No offense, cousin, but you aren't worth the drain on my plasma pistol's fuel cells.\"</i>");
	output("\n\nYou draw your " + pc.rangedWeapon.longName + ", resolute.");
	output("\n\n<i>\"If you insist.\"</i> [rival.short] snaps [rival.eir] fingers. <i>\"Dane?\"</i>");
	output("\n\nDane? Who the fuck is Dane? Your confusion must be evident.");
	output("\n\n[rival.short] chuckles and steps aside, revealing the form of a hulking brute behind [rival.em], in the shadows.");
	clearMenu();
	addButton(0,"Next",daneOmniExplanation);
}

//Insult
public function insultYourRivalOnMhenga():void {
	clearOutput();
	userInterface.showBust(chars["RIVAL"].short.toUpperCase());
	userInterface.showName(chars["RIVAL"].short.toUpperCase());
	output("<i>\"So first you cheat your way into a shot at stealing my inheritance, and now you have the gall to insult my father? Fuck you, you whiny, worthless little cheater.\"</i> You can't keep the hate out of your voice. <i>\"I'd call you a conceited asshole, but that would make the conceited assholes of the universe look bad. You keep hiding behind your wealth, but you're nothing more than a common thief and a thug.\"</i>");

	//Track if the PC chose this incase of later bro expack
	flags["INSULTED_COUSIN_ON_MHENGA"] = 1;
	output("\n\n[rival.short] whirls on you, eyes wide, almost crazy. <i>\"Why you ungrateful little shit! Dane! Come teach this rat some manners.\"</i>");
	output("\n\nDane? Who the fuck is Dane? Your confusion must be evident.");
	output("\n\n[rival.short] sneers and steps aside, saying, <i>\"Some people call ausar humanity's lapdogs. Dane's more of a guard dog.\"</i> The form of a hulking brute emerges from behind [rival.em], in the shadows.");
	clearMenu();
	addButton(0,"Next",daneOmniExplanation);
}

//Dane Omni-explanation
public function daneOmniExplanation():void {
	flags["MET_DANE"] = 1;
	flags["FOUGHT_DANE_ON_MHENGA"] = 1;
	clearOutput();
	userInterface.showBust("DANE");
	userInterface.showName("\nDANE");
	output("It's huge, standing nearly eight feet tall, and as it steps into the light, your mouth drops. This creature, Dane, has four arms, each corded with thick muscle under his shining, white fur. For armor, he wears a silvery harness over his chest and upper legs, covered in glowing lights. A large, illuminated core sits square in the middle of it, glowing like a miniature sun. The ausar's hair is as white as his fur, and his skin is paler than cream. Eyes like burning coals glare out at you from his sockets. He's an albino.");
	output("\n\nYour cousin passes into the shadows, saying <i>\"I'll send a gunship to pick you up when you finish disciplining my uppity cousin. Don't kill " + pc.mfn("him","her","it") + ", okay?\"</i>");
	output("\n\nDane smiles, his pointed ears twitching. <i>\"Wouldn't think of it, boss. I've got better uses for a piece of meat like this.\"</i>");
	output("\n\nShrugging, [rival.name] resumes [rival.eir] walk away. <i>\"If you say so. Just don't take too long. I'm not waiting to leave just because you've tied yourself deep in " + pc.mfn("his","her","its") + " ass.\"</i> [rival.Ey] vanishes with a bemused laugh.");
	output("\n\nDane focuses his attention entirely on you. His uppermost arms pull a pair of curved blades from harnesses on his back, thumbing activation studs on the hilts. The air suddenly fills with the smell of ozone. They're electrified! Down below, the lower arms grab a set of ancient-looking, chromed pistols from holsters. The ausar flexes. <i>\"A lot of people think an extra set of arms will give them an edge in a fight, and it will. But...\"</i> he pauses for effect, \"<i>Our brains aren't meant to control that many limbs. The ability to independently coordinate four or more arms exists in one thousandth of the population of two-armed races.\"</i> Dane's feet spread into a confident stance. <i>\"You're looking at one of them.\"</i>");
	output("\n\nTwirling his blades while simultaneously cocking his guns, Dane whispers, <i>\"Prepare your anus.\"</i>");
	//Start fight
	clearMenu();
	addButton(0,"Next",startCombat,"Dane");
}

//Wait
public function letRivalGoOnMhenga():void {
	clearOutput();
	flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] = 1;
	output("You let [rival.em] go. There's no sense in wasting time with a fight when [rival.ey]'s already given you what you came for. Once [rival.ey]'s gone, you root around in the brush for a moment, ignoring the scratching branches to find the data-chit. It's a little scuffed and damp dirt is plastered all over it, but it looks okay. You stand and dust it off before connecting it to your codex. The data is all there: coordinates for another planet, presumably one with another probe. All you had to do was not let your pride get the better of you.");
	output("\n\nYou'll just have to get to the next one before your cousin.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dane Fight
public function daneAI():void {
	//Grappled PCs get molested
	if(pc.hasStatusEffect("Grappled"))
	{
		if(pc.statusEffectv3("Grappled") == 0) daneCrotchSmother();
		else daneLickitongue();
	}
	//Headbutt - every fifth round until out of energy
	else if(pc.statusEffectv1("Round") % 5 == 0 && foes[0].energy() >= 25)
	{
		//As the PC attack
		properHeadbutt(foes[0],pc);
	}
	else if(pc.statusEffectv1("Round") % 7 == 0)
	{
		daneGrappleAttack();
	}
	else if(rand(2) == 0 && foes[0].energy() >= 25)
	{
		daneCrossSlashAttack();
		foes[0].energy(-25);
	}
	else daneQuadStrike();
}

//Attacks
//Quad Strike
public function daneQuadStrike():void {
	//Swing twice, shoot twice.
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	processCombat();
}

//Four-Armed Grapple
public function daneGrappleAttack():void {
	output("Charging forward, Dane sheaths his weapons simultaneously. His arms come open, open-palmed and grabbing for you!");
	//Miss
	if(combatMiss(foes[0],pc)) output("\nYou twist out of the way of his four-armed grapple in the nick of time. The four-armed Ausar snickers, pulling his weapons once more. <i>\"Speed alone cannot win a fight.\"</i>");
	//Hit
	else
	{
		output("\nYou try to twist out of the way, but there's just so many hands grabbing for you at once. Your arms are pinned to your [pc.hips] by one pair while the other bear hugs you against his broad, armored chest.");
		output("\n<b>You are grappled!");
		pc.createStatusEffect("Grappled",0,35,0,0,false,"Constrict","You're pinned in a grapple.",true,0);
	}
	processCombat();
}

//Crotch Smother
//Grapple only. Moderate lust damage. Escaping grapple is essential.
public function daneCrotchSmother():void {
	output("Dane takes advantage of the grapple to flip you around, suspending you upside down at crotch level. One of his hands pulls open the bottom of his armor to expose his crotch; you can't tell which, he seems like he's all hands from your current position. A hard, red dog-cock is there, sticking out of a narrow slit. Meanwhile his hands roam over your body, busily fondling and rubbing. It feels and smells better than it has any right to.");
	output("\n\n<i>\"Ready to give in yet? I've got something special to show you.\"</i>");
	pc.lust(5+rand(7));
	if(pc.lust() >= pc.lustMax()) output("\n\nYou nod, moaning in overwhelming lust.\n\nDane drops you. <i>\"Good " + pc.mfn("boy","girl","pet") + ".\"</i>");
	pc.addStatusValue("Grappled",3,1);
	processCombat();
}

//Lickitongue
//Req's grapple, follows smother
public function daneLickitongue():void {
	output("You feel something warm and wet ");
	if(!pc.isNude()) output("worm past your [pc.lowerGarments] to ");
	output("lick your [pc.crotch]. It flutters around expertly, ");
	var choices:Array = new Array();

	if(pc.hasCock()) choices[choices.length] = 0;
	if(pc.hasVagina()) choices[choices.length] = 1;
	if(pc.balls > 0) choices[choices.length] = 2;
	if(choices.length == 0) choices[choices.length] = 3;

	var select:int = choices[rand(choices.length)];
	if(select == 0) output("paying special attention to [pc.oneCock]. It loops about it, tugging and sliding, forcing you to feel incredible pleasure.");
	else if(select == 1) output("diving right into [pc.oneVagina]. Thrusting in and out, it slides and licks across every inner fold, driving you wild with desire.");
	else if(select == 2) output("lovingly polishing your [pc.balls] before sliding over your taint to your [pc.asshole]. There, it busily rims you, sometimes even sliding an inch inside your asshole.");
	else output("diving right into rimming your asshole. The thick intruder feels so wet and lewd that you can't help but offer up hot little pants of encouragement.");
	output(" Dane's tongue feels amazing.");
	pc.lust(20+rand(10));
	if(pc.lust() >= pc.lustMax()) output("\n\nYou start begging him to fuck you, unable to hold back. Withdrawing that wonderful slab of flesh from your crotch, Dane drops you, laughing heartily. <i>\"So be it.\"</i>");
	processCombat();
}

//Cross Slash
public function daneCrossSlashAttack():void {
	output("Dane reaches high with both swords and brings them down crossways simultaneously!");
	//Miss
	if(combatMiss(foes[0],pc)) output("\nYou duck under the swings.");
	//Hit
	else
	{
		output("\nThe blades hit you while crossed in a perfect 'x'!");
		var damage:int = foes[0].meleeWeapon.damage + foes[0].physique()/2;
		//OVER CHAAAAAARGE
		damage *= 3;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		genericDamageApply(damage,foes[0],pc);
	}
	processCombat();
}


public function defeatDane():void
{
	clearOutput();
	userInterface.showBust(chars["RIVAL"].short.toUpperCase());
	userInterface.showName("DANE AND\n" + chars["RIVAL"].short.toUpperCase());
	output("Slumping, the hulking ausar thug looks like he's close to giving in. Before you can finish this, explosions stitch up the ground in front of you, forcing you to dive for cover. The bass hum of thrusters in atmosphere greets you before the gusting backwash does, giving you enough time to put your arm up to block the worst of it. Dane stumbles into the ship, one blade falling from a numb grip to the ground behind him.");
	output("\n\nThe hatch closes, but you're able to see [rival.short]'s pearly teeth behind [rival.eir] smile as it does. You ");
	if(pc.rangedWeapon.shortName == "") output("chuck a few rocks");
	else output("crack off a few, half-hearted shots");
	output(" at the ship, but the armor is too thick. It disappears into the canopy, leaving you alone with your thoughts and the data-chit in the bush. A quick search turns it up, and as you'd expect, it has a set of coordinates on it.");
	output("\n\nThere's still time. You can get to the next probe before your cousin, you're sure of it!\n\n");
	flags["WHUPPED_DANES_ASS_ON_MHENGA"] = 1;
	genericVictory();
}

//Losses
//Omni Loss [Unwritten]
//Buttfuck!
public function loseToDane():void {
	clearOutput();
	userInterface.showName("\nDANE");
	userInterface.showBust("DANE_NUDE");
	//HP
	if(pc.HP() <= 0) 
	{
		output("You slump down, unable to fight anymore. Dane laughs, <i>\"Well, that wasn't too hard. You crumpled like a house of cards.\"</i> He holsters his weapons so that he can scratch his chin with one hand. <i>\"I guess the boss must not be very tough [rival.himHer]self if [rival.he] didn't feel like dealing with you.\"</i> The ausar thug laughs, a rumbling baritone thing that you can feel in your bones. <i>\"There's no point in wasting time then; [rival.he]'ll be back shortly.\"</i>");
	}
	//Lust
	else
	{
		output("You collapse, stuffing both hands in your [pc.lowerGarment] to get at your [pc.crotch] and squirming in the dirt. Dane laughs, <i>\"Well, aren't you the randy little slut. Just a tiny taste of what I can offer and you're already giving yourself up to me.\"</i> He holsters his weapons to scratch at his chin with one hand while he admires your feverish undulations. <i>\"I'm not sure why the boss didn't handle an easy piece of chattel like you " + chars["RIVAL"].mf("him","her") + "self. All it takes a little show of superiority to put you in the dirt and ready to be taken.\"</i> The ausar thug laughs, the sound deep enough to be felt in your bones.");
	}
	//Merge
	output("\n\nStrong hands tear your [pc.gear] from your body a piece at a time. Your codex is tossed over a broad shoulder and into the mud. Dane doesn't seem to care about any of your possessions so long as they don't get in his way. ");
	if(pc.lust() >= pc.lustMax()) output("You don't really mind either, so long as he can take you again and again and again....");
	else output("You give a token protest but lack the ability to properly resist.");
	output(" The pale-skinned mercenary touches the clasps of his armor. It noisily clanks and clacks as the straps disengage, withdrawing into the shining body of the protective garment like snakes into burrows. It falls off him into his waiting hands, which carefully stow the armor into a pack on his back.");

	output("\n\nDane's cock hangs large and half-erect, red and thick, pulsating visibly with the veins that web its surface. He smirks when he sees your eyes upon it and visibly stiffens, lurching to a fuller, harder state of tumescence. <i>\"Now for the fun part.\"</i> All four of his hands grab you at once, lifting you up and turning you to face the ground. Grimly, you think, <i>\"Doggy-style, of course.\"</i> His length presses between your butt-cheeks, just above your [pc.asshole], and the burly thug growls. <i>\"More jobs need these kinds of perks.\"</i>");

	output("\n\nThe multi-limbed warrior's lower arms are firmly holding your [pc.hips] while his upper ones steady your shoulders. Together, they push you down on his pointed phallus, pressing the rigid, dog-like dick hard against your [pc.asshole]. Whether you were prepare for it or not, there's too much force for you to do anything but stretch accommodatingly, accepting his hot, swollen tool into yourself. It's narrow-tipped, broadening shape does much to keep the insertion from being overly painful, but it doesn't stop his already-swelling knot from slamming against you, too big to fit in just yet.");
	output("\n\nDane ");
	if(pc.hasHair()) output("grabs your [pc.hair], yanking your head back");
	else output("grabs the back of your neck, squeezing painfully hard");
	output(", and says, <i>\"Loosen up slut. There's a lot more cock to go.\"</i> He pushes you partway off and pulls back down, matching his words with potent, cock-burying thrusts. This time, ");
	if(pc.analCapacity() * .8 > foes[0].cockVolume(0)) output("your capacitive anus allows him inside, letting the knot pop right on in.");
	else if(pc.analCapacity() * 1.2 > foes[0].cockVolume(0)) output("your anus stretches enough to let him inside, tingling from how taut it has been pulled.");
	else output("your anus stretches painfully open, pulled far beyond its normal capacity to allow him entrance.");
	output(" Swollen, cum-filled nuts slap against you");
	if(pc.balls > 0) output("r own");
	output(".");
	if(pc.hasCock()) output(" Meanwhile, your prostate shoots tingles of bliss into your [pc.cocks], forcing you to drool out thick strands of pre-cum.");
	output(" The alien grunts and slaps your ass. Even taking a hand to do that, he's still holding you vice-tight. It's like his arms all over your body, everywhere at once, forcing you to submit to his anus-ravaging whims.");
	if(pc.hasVagina()) output(" [pc.EachVagina] trickles lubricant at the thought. You manage to reach down to try and plug the leak with your fingers. It doesn't work. You just get wetter.");
	//Buttchange
	pc.buttChange(foes[0].cockVolume(0),true,true,false);
	output("\n\nThis time, Dane growls in satisfaction. <i>\"That's it, slut. Go ahead and take my dick.</i>\" He pops his knot out and back in, sending surprisingly pleasant sensations shivering up your spine. <i>\"Just relax and take it. Get used to it. We're just getting started, and I've got a lot more cock to fill you with.\"</i>");
	output("\n\nWait, what? You try to look back over your shoulder at him to voice your question, but his hand holds you firm.");
	output("\n\n<i>\"Eyes down, bitch. You don't get to look at me,\"</i> Dane commands. As an afterthought, he adds, <i>\"Never fucked somebody as spliced-up as me, have you?\"</i> He doesn't wait for an answer. <i>\"If you thought four arms was the extent of my modifications, you're sorely mistaken. The little bit of cock you've got inside you is just my tip.\"</i> Dane thrusts, pushing his knot up into your large intestine. Incredibly, you feel inches more of his phallus pounding into you behind it, the insertion made easy thanks to the reaming he's given you. <i>\"I got myself a proper tentacle cock with an ausar twist. It can reach out nine feet, and every six inches, there's another knot. I wonder how many I can push out into you?\"</i>");
	output("\n\nYou groan in distress and arousal, shivering as you feel a second knot push up against your ring.");
	output("\n\n<i>\"What's the matter, slut? Don't squeeze down just yet. I've got another foot I can slip inside you, I'm sure.\"</i> Dane's arms pump your body up and down, popping that first knot out and then thrusting two back in. You can feel a third emerging from the slit in his groin, pressing between your cheeks, hot and slick with some kind of lubricating oil. It's making you feel so full, and yet... and yet you're getting a little curious to see how much this chiselled, canine adonis will be able to cram into your [pc.asshole]. He's pounding you full, taking you utterly, and there's nothing you can do but sag in his grip and try to enjoy it. Your body certainly seems to be");
	if(pc.hasCock() || pc.hasVagina()) output(" if the dripping from your crotch is any indication");
	output(".");
	if(pc.hasCock()) output(" [pc.EachCock] is trembling, half-hard and bouncing along with the thrusts, too cowed by the pressure on your prostate to be fully hard but loving the pleasant squeezing too much to be soft.");

	output("\n\nYou moan out loud, unable to contain your pleasure. It erupts out of your lungs with the same fervent power as Dane's savage, ass-rending thrusts. The third knot slips inside you, much more easily than the first two, and you shudder and shake within his firm grip, on the verge of anal orgasm. One of his hands shifts to ");
	if(pc.biggestTitSize() >= 2) output("cup your breast, kneading it gently as he thumbs your [pc.nipple].");
	else output("stroke your chest, thumbing at your [pc.nipple] as he pounds away.");
	output(" The ausar's body feels like an implacable wall behind you, one you're being battered against again and again, every stroke filling you fuller and more completely than the one before.");
	output("\n\nPop! Dane's fourth knot slips in");
	if(pc.hasCock()) output(", sliding over your prostate exquisitely");
	output(", filling you to brimming with dick. Your gut is churning, but it's pleasant too. His thrusts are getting longer and more intense each time, thanks to the many bulges he forces through your [pc.asshole], and you're getting looser and more blissed out as well. Your eyes have started to roll partway back in their sockets. Even your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" quivering in insensate fulfillment. You whimper pleadingly.");
	output("\n\nDane barks in between gasps and growls of his own, turning your head to the side so he can meet your eye. <i>\"What's that bitch? Got a liking for my cock all' a sudden?\"</i> He slaps your ass for emphasis, still fucking you as hard and fast as ever.");
	output("\n\nYour mind says no, but your body and mouth say yes, quite loudly.");
	output("\n\n<i>\"That's what I'm talking about. Tell ya what...\"</i> Dane pounds so fast and hard that you lose track of the bulges sliding in and out of your abused, rectal star, <i>\"whether you manage to beat my boss or not, you can come be my live-in cock-sleeve if you want. I'd be sure to introduce you to the rest of my harem.\"</i> The word harem is punctuated by what feels like dozen of the bloating knobs forcing their way inside. Pleasure overwhelms you, and you start to shake, impaled on the throbbing, red length.");
	//Cunts
	if(pc.hasVagina()) 
	{
		output("\n\nYour [pc.vaginas] drench");
		if(pc.vaginaTotal() == 1) output("es");
		output(" your hand with moisture as you impulsively fill yourself as full as possible, thumb pressed hard on [pc.clit]. Somehow, as wonderful as it feels, it can't compare to the ass-filling ecstasy of Dane's superlative length plowing your through your backdoor. You whimper all the same, overwhelmed from multiple sources.");
	}
	//Cocks
	if(pc.hasCock())
	{
		output("\n\n");
		if(pc.cumQ() <= 6) output("A tiny puddle of [pc.cum] forms below you. There just isn't enough jizz in your [pc.balls] for you to make any more. Maybe take a break when you get a chance.");
		else if(pc.cumQ() <= 75) output("Drizzles of [pc.cum] pour out of your [pc.cocks] and into a puddle on the ground. Just when you think it's over, a new, swelling knot slides past your prostate and milks out a fresh splatter of sexual fluid. It feels better than it has any right to.");
		else if(pc.cumQ() <= 500) output("Thick ropes of [pc.cum] spray out of your [pc.cocks], pooling together into a [pc.cumColor] puddle. Each time you're just about done, a new one is squeezed out by the knots flowing past your prostate, sending ripples across the swelling love-lake.");
		else output("Huge splatters of [pc.cum] erupt from your [pc.cocks] in pulsating explosions, each one fueling the massive puddle that's growing beneath you. They go on seemingly without end, but when Dane's huge knots drag across the sensitive bulb of your prostate, the tidal waves of [pc.cum] feel even bigger and more powerful than ever before. It's all you can do to hold onto your sanity as you're milked from behind.");
	}
	output("\n\nDane loses his composure for once, throwing back his head and howling at your feverish clenching. The knots inside of you swell, preventing him from pulling out. At the same time, the length between the bulbous spheroids thickens, starting closer to his groin and spreading deeper within you. He erupts a moment after the swelling reaches his tip, so deep that all you feel is a gentle, warm pulsation, enough to make you feel full and contented without being overloaded, which is exactly what you need on the heels of your blissful climax.");
	output("\n\nYou sag, limp and panting, before you feel the jetwash crashing over you. Dane struggles to pull out, wrenching knot after knot free in a gut-stretching display of strength. He tosses you to the ground none-too-gently, looking down at his cum-leaking prize. <i>\"Remember my offer. I could use a good knot-sleeve,\"</i> he says. Your eyes drift closed, though not before you see him boarding [rival.name]'s gunship.\n\n");
	processTime(25+rand(10));
	pc.orgasm();
	pc.loadInAss(chars["DANE"]);
	clearMenu();
	addButton(0,"Next",daneFuckEpilogue);
}

//[Next]
public function daneFuckEpilogue():void {
	clearOutput();
	output("You wake all alone, naked, sore, and leaking white cum. You're humiliated and debased, but the coordinates to the next planet in your father's chain are in a data-chit lying next to you. Maybe next time you'll have a better showing.\n\n");
	flags["LOST_TO_DANE_ON_MHENGA"] = 1;
	processTime(75+rand(10));
	genericLoss();
}
