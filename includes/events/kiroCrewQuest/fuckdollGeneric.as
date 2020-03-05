/*
Rotates through four major appearances. All have dicks, pussies, balls, high heels, and boobs. Good excuse to make use of [enemy.attribute] parsers.
Blue vulpatra shortstack with lil dong. Only one with earfuck winscene. (wanted no balls, but that introduces 2much variance)
Laquine with glittery magenta fur (white sparklies all over, so she looks totally glamorous under any light), painted horsedong, balls with a patterned color, and mid-sized breasts. MILK.
Ultra-pale human futa with black lipstick and 1-foot dingledong. Hair like dis.
Demon-morph with 24" rust-red demoncock with black latex nubs :3

General Notes:
Turbosluts. I've written that word a lot today, and it's appropriate here.
Have Purple Cum
Does not take no for an answer. You don't know pleasure, and they're going to teach it to you.
All win sex scenes should induce moderate taint in the PC via fluid contact, drugs, hypnosis, w/e.
Heavily modded. May have well camo'd cybernetics, but anything one has, they all do (probably).
Loss = Bad end. I'll modify Wsan's bad end for these generic sexdolls unless someone wants to do a new one.
Name is a randomly assigned serial number? Kiro is 65, so lower than that.
*/

import classes.Items.Recovery.IllegalStim;

public function showSexDoll(nude:Boolean = false):void
{
	showBust("SEXDOLL");
	showName("\nSEXDOLL");
	if(enemy != null)
	{
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) showBust("KQ_SEXDOLL_LAQUINE" + (nude ? "_CUM":""));
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) showBust("KQ_SEXDOLL_VULPATRA" + (nude ? "_CUM":""));
		else if(enemy.hasCock(GLOBAL.TYPE_DEMONIC)) showBust("KQ_SEXDOLL_DEMON" + (nude ? "_CUM":""));
		else showBust("KQ_SEXDOLL_TERRAN" + (nude ? "_CUM":""));
	}
}

public function genericSexdollEncounter(VR:Boolean = false):void 
{
	var tEnemy:Creature = new KQSexdollGeneric();
	setEnemy(tEnemy);
	if(VR) 
	{
		clearOutput();
		output("You load the program and smile as you are shuffled to an artificial reality on a current of perfectly programmed electrons. You find yourself back in time, trying to rescue Kiro, fighting your way through endless, sexy dolls...");
		enemy.createStatusEffect("VR");
		enemy.inventory = [];
		enemy.credits = 0;
		enemy.XPRaw = 0;
	}
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatTheGenericSexydoll);
	CombatManager.lossScene(loseToTheSexdoll);
	CombatManager.displayLocation("SEXDOLL");
	
	showSexDoll();

	var seenType:Boolean = ((enemy.hasCock(GLOBAL.TYPE_HUMAN) && flags["KQ_MET_SEXDOLL_HUM"] != undefined)
						|| (enemy.hasCock(GLOBAL.TYPE_DEMONIC) && flags["KQ_MET_SEXDOLL_DEM"] != undefined)
						|| (enemy.hasCock(GLOBAL.TYPE_EQUINE) && flags["KQ_MET_SEXDOLL_LAQ"] != undefined)
						|| (enemy.hasCock(GLOBAL.TYPE_VULPINE) && flags["KQ_MET_SEXDOLL_VUL"] != undefined));

	//First time
	if(flags["KQ_MET_SEXDOLL_VUL"] == undefined && flags["KQ_MET_SEXDOLL_DEM"] == undefined && flags["KQ_MET_SEXDOLL_LAQ"] == undefined && flags["KQ_MET_SEXDOLL_HUM"] == undefined)
	{
		output("\n\nHigh-heeled feet tap confidently closer, alerting you that something feminine this way comes. Just as you’re readying your [pc.weaponStat] to confront Kiro’s captor, a creature of obscene, sculpted sexuality sashays into view. She carries no weapon, nor would she. A naked ");
		if(!CodexManager.entryUnlocked("Laquines") && enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("furry alien");
		else if(!CodexManager.entryUnlocked("Vulpatra") && enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("furry alien");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra");
		else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine");
		else if(!enemy.hasCock(GLOBAL.TYPE_DEMONIC)) output("human");
		else output("demon of some kind");
		output(" wouldn’t benefit from a gun or a sword any more than she would armor. Such accoutrements would impede the near-perfect jiggle of her flawless chest and the metronomic swaying of the length between her legs, half-hard even before she sees you.");

		output("\n\n<i>“A visitor?”</i> She squirms in delight. <i>“When Mistress Po told me you to search for intruders and fuck them as long and hard as I could... I assumed I’d spend the next few days on patrol, edging myself stupid.”</i> As if summoned by the thought, her prick jumps to a fully erect state. <i>“But now I can teach you how good it feels to get fucked... and fuck... and fuck how you’re told.”</i> ");
		if(!enemy.hasMuzzle()) output("Angelic lips curl");
		else output("Her narrow snout curls");
		output(" into a smile of erotic promise. <i>“Once you have your first obedience-trigger cummy, you’ll never wanna think for yourself again. Promise!”</i>");
		//Max lusterinos
		if(pc.lust() >= pc.lustMax()) output("\n\nYou barely keep from drooling at the sight of her. She’s going to show you such sights...");
		//High or bimbino/bro
		else if(pc.taint() >= 66 || pc.isBro() || pc.isBimbo()) output("\n\nYou brace for combat, not wanting to let this tarted up turbo-slut be the one to pin you to the deck. That’s your job!");
		//Taint low
		else if(pc.taint() < 33) output("\n\nYou brace yourself for combat. She doesn’t sound like she’s going to let you talk her down, and if you wait any longer, she’s going to pin you to the floor.");
		//Taint med
		else output("\n\nYou brace for combat, knowing at a glance that this modded hyper-harlot’ll have you pinned to the deck and squealing in bliss if you let her. You just don’t have time for that right now...");
	}
	//Repeat
	else
	{
		output("\n\nOnce more, you hear the sound of high heels clicking your way. There’s just enough time to brace yourself before another giggling mess of sexuality stumbles into your way. ");
		if(!seenType) output("This time, it’s a ");
		else output("It’s another ");
		if(!CodexManager.entryUnlocked("Laquines") && enemy.hasCock(GLOBAL.TYPE_EQUINE) || !CodexManager.entryUnlocked("Vulpatra") && enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("furry alien");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("winking vulpatra");
		else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("milk-skinned terran");
		else if(enemy.hasCock(GLOBAL.TYPE_DEMONIC)) output("pouting demoness");
		else output("bright pink bunnyslut");
		output(", complete with stiffening [enemy.cockNounSimple], squeezably ripe tits, and a smile full of equal parts midnight promises and sexy danger. <i>“There you are! Did you know Mistress Po said I could fuck you as much as I want?”</i> She leans closer, running a glittering ");
		if(!enemy.hasArmFlag(GLOBAL.FLAG_PAWS)) output("nail");
		else output("claw");
		output(" down the expanse of her uncovered bust. <i>“Of course I always wanna fuck.”</i> She pauses, when her digit clips a nipple, forcing it to leap to a crinkled, jutting state. <i>“And you will to!”</i>");
		//max lust
		if(pc.lust() >= pc.lustMax()) output("\n\nThe mere suggestion is enough to make your " + (pc.hasKnees() ? "knees wobble":"[pc.legOrLegs] threaten to buckle") + ". You’re so fucked! ...At least it’ll feel good.");
		//Low taint
		if(pc.taint() < 33) output("\n\nYou brace for another fight. No matter how many mind-controlled toys this <i>“Mistress Po”</i> sends your way, you’ll stand firm" + ((pc.hasCock() && pc.isErect()) ? ". Squinting, you glance at your crotch - hopefully not <i>too</i> firm":"") + ".");
		//Med taint
		else if(pc.taint() < 66) output("\n\nWith a heavy sigh and a slight adjustment in posture, you’re ready to do battle with the naked hermaphrodite. It doesn’t matter how sexy this <i>“Mistress Po”</i> can make her dolls! You’ll defeat them all the same... and <i>then</i> enjoy the fruits of her labors. ...If you really need to let off some steam.");
		//High taintarooni
		else output("\n\nYou raise your [pc.weapon] and break out into a broad smile of your own. You don’t mind danger when it’s this sexy. In fact, you’re pretty sure you could teach her a few things about who she should be obeying, once you’ve suitably tamped down her attempts to dominate.");
		//Merge
	}
	//Don’t forget to unlock Codexes as needed!
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE) && !CodexManager.entryUnlocked("Vulpatra")) 
	{
		output("\n\nYour Codex helpfully chirps, <i>“Vulpatra detected. This fox-like race of diminutive telepaths is capable of subsisting on a diet comprised entirely of cum. Despite the small size, they can be capable combatants.”</i>");
		output("\n\nGreat.");
		CodexManager.unlockEntry("Vulpatra");
	}
	//Alt:
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE) && !CodexManager.entryUnlocked("Laquines"))
	{
		output("\n\nYour Codex helpfully chirps, <i>“Laquine detected! Bearing anatomy similar to earthly rabbits and horses, they are said to combine the libidos of both. Great care should be given to avoid unintentional innuendo, given their outsized breeding urges.”</i>");
		output("\n\nGreat.");
		CodexManager.unlockEntry("Laquines");
	}
	//Demon/Terran first time:
	else if(!seenType)
	{
		output("\n\nYou look to your Codex, expecting some notification about a new race, but it lies inert. Whoever’s underneath all those mods isn’t anything new.");
	}
	//Count meetings:
	if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) IncrementFlag("KQ_MET_SEXDOLL_LAQ");
	else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) IncrementFlag("KQ_MET_SEXDOLL_VUL");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) IncrementFlag("KQ_MET_SEXDOLL_HUM");
	else IncrementFlag("KQ_MET_SEXDOLL_DEM");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Victory Setup:
public function defeatTheGenericSexydoll():void
{
	IncrementFlag("KQ_SEXDOLLS_DEFEATED");
	if(!enemy.hasStatusEffect("VR"))
	{
		if(flags["KQ_SEXDOLLS_DEFEATED"] == 2) enemy.inventory.push(new DildoCanine());
		else if(flags["KQ_SEXDOLLS_DEFEATED"] == 4) enemy.inventory.push(new TamaniBionaHole());
		else if(flags["KQ_SEXDOLLS_DEFEATED"] == 6) enemy.inventory.push(new DildoEquine());
		else if(flags["KQ_SEXDOLLS_DEFEATED"] == 8) enemy.inventory.push(new GravCuffs());
		else if(flags["KQ_SEXDOLLS_DEFEATED"] == 10) enemy.inventory.push(new SexdollVRProgram());
		else if(rand(3) == 0) enemy.inventory.push(new IllegalStim());
	}
	//HP
	if(enemy.HP() <= 1)
	{
		output("Collapsing in a heap of sweat and sadness, [enemy.name] looks back at you with a cloud of disappointment in her otherwise lusty gaze. <i>“We coulda had so much fun! Look at me! Look at how fuckable I am!”</i> She wiggles her hips, nearly toppling over from the effort. <i>“I’m made for sex. Made to make you cum. Every part of me is designed to make you feel good, but now everything hurts instead.”</i> She rolls onto her side to splay out, pouting up at you. <i>“Fuck me better? You can leave whenever you want. Just... one... little... fuckie.”</i>");
	}
	//Lust
	else
	{
		output("With a screech of pure desire, [enemy.name] reaches for her crotch and slides bonelessly to the ground. Her shapely thighs scissor open invitingly as she sets to pumping her [enemy.cockNounSimple] like it owes her money, moaning like a " + (enemy.originalRace == "laquine" ? "laquine in heat":"whore in heat") + ". <i>“F-f-fuck! No wonder Mistress Po wants to fuck you!”</i> She shimmies closer, nearly insensate with desire. <i>“I need fucked! I don’t care if it makes me a bad girl and a worse toy. Fuck me, please! I’ll give you as many cums as you want, even let you go after one!”</i> Her eyes are wide, frantic. <i>“Puhleeeaaase? ...use me...”</i>");
	}
	//Earcunt addendum, replaces last line of above victory setups:
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		output("\n\nStrangely, the vulpine mynx’s crotch isn’t the only place swelling with desire. The inner linings of her ears have puffed up, flushing with erotic engorgement until it’s impossible to miss the welcoming crease near the center. Any last doubts about the nature of the auric entrances is dispelled when the fallen futanari slips a digit inside one to the knuckle and moans raucously.");
		output("\n\nLeaving the clearly mind-broken herm writhing on the floor might be cruel, but do you really have time to stop and " + (pc.hasCock() ? "fuck with her exotic ears?":"play with this ‘Mistress’ Po’s dolls?"));
	}
	else if(enemy.HP() <= 1) output("\n\nIt’s a tempting offer, and she’s still hard... and wet beneath those taut testicles.");
	else output("\n\nLeaving her without so much as a single orgasm seems cruel... but so does fucking with your friend’s fate on the line. What do you do?");
	output("\n\n");

	//vicotoroy meeenu!
	clearMenu();
	var capacity:Number = enemy.vaginalCapacity(0);
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(capacity) >= 0) addButton(4,"Earfuck",penisRouter,[fuckaDemEarcunts,capacity,false,0],"Earfuck","Walk on the wildest side of all.");
			else addDisabledButton(4,"Earfuck","Earfuck","Your excessively enlarged anatomy would never fit in such a petite hole - either of them.");
		}
		else addDisabledButton(4,"Earfuck","Earfuck","You need a penis to do this.");
	}
	else addDisabledButton(4,"Locked","Locked","This scene is in another sexdoll...");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(capacity) >= 0) addButton(0,"FuckHerPuss",penisRouter,[normalCockInSexdollHole,capacity,false,0],"Fuck Her Pussy","Classic sex never goes out of style, even in the far flung, space-faring future.")
		else addDisabledButton(0,"FuckHerPuss","Fuck Her Pussy","You’re way too big to fuck that pussy like some kind of normal, not-hung person.");
		if(pc.biggestCockVolume() > capacity) addButton(2,"HyperFuck",penisRouter,[questyHypershit,250000,false,capacity],"Hyper Fuck Her Pussy","Cram your plus-sized pillar into the fucktoy’s cock-holster!");
		else addDisabledButton(2,"HyperFuck","Hyper Fuck Her Pussy","You need a tremendously large phallus to perform this act.");
	}
	else
	{
		addDisabledButton(0,"FuckHerPuss","Fuck Her Pussy","You need a penis to do this.");
		addDisabledButton(2,"HyperFuck","Hyper Fuck Her Pussy","You need a huge penis to do this.");
	}
	if(pc.hasVagina())
	{
		addButton(1,"RideHerCock",vaginaRouter,[pcRidesASexdollFacebyWill,enemy.cockVolume(0),0,0,false],"Ride Her Cock","The purpose of this fucktoy is in her name.");
	}
	else
	{
		addDisabledButton(1,"RideHerCock","Ride Her Cock","For this lascivious event... <b>you require your own vagina.</b> Who knows, Maybe Po has one lying around you can slap on?");
	}
	var toolty:String = "Put her mouth to work. And yours. ";
	//bimboOrCumAddict: 
	if(pc.isBimbo() || pc.isCumSlut()) toolty += "Sucking dick is means to an end: rescuing Kiro and getting a filling of thick cum. You can’t let this opportunity go!";
	else if(pc.libido() < 33) toolty += "That dick deserves some up-close attention, after all...";
	else if(pc.libido() < 66) toolty += "She’s tried to seduce you with that dick, might as well try it out, right?";
	else toolty += "That dick is the centerpiece of temptation incarnate, and it’d be a shame to let it wilt a single inch.";
	if(!pc.isTaur()) addButton(3,"Sixty-Nine",sixtyNineFuckdoll,undefined,"Sixty-Nine",toolty);
	else addDisabledButton(3,"Sixty-Nine","Sixty-Nine","<b>Given your ‘tauric shape,</b> your genitals can’t exchange mutual vows.");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//[FENOXO] Vulpatra Earfuck
//Wheeeeee
//Fuck earcunties
public function fuckaDemEarcunts(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fenoxo");
	output("Sprawled out on the ground is no place for the " + (enemy.lust() >= enemy.lustMax() ? "lust-drunk":"lusty, broken") + " toy, especially when you’ve got " + (!pc.hasCocks() ? "a ":""));
	if(pc.isErect()) output("raging hard-on");
	else output("thickening dick");
	if(pc.hasCocks()) output("s");
	output(" lined up throbbing with excitement at the potential to fuck an exotic new hole. Just looking at the short, stacked slut shoots a bolt of shivery anticipation up your spine. Grabbing her by the tips of those fluffy cock-sockets and dragging her up onto her " + (pc.tallness <= 60 ? "knees":"high-heeled paws") + " is a necessary step, one that makes her whimper with increasing ardor and sets your heart to pounding.");
	output("\n\n<i>“Oh.”</i> The word slips lamely from your prey’s mouth. The ear closest to you perks up so violently that the outermost edge almost curls back on itself. Inside, the swollen divot pudges out into a pillowy swell, begging you to clap your hips against it. The far ear folds back with some difficulty, bowing the prodigiously engorged aural organ almost double in a display of extreme submissiveness. <i>“You’re going to fuck my ears, aren’t you?”</i> She doesn’t even close her mouth the whole way after the question. The tip of her tongue hangs just beyond her gently parted lips, flapping as she wiggles a little closer. <i>“That’s... " + (enemy.lust() < enemy.lustMax() ? "okay":"awesome") + ". Go ahead.”</i>");
	output("\n\nYou needed neither her permission nor forgiveness, but you’re happy to have the former.");
	output("\n\nBarreling dick-first into an alien’s head doesn’t seem like the sort of thing you should leap into with unrestrained ardor, so you take your time. You align your [pc.cockHead " + x + "] with the puffed-up earslit, gently nudging yourself forward until you make contact with the velvety inner flesh. It’s strangely slippery, despite the lack of any lubricating flesh. Her skin’s like teflon, allowing you to glide across it with minimum friction but maximum sensation. No fluid insulates you from contact with her warm, gently throbbing flesh. Nothing is in the way. You get to experience sex without barriers - the most direct, most intimate act of mating in the entire universe.");
	output("\n\nThat’s what it feels like anyway.");

	//Build list of all applicable, choose randomly from all.
	var choices:Array = [];
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) choices.push("blunt");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) choices.push("pointy");
	if(pc.cocks[x].thickness() >= 2.5) choices.push("thicc");
	if(pc.cocks[x].thickness() <= 1.1) choices.push("thin");
	if(pc.cocks[x].cType == GLOBAL.TYPE_HUMAN) choices.push("human");

	var select:String = "else";
	if(choices.length >= 1) select = choices[rand(choices.length)];

	//Blunt boiz
	if(select == "blunt") output("\n\n<i>“Oh... umm... so that’s what those feels like.”</i> The newly submissive vixen fails to suppress a shiver of delight. <i>“W-w-wide and thick and f-f-forceful, huh?”</i> Sure enough, you’re forced to thrust a little harder to pry the narrow alien quim wide enough for your blunt-tipped member to slide deeper. <i>“Yeaaaaaaaaah,”</i> she moans, shoulders slackening, tipping her head to give you better access to the downward-angled passage. <i>“Just... fuck me as hard as you want.”</i> She sucks a bit of drool back into her mouth. <i>“You won’t hurt me no matter how b-b-bestial that-mmpphhhh... just fuck me already!”</i>");
	//Pointy tippers
	else if(select == "pointy") output("\n\n<i>“Ah-ah! Just like an ausar....”</i> The newly submissive vixen fails to suppress her excited whimper. <i>“The perfect sh-shape for slipping inside.”</i> She pauses as you provide her with another inch worth of sensation. <i>“G-gets thicker the further you go - ohhhhh mmmm!”</i> she moans, shoulders slackening, tipping her head to give you better access to the down-angled passage. <i>“Just... fuck the whole way in.”</i> Drool drips from her tongue onto her fuzzy tits. <i>“I w-won’t break" + (pc.hasKnot(x) ? " no matter how hard you knot me":" no matter how hard you fuck me") + "... Just do it! Use me, you... sexy brute!”</i>");
	//Thiccccccc
	else if(select == "thicc") output("\n\n<i>“Ohhhh... stretching me so wiiiiide.”</i> The freshly submissive vixen fails to restrain her wanton pleasure. <i>“A big, strong dick for a big, strong " + pc.mf("stud","slut") + ", huh?”</i> Forcing another inch into her shuts her right up, at least for a few seconds. You watch her mouth fall further and further open as the straining passage slowly adjust to your size, plastering the fox-girl’s tits with more and more of her saliva. Sucking her limp, dangling organ back up generates the wettest, sloppiest sound you’ve heard from this trollop yet. <i>“Ohhhh-Okay. Yeah. That’s a biiiig dick, but don’t worry about me.”</i> She pants. <i>“Just f-f-fuck my head. I won’t break. Promise.”</i> She shifts her ear slightly to provide you with a better angle for the downward-directed channel. <i>“Vulpatra are... b-b-born cum-dumps!”</i>");
	//Thinny
	else if(select == "thin") output("\n\n<i>“Huh.... that’s... easy.”</i> The newly submissive vixen almost imperceptibly shudders. <i>“...nice, slender size. G-goes right in.”</i> She tilts her head to the side, giving you a better angle to drive into the downward-angled channel. <i>“Just sh-shove it all in. I wouldn’t break if it was five times this big, and I wanna feel full.”</i> She pauses, gasping whorishly. <i>“Stuffed. Fucked and used.”</i> Droplets of clear saliva dangle from her tongue, splashing into her fuzzy tits. <i>“Fuck me raw!”</i>");
	//Explicitly human
	else if(select == "human") output("\n\n<i>“Mmmm... love that feeling,”</i> the freshly submissive vixen moans. <i>“Not too blunt, not too pointy. Just the most perfect, rounded crown gently spreading me open for proper claiming. Unf!”</i> A shiver wracks the fox-girl’s entire body, and the subdued slut tips her head to provide you with the best possible angle to use her. <i>“Get rough,”</i> she commands, gasping when another inch delivers a burst of eye-crossing pleasure. <i>“F-f-ucking plow my cunts wide open. W-w-won’t break my s-s-stupid slutty head no matter how p-p-perfect that dick is!”</i>");
	//Else
	else output("\n\n<i>“Oh... uh... wow.”</i> The freshly submissive vixen fails to conceal her shudder of delight. <i>“M-mistress never uses my ear anymore. She doesn’t need to. Doesn’t need help making me a submissive, slutty pet...”</i> She tips her head to offer you a better angle, and her eyes nearly roll back the entire way when you edge another inch in. <i>“Oooooh, just fuck me hard already!”</i> Her tongue lolls further. <i>“Fuck me like you wanna break me! Hump me like a rapacious beast! Drill my stupid, silly earslots sideways!”</i>");

	//merge
	output("\n\nIf that’s what she wants, you see no reason not to indulge her. Time is a factor, after all. You wind up your [pc.hips] and drive your [pc.cockNounComplex " + x + "] into the sex-addled bitch all at once. Warmth engulfs you. Tightness enfolds you in a clutching, desperate embrace. Every inch of plush, dick-addicted ear-cunt squeezes down at once to make you feel as if you’re fucking the tightest, hottest, most prick-thirsty girl in the universe. It’s raw and visceral in the best way. You’re instantly short of breath from the sudden onset of pleasure, instantly rock hard and ready to go." + (pc.inRut() ? " If you weren’t already in rut, you’d be in one now.":" It’s like sliding into a sexual, animalistic rut.") + " Every inch of your body is screaming for you to bang the fat-eared slut’s top-mounted pussies pregnant.");
	if(!enemy.hasStatusEffect("VR")) pc.cockChange();
	output("\n\nA single squeak is the only sound your captive cock-holster makes. Her eyes slide closed as the lights upstairs dim, one by one, short-circuited by a whole cock’s worth of penetration. Her tongue, already flapping, slides to the far side of her maw, now drooling thick webs of spit into her fur. It must feel pretty good, because one of her hands reaches up for a squeeze, mopping the syrupy saliva through her fur until it’s glossy and shining.");
	output("\n\nGrabbing her head with both hands feels like it might be a step too far" + (pc.isAss() ? ", but why should you care?":", but it feels too good to worry about that.") + " She’s asking for it. You want it. Besides, your hands already found their way to her head when you took that first thrust, and you’re already winding up for another. You slap your hips into too-fuckable shortstack’s head with an audible clap. Oscillating vibrations ripple through her tender flesh, surrounding you, cradling you, and giving you exactly the sort of feeling to motivate a second stroke... and a third... and a fourth.");
	output("\n\nYou rut the security slut’s head, pounding with abandon. She doesn’t mind from the sound of it, moaning stupidly when smack yourself home at force." + (pc.balls > 0 ? " The sweaty imprint of your [pc.sack] lingers on her cheek, a tempting target for you to strike on every downthrust.":"") + " Her lower jaw and tongue flap about, completely limp, passive. Spit flecks your [pc.thighs], but it just makes the whole act better, knowing that the target of your lusts has already been rendered insensate by pleasure. She gave herself over to you to be used without concern or mercy. She wanted this.");
	output("\n\nLooking down at the fox’s narrow face, it’s clear just how much <i>loves</i> being properly abused. She looks like she’s riding the galaxy’s longest orgasm, like the feeling of your [pc.cockNounSimple " + x + "] plumbing the depths of her cranial cunt carried her all the way to cloud nine. Whenever you cum will be fine with her, you’re sure. She’ll moan for it, beg you for another, and maybe that’s what you should give her. Maybe you should shoot a load deep into this greedy, clutching, alien hole and spin her around for a shot at the second. Maybe you’re so worked up that you won’t be satisfied without a creampie in both of these seductively swollen slits.");
	processTime(15);
	pc.changeLust(5400);
	clearMenu();
	addButton(0,"Cum",cumOnceForFoxyEars,x,"Cum","One cumshot is plenty.");
	addButton(1,"Cum+Finger",cumAndFingerFoxyEars,x,"Cum+Finger","A single cumshot is plenty, but a finger in the horny minx’s other ear might be a bit of fun...");
	addButton(2,"Cum Twice",cumTwiceForFoxEars,x,"Cum Twice","She’s got two holes. Why not try both?");
}

//Cum
public function cumOnceForFoxyEars(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fenoxo");

	output("As tempting as lingering or further indulging the cybernetically-altered vulpatra might be, there’s another moaning slut who needs your help: Kiro. Thinking of the tanuki writhing in pleasure, tortured by sluttifying machines shouldn’t be the spark that pushes you over the edge, but it is, and it does. Held captive by the mental image of the sexy pirate slut cumming, unleashing a deluge of her own, your middle clenches in sympathetic pleasure. Your [pc.cock " + x + "] throbs in obscene readiness, welcomed by the tight confines of vulpatra earcunt undulating in response.");
	allGasmFoxEarOutroStuff([x,1]);
}


//Cum 2x: ("Satisfied" status. Reduces lust gain over time)
public function cumTwiceForFoxEars(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fenoxo");
	output("Knowing that a single shot won’t leave you satisfied enough to avoid the rest of this place’s sexy pitfalls, you make the decision to stick around even before you blow your first load. Maybe she’ll feel even better with a thick layer of [pc.cumNoun] girding your length. It would be enough to lend her second ear a creampied air on the first thrust if nothing else, frothing and bubbling around your hard-thrusting girth. You throb in obscene readiness at the thought, welcomed by the tight confines of vulpatra earcunt undulating in response.");
	allGasmFoxEarOutroStuff([x,2]);
}

//Cum+Finger: (Pro move. Prevents taint!)
public function cumAndFingerFoxyEars(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fenoxo");
	output("You hold yourself back from an inadvisable double-dip into a mad scientist’s plaything, but only barely. Still, you’re unwilling to leave her other hole completely unsatisfied, even as your [pc.cocks] throb" + (!pc.hasCocks() ? "s":"") + " with mighty need, welcomed by tight confines of vulpatra earcunt. You thrust your thumb into her other ear without another thought and without warning. It’s easier than plugging in a new holoprojector, slicker than rahn’s skin, and produces a squeal more delightful than the most debauched of ultraporn. She tightens like a cock-milking, quivering vice.");
	allGasmFoxEarOutroStuff([x,1.5]);
}

