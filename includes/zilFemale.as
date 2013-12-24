import classes.Creature;

//Female zil Encounter
function femzilEncounter(forceFriendly:Boolean = false):void {
	pc.lust(4);
	userInterface.showBust(GLOBAL.ZILFEMALE);
	//[First Time]
	if(flags["TIMES_MET_FEMZIL"] == undefined) {
		flags["TIMES_MET_FEMZIL"] = 1;
		output("\n\nAs you move through the brush, you push aside a thick clump of overgrown branches only to reveal a wide clearing, maybe fifty feet across, with a fallen tree trunk right at its center. Sitting atop it you see a shapely female clad from head to foot in well-polished black chitin, reclining with one leg crossed over the other, only just hiding her bare crotch from sight. A belt rests on her flared hips, holding dozens of small vials and tiny darts, each hilted by exotic looking fetishes and woven braids.");
		//If PC has encounter a zil male before:
		if(flags["ENCOUNTERED_ZIL"] != undefined) output("\n\nYour codex beeps out a warning about the zil, but it doesn't take an anthropologist to figure out you've found one of their females. You start to ready a weapon as the girl turns toward you, but seeing you, she quickly puts up her hands in an disarming gesture of peace. <i>\"Hey there, no need for violence!\"</i>");
		//Else if PC has not encountered a zil bro before:
		else output("\n\nYour codex beeps out a warning about a race called the zil, advising against approach and especially against inhaling their pheromones. However, contrary to the device's warnings about extreme hostility, the girl puts her hands up in a gesture of peace. <i>\"Hey there, stranger.”</i>");
		//{Combine, same paragraph:}
		output("\n\nShe smiles. <i>\"Don't worry, I don't mean you any harm. Just the opposite!\"</i> she says, leaning back and spreading her legs, revealing the pale yellow flesh around her vulva. A pair of fingers dips in to massage her hole.");
		output("\n\n<i>\"Come on, stranger, help yourself! Or.. maybe you'd like a taste of my home-made honey?\"</i>  she asks, pushing aside the chitin plate on her chest to reveal a full, pert breast; at the slightest squeeze, a thick dollop of an amber liquid drips from her nipple, sticking to her fingers.");
		output("\n\n<i>\"Any way you want it, stranger, that’s the way you need it! Just show me what you've got!\"</i>");
		output("\n\nBefore you can think, though, a strong, sweet smell wafts past you, nearly overwhelming your senses... damn, she smells <b>good</b>. It takes all your force of will to resist diving into her arms, and even then, your body urges you to take her up on the offer. What do you do?");
		userInterface.clearMenu();
		//[Fight her]
		userInterface.addButton(0,"Fight Her",fightDatFriendlyFemzil);
		//[Leave]
		userInterface.addButton(14,"Leave",tryToLeaveFemzil);
		//{Sex Options Here}
		if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) userInterface.addButton(1,"Sex",submitToFriendlyZil);	
		else userInterface.addDisabledButton(1,"Sex");
	}
	//[Repeat] (If PC didn't fight her last time)
	else if(flags["FOUGHT_FEMZIL_LAST_TIME"] == undefined) {
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. Your eyes and nose lead you to a familiar feminine form reclining on a log, legs spread wide to let loose the potent scent. The girl looks up as you approach. <i>\"Well, hello. What brings you to my favorite hangout? Interested in a bit of fun?\"</i>");
		
		output("\n\nThe casual tone of her words belies her perverted intentions; as she speaks, her fingers slide between her thighs and the atmosphere thickens with her sweet pheromones. You feel a strong compulsion to agree to whatever she wants.");

		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, but relaxes as she recognizes you. <i>\"Hey there, stranger. Back for a taste of my honey?\"</i>");
		//[Fight her]
		//[Leave]
		//[Get Honey]
		//{Sex Options Here}
		userInterface.clearMenu();
		//[Fight her]
		userInterface.addButton(0,"Fight Her",fightDatFriendlyFemzil);
		//{Sex Options Here}
		if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) userInterface.addButton(1,"Sex",submitToFriendlyZil);	
		else userInterface.addDisabledButton(1,"Sex");
		userInterface.addButton(2,"Get Honey",getHoney);
		//[Leave]
		userInterface.addButton(14,"Leave",tryToLeaveFemzil);
		
	}
	//[Repeat] (If PC fought her last time) && not a hostile zil
	else if(flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined && (rand(4) == 0 || forceFriendly)){
		output("\n\nAs you wander through the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. You search around for the source of the scent, and your nose quickly leads you to a familiar zil girl reclining on a log, legs spread wide to let loose the potent pheromones. She jumps up as you approach, grabbing one of the darts from her belt to defend herself. <i>\"H-hey there, stranger, no need to get violent. Just back off, okay?\"</i>");
		userInterface.clearMenu();
		//[Fight her]
		userInterface.addButton(0,"Fight Her",fightDatFriendlyFemzil);
		//[Leave]
		userInterface.addButton(14,"Leave",tryToLeaveFemzil);
	}
	//HOSTILE ZIL!
	else {
		output("\n\nAs you wander the brush, you happen into a fairly open clearing and are quickly greeted by the overly sweet smell of a zil. Your eyes and nose lead you to a familiar feminine form reclining on a log, legs spread wide to let loose the potent scent. The girl looks up as you approach with a knowing smile. <i>\"Hello, lover. I’m in the mood for some excitement, and you’re right on time.\"</i>  She does not look like she will take no for an answer.");
		output("\n\nHer pussy fairly glistens, lending truth to her words. The atmosphere thickens with pheromones and tension as she stares you down, tracing the outline of her vulva. You feel a strong compulsion to agree to whatever she wants.");
		userInterface.clearMenu();
		//[Fight Her]
		userInterface.addButton(0,"Fight Her",fightHostileZil);
		//[Leave - Reflex check]
		userInterface.addButton(14,"Leave",leaveHostileZil);
		//[Submit - chooses an appropriate loss scene]
		userInterface.addButton(1,"Submit",submitToFemzil);
		//revised outputs for hostile zil below
	}
}

//Leave (Must pass an Easy Int check, penalized by high Libido, to break away from zil Pheromones)
function tryToLeaveFemzil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("You back away from the sweet-smelling zil, even though your body yearns powerfully for her touch.");
	//if Fought before:
	if(flags["FOUGHT_FEMZIL_LAST_TIME"] != undefined) {
		flags["FOUGHT_FEMZIL_LAST_TIME"] = undefined;
		output(" She seems to relax as you step back, and slips her dart back onto her belt. Maybe she'll let her guard down next time...");
	}
	else output(" She pouts as you turn away, and calls out, <i>\"Well fine, I didn't want to fuck your brains out anyway!\"</i>");
	processTime(10);
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

function submitToFriendlyZil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	flags["FOUGHT_FEMZIL_LAST_TIME"] = undefined;
	output("With a goofy grin, you agree to the zil’s proposal. She smiles back and beckons you closer, deeper into the laden air. How will you take the welcoming alien woman?");
	zilConsensualSexMenu();
}
//Fight
function fightDatFriendlyFemzil():void {
	flags["FOUGHT_FEMZIL_LAST_TIME"] = 1;
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("You shake off the potent draw of the zil girl's pheromones and level a weapon at her, ready to fight.");
	output("\n\n<i>\"Woah! Back up, </i>");
	if(pc.tallness <= 52) output("<i>little </i>");
	else if(pc.tallness >= 72) output("<i>big </i>");
	output("<i> " + pc.mfn("boy","girl","uh... dude") + "!\"</i>  she cries, jumping back and readying her darts. It's a fight!");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",startCombat,"female zil");
}


//[Fight Her]
function fightHostileZil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("Though your body betrays you by moving a step closer to the wasp woman, you hold onto your wits enough to ready your defenses. Not a moment too soon, either, as the zil’s hand slides from her wet pussy to her belt and flings a pouch right at you. You react quickly enough to swat it aside, but any mask of friendliness the zil had is thrown away as well  - she clearly intends to take what she wants!");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",startCombat,"female zil");
}

//[Leave]
function leaveHostileZil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("Shaking your head both to free it of pheromones and give the zil your answer, you turn away. Behind you, you hear a slight rustle from the vexed wasp woman, followed by the sound of a cloth flap opening.");
	//new paragraph, split for reflex check -- failure adds lust
	output("\n\n");
	//pass - end encounter
	if(pc.reflexes() + rand(20) + 1 > 20) {
		output("Glancing back, you catch sight of something leaving the woman’s hand, and roll to the side just in time for a dart to embed itself in the trunk of a tree beside you. With a fluid motion, you slip behind another tree and rapidly put distance between yourself and the zil, leaving only an angry buzzing sound behind.");
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
	}
	//fail - lust < 100 after lust penalty, start fight with penalty
	else {
		pc.lust(10);
		if(pc.lust() < 99.5) {
			output("Glancing back, you catch sight of something leaving the woman’s hand, but can’t move your body fast enough to avoid whatever it is. With a ‘thwip’, a dart pokes through ");
			if(pc.armor.shortName != "") output("a thin section of your [pc.armor]");
			else output("a bit of exposed flesh");
			output(", and your muscles loosen while your groin heats up with increased blood flow. Head suddenly swimming, you can only marshal your thoughts as the zil walks closer, grinning smugly. As she reaches over to caress your body, your body finally responds and you slap her hand away.");
			
			output("\n\nHumming in irritation, she takes a step back as you ready your [pc.meleeWeapon].");
			userInterface.clearMenu();
			userInterface.addButton(0,"Next",startCombat,"female zil");
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
				if(pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "") output("fill your garments");
				else output("cover the ground");
				output("with precum");
			}
			else if(pc.hasVagina())
			{
				output(" Your [pc.vaginas] are wet enough to soak ");
				if(pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "") output("your garments");
				else output("the ground");
			}
			output(", and you can’t do anything but stare at the slowly approaching wasp woman, imagining what perverted things she’ll do to you. As she reaches out and caresses your face, your mouth opens but makes no sound. She hums pleasantly, knowing she’ll get what she’s after.");
			userInterface.clearMenu();
			userInterface.addButton(0,"Next",startCombat,"female zil");
		}
	}
}

//Submit - need a transition here (still to do)
//something to bridge the gap between the intro and the loss sex, like a sneak attack with aphrodisiacs
function submitToFemzil():void {
	//route to loss scenes!
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("You smile and begin to deeply inhale her powerful scent, meeting her eyes as you let the overwhelming need start to overcome you.");
	foes[0] = clone(zilFemale);
	girlZilLossRouter();
}

//AI: Throws darts most turns (25% chance to toss a Lustbang); any turn the PC uses a melee weapon, she'll counter with her Stinger attack. Once she gets down to half health, she'll start mixing Stingers into her normal combat routine, about 25% of the time. 
function zilGirlAI():void {
	if(flags["HIT_A_ZILGIRL"] != undefined) {
		flags["HIT_A_ZILGIRL"] = undefined;
		zilChickSticksHerStingerInYourButtOrCloacaIfYouHaveOneOfThoseNoJustKiddingSheStingsYou();
	}
	else if(rand(4) == 0) lustBangOut();
	else if((foes[0].HP()/foes[0].HPMax()) < .5 && rand(4) == 0)
		zilChickSticksHerStingerInYourButtOrCloacaIfYouHaveOneOfThoseNoJustKiddingSheStingsYou();
	else if(rand(4) == 0) pheromoneFanFromZilFemale();
	else if(rand(3) == 0) zilFemaleDartThrow();
	else if(rand(2) == 0) flurryOfFemBlows();
	else zilFemHarden();
}

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
		var sDamage:Array = new Array();
		if(pc.shieldsRaw > 0) {
			sDamage[0] = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
			//Set damage to leftoverDamage from shieldDamage
			damage = sDamage[1];
			if (target.shieldsRaw > 0) 
				output(" The dart spangs uselessly off your shields! (<b>" + sDamage[0] + "</b>)");
			else 
				output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
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
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	
	output("\n\n<b>No honey item active yet, I'm afraid.</b>");
	processTime(10+rand(5));
	
	//[Nah]
	//{Sex Options]
	userInterface.clearMenu();
	zilConsensualSexMenu();
	userInterface.addButton(14,"Nah",noSexForMeThen);
}

