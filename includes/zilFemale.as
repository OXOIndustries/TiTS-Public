import classes.Creature;

//Female zil Encounter
function femzilEncounter():void {
	pc.lust(4);
	//[First Time]
	if(flags["TIMES_MET_FEMZIL"] == undefined) {
		flags["TIMES_MET_FEMZIL"] = 1;
		output("As you move through the brush, you push aside a thick clump of overgrown branches only to reveal a wide clearing, maybe fifty feet across, with a fallen tree trunk right at its center. Sitting atop it you see a shapely female clad from head to foot in well-polished black chitin, reclining with one leg crossed over the other, only just hiding her bare crotch from sight. A belt rests on her flared hips, holding dozens of small vials and tiny darts, each hilted by exotic looking fetishes and woven braids.");
		//If PC has encounter a zil male before:
		if(flags["ENCOUNTERED_ZIL"] != undefined) output("\n\nYour codex beeps out a warning about the zil, but it doesn't take an anthropologist to figure out you've found one of their females. You start to ready a weapon as the girl turns toward you, but seeing you, she quickly puts up her hands in an disarming gesture of peace. <i>\"Hey there, no need for violence!\"</i>");
		//Else if PC has not encountered a zil bro before:
		else output("\n\nYour codex beeps out a warning about a race called the zil, advising against approach and especially against inhaling their pheromones. However, contrary to the device's warnings about extreme hostility, the girl puts her hands up in a gesture of peace. <i>\"Hey there, stranger.”</i>");
		//{Combine, same paragraph:}
		output("\n\nShe smiles. <i>\"Don't worry, I don't mean you any harm. Just the opposite!\"</i> she says, leaning back and spreading her legs, revealing the pale yellow flesh around her vulva. A pair of fingers dips in to massage her hole.");
		output("\n\n<i>\"Come on, stranger, help yourself! Or.. maybe you'd like a taste of my home-made honey?\"</i>  she asks, pushing aside the chitin plate on her chest to reveal a full, pert breast; at the slightest squeeze, a thick dollop of an amber liquid drips from her nipple, sticking to her fingers.");
		output("\n\n<i>\"Any way you want it, stranger, that’s the way you need it! Just show me what you've got!\"</i>");
		output("\n\nBefore you can think, though, a strong, sweet smell wafts past you, nearly overwhelming your senses... damn, she smells <b>amazing</b>. It takes all your force of will to resist diving into her arms, and even then, your body urges you to take her up on the offer. What do you do?");
		//[Fight her]
		//[Leave]
		//{Sex Options Here}
	}
	//[Repeat] (If PC didn't fight her last time)
	else if(flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined) {
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, but relaxes as she recognizes you. <i>\"Hey there, stranger. Back for a taste of my honey?\"</i>");
		//[Fight her]
		//[Leave]
		//[Get Honey]
		//{Sex Options Here}
	}
	//[Repeat] (If PC fought her last time)
	else {
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, grabbing one of the darts from her belt to defend herself. <i>\"H-hey there, stranger, no need to get violent. Just back off, okay?\"</i>");
		//[Fight her]
		//[Leave]
	}
}

//Leave (Must pass an Easy Int check, penalized by high Libido, to break away from zil Pheromones)
function tryToLeaveFemzil():void {
	clearOutput();
	output("You back away from the sweet-smelling zil, even though your body yearns powerfully for her touch.");
	//if Fought before:
	if(flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined) {
		flags["FOUGHT_FEMZIL_LAST_TIME"] = undefined;
		output(" She seems to relax as you step back, and slips her dart back onto her belt. Maybe she'll let her guard down next time...");
	}
	else output(" She makes a pouting face as you turn away, and calls out, <i>\"Well fine, I didn't want to fuck your brains out anyway!\"</i>");
	processTime(10);
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//Fight
function fightDatFemzil():void {
	flags["FOUGHT_FEMZIL_LAST_TIME"] = 1;
	clearOutput();
	output("You shake off the potent draw of the zil girl's pheromones and level a weapon at her, ready to fight.");
	output("\n\n<i>\"Woah! Back up, </i>");
	if(pc.tallness <= 52) output("<i>little </i>");
	else if(pc.tallness >= 72) output("<i>big </i>");
	output("<i> " + pc.mfn("boy","girl","uh... dude") + "!\"</i>  she cries, jumping back and readying her darts. It's a fight!");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",startCombat,"zil female");
}

//Combat Description:
//The female zil you're fighting stands just shy of 5'6, and is covered from head to toes in shiny black chitin. A downy fuzz falls from her head down to her shoulders, resembling curly blonde hair. She's got dozens of sharp darts on her belt, noticeably discolored with chemicals, and a number of glass vials at hand full of who-knows what. Worse, she's got a full bee-like abdomen behind her with a deadly-looking stinger. She moves with a liquid, feline grace, assuming a combat stance that leaves her crotch pointed at you to fill their air with lusty pheromones as her perky tits jut out at you, bobbing from side to side enticingly.
//Combat Techniques:
//Miss Text: The zil girl tumbles out of the way with a swift contortion.
//Block Text: The zil's chitinous armor deflects your attack.

//AI: Throws darts most turns (25% chance to toss a Lustbang); any turn the PC uses a melee weapon, she'll counter with her Stinger attack. Once she gets down to half health, she'll start mixing Stingers into her normal combat routine, about 25% of the time. 
//9999

//Dart Throw:
function zilFemaleDartThrow():void {
	//Light physical + light poison damage/ DOT
	output("Pursing her black lips in anger, the zil girl leans back and lets fly with a red-tipped dart, sending it right at you!");
	//{standard dodge/miss messages}
	if (combatMiss(foes[0],pc)) 
	{
		output("\nYou twist to avoid the dart!");
	}
	//It hits!
	else {
		var attacker:Creature = foes[0];
		var target:Creature = pc;
		//Damage bonuses:
		var damage:int = attacker.meleeWeapon.damage + attacker.physique()/2;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		var sDamage:int = 0;
		if(pc.shieldsRaw > 0) {
			sDamage = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
			if (target.shieldsRaw > 0) 
				output(" The dart spangs uselessly off your shields! (<b>" + sDamage + "</b>)");
			else 
				output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage + "</b>)");
			damage -= sDamage;
		}
		if(damage >= 1) 
		{
			damage = HPDamage(target,damage,attacker.meleeWeapon.damageType);
			output(" The dart punches right through your ");
			if(pc.armor.shortName == "") output(pc.armor.longName);
			else output("[pc.skinFurScales]");
			output(" with surprising ease, and your [pc.skin] suddenly flushes, burning as whatever she coated this dart with boils your blood! (" + damage + ") (Lust: " + 10);
			pc.lust(10);
		}
	}
	processCombat();
}

