//Notes
//By Savin & William

//The Shock Hopper
//Futa Laquine in an all-rubber form-fitting body suit. It’s zipped down just enough to show off some cleavage and a massive bulge in the front. Very balls-heavy. The Shock Hopper is the Jumper’s 2IC, and is encountered on the bridge of the Sidewinder, guarding the LDC.

//She’s totally immune to Lightning, and has assloads of shields. Defeating her via physical attack should be quite the challenge! She carries a big two-handed lightning cannon, and when the PC encounters her, she fires it nonstop during the fight. So long as she’s armed and not stunned/prone, the PC takes a (significant) passive Lightning hit every turn. As her action, she makes physical lust attacks, throws techno-gizmos, and targets your junk with lightning. Basically, you have to endure on two fronts until you can stop one or the other.

//She’s very vulnerable to Lust damage. If you tease attack her to max Lust, she’ll blow a massive nut in her suit. Do it again and she’ll cause it to rupture, spraying spunk everywhere that nullifies the physical AoE.

//If the PC gets her bad-end, they’ll end up with a shockprod up the bum and smaller electrodes strapped all over, doomed to be her shockphilia slave for all time.

//She has a Bianca Beauchamp figure. Wears a dark orange bodysuit with really tight corset and built-in high heels. She has light blue fur with cream patches, and a bright pink mohawk.

//The LDC
//A black Laquine fuckboi with a *huge* dick. More twink than trap. He’s not at all physically imposing, setting aside his massive endowment. He’s technically the leader of the Jumpers now, because he fucked the Hopper into submission and keeps her (relatively) pacified with the power of hard dickings. He’s the definition of power-bottom.

//He doesn’t fight you, per se; when you defeat the Hopper he says “Well, I can’t beat that!” and surrenders the probe if you won’t rape his butt.

//You can then rape his butt and take the probe anyway.

//==========================================================================================
//					Flags!
//==========================================================================================
//	SHOCK_HOPPER_DEFEATED				-	Didja win?
//	JUMPER_LEADERSHIP_WINFUCKED			-	Did you fuck the jumpers after defeating them?
//	JUMPER_LEADERSHIP_LIKED_WINFUCK		-	Did they like what you did to them?
//	SHOCK_HOPPER_FUCKED					-	Track if you've done naughty with the Shock Hopper
//	LDC_FUCKED							-	Same for LDC
//	JUMPER_SLAVES_FREED					-	1 = freed, -1 = left in slavery.


public function shockHopperBustString(nude:Boolean = false):String
{
	return "SHOCK_HOPPER" + (nude ? "_NUDE":"");
}
public function LDCBustString():String
{
	return "LDC";
}
public function showShockHopper(nude:Boolean = false):void
{
	showName("SHOCK\nHOPPER");
	showBust(shockHopperBustString(nude));
}
public function showLDC():void
{
	showName("\nL.D.C.");
	showBust(LDCBustString());
}
public function showShockHopperAndLDC(hopperNude:Boolean = false):void
{
	showName("HOPPER\n& L.D.C.");
	showBust(shockHopperBustString(hopperNude),LDCBustString());
}
public function showLDCAndShockHopper(hopperNude:Boolean = false):void
{
	showName("L.D.C.\n& HOPPER");
	showBust(LDCBustString(),shockHopperBustString(hopperNude));
}


//Boss Fight: The Shock Hopper
//Play when entering the Captain’s quarters on the Sidewinder. Should not be able to access the Bridge or Hold before then; they’re locked behind the captain’s personal authorization codes.
public function shockHopperEncounter():Boolean
{
	if(flags["SHOCK_HOPPER_DEFEATED"] == undefined)
	{
		clearOutput();
		author("Savin");
		showLDCAndShockHopper();
		output("The captain’s quarters are unmistakable, set apart from those of the crew and close to the bridge. The hatch is ever-so-slightly ajar, propped open by an empty bottle of elasticizing lube, crushed between the frame and the sliding door. Inside, you hear a whole chorus of girlish laughter and soft moans. Must be a real party going on.");
		output("\n\nTime to crash it.");
		output("\n\nYou draw your [pc.weapon] and shoulder the hatch open, charging into a lavishly-adorned harem chamber. A huge heart-shaped bed dominates the far side, laden with nude slave-girls fawning all over a laquine boy lounging at the head - and getting head from a particularly buxom ausar woman who’s straining her mouth around almost two feet of turgid bunny-cock.");
		output("\n\nThe rabbit-boy starts forward, a scowl building across his coal-black fur. <i>“What’s the big idea?");
		//PC wearing slave uniform:
		if(pcHasSlaveOutfit()) output(" I didn’t order more skanks... did I?");
		//pcLapineEarOrJumperUniform:
		else if(pc.earType == GLOBAL.TYPE_LAPINE || pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty) output(" I didn’t call a meeting and I know I didn’t ask for one of you sweaty sluts.");
		//pcMouseEarsOrRatArmor:
		else if(pc.earType == GLOBAL.TYPE_MOUSE || pc.armor is RattyArmor) 
		{
			if(pc.earType == GLOBAL.TYPE_MOUSE) output(" Looks like one of his rodents");
			else output(" Dressed like one of those rats");
			output("... Bull, only your boss works alone.");
		}
		//pcSecOpWeaveArmor: 
		else if(pc.armor is AugmentWeaveArmor) output(" W-what are one of you technophiles doing here... Wait, you don’t have an antenna!");
		//pcViperSlutwear: 
		else if(pc.armor is StarViperSlutwear) output(" Oh crap, how did you- wait, you’re not a Viper, and only those snake bitches wear that.");
		else output(" I don’t remember giving anybody lookin’ like <b>you</b> the keys to the ship!");
		output(" So who the fuck are you?”</i>");
		output("\n\nAnother laquine, sitting on the edge of the bed, bounces to her feet. She’s dressed in an orange, skin-tight latex suit that bulges around large breasts and an even more impressive bulge in the crotch, clearly outlining a substantial pair of balls below her huge dicksheath. She yanks a large, two-pronged device off the wall and levels it at you.");
		//pcLapineEarOrJumperUniform: 
		if(pc.earType == GLOBAL.TYPE_LAPINE || pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty) output("\n\n<i>“[pc.HeShe] isn’t one of mine!”</i>");
		else output("\n\n<i>“An uninvited guest, babe,”</i>");
		output(" the woman growls. The weapon in her hand hums with a surge of power as the forks at the barrel crackle with electricity. <i>“Remember those reports of more fights breakin’ out?”</i>");
		output("\n\n<i>“Nah, too busy fuckin’,”</i> the black-furred boy laughs, pushing the ausar girl down his rod with a firm hand. <i>“Welp! You wandered into the wrong neighborhood, fucker. Take care of [pc.himHer], will ya, beautiful?”</i>");
		output("\n\nThe suited-up bun rolls her shoulders and grins. <i>“As long as I get to keep [pc.himHer] after!”</i>");
		output("\n\nYeah, you’ve got something to say about - oh fuck!");
		output("\n\nYou jump backwards as her lightning gun discharges, sending a solid beam of crackling electricity out that hits the metal deck and arcs across the floor. Every hair you have stands on end as a powerful charge surges through you. Ow ow ow!");
		processTime(3);
		var tEnemy:Creature = new ShockHopper();
		CombatManager.newGroundCombat();
		CombatManager.setHostileActors(tEnemy);	
		CombatManager.setFriendlyActors(pc);
		CombatManager.victoryScene(victoryOverShockyHoppy);
		CombatManager.lossScene(loseToShockHopper);
		CombatManager.displayLocation("SHOCK HOPPER");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
		return true;
	}
	else output("\n\nAfter your fight, the Jumper leadership cleared out.");
	return false;
}

//PC Loss: Shock Slave Bad End
// PC is beaten, fucked (if the hopper busted a nut in her suit), then trained as a shock-slave.
// Last scene is a mind-broken PC blowing LDC, all wired up to an electrostim device, and cumming buckets while the Hopper plows/reams them. PC gets cumflated.
// If Hopper is teased to max lust once or twice, she will fuck the PC in the first scene and zap them into subbiness. If this doesn’t happen, then she will interrogate them on the spot, hooking them up and zapping them.
// That unique sex will be the Hopper facesitting the PC.
// After the first scene, second scene is PC’s new life.
public function loseToShockHopper():void
{
	author("William");
	showShockHopperAndLDC(true);
	showName("\nDEFEAT");
	var bustedCount:Number = enemy.statusEffectv1("Busted");
	if(pc.HP() <= 1)
	{
		// PC HP loss (hopper didn’t bust)
		if(bustedCount == 0) output("In your weakened state you can’t hope to dodge the next wildly fired bolt of lightning. The charge bounces across the floor like a dodgeball your beaten body refuses to evade. Every hair lining your form stands and flexes with static shock. The ends of your body curl spasmodically and a pathetic gasp limps up your throat as you drop your arms and fall. Before you hit the ground the blue-furred jumper bounces forward to subdue you, planting her foot to your neck, pinning you to the deck, and deactivating her rifle all in one brisk and authoritative motion that has her sitting on your chest before you know it.");
		// PC HP loss (hopper busted once)
		else if(bustedCount == 1) output("Regardless of her cum-plumped disadvantage, the Hopper fires off one last well-aimed shot of lightning that you cannot evade. The hairs on your body shoot out with a debilitating static shock while the ends of your body curl in muscle-tightening pain. You can’t even gasp with that arc seizing your veins, only drop your arms and fall. The sloshy bunny is on you before total collapse, hooking your neck with her right footpaw and forcing you to the ground with her sat atop you. She unzips her suit with a carnal sigh, letting a tide of laquine-spunk spill out onto your defeated form and over her tremendous balls. An enthusiastic grin blossoms across her muzzle as she powers down her weapon.");
		// PC HP loss (hopper busted twice)
		else output("Sensing your lapse in concentration the Shock Hopper bounds forward, catching you off guard with a powerful snap kick to the chest. You can’t even stumble back before she reverses momentum and kicks you to the ground, footpaw landing squarely on the back your neck. Your weapons scatter across the floor when your chin strikes the spooge-tainted deck. She’s on you right away, turning you over and sitting herself and her oversized balls on your unmovable body. All you can manage in response is a weak exhalation and a tiny lurch in your fingertips.");
	}
	// PC LUST loss (hopper didn’t bust)
	else
	{
		if(bustedCount == 0)
		{
			output("Arousal cripples your limbs long before the Hopper’s preferred methods can. She and the black bunny throw back their heads and laugh when you fall. [pc.Face] reddened with debilitating lust, you frantically attempt to satisfy your needs, knowing full well that she intends to make good on ‘keeping you’. She slings her gun behind her back, walking forward to plant a footpaw on your neck. The flexible zap-rabbit pushes and pins you to the deck, smirking as her boner grows just a little bigger behind its latex confines.");
		}
		// PC LUST loss (hopper busted once)
		else if(bustedCount == 1)
		{
			output("You cry out. Not in pain, but in need. You collapse with a whine and whimper, weapons falling to the sides. The cum-sloshed bunny laughs triumphantly and mockingly. While your [pc.hands] busy themselves with your seething nethers, you are incapable of preventing the Hopper from shoving you to the deck and sitting herself atop you with childish glee. She yanks her zipper and arches out of her uniform, letting a tide of bunny-spunk spill out onto you over her vision-blocking testes. A knowing grin blossoms across her muzzle as she powers down her gun.");
		}
		// PC LUST loss (hopper busted twice)
		else output("The smell in the air, the sounds in the background, and the constant sway to and fro of the Hopper’s horsecock is too much. A deep heat settles inside, and it robs you of control. Your weapons fall from your [pc.hands] and you don’t even realize it. You barely notice yourself hitting the spunk-spattered floor. A heavy gasp presses out of your mouth when you see the top jumper looming over you, her enormous nads filling your vision. In a brisk motion the blue-bun grabs you by the shoulders and falls upon you, pinning you to the deck while those cum-matted nuts pool across your [pc.face].");
	}
	// Merge
	output("\n\n<i>“Nice work, babe!”</i> the black bunny claps. <i>“" + (bustedCount != 2 ? "You always know how to solve a problem!":"Guess we’ll need to find ‘ya a new suit, huh?") + "”</i> he laughs, though it drowns out when his victorious XO grabs you by ");
	if(pc.hasLongEars()) output("the ears");
	else if(pc.hasHair() && pc.hairLength > 2) output("the hair");
	else output("the head");
	if(pc.lust() >= pc.lustMax()) output(" and slaps your masturbatory hands aside");
	output(". <i>“Well beautiful, looks like you won yourself a ");
	var raceName:String = pc.race();
	if (pc.canineScore() + pc.vulpineScore() >= 5 || InCollection(pc.race(),"ausar","half-ausar")) output("pretty puppy");
	else if (pc.felineScore() >= 5 || InCollection(pc.race(),"kaithrit","half-kaithrit")) output("nice kitty");
	//pcGryvainOrScaled:
	else if(pc.hasScales() || pc.gryvainScore() >= 6) output("shiny prize");
	//pcLaquineRabbit:
	else if(pc.laquineScore() >= 5) output("new girl");
	//pcMouseRodenian:
	else if(pc.rodentScore() >= 4) output((pc.tallness < 6 ? "cute runt":"cute rat"));
	//pcLeithanOrHorse:
	else if(pc.isTaur() || pc.equineScore() >= 4) output("new pony");
	else if(pc.isNaga() || pc.isGoo()) output("something special");
	else output("fresh slut");
	output("! Give your audience a good show!”</i>");

	// PC is non-bipedal (this doesn’t apply to Goo!)
	if(pc.legCount != 2 && !pc.isGoo())
	{
		output("\n\n<i>“Toss me that FT syringe!”</i> the Hopper bellows, and seconds later she expertly catches a small case hucked through the air. You can’t react in time before she jabs you with its contents: a medipen. The slow, wet anguish in your body and the massive shift in balance and weight indicate that she just stuck you with some sort of transformative. She tosses the container and the injector away. When your senses return, and when she lets you look, <b>you find that your lower half has morphed into two plantigrade legs.</b>");
		pc.legCount = 2;
		pc.legType = GLOBAL.TYPE_HUMAN;
		pc.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
	}
	// merge
	output("\n\nYour blue-furred captor grinds her crotch into you, rubbing those massive" + (bustedCount == 0 ? ", latex-wrapped":"") + " spheres over your neck and jaw with aggressive rolls of her leaper’s hips. The roiling gurgle of seed inside is almost as fascinating her intoxicating aroma of cloudy musk forcing its way through your olfactory gates. Her thick " + (bustedCount > 0 ? "and lusty ":"") + "breath washes over your [pc.face], carrying with it all her possessive thoughts. ");
	if(pc.biggestTitSize() >= 1)
	{
		output("She slaps one of your tits");
		if(pc.isLactating()) output(", snerking when a gob of [pc.milkNoun] spurts out" + (!pc.isChestExposed() ? " into your [pc.chestCovers]":""));
		output(". ");
	}
	output("The salacious bunny-boss is merely playing with her new toy, seeing how it reacts when she does this or that.");
	output("\n\nWhen those bulky testes drag over your [pc.lipsChaste] again");
	if(pc.libido() < 33) output(" you can’t help but let out a happy little sigh that ripples across the fuzzy, cum-taut sack. It’s better than being zapped.");
	else if(pc.libido() < 66) output(" you plant a deep kiss on the left nut, letting out a low whine when the furry sack pulls away.");
	else output(" you give " + (bustedCount == 0 ? "it":"her pelt") + " a fat lick in return. You’re secretly thrilled when she stops to let you indulge her with a few more wanton acts of worship.");

	var collared:Boolean = pc.accessory is MaikesCollar;

	// Hopper didn’t bust
	if(bustedCount == 0)
	{
		output("\n\n<i>“Alright, " + (pc.tallness+10 < enemy.tallness ? "little [pc.boyGirl]":"bitch") + ",”</i> she shakes her head, flinging sweat from her floppy ears, <i>“you’re ‘gonna tell me what I wanna know,”</i> she husks, yanking you to your shaky feet and dragging you over to an armless chair, slamming you into onto its ice-cold seat.");
		output("\n\n<i>“Aw, d’you gotta be so rough?”</i> the relaxed rabbit calls. <i>“I don’t wanna see [pc.himHer] crying or screaming...”</i>");
		output("\n\nThe azure jumper’s head snaps in his direction, admonishing eyes twitching" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? " while she strips you down to unpleasant nudity":"") + ". <i>“Whole operation gets thrown out of whack by one person, everyone’s gonna want answers. You wanna waddle over to the Viper’s nest and tell ‘em we fucked up?”</i>");
		output("\n\nHer heavy gaze falls on you; she grips you by the chin, <i>“<b>You</b> don’t have to worry about that though.”</i> She turns your head from side to side, making a gruff inspection. ");
		//pcWearingCollar:
		if(collared) output("Nose wrinkling in annoyance, the Hopper produces a sleek looking cutter and presses its slicing edge to your collar. <i>“Whoever you belonged to is gonna have to get used to never seeing you again,”</i> she says imperiously, tossing that tool aside as the fragments break apart on the floor. ");
		output("<i>“" + (!collared ? "For me,":"Because you,") + "”</i> she reaches behind her wide waist, <i>“" + (!collared ? "you’re gonna be doing <b>a lot more</b> than talking.":"now belong to me.") + "”</i> An ominous twinkle in her eye spurs you to break free. You grab her gloved wrist and try to shake her off, unaware of her lunging hand.");
		output("\n\nThe deafening mechanical snap below your [pc.ears] ends your struggle. A " + (collared ? "new ":"") + "collar closes around your neck strong enough to block blood, chucking adrenaline through your choked body. The tightness mercifully adjusts to the diameter of your throat a pneumatic hiss later, hugging the contours of your [pc.skinFurScales]");
		if(!pc.hasScales() && !pc.hasChitin()) output(" and overlaying you with its always noticeable presence");
		else output(", crunching right through your " + (pc.hasScales() ? "scales":"chitin") + " to make its presence an always noticeable part of you");
		output(".");
		output("\n\n<i>“That’s better.”</i> She runs a rubber-clad finger abreadth the jewelry marking you as property, tracing its diameter approvingly. <i>“This collar’s custom made, and I’ve only got one of ‘em. I don’t always need to use it, you know.”</i> She tries to pry a finger between your neck and its inner lining to no avail. It won’t budge an inch, and it tightens in retaliation. Smiling, the lawless laquine licks your cheek, breathily musing lips close to your [pc.ear], <i>“Think I’ll let ‘ya keep it. Collars look better on interlopers turned slaves.”</i>");
		output("\n\nThe domme-bunny squeakily seats herself in your lap, wrapping her powerful thighs around your waist, burying your [pc.face] into her cottony cleavage" + (pc.hasCock() ? "and your semi-erect [pc.cocksLight] into the mass of her sealed balls":"") + ". <i>“This thing’s perfect for keeping unruly bitches in line too,”</i> she says into your [pc.ear], <i>“My crew is proof of that.”</i> The heat of her tone brushes the back of your mind. <i>“Let me show you...”</i>");
		output("\n\nShe withdraws, persuading your gaze to a pen-shaped device on her belt lined with buttons. When her thumb hits the top button you hear a click and a low zap - you gasp and feel your entire body ignite in half a heartbeat. Muscles are seized; they’re pain-tightened by a white-hot jolt that runs through your nervous system like a circuit, paralyzing your every movement and halting your breathing until only the faintest, squeakiest whine squeezes out of your locked neck. It’s an endless feedback loop of agony that twists your body to its whims, breaking you apart and forcing out spit" + (pc.hasCock() ? " and pre":"") + ". Fear roils inside like your searing blood, every vein snapping and dilating. It’s not until she taps that button again do you regain some semblance of control... of being. Your head was already swimming from her ballstench, but now you feel-");
		output("\n\n<i>“Your pleasure, your life, everything you’ll ever feel,”</i> her voice booms inside despite its quietness; she flicks her eyes deftly, <i>“now begins,”</i> she glances casually to your ");
		if(pc.hasCock()) output("leaky [pc.cocksLight]");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("dripping [pc.vaginasNounSimple]");
		if(!pc.hasGenitals()) output("spreading [pc.thighs]");
		output(", <i>“and ends...”</i> a gloved paw cups your ");
		if(pc.hasCock()) output("girth");
		else if(pc.hasVagina()) output("vulva");
		else output("ass");
		output(", <i>“...with me.”</i>");
		output("\n\nThe energetic jumper’s hand strokes your " + (pc.hasHair() ? "[pc.hair]":"head") + ", fingers rubbing at your [pc.ears] firmly and almost affectionately. A well-meaning smile brightens her muzzle. It makes you shiver and groan into the fur of her comely breasts, panting for air. All you get is the potent scent of horny laquine. <i>“Fuck with me, and I’ll make you wish you were a tarratch mob’s latest haul,”</i> she says in a tone akin to a disciplining mother’s, <i>“understand?”</i> ");
		output("\n\nUnwilling to resist any further, knowing that at the flip of a switch she can subdue you - or worse - you murmur your assent.");
		output("\n\n<i>“You,”</i> she turns to a nearby harem-girl,”</i> bring me the RTZ, right there!”</i> she barks. Her roving hand descends to ");
		if(pc.hasCock()) output("your tensing boner");
		else if(pc.hasVagina()) output("[pc.oneClit] and [pc.pussyNoun]");
		else output("[pc.asshole]");
		output(", fingertips flicking gently across your ");
		if(pc.hasGenitals())
		{
			if(pc.hasVagina()) output("clitoral ");
			output("crown");
		}
		else output("pucker");
		output(". <i>“Give me a name.”</i> Her keen eyes pierce right through you. <i>“Then, give me a reason,”</i> she grins, words lilting sensually.");
		output("\n\n<i>“[pc.name],”</i> you answer in a lighter voice than intended. ");
		if(pc.isBimbo() || pc.isBro()) output("You distract yourself with the yummy looking bulge swelling to length in her crotch.");
		else output("You stare back, mustering up some kind of defiance in spite of your weak position.");
		output("\n\n<i>“[pc.name], [pc.name]...?”</i> she recitates in a long, brusque voice, <i>“...hmm, aren’t you forgetting something, slave?”</i> Her thumb hovers over the switch and you preemptively answer, compelled into submission.");
		output("\n\n<i>“S-Steele! [pc.name] Steele!”</i> you stammer, still not at terms with the methodically tuned agony from before.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she rings her index finger and thumb around your ");
		if(pc.hasCock()) output("[pc.cockHead]");
		else if(pc.hasVagina()) output("[pc.clit]");
		else output("anus");
		output(". The quiet sounds of oral sex on the bed mix with the " + (pc.legCount > 1 && pc.hasVagina() ? "light squelching between your [pc.legsNoun] and the ":"") + "creaking of the lead laquine’s emerging cock. <i>“You’re good at adapting. You’ll get used to your new name soon enough.”</i>");
		output("\n\nThe nude girl drops a heavy white box near you and scurries away. Wires spit out from almost every inch of it. The pastel bun disentangles and gathers those pigtailed cords and... electrodes? You shimmy in discomfort while she slaps several square patches to strategic locations across your body - right on top of every important nerve cluster from neck to leg.");
		output("\n\nYou are left unbound, but her warning lingers in your mind. The floppy-eared pirate’s got you right where she wants you, almost daring you to attempt escape or pick a fight. There’s a guilty pleasure that rises inside while she works.");
		if(pc.isHerm()) output(" What concerns you the most are a multitude of black cables drawn around and strapped your throbbing [pc.cocksLight], and a pair of tiny clamps pinned to the lips of your [pc.pussies]." + (pc.balls > 0 ? " An extra two patches are planted on the front and back of your [pc.sack], the Hopper stroking the underside affectionately.":""));
		else if(pc.hasVagina()) output(" What concerns you the most is a pair of cold, metal clamps spooled by blue cables set to the lips of your [pc.pussies], prying them open slightly.");
		else if(pc.hasCock()) output(" What concerns you the most is a thick corkscrew of black cables running around your throbbing [pc.cocksLight], set in place with a band as strong as a cock ring." + (pc.balls > 0 ? " An extra two patches are planted on the front and back of your [pc.sack], the Hopper stroking the underside affectionately.":""));
		output("\n\n<i>“I can only wonder what you’re thinking,”</i> she smirks, smacking a switch on the box with her foot. <i>“But if you’re thinking that I might be an amateur, you’re dead wrong.”</i> The current that flows through and flinches you is... it’s mildly paralyzing, but far less painful than the collar’s jolt. <i>“There’s no difference between you and my girls.”</i> She hits the switch again, though the first clap still echoes in your itching ear. <i>“Why are you here?”</i>");
		output("\n\nIt takes a while to realize she just asked you a question. <i>“I-I was looking for a probe...”</i> you say, eyes still locked to the collar controls. You’re shuddering a little warmly. <i>“I’m a Rusher-”</i>");
		output("\n\n<i>“Wrong answer,”</i> she toggles the collar for but a second, and it makes you squeak. <i>“A rusher doesn’t find their way to and through a pirate base, to this room, on dumb fucking luck.”</i> She foot-slaps the box again, and the more pleasant tingle smooths out the aches from before... and makes you wriggle from the overabundance of... niceness. You loose a small, blissful moan, struggling to cope with this dynamic, the need to cum rising inside slowly but surely. <i>“Try again.”</i>");
		output("\n\n<i>“I’m the " + pc.mf("son","daughter") + " of Victor Steele...”</i> Your loins feel tight, unpleasantly so" + (pc.balls > 1 ? "; heavy swelling centers around your [pc.balls], tightening them like a cranked spring dangerously close to snapping":"") + ". Your closeness to climax has been funneled down by the electric currents running in your body. <i>“I was looking for his probes to win the company...”</i> You fidget and writhe needily until, gradually, the nerve-melding tingle becomes a coat of satisfaction that leaves you feeling compliant more than ");
		if(pc.isHerm()) output("leaky and juicy");
		else if(pc.hasVagina()) output("juicy");
		else if(pc.hasCock()) output("leaky");
		else output("aroused");
		output(". You look up to see the Hopper smiling down at you both brows arched.");
		output("\n\n<i>“Interesting...”</i> Your heart kind of flutters when she brushes the long bangs of her hair, an automatic reaction to her satisfaction. <i>“I’ll buy that.”</i> You’re left feeling utterly hollow when she throws the switch again, like your arousal has been sucked out of your soul. <i>“I bet you’re feeling lost... maybe needy now, " + (pc.tallness + 10 < enemy.tallness ? "little ":"") + "[pc.boyGirl].”</i> You nod unthinkingly, a low ‘yes’ building in the back of your throat. You can’t stop yourself from mouthing the word, embarrassment exploding across your cheeks. <i>“You’ve done as you were told,”</i> she rolls her shoulders, <i>“you’ve earned a little reward I think. Something that shows you how I care for mine.”</i>");
		output("\n\nThe laquine lieutenant yanks hard on the clasp of her package-defining zipsuit, the parting of the teeth as loud as the kick to her stim-unit. <i>“One of the perks of being a slave is having nothing to worry about except pleasing your owner,”</i> she arches back, exhaling when her corset gives in to the weight of her heaving bosom curtained by blue and beige fur. <i>“You can let your mistress do the thinking now.”</i> Her pulsating horse-cock shoots skyward from behind the zipper, thickening when the sagging, pheromone-drenched testes flop out beneath it, dragging her into a more pleasing state of undress. <i>“My dick needs sucking,”</i> she peels off her gloves, curling her fingers around one jutting black nipple, <i>“and you’re about to learn why the Jumpers " + (silly ? "rule":"are on top") + ".”</i>");
		processTime(25);
		pc.lust(50);
		clearMenu();
		addButton(0,"Next",loseToJumpBossPart2Nonbust);
	}
	// Hopper busted once or twice
	else
	{
		output("\n\n<i>“Ahh, fuck... hrrmm...”</i> her rolling breath thickens until it’s as visible as her musk. <i>“Takes something special to get me to pop a boner </i>and<i> bust a nut in the middle of a fight, " + (pc.tallness + 10 < enemy.tallness ? "little ":"") + "[pc.boyGirl].”</i> A desirous groan flows over your [pc.face] again, a growl packed with furious libido." + (bustedCount == 2 ? " <i>“Twice no less. Gotta hand it to ‘ya, not just anyone makes me feel like that.”</i>":"") + " She grinds harder, wedging you deeper into her plush, fully-engorged sack, ensuring you inhale as much of her sloshing maleness as possible. <i>“Breathe it in real good, bitch, because that,”</i> she hums, smearing her tremendous scrotum over your head again, <i>“is the scent of your new owner.”</i>");
		output("\n\nOwner?");
		// pc Bimbo,Bro (add-on, no new PG)
		if(pc.isBimbo() || pc.isBro()) 
		{
			output(" That sounds... <i>fucking hot</i>. You lost after all, and she’s got you pinned. What could you possibly do besides let this incredibly horny laquine have some fun with your drooling face and ");
			if(pc.isHerm()) output("your herm-hood?");
			else if(pc.hasVagina()) output("your [pc.pussies]?");
			else output("[pc.cocksLight]?");
			output(" Her smell alone is moving all your parts, making you feel beautifully wet and usable!" + (!pc.isNude() ? " Thank goodness she’s getting your clothes out of the way, too!":""));
			output("\n\nHer delightfully creamy cum smells amazing, as does all the pent-up pre and sweat coating her fat, glistening balls. Three flavors of effluvium mingle wonderfully! You polish her pelt with lick after adoring lick, totally awed by their sheer size and the pheromones they produce. When your fingers work again it’s no surprise you hurry to knead that fuzzy, juddering pouch, giggling when your [pc.hands] vanish into vast, unending stretches of testicular flesh. You sniff again, captivated by her rich aroma, hoping you’ll get a few fresh loads in your belly before too long.");
			output("\n\n<i>“" + (collared ? "No surprise someone’s already got you claimed. Too bad they’re about to be down a good slut.":"Hard to believe an eager slut like you hasn’t been claimed yet. You’re just a gift that keeps on giving, huh?") + "”</i> She turns your head side to side, inspecting your " + (!collared ? "bare ":"") + "neck. You’re more distracted by that throbbing horse-cock between her legs than her furry hand " + (collared ? "noisily relieving you of your collar and ":"") + "reaching behind that bubbly waist. <i>“You and I are gonna have a quick chat,”</i> something lunges for your throat, <i>“but <b>you</b> are going to be doing a lot more than talking.”</i>");
		}
		// pc Kind,Misch,Hard (add-on, no new PG)
		else
		{
			output(" Stirred by her nefarious vocabulary, you find some strength to buck and squirm, desperate to slip away" + (!pc.isNude() ? " even as she nimbly relieves you of your clothes":"") + ". <i>“Uh-uh, slut.”</i> Firm paws grasp your shoulder as the Hopper bends forward, sliding down until her fur-curtained breasts smother your chin" + (pc.biggestTitSize() < 1 ? " and neck":", neck, and [pc.breasts]"));
			if(pc.hasCock()) output("; your [pc.cocksLight] strain against her juddering testes");
			output(". All of her weight on your body, you ");
			if(pc.isNice()) output("mewl softly");
			else if(pc.isMischievous()) output("grunt quietly");
			else output("growl");
			output(" into her gropable tits. Her black weapons grade nipples prod into your [pc.skinFurScalesNoun], hard enough to cut diamond. <i>“You don’t just wander onto <b>my</b> station,”</i> she strokes your cheek, <i>“<b>my</b> ship,”</i> your temple, <i>“and get off with a slap on the ass.”</i>");
			output("\n\n<i>Clench.</i> - a muscled thigh jabs between your legs.");
			output("\n\nShe slinks back, grabbing you by your obstinate chin, lifting and turning it side to side. <i>“" + (collared ? "Interesting, you must be special to someone, or on a tight leash. Guess they’ll have to get used to never seeing you again.":"The bare, vulnerable neck of a sexy trespasser. This must be what the Vipers love about their jobs.") + "”</i> You are helpless to stop her from " + (collared ? "slicing off your collar, tossing a fancy tool against the wall. She reaches":"reaching") + " around her bubbly waist, looking sweatier by the minute. <i>“Almost made myself cum thinking about that,”</i> she half husks, half whines. <i>“We’re gonna have ourselves a quick chat,”</i> she says, something lunging for your throat, <i>“and then <b>you</b>,”</i> she moans, <i>“are going to be doing a lot more than talking.”</i>");
		}
		// Merge
		output("\n\nA mechanical snap below your [pc.ears] " + (pc.isBimbo() || pc.isBro() ? "puts pause to your ball worship":"ends your futile struggle") + ". An ice cold collar with an unpleasant inner lining seals around your neck, blocking blood and choking your body. Adrenaline flows before it mercifully adjusts to your throat’s diameter, hugging the contours of your [pc.skinFurScales]. There’s a hiss when it settles into a permanent shape" + (pc.hasScales() || pc.hasChitin() ? " after crunching through your [pc.skinFurScalesNoun]":"") + ", making its presence permanent and undeniable.");
		output("\n\n<i>“Hmmh, much better.”</i> " + (pc.isBimbo() || pc.isBro() ? "Ecstasy":"Vacancy") + " dominates your eyes for a few moments as her furry finger strokes the jewelry marking you as property. <i>“That’s a custom made collar, only got one of ‘em. I use it to train new crew, and...”</i> she tries to wiggle a finger between your neck and the hoop, though it tightens up in response and won’t budge an inch, <i>“...to keep any stubborn sluts in line. It can do a lot more than that, too,”</i> she smiles, leaning down to lick your cheek, planting a few kisses around your [pc.lipsChaste]. <i>“I think I’ll let you keep it,”</i> she exhales over your nose, putting a kiss there too, vibrating from her building horniness. <i>“collars make trespassers turned slaves fucking <b>hot</b>!”</i>");
		output("\n\nThe rabbit-domme sits back, pulling you up by your shoulders and wrapping her powerful legs around your [pc.belly]. She smushes your head into the sinfully warm space between her pillowy breasts" + (pc.hasCock() ? " and invites your [pc.cocksLight] into the valley of her butt":"") + ". <i>“It’s only fair, I think,”</i> she whispers into your [pc.ear]. Her sultry tone scrapes the back of your mind, raising the temperature in your core, <i>“that you get to see what I can do too, babe.”</i>");
		output("\n\nYour bombshell conqueror shuffles away, flicking her bright eyes to a pen shaped device. At the flip of her switch your jaw locks, your muscles seize, and a low zap crackles faintly on the ends of your [pc.ears] - in the space of one heartbeat your entire body ignites. Your nervous system becomes the network at which a white-hot circuit runs, an endless feedback loop sets your teeth achatter. Lightning wracks your pathetically squeaking and spasming body in the arms of the azure jumper, breaking you apart and forcing out frothy spit" + (pc.hasCock() ? " and pre":"") + ". Fear roils like your searing blood. Veins snap and dilate. It’s not until she flips the switch again does that unfathomable agony abate and you feel like you’re back in your body. You feel-");
		output("\n\n<i>“Hey, c’mon, I don’t wanna see her crying or gettin’ hurt. You already beat [pc.himHer], hon!”</i> the black rabbit calls from the bed.");
		output("\n\nCream-splotched ears twitch. Her admonishing eyes glower at the bunny-boy on a giant bed, then open up when looking back to you. <i>“Don’t worry, that was the only time this was gonna be hard. You can hear me just fine,”</i> the Hopper says, and she’s right. Her voice booms despite its satiny volume. <i>“Everything you’ll ever feel from now on,”</i> she bumps a tit into your cheek, <i>“your pleasure, your life,”</i> she ");
		if(pc.hasCock()) output("wraps a hand around [pc.oneCock]");
		else if(pc.hasVagina()) output("pinches [pc.oneClit]");
		else output("glances to your rear");
		output(", <i>“now begins,”</i> ");
		if(pc.hasCock()) output("a stroke to your shaft");
		else if(pc.hasVagina()) output("a tweak to your button");
		else output("a caress on your [pc.skinFurScalesNoun]");
		output(", <i>“and ends...”</i> a rough grip, digits digging into tender nerves, <i>“...with me.”</i>");
		output("\n\nThe energized bunny’s hand strokes your ");
		if(pc.hasHair()) output("[pc.hair]");
		else output("head");
		output((pc.hasEmoteEars() ? ", dominant digits working on and around your [pc.ears]":"") + ". You’d do anything to feel more of this, and not more of whatever the hell that collar did to you, so you do all you can: moan, shiver, and moan some more into her fluffy breast, breathing in more lusty laquine. <i>“Fuck with me, and I’ll make you the breakroom cumdump for our workforce,”</i> she speaks in a disciplining tone with a hint of sexual aggravation, <i>“understand?”</i>");
		output("\n\nKnowing that at the flip of a switch she can do something like that to you - or worse - you nod, muttering your compliance.");
		output("\n\n<i>“You,”</i> she speaks around you, likely to a harem girl. <i>“Bring me the RTZ unit, right here. Now!”</i> she snarls, her greedy hands getting friskier");
		if(pc.hasGenitals())
		{
			output(", particularly around your " + (pc.hasCock() ? "[pc.cocksLight]":"[pc.clits]") + ", exploring your strangely distant " + (!pc.hasCock() ? "feminine ":"") + "erection" + (pc.totalCocks() > 1 || (!pc.hasCock() && pc.totalClits()) ? "s":""));
		}
		output(". <i>“Tell me your name.”</i> Her half-lidded eyes bore right through you. <i>“Then we’ll go from there,”</i> she grins, rubbing her crotch into your belly.");
		output("\n\n<i>“[pc.name],”</i> you answer, albeit meekly, " + (pc.isBimbo() || pc.isBro() ? "concerning yourself more with her swaying chest and achingly close horsecock, wishing she’d let the oozing tip do the talking":"trying to train your eyes in defiance of her lust and your simmering arousal, only to end up distracted by the imploring bob of her horse-cock") + ".");
		output("\n\n<i>“[pc.name]... [pc.name]..?”</i> she groans out in a sultry voice, a bounce in her cock slapping you on the chin. <i>“You’re forgetting something,”</i> she giggles close to your [pc.ear], brushing a hand over your [pc.chest] - her thumb is dangerously close to hitting that button again.");
		output("\n\n<i>“S-Steele! [pc.name] Steele!”</i> you stammer, compelled by a vested interest in avoiding that excruciating agony from before.");
		output("\n\nPlayful rabbit’s fingers curl around ");
		if(pc.hasCock()) output("your [pc.cockHead]");
		else if(pc.hasVagina()) output("your [pc.clits]");
		else output("a handful of your [pc.ass]");
		output(". <i>“Good bitch,”</i> she quips. The oral sex taking place on the bed is little diversion from the squirming of your legs and the squeaking of her undone suit while she rolls her body over yours. <i>“Hope you don’t take too long to get used to your new name, slave.”</i>");
		output("\n\nYou’re teased until a nude girl drops a heavy box nearby and scurries away. Wires criss cross out from its square shape, looking more cable than metal. The Hopper stands, leaving you curiously unattended, not even putting her foot on you while she works. Her stern warning replays in your mind. The floppy-eared pirate has you where she wants you: submitting naturally to her, and reaping the pleasures of pain-free obedience.");
		output("\n\nThose pleasures keep you at attention while the masterful laquine straps you from top to bottom with electrodes and other chilling implements.");
		if(pc.isHerm()) output(" A web of black cables are drawn around and strapped your skyward-facing [pc.cocksLight], and a pair of tiny clamps are snugly fit to the lips of your [pc.pussies]." + (pc.balls > 0 ? " An extra two patches are planted on the front and back of your [pc.sack], the Hopper stroking the underside affectionately.":""));
		else if(pc.hasVagina()) output(" Metal clamps spooled by blue cables are set to the lips of your [pc.pussies], prying them open slightly, feeling cold until another batch of warm girl-lube makes them feel like piercings you wear all the time.");
		else if(pc.hasCock()) output(" A thick corkscrew of black cables course around your throbbing [pc.cocksLight], set in place with a band as strong as a cock ring." + (pc.balls > 0 ? " An extra two patches are planted on the front and back of your [pc.sack], the Hopper stroking the underside affectionately.":""));
		output("\n\n<i>“Fuck me...”</i> the rabbit groans, staring down at you. The XO-bun is unable to resist jacking her oozing dick, barely in control of her lagomorphic libido. You can’t deny you’re feeling the same way");
		if(pc.libido() < 33) output(", idly hoping that she’ll finish up soon and help you cum");
		else if(pc.libido() < 66) output("; you’re begging her to fuck you with your eyes");
		else output("; a whine builds in your throat, so close to crying out for her to fuck you where you lie");
		output(". The veins along her bright pink shaft tingle as violently as you did before, close to popping from enthusiasm.");
		output("\n\n<i>“Hrngg,”</i> she grunts, clenching her swelling lube-tube, <i>“I’ve only got one more question.”</i> She smacks the switch on that box with her foot. A current runs through you, beginning at every major nerve cluster on your body. It makes you flinch at first, but that was because of how loud the kick was. Really, you feel... relaxed. It’s far less painful than the collar’s disciplinary feature, though it is mildly paralyzing. She smacks the switch again, the second clap following the other on an echo spiral through your [pc.ear]. <i>“Why are you here?”</i>");
		output("\n\nThat electric blanket, for the brief moment it was active, teased out every knot and seemingly reverted the damage from before. Tranquility is the only way you could describe it. Your newfound sense of well-being and placidity is worth sighing blissfully about. <i>“Woah, I...”</i> You finally remember she asked you a question. <i>“I was looking for a probe,”</i> you say, eyes still locked to the hers. A cool shiver runs through your bewildered veins. <i>“I’m a rusher-”</i>");
		output("\n\n<i>“Wrong answer.”</i> Your collar is activated. <i>“My dick is so hard I could bludgeon a fucking planet out of orbit, but I won’t miss a lie.”</i> It’s toggled off. <i>“A rusher doesn’t find their way through a place like this, through five pirate gangs, and into a sealed ship on dumb fucking luck!”</i> She foot slaps the electrostim unit again, and that all-too pleasant tingle returns to undo your aches. <i>“One more time.”</i> You wriggle in relief, muscles slackening and tension draining as an overabundance of sizzling euphoria floods your body.");
		output("\n\nIt only makes obeying easier. <i>“I’m the [pc.sonDaughter] of Victor Steele...”</i> The effect it has now is more pronounced. You’re drooling uncontrollably, like your lusts are acting independently of your fidgety form. <i>“I need to find the probes to win the company...”</i> Your arousal funnels and disappears into the background, ferried away by soothing electrical currents.");
		output("\n\nAnother kick to the device renders you hollow, practically soulless. But the smile your lapine mistress wears, looking down at you... Stars, she’s beautiful. It fills you with her floppy-eared majesty.");
		output("\n\n<i>“Interesting...”</i> Your heart and eyes flutter when she brushes the long bangs of her hair. <i>“I’ll buy that, but fuck, enough of this! I bet you’re feeling needy now, [pc.boyGirl]! Needy as a hare in heat!?”</i> You nod anxiously, cheeks reddening at her powerfully erotic tone. She grips her hair and tosses the collar control away, a manic foot smacking the stim unit one more time.");
		output("\n\nThe laquine lieutenant assaults her tight, pebbly black nipples, gasping when the tip of her veiny cock slips into the underside of her cleavage. <i>“One of the perks of being a slave is having nothing to worry about except pleasing your owner,”</i> she gleefully steps over you, sitting herself down in front of your crotch. <i>“You can let your mistress take care of everything...”</i> She breathes over your ");
		if(pc.hasCock()) output("nearly-full erection" + (pc.cockTotal() > 1 ? "s":""));
		else if(pc.hasVagina()) output("parted honeypot" + (pc.totalVaginas() > 1 ? "s":""));
		else output("your sensitive inner thighs");
		output(". <i>“First, you’re gonna see how I take care of mine,”</i> she ");
		if(pc.hasCock()) output("clutches your [pc.cockBiggest]");
		else output("cups your [pc.vagOrAss]");
		output(" adoringly, <i>“and then you’ll learn why the Jumpers " + (silly ? "rule":"are on top") + ".”</i>");
		processTime(25);
		pc.lust(50);
		clearMenu();
		addButton(0,"Next",loseToJumpBossPart2Busted);
	}
}

public function loseToJumpBossPart2Busted():void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nDEFEAT");
	// PC has dick
	if(pc.hasCock())
	{
		output("Blue fur sparkles then glistens with building sweat; the domme-bunny strokes your [pc.cocksLight], licking up and around the shaft" + (pc.cockTotal() > 1 ? "s":"") + " with masterful technique. She knows how to pool spit on her tongue and let her hands deal with the run-off, bringing you to full, greased hardness without disturbing her carefully aligned electrostim wires. You let out a squeak of pleasure when she palms over your [pc.cockHeadBiggest]" + (pc.balls > 0 ? " and the underside of your jittery nutsack":"") + ", rewarding herself with the steamy fruits of her labor. <i>“Nice taste, [pc.boyGirl].”</i>");
		output("\n\nThe unmistakable surge-to-burst of orgasm is felt in the back of your mind, yet it’s kept at bay by the gentle buzz maintaining your arousal - and your flow. Your urethra" + (pc.cockTotal() > 1 ? "s":"") + " are comfortably dilated to capacity, cock-juice pouring non-stop, like your faucet’s knob has been turned and locked into place. ");
		if(pc.hasVagina()) output("Your [pc.pussies], too, " + (pc.totalVaginas() == 1 ? "has":"have") + " become so numb and drippy that the clamps feel like natural distensions. ");
		output("Taking action is unnecessary; all you have to do is lie back and let your mistress work you into a more pliable and obedient slave" + (pc.hasVagina() ? ", one dickstroke and [pc.pussyNoun] finger pump at a time":"") + ".");
		// Balls
		if(pc.balls > 0) output("\n\nThere’s very little physical stimulation on your scrotum; however, it feels engorged, stuffed with more sperm than it can realistically handle. There are moments when your nutsack feels so heavy and fat that it might pop, but then that feeling diminishes, leaving your testes as rubbery and hypersensitive as clits. Ballflesh jostles and strains from the double-electrode application, imbuing it with a steady stream of ecstasy that a squeeze would blow your mind. You idly hope that the Hopper might slip, but until then you’re happy to receive her generosity.\n\n");
		// Merge
		output("Your bunny-queen rocks back and forth, licking from " + (pc.balls > 0 ? "your sack":"[pc.base]") + " to your crown, pressing your drooling member" + (pc.totalCocks() > 1 ? "s":"") + " to your [pc.belly] and then to her bosom." + (pc.balls > 0 ? " Often times her nipples poke and prod against your [pc.balls], almost breaking your concentration.":""));
		output("\n\nYou realize you could move, resist, fight back, but your dick" + (pc.cockTotal() > 1 ? "s":"") + " tell you not to, and " + (pc.cockTotal() == 1 ? "its":"their") + " advice is pretty sound. Every time your delightfully shuddering laquine owner swallows a weighty load of pure pre-seed or plants a suctiony kiss on your cumslit, your rationality departs for greener pastures. The soft tingles dancing along your muscles become an atmospheric field that redefines your concepts of stimulation and belonging. You’re staying still, allowing her to make you her slave, and you’re being rewarded for it.");
		output("\n\nThe moment you let your chance to escape slip by when she was strapping you up was the moment you stopped trying to do anything but obey. She has total control over you.");
		output("\n\nThere’s nowhere else you’d rather be. Your mistress is tending to your pleasures with both creamy tits; [pc.eachCock] flexes a slow-flowing rivers of [pc.cumFlavor]-flavored goodness into her spongy fur, making her gush a little more when inhaling the inches of your [pc.cockHeadBiggest]. You staying right where you are makes her happy. To you, she’s not a pirate or some oversexed bunny-bitch. <i>She’s your universe.</i> You only exist and feel because of her. You are happy because she is happy.");
		output("\n\nHer jizz-flecked lips quirk into a smile, quivering when she regards your [pc.cockType] boner with obvious reverence and glee. She lets her breath wash over your polished tumescence, glancing up and its shape. When she meets your imploring eyes, she grins and slinks forward, your [pc.cocksLight] brushing against her horsedick and through her fluffy, taut belly, huge balls... A trail of [pc.cumVisc] drool ends where her black mare-cunt begins - is she going to..?");
		output("\n\n<i>“Sorry, slave-[pc.boyGirl], but that hole isn’t for you,”</i> she winks, lifting her heavy sack and leaning back. You feel fuzzier when your [pc.cockHeadBiggest] wriggles into her butt-cleavage, coming tantalizingly close to the ring of her asshole. <i>“I like your taste,”</i> she purrs, lifting herself up on thick and powerfully muscled thighs, <i>“and I can’t wait to feel it inside.”</i> With no warning, she drops herself on your [pc.cockBiggest] with a wet smack, tongue launching from her mouth under a spray of ear-flung effluvium.");
		output("\n\nHer paws dart for her whirling cock" + (pc.hasVagina() ? " and your extra equipment":"") + ", masturbating with the most voracious look in her slutty eyes. Furious pumps and strokes - and a curious kick to the electrostim dials - has your pleasure rising to sanity-eroding levels. Strong legs carry her blessed body up and down like a jackhammer. She needs no help handling your dick" + (pc.biggestCockLength() > 13 ? ", big as it is":"") + ". When your head arches back to see the black rabbit on the bed and the size of his boner, you’re not at all surprised.");
		output("\n\nFlashes of pleasure rake the front of your mind while electrical currents stroke the back of it. You’re helpless to interact or please her back, and that does mildly upset you until the goodness you feel reminds you that this is exactly how it must be. She rams into you with animalistic aggression, letting her libido run wild through every ligament and wrinkle in her constricting chute. Temperature rising, your eyes flutter open, the fireworks of pleasure almost blinding you to the sight of her flopping tits.");
		output("\n\n<i>“Fuck YES!”</i> your mistress screams at the top of her lungs, cupping and rolling her bosom, tweaking her tightened nipples while bouncing rabidly on your crotch. You’d think there’d be some strain with this amazon-bunny’s violent thrusts and squirms, but there isn’t. Her anus is a perfect hole for your [pc.cockBiggest]");
		if(pc.cockTotal() > 1) output(", and her butt" + (pc.cockTotal() > 2 ? " and ballsack please":" pleases") + " your unholstered prick" + (pc.cockTotal() > 2 ? "s":"") + " in equal measure");
		output(". Heat blossoms from her thumping body as she rides your pole and creams your crotch. The radiant pressure is otherworldly; simultaneous sensations of numbness and excitement confuse your mind.");
		output("\n\nWhat she does next shatters your brain, breaking it into shards of fuck-crazed essence. The frequency at which your eyes roll back, realign, then roll back again is disturbing, but you can’t care. <i>Besides, mistress is taking care of you.</i> Why would she damage her property?");
		output("\n\nA kick to the stim unit sets it to ‘cum right the fuck now’ and you are bidden on a deep and unknowable level to do so. The groaning bunny’s dick flexes out ropy streams of bunny-batter that lasso through the air, slapping into your " + (pc.hasHair() ? "hair":"head") + ", your cheeks, your [pc.chest] - you open your mouth and roll out your [pc.tongue], sinking further into depravity when her hot, fresh taste trickles down your throat. Sure, you’re cumming");
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 1000)
		{
			output(", and you’re noticing " + (cumQ < 10000 ? "a small bulge":"quite the swell") + " on her");
		}
		output(", but even the hew of orgasm can’t offer you relief. <i>You are merely being allowed to feel this way</i>, and what you feel is consistent, unbroken.");
		output("\n\nAnd by the look on your mistress’ face, that’s exactly what she wants.");
		output("\n\n<i>“You didn’t think we were done there, did you?”</i> She slides up off your still-squirting and still-clenching cock. Eyes rolling back, you shriek in a shrill voice when your [pc.cockHeadBiggest] pops free, the rhythmic tensing and relaxation like stones skipping on your river. The libidinous laquine reaches for your legs even as you attempt to acclimate to this permanent pleasantness, whispering words that make you fire off another limp rope of [pc.cumNoun]: <i>“I’m going to make you the jewel on my crown.”</i>");
	}
	// PC has no dick (Vagina first, Ass if not)
	else
	{
		output("A single finger’s stroke to your [pc.vagOrAss] makes you squeal and thrust upwards. In that same motion, the blue-furred bunny grabs you by your ankles and hoiks your legs into the air, splaying your crotch and releasing your " + (pc.hasVagina() ? "girl":"") + "musk into the air to mingle with hers. Sparkling with building sweat, your domme-rabbit dives muzzle-first into your crotch" + (pc.hasVagina() ? ", nose deflecting off your [pc.clits]":", large tongue swabbing off your [pc.asshole]") + ". <i>“This is what you love most, isn’t it?”</i> Your fingers curl into the deck and you inch closer, hoping for more" + (pc.hasVagina() ? " as your stimmed vaginal glands smear her lustful brow with [pc.girlCumNoun]":"") + ". <i>“Someone to take charge, treat your " + (pc.hasVagina() ? "cunt":"butt") + " like it’s the best thing for miles");
		if(pc.hasVagina()) output(", pay lip service to " + (pc.totalClits() > 1 ? "each and every one of your":"your") + " fuck-button" + (pc.totalClits() > 1 ? "s":"") + "?");
		output("”</i>");
		output("\n\nYou nod happily, an unmistakable surge building in the back of your mind behind starbursts of color and feminine release. <i>“Lucky for you, slave-[pc.boyGirl],”</i> she husks after another feral lick, <i>“I love the taste of a needy bitch.”</i> Orgasm is kept at bay by the gentle buzz maintaining your arousal, though it often breaks free of its electromagnetic restraint when the Hopper slides her dick ");
		if(pc.hasVagina()) output("across your glistening" + (pc.puffiestVaginalPuffiness() >= 1 ? ", puffy":"") + " exterior");
		else output("through your [pc.ass] and off the rim of your [pc.asshole]");
		output(". You chew your quivering lip" + (pc.biggestTitSize() >= 1 ? ", [pc.breasts] wobbling and heaving,":"") + " begging her with your eyes to tongue you deeper.");
		if(pc.hasVagina()) output(" Your waterfalled clit" + (pc.totalClits() > 1 ? "s parry":" parries") + " every attempt to tug and tweak it, eliciting a long, sexy giggle from the cunt-kissing laquine.");
		output("\n\nAfter another wanton thrust, another sexual lathering, your bunny-queen moves forward. A dial is turned on the stim unit and the tongue over your [pc.vagOrAss] layers you in a fine sheen of spit and perspirant. Your mistress swabs her head back and forth across your crotch, mopping up all the sweat" + (pc.hasVagina() ? " and femslime":"") + " with her furry cheek before wriggling her tongue past your well-licked entrance, already aiming for the deepest " + (pc.hasVagina() ? "vaginal":"anal") + " nerves.");
		output("\n\nAnimalistic, relentless, and full of want, that flexible and masterful tongue drags over every inch it can reach. Up, right, down, left, she puddles spit in your " + (pc.hasVagina() ? "tunnel":"cavern") + " before lashing clusters you thought unreachable, wringing out another mini-climax from your supine body. Her hold on you is absolute. Her control of your pleasure is irrefutable. You couldn’t imagine anything more <b>hot</b> than that.");
		output("\n\nYou thrash and spasm, muscles locking down with more pressure than the electro-blanket applied. You’re totally helpless and at her mercy, delighting in every hot kiss, every warm lick. Rationality flows out your ears on the tide of submissive bliss. Prickly tingles pepper your muscles and nerves in an endless tap dance, gloving your entire body in an atmospheric field that redefines your concepts of stimulation and belonging.");
		output("\n\nLike a good slut you let her work, beg her for more, and wail appropriately when she finds your favorite spots. She’s making you her pliant, obedient slave. You’re letting her do it, and you’re being rewarded for it.The moment you let your chance to escape slip by, back when she strapped you up by this wonderful machine, was the moment you stopped trying to do anything but obey.");
		output("\n\nShe has total control over you.");
		output("\n\n<i>“Fuck yes,”</i> the pastel bun growls, vibratory voice like a stone skipping on your " + (pc.hasVagina() ? "feminine ":"") + "river. <i>“Someone like you who can turn me on at the drop of a fucking pin, and I’ve got you all to myself, I’ve got you cumming your fucking brains out!”</i> she laughs, but not maliciously");
		if(pc.hasVagina()) output(", making a whipping motion with her head when a " + (!pc.isSquirter() ? "small":"large") + " squirt of [pc.girlCumNoun] flies out, a glistening missile of erotic fulfillment buzzing past her ear");
		output(". She harvests your body of orgasm after orgasm, and no matter how many times relief floods through your head there’s always a buzz there keeping you going. <i>“Do you have any idea how good of a of a slave you are? How lucky you are that this is where you ended up?”</i>");
		output("\n\nMassaging fingers blaze trails up and down your inner thighs, teasing out the knots" + (pc.hasVagina() ? " and collecting more femslime for the next collecting lick":"") + ". She’s giving your soul a lot think about the more she licks it into depravity; it makes you think of all this less as luck and more like destiny. Smack after wet smack you somehow get louder, no doubt a wonderful show to the orgy on the bed. Stars, if this is how good she makes you feel, then what’ll happen when <i>you are on that bed?</i> Pleasure crests at sanity-eroding levels, smack, smack, smack her tongue goes while her hips thrust frustratedly against your back.");
		output("\n\nYour body communicates for you. You, after all, have been reduced to a fuck-crazed mess, your brain shattered into countless shards of lust-infused essence. Your eyes roll back and then they realign, blurrier than before, a process that repeats with disturbing frequency. But you’re not worried. You’ve already learned to let go. You’ve already learned that you can <i>rely on your mistress to take care of you.</i>");
		output("\n\nDesire reigns in your " + (pc.hasVagina() ? "feminine ":"") + "furnace like a horizon of bliss, heat building the more you arch your back in painful ways. One or two wires snap off your body in protest. You present your everything to your floppy-eared mistress until the length of her muzzle drives into your [pc.vagOrAss]. Tender caresses line the edge of your heady, upraised loins, and before you wonder if she’s upset with your impatience, you are nothing but joyful when she rams her face into your core.");
		output("\n\nLaquine nostrils flare; twitching whiskers tickle your innards like soft barbs of " + (pc.hasVagina() ? "vaginal":"anal") + " pleasing pleasure. If you thought she was smeared before, you were dead wrong. You’re forcing her to wince and wink with the amounts squirting out of your glands, still crying for more of her heavenly tongue. Your walls press down on her mouth so tight that you can feel the effluence trickling down the front of her incisors." + (pc.hasVagina() && !pc.isPregnant(0) ? " More importantly, you can feel her nose right next to your womb, dilating for what it knows is a virile mate, preparing itself for what surely comes next.":""));
		output("\n\nA growl; your mistress drags you into the air, kicking her stim unit into ‘cum right the fuck now’ mode. Only your neck and upper back remain on the floor while the amazon bunny manhandles you like a puppet, stretching and straining your legs, burying herself eye-deep in [pc.vagOrAss]. Her extended jaw serves as an excellent dildo, gaining more and more inches, intensifying all the ruthless sensations tightening your body before sending it into the next uncontrollable series of convulsions. You can’t stop cumming.");
		output("\n\nOrgasm doesn’t bring you relief. You know you’re wetter than you’ve ever been and ever will be. Colors blind you, so you shut your eyes. <i>“You didn’t think we were done with just that, did you?”</i> The libidinous laquine harvests you for every drop, her work never done. Acclimating to this permanent pleasantness, this artificial satisfaction driving your innate pleasure, is impossible. You feel yourself flipped around, creaming yourself just a bit more when your mistress whispers a few words: <i>“I’m going to make you the jewel on my crown.”</i>");
	}
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",moreHopperBadEndStuff);
}

public function moreHopperBadEndStuff():void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nDEFEAT");
	output("You’re lifted into the air by your thighs, your mistress’ dick propping you");
	if(pc.hasCock()) output(" and your twitching tool" + (pc.totalCocks() > 1 ? "s":""));
	output(" in the space between. The stim unit drags and you feel more disconnections, throwing the magnetic field out of whack and doing throwing what was left of your sanity into the dumpster to be emptied with the next anxious " + (pc.hasCock() ? "ejaculation":"orgasm") + ". She thrusts against your hips, slamming her wet crotch into your ass, groaning in your ear like some primitive yapping dog.");
	output("\n\nYou’re too fuck-drunk to care, far past the point anything gentle would come close to extinguishing the inferno raging inside, especially now with your system thrown into some indescribable overdrive. All you do in your state is whine. You whine for her to pound you hard with her fat, meaty dick. That big, hard horsecock bouncing like it’s your own looks larger every time your eyes run over it. Thinking about her medial ring leaving marks in you has you producing so much saliva that you gargle on it, letting it waterfall down your [pc.chest] to that pre-coated breeding rod. Being suspended and helpless only makes you cry and squirm; you can’t wait any longer.");
	output("\n\nWhen the blue-furred bunny deigns to rear back, you inhale through your teeth and feel everything relax for a single moment. A moment that she seizes, charging straight through your [pc.vagOrAss] on powerful hips and dominant desire. ");
	if(pc.hasVagina()) 
	{
		if(pc.isPregnant()) output("The blunt head of her cock slams right through your cervix, beating its shape on your womb and knocking a few eggs loose.");
		else output("The blunt head of her cock slams right into your cervix, promising the slide right through the moment birth frees up your womb for a proper dicking.");
	}
	else output("The flat head of her prick slams into your " + (pc.hasCock() ? "prostate":"intestines") + " and reshapes your pelvis in one oiled piston");
	output(". You cum. What else can you do, after all, but cum... cum and spasm like a puppet in a thunderstorm, cartwheeling through the air, screaming like a rabbit stolen up by a hawk, rending your lungs into hoarse atavism.");
	output("\n\nHer savage railing bounces you clean off her dick until you pound right back into her sheath again, and she does this with such precision and muscular force that her balls slap shockwaves of effluvium in a wide corona, spreading the action to the rest of the room. <i>“Woah, girl, you must have been really pent up!”</i> the laquine boy on the bed calls. <i>“Damn, I’ve never seen you so into it!”</i>");
	output("\n\nMistress ignores him, simply roaring into your [pc.ear], fingers digging into your [pc.skinFurScalesNoun] that the pinches can’t be ignored. Tears bead at the corners of your eyes, but not from pain. Your leakiness and drippiness is driven by pure joy. Certainly, having your [pc.vagOrAss] spread and sorely strained by her equine intruder would cause some discomfort, but you already know that you feel good because of her. You don’t have to worry about anything as a slave, only how best to moan to raise the temperature a few degrees and the pleasure several layers.");
	output("\n\nYou don’t have to talk, you don’t have to think. You just have to focus on the mass of herm-meat spurting in your ");
	if(pc.hasVagina()) output(pc.isPregnant(0) ? "channel":"womb");
	else output("colon");
	output(", letting her hammer away at you, remake you one strike of dick at a time. The ferocity at which she fucks you snaps even more wires off, and then you’re mind is totally lost. You cry out, totally overwhelmed, bulging with laquine cock and dripping from every hole. The blobs of jism she’s pouring out distend your holes and add to the swelling gut you’re hefting, no part of your body a match for the ocean of pleasure it’s being smashed by. Sinking deeper and deeper into a world without a floor, you can barely comprehend anything but the slick pressure bouncing you in the lap of a virile breeder.");
	output("\n\nCumming is impossible, yet it’s happening every second. The total conquering of your [pc.vagOrAss] is agonizing yet full of unending ecstasy. You can’t believe you thought of resisting her at some point. Your whole body cums, and it’s never enough. You’re never empty for more than a second, sometimes even less. She slides through you as easily as air does through your throat, your nose, all flaring and convulsing from disconfigured stimulation.");
	output("\n\nThis rabbit, this laquine... no, your mistress, she’s so devoted to you. You understand, oh gods do you understand. There’s nowhere else you belong. Everything you felt up to this point of reality-distorting, soul-biting orgasm is the true pleasure of obedience! This is what the life of a slave is like, in service to someone who can take care of you like this. You’re ");
	if(pc.isHerm() && pc.isSquirter()) output("shooting and squirting");
	else if(pc.hasCock()) output("shooting");
	else if(pc.isSquirter()) output("squirting");
	else output("squirming");
	output(" so recklessly that you’re not sure where the fluid’s coming from anymore. The precisely tuned smack of lapine hips to your hole and the bounce of the biggest, fuzziest, cummiest nuts replace your heartbeats.");
	output("\n\nYour old life drains away in the streams of submissive pleasure, making the transition to servitude easier and easier. More times than anyone could count you’ve been wracked with orgasm after orgasm to the point that one motion can make you break. You’re just a limp wreck held up in the hot hot arms of your mistress, a happy, giggly receptacle for her lusts. Senses totally fried, perhaps permanently so, you make out a grunt from the humping Hopper, a shift in momentum. Ears slap into your temple as her booming voice breaks the orgiastic silence.");
	output("\n\nBunny-batter rages through her fattening boner like a tsunami. A vestigial thought, not really mental, but ‘primal’ surmises that her balls are about to drain every drop into you. She climaxes so hard that your limbs flail. Your neck twists uncomfortably until she holds it in place, letting a noodly leg fall to the floor. Laquine spunk cannonballs into your ");
	if(pc.hasVagina()) 
	{
		if(!pc.isPregnant(0)) output("womb");
		else output("cunt");
	}
	else output("ass");
	output(", walloping you so hard the strings holding your matter together start getting tangled. Grunts fill your ears with the sound of her strained churning; even while she’s jetting spermy beams into you, she’s humping away, short and extremely rapid bursts.");
	output("\n\nHer cock isn’t just a bitch-breaker - it’s a bitch-inflater.");
	output("\n\nBlurry as can be, when you open your eyes you’re able to discern the diameter of your new and <i>very</i> swollen cum-gut - and it’s still getting bigger. The weight of her loads beat the strength in her arms, and she has no choice but to fall with you in her lap, the smack of her churning testes doubling the load of the next eruption. Dizzied");
	if(!pc.hasVagina()) output(", partly thanks to the sum surging up your throat like a fountain of obscenity");
	output(", you slump and fall to the side, feeling the rest of the stim unit come undone from your body and leave you feeling relieved, save for the rhythmic contractions of her spunk-spheres.");
	output("\n\nYou may finally know relief, but you certainly don’t know emptiness. Your mistress has detonated so many times that you could never hope to figure out her true capacity. All you need know, with her fur brushing against your hypersensitive skin, is that you came, you were rewarded, you feel her relief coursing through you. All you want to do is drown in her boiling-hot seed.");
	output("\n\nIncapable of recognizing anything, you open your eyes to note the inflated gut you now possess. A small breath escapes your lips. You’re not sure if you can trust anything anymore, even with the narrow band of vision you still possess.");
	output("\n\nYour consciousness begins to abate, and it’s a sweet release you gladly allow.");
	processTime(60);
	if (pc.hasVagina())
	{
		flags["LDC_SHOCKHOPPER_CUMIN"] = 1;
		pc.loadInCunt(enemy,0);
	}
	else pc.loadInAss(enemy);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hopperLossBadEndCombinedNewLifeShit);
}

// Make a lot of time pass to feed my detail boner
//BUSTED AND NOT BUSTED GO HERE!
public function hopperLossBadEndCombinedNewLifeShit():void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nDEFEAT");
	processTime(60*24*14);
	output("<i>“Yeah, it’s taken care of.”</i>");
	output("\n\n<i>“It better be. If your bitches weren’t so busy fucking everything that moves maybe they’d have had the brain cells to rub together to stop that intruder before they reached the foundry!”</i>");
	output("\n\n<i>“Right, because <b>we</b> were supposed to be on the lookout for someone sneaking up through the mines, ");
	//beatMaike: 
	if(pc.hasKeyItem("Maike’s Keycard")) output("stomping");
	else if(maikeEncountered()) output("fooling");
	else output("dodging");
	output(" the Overseer, avoiding your augged cats");
	if(flags["AGROSH_WHUPPED"] != undefined) output(", agrosh: beating up the forgemaster");
	output(",”</i> the woman’s voice carries on with no end of acidic snark, giving the other party no room to intercede. <i>“<b>You</b> bunch were tasked with guarding the ship and its forge, so you can fuck yourself with the blame game. <b>Now get the fuck out of my face.</b>”</i>");
	output("\n\nA holo-screen flashes into nothingness with a faint, crackly <i>wisp.</i>");
	output("\n\n<i>“Arrogant son of a...”</i> the tall woman scoffs and mutters, hopping back to her giant bed.");
	output("\n\n<i>“Don’t get in such a huff, beautiful.”</i>");
	output("\n\nA black and blue furred laquine share a quick kiss, barely avoiding an escalation into wanton excess. <i>“Hmph,”</i> the laquine in an orange suit cracks her neck. <i>“So much trouble over one person, this close to finally getting shit done. Guess it’s nothing if not exciting.”</i> She laughs with the smaller rabbit beside her, finally looking down. <i>“‘Sides, all that hassle was worth it for this...”</i>");
	output("\n\nA gloved hand rests on your head, stirring you from her cozy lap. It’s only by her touch that you react. You look up to your neon-styled mistress in all her floppy-eared glory, heart warmed and fluttering from the reassuring smile on her muzzle. You nuzzle into that affectionate palm before moving back to the outline of her pillowy testicles, planting a fat, lipsticked kiss on one of its spherical contents, being rewarded with a gentle ");
	if(pc.hasEmoteEars()) output("scritch behind the [pc.ears]");
	else if(pc.hasHair()) output("ruffle to your [pc.hair]");
	else output("rub to your scalp");
	output(". <i>You’re such a good slave.</i>");
	output("\n\n<i>“The dragon brainer says we’ll be ready to make a maiden voyage within the week. Think you might look proper by then, LDC?”</i>");
	output("\n\n<i>“Psh, I guess,”</i> he says nonchalantly, pushing his cocksucker down. <i>“Might consider giving you a treat if you’d share a bit, though.”</i> He snickers, turning to her with one eye shut. <i>“Would make up for the fact you won’t give [pc.himHer] up for ransom.”</i>");
	output("\n\nTo your left, a kitty-eared slave girl, as nude as you are, works over the enormous mast of your mistress’ lover-boy, fellating a dick bigger than himself with unrelenting zeal. You kind of wish that was you right now, on your owner’s cock instead. She’s feeling backed up again. Maybe she’ll get horny soon? Well, until then, all you can do is keep warm with her.");
	output("\n\n<i>“Hell with that. We’ll be making enough to add that prissy " + rival.mf("fuck","cunt") + " to someone’s bed soon enough.”</i>");
	output("\n\nThe all too arousing sounds of lip service continue. <i>“Suit yourself, hon,”</i> the bunny-boy chuckles. <i>“That’s fine. You’ve needed a skilled pet for a while.”</i>");
	output("\n\n<i>“Hmm,”</i> your blue-furred mistress leans over, nibbling on his ear, <i>“don’t go saying shit like that, you know you’re my main squeeze,”</i> she husks, and he merely responds with ‘literally’. They both laugh again, though he grunts from the intense oral service he’s receiving.");
	output("\n\n" + (pc.femininity < 25 ? "<i>“Love what you did with [pc.hisHer] face, too. Looks like what you see in me!”</i> he grins.":""));
	if(pc.hasCuntTail() || pc.hasCockTail())
	{
		if(pc.femininity < 25) output(" He shakes his head quickly. <i>“Getting rid of that awful geni-tail was smart, too. Didn’t need that around here.”</i>");
	}
	output("\n\nYou breathe quietly over your bunny-queen’s balls, no worries at all, simply happy to be there. You aren’t sure how much time has passed being here, resting in her sweet-smelling presence, at her beck and call every day until she sleeps. She keeps you close then, too. You’d probably be getting aroused if not for her rigorous training. Oh gods, then you’d be a distraction!");
	output("\n\nYou curl up, feeling a little guilty for even tangentially thinking about being pleased before your mistress. She’s a tough woman, and she can be rough sometimes, yet she’s done nothing but make you happy. It hurts to think about betraying her trust so slightly. When she said your pleasure began and ended with her, she meant it, and you can scarcely comprehend how fucking hot that kind of devotion is, being reinvented and reshaped to her whims.");
	output("\n\nShe has a lot of responsibilities, and the other rabbit certainly takes up a lot of her time, but she’s never failed to care for you in return.");
	output("\n\nWhen mistress is very busy, she’s not even around. However, you’re never tempted to seek pleasure from anyone else, you don’t feel the tiniest spark when looking at the other big-dicked bunnies in her crew. You obey only her, always tempering your resolve with memories of the time she made you her personal cock-holster. You’re never bored, either; Mistress was right of course, being a slave means worrying about nothing, agonizing over nothing... only fantasizing about how you can please her next time.");
	output("\n\n<i>“You know what, fuck it.”</i> You’re startled by her sudden movements. <i>“I’ve got a few kinks to work out.”</i> Mistress tears her zipper down, letting her mixed ball and sheath stench rock your world all over again. Her willpower courses through your body as the collar around your neck activates at her touch of a button. She’s ready to fuck again! Stars, you’re so happy that she had it modified from that one painful setting she used on you so long ago!");
	output("\n\n<i>“Move over, slut,”</i> mistress shoves that cute kitty off her boy-toy’s cock, baring that throbbing slab of horsemeat to the air. He looks expectantly towards her, and to you.");
	output("\n\n<i>“Oh, am I getting a favor too?”</i> his ears bounce.");
	output("\n\n<i>“You know it. [pc.HeShe] needs a proper filling,”</i> mistress says, flicking her gaze to you. <i>“Get on his dick just like you do mine.”</i> You nod eagerly, rolling over while she gets ready, positioning yourself in front of LDC, humming lewdly as you look up and down the massive stretch of laquine prick towering over your prostrate form" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", [pc.tails] wagging profusely":"") + ". He props his cheek up with a knuckle while the other harem-girls coo several encouragements.");
	output("\n\nThe weight of Mistress’ cum-sack flops onto your [pc.ass], making you squeal in delight. You lift your head up and waste no time, straining your jaw to accept the inky rabbit’s oversized schlong. His taste is nothing like hers, but it certainly gets your body in the mood again.");
	output("\n\n<i>“Don’t worry, you and I will get some alone time later. But for now,”</i> your mistress rams herself to the hilt in your [pc.vagOrAss], ready to fuck you into a million pieces, <i>“you just moan like a good [pc.boyGirl].”</i>");
	output("\n\nFeeling her assertion is always such a rush; often times you can’t handle it! Of course you moan! You groan, you suck, you slurp like the well-trained slave slut you are. Everything she says makes your heart melt. She’s always there for you. She loves you.");
	output("\n\nYou love her.");
	output("\n\nYou’ll always be there for her, too.");
	pc.orgasm();
	badEnd();
}

public function loseToJumpBossPart2Nonbust():void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nDEFEAT");
	output("Watching the buxom bunny strip and bare her scent and slick self to you is mouthwatering. You can see the fine detail of her muscles through her furry thighs. The small gap between her enormous nads and creamy chest is bridged by her veiny equine pole. You writhe on the spot, restless for her touch, too afraid to act without <i>her allowance</i> yet desperate for relief.");
	output("\n\nA pat on your head turns into a tracing stroke of your [pc.ear]. She grabs ");
	if(pc.hasLongEars()) output("that quivering ear");
	else if(pc.hasHair()) output("your hair");
	else output("your head");
	output(" and puts an end to your unceasing squirminess, guiding the drooling tip of her prong, swollen well past foot-long, to your [pc.lips]. She doesn’t thrust in right away, content to paint them with her steaming pre-jizz. <i>“" + (pc.lipRating() < 5 ? "Should have a mod around here to fix those lips. Good cocksuckers have a little plushness.":"Nice lips, saves me a bit of money. Good cocksuckers have plushness, and yours are perfect.") + "”</i> Your ");
	if(pc.libido() < 33) output("yearning");
	else if(pc.libido() < 66) output("thirsty");
	else output("eager");
	output(" tongue darts out to fulfill its purpose.");
	output("\n\nHer taste is salty and sweet; as sweet as what you smell being this much closer to her overproducing spunk-factories. Your spit glands kick into overdrive when her natural flavors and textures rinse your palate. You stop thinking about your ");
	if(pc.hasCock()) output("unattended boner" + (pc.cockTotal() > 1 ? "s":""));
	else if(pc.hasVagina()) output("achingly empty cunt" + (pc.totalVaginas() > 1 ? "s":""));
	else output("deprived hole");
	output(" when you swallow the first batch of rabbit dickslime. The more you gulp down, the more of your mistress-bunny’s magnificently smooth cock you tongue over, the less rational you become. Prickflesh rewards your increasingly sensitive lips with every up and down jawstroke, throwing your senses into chaos on every lubricated facial caress.");
	output("\n\nThe soft, tingly shockwave from before amplifies out of sight, rewriting your pleasure centers slowly but surely. It becomes an atmospheric field that redefines your concepts of stimulation, emptiness, fullness... <i>belonging.</i>");
	output("\n\n<i>“Mmm, I had a feeling you were suited to this,”</i> she steps closer, providing you with more hard inches to polish and savor. " + (pc.isBimbo() ? "She’s so generous! ":"") + " Head bobbing while you hungrily lap, you happily relax into your place, eager to quench your sudden thirst with another weighty batch of laquine honey... You realize you could move, resist, do anything to fight back. But why would you when staying like this, when fervently licking, kissing, and slurping at her flare is so wonderful? Making her feel good makes you feel good - she has total control over you.");
	output("\n\nThere’s nothing wrong with that. The taste of her fragrant horsemeat is to your liking, perhaps even meant for you. Her dominant aroma has already coursed through your stimmed veins, changing the way you view her. You look down the bridge your nose, eyes never dislodged from her bestial rod. To you, she’s not a pirate queen or some oversexed bunny-bitch. She’s your universe - you can only exist and feel because of her.");
	// pc Herm
	if(pc.isHerm()) output("\n\nSloughing <i>drippiness</i> between your legs is a normalcy you thought you’d lost! Spreading your [pc.legs] is an obvious compulsion. Pre flows freely from your pleasantly vibrating [pc.cocksLight], the urethras spread comfortably to allow a constant drain of cock-juice. Your [pc.pussies] feel like fountains of everflowing girlspunk, their lube-tubes on similar autopilot. You don’t even feel the wires or pincers anymore! Juices spill from you like a wet sponge that’s absorbed too much. The longer you gush on mistress’ cock, the greater the gushing between your legs. Your thickening euphoria only reinforces your obedience - this is your reward.");
	// pc Vagina
	else if(pc.hasVagina()) output("\n\nGouts of feminine juice spurt and spill from you, even more flexing out when you compulsively spread your legs. You don’t feel the metal pincers parting your [pc.pussies] anymore, only the ease at which your glands dribble out perfect streams of [pc.girlCumNoun]. You’re like a wet sponge that’s absorbed too much, focusing intently on the grinding of your [pc.pussyColor] walls and the creamy rivulets keeping them moist. The sloughing drippiness you feel below is a normalcy you thought lost! The temperature and wetness rise the longer you gush on mistress’ cock. Euphoria thickens in your mind - this is what obedience feels like.");
	// pc Cock
	else if(pc.hasCock()) output("\n\nThe gentle buzz along the shaft" + (pc.cockTotal() > 1 ? "s":"") + " of your [pc.cocks] keeps your urethra" + (pc.cockTotal() > 1 ? "s":"") + " spread comfortably and the precum flowing smoothly. Her electrostimulation turned your knob, and like a defect-free faucet you’re pouring cock-juice non-stop. Taking action is unnecessary, as being a diligent, obedient servant will bring you nearer to release. You begin to realize that the more effort you put into shining her delicious cock, the more happiness you feel throughout. This is the reward your bunny-mistress provides.");
	// Balls (add-on)
	if(pc.balls > 0) output("\n\nMinus any physical stimulation, your scrotum feels gorged, like it’s growing. It’s impossible, you know that much. But... even the slightest jostle to your cum-pouch makes the nuts inside feel like clits, rubbery and hypersensitive. The prod of a finger to your straining, ecstasy-imbued sack would be enough to make you blow. Indeed, the longer you slurp at the Hopper’s cock, the more pliant and servile you feel, and the more hopeful you are that she might happen to slip.");
	// Neuter
	if(!pc.hasGenitals()) output("\n\nEven with a lack of genitals there’s something unique about the way your mistress treats you. A warm blanket pulls over your body when the voltage increases, a fuzzy field that soothes out your lusts, makes you feel happy, content. The more you lick and lap, the hotter and wetter you feel. The cycle continues, reinforcing the reward for obedience.");
	// Merge
	output("\n\nYou part your lips unbidden, working your maw around the Hopper’s overpoweringly erect member. The alluringly thick layer of pent-up pre coating it is too tempting. You exceed her expectations unordered, [pc.tongue] wrapping around the tip and some of the shaft" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", even exiting your mouth and coiling comfortably around her medial ring":"") + ". The faint aftertaste of latex disappears when her veins pulse against your hollowed cheeks, as if movings its slimy sheen onto you. <i>“You learn quick, as expected,”</i> she pats you on the head. <i>“Good slave.”</i>");
	output("\n\nStars and bands of color shine in your eyes when you lurch forward just a bit more, bringing her fat cumslit to your neck. Seeing more of her cock disappear inside you adds to the excited rattle in your crotch. It feels so good to be praised. It feels better just <i>thinking</i> about being worth more!");
	output("\n\nMistress is not nearly as girthy as the black rabbit on the bed, but the size of her spunk-tube and the hefty balls swinging below it have you " + (pc.libido() < 66 ? "idly":"gleefully") + " fantasizing about her creamy payload. You try to surprise her again, slowly moving your hands to her vulnerable, wobbly maleness. The Hopper coos when your fingers are totally swallowed by taut, sumptuous ballflesh, altogether incapable of having presence on her virility-fattened orbs. You knead and fondle those heavy, jostling balls, only succeeding in wrinkling her pelt and losing your hands from the wrist down in the warm expanse of testicular squishiness.");
	output("\n\nMidway through the next swallow, she begins to pump in and out of your moistened mouth. You welcome it, sealing your lips to that turgid prick to make her strokes pleasant - the passage across your lips is entrancing on its own. Water beads at the edges of your eyes, but she’s quick to wipe it away. You try to suck that cock deeper");
	if(!pc.canDeepthroat()) output(" against the wishes of your gag reflex");
	else if(flags["USED_SNAKEBYTE"] == undefined) output(", wanting to show her how pluggable your throat is");
	else output(", wanting her to feel the pleasure your ribbed throat can offer");
	output(", nerves afuzz with liquid lust. <i>“");
	if(!pc.canDeepthroat()) output("Mmnh, good effort. That’s what I want to see every day, slave-[pc.boyGirl].");
	else if(flags["USED_SNAKEBYTE"] == undefined) output("Ahh, mmf, you’re no stranger to dick pleasing, huh?");
	else output("F-fuck, you have a tailored throat? Unbelievable that someone like you hasn’t been properly claimed until now,");
	output("”</i> she ");
	if(flags["USED_SNAKEBYTE"] == undefined) output("moans");
	else output("grunts");
	output(", taking the invitation to thrust deeper and bulge your neck with more feral prick. Bubbling bunny-pre trickles into your belly; the fine, rolling texture of its descent into your stomach is so sublime that it’s impossible to believe you’re feeling this good from being a cocksleeve.");
	output("\n\nThe warm pressure on your " + (flags["USED_SNAKEBYTE"] != undefined ? "erogenous ":"") + "throat-muscles would make you cum on the spot, make you whine and perhaps choke, but after another barely noticed thickening to the electro-blanket those impulses subtly fade. ");
	if(!pc.canDeepthroat()) output("Your gag reflex vanishes with it, like your throat was shocked into servitude.");
	else output("The Shock Hopper makes her enjoyment of your drooling socket known to the whole room with a few more slaps of her hip to your reddened cheeks.");
	output("\n\nJaw buttressed by this much herm-meat, you feel there should be <i>some</i> kind of strain for how far you’ve taken so much dick. <i>“Not bad at all, slut,”</i> she hisses, both of her firm hands grasping your head. Therein lies the problem... You lick, you tongue-pump, you drool, you lick some more... you’re so worried about things that don’t matter now. <i>You’re worried about nothing.</i> Your mistress is taking care of you <i>right now</i>, giving you purpose, and you’re not focused on her.");
	output("\n\nThoughts float away on tides of submissive pleasure. Your nervous worries aren’t far behind either. Simultaneous sensations of numbness and excitement confuse your brain. This is what it feels like to be a slave? This is what it means to obey your superiors? What little brainpower you have now only seems to come up with all sorts of reasons why this is good. Your whole body is happy... you’re happy...");
	output("\n\n<i>Because your mistress is happy.</i>");
	output("\n\nWhen that realization finally hits, when you feel a fat gumball of precum plop into your stomach and rattle you to the tips of your [pc.hands] and toes, you moan a little louder and put your numb fingers to her rod, jerking whatever flesh your mouth isn’t busy with.");
	output("\n\n<i>“Mishtresh...”</i> you murmur. Nobody can blame you for the delight you take in groaning around her throbbing length, what with slobber dribbling down your face and the fattest, fuzziest nuts in the room bouncing hypnotically against your upper chest. The way she bucks into your flooded maw like a wall-embedded pussy is wonderful. Rich musk flows through your nostrils, her deep groans your ears, and your moans through her bouncing, stomach-pounding mast.");
	output("\n\nAnyone would be concerned if they couldn’t remember where they were or what they were doing, they’d all be struggling to figure that out. You’re not. You’ve given up on that front, devoted yourself to taking more bunny-cock. Were you not sucking her off, you’d be using those balls as pillows. The perfect place for a dutiful slave to be! Whap, whap, whap, you’re stretched into a more appropriate holster. <i>“Hottest sounds I’ve heard all day!”</i> she laughs at your " + (flags["USED_SNAKEBYTE"] == undefined ? "strained":"erotic") + " gurglings. It’s only natural that a she-stud like the Hopper would claim you, stuff you with so much horse-cock until your belly is a private vacation spot for it.");
	output("\n\nYour mistress’ powerfully precise strokes bring her drenched bellyfur closer and closer, her big sheath too! Her turgid, bestial prick irons out all the wrinkles in your neck, the flare beginning to widen in advance of sealing in all that bunny-spunk she’s toting. ");
	if(!pc.canDeepthroat()) output("It hurts, but only a little bit. It’s like the mild frustration of trying to get out of bed, just a tiny sting of REM sleep wearing off. You trust her to make it work without pain. After all, you’ve been a good [pc.boyGirl] all this time, why would she damage her property?");
	else output("A high-pitched whine slips through every chance you get to breathe, imploring her to inflate you and pump as deep as your biologies allow. This bunny’s boner was <i>made</i> for your throat; that taut, swollen slut-shaft is the foot in your sock. Your walls hug her tender stiffness better than a pussy!" + (flags["USED_SNAKEBYTE"] != undefined ? " A claim you can back up, the way your ribbed internals methodically work that spit-greased pole!":""));
	output("\n\nPink hair goes flying while ears flop dangerously; the humping Hopper throws back her head and loudly cries, <i>“Fuck yeah!”</i> Her splotchy ears whirl when your nose smacks her crotch. She teases her tit, spattering you with your own spittle. You’re bucking back, eager for more of her salty deluge and the ballooning load brewing in those juddering orbs. You can tell she’s so close to it because you are too! All that backed up pressure is going to let loose soon; it’ll surge like lightning in a storm. Just a little more and she’ll clench - oh, you’d cum so fucking hard if she railed your [pc.vagOrAss] right after, fuck!");
	output("\n\nFurry fingers grip tight to your head and her teat. The strokes of her brutal fucking leave you almost no chance to breathe now. Eyes rolling back, the Hopper marvels at you between her own ecstatic motions, spouting off sexual nothings. The sensation of your body flushing is entirely new with the jolts running through you. One final grunt and you feel her stagger, kicking your stimulation up to <i>“cum right the fuck now”</i> as she slams in to the hilt, burying her bone in your wet hole and your top in her sheath and balls.");
	output("\n\nSearingly hot bunny-cum billows through her fattening rod, jetting with so much force that you seize. She climaxes so hard that your entire body thrashes. Even if you were restrained you’d probably break " + (silly ? "those chains":"them") + " just to cope with the impact of laquine-flavored cannonballs walloping your belly. In the space of three cumshots she’s impregnated you. Cute grunts fill your ears and the corners of your mouth quirk up in a fuck-happy smile, knowing you must look positively gravid, knowing those churning spunk-bunkers are far from finished. By this point you realize her cock isn’t a bitch-breaker.");
	output("\n\nIt’s a bitch-inflater.");
	output("\n\nYour rapidly growing cum-gut weighs you down, pulling you from the chair" + (pc.hasCock() ? ", pressing against your pathetically spasming [pc.cocksLight] and catching wads of [pc.cumNoun]":"") + ". You’re cumming, but it’s nothing at all compared to hers. ");
	if(pc.hasVagina()) output("It’s just a limp, unnoticeable, long overdue " + (pc.isSquirter() ? "spray":"squirt") + " of passion, artificial in the grand scheme of things. ");
	output("It’s not your orgasm that’s bringing you any amount of relief, it’s what’s running through your body <i>allowing you to feel this way.</i> You don’t care about anything but drowning dizzy in her boiling-hot seed. Nut-butter flies from the edges of your mouth, having nowhere else to go in your spunk-clogged throat.");
	output("\n\nMistress is still cumming. You can’t see anything now, only feel the rhythmic contractions of her burbling nads emptying into her perfect little slave. Sometimes their weight impresses against your [pc.skinFurScalesNoun], the brush of her pelt like your final slide into accepting what a depraved slut she’s turned you into. Spurt, spurt, spurt; you feel tighter with every flexing lasso of hard jism in your core.");
	output("\n\nShe’s erupted more times than you could ever hope to count, but you know that cummy saliva froths where [pc.lips] meet phallus. You don’t even recognize that she’s pulled out, your body’s senses totally fried. Giant ropes of cum splatter across your [pc.face] and they don’t stop there. Mistress ensures that your body looks more spooge than [pc.race].");
	output("\n\nYou try to open your eyes, only to feel the sting of cascading herm-goo webbing them shut. What tiny glimpses you caught were of her and her pulsating shaft close to your lips. There’s nothing else it could have been. You’re not sure anything can be trusted right now except the narrowing of your vision and the abating of consciousness. Suddenly, you feel hollow inside.");
	output("\n\nAnd then, you let go.");
	//[Next]
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hopperLossBadEndCombinedNewLifeShit);
}

//PC Victory
public function victoryOverShockyHoppy():void
{
	showShockHopperAndLDC();
	showName("\nVICTORY!");
	author("Savin");
	flags["SHOCK_HOPPER_DEFEATED"] = 1;
	
	output("The latex-clad lieutenant stumbles back against the edge of the heart-shaped bed, panting and gasping from your confrontation. " + (enemy.lust() >= enemy.lustMax() ? "Her chest is heaving under the tattered front of her suit, ripping away the shredded rubber to reveal two full mounds of blue-furred breasts and stiff black nipples.":"She’s gasping for breath, teeth grit against the pain of defeat."));
	output("\n\n<i>“I can’t... take any more,”</i> the Hopper groans. <i>“H-hey, L.D.C., you gonna help or?”</i>");
	output("\n\nThe bunny boy reclining on the bed laughs nervously, looking between you and his lieutenant. <i>“Uh, y-yeah, maybe we could just... y’know... talk this one out, huh?”</i>");
	output("\n\nThe Hopper gives him one last reproachful scowl over her shoulder before slumping onto her knees, the last of the fight gone out of her. The black bunny, so-called L.D.C., grimaces and turns his attention to you. <i>“Okay, tough " + pc.mf("guy","bitch") + ", you’ve made your point. If you can trounce my XO, you can probably put me over your knee pretty easy too. So what’re you doing barging in here? What do you want from us; what gang are you working for?”</i>");
	output("\n\nYou " + (pc.isBimbo() ? "giggle and ":"grin and ") + "tell him that you’re here looking for a Steele Tech probe. Unless it fell into the sun, it pretty much has to be somewhere in this damn station.");
	output("\n\nThe bunny boy blinks. <i>“Y-you’re kidding, right? No, you’re not. Okay, well uh, tell ya what. I think I know what you’re talkin’ about: big black space probe, ‘bout yea big? Yeah it’s down in the cargo hold. Tell ya what, how about I give you my access codes and you can just go get it, huh? No hard feelings!”</i>");
	output("\n\nOh, really?");
	processTime(5);
	//[Take It] [Save Them] [Dom His Butt] [Fuck Hopper] [Ride Hopper]
	//[Get Worshiped] [Threesome] [Drain Bunnies]
	clearMenu();
	addButton(0,"Take It",takeTheAccessCodesAndProbes,undefined,"Take It","Just take the access codes and leave the bunnies alone.");
	addButton(1,"Save Them",saveThemSluts,undefined,"Save Them","Oh no, you’re not letting him walk off with all these innocent women.");
	if(pc.lust() >= 33)
	{
		
		if(pc.cockThatFits(enemy.analCapacity()) >= 0 || pc.hasHardLightEquipped()) 
		{
			addButton(2,"Dom His Butt",cockSelect,[domTheLDCsAss,enemy.analCapacity(),true,0],"Dom His Butt","Give the bunny-boy a taste of his own medicine before anything else.");
			addButton(3,"Fuck Hopper", cockSelect,[fuckTheHopper,enemy.vaginalCapacity(0),true,0],"Fuck Hopper","Bend the blue dickbunny over and give her a good fuckin’ as punishment.");
		}
		else 
		{
			addDisabledButton(2,"Dom His Butt","Dom His Butt","You need a penis that fits inside him or a hardlight strap-on for this.");
			addDisabledButton(3,"Fuck Hopper","Fuck Hopper","You need a penis that fits inside him or a hardlight strap-on for this.");
		}
		addButton(4,"Ride Hopper",vaginaRouter,[rideHopperSlut,enemy.cockVolume(0),1,0],"Ride Hopper","Hop on that pillar of bunny mean and show the L.D.C. how to <i>really</i> pleasure an oversexed futa slut like the Hopper.");
		if(pc.isTaur()) addDisabledButton(5,"Threesome","Threesome","Your body type is unsuited to this position.");
		else if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(5,"Threesome",cockSelect,[laquineShockyThreesomes,enemy.analCapacity(),true,0],"Threesome","If all these depraved laquines do is sit around getting laid, they wouldn’t mind one last round together. One you’ll be leading, whether L.D.C. likes it or not.");
		else addDisabledButton(5,"Threesome","Threesome","You need a penis that fits inside their butts for this.");
		if(pc.hasVagina())
		{
			if(pc.legCount != 2) addDisabledButton(6,"Drain Bunnies","Drain Bunnies","You need to walk on two legs for this.");
			else if(pc.isAmazon(false)) addButton(6,"Drain Bunnies",vaginaRouter,[drainBunnies,enemy.cockVolume(0),0,0],"Drain Bunnies","After a fight like that, what better way to work out your differences than riding both those rabbits to exhaustion?");
			else if(pc.isBimbo()) addButton(6,"Drain Bunnies",vaginaRouter,[drainBunnies,enemy.cockVolume(0),0,0],"Drain Bunnies","You can’t let that big, juicy dick just walk out of here without a taste! And what about that sexy bunny? Sure she tried to hurt you, but they’re both packing some fine meat, and who knows how much cum?");
			else addDisabledButton(6,"Drain Bunnies","Drain Bunnies","You’ll need either the endurance of a galaxy-class porn star or be a much more open-minded and depraved individual to consider this. Super sluts only, ‘kay?");
		}
		else addDisabledButton(6,"Drain Bunnies","Drain Bunnies",(pc.isBimbo() ? "You can’t dom these two without a pussy!":"How can you wring cummies out of bunnies without a pussy!?"));
		if(pc.hasCock()) addButton(7,"Get Service(P)",getWorshippedByBuns,true,"Get Service(P)","Those two bunnies are the ones <i>mostly</i> in charge of Zheng Shi. Get ‘em on their knees and servicing you.");
		else addDisabledButton(7,"Get Service(P)","Get Service(P)","You can’t receive real oral service without a dick!");
		if(pc.hasVagina()) addButton(8,"Get Service(V)",getWorshippedByBuns,false,"Get Service(V)","Those two bunnies are the ones <i>mostly</i> in charge of Zheng Shi. Get ‘em on their knees and servicing you.");
		else addDisabledButton(8,"Get Service(V)","Get Service(V)","You can’t receive real oral service without a pussy!");
	}
	else
	{
		addDisabledButton(2,"Fuck Hopper","Fuck Hopper","You aren’t aroused enough for this.");
		addDisabledButton(3,"Dom His Butt","Dom His Butt","You aren’t aroused enough for this.");
		addDisabledButton(4,"Ride Hopper","Ride Hopper","You aren’t aroused enough for this.");
		addDisabledButton(5,"Threesome","Threesome","You aren’t aroused enough for this.");
		addDisabledButton(6,"Drain Bunnies","Drain Bunnies","You aren’t aroused enough for this.");
		addDisabledButton(7,"Get Worshiped","Get Worshiped","You aren’t aroused enough for this.");
		addDisabledButton(7,"Get Worshiped","Get Worshiped","You aren’t aroused enough for this.");
	}
}

//Take It
//Just take the access codes and leave the bunnies alone.
public function takeTheAccessCodesAndProbes():void
{
	clearOutput();
	showShockHopperAndLDC();
	showName("\nVICTORY!");
	author("Savin");
	flags["ZHENG_SHI_CODE"] = String(rand(10)) + String(rand(10)) + String(rand(10)) + String(rand(10));
	output("You nod, and the L.D.C. breathes a sigh of relief. <i>“Okay, okay, great. No need to get all up in arms here, look; the code’s " + flags["ZHENG_SHI_CODE"] + ". Got it? Okay, well, me and the girls will just uh, get out of your way then...”</i>");
	output("\n\nAssuming he’s telling the truth, then yeah, you got what you need. But then again, he’s talking about leaving <i>with</i> all those collared slave-girls. This might be your one and only chance to save them.");
	processTime(2);
	clearMenu();
	addButton(0,"Save Them",saveThemSluts,undefined,"Save Them","Oh no, you’re not letting him walk off with all these innocent women.");
	addButton(1,"Leave Them",leaveThemSluts,undefined,"Leave Them","Fuck ‘em, you just need the probe.");
}

//Leave Them
//Fuck ‘em, you just need the probe.
public function leaveThemSluts():void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC();
	showName("\nVICTORY!");
	output("You nod again and turn to leave. A few moments after you’ve slipped out of the captain’s quarters, you hear a number of wet footfalls padding out in the corridor, quickly receding away. Well, none of your concern; you turn your attention to the cargo hold and your inheritance.");
	pc.addHard(5);
	output("\n\n");
	//track ending resolution
	flags["JUMPER_SLAVES_FREED"] = -1;
	CombatManager.genericVictory();
}

//Save Them
//Oh no, you’re not letting him walk off with all these innocent women.
public function saveThemSluts():void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC();
	showName("\nVICTORY!");
	output("You rest your hand on your [pc.weapon] and explain to the L.D.C. that no, he’s not just taking all those girls with him. You’re freeing his slaves here and now.");
	output("\n\n<i>“O-okay,”</i> the dark bunny says, trying to suppress a grimace. <i>“That’s cool. Uh, yeah, sure, no problem. Babe, why don’t you hit the release button?”</i>");
	output("\n\nThe Hopper groans and grabs a rod off her belt. She punches a button on it, and with a metallic <i>chunk</i>, the collars all fall off the slaves’ necks. There’s a moment of disbelief on all the girls’ faces, a few seconds of wide eyes and fingers brushing bare skin around their necks, before a cheer of glee erupts from one of them. The others join in soon after, whooping and crying and leaping out of the bed. A few of them hug you or kiss your cheeks on the way out, but every last one of them is quick to make her escape from the pirates’ bed chamber.");
	output("\n\nWhen the slowest of the slaves has left, you back out of the bedroom and close the door behind you. Time to go find your inheritance.");
	processTime(5);
	output("\n\n");
	//track resolution
	flags["JUMPER_SLAVES_FREED"] = 1;
	CombatManager.genericVictory();
}

//[Fuck Hopper]
//Bend the blue dickbunny over and give her a good fuckin’ as punishment.
//Requires a dick or strapon.
//Savin
public function fuckTheHopper(x:int):void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("How about you give the L.D.C.’s lieutenant something <i>hard</i> to feel instead?");
	output("\n\nYou set your [pc.weapon] aside and start stripping your gear off. While the Hopper is still reeling from your " + (enemy.HP() <= 1 ? "beatdown":"lustful techniques") + ", you grab the neon pink mohawk between her lapine ears and shove her onto her knees. Your [pc.cockOrStrapon " + x + "] falls onto her lips a second later, followed by a command to <i>“Suck it.”</i>");
	output("\n\n<i>“H-hey, come on now,”</i> the black-furred laquine grimaces. <i>“There’s no need for that.”</i>");
	output("\n\nYou just cut your gaze between him and the collared slave girls sprawled all around him. Yeah, he’s got no room to talk. You tighten your grip on the over-sexed shock-bunny and push her down your length. Her mouth opens obediently, almost slack-jawed as the first inches of your [pc.cockOrStrapon " + x + "] slide through her lips. The bucking of your [pc.hips] pushes her back against the side of the bed, wedging the Hopper between your thighs and the mattress. Some of the slave girls giggle, pawing at her with hands you’re sure have been wrapped around the Hopper’s dick plenty of times before. This time, they pinch and yank on her ears until the shock-rabbit is moaning whorishly around your cock.");
	output("\n\nYou grin down as her lengthy tongue curls around your crown, telling her she’d better get you nice and wet. Despite that, she’s mostly a passive participant in this position, an oral cocksleeve that you thrust into to your heart’s content. Before long, thick ropes of glistening saliva are matting the fur around the bunny-girl’s chin and unmistakably linking her mouth to your dick. Now that’s a pretty sight!");
	output("\n\nToo bad it’s just the appetizer.");
	output("\n\nYou step back, dragging your dick back out through her throat before reaching down and pulling her up onto the bed. Her back hits the mattress between two of the slave girls, and her dick bounces against her belly, leaving a white smear over her fur" + (enemy.HP() <= 1 ? " as the two slaves rip her bodysuit off her for you":"") + ". You grab her weighty balls in both hands, hefting the fuzzy orbs up and out of the way to reveal the dusky lips hidden underneath them. Her azure fur nearly hides them, save for the growing circle of sultry excitement emanating from the reddening folds.");
	output("\n\nNow that’s a prime target if you’ve ever seen one. You hand off the Hopper’s cock and balls to some of the slave girls, letting them hold the laquine’s equipment out of your way while you line your [pc.cockOrStrapon " + x + "] up with the entrance to her pussy.");
	output("\n\nRather than continue his half-hearted protests, the L.D.C. rolls onto his knees just above where his lieutenant’s fallen and hefts up his monstrous cock, only to flop it down right on the Hopper’s face, nestling the crown between her tits. You have half a mind to stop him, but... well, the way his dick’s been throbbing at the sight of you orally fucking his Hopper, you don’t think he’s going to last long - and if you stopped him, he’d probably just geyser all over you both!");
	output("\n\nSo you just focus on your most recent conquest, spreading her furry legs in your hands and grinding the crown of your cock against the little hooded bulb at the top of her cunt. One good is enough to make her squeal, legs struggling against your hands... and her dick almost jumps straight up before one of the slave girls catches it and pins it back down just in time for a trickle of white to leak out and mat itself in her belly fur.");
	output("\n\nOh, that’s sensitive! You tease her about the L.D.C. never having found it before, the way she leaks all over herself every time you rub the tip against her clitty... and that only seems to make her harder and wetter. The black bunny huffs, but the Hopper’s mouth working on his balls quickly hushes him. You can only see the working of her tongue through ripples in the L.D.C.’s cum-swollen balls, but she’s soon cut off by her boss thrusting the length of his dick down her throat.");
	output("\n\nNow that’s an example worth following. As soon as you see what the pirate boss is up to, you follow suit, letting the bottom of one thrust against the Hopper’s clit carry you straight back in between her pussylips. You’re rewarded by a shriek, muffled by her mouthful of dick, and then you’re sinking into the silken chasm of her quim.");
	if(x >= 0) pc.cockChange();
	processTime(20);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",fuckTheHopper2,x);
}

public function fuckTheHopper2(x:int):void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("The Hopper isn’t tight - there’s no way she would be, close as she is to the L.D.C. and his mammoth dick - but damned if she doesn’t clench down hard as you ease yourself home. ");
	//Victory by Lust: 
	if(enemy.lust() >= enemy.lustMax()) output("You aren’t halfway buried in the Hopper by the time her dick shoots a thick stream of white across her chest, splattering her tits with pearly white.");
	else output("Her dick throbs too, leaking watery white pre across her belly as her body accepts your victorious dick.");
	output(" The sight just gives you motivation to keep going, driving yourself " + (pc.balls > 0 ? "ball":"") + (pc.balls > 1 ? "s":"") + (pc.balls > 0 ? "-":"") + "deep into the Hopper’s gaping pussy.");
	output("\n\nSome of the slave-girls titter, delighted by seeing their former mistress getting what she deserves - and watching her cream herself from pleasure in the process. A few slender hands grope and squeeze her balls, keeping them pinned against her thighs and belly and out of your way. They’re clearly well trained, and eager to turn that training against their captors given half a chance. Good girls!");
	output("\n\nAll you have to do is concentrate on pounding that sweet laquine pussy. The sheer wetness of her snatch makes the job all too easy, and her muffled cries of pleasure urge you to keep ramping up the force of your fucking. Pussyjuice squirts out around your [pc.cockOrStrapon " + x + "] with every thrust, mirroring the growing lake of bunny-cream spreading across the Hopper’s belly and breasts. God, this blue bunny’s getting soaked!");
	output("\n\nYou lean in, planting your hands " + (pc.isTaur() ? "and forelegs ":"") + "on the bed around the Hopper, letting the angle bring you in deeper and harder. ");
	var longy:Number = 9;
	if(x >= 0) longy = pc.cocks[x].cLength();
	//PC has a big dick: 
	if(longy >= 18) output("You watch with a smile as the Hopper’s belly bulges around the sheer mass of your monstrous cock, her body distending to accept your breeder’s pole.");
	else if(longy < 6) output("You know you don’t have much to work with, certainly compared to the two hyper laquines, but damned if you aren’t making the most of what your momma gave you. Lucky you, her clit’s easy to rub on even from the inside!");
	else output("You might be pitching your hot dog down a veritable hallway here, but that doesn’t seem to be hampering the Hopper at all - or you, thanks to the way her slick walls ripple all around with with the throbbing of her cock.");

	output("\n\nJust as you’re really getting into it, you hear the L.D.C. grunt, and then the Hopper’s back goes rigid. Doesn’t take a genius to figure out what’s happening, what with his dick throbbing and balls clenching... and then the Hopper’s stomach starts positively <i>swelling</i> with the sudden deluge pouring down her throat. She groans, dick wobbling helplessly in the slave girls’ hands while her boss feeds her what must be a gallon of pent-up laquine seed.");
	output("\n\nThe Hopper’s body jiggles with pregnant weight, and her pussy clenches hard around your [pc.cockOrStrapon " + x + "] while her dick finally erupts in a shower of her own cream. Guess there was too much coming in to keep it all in! Hey, that gives you an idea...");
	output("\n\nYou take the reins on her dick from the slave girls, angling it up towards the L.D.C. He has just enough time to recoil before the first arcs of steamy white cum marr his coal-hued fur.");
	output("\n\n<i>“Argh, fuck! Not cool!”</i> the Jumper boss howls, waving his arms to ward off the next cum-blasts. Too bad for him. You keep the Hopper’s hose aimed right at the L.D.C.’s face, turning them into a veritable orgasmic ouroboros - one that you’re very near to adding to, yourself. You can feel that urgent, nagging pressure welling inside you, that incessant need to release the content of your [pc.balls] deep inside this evil slut.");
	output("\n\nAfter all the slaves she and her boytoy here have abused, she certainly deserves a taste of Steele-brand justice" + (x >= 0 ? " delivered directly to her womb":"") + ".");
	output("\n\nA few more thrusts and you feel ready to burst. You grip the Hopper’s furry thighs, using them as leverage to slam yourself ");
	if(pc.balls > 0) output("ball" + (pc.balls > 1 ? "s":""));
	else if(x >= 0 && pc.hasKnot(x)) output("knot");
	else output("hilt");
	output("-deep into the bloated bunny’s cunny. A moment later and you’re over the edge, ");
	var cumQ:Number = pc.cumQ();
	//hardlight: 
	if(x < 0) output("hammered in all the right places by a discharge of neurons. The hardlight strapon around your nethers transmits all the feeling of a hard-won orgasm right to your brain, making you howl with pleasure.");
	//Small cum vol.:
	else if(cumQ < 200) output("drooling your wad into the cavernous channel of the Hopper’s abused cunt. You’re not sure she even noticed, given the absolute flood already sloshing in her stomach.");
	//med. cum vol.: 
	else if(cumQ < 1000) output("shooting your goo straight down the gaping chasm of the Hopper’s horsecock-molded cunt. She gasps, moaning forcefully enough to send a streak of pearly spunk drooling down her chin while the L.D.C.’s still hilted down her throat. Jeez, how’s she even breathing around that thing?");
	else if(cumQ < 25000) output("slamming your hips against the Hopper’s and emptying your [pc.balls] into her. Geysers of [pc.cum] lurch from deep inside you, shooting through throbbing dickflesh and filling her belly with steaming seed. Her belly, already gravid with the L.D.C.’s load, swells to a positively pregnant size as your inhuman orgasm goes on and on.");
	else output("[pc.cock " + x + "] erupting in a torrential deluge of [pc.cum]. Spooge flows in an unending tidal wave, swelling the Hopper’s already cum-stuffed belly. Her gut stretches, trying to make room for the sheer volume of your orgasm" + (!pc.hasKnot(x) ? " even as half of it squirts back around your dick":"") + ". Halfway through your nut, it gets so bad that the Hopper gags on the L.D.C.’s cock and chokes out a waterfall of his cum, making room for your much bigger wad.");
	output("\n\nWhen the mind-blanking climax finally passes by you, you pull out and stumble back against the bulkhead, surveying a bed and two bunnies utterly drenched in three orgasms’ worth of spooge. That’s what they deserve for all of... all of this piracy and slavery all bundled up together around your stolen probe. Speaking of which, you grab the Hopper’s belt device off the floor, click the button, and tell the slaves to get going while the getting’s good.");
	output("\n\nYou’ve got a probe to go find.");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,x);
	output("\n\n");
	//track resolution, slaves freed.
	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["SHOCK_HOPPER_FUCKED"] = 1;
	flags["JUMPER_SLAVES_FREED"] = 1;
	CombatManager.genericVictory();
}

//[Ride Hopper]
// Tooltip: Hop on that pillar of bunny mean and show the L.D.C. how to <i>really</i> pleasure an oversexed futa slut like the Hopper.
public function rideHopperSlut(x:int):void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("You know, you could just take the bunny baron’s code and go, but... where would the fun be in that, exactly? You’ve got no illusions that if things had gone another way, you’d be lucky to only be collared and forced into their fuck-slut harem. You figure you’ve got every right to take advantage of the Hopper’s reeling state. You " + (enemy.lust() >= enemy.lustMax() ? "grab the tattered remains of her jumpsuit and rip them away, letting her weighty tits fall into your hands":"shove the over-endowed bunny back and grab the front of her rubber jump suit, yanking its zipper down hard enough to make her furry tits bounce out into your hands") + ". She gasps, a whine trilling in her throat while her equine-like erection sways towards you, rubbing against a thigh.");
	output("\n\n<i>“H-hey, that’s my job,”</i> the L.D.C. huffs, watching helplessly as you take his lieutenant in your arms. You grab her cock in one hand, stroking it slowly from sheath to medial, while a hand plays its way across her breasts. You push her, slowly at first, then forcefully backwards. She goes tumbling onto the bed hard enough to knock the wind out of her, and the second she lands, the once-submissive harem sluts dive on her with a lustful furor. Hands grab at her tits and ears, pulling and tweaking until the Hopper’s squealing and her cock is throbbing hard.");
	output("\n\nThe pillar of lapine horse-meat wobbles under its own weight, swaying unsteadily as you mount the bed after her. You shuck your gear and sit your [pc.butt] directly on the Hopper’s belly, rubbing your cheeks back against her stiffening tool until you’re satisfied that it’s as stiff as it’s going to get. For your part, you’re " + (pc.hasVagina() ? "as wet as can be, soaking with anticipation. It’s not every day you get to sample equine majesty of this sheer size while its owner is a submissive mess of overstimulation between your thighs.":"burning with desire. Your [pc.asshole] opens with a force of will, parting its perpetual clenched as it presses against the haft of the Hopper’s cock.") + " Slowly, savoring every moment of it, you shift your weight up so that the blunt, flared breeching end of her oversized dick is pressing into the waiting " + (x >= 0 ? "lips":"ring") + " of your [pc.vagOrAss " + x + "].");
	output("\n\nYou lock eyes with the L.D.C. and give him a wink as you spear yourself on his lieutenant’s member, gasping with pleasure as your [pc.vagOrAss " + x + "] is stretched open by the Hopper’s huge member.");
	if(x < 0) pc.buttChange(enemy.cockVolume(0));
	else pc.cuntChange(x,enemy.cockVolume(0));
	output("\n\n<i>“Ohh, fuck! You’re so ");
	var loosie:Number = pc.ass.looseness();
	if(x >= 0) loosie = pc.vaginas[x].looseness();
	if(loosie < 3) output("tight");
	else if(loosie < 5) output("perfect");
	else output("loose");
	output("!”</i> the electro-bunny moans, biting her lip. Her hands wander to your hips, trying to pull you down, but some of the slave girls surrounding her decide that after who knows how long of helplessness, it’s time to show the Hopper to get a taste of her own medicine. They grab her wrists and pin them down around her shoulders, leaving you free to decide your own pace without interference from your defeated foe.");
	output("\n\n<i>“That’s more like it,”</i> you grin, giving the slave-girls an appreciative nod. They titter and grin, hunger in their eyes - not necessarily for sex (though there are plenty of stiff nipples and wet cunts on display), but for the show you’re about to put on for their benefit.");
	output("\n\n... And they’re not your only audience. The L.D.C. is still sat right where you left him at the head of the bed, eyes wide and massive dick turgid with voyeuristic glee. Despite what his dick’s telling you, he looks positively crestfallen watching you slowly start to slide down the stiff shaft of his subordinate’s schlong.");
	output("\n\nMaybe he’s just feeling left out!");

	//PC has a cock, 6+ inches
	var y:int = -1;
	if(pc.hasCock()) y = pc.cockThatFits(enemy.analCapacity());
	if(y >= 0)
	{
		if(pc.cocks[y].cLength() < 6) y = -1;
	}
	if(y >= 0)
	{
		output("\n\nWell, you can sure help him feel what you’re feeling. You reach over and grab the L.D.C.’s hips, yanking the laquine twink over and shoving his face down into the Hopper’s bosoms. He squeals and squirms, thrashing around in a way that makes the bigger bunny’s tits quake and sets his plush, furry ass to wiggling oh-so-enticingly. That’s more like it.");
		output("\n\nTime to get him in on the action - and punish this wayward bunny the best way you know how. You wrap your hands around your [pc.cock " + y + "] and press the crown into the fluffy crevasse between the L.D.C.’s cheeks, letting him feel the pressure rubbing on his pucker.");
		output("\n\n<i>“W-wait a second,”</i> he gasps, sputtering into the Hopper’s rack. <i>“Look I’m sorry about whatever and shit but don’t-”</i>");
		output("\n\nHis voice transitions to a wordless screech as you thrust your [pc.hips] forward, shoving your [pc.cock " + y + "] directly into the L.D.C.’s tailhole. His little bunny tail shoots straight out behind him, and his mammoth cock squirts all over the Hopper’s belly.");
		pc.cockChange();
	}
	else
	{
		output("\n\nYou cast a quick glance over the collection of sexed-up slave girls, and alight on the ideal partner for the bunny twink: there’s a bubbly kaithrit girl lounging on the bedside, idly stroking a sizable canid cock that’s already leaking and eager to be called to action. " + (!CodexManager.entryUnlocked("The Treatment") ? "Between her leaking faucet and a pair of pearly handlebars growing from her brow, it’s a safe assumption to say she’s a Treated gal. Maybe even one of the elusive cum-cows!":"") + " <i>Perfect</i>.");
		output("\n\nYou crook a finger and beckon her over. She’s as compliant as can be after her time in the bunny harem, but when you tell her just where you need her sexual services, she’s all eager smiles and stiff erection. With her simple instructions installed, you reach down and grab the L.D.C. off his pillows and pull him over face-down on top of the Hopper. He squeals and squirms, but in his hyper-aroused state, there’s not much he can do but submit when his face is pressed into the lieutenant’s tits and his ass is hiked in the air. You lean back, taking the Hopper’s dick a few inches deeper in the process, and make room for your kitty-cow compatriot to snuggle in between your [pc.hips] and the pirate’s plush, fuzzy behind.");
		output("\n\n<i>“W-wait,”</i> the L.D.C. mumbles, spitting up chest fur. <i>“This ain’t how it’s supposed to-”</i>");
		output("\n\n<i>“Go!”</i> you command, giving the cum-drooling cat a slap on the ass. She hoots with glee and thrusts forward into the defenseless boy’s puckered hole. You’re rewarded with a shrill screech, and then the resounding slap of flesh on flesh.");
		output("\n\nThis cat’s pretty good for a proxy dick!");
	}
	processTime(30);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",rideHopperSlut2,[x,y]);
}
public function rideHopperSlut2(args:Array):void
{
	clearOutput();
	author("Savin");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	var x:int = args[0];
	var y:int = args[1];
	output("Now that the L.D.C.’s properly plugged, you’re free to return your concentration to what’s really important here: the thick horse dick spearing your [pc.vagOrAss " + x + "]. You let loose a little sigh of contentment as you resume your downward course. It’s a positively electric sensation, feeling that thick pole slide deeper and deeper inside you. Every couple of inches and the Hopper’s member spasms, swelling and leaking pre before your muscles compact it back down and you’re able to wiggle down a little further.");
	output("\n\nIt feels like an eternity of bliss before you finally nestle your [pc.butt] against the laquine’s thighs. Your stomach is bulging around the sheer mass of bunny-dick sitting inside your [pc.vagOrAss " + x + "], giving you such a wonderful stretch that it’s hard to breathe. You grip the L.D.C.’s butt and use it as leverage to push yourself back up, dragging that veiny cock right back out until the medial ring is nestled in your " + (x >= 0 ? "lips":"ring") + ", still just deep enough to give your stomach a nice paunch, before letting gravity slowly sink you back the way you came.");
	if(y >= 0)
	{
		output("\n\nEvery bounce makes your [pc.cock " + y + "] wiggle inside the L.D.C.’s tight boypussy, thrusting a little deeper until your [pc.knot " + y + "] is pressing against his tight hole.");
	}
	else output("\n\nEvery time you move, the futa kitty in your lap thrusts a little deeper in the L.D.C., letting you guide just how hard she fucks the pirate lord’s poor behind.");
	output(" The dusky bunny squeals in protest, but you watch with a smirk as his oversized breeding pole squirts with every thrust, covering the Hopper’s chest in musky cream. Thick rivers of spooge bubble up from between her breasts, right up until one of the rowdier slave-girls in the harem grabs the Hopper’s head and forces it forwards. The shock-bunny’s lips curl around her lover’s crown, arresting the flood of pre by guzzling it all down.");
	output("\n\nYou start moving a little faster now, enjoying the fruits of your victory and the shameful submission of the entwined fuckbunnies. The crowd titters and jeers, groping at fluffy butts and tits while you enjoy your victory lap.");
	output("\n\nAll good things must come to an end, though, and you can feel the Hopper already getting close to climax. Her dick pulsates with need, swelling inside you and ready to discharge its creamy load. With a harsh pinch of a nipple, you bid her to wait; no cumming unless you say so.");
	output("\n\nThat just has the opposite effect. The Hopper’s body goes rigid a moment, following by a whimper of pleasure and a sudden rush of warmth shooting into your [pc.vagOrAss " + x + "]. Damn it, woman. You twist her nipple harder as punishment, but you can’t deny how good it feels to be filled by all that virile bunny-spunk. But you’re not quite done... not yet.");
	output("\n\nYou dig your fingers into the pirate leader’s ass and push up, ridding that thick bunny-cock even faster than before. And she’s so damn sensitive now, over-stimulated in the tail-end of her orgasm, that she’s whimpering and squirming under you by the end of the first bounce. More movement milks more spunk from her clenching balls, swelling your " + (x >= 0 && !pc.isPregnant(x) ? "womb":"stomach") + " with cum. At the same time, you shift your attention to her commander and the dick wedged in his tight little hole. You " + (y >= 0 ? "thrust yourself deep in, probing for the sensitive ass-clit hidden in there. It doesn’t take long to find it, and when you do, you’re greeted by a howl of pleasure that echoes through the captain’s quarters.":"urge the futa cat to thrust deeper, to find the most tender places hidden away in the bunny’s butt. She’s eager to please - you and the L.D.C. both! Her hips buck and wiggle, probing around until she finally hits on that sweet little ass-clit hard enough to make the black bunny scream.") + " And stars does he cum from it.");
	output("\n\nThe Hopper is blown straight off his cock by the first geyser, plastered on the blankets by a wad of white cream, and then the rest is flooding through her fur in great gouts of steaming seed. Watching that degenerate show is just the last little bit of stimulation to push you over the edge. Your breath catches, loins tightening as your [pc.vagOrAss " + x + "] squeezes hard around the Hopper’s thick dong" + (y >= 0 ? "; your [pc.cock " + y + "] pushes deep before release, busting your nut hard into the dusky bun’s behind. He shudders, still leaking from his own orgasm, limply allowing you to fill him as his lieutenant did to you":"") + ".");
	output("\n\nThe cascade of spooge, flowing from body to body, lasts for a good long while before you’ve finally taken the whole of the Hopper’s load. When she’s finally finished, you roll heavily off her and onto your side, shivering with pleasure as white cream leaks down your thighs. The two bunnies are too busy humping at each other once you’re gone to pay you any mind as you slowly clean yourself up and grab the slave baton from the Hopper’s sundered uniform. One tap and the harem sluts are free to exact their sexual vengeance on the Jumper leadership while you get ready to go find your inheritance.");
	processTime(30);
	//track outcome and slavegrill freeing
	pc.orgasm();
	if (x >= 0)
	{
		flags["LDC_SHOCKHOPPER_CUMIN"] = 2;
		pc.loadInCunt(enemy,x);
	}
	else pc.loadInAss(enemy);

	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["SHOCK_HOPPER_FUCKED"] = 1;
	flags["LDC_FUCKED"] = 1;
	flags["JUMPER_SLAVES_FREED"] = 1;

	output("\n\n");
	CombatManager.genericVictory();
}

//[Dom His Butt]
// Tooltip: Give the bunny-boy a taste of his own medicine before anything else.
// Tooltip, no dick: You can’t pound his ass without a penis of some kind!
// Requires Penis/Strapon
// Supports all body-types.
// William
public function domTheLDCsAss(x:int):void
{
	clearOutput();
	author("William");
	showLDCAndShockHopper(true);
	showName("\nVICTORY!");
	output((pc.hasKnees() && pc.legCount == 2 ? "Putting him over your knee sounds like a wonderful idea.":"The dusky laquine is the master to his commander, is he? Well then. You don’t have a knee to bend him over, but you’ll figure it out.") + " You don’t intend on claiming your prize <i>just yet</i>, not when that dick-burdened boytoy looks like he needs a good, <b>hard</b> lesson.");
	output("\n\nYou discard your [pc.weapon] to the corner" + (!pc.isCrotchExposed() ? " and strip yourself down to refreshing nakedness":"") + ", rolling your arms and stretching your [pc.legOrLegs] like you’re bracing for a hundred-meter dash. The way in which you do all of this has the harem girls swooning at what’s on display, the pastel Hopper chewing her moist lip and the inky bunny shuffling nervously on the bed. " + (pc.tone >= 70 ? "Your well-defined body catches a few lustful eyes, though y":"Y") + "our [pc.cockOrStraponFull " + x + "] is the real attraction, its " + (x >= 0 ? "[pc.cockType " + x + "]":"hardlight") + " shape thrumming in raw, ready tumescence. You [pc.walk] forward, [pc.eyes] locked on the Jumper’s helpless boss.");
	output("\n\n<i>“Woah, hey uh, what are you doing? T-there’s no need for, I mean there’s plenty of others here! Take your pick!”</i> Frantic words tumble out of his mouth; the " + (enemy.HP() <= 1 ? "beaten":"debilitatingly aroused") + " " + (silly ? "energizer":"shock") + " bunny whimpers and lurches in your direction.");
	// PC not taur
	if(!pc.isTaur()) 
	{
		output("\n\nYou hop on the large bed, fabric crimping and folding in your crawl towards the once-relaxed bunny-boy. The multiracial slaves part like stage curtains to let you past, giggling or slapping the petite boss’s legs encouragingly until you’re face-to-face with your prize. You ");
		if(pc.isBimbo()) output("giggle");
		else if(pc.isBro()) output("chuckle");
		else output("grin");
		output(" when his breath catches, when he realizes how much control <i>you</i> now have. You take one of Zheng Shi’s captains by his tiny shoulders and flip him around, dragging him closer to your lap until he’s propped " + (pc.legCount == 2 && pc.hasKnees() ? "over your knee":"up on all fours") + ".");
		output("\n\nBesides, it’s not like he could run with that hunk of expanding manmeat weighing him down.");
	}
	else
	{
		// PC taur
		output("\n\nThe bed loudly creaks in protest to your imposing and exotic form trodding atop it. The multiracial slaves part like stage curtains as you near the once-relaxed bunny boy, giggling or slapping his plump legs encouragingly. You step over him, ");
		if(pc.isBimbo()) output("giggling");
		else if(pc.isBro()) output("chuckling");
		else output("grinning");
		output(" when his breath catches as you grab him by his tiny shoulders. You can’t quite bend the diminutive pirate lord over your knees like this, but he’s in no position to resist.");
		output("\n\nBesides, it’s not like he could run with that hunk of expanding manmeat weighing him down.");
	}
	// Merge
	output("\n\nIt’s trivial to manhandle that shimmering ass of fuzz and cottontail into the air and bury his lapine muzzle into the sex-scented sheets. Quite frankly you’re wondering if this smug bun has a bit of a sub streak... the way his equine club engorges, the way it throbs powerfully enough to vibrate the bed; his nuts, two hand-smothering cantaloupes of sloshing laquine seed churn out bubbling gushes of pre, wads half the size of his lipstick-marked spunk-tanks. <i>“D-dammit, get off me, asshole!”</i>");
	output("\n\nThe girls nearby bend their animalistic ears to appreciate their master’s mewling, humming contently when he yelps or moans. The sounds only ");
	if(pc.isHerm()) output("shunt more blood and heat to your [pc.cocks] and [pc.pussies], your mixed genitals radiating a warmth you’ll want to share soon");
	else if(pc.hasVagina()) output("make your [pc.pussies] flex eagerly, inner walls clenching close enough to touch needily");
	else if(pc.hasCock()) 
	{
		var cumQ:Number = pc.cumQ();
		output("strains your [pc.cocks]; [pc.cumColor] ");
		if(cumQ < 100) output("strings");
		else if(cumQ < 5000) output("spurts");
		else output("streams");
		output(" of preseed ooze onto the dirty bed");
	}
	else output("make you hornier");
	output(".");
	output("\n\n");
	if(pc.isBimbo()) output("<i>“A’ight, we, like, talked it out so it’s time for some fun!”</i> you sing, unable to avoid sinking a few fingers into his fuzzy sack before planting a hand on his plump butt.");
	else if(pc.isBro()) output("<i>“We talked it out, so it’s time to seal the deal,”</i> you smile, squeezing his fuzzy sack before gripping his plump butt.");
	else if(pc.isNice()) output("You run a hand over each plump butt cheek, laughing to yourself. <i>“We talked, and I’ve decided you need a lesson. Then our negotiations will conclude.”</i>");
	else if(pc.isMischievous()) output("<i>“Hard to believe the big man on this rock was actually a little man who, by the looks of it,”</i> you rub a hand over his plump butt, <i>“needs his little ass pounded.”</i>");
	else output("<i>“Just like the rest of your crew,”</i> you grunt, running a heavy hand across his plump ass cheeks, gripping hard enough to make him squeak. <i>“A slut. But one that needs a good stretching himself to really... <b>fit</b> the role.”</i>");
	processTime(10);
	pc.lust(30);
	clearMenu();
	addButton(0,"Next",domTheLDCsAss2,x);
}

public function domTheLDCsAss2(x:int):void
{
	clearOutput();
	author("William");
	showLDCAndShockHopper(true);
	showName("\nVICTORY!");
	output("One [pc.hand] bends into the air with enough liquidity that your rapt audience would be forgiven for thinking you’re a puppet on a string. They’re reminded that the only fuckpuppet here is the one squeaking after your hand rebounds off his dark-furred ass. <i>“Ow! The hell is this for!?”</i> he exclaims. <i>“If you wanted a fuck just get it over with, " + pc.mf("dick","slut") + "!”</i> One of the girls leans in to pinch on her debased master’s floppy ears. The laquine-leader bites down on the sheets with a whimper, his supple body rippling and rattling in the aftermath of your dominant touch.");
	output("\n\n<i>“S-stop that-”</i> the enforcer-bun crawls up on the bed only to be pushed down on the comfy mattress by three well-endowed girls. They pin and molest the Hopper thoroughly, ignoring the hard and still-swelling horse-boner between her legs. When that pink shaft reaches full mast, it twitches so hard it looks like it’s trying to fuck the ass of its straddler." + (enemy.lust() >= enemy.lustMax() ? " And it does, in a way. A lasso of white shoots into the air and lands square in the groove of that collared ausar’s derriere, those massive melons for nuts already brewing up a fatter load to follow it.":""));
	output("\n\nLeporine musk aerosolizes and blankets the bedroom, a visible fog of alien horniness thickening on every strike. It does its part to get you ready for leaving your mark in a better way than smacking and smacking away at a quivering butt - which, really, is kind of fun when you think about who he is, what you went through to get here. The big bad pirate ‘king’ of Zheng Shi has his reddening rear in the air and he’s making no attempt to draw it away. <i>“If you keep this up I’m gonna break your ass in-”</i> <b>Slap!</b> <i>“S-shit!”</i>");
	output("\n\nTraces of pleasure color the space between his reactive wails; the <i>claps</i> of [pc.skinFurScalesNoun] against fur strike like a whip crack. <i>“Shit! Get on with it would- Ugh!”</i> Yeah, you’ll get to the sex alright, you’re just giving him fair warning of what to expect. <i>“F-fuck, would you... Would just- Ouch! You fucker!”</i> The too-sadistic tug on L.D.C.’s ears probably didn’t help his train of thought. You shoo the buxom kaithrit away, putting an end to her fun for now while glancing to the domme-rabbit behind you.");
	output("\n\nThe once insuperable XO squirms and reaches out to you, her tiny rabbit paw looking much less threatening without a lightning gun in it. Those arms are pressed down while a sexy slave scythes the side-shaved bun’s head and spears her hot, juicy cunt on the mistress’ parched muzzle. With a face full of bare, glistening twat, the big-balled bunny-bitch’s convulses and surrenders to that dripping crease, lamely licking and suckling at it like a trained whore herself.");
	output("\n\nThe collective body heat and carnal stimulation in the air alone is enough to wring sweat from your brow.");
	output("\n\nSatisfied with your warmup, you knead the dark bunny’s jiggly butt and slide towards his asshole, the sphincter tensing and relaxing. You look around to see his monstrous endowment spurting steaming pre up to his lips, bathing him in his own supply of sense-muffling libido. It’s no wonder how he keeps that blue-bun in line, his musk has a potent effect even from this position, to say nothing of the size. It’s as thick as a log!");
	output("\n\nIf any of the slaves were interested, they could make him blow himself. Might not be a bad idea, actually...");
	var longii:Number = 9;
	if(x >= 0) longii = pc.cocks[x].cLength();
	if(!pc.isTaur())
	{
		// PC not taur
		if(pc.legCount == 2 && pc.hasKnees()) output("\n\nYou slide the sissy-boy off your knee, ");
		else output("\n\nYou ");
		output("grip his hips" + (pc.legCount == 2 && pc.hasKnees() ? ",":"") + " and pull him into your crotch; you grind your [pc.cockOrStraponFull " + x + "] between his cheeks, thrusting once in a spike of selfish desire. The way his fur massages your cum-vein is exquisite enough to make you swell to familiar capacity, but that pink-rimmed butthole is aching for a plowing, and that’s just what you’re going to do to it. You reach over - not under - to get at his twin-ringed horse cock. Your fingers brush against the flat head of his equine endowment, coming away with the warm, viscous bunny-lube necessary to make that entrance pleasurable for you.");
		output("\n\n<i>“N-no fucking way, that’s what you were... You skank! I’ll get you for this one way or the other, you will regret... ahh...”</i> Threats turn to moans as your fingers glide easily through his ass, the vulnerable flesh loosening up surprisingly well. ");
		if(longii < 7) output("<i>“Not like I’ll feel whatever <b>that</b> is you’ve got!”</i> he laughs defiantly. His taunts mean nothing with his ass spread right in front of you" + (x >= 0 ? ", fur matting under the dribbles of pre falling from your [pc.cockHeadNoun]":"") + ".");
		else if(longii < 13) output("<i>“You think you’re big? Why don’t you turn me over, I’ll make you my new lieutenant, easily!”</i> He stumbles all over his threat unable to hide just how arousing he finds all this." + (x >= 0 ? " His pitch heightens as pre dribbles onto his butt.":""));
		else output("<i>“Y-you think I’m scared of a dick like that? You won’t make me your bitch. Turn me over though, I’ll show <b>you</b> how to keep a bitch in line.”</i> You can only grin" + (x >= 0 ? " as pre dribbles onto his butt":"") + ".");
		output("\n\nYou heft");
	}
	// PC taur
	else
	{
		//fix parsers for hardlight
		output("\n\nYou pull the bitch-boy back and stand again, the bed depressing just to handle all the weight you’re putting on it. The slave girls not preoccupied with the electro-slut anxiously crowd under you, whispering and murmuring that they’ll help you make the most of this. Several pairs of hands roam the pulsating length of your " + (x < 0 ? "glow-cock":"[pc.cocks]") + ", tracing the " + (x < 0 ? "veins on your [pc.cockType " + x + "]":"artificially rendered veins on your hardlight") + " shaft while pointing it at the pink-rimmed butthole that’s just aching for a plowing." + (pc.balls > 0 ? " A few pairs of lips end up on your [pc.sack], expertly smooching the roiling contents of your virile pouch and pumping out another few persuasive globs of preseed.":""));
		output("\n\n<i>“N-no fucking way, you can’t be... You fucking skank! You’ll pay for this one day, you’ll regret-”</i> another slap to his very sore ass silences him. The naked pleasure-girls wipe up his dick-drool" + (x >= 0 ? " and some of yours":"") + ", giddily smearing his pucker under your belly. <i>“F-fuuuuck, this is...!”</i> L.D.C. whines when his anus is audibly stretched and your " + (x < 0 ? "projected crown":"[pc.cockHead " + x + "]") + " is brought straight to the well-lubed ring.");
		output("\n\nThe slaves heft");

	}
	// Merge
	output(" your " + (x < 0 ? "faux-":"") + "dick and let the ");
	if(longii > 12 && longii < 30) output("mammoth ");
	else if(longii >= 30) output("crushing ");
	output("weight of your " + (x < 0 ? "holographic ":"") + "cockflesh fall on his ass. It’s the last non-verbal suggestion he’s going to get. " + (!pc.isTaur() ? "You align":"The girls align") + " your crown with his hole and you simultaneously put force to your [pc.hips], pressing the [pc.cockOrStraponHead " + x + "] to the horse-bunny’s tantalizing entrance.");
	output("\n\nThe force, the intense pressure, and <i>the loudness</i> of his asshole popping nearly makes you cum.");
	
	if(x >= 0) pc.cockChange();
	
	output("\n\n<i>“Fu... Fuck!!”</i> the bunny boss squeaks, a strand of cum plastering his lips, another ultra-thick cord whirling past his upjerked chin and barely open eyes. Goo-webbed blankets are tugged and nude bodies slide. You burden his distending asshole with more of your raging " + (x < 0 ? "faux-cock":"[pc.cockNoun " + x + "]") + ", pumping your [pc.cockOrStraponFull " + x + "] further into his wet cavern until it seems like his entire body tightens around it. The gyrations of your waist press the slick, hard tip into sensitive clusters that have him lurching forward involuntarily, changing the color of his puddled place on the sheets from chalky to milky.");
	if((x >= 0 && pc.cockTotal() > 2) || (x < 0 && pc.hasCocks())) output(" Your extra shafts slide over his wobbling rump, painting his curves with cock-juice that his fur soaks up like a sponge worth its price.");
	else if((x >= 0 && pc.cockTotal() > 1) || (x < 0 && pc.hasCock())) output(" Your extra shaft slides over his wobbling rump, painting his curves with cock-juice that his fur soaks up like a sponge worth its price.");
	output("\n\nCute ‘oohs’ and ‘ahhs’ follow your inaugural movements" + (!pc.isTaur() ? ", the voices raising when you grab the twink-slut’s hips":", the voices raising when you clench your fists and plant your many feet"));
	output(". <i>“T-that’s big" + (longii < 7 ? " enough":"") + ", oh fuck me...”</i> he mutters in a mix of apprehension and curiosity.");
	output("\n\n<i>“That’s the plan,”</i> you say. <i>“");
	if(pc.isAmazon(false) || pc.isAss()) output("You’re gonna be wailing to the room how much you love being a sissy in his place.");
	else output("You can’t hide how much you love it, making a mess like that. Don’t hold your voice back!");
	output("”</i>");
	output("\n\nThe gratifying buzz of dominance equalizes your ever-nearing orgasm. The first outstroke is a piercing excess. His lean hips and muscles squeeze around your phallus like a vice; another few streamers of laquine spooge shoot past his thrown-back head: <i>“Ach, shit! You b-b-" + pc.mf("bastard","bitch") + "!”</i> Even the slowest and most frictious movements make him fire, you’re noticing. You twist, he twists, his giddy cock churns out a shot of nut-butter.");
	output("\n\nThe realization strains your jaw into the widest smile in the universe: your [pc.cockOrStrapon " + x + "] is the pick to his guitar strings. You hammer the fuck boy’s hole, spreading it to the limits of your bowing girth");
	if(x >= 0 && pc.hasKnot(x)) output(", grinding your [pc.knot " + x + "] to his hole");
	output(". ");
	if(longii >= 15) output("The sheer amount of dick you’ve forced him to take is evident in the " + (longii >= 20 ? "huge ":"") + "bulge against his flat tummy.");
	output(" The slaves laugh gleefully, telling you to hit ‘em harder. Who are you to deny them that?" + (pc.balls > 1 && pc.isAss() ? " You pull back and slap so hard that your balls clap right off his own, rebounding to sink into his overfull sack and engulf the fingers of the sluts surrounding you":"") + ".");
	// PC suula dick / aphrodisiac genitalia
	if(x >= 0 && pc.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe venom-bearing stingers lining the [pc.cockHead " + x + "] of your lust-bearing rod make sure that the subby, hip-jerking bunny is enjoying this, and will be enjoying this hours afterward. You feel every sting of those waving tendrils against his rectal walls, his small body flailing and thumping in the aftershock. The veins around his vibrating prong bulge so obscenely they look like they’re about to explode. His urethra is more dribble-happy than before, which is a shock considering the size of his rubbery spunk-tube - it’s not just dribbling like a hydrant, it’s rushing like a river now!");
	// Merge
	output("\n\nLurid slurps have you checking over his shoulder. The formerly cocksure L.D.C. is sucking himself off, lamely rolling a thick tongue all over the wide, mouth-stretching tip of his chocolate tool. It makes you wonder if he’s trying to distract himself from being your cock holster, or he’s just decided to make it better for himself." + (pc.isBimbo() ? " You can’t blame him for that! Dick always tastes great!":""));
	output("\n\nNoticing this, another slave grips both upright ears between her hands and forces him down on his dick, handling them like she would a lever. L.D.C.’s fat, cumbersome maleness doesn’t care where the action comes from, happy to reward its master with a nice, thick spurt of goo. Faint squeals leave you wondering if the freshest taste his nuts brewed up is to his liking or not. You’re giving him plenty more to think about with each harsh, pressuring draw of your [pc.hips].");
	output("\n\nKnowing there’s a little thing between the black and blue slut-buns, you turn your head to see the Hopper now on her side, bodysuit torn off, eating pussy and sucking clit like a champ; her horny pink eyes drift towards you occasionally, filled with too many emotions to identify. You tell the sweet thing on her face to move. She shifts obligingly, giving you a little show. All that matters is the zap-rabbit has a better view of how you’re wearing her captain like a sheathe.");
	// PC cunt tail
	if(pc.hasCuntTail()) 
	{
		output("\n\nYour tail’s parasitic passions stir when it senses that bitch-inflating rod of equine delight, squirming unloved, unattended, begging for any kind of interaction above the monstrous ballsack powering it. It " + (pc.isAss() ? "pleases":"satisfies") + " you on a higher level that you’re holstered in her little lover and there’s nothing she can do about it but get drained by the cum-hungry alien organism snaking towards its conquest.");
		output("\n\nJoy arcs through your spine like the bouncing of firework sparks. Your irrepressible partner spreads its squishy, slime-drooling lips and inhales the Hopper’s flaring tip. A storm of pleasure cyclones up your spine, corkscrewing around every vertebrae; your [pc.cuntTail] sucks her cock to the base, fully intent on draining those fuzzy nuts and sharing its happiness with you in doing so.");
	}
	// PC cock tail (and tentacle dicks in general? Back tentacles? Also, add on to cunt tail)
	if(pc.hasCockTail())
	{
		output("\n\n");
		if(pc.hasCuntTail()) output("It’s not just your cunt tail getting in on the action, your arboreal appendage" + (pc.tailCount > 1 ? "s also want":" also wants") + " to play.");
		output(" You will your " + (pc.tailCount > 1 ? "one ":"") + "verdant cocktail to the hopper’s splayed crotch, a slave lifting those enormous nuts out of the way to reveal the head jumper’s clownishly agape pussy, stretched permanently by L.D.C.’s cunt-breaking rod. " + (pc.tailCount == 1 ? "It slips in easily enough, of course, and wastes no time rubbing its nerves against her well-fucked walls.":"One slips in, then another, and those tendrils waste no time pumping her gushy honeypot, grinding their most sensitive nerves against her long-conquered walls."));
		enemy.loadInAss(pc);
	}
	// Merge]
	output("\n\nThe slaves concentrate their efforts on you as you savagely piston in and out of the pretentious pirate, skewering and stretching him with every ravishing thrust. They grope your [pc.ass], caress your [pc.hips]");
	if(pc.balls > 1)
	{
		output(", and focus exclusively on your [pc.balls], kneading and cupping the virile orbs floating in your seed-filled pouch with trained reverence");
	}
	output(". Lipstick residue marks clearly the nerves that give you the greatest thrum when peppered with kisses.");
	output("\n\n<i>“F..f...f... Ugh...”</i> L.D.C.’s throaty gurglings are almost as audible as that in his twitching nuts, dumbly firing off rope after rope with every balls-deep thrust into his upraised, cock-milking ass. You’re practically rearranging his pelvis on every ecstatic railing");
	if(longii >= 16) output(", to say nothing of leaving his rectum as wide as his LT’s bitch-hole!");
	output("\n\nYou can’t stifle your laughter anymore, running a hand " + (!pc.hasHair() ? "over your sweaty head":"through your sweaty [pc.hairs]") + ", finding new ways to pound him, new ways to bump and grind through his contracting interior" + (pc.hasCockTail() || pc.hasCuntTail() ? " while the Hopper moans slack-jawed to your rear":"") + ". You plant a [pc.hand] on his head and pull back, straining his neck and adding to the stimulation of his reaming. Longer and longer ropes of laquine nut surge to the front of the bed");
	if(x >= 0) output(" while ejaculate-diluted pre flows freely through your inflating urethra" + (pc.cockTotal() > 1 ? "s":""));
	output(".");
	
	output("\n\nHe’s taken his pleasure from others for so long, you can only imagine what it’s like for him to be on the receiving end, having his asshole abused, his prostate sawed in half while he gushes in response. It’s that imagination that propels your rapidly shuddering hips back into kneading him dry.");
	output("\n\nL.D.C.’s palate is showered with cock-drool; cum seeps from his lips between the submissive cries. Your prick glides in and out of his gloving orifice until his anal entrance is just your personal cock-ring. You jackhammer him with the belief that his ass will cling to you, that nobody else will be able to make use of it, and that he’ll secretly love the memory of being your cock-socket. Beneath his body, the boss boy’s massive dick swells to greater tumescence, enough to prop him up through sheer phallic strength. The sultry girls nearby all look to you with quirked eyebrows.");
	output("\n\nHe’s cumming; the flaring of his stallion schlong is ample proof. But something tells you it’s going to be <i>much more than that, given his size</i>. The sadistic slave girl tries to keep him forced down on his own dick, but the need for oxygen beats her weaker grip.");
	output("\n\nLimp-kneed thrusts replace the erstwhile rhythm you had in fucking this butt-boi into his own sheets, the pressure on your [pc.cockOrStrapon " + x + "] growing with the dragging of his tortured backdoor. You shimmy forward as ");
	if(pc.balls > 0) output("you feel one shot of [pc.cum] pulled from your well-massaged nut" + (pc.balls > 1 ? "s":""));
	else if(pc.hasCock()) output("you feel one shot of [pc.cum] pulled from your [pc.cockNoun " + x + "]");
	else if(pc.hasVagina()) output("you feel a " + (!pc.isSquirter() ? "drizzle":"squirt") + " of [pc.girlCumNoun] spray from your [pc.vaginas]");
	else output("your [pc.asshole] clench and wring itself in a flash of anticipatory ecstasy");
	output(". That small orgasm triggers the real one" + (pc.hasCuntTail() || pc.hasCockTail() ? ", spurred on by the hypnotic tensions rhythmically undulating through your extra genitalia from the now-detonating Hopper":"") + ".");
	output("\n\nYou hilt your " + (x < 0 ? "holo-":"[pc.cockType " + x + "] ") + "club in him and let your body handle it from there." + (x >= 0 && pc.hasKnot(x) ? " You’re careful not to slide your [pc.knot " + x + "] in lest you be stuck here for longer than you’d like.":""));

	if(x >= 0)
	{
		var cumQ:Number = pc.cumQ();
		// PC low cum
		if(cumQ < 150)
		{
			output("\n\nYour orgasm is nowhere near as virile and powerful as the laquine’s. The ecstasy of release is there, but his balls do more than churn, they <i>pump</i>, and they’re pumping his pool with industrial strength and entirely useless loads of rabbit-jizz that concuss the bulkhead of the ship you’re standing in.");
			output("\n\nThe dribbles and terran-typical ribbons of [pc.cumVisc] [pc.cumNoun] you fill his ass with are nothing compared to the turgid lines of bunny nut " + (silly ? "cheerios":"cream") + " splashing against the wall, his chin, and whatever the hell else is in the way until he’s practically swimming in his own feracity. L.D.C.’s climax does eke out the most of your load, however, and you’re sure the warmth of your [pc.cumColor] seed is to his liking" + (pc.cockTotal() > 1 ? ", particularly those lines you’ve drawn across his pre-soaked ass":"") + ".");
		}
		// PC plenty of cum
		else if(cumQ < 4000)
		{
			output("\n\nYour ecstasy-imbued orgasm is only half as mighty as the laquine’s, but it’s enough that you’re right there with him, howling as his girthy nuts churn, no, <i>pump</i> with industrial strength" + (pc.balls > 0 ? " just beneath yours; testes clench and quiver against one another":"") + ". Rabbit-jizz concusses the bulkhead with lurid effect, entirely wasted and impossible for him to handle.");
			output("\n\n[pc.Cum] splashes every nerve cluster inside the bunny-boy’s ass as turgid lines of laquine nut-cream splatter the walls, his chin, and whatever the hell else is in the way until he’s practically swimming in his own feracity. The chattering and cute groans coming out of his mouth only make the filling of his bowels more pleasurable" + (pc.cockTotal() > 1 ? ", to say nothing of the thick lines of [pc.cumNoun] drawing shapes of across his back and ass":"") + ".");
		}
		// PC lots of cum
		else if(cumQ < 25000)
		{
			output("\n\nWhen the bunny-boy geysers, you do much the same. The strength at which lapine nut-batter concusses the walls and whatever else is in front of his flared horse-dong is the same at which you ecstatically pump him full of [pc.cumVisc] [pc.cumNoun], the sheer volume flowing through your cum-vein prying his anxious ass apart to make room for its capacious inflation.");
			output("\n\nIf you were fucking a pussy, he’d be pregnant ten times over. As it is, you’re giving him a spunk-bump that’s gonna leave a trail of [pc.cumColor] cum that’ll lead you right back to him for round two.");
			if(pc.cockTotal() > 1) output(" Your extra cock" + (pc.cockTotal() > 1 ? "s deposit their":" deposits its") + " fat wads and ropes over his back and butt, blanketing him with [pc.race] cum.");
		}
		// PC monstrous cum
		else
		{
			output("\n\nThere’s an utterly sublime moment when you cum, when you slip into pure ecstasy. It’s the titanic eruption in your [pc.cock " + x + "]! It’s earth-quakingly monumental, it’s got the weight of a mountain... and it’s all flooding inside this twink pirate’s bowels. Not one bone in his body isn’t concussed by the undeniable power of your [pc.cumVisc] enthusiasm.");
			output("\n\nYour cum-vein bulges obscenely, not caring on whit for his body’s attempt to reset. What L.D.C’s blasting is impressive, but his laquine load’s almost nothing compared to yours. Your virility fires with the augmented buildup of a railgun and hits hard enough to scar a planet.. After the second oh-so-noticeable pump of your [pc.balls], you’ve splattered your groin with [pc.cumNoun], the [pc.cumVisc] spunk backwashing down your [pc.thighs], your [pc.hips], your [pc.legOrLegs]... gosh, it’s everywhere... it’s even spilling from his mouth and nostrils.");
			output("\n\nAs for your fuckpuppet, he’s got himself a fine cum-bump that’ll be leaking for hours, and that trail will lead anyone straight to him for another round.");
			if(pc.cockTotal() > 1) output(" Hell, with how thoroughly your extra dick" + (pc.cockTotal() > 2 ? "s have":" has") + " splattered him, you’ll be able to smell your way back to him!");
		}
	}
	// PC hardlight cum (Vagina and Neuter)
	else
	{
		output("\n\nYour feminine orgasm is divine in its own right next to the L.D.C.’s powerfully pumping testicular tubing. ");
		if(pc.hasVagina())
		{
			output("Your cunt" + (pc.totalVaginas() > 1 ? "s grind":" grinds") + " so tightly around something not there that you’re able to feel the caress of muscle against white-hot vaginal muscle as [pc.girlCum] ");
			if(pc.wettestVaginalWetness() < 3) output("dribbles from your deliciously glazed slit" + (pc.totalVaginas() > 1 ? "s":""));
			else if(!pc.isSquirter()) output("runs in thick streams from your beautifully drenched puss" + (pc.totalVaginas() == 1 ? "y":"ies"));
			else output("squirts with convulsing impact");
			output(" into the waiting mouths of ever-helpful harem sluts. ");
		}
		output("The mind-bending transmissions of lust from his body to yours riddle you with multiple aftershocks.");
		if(!pc.hasVagina()) output(" The ever-helpful harem sluts slide tongues and fingers into your own pucker, stroking roughly to get you off, to help you soar higher on that cloud of bliss.");
	}
	// Merge
	output("\n\nYou catch your breath in deep gasps and prickling blinks. It almost hurts to swallow in the wake of your overwhelming climax. It’s like every drop of liquid in your body was wrung out by the torrid wave of euphoria you just landed.");
	output("\n\nIt’s exhausting just freeing your [pc.cockOrStrapon " + x + "] from the slut-boy’s rear, the ring of his ruined asshole " + (longii < 12 ? "slightly agape":"gaping like a chasm") + " in the wake of your assertive lovemaking." + (x >= 0 ? " You deposit another few loads of [pc.cumNoun] on his anus in parting.":"") + (pc.hasCuntTail() ? " Your cunt-tail sends a signal to your brain, one that bids you look back to see its lips caked with the dazed XO’s seed. Good girl.":""));
	output("\n\nYou stand and collect your gear, all the while thinking of what you should do now as the lawless echelon slowly rouse. One thing’s for sure: you’ve left that bunny-boy little more than a shuddering lump of " + (x >= 0 ? "[pc.cumNoun]-splattered ":"") + "coal.");
	output("\n\n");
	processTime(35);
	if(pc.hasCuntTail()) feedCuntSnake(enemy);
	if(x >= 0) enemy.loadInAss(pc);
	pc.orgasm();
	
	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["LDC_FUCKED"] = 1;
	clearMenu();
	addButton(0,"Next",postSexShockHopperVictoryEpiloggieDoggie,3);
}

//[Get Worshiped]
// Tooltip: Those two bunnies are the ones <i>mostly</i> in charge of Zheng Shi. Get ‘em on their knees and servicing you.
// Tooltip, no Genitals: You can’t receive real oral service without a dick or pussy!
// Requires Penis and/or Vagina.
// Offer the PC a choice between cock and vagina if herm.
// William
public function getWorshippedByBuns(cockUse:Boolean):void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	var x:int = 0;
	if(cockUse) x = pc.biggestCockIndex();
	if(pc.isAss()) output("You’ve got King Dick and Queen Bitch of Asshole Mountain right there, the shock jumper on her knees and L.D.C. sitting back in comfort. You’ll move on <i>after</i> putting them to work.");
	else output("L.D.C. and his lieutenant watch you with some resignation, biting their lips as you linger there flushing with arousal. Nope. You can’t resist! You’re putting those two on their knees their faces in your crotch!");
	output("\n\nBesides, it’s not every day someone gets two pirate bosses on their knees and worshiping their ");
	if(cockUse) output("[pc.cocks]");
	else output("[pc.pussies]");
	output("! Harem girls grope and idly undulate, wondering just what you have planned ");
	if(!pc.isCrotchExposed()) output("as you shuck your [pc.crotchCovers] and ");
	//notTaurCock: 
	if(!pc.isTaur() && cockUse) output("stroke your [pc.cocksLight] ‘til " + (pc.cockTotal() == 1 ? "a wad":"wads") + " of pre bead at the tip" + (pc.cockTotal() > 1 ? "s":""));
	//notTaurVag:
	else if(!pc.isTaur()) output((pc.balls > 0 ? "heft your [pc.sack] to ":"") + "brush a [pc.hand] across your [pc.pussyNoun] and [pc.oneClit].");
	else if(cockUse) output("expose your swelling [pc.cocks]");
	else output("expose your [pc.pussies]");
	output(". Your glistening endowment" + (pc.cockTotal() + pc.totalVaginas() > 1 ? "s are":" is") + " attractive enough to earn a few cute ‘oohs’ from the naked audience, though your choice of partners fidget.");

	// PC not taur
	if(!pc.isTaur())
	{
		output("\n\nYou [pc.move] towards the bed and hop up, a terse look boring into the object of your lust. The multiracial slaves lean and slide back as you crawl over to the dark bunny boy and grab him by the legs, dragging him away from his commanding position. <i>“W-what the fuck? Hey, get off me, asshole!”</i> the cock-burdened rabbit whines. His Hopper groans, instinctively (and pitifully) trying to stop you despite her " + (enemy.HP() <= 1 ? "thorough trouncing":"intense arousal") + ".");
		output("\n\nL.D.C. falls off the mattress and flops to his knees with a grunt. His fat equine dick smacks the floor hard enough to shake the room and make him wince. You grab his LT by her bubblegum mohawk and pull the zap-bunny right next to her debased captain. All the oversexed duo can do is look up and cross their eyes in proximity to your ");
		if(cockUse) output("pre-coated prick" + (pc.cockTotal() > 1 ? "s":""));
		else output("juice-drooling slit" + (pc.totalVaginas() > 1 ? "s":""));
		output(", huffing in a mix of awe and resentment.");
		output("\n\nYou, for your part, simply relish the idea of two big bad pirates presented like common sluts waiting to be used, nothing to do but inspect your [pc.crotch].");

		if(pc.isBimbo()) output("\n\n<i>“Hope, like, you two love " + (cockUse ? "cock":"pussy") + "!”</i> you wink. <i>“Let’s see how good your tongues are!”</i>");
		else if(pc.isBro()) output("\n\n<i>“I’ll think about what to do after you get those tongues on my " + (cockUse ? "cock":"cunt") + ",”</i> you say, rubbing your " + (cockUse ? "[pc.cockHeadNoun " + x + "]":"[pc.clit]") + " into their heads.");
		//kind:
		else if(pc.isNice()) output("\n\n<i>“Maybe I’ll forgive you... <b>after</b> you treat me with your mouths.”</i> You " + (cockUse ? "stroke yourself to full hardness":"spread your vulva") + " and step closer.");
		//misch:
		else if(pc.isMischievous()) output("\n\n<i>“I’ve got a <b>real hard</b> feeling, and you two are gonna help me with that.”</i>");
		else output("\n\nYou slap the Hopper and her disobedient captain, tugging them forward. <i>“Suck. Then maybe I’ll think about letting you go.”</i>");
	}
	// PC taur
	else
	{
		output("\n\nYou [pc.move] towards the beaten bunny and position yourself " + (cockUse ? "above her, nearly slapping her with your [pc.cocks], dripping with virile passion":"in front of her, turning to expose your [pc.pussies], leaking passion and potent musk equally") + ". <i>“Why don’t you girls do me a favor,”</i> you motion towards L.D.C. and crook your finger. Giggling, they set upon him near instantaneously. The big dicked boy is yanked by his cute little feet and pulled from the bed, his enormous horse-shaft smacking lewdly into the floor with enough force to make him wince and the room shake.");
		output("\n\n<i>“W-what the hell? Girls, get the fuck off me! What do you think you-”</i> the cock-burdened rabbit whines before he is scooched next to his " + (enemy.HP() <= 1 ? "thoroughly trounced":"intensely aroused") + " LT - right in the path of your exposed and powerfully " + (cockUse ? "throbbing":"tingling") + " genitalia. You fold your arms and " + (pc.isBimbo() ? "giggle airheadedly":"snort") + ", stepping " + (cockUse ? "forward":"backward") + " to rub your " + (cockUse ? "[pc.cockNoun " + x + "]":"[pc.pussyNoun]") + " into their faces and relish the idea of two pirate leaders in such a position.");
		output("\n\n");
		if(pc.isBimbo()) output("<i>“Alright, you two get to work " + (cockUse ? "down":"back") + " there and, like, put those tongues into it!”</i>");
		else if(pc.isBro()) output("<i>“Good fucktoys use their tongues. I expect the best from the best of the slut-bunny crew.”</i>");
		else if(pc.isNice()) output("<i>“You run a crew of sex-loving rabbits. I expect you both to know how to use your mouths.”</i>");
		else if(pc.isMischievous()) output("<i>“First, you get me off. When I’m satisfied, I’ll think about letting you go. Until then, give your girls a show to remember!”</i>");
		else output("<i>“Your pet sluts will appreciate their masters following a few simple instructions I’m sure. " + (cockUse ? "<b>Suck</b>.":"<b>Lick</b>."));
	}
	// Merge
	// PC cock small
	var longii:Number = 0;
	var cumQ:Number = pc.cumQ();
	if(cockUse) 
	{
		longii = pc.cocks[x].cLength();
		if(longii < 7) output("\n\n<i>“Huh, you get this far and you don’t have much to show for it, do you?”</i> the black rabbit snarks, and a slave girl smacks him on the back of the head, shoving his nose into your modest girth. L.D.C. recoils and shakes his head, <i>“Fine, fuck! Whatever, we’ll do it!”</i>");
		// PC cock big
		else if(longii < 16) output("\n\n<i>“You can’t seriously expect <i>me</i> to fit that in my-”</i> L.D.C. begins, only to be silenced by a shuffle of your hips and a slap of your dick to his face. The Hopper chews her lip and the collared slaves titter while he shakes his head, <i>“Son of a... Just... Fuck! Fine! We’ll do this, and only once!”</i>");
		// PC cock bigger
		else if(longii < 22) output("\n\n<i>“You’re joking aren’t you? You want a hugjob? I’m sure I can find a skank with a throat that can handle this, lemme just-”</i> Before he moves another inch " + (!pc.isTaur() ? "you":"a slave") + " stop" + (pc.isTaur() ? "s":"") + " him; " + (!pc.isTaur() ? "you grip":"she grips") + " the recalcitrant rabbit by his upraised ears and smash your [pc.cockHead " + x + "] into his face. He will do it. <i>“Damnit, fine, fuck’s sake... Don’t need to be a prick about it!”</i>");
		// PC cock biggest
		else output("\n\n<i>“Fuck me, you really went all in on the drugs didn’t you? You’re more hung than... I’m sure you understand you ain’t fitting that in one of us! Let me see if I can’t get you a-”</i> You respond by hefting your [pc.cockType " + x + "] obelisk up and letting the hammer fall, putting L.D.C. in his place with a wet smack of cockflesh and cummy pre against his muzzle. There’s no better way to remind the unruly bunny-boy who’s in charge. <i>“Fucking... Ugh, whatever, you’ve made your point, f-fucker!”</i>");
	}
	// PC pussy 
	else
	{
		// PC pussy Feline
		if(pc.vaginas[0].type == GLOBAL.TYPE_FELINE) output("\n\n<i>“Damn, I like that pussy. Kaithrit cunts are just so pretty and suckable..." + (pc.vaginalPuffiness(0) >= 1 ? " And I love chubby muffs,":"") + "”</i> the bunny-boss swoons, his charade dropping as he inches himself closer to your [pc.pussy]. <i>“This thing’s almost too cute to want to stretch,”</i> he grins. <i>“" + (pc.vaginas[0].looseness() < 4 ? "</i>Almost<i>":"But someone already did that for you") + ".”</i>");
		// PC pussy Equine
		else if(pc.vaginas[0].type == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Mmm, I’d never mistake that scent. That ripe and thick smell of horse-pussy! And yours is looking beautiful, beautiful,”</i> L.D.C. compliments, sounding like he’s forgotten what’s going on. He can’t keep his hands away from your swollen and chubby cunt, eager for a taste of the mounting arousal shimmering along your rubbery exterior. <i>“Not a bad flavor at all,”</i> he smacks his lips, <i>“I’ll definitely enjoy this!”</i>");
		// PC pussy Gryvain
		else if(pc.vaginas[0].type == GLOBAL.TYPE_GRYVAIN) output("\n\n<i>“Huh... I don’t think I’ve ever tasted dragon-pussy before,”</i> L.D.C. murmurs, tilting his head at your draconic slit. Thin streams of lubricant drool from your [pc.pussyColor] labia, all but begging him to savor the nubby exterior. <i>“Those protrusions, they’re inside and outside your cunt aren’t they? Heard they feel as good as a clit when they’re massaged. This’ll be easy...”</i> He licks his lips, somehow so confident!");
		// PC pussy Suula
		else if(pc.vaginas[0].type == GLOBAL.TYPE_SUULA) output("\n\n<i>“No, that’s...”</i> L.D.C. stops and shakes his head. <i>“You’ve got one of those venomous twats, I don’t want that stuff near me!”</i> You move that cilia-lined cunny closer. Soon, he’s not gonna have much of a choice. You can’t wait to see how much of a geyser he is when those stingers get their feelers on him! <i>“S-s-shit... This... Fuck everything...”</i> he grimaces in resignation.");
		else
		{
			//(for cunnilingus; anything not specifically referenced)
			output("\n\n<i>“Yeah, I guess it could be worse. Just eat this out huh?" + (pc.puffiestVaginalPuffiness() >= 1 ? " I love [pc.boyGirl]s with chubby cunts.":"") + "”</i> L.D.C. remarks, licking his lips at the sight of your wonderfully moist [pc.pussyNoun]. <i>“Should let me put it in.");
			if(pc.vaginas[0].looseness() < 3) output(" A [pc.guyGirl] like you? You’d love a good stretch. Mmf, the sounds you’d make!");
			else output(" You may be as loose as a " + (pc.laquineScore() >= 5 ? "broodmother":"laquine") + ", but with my size that won’t matter!");
			output("”</i> You roll your eyes and usher the pair closer.");
		}
	}
	// PC chose cock, not taur
	if(!pc.isTaur() && cockUse)
	{
		output("\n\nUnsurprisingly, the Hopper is the first to leap into action. Her fuzzy paws rest on your [pc.thigh] (almost hugging you) while her mouth slurps at the crown of your [pc.cock " + x + "]. Glossy, spit-slick lips stretch around your [pc.cockHeadNoun " + x + "], the halting suctions against your dilating cumslit more than pleasurable - L.D.C. has a wildly talented cocksucker at his beck and call!");
		// Suula Dick
		if(pc.cocks[x].cType == GLOBAL.TYPE_SUULA) output("\n\nThere’s some concern in that coal-black bun’s eyes the more he follows the sways of the cilia on your venom-phallus; toxin-bearing stingers apply their pleasure-seizing loads to the Hopper’s mouth seconds after she squirms you inside. A waterfall of spit froths and flows down her lapine chin, hardening her needy-looking dick to its fullest. You can see vibratory ripples in her cream-furred nutsack, gumballs of laquine-pre spurting from her twitching tip.");
		// Merge
		output("\n\nThe horny hare hungrily jerks her head forward, taking your [pc.cock] to the back of her throat in one lewd and lavish motion. ");
		if(longii < 7) output("With how little you’re packing, it’s no issue for the azure bun to grind her nose into your loins. Your [pc.cockNoun " + x + "] luxuriates in the full service of her mouth");
		else if(longii < 22) output("The azure-bun gargles and sputters the more of your girth she tries to inhale, and she only makes it halfway down your [pc.cockNoun " + x + "]");
		else output("Tears well at the corners of her glazing eyes trying to fit even a quarter of your " + (silly ? "pounder":"[pc.cockNoun " + x + "]") + " in");
		output(". One fuzzy, vigorous hand latches onto ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(" as a thick tongue rolls around your pole." + (longii >= 22 ? " She may not be able to suck it all down, but that obedient bun is doing exactly what she needs to.":""));
		output("\n\nA slave girl helpfully pushes the Jumper’s big (little) man into action.");
		output("\n\nHis fluttery nose is embedded in your ");
		if(pc.balls > 0) output("[pc.sack]");
		else if(pc.hasVagina()) output("[pc.pussyNoun]");
		else output("[pc.base " + x + "]");
		output(" - L.D.C. gasps for air, drawing his tongue across your overheating loins before coming to rest near the blue-bun’s happily wriggling mouth. Blue bunny-lips stretch and hollow across the inches of your [pc.cockNoun " + x + "], keeping it shined with spit. Pockets of pooling pre are slurped up by his stubborn mouth, and he he finally brings one of his tiny paws to your [pc.cockNoun " + x + "] at the ");
		if(pc.isBimbo() || pc.isBro()) output("horny");
		else if(pc.isNice()) output("gentle");
		else output("not so gentle");
		output(" urging of your [pc.hand], accepting his position.");
		if(pc.cockTotal() > 1) 
		{
			var otherDikk:Number = 0;
			if(otherDikk == x) otherDikk++;
			output(" Your extra cock throbs demandingly " + (pc.cocks[otherDikk].cLength() < 7 ? "above":"atop") + ", squirting your salty lubricant onto his head.");
		}
		output("\n\nBoth Jumpers are now in full swing, licking and sucking your [pc.cocksLight] like they’ve discovered a new favorite sweet. Enthusiasm drips like every rope of cummy saliva from their mouths. Your [pc.toes] curl and dig into the deck as the beginnings of euphoria swim throughout your body. Lissome paws wander between your [pc.thighs]");
		if(pc.balls > 0)
		{
			output(", fondling the ");
			if(pc.ballDiameter() < 3) output("weighty");
			else if(pc.ballDiameter() < 5) output("heavily swinging");
			else output("sloshing");
			output(" cum-sack respectfully");
		}
		else if(pc.hasSheath(x)) output(", teasing the innards of your sheath");
		else if(pc.hasVagina()) output(", teasing out a [pc.clit] from your vaginal hood before rubbing it in smooth circular motions");
		else if(pc.hasKnot(x)) output("ringing the bulge of your breeding bulb");
		else output("caressing the flat of [pc.skinFurScalesNoun] where phallus meets groin");
		output(".");
		output("\n\n’Candied’ is an appropriate description of the Hopper’s mouth around your [pc.cocks]" + (pc.cockTotal() > 1 ? " and especially L.D.C.’s! That little suckling wonder is working magic around your multiple endowments, jerking your rods with innate expertise and honing in on the tenderest places":"") + ".");
		output("\n\nAnother so-helpful servant pulls " + (enemy.lust() < enemy.lustMax() ? "down the XO’s zipper":"tears off what’s left of the XO’s bodysuit") + ", revealing the vanilla-flavored mounds of her luscious chest which heave with inattentively whorish moans. More girls move in from behind, trained hands darting for bright, jutting nipples and flaring boners. Those stimulations cause the oral rhythms you enjoy to fall apart into phallus-obsessive frenzy. Bunny ears lilt and energetic muzzles forgo sensuality to slide back and forth, over and around with unrestrained kinetic fervor to savor the tastiest fluids, coaxing out hotter loads from your [pc.cocksLight]" + (pc.balls > 0 ? " with squeezes to your [pc.balls]":"") + ".");
		output("\n\nOne particularly cute kaithrit girl shuffles behind you, purring and nuzzling her warm cheek to your [pc.ass] and working on whatever she can find from there. Her full-body-rumbling on your ");
		if(pc.balls > 0) output("taut ballsack");
		else if(pc.hasVagina()) output("ambrosial slit");
		else output("[pc.cockType " + x + "] hardness");
		output(" feels heavenly.");
		output("\n\nAs pleasing as this scenario is, you’re not totally blind to what’s going on below. The shock-bun’s sizeable slab of herm-cock is nothing compared to the elephantine mast between her lover-boys legs. Every time that lurid tower of laquine meat pulses it grows just a bit bigger, snaking up at an angle that’ll soon overshadow him and be pressing at your own. It’s soon pressed down and aimed between your legs, though its defiant throbs bounce it skyward.");
		output("\n\nMost of the pleasure building comes from the whiskered mouths of the two bunny-pirates polishing your [pc.cocksLight], but the comfort-girls deserve a little recognition too. Warm and tender hands massage your [pc.legOrLegs], focusing on your love handles and [pc.ass]. When your conquests aren’t fondling something, the slaves take over, treating your extremities like they would anyone else’s: with love.");
		// PC cunt tail
		if(pc.hasCuntTail()) 
		{
			output("\n\nMental and emotional flashes of parasitical passion indicate that your [pc.cuntTail] senses the feast arrayed before it, and it transmits to your mind its inability to choose from the two magnificent cocks available. You squint and fire off a thought back to it, suggesting that it take from the most meaty source available: the L.D.C. You’re not sure if the response was a ‘thank you’ or ‘with pleasure’, but the cum-seeking organism spreads its drooling alien lips wide around the Jumper boss’ pillar, stretching wider than they ever have before just to secure itself around his flared tip.");
			output("\n\nThrough your nerve-melded relationship, you feel the frictious texture of its attempts to pull in more of that tremendous horsecock, and you already feel the searing pre spurting into its unknowable depths. You almost can’t wait for him to cum, to be privy to that raw detonation of delight. Sure, the Hopper’s got the bigger balls (literally and figuratively), but feeling that dick going off inside... Oh man.");
		}
		// Merge
		output("\n\nThe slovenly shock-bunny pulls your [pc.cock " + x + "] from her mouth, gasping for air and bouncing from the pulses in her own gently stroked dick. She falls into you muzzle-first, face overlapped by your juice-glistening prick" + (pc.cockTotal() > 1 ? "s":"") + ", licking the undersides like a voracious slut while pawing " + (pc.cockTotal() == 1 ? "its":"their") + " full length" + (pc.cockTotal() > 1 ? "s":"") + " with the adoration and visage of a born cocksleeve. That kind of dedication deserves a reward, and you ensure the underperforming L.D.C. watches as his LT is rewarded with a scritch behind the floppy ears and another mouthful of [pc.cockType " + x + "] meat. <i>“Maybe I’ll keep this bunny. You’ve got her on a good leash, and she’s good at lip service.”</i>");
		output("\n\n<i>“F-fuck, no! Don’t be that kind of pr-!”</i> L.D.C. whines, but you merely shove him back into your sweat-caked surface, moaning in mounting bliss as his tongue runs over your crotch all over again.");
		output("\n\nIt’s not just the feel of that thick muscle that has you clenching your [pc.thighs] together, it’s that you can feel his consternation behind it - that little bit of resistance tickles your dominant side, and it makes his hand-smothering balls lurch closer to orgasm. The " + (silly ? "ink-ribbun":"ink-bun") + " wants to mouth off and act tough, but he also can’t admit he fucking loves being your bitch. You can see that subby side no clearer than when you grab him by his tall ears and rein him in.");
		output("\n\nYou guide the imperious pirate down your girth until he’s kissing her right around your swollen tip");
		if(pc.cockTotal() > 1) output(", the other slaves rubbing your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " into their smooth foreheads, making sure these oversexed rabbits are thoroughly lathered in your cascading " + (pc.isHerm() ? "herm-":"") + "goo");
		output(".");
		output("\n\n<i>“Then show me why I shouldn’t,”</i> you say, glowering at the cowed boi and commanding him to <i>“Open wide.”</i>");
		output("\n\nHe grits his teeth, doing as you command seconds later. There’s no time for him to have second thoughts, because you shove your [pc.cock " + x + "] right into the jizz-flecked hole" + (longii >= 13 ? ", battering his throat just a second later":"") + ". The laquine slobbers all over you with his wriggling tongue. Perhaps that squirming flesh is begging you to fuck his face. Perhaps it’s just a desperate and inelegant attempt to get you off before you do that.");
		output("\n\nIt works - you fire off one then two shots of [pc.cumNoun] into his maw, growling to contain the sudden pleasure");
		if(pc.cockTotal() > 1)
		{
			output(", your extra dick" + (pc.cockTotal() > 2 ? "s shoot":" shoots") + " a rope " + (pc.cockTotal() > 2 ? "each ":"") + "over his head, making him look just a bit messier");
		}
		output(". You shove back and hammer his mouth, intent on fucking his throat full of the load churning inside.");
		output("\n\nThe pervy hopper stares ruefully " + (pc.cockTotal() == 1 ? "before joining him again, peppering your dripping dong with reverent kisses":"before taking your extra [pc.cockNoun " + x + "] between her lips and giving it the blowjob it’s been waiting for") + ". The black and blue bunch are helpless to attend their own needs, but the slaves are doing that for them. They sit side-by-side, eyes, tongues and lips focused on bringing you to climax. " + (pc.cockTotal() == 1 ? "L.D.C. rubs":"They rub") + " circles into your [pc.hips]");
		if(longii < 7) output(", moaning");
		else if(longii < 16) output(", gargling");
		else output(", choking");
		output(" as you thrust a few more unrelenting inches into " + (pc.cockTotal() == 1 ? "him":"them") + ". The slut-bun’s cheeks hollow in loud and submissive suckles" + (pc.cockTotal() > 1 ? ", the trained throat of his militant bottom-bitch contrasting well with his virgin neck":"") + ".");
		output("\n\nPraise for the cock-burdened bunny’s aggressive fellatio tumbles out of your mouth. He manages to keep his mismatched eyes open the whole time even while his head is on autopilot and focused on tending your [pc.cock " + x + "]. You slam into " + (pc.cockTotal() == 1 ? "his face":"their faces") + " with stunning strength, the helpful harem keeping the libidinous laquine" + (pc.cockTotal() > 1 ? "s":"") + " steady so that you might admire your prizes better. Thick and hot air hisses through their lips, making the veins on your [pc.cocksLight] distend. You’re all too happy to reciprocate the energy, now scratching both of their heads as your pace falls apart into wanton glee.");
		output("\n\nThe blue-bun’s eyes cross and seal shut. Her whole body squirms and humps in the throes of orgasm - the herm-boss’s cock has taken full control of her brain. A powerful gout of cum squirts into the air and rains down on a few slaves. That brace of girl-dick is aimed away from you by the slaves who ease out the modded-up loads churning out of her scent-billowing maleness in long gouts of familiar stickiness.");
		output("\n\nL.D.C. isn’t too far behind, but it’s the unique cock-pleasing spasms of his throat that leave it up to galactic forensics to decide who shot first. " + (pc.cockTotal() == 1 ? "The bunny boy is":"Both bunnies are") + " shoved down onto your " + (pc.cockTotal() == 1 ? "[pc.cockNoun " + x + "]":"[pc.cocksLight]") + " ");
		if(pc.balls > 0) output(pc.cocks[x].cLength() <= 16 ? "balls-deep":"nearly balls-deep");
		else output(pc.cocks[x].cLength() <= 16 ? "hilt-deep":"nearly hilt-deep");
		output(" just before your spunk-tanks begin to drain.");
		output("\n\nA torrential ocean of bunny batter fires ");
		if(!pc.hasCuntTail()) output((pc.legCount > 1 ? "between your [pc.legs]":"down") + ", splattering the kitty-girl behind you and painting a wide cone of the room white with laquine virility");
		else output("into the depths of your [pc.cuntTail] to places unknown, distending the green-skinned alien with the virile treat it so desired. Until it’s shot right off his dick and left disgustingly obese with rabbit-seed");
		output(".");

		// PC low cum
		if(cumQ < 25) 
		{
			output("\n\nAlthough the mouth" + (pc.cockTotal() > 1 ? "s":"") + " around your [pc.cocks] suck with the power of a pussy, your [pc.balls] " + (pc.balls > 1 ? "don’t":"doesn’t") + " have the necessary amounts of [pc.cum] to adequately reward your cocksucker" + (pc.cockTotal() > 1 ? "s":"") + ".");
			output("\n\nYou’re not certain if " + (pc.cockTotal() == 1 ? "he notices":"they notice") + " though, not with their eyes rolling back as they blow their own mighty loads onto the floor. Your numb manhood" + (pc.hasCocks() ? "s":"") + " churn out terran-typical ropes of spunk into " + (!pc.hasCocks() ? "his":"their") + " throats, the [pc.cumVisc] loinfruit trickling into their stomachs until you’re all out - which doesn’t take long.");
			if(pc.hasCocks()) output(" Your extra member" + (pc.cockTotal() > 2 ? "s dribble":" dribbles") + " sympathetically over their brows, leaving easily washed or licked off marks.");
		}	
		// PC plenty of cum
		else if(cumQ < 1000)
		{
			output("\n\nGood cocksuckers get filled bellies, and you’re all too happy to reward the lawless laquine" + (pc.hasCocks() ? "s":"") + " with your [pc.cum]. Hot flashes precede every throat-swelling eruption inside. You’re not entirely sure if " + (pc.hasCocks() ? "he’s":"they’re") + " noticing the streamers of [pc.cumVisc] spooge your tensing [pc.balls] " + (pc.balls <= 1 ? "is":"are") + " unloading into " + (!pc.hasCocks() ? "his":"their") + " throats. There’s enough volume to fill " + (pc.hasCocks() ? "their stomachs and rewrite their":"his stomach and rewrite his") + " sense of taste.");
			output("\n\nThat’d be fitting. Knowing " + (!pc.hasCocks() ? "he’ll":"they’ll") + " probably be tasting you hours after you leave helps put a bit more strength in your rhythmically contracting ");
			if(pc.balls < 1) output("prostate");
			else output("nad" + (pc.balls > 1 ? "s":""));
			output(".");
			if(pc.hasCocks()) output(" They certainly won’t be able to shake your presence with the amount you’re dumping on their heads.");
		}
		// PC lots of cum
		else if(cumQ < 25000)
		{
			output("\n\nWickedly powerful pangs of pleasure assault your brain. Intense orgasmic pressure forces itself to the forefront of all your thoughts to help you revel in the sheer volume of [pc.cum] you’re pumping into the lawless laquine" + (pc.hasCocks() ? "s":"") + ".");
			output("\n\nThe rhythmic contractions in your [pc.balls] tell" + (pc.balls <= 0 ? "s":"") + " you when " + (!pc.hasCocks() ? "his neck":"their necks") + " bulge" + (pc.cockTotal() == 1 ? "s":"") + " with stomach-filling loads - and " + (!pc.hasCocks() ? "it does":"they do") + " fill out. L.D.C.’s body takes on a spherical shape" + (pc.hasCocks() ? " while the Hopper has a more defined spunk-bump":"") + ". Realizing you’re not stopping, especially as [pc.cumNoun] spurts from " + (!pc.hasCocks() ? "his":"their") + " nostrils, you pull out and shower " + (!pc.hasCocks() ? "him":"them") + " with the rest, painting " + (pc.hasCocks() ? "them":"him") + " [pc.cumColor] with a lasting impression of you.");
		}	// PC monstrous cum
		else
		{
			output("\n\nThere’s a breathtaking... <b>halting</b> feeling of pleasure swirling like a storm inside.");
			output("\n\nLike a wine bottle being uncorked, your [pc.cocksLight] <i>flood</i> " + (!pc.hasCocks() ? "L.D.C.’s":"the lawless laquines") + " guts with [pc.cum] in ruthless quantities. What you feel in your [pc.balls] is an aggressive tightness that no amount of massaging can quell.");
			output("\n\nOnly a pathetically faint groan seeps between your [pc.lipsChaste] as " + (!pc.hasCocks() ? "his":"their") + " stomach" + (pc.hasCocks() ? "s":"") + " swell to full with [pc.cumVisc] spooge, filling with so much that by the time you recognize you’re on your fifth cumshot it’s squirting back up " + (!pc.hasCocks() ? "his mouth and nose":"their mouths and noses") + ". You drag " + (!pc.hasCocks() ? "him":"them") + " off your virility-blasting dong" + (pc.hasCocks() ? "s":"") + " and give the two a facial they’re not soon to forget, painting their heads and bodies [pc.cumColor] with a blanket of enviable sperminess. Laquines are a musky race, but being that thoroughly basted, you’ve probably rewritten their signature to yours.");
		}
		// Merge
		output("\n\nIt almost hurts to breathe, but you’re calming down well enough. Your orgasm reduces to a few relaxing dribbles. The slaves dutifully clean your [pc.cocksLight] before you collect your things. You’re soon left staring at the sex-coated bunnies who lie back heaving and panting, every hair of fur on their bodies dripping with sweat and " + (cumQ < 1000 ? "some":"a lot of") + " spooge. The ones at the top have themselves been utterly claimed.");
		output("\n\nQuite a satisfying conclusion.");
		output("\n\n<i>“That wasn’t bad...”</i> the Hopper murmurs, looking at you with a small twinkle in her subby eyes.");
		output("\n\nL.D.C. scoffs, <i>“Speak for yourself, babe.”</i>");
		output("\n\nYou crane your body and stretch, thinking it’s time to move on and claim your inheritance. Hopefully you’ll get those mouths hopping to action again someday. They make a great team!");
		processTime(35);
		enemy.loadInMouth(pc);
		pc.orgasm();
	}
	// PC chose vagina, not taur
	else if(!cockUse && !pc.isTaur())
	{
		output("\n\nRegardless of how he feels, you still tug the pussy-loving bunny into action. If he’s feeling perky about this, then he can get his tongue right in there!");
		output("\n\n<i>“Mmf,”</i> he mewls, twitching nose burrowed in your ");
		if(pc.vaginas[0].wetness() < 3) output("juice-glazed");
		else if(pc.vaginas[0].wetness() < 5) output("slathering");
		else output("beautifully soaking");
		output(" [pc.pussyNoun]" + (pc.balls > 0 ? " beneath your lifted ballsack":"") + ". Both of the L.D.C.’s paws wrap around your [pc.thigh], desperate to show how eager he is to lap at your " + (pc.vaginalPuffiness(0) > 0 ? "puffy ":"") + "delta. It’s almost cute how gingerly he applies pressure to [pc.oneClit]");
		if(pc.totalClits() > 2) output(", and then the rest");
		else if(pc.totalClits() == 2) output(" and then the next");
		output(", pressing down and rubbing in circles of vaginal appreciation. <i>“I could do this and more, ‘ya know!”</i> he grins, speaking in his smooth voice, licking roughly across the surface of your loins. <i>“You’re a big tough [pc.guyGirl], you need a good licker down here. After this you’ll be looking for me to do it again!”</i>");
		output("\n\nCharmer.");
		// Suula Pussy
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nHis earlier reticence at inhaling your pussy disappears in a few venom-soaked stings from your alien cunt. Powerful and increasingly lusty groans crawl through the cock-rabbit’s throat; a waterfall of frothy of saliva pours down his chin, his brain probably incapable of handling that sensorygasm. So potent is your chemical rush that inches add quicker to his rapidly growing dick.");
		// Merge
		output("\n\nThe Hopper also leans in, anxious to press her glossy lips into pussy-service. She spreads the labia of " + (pc.hasVaginas() ? "one":"your") + " [pc.pussyNoun], planting her tongue beneath the pretty slit to catch the [pc.girlCumFlavor]-flavored " + (!pc.isSquirter() ? "drizzle":"shower") + "; you grip her head and hair for support, yelping when her boss dives in right next to her. The hungry hares kiss and draw a variety of shapes in your [pc.vaginaColor] interior, pushing back against the " + (pc.vaginas[0].hasFlag(GLOBAL.FLAG_NUBBY) ? "nubby ":"") + "walls of your rapidly clenching tunnel - they’re trying so hard to get you to cum");
		if(pc.totalVaginas() > 1) output(", they’re even slipping their thumbs and fingers into the other juicy entrance" + (pc.totalVaginas() > 2 ? "s":"") + " you have");
		output(".");
		output("\n\nSlack-jawed and incredibly obedient, the blue-bun abates when you grip both upright ears, pulling her to the side so that the rabbit boy can work more of his oral magic.");
		if(pc.balls > 0) output(" You let her play with your [pc.sack] in the meantime.");
		else if(pc.hasCock()) output(" You let her play with your [pc.cock] in the meantime.");
		output("\n\nThe dusky laquine’s muzzle smashes into your nether regions until his cheeks are scissored between the supple fat of your [pc.thighs]. The harder his tail wags, the more inches get added to his mammoth horse cock! <i>“Good boy,”</i> you pet the horned up pirate behind the floppy ears, fingers creasing the soft surface of his head, <i>“you’re gonna be there awhile. Get cozy,”</i> you titter, rocking him back and forth across your ambrosial slit" + (pc.totalVaginas() > 1 ? "s":"") + ", ready to fuck his muzzle properly.");
		output("\n\nHe doesn’t mind one bit.");
		output("\n\nL.D.C.’s tongue spears your cunny again, foraging deeper without his XO vying for space - " + (!pc.hasCock() && pc.balls == 0 ? "you’ve got her":"she’s") + " working on your [pc.legOrLegs] now, diligently massaging and licking around your body with that overwhelmingly pliant tongue.");
		output("\n\nYour [pc.hands] fall away from L.D.C.’s head and you thrust your crotch out into him, an empowering feeling of dominance twisting around your spinal cord. The strength of pleasure you feel is enough to paralyze your limbs, but the helpful harem is there to steady your shaky frame" + (pc.hasCock() ? ", gently stroking your bobbing [pc.cocksLight], maintaining a tentative, blissful balance":"") +".");
		output("\n\nIn the next thrust of laquine tongue, your sense of control is all but lost. The Jumper’s top bun is unconcerned with anything that isn’t playing in the deepest recesses of your tightening twat, drawing out the freshest, tastiest drops of girlish excitement. Grinding cunny walls close in around his aggressive invader, intent on teasing him while he works. Your squelching pussy must be wondering why it’s squeezing a tongue and not that slab of bunny-cock growing and growing below, coming close enough to touch his chin were your [pc.ass] not in the way.");
		output("\n\nYou’re moaning to his mesmerizing motions now, loud when he pushes deeper, and quiet when he slobbers on your exterior. In the moments he catches his breath, you cheekily force him back into it, watching a smile spread across his pussy-drenched face every time. The snickers that rumble up his painted throat are just part of his pleasure package. You practically forget that he’s a pirate of some make, that you probably can’t trust him-");
		output("\n\nWell, that’s not true technically. <i>You can trust him to suck cunt like a star!</i>");
		output("\n\n");
		if(pc.wetness(0) < 3) output("So ravenous is the pirate boss that he keeps your mons glistening with spit and sweat more than your own juices, all slurped up by his greedy mouth.");
		else output("For however ravenous the pirate boss is, even he can’t keep up with the tides of [pc.girlCumVisc] femjuice streaming down your [pc.legOrLegs] and his warm cheeks. You spot a curious look in his eye, one of slight shame, but mostly of incandescent satisfaction at having his head-fuzz impregnated by femspunk.");
		output("\n\nWith a pitiful whine, the cream-colored XO gazes up, nuzzling her head towards your [pc.pussies]. " + (enemy.HP() > 1 ? "She unzips her orange suit":"She pulls the remnants of her suit off") + ", baring her beautiful, creamy breast to you. She suckles at " + (pc.totalClits() == 1 ? "your [pc.clit]":"one clit, then the other") + ", unable to get her lips around " + (pc.totalVaginas() > 1 ? "any of ":"") + "your dripping femininit" + (pc.totalVaginas() == 1 ? "y":"ies") + "." + (pc.clitLength >= 4.5 ? " You consider forcing her down your clitoral fuck rod, but she seems so desperate!":"") + " Their cocks are so turgid that two slaves who’ve snaked behind them are jacking those prideful boners with casual ambivalence, keeping them aimed down." + (enemy.lust() >= enemy.lustMax() ? " However, the azure slut can’t keep it in her gurgling balls, and musky laquine cum shoots weakly or dribbles out of her cock. It’s only a sign of things to come.":""));
		output("\n\nSighing softly, and knowing you’ve got their bed warmers backing you (quite literally), you " + (pc.legCount > 1 ? "hike a [pc.leg] over her shoulder, letting the girls behind you prop and feel you up":"move your [pc.leg] as far back as you can, arched back as if you were reclining in a chair") + ". In this position, your crotch is fully exposed - like this, those lusty laquines can devote themselves to the most pious worship at your altar.");
		output("\n\n<i>“Fucking hell, you taste great <b>and</b> you’re a bit creative too,”</i> L.D.C. compliments, chewing his lip with your [pc.girlCumNoun] plastered over his matted face. <i>“I guess I don’t mind that you’re on top. I’d love to make you scream whenever I want, but this is nice. Of every pussy I’ve had in my face, I think yours is the best.”</i>");
		output("\n\nA giggle lurches up your throat, you can’t really respond far away in bliss as you are. Tongues work their way through your pussy back and forth like rowing oars while noses grind into and deflect off your [pc.clits]. There’s a bit of strain in your back and waist, but those keeping you afloat on your cloud of euphoria massage it away, leaving you to enjoy the obeisant adorations of the Jumper leadership.");
		// PC big clit
		if(pc.clitLength > 1)
		{
			output("\n\nYour so-sensitive [pc.clits] stick" + (pc.totalClits() == 1 ? "s":"") + " out obscenely, and your two pussy-sluts don’t shy away from teasing those engorged bulbs of pleasure. You clench. You can’t help it, you shake so violently when they grip or lick " + (pc.totalClits() == 1 ? "that button":"those buttons") + " of body-convulsing nerves. You like it most when L.D.C. curls his tongue around " + (pc.totalClits() == 1 ? "it":"them") + ".");
			// PC cocksize clit (add-on)
			if(pc.clitLength >= 4)
			{
				output("\n\nYou cum again, another one for the puddle accruing on their faces, when a hand clenches around the pseudo-cock of feminine flesh. That tumescent rod of girlish pleasure, never meant to grow so obscenely, is expertly jerked like " + (!pc.hasCock() ? "a cock":"your [pc.cockNoun]") + " in the paws and hands of those to your front. Lightning strikes of pleasure assault your brain from every direction, only making you lean further back in lurid delight.");
			}
		}
		// Merge
		output("\n\nThe Hopper " + (pc.legCount > 1 ? "shoulders your leg":"holds you steady") + " with all the strength a domme bunny can muster, her tongue swishing with near-mechanical speed. She catches up to her captain’s level of twat-pleasing performance in no time, eager to show you how well she can treat your [pc.pussyNoun].");
		if(pc.balls > 1)
		{
			output(" She doesn’t leave your [pc.balls] alone. The zap-rabbit moans louder when she handles those sumptuous spunk-weights that rest atop her furry head, wearing your ");
			if(pc.hasStatusEffect("Uniball")) output("taut");
			else if(pc.ballDiameter() < 3) output("weighty");
			else if(pc.ballDiameter() < 7) output("bloated");
			else output("heavily sagging");
			output(" ballsack like a hat. They’re so swollen they funnel between her twitchy ears, contracting between her upright floppers.");
		}
		output("\n\nInstead of letting your hands fall limp, ");
		if(pc.biggestTitSize() >= 1)
		{
			output("you steal touches at your [pc.breasts]" + (pc.canMilkSquirt() ? ", squirting [pc.milk] into the air, all over yourself and your attendants in a perverse, tasty display":""));
		}
		else output("you reach down and help, grasping for an ear or a clit to rub.");
		output(". Your [pc.pussies] rob" + (pc.totalVaginas() == 1 ? "s":"") + " your entire body of muscle control, trapping " + (!pc.hasVaginas() ? "its":"their") + " invaders in your leaky quim" + (pc.totalVaginas() > 1 ? "s":"") + " and slathering them with new coats of femslime. The moans you’re loosing turn to fevered wails as sweat trickles down your neck in saccharine detail.");
		output("\n\nLaquine pelt soaks up the excess of passion drooling down below as a hotter air consumes your mind. The entirety of your femininity " + (pc.hasCock() ? "and your masculinity ":"") + "is serviced and stimulated; no inch is left unstimulated. All of a sudden it becomes too much to bear - you cry out. The slaves praise your spasms and convulsions, all doing their part to help you ride out the most explosive of your many orgasms." + (pc.hasCock() ? " Your [pc.cocks] are stroked delicately, sympathetic loads of [pc.cumNoun] eased out into waiting hands and mouths. It’s not nearly as powerful as your real climax.":""));
		output("\n\n[pc.GirlCum] floods out of your tunnel" + (pc.hasVaginas() ? "s":"") + " with such depravity and force that you can’t believe you’ve gotten this wet. ");
		if(!pc.isSquirter()) output("You squirt just a little, the rest coming out in mighty rivers.");
		else output("You squirt, and you do it harder than you have in recent memory.");
		output(" L.D.C. grips you tighty by your [pc.hips] and plays you like an accordion, wringing every drop of aromatic girljuice from your folds in long muscle-bowing motions, molding your cunt to the shape of his pussy-hungry muzzle in the process.");
		output("\n\nThe flaring bunny boy, a veritable fiend for [pc.pussyNoun], works himself into a frenzy to catch everything, cock detonating like a bursting geyser onto his girls - the mohawked rabbit’s blasting just as hard. You cover your face, knowing that every searing hot flash you feel is another " + (pc.isSquirter() ? "wave":"bolt") + " of divine ecstasy you’re spraying out on them, and that no matter what they’re firing back it’s nowhere near as pleasurable as your bliss-infused cumshots.");
		output("\n\nYou cough as you’re set down outside the puddles of white the Jumpers shot out across the room, left to catch your breath under the sultry gazes of the animal-eared girls and their masters... All you can do is sigh happily.");
		output("\n\n<i>“Shit, that was fun,”</i> L.D.C. mutters, looking utterly smug and pleased with himself. He winks when you glance at him, collecting another load of girlhoney and licking it from his finger with a satisfied huff.");
		output("\n\n<i>“Y-yeah... I guess so,”</i> his creamy second-in-command murmurs.");
		output("\n\nWhen you’re able to stand, you smile widely, staring at the [pc.girlCumNoun]-glazed bunnies, glassy-eyed, panting, and almost totally drenched after their service of you. When you gather your things, you do so with renewed strength, and a perfectly clear mind as to the matter of your business here.");
		processTime(35);
		enemy.girlCumInMouth(pc);
		pc.orgasm();
	}
	//[Next]
	// PC chose cock, taur
	else if(cockUse)
	{
		output("\n\nYour [pc.cocks], still semi-erect, " + (!pc.hasCocks() ? "has its safety":"have their safeties") + " switched off when one of the pirates grips your ballooning [pc.cockHeadNoun " + x + "] from either side. You feel a pair of very eager lips clamp down around your cumslit and <b>suck</b>. That word doesn’t do justice to the kind of inhalation taking place - those lungs are dedicated to milking cum!");
		output("\n\nIt can only be the taser-bunny. Fuzzy paws run up and down your " + (pc.cocks[x].cLength() >= 16 ? "prodigious ":"") + "length as those smooth pillows stretch around your head. The lovely swishing of a tongue follows, tracing all along your [pc.cockType " + x + "] shape. You fixate on that undulating muscle, grunting and gasping when it coils around your throbbing girth in ever-changing ways. <i>“Nice, you’ve got a good cocksucker for an LT, bunny boy!”</i>");
		output("\n\nYou sense the begrudging laquine sidle closer. Perhaps he’s spurred on by the slaves moving in to ensure their cooperation, or perhaps put in his place by the sheer amount of musk you’re outputting. Either way, he’s starting off clumsily. His touches are hesitant, tentative, and he’s not even licking. Still, your dick doesn’t care where the pleasure comes from, it only cares about rewarding its servants with the fat loads inside it.");
		output("\n\nThe oily laquine’s cautious and decidedly <i>resistant</i> gropes smear cock-drool all along your blunt hardness. He operates with a degree of care and efficiency you expect from someone who totes around the kind of meat he’s packing. You hear a zipper tear open and the Jumper’s XO moaning around your powerfully spurting prong. The pop of her lips disentangling from your pulsing shaft is audible throughout the room. Arcs of pleasure fire up through your spine, sprinting along your extended ‘tauric-half.");
		output("\n\nWith how <i>drenched</i> you feel downstairs, you get the feeling their fur is halfway to being thoroughly rinsed with precum. You order them to suck, to get their tongues on there" + (pc.isAss() ? ", and that you’re not going to ask again":"") + ". The beaten and subby Hopper obeys immediately, her jaw stretching wider to better please your manhood" + (pc.hasCocks() ? "s":"") + (pc.cocks[0].cLength() >= 24 ? " She can’t take your prick all the way, but a good chunk of your dong still pounds the tonsil at the end of her very fuckable mouth":"") + ".");
		// PC breasts
		if(pc.biggestTitSize() >= 1)
		{
			output("\n\nYou drag your [pc.hands] over your [pc.breasts], casually fondling those ");
			if(pc.biggestTitSize() <= 3) output("perky lumps");
			else if(pc.biggestTitSize() <= 25) output("jiggly melons");
			else output("mountainous marshmallows");
			output(" at a lust-fueled pace. You rub towards your [pc.nipples], squealing happily when those sensitive teats react pleasurably to the rhythmic scything of your digits. ");
			if(!pc.isLactating()) output("No milk squirts from your jugs, but a pleasure girl is all too willing to step forward and help handle your " + (pc.biggestTitSize() <= 3 ? "petite":"generous") + " bosom.");
			else output("[pc.Milk] squirts out to the floor and the slack sheets, and " + (pc.totalBreasts() == 2 ? "two":"several") + " pleasure girls step forward to help relieve you of your sloshing reserve. It’s a service you gladly accept. Getting milked by others is positively divine compared to self-service!");
			output("\n\n[pc.Arms] behind your head, you thrust your boobs into silken hands. Bubbly feelings surface and float away, their passage making you giggle and moan in equal measure. Those fingers sink into your sweat-slick titflesh" + (pc.isLactating() ? ", coaxing more [pc.milkNoun] out into waiting mouths":"") + ".");
		}
		// PC no breasts
		else
		{
			output("\n\nYou fold your arms, huffing and swiveling in delight at the ministrations taking place below. You run your [pc.hands] your sensitive [pc.skinFurScalesNoun] until a particularly busty pleasure-girl catches your eye by her triangular fox ears. She responds graciously to your request, coming forward to let you play with her chest while she massages your [pc.arms], cooing close to your ear. When you squeeze her teats, strawberry milk flows from her sugary chest into your palms and then into your mouth.");
			output("\n\nYou bring her even closer" + (pc.tallness > enemy.tallness + 10 ? ", lowering yourself":"") + " to hoist the short and stacked vulpine harem-mate up in your [pc.arms]. She cradles your head to her chest, hands clasped behind your neck, giggling while giving you free rein over her glistening skin and dribbling teats. Her forgiving chest gives way to your [pc.lipsChaste] and [pc.tongue]; refreshing pink cream pools in your mouth between breaths, and you gleefully gulp down every throat-stretching batch.");
		}
		// Merge
		output("\n\nYou grunt and thrust forward, your hind-legs planting and driving the crown of your [pc.cock " + x + "] into a moist cavern. Soft mewls reach your [pc.ears], horny voices curling around your ear-tickled flanks in sultry hisses. The rest of the pleasure girls move in down there, stroking but not sucking, leaving that job to their masters. ");
		if(pc.hasCocks()) output((pc.cockTotal() == 2 ? "Your":"An") + " extra dick is guided to another mouth, likely L.D.C’s, and the bunny boss is encouraged to take what he can.");
		output(" There is an audible <b>smack</b> down below. <i>“Damnit, fine!”</i>");
		output("\n\nFamiliar sensations and wettening stimulations make your [pc.cocksLight] throb angrily. Focus on your top-half disappears in the sublime pleasure of being serviced out of sight. Gentle hands and smooth paws find new and increasingly depraved ways to please you and every vein on your pre-spilling tumescence.");
		if(pc.balls > 1) output(" Your [pc.balls] clench and wobble in the shadow of your [pc.cockType " + x + "] tower" + (pc.hasCocks() ? "s":"") + ", bloating and swelling. Every nut inside and almost every inch of supple ballflesh is kissed and nuzzled with saccharine affection, the residual lipstick like a mark of obedience.");
		output("\n\nThe harem-girls relay what their master and mistress are doing, how they react to a mouthful of your pole, cooing that the two are on their knees and worshiping your blunt hardness as if they were naturally suited to the job. Their voices are lost in the fog of intoxicating laquine pheromones.");
		output("\n\nYou slap forward again, tickled by the twitching ears that fold and tilt beneath. The shock-slut’s mouth struggles to handle just a few inches of your [pc.cockType " + x + "] pole as the temperature rises. The bunny duo trace every bulge when your heartbeat bobs their heads, sucking harder, sucking slower. Your front legs give out and you fall into a mindless rut, rearing back and thrusting in desirous motions. [pc.Hips] swivel, gyrate; they lurch to swab the mohawked rabbit’s mouth with greater quantities of cock.");
		// PC cunt tail
		if(pc.hasCuntTail()) 
		{
			output("\n\nFeverous lust translates desire to your [pc.cuntTail], and it stretches itself almost painfully to reach the dicks below you. Considering L.D.C. has a two-foot dick of delicious horsemeat, its choice is nothing but wise.");
			output("\n\nThe spreading of your cum-hungry tail’s alien lips is like the opening of any of your orifices - slow, deliberate, and anticipatory. The amount your cunt-tail drools is born in disbelief that it has such a dick to itself. When it wraps around his flaring tip his scream is muffled by your [pc.cockNoun " + x + "], and he fires a load or two into your tail. The rhythmic gulping of that cum-lasso only makes you howl in shared pleasure.");
		}
		// PC has pussy
		if(pc.hasVaginas())
		{
			output("\n\nKeen on servicing your feminine half, an adventurous slave girl shuffles to your upraised and slightly thrusting rear end. You look back to see the ausar babe " + (pc.buttRating() < 10 || pc.tone >= 66 ? "planting":"sinking") + " her hands " + (pc.buttRating() < 10 || pc.tone >= 66 ? "on":"in") + " your [pc.ass] and smashing her face into your [pc.pussy]");
			if(pc.totalVaginas() == 2) output(", a hand also moving to attend the other slit");
			else if(pc.totalVaginas() > 2) output(", those hands moving to attend the other slits");
			output(".");
			output("\n\nHer long tongue rolls around a needy [pc.clit] at the same time it dives into your [pc.vaginaColor] cunt. Happy for the attention, your silken [pc.pussyNoun] seals around her muscle and rewards her with a fresh stream of [pc.girlCumNoun] that dribbles from her chin in fragrant strings of girlmusk.");
		}
		// Merge
		output("\n\nPreseed doesn’t just dribble from your rapidly thumping [pc.cocksLight], it squirts like cum. A gasp for air signals to you again that one of the bunny-pirates below has come up for air to be replaced by the other. During the interim, you can tell from the lurid squelches below that you’re making a big mess on the floor, but especially on them. The wetness of their spongy, cum-slick fur is evident even when your numb and overheating [pc.cocksLight] glance off their lubed frames.");
		output("\n\nYour arousal soars while you slump. Slaves and laquines stumble to catch up with your shift in position as you hump away at those mouths and hands. It takes a strong effort to not blow prematurely, trying to build all the arousal you can before you repaint their coats. You grit your teeth, mouths swap; every rope of spit and pre that drips is something you know is happening. The only room and comfort they get is what’s necessary to suck your dick like the whores they keep.");
		output("\n\nImagination keeps you going higher and louder. You wonder what the muzzled pirates look like when you distend their throats in sequence or bulge inside their cheeks. There’s so much resistance and a little bit of choking, but you don’t care. You can’t care. All that matters is that this room of people is devoted to one purpose: pleasing you. You and your [pc.cocksLight].");
		output("\n\nEverything that isn’t your wriggling [pc.cockNoun " + x + "]" + (pc.balls > 0 ? " or your trembling ballsack":"") + " doesn’t matter. It’s coming, you can feel it. The pressure inside, your cum-vein - it widens automatically, expecting the first powerful load to surge through it any second now. You let slip a low breath, a pause where the moist sounds of cock-pleasing and girlish simpering fill your [pc.ears].");
		if(pc.hasVaginas())
		{
			output(" Your [pc.pussies] tighten" + (!pc.hasVaginas() ? "s":"") + " and tense" + (!pc.hasVaginas() ? "s":"") + ", a rush of [pc.girlCumNoun] flows from your slit" + (pc.hasVaginas() ? "s":"") + " in the onset of orgasm.");
		}
		if(pc.hasCuntTail())
		{
			output("\n\nYour [pc.cuntTail] latched onto L.D.C.’s meat is fed in powerful cumshots from the dark-furred boy, and its body distends obscenely as it wrings out every drop in those massive nuts of his. After the third eruption, it’s blown right off his dick by the sheer volume of his elephantine ejaculation.");
		}
		output(" It’s all enough to make you cum.");
		// PC less cum
		if(cumQ < 10000) 
		{
			output("\n\nWhen the first rope of [pc.cum] surges through your bulging urethra, you’re not sure whose mouth its going in. More follow" + (pc.balls > 0 ? ", forced out by your [pc.balls], tensing from every massage and coaxing stimulation":"") + ". Numbed by the weight and force of your climax, you get the distinct feeling that your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " being moved, that while your [pc.cockHeadNoun " + x + "] spurts and spurts and spurts, your cum-blasts are well aimed.");
			output("\n\nYou’ve no doubt filled the L.D.C’s mouth, and that of his lieutenant’s. What it feels like now is all you’ve got being poured out on them, marking them almost permanently with your dribbly spooge. Every shot now, every impelling thrust against their own detonations makes you cry out in ecstasy. It only lasts for a short and so very blissful time, but that sensitivity takes ages to die down.");
		}
		// PC more cum
		else
		{
			output("\n\nYou don’t know whose mouth you’re lodged in, but there’s a sharp choke and gargle when the first splash of [pc.cum] shoots into their maw. Laughter follows, and the raw sensitivity of your pulsating dong tells you that it’s being directed. Another pair of lips is forced around the [pc.cockHeadNoun" + x + "] for only a few seconds, likely the thus far unwilling L.D.C. They cry out in their own orgasms, voices muffled by the continent-devouring spunk tsunami you’re basting them with.");
			output("\n\nEvery shot of [pc.cumNoun] and every impelling thrust afterward is wholly dedicated to drenching them, firing off enough spunk to feed a galotian for a week or two. " + (pc.balls > 1 ? "Your [pc.balls] are massaged, made to clench even harder as you cum hard enough to spasm all over. ":"") + "Every flash of pleasure and every squeeze in your loins tells you that you’re doing only one thing: hosing the L.D.C. and his favorite blue-bun down until they’re little more than walking spooge-figures.");
			output("\n\nFor all that your [pc.cocks] are firing, it seems to last forever. Even when your body soothes to a relaxing dribble, those last ejaculations have the effects of the first. The might of your climax all but demands you rest afterward.");
		}
		// Merge
		output("\n\nWhen you’re done unloading on the hapless duo, strength returns to your limbs and you step away from the oral orgy, finally able to take in the crestfallen jumpers.");
		output("\n\nOversized dollops of passion leak from their ears, their cheeks and chins. Their own dicks vibrate and bounce in the wake of their unfulfilling orgasms, and all they can do is pant and wipe their faces of your [pc.cumVisc] loinfruit.");
		output("\n\n<i>“F-fucking hell,”</i> L.D.C. grouses, <i>“I’m not letting that happen ever again.”</i>");
		output("\n\n<i>“Maybe if you helped...”</i> the Hopper whispers almost acidically.");
		output("\n\nAfter you gather your things, you look over the two and decide what to do next.");
		processTime(35);
		if(pc.biggestTitSize() >= 1 && pc.isLactating()) pc.milked();
		if(pc.hasCuntTail()) feedCuntSnake(enemy);
		pc.orgasm();
		output("\n\n");
	}
	// PC chose vagina, taur
	else
	{
		output("\n\nDespite his position, the pussy-loving bunny boy is no less eager to begin. You sit yourself down on him, smashing his muzzle into your hind quarters and penetrating yourself on his fuzzy snout. While you spasm in the sudden joy it brings, his legs kick. L.D.C. nearly recoils, struggling to grip your [pc.ass] and steady himself");
		if(pc.totalVaginas() > 1) output(", though " + (pc.totalVaginas() == 2 ? "one paw":"his paws") + " slide into your other slit" + (pc.totalVaginas() > 2 ? "s":""));
		output(".");
		output("\n\nYou can hear him slobbering across your [pc.pussy]" + (pc.vaginalPuffiness(0) >= 1 ? ", in awe of how much cunt there is to work with":"") + ". His tongue works with near mechanical speed to slurp up all of the slimy drawstrings leaking from your twat" + (pc.hasVaginas() ? "s":"") + " across his face like perverse rope.");
		output("\n\nThe Hopper’s paw settles over your [pc.clits], rubbing roughly across your sensitive buds and your sodden nethers. You feel that twitching nose of hers settle into your mons, breathing in your rich scent while those ticklish ears of hers bounce back and forth against your backside.");
		output("\n\n<i>“Fuck, I don’t think my mouth is good enough for this. Hey, why not let me just put this bad boy in?”</i> You watch him pat the fattening equine club between his thighs. <i>“Really stretch ‘ya, show you the kind of time that a big [pc.guyGirl] like you deserves?”</i> L.D.C.’s motions shift to ginger strokes of vaginal appreciation. When he pinches your pleasure-button you splatter his face with a mini-orgasm, leaving the smear of [pc.girlCumNoun] across his oily brow. Upraised lapine ears flex beads of tangy discharge into mist; he shakes his head, laughs, and dives back in, clearly enjoying the O-face you just made.");
		output("\n\nYour cunny, however, seems like it’d really enjoy taking him up on his offer.");
		// Suula Pussy
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
		{
			output("\n\nThe jumper duo’s reticence at tending your alien pussy disappeared a while ago. The venom-bearing tentacles poking like branches through your labial folds assault the furry cunt-lickers with gusto when they close in again. Lustful bellows crawl through their throats; thick ropes of spit and girl juice rain down their chins as they try to work with the liquid lust coursing through their surely-sensitive lips and throughout their bodies.");
		}
		// Merge
		output("\n\nGlossy lips are pressed into pussy-service. The now-obedient zap-rabbit who attacked you the moment you stepped in burrows her face into " + (pc.hasVaginas() ? "a":"your") + " [pc.pussyNoun], tongue tracing around the creases and folds of your sopping wet delta. Another wave of [pc.girlCumNoun] is dispensed when she pries apart your lower lips, and her thick tongue is already rolled out to soak it all up. What she doesn’t catch easily mats the creamier parts of her fur or becomes another layer of moisture for her squeaky suit. Their tails wag " + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? "with as much ferocity as your own, winding around each other":"so happily that they blur and wind around each other") + ".");
		output("\n\nTotally slack jawed, the horny hares work to cup every inch of your drooling box with their mouths. Tongues lance inside, gaining inches as lapine cheeks hollow. Their thick muscles coil and slide across your innermost depths. You feel dizzier and dizzier with every vacuumous suction against your spit-shined mons, and when they pull away, your sensitive [pc.pussyNoun] tingles in the warm-air, already wanting its worshipers back.");
		output("\n\nThe hopped up laquines pant in excitement, thrusting themselves further into your roiling loins. [pc.GirlCumVisc] femjuice oozes out in reckless drops, trailing down your [pc.legs] and declaring its presence throughout your body. Tiny beads of moisture having that kind of effect simply rolling down your [pc.skinFurScalesNoun] is a perfect indicator for how sensitive you’ve become.");
		output("\n\nCuriously, the rapid twitchings of their noses are never far behind those relaxing crests of sonorous pleasure. You run your hands ");
		if(!pc.hasHair()) output("over your head");
		else output("through your [pc.hair], throwing your " + (pc.hairLength > 10 ? "bangs out":"head back") + " and gasping, the hew of another small orgasm lifting from your mind and rearing back for another thunderous strike.");
		output("\n\nConsumed by bliss you grind your [pc.ass] into the black and blue buns, pushing them closer to the ground and raising their dicks closer to your crotch. L.D.C.’s glorious endowment is already prodding at your underbelly, smearing pre into your [pc.skinFurScalesNoun] and throbbing almost angrily that it’s not fucking " + (pc.hasVaginas() ? "one of":"your") + " ambrosial cunt" + (pc.hasVaginas() ? "s":"") + ". <i>“You two get comfy, now!”</i> you cry, hand on your cheek, <i>“It’s only <b>just</b> getting started!’");
		output("\n\nThe slaves move in now, divesting the Hopper of her zipsuit to play with her soft tits. The licentious hands not toying with laquine boobflesh are grasping at the dark bunny’s huge member. ");
		if(pc.balls > 0) 
		{
			output("When they’re not giggling or teasing their obeisant owners, the slaves plant hot, suctiony kisses all over your ");
			if(pc.ballDiameter() < 3) output("nutsack");
			else if(pc.ballDiameter() < 12) output("quivering ballsack");
			else if(pc.ballDiameter() < 24) output("weighty, swinging nutsack");
			else output("ground-dragging ballsack");
			output(". You’re positive that there’s enough lipstick on those pillowy mouths that submissive marks are being left all over your cum-pouch.");
		}
		output("\n\nThe musk those two give off is so potent that when it wicks through your nostrils you’re getting wetter. Even from there it’s making your head spin");
		if(pc.hasCock()) output(" when it mixes with what’s spurting out of your [pc.cocks]");
		output(".");
		// PC has cunt tail
		if(pc.hasCuntTail())
		{
			output("\n\nA familiar mental force renders in your mind - the parasitic passions of your alien tail. It senses the feast arrayed beneath you, two monumentally endowed laquine dicks.");
			output("\n\nYour [pc.cuntTail] begs to slither around your body, for you to give it room to sheath one of those gorgeous laquine cocks inside itself. Acquiescing, you shuffle to grant its request, though it does put you in an awkward position. Your cum-hungry attachment gets what it wants though, able to stretch and weave enough that it closes in on the big-dicked pirate. It shares with you its course of action, and the pleasure it feels too.");
			output("\n\nSultry images swaddle your mind while it snakes towards its bounty. A hammer of euphoric fulfillment strikes your spine the moment its lips wrap around L.D.C.’s mammoth member, drawing his double-ringed prick into itself. It’s a strenuous process, and for the duration of it simply sucking in his tip, you’re a spastic mess above.");
		}
		// Merge
		output("\n\nAnother sudden realization; another orgasm. An orgasm that makes you " + (!pc.isSquirter() ? "squirt just a tiny bit":"that makes you squirt like a twisted rag") + ". It’s another reminder of how high you’re riding. Your head is in a pink cloud somewhere and the socketed laquines are suffocating on your pheromones. All you do is push back further and further, sitting on them like they’re two halves of a comfortable, fuzzy throne. Their legs and thighs wiggle against yours to find a comfortable position. It’s all in vain. Obscene groans and wails break out of your lungs as you grind your captive lickers into the floor.");
		output("\n\n<i>“Fuuuck <b>me</b>!”</i> L.D.C. exclaims, gasping for air. <i>“You taste great and you’re a wicked slut, whoever the hell you are!”</i> The " + (silly ? "ink-ribbun":"ink-bun") + " pants, nibbling a [pc.clit]. <i>“I don’t care that I’m under you. Watching you shake to my tongue even though my dick should be pulling your strings is fun. You may not be screamin’ when I want, but I’m gonna savor the taste of the best pussy I’ve ever had.”</i>");
		output("\n\nYour response is just to slam your excessively moist muff into his muzzle again. He’s not wrong, you’re at the mercy of his maw and moaning to his highly skilled motions.");
		output("\n\nThe feel of his tongue probing into your [pc.vaginaColor] interior while your quavering walls grip his hollowed cheeks is too much. That spear of flesh works its way through your pussy while the bridge of nose grinds against your labial hood, wringing your canal of tasty girl juice. He’s stopped trying to hold on to your [pc.legOrLegs] and instead keeps those paws in and around your [pc.pussies]. There’s absolutely no strain whatsoever, leaving you free to enjoy the cunnilingual adorations of the jumper leaders.");
		// PC big clit
		if(pc.clitLength >= 1)
		{
			output("\n\nYou’re forced to scream - a sensory assault washes over you that showers insanity and threatens to drown you in blissful madness. The laquine captain takes great delight in teasing your [pc.clits], more than satisfied at how large they are. You seize up when he figures out how to strum you by your clitoral button" + (pc.totalClits() > 1 ? "s":"") + ". You can’t help it. Your body loves him for it, and it especially loves when he coils his tongue around " + (pc.totalClits() == 1 ? "it":"them") + ".");
			// PC cocksize clit (add on)
			if(pc.clitLength >= 4.5)
			{
				output("\n\nThe moans of your muff-munching conquests are muffled further by yours when they take turns sucking on your feminine fuck-pole" + (pc.totalClits() > 1 ? "s":"") + ". Tongues adapt to the shape of vaginal distension, and you’re completely dazed by the astonishing pleasure darkening your vision. The frictious sucking tears your mind to pieces, leaving you grasping for something to hold onto. For once you have to pull away. <i>“Ha, couldn’t handle it, eh?”</i> L.D.C. muses, already gripping it again and jerking in his direction.");
			}
		}
		// Merge
		output("\n\nYour muscles rattle at the edge of your greatest orgasm. Lurid squelches reverberate off the walls");
		if(pc.biggestTitSize() >= 1)
		{
			output(" as you squeeze your [pc.nipples]" + (pc.isLactating() ? ", launching a steaming batch of [pc.milkNoun] into the air that splatters on the slaves to your front":""));
		}
		output(".");
		if(pc.hasCock()) output(" Your [pc.cocks] bulge" + (pc.cockTotal() == 1 ? "s":"") + " obscenely as " + (pc.hasCocks() ? "they dribble":"it dribbles") + " uselessly in the moments that follow, unloading the contents of your [pc.balls] into the hands of the waiting harem girls.");
		output("\n\nStrength waning, you fall forward, most pressure still on your back, sensing that the black-furred dildo and his creamy LT are cumming. Your [pc.pussies] feel" + (pc.totalVaginas() == 1 ? "s like a collapsing dam":" like collapsing dams") + ". Gouts of [pc.girlCum] squirt and spray into their cum-soaking fur. Vaginally-slimed pelt frigs against the entrance of your fragrance-spurting cunny. The heat generated by those feverous rubs is nothing short of divine.");
		output("\n\nEyes nearly rolling back, you embed the slut-buns in your nethers, scissoring them between the floor and your [pc.ass]" + (pc.balls > 0 ? ", masking them with your ballmusk too":"") + ". The jumpers unload onto your underbelly but mostly across their girls" + (pc.hasCuntTail() ? " after your [pc.cuntTail] is literally blown off by the high impact cumsplosion that L.D.C. just smacked it with":"") + ". The only thing carrying you through your orgasm is the force of lust pounding away at your head with every searing flash of bliss.");
		output("\n\nYou’re like a " + (!pc.isSquirter() ? "sprinkler system":"a hose on full blast") + ", every wind up and lurch back depositing another load of girlspunk on your splayed rabbits. What their spongy fur doesn’t collect, the excess runs off of the sides, puddling and spreading further across the floor. All the duo can do is sit hapless, cumming pathetically while you wail happily atop them.");
		output("\n\nBy the time it all settles down and you stand again, [pc.hands] pressed to your chest, you breathe. The pain of it all disappears in your next few shudders, regarding the self-appointed lord and lady of Zheng Shi with a smile. Their coats of fur are wholly matted in your juices and their body odors are going to be smelling of you for the weeks to come. L.D.C. doesn’t seem that upset by it either, gurgling and struggling to rise with a stupid grin writ upon his [pc.girlCumNoun]-splattered muzzle.");
		output("\n\n<i>“Fuck yeah. Nothing wrong with a good pussy kissin’,”</i> he huffs, looking much too smug about it.");
		output("\n\nThe Hopper, slack-mouthed and painted [pc.girlCumColor] whines when a slave jerks her softening dick, brought to an unfulfilling orgasm. She only manages a miserable scowl at her boss.");
		output("\n\nWhen you gather your things, the two are finally a bit more lucid. As are you. Clear of mind, you’re ready to chart your next course.");
		processTime(30);
		enemy.girlCumInMouth(pc);
		pc.orgasm();
		output("\n\n");
	}
	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["SHOCK_HOPPER_FUCKED"] = 1;
	flags["LDC_FUCKED"] = 1;
	clearMenu();
	addButton(0,"Next",postSexShockHopperVictoryEpiloggieDoggie,0);
}

//[Threesome]
// Tooltip: If all these depraved laquines do is sit around getting laid, they wouldn’t mind one last round together. One you’ll be leading, whether L.D.C. likes it or not.
// Tooltip, no penis: You’ll need a dick to stuff horny bunny butt with.
// Requires a penis. No taurs, only real races.
// Make the Hopper ride LDC vaginally, then fuck the remaining holes. You’ll pound their butts while they fuck, but if you have multidick then it’s even better. Double-stuff the hopper, too, if you’re not gigantic and have a 3rd dong. Laquines have capacious cunts.
// William
public function laquineShockyThreesomes(x:int):void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("Yeah, that’ll work. The pleasure girls deserve a good show, and your [pc.cocks] deserve" + (!pc.hasCocks() ? "s":"") + " a good time.");
	output("\n\nNodding, grinning, you " + (!pc.isCrotchExposed() ? "throw off your [pc.crotchCovers] ":"") + "and set your [pc.weapon] to the side, stroking yourself to hardness and horniness while [pc.moving] to the " + (enemy.HP() <= 1 ? "beaten":"aroused") + " shock-bun. She casts a nervous look to you and starts opening her mouth in the slack expectation of getting facefucked.");
	output("\n\n<i>“Nah,”</i> you tell her. ");
	if(pc.isBimbo()) output("<i>“Me, you, and that big boy are gonna have some fun! Why don’t you ride his dick and let me handle the rest?”</i>");
	else if(pc.isBro()) output("<i>“You and me, we’re gonna have some fun. Him too. Let’s go, hun.”</i>");
	else if(pc.isNice()) output("<i>“I wanna see how laquines do it. Show me,”</i> you point to L.D.C.");
	else if(pc.isMischievous()) output("<i>“Always been curious how hard laquines can fuck. Bet you can take all he’s got, too. Go on, the three of us might have some fun.”</i>");
	else output("<i>“Ride your boy toy, I’m taking you both at once. Be grateful I’m thinking of your pleasure, too.”</i>");
	output("\n\nBlinking, the azure bunny looks to the bed and then back to you, just in time for you to " + (enemy.HP() <= 1 ? "unzip and tug off that whorishly tight jumpsuit":"pull off what’s left of her body suit") + ", stealing a grope at her " + (enemy.lust() >= enemy.lustMax() ? "cum-soaked ":"") + "tit for good measure. You " + (pc.isAss() ? "slap her across her face, telling her to get going":"urge her to get up on the bed, lifting her by the arms") + ". <i>“Right, okay,”</i> she says bewildered.");
	output("\n\nThe collared harem part like water for the languid Hopper to approach her reclining captain. "+ (enemy.HP() <= 1 ? "Her bulgy equipment begins to swell the closer she brings herself to L.D.C":"Her swaying erection flares in light of your previous strip tease") + ", dragging across the bed and leaving a trail of too-potent pre. Furry knees and paws sink into the mattress, all the weight in her body cratering her path.");
	output("\n\n<i>“You just want to watch us fuck, huh?”</i> the dark bunny asks, one eyebrow raised.");
	output("\n\nYou shake your head. You tell him you’re not watching, you’re leading. All he needs do is sit back and relax. You instruct the pleasure-girls to do the same.");
	output("\n\n<i>“Aw fuck, are you kidding me?”</i> he whines. <i>“Can’t you just take one of the <i>Viper’s</i> skanks?”</i>");
	output("\n\nYou glower straight into his mismatched eyes until he shrinks meekly from your gaze. While the neon-colored laquine kisses and nuzzles his cunt-breaking mastiff into glorious tumescence, the trappy pirate’s quivering irises run across your [pc.cocks]. Whatever’s making him nervous, his hasty inspection does nothing to hamper the growth of a battleship boner being nursed into readiness.");

	// PC cock small
	if(pc.cocks[x].cLength() < 7) output("\n\n<i>“Heh, like anyone’d feel something that small,”</i> he grins at you, baring the two front teeth on his muzzle while gripping his honey-bun’s mohawk. <i>“I’m going to be splitting her and you’re going to be pretending like you’re having an effect on two laquines.”</i>");
	// PC cock big
	else if(pc.cocks[x].cLength() < 16) output("\n\n<i>“And just what do you think you’re gonna do with that?”</i> the bunny-boss scowls, paw tightening around his honey-bun’s pink mohawk. <i>“She won’t feel a thing, not when I’m pleasing her better than " + (pc.cockTotal() == 1 ? "that little thing":"those little things") + " could ever hope to.”</i>");
	// PC cock bigger
	else if(pc.cocks[x].cLength() < 26) output("\n\n<i>“You’re not gonna be able to fit in me with that, good luck,”</i> The smug boy croons, gripping his honey-bun by the neon-pink mohawk. <i>“But hey, maybe she’ll feel it. You’ll have to work pretty hard to outdo me.”</i>");
	// PC cock biggest
	else output("\n\n<i>“Hrm, you’ve got a pretty big dick yourself. I think I might get jealous. Of her. Not you,”</i> the twitchy-eared bunny grips tighter to his honey-bun’s hair. <i>“Having just one is enough for me, but I can’t deny it’s going to be interesting seein’ her getting stretched in both.”</i>");
	// Merge
	output("\n\nYou smirk, wondering aloud what kind of sounds he’d be making if you stuck it in him" + (pc.cockTotal() > 1 ? ", especially as you have more than one":"") + ". Unable to fire off a witty retort, all the sissy-boy can do is stare reluctantly at your aching member" + (pc.hasCocks() ? "s":"") + ".");
	output("\n\n");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",laquineShockyThreesomes2,x);
}

public function laquineShockyThreesomes2(x:int):void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("Watching the Hopper work L.D.C.’s dick like a professional stripper works her pole is intensely arousing.");
	if(pc.isBimbo()) output(" You can’t help but get in there too, the ripples of his veins are too hypnotizing! <i>“Oh damn, wasn’t expecting that,”</i> L.D.C. says, wincing when you cup his finger-swallowing sack. <i>“Yeah, you’re just an empty-headed slut aren’t ya? Why don’t you settle in right there, I’ll make you the jewel on my crown.”</i> Er, right, you’re still in charge here! You pinch part of his dick between your lip and teeth to shush him.");
	output("\n\nHis twin medial rings swell out as thick as a bulbous knot, and are surely capable of leave indents in whatever hole he manages to wedge that slab of bunny-cock into. When the flat of the blue-bun’s tongue trails around one veiny side, all the spit left in its wake is smeared down that heaven-piercing rod by her diligent hand. " + (pc.isBimbo() ? "Yours too! You’re licking that laquine lollipop with all you’ve got! ":"") + "Her movements demonstrate unerring expertise in ravishing oral service, and you ");
	if(pc.isBimbo()) output("are ecstatic that ");
	else if(pc.libido() < 33) output("are left hornier realizing");
	else if(pc.libido() < 66) output("are secretly thrilled");
	else output("drool uncontrollably, utterly thrilled that");
	output(" you’ve learned a thing or two about pleasing a dick." + (pc.isBimbo() ? " Yum!":""));

	output("\n\nWhen that hole-gaping horse-boner is fully engorged, resembling an obelisk more than a normal dick, the dark-furred rabbit leans smugly back against the pillows. He sighs heavily with a commanding paw behind the Hopper’s ear. <i>“Nice work, hun. Fuck, you make it easy to forget the difficult things.”</i>" + (pc.isBimbo() ? " He pets you, too. <i>“You’re not so bad either, I love eager cock-sluts.”</i>":""));
	output("\n\nThe flat tip of his well-licked " + (pc.isBimbo() ? "(and tasty!) ":"") + "erection isn’t just a twitching, sensitive glans. It’s a battering ram of hardened flesh, the kind that would bowl right through a throat, an ass... and especially a cervix. It wouldn’t be necessary for L.D.C. to grow a knot, his flare would form an impenetrable vacuum seal in all but the most whorish orifices.");
	output("\n\nThe bunny-twink’s magnificent pillar shines with spit, and soon it’ll be beading pre. Coaxed by the heat and raw sensuality of " + (!pc.isBimbo() ? "her":"your combined") + " treatment, fat wads half the size of his ground-dragging nuts collect at the summit. The Hopper slurps her palate-rinsing treat from his turgid head" + (pc.isBimbo() ? ", and so do you":"") + ".");
	if(!pc.isBimbo()) output(" The sounds have your [pc.cocks] crying out that " + (pc.hasCocks() ? "they":"it") + " can be no readier.");
	else output(" The taste of musky laquine makes your [pc.cocks] cry out in readiness, one last desperate attempt to get your slutty mind on track!");
	output("\n\nYou slap the shock-bun on her creamy, brawny ass with enough force to make her round tits jiggle. She purrs as she rises higher and higher over L.D.C., shadowing his muzzle and the too-pleased expression it wears beneath her phallus-dominated form, dripping with potent excitement at the prospect of not just being her boy-toy’s cock-sleeve again, but yours too.");
	output("\n\n<i>“That’s right, babe,”</i> he husks while she positions herself above him, <i>“just focus on me, got it?”</i> Her equine endowment stands ready to breed, the tip nestling in the underside of her swelling cleavage. There’re a few sultry moans from the reclining harem when she hefts her gurgling basketballs to expose the permanently stretched lips of her utterly claimed horse-cunt. Lips freckled by fem-slime shine in the ambient light, their dazzling refractions crying out for a tongue to claim them.");
	output("\n\nL.D.C. answers the call before it’s made, and he eagerly smushes his face into his electric LT’s folds, the initial touch enough to make her moan in growing need. Her overmodded ballsack, weightier than most bosoms you’ve seen, rests snugly on his tummy.");
	output("\n\nPheromones ventilate the room like her chasmic cunt floods the boy-toy’s firm body. Her scintillating emissions next to the sense-fuzzing musk of an over-endowed laquine hit your mind like a freighter - a freighter that’s spilling its cargo of sanity-erasing, hyperactive hormones. Every inhalation of sex-scented air only propagates more of the innate all-consuming desire to breed recklessly, shared across every known race." + (pc.hasVaginas() && !pc.isPregnant(0) ? " Your womb pulses in syncopathic intensity, dilating in expectation of you claiming that divinely-endowed phallic idol for yourself and devoting your body to the purpose. You almost do.":""));
	output("\n\nThe need to fuck is <i>painful</i>. The atmosphere makes you think that, even after you drain your balls, you’re still going to be fucking the black and blue pirates for hours." + (pc.inHeat() ? " Maybe you will. Maybe you’ll get a few loads in your pussy too. It couldn’t hurt as badly as the aggressive instinct.":""));
	output("\n\nYou suppress the urges crawling up your spine watching the slut-bun stand and align L.D.C’s cock with her pussy, bliss sparking across her face. A flask is produced from around a large pillow, no bigger than a toothpaste bottle. The Hopper pours a ribbon of goo across her digits, shoving her paw into her loose snatch, shivering and cooing as she works her interior with lube. Come to think of it, that container looks just like " + (!kiroSexed() ? "the one you saw at the door...":"what you’ve seen Kiro use..."));
	output("\n\nThere’s an awed O-shape spreading on your [pc.face] like the glove of laquine cunt around the bunny boy’s enviable manhood. The Hopper’s concentration falls apart into gaspless lust, pre-soaked tongue dangling above her chin as her body sinks down onto the dick it loves most. Irises mold to hearts in a soupy haze of carnal make.");
	output("\n\nInch after inch vanishes into her hole, and the lips are forced to spread just a bit wider around the first ring. <i>“Fuck yeah, babe, hold tight.”</i> L.D.C. plants his hands around the dizzied rabbit’s waspish hips, his tiny fingers holding so strong that they disappear into the bristling fur of her waist. He’d be at the typical girl’s womb by now, but cockflesh continues to caress the socket desperate to clench around it. Lurid amounts of marespunk drain from her overused pussy like a leaky pipe, more than usual seeping out thanks to the muscle’s inability to totally clench.");
	output("\n\n<i>“Ah!”</i> the lapine woman squeaks, throwing her head back. A fresh rope of cum drips from her cheek - it’s but a drop in the bucket of her eagerly bulging testes.");
	output("\n\nThe second medial ring enters, and by now she’s a shuddering wreck. Her legs kick against the bed - they’re hopping. Her cock-distending body’s wriggling those last inches in, bringing her crotch closer to kissing his. You manage a quiet whistle when his spunk-globules press to the derriere splaying towards you. The necessity of her lurching into a comforting moan-filled hug spreads her bubbly cheeks and reveals the candy-colored wrinkle of her asshole.");
	output("\n\nL.D.C. peeks around, grinning toothily as you sidle up to stake your claim. <i>“Not to encourage you or anything, but good luck, " + pc.mf("dick","slut") + ". Try not to cum too early, I like when she lasts.”</i> He turns his attentions back to the cross-eyed LT, chewing his lip and groaning with every textured rise and fall of his slut-bun’s waist.");
	output("\n\nYou press your [pc.cockHead " + x + "] to the Hopper’s ass, both pre-matting cheeks firmly in hand. If you’re fucking a laquine, you’ve got to fuck like one: you only do what’s necessary to keep your [pc.cock " + x + "] from slipping away just before ramming her. You slam your [pc.hips] into hers, hands wrapping around her supple tits, venting all your pent-up fervor with ");
	if(pc.balls > 0) output("a slap of your [pc.balls] to her butt-cleavage");
	else if(pc.totalCocks() > 1) output("a slap of your extra dick" + (pc.totalCocks() > 2 ? "s":"") + " to her rump");
	else output("a slap of your crotch to her colon");
	output(".");
	pc.cockChange();
	output("\n\nThe shock-bun looses a pained wail during a needful arch of her pleasure-dominated spine, surely feeling what you’re feeling: your [pc.cockNoun " + x + "] writhing against the black-bun’s hyper-sized member through her hyper-graced internals.");
	if(pc.balls > 0)
	{
		if(pc.ballDiameter() < 5) output(" Your cum-pouch swings close to his, not quite heavy enough to touch.");
		else output(" Your sagging ballsack collides with L.D.C.’s, sinking into testicular thresh.");
	}
	output(" You tug and tweak the weapons-grade nipples between your fingers, grinding the unbalanced candy-rabbit’s ass into your personal space.");
	output("\n\n<i>“H-hey, don’t you know how to treat a woman?”</i> the bunny-boy quips, but he’s just trying to distract from his inattentiveness - if he practiced what he preached, then he’d have been all over her from the start. That’s something you growl out to him after the next feral thrust into still-stretching anus.");
	processTime(15);
	pc.lust(1000);
	clearMenu();
	addButton(0,"Next",laquineShockyThreesomes3,x);
}

public function laquineShockyThreesomes3(x:int):void
{
	clearOutput();
	author("William");	
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");

	output("On your fourth thrust into the Hopper’s surprisingly accepting rectum, she pleasure-seizes, two long, thick ropes of jizz flying over L.D.C.’s head and plastering the wall. A third whirls through the air when you squeeze her tits hard enough to provoke a scream" + (pc.hasKnot(x) ? ", a fourth when her ass is rubbed with the insistent pressure of your [pc.knot " + x + "]":"") + ". The layer of sweat that your body secretes is like a subtle reward. It’s a soothing coolness that helps reverse direction.");
	output("\n\nYour [pc.hands] fall to the LT’s waist as she tries in vain to pleasure her petite lover, rising and falling in permanently broken rhythm, both cocks inside like restraints that race to fuck this or that pretty cluster of nerves first. " + (pc.cocks[x].cLength() < 10 ? "Even with how (comparatively) small you are, there’s not much room to move with so much of her innards adapting to the double-ringed dong inside.":"It’s not just a race, it’s a war. Her body has no idea how to handle your thickness in addition to LDC’s."));
	output("\n\nYou lift your [pc.hips] in a slow motion, gyrating forward and up, then back and down - repeat. She clenches, she wriggles, she clenches, she writhes... she’s only moving because of you. When you think about how you’re servicing both of them at once with your elegant ministrations you mentally quip.");
	output("\n\n<i>“Tha...”</i> The domme-bunny’s voice is gravelly. A rumbling yowl courses through her when she leans down again, muffling her pleasured sounds. <i>“That isn’t good enough...!”</i> she sneers at you, both ears bouncing unevenly. <i>“Going slow isn’t what we were meant for!”</i>");
	output("\n\nAw, and you were trying to be fair! While L.D.C. snerks in your general direction, you swivel up and grab the taunting slut by her chin. Your whole body builds strength as fast as it can, knowing it’s about to fuck like a feral beast again. If she wants it rough, then you’ll give it to her rough.");
	output("\n\nHer, and him too.");
	output("\n\nA muted growl reverbs inside the shock-bunny’s throat, only audible this close to her nape. Nibbling her neck, you plunge inside her stubborn rectum, unleashing all the need that’s collected inside you. The primal need to fuck claims you; the engulfing need to fuck better than LDC follows close. You press yourself forward on legs powered by laquine musk, filling her asshole with the shape of your turgid [pc.cockNoun " + x + "].");
	output("\n\n<i>“F-fuck!”</i> the cream-bunny shrieks on the next silky thrust, one of those mammoth medial rings deflecting off her clit. Finally getting into it, you see the black rabbit bend his pawed feet and shift to high-gear. Legs bent backwards, sitting on his thighs almost, you take a moment to marvel at the strain on his powerfully flexing muscles as he hammers her pussy in rapid breeding humps.");
	output("\n\n<i>“Eyes on- me... babe!”</i> he grits his teeth, expression twisting into one of stress.");
	output("\n\n<i>“Yes!”</i> the Hopper cries, L.D.C.’s hands burrowing into her muscles.");
	output("\n\nThe slaves surrounding you titter and coo watching the three of you go at it like rabid whores. L.D.C. groans out a few curses and expletives directed at you while you piston in and out of her " + (pc.cocks[0].cLength() < 10 ? "dilating cavern, spreading it as wide as her cunt":"vein-squeezing cavern, fighting the friction on top of everything else") + ". Cream-splotched lapine ass ripples divinely, shockwaves surging across her curves like a wave of bliss, transmitting the pleasure of intense sexual aggression right to her cunt-holstered lover-boy.");
	output("\n\nAnd his thrusts, short as they are, send signals right back. You’re practically warring to please her at this point, to slake your lusts at the needy officer’s expense. Beautiful and pheromone-laden streams of rabbit-juice pour from her sodden box, sheening L.D.C’s ‘nads in hot passion that splatters onto you with every balls-deep collision. ");
	var y:int = 0;
	if(y == x) y = 1;
	if(pc.hasCocks()) output((pc.cockTotal() == 2 ? "Your":"An") + " extra [pc.cockNounSimple " + x + "] finds purchase in the canyon between her spunk-factories and his burly fuzzbutt.");
	output("\n\nThe way her ring clenches around your rhythmically pulsating [pc.cockNoun " + x + "] is even more debilitating than the oxygen you’re running on; air so thick with overcharged libido that the passage of your dick illuminates the particles between its pre-slathered shaft and your half-lidded eyes. You spend much too long reveling in this ecstasy, fucking this endurant pirate for all she’s worth right next to her boss, admiring her ability to hold on despite it all.");
	output("\n\nThat’s when you realize you can’t let them bask in it, too. <i>This is your show</i>.");
	//Determine if we doing double fuxx.
	//If so, y goes into the LDC's ass while X stays in the hopper
	y = pc.cockThatFits(enemy.analCapacity());
	if(y == x) y = pc.cockThatFits2(enemy.analCapacity());
	if(!pc.hasCocks()) y = -1;
	//use Z for all main dick descs now since either dick could be in bitch boi.
	var z:int = x;
	if(y >= 0) z = y;
	var cumQ:Number = pc.cumQ();
	// PC one cock
	if(y < 0) output("\n\nSuddenly withdrawing from the Hopper, you see her winking entrance heave without your indelible presence. The jolt of your exit results in her tumbling down into L.D.C.’s embrace, unhooking his legs and throwing him flat on the mattress - exposing his ass to you at the same time. <i>“T-the hell..?”</i> he pants.");
	// PC multi cock
	else
	{
		output("\n\nAbruptly pulling back from the Hopper, the [pc.cockHead " + x + "] of your anal-locked dong ");
		if(cumQ < 100) output("dribbles");
		else if(cumQ < 1000) output("spurts");
		else if(cumQ < 10000) output("squirts");
		else output("streams");
		output(" pre just past her milking anus before sliding free. Her candied ring protests your absence, gaping as if screaming for your return; the jolt of your sudden exit results in her collapsing atop L.D.C., unhooking his legs and flattening his body to the mattress. The dusky bun’s ass is left totally exposed for " + (pc.cockTotal() == 2 ? "your":"an") + " extra dick to close in on. <i>“W-what the f...”</i> he pants.");
	}
	// Merge
	output("\n\nYou let him know with one [pc.hand] on his cheek and the other lifting his cum-pouch. You hoist the hapless Jumpers up to give yourself room to work. <i>“What are you doi- FUCK!”</i>");
	output("\n\nThere was only a second for him to panic when " + (y >= 0 ? "a":"your") + " [pc.cock " + z + "] prodded at the entrance to his effluvium-moistened pucker, and you thrust in just the same as you did to his honey-bun: skewering him on your [pc.cockType " + z + "] lance in a gate-smashing thrust. The trappy boy screams in dismay, arms thrashing and hips bucking upwards. The cock-locked skank loses grip on her bottom’s taut tummy, slumping forward only to catch herself on his shoulders" + (y >= 0 ? " and swing you forward just to keep both dicks inside":"") + ".");
	
	if(z >= 0) pc.cockChange();
	
	output("\n\nThose thick and obscenely swollen nuts of his clench and strain, and you can see a massive swell in what little cockflesh protrudes from her hole. His bloating cum-vein pries apart her interior when it swells with a creamy gout of laquine cum. What splashes her womb spills right back out on the next gut-crunch.");
	output("\n\nOn your next thrust he does it again, and then again. You twang him like a fiddle even though he’s spasming around your [pc.cock " + z + "] so tightly you can feel pre backing up in your shaft. You’re double-teaming them so hard that you’re just fucking his black-pelt nutsack now, the thrust of [pc.cockNoun " + x + "] hitting all the <i>make this bitch-boy cum</i> buttons in sequence. A slave moves in to hold his those sloshing testes up, coaxing <i>even more</i> into the mistress-rabbit’s rounding gut.");
	output("\n\n" + (y < 0 ? "You pull out and slam back into her":"You pull out and slam back into them") + ", forcing out a stream of cream with subsequent hammers of the [pc.hip] while you relive the brutal sensations. Can’t let either of them get used to it - how else are you going to work out your <b>lagonic rut</b>!?");
	output("\n\nThe audience is in awe of the way you jackhammer the two, rising higher and higher until they’re both clinging to each other lost at sea. You’re pinning them to their own bed and plowing their asses, making it abundantly clear to any who might stumble in that <i>you own them</i>. " + (y < 0 ? "Premature shots of [pc.cumNoun] impregnate the Hopper’s ass before you switch. That [pc.cumColor] cord of warmth follows you into L.D.C.’s boi hole":"Premature shots of [pc.cumNoun] impregnate the asses of your subs, the wickedly intense heat forcing you to pull out. You drag a [pc.cumColor] cord of seed with you that follows you right back when you catch a hissing breath") + ". You can feel your heart fluttering as two more splashes of warm cum plaster " + (y < 0 ? "his":"their") + " stubborn insides.");
	output("\n\nLaquines whine in eruptive orgasm. All the black and blue can do is cum unfulfillingly, wailing in hoarse lust as you maintain a mechanically-precise rhythm. You paw at those chubby nipples again, pulling so hard they’re reddening in pain. Your sexual organ is working in harmony with your hormonally crushed mind; your purpose is to do nothing but fuck, breed, rut. The Hopper’s spooge helicopters through the air while LDC’s slowly but surely gives her a signature cum-bump.");
	output("\n\nIn a moment of mischief, you try to slip " + (y >= 0 ? "a dick":"your dick") + " past L.D.C.’s and squeeze a load off in the mohawked bun’s cunt" + (pc.cocks[z].cLength() < 10 ? ", and you manage it! The smarmy punk insulted you earlier! Who’s laughing now? It would hurt if you tried, so you just savor those satiny walls as long as you can!":", but you can’t manage it with your prodigious size. That’s fine. She’s going to make a decent exercise ball when this is done!"));
	output("\n\nYour knees give out, muscle control robbed by your quickening hips. Your [pc.toes] curl into the soft fabrics as beads of spit and visible puffs of heavy air bellow from your mouth. You’re whining and grunting - you’re giving it all you’ve got. " + (!InCollection(pc.race(), "laquine", "half-laquine", "rabbit", "rabbit-morph","laquine-morph","bunny-morph","bunny") ? " If laquines go hard, then you’re going harder.":" Laquines go hard, but you’re a shining example of their race right now.") + " The lurid ‘schlucks’ of pre, the swelling of two bellies, and the deafening moans of the cumming hopper bring you to that euphoric edge.");
	output("\n\nDominating those two " + (y < 0 ? "in sequence":"simultaneously") + ", asserting as powerfully as you possibly can on the pirate king and queen of Zheng Shi... It’s fucking <b>hot</b>. Everything is so hot! You can’t feel anything in your seething loins anymore. Keening cries shake what you can perceive down to all that matters: the two bunny butts you’re stretching into loose permanence.");
	output("\n\nA nebulous feeling cinches around your neck and conflagrates, a firestorm brightening every nerve below. A whimpering wheeze escapes your lips as your [pc.balls] brew up the last batch of your impending climax. The evenness once present in your biologically impelled movements falls apart midway through a muscle pinching thrust. You reach out to grab onto something, furry ass, sweat-caked arm, dick, whatever can steady you as your testes churn out seed-filled release amidst ear-splitting orgasms.");
	if(z >= 0)
	{
		// PC low cum
		if(cumQ < 100)
		{
			output("\n\nFor however vigorous your fucking might have been, your [pc.balls] " + (pc.balls <= 1 ? "is":"are") + " not filling the gap as well as you’d like. You spurt a few ropes of [pc.cum] into " + (y < 0 ? "the Hopper":"the laquines") + ", finding yourself trapped inside while a spunk-ball begins to weigh her down heavily. " + (y < 0 ? "You frantically pull out, eager to share what you’ve got left with the ink-bun, spearing yourself into his ass and biting your tongue from the unholy pleasure of it all. ":"") + "Your virility stops flowing long before theirs does.");
		}
		// PC plenty of cum
		else if(cumQ < 1000)
		{
			output("\n\nA potent wave of masculine release soothes your muscles and calms your being. [pc.Cum] sprays through your bulging-out urethra" + (pc.cockTotal() > 1 ? "s":"") + ", splattering the " + (y < 0 ? "Hopper’s":"laquines’") + " insides with [pc.cumVisc] spooge. Due to L.D.C.’s orgasm, she’s already swelled with a pregnant bump of laquine love, and thanks to your orgasm" + (y < 0 ? " and hasty hole swap":"") + ", the dark-furred bunny is experiencing the same sensation of being weighed down by another person’s cum.");
		}
		// PC lots of cum
		else if(cumQ < 20000)
		{
			output("\n\nA cork unpops - you finally unload thanks to the inimitable relief of masculine release. The Hopper’s spunk-bump grows even wider with an ass full of [pc.cum] that surges with such force and volume that it backwashes, splattering your crotch with the excess of your molten-hot passions. " + (y < 0 ? "While you pull out of the candy-colored pirate, you’re hosing her, the wall, and the bed down before you spear L.D.C. on your [pc.cockNoun " + z + "]. ":"") + "The bunny-boss’ stomach fast experiences what it’s like for anyone he wedges on to his dick, and soon both of them are dizzied bearers of tremulous, weighty cum-bumps.");
		}
		// PC monstrous cum
		else
		{
			output("\n\nThe air is sucked right out of your lungs when the first geyser of [pc.cumNoun] fires from your [pc.cockNoun " + z + "]. The Hopper is silenced by the intense wad of spooge searing her innards, and utterly mind-broken by the second.");
			output("\n\nHer entire backside swells out with [pc.cumVisc] seed, to say nothing of her massive belly-bump that, when she falls forward, is pressed on, resulting in an obscene backwash - no, explosion - that mixes L.D.C.’s cream with yours. On the fourth cumshot, you notice your [pc.cumColor] seed bubbling out of her nostrils and lips, the domme’s eyes rolled clean back.");
			output("\n\n" + (y < 0 ? "You beat feet to swap holes, hosing the both of them and whatever the hell else is in the way with unparalleled virility. Spearing L.D.C.’s hole is a physiological need as much as it was a moment of sanity-erasing pleasure. ":"") + "The sissy-boss groans and gargles hilted on a dick that’s channeling a flood of [pc.cum] through his petite body. You give him a huge cum-belly that wobbles against the Hopper’s, and as your balls continue to drain, your seed soon spurts right out of his slack mouth, fountaining to the incapacitated blue-bun’s lips.");
		}
	}
	// Merge
	output("\n\nShudderingly cold breaths shake your mind of the temptations and wriggle you free of jumper ass. You fall back onto the bed to the " + (z < 0 || cumQ < 1000 ? "golf claps":"roaring applause") + " of surrounding slaves, feeling tender hands working out the kinks in your very sore limbs. You sputter and crawl off the bed, eager to reclaim your belongings.");
	output("\n\nA few minutes pass and the mismatched laquines stir to life");
	if(z >= 0 && cumQ >= 20000) output(", utterly painted in [pc.cumColor] creaminess. They flop off each other, disconnecting like electronic peripherals, burbling and lamely swallowing oxygen");
	output(".");
	//output("\n\nWith all said and done, it’s time to decide what you’re going to do next...");
	output("\n\n");
	processTime(30);
	//track what happen
	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["SHOCK_HOPPER_FUCKED"] = 1;
	flags["LDC_FUCKED"] = 1;
	if(z >= 0) enemy.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postSexShockHopperVictoryEpiloggieDoggie,1);
}

//[Drain Bunnies]
// Tooltip: {pcHighStamina: After a fight like that, what better way to work out your differences than riding both those rabbits to exhaustion? /bimbo: You can’t let that big, juicy dick just walk out of here without a taste! And what about that sexy bunny? Sure she tried to hurt you, but they’re both packing some fine meat, and who knows how much cum?}
// Tooltip, not bimbo or amazon: You’ll need either the endurance of a galaxy-class porn star or be a much more open-minded and depraved individual to consider this. Super sluts only, ‘kay?
// Tooltip, no Vagina: {pcHighStamina: You can’t dom these two without a pussy! /bimbo: How can you wring cummies out of bunnies without a pussy!?}
// Tooltip, not bipedal: You need to walk on two legs for this.
// Tooltip, incompatible vagina: Your pussy’s not {capacious/elastic} enough to handle LDC’s dick!
// Requires PC to be a bimbo or amazon, not be a taur and have a vagina.
// Blow LDC and get DP’d, riding LDC vaginally and getting anal’d by the energizer bunny. Multivag support. They both get super exhausted by PC.
// When Generic Laquine Pregnancy is implemented, this scene will impregnate the PC if they’re not already carrying. And it will be guaranteed!
// William

public function drainBunnies(x:int = 0):void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");

	// Amazon
	if(pc.isAmazon(false))
	{
		output("He’s offering you the one thing you’ve already earned, but he’s not offering you what you <i>really want</i>. That big-dicked bunny and his big-balled bottom bitch are hoping you’ll leave without getting a few rounds in. What’s up with that?");
		output("\n\nYou grunt, cracking your neck and knuckles" + (!pc.isCrotchExposed() ? " as you worm your way out of your [pc.crotchCovers]":"") + ". Deepening arousal splashes your face with a shock of red, indicating your readiness from the top while your [pc.pussies] indicate your readiness at the bottom - by squeezing out ");
		if(pc.wetness(x) < 3) output("trickles");
		else if(pc.wettestVaginalWetness() < 4) output("streams");
		else output("shimmery waterfalls");
		output(" of [pc.girlCumVisc] femslime" + (pc.hasCock() ? " below your throbbing [pc.cocksLight]":"") + ". Very few people you’ve met have a dick like that, and you’re not letting it get away from you.");
		output("\n\nAnd you’re not letting the sissy-boy it’s attached to get off so easy!");
		output("\n\n<i>“H-hold on, what are you-”</i> L.D.C. stammers curiously, but is silenced by your pounce on the bed. The slave girls part like water on your approach" + (pc.biggestTitSize() >= 3 ? " while the bunny-boy’s eyes remain locked to your wildly flopping tits":"") + ". You stop short of his dilating semi-erection, catching a strong whiff of his vision-muddling musk. There’s no way that incredible smell came from a mod, it’s all natural laquine pheromone that’s got you salivating in raw anticipation.");
		output("\n\nBefore he can say anything else, you shove the twink-pirate down and straddle him, scything his head between your [pc.thighs], introducing him to your own very potent scent after resting your [pc.ass] on his face.");
		output("\n\n<i>“Where oh where did a little boy like you get such a big boy like this?”</i> you ask, inching your loins closer to his twitchy nose. You take hold of his equine mastiff, marveling at its animalistic shape, its twin-ringed bestial glory. Pre streams from the summit of bunny-cock like a fountain of unceasing desire, carrying his scent right to your taste buds when you give it a lick. Spit flows from your maw unbidden while your cunny plasters L.D.C.’s brow with a smear of [pc.girlCumNoun]. It tastes far better than it smells! <i>“A sissy-boy hung like a stallion, I think you forgot where you place is. To think that that blue-babe couldn’t keep you there is quite somethin’.”</i>");
		output("\n\n<i>“W-why don’t you turn around? I’ll show you where my place <b>really</b> is,”</i> he says unconvincingly, struggling to get hold of your [pc.ass] yet getting buried further into your crescent.");
		output("\n\n<i>“Yeah, we’ll get to the stretching, but on <b>my terms,</b>”</i> you grip his cock, fighting its defiant pulses with the biting hold of your [pc.hands], masturbating him hard. <i>“");
		if(pc.isNice()) output("That attitude isn’t going to work on me, horse-boy. Why don’t you use your mouth for something useful?");
		else if(pc.isMischievous()) output("I suggest you use what air you’ve got to please me rather than annoy me, little boy. From where I’m sittin’, the places seem just right.");
		else output("Keep talking, I’ll just keep grinding. Be useful, not stupid, little boy. Now get to work down there.");
		output("”</i> Moments before obscuring the floppy laquine under your waist, his tongue finds purchase of your [pc.vaginas]" + (pc.balls > 0 ? ", ignoring your [pc.balls] for undoubtedly spiteful reasons":"") + ".");
		output("\n\nHis towering erection ");
		if(pc.tallness < 55) output("ascends higher than you, mockingly shadowing you beneath its virile architecture");
		else if(pc.tallness < 66) output("peaks perpendicular to your lips, the battering-ram of his flare staring you down");
		else output("is dwarfed even in this position, looking meekly proud before your hungry visage");
		output(". His motions downstairs and the musky pheromones swirling around your brain drive you to jack him in ecstatic fashion, to familiarize yourself with every vein on this monster-cock.");
		output("\n\nIt’s not what he’s doing that’s making you cream yourself, it’s the passing thoughts of stretching yourself on this beast, claiming it and claiming him for yourself.");
		output("\n\nThere’s no doubt that baby-blue-bun over there, with envy and jealousy flaring in her neon eyes, is not happy about this. <i>“Stop, that’s not your...”</i> You stoke those fires with a smug grin, licking all around the tip of L.D.C.’s member to punctuate it. While she crawls over, you avail yourself to the steady surges of salty ooze flicking out onto your lips and the sheets, working casually to coat his cock and finger-swallowing ‘nads with as much pre as you can.");
		output("\n\nMeanwhile, L.D.C.’s tongue is working overtime. <i>“F-fucking shlut!”</i> he whines, clapping his weak lapine paws off your unmoving ass. <i>“We’ll shee how... how... fuck!”</i> Desperate for oxygen, he abuses [pc.oneClit]" + (pc.totalClits() > 1 ? " and then the rest":"") + ", drawing fat licks across your " + (pc.vaginalPuffiness(x) > 0 ? "pumped ":"") + "exterior" + (pc.hasVaginas() ? "s":"") + " while biting almost too-hard on your ");
		if(pc.clitLength < 2) output("clitoral bud" + (pc.totalClits() > 1 ? "s":""));
		else output("feminine fuck pole" + (pc.totalClits() > 1 ? "s":""));
		output(". It’s at least enough to throw your head back and flex out another [pc.girlCumVisc] wave. He spreads your twat and packs it with as much tongue and matted fur as he can, grinding his incisors against the hood.");
		output("\n\nThe black bun can’t hope to keep you shined with more spit than [pc.pussyNoun] drippings; he’s being bathed and drowned in your amazonian passions. Oh it feels great, and he’s a skilled cunt-kisser worth keeping, but you’re much too in control to be satisfied with anything less than making him your boy toy for the moment. He thrusts limply in fervent, lusty motions, perhaps trying to force his dick past your [pc.lipsChaste]. But pinned as he is, he can only dribble more pre and make a fool of himself.");
		output("\n\nSheened by cock-drool, his equine fuck-club swings back and forth between your sticky palms. You tease and play with it, fantasizing about what’ll happen when you sink it in your [pc.pussyNoun]. Your temple thuds with every heartbeat - and every thumbing to your [pc.clit]; you drop a hand to his balls and squeeze one of those trembling testes. A pre-shot twirls out from his flat tip, barely missing the approaching Hopper. <i>“Nice,”</i> you remark, wedging his muzzle further into your crack with a hip-wiggle, <i>“love a boy who shoots on command. Do you really think you’re gonna be leading me around by this? You ain’t in charge, and you can only cum when I let you!”</i>");
		output("\n\nThere’s a low, acute, and pleasant hum that thrums across your every vaginal muscle. He half-groans, half-squeals into your [pc.vaginaColor] tunnel, sounds muffled by [pc.skinFurScalesNoun] and pussy-juice. His spunk-spheres jiggle and slosh between your fingers, swelling his urethra to capacity. You rub your fingers all along the girthy tube, spinning around his medial rings in asymmetrical fashion. A limp orgasm whirls out of him, plastering the sheets in front of and between his plump legs with wasted seed.");
		output("\n\nSeeing the opportunity, you wrap both [pc.arms] around his gargantuan dong and thrust your body up and down. Up - you give him some precious air. Down - a rope of bunny-batter fires skyward. Up - your whole body massages his cock, forcing him to whine and squeal against your feminine furnace just before it silences him on the downstroke. Down, down, you giddily cum all over his face, framing him with your rump as ");
		if(pc.isSquirter()) output("lances of ");
		output("[pc.girlCumNoun]");
		if(!pc.isSquirter()) output(" splashes his muzzle");
		else output(" break on his face in long squirts");
		output(".");
		if(pc.hasCock()) output(" [pc.Cum] drools out sympathetically, lacquering his tummy and sheath to a [pc.cumColor] color.");
		output("\n\n<i>“F-fuck you...!”</i> he wheezes, finally surfacing below, the slaves laughing and jeering at the floppy-eared laquine. His cock firmly in hand, you slam down against it, launching a comically thick off-white lasso across the room to the audience’s satisfaction. And your own. " + (silly ? "Home run! ":"") + "You tap the side of LDC’s head, grinning at his enduring erection.");
		output("\n\n<i>“Ready to be put in your place, bunny boy?”</i> you ask, already shifting positions.");
		output("\n\n<i>“G-good luck, you can’t take that! Only s-she can...”</i> he says, desperately trying to maintain a commanding tone.");
		output("\n\n<i>“Maybe if you keep talkin’ tough I’ll keep you for myself, I’m not seeing the love ‘tween you two!”</i> you simper, huffing as you hold tight to the bunny’s boner like a stripper her pole.");
		processTime(30);
		enemy.girlCumInMouth(pc);
		pc.orgasm();
	}
	// Bimbo
	else if(pc.isBimbo())
	{
		output("He’s offering you the codes to get your probe, but... The probe is nice and all, but that’s not the problem at hand. You scratch your head, trying so hard to think about what’s so distracting. There’s sex in the air, there’s naked girls, and there’s a bunny boy... Wait...");
		output("\n\nNow it makes sense!");
		output("\n\nYou pout your lips into a firm scowl: you’ve gone through a lot of trouble to get here and this cute as heck rabbit thinks he’s going to waddle out of here with that double-ringed pillar of juicy delicious horse cock!? <b>Who does he think he is</b>, not even offering you a cumshot or three after his bottom bitch tried to zap you? <i>Not on your watch</i>! You’ll get your inheritance (you earned it!) but first you’re getting that mouthwatering slab of horsemeat between your [pc.lipsChaste], and definitely in your [pc.pussy " + x + "]!");
		output("\n\nYou whine and squirm" + (!pc.isCrotchExposed() ? ", shaking yourself out of your [pc.crotchCovers]":"") + ". [pc.GirlCumVisc] feminine desire trickles down your [pc.thighs], squelching on your purposeful approach to the bed. <i>“W-what are you doing?”</i> L.D.C asks curiously, eyes locked to the " + (pc.biggestTitSize() < 10 ? "delightful":"heaving") + " bounce of your [pc.breasts].");
		output("\n\nYour cheeks flush brighter the closer you come to his distending erection, absorbing every thigh-soaking detail. The girth in its unready state puts smaller dicks to shame, and the flare looks bigger than a knot and quite capable of sealing cum inside a good bitch just as fine! That cunt-destroying battering-ram is waiting right there for you - <i>“Ohh...”</i> you start, voice fading to a sibilant hum of pleasure.");
		output("\n\nThe slave-girls spread quietly, giving you the face-to-phallus time you want with the black bunny.");
		output("\n\nLoins aquiver and lips atremble, you stop just a few inches away from his thrumming maleness. It’s just... gosh... it’s so fucking hot just being there next to it! Just looking up to it, visually worshiping and humping its blunt hardness presses out all the unimportant stuff! You’ve yet to put your mouth and hands to that unready schlong and you’re captivated by every hypnotically pulsing and bulging-out vein. Your [pc.eyes] dilate with hunger and admiration; the [pc.tongue] falls right from your supplicating mouth. [pc.Hips] wiggling, [pc.ass] raised into the air, you chew your bottom lip, faint squeals build in your throat watching that beast awaken in your needy presence.");
		output("\n\nThe laquine’s powerful and undeniably musky aroma quickly courses through your system and achieves essential oneness with your bloodstream. You shiver in phallic veneration, eyes totally fixated on his dick while heavy sheath-stench swirls around your nostrils. The reverence etched on your face is something that turns hims on - it’s getting him hard <i>fast</i>. His mounting arousal only perpetuates the cycle: you get hornier and wetter as its stimulating shadow falls like a mask over your [pc.face].");
		output("\n\nKnowing deep down that’s the only part of his endowment that’s gonna ‘fit’, you cream yourself harder.");
		output("\n\nThe white-haired twink sits up, squinting bewildered at your prick-infatuated form, and grins. The bunny-boss’d know the look of a born slut anywhere; he’s surrounded by them, and you’re no different. <i>“Like what you see?”</i> he snickers, all too amused by your cocknosis. You nod quickly, licking your lips which never seem to remain unspotted by spit for long. <i>“Want a taste that bad?”</i>");
		output("\n\nDO YOU!? ");
		if(pc.tailCount > 0)
		{
			if(pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				if(pc.tailCount > 1) output("Your [pc.tails] are wagging fast enough to clear the air! ");
				else output("Your [pc.tail] is wagging fast enough to clear the air! ");
			}
		}
		output("You answer with a very eager nod " + (pc.hasHair() ? "that throws [pc.hairs] around ":"") + "- good [pc.boyGirl]s wait for permission! Sucking dick only when asked to is the best kind of pleasure!");
		output("\n\n<i>“Go ahead, slut,”</i> he huffs, <i>“suck it.”</i>");
		output("\n\nEvery muscle in your body propels you forward, your [pc.lips] spreading in the lunge. LDC’s cock completes its domination of your mind: the very first thing you do is smooch his squishy cum-vein, already wondering how much bunny-batter can fill its length while delighting about your fingers sinking into its rubbery shape.");
		output("\n\nYou plant your [pc.tongue] at the base of his musky member and <b>lick</b>. You lick all the way to the pre-streaming tip of his turgid meat, past the twin medial rings, sucking down a gumball of cock-juice and washing your mouth with his bestial taste - a loud gulp lets him know you’re enjoying this!");
		output("\n\nYou descend, tonguing over his oversized balls. The black pelt of his weighty orbs bristles against your muscle on its exploration. Mewls and cock-thirsty moans against the groaning pirate’s smooth and wonderfully engorged sack conjure up thrumming ripples that have him arching back, totally in love with your treatment. <i>“Fuck me, I can see why the others love ball-play,”</i> he sighs happily, packed sack creasing to the worship of your skilled movements. <i>“Right there,”</i> he says, <i>“good [pc.boyGirl].”</i> Testes part in a sea of laquine love when you bury your nose into the center of the yummy boy’s squeezable plushness, intent on polishing his cum-factories to a mirror shine.");
		// Long Tongue
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nThankfully you got yourself a longer tongue than most! Saliva-soaked flesh coils around the inky laquine’s clenching nutsack with glee, sucking sweat and old pre from his fragrant fur with such force that he’s moaning and looking for a grip on you. <i>“Geez, I’ve heard the girls talking about ball-sluts before, but I never thought it’d feel like this,”</i> he chuckles. Meeting his eyes, you whip your tongue back, watching his balls bounce and jiggle and his head fall backward, a hissing groan of inarticulate bliss brushing past his lips.");
		// Merge
		output("\n\nThe black rabbit’s paw lands on ");
		if(pc.hasEmoteEars()) output("your [pc.ear], rubbing around its rim before drawing it into his palm for a more appreciative petting.");
		else output("your head, " + (pc.hasHair() ? "tousling locks of your [pc.hair].":"his hand-fur a lovely massage against your [pc.skinFurScalesNoun]!"));
		output(" First you nuzzle into his touch, then his finger-swallowing pouch, and finally against his massive erection. <i>“I said...”</i> his sonorous voice trails off in a cute moan as you slobber over his medial ring. <i>“Aww, fuck, do I need to say anything? Can’t believe this...”</i>");
		output("\n\nHe’s smiling, watching you adoringly from mismatched eyes with a thumb propping his cheek. <i>“I’ve got this all taken care of!”</i> you chirp. Handling dick is something you do extremely well, and you’re thrilled at his enjoyment! The Hopper behind you sure sounds jealous!");
		output("\n\nYou’re guided upwards to the summit of moistened bunny-cock. So much to suck and so little time! Your [pc.pussies] " + (pc.totalVaginas() == 1 ? "has":"have") + " been " + (!pc.isSquirter() ? "streaming":"flooding") + " with ambrosial [pc.girlCumNoun] for so long the sheets are totally stained [pc.girlCumColor] with dispensed girlmusk!");
		output("\n\nAll too enthused, L.D.C says <i>“Here’s your treat”</i> before bucking hips and thrusting the flare into your [pc.lips]. You bring yourself closer" + (pc.biggestTitSize() >= 4 ? ", wrapping your [pc.fullChest] around as much of his length as you can":"pressing your body into his length and jacking it") + ".");
		//lactate:
		if(pc.isLactating()) output(" [pc.Milk] sprinkles out with every knead and rub of your [pc.nipples], splattering his shimmery fur with [pc.milkVisc] [pc.milkColor] droplets of flavorful warmth.");
		output(" <i>“D-damn, that’s amazing. Let’s see how good that throat is then!”</i>");
		output("\n\nYou’re already working that shaft deeper! What’s a gag reflex? [pc.Eyes] locked to his, you hump and hop against two feet of rock-hard horse-dick, drooling and moaning luridly around the shaft you socket deeper into your gut. The heave of his mammoth dong stimulates your erogenous throat in uniquely pleasurable ways, pushing out past your currently existing adam’s apple and becoming a new spine of sorts!");
		output("\n\nDeeper and deeper he goes through your throat, and you’re so close to the first ring! Oh... You’re cumming! Girljuice " + (!pc.isSquirter() ? "sprays":"squirts") + " out into a collecting puddle, your eyes rolling back as every inch of bedspread below is wholly soaked to the point it becomes incapable of absorbing your excess of passion." + (flags["USED_SNAKEBYTE"] != undefined ? " In excitement, you work your ribbed muscles around his dick, jaw beginning to stretch obscenely with the growing width of his cock. <i>“Holy shit..! What kind of throat is that!? Did you take some kind of Slyveren mod?!”</i> he cries, inadvertently shoving more savory laquine cock against the threshing of ribbed neck-nerves.":""));
		// No Snakebyte
		if(flags["USED_SNAKEBYTE"] == undefined)
		{
			output("\n\nNo matter how desperate your gargling and swallowing you can’t quite reach his second ring. He’s just too wide! You’re not too concerned about that though, you’ve sucked down more of his cock than anyone else in this room could hope to! And besides, it’s not like those sluts can cum buckets from getting face fucked! Wherever the vestiges of your mind are, they’re laughing it up while your body " + (!pc.isSquirter() ? "sprays":"squirts") + " [pc.girlCum]" + (pc.hasCock() ? " and dribbles [pc.cum]":"") + ".");
			output("\n\nBut the best thing about it is that he’s cumming too. You catch a few glimpses of him whimpering and grasping at the sheets. Flare widening, a torrid bolt of cum hits you. Your shoulders flinch upwards in shock. Whatever just hit you felt as thick as the cock in your maw! And there’s so much more racing behind it, all with the ferocity of charging horses on a track!");
		}
		// Snakebyte
		else
		{
			output("\n\nThe closer you get to his crotch, the wider his cock becomes. You look for all the world like you’ve holstered a leithan, <i>and you still keep going</i>. Ribbed throat muscles masterfully massage all the prickflesh nestled between them. Your enhanced jaw stretches to accommodate the bottom half of the bunny-boy’s dick; you pass the second medial ring, feeling the pressure of his flare somewhere much too close to your stomach.");
			output("\n\n<i>“Oh my f-f-fuck...!!”</i> he howls, tongue thrusting out of his mouth in shock, whipping and lashing the air like a flittering snake-muscle. You’re so close and he’s so close to cumming, but you’ve gotta get it all in there! You know you can do it! The girls around marvel at your cock-stretching form, holding their breaths at this hyper display of oral service. Three inches, watering eyes, two inches-");
			output("\n\nOne last inch claimed. Your [pc.lipsChaste], stretched so much that the color fades, are pressed into L.D.C.’s crotch. The rattle in your body is his heartbeat, teasing every fiber of your being while the widening cumslit forces its way through the hole between esophagus and stomach, unloading balls-deep into your cum-hungry core. Torrid bolts of cum strike and spasm your body like lightning, filling your gut and splashing into connecting tubes. The shot makes your limbs curl and spread limp and uncontrolled, strings being thrashed about by his titanic orgasm.");
			output("\n\nAfter the third cumshot, all you can really be is happy! The way he flails on the bed is just so cute! His balls clench and jostle against your weight while his body-throbbing dong robs your soul of any non-fellatio related purpose. You can’t taste a drop of it, you can’t smell anything but his masculine stench - you can’t breathe! You’re just a mewling cock holster, <i>and you love every second of it</i>.");
		}
		// Merge
		output("\n\nBelly sloshing with laquine cream, the sad part is upon you: dragging yourself off his hotly pulsing dick! By the time you do, at least you’re breathing just fine. You lick your cum-specked lips, cooing loudly from such a potent taste. Your belly is sooo full that it’s rising right back up your throat, and you barely stifle a spunk-scented burp.");
		output("\n\n<i>“Nnnggg...”</i> L.D.C. groans breathily, still rock hard and ready to go. <i>“Is that your way of apologizing or earning or... damn...”</i>");
		output("\n\n<i>“No, silly!”</i> you wag a finger, pouncing on his body, sultry intent shining in your [pc.eyes]. He looks up to you nervously, unable to settle on any expression besides confused. <i>“That’s my way of getting started!”</i>");
		processTime(30);
		//Big boi loads.
		pc.loadInMouth(enemy);
		pc.loadInMouth(enemy);
		pc.loadInMouth(enemy);
		pc.orgasm();
	}
	clearMenu()
	addButton(0,"Next",drainBunnies2,x);
}

public function drainBunnies2(x:int):void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");

	output("Saddling yourself on LDC was easy, but fitting him inside is going to be a challenge. Of course you’re up to it!");
	enemy.cocks[0].cLengthRaw += 10;
	// PC not capacious/elastic enough (no new PG)
	if(pc.vaginalCapacity(x) < enemy.cockVolume(0)) output("\n\nBut you’re going to be smart about this. You’re not taking that balls-deep without a little help. You glance around, and a pleasure-girl helpfully offers you a small toothpaste-sized bottle. The logo is faded, but the ‘elasticizing lube’ part isn’t. You dump the contents into your palm and smear it all throughout your [pc.pussies], the cold sensations fading into rubbery warmth. You flash your boy-toy a toothy smile.");
	// PC is capacious/elastic enough (no new PG)
	else output(" And so is your [pc.pussy]. There’s almost no cock that you <i>can’t</i> take. You wave off a helpful harem girl offering a bottle of elasticizing lube, making LDC regard you with no small amount of shock and nervousness. You flash the waiting boy-toy a proud, toothy smile, only able to fantasize about what’s going through his mind right now.");
	// Merge
	output("\n\nYou rise higher, draping your well-moistened cunt over the peak of LDC’s meaty mountain. The haze of laquine musk subsumes you, ironing out any remaining hesitation, leaving you well and deliriously aroused. Perfect for shimmying down on that pirate lord’s prong. You exhale, craning your neck to grin " + (pc.isAmazon(false) ? "proudly ":"lewdly ") + "at the Hopper behind you. The candy-bun’s being held back by the slaves who are already looking for ways to play with her." + (enemy.HP() <= 1 ? " That growing boner looks really fun...":" Her throbbing boner looks like it needs a place to go. Badly.") + " Maybe...");
	if(pc.isAmazon(false)) output("\n\nMaybe you can let her get off too. LDC’s already putty in your hands! Taking on two laquines at their own game sounds like the perfect end to this day!");
	else output("\n\nMaybe she can join too!? Oh hell yes! Looking at those painfully full balls, she needs to cum sooo badly!");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "Hold up, I want her too. But first... she can watch just a little longer.":"Ooh, wait, I want her too! Just gimme a sec...") + "”</i>");
	output("\n\n" + (pc.isAmazon(false) ? "Alright!":"O-kay!") + " No more waiting around... Nerves fire the second you touch LDC’s bulging cumslit to your sopping-wet box - a squirt of pre fires into your snatch. The laquine’s blunt tip plows through your opening, flare straining against your deliciously wet walls like a mutant knot and forcing out every unkind thought. That was the easy part.");
	output("\n\nThe bunny boss’s groans climb to higher pitches of pleasure, screaming out with inches claimed. What you felt was halting at first, and now your " + (pc.isAmazon(false) ? "husky":"bubbly") + " voice is layering over his. Eyes widen all around you watching your body rock, flail, and spasm trying to take his slick prick further, your squeezing canal blocking his pre from escaping. This kind of dick was meant for a leithan! You’re already appreciating what that jumpsuit-wearing slut is capable of, because " + (pc.vaginalCapacity(x) >= enemy.cockVolume(0) ? "even with your ‘skills’":"even with the lube") + " this is...");
	output("\n\nNo, no! You can’t be thinking of anything except going down!");
	output("\n\n<i>“Fffuck... You crazy slut, you’re not gonna last more than the first...”</i> he squeaks, <i>“first-!”</i> The first medial ring slips through with the most cum-provoking squelch you’ve ever experienced. <i>“D-damn!”</i> LDC swings his head left and right in frenzy, a decidedly cute moan not unlike a squeak escaping his lips.");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "You were saying, little boy? Why don’t you go ahead and tell me how much you need me right now!":"Nah, this is nothin’! We haven’t gotten to the fun part yet!") + "”</i>");
	output("\n\nIt’s like your entire organ network is rearranging to make room. His bulge is visible throughout your abdomen, <i>and it’s getting bigger.</i> You begin to lose control of your body, your muscles refusing to do what your brain says. Your brain says ‘sit still’ and they go nuts, trying to push you off of that dick. It doesn’t hurt, in fact there’s a unique kind of relief to it, but stars do you feel fuller than ever before!");
	output("\n\nAnd you’re almost to that second ring! You’re taking the fattest, biggest dick on this station, and that’s all you need to care about! You’re making that pleasure-seized laquine squeal in delight, crying out expletives and babble in equal measure. The horse-bunny’s meat stretches you into a whole new realm of stimulation, leaving a permanent and indelible mark on your poor, abused [pc.pussyNoun " + x + "] when that second cock-halo is devoured by your impossibly fitting cavern. It’s not just stroking every ounce of you, it’s <i>molding you</i>. Litanies of disbelief bounce off the walls and your beautifully writhing form.");
	pc.cuntChange(x,enemy.cockVolume(0)/2);
	output("\n\nThe spurts of pre and cum inside intensify, unlike any male orgasm you’re used to. It’s just his body reacting ecstatically to the pleasure it’s receiving. The iron-hard throbbing in his dick is unerringly ruthless, beating a steady rhythm into you: you, just a full-body decoration for his totem. Your descent is ceremonious, driven, and full of discomfort and pleasure binding together to form an indescribably erotic sensation. <i>“F-f-fuu... Fuuck! Augghh, this isn’t-”</i>");
	output("\n\nIt doesn’t end with a whimper, but with an ecstatic splatter that echoes off the walls. Your merciless groin sets loudly on to his, his lust-fattened ballsack jiggling against the lower end of your crack. You lurch forward, gaspless and amorous, slowly sawing your entire torso with his hyper-sized cock, left to wonder if he’s about to cum straight into your heart. Your violently milking interior is surely expediting his rise to climax if not." + (pc.hasCock() ? " [pc.CumNoun] shoots out completely unnoticed from your [pc.cocksLight], coloring the insensate laquine’s face with a few erotic stripes.":""));
	output("\n\nNo time to waste, you move slowly, mouth totally agape; huge, thick, heated breaths press from your lungs like a medieval bellows. You can’t put voice or thought to anything you’re feeling now. Being spread like this was no doubt considered impossible! Everything condenses down to the rhythmic tightening and pulsating not just in your crotch, but your torso as a whole.");
	output("\n\n<i>You’ve claimed him.</i> You’re mounted on the biggest pole on Zheng Shi, riding it (or at least trying to) and <i>fucking void</i> does it feel <b>awesome!!</b>");
	output("\n\nThrough his tender hardness every pulse and heartbeat thuds against your core, a keenly felt jerking sensation that bounces you, makes you curl and flinch uncontrollably. It pounds a tempo into you, one your body dances to. It’s not just your stressed and overstretched pussy-walls flexing to the harsh internal stimulation, it’s <i>fucking everything.</i> You grip his shoulders, watching his cottontail wagging with a blur, barely rising before slamming your [pc.hips] back into his with shocking force.");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "G-go on, say it. Let everyone know how your mistress makes you feel, sissy boy!":"Look, it’s all mine now!") + "”</i> you squeal, one eye closed.");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "A-ah... Fuck! I love it! There, are you happy!? I can’t take this... Fuck me! Please!":"You’re a total... ah... f-f-fuck me! Please, I can’t take this!") + "”</i> he cries in heaving surrender.");
	output("\n\nYou caress his gigantic cock through your middle, grunting when it yanks you hard. You lean forward, grabbing him by the tiny shoulders, abusing him and being abused in equal measure. You’re so enamored by the pillar of dick in your body that you murmur nothings to cope with the strange pleasure. Behind you, the hopper finally crawls over, growling your ear as she thrusts her much more <i>normal</i> cock through the valley of your [pc.ass].");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "About time, honey bun. Why don’t you go ahead and show me how ‘ya feel about being the lesser girl here?":"Oohh, you feel worked up!”</i> You reach a hand back to spread your cheeks, cooing <i>“Then don’t keep me waiting, big girl!") + "”</i>");
	output("\n\n<i>“" + (pc.isAmazon(false) ? "I’ll show you lesser when I’m...”</i> The Hopper thrusts indignantly into your [pc.asshole]. <i>“...When I’m turning you into a cum bubble!":"You want him, you get me too...”</i> She growls, thrusting indignantly into your [pc.asshole]. <i>“...I’m gonna fill you until you’re just a cum bubble, slut!") + "”</i> " + (pc.isAmazon(false) ? "You can’t deny her energy is already firing you up!":"Fuck yes! Every drop in her balls too? <i>Aren’t you just the luckiest slut to get two laquine’s hosing you down?</i>"));
	output("\n\nThe Hopper’s legs catapult her forward and quickly settle into a series of gyrations that’d put the precision of machinery to shame. The azure bunny reams you with such speed and force that her tremendously gravid and fuzzy nutsack doesn’t flop back and forth as you would expect. That lust-fattened cum-bag merely hovers and jiggles an inch or two from the [pc.skinFurScales] of your [pc.ass] - it’s a closeness that chucks hormones and adrenaline through your body. The sheer testicular presence she maintains back there is absolutely arousing - it’s an all new force of nature that’s fucking your fight-or-flight reaction.");
	enemy.cocks[0].cLengthRaw -= 10;
	pc.buttChange(enemy.cockVolume(0));
	output("\n\nYour thoughts immediately drift to her plastering you, L.D.C., and the entire bed in a wave of laquine sperminess that’d put her entire race to shame. But mostly, you think about what it’d be like trying to take possession of those unstable spunk-reactors on your own time...");
	output("\n\n<i>“Think you can just come in here... Walk all over us...? Think again!”</i> Not to be outdone, you ignore the firm paws on your waist and continue to bury the inky boy into his mattress, gritting your teeth the whole way. One deep and extremely fast thrust after the other, the pent-up shock-rabbit is making you moan louder and louder. Slap, slap, thump, fwump, she channels all of her ire and desire into your butt, practically fucking you and her little lover simultaneously.");
	// PC multi vagina (2 pussies)
	var y:int = -1;
	if(pc.totalVaginas() > 1)
	{
		y = 1;
		if(y == x) y = 0;
		output("\n\nSeeing the extra hole" + (pc.totalVaginas() > 2 ? "s":"") + " unused next to LDC’s insertion, you squeak when the lapine humper withdraws from your chute and slams herself into your unclaimed [pc.pussyNoun " + y + "], the abruptness and curling pressure forcing her to shoot right into your ancillary womb. <i>“You wanted to fuck us that bad? I’ve got plenty to spare, bitch!”</i> she growls, her dick inflating to the point that it seals itself in your hole while it dumps a gallon or two of lapine nut-butter inside. By the time that hole milks her thoroughly, she’s already pulled out, baring her throbbing bitch-inflater to the air.");
		pc.cuntChange(y, enemy.cockVolume(0));		
		flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
		pc.loadInCunt(enemy,y);
		// PC multi vagina (3 pussies, add-on)
		if(pc.totalVaginas() > 2)
		{
			var z:int = 0;
			while(z == x || z == y) { z++; }
			output("\n\n...And she’s stuffing your third [pc.pussyNoun " + z + "] with that spunk-stained rod, writhing and howling, her muscular breeder thighs <i>whapping</i> into you with hostile and totally reckless abandon. Your [pc.tongue] falls from your mouth as you let the domme-rabbit take control, impregnating your third womb with another ecstatic and spite-rushed orgasm. <i>“I don’t use sterilex,”</i> she grunts into your neck" + (pc.hasHair() ? ", tugging on your [pc.hair]":"") + ". <i>“When you have my kids, I’ll come and find them, make them part of my crew...! Maybe next time I’ll make you my personal breeder...!”</i> Another brawny load shatters your coherency.");
			pc.cuntChange(z,enemy.cockVolume(0));	
			flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
			pc.loadInCunt(enemy,z);
		}
		output("\n\nSatisfied, the zap-rabbit reclaims your colon. ");
	}
	else output("\n\n");
	output("An avalanche of juice floods down the sides of LDC’s cock, your [pc.pussy " + x + "] finally adapting (miraculously) to his intrusion. You don’t need to hold onto anything anymore, only enjoy the thickening cocks inside. You lick your lips, simply bucking up and down into the sexually frustrated rabbits. The black bun fights to stay lucid while the blue bun fucks away her anger. All’s good, you think, because you can’t believe how good it all feels. You’re getting all the fat loads you deserve, you’re wringing out the best orgasms from ‘em, all with a pleased expression on your [pc.face].");
	output("\n\nYour [pc.pussies] strain" + (pc.hasVaginas() ? " and flood":"s and floods") + ", oozing mixed cum into musky crotches. <i>“C’monnn, you two can do better than this!”</i> you chirp, a mischievous smile cresting your blissed features. <i>“I’m soo close to cumming, where are you?”</i> One [pc.hand] around LDC’s ears and the other on his balls, you laugh a happy, " + (pc.isAmazon(false) ? "triumphant":"bubbly") + " laugh as you throw him into orgasm. The Hopper’s hand " + (pc.hasEmoteEars() ? "ends up around your [pc.ears]":"on your head") + " doing much the same. Their voices quake into you, weaker effects compared to the hard, intense throbbings of their dicks.");
	output("\n\nThe only warning you get of your conquest geysering is the eye-dilating hoarseness projecting from his muzzle. Something hits you. Not just hit. You’re <i>pulverized</i> by just the first cumshot. <i>“Ahhh, ah fuuuuuck!”</i> LDC says, groaning between limp upward thrusts. Thick gobs of seed don’t spurt or stream, they rocket from the black bunny’s semen-stuffed nads. Your hands ball and your eyes roll back. The pressure from just his was monumental enough, but then...");
	output("\n\nThere’s... a taste in your mouth. You realize all too quickly what musky laquine semen tastes like as salty hardness surges up your throat and down your chin to your [pc.chest].");
	output("\n\n<i>“It’s coming, you feel that..!? My girls wish they could cum this fuckingggg hhhaaaaardd!!”</i> The bunny-bitch you had to get around just hilted her rod in you, and all the weight of her modded up balls flows through your inhumanly inflated body. You’re more cum than [pc.race]." + (!InCollection(pc.race(), "laquine", "half-laquine", "rabbit", "rabbit-morph","laquine-morph","bunny-morph","bunny") ? " All of the bunny-batter pumped into you certainly makes you an honorary laquine!":"") + " Dizziness and ecstasy vie for control of your mental remnants as the combined virility of two unimaginably gifted hyper-bunnies replaces all the blood in your body with cum and more cum.");
	output("\n\nYou gargle, moaning in mindless bliss, gurgling and babbling over waves of bubbly-hot rabbit-spunk. It doesn’t seem to have an end. There doesn’t seem to be an end to the heart-gripping climax at the center of you. Yes, you’re creaming all over LDC, but it’s so distant and unnoticeable compared to his oceanic expulsion.");
	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		output(" However, your [pc.cocksLight] " + (!pc.hasCocks() ? "is":"are") + " certainly making an attempt, ");
		if(cumQ < 25) output("firing off a few bouncy ropes of");
		else if(cumQ < 1000) output("pushing out a few long spurts of");
		else output("blanketing your bottom boy with an equal wave of");
		output(" [pc.cum].");
		// Big enough dick
		if(pc.biggestCockLength() >= 15) output("\n\nYou can’t let that be wasted. Their seed’s going places but yours isn’t! You reach down, with strength you weren’t sure you had, and shove LDC onto the [pc.cockHeadBiggest] of your numbly thrumming [pc.cockNounBiggest].");
	}
	// Merge
	output("\n\nYou are so thoroughly soaked and filled by this point and you don’t care one bit...");
	output("\n\n...Because you weren’t intending to stop at one round. " + (pc.isAmazon(false) ? "It’s not long before you can breathe again and you’re energized by your own release.":"Your own release refreshes your mind, and breathing becomes simple again. There’s so much cum to take, how can you stop?"));
	output("\n\nBy the time their voices reduce in volume, your body unthinkingly prepares to keep going, stuffed to the brim and gravid with copious amounts of alien seed filling its every nook and cranny. There’s nothing but pleasure and more pleasure. Their balls clench against your lower waist, bouncing, yearning to dump more inside you. You can sense the warmth of their goo through places it was never meant to flow. The simplest movements caress LDC’s hypersensitive mast until he’s reacting again, far more interested in another cream filling than he is in being glued to your lust-imbued cunt.");
	output("\n\n<i>“W-wait.. No! You c-can’t... Oh ff...”</i> LDC whines, seeing you move up, and down again. There’s nothing that could have prepared him for you.");
	processTime(35);
	pc.orgasm();
	for(x = 0; x < pc.totalVaginas(); x++)
	{			
		flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
		pc.loadInCunt(enemy, x);			
		flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
		pc.loadInCunt(enemy,x);
	}
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.applyCumSoaked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",drainBunnies3);
}
public function drainBunnies3():void
{
	clearOutput();
	author("William");
	showShockHopperAndLDC(true);
	showName("\nVICTORY!");
	output("Two laquines, black and blue furred, shudder after much too many orgasms. <i>“Ah... Shit... I-I can’t... [pc.HeShe]’s too m-much...”</i> The spent Hopper flops from your [pc.asshole], caked in an alabaster coat spun from several flustered climaxes. <i>“How aren’t you tired...?”</i>");
	output("\n\nRemoving LDC from your overstretched confines is a simpler task than taking it, but goodness do you feel so... empty... without him inside. Cum waterfalls from your ludicrously distended twat" + (pc.hasVaginas() ? "s":"") + ", pouring out onto them and the sheets. <i>“B-b-buh... W-where are we...”</i> he says.");
	output("\n\nThey’re both such a mess! As for you, you simply sigh contentedly, rubbing your bulky, round belly, already feeling pregnant with hundreds of little rabbit-eared munchkins. It would take this entire room of pleasure girls to maybe get halfway to draining those two as you have, but you did it all yourself and you <i>still</i> don’t mind going a little longer!");
	output("\n\nOh well, you’ve got things to do, and getting dick-stuffed by two rabbits was a welcome diversion. Now, what about that probe...");
	processTime(60);
	//More cummies.
	pc.orgasm();
	for(x = 0; x < pc.totalVaginas(); x++)
	{	
		flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
		pc.loadInCunt(enemy,x);	
		flags["LDC_SHOCKHOPPER_CUMIN"] = 3;
		pc.loadInCunt(enemy,x);
	}
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.applyCumSoaked();
	pc.orgasm();
	flags["JUMPER_LEADERSHIP_WINFUCKED"] = 1;
	flags["JUMPER_LEADERSHIP_LIKED_WINFUCK"] = 1;
	flags["SHOCK_HOPPER_FUCKED"] = 1;
	flags["LDC_FUCKED"] = 1;
	clearMenu();
	addButton(0,"Next",postSexShockHopperVictoryEpiloggieDoggie,2);
}

//[+Post Sex]
// After all of my sex scenes do these stuffs.
// William
// 0 = get worship, 1 = threesome, 2 = drain bun, 3 = dom his booty
public function postSexShockHopperVictoryEpiloggieDoggie(scene:int = 0):void
{
	clearOutput();
	showLDCAndShockHopper(true);
	author("William");
	// After [Dom His Butt]
	if(scene == 3) output("<i>“F-fucking... Fuck... You!”</i> L.D.C. whimpers, crawling forward with the strangest look on his face. You can’t help but laugh when you take the ship’s codes from him, looking over the remnants of the Hopper’s uniform. A curious button catches your eye, likely the release for their slave’s collars. You <i>could</i> free them before you leave... before the big-balled bunny-bitch is able to collect her thoughts. Besides, they did help you a bit!");
	// After [Get Worshiped] (any)
	else if(scene == 0) output("You have no problem relieving L.D.C. of the codes to find your probe, ruffling his hair in the process. The Hopper, incidentally, is also in no position to defy you, should you want to release the slaves from a lifetime of collared servitude. Freeing the harem from their lives as bunny-sluts is a button press away, though you’ll have to make that choice now before she has strength to stand again.");
	// After [Threesome]
	else if(scene == 1) output("Naturally, it’s no concern relieving L.D.C. of his meager possessions, such as the codes to obtaining your probe! Something else catches your eye, left behind in the Hopper’s gear: a button. No doubt the release for the slave collars lining the necks of every harem girl on this lovebed. Those bunnies are currently a wreck, but laquines recover fast enough. If you want to free them from their life of submission, then a simple button press is only inches away.");
	// After [Drain Bunnies]
	else output("Of course! The probe, you got so distracted you almost forgot to get those codes off that big dicked bunny! " + (pc.isBimbo() ? "<i>Yoink!</i>":"Easy pickins.") + " In the midst of their helpless moaning, you spot a switch against the sheets, a curious button that, when you eye it, you find the eyes of the harem on you. Must be their collar switches. If you hit that button you could free them from their sexy duties, but that big balled bunny babe is already stirring. Gotta think fast!");
	processTime(2);
	clearMenu();
	addButton(0,"Free",freeDemHaremSlootipies,undefined,"Free","Free the harem-girls. They’ll be able to find their own way out, hopefully without getting into further trouble.");
	addButton(1,"Don’t Free",dontFreeThemSlootySloots,undefined,"Don’t Free","They’re fine where they are, and you can’t go stirring up more trouble than you already have.");
}

//[Free]
// Tooltip: Free the harem-girls. They’ll be able to find their own way out, hopefully without getting into further trouble.
public function freeDemHaremSlootipies():void
{
	clearOutput();
	showLDCAndShockHopper(true);
	author("William");
	output("<i>Tap.</i> The metal rings fit firm to the harem snap off and fall to the sheets or the deck. In confusion they rub their necks, almost in disbelief that they now have the freedom once stolen from them. Scanning their eyes reveals a mix of uncontained joy and a curious bit of reluctance. A deluge of gratitude gives you some comfort as they hurry out of the room, however, some look back to the rising laquine leaders as if they want to stay!");
	output("\n\n<i>“Ah geez, you know most of them weren’t even ours! As if we needed </i>that<i> on our asses too!”</i> L.D.C. grouses. He shrinks back when you cut a knife-like glare his way. <i>“Whatever, we’ll get out of your way then...”</i>");
	output("\n\nThe inky bunny hefts his package and waddles out after the Hopper, neither of them looking back to you. Their toe-steps fade into the background, leaving you alone.\n\n");
	flags["JUMPER_SLAVES_FREED"] = 1;
	processTime(5);
	CombatManager.genericVictory();
}

//[Don’t Free]
// Tooltip: They’re fine where they are, and you can’t go stirring up more trouble than you already have.
public function dontFreeThemSlootySloots():void
{
	clearOutput();
	showLDCAndShockHopper(true);
	author("William");
	output("You shake your head, simply ordering them all to leave. The black and blue buns finally stand, collecting what little possessions they have from the bed. <i>“Get going...”</i> the Hopper mutters, ushering the slaves out one-by-one with the tatters of her outfit in hand. She scoops up their release switch, looking warily at you as she and L.D.C., hefting his package, waddles out with them.");
	output("\n\nTheir toe-steps fade into the background, leaving you alone and ready to move on.");
	output("\n\n");
	flags["JUMPER_SLAVES_FREED"] = -1;
	processTime(5);
	CombatManager.genericVictory();
}
//steele preg ends for ldc/shock hopper kids
public function ldcShockHopperPregnancyEnds():void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass;
	var numChildren:int = 0;
	//var bRatingContrib:int = se.value2;
	//var pregSlot:int = se.value3;
	//var babym:Boolean = (se.value4 == 1);
	
	var multiPreg:Boolean = false;
		
	//use this to track number of wombs giving birth
	flags["LDC_SHOCKHOPPER_MULTIBIRTH"] = 0;
	
	if (pc.hasStatusEffect("LDC ShockHopper Pregnancy Ends 0"))
	{
		se = pc.getStatusEffect("LDC ShockHopper Pregnancy Ends 0");
		numChildren += se.value1;
		pc.removeStatusEffect("LDC ShockHopper Pregnancy Ends 0");
		IncrementFlag("LDC_SHOCKHOPPER_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("LDC ShockHopper Pregnancy Ends 1"))
	{
		se = pc.getStatusEffect("LDC ShockHopper Pregnancy Ends 1");
		numChildren += se.value1;
		pc.removeStatusEffect("LDC ShockHopper Pregnancy Ends 1");
		IncrementFlag("LDC_SHOCKHOPPER_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("LDC ShockHopper Pregnancy Ends 2"))
	{
		se = pc.getStatusEffect("LDC ShockHopper Pregnancy Ends 2");
		numChildren += se.value1;
		pc.removeStatusEffect("LDC ShockHopper Pregnancy Ends 2");
		IncrementFlag("LDC_SHOCKHOPPER_MULTIBIRTH");
	}		
	
	if (flags["LDC_SHOCKHOPPER_MULTIBIRTH"] > 1) multiPreg = true;
	
	var loc:String = getPlanetName().toLowerCase();  //current planet
	
	output("You’ve gotten wetter since this all started, but something’s just happened that redefines your concept of being drenched. You place a protective hand to your belly, and note for the first time that the distension has begun to abate. You’re flooding between the legs... Oh shit...");
	output("\n\n<i>Your water just broke.</i> Your babies are coming. Pain and agony bursts across your middle like arcs of lightning. The ");
	if (multiPreg) output("kicks in your wombs are");
	else output("kicking in your womb is");
	output(" undeniable. Stricken with fear, you let your instincts take over. Your body knows what it needs to do . All you need do is find a place to let it handle this... ");
	
	if (InShipInterior()) output("\n\nAt least you’re safe on your ship. You’d like to have the support of a doctor, but it’s just not possible right now.");
	else if (InRoomWithFlag(GLOBAL.HAZARD)) output("\n\nYou’re afraid and angry, suddenly realizing that you’re nowhere near professional medical care. There’s no helping it... you must give birth alone.");
	else
	{
		output("\n\nAt least you won’t be giving birth unassisted. Perhaps rationality, in the end, won out against the thought-depriving effects of your changed biology?");
		if (silly) output(" Some part of you really hopes you don’t get cited for littering.");
	}
	clearMenu();
	
	addButton(0, "Next", ldcShockHopperSteeleBirth,numChildren);	
}
//steele birth scene
public function ldcShockHopperSteeleBirth(numChildren:int = 2):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var loc:String = getPlanetName().toLowerCase();  //current planet
	var smallHips:Boolean = true;
	if (pc.hipRating() >= 14) smallHips = false;
	var locType:int = 0;
	var multiPreg:Boolean = false;
	var numWombs:int = flags["LDC_SHOCKHOPPER_MULTIBIRTH"];
	if (numWombs > 1) multiPreg = true;
	flags["LDC_SHOCKHOPPER_MULTIBIRTH"] = undefined;	
	
	//on ship 1
	if (InShipInterior())
	{
		output("Finding the medkit takes precedence. You rummage through your storage and clutch it tight to your chest, staggering to your room, the contractions down below hammering a painful reminder, <i>“It’s time!”</i> into you with every step. You can find no words, only huffs and whimpers while you");
		if (!pc.isCrotchExposed()) (" strip down and");
		output(" lie on your bed, ready to let your body work.");
		locType = 1;
	}
	//tavros station 2
	else if (loc == "tavros station")
	{
		output("The moment you scream, everyone nearby turns to you, rushing over to see what they can do to help. You needn’t explain yourself to the peacekeepers in the group, they’re already acting on training. Emergency responders are on the scene in less than a minute, escorting you to their vehicle and hauling you off to the station’s hospital amid an applause filled with congratulatory smiles.");
		if (!pc.isCrotchExposed()) (" The medics relieve you of your clothes en-route.");	
		moveTo("NURSERYE14");
		locType = 2;
	}
	//mhenga zil village 3
	else if (loc == "mhen'ga" && flags["PQ_RESOLUTION"] != -1 && (currentLocation == "11. Zil Village Outskirts" || currentLocation == "12. Zil Village Winnar" || currentLocation == "ZIL FESTIVAL VILLAGE" || currentLocation == "ZIL FESTIVAL YURT"))
	{
		output("Zil are no strangers to procreation, and when they notice you in the throes of childbirth, you are rushed to the healer’s hut. As an honored guest of Quinn’s, all possible anodynes are made available, including the soft hands that tend you at your weakest. The gentle handmaidens");
		if (!pc.isCrotchExposed()) output(" disrobe you and");
		output(" begin to guide you through the arduous process to come.");
		locType = 3;
	}
	//mhenga in civ 4
	else if (loc == "mhen'ga" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("When you slump to your knees, the nearest rusher, a brawny");
		if (CodexManager.entryUnlocked("Saurmorians")) output(" saurmorian");
		else output(" lizard-man");
		output(" charges over. Your pants and groans, and your swollen belly, tell him all he needs to know. You’re scooped up into the giant dino-man’s warm arms - belly facing skyward - and rushed to the local clinic. Once inside, a doctor is all over you by the bedside with a squawking V-Ko droid opposite him");
		if (!pc.isCrotchExposed()) output(" removing your clothes");
		output(".");
		moveTo("ESBETH MEDICAL OFFICE");
		locType = 4;
	}
	//mhenga tarkus in civ 5
	else if (loc == "tarkus" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("Novahome being what it is, you don’t expect there to be a med-station quite up to galactic standards, but there should be plenty of quiet places and even more breed-hungry raskvel to aid you. Sure enough, when you double over and show the tell-tale signs of birthing, a large group of wide-hipped kobold-bunnies usher you to safety, drawing you into a nice little hideaway much quieter than imagined.");
		if (!pc.isCrotchExposed()) output(" They have your clothes off in a jiffy.");
		moveTo("207");
		locType = 5;
	}
	else if (loc == "myrellion")
	{
		var inKressia:Boolean = false;
		if (isNaN(parseInt(currentLocation)))
		{
			if (currentLocation == "LIEVE BUNKER" || currentLocation == "FAZIAN_RESCUE_ROOM" || currentLocation == "KRESSIA MEDICAL") inKressia = true;
		}
		else 
		{
			if (parseInt(currentLocation) >= 800 && parseInt(currentLocation) <= 899) inKressia = true;
		}
		
		//myrellion red myr 6
		if (inKressia) 
		{
			output("A duo of red myr soldiers discover your peril. Sensing your distress they rush you to the Kressia medical center as quickly as they can, delivering you into the capable arms of their CMO, Anzhela. The red doctor");
			if (!pc.isCrotchExposed()) output(" disrobes you and");
			output(" gets you to the cleanest bed she can find, well away from other patients. You hope that she and her staff are familiar with non-myr birthing procedure.");
			moveTo("KRESSIA MEDICAL");
			locType = 6;
		}
		//taivra 7
		else if (currentLocation == "2E11" || currentLocation == "2E13" || currentLocation == "2G13" || currentLocation == "2G15" || currentLocation == "2G17" || currentLocation == "2E17" || currentLocation == "2C11" || currentLocation == "2C13" || currentLocation == "2C15" || currentLocation == "2C09" || currentLocation == "2A09")
		{
			if (flags["KING_NYREA"] == 1 && flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output("Being the subjugator of");
			else if (flags["KING_NYREA"] == 1) output("Being the " + pc.mf(" husband"," wife") + " to");
			output(" an alien royalty has its perks. Namely, being able to command the assistance of the resident nyreans and their queen on your final step through pregnancy. You’re taken to Taivra’s bedchamber and afforded all the care you could possibly need to make this birthing much less painful than it needs to be. All the water and blankets they can find are brought to your bedside");
			if (!pc.isCrotchExposed()) output(", clothes are finally removed");
			output(".");
			moveTo("2C15");
			locType = 7;
		}
		//myrellion gold myr 8
		else
		{
			if (InRoomWithFlag(GLOBAL.HAZARD))
			{
				output("A few rushers cross your path. You explain what’s going on before they anxiously hurry you to the great elevator and down to the gold myr city where help awaits.");
			}
			else
			{
				output("To your delight, a gold myr squad on patrol are at your side when you cry out for help.");
			}
			output(" The sprawling Gildenmere hospital welcomes you immediately, and a team of professionals is assigned right away to your imminent birthing. A cozy bed is prepared and all possible amenities are provided");
			if (!pc.isCrotchExposed()) output(" as soon as your clothes are off");
			output(".");
			moveTo("741");
			locType = 8;
		}
	}
	//uveto kryms camp 9
	else if (loc == "uveto vii" && currentLocation == "UVGR M4")
	{
		output("It could be worse. For instance, you could be somewhere far away from this insulated bunker and the fierce warrior lady who resides within. <i>“Steele... you’re not...”</i> she starts, <i>“You’re giving birth, here!?”</i> Krym looks flabbergasted, but wastes no time bringing you in from the cold and straight to her bed. She’s storming around the cozy little hideaway for anything that might be useful");
		if (!pc.isCrotchExposed()) output(" while you undress");
		output(", soon returning with water and extra blankets.");		
		locType = 9;
	}
	//uveto korgii hold 10
	else if (loc == "uveto vii" && currentLocation.search("KORGII") >= 0)
	{
		output("Hand on the wall you call out for any one of the fluffy korgonne to help you to safety. To your imminent relief, two of the Hold’s guards are hefting you to the communal nursery, a breeding room and birthing room all in one filled with a number of mothers, expecting and otherwise. You’re given the last bed and left in the capable hands of the tribe’s healer");
		if (!pc.isCrotchExposed()) output(", those hands already seeing to your clothes");
		output(".");
		locType = 10;
	}
	//uveto town 11
	else if (loc == "uveto vii" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("The worst possible thing to be right now is cold, and the chill of Uveto is biting deeply. Fortunately, Irestead is home to many people, and those many hardy folk are already at your side, helping you to your feet and barking orders at others while they carry you to safety. Inside a local care center you’re waited on by two doctors who get you into the warmest corner they can find before");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" prepping you for birth.");
		locType = 11;
	}
	//new texas 12
	else if (loc == "new texas")
	{
		output("Pain consumes you almost immediately, and on a libertine paradise like New Texas nobody could miss your discomfort. Certainly, wherever two very bubbly cowgirls are hustling you now will be a safe enough place to give birth to your kids, far away from the easily excitable bulls that have cocked their heads in your direction. The two bosomy babes get you settled in their home,");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" grabbing whatever they could possibly need for your babies.");
		locType = 12;
	}
	//gastigoth 13
	else if (loc == "gastigoth station")
	{
		output("The well-trained guards on a maximum security prison-station like Gastigoth recognize your plight immediately. The station’s facilities are used typically for impregnated inmates, but they’ll have you as a special guest today.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 13;
	}
	//breedwell 14
	else if (loc == "breedwell centre")
	{
		output("For a place named Breedwell, it comes as no surprise they’re equipped to handle a " + pc.mf("childbearer","mother") + " in need, and you’re rushed to the first available bed.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 14;
	}
	//canadia 15
	else if (loc == "canadia station")
	{
		output("A nurse on vacation introduces herself rather eloquently and helps you to her rented room in the station’s lodgings.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 15;
	}
	//uveto station 16
	else if (loc == "uveto station")
	{
		output("A flock of toves and a few other employees - Steele Tech scientists - have your back the second you collapse, ushering you into the station’s medbay and leaving you in the hands of trained caregivers.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 16;
	}
	//zheng shi rat friends 17
	else if (loc == "zheng shi station" && ratsPCIsGood() && (boredJumperPregLocation() == 0 || boredJumperPregLocation() == 1))
	{
		if (boredJumperPregLocation() == 0) output("The heat of the mines mixes with your weakness, makes the gush of cream at your loins all the more noticeable. A cold rush of adrenaline flows when you hear hasty footsteps.");
		else if (boredJumperPregLocation() == 1) output("Whilst you search for a safe place, a cold rush of adrenaline flows when the rapid ‘taptaptap’ of footsteps catches you off guard.");
		output("You brace yourself for the worst, until three rats, decked out in their usual gear, stop short of you with worried looks on their faces. <i>“[pc.Mister] CEO! What are you doing walking around like that? You can’t stay here! Come on, we know all the good hiding spots!”</i>");
		output("\n\nThe pink-furred rodenian and her entourage take you by the arms, lending you their oh-so small shoulders as they usher you into a maintenance room of sorts. It’s surprisingly cool and spacious; it’s perfect for your needs. The rascals set about scooping up whatever they could need to help, finding cloths, fabrics, water, anything that might help.");
		if (!pc.isCrotchExposed()) output(" The last thing they do is help you out of your gear.");
		locType = 17;
	}
	//zheng shi mines 18
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 0)
	{
		output("Fuck... This is perhaps the worst possible place you can bring a child into the galaxy, but you won’t make the walk back to the hangar. Fortunately, there are a few dead ends in these mines that the pirates have long lost interest in. They’ll have to do. At least it’s a little cooler here than the network at large.");
		locType = 18;		
	}
	//zheng shi foundry 19
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 1)
	{
		output("You keep your voice down lest any pirates on patrol catch wind of it. There are plenty of unused, prefab extensions to this floor, perfect for hiding away. On the way to such a secluded room, you’re at least able to find a crummy looking medkit with the barest essentials inside. It’ll have to do.");
		locType = 19;
	}
	//generic civ 20
	else if (loc != "zheng shi station" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("A local " + RandomInCollection(["man","woman"]) + " comes running at your distress. When the adrenaline runs its course, they have you in the hands of medical staff on your way to the local clinic. Once there, you’re given the coziest bed and prepared for birthing");
		if (!pc.isCrotchExposed()) output(", your clothes having been removed on the way");
		output(".");
		locType = 20;
	}
	//default 0
	else
	{
		output("It takes much too long to find a place safe enough, but you do. It’s going to hurt like hell, of that you have no doubt, but you remind yourself that these are the kinds of conditions people in history endured. If they can do it, why can’t you with all of today’s advancements marking you as a product of your time? You try to keep your mind off the dangers, breathing in rhythm, ready to go through this");
		if (!pc.isCrotchExposed()) output(" after shucking your kit");
		output(".");
		locType = 0;
	}
		
	output("\n\nSpreading your legs is the only easy part of this tribulation. Labor aches tear through your body, overwriting all unpained nerves with the sensation before surging downward to your vagina");
	if (numWombs > 1) output("s");
	output(".");
	if (numWombs == 3) output(" You’re on autopilot; your triumvirate of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else if (numWombs == 2) output(" You’re on autopilot; your gemini of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else output(" You’re on autopilot; your womb softens and your cervix dilates as your bundles of joy enter the galaxy.");	
	output(" You can feel the weight, the width, the diameter, the <i>everything</i> of the first little munchkin spreading your straining birthing canal wide between your body’s organ-clenching contractions.");
	if (pc.gapestVaginaLooseness() >= 4)
	{
		output(" Considering how loose you are, it could be much worse");
		if (smallHips) output(", particularly as your pelvic structure widens to handle the process");
		output(".");
	}
	else
	{
		output(" Your tightness only makes this harder");
		if (smallHips) output(", not to mention it’s a pain on top of your reshaping pelvic structure");
		output(".");
	}
	
	if (flags["LDC_SHOCKHOPPER_PREGBY"] != 3 || !multiPreg)
	{
		output("\n\nThe first laquine’s head emerges from your snug tunnel. Or rather, the <b>" + RandomInCollection("upraised ears","lop ears") + "</b> do. You push, screaming with tears in your eyes until your first laquine baby pops out unceremoniously. You can’t focus on it at all, head thrown back in dissipating agony as the next one moves through. Another pair of floppy ears emerges, and another small rabbit squirms out");
	
		if (locType == 3) output(" to be wrapped up and cleaned by the quiet zil maidens.");
		else if (locType == 5) output(" to be wrapped up and cleaned by the attending raskvel.");
		else if (locType == 10) output(" to be wrapped up and cleaned by the healer-pup.");
		else if (locType == 12) output(" to be wrapped up and cleaned by the humming cowgirl.");
		else if (locType == 15) output(" to be wrapped up and cleaned by the red-headed nurse.");
		else if (locType == 17) output(" to be wrapped up and cleaned by the rodenian and her friends. <i>“Ohh, you’re doing fine, [pc.mister] CEO!”</i> she chirps");
		else if (locType == 2 || locType == 4 || locType == 6 || locType == 7 || locType == 8 || locType == 9 || locType == 11 || locType == 13 || locType == 14 || locType == 16 || locType == 20) output(" to be wrapped up and cleaned by the nurses at your side.");
		else output(".");
	}
	
	//special birth scene for preg by both ldc and shockhooper
	if (flags["LDC_SHOCKHOPPER_PREGBY"] == 3 && multiPreg)
	{
		//randomize which kid pops out first
		var ldc:Boolean = false;
		if (rand(2) == 0) ldc = true;
		
		output("\n\nAfter taking on both the oversexed rabbits in charge of a gang of bunny-pirates the way you did, pregnancy was as assured as continued cosmic expansion. While L.D.C. could only fill one womb, his bottom bitch filled the other");
		if (numWombs > 2) output(" two");
		else output(" one");
		output(" so well that you can still remember the weight of her spunk. Well, now all you’ve been burdened with are their children, and you’re having them right now!");
		
		output("\n\nYou idly fantasize about which color might pop out first, the blue or the black. Turns out,");
		if (ldc) output(" to your surprise, it’s the black. Your first born child is a jet-black bunny with upright ears. How fitting!");
		else output(" it’s the blue. No surprise! The Hopper was the one who seemed to be on top of things! Why wouldn’t her kids take precedence?");		
		output(" The pain you feel between your waist-expanding contractions is nothing compared to the sensations of when you drained Zheng Shi’s top buns, when your sexual prowess put them in their rightful places.");
		
		output("\n\nAnd of course, their buns in your oven!");
		output("\n\nThe next one to flop out is");
		if (ldc) output(" all blue and creamy white like the Hopper!");
		else output(" midnight-black. L.D.C.’s kids are like little soot sprites rather than bunnies!");		
		output(" Bearing the fruits of two powerful breeders is a pleasure all on its own. You can’t wait to hold them in your arms, to raise them right, to take from such criminals like those two and make wonderful children all on your own! Maybe you can go back and ‘redeem’ those tricksy rabbits when you’re done?");
		
		output("\n\nFor now though, you’ve gotta tough this out.");
		if (pc.isBimbo()) output(" No big deal! If you could handle those two with your body, then giving birth is nothing!");
		else output(" Which is easy. You were able to handle those two at their best and shrug it off like it was nothing. You’re too strong to be put down by a few aches and pains.");
		output(" You’ve got your eyes wide open, though you can’t really put voice to anything. There’s a deep excitement whenever you see a pair of ears part your vaginal lips and flop out into the universe, covered in a sheen of you.");
		
		output("\n\nYou’re not sure where it started and how it’s going to end, but you’ve given birth to several kids already.");
		if (numWombs > 2) output(" Three");
		else output(" Two");
		output(" whole litters are piled up in a sprawling pool of mewling munchkins, " + num2Text(numChildren, true) + " laquine boys, girls, hermaphrodites, there’s every combination you could imagine! Some with little fur, some totally coated in it, but they’re all the offspring of your piratical tryst. All-black and blue and vanilla coats or limbs shimmer; eyes not even opened yet, they cry out quietly for you.");
		output("\n\nYou giggle happily, not even realizing the pain has passed. No sense in wasting any more time: you reach over and pull them all into your arms, a positively delightful and bubbly heat blossoming throughout your soul.");
	}
	else if (numChildren == 2)
	{
		output("\n\nCuriously, it ends there. The hormonal weight on your mind lifts, and a cold sweat washes over your body between the fading spasmic pains. There are faint little squeals that bring your brain back to reality between the waves of endorphins. The reality being that you’ve safely given birth to <b>two laquines,</b>");
		output(" with mixed colors, one part of the palette containing <b>your [pc.hairColor] hair</b> for fur up and down their tiny sizes.");
		
		output("\n\nYou lean over and scoop the twins into your [pc.arms], gently wiping the ‘you’ off of their faces while their tiny hands reach out for their mother. You just want to hold them close forever, to always remember how wonderful this moment right here, right now, is, and will always be. A warmth as fuzzy as your offspring dominates your recovering form...");
	}
	else if (numChildren > 2 && numChildren <= 8)
	{	
		output("\n\nYou’ve got more coming, but it does get noticeably easier. Your neck muscles dry up as your grunts and moans dissolve into gravelly rasps of relenting anguish.");
		if (numChildren == 3) output(" One more rabbit falls from your hole, landing next to its siblings.");
		else if (numChildren == 4) output(" Another rabbit falls out closely tailed by another, flopping into the world next to their siblings.");
		else if (numChildren == 5)
		{
			output(" It’s hard to believe, but you can feel three rabbits in your hole");
			if (numWombs > 1) output("s");
			output(" right now, emerging at roughly the same time from your capable body and flopping out next to their siblings.");
		}
		else if (numChildren == 6)
		{
			output(" Your bloated belly noticeable compresses when two rabbits flop out in front of you, followed closely by two others from");
			if (numWombs > 1) output(" separate holes.");
			else output(" the same hole.");
		}
		else if (numChildren >= 7)
		{
			output(" Undoubtedly, you’re carrying a full litter; you loose an animalistic growl, immersed in some twisted gestalt of euphoria as you feel all of them pushing through your stretching tunnel. Ears, hands, and digitigrade feet emerge from your overstretched cavern; your last screams carry them the rest of the way through");
			if (numWombs > 1) output(" separate holes");
			else output(" the same hole");		
			output(" until they’re all flopping out into a pile of weighty, mewling bunnies, some with little fur and others totally coated.");
		}
		
		output("\n\nThe pain clears up; endorphins and adrenaline are chucking through your system at record levels. A weight on your mind eases and vanishes, leaving you feeling cold and relieved -- sucking for air is the most you manage. You can now clearly hear the squeals of your children, waiting for their first meal. Once your vision realigns, you take in their features, leaning up and over to bring them into your [pc.arms].");
		output("\n\nYou’ve given birth to " + num2Text(numChildren) + " laquines, a variety of girls, boys, and natural hermaphrodites. Each one is painted with varying amounts of fur, pelts of mixed colors including <b>your [pc.hairColor] hair!</b>");
		output("\n\nScooping them up into your arms is one of the most enjoyable things you can say you’ve ever done. Joyfulness buzzes throughout your body with a rich, creamy texture. There’s something all too intoxicating about the way they grasp cutely at your [pc.skinFurScalesNoun]. Brief, ecstatic fantasies about who and what they might become fill your mind too.");
	}
	else if (numChildren > 9 && numChildren <= 16)
	{	
		output("\n\nIf you thought it was going to get any easier, you were dead wrong -- ");
		if (numWombs == 3) output("all");
		else output("both");
		output(" of your holes stretch and squirm against each other with the weight and form of multiple laquines squishing through them. Lop and upright ears poke through your widening slits, the contractions not enough to push them out, needing your aid to do it. And provide it you do, squealing yourself hoarse as several children pop out, followed by more, more...");
		output("\n\nDistracting yourself with idle, pain-fragmented fantasies is the best you can do. <i>It’ll be over soon,</i> you think to yourself; <i>your kids sound and look so healthy!</i> you mentally utter. Sure, you only caught the briefest glimpse before another hip-extending contraction slipped another laquine through, but the growing volume of hungry babies tells you that you’re doing just fine");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(", the encouragements of your attendants notwithstanding");		
		output(".");
		
		output("\n\nAdrenaline, endorphins, and a little serotonin have you slowly deflating your stomach one neonate critter at a time.");
		if (numChildren >= 13) output(" Your sizeable litter continues to swell in size. So many yous, unable to open their eyes, are huddling together with twitching noses and soft squeals. The final bun flops out into the galaxy when you’re on the verge of slipping into unconsciousness.");
		else output(" You’ve given birth to a sizeable litter, and to your great relief, the pain begins to fade away when the last little bun flops out into the galaxy.");
		
		output("\n\nYou pant, heave, and pant some more, finally able to sit up and take stock of your children. " + num2Text(numChildren, true) + " laquines are huddled in a pile. Girls, boys, natural hermaphrodites, you’ve given birth to just about every combination of space-rabbit there is. Their furs are shimmery, if a little reddened with your innards. Some have full coats, others only have it on their limbs. The colors are all similar though;");
		output(" they have wildly contrasting colors, the majority of the palette containing your [pc.hairColor]!</b>");
		output("\n\nYou let out a soft huff as you slump forward, bringing the first few into your [pc.arms]. There’s something undeniably magical about the act. Seeing them is one thing, but holding them... the inner jubilation you feel is a delight you wish never to end. Your mind drifts to thoughts of their futures, gleefully imagining them as happy as you are right now.");
	}
	else if (numChildren >= 17)
	{	
		output("\n\nThe sheer amount of pain you’re in is indescribable. Excruciating is the understatement of the year, the century, <b>the fucking millennium.</b> <i>It hurts.</i> And it’s all worth it just to feel one, two, three little critters all wiggling their way down your snug passages. You were filled to the brim with a laquine’s seed, and now you’re bearing the fruits of coitus with a gifted breeder. You could not be happier, but you could not be in any more agony than you are. Certainly, nothing will ever compare to this, mothering three litters all at once. ");
		output("\n\nSaving your strength for your rippling loins somehow keeps you conscious during this ordeal. Were you ranting or grousing, you might not have as much a hold on reality as you do. Indeed, some part of you thinks that being anesthetized for this would be a cowardly way out...");
		output("\n\nFantasies of how they will look, the sounds they make when they add themselves to the fuzzy pile of newborn runts, it all keeps you going. You can’t pass out. <i>You must not pass out.</i> You’re the mother of three entire laquine litters. They need you, and you need to be there for them. And so, you push. You scream yourself into hoarseness, barely keeping your thighs down and spread, making sure your distending waistline aims the rapidly squirming bundles next to their siblings.");
		output("\n\nEvery time you feel a pair of lips spread and a fuzzy boulder pass, another takes its place, and then two more beside it. You grit your teeth and play back in your mind whatever you think might help. A funny movie you watched in your younger years. A book you read a dozen times. That weird gift you got during a holiday. It doesn’t matter, just... you just need something to hold on to.");
		output("\n\nYou’re inhaling so hard that your ribcage shows through your [pc.skinFurScales]. Color drains from your cheeks and lips, spread wide and strained just as badly as your vaginal trio. Lop and upraised ears both stick out then flip over adorably, more, more... you have no idea what the count is, only that you’re a mother who’s bringing so many kids into this galaxy.");
		output("\n\nAnd then... it just ends. You didn’t even feel the last one shirk your internal protection, only the relieving weight of adrenaline and endorphins beginning the slow cleanse of your body. There’s only a tiny lurch in your [pc.fingers], a little thrum in your [pc.legsNoun]. There’s a hollow gasp before you can finally sit up, an exceedingly difficult thing to do. But so, so worth it...");
		output("\n\nWhen you look down to the mound of squeals and twitching ears, your heart flutters. It feels so light that it might just be floating away to heaven, enraptured by the sight. Your " + num2Text(numChildren) + " children all huddle together for warmth, each covered in a little bit of you. It’s no surprise you’ve just spawned every conceivable combination of laquine there is: boys, girls, hermaphrodites, lop-ears, upraised ears, furry limbs, totally furry, there’s almost too much to take in. Despite being marred by a little internal sheen,");
		output(" the contrasting colors of their pelts - the majority of it being your [pc.hairColor] - is beautiful.");
		
		output("\n\nScooping up the first of your sons and daughters for the first time is a feeling utterly indescribable. They’re your kids. You made this possible. You gave them life. You’re overcome with empathy and happiness, feeling like all that matters is right here, right now. The maternal feelings running through your mind are dominant, suppressing all other thoughts and emotions to allow you this hypnotic reprieve.");
	}
	else
	{
		output("\n\nYou give birth to " + num2Text(numChildren) + " kids!");		
	}

	//increase hipsize
	if (smallHips) pc.hipRating(numWombs);
	
	clearMenu();
	addButton(0, "Next", ldcShockHopperSteeleBirthNext, [numChildren, locType]);	
}

public function ldcShockHopperSteeleBirthNext(arg:Array):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var numberChildren:int = arg[0];
	var locType:int = arg[1];
	
	var milk:Number = 200 * numChildren;
	if (milk > pc.milkQ()) milk = pc.milkQ();
	
	if (boredJumperBreastFeedOK())
	{
		output("You can feel your [pc.breasts]");
		if (pc.milkQ() >= 2000) output(" straining");
		else output(" sloshing");
		if (numChildren >= 6) output(" at the idea of feeding this many children, but feed them you must.");
		else output(" at the idea of feeding your children.");
		output(" A little wince and grunt is nothing compared to the " + (pc.pregnancyIncubationBonusMother() < 14 ? "weeks" : "time") + " you’ve endured, and as you get yourself ready you let out a happy, bubbly sigh.");
		
		if (numChildren == 2) output("\n\nThe twins feed from each [pc.milkNoun] dripping nipple while you cradle their heads with profound gentleness.");
		else
		{
			output("\n\nYou guide the mouths of your newborns to your [pc.milkNoun] dripping nipples");
			if (pc.breastRows.length > 1) output(", glad that you have extra jugs to satisfy a litter of this size");
			output(".");

		}
		output(" Soft wet noises are all you hear");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(" between the congratulating coos of your bedside assistant");
		output(".");
		
		if (numChildren / 2 > pc.breastRows.length)
		{
			output(" When the quiet suckles stop, you bring the next hungry mouth");
			if (numberChildren % 2 == 0) output("s");
			output(" to your chest");
		}
		else output(" When the quiet suckles stop, you set the two siblings down and hold them close to your neck");
		
		output(". Relief floods through you with the same unceasingness your [pc.milkyNipples] dribble their rich treat, as eager for its recipients as they are for it.");
		
		pc.milked(milk,true);
	}
	else
	{
		output("You don’t have any milk, not in you or on you, and that thought brings you some amount of discomfort. They’re expecting their first meal, but you can’t provide.");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) 
		{
			output(" Fortunately, your bedside attendant has things covered.");
			if (locType == 12) output(" What kind of universe would you be living in if there wasn’t any milk on New Texas?");
		}
		else output(" There’s nothing for it but to keep your kids safe while waiting for their taxi to come by.");
	}	
		
	output("\n\nFor your part, all you do is lie there in total relaxation, delighting in the feel of twitching whiskers against your [pc.skinFurScales]. When you focus hard enough, their tiny lungs and the little airs they breathe can be heard. Craning ears pulse against your body, a much more pleasant sensation than a kick to your placenta! You curl into a fetal position yourself; whatever keeps the fuzzy pile of rabbits close to you, that’s what you’re doing. Their shared body heat and the low vibrations in their bodies keep you company.");
	output("\n\nYou would drift off to a nap, but you can’t. You know better than anyone that you can’t leave them here, and you can’t stay like this. There’ll be time for enjoying their company later, but their safety and needs cannot be guaranteed in this place.");
	
	if (locType == 2)
	{
		output(" Your kids belong in your nursery, and you alert the medical staff to that fact. Once you tell them your name, you need not say anything more.");
		output("\n\nWhen you can finally stand again, thanks in part to the wonders of medical science, you help the doctors prepare your kids for transfer. Once they’re all safe, you watch with some amount of discomfort as they’re taken away. Sure, you know where they’re going, and you trust them fully... but something about it fills you with sadness.");
		output("\n\nThat sadness, however, will evaporate when you go and visit them later!");		
	}
	else
	{
		output(" A mechanical chirp from your codex alerts you to the incoming nursery probes.");
		if (numberChildren > 2)
		{
			if (numberChildren > 8) output("\n\nThe retrieval shuttles zero in on your location, and there are many of them. Good thing your codex is on top of things!.");
			else output("\n\nThe retrieval shuttles zero in on your location.");
		}
		else output("\n\nThe retrieval shuttle zeroes in on your location.");
		
		output(" Shaken but not stirred, you rise to your feet and, with the utmost caution, load your children into its warm confines");
		if (numberChildren > 8) output(", one after the other");
		output(". When they’re all filled, you watch the humming taxis whirl back into space on a one way trip to your nursery. You can’t help but think about something going wrong, about never seeing one or all of your kids again.");
		
		output("\n\nMost of all, you simply feel sad letting them all go. Still, that sadness evaporates when you think about visiting them as soon as possible. Yeah. They’ll be there when you get there, and they’ll all be fine!");
		output("\n\nFor now, though, it’s time to get going...");
	}	
	
	processTime(60 + ((rand(15) + 5) * numChildren));
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}