//Merge
public function allGasmFoxEarOutroStuff(args:Array):void
{
	var x:int = args[0];
	var fucks:Number = args[1];

	output("\n\nThere’s no way you could hold back. Pleasure boils out of you, tight and molten. It’s a cupping, comforting squeeze around your length that makes you clench in response, pushing back with forceful thickening and a final, [pc.cumNoun]-spilling twitch.");
	var cums:Number = pc.cumQ();
	if(cums < 100) output(" You don’t take long to sow your sperm deep inside the foxy prick-holster. Her anatomy coaxes it out of you with firm, milking strokes, like she was designed to empty sexual predators at speed. In your case, it leaves you feeling drained and satisfied in record time.");
	else if(cums < 4000) output(" Depositing the entirety of your [pc.cumVisc] load into the fox feels like it should take a while, but miraculously, she milks it out of you at speed. Her anatomy miraculously coaxes you to fire faster, to pump out sperm-infused loads far quicker than you’d naturally be capable of. It’s like her body is designed to drain virile predators at speed, to leave them satisfied and sleepy in record time.");
	else if(cums < 10000) output(" Flooding the fox’s insides with sperm should take a while. Your climaxes can be so long, so ecstatic, but this petite fluffball somehow has you spurting in record time. Her clenching fucktunnel milks you with deliberate strokes, somehow convincing your anatomy to spurt faster and harder than is natural. She empties you in record time, a visible bulge revealing itself on her belly by the time you finish.");
	else output(" Your titanic deluge should be a slow, moderated thing. This time, it isn’t. Spurts spray out of you rapid fire as the fox’s insides coax you to climax with far greater speed than normal. There’s something about her anatomy, some way that it tricks your [pc.cocks] into overdrive, demanding " + (!pc.hasCocks() ? "it milk itself":"they milk themselves") + " as fast as your urethra" + (pc.hasCocks() ? "s":"") + " will allow. In short order, the vulpatra’s tummy has bulged to full and pregnant proportions, but her tiny body could never contain your entire climax, not with the way you cum.\n\nFortunately, the cock-brained turboslut’s mouth provides an easy ‘out’ valve for your excess semen. Her flapping tongue soon drools a torrent [pc.cumVisc] [pc.cumColor] onto her tits. She paints the twin spheres in record time, leaving the rest to cascade across her taut, pregnant dome and puddle beneath her submissively folded legs. You note that her tail is completely flat, lying deep in the cum and sopping it up like a sponge - just the rest of her, you suppose.\n\nBy the time you finish, she’s a cummy wreck, her small prick spraying thin ropes of alien cream to frost your far more virile lake.");
	processTime(10);
	if(!enemy.hasStatusEffect("VR")) enemy.loadInCunt(pc,0);
	pc.orgasm();
	//Single Cummies - cockgrow taint!
	if(fucks == 1) 
	{
		output("\n\nAs wonderful as you feel right now, you’ve got other places to be. You start to push the vulpatra away, but something inside her, something very deep, clamps down around your sensitized tip, holding you in place. <i>“Wha?”</i> you mouth in surprise, staring down at a surprisingly alert alien... and her smug, knowing smile.");
		output("\n\nThe fox-girl says, <i>“You can’t fuck and run without your present, silly!”</i> Something pinches your penis. It’s barely perceptible, but it happens. <i>“Oh. That’s what that feels like.”</i>");
		output("\n\nWhat what feels like? You’re about to ask when your [pc.cockNounSimple " + x + "] becomes very warm. Very warm indeed. It’s hotter than the insides of her earcunt, more tender than if you’d cum ten times. The texture of that alien tube feels pressed tighter than even before, shrink-wrapped to your every vein. You’re so surprised by the increase in sensation that you almost miss the internal device letting you go. Almost. You draw back at top speed, alarmed when more cock slides out of the alien’s head than you ever thrusted in. A full extra inch dangles over the plump, cum-ringed earhole, swelling to gain a second");
		var cockGrow:Number = 2+rand(2);
		if(pc.hasPerk("Hung")) cockGrow++;
		if(pc.hasPerk("Mini") && cockGrow > 2) cockGrow--;
		if(cockGrow >= 3) output("... and third");
		if(cockGrow >= 4) output("... and fourth");
		output(" before your eyes. A final measurement confirms <b>" + num2Text(cockGrow) + " inches of new length!</b>");
		output("\n\n<i>“Mistress Po thinks of everything! She’ll fuck me so hard when I tell her I remembered to activate one of her surprises!”</i> She flops onto her back, hugging her tail against her chest in pure joy. <i>“I found you, and I fucked you, and I made your cock even better so you can fuck me harder next time! Yay!”</i>");
		//Lo taint:
		if(pc.taint() < 33) output("\n\nWell, at least you managed to blow off some steam, even if it left you tainted by whatever dick-enlarging drug she just used on you.");
		//Med taint
		else if(pc.taint() < 66) output("\n\nYou’d be madder if that bigger dick didn’t also mean even more pleasure, and probably bigger, more mind-blowing orgasms. Maybe you should’ve avoided this little tryst, but it didn’t slow you down too much...");
		//High taint
		else output("\n\nNext time you’ll have to fuck her even harder. Maybe at some point you’ll get big enough that she’ll regret it. Then again, sluts like her are bound to be happy with any kind of dick, no matter how monstrously bloated by mad science.");
		//Grow dick as appropriate, boost cummies if needed. Boost ballsize if needed.
		if(!enemy.hasStatusEffect("VR")) 
		{
			pc.cocks[x].cLengthRaw += cockGrow;
			pc.boostCum(1);
			if(pc.taint() < 33) pc.taint(3);
			else if(pc.taint() < 66) pc.taint(2);
			else pc.taint(1);
			if(pc.ballSizeRaw < pc.cocks[x].cLengthRaw) pc.ballSizeRaw++;
		}
		else pc.taint(1);
		processTime(10);
		IncrementFlag("KQ_VULPATRA_TAINTS");
	}
	//Fingercunts safe
	else if(fucks == 1.5)
	{
		output("\n\nYou remove your finger. It’s as clean as it ever was, amazingly, but while you’re busy admiring your inquisitive digit, the fox-girl sloughs off of your " + (pc.hasKnot(x) ? "[pc.knot " + x + "] with a surprisingly rapid ‘pop’":"cum-slicked tool with ease") + ". She flops onto her side, quivering and gasping - still cumming too! She arches her back, grabs her tits, and shakes spasmodically for a moment as her voice rises in a keening wail. A moment later, she collapses like a puppet with the strings cut, limply blinking toward something resembling awareness.");
		output("\n\n<i>“Shee?”</i> the vulpatra drunkenly burbles" + (cums >= 10000 ? ", pausing to swallow a bit of cum":"") + ". <i>“Ima real ghud cockshocket.”</i> She giggles, reaching down to rub her trembling length and moaning once more. <i>“Jusht gotta... cum summore. Thanksh!”</i>");
		processTime(3);
	}
	//Dubblecummies - cockgrow taint 2x!
	else 
	{
		output("\n\nYou can’t help but announce, <i>“Fuck yeah. You ready for round two?”</i>");
		output("\n\nThe vulpatra, surprisingly alert all of a sudden, nods enthusiastically, unintentionally assaulting you with a vortex of twisted pleasure that forces you to yank your hips back. Your [pc.cock " + x + "] emerges " + (!pc.hasKnot(x) ? "with a smooth, cum-smeared stroke":"with a jerky, audible knot-pop") + ". <i>“Now you’re learning!”</i> She bounces her ass off her heels and pushes off the floor to spin about and present her other side" + (cums >= 10000 ? ", dragging a bit of ass through the puddle cum to give you a tempting view of the other side":"") + ". <i>“Take me, " + pc.mf("stud","slut") + ". Now you know " + (silly ? "I can do this all day":"I can take it") + ", so go really hard this time.”</i>");
		processTime(3);
		clearMenu();
		addButton(0,"Next",doubleEarCuntfukkin,x);
		return;
	}
	output("\n\n");
	CombatManager.genericVictory();
}

public function doubleEarCuntfukkin(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fenoxo");
	output("You need no further encouragement. Lining your slickened pole up with short, stacked fuckslut’s hole, you press in, and she welcomes you. Her body caresses you with its inhuman warmth, beckons you to jump right to fast fucking, even though you just got off. Just like before, as soon as you slide in, the vulpatra switches into full, submissive, acceptance. Her eyelids droop while her other ear folds back, effectively sealing your load inside. She whimpers, and the entirety of her sordid cranial slit puffs up thicker, cushier, and more begging for a thorough banging.");
	output("\n\n<i>“Mmmyeah,”</i> the quivering foxy cumdump moans, <i>“Fuck me cross-eyed!”</i>");
	output("\n\nSuch a statement might mean more if she wasn’t already looking a little dopey and on the verge of blissing out, but you take the encouragement for what it is and start yourself off with a slow and steady drilling. You just got off, so there’s no point in trying to rush to an immediate climax, not when it’d be best to let your body build itself back up to the edge in time. Rhythmic, steady fucking is sufficient to satisfy your amped-up libido’s needs, for now, and you wallow in the pleasure it provides.");
	output("\n\n‘Slap.’ ‘Slap.’ ‘Slap.’");
	output("\n\nThe sounds of pleasure-seeking indiscretion ring through the vessel’s halls. Thankfully, nothing arrives to interrupt your fun. You’re free to satisfy yourself on the drooling, foxy futanari with zero concern for anything but your own pleasure, secure in the knowledge that no matter how roughly you hump she’ll enjoy herself. There is something to be said for a girl who’ll dare to satisfy your most debased, roughest, least empathetic desires without a single complaint.");
	output("\n\nYou fuck the vacant-eyed cock-socket with a smile and slow-building bliss. Sometimes, she’s so tight that it even seems like there’s a bit of a pinch around your [pc.cockHead " + x + "]");
	if(flags["KQ_VULPATRA_TAINTS"] != undefined) output(", a pinch you recognize all too well. You knew what you chose to do.");
	else output(", but the feeling fades so quickly that it can’t possibly be anything serious.");
	output(" And she’s so warm! Warmer by the second, making you feel like your [pc.cockNounSimple " + x + "] is melting in the torrid furnace of foxy lust, yet she’s so tight, so raw and pleasant than you’d never doubt your incredible, surging, swelling firmness.");
	output("\n\n");
	if(flags["KQ_VULPATRA_TAINTS"] == undefined) output("Swelling? That doesn’t seem right.");
	else output("Swelling! Yes! You can feel yourself growing now.");

	output("\n\nYou’re thrusting faster now, closer to the edge, but the strokes seem to take the same amount of time. Looking down, you watch a cock that seems decently thicker than normal pistoning through the puffy alien gates, each stroke allowing a little more to be exposed, revealing more and more dick. ");
	if(flags["KQ_VULPATRA_TAINTS"] == undefined) output("You’re definitely growing somehow. She’s done something to make your dick balloon and expand, but you’re too horny to mind now. It feels too good. You have to keep going, have to keep fucking until you feed her an even bigger load than last time.");
	else output(" You relish the sight of your growing manhood, knowing you’ve voluntarily chosen to let it balloon as much as possible from this tryst. You’re choosing reckless, cock-bloating bliss over a quicker, more pragmatic bang, and that just makes you hotter, closer to cumming.");
	output("\n\nUnleashing " + pc.mf("a mighty roar","a scream of sublime joy") + ", you cum to the feeling of your [pc.cockHead " + x + "] distending, stretching the tight passage out as the rest of your pridefully swelling prick finishes its growth.");
	if(pc.cumQ() < 100) output(" Seed spills out in thick gouts, but this time, it’s slower. Her quiverings can’t control your dick, not when it’s this full of growth drugs, not when it’s still expanding, slowly ballooning even as it flings your final few ropes into the disposable slut’s tempting headcunts.");
	else if(pc.cumQ() < 4000) output(" Seed fires out in bubbling gouts of drug-fattened virility. Your shots are slower, rendered immune to the disposable slut’s succubus-like orgasmic control by slowly ebbing sensation of gradual expansion. Lingering inside her until you’ve shot every drop seems risky, but you can’t come up with a reason not to. She’s already made your dick bigger. What’s she going to do, make it bigger again?" + (pc.taint() >= 66 ? " Hot.":""));
	else output("Seed erupts out of you in a drug-augmented torrent. It’s thick enough and powerful enough to make the furry slut’s pre-inflated tummy wobble, and the second shot from your slowly enlarging rod is sufficient to make her whimper open wide, spilling the excess [pc.cumColor] jizz down her chin in a fragrant waterfall. Her nostrils flare despite her eyes being rolled back. Somehow, you can tell she’s loving every second it, loving feeling rivers of semen flowing in one end and waterfalling out the other. Her hands smear it around while she cums.\n\nMaybe it’d be smarter to pull out right away, but you let yourself stay inside until every drop has been spent. You’ve already been forced to get bigger, thicker, and more sensitive. What’s she going to do now, make you even more hung? You stroke your chin and smile, watching her writhe and drip.");
	output("\n\nThe vulpine fuck-toy slides off your dick so effortlessly that it’s easy to forget the duplicitous trick she pulled on you... but she looks so good sprawled on the floor, leaking cum from both ears and panting for breath. That’s how a slut <i>should</i> look, your brain tells you.");
	if(pc.taint() < 33) 
	{
		output(" A second later, it occurs to you that you came here to put a stop to the perverted scientist’s mad work, not help her creampie her collection of sluts.");
		if(!enemy.hasStatusEffect("VR")) pc.taint(6);
		else pc.taint(1);
	}
	else if(pc.taint() < 66) 
	{
		output(" Thinking like that feels a little hypocritical, yet you don’t bother to indulge the concern any further. Now that your ");
		if(pc.balls > 1) output("balls are empty");
		else if(pc.balls == 1) output("ball is empty");
		else output("needs are met");
		output(", there’s more important concerns at hand.");
		if(!enemy.hasStatusEffect("VR")) pc.taint(4);
		else pc.taint(1);
	}
	else 
	{
		output(" Maybe once you rescue Kiro, you can fuck her just as thoroughly. Yeah.");
		if(!enemy.hasStatusEffect("VR")) pc.taint(3);
		else pc.taint(1);
	}
	if(!enemy.hasStatusEffect("VR")) 
	{
		var cockGrow:Number = 3+rand(3);
		if(pc.hasPerk("Hung")) cockGrow += 2;
		if(pc.hasPerk("Mini") && cockGrow > 2) 
		{
			cockGrow-=2;
			if(cockGrow < 2) cockGrow = 2;
		}
		output("\n\nYou leave the encounter with <b>an extra " + num2Text(cockGrow) + " inches " + (pc.legCount > 1 ? "swinging between your [pc.legs]":"hanging below the belt") + "</b>.");
	}

	processTime(45);
	IncrementFlag("KQ_VULPATRA_TAINTS");
	if(!enemy.hasStatusEffect("VR")) enemy.loadInCunt(pc,0);
	pc.orgasm();
	if(!enemy.hasStatusEffect("VR")) 
	{
		if(pc.ballSizeRaw < pc.cocks[x].cLengthRaw) 
		{
			pc.ballSizeRaw++;
			pc.ballSizeRaw++;
		}
		pc.cocks[x].cLengthRaw += cockGrow;
		pc.boostCum(5);
	}
	output("\n\n");
	CombatManager.genericVictory();
}

//[Fr0styDun] Victory Scene (Normalish Cock (PC) in a (enemy) Hole), max payout 2500 words.
public function normalCockInSexdollHole(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("Fr0sty");
	output("You stare at the subdued sexdoll, contemplating your options.");
	output("\n\nHad things turned out differently, you’ve no doubt in your mind you’d be impaled by that [enemy.cockNounSimple] of hers without even a moment’s pause for mercy. An image of that thought flashes in your mind, the idea " + (pc.lust() >= 66 ? "making your quiver, pondering the depraved implication":"making you wince, not willing to indulge the notion") + " of such a fate. Looking down at the " + (!pc.isAss() ? "poor":"pathetic") + " thing before you, you decide not to show any ‘mercy’ yourself, although you’re not sure she may see it that way." + (pc.taint() >= 66 ? " Your [pc.cockNounSimple " + x + "] twitches, eager to show the manical fuckdoll the cost of fucking with you.":""));
	output("\n\nPanting, the defeated slut bucks her hips in the air, still pleading to be played with. <i>“One quickie. Ju-Just one quick fuckie. I’ll make you cum so hard you’ll forget allll about what’s her namie.”</i>");
	if(pc.taint() >= 66 || pc.isAss()) output("\n\nGrinning");
	else output("\n\nFrowning");
	output(" down at her, you " + (!pc.isCrotchExposed() ? "pull aside your [pc.crotchCover]":"shift your hips meaningfully") + ", letting the sex crazed slut know what’s about to happen.");
	output("\n\nGiggling, [enemy.name] starts to rise up off the ground, stroking her [enemy.cockNounSimple] with one hand, a single finger on the other being sucked between her [enemy.lips]. <i>“Oooo, yes. Let me make you feel goood.”</i>");
	output("\n\nYou push her back to the ground, eliciting a small yelp from the depraved slut, and causing her to make the first expression you’ve seen that wasn’t laced with lusty hunger. Dropping down, you pin the lust mad woman to the ground, the heat of her [enemy.skinFurScales] making your cock twitch. She writhes below you, her [enemy.chest] pressing against your own as she struggles against you.");
	output("\n\nNo, not struggles, she isn’t built like that. Staring into her hollow eyes, you can tell the woman knows exactly what’s coming, and simply can’t contain her excitement.");
	output("\n\nReaching down between her legs, your seize her [enemy.balls], causing the sex-crazed doll to let out a flighty giggle. Lift them out of the way, your hand brushes against your real target. The heat of her twat against your fingers is frightening, and you feel your [pc.cockNounSimple " + x + "] ache, eager to plunge into that molten gash.");
	output("\n\nAs you position yourself properly, trying to keep a hold on the dangerous woman, [enemy.name] cackles. <i>“Yes. Yeesss. Fuck me. </i>USE<i> me.”</i>");
	output("\n\nIgnoring her, you press your crown against her cock hungry cunt, pausing for a moment to consider your actions.");
	if(pc.lust() >= 66) output(" You can’t resist the chance to take this toy for a spin, the mere idea of fucking her making your hungry cock throb.");
	else if(pc.taint() >= 66) output(" This slut needs to be taught a lesson, and you think you’ve just the right tool for the job.");
	else output(" Despite yourself, and Kiro, you push aside your reservations, standing firm with your choice.");

	output("\n\nYou move your hips forward, spearing your [pc.cockHead " + x + "] into the squirming whore.");

	output("\n\nA sharp breath escapes your lips, the heat of her cunt far exceeding what you felt on your hand moments before. Her hole is far from tight, ");
	if(pc.cocks[x].cLength() <= 5) output("which for your modest meat it perhaps shouldn’t be a shock.");
	else if(pc.cocks[x].cLength() <= 12) output("but considering how much she’s surely fucked on the daily makes sense.");
	else if(pc.cocks[x].cLength() <= 20) output("which for your massive meat is quite surprising, but not unwelcome.");
	output(" As you slide forward, you feel as if you’re being sucked in, her fuck hole seemingly eager to take every inch of your meat inside of its burning depths.");
	if(!enemy.hasStatusEffect("VR")) pc.cockChange();

	if(pc.cocks[x].cLength() < 7) output("\n\nJust as you hilt yourself,");
	else output("\n\nAs you are still being sucked in,");
	output(" [enemy.name] starting to buck her hips, letting out a depraved giggle, [enemy.legs] wrapping around your waist. <i>“Hnn, yes. That’s it, lemme treat you right. Lemme help that pretty dickie of yours cum.”</i>");
	output("\n\nYou let out a throaty gasp, the passion of sexdoll catching you off guard. Despite being prone, and her legs tight around your, she works her [enemy.hips] with ravenous enthusiasm, forcing your cock deep inside of her burning cunt with each powerful upward thrust. Throbbing, you feel your sensitive meat melting inside of her, the heat of her dick-eating hole impossibly hot, and surely a perk of her well crafted sex. A shiver runs up your spine, forcing your back to arch, another lusty gasp escaping your lips.");
	output("\n\nBelow, you hear the sexdoll giggling, seemingly enjoying watching your squirm. <i>“You like? We can do this forever. Forever and ever...”</i>");
	output("\n\nGasping, you think maybe, just maybe, you could do this forever...");
	output("\n\nWith a primal growl, you push the thought aside, fighting to regain control.");
	output("\n\nHolding her down, you try to stifle the lusty women’s movements, while at the same time starting an attack of your own. Working your [pc.hips], and fighting against her strong [enemy.legs], you slam yourself into her voracious hole under your own power, hammering the sinful woman with all the fervor you can muster.");
	output("\n\n<i>“Ahh, oooh!”</i> she exclaims, letting out a gasp of surprise. The hungry whore moans as you fuck her, seemingly enjoying the rough cocking, her legs loosening up, but still remaining hooked over your hips. Her eyes shift out of focus, a dopey smirk on her [enemy.lips].");
	output("\n\nYou’ve got control. For now.");
	output("\n\nStraining, you feel your lungs burn, each breath you let out a torrent of heat. Her cunt tightens around your [pc.cockNounSimple " + x + "], fighting against the girth of your pulsating meat. Surely a result of the slutty toy’s enjoyment, but you can’t take any solace in that. Doubling down, you work harder, fighting against the now tight cunt of the very well put together fuck doll. Sweat pools on the nape of your neck, and you feel a drop fall from your forehead down onto the crazed toy below you. Looking down at her, you don’t think you’re quite as ahead as you’d like to be.");
	output("\n\nMade for this, [enemy.name] hasn’t even broken a sweat yet, the toy just moaning like a well practiced whore. While you can tell she’s at least <i>feeling</i> the effects of your rough loving, you’re not sure she’s anywhere near as close to climaxing as yourself. This could even be a ruse. As another bead of sweat falls onto her jiggling chest, you feel your [pc.cockNounSimple " + x + "] start to ache, begging for release already, the effort it takes to keep the dangerous toy in check not really what you’d use for a marathon fuck. Her [enemy.chest] bounces rhythmically with every thrust you drive into her, a mesmerizing display that makes your head swirl. Her nipples are stiff, delicious looking. The idea of leaning forward and suckling them flashes your mind. Surely that wouldn’t be so bad, would it? You feel your lips pucker, eager for a taste.");
	output("\n\nA pulse from your cock makes you rethink the idea, remembering what you’re dealing with, and what that might do.");
	output("\n\nWincing, you lower your gaze in an attempt to break her depraved spell, if it’s even one at all, and instead notice something else moving around. Her [enemy.cockNounSimple], bobbing up and down like her tits from the movement, sits there on display, a trace amount of precum leaking from her [enemy.cockHead] and down her length. Your mind swirling, barely holding on to sanity as you drift deeper into the sea of ecstasy, still understand it’s perhaps your only chance to close the gap.");
	output("\n\nReaching out, you grasp the sexdoll’s [enemy.cockNounSimple].");
	output("\n\n<i>“Wha?!”</i> [enemy.name] jerks her attention downward, eyes wide and aimed toward her tightly gripped cock. <i>“Wh-Why? Playing with that won’t make you feel good at all- why would yo-OH!”</i>");
	output("\n\nYou cut the talkative slut off, pumping your wrist with as much gusto as you can muster, jerking her into quick submission. Her cock twitches in your hand, sticky precum leaking out of her [enemy.cockHead] and onto your viced fingers. The sex hungry whore’s moans change, your ears catching them as somehow more desperate than before. If she was faking it before, she certainly isn’t now.");
	output("\n\nYou feel your " + (pc.balls > 0 ? "[pc.balls] pulsate":"crotch tense") + ", but fight back the urge to let go. Straining, you let out a grunt with each thrust of your [pc.hips], trying to keep yourself together as you cock the hungry slut into submission. Your manhood aches, every vein in your burning meat threatening to give as you keep hammering it into [enemy.name]’s somehow even hotter puss. If that wasn’t enough, you feel her tunnel tighten up once more, her once loose cunt a memory now as it turns into a vice against your throbbing cockflesh. You can barely manage to keep up your pace now, fighting against [enemy.name]’s tightness taking more energy than you think you can fairly give. A throaty moan escapes your [pc.lipsChaste], every muscle in your body straining to keep going, urging you to give in and cum. Down below you feel your over stimulated sex on the verge of explosion, your [pc.cockNounSimple " + x + "] threatening to pop at any second.");
	output("\n\n[enemy.Name]’s cries become shrill, the precum oozing down her shaft suddenly flowing far faster. Around your waist you feel her clench her legs, not in a way to trap you, but merely her muscles starting to tighten on their own. Her [enemy.balls] twitch against your [pc.cockNounSimple " + x + "] with each cunt-breaking thrust you make into her burning twat, signaling the lascivious woman is just as close as you are.");
	output("\n\nHead swirling, you try to focus in on her face" + (pc.taint() >= 66 ? ", hoping that the bitch is enjoying your favorite brand of lusty agony just as much as you are.":".") + " Her eyes are rolled back, cock hungry mouth agape, her breathing almost as heavy as your own now. Around your [pc.cockNounSimple " + x + "] you feel her womanhood shuddering, with her nearby sack tightening up as well. Lost to ecstasy, the sexdoll lets out a deep guttural moan, her [enemy.tongue] falling free from her mouth as both her sexes swell and explode.");
	output("\n\nBarely thinking, you aim her throbbing meat towards her face, just in time as the first rope of steaming [enemy.cumColor] spurts from her [enemy.cockHead]. The thick, sticky [enemy.cumColor] spunk hits the writhing woman right on her cheek, the next shot landing an inch to the side, painting her [enemy.lips] with a facial on her own making. Around your constricted meat you feel her cunt shiver, her female sex organ gushing wet warmth uncontrollably, her girl cum being squirted out of her with every thrust of your burning shaft. The smells of both her cock’s and her cunt’s juices fills the air, and intoxicating aroma that shreds away your will to hold back.");
	output("\n\nLetting out a ragged gasp, you let go, savoring the moment.");
	output("\n\nYour [pc.balls] churn" + (pc.balls <= 1 ? "s":"") + ", pumping out a thick and well deserved load up through the length of your aching [pc.cockNounSimple " + x + "]. The moment you feel it breach the tip of your [pc.cockHead " + x + "] your muscles seize, a groan escaping from your [pc.lipsChaste] and your whole body tenses. The heat leaving your lungs steams the air in front of you, your eyes blurring as you feel your thick seed explode out into the tight confines of the sexdoll’s defeated cunt. Pulse after pulse of thickness pass through you and into her, each pump of it making your spine tighten and arch further, your gaze forced up to the ceiling. As the last of it passes, you feel a wave of exhaustion hit you, your muscles loosening and starting to give out on you.");
	output("\n\nDespite your efforts, you fall forward, collapsing on the shoulder of your spend toy. You feel your spend manhood slip from the sexdoll’s oozing cunt, your semi-hard mass of cockflesh still ablaze with heat. Oddly, that warmth doesn’t seem to cool down, instead sinking in and spreading throughout your exhausted body. A lusty shiver runs up your spine. Suddenly, you don’t feel quite like yourself.");
	output("\n\nGasping, trying to collect your breath, you glance at her, your sense flooding back as the lusty haze in your mind starts to lift. You remember clearly how dangerous she is, and what she will attempt to do to you if you can’t compose yourself quickly.");
	output("\n\nLooking at her now, you think, perhaps, you may have earned yourself a short reprieve.");
	output("\n\n[enemy.Name]’s eyes are not on you, if she even knows you’re there, instead fixed up at the ceiling. Wide and glazed, she seems shell-shocked, like a stalled machine or a frozen computer. Given what she is, that may not be far off from what’s happened. Her breathing is heavy still, her [enemy.chest] heaving up and down against you, and despite her prior habit of not shutting up, she remains inertly silent. Even her [enemy.cockNounSimple], which is sandwhiched between your two bodies, feels oddly soft, the seemingly insatiable sex organ rather harmless at the moment.");
	output("\n\nShe seems so harmless, you can almost overlook the fact she’s a sex crazed fuck toy bent on " + (pc.hasVagina() ? "riding":"sodomizing") + " you until you’re as fucked up as she is... Almost.");
	output("\n\nAfter a few heartbeats, she blinks. Slowly her tongue pulls back out of her mouth, licking at a thick glob of the purple-tinted seed on her lip, letting out a low purr as she tastes it. Against your belly, you feel her cock twitch and stiffen, the sexdoll’s refractory period seemingly already nearing its end.");
	output("\n\nTaking a deep breath, you pull yourself up off of the now stirring woman, stretching out your taut muscles and quickly replacing your [pc.crotchCover]. As you prepare to leave, you notice her stirring on the ground once more, her sense almost returned, her cock rising back to full mast.");
	output("\n\n" + (pc.taint() >= 66 ? "Despite the thrilling idea of a second round with the fuck doll, you opt to get away while you can, if only for Kiro’s sake if nothing else.":"Having already wasted too much time with the depraved toy, you start to head out, needing to resume your search for Kiro in this den of madness."));
	output("\n\nAs you turn to leave, you hear her call out. <i>“That’s all? Oh, I can make you feel soooo much better, baby. Come baaaack.”</i> You hear her struggle to rise to her feet, heels clattering on the floor as she tries to get her footing. A moment later you hear the sound of her collapsing, likely exactly where she lay before. <i>“Oof! No! Come back, lover! Don’t leave me alllll alone! Let me FUCK YOU!”</i> You hear wet sounds, likely the result of her slipping around in your mutual juices.");
	output("\n\nIgnoring her, you draw your [pc.weapon], on the lookout for more threats.");
	processTime(45);
	pc.orgasm();
	if(!enemy.hasStatusEffect("VR")) enemy.loadInCunt(pc,0);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Williamed-WIP] Victory Scene, (PC Vagina rides Enemy face or dick or both) max payout 2500 words.