//Pheromone Fan:
function pheromoneFanFromZilFemale():void {
	output("Suddenly, the zil girl drops her combat stance, and dips her fingers right into her honeypot, masturbating furiously. You wonder what the hell she's doing, but suddenly your senses are assaulted by a potent cloud of her sex pheromones!");
	//{Moderate toughness check pass}
	if(pc.physique() + rand(20) + 1 > 20) {
		output("\nYou hold your breath as long as you can, waving the lusty cloud away from you. Before long, the zil girl tires out, nearly cumming before she stumbles back with chest heaving. There's a thick scent of sex in the air by the time you breathe again...");
		foes[0].lust(5);
	}
	else {
		output("\nEventually, you can hold your breath no longer, and you're forced to inhale the potent cloud deep into your lungs. Your heart hammers in your chest faster and faster while your [pc.skin] flushes and your lips unconsciously purse.");
		if(pc.lust() < 33) output(" A tingling warmth in your crotch leaves no doubts as to the effectiveness of your alien foe's 'attack'.");
		else if(pc.lust() <= 66) output(" The warm, incessantly building heat in your loins is getting hotter and hotter with every breathe you take.");
		else
		{
			output(" Your crotch feels so hot that you know you just HAVE to touch her soon. Damn this woman and her stupid... sexy... beautiful alien body.");
		}
		pc.lust(10+pc.libido()/10);
	}
	processCombat();
}

//LustBang:
//Lust grenade; chance to blind for 1d3 turns
function lustBangOut():void {
	output("The zil girl dances away from you, just out of reach before grabbing one of the vials off her belt and throwing it at the ground just in front of you!");
	
	//If Speed is higher and passes check:
	if(pc.reflexes() + rand(20) + 1 > 15) {
		output(" You leap out of the way, rolling to the side as a pink haze envelopes the ground where you were standing a moment before. Though even at this distance, your skin tingles sensually...");
		pc.lust(1);
	}
	//If Toughness is higher and passes check:
	if(pc.physique() + rand(20) + 1 > 20) {
		output(" You cover your face behind your arms as the glass shatters. You cough and wheeze as a pink mist rolls around you, but quickly hold your breath as a your skin tingles lustily...")
		pc.lust(2);
	}
	//Else if failed the check: 
	else {
		output(" You cry out as the vial shatters, exploding in a pink cloud that blows over you. You gag and cough and suddenly your hands are reaching to your crotch as if on their own. You yank back, but feel a hot haze washing across your exposed body. What the hell is this stuff?");
		//PC must pass an willpower check, else:
		pc.lust(5);
		if(pc.willpower() + rand(20) + 1 < 20 && !pc.hasStatusEffect("Blind")) {
			output("\n\nSuddenly, you realize that in the wake of the pink cloud, your vision's collapsed to just a few feet in front of you, and the zil girl is nowhere to be seen. You desperately rub at your eyes, but that only serves to make them burn as the lust-cloud sticks to your [pc.skin]. Oh, shit, you're <b>blinded</b>!");
			pc.createStatusEffect("Blind",rand(3)+1,0,0,0,true,"","",true,0);
		}
	}
	processCombat();
}
	
//Dart Barrage:
//3x standard attacks with heightened miss chance. Doesn't miss if PC is blinded. Always follows up a LustBang, even if it failed to blind.
function flurryOfFemBlows():void {
	output("The zil launches a barrage of darts in your direction!\n");
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,true,1);
	attack(foes[0],pc,false,1);
}

//Stinger:
function zilChickSticksHerStingerInYourButtOrCloacaIfYouHaveOneOfThoseNoJustKiddingSheStingsYou():void {
	//Counter-melee / last resort. Light physical,medium lust, slows victim
	output("Leaping at you, the zil girl spins around and dives ass-first toward you, her deadly stinger on full display!");
	//{standard dodge/miss messages}
	if(combatMiss(foes[0],pc)) {
		output(" You avoid it at the last moment!");
	}
	else {
		if(pc.shieldsRaw > 0) output(" She isn't moving fast enough to trigger your shield, slipping right on through.");
		output(" The stinger punches through your ");
		if(pc.armor.shortName != "") output(pc.armor.longName + " and [pc.skin]");
		else output("[pc.skin]");
		output(", pumping a thick load of some kind of chemical into you.  You feel hot and flustered in seconds, blushing hard as your loins burn. Your whole body feels like it's in a haze....");
		pc.lust(10);
		if(pc.hasStatusEffect("Zil Sting")) {
			pc.addStatusValue("Zil Sting",1,2);
		}
		else pc.createStatusEffect("Zil Sting",2,0,0,0,false,"Poison","Zil Toxin: Reduces speed and increases libido.",false,55+rand(10));
		pc.reflexesMod -= 2;
		pc.libidoMod += 2;
	}
	processCombat();
}
		
//Harden:
function zilFemHarden():void {
	//Buffs kinetic defenses?
	output("Closing her onyx eyes, the zil flexes, and you hear quiet, barely audible cracks filling the busy, woodland air. You peer closer and realize that the zil's carapace seems shinier, and perhaps a bit more formidable... just barely thicker, somehow.");
	foes[0].resistances[GLOBAL.KINETIC] *= .8;
	foes[0].resistances[GLOBAL.SLASHING] *= .8;
	foes[0].resistances[GLOBAL.PIERCING] *= .8;
	processCombat();
}

//Get Honey
function getHoney():void {
	clearOutput();
	output("You ask the zil girl if she wouldn't mind giving you a vial of her sweet honey for the road. She gives you a lusty smile and pulls an empty glass container from her belt. <i>\"Sure, stranger... but you'll have to work for it,\"</i> she laughs, pushing aside the chitin plating on her chest to reveal the two full swells of her bosom. You shift around behind her, slipping your [pc.legs] about her waist as your fingers play across her chitin-covered sides and slide across the smooth, hard surface of her natural arm. Her breath catches as you brush across the bare flesh of her bust and the curve of her prominent, honey-filled nipples.");
	
	output("\n\nShe gasps and squirms in your grasp as your hands set to work, cupping and caressing her, working your thumb and forefinger around her teats until the first thick dollop of honey forms. With a smile, the zil girl takes your hand just long enough to suckle your fingers, eagerly sampling her own lactation. Next, her hand releases yours, snaking down her lithe body to tease her other honeypot as your fingers lock around her teats, squeezing out more and thicker drops of honey. The first trickles run down her bare chest, staining her black chitin amber until she moves the empty vial under one of her spigotting tits, catching the flow at the source.");
	output("\n\nThe viscous, clear amber moves slowly, oozing down your fingers and the zil’s body like syrup. It slides into the vial, slowly piling up as its holder shivers and moans, twitching at the pleasure of your contact. Before long your ministrations have her panting and moaning like a whore, chest heaving in her hands as you fill the vial under one tit and then the other, squeezing her honey taps until their owner is like putty in your hands, shivering with sexual pleasure as you milk her and she fingers herself.");
	output("\n\n<i>\"H-hey stranger, you've got really... really talented fingers, you know? Keep this up and I'll... I'll... I'll...\"</i>  she trails off into a long <i>\"Ooooohhhh,\"</i>  as you let one of your hands slip down, joining her fingers between her legs as the other massages her breast, topping off your prize. Her honeypot is slick with her sexual juices and offers no resistance as you slip into its warmth, brushing and teasing her own fingers before joining them in their work, exploring her depths. <i>\"Gonna... gonna c-c-ahhhh!\"</i> she cries, as her vaginal muscles clench down hard, squeezing and milking the fingers inside like miniature cocks. A whole new wave of thick honey squirts from her quivering cunt as the zil girl climaxes around the two hands penetrating her; a moment later and her teats join in the fun with a last mighty burst of honey that sails off into the clearing, overshooting the vial with the force of a fire hose.");
	output("\n\nYou cork the vial and tuck it away as the throughly milked zil collapses in your arms, breathing hard. You run your honey-slick hands through the soft, hair-like spines on her head, teasing her a little as you get ready to go.");
	//If Gendered PC:
	if(pc.hasCock() || pc.hasVagina()) output("\n\n<i>\"H-hey now,\"</i> she manages to say, <i>\"I'd feel bad if I got to cum that hard and you didn't even get a thrill. At least let me </i>");
	if(pc.hasVagina()) output("<i>give your honeypot some love</i>");
	if(pc.hasVagina() && pc.hasCock()) output("<i> or </i>");
	if(pc.hasCock()) output("<i>give your cock a little attention</i>");
	output("<i> before you go.\"</i>");
	
	//[Nah]
	//{Sex Options]
	//9999
}

