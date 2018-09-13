/*Gabilani LG-BT
20k word limit
//By Nonesuch


Notes

A gabilani male/female couple are spending their mandatory shore-side vacation terrorizing the wasteland around Arbetz in a battle walker (Luxury Gabilani Bipedal Transport).
The thing is 18 feet tall and heavily armored from the belly down, with a missile launcher, twin laser cannon and an EMP wave gun. Above that the cockpit is a luxury limo goldfish bowl - the pair of them have got a bar, a divan and a miniature sauna up there, as well as a monitor pit to take in the action from every possible angle.
To begin with the LG-BT gets two actions - whatever its A.I. decides to do, and then the gabilani get a go. The LG-BT is immune to lust, but the goblins are weak to tease damage! If the PC maxes out their lust it cancels their attack for the next three rounds, as they start fucking each other (causes the PC tease lust damage).
Win scene ideas - fuck one and tease the other. Double oral. 
Loss scene ideas - they tie you to the bottom of the cockpit and let the LG-BT’s accompaniment of auto sex-toys have their way with you, drive around for a while like that. Two scenes where the fem goblin does you and the male watches, one vice versa.
Special scene for bimbos where you skip combat if you just agree to being their carry-around sex pet for a little while?

*//*
Stats

//Requires PC level 5 at least to find, encountered only in the north-west of map near the travel agency.

Level 6

HP: 120
Shields: 80
Initial Lust: 40

Resists: -100% to pheromone, -100% to poison, -50% to flame.

Weaknesses: +35% to electric, +35% to tease.

Drops: Goblinola, credit chit.

*/

public function showLGBT(sexy:Boolean = false):void
{
	showName("GABILANI\nLG-BT");
	showBust((sexy ? "LGBT_PILOTS":"LGBT"));
}
public function standInGabiCockVolume():Number
{
	var dicku:CockClass = new CockClass();
	dicku.cLengthRaw = 7;
	return dicku.effectiveVolume();
}
public function gobboVagiCapacity():Number
{
	var capacity:Number = 20;
	//Factor in looseness! - 2/24/15 - buffed looseness a bunch
	capacity *= (1 * 5 + 1)/3;
	//Add bonuses!
	capacity +=50;
	//CoC-tier wetness 5 will double capacity.
	capacity *= (3+4)/5;
	//elasticity bonuses!
	capacity *= 2;
	return capacity;
}

//Intros
public function encounterLGBT():Boolean 
{
	showLGBT();
	author("Nonesuch");
	//First
	if(flags["MET_LGBT"] == undefined)
	{
		output("\n\nYou hear the thing long before you see it. The haunting groan of stressed metal, collapsing scrap and even the clink and cough of ratbag industry are nothing new to hear on Tarkus’s wind, but this is something quite different: the rhythmic, calamitous stomp and moan of some great and terrible mechanical beast, " + (silly ? "slouching towards Novahome, its hour come round at last":"coming closer with every clanging step") + ". The poisoned earth beneath your [pc.footOrFeet] shakes, and you fight the instinct to run.");
		output("\n\nWhen it finally looms into view around a heap of scrap, your first instinct is that you’re experiencing a fever dream. You see a gigantic synth-glass bubble, seemingly bobbing through the air. Inside... " + (CodexManager.entryUnlocked("Gabilani") ? "two gabilani? They must be. Squat, blue-skinned, human-featured aside from those long, elven ears, a male and a female.":"two small, blue aliens, human-featured aside from their long, elven ears, one evidently male and the other female.") + " They’re glossy with health and wealth, dressed in tight-fitting jumpsuits, and plumped into what looks like total luxury - the bubble is filled with cushions, drink and creature comforts. Is that a miniature sauna?!");
		output("\n\n<i>“Ooh hello, what’s that?”</i> giggles the female, her voice augmented and projected like an otherworldly DJ. Round camera drones attached to the synth bubble flash at you. <i>“What an odd-looking ");
		var race:String = pc.race();
		if(race == "raskvel") output("herliani!");
		else if(race == "gabilani" || race == "goblin") output("gabilani!");
		else output("sydian!");
		output(" Darling, bring the pede around.”</i>");

		output("\n\nWith a moaning thud and crunch, the bubble bounces towards you around the scrapheap... and you finally receive the full picture. Bearing the pair’s spherical luxury around is a great, bipedal armored machine, pitted and greasy with heavy usage and armed to the absolute teeth. Fuck the One, <b>look</b> at that gear: It’s got a chunky, twinned laser cannon, a box missile launcher, and a six-foot pronged zapper coiled in wires. It’s all now pointed at you.");
		output("\n\n<i>“Now then dear, I don’t believe that is a ");
		if(race == "raskvel") output("raskal");
		else if(race == "gabilani" || race == "goblin") output("gabilani");
		else output("sydian");
		output("!”</i> brays the male, craning over and examining you through a cluster of opera glasses. <i>“It must be one of those visitors from beyond we’ve been hearing so much about. Fancy running into one on our shore-side vacation!”</i>");
		output("\n\n<i>“Oh, say we can play with it anyway,”</i> the female cries, gazing down at you lustily. <i>“It looks like such fun!”</i>");
		output("\n\n<i>“I don’t see why not,”</i> the male shrugs. <i>“They can’t be anyone important if they’re all the way out here. And they’re probably looking for a bit of excitement. Aren’t you, " + pc.mf("old boy","old girl") + "?”</i>");
		output("\n\nThey clink their cocktail glasses together as the walker advances upon you, shaking the ground with every step, its arsenal humming with terrible portent.");
		if(!CodexManager.entryUnlocked("Gabilani"))
		{
			output("\n\nUnder the tumult, you hear your codex serenely inform you that it’s downloaded information about the pair’s race.");
			CodexManager.unlockEntry("Gabilani");
		}
	}
	else
	{
		output("\n\nThump. Clank. Groan. Thump. Clank. Groan. You always hear the monstrous gabilani-crewed walker well before it hoves into view, not that that is much comfort. The LG-BT has telescopic cameras which can see for miles, and its owners have clearly developed a taste for you.");
		output("\n\n<i>“An alien!”</i> cheers the female, when their bubble comes into eyeshot. <i>“And here I thought this trip was going to be a damp squib!”</i>");
		output("\n\n<i>“Ooh, I do love a bit of exoticism to tell the folks about back in orbit!”</i> says the male, rubbing his hands together over the control panel. <i>“En garde, " + pc.mf("Master","Miss") + " Alien!”</i>");
		output("\n\nThey laugh and throw back their drinks as the walker advances upon you, shaking the ground with every step, its arsenal humming with terrible portent.");
	}
	IncrementFlag("MET_LGBT");
	CombatManager.newGroundCombat();
	var tEnemy:Creature = new LGBT();
	CombatManager.setHostileActors(tEnemy,new LGBTPilots());
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatLGBT);
	CombatManager.lossScene(pcDefeatedByLGBT);
	CombatManager.displayLocation("GABILANI!");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
	if(pc.isBimbo() && pc.hasVagina()) addButton(1,"Submit",bimboSubmitToGabbi,undefined,"Submit","These silly blue meanies are going to ruin your make-up with their big ugly machine! Surely there’s a nicer, sexier way to resolve this?");
	return true;
}