//[Ride Her]
// Tooltip1: The purpose of this fucktoy is in her name.
// Tooltip2: For this lascivious event... <b>you require your own vagina.</b> Who knows, Maybe Po has one lying around you can slap on?
// Requires vagina. 
// Tainting aspects include: Vag Wetness Increase, Clit Size Growth, Pumping Up
// Don't forget vaginaRouter~
// by William
public function pcRidesASexdollFacebyWill(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("William");

	output("Kiro’s plight tugs at your heart, but the ");
	if(enemy.HP() <= 1) output("sulky expression of your sultry opponent");
	else output("fuck-doll’s glistening cock");
	output(" tugs at your base desires. When you think about <i>how hard</i> she is, ready to make you scream your pleasure at a ship-shaking volume, a little moisture trickles from your [pc.vaginas], heightening into " + (!pc.hasVaginas() ? "a ":""));
	if(pc.wettestVaginalWetness() < 2) output("thin stream");
	else if(pc.wettestVaginalWetness() < 4) output("steady flow");
	else output("thigh-soaking downpour");
	if(pc.hasVaginas()) output("s");
	output(" at her moan. You jump slightly when you see her body twitch, allowing her sturdy, rigid member to rise a little higher and fill your eyes and nose with phallic glory.");
	output("\n\n...Kiro can wait a little longer.");
	output("\n\nAll you need is ten minutes - and hey, you can’t exactly keep yourself safe if Po’s walking sex-toys are this arousing. ");
	if(pc.isBimbo()) output("If you could spend all day slobbering on that knob, painting those lovely nuts until you passed out, you would. Your eyes are completely fixed on that dick. Doctor Po probably made sure her girls never ran out of cum either. You’re drooling now. Better amend your earlier statement: Kiro can <i>definitely</i> wait <b>twenty</b> minutes!");
	else if(pc.libido() < 33) 
	{
		output("The powerful view of the ");
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("bunny’s equine meat");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fox-puppet’s modest prick");
		else output("herm’s cock");
		output(" throbbing and leaking, the sight of her pulsing balls... it’s overwhelmingly erotic. You can’t look away, and you don’t want to. Right... just ten minutes. Kiro will understand, should you decide to tell her.");
	}
	else if(pc.libido() < 66) output("It’d be cruel to leave anyone blue-balled, no matter how insidious their intentions. Besides, part of you really wants to try out that dick. She has it for a reason. It looks <i>that good</i> for a reason.");
	else output("Taking this bimbo for a ride is gonna happen, but part of you wishes you could ‘appropriate’ Po’s goods, shack this artisanally crafted marionette up in your closet for those long flights. Fuck, and she’s not the only one! Better make this as rough a ride as possible, or you’ll end up sampling every lady-phallus swinging in these corridors before you know it!");

	output("\n\nYeah. It’s " + (pc.isBimbo() ? "great":"probably okay") + " that " + (!pc.isCrotchExposed() ? "you’re stripping out of your gear and ":"") + "flashing your dewy twat" + (pc.hasVaginas() ? "s":"") + " to the mindless minx and slipping a finger past " + (!pc.hasVaginas() ? "the":"one’s") + " soft folds until the pleasure blurs your vision" + (pc.isBimbo() ? "!":".") + " You’re in control of this situation, you remind yourself" + (pc.hasCock() ? " while stroking your [pc.cocksLight]":"") + ". You’ll get a nice big cum and go back to saving the day. What more could a young and adventurous " + pc.mf("heir","heiress") + " want in the bowels of an evil scientist’s whore factory?");
	output("\n\n<i>“");
	if(pc.isHerm()) output("Ooh!”</i> comes the harlot’s lusty voice. <i>“You’re just like me! When Mistress explained to me how amazing it feels when a <b>wet pussy</b> and <b>hard cock</b> cum together, I knew I belonged to her! Do I get to taste that? Maybe your penis? No wait, your " + (!pc.hasVaginas() ? "pussy":"pussies") + "! I promise I’ll make it feel sooo good. I’ll shove my face right in, and you’ll squirt in seconds. It’ll blow your mind!");
	else output((!pc.hasVaginas() ? "That looks":"Those look") + " yummy!”</i> the skank declares. <i>“Am I gonna get to lick that? Mistress made sure I was great at making pussies feel good with all my parts! Pleasepleaseplease? I’ll shove my face right in and you’ll squirt with every swish and swash of my super good tongue!");
	output("”</i>");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output(" The fluffy shortstack wiggles her cotton-tipped antenna, attempting to sway you on a level deeper than language. It makes you <i>want</i> to give in.");
	// pc Wetness <=3 (not wet enough, get the licc; Vulpatra doll won’t use this)
	if(pc.vaginas[x].wetness() <= 3 && !enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		output("\n\n" + (pc.isBimbo() ? "Much as you hate to admit it, she’s on to something. You want that cock pretty bad, but your middling juices won’t be enough to handle that monster. You’re gonna need all the lube you can get to tame her beast!":"Her words are a poignant reminder of your situation. A brief inspection of your [pc.vaginaColor " + x + "] muff tells you that you don’t have enough natural wetness to handle her cock - some tongue and spit will resolve that."));
		output("\n\n");
		if(pc.isBimbo()) output("<i>“Sure!”</i> you beam. <i>“Dig right in, sugar!”</i>");
		else if(pc.isBro()) 
		{
			output("Reaching down, you grip the woman by her ");
			if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("floppy ears");
			else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fat ears");
			else if(!enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("horns");
			else output("hair");
			output(" and bring her nose to your [pc.clit]. <i>“Get to it,”</i> you grunt.");
		}
		else if(pc.isNice()) output("<i>“In you go,”</i> you simper, patting your groin.");
		else if(pc.isMischievous()) output("<i>“It’s your lucky day. I’m about to spend time with you that I planned to spend with your boss. Better make it worth it,”</i> you grin.");
		else output("Grabbing the bitch by her hair, you yank her up into your crotch, embedding a singular command onto her pliable brain, <i>“Start.”</i>");
		
		output("\n\nWith a cock of the hip you embed the wanna-be dominatrix " + (!enemy.hasMuzzle() ? "nose":"snout") + "-deep in your honeypot, festooning her in [pc.girlCumVisc], [pc.girlCumFlavor] torrents." + ((pc.balls > 0 && pc.ballDiameter() >= 2) ? " Her head is almost completely obscured under the hefty weight of your nutsack.":"") + " A smooth and lengthy tongue emerges to conquer the slopes of your cunny in hypnotic swirls. The herm-slut slobbers, rocking her entire body in a faux-corkscrew that nearly lays you out on your ass. Your breaths come out as rapid pants. Gasps come next when your [pc.clit] is smooched, pulled past luscious DSLs that know all the ways around phallic shapes. <i>“Mmmyusss,”</i> comes a gurgly voice. <i>“Why were we even fighting? Just wait ‘til you get on my cock. It’ll make your pussy much wetter, and according to Mistress’s rule 34, wetter is always better!”</i>");
		output("\n\nStimulations come from elsewhere. The eager ");
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra");
		else output("woman");
		output(" strokes your [pc.thigh], nuzzles into your pelvic mound");
		if(pc.hasCock()) output(", and lays the hardest, loveliest kisses on your [pc.cockNoun]");
		else output(", and plants a soul-staining kiss on your sopping-wet slit");
		output(". She looks you dead in the eyes as she works with talent that cannot be natural. <i>“Gonna cum for me?”</i> You feel her tongue tracing your labia, vibrating apart from a ");
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("lapine");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("foxy");
		else output("whorish");
		output(" giggle. <i>“Feels like you’re gonna cum!”</i> She moans, thrusting her wonderful, impatient, terrifying tongue into your furthest depths. The tip grazes the entrance to your womb while your springy nerves hug the formidable girth of her flesh in total delight, the fullness it provides comparable to a gifted mate’s member.");
		output("\n\nScreaming blissfully, you cum, scissoring the lust-puppet’s head between your [pc.thighs] and falling to the floor on top of her. During the descent, and even post-Steele impact, her mouth continues working, instinctively honing in on places that unleash incredible amounts of gratification when pressed. [pc.GirlCum] smears her in her a victorious feminine aroma. Plush lips nurse at your clit, gulping down wave after wave of girly joy. Wetness sprays with spit through the gaps between your [pc.skinFurScales] and your suckling source of near-instant alleviation.");
		output("\n\nWhat should have brought relief has only kindled your fire. Something had to be in her saliva. All of a sudden her tongue is inadequate, inferior. You need something firmer, bigger, hotter. If not for the urgency of this rescue mission you may not have figured out you’re being chemically ensnared - now you <i>definitely</i> need this ride.");
		if(pc.isBro() || pc.isAss()) output(" Wrenching your foe away, you slap her across the opened face, flinging sizzling droplets of coital aftermath. <i>“Nice try,”</i> you growl, flashing her a toothy smile. <i>“Stay still like a proper toy.”</i>");
		else output(" Gripping " + (enemy.hasEarFlag(GLOBAL.FLAG_LONG) ? "her ears":"her hair") + " tight enough to hurt, you yank the slut away in a white-knuckled motion, struggling to keep her serpentine tongue off your snatch. <i>“That’s... enough,”</i> you groan, biting your tongue. <i>“Sit still. Or else...”</i>");
		output("\n\n<i>“’Kay!”</i> she answers with one unbearably smug syllable.");
		output("\n\nYou’re on top of her, yet if you don’t hold it together, you’ll be a <i>bottom!</i>");
	}
	// pc Wetness >=4 (wet enough, screw her; Vulpatra doll always uses this)
	else
	{
		output("\n\nWhether or not that was a poor attempt to keep you away from Kiro for longer doesn’t matter.");
		if(pc.isBimbo()) output(" As if you’d fall for it anyway! Girls like you are <i>always</i> the readiest for dick!");
		output(" She’s been drinking in the sight of your swollen [pc.pussiesLight] the whole time. Light refracts in the [pc.girlCumColor] cascade seeping from your overflowing pot" + (pc.hasVaginas() ? "s":"") + ". The capability of your [pc.pussyNoun " + x + "] isn’t lost on her, and when your groin twitches another [pc.girlCumVisc] string onto her " + (enemy.hasFur() ? "matting bellyfur":"taut tummy") + ", the minx forgets all about eating you out. The knowing-est (and slightly awkward) smiles are exchanged between the two of you.");
		output("\n\nThen you’re sitting yourself on her stomach, capturing her [enemy.cock] in the cleavage between your [pc.butts]. Enfolded in your [pc.skinFurScales], her rock-hard cock throws out a gout of hot and off-purple precum that lands on your spine" + (pc.tailCount > 0 ? ", stains your [pc.tails],":"") + " and seeps into the valley, making her rhythmic passage easier. Struggling to pump all the way through the canyon, she whimpers her approval, <i>“MmaaapussssyIwantpussypussypussy!”</i>");
		if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output(" Though your partner’s a dainty and diminutive plaything, she manages at least one good thrust before your weight proves superior to her strength. It was still enough to smash your thoughts to pieces with another mini-orgasm.");
		else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output(" Unsurprisingly, a laquine’s thigh- and hip-muscles are built to overcome <i>any</i> obstacle to coitus. The bunny-turned-sybian jerks rapid-fire, achieving mating speed in one of the least procreative positions ever. The bouncing impact of her powerful waist to yours pressures a jolting orgasm, then another; sumptuous vibrations feed through your lower half - fuck, what have you gotten yourself into?");
		else output(" Demonstrating her talent for screwing a girl senseless, the herm thrusts hard enough to bounce you up clear off her body; glorious aftershocks worm through your [pc.legOrLegs]. Concentration fractures like glass. Half your brain emerges with the next cum, her infinite horniness finally being arrested by the dead-locked weight of your spasming body.");
		output("\n\nWhite milk surges as you pinch two nipples for support, knuckles sinking into the now-glossed surfaces of her lactating bosom. <i>“Awww, I was soooo close!”</i> she cries. You go down on her, squeezing those sloshing boobs enough to hurt. An ear-screeching moan erupts from her chubby lips, the bruised pleasure in a sexual emissary’s voice bringing some clarity. Nestled taint-deep, she rolls to the side, carrying you on her addicting waves.");
		output("\n\nYour partner crows with surprise when you slide backwards, guiding the [enemy.cockHead] of her dick through your smothering thighs and to the nadir of your lust-pumped vulva. Another stupid-thick rope of bimbo cock-lube throbs out onto the exterior lips. More than heat is absorbed into the glazed sapphic flesh. A strong tic crooks your head diagonally, then pries your lips open in a silent squeal. <i>“Lookie, you’re feeling it already! Can I put it innnnn c’monnnn it’s gonna feeeel greaaaaat!”</i>");
		output("\n\nUnnatural need floods your [pc.pussiesLight], stinging your nerves with a nefarious payload. Only the insertion of something <b>great</b> will take care of it. Fuck fingers and tongues, that stiff hardness warming your delta <b>is the only thing that will quench this flame!!</b> With grit teeth you lift up and slam your [pc.hips] down, loosing a savage roar that clears the air long enough for you to realize her goods are spiked with something. It’s satisfying, it’s refreshing... but damnit, you’re here to save someone!");
		output("\n\n");
		if(pc.isBro() || pc.isAss()) output("Curling your [pc.fingers] around her nipples again, ready to get vicious should the need arise, you growl out, <i>“You’re my bitch.”</i> Pulling back, applying increasing grip strength, you finish, <i>“Act like one.”</i>");
		else output("Hands on her breasts (more like sunken into her breasts, really), you order in your most stern voice, <i>“Stay still.”</i>");
		output("\n\n<i>“’Kay!”</i> the dope answers in one " + ((pc.isBro() || pc.isAss()) ? "infuriating":"sensual") + " word.");
	}
	// merge
	output("\n\nHorny purrs spiral through your ears, caressing your mind. They get harder to listen to while you slap the veiny bulk of her cock to your dripping slit, spreading your luscious self around the " + (enemy.hasCock(GLOBAL.TYPE_VULPINE) ? "burdened":"huge") + " crown of her breeding tool. You pull back just a bit further, squat on the narrow, spurting slit of her shaft, a single lapse in control away from being skewered by enemy’s manhood. It brushes back and forth against your mons, teasing your [pc.clits] until you’re a shuddering mess of soaring anticipation. Agonizing, animalistic urges well up in your wet, waiting pussy, all but asking to be taken roughly.");
	output("\n\nIt quickly gets its wish.");
	// pc Looseness Low (gets stretched; Vulpatra doll won’t proc this)
	//FEN NOTE: The fact that it includes a vulpatra variant proves the above to be a lie. Based it on relative capacities as it should be.
	if(pc.vaginalCapacity(x)/2 < enemy.cockVolume(0))
	{
		output("\n\nYour cuntlips spread wide and almost too fast for this pussy-wrecking totem, grinding inside so forcibly that tears trickle from your eyes. The stretching sensation warns you that <i>something</i> might rip or crack. <i>“You’re really tight! Don’t worry, I’ll- fix- that!”</i> Delicate fingers grip your thighs, squishing you around the hot and ready cock spreading your moistened labia open. The resulting inundation washing through your insides so blissfully helps you to feel real pleasure being molded into this ");
		if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpine dimwit’s");
		else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("bunny bitch’s");
		else output("fuck-toy’s");
		output(" personal cock-sheathe, looking forward to every inch of girth that flattens your [pc.vaginaColor " + x + "] interior aided by her tainted salve.");
	}
	// pc Looseness High (no stretching; Vulpatra doll always uses this)
	else
	{
		output("\n\nWhen the ");
		if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra’s");
		else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine’s");
		else output("woman’s");
		output(" cunt-stuffer slips inside your welcoming twat, she hums in sudden ecstasy. You swoon, too - it’s absolutely wonderful to have a penis this good sinking into your body, inexorably shaping you to its owners imprint with no pain or struggle. It just happens, like you were <i>meant</i> to be claimed this way. Appearing as a small bulge at the front of your abdominals, you feel her halfway inside. Rivulets of [pc.girlCumNoun] stream down the herm’s length, mixing with her personal lube to create an absolutely molten concoction of sweet euphoria. <i>“Wow! Your pussy’s really good at this! Mistress would be super impressed!”</i>");
	}
	// merge
	// pc Vaginal Capacity Bad
	if(pc.vaginalCapacity(x) < enemy.cockVolume(0) && !enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		output("\n\nFlaw-free hands tenderly squeeze the quivering tracts of your [pc.skinFurScales]. <i>“Aww, what’s wrong?”</i> She moans, feeling her burrowed rod smack against your biological limits. <i>“Oh no! Your pussy’s full already? That’s no good! Don’t worry, when Mistress gets her hands on you that’ll change, promise!”</i> Growling, you shift forward unconsciously, buckling " + (pc.hasKnees() ? "at the [pc.knees] ":"") + "as a few of her turgid inches emerge only to squelch back inside on slick liquid. Her broad, excited smile greets you, absent any malevolence and only slightly disappointed by how poorly matched your goods are.");
	}
	// pc Vaginal Capacity Good (Vulpatra doll will always use this)
	else if(enemy.hasCock(GLOBAL.TYPE_VULPINE) || (pc.vaginalCapacity(x) >= enemy.cockVolume(0) && pc.vaginalCapacity(x)*2 < enemy.cockVolume(0)))
	{
		output("\n\nThe sex-doll smiles gratefully at you, reaching a hand over to flick your dribbling cunny’s buzzer. <i>“Look! It’s almost in!”</i> Endless moisture produces an obscene ‘shlick’ when you let gravity take over. It grabs you like an onahole and squeezes you down the rest of the dick in a perverse manner, hilting the ardorous flesh in your torrid depths. It gently pounds your deepest places, almost too much for you to handle. Violent spasms wrack your twat, generated by tenderized nerves. <i>“You look sooo good like that!”</i> Each throb of the dick packed into your squirming folds makes you feel <i>favored</i> - tiny, indescribable rewards for a cunt that knows its place.");
	}
	// pc Vaginal Capacity Very Good
	else 
	{
		output("\n\nSomething tells you that Po’s fuckdoll was unprepared for so magical a cunt seizing her today. It’s worth it to see her face spread itself into an ‘oh’ of amazement. You take her to the hilt quickly and cleanly");
		if(enemy.hasCock(GLOBAL.TYPE_DEMONIC)) output(", a feat that would leave astonished onlookers stunned. There must be around two feet of dick inside (at LEAST!) and <i>you STILL have room!</i>");
		else output(".");
		output(" Euphoria puddles inside you, girlish lube mixing with herm-spooge and drooling hot across your conjoined loins. Moving around is even easier, like gripping a flight stick in your hand and maneuvering skillfully through three dimensions. <i>“You’re the best!”</i> she wails, biting her lip cutely. <i>“Ohhh yesss...!”</i>");
	}
	if(!enemy.hasStatusEffect("VR")) pc.cuntChange(x,enemy.cockVolume(0));
	// merge
	output("\n\nYou moan on the spot, making your first ascent on the twin-sexed beauty’s cock. The vessel pinks in and out of your mind. Strength rapidly flees your upper body, shunting down in currents of cock-constricting sensation. It’s not just a ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fox girl’s");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("rabbit babe’s");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("terran turboslut’s");
	else output("demon’s nubby");
	output(" dong filling you, it’s contentment. Like you, she’s luxuriating in it, watching your sloppy [pc.vaginaColor " + x + "] slit swallow her leaking presence");
	if(pc.balls == 1) output(" ball-deep");
	else if(pc.balls > 1) output(" balls-deep");
	output(". <i>“How’s it feel?”</i> she chimes. <i>“Mistress Po told me to fuck you! So am I doing a good job?”</i>");
	output("\n\nShould that question really be directed your way?");
	output("\n\nThe lack of an answer motivates further depravity. Her exploring hands find your [pc.chest], relentlessly stroking away at bare flesh until they find purchase at your [pc.nipplesNoun]. Potent convulsions course from your tits to your brow, wrapping around your spine and trapping it in an electrifying circuit. Propelling hips meet you thrust-for-thrust, bouncing up just before you fall to double the passion." + (pc.biggestTitSize() >= 2 ? " The tit-jiggling knock of bone against sinew sets your [pc.breasts] to a clapping wobble.":"") + " Whatever your thoughts on her, it’s clear your pleasure is extremely important.");
	output("\n\nMuch more than her own at this point.");
	output("\n\n<i>“Oh! Did you feel that?”</i> Until she said something, you didn’t, but then you notice it again. The giddy rush of fluid in your conquered channel brings a big smile to your face. It’s your orgasm, hedonistic and profoundly satisfying in the face of sexy danger. <i>“Sooo hot! I’m so glad Po told me to fuck you! You’ve got the best pussy ever! And it’s so new to this, so it’s extra fun to use!”</i> You hiss from the sharp rake of her gaudily painted fingernails, working your hips into an inconsistent rotational orbit that returns the favor. <i>“Oaaaahhh, keep doing th-th-thaaaat- yaaay! Use my cock, that’s what it’s for! I’ll give you a nice big creampie if you do that some more!”</i>");
	// vulpatra
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("\n\nAlthough not as hung as others, the fluffy fox you’re riding makes up for size and girth with a cushiony quality. Oh, her big and hard boner’s everywhere inside, wearing you like an oversized mitten, but it’s the way her indulgent body absorbs your falls that tell you <i>what a good idea it was to take her for a spin.</i> Vaguely canid prick stretches you out, a bulbous knot threatening to break apart your womanhood, promising to tie you together for the kind of cuddles only found in sappy romance novels.");
	// laquine
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nGifting your pussy with the laquine’s big slab of animal meat convinces you that fucking her was in your best interest. You can feel the pulse of her mammoth member thudding across the clutching acres of your corrugated channel. Powerful phallic flexes bulge you in the most intoxicating ways. This musky penile idol doesn’t need any input to make you cum. It could sit inside you forever, ruin you completely for the rest of the galaxy, and bring you from orgasm to orgasm through undeniable maleness. This designer brand dick has been made to look as good as it feels inside. It’s your prize to play with. Perfection.");
	}
	// terran
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("\n\nWounded groans flutter from the onyx lips of your pristine sex-toy. The soft and round crown of her foot-long shaft glides intimately through your hole, the way it moves something to just marvel at. Some dicks are made specifically to breed. Others are made for long-term pleasure. Human dicks combine every important quality into the ideal womb-stuffing package. A splendid shape that anyone can handle, a sensitivity unmatched. Formidable ivory cock plows you vigorously, an intense and perfect experience that pitches your voice higher.");
	// demon
	else 
	{
		output("\n\nTaking such a massive dick this demon’s nub-laced prong was a challenge from the get-go");
		if(pc.vaginalCapacity(x) < enemy.cockVolume(0)) output(", but now you’re sticking through it solely out of stubbornness");
		else output(", and it’s transforming you into the universe’s next size " + pc.mf("king","queen"));
		output(". You curse and growl from the intensity of her totemic girth, but it’s those nubby outcroppings that screw you, literally and figuratively. They dig outwards while she digs inwards, triggering quakes of gratifying pleasure up and down your form. Of course it bulges outwards too. This mega-phallus is a known presence on the inside <i>and</i> the outside. The reactions you get when you touch her through your tummy nearly propels you to orgasm.");
	}
	// merge
	output("\n\n<i>“You got this!”</i> Every thrust is punctuated with a dopey compliment that could only come from a pure bimbo. <i>“You’re gonna cum! It’s gonna be sooo hot!”</i> You wonder if Doctor Po is watching. If Kiro’s watching. Watching you lose your mind for this ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("plush fox’s");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("chirpy laquine’s");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("endowed woman’s");
	else output("succubi’s");
	output(" dick. Rapturous cries reverberate through the hull, alerting the stars to your cresting approval. A quiet and shameful part of you hopes that someone is seeing you squawk and squirm, having pleasure pounded into your wetness at a frenetic pace.");
	output("\n\n<i>“I’m... I’m... oohhhh...”</i> Your would-be dominant thrusts so hard that her balls swing up and slap to your asscheeks. <i>“I’m gonna... cummmmm...”</i> Cervix-splashing warmth erupts, serving a notice that’s hidden in the orgasm it smacks you with. ");
	if(enemy.cockVolume(0) >= pc.vaginalCapacity(x)) output("Her groin does its best to mash into yours, but all she does is wiggle you about on a fuckstick incapable of going all the way.");
	else output("Her groin mashes into yours, grinding your [pc.clit] to her " + (enemy.hasKnot(0) ? "knot":"pubic mound") + ".");
	output("\n\nShe wants to cum inside.");
	output("\n\nWill you let her?");
	processTime(5);
	clearMenu();
	addButton(0,"Inside",letTheFookdollCumInside,x,"Inside","Let it happen...");
	addButton(1,"Outside",outsideCummiesForFutaSexdolls,x,"Outside","The last thing you need is to be swollen with some mind-broken doll’s kids!");
}

//[Inside]
// If Laquine, hook into the generic laquine preg system. Dunno if there’s any pure human preg yet, don’t think so.
public function letTheFookdollCumInside(x:int):void
{
	clearOutput();
	showSexDoll(true);
	author("William");
	output("Letting go is the wrong thing to do when someone needs your help. This isn’t why you’re here. Fuck if it doesn’t feel good though. Void, does it feel great having a dick on the edge of hellish orgasm bashing into places too sensitive. It crushes you, slasms you, matches the curvature of your fluttering slut-cunt.");
	if(pc.fertility() != 0) output(" The scent of climax fuses with the aroma of ovulation. Eggs release, and seed erupts - volcanic deluges of surging spooge race up.");
	else output(" As her seed surges and prepares to erupt, you decide she really doesn’t need to know she has no chance of impregnating you.");
	output(" Your [pc.pussies] feel" + (!pc.hasVaginas() ? "s":"") + " the ascent of the sex-puppet’s virile discharge, and you’re right there with it.");
	output("\n\nHerm-sperm pumps into your womb, expelled at a force that’s felt with a manic thud in your brain. It’s doing more than feeding your ovaries but you don’t care. ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("The knot’s about to go in, and you sort of hope it does.");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("The flare’s billowed out into a perfect saucer, plugging your hole to keep the onrush in.");
	output(" Urethral-straining loads of vein-fattening" + (!pc.isPregnant(x) ? ", womb-bloating":"") + " sperm shoots into your core, purply spillage accumulating from the sheer amount of backblast. If you concentrate (at this point an accomplishment worthy of a medal), you can feel the roil of her overfull balls, the rage of her spunky ecstasy before it’s churned up and spooled out in voluminous gouts.");
	output("\n\nSlackly accepting every ounce of saturation, your midriff develops into a pooch before swelling into a properly-filled gut. You feel that wonderful and terrible weight - you love it. You’d love to give in. She’s cumming inside you, but Kiro’s name is on your tongue, keeping your hormone-ridden mind straight. This is just a necessary part of the rescue. Your whole body is caught in orgasm for what seems like an eternity, little more than a glorified prophylactic adhering to a feral dick that never softens, ejaculates on a constant loop in an effort to crack your inhibitions.");
	if(pc.hasCock())
	{
		output(" Opening your eyes you find your [pc.cocks] spurting [pc.cumNoun] in variegated ropes and strings, plastering the " + (enemy.hasCock(GLOBAL.TYPE_VULPINE) ? "shortstack":"big-titted bimbo") + " with all they’ve got.");
	}
	output("\n\nYou force yourself into a slump, detaching from the jerkily-working phallus as it unloads a mind-wiping payload onto its owner. Cum oozes from your snatch - it’s gotten everywhere. No nook, no cranny, no niche of your heat-tickled meadow hasn’t been violated by your partner’s offerings." + (!pc.isPregnant(x) ? " It seeps into your fallopian tubes, drips down your parted cervix, dirties more than your tender flesh.":""));
	//Taint-based TFs.
	var changes:Number = 0;
	var choices:Array = [];
	if(pc.wetness(x) < 5) choices.push(1);
	if(pc.vaginalPuffiness(x,true) < 2) choices.push(2);
	if(pc.clitLength < 12) choices.push(3);
	//Wetness can combo with 1 other change:
	if(pc.wetness(x) < 5 && pc.vaginalPuffiness(x,true) < 2) choices.push(4);
	if(pc.wetness(x) < 5 && pc.clitLength < 12) choices.push(5);
	//Pick a change if any avail.
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];

	if(!enemy.hasStatusEffect("VR")) 
	{
		// pc Gets Wetter
		if(select == 1 || select == 4 || select == 5)
		{
			output("\n\nA familiar warmth seeps down from your stomach, sexual and heady. It’s not cum, though. Are you still horny? Blossoms of heat flare up in your gut, radiating downward. You can sense it, you can see it - <b>your feminine anatomy is producing more lubricant.</b> Thicker runnels of [pc.girlCumNoun] wash out the excess, demonstrating your increased sexual slickness.");
			if(pc.wetness(x) + 1 >= 4) output(" Your heartbeat speeds up and you shove as many fingers into your pussy as it can handle, tearing down the dam and frigging your bean" + (pc.totalClits() > 1 ? "s":"") + " until a fragrant torrent squirts out! Unable to stop yourself you have another go. Not only has your wetness been boosted, but <b>you’re now a squirter.</b>");
			output("\n\nHaving a juicier cunt isn’t the worst thing that can happen to you. If anything, it’ll make it feel more comfortable to walk around. And pleasant. And... well, you could very easily go another round with that oversexed fuckpuppet. It feels really nice, and it’s going to need a good challenge...");
			pc.vaginas[x].wetness(1);
			pc.taint(3);
			changes++;
		}
		// pc Gets Puffier
		if(select == 2 || select == 5)
		{
			output("\n\nYou accidentally brush a hand over your beautifully-soaked and well-fucked mound, and something unfamiliar hits you. Skin exists where it didn’t exist before. Fearful at first, you lurch up on a fresh injection of adrenaline to find that your pussy’s put on weight. The vulva is distended, looking " + (pc.vaginalPuffiness(x) <= 0 ? "fat and plump":"fatter and plumper than it already was") + ". When you stroke a finger to it, the chemically-heightened nerves bombard your cortex with all-new sensations of vaginal pleasure. Your libido finally catches up to the changes, suffusing you with a desire to try it out as soon as possible. Who wouldn’t want to fuck a [pc.boyGirl] with so much pussy? It’s so big that it’d hug a dick as tight as it would an ausar’s knot.");
			output("\n\n<b>You’re going to have to get used to having a pumped-up vagina!</b>");
			pc.inflateVagina(x);
			pc.taint(5);
			changes++;
		}
		// pc Gets Biggus Clittus
		if(select == 3 || select == 5)
		{

			var clits:Boolean = (pc.totalClits() > 1);
			output("\n\nThe mutagenic sperm has had an instantly recognizable effect on your biology - your clit" + (clits ? "s":"") + ". " + (clits ? "They’re... they’re":"It’s... it’s") + " bigger. " + (!clits ? "It has":"They have") + " to be. <b>" + (!clits ? "It’s":"They’ve") + " swelled up at least another half inch,</b> connecting new nerves primed to leave an indelible mark on your mental state next time someone touches it.");
			//gainedBigClit:
			if(pc.clitLength < 3 && pc.clitLength + 0.5 >= 3) output(" The [pc.vaginaColor " + x + "] bulb" + (clits ? "s have":" has") + " turned into an obese extension of flesh that those outside the frontier would frown on, but who gives a fuck what they think - " + (clits ? "they’re":"it’s") + " pulsing with untapped potential!");

			//gainedDicksizeClit:
			if(pc.clitLength < 5 && pc.clitLength + 0.5 >= 5) 
			{
				output(" You now have " + (!clits ? "a ":"") + "lady-boner" + (clits ? "s":""));
				if(pc.hasCocks()) output(" to match the ones overlapping your cunt");
				output(" - " + (clits ? "they’re":"it’s") + " positively obscene. " + (!clits ? "It wobbles":"They wobble") + " hypnotically, engorged with new nerves and new ways to demolish your brain with raw, searing pleasure.");
			}
			output(" You briefly ponder tugging on " + (clits ? "one":"it") + ", jerking it between finger and thumb just to try it out. But then you’d be an easy mark, a trivial capture. It’s throbbing in the open air, desperate for a touch, not at all satisfied even after a brutal fuck.");
			pc.clitLength += 0.5;
			pc.taint(4);
			changes++;
		}
	}
	else pc.taint(1);
	// merge
	output("\n\nStumbling to your [pc.footOrFeet], you perform a quick inspection of the dazed fuck-doll’s belongings" + (!pc.isCrotchExposed() ? ", get your clothes in order":"") + ", and " + (silly ? "crab-":"") + "walk off. If you didn’t know better, you’d think her cock gave you a more womanly pair of hips! At any rate, you’ve dealt with your immediate lust.");
	if(changes > 0) output(" Minus the change" + (changes > 1 ? "s":"") + " you’ve undergone, you should be okay for the time being...");
	else 
	{
		output(" Fortunately, you didn’t undergo any unusual changes. Messing with Po’s belongings can only bring trouble, but you lucked out this time. Or maybe those insidious chemicals couldn’t change something so good?");
		pc.taint(2);
	}
	if(pc.isBimbo()) processTime(15);
	else processTime(5);
	if(!enemy.hasStatusEffect("VR")) pc.loadInCunt(enemy,x);
	//[Next] \\ Back to Game
	// sceneTag: PC Cums
	// sceneTag: loadInCunt
	// sceneTag: Generic Laquine preg if doing her
	// sceneTag: Possible spermutations~
	// sceneTag: processTime 10 minutes (20 if bimbo)
	output("\n\n");
	CombatManager.genericVictory();
}

//[Outside]
// Tooltip: The last thing you need is to be swollen with {more} kids!
public function outsideCummiesForFutaSexdolls(x:int):void
{
	clearOutput();
	author("William");
	showSexDoll(true);
	output("A throaty groan clears the pheromone-scented haze long enough for you to lift up and pop free of the [enemy.race]’s dick before it spurts off the first shot of hot thickness. A huge torrent of seed-glutted goop launches into the overhead, dribs and drabs flinging off or leaking back down onto your neck or into your hair. Time seems a blur when you seat your [pc.pussies] on the doll’s member, firming it to her belly. It explodes all over her face, rapidly cocooning her breasts and " + (!enemy.hasMuzzle() ? "head":"snout") + " in corruptive waves of hellish pleasure.");
	output("\n\n[pc.GirlCum] " + (!pc.isSquirter() ? "trickles":"squirts") + " from your snatch, soaking the impassioned [enemy.cockNoun] in your peaking ecstasy, helping empty her oceanic virility. There’s always more, and through successive ejaculation she gets you to ejaculate, to spray her down until you’re a shuddering, spurting wreck." + (pc.hasCock() ? " You don’t know she manages it, but a hand wraps around your dick, slapping it into hers for an impromptu frottage you’re in no position to deny. Your own [pc.cumColor] [pc.cumNoun] creams her fat fucking lips, painting her face in alternating colors of jizz.":"") + (pc.isSquirter() ? " The sensations intensify until you’re rendered half-inert, the climactic detonation of your projectile wetness crashing your brain with dangerous bliss.":""));
	output("\n\nYou slide back and forth on locked muscles, riding the phallus-bulging distensions of her hyper-productive spunk-generators. A butterfly effect is somehow produced down there, intense gouts of spunk rushing out at such a rate that you suddenly feel very lucky to have not attempted to take this much nut into your gut. The tectonic weight of her churning nutsack unspools a veritable inundation of sticky purple jizz that sparkles like a river of liquefied amethysts - its prettiness belies a danger that will only harm your goals.");
	output("\n\nThe rising purple thickness sloshes on the gurgling slut’s rocking body, spilling off to the sides in an accumulating puddle. You’re saved by the fear that this could go on forever - she’s not done cumming, and to be honest you don’t think she’ll ever be. You kick back and slide off, shivering in your own euphoric pile, the star at the center of your galaxy.");
	output("\n\nA star that is missing its moon - Kiro. Kiro.");
	output("\n\nDazed, you sit up - yep, your foe is cumming herself senseless. Well, if she had any left after Po’s work. Gunky urgency flicks at her totally drenched features, more urgent with every upward thrust into a tight outlet no longer there. Looks like the phantom memory of your ride is giving her a <i>very</i> wet dream.");

	//Taint-based TFs.
	var changes:Number = 0;
	var choices:Array = [];
	if(pc.wetness(x) < 5) choices.push(1);
	if(pc.vaginalPuffiness(x,true) < 2) choices.push(2);
	if(pc.clitLength < 12) choices.push(3);
	//Wetness can combo with 1 other change:
	if(pc.wetness(x) < 5 && pc.vaginalPuffiness(x,true) < 2) choices.push(4);
	if(pc.wetness(x) < 5 && pc.clitLength < 12) choices.push(5);
	//Pick a change if any avail.
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];

	if(!enemy.hasStatusEffect("VR")) 
	{
		// pc Gets Wetter
		if(select == 1 || select == 4 || select == 5)
		{
			output("\n\nA familiar warmth seeps down from your stomach, sexual and heady. It’s not cum, though. Are you still horny? Blossoms of heat flare up in your gut, radiating downward. You can sense it, you can see it - <b>your feminine anatomy is producing more lubricant.</b> Thicker runnels of [pc.girlCumNoun] wash out the excess, demonstrating your increased sexual slickness.");
			if(pc.wetness(x) + 1 >= 4) output(" Your heartbeat speeds up and you shove as many fingers into your pussy as it can handle, tearing down the dam and frigging your bean" + (pc.totalClits() > 1 ? "s":"") + " until a fragrant torrent squirts out! Unable to stop yourself you have another go. Not only has your wetness been boosted, but <b>you’re now a squirter.</b>");
			output("\n\nHaving a juicier cunt isn’t the worst thing that can happen to you. If anything, it’ll make it feel more comfortable to walk around. And pleasant. And... well, you could very easily go another round with that oversexed fuckpuppet. It feels really nice, and it’s going to need a good challenge...");
			pc.vaginas[x].wetness(1);
			pc.taint(3);
			changes++;
		}
		// pc Gets Puffier
		if(select == 2 || select == 5)
		{
			output("\n\nYou accidentally brush a hand over your beautifully-soaked and well-fucked mound, and something unfamiliar hits you. Skin exists where it didn’t exist before. Fearful at first, you lurch up on a fresh injection of adrenaline to find that your pussy’s put on weight. The vulva is distended, looking " + (pc.vaginalPuffiness(x) <= 0 ? "fat and plump":"fatter and plumper than it already was") + ". When you stroke a finger to it, the chemically-heightened nerves bombard your cortex with all-new sensations of vaginal pleasure. Your libido finally catches up to the changes, suffusing you with a desire to try it out as soon as possible. Who wouldn’t want to fuck a [pc.boyGirl] with so much pussy? It’s so big that it’d hug a dick as tight as it would an ausar’s knot.");
			output("\n\n<b>You’re going to have to get used to having a pumped-up vagina!</b>");
			pc.inflateVagina(x);
			pc.taint(5);
			changes++;
		}
		// pc Gets Biggus Clittus
		if(select == 3 || select == 5)
		{

			var clits:Boolean = (pc.totalClits() > 1);
			output("\n\nThe mutagenic sperm has had an instantly recognizable effect on your biology - your clit" + (clits ? "s":"") + ". " + (clits ? "They’re... they’re":"It’s... it’s") + " bigger. " + (!clits ? "It has":"They have") + " to be. <b>" + (!clits ? "It’s":"They’ve") + " swelled up at least another half inch,</b> connecting new nerves primed to leave an indelible mark on your mental state next time someone touches it.");
			//gainedBigClit:
			if(pc.clitLength < 3 && pc.clitLength + 0.5 >= 3) output(" The [pc.vaginaColor " + x + "] bulb" + (clits ? "s have":" has") + " turned into an obese extension of flesh that those outside the frontier would frown on, but who gives a fuck what they think - " + (clits ? "they’re":"it’s") + " pulsing with untapped potential!");

			//gainedDicksizeClit:
			if(pc.clitLength < 5 && pc.clitLength + 0.5 >= 5) 
			{
				output(" You now have " + (!clits ? "a ":"") + "lady-boner" + (clits ? "s":""));
				if(pc.hasCocks()) output(" to match the ones overlapping your cunt");
				output(" - " + (clits ? "they’re":"it’s") + " positively obscene. " + (!clits ? "It wobbles":"They wobble") + " hypnotically, engorged with new nerves and new ways to demolish your brain with raw, searing pleasure.");
			}
			output(" You briefly ponder tugging on " + (clits ? "one":"it") + ", jerking it between finger and thumb just to try it out. But then you’d be an easy mark, a trivial capture. It’s throbbing in the open air, desperate for a touch, not at all satisfied even after a brutal fuck.");
			pc.clitLength += 0.5;
			pc.taint(4);
			changes++;
		}
	}
	else pc.taint(1);
	// merge
	output("\n\nGroaning up to an awkward posture, you dodge the purple rain to quickly inspect the slut for anything useful" + (!pc.isCrotchExposed() ? ", get your gear in order":"") + ", and get moving. Kiro needs you. You got what you needed out of this walking dildo and you don’t want to be around when she finds the ability to stand and come at you again.");
	output("\n\nSadly, the probability of you getting horny again to warrant another use of Po’s inventory is astronomically high.");
	if(changes > 0) output(" Hopefully you won’t suffer any more changes if you partake once more.");
	else output(" Hopefully your luck will hold out and you won’t suffer any untoward changes as a result of pairing with these techno-succubi.");
	//[Next] \\ Back to Game
	// sceneTag: PC Cums
	// sceneTag: Possible spermutations~
	// sceneTag: processTime 10 minutes (20 if bimbo)
	if(pc.isBimbo()) processTime(15);
	else processTime(5);
	pc.orgasm();
	output("\n\n");
	clearMenu();
	CombatManager.genericVictory();
}

