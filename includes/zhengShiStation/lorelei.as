public function showLorelei(nude:Boolean = false, futa:Boolean = false):void
{
	if (futa)
	{
		if (lorelei.cLength() < 12) showBust("LORELEI_TERRAN");
		else if (lorelei.cLength() < 24) showBust("LORELEI_CANINE");
		else showBust("LORELEI_EQUINE");
	}
	else if (nude) showBust("LORELEI_NUDE");
	else showBust(lorelei.bustDisplay);

	if (flags["MET_LORELEI"] == undefined) showName("\nTHIEF");
	else showName("\n" + lorelei.short.toUpperCase());
}

public function loreleiHeader(nude:Boolean = false, auth:Boolean = true):void
{
	showLorelei(nude);
	if (auth) author("B");
}
// Update this function when there are futalei busts
public function loreleiFutaHeader(auth:Boolean = true):void
{
	showLorelei(true, true);
	if (auth) author("B");
}

public function rollForLorelei():Boolean
{
	if (isLoreleisBitch()) return false;
	if (flags["LORELEI_BEATEN"] != undefined) return false;

	var lowerRate:int = 0;
	if (flags["SUBMITTED_TO_LORELEI"] != undefined) lowerRate += flags["SUBMITTED_TO_LORELEI"];
	if (flags["LORELEI_LUST_LOSSES"] != undefined) lowerRate += flags["LORELEI_LUST_LOSSES"];
	return rand(10) >= lowerRate;
}

public function tooBigForLorelei(cock:CockClass):Boolean
{
	if (cock.cLength() > 12) return true;
	if (cock.thickness() > 2) return true;
	return false;
}

public function isLoreleisBitch():Boolean
{
	if (pc.hasKeyItem("[lorelei.name]'s Collar")) return true;
	return false;
}

public function isLoreleisBitchVisibly():Boolean
{
	return collarOwnerName() == "[lorelei.name]";
}

public const loreleiExit:String = "ZSR L31";

//Returns the gem stolen, if any.
// From B: deduct 1/10 of the PC’s credits; remove one random Gem from their inventory, if applicable. Reduce Minuet’s encounter rate, but not to 0.
public function loreleiStealsYourThings(factor:Number = 10):void
{
	var cashMoney:int = Math.floor(pc.credits/factor);
	var gem:ItemSlotClass = null;

	//take a gem
	var possibleGems:Array = new Array();
	for (var i:int = pc.inventory.length - 1; i >= 0; i--)
	{
		if (pc.inventory[i].type != GLOBAL.GEM || pc.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) continue;
		possibleGems.push(pc.inventory[i]);
	}
	if (possibleGems.length > 0) gem = RandomInCollection(possibleGems);

	pc.credits -= cashMoney;
	output("\n\n<b>Minuet has taken " + cashMoney + " of your credits");

	if (gem)
	{
		pc.destroyItemByReference(gem);
		output(", and she’s taken ");
		if (pc.hasItemByReference(gem)) output(indefiniteArticle(gem.longName));
		else output("your " + gem.longName);
	}
	output(".</b>");

	if (gem) lorelei.credits += Math.floor(gem.basePrice/2);
	lorelei.credits += Math.floor(cashMoney/2);
	if (lorelei.credits > 0 && lorelei.inventory.length > 0) lorelei.inventory.pop();
}

public function loreleiRandomEncounter():Boolean
{
	if (flags["LORELEI_STALKING"] == undefined) loreleiIsWatching();
	else if (pc.reflexes() < 25) loreleiIntroducesHerselfToSlowPCs();
	else if (flags["SUBMITTED_TO_LORELEI"] != 3) loreleisAmbushGotFoiled();
	else loreleiMakesAnOfferYouProbablyDontWantToRefuse();

	return true;
}

public function loreleiIsWatching():void
{
	clearMenu();
	clearOutput();
	author("B");
	processTime(1);

	if (pc.reflexes() < 25)
	{
		output("<b>You can’t help but feel like you’re being watched.</b>");
		output("\n\nZheng Shi being the sort of place it is, it could just as easily be some cleverly-hidden surveillance equipment keeping tabs on your movements, but you don’t see anything out of the ordinary around you. When you stop to survey your surroundings, the feeling persists, but everything appears to be in order.");
		output("\n\nYou wonder how long it’s going to keep up....");
	}
	else
	{
		output("<b>You’re being watched.</b>");
		output("\n\nIt’s not easy to tell, but there’s a general, ominous feeling of having a pair of eyes scrutinize your every step. You’ve learned to trust your instincts well enough, and there’s also something just... <i>off.</i> Your footsteps sound heavier; you hear faint echoes from behind you and around corners. It’s too much to ignore.");
		output("\n\nYou stop and listen for anything out of the ordinary. It’s difficult to pick out the finer, quieter sounds through the general thrum of Zheng Shi – from the sound of mining work and equipment in the distance, and of air traveling through vents providing oxygen throughout the base – but you stay keen. Your reflexes are well honed; you’ll be able to pinpoint any sound, provided a sound is made.");
		output("\n\nYou pivot and look into the darkness of the asteroid base, where you came from. You say nothing as your eyes scan the walls, looking for anything – a movement, or a cloud of dust rising around an exhaling mouth.");
		output("\n\nThere’s nothing to find, but you know better. You’re being followed by a professional.");
		output("\n\nIt wouldn’t matter if you called them out on it; they have you in their sights, and it’s only a matter of time until they strike, whether you’re ready or not. With any luck, they’ll assume that you aren’t.");
		output("\n\nYou continue forward, tense, but ready.");
	}

	flags["LORELEI_STALKING"] = 1;
	addButton(0, "Next", mainGameMenu);
}

public function loreleisAmbushGotFoiled():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	output("You make your way deeper into Zheng Shi–");
	if (flags["MET_LORELEI"] == undefined)
	{
		output("\n\nThe unmistakable sound of footsteps, however light and drowned out from the echo and bustle of the mines, approaches you from behind. For a few moments, you thought you were just getting a bit claustrophobic from the mines, but you’re <i>absolutely</i> being followed, and they’re moving to strike <i>right now.</i>");
		output("\n\nYou leap forward and pivot on the spot, lunging away from your assailant. Standing only a few inches from where you were, in the dim light, is a woman.");
		output("\n\nWhoever she is, she stands at just shy of six feet tall. Most of her body is concealed, from the neck down, in a skintight, pitch-black body suit, clinging to her features and curves tightly, emphasizing her generous D-cup breasts. She’s an untainted human, with darkly-tanned cheeks (and, presumably, skin); if she has any features or attributes from any other alien species, you can’t see them. She has snow-white hair reaching to her neck, brushed to intentionally cover her right eye; her left, dressed with blue eyeshadow, trains on you with the intensity of a viper, taking in your every movement, no matter how slight.");
		output("\n\nShe huffs, in equal parts surprise, appreciation, and disgust, at your abilities and how you managed to outpace her. <i>“Nicely done, [pc.name] Steele,”</i> she congratulates, as she slinks into an aggressive stance: her right foot back, both palms out and forward. A crackle of electric energy leaps from between her digits, to her palms, and back. In her left hand, you see a flash of something metallic gleaming in the light, before, with a sleight of her hand, it disappears entirely. <i>“I suppose I shouldn’t have expected anything less from someone of your... upbringing.”</i>");
		output("\n\nYou ask her who she is, and what she wants.");
		output("\n\n<i>“Oooh,”</i> she whines, leaning backward, <i>“you sound so... formal. Not even going to give a pretty lady a ‘how do you do,’ are you?”</i>");
		output("\n\nYou don’t reply.");
		output("\n\n<i>“Fine,”</i> she says, dropping the pretence. <i>“I know every last thing there is to know about you, [pc.name], but you’ll forgive me if I’m not in the business of being on a first-name basis with my targets. You can call me Minuet for now.”</i>");
		output("\n\n<i>“And, as for what I want,”</i> she continues, her fingers rubbing together, coaxing out another arc of static electricity between them, <i>“");
		if (ratsGemCount() > 0) output("I can hear the symphonic jingle of gems from anywhere in the base, honey, and I want them for myself. Pretty gems belong with a pretty girl like me, don’t you think?”</i> She pauses. <i>“And, ");
		output("I want your credits. A girl’s gotta eat, after all.”</i>");
	}
	else
	{
		output("\n\nYou know that Minuet is still following you and watching you, and you get the distinct impression that she knows you know. You sense her shift somewhere in the darkness, like she’s tensing and about to strike; you pause, then ready yourself, making yourself rigid and ready for anything she attempts, from any angle.");
		output("\n\nSomewhat surprisingly, Minuet doesn’t attempt to strike from behind, or from the shadows: instead, with a leap, she descends from above you and in front of you, landing on her feet with the grace of a cat in its home turf, her feet hitting the dust so silently and softly that she doesn’t disturb it.");
		output("\n\n<i>“Hello again, " + pc.mf("handsome", "gorgeous") + ",”</i> she says, bringing two fingers up to her forehead and winking at you. She sways her hips from side to side a few times, loosening herself up for what you both know is about to come next. <i>“Feel like making it easy for me, this time?”</i>");
		output("\n\nYou’d laugh if you weren’t dealing with someone as capable as her. Any misstep could be disastrous.");
		output("\n\nShe scoffs, then gets into her own battle-ready stance, her fingers splaying and electricity crackling between her fingers. <i>“I have to admit, darling, as much as you’d make such a lovely prize, I rarely deal with anyone as capable as you. You make for an exhilarating challenge!”</i>");
	}
	output("\n\n<b>You’re fighting Minuet!</b>");

	flags["MET_LORELEI"] = 1;
	setupMinuetFight();
}

public function loreleiIntroducesHerselfToSlowPCs():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	output("You make your way deeper into Zheng Shi–");

	if (flags["MET_LORELEI"] == undefined)
	{
		output("\n\n<i>“Don’t move.”</i>");
		output("\n\nBefore you know it, your right arm is pinned behind your back, held in place by a woman that had moved silent as the night. Something sharp and thin presses insistently against your neck.");
		output("\n\n<i>“The legendary [pc.name] Steele, in the flesh,”</i> she purrs, her warm breath caressing your bare neck, where her needle meets your [pc.skinFurScales]. Despite the strength going into keeping you in place, the hand gripping your wrist feels rather soft, like she’s wearing silk gloves. <i>“");
		if (silly) output("As dark and serious as your cousin. ");
		output("My, darling, but what brings you to this rank pit? Don’t tell me someone of your stature has thrown their lot in with some petty thieves.”</i>");
		output("\n\nA few responses come to mind, but every time you think you’re about to say something, her needle keeps you in check. Noting the risk, you take the less-risky option and ask whom you’re speaking with.");
		output("\n\n<i>“You’ll forgive me if we’re not quite on a first-name basis yet, cutie,”</i> she teases. <i>“You can call me Minuet for now. Just for now, hun.”</i>");
		output("\n\nYou try and flex a bit, to turn and see Minuet, but she keeps you held fast, and her needle grazes against you. <i>“Ah ah,”</i> she trills playfully. <i>“I prefer you where you are, right here.”</i> Seems you’ll need her permission before you can get a look at her.");
		output("\n\n<i>“It’s not every day you get to meet the " + pc.mf("heir", "heiress") + " to a throne as gilded as Steele Tech’s head position,”</i> she says. You feel her body press into you, and her chin resting against the thick of your shoulder, as she appreciates you and your form. This visit may be as much pleasure for her as it is business. <i>“");
		if (flags["ZHENG_SHI_PROBED"] == 1) output("You came here for daddy’s probe, right? Heaven knows why you’ve stuck around.");
		else output("You’re here for daddy’s – what, third, fourth probe, if I’m right?");
		output(" Ah, but you’ll forgive me if we skip the pleasantries.”</i>");
		output("\n\nYou ask her what");
		if (!pc.isNice()) output(" the fuck");
		output(" she wants. <i>“Oooh, already so... </i>willing,<i>”</i> she says. <i>“We can work with that later, darling, if you’re interested. But for now, see, I think</i> I’d <i>rather help</i> you.<i>”</i>");
		output("\n\nYou don’t like the sound of that, but you’re not in a position to argue.");
		output("\n\n<i>“Mmmm,”</i> she hums as she leans back. You can feel her eyes roam across your body, towards your waist. <i>“Credit chits are unwieldy, cumbersome things, aren’t they?”</i> she asks, her voice light, like she’s making schoolyard conversation. <i>“Why don’t you let me take them off your hands, darling? They must weigh so much on you.”</i>");
		if (ratsGemCount() > 0) //Hurray for reusing code
		{
			output("\n\nShe rummages around behind you some more, taking inventory of your belongings. <i>“Goodness,”</i> you hear her mutter to herself. <i>“</i>And <i>you’re carrying some awfully pretty stones around. Pretty things like that belong to a pretty girl like me, don’t you think?”</i>");
			if (pc.isAss()) output("\n\nYou tell her that if she looks half as ugly as her personality, she should consider it a blessing. <i>“Ooh, feisty,”</i> she hisses. The pinch of her needle presses into your [pc.skinFurScales]. Maybe you should shut up. <i>“I’ll be sure to keep that temper of yours in mind next time, darling.”</i>");
		}
		output("\n\nMinuet has you in a pretty poor spot: her grip is tight on your hand, and even if you had the strength to break free");
		if (pc.physique() >= 25) output(" (and you’d be surprised if you didn’t)");
		output(", she could gut your neck before you could do any damage to her. One slip of her fingers, and you’d start bleeding out on the spot.");
		output("\n\nDo you submit to her demands?");
	}
	else if (flags["SUBMITTED_TO_LORELEI"] == 2)
	{
		output("\n\nOnce again, your arm is pinned behind you – you’re starting to get awfully familiar with the way Minuet is introducing herself to you. You initially struggle, but then relax, when you feel her grip on your wrist and the way her body softly presses against your backside. She even takes her time bringing her needle up to your neck, as if it were a formality rather than a threat.");
		output("\n\n<i>“Hello again, " + pc.mf("handsome", "beautiful") + ",”</i> Minuet purrs. You don’t strain against her, and although her grip on your wrist is just as strong as ever, she’s only putting in as much effort to keep you restrained as you are to try and break free. <i>“What’s a good-looking honey like yourself doing in a dump like this?”</i>");
		output("\n\nYou note that you two are getting awfully comfortable with each other, as of late. <i>“And it’s terribly unprofessional of me, I know,”</i> she sighs, <i>“but you’ve just been such a wonderful target, [pc.name] Steele. I oh-so love it when people just</i> give <i>me what I want without having to make things difficult, and, given our business record, so do you.”</i>");
		output("\n\nShe leans into your body once more, pressing her own softly against yours. <i>“I don’t normally do this, honey, but I’ve been thinking of maybe... giving you a ‘loyalty reward.’ For being such an easy target all this time.”</i> Boldly, she rests her cheek against your shoulder and dips her needle away, kissing the spot it had just been practiced on. <i>“You’ve been such a fountain of fortune for me – the least I could do is share the fun a bit, don’t you think?”</i>");
		if (pc.isAss()) output("\n\nYou tell her that she would definitely be one of the ritzier whores you’ve ever spent your money on. <i>“Hmm,”</i> she hums, pulling away from you, <i>“they certainly didn’t bother to take that silver spoon out of your mouth so they could teach you some manners.”</i> She pulls back in, dropping her voice to a whisper. <i>“But that’s alright,”</i> she purrs, <i>“I’ve broken my share of " + pc.mf("bulls", "cows") + " before. I could show you, if you’re not willing to cooperate this time.”</i>");
		else output("\n\nYou wonder if there isn’t an easier way to do this – one where you both have a ‘good time,’ <i>without</i> it costing you a huge chunk of your cash. <i>“Mmm, I’m afraid I’m not quite</i> that <i>generous, darling. Nothing good in this universe is for free.”</i> She leans back and clicks her tongue as she eyes your pack. <i>“But I can promise that it’ll be ever-so worth it.”</i>");
		output("\n\nAs before, Minuet is demanding your credits");
		if (ratsGemCount() > 0) output(", and she’s probably after one of your gems as well");
		output(". Do you submit to her extortion and give her what she wants?");
	}
	else
	{
		output("\n\n<i>“Don’t move.”</i>");
		output("\n\nOnce again, your hand is locked behind your back, and you feel the slight sting of a needle and its point pressing against your neck. Minuet has sprung her trap on you once again, and you’re at her mercy.");
		output("\n\n<i>“Fancy seeing you again, darling,”</i> she muses. Last time, she handled you rather roughly, though this time, while her grip is just as strong, she’s rather lax on her treatment on you. <i>“Still on your best behavior, I trust?”</i>");
		output("\n\nYou respond that you wouldn’t dream of acting out, with her and her needlepoint as they are. <i>“Good [pc.boyGirl],”</i> she purrs, her body pressing gently against your back. <i>“Been keeping the bad guys at bay?”</i>");
		output("\n\nWell... clearly not.");
		output("\n\n<i>“I’m hurt!”</i> she pouts. <i>“I’m as angelic as they come, darling. You just haven’t gotten to know the good side of me.”</i> She laughs to herself. <i>“Or... any side, now that I think about it.”</i> Her lips pull in, against your ear, and she licks her lips; she’s close enough to you that you can hear her tongue run over them. <i>“We don’t have to be enemies, you know. Maybe I can show you a friendlier side of me someday.”</i> Her voice drops to a whisper; you feel her hot breath against your ear as she mouths, <i>“maybe more than just one side.”</i>");
		output("\n\nShe pulls back, resuming her regular posture. <i>“But that’s a conversation for a less... volatile time, darling. You know what I’m after. Are you going to be a nice [pc.boyGirl] like last time and not give me a fuss about it?”</i>");
		output("\n\nLike last time, Minuet wants your credits");
		if (ratsGemCount() > 0) output(", and, probably, one of your gems");
		output(". Do you give them to her?");
	}

	addButton(0, "Yes", loreleiAcquiresAGemOfSteele);
	addButton(1, "No", loreleiGetsToldLoreleiNoSwiping);
}

public function loreleiAcquiresAGemOfSteele():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	if (flags["MET_LORELEI"] == undefined)
	{
		output("You tell Minuet that you don’t want to be hurt. You’re just here for the probe. She’s welcome to whatever she wants if it means getting out without any trouble.");
		output("\n\nMinuet clicks her tongue in disappointment. <i>“I can tell you, [pc.name], with an attitude like that, in a place like this, there certainly will be an awful lot of ‘probing’ in your future. The heir to something like Steele Tech should be a little harder to break than just a prick in the neck.”</i>");
		output("\n\nThe needle against your neck is withdrawn, but before you can react, you feel her press her finger against the same spot – followed by a quick, but powerful, shock of electricity coursing through your body. It’s enough to stun and disable you, but not enough to leave any lasting damage.");
		output("\n\nYou crumple to the dirty floor of the mine, but, as you fall, you feel two <i>extremely</i> practiced, dexterous hands work across your body, pilfering your belongings before you finally hit the ground with a thump. She moved so fast, and with such efficiency, you’d think she had four hands, if not more. Hell, for all you know, maybe she does.");
		output("\n\n<i>“I don’t think you made the wrong decision, darling,”</i> she says. <i>“Few things are as precious as a life... but, fewer still are things as beautiful as money.”</i>");
		output("\n\nYou see a black shoe, or perhaps some kind of boot, enter your vision as she steps in front of you. <i>“I’ll be rooting for you, honey,”</i> she continues, and you can hear her blow you a kiss. <i>“Be sure to find that probe. We could both use the float.”</i>");
		output("\n\nYou blink – and she’s disappeared into the shadows completely. You didn’t even hear her start running. It takes you a moment to regain the motor skills to turn your head and lift yourself up; when you do, you inspect the area. Minuet didn’t even leave any footprints in the dust other than when she had you in her arm lock.");
		output("\n\nOf course, when you go to check your belongings, you can definitely confirm that you weren’t dreaming, at least.");
		loreleiStealsYourThings();

		flags["MET_LORELEI"] = 1;
	}
	else if (flags["SUBMITTED_TO_LORELEI"] == 2)
	{
		output("Your life and well-being is worth more than some credits. You tell Minuet that she’s free to take what she wants – you ask her, in return, not to hurt you.");
		output("\n\nMinuet takes a deep breath, hissing through her teeth. You can tell that she isn’t mad, but your continued non-resistance is certainly making her consider her options. <i>“You know what you are?”</i> she starts, her voice low and sensual: whatever she’s about to say, she means it in the nicest way possible. <i>“You’re the prettiest, shiniest [pc.boyGirl] in the world, wearing a shirt that says ‘Fuck My Ass,’ walking down the dirtiest, meanest alleyway this side of the slums.”</i>");
		output("\n\nHer needle is replaced by her finger, and, as you’ve grown accustomed to, a shock courses through your body, robbing you of your motor functions and sensations. As you collapse to the ground, Minuet’s hands work on your body and in your pack, lightening its load and taking what she’s been after since the beginning.");
		output("\n\nYou hit the ground with a thump, still twitching from the electricity. Minuet’s dark shoe enters into your field of vision once again. <i>“Keep it up, darling, and somebody may just take you up on that offer. I can’t always be around to save your skin from anyone</i> truly <i>dangerous!”</i>");
		output("\n\nYou blink – and she’s disappeared into the shadows completely. You didn’t even hear her start running. It takes you a moment to regain the motor skills to turn your head and lift yourself up; when you do, you inspect the area, and Minuet didn’t even leave any footprints in the dust, other than when she had you in her arm lock.");
		output("\n\nOf course, when you go to check your belongings, you can definitely confirm that you weren’t dreaming, at least.");
		loreleiStealsYourThings(3);
	}
	else
	{
		output("You tell Minuet that she’s welcome that whatever she wants, like before, as long as she doesn’t hurt you. You still need to be in one piece to claim that probe.");
		output("\n\nShe hums in thought at your words. <i>“You</i> are <i>aware that Zheng Shi runs a slave trade, correct?”</i> she asks. <i>“You’ll need to grow a spine, and in a hurry... unless you</i> want <i>some big, strong Laquine with tits out to Tavros and a baseball bat for a dick to stamp their name on your neck and put you through the paces?”</i>");
		output("\n\nThe needle on your neck is, once again, replaced by her finger, and, once again, a quick, powerful jolt of electricity arcs through your body. It’s not enough to do any serious damage, but it’s enough to rob the sensation from your limbs, and as you collapse, Minuet’s practiced hands work their technique on your wares, clipping what they’re after from you as you tumble.");
		output("\n\nHer black shoe comes into your vision for a moment. <i>“Keep up the wallflower act, [pc.name], and you’ll have your wish sooner rather than later.”</i> You hear, but you can’t turn your head to see, her blow a kiss in your direction – coming from her, it almost sounds like a promise rather than a threat. <i>“I’d sooner see you in a cage than in a casket.”</i>");
		output("\n\nYou blink – and she’s disappeared into the shadows completely. You didn’t even hear her start running. It takes you a moment to regain the motor skills to turn your head and lift yourself up; looking around, Minuet didn’t even leave any footprints in the dust, other than when she had you in her arm lock.");
		output("\n\nOf course, when you go to check your belongings, you can definitely confirm that you weren’t dreaming, at least.");
		loreleiStealsYourThings(6);

		flags["SUBMITTED_TO_LORELEI"] = 1;
	}
	
	output("\n\nAnd, to top it all off, you get the distinct feeling that she’s still watching....");

	IncrementFlag("SUBMITTED_TO_LORELEI");
	addButton(0, "Next", mainGameMenu);
}

public function loreleiGetsToldLoreleiNoSwiping():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(1);

	output("Minuet gives you a second to decide on your answer, and that’s all you need. You lunge to your right, twisting yourself to get away from the needle against your neck and to right your arm in her grip. It works, but not perfectly: her reflexes are too fast, and she leaves a mark on your neck with a twist of the needle in her nimble fingers. On top of that, you feel a shock travel up your wrist and into your shoulder, taking the movement out of your arm.");
	output("\n\nAs soon as the electricity arced up your arm, you were primed for her to take down if she really wanted. But she doesn’t, and in fact, she lets you go, allowing you to twist around and face her for the first time, giving you a good look at her, even in the dim light of the mine.");
	output("\n\nMinuet stands at just shy of six feet tall. Most of her body is concealed, from the neck down, in a skintight, pitch-black body suit, clinging to her features and curves tightly, including around her generous D-cup breasts. She’s an untainted human with darkly-tanned cheeks (and, presumably, skin); if she has any features or attributes from any other alien species, you can’t see them. She has snow-white hair reaching to her neck, brushed to intentionally cover her right eye, and her left, dressed with blue eyeshadow, trains on you with the intensity of a viper, taking in your every movement, no matter how slight.");
	output("\n\nMinuet clicks her tongue coyly, like a parent that’s disappointed in their child, but not enough to discipline them. <i>“You’re lucky you’re worth more to me alive, [pc.name] Steele,”</i> she says, twisting the needle in her fingers before... it disappears entirely. A clever sleight-of-hand, you’re sure. <i>“Does your neck hurt?”</i>");
	output("\n\nYou put your hand to it, rubbing where he had nicked you. It feels hot and wet; when you withdraw, you see a bit of blood on your hand. Not enough to alarm you, but enough....");
	output("\n\n<i>“Keep in mind who it is you’re dealing with, darling, before you make a mistake you’ll regret,”</i> she says, and then steps back with her right foot, raising her palms toward you in a clearly aggressive stance. A crackle of electric energy arcs from between her fingers, to her palm, and back again.");
	output("\n\n<b>You’re fighting Minuet, and you’re injured.</b> It’ll take a bit of time before the feeling returns to your right arm!");

	flags["MET_LORELEI"] = 1;

	// end scene (scene: Intro, Check Consequences); go to (scene: Fight Minuet); open the fight with the PC disarmed for one turn.
	setupMinuetFight(true);
}

public function loreleiMakesAnOfferYouProbablyDontWantToRefuse():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	output("You make your way through Zheng Shi–");
	output("\n\nWith sudden, surprising ferocity, a pair of hands grab you by the shoulders, then pull you into the shadows of a nearby crevice – likely a service tunnel of some kind, forgotten and dilapidated. The motion is so fast that you’re disoriented for a short time, and when you finally gain your bearings, the place is too dark to make out a lot of the finer details. The light of where you came from shines through a small opening a few feet away from you.");
	output("\n\nA strong, familiar grip has your hand behind your back. Unlike every encounter before, however, there’s a sense of... excitement, or perhaps urgency, to Minuet’s actions. The familiar needle from before is against your neck once again, but, before, it merely grazed your [pc.skinFurScales], applying pressure but never leaving any marks: now, the point is thoroughly trained on you, and even pressing into you: again, not enough to leave a mark, but enough to hurt slightly. It seems she’s got something in particular on her mind.");
	output("\n\n<i>“And a good");
	if (hours < 4) output(" evening");
	else if (hours < 12) output(" morning");
	else if (hours < 20) output(" afternoon");
	else output(" evening");
	output(" to you again, [pc.name] Steele,”</i> Minuet says, her voice the same, sensual, flirty tone as ever.");
	output("\n\nYou’re getting mixed signals, and you aren’t positive how you should react, if at all.");
	output("\n\n<i>“Kaithrit got your tongue, is that it, darling?”</i> she asks. <i>“Perhaps my approach this time</i> is <i>a little more forward than usual. It’s just... I had an idea, and I got overexcited to share it with you.”</i>");
	output("\n\nShe presses her body into yours softly, but the trained point of her needle does not waver. <i>“Ever since our last encounter, I’ve gotten to thinking. About us, and how our relationship is going to proceed. We’ve been seeing an awful lot of each other lately; I’ll be the first to say that I’ve developed a bit of a soft spot for you, gorgeous.”</i>");
	output("\n\nSuddenly, the needle pressing into you withdraws, and she twirls it between her fingers skillfully and playfully as she continues. <i>“I know all about your little adventure to find your daddy’s beacons, so I knew you were here for it. The effort you went through to keep it a secret was commendable, but I</i> do <i>so love a challenge: once you and your cousin logged in with the harbormaster at Tarkus");
	if (flags["TARKUS_PROBE_CASH_GOT"] == -1) output(", and you happened to sell the probe to that adorable raskvel woman");
	output(", it wasn’t difficult to connect the dots from there. I just didn’t think you were foolish enough to come in and try and steal it from a base full of thieves. It was clear, shortly after our first little liaison together, that you weren’t here as part of any of the local gangs, or that you were a pirate yourself.”</i>");
	output("\n\nHer needle returns, drawing slight, circular patterns into your neck, as she speaks. Her performance with something so small, light, and deadly, is truly impressive. <i>“I got to thinking that, if you were the type to submit to myself so easily, then you would be little more than fresh meat for the other pirates. It wouldn’t do if you were inducted into their ranks. No, it wouldn’t do at all, [pc.name]! I can’t allow someone as precious as yourself to succumb to those brutes.”</i>");
	output("\n\nShe jabs her foot harshly");
	if (pc.isNaga() || !pc.hasKnees() || !pc.isBiped()) output(" into the base of your spine, where your body meets your [pc.lowerBody]");
	else output(" into the back of your [pc.knee], bringing you down to one side. Understanding the notion, you shift your other knee down with it");
	output(", dropping you down into a kneeling position.");
	output("\n\n<i>“Everyone on Zheng Shi, apart from yourself, is either a pirate of some factor among their ranks... or, they’re a slave.”</i>");
	output("\n\nFor the first time, she steps around you, towards your front. It’s too dark for you to make out her details, however, and, not helping things, her suit is pitch black all over. The most you can make out is her silhouette: she’s a shapely woman, with a matronly hourglass figure, but you can’t make out her sizes or her facial features in this light.");
	output("\n\n<i>“And I know you. I know you better than I’m sure you’d find comfortable, " + pc.mf("handsome", "beautiful") + ". You’re not a slave");
	if (pc.armor is Slavesuit) output(", and that getup of yours isn’t fooling me for a moment");
	output(". But, all of our meetings together,”</i> she sighs, drawing one gloved hand up the side of her thigh slowly, <i>“you’ve proven that you’re simply... too easy to take advantage of.”</i>");
	output("\n\nShe bends at the waist to reach the same hand towards you. It draws a lazy, gentle circle around your jaw, before coming to a rest just beneath your chin. <i>“So, I decided... if you’re no pirate, and you’re on Zheng Shi, then I might as well make you</i> my <i>slave. Why bother taking your credits, darling, when I can just snatch</i> you <i>up, as my greatest prize?”</i>");
	output("\n\nThe words leave her mouth as a stutter; she’s so excited by the idea that she can barely contain it. She continues, her hand coming back up and rubbing her fingers languidly through your [pc.hair]. <i>“Think about it. You wouldn’t have to worry about any of the other undesirables on the base trying to take you for their own if they know you’re owned property. And, best of all,”</i> she hisses, her voice quaking in barely-contained excitement at the thought, <i>“you’d belong to</i> me. <i>Like all the universe’s most beautiful things should.”</i>");
	output("\n\nYou note that, from the way she’s talking, she’s making it sound like you have a choice in the matter. <i>“Oh, of course you do, darling,”</i> she assures you, rubbing your scalp like you were a kid and you just said something silly. <i>“I could slap one of that Urbolg’s collars on you and call it a day, I could. But for you to</i> give <i>me control like that would mean that I’ve stolen your heart – and, any woman would tell you, there is nothing more valuable in this world than that.”</i>");
	output("\n\n<i>“Come, [pc.name],”</i> Minuet says, her palm coming down to rest against your cheek, caressing it as if she were about to lean in and give you your first kiss. <i>“Enough with the games. No more threats; no more stealing. You’ve never put up a fight before. Why start now?”</i> She leans over you, her breath washing against your ear; her tongue snakes out and gives your earlobe a thorough, but teasingly-quick, pass. <i>“If you’re a good [pc.boyGirl] and give me what I want without a fuss, I’m willing to... shall we say,</i> celebrate <i>your</i> inauguration.<i> To make things more enticing.”</i>");
	output("\n\nMinuet’s words ring heavily in your ears. You’re in some forgotten service hallway – if it’s even that long, it could very well be some kind of closet – on your [pc.knees], facing a woman you’ve met, but never seen, before, and she’s asking you to wilfully become her slave. And she’s promising you a <i>very</i> good time if you accept.");
	output("\n\nDo you?");

	addButton(0, "Yes", loreleiClaimsHerselfAPrizeRusher);
	addButton(1, "No", loreleiIJustWantedToGetRobbedNotEnslaved);
}

public function loreleiClaimsHerselfAPrizeRusher():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	output("Truth be told, it sounds like a good deal to you. Minuet may be a thief, but so far, she’s kept to her word about not seriously injuring you when you do as she asks, which is more than you can say about a lot of people you’ve met on your journey. If anyone is going to treat you with at least <i>some</i> respect in Zheng Shi, it’ll probably be her. And besides – ");
	if ((pc.hasCock() && pc.cockVirgin) || (pc.hasVagina() && pc.vaginalVirgin) || (!pc.hasGenitals() && pc.analVirgin)) output(" maybe it’d be best to ‘break yourself in’ on someone that’ll treat you better than some others.");
	else output(" you’re not really one to turn down a good time.");
	output("\n\nYou tell Minuet that you’re in.");
	output("\n\nShe takes a deep breath through her nose, hardly able to contain her excitement. <i>“I’ll make sure you don’t regret it,”</i> she says, and, with a flick of her wrist, she produces a large, thin, silver ring, with glowing green jewels inlaid along its outside circumference, spelling out a word. <i>“Hold still,”</i> she instructs, before quickly whacking it against your neck.");
	if (hasWornCollar()) output("\n\nThe collar, like some kind of magnet, snaps directly around " + collarOwnerName() + "’s, already fastened to your neck, and conforms to its shape snugly. Minuet’s collar sits on top of " + collarOwnerName() + "’s, ‘overwriting’ it with itself and preventing anyone from seeing who else you belong to; it seems as though your new mistress isn’t a fan of sharing.");
	else output("\n\nThe collar slaps around your neck like a handcuff, snapping around you and latching itself into place snugly. It’s large enough to not feel uncomfortable or restrict your range of movement with your neck, but tight enough that you’re not going to slip free of it anytime soon. You give it an experimental tug – it doesn’t quite feel like metal. In fact, it feels kind of cushiony against you.");
	output("\n\n<i>“I’m not usually the type to label my belongings, but here in Zheng Shi, you need to look the part,”</i> she says, examining the collar and running a loving, appreciative finger along its glossy edge. <i>“If it helps, you look positively radiant in it, darling.”</i>");
	output("\n\nYou sit, waiting for Minuet to make good on her half of the offer. <i>“And I do believe I promised you something in return,”</i> she says, her voice lilting sensually. She pivots around, her back to you, trusting her new property to not try anything untoward.");
	output("\n\nShe bends at the waist, the expanse of her wide ass pressing and straining against the pitch-black material of her suit. You can hear it creak with constrained effort as she bends, the material smoothing out around the swells of her ass and against her meaty thighs. Then, slowly but suddenly, a hole materializes, directly over her damp crotch – it does not tear, at least not like a typical fabric would: the hole is symmetrical, turning into a perfect circle around her pussy, and it sounds more like it’s ‘peeling’ than tearing.");
	output("\n\n<i>“It’s time we inaugurate you as my property, darling,”</i> she says, wriggling her hips toward you. The scent of her horny honeypot wafts toward you, and her expansive ass pushes in your direction, inching towards your face. You just need to complete the circuit and lean forward. <i>“Your new mistress needs serving.”</i>");
	output("\n\nThis is, in fact, what you signed up for.");

	addButton(0, "Next", loreleiTriesOutHerLatestAcquisition);
}

