import classes.Characters.ZilFemale;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;

// Flags:
// FOUGHT_FEMZIL_LAST_TIME  : Last time you encountered the FemZil, you fought it rather then fucked it (?)
// TIMES_MET_FEMZIL         : Times PC has encountered the femzil
// ENCOUNTERED_ZIL          : Times PC has encountered the malezil
// HIT_A_ZILGIRL            : TODO - FIXME

//Female zil Encounter
public function femzilEncounter(forceFriendly:Boolean = false):void {
	pc.lust(4);
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	CodexManager.unlockEntry("Zil");
	var hostile:int = rand(4);
	if(forceFriendly) hostile = 0;
	//[First Time]
	if(flags["TIMES_MET_FEMZIL"] == undefined) {
		author("Savin");
		output("\n\nAs you move through the brush, you push aside a thick clump of overgrown branches only to reveal a wide clearing, maybe fifty feet across, with a fallen tree trunk right at its center. Sitting atop it you see a shapely female clad from head to foot in well-polished black chitin, reclining with one leg crossed over the other, only just hiding her bare crotch from sight. A belt rests on her flared hips, holding dozens of small vials and tiny darts, each hilted by exotic looking fetishes and woven braids.");
		//If PC has encounter a zil male before:
		if(flags["ENCOUNTERED_ZIL"] != undefined) output("\n\nYour codex beeps out a warning about the zil, but it doesn’t take an anthropologist to figure out you’ve found one of their females. You start to ready a weapon as the girl turns toward you, but seeing you, she quickly puts up her hands in an disarming gesture of peace. <i>“Hey there, no need for violence!”</i>");
		//Else if PC has not encountered a zil bro before:
		else output("\n\nYour codex beeps out a warning about a race called the zil, advising against approach and especially against inhaling their pheromones. However, contrary to the device’s warnings about extreme hostility, the girl puts her hands up in a gesture of peace. <i>“Hey there, stranger.”</i>");
		// Combine, same paragraph:
		output("\n\nShe smiles. <i>“Don’t worry, I don’t mean you any harm. Just the opposite!”</i> she says, leaning back and spreading her legs, revealing the pale yellow flesh around her vulva. A pair of fingers dips in to massage her hole.");
		output("\n\n<i>“Come on, stranger, help yourself! Or.. maybe you’d like a taste of my home-made honey?”</i> she asks, pushing aside the chitin plate on her chest to reveal a full, pert breast; at the slightest squeeze, a thick dollop of an amber liquid drips from her nipple, sticking to her fingers.");
		output("\n\n<i>“Any way you want it, stranger, that’s the way you need it! Just show me what you’ve got!”</i>");
		output("\n\nBefore you can think, though, a strong, sweet smell wafts past you, nearly overwhelming your senses... damn, she smells <b>good</b>. It takes all your force of will to resist diving into her arms, and even then, your body urges you to take her up on the offer. What do you do?");
		clearMenu();
		//[Fight her]
		addButton(0,"Fight Her",fightDatFriendlyFemzil);
		//[Leave]
		addButton(14,"Leave",tryToLeaveFemzil);
		// Sex Options Here
		if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) addButton(1,"Sex",submitToFriendlyZil);
		else addDisabledButton(1,"Sex","Sex","You need to be in the mood for sex and have genitals to submit to her sexually.");
	}
	//[Repeat] (If PC didn’t fight her last time)
	else if(hostile == 0 && flags["FOUGHT_FEMZIL_LAST_TIME"] == undefined) {
		author("Savin");
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, but relaxes as she recognizes you. <i>“Hey there, stranger. Back for a taste of my honey?”</i>");
		//[Fight her]
		//[Leave]
		//[Get Honey]
		clearMenu();
		//[Fight her]
		addButton(0,"Fight Her",fightDatFriendlyFemzil);
		// Sex Options Here
		if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) addButton(1,"Sex",submitToFriendlyZil);
		else addDisabledButton(1,"Sex","Sex","You need to be in the mood for sex and have genitals to submit to her sexually.");
		addButton(2,"Get Honey",getHoney);
		//[Leave]
		addButton(14,"Leave",tryToLeaveFemzil);
		
	}
	//[Repeat] (If PC fought her last time) && not a hostile zil
	else if(hostile == 0 && flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined){
		author("Savin");
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, grabbing one of the darts from her belt to defend herself. <i>“H-hey there, stranger, no need to get violent. Just back off, okay?”</i>");
		clearMenu();
		//[Fight her]
		addButton(0,"Fight Her",fightDatFriendlyFemzil);
		//[Leave]
		addButton(14,"Leave",tryToLeaveFemzil);
	}
	//HOSTILE ZIL!
	else {
		author("Zeikfried");
		output("\n\nAs you wander the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. Your eyes and nose lead you to a familiar feminine form reclining on a log, legs spread wide to let loose the potent scent. The girl looks up as you approach with a knowing smile. <i>“Hello, lover. I’m in the mood for some excitement, and you’re right on time.”</i> She does not look like she will take no for an answer.");
		output("\n\nHer pussy fairly glistens, lending truth to her words. The atmosphere thickens with pheromones and tension as she stares you down, tracing the outline of her vulva. You feel a strong compulsion to agree to whatever she wants.");
		clearMenu();
		//[Fight Her]
		addButton(0,"Fight Her",fightHostileZil);
		//[Leave - Reflex check]
		addButton(14,"Leave",leaveHostileZil);
		//[Submit - chooses an appropriate loss scene]
		addButton(1,"Submit",submitToFemzil);
		//revised outputs for hostile zil below
	}
	IncrementFlag("TIMES_MET_FEMZIL");
}

//Leave (Must pass an Easy Int check, penalized by high Libido, to break away from zil Pheromones)
public function tryToLeaveFemzil():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("You back away from the sweet-smelling zil, even though your body yearns powerfully for her touch.");
	//if Fought before:
	if(flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined) {
		flags["FOUGHT_FEMZIL_LAST_TIME"] = undefined;
		output(" She seems to relax as you step back, and slips her dart back onto her belt. Maybe she’ll let her guard down next time...");
	}
	else output(" She pouts as you turn away, and calls out, <i>“Well fine, I didn’t want to fuck your brains out anyway!”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function submitToFriendlyZil():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	flags["FOUGHT_FEMZIL_LAST_TIME"] = undefined;
	output("With a goofy grin, you agree to the zil’s proposal. She smiles back and beckons you closer, deeper into the laden air. How will you take the welcoming alien woman?");
	zilConsensualSexMenu();
}
//Fight
public function fightDatFriendlyFemzil():void {
	flags["FOUGHT_FEMZIL_LAST_TIME"] = 1;
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FIGHT:\nFEMALE ZIL");
	output("You shake off the potent draw of the zil girl’s pheromones and level a weapon at her, ready to fight.");
	output("\n\n<i>“Woah! Back up, </i>");
	if(pc.tallness <= 52) output("<i>little </i>");
	else if(pc.tallness >= 72) output("<i>big </i>");
	output("<i> " + pc.mfn("boy","girl","uh... dude") + "!”</i> she cries, jumping back and readying her darts. It’s a fight!");
	clearMenu();
	configFemZilFight(true);
	addButton(0,"Next",CombatManager.beginCombat);
}

public function configFemZilFight(consensual:Boolean = false ):void
{
	var tZil:ZilFemale = new ZilFemale();
	if (consensual) tZil.setDefaultSexualPreferences();
	
	CodexManager.unlockEntry("Zil");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tZil);
	CombatManager.victoryScene(defeatHostileZil);
	CombatManager.lossScene(girlZilLossRouter);
	CombatManager.displayLocation("FEMALE ZIL");
}