//[QuestyDun] Victory Scene, (Something for PC hyper dicks) max payout 2500 words.
//By QuestyRobo. <i>“Make it Fit”</i>
//Taint gain. Increased girth. Increase to length. Ball size bump, if you have them.
//[MakeItFit!] Cram your plus-sized pillar into the fucktoy’s cock-holster!
public function questyHypershit(x:int):void
{
	clearOutput();
	author("QuestyRobo");
	showSexDoll(true);
	output("They say that there’s a time and place for everything. Some people would tell you that the time to get your [pc.cockNounComplex] wet <i>isn’t</i> while your " + ((flags["KIRO_BF_TALK"] == 1) ? "girl":"") + "friend is being turned into the exact kind of slut doll you’re about to lay with. You didn’t listen to those kinds of people when you made your cock this big in the first place and you’re certainly not going to listen to them now!");
	output("\n\n");
	if(pc.isCrotchExposed()) output("Your monumental member rises up in the open air, unimpeded by any sort of clothing." + (pc.isBro() ? " Pants are just for people with small dicks to hide their shame anyway!":""));
	else output("Your stupidly huge ogre member strains against the inside of your [pc.crotchCoverUnder], making its obscene tumescence known to both you and her. You decide to strip down before your dick rips through your clothes, as hot as that would be. It flops out with such force that you wonder if she can feel it from over there.");
	output(" Your [pc.cockHead] points straight at the modded-up fuckslut, eliciting an almost frantic moan from the living sex doll.");

	output("\n\n<i>“S-soooooooooo big! Did Mistress Po already get to you or do you just love fucking leithans that much? Doesn’t matter, I just need it!”</i> The ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("slutty fox-morph");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("horny laquine");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("human slut");
	else output("dick-crazed demon");
	output(" gets down on all fours and thrusts her ass back at you. Her [enemy.vaginaNoun] winks and flexes at you, demanding your attention. Attention it gets as your [pc.cock] swells up even more at her eagerness. You’re a big enough " + (pc.mf("","wo")) + "man (in more ways than the most obvious one) to admit that you might be a little too easy to get going, but that’s just a positive for both of you right now!");
	output("\n\nYou charge forward with the grace of a drunk elephant, waving your ‘trunk’ around with such reckless abandon that the doll-slut doesn’t seem sure if you’re going to fuck her or cockslap her and doesn’t know which one she should be more excited for. She gets something in-between as you thread your colossal boner between her legs, sandwiching her [enemy.cock] between your girth and her soft belly and her [pc.balls] between your dick and hers.");
	output("\n\nShe groans as you assert your dominance and effectively commandeer her as your personal sex toy. <i>“Y-yes, use me! Mistress <b>made</b> me for this, especially dealing with super studs like you!”</i> Her pussy drools as you rub along it, soaking the top of your [pc.cock] as you saw in and out of her full-body embrace. It tingles on your dickskin, harmlessly at first but as you continue to thrust it gets more and more intense.");
	output("\n\nIn the mean-time, she seizes the opportunities her position grants her to please you, wrapping her [enemy.breasts] around your girth in order to add to your stimulation as well as licking, sucking, and even softly nibbling on your [pc.cockHead]. Now this is top grade service!");
	output("\n\nBy the time you realize something’s wrong, it’s too late. You pull your dick from between her legs only to feel an almost irresistible urge to thrust right back in. Your [pc.cock] looks and feels obscenely swollen, noticeably beyond your normal girth.");
	output("\n\n<i>“Like it? It’s one of Mistress’s special chemicals she mods us with. They’re all so much fun! Lucky for you Mistress gave me the one that makes big studs like you even bigger and hornier!”</i>");
	output("\n\nThe living sextoy giggles as you and her watch your cock swell, gorging itself on the treacherous chemicals seeping into it. The reasonable response to this would be to stop " + (pc.taint() < 66 ? "but you don’t think you’re steering this ship anymore!":"but you’ve long since abandoned reason in these kinds of situations!") + " You thrust forward, ramming straight into her outer lips.");
	output("\n\nNormally that’d be where you stop on anything short of a centaur or lethian. Most bipeds just aren’t made for dicks of your size without significant coaxing, but the heavily modded ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("dick-bunny");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("human");
	else output("demon-morph");
	output(" defies your expectations. You feel your [pc.cock] being sucked in with incredible pressure, your [pc.cockHead] tingling as it absorbs more of her diabolic pussy juice.");
	output("\n\nYou’re not satisfied with just that, though; you couldn’t be if you wanted to, thanks to her! Taking advantage of your position, you thrust in, gasping in surprise as almost a dozen inches sink in with ease. This chick wasn’t kidding when she said she was made for this! Another thrust draws a collective, pleasured yelp as your [pc.cockNounComplex] cuts through her honeypot like a hot piston through butter.");
	output("\n\n<i>“Fuckfuckfuuuuuuuuuuck, you’re filling me so goooooood! I want... no, I <b>need</b> more! Push it all in you fucking super-stud! Stuff my cheap cock-sock of a body until I’m ruined for everyone but you!”</i>");
	output("\n\nYou growl low under your breath as you fulfill both of your desires, grabbing her [enemy.hips] and slamming yourself into the doll-slut as hard as your [pc.hips] will carry you. It’s so rare to find someone, especially someone this small, who can really take a cock of your caliber. It’s even rarer to find such an eager size-queen slut that can take almost all of you. Even from this vantage point, you can see how immensely distended her gut is as it warps unnaturally around your reality-defying size.");
	if(pc.cocks[x].cLength() >= 36) output(" Void, you don’t even need to see it to know how much you’re breaking her. <i>You can actually feel your [pc.cockHead] touching the floor through her skin!</i>");
	output("\n\nYour [pc.cock] tingles and flexes inside her pussy, growing hotter and hotter as her tainted essence reshapes your flesh. A dopey grin spreads across your face as you feel yourself ");
	if(pc.cocks[x].cLength() < 36) output("bottom out, the super-eager super-slut managing to take every inch you have to give her, and even seems to be demanding more from you!");
	else output("not even able to bottom out. There’s a thrill to finding out that even one of the most eager and stretchy sluts isn’t capable of taking all of you!");
	output(" You close your eyes and hold still, just feeling your [pc.cockNounSimple] throb so needily that it feels like it might burst at any moment. Each pulse leaves it feeling just a bit bigger, filling her just a little bit more.");
	if(pc.hasCocks()) output(" Your other member" + (pc.cockTotal() > 2 ? "s tingle and pulsate":" tingles and pulsates") + " along with " + (pc.cockTotal() == 2 ? "its":"their") + " brother, feeding off of the residual chemicals to begin " + (pc.cockTotal() == 2 ? "its":"their") + " own, less impressive, growth.");
	output("\n\nA particularly loud moan from your fucktoy opens up your eyes. You look down at her just in time to see that she’s shifting positions, going from on the floor to pressing her back against your [pc.chest]. Your [pc.eyes] go wide as you look at the absolutely behemoth bulge your [pc.cock] is leaving in her. It molds her body around it like she were nothing more than a living piece of shrink-wrap, to the point where you can trace out each vein on your [pc.cockNounSimple]! The surprise causes you to groan, and your member to pulse almost painfully hard, gaining what looks like an inch of length in the process.");
	output("\n\n<i>“You’re getting so big so quick! ");
	if(pc.cocks[x].cLength() < 36) output("I might need to go to Mistress Po to get resized just for you if you keep this up!");
	else output("I can’t even take all of you, you fucking godly stud! I need to get Mistress Po to give me a better pussy just so I can please you. That is unless you just don’t stop growing...");
	output("”</i> She drapes her arms around you loosely and pulls herself up on your cock until she’s close enough that you can feel her breath on your [pc.ears]. <i>“Don’t stop!”</i>");
	output("\n\nYou couldn’t say no if you wanted to, not with all the blood in your head being diverted down to your still-expanding [pc.cockNounSimple]. With a dominant growl, you push her back down, keeping one hand pressed to the back of her head while using the other to steady yourself. The ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fox-skank");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("bunny-bitch");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("human whore");
	else output("demon slut");
	output(" groans and starts drooling onto the floor.");

	output("\n\nYou pull out of her roughly, knowing full-well she wants this as hard and fast as possible. Your next thrust sends her over the edge, causing the dick-crazed slut to scream at the top of her lungs while her [enemy.vagina] explodes all over your crotch.");
	if(pc.balls >= 0) output(" Her chemical-laced juices splatter all over your [pc.balls], causing a familiar tingle to start spreading through your sack.");
	output(" There’s almost no resistance as you start to jackhammer the broken fuck-toy’s sex, stretching her body to such a ridiculous degree that you start wondering if she’s secretly a galotion.");
	output("\n\nEach motion feels heavier, yet more satisfying than the last, owing to the insidious concoction inside her sex juices swelling your [pc.cock]" + (pc.balls > 0 ? " and [pc.balls]":"") + ". The insensate sex-doll is content to just lay there and take it, squirting out more and more of her potent chemicals that keep you nice and big and hard for her.");
	output("\n\nVoid, it’s good to be <i>big</i>! You thought you were huge before, maybe even too big, but now your eyes are truly open. Watching this perfectly-molded slut take you with such ease solidifies in your mind that you’re <i>not big enough!</i> You need to be bigger, so big and irresistible that you can just whip it out and get any slut to submit to you on the spot.");
	output("\n\nMaybe once you’ve saved Kiro you can get this Po chick to do that for you? Your mind wanders to images of that prideful, condescending slut beaten to the ground and forced to augment your [pc.cock] into an obscene, perfect tool. The same tool that you then use to break her into your personal cocksleeve!");
	if(pc.taint() >= 66) output(" Why stop at that? Kiro’s going to be right there, made far more pliable by the doctor’s tampering. Just let her finish and then break both of them! After all, you’re a big " + pc.mf("guy","girl") + " and you need all the sluts you can get!");
	output("\n\nFor now, all you have this skank in front of you, and you’re going to give her everything you’ve got! You focus all of your energy into your [pc.legOrLegs] and start absolutely railing the ");

	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fox");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("bunny");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("human");
	else output("demon");
	output(" slut into the ground. There’s not a single thought for her in any of your movements. The only thing on your mind is getting off, like you were using a common sex toy. She doesn’t seem to mind it at all if the way she’s mumbling, groaning, and drooling into the floor is any indication.");
	output("\n\nYour [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " getting a little tired, though, and you’re not ready to end this just yet. You grab her around the waist and hoist her up, falling onto your back and letting her sit on top of you, reverse cowgirl style. The slut-doll takes no time to adjust, even lifting herself up and spinning around so you can be face-to-face, both with her and the obscene, throbbing bulge your [pc.cock] is leaving in her body.");
	output("\n\n<i>“You’re getting so much bigger inside me! Soon you might not even be able to move with this thing. Then you can just stay here and fuck me while Mistress Po makes your friend beautiful!”</i> She’s not kidding about you getting bigger! You must be at least a few inches longer.");
	if(pc.balls > 0) output(" That’s not even counting your [pc.balls]. You can’t see " + (pc.balls == 1 ? "it":"them") + " from this angle but you don’t need to see " + (pc.balls == 1 ? "it":"them") + " in order to <i>feel</i> just how heavier " + (pc.balls == 1 ? "it is":"they are") + ".");;
	output("\n\nBefore you can answer, she starts bouncing with fiendish energy. Her [enemy.hips] become a blur as she ramps up and up, all the while she stares down at you. No matter how much her face contorts, her eyes never leave yours, almost as if she’s staring into your mind and rearranging it to suit her needs. She starts shouting out, screaming about how much she loves your dick and what a stud you are. Her pace is frantic, never slowing down or missing a beat. She’s taking you over the edge, whether you want it or not.");
	output("\n\nNow that you’re not the one who has to put in the effort anymore, you can lay back and just enjoy the ride. The way her chemical-laced juices have intensified is almost unbelievable. It’s like there are dozens of molten hot tongues all over your [pc.cock], lapping, bathing, and encouraging it to fatten up even more. It obeys, why wouldn’t it? As another growth spurt seizes your member, your mind wanders to what she said before about getting so big you can’t move.");
	output("\n\nIt sounds horrible at first. You came here to save Kiro, didn’t you, why would you give that up just to get your dick wet? That’s what you want to think, but it’s becoming increasingly hard as more and more of your thoughts go straight to your [pc.cockNounComplex]. You power through them, but they never leave your mind for a second.");
	output("\n\nThe combination of sensations finally starts to become too much for you; Her praise and encouragement, her ludicrous pace, all combined with the continual swelling of your [pc.cocks]" + (pc.balls > 0 ? " and [pc.balls]":"") + " creates an avalanche of pleasure that you can’t help but be swept up in.");

	var cockGrown:int = 4;
	if(pc.hasPerk("Mini")) cockGrown--;
	else if(pc.hasPerk("Hung")) cockGrown += rand(5);
	else cockGrown += rand(3);

	if(pc.cumQ() < 1000) 
	{
		output("\n\nYou strain and unload every ounce of [pc.cum] your body has to offer and then some. The infusion of chemicals she’s given you drives your body into overdrive, summoning up reserves you didn’t know you had" + (pc.balls > 1 ? " even with your newly expanded balls":"") + "! The riding slut-doll cums one last time, rubbing the outline of your cock in an almost worshipful manner.");
		output("\n\n<i>“Mhmmm, such a huge stud. Maybe Mistress Po can help you with your virility, though. Big " + pc.mf("boys","girls") + " like you should be super virile too!”</i>");
		output("\n\nYou grunt in irritation and push her off your cock, watching her flop to the ground limply as you get up.");
	}
	//Med cums:
	else if(pc.cumQ() < 10000) {
		output("\n\nYou explode inside of her, dumping your sizable load into the fuck-toy’s pussy. It flows out like water from a broken faucet, your volume bolstered by the sheer amount of lust her chemicals have pumped straight into your brain" + (pc.balls > 0 ? " as well as how much they’ve swollen up your sack":"") + ". She cums one more time, keeping your load nice and contained even though her pussy juices are exploding out in lewd waves.");
		output("\n\n<i>“Such a stud! A cock like this <b>and</b> enough cum to knock up a whole pack of sluts! I should invite some of my friends to go after you next time...”</i>");
		output("\n\nYou grunt in irritation and push her off your cock, watching her flop to the ground limply as you get up.");
	}
	//Big cums:
	else if(pc.cumQ() < 30000)
	{
		output("\n\nYour cumvein bulges obscenely as biblical floods of [pc.cum] travel up your over-packed seed tunnel. The dick-crazed slut-doll feels your sheer virility start to well up inside of her and puts on a knowing grin. As soon as she does that, though, your first load finally explodes out of your cumslit. Her eyes immediately screw up into her head as enough seed fires into her gut to bloat it out to an almost comical degree.");
		output("\n\nShe holds it all in for a long time, reaching a level of cum-infused faux pregnancy that you didn’t think was physically possible. Now you can see she <i>really</i> wasn’t kidding when she said she was built for this. Po makes these bitches sturdy!");
		if(pc.cumQ() >= 20000) output(" Sturdy enough that you actually run out before you bust her" + (pc.balls > 1 ? ", even with all the boosting your balls got":"") + ".");
		output("\n\n<i>“N-nice and tight, just how I like it! You could give some of Mistress Po’s most virile experiments a run for their money! How about just letting her work on you? I bet she could make you into some kind of cum god" + pc.mf("","dess") + "!”</i>");
		output("\n\nTempting offer, but you shrug it off before shrugging the cum-bloated slut off of your member as you get up.");
	}
	else
	{
		output("\n\nNot sturdy enough to stand up to you though! Your sheer virility drives you to pump more and more [pc.cum] into the already-stuffed skank. Initially, she seems decently composed, but after a few more seconds she starts to buckle.");
		output("\n\nHer stomach fills until it looks fit to bursting, yet she tries her best to keep every drop in. That plan fails as you lance off another massive barrage of swimmers, overwhelming whatever was keeping all of your cum held inside. Vast [pc.cumColor] streams rush out of the super-slut, washing over you and flooding down the halls of the lab.");
		output("\n\nThe fuckdoll speaks up, even as your orgasm continues on. <i>“W-what are you? The M-Mistress hasn’t even created a creature this virile!”</i> You respond by firing out another river’s worth of seed, knocking the last bit of sense out of the ballooned-out bitch. You spend the next few minutes just unloading, turning the surrounding area into your personal cum pool. As you get to the last few spurts, you push her off into your mess, dousing her with the last gallon or five left in your system just to make sure she’s nice and marked.");
		output("\n\nAfter finally calming down, you take note of how much your [pc.cock] has grown. Sweet Stars, <b>it must be almost " + num2Text(cockGrown) + " inches longer, and <i>way</i> thicker!");
		if(pc.hasCocks())
		{
			output(" Your other cock" + (pc.cockTotal() > 2 ? "s have":" has") + " also grown in size, though not nearly to the same degree.");
		}
		if(pc.balls > 0) output(" That’s not even mentioning how much your ball" + (pc.balls > 1 ? "s have":" has") + " pumped up!");
		output("</b> With your reserves so thoroughly drained, and the fuckdoll incapacitated, you " + (!pc.isCrotchExposed() ? "re-don your [pc.lowerGarments]":"") + " and set out to save your ");
		if(flags["KIRO_BF_TALK"] == 1) output("girl");
		output("friend!");
		if(pc.taint() >= 33) output(" Maybe you’ll even run into more of these things along the way. You could always use some extra inches!");
		//Super ultra cums has it’s own ending. This is for all the other versions
		questySexdollSceneGrowthsAndWrapper(cockGrown);
		return;
	}
	output("\n\nYour [pc.cock] is still half-hard and coated in her pussy juice but you don’t have to really clean it. At least that’s what you thought until the sated sextoy crawls up and starts licking you clean herself. She’s very thorough and surprisingly quick. While she’s doing that, you size up the changes to your [pc.cock]. Sweet Stars, <b>it must be almost " + num2Text(cockGrown) + " inches longer, and <i>way</i> thicker!");
	if(pc.hasCocks()) output(" Your other cock" + (pc.cockTotal() > 2 ? "s have":" has") + " also grown in size, though not nearly to the same degree.");
	if(pc.balls > 0) output(" That’s not even mentioning how much your ball" + (pc.balls > 1 ? "s have":" has") + " pumped up!");
	output("</b>");

	output("\n\nOnce she’s done a good enough job, you push her away" + (!pc.isCrotchExposed() ? " and quickly put your [pc.lowerGarments] back on":"") + ", not wanting to get too excited for a round two while you’re still on the clock.");
	output("\n\nAs you walk off, she cries out to you, <i>“Come around and fuck me anytime you want, stud! I’m always happy to add a few inches onto you!”</i> You ignore her and your mounting erection and continue on.");
	questySexdollSceneGrowthsAndWrapper(cockGrown);
}
public function questySexdollSceneGrowthsAndWrapper(cockGrown:int):void
{
	if(!enemy.hasStatusEffect("VR")) 
	{
		pc.cocks[x].cLengthRaw += cockGrown;
		//Grow all the dicks!
		for(var y:int = 0; y < pc.cockTotal(); y++)
		{
			if(y != x) pc.cocks[y].cLengthRaw += Math.round(cockGrown/3*10)/10;
		}
		if(pc.balls > 0) 
		{
			pc.ballSizeRaw += 2;
			if(pc.hasPerk("Mini")) pc.ballSizeRaw--;
			if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1+rand(5);
		}
		pc.taint(5);
	}
	else pc.taint(1);
	processTime(30);
	pc.orgasm();
	if(!enemy.hasStatusEffect("VR")) enemy.loadInCunt(pc,0);
	output("\n\n");
	CombatManager.genericVictory();
	return;
}

public function sixtyNineFuckdoll():void
{
	clearOutput();
	showSexDoll(true);
	author("William");

	var x:int = rand(pc.cockTotal());
	var y:int = rand(pc.totalVaginas());
	if(!pc.hasVagina()) y = -1;
	if(!pc.hasCock()) x = -1;
	//[Sixty-Nine]
	// Tooltip1: Put her mouth to work. And yours. {libidoLow: That dick deserves some up-close attention, after all.../ libidoMed: She’s tried to seduce you with that dick, might as well try it out, right?/ libidoHigh: That dick is the centerpiece of temptation incarnate, and it’d be a shame to let it wilt a single inch./ bimboOrCumAddict: Sucking dick is means to an end: rescuing Kiro and getting a filling of thick cum. You can’t let this opportunity go!}
	// Tooltip2: <b>Given your ‘tauric shape,</b> your genitals can’t exchange mutual vows.
	// No taurs. No other restrictions, however.
	// Tainting includes lip size increase (while sucking!!) and a temporary hit of something that does the same as Soak - PC will be drooling up a storm while craving dick for a few hours. Also, PC's cock size can be increased, and pussies will get wetter.

	output("Casting an eye towards the sensual sentry once again brings her [enemy.cock] to the front of your mind. The ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra’s bulging prick");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine’s throbbing horse-dick");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("goth’s savory meat");
	else output("demon’s succulent, nubby member");
	output(" is there, a rod of erotic energy waiting to capture the next bolt. It courses with power and glory, expelling pre in geyser-like eruptions.");
	
	//bimboOrCumAddict:
	if(pc.isBimbo() || pc.isCumSlut()) 
	{
		output(" Your face contorts into an expression of indescribable joy - that cock, and all its cum, belongs to you. When you take a step closer you have to concentrate on not collapsing into a delirious, craving mess. ");
		if(pc.isBimbo() && pc.isCumSlut()) output("You need her dick <b>and</b> her cum!");
		else if(pc.isBimbo()) output("You need that dick!");
		else output("You need her cum!");
		output(" Your safety, and Kiro’s future, may depend on it!");
	}
	else if(pc.libido() < 33) output(" The musk it billows makes you feel a little uneasy... until you realize your libido is blossoming. You could really use some kind of relief. Her mouth will do, and maybe you can return the favor, if only to expedite your climax.");
	else if(pc.libido() < 66) output(" You experience her denial when you catch a single whiff of potent dick-musk. It brings you to a similar state of neediness, sharpening the veiny details of her stiffened phallus so strongly that the world seems fake and abstract in comparison. Yeah, you need it.");
	else output(" Kiro wouldn’t blame you for being distracted by this tramp. She’s gorgeous, her cock more so. You gaze dumbly at her, quivering and tightening at the same time, needing this sexual tete-a-tete on a physiological level. You can <i>taste</i> her from the smell!");
	
	output("\n\nJudging by your continued presence, the brainless turboslut puts two and two together, beaming, <i>“Oh, oh! Are you going to fuck me?”</i> Excited moans turn to eager cries; your opponent stares you down with mesmerizing eyes, flashing her most winning smile. <i>“Anything for you, hot-stuff! Mistress Po made sure I was ready at all times! All she said was to screw you silly and if you’re game you’re gonna fuck me you’ll get the best" + (silly ? " fucky wucky, and it’ll be the good kind!":" cum you’ve ever had!") + "”</i>");

	if(!pc.isCrotchExposed())
	{
		output("\n\nThe ");
		if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fluffy fox");
		else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("sultry bunny");
		else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("pale woman");
		else output("succubus");
		output(" watches you undress, staring at and commenting on the curves you");
		if(pc.isBimbo()) output(" happily flaunt");
		else output(" expose");
		output(". Never insulting, she squawks with pure delight when your [pc.hips] wiggle about, suggests a few lewd (and downright absurd) methods to enhance your [pc.thighs], and sweeps a lengthy tongue over her perfect [enemy.lipColor] lips when you deign to reveal your loins.");
	}
	else
	{
		output("\n\nAs you take a step forward, the soulful slut’s eyes whisper down to your already-exposed groin, so very eager to jump to the main course rather than focus on any other goosebumped part of your nude form.");
	}

	if(pc.isHerm()) output(" <i>“Wooow! You’ve got both, too?”</i> the minx coos, very much impressed by your twinned sex. <i>“Isn’t it <b>awesome</b> to have a cock and pussy together? When they cum at the same time, mmmmff, I never get tired of it! Which’re you gonna use, cutie? I’d love a taste of either!”</i>");
	else if(pc.hasVagina())
	{
		output(" Ooooh, look at how your ");
		if(pc.vaginalPuffiness(y) < 1) output("cute little pussy");
		else output("plump ‘n yummy pussy");
		output(" glistens!”</i> the dilettantish doll squeals. <i>“I can see my reflection from here. Do you wanna use my cock? Maybe my tongue? You’ll love it either way, I promise! And once you’ve had your first orgasm with me, you’ll want even more - guaranteed!”</i>");
	}
	else if(pc.hasCock()) output(" <i>“Mmm, MM! I loooove seeing [pc.guyGirl]s so <b>hard!</b>”</i> She bites her lip, batting her eyelashes seductively. <i>“Are you gonna let me wrap my tongue around that big, yummy penis so you can fuck it right back into my face? Maybe bang my hot pussy? Whatever you want, it’s gonna feel great, trust me!”</i>");
	else output(" <i>“Huuuuh!?”</i> she whines, gobsmacked by your lack of reproductive means. <i>“Where’s your penis? Your vagina? You poor thing! Did someone steal them?”</i> She shakes her head, utilizing significant amounts of bimbo empathy to cope with this distress. <i>“Oh, don’t worry, Mistress can get them back for you! I can help you pass the time ‘til she’s ready for you! Just tell me what to do!”</i>");
	output("\n\nHalf-lidded eyes follow your dominant stride. Pivoting in preparation, you drop down without a word, planting your groin on the stamped slut’s maw, " + (enemy.hasMuzzle() ? "engulfing her muzzle":"smothering her face") + " in your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("feminine depths");
	else output("taint");
	output(". The taste of your ");
	if(pc.balls > 0) output("[pc.sack]");
	else if(pc.hasVagina()) output("pussy");
	else output("backside");
	output(" triggers the fuck-doll’s autopilot routine, and out boils a sinuous tongue that drags its wet fleshiness across your ");
	if(pc.hasCock()) output("manhood");
	else if(pc.hasVagina()) output("lady parts");
	else output("[pc.butts]");
	output(", painting you in the slavish succulence of a gifted whore. Two [enemy.hands] grip to your waist, only wanting to dig into the ");
	if(pc.isHerm()) output("hermaphroditic buffet");
	else if(pc.hasVagina()) output("exquisite [pc.pussiesLight]");
	else if(pc.hasCock()) output("rock-hard [pc.cocksLight]");
	else output("[pc.asshole]");
	output(" presented. Here with a thirsty succubus to serve your whim, you can let Kiro be for a time.");

	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",wills69Part2,[x,y]);
}
// Scene could get a little bit long without this ^^;;

public function wills69Part2(args:Array):void
{
	clearOutput();
	showSexDoll(true);
	author("William");

	var x:int = args[0];
	var y:int = args[1];

	// pc Cock and Herm
	if(pc.hasCock())
	{
		output("The lusty bimbo babe’s tongue lashes across your vulnerable [pc.cockNoun], weaving around the [pc.knotOrSheath] with a sexual serpent’s coiling relish. Sloppy kisses follow suit, peppering your");
		if(pc.balls > 0) output(" [pc.sack]");
		else output(" cumvein");
		output(" until you’re thrusting on instinct. A warm shiver runs up your [pc.cocksLight].");
		if(pc.balls > 0)
		{
			if(pc.balls == 1) output(" The orb in your sack is slurped like the treat");
			else output(" The orbs in your sack are slurped like the treats");
			output(" at the end of a lollipop - " + (pc.balls == 1 ? "it wears":"they wear") + " the lascivious shape of her plump mouth all around " + (pc.balls == 1 ? "its diameter":"their diameters") + " until your sack turns the neon color of her lipstick.");
		}
		output(" [pc.CumColor] precum spurts, and a heavy sensation closes in when you look down to see her jacking you, moaning as she pumps your flesh until ardor bursts forth, splattering the twitchy broadness standing inches away. The copious make-up she wears begins to shimmer as you’re slowly brought to rutting mania.");
		if(pc.hasVagina()) 
		{
			output("\n\nNow that the ");
			if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("fox");
			else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("slutbun");
			else output("skank");
			output(" has intimated to your manhood what a good and dedicated cocksucker she is, your [pc.pussiesIsAre] coated in ample saliva. A clit-polishing tongue slathers your hot vulva" + (pc.hasVaginas() ? "e":"") + " in head-spinning warmth, tickling your [pc.pussiesLight] with the tip of her muscle, a tendril that could slide in at any time. It slaps back to your male half, then returns, shaking and stirring the kind of refreshing, heady aroma only a herm can create.");
		}
		output("\n\nYou grunt with approval, shifting back to let her work the straining [pc.cockHeads]. Instead, your pulsating phallus is suckled past a strumpet’s sinful lips, sloping towards her wide-open throat without consent. Lungs powerful enough to alter a planet’s atmosphere inflate, vacuuming your [pc.cockNoun] like you’ve just slotted into an artisanal milker. Unholy suctions white out the world, tugging at your thoughts as well as your prostate, attempting to drink right from the [pc.cumVisc] source of your virility; the softest, and most dangerous DSLs are there in the internecine throbs, sweeping across your shaft, seamlessly enveloping it in a hole specifically engineered to drain any [pc.master]’s jizz.");
	}
	// pc Pussy
	else if(pc.hasVagina())
	{
		output("Bumping against your [pc.clits] is the angling tip of a slavering tongue, swimming through the");
		if(pc.hasVaginas()) output(" crevices of your multiple cunts");
		else output(" valley of your [pc.pussy]");
		output(", collecting from the puddle of [pc.girlCum] seeping from your [pc.vaginaColor] entrance" + (pc.hasVaginas() ? "s":"") + ". Sumptuous femininity trembles all around her as she spears " + (pc.hasVaginas() ? "one":"it") + ", skewering your interior for a proper taste. It feels dirty. Yes, she’s swabbing everywhere inside, reaching the horizons thanks to her deliciously long length of pussy-pleaser. But it’s filthy. The longer she harvests your scrumptious cunny of its [pc.girlCumFlavor] fruits, chaining together a series of miniature orgasm, the more you flood, the more grimy you feel. It’s never enough.");
		output("\n\nWet, lipsticked smooches are plastered all over the ");
		if(pc.vaginalPuffiness(y)) output("endless, plump mounds");
		else output("gentle, rolling slopes");
		output(" of your [pc.pussiesLight]. She speaks in tongues, gurgling out pleasant warbles of vaginal obsession. Your nethers shine the neon color of her lipstick, reveling in that mania-inducing tickle of a master-crafted whore’s overwhelmingly sweet lips. They’re made to suck cock, gobble up the fattest penises in the universe. Halfway through a suctiony lick, you hiss through your teeth, wondering if it’s a step down for those amazing lips to be suckling, kissing, and sweeping all along your muff’s exterior" + (pc.hasVaginas() ? "s":"") + ".");
		output("\n\nWhen you’re brought to another orgasm, you realize they were meant for doing it all. Besides, it’s not the tools a girl works with, but her innate passion. She loves eating you out. You love it, too.");
	}
	// pc Neuter
	else
	{
		output("Whilst you lack the galaxy’s preferred means of pleasurable exchange, you still have a [pc.asshole] that gets a tonguing the likes of which it never knew until you sat it on this security slut’s suckhole. Wonderful and needy lips wrap around your rim, sealing your anus in a neon blanket from which a sinuous organ thrusts through it, surprising you with eagerness. You practically whimper, helping to make its passage a little easier by shifting around, rubbing it into all those hard-to-reach corners in your backdoor. It pulls away - slobbery kisses smatter your [pc.butts] in sloppy neon lipstick before smooching your winking star and restarting the oral service.");
	}
	// merge
	output("\n\nHer none-too-quiet strokes drag you closer to her [enemy.cock]. Before you know it, she’s begun masturbating you with the efficiency of a programmed ‘bot. She knows everything about your body, and she’s intent on abusing that knowledge to its fullest, spooking closer to complete mastery of your nervous system. A ropy spurt of pre to the cheek shocks you into a wanton cry, and then a powerful throb bats her dick against your [pc.face]. A sheening smear");
	if(pc.hasScales()) output(" shines your [pc.scaleColor] scales");
	else if(pc.hasFur()) output(" soaks into your [pc.furColor] fur");
	else output(" coats your [pc.skinColor] skin");
	output(" with an off-purple blusher.");

	output("\n\nThe heat of her musk is like a wall that you crash through. It quickly fills the holes your appearance has made, molding around your drooling countenance. You become acutely aware of every outsized vein funneling blood through her ripe organ, ready to unleash a font of cum. Seemingly sentient, it nuzzles against you, aided by the helpless gyrations of fertile hips - its urgently shifting texture is otherworldly. An incomprehensible heaviness lays claim to you, dolling you up in a mindless servant’s tainted testosterone. Nose-to-glans with this ");
	if(pc.hasCock(GLOBAL.TYPE_VULPINE)) output("edifice");
	else output("monument");
	output(" to reproductive readiness, ");
	if(pc.libido() < 33) output("you steal a taste, and then another, the wonderful, maddening flavor stripping away your inhibitions");
	else if(pc.libido() < 66) output("you lay a sloppy kiss on its side, run a hand up its length, delight in the masterfully engineered pulse of a fit breeder");
	else output("you clutch it in your hands, slime it and yourself in copious pre; you kiss it, lick it - you love it");
	//bimboOrCumAddict:
	if(pc.isBimbo() && pc.isCumSlut()) output("you slobber all over it, practically sparking a fluidic war between your saliva and her self-cocooning prostate juice, seeing how much of her burgeoning mast you can shine with more spit than spooge");
	output(".");

	// vulpatra
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		output("\n\nVulpatra are a mentally gifted race, able to sway others through hypnosis. Her cock is accomplishing something similar right now, and you’d be lying if you said it didn’t give you the greatest of thrills to lick it. Your [pc.tongue] starts at the root around the bulbous frill of her knot - that deserves a kiss. Violet slime overflows, pooling on your tongue no matter what direction you start from, satisfying and refreshing to gulp down. Her thighs shudder when you swirl around her oozing taper, envelope it, suckle lubricants from it, and pull away, the gap bridged by cummy strings of concentrated arousal.");
		output("\n\nYour foxy toy’s flavor is divine. You descend once more, ");
		if(pc.isBimbo()) output("losing yourself to the fun of playing with a perfectly sized cock");
		else output("discovering the joy of working a modest penis");
		output(". Her balls are large, maybe a few inches bigger than proportional ratio, and boy do they have <b>weight.</b> They’re fun to squish, to lift, to play with - it leaves you all athrill when you figure out how best to make her squirt, especially when you dig deeper towards her molten cunt. This shortstack is packing everything, and the magma-like warmth she gives off suffuses you with purest bliss.");
		output("\n\nIt’s no surprise that you wet your [pc.lips] one more time and spread them over her angrily-aroused crown. Gradually she sinks into you; she thrusts the moment you tempt her with a blowie - and, eyes rolling back, you <b>loved</b> that.");
	}
	// laquine
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nHermaphrodite need turned vapor lingers around your weaving tongue. Corruptive tendrils of impure scent loop around your brain, snatching away any errant thought you might have that isn’t focused on slathering that horsecock in dripping-wet affection. Her pumping urethra leaks a frothy amethyst jism that enhances the flavor, a hint at the pampered lifestyle of a dedicated broodmother, and a promise of everlasting energy. Laquines are known for their naturally arousing musk, but this oversexed bunny-toy is thrusting out pheromones so thick that visible clouds form, subduing the raw, beefy taste of her cock.");
		output("\n\nAnd what a cock it is. This close you can admire the expert painting illustrating its virile potential. Much like how anyone would get a tattoo or some temporary masking done, this rabbit’s pony-mounter has been rouged in a brilliant sleeve of phallus-defining gloss, telling your [pc.lips] where to kiss, your [pc.tongue] where to lap, and your brain what parts of her meticulous masterpiece to forever remember. Equine endowments are renowned for their proud, bestial images, yet to the inspired artist responsible for this regal coating, the commonly-held standards of ‘normal’ are the root of all evil in the galaxy.");
		output("\n\nYour body flows naturally down the colored bands of dick-paint, tracing the patterns with husky breaths. Your lips firm around her medial ring, suckling at the whorishly colored halo of her accentuated anatomy. Tinted veins throb, forming dozens of depressions across your [pc.lipColor] mouthpiece; you wiggle a finger past her sheath, playing a dangerous game. The flare billows out, radiating arousal and the sensual tingle that comes from knowing that you’re correctly worshiping a dick. You slide further down to get a taste of her iridescent balls, massive spheres plumped by an ocean of pent-up laquine spunk. Applying a bit of grip strength squeezes your fingers into the tracts of her fuzzy nutsack, the pressued bulk squishing between them.");
		output("\n\nStroking her glowing tower, you lean it towards your mouth, rub it against your [pc.lipsChaste], and spread them. Gently and gradually you englove the laquine’s broad bluntness," + (flags["USED_SNAKEBYTE"] == undefined ? " holding back wincing tears as you stretch your jaw to accommodate her cum-sealing crown":" position yourself in a way to add a visceral frisson to her penetrative delight, knowing you’ll have no trouble handling this") + ". The brim of her flare folds back on your forward push, a lurid popping sound producing an orgasmic note when it achieves entry.");
		output("\n\nIt’s all yours.");
	}
	// human
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN))
	{
		output("\n\nBefore your eyes is an ivory column of girl-dick stretching to the foot-long point, fat and firm. You take hold of it, jerk your wrists until it glimmers beneath a purple coat of pent-up need. Violet pressure floods down her rod, emerging from the narrow cumslit in constant streams of slick juice. No matter how talented your rod-wrapped [pc.tongue], its volume is too great to be contained. It tastes just as good as her penis, maybe even better. What else is there to say about this goth tramp’s phallus? It’s hot and heavy, it bears a striking scent, somewhat citrusy and thick enough for a knife to carve. When it bobs, it stirs its owner’s animal musk like a sugar-enriched tea.");
		output("\n\nIt’s invigorating, and you can’t help but want to have the freshest taste. Sealing your [pc.lips] around her round crown, you slurp and suckle the warm treat from its source, blinking, sputtering, and fluttering when it reaches your stomach. Liquid anodyne soothes your tension and spurs devoted oral attention. Not long after the third cock-pleasing gulp, she’s a messy cascade of overflowing stickiness. You wear it proudly, nuzzling into her penis as if it could up and leave any moment.");
		output("\n\nHer balls capture your attention - you heft one then the other, appreciating the wobbling ripeness of her seed-factories brimming in your hand, power sources for spectacular orgasms. Lapping at the smooth and hairless surfaces is second nature. So is kissing them - several times, even. Wide thighs shuddering, the pale woman crows into your underthings a noise that can’t be interpreted as anything other than a whine for more.");
		output("\n\nPuckering your mouth into a jutting ‘o’, you ascend to her peak, smooching every inch of her sensitive tip, and open them. The that you suffer no strain inhaling this considerable girth causes tears of joy to well up in your [pc.eyes]. You can scarcely believe your luck in getting to take this on your own power, siphon its sweet bounty for yourself, and to give it a tight, wet place to burrow.");
	}
	// demon
	else
	{
		output("\n\nReverence and awe shine in either of your [pc.eyes]. Behind them lie hesitation and nervousness. It’s understandable, isn’t it. A burgundy obelisk of nubby demon dick dominates your field of view, unholy energy brimming in the many veins lacing its superlative girth. No matter how you turn your head, it captivates half your vision. Two sturdy feet, maybe more of bulging herm-cock with pre boiling from the dome. It’s so overwhelming you don’t want to touch it, though you’re not sure if it’s out of fear or respect for something greater than you.");
		output("\n\nBut you do. It smells and looks too good not to, and you’re glad you did. Only with both [pc.hands] can you ring this exotic totem, begin to pay homage to it. The nubs that liberally line the length feel rubbery to your stroking touches. Crossing them coaxes the succubi’s flexuous tongue into acts of desperate desecration. Her formidable brawn shudders when you plant your [pc.lips] to it, curl them into worshipful shapes. Kissing something has never felt so right.");
		output("\n\nYou spend longer than you’ll ever know fellating the demon doll’s engorged member, sampling its infernal majesty. The embery heat continues to surprise, raising the temperature until you sweat. Her juices cling to the roof and floor of your mouth. You drool a lot harder too, thinking it’s just all the runoff slipping down your throat. Delirium reigns here, and you feel like you’re caught in a visual orgasm, stuck in sensory ecstasy, all over the vividly sexual dick you <i>want</i> to be touch, be near.");
		output("\n\nSucking it seems impossible. There’s so much! So you turn to her balls to delay the daunting task, moving past her sheath (after fingering it a little!) to take possession of her tremendous nutsack. Her balls end up possessing you though, rumbling gratified as one of your thirsty moans trembles through them - you’ve got them pressed up to your [pc.face]. You’re not sure when that happened but again, you’re glad it did. If you thought her dick was hot, being nose-deep in her succulent ‘nads melts away the last of your restraints. Warm like afternoon sunlight on a hot beach, they roil with unspent oceans of virility necessary to give this doom cannon a purpose.");
		output("\n\nYou climb the coarse column, driven on by the ardent voice of the horned pleasure-puppet, bobbing up and down, up and down, up... and down.... The throbbing, beautiful clock glistens. You have to sit up to get to the head. Taking this could ruin your jaw. Swallowing her meat could permanently change the ways in which you breathe and eat.");
		output("\n\nYet you must. You have to. <b>You want to.</b> Your [pc.lipsChaste] spread open, and you spit yourself on that simmering cock, vocalized enjoyment fumbling up your throat.");
	}
	// merge
	// pc Can’t Deepthroat
	if(!pc.canDeepthroat()) output("\n\nWhen her [enemy.cock] presses to your palate and flattens your uvula, your body reacts instinctively. Shyly. It resists an intrusion larger than a simple meal, shutting your eyes and your windpipe. You withdraw backwards, breathing in deeply, calmly, letting the [enemy.cockHead] spurt its damning lubrication into your maw, then you try again. It goes deeper before being stopped, and you retry once more. The silky soft flesh of her cock barrels in on a hard thrust, shattering your biological barrier. Still, you have to pull back again, but this time, there’s no accompanying stab of pain when you move forward. The ease at which you take her now is something you choose to indulge in.");
	// pc Can Deepthroat
	else output("\n\nA fierce, molten blush spreads across your face when you feel her [enemy.cock] spreading your throat in addition to your jaw. The spurting [enemy.cockHead] glides over your uvula, bats your tonsils away, and plows in, bulging your neck outward. Excited, you pump her base with short, rapid jerks, masturbating more of that unspeakable bliss into your gut. In seconds your throat is saturated in her pre, soaked from the top to the band of your belly. The hot rain of ambrosia pours, softening you for the next inch, and the next, and so forth.");
	// pc SnakeByte (add-on)
	if(flags["USED_SNAKEBYTE"] != undefined) output("\n\nThe tart’s [enemy.hands] go white at the clutching touch of your ribbed throat. Inexorably she’s pulled deeper, embedded in a hole that tailor-made to wring dicks dry. How she’s not avoiding orgasm is not something you’ll know. You doubt Po has had the pleasure of introducing exotic features like these to her girls, or maybe only this one, if the reactions are anything to go by. The feeling is mutual, of course. Gulping that big mass forces your modded muscles to contract around its girth with climactic rapture.");
	// merge
	output("\n\nThe last of your control escapes your lips as a phallus-scented breath. Her skilled touches shimmy you further into the glowing canyon between her pillowy tits. They’re spraying milk, wobbling up and down to the tempo of hot, happy sex. Splashing droplets of lubricant stream down your chin. A quarter of the way. Halfway." + ((enemy.hasCock(GLOBAL.TYPE_DEMONIC) || enemy.hasCock(GLOBAL.TYPE_EQUINE)) ? " Nearly to your belly.":"") + " The herm-doll’s [enemy.cockNoun] tenses, bloating your neck with pumping intrusion. Whatever it’s pumping into your maw, making the repeat thrusts easier, wetter, more intense, molds your esophagus like a sculptor’s clay.");
	// pc Lips Get Bigger
	if(rand(3) == 0 && pc.lipMod < 3 && !enemy.hasStatusEffect("VR"))
	{
		enemy.createStatusEffect("LipGrown");
		pc.lipMod++;
		output("\n\nAnd that’s only the beginning. Every deep dip of that penis into your slickness scorches your [pc.lips]. They become your body’s newest sex organs, glowing volcanically on their shaft-gloving sweeps. Fat bubbles of slime soak into the fabric of your transfiguring mouthpiece - your [pc.lipColor] cock-pillows swell into prominence, plumping up into the kind of satin-soft cock-huggers Doctor Po’s equipped her girls with. Sealing them tight, you gurgle, swallow, and moan, putting your newly-grown suckers to the ultimate test.");
		pc.taint(1);
	}
	// merge
	output("\n\nFlitting across the [enemy.cockHead], your [pc.tongue]’s tip demonstrates your clear desire to suck cock. This is what you were supposed to avoid, but now that you’ve gotten a taste you’re in danger of getting hooked. Muffled voices in your head struggle to prevent such surrender, but would it be so bad? The way she stuffs your windpipe, forces you to clamp down on her girthy throat-swabber like a pussy in constant squirt... you have to admit, there’s something appealing about a girl who wants to fuck you this bad. A girl so hard, wanting to gush her heavy loads into your gut.");
	output("\n\nIt gets harder to ignore the noisy sucks. You start to notice, vacantly gazing down the bridge of your nose, watching ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("the fox’s tipped dong");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine’s jutting horsemeat");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("woman’s firmness");
	else output("succubus’ hefty tool");
	output(" disappear and reappear, that something’s getting wetter. It’s not pre. The flooding juice coating your lover’s penis is clear, translucent. It layers her already perfect dick in an eye catching, glimmering sheen. It’s an absolute mess of saliva - your saliva. There’s more there than you should realistically produce. Large beads of the stuff splatter outwards, obscenity embodied.");
	output("\n\nSomething about her genitalia is changing you, if only temporarily. It explains how you were so easily and quickly pressing your [pc.lips] to her crotch. The extreme overflow of moisture eliminates all tactility from your fellation, leaving a luxurious smoothness. There’s no angst, pain, any kind of struggle, only serene peace of mind in being crammed with herm-dick. It starts to taste better, more flavorful than the finest chocolates. The mind-altering chemicals seeping into your nervous system tell you that you can’t live without cock. This cock. You need more of this cock.");
	output("\n\nHuge, boiling wads blow into your throat, and they don’t have time to dribble out before they’re fucked into your belly, bolstered by successive ejaculations. How long have you been kneading her balls? Squeezing the musk-cushions fires off a thick rope into your taut channel. Rubbing them enhances the next load. Dribs and drabs of seed-infused spooge slip past the entrance to your gut, heralding the onrushing surge of steady climax. There’s no pulling off. You’re being held by the waist and dragged straight into a swampy hell. There’s a very good chance you won’t pull yourself out of it.");
	output("\n\nYou don’t care. Load upon slimy load vanishes into your belly, visceral eruptions occurring in the depths beyond your taste-buds. The incessant throb of her dick shoved balls-deep flips a trigger you didn’t know existed: the one that sets your throat to a permanent gulping loop. Not a single drop is wasted, not a single sperm cell strays, being rhythmically screwed into your oral receptacle. Every meaty flex of the sex-doll’s [enemy.cock] heightens your peaceful mood, eases your worries. You swear you can hear the blissful explosions just as keenly as you feel them, churning within your incredibly full gullet.");
	// pc Cock and Hermgasm
	if(pc.hasCock())
	{
		output("\n\nYou fire right back, globs of [pc.cum] spraying into a tight throat comparable to yours. The twitching [pc.cockHead] of your [pc.cock] inflates, jetting liquid softness as it rams the [enemy.race]’s core full of spurting nut. For a second it feels like everything you squeeze out into her convulsing throat is being creamed into your own. The slimy glaze you’ve painted her clenching muscles with assists in your shallow, jerky thrusts. The tightness in your [pc.balls] is there, but your volume never seems to diminish. Curtains of [pc.cumVisc] [pc.cumColor] jizz spool out in ribbony streamers from the corners of her cock-stuffed maw.");
		if(pc.hasVagina()) output("\n\nYou both scream when your [pc.pussiesIsAre] touched. Orgasm wells up inside it and crashes out across the bitch’s face, smearing her in an amatuer cosmetician’s cascading traceries. In what way your feminine side emits doesn’t matter. It feels good, adds to that weightless fluttering your stomach. Clenching down and cumming feels unconscionably good. So does receiving it.");
	}
	// pc Pussygasm
	else if(pc.hasVagina())
	{
		output("\n\nInexorably burning into your mind is the sparkling, gleaming ejaculation of your [pc.pussies]. Red-hot ecstasy is felt everywhere, flushing through your body in a spiral of unspeakable joy." + (pc.isSquirter() ? " [pc.GirlCum] jets from your [pc.pussiesLight] in maddening bolts, each one harder than the last. It’s never enough - you want it harder! Harder!":" Beads of [pc.girlCum] trickle from your creamy snatch, making a mess. The mischievous tongue there slurps your dripping lady-spunk obscenely, making a bigger mess. There’s always more inside you. You nearly go insane. You can’t stop cumming, and you can’t cum hard enough!") + " If you weren’t spitted on cock, you’d be gibbering for more. Alas, your plaintive whines are internalized, cries for pleasure unheard.");
		output("\n\nTo most, anyway. She meets your desires head-on, raking across flashing-red clusters of overstimulated cunt-nerves. It’s the sucks that make you whine. It feels as though the galaxy is about to disappear when you’re force-fed another spermy meal. She pulls you along, playing with the strings of your orgasm like a modern day Moirai.");
	}
	// pc Neutersomething
	else
	{
		output("\n\nIt shouldn’t be possible, but you’re cumming. Even as you’re pumped full of a debased goddess’ DNA, there’s a flushing of heat all over your body. The tongue in your [pc.asshole] never lets up, dragging frustration and tension and fear and worry and angst and every evil emotion once kept in Pandora’s Box out of yours. As her chunky treat ballons your belly with an immense offering, you’re thanking her from the bottom of your heart for a wonderful rendezvous.");
	}
	// merge
	processTime(25);
	pc.orgasm();
	if(!enemy.hasStatusEffect("VR")) pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",wills69Part3,[x,y]);
}
// Scene could get a little bit long without this ^^;;