public function loreleiTriesOutHerLatestAcquisition():void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);
	processTime(15);

	output("You lift your arms and wrap them around the circumference of Minuet’s ass, interlocking your fingers at the small of her back. With your balance secured, you lean forward and press your [pc.lips] to her own, planting a wet, elongated, and oh-so-willing kiss against her mons, feeling her moisture saturate your lips and dribble down your chin a bit.");
	output("\n\n<i>“Ahh,”</i> she sighs, delighting in your total submission beneath her. She shifts her ass back and forth, nestling you deeper into the crack of her ass, ensuring that your mouth is firmly planted against her and that you’re not about to leave. <i>“Welcome to Zheng Shi, darling,”</i> she sighs, and you feel her body shake when you dig into her with your [pc.tongue].");
	output("\n\nFor a woman that spends most of her time wearing a skintight bodysuit and sneaking around in a hot, stuffy mine, Minuet tastes... particularly fresh, like she had just stepped out of the shower. You palm the material of her suit, and it doesn’t feel like any kind of leather or latex you’ve ever come across: pliant, but taut; strong, but flexible; and cool to the touch. You wonder, in between long, fat licks of her cunt, if you’ll have the time to ask her about it.");
	output("\n\nMinuet clearly wants to hump your face with her ass, and you press forward, inviting her to frame your face with as much of herself as she can. She giggles to herself as you do: you can feel her upper body twisting to look over her shoulder to admire her newest acquisition, and every time your tongue laps at her vulva, your tip nudging and tickling her budding clit, she shudders down to her knees.");
	output("\n\n<i>“To think my trip to Zheng Shi would involve</i> this<i>,”</i> she says. <i>“My pants down, with [pc.name] Steele [pc.himHer]self face-deep in my muff, wearing a collar with my name on it.”</i> You tilt your head, adjusting your angle upward so you can pierce deeper into her pussy, your [pc.tongue] mapping out her every contour and muscle, tasting every delicious drop as it goes – you get the feeling you’ll be spending a lot of time in her pussy like this, so you make it a point to memorize the ‘lay of the land,’ as it were. <i>“I had heard stories that your old man was a bit of a Casanova himself.”</i> She hisses in pleasure. <i>“If pleasuring women runs in the family, consider yourself very gifted.”</i>");
	output("\n\nYou rub at the fat of her ass with both palms, squeezing her butt through the stretched material of her suit and giving your hands something to do. Her ass is toned, but massive all the same: she’s got a real pair of breeder’s hips on her. You lift them and spread them when you press in deeper, meshing your face as tightly and wetly into her body as you can, and when you lean back to give your neck a rest, you push her cheeks together, smothering yourself into her expanse.");
	output("\n\n<i>“And you’re so eager!”</i> she compliments, enjoying your every motion. <i>“Goodness me, darling, it’s almost as if you were hoping I’d make you mine as much as I was. I’ll be sure to give you as much pussy as you can handle, if you’re going to eat me out</i> this <i>eagerly every time.”</i> You say nothing – your mouth is full, after all. <i>“[pc.name],”</i> she continues, <i>“you may touch yourself, if you’d like. I am not a greedy mistress.”</i>");
	if (pc.hasGenitals())
	{
		output("\n\nDoing as she suggests, you drop your right hand,");
		if (pc.hasCock()) output(" fishing out your [pc.cock], turgid, leaking, and ready for a beating, from your [pc.lowerGarments]");
		else output(" dipping it into your [pc.lowerGarments] and raking your fingers along your puffy, leaking [pc.vagina], twiddling your [pc.clit] with your palm as you shove two-digits deep into yourself");
		output(". You had been so distracted with eating out Minuet, that you hardly noticed just how horny you were yourself.");
	}
	output("\n\n<i>“This is going to be</i> quite <i>a rewarding relationship for us both, darling, oomph,”</i> she grunts, bucking her hips against you. <i>“A girl like myself deserves a bit of pampering from time to time... and you get the privilege of being the one to pamper me.”</i> She giggles and wags her ass into you some more, ensuring you’re nice and deep.");
	output("\n\nYou eat away, tasting her every drop all the way to the back of your tongue.");
	if (pc.hasGenitals())
	{
		output(" You synchronize your dog-like lapping against her pussy with");
		if (pc.hasCock()) output(" jerks of your hand along your [pc.cock], coaxing your pre to splatter onto the floor, just before the heels of her shoes. You’re harder than you’ve been in recent memory");
		else output(" thrusts of your fingers into your own pussy, reaching deeper into you and at more exotic angles than usual. You’re more excited than you’ve been in recent memory");
	}
	else output(" You’re more excited than you’ve been in recent memory");
	output(", on your knees, orally serving Minuet – you can’t help but occasionally wonder if she had the right of it, and that you were just looking for the right person to take advantage of you in Zheng Shi. You’re lucky that she found you first.");
	output("\n\nMinuet’s knees buckle, and she steps forward, trying to lean into the far wall for support. You move with her, keeping your face firmly secured to her rear end, not allowing even an inch to form between you two. She giggles at your attentiveness, but says nothing; she just stands and gyrates her hips from time to time, humping against your mouth and fucking your tongue with her cunt.");
	output("\n\nShe sighs deeply, in through her nose and out through her mouth. Her body shudders in pleasure, starting between her shoulder blades and working its way down; you can feel her body quiver through her overpowering asscheeks against your face. <i>“Mmm, darling, I’m getting awfully close ,”</i> she says, her voice an octave higher than usual, and it spikes every time you pull your tongue out and thrust it back in.");
	output("\n\n<i>“A good heist always has me in the mood.”</i> She backs her butt up against you, bumping her hips against your head. <i>“I’m going to let you in on a dirty little secret of mine, [pc.name]. Sometimes... when I steal something particularly beautiful or precious... I like to touch myself with it.”</i> One of her hands dips between her legs, her fingers working at her clit, dragging it in tight circles with your incessant munching. <i>“It isn’t so often that my treasure touches me back. I should do it more often!”</i>");
	output("\n\nWith that, the words are done: she bends further down at the waist, giving you better access to her sex, and her hand goes into overdrive, frigging furious patterns into her button, driving her to the edge as quickly as she can. In a way, you’re <i>kind of</i> disappointed that this encounter didn’t go longer, but at the same time, you’re in a hostile environment, with your tongue throat-deep into your new mistress’s box. Perhaps you’ll get a better, more <i>extended</i> session with her sometime later.");
	output("\n\nHer breathing gets shallow, and her rocks and humps against your face become faster, but less focused and drawn; telltale signs of an orgasm just moments away. You maintain your pace, with your tongue inside her");
	if (pc.hasGenitals())
	{
		output(" and your hand");
		if (pc.hasCock()) output(" masturbating your [pc.cock] furiously, ready to shoot your load along the dirty floor and");
		else output(" pistoning inside you furiously, ready to burst your lady-load along the dirty floor and");
		output(" mark where you were officially inaugurated as Minuet’s personal property for the whole of Zheng Shi to see.");
	}
	else output(".");
	output("\n\nShe grunts, and tenses, and her crotch clamps down on your invading [pc.tongue], keeping it in place and rippling along its length, bathing it in her gushing essence. Her cum glides down your tongue and into your mouth; across your nose; and down your chin, baptizing you in her lady-spunk. You drink what you can, and the rest, well... cleaning it up isn’t among your top priorities at the moment.");
	if (pc.hasGenitals())
	{
		output("\n\nAnd as for you: like you had promised yourself,");
		if (pc.hasCock())
		{
			output(" your [pc.cock] bloats with your seed, and in just another few hearty pumps, your [pc.cum] shoots from your [pc.cockHead], painting the ground beneath Minuet’s spread legs [pc.cumColor]. Your crotch feels tight as you cum: you’re orgasming harder than you were expecting, and, to prove it, some shots reach as far as the corner, where the floor meets the wall.");
			if (pc.cumQ() > 10000) output(" And on top of that, you’re so productive that the soles of her shoes sink into your veritable pond of semen; when she adjusts her footing, her shoes make an audible slosh through your growing pool of cum.");
		}
		else
		{
			output(" your [pc.vagina] clenches on your hand, similarly to your mistress’s, and you");
			if (pc.isSquirter()) output(" gush your [pc.girlCum] across your hand and down your wrist, soaking yourself up to your forearm.");
			else output(" clench down on yourself, your cunt rippling along your fingers.");
			if (!pc.isCrotchExposed()) output(" Your juices splash through your [pc.crotchCoverUnder] and onto the floor, darkening it.");
			output(" Yet you persist, searching for another orgasm like you know you have in you, and when your body synchronizes with Minuet’s for just a moment, you achieve it.");
		}
		output(" This one, dark, lonely spot in Zheng Shi will forever be stained with your submission to Minuet.");
		pc.orgasm();
	}
	output("\n\nYou both take your time calming down from the exercise (although you take your time removing yourself from Minuet’s backside, even teasing her with a lazy lick here and there). Minuet is panting from the exertion, and every time she feels you fidget back there, she sighs in mischievous delight, then rocks her ass against you some more, loving the feel of you being so thoroughly tucked away back there.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she congratulates, then taps you on the head, instructing you to pull away. When you do, to your surprise, her suit begins to reseal itself around her wet, dripping, satiated gash on its own accord; the fabric crawling over her body almost like a liquid, before meeting with itself and closing around her sex seamlessly, as if the tear in her suit was never there to begin with.");
	output("\n\nShe straightens herself once her suit has her decent and presentable once more. She takes the time to fix her hair – you realize, in the darkness of the room, that you <i>still</i> haven’t gotten a good, solid look at her. At this point, the best way you’d be able to identify her is by her taste.");
	if (pc.isMisch()) output(" Not that that’s a problem for you.");
	output("\n\n<i>“Aaah,”</i> she sighs, calming herself from the excitement. Her gloved, gentle hand caresses your cheek once more; she handles you like you were a one-of-a-kind doll made of porcelain. <i>“Gracious. I haven’t cum quite that hard in some time, honey. Nor have I ever had such an eager tongue to coax it out of me.”</i> She giggles. <i>“I think I’ll keep you.”</i>");
	output("\n\nYou wipe the excess girl-cum from your face with your");
	if (pc.hasArmor()) output(" sleeve");
	else output(" arm");
	output(", waiting for her to instruct you further.");
	output("\n\n<i>“Now, we both have our business to conduct in Zheng Shi, I’m sure,”</i> she says, straightening her posture. <i>“That collar of mine will let the rest of the base know that you’re owned property, darling, so they’ll be less ornery to ‘stake their claim,’ as it were, but I can’t speak for the whole base. You be sure to watch yourself.”</i>");
	output("\n\nShe leans forward, bringing her mouth up against your ear once again, lowering her voice to a whisper. <i>“The station has a recreational deck, up a level or two. Come find me there when you get the opportunity.”</i> She licks along your earlobe, and then gives it a gentle nibble. <i>“I’ll be sure to find more... uses for you, darling.”</i>");
	output("\n\nYou blink – and she’s gone, just like that. You glance around the room, in both directions, looking where she could have gone, but there’s no trace of her. How...?");
	output("\n\nYou run your fingers along your neck, against her collar, the only tangible thing remaining in the room to prove she existed at all. The Recreational Deck, she said? You’ll have to keep that in mind... and, hopefully, she’ll find you and not expect you to find her.");

	pc.changeLust(pc.lustMax());
	pc.createKeyItem("[lorelei.name]'s Collar");
	toggleCollar("[lorelei.name]'s");

	addButton(0, "Next", mainGameMenu);
}

public function loreleiIJustWantedToGetRobbedNotEnslaved():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(2);

	output("For the first time, you feel... resolve. Maybe even indignation. Minuet wants to make you her personal slave, and she’s calling it a <i>mercy.</i>");
	output("\n\nYou lunge forward, throwing yourself into Minuet to push her away and knock her off balance. You succeed, but her reflexes are better than yours, and she managed to get her hand on your bare [pc.skinFurScales]; like every time before, electricity arcs through your body. It’s not enough to wound you, but it knocks the feeling out of your arm.");
	output("\n\nYour push knocks Minuet into the light, and, for the first time, you <i>finally</i> get a good look at her:");
	output("\n\nMinuet stands at just shy of six feet tall. Most of her body is concealed, from the neck down, in a skintight, pitch-black body suit, clinging to her features and curves tightly, emphasizing her generous D-cup breasts. She’s an untainted human, with darkly-tanned cheeks (and, presumably, skin); if she has any features or attributes from any other alien species, you can’t see them. She has snow-white hair reaching to her neck, brushed to intentionally cover her right eye; her left, dressed with blue eyeshadow, trains on you with the intensity of a viper, taking in your every movement, no matter how slight.");
	output("\n\nShe clicks her tongue in disappointment – and not in a way like a parent is disappointed in a child. <i>“I was really hoping you’d see things my way,”</i> she pouts, rubbing her lip with the backside of her wrist. <i>“Shame on me for allowing myself some naivety for once.”</i>");
	output("\n\nYou sarcastically apologize, saying you’re not in the market of giving yourself away for free. <i>“You’re thinking so shallowly, darling,”</i> she insists. <i>“You’re putting your pride before your safety. I’m just trying to protect the beautiful things in this universe.”</i> She shrugs mischievously. <i>“If that means putting my name on it... I’m not seeing the problem.”</i>");
	output("\n\nYou try to make your hand into a fist, but it still feels tingly and weak; you’re having trouble bending your arm at the elbow, much less making a strong fist.");
	output("\n\n<i>“Keep in mind who it is you’re dealing with, before you make a mistake you’ll regret,”</i> Minuet says, before stepping back with her right foot, and raising her palms toward you in a clearly aggressive stance. A crackle of electric energy arcs from between her fingers, to her palm, and back again.");
	output("\n\n<b>You’re fighting Minuet, and you’re injured.</b> It’ll take a bit of time before the feeling returns to your right arm!");

	setupMinuetFight(true);
}

public function setupMinuetFight(disarm:Boolean = false):void
{
	flags["LORELEI_FOUGHT"] = 1;
	lorelei.HP(lorelei.HPMax());
	lorelei.lust(20, true);
	lorelei.createStatusEffect("Disarm Immune"); // Status effect hotfix
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(lorelei);	
	CombatManager.victoryScene(loreleiStopInTheNameOfTheLaw);
	CombatManager.lossScene(function ():void
	{
		if (pc.HP() <= 0) loreleiJustRobsThePC();
		else loreleiGotThePCTooHornyNotToRob();
	});
	CombatManager.displayLocation("MINUET");
	CombatManager.encounterTextGenerator(Lorelei.encounterText);
	if (disarm) CombatAttacks.applyDisarm(pc, 1);
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function loreleiStopInTheNameOfTheLaw():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(3);

	if (enemy.HP() <= 0)
	{
		output("After that last blow, Minuet stumbles backward. She tries to maintain her stance, but her knees buckle under the pain and her body contorts to one side, and eventually, after putting up a valiant effort, she slumps, falling to one knee. Her hands stay up, and the electricity keeps crackling for only a few moments; then she stops kidding herself, and, laughing derisively, she clenches her hands into fists to snuff the electricity.");
		output("\n\n<i>“Fine,”</i> she admits, her hand coming to her ribs to rub and ease the pain out of them, <i>“you win, [pc.name]. I’ve never lost a fight before. I,”</i> she winces, <i>“know what victory feels like, and... heh, this isn’t it.”</i>");
		output("\n\nYou keep to your battle-ready stance: people like Minuet are difficult to trust, even when, by all appearances, they have nothing left to threaten you with. You can’t begin to guess what Minuet has up her sleeve as a contingency plan. Hell, the hallway you’re in could be booby-trapped, for all you know.");
		output("\n\n<i>“Oh, calm down,”</i> she says, looking up at you through her cascading white hair, her eyebrows arched sympathetically. <i>“You’ve already proven you’re okay with hitting a lady. The least you can do is believe her when she says she won’t hit you back.”</i>");
		output("\n\nStill, you don’t relax. You keep your distance. She attacked you, after all!");
		output("\n\n<i>“Fine, fine, don’t help me up,”</i> she says, laboriously pulling herself to her feet. When she does, she’s hunched over, her hand still against her ribs. Despite the pain she’s in, and despite your unfriendly attitude towards her, her expression softens – she even smiles.");
		output("\n\n<i>“I think it’s safe to say I was wrong about you,”</i> she says, her eyes twinkling at you. <i>“I was pretty confident I could take any of these thugs in Zheng Shi, but you’re a cut above the rest, darling. It’s nice to finally meet someone in this dank hole in space that knows their way around themselves!”</i>");
		output("\n\nWas this whole confrontation a <i>test</i> of some sort? <i>“Of some sort, yes,”</i> she confirms, winking at you. <i>“I can tell you more if you’re interested, but not here. This isn’t the most... accommodating place for a couple of darlings like ourselves, [pc.name]. Have you been to the recreational deck yet?”</i>");
		if (flags["ZHENG_REC_VISITED"] == 1) output("\n\nYou tell her that you have. <i>“Okay, perfect.");
		else output("\n\nYou tell her that you’re unfamiliar. <i>“It’s one of the upper decks in this filthy rock. Even a bunch of pirates need a place to relax and wind down. It’s a pretty rowdy place, full of all the booze and sex you could ask for, but it’s also weapons-free.");
		output(" I can meet you up there, if you want to meet under some more... neutral terms.”</i> She lifts her hand up, showing you her palm, and her other hand goes over her heart. <i>“No tricks; no weapons; no fights. You have my word.”</i>");
		output("\n\nYou loudly wonder to yourself if you’re in the business of taking <i>thieves</i> at their word. <i>“You took one at their word when they said they wouldn’t blast your ship to pieces when you docked, didn’t you?”</i> She winks again, and smirks – a more mischievous expression than before. She knows she wasn’t supposed to know that. <i>“Believe what you want to believe, honey.”</i>");
	}
	else
	{
		output("Minuet keeps to her battle stance staunchly, at first refusing to show that your displays and efforts are having an effect on her – but, after that last one, she’s giving you all the signals, even if they’re subtler than most others. Her nostrils flare and she takes a deep, stuttering breath through her nose while her knees buckle and shake. Her eyes keep fidgeting between your own and your [pc.legOrLegs]; to the untrained eye, she’s perhaps just a bit indecisive and nervous about your fight, but she is no rookie.");
		output("\n\n<i>“Damn it,”</i> she whispers to herself. Her hands clench into fists, snuffing the electricity crackling between her fingers. <i>“Looks like you’ve outplayed me at my own game, [pc.name].”</i>");
		output("\n\nShe relaxes her battle-stance into something a bit more casual, and she withdraws her needle. When she stands upright, you can clearly make out the outlines of her nipples through her suit. It must be taking everything she has to not degrade herself to something a little more... base.");
		output("\n\n<i>“If there’s any one thing I can still take away from this exchange, darling, is that I was wrong about you. I had lumped you in with those brutes running Zheng Shi, but no pirate here would have been able to get me so excited that I felt I couldn’t put up a fight anymore,”</i> she says, drawing a finger up the side of her thigh.");
		output("\n\n<i>“Was this whole confrontation a <i>test</i> of some sort?”</i> you ask.");
		output("\n\n<i>“Of some sort, yes,”</i> she confirms, winking at you. <i>“I can tell you more if you’re interested, but not here. This isn’t the most... accommodating place for a couple of darlings like ourselves, [pc.name]. Have you been to the recreational deck yet?”</i>");
		if (flags["ZHENG_REC_VISITED"] == 1) output("\n\nYou tell her that you have. <i>“Okay, perfect.");
		else output("\n\nYou tell her that you’re unfamiliar. <i>“It’s one of the upper decks in this filthy rock. Even a bunch of pirates need a place to relax and wind down. It’s a pretty rowdy place, full of all the booze and sex you could ask for, but it’s also weapons-free.");
		output(" I can meet you up there, if you want to meet under some more... neutral terms.”</i>");
		output("\n\nAt first, you wonder if you should take Minuet’s word to heart. She’s a <i>thief,</i> and thieves tend to not be the most honest folk. But, you have her at a vulnerable point, and, you’re sure, you could probably push your luck and get her to fuck you on the spot.");
		if (pc.intelligence() < 15) output(" You saw for yourself that she had removed her weapons; only someone so honestly horny would have made themselves that vulnerable!");
		else output(" You know better than to believe that she is completely defenseless, but no dishonest thief would allow themselves to fall into such a vulnerable state like she has. It’s hard to assume that she isn’t being sincere.");
		output("\n\nYou tell her that you’ll consider it. And maybe, when you two are somewhere a little more private, you can continue where you’ve left off.");
		output("\n\nMinuet smiles, almost sweetly, at you. <i>“You’d be a natural scallywag, you know,”</i> she coos. <i>“</i>I’m <i>supposed to be trying to ensnare</i> you <i>with a good time. But here you’ve got me fantasizing.”</i> She winks. <i>“Don’t let my dreams be dreams, sweetie.”</i>");
	}
	output("\n\nAnd with that, having decided that the confrontation is over, she taps at the back of her ankle with her shoe, and a white cloud of smoke blooms from underneath her. It dissolves in a matter of seconds, but when it does, Minuet is nowhere to be found – she’s vanished completely. She didn’t even leave any footprints in the dust to tell you how she might have vanished. The only thing she left behind is");
	if (enemy.credits > 0) output(" a credit chit, containing a... very specific amount of credits.");
	else output(" a beautiful gemstone. Perhaps as a calling card of some kind? But you don’t think Minuet is generous enough to be leaving beautiful gems just <i>anywhere.</i> Maybe she likes you.");
	output("\n\nYou remain on guard for another moment, but nothing seems out of the ordinary. You don’t hear anything, and you don’t have that feeling in your gut that you’re being watched. Minuet is gone.");
	output("\n\nThe recreational deck, she said? You’ll have to keep that in mind....\n\n");

	flags["LORELEI_BEATEN"] = 1;
	CombatManager.genericVictory();
}

public function loreleiJustRobsThePC():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(3);

	output("You slump");
	if (pc.isBiped()) output(" to one knee, then the other");
	else output(" down");
	output(", too beaten and injured to continue.");
	output("\n\nMinuet recognizes a won fight when she sees it: she relaxes her stance and closes both her hands into fists, snuffing the electricity from them. She walks with an exaggerated sashay towards you, her hips swishing from side to side with her steps, her eyes drinking in your defeated posture like a tiger coming up on a wounded gazelle.");
	output("\n\n<i>“This could have been so much easier, honey,”</i> she says, her eyes on yours. You try to match her gaze, but it hurts to lift your head – and you can’t help but be distracted by the way she’s walking. Her form exudes a sort of experienced confidence that only a woman that knows how to properly lavish herself in victory could. <i>“But you just</i> had <i>to make things messy. Look where your pride has gotten you, darling; I want you to remember this the next time we happen to come across each other.”</i>");
	output("\n\n‘Next time’? You ask Minuet if she doesn’t intend to kill you. <i>“No, of course not,”</i> she says reassuringly. <i>“I may be a thief, [pc.name], but I’m not a killer. The only thing more priceless than money, and more precious than gems, is a life. And besides: killing my clientele is bad for business.”</i>");
	output("\n\nAt that, she presses her finger against your forehead. You feel a quick, small jolt of electricity shoot into your skull – not enough to do any damage, or even enough to be painful, but enough to make you crosseyed for a moment. Once your vision blurs and jumbles, you feel Minuet’s practiced, professional hands on your body, knowing exactly where to go to get what they want.");
	if (pc.credits <= 0)
	{
		output("\n\n<i>“Not a credit to be found, darling? You’re either more financially responsible than I gave you credit for, or you’re positively </i>destitute<i>.”</i>");
		if (ratsGemCount() > 0) output(" Having said that, though, she gasps slightly when she finds some of the gems you’ve been carrying around. <i>“I’ll still be helping myself to these, of course.”</i>");
	}
	else
	{
		output("\n\n<i>“Of course, since I won’t be taking your most priceless, precious possession, darling, I’ll just be helping myself to everything else.”</i> She coos when she comes across your credits");
		if (ratsGemCount() > 0) output(", and gasps slightly when she finds some of the gems you’ve been carrying around");
		output(".");
	}
	output("\n\nOnce your vision clears, you have a clear view of Minuet’s pitch-black shoe, standing imperiously before you. <i>“Get well soon, [pc.name],”</i> she says, and you hear her blow you a kiss. <i>“Momma could always stand to fatten her purse a little bit.”</i>");
	output("\n\nYou blink – and she disappears completely, vanishing into the ether of Zheng Shi. With some effort, you lift your battered body into a kneeling position, and you survey the area: the footsteps from your conflict are still matted into the dust, but she didn’t leave a single one in her retreat. It’s as if she had simply dissolved into the air.");
	output("\n\nYou pull yourself to your [pc.feet]. After taking inventory, you resume your trek into the mines – although, maybe stopping to rest wouldn’t be such a bad idea....");

	loreleiStealsYourThings();

	CombatManager.genericLoss();
}

public function loreleiGotThePCTooHornyNotToRob():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(3);

	output("You slump");
	if (pc.isBiped()) output(" to one knee, then the other");
	else output(" down");
	output(", too turned on and horny to continue. Minuet has no need for her training or her high tech suits: her body itself is the most dangerous weapon in its arsenal, and you are its latest victim.");
	output("\n\nBoth your hands fly to your crotch,");
	if (pc.hasGenitals()) output(pc.cockAndVagina(" jerking your [pc.cock] helplessly", " thrusting your fingers into your [pc.vagina]", ", and"));
	else output(" rubbing at the burning sensation at your crotch, where your genitals would be");
	output(", your eyes humping Minuet’s every curve and feature.");
	if (flags["LORELEI_LUST_LOSSES"] == undefined)
	{
		output("\n\nTo your surprise, Minuet takes your submission in stride – you’d have thought that she’d look down at you and sneer, but she’s actually striking several sexy poses for you, including turning her back on you and bending ever-so-slightly at her waist, flaunting her thick ass. Another pose has her face you and bending forward similarly, but with her forearms against her D-cup breasts, squishing them together underneath the skin-tight veneer of her suit.");
		output("\n\n<i>“Mmm, that’s right, baby, keep touching yourself to me,”</i> she moans. Her left hand finds the cap of her left tit, her index and middle fingers twiddling and tweaking her nipple through her suit. Then, suddenly, the suit around her flesh peels and parts, revealing the dark nub for her to play with, and for you to ogle.");
		output("\n\nHer right hand is far more adventurous, and starts snaking its way down her belly, towards her own groin. <i>“There is nothing sexier in this universe than knowing you’ve turned on someone so much that they’d rather touch themselves than worry about anything else,”</i> she says. To prove her point, the suit similarly parts around her pussy, bearing it to the air of Zheng Shi – and she’s rather moist, herself. The funk of her scent contrasts the stuffy, hot air of the mines, and you could home into her pussy like a guided missile in the dark.");
		output("\n\nShe steps forward, her fingers circling around her clit, teasing herself for you. <i>“I bet, if I asked, you’d eat me out right now, wouldn’t you?”</i> she asks you. <i>“One little question, and you’d be nose-deep in my box, learning for the first time what</i> art <i>tastes like.”</i>");
		output("\n\nYou don’t so much <i>hear</i> her words, but you register them. You find yourself drooling and anxious, awaiting Minuet to give you a suggestion, or even a command, and you’d perform it.");
		output("\n\nShe comes closer, until her snatch is maybe half a foot away. All you’d need is to");
		if (pc.tallness < 5*12) output(" scooch");
		else output(" lean");
		output(" forward a bit, and you’d be nose-deep into her, tasting her, eating her, and pleasuring you both. Your hands work faster on your body, excited at the prospect of getting some real action. Maybe, if you do well enough eating her out, Minuet wouldn’t mind <i>escalating</i> your next encounter.");
		output("\n\n<i>“Come closer, [pc.name],”</i> she says, crooking the finger toying with her pussy toward you, <i>“and be mine.”</i>");
		output("\n\nYou lean forward, and she puts her hand on your head, gently rubbing at your scalp, reassuring you as you close the distance. Your [pc.tongue] snakes out, wetting your [pc.lips], readying them for the workout they’re about to get–");
		output("\n\n–Before you suddenly feel a shock jolt through your body, starting at your head and going down your spine. It originates in Minuet’s glove, and it makes");
		if (InCollection(pc.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SKIN) && !pc.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) output(" every hair on your body stand on end");
		else output(" your whole body itch and seize");
		output(". Your eyes cross, and you lose all sensation in your limbs; you tumble forward, too insensate to maintain your balance.");
		output("\n\n<i>“All too easy,”</i> she chastises. Her suit plugs itself back up over her breast and her crotch, and her hands work over your body, expertly sifting through your possessions for your most valuable items to pilfer. She has no trouble finding your credits");
		if (ratsGemCount() > 0) output(", and when she finds the gems you’ve been carrying, she coos in delight and helps herself");
		output(".");
		output("\n\nShe steps forward, her pitch-black shoe entering your scrambled vision momentarily. <i>“A word of advice, [pc.name],”</i> she begins. <i>“Zheng Shi is full of amoral villains and brutes that wouldn’t think twice about having their way with that pretty, willing mouth of yours. Lucky for you, I’m not in the business of getting my box eaten, and I am nothing if not professional.”</i> She giggles to herself as she looks over your body");
		if (pc.hasGenitals()) output(", at your " + pc.cockAndVagina("still rock-solid [pc.cock]", "soaking wet [pc.vagina], gaping slightly from your fingers vacating it", " and your "));
		output(". <i>“Maybe it’s not so lucky for you.”</i>");
		output("\n\nThe strength slowly returns to your body, and you have enough in you to look up at her as she bends over you. <i>“But hey,”</i> she whispers sensually, <i>“keep letting me know just how sexy you think I am, honey, and maybe I’ll make an exception.”</i>");
	}
	else if (flags["LORELEI_LUST_LOSSES"] == 1)
	{
		output("\n\nIt’s an awfully familiar position to you both. Minuet, like last time, swings her body from side to side, giving you a real show to touch yourself to – although, this time, it’s a little slower, and a little more sensual than before. She’s moving like you’re a lover, and not like she’s a stripper putting on a show.");
		output("\n\n<i>“Mmmm, I meant what I said last time,”</i> she moans, her hands trailing down her sides, starting at her breasts and moving like water down to her hips. Her eyes are locked onto yours the entire time. <i>“There’s nothing more... empowering, knowing that someone finds you as attractive as you find me right now.”</i>");
		output("\n\nHer right hand flutters around her crotch – not quite touching herself through her suit, but her fingers drum against her lower stomach, teasing the idea. <i>“Well,”</i> she sighs, <i>“I can think of</i> one <i>thing sexier.”</i> Her hand inches lower. <i>“It’d be sexier to hear it from you, [pc.name]. It’s one thing to give up to your body’s needs. It’s another to hear you say it, of your own volition. Tell me how badly you want me.”</i>");
		output("\n\nYou’d think it obvious, with your hands");
		if (pc.hasGenitals()) output(pc.cockAndVagina(" jerking your exposed length unabashedly", " thrusting and humping against your hot gash"));
		else output(" busy");
		output(", but you do as she asks: you tell her, honestly, that you had been thinking about what she had said the last time you had been defeated like this – that if you succumbed to her a second time, that she would entertain the possibility of giving you an outlet to vent yourself with. You had put up a sincere fight, but you’d be lying if you said there wasn’t some niggling thought in your head that urged you to find out what it’d be like.");
		output("\n\nAs the words pour from your mouth, a sly, victorious smile slowly creeps up Minuet’s face. She knows that she’s a few steps – hell, even a sentence – from winning this conflict, and probably all future conflicts, between you two.");
		output("\n\nBut, the next words out of her mouth aren’t the ones you’re expecting.");
		output("\n\n<i>“Look, honey,”</i> she says, her sly smile remaining unblemished. <i>“I don’t often give my... my ‘prospective targets’ the courtesy of giving them the choice of being stolen. So consider yourself very,</i> very <i>fortunate.”</i>");
		output("\n\nShe turns her back to you, knowing exactly where your eyes are going to be going. She looks over her shoulder towards you. <i>“Wanting to be with me is no small commitment. When I say that I believe all the world’s most beautiful things belong with me, I mean that they <b>belong</b> with <b>me.</b> You’re in a vulnerable position right now, and I won’t take advantage of that. I’ll give you a moment to really think over what it is you want.”</i>");
		output("\n\nBefore she leaves, she bends at the waist, far enough that her hands could easily reach her toes. Her suit creaks and stretches, spreading over her wide ass like a tight film, until it’s so taut it might as well be a second skin. The puff of her camel toe gets more and more obvious the further forward she leans. And all that ass is pointed <i>right</i> at you.");
		output("\n\n<i>“But if</i> this <i>is worth it,”</i> she continues, <i>“you’ll know what to do the next time we meet.”</i>");
	}
	else
	{
		output("\n\nIt’s a very familiar position for you both, and you both know what’s coming next. But, Minuet doesn’t allow it to happen: she steps forward, closing the gap between you two, with the same sexy sashay as before. Your hands reflexively try to go to your crotch and sate the");
		if (pc.hasGenitals()) output(pc.cockAndVagina(" pressure", " heat"));
		else output(" heat");
		output(" building down there, but Minuet says one word.");
		output("\n\n<i>“Tut.”</i>");
		output("\n\nJust like that, you freeze, keeping still for Minuet and whatever she wants you to do. All she’s done is turn you on a few times, and you’re already a trained puppy, barking and sitting on command. <i>Her</i> command.");
		output("\n\nShe stops, standing squarely in front of you, about a foot away. You feel her gloved hand on your scalp, and you flinch, expecting a shock of electricity to course through you, but it doesn’t come. Instead, she pushes her head backward, so that you’re looking up toward her.");
		output("\n\nMinuet’s eyes are trained on you, half-lidded and fluttery, infatuated with you – or, at least, pretending to be. She takes a moment to just... watch you, and appreciate you.");
		output("\n\n<i>“Look at how gorgeous you are,”</i> she whispers, half to you and half to herself. Then, unable to help herself (a first for her), she leans forward, her lips against yours. It’s a chaste, sexless kiss, by their strictest definitions: you both know how this encounter is about to end. Her lips linger on you, signing the contract that will bind you to her for as long as she deems proper.");
		output("\n\nAfter a wonderful few moments, she pulls away, her eyes still on you. <i>“I’m glad you’ve chosen to see things my way,”</i> she says. <i>“You’ll learn to love being with me, [pc.name]. I treat the most precious things in my life like they’re worth more than mine. You won’t regret a second of it.”</i>");
		output("\n\n With a flick of her wrist, she produces a large, thin, silver ring, with glowing green jewels inlaid along its outside circumference, spelling out a word. <i>“Hold still,”</i> she instructs, before quickly whacking it against your neck.");
		if (hasWornCollar()) output("\n\nThe collar, like some kind of magnet, snaps directly around " + collarOwnerName() + "’s collar, already fastened to your neck, and conforms to its shape snugly. Minuet’s collar sits on top of " + collarOwnerName() + "’s, ‘overwriting’ it with itself and preventing anyone from seeing who else you belong to; it seems as though your new mistress isn’t a fan of sharing.");
		output("\n\nThe collar slaps around your neck like a handcuff, snapping around you and latching itself into place snugly. It’s large enough to not feel uncomfortable or restrict your range of movement with your neck, but tight enough that you’re not going to slip free of it anytime soon. You give it an experimental tug – it doesn’t quite feel like metal. In fact, it feels kind of cushiony against you.");
		output("\n\n<i>“I’m not usually the type to label my belongings, but here in Zheng Shi, you need to look the part,”</i> she says, examining the collar and running a loving, appreciative finger along its glossy edge. <i>“If it helps, you look positively radiant in it, darling.”</i>");
		output("\n\nYou sit, your fingers running along the collar. Your horny, addled mind can’t help but impatiently wonder when you’ll get to the sexy part of agreeing to this.");
		output("\n\n<i>“And I do believe I promised you something in return,”</i> she says, her voice lilting sensually. She pivots around, her back to you, trusting her new property to not try anything untoward.");
		output("\n\nShe bends at the waist, the expanse of her wide ass pressing and straining against the pitch-black material of her suit, just like last time. You can hear it creak with constrained effort as she bends, the material smoothing out around the swells of her ass and against her meaty thighs. Then, slowly but suddenly, a hole materializes, directly over her damp crotch – it does not tear, at least not like a typical fabric would: the hole is symmetrical, turning into a perfect circle around her pussy, and it sounds more like it’s ‘peeling’ than tearing.");
		output("\n\n<i>“Let’s officially inaugurate you as my property, darling,”</i> she says, wriggling her hips toward you. The scent of her horny honeypot wafts toward you, and her expansive ass pushes in your direction, inching towards your face. You just need to complete the circuit and lean forward. <i>“Your new mistress needs serving.”</i>");
		output("\n\nFinally!");
		
		CombatManager.genericLoss(loreleiTriesOutHerLatestAcquisition);
		return;
	}

	output("\n\nYou blink – and she disappears completely, vanishing into the ether of Zheng Shi. With some effort, you lift your horny body into a kneeling position");
	if (pc.hasGenitals()) output("," + pc.cockAndVagina(" forgetting your now-flagging erection", " trying to ignore just how neglected your pussy is") + ",");
	output(" and you survey the area: the footsteps from your conflict are still matted into the dust, but she didn’t leave a single one in her retreat. It’s as if she had simply dissolved into the air.");
	output("\n\nYou pull yourself to your [pc.feet]. After taking inventory, you resume your trek into the mines – although, her suggestion, about maybe doing this all over again, won’t leave your head....");

	if (flags["LORELEI_LUST_LOSSES"] == undefined) loreleiStealsYourThings();
	IncrementFlag("LORELEI_LUST_LOSSES");
	CombatManager.genericLoss();
}

public function enterLoreleisHouse():Boolean
{
	clearOutput();
	loreleiHeader();

	if (lorelei.short == "Minuet") return meetingLorelei();
	output("The Saurmorian doorman recognizes you as you approach, and steps aside, allowing you into Lorelei’s abode once more.");
	output("\n\nIt’s like stepping into a completely different world: the Recreational Deck is a dirty, lawless place, but Lorelei’s room is extravagant, opulent, personal, and <i>highly</i> intimate. It’s almost enough to make you dizzy.");
	output("\n\n<i>“Ah,”</i> Lorelei says when she sees you. She’s wearing the same black dress with high heels as the first time you had met her here. <i>“I was just thinking of you, [pc.name].");
	if (isLoreleisBitch()) output(" It gets so lonely sometimes, knowing that my collection remains incomplete when you’re out and about.”</i>");
	else output(" It’s always good to see you again. All the gems in the universe can’t compare to company like yours.”</i>");
	output("\n\nFamiliar with her wants");
	if (isLoreleisBitch()) output(" you retrieve Lorelei’s collar from your effects and slip it around your neck; then");
	output(", you take your position behind the bar and pull out two wine glasses, followed by a bottle from her personal rack. Her eyes are on you; when you withdraw a bottle, she smiles in both acknowledgment and appreciation, and says nothing when you pour the wine into the glasses.");
	output("\n\n<i>“Come,”</i> she says");
	if (isLoreleisBitch()) output(", motioning to the empty stool next to her. <i>“Sit with me. Talk with me.”</i>");
	else output(", her inflection almost-but-not-quite making it sound like a command. <i>“Entertain me.”</i>");
	output("\n\nYou take your seat next to her. What do you do next?");

	loreleiMenu(true);
	return true;
}
	
public function meetingLorelei():Boolean
{
	clearOutput();
	showName("SAURMORIAN\nDOORMAN");
	showBust(); // show the saurmorian guy when he's drawn. as if.
	author("B");

	output("As you explore and familiarize yourself with the Recreational Deck, you come to what appears to be a doorman of sorts: a large, imposing Saurmorian, wearing mostly leather with metallic inseams, protecting the entrance to a room. You’ve noticed that there aren’t a lot of individual rooms in the recreational deck, so whatever’s in there must be worth protecting. He doesn’t carry himself like the rest of the riffraff about the deck, and in fact, most others wandering the place seem to try and avoid him.");

	// Continue here if the PC is wearing Minuet’s collar");
	if (isLoreleisBitchVisibly())
	{
		output("\n\nThe Saurmorian gets a good look at you, too, and smiles to himself as soon as he sees the collar around your neck.");
		output("\n\n<i>“You must be the ‘darling,’”</i> the doorman says, beckoning to you with his finger to approach. <i>“Minuet spoke highly of you. She’s been expecting you.”</i> He steps to one side and allows you to enter the door. <i>“Consider yourself lucky.”</i>");
		output("\n\nBefore you take his invitation, you ask the doorman what to expect.");
		output("\n\n<i>“Dunno. I’ve never had the... pleasure of having a one-on-one sitdown with her. She just pays me to watch the door, so I watch the door.”</i> The Saurmorian sizes you up, likely comparing you to someone or something – perhaps himself. <i>“She’s damn fine, though, and I wouldn’t mind wearing a collar if it meant I got a piece of her.”</i>");
		if (pc.isNice()) output("\n\nYou suppose you’ll have to see what Minuet is like through closed doors yourself.");
		else output("\n\nYou tell the Saurmorian that you don’t know how good of a lay <i>she</i> is, but is she’s half as good as she tastes, you’ll be in for a wild night. He grins, and extends his fist for you to bump.");
		output(" You show yourself into Minuet’s room, closing the door behind you.");
	}
	// Continue here if the PC defeated Minuet in combat, whether via lust or HP
	else if (flags["LORELEI_BEATEN"] != undefined)
	{
		output("\n\nThe Saurmorian eyes you up and down, getting a good look at you.");
		output("\n\n<i>“You [pc.name]?”</i> he asks, and you respond affirmatively. <i>“Minuet told me to expect you. Said to let you in once you made it to the deck.”</i> He steps aside, allowing you past him and to the door. <i>“She spoke highly of you. It’s not often anyone on this rock impresses her.”</i>");
		output("\n\nWithout going into specifics, you recall how you met her, and the whole ordeal it was to earn your ‘good graces’ with her. She’s certainly among the more capable of anyone you’ve met on Zheng Shi.");
		output("\n\n<i>“You’ll have to teach me how you did it,”</i> the Saurmorian says, making small-talk with you. <i>“I’ve never had the pleasure of having a one-on-one sitdown with her. She pays me to watch the door, so I watch the door.”</i> He sizes you up, likely comparing you to someone or something – perhaps himself. A grin spreads across his face as he fantasizes about a ‘personal session’ with her. <i>“I’d wear her like a belt if I ever had the opportunity.”</i>");
		if (pc.isNice()) output("\n\nYou keep any further comments to yourself as you pass by the doorman and enter Minuet’s room.");
		else output("\n\nYou tell the Saurmorian that you can’t be sure who’s going to be wearing who by the end of tonight - Minuet doesn’t seem like the type to bend to someone very easily. But you’re also not about to complain.\n\nThe Saurmorian extends his fist for you to bump as he lets you enter.");
	
	}
	// Continue here if the PC is not wearing Minuet’s collar, nor have they defeated Minuet"
	else
	{
		output("\n\nYou try and peer over the Saurmorian’s shoulder and see if there’s a nameplate or something on the door, to try and glean what it is he’s protecting, but he steps up to you – not in an imposing manner, but specifically to keep you from trying to look past him.");
		output("\n\n<i>“This is a private room,”</i> he says, answering your unspoken question. <i>“And the lady of the house is away on business. Get lost.”</i>");
		output("\n\n‘The lady of the house’? Sounds like someone you’ll want to be on their good side – or someone you should avoid entirely. You take the Saurmorian’s advice and turn around.");

		addButton(0, "Next", move, loreleiExit);
		return true;
	}

	addButton(0, "Next", continueMeetingLorelei);
	return true;
} 