//Nah
function noSexForMeThen():void {
	clearOutput();
	output("<i>\"Aww. Well, alright then, take care. Thanks for the fun!\"</i>  she laughs, slipping out of your arms to curl up on the forest floor, asleep before you leave.");
	output("\n\n<i>Talented fingers indeed!</i> you think as you move on.");
	//9999
}

//SEX OPTIONS - 9999
//For Dickmeisters:
//[SuckleFuck] (Anal ride while you suck honeytits)
//[Missionary] FOR THE SOLE PURPOSE OF PROCREATION! YOU SICK BASTARD!
//[Footjob]
//For Cuntwielders
//[SixtyNine]
//[Trib&Suck]

//SuckleFuck
// zillette goes for a buttsex ride while PC suckles some honey from her tits.
function suckleFuckZilFemaleYouSuckleFucker():void {
	clearOutput();
	if(!pc.isNude()) output("Pulling your [pc.gear] off");
	else output("Dropping what little gear you carry");
	output(", you plant yourself on the log beside the welcoming zil girl and stroke your wang, beckoning her onto your lap. She gives you a lascivious grin and does as you bid, moving on all fours; she wraps her arms around your neck and her legs around your waist, grinding her cunt along the shaft of your hardening cock. You gasp as the warm, sticky honey of her loins rubs off onto your bare manhood, leaving a slimy trail as she rocks her hips along your length. Instantly, you're assaulted with the powerful, potent scent of her pheromones, wafting up from her juicy sex. Your skin blushes hotly, tingling at her every touch as the wasp-like girl's hands run through your hair, down across your back, pulling herself close to you. You run your fingers through her soft, hair-like spines, leaning her head back just enough for you to kiss along the nape of her neck. To her delight, your other hand slips down and grabs her chitiny ass, squeezing the flexible plates of her posterior, and she lets out a stifled cry as one of your fingers ventures down into the cleft of her backside, teasing along her sensitive black hole.");
	var x:int = pc.cockThatFits(zilFemale.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\nBefore you plunge in, though, your hand slips along her hips to the meeting of your [pc.cock " + x + "] and her juicy honeypot. You plunge in, making the zil girl throw her head back in pleasure as your fingers delve her depths, swirling through her sweet honey-like juices. <i>\"Oooh, dirty " + pc.("boy","girl") + ". Yeah, get me lubed up with my own honey. Just like that,\"</i>  she moans, guiding your hand from her sodden box back to her eager ass. Now slathered in slick amber, you press a finger hard against her dark star and grin wide as it slides inexorably inwards, her tight little ass unable to push back against your honeyslick digit. Her mouth curls out in a silent ring of pleasure as your finger slides in to the last knuckle, utterly buried in her ass. Another slips in to join the first before you start to move them, and by the time they're out to the tips your lover is wracked by short gasps of insatiable pleasure, trembling from sexual anticipation.");
	
	output("\n\nHer hips grind harder, humping on your fingers buried up her butt and dragging her slick cunny across the shaft of your [pc.cock " + x + "], slathering you up with her sticky juices and sending shivers of pleasure all throughout your body. With a mischievous grin, the zil girl takes your honey-covered wang in her smooth, chitin-clad fingers and starts to pump. Her alien fingers feel like cool marble on your manhood, gently stroking her honey into every nook and crevice of your cock, slathering it with a nice, even coating of her cunt-juices until it shines in the sunlight. Her thumb moves up to your [pc.cockHead " + x + "], spreading an extra layer of honey around your brim to ease the initial penetration. While she does so, you shift your hips, leaning back for the zil girl as she picks herself up and aligns her tight little pucker with your [pc.cock " + x + "]. She comes to a complete stop just as your head kisses her black hole, stopping to savor the feeling of your cock pressing into her honey-filled behind. You join her, reveling in the unmatched tightness squeezing down on your tip, slowly rocking your hips into her as she begins to slide down, inch by inch taking your prick. You lock your hands into the full cheeks of her ass, guiding her down with tender, agonizing slowness until she bottoms out, cheeks resting on your [pc.legs].");
	
	output("\n\nHer breath is ragged and heavy by the time the zil's taken everything you have. With arms still locked around your neck, she pulls herself into a long, deep kiss with you. Your lips part, admitting a long, thick yellow tongue which searches into your maw, playing across your teeth and throat.");
	
	output("\n\nAnd it is very, very long. You stifle a gasp as the girl's nectar-sucking tongue plays across your own before slithering down into your throat, more like a tentacle than a tongue. You try not to gag as the giggling zil girl forces you to deepthroat her lengthy tongue. She keeps it up only for a moment, though before withdrawing again, still grinning. Instead, now, she pushes back the chitin shell over her chest, revealing the swells of her full breasts, each so aroused by the anal penetration that they've begun to trickle honey; amber lines trace down her tits, one of which her huge tongue promptly laps up before retracting. The other, it seems, is for you. You return her smile and set to work, your [pc.tongue] stretching out to lick along the underside of her breast, causing her bare yellow flesh to quiver at your touch.");
	
	output("\n\nFinally, you lips close in on her coal-colored, honeyed teat, and even the first, gentle suckle draws out a steady stream of her amber lactation. You bring a hand to bear, squeezing at the base of her tit and drawing out another thick gush of sweetness that threatens to bulge your cheeks. Soon, you're swallowing every few seconds as you suckle from your lover, lapping up every drop of her nectar. At a look from you, the zil girl starts to move her hips again, gently circling your lap to draw the barest length of your prick from her slick behind. You groan as the sensation grows, her pace quickening until she's bouncing on your cock, flesh slapping wetly as her honeypot squirts juices and secretes more and more of its sweet scents; in minutes you're positively swooning with pleasure, nearly overwhelming by taste, touch, and smell combined from the waspy beauty.");
	
	output("\n\nYour fingers trace down her smooth, dark body caressing the zil girl's hips and thighs before settling into the honeypot itself, finding the pert yellow bud of her clitoris on full display. Your thumb circles it, drawing a shrill cry from your lover even as your other digits plunge into her cavernous cunt, stretching her cock-craving walls wide. She clamps down on you, muscles massaging you half by instinctual need for an injection of your seed; your breeding stick, however, is busily buried in her behind, being squeezed and caressed by her spasming sphincter as the zil girl bounces on your lap, crying her pleasure as your triple attack brings her closer to the edge with every passing second. Before you know it, she lets out an ear-piercing scream, and suddenly your mouth is flooding with a powerful rush of honey, her suddenly squirting honeypot nearly overwhelming your senses; but it's her ass, clinging so hard to your cock you think you'll pop, that finally sends you over the edge after her. You grab her hips and hold her tight to your chest as your [pc.cock " + x + "] bursts in her butt, filling her with spurt after spurt of your steaming [pc.cumNoun].");
	
	output("\n\nBy the time you're done, both of you are sodden messes: the zil's backside is smeared with thick, frothy ropes of your cum, pouring out of the breach as your cock withdraws from inside her; opposite that, her cunny squirted something fierce during her orgasm, and you're utterly drenched with her slick fluids, surrounding you in the heady odor of her sex pheromones.");
	output("\n\n<i>\"You're... that was... wow,\"</i>  the zil girl breathes, chest heaving as she tries to catch her breath. <i>\"Thanks for the pounding, stranger.\"</i>");
	
	//if Asshole PC:
	if(pc.isAss())
	{
		output("\n\nYou wipe your cum-slick prick off on the zil girl's chitiny thigh before collecting your gear, trying to brush some of the thick patches of sex-juice off of yourself");
	}
	//else if Snarky, 
	else if(pc.isMischievous()) output("\n\n<i>\"Thanks for the cock cleaning, sweetheart,\"</i>  you say, ruffling her spiky hair");
	else output("\n\nYou cup the wasp girl cheek and give her a quick kiss before grabbing your gear");
	output(". <i>\"See you around, stranger,\"</i> she calls after you as you leave before rolls over in the puddle of sex you've left for a quick nap.");
	processTime(20+rand(10));
	pc.orgasm();
	//9999
}