//PC Wins
public function defeatLGBT():void
{
	output("Smoking and sparking from a dozen craggy wounds, the LG-BT comes to a shuddering, moaning halt. Its arsenal sags downwards, and with a drawn-out, mournful beep, the war machine shuts itself down.");
	if(!enemy.hasStatusEffect("Gabilani_Fucking")) 
	{
		output("\n\n<i>“Hey. Hey!”</i> cries the female gabilani. <i>“Why isn’t it going anymore? Make it go again!”</i>");
		output("\n\n<i>“I’m trying,”</i> the male barks, stabbing at the control panel. <i>“Pressing restart isn’t working. Don’t push me around! This is your fault for making us settle for this Q-class piece of shit!”</i>");
		output("\n\n<i>“MY fault?!”</i> The pair descend, howling, into a slap fight.");
		output("\n\nYou could easily walk away now. You could, just as easily, climb up to that bubble and extract some much-merited satisfaction out of those two.\n\n");
	}
	else
	{
		output("\n\nThe gabilani up in the cockpit barely seem to notice that their ride is now kaput. They’re fully involved with another, fucking each other in a drunken, animalistic delirium. The slapping of flesh, grunts and groans continue to transmit across the churned, gently smoking battlefield.");
		output("\n\nYou could easily walk away now. You could, just as easily, climb up to that bubble and extract some much-merited satisfaction out of those two.\n\n");
	}
	clearMenu();
	//[Satisfaction] [Leave]
	if(pc.lust() >= 33) addButton(0,"Satisfaction",getSumPleasureWhenYouWinVsLGBT);
	else addDisabledButton(0,"Satisfaction","Satisfaction","You aren’t quite turned on enough for that.");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//PC loses
public function pcDefeatedByLGBT():void
{
	//By HP
	if(pc.HP() <= 1)
	{
		output("Battered, faintly smoking and shell-shocked, you drop onto your [pc.knees], brutalized by the armored monster into submission. The lanky thing looms over you, weapons pinging and clicking with heat.");
		output("\n\n<i>“Aww, is it finished already?”</i> you hear the male gabilani grouse. <i>“I was just getting into that.”</i>");
		output("\n\n<i>“I told you to think with your dick rather than your guns on this trip, dear!”</i> the female returns briskly. <i>“C’mon, the <i>real</i> fun starts now.”</i>");
	}
	//By Lust
	else
	{
		output("It’s too difficult to keep your hands off your body anymore. Maybe, maybe if you demonstrate your helpless need they’ll stop their dreadful walker’s attacks? With a wanton moan you drop onto your [pc.knees], mauling your [pc.chest] as you send your hand burying between your [pc.thighs], feverishly trying to alleviate your overwhelming lust.");
		if(enemy.hasStatusEffect("Gabilani_Fucking")) output("\n\nThe gabilani pause their own libidinal escapades to gaze down at you.");
		output("\n\n<i>“Wow,”</i> says the male greenskin. He stabs at the control panel, halting the LG-BT’s ponderous steps in order to get a better look at you desperately masturbating. <i>“Did we make it do that?”</i>");
		output("\n\n<i>“Maybe this is some sort of defense mechanism,”</i> the female suggests. <i>“The " + pc.mf("male","female") + " of the species displaying sexual submission when confronted by danger! Or something.”</i>");
		output("\n\n<i>“Well whatever, it clearly wants us to have our way with it,”</i> the male says, a smile slowly creeping onto his face. <i>“I say we don’t keep it waiting.”</i>");
	}
	clearMenu();
	addButton(0,"Next",gabilaniHoodOrnamentLossOhNo)
}

//PC Win Scenes
public function getSumPleasureWhenYouWinVsLGBT():void
{
	clearOutput();
	showLGBT();
	author("Nonesuch");
	output("You [pc.move] over to the huge, gently smoking, busted up construct. Closer to it, you can see there’s a series of small rungs built into one of the legs; it’s the work of a moment to haul yourself up towards the giant crystal ball cockpit, a shimmering bowl of treats awaiting your greedy hands. A square segment silently slides open when you reach it, the action of an auto-safety protocol perhaps.");
	if(enemy.hasStatusEffect("Gabilani_Fucking")) 
	{
		output("\n\nThe inside of the bubble smells of spirits, stale smoke and fresh sex. The bloodthirsty, over-sexed pair of gremlins are still going at each other hammer and tongs, their naked blue bodies melded together in a pile of cushions, grunting, groaning and clawing at each other greedily. They only notice you after a few seconds, slowing their mutual thrusting and returning your stare, panting and flushed.");
		output("\n\nYou now have the chance to get a close look at these two... a <i>very</i> close look. They’re both roughly 3’5”</i>, but the female is definitely larger, sporting a plump, fertile, almost Rubenesque frame with a big, pear-shaped ass and wide, big-nippled breasts. The male is well-built, not ripped exactly but rounded out with muscle, trim at the waist and equipped with strapping swimmer’s limbs. His penis is out of proportion to the rest of him, a thick, veiny tower of flesh a good seven inches long.");
		output("\n\n<i>“Well... well what are you waiting for, you alien wretch?!”</i> cries the female at last, pugnaciousness at last beating fear. She slides off the male and splays her thighs at you, displaying her soaked, parted slit. <i>“You fucked our ride and you’ve fucked our holiday. Now you may as well fuck me!”</i>");
		output("\n\nThe male says nothing. Bulky chest heaving, clutching his oversized, rock-hard cock with its double bulbous head, he simply glowers condensed anger and lust at you.");
	}
	else
	{
		output("\n\nThe inside of the bubble smells of spirits and stale cigar smoke with a tinge of melted plastic. The bloodthirsty pair of gremlins don’t immediately notice your head appearing inside their craft; they’re still fighting each other, snarling, biting and scratching each other in a mound of cushions. They slow when they do finally clock you, the female’s finger hooked into the male’s mouth, the male clutching a handful of the female’s blue hair.");
		output("\n\nYou at last have the chance to get a close look at these two... and with their jumpsuits half clawed off each other, it’s not a bad view at all. They’re both roughly 3’5”, but the female is definitely larger, sporting a plump, fertile, almost Rubenesque frame with a big, pear-shaped ass and wide, fabric-stretching breasts. The male is well-built, not ripped exactly but rounded with muscle, trim at the waist and equipped with swimmer’s legs. Going off the sizable bulge in the bottom half of his suit, you’re guessing he packs heftily for a little guy.");
		output("\n\n<i>“What... what do you want, you awful foreigner?!”</i> snaps the male at last, pugnaciousness at last beating out fear. <i>“Can’t you see we’re busy?”</i>");
	}
	processTime(3);
	pc.lust(5);
	//[Fuck Him] [Fuck Her] [Double Oral]
	clearMenu();
	if(pc.hasVagina()) addButton(0,"Ride Him: V",vaginaRouter,[getDatGobboDick,standInGabiCockVolume(),0,0],"Ride Him: Vaginal","That dick looks pretty inviting.");
	else addDisabledButton(0,"Ride Him: V","Ride Him: Vaginal","You need a vagina for this!");
	if(pc.hasCock()) addButton(1,"Ride Him: A",getDatGobboDick,-1,"Ride Him: Anal","That dick looks pretty inviting.");
	else addDisabledButton(1,"Ride Him: A","Ride Him: Anal","You need a penis to truly enjoy some prostate pleasuring.");
	if(pc.hasCock() && pc.cockThatFits(gobboVagiCapacity()) >= 0) addButton(2,"Fuck Her",penisRouter,[fuckDatGabilaniGurrrrl,gobboVagiCapacity(),false,0],"Fuck Her","Lay some pipe on the squishy female shortstack.");
	else addDisabledButton(2,"Fuck Her","Fuck Her","You need a dick that’ll fit inside the defeated tramp.");
	if(pc.hasVagina() || pc.cockTotal() > 1 || pc.biggestCockVolume() > gobboVagiCapacity()) addButton(3,"Double Oral",doubleOralFunsiesBunsies,undefined,"Double Oral","Two fat mouths, applied to your groin.");
	if(flags["HOOD_ORNAMENTED"] != undefined) 
	{
		if(pc.hasGenitals()) addButton(4,"Revenge",revengeForTheRevengeGod,undefined,"Revenge","See how much they like a taste of their own medicine.");
		else addDisabledButton(4,"Revenge","Revenge","Having genitals would make this sooo much better!");
	}
	else addDisabledButton(4,"Locked","Locked","Maybe after you’ve lost to them, you’ll get an idea for another scene...");
}
//Fuck Her
//Needs cock that fits
//Tooltip: Lay some pipe on the squishy female shortstack.
public function fuckDatGabilaniGurrrrl(x:int):void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("Your eye lingers over the female’s luscious, fertile curves; a wobbly, over-ripe treat that already has [pc.eachCock] semi-erect at the thought of miring yourself deep into it.");
	output("\n\n<i>“You,”</i> you snap, as you clamber fully into the crystal sphere, pointing at the male. <i>“Over there. ");
	if(pc.isAss() || pc.isBro()) output("I’m gonna fuck your girlfriend. Feel free to whack off to it.");
	else if(!pc.isBimbo()) output("I’m gonna give your girlfriend an alien present. Sorry I can’t give you it too, but it wouldn’t be special otherwise, y’know?");
	else output("I’m gonna do sexy times with your girlfriend, k? It’s gonna be fun! You just, like, watch.");
	output("”</i>");

	output("\n\nWhatever the little rah-rah thinks about this he obeys, cowed into sullen submission, scooching away from his partner. Do you detect the tiniest bit of excitement in his dark little eyes as he watches you crawl through the cushioned space towards his plump partner, lust coursing through your veins as you eat up her wide thighs, large, pendulous breasts, soft cheeks and come-hither lips? Well whatever, you stopped caring about halfway through that thought.");
	output("\n\nThe blue-haired gabilani has a similarly sullen, whipped-dog expression on her face, unable to keep her eyes on your face for more than a second at a time, thick lips fastened into a pout. It turns you on to imagine them split around your [pc.cockNoun " + x + "], and so, that’s exactly what you set about making happen.");
	output("\n\n<i>“Suck,”</i> you husk, hefting your [pc.cock " + x + "] and slapping the [pc.cockHead " + x + "] rudely against her face. She flinches and tuts, seeming to open her mouth to form an acid complaint... but instead she complies, reaching up to take a firm grip of your length and then slipping those plump lips over the head, sending heat, firmness and pleasure crawling back up it as she lathes it in wet, soft pleasure, pushing her mouth further and further up it." + (pc.tallness >= 5*12+6 ? " She has to stand up to properly do it, the perfect height to slot your cock into her face, a fact that only intensifies the satisfaction of doing so.":""));
	output("\n\nShe keeps her angry eyes fixed on your face now, glaring up at you past your [pc.chest], mouth molded around your [pc.cock " + x + "]. Perhaps she’s thinking about all the tittering, careless remarks she and her partner rained down on you whilst you were simply a bit of sport to them, watching you dance to the discordant tune of their weapons. Certainly you are - it’s gratifying beyond belief to silence that casual, sneering voice with your dick, the only sound she’s generating now wet, muffled gulps, licks and huffs. It makes you want to really go to town, grasp her hair and fuck her throat, that saliva-slathered tunnel just out of reach... but no. You remain steadfastly focused on the real prize here.");
	output("\n\nYou push her off your rod, spit-shone and diamond-hard now, and move into her, " + (!enemy.hasStatusEffect("Gabilani_Fucking") ? "unzipping her dishevelled jumpsuit and allowing those soft, compressed melons of hers to spill out, all but begging you to grope them and feel their wonderful give.":"groping those bare, soft melons of luxuriating in their wonderful give and heave."));
	output("\n\n<i>“Uff,”</i> she half mumbles, half groans. <i>“Aliens are so...”</i>");
	output("\n\nThere’s definitely something more than resentment on her dick-smoked lips and flush face now" + (enemy.hasStatusEffect("Gabilani_Fucking") ? "; you did interrupt her getting a good, hard fuck, after all":"") + ". Sliding your fingers down into the deep softness between her thighs tells you everything you need to know: her hairless slit is wet and parted, readily exuding feminine excitement onto your questing, probing fingers. When you grip her stubby, fat little legs and pin them back, her head bopping against the synth-glass wall of the enclosure, she thrusts her plump cooch outwards, naked eagerness now shining on her face. Flagrant little cow.");
	output("\n\nYou grunt as you pierce her wet heat, pushing your [pc.cock " + x + "] past her lips and invading her sweltering tunnel, and the animalistic sound twines with a quavering, horny little groan over to the side. You shoot a look over at the male; he has his cock out and is going hell-for-leather with it, grip shooting up and down the dark blue, double-headed beast, apparently mesmerized by what you’re doing with his partner.");
	pc.cockChange();
	output("\n\nYou smirk back at him and thrust forward hard, " + (pc.cocks[x].cLength() < 9 ? "your groin meeting the gabilani’s jiggling thighs as you envelope the entirety of your [pc.cock " + x + "] in her drooling cunt":"swelling the gabilani’s drooling cunt with a good portion of your over-sized [pc.cockNoun " + x + "]") + ", groaning gratuitously at the superb sensation which pulses back into your groin, letting him know just how much you’re enjoying his juicy little girlfriend.");
	output("\n\nShe herself wriggles and groans herself around you, fingers squeezing her wide, chubby nipples, pushing her stuffed pussy further up you, the soft, fruity little madam impatient for more. You give it to her with gusto, keep her squat legs hoisted back so that you can thrust your [pc.cock " + x + "] into her sloppy, oily sex with one delightful flex of your [pc.hips] after another, drawing an escalating cacophony of squeals and cries out of her.");
	output("\n\nOh Void, it <i>twists</i> you when you really do it to her good! Some knot of silky muscles deep inside the Tarkus native gripping you tightly, refusing to let go, trapping your [pc.cock " + x + "] inside of her. Incensed, you buck against her passionately, revelling in the strange, exotic sensation at the same time as struggling against it, only escalating her hot, ecstatic moans, her chubby little toes wriggling manically.");

	if(pc.tallness > 5*12+10) 
	{
		output("\n\nIt’s difficult, given the size difference, to screw her properly: you’re hunched right over in order to thrust into her deep. With arousal now creeping up your spine" + (pc.balls > 0 ? " tightening up your [pc.balls]":"") + " and blotting out every other impulse, you are seized by bestial inspiration. The gabilani squeals as you grab her underneath the shoulder blades and hoist her up with you, her tits bouncing wildly as you turn her around and grip her by the hair, supporting her entirely by those long, silky fronds and by your [pc.cock " + x + "], still stuck deep in her oily finger-trap of a pussy.");
		output("\n\nShe whines, but the sheer pleasure she’s getting from having your [pc.cockNoun " + x + "] rammed into her overrides any other instinct she has... and maybe even the pain currently gripping her scalp makes it all the better. You shift around a bit, admiring your chubby little dick sleeve for a few moments, and then make her press her hands against the glass and fuck her for all you’re worth, slapping your [pc.thighs] into her sloppy, kneading cunt in a rutting frenzy, drinking in the liquid motion of her big bottom.");
		output("\n\n<i>“Words! Fuck! Fuck! Fuck!”</i> she cries. Oily lubricant right down your [pc.legOrLegs], a big butterfly of the stuff painted across your groin by your own pistoning thrusts.");
		output("\n\n<i>“I think your girlfriend’s enjoying what I’m doing to her,”</i> you laugh over your shoulder at the male. All he’s getting is the sight of your [pc.ass] hammering away into his lass, but he still seems in a kind of trance, barely able to believe this unstoppable, sexual presence that’s invaded his comfortable little bubble. <i>“Aren’t you, slut?”</i> You land a hefty spank on a blue buttock, making it jiggle all the more.");
		output("\n\n<i>“Yes! Oh verbosity! Yes!”</i> She half-wails, half-growls, nails scraping against the glass. <i>“Give it to me, you terrible, eloquent foreigner!”</i>");
		output("\n\nYou do so, pounding into her twisting, oily pussy until you feel that silky knot of muscle tighten around you, clench and then release in a great, quivering, delighted moan. Having fucked it into submission, you’re happy to finally allow that hefty, bubbling pressure to rise to the surface, orgasm in an electric torrent, stuffing the wriggling, air-pedaling little cock-socket full of [pc.cum] with one thick, gorgeous flex of your [pc.cock " + x + "] after another.");
		if(pc.cumQ() > 12000) output(" The massive amount of [pc.cumColor] seed quickly backs out of her, spattering out across your [pc.thighs] and onto the cushions below, but you keep fucking the gabilani regardless, intent on pumping her as full as you can. She’s a round blueberry by the time you’re done, her midriff watermelon-shaped, utterly engorged on your [pc.cumVisc] produce.");
		else if(pc.cumQ() > 5000) output(" It’s easily enough to visibly plump out her stomach, drooling back out of her split pussy in thick, [pc.cumColor] gobbets.");

		output("\n\nSpent, you allow the female gabilani down, releasing her hair so that she can sag slowly onto a pile of cum-soaked cushions, your throbbing [pc.cock " + x + "] coming free from her in a slick, slippery spurt. The plump shortstack moans woozily, moving her stubby limbs in unsyncopated, sensual bliss, not even disguising how much she enjoyed that. You spare the male a glance; he’s covered in a small shower of his own transparent cum, his wilted cock glued to his stomach, and now appears to be in a dispirited doze.");
	}
	//If else
	else
	{
		output("\n\nArousal is now creeping up your spine" + (pc.balls > 0 ? " tightening up your [pc.balls]":"") + ", blotting out every other impulse; it’s so good to be able to fuck someone nice and small for once. The gabilani squeals as you seize her and twist her around, her tits jiggling wildly before you grip her firmly by the neck and begin pounding that oily finger-trap of a pussy doggy style, slapping your [pc.thighs] into her in a rutting frenzy, drinking in the liquid motion of her big bottom.");
		output("\n\n<i>“Words! Fuck! Fuck! Fuck!”</i> she cries. Oily lubricant right down your [pc.legOrLegs], a dripping, colorless butterfly painted across your groin by your own pistoning thrusts.");
		output("\n\nYou smirk over your shoulder at the male. All he’s getting is the sight of your [pc.ass] hammering away into his lass, but he still seems in a kind of trance, barely able to believe this unstoppable, sexual presence that’s invaded his comfortable little bubble.");
		output("\n\n<i>“Enjoying yourself, slut?”</i> you query.");
		output("\n\n<i>“Yes! Words! Yes!”</i> She half-wails, half-growls. <i>“Give it to me, you terrible, savage foreigner!”</i>");
		output("\n\nYou reward her with a swat on a blue, jiggling buttock and then do so, pounding into her twisting, oily pussy until you feel that silky knot of muscle tighten around you, clench and then release in a great, quivering, delighted moan. Having fucked it into submission, you’re happy to finally allow that heavy, bubbling pressure inside of you to rise to the surface, orgasm in an electric torrent, stuffing the wriggling little cock-socket full of [pc.cum] with one thick, gorgeous flex of your [pc.cock " + x + "] after another.");
		if(pc.cumQ() > 12000) output(" The massive amount of [pc.cumColor] seed quickly backs out of her, spattering out across your [pc.thighs] and onto the cushions below, but you keep fucking the gabilani regardless, intent on pumping her as full as you can. She’s a round blueberry by the time you’re done, her midriff watermelon-shaped, utterly engorged on your [pc.cumVisc] produce.");
		else if(pc.cumQ() > 5000) output(" It’s easily enough to visibly plump out her stomach, drooling back out of her split pussy in thick, [pc.cumColor] gobbets.");
		output("\n\nSpent, you slowly come loose, your throbbing [pc.cock " + x + "] coming free from her in a slick, slippery spurt. The plump shortstack moans woozily, collapsing onto her side, hand dazedly stroking a breast, not even disguising how much she just enjoyed that. You spare the male a glance; he’s covered in a small shower of his own transparent cum, his wilted cock glued to his stomach, and now appears to be in a depressed, dispirited doze.");
	}
	output("\n\nYour work here is done. You wipe your [pc.cock " + x + "] on a handy cushion, take a slug from a bottle of fiery spirits from their mini-bar, and then clamber back out of the cockpit. You hear the sounds of shrill recriminations and a fresh slap fight breaking out by the time you’re [pc.moving] away from the broken-down LG-BT.");
	output("\n\n");
	//Lust rest, female juices status, +10% alcohol
	pc.applyPussyDrenched();
	processTime(20);
	pc.imbibeAlcohol(10);
	new LGBTPilots().loadInCunt(pc,0);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Fuck Him
//Tooltip: That dick looks pretty inviting.
//Reqs puss or dick. Vaginal or anal as needed.
public function getDatGobboDick(x:int):void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("You ignore the female gabilani; you fancy something more substantial, and " + (enemy.hasStatusEffect("Gabilani_Fucking") ? "that big fleshy, knobbly rod the male has got standing on end, seemingly just ready for you to hop on and ride silly, looks perfect.":"that thick, fleshy bulge you can see in the male’s jumpsuit, far bigger than his diminutive profile would suggest, looks perfect."));

	if(pc.isAss() || pc.isAmazon()) output("\n\n<i>“Step aside, slut,”</i> you order, eyes boring into the nicely-built male. <i>“I’m gonna show you how to treat your man.”</i>");
	else if(pc.isBimbo()) output("<i>“It’s whoopee time!”</i> you burble, bouncing across to the nicely-built male. <i>“You can watch if you like, k babes? K.”</i>");
	else output("You don’t bother wasting words, simply let your carnal intentions known by moving past the plump female, [pc.eyes] boring into the male.");

	output("\n\nThe male shuffles backwards as you loom over him, his earlier braggadocio melting away into nervousness now he’s actually confronted by you" + (!pc.isCrotchExposed() ? ", stripping off your [pc.crotchCovers] matter-of-factly":"") + (x >= 0 ? ", sticking a couple of fingers into your [pc.vagina " + x + "], stirring yourself briskly":"") + ". Typical. You " + (!enemy.hasStatusEffect("Gabilani_Fucking") ? "seize the zipper of his jumpsuit and rip it downwards, making his long, thick, double-headed dong flop outwards. You plant your grip around it tightly, making him gasp and twitch as you coil him ruthlessly hard, his cock swiftly swelling and hardening underneath the shift and give of your palm.":"seize that thick, double-headed dong tightly, making him gasp and twitch as you jerk him, testing its pleasing heft and heat."));

	output("\n\n<i>“Fuck,”</i> the compact, blue-skinned creature gasps, as you pin his nicely dense and muscular form down in a pile of cushions and position your [pc.vagOrAss " + x + "] over his first bulbous head, sighing as you test the round oily tip against your entrance, sensation twinging into you. <i>“Do all aliens act like this? Like they’ve been in the words for yeeaaarssss...”</i> he trails off as you sink yourself down, your [pc.vagOrAss " + x + "] parting around first one fat head then the other, a delightful bobbly, bumpy feeling which pushes right up into your " + (!pc.hasVagina() ? "colon":"inner pussy") + ".");
	var wettyNess:Number = 0;
	if(x >= 0) wettyNess = pc.vaginas[x].wetness();
	else wettyNess = pc.ass.wetness();

	if(x >= 0) pc.cuntChange(x,standInGabiCockVolume());
	else pc.buttChange(standInGabiCockVolume());

	output("\n\nIt’s slightly tough going at first, doing anything with that wedge of turgid meat stretching your tunnel, but then - ooh. The gabilani shivers beneath you, a velvety groan of abandon forced from his chest, and you feel a great ooze of oily pre swell within you, seeping downwards in a lovely, filthy flow. The little guy is a lube-secreting dildo! You tighten your [pc.hips] around his waist and begin bouncing your [pc.ass] on top of him enthusiastically, delighting in the increasingly free movement of the screw, electric sensation pulsing through you");
	if(wettyNess > 0) 
	{
		output(" and making your own " + (x >= 0 ? "[pc.girlCum]":"natural lubrication") + " ooze freely");
	}
	output(".");

	output("\n\n<i>“You like that, you little shit?”</i> you coo, enjoying the unfocused expression on your pinned down gabilani toy, as you stir him in your depths. <i>“Even more fun that shooting at me, right?”</i>");

	output("\n\n<i>“Pshaw.”</i> You shoot a look at the female gabilani, from whom the derisive sound emanated. She’s watching you fuck her boyfriend on her side, resentful, frustrated lust livid on her face. <i>“Flap your " + (x >= 0 ? "blown-out, slimy cave":"loose, worn-out bum") + " on him as much as you like, wordless alien. He’ll <i>never</i> enjoy it as much as gabilani puss - the best in the galaxy. You won’t even be able to make him cum!”</i>");
	output("\n\n<i>“Could you not,”</i> gasps the male at her.");

	//If PC using gabilani, gryvain, suula or vanae pussy
	var vtype:Number = GLOBAL.TYPE_HUMAN;
	if(x >= 0) vtype = pc.vaginas[x].type;
	if(vtype == GLOBAL.TYPE_GABILANI || vtype == GLOBAL.TYPE_GRYVAIN || vtype == GLOBAL.TYPE_SUULA || vtype == GLOBAL.TYPE_VANAE)
	{
		output("\n\n<i>“You think so, do you?”</i> you coo at the female, closing your eyes as another wave of inhuman pleasure washes over you, emanating from the tactile fever swamp of your [pc.vagina " + x + "]. You never knew how amazing sex could be until you mutated your pussy, grew those wonderful features that make it so <i>good</i> at clasping cocks, feeling every inch of them within you, and <i>wringing</i> your partners until they can only gasp and sweat at the feeling of you clamped around them, helpless against your desire.");
		output("\n\nThat’s what the male gabilani is doing right now, pinned down underneath your" + (pc.tallness > 5*12 ? " far larger":"") + " frame, flexing fruitlessly against the weight of your [pc.hips] and [pc.ass] as your alien pussy gloves and works his over-sized dick. You gaze down at him sensuously, envisaging how he must see you; the bizarre, indomitable, ravishing alien, who overcame his war machine and invaded his comfortable little paradise, now sat on top and using him how [pc.he] may; an unstoppable, sensual force.");
		output("\n\n<i>“She says you aren’t going to cum for me,”</i> you whisper, slowly jerking your [pc.thighs] on top of the gabilani, milking him, kneading him, the sensual delight of it growing. <i>“That’s not true, is it? You’re a good boy. You’re going to give me all the cum I want. You’re going to fill my womb with your lovely seed, because that’s what you were put in this galaxy to do...”</i>");
		output("\n\n<i>“You better not,”</i> snarls the female gabilani. <i>“You’re mine!”</i>");
		output("\n\nYou giggle at the worry edging her tone. The male is incapable of making any sound but a kind of mesmerised, wounded moan; his eyes are fixed upon your [pc.chest], " + (pc.biggestTitSize() < 1 ? "immaculate and flat":"bouncing slowly to the rhythm you’re working on top of him") + ".");
		output("\n\n<i>“Oh, you feel so good inside of me, my little man...”</i> you moan theatrically, caressing your [pc.chest]");
		if(pc.biggestTitSize() >= 1)
		{
			output(", sinking your fingers into the softness there");
			if(pc.canMilkSquirt()) output(", giving him an impromptu shower of milk when you pinch your [pc.nipples]");
			else output(" and caressing your [pc.nipples]");
		}
		output(". He does, actually; ");
		if(vtype == GLOBAL.TYPE_VANAE) output("your feelers");
		else if(vtype == GLOBAL.TYPE_SUULA) output("your aphrodisiac-soaked fronds");
		else if(vtype == GLOBAL.TYPE_GRYVAIN) output("your clit-like nubs");
		else output("your network of inner muscles");
		output(" are busy, feeding thousands of wonderful little nibbles of pleasure back into you as they work his knobbly cock hard, your body thirsty for more than just the oily pre you’ve so far coaxed out of him. <i>“Won’t you give me what I want...?”</i>");
		output("\n\nYou ride the little bastard hard, hands pinning his wrists to the floor, [pc.ass] bouncing on top of his diminutive, dense frame, as orgasm overwhelms you, a wonderful series of exotic clenches that precipitates a " + (!pc.isSquirter() ? "drool of [pc.girlCum]":"huge flush of [pc.girlCum]") + " around his thick dick, and your [pc.vagina " + x + "] goes into overdrive, rippling around the obtrusion it has seized within it eagerly.");
		output("\n\nYou laugh with delight when you feel it; the gabilani groans mightily, reactively bapping his swimmer thighs into the weight that has him squashed into the floor of his cushy ride, unable to stop himself swelling your clenching, cock-conquering cunt with a warm, oily load of gabilani cum. He keeps going, puffing and groaning, all the while you ride out your orgasm, until it’s oozing back out over his groin and your [pc.thighs], the goopy, translucent stuff soaking into the cushions beneath you. Afterglow beating through you, you turn your best shit-eating grin to the female.");
		output("\n\n<i>“You fucking <b>" + pc.mf("asshole","bitch") + "</b>!”</i> she howls, beating her thighs in frustration as she takes in her boyfriend, sagged like a punctured balloon, eyes rolled up. <i>“I didn’t bring my vibrator shore-side! Now what am I gonna do?!”</i>");
		output("\n\n<i>“Not my problem, girl,”</i> you purr, rising up and allowing a big, filthy gloop of mixed [pc.girlCum] and oily semen to drop down on the male’s abdomen. <i>“I got what I wanted.”</i>");
		output("\n\nYou can hear a furious fight breaking out above as you clamber back down to the ground, your equipment back in place and a lovely post-coital throb baking within you.\n\n");
		//Reset lust, load in pussy
		processTime(30);
		if(x >= 0) pc.loadInCunt(new LGBTPilots(),x);
		else pc.loadInAss(new LGBTPilots());
	}
	else
	{
		output("\n\n<i>“Is that true?”</i> you laugh, delighting in the note of panic you detect in your snack-sized boy toy’s tone. You tighten your [pc.hips] around him and jounce particularly hard, your coo of pleasure twining with his ragged gasp. <i>“I could fuck you as hard as I like, and you’re never going to be able to go soft on me?”</i> The pleasure’s becoming too intense now, building through your nethers, and you subside into a juddering series of thrusts, wringing all of the joy out of that thick, oily cock");
		if(pc.hasGenitals())
		{
			output(", orgasm ");
			if(pc.hasVagina()) output("clenching up [pc.eachVagina] and making you cry out with joy, [pc.girlCum] " + (!pc.isSquirter() ? "dribbling":"spurting") + " out of you freely..");
			else if(pc.hasCock()) output("seizing up [pc.eachCock] as your prostate is rubbed just so, [pc.cum] spurting out of " + (pc.cockTotal() == 1 ? "it":"them"));
		}
		output(". When you come down, you find that for all that his pointy face is ruddy with exertion and arousal, the male gabilani is still rock-hard within you.");

		output("\n\n<i>“Damn,”</i> you tease, sighing as you slowly rotate your [pc.hips], drawing another ragged groan out of him, <i>“seems the bitch wasn’t lying! Poor you.”</i> You begin to slowly bounce on top of him again, pulling at his nipples and his face as you do it, content and intent to play with this captive toy of yours for all that he’s worth.");
		output("\n\nYou use that captive, pent-up cudgel of a dick to knead yourself to another pulsating orgasm, followed by another, your [pc.vagOrAss " + x + "] clenching up around the gabilani’s thick, hot girth fruitlessly. Fruitlessly for him, that is - although he gasps and moans and writhes his fit, compact " + (pc.hasCock() ? "and [pc.cum]-glazed ":"") + "frame beneath you for all he’s worth, he cannot find release himself." + (pc.tallness > 5*12+11 ? " It’s enjoyable pinning a cavalier guy like this so completely, overwhelming him with your own flesh and using him however you wish. Boy, is he going to have a sore torso after this.":""));
		output("\n\nAfter that last wonderful, shimmering high you feel relaxed, sensuous, forgiving even. You lay yourself on your side and raise your [pc.hip], make the gabilani take you like that, finally allowing him to use his own steam to fuck you. Pleasure is caressed into you by the thrust and pull of his bulbous, oil-dripping cock into your " + (x >= 0 ? "well-unfurled pussy":"opened asshole") + ", his hot hands gripping your [pc.leg] as he hammers himself into you, frustrated grunts and groans puffing over your [pc.skinFurScales].");
		output("\n\nOver minutes of this pounding you are slowly transported to a final, wonderful orgasm, and you rub in how much you’re enjoying him with delighted, gloated cries, " + (x >= 0 ? "your [pc.vagina " + x + "] squirting [pc.girlCum] gratuitously as it seizes up once again to the lubricated pounding it’s receiving":"your [pc.cock] oozing out the last of your [pc.cum] as your prostate is given the well lubricated battering it deserves") + ".");
		output("\n\nAnd still, and still, when you stop thrashing about and are glowing with purest gratification, when you get up onto your [pc.knees] and look down at him, you find the male gabilani’s dick is still glowing hot and hard, and he is practically sobbing with frustration.");
		output("\n\n<i>“What a lovely toy that is,”</i> you coo, picking yourself" + (pc.hasHair() ? ", rearranging your [pc.hair]":"") + ", and putting your equipment back on. <i>“You better be careful no slavers find out about it.”</i>");
		output("\n\n<i>“You done? Good. Piss off,”</i> snaps the female gabilani, glowering at you as you take a generous nip from a bottle of fiery spirits before making your way back to the glass hatch. <i>“Me and him have got business to settle.”</i>");
		output("\n\n<i>“Oh no...”</i> groans the recumbent male, watching her advance on him, and his painfully erect penis.");
		output("\n\nThe squishy, energetic sound of one-sided sex is echoing around the beaten-up LG-BT by the time you’ve climbed back down it and gotten back on your way.");
		output("\n\n");
		processTime(30);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.imbibeAlcohol(10);
	}
	CombatManager.genericVictory();
}