public function continueMeetingLorelei():void
{
	clearOutput();
	processTime(1);

	output("The door hisses shut behind you. Minuet’s room is rather opulent, even by normal standards and <i>especially</i> by Zheng Shi’s standards: gems of various colors and glitters line the walls, the floor, and the sheets of the bed in the corner, and a glass-diamond chandelier hangs from the ceiling. The light of the room is dark-purple, muting the effect of the glitters from the gems without diminishing their lustre, while also giving the room a very intimate atmosphere. The room is soundproof: the ruckus from the Recreational Deck doesn’t reach into Minuet’s room at all, and you doubt any noise made inside it will make it out.");
	output("\n\nMinuet’s piece of heaven is fully stocked with its own bar: a long, chest-high counter goes from the far wall and curves in a semi-circle around the corner with an opening on the opposite side, and the wall behind it is lined with bottles from every reach of the civilized universe. You don’t recognize a lot of the labels or the words on them, but you understand that there isn’t a single drop of booze among them – it’s all wines. The labels you <i>do</i> recognize are from Terra, including Rieslings, Merlots, and Pinot Noirs.");
	output("\n\nThere are two stools at the bar’s deck, and sitting in one of them is Minuet. She’s not wearing her black spysuit, though: she’s wearing a backless black dress, its strings forming a criss-cross pattern along her shoulders. The dress hangs from her legs loosely, waving in the air with every idle, playful kick of her leg. Her arms are completely exposed, as is her entire stomach, the dress having an open diamond shape going from the underside of her breasts to a few inches below her navel. The dress forms an X over her breasts, exposing her cleavage while remaining not only decent, but classy and tasteful. Her legs are crossed, exposing her ankles, and you can see a pair of black high-heels on her feet, the heel tapping occasionally against the metal of her stool.");
	output("\n\nShe was busy watching something on her own codex when you entered, but as soon as she turns her head and sees you, she smiles and puts it down, forgetting about it entirely.");
	if (isLoreleisBitch()) output(" She grins wryly at you, and beckons to you with her finger: you obey and approach, and once you’re within arm’s distance, she shows you the back of her fingers: she’s wearing a diamond ring, and she wants you to kiss it. You gently take her hand, and you do.");
	else output(" She smiles and stands, taking two steps toward you with her hands outstretched, wordlessly asking for an embrace. You step into her arms, and once you do, she gives you a quick kiss on your [pc.lipsChaste], letting you know just how warmly you’re welcomed in her privacy.");
	output("\n\n<i>“I’m glad you could make it,”</i> she says,");
	if (isLoreleisBitch()) output(" drawing her foot up your side, rubbing her calf against your body.");
	else output(" hooking her arms around your neck, lazily hugging you against her.");
	output(" <i>“Did you have any problems finding my room?”</i>");
	output("\n\nYou tell Minuet that it wasn’t ‘difficult,’ but it was certainly... surprising. The Recreational Deck was full of ornery thugs getting drunk and trying to get laid all over the place. You cast your eyes around the room: this is certainly a step in a different direction from that.");
	output("\n\nHer face scrunches at the name. <i>“I think we’re passed the codenames while we’re together.");
	if (isLoreleisBitch()) output(" You ought to address your mistress by her proper name");
	else output(" You’ve earned it");
	output(".”</i> She traces one finger down the side of your face and smiles. <i>“I have certain images and standards I must maintain, but here, you may call me Lorelei.”</i>");
	output("\n\nYou try out her name. ‘Lorelei,’ you say.");
	if (isLoreleisBitch())
	{
		output(" You kiss her ring again, and she coos appreciatively; she likes the gesture.");
		output("\n\n<i>“Rise,”</i> she says, pulling her hand from you and gesturing to the bar.");
	}
	else
	{
		output(" She answers her name by kissing you again.");
		output("\n\n<i>“Come,”</i> she says, taking you by the hand and leading you towards the bar.");
	}
	output(" <i>“Pour me a drink, would you? Let’s get reacquainted.”</i>");
	output("\n\nYou do as she asks and step around the counter. Underneath the table is a number of washed wine glasses, hanging upside-down in their racks; you pull two out, and then face the wall. She didn’t mention a preference, so you pull out a wine with a white label in a green bottle.");
	if (pc.isNice()) output("\n\n<i>“Chardonnay,”</i> she says, recognizing which wine you picked. <i>“Normally it’s the shy, reserved, quiet types that prefer white wines.”</i> She smiles predatorily, like she caught you in a trap and she’s going to play with you before finishing you off. <i>“I find them to be the most</i> delicious, <i>myself. I see we both have good taste.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Grenache,”</i> she says, recognizing which wine you picked. <i>“Rosé wines are very sensuous and appealing; appreciating a fine rosé wine is the mark of a good lover.”</i> Her mouth hangs open at that last syllable; her tongue snakes out to languidly lick at her upper lip. <i>“You’re just a book of surprises, darling. I wonder what</i> else <i>you can surprise me with.”</i>");
	else output("\n\n<i>“Cabernet Sauvignon,”</i> she says, recognizing which wine you picked. <i>“Picking a red wine shows confidence.”</i> Her eyes drink in your form, from your face to your waist; her teeth chew into her lower lip as she starts looking back up. <i>“And there’s nothing more</i> desirable <i>than a confident [pc.manWoman], [pc.name].”</i>");
	output("\n\nYou uncork the bottle and pour it into the two glasses you had set out for you both, then leave the bottle uncorked on the countertop. Something tells you you’ll be needing most of it.");
	if (isLoreleisBitch()) output("\n\n<i>“To all the good things in life,");
	else output("\n\n<i>“To good company,");
	output("”</i> Lorelei says, lifting her glass in a toast to you. You lift your own and clink your glass to hers.");
	output("\n\nYou’re sitting in a dark room with mood lighting, sharing a wine with a beautiful woman in a dress that doesn’t hide a lot of her form. Lorelei turns her head to one side and lifts her glass to her lips, but her eyes are trained on you, like before: a viper, ready to strike. But this time, you don’t think you’re in any real danger.");
	output("\n\nDon’t blow this.");
	output("\n\nWhat do you do?");

	lorelei.short = "Lorelei";
	loreleiHeader();
	loreleiMenu(true);
}

public function loreleiMenu(justGotHere:Boolean = false):void
{
	clearMenu();
	addButton(0, "Appearance", function():void
	{
		clearOutput();
		loreleiLooksGood();
		addDisabledButton(0, "Appearance");
	}, undefined, "Appearance", "Lorelei put a lot of effort into making herself look good for you. Might as well admire her effort!");
	addButton(1, "Talk", loreleiCanStealYourEarToo, undefined, "Talk", " Lorelei is a woman full of mysteries! Maybe she’d be willing to shed some light on a few?");
	addButton(2, "Sex", loreleiEngagesInADifferentTypeOfIllicitAct, undefined, "Sex", "Lorelei is a sexy woman, and she knows it. Ask her if she’s willing to use it to your mutual advantage.");
	if (justGotHere) addButton(14, "Leave", loreleiIWasJustSayingHi, undefined, "Leave", "It was fun, but you really have other things you must be doing.");
	else addButton(14, "Leave", loreleiLovesThePCSoSheLetsYouGo, undefined, "Leave", "It was fun, but you really have other things you must be doing.");
}

public function loreleiLooksGood():void
{
	output("You get a better look at [lorelei.name].");
	output("\n\nShe’s a pure human – a rarity nowadays, it seems like – and she stands at just under six feet tall. She has shoulder-length, snowy-white hair that she has brushed to comb over her right eye, obscuring it completely from your view. Her other eye is a rich, deep brown.");
	output("\n\nHer skin is darkly-tanned all over, from her forehead down to her ankles. Her form is slender and sleek: you’d gather, from her profession as a rogue, that she gets lots of cardio into her daily routine and she watches her diet rather closely");
	if (lorelei.short == "Lorelei") output(" (ignoring all the wine, of course)");
	output(". That said, she’s nonetheless ‘gifted,’ sporting a hefty D-cup pair of breasts and a natural hourglass figure, with a narrow waist and a generous pair of hips.");
	if (flags["LORELEI_TALKED_JOB"] != undefined) output(" She’s a mother, and it shows.");
	output("\n\nFocusing on what she’s wearing, she has blue eye-shadow, and you <i>think</i> she’s wearing fake eyelashes, but they might just be really long. She has rosy-brown lipstick, blending with her lips naturally.");
	output("\n\n[lorelei.name] owns a highly-advanced suit");
	if (lorelei.short == "Lorelei") output(" that she uses for every occasion: when she’s ‘working,’");
	else output(":");
	output(" it covers her entire body skin-tight, from the neck down, all the way to her toes.");
	if (lorelei.short == "Lorelei")
	{
		output(" But here, in a more relaxed, casual atmosphere, her suit has taken the form of a beautiful, elegant, flowing dress: it forms into a collar around her neck and then strands of black ‘fabric’ flow from it to her lower-belly, giving her a generous amount of cleavage and forming a diamond-shaped hole around her navel. Her dress is backless, covering her only as high as the small of her back, and her dress hugs her ass almost protectively, giving you a show whenever you get a view of it.");
		output("\n\nFrom her waist down, the dress billows into a wide circle around her, almost like a ball-dancers gown, or a cartoon princess’s dress. She’s wearing high-heeled shoes and gloves that cover everything from her elbows downward. Every piece of clothing she’s wearing is completely pitch-black, same as her spy suit; it’s capable of texture and consistency, but not colors, unfortunately.");
	}
	if (flags["LORELEI_SEXED"] != undefined || isLoreleisBitch())
	{
		output("\n\nYou know, from experience, that she has a vagina between her legs, with a diamond-studded clit (with a real diamond!), and an asshole between her butt cheeks, right where it belongs.");
		if (lorelei.hasCock()) output(" She doesn’t have any extra ‘equipment,’ but her suit, ever flexible, can rearrange herself into a cock of variable length and shape, providing you both the same tactile pleasure as the real thing. It, too, is pitch black in color.");
	}
}

public function loreleiCanStealYourEarToo():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	processTime(1);

	output("You ask Lorelei");
	if (isLoreleisBitch()) output(" for permission");
	else output(" if it’s alright");
	output(" to ask her something about her personal life. You’re already well acquainted with her professional life, and how good she is at her job. You’d like to know more about the");
	if (isLoreleisBitch()) output(" mistress");
	else output(" woman");
	output(" behind the mask.");
	output("\n\nLorelei, at the question, smirks her devious little wry smirk, and takes a sip of her wine. Her legs cross in her seat, and she rubs her raised ankle, rubbing it delicately against you.");
	if (isLoreleisBitch()) output(" <i>“I like the way you’ve phrased your question");
	else output(" <i>“It’s very chivalrous of you to ask if you may pry");
	output(",”</i> she says, idly swirling the wine in her glass. <i>“Ask away, darling. There is nobody in this universe but you and me right now.”</i>");
	output("\n\nIn that case....");

	pc.imbibeAlcohol(15);

	loreleiTalkButtons();
}

public function loreleiTalkButtons():void
{
	addButton(0, "Thievery", loreleiTellsYouAboutHerDayJob, undefined, "Thievery", "Ask Lorelei about her craft. Where did she learn her skills? Does she simply enjoy taking money from people? Or is there something more?");
	addButton(1, "Her Suit", loreleiTellsYouWhereSheGotHerSuperSuit, undefined, "Her Suit", "Lorelei’s suit is one of the more incredible pieces of tech you’ve come across lately. Ask her how it functions, and where she got it from.");
	addButton(2, "Why Here?", loreleiWhyArentYouSomewhereMorePronounceable, undefined, "Why Here?", "Zheng Shi is a deplorable, dirty hole filled with degenerate pirates looking for their next big score. Why is she putting her skills to work here? Shouldn’t she be aiming for someone or something bigger?");
	addButton(3, "Others", loreleiIsntTerriblyFondOfZS, undefined, "Others", "Ask Lorelei what she thinks about the other crews and peoples in Zheng Shi. They’re a colorful bunch, through and through, and maybe you could use anything she happens to tell you.");
	if (flags["LORELEI_SEXED"] == undefined) addDisabledButton(4, "Go Futa", "Go Futa", "You need to be more intimately acquainted with Lorelei before you can even think about asking her this!");
	else if (lorelei.hasCock()) addDisabledButton(4, "Go Futa", "Go Futa", "She’s already got a dick! No sense in asking her for more.");
	else addButton(4, "Go Futa", loreleiGetsTheDButSheKeepsIt, undefined, "Go Futa", "Ask Lorelei if she’s willing to get something a little... extra, to make your trysts all the more involved and varied.");
	if (isLoreleisBitch()) addDisabledButton(5, "Collar");
	addButton(14, "Back", loreleiMenu);
}

public function loreleiTellsYouAboutHerDayJob():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();

	output("You tell Lorelei that, if there’s a better person in the same business as her, you haven’t met them. Her skills are the stuff of storybook legends. Every time she disappeared into the shadows, you’d look for her footprints, and she didn’t even leave any of those – even now, you still can’t figure out how she does it.");
	output("\n\nLorelei leans into the bar, smiling at your compliments, but she says nothing. She takes a sip of her wine and bathes in your praise.");
	output("\n\nYour compliments, naturally, lead into your follow-up question: how did she get into the ‘business?’ With skills like hers, you can’t imagine her wanting to do anything else, but everyone has to start somewhere.");
	output("\n\n<i>“Hmm,”</i> she hums casually, swirling her wine glass. Her eyes watch the liquid sway with her hand, and her smile hasn’t left her face. <i>“I’m afraid my ‘start’ isn’t any more original than my storybook skills, darling. I was born to a middleclass family – we had our wants, certainly, but our needs were met, and we lived comfortably.”</i> She traces her finger along the rim of her glass. <i>“But I wanted</i> more <i>than to live comfortably. I wanted</i> more.<i>”</i>");
	output("\n\n<i>“Towards the end of my senior year in high school, I found a pair of the most</i> adorable <i>red high-heels on display. They were decorated with the brightest jewels I had ever seen. I wanted more than anything to have them for my prom night. But the price was far too exorbitant for a family like mine. I didn’t bother asking my folks for the cash; they were Vernon Strauss, and you don’t wear a Vernon Strauss product unless you’re</i> somebody. <i>And me and my family,”</i> she sighs, <i>“we were nobodies.”</i>");
	if (isLoreleisBitch()) output("\n\nYou sit and wait patiently for Lorelei to continue her story. You have a guess as to where she’s taking it, but you wouldn’t want to interrupt her. <i>“I didn’t steal the heels,”</i>");
	else output("\n\nOut of turn, you ask if she stole the shoes. <i>“I didn’t,”</i>");
	output(" she says, a mischievous glint in her eye. <i>“I stole the money to buy the shoes. From anywhere I could. From people; from purses; from wallets; from credit registers that were left unattended for just a moment too long. Sometimes I’d nearly get caught.”</i> She winks. <i>“But I never did.”</i>");
	output("\n\nYou ask her how her prom night went. <i>“My date pre-gamed the booze with his friends a little too hard. By the time he showed up to the dance, he was wasted – and a total waste of my time.”</i>");
	output("\n\nShe sighs again, through her nose. Her eyes travel around the room lazily, half-lidded, and her smile maintains, as she remembers the night fondly. <i>“I was</i> stunning, <i>[pc.name], oh, you should have seen me. Nobody could keep their eyes off me, the boys or the girls. That’s what they were, compared to me – they were</i> boys <i>and</i> girls.<i> I had commanded such attention, such</i> authority <i>that night. I had felt</i> powerful. <i>I felt like a</i> woman.<i>”</i>");
	output("\n\n<i>“Since then, it established something of a... pattern, within me,”</i> she continues, taking a sip of her wine. <i>“Get the money. Buy beautiful things. Feel</i> powerful.<i> It wasn’t long until I needed more money. So I started stealing more things, from more people, from larger and more important institutions. Every time I take something, darling,”</i> she says, looking into your eyes");
	if (isLoreleisBitch()) output(" and running her fingers along your collar");
	output(", <i>“I feel like... like I’m in control. Like I’m a queen. And everything belongs to the queen.”</i>");
	if (isLoreleisBitch()) output("\n\nConcurring in a way you know she’ll appreciate, you take her hand from your collar and kiss it, like you had before. Lorelei, understanding your meaning, nibbles into her lower lip and inhales. Every kiss you give makes her feel just a little more powerful, and if she wants to feel like a queen, you know there’s no better way to do it.");
	output("\n\n<i>“Over time, though, I found something more important than money,”</i> she says.");
	output("\n\nYou take a chance: jewels? Or simply the thrill of it?");
	output("\n\n<i>“I got pregnant, actually,”</i> she says. <i>“I... this is embarrassing to admit, but I celebrated one hit with a little too much wine at an upscale bar in Terra. I met a handsome Kui-Tan, and, well, I wanted to know if the rumors were true.”</i> She blushes – uncharacteristically, for someone as in-control as her at all times. <i>“Turns out, they were, and the condom we used didn’t stand a chance. I was halfway across the galaxy by the time I realized. We understood it to be a fling, so I never got his name or his number.”</i>");
	output("\n\nLorelei, for the first time, sets down her drink and stares at it forlornly for a moment. Then, she stands, and makes for the nightstand beside her bed. From its single drawer, she pulls out a framed photo – of her and a young half-Kui-Tan boy that couldn’t be older than four.");
	output("\n\n<i>“You had it right, you know. It put me in such a difficult spot. I wouldn’t call my skills ‘marketable,’ and I... I’ve come to relish the thrill too much to stop. It would have been irresponsible of me to keep going with my baby Vernon being dependent on me, but I didn’t know what else I could do. So, I,”</i> she continues, her smile coming back to her once more, <i>“I opened an adoption agency.”</i>");
	output("\n\nYou reel. <i>Lorelei</i> runs an <i>adoption agency?</i>");
	output("\n\n<i>“Having Vernon taught me a valuable lesson: that there are things worth cherishing more than just jewels or credits. When I first held him, it was like... I</i> knew <i>what I should do with my skills. With all those credits that I bring in. Look around us, [pc.name].”</i>");
	output("\n\nShe spreads her arms and motions to the opulent room: from the plush rugs, to the gem-studded walls, to the rack full of expensive wines, to the large bed with the thick covers.");
	output("\n\n<i>“What more do I need to spend my money on? What’s building up my own fortune worth at this point? This is</i> one room <i>in a dusty asteroid run by degenerate pirates; I think you get the idea of how much</i> excess <i>I have in my life. I don’t need more.”</i>");
	output("\n\nHer hand gently runs down the framed photo.");
	output("\n\n<i>“Vernon does.”</i>");
	output("\n\nThat’s very touching, but you still have to ask... why an <i>adoption agency,</i> of all things?");
	output("\n\n<i>“As you can guess, most of my work is done away from home,”</i> she laughs. <i>“I spend far less time with Vernon than I’d like, and I wasn’t about to put him up for adoption myself. I thought that opening my own would give him a place to be, if anything should happen to me; it’d give him lots of friends; and I’d be doing a good thing for all the less fortunate kids in this universe. Half of every credit I make goes to the agency; one third goes to Vernon’s trust fund; and I keep the rest for myself.”</i>");
	output("\n\nIt’s a lot to absorb. You sip on your own wine, trying to process everything – Lorelei, this cutthroat thief, one of the best rogue’s you’ve ever met – has found a higher calling for all her credits. It almost makes you forget that what she’s doing is illegal.");
	output("\n\n<i>“‘Higher calling’ is a good way of putting it, I think,”</i> she says, taking another drink out of her own glass. <i>“I named my son Vernon to remind me of how I got here in the first place, and what I’d be using my skills for going forward.”</i> Lorelei winks at you. <i>“You’d never guess how liberating it feels to be doing something for a greater good, even if it’s something as base as thievery. After all, what good is a pretty face if you have an ugly heart?”</i>");
	output("\n\nYou toast to that, and refill your drinks.");
	output("\n\nYou <i>do</i> have one last question, though. Why all the gems and jewels? She clearly isn’t pawning them.");
	output("\n\n<i>“<b>Those</b> are for momma,”</i> she says. <i>“Like I told you, all the universe’s most beautiful things belong with me.”</i>");
	if (isLoreleisBitch()) output(" Her eyes scan the collar you’re wearing. <i>“All of them.”</i>");
	if (pc.intelligence() >= 20) output("\n\nYou eye the photo of her and her son and put that statement to the image of her adoption agency. It might be best not to think about it too hard.");

	// end scene (scene: Robin Hood); apply the Buzzed status effect if it’s not already applied
	processTime(9+rand(7));
	flags["LORELEI_TALKED_JOB"] = 1;
	loreleiTalkButtons();
	addDisabledButton(0, "Thievery");
}

public function loreleiTellsYouWhereSheGotHerSuperSuit():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();

	output("You ask Lorelei, if it isn’t too forward of you to, about her suit. You’ve seen her do all kinds of tricks with it: it clung to her like it was taut rubber, but it breathed like it was silk. She could channel electricity through her hands with it.");
	if (isLoreleisBitch()) output(" And, how could you forget, it parted on command when she ‘inaugurated’ you as her possession.");
	output(" You’re unfamiliar with whatever technology it’s using.");
	output("\n\n<i>“That’s because it isn’t technology,”</i> she says, grinning like a boy with a dirty secret to tell.");
	if (silly) output(" <i>“It’s a type of amorphous, inorganic, multicellular symbiote created by a deity known as Gnull, to assist him in destroying other higher-beings known as Stellars. All symbiotes, like my own, bond to their host and amplify their physiques and characteristics, turning them into something they wouldn’t be capable of otherwise.”</i>");
	else output(" <i>“It’s a type of semi-sentient tar that had been enchanted by the indigenous Naleen tribes of Mhen’ga. By cutting out the heart of a virgin on the first blue moon of the year and submerging it into the tar, it takes on the heart’s memories and personalities, and it can be taught to bond with a host and be subject to their every whim and desire.”</i>");
	output("\n\nYou sit, listening to Lorelei’s explanation attentively");
	if (pc.intelligence() < 20) output(", raptured by every word. Eventually, she bursts into laughter.");
	else output(" – but you aren’t buying a single word. Eventually, you both burst into laughter.");
	output("\n\n<i>“Could you imagine?”</i> she asks, wiping a tear from her eye with a single finger.");
	if (silly) output(" <i>“Who could even make up something so silly? As if anyone would think something like a ‘symbiote’ made by some God could ever exist in reality!”</i>");
	else output(" <i>“I’ve taken my share of mudbaths before, but</i> tar? <i>You’d catch me dead and cold before I’d ever put muck like that on my body!”</i>");
	output("\n\nBoth of you chuckle through the last of your dying laughter. <i>“Ah, but seriously,”</i> she continues, taking another drink of her wine. <i>“You’ll have to forgive the technical jargon, but my suit is comprised of a lattice of microsurgeons woven into high-strength polymer, which is connected to me neurologically to give it shape and consistency. Have you heard of a company named Reaper Armaments?”</i>");
	if (CodexManager.entryViewed("Reaper")) output("\n\nYou say that you’re familiar with the brand. <i>“Good; then you know what it is that they specialize in. ");
	else output("\n\nYou can’t say that you’ve ever heard that brand before. <i>“The short of it, darling, is that they’re a weapons manufacturer. Not every weapon shoots projectiles or slices objects – my suit was designed for espionage, which is just warfare with a prettier name and fewer noises.”</i> She laughs. <i>“");
	output("My suit is... fresh from their research team, let’s say. The first of its kind.”</i>");
	output("\n\nShe lifts her hand, showing you her palm – and, suddenly, her black dress shifts, melds, and transforms, taking material from the bottom line of her wavy dress and crawling along her body as black tendrils, over her exposed belly, between her cleavage, up to her shoulder, and down her arm, until it forms an inky black glove around her hand and extended fingers.");
	output("\n\n<i>“It can be anything at all that I want it to be. Any shape, form, or consistency. It also keeps my body clean at all times");
	if (isLoreleisBitch()) output(" – I’m sure you noticed a difference when we made our relationship official");
	output(".”</i>");
	output("\n\nAs an example, more of the dress’s material makes the same journey, adding to her black glove, until it’s twice as large as her hand is. Her massive hand flexes and wiggles its fingers as naturally as her ungloved hand would.");
	output("\n\n<i>“I can’t change its color, though. It’s pitch black, through and through. Which works out pretty well for me; I’m not leaving the shadows when I work anyway, and when it’s time to play, black is</i> always <i>in season.”</i>");
	output("\n\nHer enormous hand shrinks back down as the material crawls back up her arm and towards her shoulder. Like before, the tendrils slip down into her cleavage – but, evidently feeling frisky, she has the material collect around each breast, boosting their size from her already-enviable D-cups straight up to E’s. They’re pitch black, making her look like’s wearing a tube-top under her dress, and she’s stuffing it rather shamelessly.");
	output("\n\n<i>“Imagine how fun it could be if I could,”</i> she says, winking at you, lifting one arm and stretching over her head. The motion even makes her breasts jiggle realistically. Before you say another word, the material disperses around her body, until her dress was exactly as she had it before.");
	output("\n\nYou ask her how she ‘communicates’ with the dress. She mentioned that she’s connected to it ‘neurologically.’ Does she mean, like... on an intellectual level, or something?");
	output("\n\n<i>“Something like that,”</i> she answers cheerily. Pushing on the bar, she spins on her stool, showing you her back, and points to a small spot on the back of her neck. There is a small, emerald-green piece of plastic, no larger than a fingernail, nestled into her skin, at the base of her skull. <i>“The suit is connected to me through this. When I want less material, it all goes right into this little receiver, and when I want more, this is where it comes from.”</i> She turns back toward you, a downright giddy smile on her face. <i>“You see in those old-timey classic movies, about thieves breaking into banks or museums, and they’re wearing belts and heavy backpacks full of all the tools they need... I can’t imagine working like that.”</i>");
	output("\n\nIf she’s connected with the suit neurologically, does that mean she can ‘feel’ it? If the suit is damaged, would it hurt her?");
	output("\n\nThe question seems to catch Lorelei off-guard, and she doesn’t know how to answer it at first. <i>“Yyy,”</i> she drones, trying to piece together the sentence in her head, <i>“yes, close enough. It’s sort of like a second skin, and I feel anything that touches it just as well as if it touches my bare skin, but at the same time, I don’t think that saying I ‘feel’ it really does it justice. You can’t command your own skin to change shape or to flow like water, and I’m afraid I can’t explain all the nuances to it adequately, but I</i> can <i>tell you that I can feel when something touches it, or tries to damage it.”</i> She smiles. <i>“Luckily, though, it can’t be damaged. After all, how are you going to ‘damage’ something that has no shape?”</i>");
	output("\n\nCan it not be burnt, or frozen? You imagine it’s insulated against electricity.");
	output("\n\n<i>“It can be burnt and frozen, yes. As useful a tool as it is,”</i> she says, before running her hand down the leg of her dress and swishing it against you, <i>“and as fashionable, you still need to remember that it’s billions of tiny machines all working to my every whim");
	if (isLoreleisBitch()) output(", like all the most useful and fashionable things should");
	output(". They obey nature as much as the rest of us.”</i>");
	output("\n\nYou get the feeling that this conversation is starting to get a little too complex for what is supposed to be a relaxed, casual atmosphere. You take a drink of your wine and tell her that you have one last question about it; Lorelei sits with a patient smile, ready to answer. You ask her how she got it.");
	output("\n\n<i>“It was a gift,”</i> she says with a coy smile, putting her hand over her chest. <i>“Straight from Reaper Armaments themselves. It was a very thoughtful one.”</i>");
	output("\n\nYou turn your head in disbelief. Why would Reaper Armaments hand such an impressive piece of technology to her? Did they not know what she would be capable of with it?");
	output("\n\n<i>“Oh, the gift wasn’t addressed to me, darling.”</i>");
	output("\n\n... that answers that.");

	// end scene (scene: Spandex); apply the Buzzed status effect if it’s not already applied
	processTime(9+rand(7));
	loreleiTalkButtons();
	addDisabledButton(1, "Her Suit");
}

public function loreleiWhyArentYouSomewhereMorePronounceable():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();

	output("You ask Lorelei what brings her to Zheng Shi. She’s a woman of finer tastes and standards; Zheng Shi is hot, dirty, stuffy, and is filled to the brim with a bunch of deplorables that, if they had their way, wouldn’t hesitate to debase her to their level. And yet, she’s not only stayed her long enough to fully furnish her own little pocket of paradise, but she has a loyal doorman. What’s her history here?");
	output("\n\nLorelei has her wine to her mouth by the time you finish speaking, and take a moment to breathe before answering. <i>“Goodness,”</i> she says, <i>“that’s so many questions all at once, darling.”</i> She smiles that sweet, charming, disarming smile of hers. <i>“I don’t mind answering, of course. I’d want to know all about me, too. I</i> am <i>fascinating, after all.”</i>");
	output("\n\nYou share a laugh at that, and you wait respectfully for her to pick a question and start answering. <i>“Well,”</i> she starts, sliding her finger along the rim of her wine glass, <i>“The truth is, I’m actually here on hired business. Care to guess by whom?”</i>");
	if (pc.intelligence() < 35)
	{
		output("\n\nA mining company, like RhenWorld, Pyrite Heavy Industries, or even Steele Tech? The base has a mining operation; surely one of them would like to stake their claim to something as mineral-rich as Zheng Shi.");
		output("\n\n<i>“An interesting, and well-reasoned guess, darling, but no, I was not hired by any mining company.”</i>");
		output("\n\nPerhaps a rival ne’er-do-well gang, looking to try and encroach on the Zheng Shi pirate’s turf? Like, the Black Void, maybe?");
		output("\n\nLorelei frowns at the suggestion. <i>“The Black Void are thugs, brutes, and murderers. They operate too differently from how I do, and besides, they’re beneath me.”</i> However, she winks at you. <i>“You’re getting closer, though.”</i>");
		output("\n\nYou rack your brain for a moment, trying to think of anyone else that might want to take advantage of Lorelei’s skillset. Exasperated, you suggest she’s working for the Zheng Shi pirates themselves, knowing that it would make no sense. Why would she be hired to steal from her own employer’s people?");
		output("\n\nLorelei laughs at the suggestion. <i>“It would be a unique twist, wouldn’t it? Maybe someone up in the chain of command is trying to keep their team on their toes! But no, that’s a little</i> too <i>fantastic of a suggestion, I’m afraid.”</i>");
		output("\n\nYou tell her that you give up.");
		output("\n\n<i>“I’m here on behalf of the United Galactic Confederacy.”</i>");
		output("\n\nYou’re surprised – you’d have thought she’d want to stay as far away from the law as she could. You ask how they even got into contact with her.");
	}
	else
	{
		output("\n\nA couple of suggestions immediately come to mind, but you reason away all of them – whoever hired Lorelei must have quite a bit of power and resources to not only contact her, but convince her in the first place. Off the top of your head, that leaves only two major possibilities: Nova Securities, and the United Galactic Confederacy.");
		output("\n\nIf it’s one of those two, you ask yourself: what would either of them want with Zheng Shi? You figure that Nova Securities would be on neutral terms with the pirate base, if anything, so if she were hired by them, it’d be to keep tabs on the base, nothing more.");
		output("\n\nWhereas the U.G.C., being the governing body of most of the known universe, would have every incentive to want to crack down on something as illicit as a pirate base in an asteroid, performing illegal mining operations and running a slave trade. Lorelei would naturally want to stay away from the law – but, at the same time, the law <i>could</i> be a very powerful ally for a criminal.");
		output("\n\nStill, all this inner monologuing does nothing to humor Lorelei");
		if (isLoreleisBitch()) output(", which is why you’re here in the first place");
		output(". You decide to make your guess: she’s here on behalf of the United Galactic Confederacy.");
		output("\n\nLorelei blinks in surprise. <i>“Uh, yes,”</i> she says haltingly. <i>“That’s... that’s correct.”</i> Her eyes fall from yours to the floor, totally unsure of how she should process your completely correct guess. <i>“Wow.”</i>");
		output("\n\nYou ask the first obvious question that comes to mind: how did they even come into contact with her?");
	}
	output("\n\n<i>“That’s actually a whole story for another time, I’m afraid,”</i> she says. <i>“What’s important is that they did, and we... worked out a deal.”</i>");
	output("\n\nYou ask if she can tell you what the deal was, or if that’s too confidential to share with");
	if (isLoreleisBitch()) output(" a pet like");
	output(" yourself.");
	output("\n\nLorelei takes a drink of her wine; when she pulls the glass away, she savors what’s in her mouth, a coy grin on her face, as she recollects her meeting with the confederacy. Then, she swallows. <i>“They offered me two of the things I coveted the most; and they only wanted one.”</i> She winks at you, her teeth snidely poking from her curling lips. <i>“I give them information, and they give me amnesty... and all the jewels a lady could want.”</i>");
	output("\n\nWhy would the pirates of Zheng Shi give her the information she’s after? Hell, why would they give her a private room, allow her to decorate it, and let her hire a doorman?");
	output("\n\nShe hums, staring into her wine glass on the counter as she considers her response to your question. <i>“Tell me, darling... if information is the most powerful weapon in an arsenal, what weapon is potent enough to destabilize it?”</i>");
	if (pc.intelligence() < 24)
	{
		output("\n\nYou think on it, but you don’t know. Information isn’t physical, and once it’s obtained, it can’t be destroyed. You don’t know what could be more powerful than that.");
		output("\n\n<i>“Misinformation, honey.”</i>");
	}
	else
	{
		output("\n\nIf information is so highly coveted because of its potency, then the only thing that could beat it is sabotage. Misinformation. <i>Lies.</i>");
		output("\n\n<i>“Correct.");
		if (isLoreleisBitch()) output(" Very good.");
		output("”</i>");
	}
	output("\n\nLorelei brings her wine to her mouth and takes another drink.");
	output("\n\n<i>“Ask anyone on Zheng Shi why I’m here, and you’ll get anything from me being hired help from Nova Securities, sent to test their patrols and their systems from exploits; to me being one of Maike’s personal concubines; to me being a fencer for their mining operations, selling the jewels for credits and helping them fund their plans....”</i>");
	output("\n\nShe looks around the room, to all the gems she has studded into the walls and floors. <i>“Maybe not so much that last one,”</i> she laughs. <i>“But if there’s any one thing any of them will tell you, it’s that I am</i> not <i>to be questioned.”</i>");
	if (isLoreleisBitch()) output(" She runs her finger along your collar. <i>“I reward the ones that do as they’re told, you know.”</i>");
	output("\n\nYou hastily ask her why she’s telling you all this. Isn’t she worried you might try to snitch on her?");
	output("\n\nShe smirks.");
	if (isLoreleisBitch()) output(" <i>“No.”</i> And that’s that.");
	else output(" <i>“And tell them what? That I’m a spy working for the Confederation?”</i> She huffs once. <i>“And what do you expect them to do if they believed you? An execution would point the Confederation here faster than a neon sign. Would they... ask me to leave?”</i> She smiles – the same smile, but with something a little darker to the glint of her eye. <i>“They know better. And,”</i> she whispers, <i>“so should you.”</i>");
	output("\n\nYou have one last question for her, on the topic. Why did she attack you? A woman as well-informed as herself should have known who you were.");
	output("\n\n<i>“Indeed,”</i> she says, bringing her wine to her lips and finishing her glass off. <i>“Be a gentle[pc.man] and pour me another, would you?”</i> You take her glass and do as she asks. <i>“There’s no long-winded secret, darling; I wanted to know if you were worth my time. If you weren’t, you would be free money for the taking.");
	if (isLoreleisBitch()) output(" Imagine my surprise when you would be so much more, waiting to be taken.");
	output(" And if you were....”</i>");
	output("\n\nWhen you hand her glass back to her, she touches your hand with hers, lingering her fingers along the back of your wrist. <i>“Well... here you’d be");
	if (isLoreleisBitch()) output(" either way.”</i>");
	else output(".”</i>");

	// end scene (scene: Why Here); apply the Buzzed status effect if it’s not already applied
	processTime(9+rand(7));
	flags["LORELEI_TALKED_UGC"] = 1;
	loreleiTalkButtons();
	addDisabledButton(2, "Why Here?");
}