//Missionary
function missionaryWithAZilGirl():void {
	clearOutput();
	output("With the wasp girl's legs nice and spread for you, it isn't long before you smell the wafting cloud of her sexual scent. Immediately, [pc.eachCock] stiffens");
	if(pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "") {
		output(" in your ");
		if(pc.lowerUndergarment.shortName != "") output("[pc.lowerUndergarment]");
		else output("[pc.armor]");
		output(", tenting visibly.");
	}
	else {
		output(" up to attention, displayed completely by your lack of garments.");
	}
	output(" The zil coos at you, licking her lips and giving you a \"come hither\" look. You step toward her, shedding your [pc.gear]; with a pleased sigh, the zil girl leans back and spread 'em wide, giving you a good long look at the black lips of her vulva and the dark star of her ass as her fingers dip into her honeypot, caressing the mouth as you undress. Finally free of your clothes, you move forward, grabbing your cock in one hand, the girl's cheek in the other. You pull her into a quick kiss, tasting her sweet lips before she wraps your [pc.cock " + x + "] in her marble-smooth black fingers, stroking you gently as you push her down.");
	output("\n\nShe moans into your mouth as you rest her back on the ground, hands moving down to explore and caress her body. You cup her breasts, pushing aside the chitin shell to expose the pale yellow mounds. A little trickle of honey spills from her prominent teats and you lap it up, never breaking eye contact with the trembling girl as your tongue moves down, lapping at her lactic source as your hands slip down to her wide hips, fingers digging into her plated behind. You kiss her again, this time gently biting and pulling her lip, teasing her until her lengthy  tongue comes out to play, flicking across your own lips and nose. You enjoy her touch for a few long, happy moments before pulling back, shifting up her body until you're straddling her chest. Your fingers brush through her golden spines, shifting her head up to the cock presented to her.");
	output("\n\nAt your urging, the zil girl opens her mouth wide, letting you slide your prick right in to the hilt");
	if(pc.cockVolume(x) >= 9999) output(", watching as her throat bulges with your massive length; she gags a moment as you stuff her mouth full of cock before finally catching her breath, her throat contracting hard around your invading shaft");
	output(". As you move your hips into her face, you gasp with sudden pleasure as the wasp girl's long, prehensile tongue slips around your shaft, wrapping you up like a snake before it starts to undulate, writhing and squirming around your [pc.cock " + x + "]. Given over to alien pleasures, your fingers run encouragingly across her carapaced body, urging her tongue job on. Soaked in her sweet saliva, you're soon able to gently rock your hips, using her constricting tongue like a sex toy, fucking her face with increasing abandon.");
	if(pc.isAss()) output(" You grab her cheeks, holding her head steady as you start to pound her face; spit flies everywhere in a matter of moments as you hump the zil girl's eager mouth, ignoring her cries and moans, obsessed with your own pleasure");
	else output(" Your face fucking lasts until you reach toward your own edge, steadily humping away at the alien's face until she's gagging again while pre flows freely down her throat");
	output(". Finally, unable to continue, you pull out of her mouth, still connected to her gaping lips by strands of spit and frothy strings of your own pre; she wipes her mouth and pulls you down, kissing you hard until you can taste yourself on her tongue as it flicks across your puckered lips. You move back down her body, now wholly ready for the coming storm of sex; the zil's own fingers dig into your shoulders, pulling you ever down onto her, her legs locking behind your [pc.butt] to draw you into her.");
	output("\n\nBreathing deep of her sexual scent, your [pc.cock " + x + "] hardens to diamond strength as the [pc.cockHead " + x + "] brushes the zil girl's eager cunt, tasting of the free-flowing honey within. She looks up at you pleadingly, pitch-black eyes searching yours as your prick hovers over her entrance. Gently, ever so slowly, you give her what she wants: your hips ease in, pushing the first inch of cockflesh into her, watching as her mouth locks open in a silent \"O\" of pleasure as she's spread apart on your prick. You dive into her vulnerable mouth, pressing your lips firmly to hers and letting your tongue play across her limp muscle, flicking across the tiny nectar hole in its tip until she winces with pleased surprise.");
	output("\n\nNow that's she's utterly speared on your [pc.cock " + x + "], you start to move, picking up at a fast tempo of fucking that has her crying and moaning in seconds, digging her fingers into you, urging you on with whispered promises of pleasures and half-crazed pleas of love for you and your magnificent member. You hold her tight, hugging the oversexed wasp's yeah against your [pc.chest] as your cock rams into her with force enough to send her sweet honey all over the glade, her voice echoing throughout the jungle.");
	output("\n\nYour climax is inevitable, surging onwards into the waiting womb of the screaming wasp girl. With a last, furious pounding, your cum blasts into her sodden box, smearing her warm, writhing walls [pc.cumColor] with seed. You hold onto her, humping away furiously as your [pc.cock " + x + "] blows load after load of salty cream into her, filling her until spurts of seed leak out around your pistoning prick. A few final thrusts leaves you done, both you and the zil girl panting heavily as the last drops of [pc.cum] leak out of your [pc.cock].");
	output("\n\n<i>\"Damn, stranger,\"</i> the wasp gasps, her breath hot and heavy on your sweat-slick [pc.skinFurScales]. <i>\"Do you just go around breeding every girl you meet like that? Wow...\"</i>");
	
	//If Asshole: 
	if(pc.isAss()) output("\n\nYou scoff, saying she ought to be ecstatic if she's full of your get. A breeder like you comes around once in a lifetime.");
	//else if Snarky:
	else if(pc.isMischievous()) output("\n\nYou chuckle, saying that maybe you do, maybe you don't; and maybe she'll get to find out one day.");
	else output("\n\nYou shake your head, saying that you're not the kind of " + pc.mf("guy","gal") + " to breed with just anyone.");
	
	output("\n\nThe zil girl sighs and leans back, patting her belly full of seed as you collect your [pc.gear]. <i>\"Don't be a stranger, stranger,\"</i> she laughs, blowing you a kiss as you leave.");
	
	pc.orgasm();
}
	
