import classes.Characters.NaleenHerm;

/*	Futa naleen encounter
	A naleen that was fucked up on throbb
	Can be encountered after having encountered both female and male naleen
	General appearance notes:
	E-cup breasts
	Two 12 inch snake dicks
	Black fur
	Wears a loincloth but nothing to cover her upper body
	Her cocks don't fit into her genital slit so the tips can be seen even from under her loincloth
	Armed with a stone spear
	Has a bunch of vials around her bicep and some vine rope going across her chest

	Will drop her spear, the Naleen spear.
*/

public function showNaleenFuta(nude:Boolean = false):void
{
	showName("NALEEN\nHERM");
	showBust("NALEEN_FUTA" + (nude ? "_NUDE":""));
	author("Doots");
}

//[encounter]
public function encounterFutaNaleen():Boolean
{
	showName("STRANGE\nNOISES");
	//Before fighting:
	if(flags["NALEEN_HERM_MET"] == undefined)
	{
		output("\n\nYou hear distant grunts and gasps off of the beaten path. Knowing the nature of this place they are most likely sexual in nature, but you could investigate them if you’d want to.");
		clearMenu();
		//[Investigate] [pass]
		addButton(0,"Investigate",investigateTheNoiseInZeJungle,undefined,"Investigate","Planet Rushes are all about discovery, right?");
		addButton(1,"Pass",passOnGettingFutaSnekked,undefined,"Pass","Nah, curiosity fucked the kaithrit.");
	}
	else
	{
		showNaleenFuta();
		output("\n\nYou spot her again, the hermaphrodite naleen. Before you can even consider whether you’re going to get away from her or stand your ground and fight she sees you too. She grins in a way that leaves no room for doubt on what she’s thinking. She readies her spear before charging at you, ");
		//pc lost last time:
		if(flags["NALEEN_HERM_FIGHT_OUTCUM"] == -1) output("clearly intent on dominating you again");
		else output("clearly intent on trying to beating you up this time");
		output(". <b>It’s a fight!</b>");
		startNaleenFutaFight();
		IncrementFlag("NALEEN_HERM_MET");
	}
	return true;
}

public function startNaleenFutaFight():void
{
	flags["NALEEN_HERM_FIGHT_OUTCUM"] = 0;
	var tEnemy:Creature = new NaleenHerm();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatNaleenHerm);
	CombatManager.lossScene(loseToNaleenHerm);
	CombatManager.displayLocation("NALEEN HERM");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[Investigate]
public function investigateTheNoiseInZeJungle():void
{
	clearOutput();
	showNaleenFuta(true);
	output("You glance around before stepping into the undergrowth. Moving in the direction of the sultry disturbance is a real pain in the ass without a road or beaten path of any kind. You push a vine out of the way and step into the outskirt of a clearing. The naleen in the middle of the clearing is clearly the source of the lewd disturbance. She’s jerking off two, foot-long dicks, absent minded and lost in bliss. Leaned next to her is a long spear capped by a sharp stone head. As you watch her pleasure her dual pricks, she lets go of the bottom one and grabs a hold of her breast, spraying a bit of pink cream onto her hand. She then licks her hand clean of her sugary bounty, making her engorged reptile-cocks throb harder than before. She shoves her hand under her fuzzy, peach-sized balls, her furry digits slithering into a half-hidden alien pussy.");
	output("\n\nHer moaning starts to get louder as you watch her from the bushes. She’s close, her moaning grows louder and her tits heave rapidly as her arousal crests. With a final loud moan, her gemini cocks fire off thick ropes of cum from her swelling cocktips as she fucks her hand with the all the strength her powerfully muscled serpentine body can provide.");
	output("\n\nYou realize that you’ve been voyeuring on the naleen for a while now. If you want to try to talk to her, perhaps you should wait a few minutes so she doesn’t realize that you’ve been perving on her.");
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Approach",approachTheFutaNaleen,undefined,"Approach","Well, she looks fun!");
	addButton(1,"Slink Away",slinkAwayFromDatKatSnakePuss,undefined,"Slink Away","Somebody that horny is probably going to get strange ideas about the nature of your visit.");
}

//[Approach]
public function approachTheFutaNaleen():void
{
	clearOutput();
	showNaleenFuta();
	flags["NALEEN_HERM_MET"] = 1;
	output("You watch her slip on a loincloth before you approach. You clear your throat, alerting the hemipene-huntress to your presence. She spins on her tail, surprise quickly turning to lust as she realizes who caught her off guard. <i>“An off-worlder? Oh, you’ll be such an exotic treat for me,”</i> she purrs softly, picking up her spear and lunging at you. <b>It’s a fight!</b>");
	processTime(2);
	clearMenu();
	startNaleenFutaFight();
}