public function loreleiIsntTerriblyFondOfZS():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();

	output("Knowing her line of work, Lorelei must be well acquainted with the rest of the peoples of Zheng Shi (whether they want her to or not). You ask her what her opinion is on the groups and factions wandering the asteroid with her.");
	output("\n\nShe lowers her wine glass from her mouth and frowns in thought at the question. <i>“Pirates,”</i> she whispers to herself disdainfully. You can tell that she doesn’t like thinking about most of them. <i>“Brutes; thugs; deviants; the lot of them.”</i> She sets down her wine glass and grasps your hand, looking you in the eye. <i>“I’m sure this will be rich to hear, but there’s a certain</i> finesse <i>to theft as a craft. If thievery were like baking, I would consider myself a world-class artiste, and I make the finest cakes, fit for royalty, and those pirates are little more than meat butchers.”</i>");
	output("\n\nYou take it to mean that she isn’t fond of any of them, and that she’d prefer to interact with them as little as possible.");
	output("\n\n<i>“It’s difficult to find a diamond in the rough in a place as coarse as Zheng Shi, darling, and I am neither vain, nor,”</i> she continues, raising her wine glass and toasting it to you, <i>“drunk enough to exclude myself.”</i> She takes a swig – a full, hearty one, unlike the ladylike sips she had been taking up to that point. <i>“I can at least consider myself to be a finely-sanded pebble compared to their droppings-covered-in-cat-litter.”</i>");
	output("\n\nShe clearly doesn’t hold them in a high regard, but, perhaps, you can work with that; it’ll at least give her something to talk about, and Lorelei isn’t one to pass up the opportunity to talk about things. You ask her to start with who or what she likes the most, and then work her way down from there.");
	output("\n\nShe hums, and swirls the wine in her glass as she considers it. <i>“Perhaps it might be best to start light. If I start with the</i> truly <i>deplorable, I’ll be too worked up and too sauced to say a good thing about anyone!”</i> She looks at you, and her hand");
	if (isLoreleisBitch()) output(" draws a finger along your collar.");
	else output(" squeezes yours.");
	output(" She smiles at you affectionately. <i>“Almost anyone. There aren’t too many bad things to say about you, darling.”</i>");
	output("\n\nLorelei takes a sip of her wine before getting started. <i>“Easily, the best crowd in Zheng Shi are the Rodenians. Have you met them?”</i> She continues before you can respond either way. <i>“Adorable little rat boys and rat girls. I was never one for rodents as pets, growing up – we were more of a dog and cat family,");
	if (pc.race().indexOf("ausar") < 0 && pc.race().indexOf("huskar") < 0 && pc.race().indexOf("kaithrit") < 0) output(" ");
	else if (isLoreleisBitch()) output("”</i> she says, then pauses, her eyes subtly scanning your body. She continues, <i>“");
	else output(" ");
	output("but if I were the type, I’d");
	if (isLoreleisBitch()) output(" slap one of my collars on them and make them mine.”</i>");
	else output(" snatch one of them up for myself in a heartbeat.”</i>");
	output("\n\nHer eyes wander the room momentarily, taking in the décor. <i>“They’re harmless when you learn more about them; they’re cute as could be; and really, if any person or persons in Zheng Shi could say they had a noble cause, it would be them.”</i> She takes another sip, her tongue gliding along the rim of her wine glass. <i>“Apart from myself, naturally. The only ‘problem’ I have with them is their...</i> penchant <i>for jewels and gems, and I’m not overly fond of competition, but so long as no jewel leaves this room, I can learn to coexist with them.”</i>");
	output("\n\nYou ask her who’s next on the list. She puts her chin between her thumb and index finger and rubs as she considers the question. <i>“I suppose the next in line would be that fluffy butch Korgonne mechanic, Urbolg, in the hanger. He’s the sort that prefers to be left alone to his work. I rarely intrude on him for anything, and, so far as I know, he hasn’t done anything</i> terribly <i>unbecoming.”</i>");
	output("\n\nShe frowns as she recalls the mechanic. <i>“Let me prelude what I’m about to say by saying that I don’t find him attractive – too much grease and oil, and his fur is coarse and unwashed. I’m not one to appreciate the ‘short-and-stout’ body-types, either.”</i> She leans in close, her voice becoming quiet, as she shares her dirty secret with you: <i>“But by Gods, [pc.name], I could damn-near fold in half for that accent of his.");
	if (flags["URBOLG_DOGGYED"] >= 3) output(" And only sometimes, [pc.name], I wonder if he’d be okay if I called him ‘daddy,’ too.");
	output("”</i>");
	output("\n\nLorelei sits up straight, grasps the stem of her wine glass, and slams back the rest of the drink, before");
	if (isLoreleisBitch()) output(" handing it to you and wordlessly demanding you refill it for her.");
	else output(" reaching for the open bottle and pouring herself some more.");
	output(" <i>“But that’s about all the leniency I have for the fools in this cesspit.”</i> She points one finger at you, almost accusatorily. <i>“The Laquine Jumpers? Ditzy, aimless, rutting beasts, the lot of them. They each have endowments so large, it’s a wonder they have the focus to do any piracy, much less the function to press themselves into those skintight suits of theirs.”</i>");
	output("\n\nShe extends a second finger towards you. <i>“The Slyveren ‘Slavebreakers,’ they call them? They’re unprofessional; they lack drive; and, worst of all, they</i> cheat! <i>They use psionics to wear down their prey and ‘break’ them, when any self-respecting seductress wouldn’t need to put their fingers into their target’s brain and start pulling at the wires. After all,”</i> she continues,"); 
	if (isLoreleisBitch()) output(" reaching forward to grip onto your collar, <i>“I got this on you");
	else output(" motioning to you, <i>“I got you in here");
	output(" fair and square, didn’t I?”</i>");
	output("\n\n<i>“And those... ‘Sex Op’ Kaithrits, or whatever they call themselves,”</i> she continues, extending a third finger. <i>“They are somehow simultaneously the best of the bunch, and the worst. They put on the facade of having discipline, and they’re charged with keeping ‘the peace’ on Zheng Shi, but their constitution is as weak as their superior’s. I could consider forgiving a band of mercenaries just doing their job, but flash them a few times and they’ll be too lustful to even</i> do <i>them! If there’s any one thing that</i> isn’t <i>sexy, [pc.name], it’s a lack of discipline.”</i>");
	output("\n\nShe raises her wine glass to her lips, but, just as her lips touch the glass, she hesitates and reconsiders. She had been pounding down the wine as she went; maybe, in the heat of the moment, she had realized how intense she was being and decided to hold back.");
	output("\n\n<i>“But the absolute worst of them all are the management.”</i> She lowers her glass and traces the rim with her finger, making the wine glass sing a low, wailing note for you both. <i>“Maike, the Overseer, whom I’m sure you’ve met by now, and two of her cohorts: one Laquine they call the Shock Hopper, and another Laquine they call,”</i> she groans, <i>“‘Large Dick Collider.’”</i> She forces out every word in the Laquine’s name, struggling with them like they were rubber in her mouth. <i>“To this day, still easily the most ridiculous name I’ve ever heard.”</i>");
	output("\n\nLorelei’s eyes meet yours, and you sense an unusual serenity within them: her emotions about the management in Zheng Shi are pure and unfiltered, for better or worse.");
	output("\n\n<i>“It has nothing to do with their work ethic. They run the asteroid with an iron fist, and for good reason: nobody else is as qualified to run this place as they are. It has to do with their slave trade.”</i>");
	output("\n\nShe pauses and tilts her head down, her lips curling into themselves again and again, as she considers how she wants to phrase what she’s about to say next.");
	output("\n\n<i>“Credits and gems are one thing. Equipment is one thing. The parts to build an enormous spaceship... that’s one thing.”</i> Without lifting her head, her eyes lock back onto yours, with a steely determination that wasn’t there before. <i>“This may be because I’m a single mother running an orphanage, but stealing a</i> life <i>and making them your slave isn’t something I can look past. They’re the worst, most vile creatures in this universe, [pc.name], and the sooner Zheng Shi is dismantled, the better.”</i>");
	output("\n\nYou ask her if that’s a part of her personal agenda.");
	output("\n\n<i>“With any luck.”</i>");
	output("\n\nIt’s safe to say that she’s done with this conversation.");

	// end scene (scene: Gossip); apply the Buzzed status effect if it’s not already applied
	processTime(9+rand(7));
	loreleiTalkButtons();
	addDisabledButton(3, "Others");
}

public function loreleiLovesThePCSoSheLetsYouGo():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	showName("\nLEAVING");

	output("You get up to excuse yourself. It was nice meeting Lorelei in her little pocket of paradise in Zheng Shi, but unfortunately, duty calls.");
	// Continue here if the PC is wearing the collar
	if (isLoreleisBitch())
	{
		output("\n\nLorelei hums, then smiles sweetly. <i>“I understand,”</i> she says, one hand gently trailing down the side of your face, cupping your cheek. <i>“We both have our vices and our responsibilities that we must abide by.”</i> She blows you a kiss. <i>“Don’t leave your mistress waiting too long, [pc.name]. I have a bar and a bed that’s in desperate need of warming nowadays.”</i>");
		output("\n\nBefore you leave, you take your wine glass, and Lorelei’s, and wash and dry them in the sink she has installed behind the countertop, then replace them and the bottle of wine just where you found them. She watches you with amused patience – it seems to earn you points with her. She smiles as you leave, and her smile is the last thing on your mind as you shut the door to her room behind you.");
	}
	// Continue here if the PC is not wearing a collar
	else
	{
		output("\n\n<i>“I understand,”</i> Lorelei says, before blowing you a kiss. <i>“I’m sure someone of your upbringing is quite the outgoing entrepreneur. Get out there and make your mark on this station for us both, darling.”</i>");
		output("\n\nYou do Lorelei the courtesy of placing your wine glass in the sink behind the countertop and re-corking and replacing the bottle before you show yourself out. Lorelei sees you off with a smile – and her smile is the last thing you see before you shut the door behind you.");
	}

	addButton(0, "Next", move, loreleiExit);
}

public function loreleiIWasJustSayingHi():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	showName("\nLEAVING");

	// Continue here if the PC is wearing the collar, and has done nothing – they entered the room and immediately left
	if (isLoreleisBitch())
	{
		output("Lorelei’s eyes widen in disbelief, that you would show yourself into her personal quarters, then dirty her glasses with her fine, expensive wine, and then try to leave without so much as asking how her day was, or without sampling the wine, or even complimenting her on her dress. She’s silent at first, taken by surprise at your gall, but as soon as you stand, she recollects herself.");
		output("\n\nDisplaying the agility you’ve come to know her for, she lunges at you, snaking her fingers in between your collar and your neck – in a stunning display of dexterity, all without spilling a drop of wine in her glass. She’s got you by the collar, and you freeze.");
		output("\n\n<i>“If that’s your idea of humor, darling, you and I will have to have a chat about your sense of comedic timing,”</i> she hisses. <i>“I did not show you into my personal quarters and share my wine with you all so you could make a fool of me.”</i>");
		output("\n\nYou gulp as she yanks on your collar, forcing you down. You’re");
		if (pc.hasKnees()) output(" on your knees");
		else output(" kneeled down");
		output(" before her, your eyes forced to crane upwards to meet her piercing gaze. She sits, one leg crossed over the other; from your position, you’re given a quick, teasing look up her dress, just a short ways past her knees – as far as you can tell, she isn’t wearing any undergarments at all.");
		output("\n\n<i>“I am a forgiving mistress, [pc.name], and I know how you can make your poor sense of judgment up to me,”</i> she says, her naked heel brushing against your forearm and slowly making its way up. <i>“Kiss me, [pc.name]. Start at my ankles and work your way up. Do not stop until I say so.”</i>");
		output("\n\nHer ankle rolls against you, tapping on your arm with the point of her high-heeled-toes. You lean forward slightly, looking up her dress, to see how much leg you’ll be kissing to make it up to her.");
		output("\n\nYou have a pretty solid idea how this ‘apology’ is going to end.");
		addButton(0, "Next", loreleisGreatestTreasureRevealed, true);
	}
	// Continue here if the PC is not wearing the collar, and has done nothing – they entered the room and immediately left
	else
	{
		output("<i>“What?”</i> Lorelei asks in bewilderment. She looks to her glass, then to yours, then to you. <i>“But... you just....”</i>");
		output("\n\nYou repeat that it was nice seeing her again, but you really must be going. You have business to attend to on Zheng Shi, and it can’t wait.");
		output("\n\nLorelei’s eyes are wide with shock and surprise, that you would come in, dirty her glasses with her expensive wine, and then leave without so much as asking how her day was. <i>“O-okay,”</i> she stutters, placing her wine glass down. She hadn’t drunk a drop.");
		output("\n\nYou show yourself out of the room and back into the Recreational Deck of Zheng Shi.");
		addButton(0, "Next", move, loreleiExit);
	}
}

public function loreleiEngagesInADifferentTypeOfIllicitAct():void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);
	processTime(3+rand(3));
	// increase Lust by 50
	
	output("You give her large bed a sideways glance, and ask Lorelei if she’s interested in continuing this conversation on something softer than a pair of hard stools.");
	output("\n\nShe smiles, that coy, devious, knowing smile, and takes another drink of her wine. She turns her head sideways, her visible eye staying focused on you.");
	if (isLoreleisBitch())
	{
		output(" <i>“What if I’d rather stay right here?”</i> she asks. She points her finger at you and turns it in a lazy circle, wordlessly commanding you to proceed. <i>“Convince me.”</i>");
		output("\n\nYou tell Lorelei that, as enjoyable as it is to sit and be her trophy to admire, there is so much <i>more</i> you can be for her. You want to prove it. You want to be intimate with the woman that has stolen you.");
		output("\n\nSatisfied, she puts down her wine glass and stands. With surprising speed, her fingers dip into the clasp of the collar around your neck, and she yanks you to her, putting your chin on her shoulder. <i>“I am nothing if not a gracious mistress,”</i> she purrs, her free hand gently stroking your back. <i>“Let’s get ‘intimate,’ then, darling.”</i>");
	}
	else
	{
		output(" <i>“Something tells me that, if we move from where we are, we won’t be doing much</i> talking,<i>”</i> she notes.");
		output("\n\nYou ask her if that’s such a bad thing.");
		output("\n\n<i>“I enjoy when you ask me about myself, as a matter of fact,”</i> she laughs, before placing down her wine glass and standing. She reaches forward and takes your hand in hers. <i>“I will choose to take this as you wanting to learn</i> more <i>about me.”</i> She bends down, her breasts pressing into your shoulder, as she whispers into your ear. <i>“And I have a lot to teach you.”</i>");
	}

	output("\n\n");
	showImage("LoreleiSitting");
	output("She leads you to the bed, and sits. As she does, her black dress begins to melt away from her body, piece by piece; chunks of her clothing disappears in seemingly random spots all over herself, showing you more and more of her tanned body beneath it.");
	if (pc.isNude())
	{
		output("\n\n<i>“I don’t share your nudist tendencies, but in a way, I sort of envy them,”</i> she says, smiling at you. <i>“If I did, and I were half as beautiful as you, I’d have no qualms bearing my all to the universe.”</i>");
		flags["LORELEI_SEEN_YOU_NUDE"] = 1;
	}
	else
	{
		output("\n\n<i>“" + (isLoreleisBitch() ? "Remove your gear" : "Undress for me") + ",”</i> she says, and you do as you’re told, removing your [pc.gear] for her in probably less of a sexy fashion than she was hoping for, but, all the same, you’re as bare as you could be, giving Lorelei a full view of everything you have and everything you are.");
		output("\n\nYou tell Lorelei that she has all the radiant beauty she needs to turn as many heads as she likes, no matter what she’s wearing.");
		if (flags["LORELEI_SEEN_YOU_NUDE"] == undefined) output(" <i>“I appreciate the compliment, darling, but we’re past the pleasantries.”</i>");
		else output(" <i>“Oh, I</i> know <i>I’m beautiful enough to pull it off. I said if I was half as beautiful as</i> you, <i>not half as beautiful as I am now.”</i>");
		output("\n\nIn time, you’re both as naked as they day you were both born. Lorelei sits on the edge of the bed, her legs spread, giving you a good, unimpeded look at her most valuable jewel of them all.");
	}
	output("\n\n<i>“How would you have " + (isLoreleisBitch() ? "me" : "us") + ", darling?”</i> she asks, handing you the reins.");
	output("\n\nThere are so many options available to you....");

	pc.changeLust(40+pc.libido()/5);
	loreleiSexMenu(true);
}

public function loreleiSexMenu(fromMenu:Boolean = false):void
{
	//[=Vanilla=][=Ask4Oral=][=Worship=][=Lapdance=][=Futa=]
	if (!pc.hasGenitals()) addDisabledButton(0, "Vanilla", "Vanilla", "Requires Genitals");
	else addButton(0, "Vanilla", hermRouter, [loreleiHasStolenYourGenitaliaOhNo, [pc.biggestCockVolume()+1, false], [0, 0, 0]], "Vanilla", (isLoreleisBitch() ? "Maybe, if you ask politely, Lorelei will fuck you. She’s a generous mistress, after all." : "No fancy stuff, and no games – just you and Lorelei."));

	if (!pc.hasGenitals()) addDisabledButton(1, "Ask For Oral", "Ask For Oral", "Requires Genitals");
	addButton(1, "Ask For Oral", hermRouter, [loreleiShouldntTalkWithHerMouthFull, [pc.biggestCockVolume()+1, false], [0, 0, 0]], "Ask For Oral", (isLoreleisBitch() ? "It’d be awfully forward of you, but... maybe you could ask Lorelei if she’s willing to show her favorite possession some special attention." : "Ask Lorelei if she’s willing to show you some very special lip service."));

	addButton(2, "Worship", loreleiShowsYouHerMostPreciousTreasureBox, undefined, "Worship", (isLoreleisBitch() ? "Ask your mistress if you can provide her with some particularly <i>special</i> attention. Maybe it’ll earn you some points with her." : "Lorelei is a beautiful woman, and she deserves some special attention. Attention you can provide."));

	if (!pc.hasGenitals()) addDisabledButton(3, "Lapdance", "Lapdance", "Requires Genitals");
	else addButton(3, "Lapdance", hermRouter, [loreleiTheDancingQueen, [pc.biggestCockVolume()+1, false], [0, 0, 0]], "Lapdance", (isLoreleisBitch() ? "Tell Lorelei that you’d like to be closer to her. You have a nice, wide open lap that could use its mistress’s company. Maybe, if you can get her permission, her lapdance could be a little more hands-on..." : "Assure Lorelei that your lap is a far warmer, and far more comfortable, seat in the room than any bed or barstool. Of course, this being a private room, any lapdance you get would be very hands-on..."));

	if (lorelei.hasCock()) addButton(4, "Futa", loreleiAndTheGreatAdjustableWang, undefined, "Futa", "You went through all that trouble to get Lorelei that SynthSheath, like she asked... now, it’s time to ask if she’d be willing to put it to use on you.");

	if (fromMenu) addDisabledButton(14, "Leave", "Leave", "You didn’t get Lorelei naked just so you’d leave her horny, cold, and alone, would you? Fuck this woman, already!");
	else addButton(14, "Leave", loreleiHasHadEnoughBanging, undefined, "Leave", "As fun as it’s been, you can’t stay with Lorelei and fuck her forever – as much as you may want to.");
}

public function loreleiHasStolenYourGenitaliaOhNo(genIdx:int, vag:Boolean):void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);
	processTime(20+rand(16));

	var tooBig:Boolean = (!vag && tooBigForLorelei(pc.cocks[genIdx]));

	if (isLoreleisBitch())
	{
		output("You kneel down, placing yourself in between Lorelei’s spread legs. You don’t dare touch her without your permission, though you <i>do</i> meet her eyes with your own – if you have permission to look at her naked body, you assume you have permission to look her in the eyes. You ask Lorelei if she would have you.");
		output("\n\n<i>“Hmm,”</i> she hums, loudly pondering the question. She brings a finger to her chin and taps at it as she considers your request. <i>“Do you mind being the bottom, darling?”</i>");
		if (pc.isAss()) output("\n\nYou tell her that you normally prefer to top, but in her case, you’re not sure you have a choice, not that you wanted one.");
		else output("\n\nYou tell her that your position between you two is for her to decide.");
		output("\n\n<i>“Good answer,”</i> she coos, then lifts her right hand and crooks her finger at you. <i>“Come to me, then.”</i>");
	}
	else
	{
		output("You kneel down, placing yourself in between Lorelei’s spread legs. You run your hands over her silky-smooth skin, and you drink in her body with your eyes, from her wide, motherly hips, to her firm breasts, to her");
		//output(" ruby-red");
		output(" rosy-brown");
		output(", coy-smiling lips. Gods, do you ever want her, and you tell her as such.");
		output("\n\n<i>“Hmm,”</i> she hums – not in indecision, but in delight at your words. <i>“The feeling’s mutual, darling. I’d want me, too.”</i> She giggles to herself. <i>“But seriously. I’m right here, [pc.name].”</i> She lifts her right hand and crooks her finger at you. <i>“Come and have me.”</i>");
	}

	output("\n\nYou raise, leaning into Lorelei, putting your hands on either side of her. Then, before you can react, her legs lock around your waist, tightly pinching you between her svelte thighs – they’re stronger than they look. She hooks her hands underneath your armpits and, with a rough twist, sends you hurtling onto her bed, on your back, with her and her naked, flawless body grinding on top of you.");
	output("\n\nLorelei grins down at you and licks her lips, wetly and loudly, before lunging forward, burying her tongue deep into your mouth. She excitedly twists and rubs her flat tongue against yours, tasting and feeling you, wrapping you both into a ribbon and feeling every bud on each other’s tongues. You feel her hands circle around your shoulders for leverage, and she humps and frots her body against yours, her smooth skin grinding against your [pc.skinFurScales].");
	output("\n\n" + (isLoreleisBitch() ? "You hesitate at first, then start moving your body with her; when she doesn’t object or scold you, you grow bolder" : "You eagerly match her movements") + ", humping against her with your whole body. Your [pc.chest] rubs against her firm D-cups,");
	// Cs or lower
	if (pc.biggestTitSize() < 5) output(" your own chest overwhelmed by her heavy set and sunk into her rolling mounds");
	// Between Ds and Es
	else if (pc.biggestTitSize() < 10) output(" your breasts each matching each other move-for-move, flesh mingling with flesh");
	// Fs or larger
	else output(" her body using yours as a hot, soft cushion, her breasts disappearing into the sinews of your own");
	output(". Your hands trail down her back, and she giggles at your touch, twisting her spin to guide your fingers to her hidden erogenous spots; and your");
	if (vag) output(" [pc.vagina " + genIdx + "] mingles and mixes with her own, stimulating you both; your every pass against each other gets you both wetter, making the grinding easier, making her grind some more...");
	else output(" [pc.cock " + genIdx + "] wedges firmly between your grinding, shaking, humping bodies, getting harder and leakier between you two, ready to play and " + (isLoreleisBitch() ? "obey your mistress." : "entertain Lorelei."));
	output("\n\nLorelei pulls away and puts her chin on your shoulder, taking in a deep breath through her nose, imbuing your scent on her nostrils. <i>“I hope you don’t mind,”</i> she whispers, nibbling on your ear – she’s surprisingly gentle about it, considering how wantonly you two are humping each other. <i>“I can get a little... possessive, when it comes to my property.”</i>");
	output("\n\nShe licks you, from your neck to the back of your ear, slowly; she moans right into your ear as she goes.");
	if (isLoreleisBitch()) output(" <i>“Like I told you before... sometimes, after a particularly good heist... I like to touch myself with my gains.”</i> She bites onto your ear again, her tongue lashing out to rub at the spot she just bit. <i>“And you, my darling... mmmm, you are my greatest heist of them all.”</i> She presses her lips right up against your ear, whispering like she were about to share her darkest secret. <i>“I am going to</i> fuck <i>you....”</i>");
	else output(" <i>“Sometimes,”</i> she whispers, her lips pressing against your ear, making sure her dirty little secret is only between you two, <i>“after a particularly good heist... I like to touch myself with my gains.”</i> She kisses you, then rims your ear with her tongue. <i>“I wonder what that makes you, then, hmm...?”</i>");
	output("\n\nMaking good on her promise, she sits up, straddling your hips with her own. Her hot, naked sex – waxed to silky-smooth perfection, you notice – presses into your pelvis, leaving a damp spot on your body. " + (vag ? "Your [pc.vagina " + genIdx + "] sits just a few inches away, beneath her heaving body;" : "Your [pc.cock " + genIdx + "] stands rigid just behind her, nestled into the valley of her ass;") + " with just a little adjustment, you’ll be united with her, and you’ll " + (isLoreleisBitch() ? "truly belong to her" : "know what heaven is like") + ".");

	// Continue here if PC’s dick is too big
	if (tooBig)
	{
		output("\n\n<i>“Hmm,”</i> Lorelei hums, feeling your meat press back against her whenever she leans into it. <i>“But this is an issue, isn’t it?”</i>");
		output("\n\nYou understand what she means; there is simply no way you’re going to fit. Your cock is too much for her, especially with her svelte body.");
		output("\n\n<i>“But I’ll be damned if I’ll let that stop us,”</i> she continues, then leans forward to lift her lower body off you. With her left hand, she fishes for your dick, grabbing it by the <i>[pc.base " + genIdx + "]</i> and shifting it forward, sliding it between your hot, wet bodies until it’s up against her stomach.");
		output("\n\n<i>“This will have to do, honey,”</i> she winces, moving forward and pressing her pussy against your shaft. <i>“I’ll make sure you enjoy every last second either way.”</i>");
	}
	// Else
	else if (vag) output("\n\nWith a single, fluid motion, she draws her body backward, and, just like that, you’re connected with her, pussy to [pc.vagina " + genIdx + "]. Her clit bumps into yours, and you feel her heat and juices crash into you and yours like a wave – and it’s only just begun.");
	else output("\n\nLorelei lifts herself off you momentarily; just high enough to grab your [pc.cock " + genIdx + "] by the [pc.base " + genIdx + "] and align your [pc.cockHead " + genIdx + "] against her honeypot. She teases you both at first, dragging your head through her folds without actually penetrating her – then, without warning, she drops, spearing yourself into her.");

	if (!vag && !tooBig) pc.cockChange();

	output("\n\nShe sighs, part in satisfaction and part in victory, at having claimed you for herself");
	if (isLoreleisBitch()) output(" once again");
	output(". Her stomach clenches, and she runs her hands through her hair, flaunting her chest in your direction. She pauses at first, simply enjoying the feel of having you be a part of her, adjusting her body to acclimate to your own.");
	output("\n\nThen, when she’s good and ready, she leans forward, her hands pressed into the bed on either side of you.");
	if (vag) output(" With the pull of her lower body, she grinds forward, then back, then forward again, her ample, motherly pussy pressing and dominating your own");
	else if (tooBig) output(" With the pull of her lower body, she grinds forward, then back, then forward again, her ample, motherly pussy sliding back and forth wetly across your shaft");
	else output(" With the flex of her hips, she lifts, then drops, then lifts again, her bubble butt slapping audibly against your [pc.thighs] every time she penetrates herself on you");
	output("; her every motion feels deliberate and controlled, all the way down to");
	if (vag) output(" how roughly her pussy grinds and kisses your own, and where on your [pc.vagina " + genIdx + "] she applies more pressure.");
	else if (tooBig) output(" how roughly her pussy licks and slides across your [pc.cock " + genIdx + "], and how tightly her pelvis clenches down on your meaty shaft.");
	else output(" how her cunt seems to squeeze you from the bottom up, massaging out your [pc.cum].");
	output("\n\nLorelei takes deep, shuddering breaths through her nose and out her mouth with her every motion against you. <i>“Feel me,”</i> she says, and you’re all too eager to " + (isLoreleisBitch() ? "obey" : "comply") + ", bringing your hands to her glutes and grasping onto the meat of her ass firmly");
	if (!vag && !tooBig) output("; she feels somehow firmer, knowing that you’re inside her");
	output(". She, in turn, cranes her back, wrapping her arms around your head and pulling you against her sweaty, heaving breasts. <i>“This is what a</i> " + (isLoreleisBitch() ? "mistress" : "woman") + " <i>feels like.”</i>");
	output("\n\nYou open your mouth and take a swollen nipple in between your [pc.lips], grasping her flailing titty between them and lavishing it with your [pc.tongue]. She coos in appreciation, her hips bucking harsher against your");
	if (vag) output(" cunt, angling the diamond stud of her clit to batter against yours, knowing that every successful strike makes you shudder in weakness beneath her.");
	else if (tooBig) output(" shaft, careful to not scratch your delicate skin with the diamond stud in her clit while rubbing out as much pleasure as she can for you both.");
	else output(" cock, rolling and sinking herself deeper onto you, eager to bottom out and have you cum inside her.");
	output("\n\n<i>“That’s right, [pc.name], taste me. Suck my titty,”</i> she says – surprisingly vulgar language, coming from her, but she’s understandably in a vulnerable position. <i>“" + (isLoreleisBitch() ? "Right now, there is nobody in your universe except me. Every part of you,”</i> she hisses, <i>“belongs to me" : "There is nothing in this universe that can pull us apart right now. Every part of us belongs to each other") + ".”</i> She clenches her arms, hugging you tighter into her cleavage, and her hips seem to jack harder against you as she listens to her own words. <i>“" + (isLoreleisBitch() ? "You were</i> made <i>to belong to</i> me.<i>" : "This is what it’s like to be with a</i> real <i>woman.") + "”</i>");
	output("\n\nYou switch nipples – not that it’s easy, being as lost in her cleavage as you are – and start again. Lorelei maintains her usual pace,");
	if (vag) output(" grinding your crotch into the mattress, eager to feel you clench and squiggle in pleasure as you’re brought to that elusive edge.");
	else if (tooBig) output(" grinding your cock against yourself, eager to know what it feels like to straddle your massive log as it unloads gout after gout of cum onto your chest.");
	else output(" pounding your crotch into the mattress, bringing you both ever closer to that elusive edge and excited to feel you fill her up.");
	output(" Her movements are getting less nuanced and more ‘direct’ the longer she goes – she’s getting close, and she knows you are, too.");
	output("\n\nShe pulls back, putting herself into a sitting position, her hips atop of yours. Her face is flushed, and she’s got a coy, sinful little smirk. <i>“I want to see the look " + (isLoreleisBitch() ? "on your face" : "in your eyes") + ",”</i> she pants, her body bounding against you faster and faster, <i>“" + (isLoreleisBitch() ? "when you submit to me. That look of... total... belonging" : "when you cum for me. And I want you to look into mine") + ".”</i>");
	output("\n\nShe won’t have to wait much longer: your hands go from her ass to the bed, clenching onto her quilts, and you scrunch your stomach, your body reacting to your incoming orgasm. Through clenched teeth, you tell Lorelei that you’re close.");
	output("\n\n<i>“I am too,”</i> she pants, her tongue wetly slipping out to lick at her lips. <i>“Cum with me, [pc.name]. " + (!isLoreleisBitch() ? "Show me how much I mean to you" :"You have my permission to cum with your mistress") + ".”</i>");
	output("\n\nJust a few thrusts and grinds later, and you cum, just as " + (isLoreleisBitch() ? "your mistress" : "Lorelei") + " had asked:");

	var cumQ:Number = (!vag ? pc.cumQ() : 0);
	if (vag)
	{
		output("\n\nYour body seizes, a thundering orgasm ripping up through you, starting at your overworked [pc.vagina " + genIdx + "] and straight up to your scalp and back. You bite into your lip and try and stifle shouting out Lorelei’s name. Every contraction your pussy makes against her, you clench into her quilts harder until your knuckles turn white, and you can’t help but start drooling in listless pleasure.");
		output("\n\nAnd Lorelei, for her part, is doing her best to maintain her composure, at least compared to you, but you can feel her shake on top of you, her own pussy splashing and clenching on top of yours; her hips move spastically, trying to score more orgasms out for herself. But, looking at her own expression – a toothy grin, her lips quivering, her eyes wide and laser-focused on you – you get the sense that she’s getting off more on your inability to control yourself beneath her, than from the actual, tactile pleasure.");
	}
	else if (tooBig)
	{
		output("\n\nYou’re confused as to which direction you should pump your hips – Lorelei is on top of you, but your [pc.cockHead " + genIdx + "] is pointed at your chest. When the times comes, it doesn’t matter:");
		if (cumQ < 6000)
		{
			output(" your [pc.cum] shoots up your shaft, bloating your meat from your [pc.base " + genIdx + "] to your tip, and launches onto your chest");
			if(pc.hasBreasts()) output(", right between your [pc.chest]");
			output(". You clench and groan as your cock bathes you with yourself; it soaks you as high up as your chin and dribbles down as far as your stomach.");
			output("\n\nLorelei watches the whole thing with a mix between lust and fascination. She grinds her body against your shaft all the while, urging more of your cum to come forth and splash into your face with every shuddering, orgasmic pump of her own hips on your cock; she can’t help but slide her fingers down her belly, until they frig at her diamond-studded clit, rocking another orgasm through her body.");
		}
		else
		{
			output(" you barely have time to flinch when your [pc.cum] blasts out of your cock like a firehose, dousing and submerging you underneath your own seed, your cum coating your [pc.chest] and painting a highway straight from your bulging [pc.cockHead " + genIdx + "] straight to your face.");
			output("\n\n<i>“My goodness,”</i> Lorelei says in both wonder and total lust, watching you helplessly cum and cum again until your face is matted a flat [pc.cumColor]. She clenches and pumps her own hips along your hot shaft, her own orgasm overtaking her time and again; her fingers dip to her diamond studded clit and ekes out another, and she can’t help but keep going at the sight of you, so helpless and deluged with your own semen.");
		}
	}
	else
	{
		output("\n\nYou thrust upward into her hips as she crashes down");
		if (pc.balls > 0) output(", your [pc.balls] clapping against her soft ass");
		if (pc.hasKnot(genIdx)) output(", and, after a tense push, you tie her to you with your [pc.knot " + genIdx + "], ensuring that every drop makes it safe and sound inside her");
		output(". You feel your cum jet upward, into her warm, tight body, giving her everything she had asked for.");
		if (cumQ < 6000)
		{
			output(" Your [pc.cum] spurts inside of her, coating her walls with your seed, filling her every crease and crevice, just as she wanted. Lorelei hisses in pleasure and nibbles her bottom lip; her hand can’t help but rub at her lower belly, feeling every warm drop seep deeper into her canal.");
			output("\n\nHer pussy clenches down on you, and her body shakes in delight, her own orgasm ripping through her from her crotch to her scalp. You never <i>did</i> ask if she was on any contraceptive...");
		}
		else if (cumQ < 12000)
		{
			output(" You jizz quite a bit, even for you, your body reacting to and spurred forward by the domineering beauty demanding your [pc.cum] for herself. You feel her body clench in time with every powerful blast of semen inside her; you can hear her canal ‘gulp’ your sticky gouts of cum into itself, until she can hold no more, and your cum splashes back against you");
			if (pc.hasKnot(genIdx)) output(" through leaky driblets around your skintight seal");
			output(", coating you from the [pc.belly] down.");
			output("\n\nLorelei moans in pleasure, her hand rubbing at her own stomach, as she feels you spurt more and more into herself; she can’t help but run her fingers over the diamond stud in her clit, eking out orgasm after shaking, eye-crossing orgasm on top of you, while her body greedily sups on your offering. If she isn’t on any contraceptives, it’s easy to imagine that it might take...");
		}
		else
		{
			output(" Unfortunately (or perhaps not), she should be careful what she wishes for: your over-productive body bloats her pussy with your [pc.cum] in just one elongated blast, filling her to her capacity and then some. And that’s only the first: by the second, your jizz starts backwashing against you");
			if (pc.hasKnot(genIdx)) output(" through high-pressured streams around your knot");
			output(", soaking into your [pc.skinFurScales] and overflowing onto her nice bed.");
			output("\n\n<i>“My word,”</i> Lorelei whispers to herself, her fingers frantically frigging at her diamond-studded clit, determined to ride out your fountain of an orgasm with one after another after another of her own; each time, her body clenches and milks you for more, even though her body’s already bloated to capacity with your offering. And a fleeting thought reminds you that you never asked Lorelei if she’s on any contraceptives...");
		}

		lorelei.loadInCunt(pc);
	}

	output("\n\nIt’s a short eternity before your senses return to you; you had crossed your eyes and your vision went black for a moment, overtaken by yourself and your sensations, and it isn’t until you hear Lorelei moan that you remember where you are and what you’re doing. You look up at her, still sitting on your lap and grinding out what must be her fifth orgasm by now; she’s barely sensate enough to feel it, but she wants it all the same.");
	output("\n\n<i>“Haah,”</i> she sighs, enjoying her afterglow and her position above you. She runs her hands through her hair and hefts her breasts in front of you; with her eyes on you, she");
	if (cumQ >= 6000) output(" brings her hand down between you both, scooping a bit of your [pc.cum], and then she");
	output(" brings her finger to her mouth, sucking it clean.");
	output("\n\n<i>“Mmmm,”</i> she moans, <i>“</i>very<i> well done, [pc.name].”</i> Her hair is dishevelled; her face is flushed; and she’s out of breath, but that coy, devious, sly little smirk of hers hasn’t left her face.");
	if (!vag && !tooBig && pc.hasKnot(genIdx)) output(" With a tug, she tests your connection to her; you must have been out longer than you realized, because you’re small enough to dislodge yourself from her.");
	output("\n\nShe flops onto the bed beside you, lying flat on her back. She closes her eyes and smiles to herself.");
	
	if (flags["LORELEI_SEX_COUNTER"] == undefined)
	{
		output("\n\n<i>“Get up, darling, and bring me my wine glass, would you?”</i> she asks. You do as she " + (isLoreleisBitch() ? "commands" : "asks") + ". <i>“There’s nothing quite like a good wine to go with a good time, if you ask me.”</i>");
		output("\n\nHer wine glass is on the bar’s countertop, right where she left it. You retrieve it and give it to her; she downs a mouthful, and then sets the wine on her nightstand. There’s still maybe another mouthful in there.");
	}
	else
	{
		output("\n\n<i>“Be a darling and refill my wine glass, would you?”</i> she asks. You do as she " + (isLoreleisBitch() ? "commands" : "asks") + ". <i>“There’s nothing quite like a good wine to go with a good time, if you ask me.”</i>");
		output("\n\nHer wine glass is on the nightstand, right where she left it. You take it to the bar and refill it there, then bring it back to her; she downs a mouthful, and then sets the wine on her nightstand. There’s still maybe another few mouthfuls in there.");
	}

	output("\n\n<i>“Hmm,”</i> she hums, looking you up and down – tired, freshly fucked, and satisfied yourself. She smiles wryly at you and bites into her bottom lip; she can’t keep her eyes off your crotch, no matter how much she tries. You don’t think...?");
	output("\n\n<i>“It’s so rare to meet a [pc.man] that knows how to show a lady such a fulfilling time,”</i> she says. She crosses her legs and rotates her ankle towards you, enjoying the thought of having a second round. <i>“Do you have it in you to... keep going?”</i>");
	output("\n\nYou hump her body with your eyes yourself: her smooth, flawless, tanned skin, glistening with sweat, flushed with exertion and pleasure...");
	output("\n\nIf you have nowhere else to be, it’d be rude to turn down " + (isLoreleisBitch() ? "your mistress" : "the lady of the base") + ", after all.");

	// end scene (scene: Vanilla); return to the Sex Select menu. Set the PC’s Lust to 30
	pc.orgasm();
	pc.changeLust(30+pc.libido()/20);
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");

	loreleiSexMenu();
}