//[Fight Her]
public function fightHostileZil():void {
	clearOutput();
	author("Zeikfried");
	showBust("ZILFEMALE");
	showName("FIGHT:\nFEMALE ZIL");
	output("Though your body betrays you by moving a step closer to the wasp woman, you hold onto your wits enough to ready your defenses. Not a moment too soon, either, as the zil’s hand slides from her wet pussy to her belt and flings a pouch right at you. You react quickly enough to swat it aside, but any mask of friendliness the zil had is thrown away as well - she clearly intends to take what she wants!");
	clearMenu();
	configFemZilFight();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[Leave]
public function leaveHostileZil():void {
	clearOutput();
	author("Zeikfried");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("Shaking your head both to free it of pheromones and give the zil your answer, you turn away. Behind you, you hear a slight rustle from the vexed wasp woman, followed by the sound of a cloth flap opening.");
	//new paragraph, split for reflex check -- failure adds lust
	output("\n\n");
	//pass - end encounter
	if(pc.reflexes() + rand(20) + 1 > 20) {
		output("Glancing back, you catch sight of something leaving the woman’s hand, and roll to the side just in time for a dart to embed itself in the trunk of a tree beside you. With a fluid motion, you slip behind another tree and rapidly put distance between yourself and the zil, leaving only an angry buzzing sound behind.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//fail - lust < 100 after lust penalty, start fight with penalty
	else {
		pc.lust(10);
		if(pc.lust() < 99.5) {
			showName("FIGHT:\nFEMALE ZIL");
			output("Glancing back, you catch sight of something leaving the woman’s hand, but can’t move your body fast enough to avoid whatever it is. With a ‘thwip’, a dart pokes through ");
			if(pc.armor.shortName != "") output("a thin section of your [pc.armor]");
			else output("a bit of exposed flesh");
			output(", and your muscles loosen while your groin heats up with increased blood flow. Head suddenly swimming, you can only marshal your thoughts as the zil walks closer, grinning smugly. As she reaches over to caress your body, your body finally responds and you slap her hand away.");
			
			output("\n\nHumming in irritation, she takes a step back as you ready your " + pc.meleeWeapon.longName + ".");
			clearMenu();
			configFemZilFight();
			addButton(0,"Next",CombatManager.beginCombat);
		}
		//fail - lust > 99 after penalty, go to loss
		else {
			output("Glancing back, you catch sight of something leaving the woman’s hand, but can’t move your body fast enough to avoid whatever it is. With a ‘thwip’, a dart pokes through ");
			if(pc.armor.shortName != "") output("a thin section of your [pc.armor]");
			else output("a bit of exposed flesh");
			output(", and your muscles loosen while your groin heats up with increased blood flow.");
			if(pc.hasCock())
			{
				output(" Your [pc.cocks] fairly ");
				if(!pc.isCrotchExposed() && (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")) output("fill your garments");
				else output("cover the ground");
				output("with precum");
			}
			else if(pc.hasVagina())
			{
				output(" Your [pc.vaginas] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" wet enough to soak ");
				if(!pc.isCrotchExposed() && (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")) output("your garments");
				else output("the ground");
			}
			output(", and you can’t do anything but stare at the slowly approaching wasp woman, imagining what perverted things she’ll do to you. As she reaches out and caresses your face, your mouth opens but makes no sound. She hums pleasantly, knowing she’ll get what she’s after.");
			clearMenu();
			configFemZilFight();
			addButton(0,"Next",CombatManager.beginCombat);
		}
	}
}

//Submit - need a transition here (still to do)
//something to bridge the gap between the intro and the loss sex, like a sneak attack with aphrodisiacs
public function submitToFemzil():void {
	//route to loss scenes!
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("You smile and begin to deeply inhale her powerful scent, meeting her eyes as you let the overwhelming need start to overcome you. ");
	setEnemy(new ZilFemale());
	girlZilLossRouter();
}

//Get Honey
public function getHoney():void {
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("You ask the zil girl if she wouldn’t mind giving you a vial of her sweet honey for the road. She gives you a lusty smile and pulls an empty glass container from her belt. <i>“Sure, stranger... but you’ll have to work for it,”</i> she laughs, pushing aside the chitin plating on her chest to reveal the two full swells of her bosom. You shift around behind her, slipping your [pc.legOrLegs] about her waist as your fingers play across her chitin-covered sides and slide across the smooth, hard surface of her natural arm. Her breath catches as you brush across the bare flesh of her bust and the curve of her prominent, honey-filled nipples.");
	
	output("\n\nShe gasps and squirms in your grasp as your hands set to work, cupping and caressing her, working your thumb and forefinger around her teats until the first thick dollop of honey forms. With a smile, the zil girl takes your hand just long enough to suckle your fingers, eagerly sampling her own lactation. Next, her hand releases yours, snaking down her lithe body to tease her other honeypot as your fingers lock around her teats, squeezing out more and thicker drops of honey. The first trickles run down her bare chest, staining her black chitin amber until she moves the empty vial under one of her spigotting tits, catching the flow at the source.");
	output("\n\nThe viscous, clear amber moves slowly, oozing down your fingers and the zil’s body like syrup. It slides into the vial, slowly piling up as its holder shivers and moans, twitching at the pleasure of your contact. Before long your ministrations have her panting and moaning like a whore, chest heaving in her hands as you fill the vial under one tit and then the other, squeezing her honey taps until their owner is like putty in your hands, shivering with sexual pleasure as you milk her and she fingers herself.");
	output("\n\n<i>“H-hey stranger, you’ve got really... really talented fingers, you know? Keep this up and I’ll... I’ll... I’ll...”</i> she trails off into a long <i>“Ooooohhhh,”</i> as you let one of your hands slip down, joining her fingers between her legs as the other massages her breast, topping off your prize. Her honeypot is slick with her sexual juices and offers no resistance as you slip into its warmth, brushing and teasing her own fingers before joining them in their work, exploring her depths. <i>“Gonna... gonna c-c-ahhhh!”</i> she cries, as her vaginal muscles clench down hard, squeezing and milking the fingers inside like miniature cocks. A whole new wave of thick honey squirts from her quivering cunt as the zil girl climaxes around the two hands penetrating her; a moment later and her teats join in the fun with a last mighty burst of honey that sails off into the clearing, overshooting the vial with the force of a fire hose.");
	output("\n\nYou cork the vial and tuck it away as the throughly milked zil collapses in your arms, breathing hard. You run your honey-slick hands through the soft, hair-like spines on her head, teasing her a little as you get ready to go.");
	//If Gendered PC:
	if(pc.hasGenitals())
	{
		output("\n\n<i>“H-hey now,”</i> she manages to say, <i>“I’d feel bad if I got to cum that hard and you didn’t even get a thrill. At least let me ");
		if(pc.hasVagina()) output("give your honeypot some love");
		if(pc.hasVagina() && pc.hasCock()) output(" or ");
		if(pc.hasCock()) output("give your cock a little attention");
		output(" before you go.”</i>");
	}
	
	processTime(10+rand(5));
	eventQueue[eventQueue.length] = getSomeHoney;
	//[Nah]
	//[Sex Options]
	clearMenu();
	zilConsensualSexMenu();
	addButton(14,"Nah",noSexForMeThen);
}

public function getSomeHoney():void {
	clearOutput();
	output("That vial of honey is still here.\n\n");
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new ZilHoney();
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

//Nah
public function noSexForMeThen():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("<i>“Aww. Well, alright then, take care. Thanks for the fun!”</i> she laughs, slipping out of your arms to curl up on the forest floor, asleep before you leave.");
	output("\n\n<i>Talented fingers indeed!</i> you think as you move on.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//SEX OPTIONS
public function zilConsensualSexMenu():void {
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	//For Dickmeisters:
	if(pc.hasCock()) {
		//[SuckleFuck] (Anal ride while you suck honeytits)
		if(pc.cockThatFits(zilFemale.analCapacity()) >= 0) 
			addButton(0,"SuckleFuck",suckleFuckZilFemaleYouSuckleFucker,undefined,"SuckleFuck","Let her anally ride you while you suck her honeytits.");
		else addDisabledButton(0,"SuckleFuck","Suckle Fuck","You need a penis that can fit her anus for this.");
		//[Missionary] FOR THE SOLE PURPOSE OF PROCREATION! YOU SICK BASTARD!
		if(pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25) >= 0) 
			addButton(1,"Missionary",missionaryWithAZilGirl,undefined,"Missionary","Take her vagina in the missionary position.");
		else addDisabledButton(1,"Missionary","Missionary","You need a penis that can fit her vagina for this.");
		//[Footjob]
		addButton(2,"Footjob",footjobFromFemzil);
	}
	else {
		addDisabledButton(0,"SuckleFuck","Suckle Fuck","You need a penis that can fit her anus for this.");
		addDisabledButton(1,"Missionary","Missionary","You need a penis that can fit her vagina for this.");
		addDisabledButton(2,"Footjob","Footjob","You need a penis for this.");
	}
	//For Cuntwielders
	if(pc.hasVagina()) {
		//[SixtyNine]
		addButton(3,"SixtyNine",sixtyNineZil);
		//[Trib&Suck]
		addButton(4,"Trib&Suck",tribAndSuckZil);
	}
	else {
		addDisabledButton(3,"SixtyNine","Sixty-Nine","You need a vagina for this.");
		addDisabledButton(4,"Trib&Suck","Tribadism & Suck","You need a vagina for this.");
	}
	addButton(14,"Back",femzilEncounter,true);
}
//SuckleFuck
// zillette goes for a buttsex ride while PC suckles some honey from her tits.
public function suckleFuckZilFemaleYouSuckleFucker():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	if(!pc.isNude()) output("Pulling your [pc.gear] off");
	else output("Dropping what little gear you carry");
	output(", you plant yourself on the log beside the welcoming zil girl and stroke your wang, beckoning her onto your lap. She gives you a lascivious grin and does as you bid, moving on all fours; she wraps her arms around your neck and her legs around your waist, grinding her cunt along the shaft of your hardening cock. You gasp as the warm, sticky honey of her loins rubs off onto your bare manhood, leaving a slimy trail as she rocks her hips along your length. Instantly, you’re assaulted with the powerful, potent scent of her pheromones, wafting up from her juicy sex. Your skin blushes hotly, tingling at her every touch as the wasp-like girl’s hands run " + (pc.hasHair() ? "through your hair" : "across your head") + ", down across your back, pulling herself close to you. You run your fingers through her soft, hair-like spines, leaning her head back just enough for you to kiss along the nape of her neck. To her delight, your other hand slips down and grabs her chitiny ass, squeezing the flexible plates of her posterior, and she lets out a stifled cry as one of your fingers ventures down into the cleft of her backside, teasing along her sensitive black hole.");
	var x:int = pc.cockThatFits(zilFemale.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nBefore you plunge in, though, your hand slips along her hips to the meeting of your [pc.cock " + x + "] and her juicy honeypot. You plunge in, making the zil girl throw her head back in pleasure as your fingers delve her depths, swirling through her sweet honey-like juices. <i>“Oooh, dirty " + pc.mf("boy","girl") + ". Yeah, get me lubed up with my own honey. Just like that,”</i> she moans, guiding your hand from her sodden box back to her eager ass. Now slathered in slick amber, you press a finger hard against her dark star and grin wide as it slides inexorably inwards, her tight little ass unable to push back against your honeyslick digit. Her mouth curls out in a silent ring of pleasure as your finger slides in to the last knuckle, utterly buried in her ass. Another slips in to join the first before you start to move them, and by the time they’re out to the tips your lover is wracked by short gasps of insatiable pleasure, trembling from sexual anticipation.");
	
	output("\n\nHer hips grind harder, humping on your fingers buried up her butt and dragging her slick cunny across the length of your [pc.cock " + x + "], slathering you up with her sticky juices and sending shivers of pleasure all throughout your body. With a mischievous grin, the zil girl takes your honey-covered wang in her smooth, chitin-clad fingers and starts to pump. Her alien fingers feel like cool marble on your manhood, gently stroking her honey into every nook and crevice of your cock, slathering it with a nice, even coating of her cunt-juices until it shines in the sunlight. Her thumb moves up to your [pc.cockHead " + x + "], spreading an extra layer of honey around your brim to ease the initial penetration. While she does so, you shift your hips, leaning back for the zil girl as she picks herself up and aligns her tight little pucker with your [pc.cock " + x + "]. She comes to a complete stop just as your head kisses her black hole, stopping to savor the feeling of your cock pressing into her honey-filled behind. You join her, reveling in the unmatched tightness squeezing down on your tip, slowly rocking your hips into her as she begins to slide down, inch by inch taking your prick. You lock your hands into the full cheeks of her ass, guiding her down with tender, agonizing slowness until she bottoms out, cheeks resting on your [pc.legOrLegs].");
	pc.cockChange();
	
	output("\n\nHer breath is ragged and heavy by the time the zil’s taken everything you have. With arms still locked around your neck, she pulls herself into a long, deep kiss with you. Your lips part, admitting a long, thick yellow tongue which searches into your maw, playing across your teeth and throat.");
	
	output("\n\nAnd it is very, very long. You stifle a gasp as the girl’s nectar-sucking tongue plays across your own before slithering down into your throat, more like a tentacle than a tongue. You try not to gag as the giggling zil girl forces you to deepthroat her lengthy tongue. She keeps it up only for a moment, though, before withdrawing again, still grinning. Instead, now, she pushes back the chitin shell over her chest, revealing the swells of her full breasts, each so aroused by the anal penetration that they’ve begun to trickle honey; amber lines trace down her tits, one of which her huge tongue promptly laps up before retracting. The other, it seems, is for you. You return her smile and set to work, your [pc.tongue] stretching out to lick along the underside of her breast, causing her bare yellow flesh to quiver at your touch.");
	
	output("\n\nFinally, your lips close in on her coal-colored, honeyed teat, and even the first, gentle suckle draws out a steady stream of her amber lactation. You bring a hand to bear, squeezing at the base of her tit and drawing out another thick gush of sweetness that threatens to bulge your cheeks. Soon, you’re swallowing every few seconds as you suckle from your lover, lapping up every drop of her nectar. At a look from you, the zil girl starts to move her hips again, gently circling your lap to draw the barest length of your prick from her slick behind. You groan as the sensation grows, her pace quickening until she’s bouncing on your cock, flesh slapping wetly as her honeypot squirts juices and secretes more and more of its sweet scents; in minutes you’re positively swooning with pleasure, nearly overwhelming by taste, touch, and smell combined from the waspy beauty.");
	
	output("\n\nYour fingers trace down her smooth, dark body caressing the zil girl’s hips and thighs before settling into the honeypot itself, finding the pert yellow bud of her clitoris on full display. Your thumb circles it, drawing a shrill cry from your lover even as your other digits plunge into her cavernous cunt, stretching her cock-craving walls wide. She clamps down on you, muscles massaging you half by instinctual need for an injection of your seed; your breeding stick, however, is busily buried in her behind, being squeezed and caressed by her spasming sphincter as the zil girl bounces on your lap, crying her pleasure as your triple attack brings her closer to the edge with every passing second. Before you know it, she lets out an ear-piercing scream, and suddenly your mouth is flooding with a powerful rush of honey, her suddenly squirting honeypot nearly overwhelming your senses; but it’s her ass, clinging so hard to your cock you think you’ll pop, that finally sends you over the edge after her. You grab her hips and hold her tight to your chest as your [pc.cock " + x + "] bursts in her butt, filling her with spurt after spurt of your steaming [pc.cumNoun].");
	
	output("\n\nBy the time you’re done, both of you are sodden messes: the zil’s backside is smeared with thick, frothy ropes of your cum, pouring out of the breach as your cock withdraws from inside her; opposite that, her cunny squirted something fierce during her orgasm, and you’re utterly drenched with her slick fluids, surrounding you in the heady odor of her sex pheromones.");
	output("\n\n<i>“You’re... that was... wow,”</i> the zil girl breathes, chest heaving as she tries to catch her breath. <i>“Thanks for the pounding, stranger.”</i>");
	
	//if Asshole PC:
	if(pc.isAss())
	{
		output("\n\nYou wipe your cum-slick prick off on the zil girl’s chitiny thigh before collecting your gear, trying to brush some of the thick patches of sex-juice off of yourself");
	}
	//else if Snarky, 
	else if(pc.isMischievous()) output("\n\n<i>“Thanks for the cock cleaning, sweetheart,”</i> you say, ruffling her spiky hair");
	else output("\n\nYou cup the wasp girl cheek and give her a quick kiss before grabbing your gear");
	output(".\n\n<i>“See you around, stranger,”</i> she calls after you as you leave before rolling over in the puddle of sex you’ve left for a quick nap.");
	processTime(20+rand(10));
	pc.orgasm();
	pc.milkInMouth(chars["ZILFEMALE"]);
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Missionary
public function missionaryWithAZilGirl():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	
	var x:int = pc.cockThatFits(zilFemale.vaginalCapacity());
	if (x < 0) x = pc.smallestCockIndex();
	
	output("With the wasp girl’s legs nice and spread for you, it isn’t long before you smell the wafting cloud of her sexual scent. Immediately, [pc.eachCock] stiffens");
	if(!pc.isCrotchExposed() && (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")) {
		output(" in your ");
		if(pc.lowerUndergarment.shortName != "" && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output("[pc.lowerUndergarment]");
		else output("[pc.armor]");
		output(", tenting visibly.");
	}
	else {
		output(" up to attention, displayed completely by your lack of garments.");
	}
	output(" The zil coos at you, licking her lips and giving you a “come hither” look. You step toward her, shedding your [pc.gear]; with a pleased sigh, the zil girl leans back and spreads ‘em wide, giving you a good long look at the black lips of her vulva and the dark star of her ass as her fingers dip into her honeypot, caressing the mouth as you undress. Finally free of your clothes, you move forward, grabbing your cock in one hand, the girl’s cheek in the other. You pull her into a quick kiss, tasting her sweet lips before she wraps your [pc.cock " + x + "] in her marble-smooth black fingers, stroking you gently as you push her down.");
	output("\n\nShe moans into your mouth as you rest her back on the ground, hands moving down to explore and caress her body. You cup her breasts, pushing aside the chitin shell to expose the pale yellow mounds. A little trickle of honey spills from her prominent teats and you lap it up, never breaking eye contact with the trembling girl as your tongue moves down, lapping at her lactic source as your hands slip down to her wide hips, fingers digging into her plated behind. You kiss her again, this time gently biting and pulling her lip, teasing her until her lengthy tongue comes out to play, flicking across your own lips and nose. You enjoy her touch for a few long, happy moments before pulling back, shifting up her body until you’re straddling her chest. Your fingers brush through her golden spines, shifting her head up to the cock presented to her.");
	output("\n\nAt your urging, the zil girl opens her mouth wide, letting you slide your prick right in to the hilt");
	if(pc.cockVolume(x) >= zilFemale.vaginalCapacity()) output(", watching as her throat bulges with your massive length; she gags a moment as you stuff her mouth full of cock before finally catching her breath, her throat contracting hard around your invading shaft");
	output(". As you move your hips into her face, you gasp with sudden pleasure as the wasp girl’s long, prehensile tongue slips around your shaft, wrapping you up like a snake before it starts to undulate, writhing and squirming around your [pc.cock " + x + "]. Given over to alien pleasures, your fingers run encouragingly across her carapaced body, urging her tongue job on. Soaked in her sweet saliva, you’re soon able to gently rock your hips, using her constricting tongue like a sex toy, fucking her face with increasing abandon.");
	if(pc.isAss()) output(" You grab her cheeks, holding her head steady as you start to pound her face; spit flies everywhere in a matter of moments as you hump the zil girl’s eager mouth, ignoring her cries and moans, obsessed with your own pleasure");
	else output(" Your face fucking lasts until you reach toward your own edge, steadily humping away at the alien’s face until she’s gagging again while pre flows freely down her throat");
	output(". Finally, unable to continue, you pull out of her mouth, still connected to her gaping lips by strands of spit and frothy strings of your own pre; she wipes her mouth and pulls you down, kissing you hard until you can taste yourself on her tongue as it flicks across your puckered lips. You move back down her body, now wholly ready for the coming storm of sex; the zil’s own fingers dig into your shoulders, pulling you ever down onto her, her legs locking behind your [pc.butt] to draw you into her.");
	output("\n\nBreathing deep of her sexual scent, your [pc.cock " + x + "] hardens to diamond strength as the [pc.cockHead " + x + "] brushes the zil girl’s eager cunt, tasting of the free-flowing honey within. She looks up at you pleadingly, pitch-black eyes searching yours as your prick hovers over her entrance. Gently, ever so slowly, you give her what she wants: your hips ease in, pushing the first inch of cockflesh into her, watching as her mouth locks open in a silent “O” of pleasure as she’s spread apart on your prick. You dive into her vulnerable mouth, pressing your lips firmly to hers and letting your tongue play across her limp muscle, flicking across the tiny nectar hole in its tip until she winces with pleased surprise.");
	pc.cockChange();
	output("\n\nNow that’s she’s utterly speared on your [pc.cock " + x + "], you start to move, picking up at a fast tempo of fucking that has her crying and moaning in seconds, digging her fingers into you, urging you on with whispered promises of pleasures and half-crazed pleas of love for you and your magnificent member. You hold her tight, hugging the oversexed wasp against your [pc.chest] as your cock rams into her with force enough to send her sweet honey all over the glade, her voice echoing throughout the jungle.");
	output("\n\nYour climax is inevitable, surging onwards into the waiting womb of the screaming wasp girl. With a last, furious pounding, your cum blasts into her sodden box, smearing her warm, writhing walls [pc.cumColor] with seed. You hold onto her, humping away furiously as your [pc.cock " + x + "] blows load after load of [pc.cumFlavor] cream into her, filling her until spurts of seed leak out around your pistoning prick. A few final thrusts leaves you done, both you and the zil girl panting heavily as the last drops of [pc.cum] leak out of your [pc.cock " + x + "].");
	output("\n\n<i>“Damn, stranger,”</i> the wasp gasps, her breath hot and heavy on your sweat-slick [pc.skinFurScales]. <i>“Do you just go around breeding every girl you meet like that? Wow...”</i>");
	
	//If Asshole: 
	if(pc.isAss()) output("\n\nYou scoff, saying she ought to be ecstatic if she’s full of your get. A breeder like you comes around once in a lifetime.");
	//else if Snarky:
	else if(pc.isMischievous()) output("\n\nYou chuckle, saying that maybe you do, maybe you don’t; and maybe she’ll get to find out one day.");
	else output("\n\nYou shake your head, saying that you’re not the kind of " + pc.mf("guy","gal") + " to breed with just anyone.");
	
	output("\n\nThe zil girl sighs and leans back, patting her belly full of seed as you collect your [pc.gear]. <i>“Don’t be a stranger, stranger,”</i> she laughs, blowing you a kiss as you leave.");
	
	tryKnockUpFZil();
	pc.orgasm();
	pc.milkInMouth(chars["ZILFEMALE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//Footjob
public function footjobFromFemzil():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	
	var x:int = rand(pc.totalCocks());
	
	output("You toss your [pc.gear] aside");
	if(pc.hasStatusEffect("Genital Slit")) output(", letting your [pc.cocks] grow out from between your slit");
	else if(pc.legCount > 1) output(", letting your [pc.cocks] hang free between your [pc.legs]");
	else output(", letting your [pc.cocks] hang free");
	output("; the wasp girl’s eyes are drawn instantly to the hardening member, and licking her lips, she asks, <i>“So how do you want me to say hi to your friend there, stranger? Wanna ram it into my honey cunt, or maybe give my ass a reaming...?”</i>");
	
	//If Asshole: 
	if(pc.isAss()) output("\n\n<i>“Not likely. Get off your ass and put those feet to use,”</i>");
	// if Snarky,
	else if(pc.isMischievous()) output("\n\n<i>“Maybe next time, but for now... how about putting those feet to use?”</i>");
	// if Nice:
	else output("\n\n<i>“Some other time. For now, though, I’d love it if you could use your feet...”</i>");
	 
	output("\n\n<i>“Well, if you insist, stranger. I’m not picky,”</i> the zil says, strutting toward you as you toss your clothes aside. <i>“But first, why don’t you get some honey to lube yourself up with? The best foot’s a slick foot, after all.”</i>");
	
	output("\n\nYou nod and slip down as the zil girl spreads her legs, putting your face right into the potent sex aura coming off of her fragrant flower. [pc.EachCock] throbs with sudden need as your [pc.skin] flushes hotly, lust burning through you with fiery power. It takes a force of will not to push the zil girl over and breed her then and there, but you know what you’re here for: those black, boot-like chitiny legs, and their smooth-as-latex feet. You take hold of her thighs, caressing her honeypot’s lips with your thumbs as you inhale a lungful of lusty pheromone let loose by her parting lips. You dig in as soon as you’ve adjusted to the heady odor, [pc.tongue] slithering across her drooling cunt, sucking up the honey-sweet juices that soon flow to your deft touches and caresses. With ready hands, you scoop up the sweet nectar as it drips from the zil girl’s quivering quim and liberally apply it to your waiting wang, slathering up with honey lubricant until your [pc.cock " + x + "] is glistening in the sun.");
	
	output("\n\nSatisfied with your efforts, the zil girl gives you a rough push onto your back, leaving your prick standing at attention, stiff as a flag pole as your mate looms over you, a lascivious grin spreading across her insectile face. Teasingly, she touches her toe to the [pc.cockHead " + x + "] of your cock, rubbing the smooth black digit across your well lubed brim, eliciting a sharp gasp of pleasure from you. You grit your teeth as the sultry wasp girl circles your [pc.cockHead " + x + "], cooing to herself as your [pc.cock " + x + "] twitches, begging for a good fucking; desperate trickles of pre leak down from your head before you can blink, the creamy seed swirling in the amber glaze on your shaft.");
	output("\n\nGently, the zil pushes forward, pressing your dick down onto your belly ");
	//if big tits and cock:
	if(pc.cocks[x].cLength() >= 15 && pc.biggestTitSize() >= 1) output(", right between your tits");
	output(". Her heel’s on you immediately, ");
	if(pc.balls > 0) output("pressing down uncomfortably hard on your package and ");
	output("slowly rubbing along your sensitive underside until a thick, hot lake of pre bubbles out from your cumslit, pooling ");
	if(pc.cocks[x].cLength() >= 22) output(" on your [pc.face]");
	else if(pc.cocks[x].cLength() >= 15) output(" on your [pc.chest]");
	else output(" on your belly");
	output(". Your entire body trembles as the smooth sole of the zil’s alien foot slides down your shaft; your breath catches as she grinds her heel on your glans, smearing her toes with your flood of pre.");
	
	output("\n\n<i>“You’re awful cute when you squirm, stranger,”</i> the zil giggles, locking your [pc.cockHead " + x + "] between two of her toes. <i>“Now let’s see your face when you blow a load all over yourself.”</i>");
	
	output("\n\nHer dexterous toes start to jerk you off, leaving her heel to rub and grind along your shaft, ushering your orgasm up through the thick, throbbing vein. Your fingers dig into the soft dirt, teeth gritting as the waspy woman foot fucks your [pc.cock " + x + "], vigorously fondling and fingering herself as you come closer and closer to your breaking point. You determine to hold out just a little bit longer, to make her work to see you smear yourself in seed, and soon the clearing resounds with your sex-addled groans and cries, desperate moans of pleasure as your prick pulsates with mounting need, leaking more and more watery pre until your [pc.cockColor " + x + "] around the tip is stained");
	if(pc.fluidColorSimple(pc.cumType) == "white") output(" milk white");
	else output(" [pc.cumGem]");
	output(". But before you let loose, you can see the furrowed brow of effort on the zil’s face, making her work ever harder to bring you past the point of no return.");
	
	output("\n\nYour orgasm tears through you like an earthquake, leaving your whole body spasming with orgiastic pleasure as your [pc.cock " + x + "] thrums under the eager wasp slut’s heel, bursting with a creamy squirt that smears your [pc.skin] and utterly coats the zil’s honey-glazed foot. She cries out in surprise as your steaming [pc.cumNoun] smears across her chitin skin, though you can barely hear her over the roar of pleasure screaming past your lips as your cock finally attains release. By the time your member’s twitched out the last of its sweet cream, you’re barely conscious, utterly sexually exhausted. You lay back for a few long minutes, trying to catch your breath, though the zil girl doesn’t make it easy, still teasing your [pc.cock " + x + "] with her semen-smeared toes.");
	
	output("\n\nFinally, you manage to roll out from under her and grab your [pc.gear], starting to get dressed. You don’t get very far, however, before your lover hops over you again, brushing a slimy digit across your cheek. <i>“Where do you think you’re going? You wouldn’t leave a girl all messy, would you?”</i>");
	
	processTime(10+rand(10));
	pc.orgasm();
	pc.girlCumInMouth(chars["ZILFEMALE"]);
	//CHOICES!
	clearMenu();
	addButton(0,"Lick Her",lickABitchCleanYouBitch);
	addButton(1,"Don’t",dontLickABitchClean);
}

//Not Likely
public function dontLickABitchClean():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	//if Asshole:
	if(pc.isAss()) output("You bat her filthy foot away");
	else if(pc.isMischievous()) output("Chuckling, you brush her foot away");
	else output("Politely declining, you lift her foot away");
	output(" and get to your [pc.feet], wiping the seed off your cheek. The zil gives you a pouting face as you redress, but still admits, <i>“Well, it was fun while it lasted, stranger. See you around.”</i>");
	output("\n\nYou nod and head out, leaving the poor zil girl to clean your mess up.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Lick Clean
//(+Lust)
public function lickABitchCleanYouBitch():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	pc.lust(20);
	output("With the zil’s toes so close, you can fully smell the potent aroma of sex spread across her black chitin, and the irresistible lure of her desire wafting from her honeypot as she fingers herself, letting her pheromones waft down to you. Beset by a mire of scents, your spent prick twitches back to life, but the zil pointedly draws back your attention to her black, shimmering digits. Her big toe flicks across your lips, leaving the dual tastes of her sweet honey and your own creamy seed; your tongue reacts to the taste, darting out the lap across her smooth, hard skin, tasting deeply of yourself mixed into the coating of her own juices you spread before.");
	output("\n\nThe chitiny beauty breathes a gasp of pleasure as your lips suckle her toe, tongue bathing it, washing it clean of cum and honey until it shines. You look up at the zil girl, searching in her midnight-black eyes, watching the rise and fall of her bare bosom, her even, excited breath as you lick her clean, swallowing every");
	if(InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CUM, GLOBAL.FLUID_TYPE_CUMSAP, GLOBAL.FLUID_TYPE_NYREA_CUM, GLOBAL.FLUID_TYPE_NYREA_GIRLCUM, GLOBAL.FLUID_TYPE_GABILANI_CUM])) output(" sweet-salty");
	else output(" [pc.cumFlavor]");
	output(" drop you came on her. <i>“Oooh, what a good " + pc.mf("boy","girl") + "; your face was so cute when you gave me your seed, but now... mmm, I could get used to seeing you like this,”</i> she coos, digging her fingers deep into her sodden gash, showering you with trickles of potent honey that leave your mind in a haze of lust.");
	output("\n\nYour [pc.tongue] plays across her smooth chitin, delving between her toes, lavishing its attention across every inch. Soon, her sole and toes shine, licked cleaner than they ever were before. You let out a satisfied moan, letting an excess of your own cum and her honey trickle down your chin... but just as soon as you’ve finished, the zil girl’s mouth is pressed to yours, her prehensile tongue lapping up the juices still at hand. She pushes you down, back pressed into the earth by her knees, pinning you down while her quivering box is left hanging intoxicatingly close to your nose, her bright yellow clit nearly poking into your nose.");
	output("\n\n<i>“All finished? Then I’ve got something else for you to lick clean!”</i> she says, running her fingers " + (pc.hasHair() ? "through your hair" : "across your scalp") + ", gently guiding your head up to her eager hole. Your gentlest touch sends shivers up her spine, but she urges you onward with lusty moans and coos, pressing your face into her quim until her juices smear across your face, making your gasp for air as her potent sex-aura nearly overwhelms you. Behind her, your spent [pc.cocks] jut");
	if(pc.cockTotal() == 1) output("s");
	output(" to attention, and she’s quick to lean back and grab ");
	if(pc.cockTotal() > 1) output("one");
	else output("it");
	output(", reaching under your clothes to lock her smooth fingers around it, pumping it to the beat of your tonguing.");
	
	output("\n\nSpurred on by a resurgence of lust, you dive into her with abandon. Your tongue searches into her quivering depths, thrusting in between desperately contracting walls that milk and squeeze your muscle like a cock, trying to draw out a load of spunk to fertilize the eggs deep inside her. Instead, your tongue probes her again and again, lapping up the sweet juices that wash down in waves toward your waiting mouth, eagerly lubricating your oral invasion as the zil’s breath becomes ever more ragged. Slowly, you start to catch up to her, reveling in her tender attentions on your cock as she jerks you off, wringing your wang until a new stream of pre stains your clothes. Your breath catches as her thumb circles your cum slit, pressing down hard until you roll your head back and groan, able to feel the thick wad of pre bubbling up as she caps your shaft.");
	output("\n\n<i>“It’s my turn to cum,”</i> the zil laughs, mashing her muff back into your face, taking your nose halfway into herself before you can right yourself and set to work, furiously licking along her gash before your cock threatens to boil over into her waiting hand. Your work pays off in spades, as soon her dark slit is squeezing hard on your writhing [pc.tongue], dousing it in orgasmic honey as she digs her fingers into you, humping your face with wild, desperate need as her voice echoes to the heavens. She grinds hard on you, taking your tongue deep into her love canal as she cums, riding you even as her musky honey squirts powerfully onto your already doused face, drenching you in the wasp girl’s potent aroma.");
	output("\n\nWith a final ecstatic squeal and a last gush of honey onto your face, the zil girl rolls off you, panting heavily as her entire body trembles with release. Wiping the fem cum from your cheeks, you take your first deep breath of fresh air in a good long while. Before you can even think of leaving, though, the waspy beauty gets your attention with a come-hither coo and a pair of wide-spread legs. <i>“What do you say, stranger? You wouldn’t leave a girl when she’s all hot and ready to go again, would you?”</i> Damn, she’s fast... and smells so good....");
	processTime(25+rand(5));
	pc.girlCumInMouth(chars["ZILFEMALE"]);
	clearMenu();
	if(pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25) >= 0 && pc.hasCock()) addButton(0,"Fuck Her",missionaryWithAZilGirl);
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis that can fit her vagina for this.");
	addButton(1,"No Can Do",noThanksZilLadyImSpent);
}

//No Can Do
public function noThanksZilLadyImSpent():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("You shake your head, saying you’re too bushed to go again. <i>“Aww,”</i> the zil girl groans, crossing her legs again. <i>“But hey, you’ve got a hell of a tongue on you, stranger. You’re welcome to put it to use on me any time,”</i> she adds with a wink. Chuckling, you finish dressing and head out, leaving her to quietly masturbate behind you.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//Sixty Nine (Female)
public function sixtyNineZil():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	var x:int = rand(pc.totalVaginas());
	output("You lick your lips as the wasp-like girl swirls her fingers around her dark slit, letting a potent, mind-numbingly sweet aroma pour over you; in a matter of moments, your mind is a haze of sex pheromones, urging you to throw yourself into the zil’s arms, to revel in the pleasures of her flesh. Your hands work almost of their own accord, freeing you from the constraints of your [pc.gear]; your [pc.legOrLegs] carry you toward her as the last of your clothing falls aside, allowing the alien’s black eyes to gaze upon your bare [pc.vaginas].");
	output("\n\n<i>“Oh, you’re just dripping already, aren’t you?”</i> the waspy beauty coos, slipping down between your [pc.legOrLegs], cheek brushing your thigh. Your entire body trembles as her smooth, cool fingers brush across your bare, sensitive [pc.skin], her long tongue slipping out and drawing its slitted tip across your flesh, leaving a slimy trail toward your slavering cunt. Just before she reaches your needy box, her fingers sink into your [pc.butt], kneading the pliant flesh of your bare backside. You gasp and shiver as she nuzzles your thighs and caresses your ass, her long prehensile tongue slowly starting to circle your vulva.");
	output("\n\nA needy, lust-filled groan escapes your lips, desperate for sexual contact");
	if(pc.hasClit()) output("; your [pc.legOrLegs] quiver as her honey-sucking tip teases [pc.oneClit], sending sudden shocks of pleasure through you, nearly making you collapse into her arms");
	output(". Seeing your desperate expression, the zil girl leans up and takes your hands in hers, easing you onto the ground with her. She moves");
	if(pc.legCount > 1) output(" between");
	output(" your [pc.legOrLegs], putting them over her shoulders to give her a clear view of your dripping gash, slick and shimmering with your need.");
	output("\n\nLicking her lips, the zil digs in");
	//If Herm:
	if(pc.hasCock() && pc.hasVagina()) output(", grabbing [pc.oneCock] in one hand, pumping it eagerly as she moves it out of the way, revealing the main course");
	output(". She plants a long, full-lipped kiss on [pc.oneVagina], looking up at you with near-perfect black eyes before her lips part, letting her tentacle-like tongue slip between your eager folds. You groan in pleasure, back arched as the long, slithering thing glides into you, spearing your clenching muscles apart as the zil feeds more and more of the yellow tongue into you, letting it wiggle and squirm like no human cock ever could. Your fingers run through her hair-like spines, urging her face deeper into your groin, urging her on with sensual moans and cute gasps of pleasure. Around her writhing mouth-cock, the alien girl grins up at you, making a high purring sound as you stroke her hair.");
	//if Herm:
	if(pc.hasCock() && pc.hasVagina()) {
		output(" Her hand picks up the pace a little more in response, jacking ");
		if(pc.cockTotal() > 1) output("one dick");
		else output("your [pc.cock]");
		output(" harder and harder until a thick glob of pre spurts out, leaving a [pc.cumColor] smear on her skilled fingers.");
	}
	
	output("\n\nYou let the girl service you for a few long, pleasant minutes, enjoying her well-practiced motions and the feeling of her agile tongue plunging into you again and again. ");
	//If Asshole PC:
	if(pc.isAss()) output("Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she’s straddling your [pc.face], her potent muff almost spread across your nose. You cough and gasp as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. Figuring it’s the only way to get her back to work, you let your [pc.tongue] loose on her juicy, honey-like cunt.");
	else if(pc.isMischievous()) output("Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she’s straddling your [pc.face], her potent muff almost spread across your nose. <i>“Well, if you insist,”</i> you chuckle, breathing deep of her sexual aroma until it’s spreading a hot deeply pleasant warmth throughout your body. Urging her on with a sharp spank, you get to work reciprocating her oral ministrations");
	//else if Nice:
	else output("Feeling like you shouldn’t be the only one getting off here, though - you pull the zil girl up and, twirling a finger, get her to straddle your face, letting her lean back into your quim as her own cunt looms over you. You breathe deep as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. You let your [pc.tongue] loose on her juicy, honey-like cunt");
	output(". The zil gasps, arching her back as your [pc.tongue] swirls around her juicy cunt, lapping at the bright yellow pleasure buzzer pointing outwards from her wine dark pussy. She wiggles her backside seductively, moaning into your [pc.vagina] as you eat her out; you’re soon pleasured in turn as the zil’s long, squirming tongue slithers back into your [pc.vagina], thrusting into your clenching depths until her face is coated in your squirting juices.");
	output("\n\n");
	//If Herm: 
	if(pc.hasCock() && pc.hasVagina()) output("Her hand grasps your cock, stroking it just beside her face, occasionally letting her tongue slip from your cunt to tease and curl around the base of your rigid prick. ");
	output("You give your lover a quick swat on the black-chitined ass, grinning as her cunt clamps down on your invading tongue, forming a tight little channel for you to thrust into. Your tongue comes back to you glazed with thick honey juice, unleashing an even more potent cloud of sexual pheromones to assault your senses and leave you in a lusty haze; almost on its own accord, your tongue redoubles its assault on the zil’s sexy snatch, mouth-fucking her until she’s squirming in your gasp with honey dripping freely onto your cheeks. You barely notice when she cums, screaming into your [pc.vagina " + x + "] as you lick and thrust unerringly onward, never missing a beat as she squirts her sweet juices into your face.");
	
	output("\n\nStill crying aloud, the zil girl’s tongue slams into you, ramming against your cervix until you’re sure she’s bound to penetrate your womb with her alien tongue. Your [pc.legOrLegs] curl around her, entire body trembling as her tongue desperately delves your depths. Your orgasm follows hers by a few mere minutes, causing you to arch your back and scream your pleasure as her wondrous tongue brings you to an explosive orgasm that leaves her face drenched in your femcum");
	//if Herm:
	if(pc.hasCock() && pc.hasVagina()) {
		output(" as your [pc.cock] explode");
		if(pc.cockTotal() == 1) output("s");
		output(" in her hand, raining [pc.cum] down onto her hair, turning the back of her head [pc.cumColor]");
	}
	output(". <i>“Oh, wow. Explosive, stranger!”</i> The zil laughs, rolling off you and wiping the [pc.girlCum] from her face - before lapping it up with her long tongue, still slick with your womanly lube. <i>“But you’ve got a talented tongue, you know that... real talented,”</i> she sighs, flopping onto her back and idly fingering her dark slit with latex-black fingers.");
	
	output("\n\nWith your chest still heaving, you can only try to stagger to your feet and brush the wetness from your thighs and cheeks. As you grab your [pc.gear], the zil girl slips up behind you, wrapping her dark arms around your [pc.hips], chin nestling in your neck. <i>“Come back real soon, stranger. It’s awful hard to find a girl like you around here,”</i> she whispers, kissing along your neck. You breathe deep, skin trembling as the cum-soaked beauty caresses you; soon, she helps you get dressed and sends you on your way with a friendly wave and a kiss goodbye.");
	processTime(25+rand(15));
	pc.orgasm();
	pc.girlCumInMouth(chars["ZILFEMALE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//Trib & Suck
public function tribAndSuckZil():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	var x:int = rand(pc.totalVaginas());
	output("As you stare at the zil girl’s bare body, buxom and inviting, she gives you a lascivious grin and pushes aside the chitin plate over her chest, letting her fingers roam inside to pinch and squeeze a pert nipple until a clear amber trickle pours down. <i>“Come on over for a taste, stranger. I promise I don’t bite </i>too<i> hard.”</i> she says, nipping her lower lip as she thrusts out her chest. You feel a rush of heat under your skin, your breath quickening as you drink in her luscious scent and curvaceous body. With a come hither look, the zil slips down onto her back, cupping her perky, honey-laden teats for you, each beading with sweet nectar as you approach, tossing aside your [pc.gear] to bare your own ");
	clearList();
	addToList("[pc.vaginas]");
	if(pc.hasCock()) addToList("[pc.cocks]");
	addToList("[pc.chest]");
	output(formatList() + " to the cool breeze. Your [pc.nipples] stiffen as you straddle the waspy maiden, looking down into her clear black eyes as she grins up at you invitingly.");
	
	output("\n\n<i>“Why don’t you take a little taste, hm?”</i> she buzzes, thrusting her chest again. You silence her with a quick kiss, tasting the sweet gloss on her black lips as you slide down her body, running your hands across her latex-smooth chitin until you take her two breasts in hand, cupping the soft mounds and massaging their prominent peaks. She gasps as your fingers close around her dark peaks, pinching them roughly until your fingers are completely sticky with her alien milk. Grinning, you break one kiss to start another, wrapping your lips around her teat and rolling it between your teeth, making the poor girl’s breath catch in anxious anticipation. Looking up into her featureless eyes, you take your first deep suckle, mouth burning as her unnaturally sweet honey flows over the tip of your tongue, trickling like syrup into your hungry throat. Greedily, your hands massage her buxom flesh, kneading out a stronger and stronger flow of the languid substance for you to suckle; your ministrations quickly have the zil girl arching her back and moaning, her hands running " + (pc.hasHair() ? "through" : "across") + " your [pc.hair].");
	
	output("\n\nShe seems to be enjoying you, if only evidenced by her shrill cries and moans and writhing motions. You giggle around her teat, flicking your tongue across the over-sensitive flesh before moving ever so slightly between your lover’s spread legs. She shouldn’t be the only one to get a little pleasure out of this, even if you are enjoying the sugary meal. Moving your [pc.legOrLegs] overtop her, you rock your [pc.hips] forward, dragging your aching vulva across the zil’s smooth skin. ");
	if(pc.hasClit()) output("You groan contentedly as her latexy chitin rubs across your [pc.clits], sending dull tremors of pleasure through your lusty skin.");
	output(" Your mouth continues to suckle from her eager tit as you hump at the zil’s abdomen, frotting against her until with a sharp gasp of pleasure the waspy girl’s tit seems to surge in your mouth, pouring out a sudden, thick load of amber cream.");
	
	output("\n\nHer fingers suddenly tighten " + (pc.hasHair() ? "in your hair" : "around your skull") + ", urging you off her breast until she can reposition under you, leaning her flared hips up to your thighs, her bright yellow pleasure buzzer sliding across your own - you both gasp in ecstasy, your arms wrapping around each other as your cunts rub together. <i>“Mmm, don’t stop,”</i> the zil moans, pushing your head toward her other needy tit; she sighs contentedly as you start to suckle, running a hand " + (pc.hasHair() ? "through your hair" : "across your scalp") + " as the other grabs your [pc.butt], smooth fingers caressing your supple flesh and teasing your [pc.asshole]. Your muscles clench as your alien lover’s fingers circle your clenched pucker, backing off ever so slightly whenever her cunny presses back against your own slit, only to venture forth when she lets up again, making sure you never have a moment’s respite.");
	
	output("\n\nSuddenly, your eyes widen as her long, smooth digit pushes right into your [pc.asshole]. You gasp silently, honey drooling from your lips as one, then two of the zil’s fingers delve your backside, swirling around inside your puckered hole. <i>“Don’t you dare hold back now, stranger. Cum for me,”</i> the zil whispers, spearing you hard on her fingers as her hips buck hard into yours. Your grit your teeth, refusing to give in so easily. She’ll have to work a little harder than that to get you to peak first. <i>“Is that so? Well, let’s see...”</i> the zil girl chuckles as you feel a momentary jab in your thigh.");
	
	output("\n\nYou cast an alarmed glance over your shoulder, just in time to see the wasp-girl’s stinger retract from your [pc.leg], leaving a flushed red circle on your skin. You open your mouth to speak, but all that comes out is a low, husky moan. Your body flushes hotly, heart hammering in your chest, but all you really feel is your [pc.vagina " + x + "], slavering and twitching");
	if(pc.hasClit()) output(" as [pc.eachClit] swells thicker and hotter");
	output(", commanding your attention. Instinct takes over, your hands diving between your [pc.legOrLegs] to tend to your fuck-box, fingers sliding into the quivering hole and going to work on their own accord. The waspy beauty beneath you giggles, licking her lips as you furiously masturbate, seeming to drink in the scent of sex and lust dripping off of you.");
	
	output("\n\n<i>“You almost smell like one of us, stranger,”</i> she laughs, stroking your cheek. <i>“Here, let me help you.”</i>");
	
	output("\n\nYou give a guttural moan as another set of fingers mingle in with your own, delving into the slit of your womanhood to play across the ever-sensitive walls, slick with lust and fervent need.");
	if(pc.hasCock()) output(" Her fingers brush along the underside of [pc.oneCock], wrapping it in her latexy grip and giving it a good few pumps. Thick drops of pre spurt out at her slightest touch, smearing onto the chitin of her belly.");
	output("\n\n<i>“So veeery lusty. I guess a direct injection does more than just the whiff, huh? Poor thing, you must be just dying to cum.”</i>");
	
	output("\n\nLike a bitch on a leash, you cum on command: you grit your teeth and moan, burying your head between the soft, welcoming mounds of the alien’s tits. Her arms quickly wrap around you, holding you down as her pelvis rushes up to meet you, grinding her engorged clit across your own burning bud. You cry out in overwhelming pleasure, your quim spasming out ropes of girlcum onto the wasp’s thighs and slit until your groins look like they’re coated in slimy webs, bridged together by trails of your feminine lust.");
	
	//If PC has a cock: 
	if(pc.hasCock()) {
		output("\n\nBefore you can hope to calm down, the zil girl’s hips move up, bringing her knees down around your [pc.hips] until they’ve pinned your cock between them. Your breath catches as she squeezes your prick between her smooth, chitinous plates. Gently, she starts to move her legs, massaging your engorged length of your [pc.cockBiggest] until another thick stream of cum pours out onto her, pooling into her tiny little belly button. She giggles girlishly as your prick spasms in her grasp. <i>“Aww, so much just going to waste. Maybe next time you’ll fuck me proper, stranger. Girl needs a little baby batter in her cunny every now and then.”</i>");
	}
	output("\n\nChest heaving, your body shivers with unnatural lust as the zil’s venom courses through your veins. <i>“Well, that was a hell of a thing, stranger,”</i> the zil girl laughs, trying to roll you off her. <i>“Glad you enjoyed yourself.”</i>");
	
	output("\n\n<i>“Oh, no,”</i> you growl, grabbing her arms, pinning them beside her. <i>“I’m not done with you yet.”</i>");
	
	output("\n\nThe waspy beauty gulps loudly as you start to thrust your hips across hers. Her breath catches");
	if(pc.hasClit()) output(" as your [pc.clit] grinds against hers,");
	output(" and the look of fear and lust in her eyes can only drive you on....");
	processTime(10+rand(10));
	pc.orgasm();
	pc.milkInMouth(chars["ZILFEMALE"]);
	clearMenu();
	addButton(0,"Next",zilFemaleTribbingEpilogue);
}

public function zilFemaleTribbingEpilogue():void {
	clearOutput();
	author("Savin");
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("<b>Two hours later...</b>");
	output("\n\n<i>“N-no more!”</i> the alien woman cries, fingers digging into your shoulders as her cunt explodes in a burst of feminine slime, smearing her juices all over your sore, aching thighs. Your own quim returns the favor, nearly sucking in her engorged bud like a miniature cock as your cum for the tenth... twentieth... the last time, you hope.");
	
	output("\n\nFinally, you can breath easy. The haze of lust that clouded your brain for hours seems to lift, receding back into the dark, primal places of your mind. You slip off the poor, exhausted zil, finally seeming to be rid of her sex pheromones and nightmarish venom.");
	output("\n\n<i>“Oh wow,”</i> your lover breathes, putting a hand to her hammering heart. <i>“You sure like that venom, huh sexy? I’ll uh, just have to remember that next time. Not sure if you need more or less, though...”</i>");
	
	output("\n\nYou shoot her a glance, and are surprised to see her smile at you. <i>“Just teasing, beautiful. You, uh, you just go on and get dressed. I don’t think I can move my legs right now...”</i>");
	processTime(120+rand(10));
	var i:int = 0;
	for(i = 0; i < 14; i++)
	{
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function girlZilLossRouter():void
{
	var choices:Array = new Array();
	var select:int = 0;
	choices[choices.length] = forceyFaceSittingFromFemzil;
	//Ladies Get Forced to Suckle and Then Cunnilingate While Repeatedly Stung (DONE) (-F)(edited)
	if(pc.hasVagina()) choices[choices.length] = forceCunnilstingus;
	//Dudes Get Rode and Stang in the Taint repeatedly!? Maybe. [DONE] (-F) [edited]
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity()) >= 0) choices[choices.length] = dudesGetStangRoad;
	
	choices[rand(choices.length)]();
}
//Loss Scenes
//Ladies Get Forced to Suckle and Then Cunnilingate While Repeatedly Stung (DONE) (-F)(edited)
//Yowch! -Fen idear
public function forceCunnilstingus():void {
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	//clearOutput();
	//HP Losssssssssssssssssssssssssssssssuckmydick
	if(pc.HP() <= 0) {
		output("With your strength falling as rapidly as the leaves that occasionally drop from the canopy above, you give in. There’s no way you can continue to resist the nubile alien. She has you right where she wants you: on the ground and unable to stop her from inflicting some perverse mating ritual upon you. You look up at her with fire in your eyes. Perhaps you can bite off something sensitive when she makes her move?");
		output("\n\n<i>“Oh dear, this resistance simply will not do,”</i> the zil explains as she closes in, grabbing you gently under your chin and tipping your head back to meet her gaze. <i>“It is rude to resist once your position has been decided by your loss.”</i> She releases you only to stalk around you like a predator circling prey, tapping on her chin in thought. Her face brightens as a playful expression spreads across her features. <i>“I can teach you politeness, offworlder.”</i>");
		output("\n\nWorry over just what she means wars with your desire to resist her, and in the end, you wind up watching her. Your eyes remain warily locked as she completes her circle and drops onto your lap. Her hands, shiny as the most high quality latex, ");
		if(!pc.isNude()) output("carefully peel away every piece of your equipment");
		else output("carefully strip away your few possessions");
		output(", and she’s sure to keep them far, far away from your mouth. Resting heavily upon your [pc.legOrLegs], her abdomen twitches while she works, dragging the sharpness over her stinger up your vulnerable [pc.skinFurScales]. The perfect hardness of her fingers comes to rest on your shoulders, and she gazes deeply into your eyes, a sardonic smile painted across her obsidian lips.");
		output("\n\n<i>“Don’t be such a spoil-sport,”</i> she whispers. <i>“Just relax.”</i> The dusky wasp presses down with her hands to push herself up. At the same time, her insect-like abdomen flexes and curls to press down, hooking the length of its stinger into your skin. It stabs in until you feel the smooth hardness of its base pressed against you. Amazingly, it barely hurts to be pricked that deeply. The pain is fading away already, replaced by a quiet, limp acquiescence. Something is flowing out from her steadily-pumping abdomen and into your vulnerable veins. You can feel it trickling into you and see her huge rear-half flexing and shuddering as it works. Most noticeable of all, you’re starting to feel very, very warm - exquisitely so.");
		output("\n\nSmiling as the heat works its way up your [pc.leg] and into [pc.eachVagina], you find your eyelids drifting closed. Your crotch is getting sticky from the heat, your nether-lips are engorged, and your [pc.nipples]");
		if(pc.hasNippleCocks()) output(" abruptly release their immensely turgid shafts");
		else if(pc.hasFuckableNipples()) output(" abruptly begin to leak trickles of lubricant");
		else if(pc.canMilkSquirt()) output(" abruptly begin to drool in excitement");
		else if(pc.hasFlatNipples()) output(" abruptly tingle in the humid air");
		else output(" abruptly jut out to a full and totally erect state");
		output(". The pleasure of your blossoming arousal is like a balm to your troubled mind, dulling your worry into a sort of curious, lewd wonderment.");
	}
	//ALT LUST INTRO
	else {
		output("A lurid moan cuts through the air. It is only after you wonder where it came from that you recognize it as your own voice. You can’t really control yourself anymore. This fey woman... she’s just right there, and she smells soooo good that it hurts not to sit down between her legs and nuzzle at her crotch. She smiles as you drop to your [pc.knees], already ");
		if(pc.isNude()) output("discarding the few possessions you bothered to bring");
		else output("stripping out of your equipment");
		output(".");
		output("\n\n<i>“Oh, an off-worlder that knows custom! Perfect.”</i> the zil says with a happy trill. <i>“I don’t understand why you star-walkers seem so blind to the needs of life. When you meet someone from a different tribe, you have a contest of strength or willpower. The winner may use the loser to sate her baser needs and breed, if desired. The loser is to be a subservient vessel for copulation until the winner is sated. How else would one remain strong and bear strong childen?”</i>");
		output("\n\nYou shrug, not interested in her diatribe, only in leering at her sweet-smelling, dewy lips.");
		output("\n\nShe catches your look and laughs. <i>“Oh, I like my mates to be a little more eager than that, licentious </i>");
		if(pc.tallness <= 55) output("<i>little </i>");
		output("<i>" + pc.mf("ladyboy","girl") + ".”</i> She kneels down over your [pc.legOrLegs], her heavy abdomen brushing across your [pc.thigh], its stinger sliding angrily across your [pc.skinFurScales]. Her rigid, armored fingertips grab you by each side of your head");
		if(pc.hasHair()) output(", running through your [pc.hair],");
		output(" and she leans in, pressing her onyx lips against yours in a slow kiss. The sensuous embrace drags on for what feels like forever. You try to reach for her breasts, her pussy, and even your own, but she deflects your arms when you do, forcing you to pay attention to nothing but the feel of your [pc.lips] against hers.");
		output("\n\nShe breaks away, holding you down as her backside flexes. The stinger catches on your [pc.skin] with a painful prick. Driven down by her powerful abdomen, it firmly embeds itself into your [pc.thigh], not stopping until the rounded edge of her carapace has collided with your flesh. It immediately starts pumping you full of something... something warm... no, hot. Fuck, she’s making your [pc.vaginas] fucking drip! It’s like her stinger is just oozing liquid-hot lust straight into your veins, and every part of your body that it spreads to just feels so moist, pliant, and touchable. You could probably get off on having your sides tickled right now. You glance at her with an expression that’s one part confused and two parts horny slut, wondering just what she’s doing to you.");
		output("\n\nYour [pc.nipples]");
		if(pc.hasNippleCocks()) output(" abruptly release their immensely turgid shafts.");
		else if(pc.hasFuckableNipples()) output(" abruptly begin to leak trickles of lubricant.");
		else if(pc.canMilkSquirt()) output(" abruptly begin to drool in excitement.");
		else if(pc.hasFlatNipples()) output(" abruptly tingle in the humid air.");
		else output(" abruptly jut out to a full and totally erect state.");
		output(" It’s getting worse. Twitching and lurching, you can see her insectile tail contracting and squeezing as it pumps more of the mind-affecting chemical into you. It doesn’t matter to you. You’re beyond caring by this point; you just want her to hurry up and start fucking you before your brain melts from the omnipresent warmth and puddles between your thighs.");
	}
	//MERGE DIS SHIT TOGETHER
	output("\n\nThe chitinous seductress bids you, <i>“Come here, precious. You look thirsty. I have a treat for you.”</i> She cups a breast, squeezing it gently. A trickle of honey escapes her sable nipple. The amber fluid slowly runs down the curvature of her perky melons as you watch and lick your lips like a cat eyeing a saucer full of milk. You desperately want to touch and caress every sensitive part of her body, hoping that in turn she will pleasure you. You’re too horny to think straight, but there’s a set of perky, leaking nipples there waiting for a tongue to bathe them. There’s only one thing to do.");
	output("\n\nYou obey with swiftness, closing the space so quickly that her shining teat virtually teleports into your pursed lips. Running in a slow circle over the smooth areola, your [pc.tongue] gathers the excess honey deep into your hungry gob. You drink it immediately rather than savoring its distinctly-alien-yet-familiar flavor, and the zil seems to like the quick sharpness of your rapid-fire suckling. Her ambrosia comes out in trickles at first, then increasingly solid streams. In no time, your throat is bobbing along with the sound of your noisy gulps. You ache for more: a simple touch on your [pc.thigh], a tweak of your own nipple, or even the touch of her shining fingers on your mons.");
	output("\n\nCocking your head to the side, you gaze imploringly at the nectar-oozing beauty’s exotically patterned eyes, pleading with little more than a desperate look for reciprocation. She shakes her head with a sad smile and pops your mouth free, guiding you to the other nipple before you can give voice to your anxious pleas. This one is much, much messier than the other. While you drank, the zil’s second nipple leaked like a faucet, and now her curved, sumptuous breast is glazed from the areola down in viscous love-honey. Your [pc.tongue] automatically collects ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("it all, thanks to its expansive length, but then it’s stuck outside while you suck, curling tightly around the big, saliva-coated boob.");
	else output("what it can, but each hungry lick winds up smearing more and more of it on your cheeks and chin.");
	
	output("\n\nMore of the insidious, heat-inducing venom pours into your [pc.thigh] while you nurse, forming a knot of white-hot pleasure that slowly dissipates into the rest of you, making you feel weak. [pc.EachVagina] feels like it’s in the middle of a forest-fire of sexual need; flames of desire roll over your feminine lips in ways that set off convulsive pleasure-clenches. You give up getting anything back when you realize just how sensitive you’re becoming. The slow tickle of a breeze across ");
	if(pc.vaginaTotal() > 1) output("an");
	else output("your");
	output(" engorged sex feels better than a finger or tongue normally could. Your [pc.girlCum] runs out with an audible ‘drip-drip-drip’, and all you can think to do is drink deeply");
	if(pc.legCount > 1) output(" and spread your [pc.legs] as wide open as possible");
	output(".");
	
	output("\n\nThen, while you are grinding your [pc.hips] against this fantastic creature’s armored thigh, the honey runs out. Her puffy nipple has gone dry. You break your mouth away, connected by strands of nectar-thickened saliva, and gape dumbly, unsure just what you’re supposed to do and too horny to think.");
	output("\n\n<i>“Ohhhh...”</i> the zil groans, <i>“Poor you, nothing for your mouth to serve.”</i> She rubs her fingertip along your sticky lower lip. <i>“Do you want more honey, dear?”</i> She extends the glossy, armored digit into your mouth. Your close around it hungrily, suckling it like one big teat, determined to claim every tasty drop on the slick surface. Its owner’s buzzing voice hums, <i>“Oh you do.... I knew you would. There’s all the honey you could ever want between my legs. Just get in there and start licking.”</i>");
	output("\n\nAs you kneel down between the thighs you just inadvertently polished with your juices, the compelling pheromones in the air thicken, and if you weren’t already floating in a sauna of pure excitement, you’d be soaking yourself. The moist drops intensify into a ");
	if(!pc.isSquirter()) output("steady leak");
	else output("near-gushing dribble");
	output(" after a few deep breaths. Then, as you bury your nose against her stubby clit and take your first taste, a powerful contraction runs through your body. A puddle fills ");
	if(pc.legCount > 1) output("between your quivering [pc.knees]");
	else output("below your quivering [pc.knee]");
	output(" even though you haven’t gotten off yet. It just feels and tastes so good that your internal faucet has its knob turned up to full-blast and then broken off.");
	output("\n\nYou begin to fuck her sopping-wet honeypot with powerful strokes of your tongue, the lewd ‘squelch-squelch-squelch’ audible to any who would stumble upon the forceful tryst. Sometimes, you do such a good job that your armored mistress lets out an unmistakably uncontrolled squeal of feminine excitement, and her stinger releases a fresh injection of");
	if(pc.hasClit()) output(" clit-stiffening");
	output(" aphrodisiac along with it. You writhe happily, pressing your [pc.face] more and more excitedly against her honey-slobbering quim until you’re eagerly thrashing your [pc.lips] like motorized vibrating eggs on her dusky female flesh.");
	output("\n\nLashing your tongue rapid-fire through her silken folds, you focus entirely on bringing the zil as much pleasure as possible. You’ve gone from desperate to fuck to desperate to serve, absolutely sure that giving her an immense orgasm will get enough venom inside you that you’ll get to spontaneously cum for hours, just from savoring her taste on your [pc.tongue].");
	output("\n\nThey wasp-woman’s thighs reflexively cross behind your head to pin you in your damp, subservient position. Her thighs are quivering arhythmically, squeezing down on your ears. Her voice lilts up in exquisite pleasure, and then, she’s cumming! Oh, she’s cumming! Your [pc.tongue] bathes in the sweet taste of her girlcum, thrashing through the sticky deluge to drag it on as long as possible. The stinger twitches in your [pc.leg], pouring reserves of that need-fueling chemical into you at a faster rate than ever before. A huge gush of [pc.girlCum] erupts from your [pc.vaginas]");
	if(!pc.isSquirter()) output(". You didn’t even know anything could make you squirt, but this has");
	output(".");
	output("\n\nSpit frothes at your mouth as your whole body begins to quake alongside your zil lover’s. At last, your libertine coupling comes apart in a tangle of shuddering, boneless limbs. Your eyes roll back as your clenching, climactic tunnel experiences an orgasm strong enough to leave you breathless. Long before it finishes, another wells up from deep inside you, rolling out in another huge gush of love-juice. You scream");
	if(pc.hasCock()) output(" while [pc.eachCock] spews ropes of [pc.cum] across your [pc.belly]");
	output(". There’s so much pleasure that breathing is a desperate inhalation squeezed in between instinctive moans. It blocks out everything, most noticably rational thought. Your mind doesn’t even use words anymore, just concepts, completely obsessed with things that would translate to ‘feel good’ and ‘more’.");
	
	output("\n\nYou cum again to the feeling of having your " + (pc.hasHair() ? "[pc.hair] used as a rag by the sated zil" : "hand used as a wipe by the sated zil") + ". Her voice buzzes, <i>“Have fun!”</i> as she lays you back, parting with a quick squeeze of your ");
	if(pc.hasNippleCocks()) output("erupting [pc.nippleCock]");
	else if(pc.hasFuckableNipples() || pc.canMilkSquirt()) output("leaking [pc.nipple]");
	else output("tense nipple");
	output(". A fevered moan is your thank you and goodbye, your body well on its way to its next artificial climax as your eyes drift closed.\n\n");
	processTime(200+rand(60));
	pc.milkInMouth(enemy);
	pc.milkInMouth(enemy);
	pc.girlCumInMouth(enemy);
	pc.girlCumInMouth(enemy);
	pc.girlCumInMouth(enemy);
	var i:int = 0;
	for(i = 0; i < 19; i++)
	{
		pc.orgasm();
		if(i < 5 && rand(3) == 0) pc.orgasm();
	}
	//Some libido boostage here!
	pc.slowStatGain("libido",3);
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}
	
//Dudes Get Rode and Stang in the Taint repeatedly!? Maybe. [DONE] (-F) [edited]
//Requires dick that'll fit!
public function dudesGetStangRoad():void {
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	// clearOutput();
	//Set x to appropriate wang
	var x:int = pc.cockThatFits(enemy.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	//HP Lawse
	if(pc.HP() <= 0) {
		output("Collapsing in a heap, you realize that you’ve been defeated. You can’t even summon up the strength to struggle up to a sitting position; when you try, you get about halfway up before flopping back down uselessly.");
		output("\n\nA smooth, honeyed voice teases, <i>“Awww, I didn’t WANT to have to hurt you. I guess I’ll have to be extra nice to you to make up for it, huh?”</i> Her black-hued lips curve into a knowing smile. <i>“First, let’s get you in the mood, lover" + pc.mfn("-boy","-girl","") + ".”</i>");
		if(!pc.isNude()) output(" Nimble fingers reach into your [pc.gear], stripping you down to full nudity in the blink of an eye. If the air weren’t so goddamn warm and humid you’d probably be cold, but the sticky-hot atmosphere feels better naked, somehow.");
		else output(" Nimble fingers strip away the little equipment you carry on your nude body, depriving you of even the usage of simple tools like your codex. You are defenseless with nothing but the humid air to clothe you, but the cloying atmosphere feels so right on your exposed [pc.skinFurScales].");
		output(" A nervous shudder works through your beaten body as you try to come to grips with your predicament, gasping in deep breaths of the zil-girl’s pervasive scent.");
		
		output("\n\nThe alien’s aroma quickens your pulse and stiffens [pc.eachCock] slightly, coloring your [pc.skin] with additional bloodflow as a touch of arousal worms its way past the pain occupying your mind. Still, you’re a long ways from hard right now, and the victorious woman knows it. Even when she stands astride you, letting you gaze at her golden cunt as it oozes honeyed moisture, you barely get to half-mast.");
		output("\n\nHer voice growls, <i>“You can do better than that. Let me show you.”</i> She squats just above your crotch and begins to play with herself, letting her amber lovejuice spill out to splatter over your [pc.cocks], glazing them as they twitch and grow a little bigger. Too late, you realize that this lewd show was little more than a distraction, meant to give you something to watch while her insectile abdomen moves into place, its razor sharp stinger tickling the skin under your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.sheath " + x + "]");
		output(", just above your [pc.asshole]. She does not give you an opportunity to react to the accidental brush and flexes inhuman muscles, pushing her bulbous back half down to force that venom-laden needle directly into your taint, stabbing it home with a thrust forceful enough to bury it completely inside you.");
		
		output("\n\nYour eyes cross from the onslaught of fresh pain, and your body squirms, twisting slightly until you realize the movement only makes it hurt worse. As you settle down, you realize with surprise that in comparison to your other injuries, it doesn’t hurt all that much. Sure, you’d rather not have been stuck with such a large needle in such a sensitive place, but at least her slender stinger seems to have been designed to operate with a minimum of injury.");
		output("\n\n<i>“Shhh... shhh... calm down, lover. I’m just going to make you forget all about those injuries so we can focus on what’s important,”</i> the wasp-like woman coos as she takes [pc.oneCock] in her hand and begins to stroke. Her expression slackens slightly, and she mutters something about ‘not holding it back anymore’. There’s no time to question her over it, because you’re suddenly growing inexplicably warmer. The air was hot before, but now you’re just as hot, if not hotter, and your crotch is the hottest part of all. You can feel it flowing into you where she stung you, making your [pc.skin] feel taut, tingly, and sensitive. You feel like your suddenly rock-hard shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" could melt into magma at a touch, and you realize that you don’t care if ");
		if(pc.cockTotal() == 1) output("it does");
		else output("they do");
		output(". You want to fuck everything. You want to see how hot your swollen rod");
		if(pc.cockTotal() > 1) output("s");
		output(" can get.");
		
		output("\n\nPulling out of you, the zil-girl smirks down at your increasingly impassioned body, giving your [pc.cock " + x + "] another affectionate squeeze. You eagerly moan and lift your [pc.hips] against her hand, too horny to do anything but copulate with her palm in your rapidly deteriorating mental state. Perhaps this is what rutting beasts feel like - desperate to hump, fuck, and breed with any willing, wet hole.");
	}
	//Lose Via Lust
	else
	{
		output("Dropping down to your [pc.knees] ");
		if(!pc.isNude()) output("you tear out of your [pc.gear],");
		else output("you strip out of the little gear you carry,");
		output(" propelled by mounting desire too strong to understand or consider. [pc.EachCock] trembles with aching, complete need, and you flop down on the ground, grabbing ");
		if(pc.cockTotal() == 1) output("it");
		else output("one");
		output(" to stroke, jacking yourself off right there while the victorious wasp-woman looms over you. Her shining onyx lips curl into a smile as she watches you, but her armored, chitinous ‘boot’ kicks your hand away from your needy boner.");
		output("\n\n<i>“You think you’re horny now, do you?”</i> she asks with an imperious sneer.");
		output("\n\nYou nod and try to start up once more with your other hand, but she pins your wrist to the ground under her foot. You vainly twist and thrash against her as she stands over you, her fingers busily pumping away at her sodden quim, dribbling flecks of honeyed lovejuice onto your [pc.chest] and chin. There’s no escaping it, though; you’re so turned on that your muscles feel like quivering jelly, and she seems vastly more in control of herself than you. You slump down, [pc.hips] giving futile little twitches.");
		output("\n\n<i>“Do you want to taste real arousal? Lust so powerful it’ll make my wonderful pheromones seem like a match next to a bonfire?”</i> the zil beauty coos, not really expecting an answer. <i>“Do you want to feel ecstasy so potent that your cock</i>");
		if(pc.cockTotal() > 1) output("<i>s will feel like they have </i>");
		else output("<i> will feel like it has </i>");
		output("<i>to fuck anything and everything? Do you want to cum from feeling a gentle breeze on your skin?”</i> She frigs herself a little harder, making sure that you’re getting a thick dosage of her mind-dulling, dick-swelling pheromones. She knows you’ll agree. The question is just how long she’ll have to sit here making you smell her twat before you do.");
		output("\n\nLicking her juices from your lips, you do the only thing you can in this situation, nod your head and hope that this means she’ll let you touch your dick, or better, mount you.");
		
		output("\n\nThe wasp-woman bends over you to breathily whisper in your ear, <i>“I knew you’d make the right call, lover.”</i> She nips at the bottom of your ear before kissing her way down your jawline, over your cheek, and then over to give you a lingering kiss. The sensation of the soft, pillowy feel of plump lips against your own is what you could only call divine, and her long tubular tongue slips inside your mouth to writhe and wriggle excitedly. You’re so aroused by this point that the oral tryst has your complete and total attention, even if your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" twitching along with your heartbeat and leaking on your [pc.belly]. A slight, barely noticeable scratch below your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.sheath " + x + "]");
		output(" and above your [pc.asshole] is felt, but you’re too busy to care. If only you had the capacity to think about it, you’d realize that her insectile abdomen is dipped down towards your taint with her stinger out of view.");
		
		output("\n\nYou aren’t given the chance to puzzle it out. She flexes inhuman muscles, pushing her bulbous back half down to force that venom-laden needle directly into the sensitive bridge between crotch and anus, stabbing it home with a thrust forceful enough to bury it completely inside you. Whimpering into her lips, you briefly squirm at the intruding pain, steadying yourself a moment later when you realize that twisting only makes it worse. It doesn’t really hurt that badly, but it took you completely by surprise. You steady yourself as the smirking woman breaks the kiss with a grin.");
		output("\n\n<i>“I always wondered what would happen if you gave someone a full dose while they were this horny. Hold onto your </i>");
		if(pc.balls > 0) {
			output("<i>ball</i>");
			if(pc.balls > 1 ) output("<i>s</i>");
		}
		else output("<i>cum</i>");
		output("<i>, lover,”</i> the armored seductress commands as her face visibly relaxes, mouth opening in something approaching relief. You feel something warm and wet pouring out into your body, just behind your crotch. The throbbing hurt around her stinger melts away almost instantaneously into a simmering warmth that races through your body like wildfire. One moment, your crotch and [pc.butt] are getting so warm that they feel as if they’re about to melt, and the next, every square inch of your [pc.skin] is tingling and flushed, so sensitive that you can’t stop your hands from playing across your [pc.chest], smearing in the honey that this heavenly creature has anointed you with.");
		
		output("\n\nThe jungle air was already beyond warm, but you’re even warmer now. As a matter of fact, with every passing second, you feel hotter and hotter. It’s like your body is burning thanks to the fuel she’s injecting into you, transforming into a creature of searing fire and scorching sex. Your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is so hard and sweltering that it feels like it ");
		else output("are so hard and sweltering that they feel like they ");
		output("could melt solid stone into butter with ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" torrid touch, and you want to try. You could get off on fucking anything right now. You want... no, <i>need</i> to fuck something - a wet hole, a hand, a pair of tits, an asshole, the subtle jungle breezes that feel like lips as they glide across the surface");
		if(pc.cockTotal() > 1) output("s");
		output(" of your aching member");
		if(pc.cockTotal() > 1) output("s");
		output("....");
		
		output("\n\nPulling her stinger out of you, the female zil watches you with an expectant eye, noting the way [pc.eachCock] bobs and jumps, dripping and oozing as you experience desire that would put a rutting beast to shame. You look pleadingly at her as you quiver and writhe, every part of your body tingling with sensuous heat and absolutely needing to be touched.");
	}
	//Merge
	output("\n\nShe plunges two fingers into herself as she watches you, panting, <i>“Now you’re in the proper mood, eh, lover?”</i> Her black, alien eyes observe your crotch’s senseless, aroused convulsions, watching the way her aphrodisiac is affecting you and loving every minute of it. Her right leg quivers slightly as her own pleasure grows, and she bites her lip for a second, considering her options. She doesn’t take long to come to a decision. An expression of amused excitement settles on her smooth, delicate visage as she removes her hand and kneels down over you, her excited mons dripping her delicate honey over your [pc.cock " + x + "].");
	output("\n\nTo you, the falling honey feels more like tiny, molten amber fingertips, slipping and sliding over your girth");
	if(pc.cockTotal() > 1) output("s");
	output(" and leaving a tingling, pleasant residue in their wake. Where you’ve been gilded with sticky-hot love, the tongues of air you’ve been feeling flicking across your over-sensitive length transform into velvet-soft folds of disembodied pussy, teasing you with the way they slowly roll and press their phantom friction against you. Your [pc.cock " + x + "] is oozing so much pre-cum that it’s begun to tint [pc.cumColor] with leaking [pc.cum]. The pleasure is going to make you blow any second now, just from having a few drops of her pussy’s love-honey fall upon you.");
	output("\n\nThere’s so much pleasure everywhere that you arch your back and let your freed hands roam over your [pc.skinFurScales], feeling the ecstasy well up within you.");
	if(pc.balls > 0) {
		output(" Your [pc.balls] twitch");
		if(pc.balls == 1) output("es");
		output(" in your [pc.sack] as ");
		if(pc.balls == 1) output("it churns");
		else output("they churn");
		output(" out more and more of the [pc.cum] you’re about to shoot.");
	}
	else output(" Your middle clenches, and your body races to release the [pc.cum] you feel building up within you, about to explode.");
	output(" Then, the simmering, phantom warmth you’ve been feeling is replaced with a glove of the most sensual liquid fire, enclosing you in a tightly-compressed glove of orgasmic gratification, squeezing down on you just as hard as your cock is flexing through its climax.");
	pc.cockChange();
	
	output("\n\n<i>“Give it all to me,”</i> the zil coos as her pussy ");
	if(pc.cockVolume(x) <= enemy.vaginalCapacity() * .5) output("contracts, vacuum-tight around your girth");
	else output("looks almost painfully stretched around your girth, so tight that it doesn’t look like a single drop will slip out");
	output(", the inner walls wringing around your expanding tip while you cum inside her. Whether your orgasm was brought on by the pervasive musk or the sensitivity-enhancing aphrodisiacs doesn’t matter to you. What does matter is how glad you are that she slid down on you as you were starting to cum, all so that you could feel your [pc.cock " + x + "] ecstatically erupt inside the volcano of bliss that is her pussy.");
	//Used to track cunt tail usage!
	var gobbled:Boolean = false;
	//Add dick cumming into tailcunt
	if(pc.cockTotal() > 1) {
		if(pc.hasTailCunt())
		{
			var y:int = pc.cockThatFits(pc.tailVaginaCapacity());
			if(y == x) y = pc.cockThatFits2(pc.tailVaginaCapacity());
			//Coverin' muh bases.
			if(y == x) y = -1;
			if(y >= 0)
			{
				gobbled = true;
				if(pc.cockTotal() == 2) output("\n\nYour extra erection");
				else output("\n\nOne of your extra erections");
				output(" is stopped from spraying its load over your [pc.fullChest] by the sudden appearance of your [pc.tail]. The prehensile, vagina-tipped appendage slams itself down on the fountaining boner just in time to ");
				if(pc.cumQ() < 100) output("wring you dry, running muscular contractions up and down your length until every single drop has been devoured by your [pc.tailgina].");
				else if(pc.cumQ() <= 500) output("fill with [pc.cum]. It tries to pull as much of it inside as possible with ring-shaped contractions of its many internal muscles, but there’s just so much that trickles leak out its of its lube-leaking nether-lips.");
				else output("bloat with [pc.cum]. It doesn’t even try to drink it all down. It just holds itself on your cock, letting the phallus pack every single internal fold and crevasse while the excess pressure drains out over your already slicked loins.");
				output(" It’s like being able to fuck two women at once while being fucked yourself, and the sensations assault your mind, making it difficult to focus on anything but feeding both pussies full.");
			}
		}
		//TO DO: Add extra dick cumshot. (Not gobbled by cunt tail or 2 and 1 gobbled)
		if((!gobbled && pc.cockTotal() == 2) || (gobbled && pc.cockTotal() == 3))
		{
			output("\n\nThreading between the zil’s sweat-oiled asscheeks, your extra penis bounces its shaft off the eager female’s asshole as it erupts, firing a [pc.cumColor] geyser out of her curvy glutes to ricochet off her big, wasp-like abdomen and rain down over her well-rounded derrière. Her supple flesh squeezes down around you, whether from pleasure, desire, or instinct, you cannot say, but it makes you cum all the harder");
			if(pc.cumQ() >= 200) output(", painting everything between her stinger and her thighs in a thick layer of [pc.cum]");
			output(".");
		}
		//TO DO: Add multicock cumshot
		else if((!gobbled && pc.cockTotal() > 2) || pc.cockTotal() > 3)
		{
			output("\n\nThreading between the zil’s sweet-oiled asscheeks, your plentiful erections writhe against each other in excitement. They even bounce off her puckered backdoor as they cum, exploding like a bevy of garden hoses, each firing its stream directly into the zil’s big, wasp-like abdomen. The ropes of [pc.cumColor] deflect off her carapace to splatter down over her posh derriere. Her cheeks squeeze down, whether from pleasure, desire, or instinct, you cannot say, but it makes you cum all the harder");
			if(pc.cumQ() >= 200) output(", painting everything between her stinger and her thighs in a thick, many-layered ooze of [pc.cum]");
			output(".");
		}
	}
	//TO DO: Add vagina play
	if(pc.hasVagina()) 
	{
		output("\n\nYour puss");
		if(pc.totalVaginas() > 1) output("ies");
		else output("y");
		output(", poor, hungry, eager twat");
		if(pc.totalVaginas() > 1) output("s");
		output(", ");
		if(pc.vaginaTotal() == 1) output("is");
		else output("are");
		if(!pc.isSquirter()) output(" dripping");
		else output(" squirting");
		output(" [pc.girlCum] with wild abandon. ");
		if(pc.vaginaTotal() == 1) output("Its ");
		else output("Their ");
		output("walls clench down and spasm with rhythmic, pulsating motions, desperate for penetration and completely denied. You can’t even reach ");
		if(pc.vaginaTotal() == 1) output("it");
		else output("them");
		output(" with the insectile succubus milking you so effectively: her well-stuffed quim and shining thighs make an impossible barrier. You’ll just have to handle the delirium-inducing levels of female desire while you cum your brains out.");
	}
	//Cocktail + cunt! (CAN’T BE USING CUNT TAIL)
	if(!gobbled && pc.hasVagina() && pc.hasCockTail())
	{
		output("\n\nZipping in to the rescue, ");
		if(pc.tailCount > 1 && pc.vaginaTotal() == 1) output("one of ");
		output("your wildly ejaculating cock-tail");
		if(pc.tailCount > 1 && pc.vaginaTotal() > 1) output("s thrust");
		else output(" thrusts");
		output(" up and directly into your needy twat");
		if(pc.tailCount > 1 && pc.vaginaTotal() > 1) output("s");
		output(", stuffing you full of your own quivering, spurting warmth. It’s even better than the honeyed hole that’s drinking from your other snatch-filler; you can feel this one from both ends, both receiving the [pc.cum] filling inside you and getting to feel your [pc.cockTail] absolutely give in to your " + ((pc.tailCount <= 1 || pc.vaginaTotal() == 1) ? "[pc.vagina]" : "[pc.vaginas]") + ".");
		//Stretch appropriate cunt{s}!
		for(var z:int = 0; z < pc.totalVaginas(); z++) {
			//If you got enough tails to fill that cunt, STREEEETCH IT
			if(z+1 <= pc.tailCount) {
				pc.cuntChange(z,pc.cockTailVolume());
			}
		}
	}
	output("\n\nThe all-consuming pleasure and arousal causes each ejaculation to blend into the next until it feels like you’re shooting one long, continuous strand of liquid relief directly into the wasp-woman’s ready womb. Crying out, your voice loudly announces to anyone and everything in the surrounding jungle that you’re having the most exquisite climax of your life. There’s no way you could not vocalize your bliss, given how beautiful this ejaculatory nirvana is.");
	if(pc.cumQ() <= 50) output(" Even when you run out of [pc.cum] to shoot and come down a little from your high, your [pc.cock " + x + "] remains as hard as a rock.");
	else if(pc.cumQ() <= 150) output(" Even when you cum enough to give her uterus a thorough seeding, you never come down enough to go limp. Your [pc.cock " + x + "] seems perpetually hard as rock.");
	else if(pc.cumQ() <= 2000) output(" Even when you’ve raised a decent-sized bump in her belly from the massive [pc.cum]-injection and let your orgasm ebb, your [pc.cock " + x + "] remains perfectly hard.");
	else if(pc.cumQ() <= 10000) {
		output(" Even when you’ve gifted the alien a ");
		if(pc.cumQ() <= 4000) output("noticeable");
		else output("huge");
		output(", gravid belly and let your orgasm end, your [pc.cock " + x + "] remains as hard as a rock.");
	}
	else output(" Even when you’ve turned the alien’s belly into a [pc.cum]-packed dome and raised the pressure to the point where the excess is squirting out of her nether-lips in orgasmic torrents, your cock remains rock-hard. Not even your fading orgasm will allow it to wilt.");
	output(" You sigh in an odd mixture of contentment and unwavering desire, as eager to fuck as you were a moment ago.");
	output("\n\n<i>“Mmm, that’s a good start. Let’s see if you have more left inside you, shall we?”</i> the black-lipped lady wonders aloud.");
	
	output("\n\nNodding, you brace yourself, ready to thrust against her thoroughly creampied cunt, but instead of getting the fuck you were anticipating, you get a sudden, stabbing pain right under your [pc.cocks] again. The discomfort fades even faster, immediately and totally replaced with a burning need to cum, to deposit your load directly into this vixen’s well-fed vagina again and again. You were ready to fuck her to a second orgasm before, but now you’re already back at the cusp again!");
	
	output("\n\nThe venom is doing its work, and the wasp-woman doesn’t even bother to pull her stinger out this time. She just starts grinding herself in slow, circular motions above you, moaning and occasionally letting more of her too-potent venom slip directly into your lusting, aphrodisiac-possessed body. She’s wet enough to make a jacuzzi jealous and so warm that the lava-creatures of Surtur would feel cold in comparison. Her vocalizations of pleasure are high-pitched and melodious, and just listening to her is nearly enough to get you off once more.");
	
	output("\n\nYour vision swims, and you close your eyes before you can become nauseous, not trusting your traitorous sight. The only sense you really need right now is touch. Your spastically throbbing cock");
	if(pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" proof enough of that! Guiding your hands up to her armored thighs, you give in to your subconscious, rut-focused desires and steer her motions to ensure the maximum amount of contact between the alien and yourself. She’s using her venom to control you like a remote-activated sex-toy, and you’re more than content to give her the vibrations she craves, and you finally manage to find the strength to start bouncing her atop you, feeling her lips cling to you as she slides back down, mixed juices spraying out around her as she bottoms out.");
	
	output("\n\nThe slapping of your paired hips connecting, mashing your genitals feverishly against each other, rings out through the jungle while the drug-fueled tryst continues. You feel neither hunger, nor thirst, nor fatigue as you fuck, tirelessly inseminating the zil woman’s fertile slit again and again. Each time she ensures that you stay hard and ready, and each time you fuck her until you experience an orgasm so powerful that you start blacking out after each one.");
	output("\n\nThere is only the hot, wet pussy and your molten need, meeting again and again until you stop thinking entirely, tirelessly pounding away with eager efficiency long after you go dry...\n\n");
	//Orgasm like, 20 times.
	var i:int = 0;
	for(i = 0; i < 17; i++)
	{
		enemy.loadInCunt(pc, 0);
		pc.orgasm();
		if(i < 6 && rand(3) == 0) pc.orgasm();
	}
	tryKnockUpFZil();
	processTime(200+rand(60));
	pc.orgasm();
	//Raise libido .5 to 5 points depending on libido.
	pc.slowStatGain("libido",3);
	if (!inCombat())
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}

//Forcey Face Sitting [DONE][edited]
//-Fen
public function forceyFaceSittingFromFemzil():void {
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	// clearOutput();
	// HEALTH POWAHHHHHHH LAWS
	if(pc.HP() < 1) {
		output("Prone on the ground, your body aching in pain, you look up at the victorious zil female as she advances towards you. A confident smile twists her sable lips.");
	}
	//LUST
	else {
		output("Tearing out of your [pc.gear] to get at your ");
		clearList();
		if(pc.hasCock()) addToList("[pc.cocks]");
		if(pc.hasVagina()) addToList("[pc.vaginas]");
		if(pc.hasNippleCocks()) addToList("[pc.dickNipples]");
		else addToList("[pc.nipples]");
		if(pc.hasTailCock()) addToList("[pc.tailCock]");
		else if(pc.hasTailCunt()) addToList("[pc.tailgina]");
		//(if no other)
		if(!pc.hasCock() && !pc.hasVagina() && !pc.hasNippleCocks() && !pc.hasTailCock() && !pc.hasTailCunt())
			addToList("[pc.asshole]");
		output(formatList() + ". You writhe in lust, desiring nothing more than to fuck and touch and love and cum with this beautiful alien... or your hand; whichever brings you off first.");
	}
	//MERGE
	output("\n\n<i>“It’d be impolite not to take advantage of you, even if you are a" + (pc.race() == "zil" ? " strange-looking zil" : "n off-worlder") + ",”</i> she says as she sits down to straddle your [pc.chest], running an oil-colored fingertip up under your chin to make you look her in the eyes. <i>“I don’t think you deserve to mate with me though.”</i> She grabs you by the cheeks and swivels your head this way and that, considering you like a piece of meat. <i>“No, that wouldn’t do. You barely put up a fight. Barely worthy to clean me.”</i>");
	output("\n\nThe domineering alien’s shadow falls across you as she shimmies forward, inadvertently rubbing across your [pc.nipples]");
	if(pc.hasNippleCocks()) output(" and squeezing your [pc.nippleCocks] off with her asscheeks along the way");
	output(", bringing her dewy slit to sit just above your neck. Its honey escapes in a slow trickle. Despite her harsh words, this woman has obviously become aroused by your presence. A short-cropped tuft of downy-soft fuzz sits neatly above the inflamed mound, and the whole of her crotch just smells so goddamned good. If you were standing right now, your [pc.legs] would be giving out from underneath you. There’s just something so sensual and right about the aroma, even if it’s laced with the sweetness of her juices and cloys at your nose.");
	output("\n\nYour eyes cross to look closer at her sodden delta, mouth salivating in eager anticipation of the smallest touch, but the wonderfully arousing box stays just out of reach. Onyx-armored fingers appear on either side of her pussy, spreading apart to open up that honeyed cunt and release a cloud of musky, arousing pheromones directly at your nose. You shudder and groan, your ");
	if(pc.hasCock()) output("[pc.cocks] tenting in engorgement");
	else if(pc.hasVagina()) output("[pc.vaginas] immediately turning soupy with lust");
	else if(pc.hasTailCunt() || pc.hasTailCock()) 
	{
		output("[pc.tail] thrashing about wildly as your ");
		if(pc.hasTailCunt()) output("[pc.tailgina] drips everywhere");
		else output("[pc.cockTail] surges out of its coating, already rock-hard and dripping");
	}
	else output("[pc.asshole] clenching wildly, hungry for penetration");
	output(". Of course, you have to take a deep breath after that, sealing your fate. The pheromones pouring off her cunt have worked you into a");
	if(pc.lust() >= pc.lustMax()) output("n even greater");
	output(" frenzy, one that has you ready to do anything just to plunge your face into that glorious, golden pussy and bathe it with your tongue, luxuriating in its heavenly scent.");
	output("\n\nGiggling, the zil perched atop you asks, <i>“See something you like, off-worlder?”</i> She sticks a finger inside herself before pulling it out to hold under your nose, giving you a nice big whiff. When you sigh and lean forward to lick it, she playfully dodges, wiping it off on the bridge of your nose.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You flick out your extra-long tongue experimentally, but the zil just catches it and tuts at you disapprovingly.");
	output(" <i>“Silly, weak " + pc.mf("thing","slut") + ", getting turned on by the big bad wasp’s naked, glistening, beautiful entrance, helpless to do anything but ogle it and breath in its arousing pheromones. The best part is that you know I’m not going to get you off, but you’re just too turned on to care. Isn’t that right?”</i>");
	output("\n\nYou nod, craning your neck forward to try and get her pussy; it’s so close yet so far away. Yet, when you’re finally at the limits of your spine and just about to make contact, she scoots back half an inch.");
	output("\n\n<i>“Not yet. Not until you beg, alien,”</i> she promises.");
	
	output("\n\nPushed past to the edge of sanity by want and desire, you immediately ");
	if(!pc.cockTotal(GLOBAL.TYPE_CANINE) > 0) output("call");
	else output("bark");
	output(", <i>“Please! Please let me lick your pussy! Ride my face! I want it so bad!”</i>");
	output("\n\nThe zil cocks her head to the side and says, <i>“Hmmm, not quite good enough, I think.”</i> She idly plunges a finger inside herself, stirring the air with the scent of fresh love and delivering a whole new symphony of pheromonal desire to your rapt olfactory sense. <i>“That won’t do at ALL. You need to beg me properly. When you’re willing to risk your life for a taste of my nectar, then I’ll consider letting you lick me.”</i> A trickle of amber goodness falls onto your [pc.chest], tingling hotly, and you know what you have to do.");
	output("\n\nYour voice is ragged with desperation as you beg again, <i>“Please, give me your cunt, Mistress! Feed me your pussy. Smother me in it until I learn how to breathe your juices and nothing else. Just give me a taste! I’ll follow you around and lick you for hours every day, just for one taste!”</i>");
	output("\n\nSmiling, she pats you condescendingly on the head. <i>“That’s more like it. I hope you’re ready.”</i>");
	output("\n\nA hint of awareness nags at you for what you’ve just promised, but you bury it under mountains of lust as the zil starts to move.");
	
	output("\n\nGrabbing you by the " + (pc.hasHair() ? "[pc.hair]" : "head") + " in a double-handed grip, the aphrodisiac-perfumed woman pulls you up at the same moment that her hips slam forward. A lurid squelch echoes through the jungle as the zil’s musky quim smashes against your face, smearing over your nose, leaving trickles of fragrant wetness over your cheeks and chin. Your neck strains to press you back into her sodden box, finding a perverse balance with the two of you grinding upon one another, lips to lips and spit to cum. You thrust your [pc.tongue] with unrepressed eagerness, diving straight into the honeyed slit in order to bathe your tastebuds with its ambrosial flavor.");
	
	//Long tongue bonus!
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG))
	{
		output("\n\nThere’s so much to your oral organ that heartbeats tick by while you’re pushing it all into her, enjoying the sounds of her gasping enjoyment as you thrust inside. She’s surprisingly deep, but you you eventually find her cervix - a tight little hole fairly dripping with honey. You let your tip make slow circuits around it, feeling it flex and clench in response while the thick base of your organ rolls around this slippery channel’s entrance.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" Showing just how talented you are, you twist your muscle into a helix shape that presses on her walls from all sides, and with a deft flex expand it outward, stretching her open so that the honey can ooze out directly into your waiting [pc.lips].");
	}
	
	output("\n\nClamping her legs down around your head, the zil moans, <i>“That’s gooood work.... Mmm, you weaklings always lick so well once I give you some proper motivation. Don’t slow down now, we’re just getting started.”</i> Her stinger brushes against your [pc.hip] threateningly, and you increase your efforts accordingly, rubbing your nose back and forth against her sweet little button, feeling it catch and bounce among its silken folds. Its owners voice jumps an octave in a high-pitched screech of pleasure, <i>“Yesssss! Tonguefuck me, you horny slit-slave. Lose yourself in my taste like you lost the fight!”</i> She lifts her hips to grind hard against you. <i>“This is what you were meant for - serving pussy, licking and lapping and only breathing when your betters allow you to!”</i>");
	
	output("\n\nAbruptly, she pulls her herself away, filling your swimming vision with the scintillating web of honey that hangs between the two of you. You gasp for breath, seeing stars among the amber strands from going so long without breathing, and before you can pull in another, she’s pressing back down on top of you, forcing you right back into servicing her superior slit. You cannot help but hum in relief and excitement at such a speedy return, and as her juices run down your tongue, your body lights with a placid, subservient pleasure. The realization that you’re serving her so well combines with the lusty high her pheromones have forced upon you to settle in an orgasmic balm. It isn’t a proper climax, but there is a palpable feeling of warm, happy contentment running under your frenzied need you feel to service her oozing quim.");
	
	output("\n\nThe chitin-armored beauty giggles and " + (pc.hasHair() ? "strokes your [pc.hair]" : "pats your head") + " happily. <i>“I might have to keep you a-ah-ahhh... mmm... around for a while if you lick like this.”</i> She shivers in pleasure. <i>“Hold still, I’m going to shift position and give you a REAL faceful.”</i> She lifts herself up, separating you from the golden treasure lurking between her black-armored thighs for a moment while she turns about, and then, she’s lowering herself back down with her ass above your forehead and her cunt angled back towards your mouth. She presses down, smothering you between her thick, hard thighs and the softness of her ass, her insectile abdomen hanging off behind you. It bobs noticeably whenever you lick a particularly sensitive spot.");
	output("\n\nYour face is being used like a cheap sextoy and denied air for so long that your vision would be swimming if she weren’t blocking the light with her soft, cushy ass-cheeks. Thrashing about inside her, your tongue goes wild, hurriedly trying to bring her off before you choke to death on her delicious... wonderful... sticky... mmm... cunt-juice. It’s getting hard to focus, but you manage to make your trembling lower [pc.lip] quiver against her clit as you near the edge of passing out. The worst part is that it’s getting harder to care if you die like this, tongue-deep in a beautiful alien twat, denied release and yet still loving every minute of it.");
	output("\n\nThe moan of exquisite relief from up above doesn’t even register above the sound of your heartbeat hammering in your ears, but the feeling of your mouth suddenly flooding with the most delicious honey you’ve ever tasted does get your attention. You gulp it down eagerly, too deadened by oxygen deprivation to realize that she’s cumming and figuring that you might as well die with this heavenly taste on your [pc.lips]. You swallow, and swallow, and swallow until you’re swallowing nothing but air. It takes a second for your burning lungs to assert themselves, but when they do, you drag in a huge breath of fresh, pussy-flavored air, noisily coughing and sputtering as honey drips across your forehead.");
	
	output("\n\nThe zil is standing over you and busily running her fingers through her well-lubricated box, flicking the excess moisture down at you as you try to catch your breath. Her voice melodiously calls out, <i>“Not too bad, all things considered. Maybe we’ll meet again, but I’d rather fight someone who proves " + pc.mf("him","her") + "self worth breeding.”</i> She stalks off, leaving you there to recover, something that takes a while given the way your head is pounding. The ache in your jaw and [pc.tongue] is almost as bad.\n\n");
	//Pass an hour+rand(20);
	//Max lust, then take off 5.
	pc.maxOutLust();
	processTime(60+rand(20));
	pc.girlCumInMouth(enemy);
	pc.girlCumInMouth(enemy);
	pc.girlCumInMouth(enemy);
	pc.lust(-5);
	if (!inCombat()) 
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else CombatManager.genericLoss();
}

//Win Menu
//-Fen
public function defeatHostileZil():void {
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	// HP
	if(enemy.HP() <= 0) {
		output("The zil girl collapses in the face of your superior prowess, face down, ass up, and panting heavily as she tries to recover from the hits she’s taken. While her bulbous, stinger-tipped tail obscures her rear entrance and scented honeypot from view, you know they’re still there.");
		output("\n\nHer faint voice rouses you a second later when she faintly mumbles, <i>“You win, off-worlder. By custom, I am yours to " + pc.mf("seed","use") + ".”</i>");
	}
	// Lust
	else {
		output("Sighing needily, the wasp-girl’s hand dives back between her legs, digging her fingers knuckle-deep into the simmering slit in an effort to quench the excitement you’ve stoked within her. She moans as she realizes how futile an effort it is, dropping down onto all fours to present herself more perfectly for you. Her voice escapes in a needy pant, <i>“I yield to you.");
		if(pc.race() != "zil") output(" You’re more like... like us than you let on, traveler.");
		else output(" Mmm... you may claim me now, zil.");
		output("”</i>");
		//Raise lust to 33 if below and continue:
		if(pc.lust() < 33) pc.lust(33-pc.lust());
		output("\n\nShe’s practically begging for it at this point.");
	}
	output("\n\nYou could use her own bandoleer of drugs to really punish her.");
	//DISPLAY SEX OPTIONS
	clearMenu();
	//Force Her To Lick YOUR Honeypot
	if(pc.hasVagina()) addButton(0,"ForcedLick",forceFemzilToLickYourHoneypot);
	else addDisabledButton(0,"ForcedLick","Forced Lick","You need a vagina for this.");
	//Dose and Masturbate Her With Her Own Sex Drugs (open to all) - done Z
	//requires having fought a hostile female zil once already
	addButton(1,"UseHerDrugs",DoseAZilWithSexDrugsEvillyMustacheTwirling);
	//Clit version
	//Req's clit 3.5" or longer!
	if(pc.hasVagina() && pc.hasClit() && pc.clitLength >= 3.5) {
		output(" You could also do that AND fuck her with your clit.");
		addButton(2,"MeanClitFuck",numbPussyFuck,false);
	}		
	else addDisabledButton(2,"MeanClitFuck","Mean Clit Fuck","You need a vagina with a large enough clit for this.");
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity()) >= 0) {
		output(" You could punish her with her toxins and fuck her with your dick too.");
		addButton(3,"MeanCockFuk",numbPussyFuck);
	}
	else addDisabledButton(3,"MeanCockFuk","Mean Cock Fuck","You need a penis that can fit her vagina for this.");
	if(pc.biggestCockLength() >= 36) {
		output(" Then again, there’s always the option of smothering her in your giant, hyper-sized dick and letting her get a feel for a REAL cock.");
		addButton(4,"HyperSmothr",smotherDatBeeSlutInDickYo);
	}
	else addDisabledButton(4,"HyperSmothr","Hyper Smother","You need an extremely large enough penis for this.");
	//Cuff&Fuck
	cuffNFuckButton(5, enemy);
	//Femzil prompt
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.vaginalCapacity()) >= 0) addButton(6,"Dick Fuck",normalZilgirlCockfuck);
		else addDisabledButton(6,"Dick Fuck","Dick Fuck","You need a penis that can fit her vagina for this.");
	}
	else addDisabledButton(6,"Dick Fuck","Dick Fuck","You need a penis between your legs for this scene.");
	if(pc.hasKeyItem("Capture Harness") && flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] == undefined) {
		addButton(9,"Capture",useTheCaptureHarness);
		output("\n\n<b>Doctor Julian Haswell wanted you to use a capture harness on a zil. Now would be the perfect time.</b>");
	}
	
	output("\n\n");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Force Her To Lick YOUR Honeypot (DONE -F) (edited)
public function forceFemzilToLickYourHoneypot():void {
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	var x:int = rand(pc.totalVaginas());
	output("Sitting down next to the zil, you lean back");
	if(!pc.isNude()) output(" and remove your [pc.gear]");
	else output(" and casually toss aside the few belongings you bothered to carry on your semi-nude body");
	output(". She casts her gaze ");
	if(enemy.HP() <= 0) output("curiously");
	else output("eagerly");
	output(" in your direction to try and see what you’re doing - or what you plan to do to her. Not wanting to keep her waiting, you lean back, spreading your [pc.legOrLegs] a bit further to expose your [pc.vaginas], and tap at your increasingly puffy entrance.");
	output("\n\n<i>“Here,”</i> you command with authority. <i>“Lick. You can understand that, can’t you?”</i> You press your palm down against your mons");
	if(pc.hasClit())
	{
		output(" to feel the hard bud");
		if(pc.totalClits()/pc.totalVaginas() > 1) output("s");
		output(" of your clit");
		if(pc.totalClits()/pc.totalVaginas() > 1) output("s as they swell ");
		else output(" as it swells ");
		output("up eagerly, firm and sensitive");
	}
	output(". Pulling back, you expose your puffy entrance");
	if(pc.totalVaginas()) output("s");
	output(" to the rapt, attentive creature. <i>“Lick.”</i>");
	
	output("\n\nWith a demure nod, the glossy, armored beauty crawls over to you with surprising meekness. It’s almost like her former sauciness has been switched off. She squirms ");
	if(pc.legCount > 1) output("in between your [pc.legs]");
	else output("over to straddle your [pc.leg]");
	output(", her large breasts swaying delightfully beneath her with every movement. You reach out to grab one, roughly pinching a dusky nipple between your fingertips. A trickle of honey emerges at your touch, and the sweet, sticky fluid coats your fingers. The zil moans huskily, her other breast leaking alongside. You release her with a smirk and press your fingers to her sable lips.");
	output("\n\n");
	showImage("ZilTongueOut");
	output("Tentatively extending her tongue, the fey creature surprises you by opening up the tip of her long muscle to expose its hollow interior, slick with alien saliva. She presses on, enveloping your paired fingers in a cocoon of spit, slipping back and forth in a way that’s cruelly reminiscent of actual sex. She finishes, and her tongue retracts to leave you completely and utterly clean, if a little wet. The oral organ slips back into her mouth like a snake into a hidden burrow. Her eyes twinkle with a sultry glow as she allows the tip to squeeze back out, and she cocks her head to the side questioningly, flicking her eyes meaningfully between your crotch and your face as if asking for permission.");
	
	output("\n\nYou don’t let her or her tongue wander. Grabbing her by the back of her head, you firmly yet gently force her face down to your [pc.vagina " + x + "], feeling her hot, panting breath wash across your labia as she nears. ");
	if(pc.hasCock()) 
	{
		output("[pc.EachCock] flops across the top of her head as she settles in");
		if(pc.balls > 0) output(" with your [pc.balls] on her forehead. ");
	}
	output("She purses her spit-shined ebony lips just in time to plant them upon your nethers in a wet kiss. Her mouth feels so wonderfully warm and wet against you, and her lips... those gorgeously full lips... they form such a perfect seal over you as they slide against your sensitive labia. It feels even better once she sucks a little bit, easing more blood into your already engorged sex and causing your ");
	if(pc.hasClit())
	{
		if(pc.totalClits() == 1) output("[pc.clit]");
		else output("[pc.clits]");
		output(" to swell to full size.");
		if(pc.clitLength > 3.5) {
			if(pc.totalClits() == 1) output(" It nigh-instantaneously fills");
			else output(" One nigh-instantaneously fills");
			output(" your lover’s surprised mouth with a thick helping of ");
			output("girl-rod");
			if(pc.clitLength > 6) {
				output(" and curls down to fill her groaning throat");
			}
			output(".");
		}
		//Big Clits
		if(pc.clitLength > 3.5) {
			output("\n\nThe surprised alien noisily breaks away, accompanied by sudden coughs as she tries to breathe once more. Before you can grow angry at her, she recovers and extends her tongue once more, letting the hollow opening come to rest upon the tip of your [pc.clit], sensuously circling it to keep you in agonizingly intense pleasure. You throw your head back and moan out loud, the zil’s transgressions instantly forgiven in the face of her unique, clit-polishing talent. The longer she keeps it there, the further down it slips, and the more of your female rod you get to feel enveloped in near-frictionless muscle. Her mouth returns to your pussy while her tongue continues to tangle with your super-sized clit. The dual sensations are almost unfathomably pleasant.");
		}
		//Not big clits
		else {
			output("\n\nThe cunt-frenching alien noisily breaks the seal with an abrupt change in her approach. Her lips purse, and her tongue slips out, folded in a ‘u’ shape. The bottom of her slick organ dips right into your [pc.vagina " + x + "], while the tip arches over to find ");
			if(pc.totalClits() == 1) output("your [pc.clit]");
			else output("a [pc.clit]");
			output(". It closes around your tremendously sensitive organ and begins to suck, and the portion of her muscle buried inside lurches, starting to rise and fall along with the pulsing rhythm of suction she exposes your bud to. You throw your head back and moan out loud, the zil’s transgressions completely forgotten under the care of her talented tongue and lips as they resume kissing.");
		}
	}
	else output("\n\nThe cunt-frenching alien noisily breaks the seal with an abrupt change in her approach. Her lips purse, and her tongue slips out and dips right into your [pc.vagina " + x + "]. The portion of her muscle buried inside you lurches, starting to rise and fall along with the pulsing rhythm of suction she exposes your inner walls to. You throw your head back and moan out loud, the zil’s transgressions completely forgotten under the care of her talented tongue and lips as they resume kissing.");
	//Merge
	output("\n\nGrabbing the wanton creature once more, you encouragingly guide the motions of her head, grinding yourself off on her sable slit-kissers. Her face is quickly getting a coat of [pc.girlCum]; it’s most noticable on her plush lips, which appear almost swollen under their many layers of liquid pleasure. Her affections don’t slow or relent either. She seems genuinely interested in giving you the most absolutely pleasurable bout of cunnilingus you’ve ever received. It’s obviously not her first time being forced to serve in such a manner.");
	output("\n\nNoisy slurps and smooches fill the air along with the scent of alien pheromones and musky pussy-scent as she worships your [pc.vagina " + x + "]");
	if(pc.hasClit()) output(", tending to your [pc.clit] with equal desire");
	output(". She already has your [pc.legOrLegs] quivering and your [pc.hips] giving little jerky twitches, making you instinctively hump against her face as she works. Your body is alight with pleasure");
	if(pc.hasClit()) output(", radiating outward from your [pc.clit]");
	output(" as it is fully engulfed and pumped oh-so-pleasantly.");
	if(pc.totalClits() > 1) output(" The busy cunt-slobberer finds another pleasure-organ to touch, and when she does, you screech like a banshee, mashing your [pc.vagina " + x + "] against her hard enough to feel her nose digging into your [pc.skinFurScales].");
	else output(" The busy cunt-slobberer kicks up the tempo, at the same time sliding her tongue almost fully off you, and then she’s pumping it up and down, tongue-fucking you while you start to screech in ecstasy.");
	if(pc.isSquirter()) output("\n\nYour juices spray from [pc.eachVagina] in torrential geysers, soaking the zil’s face in [pc.girlCum] with so much that spatters of drops are starting to glaze her chest. She gulps and swallows as much as she can, but that’s only a tiny fragment of the orgasmic deluge you release, your pussy spasming and squirting until your body goes numb and slack.");
	else output("\n\nYour juices drip directly into the zil’s hungry mouth, giving her a good strong taste of your [pc.girlCum] as your desire plateaus into bliss. She gulps and swallows it all, and she even makes a show of holding her mouth open as you fill it. Her tongue keeps you more than busy enough until your spasming muscles go numb and slack.");
	output(" A happy smile spreads across your face as you come down. You still find the strength to drag her face up and down your slit, painting her with one last layer of your scent.");
	output("\n\n<i>“Not bad,”</i> you remark as you push her into a sitting position. ");
	if(pc.isNice()) output("<i>“You’re totally worth the fight, babe.”</i>");
	else if(pc.isMischievous()) output("<i>“I wish I could get you to do this without having to deal with the trouble of fighting....”</i>");
	else output("<i>“Next time I trust you’ll have the sense to skip the fight and just start licking immediately.”</i>\n\n");
	
	processTime(20+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}
	
//Dose and Masturbate Her With Her Own Sex Drugs (open to all) - done Z
//requires having fought a hostile female zil once already
//kind of evil
public function DoseAZilWithSexDrugsEvillyMustacheTwirling():void {
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("Kneeling beside the zil, you roughly turn her over onto her backside. She looks at you with questioning eyes, but ");
	if(enemy.HP() <= 0) output("makes no move to resist.");
	else output("her fingers continue to work her desperate cunt.");
	output(" Less interested in fucking her than in fucking with her, you unfasten her belt and slip it free from her hips. With a kiss on her mons and two fingers of your own inside her, you absently work the humming zil’s pussy to keep her distracted while you browse her toys.");
	
	output("\n\nOne of the red-painted darts comes free from its clasp, and you experimentally prick yourself with it to confirm your guess. A shallow blush of arousal blooms in you, and you know that this dart is coated in aphrodisiac. The zil smiles at your experimentation and reaches out to take the dart from you, but you hold it away. Renewing your assault on her pussy, you lower the dart to just above her labia.");
	
	output("\n\n<i>“Best to hold still,”</i> you tease, caressing her once with the tip as you work your fingers. The zil tenses up with worry, trying to remain stone-like as you do your best to move her world. Curling a finger, you find a firm spot inside her and rub it; the zil gasps and jerks her hips fitfully, then moans as she realizes what she’s done. The dart sticks from her labia, and the latter begins to color as the aphrodisiac takes effect.");
	
	output("\n\n<i>“Oops.”</i> With a laugh, you pull it free and hold it over her pussy again. <i>“Do better.”</i>");
	
	output("\n\nMaliciously, you finger the zil’s sweet spot again; her whole body quivers as she tries to fight the effects of your touch and the dart. A little reprieve is all it takes to break down her walls; you pause in your fingering and let her recover a moment, then quickly rub the spot once more and the zil, without thinking, thrusts her hips as if fucking your fingers, poking herself twice. Taking the dart away, you cast it aside and grin at the flushed woman. <i>“You’re terrible at this game.”</i>");

	output("\n\nOnce again, you peruse the contents of her belt, this time turning up a little pouch of reddish, chalky mixture similar to what you found painted on the dart. Presumably this is what she uses to rub on another layer of the drugs once the dart’s coating has been used up. Opening the pouch all the way, you greedily lap up the paste with your [pc.tongue]. Before your body can absorb too much of it, you bow your head to the zil’s cunt and push the clitoris free from its hood. Smothering the exposed button with your mouth, you paint over and over it with broad strokes, raising passionate cries from the drugged woman. Her pussy spasms in orgasm and her thighs clasp around your head, but you continue to transfer from your tongue to her without stopping, even as she fills your mouth with wet, honey-flavored girlcum. By the time the tingling in your tongue finally ends, the zil has already climaxed twice more and is looking down at you in a daze, both hands pinching her nipples and sticky with honey.");
	
	output("\n\nOne last foray into her belongings, and you withdraw the largest vial you can find, examining its contents as the zil looks on in exhausted apprehension. The powder half-filling it is the same as the kind you found covering the aphrodisiac darts and in the refill pouch. Smiling, you uncork it and hold it under the wasp-woman’s drooling vagina. <i>“You had better be careful this time,”</i> you admonish, sliding it home. <i>“If this vial fills up with your juices, all this dust will spill out into your pussy.”</i>");

	output("\n\nThe zil shivers as you slip the mouth of the vial in, still squeezing her breasts and helpless before your chemical romance. When you pull it back, a centimeter of fluid already sits atop the dust in the vial, slowly mingling. Deciding that won’t do, you re-angle the vial and agitate as you push it in, trying to mix and stimulate at the same time. The woman’s legs lock as she orgasms again, and a squirt of girlcum hits the wet dust mixture. Shaking the vial inside the zil’s entrance, you milk her climax for all the fluid she has left, collecting another three centimeters and bringing the vial almost to the brim. It’s not boding well for her...");
	
	output("\n\nSlowly sliding the vial out to the rhythm of the zil’s moan, you thrust again, sloshing some of the pussy-and-dust mixture into her. She starts and brings her knees together as the warm, viscous fluid enters, and squeezes her breasts in a vise-like grip. The color of her pussy deepens again somehow as the newest dose of drug takes its hold, and the zil sits bolt upright, looking dead into your face with dilated eyes empty of reason. One sticky hand closes on yours and begins to take over the pace, ramming the vial through her inflamed labia as if to break it. Pulling away, you can see that its contents have mixed completely, a red syrup of cum that gets more diluted with each stroke. The zil orgasms again, tensing up for a minute, then resumes masturbating furiously; after the next climax a pink froth forms around the edges of the glass as she alternately strokes and squirts, coming ever more rapidly as more of the drug ends up inside her.");
	
	output("\n\nExperimentally, you take hold of the bottom of the vial and pull it away from the zil’s pussy; her arm continues to jerk as she tries to outmuscle you, and it’s only with a bit of effort you can get it all the way out. Her entrance is open wide, gasping to be filled, and the zil looks at you with absent eyes, not comprehending why the penetration has stopped. Her other hand pulls free of her breast with halting movements, ");
	if(pc.hasCock()) output("reaching toward your erection as she slides her crotch forward to receive it.");
	else output("joining the other on the vial in a renewed attempt to overpower you and get something inside her once more.");
	output(" You push the glass back into her, and she gratefully smiles at you and begins fucking herself again, the thoughts of mere seconds ago forgotten.");
	
	output("\n\nPainfully aroused and wondering if you’ve condemned the woman to live the rest of her life in mindless servitude to her newly-insatiable cunt, you turn away and leave.\n\n");
	//zeikfried’d
	author("Zeikfried");
	//get 100 lust
	pc.lust(100);
	//maybe become evil
	pc.personality++;
	if(pc.personality <= 33) pc.personality++;
	if(pc.personality > 100) pc.personality = 100;
	//maybe find her again later for enslavings
	processTime(20+rand(10));
	CombatManager.genericVictory();
}

//Numb Her Pussy (req. some form of dick or giant clit that will fit) - done Z
//kind of evil
//var x:int = pc.cockThatFits(enemy.vaginalCapacity());
//if(x < 0 || pc.cockTotal() == 0) x = -1;
public function numbPussyFuck(dick:Boolean = true):void {
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	output("The presumptuousness of this woman stops you in your tracks. The fact that she still assumes she’s entitled to sex after being ");
	if(enemy.HP() <= 0) output("beaten");
	else output("humiliated");
	output(" by you incenses you, but your body thrums with pheromone-induced lust all the same and she smiles knowingly. At a loss to satisfy both your desires to fuck and to punish her, your eyes wander her prone form until they alight on her belt of toxins and darts.");
	
	var x:int = pc.cockThatFits(enemy.vaginalCapacity());
	if(x < 0 || pc.cockTotal() == 0) x = -1;
	if(!dick) x = -1
	
	output("\n\nBurying your intent in mock-affection, you lean down and trace your fingers along her hips, causing the woman to shake her rear enticingly. Reaching underneath and locating the fastenings of her belt, you unlatch it and pull it away from her. She looks over her shoulder curiously as you inspect the contents and pull away a dart. Exposing yourself and holding it over your groin");
	output(" for your prospective victim, you watch the reaction on her face. At the sight of the first dart, she grimaces and shakes her head, and you set it aside. The next dart is answered with another vigorous shake and a limp-wristed pantomime, and, guessing that it contains paralytic toxins, you quietly put it down as well. The third dart you find causes your unsuspecting lover to nod her head and smile, placing her hand over yours, and you warily allow her to guide the dart to the base of your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("[pc.clit]");
	output(" and sink it in. A flood of arousal washes through the area; your ");
	if(x >= 0) output("dick stands on end, more proud and erect than you can remember seeing it recently");
	else output("clit swells to incredible size, resembling a large ruddy-colored dildo more than any feminine button");
	output(".");
	
	output("\n\nExcited by your arousal, the wasp-girl returns to her prone position, raising her ass in the air and lifting her chitin-covered abdomen to expose her needy pussy. An expectant hum fills the air as she anticipates being filled by you, and you place a hand on her hip again as if to steady her for entry. Rubbing her ass to reassure her, you quietly reach over and pick up the paralyzing dart. Before the zil can form a suspicion, you guide it under her pussy and jab upwards, burying the tainted needle into her labia. She jerks half-upright with an alarmed cry, and you quickly grab her between shoulder and neck and jab the dart in, first above one breast and then the other, aiming as close to the armpits as you can get without hitting her chitinous covering. With a pained moan, the zil slackens and her clawing, struggling hands drop numbly to her side.");
	
	output("\n\n<i>“What are you doing, off-worlder?!”</i> she demands weakly, looking over her shoulder.");
	
	output("\n\nPushing her face into the dirt, your mouth spreads in a twisted grin. <i>“");
	if(enemy.HP() <= 0) {
		if(x >= 0) output("Seeding");
		else output("Using");
		output(" you, as is your custom.");
	}
	else if(pc.race() != "zil") output("Suppose I’m just like you after all.");
	else output("Isn’t this the zil way?");
	output("”</i>");

	output("\n\n<i>“That’s... no...”</i> she trails off, robbed of her voice by the toxin. Her jaw hangs half open and a trail of saliva runs into the soil, though her still-alert eyes follow you as you ");
	if(pc.legCount > 2) {
		output("rise from your kneel and mount her, shoving your ");
		if(x >= 0) output("[pc.cock " + x + "]");
		else output("[pc.clit]");
		output(" into her while she quivers under you");
	}
	else {
		output("slide your ");
		if(x >= 0) output("[pc.cock " + x + "]");
		else output("[pc.clit]");
		//[tailCock]}
		output(" into her");
	}
	//lift her leg and slide her onto your nipple-cock
	output(". Her hips shake lazily, perhaps trying to afford her some control of the fuck, but the zil is completely your plaything as you begin to thrust in her. When she realizes she’s completely unable to get any response from her leaden cunt, a low, frustrated, moan rolls out of her throat.");
	pc.cockChange();

	output("\n\nThough it gives her no pleasure, bereft of muscle and nerve, the warm mouth of her vagina drools and sucks loosely at you, and the chemical assistance from the aphrodisiac makes it easy to finish. ");
	if(x >= 0) {
		if(pc.balls > 0) 
		{
			output("Your [pc.balls] tighten");
			if(pc.balls == 1) output("s");
		}
		else output("Your stomach churns");
		output(" and you twitch, blasting your load into the helpless zil. ");
		//(small skeet)
		if(pc.cumQ() <= 250) output("Spending your ardor quickly, you pull out and let the last squirt go across her thigh. Your batch drips from the slumping zil, unable as she is to tighten up and hold it inside.");
		//(large skeet)
		else if(pc.cumQ() < 7000) output("You pump and pump, filling her with stroke upon stroke of semen, until her pussy is full and it begins to flow back around your shaft.");
		//(mega skeet)
		else {
			output("Unwilling to pull out, you press her tight against your base ");
			if(pc.legCount > 2 && pc.hasLegs()) output("using your forelegs ");
			output("and squeeze her thighs shut as far as you can, continuing to fire ropes into her cunt. Her belly stretches its semi-rigid chitin covering taut and then keeps growing, allowing you to see the armored plates spread apart, revealing her taut skin below. The zil’s toneless wail grows ever louder as you top off the immense batch of sperm and drop her onto the ground, to roll over onto her sides and twitch her hands weakly at her swollen, flooded womb.");
		}
	}
	//(if clit)
	else output("Your swollen clitoris spasms, sending electric sensation through your pussy, and you come, drooling lubricant all over the zil’s own slick opening. Her toneless wail goes quiet as her body stops vibrating from your thrusts, and she manages to slide off as you twitch and shake out the fits of your climax.");
	
	output("\n\nRecovering quickly, you smile at the angry-eyed zil woman, only to be rewarded with an open-mouthed grimace. It doesn’t strain your deduction to guess that she’s pissed at not getting off the way she wanted. Considering for a moment, you pick up the spent darts and jab <i>both</i> into the zil’s mons, and her voice raises once more in anguish as she realizes what you’ve done.");
	
	output("\n\nHaving condemned the arrogant woman to several more hours of both terrible arousal and the complete inability to relieve it, you recollect your things and make your way.\n\n");
	//zeikfried’d
	author("Zeikfried");
	//maybe become evil
	pc.personality++;
	if(pc.personality > 100) pc.personality = 100;
	processTime(15+rand(10));
	if(x >= 0) 
	{
		enemy.loadInCunt(pc, 0);
		tryKnockUpFZil();
	}
	pc.orgasm();
	CombatManager.genericVictory();
}

//Smother Her In Dick [DONE](edited)
//-Fen idea
//Everyone wanted me to write this first, so here goes.
public function smotherDatBeeSlutInDickYo():void {
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	if(!pc.isCrotchExposed() && pc.armor.shortName != "" && pc.lowerUndergarment.shortName != "") output("You slip out of your [pc.armor] just in time to see your [pc.lowerUndergarment] tenting dangerously around your [pc.cockBiggest]. It takes a few moments of struggling to get the rest of your clothing off, but when you feel yourself flop free, a shudder of relief travels up your spine.");
	else if(pc.armor.shortName != "" && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output("You slip out of your [pc.armor] as quickly as possible, lest your [pc.cockBiggest] tear it off for you, or worse, get stuck inside.");
	else {
		output("You wriggle to drop the pieces of gear you carry on your ");
		if(pc.upperUndergarment.shortName != "") output("mostly ");
		output("nude body. You’ve got to admit, you’re secretly glad you’ve been going around so unencumbered by things like clothes or armor.");
	}
	//No new PG
	output(" Between this girl’s pheromones and the sight of her presenting herself so readily, there was no way any kind of clothing could contain such a giant once it roused from slumber, and it is definitely awakening right now, lurching up inches higher with every pounding beat of your heart. It passes the halfway point, momentarily jutting out from your crotch at a 90 degree angle before your building lust carries it higher, seeming to fill it with molten hot need. Each twitch upward solidifies your desire to absolutely bury this wasp-bitch in cock. You wrap a hand around your twat-splitting member, stroking it languidly as it assumes its full, rigid size, and it twitches hard at the zil woman’s open-mouthed disbelief.");
	output("\n\n<i>“Is that... is that real?”</i> she breathes, hesitantly extending a honey-glazed digit towards it, a web of amber ropes still connecting her fingers to her twat. She crawls closer, an awkward, shuffling gait made worse by the way her oversized tail sways behind her. Her hot breath falls on your sensitive tool. <i>“None of the males have anything like this....”</i> The strands of honeyed girl-cum connecting her pussy to her palm finally come apart under the weight of her fresh, leaking moisture. <i>“I-it’s magnificent.”</i>");
	output("\n\nTaking a swaggering step forward, you let your [pc.cockBiggest] come to rest in the cradle of her slick fingers, pushing it just hard enough that she has to support some of the extensive weight. The flesh, even hard, is still spongy enough that she sinks partway into it as she tries to handle you, not even capable of grabbing half its circumference. Giggling in delight, the defeated wasp-girl rises onto her knees so that her other arm can help, rubbing slippery-smooth chitin-coverings up in down in fascinated, hypnotic strokes. She shivers, and you see a thick strand of honeycum hanging from her between her legs, growing thicker and heavier by the second.");
	output("\n\nYou advance further, bearing the weight of your giant erection forward forcefully enough to tumble her over onto her back, legs splayed around her downward-curving, stinger-capped abdomen with you ");
	if(pc.isNaga()) output("coiled above");
	else if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) output("flowing around");
	else output("standing astride");
	output(" her supine form. You change position to press your [pc.cockBiggest] even more firmly against her, hard enough to push her arms back, dropping your penis right on top of her. The zil woman’s body feels wonderful against you, even the way her cushy breasts press their nectar-leaking nipples against the underside. Just above her face, your [pc.cockHeadBiggest] swells up, drooling a trickle of pre-cum in excitement.");
	output("\n\nA pleased-sounding gasp emanates from underneath you. <i>“Leaking already? Then what if I do this!”</i> She wraps her arms around your girthy tool, just below the [pc.cockHeadBiggest], and her chitinous legs near the [pc.sheathBiggest], the insectile plating sliding across you like oiled silk as she settles in, squeezing a bit tighter. In the process, she winds up pressing the whole of her breasts, torso, and waspy hips against your dick’s bottom.");
	output("\n\nYou groan appreciatively and, shuddering powerfully, grab her by her ");
	if(pc.cocks[pc.biggestCockIndex()].thickness() <= 18) output("crossed ankles");
	else output("shaft-split ankes");
	output(". Head flaring, you draw back, popping your sensitive tip through her arms and gliding through her thighs, drooling a layer of pre across her body as you go. Before the phallus-obsessed alien can react, you thrust forward, jamming your dick back through her arms, fucking the whole of her body with that long, powerful stroke. Her nipples gush rivers of honey from the friction, turning her body into a sticky mess of sex-juice and sweets, one you are all to happy to slide across, fucking it with firm, strong movements.");
	
	output("\n\nYou’re treated to brief glimpses of the slick slut’s visage in between your firm pushes. Every time, her face has a bit more of lubricant painted across it, though her own honey is rapidly turning your sex-slime into a scintillating glaze. Her black lips part in an excited coo, and a tongue, long and flexible, slips out to flick across your leaking urethra, slurping down some of your pre-ejaculate whenever you hilt her and cleaning her face when you aren’t - not that it does much good. Your piston-like motions smear a fresh coat over her every single time.");
	output("\n\nShe looks like she desperately wants to say something, but she’s so busy with her tongue that it just never comes out. The way her eyes seem to unfocus with each slurp of cum doesn’t exactly paint a picture of a person ready for conversation anyway. You hold on harder and pump through her legs even faster, grunting each time, sometimes even snarling at the sublime pleasure of using this girl’s entire body as a masturbation sleeve. The zil moans and babbles something too muffled to understand, maybe <i>“more,”</i> and you oblige her with even more dominant, aggressive strokes.");
	output("\n\nDragging her a little over the ground with each lewd hump, you struggle not to blow your load all over her face. It’s so hard, as wet and hot and gorgeous as she is, smothered in your pre and completely devoted to serving your cock. Whatever she wanted before, she’s forgotten it now. Her eyes flick up to your face, imploring you to cum all over her and give her the jizz-bath she deserves, before they unfocus once more, rolling partway back as she coos in pleasure, grinding her sodden box along your rapidly expanding urethral bulge.");
	output("\n\nOh fuck, here it comes! You push forward and down as hard as you possibly can, butting your tip right up against the sodden slut’s exquisitely blissed-out face just in time to " + pc.mf("roar","cry out") + " in passion. Your [pc.cockHeadBiggest] swells even bigger, and a droplet of [pc.cumColor] ecstasy appears on your slit, hanging there for an agonizingly exciting split-second. Then, you’re launching a huge, thick rope of [pc.cum] across the alien’s cheek, splattering above her eye, glazing her forehead, and oozing down the middle of her face to coat her sable libs in a [pc.cumColor] shine. She squeezes her legs tighter, locking you in place, but her body is anything but still. Her arms have separated to separately stroke and caress your length, squeezing its twitching bulk to make the next ejaculation even bigger than the first. Below, her hips are undulating in broken, arrhythmic shudders as gushing honey splatters your tool.");
	//Cum less than 10ml
	if(pc.cumQ() < 10) {
		output("\n\nUnfortunately, that’s all you’ve got. Your [pc.cockBiggest] lurches, twists, and writhes, flexing as if it were launching gigantic ropes of jizm, but your ");
		if(pc.balls > 1) output("empty balls");
		else if(pc.balls == 1) output("empty ball");
		else output("spent body");
		output(" just can’t manage to create another drop. The movements succeed in smearing your already shot load all over her face, not adding anything new but succeeding in making quite the mess anyway.");
		output("\n\n<i>“Mmm, just a taste to get me going?\”</i> the alien coos as she collects it into her mouth. <i>“Next time, give me more!”</i>");
	}
	//Cum is less than 50
	else if(pc.cumQ() <= 50) {
		output("\n\nThe next shot is just as big as the first, and this time, either your aim has improved on your partner is trying to swallow it all. You don’t feel an ounce of resistance as your [pc.cum] spews forth, washing straight into the zil’s noisily gulping mouth. Her eyelids close as your rope trails off into droplets, satisfied with the sample she’s swallowed, yet her tongue unspools, revealing a hollow nature as it seals itself around your twitching cumslit just in time to catch the last few pulses of distilled delight in its tubular embrace, passing it directly to her belly.");
		output("\n\n<i>“Mmm, not too bad, off-worlder,”</i> the alien coos as she wipes a trickle of [pc.cumColor] from the edge of her mouth. <i>“Though from how big you are I was expecting to get drenched!”</i> She licks her lips. <i>“I bet you probably just used it all on someone else already, huh?”</i> There’s a mischievous glint twinkling in her eye.");
		pc.orgasm();
	}
	//Cum is less than 500
	else if(pc.cumQ() <= 500) {
		output("\n\nThe next shot feels like it’s twice as big as the first, and this time, either your aim has improved or the dick-hungry whore is guiding you straight to the prize: her sucking, glazed mouth. You bathe her tongue in the slippery morass of your release, flooding her oral cavity to such a degree that her cheeks bulge and runnels of [pc.cumColor] leak from the corners of her mouth. Her throat noisily attempts to gulp down the heavy load, but you fill it as fast as she can swallow, not stopping until she’s taken three large swallows.");
		output("\n\nThe wasp-like woman grabs your [pc.cockHeadBiggest] in both hands to steady it, unspooling her tongue to your quivering cumslit while gasping for air. A light, ticklish pressure seals around your organ’s tiny slit, revealing the zil’s tongue to be hollow just in time for your next release. You blast [pc.cum] straight into the tubular proboscis before she’s completely ready, stretching the hollow, organic pipe to twice its original diameter as you completely fill it, pouring your need into her in a direct path to her stomach. A noisy gurgle comes from her belly, but she manages to take it all with a pleasure-dazed smile.");
		output("\n\n<i>“Mmm, nice and filling, big " + pc.mf("boy","girl") + "...”</i> she sighs as she separates from your dick, letting the last few drops spatter across her face. <i>“No one has ever pinned me under their dick like that before. It was almost worth losing to you!”</i>");
		pc.orgasm();
		pc.orgasm();
	}
	//Cum is more than 500
	else {
		output("\n\nThe first shot was little more than a warm up. Your next is a deluge of titanic proportions - an avalanche of [pc.cum] that bursts from your [pc.cockBiggest] like water from a firehose, instantly drenching the exotic beauty’s hair and face in a thick layer of organic paint. Rivulets of it run down her skin, chitinous armor, and fluffy borders between. Her mouth gapes open in surprise and is instantly filled, stuffed with your delectable organic cargo to such an extent that her cheeks bulge and her lower lip becomes the edge of a spermy waterfall. Trying to swallow it all, she closes her now-[pc.cumColor] lips and does her best to work it all down, gulping noisily while your blast fades to a trickle.");
		output("\n\nThe zil tips her head back and opens her mouth, showing you that she’s devoured it all just in time for the next ejaculation to tag her right between the eyes, splattering in sticky strands in another face-coating layer. Some puddles in the hollow of her neck, a tiny lake of liquid love growing ever deeper on your lover’s surprised body. Her supine shape trembles through another orgasm of her own as she grinds against your meat, getting off on being smothered in cock and painted with its immense outflow. The geyser of wet warmth erupts against your underside, feeling like having the loveliest, warmest honey painted across your sensitive surface. You shudder as the next pulse readies itself.");
		output("\n\nThere’s no warning, and certainly no way the alien can prepare herself. She’s too busy lying there, writhing in the mud, cumming her brains out to the feeling of being completely owned by your [pc.cockBiggest], marked and stained with the proof of your superior virility. She mewls as another layer of [pc.cum] covers her, running her hands through it to gather it. With hands full, she presses your [pc.cumColor] relief down to the fluttering hole betwixt her thighs, stuffing it inside like precious gems into an empty vault. She shovels as much as she can in while you rain it down upon her, not stopping until there’s a frothy mess oozing out of her hole and the bulk of her body is smeared with it.");
		//Huge cum addendum
		if(pc.cumQ() >= 2500) {
			output("\n\nThat’s just the start of it, you shoot and shoot and shoot until the ground beneath your prize is a fragrant, sexual mud. Your [pc.cum] is rolling off her in slow-flowing waterfalls before puddling on the mix, leaving the zil-girl in a ");
			if(pc.cumQ() <= 5000) output("small puddle");
			else if(pc.cumQ() <= 10000) output("body-sized puddle");
			else if(pc.cumQ() <= 30000) output("puddle deep enough for her to sink half-way into");
			else if(pc.cumQ() <= 100000) output("puddle deep enough to hide everything but her face and the tops of her breasts");
			else output("puddle deep enough to nearly drown her");
			output(".");
			if(pc.cumQ() >= 60000) output(" You keep going, eventually creating a small river of juices that drains through the jungle, flowing off towards who-knows where.");
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		//Else
		else output("\n\nThe succussive shots take their toll, each one smaller than the one proceeding it but still easily capable of giving the zil-girl a thorough [pc.cumNoun]-treatment.");
		output(" Sputtering, swallowing, and moaning, the pretty little thing does her best to come down from her climactic bliss, rolling her hips languidly beneath your slow-shrinking staff as she clears her mouth and nose. Her voice is dazed and muted when she speaks, barely audible at first but growing in intensity with every word. <i>“That was wonderful. I’ve never... never had a male take me so. You are, without a doubt, the most wonderfully virile creature I’ve ever met. Perhaps I’ll have a queen from this.”</i> She wipes the cum from her eyes. <i>“Maybe I’ll even manage to beat you next time. I could do so much to this cock if I had you at my mercy...”</i>");
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//Omni-end
	output("\n\nYou reluctantly separate yourself from your prize and prepare yourself to resume your journeys. She just lays there a while, breathing heavy with her eyes drifting closed toward a much-needed nap.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Coded by Savin, halp
public function normalZilgirlCockfuck():void
{
	clearOutput();
	showBust("ZILFEMALE");
	showName("FEMALE\nZIL");
	author("MistyBirb");
	
	var x:int = pc.cockThatFits(enemy.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	if(enemy.HP() <= 0) output("The battered bee girl pants as she works to catch her breath, and you decide to take her up on her offer. Even as exhausted as she is, she can’t hide the glimmer of excitement that crosses her face " + (pc.isNude() ? "as she recognizes your intent" : "when your clothing falls to the ground") + ". Instantly, the natural armor covering her breasts and crotch retracts, and the zil bares her most intimate parts to you with no hesitation. A gentle nudge is all it takes for her to lie down and present herself. Her expression is a mixture of acceptance and excitement, and you almost feel as if she <i>wanted</i> to be beaten into submission by you...");
	else output("The sight of the lust-maddened bee girl’s lewd desperation is all the encouragement you need. " + (pc.isNude() ? "Crouching down" : "Stripping naked and crouching down") + ", you crawl towards her, locking eyes as you do. Instantly, the natural armor covering her breasts and crotch retracts, and the zil willingly bares her most intimate parts to you. A gentle nudge is all it takes for her to lie down on the ground and open her legs wide, her expression one of gleeful anticipation.");
	if(pc.cockVirgin)
	{
		output("\n\nYou stroke yourself a few times, [pc.eachCock] jumping to attention. Eagerly, you align your [pc.cockhead "+ x +"] with the zil’s honeypot, but your own excitement gets the better of you as you thrust <i>against</i> her rather than <i>into</i> her. There’s a flash of awkwardness, one that your waiting lover picks up on.");
		output("\n\nShe smiles and sets a hand on your cheek. <i>“Ooh, you’re adorable. So willing, but so uncertain. Come here.”</i>");
		output("\n\n<i>“Hold on,”</i> you say, blushing, <i>“I’m just--”</i>");
		output("\n\nThe zil puts a chitin-covered finger to your lips, silencing you, while her free hand drifts down to your [pc.cock "+ x +"]. She dips her fingers into her vagina for a moment, then slides her hand along your throbbing erection, coating your length in her delectable lubricant as she goes. You grimace, barely suppressing a moan as your dick is toyed with by the beautiful alien. The zil laughs, though not in a mocking way. She seems innocently amused by your sexual inexperience, and, if the noticeable increase in the strength of her pheromones is any indication, more than a little aroused at the thought of taking your virginity.");
		output("\n\nThe entire dynamic between the two of you has shifted, with your once-submissive partner now taking the lead, but you can’t complain. The zil only teases your cock for a few seconds before guiding you to her entrance and leaning in. <i>“Try it now,”</i> she whispers, her breath hot against the side of your face, <i>“Slowly. Let me show you a whole new world.”</i>");
		output("\n\nYou don’t even notice how unsteady you are or how heavily you’re breathing, your arousal barely contained and continually stimulated by the zil’s lust-sparking pheromones. You manage to slide your hips forward and gradually sink into the bee girl’s honey-slicked sex, but you don’t get far before letting out a gasp and seizing up. Warmth surrounds your [pc.cock "+ x +"], and the gentle pulsing of your partner’s vagina is a sensation beyond compare. In an instant, your inexperience is torn away, and you lose yourself in a heavenly feeling of comfort and pleasure that feels nothing but right, nothing but <i>necessary</i>.");
		output("\n\nYou blink rapidly as your brain catches up with your body, while the zil wraps her arms around your waist to bring you all the way in. Clearly eager, she wiggles around your cock, but you don’t need any more encouragement. Instinct is stirring within you, a primal compulsion to claim your mate, and an excited smile spreads across your face.");
	}
	else
	{
		output("\n\nShe hisses as your [pc.cockhead "+ x +"] brushes against her honeyed sex, the dusky folds already saturated with nectar. <i>“Don’t worry,”</i> you whisper, <i>“I’ll take it slow.”</i> True to your word, you gently slide your dick against her entrance, moving back and forth to coat it with her juices.");
		output("\n\nYou drag your shaft across her crotch, angling your hips as you pull back to send your cock across her tiny black button. The alien woman shudders and clenches her jaw, her reactions serving as nonverbal praise of your splendid technique. You continue to grind against her aromatic nethers, but find it increasingly difficult to concentrate, mind clouded by the zil’s lust-sparking pheromones.");
		output("\n\nT");
		if(pc.genitalLocation() < 2) output("wo chitinous arms wrap around your shoulders, and t");
		output("he moans of your sweet-smelling lover fill the air. You look down at your companion’s body, taking in every inch of her glistening figure until you see her wasp-like tail, and more importantly its venomous stinger, bobbing precariously close to your exposed [pc.skinFurScales].");
		output("\n\nShaking your head to clear your thoughts, you return your attention to the zil’s blushing face and meet a mischievous smirk, then tense up as you feel a point of pressure against your thigh. <i>“Worried?”</i> she coos.");
		output("\n\n" + (pc.isAss() ? "Scoffing" : "Sighing") + ", you shift yourself forward");
		if(pc.genitalLocation() < 2) output(" to stare directly into her eyes, then");
		else output(" and");
		output(" plunge into her depths with a single, powerful thrust. She spasms, letting out a yelp as her muscles disobey her and her stinger flops onto the ground.");
		output("\n\n<i>“No,”</i> you reply" + (!pc.isAss() ? " with a smile" : "") + ".");
	}
	//End Cockvirgin Vars.
	pc.cockChange();
	output("\n\nYou pump your hips, the insectile woman’s voice rising in response to your movements.");
	if(pc.genitalLocation() < 2)
	{
		output(" She pulls you down to pant into your ear, pressing her breasts against ");
		if(pc.hasBreasts()) output("your own" + (pc.isLactating() ? " and teasing out a few droplets of [pc.milk]" : "") + "");
		else output("your " + (pc.tone >= 50 && pc.thickness >= 25 ? "muscular " : "") + "chest");
		output(". Bodies pressed together, y");
	}
	else output(" She hugs your [pc.lowerBody], pressing her breasts against your underbelly. Y");
	output("ou lose yourself in the throes of passionate lovemaking, ignorant to everything but the feeling of your exotic alien partner.");
	output("\n\nThe zil tries to say something, but only manages a mess of gasps and broken whines as you drive your cock deeper and deeper into her womanhood, until you can go no farther. You slam into her, reaching a fever pitch as the zil’s scent pushes you over the edge of sense.");
	output("\n\nHer vagina draws you in, suffocating your dick with its sweet warmth. Honey spills out of her slit and collects on the ground beneath, creating a sticky puddle with an overpowering aroma. Louder and less-controlled vocalizations come from the zil as you stretch her insides with your [pc.cock "+ x +"]. Before long, she’s practically screaming, and you can’t suppress a few needy groans of your own.");
	output("\n\nA heat rises in your " + (pc.balls > 1 ? "balls" : "groin") + ", an aching need to fill the enraptured bee with everything you have. You barely have any time to consider whether you should finish inside or outside, but the zil’s legs wrap themselves around you as her grip tightens, and that’s answer enough for you. With your climax nearing, you plant a passionate, messy kiss against the alien woman’s sable lips.");
	if(pc.hasKnot(x)) output("\n\nYour [pc.knot] begins to swell, letting you know your dick is at its limit. You force yourself as deep as you can, delighting in the zil’s squeals of surprise as your sexes are locked together. Eruptions of [pc.cum] coat her insides, and orgasmic euphoria seizes your body from top to bottom.");
	else output("\n\nWith one final surge, your dick erupts inside her, flooding her vagina with a rush of [pc.cum]. She tears herself away from your kiss, crying out and arching her back. Her vagina clenches around your gushing cock, its velvety walls gripping your length in a frantic effort to squeeze out every last drop of your seed.");
	if(pc.hasVagina()) output("\n\nJust as you think you’ve reached your peak, " + (pc.isSquirter() ? "[pc.eachVagina] clenches, and you let out a spray of [pc.girlCum] that thouroughly soaks your thighs" + (pc.balls > 0 ? " and [pc.balls]" : "") + "." : "streams of [pc.girlCum] begin to leak from your overstimulated vagina" + (pc.totalVaginas() > 1 ? "s" : "") + ". The girlish lust runs along your thighs" + (pc.balls > 1 ? " and drips down your balls" : "") + ", forcing out a gasp and a shiver as your feminine half spasms and twitches.") + " You grind against your partner, eyes clamped shut from the sheer strength of your twin orgasms.");
	if(pc.cumQ() >= 5000)
	{
		output("\n\nThe slender bee girl takes the first few spurts of [pc.cum] without issue, but your titanic load will not be contained. Your pulsing cock shows no signs of stopping, filling the zil beyond her limit. A trembling moan passes over her lips as her stomach begins to swell, " + (pc.hasKnot(x) ? "the entirety of your ejaculation trapped inside her by the seal created by your knot" : "and blasts of [pc.cumVisc] seed are forced out of her overloaded hole") + ".");
		output("\n\nEventually the torrent of [pc.cum] subsides, " + (pc.hasKnot(x) ? "but your swollen [pc.knot "+x+"] keeps you locked in place. You look down at the exhausted zil, leaning in for another kiss. Savoring the gentle intimacy as your knot slowly shrinks, you kiss and nuzzle the zil, until you can finally extract yourself and stand up." : "and you pull away from your breathless lover with a wet pop. You lean in for another kiss, just for good measure, then stand up and step away.") + "");
		output("\n\nThe [pc.cum]-stuffed woman giggles as you brush yourself off, hands caressing her bloated stomach. <i>“Amazing,”</i> she says breathlessly, gazing up at you through half-lidded eyes, <i>“You offworlders... are...”</i>");
		output("\n\nYou look down to see her fast asleep, a smile on her face. With an amused shrug, you clean yourself up, gather your equipment, and set out, feeling a deep sense of satisfaction.");
	}
	else
	{
		if(pc.hasKnot(x)) output("\n\nYou grow still as the pleasure fades, your waspish partner coming down alongside you. But the [pc.knot "+x+"] at the base of your [pc.cockNoun "+ x +"] keeps the two of you locked together, and the zil’s hand moves to her crotch. You nuzzle against her neck as she massages her sticky folds, helping to work your slowly-shrinking member free. You eventually withdraw with a slick squish, standing up to get ready to leave.");
		else output("\n\nYou grow still as the pleasure fades, your waspish partner coming down alongside you. " + (pc.isAss() ? "Satisfied, you pull away and " : "While you’d like to simply lie beside her and savor the blissful intimacy, you manage to ") + "force yourself upright to begin gathering your gear. The beaming zil stays on the ground, idly playing with her [pc.cum]-leaking sex as you get ready to leave.");
		output("\n\n<i>“You don’t have to go,”</i> she murmurs, caressing herself enticingly. ");
		if(pc.isAss()) output("\n\n<i>“Actually, I do.”</i> You secure your equipment with one final tug and give a farewell salute as you walk off. The zil looks disappointed, but shrugs and returns her attention to her vagina. You doubt she’ll be upset for long.");
		else output("\n\nYou smile. <i>“As much as I wish that were true, I do.”</i> You secure the last of your belongings and kneel down, giving the bee girl a final kiss goodbye before walking off, filled with warmth and satisfaction.");
	}
	output("\n\n");
	
	processTime(20+rand(10));
	enemy.loadInCunt(pc, 0);
	tryKnockUpFZil();
	pc.orgasm();
	CombatManager.genericVictory();
}

//Time for Bee Babies
//https://docs.google.com/document/d/1kaI8RC1qOd8y1mwIpkgdDoSdDjZfWFq6W8TDYMWnaDw/edit#
public function tryKnockUpFZil():Boolean
{
	var x:Number;
	
	if(pc.virility() == 0 || flags["FZIL_PREG_TIMER"] != undefined) return false;
	
	x = pc.virility()/2 + 0.5;
	
	//succesful impregnation
	if(rand(10000) <= (1 - 1.15*Math.exp(-0.38*x))*10000)
	{
		flags["FZIL_PREG_TIMER"] = 0;
		pc.clearRut();
		
		return true;
	}
	else return false;
}

public function processFZilPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["FZIL_PREG_TIMER"] != undefined)
	{
		flags["FZIL_PREG_TIMER"] += totalDays;
	
		//Ideally birth will be triggered by the PC proccing the birth scene, otherwise she's gotta blow sometime
		if(flags["FZIL_PREG_TIMER"] > 245)
		{
			var birthTimestamp:int = (GetGameTimestamp() + deltaT - (flags["FZIL_PREG_TIMER"] * 24 * 60) + (246 * 24 * 60));
			fZilBirth(false, birthTimestamp);
		}
	}
}

//The purely game-state centric parts of birth
public function fZilBirth(witnessed:Boolean, birthTimestamp:int = -1):Number
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var numMale:Number = 0;
	
	if(witnessed)
	{
		var c:Child = Child.NewChild(GLOBAL.TYPE_BEE, 1.0, 2);
		c.BornTimestamp = birthTimestamp;
		numMale = c.NumMale;
		ChildManager.addChild(c);
	}
	
	StatTracking.track("pregnancy/zil sired", 2);
	StatTracking.track("pregnancy/total sired", 2);
	if(witnessed) StatTracking.track("pregnancy/total day care", 2);

	if(flags["FZIL_TOTAL_KIDS"] == undefined) flags["FZIL_TOTAL_KIDS"] = 0;
	flags["FZIL_TOTAL_KIDS"] += 2;
	flags["FZIL_PREG_TIMER"] = undefined;
	flags["FZIL_THIS_PREG_MET"] = undefined;
	
	return numMale;
}

public function fZilPregStage():int
{
	if(flags["FZIL_PREG_TIMER"] < 80 || flags["FZIL_PREG_TIMER"] == undefined) return 0;
	else if(flags["FZIL_PREG_TIMER"] < 160) return 1;
	else if(flags["FZIL_PREG_TIMER"] < 220) return 2;
	else return 3
}

public function fZilPregEncounter():void
{
	clearOutput();
	clearBust();
	clearMenu();
	author("MistyBirb");
	
	if(flags["FZIL_EVER_PREG_MET"] == undefined)
	{
		output("You pick up a strange scent as you walk, strong enough to make you blink and look around. It smells a bit like zil pheromones, you’ve got enough experience by now to recognize them, but there’s something different about it. Something more noteworthy. The smell seems to be coming from a specific direction, and you could probably follow it...");
		output("\n\nDo you investigate the mysterious aroma?");
	}
	else
	{
		output("You’re hit with a powerful scent, one that’s unmistakably pleasant and arousing. Somewhere nearby, there’s a zil you’ve left your mark on. She’s giving off enough pheromones that you could probably track her down pretty easily.");
		output("\n\nDo you go looking for the pregnant zil?");
	}
	
	processTime(5);
	if(!pc.hasAirtightSuit()) pc.lust(15);
	
	addButton(0, "Yes", fZilInvestigate, undefined, "", "");
	addButton(1, "No", fZilIgnore, undefined, "", "");
}

public function fZilInvestigate():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	if(flags["FZIL_EVER_PREG_MET"] == undefined)
	{
		output("You follow the scent, keeping your wits about you as you traverse the uneven chaos of the jungle brush. The smell gets even stronger, which is a sign you’re on the right track, but as you near the source you also find yourself growing more and more aroused.");
		if(pc.isCrotchExposed()) output("\n\nYou have to stop and adjust yourself several times as your rapidly hardening cock" + (pc.totalCocks() > 1 ? "s test" : " tests") + " the confines of your clothing. ");
		else output("\n\nYour rapidly hardening cock" + (pc.totalCocks() > 1 ? "s" : "") + " are plain evidence of this fact, standing firm and proud in the humid jungle air. ");
		if(pc.hasVagina()) output("There’s beads of [pc.girlCum] " + (pc.isCrotchExposed() ? "staining your crotch" : "slipping down your thighs") + " too, and by ");
		else output("By ");
		output("the time your search comes to an end and you stumble into a clearing, you feel like you could cum from nothing but the wonderful aroma you’re chasing...");
		output("\n\n<i>“Who’s there?!”</i> cries a female zil standing roughly a dozen feet ahead of you. Her body is turned away, but she’s looking over her shoulder to stare right into your eyes, stinger at the ready. You collect yourself and muster as defensive a stance as you can manage, but it quickly becomes evident the zil is not interested in fighting you.");
		output("\n\nShe turns to face you properly, one chitinous hand draped across a swollen stomach. She’s pregnant! " + (fZilPregStage() == 3 ? "Exceptionally pregnant, at that, looking like she might go into labor at any moment. " : "") + "You do your best not to stare, but between her noticeably rounded tummy and " + (fZilPregStage() == 1 ? "the ever-present allure of her aroma" : "her big, honey-leaking breasts left shamelessly exposed") + ", it’s quite the challenge. The pregnant alien sighs and smiles, seeming almost <i>happy</i> to see you.");
		output("\n\n<i>“It’s you,”</i> she says, <i>“I didn’t think we’d meet again!”</i>");
		output("\n\nAgain? You’ve met this zil before? You manage to clear your lust-addled mind enough to properly take in her face, and there’s definitely an air of familiarity there. You look back at her pregnant belly. Does that mean...?");
		output("\n\n<i>“They’re yours,”</i> she says, answering your question before you even ask, <i>“You look surprised. Are you not pleased?”</i>");
		
		flags["FZIL_EVER_PREG_MET"] = 1;
		flags["FZIL_THIS_PREG_MET"] = 1;
		
		addButton(0, "Happy", fZilHappy, undefined, "Happy", "You’re pleased to see the zil is pregnant with your children.");
		addButton(1, "Unhappy", fZilUnhappy, undefined, "Unhappy", "You weren’t expecting this, and you’re not pleased.");
	}
	else
	{
		output("You work to track the zil down, steeling yourself and doing your best to keep a clear head amid the potent pheromones lingering in the air. Despite your best efforts, you still wind up shamelessly aroused, but not to the extent that your faculties are affected beyond a stiff dick" + (pc.hasVagina() ? " and a [pc.girlCum]-dampened crotch" : "") + ".");
		if(flags["FZIL_THIS_PREG_MET"] == undefined)
		{
			output("\n\nYou emerge into a clearing to find the zil cradling her rounded stomach and foraging among the jungle brush. She senses your presence with a twitch of her antennae and turns in surprise, but you raise your hands to reassure her that you’re not a threat.");
			output("\n\n<i>“Oh! It’s you!”</i> she says, <i>“I didn’t think we’d meet again!”</i>");
			output("\n\nYou forgo a traditional greeting in favor of a more direct approach, stepping forward and drawing her into a passionate kiss. A bit of paternal instinct overcomes you, and you lovingly stroke her pregnant belly. She gazes into your eyes as you break the kiss, face flushed with a mixture of base arousal and genuine emotion.");
			output("\n\n<i>“Well, that was a pleasant surprise,”</i> she whispers before lewdly stroking your groin, <i>“But I hope that’s not all you had in mind...”</i>");
			output("\n\nYou smirk. What do you want to do with her?");
			flags["FZIL_THIS_PREG_MET"] = 1;
		}
		else
		{
			output("You emerge into a clearing to find the zil cradling her swollen stomach and foraging among the jungle brush. She senses your presence with a twitch of her antennae and turns, already well aware of who you are.");
			output("\n\n<i>“Hello again,”</i> she says with a smirk, <i>“If I didn’t know better, I’d say you were following me. Have you come to check on me?”</i>");
			output("\n\n<i>“Something like that,”</i> you say.");
			output("\n\nThe zil giggles, dragging her fingertips across her taut, rounded belly. <i>“Well, get on with it.”</i>");
		}
		fZilPregMenu();
	}
	
	pc.lust(20);
	processTime(15+rand(10));
}

public function fZilIgnore():void
{
	clearOutput();
	clearBust();
	clearMenu();
	author("MistyBirb");
	
	if(flags["FZIL_EVER_PREG_MET"] == undefined) output("You frown and continue on your way. It’s probably not worth the risk. Knowing Mhen’ga’s propensity for sweet-smelling danger, almost definitely not...");
	else output("You shrug and keep moving forward. She’s more than likely fine, and you have more important things to do at the moment.");
	
	processTime(3);
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilHappy():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("The zil smiles, looking rather touched. <i>“I’m glad. Even if you’re an off-worlder, you’re quite strong.”</i> She caresses her stomach gently, face flushing as she remembers your last encounter. <i>“And strong mates make strong children...”</i>");
	output("\n\nYou chuckle and wrap an arm around her, pulling her close. Her rounded belly presses against you, and your free hand roams across it, prompting a warm sigh from the zil. She " + (pc.isTaur() ? "presses herself against you sensually" : "slides her thigh against your groin") + ", testing the limits of your already strained self-control.");
	output("\n\n<i>“Hmm... You came prepared, didn’t you?”</i> she murmurs, <i>“So, where do we go from here?”</i>");
	output("\n\nYou set your hands on the zil’s shoulders and push her away, but only enough to let you take in the entirety of her pregnant form. What do you want to do to her?");
	
	pc.addNice(3);
	pc.lust(20);
	processTime(5);
	
	fZilPregMenu();
}

public function fZilUnhappy():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("The zil frowns and narrows her eyes. <i>“Hmph. Well then, I’m not going to pretend to understand the backwards nature of an off-worlder. I didn’t expect you to return, and I certainly didn’t </i>need<i> you to, but still... I misjudged you.”</i> She turns away and stomps off, disappearing into the jungle.");
	output("\n\nSomehow you doubt you’ll ever see her again.");
	
	pc.addHard(5);
	processTime(5);
	fZilBirth(false);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilPregMenu():void
{
	addButton(0, "Appearance", fZilPregAppearance, undefined, "", "");
	addButton(1, "Talk", fZilPregTalk, undefined, "", "");
	addButton(2, "Relax", fZilPregRelax, undefined, "", "");
	if(!pc.isTaur())
	{
		addButton(3, "Breastfeed", fZilPregFeed, undefined, "", "");
		if(pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25) >= 0) addButton(4, "Fuck", fZilPregFuck, undefined, "", "");
		else addDisabledButton(4, "Fuck", "Fuck", "You don’t have a penis that could fit the pregnant zil.");
	}
	else
	{
		addDisabledButton(3, "Breastfeed", "Breastfeed", "You need to not be a taur for this.");
		addDisabledButton(4, "Fuck", "Fuck", "Considering your anatomy, having sex with a pregnant Zil is out of the question.");
	}
}

public function fZilPregAppearance():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	switch(fZilPregStage())
	{
		case 1:	output("You spend a moment just looking at the zil, taking in her pregnant form. She’s got a modest baby bump at the moment, definitely noticeable, but she can’t be too far along. Her breasts seem to strain against the chitin plates covering them, looking a bit cramped. While the zil seems able to comfortably keep her breasts covered for now, you have to wonder if that will hold true as her breasts continue to grow...");
				break;
				
		case 2:	output("You spend a moment just looking at the zil, taking in her pregnant form. Her stomach is looking quite gravid, and the smooth chitin plates around her abs and waist that normally fit snugly together are separated by large patches of bare yellow skin, having been forced apart to make room for her growing young. She seems instinctively defensive of her pregnant belly, rarely allowing one of her hands to not be in constant contact with it.");
				output("\n\nHer breasts, too, are noticeably bigger, with the most obvious indication being that the zil seems unable to cover them with her natural armor. They have grown to the point where she is forced to expose them constantly, but you’re hardly complaining about the view. Drops of golden honey regularly slip from her puffy black nipples, a clear sign that she’s lactating heavily.");
				break;
				
		case 3:	output("You spend a moment just looking at the zil, taking in her pregnant form. She has reached the point in her pregnancy where her belly has grown so large that it’s truly impressive she manages walk around and function relatively normally. The zil is very, <i>very</i> pregnant, and her hands almost seem glued to the sides of her enormously gravid stomach, rubbing it gently, if not a bit anxiously. She is surely bound to give birth very soon.");
				output("\n\nLike her stomach, her breasts have grown significantly as well, clearly much larger than they were before. The zil has no hope of covering them with her chitinous armor in their current state, and has obviously given up trying. They leak honey incessantly, and large drops of sweet golden nectar fall to the ground even when the expectant mother does little more than shift her weight from one foot to the other.");
				break;
	}
	output("\n\nThe zil tilts her head in confusion at your perceived inaction, then notices how intently you’re checking her out. She smiles and cocks her hips seductively, playfully running her hands along her body like some kind of pregnant alien pin-up model. You have to admit, it’s pretty hot.");
	output("\n\nThe zil smiles. <i>“So, did you have anything else in mind?”</i>");
	
	pc.lust(15);
	processTime(3);
	
	fZilPregMenu();
	addDisabledButton(0, "Appearance");
}

public function fZilPregTalk():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You take a moment to pull yourself together, saying that you just want to talk to her for now.");
	output("\n\n<i>“You want to... talk?”</i> she asks, <i>“Just talk? Not what I expected, but intriguing all the same. What do you want to talk about?”</i>");
	
	fZilPregTalkMenu();
}

public function fZilPregTalkMenu():void
{
	addButton(0, "Safety", fZilPregTalkSafety, undefined, "Safety", "Ask the zil about her personal safety and the dangers of Mhen’ga for a pregnant female.");
	addButton(1, "Scent", fZilPregTalkScent, undefined, "Scent", "Ask if the zil can explain her extra-appealing aroma.");
	addButton(2, "Birth", fZilPregTalkBirth, undefined, "Birth", "Inquire about the state of the zil’s pregnancy, and when she thinks she might give birth.");
	addButton(14, "Back", function():void{clearOutput(); clearMenu(); author("MistyBirb"); output("The zil smiles. <i>“So, did you have anything else in mind?”</i>"); fZilPregMenu();}, undefined, "", "");
}

public function fZilPregTalkSafety():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You cross your arms and purse your lips, asking the zil why she’s wandering around the jungle while pregnant.");
	output("\n\nShe looks a bit indignant at your question, and narrows her eyes. <i>“I am still capable of supporting my village and my fellow zil. Just because I’m pregnant doesn’t mean there are fewer mouths to feed. Quite the opposite, really. Foraging is not a strenuous task, and this is zil territory. I am as safe here as I am in my village.”</i>");
	output("\n\nYou don’t answer her directly, but the skeptical look on your face is apparently more than enough to prompt the zil to keep going.");
	output("\n\n<i>“You don’t understand, you’re an offworlder. I was born and raised here. This is my home, and I know how to avoid danger. A zil does not live long enough to have children in the first place if they do not learn such things.”</i>");
	output("\n\nThe alien speaks with a prideful ferocity, and you raise a hand to calm her down. You apologize, telling her that you did not intend to upset her, only to make sure she was alright.");
	output("\n\nThe zil relaxes her stance, then smiles sheepishly. <i>“Your concern, while unnecessary, is still touching. Thank you. You offworlders are more compassionate than I expected.”</i>");
	
	processTime(7+rand(5));
	
	fZilPregTalkMenu();
	addDisabledButton(0, "Safety", "Safety", "You just finished talking about this.");
}

public function fZilPregTalkScent():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You inhale deeply through your nose, getting such a concentrated hit of pheromones that you actually feel a bit dizzy. Shaking your head, you ask the zil about her powerful scent, and why it seems so much stronger and more attractive than before.");
	output("\n\nThe alien woman chuckles. <i>“Because you are my mate. My scent has taken on some of your traits, tuned itself to your senses, because it is your children that grow inside me. You have marked me in a way that only a virile mate can, and what you’re experiencing is an extension of that.”</i>");
	output("\n\n<i>“To be perfectly honest,”</i> she adds, <i>“I am affected by your scent as well, though yours is not nearly as strong as the pheromones of a pure-blooded zil. Still, I know you are my mate from scent alone, and it is...”</i> She pauses and shuts her eyes for a moment, her antennae twitching. <i>“Arousing, to say the least.”</i> The zil slides her hands along her hips, eyeing you seductively. <i>“Perhaps we could explore these sensations together, hmm?”</i>");
	output("\n\nYou grin. That doesn’t sound like a bad idea.");
	
	pc.lust(15);
	processTime(7+rand(5));
	
	fZilPregTalkMenu();
	addDisabledButton(1, "Scent", "Scent", "You just finished talking about this.");
}

public function fZilPregTalkBirth():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You ask her how far along she is, and if she expects the children to arrive anytime soon.");
	
	switch(fZilPregStage())
	{
		case 1:	output("\n\n<i>“No, not for quite some time,”</i> she replies, idly rubbing her belly, <i>“Several months more, at least, but there is a chance that the union of our two species may result in a pregnancy that progresses differently than I expect. I feel all is going well, though. My instincts say that everything will be just fine.”</i> She says that last sentence with a warm smile on her face, looking down at her baby bump with motherly pride.");
				break;
				
		case 2:	output("\n\nThe zil smirks. <i>“Well, as you can see, they’re growing fast, but I believe there is still a fair amount of time before they arrive. Weeks, if not months. Zil are never born alone, you see, so we females grow to accommodate not just one child, but two, or sometimes even three. I believe it will be quite apparent when they are ready to greet the world.”</i> The alien woman looks positively joyful as she speaks, rubbing both hands along her pregnant belly and smiling broadly.");
				break;
				
		case 3:	output("\n\nThe zil takes a deep breath, then lets out a chuckle. <i>“Soon, I hope. Very soon. They’re beginning to make life rather difficult for their mother, what with their constant kicking and shifting around, not to mention how heavy they’ve become. But it is a burden all mothers bear, for the sake of their children. I shall manage, but I eagerly await their arrival. Not only to ease my aching body, but to finally hold them in my arms...”</i>");
				output("\n\nThe zil suddenly seems very emotional, averting her eyes and nervously fiddling with her hair. <i>“If you... wanted to be there for their birth,”</i> she says quietly, <i>“I would recommend staying nearby for the next several days. It’s up to you, of course...”</i>");
				break;
	}
	
	processTime(7+rand(5));
	
	fZilPregTalkMenu();	
	addDisabledButton(2, "Birth", "Birth", "You just finished talking about this.");
}

public function fZilPregFuck():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	var x:int = pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25);
	
	output("You smile as you " + (pc.isNude() ? "set your things aside" : "begin to undress") + ", and the zil practically reads your mind. <i>“You want to fuck me, even though I’m already pregnant, don’t you?”</i> she asks coyly, tracing a fingertip across her tummy.");
	output("\n\nYou give a hasty nod, struggling to reign in your arousal. Between the brain-fogging pheromones and the zil’s natural allure, you don’t just <i>want</i> to fuck her, you <i>need</i> to. She giggles and cradles her belly as she lowers herself to the ground, watching you with lusty, half-lidded eyes. Your alien partner sprawls across the jungle floor, letting you situate yourself between her open legs.");
	output("\n\n<i>“You have to promise to be gentle...”</i> she says. There’s an air of seriousness in her otherwise seductive tone, and you realize that your animalistic lust will have to be sated more carefully than you might like.");
	output("\n\nWith a reassuring caress of her rounded stomach, you press [pc.cock "+x+"] against her sex and tease her with a few half-thrusts. She shivers with delight as you grunt and bite your lip, doing your best to control yourself.");
	output("\n\nTaking a deep breath, you slide forward, spreading her honeyed lips to bury your [pc.cock "+x+"] deep inside her. The zil lets out a demure whine, and as she does, the true extent of her arousal becomes clear. It seems like she hasn’t gotten off in some time, although she had been hiding it rather well. But now she’s reached the limit of her self-control, and you’ve reduced her to a red-faced puddle of lust with nothing but a paltry amount of foreplay and a single thrust.");
	output("\n\nYou start to move, pumping in and out of your alien lover at a steady pace. The zil tosses her head back and forth, then suddenly seizes up with a loud yell, cumming hard. You’re caught totally off-guard as her vagina clamps around you, a surprising tightness that forces you to stop for a moment. She pants and brings a hand to her mouth, obviously embarrassed at having cum so quickly. Once she’s collected herself, she urges you on with a desperate nod and watery eyes. <i>“I need... more...”</i> she pants.");
	output("\n\nThat does nothing but fan the flames of your barely-controlled lust, and you begin to thrust with enough force to make her heavy, honey-leaking breasts wobble and bounce. The zil cries out, babbling incoherently as she nearly cums a second time. You manage to slow down a bit after a few seconds, still mindful of her pregnancy. Her belly prevents you from pressing your bodies together, but the zil reaches for your hand and squeezes it tightly. She stares into your eyes, her expression radiating a genuine happiness even when she’s lost in the throes of lovemaking.");
	if(flags["FZIL_PREG_FUCKED"] == undefined) output("\n\nYou finally find a comfortable rhythm and pace, but it’s obvious the zil is doing everything she can to hold off another orgasm. All the movement and activity has strengthened her pheromones, though the effect is different than what you’re used to. You feel... possessive of her, and you’re not only getting pleasure from fucking her senseless, but a real sense of pride. You keep a firm grip on her hand as you continue to thrust, fueled by an instinctual desire to hear and feel her orgasms.");
	else output("\n\nYou finally find a comfortable rhythm and pace, but it’s obvious the zil is doing everything she can to hold off another orgasm. All the movement and activity has strengthened her pheromones, and that familiar surge of dominant pride overcomes you. She is <i>your</i> mate, carrying <i>your</i> children, and has been driven to the edge of sense by <i>your</i> sexual prowess. In that moment, you have complete control of her, and the feeling is nothing less than divine. You keep a firm grip on her hand as you continue to thrust, fueled by an instinctual desire to hear and feel her orgasms.");
	output("\n\nEventually, the inevitable comes to pass, and the zil cums again with a high-pitched yelp. Her vagina tightens and clenches around your dick, but you are prepared this time, and you barely lose any momentum. Once she’s calmed down, you pick up exactly where you left off, intent on giving her every climax her body can take. Her pregnancy has made her absurdly sensitive, and the steady pumping of your cock is sending her into what could only be called an orgasmic fit. Copious amounts of honey leak from her breasts, and her long, hollow tongue hangs from her mouth.");
	output("\n\nThe sex feels like some of the most intense you’ve ever experienced, even though nothing the two of you are doing is all that exotic. But there’s something unique about burying yourself inside the pregnant zil, knowing it was you that made her that way. Knowing that her gravid belly is a direct result of your virility...");
	output("\n\nYou pause the movement of your hips for a moment, leaning forward over your alien partner. Thrusting isn’t possible in this position, not without you being forced to press your body against her belly, but you can bring your face very close to hers. She pants and looks into your eyes, then your lips meet. The two of you kiss for a long while, but the zil eventually pushes you away.");
	output("\n\nShe scoots back and brings her legs together, rolling onto her side and pulling her stinger away to present her magnificent ass. Her sweet, golden girl-cum drips down her chitinous thigh, and she props herself up on her elbows with a pleading look in her eyes.");
	output("\n\n<i>“Like this,”</i> she says, barely above a whisper.");
	output("\n\nYou’re happy to oblige, pressing your [pc.cockHead "+x+"] against her pussy and sliding inside once more. From this new vantage, you are much closer to your zil partner, able to press your bare [pc.skinFurScales] against her. She has to twist her head and shoulders to properly face you, but with her belly out of the way, you’re able to fuck her much harder than before. She is again reduced to a nearly insensate state over the course of a few moments, cumming a third time. Overwhelmed by her orgasms, the zil girl flops against the jungle floor, losing all semblance of composure, and the sight of her absolute pleasure is your limit.");
	if(pc.hasKnot(x))
	{
		output("\n\nYour [pc.knot "+x+"] swells and seals your cock inside the zil as you begin to pump her full of [pc.cum], but it has nowhere to go, forcing itself back out even with your knot doing its best to keep everything inside her. " + (pc.cumQ() >= 5000 ? "Your incredible load causes a bit of a spectacle, being shot out at random angles in high-pressure spurts that fly quite a distance before slapping against the ground." : "") + "");
		output("\n\nThe ordeal leaves you panting heavily, and your head begins to spin a little. You blink rapidly and try to steady yourself, lying down beside the zil with your [pc.cock "+x+"] still lodged firmly inside her vagina. Instinctively, you wrap an arm around her before slipping into unconsciousness.");
	}
	else output("\n\nYou shudder as you begin to pump the zil full of [pc.cum], but almost all of it comes spilling out of her pregnant hole. " + (pc.cumQ() >= 5000 ? "Your incredible load has nowhere to go, and it puddles on the ground as it gushes out around your cock. " : "") + "Physically exhausted and intoxicated on pheromones, you feel a bit light headed. As your orgasm winds down, you naturally settle beside your pregnant lover, embracing her tenderly. You feel her smooth, chitin-covered fingers caressing your arm, and then you slip into the bliss of sleep...");
	
	flags["FZIL_PREG_FUCKED"] = 1;
	processTime(25+rand(10));
	pc.orgasm();
	
	addButton(0, "Next", fZilPregFuckII, undefined, "", "");
}

public function fZilPregFuckII():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You wake gently, and the first thing you see is the back of your zil lover’s head. Your hand is resting on her stomach lovingly, and she’s sound asleep beside you. You try to disentangle yourself without waking her, but it proves impossible. The alien woman doesn’t seem upset to be woken up, though, looking over her shoulder and smiling warmly as she sits up.");
	output("\n\n<i>“That was... very nice,”</i> she says.");
	output("\n\nYou agree, taking in another deep breath of pheromones and mentioning how much better the sex seemed to be because of them.");
	output("\n\nThe zil smirks and brushes her hair out of her face. <i>“Perhaps the scent of a pregnant zil is especially potent for you off-worlders. Mating with a partner that’s already pregnant doesn’t serve any purpose other than pleasure, and our scents change to enhance that pleasure even more than usual. Enjoy it while it lasts. Or... perhaps you could ensure that mating always feels this good?”</i> She grins at you with obvious sexual hunger, despite the thorough fucking you just gave her.");
	output("\n\nThe prospect of keeping the bee girl eternally pregnant is an enticing one, but for the moment you know you have to continue on. You stand up and help the zil to her feet, then gather your things. The expectant mother looks disappointed that you’re leaving, but not overly so. Behind her slight frown is an understanding and acceptance, and she seems to be happy enough just getting to see you again. Before you go, though, she grabs your arm, spins you around, and gives you a final kiss goodbye.");
	output("\n\n<i>“Be safe,”</i> she says.");
	output("\n\nYou nod. <i>“You too.”</i>");
	
	processTime(45+rand(30));
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilPregFeed():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	if(fZilPregStage() == 1)
	{
		output("You look at the armored plates covering the zil’s chest, noticing that her breasts seem to be straining against the glossy black chitin. It’s as if she’s wearing a bra that’s a few sizes too small, and it doesn’t look comfortable in the slightest...");
		output("\n\n<i>“What?”</i> she asks, <i>“Why are you staring at me?”</i>");
		output("\n\nWanting to get straight to the point, you move in and set one hand on each of her breasts, applying a bit of pressure. The zil winces in response.");
		output("\n\n<i>“Just as I thought,”</i> you say, <i>“You’re all full up, aren’t you?”</i>");
		output("\n\nThe zil looks a bit flustered at your blunt nature. <i>“The pregnancy...”</i>");
		output("\n\n<i>“I can help, if you’ll let me.”</i>");
		output("\n\nShe looks you in the eye for a moment, then smiles. You feel her smooth chitin armor slide across your fingertips as it retracts, and the bee girl’s breasts are exposed to the open air, falling right into your waiting palms. The zil’s honey-stuffed mammaries have a noticeable heft to them, and you begin to coax out their motherly bounty with a gentle massage. Moving your hands in careful circles, you put your thumbs right on her nipples, tracing them around her jet-black areolae.");
		output("\n\nYour alien partner sighs in relief, shutting her eyes as sweet golden nectar begins to flow freely from her breasts. You steal a quick taste, leaning in and dragging your tongue along the zil’s honey-dampened skin before wrapping your lips around one of her nipples.");
		output("\n\n<i>“Wait,”</i> she says, prompting you to pull away, <i>“Over here.”</i>");
		output("\n\nShe walks over to a mossy boulder, lowering herself to the ground and resting against it. You drop to your knees and straddle the zil’s legs, a position that gives you unrestricted access to her breasts. The pregnant alien rubs her stomach and " + (pc.hasHair() ? "runs her fingers through your [pc.hair]" : "caresses the side of your face") + " as you tease her nipple with your tongue, overwhelmed by a feeling of motherly bliss.");
	}
	else
	{
		output("You stare at the zil’s big, rounded breasts and grin lasciviously. While the average zil woman is hardly lacking an enticing pair of boobs, the pregnancy has made your partner’s all the more noticeable, to the point where she is forced to leave them exposed to the open air at all times as opposed to hiding them behind her natural chitin armor. Her jet black nipples are already fully erect, and drops of honey slip down the front of her breasts at regular intervals.");
		output("\n\nShe catches you ogling her and smiles. <i>“Hungry?”</i> she asks, bringing a hand to each luscious mound and squeezing gently. The pressure releases a trickle of bountiful golden nectar, and you can’t resist the invitation. You lean in to wrap your [pc.lips] around the zil’s nipple, and your mouth is filled with a divine sweetness. The zil’s honey is pure, smooth, and sweet like nothing else you’ve ever tasted. A delicacy in every sense of the word.");
		output("\n\n<i>“Wait,”</i> she says, prompting you to pull away, <i>“Over here.”</i>");
		output("\n\nShe walks over to a mossy boulder, lowering herself to the ground and resting against it. You drop to your knees and straddle the zil’s legs, a position that gives you unrestricted access to her breasts. The pregnant alien rubs her stomach and " + (pc.hasHair() ? "runs her fingers through your [pc.hair]" : "caresses the side of your face") + " as you tease her nipple with your tongue, overwhelmed by a feeling of motherly bliss.");
	}
	output("\n\n<i>“This is nice,”</i> she says quietly, <i>“It feels so good, having someone to nurse. It just goes to waste otherwise...”</i>");
	output("\n\nYou pause for a moment to glance up at the zil, surprised at the compassionate, loving expression on her face. Her pregnancy has certainly mellowed her personality a bit. She’s a far cry from the feisty sexual challenger you first met...");
	output("\n\nOr so you think. With a sudden grin, the zil reaches around her gravid stomach and presses her hand against your groin. You grunt in surprise as she chuckles and ");
	if(pc.isNude()) output("takes your [pc.biggestCock] in her hand");
	else output("frees your dick" + (pc.totalCocks() > 1 ? "s" : "") + " from the confines of your clothing");
	output(", obviously intent on doing more than just feeding you some honey.");
	if(pc.hasVagina()) output("\n\nShe strokes you lackadaisically, and you do your best to relax as her handjob picks up, burying your face in her beasts and continuing to drink from her delicious bounty. Her fingers explore your cock" + (pc.totalCocks() > 1 ? "s" : "") + " from tip to base " + (pc.balls > 0 ? "and dance across your [pc.balls], " : "") + "masterfully teasing your manhood until she discovers something altogether different, just a little bit lower. The zil smirks, but doesn’t miss a beat, slipping two fingers into [pc.oneVagina] and flicking her thumb across [pc.eachClit]. The sudden stimulation catches you off-guard, and the zil’s honey-leaking nipple pops from your mouth as you let out a surprised squeak.");
	else output("\n\nShe strokes you lackadaisically, and you do your best to relax as her handjob picks up, burying your face in her beasts and continuing to drink from her delicious bounty. Her fingers explore your cock" + (pc.totalCocks() > 1 ? "s" : "") + " from tip to base " + (pc.balls > 0 ? "and dance across your [pc.balls], " : "") + "masterfully teasing your manhood and making you shudder with arousal.");
	output("\n\nShe laughs. <i>“Goodness. Was it my scent that got you like this? " + (pc.isSquirter() ? "You’re absolutely soaking. " : "") + "You know, for zil, the more powerful the father’s attraction to the mother’s pheromones, the more compatible the two are as mates." + (pc.isSquirter() ? " If this mess between your legs is any indication, I’d say we’re quite compatible indeed..." : "") + "”</i>");
	output("\n\nYou pause your suckling again, sharing another surprisingly tender moment with the zil, but it’s interrupted as she pushes you backwards playfully. The shove was hardly strong enough to actually tip you over, but you go along with it regardless, pulling yourself away and sitting in the dirt with your erection" + (pc.totalCocks() > 1 ? "s" : "") + " sticking straight up into the air. The beautiful bee girl scoots over to you with a wink, then she begins to vigorously jerk you off. In this new position, the zil is able to squeeze and tease everything below your waist, and her long, flexible tongue wraps itself around the tip of your [pc.biggestCock], prompting you to let out a shuddering moan.");
	output("\n\nYou grab fistfuls of dirt and grass, thrusting your hips into the air and gritting your teeth. <i>“Cumming!”</i> you grunt, giving the zil just enough warning that she’s able to pull her tongue away and open her mouth wide.");
	if(pc.cumQ() >= 5000)
	{
		output("\n\nYou give the mother of your children the facial to end all facials, drenching not only her face, but her entire upper body in a ridiculous amount of [pc.cum]. Your dick" + (pc.totalCocks() > 1 ? "s are like fountains" : " is like a fountain") + ", and drops of [pc.cumColor] rain from the sky and pool on the ground around you.");
		output("\n\nEventually, your orgasm ends, and you can hear the zil giggling between your exhausted pants. You roll over to see her wiping [pc.cumNoun] off her tits and face, grinning in amusement. She has no hope of cleaning herself completely without a proper bath, but she manages to do a decent enough job with just her hands.");
		output("\n\nWhen she’s done all she can, she pulls herself close and lays down beside you, her head resting on your shoulder and her belly on your thigh.");
	}
	else
	{
		output("\n\nYour dick" + (pc.totalCocks() > 1 ? "s give" : " gives") + " her exactly what she wants, covering her face in [pc.cum]. She manages to catch a fair deal of your load in her mouth, swallowing it without a second thought. She uses a combination of her hands and tongue to clean herself up, then laughs.");
		output("\n\n<i>“I thought it was only fair,”</i> she says, <i>“I feed you, and you feed me.”</i> You chuckle, and the pregnant zil pulls herself close to lay down beside you, her head resting on your shoulder and her belly on your thigh.");
	}
	output("\n\nYou instinctively wrap an arm around her, basking in the afterglow of your orgasm. She cuddles up to you, close enough that you can feel her heartbeat. Near your waist you feel a tiny thump, and you glance up to see what it was. There’s nothing you can see other than your partner’s pregnant tummy, and a realization hits you. You put your free hand on the zil’s stomach, gently sliding across it until you feel the sensation again.");
	output("\n\n<i>“I think all this fun might have excited them,”</i> the zil whispers, <i>“They’re kicking up a storm in there.”</i> You smile and look her in the eyes, giving her a gentle kiss on the forehead and squeezing her a little tighter. There’s an indescribable warmth welling up in you, a mixture of pride, happiness, and maybe a little bit of anxiety, but it’s a great feeling.");
	output("\n\nYou lay with the zil for a long while, but unfortunately the moment can’t last forever. You carefully sit up and nudge her, but the zil doesn’t resist. She pulls away and nods, understanding that you have to go. She doesn’t look happy, but she doesn’t exactly look sad, either. You stand up to give her a final hug and kiss, and she helps you gather your things.");
	output("\n\n<i>“Take care,”</i> she calls after you, waving.");
	output("\n\n<i>“You too,”</i> you reply.");
	
	processTime(45+rand(30));
	pc.orgasm();
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilPregRelax():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	output("You look at the pregnant alien for a moment, then sigh and take a step back. Even with your pheromone-induced arousal, you’re not in the mood for sex. For whatever reason, you desire something much simpler.");
	output("\n\n<i>“Is something wrong?”</i> she asks.");
	output("\n\nWith a smile, you tell her that nothing is wrong, but that you’d like to simply pass some time, maybe just sit down and relax for a while.");
	output("\n\nThe zil looks skeptical. <i>“You want to... sit here?”</i>");
	output("\n\nYou laugh and grab her hand, leading her over to a nearby tree. Lowering yourself to the ground and sitting against it, you invite her to do the same. The zil gives you a curious smile before carefully easing herself down and sitting beside you. She’s clearly a bit awkward about it, at least until you wrap an arm around her shoulder and bring her in close. ");
	output("\n\n<i>“Is this some kind of mating ritual among your people?”</i> she asks.");
	output("\n\nYou’re caught off-guard by her question and laugh. <i>“Sometimes, maybe? Mostly it’s just a nice way to spend time together.”</i>");
	output("\n\n<i>“And this is all it is? We just sit here?”</i>");
	output("\n\n<i>“Yeah.”</i>");
	output("\n\n<i>“Oh.”</i>");
	output("\n\nYour companion seems confused for the first few moments, but is eventually lulled into a relaxed and peaceful state. Her head comes to rest on your shoulder, and her hands on her pregnant belly, as you lean back against the tree and simply enjoy the moment. You shut your eyes to bask in the warmth of the jungle air, listening to the ambience and taking a few deep breaths.");
	output("\n\nInevitably, those deep breaths fill your nostrils with more of the zil’s potent pheromones, but you don’t seem to be too distracted by them. You know your mate is safe and sound beside you, and that is more than enough. The zil lets out a quiet sigh and shifts herself slightly, leaning more of her weight against you, and the two of you sink into a blissful silence.");
	output("\n\nMinutes pass without interruption, until the zil yawns and snuggles up against you even more. <i>“This is nice,”</i> she whispers.");
	output("\n\nHer statement is followed by a gentle twitch of her antennae, the slight movement just enough to tickle the side of your face and make you smile. You feel as if you could stay like this forever, resting peacefully with your partner in your arms without a care in the world.");
	output("\n\nUnfortunately, such an idyllic fantasy is just that, a fantasy. While your time spent with the zil is wonderfully relaxing, you know it must come to an end eventually. You open your eyes and lean forward carefully, stirring her from her daydreams.");
	output("\n\n<i>“Hm?”</i> she asks sleepily, <i>“What is it?”</i>");
	output("\n\nYou stroke her hair and give a wistful half-smile. <i>“I should probably get going,”</i> you say, though not without an obvious note of regret in your tone.");
	output("\n\nThe zil looks disappointed, but she nods her head and pulls away, allowing you to stand up. She stays on the ground, legs folded to the side and one arm propping her up, her hand lingering on the spot you had just occupied. You offer your own hand to help her up, but she declines.");
	output("\n\n<i>“I think I might keep doing this,”</i> she says, <i>“For a little while.”</i>");
	output("\n\nYou chuckle. <i>“Okay then. Stay safe.”</i>");
	output("\n\nTurning away and walking off into the jungle, you hear the zil sigh longingly at your departure, which makes you smile. You make a mental note to try and find her again sometime, as spending time with her has left you feeling relaxed and invigorated like few things can. ");
	
	pc.energy(45);
	processTime(30+rand(15));
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilBirthHook():void
{
	clearOutput();
	clearMenu();
	author("MistyBirb");
	
	output("A male zil drops out of the sky to land in front of you. You recoil and instinctively take up a defensive stance, but the alien doesn’t seem like he’s interested in conflict. Rather, he almost looks concerned.");
	output("\n\n<i>“You certainly smell like her,”</i> he mutters.");
	output("\n\nYou ask the zil what he wants from you, still on guard.");
	output("\n\n<i>“Your mate requested that we look for you. She wants you to be there for the birth of your children. Follow me, I will take you to her.”</i>");
	
	processTime(3);
	
	addButton(0, "Follow", fZilBirthFollow, undefined, "", "");
	addButton(1, "Refuse", fZilBirthRefuse, undefined, "", "");
}

public function fZilBirthRefuse():void
{
	clearOutput();
	clearMenu();
	author("MistyBirb");
	
	output("The zil frowns. <i>“What? Why not? This is not some kind of trick, offworlder, and we don’t have the luxury of time. Are you refusing to stand by your mate?”</i>");
	
	addButton(0, "Yes", fZilBirthRefuseConfirmed, undefined, "Yes", "You’re not interested in watching a zil give birth. You have other things to do.");
	addButton(1, "No", fZilBirthFollow, undefined, "No", "You feel obligated to be there for her, even if you’re a bit uncertain about all of this.");
}

public function fZilBirthRefuseConfirmed():void
{
	clearOutput();
	clearMenu();
	author("MistyBirb");
	
	output("The male zil crosses his arms and gives you a look of utter disdain. <i>“Tsk. I expected no less from an alien stranger, honestly, but she was insistent. Fine, go about your business. I don’t care.”</i> He takes off and disappears, leaving you to continue on your way.");
	
	pc.addHard(5);
	processTime(5);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fZilBirthFollow():void
{
	clearOutput();
	clearMenu();
	showBust("ZILFEMALE");
	showName("PREGNANT\nFEMALE ZIL");
	author("MistyBirb");
	
	var numMale:Number = fZilBirth(true, (GetGameTimestamp() + 240 + rand(60)));
	
	output("He takes off into the jungle without another word, moving with an obvious sense of urgency. You struggle to keep pace with him, but never lose him entirely, and you eventually emerge from the jungle brush to find a quaint collection of primitive huts and several dozen zil. Almost the entire population of the village turns to look at you, their antennae collectively twitching, but most look more confused than hostile.");
	output("\n\nYour zil guide continues on without hesitation, and you’re forced to shrug off your apprehension and follow him before he disappears among his kin. He takes you through the center of the village and towards the opposite edge without stopping or even looking back to see if you’re still following him. As you walk, you can hear some strained cries, and notice a particularly thick gathering of zil around a lone hut up ahead. You’re lead directly towards them, the male zil pushing his way through the crowd and making some space for you.");
	output("\n\n<i>“She’s inside,”</i> he says, motioning towards the hut. His statement is immediately followed by a loud yell from within, and you give a " + (pc.isAss() ? "cautious" : "nervous") + " nod before thanking him and entering the primitive structure.");
	output("\n\nYou see the zil you impregnated lying on a simple bed of leaves surrounded by several other female zil, one of whom is clutching your mate’s hand. The mother-to-be brightens as she sees you, even managing a brief smile through the strain of labor. It doesn’t last long, though, as she grits her teeth and cries out. You " + (pc.isTaur() ? "settle in" : "crouch down") + " beside her, offering her the comfort of your presence, if little else.");
	output("\n\nThere’s not much you can do other than stay by her side, but that seems to be all that’s expected of you. The other zil in the hut seem quite calm and focused, and all indications are that everything is going well. After a long, tense period of shouting and herculean effort on the part of your mate, one of the observing zil suddenly moves forward and holds her hands at the ready, welcoming an infant into the world just moments later. She cradles the newborn child and scoots to the side, making room for another zil to assume a similar role.");
	output("\n\nBefore long, both of your children have been born, and their healthy cries replace those of their mother, who is quickly surrounded by the remaining zil attendants. You stand up and [pc.move] away, letting the zil perform what appears to be a highly-coordinated and practiced procedure of tending to the new mother. She’s helped upright and given the first of her children, whom she quickly brings to her breast with a sigh of overwhelming relief.");
	output("\n\nYou finally feel comfortable approaching her again, and you lower yourself to her eye level. She turns and smiles gently, obviously exhausted, but also blissful. <i>“I didn’t think they’d find you,”</i> she murmurs.");
	output("\n\n<i>“It was quite the surprise.”</i>");
	output("\n\n<i>“Well, I’m glad you were able to be here. The birth of children is a joyous thing for zil. I hope it is for your kind as well.”</i>");
	output("\n\nYou smile. <i>“Yes, very much so.”</i>");
	output("\n\nAnother zil interrupts the two of you for just a moment, kneeling down and handing you your other child with a friendly expression and an encouraging nod. It’s the first real opportunity you’ve had to get a look at both of your children side by side, and you’re pleased to see that each of them seems perfectly happy and healthy. You’re the father of two " + (ChildManager.numOfType(GLOBAL.TYPE_BEE) > 2 ? "more " : "") + "adorable zil hybrids, ");
	if(numMale == 0) output("both girls");
	else if(numMale == 1) output("one boy and one girl");
	else output("both boys");
	output(". If it weren’t for the tufts of [baby.hairColor] hair and [baby.skinColor], human-like skin, they’d be almost indistinguishable from pure zil, with their tiny antennae and cute patches of barely-developed chitin.");
	output("\n\nYou bask in a warm combination of pride and happiness, settling against the wall of the hut beside the happy new mother. Every other zil nearby seems quite happy themselves, and you look outside to see a similar joy shared by the slowly-dispersing crowd.");
	output("\n\nSeveral minutes of peaceful silence pass, before your mate clears her throat to get your attention. You turn to face her, noticing that she’s wearing a conflicted expression. Instinctively, you ask her if something is wrong.");
	output("\n\n<i>“I have been anticipating this moment for many months,”</i> she says, giving a rueful smile, <i>“But now, I am paralyzed with uncertainty.”</i>");
	output("\n\nYou tilt your head and ask her to elaborate.");
	output("\n\nShe is quiet for several seconds, before speaking in a hushed tone. <i>“Can you take our children away from here? Is there a way you could raise them to be like you and the other offworlders?”</i>");
	output("\n\nYou look down at the infant in your arms, a proud smile spreading across your face. <i>“Yes,”</i> you answer.");
	output("\n\nThe zil sighs with immense relief. <i>“Thank you. Our world was dangerous enough in the past, but the arrival of so many offworlders makes me even more uncertain about the future of the zil. I do not want to worry about my children’s future. I want them to live safe, happy lives, and I believe that you are better suited to giving them that than I. And... If it is you that raises them, maybe they will one day be able to return to Mhen’ga, to see their mother...”</i> She looks down at her newborn child with tears in her eyes and a bittersweet expression, but quickly reigns in her emotions and collects herself. <i>“Where will you take them?”</i> she asks.");
	output("\n\nYou tell her of the nursery your father created for you, going into detail about the cutting-edge caretaking technologies it contains. There are many terms you use that she obviously does not understand, and you do your best to explain how the children will be cared for and educated in ways she is able to comprehend. When you finish, her eyes are wide with wonder, and any doubts she had long gone.");
	output("\n\n<i>“Normally I would not believe such fantastical claims,”</i> she says, <i>“But I have seen what you and others like you are capable of. To think that such things were possible...”</i> Her face once again takes on a look of concern, but only for a moment. She shakes it off, and then suddenly pulls herself to her feet, still cradling her baby. <i>“So, how are we to get them to this nursery you speak of?”</i>");
	output("\n\nYou chuckle and pull out your Codex, inputting a few commands and telling her that she won’t have to do anything. The wait for the Nursery probe’s arrival passes quickly enough, though it causes a bit of a commotion when it lands just outside the hut.");
	output("\n\nThe two of you step out into the open air, and you deal with the probe while your mate tells her kin to not be alarmed. The probe’s hatch lets out a hiss as it pops open, and you place your infant child inside it, making sure they are safe and snug. You turn to take the other baby, and your zil mate freezes for a moment. She takes a deep breath, stepping past you and placing the child inside the probe herself. You nod your head and back away, more than happy to give her as much time as she needs.");
	output("\n\nShe looks at her children for a while, smiling, as a crowd of curious onlookers gathers around the probe. Eventually, the heavy-hearted mother steps away from the probe and lets you send it on its way, the other zil gasping in awe as it shoots into the sky and disappears.");
	output("\n\nFrom there, it’s just a matter of saying goodbye. You spend a little more time among the zil, rather enamored with their surprising hospitality, before eventually bidding them farewell. You begin your trek back, looking over your shoulder one last time as you near the edge of the village. You see your mate watching you depart, and she gives you a wave, which you reciprocate before heading back out into the jungle.");
	
	processTime(360+rand(60));
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}