//Double Oral
//Needs one of the following to be true: PC has vagina, PC has a massive dick, PC has more than one dick.
//Tooltip: Two fat mouths, applied to your groin.
public function doubleOralFunsiesBunsies():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("You gaze at the pairs’ lips, both full and expressive in shape, both currently fixed into sullen, scolded-children scowls, and arousal flares in your [pc.groin]. What an opportunity to make use of two snack-sized bitches at the same time... and how fitting their loud mouths should be turned to the far more fitting purpose of satiating you.");
	if(!enemy.hasStatusEffect("Gabilani_Fucking")) 
	{
		output("\n\n<i>“Take your clothes off,”</i> you order, with serene command. After a moment the gabilani obey, their jumpsuits slithering off well-rounded, masculine muscle and supple, feminine softness. Their expressions remain stonily resentful, but there’s a shift of atmosphere in the close goldfish bowl after they obey, maybe just a flicker of arousal in their faces at doing what the " + (pc.tallness > 5*12 ? "big, powerful":"assertive") + ", exotic alien demands. You know just looking at them they’ll do exactly what you say now, and frankly that turns you on. Coolly you point in front of you.");
		output("\n\n<i>“Here. Now.”</i>");
	}
	else
	{
		output("\n\nCoolly you point in front of you.");
		output("\n\n<i>“Here. Now.”</i>");
		output("\n\nAfter a moment the gabilani obey, crawling across to your [pc.footOrFeet]. Their expressions remain stonily resentful, but there’s a shift of atmosphere in the close goldfish bowl after they obey, maybe just a flicker of arousal in their faces at doing what the " + (pc.tallness > 5*12 ? "big, powerful":"assertive") + ", exotic alien demands. The fact they’re already extremely turned on helps. You know just looking at them they’ll do exactly what you say now, and frankly that turns you on.");
	}
	//[Big Dick] [Pussy Lick] [Double Dick]
	processTime(3);
	pc.lust(5);
	clearMenu();
	if(pc.hasCock() && pc.biggestCockVolume() > gobboVagiCapacity()) addButton(0,"Big Dick",bigDickDoubleGabiScene,pc.biggestCockIndex(),"Big Dick","");
	else addDisabledButton(0,"Big Dick","Big Dick","You need a big dick for this. Too big to stuff in the gabilani’s pussy.");
	if(pc.hasVagina()) addButton(1,"Pussy Lick",doubleLickMyPussss,undefined,"Pussy Lick","Put them both to work between your [pc.thighs].");
	else addDisabledButton(1,"Pussy Lick","Pussy Lick","You need a vagina if you want it licked.");
	if(pc.cockTotal() > 1) addButton(2,"Double Dick",doubleDickGabilani,undefined,"Double Dick","Put them to work on your multitude of tools.");
	else addDisabledButton(2,"Double Dick","Double Dick","You need at least two dicks for this.");
}