//Footjob
function footjobFromFemzil():void {
	clearOutput();
	output("You toss your [pc.gear] aside, letting your [pc.cocks] hang free between your [pc.legs]; the wasp girl's eyes are drawn instantly to the hardening member, and licking her lips, she asks, <i>\"So how do you want me to say hi to your friend there, stranger? Wanna ram it into my honey cunt, or maybe give my ass a reaming...?\"</i>");
	
	//If Asshole: 
	if(pc.isAss()) output("\n\n<i>\"Not likely. Get off your ass and put those feet to use,\"</i>");
	// if Snarky,
	else if(pc.isMischievous()) output("\n\n<i>\"Maybe next time, but for now... how about putting those feet to use?\"</i>");
	// if Nice:
	else output("\n\n<i>\"Some other time. For now, though, I'd love it if you could use your feet...\"</i>");
	 
	output("\n\n<i>\"Well, if you insist, stranger. I'm not picky,\"</i>  the zil says, strutting toward you as you toss your clothes aside. <i>\"But first, why don't you get some honey to lube yourself up with? The best foot's a slick foot, after all.\"</i>");
	
	output("\n\nYou nod and slip down as the zil girl spreads her legs, putting your face right into the potent sex aura coming off of her fragrant flower. Your [pc.eachCock] throbs with sudden need as your [pc.skin] flushes hotly, lust burning through you with fiery power. It takes a force of will not to push the zil girl over and breed her then and there, but you know what you're here for: those black, boot-like chitiny legs, and their smooth-as-latex feet. You take hold of her thighs, caressing her honeypot's lips with your thumbs as you inhale a lungful of lusty pheromone let loose by her parting lips. You dig in as soon as you've adjusted to the heady odor, [pc.tongue] slithering across her drooling cunt, sucking up the honey-sweet juices that soon flow to your deft touches and caresses. With ready hands, you scoop up the sweet nectar as it drips from the zil girl's quivering quim and liberally apply it to your waiting wang, slathering up with honey lubricant until your [pc.cock " + x + "] is glistening in the sun.");
	
	output("\n\nSatisfied with your efforts, the zil girl gives you a rough push onto your back, leaving your prick standing at attention, stiff as a flag pole as your mate looms over you, a lascivious grin spreading across her insectile face. Teasingly, she touches her toe to the [pc.cockHead " + x + "] of your cock, rubbing the smooth black digit across your well lubed brim, eliciting a sharp gasp of pleasure from you. You grit your teeth as the sultry wasp girl circles your [pc.cockHead " + x + "], cooing to herself as your [pc.cock " + x + "] twitches, begging for a good fucking; desperate trickles of pre leak down from your head before you can blink, the creamy seed swirling in the amber glaze on your shaft.");
	output("\n\nGently, the zil pushes forward, pressing your dick down onto your belly ");
	//if big tits and cock:
	if(pc.cockVolume(x) >= 9999 && pc.biggestTitSize() >= 1) output(", right between your tits");
	output(". Her heel's on you immediately, ");
	if(pc.balls > 0) output("pressing down uncomfortably hard on your package and ");
	output("slowly rubbing along your sensitive underside until a thick, hot lake of pre bubbles out from your cumslit, pooling ");
	if(pc.cockVolume(x) >= 9999) output(" on your [pc.face]");
	else if(pc.cockVolume(x) >= 9999) output(" on your [pc.chest]");
	else output(" on your belly");
	output(". Your entire body trembles as the smooth, sheet sole of the zil's alien foot slides down your shaft; your breath catches as she grinds her heel on your glans, smearing her toes with your flood of pre.");
	
	output("\n\n<i>\"You're awful cute when you squirm, stranger,\"</i>  the zil giggles, locking your [pc.cockHead " + x + "] between two of her toes. <i>\"Now let's see your face when you blow a load all over yourself.\"</i>");
	
	output("\n\nHer dexterous toes start to jerk you off, leaving her heel to rub and grind along your shaft, ushering your orgasm up through the thick, throbbing vein. Your fingers dig into the soft dirt, teeth gritting as the waspy woman foot fucks your [pc.cock " + x + "], vigorously fondling and fingering herself as you come closer and closer to your breaking point. You determine to hold out just a little bit long, to make her work to see you smear yourself in seed, and soon the clearing resounds with your sex-addled groans and cries, desperate moans of pleasure as your prick pulsates with mounting need, leaking more and more watery pre until your [pc.skin] around the tip is stained milk white. But before you let loose, you can see the furrowed brow of effort on the zil's face, making her work ever harder to bring you past the point of no return.");
	
	output("\n\nYour orgasm tears through you like an earthquake, leaving your whole body spasming with orgiastic pleasure as your [pc.cock " + x + "] thrums under the eager wasp slut's heel, bursting with a creamy squirt that smears your [pc.skin] and utterly coats the zil's honey-glazed foot. She cries out in surprise as your steaming [pc.cumNoun] smears across her chitin skin, though you can barely hear her over the roar of pleasure screaming past your lips as your cock finally attains release. By the time your member's twitched out the last of its sweet cream, you're barely conscious, utterly sexually exhausted. You lay back for a few long minutes, trying to catch your breath, though the zil girl doesn't make it easy, still teasing your [pc.cock " + x + "] with her semen-smeared toes.");
	
	output("\n\nFinally, you manage to roll out from under her and grab your [pc.gear], starting to get dressed. You don't get very far, however, before your lover hops over you again, brushing a slimy digit across your cheek. <i>\"Where do you think you're going? You wouldn't leave a girl all messy, would you?\"</i>");
	
	processTime(10+rand(10));
	pc.orgasm();
	//CHOICES!
	//9999
}