public function wills69Part3(args:Array):void
{
	clearOutput();
	showSexDoll(true);
	author("William");

	var x:int = args[0];
	var y:int = args[1];

	output("Burping awake isn’t the most glorious way to come to. Your breath tastes like dick, and cooled citrusy sperm rests on your palate. You lick your lips unconsciously, savoring the ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpatra’s");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("bunny");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("terran’s");
	else output("demon’s");
	output(" residue. When you open your eyes, the nude security babe is lying back, still hard, still throbbing in post-coital sensitivity. Fonts of amethyst seed spray up from the unconscious slut’s dick, the same stuff that lingers in your gut.");
	output("\n\nWhen you sit up and take stock, you’re shocked that you’re okay, not even sure how you disentangled or how you avoided capture. Speaking of tangles (and migraines, point of fact), your mind is full of them, and they get worse when you stare at her dick. You shift slightly, gently masturbating, not even realizing it. You experience its power all over again, bestial lust gathering in your eyes, and it really could use a good suck. Yeah, you’re full, but it’s <i>sooo hard</i> and being cumflated isn’t a valid excuse. It could really do with another taste. Surely you can offer the sweet relief necessary to bring it down to flaccid satiety. You really must lick it at least, it needs you-");
	output("\n\nW-Wait.");
	output("\n\nShaking the sudden");
	if(pc.isBimbo() || pc.isCumSlut()) output(" and more blatant");
	output(" craving for cock from your head, you find it nearly impossible to detach yourself from the base desire for dick. It latches on like a lamprey, you just can’t shirk your innate want for mouthwateringly phallic things. Tapered, blunt, barbed, nubby, you could go for any right now. And why are you drooling so much?");
	output("\n\nSucking spittle back behind your lips, you find that you can’t stop. You stand quickly, realizing the mistake(?) you’ve made in pairing up with the sapient toy of a mad genius.");

	if(!enemy.hasStatusEffect("VR")) 
	{
		//cockGetsBigger: 
		if(x >= 0 && !enemy.hasStatusEffect("LipGrown") && rand(3) == 0 && ((pc.cocks[x].cLength() < 30 && pc.hasPerk("Hung")) || (pc.cocks[x].cLength() < 16 && pc.hasPerk("Mini")) || (pc.cocks[x].cLength() < 20 && !pc.hasPerk("Mini"))))
		{
			var growth:int = 1 + rand(2);
			if(pc.hasPerk("Hung")) growth++;
			if(pc.hasPerk("Mini")) 
			{
				growth--;
				if(growth < 1) growth = 1;
			}
			output(" The artificial gravity doesn’t feel right, and that’s because your [pc.cock] has swelled in size, becoming lengthier and girthier after a night in a very special hotel. <b>It’s grown by at least " + num2Text(growth) + " inch" + (growth != 1 ? "es":"") + ".</b>");
			pc.cocks[x].cLengthRaw += growth;
			enemy.createStatusEffect("LipGrown");
			pc.taint(2);
		}
		//pussyGetsWetter: 
		if(y >= 0 && !enemy.hasStatusEffect("LipGrown") && rand(2) == 0 && pc.vaginas[y].wetness() < 5) 
		{
			output(" You become aware of how drenched you are, a walking rainstorm of [pc.girlCumFlavor] ambrosia. Liquid flows at a greater, filthier quantity than before, and you moan like a beast in heat. Your <b>increased wetness</b> is at first worrying, but then you can’t help but think of using it to try out the herm’s dick properly. And then any other on board.");
			if(pc.vaginas[y].wetnessRaw < 4 && pc.vaginas[y].wetnessRaw+1 >= 4)
			{
				output(" <b>You’re a squirter now!</b>");
			}
			pc.vaginas[y].wetnessRaw++;
			enemy.createStatusEffect("LipGrown");
			pc.taint(1);
		}
	}
	output("\n\nAfter a cursory check of the empty creature’s belongings you try to remember your purpose here, hoping that you won’t be fighting psychoactive visions of bare and throbbing meat-sticks for for too long in your quest to rescue Kiro" + (pc.isBimbo() ? ", even if they’re everything you’ve ever wanted":"") + ".");
	//[Next] \\ Back to Game
	// sceneTag: PC cums
	// sceneTag: PC loadInMouth
	// sceneTag: Possible Spermutations~
	// sceneTag: Add 'Soak' Effect for Cock Craving
	// sceneTag: processTime
	output("\n\n");
	processTime(3*60+rand(10));
	if(!enemy.hasStatusEffect("VR")) 
	{
		if(pc.hasVagina())
		{
			new Soak().applySoak(pc);
		}
	}
	pc.orgasm();
	CombatManager.genericVictory();
}