//Big Dick
public function bigDickDoubleGabiScene(x:int = 0):void
{
	clearOutput();
	showLGBT();
	output("You heft your [pc.cock " + x + "]" + (!pc.isCrotchExposed() ? " out of your [pc.lowerUndergarment]":"") + ", slap the [pc.cockHead " + x + "] against first one sullen blue face then the other, drawing a disgusted grunt and gasp out of each.");

	output("\n\n<i>“You know what to do with this, right? Don’t keep me waiting,”</i> you husk. First the female, then the male, fasten their lips onto your massive shaft, one on each side, and begin to massage wet, silken pleasure into it with dainty smooches and licks. There’s plenty there for them both, turgid dick flesh that only grows more swollen and heated the more they work, tongues tracing the veins until they stand out in shiny relief.");
	output("\n\nHonestly, this is easily the best use for these little fuck puppets; there’s no way you could fit this tool of yours into either, and gazing down and watching two of them nakedly lapping and slurping at it is beautiful." + (pc.tallness > 5*12+10 ? " The fact they have to stand up in order to service you only increases the sensation how ineffably <i>right</i> this feels.":"") + " They continue to gaze up at you with sullen indignation as they do it, something you savor. Yeah, that’s right, you little bastards. You’re smoking the dick of the " + pc.mf("guy","girl") + " you just tried to vaporize for a lark.");
	output("\n\nYou reach down and grip their heads as lust sinks its talons into you, pushing them up and down your [pc.cock " + x + "] to a rhythm of your own choice, creating a lovely, slick sleeve of shifting mouth-flesh to pump yourself into. Pre begins to dribble copiously from the [pc.cockHead " + x + "], and seeing it wasted like that strikes you as a shame.");
	output("\n\n<i>“You!”</i> you growl, pointing at the female. <i>“Go up to the end and suck. As for you...”</i>" + (pc.balls > 0 ? " You open your [pc.thighs] and present your [pc.sack] with a smirk. <i>“This needs attention.”</i>":" You point at the [pc.knot " + x + "] imperiously."));
	output("\n\nA few moments later you’re groaning your delight as you spread the female gabilani’s luscious lips with your [pc.cockHead " + x + "], sampling the soft wetness within with short forward thrusts of your [pc.hips], as " + (pc.balls > 0 ? "tight, silken suction is applied to your [pc.balls]":"the male licks away at your [pc.knot " + x + "]") + ". The female has a tough time with the size of the thing - her jaw makes an alarming ‘crack’ sound at one point - but for all her supposed distaste she goes about her allotted role like a champ, letting you shove yourself into the tightness of her throat with nothing but a shudder and a muffled ‘ulp’.");
	output("\n\nYou reward her with a steady dribble of pre, smeared over her lips and tongue and down her throat, and increase the intensity of your pushes as hot arousal locks itself around your groin.");
	output("\n\n<i>“Keep doing it just like that, kid...”</i> you grunt encouragement down to the male, gripping him by the head. <i>“You want me to stuff a really big load down your girlfriend’s gullet, don’t you?”</i>");
	output("\n\nWhether he does or not he has no choice in the matter, and that delightful ");
	if(pc.balls > 0) output("hot wet suck on your testicle" + (pc.balls > 1 ? "s":""));
	else output("fondling caress around your [pc.knot " + x + "]");
	output(" impels your orgasm gloriously, a succession of hot loads of [pc.cum] blasted into the female’s face.");
	if(pc.cumQ() < 2000) output(" The plump shortstack’s throat works hard as you dip into her deep, intent on using as much of her as you can, and you find you’re well spent by the time you slowly withdraw, coming free from her lips with a lurid ‘pop’.");
	else 
	{
		output(" The second huge pulse of cum backs straight back out of her, [pc.cumColor] fluid spurting out around her lips, and she comes loose from you with a splutter.");
		output("\n\n<i>“Fucking...”</i> Whatever she was going to say is drowned out by another gallon or so seed sprayed into her face by your throbbing penis. You grasp and jerk it, groaning with joy as you paint the gasping shortstack from head to tail in [pc.cum], before doing an impromptu redecoration of the entire cockpit, painting the cushions, bar and glass with fecund [pc.cumColor]. It’s all coaxed on by the lovely suck the male is applying to your " + (pc.balls > 0 ? "[pc.balls]":"[pc.knot " + x + "]") + ", unable to see what you’re doing.");
	}
	output("\n\nYou slump back against the synth-glass when you’re done, enjoying the lovely post-orgasm throb in your [pc.groin]");
	if(pc.cumQ() >= 2000)
	{
		output(", proudly examining your filthy, dripping handiwork.");
		output("\n\n<i>“We JUST had this upholstered,”</i> snaps the male with the deepest bitterness, once he’s finally turned around and seen what you’ve done.");
		output("\n\n<i>“Whhhhyyyyy are aliens so gross?”</i> groans the female, flicking [pc.cum] away from her eyes");
	}
	output(".");

	output("\n\nThe pair glare at you, wiping their mouths, waiting for you to go away. You take your sweet time - there’s the bar to sample, a quick bolt of fiery gabilani whiskey to imbibe, the hot tub to quickly swirl your dripping monster cock in - but eventually you swing yourself back out of the hatch. A shrill argument has broken out back in the bowl by the time your [pc.footOrFeet] " + (pc.legCount == 1 ? "is":"are") + " back on the ground.\n\n");

	new LGBTPilots().loadInMouth(pc);
	// +Lust reset, +10% alcohol
	processTime(30);
	pc.imbibeAlcohol(10);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Pussy Lick
public function doubleLickMyPussss():void
{
	clearOutput();
	showLGBT(true);
	var x:int = 0;
	var y:int = -1;
	if(pc.totalVaginas() > 1) y = 1;
	if(!pc.isCrotchExposed()) output("You matter-of-factly step out of your [pc.lowerGarments], smirking as the gabilani’s attention is inevitably led down to your [pc.vaginas].");
	else output("You flare your [pc.thighs], smirking as the gabilani’s attention is inevitably led down to your [pc.vaginas].");

	//If 1 vagina
	if(pc.totalVaginas() == 1)
	{
		output("\n\n<i>“You,”</i> you husk to the male, pointing imperiously at your [pc.vagina " + x + "], <i>“get to lick my muff. Say thank you.”</i>");
		output("\n\n<i>“Th- thank you?”</i> he mumbles. A certain dazedness overtaking his mannered resentment, the handsome blue imp sinks his head between your [pc.thighs]. You murmur approval as you feel hot breath and then wet tongue shift over your lips, slip inside, land upon your [pc.clit], intense flickers of moist pleasure working their way into you.");
		output("\n\n<i>“You,”</i> you gesture at the female, <i>“get to eat my ass. Save your thank yous for after.”</i>");
		output("\n\n<i>“Fuck you,”</i> the plump shortstack snaps... but she does what she’s told, your alpha female performance imposing itself on the situation. She shifts herself around, a pair of hands wrap themselves around your [pc.hips], and then the unique sensation of a nice, wet tongue applied to your [pc.anus] tickles its way up your spine.\n\n");
		if(pc.tallness > 5*12+10) output("The fact the pair of them have to stand up in order to service you is quite funny, but only makes it seem righter that this should be the task they should be applied to. ");
		output("You grip the male’s hair and murmur instructions down to him, sighing with pleasure whenever he hits a particularly sweet spot with his hot, lavish tongue. He soon forgets that he’s supposed to be angry with you and fully invests himself in the intrinsically enjoyable act of giving you head, craning his tongue right up your wet tunnel, flicking at [pc.eachClit] and moving his strong lips against your soaked labia, exploring your alien cunt with avid interest.");
		output("\n\nThe female needs more encouragement, for some reason.");
		output("\n\n<i>“If you half-ass my ass you’re only going to be in it longer!”</i> you snap at her over your shoulder. <i>“Get that tongue up there!”</i> Face buried between the cheeks of your [pc.ass], her fiery eyes spit hatred at you... but she does as you demand, parting your [pc.anus] and sinking her lovely, wriggly tongue into your colon, her full lips pressed into an obscene kiss with your asshole. You groan as the sensation of two tongues lapping at your innards, pressing into each other through your inner walls overwhelms you, making your [pc.legs] feel weak and produce a little curtain of [pc.girlCum], varnishing the male gabilani’s lips as it falls. Fucking magical.");
		output("\n\nYou ride the two mouths for as long as you like, gently rotating your [pc.hips] so that every angle of your cunt and colon receives some attention. At last though, the passionate licking and mauling the male is lavishing upon your [pc.vagina " + x + "] becomes too delightful; you shudder and cum with a gratified moan, your stuffed pussy spasming and " + (!pc.isSquirter() ? "dripping":"gushing") + " [pc.girlCum] around him. The female emits a muffled squawk as you reactively tighten up around her, gripping her own tongue deep in the embrace of your [pc.ass].");
		output("\n\nFor the male though, the fact he made you orgasm only seems to spur him on, and he laps at your quivering sex all the harder, magnifying the pleasure of it magnificently. You reward him by shoving his face into your twat as deep as you can, unwilling to let that smooth, thick, muscular penetration leave you until you’ve shivered your last.");
		output("\n\nYou let them go at last, the female immediately turning and striding over to the mini-bar to wash her mouth out, the male flopping down onto the cushions, a dazed, foolish expression on his [pc.girlCum]-glazed face. You give him a knowing smirk as you throw your equipment back on, help yourself to a quick shot of gabilani spirits before heading back out of the hatch; leaving the snack-sized fuck boy to linger on the taste of what it would be like if he belonged to you.");
		output("\n\nAn acrimonious, squawling fight has broken out back in the LG-BT’s cockpit by the time your [pc.footOrFeet] find" + (pc.legCount == 1 ? "s":"") + " the ground again.");
		// +Lust reset, +10% alcohol
		processTime(30);
		pc.imbibeAlcohol(10);
		pc.orgasm();
		output("\n\n");
		CombatManager.genericVictory();
	}
	//If 1 < vagina
	else
	{
		output("\n\nYou grew more than one, just for occasions like these.");
		output("\n\n<i>“You,”</i> you husk at the male, pointing at your [pc.vagina " + x + "]. <i>“In this. Now.”</i>");
		output("\n\nThe handsome blue imp shifts across, a certain dazedness overtaking his mannered resentment. He sinks his head between your [pc.thighs], and you murmur approval as you feel hot breath and then wet tongue shift over your lips, slip inside, land upon your [pc.clit], intense flickers of moist pleasure working their way into you.");
		output("\n\n<i>“You,”</i> you order the female, arching your [pc.ass], <i>“go behind. There’s plenty left for you.”</i>");
		output("\n\nShe curls her lip at you... but does as she’s told, your alpha " + pc.mf("male","female") + " performance imposing itself on the situation. She shifts herself around, a pair of hands wrap themselves around your [pc.hips], and then you feel a nose wedge itself between your buttocks, a fresh, wet tongue tracing the line of your [pc.vagina " + y + "].\n\n");
		if(pc.tallness > 5*12+10) output("The fact the pair of them have to stand up in order to service you is quite funny, but only makes it feel all the righter that this should be the task they should be applied to. ");
		output("You grip the male’s hair and murmur instructions down to him, sighing with pleasure whenever he hits a particularly sweet spot with his hot, lavish tongue. He soon forgets that he’s supposed to be angry with you and fully invests himself in the intrinsically enjoyable act of giving you head, craning his tongue right up your wet tunnel, flicking at [pc.eachClit] and molding his strong lips against your soaked labia, exploring your alien cunt with avid interest.");
		output("\n\nYou can’t tell what the female makes of it, but from the movements of her tongue and lips, darting and dragging up and around your [pc.vagina " + y + "], attacking your [pc.clit] with sharp, wet flicks, you get the impression she’s taking her resentment out on your pussy. Or maybe she’s trying to get you off as fast as possible? Whatever, it feels <i>fantastic.</i> Their tongues press into each other through your inner walls in such a way that your [pc.nipples] " + (!pc.hasFuckableNipples() ? "harden":"wetten") + ". You sigh and then groan with pleasure as the inhuman ecstasy of getting both pussies eaten out flows through you, a melting pudding of pleasure that grows more sweet and gooey with each passing moment.");
		output("\n\nYou ride the gabilani’s fleshy mouths for as long as you can, gently rotating your [pc.hips] on top of them, but it quickly becomes too much wriggling, steamy stimulation to bear. When your [pc.vagina " + x + "] cramps up and then explodes into orgasm in response to the male’s passionate licking, your [pc.vagina " + y + "] immediately follows in sympathy, one crashing wave of pleasure swiftly followed by another. You grab both of them by the hair, ignoring their squeaks of pain and using their thick, saliva-slathered penetration to magnify your twin orgasm, moaning and crowing in total, transported delight.");
		if(pc.isSquirter()) output(" You gush [pc.girlCum] in little [pc.girlCumFlavor] torrents, and you glaze both of their faces in it with luscious pumps of your [pc.hips].");
		output("\n\nYou let them go at last, the female immediately turning and striding over to the mini-bar to wash her mouth out, the male flopping down onto the cushions, a dazed, foolish expression on his [pc.girlCum]-smeared face. You give him a knowing smirk as you throw your gear back on; leaving the snack-sized fuck boy to linger on the taste of what it would be like if he belonged to you.");
		output("\n\nAn acrimonious, squawling fight has broken out back in the LG-BT’s cockpit by the time your [pc.footOrFeet] " + (pc.legCount == 1 ? "has":"have") + " found the ground again.");
		output("\n\n");
		processTime(30);
		pc.orgasm();
		CombatManager.genericVictory();
	}
	new LGBTPilots().girlCumInMouth(pc);
}

//Double Dick
public function doubleDickGabilani():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	var x:int = pc.cockThatFits(gobboVagiCapacity());
	var y:int = pc.cockThatFits2(gobboVagiCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	if(y < 0) y = pc.smallestCockIndex();
	//If we wound up with two of the same:
	if(x == y)
	{
		//If X is the smallest, y is second smallest. Otherwise y is smallest.
		if(x == pc.smallestCockIndex()) y = pc.smallestCockIndex2();
		else y = pc.smallestCockIndex();
	}
	output("You " + (!pc.isCrotchExposed() ? "pull [pc.eachCock] out of your [pc.crotchCovers]":"heft [pc.eachCock]") + " and let them swing crudely downwards into the gabilanis’ faces, letting your lusty smirk and their swinging bluntness speak for themselves.");
	output("\n\n<i>“You can’t be serious,”</i> groans the female, once realisation has dawned.");
	output("\n\n<i>“Why do you think I have " + (pc.cockTotal() == 2 ? "two of them":"more than one") + "?”</i> you say, pointing at your semi-erect cocks imperiously. <i>“Get to work.”</i>");
	output("\n\nWith a deep, embittered sigh, the female reaches out and grasps your [pc.cock " + x + "], fixing her rancorous gaze on you as she envelopes the [pc.cockHead " + x + "] in her lips, smooching at it a few times before taking it deep into her wonderfully hot, wet maw. The male follows suit a few seconds later, perhaps trying to make a point about how much <i>he</i> resents doing this by holding out for that long before spreading his mouth around your [pc.cock " + y + "]. Whatever, the fact you’re humiliating the murderous little bastards only makes the sensation all the sweeter.");
	output("\n\nAnd what a sensation it is. You groan as hot delight veins down [pc.eachCock], quickly becoming fiercely erect as the gabilani fondle and blow them, irregular pleasure seesawing back and forth between your cocks that make the muscles in your [pc.hips] clench impulsively.");
	output("\n\nIt’s made all the more exotic by the fact the pair employ different cock-sucking techniques: once she has the measure of the [pc.cock " + x + "] you’ve designated her the female goes at it furiously, thrusting her wide lips " + (pc.cocks[x].cLength() < 10 ? "all the way up to the base":"as far up it as she can") + " with hot, sloppy thrusts of her face, taking her anger out on your dick in a way that makes the chest tighten. The male is much more fastidious and measured, concentrating on the head of your [pc.cock " + y + "] with languorous circuits of his tongue, only taking you in for a deep suck occasionally and slowly." + (pc.balls > 0 ? " One husky command is all it takes to get him to fondle your [pc.balls] as well, another layer of variegated sensation added to the heady mix.":"") + "\n\n");
	if(pc.tallness > 5*12+10)
	{
		output("They are on their feet to blow you, shortstacks seemingly designed for you to slot your cocks into their faces, and as purest arousal takes over that only makes this all the more gratifying. ");
	}
	output("The suck gets sloppier as pre begins to " + (pc.cumQ() < 500 ? "drip":"flow") + " freely from your engorged cockheads, and at last you have to take matters into your own hands. There’s a choke and a gasp as you grasp a pair of blue-haired sluts by their heads and pump yourself powerfully into their mouths, driving [pc.eachCock] into hot, saliva-coated heaven, face-fucking them both simultaneously.");
	output("\n\nThe gabilani growl and splutter around the gratuitous amounts of veiny cock you’re plugging their mouths with, but they have no option but to take it; serve as your drooling, scrumptious fuckholes as glorious orgasm tightens your body, impelling you to push yourself into them as deep as you can. You push their well-fed cheeks into other, delighting in the furious, scrunched up expressions glaring up at you, and then cum with a shuddering moan, your [pc.balls] working punishingly hard to course [pc.cum] up both of your cocks, disgorging plenty of it into both sucking maws.");
	if(pc.cumQ() < 4000) output(" As soon as you’ve ejaculated your last and let go of their heads, they turn and spit it all out almost simultaneously, a joint performance of disgust that tickles you greatly.");
	else output(" They have to swallow, it’s the only way not to drown from the burst pipeline of [pc.cumVisc], [pc.cumFlavor] goodness you’re pushing them against. Their expressions switch from angry to panicky as their throats work, their cheeks bulging up, and finally you take pity and let them off your still-pulsing penises, sighing with joy as you grip [pc.eachCock] and ejaculate all over their gasping, spluttering faces and bare bodies. Void, it’s so fucking good to have genitals as jacked-up as this.");
	output("\n\nYou lean yourself back against a curved wall of synth-glass and sigh, simmering in the delightful, satisfied throb emanating from [pc.eachCock], grinning as you watch the two " + (pc.cumQ() >= 4000 ? "dripping ":"") + "gabilani waddle over to the mini-bar and theatrically wash their mouths out with amber spirits.");
	output("\n\n<i>“You done now?”</i> growls the male. <i>“Can you kindly piss...? Oh, for Words’ sake. Fine,”</i> he sighs exasperatedly, seeing you gesture at his glass with a roguish grin. He fills another tumbler with ice and amber fluid, hands it to you. You throw it down in a single gulp. It burns so good!");
	output("\n\nYou put your equipment back on and clamber happily back down the LG-BT’s leg, your buzz only growing warmer as you hear a shrill, bitter argument break out in the cockpit above you.");
	//+10% Alcohol, Lust reset
	processTime(30);
	pc.orgasm();
	pc.imbibeAlcohol(10);
	new LGBTPilots().loadInMouth(pc);
	output("\n\n");
	CombatManager.genericVictory();
}

//Revenge
//Requires PC triggered the hood ornament scene
//Tooltip: See how much they like a taste of their own medicine.
public function revengeForTheRevengeGod():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("You glare at the two individuals responsible for one of the most humiliating and stressful episodes of your entire life. The gabilani presumably know what’s on your mind... but they brazenly stare back, either hoping to tough it out or utterly uncaring.");
	output("\n\n<i>“Where do you store the hard light cuffs?”</i> you growl. There’s a heavy silence. <i>“The first one to tell me gets to stay in the cockpit.”</i>");

	//50/50 chance either way
	var maleBitch:Boolean = (rand(2) == 0);
	output("\n\n<i>“They’re beneath the bar!”</i> the " + (maleBitch ? "male":"female") + " blurts out.");

	output("\n\n<i>“You " + (maleBitch ? "ASSHOLE":"BITCH") + "!”</i> the " + (maleBitch ? "female":"male") + " howls, throwing themselves at " + (maleBitch ? "him":"her") + ". You catch " + (maleBitch ? "her":"him") + " and hold the struggling, snarling shortstack as the other hurries across to the minibar, retrieves the steel clasps and helps you fasten them around " + (maleBitch ? "his":"her") + " partner’s wrists and ankles. A press of a remote summons the hardlight cables into existence, fastening themselves around a big, central ring. The naked, hogtied gabilani hangs from it, limbs bent back towards it, as you heft " + (maleBitch ? "her":"him") + " in the air, admiring your " + (!maleBitch ? "muscular, glossy":"curvy, fleshy") + " prize with their " + (maleBitch ? "boobies":"donger") + " dangling.");
	output("\n\n<i>“You just wait until we get back into orbit!”</i> " + (maleBitch ? "she":"he") + " snarls, still struggling vainly, gently swinging from your hand like an obscene cot mobile. <i>“Central Command will hear of this treason! This... outrage!”</i>");
	output("\n\nThe other gabilani giggles nervously as " + (maleBitch ? "he":"she") + " watches you carry their once partner-in-crime to the hatch.");
	output("\n\n<i>“Aw, don’t be like that darling,”</i> " + (maleBitch ? "he":"she") + " calls. <i>“It’ll be fun! You said it yourself.”</i>");
	output("\n\nIt’s an effort to carry a struggling, swearing shortstack down a set of rungs, but you know the end result is going to be worth it. You plonk them down below the LG-BT’s looming bulk, call down the winch, hook the " + (maleBitch ? "female":"male") + " up, and then watch them being hauled upwards. Their bare, exposed bum is too much of a temptation to bear, and their stream of obscenities is momentarily halted by a squeal as you give a " + (!maleBitch ? "brawny":"soft") + " buttock a big, satisfying slap when it levitates past you.");

	output("\n\nNow that " + (maleBitch ? "he":"she") + "’s committed " + (maleBitch ? "himself":"herself") + " to this act of base treachery, the " + (maleBitch ? "male":"female") + " gabilani seems positively eager to help; perhaps even turned on by the edginess this safari of theirs has taken on. Back in the cockpit, " + (maleBitch ? "he":"she") + " helps you with the control panel, swinging a camera drone around so that you can watch the gabilani bound to the craft’s chin, so that when you begin to play with the array of buttons and switches in front of you, you can see every action in hi-def.");
	output("\n\nThe naked, dangling " + (!maleBitch ? "male":"female") + " continues to swear and issue dire threats against both of you, but these get increasingly ragged after you spear a chunky epipen of liquid aphrodisiac into their butt-cheek, and then work a gigantic, oily, knobbly dildo past their pert little asshole. All words are finally pushed out of them by the thing - only room for dildo or words in one squat little body - and are replaced by ragged gasps and moans once you " + (maleBitch ? "manipulate another dildo into her plump cunt, stretching her body out with synthetic cock.":"order the deft cock-milker arm to take a firm grasp of his prick, jerking the bulbous thing ruthlessly hard") + ". Their caught feet and hands stretch and flail as they are stimulated remorselessly, dangling far above the ground.");
	output("\n\nIt’s a wonderful sight to behold, particularly given that it was you that rendered the evil little so-and-so a slave to their own machine and lusts, and your hand wanders down to your [pc.groin] as you slump back in the chair, enjoying the show. You toggle a switch experimentally. Ooh, electrical stimulation! The " + (!maleBitch ? "male":"female") + "’s cries turn high-pitched.");
	output("\n\n<i>“Great, isn’t it?”</i> sighs the " + (!maleBitch ? "female":"male") + ", leaning into you to watch their flailing, juddering partner on the screen. <i>“Once you see the stuff in action, it becomes a shame NOT to use it, don’t you think?”</i>");
	output("\n\n<i>“Yeah.”</i> You turn and give " + (maleBitch ? "his thick, muscular frame":"her soft, Rubenesque frame") + " a thoughtful look. <i>“" + (maleBitch ? "You got some lube up here, right? I think I’ll fuck you in the ass whilst I watch.":"Get under the desk and lick me, ok?") + "”</i>");

	processTime(20);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gabilaniRevengePt2,maleBitch);
}

