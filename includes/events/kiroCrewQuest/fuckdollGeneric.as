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

public function showSexDoll(nude:Boolean = false):void
{
	showBust("SEXDOLL");
	showName("\nSEXDOLL");
	if(enemy != null)
	{
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) showBust("KQ_SEXDOLL_LAQUINE");
		else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) showBust("KQ_SEXDOLL_VULPATRA");
		else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) showBust("KQ_SEXDOLL_DEMON");
		else showBust("KQ_SEXDOLL_HUMAN");
	}
}

public function resetKiroQuest():void
{
	flags["KQ_MET_SEXDOLL_VUL"] = undefined;
	flags["KQ_MET_SEXDOLL_DEM"] = undefined;
	flags["KQ_MET_SEXDOLL_LAQ"] = undefined;
	flags["KQ_MET_SEXDOLL_HUM"] = undefined;
	flags["KQ_VULPATRA_TAINTS"] = undefined; // How many times dickgrown via earfukks
}
public function nukeWillTesting():void
{
	pc.willpower(-100);
	genericSexdollEncounter();
}
public function genericSexdollEncounter():void 
{
	var tEnemy:Creature = new KQSexdollGeneric();
	setEnemy(tEnemy);
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
		if(pc.taint() < 33) output("\n\nYou brace for another fight. No matter how many mind-controlled toys this <i>“Mistress Po”</i> sends your way, you’ll stand firm" + ((pc.hasCock() && pc.isErect()) ? ". Squinting, you glance at your crotch -  hopefully not <i>too</i> firm":"") + ".");
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
	if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) IncrementFlag("KQ_SEXDOLL_LAQUINE");
	else if(enemy.hasCock(GLOBAL.TYPE_VULPINE)) IncrementFlag("KQ_SEXDOLL_VULPATRA");
	else if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) IncrementFlag("KQ_SEXDOLL_HUMAN");
	else IncrementFlag("KQ_SEXDOLL_DEMON");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Victory Setup:
public function defeatTheGenericSexydoll():void
{
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

	//9999 vicotoroy meeenu!
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
		else addDisabledButton(0,"FuckHerPuss","Fuck Her Pussy","You're way too big to fuck that pussy like some kind of normal, not-hung person.");
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
	pc.cockChange();
	output("\n\nA single squeak is the only sound your captive cock-holster makes. Her eyes slide closed as the lights upstairs dim, one by one, short-circuited by a whole cock’s worth of penetration. Her tongue, already flapping, slides to the far side of her maw, now drooling thick webs of spit into her fur. It must feel pretty good, because one of her hands reaches up for a squeeze, mopping the syrupy saliva through her fur until it’s glossy and shining.");
	output("\n\nGrabbing her head with both hands feels like it might be a step too far" + (pc.isAss() ? ", but why should you care?":", but it feels too good to worry about that.") + " She’s asking for it. You want it. Besides, your hands already found their way to her head when you took that first thrust, and you’re already winding up for another. You slap your hips into too-fuckable shortstack’s head with an audible clap. Oscillating vibrations ripple through her tender flesh, surrounding you, cradling you, and giving you exactly the sort of feeling to motivate a second stroke... and a third... and a fourth.");
	output("\n\nYou rut the security slut’s head, pounding with abandon. She doesn’t mind from the sound of it, moaning stupidly when smack yourself home at force." + (pc.balls > 0 ? " The sweaty imprint of your [pc.sack] lingers on her cheek, a tempting target for you to strike on every downthrust.":"") + " Her lower jaw and tongue flap about, completely limp, passive. Spit flecks your [pc.thighs], but it just makes the whole act better, knowing that the target of your lusts has already been rendered insensate by pleasure. She gave herself over to you to be used without concern or mercy. She wanted this.");
	output("\n\nLooking down at the fox’s narrow face, it’s clear just how much <i>loves</i> being properly abused. She looks like she’s riding the galaxy’s longest orgasm, like the feeling of your [pc.cockNounSimple " + x + "] plumbing the depths of her cranial cunt carried her all the way to cloud nine. Whenever you cum will be fine with her, you’re sure. She’ll moan for it, beg you for another, and maybe that’s what you should give her. Maybe you should shoot a load deep into this greedy, clutching, alien hole and spin her around for a shot at the second. Maybe you’re so worked up that you won’t be satisfied without a creampie in both of these seductively swollen slits.");
	processTime(15);
	pc.lust(5400);
	clearMenu();
	addButton(0,"Cum",cumOnceForFoxyEars,x,"Cum","One cumshot is plenty.");
	addButton(1,"Cum+Finger",cumAndFingerFoxyEars,x,"Cum+Finger","A single cumshot is plenty, but a finger in the horny minx's other ear might be a bit of fun...");
	addButton(2,"Cum Twice",cumTwiceForFoxEars,x,"Cum Twice","She's got two holes. Why not try both?");
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
	else output(" Your titanic deluge should be a slow, moderated thing. This time, it isn’t. Spurts spray out of you rapid fire as the fox’s insides coax you to climax with far greater speed than normal. There’s something about her anatomy, some way that it tricks your [pc.cocks] into overdrive, demanding " + (!pc.hasCocks() ? "it milk itself":"they milk themselves") + " as fast as your urethra" + (pc.hasCocks() ? "s":"") + " will allow. In short order, the vulpatra’s tummy has bulged to full and pregnant proportions, but her tiny body could never contain your entire climax, not with the way you cum.\n\nFortunately, the cock-brained turbuslut’s mouth provides an easy ‘out’ valve for your excess semen. Her flapping tongue soon drools a torrent [pc.cumVisc] [pc.cumColor] onto her tits. She paints the twin spheres in record time, leaving the rest to cascade across her taut, pregnant dome and puddle beneath her submissively folded legs. You note that her tail is completely flat, lying deep in the cum and sopping it up like a sponge - just the rest of her, you suppose.\n\nBy the time you finish, she’s a cummy wreck, her small prick spraying thin ropes of alien cream to frost your far more virile lake.");
	processTime(10);
	enemy.loadInCunt(pc,0);
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
		pc.cocks[x].cLengthRaw += cockGrow;
		pc.boostCum(1);
		if(pc.taint() < 33) pc.taint(3);
		else if(pc.taint() < 66) pc.taint(2);
		else pc.taint(1);
		if(pc.ballSizeRaw < pc.cocks[x].cLengthRaw) pc.ballSizeRaw++;
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
	output("\n\n'Slap.' 'Slap.' 'Slap.'");
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
		pc.taint(6);
	}
	else if(pc.taint() < 66) 
	{
		output(" Thinking like that feels a little hypocritical, yet you don’t bother to indulge the concern any further. Now that your ");
		if(pc.balls > 1) output("balls are empty");
		else if(pc.balls == 1) output("ball is empty");
		else output("needs are met");
		output(", there’s more important concerns at hand.");
		pc.taint(4);
	}
	else 
	{
		output(" Maybe once you rescue Kiro, you can fuck her just as thoroughly. Yeah.");
		pc.taint(3);
	}
	var cockGrow:Number = 3+rand(3);
	if(pc.hasPerk("Hung")) cockGrow += 2;
	if(pc.hasPerk("Mini") && cockGrow > 2) 
	{
		cockGrow-=2;
		if(cockGrow < 2) cockGrow = 2;
	}
	output("\n\nYou leave the encounter with <b>an extra " + num2Text(cockGrow) + " inches " + (pc.legCount > 1 ? "swinging between your [pc.legs]":"hanging below the belt") + "</b>.");

	processTime(45);
	IncrementFlag("KQ_VULPATRA_TAINTS");
	enemy.loadInCunt(pc,0);
	pc.orgasm();
	if(pc.ballSizeRaw < pc.cocks[x].cLengthRaw) 
	{
		pc.ballSizeRaw++;
		pc.ballSizeRaw++;
	}
	pc.cocks[x].cLengthRaw += cockGrow;
	pc.boostCum(5);
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
	pc.cockChange();

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
	output("\n\n[enemy.name]’s eyes are not on you, if she even knows you’re there, instead fixed up at the ceiling. Wide and glazed, she seems shell-shocked, like a stalled machine or a frozen computer. Given what she is, that may not be far off from what’s happened. Her breathing is heavy still, her [enemy.chest] heaving up and down against you, and despite her prior habit of not shutting up, she remains inertly silent. Even her [enemy.cockNounSimple], which is sandwhiched between your two bodies, feels oddly soft, the seemingly insatiable sex organ rather harmless at the moment.");
	output("\n\nShe seems so harmless, you can almost overlook the fact she’s a sex crazed fuck toy bent on " + (pc.hasVagina() ? "riding":"sodomizing") + " you until you’re as fucked up as she is... Almost.");
	output("\n\nAfter a few heartbeats, she blinks. Slowly her tongue pulls back out of her mouth, licking at a thick glob of the purple-tinted seed on her lip, letting out a low purr as she tastes it. Against your belly, you feel her cock twitch and stiffen, the sexdoll’s refractory period seemingly already nearing its end.");
	output("\n\nTaking a deep breath, you pull yourself up off of the now stirring woman, stretching out your taut muscles and quickly replacing your [pc.crotchCover]. As you prepare to leave, you notice her stirring on the ground once more, her sense almost returned, her cock rising back to full mast.");
	output("\n\n" + (pc.taint() >= 66 ? "Despite the thrilling idea of a second round with the fuck doll, you opt to get away while you can, if only for Kiro’s sake if nothing else.":"Having already wasted too much time with the depraved toy, you start to head out, needing to resume your search for Kiro in this den of madness."));
	output("\n\nAs you turn to leave, you hear her call out. <i>“That’s all? Oh, I can make you feel soooo much better, baby. Come baaaack.”</i> You hear her struggle to rise to her feet, heels clattering on the floor as she tries to get her footing. A moment later you hear the sound of her collapsing, likely exactly where she lay before. <i>“Oof! No! Come back, lover! Don’t leave me alllll alone! Let me FUCK YOU!”</i> You hear wet sounds, likely the result of her slipping around in your mutual juices.");
	output("\n\nIgnoring her, you draw your [pc.weapon], on the lookout for more threats.");
	processTime(45);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
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
		output(" She’s been drinking in the sight of your swollen [pc.pussiesLight] the whole time. Light refracts in the [pc.girlCumColor] cascade  seeping from your overflowing pot" + (pc.hasVaginas() ? "s":"") + ". The capability of your [pc.pussyNoun " + x + "] isn’t lost on her, and when your groin twitches another [pc.girlCumVisc] string onto her " + (enemy.hasFur() ? "matting bellyfur":"taut tummy") + ", the minx forgets all about eating you out. The knowing-est (and slightly awkward) smiles are exchanged between the two of you.");
		output("\n\nThen you’re sitting yourself on her stomach, capturing her [enemy.cock] in the cleavage between your [pc.butts]. Enfolded in your [pc.skinFurScales], her rock-hard cock throws out a gout of hot and off-purple precum that lands on your spine" + (pc.tailCount > 0 ? " hasTail:, stains your [pc.tails],":"") + " and seeps into the valley, making her rhythmic passage easier. Struggling to pump all the way through the canyon, she whimpers her approval, <i>“MmaaapussssyIwantpussypussypussy!”</i>");
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
		output("\n\nSomething tells you that Po’s fuckdoll was unprepared for so magical a cunt seizing her today. It’s worth it to see her face spread itself into an ‘oh’ of amazement. You take her to the hilt  quickly and cleanly");
		if(enemy.hasCock(GLOBAL.TYPE_DEMONIC)) output(", a feat that would leave astonished onlookers stunned. There must be around two feet of dick inside (at LEAST!) and <i>you STILL have room!</i>");
		output(" Euphoria puddles inside you, girlish lube mixing with herm-spooge and drooling hot across your conjoined loins. Moving around is even easier, like gripping a flight stick in your hand and maneuvering skillfully through three dimensions. <i>“You’re the best!”</i> she wails, biting her lip cutely. <i>“Ohhh yesss...!”</i>");
	}
	pc.cuntChange(x,enemy.cockVolume(0));
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
	addButton(0,"Inside",letTheFookdollCumInside,x,"Inside","Let it happen...");//9999
	addButton(1,"Outside",outsideCummiesForFutaSexdolls,x,"Outside","The last thing you need is to be swollen with some mind-broken doll's kids!");
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
	if(pc.vaginalPuffiness(x) < 2) choices.push(2);
	if(pc.clitLength < 12) choices.push(3);
	//Wetness can combo with 1 other change:
	if(pc.wetness(x) < 5 && pc.vaginalPuffiness(x) < 2) choices.push(4);
	if(pc.wetness(x) < 5 && pc.clitLength < 12) choices.push(5);
	//Pick a change if any avail.
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];
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
	pc.loadInCunt(enemy,x);
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
	if(pc.vaginalPuffiness(x) < 2) choices.push(2);
	if(pc.clitLength < 12) choices.push(3);
	//Wetness can combo with 1 other change:
	if(pc.wetness(x) < 5 && pc.vaginalPuffiness(x) < 2) choices.push(4);
	if(pc.wetness(x) < 5 && pc.clitLength < 12) choices.push(5);
	//Pick a change if any avail.
	var select:int = -1;
	if(choices.length > 0) select = choices[rand(choices.length)];

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
	output("They say that there’s a time and place for everything. Some people would tell you that the time to get your [pc.cockNounComplex] wet <i>isn’t</i> while your " + ((flags["KIRO_BF_TALK"] == 1)  ? "girl":"") + "friend is being turned into the exact kind of slut doll you’re about to lay with. You didn’t listen to those kinds of people when you made your cock this big in the first place and you’re certainly not going to listen to them now!");
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
	if(pc.hasCocks()) output(" Your other member" + (pc.cockTotal() > 2 ? "s tingle and pulsate":" tingles and pulsates") + " along with " + (pc.cockTotal() == 2 ? "its":"their") + " brother, feeding off of the residual chemicals to begin " + (pc.cockTotal() == 2 ? "it's":"their") + " own, less impressive, growth.");
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
	output("\n\nBefore you can answer, she starts bouncing with fiendish energy. Her [enemy.hips] become a blur as she ramps up and up, all the while she stares down at you. No matter how much her face contorts, her eyes never leave yours, almost as if she’s staring into your mind and rearranging it to suit her needs. She starts shouting out, screaming about how much she loves your dick and what a stud you are. Her pace is frantic, never slowing down or missing a beat.  She’s taking you over the edge, whether you want it or not.");
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
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	output("\n\n");
	CombatManager.genericVictory();
	return;
}

public function loseToTheSexdoll():void
{
	showSexDoll(true);
	author("Fenoxo");
	output("(WIP. Bad end to appear here.)\n\n");
	CombatManager.genericLoss();
}