// Credit to B for the name of this function
public function loreleiShouldntTalkWithHerMouthFull(genIdx:int, vag:Boolean):void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);

	if (isLoreleisBitch())
	{
		output("You know what you want, but knowing the relationship dynamic between you two, you’re a little " + (pc.isAss() ? "hesitant – you, hesitant! –" : "bashful") + " to ask for it. You purse your lips and turn your eyes away, the words cramming up in your mouth but you’re too whipped to let them out.");
		output("\n\n<i>“Speak your mind, [pc.name],”</i> she invites, her hand raising towards you and her finger curling, beckoning you to her. <i>“I am a patient mistress, and I like to consider myself an unselfish lover.”</i>");
		output("\n\nIn that case, with her permission, you ask if she, maybe, wouldn’t mind... going down on you? You know that being the bottom is not usually a position she’s keen on taking.");
		output("\n\n<i>“Oh, darling,”</i> she says, her one visible eyebrow arching in sympathy. <i>“First of all, I’d</i> love <i>to. Like I said, I consider myself an unselfish lover. Good relationships, including the one you and I share, are about giving as much as they’re taking.”</i> She pats the bed, inviting you next to her. <i>“Sit, and I’ll take care of the rest.”</i>");
	}
	else
	{
		output("You put your hands on your [pc.hips] and strike a pose, specifically flaunting your [pc.crotch] and trying to draw Lorelei’s eyes towards your lower body. When it works, you ask her if she’s willing to show you a little ‘personal service.’ Good relationships are about giving as much as they’re about taking, after all!");
		output("\n\nLuckily for you, Lorelei doesn’t need much convincing. As soon as you make the suggestion, her lips curl into that smirk of hers, and her tongue slips out to wet her");
		//output(" ruby-red");
		output(" rosy-brown");
		output(" lips, moistening them for the job they’re about to take. <i>“Sit on the bed,”</i> she demands.");
	}

	output("\n\nYou do as she asks, and take a spot on the bed. As you move, Lorelei drops onto her knees, sashaying herself in front of you; she doesn’t wait for you to " + (pc.hasLegs() ? "spread your [pc.legs]" : "get too comfortable") + " before, with " + (isLoreleisBitch() ? "authority" : "confidence") + ", she settles herself in, her body heat radiating over your [pc.lowerBody] and warming you and your equipment.");
	if (isLoreleisBitch()) output("\n\n<i>“And second of all,”</i> she says, her eyes half-lidded and her predatory smirk growing by the inch on her face. Her tongue snakes out, languidly licking and wetting her chops. <i>“You’re about to find out that being dominant can take</i> many <i>positions.”</i>");
	output("\n\nLorelei has her hands on you before you have the chance to settle in place. She sits up straight, her hands mapping your body for themselves: they touch your [pc.leg], up to your groin, and they wander over your stomach and your [pc.chest]. Her motions are imperious and firm, like they’re handling tools, but they’re also gentle and specific, knowing that you’re a person, and that you’re feeling everything. That smile of hers never leaves her face.");
	output("\n\nShe knows that you didn’t ask for a massage, though. Once she’s satisfied with herself and how she’s handled your body – and, once she sees that you’re " + pc.cockAndVagina("as rigid", "as wet", " and") + " as you’re going to get, she leans her body forward, arcing it at her waist, her eyes locked onto yours as she lowers herself towards you.");
	if (!vag && pc.cLength(genIdx) >= 10) output("\n\nShe knows right off the bat that she’s not going to be pleasing your entire monster all at once – but she’s more than happy to wrap her firm and full D-cup breasts around you, nestling you into her cleavage; your [pc.cockHead " + genIdx + "] reaches up through the top of her breasts, " + (pc.cLength(genIdx) < 15 ? "batting against her lips – the perfect length for a real show of skill on her part." : "reaching up well past her mouth – you’re not getting much of a blowjob this time, but that’s hardly going to stop her."));
	output("\n\nShe doesn’t get started right away. Going down on your partner is as much the spectacle as it is the action, and she knows it. Instead, she buries her face in against your crotch – deliberately missing your " + (vag ? "pussy" : "cock") + " with her mouth, and resting her cheek against your [pc.thigh] – and takes a long, slow drag, rubbing her cheek against your leg as she does.");
	output("\n\nShe exhales with a moan once her lungs hit their capacity.");
	if (pc.hasStatusEffect("Sweaty") || pc.hasStatusEffect("Mare Musk") || pc.hasStatusEffect("Cum Soaked") ||pc.hasStatusEffect("Pussy Drenched"))
		output(" <i>“Musky,”</i> she says – you’re not positive if it’s a compliment. <i>“" + (isLoreleisBitch() ? "On the one hand, it won’t do to have my belongings smell like a butcher shop, [pc.name].”</i> Her words are scathing, but her tone is somewhat playful. <i>“On the other... I won’t deny that there’s something of an appeal to you and yours. I’ll make an exception this time." : "Ordinarily, it’s one of the less attractive things those brutes make me put up with on this rock... but, and maybe it’s just you, darling, I can’t help but admit that there’s some... animalistic, raw appeal to it.") + "”</i>");
	else output(" <i>“Fresh and clean,”</i> she says, smiling up at you. <i>“" + (isLoreleisBitch() ? "I wouldn’t have my darling present [pc.him]self to me any other way." : "It’s so wonderful to meet someone on this rock that’s willing to keep themselves fresh. You’d be surprised how much of a motivator it is.") + "”</i>");
	output("\n\nWith her assessment complete, she rests her left hand against your [pc.thigh], and her right " + (pc.balls < 0 ? "graces its palm across your [pc.sack]" : "against your [pc.belly]") + ", and she gives your " + (vag ? "[pc.vagina " + genIdx + "] a kiss, her lips meshing right between your vulva" : "[pc.cock " + genIdx + "] a kiss, right on " + (pc.cLength(genIdx) >= 10 && pc.cLength(genIdx) < 15 ? "the tip" : "your shaft")) + ". Her kiss lingers; then, she opens her mouth wide, showing you her long, pink tongue, and presses it right on the spot that she kissed. Moaning, she draws it against your flesh. She doesn’t apply any force: she’s only tasting you for now.");
	output("\n\nYou squirm in your seat, watching Lorelei work her magic on you, and she’s watching you watch her; her every little movement and flick of her tongue is matched by a steady, even intense, stare; your every little twitch doesn’t escape her. She’s learning what gets a reaction from you, and she’s working it to her advantage: when you moan, she knows to try that again later, but it’s when you’re <i>silent</i> that she dedicates what she just did to memory.");
	output("\n\nYour genitals are peppered with light, airy kisses, and her hands continue to errantly massage you in different parts, from your [pc.thighs] to your upper stomach. She moans when you don’t, and repeats her actions again and again when you do. <i>“Sing for me,”</i> she whispers to you in between the odd lick.");
	output("\n\nAfter having gathered enough information on you and your sensitive spots, she opens her mouth and more diligently begins to work on you,");

	if (vag) output(" pressing her lips against your [pc.vagina " + genIdx + "] and lunging her tongue into you. She doesn’t dig in very far – you know she’s got more tongue in that mouth of hers");
	else if (pc.cLength(genIdx) >= 10) output(" thrusting your [pc.cock " + genIdx + "] in between the valley of her breasts and sliding a comfortable amount of dick " + (pc.cLength(genIdx) < 15 ? "against" : "into") + " her mouth. She doesn’t go too " + (pc.cLength(genIdx) < 15 ? "deep on you – despite your size, you know she can take more" : "far down on you – you know she’s capable of going further"));
	else output(" taking your [pc.cock " + genIdx + "] into her mouth and sliding down your shaft" + (pc.balls > 0 ? " while her hand begins to juggle and tickle your [pc.balls] between her expert fingers." : ".") + " She doesn’t get very far – shallower than you know she’s capable of");
	output(" – but it’s all part of the play. Her eyes remain locked onto yours the whole time.");
	output("\n\nHer movements are very slow and measured.");

	if (vag) output("\n\nBefore every thrust of her tongue, she takes a deep breath through her nose. You can feel the wind rush over your [pc.clit]. Then, she dives her tongue forward, splitting into you, twisting it slowly to bump against your sensitive spots. When she withdraws, she moans like she’s enjoying some candy, and she flutters her eyes at you.");
	else
	{
		output("\n\nBefore every " + (pc.cLength(genIdx) >= 10 && pc.cLength(genIdx) < 15 ? "lick" : "suck") + ", she takes a deep breath through her nose, then slowly slides down on you, lashing her tongue at the sensitive spots of your cock as she goes. She moans and flutters her eyes on the way back up, leaving wet spittles on your shaft as she goes.");
		if (pc.cLength(genIdx) >= 10) output(" You’re not fucking her properly" + (pc.cLength(genIdx) < 15 ? ", and you aren’t fucking her mouth as hard as you (and, maybe, she) would like," : ",") + " but the point of a titfuck is less the ‘traditional’ sensations and more the spectacle. Your massive cock is lodged warmly in between her own massive breasts, and she’s holding her girls in place so that you can stay nice and snug against her. The moaning sucks and kisses she’s giving your " + (pc.cLength(genIdx) < 15 ? " [pc.cockHead " + genIdx + "]" : "shaft") + " is a big, juicy cherry on top.");
	}
	output("\n\nLorelei pulls away from you, and when she does, a thin line of her saliva connects you and your equipment to her lips, which snaps when she licks them. <i>“You know,”</i> she starts, nuzzling her nose lightly against your " + (vag ? "pussy" : "cock") + ", <i>“going down on a partner is much like a performance. A good show can make an audience feel anything.”</i> She smiles and playfully licks you again, and you shudder at her touch. <i>“I wonder, though. Is it more fun to be the audience... or the performer?”</i>");
	if (vag) output("\n\nShe replaces her mouth with her hand for the moment, thrusting one finger, and then another, into your body, slowly and gently. Her palm angles itself to graze against your vulva, tickling you.");
	else if (pc.cLength(genIdx)) output("\n\nShe gives her mouth a rest and lets your head lay against her cheek as she slowly pumps her breasts against you, thrusting you into the valley of her cleavage over and over.");
	else output("\n\nShe replaces her mouth with her hand for the moment, jerking you slowly and sensually, her fingers lightly gripping your shaft and deftly tickling at your skin.");
	output(" <i>“Everything I do is like a master painter’s stroke of their brush against a canvas, [pc.name], or like a musician’s pen against a music sheet. You are my blank slate, and with you, I can practice my craft. We are making</i> art <i>together, darling.”</i>");
	output("\n\nHer motions increase in speed, but only slightly. It’s enough to get you to gasp and writhe. <i>“And you, yes! Your every breath is like a singer reaching that perfect pitch; your every quiver is a dancer performing a flawless pirouette. With everything you do, I am learning more of you and how you perform.”</i> She kisses your genitals once more. <i>“I hope you’re learning from me as well. It wouldn’t do for you to underperform for someone else in the future.");
	if (isLoreleisBitch()) output(" Anyone willing to say they belong with me must act the part.");
	output("”</i>");
	output("\n\nTo demonstrate, she returns to her task, stuffing her mouth full of you and your taste, your body, and your actions. She isn’t " + (pc.cLength(genIdx) >= 10 && pc.cLength(genIdx) < 15 ? "licking" : "sucking") + " you like some whore: she’s still as slow as ever, but now, she’s deliberately attacking the spots she learned you’re most vulnerable at, kissing them and prodding them with her tongue. She applies pressure when and where as necessary and only lingers long enough that, once the pleasure begins to peter out, she goes somewhere else and starts the pattern again.");
	output("\n\nDespite her lax speed, you’re brought to the cusp of an orgasm, purely through her skillful performance as a lover. Your fingers curl and your knuckles turn white, nearly ripping into her bed covers. Your breath catches, and your stomach clenches –");
	output("\n\nAnd she stops, returning to her more casual, exploratory technique from before. The familiar boiling in your loins, of an orgasm ready to crash through you and into her, rumbles inside you, threatening to cascade over that edge, but she doesn’t allow it, nor does she allow it to subside with her ever-busy mouth.");
	output("\n\nYou can’t help but whimper underneath her masterful work. You understand what she means by oral sex being a performance, because she is playing you like a " + (silly && rand(10) ? "damn fiddle" : (vag ? "harmonica" : "flute")) + ". And she knows it: as soon as you make the noises you’re making now, Lorelei laughs through her mouth full of meat.");
	output("\n\nShe pulls back, " + (vag ? "lapping at your slit like a lazy dog. Your body’s been shaking since she edged you, and she can feel every vibration straight through you and onto her tongue" : "suckling on your tip. You’ve been leaking a generous amount of precum since she edged you, and she’s happy to let some of it squirt right onto her tongue") + ". You’re probably giving off so many signals that she isn’t bothering to find any additional erogenous zones. Besides, she’s looking pretty smug with the ones she knows about already.");
	output("\n\n<i>“" + (isLoreleisBitch() ? "Beg me,”</i> she demands" : "Would you like to finish?”</i> she asks") + ", her eyes on you. You try and keep your focus on her – and, you realize, she’s enjoying this almost as much as you are. Her hips are swaying automatically, back and forth, impatiently humping nothing. She’s ready for it to be her turn, by the looks of it.");
	if (isLoreleisBitch()) output("\n\nYou reply emphatically that, yes, you would like to cum. " + (pc.isAss() ? "You tell her whatever you think she wants to hear – that she’s a great teacher, and that your lessons have been learnt, whatever – but, you bark, you’re ready for the finale to this performance and you want to <i>cum in that mouth of hers.</i>" : "She’s a wonderful teacher, and you’ve learned so much about pleasuring your partner and how to make it as good for them as she’s making it good for you. All that’s left to teach you is how to make them <i>cum their brains out.</i>"));
	else output("\n\nYou beg Lorelei – you’d grovel if you weren’t sitting on her bed – to end the lesson and let you finish. She has all the grace of a performer and all the mastery of an artist, and you’ve learned so much just from watching and feeling her perform. You consider it a privilege to be in her company, much less to have her perform her skills on you. You plead and whine: end the lesson!");
	output("\n\nHeeding your wish, she starts again, but with an earnestness – a borderline <i>thirst</i> - that she didn’t have before. She’s pulling out the same tricks on the same spots, but faster, more frequently, and with more pressure. She wants you to cum, and she wants to taste you.");
	output("\n\nYou, like a proper partner (as she has taught you), do not disappoint her: with only a few more helpless thrusts of your " + (vag ? "[pc.vagina " + genIdx + "] against" : "[pc.cock " + genIdx + "] into") + " her mouth, your body shakes, then tenses, and you’re brought over that edge, releasing yourself into her mouth. Lorelei suddenly goes still, her tongue " + (vag ? "speared into your body, paralyzed inside your squeezing tunnel and curled to funnel your juices into her mouth." : "flat against your [pc.cockHead " + genIdx + "], readying to catch your every drop."));

	var cumQ:Number = (!vag ? pc.cumQ() : 0);
	output("\n\nYour breath catches in your throat, and you cum,");
	if (vag) output(" your body clenching down on her tongue, just as she wanted. You can feel your [pc.girlCum] " + (pc.isSquirter() ? "squirt into" : "drench") + " her mouth, coating her tongue and her teeth, and Lorelei thrashes her tongue inside you, eager for more. Your every sound and your every unintentional buck or squirm against her body is art to her eyes and music to her ears. You can’t help but squirm and writhe as she masterfully coaxes one orgasm out of you after another, soaking her face from her nose to her chin in your juices, and she demands more and more from you, until you damn near pass out and collapse from exhaustion.");
	else if (pc.cLength(genIdx) < 15)
	{
		output(" your [pc.cock " + genIdx + "] tightening inside her");
		if (pc.cLength(genIdx) >= 10) output(", and your shaft bloats inside her cleavage");
		output(", your [pc.cum] jetting up your cock and into her mouth.");
		if (cumQ < 3000) output(" Lorelei patiently milks you for your every drop, her tongue curled just beneath the crown of your cock’s head and slithering down your shaft to help coax out every drop she can. Her eyes are lidded and on yours the entire time; she doesn’t attempt to pull away, and you can see her cheeks hollow occasionally as she takes in your gouts of creamy seed. When she’s confident you’ve finished, she gulps loudly, then opens her mouth to you, showing you that she’s swallowed it all.");
		else if (cumQ < 6000) output(" Lorelei gurgles once in surprise, her eyes widening and her pupils dilating for just a moment, before she catches herself. You can feel her tongue coiling around your shaft, just beneath the crown of your head, instinctually ready to milk you for your seed, but considering the mouthful-after-mouthful you’re pumping into her – cheeks bloating, then hollowing with a loud gulp – it’s clearly unnecessary. Her eyes remain steadfastly on yours as she expertly handles the full-course meal you’re pumping down her throat, and she even moans, clearly enjoying the treatment.");
		else output(" At first, Lorelei doesn’t move, confident that she can handle your output, but she clearly underestimated you: just one gout in the mouth, and she’s forced to withdraw, coughing through a surprised throat-full of your [pc.cumFlavor] cum. Her eyes widen, almost in wonderment, as you continue to cum and cum, even when she’s not doing anything more to stimulate you or coax more out: your [pc.cum] fountains from you, straight up, and then straight back down, all across her face" + (pc.cLength(genIdx) >= 10 ? ", her breasts," : ",") + " her hands, and all over your body. She mouths the word <i>wow</i> to herself, unable to take her eyes off the spectacle of a performance in front of her – she wanted a show, and she got one.");
	}
	else
	{
		output(" your [pc.cock " + genIdx + "] thickening against her tight, warm breasts as your jizz bloats your shaft on its way up to your spout.");
		if (cumQ < 3000) output(" Lorelei watches with amused satisfaction as your [pc.cumColor] jizz spurts in hardly-restrained gouts, falling back down and sliding down your shaft towards her face and her tight boobs. She lets it pool across her fingers and seep into the valley of her chest – even going so far as to use it as lube to let you fuck her chest some more, squirting out more delicious cum for her. When one particular rivulet passes right in front of her, she leans forward, her eyes on you, and licks it right off your shaft.");
		else output(" Lorelei watches with some surprise as your [pc.cumColor] jizz erupts from you, almost like a literal waterspout, and it rains back down onto you and your [pc.chest], and onto her and hers. Your shaft bloats and expands inside her chest in an effort to mitigate the water pressure, fighting against Lorelei’s hands to keep the girls together. Your [pc.cum] gets everywhere: her hands disappear beneath the thick veneer of your cum, and it pools in the valley of her chest, soaking her and lubing her tits for you to better thrust between them. Lorelei is fixated on it all; you can see her mouth the word <i>wow</i> to herself as you go.");
	}

	output("\n\nLorelei takes a moment to collect herself, " + (vag || cumQ >= 6000 ? "wiping away your excess from her mouth with the back of her hand" : "giving your tip once last kiss, her lips pulling away from you with an audible ‘pop’") + ", before settling in a more natural sitting position, her butt against her ankles and her knees on the floor. When your eyes meet, her tongue snakes from her lips and licks at them, and she moans.");
	output("\n\n<i>“I see you’re no stranger to ‘performance art’ either, [pc.name],”</i> she giggles. <i>“It was quite the sexy show, from where I’m sitting.”</i>");
	output("\n\nYou’re not sure whether to thank her for going down on you, or to thank her for the compliment, or to say nothing.");

	if (flags["LORELEI_SEX_COUNTER"] == undefined)
	{
		output("\n\nLorelei takes advantage of your silence, and lifts herself onto the bed, taking a seat next to you. <i>“" + (isLoreleisBitch() ? "You can thank me by getting me my wine, darling,”</i> she demands – not with a demanding tone, but you both know that she prefers to reward obedience." : "If you have any strength left in you, could you be a darling and get me my wine?”</i> she asks you pleasantly, like she were commenting on the weather."));
		output("\n\n" + (isLoreleisBitch() ? "You obey" : "You do as she asks") + ", and stand from the bed, still wobbly from the incredible orgasm Lorelei had just bestowed to you. Her wine glass is exactly where she last left it, and you didn’t have to go far; you return it to her, and she takes a heady mouthful, refreshing herself. She crosses her naked, smooth legs in front of you, reclining back into the bed casually.");
	}
	else
	{
		output("\n\nLorelei takes advantage of your silence, and lifts herself onto the bed, taking a seat next to you. <i>“" + (isLoreleisBitch() ? "You can thank me by getting me my wine, darling,”</i> she demands – not with a demanding tone, but you both know that she prefers to reward obedience." : "If you have any strength left in you, could you be a darling and get me my wine?”</i> she asks you pleasantly, like she were commenting on the weather."));
		output("\n\n" + (isLoreleisBitch() ? "You obey" : "You do as she asks") + ", and stand from the bed, still wobbly from the incredible orgasm Lorelei had just bestowed to you. Her wine glass is exactly where she last left it, and you didn’t have to go far; you take it from the nightstand to the bar, refill it, and return it to her, and she takes a heady mouthful, refreshing herself. She crosses her naked, smooth legs in front of you, reclining back into the bed casually.");
	}

	output("\n\nLorelei’s eyes drink you in, from your [pc.feet] to your scalp. You notice that she lingers at your crotch, and a wry smirk slowly spreads across her face – she can’t already be thinking about going again, can she?");
	output("\n\n<i>“And for my final lesson, darling,”</i> she says, leaning over to put down her wine glass on the nightstand, <i>“there is nothing less improper than a lover to leave their partner unsatisfied. All relationships are about giving as much as they are taking.”</i>");
	output("\n\nShe uncrosses her legs and spreads them before you, showing you her exposed pussy – beet-red and dripping her own excited, horny juices down her thigh. She’s in some desperate need of attention, herself.");
	output("\n\nLorelei beckons her finger towards you. <i>“" + (isLoreleisBitch() ? "It is your turn to satisfy your mistress" : "Be a good lover, [pc.name]") + ",”</i> she says.");
	output("\n\nWell, you certainly wouldn’t want Lorelei to think her lessons have gone to waste....");
 
	processTime(15+rand(11));
	pc.lust(20);
	// end scene (scene: Don’t Talk With Your Mouth Full); return to the Sex Select menu. Set the PC’s Lust to 30
	pc.orgasm();
	pc.lust(50+pc.libido()/20);
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");
	if (!vag && cumQ >= (pc.cLength(genIdx) < 15 ? 6000 : 3000)) pc.applyCumSoaked();

	loreleiSexMenu();
}

public function loreleiShowsYouHerMostPreciousTreasureBox():void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);
	
	output("Seeing Lorelei sitting there, on the edge of the bed, her legs spread and waiting for your word – her flawless, dusky complexion; the way her snowy-white hair swishes over her one eye; that confident, alluring, ‘come hither’ look of hers – it inspires something within you. You’re not certain where it comes from, but something about it says that what you want to suggest to her is <i>right.</i>");
	output("\n\nYou take your place between her spread knees, " + (pc.hasKnees() ? "kneeling yourself" : "crouching down") + " between them and looking up her flat belly and generous bust, into her one brown eye. You allow your hands to explore her silky-smooth legs; she lifts her left, stretching it straight, allowing you to touch everything on it, as high as her thigh, just beneath the swell of her ass, down to her ankle.");

	if (isLoreleisBitch())
	{
		output("\n\nLorelei, perhaps getting a sense of your desires – or, perhaps, having been in her position before and working from experience – understands your wordless desires and requests. She smiles down at you, like a hunter congratulating themselves for a clean kill, and leans back, giving you more casual access to her body. Her un-stretched leg lifts and bends possessively around your back, the sole of her foot rubbing delicately against your [pc.skinFurScales].");
		output("\n\n<i>“I think you may be a proper poet, [pc.name],”</i> she says, shivering slightly as your hand makes another circuit up her leg, from her ankle to her thigh and back again. <i>“You know how to tell a woman so much without saying a word.”</i> She tilts her head to one side and moans. <i>“You have my permission to touch my body further. As much as you like. Get yourself acquainted with every facet of your mistress, darling.”</i>");
		output("\n\nWith her permission granted to you, you add your left hand to massaging her leg, alternating them so that they’re both rubbing and feeling different parts of her at once. Every time your left hand scours forward, your hands softly coursing over her skin up to the inside of her thigh, you feel the heat of her sex against your knuckle. Your mistress has expectations of you; you mustn’t disappoint her.");
	}
	else
	{
		output("\n\nYou tell Lorelei that she’s beautiful – enrapturing, even. You’d like to display just how ‘enraptured’ with her you are.");
		output("\n\nShe smiles at the suggestion and leans back, giving you more casual access to her body. Her stretched leg does not move, but her other lifts and curls around your body, the sole of her foot rubbing delicately against your back. <i>“You certainly know what to say to a woman, [pc.name],”</i> she says, leaning onto both her elbows. <i>“And I’m certainly not about to tell you that you may not. You have my permission to explore my body as you like.”</i>");
		output("\n\nWith her permission, you feel along her stretched leg once again, this time with both hands, alternating from her ankle to her upper thigh, gracing your fingers along the inside of leg and feeling the heat of her sex against your knuckle. You have time, but there’s no time like the present to get started.");
	}
	processTime(2);
	pc.changeLust(20);
	addButton(0, "Next", loreleisGreatestTreasureRevealed, false);
}

public function loreleisGreatestTreasureRevealed(apologizing:Boolean):void
{
	clearMenu();
	clearOutput();
	loreleiHeader(!apologizing);

	output("You start at her ankle, giving it a kiss; a lingering one, your [pc.lipsChaste] smoothly gliding over her waxed leg. You part from her skin only enough to shift your body a quarter-inch and kiss again. Boldly, you snake your [pc.tongue] out, only slightly, and press its tip against her skin.");
	output("\n\nShe doesn’t seem to mind your forwardness, and says nothing. Every few kisses, and every few inches, she moans, only slightly, knowing that you’re listening and rewarding you for a good job by letting you know that you’re pleasuring her.");
	if (apologizing) output(" You hear the ‘clink’ of her wine glass occasionally hit the countertop, and whenever she moans, you can tell that it’s usually through a mouthful of wine. She might as well treat herself too, you suppose.");
	else output(" Her eyes normally stay on yours, her lips pursed at the sight of you working so diligently up her body, but occasionally, she distracts herself with the glitter of the gems in the walls.");
	output("\n\nYou keep your right hand against her stretched leg, gently drawing your fingernails along her skin, feeling how smooth it is, while your left becomes more adventurous, reaching");
	if (apologizing) output(" beneath her dress and");
	output(" up to her stomach, palming at her belly before you hook your arm underneath her other leg. You’re surrounded on both sides by her tanned flesh, warmly pressing against your cheeks; you switch kissing legs, starting up her right leg, getting closer to her wet treasure. She quivers under your touch.");
	output("\n\n<i>“I like your pace,”</i> she says, and you feel her hand resting against your head");
	if (apologizing) output(", through her dress");
	if (pc.hasHair()) output(" and playing with your [pc.hair]");
	output(". <i>“Slow enough to");
	if (isLoreleisBitch()) output(" savor every moment, but fast enough to show your mistress some confidence. You’re a natural pleaser, [pc.name].”</i> She leans back further, " + (apologizing ? "reclining into the counter a bit for stability." : "her wry, half-lidded expression never leaving yours.") + " <i>“Keep going.”</i>");
	else output(" make every second count for us both, but fast enough to make me giddy for what comes next. You’re a natural worshipper, [pc.name].”</i> She leans back further, her wry, half-lidded expression never leaving yours. <i>“Keep going.”</i>");
	output("\n\nLorelei is a slender woman with an hourglass figure: there is so much for you to explore, and yet every inch that your fingers memorize is all too fleeting a moment, one that you can’t make last forever. Your kisses reach her inner thigh, and you can start to feel her heat radiate against your cheek; your hands, trying to find new worlds to explore,");
	if (apologizing) output(" but the unique fabric of her dress makes exploring her body somewhat unwieldy. You can worm your arms around to her lower back and hug her closer to you, but that’s about it – and really, what more could you want?");
	else output(" lift higher, to her ribs and around her back. You heft the swell of her breasts with the backs of your hands as you chart new territory; just another few inches, and you’ll be able to cup them properly.");
	output("\n\nOne, two, three, four more kisses, and your right cheek is touching Lorelei’s pussy, the most valuable jewel she has. You celebrate your arrival by, on the fifth kiss, sliding your [pc.tongue] out to its full length and drawing a long, wet lick against her thigh, where her leg meets her pelvis, torturously close to her pussy. Lorelei shivers and moans, her hand clenching hard on your " + (pc.hasHair() ? "[pc.hair]" : "head") + ", and her legs shake with effort to not wrap around your shoulders and pin you to her. You even hear her whisper your name!");
	output("\n\n<i>“You little tease,”</i> she playfully chastises you, batting you on the head. <i>“" + (isLoreleisBitch() ? "Now end the games and give us both what we want" : "But I won’t deny that you certainly know what you’re doing") + ".”</i>");
	output("\n\nWith her " + (isLoreleisBitch() ? "instruction clear" : "blessing") + ", you end the charade and close the distance, meshing your [pc.lips] against her own. Her diamond-studded clit – her <i>second</i>-most valuable jewel – weighs against your upper lip, especially when you yawn open slightly and introduce your [pc.tongue] into her body, worming and wriggling past her vulva to taste and explore her velvety depths within.");
	output("\n\nLorelei inhales sharply through her nose");
	if (apologizing) output(", and you hear a loud ‘clink’ as she slams down her now-empty wine glass");
	output(". She moans through pursed lips and she can’t help but buck her hips against your face, especially when your lapping tongue reaches some new, hidden fold or surface inside her and teasing another forbidden part of her.");
	output("\n\nHer legs clench, her thighs hardening around your head");
	if (pcIsPainslut()) output(", and she finally relinquishes control of herself, wrapping her legs tightly and securely around your head and <i>squeezing,</i> surrounding you on all sides with her smooth, flawless body. It hurts, but that’s what makes it so wonderful: that you’re giving her so much pleasure that she can’t <i>help</i> but squeeze you like an orange makes it all the more better for you.");
	else output(", and eventually, she crosses her legs behind your head, locking you in place to her pussy. You’re not going anywhere until she’s done with you, and there’s little telling when that’ll be.");
	output("\n\nYou think to touch yourself");
	if (pc.hasGenitals()) output(" – your " + pc.cockAndVagina("[pc.cock] is standing rigid and at attention, waiting patiently for your tongue to get tired and for it to have its turn", "[pc.vagina] is clenching and dripping, struggling to dam up your [pc.girlCum] and eager to get some attention of its own", ", while your "));
	output(" – but your focus is wholly and thoroughly focused on Lorelei, especially with her legs clamping on your head like they are.");
	output("\n\n<i>“Touch me,”</i> she commands");
	if (apologizing) output(", her right hand going to her boob and squeezing it, playing with it right in front of you");
	output(". You do as you’re told and");
	if (apologizing) output(" wrap both your hands around her thighs, clamping them onto her ass and pulling, pushing, and squeezing her cheeks, working them off-rhythm with your tongue.");
	else output(" reach upward, grasping onto her other boob, squeezing and pulling it and palming at her nipple, working your hand and tongue to an off-rhythm beat.");
	output(" You lean upward slightly and take her studded clit into your mouth, sucking on it and flicking it with the tip of your tongue, before releasing and diving back in, sucking down her pussy juice voraciously.");
	output("\n\nLorelei huffs through her nose again, her hips humping into your face, eager to get as much pleasure out of you as she can.");
	if (pcIsPainslut()) output(" You’re locked so tightly to her that you can’t move your head at all, but her body eager meeting your mouth is all the confirmation of a good job you need.");
	else output(" You twist your head, spiralling your tongue into her box, searching for that ever-elusive G-spot. Maybe it’s in a little deeper....");
	output("\n\n<i>“Fffff,”</i> she starts, catching herself before she said anything <i>unladylike</i>. <i>“Yes, [pc.name],”</i> she continues.");
	if (isLoreleisBitch()) output(" <i>“Keep it u-uuuup, [pc.name]. With skills like yours, I’m tempted to keep you right where you are....”</i> She bucks her hips into you, twisting her hips from side to side to try and nestle you as deep against her as she can. <i>“How’s that sound? Every – oooomph,</i> every <i>day, we put you right back here, and get you started all over again....”</i>");
	else output(" <i>“You’re so</i> talented, <i>[pc.name]. It’s been... mmmmm, decades since I’ve met a tongue like yours.”</i> She bucks her hips into you, twisting her hips from side to side to try and nestle you as deep against her as she can. <i>“Keep</i> this <i>up, and I may just have to return the favor. I wouldn’t want to s-seeeeeeeem selfish, after all.”</i>");
	output("\n\nYou like the sound of that. Spurred, you crane your neck and try to bring Lorelei to a shuddering climax into your mouth, cramming as much tongue into her body as you can, tasting everything she is and feeling her every ridge and pulse; her heart-rate is sky high in sexual excitement, and you can feel every beat of her heart straight through her vagina and onto your tongue. And when you unwind, retract, twist, and replace, her pulse gets just a little stronger.");
	output("\n\n<i>“Nearly there,”</i> she whispers, half to you and half to herself. You finish her by opening your mouth wider, covering as much surface area as you can, and sliding your upper lip over her clit. It thrums with her pulse, her studded diamond beating against your lip– ");
	output("\n\nLorelei suddenly clenches and makes a high-pitched squeak. A gout of her sexual fluid quenches your thirst for her, coating your mouth, from your [pc.tongue] to the inside of your cheeks, with her flavor. And she’s not done: with what sounds like a hiccup, she adds to her mouthful of lady-jizz with another, equally-generous blast.");
	if (isLoreleisBitch()) output("\n\n<i>“Taste me,”</i> she demands, her hips weakly bucking into you as she seeks a third, and then a fourth, orgasm from your overworked mouth. <i>“Get used to it....”</i>");
	output("\n\nShe groans wordlessly, not making any effort to say anything as she comes down from her elongated climax. Her body slowly starts to relax, but she’s jolted with a third, and then a fourth, smaller orgasm, as she winds down from the excitement.");
	output("\n\nFinally, she relents, untangling her legs from around your head and " + (apologizing ? "letting you crawl back out from underneath the foils of her dress" : "disengaging from you") + ". You pull away, still feeling her heat and her tight grip on either side of your head " + (pcIsPainslut() ? ", and you idly wish she’d put you right back in." : "."));

	IncrementFlag("LORELEI_SEXED");

	// Dress:
	// Luckily, this scene can’t be viewed without the collar, so that’s nice
	if (apologizing)
	{
		output("\n\nYou, stand, wobbly, after that whole ordeal, her taste still fresh in your mouth; Lorelei, though, looks none the worse for wear. Her hair is slightly dishevelled, but her dress maintains it’s ever-perfect flow and consistency throughout, as if you hadn’t just spent the last few minutes underneath it and servicing her orally.");
		output("\n\nShe moans, her eyes closed and her head tilted back, relaxing her body after such an ordeal. When she opens them again, she focuses on you, and smiles. <i>“There,”</i> she says. <i>“Now all is forgiven.”</i> She motions to your stool. <i>“Sit, and pour me another one.”</i>");
		output("\n\nYou’re still a bit shaken, but you do as she asks, refilling her wine glass and sitting on your own stool.");
		output("\n\n<i>“Now, where were we?”</i> she asks innocently.");

		// return to the Main Menu.
		loreleiMenu();
	}
	// Naked:
	else if (isLoreleisBitch())
	{
		output("\n\nLorelei runs her hands through her hair, revelling in herself and the total contentment she feels. One of her hands comes to rest on top of her belly, her fingers inching their way towards her clit, teasing to you both the idea of a round two, and so immediately after round one. You busy yourself by returning to your original business: kissing her legs.");
		output("\n\n<i>“Drink it in, darling,”</i> she says to you. Her body writhes sensually, from one side to the other, like a snake trying to get your attention. You get the impression she’s referring to her body, and not to the deluge of pussy juice still dribbling down your chin. <i>“Mmmm,</i> this <i>is the body you belong to. Admit it; there are worse lots in life.”</i>");
		output("\n\nYou agree with her. You can’t take your eyes away from her sensual curves; the way the light of the room complements her tanned skin; how her wriggling and moving is messing up the bedsheets....");
		output("\n\nLorelei moans again, her fingers massaging at the pussy you’ve just serviced, while she nibbles onto her own lower lip. <i>“No woman in this universe wouldn’t admit that you’ve got talent, [pc.name],”</i> she admits, her eyes flitting towards your own [pc.crotch] and how you’ve neglected yourself for her, <i>“and it’s got me ready for a second round....”</i>");
		output("\n\nLorelei wants a second round already? Well... you wouldn’t want to disappoint your mistress.");

		// if Lorelei is naked, return to the Sex Select menu;
		loreleiSexMenu();
	}
	else
	{
		output("\n\nLorelei looks at you with half-lidded eyes, her hair dishevelled just enough that you can barely see the glint of her other eye hidden beneath her hair. She smiles at you, a perfectly, totally-contented smile, and she crooks her finger towards you, beckoning you to her.");
		output("\n\nYou crawl your way up her sweaty, still-shaking body, and as soon as you’re close enough, she grips your head with her hands and locks you into a wet, aggressive kiss; she hums in delight as she tastes herself on you, her tongue exploring your teeth and your cheeks for every drop of herself. You’re torn between letting her do what she wants, and kissing her back – you settle for something half-and-half.");
		output("\n\nShe pulls away from you after what seems like a blissful eternity. <i>“Goodness, darling,”</i> she pants, <i>“I can’t remember the last time I had a lover go down on me so enthusiastically.”</i> She kisses you again, her tongue surging into your mouth once more, then pulls back. <i>“And so... professionally.”</i>");
		output("\n\nWith a forceful, energized shove, she pushes you off her, onto your [pc.feet]. <i>“I meant what I said, [pc.name],”</i> she says as she sits up, her eyes on you with that viper-like intensity you’ve come to know from her. She eyes your [pc.crotch], noticing how neglected you’ve made yourself for her benefit. <i>“I would be a poor lover if I didn’t return the favor.”</i> Her tongue snakes out from between her lips and gives them a long, languid lick. <i>“You just say the word.”</i>");
		output("\n\nSeems like you aren’t done yet, if you don’t want to be....");

		// if Lorelei is naked, return to the Sex Select menu;
		loreleiSexMenu();
	}
	processTime(20+rand(16));
	// Increase PC’s Lust by 30
	pc.changeLust(25+pc.libido()/10);
	// end scene (scene: Worship); 
}