public function gabilaniRevengePt2(maleBitch:Boolean):void
{
	clearOutput();
	showLGBT(true);
	//Male
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0))
	{
		var x:int = pc.cockThatFits(gobboVagiCapacity());
		if(x < 0) x = pc.smallestCockIndex();
		output("A minute or so later you’ve got the blue shortstack’s hands braced against the synth glass and you’re firmly slotting your [pc.cock " + x + "] into " + (maleBitch ? "his":"her") + " asshole with aggressive thrusts of your [pc.hips], relishing their tight, warm innards whilst you continue to watch their partner being fucked senseless by the LG-BT’s robotic toys." + (pc.balls > 1 ? " Your [pc.balls] slap an energetic rhythm against their " + (maleBitch ? "brawny":"jiggly") + " butt.":""));
		output("\n\n<i>“Fuck! Words! Fuck!”</i> your little cocksleeve groans, shivering, concentrating on accommodating your " + (pc.cocks[x].cLength() < 6 ? "snack-sized":"big") + " alien prick in their small body. You reach over and stab at the control panel, watching the monitor with vicarious delight as another, brutally long dildo cranes itself around the bound " + (!maleBitch ? "male":"female") + " outside.");
		output("\n\n<i>“This is as bad as the time those raskvel found those two tree trunks and...”</i> Whatever the hogtied gabilani was about to say is drowned out by a good six inches of prosthetic cock, stopping " + (!maleBitch ? "his":"her") + " throat with a gargle. They jerk and flail, cumming helplessly to the spit-roasting, " + (!maleBitch ? "a shower of oily cum forced out of his clenching cock.":"her pussy clenching up around its thick insertion, oily fem-lube seeping down her thighs."));
		output("\n\nIt’s a damn shame you beat up the LG-BT too much to take it for a test drive, display your little fuck nugget to the world. This is Tarkus though: the locals are pretty good at sniffing out a good time by themselves. A glance downwards reveals that a small gaggle of raskvel have been drawn out of the junk wilderness and are gazing, whispering and giggling, up at the dangling gabilani. This is a treat for them, no doubt - vacationing gabilani probably torment them frequently with just such machines. The bound blue-skin’s eyes are almost starting out of " + (!maleBitch ? "his":"her") + " head, hands flapping together as if vainly trying to shoo " + (!maleBitch ? "his":"her") + " audience way, only increasing its vocal mirth.");
		output("\n\nBlood surges down your [pc.cock " + x + "], tightening it up and preparing you for a sumptuous orgasm. Your gratified sighs meld with your partner’s groan as you fill " + (!maleBitch ? "her":"his") + " intestines with [pc.cum], delivered with a series of hard thrusts into their " + (!maleBitch ? "soft, wide":"tough, muscular") + " backside. You rest against them when you’re spent, cum oozing back around your [pc.cockNoun " + x + "], contentedly watching the " + (!maleBitch ? "male":"female") + " gabilani outside cum explosively again, swinging from " + (!maleBitch ? "his":"her") + " bonds, drawing a rousing cheer from below.");
	}
	//Female
	else
	{
		output("A minute or so later you’ve got a blue shortstack’s head wedged between your [pc.thighs], a busy little tongue filling [pc.eachVagina] with wonderful, wet sensation, all the while you watch their partner getting fucked senseless by the LG-BT’s robotic toys.");
		output("\n\nYou tighten your grip around their skull whenever you feel " + (maleBitch ? "he":"she") + " is slacking, relax and groan encouragement whenever that smooth, hot pressure presses against a particularly sweet spot. Really though, it’s all good when you’ve got a show like the one on your monitor to enjoy. You reach over and stab at the control panel, watching the monitor with vicarious delight as another, brutally long dildo cranes itself around the bound " + (!maleBitch ? "male":"female") + " outside.");
		output("\n\n<i>“This is as bad as the time those raskvel found those two tree trunks and...”</i> Whatever the hogtied gabilani was about to say is drowned out by a good six inches of prosthetic cock, stopping " + (!maleBitch ? "his":"her") + " throat with a gargle. They jerk and flail, cumming helplessly to the spit-roasting, " + (!maleBitch ? "a shower of oily cum forced out of his clenching cock.":"her pussy clenching up around its thick insertion, oily fem-lube seeping down her thighs."));
		output("\n\nIt’s a damn shame you beat up the LG-BT too much to take it for a test drive, display your little fuck nugget to the world. This is Tarkus though: the locals are pretty good at sniffing out a good time by themselves. A glance downwards reveals that a small gaggle of raskvel have been drawn out of the junk wilderness and are gazing, whispering and giggling, up at the dangling gabilani. This is a treat for them, no doubt - vacationing gabilani probably torment them frequently with just such machines. The bound blue-skin’s eyes are almost starting out of " + (!maleBitch ? "his":"her") + " head, hands flapping together as if vainly trying to shoo " + (maleBitch ? "his":"her") + " audience way, only increasing its vocal mirth.");
		output("\n\nYour [pc.clit] throbs and clenches up repeatedly in response to the " + (maleBitch ? "male":"female") + "’s avid flicking, licking tongue, and you moan in sheer delight as the pulses travel up your [pc.vagina], " + (!pc.isSquirter() ? "little dribbles":"a big, filthy gush") + " of [pc.girlCum] turned out by the orgasm. You clench your [pc.thighs] hard around the head of your designated cunt lick, unwilling to let that lavish, wet mouth go until you’ve ridden the entire crescendo of juicy pleasure out. You flop back in the chair when you’re done, contentedly watching the " + (!maleBitch ? "male":"female") + " gabilani outside cum explosively again, swinging from " + (!maleBitch ? "his":"her") + " bonds, drawing a rousing cheer from below.");
	}
	output("\n\nYou help yourself to the mini-bar, letting your gabilani pet get up and hobble to the little bathroom unit whilst you enjoy a post-coital apertif.");
	output("\n\n<i>“I’d keep them out there for a little bit,”</i> you tell them, indicating their partner outside, who is now having " + (!maleBitch ? "his":"her") + " nipples tormented by mechanical arms tipped with bullet vibes. <i>“The raskvel’ll be pissed if you cut their fun short. You probably want to exhaust your friend before you let them back up here anyway.”</i>");
	output("\n\n<i>“Uh... yeah.”</i> The " + (maleBitch ? "male":"female") + " sits " + (maleBitch ? "himself":"herself") + " down in the chair, conflicted frown on their face, torn between what’s happening on the monitor and you. <i>“You’re pretty gabilani-like, the way you think, alien. You’d be right at home on our stations. Has anyone ever told you that?”</i>");
	output("\n\nPossibly a compliment? You’ll have to take it as one, as thoroughly satisfying as this has been it’s time to move on. You clamber back out of the hatch and down the LG-BT’s leg, receive the standing ovation and cheers from the raskvel crowd with a big muggy grin, and then set off back into the wastelands, the shrill moans and curses of the dangling gabilani fading behind you.\n\n");
	processTime(30);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Loss Scenes
