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

/*Get Honey
You ask the zil girl if she wouldn't mind giving you a vial of her sweet honey for the road. She gives you a lusty smile and pulls an empty glass container from her belt. "Sure, stranger... but you'll have to work for it," she laughs, pushing aside the chitin plating on her chest to reveal the two full swells of her bosom. You shift around behind her, slipping your [legs] about her waist as your fingers play across her chitin-covered sides and slide across the smooth, hard surface of her natural arm. Her breath catches as you brush across the bare flesh of her bust and the curve of her prominent, honey-filled nipples. 

She gasps and squirms in your grasp as your hands set to work, cupping and caressing her, working your thumb and forefinger around her teats until the first thick dollop of honey forms. With a smile, the zil girl takes your hand just long enough to suckle your fingers, eagerly sampling her own lactation. Next, her hand releases yours, snaking down her lithe body to tease her other honeypot as your fingers lock around her teats, squeezing out more and thicker drops of honey. The first trickles run down her bare chest, staining her black chitin amber until she moves the empty vial under one of her spigotting tits, catching the flow at the source. 

The viscous, clear amber moves slowly, oozing down your fingers and the zil’s body like syrup. It slides into the vial, slowly piling up as its holder shivers and moans, twitching at the pleasure of your contact. Before long your ministrations have her panting and moaning like a whore, chest heaving in her hands as you fill the vial under one tit and then the other, squeezing her honey taps until their owner is like putty in your hands, shivering with sexual pleasure as you milk her and she fingers herself. 

"H-hey stranger, you've got really... really talented fingers, you know? Keep this up and I'll... I'll.... I'll...." she trails off into a long "Ooooohhhh," as you let one of your hands slip down, joining her fingers between her legs as the other massages her breast, topping off your prize. Her honeypot is slick with her sexual juices and offers no resistance as you slip into its warmth, brushing and teasing her own fingers before joining them in their work, exploring her depths. "Gonna... gonna c-c-ahhhh!" she cries, as her vaginal muscles clench down hard, squeezing and milking the fingers inside like miniature cocks. A whole new wave of thick honey squirts from her quivering cunt as the zil girl climaxes around the two hands penetrating her; a moment later and her teats join in the fun with a last mighty burst of honey that sails off into the clearing, overshooting the vial with the force of a fire hose. 

You cork the vial and tuck it away as the throughly milked zil collapses in your arms, breathing hard. You run your honey-slick hands through the soft, hair-like spines on her head, teasing her a little as you get ready to go.

{If Gendered PC: "H-hey now," she manages to say, "I'd feel bad if I got to cum that hard and you didn't even get a thrill. At least let me [give your honeypot some love // give your cock a little attention] before you go."}
[Nah]
{Sex Options]

Nah
"Aww. Well, alright then, take care. Thanks for the fun!" she laughs, slipping out of your arms to curl up on the forest floor, asleep before you leave. 

<i>Talented fingers indeed!</i> you think as you move on.

SEX OPTIONS

For Dickmeisters:
[SuckleFuck] (Anal ride while you suck honeytits)
[Missionary] FOR THE SOLE PURPOSE OF PROCREATION! YOU SICK BASTARD!
[Footjob]

For Cuntwielders
[SixtyNine]
[Trib&Suck]


SuckleFuck
// zillette goes for a buttsex ride while PC suckles some honey from her tits.

Pulling your [armor] off, you plant yourself on the log beside the welcoming zil girl and stroke your wang, beckoning her onto your lap. She gives you a lascivious grin and does as you bid, moving on all fours; she wraps her arms around your neck and her legs around your waist, grinding her cunt along the shaft of your hardening cock. You gasp as the warm, sticky honey of her loins rubs off onto your bare manhood, leaving a slimy trail as she rocks her hips along your length. Instantly, you're assaulted with the powerful, potent scent of her pheromones, wafting up from her juicy sex. Your skin blushes hotly, tingling at her every touch as the wasp-like girl's hands run through your hair, down across your back, pulling herself close to you. You run your fingers through her soft, hair-like spines, leaning her head back just enough for you to kiss along the nape of her neck. To her delight, your other hand slips down and grabs her chitiny ass, squeezing the flexible plates of her posterior, and she lets out a stifled cry as one of your fingers ventures down into the cleft of her backside, teasing along her sensitive black hole. 

Before you plunge in, though, your hand slips along her hips to the meeting of your [cock] and her juicy honeypot. You plunge in, making the zil girl throw her head back in pleasure as your fingers delve her depths, swirling through her sweet honey-like juices. "Oooh, dirty {boy/girl}. Yeah, get me lubed up with my own honey. Just like that," she moans, guiding your hand from her sodden box back to her eager ass. Now slathered in slick amber, you press a finger hard against her dark star and grin wide as it slides inexorably inwards, her tight little ass unable to push back against your honeyslick digit. Her mouth curls out in a silent ring of pleasure as your finger slides in to the last knuckle, utterly buried in her ass. Another slips in to join the first before you start to move them, and by the time they're out to the tips your lover is wracked by short gasps of insatiable pleasure, trembling from sexual anticipation. 

Her hips grind harder, humping on your fingers buried up her butt and dragging her slick cunny across the shaft of your [cock], slathering you up with her sticky juices and sending shivers of pleasure all throughout your body. With a mischievous grin, the zil girl takes your honey-covered wang in her smooth, chitin-clad fingers and starts to pump. Her alien fingers feel like cool marble on your manhood, gently stroking her honey into every nook and crevice of your cock, slathering it with a nice, even coating of her cunt-juices until it shines in the sunlight. Her thumb moves up to your [head], spreading an extra layer of honey around your brim to ease the initial penetration. While she does so, you shift your hips, leaning back for the zil girl as she picks herself up and aligns her tight little pucker with your [cock]. She comes to a complete stop just as your head kisses her black hole, stopping to savor the feeling of your cock pressing into her honey-filled behind. You join her, reveling in the unmatched tightness squeezing down on your tip, slowly rocking your hips into her as she begins to slide down, inch by inch taking your prick. You lock your hands into the full cheeks of her ass, guiding her down with tender, agonizing slowness until she bottoms out, cheeks resting on your [legs]. 

Her breath is ragged and heavy by the time the zil's taken everything you have. With arms still locked around your neck, she pulls herself into a long, deep kiss with you. Your lips part, admitting a long, thick yellow tongue which searches into your maw, playing across your teeth and throat.

And it is very, very long. You stifle a gasp as the girl's nectar-sucking tongue plays across your own before slithering down into your throat, more like a tentacle than a tongue. You try not to gag as the giggling zil girl forces you to deepthroat her lengthy tongue. She keeps it up only for a moment, though before withdrawing again, still grinning. Instead, now, she pushes back the chitin shell over her chest, revealing the swells of her full breasts, each so aroused by the anal penetration that they've begun to trickle honey; amber lines trace down her tits, one of which her huge tongue promptly laps up before retracting. The other, it seems, is for you. You return her smile and set to work, your [tongue] stretching out to lick along the underside of her breast, causing her bare yellow flesh to quiver at your touch. 

Finally, you lips close in on her coal-colored, honeyed teat, and even the first, gentle suckle draws out a steady stream of her amber lactation. You bring a hand to bear, squeezing at the base of her tit and drawing out another thick gush of sweetness that threatens to bulge your cheeks. Soon, you're swallowing every few seconds as you suckle from your lover, lapping up every drop of her nectar. At a look from you, the zil girl starts to move her hips again, gently circling your lap to draw the barest length of your prick from her slick behind. You groan as the sensation grows, her pace quickening until she's bouncing on your cock, flesh slapping wetly as her honeypot squirts juices and secretes more and more of its sweet scents; in minutes you're positively swooning with pleasure, nearly overwhelming by taste, touch, and smell combined from the waspy beauty. 

Your fingers trace down her smooth, dark body caressing the zil girl's hips and thighs before settling into the honeypot itself, finding the pert yellow bud of her clitoris on full display. Your thumb circles it, drawing a shrill cry from your lover even as your other digits plunge into her cavernous cunt, stretching her cock-craving walls wide. She clamps down on you, muscles massaging you half by instinctual need for an injection of your seed; your breeding stick, however, is busily buried in her behind, being squeezed and caressed by her spasming sphincter as the zil girl bounces on your lap, crying her pleasure as your triple attack brings her closer to the edge with every passing second. Before you know it, she lets out an ear-piercing scream, and suddenly your mouth is flooding with a powerful rush of honey, her suddenly squirting honeypot nearly overwhelming your senses; but it's her ass, clinging so hard to your cock you think you'll pop, that finally sends you over the edge after her. You grab her hips and hold her tight to your chest as your [cock] bursts in her butt, filling her with spurt after spurt of your steaming spunk.

By the time you're done, both of you are sodden messes: the zil's backside is smeared with thick, frothy ropes of your cum, pouring out of the breach as your cock withdraws from inside her; opposite that, her cunny squirted something fierce during her orgasm, and you're utterly drenched with her slick fluids, surrounding you in the heady odor of her sex pheromones. 

"You're... that was... wow," the zil girl breathes, chest heaving as she tries to catch her breath. "Thanks for the pounding, stranger."

{if Asshole PC: "You wipe your cum-slick prick off on the zil girl's chitiny thigh before collecting your [armor], trying to brush some of the thick patches of sex-juice off of yourself" else if Snarky, "Thanks for the cock cleaning, sweetheart," you say, ruffling her spiky hair" else if Nice "You cup the wasp girl cheek and give her a quick kiss before grabbing your [armor]"}. "See you around, stranger," she calls after you as you leave before rolls over in the puddle of sex you've left for a quick nap.

Missionary
With the wasp girl's legs nice and spread for you, it isn't long before you smell the wafting cloud of her sexual scent. Immediately, your [cock] stiffens in your [armor], tenting visibly. The zil coos at you, licking her lips and giving you a "come hither" look. You step toward her, shedding your [armor]; with a pleased sigh, the zil girl leans back and spread 'em wide, giving you a good long look at the black lips of her vulva and the dark star of her ass as her fingers dip into her honeypot, caressing the mouth as you undress. Finally free of your clothes, you move forward, grabbing your cock in one hand, the girl's cheek in the other. You pull her into a quick kiss, tasting her sweet lips before she wraps your [cock] in her marble-smooth black fingers, stroking you gently as you push her down. 

She moans into your mouth as you rest her back on the ground, hands moving down to explore and caress her body. You cup her breasts, pushing aside the chitin shell to expose the pale yellow mounds. A little trickle of honey spills from her prominent teats and you lap it up, never breaking eye contact with the trembling girl as your tongue moves down, lapping at her lactic source as your hands slip down to her wide hips, fingers digging into her plated behind. You kiss her again, this time gently biting and pulling her lip, teasing her until her lengthy  tongue comes out to play, flicking across your own lips and nose. You enjoy her touch for a few long, happy moments before pulling back, shifting up her body until you're straddling her chest. Your fingers brush through her golden spines, shifting her head up to the cock presented to her. 

At your urging, the zil girl opens her mouth wide, letting you slide your prick right in to the hilt{if big cock, "watching as her throat bulges with your massive length; she gags a moment as you stuff her mouth full of cock before finally catching her breath, her throat contracting hard around your invading shaft"}.As you move your hips into her face, you gasp with sudden pleasure as the wasp girl's long, prehensile tongue slips around your shaft, wrapping you up like a snake before it starts to undulate, writhing and squirming around your [cock]. Given over to alien pleasures, your fingers run encouragingly across her carapaced body, urging her tongue job on. Soaked in her sweet saliva, you're soon able to gently rock your hips, using her constricting tongue like a sex toy, fucking her face with increasing abandon. {If Mean: "You grab her cheeks, holding her head steady as you start to pound her face; spit flies everywhere in a matter of moments as you hump the zil girl's eager mouth, ignoring her cries and moans, obsessed with your own pleasure" else "Your face fucking lasts until you reach toward your own edge, steadily humping away at the alien's face until she's gagging again while pre flows freely down her throat"}. Finally, unable to continue, you pull out of her mouth, still connected to her gaping lips by strands of spit and frothy strings of your own pre; she wipes her mouth and pulls you down, kissing you hard until you can taste yourself on her tongue as it flicks across your puckered lips. You move back down her body, now wholly ready for the coming storm of sex; the zil's own fingers dig into your shoulders, pulling you ever down onto her, her legs locking behind your [butt] to draw you into her. 

Breathing deep of her sexual scent, your [cock] hardens to diamond strength as the [head] brushes the zil girl's eager cunt, tasting of the free-flowing honey within. She looks up at you pleadingly, pitch-black eyes searching yours as your prick hovers over her entrance. Gently, ever so slowly, you give her what she wants: your hips ease in, pushing the first inch of cockflesh into her, watching as her mouth locks open in a silent "O" of pleasure as she's spread apart on your prick. You dive into her vulnerable mouth, pressing your lips firmly to hers and letting your tongue play across her limp muscle, flicking across the tiny nectar hole in its tip until she winces with pleased surprise. 

Now that's she's utterly speared on your [cock], you start to move, picking up at a fast tempo of fucking that has her crying and moaning in seconds, digging her fingers into you, urging you on with whispered promises of pleasures and half-crazed pleas of love for you and your magnificent member. You hold her tight, hugging the oversexed wasp's yeah against your [chest] as your cock rams into her with force enough to send her sweet honey all over the glade, her voice echoing throughout the jungle. 

Your climax is inevitable, surging onwards into the waiting womb of the screaming wasp girl. With a last, furious pounding, your cum blasts into her sodden box, smearing her warm, writhing walls white with seed. You hold onto her, humping away furiously as your [cock] blows load after load of salty cream into her, filling her until spurts of seed leak out around your pistoning prick. A few final thrusts leaves you done, both you and the zil girl panting heavily as the last drops of seed leak out of your [cock]. 

"Damn, stranger," the wasp gasps, her breath hot and heavy on your sweat-slick skin. "Do you just go around breeding every girl you meet like that? Wow..."

{If Asshole: "You scoff, saying she ought to be ecstatic if she's full of your get. A breeder like you comes around once in a lifetime" else if Snarky: "You chuckle, saying that maybe you do, maybe you don't; and maybe she'll get to find out one day" else if Nice: "You shake your head, saying that you're not the kind of {guy/gal} to breed with just anyone"}. 

The zil girl sighs and leans back, patting her belly full of seed as you collect your [armor]. "Don't be a stranger, stranger," she laughs, blowing you a kiss as you leave.

Footjob
You toss your [armor] aside, letting your [cock] hang free between your [legs]; the wasp girl's eyes are drawn instantly to the hardening member, and licking her lips, she asks "So how do you want me to say hi to your friend there, stranger? Wanna ram it into my honey cunt, or maybe give my ass a reaming...?"

{If Asshole: "Not likely. Get off your ass and put those feet to use," // if Snarky, "Maybe next time, but for now... how about putting those feet to use?" // if Nice: "Some other time. For now, though, I'd love it if you could use your feet..."} 

"Well, if you insist, stranger. I'm not picky," the zil says, strutting toward you as you toss your clothes aside. "But first, why don't you get some honey to lube yourself up with? The best foot's a slick foot, after all."

You nod and slip down as the zil girl spreads her legs, putting your face right into the potent sex aura coming off of her fragrant flower. Your [mutiCock] throb{s} with sudden need as your {skin} flushes hotly, lust burning through you with fiery power. It takes a force of will not to push the zil girl over and breed her then and there, but you know what you're here for: those black, boot-like chitiny legs, and their smooth-as-latex feet. You take hold of her thighs, caressing her honeypot's lips with your thumbs as you inhale a lungful of lusty pheromone let loose by her parting lips. You dig in as soon as you've adjusted to the heady odor, [tongue] slithering across her drooling cunt, sucking up the honey-sweet juices that soon flow to your deft touches and caresses. With ready hands, you scoop up the sweet nectar as it drips from the zil girl's quivering quim and liberally apply it to your waiting wang, slathering up with honey lubricant until your [cock]'s glistening in the sun. 

Satisfied with your efforts, the zil girl gives you a rough push onto your back, leaving your prick standing at attention, stiff as a flag pole as your mate looms over you, a lascivious grin spreading across her insectile face. Teasingly, she touches her toe to the [head] of your cock, rubbing the smooth black digit across your well lubed brim, eliciting a sharp gasp of pleasure from you. You grit your teeth as the sultry wasp girl circles your [head], cooing to herself as your [cock] twitches, begging for a good fucking; desperate trickles of pre leak down from your head before you can blink, the creamy seed swirling in the amber glaze on your shaft. 

Gently, the zil pushes forward, pressing your dick down onto your belly {if big tits and cock: ", right between your tits"}. Her heel's on you immediately, {if balls, "pressing down uncomfortably hard on your package and"} slowly rubbing along your sensitive underside until a thick, hot lake of pre bubbles out from your cumslit, pooling {on your belly // on your [chest] // on your face}. Your entire body trembles as the smooth, sheet sole of the zil's alien foot slides down your shaft; your breath catches as she grinds her heel on your glans, smearing her toes with your flood of pre. 

"You're awful cute when you squirm, stranger," the zil giggles, locking your [head] between two of her toes. "Now let's see your face when you blow a load all over yourself."

Her dexterous toes start to jerk you off, leaving her heel to rub and grind along your shaft, ushering your orgasm up through the thick, throbbing vein. Your fingers dig into the soft dirt, teeth gritting as the waspy woman foot fucks your [cock], vigorously fondling and fingering herself as you come closer and closer to your breaking point. You determine to hold out just a little bit long, to make her work to see you smear yourself in seed, and soon the clearing resounds with your sex-addled groans and cries, desperate moans of pleasure as your prick pulsates with mounting need, leaking more and more watery pre until your [skin] around the tip is stained milk white. But before you let loose, you can see the furrowed brow of effort on the zil's face, making her work ever harder to bring you past the point of no return. 

Your orgasm tears through you like an earthquake, leaving your whole body spasming with orgiastic pleasure as your [cock] thrums under the eager wasp slut's heel, bursting with a creamy squirt that smears your [skin] and utterly coats the zil's honey-glazed foot. She cries out in surprise as your steaming cum smears across her chitin skin, though you can barely hear her over the roar of pleasure screaming past your lips as your cock finally attains release. By the time your member's twitched out the last of its sweet cream, you're barely conscious, utterly sexually exhausted. You lay back for a few long minutes, trying to catch your breath -- though the zil girl doesn't make it easy, still teasing your [cock] with her semen-smeared toes. 

Finally, you manage to roll out from under her and grab your [armor], starting to redress. You don't get very far, however, before your lover hops over you again, brushing a slimy digit across your cheek. "Where do you think you're going? You wouldn't leave a girl all messy, would you?"

Not Likely
{if Asshole: "You bat her filthy foot away" if Snarky "Chuckling, you brush her foot away" if Nice "Politely declining, you lift her foot away"} and get to your [feet], wiping the seed off your cheek. The zil gives you a pouting face as you redress, but still admits "Well, it was fun while it lasted, stranger. See you around." 

You nod and head out, leaving the poor zil girl to clean your mess up.

Lick Clean
(+Lust)
With the zil's toes so close, you can fully smell the potent aroma of sex spread across her black chitin, and the irresistible lure of her desire wafting from her honeypot as she fingers herself, letting her pheromones waft down to you. Beset by a mire of scents, your spent prick twitches back to life, but the zil pointedly draws back your attention to her black, shimmering digits. Her big toe flicks across your lips, leaving the dual tastes of her sweet honey and your own creamy seed; your tongue reacts to the taste, darting out the lap across her smooth, hard skin, tasting deeply of yourself mixed into the coating of her own juices you spread before. 

The chitiny beauty breathes a gasp of pleasure as your lips suckle her toe, tongue bathing it, washing it clean of cum and honey until it shines. You look up at the zil girl, searching in her midnight-black eyes, watching the rise and fall of her bare bosom, her even, excited breath as you lick her clean, swallowing every sweet-salty drop you came on her. "Oooh, what a good {boy/girl}; your face was so cute when you gave me your seed, but now... mmm, I could get used to seeing you like this," she coos, digging her fingers deep into her sodden gash, showering you with trickles of potent honey that leave your mind in a haze of lust. 

Your [tongue] plays across her smooth chitin, delving between her toes, lavishing its attention across every inch. Soon, her sole and toes shine, licked cleaner than they ever were before. You let out a satisfied moan, letting an excess of your own cum and her honey trickle down your chin... but just as soon as you've finished, the zil girl's mouth is pressed to yours, her prehensile tongue lapping up the juices still at hand. She pushes you down, back pressed into the earth by her knees, pinning you down while her quivering box is left hanging intoxicatingly close to your nose, her bright yellow clit nearly poking into your nose. "All finished? Then I've got something else for you to lick clean!" she says, running her fingers through your hair, gently guiding your head up to her eager hole. Your gentlest touch sends shivers up her spine, but she urges you onward with lusty moans and coos, pressing your face into her quim until her juices smear across your face, making your gasp for air as her potent sex-aura nearly overwhelms you. Behind her, your spent [cock] juts to attention, and she's quick to lean back and grab it, reaching under your clothes to lock her smooth fingers around it, pumping it to the beat of your tonguing. 

Spurred on by a resurgence of lust, you dive into her with abandon. Your tongue searches into her quivering depths, thrusting in between desperately contracting walls that milk and squeeze your muscle like a cock, trying to draw out a load of spunk to fertilize the eggs deep inside her. Instead, your tongue probes her again and again, lapping up the sweet juices that wash down in waves toward your waiting mouth, eagerly lubricating your oral invasion as the zil's breath becomes ever more ragged. Slowly, you start to catch up to her, reveling in her tender attentions on your cock as she jerks you off, wringing your wang until a new stream of pre stains your clothes. Your breath catches as her thumb circles your cum slit, pressing down hard until you roll your head back and groan, able to feel the thick wad of pre bubbling up as she caps your shaft. 

"It's my turn to cum," the zil laughs, mashing her muff back into your face, taking your nose halfway into herself before you can right yourself and set to work, furiously licking along her gash before your cock threatens to boil over into her waiting hand. And your work pays off in spades, as soon her dark slit is squeezing hard on your writhing [tongue], dousing it in orgasmic honey as she digs her fingers into you, humping your face with wild, desperate need as her voice echoes to the heavens. She grinds hard on you, taking your tongue deep into her love canal as she cums, riding you even as her musky honey squirts powerfully onto your already doused face, drenching you in the wasp girl's potent aroma. 

With a final ecstatic squeal and a last gush of honey onto your face, the zil girl rolls off you, panting heavily as her entire body trembles with release. Wiping the fem cum from your cheeks, you take your first deep breath of fresh air in a good long while. Before you can even think of leaving, though, the waspy beauty gets your attention with a come-hither coo and a pair of wide-spread legs. "What do you say, stranger? You wouldn't leave a girl when she's all hot and ready to go again, would you?" Damn, she's fast... and smells so good....

No Can Do
You shake your head, saying you're too bushed to go again. "Aww," the zil girl groans, crossing her legs again. "But hey, you've got a hell of a tongue on you, stranger. You're welcome to put it to use on me any time," she adds with a wink. Chuckling, you finish dressing and head out, leaving her to quietly masturbate behind you.

Fuck Her
[Play Missionary scene]

Sixty Nine (Female)
You lick your lips as the wasp-like girl swirls her fingers around her dark slit, letting a potent, mind-numbingly sweet aroma pour over you; in a matter of moments, your mind is a haze of sex pheromones, urging you to throw yourself into the zil's arms, to revel in the pleasures of her flesh. Your hands work almost of their own accord, freeing you from the constraints of your [armor]; your [legs] carry you toward her as the last of your clothing falls aside, allowing the alien's black eyes to gaze upon your bare [cunt]. 

"Oh, you're just dripping already, aren't you?" the waspy beauty coos, slipping down between your [legs], cheek brushing your thigh. Your entire body trembles as her smooth, cool fingers brush across your bare, sensitive [skin], her long tongue slipping out and drawing its slitted tip across your flesh, leaving a slimey trail toward your slavering cunt. Just before she reaches your needy box, her fingers sink into your [butt], kneading the pliant flesh of your bare backside. You gasp and shiver as she nuzzles your thighs and caresses your ass, her long prehensile tongue slowly starting to circle your vulva. A needy, lust-filled groan escapes your lips, desperate for sexual contact; your [legs] quiver as her honey-sucking tip teases your [clit], sending sudden shocks of pleasure through you, nearly making your collapse into her arms. Seeing your desperate expression, the zil girl leans up and takes your hands in hers, easing you onto the ground with her. She moves between your [legs], putting them over her shoulders to give her a clear view of your dripping gash, slick and shimmering with your need. 

Licking her lips, the zil digs in{If Herm: ", grabbing your cock in one hand, pumping it eagerly as she moves it out of the way, revealing the main course"}. She plants a long, full-lipped kiss on your [cunt], looking up at you with near-perfect black eyes before her lips part, letting her tentacle-like tongue slip between your eager folds. You groan in pleasure, back arched as the long, slithering thing glides into you, spearing your clenching muscles apart as the zil feeds more and more of the yellow tongue into you, letting it wiggle and squirm like no human cock ever could. Your fingers run through her hair-like spines, urging her face deeper into your groin, urging her on with sensual moans and cute gasps of pleasure. Around her writhing mouth-cock, the alien girl grins up at you, making a high purring sound as you stroke her hair. {if Herm: "Her hand picks up the pace a little more in response, jacking your [cock] harder and harder until a thick glob of pre spurts out, leaving a creamy white smear on her skilled fingers."}

You let the girl service you for a few long, pleasant minutes, enjoying her well-practiced motions, the feeling of her agile tongue plunging into you again again again. {If Asshole PC: "Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she's straddling your[face], her potent muff almost spread across your nose. You cough and gasp as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. Figuring it's the only way to get her back to work, you let your [tongue] loose on her juicy, honey-like cunt." else if Sarcastic: "Eventually, though, the zil breaks off and, grinning down at you, flips herself over so that she's straddling her [face], her potent muff almost spread across your nose. "Well, if you insist," you chuckle, breathing deep of her sexual aroma until it's spreading a hot deeply pleasant warmth throughout your body. Urging her on with a sharp spank, you get to work reciprocating her oral ministrations" else if Nice: "Feeling like you shouldn't be the only one getting off here, though. You pull the zil girl up and, twirling a finger, get her to straddle your face, letting her lean back into your quim as her own cunt looms over you. You breathe deep as her sexual aroma fills your nostrils, spreading a hot, and not unpleasant warmth throughout your body. You let your [tongue] loose on her juicy, honey-like cunt"}. The zil gasps, arching her back as your [tongue] swirls around her juicy cunt, lapping at the bright yellow pleasure buzzer pointing outwards from her wine dark pussy. She wiggles her backside seductively, moaning into your [cunt] as you eat her out; you're soon pleasured in turn as the zil's long, squirming tongue slithers back into your [cunt], thrusting into your clenching depths until her face is coated in your squirting juices. {If Herm: "Her hand grasps your cock, stroking it just beside her face, occasionally letting her tongue slip from your cunt to tease and curl around the base of your rigid prick."} You give your lover a quick swat on the black-chitined ass, grinning as her cunt clamps down on your invading tongue, forming a tight little channel for you to thrust into. Your tongue comes back to you glazed with thick honey juice, unleashing an even more potent cloud of sexual pheromones to assault your senses and leave you in a lusty haze; almost on its own accord, your tongue redoubles its assault on the zil's sexy snatch, mouth-fucking her until she's squirming in your gasp with honey dripping freely onto your cheeks. You barely notice when she cums, screaming into your [cunt] as you lick and thrust unerringly onward, never missing a beat as she squirts her sweet juices into your face. 

Still crying aloud, the zil girl's tongue slams into you, ramming against your cervix until you're sure she's bound to penetrate your womb with her alien tongue. Your [legs] curl around her, entire body trembling as her tongue desperately delves your depths. Your orgasm follows hers by a few mere minutes, causing your to arch your back and scream your pleasure as her wondrous tongue brings you to an explosive orgasm that leaves her face drenches in your femcum{if Herm: " as your [multicock] explodes in her hand, raining spunk down onto her hair, turning the back of her head milky white"}. "Oh, wow. Explosive, stranger!" The zil laughs, rolling off you and wiping the cum from her face -- before lapping it up with her long tongue, still slick with your womanly lube. "But you've got a talented tongue, you know that... real talented," she sighs, flopping onto her back and idly fingering her dark slit with latex-black fingers. 

With your chest still heaving, you can only try to stagger to your feet and brush the wetness from your thighs and cheeks. As you grab your [armor], the zil girl slips up behind you, wrapping her dark arms around your [hips], chin nestling in your neck. "Come back real soon, stranger. It's awful hard to find a girl like you around here," she whispers, kissing along your neck. You breathe deep, skin trembling as the cum-soaked beauty caresses you; soon, she helps you get dressed and sends you on your way with a friendly wave and a kiss goodbye. 

Trib & Suck
As you stare at the zil girl's bare body, buxom and inviting, she gives you a lascivious grin and pushes aside the chitin plate over her chest, letting her fingers roam inside to pinch and squeeze a pert nipple until a clear amber trickle pours down. "Come on over for a taste, stranger. I promise I don't bite </i>too<i> hard." she says, nipping her lower lip as she thrusts out her chest. You feel a rush of heat under your skin, your breath quickening as you drink in her luscious scent and curvaceous body. With a come hither look, the zil slips down onto her back, cupping her perky, honey-laden teats for you, each beading with sweet nectar as you approach, tossing aside your [armor] to bare your own [cunt]{, [cock],} and [chest] to the cool breeze. Your [nipples] stiffen as you straddle the waspy maiden, looking down into her clear black eyes as she grins up at you invitingly.

"Why don't you take a little taste, hm?" she buzzes, thrusting her chest again. You silence her with a quick kiss, tasting the sweet gloss on her black lips as you slide down her body, running your hands across her latex-smooth chitin until you take her two breasts in hand, cupping the soft mounds and massaging their prominent peaks. She gasps as your fingers close around her dark peaks, pinching them roughly until your fingers are completely sticky with her alien milk. Grinning, you break one kiss to start another, wrapping your lips around her teat and rolling it between your teeth, making the poor girl's breath catch in anxious anticipation. Looking up into her featureless eyes, you take your first deep suckle, mouth burning as her unnaturally sweet honey flows over the tip of your tongue, trickling like syrup into your hungry throat. Greedily, your hands massage her buxom flesh, kneading out a stronger and stronger flow of the languid substance for you to suckle; your ministrations quickly have the zil girl arching her back and moaning, her hands running through your [hair]. 

She seems to be enjoying you, if only evidenced by her shrill cries and moans and writhing motions. You giggle around her teat, flicking your tongue across the over-sensitive flesh before moving ever so slightly between your lover's spread legs. She shouldn't be the only one to get a little pleasure out of this, even if you are enjoying the sugary meal. Moving your [legs] overtop her, you rock your [hips] forward, dragging your aching vulva across the zil's smooth skin. You groan contentedly as her latexy chitin rubs across your [clit], sending dull tremors of pleasure through your lusty [skin]. Your mouth continues to suckle from her eager tit as you hump at the zil's abdomen, frotting against her until with a sharp gasp of pleasure the waspy girl's tit seems to surge in your mouth, pouring out a sudden, thick load of amber cream. 

Her finger suddenly tighten in your hair, urging you off her breast until she can reposition under you, leaning her flared hips up to your thighs, her bright yellow pleasure buzzer sliding across your own -- you both gasp in ecstasy, your arms wrapping around each other as your cunts rub together. "Mmm, don't stop," the zil moans, pushing your head toward her other needy tit; she sighs contentedly as you start to suckle, running a hand through your hair as the other grabs your [butt], smooth fingers caressing your supple flesh and teasing your [asshole]. Your muscles clench as your alien lover's fingers circle your clenched pucker, backing off ever so slightly whenever her cunny presses back against your own slit, only to venture forth when she lets up again, making sure you never have a moment's respite.

Suddenly, your eyes widen as her long, smooth digit pushes right into your [asshole]. You gasp silently, honey drooling from your lips as one, then two of the zil's fingers delve your backside, swirling around inside your puckered hole. "Don't you dare hold back now, stranger. Cum for me," the zil whispers, spearing you hard on her fingers as her hips buck hard into yours. Your grit your teeth, refusing to give in so easily. She'll have to work a little harder than that to get you to peak first. "Is that so? Well, let's see..." the zil girl chuckles as you feel a momentary jab in your thigh. 

You cast an alarmed glance over your shoulder, just in time to see the wasp-girl's stinger retract from your [leg], leaving a flushed red circle on your skin. You open your mouth to speak, but all that comes out is a low, husky moan. Your body flushes hotly, heart hammering in your chest, but all you really feel is your [cunt], slavering and twitching as your [clit] swells thicker and hotter, commanding your attention. Instinct takes over, your hands diving between your [legs] to tend to your fuck-box, fingers sliding into the quivering hole and going to work on their own accord. The waspy beauty beneath you giggles, licking her lips as you furiously masturbate, seeming to drink in the scent of sex and lust dripping off of you. 

"You almost smell like one of us, stranger," she laughs, stroking your cheek. "Here, let me help you."

You give a guttural moan as another set of fingers mingle in with your own, delving into the slit of your womanhood to play across the ever-sensitive walls, slick with lust and fervent need. {if PC has cock: "Her fingers brush along the underside of your [cock], wrapping it in her latexy grip and giving it a good few pumps. Thick drops of pre spurt out at her slightest touch, smearing onto the chitin of her belly."} "So veeery lusty. I guess a direct injection does more than just the whiff, huh? Poor thing, you must be just dying to cum."

Like a bitch on a leash, you cum on command: you grit your teeth and moan, burying your head between the soft, welcoming mounds of the alien's tits. Her arms quickly wrap around you, holding you down as her pelvis rushes up to meet you, grinding her engorged clit across your own burning bud. You cry out in overwhelming pleasure, your quim spasming out ropes of girlcum onto the wasp's thighs and slit until your groins look like they're coated in slimey webs, bridged together by trails of your feminine lust. 

{If PC has a cock: "Before you can hope to calm down, the zil girl's hips move up, bringing her knees down around your [hips] until they've pinned your cock between them. Your breath catches as she squeezes your prick between her smooth, chitinous plates. Gently, she starts to move her legs, massaging your engorged shaft of your [cock] until another thick stream of cum pours out onto her, pooling into her tiny little belly button. She giggles girlishly as your prick spasms in her grasp. "Aww, so much just going to waste. Maybe next time you'll fuck me proper, stranger. Girl needs a little baby batter in her cunny every now and then."}

Chest heaving, your body shivers with unnatural lust as the zil's venom courses through your veins. "Well, that was a hell of a thing, stranger," the zil girl laughs, trying to roll you off her. "Glad you enjoyed yourself."

"Oh, no," you growl, grabbing her arms, pinning them beside her. "I'm not done with you yet."

The waspy beauty gulps loudly as you start to thrust your hips across hers. Her breath catches as your [clit] grind against hers, and the look of fear and lust in her eyes can only drive you on.

<b>Two hours later...</b>

"N-no more!" the alien woman cries, fingers digging into your shoulders as her cunt explodes in a burst of feminine slime, smearing her juices all over your sore, aching thighs. Your own quim returns the favor, nearly sucking in her engorged bud like a miniature cock as your cum for the tenth... twentieth... the last time, you hope. 

Finally, you can breath easy. The haze of lust that clouded your brain for hours seems to lift, receding back into the dark, primal places of your mind. You slip off the poor, exhausted zil, finally seeming to be rid of her sex pheromones and nightmarish venom. 

"Oh wow," your lover breathes, putting a hand to her hammering heart. "You sure like that venom, huh sexy? I'll uh, just have to remember that next time. Not sure if you need more or less, though..."

You shoot her a glance, and are surprised to see her smile at you. "Just teasing, beautiful. You, uh, you just go on and get dressed. I don't think I can move my legs now..."*/