public function loreleiTheDancingQueen(genIdx:int, vag:Boolean):void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);
	processTime(20+rand(16));

	if (isLoreleisBitch())
	{
		output("You ask Lorelei for permission to sit, and she grants it with a nod. You take a spot next to her, your hands folded over your lap – and Lorelei pulls them apart, taking your hand in hers. <i>“Don’t be so nervous, [pc.name],”</i> she says sweetly, squeezing your hand. <i>“I can be gentle, if you’d like. Just tell your mistress how you want her, and she’ll take care of the rest.”</i>");
		output("\n\nIn that case, you decide to be forward with your wants. You want to feel your mistress on your lap: you want to hold her close to you, and you want to feel her chest against yours. You want to –");
		output("\n\nLorelei shushes you by putting her free hand’s index finger to your [pc.lipsChaste]. Without another word, she leans over you, hooking her right leg over and around your waist, straddling you exactly as you wanted: chest against chest, and her groin against yours. Her body feels so <i>warm</i> against you, all over you.");
		output("\n\n<i>“Ooooh,”</i> she coos, wriggling her hips and getting herself nice and snug against your body. <i>“I can already tell, this is the best seat in the room,”</i> she whispers, her tongue slipping out to lick her lips.");
	}
	else
	{
		output("You sit yourself down next to Lorelei, and you run your hand along her silky-smooth leg. She hums in approval at your boldness, and opens her legs further, giving you more thigh to play with. Before you get too excited or intimate, you tell Lorelei that there’s a far more comfortable seat in the room, and it’s not on the bed.");
		output("\n\nShe smiles and lowers her brow at you. <i>“I’ll have you know, this mattress is made the finest of Xhixian fabrics, and manufactured by the best medical technicians at JoyCo for the deepest sleep possible.”</i> She stands, then, gracefully, she turns to you and hooks her right leg up and across your waist. You take her hand for support as she pulls herself into you, chest-to-[pc.chest] and crotch-to-crotch. <i>“And the quilt is made with distilled Myr silk from Myrellion.”</i> She leans into you, her nose touching yours. <i>“That’s quite a ‘comfort’ you have to measure up to, [pc.name].”</i>");
	}

	output("\n\nHer arms wrap around your shoulders loosely, and she keeps her nose pressed against you. She moves her body on top of you – her pebbly-hard nipples grinding into your [pc.chest], and her hips moving and dancing sensually on yours. You can feel the heat of her pussy against your " + (vag ? "own [pc.vagina " + genIdx + "], rousing it to life and drooling for a chance to play with a friend" : "[pc.cock " + genIdx + "], rousing it to attention, sniffing out a fine, virile mate to play with") + ", and the heat of her breath coming out in short, giggly rasps as she moves. She begins to hum a rhythm-less tune as she moves, swaying her body in time to her own music.");
	if (isLoreleisBitch()) output("\n\n<i>“Just follow my lead,”</i> she tells you, tilting her head from side to side in time with her body. You can’t help but tilt your own head with her. You <i>feel</i> the words leave her mouth, her body is so close to you – and, taking that as inspiration, Lorelei closes the gap, putting her lips gingerly to yours.");
	else output("\n\n<i>“Now what?”</i> she asks you, tilting her head from side to side in time with her body. Her lips are so close to your own that you can feel them move with her words. It inspires you, and you know exactly ‘what:’ you close the distance, your [pc.lips] against hers.");
	output("\n\nIt’s a relatively chaste kiss, at least at first. Her lips against yours, not seeking purchase and no tongues seeking entry. Just two bodies, dancing together on the seat of the bed, skin against [pc.skinFurScales], enjoying each other’s embrace.");
	output("\n\nOf course, that hardly lasts very long.");
	output("\n\nLorelei is acutely aware of your growing arousal,");
	if (vag) output(" with how hot and soaked you’re both getting.");
	else
	{
		output(" what with how it’s poking her in the lower stomach");
		if (pc.cLength(genIdx) >= 12) output(" and sliding up her navel");
		output(".");
	}
	output(" She pulls away from you, looking you in the eyes with her half-lidded, lustful gaze;");
	if (isLoreleisBitch()) output(" she smirks that devious little smirk of hers, and she leans forward to nibble ever-so-slightly on your nose, pinching it lightly between her teeth.");
	else output(" she gently cups your cheek, and you lean into her touch as she smiles at you sweetly, the way a lover would smile at another after a long, difficult day.");

	output("\n\n<i>“Kiss me like you mean it,”</i> she suddenly demands, and she closes the gap between you two once again, her mouth open and her tongue surging forward.");
	output("\n\nYou’re taken by surprise, at least at first, but you’re quick to reciprocate: Lorelei wants to make out with you, and you’re not one to leave a woman wanting. Your hands travel to her firm ass, openly palming two huge handfuls, while your [pc.lips] hungrily dance and mesh against hers, your [pc.tongue] surging and coiling and wrapping around her own, counting every one of her tastebuds with every one of your own.");
	output("\n\nLorelei hums into your mouth with approval, and her tongue meets and dances with yours in much the same fashion. She leans into you, both hands cupping onto your cheeks to keep your head still, as she twists and flattens her tongue, drawing its surface along yours, then withdrawing for a breath before surging in again. She likes how you taste, clearly.");
	output("\n\nAll the while, your bodies hump and grind into each other,");
	if (vag) output(" your [pc.vagina " + genIdx + "] soaked with your combined juices, your vulva kissing hers like your mouths are; when Lorelei leans her body just right, you can feel the tickle of her clit grace your abdomen, and she shudders into you.");
	else if (pc.cLength(genIdx) < 24) output(" your [pc.cock " + genIdx + "] swelling purple against Lorelei’s hot, wet pussy, her quim teasing you as high as your [pc.cockHead " + genIdx + "] but never allowing you inside, although every now and again you can feel the tiny bump of her clit against your crown, and she can’t help but shudder in pure lust.");
	else output(" your [pc.cock " + genIdx + "] trapped between your hot bodies, poking into your combined busts and prodding its way into her cleavage. It’s squished between you two, and it would hurt if you weren’t so focused on the pleasure.");
	output("\n\nYou’re both starting to get hot and sweaty, adding to the ease of her body moving and grating against you. She doesn’t miss a beat: she wraps her left arm around your neck, locking you in place to her, and with her right, she dips between you two, her hand seeking out your hot");
	if (vag) output(" cunt.");
	else
	{
		output(" cock");
		if (pc.cLength(genIdx) >= 12) output(" – not that she has to look hard at all");
		output(".");
	}
	output(" Masterfully keeping her composure despite the hot-and-heavy motions between you two, when she finds your delicate equipment, her hands move with a gentle grace, as if discretion were the goal, like she were giving you a handy beneath a table.");

	output("\n\nShe pulls away for just a moment, allowing you both to catch your breath. She presses her forehead to yours and pants, while her hand " + (vag ? "butts against your [pc.clit " + genIdx + "], her fingers dipping and gliding between your thirsty lower lips. She takes her time dipping her middle finger into your body, and as soon as she does, sinking down to her first knuckle, you clench in pleasure, and you both shudder" : "palms at the shaft of your dick, shuddering its way from your [pc.base] to your tip. Her fingers delicately wrap around you meat as she goes, and she can’t help but moan when she feels the bead of precum against her palm") + ". <i>“" + (isLoreleisBitch() ? "Good [pc.boyGirl],”</i> she whispers, her tongue slipping out to lick at your upper lip. <i>“Very,</i> very <i>good [pc.boyGirl]" : "It may just be the wine,”</i> she whispers, <i>“but damn, do you taste good") + ".”</i>");
	output("\n\nYou two go back to kissing, Lorelei moaning into your mouth as her hand picks up its pace, reaching a casual pace of " + (vag ? "thrusting into your pussy, sinking down to her second knuckle" : "jacking you from your base to your crown") + ". Your body moves on its own: your hands haven’t left her ass, and you knead and pull and grope at her soft curves down there while your body presses in, then relaxes and starts again against her. You can feel you both getting wet from the sweat.");
	output("\n\n<i>“Mmm,”</i> Lorelei moans, pulling away from you. She looks you over, from your eyes to your neck; her eyes are half-lidded and her tongue languidly licks at her lips. She breaks into a coy smile, " + (isLoreleisBitch() ? "loving how helpless you are for her and her skills. She could pull her hand away from you and tease you with a pair of fingers against your skin, and you wouldn’t ask her for more." : "enjoying how you’re so into her and you’re so willing to do as she asks. Your every kiss and your every unconscious hump into her hand is a compliment to her."));
	output("\n\n<i>“You are beautiful, you know that?”</i> she says, her nose pressed against yours and her hand maintaining its pace on your genitals. <i>“I know I’m rich, but having met you, I only now realize how lucky I am, too.”</i>");
	output("\n\nHer fingers twist against you, and, almost like magic, she brushes her fingernails deliberately against a nerve cluster that you hardly even knew was there. Your back arches; your arms shake; your hands loosen their grip on her butt; and your breath escapes you. And Lorelei, she just sits there, admiring you through it all.");
	output("\n\n<i>“That’s it, [pc.name],”</i> she whispers, her teeth biting into her lower lip. You feel her pussy gush against " + (vag ? "yours" : "you") + "; she’s enjoying watching you writhe in pleasure beneath her quite a bit. <i>“I just can’t get enough of you right now, darling. Your taste; your smell; the way your body dances for me with the flick of the wrist–”</i>");

	output("\n\nOn cue, her hand shifts,");
	if (vag) output(" twisting palm-down, her middle finger extended and still locked inside you. She presses forward, like a key into a lock, and twists again; you feel every little motion inside your body, and you can’t help but twist yourself in the same direction, moving with her.");
	else if (pc.cLength(genIdx) < 24) output(" the palm of her hand tickling at the skin of your cock’s head, alighting your sensitive nerves. You can’t help but spurt a little more pre onto her hand, and as soon as she feels it, she coos and shivers herself.");
	else output(" her fingers splitting into a V and gliding down to your [pc.knot " + genIdx + "], squeezing slightly once they hit your crotch; at the same time, she rocks forward, your [pc.cockHead " + genIdx + "] disappearing into her cleavage. You can’t help but spurt a bit of pre into her breasts, and as soon as she feels it, she shudders a bit herself.");
	output("\n\n<i>“You’re so close,”</i> she says, pressing her body into you, her mouth against your ear. She nibbles you, then licks at your cheek, " + (InCollection(pc.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS) ? "enjoying the texture and unique taste of your body" : "her tongue darting out to find the salt of your body") + ". <i>“I can tell,”</i> she continues, her legs tightening around your waist, <i>“because I am, too.”</i>");
	output("\n\nLorelei removes her hand from between you two, leaving your " + (vag ? "soaking wet pussy" : "turgid cock") + " all by itself, this close to your orgasm – but, she wraps her arm around your other shoulder, pulling her closer to you and burying your face in her cleavage");
	if (pc.cLength(genIdx) >= 36) output(", mashing your face right up against your own dick");
	output(", while she shifts her hips forward and frots herself against your");
	if (vag) output(" pussy; you grunt, your voice muffled by her breasts, as you feel her hot, wet, quivering snatch mesh against yours with unbridled passion, connecting you to Lorelei in the most truly-feminine way she can.");
	else output(" tool. With every needy grind against you, her pussy drools a streak across your " + (pc.cLength(genIdx) < 12 ? "[pc.cockHead " + genIdx + "], teasing you with promises of something bigger but forcing you to enjoy the ride instead." : "shaft, giving you an impromptu, sloppy, wet, hot, slick hotdog."));
	output("\n\n<i>“That’s it,”</i> she congratulates, her hot, sweaty arms clasping together behind your back to hold you into her boobs. Your hands stay on her ass, but you work your sore-and-tired [pc.lips] on her skin");
	if (pc.cLength(genIdx) >= 24) output(". Your over-endowed equipment gets in the way if your worshipping her breasts, but you don’t pay much heed: you just lick");
	output(", your [pc.tongue] licking and lapping at her, tasting her skin and her sweat");
	if (pc.hasLongTongue()) output(", and coiling it around one boob, giving it a squeeze with your extra-long tongue");
	output(". She rests her cheek against your scalp and moans into your ear without breaking her pace at all.");

	output("\n\n<i>“Keep going.”</i> You swap to the other boob, rubbing your nose against her ribs, as deep into her cleavage as you can be. When you start sucking at the skin of her right tit, her hands shakily claw at your [pc.skinFurScales], raking at your " + (pc.hasWings() ? "[pc.wings]" : "back") + " up to your shoulders. You can feel her heartbeat – in fact, you can <i>hear</i> it, this close to her chest – and, from the way she’s panting, and the way she’s shaking, and the way she’s moaning, and the way her heart rate is sky-high....");
	output("\n\nLorelei clenches her body against you, and she stops her humping and her squirming, but her body is far from still: she vibrates like a machine against you, and she’s doing her best to repress a squeal of sexual delight through tightly-pursed lips, while she cums and cums against you, " + (vag ? "her fluids spraying against your own overworked vulva, encouraging you to cross that threshold with her and meet her halfway, to reciprocate the sensation" : "her juices coating the underside of your rigid [pc.cock " + genIdx + "] " + (pc.cLength(genIdx) < 12 ? "from its tip" : "from its shaft") + " to its [pc.knot " + genIdx + "]") + ". <i>“Ccccc,”</i> she tries to say, and you know that she’s " + (isLoreleisBitch() ? "demanding" : "imploring") + " you cum with her, even when she can’t get the first syllable out of her strained throat.");
	output("\n\nFar be it from you to disappoint her. Her " + (isLoreleisBitch() ? "command" : "invitation") + " is all you need. You follow suit with her, clenching your body to her, tensing, letting your orgasm teeter over that sensitive edge, and then–");

	var cumQ:Number = (!vag ? pc.cumQ() : 0);
	if (vag) output("\n\nYour [pc.vagina " + genIdx + "] clenches in sympathy to Lorelei’s, and your [pc.girlCum] " + (pc.isSquirter() ? "jets" : "soaks") + " against hers, adding your salty essence to the growing broth between you. You and Lorelei can’t help but continue to hump and bump into each other, and every little motion sets every nerve in your poor, overworked cunts into overdrive, demanding another, fresh wave of orgasms for you both. Your [pc.clit " + genIdx + "] is erect as could be, and your button continuously presses into hers; it’s a perfect storm of pleasure that you’re unsure when it’ll end, or if you want it to.");
	else if (pc.cLength(genIdx) < 24) output("\n\nYour cock stiffens, bloated with your load, and it surges forth, " + (cumQ < 3000 ? "painting Lorelei’s flat stomach [pc.cumColor]" :"shooting up so high that it splatters into the underside of her tits, soaking them [pc.cumColor]") + ". Lorelei’s pussy hotdogs against you, and is so hot and warm, it’s almost gripping you just like her fingers did; she’s milking you for your every drop, and every time she feels a warm splash of your semen against her bare skin, she shudders and cums again, loving how your fluids feel against her. You thrust and hump against her body, and occasionally your mind blanks to the concept of her own pleasure, just as you’re sure hers does about yours: all you want is to frot this hot, slick cunt and keep jizzing.");
	else output("\n\nAs close to yourself as you are, you’re acutely aware of everything that’s happening to your [pc.cockHead " + genIdx + "] as your jizz surges up your shaft: it gets warm; the texture of your cock’s skin gets very slightly coarse; it inflates; and it drools your pre, before your face, and Lorelei’s cleavage, is soaked in your [pc.cum]. " + (cumQ < 3000 ? "It drips along your nose and across your [pc.lips], before dribbling back out and down along both your cock’s enormous-and-still-bloated shaft, and down Lorelei’s abs" : "It blasts you in the nose, drenching you and coating the inside of Lorelei’s breasts; soon, there’s just too much to contain in her cleavage, and it sprays back down along your shaft, your abs, and her own – and some of it even fountains up through the top of her chest, getting her in the chin") + ". You don’t exactly have your eyes on Lorelei and her expression, but judging from the continued convulsions through her pussy and against your [pc.base " + genIdx + "], she’s loving every single drop you give her.");
	
	output("\n\nYou and Lorelei remain as you are, shuddering through the aftershocks of pleasure, and errantly moving against one-another, trying to get another orgasm for yourselves. You both pant in exertion; the sweat drips from " + (InCollection(pc.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_BARK, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS) ? "you both" :"her against you") + ", and every move you two make against each other is slippery and slick – you’re both practically lubed enough to get started right now, if you wanted.");
	output("\n\n<i>“Mmmm,”</i> Lorelei moans, pulling back enough to give you a kiss on the forehead. <i>“You did so well, honey. " + (isLoreleisBitch() ? "You were so well behaved. Mmm, maybe you deserve a reward" : "I couldn’t expect less from [pc.name] Steele [pc.himHer]self") + ".”</i>");
	output("\n\nIt takes a moment, as spent as she is");
	if (!vag) output(" and how sticky you both are");
	output(", but she peels herself from you,");
	if (vag) output(" admiring your own exhausted, overworked features, from your swollen [pc.lipsChaste] to your quivering [pc.belly]. Your pussy aches, in a good way, like an itch that you can’t help but just want to keep on scratching; Lorelei dips her hand between you two, sliding two fingers into the space between your cunts, coating both sides of her fingers in your collected juices, and, maintaining eye contact with you, cleans them both, with one long lick, one after the other. And, just like that, you feel an unsubtle need to start ‘scratching’ again.");
	else if (pc.cLength(genIdx) < 24) output(" admiring your own exhausted, overworked features, from your swollen [pc.lipsChaste] to your quivering [pc.belly]. You’re still hard, but you’re getting softer by the heartbeat; Lorelei dips her fingers down between you two, stroking along her own stomach, collecting a line of your [pc.cum] on her finger, and, maintaining eye contact with you, sucks it clean. And, just like that, you’re not getting any softer.");
	else output(" getting a good look at your [pc.cum]-drenched face. At the sight of you, still dripping with yourself, she presses her boobs together with her hands, rubbing what’s left over between them into her skin like a lotion; Lorelei maintains eye contact with you, and you hear the wet squelches and burbles of your jizz still inside her cleavage mesh into her boobs and leak out underneath them both. The blood <i>was</i> draining from your cock, but, with that display, you’re awfully close to shoving your [pc.cockHead " + genIdx + "] right back in between her soft breasts and starting again.");

	output("\n\nShe moans, putting on her display for another moment for you, before, again, with some effort, she peels her legs apart from you and flops onto the bed beside you. Her body splays, her limbs all stretching into different directions, and she lounges into her plush bedcover in satisfaction. <i>“");
	if (flags["LORELEI_SEX_COUNTER"] == undefined)
	{
		if (isLoreleisBitch()) output("Get me my wine, darling, while I consider what your reward will be,”</i> she says.");
		else output("Could you get me my wine, please, darling?”</i> she asks.");
		output("\n\nYou do as you’re " + (isLoreleisBitch() ? "told" : "asked") + ", and you stand, heading towards the bar for her glass. There’s still a bit of wine left in it. With it in hand, you return to the bed, and hand it to her.");
	}
	else
	{
		if (isLoreleisBitch()) output("Get me more wine, darling, while I consider what your reward will be,”</i> she says.");
		else output("Could you get me some more wine, please, darling?”</i> she asks.");
		output("\n\nYou do as you’re " + (isLoreleisBitch() ? "told" : "asked") + ", and you stand, taking her wine glass from the nightstand and heading towards the bar to refill it. She isn’t about to run out anytime soon. With a fresh glass in hand, you return to the bed, and hand it to her.");
	}
	output("\n\n<i>“Thank you,”</i> she says, before taking a swig. Before she swallows, she swirls the glass in her fingers, making the wine dance; she looks you up and down, admiring your naked form, and your " + (vag ? "damp, but not quite wet and puffy, pussy" : "stiff, but not quite hard, cock") + ". Her eyes settle on your crotch for just a moment too long, and you get the distinct feeling you know what it is she wants next.");
	if (isLoreleisBitch()) output("\n\n<i>“I think I’ve decided on a suitable reward,”</i> she says, with a mischevious lilt in her voice and curl on her lips. <i>“Say the word, darling, and we’ll get started on seeing you...</i> thoroughly <i>and</i> properly <i>rewarded.”</i>");
	else output("\n\n<i>“What do you say to another round?”</i> she asks, almost casually, as she sets the wine glass down on her nightstand. <i>“I can go as much and as often as we want, darling. The night’s still young.”</i>");
	output("\n\nLorelei is giving you the option to go again, if you want.");

	// end scene (scene: Lapdance); return to the Sex Select menu. Set the PC’s Lust to 30
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");
	pc.orgasm();
	pc.lust(30+pc.libido()/20);
	if (!vag && pc.cLength(genIdx) >= 24 && cumQ >= 3000) pc.applyCumSoaked();

	loreleiSexMenu();
}

public function loreleiGetsTheDButSheKeepsIt():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();

	if (flags["LORELEI_TALKED_FUTA"] == undefined)
	{
		output("Your eyes trail from Lorelei’s, down her body, and to the floor. You idly rim your wine glass as you struggle with what you want to say to Lorelei. How do you just <i>tell</i> a lady that you want her to grow a penis?");
		if (isLoreleisBitch()) output("\n\n<i>“Collar: Speak,”</i> she commands. <i>“I would like to know what’s bothering you.”</i>");
		else output("\n\n<i>“What’s on your mind?”</i> she asks, noticing your askance glance. <i>“It’s you and me in here, darling. There’s no need to be shy.”</i>");
		output("\n\nAt her insistence, you start by telling her not to take this the wrong way, but... has she ever considered... ‘personal additions?’ To her body?");
		output("\n\n<i>“Ah,”</i> she says, wetting her suddenly-dry mouth with her wine, <i>“you’re asking if I had ever considered growing a penis, right?”</i>");
		output("\n\nYou, uh, yes, that’s right.");
		output("\n\n<i>“I haven’t,”</i> she answers simply. <i>“My body is beautiful the way it is. I would never allow the point of a syringe of Throbb to come anywhere near me. And, I’m hurt!”</i> she says, raising her tone as she leans back and puts her fingers on her chest, offended at the question. <i>“I thought you enjoyed our times together, [pc.name]! Is our relationship so empty that you’d need some extra meat to fulfill it?”</i>");
		output("\n\nYou insist that that’s not what you meant at all! It’s just, if she <i>did,</i> well... it would certainly open up some new dynamics between you two.");
		output("\n\nShe smiles well-meaningly. <i>“I kid, darling. Take it from a woman with a bit of experience: sometimes, there’s nothing better,”</i> she says, leaning into you, her voice dropping in volume and her syllables getting lazy and stretched, <i>“than a nice, thick,”</i> she says, over-pronouncing the K, <i>“warm...</i> throbbing... <i>cock. To treat you right. To meet your every...</i> every... <i>salacious need.”</i>");
		output("\n\nHer hand strokes down your side as she leans in closer, her chest against your own and her lips against your ear. <i>“Imagine me, [pc.name], with a nice, meaty cock... imagine it, all bunched up beneath my dress. Every time you look at it, it gets just a little bigger.”</i> She licks your earlobe, then nibbles on it for a moment. <i>“Imagine fishing it out... and it’s half-hard... and my pre is leaking out... imagine putting your mouth to my tip....”</i> She kisses behind your ear, her hand working its way down your body, to your crotch. <i>“And feeling it grow against your tongue... imagine going down on me, stuffing more of it into your mouth... imagine me moaning your name while my hands play with your " + (pc.hasHair() ? "hair" : "head") + "....”</i>");
		output("\n\nYou’re starting to shake at the thoughts, and you can’t help but shift your [pc.hips] forward at her touch, begging her questing hand to touch you and start playing with you.");
		output("\n\nBut, as suddenly as it starts, she pulls away, resuming her earlier posture in her seat as if nothing at all had happened between you two.");
		output("\n\n<i>“Like I said, I had never considered growing a penis of my own,”</i> she continues, swirling her wine, her mischievous half-lidded eyes on your every reaction and response. <i>“And I refuse to make such a permanent change to my body. But,”</i> she says, her tongue licking the rim of her wine glass before taking a sip, <i>“there</i> is <i>an alternative.”</i>");
		output("\n\nYou sit up, hanging on her every word.");
		output("\n\n<i>“Are you familiar with a Xenogen Biotech product called a ‘SynthSheath?’”</i>");
		output("\n\nYou tell her that you ");
		if (flags["SYNTHSHEATH_ACQUIRED"] != undefined) output("are. <i>“Good. ");
		else
		{
			output("aren’t. <i>“Xenogen Biotech specializes in technology that can be used to heal or augment a person’s body. One of their most infamous products is, as you might have guessed, a strap-on dildo in the shape of a horse’s penis, completely with a set of giant,”</i> she says, her tongue snaking out to lick her lips, <i>“heavy testicles. Once it’s worn, it attaches itself to the host’s body, becoming a bonafide</i> part <i>of them.”</i>");
			output("\n\nYou thought she said she didn’t want to make any modifications to her body. <i>“");
		}
		output("Bring me a SynthSheath, darling, and I’ll show you the rest.”</i>");

		flags["LORELEI_TALKED_FUTA"] = 1;

		if (pc.hasItemByClass(HorseCock))
		{
			output("\n\nAs a matter of fact, you actually happen to have one on you right now. Do you give it to Lorelei now?");
			addButton(0, "Yes", loreleiDoesntNeedARubberCauseHerCockIsRubber, true);
			addButton(1, "No", loreleiIsDeniedEntryIntoTheColtCockClub);
		}
		else
		{
			output("\n\nThat’s certainly something to keep in mind, should you come across another one in your travels.");
			loreleiTalkButtons();
			addDisabledButton(4, "Go Futa");
		}
	}
	else
	{
		processTime(1+rand(2));
		output("You ask Lorelei if she remembers you asking her if she could consider growing a penis for you both to enjoy.");
		output("\n\n<i>“I remember saying I wasn’t in the market to</i> grow <i>one,”</i> she says, swirling her wine, <i>“but I also remember giving you a second option. Do you need a reminder?”</i>");
		output("\n\nNo, you remember: she asked you to find a SynthSheath.");

		if (pc.hasItemByClass(HorseCock))
		{
			output("\n\nAnd as a matter of fact... ");
			addButton(0, "Give It", loreleiDoesntNeedARubberCauseHerCockIsRubber, false);
			addButton(1, "Keep It", loreleiIsDeniedEntryIntoTheColtCockClub);
		}
		else
		{
			output("\n\n You haven’t quite found one yet; you’re just asking if she remembers, is all.");
			output("\n\n<i>“Well, me and my entirely horse-cocked-less crotch are waiting, darling,”</i> she says with a laugh, slapping her thigh.");	
			loreleiTalkButtons();
			addDisabledButton(4, "Go Futa");
		}
	}
}

public function loreleiIsDeniedEntryIntoTheColtCockClub():void
{
	clearMenu();
	clearOutput();
	loreleiHeader();
	output("You decide on holding off the fact that you’re holding onto a SynthSheath for now. You’ll give it to her when you’re ready.");
	loreleiTalkButtons();
	addDisabledButton(4, "Go Futa");
}

public function loreleiDoesntNeedARubberCauseHerCockIsRubber(firstTry:Boolean):void
{
	clearMenu();
	clearOutput();
	processTime(7);

	if (firstTry) output("You tell her that, actually, you happen to have one on you right now. <i>“Very good,”</i> she says, setting down her wine glass and clapping her hands once. <i>“You’re a very resourceful person, [pc.name]. I like that.”</i>");
	else output("... you happen to have one on you now. You were lucky to come across one in your travels. <i>“Very good,”</i> she says, setting down her wine glass and clapping her hands once. <i>“You’re a very resourceful person, [pc.name]. I like that.”</i>");
	output("\n\nYou reach into your pack and withdraw the promised item: a large, leathery, floppy, currently-recessed horsecock dildo, completely with massive, heavy testicles. You give it to her gingerly, afraid that if you slip, it might just land on her crotch before she’s ready, or something.");
	output("\n\n<i>“Watch this,”</i> she says, keeping both of her gloved hands on the dildo. Before your eyes, the black of her suit crawls along her arms in thin tendrils, before swarming over the SynthSheath, from its recessed head to its bloated testicles. They cover the dildo like a flurry of frenzied ants over their prey, until no single part of the SynthSheath is visible beneath the undulating black mass.");
	output("\n\n<i>“The technology of my suit, and the microsurgeons in this SynthSheath, have a... shall we say, a ‘common ancestor,’”</i> she explains, her eyes staying on the dildo. <i>“My suit’s a little more advanced, obviously, but it’s also backwards compatible, for lack of a better term. I can take this SynthSheath’s micromachines and,”</i> she explains, watching her nanomachines work the SynthSheath over, <i>“add them to my own.”</i>");
	output("\n\nA moment passes with the nanomachines of her suit wrapping around the SynthSheath, and then, as suddenly as it started, the black tendrils return to Lorelei down her arm, leaving the dildo alone in her hand. <i>“I won’t tarnish my body by growing a penis of my own, or by slapping this one onto me. But, if I take this SynthSheath’s microsurgeons for myself....”</i>");
	output("\n\nThe tendrils bulge as more material is taken from her dress and added to them, until two massive, bulbous, inky-black pustules rise along her forearms, undulating their way across her body with some ‘effort.’ The massive sacks of black nanomachines slide down her ribs, and then meet on her stomach, before drooping down to between her legs.");
	output("\n\nAnd from there, as you watch, a brand new SynthSheath forms, even as the old one still rests in her hand. Lorelei spreads her legs, giving her suit space to work: they form her huge, bloated testicles first, swinging freely beneath the stool, before conjuring up a spongy, fleshy sheathe, presumably with the horsecock inside fully formed somewhere. To match her suit, the entire package is black as could be.");
	output("\n\n<i>“I could have just made a penis and some balls from the material of my suit, but they wouldn’t be any more sensitive than the rest of my body, and,”</i> she laughs, <i>“I wouldn’t be able to make those big, creamy loads that SynthSheaths are capable of making. With this, I’ll feel and produce absolutely</i> everything, <i>darling, just as if I had worn it. But,”</i> she continues – and, just like that, the SynthSheath between her legs dissipates and disperses again, leaving her crotch as bare and bulge-less as it was before.");
	output("\n\n<i>“This way, I get all the carnal pleasures of having such a big, meaty cock, like you wanted, without tarnishing the canvas that is my body.”</i> She licks her lips excitedly. <i>“It’s the best of both worlds, honey.”</i>");
	output("\n\nShe hands you back the SynthSheath in her hand, and when you hold it, you notice that it’s noticeably lighter and limp – she had stolen the SynthSheath’s microsurgeons, leaving you with a flaccid chunk of rubber. It’s pretty useless as it is now; you make a note to discard it as soon as you can.");
	output("\n\nYou’re kind of shocked at the display – but, if nothing else, you are now satisfied that <b>Lorelei has a SynthSheath</b>, and you only need to ask for her to use it on you.");
	output("\n\n<i>“Now,”</i> she whispers, lightly chewing on the nail of her pinkie finger, <i>“what do you say about... giving it a test spin?”</i>");

	if(!lorelei.hasCock()) lorelei.createCock();
	lorelei.createPerk("Fixed CumQ", 100);
	pc.destroyItemByClass(HorseCock);

	loreleiFutaHeader();
	loreleiMenu();
}

public function loreleiAndTheGreatAdjustableWang():void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();

	output("You ask Lorelei if she’d be willing to use that SynthSheath you had gotten her on yourself. You’d like to... explore her, under different circumstances.");
	output("\n\nLorelei smiles at the request, and at the way you’ve phrased it. <i>“Of course, darling,”</i> she says as she opens her legs wholly and totally to you, exposing her puffy vagina to the air between you two. <i>“After all the effort you went to find me one, I wouldn’t dream of keeping that sort of</i> pleasure <i>from you. All you need is to ask.”</i>");
	output("\n\nHer crotch is completely bare, and, notably, does not have a horse-shaped phallus attached to it. But, at the end of her sentence, black tendrils of nanomachines emerge from behind her neck, crawling in guided streams down her ribs, across her tummy, and building into a ball on top of her pussy, until it’s replaced with a black, formless, undulating sphere of micro-machines.");
	output("\n\n<i>“Let me just ask you a few questions, first, darling. So I can better please you.”</i>");
	output("\n\nYou barely register the words; your eyes are locked on the black orb between her legs, and the way it keeps shifting and practically bubbling, like something inside it is trying to burst forth.");
	output("\n\n<i>“In today’s day and age, darling, there are</i> so <i>many exotic options when it comes to the perfect cock.”</i> She licks her lips, watching you being so entranced on her crotch. <i>“Every shape has its appeal: a human’s cock has a helmet, with those oh-so-sensitive glans on the underside... an ausar’s has that pointed spade, perfect for spearing nice and deep into a warm hole... then, oooh,”</i> she moans, her hand going to her mouth and drawing a finger across her lower lip, <i>“the classic Terran equine’s cock is nice, and</i> thick, <i>all over... perfect for just, mmm,</i> pounding <i>a hole into a satiated mess....”</i>");
	output("\n\nYou don’t immediately answer; you and Lorelei both enjoy your abject staring for a moment longer. <i>“So, darling, does anything catch your fancy?”</i>");

	loreleiWangButtons(0, false);
}

public function loreleisSpeciatedWang(wangType:int):void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();

	output("You tell Lorelei that you’re interested in seeing her with " + indefiniteArticle(GLOBAL.TYPE_NAMES[wangType].toLowerCase()) + " cock.");
	output("\n\nLorelei hums in delight at your choice, and her eyes glance to the shifting black mass between her legs, but no cock emerges from it just yet. <i>“Second question,”</i> she asks, <i>“just how... mmm...</i> big <i>and</i> juicy <i>do you want me?”</i> She humps her hips toward you, and the black mass jiggles and bounces underneath its own weight with the motion. <i>“I’m not going to go lower than seven inches, mind. In a universe filled with ‘enhancements,’ that ought to be a nice, pleasurable average for us both.”</i>");

	lorelei.shiftCock(0, wangType);

	loreleiWangButtons(1, false);
}

public function loreleisWangGrowsWhenSlutsTellLies(big:Boolean):void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();

	output("You tell Lorelei that");
	if (big) output(" you want her to have something <i>bigger.</i> Something that’ll break you if you aren’t careful. You want her to be nice and <i>thick</i> for you.");
	else output(" a nice, seven inch cock suits you just fine. More than enough to pleasure you both, without being too egregious. Something you could fit any part of yourself onto without much struggle.");
	output("\n\nLorelei hisses in pleasure at your words, " + (big ? "and the steady stream of black tendrils increases their flow to her legs, thickening and bulging the sphere even larger. She palms at it, letting the black streams wash over her hands" : "and one hand palms at the growing bulge in between her legs") + "; she’s fantasizing about it already, and she’s just as excited to get started as you are.");
	output("\n\n<i>“O");
	if (silly) output("w");
	output("oo,”</i> she moans, barely able to get the thought out of her mouth, <i>“n-next question, darling... how do you feel about knots? Those,”</i> she pauses and audibly licks her lips, <i>“big... fat... bulbous... tight... juicy bulges of meat at the base of a cock. Mmm... a nice, thick knot can lock a pair of lovers together for</i> hours <i>after the fact. Does that sound like fun to you? Do you want your lover to have one?”</i>");

	if (big)
	{
		lorelei.cocks[0].cLength(15, true);
		lorelei.setPerkValue("Fixed CumQ", 1, 2500);
	}
	else
	{
		lorelei.cocks[0].cLength(7, true);
		lorelei.setPerkValue("Fixed CumQ", 1, 500);
	}

	loreleiWangButtons(2, false);
}

// set knotCount to -1 for hyper
public function loreleiHasNoRopeButSheDoesHaveKnots(knotCount:int):void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();

	// hyper
	if (knotCount < 0)
	{
		output("You tell Lorelei that you want... you want her to have a <i>huge, fat, <b>throbbing</b></i> cock. You want it to be bigger than she is. You want to sit underneath its shadow. You want her to have a <i>legendary</i> cock that would make even the loosest sluts in the universe clench in surprise.");
		output("\n\nLorelei audibly licks her lips as you describe it, and, as you asked, the black, streaming tendrils up their output, adding to the bulging mass in between her legs at a suddenly-surprising rate. Before, the bulge was maybe the size of your two fists together, but, in the blink of an eye, it gets bigger than your head – and, with each thick pulsate, it gets even bigger. Bigger than that. Bigger than <i>that.</i>");
		output("\n\n");
		//showImage("LoreleiSittingEquine");
		output("<i>“We won’t have the material left for any other bits or baubles, I’m afraid,”</i> she says, her hand idly palming the growing bulge. Her hand sinks down to her wrist into the growing mass; it gets so large that she needs to spread her legs further apart, and only now, moments later, is its growth waning in size. <i>“But let it be known that Lorelei</i> provides <i>for her lovers.”</i>");

		lorelei.cocks[0].cLength(60, true);
		lorelei.cocks[0].delFlag(GLOBAL.FLAG_KNOTTED);
		lorelei.setPerkValue("Fixed CumQ", 1, 5000);

		flags["LORELEI_KNOTS"] = 0;
	}
	else
	{
		output("You tell Lorelei that");
		if (knotCount == 0)
		{
			output(" you’re fine with her not having one – you’d rather she not have any of the fancy bits or baubles, and to just have her as she is.");
			output("\n\nLorelei hums in understanding, taking your wishes into account as she forges herself for you.");
			lorelei.cocks[0].delFlag(GLOBAL.FLAG_KNOTTED);
		}
		else
		{
			if (knotCount == 1)
			{
				output(" she has you sold: nothing would sound more delightful than to have her lodged deep inside you, locked together, until she’s well and truly satisfied.");
				output("\n\n");
				output("Lorelei likes what she hears, and another few black tendrils make their way down her body, adding to the growing sphere and making it all the more <i>formidable.</i>");
			}
			else
			{
				output(" you’re feeling daring and adventurous: you want her to have <i>two.</i> One stacked on top of the other. You want to go through the strain of having her locked so thoroughly and completely to you, and when you think it’s over, you want to do it all over again, until you’re stuffed to the point of bursting.");
				output("\n\nYour wish catches even her off-guard, but, with a light laugh to herself, a number of thick, black tendrils seep down from her neck to her crotch, billowing out the growing sphere between her legs. One part of you is a bit worried – but the other part can’t wait to get started.");
			}
			lorelei.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
		}

		flags["LORELEI_KNOTS"] = knotCount;
	}

	output("\n\n<i>“That’s about it, I think,”</i> Lorelei says, humming in pleasure as her hand pats at the sphere between her legs. The wispy black tendrils withdraw, leaving a solidifying, black mass between her legs, " + (lorelei.cLength() < 10 ? "pulled taught and firm into her body" : "sagging underneath its own weight and pulling at Lorelei’s crotch") + ", reminding you both that it is very much a part of her body.");
	output("\n\nLorelei’s hand continues to massage at her newly-formed equipment – it’s currently flaccid and hidden within itself, but, knowing how aroused she already is, and how aroused she’s making herself, that’ll be changed in a hurry, and you’ll get a good look at her delicious new cock in all its glory in just a moment.");

	addButton(0, "Next", loreleisFutaSexFinallyBegins);
}

public function loreleiWangButtons(question:int, showText:Boolean = true):void
{
	// play this scene any time the player presses the [=Back=] button
	if (showText)
	{
		clearMenu();
		clearOutput();
		loreleiFutaHeader();
		output("Actually, could you go back to that last question? You think you have a better idea in mind.");
		output("\n\n<i>“Of course,”</i> Lorelei says. <i>“Whatever you like, darling. My body is the clay for you to sculpt.”</i>");
	}

	switch (question)
	{
		default:
		case 0:
			addButton(0, "Human", loreleisSpeciatedWang, GLOBAL.TYPE_HUMAN);
			addButton(1, "Ausar", loreleisSpeciatedWang, GLOBAL.TYPE_CANINE);
			addButton(2, "Equine", loreleisSpeciatedWang, GLOBAL.TYPE_EQUINE);
			break;
		case 1:
			addButton(0, "Average", loreleisWangGrowsWhenSlutsTellLies, false);
			addButton(1, "Big", loreleisWangGrowsWhenSlutsTellLies, true);
			addButton(2, "Hyper", loreleiHasNoRopeButSheDoesHaveKnots, -1, "Hyper-Sized", "Lorelei isn’t the type to shy away from a lover’s wants and needs. If you ask her to be hyper-sized, <i>expect a hyper-sized dick.</i>");
			break;
		case 2:
			addButton(0, "None", loreleiHasNoRopeButSheDoesHaveKnots, 0);
			addButton(1, "One", loreleiHasNoRopeButSheDoesHaveKnots, 1);
			addButton(2, "Two", loreleiHasNoRopeButSheDoesHaveKnots, 2);
			break;
	}

	addButton(10, "No Changes", loreleisFutaSexFinallyBegins);
	if (question > 0) addButton(14, "Back", loreleiWangButtons, question - 1);
}