//Hood Ornament
public function gabilaniHoodOrnamentLossOhNo():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("The LG-BT moans and clanks as it’s maneuvered over so that its great metal bulk looms directly over you. For one horrible moment you get it into your head that the gabilani plan on squishing you like a piece of roadkill... but no, the walker’s padded feet stop either side of you, and it is with some relief you see the weapons far above withdraw with a whirr backwards, leaving the chin of the war machine bare.");
	output("\n\n<i>“Oh wow,”</i> coos the female gabilani, once she’s clambered down the transport’s leg to get a closer look at you. Up close, you can see that she’s a plump, blue-haired little thing in a one-piece jumpsuit, with plush, wide-set boobs and a big, jiggling ass. <i>“Look at you!");
	if(pc.race() == "gabilani") output(" So gabilani-like. That’s eerie. Ooh, it gives me little shivers.”</i>");
	else if(pc.race() == "raskvel") output(" So much like the herliani. But then you get close enough, and you <b>see</b> the alien-ness! Ooh, it gives me little shivers.”</i>");
	else if(pc.tallness > 5*12+10) output(" Such size! Such alien vastness and... fruitiness! Gosh, I could run my hands over all of that for <b>days</b>.”</i>");
	else output(" There is such strangeness in the outer cosmos, isn’t there? I couldn’t ever imagined something so bizarre just wandering around the wastelands a few years ago. And yet... kinda enticing.”</i>");

	output("\n\nShe strips you of your equipment, baring your [pc.skinFurScales] to the dust of Tarkus and spends a while pinching, stroking and cooing over your naked flesh, pushing your head into her boob and grinning up at her chunky handheld device, taking selfies with you. You’re too " + (pc.HP() <= 1 ? "broken":"delirious with arousal") + " to fight against this treatment; you just hope that eventually she’ll " + (pc.HP() <= 1 ? "get bored of you and go on her merry way":"do something to alleviate the overpowering need in your [pc.groin]") + ".");
	output("\n\n<i>“What do you think, dear?”</i> calls the male from the cockpit. <i>“Decent trophy?”</i>");
	output("\n\n<i>“Oh absolutely!”</i> replies the female merrily. <i>“We aren’t going to find anything near as presentable out here. Send down the winch!”</i>");
	output("\n\nWinch... ? You gasp as warm hands clasp your wrists and jerk them firmly behind your back, hard metal encircling them and clasps them together. ");
	if(pc.legCount == 2) output("Similar is done with your ankles, wrenched back towards your [pc.ass] before being cuffed together with hard-light cable to the bonds holding your hands, hogtying you.");
	else output(" She clicks adjustable wide bracelets attached to hard-light cable around your lower body, winching it all together into the same bundle holding your hands, hogtying you.");
	output(" A terrible presentiment shivers through you as you hear something descending from the LG-BT’s underside with a whirr... and then you feel the hard-light cables being hooked behind you and, with a gasp, you find your helpless, bound, naked form being lifted slowly into the air like a piece of cargo.");
	output("\n\n<i>“Don’t panic, ok darling?”</i> the female gabilani suggests brightly. <i>“Just concentrate on looking weird and cool and being a lovely, luscious slut for us.”</i> Her upturned face slowly moves away from you as you are raised up, up, up, dangling from the LG-BT’s winch until it clicks back into its housing on the walker’s chin, the ground a frightening, dizzying distance beneath your poor, naked flesh, your [pc.chest] arched outwards by the firm, unfeeling grip the machine has on your wrists and [pc.legOrLegs].");
	processTime(15);
	clearMenu();
	addButton(0,"Next",gabilaniHoodOrnamentLossOhNo2);
}