public function loseToTheSexdoll():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	showSexDoll(true);
	author("William");
	
	//Bad End, max payout 4500 words. Needs to align with other bad ends and depictions of Miss Po.

	// The New Doll
	output("You drop to the ground unable to stop your body’s libido from responding to the explicit suggestions its received. You’re far too turned on to have a hope of resisting the ");
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) output("vulpine creature’s");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("laquine’s");
	else if(!enemy.hasCock(GLOBAL.TYPE_DEMONIC)) output("woman’s");
	else output("demon’s");
	output(" hypnotic influence any longer.");
	output("\n\nClapping her hands together, the sexdoll gleefully gloats, <i>“Yaaay! I stopped the evil intruder!”</i> Heeled feet jauntily stride closer until you can see two pairs of wiggling [enemy.toes] - the last of your " + (pc.isBimbo() ? "free will":"defiance") + " is injected into an upwards glance. <i>“Heeyy, what’s wrong? There’s no reason to be glum, cutie! We’re going to have so much fun you’ll forget all about those mean things you did! Trespassing... resisting... oooh, you’ve been super bad!”</i>");
	output("\n\nRolling her broad hips, the herm bats her [enemy.cock] to your [pc.face]. The first smacks to your cheek are loud, disciplinary, and the subsequent, lilting slaps are quiet and wet. <i>“There! I hope you enjoyed your punishment.”</i> Hefting her [enemy.cockNoun], the salacious slut rubs the [enemy.cockHead] through the glaze of slime");
	if(pc.hasFur()) output(" matting your [pc.furColor] fur");
	else output(" soaking your [pc.skinFurScales]");
	output(", riding its own violet messiness. <i>“Now we can think about fucking...”</i> Heavy ardor deepens her voice into a series of desirous husks. <i>“...How good sex feels when you get to have it...”</i> Flawless hips gyrate in a hula-hoop motion, spreading pheromones all over. <i>“...And how awesome it feels when you finally figure out what pleasure <b>reeeaaaallly</b> is,”</i> her bright eyes gleam, <i>“especially when you’ve got me to tell you all about it, [pc.raceCute]-[pc.boyGirl]!”</i>");

	// pc Lost To Vulpatra - Cutesy hypno facefucks
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE))
	{
		output("\n\nTaking another step forward, the plush, foxy teddy-bear knits her paws behind her back, tilting in reverse to thrust out more of her dripping dick for your inspection, adding a couple of inches to the undrooping spire. <i>“Doesn’t it look good?”</i> Her small tits wobble, heaving back and forth with victorious breaths. <i>“What do you think?”</i> Demonstrating its features, the vulpine shortstack wraps a hand around the base, thumb circling the pudgy knotflesh at her root. <i>“MmmMm? Weeeell?”</i> She aims the pointed crown at your [pc.lipsChaste], winding her tail around to caress your [pc.thigh]. <i>“It’s a nice cock, isn’t it?”</i>");
		// pc Libido Low <33
		if(pc.libido() < 33)
		{
			output("\n\nSummoning the last of your willpower, you turn your head to the side and shut your eyes tight, deciding against critique in favor of self-defense.");
			output("\n\nYet it’s there: her canid prick is peeking into your consciousness, occupying space it shouldn’t inhabit, impressing its feral details upon your memory. As soon as you open your eyes the taper is present in your periphery, streaming shimmery runnels of sparkle-juice. You look down too fast to stop yourself from admitting it’s not half-bad, and then its pre-coated length is there - your mind’s eye can’t avoid gazing at it. When there’s nowhere else to turn you inevitably look up and gasp, an awed sound that inhales more of the fox’s feel-good fragrance. Her perfect penis is laid on the bridge of your nose. Images of its modest shape flash all around... its glory is everywhere.");
		}
		// pc Libido Med <66
		else if(pc.libido() < 66)
		{
			output("\n\nSeeing such an achingly hard cock helps take your mind off the fact that you’re in serious danger.");
			output("\n\nOr are you? She’s got a point, you think as you closely inspect it. There’s something about her bestial phallus that’s so memorable you see it wherever you look. It slides in and out of your periphery, throbbing with potential. The fact that it’s in perfect clarity at all times arouses you. Every vein in her breeding bulb is superimposed on your thought patterns, laced by the blood-glutted arteries pumping her dick full of the iron it needs to break a bitch in half. It’s not small, but not as big as many you’ve seen, so it gets points for that. When you blink, you discover it laid over your nose, gently pulsating, gifting you with its warmth.");
			output("\n\nIt’s everywhere.");
		}
		// pc Libdo High >67
		else
		{
			output("\n\nRegardless of your position you aren’t beyond admitting that the foxy futa’s dick is something to admire.");
			output("\n\nThe hypnotic and relaxing sway of the fuzzy goddess’ succulent prick relaxes you much more than her crisp scent. It effectively traps your eyes, floating about to its owner’s whims. She taps it to your [pc.skinFurScalesNoun] and you flush with heat, feeling the touch of her amorous power. She holds it to the side, giving you ample opportunity to drink in its prodigious shape, glistened by purplish precum. Satisfied, she lays the bulk of her meat vertically upon your nose. Her pure expression lies beyond it, a big wide smile on a colorful muzzle.");
			output("\n\nHer beautiful cock is everywhere.");
		}
		// merge
		output("\n\nAnd so is she.");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Uh-huh, uh-huh, it’s a really awesome ‘n nice dick! Your Mistress has uhh... really good taste! Sooo.... Umm....");
		else if(pc.isBro()) output("It’s alright...");
		else if(pc.isNice()) output("Y-Yes, it really does look nice...");
		else if(pc.isMischievous()) output("Can’t say I’ve seen any better...");
		else output("Yeah...");
		output("”</i> you answer, cottony fuzz swaddling your brain.");
		output("\n\n<i>“Ehehe,”</i> the vulpatra giggles. Her fluffball antenna bobs excitedly. <i>“I love getting compliments! Mistress told me I shouldn’t beg or fish for them, but it makes me so happy!”</i> The most innocent of child-like gazes fills every vacant space in your mental channels. <i>“You know what I think? I think you’re super");
		if(pc.isFemboy()) output(" adorable! You look so fragile and delicate, just like one of my sisters who was here a while ago. I bet people love calling you cute!");
		else if(pc.mf("m","") == "m") output(" handsome! I doubt there’s any girl who wouldn’t swoon for a hunky guy like you!");
		else output(" sweet! Guys everywhere, and even other girls must be tripping over each other just to get nearer to a pretty young sweetheart like you!");
		output("”</i> Strobing eyes rove across your body, telepathically igniting the places they linger.");
		if(!pc.isNude()) output(" When she asks you to shuck your clothes you do so without thinking. They were getting in the way of that natural charm you’re so happy was noticed.");
		output("\n\nHer heavenly voice contains no contempt. It’s simply kind, absent any ulterior motive as it speaks beneficence directly to your linked synapses. When you sink into her brilliant eyes and get that little, glinting wink, you hum contentedly, becoming less capable of applying things like logic and reason. Every instinct you’ve got is telling you that she’s a friend - how could she have been your enemy? What were you even doing here? <i>“Hey, don’t get all dreamy yet! We haven’t even gotten started!”</i> A big paw sets to scratching the side of your [pc.hairNoun], another vector for pleasant sensory input. <i>“Mistress is gonna be thrilled to see you. I can’t wait for you to get introduced - she’s amazingly kind, you’ll like her!”</i>");
		output("\n\n<i>“Mistress?”</i> you ask.");
		output("\n\n<i>“Yep!”</i> trills the vivacious vixen. <i>“<b>Our</b> Mistress is gonna be busy for a while, but she told me to get you ready. It looks like you wanna get ready too, and I’m never wrong about sexy things! Now, just listen to me; I’ll be sad if you don’t pay attention.”</i> The [enemy.eyeColor] eyes above wince in feigned sadness, afflicting you with a fleeting guilt. Of course you’ll pay attention! <i>“You’ll keep your eyes on me, won’t you? I love when you look at me that way, it makes me sooo happy!”</i>");
		output("\n\nMeeting at the enthusiastic shortstack’s smirk, you draw a blank on everything that <i>isn’t</i> the vulpine cherub. <i>She’s radiant.</i> There’s no possible way that she could lie to or wish harm upon you, so of course you listen, never speak out of turn. A little nod from her and you’re moving to the gesture, setting your hands into the forgiving tracts of her huge thighs, happy to confirm that she feels as well as she looks: celestially soft. <i>“Mmm, I like that face... you’re so open to me!”</i> Every strand shines, bleeding contrast on the edges of her limbs. A rainbow-colored dopamine hit floods endorphins through your system when she pats you on the head. <i>“Now, stop thinking... it’s time for you to start listening to me, and when I’m done your body will handle everything. Promise.”</i>");
		output("\n\n<i>“Look,”</i> she pats her groin, <i>“look at my cock.”</i>");
		output("\n\nTiny whispers once irritating fade into non-existence when you ogle her cock, letting out an unrestrained moan as you realize how much heat has built up inside you. The plump edifice to sensuality strokes you a little faster, imparting a soothing bliss through absolute control. <i>“Do you feel how good <b>my hard cock</b> is making you?”</i> Your erogenous places become more sensitive, more tender every single time her juicy dick re-enters your sight, thudding on your temple. <i>“It’s making you feel super hot" + (pc.hasVagina() ? " and wet":"") + " and compliant. The more you gawk at <b>my cock</b> the more amazing it gets. Nothing feels better than seeing a penis that needs to be sucked and just... letting it happen.”</i>");
		output("\n\nShe giggles; you realize that she is entirely right. <i>“Do you wanna suck it?”</i>\n\nYou bite your [pc.lipsChaste] to hold back a curtain of drool, acknowledging the question with a hard stare.\n\n<i>“You could totally lick it right now. It’s sooo stiff and full.”</i>");//Fen note. Added PGs!
		output("\n\nYou still haven’t been told...");
		output("\n\n<i>“Ooh, you’re a really patient [pc.boyGirl]! I bet you think I’m teasing. Everyone thinks foxes are mischievous!”</i> She perks up, latching her free mit to your head and nosing her flexing fuckstick to your [pc.lips]. <i>“You get to suck me until Mistress is ready, but don’t you go cumming without permission ‘kay?”</i>");
		output("\n\nThe sweet odor of herm-cock strengthens when the alien doll gently bucks her hips, wriggling her sloping hips for easier insertion. A hefty dollop of pleasure explodes in your mouth, and you melt into her crotch, embracing your very obvious innate love for dick and the blissful cum-drunk high that accompanies it. A laugh gurgles up from your throat, trembling through the bloated [enemy.cockNoun] miring between two cheeks that wetly slurp at its girthy broadsides. You suck hard, pulling her prick deeper until your [pc.lips] are pressured by the arrival of her knot, swollen for its singular purpose of rut.");
		output("\n\n<i>“Yeesss... use your tongue too. Penises need plenty of licking.”</i> Her wrists reverse your direction, loosening your [pc.tongue] so that it can get to work sweeping over her shaft, instantly discovering the places that make her scream with delight. <i>“Oh woah, you really knew where to l-look! Ooh... Mistress might get disappointed if I cum so soon!”</i> Eager laps to the gooey flanks provoke squirts of high-pitched expression while urethral massages steadily coax thick flows of throat-glaze." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " Fortunately, your oral capabilities are made to surpass expectations. Deploying the full length of your phallic-pleasing organ, you curl around both of the shortstack’s fuzzy nuts, sweeping across the weighty diameters to taste the aged juices clinging there. You go even further, lapping at her clit and freshly-dribbling pussy to enhance the flavor of her tender flesh.":"") + " <i>“You like how I taste, don’t you? Sucking dick is sooo much fun, isn’t it?”</i>");
		output("\n\nYour answer comes in the form of a submissive whine plugged by her smooth entry into your throat");
		if(!pc.canDeepthroat()) output(", her passions so vigorous that your gag reflex never bothered to act");
		else output(". Hopefully she’s impressed that you don’t have a gag reflex");
		output("! The fruit-flavored fur of her abdominals tickles your flared nostrils as tendrils of pregasm test your gullet’s efficiency. Inundated by her endless desires, you clench down on that hypnotic mass, begging to be pumped full of jizz, reveling in the solid lump bulging the taut length of your throat. <i>“Ah! Like that, like that! I can tell you love sucking cock! You’re gonna fit in soooo... sooo... mmm... well...”</i>");
		output("\n\nJutting vulpine titties slap together as they’re jiggled forcefully by the aggressive thrusting of bottom-heavy hips. You no longer hear the words she’s speaking, not physically anyway. They’re felt inside, delivered by the shuddering impacts of her husky haunches. She asks if you love sucking dick, and you say yes - a thousand times fucking <i>yes.</i> She asks if you’re aroused and want to cum, and you say yes, and you know you can’t until she allows it. The questionnaire ends with your mind emptied, nothing left inside to worry about except how you’re going to get rewarded.");
		output("\n\n<i>“You’re so lucky!”</i> squeals the furiously pumping vulpatra. <i>“Here... here with us you won’t ever get hurt... you’ll get to be taken care of... and Mistress will do all the thinking while we work on having fun!”</i> Subject to the busty vixen’s whims, you believe it all. Your mind drifts across the sea of pleasure she’s screwed into you, sinking into a bottomless space of infinite pleasure, obscured under a weight she kindly lifted from you.");
		output("\n\n<i>“MMmhaaaaaah!”</i> Her ‘ah’s erupt in tones of booming playfulness, and you know you’d be making those same sounds if she was fucking your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.asshole]") + ". Nothing feels better than having her [enemy.cock] nestle its slippery-wet inches deep into you. <i>“You’re so ready! Come on, it’s time to cum! Let it ahh... alllll... aaaahlllll goo!”</i> Her soaked nutsack swings forwards, where its fat bulk baps your chin. <i>“Yes! Yes!”</i>");
		output("\n\nHaving your mouth claimed by the vulpatra and stuffed to full dilation");
		if(pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) output(" should have triggered your orgasm by now, but you’ve been conditioned to withhold, to dance on that edge with her until you’re granted release");
		else output(" shouldn’t feel this good, yet your throat has been changed, not only stretched into a fitting sleeve for big cocks, but made into a new erogenous zone");
		output(". Utterly filthy sounds stroke your [pc.ears] when her knot rams past your [pc.lips], ensuring no drop is wasted outside of this ship’s newest pleasure toy. <i>“Cuuum!”</i>");
		output("\n\nMusky excess spurts into your busily working maw, rich torrents of seed depositing into your throat, tied by a breeder’s seal of approval and gripped firmly in place by two animal paws. Her eyes shut tight in an act of sensory deprivation, magnifying the intense orgasm she dumps into your stomach. Its warmth already sets about to changing you: adding fullness to your lips, fattening the curves of your lower frame. It does that and more while engorging your abdomen into a cummy sphere of submission.");
		if(pc.isHerm()) output(" Your shameless climax jets along with hers: discharges of [pc.cum] and [pc.girlCum] emit in equal volume, dimpling your [pc.skinFurScalesNoun] from the throbbing intensity.");
		else if(pc.hasVagina()) output(" For your part, you cum on command, matching emissions of [pc.girlCum] to the dong-distending bursts of herm-jizz. Aftershocks flutter across your loins, dragging you into ecstatic mania.");
		else if(pc.hasCock()) output(" As waves of hermaphroditic desire wash into you, hot need surges from your [pc.cocks]. [pc.Cum] detonates with fiery intensity, launching with such force as to smash into the vulpatra’s nethers.");
		else output(" Your eyes close too, to savor the sensations of orgasm without expression. Hot need washes through you, over you, and flushes. It does this on a loop that’s timed to the rhythmic ejaculation of herm-spooge.");
		output("\n\nYour quickly lose your presence of mind - she does too.");
		output("\n\nBut not before you memorize one thing by rote: that you cum obediently on command.");
		output("\n\nThe fennec goblin’s felicitations are on endless replay.");
		//load in mouth. 1x cummy.
		processTime(45);
		if(!enemy.hasStatusEffect("VR")) pc.loadInMouth(enemy);
		pc.orgasm();
	}
	// pc Lost To Laquine - Dommy wall banging
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\n<i>“Why don’t you get acquainted with my dick?”</i> the beauteous bunny coos, hefting her equine weapon by its prepuce and helicoptering it inches from your nose. <i>“Mine is Mistress’ bestest and prettiest! Look at how it <b>glows!</b>”</i> The continuous, impassioned bob of the laquine doll’s obscene boner is impossible to look away from. Her dazzling dong thwacks you in the [pc.face] repeatedly, swinging back and forth to the overwhelming sways of sparkly hips. <i>“C’mon, make sure you look carefully, right at the tip!”</i>");
		output("\n\nTurning away from her turgid length only elicits another giggle and none-too-quiet slap of slimy dickskin to your [pc.skinFurScales], and the time you spend avoiding the fuck-puppet’s firmness decreases while the time you spend ogling it <i>increases.</i> Whatever nefarious chemical imbuing her slurry-thick precum is slathering your nervous system in rivulets of libidinous moisture, quelling your defiance, bringing you to a pliable, sopping-wet state, aching with unnatural need.");
		if(pc.isBimbo()) output("\n\nIf she hadn’t been asserting for so long, you would have looked sooner anyways!");
		else output("\n\nFinally, you look to the source of your heat.");
		output("\n\nStaring back at you are two pastel swirls drawn upon the twinned surfaces of her blunt glans’ ridges, a pair of hypnotic eyes. They begin to spin - no, wait, <b>your head</b> spins!");
		if(pc.isBimbo()) output(" It’s mouthwatering, more than the potent scent makes it out to be, and you start to drool uncontrollably.");
		else output(" The sight and dizzying scent of her potent phallus makes your mouth water. A thin line of drool trickles from your [pc.lipsChaste].");
		output(" The slightest inhalations of her genital odor blur the hues of that luminous mass into eye-searing rays of phallic iridescence. The small details of her throbbing lighthouse disappear under the incredible light source her horse-shaft has transformed into. Your [pc.eyes] are tracking it everywhere it travels, examining it to an obsessive degree.");
		output("\n\nLaquines are born breeders, equipped with the proudest dicks. The one in front of you, pulsing manically with pleasure, is no ordinary bunny-bat. The artist responsible for dolling up this rabbit’s dick in pure, captivating <i>appeal</i> wanted everyone to know the glory and importance of not just cock, but of laquine cock. Seeing your reflection in the veiny beast’s gloss makes you gasp in awe. It shines under its flow of lubricating sugar, a hypnotizing monument to ultimate pleasure and relentless propagation.");
		output("\n\nYou never really noticed just how awesome it looks until it was <i>right there.</i>");
		output("\n\n<i>“Mmm, lookie here, [pc.raceCute].”</i> One of the pink rabbit’s paws falls to her heavy painted balls, sloshing with the roil of a spermy ocean. When she lifts one of her ripe nuts, the other sags powerfully. <i>“Look at my big... fat... <b>balls!</b>”</i> The last word leaves her plump-lipped snout in a lascivious drawl. <i>“Check it out! My fingers are sinking in, ‘cuz there’s sooooooooo muuuuuuch cuuuummm... mmmffhehehe.”</i> Lustly lapine cheeks moan delight above you, heralding the arrival of her other hand. Kneading the wobbling spheres with eagerly-rubbing palms, she twitches out another columnar rope of spooge that dirties your [pc.hairNoun], tilting her head and presenting the vastness of her testicular heath.");
		output("\n\n<i>“Don’t you just want to bury your face right there and <b>huff?</b>”</i> she lewdly intones, sucking for air as she does. <i>“Tell you what.”</i> Interestingly, she lifts her cock, as if spreading a leg in invitation. <i>“You take a nice whiff ‘n give my nuts a kiss, and I’ll bang you to pieces with my dick.”</i> Juicy-sounding masturbations alert you to her impromptu fapping, and you stare at it longingly. <i>“Wouldn’t it feel so good inside? Just looking’s gotta get boring after a while, right? Dick is awesome, <b>especially</b> when it’s working!... or getting worked.”</i> Her eyes visibly struggle not to roll back, pebbles of saliva raining down from her muzzle.");
		output("\n\n<i>“Just admit it. Everyone wants dick, and I can see it in your [pc.eyes], babe!”</i> A tremble ripples through her muscle-bound thighs. <i>“Mmff... don’t keep me waiting. Admit it. You love dick.”</i> She squirts from both her sexes. <i>“And you love mine the most. You want this crammed into you, stuffing you so stupid that you forget all about things like thinking ‘n fighting...”</i> Her spell of cocknosis is nearly complete. You’ve narrowed the distance, feeling ribbons of off-purple lust pulse out, shellacking your cheeks. <i>“You <b>love</b> cock. You love <b>my cock.</b>”</i>");
		output("\n\n<i>“And you can have it all to yourself, sweetie.”</i>");
		output("\n\nIt becomes instantly dark when you barrel forward, nostrils flared, into the laquine’s eggs. The flopping impact of her breed-tower is felt smacking into your skull from above, resting eighteen inches of dribbling bunny-cock");
		if(pc.hasEmoteEars()) output(" between your [pc.ears]");
		else output(" on your [pc.hairNoun]");
		output(". At the molten epicenter of her manhood, you tilt your head up and <i>breathe,</i> deeply. Musk indescribable scours through your body, dominant and compelling. The change from complete wrongness to total rightness is felt instantly, and it rocks the very foundations of your world.");
		output("\n\nSomething thick and warm brushes against your [pc.skinFurScales], but you don’t care to find out what. You devote your [pc.tongue] to nut worship, painting your own color across the bunny’s bulging balls. She proves herself an energetic partner, actively thumping her crotch to your face, smearing you in ballsweat. Sucking the flavorful tang from her nutfuzz, you proceed to lay a series of vacuuming kisses along the enlarged diameters of her spunk-stash. Fondling them is the most natural act, and you do so dutifully, polishing the most valuable jewels in the known galaxy.");
		output("\n\n<i>“I knew you’d like that taste, and that smell!”</i> She grips you ");
		if(pc.horns > 0 && pc.hornLength > 3 && pc.hornType != GLOBAL.TYPE_HUMAN) output("by the horn");
		else if(pc.hasLongEars()) output("the ear");
		else if(pc.hairStyle == "ponytail" && pc.hairLength >= 5) output("the ponytail");
		else if(pc.hairStyle == "twintails" && pc.hairLength >= 5) output("a twintail");
		else output("the head");
		output(", directing your vision heavensward - you can’t resist lapping at her undergirth along the way. <i>“Ready to service me properly? Want to get this fat, yummy cock inside you?”</i>");
		output("\n\nYou nod");
		if(pc.isHerm()) output(" suddenly realizing how hard and wet you’ve gotten.");
		else if(pc.hasVagina()) output(" blushing when you realize how swampy your [pc.pussiesLightIsAre].");
		else if(pc.hasCock()) output(" wheeling a few fingers across the unflappable length of your erect [pc.cocksLight].");
		else output(" hoping she enjoys using an [pc.asshole] if not your [pc.lips].");
		// pc Wearing Clothes
		if(!pc.isNude()) output("\n\nSimpering, the happy hare orders, <i>“Get naked then. Keep licking my nuts. And don’t you dare cum before you’re told!”</i> It’s a difficult task but you’re adaptive; you <i>were</i> bred to inherit a company. Shimmying out of your gear and throwing it all aside is made a bit easier when she smothers your face in her juicy sack, freeing your flailing hands to go about their important business. By the time you’re in the nude, suffocating on a mindless laquine’s ballmusk, you wonder where exactly you’re going to get stuffed.");
		// merge
		output("\n\nStrong hands grip you by the shoulders, dragging you up into the sloppiest kiss ever smashed into your jaw. Her tongue is as endowed as her cock, nimbly arresting yours in a spit-slick grip, tying your mouth muscle as it would a cherry stem. The passage of time ceases to be a part of your perceptions while she makes out with you, humps you so hard that she paints your torso in pre. Just like you, the hunny-bunny’s glorying in the delight of rough lovemaking.");
		output("\n\nThe kiss breaks; your lips part. <i>“Mmmm... you have NO idea how lucky you are. Mistress is gonna show you how wonderful it’ll be... being here. The galaxy is cold, but my cock’s warm. It’s hot!”</i> Boy, is it ever! The second she starts plowing the field of her choice, you’ll melt all around it. <i>“And it’s going inside you.”</i> She leans back from your [pc.ear] and whirls you around.");
		output("\n\nYour arms save your [pc.face] from being formally introduced to the hull of the ship. From behind, the slut-bun grinds her pelvis into your [pc.butts], whacking her wand into your [pc.thighs] in a spurting assault, lubricating you in lust-made-liquid, burningly hot. A pink paw careens through the air as you find the motivation to peek in reverse, cracking off your [pc.ass] hard enough to make your [pc.knees] buckle. All the little shudders help her cock nestle into the enclosure of your rear cleavage.");
		// pc Herm or Pussy
		if(pc.hasVagina())
		{
			output("\n\nNo warning is given when the stud-bunny ravages");
			if(pc.hasVaginas()) output(" whichever pussy her cock nudges into");
			else output(" your [pc.pussy]");
			output(". Her insertion is positively vicious, intended to obliterate your mind with a sensory riot and crater your gushing cunny. There’s no time to moan or scream, only slacken in complete awe that you’ve been wantonly claimed by the greatest penis of all time. Nearly two-feet of thick dick strums the most powerful nerves in your channel, filling the air with the lurid squishing sounds of a bitch being dicked deeper than anyone else has ever gone.");
			if(!enemy.hasStatusEffect("VR")) pc.cuntChange(0,enemy.cockVolume(0));
			output("\n\nYour vagina erupts, fountaining ecstasy when the Easter rabbit’s bouncy nuts clap into your [pc.clits]. You can’t imagine living any other way than being stuffed so full of cock and spilling fragrant juices upon it. Total rapture. There’s no need to take action when you’re being filled and held in the embrace of a blissful emissary. Weighty hips designed to take and give as many babies as possible crash into your waist, generating an orbital wobble that feeds into her raucously rocking ballsack. That too displays a desire to fuck you, in its own way.");
			output("\n\nThe flare of her horse cock is outlined" + (!pc.isPregnant() ? " against your [pc.belly]":" against your crotch") + ", driving incandescent ecstasy into your [pc.vaginaColor] sex. You’re a font of pure pleasure, tensing and clenching down a " + (!pc.isPregnant() ? "womb-breaking":"cervix-battering") + " beast of a phallus. Whatever corruptive chemicals lace the electric lashes of her cummy spurts made the task of molding you into a perfect cocksheathe trivial. It was almost too easy for her.");
			output("\n\nAnother heavy-handed strike rebounds off your ass, and the tightening up of your glistening tunnel savages her, reducing her gushing onslaught to a series of jerky, less capable thrusts. Every muscle in that rabbit’s body is devoted to fucking you, there can be no greater joy. It’s so perfect. And it gets better: gripping you by the [pc.hips], the frantic rabbit hauls forward and pins you so firmly into the wall that you’ll definitely leave an outline of smut. More vigorously than ever, she screws you. She screws you <i>so fucking hard</i> that you can’t believe sex like this was one submission away.");
		}
		// pc Cock or Neuter
		else
		{
			output("\n\nYou’re pretty sure you’re not a holo-star, but that thought is annihilated when your [pc.asshole] is violated by the radial brim of a laquine’s flaring pole. You’re also pretty sure you weren’t given permission to cum, but the mind-breaking ease of insertion forces it." + (pc.hasCock() ? " [pc.CumColor] [pc.cumNoun] bursts out in streamers of wall-splattering reactivity.":"") + " A palm comes to rest on your [pc.hip] when your anal capacity is tested in after slimy inch of hole-starved penis. Already you begin to bulge and squirm around the monstrous member judging you a fit cock-socket.");
			if(!enemy.hasStatusEffect("VR")) pc.buttChange(enemy.cockVolume(0));
			output("\n\nA slight smile curves the corner of your mouth when she starts thrusting, incessantly, insistently, totally lost to passion. Powerful sphincter muscles milk long flows of soothing, tainted balm from the bunny’s dick. Vocal excitement at odds with the physical cacophony of a brutal reaming creep into your subconscious: you’re being fucked in the ass by a pent-up sex-doll, a nameless creature formed to her owner’s whims, and fucking loving it.");
			output("\n\nJust as she was turned to the form her Mistress desired, so are you. You experience the sublimeness of riding the epic mass of her intestinal spear, feeling fluids channeling up in directions your inner workings weren’t built to comprehend. Precum spills into your stomach from the wrong direction, successive blasts of frothy ejaculate screwed vigorously into your packed innards.");
			output("\n\nCurrents of ecstasy trigger a constant loop of " + (pc.isFemboy() ? "boy-hole":"anal") + " clenchings that reciprocate the ravaging you’ve endured. Another burning handprint tattoos your heiny with the flashing-red reminder of total authority. There’s only you being fucked, climbing to the next orgasm, and the next, and being thrust so firmly into the hull of the ship that you’re sure to leave an outline. It doesn’t simply feel heavenly, it feels <i>right.</i> It feels <i>so right</i> to be the fucktoy for a fucktoy.");
		}
		// merge
		output("\n\n<i>“Here I come, I’m gonna cum so hard! And you’re gonna love it! I can hear it in your voice, [pc.raceCute]-[pc.boyGirl]!”</i> You’re content to sit there, let her rail you into the [pc.raceShort]-shaped mold of her amazing cock. It really is the best fucking dick ever. Designer-brand shit is often overpriced and gaudy, purchased for the social credit imparted by some antiquated geriatric’s name and title. But this bunny, whose natural capabilities have been augmented by sexy science... Void, she fucks like a dream. You’re sure you’re gonna be trying out so many other dicks here later, but you’ll never forget how this one works.");
		output("\n\nAnd you’ll never forget this time as you take its load. <i>“Cum!”</i> she shouts.");
		output("\n\nYour eyes roll back under their fluttering lids as all control is wrested from your spasming body. ");
		if(pc.isHerm()) output("Girlhoney squirts from your [pc.pussies], showering the excited phallus of your adroit partner. The first titanic blast of her orgasm triggers your sympathetic spurting response, and so [pc.cum] explodes out of your [pc.cockHeads].");
		else if(pc.hasVagina()) output(" [pc.GirlCum] squirts" + (!pc.isSquirter() ? " - you didn’t know you squirted, but now you do, and you can’t wait to feel it again -":",") + " slathering the excited phallus of your leporine partner in torrential ladyspooge. You’re a fountain of wetness, fucked into a million pieces by a wrecking ball in fuzzy lapine form.");
		else if(pc.hasCock()) output(" The first titanic blast of bunny-cum into your guts plasters your prostate in enough scalding stimulation to kick off your wall-drenching orgasm.");
		else output(" Orgasm shouldn’t be possible without a means to display it, express it... but you’re undergoing it. You’re quaking in the strong arms of manifest bliss.");
		output(" The earmarked slut doesn’t relent, slamming you so full of nut that you can hear the gurgle of her big sticky balls pressed firm against your soaked thighs. They rise, clench, lower, and contract again, flinging out an orgasm");
		if(pc.hasVagina()) output(" you’d swear was the very blessing of Easter season ejaculating" + (!pc.isPregnant() ? " into your unoccupied womb":" against your occupied womb"));
		else output(" that bastes you thoroughly");
		output(". Climax barrels forwards, flooding every nook and cranny of your body.");
		output("\n\nThen she’s at it again. You would drop to the ground if she wasn’t pinioning you to the wall, clutching your spunk-rounded gut and squeezing flumes of excess back into her crotch. It’s the most obscene thing you’ve ever felt, having cum pumped into you and out of you in all the same muscular shocks. Her flare does absolutely nothing to seal it in, and honestly that’s probably not even why she has one. It feels great as an extra stimulus though, touching places not yet claimed by the tireless hermaphrodite’s desperate strides.");
		output("\n\nYou will never be able to comprehend the sheer mania that consumes you, because every minute is an eternity of feral sex that seizes you from every angle and opens your mind to the astonishing possibilities capable through mindless depravity.");
		if(silly) output("\n\nFuck, laquines are just the best. - William.");
		//load in cunt if haspuss, else ass.
		//1 cum.
		processTime(45);
		if(!enemy.hasStatusEffect("VR")) 
		{
			if(pc.hasVagina()) pc.loadInCunt(enemy,0);
			else pc.loadInAss(enemy);
		}
		pc.orgasm();
	}
	// pc Lost To Terran - Powerful sexy sixty-nining
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN))
	{
		output("\n\nSlender fingers roughly grip your jaw, angling your [pc.face] upwards into the gothic sex-doll’s vivid stare. Lips of luscious onyx texture curl into a sweet smile. She’s looking at you like you’re the most beautiful [pc.boyGirl] in the whole universe, softly stroking your flushing cheeks as she hums a little song. You open your mouth to speak, yet the flop of her foot-long cock onto your [pc.lipsChaste] silences your words into a hot puff of desire that stimulates her instead. The whisper travels down her undergirth to a pair of softly pulsing nuts pressed firm into your chin.");
		output("\n\n<i>“You don’t have permission to speak, my sexy little intruder. Mistress wasn’t happy when she told me to stop you.”</i> Her serpentine tone weaves as strongly as her heavy hips, grinding an ivory pillar of human dick over the breadth of your [pc.face]. Your captor’s smooth slab of meat smears amethyst prejizz across your softening features; the touch of your [pc.lipsChaste] elicits a keening cry of delight that quiets into a sultry purr. <i>“");
		//pcLips<2: 
		if(pc.lipRating() < 2) output("Oh how cute! And frail. After you suck my cock, those promising lips will grow into real penis pleasers. Mark my words, [pc.raceCute].");
		else if(pc.lipRating() < 4) output("Mmm, with a little improvement, those pretty lips of yours will certainly meet Mistress’ approval. After you take my load, you’ll be a fine cock-sucker.");
		else output("Even without Mistress’ touch, your lips are a treasure... hmhm. Clearly, you were meant to be here. You were meant to serve ecstatically - to be owned! Why else would a darling like you have the lips of an earmarked whore?");
		output("”</i>");
		output("\n\nThe security slut’s dick is big enough that it slightly bows under its own girthy weight, leaking a sexual cornucopia that rapidly absorbs into your [pc.skinFurScales]. Beneath the fervor-dilated urethra is a taut, hairless nutsack, stretched by two fat, hyper-productive testicles programmed for minimal refractory and maximum siring. Underlying the hermaphrodite’s male musk are the perfumed notes of aromatic cunt, intermingling. Her pussy’s existence is affirmed by the crystal-clear cables of feminine nectar tethering it to the deck in a puddle expanding towards your [pc.thighs].");
		// pc Wearing Clothes
		if(!pc.isNude()) 
		{
			output("\n\n<i>“No, this won’t do,”</i> simpers the curvesome goddess, picking at your kit as if it were a peasant’s refuse. <i>“Remove these from your body.”</i> She grins, mashing a wiggling foot to your groin. <i>“Now. We don’t have all day, babe.”</i>");
			output("\n\nUnwilling to provoke any punitive measures you set about the surprisingly difficult task of undressing. She keeps your head locked in place so that the moistened length of her glazed cock can stroke you further. Her irresistible pheromones are powerful enough to be classified as a chemical weapon. There’s a lot of uncertainty when you feel your [pc.arms] stop moving - the task is complete, but for the longest time you sat there in the nude, wanting so badly for this woman to use you.");
			output("\n\nSnagging toes tease your exposed pelvis, the woman above not even deigning to look at what you may have. ");
			if(pc.hasCock()) output("Caught between an abdomen and a sole, your [pc.cocks] swell up, liquid iron coursing to your groin. <i>“Lovely penis" + (pc.hasCocks() ? "es":"") + ". Very lovely. Show me how big " + (!pc.hasCocks() ? "it gets":"they get") + ", cutie.”</i>");
			else if(pc.hasVagina()) output("<i>“Ooh... you’re missing your cock.”</i> The ball of her foot twists against your [pc.clits]. <i>“Oh well, when there’s no main, the sides will have to do.”</i>");
			else output("A series of fleshy plaps to your crotch grow into tense explorations. Very clearly perturbed, she finally breaks eyesight and looks down in shock. <i>“Nothing? You poor, poor creature. Nothing whatsoever to feel pleasure with, except when stuffed between another’s legs. Mistress will fix that. But not before I prepare you.”</i>");
		}
		// pc Not Wearing Clothes
		else
		{
			output("\n\n<i>“You’re beautiful.”</i> Further thought is impossible when your appearance is complimented, when your shoulders are caressed by feathery fingers. <i>“You know it’s true. That’s why you wander naked. It’d be a crime to cover up a " + (pc.mf("stud","sweet thing")) + " like you. This limberness,”</i> she grips your arm, <i>“this softness,”</i> she squeezes your cheek, <i>“you’re breathtaking, babe. Can you feel how hard you’re making me?”</i>");
			output("\n\nA wriggling foot mashes into your groin, ");
			if(pc.hasCock()) output("snatching [pc.oneCock] between two playful toes. <i>“Penises should never be hidden. They deserve to be seen, to grow fat, to stay hot and ready. The galaxy is at its mercy.”</i>");
			else if(pc.hasVagina()) output("jamming a set of wriggling toes into [pc.onePussy]. <i>“A vagina isn’t enough though. It’s not perfection. Mistress will help you, once you’re ready. You’ll see how beautiful you can become.”</i>");
			else output("a grotesque expression darkening her self-satisfied pallor. <i>“But this is disgusting. It’s wrong! No cock, and not even a pussy. Your pleasure comes only from what you feel serving at the feet of others. But we’ll help you. Mistress can fix this, and show you a world you’ve never known. Congratulations on finding an owner who <b>really</b> cares.”</i>");
		}
		// merge
		output("\n\nArching back, the pale sentry sighs contentedly, running a hand through the cloud of her hair, throwing the groomed curls around in an attractive motion of raw sex appeal. Bosom heaving, cock jerking, and ass wobbling, the puffy-nippled slut wraps a leg around your back, further impressing the shape of her turgid tool on your brain. You shut your eyes to avoid the sting of her pre. One single misstep and all that supple weight will collapse atop you. <i>“Feel like fucking yet?”</i>");
		output("\n\nShe groans and rolls her shoulders. <i>“You’ve been staring at my cock so intensely!”</i> Her ghostly face glows with excitement. The sexpuppet tilts her head and humps your face; her sack drags across your brow and reverses, shuddering from the potent rush of dominance. An expression of genuine care gazes down. <i>“Doesn’t matter if you’re not, though.”</i> Tittering giggles wrap around your spine as the fat head of her pole traces your [pc.lips].");
		output("\n\nYour [pc.tongue] flitters out and her flavor splashes your taste buds. You lose yourself then and there, forgetting to remember to resist or show an inkling of defiance. Her unforgiving hand clenches further on your scalp. Pleasure hisses through her pearly teeth, an audible reward for a job you’re doing well. Her soothing musk invades your nostrils when the narrow slit on her dome throbs upwards, presenting the underside for shameless and sloppy kisses. It’s not the least bit surprising that the porcelain flesh of her phallus is as silky smooth as the rest of her - when did you start holding her thighs?");
		output("\n\nAfter wetting your [pc.lipsChaste] in an ample amount of saliva, you prepare to take her. Yet that clean-cut cock has other ideas. Pivoting liquidly and bucking forward all at once, the masterful dancer sockets her polished bulb between your cheeks as her weight carries you to the ground, turning what was simple fellatio into a filthy sixty-nine." + (pc.isTaur() ? " Well it would, if she could reach your ‘tauric hindquarters.":""));
		output("\n\nThe tactile joy of being buried under a plush, wobbly ass massages away the slight physical pains of your descent. Pre-oozing herm-cock is shoved to the root in your " + (!pc.canDeepthroat() ? "gagging, sputtering":"accepting") + " maw, a masturbatorium customized for angelic boners. Your nose nestles into the ripe hills of her nutsack, ensuring the only air you breathe is that of your Mistress’ pet.");
		output("\n\nPet... that’s what you are now, or at least you will be. After leaning into a face-fucking position, the dick-toting goth screws your face in long, sensuous thumps. The brawn of her spurting penis quakes powerfully in the clenching embrace of an esophagus");
		if(!pc.canDeepthroat()) output(" that begrudgingly adapts to an insertion that would be uncomfortable in any other situation");
		else output(" built for sucking down the meatiest members out there. Slime-glazed walls mold eagerly to their newest visitor, offering hot, wet comfort in a tight and special place");
		output(". Having her bulgy balls slapping wetly into your nose only enhances the joy of being trapped under a tramp. Her pussy is there, too, but you can do little more than visually appreciate it.");
		output("\n\nWhen it squirts, graphically, it’s an optic explosion that spins your head. Her ankles crisscross-lock around your neck, thighs squeezing on your cheeks.");
		output("\n\nImpatient lust boils down your gullet, pumping vigorously into your vice-like neck. The distance your [pc.lips] travel from her bloated tip to her pubic mound narrows. At the nadir of her gooey thrusts you take a huge, sucking gulp of air, urging her to slam into you. When she savages you with a bitch’s rightful reward. The corners of your lips quirk into a taut, teasing smile. All you can think of doing is kissing her crotch, nursing her cumvein, and when you’re not doing that, keeping your eyes from rolling back when your inner walls throb for their conqueror.");
		// pc Herm or Cock (and is not taur)
		if(pc.hasCock() && !pc.isTaur())
		{
			output("\n\nShe has complete control. Your [pc.cocksLightIsAre] given the same attention, wrapped in the drooling embrace of a creature crafted to suck and blow. As her girth fills your windpipe, yours is introduced to a soul-draining wonderland of incomprehensible experience. Slavering cheeks loosen and tighten incongruently, learning you the methods you’ll need to please her again in the future. Mimicking her muscle contractions and her horny moans become oblique memories that quickly meld with the vestiges of your personality, pounded away by a determined cock.");
			output("\n\nThe universe is ripped away when you orgasm, hammering right back and hosing her stomach with [pc.cum]. Orgasm provides no relief from the tectonic rod battering your meat-stuffed trachea. Muscles that were tighter than steel springs go slack - what your body is discharging in [pc.cumVisc] wads is not just peaked arousal, but your mind. The points of your IQ are gobbled up by a driven pole-smoker. Cognition soon becomes harder to squeeze together than cock between your happily slurping lips, reinforcing how important it is to do the latter.");
		}
		// pc Pussy (and is not taur)
		else if(pc.hasVagina())
		{
			output("\n\nThin fingers pull the exterior lips of your [pc.pussies] apart" + (pc.hasVaginas() ? " in maddening sequence":"") + ", making way for a deep-diving tongue at least a foot long. The slavering tendril slithers through your baby-making channel, infringing on the proximity of some of the most powerful nerves in your body, withdrawing every time before you clamp down and cum in a [pc.girlCumVisc] spray of [pc.girlCumNoun].");
			output("\n\nExplosive femgasm robs you of more than just muscle control: it gets harder to think, harder to <i>want</i> to think. All you need to concern yourself with is gliding past your lips, rapidly, relentlessly, sinking its sheer magnificence into your stomach, swelling your neck even fatter. Blissful spasms rocket you forward, instilling in you the all-consuming <b>need</b> to gobble up cock.");
		}
		// pc Neuter Or Is Taur
		else
		{
			if(pc.isTaur() && pc.hasGenitals()) output("\n\nLacking the spinal length and torsion to reach your nethers, the gothic herm focuses on fucking you harder.");
			else output("\n\nWith nothing to work with, the gothic herm focuses solely on fucking your useless cum gutter of a mouth.");
			output(" Silver inches of glistening lady-dick jackhammer in and out of your lips, pulled by powerful thighs. You can do little more than bob ineffectually, spitting and gurgling as you’re primally claimed, unable to make sense of anything that isn’t the throbbing hard dick suffusing you from within and without.");
		}
		// merge
		output("\n\nSummoning the strength that one typically gets near to extreme orgasm, the goth nearly concusses you with a brain-rattling lunge. Once more. You accept her position over you now and forever; the torrential rush of seed through her inner passage inundates your belly first, splashing out from your stomach. You can feel your abdominals round out in real time, fast enough that someone could take a time lapse video of the spermy process. Bubbling gallons of [pc.raceShort]-bloating climax expand you to the point of obesity, ");
		if(pc.mf("m","") == "m") output(" filling out your curves with distinctly feminine slopes");
		else output(" lending your girlish curves a few inches of transient, liquid appeal");
		output(". Your impaled throat tightens uselessly, surging streams of herm-spooge filling you fast enough to induce seizure.");
		output("\n\nLuckily, before that ever happens, the next vigorous clap of her waist to your face knocks you out cold.");
		processTime(45);
		pc.orgasm();
		if(!enemy.hasStatusEffect("VR")) pc.loadInMouth(enemy);
	}
	// pc Lost To Demon - Worship the devil
	else
	{
		output("\n\n<i>“Ahhhh, what to do with you, would-be champion...”</i> The lusty succubus’ hips wiggle with pleasure as she faps her two-foot length. Sighing, she releases her grip - her precipitous dong falls, landing smack-dab on the center of your scalp. Smiling wickedly, she cups one sagging tit and the maroon nutsack beneath the base of her veiny monster. <i>“Oh, I think I know juuuust what the doctor ordered.”</i>");
		output("\n\nEyes twinkling, the red-hot demon presses a foot to your shoulder. Whilst you fall to your back, she descends, wings flapping, seating herself firmly on");
		if(pc.isTaur()) output(" the waistband bordering your splayed ‘tauric half");
		else output(" your [pc.belly]");
		output(", exhaling a nice and horny ‘mmm’ now that her massive dick has a comfy place to sit" + (pc.biggestTitSize() < 1 ? " on your chest":" between your [pc.breasts]") + ".");
		if(pc.isTaur()) output(" Her fingertips tap rhythmically to your flesh, faint stabbing pangs of micro-injections filtering through your bloodstream. Whatever it is nullifies the muscle ache of your very awkward position.");
		//pcWearingClothes: 
		if(!pc.isNude()) output(" From her Steele-brand perch, she ignores your" + (pc.isBimbo() ? " soulful stare":" mean looks") + " and takes her time peeling your pesky garments off piecemeal.");
		output("\n\n<i>“You’re going to have an awful hard time if you give Mistress any trouble. But that’s why I’m here and not her.”</i> She laughs, leaning back to twitch out another mauve spurt. You can’t stop yourself from whining when the percolating precum streams over one eye and past your lips. <i>“I’m going to kickstart your training; I’m going to teach you some very useful skills.”</i> The unwelcome and nefarious presence of her limpeting fuck-club smashes all your thoughts. There’s absolutely no chance you can escape it. No matter where you look, it’s there... tap-dancing on the edges of your subconscious.");
		output("\n\nEarthen, embery pheromones infiltrate your nostrils, creating a gloomy haze that wraps around her pendulous firmness. You shudder pleasantly, blissfully sighing, letting your eyes roam the mouthwatering girth stretching out before you.");
		output("\n\n<i>“The lessons all start here, and the first one: understand that cock is the most important thing in your life-to-be.”</i> The inhuman sex-doll pats her tightened totem, glowing ominously. It makes you feel a little uneasy when you think about having it forced into any of your holes. <i>“Still nervous, [pc.raceCute]? It’ll pass. Think of it as your body misbehaving. Mine did, too! And look at me now, my Mistress’ greatest piece of work.”</i> Impure excitement flushes her crimson cheeks an oily burgundy hue. The metallic shine of her spit-slick lips reflects your fading stubbornness. <i>“Here, since you’re being a good [pc.boyGirl] and not resisting, let me give you a little <b>nudge</b> in the right direction.”</i>");
		output("\n\nAn unbidden sensual force plants itself to your [pc.skinFurScalesNoun] and slides towards your crotch at an agonizingly slow pace. The spade-tipped appendage traces circles of varying diameters on your crotch, ");
		if(pc.isHerm()) output("ringing your [pc.cocksLight] in a constricting band of pleasure, occasionally teasing your [pc.pussiesLight] with light flicks");
		else if(pc.hasVagina()) output("tickling the vulnerable exterior" + (pc.hasVaginas() ? "s":"") + " of your [pc.pussies]; the brim of her impish limb swims through your drooling slit" + (pc.hasVaginas() ? "s":""));
		else if(pc.hasCock()) output("slapping the sides of your [pc.cocks] as it imprisons them in a narrowing loop of torturous delight");
		else output("taps and tickles the sphincter of your [pc.asshole], coaxing it to contract and wink yet never showing interest in taking that ground");
		output(". <i>“Yesss... look at your face. Good [pc.boyGirl]. Nothing bad is going to happen to you! Nobody is going to hurt you; quite the opposite, really!”</i> The ministrations on your pelvis intensify until a high-pitched whine of acquiescence slips off your tongue. Anything to get her to do more.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she moans, taking on a friendly tone at odds with her malevolent appearance. Her tail, a wet and soft tool, slows its affections. A full ten seconds later, just as you begin to feel denied, she speaks. <i>“Why don’t you open your eyes, now? Come on. I promise you’re going to feel a lot better soon, but you have to do what I say. ‘Kay?”</i>");
		output("\n\nSlitted green eyes greet you, glinting with pride as they skate over your [pc.face]. <i>“You’re noticing it, right?”</i> The sultry creature’s lips curve into a broad smile. Exquisite. Her caresses turn into outright fondling, getting rougher and rougher. Hypnotic. Her husky sighs turn into wanton exhalations - the fapping accelerates. Flawless spheres of amethyst spooge boil out of her leithan-ready member. <i>“This is the power of cock, right here. Look at me... going crazy just from touching it. Look how... good I feel... mmmf.”</i>");
		output("\n\n<i>“It’s how you’re going to feel, too. Think about that.”</i> Her pumping slime splatters on impact, flecks landing all over your exposed areas. A torrent of translucent purple ripples through her urethra, fattening her skin before it empties onto your collarbone. <i>“Touch it. You’ll be so, so glad you did. Wrap your fingers around my big, hard cock. You’ll l-love... ooh... the heat... the power. You may think you know all about dick, snookums, but you’d be suuuuper wrong.”</i>");
		output("\n\nNow that she’s asked, you can’t help but want to see if her words ring true. If anything, it may give you the means to escape!");
		output("\n\nUnintentionally lapping at your [pc.lipsChaste], you cross your [pc.eyes] for a better look at what you’re working with. The dripping rod of some unholy god lays across your body, the obese head just a few inches past your nose, pulsing out ribbons of sticky prelude. Bubbly moans spur you into gripping the length, only to discover that even with both [pc.hands] you can’t fully encircle the sheer brawniness responsible for your failed rescue attempt.");
		output("\n\nRather than grab, you stroke, taking your place as her masturbator and wringing the fat, burdensome cock of its payload. The organic nubs studding her prodigious dick reveal their utility: they’re exotic attachments meant to improve her use of a mouth, a pussy, even an ass, but they feel simply delightful riding the ridges of your palms. Her scent is getting stronger too. Somewhere behind the phallic musk is the smell of fragrant pussy. It’s working, you think, as her face contorts. Just get her to cum and you’ll get to cum-");
		output("\n\nHuh? You’re going to cum?");
		output("\n\nIt’s true. Only now do you realize the more you shed your inhibitions, the closer you get to your own orgasm. For some reason you’re marveling at that, that somehow this penis, smothering you in ecstasy, is also a vector, transferring the pleasure you provide it back into you. It’s so strong in your mind that even thinking about doing more for it is spiking your libido. Curiosity gets the better of you, so you kiss it, only to cry out: something sloppy and wet and <b>hot</b> did the same for you!");
		output("\n\nSlippery fingers molest your erogenous zones, intensified by the speed of your [pc.arms] and the flexings of your wrists. She’s not doing it: you are. Successive pumps become quicker, easier; you lose yourself to the bizarre effect. A part of your mind screams to stop but, of course, you don’t. You never had a chance of escaping, but that would have been stupid. You’d have been running from this.");
		output("\n\n<i>“Lick me - squeeze me, baby... I’m sooo close, don’t be shy now!”</i> she says suddenly.");
		output("\n\nThe flow of lubricating wetness thickens when your [pc.tongue] lashes out, panting, licking, and lapping up the drink that completes your subtle transformation. Now that you’re not worrying about anything but cock, the scales fall from your eyes, unveiling a world of wordless euphoria.");
		output("\n\nSweat-sheened cock bounces on your [pc.chestNoun], its slimy texture shirking your attempts to control it. Together you’re riding the exquisite edge of ecstasy, thrashing and writhing. She shivers and cries with passion, cocooning your features in outflowing desceration, tender flesh thudding with volcanic output. Throwing your body around it is the only thing you can do" + (pc.biggestTitSize() >= 2 ? ", pulling it between your [pc.breasts]":"") + ".");
		output("\n\nApproaching orgasm tightens your mewling countenance. Fixed to her cock in a full-on hugjob, your entire soul devotes itself, screaming obedience for its new Mistress. The fallen angel’s voluptuous hips swing into climactic gyrations, screwing your entire frame with all her strength. In the final stages of depravity you clutch on to her bitch-breaking boner for dear life, taking advantage of every opportunity to feed its infinite lust for hedonism. The urge to orgasm rises from your pounding heart to your frontal lobe, wailing on pliable flesh.");
		output("\n\nA hot daze strikes you with a second of derangement. It clears, giving you time to prepare for the reason why. Hot gouts of mind-wiping release gush out, gallons of geysering sperm exploding across your face. Sweet spooge surges past your lips, lassoing and trickling fast into your gut. You spread your wet lips across a cock-head to shame the equine endowed. In the space of three spurts you’re completely stuffed and saturated by the stomach-walloping bloat of muscle-clenching ejaculation.");
		output("\n\nWhat makes it special is how you cum along with it");
		if(pc.isHerm()) output(", shooting [pc.cum] into the hot embrace of her ass, spilling [pc.girlCum] across the floor");
		else if(pc.hasVagina()) output(", spilling [pc.girlCum] on the deck");
		else if(pc.hasCock()) output(", busting fat wads of gurgling [pc.cumNoun] between the glossy cheeks of her ass");
		else output(", overwhelmed by an inexpressible sense of ecstasy, shocked by how synergized this rendezvous has been");
		output(". Jism detonates in volumes unimaginable, an ocean tide bath begins to swallow you into a puddle of steaming-hot virility.");
		output("\n\nExcess dribbles from your body. She starts again, teasing you again, use you again, ferally and roughly. An uncertain passage of time occurs. Ensorceled as you are, you never actually register that you fall unconscious at some point.");
		processTime(45);
		pc.orgasm();
		if(!enemy.hasStatusEffect("VR")) pc.loadInMouth(enemy);
		//Load in mouth
	}
	// merge
	clearMenu();
	addButton(0,"Next",badEndToGenericDollsPart2);
}