//Nah
function noSexForMeThen():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("<i>\"Aww. Well, alright then, take care. Thanks for the fun!\"</i>  she laughs, slipping out of your arms to curl up on the forest floor, asleep before you leave.");
	output("\n\n<i>Talented fingers indeed!</i> you think as you move on.");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//SEX OPTIONS
function zilConsensualSexMenu():void {
	userInterface.showBust(GLOBAL.ZILFEMALE);
	//For Dickmeisters:
	if(pc.hasCock()) {
		//[SuckleFuck] (Anal ride while you suck honeytits)
		if(pc.cockThatFits(zilFemale.analCapacity()) >= 0) 
			userInterface.addButton(0,"SuckleFuck",suckleFuckZilFemaleYouSuckleFucker);
		else userInterface.addDisabledButton(0,"SuckleFuck");
		//[Missionary] FOR THE SOLE PURPOSE OF PROCREATION! YOU SICK BASTARD!
		if(pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25) >= 0) 
			userInterface.addButton(1,"Missionary",missionaryWithAZilGirl);
		else userInterface.addDisabledButton(1,"Missionary");
		//[Footjob]
		userInterface.addButton(2,"Footjob",footjobFromFemzil);
	}
	else {
		userInterface.addDisabledButton(0,"SuckleFuck");
		userInterface.addDisabledButton(1,"Missionary");
		userInterface.addDisabledButton(2,"Footjob");
	}
	//For Cuntwielders
	if(pc.hasVagina()) {
		//[SixtyNine]
		userInterface.addButton(3,"SixtyNine",sixtyNineZil);
		//[Trib&Suck]
		userInterface.addButton(4,"Trib&Suck",tribAndSuckZil);
	}
	else {
		userInterface.addDisabledButton(3,"SixtyNine");
		userInterface.addDisabledButton(4,"Trib&Suck");
	}
	userInterface.addButton(14,"Back",femzilEncounter,true);
}
//SuckleFuck
// zillette goes for a buttsex ride while PC suckles some honey from her tits.
function suckleFuckZilFemaleYouSuckleFucker():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//Missionary
function missionaryWithAZilGirl():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	if(pc.cockVolume(x) >= zilFemale.vaginalCapacity()) output(", watching as her throat bulges with your massive length; she gags a moment as you stuff her mouth full of cock before finally catching her breath, her throat contracting hard around your invading shaft");
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
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}
	
//Footjob
function footjobFromFemzil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	if(pc.cocks[x].cLength >= 15 && pc.biggestTitSize() >= 1) output(", right between your tits");
	output(". Her heel's on you immediately, ");
	if(pc.balls > 0) output("pressing down uncomfortably hard on your package and ");
	output("slowly rubbing along your sensitive underside until a thick, hot lake of pre bubbles out from your cumslit, pooling ");
	if(pc.cocks[x].cLength >= 22) output(" on your [pc.face]");
	else if(pc.cocks[x].cLength >= 15) output(" on your [pc.chest]");
	else output(" on your belly");
	output(". Your entire body trembles as the smooth, sheet sole of the zil's alien foot slides down your shaft; your breath catches as she grinds her heel on your glans, smearing her toes with your flood of pre.");
	
	output("\n\n<i>\"You're awful cute when you squirm, stranger,\"</i>  the zil giggles, locking your [pc.cockHead " + x + "] between two of her toes. <i>\"Now let's see your face when you blow a load all over yourself.\"</i>");
	
	output("\n\nHer dexterous toes start to jerk you off, leaving her heel to rub and grind along your shaft, ushering your orgasm up through the thick, throbbing vein. Your fingers dig into the soft dirt, teeth gritting as the waspy woman foot fucks your [pc.cock " + x + "], vigorously fondling and fingering herself as you come closer and closer to your breaking point. You determine to hold out just a little bit long, to make her work to see you smear yourself in seed, and soon the clearing resounds with your sex-addled groans and cries, desperate moans of pleasure as your prick pulsates with mounting need, leaking more and more watery pre until your [pc.skin] around the tip is stained milk white. But before you let loose, you can see the furrowed brow of effort on the zil's face, making her work ever harder to bring you past the point of no return.");
	
	output("\n\nYour orgasm tears through you like an earthquake, leaving your whole body spasming with orgiastic pleasure as your [pc.cock " + x + "] thrums under the eager wasp slut's heel, bursting with a creamy squirt that smears your [pc.skin] and utterly coats the zil's honey-glazed foot. She cries out in surprise as your steaming [pc.cumNoun] smears across her chitin skin, though you can barely hear her over the roar of pleasure screaming past your lips as your cock finally attains release. By the time your member's twitched out the last of its sweet cream, you're barely conscious, utterly sexually exhausted. You lay back for a few long minutes, trying to catch your breath, though the zil girl doesn't make it easy, still teasing your [pc.cock " + x + "] with her semen-smeared toes.");
	
	output("\n\nFinally, you manage to roll out from under her and grab your [pc.gear], starting to get dressed. You don't get very far, however, before your lover hops over you again, brushing a slimy digit across your cheek. <i>\"Where do you think you're going? You wouldn't leave a girl all messy, would you?\"</i>");
	
	processTime(10+rand(10));
	pc.orgasm();
	//CHOICES!
	userInterface.clearMenu();
	userInterface.addButton(0,"Lick Her",lickABitchCleanYouBitch);
	userInterface.addButton(1,"Don't",dontLickABitchClean);	
}

//Not Likely
function dontLickABitchClean():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	//if Asshole:
	if(pc.isAss()) output("You bat her filthy foot away");
	else if(pc.isMischievous()) output("Chuckling, you brush her foot away");
	else output("Politely declining, you lift her foot away");
	output(" and get to your [pc.feet], wiping the seed off your cheek. The zil gives you a pouting face as you redress, but still admits, <i>\"Well, it was fun while it lasted, stranger. See you around.\"</i>");
	output("\n\nYou nod and head out, leaving the poor zil girl to clean your mess up.");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//Lick Clean
//(+Lust)
function lickABitchCleanYouBitch():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	userInterface.clearMenu();
	if(pc.cockThatFits(zilFemale.vaginalCapacity() * 1.25) >= 0 && pc.hasCock()) userInterface.addButton(0,"Fuck Her",missionaryWithAZilGirl);
	userInterface.addButton(1,"No Can Do",noThanksZilLadyImSpent);
}

//No Can Do
function noThanksZilLadyImSpent():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("You shake your head, saying you're too bushed to go again. <i>\"Aww,\"</i> the zil girl groans, crossing her legs again. <i>\"But hey, you've got a hell of a tongue on you, stranger. You're welcome to put it to use on me any time,\"</i> she adds with a wink. Chuckling, you finish dressing and head out, leaving her to quietly masturbate behind you.");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}
	
//Sixty Nine (Female)
function sixtyNineZil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}
	
//Trib & Suck
function tribAndSuckZil():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
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
	processTime(10+rand(10));
	pc.orgasm();
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",zilFemaleTribbingEpilogue);
}