//[Slink away]
public function slinkAwayFromDatKatSnakePuss():void
{
	clearOutput();
	showNaleenFuta();
	output("Not wanting to disturb the hermaphrodite huntress you walk back to the path where you came from. You don’t know where that naleen came from, but you doubt this will be the last time you run into her.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Pass]
//Tooltip: Nah, curiosity fucked the kaithrit.
public function passOnGettingFutaSnekked():void
{
	clearOutput();
	output("Whatever or whoever is fucking in the bushes clearly wants some privacy and you’re not going to disturb that privacy. You ignore the sounds and move on.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC gets spanked (not literally)
public function loseToNaleenHerm():void
{
	flags["NALEEN_HERM_FIGHT_OUTCUM"] = -1;
	showNaleenFuta(true);
	output("You stagger, and your [pc.weapon] falls out of your hands as " + (pc.HP() <= 1 ? "pain":"lust") + " overwhelms your mind and body. You can barely stand up. When she pushes you with the butt of the spear, you fall on your ass, and before you can sit up, the hermaphrodite naleen is there. She frees the vine tied around her torso and uses it to restrain your arms. You test the bonds, but you’re too exhausted from the fight to break free.");
	output("\n\nShe licks her lips as she ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("starts pulling your clothes off piece by piece in order to take in your naked form.");
	else output("takes in your naked form.");
	output("\n\n<i>“Now for the fun part, off-worlder!”</i> she hisses while untying her loincloth and baring her now erect snake-cocks dicks to you.");
	//Route to the loss
	if(pc.hasVagina()) 
	{
		if(rand(5) == 0) dickSuckingLossScene();
		if(pc.hasCock() && rand(3) == 0) lossForDickyBoisWithoutCunnywunnies();
		else pussyLoss();
	}
	else if(pc.hasCock()) 
	{
		if(rand(4) == 0) dickSuckingLossScene();
		else lossForDickyBoisWithoutCunnywunnies();
	}
	else dickSuckingLossScene();
}

//[pc loss for pussy owners]
public function pussyLoss():void
{
	showNaleenFuta(true);
	var x:int = rand(pc.totalVaginas());
	output("\n\nYou gulp as the realization that both of those cocks will soon be going inside you sinks in. She prods your [pc.lipsChaste] with her dicks, knowing that you’re just delaying the inevitable, you open your mouth and accept the tapered tips inside your mouth. She thrusts in roughly without caring about your comfort. Not that anything about the current situation is comfortable; you can’t even open wide enough to handle both members.");
	output("\n\nThe hermaprhdotic kitty-snake isn’t interested in oral anyway. She withdraws her cocks from your throat now that they’re slathered in your spit and pushes you so that you’re laying on your back. Grabbing you by your [pc.hips], she lifts your groin into the air. Wanting to make sure that you’re ready for her, she thrusts her tongue into your [pc.pussy " + x + "]. After quickly but thoroughly tongue-fucking she pulls out of your snatch and switches out to tongue at your [pc.asshole].");
	output("\n\nSoon her patience runs out so she withdraws her tongue out of your asshole with a slurp. Before you can relax, her dicks are on the precipice of penetration. <i>“" + (pc.HP() < pc.HPMax() ? "Please wait, I’m not rea-":"Please hurry! I can’t wai-") + "”</i> your words are cut short as she thrusts into you, sinking both of her members inside you.");
	output("\n\nYour [pc.eyes] cross in pleasure and pain as she fills you with both of her dicks. The double-dicked reptile-woman looks down at you smugly as she starts to pound you with all the strength her tail can provide. <i>“How does it feel, off-worlder? How does it feel to be someone else’s toy?”</i> She questions you, but she’s not really giving you a chance to answer as she’s pursing your lips into an ‘o’ shape with her hand. She pulls you into a kiss, thrusting her long tongue into your throat, exploring the insides of your mouth with her long tongue.");
	pc.buttChange(enemy.cockVolume(1));
	pc.cuntChange(x,enemy.cockVolume(0));
	output("\n\nYou gasp for air when she withdraws her tongue from your mouth, then pulls her pricks out of you. You look at her confusedly. She just smirks and flips you face down onto the ground. <i>“This is how you off-worlders should be, face in the dirt and ass in the air for someone else to use.”</i> She drives her point home by slapping your ass and plowing her dicks back inside. Grabbing your [pc.hips] tightly, she digs her claws into your [pc.skinFurScales], thankfully without drawing blood.");
	output("\n\nWith your face on the jungle floor you can’t see what’s going on, so it comes as a surprise as she starts to fuck your behind with enough strength to push you an inch or two along the ground with each thrust. The going is pretty rough, and you barely manage to hang on as she fucks you hard enough that you don’t manage to swallow your spit, turning the ground under your face into mud.");
	output("\n\n<i>“Hang in there, I’m getting close,”</i> she grunts, and you have no doubt that she’s going to fill you with her kitty cream soon, since she’s leaking pre into you in a steady pace, panting and gasping as she drools spit onto your back.");
	output("\n\nHer cocks thicken inside you, and her balls start to expel their precious cargo. The first rope is weak and timid, but the following shots of cum are like cannon blasts. Her balls contain enough spunk to impregnate a harem of girls, but you’re the only one to catch it. With all the cum she’s shooting into you, your stomach starts to slowly inflate with the kitty’s sperm.");
	output("\n\nYou whine softly as she pumps more and more of her cum into your ever-swelling form. But even she doesn’t have an endless supply, and she’s soon finished, pulling her dicks out of you, creating a waterfall of cum behind you. The muddy mess you’re laying in gets even worse.");
	output("\n\nYou hear her untying the vine and slithering away, but you don’t have the energy or the will to do anything about it. Instead, you choose to lay there in the muddy cum to recover some of your energy.");
	processTime(25);
	pc.orgasm();
	pc.loadInCunt(enemy,x);
	pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",getNaleenHermLossFucked2);
}
public function getNaleenHermLossFucked2():void
{
	clearOutput();
	showName("HOURS\nLATER");
	author("Doots");
	output("A couple of hours later you manage to pick yourself up from the mess you’re laying in. Your stuff is not far away from the mud puddle. Picking it up, you notice that your equipment is just as filthy as you are, but thankfully nothing seems to be broken, just muddy. You wipe away most of the grime and return to the path. You’re probably going to run into that naleen again, but you’re not sure if you want to.");
	processTime(190);
	restHeal();
	output("\n\n");
	CombatManager.genericLoss();
}

//[pc loss for cockwielders without pussies]
public function lossForDickyBoisWithoutCunnywunnies():void
{
	showNaleenFuta(true);
	output("\n\nWith a deliberate slowness, she wraps her fingers around your [pc.cocks] and starts to stroke you. <i>“What a gorgeous looking dick you have.... If my cocks weren’t doing all my thinking, I’d ride you all night long, but these beauties disagree.”</i> She giggles while stroking her own dicks. Your [pc.asshole] clenches in worry as she speaks. <i>“Aww, don’t worry, I’ll make your asshole feel amazing, and once we’re done you won’t have any complaints... well, aside of a sore ass,”</i> she says with a wink.");
	output("\n\nWithout waiting, she flips you onto your face so that your ass is high in the air. ");
	if(pc.buttRating() < 6) output("She lets out a disappointed grunt as she gropes your behind. <i>“Geez, I thought you off-worlders had wonderful drugs to make yourself sexy, but you have such a disappointing ass.”</i>");
	else if(pc.buttRating() < 13) output("You hear a satisfied grunt from behind you as she starts to grope your ass. <i>“What a nice ass you have, offworlder.”</i>");
	else output("<i>“I’ve never seen an ass like this, so big, so sexy,”</i> she says as she nuzzles into your [pc.ass].");
	output("\n\nSpreading your asscheecks, she brushes her fingers against the rim of your pucker. You find two of her fuzzy fingers in your face. <i>“You’d better get to sucking unless you want me to go in dry,”</i> she whispers into your [pc.ear]. Not wanting to try taking her dry, you open your mouth and accept her fingers into your mouth. You make sure to coat them thoroughly in your spit. Not giving you much time, she pulls her fingers from your mouth and presses them against your [pc.asshole]. Thanks to the spit coating, she doesn’t have an issue penetrating your asshole, but even then your pucker spasms at the sudden penetration. <i>“Relax cutie, it’s going to be more fun if you do,”</i> she says as she starts to finger your [pc.asshole].");
	output("\n\nYou will yourself to relax your pucker as she strokes your insides with her furred digits. She judges that your asshole is loose enough for penetration, so she pulls her fingers out of your behind and replaces them with her cocks.");
	output("\n\nWith her large cocks pressing against your rim, the earlier fingering feels all too little. Slowly she presses her narrow tips against your ass");
	//if pc ass is can’t take both of her cocks:
	var doublePenned:Boolean = false;
	if(pc.analCapacity() < enemy.cockVolume(0) + enemy.cockVolume(1)) 
	{
		output(", but the tightness of your ass doesn’t allow her cocks inside. Her upper dick slips away from your ass, instead sandwiching itself between your buttcheecks. She grunts in disappointment as she finds your behind too small for her dongs.");
		pc.buttChange(enemy.cockVolume(0));
	}
	else 
	{
		output(". With a slurp, her pricks sink into your behind, making her moan out loud.");
		pc.buttChange(enemy.cockVolume(0)+enemy.cockVolume(1));
		doublePenned = true;
	}
	output(" With her member" + (doublePenned ? "s":"") + " inside you she starts pumping into your ass with a steady pace.");
	output("\n\nYou feel her breasts press into your back as she bends over you and grabs your [pc.cocks]. At least she has the decency to give you a reach around while buggering you from the behind.");

	output("\n\nYou let out a fluttering moan as her prong" + (doublePenned ? "s":"") + " batter" + (doublePenned ? "":"s") + " against your prostate. <i>“Found your sweet spot,”</i> she gleefully whispers into your [pc.ear] while licking it with her serpentine tongue. You can’t deny how good the prostate pounding feels, and since you’re alone with the naleen balls-deep inside your asshole, you decide to let out your slutty moans.");
	output("\n\nShe seems to like your vocalizations, since you can feel her throb inside you when the high pitched gasps leave your lips. Emboldened by your moaning, she presses her entire upper body against your back and wraps her other arm around your body. You gasp as she pinches your [pc.nipple], taking this opportunity to sneak her tongue into your mouth and to yours into submission.");
	output("\n\nYou’re starting to feel the warmth of your orgasm building inside you as she drills away without mercy.\n\n<i>“It’s ok, cutie, just splurt your cream when you want,”</i> she grunts into your ear.\n\nYou bite your lip as you struggle not to cum, at least not yet. Sensing your resistance, she hoists you up, using gravity to her advantage.");
	output("\n\nHolding you this way, she can pound your ass hard enough to make you see stars. With a final breathless moan, your [pc.cock] shoots your [pc.cum] in high arcs before splattering on the ground. <i>“Good [pc.boyGirl].”</i> She strokes your cock while you keep squirting your cum.");
	output("\n\nYour climactic throes are enough to push her over the edge and into an orgasm of her own. The heat of her cum spreads through your insides" + (doublePenned ? "":" and between your bodies") + ". You gasp as she sinks her venomous fangs into your shoulder while emptying her balls into " + (doublePenned ? "":" and on") + " you. Feeling the venom sinking into you and flooding your bloodstream makes you shiver. You can already feel it affecting you, draining the strength from your muscles.");
	output("\n\nWhen her balls finish pumping cum into your [pc.asshole], you’re almost entirely paralyzed. Your dick" + (pc.cockTotal() == 1 ? " is":"s are") + " still hard, and your asshole manages to spasm around her cock, but that’s about it.");
	output("\n\n<i>“Sorry about that,”</i> she says while kissing the two little holes in the side of your neck. <i>“So... wanna go again?”</i> she asks, but she doesn’t wait for an answer, instead starting to pump into your asshole again.");
	processTime(30);
	pc.orgasm();
	pc.loadInAss(enemy);
	if(doublePenned) pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",dickHaversGetButtPegged2);
}

public function dickHaversGetButtPegged2():void
{
	clearOutput();
	showName("HOURS\nLATER");
	author("Doots");
	output("You’re not sure how much time has passed, but you can see that it’s " + (hours > 20 || hours < 6 ? "night":"day") + ". Your naleen assailant is nowhere to be seen. Thankfully no-one has taken her place while you were out cold. Your equipment is not far away - and mostly cum free. The same can’t be said for the insides of your still wide-open pucker, or your thighs.");
	output("\n\nYou wince as you stand up and pick your stuff. Picking up your [pc.weapon] you hobble away before some other lusty alien shows up.\n\n");
	processTime(180);
	for(var x:int = 0; x < 3; x++) 
	{ 
		pc.orgasm();
		pc.loadInAss(enemy);
		pc.loadInAss(enemy);
	}
	restHeal();
	CombatManager.genericLoss();
}

//[Dick sucking loss scene] (small chance to proc, unless player lacks genitalia, in which case it’ll always proc)
public function dickSuckingLossScene():void
{
	showNaleenFuta(true);
	output("\n\n<i>“Hopefully you’re good at sucking dick, offworlder, or you’re going to end up with a sore jaw.”</i> Her tail starts wrapping itself around your body. You shiver as she continues to coil herself around you, wrapping your battered body in her long, muscular tail. Without much effort, she lifts you into the air and angles your face towards her rock-hard cocks.");
	output("\n\nYou purse your lips together, refusing her access to your mouth" + (pc.lust() >= pc.lustMax() ? " in spite of your overwhelming arousal":"") + ". She pokes your face and lips with her members, demanding entry, and when she doesn’t get what she wants, she constricts her tail around you, preventing you from breathing. <i>“You don’t get a choice, cutie, now open up your pretty lips, and I’ll let you breath... unless you want me to facefuck you while you’re unconscious.”</i> Before your lungs start to burn from the lack of oxygen, you open your mouth. She’s merciful enough to let you take a deep breath of fresh air before inserting her lower dick into your [pc.lipsChaste]. <i>“See, isn’t it better when you obey,”</i> she smirks down at you.");
	output("\n\nYou try to zone her out while you suck her dick softly. Her dick actually tastes pretty good. She must eat a lot of fruit for her cum to be so sweet. You find yourself sucking on her tip eagerly, wanting more of her sugary pre. <i>“Good, " + pc.mf("boy","girl") + ",”</i> she praises while you drink down her pre-cum.");
	output("\n\nYou start to hasten the bobbing of your head as you get more and more into sucking on the snake dick. In fact, you don’t even notice that she’s pushing her tip a bit deeper each time. " + (pc.canDeepthroat() ? "You moan around the prick inside your mouth when she suddenly pushes all the way into your pliable, unresisting throat.":"You gag around the prick inside your mouth when she suddenly pushes all the way into your throat.") + " You try to look up at her, but your vision is blocked by the fat snake member on your face.");
	output("\n\nPulling herself free from your mouth until only the tip of her dick remains inside, she holds your head tightly while slowly pushing back into your mouth in one steady thrust. She grunts as her balls touch your chin and then she starts pounding your mouth with enough force to make you see stars. While her bottom prick leaks pre into your throat, the upper one leaks " + (pc.hasHair() ? "into your hair":"onto your scalp") + ".");
	output("\n\nYou do your best to lick on the underside of her lengthy prick while she fucks your face. Wrapping your tongue around her tip when she withdraws back and to lick her balls when she’s hilted in your throat.");
	output("\n\n<i>“Ahh, fuck, you’re so much better than those zil, they might be eager, but they have no technique.”</i> She sighs as she pummels your lips with her groin.");
	output("\n\n<i>“Fuck! I’m so close,”</i> she grunts as she hastens her thrusting. She must be really close! Her cocks are throbbing in your throat and face. Her balls draw upwards as she hilts herself into your gullet, and seconds later, she spills her spunk into your stomach. Your belly gurgles in protest as it gets a sudden injection of sugary cum, but it just keeps coming. The cock resting on your face isn’t resting there idly either, it’s throbbing and spurting more of her spooge " + (pc.hasHair() ? "into your hair":"onto your scalp and down to your back") + ".");
	output("\n\nEventually, the flow of sperm starts to die down, and she slowly pulls her cock out of your throat, leaving a final dollop of cum on your tongue. <i>“Damn, that was great,”</i> she sighs as she rubs her softening cocks against your face.");
	output("\n\nShe takes a hold of her breast and squeezes some pink liquid onto her cupped hand. <i>“So good that I could go for a second round,”</i> she says with a smirk before drinking the lactic bounty in her hand. The effect is immediate as her cocks spring back to life. <i>“Take a deep breath sweetie, you’ll need it.”</i> she chuckles as she positions herself at your lips again.");
	processTime(20);
	pc.lust(4);
	pc.loadInMouth(enemy);
	if(pc.isBimbo()) pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",postNaleenHermCumSuckLoss);
}

public function postNaleenHermCumSuckLoss():void
{
	clearOutput();
	showName("HOURS\nLATER");
	output("You lost count at how many times the huntress busted a nut down your throat, but your lips are puffed up and sore. Your whole mouth is numb! Worst of all, your face is covered in a thick layer of spit, pre, and cum.");
	output("\n\nMore cum floods your overstuffed stomach, but it washes back into your mouth and onto her crotch. She wipes away the spunk covering her cock" + (!(pc.lowerUndergarment is EmptySlot) ? " using your [pc.lowerUnderGarment].":" with her loincloth.") + " A moment later, she slithers off.");
	output("\n\nYou let out a burp and spit out the cum in your mouth, not that it changes much. You pick up your equipment and set out into the jungle once more, still feeling the cum sloshing around in your bloated belly.\n\n");
	processTime(180);
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	restHeal();
	CombatManager.genericLoss();
}

public function defeatNaleenHerm():void
{
	flags["NALEEN_HERM_FIGHT_OUTCUM"] = 1;
	showNaleenFuta();
	output("Too tired from the fight, she tries to attack one final time, but ultimately her spear falls from the hands. Her muscular tail gives out, and she crumbles to the ground. She tries to lift her upper body up with her elbows, but she’s too " + (enemy.HP() <= 1 ? "beaten up":"horny") + " to do so. You approach with your [pc.weapon] prepared, just in case it’s a trick. Then you kick the spear away, leaving her unarmed. To keep those sharp claws in check, you use the vine roped around her body to tie her hands together.");
	output("\n\nShe looks at you sadly. <i>“I just wanted to have some fun with you, off-worlder.”</i> She looks at you lustfully. <i>“Are you going to fuck me? Please, I need it.”</i>");
	output("\n\nShe really doesn’t care who’s the one doing the fucking as long as she gets to fuck, and since you managed to overpower her, you’re calling the shots now.");
	processTime(4);
	clearMenu();
	if(pc.hasVagina()) addButton(0,"Ride Her",vaginaRouter,[rideDatNaleen,enemy.cockVolume(0),0,0],"Ride Her","She has two dicks and you know the perfect place for them. One in [pc.oneVagina] and other in your [pc.asshole].");
	else addDisabledButton(0,"Ride Her","Ride Her","You need a vagina for this.");
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"Fuck Her",cockSelect,[fuckDatHermyHooHa, enemy.vaginalCapacity(0),false,0],"Fuck Her","She may have some big throbbing dicks, but you think the naleen’s going to be the one catching this time.");
	else if(pc.hasCock()) addDisabledButton(1,"Fuck Her","Fuck Her","You need a dick that would fit inside her. Your behemoth simply won’t do.");
	else addDisabledButton(1,"Fuck Her","Fuck Her","You need a dick to fuck her.");
	addButton(2,"Play With Her",messUpThatSnake,undefined,"Play With Her","Play the naleen and set her to sucking her own dicks. Maybe that’ll keep her busy and out of your hair for a while.");
	addButton(14,"Leave",leaveDatSnakeHerm);
}

//[Ride her]
//Requires a pussy
//tooltip: She has two dicks and you know the perfect place for them. One in your [pc.pussy] and other in your [pc.asshole].
public function rideDatNaleen(x:int):void
{
	clearOutput();
	showNaleenFuta(true);
	//var x:int = rand(pc.totalVaginas());
	output("You grab the double-dicked slut’s loincloth and throw it to the side, exposing both of her 12-inch cocks to your hungry eyes. Your [pc.pussy " + x + "] moistens in anticipation as you imagine how those gorgeous cocks will feel when they’re inside you, but it’s not the time for that, not yet. First, you want to make sure that she’s in the mood as well.");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" You slowly strip away your clothing, making sure that she sees every inch of [pc.skinFurScales].");
	else output(" You put up a show for her, stroking your body and spreading your [pc.pussy " + x + "] lips.");

	output("\n\nYou sit down on the cat-snake’s tail and take hold of her cocks. Starting to stroke one of them, you bring the tip of the other into your mouth. While you’re intention is just to suck her until both of the foot-long tools are soaked in your spit, you can’t help enjoying yourself a little as you start to suckle on the tip and swallow her sweet tasting pre-cum.");
	output("\n\nTime flies as you focus on the reptilian hermaphrodite’s two dongs, and before you notice, your chin is parked between two baseball sized nuts. While you don’t mind spending the day suckling on her dick, you have better plans to get to. You withdraw her length from your throat and replace it with her dry cock. All of the cock sucking has your pussy demanding some real attention, so you bring your hand to down to finger your [pc.vagina " + x + "] in sync with the bobbing of your head.");
	output("\n\nYou’re not sure if you’re addicted to sucking cock or if the taste messes with you, but whatever it is, you lose perception of time again. If it wasn’t for a sudden, intense moan from above, you’d never get knocked out of your cock haze. Your hung foe is getting close, and you haven’t even mounted her.");
	output("\n\nBefore you manage to ruin your fun, you let go of the snake-woman’s cocks and straddle her. You align her meaty pillars with your fuckholes then sit down, taking both cocks at once. You moan lustfully as they doubled dongs stuff and stretch your holes. The naleen gasps as your [pc.ass] pats against her balls. <i>“Little off-worlder pussy too much to handle?”</i> You smirk at her as she moans like a whore from a little clenching of your pussy and ass.");
	pc.buttChange(enemy.cockVolume(1));
	pc.cuntChange(x,enemy.cockVolume(0));

	output("\n\n<i>“Sh-shut up!”</i> the scaly slut gasps as you start bouncing on her cocks.\n\nYou smile cockily as you grab a hold of her soft breasts and give them a solid squeeze, making her whine softly. You don’t give her time to get used to your clenching insides, instead starting to buck your [pc.hips] and enjoying her gasps and moans while you ride her for all she’s worth.");
	output("\n\nThe conflicting emotions are clear on her face. One on hand she seems to want to be on top, but on the other hand, your holes must feel great. In the end, the pleasure she’s feeling wins out. She starts to use her tail to bounce you up and down on her cocks.");
	if(pc.isNice()) output("\n\nYou stand up, pulling her dicks out of you.");
	else if(pc.isMischievous()) output("\n\nYou grab her nipples and pull up, getting her attention.");
	else output("\n\nYou slap her face roughly, stopping her bucking.");
	output(" <i>“Did I tell you to do anything? Just lay there like the bitch I’m making you into.”</i> you whisper while riding her. She makes a sound between a growl and a hiss but she stops bucking nonetheless.");

	output("\n\nThe snake cocks inside you are throbbing and leaking even more pre. It doesn’t take a genius to realize that she’s going to cum if you keep this up. Luckily for you, and even more so for her, that’s exactly what you want. <i>“Come on! Cum for me kitty! give me all you have!”</i> you shout as you slam your hips down with thunderous force.");
	output("\n\nYou both shudder as thick, warm jizz starts to fill your [pc.vaginaNoun " + x + "] and ass. You place your hand on your stomach, feeling it slowly enlarge with her baby batter. The sudden cream-filling is enough to almost bring you to orgasm. Even though you don’t manage to cum, your holes still make an effort to milk her of every drop of cum.");

	output("\n\nYou lift yourself off of the cum-kitten’s cocks, letting her seed ooze slowly out of your [pc.vaginaNoun " + x + "] and [pc.asshole]. Then you thrust your cum-filled orifices to her face. <i>“Come on, quick shot, clean me up so we can go to another round.”</i> She offers no resistance and starts licking the outer lips of your pussy before diving deeper into your slit. She’s not at all shy about drinking her own cum. Whirling her tongue around inside your pussy, she coaxes her spunk to drool out of you into her waiting maw.");
	output("\n\nYou get lost in the pleasure of her spearing your [pc.pussy " + x + "] with her tongue, but soon she’d done. Before you can tell her what to do, she spears right into your asshole. You gasp as she starts draining her cum from your ass without a second thought.");
	output("\n\nWith both of your holes drained, you feel an overwhelming emptiness inside your lower body, and you know how to fix that: a double injection of naleen dick. You align her dicks with your slick entrances before sitting down on her pricks. You groan as you’re filled once more. Grabbing your [pc.clits], you start to furiously jill yourself, so close to your own orgasm you don’t care that she starts bucking her hips, ramming her dicks ever deeper into you.");
	output("\n\nYou grab her hands and pull them to your chest, demanding her to put attention to your [pc.breasts]. She obeys your wordless command, " + (pc.biggestTitSize() < 1 ? "pinching your [pc.nipples]":"groping your breast flesh") + ". You moan in pleasure as she continues to fuck your holes roughly.");
	output("\n\nYou scream aloud for the entire jungle to hear as your climax crashes through your body, your pussy and ass clenching around the naleen’s lengths, wanting to be filled with cum again. Whether it’s from her dicks obeying your pussy or her having a hair trigger since she came not too long ago doesn’t really matter: she starts filling your holes with sweet jizz. Your [pc.girlCumColor] girlcum squirts around her topmost member while said member is busy squirting its precious cargo inside you for the second time.");
	output("\n\nYou collapse against her as your body finally stops shaking. That soft fur makes for a great pillow as the naleen jizz fills out each nook and cranny of your insides. But eventually, she runs out of cum to give you, so you stand up. Your holes are gaping and leaking cum, soaking her snake tail in her own sweet semen.");
	if(pc.isNice() || pc.isMischievous()) output(" You decide to untie the vines holding her hands together before you leave her in the ground, soaked in cum and panting.");
	else output(" You don’t bother untying her before you leave. She shouts at you as you walk out of the clearing.");
	processTime(40);
	pc.orgasm();
	pc.loadInCunt(enemy,x);
	pc.loadInAss(enemy);
	output("\n\n");
	CombatManager.genericVictory();
}


//[Fuck her]
//Requires a dick that fits, use the same capacity as for normal naleen.
public function fuckDatHermyHooHa(x:int):void
{
	clearOutput();
	showNaleenFuta(true);

	output("Since the huntress was probably going to fuck you, it’s only fair that you fuck her now that you showed her who’s on top. You " + (!pc.isCrotchExposed() ? "bare":"stroke") + " your [pc.cock]. Seeing your member, she licks her lips subconsciously, hungering for it. You chuckle at her obvious cock-lust as you " + (!pc.isCrotchExposed() ? "start":"continue") + " to stroke yourself. <i>“Does kitty want some cock?”</i> you ask loudly enough to break her out of her haze.");
	output("\n\nHer eyes zero in on your [pc.cockNounComplex]. She hesitates for a split second before leaning in to wrap her luscious lips around it. The taste of your dick seems to motivate her to swallow more of your member, pushing her head forward, stuffing her throat with your cock. You grunt appreciably when her bottom lips bump into your [pc.sheathOrKnot " + x + "]. Stroking her hair and ears as she continues to suck your cock, you make her purr around your dick in a wonderful way. With her eagerly drooling down your dick, you’re free to stop stroking and simply enjoy the blowjob in all its glory.");
	output("\n\nFor a few minutes, that’s your life: quiet enjoyment accompanied by the lewd slurps and the naleens back-and-forth mouth-pumping. You let out a frustrated grunt when she pulls your [pc.cock] out of her throat.\n\n<i>“I do love sucking on this gorgeous piece of meat you’ve brought me, but my pussy wants a bit more than that,”</i> she says with a sexy purr.\n\nYou grin as you realize that the serpentine kitty wants your [pc.cockNounComplex " + x + "] inside her cunt. You’re not one to disappoint.");
	output("\n\n<i>“Lay on your back so I can give it to you,”</i> you say. She’s quick to obey your command, curling her tail against a fallen tree and laying down on her own scaled body. She crooks her finger at you while lifting her fuzzy nuts out of the way, providing her slit as your clear and sensuous target.");
	output("\n\n<i>“Come on, what are you waiting for!”</i>\n\nYou don’t need to be told twice. You grab your [pc.cockHead " + x + "] and steadily push yourself inside her, making her moan softly. She wraps her furry arms around you when you hilt yourself in her warm tunnel.\n\n<i>“Slow and gentle can be nice with a mate, but I want you to fuck me,”</i> she whispers into your ear while her hands trail down your back. <i>“Ravage me you beast!”</i> she growls in your ear while squeezing your [pc.ass].");
	pc.cockChange();
	output("\n\nIf she wants your cock that badly, she’s going to fucking get it. You pull back until your tip is all that remains inside her, and then thrust in with enough force to break a lesser slut in half.\n\n<i>“Yeesshh!”</i> she moans in ecstasy as you start to roughly pound her pussy.");
	output("\n\nShe’s a screamer alright. You pull her into a kiss before she can make you deaf. Shoving your [pc.tongue] into her " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "throat":"mouth") + " seems to shut her up, for now at least, so you continue to pound away at her cunt.");
	output("\n\nYour domineering kiss breaks when the naleen throws her head back and moans loudly. At least it’s considerably quieter than before. You bring her nipple to your mouth and start sucking on it until an overly sweet liquid fills your mouth in a sudden rush. When you swallow the creamy payload, a warmth fills your body. It burns up your insides with lust; you can’t help yourself as you drink down more of her aphrodisiac milk.");
	output("\n\nYour [pc.cock] feels like a red-hot iron bar as your body is filled with overwhelming fuck-lust. You <b>need</b> to cum. Somehow you manage to find the strength to fuck her even harder. You wouldn’t be surprised if the entire jungle can hear your aphrodisiac-fueled breeding session, but you don’t care.");
	output("\n\nWarm, sticky, thick jizz floods against your chest as she starts to cum, her pussy is squeezing madly around your length as she shakes in the throes of her orgasm. You learn that she gets even more animalistic when she cums as she claws long red lines into your back while you continue to pound her through her orgasm.");
	output("\n\nWhen she stops shaking and clawing you, you let her nipple out of your mouth and start roughly groping her breasts, squeezing some of her lactic bounty all over your hands. Grunting appreciatively, you continue to milk her for more of the pink liquid. Your hands are glazed with her chemical concoction. You lick some up before milking some more into your palm. Cupping a decent amount of the fluid, you tilt your hand, spilling it into her mouth. She doesn’t try to resist, instead eagerly drinking down the liquid. Her cocks spring back to life with alarming immediacy and begin to drool pre once again.");
	output("\n\nShe grabs both of her pricks and holds them against each other before swallowing both tips herself. She carelessly shoves her cocks down her throat as you fuck her hard and fast. Deciding to help her, you " + (pc.biggestTitSize() >= 4 ? "wrap her shafts in the soft cleavage of your [pc.breasts]":"wrap your hands around her members") + " and start jerking her off" + (pc.biggestTitSize() >= 4 ? " with your [pc.breasts]":"") + ".");
	output("\n\nHer cocks must be hypersensitive right now since she’s already groaning, and a solid squeeze of her balls is enough to send her over the edge. Cum fills her mouth so quickly that she can’t keep up. She’s pumping more cum out of her bloated urethras than any mouth was meant to handle. Spunk sprays from her nose and the space between her lips and tips. She pulls the pricks out of her throat and gasps for fresh air, inadvertently giving herself a thorough facial in the process.");
	output("\n\nYou groan as you hilt yourself inside her. Your own orgasm spills over the edge, and you start to pump your spunk inside her with wild abandon. ");
	if(pc.cumQ() < 15000)
	{
		output((pc.balls > 1 ? "Your [pc.balls] feel like heated reactors as they work on ":"There’s a pleasant tingling of pleasure and warmth all over your prostate as it does it’s best to chug into ") + "overdrive to produce more cum to pump inside your serpentine partner.");
	}
	else 
	{
		output("Your cock lurches violently before shooting more ropes of cum inside her with enough force that you can see each shot producing a small bulge in her abdomen.");
	}
	if(pc.cumQ() >= 10000) output(" Her stomach starts to bloat with all of the cum you’re pumping inside her, and eventually you need to make room for the expanding tummy.");
	output("\n\nShe tries to mumble something as you pull your [pc.cock] out of her creampied snatch, but it just comes out as a non-coherent slurring of moaning and gasping as cum drools down to her tail. Something’s not right. Your cock is still throbbing and needy, and your need to cum is even bigger than before.");
	output("\n\nShe gasps as you ram your cock back into her again, your previous cum only aiding you in penetration.");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	//[Next] (skip ahead 3 hours)
	clearMenu();
	addButton(0,"Next",snakeCumShotEpilogue);
}

public function snakeCumShotEpilogue():void
{
	clearOutput();
	showNaleenFuta(true);
	output("You’re not sure how long it has been and how many orgasms you’ve had, but you’re both a mess, covered in your [pc.cum] and gasping for breath. Even if you’d wanted to fuck her more, you’re way too sore to even consider it. You try to wipe away most of the semen covering your body, but you’re still covered in the [pc.cumVisc] stuff by the time you give up. You gather your stuff from the ground before limping away and leaving the spunk-filled and covered naleen sleep off her cum-bloated gut.");
	processTime(180);
	restHeal();
	for(var x:int = 0; x < 3 ; x++)
	{
		pc.orgasm();
		enemy.loadInCunt(pc,0);
	}
	output("\n\n");
	CombatManager.genericVictory();
}

//[Mess her up]
//requirements: none
public function messUpThatSnake():void
{
	clearOutput();
	showNaleenFuta(true);
	output("A devious idea crosses your mind as your gaze falls on the two throbbing cocks. Hopefully, her fuzzy balls are capable of producing plenty of cum. You push her onto her back and straddle her tail.");
	output("\n\nSince her tips are leaking pre-cum at a steady pace, you start smearing the clear cock-juice along both lengths, enabling you to slide your fingers along them effortlessly. You run your pre-coated fingers down to the very base of the dual pricks, caressing and squeezing. When your hands touch her scaly tail you start to actually jerk her off, milking enough pre-cum onto your fingers for it to bead and drip.");
	output("\n\nYou push her dicks together, barely managing to keep both of them in your hand, but somehow you manage. With your other hand free, you start bouncing her fuzzy nut-sack in your palm while giving it a repeated, gentle squeezes.");
	output("\n\nYou stop bouncing her balls in your palm and pull her into a kiss. She moans lustfully into your mouth as your tongues swirl and entwine together. Breaking the kiss, you whisper into her ear. <i>“Let’s hope you’re flexible.”</i>");
	output("\n\n<i>“Wha-”</i>\n\nYou interrupt her by pulling her head down and shoving both of her tapered tips into her mouth. She splutters in surprise, but her eyes glaze over quickly as more of her pre leaks onto her tongue.");
	output("\n\nShe quickly starts bobbing her head, fellating herself while you stroke the many inches still exposed to the jungle’s steamy air. Of course, you don’t neglect her balls either. You bend down so that your nose is buried in between her soft nuts. She smells sweet with an underlining hint of sweat from the earlier struggle. The smell makes your mouth water thoroughly enough for you to stick out your [pc.tongue] and give her left nut a long, loving drag, slicking the fur flat. But of course, just licking isn’t enough. Such wonderful nuts deserve, no <b>need</b> more.");
	output("\n\nYou open your mouth wide, taking her balls into your mouth, one at a time. You lift her nuts with your tongue, feeling their weight. You suck her furred sack while she fellates her own dicks. With one ball still inside your mouth, you stuff your fingers into her desperately drooling pussy, making it clench in response to the abrupt finger-bang.");
	output("\n\nThe slurping naleen’s rods throb violently in your hands. She’s going to cum soon. You let her balls out of your mouth and start stroking her faster. Before she can cum down her own throat, you push her head back, popping her cocks out of her mouth. Just in time, her pricks swell and pulse, huge swells appearing at her bases as they race toward her tip. Ropes of jizz land launch four or five feet in the air, then fall in a graceful web - squarely on her face. She manages to close her eyes before any lands in them, instead splattering over her now closed eyelid. More blobs of baby batter follow the first and the second, coating her face with a thick layer of jizz.");
	output("\n\nHer spunk coating oozes down her face, dripping down over onto her breasts. You aim her cocks so that the ropes of cum soak her fluffy tits and, with a final weak splurt, drench her abdomen.");
	output("\n\nYou look over the slut-cat’s cum-covered form and smile to yourself. Your job here is done. She seems checked out enough for you to untie her wrists. When her hands are freed, she grabs her cocks and starts stroking away. You chuckle and leave her to her business.\n\n");
	pc.createStatusEffect("Naleen_Herm_Disabled");
	pc.setStatusMinutes("Naleen_Herm_Disabled",24*60);
	processTime(20);
	pc.lust(5);
	CombatManager.genericVictory();
}

//[Leave]
public function leaveDatSnakeHerm():void
{
	clearOutput();
	showNaleenFuta((enemy.lust() >= enemy.lustMax()));
	output("You put your [pc.weapon] away and walk away. You hear a hiss from behind you, but when you turn to look there’s nothing there anymore. Seems like she took the first opportunity to get away.\n\n");
	CombatManager.genericVictory();
}