public function gabilaniHoodOrnamentLossOhNo2():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("<i>“Is [pc.he] in place? Excellent.”</i> The male’s voice is close enough to you now that it sounds like he’s speaking into your ear; his lusty anticipation vibrates through you. <i>“Let’s get out the other box of toys!”</i>");
	output("\n\nThere’s an ominous series of clicks and whirrs above your head, and you groan when you see what he means. A series of spindly mechanical arms are flexed around you, each one tipped with some garishly colored sex toy: dildos, cock-rings, vibrating studs, a drooling injector filled with pink fluid. This latter is unceremoniously jabbed into your [pc.ass]; the sharp pain is superseded by aphrodisiac lust flooding through your system" + (pc.lust() >= pc.lustMax() ? ", your already overwhelming arousal now blotting out every other instinct, whatever panic you feel about your situation replaced by the need to FUCK and NOW":"") + ".");
	if(!pc.isErect() && pc.hasCock()) output(" Heat and hardness veins into [pc.eachCock], becoming restless and turgid without even a hint of manual stimulation.");
	else if(pc.hasVagina() && pc.lust() < pc.lustMax()) output(" [pc.EachVagina] spreads and moistens, " + (!pc.isSquirter() ? "beading":"drooling") + " [pc.femcum], practically begging to be filled.");
	pc.buttChange(20);

	output("\n\nYour lusty moan turns into a squawk when a hooked, pronged, metal hand like a craning, two-fingered hoe reaches over your hand and skilfully hooks itself into your nostrils. It adjusts itself with a tiny whirr and then gently but firmly tilts your head backward, blunt upward pressure flaring your poor nose. You open your mouth to protest that this is too much, way too much - and another mechanical arm rams a black ball-gag into your mouth, turning your words into a wet, outraged muffle.");
	output("\n\n<i>“Winch secure? Check. Devices operational? Check. Muffler and display hasp locked in? Check!”</i> booms the gabilani male’s voice merrily. <i>“Let’s have a look...”</i> a free-flying camera drone hovers about your face. <i>“...oh my. You were right, darling! What a splendid hood ornament! Oh, we’ll be the talk of Arbetz for weeks.”</i>");
	output("\n\n<i>“We haven’t even gotten started yet...”</i> the female is back in the cockpit, and sounds positively gleeful. <i>“Let’s try... this!”</i>");
	output("\n\nTransfixed on the LG-BT’s bondage gear 18 feet in the air, you can only moan and flex helplessly against your intractable fetters as you feel a thick, smooth bluntness press against your [pc.vagOrAss], boring its way into your sensitive inner passage. Once the dildo has spread your " + (!pc.hasVagina() ? "[pc.anus]":"[pc.vaginaNoun]") + " dramatically wide and begun filling you deep, it begins to vibrate hard, maddening, juddering shivers which cannot fail to stimulate your aphrodisiac-ridden body. You huff and whine helplessly around your ball-gag, not even able to see what’s being done to your rear end with your nose hooked like it is.");
	output("\n\n<i>“Loooovely,”</i> croons the female. <i>“Yeah, keep the camera focused on [pc.himHer]. I’m enjoying that.”</i>");
	output("\n\n<i>“Yeah?”</i> schmoozes the male. <i>“What if I did... this?”</i>");
	if(pc.hasCock()) output("\n\nThere’s another whirr, and you feel something heated and padded grip your fervently erect [pc.cock]. You ball your fists as the ingenious, hateful, wonderful little device flicks up and down your dick, coiling your sensitive, chemically aroused flesh into a flaming hard-on, all the while the dildo in your [pc.vagOrAss] remorselessly judders into your prostate.");
	if(pc.hasVagina()) output("\n\nYou know what’s probably coming next, but it doesn’t stop the fresh pressure applied to your [pc.anus], patiently opening you and spearing its way in, any more intense. This dildo is smaller, squirts oil to ease its passage, but is also covered in small bumps. So that when it begins to thrust in and out of you hard with mechanical remorselessness, the bumpy sensation is impossible not to be devoured by, particularly as it rubs against the vibrating one in your [pc.vagina].");
	// {merge}
	output("\n\nWith the amount of aphrodisiac they’ve pumped into you, you can’t take this kind of stimulation for long. You moan wetly around your gag, saliva drooling around it as you cum explosively to the pleasure being forced upon your overheated loin");
	if(pc.hasGenitals()) output(", ");
	if(pc.hasCock())
	{
		output("your [pc.cock] " + (pc.cumQ() < 100 ? "squirting dribs and drabs of [pc.cum]":"blurting out thick ropes of [pc.cum]") + " in intense spasms, jerked onwards by the hot, smooth ring coiling it up and down");
	}
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("your [pc.vagina] quivers and pulses ecstatically, clenching up around the vibrating dildo and making you feel every smooth, dense, shivering inch of it, " + (!pc.isSquirter() ? "dripping":"squirting") + " [pc.girlCum] about your stuffed entrance");
	output(". The cords of saliva and sexual fluids your agonized body produces fall into the empty air, not hitting the dirt far below for long, long seconds. ");
	output("\n\n<i>“Oh beautiful aliens,”</i> moans the female blissfully. She sounds like she’s fist deep in herself. <i>“So pneumatic. So exotic. So <b>sesquipedalian</b>. ”</i>");
	output("\n\n<i>“And we haven’t even gotten started yet!”</i> There’s a roar, and a huge tremor is thrown up you, as the male restarts the LG-BT’s engine. <i>“C’mon. Let’s go show these wretched wastelands the kind of trophy a gabilani calls its own!”</i>");
	output("\n\nYou moan, biting deep into the rubber holding your mouth open, as you feel the gigantic dildo deep in your [pc.vagOrAss] vibrate anew, at the same time as the huge walker takes its first ponderous, stalking step forward.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gabilaniHoodOrnamentLossOhNo3);
}

public function gabilaniHoodOrnamentLossOhNo3():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	output("You dangle from the LG-BT’s chin, a bondage slave trophy, as the gabilani stomp it around Tarkus’s sprawling scrap-heaps and ruins. They find little settlements of sydians, raskvel burrows and little enclaves of lapinara and display the alien captive to them, wriggling and gasping to the unceasing attentions of their niggling, ravishing sex toys, booming their triumph from the transport’s sound system so that all come out of their homes and get an eyeful of you. You see disgust, amusement, pity and undisguised lust in a myriad of distant, upturned native expressions.");
	if(pc.exhibitionism() >= 66) 
	{
		output("\n\nYou squirm away from the truth at first, but there’s ultimately no hiding away from the fact you find this extremely hot. In a way, all of your little dalliances with exhibiting yourself, baring your flesh and making people stare, was simply an overture to this, being turned into a sexual ornament, moaning as you’re fucked raw by the gabilanis’ merciless machinery and dangled over the stage of the world, the ordinary folk of Tarkus staring, laughing and whispering at the humiliating spectacle of you. You cum and you cum again, your skin burning to the magnificent shame, and you curse and bless your own filthy mind in the same, ball-gag muffled, saliva-clotted breath.");
		//Max out exhibitionism if not already - FEN NOTE: Nah.
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
	}
	//If not Exhibitionist AND Willpower 90+: - FEN NOTE: Nah.
	else if(pc.willpower()/2 + rand(20) + 1 >= 30) 
	{
		output("\n\nThe sensual overload and the humiliation is overwhelming, but you have a will made of iron. You focus yourself into a little ball, a small, calm ball in your core, and let what’s happening wash over your outer self. This, too, shall pass. You will take this and use it to make sure it never happens again. When Tarkus’s natives look up at you, whispering and jeering at the fuck puppet shivering and jerking away up there, they meet a cold, solemn pair of [pc.eyes], and you find you can make most look away again, ashamed with themselves.");
		pc.exhibitionism(2);
	}
	else
	{
		output("\n\nUltimately the humiliation, the raw panic of dangling so far above the ground and the intense sexual stimulation being forced upon you all melds into one nervy, sensual overload, and you find it’s better to let your mind go and embrace being a sexual ornament, a horny, broken bitch displayed for all to see. You quiver and cum to the remorseless attentions of the machinery fondling, mauling and pounding you from behind, and find that doing it to a baffled, whispering, laughing audience actually makes it all the better.");
		//Significant exhbitionist gain
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
		pc.exhibitionism(2);
	}
	// {merge}
	if(pc.canMilkSquirt()) 
	{
		output("\n\nThe little spurts and dribbles of [pc.milk] you inevitably produce from your [pc.boobs] as you’re stimulated eventually catch the gabilani’s attention. You moan and then whine as a snakey set of cup milkers wind their way around your form and fasten themselves tightly to your [pc.nipples], tickling and kneading those wet, sensitive nubs of yours. The hard suction is soon coaxing a steady flow of [pc.milk] into the cups and up the tubes, all the while your [pc.vagOrAss] continues to get pounded silly. Oh Void, you can’t help it... the sensation is taking over your mind, seizing your vocal chords...");
		output("\n\n<i>“Moooooooooooo!”</i> you whine around the ball-gag, thrashing futilely against your bonds, a huge gout of [pc.milk] flooding out of your bouncing, quivering [pc.boobs].");
		output("\n\n<i>“Mmmm, [pc.milkFlavor]!”</i> you hear the male gabilani says approvingly, with a smack of the lips. <i>“Exquisitely decadent! I don’t believe I’ve tasted anything quite like it.”</i>");
		output("\n\n<i>“Could you turn the suction up, darling?”</i> replies the female coolly. <i>“I fancy another glass.”</i>");
		output("\n\nYou groan as the fingers of air squeeze your [pc.nipples] even harder...");
		pc.milked();
	}
	// {merge}
	output("\n\nThe gabilani are as imaginative as they are restless, and they experiment with every sexual device at their fingertips as the LG-BT continues to lumber about the ruined landscape with you dangling from its underside, forced to endure every single one." + (pc.totalVaginas() > 1 ? " They pump your every fuckhole with oily dildo, pushing vibrators into your [pc.vagina] and your [pc.vagina " + 1 + "] whilst using the big, bumpy one on your [pc.anus], forcing you to multiple, brain-melting orgasms.":"") + (pc.cockTotal() > 1 ? " They have multiple cock-wringers, and they employ them all eventually, the things working [pc.eachCock] like pedals, gripping and masturbating you furiously to one prostate-milked high after another.":""));
	if(pc.hasParasiteTail())
	{
		output(" Your ");
		if(pc.hasTailCock()) output("[pc.tailCock]");
		else output("[pc.cuntTail]");
		output(" provides them with much amusement once a mechanical arm has managed to clamp onto the thing. It writhes ecstatically as ");
		if(pc.hasCuntTail()) output("a knobbly dildo is fed into it, its sensitive cilia clamped onto it and slurping away happily, feeding yet more unbearable pleasure into your core.");
		else output("a big, moist fleshlight is provided for it, pumping its red hot length into its deep, velvety innards, feeding yet more unbearable pleasure into your core.");
	}
	output("\n\nYour body isn’t their only source of entertainment: the female brought your equipment up to the cockpit with her. The male has great fun drunkenly firing your [pc.rangedWeapon] out of the hatch at anything that catches his eye, whilst " + (!(pc.lowerUndergarment is EmptySlot) ? "the female tries on your [pc.underGarments], tutting about the gaudy bagginess of alien design.":"the female plays with your codex, filing through your database of sapient species before getting bored and asking it increasingly filthy questions about [pc.race] culture."));
	output("\n\nYou are a nerveless, quivering wreck by the time the great walker comes to a halt and finally, thankfully, the massive dildo that’s spent the last innumerable hours shoved up your [pc.vagOrAss] withdraws. You are utterly spent, dripping what must be the last milliliters of");
	if(pc.hasCock()) output(" [pc.cum] and");
	if(pc.hasVagina()) output(" [pc.femcum] and");
	if(pc.canMilkSquirt()) output(" [pc.milk] and");
	output(" saliva left in your body from the tenderized tips of your body. When the ball-gag comes loose from your mouth with a wet ‘pop’, all you can muster is a woozy, wordless groan.");

	output("\n\n<i>“Aww,”</i> coos the female gabilani over the loudspeaker. <i>“Look at the poor alien! We should take [pc.himHer] inside, feed [pc.himHer] a bit, let [pc.himHer] rest. Then fuck [pc.himHer] some more.”</i>");
	output("\n\n<i>“Now darling,”</i> sighs the male. <i>“You know the High Command’s ruling on this. Molest, then dispense! So others may enjoy the same safari experience you do.”</i>");
	output("\n\n<i>“Meanie,”</i> pouts the female. <i>“Fine! But you know we’re not going to be able to buy a better pet anywhere else.”</i>");
	output("\n\nThey’re arguing whilst the winch slowly spools out, lowering you downwards. Your aching wrists and [pc.legOrLegs] are finally released as your naked, sweaty flesh is pooled onto the dusty, rocky ground. Your gear is flung out of a hatch, landing with a clatter around you; it’s not obvious if this is a conscious decision to give you your stuff back, or simply the casualties of an increasingly animated argument. With a whirr and a metallic groan, the LG-BT clanks off, bearing its sadistic, libidinal cargo away.");
	processTime(30);
	for(var x:int = 0; x < 7; x++) { pc.orgasm(); }
	if(pc.canMilkSquirt()) pc.milked();
	clearMenu();
	addButton(0,"Next",endOfStupidHoodOrnamentBadness);
}