public function loreleisFutaSexFinallyBegins():void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();
	processTime(2+rand(2));

	output("Lorelei reclines into her bed, her hand idly groping at her crotch, the nanomachines shaping and forming the shifting black mass into the cock of your dreams. As the seconds tick by, the sphere’s shape becomes more defined and transformed, until you can clearly make out the shape of a semi-erect cock, sculpted to your exact specifications:");
	output("\n\n");
	if(lorelei.cLength() >= 24) showImage("LoreleiSittingEquine");
	else if(lorelei.hasKnot()) showImage("LoreleiSittingCanine");
	output("Hanging between her legs is a [lorelei.cockNoun],");
	if (lorelei.cLength() < 10) output(" gliding its way up the inside of her thighs as it gets more and more erect. She has a pair of balls that will comfortably fit the palm of your hand – or into your mouth.");
	else if (lorelei.cLength() < 24) output(" hanging down to her knees, struggling to lift itself underneath its weight and point its head towards you. She has a pair of testicles that hang huge and low: you could barely fit a single one in your palm if you tried, and if you tried with your mouth, you’d have your work cut out for you.");
	else output(" nearly as long as she is tall, radiating heat all the way over to where you’re standing, and strong enough to support itself as it rises into the air, even with its immensity. Underneath that monolith of a cock isn’t what you’d call a pair of testicles: they’re a pair of beanbag chairs, each of them massive enough for you to recline into, or be smothered by.");
	if (lorelei.hasKnot()) output(" And at the base of her rising cock is the hint of " + (flags["LORELEI_KNOTS"] == 1 ? "a bulge" : "a pair of bulges, one on top of the other") + " – it’s the " + (flags["LORELEI_KNOTS"] == 1 ? "knot" : "knots") + " that you had asked for. She isn’t erect enough for " + (flags["LORELEI_KNOTS"] == 1 ? "it" : "them") + " to be overly influential in your lovemaking, but with every beat of her heart, that’s changing right before your eyes.");
	output("\n\nLorelei strokes at her cock, her " + (lorelei.cLength() < 24 ? "hand wrapping" : "palm rubbing at") + " her shaft, getting a good feel for her new, albeit temporary, appendage. Her eyes strain to look away from her synthetic meat, but when they do, they lock onto yours, narrowing predatorily. This is what you wanted from her. You had better make good on your end of the deal.");
	output("\n\n<i>“One last question,”</i> she huffs, her breath coming out in a steady, strained puff. <i>“These balls of mine are full of real cum, [pc.name], and I’m already pent up as can be.”</i>");
	if (lorelei.cLength() > 24) output(" With her other hand, she rubs at the skin of her sack, and it visually jiggles – and maybe even audibly sloshes – with her thick load.");
	output(" She licks her lips as her cock continues to rise between you two");
	if (lorelei.cLength() > 24) output(" – if you don’t act quickly, soon it’ll obscure your eye contact with her");
	output(". <i>“");
	if (pc.hasVagina()) output("My cum is sterile, so we don’t have to worry about anybody knocking anybody up. This time.”</i> Her cock lurches on its own at the implication. <i>“");
	output("How would you " + (isLoreleisBitch() ? "please" : "have") + " me?”</i>");

	pc.changeLust(40+pc.libido()/10);

	if (lorelei.cLength() > 24 && flags["USED_SNAKEBYTE"] == undefined) addDisabledButton(0, "Worship", "Worship", "Lorelei is <i>way</i> too huge for you to properly go down on. <b>Perhaps if there were a way to adjust your mouth to take larger insertions...</b>");
	else addButton(0, "Worship", loreleiAreYouSureArtTastesLikeCum, undefined, "Worship", (lorelei.cLength() < 24 ? "Lorelei has a dick that needs some serious attention. You’re no stranger to pleasing her – show her how much you appreciate her changes." : "Finally, a <b>real</b> cock to truly test your erogenous throat! You can’t <i>wait</i> to feel this thing in your mouth!"));

	if (pc.cuntThatFits(lorelei.biggestCockVolume()/2) < 0 && lorelei.biggestCockVolume()/2 > pc.analCapacity()) addDisabledButton(1, "Get Fucked", "Get Fucked", "Lorelei’s too big for you to take. <b>If you want to take a monster like this into yourself, maybe you should look into increasing your capacity.</b>");
	else addButton(1, "Get Fucked", vaginaRouter, [loreleiHasAGoAtStealingYourVirginity, lorelei.biggestCockVolume(), 1, 0], "Get Fucked", (lorelei.cLength() < 24 ? "Lorelei’s grown a cock, just for you. It wouldn’t be right to ask her to go through the trouble and then <i>not</i> give it the attention it needs..." : "You can’t help but shiver at the sight of this <i>beast</i> between Lorelei’s legs. You <i>need</i> to feel it inside you...!"));

	if (lorelei.cLength() < 24) addDisabledButton(2, "Bodyjob", "Give Bodyjob", "It’s a hot idea, but in order to fully realize it, Lorelei would need to be much <i>bigger</i>...");
	else addButton(2, "Bodyjob", loreleisCockIsAFriendThatWantsHugs, undefined, "Give Bodyjob", "There’s only one real way to appreciate a cock as large as Lorelei’s. Why not give it a big, long ‘hug’?");
}