public function badEndToGenericDollsPart2():void
{
	if(!enemy.hasStatusEffect("VR")) moveTo("KQ T14");
	
	clearOutput();
	//show po!
	author("William");
	showBust("ILLUSTRIA_PO");
	showName("DOCTOR\nPO");
	// Doctor Po sequence
	// Vulpatra = 2, Laquine = 13, Human = 20, Demon = 34
	var petNumber:Number = 0;
	if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) petNumber = 2;
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) petNumber = 13;
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) petNumber = 20;
	else petNumber = 34;
	output("<i>“Ahh, I was wondering when you might be joining me, Number 66.”</i>");
	output("\n\nYou awaken, groggily, vacillating between awareness and confusion. The searing lights aimed at you make it impossible to see. Fortunately, there’s a very kind and gentle hand stroking your [pc.face], providing much needed assurance of safety and security. <i>“Number " + petNumber + " was too rough with you, I’m afraid. Almost vitiating, the way she came in with you mounted on her. I’m sure your body will never forget the experience of being worn as a sexual ornament, but it was certainly unprepared. Don’t worry, she’s been reprimanded.”</i> Nimble fingers shift" + (pc.hasHair() ? " through your hair":" over your scalp") + " and around the brim of your [pc.ear]. <i>“Still can’t see? Let’s see if those little ‘bots of yours can’t fix that for us. Quite handy, now that I’ve reprogrammed them.”</i>");
	output("\n\nAnother pulse of light and everything dims. Bubbles of indecipherable light and shape take form, reduced to images your brain can once more comprehend. You find yourself sat in a large, comfortable chair lacking armrests. Across from you is the most beautiful woman you’ve ever laid eyes on.");
	output("\n\nShe adjusts her pristine glasses to a perfect balance, brushing a golden lock of silky-smooth hair away. Her lapis-blue skin is radiant under the laboratory’s lighting, unblemished, and depending on the angle you look at her from, produces a coronal halo indicative of divinity. Your caregiver’s full lips curve into a heartwarming smile. You smile back, and you start smiling wider when you see her puffy nipples floating from the occasional breath she takes. Behind them sloshes the milk she carries, in full view thanks to her body’s modifications.");
	output("\n\nBut then your eyes are roaming further down, and you start to blush. Her pussy is moist - you can smell it from here. In fact, you can almost taste it. Her immaculate breasts wobble enticingly, defying ordinary descriptions. Nothing you could say would adequately convey their glory. It’s easy to envision yourself in her embrace with a nipple in your mouth, and that’s why your tongue spills from your lips, a wide and lengthy organ perfect for lapping up a delicious drink." + ((!pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) ? " A subtle flicker of brain activity reminds you that you’ve <i>always</i> had this kind of tongue, made to serve.":""));
	output("\n\nMaybe you’re not good enough to suckle from her teats yet. In that case, you could definitely put your servile muscle to use pleasuring her vagina. Lubricants that smell like damp fruit and ripe berries drizzle from her chrome quim, a dazzling trench of shimmering mercury, juiced up for all manner of sordid affair. You’re extremely aware of it, <b>knowing</b> you’d be very useful between her thick thighs, under her round, squeezable ass, slurping at that wellspring of fuckable wetness.");
	output("\n\n<i>“See something you like, 66? I don’t want my pets keeping anything from me. If there’s something on your mind, I will hear it.”</i> The woman, her name eluding you still, steps closer and you steady yourself, trying not to lean closer to her erogenous places. She seats herself on your thigh, detonating some hidden cache of bliss that quickly engulfs the rest of you. <i>“Now, now, your Mistress is curious. There’ll be time to take care of that mounting lust later. What’s distracting you?”</i>");
	output("\n\n<i>“Ummm,”</i> you moan, clearly enjoying her and nothing in particular. You might as well be honest. <i>“You.”</i> Just as the word leaves your mouth you recoil, suddenly afraid you’ve offended her. Instead, an arm wraps around your neck, bringing your head closer to those well-proportioned titties.");
	output("\n\n<i>“Is that so, 66? Your sisters have all been specific. 34 has a slobbering obsession with my butt, 13 has a comical affection for my breasts - heh. Hmm, it’s very impressive the way she orgasms merely by thinking about them. But what about you? What do you love the most? Maybe my luscious <b>lips?</b>”</i> They smack together, pucker up for a big kiss. Manifest temptation. <i>“My <b>hair,</b> softer than any other material in this cold, cold galaxy?”</i> Two fingers clasp the strands together, twirling them into a gorgeous braid. <i>“Perhaps my <b>pussy?</b>”</i> You’re staring hard at every part she lists, doing your best to formulate a suitable response.");
	output("\n\nAll you do is drool.");
	output("\n\n<i>“What tickles this the most?”</i> Mistress asks, reaching down and grasping your");
	if(pc.hasCock()) output(" [pc.cocks]");
	else output(" engorged boner, stroking sixteen inches of male brawn swollen up wide and firm. <b>You’ve always had that,</b> and you love when it’s touched. Especially by her");
	output(". <i>“You can tell me anything.”</i>");
	output("\n\n<i>“I love...”</i> you ramble, losing your train of thought at the exact moment her boobs start to leak. Mysticism. Your jaw slackens and your breaths emerge in random, lustful exhortations. Mistress scoots closer, draping a leg over your lap, soaked in ambrosia. You think it can’t get any better, but then her lips press to the side of your head, kissing you long, softly, imploringly. That tousled braid of hair, like an electric lash, slides over your flawless " + (pc.hasFur() ? "fur":"skin") + ".");
	output("\n\nYou can’t take it anymore. <i>“I love you!”</i> [pc.Cum] jets from your manhood, potent pillars of sperm blasting across the room and contaminating the once sanitary room. <i>“Your pussy smells so good!”</i> The declaration causes <b>your pussy</b> to cum, squirting torrents of [pc.girlCum] to complement male orgasm." + (!pc.hasVagina() ? " Of course you have a pussy. You always had one, and it was always this powerful.":"") + " <i>“You’re so so so so beautiful, I can’t just-”</i> <i>Spurt.</i> <i>“-Choose-”</i> <i>Spurt.</i> <i>“-One!”</i>");
	output("\n\nTension departs in splurting surges, aided by Mistress Illustria’s touch. Muscles rhythmically clench, forcing out waves of twin-sexed satisfaction. Your balls never diminish and your glands never go sore. There’s no pain, only a glorious loop of constant climax. Your cheeks scream in delight, only muffling when you’re properly kissed. Her tongue dives inside, swabbing over your cheeks before tangling with your taste buds. Doctor Po’s isn’t as endowed, yet it snares yours in a sensual twirl that speaks to authority and experience, both forces intermingling in the knot of spit-slick flesh.");
	output("\n\nIllustria has melted into your body, shuddering lip-to-squishing-lip. Her thumbs play around the saucers of your plumped nipples, squeezing out violet lactic arcs from your tremendous jugs. Ripples pass through the creamy");
	if(pc.hasFur()) output(" curtains of your boobfur");
	else output(" swells of your boobflesh");
	output(" long moments before the real eruptions occur. Hermaphroditic bliss once overwhelming for your overwritten psyche becomes your standard for living. You ravenously indulge, explicitly agreeing with every mental flash.");
	output("\n\nThe sybarite avatar of hedonism seats herself in your lap, casting aside her previous facade. Her kissing is fiery. Her grinding crotch is molten. You go crazy with a guttural squeal, great gushes of slick, sticky juices smearing your linked bodies in a lurid writhe and wriggle. Her fathomless needs meld with your depthless desires, joining together in the unshakable concatenation of mistress and slave, simultaneously heightening the volcanic sensation of total debauchery.");
	output("\n\nYou’re absolutely thrilled to have an Owner who cares about prolonging her obedient, hard-cumming pet’s churning ecstasy. In the raucous spaces between explosive orgasm, you only think about obeying, about serving, about all the pleasure you will derive from being <b>hers.</b>");
	processTime(256);
	pc.orgasm();
	pc.orgasm();
	if(enemy.hasStatusEffect("VR"))
	{
		pc.taint(1);
		pc.changeLust(50);
	}
	else
	{	pc.taint(100);
		pc.libido(300);
		pc.changeLust(50);
	}
	clearMenu();
	addButton(0,"Next",badEndToGenericDollsPart3);
}