//Not Likely
function dontLickABitchClean():void {
	clearOutput();
	//if Asshole:
	if(pc.isAss()) output("You bat her filthy foot away");
	else if(pc.isMischievous()) output("Chuckling, you brush her foot away");
	else output("Politely declining, you lift her foot away");
	output(" and get to your [pc.feet], wiping the seed off your cheek. The zil gives you a pouting face as you redress, but still admits, <i>\"Well, it was fun while it lasted, stranger. See you around.\"</i>");
	output("\n\nYou nod and head out, leaving the poor zil girl to clean your mess up.");
	//9999
}

//Lick Clean
//(+Lust)
function lickABitchCleanYouBitch():void {
	clearOutput();
	pc.lust(20);
	output("With the zil's toes so close, you can fully smell the potent aroma of sex spread across her black chitin, and the irresistible lure of her desire wafting from her honeypot as she fingers herself, letting her pheromones waft down to you. Beset by a mire of scents, your spent prick twitches back to life, but the zil pointedly draws back your attention to her black, shimmering digits. Her big toe flicks across your lips, leaving the dual tastes of her sweet honey and your own creamy seed; your tongue reacts to the taste, darting out the lap across her smooth, hard skin, tasting deeply of yourself mixed into the coating of her own juices you spread before.");
	output("\n\nThe chitiny beauty breathes a gasp of pleasure as your lips suckle her toe, tongue bathing it, washing it clean of cum and honey until it shines. You look up at the zil girl, searching in her midnight-black eyes, watching the rise and fall of her bare bosom, her even, excited breath as you lick her clean, swallowing every sweet-salty drop you came on her. <i>\"Oooh, what a good " + pc.mf("boy","girl") + "; your face was so cute when you gave me your seed, but now... mmm, I could get used to seeing you like this,\"</i> she coos, digging her fingers deep into her sodden gash, showering you with trickles of potent honey that leave your mind in a haze of lust.");
	output("\n\nYour [pc.tongue] plays across her smooth chitin, delving between her toes, lavishing its attention across every inch. Soon, her sole and toes shine, licked cleaner than they ever were before. You let out a satisfied moan, letting an excess of your own cum and her honey trickle down your chin... but just as soon as you've finished, the zil girl's mouth is pressed to yours, her prehensile tongue lapping up the juices still at hand. She pushes you down, back pressed into the earth by her knees, pinning you down while her quivering box is left hanging intoxicatingly close to your nose, her bright yellow clit nearly poking into your nose.");
	output("\n\n<i>\"All finished? Then I've got something else for you to lick clean!\"</i> she says, running her fingers through your hair, gently guiding your head up to her eager hole. Your gentlest touch sends shivers up her spine, but she urges you onward with lusty moans and coos, pressing your face into her quim until her juices smear across your face, making your gasp for air as her potent sex-aura nearly overwhelms you. Behind her, your spent [pc.cocks] jut");
	if(pc.cockTotal() == 1) output("s");
	output(" to attention, and she's quick to lean back and grab ");
	if(pc.cockTotal() > 1) output("one");
	else output("it");
	output(", reaching under your clothes to lock her smooth fingers around it, pumping it to the beat of your tonguing.");
	
	output("\n\nSpurred on by a resurgence of lust, you dive into her with abandon. Your tongue searches into her quivering depths, thrusting in between desperately contracting walls that milk and squeeze your muscle like a cock, trying to draw out a load of spunk to fertilize the eggs deep inside her. Instead, your tongue probes her again and again, lapping up the sweet juices that wash down in waves toward your waiting mouth, eagerly lubricating your oral invasion as the zil's breath becomes ever more ragged. Slowly, you start to catch up to her, reveling in her tender attentions on your cock as she jerks you off, wringing your wang until a new stream of pre stains your clothes. Your breath catches as her thumb circles your cum slit, pressing down hard until you roll your head back and groan, able to feel the thick wad of pre bubbling up as she caps your shaft.");
	output("\n\n<i>\"It's my turn to cum,\"</i> the zil laughs, mashing her muff back into your face, taking your nose halfway into herself before you can right yourself and set to work, furiously licking along her gash before your cock threatens to boil over into her waiting hand. And your work pays off in spades, as soon her dark slit is squeezing hard on your writhing [pc.tongue], dousing it in orgasmic honey as she digs her fingers into you, humping your face with wild, desperate need as her voice echoes to the heavens. She grinds hard on you, taking your tongue deep into her love canal as she cums, riding you even as her musky honey squirts powerfully onto your already doused face, drenching you in the wasp girl's potent aroma.");
	output("\n\nWith a final ecstatic squeal and a last gush of honey onto your face, the zil girl rolls off you, panting heavily as her entire body trembles with release. Wiping the fem cum from your cheeks, you take your first deep breath of fresh air in a good long while. Before you can even think of leaving, though, the waspy beauty gets your attention with a come-hither coo and a pair of wide-spread legs. <i>\"What do you say, stranger? You wouldn't leave a girl when she's all hot and ready to go again, would you?\"</i>  Damn, she's fast... and smells so good....");
	processTime(25+rand(5));
	//9999
	//Fuck Her
	//[Play Missionary scene]
}

//No Can Do
function noThanksZilLadyImSpent():void {
	clearOutput();
	output("You shake your head, saying you're too bushed to go again. <i>\"Aww,\"</i> the zil girl groans, crossing her legs again. <i>\"But hey, you've got a hell of a tongue on you, stranger. You're welcome to put it to use on me any time,\"</i> she adds with a wink. Chuckling, you finish dressing and head out, leaving her to quietly masturbate behind you.");
	//9999
}
	