public function loreleiAreYouSureArtTastesLikeCum():void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();
	processTime(20+rand(16));

	output("Truthfully, your mind was made up as soon as your eyes took in the juicy girth of her [lorelei.cockNoun]. You don’t need to tell her what you want with words: you take one step forward and " + (pc.hasKnees() ? "kneel" : "crouch") + " down, putting");
	if (lorelei.cLength() < 12) output(" her cock’s head level with your mouth.");
	else if (lorelei.cLength() < 24) output(" putting her cock’s head level with your eyes.");
	else output(" yourself into the shadow of her monster of a cock.");
	output(" Gingerly, you wrap your fingers around her " + (flags["LORELEI_KNOTS"] == 2 ? "bottommost knot" : "base") + ", and you lean the " + (lorelei.cLength() > 24 ? "shaft" : "tip") + " towards your mouth. Once you feel the heat against your face and the smell hits your nose, you can’t help but wet your [pc.lips] in anticipation.");
	output("\n\n<i>“" + (lorelei.cLength() < 24 ? "Mmm, I do so love a [pc.manWoman] eager to please" : "That’s a very bold move, [pc.name], but far be it from me to keep you from your affections") + ",”</i> Lorelei muses. She shivers at your touch and reclines into the bed – she’s not at all used to having a brand new appendage, and one as sensitive as this one is – but she refuses to allow her voice to crack. Her hand comes to a rest on your scalp, and her fingers crook, gently pulling you into her.");
	output("\n\nThe distance between you and her brand new cock is a scant few inches, and you’re all too eager to close the distance and taste her: you open your mouth and let your [pc.tongue] slip forth, flattening your tastebuds against her shaft,");
	if (lorelei.cLength() < 12) output(" looping your muscle around it until you’ve got it cupped in your tongue the way a single, wet, warm, squishy finger would.");
	else if (lorelei.cLength() < 24) output(" wrapping your muscle around it as much as you can, but you can barely make it halfway before her girth is pressed against your [pc.lips].");
	else output(" hoping to cover as much surface area as you can with one lick, but it turns out to be next to nothing compared to how much else she’s got.");
	output("\n\nShe tastes... like herself. You had expected the nanomachines to have messed with her flavor, or the texture of her skin, but what you taste is undeniably Lorelei. You draw your mouth upwards");
	if (lorelei.cLength() < 24) output(", until your upper lip meets the tip of her cock");
	output(", dragging your tongue along with you over every cell: what this [lorelei.cockNoun] is, is more Lorelei. And that’s all you could have wanted when you pictured her with a cock.")

	output("\n\nLorelei focuses mostly on breathing through her nose as she watches you bathe her cock. When your hand goes to her balls, " + (lorelei.cLength() < 24 ? "cradling " + (pc.cLength() < 12 ? "both" : "one") + " between your fingers, and familiarizing yourself with the spongy feel of her sack" : "palming at her stretched, taut sack, your fingers tickling at one dense, heavy nut") + ", she reflexively opens her legs wider, giving you more room to work with. And once you have that room, you decide, it would be a shame if you didn’t make the most of it.");
	output("\n\nYou plant a kiss on her " + (lorelei.cLength() < 24 ? "head, letting the [lorelei.cockHead] slip between your lips and supping on the tiny bead of pre she’s offered to you" : "shaft, your face disappearing into the girth, and the bottom of the [lorelei.cockHead] grazing your forehead, dampening it with a bead of her pre") + ", before you start licking your way downward, mimicking the same motion as before, but tracing a new line down her skin. You tongue at her base");
	if (flags["LORELEI_KNOTS"] == 2) output(", lapping at the valley between her two, still-inflating knots");
	else if (lorelei.hasKnot()) output(", wrapping your [pc.tongue] along her still-bloating knot");
	output(", before sinking deeper, until your bottom lip meets the skin of her scrotum.");
	output("\n\n<i>“So attentive,”</i> Lorelei congratulates, shifting her hips toward you and grinding her sack against your chin.");
	if (lorelei.cLength() < 24) output(" <i>“I can say, with all honesty, that I don’t grow a pair of jewels like these ones for just anybody, darling. I want to feel some appreciation from you.”</i>");
	else output(" <i>“There’s quite a load stirring in there, just for you, [pc.name], and just like you wanted. Why don’t you... give them a heft, if you can?”</i>");
	output("\n\nAnd you do just that, yawning your mouth to take in");
	if (lorelei.cLength() < 24) output((lorelei.cLength() < 12 ? " both" : " one") + " of her churning balls into you, to show her that it’s everything you could have asked for. You compress your cheeks, but you don’t ‘suck’ so much as you lock her in place, so you can lap and lick at her " + (lorelei.cLength() < 12 ? "nuts in your mouth." : "nut in your mouth, and you keep her other nut busy by rubbing it like it were smooth and made of glass."));
	else output(" as much of the surface of her fat right nut as you can, while your right hand tries to hook underneath her left and give it a lift. Her balls are so massive that they nearly rest on the floor, and your fingers scrape along it to hook beneath her. And when you do, you lift, " + (pc.physique() < 12 ? "and you strain: she’s <i>so full</i> and <i>so dense</i> that lifting her testicle is beyond your limit." : "surprised at the incredible heft she has in her testicle <i>alone.</i> She’s <i>so full</i> and she’s <i>so dense</i> that you could use her nuts for dumbbells."));
	output(" Lorelei leans back onto her hands at the attention, and her body shakes in pleasure, but she continues to refuse to moan or whimper: she values her image of being in total control too much to do it. Vain as ever.");

	output("\n\nYou lean forward, " + (lorelei.cLength() < 12 ? "putting your bottom lip against Lorelei’s now-hidden clit, making her jump, and sinking your nose into her pelvis" : "sinking your face deeper into the features of Lorelei’s sake, submerging yourself into her nutflesh") + ". You breathe deeply through your nose, taking in her scent: unmistakably still Lorelei, but with something more tart, more earthy; she smells like sex, and the longer you’re on her, letting her " + (lorelei.cLength() < 12 ? "nuts" : "nut") + " soak in your mouth, the tangier it gets, and the deeper Lorelei’s breathing gets.");
	output("\n\nShe sighs, and puts her hand to the topside of her cock’s shaft, pushing it down and against your face.");
	if (lorelei.cLength() < 12) output(" She wipes it back and forth across your nose and your cheeks, and you feel its tip leak more pre across your forehead; whenever one of your eyes isn’t obscured by her cock waggling against them, you can see her bite into her lower lip and her nostrils flair.");
	else if (lorelei.cLength() < 24) output(" You can feel its weight and its heat against your cheeks, and you can feel her pulse through her straining dickflesh: it throbs against your features, and every so often, it bloats with another offering of pre. You can feel it drip from her [lorelei.cockHead] and onto your scalp.");
	else output(" It almost feels like you could be crushed beneath it, if you aren’t careful: its girth encapsulates your vision, darkening your space until all you can see is her burgeoning cockflesh, and all you can hear is her heartbeat through it. That is, until you hear it gurgle with a thick, fist-sized dollop of pre, glide up from inside it and drip tantalizingly from her [lorelei.cockHead]. A splash of that would damn near be enough for a shower.");
	output("\n\nLorelei, finally showing weakness, grunts – she almost <i>growls</i> at you. <i>“Alright, enough foreplay,”</i> she says. <i>“You wanted me to have a cock for you to worship. It’s about time you got started.");
	if (lorelei.cLength() > 24) output(" I’m curious to see you in action.");
	output("”</i>");

	output("\n\nOn " + (isLoreleisBitch() ? "your mistress" : "Lorelei") + "’s command, you start your");
	if (lorelei.cLength() > 24) output(" long");
	output(" journey back up her cock: you take the journey in reverse,");
	if (flags["LORELEI_KNOTS"] == 2) output(" slipping the tip of your tongue into the tight cleavage of her two, thick, bulbous, ready-to-lock knots, and giving each one a long, languid pass, before");
	else if (lorelei.hasKnot()) output(" kissing at her now-inflated-and-ready-to-lock knot, lavishing it with your tongue, and then");
	output(" making your way upward, kissing every inch you can along the way.");
	if (lorelei.cLength() > 24) output(" You get about halfway up before your neck starts to crane, with how massive she is: in order to go further, you pull yourself to your [pc.feet].");
	output(" When you get to her summit, you take a moment to yourself to take in its");
	if (lorelei.cLength() > 24) output(" grandiose");
	output(" form and wet your [pc.lips] before getting started");
	if (lorelei.cLength() > 24) output(" – you can hardly <i>wait</i> to know how a monster like <i>this</i> is going to feel in your throat");
	output(".");

	output("\n\nYou wet your lips, readying yourself");
	if (lorelei.cLength() > 24) output(" for the task you’re about to take – even with your modified throat, she’s just <i>so massive,</i> you can’t help but feel insecure");
	output(". You’ve kept her waiting long enough: you lean forward, and her [lorelei.cockNoun] cockhead slips into your mouth, giving Lorelei the first sensation of having her cock sucked.");
	output("\n\nShe hums in pleasure as you settle your lips just beneath the tip of her dick, giving her a suckle and letting her");
	if (lorelei.cLength() > 24) output(" copious");
	output(" pre splurt onto your [pc.tongue].");
	if (lorelei.cLength() < 12) output(" You keep her upright in your mouth while one hand goes to fondle her quivering, clenching sack, and the other goes to her outer thigh, your fingers sensually groping at her smooth skin.");
	else if (lorelei.cLength() < 24) output(" You keep her upright in your mouth while one hand goes to fondle her massive, bloated nuts, your fingers sinking into the crease between and underneath them, while your other goes to her shaft, masturbating what isn’t in your mouth <i>yet</i>.");
	else output(" She’s already a mouthful, filling your jaw to its limit, and you can already feel your throat convulse with excitement at the idea of getting it fucked by this beast. You use both your hands to masturbate its length and prepare it for the rest of you, when you get to it.");
	output("\n\n<i>“You’ve only just started,”</i> Lorelei says breathlessly, <i>“and I can already see the appeal of having your penis sucked. I,”</i> she winces, <i>“knew the p-power that came with being the one to give oral pleasure to your partner, but I... never saw the appeal from the other side until now.”</i>");
	if (lorelei.cLength() < 24) output("\n\nYou pull off for a moment to ask her, if she thinks being the one to give oral sex makes you powerful, then being the one to receive it makes you powerless. Then, before she answers, you dutifully go back to sucking, diving deeper onto her than you were before. <i>“Of course not,”</i> she says, indignant that you would suggest that she wasn’t in control. <i>“But there’s certainly more to the... power dynamic between the two of us than I imagined.”</i>");
	else output("\n\nYou say nothing, your mouth too full of cock and your mind too focused on your task. You take a deep breath, knowing that those will be a scarcity in the coming moments, and you take her deeper.");
	if (lorelei.cLength() < 12)
	{
		output("\n\nYou’re about halfway down, and you feel her [lorelei.cockHead] scrape gently across your soft pallet. You have a bit of ways left to go, but you’re confident you can take all of her.");
		if (lorelei.hasKnot()) output(" It’s her bloated " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot") + " that you’re worried about.");
	}
	else if (lorelei.cLength() < 24)
	{
		output("\n\nYou’re about a quarter of the way down, and you already feel her [lorelei.cockHead] pressing into your soft pallet. She has an awful lot of cock for you to suck,");
		if (flags["USED_SNAKEBYTE"] != undefined) output(" and you couldn’t be more ready for her.");
		else
		{
			output(" and you’re hesitant to think that you’re ready to take her every last inch, but, this is what you wanted.");
			if (lorelei.hasKnot()) output(" Her " + (flags["LORELEI_KNOTS"] == 2 ? "knots are" : "knot is") + " going to be a real challenge, though.");
		}
	}
	else output(" You can hear Lorelei gasp in surprise as you eagerly take more of her meat into your throat, sinking a quarter of the way down her gargantuan cock in one pass. She easily pierces into your throat, and you nearly stop, paralyzed with pleasure as she effortlessly fills out your throat and hits every erogenous spot on the way. <i>“My word,”</i> you hear her whisper.");
	output(" She fills your mouth with another hot shot of her pre, and you take that as an invitation to go deeper – to <i>really</i> start <i>sucking.</i>");

	output("\n\nYou wetly bob on Lorelei’s cock, feeling it");
	if (lorelei.cLength() < 12) output(" poke against your throat");
	else if (lorelei.cLength() < 24) output(" slide down your throat");
	else output(" fill out and fuck your throat");
	output(" with each downward suck, and you take in more with each new, bold bob down her shaft. Lorelei twitches under your skillful work on her body, and she can’t help but put a hand on your hand and clench her legs in pleasure, locking you to her body.");
	output("\n\nShe starts to hump her hips upward, shoving more of herself into your mouth,");
	if (lorelei.cLength() < 12) output(" especially when you inch closer and closer to her " + (lorelei.hasKnot() ? (flags["LORELEI_KNOTS"] == 2 ? "first knot" : "knot") : "base") + "; you can feel the tickle of her balls against your chin with every impish thrust into your wet, warm maw.");
	else if (lorelei.cLength() < 24) output(" shoving your tongue down to make room in your mouth for more meat" + (pc.hasKnot() ? ", and that’s to say nothing of the throbbing " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot") + " still making their way to your lips." : ".") + " Her massive nuts swing with every thrust against you, and you can sometimes feel the tickle of their heat radiate against your [pc.chest].");
	else output(" gladly taking advantage of your particular biology: if you’re taking such pleasure from having your throat so fully and totally impaled, she would gladly oblige. Every inch of herself introduced into your system is a new pleasure you didn’t know existed. Her balls are too big and dense to sway with the rutting of her hips, but you can hear their every full slosh, and you are <i>very</i> prepared to receive her.");
	output(" Lorelei is getting close, " + (lorelei.cLength() < 24 ? "and you’re ready for her." : "somewhat to your dismay – she has so much cock left for you to suck!"));
	if (lorelei.cLength() < 24) output("\n\nWith one hand, you keep fondling her balls, churning and massaging their load for your hungry throat, eager to taste her cream and feel her fill your belly, while your other can no longer deny your own " + pc.cockAndVagina("raging erection, your [pc.cock] standing on-end and hard as metal. You stroke at yourself, and you’re closer to your edge than you thought you were: with just a few strokes, you’re already about as close as Lorelei is.", "soaking wet cunt, your [pc.vagina] positively dripping with [pc.girlCum], ready to take this thick cock and really show Lorelei how a cock is properly treated. You fantasize how it would feel to climb onto her lap and sink her into yourself, and just like that, you’re as close to the verge as she is.", " Of course, not to be left out, you strain your fingers to reach your "));
	else output("\n\nNoticing how close she is only serves to remind you how close <i>you</i> are, but every part of you is too preoccupied to try and service yourself. Taking either of your hands off her shaft to pleasure yourself simply would not do. " + (pc.isBiped() ? "The best you can do is clench your [pc.thighs] together and grind them against your junk, and hope that that’s good enough. Assuming sucking Lorelei off doesn’t grant you a hands-free orgasm down the line, of course." : "You can’t even try and clench your lower body to try and give yourself some ancillary pleasure – your biology can’t let you. Your only hope is that sucking off this beast will give you a hands-free orgasm down the line."));
	output("\n\nLorelei’s head rolls on her shoulders, and her hand clenches and shivers on your scalp. <i>“I’m close, darling,”</i> she whispers through a shuddering exhale, barely able to keep herself composed through the act. <i>“" + (lorelei.cLength() < 24 ? "Just a little bit more. Give " + (isLoreleisBitch() ? "your mistress" : "me") + " what she needs. Just a little deeper, sweetie, you can do it." : "You’ve taken so much already. Try and take a little bit more for " + (isLoreleisBitch() ? "your mistress. She deserves it..." : "me. Just a little bit more, sweetie")) + ".”</i>");

	output("\n\nYou don’t have much choice in the matter: at her words, Lorelei thrusts deeper,");
	if (lorelei.cLength() > 24) output(" and you sink further along the girthy [lorelei.cockNoun] shaft, your mouth passing the halfway point – and you feel <i>something</i> in your gut. It’s not <i>painful,</i> per se, especially not with all the pleasure you’re feeling from having such a beautiful cock fucking your erogenous mouth so wonderfully, but it’s more like a... a signal, from yourself, to yourself. Her cock’s [lorelei.cockHead] has reached a threshold in your throat that so few cocks could ever possibly reach, and you understand that this... is probably your limit. You wish it weren’t – she still has maybe half a foot left to go, and her balls are audibly churning with cum, ready to fill you like a balloon – but you’re afraid that going deeper could cause some injury. This is as deep as you can go.");
	else if (lorelei.cLength() > 12)
	{
		if (lorelei.hasKnot())
		{
			output(" until the crook of her [lorelei.cockHead] dips into your throat, jetting its constant pre straight into your stomach. Your [pc.lips] kiss the round, thick bulb of her " + (flags["LORELEI_KNOTS"] == 2 ? "first knot" : "knot") + ", and Lorelei shakes with pleasure at the sensation of having you kiss her sensitive bulge – it’s love at first creamy shudder, and you resolve to open your mouth wider, so that she can firmly tie your slutty mouth to her. With a few more needy thrusts, Lorelei gladly takes your invitation, and, with one, slow, powerful push, she slips it in, locking your face to her cock, tying you to her.");
			if (flags["LORELEI_KNOTS"] == 2) output("\n\nBut that’s only half the challenge: Lorelei’s already shoved more than a foot of cock into your throat, <i>and</i> she’s tied your mouth to her, but you asked her for two knots, and by the Gods, you’re going to take the second one into your mouth. Animalistic, Lorelei starts fucking your mouth with the same earnest as before, but with decidedly less back-and-forth, with how utterly tied you are to her: she has the energy of a rutting stallion as she brutalizes both your [pc.lips] and your throat with her bulging cock, and, after some more time and what feels like a gallon of pre in your belly, she makes one final, determined thrust, pushing her second knot into you, double-locking your mouth to her cock for good.");
		}
		else output(", acquainting your every bud and every nook in your mouth with the smooth shaft of her [lorelei.cockShape] cock. You can feel her hot, full balls bounce against your [pc.chest], sweaty and musky with the effort and sexual strain, with every thrust against you; they churn with her building seed, damn near ready to launch forth and properly soak your throat and stomach, and, with one final, shuddering thrust that crunches your nose against her tight belly, her dick bloating and thickening in preparation, you couldn’t be more eager for it. Your only regret is that you won’t get to taste the first batch, with how deeply embedded she is into you.");
	}
	else
	{
		if (lorelei.hasKnot())
		{
			output(" and your [pc.lips] batter right up against her " + (flags["LORELEI_KNOTS"] == 2 ? "first knot" : "knot") + ". She shudders at the sensation, of the sensitive nerves in her knot getting some lip service, and you suck and swallow down a dollop of her pre – but it’s not enough yet. You struggle to yawn your mouth a bit wider, to <i>take</i> her, and Lorelei pumps into your eager mouth, battering your face with her knot – until, with one thick, hearty push, she inches her thick, bulbous knot into your mouth, tying you to her.");
			if (flags["LORELEI_KNOTS"] == 2) output("\n\nBut she doesn’t give you much time to rest and recuperate: the whole ordeal begins a second time, with her thrusting her [lorelei.cockShape] cock into your throat, firmly nestled and locked into your mouth already, wanting to shove the second one into your face. You struggle, your breath burning in your lungs, and your fingers coil tightly into fists, but you can take it: you stay still and open wider, and Lorelei, with a needy grunt, begins shoving the second one into you, inch by painstaking inch. As much as you love going down on her, it’s something of a relief to your tired jaw when she gets the second one in.");
		}
		else output(" your nose battering into her tight tummy and your chin getting slapped by her smooth balls with every swing in. You both grunt in pleasure as she takes advantage of your willing and open throat; Lorelei’s thrusts start to get sloppy, and her body starts to shake, and, with one needy thrust, she lodges her [lorelei.cockShape] cock as deep into you as she has to offer, your [pc.lips] firmly locked to her base.");
	}
	
	output("\n\nThat’s it: with Lorelei as deeply-lodged into you as she can be, her breath catches in her throat, her body becomes tense, and her");
	if (lorelei.cLength() > 24) output(" already-imperious");
	output(" girth bloats in your mouth, signalling the coming torrent of her cum.");
	if (lorelei.cLength() < 12)
	{
		output(" Her [lorelei.cockHead] scrapes at the entrance to your throat, but she’s just the perfect size to fill your mouth and give you the taste that you had been craving all this time without forcing it straight down your throat. Her first shot of jizz bashes against your throat, then washes backward, against your");
		if (lorelei.hasKnot()) output(" oppressed");
		output(" tongue, caking your buds in her flavor. You let it fill your mouth before swallowing and taking her second load");
		if (lorelei.hasKnot()) output(", and, thanks to her " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot") + ", not a single drop of her seed has the chance to slip past your watertight lips");
		output(".");
	}
	else if (lorelei.cLength() < 24)
	{
		output(" You can’t help but melt at the sensation, of having such a <i>powerful</i> tool in your mouth thicken with her seed before launching its load straight down your throat. Your only regret is that you can’t taste her musky, thick seed on your tongue");
		if (pc.hasKnot()) output(", especially with her " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot") + " preventing you from pulling back");
		output(", but it’s a pittance compared to the pleasure of having her tasty shaft so totally and completely in your mouth, pressing its skin against your every fiber inside it. Her massive nuts clench and unload with every wave; as soon as the first is done, they clench again, and you paralyze yourself in expectant pleasure, knowing that she always has <i>more</i> to deposit in your expanding gut.");
	}
	else
	{
		output(" You feel her [lorelei.cockShape] cock rhythmically undulate in your throat, massaging your erogenous zones and making your throat really, truly feel like a properly-fucked-and-appreciated cunt: with every ripple of her flesh in your mouth, an explosive load of her thick cream bloats your stomach, and you’re more than satisfied to sit there and gulp down load after prodigious load, listening to the orchestra of Lorelei’s moans and the constant gurgling of her enormous testicles. You aren’t sure when she’s going to run dry – hell, if ever – but you’ll take it, and you’ll gulp down as much as you can. Whatever you need to keep feeling like this.");
	}
	output("\n\n" + (lorelei.cLength() < 24 ? "The whole time, your hand has been furiously working over your " + pc.cockAndVagina("[pc.cock]", "[pc.vagina]", " and your ") + ", but, truth be told," : "You’ve been so focused on Lorelei’s monolith of a cock sawing into your throat and dumping its load that") + " you don’t notice when you finally cum: the usual sexual high that comes with an orgasm is totally overridden by the sheer satisfaction you feel by knowing that Lorelei is cumming in your throat. You eventually notice because " + (lorelei.cLength() < 24 ? "your hand becomes warm, wet, and sticky with yourself, a" : "of the growing, warm, wet, and sticky puddle of your juices beneath yourself, pooling" + (pc.cumQ() < 6000 ? "" : " at an alarming rate") + " onto Lorelei’s floor. A") + "nd even when you <i>do</i> notice, you don’t stop, already working yourself towards another one.");

	output("\n\nMinutes pass, with Lorelei pumping as much of her juice into you as she can");
	if (lorelei.cLength() < 12)
	{
		if (lorelei.hasKnot()) output(", and when she can pump no more, you remain blissfully tied to her regardless, waiting for her overexcited " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot") + " to deflate in your mouth and release you from her.");
		else output(", and even when she has none left to give, you remain exactly where you are, savoring her taste and her feel of being inside your mouth.");
	}
	else if (lorelei.cLength() < 24)
	{
		output(". You manage to contain all of herself inside you");
		if (lorelei.hasKnot()) output(" (not that you had much choice, being orally tied to her)");
		output(", bloating your stomach almost obscenely, making you look two month’s pregnant at least.");
	}
	else
	{
		output(", but despite your enthusiasm, you simply can’t take it all, and you’re forced to pull back, having it backwash against her cock and onto her stomach – which, when she’s finally done coming from her titantic balls, you take no small amount of pleasure cleaning her off.");
	}
	// no knot in hyper anyways {knot:. Eventually, her {one:knot deflates}{two:knots deflate}, releasing you from her, as she slowly shrinks and turns flaccid in your mouth}
	
	output("\n\nYou look up at Lorelei. Her hair is frazzled; her mouth is hanging agape; her eyes are crossed; and she’s panting like she had run a marathon. For a woman priding herself on her sex appeal, she could <i>not</i> look sexier to you right now – although, on the other hand, for a woman also priding herself on her control, she’s certainly looking a little... vulnerable.");
	output("\n\nShe must have realized how she looked then and there, because once her eyes focus on you enough to know what just happened, she clears her throat and sits up straight");
	if (lorelei.cLength() > 24) output(", slowly, still unused to the weight between her legs");
	output(". <i>“Well done,”</i> she congratulates, wiping the stray strands of hair from her eyes and rubbing the fritz out of them. <i>“I, uh... wouldn’t expect less from you, [pc.name]. I’ll be the first to admit, getting this little toy of yours has its merits. Bring me some wine, would you?”</i>");

	output("\n\nYou stand");
	if (lorelei.cLength() > 12) output(", wobbly adjusting yourself on your now-thick package still settling in your [pc.belly]");
	if (flags["LORELEI_SEX_COUNTER"] == undefined) output(", and make your way to the bar, retrieving Lorelei’s glass from before. You think to top it off before returning to her.");
	else output(", grabbing Lorelei’s wine glass from the nightstand, and make your way to the bar, filling it with the same wine as before, and then you return it to her, placing it right where you found it.");
	output("\n\nAs she drinks the wine, the girth between her legs dissolves before your eyes, reverting to the formless black mass it was before, and then disbands into wisps of black tendrils, arcing up her body and towards the back of her neck. When there is no matter left");
	if (lorelei.cLength() > 24) output(" some time later");
	output(", what’s left is her pussy, completely untouched, as if she never had a cock in the first place – and, you can’t help but notice, it’s wet and ready as ever....");
	output("\n\n<i>“But,”</i> she says, putting the wine glass back down, <i>“even as good as having such a flexible toy is, [pc.name], it still doesn’t satisfy <i>all</i> of me. I can go again, if you have the strength to match me.”</i> Her lips curl into that devious little smirk of hers from before. <i>“Or, if you" + (lorelei.cLength() < 12 ? "’re still up for it" : " still have the stomach for it") + ", I could craft another one, and we could start all over again....”</i>");
	output("\n\nLorelei sits on the bed, her legs splayed, already up for another round. Whatever you want with her is up for grabs. You just have to say the word.");
 
	// end scene (scene: Futa Worship); return to the Sex Select menu. Set the PC’s Lust to 30 and, if Big or Hyper, give them Bulky Belly
	pc.orgasm();
	pc.lust(30+pc.libido()/20);
	pc.loadInMouth(lorelei);
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");

	loreleiSexMenu();
}

public function loreleiHasAGoAtStealingYourVirginity(holeIdx:int):void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();
	processTime(20+rand(16));

	output("You lick your [pc.lips] as you take in the sight of Lorelei’s [lorelei.cockShape] cock.");
	if (lorelei.cLength() < 12) output(" The way it’s built just right, to comfortably fit out any hole it’s introduced to... your [pc.vagOrAss " + holeIdx + "] twitches in anticipation as you imagine how it would feel to be underneath her while her cock saws into you again and again.");
	else if (lorelei.cLength() < 24) output(" She’s got a nice, thick, juicy cock, guaranteed to really put your [pc.vagOrAss " + holeIdx + "] through its paces. You’re confident you can take her – all you need is to say as much, and she’ll oblige.");
	else output(" You’re sure a lot of people would shy away from the idea of taking a tree log like this inside themselves, but not you. You’ve prepared your [pc.vagOrAss " + holeIdx + "] just for this very opportunity. You can hardly wait to get started.");
	output(" You " + (pc.hasKnees() ? "sink to your knees" : "crouch down") + " and tell Lorelei exactly what it is you want: to feel her inside you.");
	output("\n\nLorelei watches your body language with some amusement: how you’re so willingly prostrating yourself before her, oh-so-ready to take her cock inside yourself and please you both. Her cock can’t help but twitch at the sight: it bloats with a dollop of her pre, " + (lorelei.cLength() < 24 ? "spurting just high enough to moisten her [lorelei.cockHead] and dribble down the underside of her shaft" : "fatly splashing onto herself and cascading down either side of her shaft. The off-white color of her pre glistens like a jewel against the onyx-black skin of her massive cock") + ". The scent of her musk wafts into you the farther down her pre drips, and you subconsciously lean into her, sniffing for more.");
	output("\n\n<i>“" + (lorelei.cLength() < 24 ? "Go ahead and get me ready, then, darling,”</i> she says, grabbing her dick by the base and waggling it in your direction. Flicks of her pre flit through the air; a bit of it lands on your cheek. <i>“Not that it should be too difficult." : "I must admit, I’m curious how you intend to take me.”</i> She grabs her immense cock by the base – her fingers not coming anywhere close to wrapping around the whole thing – and leans it towards you. You’re basked into the shadow of her cock, and the next drop of pre dangles over your head like a pendulum, before it snaps and lands right " + (pc.hasHair() ? "in your [pc.hair]" : "on your scalp") + ". <i>“Get me ready. Well,”</i> she giggles, <i>“readier.") + "”</i>");
	output("\n\nHer wish is your command: you " + (lorelei.cLength() < 24 ? "stand" : "shuffle forward") + ", your thirsty mouth wide open and closing the gap. Showing your eagerness (perhaps too much), you");
	if (lorelei.cLength() < 24) output("slip her cock between your [pc.lips], dipping down and letting it " + (lorelei.cLength() < 12 ? "nestle into your mouth" : "fill out every inch of your mouth") + ", so you can properly lube and bathe it.");
	else if (flags["USED_SNAKEBYTE"] == undefined) output("press your [pc.lips] against the tip; you can open your mouth wide enough to take the head in, but no more than that. A majority of her cock stands cold and unloved in the air between you two. But you won’t let that stop you from doing your duty.");
	else output("inhale her cock’s head, and then easily glide a quarter of the way down her shaft. Lorelei takes a deep, surprised, pleasured breath from the action, and, with your erogenous throat, you’re half-tempted to just stay where you are and let her fuck your face. But you both have other aspirations in mind.");

	output("\n\nLorelei sighs and leans back as you work yourself on her shaft,");
	if (lorelei.cLength() < 24) output(" dipping down to take more of herself into your mouth and lavishing everything you can fit into your maw with your tongue.");
	else if (flags["USED_SNAKEBYTE"] == undefined) output(" pulling off her head and licking and kissing all along the rest of her. It’s going to be long work, but it’ll be worth it.");
	else output(" easily shucking more cock into your throat than she ever imagined you’d be capable of.");
	output(" The goal is to get her as wet and ready for the real performance coming up, but you can’t help but get a little into it: despite having seen her cock form from nothing right before your eyes, it looks, feels, tastes, and smells just like the real thing, and from Lorelei’s every shivering reaction, it must feel pretty damn real for her, too.");
	output("\n\nYou slip your left hand between her legs, your fingers tickling along the inside of her thighs, creeping their way up to her crotch. Lorelei hums in approval and opens her legs wider, giving you more access, and you take the invitation,");
	if (lorelei.cLength() < 12) output(" fondling both of her heavy nuts in your hand and juggling them between your fingers, hefting them and caressing them.");
	else if (lorelei.cLength() < 24) output(" grasping and polishing one heavy nut in your hand, and then the other, hefting them with your palm and sloshing around the thick jizz inside them" + (silly ? ", where it’s obviously kept." : "."));
	else output(" gliding your hand along the massive surface of her right nut; you can hardly cover half the area of just one thick, heavy ball before you run out of arm length. You heft her heavy nut before sliding your palm across the crease to the other – each one would be heavy enough to crush a cantelope.");
	output(" Your efforts and attentions reward you with another");
	if (lorelei.cLength() > 24) output(" thick, heavy");
	output(" batch of pre for you to " + (lorelei.cLength() < 24 ? "suck down." : "taste and spread along the skin of her shaft."));

	output("\n\nLorelei takes a deep, shuddering breath through her nose, and her finger clench into her bedsheets. <i>“That’s enough,”</i> she commands, tapping you on the head. <i>“" + (lorelei.cLength() < 24 ? "Get any more frisky down there, and I might just change my mind about taking your ‘properly.’" : "That’s very impressive and all, but any longer, and you might just get stuck on me like that. As much as I’m sure you wouldn’t mind, we both have something else in mind.") + "”</i>");
	output("\n\nYou do as she says and pull yourself away from her shaft, a strand of your spit connecting your wayward tongue to her tip; she involuntarily flexes her cock, and the connection snaps. The sight reminds you how horny you are yourself: you were so busy that you hadn’t realized that " + pc.cockAndVagina("your own [pc.cock] was standing as rigid as could be, your own precum practically fountaining from your tip, eager to get some action yourself.", "your [pc.vagina] is so wet and ready that you can hear the distinct drip of your juices fall from you and onto her nice floor.", " On top of that, "));
	output("\n\n<i>“On the bed, face down,”</i> she instructs as she stands. You do as she says and take your spot next to where she was sitting, pressing your front onto the soft, plush quilt of her bed. <i>“Feel free to grab a pillow to bite into if you need");
	if (!isLoreleisBitch()) output(", darling");
	output(".”</i>");
	output("\n\nShowing her enthusiasm, especially after the fluffing you had just given her, Lorelei’s");
	if (lorelei.cLength() < 24)
	{
		output(" hands are already on you and your [pc.butt], groping at the meat she finds there. You can feel her [lorelei.cockShape] dick saw in between your cheeks, its heat radiating against your [pc.vagOrAss " + holeIdx + "]. A thick dollop of her pre lands squarely on");
		// {pc.tailBase}
		if (pc.hasTail()) output(" the base of your [pc.tails]");
		else output(" the small of your back");
		if (lorelei.hasKnot()) output(", especially when she leans far enough forward that her " + (flags["LORELEI_KNOTS"] == 2 ? "first knot" : "knot") + " bumps into the meat of your butt");
		output(", and she frots her body against you, testing your body, readying it for the proper fucking it’s about to receive.");
	}
	else output(" cock slaps heavily onto your spine, and she saws herself against you. You can feel her [lorelei.cockHead] reach far enough between your shoulderblades that, with a bit of stretching, her dick would be thrusting against your skull. On the one hand, you can’t help but feel like you might have bitten off more than you may be able to chew, but on the other – feeling the heat of her cock radiate against your [pc.skinFurScales] and the weight of it pressing you into her bed – you can’t help but clench your [pc.vagOrAss " + holeIdx + "] in giddy anticipation. You <i>know</i> you can take it.");
	output("\n\nLorelei plays with your body, and you can’t help but lean into her as she does so, yearning for more of her touch and to give her more to play with. She sighs in contentment at your body’s nearly-subconscious actions to give more of itself to her, and another thick drop of her pre " + (lorelei.cLength() < 24 ? "seeps down between you two, gliding into the valley of your [pc.ass] and making her hotdogging all the slicker and easier." : "washes down to your upper back, making her grinding all the wetter and messier."));
	output("\n\n<i>“It’d almost be a shame to fuck this body,”</i> she says through gritted teeth. Lorelei normally isn’t the type to be so vulgar; you must be having a serious effect on her. <i>“I almost don’t want to mold it around the shape of this cock you’ve given me.”</i> She pulls back");
	if (lorelei.cLength() > 24) output(" – quite a distance, until you can’t feel her hands on you anymore");
	output(", and realigns herself until you can feel the hot, beading [lorelei.cockHead] tip against your [pc.vagOrAss " + holeIdx + "]. You feel another warm " + (lorelei.cLength() < 24 ? "spurt" : "blast") + " of pre against your entrance, followed by some pressure as she pushes forward. <i>“Almost.”</i>");
	output("\n\nYou shiver and clench your hands (careful not to clench your lower body, of course) as she splits you apart and enters you, rewarding your diligence and patience, from finding and giving her the SynthSheath to preparing and soaking her properly, with giving you exactly what you wanted from the start: to be face down on her bed, hunched over");
	if (pc.isBiped()) output(", legs spread");
	output(", while she fucks you with her synthetic cock.");
	output("\n\nLorelei takes a deep breath through her nose at the sensation of having her head speared into you. You’re a tight, warm hole for her to make herself acquainted with, and she still isn’t used to the sensation of not only owning a cock, but using it to its truest potential. She’s slow and sensual: she knows how vulnerable you feel, having someone else inside you, and she gives you both a moment to adjust every time she pushes forward just a bit.");
	pc.holeChange(holeIdx, lorelei.biggestCockVolume());
	output("\n\nBut, she’s also horny. Every now and again, you’d feel her shiver, and she’d jump forward half an inch further and faster than she meant. But, once she’s that deep inside you, she sets that as the new minimum standard and pushes forward from there. She hasn’t <i>fucked</i> you so much as she’s <i>introduced</i> herself into you so far");
	if (lorelei.cLength() < 24) output(", and for that, you’re grateful");
	output(". It’s a new sensation for her, and she’s making sure to get it right.");

	output("\n\nInevitably, you feel");
	if (lorelei.cLength() > 24) output(" her hit some predefined limit inside you; " + (holeIdx < 0 ? "any deeper, and her cock might just pierce into your belly." : "another quarter-inch, and she’ll be battering up against your cervix."));
	else if (lorelei.hasKnot()) output(" he top of her " + (flags["LORELEI_KNOTS"] == 2 ? "first knot" : "knot") + " against you.");
	else output(" the heat of her pelvis against yours.");
	if (lorelei.cLength() < 24)
	{
		output(" She hisses through her teeth at the feel of being as deep into you as she is");
		if (pc.hasKnot()) output(", and the thought of it not even being her bottommost limit has her shaking with excitement");
		output(", and she can’t help but reach down to you and clap her hands on the hook of your [pc.hips], keeping you both steady against each other.");
	}
	else output(" She hums in contentment, once she finds this limit inside you, and you feel her hands explore your [pc.ass] once more, having sunk deeply enough into you that she can comfortably reach your body. With a flair of her hips, you feel her gargantuan meat shift and move both inside you and outside you – she must have half her cock still exposed to the air, give or take. You’re halfway tempted to tell her to fuck you deeper, to give you <i>all</i> of her, but even if you knew better, your body, including your mouth, is paralyzed with pleasure with the amount of cock inside you.");
	output("\n\nThere’s no more preamble and no more ‘conditioning’ to perform. With her hands on you, she fucks you, good and proper, her body thrusting back and forth against your [pc.vagOrAss " + holeIdx + "], her cock pressing tightly against the rim of your " + (holeIdx < 0 ? "asshole" : "pussy") + ". You can feel every vein and every flexing muscle in her cock, to go with the wet ‘plap plap’ sound of her battering your poor body with herself. Your eyes cross; you think that maybe you should try to reach for one of the pillows to bite into, like she suggested, but you don’t have the strength or the motor control to do much else but lie there, drool, and flex your body occasionally, whenever she hits a good spot inside you.");
	output("\n\n<i>“This,”</i> Lorelei says through the occasional exerted huff, <i>“was a good idea.”</i> She pauses and readjusts herself, giving herself more leverage to fuck you with, and then continues to rail you; she lifts your [pc.legs] into the air and bucks her hips into yours again and again,");
	if (lorelei.cLength() > 24) output(" sawing what she can stuff into your body in and out");
	else if (lorelei.hasKnot()) output(" threatening to lock your body to hers with her " + (flags["LORELEI_KNOTS"] == 2 ? "knots" : "knot"));
	else output(" slapping her body into yours wetly");
	output("; you can feel " + (lorelei.cLength() < 24 ? "her bloated, churning balls careen into your crotch with every thrust" + (pc.balls > 0 ? ", batting against yours in the upswing" : "") : "the weight of her massive testicles sway beneath Lorelei with her every thrust, shifting her momentum back and forth") + ", ready to burst and seed your [pc.vagOrAss " + holeIdx + "] with everything she has built up.");
	if (lorelei.cLength() > 24) output(" With as stuffed as you already are, you wonder just how full you’ll <i>really</i> be when she cums....");

	output("\n\nYou can feel your orgasm starting to build inside you, and you’re sure Lorelei’s is on the way, too. But before she takes you both over the edge, she stops entirely. <i>“Turn over,”</i> she commands. <i>“I want to see the look on your face when we cum together.”</i>");
	output("\n\nShe doesn’t withdraw, though, and leaves you to do all the work yourself. Arduously – part because you have a cock inside you, and part because the fucking has left you panting and a bit weak – you turn over, awkwardly trying to keep yourself from hitting Lorelei in the face as you move. It take you a bit more time and effort than you thought, but you manage it, without dislodging her fat cock in your [pc.vagOrAss " + holeIdx + "]; you lay on your back, at first staring at the ceiling to recollect yourself, but once Lorelei starts fucking you again, you remind yourself to look her in the eye.");
	output("\n\n<i>“Goodness,”</i> she huffs to herself, her body rolling and flexing and beating as she thrusts into you. With every push forward, her breasts swing and knock together with a muffled wet clap, and her sweat flings from her nose and from the tips of her hair in your direction. Her abs and her arms flex, trying to keep herself in position on top of you; and when your eyes draw lower, to the union of her [lorelei.cockShape] cock inside your [pc.vagOrAss " + holeIdx + "], she flexes that too, and you feel a warmth blossom inside you, her pre dispersing into your body just a bit more.");
	output("\n\n<i>“We should count ourselves very lucky, to be born when we were,”</i> Lorelei says to you, her hand reaching toward your [pc.ass] and hefting it upward to give herself better leverage. <i>“Humans like " + (InCollection(pc.race().slice(0, 5), "human", "half-") ? "ourselves" : "myself") + " don’t usually get,”</i> she huffs, <i>“the privilege of knowing what it’s like to... pitch</i> and <i>catch.”</i> She licks her lips and leans over you, thrusting more of herself into you");
	if (lorelei.hasKnot()) output("; the pressure of her knot against your body tightens, and with a more forceful thrust, she might just pop inside you");
	output(". <i>“There’s certainly something,”</i> she slurs, her spit collecting in the edges of her mouth, <i>“attractive about having a nice, thick, meaty cock like this one and bringing your partner to an eye-crossing orgasm, wouldn’t you think?”</i>");
	output("\n\nLorelei continues before you could answer – if you could anyway, with how helpless you are underneath her to do anything but moan. <i>“You don’t have to answer me with your words, darling,”</i> she says, standing back up. Her hips start to wildly buck into yours, her balls swinging freely between her splayed V-stance legs. <i>“I’ll ask your body. It can tell me in a purer form than language ever could.”</i>");
	output("\n\nYour abused [pc.vagOrAss " + holeIdx + "] struggles to keep up with Lorelei and her frantic fucking, and you’re only a few more thrusts from your orgasm. Your ");
	if (pc.hasCock())
	{
		output("[pc.cock] is standing at attention between you two, erect as could be, your own precum flinging back and forth with the metronome-like swaying of your meat as Lorelei pounds into you again and again");
		if (pc.hasVagina()) output(", while your");
	}
	if (pc.hasVagina())
	{
		if (holeIdx < 0) output(" [pc.vagina] squeezes at nothing, the sensation of an orgasm right on the tip of your [pc.clit], despite having so little stimulation itself");
		else output(" [pc.vagina " + holeIdx + "] clenches and moistens in excitement, slurping at Lorelei’s length, ready to chug every last drop of cum she has. A rogue thought almost wishes she wasn’t sterile");
	}
	output(". You’re as ready as you can be for her to cum, and if she doesn’t soon, you’re afraid you might beat her to it.");

	output("\n\nLuckily for you, she’s on the verge herself, and with a few more thrusts, s");
	if (lorelei.hasKnot())
	{
		output("he stops, forcing herself forward with one strong, final, <i>hungry</i> thrust: you feel your body yielding to hers as your [pc.vagOrAss " + holeIdx + "] is split apart by her insistent knot, inching itself into you. Lorelei grunts with exertion, and you find yourself simultaneously regretting wanting her to have a knot, and wanting nothing more than to be so totally, <i>completely</i> stretched out around her.");
		output("\n\nThe latter part of you gets its wish, and after another deliciously tense moment, she slides into you. S");
		if (flags["LORELEI_KNOTS"] == 2)
		{
			output("he sighs through her nose, and your hand goes to your [pc.belly] to feel her through your [pc.skinFurScales], trying to relax, knowing that she’s good and tied to you – but then she starts again. You forgot for a moment that she had two!");
			output("\n\n<i>“Unf,”</i> Lorelei grunts, biting into her lower lip as her humps start up again, as needy as before but only capable of moving a quarter-inch either way. <i>“I want this in you as badly as you do, I’m sure, darling.”</i>");
			output("\n\nTrue to her word, it isn’t long until you feel the same singular, heavy thrust as before, insistent, maybe even desperate, to get that second knot of hers into you. Getting her thick bulb into your body is a bit easier the second time, but the more immediately pressing concern you have is just how <i>full</i> it makes you feel, to have so much cock stuffed into your [pc.vagOrAss " + holeIdx + "].");
		output("\n\nYou don’t get to say whether she should stop, though: this is what you wanted when you told Lorelei that you wanted her to double up on the knots, and that’s exactly what you’re getting. Your body yields, and with a sudden thrust, Lorelei’s second knot slips into you, and s");
		}
	}
	if (lorelei.cLength() > 24) output(" he’s as deep into you as you can take her, and you can tell from the twitching from her body and especially along the length of her [lorelei.cockShape] cock, she’s as deep as she needs to be to be satisfied with you. S");
	output("he’s totally locked against you, close enough that " + (lorelei.cLength() < 24 ? "you can feel her heavy balls twitch and pull into herself, ready to seed their willing cumdump." : "you can feel the heat of her massive nuts against your [pc.butt], especially when they start to twitch and pull, preparing themselves for the gouts of cum they’re going to shoot deep into you."));

	output("\n\nLorelei’s breath catches in her throat, and her body stiffens. Her hands clench around your [pc.thighs], and you feel her meaty cock twitch inside you. <i>“Hope you’re ready,”</i> she whispers, the words barely escaping her before you feel it.");
	if (lorelei.cLength() < 12) output("\n\nA steady warmth blossoms inside you, filling out your [pc.vagOrAss " + holeIdx + "] wonderfully, seeping into every little muscle and contour within you. You can feel her hairless, heavy sack clench and pump rhythmically; each time they bunch up against the meat of your ass, you feel another thick spurt inside you, adding to the growing mess. Lorelei humps and shifts against you, trying to eke out as much pleasure as she can, to squeeze every tasty drop of her cum into you.");
	else if (lorelei.cLength() < 24) output("\n\nA burst of warmth spreads inside you, filling your [pc.vagOrAss " + holeIdx + "] near to capacity in just one thick load, and judging from the way her massive nuts continue to rack across the meat of your ass, before relaxing and starting again, she’s got more than enough to keep you nice and stuffed for some time. Her thick, massive meat keeps her cum lodged inside you, " + (lorelei.hasKnot() ? "to say nothing of how she’s knotted to you, ensuring that every last drop sinks into your body; your [pc.belly] bloats with her seed, and with nowhere to go, you’re feeling awfully, wonderfully tight around the waist." : "but there’s so much, and your body can only contain so much, that there’s some inevitable backsplash, spurting out around her thighs and as high as her own stomach. But she doesn’t mind a bit of mess, and she continues to frot against you the whole while, eking out as much pleasure as possible so she can sink every last drop she has into your body."));
	else output("\n\nIn a single pulse, your [pc.vagOrAss " + holeIdx + "] is filled to capacity: you feel your [pc.belly] stretch and round out, as full as it is with Lorelei’s cum, and that’s only the first load of many. Before your very eyes, your body transforms into some obscene balloon filled with Lorelei’s [lorelei.cockNoun] cum, and from the way her gargantuan nuts are audibly gurgling and physically straining to clench and pull against her body, she has more, oh so <i>much</i> more to give. Luckily, though, Lorelei, seeing how taut your body is from the first load alone, has the sense to pull out – and that means you’re taking the rest of her nut to your exposed body, covering you from your chin to your crotch in her warm, pearly seed. And those were only shots two and three....");
	output("\n\nThe sensation of Lorelei cumming inside you is more than enough to tumble you over your own edge, and your");
	if (pc.hasCock())
	{
		output(" [pc.cock], standing upright in the air between you, fountains your [pc.cum] straight up, raining it back down onto you");
		if (lorelei.cLength() > 24) output(" and adding it to the lake of jizz Lorelei’s pouring onto you");
		output(". You don’t have the sense to try and wrap your hand around yourself and give you a few pumps, and Lorelei herself is too distracted to do it for you, but it’s wholly unnecessary: your [pc.hips] lift off the bed with how powerful your orgasm is, and your cum arcs to high that it lands back onto your face");
		if (pc.cumQ() >= 3000) output(", and then well over your head and onto Lorelei’s nice sheets.");
		if (pc.hasVagina()) output("\n\nBut that’s peanuts compared to what’s going on below: your");
	}
	if (pc.hasVagina())
	{
		output(" [pc.vagina], " + (holeIdx < 0 ? "alone, empty, but nonetheless stimulated beyond the point of no return" : "as happily stuffed as it is") + ", can’t help but clench down " + (holeIdx < 0 ? "onto nothing, desperately milking a phantom cock while your [pc.asshole] gets all the glory" : "tightly on Lorelei’s meat, rippling along her cock from her [lorelei.knot] to her [lorelei.cockHead], milking out every last drop her overstuffed balls have in them") + ". Your ravenous pussy is never satisfied with the load Lorelei has to give you");
		if (holeIdx < 0) output(", even if it’s not getting any itself");
		output(": " + (lorelei.cLength() < 24 ? "even though she’s put batch after batch inside you" : "even after that limit-pushing load") + ", your horny, lust-drunk mind wants more of her cream");
		if (holeIdx >= 0) output(" in your pot");
		output(", and " + (lorelei.cLength() < 24 ? "you keep cumming around her, milking her for every last drop." : "even after she’s already pulled out, you keep cumming, milking a phantom cock for its last few drops."));
		if (holeIdx >= 0) output(" The rogue thought from before, about wanting her to not be sterile, keeps coming back to you, unbidden.");
	}

	output("\n\nThat’s your life for the next few moments: riding out several intense orgasms, bumping and grinding yourself against Lorelei");
	if (lorelei.cLength() > 24) output(", hugging her massive cock to yourself");
	output(", and getting things just a little messier with every sympathetic orgasm. You’re both panting, sweating, and out of energy; Lorelei stands still above you, her arms and legs shaking with the effort necessary to keep herself upright while she waits for herself to become soft.");
	if (lorelei.hasKnot()) output(" Understandably, with her as locked to you as she is, it takes some time.");
	output("\n\nEventually, once you both calm down, she manages to pull herself from you");
	if (lorelei.cLength() > 12) output(", unleashing a veritable gush of her cum from your tired-but-pampered [pc.vagOrAss " + holeIdx + "]");
	output(". You’re still looking up at the ceiling of her room");
	if (lorelei.cLength() > 24) output(", soaking her cum into your [pc.skinFurScales]");
	output(", when you feel her flop down next to you, shaking the bed and jostling the senses back to you.");
	output("\n\n<i>“Phew,”</i> Lorelei sighs, reclining on her hands, relaxing her body beside you. You turn your gaze to her, and, although her front is turned away from you, you watch the black tendrils from before seep up around her back, arcing in a criss-crossing pattern, and vanishing into a small nub she has implanted at the base of her neck. Some time");
	if (lorelei.cLength() > 24) output(" much");
	output(" later, the tendrils stop, and you know that Lorelei is back to her usual, cock-less self.");
	output("\n\nYour [pc.vagOrAss " + holeIdx + "] twitches. That’s a pity.");
	output("\n\n<i>“Mmm,”</i> she hums, stretching her arms above her head. <i>“Darling, gracious me, but let it be known that you certainly know how to share a good idea when you get one.”</i> She looks over her shoulder at you, her hair draping over her arm, and a warm, content, loving smile spreads across her lips. Her eyes are half-lidded, almost like she’s about to fall asleep with that smile on her face.");
	output("\n\n<i>“Mmm,”</i> she hums again, her hand rubbing sensuously at your [pc.belly] and down to your [pc.thighs]. <i>“Be a darling, would you, [pc.name], and get us some wine? No better way to recline after a good bout than to share the juice with your lover.”</i>");
	output("\n\nYou look to her incredulously. She had just fucked the daylights out of you, and now she wants <i>you</i> to get the wine?");
	output("\n\nLorelei brings her finger to her mouth and mischievously nibbles on it. <i>“I’ll admit, I’m being a bit selfish,”</i> she purrs, <i>“but I want to see you walk after that whole... exhibit. I’ve been where you are a few times before; I want to see it from my point of view for once.”</i>");

	output("\n\nIt takes you a moment, but you stand");
	if (lorelei.cLength() > 12) output(", wobbly adjusting yourself on your now-thick package still settling in your [pc.vagOrAss " + holeIdx + "]");
	if (flags["LORELEI_SEX_COUNTER"] == undefined) output(", and make your way to the bar, retrieving Lorelei’s glass from before. You think to top it off before returning to her.");
	else output(", grabbing Lorelei’s wine glass from the nightstand, and make your way to the bar, filling it with the same wine as before, and then you return it to her, placing it right where you found it.");
	output("\n\nAs she drinks the wine, you can’t help but admire her form: from her sweating, glistening, heaving breasts, to her delicious tummy, to her pussy, completely untouched, as if she never had a cock in the first place – and, you can’t help but notice, it’s wet and ready as ever....");
	output("\n\nLorelei notices your staring, and spreads her legs wider, giving you more to see. <i>“Hmm,”</i> she hums in delight, <i>“and if I’m not mistaken, [pc.name]... maybe it’s</i> not <i>too selfish of me to suggest that we have another round or two. After all, as good as that was, not</i> all <i>of me is satisfied yet.”</i> Her lips curl into that devious little smirk of hers from before. <i>“Or, if you" + (lorelei.cLength() < 12 ? "’re still up for it" : "still have the stomach for it") + ", I could craft another one, and we could start all over again....”</i>");
	output("\n\nLorelei sits on the bed, her legs splayed, already up for another round. Whatever you want with her is up for grabs. You just have to say the word.");

	// end scene (scene: Futa Fucked); return to the Sex Select menu. Set the PC’s Lust to 30 and, if they have a penis and/or Lorelei was hyper-sized, give them Cum Covered
	pc.orgasm();
	pc.lust(30+pc.libido()/20);
	if (holeIdx < 0) pc.loadInAss(lorelei);
	else pc.loadInCunt(lorelei, holeIdx);
	if (pc.hasCock() || lorelei.cLength() > 24) pc.applyCumSoaked();
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");

	loreleiSexMenu();
}

public function loreleisCockIsAFriendThatWantsHugs():void
{
	clearMenu();
	clearOutput();
	loreleiFutaHeader();
	processTime(20+rand(16));

	output("Even from where you’re standing, Lorelei’s enormous cock is long enough to poke you in the [pc.leg], and fat enough to intimidate you. It’s long enough to eclipse the light if you were to kneel beneath it, like a tree, and it’s wide enough that you could lay on it like a body pillow. It’s long enough to deserve your admiration; musky enough to hypnotize you; fat enough to earn your worship; and, from the gurgle of her beanbag-chair-sized balls resting against the floor, productive enough to inseminate you and everyone in a mile-wide radius. You want it. You need to feel it.");
	output("\n\nYou don’t even tell Lorelei what it is you want from her. She sits still, with that cocky, knowing little smile on her face, as you sink down, kneeling yourself beneath her obelisk of meat; the dim mood lights of the room disappear around you when you submit yourself to the shadow of her cock. It visibly pulses with her heartbeat, growing as thick as an extra quarter-inch before shrinking back down and starting again. You feel the heat of her sack against your whole body, and the fresh musk emanating from her base, where her cock meets her balls, draws you to it....");
	output("\n\nYou’re only half-aware of where you are or what you’re doing when your arms wrap themselves around Lorelei’s cock, holding it closer to you, and you rub your cheek against its underside. Your [pc.chest] rests gently against her balls; they occasionally clench and pull against you, pulling and drawing themselves against your body, when a light bead of her pre drips down from on high. Your [pc.tongue] snakes out and draws across her cock’s flesh, tasting her for the first time.");
	output("\n\n<i>“You certainly knew what you wanted when you asked me for this,”</i> Lorelei muses. Her own hand wraps around her massive cock, pulling on it to keep it upright and to give you more of her base to kiss. <i>“Confidence is always a sexy thing, [pc.name]. Even if it’s about something submissive, like wanting to worship a big, sexy cock like this one.”</i>");
	output("\n\nYou maintain your work, rubbing your face against Lorelei’s cock, imprinting its feel and its musk on you, kissing it all over and leaving little pockmarks all along its surface.");
	if (pc.hasCock()) output(" Your [pc.cock] stands erect and proud, frotting itself into the crease between Lorelei’s nuts, giving you a nice, warm " + (silly ? "nutjob." : "hotdogging."));
	output(" You try and kiss a different spot on her meat, and there’s <i>so much</i> of it, it’s not a difficult task to accomplish.");
	output("\n\nThat said, you subconsciously make your way down, licking your way towards her huge nuts. You lean towards her right one first, pressing your face deep into the cavern between Lorelei’s cock and her nuts; a single lick covers so little surface area, you’d spend all day giving her a tongue bath, if that’s what you wanted. Maybe Lorelei would let you? Maybe that’s something to keep in mind next time.");
	output("\n\nLorelei’s hand presses down on her shaft, angling it down overtop you; your already-dim lighting darkens further, and you feel the weight and the heat of her cock on top of your head. <i>“I want you to know that I get it,”</i> Lorelei says – the sound of her voice is somewhat muffled to you. <i>“When you’re horny and lust-drunk, and you see a nice, juicy, thick cock, and you just want to get down and suck on it for an hour or two. I get it. There’s something indescribable about the need.”</i> She giggles to herself before continuing. <i>“I’ve certainly had my fair share of big dicks, but this one certainly... towers above the rest.”</i>");
	output("\n\nSuddenly, Lorelei puts her hand behind your head and roughly pushes you into her sack, in the space between her heavy orbs, and she locks her legs behind your back, keeping you there. You’re submerged in her scrotum: all you smell is her musk, and all you hear is her heavy heartbeat – and the faint slosh of her cum jiggling inside those massive balls of hers.");
	output("\n\nYou both understand that it’s less about the tactile pleasure you can give Lorelei, in your position: it’s not about the licking, or the kissing, or the fondling, and it’s more about the submission and the submersion into her body, taking everything that she is onto your senses. You go somewhat limp in her grasp; you keep your arms spread, hugging her balls to you, but, for the moment, you just keep still, basking in the darkness of Lorelei’s body.");
	output("\n\n<i>“That’s it, darling, just take it in,”</i> you hear Lorelei say – or, you think; it’s difficult to hear anything other than her heartbeat with your ears as thoroughly plugged as they are. You sink into Lorelei’s body, giving yourself over to the sensation of being surrounded by spongy, musky, heavy ball-flesh. The steady beat of her heart is almost enough to lull you to sleep.");
	output("\n\nLorelei stands. It’s a slow, steady motion that you’re almost too mesmerized, face-deep in her sack, to notice. What jostles you out of your revere is the sensation of her smooth scrotum rubbing along your [pc.nipples] as she goes");
	if (pc.hasCock()) output(", and, once she’s at her full height, your [pc.cock] flops free from between her nuts, pointed forward toward the foot of her bed");
	output(". Your arms are still wrapped around her testicles, keeping them to you, and when she steps forward and to the side, you move with them, unresisting.");
	output("\n\n<i>“Time to stand, honey,”</i> she directs, tapping on your scalp for your attention. <i>“You can go right back to worshipping my big, sexy equipment in just a second.”</i>");
	output("\n\nWhether the direction reaches your consciousness or not, you stand, but you don’t stray far from her body: she has an enormous amount of cock for you to pleasure, after all, and it wouldn’t do to slack in your duties. When you’re on your [pc.feet], you resume what you had done in the beginning: rubbing your features along her length, going from her scrotum, to her base, and halfway up her shaft.");
	output("\n\nLorelei pivots you both, and you just go with it, drawn to the heat and the musk of her overwhelming tool. She pushes you forward, gently, and you suddenly find yourself tumbling backward, your knees caught by the edge of her bed. You flop onto the quilt, bouncing off her soft mattress – and her giant cock flops onto you, its head smacking against your cheek.");
	output("\n\n<i>“You may continue,”</i> Lorelei says, thrusting her hips against you sensually, grinding her enormous [lorelei.cockShape] cock against your entire body. It’s so warm beneath it: every little movement ignites something between you two, getting everything just a little hotter, and with that heat, comes a bit of sweat, and another heaping helping of her pre, and with both of those, come more of her intoxicating scent. Your left ear is against her shaft, and through it, you hear and you feel the steady ‘bump, bump’ of her heartbeat shake you to your core.");
	output("\n\nThis is what Lorelei wants, and you will oblige: you wrap your arms");
	if (pc.isBiped()) output(" and your [pc.legs]");
	output(" around her meat, keeping it hugged up against your body, and resume your sloppy, aimless kisses and licks, wherever you can fit your mouth against her. You’re little more than an accessory for her cock as it frots against you, and your whole purpose is to provide Lorelei with warm, wet, pleasurable hugs, touches, and kisses, to bring her closer to that orgasm.");
	if (pc.hasCock())
	{
		output("\n\nYour [pc.cock] is sandwiched between you two, pressed flat against your [pc.belly],");
		var cockRatio:Number = pc.biggestCockVolume() / lorelei.biggestCockVolume();
		if (cockRatio < .4) output(" little more than a pea next to the cucumber that is Lorelei and her equipment.");
		else if (cockRatio < .6) output(" dwarfed and overshadowed by Lorelei and her member.");
		else if (cockRatio < .8) output(" outmatched against Lorelei’s clearly superior schlong.");
		else output(" matching Lorelei in your ‘swordfight’ blow-for-blow.");
		output(" Her every push forward and back masturbates your length just as thoroughly as it does her own, bringing you as much pleasure as it is to her. You’re incentivized to work harder, to get Lorelei hornier; the more she frots you, the better it’ll feel.");
	}
	else if (pc.hasVagina()) output(" Your [pc.vagina] is utterly overwhelmed and overshadowed by Lorelei’s incredible package. Her heat radiates all the way down to your crotch, stimulating your [pc.clit] and your vulva, making you wetter and hornier; in between your work tending to Lorelei’s cock, you fantasize about having such a monster plough its way into you, fucking you and <i>ruining</i> you for any other cock in the universe. It would hurt, and you’d never be satisfied with a lesser example again – but, with a spittle of drool drawing down your chin, you can’t help but think that it might be absolutely worth it.");
	output("\n\n<i>“Mmm, this certainly was a fun idea of yours, [pc.name],”</i> Lorelei says. She pumps her hips against yours; sometimes, she pulls back too far, and her [lorelei.cockHead] baps you in the chin before she readjusts and resumes. You can feel her balls, now damp with your sweat and spit, thrust errantly against your [pc.legs], heavy and thick with her seed.");
	output("\n\nRarely, to go with one of her thrusts, you get a delicious drop of her pre, gushing from her head and seeping down to where her cock meets your face, spreading her musky lube all over your face, rubbing it into you like a lotion.");
	output("\n\n<i>“I’ll admit, the first thing on my to-do list when you gave me that sheath wasn’t to make myself so large, it’d make a Frostwyrm flush with lust,”</i> she continues. She leans forward and puts her hands on yours, directing them towards some erogenous spots; she has you massaging them in circles, and then her own hands to go her base, masturbating what little your entire body can’t. <i>“You’ve certainly got a creative side to you, darling.”</i>");
	output("\n\nAll told, your participation with Lorelei is fairly minimal: you keep yourself wrapped snugly against her [lorelei.cockShape] cock, dazed and lust-drunk, while she fucks your entire body, her shaft grinding everything from your crotch, to your [pc.belly], to your [pc.chest], and against your open [pc.lips] and scouring [pc.tongue]. Now and again, you hear the wet splurt of more of her pre being added to your messy mix, giving you another salty surge of flavor and reminding you where you are and why you’re doing it.");
	output("\n\n<i>“" + (pc.longestCockLength() < 36 ? "As good as this feels, darling, I can’t imagine trying to survive on a day-to-day basis with something like this between my legs" : "I can’t even begin to imagine how you survive with something so</i> demanding <i>" + (pc.hasLegs() ? "between your legs" : "beneath your stomach") + ", darling") + ",”</i> Lorelei says casually, as if she weren’t fucking your entire body with a cock that weighs as much as she does. <i>“Picture me with equipment like this, trying to do my usual sleuthing. Even if I could fit into the vents again, and even if they didn’t collapse under my weight, it’d disperse my musk all throughout the base. They’d smell me before I could get within spitting distance!”</i>");
	output("\n\nThe thought isn’t so unattractive, though, given that her hips pick up their speed and intensity. <i>“But then, hmm,”</i> she continues, her hands masturbating her base vigorously enough that you can feel her balls swing up and slap you in the [pc.ass], <i>“maybe that in itself is a strategy. Give up the underhanded tactics and take up seduction full-time. Enough of my musk in the vents, and everybody would fall over themselves to get a taste of the real thing.”</i> She hisses through clenched teeth, and another, larger dollop of pre oozes from her cock’s head, right onto your face for you to eagerly lap at and drink. <i>“Seems to work pretty well with you, after all. I bet you’d sell me the password to your bank account for some more.”</i>");
	output("\n\nDespite your addled mind being focused on something bigger and better, you catch a few of her words. Something about fucking your bank account out of you? Some part of you says that that would be a bad thing, but, well, you’re kind of focused on making sure this big, musky, delicious cock gets all the attention it needs. It’s been giving you more and more precum lately, especially now that Lorelei is done talking and she’s fucking your body faster and faster; she, and it, must be very close.");
	output("\n\nYou’re at a loss on how to make it a more pleasurable experience for Lorelei: you’re already being worn like an accessory. Your arms and " + (pc.hasLegs() ? "legs" : "[pc.legNoun]") + " are tight around her; your body is warm and wet from the collective sweat between you and Lorelei’s enormous cock; and you’re doing everything you can with your mouth to bring her more pleasure. Short of flipping over and getting fucked, there’s not a lot you can think to do.");
	output("\n\nLuckily, Lorelei doesn’t seem to mind: she’s already very close, and she’s perfectly content with mashing her huge dick up against you again and again until she jizzes. Her breathing is shallow and erratic; her thrusting is getting intense and aimless, a far cry from the casual rutting she had been doing up until moments ago; and her pre is coming out in jets rather than in the odd spurt. Her cock is getting thicker, harder, and hotter; it’s only a matter of seconds, now.");
	output("\n\nBriefly, you wonder what it would look like. You have a front-row seat to a cock larger than some people’s entire bodies, rutting intensely against you, ready to blow its gooey white seed all over the place. Will she cum like a geyser, spraying her load in one massive eruption that reaches as far as the wall behind you? Would it be like a firehose, in a single, long, steady stream? Would it be something softer, like a gentle river, without much power, but with no defined beginning or end? And, more importantly, what would be <i>your</i> roll in everything?");
	output("\n\nYou aren’t given much time to think about it, but, on the bright side, you get to find out first-hand: with just another few heavy thrusts of her hips, Lorelei tenses, her cock bloats, and all your questions are answered at once.");
	output("\n\nHer cock bloats, and you can feel the initial surge of liquid ambrosial cum shoot its way up her meat, rushing from her base and to her [lorelei.cockHead]. You experience it almost in slow motion: you feel the bloating and the surging, but it takes a moment longer than you think it should for the cum to jet from her cock. When it does, it audibly squirts from her dilating urethra, launching with some admirable force – enough to, as you had guessed, splatter against the back wall, coating everything between there and her in a thick, drippy line of semen. And that was only the first volley!");
	output("\n\nLorelei grunts and pumps her body against you erratically. Her cock feels so heavy on top of you, especially with all the cum inside it now; it’s like you’re resting underneath a big, sexy, meaty machine, designed to cum and fertilize every hole it can find. Everything underneath it, including you, is a white, sticky mess, and with every thrust, Lorelei adds more and more to it, submerging you in the growing lake that is her balls’ overactive output.");
	output("\n\n" + pc.cockAndVagina("You’re only mildly aware of your own [pc.cock] ejaculating alongside Lorelei, adding your sloppy [pc.cum] to the mess she’s putting out. You’re so distracted with the outright hypnotic way Lorelei’s cock is moving and pulsing and spraying, and you’re already so engrossed in the debauched pleasure of it all, that your own orgasm is a mild secondary thought compared to hers.", "Your [pc.vagina] clenches and squirts and cums and cums and <i>cums,</i> frustrated and overzealous at the idea of getting this paragon of masculinity inside it and seeding you and <i>breeding</i> you as properly as it should. You lift your [pc.hips] against Lorelei’s shaft, grinding it against her and smearing your [pc.girlCum] along its underside, marking it like it’s your territory, like it’s your <i>right</i> to be here, underneath it and pleasuring it while it sprays its jizz like a fucking fire hose. Maybe, next time, you should look into the possibility of taking it good and properly.", "\n\nYour other half is a different story, however. "));
	output("\n\nLorelei fucks herself against you for another few moments, enjoying your tight hug and all the pleasures that come with it. Throughout it all, you hadn’t stopped your kissing or licking – covered in the mess you are now, it’s safe to say that your job would never be complete if you were to keep going. Hell, a part of you doesn’t even mind; you could start again at those big, wonderful balls of hers, if she asked you to.");
	output("\n\nBut, with a contented sigh, Lorelei draws back, taking her cock with her, peeling it from your wet body with a single, long, wet <i>schlock</i>. When she withdraws completely, her cock’s head flops to the floor with a heavy, damp thud, and you’re left lying on her bed, covered from your head to your crotch in her cum. Still riding the sexual high of it all, you dip your finger into a particularly drippy load on your cheek, and you clean it, sucking your finger dry.");
	output("\n\n<i>“Hmm,”</i> Lorelei hums delightedly, taking a seat next to you. The bed sloshes with her cum still soaking into it. <i>“That certainly was an experience, [pc.name]. Like they say, it’s not the size that matters, and I’m glad you have the creativity to take that to heart.”</i>");
	output("\n\nYou look towards Lorelei and her naked body, facing away from you. Her tanned, unblemished skin is dirtied, in a word, by sudden black tendrils, coiling around her wide hips and up the crease of her back; over and between her shoulder blades, and disappearing into a little nub hidden just in the back of her neck, beneath her hair. You don’t have to see it to know that the object of your affections has disappeared, leaving Lorelei completely cockless – for now, anyway.");
	output("\n\n<i>“Mmm,”</i> she hums again, her arms stretching up and over her head. You hear her pop some of her joints, particularly in her elbows. <i>“Be a darling, would you, [pc.name], and get us some wine? No better way to recline after a good bout than to share the juice with your lover.”</i>");

	if (flags["LORELEI_SEX_COUNTER"] == undefined) output("\n\nIt takes you a moment to even register the command, but you stand, her cum dripping off you in long, white waterfalls, and you wobbly make your way to the bar, retrieving Lorelei’s glass from before. By the time you get there, you’re cognizant enough to think to top it off before returning to her.");
	else output("It takes you a moment to even register the command, but you stand, her cum dripping off you in long, white waterfalls. You shakily grab Lorelei’s wine glass from the nightstand, and make your way to the bar, filling it with the same wine as before, and then you return it to her, placing it right where you found it.");
	output("\n\nAs she drinks the wine, you can’t help but admire her form: from her sweating, glistening, heaving breasts, to her delicious tummy, to her pussy, completely untouched, as if she never had a cock in the first place – and, you can’t help but notice, it’s wet and ready as ever....");
	output("\n\nLorelei notices your staring, and spreads her legs wider, giving you more to see. <i>“Hmm,”</i> she hums in delight, <i>“you know, [pc.name], I consider myself to be an attentive lover. And I can’t help but notice that I might have gotten the longer end of the stick in our most recent tryst.”</i> Her lips curl into that devious little smirk of hers from before. <i>“As fun as it was, not</i> all <i>of me is satisfied just yet... but, if you’d like, just say the word, and I can craft up another one for you, and we can start all over again.”</i>");
	output("\n\nLorelei sits on the bed, her legs splayed, already up for another round. You could spend hours upon hours underneath Lorelei’s gargantuan cock, if you wanted. You just have to say the word.");
 
	// end scene (scene: Futa Bodyjob); return to the Sex Select menu. Set the PC’s Lust to 30 and add Cum Covered
	pc.orgasm();
	pc.lust(30+pc.libido()/20);
	pc.applyCumSoaked();
	IncrementFlag("LORELEI_SEXED");
	IncrementFlag("LORELEI_SEX_COUNTER");

	loreleiSexMenu();
}

public function loreleiHasHadEnoughBanging():void
{
	clearMenu();
	clearOutput();
	loreleiHeader(true);

	output("You’ll have to turn Lorelei down on that offer, as tempting as it is. There’s more to your mission here on Zheng Shi than just having sex with her endlessly.");
	output("\n\n<i>“Hmm, are you sure?”</i> she flirts, twisting her hand and crooking her fingers. But then, she laughs, and her dress begins to materialize around herself, starting at her neck and billowing down across her body, like a wavy black waterfall. <i>“I understand, darling. Our work is what makes us who we are.”</i>");
	output("\n\nThat said, Lorelei is awfully handsy with you as you set your affects back on. She insists that she’s ‘helping,’ not that you needed it.");
	output("\n\n<i>“Make me proud, darling. " + (isLoreleisBitch() ? "Let the world know that Minuet only takes the best of the best under her thrall" : "Show the world what it takes to be on Minuet’s good side") + ".”</i>");
	output("\n\nWith Lorelei’s blessing, you leave her quarters for the time being, and you step past her doorman back into the recreational deck of Zheng Shi.");

	flags["LORELEI_SEX_COUNTER"] = undefined;

	addButton(0, "Next", move, loreleiExit);
}