public function endOfStupidHoodOrnamentBadness():void
{
	clearOutput();
	author("Nonesuch");
	showLGBT(true);
	output("For a long while you just sit with your bare back against a rock, massaging sensation back into your wrists and your [pc.legOrLegs], slowly recovering from this most bizarre and excruciating " + (pc.exhibitionism() >= 66 ? "(<i>exquisite</i>, the slutty part of your mind murmurs) ":"") + "of experiences. Your sexual equipment aches like it’s just... well... been fucked raw over the course of several hours, and you’ve been dumped somewhere completely random on Tarkus. You gloomily take in your unfamiliar surroundings. But you still have your gear, and you weren’t turned into a plump greenskin’s sex slave. There are things to be grateful for.");
	processTime(120);
	pc.orgasm();
	if(pc.canMilkSquirt()) pc.milked();
	output("\n\n");
	CombatManager.genericLoss();
	IncrementFlag("HOOD_ORNAMENTED");
	// +3 Hours, gape up on anus and vagina if present, lust/semen/milk reset, PC placed in random non-quest square on Tarkus map
	//move to square
	putOnRandomLGBTSquare();
}

public function putOnRandomLGBTSquare():void
{
	moveTo(RandomInCollection(["225","226","227","228","229","230","231","232","233","234"]));
}

//Bimbo Submit
//Option appears when encounter begins if PC is a bimbo and has a vagina
//Tooltip: These silly green meanies are going to ruin your make-up with their big ugly machine! Surely there’s a nicer, sexier way to resolve this?

public function bimboSubmitToGabbi():void
{
	clearOutput();
	author("Nonesuch");
	showLGBT(true);
	output("<i>“Ohhh!”</i> you whine, darting out of the way of the advancing walker and presenting yourself as clearly as you can to the winking camera drones up on the synth glass cockpit. You gaze into them and pout your [pc.lips] piteously, letting your [pc.chest] heave and providing a clear view of your [pc.hip] as you do. <i>“Do you have to be so rude and rough? I mean, I quite <i>like</i> it when cute sexies get a little rough...”</i> you giggle. <i>“But not with like guns and stuff! Why don’t you let me come up there, and we’ll have fun we can all enjoy?”</i>");
	output("\n\nThe LG-BT pauses, its weapons still trained on you, as if the machine itself were thinking it over.");
	output("\n\n<i>“The alien’s manner of greeting is certainly... intriguing,”</i> the male gabilani says thoughtfully. Their sound system broadcasts his voice to you clearly. <i>“And it’s certainly an, uh. Particularly luscious sample. What do you think, darling?”</i>");
	output("\n\n<i>“Power the weapons down!”</i> The female’s tone drips with lusty anticipation. <i>“I keep telling you I want a pet on these trips of ours, don’t I? That alien looks absolutely perfect, and she’s volunteering. She <b>wants</b> to be our slutty little carry-on toy. Come on up, cutie!”</i>");
	output("\n\nThe LG-BT’s armaments shudder and then slump downwards with a disappointed hum. A line of rungs leading up its legs light up, and a hatch in the synth glass opens with a click. Yay! You bounce across to the leg, happily clamber up.");
	// +Lust, move to random non-quest square on Tarkus
	pc.lust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",bimboSubmitToGabbi2);
}

public function bimboSubmitToGabbi2():void
{
	clearOutput();
	author("Nonesuch");
	showLGBT(true);
	output("About ten minutes later your gear is piled in one corner of the plush, cushioned cockpit, your [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " deep in hot, bubbling water, your bare [pc.ass] is in the air, and you’re receiving a lovely, meaty pounding from behind. The male gabilani currently gripping your [pc.hips] is nicely built for his size, athletic and well-rounded with muscle, and as for his cock... you squeal with enjoyment as its thick, blunt, double head thrusts into you in just the right place to make you squirt [pc.femcum], your over-sexed [pc.vagina] practically melting with pleasure.");
	pc.cuntChange(0,standInGabiCockVolume());
	output("\n\nThe female gabilani takes in the show from her perch by the control panel, biting her bee-stung lip, hands shifting down her curvy thighs. She’s a plump, buxom little thing, her one-piece jumpsuit painted over her soft, wide-set boobs, cute, round gut and bountiful, pear-shaped ass.");
	output("\n\n<i>“Don’t I have the best ideas, dear?”</i> she inquires sweetly. <i>“You were going to blow the poor sweet thing up! Instead we now have an alien pet we can both enjoy, whilst we’re taking in the sights.”</i>");
	output("\n\n<i>“Yes darling... oh words... this alien is... ungh! Ungh!”</i> You coo as the male’s hands grip into your hips hard, and you feel your [pc.vagina] being swollen out with a heavy, warm, oily load of cum, delivered with a jackhammer of rapturous thrusts. <i>“ ...is certainly enjoyable,”</i> he groans, coming loose from you in an oily slide and sinking blissfully into the writhing waters of the mini-sauna, reaching for a handy box of cigars. You turn and snuggle into his compact, meaty frame happily." + (pc.tallness > 5*12+9 ? " He’s like a little blue teddy bear to you. A little blue teddy bear with a lovely big cock!":"") + " A moment later the female releases her jiggling blue flesh from the repressive confines of her jumpsuit and squeezes in there with you. It’s pretty squashed in the mini-sauna with three of you, but that just makes it more cozy, more sexy, lots of nice, gabilani flesh for you to slide your [pc.butt] and [pc.chest] against, sink your hands into. Wet, hot, giggly, sighing, groping and happy - bimbo heaven.");
	//Lust +70%, load in pussy
	pc.lust(70);
	pc.loadInCunt(new LGBTPilots(),0);
	clearMenu();
	addButton(0,"Next",bimboSubmitToGabbi3);
}

public function bimboSubmitToGabbi3():void
{
	clearOutput();
	author("Nonesuch");
	showLGBT(true);
	output("The gabilani are a restless, tireless race though, never content to just bake in a sauna and drink cocktails for the best part of the day, as much as you might like to do that. The male scampers back to the control panel, dick and cigar swinging, and soon has the LG-BT stalking back through the strange, ragged landscapes of Tarkus. The gyroscopic stabilizers keep the goldfish bowl cockpit stable, giving the impression you’re floating over the scrap-heaps, toxic spills and salvaged dwellings.");
	output("\n\nYour job is to take pictures of the couple posing next to relics of gabilani history (these mostly seem to be the remains of doomsday machines), simper and exclaim over every titbit of knowledge and gossip they pass on to you, look great, and give plenty of head, and you do all of those things extremely well.");
	output("\n\n<i>“Bit deeper, dear...”</i> sighs the female, sat at the control panel with your head between her wide thighs. You smooch your [pc.lips] into her plump, spread labia, craning your [pc.tongue] deep into her silky, oil-slathered cunt, dragging at her as deep as you can" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " (which, thanks to your wonderfully long, sexy tongue, is very deep indeed)":"") + ".");
	output("\n\n<i>“Yes!”</i> she screams, slamming at a button at the same time her sex shivers against your mouth and dispenses a gush of oily, coating juices all over your face. You feel the LG-BT shiver as it fires a missile at something; you can’t see the target, but you can see the flare of the explosion light up the gabilani’s ecstatic face. <i>“Fucking amazing,”</i> she groans, turning her clunky handheld device, taking a few snaps of your beaming, upturned face between her legs, smeared with her effluent. <i>“This is the best safari ever!”</i>");
	if(pc.canMilkSquirt()) output("\n\nOnce you show them the lovely, [pc.milkFlavor] milk which spurts plentifully from your [pc.boobs] when you knead your [pc.nipples], you also fill in as a drink dispenser. You present your tits on a cushion so that the male can avail himself of them with powerful, ardorous movements of his mouth and fingers, sending delightful shivers through you as you are drained. The female prefers to tweak your [pc.nipples], making you squeak as you drip drops of [pc.milk] into her spirit-filled tumblers, one experimental cocktail thrown down her gullet after another.");
	output("\n\nThe drink flows throughout, blurring everything together in a pleasant haze. The gabilani get extremely excited after they chase a whole pack of screaming raskvel around a crumbling factory complex several times until the whole thing collapses, and an impromptu orgy breaks out in the aftermath. Spirits are poured down your [pc.chest] and [pc.ass] and lapped off, the lascivious movements of their tongues making you sigh and squeal, and then the male opens your [pc.thighs], slots his oversized cock into your [pc.vagina] and fucks you hard whilst the female sits on your face.");
	pc.cuntChange(0,standInGabiCockVolume());
	output("\n\nIn a woozy haze you lap at the smothering, oily folds of the female’s pussy as intense pleasure pulses through you from below, your bimbo pussy gleefully seizing up around the stern, thick pole of the male’s prick and milking it for all it’s worth. You can’t help but moan wetly into the female’s squishy mass intermittently, something that only seems to intensify her riding your tongue.");
	output("\n\nYou finish in a sticky, sweaty heap, having been brought to a couple of pulsating orgasms, coated in gabilani cum of both varieties, drooling it from your [pc.vagina], wedged between the two shortstacks.");
	output("\n\n<i>“Lovely safari,”</i> mumbles one into your [pc.boobs]. <i>“Shame we’ve got to go back up tomorrow.”</i>");
	output("\n\n<i>“Yeeaaahh,”</i> sighs the other, hands clutched around your [pc.hips], <i>“but think of all the words we’ll be in, once we get the pictures out.”</i>");
	output("\n\n<i>“Mmm.”</i> The female is silent for a little, nuzzling your " + (pc.canMilkSquirt() ? "[pc.milk] dripping ":"") + "[pc.nipplesNounSimple]. <i>“Before we let [pc.himHer] go, would you like me to get the strap-on out and fuck [pc.himHer] in the ass whilst you use [pc.hisHer] mouth? She’s only blown you twice.”</i>");
	output("\n\n<i>“Babe... you talk my language.”</i>");
	processTime(50);
	pc.loadInCunt(new LGBTPilots(),0);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bimboSubmitToGabbi4);
}

public function bimboSubmitToGabbi4():void
{
	clearOutput();
	showLGBT(true);
	author("Nonesuch");
	//Load in mouth, cum-covered both varieties, move back to square where encounter began, 70% alcohol, +12 hours
	moveTo("225");
	processTime(60*10);
	pc.imbibeAlcohol(70);
	pc.orgasm();
	pc.applyPussyDrenched();
	pc.applyCumSoaked();
	processTime(30);
	pc.orgasm();
	output("You wave happily at the LG-BT as it retreats into the distance, feeling achey and very satisfied, if somewhat hungover. Gabilani sure do now how to show a bimbo a good time! They even dropped you off outside a travel agency! What nice, scrumptious little fuck toys!\n\n");
	CombatManager.genericLoss();
}