//Sixty Nine (Female)
function sixtyNineZil():void {
	clearOutput();
	var x:int = rand(pc.totalVaginas());
	output("You lick your lips as the wasp-like girl swirls her fingers around her dark slit, letting a potent, mind-numbingly sweet aroma pour over you; in a matter of moments, your mind is a haze of sex pheromones, urging you to throw yourself into the zil's arms, to revel in the pleasures of her flesh. Your hands work almost of their own accord, freeing you from the constraints of your [pc.gear]; your [pc.legs] carry you toward her as the last of your clothing falls aside, allowing the alien's black eyes to gaze upon your bare [pc.vaginas].");
	output("\n\n<i>\"Oh, you're just dripping already, aren't you?\"</i> the waspy beauty coos, slipping down between your [pc.legs], cheek brushing your thigh. Your entire body trembles as her smooth, cool fingers brush across your bare, sensitive [pc.skin], her long tongue slipping out and drawing its slitted tip across your flesh, leaving a slimey trail toward your slavering cunt. Just before she reaches your needy box, her fingers sink into your [pc.butt], kneading the pliant flesh of your bare backside. You gasp and shiver as she nuzzles your thighs and caresses your ass, her long prehensile tongue slowly starting to circle your vulva.");
	output("\n\nA needy, lust-filled groan escapes your lips, desperate for sexual contact; your [pc.legs] quiver as her honey-sucking tip teases [pc.oneClit], sending sudden shocks of pleasure through you, nearly making your collapse into her arms. Seeing your desperate expression, the zil girl leans up and takes your hands in hers, easing you onto the ground with her. She moves between your [pc.legs], putting them over her shoulders to give her a clear view of your dripping gash, slick and shimmering with your need.");
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
	
	output("\n\nYou let the girl service you for a few long, pleasant minutes, enjoying her well-practiced motions, the feeling of her agile tongue plunging into you again again again. ");
	//If Asshole PC:
	if(pc.isAss()) output("Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she's straddling your [pc.face], her potent muff almost spread across your nose. You cough and gasp as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. Figuring it's the only way to get her back to work, you let your [pc.tongue] loose on her juicy, honey-like cunt.");
	else if(pc.isMischievous()) output("Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she's straddling her [pc.face], her potent muff almost spread across your nose. <i>\"Well, if you insist,\"</i> you chuckle, breathing deep of her sexual aroma until it's spreading a hot deeply pleasant warmth throughout your body. Urging her on with a sharp spank, you get to work reciprocating her oral ministrations");
	//else if Nice:
	else output("Feeling like you shouldn't be the only one getting off here, though. You pull the zil girl up and, twirling a finger, get her to straddle your face, letting her lean back into your quim as her own cunt looms over you. You breathe deep as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. You let your [pc.tongue] loose on her juicy, honey-like cunt");
	output(". The zil gasps, arching her back as your [pc.tongue] swirls around her juicy cunt, lapping at the bright yellow pleasure buzzer pointing outwards from her wine dark pussy. She wiggles her backside seductively, moaning into your [pc.vagina] as you eat her out; you're soon pleasured in turn as the zil's long, squirming tongue slithers back into your [pc.vagina], thrusting into your clenching depths until her face is coated in your squirting juices.");
	output("\n\n");
	//If Herm: 
	if(pc.hasCock() && pc.hasVagina()) output("Her hand grasps your cock, stroking it just beside her face, occasionally letting her tongue slip from your cunt to tease and curl around the base of your rigid prick. ");
	output("You give your lover a quick swat on the black-chitined ass, grinning as her cunt clamps down on your invading tongue, forming a tight little channel for you to thrust into. Your tongue comes back to you glazed with thick honey juice, unleashing an even more potent cloud of sexual pheromones to assault your senses and leave you in a lusty haze; almost on its own accord, your tongue redoubles its assault on the zil's sexy snatch, mouth-fucking her until she's squirming in your gasp with honey dripping freely onto your cheeks. You barely notice when she cums, screaming into your [pc.vagina " + x + "] as you lick and thrust unerringly onward, never missing a beat as she squirts her sweet juices into your face.");
	
	output("\n\nStill crying aloud, the zil girl's tongue slams into you, ramming against your cervix until you're sure she's bound to penetrate your womb with her alien tongue. Your [pc.legs] curl around her, entire body trembling as her tongue desperately delves your depths. Your orgasm follows hers by a few mere minutes, causing your to arch your back and scream your pleasure as her wondrous tongue brings you to an explosive orgasm that leaves her face drenches in your femcum");
	//if Herm:
	if(pc.hasCock() && pc.hasVagina()) {
		output(" as your [pc.cock] explode");
		if(pc.cockTotal() == 1) output("s");
		output(" in her hand, raining [pc.cum] down onto her hair, turning the back of her head [pc.cumColor]");
	}
	output(". <i>\"Oh, wow. Explosive, stranger!\"</i> The zil laughs, rolling off you and wiping the [pc.girlCum] from her face - before lapping it up with her long tongue, still slick with your womanly lube. <i>\"But you've got a talented tongue, you know that... real talented,\"</i> she sighs, flopping onto her back and idly fingering her dark slit with latex-black fingers.");
	
	output("\n\nWith your chest still heaving, you can only try to stagger to your feet and brush the wetness from your thighs and cheeks. As you grab your [pc.gear], the zil girl slips up behind you, wrapping her dark arms around your [pc.hips], chin nestling in your neck. <i>\"Come back real soon, stranger. It's awful hard to find a girl like you around here,\"</i> she whispers, kissing along your neck. You breathe deep, skin trembling as the cum-soaked beauty caresses you; soon, she helps you get dressed and sends you on your way with a friendly wave and a kiss goodbye.");
	processTime(25+rand(15));	
	pc.orgasm();
}
	