public function badEndToGenericDollsPart3():void
{
	clearOutput();
	// Big orgies, Kiro fucks Steele, then vice versa, then Po and Dolls get involved. Good times.
	author("William");
	//busts!
	//9999 - fully TF Kiro before this so it shows the THICCness.
	showBust("ILLUSTRIA_PO",kiroBustDisplay(true))
	showName("\nLUST...");
	output("<i>“Angel!”</i>");
	output("\n\nNot long after Mistress has unyoked herself from you, another of her beautiful dolls enters the room. You recognize her subconsciously. Her cheery, bubbly voice is that of a friend’s from another lifetime. However, in her hip-swinging stride closer to your chair, her equine cock throbs up to full, dripping readiness, bouncing back against the fuzzy, overfull spunk-tanks that can only belong to a kui-tan, augmented for sexual decadence. The flaring head baps into her gigantic, milk-swollen tits, ejecting globs of puddling cum into her spongy pelt.");
	output("\n\nFaced with the familiar futanari’s many captivating attributes, you instantly forget what you were thinking about. Absent Doctor Po’s guidance, you want something to do, or something to do you. Your cock needs to be touched, your pussy needs to be filled, and there’s someone who could do that and more. Void, could you ever hope to handle that obelisk of slut-cock? Perhaps if you begged, Mistress would let you fuck her tits. Or let her fuck <i>your</i> tits. Just so long as you’re being useful. It’s not good to feel unwanted.");
	output("\n\n<i>“65,”</i> Mistress nods at her. <i>“I was wondering when you’d get here. Did you get lost?”</i>");
	output("\n\n<i>“N-No, I got... horny...”</i> the glossy tanuki answers, glancing to her pulsing leithan-tamer. <i>“Please forgive me, Mistress! I just had to masturbate... and then I kept doing it.”</i> You note that her dick is beating harder, erect enough to burst should another ounce of iron fill it.");
	output("\n\nIllustria pats Kiro’s cock and raises her chin. <i>“Nothing to be so upset about. Look, 66 is ready. Look at her squirming, in need of relief. She needs help.”</i> Illustria’s caresses travel the incredible length, stopping to loop around the medial ring and tease the underside of the billowing glans. <i>“Do you want to help her?”</i>");
	output("\n\nThe tanuki toy looks at you, biting her lip sympathetically. 65 recognizes your crippling arousal, nodding her head. <i>“Yes! I want to help! Anything for you, Mistress!”</i>");
	output("\n\n<i>“She needs to be fucked.”</i> Illustria squeezes her kui-tan’s dick. <i>“Hard.”</i> Kiro coos with a needful arch. <i>“Fuck her with all your might. Bend her over and screw her pussy, and after you cum, then you can ride her. Put everything I’ve given you to the test, 65. Show me how much you love being a toy.”</i> Mistress grins and slaps her ballsack. <i>“And show 66 how much she’s going to love it, too.”</i>");
	output("\n\n<i>“Oh right away, Mistress!”</i> Kiro announces, bull-rushing in your direction.");
	output("\n\nYou came to this place for a reason, but that reason has been consigned to the wastebin of history. Deep down, however, you feel <b>right.</b> Having Kiro ram her titan-breeding dick into your pussy concludes whatever goal you’ve long forgotten. She hefts you up and your body hangs there in the firmament, devouring inches of kui-tan horse-cock into a waterfalling cunt tailored to accommodate unspeakable proportions.");
	output("\n\nNumber 65 fiercely pumps your body in a bestial manner that’d split anyone else, unwilling to fuck around with things like foreplay. Mistress Po made you ready for vigorous copulation. You feel her quake, stretching your enhanced hips into a mold suitable enough to fuck. Clenches of pleasure reverberate through Kiro; your head ends up level with her boobs, right up next to the head of your cock, twitching in the valley of her boobs.");
	output("\n\nAll you’re hearing are her wails of pleasure scraping at Po’s mannered instructions, and the squelching. Oh, how you revel in that the most, of having this incredible mass of breeding material entering and exiting at a kinetic pace. The succulent friction renders you a limp wreck only capable of enjoyment. And that’s what Miss Po wanted from you, and from Kiro. Pendulous kui-tan prick bulges inside your sopping-wet cunt, hosing your transfigured innards between timely intervals of cervix-battering lunges.");
	output("\n\nYour womb gurgles with the ascent of 65’s titanic load, inflating to handle a fuckdoll’s reservoir. Meanwhile, you’re busting a fat wad yourself between her tits, caking the plush canyon (and your own face) in the first taste of DNA you’ve been able to get since becoming a slave. It’s the only one you needed to know how good of a thing that is. There’s no resting, however, before your ovaries have yet to be completely submerged in a herm’s drenching output, Kiro falls to the ground on top of you, quickly assuming a reverse cowgirl position.");
	output("\n\nExhaustion is a thing of the past. Aiming your fat dick at her plump, onyx entrance, Kiro glides down your sloppy pole. Her eager hole clamps down and cums right away, but she’s not going to be denied. The gigantic ass of your bestest friend ever is thumping up and down on your long-ignored dick, clapping from the momentous urgency of it all.");
	//kiroVirgin: 
	if(kiro.vaginalVirgin) output(" trickles of hymen blood mixing with coital glaze. So she’s a virgin! You were her first time! Oh, Miss Po must have planned this, she’s the best!");
	output(" You don’t have to do anything, of course, just lie back and be used.");
	output("\n\nYou know it’s the right decision, because you’re ready peaking mindlessly, geysering the tanuki with stomach-bloating volume. Your spout floods her baby-compartment in visceral waves of figure-encumbering sperm. There isn’t a knot among the stars that could stand against the tides galloping through your fattening urethra, basting oversexed slut’s body in the frothy reason for her existence.");
	output("\n\nDays go by, full of sex. Mistress Po uses you and all her favored dolls, inviting you in intervals to her room. What astonishing acts of perversion take place there none could ever hope to describe. Every form of sex is is tested and engaged. Every cock, every pussy, new and old, is pushed to its absolute limit as a tool for copulative bliss. Tight holes are plugged with hard cocks, wet mouths and hands lock in sweaty dances in the maddening realms found between the borders of pain and ecstasy, impossible for any other to endure.");
	output("\n\nWeeks pass you. Months. They’re all spent sprawled in the sheets with your sister dolls. Kiro is always there, and you, the favored of Po’s mastercrafted harem, leads it again. Kiro rails your mouth at lightning speed, stressing the specs of your new PhalloVac jaw. Po is splayed out at the center of her bed, clutching the satin with your dick lodged in her gushing techno-vag. Numbers 2 and 13 are to her sides, taking turns screwing her trachea, playing with one boob each. Numbers 20 and 34 are slamming yours and 65’s pussies respectively.");
	output("\n\nYou’ve learned how to give it to your Mistress perfectly, how to masterfully conduct the wicked enthusiasm that slathers this entire room in cum and gratification. Every day there is something new to discover and act out, and every night there’s a new routine uploaded to your sex-brain. You personify it, for you serve the embodiment of depravity herself, and at her command experience more sensation and thrill than anyone in the universe ever has.");
	output("\n\nAnd ever will.");
	days += 20;
	processTime(50);
	pc.orgasm();
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",badEndToGenericDollsPart4);
}

public function badEndToGenericDollsPart4():void
{
	clearOutput();
	author("William");
	// Outro
	showBust(kiroBustDisplay(true));
	output("There’s a story floating around U.G.C. space - a fairy tale, a drunkard’s fable. It’s a story that began in solitarity and grew into a full-blown urban myth. Of a ship that lured in lone spacefarers with false distress signals, bringing them to a hidden place they never returned from. One captain on a routine stop spoke of it at the local club, and the buzzed patrons listened, closely, thirsting for intrigue as much as the next round.");
	output("\n\nNot a superstitious ausar, she laughed it off at the end. Everyone was in agreement: it was just that, a myth. It was the fault of incompetent captains for getting caught in fights, or ending up smack dab in space clearly advertised as dangerous. Or, insouciant boozehounds commented, something as stupid as flying into a rock.");
	output("\n\nThe young and plucky pup began her next morning by flying out to the nearest jump-gate, alone, when suddenly her terminals flashed desperately, receiving incoming communications traffic. A distress signal. Not once did she consider the story she’d told that previous night, and on so many other inebriated occasions. Her ship was well-armed, and she was capable in a fight. Glancing to her sidearm, a fancy, custom-made piece of hardware, her brow furrowed in determination. She set out.");
	output("\n\nUpon her arrival in the nearby system, the origins of the signal weren’t difficult to locate. A large ship, a bit like a freighter, hung out of alignment a thousand meters from an asteroid belt. If there was a chance to save anyone’s life, she was willing to take it. Finding the hangar was easy, and once she set down, she barreled out of her airlock and down the entrance corridor.");
	output("\n\nIt was at that moment she realized her mistake. The interiors were spotless and clean, glistening. Power hummed through the floor, a soft vibration of artificial gravity righting itself. She turned back to see her vessel vanishing behind the ominous seal of an impenetrable blast door.");
	output("\n\nAnd when she turned, two feminine figures, naked and voluptuous, stood there. Propped up by slutty heels and jiggling with the plushness of whores who belonged in that ultraporn she watched before bed every night, they hugged each other, stroked each other, smiled alluringly at her. They squirmed in delight when the interloper raised her pistol, shouting threats until her diaphragm sounded punctured.");
	output("\n\n<i>“Mistress Po will be happy to see you,”</i> the kui-tan doll cooed, nuzzling closer to her equally attractive companion. <i>“We haven’t gotten a visitor in a while. She told us to welcome you.”</i>");
	output("\n\nThe one numbered 66 nodded, and a bright, strobing light pulsed out from her eyes.");
	output("\n\nIn a moment of blindness, the ausar dropped her weapon. She was immediately set upon by the erotic sentries. Stripped, they fucked her in every hole, stretched her until she became addicted to their pheromones. And only after they’d subdued her through mind-boggling cummies, taught her to orgasm on command, did they then make her a part of the tales she had spread not too long ago.");
	if(enemy.hasStatusEffect("VR"))
	{
		output("\n\n<b>The simulation ends with a disorienting blast of static! Shaking off the lingering desire to obey the digital version of Doctor Po takes a few moments longer. Surely you’ve suffered no ill consequences as a result of dallying in this VR world...</b>\n\n");
		CombatManager.genericLoss();
	}
	else badEnd();
}