function zilFemaleTribbingEpilogue():void {
	clearOutput();
	userInterface.showBust(GLOBAL.ZILFEMALE);
	output("<b>Two hours later...</b>");
	output("\n\n<i>\"N-no more!\"</i>  the alien woman cries, fingers digging into your shoulders as her cunt explodes in a burst of feminine slime, smearing her juices all over your sore, aching thighs. Your own quim returns the favor, nearly sucking in her engorged bud like a miniature cock as your cum for the tenth... twentieth... the last time, you hope.");
	
	output("\n\nFinally, you can breath easy. The haze of lust that clouded your brain for hours seems to lift, receding back into the dark, primal places of your mind. You slip off the poor, exhausted zil, finally seeming to be rid of her sex pheromones and nightmarish venom.");
	output("\n\n<i>\"Oh wow,\"</i>  your lover breathes, putting a hand to her hammering heart. <i>\"You sure like that venom, huh sexy? I'll uh, just have to remember that next time. Not sure if you need more or less, though...\"</i>");
	
	output("\n\nYou shoot her a glance, and are surprised to see her smile at you. <i>\"Just teasing, beautiful. You, uh, you just go on and get dressed. I don't think I can move my legs right now...\"</i>");
	processTime(120+rand(10));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

function girlZilLossRouter():void {
	var choices:Array = new Array();
	var select:int = 0;
	choices[choices.length] = forceyFaceSittingFromFemzil;
	//Ladies Get Forced to Suckle and Then Cunnilingate While Repeatedly Stung (DONE) (-F)(edited)
	if(pc.hasVagina()) choices[choices.length] = forceCunnilstingus;
	//Dudes Get Rode and Stang in the Taint repeatedly!? Maybe. [DONE] (-F) [edited]
	if(pc.hasCock() && pc.cockThatFits(foes[0].vaginalCapacity()) >= 0) choices[choices.length] = dudesGetStangRoad;
	
	choices[rand(choices.length)]();
}
//Loss Scenes
//Ladies Get Forced to Suckle and Then Cunnilingate While Repeatedly Stung (DONE) (-F)(edited)
//Yowch! -Fen idear
function forceCunnilstingus():void {
	clearOutput();
	//HP Losssssssssssssssssssssssssssssssuckmydick
	if(pc.HP() <= 0) {
		output("With your strength falling as rapidly as the leaves that occasionally drop from the canopy above, you give in. There's no way you can continue to resist the nubile alien. She has you right where she wants you: on the ground and unable to stop her from inflicting some perverse mating ritual upon you. You look up at her with fire in your eyes. Perhaps you can bite off something sensitive when she makes her move?");
		output("\n\n<i>\"Oh dear, this resistance simply will not do,\"</i>  the zil explains as she closes in, grabbing you gently under your chin and tipping your head back to meet her gaze. \"<i>It is rude to resist once your position has been decided by your loss.\"</i>  She releases you only to stalk around you like a predator circling prey, tapping on her chin in thought. Her face brightens as a playful expression spreads across her features. <i>\"I can teach you politeness, offworlder.\"</i>");
		output("\n\nWorry over just what she means wars with your desire to resist her, and in the end, you wind up watching her. Your eyes remain warily locked as she completes her circle and drops nto your lap. Her hands, shiny as the most high quality latex, ");
		if(!pc.isNude()) output("carefully peel away every piece of your equipment");
		else output("carefully strip away your few possessions");
		output(", and she's sure to keep them far, far away from your mouth. Resting heavily upon your [pc.legs], her abdomen twitches while she works, dragging the sharpness over her stinger up your vulnerable [pc.skinFurScales]. The perfect hardness of her fingers comes to rest on your shoulders, and she gazes deeply into your eyes, a sardonic smile painted across her obsidian lips.");
		output("\n\n<i>\"Don't be such a spoil-sport,\"</i>  she whispers. <i>\"Just relax.\"</i>  The dusky wasp presses down with her hands to push herself up. At the same time, her insect-like abdomen flexes and curls to press down, hooking the length of its stinger into your skin. It stabs in until you feel the smooth hardness of its base pressed against you. Amazingly, it barely hurts to be pricked that deeply. The pain is fading away already, replaced by a quiet, limp acquiescence. Something is flowing out from her steadily-pumping abdomen and into your vulnerable veins. You can feel it trickling into you and see her huge rear-half flexing and shuddering as it works. Most noticeable of all, you're starting to feel very, very warm - exquisitely so.");
		output("\n\nSmiling as the heat works its way up your [pc.leg] and into [pc.eachVagina], you find your eyelids drifting closed. Your crotch is getting sticky from the heat, your nether-lips are engorged, and your [pc.nipples]");
		if(pc.hasNippleCocks()) output(" abruptly release their immensely turgid shafts");
		else if(pc.hasFuckableNipples()) output(" abruptly begin to leak trickles of lubricant");
		else if(pc.isLactating()) output(" abruptly begin to drool in excitement");
		else if(pc.hasFlatNipples()) output(" abruptly tingle in the humid air");
		else output(" abruptly jut out to a full and totally erect state");
		output(". The pleasure of your blossoming arousal is like a balm to your troubled mind, dulling your worry into a sort of curious, lewd wonderment.");
	}
	//ALT LUST INTRO
	else {
		output("A lurid moan cuts through the air. It is only after you wonder where it came from that you recognize it as your own voice. You can't really control yourself anymore. This fey woman... she's just right there, and she smells soooo good that it hurts not to sit down between her legs and nuzzle at her crotch. She smiles as you drop to your [pc.knees], already ");
		if(pc.isNude()) output("discarding the few possessions you bothered to bring");
		else output("stripping out of your equipment");
		output(".");
		output("\n\n<i>\"Oh, an off-worlder that knows custom! Perfect.\"</i>  the zil says with a happy trill. <i>\"I don't understand why you star-walkers seem so blind to the needs of life. When you meet someone from a different tribe, you have a contest of strength or willpower. The winner may use the loser to sate her baser needs and breed, if desired. The loser is to be a subservient vessel for copulation until the winner is sated. How else would one remain strong and bear strong childen?\"</i>");
		output("\n\nYou shrug, not interested in her diatribe, only in leering at her sweet-smelling, dewy lips.");
		output("\n\nShe catches your look and laughs. <i>\"Oh, I like my mates to be a little more eager than that, licentious ");
		if(pc.tallness <= 55) output("little ");
		output(pc.mf("ladyboy","girl") + ".\"</i> She kneels down over your [pc.legs], her heavy abdomen brushing across your [pc.thigh], its stinger sliding angrily across your [pc.skinFurScales]. Her rigid, armored fingertips grab you by each side of your head");
		if(pc.hasHair()) output(", running through your [pc.hair],");
		output(" and she leans in, pressing her onyx lips against yours in a slow kiss. The sensuous embrace drags on for what feels like forever. You try to reach for her breasts, her pussy, and even your own, but she deflects your arms when you do, forcing you to pay attention to nothing but the feel of your [pc.lips] against hers.");
		output("\n\nShe breaks away, holding you down as her backside flexes. The stinger catches on your [pc.skin] with a painful prick. Driven down by her powerful abdomen, it firmly embeds itself into your [pc.thigh], not stopping until the rounded edge of her carapace has collided with your flesh. It immediately starts pumping you full of something... something warm... no, hot. Fuck, she's making your [pc.vaginas] fucking drip! It's like her stinger is just oozing liquid-hot lust straight into your veins, and every part of your body that it spreads to just feels so moist, pliant, and touchable. You could probably get off on having your sides tickled right now. You glance at her with an expression that's one part confused and two parts horny slut, wondering just what she's doing to you.");
		output("\n\nYour [pc.nipples]");
		if(pc.hasNippleCocks()) output(" abruptly release their immensely turgid shafts.");
		else if(pc.hasFuckableNipples()) output(" abruptly begin to leak trickles of lubricant.");
		else if(pc.isLactating()) output(" abruptly begin to drool in excitement.");
		else if(pc.hasFlatNipples()) output(" abruptly tingle in the humid air.");
		else output(" abruptly jut out to a full and totally erect state.");
		output(" It's getting worse. Twitching and lurching, you can see her insectile tail contracting and squeezing as it pumps more of the mind-affecting chemical into you. It doesn't matter to you. You're beyond caring by this point; you just want her to hurry up and start fucking you before your brain melts from the omnipresent warmth and puddles between your thighs.");
	}
	//MERGE DIS SHIT TOGETHER
	output("\n\nThe chitinous seductress bids you, <i>\"Come here, precious. You look thirsty. I have a treat for you.\"</i> She cups a breast, squeezing it gently. A trickle of honey escapes her sable nipple. The amber fluid slowly runs down the curvature of her perky melons as you watch and lick your lips like a cat eyeing a saucer full of milk. You desperately want to touch and caress every sensitive part of her body, hoping that in turn she will pleasure you. You're too horny to think straight, but there's a set of perky, leaking nipples there waiting for a tongue to bathe them. There's only one thing to do.");
	output("\n\nYou obey with swiftness, closing the space so quickly that her shining teat virtually teleports into your pursed lips. Running in a slow circle over the smooth areola, your [pc.tongue] gathers the excess honey deep into your hungry gob. You drink it immediately rather than savoring its distinctly-alien-yet-familiar flavor, and the zil seems to like the quick sharpness of your rapid-fire suckling. Her ambrosia comes out in trickles at first, then increasingly solid streams. In no time, your throat is bobbing along with the sound of your noisy gulps. You ache for more: a simple touch on your [pc.thigh], a tweak of your own nipple, or even the touch of her shining fingers on your mons.");
	output("\n\nCocking your head to the side, you gaze imploringly at the nectar-oozing beauty's exotically patterned eyes, pleading with little more than a desperate look for reciprocation. She shakes her head with a sad smile and pops your mouth free, guiding you to the other nipple before you can give voice to your anxious pleas. This one is much, much messier than the other. While you drank, the zil's second nipple leaked like a faucet, and now her curved, sumptuous breast is glazed from the areola down in viscous love-honey. Your [pc.tongue] automatically collects ");
	if(pc.hasTongueFlag(GLOBAL.LONG)) output("it all, thanks to its expansive length, but then it's stuck outside while you suck, curling tightly around the big, saliva-coated boob.");
	else output("what it can, but each hungry lick winds up smearing more and more of it on your cheeks and chin.");
	
	output("\n\nMore of the insidious, heat-inducing venom pours into your [pc.thigh] while you nurse, forming a knot of white-hot pleasure that slowly dissipates into the rest you, making you feel weak. [pc.EachVagina] feels like it's in the middle of a forest-fire of sexual need; flames of desire roll over your feminine lips in ways that set off convulsive pleasure-clenches. You give up getting anything back when you realize just how sensitive you're becoming. The slow tickle of a breeze across ");
	if(pc.vaginaTotal() > 1) output("an");
	else output("your");
	output(" engorged sex feels better than a finger or tongue normally could. Your [pc.girlCum] runs out with an audible 'drip-drip-drip', and all you can think to do is drink deeply and spread your [pc.legs] as wide open as possible.");
	
	output("\n\nThen, while you are grinding your [pc.hips] against this fantastic creature's armored thigh, the honey runs out. Her puffy nipple has gone dry. You break your mouth away, connected by strands of nectar-thickened saliva, and gape dumbly, unsure just what you're supposed to do and too horny to think.");
	output("\n\n<i>\"Ohhhh...\"</i>  the zil groans, <i>\"Poor you, nothing for your mouth to serve.\"</i>  She rubs her fingertip along your sticky lower lip. <i>\"Do you want more honey, dear?\"</i>  She extends the glossy, armored digit into your mouth. Your close around it hungrily, suckling it like one big teat, determined to claim every tasty drop on the slick surface. Its owner's buzzing voice hums, <i>\"Oh you do.... I knew you would. There's all the honey you could ever want between my legs. Just get in there and start licking.\"</i>");
	output("\n\nAs you kneel down between the thighs you just inadvertently polished with your juices, the compelling pheromones in the air thicken, and if you weren't already floating in a sauna of pure excitement, you'd be soaking yourself. The moist drops intensify into a ");
	if(!pc.isSquirter()) output("steady leak");
	else output("near-gushing dribble");
	output(" after a few deep breaths. Then, as you bury your nose against her stubby clit and take your first taste, a powerful contraction runs through your body. A puddle fills ");
	if(pc.legCount > 1) output("between your quivering [pc.knees]");
	else output("below your quivering [pc.knee]");
	output(" even though you haven't gotten off yet. It just feels and tastes so good that your internal faucet has its knob turned up to full-blast and then broken off.");
	output("\n\nYou begin to fuck her sopping-wet honeypot with powerful strokes of your tongue, the lewd 'squelch-squelch-squelch' audible to any who would stumble upon the forceful tryst. Sometimes, you do such a good job that your armored mistress lets out an unmistakably uncontrolled squeal of feminine excitement, and her stinger releases a fresh injection of clit-stiffening aphrodisiac along with it. You writhe happily, pressing your [pc.face] more and more excitedly against her honey-slobbering quim until you're eagerly thrashing your [pc.lips] like motorized vibrating eggs on her dusky female flesh.");
	output("\n\nLashing your tongue rapid-fire through her silken folds, you focus entirely on bringing the zil as much pleasure as possible. You've gone from desperate to fuck to desperate to serve, absolutely sure that giving her an immense orgasm will get enough venom inside you that you'll get to spontaneously cum for hours, just from savoring her taste on your [pc.tongue].");
	output("\n\nThey wasp-woman's thighs reflexively cross behind your head to pin you in your damp, subservient position. Her thighs are quivering arhythmically, squeezing down on your ears. Her voice lilts up in exquisite pleasure, and then, she's cumming! Oh, she's cumming! Your [pc.tongue] bathes in the sweet taste of her girlcum, thrashing through the sticky deluge to drag it on as long as possible. The stinger twitches in your leg, pouring reserves of that need-fueling chemical into you at a faster rate than ever before. A huge gush of [pc.girlCum] erupts from your [pc.vaginas]");
	if(!pc.isSquirter()) output(". You didn't even know anything could make you squirt, but this has");
	output(".");
	output("\n\nSpit frothes at your mouth as your whole body begins to quake alongside your zil lover's. At last, your libertine coupling comes apart in a tangle of shuddering, boneless limbs. Your eyes roll back as your clenching, climactic tunnel experiences an orgasm strong enough to leave you breathless. Long before it finishes, another wells up from deep inside you, rolling out in another huge gush of love-juice. You scream");
	if(pc.hasCock()) output(" while [pc.eachCock] spews ropes of [pc.cum] across your [pc.belly]");
	output(". There's so much pleasure that breathing is a desperate inhalation squeezed in between instinctive moans. It blocks out everything, most noticably rational thought. Your mind doesn't even use words anymore, just concepts, completely obsessed with things that would translate to 'feel good' and 'more'.");
	
	output("\n\nYou cum again to the feeling of having your ");
	if(pc.hasHair()) output("[pc.hair] used as a rag by the sated zil");
	else output("hand used as a wipe by the sated zil");
	output(". Her voice buzzes, <i>\"Have fun!\"</i> as she lays you back, parting with a quick squeeze of your ");
	if(pc.hasNippleCocks()) output("erupting [pc.nippleCock]");
	else if(pc.hasFuckableNipples() || pc.isLactating()) output("leaking [pc.nipple]");
	else output("tense nipple");
	output(". A fevered moan is your thank you and goodbye, your body well on its way to its next artificial climax as your eyes drift closed.\n\n");
	processTime(200+rand(60));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	//Some libido boostage here!
	pc.slowStatGain("libido",3);
	if(!inCombat()) {
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
	}
	else genericLoss();
}
	
//Dudes Get Rode and Stang in the Taint repeatedly!? Maybe. [DONE] (-F) [edited]
//Requires dick that'll fit!
function dudesGetStangRoad():void {
	clearOutput();
	//Set x to appropriate wang
	var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	//HP Lawse
	if(pc.HP() <= 0) {
		output("Collapsing in a heap, you realize that you've been defeated. You can't even summon up the strength to struggle up to a sitting position; when you try, you get about halfway up before flopping back down uselessly.");
		output("\n\nA smooth, honeyed voice teases, <i>\"Awww, I didn't WANT to have to hurt you. I guess I'll have to be extra nice to you to make up for it, huh?\"</i> Her black-hued lips curve into a knowing smile. \"<i>First, let's get you in the mood, lover" + pc.mfn("-boy","-girl","") + ".\"</i>");
		if(!pc.isNude()) output(" Nimble fingers reach into your [pc.gear], stripping you down to full nudity in the blink of an eye. If the air weren't so goddamn warm and humid you'd probably be cold, but the sticky-hot atmosphere feels better naked, somehow.");
		else output(" Nimble fingers strip away the little equipment you carry on your nude body, depriving you of even the usage of simple tools like your codex. You are defenseless with nothing but the humid air to clothe you, but the cloying atmosphere feels so right on your exposed [pc.skinFurScales].");
		output(" A nervous shudder works through your beaten body as you try to come to grips with your predicament, gasping in deep breaths of the zil-girl's pervasive scent.");
		
		output("\n\nThe alien's aroma quickens your pulse and stiffens [pc.eachCock] slightly, coloring your [pc.skin] with additional bloodflow as a touch of arousal worms its way past the pain occupying your mind. Still, you're a long ways from hard right now, and the victorious woman knows it. Even when she stands astride you, letting you gaze at her golden cunt as it oozes honeyed moisture, you barely get to half-mast.");
		output("\n\nHer voice growls, <i>\"You can do better than that. Let me show you.\"<i> She squats just above your crotch and begins to play with herself, letting her amber lovejuice spill out to splatter over your [pc.cocks], glazing them as they twitch and grow a little bigger. Too late, you realize that this lewd show was little more than a distraction, meant to give you something to watch while her insectile abdomen moves into place, its razor sharp stinger tickling the skin under your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.sheath " + x + "]");
		output(", just above your [pc.asshole]. She does not give you an opportunity to react to the accidental brush and flexes inhuman muscles, pushing her bulbous back half down to force that venom-laden needle directly into your taint, stabbing it home with a thrust forceful enough to bury it completely inside you.");
		
		output("\n\nYour eyes cross from the onslaught of fresh pain, and your body squirms, twisting slightly until you realize the movement only makes it hurt worse. As you settle down, you realize with surprise that in comparison to your other injuries, it doesn't hurt all that much. Sure, you'd rather not have been stuck with such a large needle in such a sensitive place, but at least her slender stinger seems to have been designed to operate with a minimum of injury.");
		output("\n\n<i>\"Shhh... shhh... calm down, lover. I'm just going to make you forget all about those injuries so we can focus on what's important,\"</i>  the wasp-like woman coos as she takes [pc.oneCock] in her hand and begins to stroke. Her expression slackens slightly, and she mutters something about 'not holding it back anymore'. There's no time to question her over it, because you're suddenly growing inexplicably warmer. The air was hot before, but now you're just as hot, if not hotter, and your crotch is the hottest part of all. You can feel it flowing into you where she stung you, making your [pc.skin] feel taut, tingly, and sensitive. You feel like your suddenly rock-hard shaft");
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
		output(" propelled by mounting desire too strong to understand or consider. [pc.EachCock] trembles with aching, complete need, and you flop down on the ground, grabbing {it/one} to stroke, jacking yourself off right there while the victorious wasp-woman looms over you. Her shining onyx lips curl into a smile as she watches you, but her armored, chitinous 'boot' kicks your hand away from your needy boner.");
		output("\n\n<i>\"You think you're horny now, do you?\"</i>  she asks with an imperious sneer.");
		output("\n\nYou nod and try to start up once more with your other hand, but she pins your wrist to the ground under her foot. You vainly twist and thrash against her as she stands over you, her fingers busily pumping away at her sodden quim, dribbling flecks of honeyed lovejuice onto your [pc.chest] and chin. There's no escaping it, though; you're so turned on that your muscles feel like quivering jelly, and she seems vastly more in control of herself than you. You slump down, [pc.hips] giving futile little twitches.");
		output("\n\n<i>\"Do you want to taste real arousal? Lust so powerful it'll make my wonderful pheromones seem like like a match next to a bonfire?\"</i>  the zil beauty coos, not really expecting an answer. \"<i>Do you want to feel ecstasy so potent that your cock</i>");
		if(pc.cockTotal() > 1) output("<i>s will feel like they have </i>");
		else output("<i> will feel like it has </i>");
		output("<i>to fuck anything and everything? Do you want to cum from feeling a gentle breeze on your skin?\"</i>  She frigs herself a little harder, making sure that you're getting a thick dosage of her mind-dulling, dick-swelling pheromones. She knows you'll agree. The question is just how long she'll have to sit here making you smell her twat before you do.");
		output("\n\nLicking her juices from your lips, you do the only thing you can in this situation, nod your head and hope that this means she'll let you touch your dick, or better, mount you.");
		
		output("\n\nThe wasp-woman bends over you to breathily whisper in your ear, <i>\"I knew you'd make the right call, lover.\"</i>  She nips at the bottom of your ear before kissing her way down your jawline, over your cheek, and then over to give you a lingering kiss. The sensation of the soft, pillowy feel of plump lips against your own is what you could only call divine, and her long tubular tongue slips inside your mouth to writhe and wriggle excitedly. You're so aroused by this point that the oral tryst has your complete and total attention, even if your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" twitching along with your heartbeat and leaking on your [pc.belly]. A slight, barely noticeable scratch below your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.sheath " + x + "]");
		output(" and above your [pc.asshole] is felt, but you're too busy to care. If only you had the capacity to think about it, you'd realize that her insectile abdomen is dipped down towards your taint with her stinger out of view.");
		
		output("\n\nYou aren't given the chance to puzzle it out. She flexes inhuman muscles, pushing her bulbous back half down to force that venom-laden needle directly into the sensitive bridge between crotch and anus, stabbing it home with a thrust forceful enough to bury it completely inside you. Whimpering into her lips, you briefly squirm at the intruding pain, steadying yourself a moment later when you realize that twisting only makes it worse. It doesn't really hurt that badly, but it took you completely by surprise. You steady yourself as the smirking woman breaks the kiss with a grin.");
		output("\n\n\"<i>I always wondered what would happen if you gave someone a full dose while they were this horny. Hold onto your </i>");
		if(pc.balls > 0) {
			output("<i>ball</i>");
			if(pc.balls > 1 ) output("<i>s</i>");
		}
		else output("<i>cum</i>");
		output("<i>, lover,\"</i>  the armored seductress commands as her face visibly relaxes, mouth opening in something approaching relief. You feel something warm and wet pouring out into your body, just behind your crotch. The throbbing hurt around her stinger melts away almost instantaneously into a simmering warmth that races through your body like wildfire. One moment, your crotch and [pc.butt] are getting so warm that they feel as if they’re about to melt, and the next, every square inch of your [pc.skin] is tingling and flushed, so sensitive that you can't stop your hands from playing across your [pc.chest], smearing in the honey that this heavenly creature has anointed you with.");
		
		output("\n\nThe jungle air was already beyond warm, but you're even warmer now. As a matter of fact, with every passing second, you feel hotter and hotter. It's like your body is burning thanks to the fuel she's injecting into you, transforming into a creature of searing fire and scorching sex. Your [pc.cocks] ");
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
	output("\n\nShe plunges two fingers into herself as she watches you, panting, <i>\"Now you're in the proper mood, eh, lover?\"</i>  Her black, alien eyes observe your crotch's senseless, aroused convulsions, watching the way her aphrodisiac is affecting you and loving every minute of it. Her right leg quivers slightly as her own pleasure grows, and she bites her lip for a second, considering her options. She doesn't take long to come to a decision. An expression of amused excitement settles on her smooth, delicate visage as she removes her hand and kneels down over you, her excited mons dripping her delicate honey over your [pc.cock " + x + "].");
	output("\n\nTo you, the falling honey feels more like tiny, molten amber fingertips, slipping and sliding over your girth{s} and leaving a tingling, pleasant residue in their wake. Where you've been gilded with sticky-hot love, the tongues of air you've been feeling flicking across your over-sensitive length transform into velvet-soft folds of disembodied pussy, teasing you with the way they slowly roll and press their phantom friction against you. Your [pc.cock " + x + "] is oozing so much pre-cum that it's begun to tint " + [pc.cumColor] + " with leaking [pc.cum]. The pleasure is going to make you blow any second now, just from having a few drops of her pussy's love-honey fall upon you.");
	output("\n\nThere's so much pleasure everywhere that you arch your back and let your freed hands roam over your [pc.skinFurScales], feeling the ecstasy well up within you.");
	if(pc.balls > 0) {
		output(" Your [pc.balls] twitch");
		if(pc.balls == 1) output("es");
		output(" in your [pc.sack] as ");
		if(pc.balls == 1) output("it churns");
		else output("they churn");
		output(" out more and more of the [pc.cum] you’re about to shoot.");
	}
	else output(" Your middle clenches, and your body races to release the [pc.cum] you feel building up within you, about to explode.");
	output(" Then, the simmering, phantom warmth you've been feeling is replaced with a glove of the most sensual liquid fire, enclosing you in a tightly-compressed glove of orgasmic gratification, squeezing down on you just as hard as your cock is flexing through its climax.");
	
	output("\n\n<i>\"Give it all to me,\"</i> the zil coos as her pussy ");
	if(pc.cockVolume(x) <= foes[0].vaginalCapacity() * .5) output("contracts, vacuum-tight around your girth");
	else output("looks almost painfully stretched around your girth, so tight that it doesn't look like a single drop will slip out");
	output(", the inner walls wringing around your expanding tip while you cum inside her. Whether your orgasm was brought on by the pervasive musk or the sensitivity-enhancing aphrodisiacs doesn't matter to you. What does matter is how glad you are that she slid down on you as you were starting to cum, all so that you could feel your [pc.cock " + x + "] ecstatically erupt inside the volcano of bliss that is her pussy.");
	//Used to track cunt tail usage!
	var gobbled:Boolean = false;
	//Add dick cumming into tailcunt
	if(pc.cockTotal() > 1) {
		if(pc.hasTailCunt())
		{
			var y:int = pc.cockThatFits(pc.tailVaginaCapacity());
			if(y == x) y = pc.cockThatFits2(pc.tailVaginaCapacity());
			if(y >= 0)
			{
				gobbled = true;
				if(pc.cockTotal() == 2) output("\n\nYour extra erection");
				else output("\n\nOne of your extra erections");
				output(" is stopped from spraying its load over your [pc.fullChest] by the sudden appearance of your [pc.tail]. The prehensile, vagina-tipped appendage slams itself down on the fountaining boner just in time to ");
				if(pc.cumQ() < 100) output("wring you dry, running muscular contractions up and down your length until every single drop has been devoured by your [pc.tailgina].");
				else if(pc.cumQ() <= 500) output("fill with [pc.cum]. It tries to pull as much of it inside as possible with ring-shaped contractions of its many internal muscles, but there's just so much that trickles leak out its of its lube-leaking nether-lips.");
				else output("bloat with [pc.cum]. It doesn't even try to drink it all down. It just holds itself on your cock, letting the phallus pack every single internal fold and crevasse while the excess pressure drains out over your already slicked loins.");
				output(" It's like being able to fuck two women at once while being fucked yourself, and the sensations assault your mind, making it difficult to focus on anything but feeding both pussies full.");
			}
		}
		//TO DO: Add extra dick cumshot. (Not gobbled by cunt tail or 2 and 1 gobbled)
		if((!gobbled && pc.cockTotal() == 2) || (gobbled && pc.cockTotal() == 3))
		{
			output("\n\nThreading between the zil's sweat-oiled asscheeks, your extra penis bounces its shaft off the eager female's asshole as it erupts, firing a [pc.cumColor] geyser out of her curvy glutes to ricochet off her big, wasp-like abdomen and rain down over her well-rounded derrière. Her supple flesh squeezes down around you, whether from pleasure, desire, or instinct, you cannot say, but it makes you cum all the harder");
			if(pc.cumQ() >= 200) output(", painting everything between her stinger and her thighs in a thick layer of [pc.cum]");
			output(".");
		}
		//TO DO: Add multicock cumshot
		else if((!gobbled && pc.cockTotal() > 2) || pc.cockTotal() > 3)
		{
			output("\n\nThreading between the zil's sweet-oiled asscheeks, your plentiful erections writhe against each other in excitement. They even bounce off her puckered backdoor as they cum, exploding like a bevy of garden hoses, each firing its stream directly into the zil's big, wasp-like abdomen. The ropes of [pc.cumColor] deflect off her carapace to splatter down over her posh derriere. Her cheeks squeeze down, whether from pleasure, desire, or instinct, you cannot say, but it makes you cum all the harder");
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
		output("walls clench down and spasm with rhythmic, pulsating motions, desperate for penetration and completely denied. You can't even reach ");
		if(pc.vaginaTotal() == 1) output("it");
		else output("them");
		output(" with the insectile succubus milking so effectively: her well-stuffed quim and shining thighs make an impossible barrier. You'll just have to handle the delirium-inducing levels of female desire while you cum your brains out.");
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
		output(", stuffing you full of your own quivering, spurting warmth. It's even better than the honeyed hole that's drinking from your other snatch-filler; you can feel this one from both ends, both receiving the [pc.cum] filling inside you and getting to feel your [pc.cockTail] absolutely give in to your [pc.vagina " + z + "].");
		//Stretch appropriate cunt{s}!
		for(var z:int = 0; z < pc.totalVaginas(); z++) {
			//If you got enough tails to fill that cunt, STREEEETCH IT
			if(z+1 <= pc.tailCount) {
				cuntChange(z,pc.cockTailVolume());
			}
		}
	}
	output("\n\nThe all-consuming pleasure and arousal causes each ejaculation to blend into the next until it feels like you're shooting one long, continuous strand of liquid relief directly into the wasp-woman's ready womb. Crying out, your voice loudly announces to anyone and everything in the surrounding jungle that you're having the most exquisite climax of your life. There’s no way you could not vocalize your bliss, given how beautiful this ejaculatory nirvana is.");
	if(pc.cumQ() <= 50) output(" Even when you run out of [pc.cum] to shoot and come down a little from your high, your [pc.cock " + x + "] remains as hard as a rock.");
	else if(pc.cumQ() <= 150) output(" Even when you cum enough to give her uterus a thorough seeding, you never come down enough to go limp. Your [pc.cock " + x + "] seems perpetually hard as rock.");
	else if(pc.cumQ() <= 1000) output(" Even when you've raised a decent-sized bump in her belly from the massive [pc.cum]-injection and let your orgasm ebb, your [pc.cock " + x + "] remains perfectly hard.");
	else if(pc.cumQ() <= 5000) {
		output(" Even when you've gifted the alien a ");
		if(pc.cumQ() <= 3000) output("noticeable");
		else output("huge");
		output(", gravid belly and let your orgasm end, your [pc.cock " + x + "] remains as hard as a rock.");
	}
	else output(" Even when you've turned the alien's belly into a [pc.cum]-packed dome and raised the pressure to the point where the excess is squirting out of her nether-lips in orgasmic torrents, your cock remains rock-hard. Not even your fading orgasm will allow it to wilt.");
	output(" You sigh in an odd mixture of contentment and unwavering desire, as eager to fuck as you were a moment ago.");
	output("\n\n<i>\"Mmm, that's a good start. Let's see if you have more left inside you, shall we?\"</i>  the black-lipped lady wonders aloud.");
	
	output("\n\nNodding, you brace yourself, ready to thrust against her thoroughly creampied cunt, but instead of getting the fuck you were anticipating, you get a sudden, stabbing pain right under your [pc.cocks] again. The discomfort fades even faster, immediately and totally replaced with a burning need to cum, to deposit your load directly into this vixen's well-fed vagina again and again. You were ready to fuck her to a second orgasm before, but now you're already back at the cusp again!");
	
	output("\n\nThe venom is doing its work, and the wasp-woman doesn't even bother to pull her stinger out this time. She just starts grinding herself in slow, circular motions above you, moaning and occasionally letting more of her too-potent venom slip directly into your lusting, aphrodisiac-possessed body. She's wet enough to make a jacuzzi jealous and so warm that the lava-creatures of surtur would feel cold in comparison. Her vocalizations of pleasure are high-pitched and melodious, and just listening to her is nearly enough to get you off once more.");
	
	output("\n\nYour vision swims, and you close your eyes before you can become nauseous, not trusting your traitorous sight. The only sense you really need right now is touch. Your spastically throbbing cock");
	if(pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" proof enough of that! Guiding your hands up to her armored thighs, you give in to your subconscious, rut-focused desires and steer her motions to ensure the maximum amount of contact between the alien and yourself. She's using her venom to control you like a remote-activated sex-toy, and you're more than content to give her the vibrations she craves, and you finally manage to find the strength to start bouncing her atop you, feeling her lips cling to you as she slides back down, mixed juices spraying out around her as she bottoms out.");
	
	output("\n\nThe slapping of your paired hips connecting, mashing your genitals feverishly against each other, rings out through the jungle while the drug-fueled tryst continues. You feel neither hunger, nor thirst, nor fatigue as you fuck, tirelessly inseminating the zil woman's fertile slit again and again. Each time she ensures that you stay hard and ready, and each time you fuck her until you experience an orgasm so powerful that you start blacking out after each one.");
	output("\n\nThere is only the hot, wet pussy and your molten need, meeting again and again until you stop thinking entirely, tirelessly pounding away with eager efficiency long after you go dry...\n\n");
	//Orgasm like, 20 times.
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	processTime(200+rand(60));
	pc.orgasm();
	//Raise libido .5 to 5 points depending on libido.
	pc.slowStatGain("libido",3);
	if(!inCombat()) {
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
	}
	genericLoss();
}

//Forcey Face Sitting [DONE][edited]
//-Fen
function forceyFaceSittingFromFemzil():void {
	clearOutput();
	//{HEALTH POWAHHHHHHH LAWS}
	if(pc.HP() < 0) {
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
	output("\n\n<i>\"It'd be impolite not to take advantage of you, even if you are a</i>");
	if(pc.race() == "zil") output("<i> strange-looking zil</i>");
	else output("<i> off-worlder</i>");
	output("<i>,\"</i>  she says as she sits down to straddle your [pc.chest], running an oil-colored fingertip up under your chin to make you look her in the eyes. <i>\"I don't think you deserve to mate with me though.\"</i>  She grabs you by the cheeks and swivels your head this way and that, considering you like a piece of meat. <i>\"No, that wouldn't do. You barely put up a fight. Barely worthy to clean me.\"</i>");
	output("\n\nThe domineering alien's shadow falls across you as she shimmies forward, inadvertently rubbing across your [pc.nipples]");
	if(pc.hasNippleCocks()) output(" and squeezing your [pc.nippleCocks] off with her asscheeks along the way");
	output(", bringing her dewy slit to sit just above your neck. Its honey escapes in a slow trickle. Despite her harsh words, this woman has obviously become aroused by your presence. A short-cropped tuft of downy-soft fuzz sits neatly above the inflamed mound, and the whole of her crotch just smells so goddamned good. If you were standing right now, your [pc.legs] would be giving out from underneath you. There's just something so sensual and right about the aroma, even if it’s laced with the sweetness of her juices and cloys at your nose.");
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
	if(pc.lust() >= 100) output("n even greater");
	output(" frenzy, one that has you ready to do anything just to plunge your face into that glorious, golden pussy and bathe it with your tongue, luxuriating in its heavenly scent.");
	output("\n\nGiggling, the zil perched atop you asks, <i>\"See something you like, off-worlder?\"</i> She sticks a finger inside herself before pulling it out to hold under your nose, giving you a nice big whiff. When you sigh and lean forward to lick it, she playfully dodges, wiping it off on the bridge of your nose.");
	if(pc.hasTongueFlag(GLOBAL.LONG)) output(" You flick out your extra-long tongue experimentally, but the zil just catches it and tuts at you disapprovingly.");
	output(" <i>\"Silly, weak " + pc.mf("thing","slut") + ", getting turned on by the big bad wasp's naked, glistening, beautiful entrance, helpless to do anything but ogle it and breath in its arousing pheromones. The best part is that you know I'm not going to get you off, but you're just too turned on to care. Isn't that right?\"</i>");
	output("\n\nYou nod, craning your neck forward to try and get her pussy; it's so close yet so far away. Yet, when you're finally at the limits of your spine and just about to make contact, she scoots back half an inch.");
	output("\n\n<i>\"Not yet. Not until you beg, alien,\"</i> she promises.");
	
	output("\n\nPushed past to the edge of sanity by want and desire, you immediately ");
	if(!pc.cockTotal(GLOBAL.CANINE) > 0) output("call");
	else output("bark");
	output(", <i>\"Please! Please let me lick your pussy! Ride my face! I want it so bad!\"</i>");
	output("\n\nThe zil cocks her head to the side and says, <i>\"Hmmm, not quite good enough, I think.\"</i>  She idly plunges a finger inside herself, stirring the air with the scent of fresh love and delivering a whole new symphony of pheromonal desire to your rapt olfactory sense. \"<i>That won't do at ALL. You need to beg me properly. When you're willing to risk your life for a taste of my nectar, then I'll consider letting you lick me.\"</i>  A trickle of amber goodness falls onto your [pc.chest], tingling hotly, and you know what you have to do.");
	output("\n\nYour voice is ragged with desperation as you beg again, <i>\"Please, give me your cunt, Mistress! Feed me your pussy. Smother me in it until I learn how to breathe your juices and nothing else. Just give me a taste! I'll follow you around and lick you for hours every day, just for one taste!\"</i>");
	output("\n\nSmiling, she pats you condescendingly on the head. <i>\"That's more like it. I hope you're ready.\"</i>");
	output("\n\nA hint of awareness nags at you for what you’ve just promised, but you bury it under mountains of lust as the the zil starts to move.");
	
	output("\n\nGrabbing you by the ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("head");
	output(" in a double-handed grip, the aphrodisiac-perfumed woman pulls you up at the same moment that her hips slam forward. A lurid squelch echoes through the jungle as the zil's musky quim smashes against your face, smearing over your nose, leaving trickles of fragrant wetness over your cheeks and chin. Your neck strains to press you back into her sodden box, finding a perverse balance with the two of you grinding upon one another, lips to lips and spit to cum. You thrust your [pc.tongue] with unrepressed eagerness, diving straight into the honeyed slit in order to bathe your tastebuds with its ambrosial flavor.");
	
	//Long tongue bonus!
	if(pc.hasTongueFlag(GLOBAL.LONG))
	{
		output("\n\nThere's so much to your oral organ that heartbeats tick by while you're pushing it all into her, enjoying the sounds of her gasping enjoyment as you thrust inside. She’s surprisingly deep, but you you eventually find her cervix - a tight little hole fairly dripping with honey. You let your tip make slow circuits around it, feeling it flex and clench in response while the thick base of your organ rolls around this slippery channel's entrance.");
		if(pc.hasTongueFlag(GLOBAL.PREHENSILE)) output(" Showing just how talented you are, you twist your muscle into a helix shape that presses on her walls from all sides, and with a deft flex expand it outward, stretching her open so that the honey can ooze out directly into your waiting [pc.lips].");
	}
	
	output("\n\nClamping her legs down around your head, the zil moans, <i>\"That's gooood work.... Mmm, you weaklings always lick so well once I give you some proper motivation. Don't slow down now, we're just getting started.\"</i>  Her stinger brushes against your [pc.hip] threateningly, and you increase your efforts accordingly, rubbing your nose back and forth against her sweet little button, feeling it catch and bounce among its silken folds. Its owners voice jumps an octave in a high-pitched screech of pleasure, <i>\"Yesssss! Tonguefuck me, you horny slit-slave. Lose yourself in my taste like you lost the fight!\"</i>  She lifts her hips to grind hard against you. <i>\"This is what you were meant for - serving pussy, licking and lapping and only breathing when your betters allow you to!\"</i>");
	
	output("\n\nAbruptly, she pulls her herself away, filling your swimming vision with the scintillating web of honey that hangs between the two of you. You gasp for breath, seeing stars among the amber strands from going so long without breathing, and before you can pull in another, she's pressing back down on top of you, forcing you right back into servicing her superior slit. You cannot help but hum in relief and excitement at such a speedy return, and as her juices run down your tongue, your body lights with a placid, subservient pleasure. The realization that you're serving her so well combines with the lusty high her pheromones have forced upon you to settle in an orgasmic balm. It isn't a proper climax, but there is a palpable feeling of warm, happy contentment running under your frenzied need you feel to service her oozing quim.");
	
	output("\n\nThe chitin-armored beauty giggles and ");
	if(pc.hasHair()) output("strokes your [pc.hair]");
	else output("pats your head");
	output(" happily. <i>\"I might have to keep you a-ah-ahhh... mmm... around for a while if you lick like this.\"</i> She shivers in pleasure. <i>\"Hold still, I'm going to shift position and give you a REAL faceful.\"</i> She lifts herself up, separating you from the golden treasure lurking between her black-armored thighs for a moment while she turns about, and then, she's lowering herself back down with her ass above your forehead and her cunt angled back towards your mouth. She presses down, smothering you between her thick, hard thighs and the softness of her ass, her insectile abdomen hanging off behind you. It bobs noticeably whenever you lick a particularly sensitive spot.");
	output("\n\nYour face is being used like a cheap sextoy and denied air for so long that your vision would be swimming if she weren't blocking the light with her soft, cushy ass-cheeks. Thrashing about inside her, your tongue goes wild, hurriedly trying to bring her off before you choke to death on her delicious... wonderful... sticky... mmm... cunt-juice. It's getting hard to focus, but you manage to make your trembling lower [pc.lip] quiver against her clit as you near the edge of passing out. The worst part is that it’s getting harder to care if you die like this, tongue-deep in a beautiful alien twat, denied release and yet still loving every minute of it.");
	output("\n\nThe moan of exquisite relief from up above doesn't even register above the sound of your heartbeat hammering in your ears, but the feeling of your mouth suddenly flooding with the most delicious honey you've ever tasted does get your attention. You gulp it down eagerly, too deadened by oxygen deprivation to realize that she's cumming and figuring that you might as well die with this heavenly taste on your [pc.lips]. You swallow, and swallow, and swallow until you're swallowing nothing but air. It takes a second for your burning lungs to assert themselves, but when they do, you drag in a huge breath of fresh, pussy-flavored air, noisily coughing and sputtering as honey drips across your forehead.");
	
	output("\n\nThe zil is standing over your and busily running her fingers through her well-lubricated box, flicking the excess moisture down at you as you try to catch your breath. Her voice melodiously calls out, <i>\"Not too bad, all things considered. Maybe we'll meet again, but I'd rather fight someone who proves " + pc.mf("him","her") + "self worth breeding.\"</i> She stalks off, leaving you there to recover, something that takes a while given the way your head is pounding. The ache in your jaw and [pc.tongue] is almost as bad.\n\n");
	//Pass an hour+rand(20);
	//Max lust, then take off 5.
	pc.lust(1000);
	processTime(60+rand(20));
	pc.lust(-5);
	if(!inCombat()) {
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
	}
	genericLoss();
}

//Win Menu
//-Fen
function defeatHostileZil():void {
	//{HP}
	if(foes[0].HP() <= 0) {
		output("The zil girl collapses in the face of your superior prowess, face down, ass up, and panting heavily as she tries to recover from the hits she's taken. While her bulbous, stinger-tipped tail obscures her rear entrance and scented honeypot from view, you know they're still there.");
		output("\n\nHer faint voice rouses you a second later when she faintly mumbles, <i>\"You win, off-worlder. By custom, I am yours to " + pc.mf("seed","use") + ".\"</i>");
	}
	//Lust
	else {
		output("Sighing needily, the wasp-girl’s hand dives back between her legs, digging her fingers knuckle-deep into the simmering slit in an effort to quench the excitement you've stoked within her. She moans as she realizes how futile an effort it is, dropping down onto all fours to present herself more perfectly for you. Her voice escapes in a needy pant, <i>\"I yield to you. </i>");
		if(pc.race() == "zil") output("<i>You're more like... like us than you let on, traveller.</i>");
		else output("<i>Mmm... you may claim me now, zil.</i>");
		output("<i>\"</i>");
		//Raise lust to 33 if below and continue:
		if(pc.lust() < 33) pc.lust(33-pc.lust());
		output("\n\nShe's practically begging for it at this point.");
	}
	output("\n\nYou could use her own bandoleer of drugs to really punish her.");
	//DISPLAY SEX OPTIONS
	userInterface.clearMenu();
	//Force Her To Lick YOUR Honeypot
	if(pc.hasVagina()) userInterface.addButton(0,"ForcedLick",forceFemzilToLickYourHoneypot);
	else userInterface.addDisabledButton(0,"ForcedLick");
	//Dose and Masturbate Her With Her Own Sex Drugs (open to all) - done Z
	//requires having fought a hostile female zil once already
	userInterface.addButton(1,"UseHerDrugs",DoseAZilWithSexDrugsEvillyMustacheTwirling);
	//Clit version
	//Req's clit 3.5" or longer!
	if(pc.hasVagina() && pc.clitLength >= 3.5) {
		output(" You could also do that AND fuck her with your clit.");
		userInterface.addButton(2,"MeanClitFuck",numbPussyFuck,false);
	}		
	else userInterface.addDisabledButton(4,"MeanClitFuck");
	if(pc.hasCock() && pc.cockThatFits(foes[0].vaginalCapacity()) >= 0) {
		output(" You could punish her with her toxins and fuck her with your dick too.");
		userInterface.addButton(3,"MeanCockFuck",numbPussyFuck);
	}
	else userInterface.addDisabledButton(3,"MeanCockFuck");
	if(pc.biggestCockLength() >= 36) {
		output(" Then again, there's always the option of smothering her in your giant, hyper-sized dick and letting her get a feel for a REAL cock.");
		userInterface.addButton(4,"HyperSmother",smotherDatBeeSlutInDickYo);
	}
	else userInterface.addDisabledButton(4,"HyperSmother");
	output("\n\n");
	userInterface.addButton(14,"Leave",genericVictory);
}

//Force Her To Lick YOUR Honeypot (DONE -F) (edited)
function forceFemzilToLickYourHoneypot():void {
	clearOutput();
	var x:int = rand(pc.totalVaginas());
	output("Sitting down next to the zil, you lean back");
	if(!pc.isNude()) output(" and remove your [pc.gear]");
	else output(" and casually toss aside the few belongings you bothered to carry on your semi-nude body");
	output(". She casts her gaze ");
	if(foes[0].HP() <= 0) output("curiously");
	else output("eagerly");
	output(" in your direction to try and see what you're doing - or what you plan to do to her. Not wanting to keep her waiting, you lean back, spreading your legs a bit further to expose your [pc.vaginas], and tap at your increasingly puffy entrance.");
	output("\n\n<i>\"Here,\"</i>  you command with authority. <i>\"Lick. You can understand that, can't you?\"</i>  You press your palm down against your mons to feel the hard bud");
	if(pc.totalVaginas()/pc.totalClits() > 1) output("s");
	output(" of your clit");
	if(pc.totalVaginas()/pc.totalClits() > 1) output("s as they swell ");
	else output(" as it swells ");
	output("up eagerly, firm and sensitive. Pulling back, you expose your puffy entrance");
	if(pc.totalVaginas()) output("s");
	output(" to the rapt, attentive creature. <i>\"Lick.\"</i>");
	
	output("\n\nWith a demure nod, the glossy, armored beauty crawls over to you with surprising meekness. It's almost like her former sauciness has been switched off. She squirms ");
	if(pc.legCount > 0) output("in between your [pc.legs]");
	else output("over to straddle your [pc.leg]");
	output(", her large breasts swaying delightfully beneath her with every movement. You reach out to grab one, roughly pinching a dusky nipple between your fingertips. A trickle of honey emerges at your touch, and the sweet, sticky fluid coats your fingers. The zil moans huskily, her other breast leaking alongside. You release her with a smirk and press your fingers to her sable lips.");
	output("\n\nTentatively extending her tongue, the fey creature surprises you by opening up the tip of her long muscle to expose its hollow interior, slick with alien saliva. She presses on, enveloping your paired fingers in a cocoon of spit, slipping back and forth in a way that's cruelly reminiscent of actual sex. She finishes, and her tongue retracts to leave you completely and utterly clean, if a little wet. The oral organ slips back into her mouth like a snake into a hidden burrow. Her eyes twinkle with a sultry glow as she allows the tip to squeeze back out, and she cocks her head to the side questioning, flicking her eyes meaningfully between your crotch and your face as if asking for permission.");
	
	output("\n\nYou don't let her or her tongue wonder. Grabbing her back the back of her head, you firmly yet gently force her face down to your [pc.vagina " + x + "], feeling her hot, panting breath wash across your labia as she nears. ");
	if(pc.hasCock()) 
	{
		output("[pc.EachCock] flops across the top of her head as she settles in");
		if(pc.balls > 0) output(" with your [pc.balls] on her forehead. ");
	}
	output("She purses her spit-shined ebony lips just in time to plant them upon your nethers in a wet kiss. Her mouth feels so wonderfully warm and wet against you, and her lips... those gorgeously full lips... they form such a perfect seal over you as they slide against your sensitive labia. It feels even better once she sucks a little bit, easing more blood into your already engorged sex and causing your ");
	if(pc.totalClits() == 1) output("[pc.clit]");
	else output("[pc.clits]");
	output(" to swell to full size.");
	if(pc.clitLength > 3.5) {
		if(pc.totalClits() == 1) output(" It nigh-instantaneously fills");
		else output(" One nigh-instantaneously fills");
		output(" your lover's surprised mouth with a thick helping of ");
		output("girl-rod");
		if(pc.clitLength > 6) {
			output(" and curls down to fill her groaning throat");
		}
		output(".");
	}
	//Big Clits
	if(pc.clitLength > 3.5) {
		output("\n\nThe surprised alien noisily breaks away, accompanied by sudden coughs as she tries to breathe once more. Before you can grow angry at her, she recovers and extends her tongue once more, letting the hollow opening come to rest upon the tip of your [pc.clit], sensuously circling it to keep you in agonizingly intense pleasure. You throw your head back and moan out loud, the zil's transgressions instantly forgiven in the face of her unique, clit-polishing talent. The longer she keeps it there, the further down it slips, and the more of your female rod you get to feel enveloped in near-frictionless muscle. Her mouth returns to your pussy while her tongue continues to tangle with your super-sized clit. The dual sensations are almost unfathomably pleasant.");
	}
	//Not big clits
	else {
		output("\n\nThe cunt-frenching alien noisily breaks the seal with an abrupt change in her approach. Her lips purse, and her tongue slips out, folded in a 'u' shape. The bottom of her slick organ dips right into your [pc.vagina " + x + "], while the tip arches over to find ");
		if(pc.totalClits() == 1) output("your [pc.clit]");
		else output("a [pc.clit]");
		output(". It closes around your tremendously sensitive organ and begins to suck, and the portion of her muscle buried inside lurches, starting to rise and fall along with the pulsing rhythm of suction she exposes your bud to. You throw your head back and moan out loud, the zil's transgressions completely forgotten under the care of her talented tongue and lips as they resume kissing.");
	}
	//Merge
	output("\n\nGrabbing the wanton creature once more, you encouragingly guide the motions of her head, grinding yourself off on her sable slit-kissers. Her face is quickly getting a coat of [pc.girlCumColor]; it's most noticable on her plush lips, which appear almost swollen under their many layers of liquid pleasure. Her affections don't slow or relent either. She seems genuinely interested in giving you the most absolutely pleasurable bout of cunnilingus you've ever received. It's obviously not her first time being forced to serve in such a manner.");
	output("\n\nNoisy slurps and smooches fill the air along with the scent of alien pheromones and musky pussy-scent as she worships your [pc.vagina " + x + "], tending to your [pc.clit] with equal desire. She already has your [pc.legs] quivering and your [pc.hips] giving little jerky twitches, making you instinctively hump against her face as she works. Your body is alight with pleasure, radiating outward from your [pc.clit] as it is fully engulfed and pumped oh-so-pleasantly.");
	if(pc.totalClits() > 1) output(" The busy cunt-slobberer finds another pleasure-organ to touch, and when she does, you screech like a banshee, mashing your [pc.vagina " + x + "] against her hard enough to feel her nose digging into your [pc.skinFurScales].");
	else output(" The busy cunt-slobberer kicks up the tempo, at the same time sliding her tongue almost fully off you, and then she's pumping it up and down, tongue-fucking you while you start to screech in ecstasy.");
	if(pc.isSquirter()) output("\n\nYour juices spray from [pc.eachVagina] in torrential geysers, soaking the zil's face in [pc.girlCum] with so much that spatters of drops are starting to glaze her chest. She gulps and swallows as much as she can, but that's only a tiny fragment of the orgasmic deluge you release, your pussy spasming and squirting until your body goes numb and slack.");
	else output("\n\nYour juices drip directly into the zil's hungry mouth, giving her a good strong taste of your [pc.girlCum] as your desire plateaus into bliss. She gulps and swallows it all, and she even makes a show of holding her mouth open as you fill it. Her tongue keeps you more than busy enough until your spasming muscles go numb and slack.");
	output(" A happy smile spreads across your face as you come down. You still find the strength to drag her face up and down your slit, painting her with one last layer of your scent.");
	output("\n\n<i>\"Not bad,\"</i>  you remark as you push her into a sitting position. ");
	if(pc.isNice()) output("<i>\"You're totally worth the fight, babe.\"</i>");
	else if(pc.isMischievous()) output("<i>\"I wish I could get you to do this without having to deal with the trouble of fighting....\"</i>");
	else output("<i>\"Next time I trust you'll have the sense to skip the fight and just start licking immediately.\"</i>\n\n");
	
	processTime(20+rand(10));
	pc.orgasm();
	genericVictory();
}
	
//Dose and Masturbate Her With Her Own Sex Drugs (open to all) - done Z
//requires having fought a hostile female zil once already
//kind of evil
function DoseAZilWithSexDrugsEvillyMustacheTwirling():void {
	clearOutput();
	output("Kneeling beside the zil, you roughly turn her over onto her backside. She looks at you with questioning eyes, but ");
	if(foes[0].HP() <= 0) output("makes no move to resist.");
	else output("her fingers continue to work her desperate cunt.");
	output(" Less interested in fucking her than in fucking with her, you unfasten her belt and slip it free from her hips. With a kiss on her mons and two fingers of your own inside her, you absently work the humming zil’s pussy to keep her distracted while you browse her toys.");
	
	output("\n\nOne of the red-painted darts comes free from its clasp, and you experimentally prick yourself with it to confirm your guess. A shallow blush of arousal blooms in you, and you know that this dart is coated in aphrodisiac. The zil smiles at your experimentation and reaches out to take the dart from you, but you hold it away. Renewing your assault on her pussy, you lower the dart to just above her labia.");
	
	output("\n\n<i>“Best to hold still,”</i>  you tease, caressing her once with the tip as you work your fingers. The zil tenses up with worry, trying to remain stone-like as you do your best to move her world. Curling a finger, you find a firm spot inside her and rub it; the zil gasps and jerks her hips fitfully, then moans as she realizes what she’s done. The dart sticks from her labia, and the latter begins to color as the aphrodisiac takes effect.");
	
	output("\n\n<i>“Oops.”</i>  With a laugh, you pull it free and hold it over her pussy again. <i>“Do better.”</i>");
	
	output("\n\nMaliciously, you finger the zil’s sweet spot again; her whole body quivers as she tries to fight the effects of your touch and the dart. A little reprieve is all it takes to break down her walls; you pause in your fingering and let her recover a moment, then quickly rub the spot once more and the zil, without thinking, thrusts her hips as if fucking your fingers, poking herself twice. Taking the dart away, you cast it aside and grin at the flushed woman. <i>“You’re terrible at this game.”</i>");

	output("\n\nOnce again, you peruse the contents of her belt, this time turning up a little pouch of reddish, chalky mixture similar to what you found painted on the dart. Presumably this is what she uses to rub on another layer of the drugs once the dart’s coating has been used up. Opening the pouch all the way, you greedily lap up the paste with your [tongue]. Before your body can absorb too much of it, you bow your head to the zil’s cunt and push the clitoris free from its hood. Smothering the exposed button with your mouth, you paint over and over it with broad strokes, raising passionate cries from the drugged woman. Her pussy spasms in orgasm and her thighs clasp around your head, but you continue to transfer from your tongue to her without stopping, even as she fills your mouth with wet, honey-flavored girlcum. By the time the tingling in your tongue finally ends, the zil has already climaxed twice more and is looking down at you in a daze, both hands pinching her nipples and sticky with honey.");
	
	output("\n\nOne last foray into her belongings, and you withdraw the largest vial you can find, examining its contents as the zil looks on in exhausted apprehension. The powder half-filling it is the same as the kind you found covering the aphrodisiac darts and in the refill pouch. Smiling, you uncork it and hold it under the wasp-woman’s drooling vagina. <i>“You had better be careful this time,”</i>  you admonish, sliding it home. <i>“If this vial fills up with your juices, all this dust will spill out into your pussy.”</i>");

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
	genericVictory();
}

//Numb Her Pussy (req. some form of dick or giant clit that will fit) - done Z
//kind of evil
//var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
//if(x < 0 || pc.cockTotal() == 0) x = -1;
function numbPussyFuck(dick:Boolean = true):void {
	clearOutput();
	output("The presumptuousness of this woman stops you in your tracks. The fact that she still assumes she’s entitled to sex after being ");
	if(foes[0].HP() <= 0) output("beaten");
	else output("humiliated");
	output(" by you incenses you, but your body thrums with pheromone-induced lust all the same and she smiles knowingly. At a loss to satisfy both your desires to fuck and to punish her, your eyes wander her prone form until they alight on her belt of toxins and darts.");
	
	var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
	if(x < 0 || pc.cockTotal() == 0) x = -1;
	if(!dick) x = -1
	
	output("\n\nBurying your intent in mock-affection, you lean down and trace your fingers along her hips, causing the woman to shake her rear enticingly. Reaching underneath and locating the fastenings of her belt, you unlatch it and pull it away from her. She looks over her shoulder curiously as you inspect the contents and pull away a dart. Exposing yourself and holding it over your groin");
	output(" for your prospective victim, you watch the reaction on her face. At the sight of the first dart, she grimaces and shakes her head, and you set it aside. The next dart is answered with another vigorous shake and a limp-wristed pantomime, and, guessing that it contains paralytic toxins,  you quietly put it down as well. The third dart you find causes your unsuspecting lover to nod her head and smile, placing her hand over yours, and you warily allow her to guide the dart to the base of your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("[pc.clit]");
	output(" and sink it in. A flood of arousal washes through the area; your ");
	if(x >= 0) output("dick stands on end, more proud and erect that you can remember seeing it recently");
	else output("clit swells to incredible size, resembling a large ruddy-colored dildo more than any feminine button");
	output(".");
	
	output("\n\nExcited by your arousal, the wasp-girl returns to her prone position, raising her ass in the air and lifting her chitin-covered abdomen to expose her needy pussy. An expectant hum fills the air as she anticipates being filled by you, and you place a hand on her hip again as if to steady her for entry. Rubbing her ass to reassure her, you quietly reach over and pick up the paralyzing dart. Before the zil can form a suspicion, you guide it under her pussy and jab upwards, burying the tainted needle into her labia. She jerks half-upright with an alarmed cry, and you quickly grab her between shoulder and neck and jab the dart in, first above one breast and then the other, aiming as close to the armpits as you can get without hitting her chitinous covering. With a pained moan, the zil slackens and her clawing, struggling hands drop numbly to her side.");
	
	output("\n\n<i>“What are you doing, off-worlder?!”</i>  she demands weakly, looking over her shoulder.");
	
	output("\n\nPushing her face into the dirt, your mouth spreads in a twisted grin. <i>“</i>");
	if(foes[0].HP() <= 0) {
		if(x >= 0) output("<i>Seeding</i>");
		else output("<i>Using</i>");
		output("<i> you, as is your custom.</i>");
	}
	else if(pc.race() != "zil") output("<i>Suppose I’m just like you after all.</i>");
	else output("<i>Isn’t this the zil way?</i>");
	output("<i>”</i>");

	output("\n\n<i>“That’s... no...”</i>  she trails off, robbed of her voice by the toxin. Her jaw hangs half open and a trail of saliva runs into the soil, though her still-alert eyes follow you as you ");
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
		//[tailcock]} into her
	}
	//lift her leg and slide her onto your nipple-cock
	output(". Her hips shake lazily, perhaps trying to afford her some control of the fuck, but the zil is completely your plaything as you begin to thrust in her. When she realizes she’s completely unable to get any response from her leaden cunt, a low, frustrated, moan rolls out of her throat.");

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
		else if(pc.cumQ() < 1000) output("You pump and pump, filling her with stroke upon stroke of semen, until her pussy is full and it begins to flow back around your shaft.");
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
	pc.orgasm();
	genericVictory();
}

//Smother Her In Dick [DONE](edited)
//-Fen idea
//Everyone wanted me to write this first, so here goes.
function smotherDatBeeSlutInDickYo():void {
	clearOutput();
	if(pc.armor.shortName != "" && pc.lowerUndergarment.shortName != "") output("You slip out of your [pc.armor] just in time to see your [pc.lowerUndergarment] tenting dangerously around your [pc.cockBiggest]. It takes a few moments of struggling to get the rest of your clothing off, but when you feel yourself flop free, a shudder of relief travels up your spine.");	
	else if(pc.armor.shortName != "") output("You slip out of your [pc.armor] as quickly as possible, lest your [pc.cockBiggest] tear it off for you, or worse, get stuck inside.");
	
	else {
		output("You wriggle to drop the pieces of gear you carry on your ");
		if(pc.upperUndergarment.shortName != "") output("mostly ");
		output("nude body. You've got to admit, you're secretly glad you've been going around so unencumbered by things like clothes or armor.");
	}
	//No new PG
	output(" Between this girl's pheromones and the sight of her presenting herself so readily, there was no way any kind of clothing could contain such a giant once it roused from slumber, and it is definitely awakening right now, lurching up inches higher with every pounding beat of your heart. It passes the halfway point, momentarily jutting out from your crotch at a 90 degree angle before your building lust carries it higher, seeming to fill it with molten hot need. Each twitch upward solidifies your desire to absolutely bury this wasp-bitch in cock. You wrap a hand around your twat-splitting member, stroking it languidly as it assumes its full, rigid size, and it twitches hard at the zil woman's open-mouthed disbelief.");
	output("\n\n<i>\"Is that... is that real?\"</i>  she breathes, hesitantly extending a honey-glazed digit towards it, a web of amber ropes still connecting her fingers to her twat. She crawls closer, an awkward, shuffling gait made worse by the way her oversized tail sways behind her. Her hot breath falls on your sensitive tool. <i>\"None of the males have anything like this....\"</i>  The strands of honeyed girl-cum connecting her pussy to her palm finally come apart under the weight of her fresh, leaking moisture. <i>\"I-it's magnificent.\"</i>");
	output("\n\nTaking a swaggering step forward, you let your [pc.cockBiggest] come to rest in the cradle of her slick fingers, pushing it just hard enough that she has to support some of the extensive weight. The flesh, even hard, is still spongy enough that she sinks partway into it as she tries to handle you, not even capable of grabbing half its circumference. Giggling in delight, the defeated wasp-girl rises onto her knees so that her other arm can help, rubbing slippery-smooth chitin-coverings up in down in fascinated, hypnotic strokes. She shivers, and you see a thick strand of honeycum hanging from her between her legs, growing thicker and heavier by the second.");
	output("\n\nYou advance further, bearing the weight of your giant erection forward forcefully enough to tumble her over onto her back, legs splayed around her downward-curving, stinger-capped abdomen with you ");
	if(pc.isNaga()) output("coiled above");
	else if(pc.hasLegFlag(GLOBAL.AMORPHOUS)) output("flowing around");
	else output("standing astride");
	output(" her supine form. You change position to press your [pc.cockBiggest] even more firmly against her, hard enough to push her arms back, dropping your penis right on top of her. The zil woman's body feels wonderful against you, even the way her cushy breasts press their nectar-leaking nipples against the underside. Just above her face, your [pc.cockHeadBiggest] swells up, drooling a trickle of pre-cum in excitement.");
	output("\n\nA pleased-sounding gasp emanates from underneath you. <i>\"Leaking already? Then what if I do this!\"</i>  She wraps her arms around your girthy tool, just below the [pc.cockHeadBiggest], and her chitinous legs near the [pc.sheathBiggest], the insectile plating sliding across you like oiled silk as she settles in, squeezing a bit tighter. In the process, she winds up pressing the whole of her breasts, torso, and waspy hips against your dick's bottom.");
	output("\n\nYou groan appreciatively and, shuddering powerfully, grab her by her ");
	if(pc.cocks[pc.biggestCockIndex()].cThickness <= 18) output("crossed ankles");
	else output("shaft-split ankes");
	output(". Head flaring, you draw back, popping your sensitive tip through her arms and gliding through her thighs, drooling a layer of pre across her body as you go. Before the phallus-obsessed alien can react, you thrust forward, jamming your dick back through her arms, fucking the whole of her body with that long, powerful stroke. Her nipples gush rivers of honey from the friction, turning her body into a sticky mess of sex-juice and sweets, one you are all to happy to slide across, fucking it with firm, strong movements.");
	
	output("\n\nYou're treated to brief glimpses of the slick slut's visage in between your firm pushes. Every time, her face has a bit more more of lubricant painted across it, though her own honey is rapidly turning your sex-slime into a scintillating glaze. Her black lips part in an excited coo, and a tongue, long and flexible, slips out to flick across your leaking urethra, slurping down some of your pre-ejaculate whenever you hilt her and cleaning her face when you aren't - not that it does much good. Your piston-like motions smear a fresh coat over her every single time.");
	output("\n\nShe looks like she desperately wants to say something, but she's so busy with her tongue that it just never comes out. The way her eyes seem to unfocus with each slurp of cum doesn't exactly paint a picture of a person ready for conversation anyway. You hold on harder and pump through her legs even faster, grunting each time, sometimes even snarling at the sublime pleasure of using this girl's entire body as a masturbation sleeve. The zil moans and babbles something too muffled to understand, maybe <i>\"more,\"</i>  and you oblige her with even more dominant, aggressive strokes.");
	output("\n\nDragging her a little over the ground with each lewd hump, you struggle not to blow your load all over her face. It's so hard, as wet and hot and gorgeous as she is, smothered in your pre and completely devoted to serving your cock. Whatever she wanted before, she's forgotten it now. Her eyes flick up to your face, imploring you to cum all over her and give her the jizz-bath she deserves, before they unfocus once more, rolling partway back as she coos in pleasure, grinding her sodden box along your rapidly expanding urethral bulge.");
	output("\n\nOh fuck, here it comes! You push forward and down as hard as you possibly can, butting your tip right up against the sodden slut's exquisitely blissed-out face just in time to to " + pc.mf("roar","cry out") + " in passion. Your [pc.cockHeadBiggest] swells even bigger, and a droplet of [pc.cumColor] ecstasy appears on your slit, hanging there for an agonizingly exciting split-second. Then, you're launching a huge, thick rope of [pc.cum] across the alien's cheek, splattering above her eye, glazing her forehead, and oozing down the middle of her face to coat her sable libs in a [pc.cumColor] shine. She squeezes her legs tighter, locking you in place, but her body is anything but still. Her arms have separated to separately stroke and caress your length, squeezing its twitching bulk to make the next ejaculation even bigger than the first. Below, her hips are undulating in broken, arrhythmic shudders as gushing honey splatters your tool.");
	//Cum less than 10ml
	if(pc.cumQ() < 10) {
		output("\n\nUnfortunately, that's all you've got. Your [pc.cockBiggest] lurches, twists, and writhes, flexing as if it were launching gigantic ropes of jizm, but your ");
		if(pc.balls > 1) output("empty balls");
		else if(pc.balls == 1) output("empty ball");
		else output("spent body");
		output(" just can't manage to create another drop. The movements succeed in smearing your already shot load all over her face, not adding anything new but succeeding in making quite the mess anyway.");
		output("\n\n<i>\"Mmm, just a taste to get me going?\</i>\"  the alien coos as she collects it into her mouth. <i>\"Next time, give me more!\"</i>");
	}
	//Cum is less than 50
	else if(pc.cumQ() <= 50) {
		output("\n\nThe next shot is just as big as the first, and this time, either your aim has improved on your partner is trying to swallow it all. You don't feel an ounce of resistance as your [pc.cum] spews forth, washing straight into the zil's noisily gulping mouth. Her eyelids close as your rope trails off into droplets, satisfied with the sample she's swallowed, yet her tongue unspools, revealing a hollow nature as it seals itself around your twitching cumslit just in time to catch the last few pulses of distilled delight in its tubular embrace, passing it directly to her belly.");
		output("\n\n<i>\"Mmm, not too bad, off-worlder,\"</i>  the alien coos as she wipes a trickle of [pc.cumColor] from the edge of her mouth. <i>\"Though from how big you are I was expecting to get drenched!\"</i>  She licks her lips. <i>\"I bet you probably just used it all on someone else already, huh?\"</i>  There's a mischievous glint twinkling in her eye.");
	}
	//Cum is less than 500
	else if(pc.cumQ() <= 500) {
		output("\n\nThe next shot feels like its twice as big as the first, and this time, either your aim has improved or the dick-hungry whore is guiding you straight to the prize: her sucking, glazed mouth. You bathe her tongue in the slippery morass of your release, flooding her oral cavity to such a degree that her cheeks bulge and runnels of [pc.cumColor] leak from the corners of her mouth. Her throat noisily attempts to gulp down the heavy load, but you fill it as fast as she can swallow, not stopping until she's taken three large swallows.");
		output("\n\nThe wasp-like woman grabs your [pc.cockHeadBiggest] in both hands to steady it, unspooling her tongue to your quivering cumslit while gasping for air. A light, ticklish pressure seals around your organ's tiny slit, revealing the zil's tongue to be hollow just in time for your next release. You blast [pc.cum] straight into the tubular proboscis before she's completely ready, stretching the hollow, organic pipe to twice its original diameter as you completely fill it, pouring your need into her in a direct path to her stomach. A noisy gurgle comes from her belly, but she manages to take it all with a pleasure-dazed smile.");
		output("\n\n<i>\"Mmm, nice and filling, big " + pc.mf("boy","girl") + "...\"</i>  she sighs as she separates from your dick, letting the last few drops spatter across her face. <i>\"No one has ever pinned me under their dick like that before. It was almost worth losing to you!\"</i>");
	}
	//Cum is more than 500
	else {
		output("\n\nThe first shot was little more than a warm up. Your next is deluge of titanic proportions - an avalanche of [pc.cum] that bursts from your [pc.cockBiggest] like water from a firehose, instantly drenching the exotic beauty's hair and face in a thick layer of organic paint. Rivulets of it run down her skin, chitinous armor, and fluffy borders between. Her mouth gapes open in surprise and is instantly filled, stuffed with your delectable organic cargo to such an extent that her cheeks bulge and her lower lip becomes the edge of a spermy waterfall. Trying to swallow it all, she closes her now-[pc.cumColor] lips and does her best to work it all down, gulping noisily while your blast fades to a trickle.");
		output("\n\nThe zil tips her head back and opens her mouth, showing you that she's devoured it all just in time for the next ejaculation to tag her right between the eyes, splattering in sticky strands in another face-coating layer. Some puddles in the hollow of her neck, a tiny lake of liquid love growing ever deeper on your lover's surprised body. Her supine shape trembles through another orgasm of her own as she grinds against your meat, getting off one being smothered in cock and painted with its immense outflow. The geyser of wet warmth erupts against your underside, feeling like having the loveliest, warmest honey painted across your sensitive surface. You shudder as the next pulse readies itself.");
		output("\n\nThere's no warning, and certainly no way the alien can prepare herself. She's too busy lying there, writhing in the mud, cumming her brains out to the feeling of being completely owned by your [pc.cockBiggest], marked and stained with the proof of your superior virility. She mewls as another layer of [pc.cum] covers her, running her hands through it to gather it. With hands full, she presses your [pc.cumColor] relief down to the fluttering hole betwixt her thighs, stuffing it inside like precious gems into an empty vault. She shovels as much as she can in while you rain it down upon her, not stopping until there's a frothy mess oozing out of her hole and the bulk of her body is smeared with it.");
		//Huge cum addendum
		if(pc.cumQ() >= 1500) {
			output("\n\nThat's just the start of it, you shoot and shoot and shoot until the ground beneath your prize is a fragrant, sexual mud. Your [pc.cum] is rolling off her in slow-flowing waterfalls before puddling on the mix, leaving the zil-girl in a ");
			if(pc.cumQ() <= 5000) output("small puddle");
			else if(pc.cumQ() <= 10000) output("body-sized puddle");
			else if(pc.cumQ() <= 20000) output("puddle deep enough for her to sink half-way into");
			else if(pc.cumQ() <= 30000) output("puddle deep enough to hide everything but her face and the tops of her breasts");
			else output("puddle deep enough to nearly drown her");
			output(".");
			if(pc.cumQ() >= 50000) output(" You keep going, eventually creating a small river of juices that drains through the jungle, flowing off towards who-knows where.");
		}
		//Else
		else output("\n\nThe succussive shots take their toll, each one smaller than the one proceeding it but still easily capable of giving the zil-girl a thorough [pc.cumNoun]-treatment.");
		output(" Sputtering, swallowing, and moaning, the pretty little thing does her best to come down from her climactic bliss, rolling her hips languidly beneath your slow-shrinking staff as she clears her mouth and nose. Her voice is dazed and muted when she speaks, barely audible at first but growing in intensity with every word. <i>\"That was wonderful. I've never... never had a male take me so. You are, without a doubt, the most wonderfully virile creature I've ever met. Perhaps I'll have a queen from this.\"</i>  She wipes the cum from her eyes. <i>\"Maybe I'll even manage to to beat you next time. I could do so much to this cock if I had you at my mercy...\"</i>");
	}
	//Omni-end
	output("\n\nYou reluctantly separate yourself from your prize and prepare yourself to resume your journeys. She just lays there a while, breathing heavy with her eyes drifting closed toward a much-needed nap.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	genericVictory();
}