//Trib & Suck
function tribAndSuckZil():void {
	clearOutput();
	var x:int = rand(pc.totalVaginas());
	output("As you stare at the zil girl's bare body, buxom and inviting, she gives you a lascivious grin and pushes aside the chitin plate over her chest, letting her fingers roam inside to pinch and squeeze a pert nipple until a clear amber trickle pours down. <i>\"Come on over for a taste, stranger. I promise I don't bite </i>too<i> hard.\"</i>  she says, nipping her lower lip as she thrusts out her chest. You feel a rush of heat under your skin, your breath quickening as you drink in her luscious scent and curvaceous body. With a come hither look, the zil slips down onto her back, cupping her perky, honey-laden teats for you, each beading with sweet nectar as you approach, tossing aside your [pc.gear] to bare your own ");
	clearList();
	addToList("[pc.vaginas]");
	if(pc.hasCock()) addToList("[pc.cocks]");
	addToList("[pc.chest]");
	output(formatList() + "to the cool breeze. Your [pc.nipples] stiffen as you straddle the waspy maiden, looking down into her clear black eyes as she grins up at you invitingly.");
	
	output("\n\n<i>\"Why don't you take a little taste, hm?\"</i> she buzzes, thrusting her chest again. You silence her with a quick kiss, tasting the sweet gloss on her black lips as you slide down her body, running your hands across her latex-smooth chitin until you take her two breasts in hand, cupping the soft mounds and massaging their prominent peaks. She gasps as your fingers close around her dark peaks, pinching them roughly until your fingers are completely sticky with her alien milk. Grinning, you break one kiss to start another, wrapping your lips around her teat and rolling it between your teeth, making the poor girl's breath catch in anxious anticipation. Looking up into her featureless eyes, you take your first deep suckle, mouth burning as her unnaturally sweet honey flows over the tip of your tongue, trickling like syrup into your hungry throat. Greedily, your hands massage her buxom flesh, kneading out a stronger and stronger flow of the languid substance for you to suckle; your ministrations quickly have the zil girl arching her back and moaning, her hands running through your [pc.hair].");
	
	output("\n\nShe seems to be enjoying you, if only evidenced by her shrill cries and moans and writhing motions. You giggle around her teat, flicking your tongue across the over-sensitive flesh before moving ever so slightly between your lover's spread legs. She shouldn't be the only one to get a little pleasure out of this, even if you are enjoying the sugary meal. Moving your [pc.legs] overtop her, you rock your [pc.hips] forward, dragging your aching vulva across the zil's smooth skin. You groan contentedly as her latexy chitin rubs across your [pc.clits], sending dull tremors of pleasure through your lusty skin. Your mouth continues to suckle from her eager tit as you hump at the zil's abdomen, frotting against her until with a sharp gasp of pleasure the waspy girl's tit seems to surge in your mouth, pouring out a sudden, thick load of amber cream.");
	
	output("\n\nHer finger suddenly tighten in your hair, urging you off her breast until she can reposition under you, leaning her flared hips up to your thighs, her bright yellow pleasure buzzer sliding across your own - you both gasp in ecstasy, your arms wrapping around each other as your cunts rub together. <i>\"Mmm, don't stop,\"</i>  the zil moans, pushing your head toward her other needy tit; she sighs contentedly as you start to suckle, running a hand through your hair as the other grabs your [pc.butt], smooth fingers caressing your supple flesh and teasing your [pc.asshole]. Your muscles clench as your alien lover's fingers circle your clenched pucker, backing off ever so slightly whenever her cunny presses back against your own slit, only to venture forth when she lets up again, making sure you never have a moment's respite.");
	
	output("\n\nSuddenly, your eyes widen as her long, smooth digit pushes right into your [pc.asshole]. You gasp silently, honey drooling from your lips as one, then two of the zil's fingers delve your backside, swirling around inside your puckered hole. <i>\"Don't you dare hold back now, stranger. Cum for me,\"</i>  the zil whispers, spearing you hard on her fingers as her hips buck hard into yours. Your grit your teeth, refusing to give in so easily. She'll have to work a little harder than that to get you to peak first. <i>\"Is that so? Well, let's see...\"</i>  the zil girl chuckles as you feel a momentary jab in your thigh.");
	
	output("\n\nYou cast an alarmed glance over your shoulder, just in time to see the wasp-girl's stinger retract from your [pc.leg], leaving a flushed red circle on your skin. You open your mouth to speak, but all that comes out is a low, husky moan. Your body flushes hotly, heart hammering in your chest, but all you really feel is your [pc.vagina " + x + "], slavering and twitching as pc.eachClit] swells thicker and hotter, commanding your attention. Instinct takes over, your hands diving between your [pc.legs] to tend to your fuck-box, fingers sliding into the quivering hole and going to work on their own accord. The waspy beauty beneath you giggles, licking her lips as you furiously masturbate, seeming to drink in the scent of sex and lust dripping off of you.");
	
	output("\n\n<i>\"You almost smell like one of us, stranger,\"</i>  she laughs, stroking your cheek. <i>\"Here, let me help you.\"</i>");
	
	output("\n\nYou give a guttural moan as another set of fingers mingle in with your own, delving into the slit of your womanhood to play across the ever-sensitive walls, slick with lust and fervent need.");
	if(pc.hasCock()) output(" Her fingers brush along the underside of [pc.oneCock], wrapping it in her latexy grip and giving it a good few pumps. Thick drops of pre spurt out at her slightest touch, smearing onto the chitin of her belly.");
	output("\n\n<i>\"So veeery lusty. I guess a direct injection does more than just the whiff, huh? Poor thing, you must be just dying to cum.\"</i>");
	
	output("\n\nLike a bitch on a leash, you cum on command: you grit your teeth and moan, burying your head between the soft, welcoming mounds of the alien's tits. Her arms quickly wrap around you, holding you down as her pelvis rushes up to meet you, grinding her engorged clit across your own burning bud. You cry out in overwhelming pleasure, your quim spasming out ropes of girlcum onto the wasp's thighs and slit until your groins look like they're coated in slimey webs, bridged together by trails of your feminine lust.");
	
	//If PC has a cock: 
	if(pc.hasCock()) {
		output("\n\nBefore you can hope to calm down, the zil girl's hips move up, bringing her knees down around your [pc.hips] until they've pinned your cock between them. Your breath catches as she squeezes your prick between her smooth, chitinous plates. Gently, she starts to move her legs, massaging your engorged shaft of your [pc.cockBiggest] until another thick stream of cum pours out onto her, pooling into her tiny little belly button. She giggles girlishly as your prick spasms in her grasp. <i>\"Aww, so much just going to waste. Maybe next time you'll fuck me proper, stranger. Girl needs a little baby batter in her cunny every now and then.\"</i>");
	}
	output("\n\nChest heaving, your body shivers with unnatural lust as the zil's venom courses through your veins. <i>\"Well, that was a hell of a thing, stranger,\"</i> the zil girl laughs, trying to roll you off her. <i>\"Glad you enjoyed yourself.\"</i>");
	
	output("\n\n<i>\"Oh, no,\"</i> you growl, grabbing her arms, pinning them beside her. <i>\"I'm not done with you yet.\"</i>");
	
	output("\n\nThe waspy beauty gulps loudly as you start to thrust your hips across hers. Her breath catches as your [pc.clit] grinds against hers, and the look of fear and lust in her eyes can only drive you on....");
	
	//9999
}

function zilFemaleTribbingEpilogue():void {
	clearOutput();
	output("<b>Two hours later...</b>");
	output("\n\n<i>\"N-no more!\"</i>  the alien woman cries, fingers digging into your shoulders as her cunt explodes in a burst of feminine slime, smearing her juices all over your sore, aching thighs. Your own quim returns the favor, nearly sucking in her engorged bud like a miniature cock as your cum for the tenth... twentieth... the last time, you hope.");
	
	output("\n\nFinally, you can breath easy. The haze of lust that clouded your brain for hours seems to lift, receding back into the dark, primal places of your mind. You slip off the poor, exhausted zil, finally seeming to be rid of her sex pheromones and nightmarish venom.");
	output("\n\n<i>\"Oh wow,\"</i>  your lover breathes, putting a hand to her hammering heart. <i>\"You sure like that venom, huh sexy? I'll uh, just have to remember that next time. Not sure if you need more or less, though...\"</i>");
	
	output("\n\nYou shoot her a glance, and are surprised to see her smile at you. <i>\"Just teasing, beautiful. You, uh, you just go on and get dressed. I don't think I can move my legs right now...\"</i>");
	//9999
}